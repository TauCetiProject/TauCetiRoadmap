# Roadmap: Hodge–Tate theory, canonical subgroups, and automorphic period maps

**Summary.** Develop integral character differentials, Fargues degree, canonical subgroups and Hilbert period estimates; construct the open-tower `π_HT`, integral lattices and AIP torsors. Build log adic Kummer geometry and comparisons, then finite-level Hodge-type canonical Hodge–Tate flags and cyclotomic Levi torsors.

## Scope and ownership

Layers 0–2 develop the character differential, Fargues degree and co-Lie theory, abelian comparison, and the rational Hodge–Tate flag on the open Shimura limit v-sheaf. Layers 3–5 develop quantitative canonical subgroups, Hilbert period domains, integral lattices, Siegel modified bundles and the AIP torsor comparison. Layers 6–8 construct general log adic Kummer geometry and comparisons, then the finite-level canonical Hodge–Tate filtration and Levi torsor for Hodge-type data.

The downstream scope boundary is as follows. Perfectoid representability of Shimura towers, the perfectoid incarnation of `π_HT` and its extension to compactifications are PerfectoidShimuraVarieties S1–S3; the toroidal infinite-level Hodge–Tate morphism of Boxer–Pilloni Theorem 4.4.40 is PerfectoidShimuraVarieties S6. Coefficient sheaves of overconvergent forms, their comparison (BHW Theorem 7.14) and Hecke operators are OverconvergentAutomorphicForms O5–O6. Hasse invariants of BT₁ groups over arbitrary `𝔽_p`-schemes, Fargues's isomorphism LF and the BT₁ Hodge–Tate sequence belong to `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.2. The Verschiebung determinant of semi-abelian schemes on degeneration charts belongs to `ShimuraCompactifications` C4; Layer 0 names the Hasse section `Ha(G/S)` defined by that determinant, with its API, and proves the ordinary-locus and minimal-compactification statements. `PrismaticCohomologyPartIV` §8.60 supplies the fs log-adic carriers, logification, pullback, integral charts, Kummer maps, site and topology, finite-free local systems, inertia and the exterior higher-direct-image formula. Layer 6 extends these interfaces by the additional chart, sheaf, descent and torsion-stalk constructions below. `CohomologyComparisons` §6.1 constructs the logarithmic period sheaves of modular curves; the general constructions of Layers 6–7 specialize to it (7.15). Outside this roadmap are: Shimura data not of Hodge type in Layers 7–8 (their comparison uses special points, CM motives, Margulis superrigidity and the congruence subgroup property); Hilbert–Siegel models of GSp₄ over a totally real field in 0.17 and 5.5–5.7; the modified bundles at `p = 2`, whose boundary estimate the sources report without proof; abelian families over C that do not descend to a finite extension of `ℚ_p` (individual abelian varieties over C are treated); and integral tensor frames.

On smooth proper strict-normal-crossings pairs over finite p-adic fields, use `AutomorphicBundles` B3.log.1’s `horizontalLogSites` and descent API and B3.log.3’s period sheaves, `unipotentLogPeriodComparison_poincare` and de Rham unipotent tensor comparison. Layers 6–7 extend these constructions to the stated general fs spaces and general coefficients. On the common range identify the sites, period sheaves, filtrations, connections and comparison maps with the supplied constructions.

## Conventions

- Valuations are normalised by `v(p) = 1`. C is a complete algebraically closed nonarchimedean field over `ℚ_p` and `O_C` its valuation ring. Degrees of finite flat group schemes are Fargues degrees, sums of valuations of Fitting invariants, never lengths.
- The Hodge–Tate map of an abelian scheme is a quotient `T_pA^∨ ⊗ Ô → ω_A` with kernel `Lie(A^∨)(1)`; flags use the quotient convention (the BHW convention). For `g = 1` the quotient line is `ω`.
- Hilbert data use dual-abelian level structures `α: 𝒪_p² ≅ T_pA^∨`, the kernel coordinate `z = −HT(e₂)/HT(e₁)`, the left fractional-linear action `z ↦ (az + b)/(cz + d)` and `j = cz + d`. Tower translations retain the right action. The corresponding BHW left action is `γ⋅x := T_{γ^∨}(x)`, changing the frame by `α↦αγ^∨` and giving `z(γ⋅x)=(az+b)/(cz+d)`.
- Towers are indexed by compact open subgroups `K_p ⊂ G(ℚ_p)` at fixed tame level `K^p`. `G(ℚ_p)` acts on the right, `T_{gh} = T_h ∘ T_g`. Infinite-level objects are limits of diamonds in v-sheaves over `Spd(C, O_C)`, not perfectoid spaces.
- Hasse heights `w ∈ [0, 1]` are truncated valuations of Hasse invariants. The weak and strong canonical ranges and the BHW position ranges are kept distinct (below).
- Logarithmic structures are fine and saturated on étale sites of analytic adic spaces; Kummer and pro-Kummer sites follow Diao–Lan–Liu–Zhu (below).

### Conventions and quantitative ranges of Layers 0–5

Write `S_n=(p^n−1)/(p−1)`. The weak range is `S_nw<1/2`; the strong range is `p^nw<1/2`. HALO's `w≤p^{−(n+1)}` includes every prime, with strict weak inequality even at `p=2`. FAR11's HN range and the BHW position range are strict for `p≥3`: `w<1/(2p^{n−1})` for `p≥5`, `w<1/3^n` for `p=3`. The `p=2` position range is inclusive: `w≤1/(4·2^{n−1})`.

The dual canonical conormal comparison loses `δ=S_nw`; the raw character cokernel has degree `w/(p−1)`, giving scalar kernel precision `x=n−p^nw/(p−1)`. Hilbert integral balls use the integral closure of `O_p⊗O_C`; canonical generators use the unsplit `O_F/p^n` module (3.12). On a normal Hilbert chart use the actual invertible ideal `Hdg_T`, `Hdg_T^{p−1}=Hdg`, with integer powers defining `I_m` and `I′_m` (5.3).

Normalize multiplicative determinant pullback on the character `ℤ_p`-lattice before tensoring (0.12). Use full polarized one-motives at the boundary, alongside their finite Raynaud parts (0.13). Cartier-divisor pullback requires regularity; codimension-one detection requires integral normal noetherian bases. The trace codifferent and torsion conormal are distinct (0.20).

Relative comparisons use algebraizable families over finite p-adic fields; individual abelian varieties need no such descent. Constant and structural periods are distinct. Rational tensor frames and the central cyclotomic contracted product fix the Levi convention (1.1–2.13). For Siegel determinant modification at `p≥3`, use `D=g/(p−1)` and reductions `p^{n−D}` (5.6).

AIP group membership follows from the ratio of actual torsor lifts, through their open Hodge-bundle embedding. OverconvergentAutomorphicForms O5 owns the coefficient sheaves, finite-character integral generator with unit HT pullback, tower structure-sheaf invariants and AIPH Theorem 6.7(3) restriction comparison; O6 owns p-Hecke. Its coefficient comparisons require a common actual AIP coordinate, level, formal radius and analytic-character domain; the printed all-unit supremum and analytic-radius formula cannot define that domain. At `n=0` use `AL_1`.

### Conventions of the logarithmic layers

Log structures, logification, pullback and `O⁺`-charts on étale-sheafy analytic adic spaces are supplied by `PrismaticCohomologyPartIV` §8.60; 6.0 records their supplied universal-property and coherence API. Monoid-chart plus rings are integral closures of raw plus algebras; Kummer indices are invertible in `O`, without an `O⁺`-unit condition. Fine and fs are étale-local conditions; products are fs. Normal crossings is étale-local and permits self-intersections.

Continuous log differentials use complete Hausdorff targets and the explicit noetherian-type hypotheses. Pro-Kummer coverings satisfy the ordinal tower conditions at all topological points; log perfectoid presentations use all-integer-divisible chart limits. Keep presentations distinct from their completed affinoids. Layer 6 is independent of primitive and period comparisons.

In Riemann–Hilbert theory k is complete discretely valued p-adic with perfect residue field. K is perfectoid containing `k_∞`, except where a theorem requires completed algebraic closure; arithmetic invariants use `K=k̂_∞`. Structural periods require filtration completion after inverting t. Residues are normalized in `[0,1)`; tensor theorems require unipotent geometric boundary monodromy and pullback isomorphisms retain their multiplicity bounds. Every proper period-cohomology conclusion requires properness.

For canonical coefficients use `M=Ŵ_p⊗B_dR⁺` and `M⁰=(W_dR⊗OB⁺_dR,log)^{∇=0}`, each with `Fil^jL=t^jL`. The image `F_{−j}=image(M∩Fil^jM⁰→M/Fil¹M)` has kernel `Fil¹M∩Fil^jM⁰`. The second lattice does not use the Hodge-intersection filtration. For `M⁰=t^aM` the jump is a; the Tate line has jump `−1`. In homological Siegel convention `F₋₁=Lie(A)⊗Ô(1)`, `F₀=H₁(A,ℚ_p)⊗Ô`. The graded formula is `Gr_j(Ŵ_p⊗Ô)(j)≅Gr^jW_dR⊗Ô`, and `M_HT≅M_dR×^{µ,ℤ_p×}ℤ_p(1)`.

Hodge-type data have `Gᶜ=G`. Use full-group canonical coefficients, with V₀ realized by homology; arbitrary Levi representations have no such realization. Cut irreducibles out of individual tensor powers and extend by additivity (7.29).

## Exact supplier contracts

The declarations and roadmap layers below are the existing starting point, consumed as their suppliers state them.

### From Mathlib and Tau Ceti

Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These declarations supply only the interfaces described below; scheme and site constructions come from the roadmaps listed after them.

- `TauCeti.Bialgebra.AugmentationIdeal` (abbrev, `TauCeti/Algebra/AlgebraicGroup/Tangent/Cotangent.lean`): Augmentation ideal `ker ε` of a commutative bialgebra over a commutative ring.
- `TauCeti.Bialgebra.CotangentSpace` (abbrev, `TauCeti/Algebra/AlgebraicGroup/Tangent/Cotangent.lean`): `(ker ε)/(ker ε)²`, the affine group/monoid's conormal over any commutative ring.
- `TauCeti.Bialgebra.cotangentMap` (def, `TauCeti/Algebra/AlgebraicGroup/Tangent/Cotangent.lean`): R-linear `a↦[a−ε(a)]`; on group-like g, `[g−1]` is the pulled-back logarithmic differential.
- `TauCeti.Bialgebra.cotangentMap_mul` (lemma, `TauCeti/Algebra/AlgebraicGroup/Tangent/Cotangent.lean`): `cotangentMap(ab)=ε(a)cotangentMap(b)+ε(b)cotangentMap(a)`, hence additive on group-like elements.
- `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat` (abbrev, `TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean`): Finite flat finitely presented commutative affine groups over an affine base; the file also supplies `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality` (`FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality`).
- `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDualBaseChangeIso` (abbrev, `TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/BaseChange.lean`): Cartier duality commutes with ring base change.
- `TauCeti.Cocharacter.parabolic` (def, `TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean`): Dynamic parabolic on algebra-valued points; representability and geometric torsors need additional theory.
- `TauCeti.Cocharacter.levi` (def, `TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean`): Dynamic Levi on points; representability and group-scheme quotient morphisms need additional theory.
- `TauCeti.Huber.Pair` (structure, `TauCeti/RingTheory/Huber/Pair.lean`): Huber ring with its ring of integral elements `(A,A⁺)`.
- `Ideal.Cotangent` (def, `Mathlib/RingTheory/Ideal/Cotangent.lean`): `I/I²`, the affine augmentation-cotangent carrier.
- `KaehlerDifferential` (def, `Mathlib/RingTheory/Kaehler/Basic.lean`): Kähler differentials of a ring map.
- `IsGroupLikeElem` (structure, `Mathlib/RingTheory/Coalgebra/GroupLike.lean`): `ε(a)=1`, `Δ(a)=a⊗a`: characters of a Cartier dual.
- `Module.Grassmannian` (structure, `Mathlib/RingTheory/Grassmannian.lean`): Submodules with locally free rank-k quotient, with base change; the module-valued quotient flag.
- `Module.Invertible` (class, `Mathlib/RingTheory/PicardGroup.lean`): Invertible modules, equivalently affine line bundles.
- `Module.length` (def, `Mathlib/RingTheory/Length.lean`): Module length; distinct from Fargues degree.
- `LinearMap.det` (`irreducible_def`, `Mathlib/LinearAlgebra/Determinant.lean`): Endomorphism determinant for finite free modules; determinants between distinct bundles and of complexes require further theory.
- `Valuation` (structure, `Mathlib/RingTheory/Valuation/Basic.lean`): Multiplicative monoid-valued valuations; Fargues degree needs conversion to normalized real additive valuations.
- `ValuationSubring` (structure, `Mathlib/RingTheory/Valuation/ValuationSubring.lean`): Valuation subrings of fields.
- `PadicInt` (def, `Mathlib/NumberTheory/Padics/PadicIntegers.lean`): The p-adic integers `ℤ_p`.
- `PadicComplex` (abbrev, `Mathlib/NumberTheory/Padics/Complex.lean`): `ℂ_p`, completed algebraic closure of `ℚ_p`.
- `IsAdicComplete` (class, `Mathlib/RingTheory/AdicCompletion/Basic.lean`): I-adic completeness: Hausdorff and precomplete.
- `AlgebraicGeometry.Scheme` (structure, `Mathlib/AlgebraicGeometry/Scheme.lean`): Schemes.
- `AlgebraicGeometry.Scheme.Hom.normalization` (def, `Mathlib/AlgebraicGeometry/Normalization.lean`): Relative scheme normalization in a morphism's source; formal normalization is 3.11.
- `AlgebraicGeometry.Scheme.Modules` (def, `Mathlib/AlgebraicGeometry/Modules/Sheaf.lean`): Module sheaves on `X.ringCatSheaf`, the global conormal carrier.
- `AlgebraicGeometry.Scheme.Modules.pullback` (def, `Mathlib/AlgebraicGeometry/Modules/Sheaf.lean`): Module-sheaf pullback, used along the unit section.
- `SheafOfModules.Submodule` (structure, `Mathlib/Algebra/Category/ModuleCat/Sheaf/Submodule.lean`): Presheaf submodules with local membership, associated sheaves and monomorphic inclusion.
- `SheafOfModules.IsLocallyFree` (class, `Mathlib/Algebra/Category/ModuleCat/Sheaf/LocallyFree.lean`): Local generator maps are isomorphisms under the stated sheafification hypotheses; pointwise rank is insufficient.
- `CategoryTheory.Grp` (structure, `Mathlib/CategoryTheory/Monoidal/Grp.lean`): Geometric group objects in Cartesian monoidal categories.
- `GroupLike` (structure, `Mathlib/RingTheory/Coalgebra/GroupLike.lean`): Bundled group-like elements, a group for Hopf algebras; the affine character domain.
- `TauCeti.Huber.Pair.Hom` (structure, `TauCeti/RingTheory/Huber/Pair.lean`): Continuous ring maps respecting plus rings.
- `TauCeti.Huber.Pair.Hom.spaComap` (def, `TauCeti/AlgebraicGeometry/AdicSpace/Spa/HuberPair.lean`): Contravariant continuous Spa map; no logarithmic site is supplied.
- `CategoryTheory.GrothendieckTopology` (structure, `Mathlib/CategoryTheory/Sites/Grothendieck.lean`): Covering sieves with maximality, pullback and transitivity.
- `CategoryTheory.Sheaf` (abbrev, `Mathlib/CategoryTheory/Sites/Sheaf.lean`): The full category of presheaves satisfying a Grothendieck sheaf condition.
- `Derivation` (structure, `Mathlib/RingTheory/Derivation/Basic.lean`): R-linear Leibniz derivations `A→M`; continuity is additional analytic data.
- `AdicCompletion` (def, `Mathlib/RingTheory/AdicCompletion/Basic.lean`): `lim_n M/IⁿM`, with ring structure when M is the ring; distinct from Banach tensor completion.
- `BDeRhamPlus` (def, `Mathlib/RingTheory/Perfectoid/BDeRham.lean`): Witt-vector pretilt completion at `kerθ` after inverting p; field, principal-kernel and sheaf theorems are additional.
- `fontaineThetaInvertP` (def, `Mathlib/RingTheory/Perfectoid/BDeRham.lean`): Localized Fontaine map to `R[1/p]`, under prime, nonunit-p and p-completeness hypotheses.
- `CategoryTheory.IsCofiltered` (class, `Mathlib/CategoryTheory/Filtered/Basic.lean`): Nonempty categories with finite-diagram cones, as for inclusion-ordered compact open levels.
- `CategoryTheory.Functor` (structure, `Mathlib/CategoryTheory/Functor/Basic.lean`): Functors; the tower maps the level poset to adic spaces over `Spa(C,O_C)`.
- `MulAction.toPermHom` (def, `Mathlib/Algebra/Group/Action/End.lean`): Actions as permutation homomorphisms; a right action uses the opposite group.
- `CategoryTheory.Limits.limit` (def, `Mathlib/CategoryTheory/Limits/HasLimits.lean`): Categorical limit, used in v-sheaves for the infinite-level diamond.
- `CategoryTheory.Functor.Initial.limitIso` (def, `Mathlib/CategoryTheory/Limits/Final.lean`): For initial F, `lim(F⋙G)≅lim G`; cofinal level independence.

Tau Ceti at the same pin further supplies the following, which are used as they stand and are not restated here.

- Fitting ideals: `TauCeti.fittingIdeal`, `TauCeti.fittingIdeal_eq_minorsIdeal_ker` (`TauCeti/RingTheory/FittingIdeal/Basic.lean`), `TauCeti.fittingIdeal_baseChange` and `IsBaseChange.fittingIdeal_eq_map` (`TauCeti/RingTheory/FittingIdeal/BaseChange.lean`) for finite modules over an arbitrary commutative ring, and the scheme-level ideal sheaf `AlgebraicGeometry.Scheme.Modules.fittingIdeal` with its pullback formula `AlgebraicGeometry.Scheme.Modules.fittingIdeal_pullback` (`TauCeti/AlgebraicGeometry/Modules/FittingIdeal/`) for quasicoherent modules of finite type. The rank-one valuation specialization used for Fargues's degree (valuation of a principal Fitting ideal over a nondiscrete valuation ring) is not there and is 0.24.
- Relative differentials: `AlgebraicGeometry.Scheme.relativeDifferentials` with its universal derivation (`TauCeti/AlgebraicGeometry/Modules/Differentials/Basic.lean`); `ω_H` of 0.1 is its pullback along the unit section.
- Test groups and twists: the group scheme `μ_n` over any ring (`TauCeti.RootsOfUnityGroup.groupScheme`), the Hopf algebra of `α_p (TauCeti.AlphaP.CoordinateRing)` and `ℤ_p(1)` with its Galois action (`TauCeti.PadicTateTwist`); the Checks of 0.1, 0.2 and 0.11 and the Tate twists of 2.10 and 7.35 use these.
- Monogenic differents: `TauCeti.natCast_differentExponent_eq_addVal_aeval_derivative_minpoly` computes the different exponent of a monogenic extension of local fields as the valuation of f′(x); the monogenic case of 0.20 has the same shape over nondiscrete valuation rings, which this discretely valued statement does not cover.

Tau Ceti also provides `TauCeti.RestrictedProducts.CompactOpenSubgroups` in `TauCeti/Topology/Algebra/RestrictedProduct/Basic.lean`: a chosen family of compact open subgroups, with one subgroup in each factor. Layer 2 uses the poset of all compact open levels of one group and its intersection cones, built from the existing subgroup/topology notions.

### From TauCetiRoadmap roadmaps

- **ModularCurves**, layer 0B: finite flat group schemes and Cartier duality, carrying the finite Hodge–Tate map of 0.2; layer 0G: the shared relative Grassmannian of rank-N locally free quotients of an arbitrary finite locally free module, with affine charts, gluing, universal quotient and arbitrary base change. Its application to a finite group's Hopf algebra gives the ambient parameter space for subgroups. Section 2.7 uses this Grassmannian; the coherent extension and partial flags are `AlgebraicModuliForArithmeticGeometry` §1.3's.
- **ReductiveGroups**, Layer 1: representations, comodules and Tannakian reconstruction (2.11, 2.14); Layer 3: closed subgroups and the fppf quotient G/H, whose representability is a theorem under stated hypotheses (2.14 constructs the opposite-type descent adapter using the parabolic representability of Layers 7–8); Layer 7: parabolic subgroups and Levi decompositions, with the dynamic approach to parabolics kept as a parallel route (2.9, 2.14). The dynamic parabolic and Levi subgroups of a cocharacter, on points, are the pinned `TauCeti.Cocharacter.parabolic` and `TauCeti.Cocharacter.levi`.
- **AdicSpaces**: Huber pairs and adic spaces, with the pinned `TauCeti.Huber.Pair`.

### From other roadmaps

Each item is consumed as the supplier states it; where a statement here needs more, the additional mathematics is a target of this roadmap, cited in parentheses.

- **Finite flat points and Galois models.** Use `FiniteFlatGroupsAndIntegralPadicHodgeTheory` [R07.1.24a, Points and finite flat models of Galois modules](../FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md#r07124a-points-and-finite-flat-models-of-galois-modules): `FiniteFlat.points H L` is the supplied additive point group of `H : FLF R` over a commutative R-algebra L, with functoriality, scalar extension and agreement with scheme-valued points. For a scalar tower `R→K→L`, its `L ≃ₐ[K] L` action is postcomposition. For a DVR R with characteristic-zero fraction field K, a chosen separable closure L and a finite discrete continuous Galois module M, use the supplied `GaloisModel R L M`, retaining both the integral group H and its equivariant additive points identification with M; coefficient actions use the supplier's coefficient-linear version. Sections 0.2–0.4 and the generic point groups of 3.7–3.12 use this interface. Over general `O_C` use `FiniteFlat.points`; the DVR model interface does not restrict those targets. The use of an integral model with an equivariant points identification follows the Imperial College London FLT project.
- **`FiniteFlatGroupsAndIntegralPadicHodgeTheory`.** R07.1: p-divisible groups, their Tate modules and Cartier duals, the finite part of a quasi-finite group, the Oort–Tate classification; R07.1.1 (relative Frobenius and Verschiebung of commutative group schemes, `V_G = (F_{G^D})^D` for finite locally free G); R07.1.5 (levels of a p-divisible group); R07.1.10–R07.1.11 (truncated Barsotti–Tate groups and Illusie's co-Lie criterion over bases where p is nilpotent); R07.1.11 and R07.6.6 (the co-Lie complex and its derived dual for all flat, finitely presented commutative groups); R07.1.20a (quotients of p-divisible groups by finite flat subgroups over complete DVRs of mixed characteristic `(0,p)`); R07.1.14–R07.1.15 (dimension, and `dim G + dim G^D =` height over complete noetherian local rings); R07.1.40 (Raynaud's embedding of a finite locally free group into an abelian scheme, Zariski locally on any base). R07.2: BT₁ Hasse invariants and the Hasse–Witt duality, with R07.2.21's Frobenius-twist identity `det(ω^{(p)}) = (det ω)^{⊗p}` for a BT₁ over an `𝔽_p`-scheme. R07.6.6: Illusie's obstruction theory for lifting homomorphisms of flat commutative group schemes along square-zero thickenings. Conormal modules of p-divisible groups over `O_C (0.25)`, the degree of finitely presented torsion modules over rank-one valuation rings (0.24), finite-flat co-Lie perfectness, determinants and the abelian-isogeny Hodge triangle (0.26), the normalized multiplicative determinant pullback (0.12), general-base quotients by finite flat subgroups of the p-torsion and their truncated levels (0.28), Faltings's integral Hodge–Tate complex (0.5), Fargues's degree, the pointwise HN canonical subgroups and integral Hodge–Tate estimates are this roadmap's; the cyclotomic-base abelian-family weak/strong subgroup package is supplied by `CohomologyComparisons` §6.2.
- **`AbelianSchemesAndArithmeticModuli`.** A2: polarizations and the Poincaré bundle; A3 and A3.5: dual isogenies with Cartier-dual kernels and the Weil pairings `e_n`: `A[n] × A^∨[n] → μ_n`; A3.7: their polarized forms; A4, A4.2–A4.3: the p-divisible group of an abelian scheme, `H¹_dR(A/S)` with its Hodge filtration `0 → ω_A → H¹_dR(A/S) → Lie(A^∨) → 0`, `Lie(A^∨) = R¹π_*O_A`, and Poincaré duality, over an arbitrary base. The Verschiebung of an abelian scheme is 0.27.
- **`NeronModelsAndSemistableAbelianVarieties`.** Layer 3: semistable reduction after a finite extension, and rigid uniformization with the Raynaud extension and its dual polarized one-motive over a complete discrete valuation ring (0.18).
- **`ShimuraCompactifications`.** C2: toroidal compactifications, smooth with normal-crossings boundary at neat level for smooth fans, algebraized for projective fans, with canonical models over the reflex field; C3 (refinement map): refinement maps of toroidal charts; C4 (polarized degeneration data): polarized relative degeneration data `[Y → G̃]` over complete normal noetherian bases; C4 (semiabelian hasse boundary comparison): the Verschiebung of a semi-abelian scheme and its determinant on the Hodge line; C4 (constructible character sheaf, extended isogeny kernel, semi-abelian Tate module, homomorphism extension); C5 (integral toroidal space, integral minimal space, higher level toroidal normalization): the toroidal and minimal Siegel compactifications at prime-to-p level and the normalized toroidal model at higher p-power level, under their good-prime hypotheses; C5 (minimal Hodge ampleness); C6: the Hilbert near-ordinary model and the Hilbert Hasse ideal at the boundary. The pushforward of the structure sheaf modulo `p^k` to the full-level Siegel minimal model is 5.13.
- **`HilbertModularVarietiesAndShimuraCurves`.** H2: the Hilbert Hasse ideal and the Hasse formal domains; H4: hybrid, geometric and arithmetic full level structures, `Γ₀(p^n)-level` structures and their forgetful maps. The `𝒪_F`-module structure of Hilbert canonical subgroups is 3.12.
- **`PELModuli`.** M0: integral PEL data, the determinant condition and symplectic 𝒪-lattices; M1: level structures.
- **`ShimuraData`.** §§3.7–3.9: the Hodge parabolic `P(µ⁻¹)` and its descended compact dual. The opposite-type reflex-field adapter for `P(µ)` is 2.14; the two equivariant flag varieties are not silently identified.
- **`ShimuraVarieties`.** Layer 1: analytic points and right translations; Layer 8: level towers, finite level maps, translation laws, minimal descent and the abelian instance.
- **`AutomorphicBundles`.** B3.HT.1: the Siegel application of the shared canonical subgroup to the universal polarized family on its Hasse regions, with compatibility under level pullback. B0: the Hodge parabolic convention and the central split quotient; B1: Hodge tensor realizations, the absolute-Hodge propagation of Hodge tensors (Deligne, Blasius), the tensor frame torsor and the filtration reduction of the de Rham frame torsor to graded frames; B2 and B2.general: automorphic vector bundles of representations of the centralizer, the étale coefficient local systems and their tensor and Hecke compatibilities; B3.7 and B3.general: Deligne's canonical logarithmic extension with nilpotent residues (zero exponents) of a full-group coefficient with unipotent monodromy, its identification with the automorphic canonical extension, and their boundary functoriality.
- **`AlgebraicModuliForArithmeticGeometry`.** §1.3: the extension of ModularCurves §0G's Grassmannian to quasi-coherent finite-type modules, and partial flag bundles, with representability, universal quotients and arbitrary base change.
- **`PadicHodgeTheory`.** §§0.2–0.3: `B_dR⁺` and Fontaine's element t; §8.3: Hodge–Tate weights of abelian varieties; §§2.1–2.4: the period sheaves `B_dR⁺`, `OB_dR⁺` and their gradings, acyclicity on affinoid perfectoids, the power-series description, the formal Poincaré lemma and the Faltings extension; §§2.7, 7.1–7.3: the primitive comparison theorem for proper smooth rigid spaces over C (with its pro-étale and rational forms), the geometric Hodge–Tate direct images `R^jν_*Ô = Ω^j(−j)` over an arbitrary C, de Rham lisse sheaves, the relative Hodge–Tate filtration, and the relative de Rham comparison for de Rham pairs over finite extensions of `ℚ_p`. The degree-one Hodge–Tate sequence over an arbitrary C and the relative character compatibility are 1.4–1.5.
- **`CohomologyComparisons`.** §0.4: twist, Frobenius and filtration normalizations; `CohomologyComparisons` §2.15: Hodge–Tate degeneration; §6.1: the logarithmic period sheaves of modular curves, to which Layers 6–7 specialize (7.15). §6.2: `smallHasseCanonicalSubgroups`, the shared cyclotomic-base abelian-family weak/strong canonical subgroups in arbitrary dimension, Frobenius-congruent uniqueness, point inclusion (equality over integrally closed test algebras), flat base change, functoriality, isotropy and strong quotient identities. Sections 3.4 and 3.6–3.8 use this package with the same subgroup and bounds; 3.6 identifies the additional pointwise HN construction on the overlap.
- **`CrystallineCohomology`.** CR.5 and CR.5:log-algebra: the monoid theory (prelog rings, saturated, characteristic and Kummer monoid maps, integral fibre products), log charts and divisorial log structures on schemes, the log-smoothness chart criterion, log differentials and log de Rham complexes, used through their monoid-level and scheme-level statements.
- **AutomorphicBundles B3.log.1–B3.log.3 and B3.HT.7.** Use `horizontalLogSites` and its basis/descent API on smooth proper strict-normal-crossings pairs over finite p-adic fields. Use B3.log.3’s constant and structural periods, connections, `unipotentLogPeriodComparison_poincare` and de Rham unipotent tensor comparison on that range; §§6.23, 7.8–7.11, 7.13, 7.24 and 7.26 identify the general extensions with them. Import `canonicalKummerCoefficient`, `unipotentLogPeriodComparison_associated`, `unipotentLogPeriodComparison_graded` and `unipotentLogPeriodComparison_tensor` for the Hodge-type canonical association. Import `rationalHTLeviTorsor` and its associated-bundle, tensor, action and boundary API for the rational tower comparison. Layers 2 and 7 prove agreement of the open and finite-level two-lattice constructions with these comparisons, with the Hodge/opposite cocharacter and Tate-sign dictionary. Layer 7 also constructs the general coefficient and residue-normalization theory.
- **`PrismaticCohomologyPartIV` §8.60.** Log-adic carriers, logification, pullback and charts on étale-sheafy spaces; `NoetherianFsLogAdicSpace.kummerSite`, `.kummerTopology`, `.LocalSystem`, `.trivialLogSite` and `.inertiaExterior` on locally noetherian fs spaces, including log inertia and the cup-compatible exterior formula for positive invertible torsion indices. Section 6.0 imports this API; 6.12, 6.15 and 6.17 add the specified chart, sheaf and descent API; torsion stalks beyond the finite-free convention are included here.
- **`AdicSpacesPartII`.** R0: locally noetherian adic spaces, noetherian-type Huber rings, fibre products, finite, smooth and étale morphisms, continuous differentials, completed tensor products and uniformization; R1: analytification, with the dimension theory of affinoid domains (§R1.9).
- **AdicSpacesPartIII.** F0 and R2: formal schemes, admissible formal models, generic fibres, admissible blow-ups and Hasse domains (§R2.10); R3: coherent sheaves, Tate–Kiehl, Kiehl's proper mapping theorem and continuous differentials (§§R3.1–R3.7). Normalizations of formal models and their analytic integral structure (3.11), étale descent of finite coherent modules (6.1) and normal extension across a boundary (6.18) are constructed here.
- **AdicSpacesPartIV.** §R4.7: smooth pairs and their analytifications. The general normal-crossings charts of 6.5 also allow étale-local branches over finite separable field extensions.
- **`AdicEtaleGeometry`.** A1: the étale and corrected pro-étale sites of analytic adic spaces, the étale structure sheaf, pro-étale morphisms and the projection `ν`; A4: perfectoid uniform completion; §§A1.6–A1.6a: reduction of étale covers to rational and finite étale covers, and vector bundles on a stable étale basis.
- **`PerfectoidSpaces`.** P0: almost mathematics (almost Čech acyclicity, almost faithfully flat descent, almost finitely generated modules); P1: perfectoid Tate rings; P3: almost purity, étale almost acyclicity and the étale site tilting equivalence; P5: cofiltered limits of affinoid perfectoid spaces.
- **`DiamondsAndVStacks`.** D0: Čech-to-derived comparison, cohomology of filtered colimits on coherent sites, stackification; D1, D3–D6: pro-étale maps, quasi-pro-étale morphisms, underlying spaces, spatial diamonds and limits, the diamond functor and the étale site comparison; D2.9: v-descent of vector bundles on perfectoid spaces and the identification of completed pro-étale bundles on a rigid space with v-bundles.
- **`DiamondEtaleCohomology`.** C5: proper base change for the étale cohomology of diamonds; C7: local systems.
- **`ClassicalAdicEtaleCohomology`.** §§1.1–1.4, 8.2 and 11.1–11.2: étale and pro-étale cohomology of locally noetherian analytic adic spaces with the comparison `H^i(X_ét, F) ≅` `H^i(X_proét`, `ν^*F`), the Cartan–Leray spectral sequence for pro-finite-étale torsors, étale acyclicity of finite projective modules, torsion local systems and finite étale covers, Tate twists, Huber's comparison of algebraic and analytic étale cohomology with the normal-crossings purity computation, the derived limit of lisse towers (§1.3), and the étale cohomological dimension bound (§11.2); the comparison and purity statements are its §8.2 and §11.1. Its non-noetherian perfectoid, Kummer and finite-module versions are 6.28, 6.25 and 6.1.
- **`EnhancedDerivedSheaves`.** E1: the derived pullback–pushforward adjunction and derived tensor products on ringed topoi; E2: derived limits on replete topoi. The projection formula for locally free coefficients and derived limits over an acyclic basis are 6.37 and 6.31.
- **DerivedModuleAlgebra.** §§0.4, 0.6–0.8, 0.10 and 0.13: the full cotangent complex, its universal property, naive truncation, transitivity, derived base change and regular-quotient two-term models, used by `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1.11 and R07.6.6 for its co-Lie and Lie complexes and by 0.26 for their additional finite-flat API; §§0.5 and 0.25: square-zero extensions and their lifting obstructions.

## Internal build order

Build §§0.21–0.28's prerequisites before their named consumers. The complete Layer 0 dependency inventory is the following ordered list of batches; entries in one batch are independent once the earlier batches are available:

| Batch | Sections |
| --- | --- |
| 1 | 0.1, 0.24 |
| 2 | 0.21, 0.22, 0.26, 0.27 |
| 3 | 0.2, 0.6, 0.25 |
| 4 | 0.3, 0.7, 0.11, 0.20, 0.23, 0.28 |
| 5 | 0.4, 0.8, 0.9, 0.12, 0.13 |
| 6 | 0.5, 0.10, 0.14, 0.17, 0.18, 0.19 |
| 7 | 0.15 |
| 8 | 0.16 |

Within Layer 2 build 2.14, then 2.11, before 2.8–2.10. Within Layer 3 build 3.11 before 3.1 and 3.12 before 3.10. Within Layer 4 build 4.8, then 4.7, then 4.6. Within Layer 5 build 5.13 before 5.6 and 5.9 before 5.4: construct 5.3's lattice and local API first, and prove its independence clause only after 5.9. Within Layer 6 build 6.6–6.7 before 6.5. Numbering groups the mathematics; these dependencies determine construction order.

## Suggested signatures

README.md specifies the mathematics; Suggested.lean states `HodgeTate.farguesHodgeTateCokernel_finite`, the finite flat conclusion of Fargues's uniform cokernel bound in [0.5](#section-0-5). Its definition `HodgeTate.characterDifferentialSpan` expresses the image of the linearized character differential on the pinned augmentation cotangent space. The module docstring identifies the missing objects needed to state the p-divisible, canonical-subgroup, period-map and logarithmic comparison headlines.

## Layer 0: p-divisible groups and integral differentials

<a id="section-0-1"></a>

### 0.1 The conormal module `ω_H` of a finite locally free group scheme

For finite locally free commutative H/S, develop the following conormal API; p-divisible conormals are 0.25.

- `TauCeti.HodgeTate.conormal`: `ω_H := e*Ω¹_{H/S}`, over Spec R the augmentation cotangent space `I/I²` of the Hopf algebra of H.
- `TauCeti.HodgeTate.conormal_eq_cotangentSpace`: Over Spec R, `ω_H` is `TauCeti.Bialgebra.CotangentSpace` R A for `H = Spec A` (definitional for the affine carrier).
- `TauCeti.HodgeTate.conormal_map`: A homomorphism f: `H → H′` induces f*: `ω_{H′} → ω_H`, with `(id)* = id` and `(g∘f)* = f*∘g*`.
- `TauCeti.HodgeTate.conormal_baseChange`: For a base change `S′→S`, the canonical pullback map `ω_H⊗O_{S′}→ω_{H_{S′}}` is an isomorphism.
- `TauCeti.HodgeTate.conormal_rightExact`: For an fppf-exact sequence `0→H′→H→H″→0` of finite locally free commutative groups, `ω_{H″}→ω_H→ω_{H′}→0` is right exact; injectivity on the left is not asserted.
- `TauCeti.HodgeTate.conormal_finitePresentation`: `ω_H` is a finitely presented R-module, killed by the order |H| when |H| is a non-zero-divisor.
- `TauCeti.HodgeTate.conormal_eq_zero_iff_etale`: `ω_H = 0` if and only if H is étale over S.

**Checks.**

- `TauCeti.HodgeTate.conormal_constant_eq_zero`: For the constant group `(ℤ/p^n)_R` over any ring R, `ω = 0`.
- `TauCeti.HodgeTate.conormal_mu`: For `μ_{p^n} = Spec R[t]/(t^{p^n} − 1)`, `ω ≅ R/p^n R`, generated by the class of `t − 1`.
- `TauCeti.HodgeTate.conormal_alphaP`: For `α_p = Spec 𝔽_p[t]/(t^p)` over `𝔽_p`, `ω` is one-dimensional although `α_p` has order p and is not étale; `ω_{α_p} ≠ 0 = ω_{ℤ/p}`, so the order of H does not determine `ω`.
- `TauCeti.HodgeTate.conormal_eq_cotangentSpace_test`: For the Hopf algebra A of H over R, the `R-module ω_H` equals `(ker ε)/(ker ε)²`, i.e. `TauCeti.Bialgebra.CotangentSpace` R A.
- `ω_{ℤ/p^n} = 0` over any base (étale group).
- `ω_{μ_{p^n}}` over `ℤ_p` is `ℤ_p/p^n`, generated by the class of `t − 1 (= dt/t)`.
- `ω_{α_p}` over `𝔽_p` is one-dimensional, so `ω` does not detect the order of H alone.

Sources: [FAR10], §2, before Def. 3, p. 7.

*Needs:* `TauCeti.Bialgebra.CotangentSpace`; `TauCeti.Bialgebra.cotangentMap`; `TauCeti.Bialgebra.AugmentationIdeal`; `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat`; `Ideal.Cotangent`; `KaehlerDifferential`; `AlgebraicGeometry.Scheme.relativeDifferentials`; `AlgebraicGeometry.Scheme.Modules`; `AlgebraicGeometry.Scheme.Modules.pullback`.

<a id="section-0-2"></a>

### 0.2 The finite-level Hodge–Tate map

For finite locally free commutative H/S, pull `dt/t` back along the Cartier-dual character of a point, on every S-scheme S′. For `H=A^∨[p^n]` the Weil pairing gives target `ω_A/p^n`.

On affine charts `S=Spec R`, write `H(L)` for the supplied `FiniteFlat.points H L` of `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1.24a. Its additive law, base change and postcomposition action are the ones used by the character differential. Over `O_C`, restriction identifies `H(O_C)` with `H(C)` by finite properness, so the character maps in 3.9 use integral points through this identification. When R is a DVR with characteristic-zero fraction field K and L is a chosen separable closure of K, comparisons with a specified finite Galois module M use the supplier's `GaloisModel R L M` and its chosen integral model.

- `TauCeti.HodgeTate.hodgeTateMap`: `α_H`: `H(S) → ω_{H^D}`, `x ↦ x*(dt/t)`, through Cartier duality.
- `TauCeti.HodgeTate.hodgeTateMap_add`: `α_H(x + y) = α_H(x) + α_H(y)` and `α_H(0) = 0`.
- `TauCeti.HodgeTate.hodgeTateMap_apply_groupLike`: Over Spec R, `α_H(x)` is the class of `g_x − 1` in `I/I²`, `g_x` the group-like element of the Hopf algebra of `H^D` attached to x.
- `TauCeti.HodgeTate.hodgeTateMap_natural`: For f: `H → H′` with Cartier dual `f^D`: `H′^D → H^D`, `α_{H′}(f(x)) = (f^D)*(α_H(x))` in `ω_{H′^D}`, where `(f^D)*`: `ω_{H^D} → ω_{H′^D}`.
- `TauCeti.HodgeTate.hodgeTateMap_baseChange`: For `R → R′`, `α_{H_{R′}}` restricted to `H(R)` is `α_H` followed by `ω_{H^D} → R′ ⊗ ω_{H^D}`.
- `TauCeti.HodgeTate.hodgeTateLinear`: The linearisation `α_H ⊗ 1`: `H(R′) ⊗_ℤ R′ → R′ ⊗_R ω_{H^D}` for an R-algebra R′.

**Checks.**

- `TauCeti.HodgeTate.hodgeTateMap_constant`: For `H = (ℤ/p^n)_R`, `α_H(1)` is the class of `t − 1` in `ω_{μ_{p^n}} = R/p^n`, a generator.
- `TauCeti.HodgeTate.hodgeTateMap_mu_eq_zero`: For `H = μ_{p^n,R}`, `α_H = 0` because `ω_{H^D} = ω_{ℤ/p^n} = 0`.
- `TauCeti.HodgeTate.hodgeTateMap_depends_on_model`: Over `R = ℤ_p[ζ_p]`, with fraction field K and chosen separable closure L, `ℤ/p` and `μ_p` give `GaloisModel R L (ℤ/p)` for the same trivial Galois module, using `a↦ζ_p^a` for the latter. Yet `α_{ℤ/p}(1)` generates `ω_{μ_p} ≅ R/p` while `α_{μ_p} = 0`: the character differential retains the chosen integral model.
- `TauCeti.HodgeTate.hodgeTateMap_cotangentMap`: Over Spec R, `α_H(x) = TauCeti.Bialgebra.cotangentMap R A(g_x)` for A the Hopf algebra of `H^D`.
- `α_{μ_{p^n}}`: `μ_{p^n}(R) → ω_{ℤ/p^n} = 0` is zero, and `α_{ℤ/p^n}`: `ℤ/p^n → ω_{μ_{p^n}} = R/p^n` sends 1 to dt/t.
- `α_H` is additive and natural in H.

Sources: [FAR10], §9.2, Def. 17, p. 25; [SW13], §5.1, Prop. 5.1.6 and its proof, pp. 49–50; [AIP15], §3.2, the Hodge–Tate map, p. 12.

*Needs:* [0.1](#section-0-1); `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat`; `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDualBaseChangeIso`; `TauCeti.Bialgebra.cotangentMap_mul`; `IsGroupLikeElem`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1.24a (points and Galois models); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1 (p divisible cartier dual); `GroupLike`; `CategoryTheory.Grp`; [0.21](#section-0-21).

<a id="section-0-3"></a>

### 0.3 Functoriality, endomorphisms and polarisations of the Hodge–Tate map

Prove `TauCeti.HodgeTate.hodgeTateMap_compatibilities`. For finite flat commutative S-groups and `f:H→H′`, prove `α_{H′}f=(f^D)*α_H`. An endomorphism ring acts equivariantly through `a↦(a^D)*`. For polarized abelian A/S and `n≥1`, use `e_n:A[p^n]×A^∨[p^n]→μ_{p^n}` to identify Cartier duals and obtain `α_{A^∨[p^n]}(λx)=λ*α_{A[p^n]}(x)` in `ω_A/p^n`, where `λ*:ω_{A^∨}→ω_A`. The same holds levelwise for quasi-polarized p-divisible groups (R07.1, p divisible cartier dual).

Use `AbelianSchemesAndArithmeticModuli` A3’s Weil-pairing sign; reversing it changes the comparison by `−1`.

**Checks.**

- For E an elliptic curve with its principal polarisation, `α_{E[p^n]}` and `α_{E^∨[p^n]}` coincide under `E ≅ E^∨`.
- For `𝒪_F` acting on a Hilbert–Blumenthal abelian scheme, `α` is `𝒪_F`-linear, so its image is an `𝒪_F ⊗` R-submodule of `ω`.

Sources: [FAR10], §9.2, Def. 17, p. 25.

*Needs:* [0.2](#section-0-2); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1 (p divisible cartier dual); `AbelianSchemesAndArithmeticModuli` A3 (dual isogeny and cartier kernel); `AbelianSchemesAndArithmeticModuli` A3 (polarized weil pairing); `AbelianSchemesAndArithmeticModuli` A4 (p divisible group).

<a id="section-0-4"></a>

### 0.4 The Hodge–Tate map of a p-divisible group and its completed linearisation

For p-divisible `G/O_C`, use `ω_{G^D[p^n]}=ω_{G^D}/p^n` and completeness (0.25). Tate transitions are multiplication by p; conormal transitions are reduction. Descent to a valuation subfield K gives equivariance for continuous K-automorphisms of C.

Use R07.1.8's Tate module with finite levels `FiniteFlat.points G[p^n] C` from R07.1.24a, identified with their `O_C`-points as in 0.2. For a model over a mixed-characteristic DVR `O_K` and a chosen algebraic closure `K̄⊂C`, the finite-level Galois identifications use `GaloisModel O_K K̄ M_n`; the action on C retains the hypotheses below.

- `TauCeti.HodgeTate.pDivisibleHodgeTateMap`: `α_G`: `T_pG(R) → ω_{G^D}`, the inverse limit of `α_{G[p^n]}`.
- `TauCeti.HodgeTate.pDivisibleHodgeTateMap_mod`: `α_G mod p^n` equals `α_{G[p^n]}` composed with `T_pG → G[p^n]`.
- `TauCeti.HodgeTate.pDivisibleHodgeTateLinear`: `α_G ⊗ 1`: `T_pG ⊗_{ℤ_p} O_C → ω_{G^D}` over `O_C`, and its C-linearisation.
- `TauCeti.HodgeTate.pDivisibleHodgeTateMap_natural`: Natural in homomorphisms of p-divisible groups, 𝒪-linear for endomorphism actions, exchanged under a quasi-polarisation.
- `TauCeti.HodgeTate.pDivisibleHodgeTateMap_galois`: For G over `O_K`, `α_G ⊗ 1` is equivariant for continuous K-automorphisms of C. If C is the completion of a chosen algebraic closure of K, this gives `Gal(K̄/K)`-equivariance. For general C an absolute-Galois assertion requires a specified compatible continuous action on C; the underlying map needs no such action.

**Checks.**

- For `C=widehat(overline(ℚ_p(T)))` with the Gauss valuation and an ordinary `E/ℤ_p`, the nonequivariant character map exists, but descent of E does not specify an action of `Gal(ℚ̄_p/ℚ_p)` on C.

- `TauCeti.HodgeTate.pDivisibleHodgeTateMap_QpZp`: For `G = ℚ_p/ℤ_p` over `O_C`, `α_G(1) = dt/t`, so `α_G ⊗ 1` is an isomorphism `ℤ_p ⊗ O_C ≅ ω_{μ_{p^∞}}`.
- `TauCeti.HodgeTate.pDivisibleHodgeTateMap_mu`: For `G = μ_{p^∞}`, `α_G = 0`.
- `TauCeti.HodgeTate.pDivisibleHodgeTateMap_not_surjective_integrally`: For `G = E[p^∞]` with E supersingular over `O_C`, `α_G ⊗ 1` is not surjective: its cokernel is nonzero and killed by `p^{1/(p−1)} (0.5)`, so the integral map is not a split surjection.
- `TauCeti.HodgeTate.pDivisibleHodgeTateMap_tate`: For G over the ring of integers of a complete discretely valued K with perfect residue field, `α_G ⊗ C`: `T_pG ⊗ C → ω_{G^D} ⊗ C` is the projection of Tate's decomposition `T_pG ⊗ C ≅ (t_{G^D}(K)^∨ ⊗ C) ⊕ (t_G(K) ⊗ C(1))` (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1 (hodge tate p divisible)) onto its first summand, `t_{G^D}(K)^∨ = ω_{G^D} ⊗ K`.
- For `G = μ_{p^∞}` over `O_C`, `α_G`: `T_pμ_{p^∞} = ℤ_p(1) → ω_{ℚ_p/ℤ_p} = 0` is zero; for `G = ℚ_p/ℤ_p`, `α_G`: `ℤ_p → ω_{μ_{p^∞}} = O_C·dt/t` sends 1 to dt/t.
- For an abelian variety A with good ordinary reduction and `G = A[p^∞]`, the C-linearisation is surjective with kernel `T_p(G^∘) ⊗_{ℤ_p} C`, the Tate module of the connected (multiplicative) part, which is `Lie(G) ⊗ C(1)`; the kernel is not `T_p(G^∘) ⊗ C(1)`.

Sources: [SW13], §5.1, Prop. 5.1.6 and its proof, pp. 49–50.

*Needs:* [0.2](#section-0-2); [0.3](#section-0-3); [0.1](#section-0-1); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1 (p divisible tate module); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1 (p divisible cartier dual); `PadicInt`; `PadicComplex`; `IsAdicComplete`; [0.25](#section-0-25); [0.23](#section-0-23).

<a id="section-0-5"></a>

### 0.5 Fargues's bound on the cokernel of the Hodge–Tate map

Prove `TauCeti.HodgeTate.farguesHodgeTateCokernel`. For p-divisible `G/O_C`, the complex `Lie(G)⊗O_C(1)→T_pG⊗O_C→ω_{G^D}` has zero composite and cohomology killed by every `a∈O_C` with `v(a)≥1/(p−1)`; it is exact over C. For finite flat `H⊂G`, G/H is p-divisible; the surjections `T_p(G/H)⊗O_C↠H(O_C)⊗O_C` and `ω_{(G/H)^D}↠ω_{H^D}` intertwine characters, so `coker α_H` inherits the bound. Every finite flat commutative p-power H embeds into an abelian scheme with abelian quotient by R07.1.40 (the local base makes this global), giving the same bound for all H.

The finite flat conclusion is stated as `HodgeTate.farguesHodgeTateCokernel_finite` in Suggested.lean: for the coordinate Hopf algebra of H, the span of group-like character differentials contains `a·ω_H` whenever `v(a)≥1/(p−1)`. Apply the bound to the Cartier dual to obtain the cokernel assertion for `α_H`. This includes every prime and every p-power order over `O_C`.

**Checks.**

- For `G = μ_p` over `O_K` the cokernel is `ω_{ℤ/p} = 0`; for `G = ℤ/p` the map is onto `ω_{μ_p} = O_K/p`.
- The bound is uniform: it depends neither on ht G nor on the ramification of K.
- For `H_n ⊂ G[p^n]` étale-locally cyclic inside the p-divisible group of a semi-abelian scheme with good reduction at a rank-one point, `coker(HT_{H_n} ⊗ 1)` is killed by `p^{1/(p−1)}`; Pilloni uses this to bound `deg H_n^D`.

Sources: [CDM12], Thm. 4.13 and Rem. 4.14, pp. 27–28; [FAR10], §9, Thm. 7, p.26 (author copy; `p≠2`); [FAR11], §5.3.2, Thm. 2, pp.24–25; [FAR10], §9, Thm. 7 and its proof, p. 26; [PIL20], §14.1, proof of Lem. 14.1.1, p. 92.

*Needs:* [0.2](#section-0-2); [0.4](#section-0-4); [0.25](#section-0-25); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1 (p divisible group); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1 (oort tate classification); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1.40; [0.22](#section-0-22).

<a id="section-0-6"></a>

### 0.6 Fargues's degree of a finite flat group scheme

Let K be henselian rank one of characteristic zero, `v(p)=1`, and G finite locally free commutative of order `p^h`. Apply 0.24 to its finitely presented torsion conormal; general-base divisor claims retain 0.`9/0`.26's regularity hypotheses.

- `TauCeti.HodgeTate.discriminantDivisor`: `δ_G = Fitt₀ ω_G` as an invertible ideal of `O_S`, for G generically étale over S.
- `TauCeti.HodgeTate.farguesDegree`: `deg G := v(Fitt₀ ω_G) ∈ ℝ_{≥0}` for G finite flat over `O_K`.
- `TauCeti.HodgeTate.farguesDegree_eq_sum`: If `ω_G ≅ ⊕ O_K/x_i` then `deg G = Σ v(x_i)`.
- `TauCeti.HodgeTate.fargueSlope`: For a nonzero group of p-power `rank p^h`, `μ(G)=deg G/h`. The zero object has degree zero and is excluded from slope comparisons.
- `TauCeti.HodgeTate.farguesDegree_isogeny`: If `G = ker(f: A → B)` for an isogeny of abelian schemes or p-divisible groups over `O_K`, `deg G = v(det(f*: ω_B → ω_A))`.
- `TauCeti.HodgeTate.farguesDegree_monogenic`: For `G = Spec O_K[T]/(f)` with unit section `T = 0`, `deg G = v(f′(0)) = Σ_{x ∈ G(O_K̄)∖0} v(x)`.

**Checks.**

- `TauCeti.HodgeTate.farguesDegree_constant`: `deg (ℤ/p^n)_{O_K} = 0`.
- `TauCeti.HodgeTate.farguesDegree_mu`: `deg μ_{p^n, O_K} = n`, since `ω = O_K/p^n`.
- `TauCeti.HodgeTate.farguesDegree_not_length`: deg is not the `O_K-length` of `ω_G`: for K with value group `ℚ` and G with `ω_G ≅ O_K/p^{1/2}`, the length is infinite (`O_K` is not noetherian) while `deg G = 1/2`.
- `TauCeti.HodgeTate.farguesDegree_ellipticTorsion`: For E an elliptic curve over `O_K` with good reduction, deg `E[p]` `=` 1 (`BT_1` of dimension 1).
- `deg (ℤ/p^n) = 0`, `deg μ_{p^n} = n`, `deg G[p^n] = n·dim G` for a p-divisible group G.
- For `G = Spec O_K[T]/(f)`, f monic with `f(0) = 0`, `deg G = v(f′(0))`.
- For a supersingular elliptic curve E over `W(l)`, l algebraically closed of characteristic p, every subgroup of order p of `E[p]` over `O_C` (C the completion of an algebraic closure of `W(l)[1/p]`) has degree `1/(p+1)`. Indeed [p] on the formal group has linear coefficient of valuation 1, unit coefficient at `T^{p²}` and all coefficients in between divisible by p. Its Newton polygon gives every nonzero p-torsion point valuation `1/(p²−1)`, so `deg = v(f′(0)) = (p−1)/(p²−1)`. For the lift Ã with p-divisible group `μ_{p^∞} ⊕ E[p^∞] ⊕ ℚ_p/ℤ_p` this is the degree `1/(p+1)` of the biconnected part `L⁰` of an order-p³ subgroup `L = L^m ⊕ L⁰ ⊕ L^{ét} ⊂ Ã[p]` used by Pilloni.

Sources: [FAR10], §2, Def. 3, p. 7; §3, Def. 4, p. 9; Introduction, p. 2; [PIL20], §7.4.2, proof of Prop. 7.4.2.1, p. 48.

*Needs:* [0.1](#section-0-1); `Valuation`; `ValuationSubring`; `Module.length`; [0.24](#section-0-24); [0.26](#section-0-26); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1 (p divisible group).

<a id="section-0-7"></a>

### 0.7 Additivity, duality and extreme values of the degree

Prove `TauCeti.HodgeTate.farguesDegree_properties`. For finite flat commutative p-power groups over `O_K` as in 0.6, prove additivity in exact sequences and `deg G+deg G^D=ht G`; on general bases `δ` is additive, and duality is `δ_G+δ_{G^D}=div|G|` when `|G|` is regular. Degree is invariant under valued extensions, and δ pulls back under flat base change. Prove `0≤deg G≤ht G`, with extremes precisely étale/multiplicative; for positive height `μ(G^D)=1−μ(G)`. A level-n dimension-d truncated BT has degree nd; hence `deg G[p^n]=n dim G` and, for positive n and height, `μ(G[p^n])=dim G/ht G`.

**Checks.**

- `deg μ_p + deg ℤ/p = 1 =` ht.
- The trivial group has height and degree zero; it is both étale and multiplicative, and no slope identity is asserted for it.
- `deg E[p] = 1` for an elliptic curve E with good reduction, and `E[p]` is neither étale nor multiplicative when E is supersingular.

Sources: [FAR10], §2, Lem. 1, p. 7; §3, Lem. 4, p. 9; §3, Exemple 2, p. 9.

*Needs:* [0.6](#section-0-6); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1 (p divisible cartier dual); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1 (p divisible dimension); `AbelianSchemesAndArithmeticModuli` A4; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1.40; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1.11; [0.26](#section-0-26); `AbelianSchemesAndArithmeticModuli` A4 (abelian h1 de rham).

<a id="section-0-8"></a>

### 0.8 The degree increases along generic isomorphisms

Prove `TauCeti.HodgeTate.farguesDegree_genericIsomorphism`. For a generic isomorphism `f:G→G′` of finite flat commutative groups over complete characteristic-zero `O_K`, `v(p)=1`, write `G=Spec A`, `G′=Spec A′`. Prove `deg G′−deg G=(2/|G|)χ(A,f*A′)≥0`, with `χ=v(Fitt₀(A/f*A′))`, and equality iff f is an isomorphism. For `G′↪G→G″` with zero composite and generic isomorphism `G/G′→G″`, obtain `deg G≤deg G′+deg G″`, equality iff the second map is fppf-surjective. Over a DVR this is strict on Raynaud prolongations; duality exchanges degree with `ht−deg`.

Uses `Q_i`.

**Checks.**

- For the generic isomorphism `ℤ/p → μ_p` over `ℤ_p[ζ_p]` given by `1 ↦ ζ_p`, `deg ℤ/p = 0 < 1 = deg μ_p`, and the map is not an isomorphism.
- Boxer–Pilloni use the equality case: a generic isomorphism `H₁ → H₂` with `deg H₁ = deg H₂` is an isomorphism.

Sources: [FAR10], §2, Prop. 2, p. 8; §3, Corollaire 3, p. 10; [BP26], §4.2.8, proof of Prop. 4.2.8, p. 45.

*Needs:* [0.6](#section-0-6); [0.7](#section-0-7); [0.20](#section-0-20); [0.24](#section-0-24); [0.26](#section-0-26).

<a id="section-0-9"></a>

### 0.9 The divisor `D_H` of a generically étale finite flat group scheme

For finite locally free commutative G/S, require a perfect rank-zero co-Lie complex of amplitude `[−1,0]` with regular determinant and generic étale locus meeting every component; duality also requires regular rank. Codimension-one detection needs S integral normal noetherian; elsewhere use Fitting identities.

- `TauCeti.HodgeTate.farguesDivisor`: `D_H = Fitt₀ ω_H` as an effective Cartier divisor of X.
- `TauCeti.HodgeTate.farguesDivisor_support`: X ∖ Supp `D_H` is the largest open over which H is étale.
- `TauCeti.HodgeTate.farguesDivisor_add_dual`: `D_H + D_{H^D} = V(p^h)` for H of order `p^h`.
- `TauCeti.HodgeTate.farguesDivisor_pullback`: Base change pulls back `δ_G` whenever the pulled-back determinant section stays regular; in particular flat base change preserves the effective Cartier divisor.
- `TauCeti.HodgeTate.farguesDivisor_rankOne`: At x: `Spec V → X` with V rank one, `v(p) = 1`, `x*D_H = (a)` with `v(a) = deg H_x`.
- `TauCeti.HodgeTate.farguesDivisor_constantDegree`: Let `𝔛` be a normal admissible formal scheme locally topologically of finite type over the integers of a complete discretely valued mixed-characteristic field K. For a finite locally free commutative group H of p-power order on `𝔛`, with perfect rank-zero co-Lie complex of amplitude `[−1,0]`, regular determinant and étale generic fibre, `x↦deg H_x` on rank-one generic-fibre points is locally constant in the rigid analytic topology iff, locally on `𝔛`, `bD_H=aV(p)` for integers `a≥0`, `b>0`. On each connected normal affine formal open, put `d_i=ord_{E_i}(D_H)` and `e_i=ord_{E_i}(p)` for the special-fibre prime divisors. Their divisorial points have degree `d_i/e_i`; constancy forces these ratios to agree. Conversely equality of the ratios gives the Cartier equality by codimension-one detection, hence constant degree. The generic fibre of such an affine open is connected because its affinoid algebra is a domain. This detection statement uses noetherianity and discreteness; the preceding divisor and rank-one targets retain their generality.

**Checks.**

- `TauCeti.HodgeTate.farguesDivisor_mu`: `D_{μ_{p^n}} = V(p^n)`.
- `TauCeti.HodgeTate.farguesDivisor_etale`: `D_H = 0` for H étale over X.
- `TauCeti.HodgeTate.farguesDivisor_not_reduced`: `D_{μ_p} = V(p)` is not the reduced special fibre when `X = Spf ℤ_p[p^{1/2}]`: there `V(p) = 2·V(p^{1/2})`, so `D_H` records multiplicities, not only support.
- `D_{μ_{p^n}} = V(p^n)`, `D_{ℤ/p^n} = ∅`.
- Over a normal admissible formal model over a complete DVR, the detection target applies; over `Spf ℤ_p[p^{1/2}]`, `D_H = V(p^{1/2})` has constant degree `1/2` although it is not an integral multiple of `V(p)`.
- Discreteness is essential for rationality. At `p=2`, choose complete algebraically closed C with `v(2)=1` and `a∈R=O_C` of irrational valuation `0<r<1`, and set `b=2/a`. The finite flat group `H=Spec R[x]/(x²−ax)` has `Δx=x⊗1+1⊗x−bx⊗x`, counit `x↦0` and antipode `x↦x`; the Hopf identities use `ab=2`. Its co-Lie differential at the unit is `−a`, so `ω_H=R/(a)`, `D_H=V(a)` and `deg H=r`. The generic fibre of `Spf R` is a point, but `nD_H=mV(2)` would force `nr=m`. Such C is obtained from the irrational Gauss valuation on `ℚ₂(T)` by completing an algebraic closure.

Sources: [BP26], §4.1.8, p. 41 (divisor, support and duality); [Stacks, Lemma 10.157.6(2), tag 031T](https://stacks.math.columbia.edu/tag/031T) (normal noetherian codimension-one detection), applied on the formal affine charts for the constant-degree target.

*Needs:* [0.6](#section-0-6); [0.7](#section-0-7); AdicSpacesPartIII R2 (admissible formal scheme); `AdicEtaleGeometry` A1 (etale-locally-finitely-many-components, the affinoid idempotent correspondence); `AlgebraicGeometry.Scheme`; [0.26](#section-0-26).

<a id="section-0-10"></a>

### 0.10 The divisor of an isogeny of semi-abelian schemes and the section `δ_H`

Let X be normal `ℤ_p`-flat scheme or admissible formal scheme and `f:G→G′` an isogeny of equal-dimension semi-abelian schemes, étale after inverting p. Its determinant lies in the determinant-Hom line; kernel degrees require finite-flat specializations of the possibly quasi-finite boundary kernel.

- `TauCeti.HodgeTate.isogenyDivisor`: `D_f :=` div(det `Lie(f)`) for an isogeny f of semi-abelian schemes, étale after inverting p.
- `TauCeti.HodgeTate.isogenyDivisor_comp`: `D_{g∘f} = D_f + D_g`.
- `TauCeti.HodgeTate.isogenyDivisor_eq_farguesDivisor`: Over the open where ker f is finite flat, `D_f = D_{ker f}`.
- `TauCeti.HodgeTate.deltaSection`: `δ_H := det Lie(f)` on an analytic adic space with a formal model; `v_x(δ_H) = deg H_x` when `H_x` is finite flat over the valuation ring at x.
- `TauCeti.HodgeTate.isogenyDivisor_mulP`: `D_{[p]} = V(p^{dim G})`.

**Checks.**

- `TauCeti.HodgeTate.isogenyDivisor_id`: `D_{id} = 0`.
- `TauCeti.HodgeTate.isogenyDivisor_mulP_test`: For [p] on an abelian scheme of relative dimension g, `D_{[p]} = V(p^g)`.
- `TauCeti.HodgeTate.isogenyDivisor_kernel_not_finite`: The quotient of the Tate curve by `μ_p` extends on the toric chart as `t ↦ t^p`, has finite flat kernel `μ_p`, and `D_f = V(p)`. It is not a counterexample to `D_f = D_{ker f}`; this identity requires finite flatness of the kernel.
- For `f = [p]` on an abelian scheme of dimension g, `D_f = V(p^g)`.
- For the Tate curve, the quotient by `μ_p ⊂ 𝔾_m` has `D_f = V(p) = D_{μ_p}`, while over `ℤ_p[[q^{1/p}]]` the quotient by the étale subgroup generated by `q^{1/p}`, the isogeny `Tate(q) → Tate(q^{1/p})` induced by the identity of `𝔾_m`, has `D_f = 0` although its kernel is not finite over the cusp.

Sources: [PIL20], §14.1, p. 92; [BCGP21], §6.5.1, p. 154; [PIL20], §14.3, p. 93.

*Needs:* [0.9](#section-0-9); `ShimuraCompactifications` C4 (semi abelian scheme); `ShimuraCompactifications` C4 (extended isogeny kernel); `LinearMap.det`.

<a id="section-0-11"></a>

### 0.11 The Hodge–Tate map of a group of multiplicative type is an isomorphism

Prove `TauCeti.HodgeTate.multiplicativeHodgeTateIso`. For H/R étale-locally `μ_{p^n}^r`, with locally constant Cartier-dual character sheaf M, prove `M⊗_ℤO_S≅ω_H`. On a split chart R′ use `(ℤ/p^n)^r⊗R′`, including disconnected charts; tensoring all sections `H^D(R′)` gives a different source. Apply to universal multiplicative subgroups on Siegel and Hilbert–Siegel charts, for every p.

**Checks.**

- For `H = μ_{p^n}`, `α_{ℤ/p^n}(1) = dt/t` generates `ω_{μ_{p^n}} = R/p^n`.
- For `R′=𝔽_p×𝔽_p` and `H=μ_p`, `M⊗R′≅R′`, while `H^D(R′)≅(ℤ/p)^2` and `H^D(R′)⊗R′≅(R′)^2`. The latter cannot be the source of the claimed isomorphism.

Sources: [PIL20], §9.4, p. 56.

*Needs:* [0.2](#section-0-2); [0.1](#section-0-1); [0.21](#section-0-21).

<a id="section-0-12"></a>

### 0.12 Normalized determinant pullback for multiplicative isogenies and its boundary application

Prove `TauCeti.HodgeTate.normalizedMultiplicativePullback_det`. Let S have p locally nilpotent or be p-adic formal, and G, G′ be height-h multiplicative p-divisible groups with rank-h étale character sheaves T, T′. Characters give `G=Hom(T,μ_{p^∞})`, `ω_G=T⊗ω_μ`, `detω_G=detT⊗ω_μ^{⊗h}`. For an isogeny λ with character map `λ₀:T′→T`, factor `detλ₀=p^ru`, `r≥0`, on the `ℤ_p`-lattice before tensoring. Set `λ̃*=u⊗id`. It is an isomorphism independent of choices, natural under base change and étale descent, with `(μλ)̃*=λ̃*μ̃*` and `detλ*=p^rλ̃*`. Over `𝔽_p`, it preserves the nowhere-vanishing multiplicative Hasse section even when `r>0` makes `detλ*=0`. Apply to toric parts `Hom(X,μ_{p^∞})` and their induced isogenies on `ShimuraCompactifications` C4 (polarized degeneration data) charts; arbitrary invariant factors are allowed.

**Checks.**

- For `λ = [p]` on `μ_{p^∞}`, `λ* = p` on `ω` and `λ̃* = id`.
- For `λ = id × [p]`: `μ_{p^∞}² → μ_{p^∞}²`, `det λ₀ = p`, so `r = 1` and `λ̃* = id` on `det ω`, while `det λ* = p`; `λ₀` is not p times an automorphism.
- Over `𝔽_p`, `det λ* = 0` for `λ = [p]` on `μ_{p^∞}`, while `λ̃* = id` preserves `Ha(μ_{p^∞}) = (dt/t)^{⊗(p−1)}`: the unnormalized pullback loses the Hasse invariant.

Sources: [PIL20], §6.3.4, Lem. 6.3.4.1, p. 34.

*Needs:* [0.1](#section-0-1); [0.11](#section-0-11); [0.21](#section-0-21); [0.25](#section-0-25); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1 (p divisible group); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.2.21; `ShimuraCompactifications` C4 (polarized degeneration data); `ShimuraCompactifications` C4 (semiabelian hasse boundary comparison); `ShimuraCompactifications` C4 (constructible character sheaf).

<a id="section-0-13"></a>

### 0.13 p-power torsion of semi-abelian schemes on degeneration charts

On supplied henselian formal/Raynaud charts, take dimension-g semi-abelian G with torus-rank-r stratum `0→T→G_Z→B→0` and polarized `[Y→G̃]`, `rank Y=r`. Distinguish Y from dual torus characters; dualize only finite pieces and one-motive torsion.

- `TauCeti.HodgeTate.semiAbelianTorsion`: The quasi-finite flat kernel `G[p^n]`, with its separate finite locally free part on the supplied henselian chart; this is not a constant-height p-divisible family across strata.
- `TauCeti.HodgeTate.semiAbelianTorsion_finitePart_exact`: `0 → T[p^n] → G[p^n]^f → B[p^n] → 0` on a stratum Z of torus rank r.
- `TauCeti.HodgeTate.semiAbelianTorsion_card`: The finite part has order `p^{n(2g−r)}` on Z.
- `TauCeti.HodgeTate.semiAbelianTateModule_extension`: For the supplied uniformization `A^an=G̃^an/Y`, `0→T_pG̃→T_pA→Y⊗ℤ_p→0` is exact on the generic fibre.
- `TauCeti.HodgeTate.semiAbelianHodgeTate_toric`: `α` vanishes on the toric piece `T[p^n]`, and the Hodge–Tate map of the dual of `T[p^n]` is the isomorphism of 0.11 onto `ω_{T[p^n]}`.

**Checks.**

- `TauCeti.HodgeTate.semiAbelianTorsion_abelian`: For r `=` 0 (G abelian) the construction is `A[p^n]`, finite locally free of order `p^{2ng}`.
- `TauCeti.HodgeTate.semiAbelianTorsion_torus`: For `G = 𝔾_m^g` a split torus, `G[p^n] = μ_{p^n}^g`, of degree ng.
- `TauCeti.HodgeTate.semiAbelianTorsion_not_constant_height`: For the Tate curve over `ℤ_p[[q]]`, `E[p]` is not finite over `q = 0`: its finite part there has order p, not `p²`; a constant-height p-divisible group over the chart does not exist.
- For the Tate curve `𝔾_m/q^ℤ` over `ℤ_p((q))`, `E[p^n] = μ_{p^n}` extended by `ℤ/p^n` generated by `q^{1/p^n}`, and over the cusp only `μ_{p^n}` remains finite.

Sources: [SCH15], §3.3, Prop. 3.3.1 (arXiv v2, III.3.1), p. 54; [PIL20], §12.2.1, p. 74.

*Needs:* [0.2](#section-0-2); [0.11](#section-0-11); `ShimuraCompactifications` C4 (semi abelian scheme); `ShimuraCompactifications` C4 (semiabelian tate module); `ShimuraCompactifications` C4 (extended isogeny kernel); `ShimuraCompactifications` C4 (formal universal degeneration); `ShimuraCompactifications` C4 (polarized degeneration data); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1 (finite part of quasi finite group); `ShimuraCompactifications` C4; [0.23](#section-0-23).

<a id="section-0-14"></a>

### 0.14 The Hasse invariant of a semi-abelian scheme

Over any `𝔽_p`-scheme S name C4's semi-abelian Verschiebung determinant below. The abelian comparison is 0.27; BT₁ Hasse invariants, LF and their HT sequence belong to R07.2.

- `TauCeti.HodgeTate.semiAbelianHasse`: `Ha(G/S) = det V* ∈ H⁰(S, (det ω_G)^{⊗(p−1)})`.
- `TauCeti.HodgeTate.semiAbelianHasse_eq_bt1Hasse`: For `G = A` abelian, `Ha(A/S) = Ha(A[p])` of R07.2 under `ω_{A[p]} = ω_A/p`.
- `TauCeti.HodgeTate.semiAbelianHasse_baseChange`: Ha commutes with base change `S′ → S`.
- `TauCeti.HodgeTate.semiAbelianHasse_torus`: On a split torus Ha is a unit (det V* is an isomorphism on `ω_T`); this restates for the named section the split-torus value proved in `ShimuraCompactifications` C4 (semiabelian hasse boundary comparison).
- `TauCeti.HodgeTate.semiAbelianHasse_raynaud`: On a degeneration chart, `Ha(G) = Ha(B)·u` with u a unit, through `det ω_G ≅ det ω_T ⊗ det ω_B`; the factorization is the one proved in `ShimuraCompactifications` C4 (semiabelian hasse boundary comparison), transported to the named section.
- `TauCeti.HodgeTate.semiAbelianHasse_isUnit_iff`: `Ha(G/S)` is a unit iff every geometric fibre is ordinary (0.15).

**Checks.**

- `TauCeti.HodgeTate.semiAbelianHasse_tateCurve`: For the Tate curve over `𝔽_p((q))`, `Ha = 1` with respect to the canonical differential dt/t.
- `TauCeti.HodgeTate.semiAbelianHasse_torus_test`: For `G = 𝔾_m^g` over S, `Ha(G/S)` is a unit.
- `TauCeti.HodgeTate.semiAbelianHasse_supersingular`: For a supersingular elliptic curve over `𝔽̄_p`, `Ha = 0`: Ha is not a unit on every fibre, and the Hasse invariant detects supersingularity through V*, not through a count of points.
- `TauCeti.HodgeTate.semiAbelianHasse_bt1`: For A abelian, `Ha(A/S)` equals `R07.2's Ha(A[p])`.
- For an ordinary elliptic curve Ha is a unit, for a supersingular one `Ha = 0`.
- For the Tate curve, `Ha = 1` in the q-expansion normalisation.

Sources: [SCH15], §3.2.1, before Lem. 3.2.5, p. 33; §3.2.1, before Lem. 3.2.5, p. 33.

*Needs:* [0.1](#section-0-1); [0.13](#section-0-13); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.2 (frobenius verschiebung); `ShimuraCompactifications` C4 (semi abelian scheme); `ShimuraCompactifications` C4 (homomorphism extension); [0.27](#section-0-27); `LinearMap.det`; `Module.Invertible`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.2 (bt1 hasse invariant); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.2 (bt1 hasse witt duality); `AbelianSchemesAndArithmeticModuli` A2 (normalized poincare comparison); `AbelianSchemesAndArithmeticModuli` A2 (polarization representatives and graph); `ShimuraCompactifications` C4 (semiabelian hasse boundary comparison); `ShimuraCompactifications` C4 (constructible character sheaf).

<a id="section-0-15"></a>

### 0.15 The Hasse invariant is invertible exactly on the ordinary locus

Prove `TauCeti.HodgeTate.hasseInvariant_ordinaryLocus`. Let S be an `𝔽_p`-scheme and `A → S` an abelian scheme of dimension g. Then `Ha(A/S)` is invertible if and only if A is ordinary, i.e. for every geometric point x̄ of S, A[p](x̄) has `p^g` elements. For a semi-abelian G with abelian part B on a stratum, `Ha(G/S)` is invertible at x̄ iff `B_x̄` is ordinary.

**Checks.**

- The Tate curve is ordinary: Ha is a unit near the cusp.
- A supersingular elliptic curve has `Ha = 0`.

Sources: [SCH15], §3.2.1, Lem. 3.2.5, p. 33; §3.2.1, proof of Lem. 3.2.5, p. 33.

*Needs:* [0.14](#section-0-14); [0.27](#section-0-27); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.2 (frobenius verschiebung); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.2 (bt1 hasse invariant); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.2 (bt1 hasse witt duality).

<a id="section-0-16"></a>

### 0.16 The Hasse invariant on toroidal and minimal compactifications

Prove `TauCeti.HodgeTate.hasseInvariant_minimalCompactification`. For neat prime-to-p Siegel X over `ℤ_(p)` with C5's normal toroidal/minimal models, extend Ha as a section of `(detω)^{⊗(p−1)}` by semi-abelian Verschiebung and descend using the special-fibre structure-sheaf pushforward and descended Hodge line. On strata its value, after torus determinant trivialization, is the abelian-part Ha times a unit; at a Tate cusp it is 1. Hilbert data use the separate C6 boundary model.

Retain C5’s prime/fan hypotheses. Positive-dimensional abelian boundary parts need not be ordinary.

**Checks.**

- For `g = 1`, Ha extends to the cusps with value 1 (the Tate curve is ordinary).
- Ha is a section of an ample line bundle on `X*_{𝔽_p}`, so its non-vanishing locus is affine.

Sources: [SCH15], §III.2.2, pp. 37–39; Lem. III.3.2, p. 54.

*Needs:* [0.14](#section-0-14); [0.15](#section-0-15); `ShimuraCompactifications` C5 (integral toroidal space); `ShimuraCompactifications` C5 (integral minimal space); `ShimuraCompactifications` C5 (minimal hodge ampleness); `ShimuraCompactifications` C4 (semiabelian hasse boundary comparison); `ShimuraCompactifications` C4 (constructible character sheaf).

<a id="section-0-17"></a>

### 0.17 The finite-level Hodge–Tate map over the toroidal boundary

Prove `TauCeti.HodgeTate.hodgeTate_boundaryExtension`. On C5's normal full-level-pⁿ Siegel toroidal model over `ℤ_(p)` at neat prime-to-p level, extend `(ℤ/p^n)^{2g}⊗O→ω_G/p^n` by the polarized one-motive `[Y→G̃]`. The toric character part vanishes, the abelian differential descends from the torus-bundle base, and the dual one-motive pairing handles Y. Functoriality and cone refinements glue these maps integrally modulo `p^n`. Hilbert–Siegel GSp₄ models are outside this target.

Use `ShimuraCompactifications` C5’s good-prime normal Siegel models, C4’s polarized degeneration data and C3’s refinements.

**Checks.**

- For the modular curve at level `Γ(p^n)`, HT at the cusp `∞` vanishes on `μ_{p^n} ⊂ E_q[p^n]` and sends a point lifting the generator `q^{1/p^n}` of the quotient `ℤ/p^n` to dt/t, a generator of `ω/p^n` (Pilloni–Stroh: the map is trivial on the toric part).

Sources: [PS16], §1.4, Prop. 1.5 and Rem. 1.6, pp. 4–5.

*Needs:* [0.13](#section-0-13); [0.2](#section-0-2); [0.11](#section-0-11); `ShimuraCompactifications` C5 (higher level toroidal normalization); `ShimuraCompactifications` C4 (polarized degeneration data); `ShimuraCompactifications` C3 (refinement map); `ShimuraCompactifications` C4 (formal universal degeneration); [0.23](#section-0-23).

<a id="section-0-18"></a>

### 0.18 The Hodge–Tate filtration of an abelian variety through its Raynaud extension

Prove `TauCeti.HodgeTate.raynaudHodgeTate_filtration`. Let K be a complete discretely valued extension of `ℚ_p`, C the completion of an algebraic closure of K, and A an abelian variety over K. After a finite extension of K, A has semistable reduction (`NeronModelsAndSemistableAbelianVarieties` Layer 3 (semistable reduction)), and the rigid uniformization of `NeronModelsAndSemistableAbelianVarieties` Layer 3 over that complete discrete valuation ring writes `A^an=G̃^an/Y` with `0→T→G̃→B→0`, torus rank r and `dim B=g−r`. The finite-height p-divisible group `G̃[p∞]` has height `2g−r` and dimension g, and `0→T_pG̃→T_pA→Y⊗ℤ_p→0` is exact. The integral Faltings inclusion `Lie(G̃)(1)⊗C→T_pG̃⊗C` identifies with the Hodge–Tate filtration `Lie(A)(1)⊗C⊂T_pA⊗C`; it contains `T_pT⊗C`. Applying the dual one-motive gives the quotient `T_pA^∨⊗C→ω_A`, including its toric-form lattice quotient. All maps are `Gal(C/K)`-equivariant.

**Checks.**

- For a Tate curve `E_q`, the Hodge–Tate filtration is `ℤ_p(1) ⊗ C = T_pμ_{p^∞} ⊗ C ⊂ T_pE_q ⊗ C`, the line spanned by the `μ_{p^∞}`-part.

Sources: [SCH15], §3.3, Prop. 3.3.1 (arXiv v2, III.3.1), p. 54.

*Needs:* [0.4](#section-0-4); [0.3](#section-0-3); [0.13](#section-0-13); `NeronModelsAndSemistableAbelianVarieties` Layer 3 (raynaud extension comparison); `NeronModelsAndSemistableAbelianVarieties` Layer 3 (rigid uniformisation); `NeronModelsAndSemistableAbelianVarieties` Layer 3 (semistable reduction); `NeronModelsAndSemistableAbelianVarieties` Layer 3.

<a id="section-0-19"></a>

### 0.19 The Harder–Narasimhan filtration of a finite flat group scheme

For nonzero finite flat commutative p-power G over 0.6's K, use closed finite flat subgroups. HN joins `(0,0)` to `(ht G,deg G)`, is the subgroup-point concave envelope, and repeats graded slopes by height. Its slope-one step is multiplicative, its slope-zero quotient étale. Induct on the maximal destabilizing subgroup (FAR10 Proposition 4/Theorem 2).

- `TauCeti.HodgeTate.farguesSlope_le_of_semistable`: G is semi-stable iff `μ(G′) ≤ μ(G)` for all nonzero subgroups G′, iff `μ(G) ≤ μ(G/G′)` for all proper nonzero G′.
- `TauCeti.HodgeTate.harderNarasimhanFiltration`: The unique filtration with semi-stable graded pieces of strictly decreasing slopes.
- `TauCeti.HodgeTate.harderNarasimhanPolygon`: `HN(G)`: the concave polygon of the filtration.
- `TauCeti.HodgeTate.degree_le_harderNarasimhanPolygon`: `deg G′ ≤` `HN(G)(ht G′)` for every subgroup G′.
- `TauCeti.HodgeTate.harderNarasimhanFiltration_dual`: The filtration of `G^D` is formed by the Cartier duals of the quotients `G/G_i`, with slopes `1 − μ_i`.
- `TauCeti.HodgeTate.harderNarasimhanFiltration_aut`: Every automorphism of G preserves the filtration; it commutes with valued field extensions.

**Checks.**

- `TauCeti.HodgeTate.harderNarasimhanFiltration_ordinary`: For `G = μ_p × ℤ/p` over `O_K` the filtration is `0 ⊂ μ_p ⊂ G` with slopes 1 and 0.
- `TauCeti.HodgeTate.harderNarasimhanFiltration_semistable`: If G is semi-stable the filtration is `0 ⊂ G`. This happens for `G = E[p]` with E elliptic over `O_C` and `w = Ha(E) ≥ 1/2`: every subgroup of order p has degree w/p or `1 − w` if `w < p/(p+1)`, and `1/(p+1)` if `w ≥ p/(p+1)`; none exceeds the slope `1/2` of `E[p]`.
- `TauCeti.HodgeTate.harderNarasimhanFiltration_not_connectedEtale`: The HN filtration is not the connected–étale filtration: for E supersingular with `0 < w = Ha(E) < 1/2` the first step is the canonical subgroup C of degree `1 − w ∈ (1/2, 1)`, which is neither étale nor multiplicative, while the connected–étale filtration of the connected `E[p]` is `0 ⊂ E[p]`. For `1/2 ≤ w < p/(p+1)` the subgroup of degree `1 − w` still exists (Katz–Lubin; outside the range of 3.4) but has degree at most `1/2`, so it is not an HN step.
- For G ordinary `BT_n (μ_{p^n}^d × (ℤ/p^n)^{h−d})` with `0 < d < h` the filtration is `0 ⊂ G^0 ⊂ G` with slopes 1, 0; for `d = 0` or `d = h` it is `0 ⊂ G`.
- Fargues 2011: for a `BT_n` with small Hasse invariant the canonical subgroup is a step of the filtration (3.6 (2)).

Sources: [FAR10], §4.6, Thm. 2, p. 13; §4.9, Def. 9, p. 14; §4.9, Prop. 7, p. 14.

*Needs:* [0.6](#section-0-6); [0.7](#section-0-7); [0.8](#section-0-8).

<a id="section-0-20"></a>

### 0.20 The discriminant divisor is the different of the group algebra

Prove `TauCeti.HodgeTate.degree_different`. For finite syntomic A-algebra B étale over `A[1/t]` with t regular, the trace codifferent is an invertible fractional B-ideal, inverse to `D_{B/A}=Fitt₀^BΩ¹_{B/A}` (Fargues's Δ); its norm is the A-trace discriminant. For finite flat commutative generically étale `G=Spec B` over `S=Spec A`, prove `D_{G/S}=f*δ_G`, `δ_G=Fitt₀^Aω_G`, and `e*D⁻¹=δ_G⁻¹`. For monogenic `B=O_K[T]/(f)`, `f(0)=0`, obtain `ω_G=O_K/(f′(0))`, `deg G=v(f′(0))=Σ_{x≠0}v(x)` over all geometric roots.

**Checks.**

- For `μ_p` over a p-torsion-free valuation ring, `ω_{μ_p}=R/pR` while `e*D^{−1}=p^{−1}R`; they are not isomorphic R-modules.
- For `f(T)=(1+T)^p−1`, `f′(0)=p` and `Σ_{i=1}^{p−1}v(ζ_p^i−1)=1`. The discriminant over R is the norm of the B-different.

Sources: [FAR10], §1.3–1.4, Prop. 1, pp. 4–6; §2, p. 7.

*Needs:* [0.6](#section-0-6); `KaehlerDifferential`; [0.26](#section-0-26).

<a id="section-0-21"></a>

### 0.21 Base change of invariant differentials

Prove `TauCeti.HodgeTate.conormal_baseChange`. For H/S finite locally free commutative and any `S′→S`, `ω_H⊗O_{S′}≅ω_{H_{S′}}` canonically, with identity/composition coherence.

**Checks.**

- For Spec R the map agrees with base change of the augmentation cotangent module.

Sources: [FAR11], §2.1.1, p. 6.

*Needs:* [0.1](#section-0-1); `AlgebraicGeometry.Scheme.Modules`; `AlgebraicGeometry.Scheme.Modules.pullback`.

<a id="section-0-22"></a>

### 0.22 Invariant differentials of an exact group sequence

Prove `TauCeti.HodgeTate.conormal_rightExact`. For an fppf-exact sequence `0→H′→H→H″→0` of finite locally free commutative groups over S, `ω_{H″}→ω_H→ω_{H′}→0` is right exact.

**Checks.**

- The `μ_p` example has a torsion conormal; right exactness does not imply a vector-bundle short exact sequence.

Sources: [FAR10], §2, pp. 6–8.

*Needs:* [0.1](#section-0-1); `AlgebraicGeometry.Scheme.Modules`; `AlgebraicGeometry.Scheme.Modules.pullback`.

<a id="section-0-23"></a>

### 0.23 Naturality of the character differential

Prove `TauCeti.HodgeTate.hodgeTateMap_natural`. For `f:H→K` of finite locally free commutative S-groups and `x∈H(S)`, `α_K(f(x))=(f^D)*α_H(x)`; this identity commutes with base change.

**Checks.**

- For [p], both sides are p times the character differential.

Sources: [FAR11], §2.1.1, p. 6.

*Needs:* [0.2](#section-0-2); [0.21](#section-0-21).

<a id="section-0-24"></a>

### 0.24 The degree of a finitely presented torsion module over a rank-one valuation ring

For any rank-one valuation ring V and finitely presented torsion M, diagonalize finite presentations into injective square presentations; block-triangular presentations prove additivity. No completeness, discreteness or noetherianity is needed. Lattices are finitely generated spanning submodules in a finite-dimensional fraction-field space.

Uses `v_W`, `x_i`.

- `TauCeti.HodgeTate.torsionDegree`: `deg M := v(Fitt₀ M)` for a finitely presented torsion V-module M.
- `TauCeti.HodgeTate.torsionDegree_cyclic`: `deg(V/xV) = v(x)` for `x ≠ 0`.
- `TauCeti.HodgeTate.exists_cyclic_decomposition`: `M ≅ ⊕_{i=1}^{r} V/x_iV` with `x_i ≠ 0`, and `deg M = Σ_i v(x_i)`.
- `TauCeti.HodgeTate.torsionDegree_add`: `deg M₂ = deg M₁ + deg M₃` for a short exact sequence of finitely presented torsion modules.
- `TauCeti.HodgeTate.torsionDegree_baseChange`: `deg(M ⊗_V W) = deg M` for an extension of rank-one valuation rings.
- `TauCeti.HodgeTate.torsionDegree_eq_zero_iff`: `deg M = 0` iff `M = 0`.
- `TauCeti.HodgeTate.latticeIndex`: `χ(Λ₁, Λ₂)` for finitely generated spanning lattices of rank r, equal to `v(det)` of the inclusion when `Λ₂ ⊂ Λ₁`, with `χ(Λ₁, p^kΛ₁) =` kr and `χ(Λ₁, Λ₃) = χ(Λ₁, Λ₂) + χ(Λ₂, Λ₃)`.

**Checks.**

- `TauCeti.HodgeTate.torsionDegree_half`: For `V = O_C` and `M = O_C/p^{1/2}O_C`, `deg M = 1/2`, while M has no finite composition series (the submodules `p^qO_C/p^{1/2}O_C`, `0 < q < 1/2` rational, form an infinite chain). A degree defined as a length fails this test.
- `TauCeti.HodgeTate.torsionDegree_dvr`: Over `V = ℤ_p`, `deg(ℤ_p/p^n) = n = length`; over the ring of integers of a totally ramified extension of degree e with uniformizer `π`, `deg(V/π) = 1/e` while the length is 1, so `deg = length · v(π)` on a discrete valuation ring.
- `TauCeti.HodgeTate.torsionDegree_not_injective`: `deg(V/p ⊕ V/p) = 2 = deg(V/p²)`, although the modules differ (Fitt₁ is (p) for the first and V for the second): the degree is not an isomorphism invariant that classifies.
- `TauCeti.HodgeTate.torsionDegree_ses`: `0 → V/p → V/p² → V/p → 0` gives `2 = 1 + 1`.
- The zero module has degree 0; the non-torsion module V has `Fitt₀(V) = 0` and is outside the domain of the definition.

Sources: [FAR10], §2, after Def. 3, p. 7; §3, Defs. 4 and 5, p. 9.

*Needs:* `TauCeti.fittingIdeal`; `TauCeti.fittingIdeal_baseChange`; `Valuation`; `ValuationSubring`; `Module.length`.

<a id="section-0-25"></a>

### 0.25 The conormal module and dimension of a p-divisible group over `O_C`

Prove `TauCeti.HodgeTate.pDivisibleConormal_free`. For p-divisible G of height h over `O_C`, residue field k, define `ω_G=lim_nω_{G[p^n]}` by restriction. For `n≥1`, `ω_{G[p^n]}` is free of rank `d=dim G_k` over `O_C/p^n`. For `m≥n`, restriction is onto with kernel `p^nω_{G[p^m]}`. Thus `ω_G` is free rank d, p-complete and separated, and `ω_G/p^n≅ω_{G[p^n]}`. Prove `dim G+dim G^D=h` and base change under complete algebraically closed `C′⊃C`; this extends R07.1's complete-DVR conormal statements to `O_C`.

The argument also works over p-adically complete local rings where R07.1’s truncated-BT conormal theorem applies modulo every `p^m`.

Uses `G_k`.

**Checks.**

- For `G = μ_{p^∞}`, `ω_G = O_C·dt/t` is free of rank one and `ω_{μ_{p^n}} = O_C/p^n`; for `G = ℚ_p/ℤ_p`, `ω_G = 0` and `d = 0`.
- For `G = E[p^∞]` with E an elliptic curve with good reduction over `O_C`, `d = 1` and `h = 2`, so `dim G + dim G^D = 1 + 1 = h`; `ω_{E[p]} = O_C/p`, of degree one (0.6).
- The isomorphism `ω_G/p^n ≅ ω_{G[p^n]}` is special to the levels: for `G = μ_{p^∞} ⊕ ℚ_p/ℤ_p`, `ω_G/p = O_C/p`; the subgroup `H = μ_p ⊂ G[p]` happens to have `ω_H = O_C/p` too, but `H = ℤ/p ⊂ G[p]` has `ω_H = 0 ≠ ω_G/p`.

Sources: [FAR11], §2.2.1, p. 7; [FAR10], §3, Exemple 2, p. 9.

*Needs:* [0.1](#section-0-1); [0.21](#section-0-21); [0.22](#section-0-22); [0.24](#section-0-24); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1.10; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1.11; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1.15; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1 (p divisible group); `IsAdicComplete`.

<a id="section-0-26"></a>

### 0.26 The co-Lie complex of a finite locally free group scheme

Use the co-Lie complex `ℓ_G = Le_G*L_(G/S)` and its derived dual `ℓ̌_G = RHom_(O_S)(ℓ_G, O_S)` supplied by `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1.11 and R07.6.6 for flat, finitely presented commutative group schemes. For finite flat commutative G/S with unit e, develop the following additional co-Lie API. For an abelian isogeny `f:A→B` with kernel G, put `C_f=Cone(f*:H¹_dR(B/S)→H¹_dR(A/S))`. The Hodge short exact sequences induce the distinguished triangle `ℓ_G→C_f→ℓ_{G^D}^∨[1]→ℓ_G[1]`; its determinant gives `δ_G+δ_{G^D}=div(deg f)` when `deg f=|G|` is regular.

Uses `H¹_dR`.

- `TauCeti.HodgeTate.coLieComplex`: alias of the supplied `ℓ_G = Le_G*L_(G/S)`; prove it is perfect of amplitude `[−1, 0]` and rank zero for finite flat commutative G/S.
- `TauCeti.HodgeTate.coLieComplex_H0`: `H⁰(ℓ_G) = ω_G`.
- `TauCeti.HodgeTate.syntomic_of_finiteLocallyFree`: a finite locally free commutative group scheme is syntomic over S.
- `TauCeti.HodgeTate.coLieDivisor`: `δ_G = Div(ℓ_G)`, with ideal `Fitt₀ ω_G`, when G is generically étale on a schematically dense open.
- `TauCeti.HodgeTate.coLieComplex_triangle`: the triangle `ℓ_{G₃} → ℓ_{G₂} → ℓ_{G₁}` for an exact sequence.
- `TauCeti.HodgeTate.coLieComplex_baseChange`: `ℓ_{G_{S′}} = Lg*ℓ_G` for `S′ → S` (tor-independent because G is flat).
- `TauCeti.HodgeTate.coLieComplex_isogenyKernel`: for `G = ker f`, `ℓ_G ≃ [ω_B →^{f*} ω_A]` and the distinguished triangle `ℓ_G→C_f→ℓ_{G^D}^∨[1]→ℓ_G[1]`, where `C_f=Cone(f*:H¹_dR(B/S)→H¹_dR(A/S))`.

**Checks.**

- `TauCeti.HodgeTate.coLieComplex_mu`: For `μ_{p^n}` over a ring R, `ℓ = [R →^{p^n} R]`: `H⁰ = R/p^n`, and `H^{−1} = R[p^n]` is nonzero when R has p-torsion (for `R = 𝔽_p` both cohomology groups are `𝔽_p`).
- `TauCeti.HodgeTate.coLieComplex_etale`: For an étale G, `ℓ_G = 0` and `δ_G = 0`.
- `TauCeti.HodgeTate.coLieComplex_alphaP`: For `α_p` over `𝔽_p`, `ℓ = [𝔽_p →^{0} 𝔽_p]`: `H⁰ = H^{−1} = 𝔽_p`, so `δ` is undefined (`α_p` is nowhere generically étale over `𝔽_p`) although ℓ is perfect of rank zero.
- `TauCeti.HodgeTate.coLieComplex_isogeny_mulP`: For `f = [p]` on an abelian scheme of dimension g over `ℤ_p`, `ℓ_{A[p]} = [ω_A →^{p} ω_A]` and `δ_{A[p]} = (p^g)`; with `δ_{A[p]^D} = (p^g)`, the sum is `div(p^{2g}) = div|A[p]|`. For an elliptic E, `H⁰(C_[p])=(ℤ_p/p)²`; the cone triangle has two outer terms with `H⁰=ℤ_p/p`, whereas a triangle with just one co-Lie term would lose a copy.

Sources: [FAR10], §1.1, pp. 3–4; §1.2, p. 4; §2, Def. 3 and the paragraph before it, pp. 6–7; §2, Lem.s 1–2, pp. 7–8; [SCH15], §III.2.1, Thm. III.2.1 and its proof, p. 31.

*Needs:* [0.1](#section-0-1); `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality`; `AlgebraicGeometry.Scheme.relativeDifferentials`; `AlgebraicGeometry.Scheme.Modules.fittingIdeal`; `AbelianSchemesAndArithmeticModuli` A3.5; `AbelianSchemesAndArithmeticModuli` A4.2; `AbelianSchemesAndArithmeticModuli` A4.3; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1.11; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.6.6; DerivedModuleAlgebra §0.4 (the full cotangent complex); DerivedModuleAlgebra §0.8 (the cotangent transitivity triangle); DerivedModuleAlgebra §0.10 (derived base change of the cotangent complex); DerivedModuleAlgebra §0.13 (regular quotients and two-term models).

<a id="section-0-27"></a>

### 0.27 The Verschiebung of an abelian scheme

For abelian A over any `𝔽_p`-scheme S use biduality and Frobenius-twist duality. The finite-level identification uses the Weil pairing; naturality is `φV_A=V_Bφ^{(p)}`, including polarizations. The cotangent determinant is 0.14's Ha.

- `TauCeti.HodgeTate.abelianVerschiebung`: `V_{A/S} := (F_{A^∨/S})^∨`: `A^{(p)} → A`.
- `TauCeti.HodgeTate.abelianVerschiebung_comp_frobenius`: `V ∘ F = [p]` and `F ∘ V = [p]`.
- `TauCeti.HodgeTate.abelianVerschiebung_torsion`: on `p^n`-torsion, V restricts to the Verschiebung of `A[p^n]` of R07.1.1.
- `TauCeti.HodgeTate.abelianVerschiebung_eq_groupVerschiebung`: agreement with the semi-abelian Verschiebung of `ShimuraCompactifications` C4 for the smooth group A.
- `TauCeti.HodgeTate.abelianVerschiebung_baseChange`: compatibility with `S′ → S` and with homomorphisms and polarizations.
- `TauCeti.HodgeTate.abelianVerschiebung_cotangent`: V* on `ω_A` reduces to V* on `ω_{A[p]} = ω_A/p`.

**Checks.**

- `TauCeti.HodgeTate.abelianVerschiebung_ordinaryCurve`: For an ordinary elliptic curve over `𝔽̄_p`, `ker V ≅ ℤ/p` is étale and V* is an isomorphism on `ω`; for a supersingular one `ker V = ker F^{(p)} ≅ α_p` and `V* = 0` on `ω`.
- `TauCeti.HodgeTate.abelianVerschiebung_degree`: `deg V_{A/S} = p^g`, so ker V has order `p^g`; V is not an isomorphism for `g ≥ 1`.
- `TauCeti.HodgeTate.abelianVerschiebung_kernels`: For an ordinary elliptic curve over `𝔽̄_p`, `ker F ≅ μ_p` is connected while `ker V ≅ ℤ/p` is étale, so V is not the Frobenius of a twist; a definition of V that ignored the duality fails this test.

Sources: [SCH15], §3.2.1, before Lem. 3.2.5, p. 33; [FAR11], §2.2.3, Rem. 1, p. 10.

*Needs:* `AbelianSchemesAndArithmeticModuli` A3.5; `AbelianSchemesAndArithmeticModuli` A3 (dual isogeny and cartier kernel); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1.1; `ShimuraCompactifications` C4 (semiabelian hasse boundary comparison); [0.1](#section-0-1).

<a id="section-0-28"></a>

### 0.28 Quotients of truncated Barsotti–Tate groups by subgroups of the p-torsion

`FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1.20a supplies the quotient of a p-divisible group by a finite flat subgroup over a complete DVR of mixed characteristic `(0,p)`. This section owns the general-base extension for finite flat subgroups of the p-torsion and the resulting truncated quotients.

Prove `TauCeti.HodgeTate.truncatedQuotient`. For height-h dimension-d p-divisible H/S, `n≥2`, `G=H[p^n]`, and finite flat `D⊂G[p]`, set `p^{−a}D=[p^a]⁻¹D⊂G[p^{a+1}]`, `1≤a<n`. Prove `0→G[p^a]→p^{−a}D→D→0`, with order `p^{ah}|D|`. H/D is p-divisible of the same height and dimension, and `p^{−a}D/D=(H/D)[p^a]`. The cokernel of `ω_{H/D}→ω_H` is `ω_D`; over `O_C` use 0.25's conormal reductions. In characteristic p, for `D=ker F`, Frobenius gives `p⁻¹D/D≅G[p]^{(p)}`, hence `detω_{p⁻¹D/D}≅(detω_{G[p]})^{⊗p}` carrying Ha to its p-th tensor power. Over `O_C` this holds modulo `p^{1−w}` whenever `0≤w<1` and D reduces there to `ker F`.

**Checks.**

- For `H = μ_{p^∞} ⊕ ℚ_p/ℤ_p` and `D = μ_p`, `H/D ≅ μ_{p^∞} ⊕ ℚ_p/ℤ_p` via p on the first factor, and `p^{−1}D/D = (H/D)[p]` has height 2 and dimension 1.
- For `D = 0`, `p^{−a}D/D = G[p^a]`; for `D = G[p]`, `p^{−a}D/D = G[p^{a+1}]/G[p] ≅ G[p^a]` through multiplication by p.
- For E supersingular over `𝔽̄_p` and `D = ker F = α_p ⊂ E[p]`, `p^{−1}D/D ≅ E[p]^{(p)}`, again supersingular: its Hasse invariant is `Ha(E[p])^{⊗p} = 0`.

Sources: [FAR11], §7.4, Thm. 5 and its proof, pp. 37–38; §7.5, proof of Thm. 6, pp. 38–39.

*Needs:* [0.1](#section-0-1); [0.22](#section-0-22); [0.25](#section-0-25); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1.20a; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1.5; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1.10; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1.14; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1.1; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.2.21.

## Layer 1: Period rings and relative comparison

<a id="section-1-1"></a>

### 1.1 The relative de Rham comparison for abelian schemes

Establish `TauCeti.HodgeTate.abelianRelativeComparison`. For finite `K/ℚ_p`, smooth adic X/K and algebraizable abelian `f:A→X`, let `V=R¹f_*ℚ_p`, `H=H¹_dR(A/X)`. Supply the canonical filtered horizontal `V⊗OB_dR≅H⊗OB_dR`, natural and compatible with tensors, duals and cup/Weil pairings and their twists, from PadicHodgeTheory §7.3. Use the horizontal lattices `M=V⊗B_dR⁺`, `M₀=(H⊗OB_dR⁺)^{∇=0}` in their common localized module. At points `V=Hom(T_pA,ℚ_p)=V_pA^∨(−1)`; the homology cyclotomic weight is +1. Base extend to C after forming the finite-K comparison.

**Checks.**

- For X a point and `A = E` an elliptic curve over K, the comparison reduces to the de Rham comparison of `V_pE` (PadicHodgeTheory §8.3 (abelian variety hodge tate weights)).

Sources: [CS17], §2.2, Thm. 2.2.2 and Prop. 2.2.3, pp. 13–15.

*Needs:* `PadicHodgeTheory` §7.3 (de rham pair derived pushforward); `PadicHodgeTheory` §8.3 (abelian variety hodge tate weights); `CohomologyComparisons` §0.4 (twist frobenius filtration normalization); `ClassicalAdicEtaleCohomology` §§1.1–1.4, 8.2, 11.1–11.2 (tate twists); `AbelianSchemesAndArithmeticModuli` A4; `AdicEtaleGeometry` A1 (pro etale site corrected); `PerfectoidSpaces` P0 (almost basic setup); `AbelianSchemesAndArithmeticModuli` A4 (abelian h1 de rham).

<a id="section-1-2"></a>

### 1.2 The graded comparison is the Hodge–Tate map of Layer 0

Establish `TauCeti.HodgeTate.hodgeTateGradedComparison`. In the degree-one abelian comparison, define the ascending cohomological Hodge–Tate filtration on `gr⁰M=V⊗Ô_X` by `F_{−j}=(M∩t^jM₀)/(tM∩t^jM₀)`. CS17 Corollary 2.2.4 identifies `gr^j_HT(V⊗Ô_X)` with `gr^j_Hodge(H)⊗Ô_X(−j)`. Dualizing and applying the Weil pairing gives the quotient `T_pA^∨⊗Ô_X→ω_A⊗Ô_X`. Its identification with Layer 0’s character differential, at points of good reduction, at classical points with semistable reduction and in families over the good-reduction locus, is 1.5; it does not use analytic density of ordinary points.

**Checks.**

- For the Tate curve both maps send the class corresponding to `μ_{p^∞}` to 0 and the class of `ℚ_p/ℤ_p` to dt/t.

Sources: [CS17], §2.2, Prop. 2.2.3, Cor. 2.2.4 and Prop. 2.2.5, pp. 14–16; Rem. 4.2.8, p. 47; [CDM12], Thm. 4.13, Rem. 4.14 and Prop. 4.15, pp. 27–29.

*Needs:* [1.1](#section-1-1); [0.4](#section-0-4); [0.3](#section-0-3); `PadicHodgeTheory` §7.3 (relative hodge tate filtration); `PadicHodgeTheory` §7.3 (relative hodge tate first step).

<a id="section-1-3"></a>

### 1.3 Hodge tensors under the p-adic comparison

Prove `TauCeti.HodgeTate.hodgeTensorComparison`. Let (G, X) be a Shimura datum of Hodge type with a symplectic embedding G ↪ `GSp(V)` and tensors `(s_α) ⊂ V^⊗` cutting out G, and `A → Sh_K` the induced abelian scheme. The tensors `s_α` define absolute Hodge cycles `s_{α,dR} ∈ ℋ^⊗` and `s_{α,ét} ∈ (V_pA)^⊗` (using homology, the dual of `R¹f_*ℚ_p`, supplied by `AutomorphicBundles` B1), and under the relative comparison of 1.1, `s_{α,ét} ⊗ 1 ↦ s_{α,dR} ⊗ 1`. Consequently the comparison isomorphism and its Hodge–Tate graded piece are compatible with the G-structures, and the resulting rational frame torsors are `G_{ℚ_p}`-torsors.

`AutomorphicBundles` B1 (absolute hodge propagation) supplies Deligne–Blasius–Wintenberger compatibility. Tensors and frames are rational.

**Checks.**

- For `G = GSp(V)` the only tensor is the symplectic form, and the statement is the compatibility of the comparison with the Weil pairing.

Sources: [CS17], §2.3, after Lem. 2.3.6, p. 20.

*Needs:* [1.1](#section-1-1); `AutomorphicBundles` B1 (absolute hodge propagation); `AutomorphicBundles` B1 (hodge tensor realizations); `AutomorphicBundles` B1 (tensor frame torsor).

<a id="section-1-4"></a>

### 1.4 The degree-one Hodge–Tate sequence over an arbitrary C

Prove `TauCeti.HodgeTate.hodgeTateSpectralSequence`. For proper smooth rigid X/C, supply the functorial multiplicative spectral sequence `E₂^{ij}=H^i(X,Ω^j_X)(−j)⇒H^{i+j}_ét(X,ℚ_p)⊗C` and its degree-one five-term sequence `0→H¹(O_X)→H¹_ét(X,ℚ_p)⊗C→H⁰(Ω¹_X)(−1)→^{d₂}H²(O_X)`. For dimension-g abelian A, the two Hodge terms have dimension g and étale H¹ dimension 2g, so d₂ vanishes. Using `H¹(O_A)=Lie(A^∨)`, `H⁰(Ω¹_A)=ω_A` and `T_pA^∨=H¹_ét(A,ℤ_p)(1)`, obtain `0→Lie(A^∨)⊗C(1)→T_pA^∨⊗C→ω_A⊗C→0`. The A/dual sequences are dual under the Weil pairing into `ℤ_p(1)`. Descent of A and its morphisms to complete discretely valued K gives `Gal(C/K)`-equivariance; no descent is needed for the sequence itself.

All-degree degeneration belongs to `CohomologyComparisons` §2.15 (hodge tate degeneration); degree one here follows by dimension count.

**Checks.**

- For a principally polarized elliptic curve, `T_pE×T_pE→T_pμ_{p∞}=ℤ_p(1)`; the inverse twist belongs to the dual cohomological convention.

- For an elliptic curve E over C, the sequence reads `0 → C(1) → T_pE ⊗ C → C → 0` after choosing a basis of `ω_E`, with the line of the connected part as the first term when E has ordinary good reduction.
- For `X=Spa(C,O_C)`, every term of the degree-one five-term sequence is zero; the separate degree-zero comparison is `C≅C`; for `X = ℙ¹` (not an abelian variety) `H¹` vanishes and `E₂^{0,1} = H⁰(Ω¹) = 0`, so the degree-one statement is vacuous.
- For `A = E` with good supersingular reduction, the quotient `T_pE^∨ ⊗ C → ω_E ⊗ C` is surjective, although the integral map `T_pE^∨ ⊗ O_C → ω_E` is not: its cokernel is nonzero (its reduction modulo p is the cokernel of the Hodge–Tate map of `E[p]`, nonzero at positive Hasse height) and is only bounded, being killed by `p^{1/(p−1)} (0.5)`. The rational statement does not see the integral defect.

Sources: [CDM12], Thm. 3.20 and Rem. 3.21, p. 20; proof of Thm. 3.20 and Prop. 3.23, p. 21; Prop. 4.10, p. 26.

*Needs:* `PadicHodgeTheory` §2.7 (early primitive comparison and finiteness); `PadicHodgeTheory` §2.4 (geometric hodge tate direct images); `AbelianSchemesAndArithmeticModuli` A3.5; `AbelianSchemesAndArithmeticModuli` A4.2; `AbelianSchemesAndArithmeticModuli` A4.3; `AbelianSchemesAndArithmeticModuli` A4 (p divisible group); `ClassicalAdicEtaleCohomology` §§1.1–1.4, 8.2, 11.1–11.2 (tate twists).

<a id="section-1-5"></a>

### 1.5 The relative Hodge–Tate quotient is the character differential

Prove `TauCeti.HodgeTate.relativeHodgeTate_eq_character`. For 1.1's finite-K algebraizable abelian family, let `q:T_pA^∨⊗Ô_X→ω_A⊗Ô_X` be 1.2's quotient. At good-reduction geometric `Spa(C_x,C_x⁺)`-points, q is 0.4's character differential of the integral dual p-divisible group, linearized over `C_x`. At classical points it is 0.18's Raynaud quotient. These classical values determine q uniquely as an `Ô_X`-linear map. If A extends to 𝒜 over a formal model of open U, then on every affinoid perfectoid `Spa(R,R⁺)` of `U_proét` trivializing the Tate module, q is the R-linearized character differential of `𝒜^∨[p^∞]_{R⁺}`.

Uses `A_x`.

**Checks.**

- For the Tate curve over the punctured disc, q sends the class of `μ_{p^∞}` to 0 and the class of `ℚ_p/ℤ_p` to dt/t, matching 0.18 at classical points.
- For a constant family `A = X × A₀` with A₀ of good reduction, q is the constant extension of the character differential of A₀.
- Uniqueness uses the vanishing of sections of `Ô(−1)` over X defined over the finite extension K: after base change to C a choice of Tate basis identifies `Ô(−1)` with `Ô`, and the argument of (3) no longer applies, which is why (3) is stated over K.

Sources: [CDM12], Prop. 4.15 and its proof, pp. 28–29; [SCH13], Prop. 6.16, p. 39; [CS17], Rem. 4.2.8, p. 47.

*Needs:* [1.2](#section-1-2); [1.4](#section-1-4); [0.4](#section-0-4); [0.18](#section-0-18); `PadicHodgeTheory` §7.3 (relative hodge tate filtration); `PadicHodgeTheory` §§2.1–2.4 (de rham period sheaf); `PadicHodgeTheory` §§2.1–2.4 (graded de rham period sheaf tate twist).

## Layer 2: Hodge–Tate exact sequence and torsors

<a id="section-2-1"></a>

### 2.1 The p-level tower of a Shimura datum at fixed tame level

For pure `(G,X)` with `ShimuraVarieties` Layer 8's canonical models, level maps and minimal compactifications (abelian type: Layers 6 and 8 (abelian instance)), fix p, `ι:E→C`, compact open `K^p`, and write `ι_∞:E↪ℂ` for the distinguished reflex-field inclusion. Set `S_{K_p}=(Sh_{K^pK_p}⊗_{E,ι}C)^ad`, similarly S*. All compact open p-levels form a nonempty cofiltered inclusion poset by intersections. A field isomorphism `σ:C≅ℂ` with `σ∘ι=ι_∞` exists iff C has continuum cardinality: extend the identification of the embedded number field to algebraic closures using transcendence bases. No finite-field descent of the C-tower is asserted.

Uses `E_v`.

- `ShimuraTower.pLevel`: The functor `K_p ↦ S_{K_p}` on compact open subgroups of `G(ℚ_p)`, for fixed (G, X), `K^p`, C and `ι`.
- `ShimuraTower.pLevelMin`: The minimally compactified tower `K_p ↦ S*_{K_p}` with its finite extended level maps.
- `ShimuraTower.toMin`: The open immersion of towers `S_{K_p} → S*_{K_p}`, with complement the boundary, natural in `K_p`.
- `ShimuraTower.transition_finite`: Every transition map is finite; on the open tower it is finite étale when `K^pK_p` is neat.
- `ShimuraTower.transition_comp`: `π_{K″_p,K_p} = π_{K′_p,K_p} ∘ π_{K″_p,K′_p}` and `π_{K_p,K_p} = id`.
- `ShimuraTower.points_eq_doubleCoset`: For a field isomorphism `σ:C≅ℂ` satisfying `σ∘ι=ι_∞`, `S_{K_p}(C) ≅ G(ℚ) ∖ (X × G(𝔸_f)/K^pK_p)` by transport to the complex canonical model at `ι_∞`, compatibly with transition maps.
- `ShimuraTower.reindex`: Restriction along a cofinal family of levels (an initial functor into `CO_p`) does not change the limits formed from the tower.

**Checks.**

- For a CM torus, transport through an isomorphism whose restriction to E differs from `ι_∞` can change the CM type. Its complex points belong to the conjugate datum; the displayed uniformization of the fixed datum uses `σ∘ι=ι_∞`.
- For finite discrete G, every subgroup is compact open. For discrete `(ℤ,+)` only the trivial subgroup is compact open, since compact subsets are finite. For `(ℝ,+)` no compact open subgroup exists: connectedness makes an open subgroup the whole noncompact group.

- `ShimuraTower.pLevel_gl2_components`: For `GL_2`, `K^p = K(N)^p` with `N ≥ 3` prime to p and `K_p = K(p^m)`, `S*_{K_p}` has `φ(Np^m)` connected components, each the analytification of the connected complete modular curve `X(Np^m`, `ζ)_C` with a fixed primitive Weil-pairing value `ζ`. Their disjoint union is the full-basis modular curve `X_full(Np^m)_C` of TauCetiRoadmap ModularCurves; `X_full` is not the name of one component.
- `ShimuraTower.pLevel_gl2_transition_degree`: For `GL_2`, `N ≥ 3` and `m ≥ 1`, the map `S_{K(p^{m+1})} → S_{K(p^m)}` is finite étale of degree `p⁴ = [K(p^m) : K(p^{m+1})]`; no element of `K(p^m)` outside `K(p^{m+1})` acts trivially, because `−1 ∉ K(N)^p`.
- `ShimuraTower.pLevel_torus`: For a torus datum (T, {h}) every term is the finite set `T(ℚ)\T(𝔸_f)/K^pK_p` of C-points, viewed as a zero-dimensional adic space, and the transition maps are surjective.
- `ShimuraTower.pLevel_not_base_change`: For `GL_2` the tower over C is not the base change of a tower of geometrically connected spaces over `ℚ_p`: the component set `(ℤ/Np^m)^×` carries the cyclotomic Galois action, so a component is defined only over `ℚ_p(ζ_{Np^m})`.

- The `GL_2` component count and transition degree tests hold with the stated neatness assumption `N ≥ 3`.
- Restricting to a cofinal family of levels, for instance the principal congruence subgroups of a fixed integral model, gives a canonically isomorphic limit (`ShimuraTower.reindex`).

Sources: [MILNE-SV], §5, 'Passage to the limit', Thm. 5.28 and Rem. 5.29, p. 65; §14, 'General Shimura varieties' and the following Aside, p. 128 (reflex-field embedding and conjugation); [CS17], §2.1, Thm. 2.1.2, p. 11.

*Needs:* `ShimuraVarieties` Layer 8 (level tower); `ShimuraVarieties` Layer 8 (finite level maps); `ShimuraVarieties` Layer 8 (minimal descent); `ShimuraVarieties` Layer 8 (minimal map extension); `ShimuraVarieties` Layer 8 (abelian instance); `ShimuraVarieties` Layer 1 (analytic points); `AdicSpacesPartII` R1 (analytification functor); `AdicSpacesPartII` R1 (analytification finite); `AdicSpacesPartII` R1 (analytification etale smooth); `CategoryTheory.IsCofiltered`; `CategoryTheory.Functor`.

<a id="section-2-2"></a>

### 2.2 The right action of `G(ℚ_p)` and the prime-to-p Hecke translations on the p-level tower

In 2.1 base change/analytify all right translations `g∈G(ℚ_p)`, complex formula `[x,a]↦[x,ag]`, including minimal extensions. They are C-linear, unlike SCH15's cyclotomic-base action. Prime-to-p translations conjugate tame level and commute with them.

- `ShimuraTower.translate`: `T_g`: `S_{K_p} → S_{g⁻¹K_pg}` for `g ∈ G(ℚ_p)`.
- `ShimuraTower.translate_one`: `T_1 = id`.
- `ShimuraTower.translate_mul`: `T_{gh} = T_h ∘ T_g` (a right action).
- `ShimuraTower.translate_of_mem`: `T_k = id` on `S_{K_p}` for `k ∈ K_p`.
- `ShimuraTower.translate_comm_transition`: `π ∘ T_g = T_g ∘ π` for compatible levels.
- `ShimuraTower.primeToPHecke`: Translations by `h ∈ G(𝔸_f^p)`, commuting with every `T_g` and every transition map.
- `ShimuraTower.quotientAction`: For `K′_p` normal in `K_p`, the action of `K_p/K′_p` on `S_{K′_p}` over `S_{K_p}`.

**Checks.**

- `ShimuraTower.translate_mul_order`: For non-commuting g, `h ∈ GL_2(ℚ_p)`, `T_{gh} = T_h ∘ T_g`, and on C-points `T_{gh} ≠ T_g ∘ T_h` in general: the action is a right action.
- `ShimuraTower.translate_center_gl2`: For `GL_2`, `K^p = K(N)^p` with `N ≥ 3` prime to p, and `z = p·1 ∈ Z(ℚ_p)`, the translation `T_z` on `lim_{K_p} S_{K_p}(C)` equals translation by the prime-to-p scalar `p⁻¹`; it is the identity exactly when `p ≡ 1 mod N`.
- `ShimuraTower.translate_trivial_subgroup`: For the datum (`𝔾_m`, {norm}) with X a point, p odd, `K^p = Ẑ^{p×}`, `K_p = ℤ_p^×` and `K′_p = 1 + pℤ_p`: `S_{K′_p} = 𝔽_p^×/{±1}`, and quotientAction of `K_p/K′_p = 𝔽_p^×` is translation whose trivially acting subgroup is {±1}, the image of `ℚ^× ∩ K^pK_p`.

- The order test distinguishes the right action from the left action `T_g ∘ T_h`.
- The GL₂ centre test detects the prime-to-p congruence condition controlling triviality of this scalar. General action-kernel descriptions remain PerfectoidShimuraVarieties S0's targets.

Sources: [MILNE-SV], §5, 'Passage to the limit', Rem. 5.29(b)–(c), p. 65.

*Needs:* [2.1](#section-2-1); `ShimuraVarieties` Layer 8 (translation laws); `ShimuraVarieties` Layer 8 (minimal map extension); `ShimuraVarieties` Layer 1 (right translation); `MulAction.toPermHom`.

<a id="section-2-3"></a>

### 2.3 The infinite-level Shimura diamond `S^◇_{K^p,∞}`

In 2.1 form v-sheaf limits over `Spd(C,O_C)`. Projective minimal levels are qcqs with finite transitions (ECD Lemma 11.22); the open tower is the boundary complement. Compact-open continuity follows from finite normal-level quotients. Perfectoid representability is not assumed.

- `ShimuraTower.infiniteLevel`: `S^◇_{K^p,∞} = lim_{K_p} (S_{K_p})^◇` as a v-sheaf over `Spd(C, O_C)`.
- `ShimuraTower.infiniteLevelMin`: `S^{*◇}_{K^p,∞} = lim_{K_p} (S*_{K_p})^◇`.
- `ShimuraTower.infiniteLevel.proj`: The quasicompact quasiseparated projections to each finite level.
- `ShimuraTower.infiniteLevelMin_isSpatial`: `S^{*◇}_{K^p,∞}` is a spatial diamond.
- `ShimuraTower.infiniteLevel_isLocallySpatial`: `S^◇_{K^p,∞}` is a locally spatial diamond, open in `S^{*◇}_{K^p,∞}`.
- `ShimuraTower.infiniteLevel_space_homeo`: `|S^{*◇}_{K^p,∞}| ≅ lim |S*_{K_p}|` and `|S^◇_{K^p,∞}| ≅ lim |S_{K_p}|`.
- `ShimuraTower.infiniteLevel_points`: `S^◇_{K^p,∞}(R, R⁺) = lim S_{K_p}(R, R⁺)` for perfectoid `(R, R⁺)` over `(C, O_C)`.
- `ShimuraTower.infiniteLevel_action`: The induced right action of `G(ℚ_p)`, continuous on compact open subgroups.
- `ShimuraTower.infiniteLevel_quasiProEtale`: At neat level the open projection is separated and quasi-pro-étale; over a strictly totally disconnected perfectoid test space its pullback is represented by an affinoid pro-étale map.
- `ShimuraTower.infiniteLevel_reindex`: Restriction to an initial family of levels gives a canonically isomorphic limit.
- `ShimuraTower.infiniteLevel.lift`: For a v-sheaf Y over `Spd(C, O_C)` with compatible maps `f_K:Y → (S_K)^◇`, there is a unique map `Y → S^◇_{K^p,∞}` with those projections; likewise for the minimally compactified tower.
- `ShimuraTower.infiniteLevel.lift_proj`: The composite of the lifted cone map with `proj_K` equals `f_K`, for every level K.
- `ShimuraTower.infiniteLevel.hom_ext`: Two maps into either limit diamond agree when their composites with all finite-level projections agree.

**Checks.**

- `ShimuraTower.infiniteLevel_torus`: For (`𝔾_m`, {norm}) with X a point and `K^p = Ẑ^{p×}`, `|S^◇_{K^p,∞}|` is the profinite set `lim_{K_p} ℚ^×\𝔸_f^×/K^pK_p = ℤ_p^×/{±1}`, and `ℚ_p^×` acts through `ℚ_p^×/±p^ℤ` by multiplication.
- `ShimuraTower.infiniteLevel_gl2_points`: For `GL_2` and `K^p ⊆ K(N)^p` with `N ≥ 3`, the (C, `O_C)`-points of `S^◇_{K^p,∞}` are the isomorphism classes of elliptic curves E over C with `level-K^p` structure and a trivialisation `α`: `ℤ_p² ≅ T_pE`, the compatible systems of full `level-p^m` structures of the modular-curve moduli interpretation.
- `ShimuraTower.infiniteLevel_not_perfectoid`: The definition does not make `S^◇_{K^p,∞}` perfectoid: along a non-cofinal family with a least element `K_p⁰` the limit is the diamond of the rigid space `S_{K_p⁰}` of positive dimension, which is not representable by a perfectoid space.
- `ShimuraTower.infiniteLevel_least_level`: If the index family has a least element `K_p⁰`, the limit is `(S_{K_p⁰})^◇` itself.

- Over the open tower, the limit of the (C, `O_C)`-points is the set of compatible systems of level structures, as in the `GL_2` test.
- Representability by a perfectoid space is not part of this construction; it is PerfectoidShimuraVarieties S1–S2's theorem about this limit.

Sources: [ECD], §11, Lem. 11.22, p. 63; [CS17], §2.1, Thm. 2.1.2, p. 11; [ECD], §6, Prop. 6.5, p. 29; §7, Lem. 7.19, p. 37; §10, Def. 10.1 and Convention 10.2, pp. 49–50.

*Needs:* [2.1](#section-2-1); [2.2](#section-2-2); `DiamondsAndVStacks` D6 (gluing and the diamond functor); `DiamondsAndVStacks` D6 (etale site comparison); `DiamondsAndVStacks` D5 (limits and finite stage comparisons); `DiamondsAndVStacks` D5 (spatial diamond); `DiamondsAndVStacks` D4 (underlying topological space); `CategoryTheory.Limits.limit`; `CategoryTheory.Functor.Initial.limitIso`; `PerfectoidSpaces` P5 (cofiltered limits of affinoid perfectoid spaces); `DiamondsAndVStacks` D1 (pro etale maps over std base); `DiamondsAndVStacks` D3 (etale and quasi pro etale morphisms of stacks).

<a id="section-2-4"></a>

### 2.4 The Hodge–Tate exact sequence of a p-divisible group over `O_C`

Prove `TauCeti.HodgeTate.pDivisibleHodgeTateSequence`. Let C be a complete algebraically closed extension of `ℚ_p` and G a p-divisible group over `O_C` of height h and dimension d, with Cartier dual `G^D`. Then the sequence `0 → Lie(G) ⊗_{O_C} C(1) → T_pG ⊗_{ℤ_p} C → ω_{G^D} ⊗_{O_C} C → 0` is exact, where the second map is `α_G ⊗ C (0.4)` and the first is the C-linearisation of the dual map `α_{G^D}^∨` twisted by `ℤ_p(1)` through the Cartier pairing `T_pG × T_pG^D → ℤ_p(1)`. Integrally, `α_G ⊗ 1`: `T_pG ⊗ O_C → ω_{G^D}` has cokernel killed by `p^{1/(p−1)} (0.5)` and the composite of the two maps is zero.

**Checks.**

- For `G = μ_{p^∞}`: `0 → C(1) → C(1) → 0 → 0`; for `G = ℚ_p/ℤ_p`: `0 → 0 → C → C → 0`.
- For `G = E[p^∞]` with E elliptic over `O_C`, both outer terms are one-dimensional.

Sources: [CDM12], Thm. 4.13, pp. 27–28; [SW13], §4.3, Prop. 4.3.6, p.39.

*Needs:* [0.4](#section-0-4); [0.5](#section-0-5); [0.3](#section-0-3); [0.25](#section-0-25); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1 (p divisible tate module); `ClassicalAdicEtaleCohomology` §§1.1–1.4, 8.2, 11.1–11.2 (tate twists); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1.

<a id="section-2-5"></a>

### 2.5 The Hodge–Tate sequence of an abelian variety

Prove `TauCeti.HodgeTate.abelianHodgeTateSequence`. Let C be a complete algebraically closed extension of `ℚ_p` and A an abelian variety over C of dimension g. There is a canonical exact sequence `0 → Lie(A^∨)(1) → T_pA^∨ ⊗_{ℤ_p} C → ω_A → 0` (the roadmap's convention, with `Lie(A^∨)(1) := Lie(A^∨) ⊗ C(1)`), functorial in A, compatible with isogenies, with endomorphisms and with polarisations; for A defined over a complete discretely valued `K ⊂ C` it is `Gal(C/K)`-equivariant. Dually, the Hodge–Tate filtration `Lie A ⊗ C(1) ⊂ T_pA ⊗ C` is a Lagrangian subspace for the Weil pairing of any principal polarisation. For A with good reduction it is the sequence of 2.4 for `G = A^∨[p^∞]`; over arbitrary C its rational sequence is 1.4; for A defined over a complete discretely valued `K ⊂ C` the Raynaud character description is 0.18.

**Checks.**

- For E elliptic with ordinary reduction, the filtration is `T_pE^0 ⊗ C`, the line of the connected part.
- Scholze's Lemma 3.3.4 reads the point of the flag variety off this sequence.

Sources: [BHW], §5.3, Rem. 5.15, p. 23; [SCH15], §3.3, Lem. 3.3.4 (arXiv v2, III.3.4), p. 55; [CDM12], Thm. 3.20 and Rem. 3.21, p.20; Prop. 4.15, pp.28–29.

*Needs:* [2.4](#section-2-4); [0.18](#section-0-18); [0.3](#section-0-3); [1.4](#section-1-4); [1.5](#section-1-5); `AbelianSchemesAndArithmeticModuli` A4; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1; `AbelianSchemesAndArithmeticModuli` A3 (dual isogeny and cartier kernel); `AbelianSchemesAndArithmeticModuli` A3 (polarized weil pairing); `AbelianSchemesAndArithmeticModuli` A4 (p divisible group); `AbelianSchemesAndArithmeticModuli` A4 (abelian h1 de rham); `PadicHodgeTheory` §7.3 (relative hodge tate filtration); `PadicHodgeTheory` §7.3 (relative hodge tate first step).

<a id="section-2-6"></a>

### 2.6 The relative Hodge–Tate sequence on the pro-étale site

Prove `TauCeti.HodgeTate.relativeHodgeTateSequence`. Let X/K be smooth adic, with K a finite extension of `ℚ_p`, and let A/X be an algebraizable abelian family as in 1.1. After a chosen base extension to complete algebraically closed C if desired, on the pro-étale site there is a canonical exact sequence `0→Lie(A^∨)⊗Ô_X(1)→T_pA^∨⊗Ô_X→ω_A⊗Ô_X→0`. It specializes at points to the sequence of 2.5, it is the character sequence in the sense of 1.5, and it is compatible with pullback, isogenies, endomorphisms, polarizations and rational defining Hodge tensors.

Require the algebraizable finite-K family of 1.1, then pull back to C. Individual abelian varieties over arbitrary C are 2.5.

**Checks.**

- For the universal elliptic curve over the modular curve, the sequence is `0 → ω^{-1}(1) → T_pE ⊗ Ô → ω → 0`.

Sources: [CS17], §2.2, the relative Hodge–Tate filtration, p. 15.

*Needs:* [2.5](#section-2-5); [1.1](#section-1-1); [1.2](#section-1-2); [1.3](#section-1-3); [1.5](#section-1-5); `AdicEtaleGeometry` A1 (pro etale site corrected); `PerfectoidSpaces` P0 (almost basic setup); `PadicHodgeTheory` §7.3 (relative hodge tate filtration); `PadicHodgeTheory` §7.3 (relative hodge tate first step).

<a id="section-2-7"></a>

### 2.7 The Hodge–Tate filtration as a point of the flag variety

Let Λ be rank-2g symplectic over `ℤ_p` (with specified PEL action/form), A/C abelian, `β:Λ≅T_pA^∨` a similitude frame, and Fl the rank-g quotient Lagrangian Grassmannian. Equivariance uses `γ∈GSp(Λ⊗ℚ_p)` with `γΛ⊂Λ` and the corresponding isogenous pair. For `g=1` the quotient is `ω_A`.

Use ModularCurves §0G's shared finite locally free Grassmannian, universal quotient and base change, and AlgebraicModuliForArithmeticGeometry §1.3's partial flags. The Lagrangian condition cuts out the symplectic locus in this shared Grassmannian.

- `TauCeti.HodgeTate.hodgeTateFlagPoint`: `π_HT(A, β) ∈ Fl(C)`, the Hodge–Tate quotient of `T_pA^∨ ⊗ C` transported by `β`.
- `TauCeti.HodgeTate.hodgeTateFlagPoint_isLagrangian`: The kernel of the quotient is Lagrangian for `ψ`.
- `TauCeti.HodgeTate.plucker`: The Plücker coordinates `s_J` of a rank-g quotient of `Λ ⊗ C`.
- `TauCeti.HodgeTate.lagrangianChart`: `Fl_J = {|s_{J′}| ≤ |s_J| ∀J′}`, for every g-element subset J of {1,…,2g}.
- `TauCeti.HodgeTate.lagrangianChart_cover`: The binomial(2g,g)-indexed `Fl_J` cover Fl; no permutation action of the full integral symplectic group on this family is asserted.
- `TauCeti.HodgeTate.hodgeTateFlagPoint_equivariant`: `π_HT(A′, β′) = γ·π_HT(A, β)` for the isogenous pair attached to `γ`.

**Checks.**

- `TauCeti.HodgeTate.hodgeTateFlagPoint_ordinaryElliptic`: For E with ordinary reduction and `β` adapted to the connected–étale sequence, `π_HT(E, β)` is a `ℚ_p`-rational point of `ℙ¹`.
- `TauCeti.HodgeTate.hodgeTateFlagPoint_grassmannian`: `π_HT(A, β)` is an element of Mathlib's `Module.Grassmannian C (C^{2g}) g` (rank-g quotients), lying in the Lagrangian locus.
- `TauCeti.HodgeTate.lagrangianChart_count`: The chart index set has cardinality binomial(2g,g), hence six for `g = 2`. Lagrangian relations may identify some indexed chart domains; cardinality here concerns indices.
- `TauCeti.HodgeTate.hodgeTateFlagPoint_not_line`: For `g = 1` the kernel line `Lie(A^∨)(1)` is its own symplectic orthogonal and determines exactly the same rank-one quotient point via its kernel. The tautological subbundle is `Lie(A^∨)(1)`, whereas the tautological quotient bundle pulls back to `ω_A`; confusing these bundles gives the wrong twist.
- `TauCeti.HodgeTate.lagrangianChart_not_permuted`: For `g = 1`, `γ = (1 0; 1 1)` sends the unit-disc chart D₀ by `z ↦ z/(z+1)`. Its image contains 0 and `∞` (images of 0 and `−1`), so it is neither D₀ nor `D∞`; the full integral group does not permute the two standard charts.
- For `g = 1`, `Fl = ℙ¹` with coordinates `s_1`, `s_2` and charts `{|s_2| ≤ |s_1|}`, `{|s_1| ≤ |s_2|}`.

Sources: [SCH15], §3.3, the affinoids `Fℓ_J`, p. 58; §3.3, Lem. 3.3.4 (arXiv v2, III.3.4), p. 55.

*Needs:* [2.5](#section-2-5); [0.3](#section-0-3); `Module.Grassmannian`; ModularCurves §0G (relative Grassmannian); `ShimuraData` Layer 3 (compact dual); `PELModuli` M0 (symplectic o lattice); `AlgebraicModuliForArithmeticGeometry` §1.3 (flag bundle).

<a id="section-2-8"></a>

### 2.8 PEL and Hodge-type conditions on the Hodge–Tate filtration

Prove `TauCeti.HodgeTate.pelHodgeType_filtration`. For a characteristic-zero PEL abelian family with its specified rational endomorphism algebra, polarization and determinant type `μ`, the rational Hodge–Tate filtration is stable under that algebra, isotropic for the polarization, and has the prescribed μ-type. Thus its quotient flag lies in the descended PEL flag variety. For Hodge type use the rational defining tensors and rational tensor frames of B1; the filtration on every tensor construction is compatible with those tensors and has type `μ`, hence defines a point of the descended flag variety `G/P_μ`. An integral `Λ` or `G_ℤp` tensor torsor is not inferred from rational Hodge cycles.

**Checks.**

- For the Hilbert family the rational endomorphism action makes the HT kernel an `F⊗C`-submodule, yielding one line in each embedding factor after a splitting extension.
- In the Siegel case the Weil pairing vanishes on the dimension-g HT kernel. A dimension-g subspace with nonzero restricted pairing is rejected by the flag condition.

- For the Siegel datum `Fl_{G,μ}` is the full Lagrangian Grassmannian; for the Hilbert datum it is `Res_{F/ℚ}ℙ¹ ⊗ C = ∏_{τ: F → C} ℙ¹`.

Sources: [CS17], §2.3, Lems. 2.3.6–2.3.7, pp. 19–20.

*Needs:* [2.14](#section-2-14) (opposite-type flag descent); [2.7](#section-2-7); [2.11](#section-2-11); [1.3](#section-1-3); [0.3](#section-0-3); `PELModuli` M0 (determinant condition); `PELModuli` M0 (integral pel datum); `AutomorphicBundles` B0 (hodge parabolic convention); `ShimuraData` Layer 3 (compact dual); `AlgebraicModuliForArithmeticGeometry` §1.3 (flag bundle); `AutomorphicBundles` B1 (hodge tensor realizations); `AutomorphicBundles` B1 (tensor frame torsor).

<a id="section-2-9"></a>

### 2.9 The Hodge–Tate parabolic reduction and its Levi torsor

For a neat Hodge-type Shimura datum with fixed symplectic embedding and induced universal abelian family, use rational tensor frames on the finite-level pro-étale site and 2.14's opposite-type reflex-field flag. P, U and `M=P/U` are algebraic groups, supplied by ReductiveGroups Layers 3 and 7 and 2.14; CS17 gives local nonemptiness. Open-tower pullback is 2.13; perfectoid compactified extension is S3's.

- `TauCeti.HodgeTate.etaleFrameTorsor`: `𝒫_ét` is the `G(ℚ_p)`-torsor of rational tensor-preserving trivialisations `Λ ⊗ ℚ_p ≅ V_pA^∨`.
- `TauCeti.HodgeTate.hodgeTateParabolicReduction`: `𝒫_HT` is the `P_μ`-reduction of `𝒫_ét ×^{G(ℚ_p)} G_Ô` defined by the relative Hodge–Tate filtration.
- `TauCeti.HodgeTate.hodgeTateLeviTorsor`: `ℳ_HT = 𝒫_HT ×^{P_μ} M_μ`.
- `TauCeti.HodgeTate.hodgeTateParabolicReduction_hecke`: Compatible with the finite-level Hecke maps `Sh_{K′} → Sh_K` and with prime-to-p Hecke correspondences.
- `TauCeti.HodgeTate.hodgeTateParabolicReduction_baseChange`: Compatible with base change `C → C′` and with morphisms of Shimura data.

**Checks.**

- `TauCeti.HodgeTate.hodgeTateLeviTorsor_modularCurve`: For the modular curve over C, with a specified determinant/polarization normalization, the Levi torsor frames the two graded lines `(ω^{-1}(1), ω)`. Before a determinant trivialization use `det H¹_dR⊗ω^{-1}(1)` in the first line for prime-to-p Hecke equivariance.
- `TauCeti.HodgeTate.hodgeTateParabolicReduction_torus`: For a torus datum with `μ` central, `P_μ = M_μ = T` and `𝒫_HT = 𝒫_ét ×^{T(ℚ_p)} T_Ô`.
- `TauCeti.HodgeTate.hodgeTateParabolicReduction_not_hodge`: The Hodge–Tate parabolic `P_μ` is opposite to the parabolic stabilising the Hodge filtration (`AutomorphicBundles` B0 (hodge parabolic convention)); using the Hodge filtration's parabolic gives a different reduction whose Levi torsor differs by the inverse of `μ`.
- For the modular curve over C, with a specified determinant/polarization normalization, the Levi torsor frames the two graded lines `(ω^{-1}(1), ω)`. Before a determinant trivialization use `det H¹_dR⊗ω^{-1}(1)` in the first line for prime-to-p Hecke equivariance.

Sources: [CS17], §2.3, before Lem. 2.3.6, p. 19.

*Needs:* [2.14](#section-2-14) (opposite-type flag descent); [2.6](#section-2-6); [2.8](#section-2-8); [2.11](#section-2-11); [1.3](#section-1-3); `TauCeti.Cocharacter.parabolic`; `TauCeti.Cocharacter.levi`; `AutomorphicBundles` B1 (tensor frame torsor); `AdicEtaleGeometry` A1 (pro etale site corrected); TauCetiRoadmap ReductiveGroups Layers 3 and 7; `ShimuraData` Layer 3 (reflex flag descent); `AlgebraicModuliForArithmeticGeometry` §1.3 (flag bundle).

<a id="section-2-10"></a>

### 2.10 Cyclotomic comparison of de Rham and Hodge–Tate Levi torsors

Prove `TauCeti.HodgeTate.deRhamHodgeTateLeviComparison`. For 1.1's rational Hodge-type family, take `ℳ_dR` from `AutomorphicBundles` B1 (filtration reduction), extend to `Ô` on the pro-étale site, and let `𝒯(1)` be the `ℤ_p×`-torsor of Tate bases. Over a stated field defining central `µ:ℤ_p×→M_µ`, identify 2.9's Levi torsor with the comparison supplied by `AutomorphicBundles` B3.HT.7, transported to `ℳ_HT≅ℳ_dR×^{µ,ℤ_p×}𝒯(1)` in the quotient/opposite convention, independent of symplectic embedding and Hecke-equivariant. An associated central weight-a bundle is the de Rham bundle tensored with `Ô(a)`. Retain the determinant local system unless the similitude is trivialized. A C-valued Tate basis gives an underlying untwisted identification with transported linearization, without canonical finite-field descent.

Require a neat Hodge-type datum with fixed symplectic embedding, its induced universal abelian family satisfying 1.1’s algebraizable finite-K hypotheses, and rational frames; define µ after a stated finite extension.

**Checks.**

- Replacing a compatible Tate generator by u times that generator changes the trivialized comparison by µ(u), as in the supplied comparison; a generator-independent untwisted comparison would fail this test.

- For the normalized modular curve the HT graded lines are `ω` and `ω^{-1}(1)`; raw de Rham lines are `ω` and `ω^{-1}`. The μ-weight-one part detects the missing twist.
- For μ-weight zero representations the associated comparison is untwisted. Over a finite `K/ℚ_p` one cannot identify `Ô(1)` with `Ô` canonically; a C-valued Tate basis alone does not establish equivariance.

Sources: [CS17], §2.3, Prop. 2.3.9, p. 21; [BPC25], §4.4.8, pp.67–68; Rem. 4.4.12, p.69; Rem. 4.4.23, p.74.

*Needs:* `AutomorphicBundles` B3.HT.7 (`rationalHTLeviTorsor` and its tensor/action/boundary API); [2.14](#section-2-14) (opposite-type flag descent); [2.9](#section-2-9); [1.1](#section-1-1); [1.2](#section-1-2); [1.3](#section-1-3); `AutomorphicBundles` B1 (filtration reduction); `AutomorphicBundles` B2 (automorphic vector bundles from representations of the centralizer); `AutomorphicBundles` B1 (tensor frame torsor).

<a id="section-2-11"></a>

### 2.11 The Hodge–Tate tensor filtration

For characteristic-zero E and finite-type reductive G/E, define an exact tensor filtration on `Rep_E(G)`: finite, exhaustive, separated, strict, with finite locally free gradeds. Use 2.14's algebraic fpqc splitting and CS17's completed-sheaf frame theorem, without integral or universal étale splitting claims.

- `TauCeti.HodgeTate.ExactTensorFiltration`: The rational Hodge–Tate filtered fiber functor on `Rep_E(G)`, an instance of the filtered fibre functors of 2.14.
- `TauCeti.HodgeTate.ExactTensorFiltration.type`: The type: the conjugacy class of a splitting cocharacter (locally constant on Spec R).
- `TauCeti.HodgeTate.ExactTensorFiltration.splitLocally`: For the algebraic filtered-fiber-functor input, a splitting exists fpqc locally by Ziegler Theorem 3.14. For the Shimura completed-structure-sheaf application use CS17’s separate frame-torsor theorem.
- `TauCeti.HodgeTate.ExactTensorFiltration.frameTorsor`: The `P_μ`-torsor of frames carrying `Fil^•(μ)` to the given filtration.
- `TauCeti.HodgeTate.ExactTensorFiltration.equivFlag`: Filtrations of type µ on the fixed standard underlying fibre functor, with a specified identification of that underlying functor, are represented by `(G/P_μ)(R)` over a field defining µ. For an arbitrary underlying G-torsor use its associated flag bundle; over the reflex field use 2.14's descended opposite-type flag.

**Checks.**

- For `G=G_m`, `µ=0` and `S=ℙ¹`, the fibre functors given by O and O(1) have the same filtration type and are nonisomorphic. The ordinary flag is a point and classifies filtrations only after fixing the underlying fibre functor.

- `TauCeti.HodgeTate.ExactTensorFiltration.gl_grassmannian`: For `G = GL_n` and `μ` of type `(1^r, 0^{n−r})`, filtrations of type `μ` on the specified standard underlying fibre functor are the elements of Mathlib's `Module.Grassmannian R (R^n) (n − r)`.
- `TauCeti.HodgeTate.ExactTensorFiltration.trivial`: For central `μ` and a supplied underlying tensor frame, the weight filtration needs no proper parabolic reduction and its framed torsor is trivial. Without that frame the underlying G-torsor need not be trivial.
- `TauCeti.HodgeTate.ExactTensorFiltration.not_arbitrary_filtration`: A rank-one R-module filtered by a non-direct-summand ideal with nonflat quotient does not satisfy the locally free graded-piece/strict exact tensor-filtration condition; for example `(2)⊂ℤ` at the local prime 2.
- For `G = GL_n` and `μ = (1, …, 1, 0, …, 0)`, an exact tensor filtration of type `μ` on the specified standard underlying fibre functor is a two-step filtration of the standard representation by a direct summand of rank r, and `G/P_μ` is the Grassmannian.

Sources: [ZIE], §3.5, Thm. 3.52, pp.27–28 (reductive case part (iii), p.28); [CS17], §2.3, Lems. 2.3.6–2.3.7, pp. 19–20.

*Needs:* [2.14](#section-2-14) (opposite-type flag descent); `TauCeti.Cocharacter.parabolic`; `TauCeti.Cocharacter.levi`; `Module.Grassmannian`; `AutomorphicBundles` B0 (hodge parabolic convention); `ShimuraData` Layer 3 (filtration parabolic); TauCetiRoadmap ReductiveGroups Layer 1.

<a id="section-2-12"></a>

### 2.12 Hodge–Tate map on the open limit tower

For a neat Hodge-type datum with fixed symplectic embedding and induced universal abelian family, construct `π_HT:S_∞^◇→Fl_{G,µ}^◇` for 2.3's open tower and universal rational frame, using 1.1's relative families and the type-µ filtration. `DiamondsAndVStacks` D2.9 transfers completed pro-étale bundles to v-bundles and analytic bundles on perfectoid test untilts; apply the flag universal property. Keep the reflex-field form; splitting µ/F requires a stated extension. Perfectoidness and compactified extensions are S1–S3's.

- `TauCeti.HodgeTate.openTowerHodgeTateMap`: The v-sheaf morphism determined by the universal relative tensor filtration.
- `TauCeti.HodgeTate.openTowerHodgeTateMap_ext`: Two candidate maps agree if their natural evaluations agree on every perfectoid test object, not merely on geometric points.
- `TauCeti.HodgeTate.openTowerHodgeTateMap_eval`: On each perfectoid test untilt evaluation is the type-μ relative filtration quotient.
- `TauCeti.HodgeTate.openTowerHodgeTateMap_point`: On (C′,C′⁺)-points the map equals hodgeTateFlagPoint with the fixed quotient convention.
- `TauCeti.HodgeTate.openTowerHodgeTateMap_equivariant`: `π_HT` composed with a tower translation equals the induced flag translation composed with `π_HT`, with the chosen left/right dictionary.
- `TauCeti.HodgeTate.openTowerHodgeTateMap_hecke`: Prime-to-p translation between tame levels commutes with `π_HT` and acts trivially on the flag.
- `TauCeti.HodgeTate.openTowerHodgeTateMap_baseChange`: Base extending C and the tower commutes with the map, without choosing a splitting of F beforehand.
- `TauCeti.HodgeTate.openTowerHodgeTateMap_embedding`: Under a Hodge-type Siegel embedding the two period maps commute with the corresponding flag embedding; its construction is independent of that choice.
- `TauCeti.HodgeTate.openTowerHodgeTateMap_continuous`: On underlying spaces `π_HT` induces a continuous `G(ℚ_p)`-equivariant map `|S_∞^◇| → |Fl_{G,μ}|`, where `|S_∞^◇| = lim_{K_p} |S_{K^pK_p}|` by 2.3. For the Siegel datum it sends a point `(A, α)` over `(C′, C′⁺)` to the Hodge–Tate filtration `Lie A ⊂ C′^{2g}`; this is Scholze's Lemma III.3.4 on the complement of the boundary.

**Checks.**

- The adjoint modular datum `G=PGL₂` has a tower as in 2.1–2.3 but has no faithful symplectic H¹ realization; this construction requires Hodge type and does not extend to that datum by the same abelian-family argument.

- `TauCeti.HodgeTate.openTowerHodgeTateMap_modular`: For GL₂, evaluation on a perfectoid test family gives the kernel of the relative quotient to `ω_E`, with the tautological quotient pulling back to `ω_E`.
- `TauCeti.HodgeTate.openTowerHodgeTateMap_torus`: For a central cocharacter the flag is a point, hence the map is its structural morphism regardless of whether the tower has a perfectoid representative.
- `TauCeti.HodgeTate.openTowerHodgeTateMap_hilbertUnsplit`: For the Hodge-type Hilbert G* datum the target is `(Res_{F/ℚ}ℙ¹)^{an,◇}`; an embedding-product identification is asserted only after a specified splitting extension.
- `TauCeti.HodgeTate.openTowerHodgeTateMap_kernelQuotient`: For an elliptic family the kernel line is `ω_E^{-1}(1)` (with determinant normalization), while the quotient is `ω_E`. Substituting the tautological subline for the quotient changes the bundle and twist.
- The elliptic quotient, central-cocharacter and unsplit Hilbert test cases below all evaluate the relative construction on perfectoid test families.
- On a perfectoid representative supplied by PerfectoidShimuraVarieties S2, this morphism is the diamond of S3’s adic period morphism; representability is used only for that realization.

Sources: [CS17], §2.1, Thms. 2.1.2–2.1.3, pp.11–12; §2.3, Lem. 2.3.7 and subsequent frame-to-flag construction, pp.20–21; [BPC25], §4.4.22–4.4.24, pp.73–75; [SCH15], §III.3, Lem. III.3.4, pp. 55–56.

*Needs:* [2.14](#section-2-14) (opposite-type flag descent); [2.6](#section-2-6); [2.8](#section-2-8); [2.9](#section-2-9); [2.7](#section-2-7); [2.3](#section-2-3); [2.2](#section-2-2); `DiamondsAndVStacks` D6 (gluing and the diamond functor); `DiamondsAndVStacks` D2.9; `AlgebraicModuliForArithmeticGeometry` §1.3 (flag bundle); [1.5](#section-1-5).

<a id="section-2-13"></a>

### 2.13 Open-tower Levi pullback and elliptic/Hilbert bundle formulas

Prove `TauCeti.HodgeTate.openTowerLeviPullback`. For a neat Hodge-type datum with fixed symplectic embedding and induced universal abelian family, along Layer 2’s open-tower `π_HT`, the tautological Levi torsor of the Hodge–Tate flag pulls back to `ℳ_HT` on the limit v-sheaf. Hence an associated Levi representation of central μ-weight a pulls back to the finite-level de Rham automorphic bundle tensored with `Ô(a)`, by agreement with the supplied cyclotomic comparison of `AutomorphicBundles` B3.HT.7, with its Hodge/opposite and dual-coefficient dictionary. In the dual-Tate quotient convention the elliptic tautological quotient `𝒪(1)` pulls back to `ω_E`; for the Hodge-type Hilbert G* datum the flag is `(Res_{F/ℚ}ℙ¹)^{an,◇}` and `π_HT*Res_{𝒪_F/ℤ}𝒪(1)≅ω_A` as a `rank-[F:ℚ]` bundle with its `Res G_m`-action. These identifications hold before perfectoid representability; they inherit the transported frame/Hecke linearizations.

**Checks.**

- At an elliptic point with normalized determinant, the quotient line is `ω_E` and the subline is `ω_E^{-1}(1)`.
- After a splitting extension of F the Hilbert `rank-[F:ℚ]` bundle is `⊕_σ𝒪(1)_σ`; before it the restriction-of-scalars bundle is retained.
- For μ-weight a the raw associated bundle formula includes (a); `a=0` is the untwisted special case.

Sources: [CS17], §2.3, Lem. 2.3.8 and Prop. 2.3.9, p.21; [BPC25], §4.4.8, pp.67–68; Rem. 4.4.12, p.69; Rems. 4.4.23–4.4.24, pp.74–75; [BHW], §3.3, (3.2) and Lem. 3.17, pp.12–13; §5.3, Rem. 5.15, p.23; §5.4, Defs. 5.22–5.24 and Prop. 5.25/Rem. 5.28, pp.25–26.

*Needs:* `AutomorphicBundles` B3.HT.7 (`rationalHTLeviTorsor` and its tensor/action/boundary API); [2.14](#section-2-14) (opposite-type flag descent); [2.12](#section-2-12); [2.10](#section-2-10); [2.9](#section-2-9); [2.5](#section-2-5); `AlgebraicModuliForArithmeticGeometry` §1.3 (flag bundle); `AutomorphicBundles` B0 (hodge parabolic convention); `AutomorphicBundles` B2 (automorphic vector bundles from representations of the centralizer); `HilbertModularVarietiesAndShimuraCurves` H2; `HilbertModularVarietiesAndShimuraCurves` H4; `DiamondsAndVStacks` D2.9; `HilbertModularVarietiesAndShimuraCurves` H4 (hybrid full level); `HilbertModularVarietiesAndShimuraCurves` H4 (geometric full level); `HilbertModularVarietiesAndShimuraCurves` H4 (integral gamma0); `HilbertModularVarietiesAndShimuraCurves` H4 (adjugate level action).

<a id="section-2-14"></a>

### 2.14 Filtered fibre functors: splittings, type and the filtration parabolic

Prove `TauCeti.HodgeTate.filteredFiberFunctor_split`. For a Tannakian category 𝒯/k (including `Rep_k(G)` for finite-type affine G), and k-scheme S, let φ be an exact k-linear tensor fibre functor to finite exhaustive separated decreasing QCoh filtrations with quasi-coherent graded pieces. Morphisms are tensor morphisms; a splitting is graded γ with `φ=fil∘γ`. Prove fpqc-local splitting; `Spl(φ)` is a torsor under `U(φ)`, the filtration automorphisms trivial on gr. The stabilizer P surjects onto the graded automorphism group L with kernel U, so `P/U≅L`. P is flat, and P and U are smooth when the underlying tensor automorphism group is smooth. If that group is reductive, P is parabolic with unipotent radical U; a splitting χ gives Levi `Cent(χ)`, `Lie P=⊕_{w≥0}Lie(G)[χ=w]`, and splittings correspond to Levis. With a tensor generator, equality of cocharacter type is equivalent to fpqc-local isomorphism; functors fpqc-locally isomorphic to a fixed filtered functor φ classify `Aut^⊗(φ)_{S′}`-torsors. Filtrations of type µ on a specified standard underlying fibre functor give `G/P_µ`; an arbitrary underlying G-torsor gives its associated flag bundle. Reindex by `F_j=Fil^{−j}` for 2.11.

Construct `TauCeti.HodgeTate.hodgeTateFlagDescent`. For a pure Shimura datum with reflex field E, the Galois-stable conjugacy class of µ defines the opposite parabolic type `t_HT=type(P(µ))`. Apply ShimuraData §3.8's `parabolicTypeVariety` construction to this type, using ReductiveGroups Layers 7–8 for representability and AutomorphicBundles B0.3 for the Hodge/opposite and coset dictionary. This gives the projective E-scheme `Fl_HT=Par_{t_HT}(G_E)` with its universal parabolic, arbitrary-base-change comparison and effective descent. Over a field L defining µ its orbit map identifies it with `G_L/P(µ)`. ShimuraData §3.9 instead supplies `Par_{type(P(µ⁻¹))}`. No G-equivariant identification of the two flags is asserted without an explicit opposition or duality map.

Splitting is fpqc-local; inseparable extensions can be necessary over imperfect fields.

**Checks.**

- For GL₂ the descended HT flag is `ℙ¹`; for a torus it is `Spec E`, compatible with base change.
- After splitting a unitary datum of homological signature `(1,2)`, in its GL₃ factor take `µ(t)=diag(t,1,1)`: `P(µ)` stabilizes the weight-one line, while `P(µ⁻¹)` stabilizes the weight-zero plane. They are different G-equivariant flag types; choosing a dual representation is additional data.
- For the nonsplit quaternion Shimura curve the descended opposite-type flag is the quaternion conic; it has no E-point when E=ℚ and becomes `ℙ¹` over a splitting field.

- For `G = GL_n` and `φ` the filtration `0 ⊂ W ⊂ k^n` on the standard representation (W of dimension r, extended to all representations by tensor operations), `P(φ)` is the stabilizer of W, `U(φ) = Hom(k^n/W, W)` and `L(φ) = GL(W) × GL(k^n/W)`; the splittings are the complements of W.
- For the trivial filtration (concentrated in degree `0) P(φ) = Aut^⊗(forg∘φ`), `U(φ)` is trivial and the splitting is unique.
- Over `S = ℙ¹ = GL₂/B` with the tautological filtration `O(−1) ⊂ O²` on the standard representation, `φ` splits Zariski locally (on the two standard charts) but not globally, since the extension `0 → O(−1) → O² → O(1) → 0` is non-split.

Sources: [MILNE-SV], Lem. 12.1 and Def. 12.2, pp.111–112; Conrad, *Reductive group schemes*, Corollaries 5.2.8–5.2.9, pp.155–157 (the parabolic-type scheme); [ZIE], §3.2, Def. 3.4, p. 15; §3.3, Thms. 3.14–3.15, p. 17; §3.3, Lem. 3.23, p. 18; §3.5, Thm. 3.52, pp. 27–28.

*Needs:* `ShimuraData` §§3.8–3.9 (`parabolicTypeVariety` and Hodge compact-dual descent); `AutomorphicBundles` B0.3; TauCetiRoadmap ReductiveGroups Layers 7–8; TauCetiRoadmap ReductiveGroups Layer 1 (representations and Tannakian reconstruction); TauCetiRoadmap ReductiveGroups Layer 7 (parabolic and Levi subgroups); `TauCeti.Cocharacter.parabolic`; `TauCeti.Cocharacter.levi`; `Module.Grassmannian`.

## Layer 3: Canonical subgroups with quantitative bounds

<a id="section-3-1"></a>

### 3.1 The Hasse valuation and Hasse neighbourhoods

For truncated BTs set `w=min(v(Ha),1)`. Over p-complete flat bases containing `p^ε`, `0≤ε<1`, use the section chart `uH̃a=p^ε` of the blowup of `(H̃a,p^ε)`, removing p-torsion and normalizing by 3.11. Hilbert uses total Hasse (H2/C6); Siegel/PEL uses Layer 0; BT₁ duality is R07.2's.

- `TauCeti.HodgeTate.hasseValuation`: `Ha(G) ∈ [0, 1]` for a truncated BT group over `O_K`.
- `TauCeti.HodgeTate.hasseValuation_dual`: `Ha(G^D) = Ha(G)`.
- `TauCeti.HodgeTate.hasseValuation_eq_zero_iff`: `Ha(G) = 0` iff G is ordinary.
- `TauCeti.HodgeTate.hasseNeighbourhood`: `𝔛(ε)`: pairs (f, u) with `u·Ha = p^ε mod p`, modulo `u ∼ u(1 + p^{1−ε}h)`.
- `TauCeti.HodgeTate.hasseNeighbourhood_generic`: The generic fibre of `𝔛(ε)` is `{|Ha| ≥ |p|^ε}`.
- `TauCeti.HodgeTate.hasseNeighbourhood_mono`: `𝔛(ε) → 𝔛(ε′)` is an open immersion on generic fibres for `ε ≤ ε′`.

**Checks.**

- At a uniformizer π with normalized `v(π)=1`, its truncated valuation is 1; for a Hasse lift with `v(Ha)=1/3`, the height is `1/3`, strictly between 0 and 1.

- `TauCeti.HodgeTate.hasseValuation_ordinary`: `Ha(μ_{p^∞}[p] ⊕ ℚ_p/ℤ_p[p]) = 0`.
- `TauCeti.HodgeTate.hasseValuation_le_one`: `0 ≤ Ha(G) ≤ 1` for every BT₁ over `O_K` (truncation at 1, because it is computed in `O_K/p`).
- `TauCeti.HodgeTate.hasseNeighbourhood_zero`: 𝒳(0) is the ordinary locus `{|Ha| = 1}`.
- `TauCeti.HodgeTate.hasseNeighbourhood_not_blowup`: `𝔛(ε)` is not the full admissible blow-up of `(H̃a, p^ε)`: the chart where `p^ε` generates is omitted.
- For an ordinary BT₁, `Ha = 0`; for `E[p]` with E supersingular, `Ha(E[p])` `∈` (0, 1].
- 𝒳(0) is the ordinary locus of the generic fibre.

Sources: [FAR11], §2.2.1, p. 7; [SCH15], §3.2.2, Def. 3.2.12, p. 38; §3.2.2, after Lem. 3.2.13, p. 38.

*Needs:* [0.14](#section-0-14); [0.16](#section-0-16); AdicSpacesPartIII R2 (section valuation domain); AdicSpacesPartIII R2 (section domain formal model); `ShimuraCompactifications` C6 (hilbert hasse boundary comparison); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.2 (frobenius verschiebung); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.2 (bt1 hasse invariant); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.2 (bt1 hasse witt duality); `HilbertModularVarietiesAndShimuraCurves` H2 (hilbert hasse ideal); `HilbertModularVarietiesAndShimuraCurves` H2 (hasse formal domains); `ShimuraCompactifications` C6 (hilbert near ordinary model); AdicSpacesPartIII R2 (hasse domain); [3.11](#section-3-11).

<a id="section-3-2"></a>

### 3.2 Lifting subgroups modulo p with explicit error

Prove `TauCeti.HodgeTate.subgroupLifting`. Let R be a p-adically complete flat `ℤ_p^cycl`-algebra, G a finite locally free commutative group scheme over R and `C₁ ⊂ G ⊗_R R/p` a finite locally free subgroup. If, for `H = (G ⊗ R/p)/C₁`, multiplication by `p^ε` on the co-Lie complex `ℓ̌_H` is homotopic to 0 for some `0 ≤ ε < 1/2`, then there is a finite locally free subgroup `C ⊂ G` over R with `C ⊗ R/p^{1−ε} = C₁ ⊗ R/p^{1−ε}`.

**Checks.**

- For `ε = 0` and H étale, C₁ lifts uniquely (H étale means `ℓ̌_H ≃ 0`).

Sources: [SCH15], Cor. III.2.2 and its proof, p. 32; [HALO], Appendix A.1, Prop. A.1, pp. 37–38.

*Needs:* `IsAdicComplete`; `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.6 (illusie obstruction homomorphisms); DerivedModuleAlgebra §§0.4–0.13, 0.25 (square zero deformations).

<a id="section-3-3"></a>

### 3.3 Sections agreeing to high order are equal

Prove `TauCeti.HodgeTate.sectionRigidity`. Let O be a rank-one mixed-characteristic valuation ring containing scalars `p^ε,p^δ`, let R be a p-adically complete O-flat algebra, and `X=Spec A` affine of finite presentation over R with `p^εΩ¹_{A/R}=0`. If two R-sections s,t agree modulo `p^δ` and `δ>ε`, then `s=t`. The same comparison glues on a common affine cover. No smoothness hypothesis or assertion that every section lifts is needed: the theorem compares two sections that already exist.

Use O-flatness and separatedness; on a common affine cover the comparison glues.

Uses `a_k`.

**Checks.**

- Used with `Ω¹` of `A[p^m]/C` killed by `p^ε` to show that two candidate canonical subgroups coincide.

Sources: [SCH15], Lem. III.2.4, p. 32; [HALO], Appendix A.1, Lem. A.2, p. 38.

*Needs:* `IsAdicComplete`; `KaehlerDifferential`.

<a id="section-3-4"></a>

### 3.4 Weak and strong canonical subgroups of level m

Use `CohomologyComparisons` §6.2's shared `smallHasseCanonicalSubgroups` package for an abelian scheme A/R of relative dimension g, with R a p-adically complete flat `ℤ_p^cycl`-algebra and `m≥1`. Here `ℤ_p^cycl` is the completed cyclotomic ring of integers. Choose rational `0≤ε<1/2` with the required fractional powers of p in the base and `Ha(A₁)^{S_m}|p^ε` modulo p, where `S_m=(p^m−1)/(p−1)`. The weak subgroup is independent of ε by the supplied uniqueness. Strong means `Ha(A₁)^{p^m}|p^ε`, sufficient since `S_m≤p^m`. All primes are included. The following names use that same supplied subgroup and API; the additional degree formula and wider pointwise HN ranges are proved in 3.6.

- `TauCeti.HodgeTate.canonicalSubgroup`: `CohomologyComparisons` §6.2's finite flat `C_m ⊂ A[p^m]`, of rank `p^{mg}`, on the weak locus just specified.
- `TauCeti.HodgeTate.canonicalSubgroup_modFrobenius`: `C_m ≡ ker F^m mod p^{1−ε}`, and `C_m` is the unique closed finite locally free subgroup with this property.
- `TauCeti.HodgeTate.canonicalSubgroup_points`: for a p-adically complete `ℤ_p^cycl`-flat R-algebra R′, `C_m(R′) ⊇ {s ∈ A[p^m](R′) | s ≡ 0 mod p^{(1−ε)/p^m}}`, with equality when R′ is integrally closed in `R′[1/p]`.
- `TauCeti.HodgeTate.canonicalSubgroup_degree`: At a rank-one point with `Ha(A[p^m]) < 1/(2p^{m−1}) (p ≥ 5)`, `deg C_m = mg − ((p^m−1)/(p−1))·Ha`.
- `TauCeti.HodgeTate.canonicalSubgroup_isotropic`: `C_m` is maximal totally isotropic for the Weil pairing of a principal polarisation.
- `TauCeti.HodgeTate.canonicalSubgroup_baseChange`: Formation of `C_m` commutes with base change `R → R′` of p-adically complete flat algebras.
- `TauCeti.HodgeTate.canonicalSubgroup_level`: `C_{m′} = C_m[p^{m′}]` for `m′ ≤ m` (strong subgroups).

**Checks.**

- For `p=5,n=1`, `S_n=1`; for `p=2,n=2,w=1/6`, the weak inequality fails at equality, while `w=1/16` satisfies the strong inequality.

- `TauCeti.HodgeTate.canonicalSubgroup_ordinary`: If `Ha(A₁)` is a unit, `C_m = A[p^m]^0 (multiplicative)`.
- `TauCeti.HodgeTate.canonicalSubgroup_ellipticDegree`: For E elliptic over `O_C` with `Ha(E[p]) = w < 1/2` and `p ≥ 5`, `deg C₁ = 1 − w` and `deg(E[p]/C₁) = w`.
- `TauCeti.HodgeTate.canonicalSubgroup_not_constant`: `C_m` is in general not isomorphic to the constant group `(ℤ/p^m)^g` over R: for A ordinary it is multiplicative, `μ_{p^m}^g` étale-locally; only its geometric generic points are `(ℤ/p^m)^g`.
- `TauCeti.HodgeTate.canonicalSubgroup_points_strict`: The printed equality of Corollary 3.2.6 fails over non-normal R′: for `R′ = {(a,b) ∈ O_C² | a ≡ b mod p^{1/(p−1)}}`, A ordinary, `ε = 0`, `s = (ζ_p, 1) ∈ C₁(R′)` is not `≡ 0 mod p^{1/p}`. At `p=2`, this gives `R′={(a,b)∈O_C² : a≡b mod 2}` and `s=(−1,1)`; the quotient `(−√2,0)` of `s−1` by √2 does not lie in R′.
- For A ordinary (Ha a unit) `C_m` is the connected part `A[p^m]^0`, of multiplicative type.

Sources: [SCH15], §3.2.1, Cor. 3.2.6, p. 33, Def. 3.2.7 and Prop. 3.2.8, pp. 34–35; [FAR11], §7.5, Thm. 6, pp.38–39.

*Needs:* `CohomologyComparisons` §6.2 (shared weak/strong subgroup and its API); [3.1](#section-3-1); [0.14](#section-0-14); [0.13](#section-0-13).

<a id="section-3-5"></a>

### 3.5 Hasse height of a supplied Frobenius-congruent quotient

Prove `TauCeti.HodgeTate.pointwiseQuotientHasse`. Let H be a p-divisible group over `O_C`, `p≠2`, `G = H[p²]` with Hasse height `w<1`, `C⊂G[p]` a finite flat subgroup of height dim G, and `E=p^{−1}C/C` the level-one truncated Barsotti–Tate quotient of 0.28. Assume C reduces to ker F modulo `p^{1−w}`. Then `min(Ha(E),1−w)=min(pw,1−w)`. In particular `Ha(E)=pw` for `w<1/(p+1)`, and `Ha(E)≥1−w` for `w≥1/(p+1)`. This statement assumes the subgroup; it proves no canonical-subgroup existence.

**Checks.**

- For `w=0` the supplied Frobenius-congruent quotient has Hasse height zero.
- For `p=5` and `w=1/10` the height is `1/2`; at `w=1/6` only the lower bound `5/6` follows.

Sources: [FAR11], §7.4, proof of Thm. 5, pp.37–38.

*Needs:* [3.1](#section-3-1); [0.28](#section-0-28); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.2.21; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.2 (frobenius verschiebung); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.2 (bt1 hasse invariant); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.2 (bt1 hasse witt duality).

<a id="section-3-6"></a>

### 3.6 Existence, uniqueness and characterisations of canonical subgroups

Assemble `TauCeti.HodgeTate.canonicalSubgroup_theorem` using `CohomologyComparisons` §6.2 for the abelian-family existence, uniqueness and point criterion of 3.4, with exactly its base, fractional-power and ε hypotheses. Prove the additional pointwise statement: for `G=H[p^n]` over `O_C`, H p-divisible of height h and dimension `d<h`, assume `p≥5, w<1/(2p^{n−1})` or `p=3, w<1/3^n`. There is an HN step C with `C(O_C)≅(ℤ/p^n)^d`, `deg(G/C)=S_nw`, `C(O_C)=kerα_{G,n−S_nw}`. For `1≤k≤n`, `C[p^k]` is the corresponding step and reduces to `ker F^k` modulo `p^{1−p^{k−1}w}`; its orthogonal is the dual group's canonical step. For abelian truncations where both constructions apply, identify this HN step with `CohomologyComparisons` §6.2's subgroup as a finite flat subgroup scheme. Indeed `p^{n−1}w≤S_nw≤ε`, so the HN Frobenius congruence implies congruence to `ker F^n` modulo `p^{1−ε}`; the supplied uniqueness gives equality. This comparison uses no point-equality claim over nonnormal test algebras.

**Checks.**

- For E ordinary, `C₁ = E[p]^0 = μ_p` étale-locally and `ker α_{E[p]} = E[p]^0(O_C)`.
- For E with `Ha(E) = 1/4` and `p ≥ 5`, `deg C₁ = 3/4`.
- At `p=5`, `n=2`, `w=1/12`, the HN range holds while `S_nw=1/2` excludes the weak family range; the pointwise subgroup still exists. At `w=1/20`, choose `ε=2/5`: `p^{n−1}w=1/4≤S_nw=3/10≤ε`, so Frobenius-congruent uniqueness identifies the two subgroups.

Sources: [SCH15], §3.2.1, Cor. 3.2.6, p. 33; §3.2.1, proof of Cor. 3.2.6, p. 33; [FAR11], §7.5, Thm. 6, pp.38–39; §7.5, Thm. 6 (7), pp.38–39; §6.5, Thm. 4, p. 32.

*Needs:* `CohomologyComparisons` §6.2 (family subgroup, uniqueness and point criterion); [3.4](#section-3-4); [0.2](#section-0-2); [0.5](#section-0-5); [0.19](#section-0-19); [0.7](#section-0-7); [0.8](#section-0-8); `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.1 (oort tate classification); [3.5](#section-3-5); [0.28](#section-0-28).

<a id="section-3-7"></a>

### 3.7 Levels, functoriality, duality and generic points of canonical subgroups

Record `TauCeti.HodgeTate.canonicalSubgroup_properties` using `CohomologyComparisons` §6.2's strong-family API for the same subgroups of 3.4, with its fractional-power and `0≤ε<1/2` hypotheses. Let R be a p-adically complete flat `ℤ_p^cycl`-algebra and A, B abelian schemes over R; canonical means strong (3.4). (i) If A has a canonical subgroup `C_m` of level m, it has one of every level `m′ ≤ m`, and `C_{m′} = C_m[p^{m′}] ⊂ C_m`. (ii) If f: `A → B` is a homomorphism and both have canonical subgroups of level m, then `f(C_m) ⊂ D_m`; in particular `C_m` is stable under endomorphisms (e.g. an `𝒪_F`-action). (iii) For a principal polarisation `λ`, `C_m` is maximal totally isotropic for the Weil pairing on `A[p^m]`, and pointwise `C_m(O_C)^⊥ ⊂ A^∨`[p^m](O_C) is the canonical subgroup of `A^∨` at every rank-one point (`p ≠ 2`: Fargues 2011, Proposition 11 and Corollaire 1). (iv) If x̄ is a geometric point of Spec `R[1/p]`, `C_m(x̄) ≅ (ℤ/p^m)^g`. (v) Formation of `C_m` commutes with base change `R → R′`.

The geometric generic type and pointwise duality are the additional assertions here, with the stated strong and rank-one hypotheses. The weak level-one group already has type `(ℤ/p)^g`.

**Checks.**

- For A ordinary, `C_m = A[p^m]^0` and `C_m(x̄) = μ_{p^m}^g(x̄) ≅ (ℤ/p^m)^g`.
- At `p=2`, `m=2`, `w=1/7`, the weak condition holds but the strong condition fails; the strong-family API does not follow from the weak bound alone.
- For a principal polarization, an isotropic subgroup of rank `p^{mg}` in `A[p^m]` has the same rank as its annihilator, giving maximal isotropy; rank-one duality identifies the annihilator with the dual canonical subgroup.

Sources: [SCH15], §3.2.1, Prop. 3.2.8(i), p. 34; §3.2.1, Prop. 3.2.8(ii), p. 34; §3.2.1, Prop. 3.2.8(iv), p. 34.

*Needs:* `CohomologyComparisons` §6.2 (strong-family nesting, functoriality, isotropy and base change); [3.6](#section-3-6); [3.4](#section-3-4); `AbelianSchemesAndArithmeticModuli` A3 (dual isogeny and cartier kernel); `AbelianSchemesAndArithmeticModuli` A3 (polarized weil pairing); `AbelianSchemesAndArithmeticModuli` A4 (p divisible group).

<a id="section-3-8"></a>

### 3.8 Quotients by canonical and anticanonical subgroups and the Hasse radius

Assemble `TauCeti.HodgeTate.quotientHasseRadius`. (1) Use `CohomologyComparisons` §6.2's strong quotient package for the same subgroups of 3.4. Let R be a p-adically complete flat `ℤ_p^cycl`-algebra and A/R abelian, with `m₁≥1` and `Ha(A₁)^{p^{m₁}}|p^ε` modulo p for rational `0≤ε<1/2` and the required fractional powers in the base. Then `Ha(A/C_{m₁}) = Ha(A)^{p^{m₁}}` modulo `p^{1−ε}`, and `B := A/C_{m₁}` has a canonical subgroup `D_{m₂}` of level m₂ iff A has one of level `m = m₁ + m₂`; then `0 → C_{m₁} → C_m → D_{m₂} → 0` is exact and compatible with `0 → C_{m₁} → A → B → 0`. (2) (Points, `p ≠ 2.`) For a BT₂ G over `O_C` with `Ha(G) < 1/(p+1)` and C its canonical subgroup of level 1, `Ha(p^{-1}C/C) = p·Ha(G)`; if `1/(p+1) ≤ Ha(G) < 1/2` then `Ha(p^{-1}C/C) ≥ 1 − Ha(G)`. (3) (Anticanonical quotients.) If A′ has a weak canonical subgroup C′ of level 1 on `𝔛(ε)`, `ε < 1/2`, and `D ⊂ A′[p]` is a subgroup of order `p^g` with `D ∩ C′ = 0`, then A′/D has Hasse valuation `Ha(A′)/p`, and `(A′/D)/(A′[p]/D) ≅ A′`: dividing by a canonical subgroup multiplies the Hasse radius by p, dividing by an anticanonical subgroup divides it by p.

Part (1) is the supplied strong-family quotient identity, with `m₂≥1`; parts (2)–(3) are the additional pointwise and anticanonical estimates here.

**Checks.**

- For ordinary E over `O_C`, `E/E[p]^0` is ordinary. Its special-fibre quotient is the Frobenius twist; no mixed-characteristic Frobenius-twist isomorphism is asserted.
- For `p≥5` and `Ha(E)=1/(2p)`, `Ha(E/C₁)=1/2` and `Ha(E/D)=1/(2p²)` for an anticanonical D.
- For ordinary A and `m₁=m₂=1`, part (1) gives `0→μ_p^g→μ_{p²}^g→μ_p^g→0` étale-locally, compatible with the two successive abelian quotients.

Sources: [SCH15], §3.2.1, proof of Prop. 3.2.8(iii), p. 34; [FAR11], §7.4, Thm. 5, p. 37; [SCH15], §3.2.2, Thm. 3.2.15(iii), pp. 39–40; [AIP15], §6.2.1, Prop. 6.2.1.1, p.29.

*Needs:* `CohomologyComparisons` §6.2 (strong quotient package); [3.6](#section-3-6); [3.7](#section-3-7); [3.3](#section-3-3); [3.5](#section-3-5).

<a id="section-3-9"></a>

### 3.9 The Hodge–Tate map of the dual canonical subgroup

Prove `TauCeti.HodgeTate.canonicalSubgroup_hodgeTate`. Let `C/ℚ_p` be complete algebraically closed, `G/O_C` p-divisible of dimension d, and `n≥1`. In the strict FAR11/AIP15 range for `p≥3`, or in the HALO range `w≤p^{−(n+1)}` for every p, let `H_n` be canonical, w the Hodge height and `δ=S_n w`. Then `ω_{G[p^n]}/p^{n−δ}≅ω_{H_n}/p^{n−δ}`. The character map `H_n^D(C)⊗O_C→ω_{H_n}` has cokernel of valuation degree `w/(p−1)`. Its determinant ideal `Hdg_T` satisfies `Hdg_T^{p−1}=Hdg`, and its cokernel is killed by `Hdg_T`. In the FAR11 range `H_n(O_C)` is the kernel of `α_G` truncated at `n−δ`; HALO Proposition A.2 gives the level-one kernel in its own hypotheses. In normal formal families with trivialized dual canonical points, the determinant-ideal and annihilator statements hold on the AIPH/HALO models; their analytic `O⁺` form is obtained through 3.11. The modified-lattice quotient isomorphism is Layer 5’s result, not a raw integral Hodge–Tate isomorphism.

The strict bounds are `w<1/(2p^{n−1})` for `p≥5`, `w<1/3^n` for `p=3`. Formal determinant statements require a normal admissible torsion-free model, invertible Hodge ideal and HALO’s trivialized generic dual quotient.

**Checks.**

- For A ordinary `(w = 0)`, `C_n = A[p^n]^0`, `C_n^D` is étale and `α` identifies `(C_n^D)(O_C) ⊗ O_C/p^n` with `ω_A/p^n (0.11)`.

Sources: [AIP15], §3.2, Prop. 3.2.1, pp.12–13; [FAR11], Prop. 7, pp. 27–29; Thm. 6, pp.38–39; [HALO], Appendix A.2, Cor. A.2(4); A.3, Props. A.2–A.3, pp. 39–41.

*Needs:* [3.6](#section-3-6); [3.7](#section-3-7); [0.5](#section-0-5); [0.11](#section-0-11); [0.2](#section-0-2); [0.22](#section-0-22); [3.11](#section-3-11); `HilbertModularVarietiesAndShimuraCurves` H2 (hilbert hasse ideal).

<a id="section-3-10"></a>

### 3.10 Canonical subgroups of Hilbert–Blumenthal abelian schemes at arbitrary p

Prove `TauCeti.HodgeTate.hilbertCanonicalSubgroup`. For a HBAV A/R on the specified normal admissible Deligne–Pappas/Rapoport Hilbert model, with total Hasse height `w≤ε≤p^{−(n+1)}`, a level-n canonical subgroup `H_n` exists for every p, has integral finite locally free `rank p^{ng}`, is `O_F`-stable, and its geometric generic points are locally free rank one over `O_F/p^n`. The dual canonical generic module has the corresponding invertible `O_F/p^n` type via the polarization ideal. The freeness over `O_F/p^n` is 3.12, not merely `O_F` stability and a `ℤ/p^n rank` count; for `n = 1` at a prime ramified in F it uses the level-two canonical subgroup, so there the radius is `ε ≤ p^{−3}`. Integral `H_n` may be multiplicative and is not identified with a constant group.

Require the normal admissible Hilbert model with invertible total Hasse ideal supporting the HALO/AIPH construction.

Uses `S_nε`.

**Checks.**

- For `F = ℚ`, `C_n ⊂ E[p^n]` is the classical canonical subgroup of the modular curve, cyclic of order `p^n` on geometric generic points.

Sources: [BHW], §5.2, pp. 21–23; §7.1, p. 29; [HALO], Appendix A.2, Cor. A.2(1)–(6), pp. 39–40; [AIPH], §3, Props. 3.2–3.3, p.11 `(`Hilbert_adicfinal.pdf`)`.

*Needs:* [3.4](#section-3-4); [3.6](#section-3-6); [3.7](#section-3-7); [3.1](#section-3-1); [3.12](#section-3-12); `ShimuraCompactifications` C6 (hilbert near ordinary model); `HilbertModularVarietiesAndShimuraCurves` H2 (hilbert hasse ideal); `HilbertModularVarietiesAndShimuraCurves` H2 (hasse formal domains); `ShimuraCompactifications` C6 (hilbert near ordinary model); AdicSpacesPartIII R2 (hasse domain); `HilbertModularVarietiesAndShimuraCurves` H4 (hybrid full level); `HilbertModularVarietiesAndShimuraCurves` H4 (geometric full level); `HilbertModularVarietiesAndShimuraCurves` H4 (integral gamma0); `HilbertModularVarietiesAndShimuraCurves` H4 (adjugate level action).

<a id="section-3-11"></a>

### 3.11 Normal formal models and their analytic integral structure

Prove `TauCeti.HodgeTate.normalFormalModel_plus`. For finite `K/ℚ_p`, admissible (tft, p-torsion-free) formal 𝔛/`O_K`, generic fibre X and specialization `s:(X,O⁺)→𝔛`, prove: if 𝔛 is normal, `s⁻¹Spf A₀=Spa(A₀[1/p],A₀)` and integral sections on affine preimages equal formal sections. Finite locally free E pulls back to locally free `E⁺`, with the same sections on trivializing affines and `E⁺[1/p]=E_η`. A matrix defining `F⊂E`, whose determinant generates invertible 𝔡, gives the same integral columns, `𝔡E⁺⊂F⁺`, adjugate identities, maps and congruences. Assume X is normal. Normalization of 𝔛 in X is finite admissible normal with generic fibre X; normalization in finite étale `Y→X` gives a functorial finite normal formal model of Y. For merely reduced X, normalize in its normalization; the resulting normal formal model has generic fibre the normalization of X. These normalizations commute with étale base change.

Over nondiscretely valued bases no finiteness of normalization is asserted; construct analytic `O⁺` directly on the generic fibre.

**Checks.**

- For `𝔛=Spf ℤ_p⟨U,V⟩/(V²−U³)`, the reduced generic fibre is the nonnormal cusp. Its normalization `Spf ℤ_p⟨T⟩`, `U=T²,V=T³`, has the normalization disc as generic fibre, not the cusp.

- For `𝔛 = Spf ℤ_p⟨T⟩`, X is the closed unit disc and `O⁺(X) = ℤ_p⟨T⟩`.
- For the non-normal model `Spf ℤ_p⟨S`, `T⟩/(S² − p²T)` of the disc `Spa(ℚ_p⟨T′⟩)` with `S = pT′` (so `T = T′²`), the element `S/p = T′` is power-bounded but not in A₀, so `A⁺ ≠ A₀`; its normalization adjoins T′.
- For `E = O_𝔛` and F given by the `1 × 1` matrix (p), `F⁺ = pO⁺` and `𝔡 = (p)`. Congruences modulo `(p,T)` also define integral analytic quotients: `O⁺(X)/(p,T)=𝔽_p`. Invertibility is required for the determinant and adjugate argument, not for integral analytic congruences.

Sources: [AIPH], §3.3.1, p. 11; §4.1, Prop. 4.1 and its proof, pp. 15–16; [BHW], §4, Def. 4.2 and the paragraph before Def. 4.1, p. 15.

*Needs:* AdicSpacesPartIII R2 (admissible formal scheme); AdicSpacesPartIII R2 (generic fibre functor d); AdicSpacesPartIII R2 (admissible blow up); `AlgebraicGeometry.Scheme.Hom.normalization`; `TauCeti.Huber.Pair`.

<a id="section-3-12"></a>

### 3.12 The `𝒪_F`-module structure of Hilbert canonical subgroups

Prove `TauCeti.HodgeTate.hilbertCanonical_OF_free`. Let F be totally real of degree g, A/`O_C` a dimension-g HBAV satisfying `HilbertModularVarietiesAndShimuraCurves` H2's determinant condition with `O_F`-linear 𝔠-polarization, and `O_F⊗ℤ_p=∏_{𝔭|p}O_𝔭` of indices `e_𝔭`, `f_𝔭`. For `n≥1`, let finite flat `O_F`-stable `H⊂A[p^n]` reduce to `ker F^n` modulo some `p^δ`, `δ>0`, and have `H(C)≅(ℤ/p^n)^g`. Prove `T_pA` free rank two over `O_F⊗ℤ_p`. `H(C)`, its ambient quotient and `H^D(C)` are rank-one free over `O_F/p^n` provided `n≥2`, or p unramified, or `H=H′[p^n]` with H′ satisfying the same level-(n+1) hypotheses; the dual identification uses the polarization and Weil pairing. On normal formal Hilbert families with these level hypotheses, the generic `H_n^D` is étale-locally the constant `O_F/p^n`-module scheme.

**Checks.**

- For `F = ℚ`, (2) says that `H(C)` is cyclic of order `p^n`, the classical canonical subgroup of an elliptic curve.
- For `p = 𝔭₁𝔭₂` split in a real quadratic F, `𝒪_F/p = 𝔽_p × 𝔽_p` and A[p](C) `≅ (𝔽_p × 𝔽_p)²`; the `𝒪_F`-stable subgroup A[𝔭₁](C) `= (𝔽_p × 0)²` has group type `(ℤ/p)² = (ℤ/p)^g` but is not free over `𝒪_F/p`; it fails the Frobenius congruence because its 𝔭₂-part is zero while ker F has 𝔭₂-part of order p.
- For `p = 𝔭²` ramified in a real quadratic F with uniformizer `π`, the `𝒪_F/p = 𝔽_p[π]/(π²)-module (𝔽_p[π]/π)²` has group type `(ℤ/p)² = (ℤ/p)^g` but is not free; this is the level-one ambiguity that (2) resolves through the level-two subgroup.

Sources: [AIPH], §3.2, Prop. 3.2, p. 11; [HALO], Appendix A.2, Corollaire A.2 (5)–(6), pp. 39–40; [BHW], §5.3, proof of Prop. 5.18, pp. 24–25.

*Needs:* [0.25](#section-0-25); [3.7](#section-3-7); `HilbertModularVarietiesAndShimuraCurves` H2 (hilbert hasse ideal); `HilbertModularVarietiesAndShimuraCurves` H4 (integral gamma0); `AbelianSchemesAndArithmeticModuli` A3.5.

## Layer 4: Canonical/anticanonical geometry and period estimates

<a id="section-4-1"></a>

### 4.1 Canonical and anticanonical loci at `Γ₀(p^n)-level`

On the Hilbert/Siegel/PEL Γ₀(pⁿ)-tower over `X(ε)`, D is the isotropic level subgroup (Hilbert: in `A^∨[p^n]`, étale-locally `O_F/p^n`). Canonical means `D=C_n` in its existence range; anticanonical means `D[p]∩C₁=0`, needing weak level one. Both loci are open/closed on the finite étale cover; S1 owns the Siegel open-immersion applications.

- `TauCeti.HodgeTate.canonicalLocus`: `X_{Γ₀(p^n)}(ε)_c = {(A, D) : D = C_n}`.
- `TauCeti.HodgeTate.anticanonicalLocus`: `X_{Γ₀(p^n)}(ε)_a = {(A, D) : D[p] ∩ C = 0}`.
- `TauCeti.HodgeTate.anticanonicalLocus_isClopen`: Both loci are open and closed in `X_{Γ₀(p^n)}(ε)`.
- `TauCeti.HodgeTate.anticanonicalLocus_forget`: The forgetful maps `X_{Γ₀(p^{n+1})}(ε)_a → X_{Γ₀(p^n)}(ε)_a`, `(A, D) ↦ (A, D[p^n])`, give the anticanonical tower.
- `TauCeti.HodgeTate.canonicalLocus_section`: `X(ε) → X_{Γ₀(p^n)}(ε)_c`, `A ↦ (A, C_n)`, is an isomorphism (4.2).

**Checks.**

- `TauCeti.HodgeTate.anticanonicalLocus_ordinary`: On the ordinary locus, D is a complement to the connected multiplicative part `A[p^n]^0` and is étale-locally `(ℤ/p^n)^g`. Many complements may exist; D is not asserted equal to a previously chosen complement.
- `TauCeti.HodgeTate.canonicalLocus_modularCurve`: For the modular curve and `n = 1` the two loci partition `X_{Γ₀(p)}(ε)` into the canonical component (degree 1 over `X(ε)`) and the anticanonical component (degree p over `X(ε)`).
- `TauCeti.HodgeTate.anticanonicalLocus_not_complement`: For Hilbert data with several primes above p, 'D different from C' is not `'D ∩ C = 0'`: the anticanonical condition must be imposed at every prime above p.
- For the modular curve and `n = 1`, `X_{Γ₀(p)}(ε) = X_{Γ₀(p)}(ε)_c ⊔ X_{Γ₀(p)}(ε)_a` for every `ε < 1/2` in the range of 3.4 (two subgroups of order p either coincide or meet trivially).

Sources: [BHW], §5.2, p. 21; [SCH15], §3.2.2, Thm. 3.2.15(iii), pp. 39–40.

*Needs:* [3.4](#section-3-4); [3.10](#section-3-10); [3.1](#section-3-1); `HilbertModularVarietiesAndShimuraCurves` H4; `PELModuli` M1 (level structure); `HilbertModularVarietiesAndShimuraCurves` H4 (hybrid full level); `HilbertModularVarietiesAndShimuraCurves` H4 (geometric full level); `HilbertModularVarietiesAndShimuraCurves` H4 (integral gamma0); `HilbertModularVarietiesAndShimuraCurves` H4 (adjugate level action).

<a id="section-4-2"></a>

### 4.2 The canonical locus is a section of the `Γ₀(p^n)-cover`

Prove `TauCeti.HodgeTate.canonicalLocus_isomorphism`. In the situation of 4.1, `A ↦ (A, C_n)` defines an isomorphism `X(ε) ≅ X_{Γ₀(p^n)}(ε)_c` of adic spaces, inverse to the forgetful map; it is compatible with the forgetful maps in n, with prime-to-p Hecke correspondences and with base change.

Require the strong level-n existence range. The formal version uses 3.11’s normalization over a common admissible model.

**Checks.**

- For the modular curve, `X_{Γ₀(p)}(ε)_c → X(ε)` has degree 1.

Sources: [SCH15], §3.2.2, Thm. 3.2.15(ii), p. 39.

*Needs:* [4.1](#section-4-1); [3.7](#section-3-7); [3.6](#section-3-6); [3.11](#section-3-11).

<a id="section-4-3"></a>

### 4.3 Atkin–Lehner identifies the anticanonical locus with a smaller Hasse neighbourhood

Prove `TauCeti.HodgeTate.atkinLehner_anticanonical`. For `n ≥ 1`, `ε ≥ 0` and ambient radius `δ = p^nε < 1/2` in the Siegel case (in the Hilbert case require the corresponding canonical-subgroup range at each quotient step), the map `AL_n`: `X_{Γ₀(p^n)}(p^nε)_a → X(ε)`, `(A, D) ↦ A/D`, is an isomorphism; its inverse sends `B ∈ X(ε)` to `(B/C_n(B), B[p^n]/C_n(B))` up to the identification `(B/C_n)/(B[p^n]/C_n) ≅ B`. Equivalently `X(p^{−n}ε) ≅ X_{Γ₀(p^n)}(ε)_a` by `A ↦ (A/C_n, A[p^n]/C_n)`. Under these isomorphisms the anticanonical tower `… → X_{Γ₀(p^{n+1})}(ε)_a → X_{Γ₀(p^n)}(ε)_a` corresponds to the Frobenius tower `… → X(p^{−n−1}ε) → X(p^{−n}ε)` given by division by the canonical subgroup of level 1, which reduces to the relative Frobenius modulo `p^{1−δ}`, `δ = ((p+1)/p)ε`. The radius changes by the factor `p^n`: dividing by `C_n` multiplies the Hasse valuation by `p^n`, dividing by an anticanonical subgroup divides it by `p^n (3.8)`.

**Checks.**

- For the modular curve and `pε < 1/2`, AL₁: `X_{Γ₀(p)}(pε)_a ≅ X(ε)` is the restricted Atkin–Lehner map.

Sources: [BHW], §5.2, proof of Thm. 5.11, p. 22; [SCH15], §3.2.2, after the proof of Thm. 3.2.15, p. 41.

*Needs:* [4.1](#section-4-1); [3.8](#section-3-8); [3.7](#section-3-7).

<a id="section-4-4"></a>

### 4.4 The Hodge–Tate coordinate, the fractional-linear action and the factor cz + d

For `O_p=O_F⊗ℤ_p`, `Fl=Res_{F/ℚ}ℙ¹`, use dual-abelian kernel-line coordinates. The BHW left action `γ⋅x=T_{γ^∨}(x)` changes the frame by `α′=αγ^∨`; the quotient-line action is `det(γ)⁻¹γ`, pullback `γ^∨=det(γ)γ⁻¹`. The e₁ section scales by `cz+d`; the derivative is `detγ/(cz+d)²`. Actual AIP-group membership is 5.11.

Uses `OnePoint.instGLAction`, `OnePoint.smul_some_eq_ite`.

- `TauCeti.HodgeTate.hodgeTateCoordinate`: On the kernel-line chart (z:1), `z = −HT(α(e₂))/HT(α(e₁))`; `HT(α(e₁))` is the quotient-line generator.
- `TauCeti.HodgeTate.fractionalLinear_action`: For the specified left action, `z(γ⋅x) = (az+b)/(cz+d)` on the domain where cz+d is invertible.
- `TauCeti.HodgeTate.automorphyFactor`: `j(γ, x) := cz(x) + d`.
- `TauCeti.HodgeTate.automorphyFactor_cocycle`: `j(γδ,x) = j(γ,δ⋅x)j(δ,x)` on common affine-chart domains with invertible denominators.
- `TauCeti.HodgeTate.automorphyFactor_unit`: For `γ ∈ Γ₀(p)`, `j(γ,x)` is an `O⁺-unit` on the anticanonical period domains satisfying 4.6; this uses that the coordinates are within radius `< 1` of `𝒪_p`.
- `TauCeti.HodgeTate.hodgeTateCoordinate_descent`: After splitting F, `z = (z_σ)_σ` and the generic formulas descend over `F ⊗ ℚ_p`. Integral descent requires the specified O⁺-lattice, not the false ramified product identification.

**Checks.**

- For `g=(1 1;0 1)` and `h=(1 0;1 1)`, `gh=(2 1;1 1)` and `hg=(1 1;1 2)` differ. The frame law uses `(gh)^∨=h^∨g^∨`, so it obeys the left action while `T_{gh}=T_h∘T_g` retains the right action.

- `TauCeti.HodgeTate.automorphyFactor_identity`: `j(1, x) = 1`.
- `TauCeti.HodgeTate.fractionalLinear_upperTriangular`: For `γ = (a b; 0 d)`, `z(γ⋅x) = (a z(x) + b)/d`.
- `TauCeti.HodgeTate.automorphyFactor_cocycle_test`: For `γ = (1 0; c 1)`, `δ = (1 0; c′ 1)`: `j(γδ, x) = (c + c′)z + 1 = j(γ, δ⋅x)·j(δ, x)`.
- `TauCeti.HodgeTate.automorphyFactor_not_rightAction`: For noncommuting upper/lower unipotents g,h, `(gh)^∨=h^∨g^∨` and `g⋅(h⋅x)=T_{h^∨g^∨}(x)=(gh)⋅x`. The right translations instead satisfy `T_{gh}=T_h∘T_g`; treating `αγ^∨` as a right frame law reverses the order.
- For `F = ℚ` and `γ = (1 0; c 1)`, `z(γ⋅x) = z/(cz + 1)`.
- For the Weyl matrix `γ = (0 −1; 1 0)`, the chart action is `−1/z` for `z ≠ 0`, while `z = 0` maps to infinity; the nonzero-denominator hypothesis is necessary.

Sources: [BHW], §5.1, Def. 5.7 and Rem. 5.8, pp.19–20; §2, Def. 2.3, p. 8; §3.3, Lem. 3.19, p. 13.

*Needs:* [2.7](#section-2-7); `ShimuraData` Layer 3 (compact dual); `Module.Grassmannian`; `HilbertModularVarietiesAndShimuraCurves` H4; [2.12](#section-2-12); `HilbertModularVarietiesAndShimuraCurves` H4 (hybrid full level); `HilbertModularVarietiesAndShimuraCurves` H4 (geometric full level); `HilbertModularVarietiesAndShimuraCurves` H4 (integral gamma0); `HilbertModularVarietiesAndShimuraCurves` H4 (adjugate level action).

<a id="section-4-5"></a>

### 4.5 Balls around the integral points of the Hilbert flag variety

For complete `L/ℚ_p`, `r∈(0,1]∩|L×|`, `|t|=r`, translated unit balls are open affinoids; `B₀(O_p:1)=O_p` via `a↦(a:1)`. Use the integral closure of `O_p⊗O_C` in `F⊗C`, equal to the tensor order for unramified p. Second-chart invariance requires `r<1`.

Uses `t𝒪_p`.

- `TauCeti.HodgeTate.flagBall`: `B_r(x) = x + t·Res 𝔾̂_a`, `|t| = r`.
- `TauCeti.HodgeTate.integralBall`: `B_r(𝒪_p : 1)`, `B_r(𝒪_p^× : 1)`, `B_r(1 : p𝒪_p)` as unions of balls.
- `TauCeti.HodgeTate.integralBall_points`: `B_r(𝒪_p : 1)(C) = 𝒪_p + t(𝒪_p ⊗ O_C)^∼`.
- `TauCeti.HodgeTate.integralBall_mono`: `B_r ⊂ B_{r′}` for `r ≤ r′`.
- `TauCeti.HodgeTate.integralBall_gamma0`: For `0 ≤ r < 1`, `Γ₀(p)` preserves `B_r(𝒪_p:1)` and `B_r(1:p𝒪_p)`. The `r = 1` assertion for the second chart is excluded.

**Checks.**

- `TauCeti.HodgeTate.integralBall_one`: `B_1(ℤ_p : 1)` is the closed unit disc `{|z| ≤ 1}` for `F = ℚ`.
- `TauCeti.HodgeTate.integralBall_disjoint`: For `F = ℚ` and `r < 1`, `B_r(ℤ_p : 1)` and `B_r(1 : pℤ_p)` are disjoint.
- `TauCeti.HodgeTate.integralBall_ramified`: For p ramified in F, `𝒪_p ⊗ O_C` is not the integral closure: `B_r` must be defined with the integral closure, or the ball misses points of `𝒪_p ⊗ C` of norm `≤ r`.
- For `F = ℚ`, `B_r(ℤ_p` : 1) `=` {z : |z − a| `≤` r for some a `∈ ℤ_p`}.

Sources: [BHW], §5.3, Def. 5.17, p. 24.

*Needs:* [4.4](#section-4-4); AdicSpacesPartIII R2 (generic fibre functor d); `TauCeti.Huber.Pair`.

<a id="section-4-6"></a>

### 4.6 Hodge–Tate images of the canonical and anticanonical loci (BHW Proposition 5.18)

Prove `TauCeti.HodgeTate.periodMap_inclusions`. Let `1 > r > 0`, `m ≥ 1` with `p^{−m} ≤ r`, and `0 ≤ ε < 1/(c_p p^m)` with `c_p = 2` for `p ≥ 5` and `c_p = 3` for `p = 3`, or `0 ≤ ε ≤ 1/(4p^m)` for `p = 2`. Then `π_HT(X_{Γ(p^∞)}(ε)_c) ⊂ B_r(1 : p𝒪_p)` and `π_HT(X_{Γ(p^∞)}(ε)_a) ⊂ B_r(𝒪_p : 1)`. More precisely, with `n = m + 1` and `x = n − p^nε/(p−1)`, every point of the anticanonical locus has `π_HT ∈ B_{|p^x|}(𝒪_p : 1)`. The same `ε` serves all primes above p. The inequalities are exactly what is needed to evaluate a locally analytic weight on cz + d.

Boundary estimates require Layer 0/C4’s full dual one-motive flag and conormal estimates. They agree with S3’s compactified map where constructed; S3 is not an input to the open estimates.

**Checks.**

- For `p=2,n=1`, the position guard admits height `1/4` and rejects `1/3`; for `p=5,n=1`, it admits `1/3` and rejects `1/2`. These distinguish the inclusive all-prime endpoint from the strict odd-prime endpoint.

- At `p=3,n=1`, height `1/4` lies in the BHW position range and height `1/3` is excluded by its strict endpoint.

- For `F = ℚ`, `p ≥ 5`, `m = 1`, `r = 1/p` and `ε = 1/(4p)`: `n = 2` and `x = 2 − p/(4(p − 1)) ≥ 27/16 > 1`, so `π_HT` of the anticanonical locus lies in the union of discs of radius 1/p around `ℤ_p`. The endpoint `ε = 1/(2p)` is excluded for `p ≥ 3`; for `p = 2` the endpoint `ε = 1/8` at `m = 1` is allowed.

Sources: [BHW], §5.3, Prop. 5.18, p. 24; §5.3, Prop. 5.18, p. 24.

*Needs:* [2.7](#section-2-7); [4.5](#section-4-5); [4.1](#section-4-1); [3.9](#section-3-9); [3.10](#section-3-10); [0.7](#section-0-7); [4.8](#section-4-8); [4.7](#section-4-7); [3.12](#section-3-12); [2.12](#section-2-12); [0.17](#section-0-17).

<a id="section-4-7"></a>

### 4.7 The period estimates at primes ramified in F

Prove `TauCeti.HodgeTate.ramifiedPeriod_comparison`. Let `G/O_C` (or the supplied full dual one-motive realization at a boundary chart) have a canonical level-n subgroup and the scalar `O_C` kernel congruence of 4.8 at precision `x=n−p^nw/(p−1)>0`. The canonical generic module is free of rank one over `O_F/p^n (3.12)`. In an anticanonical frame write this generator as (c,1). Projection along every `σ:O_p⊗O_C→O_C` then puts the generic Hodge–Tate kernel coordinate in `σ(c)+p^xO_C`; equivalently the flag point lies in `B_{|p^x|}(O_p:1)` defined with the integral closure. The first-coordinate version gives the canonical ball around `(1:pO_p)`. This projection lemma applies at ramified primes without an integral product decomposition. 4.6 applies it with `n=m+1` and its separate radius hypotheses.

**Checks.**

- For `F = ℚ(√p)` and `p ≥ 5` the statement gives the same radius as for p split.

Sources: [BHW], §5.3, proof of Prop. 5.18, p. 24.

*Needs:* [4.5](#section-4-5); [4.4](#section-4-4); [3.10](#section-3-10); `HilbertModularVarietiesAndShimuraCurves` H4; [4.8](#section-4-8); [3.12](#section-3-12); `HilbertModularVarietiesAndShimuraCurves` H4 (hybrid full level); `HilbertModularVarietiesAndShimuraCurves` H4 (geometric full level); `HilbertModularVarietiesAndShimuraCurves` H4 (integral gamma0); `HilbertModularVarietiesAndShimuraCurves` H4 (adjugate level action).

<a id="section-4-8"></a>

### 4.8 Congruence of the integral Hodge–Tate kernel

Prove `TauCeti.HodgeTate.canonicalKernel_congruence`. Let `G/O_C` be a p-divisible group with free Tate module, conormal rank g and height 2g, let `H_n` be canonical with the conormal and raw character estimates at height w, and set `δ=S_nw`, `y=n−δ`, `x=y−w/(p−1)=n−p^nw/(p−1)>0`. With `V=ker(T_pG⊗O_C→ω_GD)`, the images of V and `H_n(C)⊗O_C` in `(T_pG⊗O_C)/p^x` coincide. This is an `O_C`-module congruence, with no claim of local freeness over the ramified order `O_p⊗O_C`.

At the boundary use the full dual one-motive of height 2g, with its conormal estimate, rather than the finite Raynaud height `2g−r`.

**Checks.**

- At `w=0`, `x=y=n` and the two modules agree modulo `p^n`; at `w>0` the loss `w/(p−1)` cannot be omitted.

Sources: [BHW], §5.3, proof of Prop. 5.18, pp. 24–25.

*Needs:* [3.9](#section-3-9); [3.7](#section-3-7); [0.7](#section-0-7); [0.24](#section-0-24).

## Layer 5: Igusa trivializations and the modified integral lattice

<a id="section-5-1"></a>

### 5.1 Igusa torsors of the dual canonical subgroup and the ordinary inverse tower

For totally real F, `m≥1`, work on normal admissible Hilbert charts at `0≤ε≤p^{−(m+1)}`, additionally `ε≤p⁻³` for ramified p and `m=1`. Use 3.12's polarized dual module `H_m^∨=A^∨[p^m]/H_m^⊥`. The torsor is generically finite étale; integral étaleness/inverse towers require the ordinary locus. Boundary charts use finite one-motive pieces and toric canonical subgroups.

- `TauCeti.HodgeTate.igusaTorsor`: `X_{Ig(p^m)}(ε) → X(ε)`, the `(𝒪_F/p^m)^×`-torsor of `𝒪_F`-linear isomorphisms `𝒪_F/p^m ≅ H_m^∨`.
- `TauCeti.HodgeTate.igusaTorsor_transition`: Reduction `mod p^m` gives `X_{Ig(p^{m+1})}(ε′) → X_{Ig(p^m)}(ε′)` for `ε′ ≤ ε_{m+1}^can`, equivariant for `(𝒪_F/p^{m+1})^× → (𝒪_F/p^m)^×`.
- `TauCeti.HodgeTate.ordinaryIgusaTower`: `X_{Ig(p^∞)}(0) = lim X_{Ig(p^m)}(0)`, a pro-étale `𝒪_p^×`-torsor over `X(0)` with finite étale formal models.
- `TauCeti.HodgeTate.igusaTorsor_universalTrivialisation`: The tautological isomorphism `ψ_univ`: `𝒪_F/p^m ≅ H_m^∨` over `X_{Ig(p^m)}(ε)`.
- `TauCeti.HodgeTate.igusaTorsor_baseChange`: Compatible with base change, prime-to-p Hecke correspondences and the `𝒪_F^{×,+}`-action on polarisations.

**Checks.**

- `TauCeti.HodgeTate.igusaTorsor_degree`: `X_{Ig(p^m)}(ε) → X(ε)` is finite étale of degree `#(𝒪_F/p^m)^×`; for `F = ℚ`, of degree `p^{m−1}(p − 1)`.
- `TauCeti.HodgeTate.igusaTorsor_cusp`: At a cusp of the modular curve (Tate curve), `H_m = μ_{p^m}` and `H_m^∨ = ℤ/p^m`, so the torsor is trivial over the cusp neighbourhood.
- `TauCeti.HodgeTate.igusaTorsor_not_fullLevel`: `X_{Ig(p^m)}(ε)` is not `X_{Γ(p^m)}(ε)`: its fibres have `#(𝒪_F/p^m)^×` points, not `#GL₂(𝒪_F/p^m)`; a partial Igusa trivialisation is not a Tate-module basis.
- For the modular curve, `X_{Ig(p)}(0) → X(0)` is the classical Igusa curve of level p over the ordinary locus, a `(ℤ/p)^×`-torsor.

Sources: [BHW], §7.1, Def. 7.1(2), p. 28; §3.4, p. 14.

*Needs:* [3.10](#section-3-10); [3.7](#section-3-7); [3.12](#section-3-12); [0.13](#section-0-13); [0.27](#section-0-27); `AdicEtaleGeometry` A1 (pro etale site corrected); `AbelianSchemesAndArithmeticModuli` A2 (normalized poincare comparison); `AbelianSchemesAndArithmeticModuli` A2 (polarization representatives and graph).

<a id="section-5-2"></a>

### 5.2 Igusa trivialisations and the full p-level tower

Establish `TauCeti.HodgeTate.igusaFullLevel_comparison`. For `0 ≤ ε ≤ ε_m^can`, the anticanonical full-level tower with universal `α: 𝒪_p² ≅ T_pA^∨` maps to the Igusa torsor by the generator `ψ`: `𝒪_p/p^m → H_m^∨` obtained from `α(e₁)` followed by the dual canonical-subgroup quotient. Anticanonicity makes `ψ` an isomorphism of finite `𝒪_p/p^m`-modules. The resulting map of spaces `φ`: `X_{Γ(p^∞)}(ε)_a → X_{Ig(p^m)}(ε)` is not claimed to be an isomorphism and does not factor through Γ₀-level, which forgets the generator. Under the BHW left action `γ⋅x=T_{γ^∨}(x)` with frame `α′ = α ∘ γ^∨`, diagonal `γ =` diag(a,d) multiplies `ψ` by `d mod p^m`. BHW Proposition 7.11 uses `φ` and Hodge–Tate functoriality to lift the Igusa generator to the AIP torsor.

Use m in both finite-level expressions of BHW Proposition 7.11: `H_m→A[p^m]` and `(1,0) mod p^m`.

Uses the corrected indexing of BHW Proposition 7.11 (m, not n, in 'the dual of the inclusion `H_m → A[p^m]'` and `'(1, 0) mod p^m'`).

**Checks.**

- For the BHW left action of `diag(a,d)`, its right translation is by `diag(d,a)` and the Igusa generator becomes `dψ`.
- Changing only the second frame vector by `diag(a,1)` in the BHW action fixes ψ, although the full Tate frame changes. The map to the Igusa torsor therefore forgets part of the frame.

- For the modular curve at `ε = 0`, `φ` sends `(E, α)` to the image of `α(1, 0)` in `E[p^m]/E[p^m]^0 ≅ H_m^∨`.

Sources: [BHW], §7.2, Prop. 7.11, p. 30.

*Needs:* [5.1](#section-5-1); [4.1](#section-4-1); [4.3](#section-4-3); [3.7](#section-3-7); [2.3](#section-2-3); [2.1](#section-2-1); [0.23](#section-0-23); `HilbertModularVarietiesAndShimuraCurves` H4; `HilbertModularVarietiesAndShimuraCurves` H4 (hybrid full level); `HilbertModularVarietiesAndShimuraCurves` H4 (geometric full level); `HilbertModularVarietiesAndShimuraCurves` H4 (integral gamma0); `HilbertModularVarietiesAndShimuraCurves` H4 (adjugate level action).

<a id="section-5-3"></a>

### 5.3 The modified integral lattice `ω^int`

On the normal Hilbert Igusa model at `ε≤p^{−(m+1)}`, use invertible `Hdg_T`, `Hdg_T^{p−1}=Hdg`, and integral ideals `I_m=p^mHdg_T^{−(p^m−1)}⊂I′_m=p^mHdg_T^{−p^m}`. Construct the lattice and its local API before 5.9; its independence clause uses 5.9 after that construction. The universal class is `HT(ψ(1))`; AIPH's lifted matrix/adjugate and 3.11 identify its inverse-image span with the following lattice F.

- `TauCeti.HodgeTate.igusaHodgeTateClass`: `ψ(1) ∈ ω⁺/I_mω⁺`, the Hodge–Tate image of the universal Igusa generator.
- `TauCeti.HodgeTate.integralDifferentialLattice`: `ω^int :=` preimage in `ω⁺` of the `𝒪_F ⊗ O⁺-span` of `ψ(1)`.
- `TauCeti.HodgeTate.integralDifferentialLattice_locallyFree`: `ω^int` is locally free of rank one over `𝒪_F ⊗ O⁺`.
- `TauCeti.HodgeTate.integralDifferentialLattice_bounds`: `Hdg_Tω⁺⊂ω^int⊂ω⁺`, where `Hdg_T^{p−1}=Hdg` on the normal formal Hilbert model.
- `TauCeti.HodgeTate.integralDifferentialLattice_hodgeTate`: HT′: `𝒪_F ⊗ O⁺/I′_m ≅ ω^int/I′_mω^int`, `1 ↦ ψ(1)`.
- `TauCeti.HodgeTate.integralDifferentialLattice_indep`: After pullback to a common normal formal model with compatible canonical generators, the level-m and level-m′ lattices agree; use the determinant/inclusion argument of 5.9.

**Checks.**

- `TauCeti.HodgeTate.integralDifferentialLattice_ordinary`: On the ordinary locus `(ε = 0)`, `ω^int = ω⁺`.
- `TauCeti.HodgeTate.integralDifferentialLattice_colength`: At a rank-one point of Hodge height `w (F = ℚ)`, `ω⁺/ω^int ≅ O_C/p^{w/(p−1)}`.
- `TauCeti.HodgeTate.integralDifferentialLattice_ne_plus`: At a non-ordinary point `ω^int ≠ ω⁺` (its colength is `w/(p−1) > 0`), so `ω^int` is not the natural formal-model lattice; at ramified p, `ω⁺` is not even locally free over `𝒪_F ⊗ O⁺`.
- At an ordinary point `(Hdg = O⁺)`, `ω^int = ω⁺` and HT′ is the Hodge–Tate isomorphism of the multiplicative `H_m (0.11)`.

Sources: [BHW], §7.1, Def. 7.3, p. 29; §7.1, p. 29; [AIPH], §4.1, Prop. 4.1, p. 15.

*Needs:* [5.1](#section-5-1); [3.9](#section-3-9); [0.2](#section-0-2); [0.1](#section-0-1); [0.11](#section-0-11); [3.1](#section-3-1); `Module.Invertible`; [0.22](#section-0-22); [3.11](#section-3-11); [3.12](#section-3-12); `SheafOfModules.Submodule`; `SheafOfModules.IsLocallyFree`.

<a id="section-5-4"></a>

### 5.4 Local freeness, independence of level and cokernel estimates for `ω^int`

Prove `TauCeti.HodgeTate.integralLattice_properties`. Under 5.3’s exact formal-model and transfer hypotheses, `F=ω^int` is locally free of rank one over `O_F⊗O⁺`, `Hdg_Tω⁺⊂F⊂ω⁺`, and `HT′:(O_F⊗O⁺)/I′_m≅F/I′_mF`. Every lift in `ω⁺` of the universal canonical character belongs to F and agrees with HT′(1) modulo `I′_mF`. The lattices at different levels agree on a common radius/model by 5.9. These statements are compatible with the supplied integral base change, Igusa transitions and prime-to-p isogenies. On the ordinary formal locus `F=ω⁺`.

**Checks.**

- At a rank-one point of Hodge height w for `F = ℚ` and `m = 1`: `I′₁ = p^{1 − pw/(p−1)}` and `ω^int/I′₁ ≅ O_C/p^{1−pw/(p−1)}`.

Sources: [BHW], §7.1, Prop. 7.4, p. 29; §7.1, Cor. 7.6, p. 29.

*Needs:* [5.3](#section-5-3); [3.9](#section-3-9); [0.3](#section-0-3); [5.1](#section-5-1); [3.11](#section-3-11); [5.9](#section-5-9).

<a id="section-5-5"></a>

### 5.5 The modified Hodge bundle `ω^mod` at full level `p^n`

For normal admissible full-level Siegel toroidal charts, `p≥3`, `n>b=1/(p−1)`, use 0.17's HT lattice generated by lifts and `p^bω`. Take PS16's admissible minor modifications of sizes `g,g−1,…,1`, normalize and use the torsion-free strict image. No `p=2` modified-bundle target is asserted (PS16 Remark 1.10).

- `TauCeti.HodgeTate.modifiedModel`: `𝔛^mod → 𝔛`, the normalised blow-up of the minor ideal of the Hodge–Tate matrix.
- `TauCeti.HodgeTate.modifiedHodgeBundle`: The strict-transform/image lattice on the specified normal admissible minor modification, with `b=1/(p−1)`.
- `TauCeti.HodgeTate.modifiedHodgeBundle_locallyFree`: `ω^mod` is locally free of rank g.
- `TauCeti.HodgeTate.modifiedHodgeBundle_bounds`: `p^bω⊂ω^mod⊂ω` with `b=1/(p−1)` and level `n>b`.
- `TauCeti.HodgeTate.modifiedHodgeBundle_hodgeTate_surjective`: The reduced linearized HT map surjects onto `ω^mod/p^{n−b}ω^mod` on the specified modified formal model.
- `TauCeti.HodgeTate.modifiedModel_generic`: `𝔛^mod → 𝔛` is an isomorphism on adic generic fibres.

**Checks.**

- `TauCeti.HodgeTate.modifiedHodgeBundle_ordinary`: On the ordinary locus the image lattice is `ω` and its minor ideal is a unit, so the required modification restricts to the identity there. This does not assert that every chosen extraneous blowup is the identity.
- `TauCeti.HodgeTate.modifiedHodgeBundle_colength`: For `g = 1` at a rank-one point with a canonical subgroup and Hodge height w, `ω/ω^mod ≅ O_C/p^{w/(p−1)}`.
- `TauCeti.HodgeTate.modifiedHodgeBundle_not_locallyFree_before_blowup`: Before the blow-up, the image sheaf is not locally free in general (it is generated by 2g sections with non-invertible minor ideal).
- On the ordinary locus `ω^mod = ω`.
- For the modular curve `(g = 1)`, `ω^mod` is generated by the Hodge–Tate images of the basis of `(ℤ/p^n)²` and `p^{1/(p−1)}ω`.

Sources: [PS16], §1.8, construction before Prop. 1.13 (author copy; published Prop. 1.10), p. 6; [PIL20], §12.2.1, p. 74.

*Needs:* [0.17](#section-0-17); [0.5](#section-0-5); [0.1](#section-0-1); AdicSpacesPartIII R2 (admissible blow up); AdicSpacesPartIII R2 (generic fibre inverts admissible blow ups); `AlgebraicGeometry.Scheme.Hom.normalization`; [3.11](#section-3-11); `SheafOfModules.Submodule`; `SheafOfModules.IsLocallyFree`; AdicSpacesPartIII R2 (hasse domain).

<a id="section-5-6"></a>

### 5.6 The modified minimal model and the descent of the Hodge–Tate determinant

For Siegel `p≥3`, descend `Λ^gHT` via 5.13's normal minimal Stein model and mod-pⁿ pushforward; normalize its coefficient-ideal blowup. Require `n>D=g/(p−1)`. The compatible toroidal modification maps to this model and pulls its invertible lattice `L^mod` back to `detω^mod`, without descending the whole Hodge bundle.

- `TauCeti.HodgeTate.minimalLevelModel`: `𝔛^*_{K(p^n)}`, the Stein factorisation of `𝔛_{K(p^n)} → 𝔛^*`.
- `TauCeti.HodgeTate.hodgeTateDeterminant_descends`: `Λ^gHT` is the pullback of a map on `𝔛^*_{K(p^n)}`.
- `TauCeti.HodgeTate.modifiedMinimalModel`: `𝔛^{*−mod}_{K(p^n)}`, the normalised blow-up of the coefficient ideal of `Λ^gHT`.
- `TauCeti.HodgeTate.modifiedDetHodge_bounds`: For `D=g/(p−1)`, `p^D detω⊂L^mod⊂detω`.
- `TauCeti.HodgeTate.modifiedDetHodge_surjective`: For `n>D` the exterior-power character map surjects onto `L^mod/p^{n−D}`.

**Checks.**

- `TauCeti.HodgeTate.modifiedMinimalModel_ordinary`: Over the ordinary locus `𝔛^{*−mod}_{K(p^n)} = 𝔛^*_{K(p^n)}` and `det ω^mod = det ω` at that same full level.
- On the modular curve with neat tame level, forgetting full `p^n`-level for `n≥1` remains a nontrivial cover on the ordinary open, even though the modification of that full-level model is the identity there.
- `TauCeti.HodgeTate.modifiedDetHodge_siegel3`: For the Siegel threefold `(g = 2)` and `p = 3`, `D = 1`, so `n ≥ 2` is required; the descended determinant line satisfies `p·detω ⊂ L^mod ⊂ detω`.
- `TauCeti.HodgeTate.modifiedMinimalModel_not_toroidal`: The minimal modified determinant line pulls back along the compatible toroidal-to-minimal modified map to `detω^mod (PIL20 §12.9.1, PDF p.80)`. This determinant descent does not imply that the full finite-level Hodge bundle descends to the minimal model.
- For the modular curve, `𝔛^*_{K(p^n)}` is the normalisation of the minimal compactification at full level `p^n`, and `det ω^mod = ω^mod`.

Sources: [PS16], §1.4, Corollaire 1.7 (author copy; published Corollaire 1.4), p. 5; [PIL20], §12.9.1, p. 80; [PS16], §1.19, p.8; Rem. 1.10, p.5; Cor. A.10, p.26.

*Needs:* [5.5](#section-5-5); [5.13](#section-5-13); [0.17](#section-0-17); [3.11](#section-3-11); `ShimuraCompactifications` C5 (integral minimal space); AdicSpacesPartIII R2 (admissible blow up); AdicSpacesPartIII R2 (hasse domain).

<a id="section-5-7"></a>

### 5.7 The étale sheaf `ω^{mod,+}`

For spherical Siegel 𝒳 at `p≥3`, descend the `O⁺`-span of full-level HT images to `𝒳_ét`. At full level it is Zariski-local (5.5); on 𝒳 it need not come from the analytic site. Prove the following bounds and level independence.

- `TauCeti.HodgeTate.modifiedPlusSheaf`: `ω^{mod,+}` on `𝒳_ét`, the `O⁺-span` of Hodge–Tate images, descended from finite level.
- `TauCeti.HodgeTate.modifiedPlusSheaf_pullback`: Its pullback to `𝒳(p^n)`, `n ≥ 1`, is the generic fibre of `ω^mod`.
- `TauCeti.HodgeTate.modifiedPlusSheaf_bounds`: `p^{1/(p−1)}ω⁺ ⊂ ω^{mod,+} ⊂ ω⁺`.
- `TauCeti.HodgeTate.modifiedPlusSheaf_indep`: Independent of the auxiliary level n used to define it.

**Checks.**

- `TauCeti.HodgeTate.modifiedPlusSheaf_ordinary`: `ω^{mod,+} = ω⁺` over the ordinary locus.
- `TauCeti.HodgeTate.modifiedPlusSheaf_rankOne`: At a rank-one point of an elliptic curve with Hodge height `w < 1/(p+1)`, `ω⁺/ω^{mod,+} ≅ O_C/p^{w/(p−1)}`.
- `TauCeti.HodgeTate.modifiedPlusSheaf_not_analytic`: `ω^{mod,+}` is not a sheaf on the analytic site of 𝒳 in general: its sections over an affinoid need not be determined by a single analytic formal model at spherical level.
- Over the ordinary locus `ω^{mod,+} = ω⁺`.

Sources: [PIL20], §12.7.1, p. 77; §12.7.1, p. 77; §12.7.1, Rem. 12.7.1.1, p. 77.

*Needs:* [5.5](#section-5-5); `AdicEtaleGeometry` A1 (pro etale site corrected); `PerfectoidSpaces` P0 (almost basic setup); `SheafOfModules.Submodule`; `SheafOfModules.IsLocallyFree`.

<a id="section-5-8"></a>

### 5.8 The Andreatta–Iovita–Pilloni torsor

In 5.3 define the congruence torsor below, analytic over Igusa and étale over `X(ε)`. For `x=m−εp^m/(p−1)`, its group containment is equality on `|Ha|=|p|^ε`. OverconvergentAutomorphicForms O5 owns its associated weight sheaf.

- `TauCeti.HodgeTate.aipTorsor`: `𝔉_m(ε) := {w ∈ ω^int : w ≡ HT′(1) mod I′_m}`, a torsor under `1 + I′_m Res 𝔾̂_a` over `X_{Ig(p^m)}(ε)`.
- `TauCeti.HodgeTate.aipTorsor_structureGroup`: `𝔉_m(ε) → X(ε)` is an étale `B_m`-torsor, `B_m = 𝒪_p^×(1 + I′_m Res 𝔾̂_a)`.
- `TauCeti.HodgeTate.aipTorsor_openImmersion`: `𝔉_m(ε) → T(ω)` is an open immersion.
- `TauCeti.HodgeTate.aipTorsor_bound`: `B_m ⊂ 𝒪_p^×(1 + p^x Res 𝔾̂_a)` over `X(ε)`, `x = m − εp^m/(p−1)`.
- `TauCeti.HodgeTate.aipTorsor_lift`: Every lift in `ω⁺` of `ψ(1) ∈ ω⁺_{H_m}` is a section of `𝔉_m (5.4 (4))`.

**Checks.**

- At `m=1`, the exponent is `3/4` for `p=2,ε=1/8` and `5/6` for `p=3,ε=1/9`; its ordinary value at `p=3,ε=0` is 1.

- `TauCeti.HodgeTate.aipTorsor_ordinary`: At `ε = 0`, `B_m = 𝒪_p^×(1 + p^m Res 𝔾̂_a)` and `𝔉_m` is the torsor of generators of `ω⁺` congruent to the Igusa generator `mod p^m`.
- `TauCeti.HodgeTate.aipTorsor_bound_direction`: The reverse inclusion `𝒪_p^×(1 + p^x Res 𝔾̂_a) ⊂ B_m` fails at points where `|Ha| > |p|^ε`, since there `I′_m ⊊ p^xO⁺`.
- For `F = ℚ` at `ε = 0`, `𝔉_m` is the set of generators of `ω⁺` congruent to the Hodge–Tate image of the Igusa generator modulo `p^m`.

Sources: [BHW], §7.1, Def. 7.5, p. 29; §7.1, Def. 7.5, p. 29; [AIPH], §4.2, the torsor `F_{n,r,I}`, p. 16.

*Needs:* [5.3](#section-5-3); [5.4](#section-5-4); [5.1](#section-5-1); `Module.Invertible`.

<a id="section-5-9"></a>

### 5.9 Level independence of the integral lattice

Prove `TauCeti.HodgeTate.integralDifferentialLattice_level_eq`. On a common normal p-torsion-free Hilbert formal model with compatible dual canonical generators at `m′≥m` and `ε≤p^{−(m′+1)}`, the modified lattices `F_m` and `F_m′` inside `ω` are equal. Both have determinant ideal `Hdg_T` and rank-one `O_F`-linear generators, and their analytic `O⁺` pullbacks are equal as well.

**Checks.**

- At `w=0` both lattices equal `ω`; compatible reductions without equal regular determinant ideals do not imply equality.

Sources: [AIPH], §4.1, Prop. 4.1, pp. 15–16; §4.3.1, Prop. 4.7, p. 18.

*Needs:* [5.3](#section-5-3); [0.23](#section-0-23); [3.11](#section-3-11); AdicSpacesPartIII R2 (admissible blow up); AdicSpacesPartIII R2 (hasse domain).

<a id="section-5-10"></a>

### 5.10 The Hodge–Tate lift to the AIP torsor

Prove `TauCeti.HodgeTate.hodgeTate_aipLift`. For `ε≤p^{−(m+1)}`, the canonical section `s=HT(α(e₁))` on the anticanonical full-level tower factors through the AIP torsor `F_m` over its Igusa generator map `φ`. Use the BHW left action `γ⋅x=T_{γ^∨}(x)` of 4.4; matrices refer to right translations by their adjugates in 2.2. This is a factorization into the actual open subspace of the total Hodge bundle.

**Checks.**

- For `m′≥m` on a common allowed radius, reduction of the canonical generator carries the lift at level m′ to the lift at level m; its differential section remains `HT(α(e₁))`.
- For a prime-to-p isogeny carrying the chosen dual frames and canonical generators, pullback of the lifted section equals the lift of the pulled-back Igusa generator by character naturality.

- On the ordinary modular cusp this is the dt/t generator with its Igusa congruence, not a trivialization of the whole Tate module.

Sources: [BHW], §7.2, Prop. 7.11, p. 30.

*Needs:* [5.2](#section-5-2); [5.8](#section-5-8); [5.4](#section-5-4); [0.23](#section-0-23); [2.13](#section-2-13).

<a id="section-5-11"></a>

### 5.11 The AIP automorphy factor

Prove `TauCeti.HodgeTate.aip_automorphyFactor`. For `γ∈Γ₀(p)` acting on the anticanonical tower by `γ⋅x=T_{γ^∨}(x)`, `s(γ⋅x)=(cz(x)+d)s(x)` and the scalar `j(γ,x)=cz(x)+d` is a section of the actual AIP structure group `B_m`. Its scalar cocycle is the period-coordinate cocycle.

**Checks.**

- The identity matrix gives ratio one and fixes the lifted section.
- For a diagonal BHW element `diag(a,d)`, `s(γ⋅x)=d s(x)`, matching 5.2's Igusa-generator action; successive elements multiply with the left scalar cocycle.

- At an ordinary elliptic point the ratio is a unit in `ℤ_p^×(1+p^mO⁺)`; the larger ambient ball bound alone does not prove membership in this smaller group.

Sources: [BHW], §5.4, Lem. 5.31, p. 26; §7.2, Lem. 7.12, pp. 30–31.

*Needs:* [5.10](#section-5-10); [5.8](#section-5-8); [4.4](#section-4-4).

<a id="section-5-12"></a>

### 5.12 The Hodge–Tate section compares the anticanonical tower with the AIP torsor

Prove `TauCeti.HodgeTate.aipTorsorHodgeTateComparison`. In 5.10's Hilbert range, `m≥1`, `ε≤p^{−(m+1)}`, let `n≥1` or `n=∞`. For finite n require also `p^nε<1/2` and the Hilbert canonical-subgroup range at every intervening quotient step of 4.3. Set `X_n=X_{Γ*(p^∞)}(p^nε)_a`, `X_∞=X_{Γ*(p^∞)}(ε)_a`, and `u_n(x)=diag(p^n,1)⋅x=T_{diag(1,p^n)}(x):X_n→X_∞`, `u_∞=id`. Then `s̃_n=s∘u_n:X_n→F_m(ε)` lies over `AL_n:X_{Γ₀*(p^n)}(p^nε)_a≅X(ε)` (4.3); at infinity use the forgetful map. For `γ=(a b;c d)` in the profinite deck group `Γ₀*(p^n)` for finite n, or in `Γ₀*(p)` at infinity, `j=cz+d∈B_m` and `s̃_n(γ⋅x)=j(γ,x)s̃_n(x)`, with 4.4/BHW (7.2)'s action conventions. Let U be an adic parameter space and `κ:B_m×U→G_m` an analytic family of group characters with both κ and κ⁻¹ power-bounded. For an analytic function f on `F_m(ε)×U` satisfying `f(bw,u)=κ(b,u)⁻¹f(w,u)`, its pullback `g=s̃_n*f` satisfies `γ*g=κ(cz+d,u)⁻¹g`; pullback preserves power-bounded functions. Coefficient-sheaf identification (BHW Theorem 7.14) and Hecke equivariance belong to OverconvergentAutomorphicForms O5/O6.

**Checks.**

- For `F=ℚ` and any finite `n≥1`, the deck group contains every upper unipotent `(1 t; 0 1)` with `t∈ℤ_p`. These form an infinite compact subgroup, even though the quotient tower level is finite.

- For `p=5,m=1,ε=1/25,n=2`, the bound `ε≤p^{−(m+1)}` holds but `p^nε=1`; this finite-level domain is excluded by the ambient-radius hypothesis. At `n=∞` the domain retains radius ε and `u_∞=id`.

- For `n = ∞` and diagonal `γ =` diag(a, `d) ∈ Γ₀*(p`), (ii) reads `s(γ⋅x) = d·s(x)`, matching the transformation `ψ ↦ dψ` of the Igusa generator in 5.2.
- For `κ(t) = t^k` on `𝒪_p^×` (an algebraic weight), (iii) gives `γ*g = (c·z + d)^{−k}·g`, the weight-k automorphy law on the anticanonical tower.
- The statement makes no claim that the pulled-back eigenfunctions span an invertible `𝒪⁺`-module or that the induced map of coefficient sheaves is an isomorphism; both are O5's.
- The level restriction is necessary: at an ordinary point with `z = 0`, the Weyl matrix `(0 −1; 1 0)` belongs to `G*(ℤ_p) = Γ₀*(1)` and sends the kernel line to `∞`, outside the chosen anticanonical chart. It cannot be treated as a deck transformation preserving this branch.

Sources: [BHW], §7.2, Prop. 7.11 and Lem. 7.12, pp. 30–31; §7.2, diagram (7.2) and the first step of the proof of Thm. 7.14, p. 31; §7.1, Def. 7.5, p. 29.

*Needs:* [5.10](#section-5-10); [5.11](#section-5-11); [5.8](#section-5-8); [5.2](#section-5-2); [4.3](#section-4-3); [4.4](#section-4-4); [4.1](#section-4-1); [2.2](#section-2-2); [2.3](#section-2-3); [3.10](#section-3-10).

<a id="section-5-13"></a>

### 5.13 The structure sheaf of the full-level minimal model modulo `p^k`

Prove `TauCeti.HodgeTate.minimalLevelModel_pushforward`. For Siegel data, `p≥3`, `n≥1`, take the normal full-level toroidal model over integers in finite `K/ℚ_p(ζ_{p^n})` or its p-adic completion. Let `f:X(p^n)^tor→X(p^n)*` be its Stein contraction over the spherical minimal model. Prove `f_*O=O`, and `f_*O/p^k≅f_*(O/p^k)` for all `k≥1`. For finite locally free L on the Stein model, projection formula gives `H⁰(X(p^n)^tor,f*L/p^k)=H⁰(X(p^n)*,L/p^k)`. In particular descend the toroidal HT determinant section modulo `p^n` in the pulled-back Hodge line.

**Checks.**

- For the modular curve, the toroidal and minimal compactifications at full level `p^n` coincide, f is the identity and (2) is trivial.
- For `g = 2` at a point of a boundary stratum whose abelian part is an elliptic curve, both sides of (2) are products over the same cone of exponents of the Fourier–Jacobi coefficient modules of that elliptic curve, reduced modulo `p^k`: the comparison is coefficientwise, and the sections of `det ω/p^n` descend coefficient by coefficient.
- On the open part, where f is an isomorphism, (2) is the identity.

Sources: [PS16], Appendice A, Thm. A.4 (1) and Lem. A.9, pp. 24–26; Corollaire A.10, p. 26; §1.4, Corollaire 1.7, p. 5.

*Needs:* [0.17](#section-0-17); `ShimuraCompactifications` C5 (integral toroidal space); `ShimuraCompactifications` C5 (integral minimal space); `ShimuraCompactifications` C5 (higher level toroidal normalization); `ShimuraCompactifications` C4 (polarized degeneration data); `ShimuraCompactifications` C3 (refinement map).

## Layer 6: Logarithmic adic sites before period sheaves

<a id="section-6-0"></a>

### 6.0 Log structures, logification and integral charts

Use `TauCeti.LogAdic.LogStructure`, `TauCeti.LogAdic.logification`, `TauCeti.LogAdic.logPullback` and `TauCeti.LogAdic.IntegralChart` supplied by `PrismaticCohomologyPartIV` §8.60 on étale-sheafy analytic adic spaces, including locally noetherian and perfectoid spaces. A log structure is a monoid sheaf `α:M→O_{X_ét}` with unit fibre `O×`. The adjunction, unit, counit, idempotence and pullback coherence belong to this supplied API.

The supplied logification `P ⊕_{α⁻¹O×} O×` is left adjoint to inclusion of log structures, with unit, counit isomorphism and idempotence. The supplied pullback is the logification of `f⁻¹M→O_Y`. Use its correspondence between log morphisms over `f` and maps `f*M→N` on `Y`, together with the supplied identity and composition isomorphisms and their coherence. A morphism of log adic spaces is strict when its comparison `f*M_X→M_Y` is an isomorphism; its stalkwise criterion is 6.2.

Use the supplied integral charts, unit-fibre identification, logification adjunction and pullback coherence without a second construction.

**Checks.**

- Logifying the one-element prelog monoid gives `O×`, not the one-element sheaf. Its unit fibre contains every analytic unit.
- For `ℕ→k⟨T⟩`, `1↦T`, logification has characteristic `ℕ` at zero and zero on the punctured disc. The characteristic cannot be the constant sheaf `ℕ`.
- Pulling that log structure back to the origin retains characteristic `ℕ`, whereas pulling back the trivial log structure gives the trivial structure. Under two successive pullbacks the resulting logifications agree with the composite pullback.
- On `Spa(ℚ_p,ℤ_p)`, the prelog map `1↦p⁻¹` logifies to the trivial log structure but is not an integral chart; `1↦p` gives an integral chart of the same log structure. Thus logification and the `O⁺` chart condition are separate requirements.
- Logifying an existing log structure changes neither its sections nor its unit fibre. The identity pullback preserves each chart and is strict.

Sources: [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Convention 2.2.1, Def. 2.2.2 and Rem. 2.2.3, pp.7–8, give log structures, logification, pullback and the adjunction. Def. 2.3.1 and Def. 2.3.5, p.13, give the integral-image chart condition and the coherent, fine and fs local conditions.

*Needs:* `PrismaticCohomologyPartIV` §8.60 (the supplied log-adic carriers and Kummer foundations); `AdicEtaleGeometry` A1 (étale site and structure sheaves); `CrystallineCohomology` CR.5:log-algebra (commutative monoids and associated log structures); Mathlib `CategoryTheory.Sheaf` and `CategoryTheory.GrothendieckTopology`.

<a id="section-6-1"></a>

### 6.1 Étale descent and acyclicity of coherent modules on noetherian affinoids

Prove `TauCeti.LogAdic.coherent_etale_descent`. For noetherian affinoid `X=Spa(R,R⁺)` and finite R-module M, `M̃_ét(U)=M⊗_RO(U)` is a sheaf acyclic in positive degrees on every étale affinoid, with those sections. Finite R-modules are equivalent to coherent modules on both analytic and étale sites, inverse `F↦F(X)`. Thus X is étale sheafy. For `λ:X_ét→X_an`, coherent pullback/pushforward are inverse and `Rλ_*M̃_ét=M̃`; globalize affinoid-locally on locally noetherian X.

The nonnoetherian stably adic case is asserted only for finite projective modules, supplied by `AdicEtaleGeometry` §A1.6a.

**Checks.**

- For `M = R/I`, `M̃_ét` is the pushforward of the structure sheaf of the closed subspace `V(I)` to `X_ét`, and `H^i(X_ét, M̃_ét) = 0` for `i > 0`, although M is not projective.
- For `X = Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩)`, `H¹(X_ét, O) = 0` while `H¹(X_ét, μ_p) ≠ 0`: the acyclicity is for coherent modules, not for torsion étale sheaves.
- For `M = R` and a finite étale R-algebra S, the sections of `M̃_ét` over `Spa(S, S⁺)` are S.

Sources: [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Appendix A, Proposition A.9 (analytic modules) and Proposition A.10 (étale modules), pp.97–98.

*Needs:* AdicSpacesPartIII R3 (tate kiehl affinoid); AdicSpacesPartIII R3 (coherent sheaf); `AdicEtaleGeometry` §A1.6; `AdicEtaleGeometry` §A1.6a; `AdicEtaleGeometry` A1 (etale site); `DiamondsAndVStacks` D0 (cech to derived comparison); `ClassicalAdicEtaleCohomology` §§1.1–1.4, 8.2, 11.1–11.2 (etale acyclicity of vector bundles).

<a id="section-6-2"></a>

### 6.2 Characteristic stalks, morphisms and exactness of log adic spaces

Prove `TauCeti.LogAdic.characteristic_stalks` on any étale-sheafy analytic adic space with 6.0's log structure. Morphisms carry compatible `f♯:f⁻¹M_X→M_Y`; strictness is `f*M_X≅M_Y`, exactness is stalkwise exactness of this comparison.

- `TauCeti.LogAdic.characteristic`: `M̄_X = M_X/α^{−1}(O^×_{X_ét})`, with sharp geometric stalks.
- `TauCeti.LogAdic.characteristic_gp`: For integral `M_X`, `M^gp_{X,x̄}/O^×_{X_ét,x̄} ≅ M̄^gp_{X,x̄}`.
- `TauCeti.LogAdic.isIntegral_iff_stalk`: integrality and saturation are checked on geometric stalks.
- `TauCeti.LogAdic.Hom`: morphisms of log adic spaces, with `Hom.id` and `Hom.comp` through `(g∘f)* ≅ f*∘g*`.
- `TauCeti.LogAdic.strict_iff_stalk`: For arbitrary log structures, strictness is equivalent to every full logified-pullback stalk map `(f*M_X)_{ȳ}→M_{Y,ȳ}` being an isomorphism. If both log structures are integral, it is also equivalent to bijectivity of every characteristic stalk map `(f*M_X)̄_{ȳ}→M̄_{Y,ȳ}`; fine and fs structures satisfy this hypothesis.
- `TauCeti.LogAdic.IsExact`: exactness of a morphism at geometric points, and its characteristic form for integral log structures.
- `TauCeti.LogAdic.trivial_characteristic`: the trivial log structure has zero characteristic and is stable under pullback.

**Checks.**

- `TauCeti.LogAdic.characteristic_disc`: For the log disc `Spa(k⟨T⟩, k°⟨T⟩)` with the log structure generated by T, the characteristic stalk at `T = 0` is `ℕ` and away from `T = 0` it is 0.
- `TauCeti.LogAdic.strict_on_logified_pullback`: The inclusion of the origin into the log disc is strict when the origin carries the pulled-back log structure (characteristic `ℕ`). With the trivial source log structure the underlying origin inclusion has no compatible log morphism to the log disc: the generator T would have to pull back both to zero and to a unit. Testing on `f^{−1}M_X → M_Y` instead of the logified pullback gives the wrong answer at units.
- `TauCeti.LogAdic.diagonal_not_exact`: The diagonal `D → D²`, T₁, `T₂ ↦ T`, of log polydiscs has characteristic map `ℕ² → ℕ`, `(a,b) ↦ a+b`, at the origin; the preimage of `ℕ` in `ℤ²` is the half-plane `a+b≥0`, distinct from `ℕ²`, so the map is not exact, while the identity is exact.
- On `Spa(C,O_C)`, let N be the logification of `P=⟨u,e | u²=1, ue=e⟩`, with `u↦−1`, `e↦0`. The standard integral log point `M=C××ℕ` maps to N by the identity on units and characteristics, but `(v,n)` and `(−v,n)` have the same image for `n>0`. Thus the log morphism with comparison `M→N` is not strict despite bijective characteristic stalk maps; N is coherent and nonintegral.
- The trivial log structure is `O^×_X`, whose characteristic is 0; the one-element monoid mapping to 1 is not a log structure on `Spa(ℚ_p, ℤ_p)`.

Sources: [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Def. 2.2.2 (4), (7)–(8), p. 8; Ogus, *Lectures on Log Algebraic Geometry*, Chapter I, Proposition 4.1.2, p. 73 (unit and characteristic isomorphisms, with the quasi-integrality hypothesis satisfied by integral log structures).

*Needs:* [6.0](#section-6-0); `AdicEtaleGeometry` A1 (etale site); `AdicEtaleGeometry` A1 (etale structure sheaf); `CrystallineCohomology` CR.5:log-algebra (characteristic monoid).

<a id="section-6-3"></a>

### 6.3 Monoid-algebra log adic spaces

Construct `TauCeti.LogAdic.MonoidAlgebraLog` for Huber `(R,R⁺)`, ring of definition R₀, finitely generated ideal I, and monoid P. Use integral-closure plus rings; completion preserves Spa. Noetherianity needs finitely generated P. Toric P gives toric spaces, and `P=ℕⁿ` the polydisc chart `a↦∏T_i^{a_i}`.

- `TauCeti.LogAdic.MonoidAlgebraLog.huberPair`: `(R[P],R[P]⁺)` is a Huber pair for `R[P]⁺` the integral closure of raw `R⁺[P]` in `R[P]`, with ring of definition `R₀[P]` and ideal of definition `IR₀[P]`. Its completed pair is denoted `(R⟨P⟩,R⁺⟨P⟩)`. This is the corrected version of Lemma 2.2.11 and Remark 2.2.12.
- `TauCeti.LogAdic.MonoidAlgebraLog.noetherian`: For finitely generated P, R⟨P⟩ is analytic and strongly noetherian (resp. finitely generated over a noetherian ring of definition) when R is, and `Spa(R⟨P⟩,R⁺⟨P⟩)` is étale sheafy (Lemma 2.2.13).
- `TauCeti.LogAdic.MonoidAlgebraLog.logStructure`: The log structure `P^log` associated with `P_X→O_{X_ét}`, `a↦e^a` (Definition 2.2.17).
- `TauCeti.LogAdic.MonoidAlgebraLog.tautologicalChart`: `P→P^log(X)`, `a↦e^a`, with values in `R⁺⟨P⟩`; it is a chart of `P^log`.
- `TauCeti.LogAdic.MonoidAlgebraLog.relative`: `Y⟨P⟩→Y` for a locally noetherian Y with trivial log structure and finitely generated P, glued over noetherian affinoid opens (Example 2.2.19).
- `TauCeti.LogAdic.MonoidAlgebraLog.map`: A monoid map `u:P→Q` induces `Y⟨Q⟩→Y⟨P⟩` over Y, compatible with the tautological charts, with identity and composition laws.
- `TauCeti.LogAdic.MonoidAlgebraLog.rational_localization`: The formation of `Spa(R⟨P⟩,R⁺⟨P⟩)→Spa(R,R⁺)` commutes with rational localisation of `Spa(R,R⁺)` (Lemma 2.2.13).
- `TauCeti.LogAdic.MonoidAlgebraLog.lift`: For a log adic space X over Y, morphisms `X→Y⟨P⟩` of log adic spaces over Y correspond to monoid maps `P→M_X(X)` whose composite with `α` lands in `O⁺_{X_ét}(X)` (Remarks 2.3.2-2.3.3).
- `TauCeti.LogAdic.MonoidAlgebraLog.plus`: The integral closure of raw `R⁺[P]` in `R[P]`; it contains every tautological monomial, is open and lies in the power-bounded subring. Use this plus ring before forming a Huber.Pair, and its completed ring of integral elements afterward.

**Checks.**

- `TauCeti.LogAdic.MonoidAlgebraLog.nat_polydisc`: For `P=ℕⁿ` and `(R,R⁺)=(k,k°)`, `Spa(k⟨P⟩,k°⟨P⟩)` is the unit polydisc Dⁿ and `P^log` is the log structure associated with `(a₁,…,aₙ)↦T₁^{a₁}⋯Tₙ^{aₙ}`.
- `TauCeti.LogAdic.MonoidAlgebraLog.int_circle`: For `P=ℤ`, `Spa(k⟨P⟩,k°⟨P⟩)` is the circle `|T|=1` and `P^log` is the trivial log structure, because the image of P consists of units.
- `TauCeti.LogAdic.MonoidAlgebraLog.zero_monoid`: For `P=0`, `Y⟨P⟩→Y` is the identity of Y with the trivial log structure.
- `TauCeti.LogAdic.MonoidAlgebraLog.origin_nontrivial`: For `P=ℕ`, the point `T=0` lies in `Spa(k⟨ℕ⟩,k°⟨ℕ⟩)` and has characteristic `ℕ`, so `P^log` is not trivial and `Spa(k⟨ℕ⟩,k°⟨ℕ⟩)` is not the punctured disc.
- `TauCeti.LogAdic.MonoidAlgebraLog.torsion_units`: For `R=Q₂`, `R⁺=Z₂` and `P=C₂` with generator u and `u²=1`, `e=(1+u)/2` satisfies `e²=e`. It is integral over raw `Z₂[C₂]`, but is not in that raw subring because its two coefficients are `1/2`. Thus e belongs to `R[P]⁺` and a raw-plus constructor would fail the Huber-pair integral-closure condition. The algebraic Q/Z model has the same coefficient calculation.
- For `P=ℕ` over k, `Spa(k⟨P⟩,k°⟨P⟩)` is the closed unit disc with log structure generated by T, not the punctured disc with the trivial log structure.

Sources: [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lem. 2.2.11 and Rem. 2.2.12, pp. 9-10.

*Needs:* [6.2](#section-6-2); `CrystallineCohomology` CR.5:log-algebra (associated log); `TauCeti.Huber.Pair`; `AdicSpacesPartII` R0 (noetherian type huber ring); `AdicSpacesPartII` R0 (topologically finite type noetherian type); `AdicSpacesPartII` R0 (locally noetherian adic space); `AdicEtaleGeometry` A1 (etale structure sheaf).

<a id="section-6-4"></a>

### 6.4 Charts of log adic spaces and of morphisms

Prove `TauCeti.LogAdic.chart_theory` for 6.0's integral-image charts. Strict toric maps require finitely generated P and étale-sheafy monoid spaces. Fine/integral and fs/saturated equivalences need X locally noetherian coherent; sharp charts need fine/fs X. Morphism charts satisfy `f♯f⁻¹θ_X=θ_Yu`.

- `TauCeti.LogAdic.chart_equivStrictToric`: charts modeled on P correspond to strict morphisms to `Spa(R⟨P⟩, R⁺⟨P⟩)` or to Y⟨P⟩.
- `TauCeti.LogAdic.chart_characteristic`: `P/(α∘θ)^{−1}(O^×_{x̄}) ≅ M̄_{X,x̄}`.
- `TauCeti.LogAdic.isFs_iff_saturated`: for locally noetherian coherent X, fine iff integral and fs iff saturated.
- `TauCeti.LogAdic.exists_characteristic_chart`: étale-local charts modeled on `M̄_{X,x̄}` for fine (fs) X.
- `TauCeti.LogAdic.ChartHom`: charts of morphisms, with étale-local existence for fine (fs) morphisms.

**Checks.**

- `TauCeti.LogAdic.chart_coordinate_axis`: For the chart `ℕ → k⟨T⟩`, `1 ↦ T`, the characteristic at `T = 0` is `ℕ` and off `T = 0` it is 0.
- `TauCeti.LogAdic.chart_unit`: A chart all of whose images are units has zero characteristic everywhere.
- `TauCeti.LogAdic.chart_reject_inverse_p`: On `Spa(ℚ_p, ℤ_p)`, `ℕ → ℚ_p`, `1 ↦ p^{−1}`, logifies to the trivial log structure but gives no morphism to `Spa(ℚ_p⟨ℕ⟩, ℤ_p⟨ℕ⟩)`, since `p^{−1} ∉ ℤ_p`; `1 ↦ p` is a chart of the same log structure and gives such a strict morphism.

Sources: [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), §2.3, Rems. 2.3.2–2.3.4, p. 13.

*Needs:* [6.2](#section-6-2); [6.3](#section-6-3); [6.0](#section-6-0); `CrystallineCohomology` CR.5:log-algebra (log chart); `TauCeti.Huber.Pair`; `AdicSpacesPartII` R0 (locally noetherian adic space); `AdicSpacesPartII` R0 (topologically finite type noetherian type); `AdicSpacesPartII` R0 (noetherian type stably sheafy).

<a id="section-6-5"></a>

### 6.5 Analytic normal-crossings log structures

For normal rigid X/k over any nonarchimedean k and Cartier D, use `M_X=O_X∩j_*O_U×`, `U=X−D`, its maximal trivial-log open. If X is smooth and D reduced normal crossings, étale-locally `(X,D)=(S×D^m,S×{∏T_i=0})` after finite separable extension as needed. Coordinate charts give characteristics and smooth toric charts; algebraic SNC analytification agrees after rescaling equations into `O⁺`.

- `TauCeti.LogAdic.DivisorialLog`: The log structure `O_X∩j_*O_U×` associated to the specified boundary complement.
- `TauCeti.LogAdic.DivisorialLog.restrict_open`: Restriction to U is the trivial log structure.
- `TauCeti.LogAdic.DivisorialLog.chart`: Étale locally on a normal crossings chart `S×D^m`, `ℕ^m→M_X`, `e_i↦T_i`, is an fs chart with images in `O⁺`; the characteristic at a point on exactly s branches is `ℕ^s`.
- `TauCeti.LogAdic.DivisorialLog.analytification`: For an algebraic smooth pair with strict normal crossings boundary, the logified pullback of the algebraic divisorial log structure to the analytification agrees with the analytic divisorial log structure; charts use local equations rescaled into `O⁺`.
- `TauCeti.LogAdic.DivisorialLog.trivial_locus`: `U=X−D` is the maximal open subspace on which `M_X` is the trivial log structure (Example 2.3.16).
- `TauCeti.LogAdic.DivisorialLog.smoothToricChart`: Étale locally X has a strictly étale `X→Dⁿ`, `n=dim X`, composed of rational localisations and finite étale maps, pulling `{T₁⋯T_m=0}` back to D (Example 3.1.13); hence X is log smooth over k.

**Checks.**

- `TauCeti.LogAdic.DivisorialLog.empty_boundary`: If D is empty, `M=O_X×`.
- `TauCeti.LogAdic.DivisorialLog.double_intersection`: At the crossing `T₁=T₂=0`, characteristic monoid is `N²`, while at its generic branches it is N.
- `TauCeti.LogAdic.DivisorialLog.not_all_functions`: At a point of U, a function vanishing at that point is not a section of M; M is not all of `O_X`.
- `TauCeti.LogAdic.DivisorialLog.unscaled_equation`: On the closed unit disc over k with `D={T=0}` and `c∈k` with `|c|>1`, the map `ℕ→M_X`, `1↦cT`, logifies to `M_X` but is not a chart because `cT∉O⁺`; the map `1↦T` is a chart.
- The construction applies to toroidal compactifications only with the requisite smooth/normal crossings charts.
- U is exactly the locus where the log structure is trivial.

Sources: [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Example 2.3.16, p. 16.

*Needs:* [6.4](#section-6-4); [6.3](#section-6-3); [6.7](#section-6-7); `CrystallineCohomology` CR.5:log-algebra (divisorial log); AdicSpacesPartIV R4 (smooth pair); AdicSpacesPartIV R4 (analytification of smooth pair); `AdicSpacesPartII` R1 (analytification functor); `AdicSpacesPartII` R0 (smooth morphism).

<a id="section-6-6"></a>

### 6.6 Saturated analytic log fibre products

Work with locally noetherian log spaces. Integralization of coherent spaces and saturation of fine spaces are right adjoints, with closed immersion and finite surjection respectively, preserving strict finite/étale maps and computed by chart base change. For coherent X, saturation factors through its integralization and need not surject onto X. Logify pushouts then integralize/saturate for products; require the underlying product (e.g. one map lft). The four-point lemma requires both maps lft and one exact.

- `TauCeti.LogAdic.FsAdicPullback`: The analytic fs fibre product, with projections and compatibility over the base.
- `TauCeti.LogAdic.FsAdicPullback.lift`: Compatible fs log maps have a unique map to the fs pullback.
- `TauCeti.LogAdic.FsAdicPullback.strict_base_change`: Under strict base change the induced log structure is the ordinary pullback structure.
- `TauCeti.LogAdic.FsAdicPullback.symmetry`: Interchanging factors gives the canonical involutive isomorphism.
- `TauCeti.LogAdic.FsAdicPullback.integralization`: `X↦X^int` is right adjoint to the inclusion of locally noetherian fine into coherent log adic spaces, with `X^int→X` a closed immersion (Proposition 2.3.23(1)).
- `TauCeti.LogAdic.FsAdicPullback.saturation`: For fine X, `X↦X^sat` is right adjoint to the inclusion of locally noetherian fs into fine log adic spaces, and `X^sat→X` is finite and surjective. On coherent spaces the right adjoint is `X^sat=(X^int)^sat`, with finite map `X^sat→X` factoring as the finite surjection `X^sat→X^int` followed by the integralization closed immersion `X^int→X` (Proposition 2.3.23(2), Remark 2.3.24).
- `TauCeti.LogAdic.FsAdicPullback.chart`: For fs charts `P→Q`, `P→R` of `Y→X`, `Z→X`, the fs product is modeled on `(Q⊕_P R)^sat` (Remark 2.3.29); separately, for a locally noetherian W over a locally noetherian fs T with a global chart modeled on a fine P, `W^sat≅W×_{T⟨P⟩}T⟨P^sat⟩` as adic spaces (Remark 2.3.26).
- `TauCeti.LogAdic.FsAdicPullback.exists_point_of_exact`: For lft f, g with f exact, points y, z over a common x lift to a point of the fs product (Proposition 2.3.32).

**Checks.**

- With trivial log structures the fs fibre product is the ordinary adic product with trivial log structure.
- For 6.2's chart `P=⟨u,e | u²=1, ue=e⟩` on `Spa(C,O_C)`, `u↦−1`, `e↦0`, integralization cancels e and forces `u=1`. Chart base change imposes `−1=1` in C, so `X^int=X^sat=∅` although X is nonempty. The finite surjection is onto `X^int`, not onto X.
- Over the coordinate log bidisc, root the first coordinate by `U^n=T₁` in one cover and the second by `V^m=T₂` in the other, with m,n invertible. Their fs product has chart `ℕ²`, `T₁=U^n,T₂=V^m`, with no extra saturation components: the two roots are independent.

- `TauCeti.LogAdic.FsAdicPullback.identity`: `Y×_X X≃Y` as fs log adic spaces.
- `TauCeti.LogAdic.FsAdicPullback.root_double`: For X the closed unit disc over k with chart `ℕ (1↦T)`, `Y=Spa(k⟨U⟩)` with `Uⁿ=T` and chart `ℕ→ℕ` multiplication by n, where n is invertible in k and `μ_n⊂k`: `(ℕ⊕_ℕℕ)^sat≅ℕ⊕ℤ/n`, so the fs product `Y×_X Y` is the disjoint union over `ζ∈μ_n` of copies of `Y (V=ζU)`, whereas the ordinary product `Spa(k⟨U,V⟩/(Uⁿ−Vⁿ))` is connected.
- `TauCeti.LogAdic.FsAdicPullback.mapping_property`: Two morphisms from an fs test space coincide if their two projection maps coincide.
- Keep the fs universal property separate from any claim about ordinary adic product points.
- The fs self-product of a Kummer root cover is computed through the saturated pushout, not the ordinary product.

Sources: [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Prop. 2.3.23(1)–(2), p. 18, and Remark 2.3.24, p. 19.

*Needs:* [6.4](#section-6-4); [6.3](#section-6-3); `CrystallineCohomology` CR.5:log-algebra (integral log fiber product); `CrystallineCohomology` CR.5:log-algebra (saturated monoid); `AdicSpacesPartII` R0 (fibre products existence); `AdicSpacesPartII` R0 (fibre product points); `AdicSpacesPartII` R0 (finite morphism); [6.1](#section-6-1); `AdicSpacesPartII` R0 (closed adic subspaces and embeddings).

<a id="section-6-7"></a>

### 6.7 Analytic log smoothness and log étaleness

Prove `TauCeti.LogAdic.log_smooth_chart_criterion`. For locally noetherian fs `f:Y→X`, log smoothness (log étaleness) means étale-locally an fs chart `u:P→Q` with finite `ker u^gp` and finite torsion part of `coker u^gp` (finite whole cokernel), of orders invertible in `O_X`, and étale comparison `Y→X×_{X⟨P⟩}X⟨Q⟩`. Such f is lft. A prescribed global fs P admits injective local charts satisfying this criterion; Q is torsion-free when P is. Prove composition/fs-base-change stability and equality with ordinary smoothness/étaleness for strict maps. Log smooth X over a trivial-log affinoid field has sharp toric charts, strictly étale composites of rational and finite étale maps; if X is also smooth take `P=ℕⁿ`, a chart to `Dⁿ`.

**Checks.**

- The strict smooth projection `D²→D` with trivial log structures is log smooth but not log étale: its ordinary relative dimension is one.
- In characteristic p the coordinate p-th-root map fails the chart criterion because the group cokernel has order p, which is not invertible in O; it is not log étale.

- Toric singularities are valid log smooth examples.
- In characteristic zero, p-th coordinate roots are log étale although p is not a unit of `O⁺`.

Sources: [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Def. 3.1.1 and Rem. 3.1.2, p. 21.

*Needs:* [6.6](#section-6-6); [6.4](#section-6-4); [6.3](#section-6-3); `CrystallineCohomology` CR.5:log-algebra (log smooth chart criterion); `AdicEtaleGeometry` A1 (etale site); `AdicSpacesPartII` R0 (smooth morphism); `AdicSpacesPartII` R0 (differentials unramified smooth etale); `AdicSpacesPartII` R0 (restricted power series smooth); `AdicSpacesPartII` R0 (smooth etale base change); `AdicSpacesPartII` R0 (etale smooth composition).

<a id="section-6-8"></a>

### 6.8 Continuous analytic log derivations

For pre-log Huber maps `(A,M,α)→(B,N,β)`, require continuous f and `βf♯=fα`; log Huber rings are complete with the prescribed unit fibre. Into complete Hausdorff B-module L, a log derivation is continuous A-derivation d and monoid-additive δ with `δ(f♯m)=0`, `dβ(n)=β(n)δ(n)`.

- `TauCeti.LogAdic.ContinuousLogDerivation`: Bundle a continuous derivation and monoid-to-additive map satisfying the relative-zero and compatibility equations.
- `TauCeti.LogAdic.ContinuousLogDerivation.ext`: Equality of d and `δ` gives equality of the log derivation.
- `TauCeti.LogAdic.ContinuousLogDerivation.map_structural`: `d(βn)=βn·δ(n)`.
- `TauCeti.LogAdic.ContinuousLogDerivation.postcompose`: A continuous B-linear map `L→L′` induces a log derivation to L′; identity and composite maps agree.
- `TauCeti.LogAdic.ContinuousLogDerivation.instModule`: `Der^log_A(B,L)` is a B-module, with operations computed componentwise on d and `δ` (Definition 3.2.2).
- `TauCeti.LogAdic.ContinuousLogDerivation.toDerivation`: `(d,δ)↦d`, the forgetful B-linear map to continuous A-derivations; it is bijective when `M=α⁻¹(A×)` and `N=β⁻¹(B×)`.
- `TauCeti.LogAdic.ContinuousLogDerivation.deltaGp`: The unique group map `(ᵃN)^gp→L` extending `δ`, which vanishes on the image of `M^gp` (Remark 3.2.3).
- `TauCeti.LogAdic.ContinuousLogDerivation.logificationEquiv`: `Der^log_A(B,L)` is unchanged when `(B,N,β)` is replaced by its logification `(B,ᵃN,β)` (Remark 3.2.3).

**Checks.**

- `TauCeti.LogAdic.ContinuousLogDerivation.zero`: The pair of zero maps is a continuous log derivation.
- `TauCeti.LogAdic.ContinuousLogDerivation.unit_formula`: For a unit `β(n)`, `δ(n)=β(n)⁻¹d(β(n))`.
- `TauCeti.LogAdic.ContinuousLogDerivation.boundary_value`: For `B=k⟨T⟩` with `N=ℕ`, `β(1)=T`, over k with the pre-log structure given by the zero monoid `M=0` (whose logification is the trivial log structure; with `M=k×` no compatible `f♯:k×→ℕ` exists): into `L=B`, `d=T·d/dT` gives `d(T)=T` and forces `δ(1)=1`; into `L=B/(T)=k`, the pair `d=0`, `δ(1)=1` is a log derivation, so `d(T)=0` at `T=0` does not force `δ(1)=0` and `δ` is not determined by d.
- `TauCeti.LogAdic.ContinuousLogDerivation.trivial_log`: If `M=α⁻¹(A×)` and `N=β⁻¹(B×)`, every continuous A-derivation `d:B→L` extends uniquely to a log derivation, by `δ(n)=β(n)⁻¹d(β(n))`.
- On a coordinate chart, `δ(T)` is dlog T even at `T=0`.

Sources: [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Def. 3.2.1, p. 26.

*Needs:* `CrystallineCohomology` CR.5:log-algebra (prelog ring); `CrystallineCohomology` CR.5:log-algebra (associated log); `Derivation`; `TauCeti.Huber.Pair`; `AdicSpacesPartII` R0 (continuous differentials).

<a id="section-6-9"></a>

### 6.9 Continuous log differential modules

For complete pre-log Huber `(A,M)→(B,N)`, require A of noetherian type, tft ring map and finitely generated `N^gp/((f♯M)^gp·β⁻¹(B×))`. Use `J/J²` for the completed diagonal quotient by `e^{f♯m}−1` and `β(n)⊗1−(1⊗β(n))e^n`, J its kernel to B. Set `d(b)=[b⊗1−1⊗b]`, `δ(n)=[e^n−1]`; negate the imported opposite diagonal generator.

- `TauCeti.LogAdic.ContinuousLogDifferentials`: The complete representing module with d and dlog.
- `TauCeti.LogAdic.ContinuousLogDifferentials.lift`: Continuous B-linear maps out correspond bijectively to continuous log derivations.
- `TauCeti.LogAdic.ContinuousLogDifferentials.lift_unique`: A map is determined by values on d(b) and dlog(n).
- `TauCeti.LogAdic.ContinuousLogDifferentials.strict`: For a strict map the module identifies with the imported continuous `Ω¹_{B/A}`.
- `TauCeti.LogAdic.ContinuousLogDifferentials.presentation`: `Ω^log_{B/A}≅(Ω_{B/A}⊕(B⊗_ℤN^gp))/R` with R generated by `(dβ(n),−β(n)⊗n)` and `(0,1⊗f♯(m)) ((3.2.7)-(3.2.8))`.
- `TauCeti.LogAdic.ContinuousLogDifferentials.finite`: `Ω^log_{B/A}` is a finite B-module, complete and Hausdorff for its natural topology, and d is continuous.
- `TauCeti.LogAdic.ContinuousLogDifferentials.dlog_unit`: If `β(n)` is a unit then `δ(n)=β(n)⁻¹·d(β(n))`; `δ(f♯(m))=0`.
- `TauCeti.LogAdic.ContinuousLogDifferentials.exact_sequence`: For tft `(A,M)→(B,N)→(C,O)`, `C⊗_BΩ^log_{B/A}→Ω^log_{C/A}→Ω^log_{C/B}→0` is exact; it is split exact on the left when `B→C` is formally log smooth for first-order log thickenings, `Ω^log_{C/B}=0` when `B→C` is formally log unramified, and the converses hold when C is formally log smooth over A (Theorem 3.2.18, Definitions 3.2.11 and 3.2.14).
- `TauCeti.LogAdic.ContinuousLogDifferentials.monoidAlgebra`: For fine monoids `u:P→Q` with `ker(u^gp)` and the torsion of `coker(u^gp)` (resp. `coker(u^gp)`) finite of order invertible in R, R⟨Q⟩ is formally log smooth (resp. log étale) over R⟨P⟩ and `δ` induces `Ω^log_{R⟨Q⟩/R⟨P⟩}≅R⟨Q⟩⊗_ℤ(Q^gp/u^gp(P^gp))`, a finite free R⟨Q⟩-module because the torsion of the cokernel has order invertible in R (Proposition 3.2.25).

**Checks.**

- `TauCeti.LogAdic.ContinuousLogDifferentials.identity`: For the identity log Huber map the module is zero.
- `TauCeti.LogAdic.ContinuousLogDifferentials.toric_rank`: Over k, `Ω¹_log` of `k⟨T₁,…,T_r⟩` with coordinate log structure is free on `dlog T_i`.
- `TauCeti.LogAdic.ContinuousLogDifferentials.coordinate_relation`: In that module `dT_i=T_i dlog T_i`; imposing `dlog T_i=0` at `T_i=0` is incorrect.
- `TauCeti.LogAdic.ContinuousLogDifferentials.diagonal_sign`: For the coordinate chart T, use `d(T)=T·δ(1)`. The square-zero lift of `T⊗1−1⊗T` has second component d(T), while `e^1−1` has `δ(1)`. The alternative lift `b₁⊗b₂↦(b₁b₂,b₁d(b₂))` gives `−d(T)` and fails the structural relation when `d(T)≠0` in characteristic zero.
- Its rank on a log toric n-disc is n, including along the boundary.

Sources: [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Def. 3.2.4, p. 26.

*Needs:* [6.8](#section-6-8); `CrystallineCohomology` CR.5 (log differentials); `AdicSpacesPartII` R0 (continuous differentials); `AdicSpacesPartII` R0 (completed tensor product); `AdicSpacesPartII` R0 (first fundamental sequence).

<a id="section-6-10"></a>

### 6.10 Analytic log differentials and transitivity

Prove `TauCeti.LogAdic.log_differential_descent`. For lft `f:Y→X` of locally noetherian coherent log adic spaces, glue 6.9's noetherian étale-affinoid modules to coherent `Ω^log_{Y/X}` with universal continuous `(d,δ)` into complete topological module sheaves, agreeing with every affine chart. Formation commutes with coherent/fine/fs base change. For lft `Y→X→S`, `f*Ω^log_{X/S}→Ω^log_{Y/S}→Ω^log_{Y/X}→0` is exact. For fs f log smooth, the first map is injective and the last module locally free of chart group-cokernel rank; for log étale f the first map is an isomorphism and the last module zero. If the composite is log smooth these implications reverse. If `X→S` is log étale, `Ω^log_{Y/S}≅Ω^log_{Y/X}` and log smoothness/étaleness of f equals that of the composite. For fs lft maps, the chart definitions equal the étale-local lifting definitions along strict first-order thickenings: existence for formal smoothness, uniqueness for formal étaleness. The injection is locally split.

Parts (3)–(4) require fs spaces and fs products. The sheaf injection is locally split; no global splitting is asserted.

**Checks.**

- A strict étale pullback preserves `Ω¹_log`.
- A Kummer étale coordinate root has relative `Ω¹_log=0` after its index is invertible.

Sources: [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Construction 3.3.2, Lem. 3.3.3, Construction 3.3.4 and Lem. 3.3.5, pp. 34–35.

*Needs:* [6.9](#section-6-9); [6.7](#section-6-7); [6.6](#section-6-6); AdicSpacesPartIII R3 (coherent sheaf); AdicSpacesPartIII R3 (coherent sheaf operations); AdicSpacesPartIII R3 (sheaf of continuous differentials); [6.1](#section-6-1); AdicSpacesPartIII R3 (tate kiehl affinoid); AdicSpacesPartIII R3 (locally free sheaf).

<a id="section-6-11"></a>

### 6.11 Analytic log de Rham complexes and residues

For log smooth locally noetherian fs `X→S`, form the continuous exterior-power de Rham complex. Coherent coefficient connections are k-linear, Leibniz and integrable (S-linear relatively). For smooth rigid normal-crossings pairs, define residues on each component's normalization, shrinking smooth connected and extending k for toric coordinates. They send `dlog T₁` to 1 and regular forms to zero; pullback uses integer multiplicities.

- `TauCeti.LogAdic.AnalyticLogDR`: The cohomological continuous coefficient log de Rham complex.
- `TauCeti.LogAdic.AnalyticLogDR.d_sq`: Successive differentials compose to zero by integrability.
- `TauCeti.LogAdic.AnalyticLogDR.residue`: The residue along an irreducible boundary component Z: `Res_Z(∇)=∇(T₁∂/∂T₁) mod T₁` on `F|_Z`, and on forms the map `Ω^log_X|_Z→O_Z`, `dlog T₁↦1`.
- `TauCeti.LogAdic.AnalyticLogDR.pullback_residue`: Residues transform by the integer boundary-multiplicity matrix: `Res_W(h*∇)=Σ_{h(W)⊂Z}m_{WZ}h_{WZ}*Res_Z(∇)`.
- `TauCeti.LogAdic.AnalyticLogDR.forms`: `Ω^{log,a}_{X/S}=∧^aΩ^log_{X/S}` for log smooth `X→S`, with the graded differential extending d and `d(δ(m))=0` (DLLZ-adic Definition 3.3.19).
- `TauCeti.LogAdic.AnalyticLogDR.leibniz`: `∇(fe)=f∇(e)+e⊗df` for sections f of `O_X` and e of E, extended to `E⊗Ω^{log,•}` by the graded Leibniz rule.
- `TauCeti.LogAdic.AnalyticLogDR.residue_independent`: `Res_Z(∇)` does not depend on the local equation T₁ of Z and is compatible with rational localisation (DLLZ-RH §3.4).

**Checks.**

- `TauCeti.LogAdic.AnalyticLogDR.empty_boundary`: With trivial log structure this is the ordinary continuous de Rham complex.
- `TauCeti.LogAdic.AnalyticLogDR.residue_coordinate`: `res_{T=0}(dlog T)=1`, while `res(dT)=0`.
- `TauCeti.LogAdic.AnalyticLogDR.root_pullback`: Under `T=S^n`, pullback `dlog T=n dlog S` and its residue is n.
- The degree-zero term is E and its first differential is `∇`.
- The residue of dT₁ along `T₁=0` is 0, since `dT₁=T₁ dlog T₁`.

Sources: [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Def. 3.3.19, p. 40; [DLLZ-RH], Def. 3.1.7(4), p. 24; §3.4, (3.4.1), p. 33; Thm. 3.2.3(4), p. 25, and proof of Cor. 3.5.7, p. 40.

*Needs:* [6.10](#section-6-10); [6.5](#section-6-5); [6.7](#section-6-7); `CrystallineCohomology` CR.5 (log de rham); AdicSpacesPartIII R3 (sheaf of continuous differentials); AdicSpacesPartIII R3 (coherent sheaf operations).

<a id="section-6-12"></a>

### 6.12 Kummer étale maps: charts, the log-étale characterisation, cancellation and openness

Use the Kummer and Kummer-log-étale conditions underlying `PrismaticCohomologyPartIV` §8.60's shared `TauCeti.LogAdic.KummerEtaleSite` for locally noetherian fs maps. Define `TauCeti.LogAdic.IsKummer` and `TauCeti.LogAdic.IsKummerEtale` as local aliases of those supplied conditions, definitionally compatible with the site's objects. Prove the additional chart, cancellation and openness API `TauCeti.LogAdic.kummerEtale_theory`. Kummer means injective sharp-characteristic maps with a power of every target element in the image. The chart criterion is étale-local on both spaces (only the target for finite maps): fs Kummer `P→Q`, finite invertible group index, étale comparison (finite étale in the finite case). Prescribed P is sharp torsion-free, Q can be sharp; use fs base change.

- `TauCeti.LogAdic.kummerEtale_iff_chart`: the chart description, with the index invertible in `O_Y`.
- `TauCeti.LogAdic.kummerEtale_rootChart`: Lemma 4.1.10's choice of chart with prescribed P and sharp Q.
- `TauCeti.LogAdic.kummerEtale_iff_logEtale_exact`: Kummer étale iff log étale and Kummer iff log étale and exact.
- `TauCeti.LogAdic.kummerEtale_stalk`: stalkwise Kummer homomorphisms with invertible index.
- `TauCeti.LogAdic.kummerEtale_of_comp`: cancellation.
- `TauCeti.LogAdic.kummerEtale_isOpenMap`: openness.
- `TauCeti.LogAdic.kummerEtale_of_strictEtale`: strictly étale maps are Kummer étale.
- `TauCeti.LogAdic.kummerEtale_comp`, `TauCeti.LogAdic.kummerEtale_baseChange`: stability under composition and fs base change, also for finite Kummer étale maps.

**Checks.**

- `TauCeti.LogAdic.kummerEtale_strict`: A strict Kummer étale map is ordinarily étale.
- `TauCeti.LogAdic.kummerEtale_root_char_zero`: `T = S^p` with coordinate log structures is Kummer étale over a characteristic-zero p-adic field: the index p must be invertible in `O_Y`, not in `O⁺_Y`.
- `TauCeti.LogAdic.kummerEtale_reject_root_char_p`: Over a field of characteristic p the same coordinate root map is not log étale, because the index p is not invertible in `O_X`.
- Trivial log structures give ordinary étale (resp. finite étale) morphisms.

Sources: [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Def. 4.1.2 (1)–(2), p. 41.

*Needs:* `PrismaticCohomologyPartIV` §8.60 (the supplied log-adic carriers and Kummer foundations); [6.7](#section-6-7); [6.6](#section-6-6); [6.10](#section-6-10); [6.2](#section-6-2); [6.4](#section-6-4); [6.0](#section-6-0); `CrystallineCohomology` CR.5:log-algebra (kummer morphism).

<a id="section-6-13"></a>

### 6.13 Finite root covers and their Galois group

For locally noetherian log X, torsion-free fs chart P and `n≥1`, form root covers. For fs Kummer `P→Q` put `G=Q^gp/u^gpP^gp`, `G_X^D=X⟨G⟩`, the constant character group when roots are present. Invertible index gives Kummer étaleness. Strictification/refinement requires noetherian X and a sharp chart; choose root order invertible if X has at most one positive residue characteristic.

- `TauCeti.LogAdic.RootCover`: The n-th root cover `X×_{X⟨P⟩}X⟨(1/n)P⟩` of a torsion-free fs chart, and more generally the standard cover `X×_{X⟨P⟩}X⟨Q⟩` of a Kummer chart `P→Q`.
- `TauCeti.LogAdic.RootCover.action`: `Hom((1/n)P^gp/P^gp,μ_n)` acts by multiplying the root monomial of a by its character.
- `TauCeti.LogAdic.RootCover.refine`: For n dividing m the m-th root cover maps to the n-th root cover, compatibly under divisibility composition.
- `TauCeti.LogAdic.RootCover.strictify`: For X noetherian with a sharp fs chart, every quasi-compact Kummer étale (resp. finite Kummer étale) `Y→X` becomes étale (resp. finite étale) after base change to some `X^{1/n}` (Lemma 4.2.5).
- `TauCeti.LogAdic.RootCover.finite_surjective`: The standard cover is finite and surjective, and finite Kummer étale when the order of G is invertible in `O_X` (Definition 4.1.5, Proposition 4.1.6(1)).
- `TauCeti.LogAdic.RootCover.galois`: `G^D_X×_X Y≃Y×_X Y`, and for |G| invertible `Y→X` is an open Galois finite Kummer étale cover with group `G^D_X` (Proposition 4.1.6(3)–(4)).
- `TauCeti.LogAdic.RootCover.cech_exact`: For affinoid X with a sharp chart the Čech complex `O(X)→O(Y)→O(Y×_X Y)→⋯` of a standard Kummer cover is exact, with an `O(X)`-linear contracting homotopy (Lemma 4.3.2).
- `TauCeti.LogAdic.RootCover.refine_covering`: A finitely indexed Kummer étale covering of a noetherian X with a sharp chart is refined by one whose members are étale over root covers `X^{1/n_j}` and become a strict étale covering over `X^{1/n}` (Lemma 4.2.6).

**Checks.**

- `TauCeti.LogAdic.RootCover.one`: The first root cover is X.
- `TauCeti.LogAdic.RootCover.disc_action`: For `P=N` and `μ_n` present, `ζ` sends S to `ζS` on `T=S^n`.
- `TauCeti.LogAdic.RootCover.ramified_boundary`: For `n>1` the root map on the log disc has ramification index n at `T=0` and is not strict étale there.
- `TauCeti.LogAdic.RootCover.polydisc_degree`: For `P=N^r` over an affinoid field k with n invertible in k and `μ_n⊂k`, `X^{1/n}→X` is finite of degree `n^r` with Galois group `μ_n^r` acting coordinatewise on `S_i`, `S_i^n=T_i`.
- `TauCeti.LogAdic.RootCover.no_uniform_noncompact`: Let X be a coordinate log disc over `C_p` and let Y be the disjoint union of its q-th root discs, indexed by all primes q. For any root level n choose q not dividing n: its saturated pullback still has characteristic index `q/gcd(q,n)=q` at the boundary, so Y cannot become strict étale at that single level. Quasi-compactness or a uniform exponent bound is essential.
- Do not call the cover ordinarily étale along its boundary.

Sources: [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Def. 4.1.5, p. 41.

*Needs:* [6.12](#section-6-12); [6.4](#section-6-4); [6.6](#section-6-6); `AdicSpacesPartII` R0 (fibre products existence); `AdicSpacesPartII` R0 (finite algebra over affinoid); `AdicSpacesPartII` R0 (finite morphism); [6.3](#section-6-3).

<a id="section-6-14"></a>

### 6.14 Characteristic ramification index

For locally noetherian fs Kummer maps, use the characteristic-cokernel exponent at each geometric point. Define the global index only when its least common multiple exists.

- `TauCeti.LogAdic.RamificationIndex`: The exponent of the characteristic group cokernel at the specified geometric point of a Kummer map.
- `TauCeti.LogAdic.RamificationIndex.index_one`: A Kummer étale map has index one at every geometric point iff it is strictly étale.
- `TauCeti.LogAdic.RamificationIndex.base_change`: Compute the index from the saturated base-changed characteristic map; it can decrease after root base change.
- `TauCeti.LogAdic.RamificationIndex.global`: The least common multiple of the local indices of a Kummer étale map, when it exists.
- `TauCeti.LogAdic.RamificationIndex.isUnit`: For Kummer étale f the local index at y is invertible in `O_{Y,y}` (Lemma 4.1.11(2)).

**Checks.**

- `TauCeti.LogAdic.RamificationIndex.identity`: The identity has index one.
- `TauCeti.LogAdic.RamificationIndex.two_coordinates`: Multiplication by n on `N²` has index n, since the cokernel is `(Z/n)²`.
- `TauCeti.LogAdic.RamificationIndex.off_boundary`: On the boundary complement the coordinate-root characteristic cokernel is zero and the index is one.
- `TauCeti.LogAdic.RamificationIndex.root_cover_strata`: For the n-th root cover of a chart modeled on `N^r`, the index at a point where exactly `s≥1` coordinates vanish is n (cokernel `(Z/n)^s`), and 1 where none vanish.
- A product of two n-th coordinate roots has index n, not `n²`.

Sources: [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Def. 4.1.12, p. 44.

*Needs:* [6.12](#section-6-12); `CrystallineCohomology` CR.5:log-algebra (characteristic monoid).

<a id="section-6-15"></a>

### 6.15 Structure sheaves and projections on the Kummer étale site

Use `PrismaticCohomologyPartIV` §8.60's shared `TauCeti.LogAdic.KummerEtaleSite`, via `NoetherianFsLogAdicSpace.kummerSite` and `.kummerTopology` and prove `TauCeti.LogAdic.kummerEtaleSite_sheaves` for locally noetherian fs X. Structure sheaves evaluate as O, `O⁺`, M on each object; `f_két,*F(U)=F(U×_XY)`, with exact left adjoint and coherent composition. The chart basis gives an equivalent topos.

- The underlying site, jointly surjective topology and fs pullbacks are supplied by `NoetherianFsLogAdicSpace.kummerSite` and `.kummerTopology`; the following sheaf and projection API is constructed on that site.
- `TauCeti.LogAdic.kummerEtaleSite_generated`: generation by strictly étale maps and standard Kummer covers.
- `TauCeti.LogAdic.kummerEtaleSite_structureSheaves`: the sheaves O, `O⁺`, M on `X_két`.
- `TauCeti.LogAdic.kummerEtaleSite_representable`: `Mor_X(−, Y)` is a sheaf for every Y over X.
- `TauCeti.LogAdic.kummerEtaleSite_affinoid_acyclic`: `H^i(X_két, O) = 0` for affinoid X and `i > 0`.
- `TauCeti.LogAdic.kummerEtaleSite_epsilon`: `ε_ét`, `ε_an` with `Rε_*O = O` and `ε_ét,*M = M`.
- `TauCeti.LogAdic.kummerEtaleSite_pullback`: `f_két` with `f_két,*` and `f_két^{−1}`, coherent for composition.
- `TauCeti.LogAdic.kummerEtaleSite_chartBasis`: the basis of affinoids with global fs charts.

**Checks.**

- `TauCeti.LogAdic.kummerEtaleSite_root_is_cover`: For n invertible on the log disc D, the n-th root cover `D → D`, `T = S^n`, is a single-member covering, surjective also over `T = 0`.
- `TauCeti.LogAdic.kummerEtaleSite_no_closed_point_shortcut`: On the closed unit disc with trivial log structure, the open disc `⋃_{m≥1}{|T|^m ≤ |ϖ|}` and the circle `{|T| = 1}` cover every rank-one point but miss the rank-two point with |T| infinitesimally below 1, so this family is not a covering.
- `TauCeti.LogAdic.kummerEtaleSite_root_invariants`: For the n-th root cover of the log disc over k with n invertible in k and `μ_n ⊂ k`, the equaliser of `O(D) ⇉ O(D ×_D D)` is `k⟨S⟩^{μ_n} = k⟨S^n⟩ = k⟨T⟩`, as sheafiness of O requires.
- For trivial log structure, `ε_ét` is an isomorphism of sites and (4) is the identity.

Sources: [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Rems. 4.1.17–4.1.18, p.47; Theorem 4.3.1, Corollary 4.3.3, Propositions 4.3.4–4.3.5, pp.52–55; §4.5, pp.65–67.

*Needs:* `PrismaticCohomologyPartIV` §8.60 (the supplied log-adic carriers and Kummer foundations); [6.12](#section-6-12); [6.13](#section-6-13); [6.2](#section-6-2); [6.1](#section-6-1); [6.0](#section-6-0); `AdicEtaleGeometry` A1 (etale site); `AdicEtaleGeometry` A1 (etale structure sheaf); `CategoryTheory.GrothendieckTopology`; `CategoryTheory.Sheaf`; `DiamondsAndVStacks` D0 (cech to derived comparison).

<a id="section-6-16"></a>

### 6.16 Affinoid Kummer coherent acyclicity

Prove `TauCeti.LogAdic.kummer_coherent_acyclicity`. For noetherian affinoid fs X, analytic coherent means pulled back from coherent modules on `X_an`; coherent means analytic coherent on a Kummer cover. Prove `H^i(X_két,F)=0`, `i>0`, for analytic coherent F, or for coherent F when X lies over an affinoid field. No general effective Kummer descent of coherent modules is asserted.

**Checks.**

- For a trivial-log noetherian affinoid and `F=O/I`, analytic coherence gives positive-degree vanishing even when `R/I` is not projective.
- On the log disc over a characteristic-zero field k, take `T=S²` and the line on the Kummer site descended from O on the root cover with sign character. Its sections are the odd eigenspace `S k⟨T⟩` and its positive cohomology vanishes by averaging over `µ₂`; the line need not descend as an analytic vector bundle across zero.

- For `F=O` recover Theorem 4.3.1.

Sources: [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 4.3.6(1)–(2) and Theorem 4.3.7(1)–(2), pp.55–56.

*Needs:* [6.15](#section-6-15); [6.13](#section-6-13); [6.1](#section-6-1); AdicSpacesPartIII R3 (coherent sheaf); AdicSpacesPartIII R3 (tate kiehl affinoid); `ClassicalAdicEtaleCohomology` §§1.1–1.4, 8.2, 11.1–11.2 (etale acyclicity of vector bundles); `DiamondsAndVStacks` D0 (cech to derived comparison).

<a id="section-6-17"></a>

### 6.17 Finite Kummer descent and the Kummer fundamental group

Prove `TauCeti.LogAdic.finite_kummer_descent`. For lft maps of locally noetherian fs log adic spaces, log smoothness, log étaleness and Kummer étaleness descend both through surjective Kummer étale base change and along a surjective Kummer étale source map. The covering map satisfies `TauCeti.LogAdic.IsKummerEtale` in each case. Finite Kummer étale objects satisfy effective descent for Kummer étale covers and cocycle data. For the supplied Kummer site, develop the finite-cover equivalence `X_fkét≃Loc(X_két)`, `Y↦Mor_X(−,Y)`, with products and finite-group quotients. Log geometric points exist over every geometric point, with complete separably closed field l and characteristic uniquely divisible by orders invertible in l; their fibres are conservative. For connected X with log basepoint ζ, this is a Galois category equivalent to finite continuous `π₁^két(X,ζ)`-sets, and likewise finite Λ-modules for finite rings Λ. Extend `PrismaticCohomologyPartIV` §8.60's `NoetherianFsLogAdicSpace.LocalSystem` from finite locally free stalks to locally constant finite Λ-modules, including torsion stalks, as `TauCeti.LogAdic.KummerLocalSystem`, with exact fibre equivalence, pullback and basepoint conjugacy. Use that supplier's log inertia `Hom(M̄^gp_{X,ξ},Ẑ′(1)(l))` and `NoetherianFsLogAdicSpace.inertiaExterior`: for positive invertible n, `R^iε_ét,*(ℤ/n)≅∧^i(M̄^gp_X/nM̄^gp_X)(−i)`, with cups and pullback. The inertia and exterior formula are supplied inputs, not additional constructions.

**Checks.**

- For a complete nonarchimedean field `k/ℚ_p`, with trivial log structures, put `A=k[ε]/(ε²)`, `D=Spa(A,A°)` and `S=Spa(k,k°)`. The reduction `i:S→D` is finite, topologically surjective, strict and Kummer but not flat, hence neither log smooth nor log étale nor Kummer étale. Its self-base-change is `id_S` since `k⊗_A k=k`. Also `D→S` is not smooth although its composite with i is `id_S`; both descent tests require the étale hypothesis.

- For `Λ=ℤ/p²`, the constant stalk `ℤ/p` is admitted by the torsion extension, although it is not locally free over Λ; the finite-free supplied subcategory is recovered by restricting stalks.

- For the rank-two log point, the direct images of `ℤ/n` have ranks 1, 2, 1 in degrees 0, 1, 2 and vanish above 2; with trivial log structure only degree 0 remains. These calculations also distinguish the local system of a nontrivial root character from the constant system.
- On an fs log point over a complete separably closed field l with characteristic monoid `ℕ^r`, `π₁^két ≅ Ẑ′(1)(l)^r`; over a general field it is an extension of `Gal(k^sep/k)` by this group, split for a split log point.
- For trivial log structure, `X_fkét` is the category of finite étale covers and `π₁^két` is the étale fundamental group.
- The n-th root cover of the log point with n invertible is a connected finite Kummer étale cover of degree n, although its underlying map of adic spaces is a homeomorphism.

Sources: [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Props. 4.2.7–4.2.8, pp.50–52; Theorem 4.4.15, Corollaries 4.4.18 and 4.4.22, Lemmas 4.4.27 and 4.4.29, pp.61–65.

*Needs:* `PrismaticCohomologyPartIV` §8.60 (the supplied log-adic carriers and Kummer foundations); [6.15](#section-6-15); [6.13](#section-6-13); [6.7](#section-6-7); [6.10](#section-6-10); [6.12](#section-6-12); [6.0](#section-6-0).

<a id="section-6-18"></a>

### 6.18 Normal extension of finite étale covers across a normal crossings divisor

Prove `TauCeti.LogAdic.normal_extension_boundary`. For smooth rigid X over characteristic-zero nonarchimedean k, normal-crossings D and `U=X−D`, every finite étale surjective `V→U` has a unique normal finite surjective extension `Y→X`, the normalization in V, with preimage U equal to V. Bounded analytic functions on a normal rigid W minus a nowhere dense analytic subset extend uniquely; in particular `π₀(W∩f⁻¹U)=π₀(W)` for affinoid opens W of Y. For a degree-at-most-d cover of `S×(D^r_ρ−{∏T_i=0})`, S smooth affinoid and `ρ=p^{−b(d,p)}` with explicit b depending only on d,p, each `T_i` acquires a root of order `d_i≤d` on every component after finite extension of k and a strictly finite étale cover of S.

**Checks.**

- For X the closed unit disc, `D = {0}` and `V → U` the n-th power map of the punctured disc, Y is the disc with the n-th root of the coordinate adjoined, and `Y → X` is ramified at 0.
- For `D = ∅`, (1) is the identity statement `Y = V`.
- (2) fails for unbounded functions: 1/T on the punctured disc does not extend.

Sources: [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Prop. 4.2.1 and its proof, p. 47.

*Needs:* `AdicSpacesPartII` R0 (smooth morphism); `AdicSpacesPartII` R0 (finite morphism); AdicSpacesPartIII R3 (finite morphism coherent algebra equivalence); AdicSpacesPartIV R4 (smooth pair).

<a id="section-6-19"></a>

### 6.19 Rigid logarithmic Abhyankar lemma

Prove `TauCeti.LogAdic.rigid_abhyankar`. For smooth rigid X over characteristic-zero nonarchimedean k and normal-crossings D with its divisorial fs log, every finite étale surjective `V→U=X−D` extends to normal finite surjective Kummer étale `f:Y→X`, with boundary log `f⁻¹D` and affinoid basis W satisfying `π₀(W∩f⁻¹U)=π₀(W)`. On `S×D^r_ρ`, `ρ=p^{−b(d,p)}`, after finite field extension and strict finite étale base cover, components are `S⟨Q⟩_ρ`, `ℕ^r⊂Q⊂⊕(1/d_i)ℕ`, `d_i≤d=deg f`; pulling back to the d!-root cover splits them completely, hence gives a strict finite étale cover.

Uses `T_r`.

**Checks.**

- The n-th root cover of the punctured disc extends as its log root cover, not as an ordinarily étale disc cover.

Sources: [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Prop. 4.2.1, p. 47.

*Needs:* [6.5](#section-6-5); [6.13](#section-6-13); [6.18](#section-6-18); AdicSpacesPartIII R3 (finite morphism coherent algebra equivalence).

<a id="section-6-20"></a>

### 6.20 Extension across a normal crossings boundary

Prove `TauCeti.LogAdic.boundary_local_system_extension`. For smooth rigid X/k, `char k=0`, `k⁺=O_k`, normal-crossings D and `j:U=X−D↪X`, torsion local systems extend by `j_két,*` with no positive higher direct images. Restriction and `j_két,*` are inverse, so `H^i(U_ét,L)=H^i(X_két,j_*L)`. In particular `ℤ/n=Rj_két,*(ℤ/n)`, `Rε_ét,*(ℤ/n)=Rj_ét,*(ℤ/n)` and `R^ij_ét,*(ℤ/n)=∧^i(M̄^gp_X/nM̄^gp_X)(−i)`. No properness is needed for extension; properness enters finiteness.

**Checks.**

- For empty boundary this is the identity; this alone gives no finiteness statement for a nonproper disc.
- For the punctured unit disc and `L=Z/n`, `R^1j_ét,*(Z/n)` is `Z/n(−1)` supported at 0, while `R^1j_két,*(Z/n)=0`.

Sources: [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Thm. 4.6.1, p. 68.

*Needs:* [6.19](#section-6-19); [6.17](#section-6-17); [6.13](#section-6-13); [6.15](#section-6-15); [6.5](#section-6-5); [6.0](#section-6-0); `ClassicalAdicEtaleCohomology` §11.1 (Huber's nonproper algebraic comparison and `normal_crossings_open_comparison`); `ClassicalAdicEtaleCohomology` §§1.1–1.4, 8.2, 11.1–11.2 (torsion local systems); `ClassicalAdicEtaleCohomology` §§1.1–1.4, 8.2, 11.1–11.2 (local systems and finite etale covers); `DiamondsAndVStacks` D0 (cech to derived comparison).

<a id="section-6-21"></a>

### 6.21 Pro-Kummer étale presentations

For locally noetherian fs X use pro-`X_két` with `|lim U_i|=lim|U_i|`. Finite-stage classes are pullbacks of Kummer étale/finite Kummer étale/strict étale/strict finite étale maps; they compose and base change. A pro-Kummer presentation has Kummer stages and eventually finite surjective transitions. Pro-Kummer objects have finite limits.

- `TauCeti.LogAdic.ProKummerPresentation`: A cofiltered finite-level Kummer presentation with eventually finite surjective transitions.
- `TauCeti.LogAdic.ProKummerPresentation.reindex`: Cofinal reindexing represents the same pro-object.
- `TauCeti.LogAdic.ProKummerPresentation.base_change`: Base change of the finite-level presentation represents the fs pullback pro-object, and `|U×_V W|→|U|×_{|V|}|W|` is surjective (Lemma 5.1.4(1)).
- `TauCeti.LogAdic.ProKummerPresentation.comp`: Over `W∈X_prokét`, a composite `U→V→W` of pro-Kummer étale (resp. pro-finite Kummer étale) morphisms is pro-Kummer étale (resp. pro-finite Kummer étale) and U, V lie in `X_prokét` (Lemma 5.1.4(6)).
- `TauCeti.LogAdic.ProKummerPresentation.isOpenMap`: Pro-Kummer étale morphisms induce open maps of underlying spaces (Lemma 5.1.4(4)).
- `TauCeti.LogAdic.ProKummerPresentation.IsProFinite`: The presentation is pro-finite Kummer étale when every `U_i→V` is finite Kummer étale (Definition 5.1.1(3)).

**Checks.**

- `TauCeti.LogAdic.ProKummerPresentation.constant`: Every Kummer étale `U→X` in `X_két` is pro-Kummer étale via the one-term presentation.
- `TauCeti.LogAdic.ProKummerPresentation.root_tower`: For X with a global sharp fs chart P over a characteristic-zero field, the divisibility-indexed system of root covers `X^{1/m}` is a pro-finite Kummer étale presentation over X.
- `TauCeti.LogAdic.ProKummerPresentation.eventual_surjectivity`: On the closed unit disc X with trivial log structure, the system of rational discs `{|T|≤|ϖ|^n}` has no eventually surjective transitions, and its limit is not pro-Kummer étale over X under any presentation: its image `{T=0}` in |X| is not open, while pro-Kummer étale maps are open.
- A constant Kummer object is allowed; no perfectoid condition is required.

Sources: [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Def. 5.1.1(1), p. 70.

*Needs:* [6.15](#section-6-15); [6.12](#section-6-12); `AdicEtaleGeometry` A1 (pro etale morphism).

<a id="section-6-22"></a>

### 6.22 Corrected transfinite pro-Kummer coverings

For `U∈X_prokét`, covers are jointly surjective pro-Kummer families `U_a=lim_{μ<λ}U_μ`, `U₀=U`, all stages in the site; each map to the earlier-stage limit is pulled back from a Kummer étale map, eventually finite surjective. The empty limit is U. Use DLLZ Definition 5.1.2/[Sch16]'s correction to [Sch13a].

- `TauCeti.LogAdic.CorrectedProKummerCover`: A joint-surjectivity proof plus the ordinal tower conditions with eventual finite-surjective steps.
- `TauCeti.LogAdic.CorrectedProKummerCover.pullback`: Pullback of a cover is a cover (Lemma 5.1.4(8)).
- `TauCeti.LogAdic.CorrectedProKummerCover.refinement`: Composite coverings are coverings, given by the ordinal-sum concatenation of towers with the same step conditions.
- `TauCeti.LogAdic.CorrectedProKummerCover.ofCountablePresentation`: A surjective pro-Kummer étale `U→V` with an ℕ-indexed presentation is a one-member covering, given by a tower of type `ω`.

**Checks.**

- `TauCeti.LogAdic.CorrectedProKummerCover.identity`: The identity family is a cover.
- `TauCeti.LogAdic.CorrectedProKummerCover.finite_stage`: Every finite-stage jointly surjective Kummer étale family gives a cover of constant pro-objects.
- `TauCeti.LogAdic.CorrectedProKummerCover.need_tower`: On the closed unit disc X with trivial log structure, `{X−{0}→X, lim_n{|T|≤|ϖ|^n}→X}` is jointly surjective and each member is a transfinite limit of pullbacks of étale maps, but it is not a covering: the second tower never has surjective finite steps (and its limit is not pro-Kummer étale, its image not being open).
- `TauCeti.LogAdic.CorrectedProKummerCover.root_tower`: For X with a global sharp fs chart over a characteristic-zero field, `{lim_m X^{1/m}→X}` is a covering, given by the ω-tower of the root covers `X^{1/n!}`.
- The covering family includes its transfinite presentation and transition conditions.

Sources: [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Def. 5.1.2, p. 70.

*Needs:* [6.21](#section-6-21); `AdicEtaleGeometry` A1 (corrected covers pretopology); `CategoryTheory.GrothendieckTopology`.

<a id="section-6-23"></a>

### 6.23 The corrected pro-Kummer étale site

For locally noetherian fs X use 6.21's objects and 6.22's covers. On smooth proper strict-normal-crossings pairs over finite p-adic fields use `AutomorphicBundles` B3.log.1’s supplied site and descent instances; the general construction extends them. An affinoid-presentation qcqs basis makes the topos algebraic; qc/qs is detected topologically for objects/morphisms, and site qs/coherence by `|X|`. Define pro-finite Kummer and continuous profinite G-set sites with analogous covers; for connected X, `lim U_i↦lim Mor_X(ζ,U_i)` identifies them with `π₁^két(X,ζ)`-PFSets. Trivial logs use corrected pro-étale covers.

- `TauCeti.LogAdic.ProKummerEtaleSite`: The category, the Definition 5.1.2 coverings and the qcqs basis.
- `TauCeti.LogAdic.ProKummerEtaleSite.horizontal_agreement`: On the common smooth-pair range, identify the Kummer and pro-Kummer sites and their structure sheaves with `horizontalLogSites`, preserving ν, pullback, the all-root perfectoid basis and finite locally free descent, also on closed strata with the pulled-back log structure. The identifications commute with identity and composition.
- `TauCeti.LogAdic.ProKummerEtaleSite.nu`: The site morphism `ν` induced by constant Kummer objects.
- `TauCeti.LogAdic.ProKummerEtaleSite.pullback`: Fs log maps induce pullback functors on the pro-Kummer topoi.
- `TauCeti.LogAdic.ProKummerEtaleSite.trivial_log`: Trivial logs recover the corrected ordinary pro-étale site.
- `TauCeti.LogAdic.ProKummerEtaleSite.qcqs_basis`: Objects with affinoid pro-Kummer étale presentations are qcqs, generate the site and are stable under fibre products (Proposition 5.1.5(1)–(2)).
- `TauCeti.LogAdic.ProKummerEtaleSite.hasFiniteLimits`: `X_prokét` has all finite limits (Lemma 5.1.4(7)).
- `TauCeti.LogAdic.ProKummerEtaleSite.isQuasiCompact_iff`: An object (resp. morphism) is quasi-compact or quasi-separated iff its underlying space (resp. map) is (Proposition 5.1.5(4), (6)).
- `TauCeti.LogAdic.ProKummerEtaleSite.profinite_galois_equivalence`: For connected X with log geometric point `ζ`, `U=lim U_i↦lim_i Mor_X(ζ,U_i)` is an equivalence of sites `X_profkét≃π_1^két(X,ζ)-PFSets` compatible with coverings (Proposition 5.1.12).

**Checks.**

- `TauCeti.LogAdic.ProKummerEtaleSite.final_object`: Constant X is final in the site category.
- `TauCeti.LogAdic.ProKummerEtaleSite.constant_root`: A finite root cover of X gives a constant covering object of `X_prokét`.
- On a smooth proper pair over finite k, the root-chart, pullback and descent identifications are `horizontalLogSites_rootChart`, `horizontalLogSites_pullback` and `horizontalLogSites_descent`, respectively.
- `TauCeti.LogAdic.ProKummerEtaleSite.ordinary_compatibility`: On a trivially logged X, the `ν` projection matches the ordinary corrected `ν` under the site equivalence.
- `TauCeti.LogAdic.ProKummerEtaleSite.log_point_root_tower`: For the split fs log point `s=(Spa(l,l⁺),N)` with l algebraically closed of characteristic zero, `π_1^két(s)≅Ẑ(1)` (Corollary 4.4.22), and the root tower `lim_m s^{1/m}` corresponds under Proposition 5.1.12 to Ẑ(1) with its translation action.
- Its structure sheaves are defined by inverse image, not ad hoc values on the completed perfectoid space.

Sources: [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Def. 5.1.2, p. 70.

*Needs:* `AutomorphicBundles` B3.log.1 (`horizontalLogSites` and descent); [6.22](#section-6-22); [6.21](#section-6-21); [6.15](#section-6-15); `AdicEtaleGeometry` A1 (pro etale site corrected); `CategoryTheory.Sheaf`; [6.17](#section-6-17); `AdicEtaleGeometry` A1 (profinite g sets site).

<a id="section-6-24"></a>

### 6.24 Pro-Kummer projection and cohomological descent

Prove `TauCeti.LogAdic.log_site_projections`. For locally noetherian fs X and abelian Kummer sheaf F, prove `H^j(U,ν⁻¹F)=colim_iH^j(U_i,F)` on qcqs presentations as in Prop. 5.1.5(1). The unit `F≅Rν_*ν⁻¹F` gives full faithfulness and equal derived cohomology. Compose with `ε_ét` and the analytic projection for 6.30–7.7; with 6.20 obtain the torsion boundary comparisons. For qcqs `f:Y→X` and abelian F on `Y_két`, `ν_X⁻¹Rf_két,*F≅Rf_prokét,*ν_Y⁻¹F` (Prop. 5.2.1).

**Checks.**

- Constant torsion sheaves have the same Kummer and pro-Kummer cohomology.
- For `f=id_X`, Proposition 5.2.1 reduces to `ν⁻¹F≅ν⁻¹F`; for `X=Spa(k,O_k)` with k algebraically closed it identifies `ν⁻¹` of the constant sheaf `H^i(Y_két,F)` with `R^if_prokét,*ν⁻¹F`.

Sources: [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Prop. 5.1.6, proof, p. 72.

*Needs:* [6.23](#section-6-23); [6.15](#section-6-15); [6.20](#section-6-20); `AdicEtaleGeometry` A1 (proetale projection nu); `DiamondsAndVStacks` D0 (quasicompact objects in a topos); `DiamondsAndVStacks` D0 (filtered colimits and cohomology on coherent sites); `DiamondsAndVStacks` D0 (cech to derived comparison).

<a id="section-6-25"></a>

### 6.25 The Cartan–Leray spectral sequence for pro-finite Kummer Galois covers

Prove `TauCeti.LogAdic.kummer_cartan_leray`. For connected locally noetherian fs X, `V∈X_prokét` and Galois pro-finite Kummer cover `Ṽ=limṼ_j→V`, `Γ=limΓ_j`, prove `(Ṽ/V)^{k+1}=Ṽ×Γ^k=lim(Ṽ_j×Γ_j^k)` and `E₁^{k,q}=H^q(Ṽ×Γ^k,F)⇒H^{k+q}(V,F)` for every abelian sheaf F. If all positive-q terms vanish and `F(Ṽ×S)=C(S,F(Ṽ))` for profinite S, identify the result with continuous `H^i(Γ,F(Ṽ))`; likewise almost vanishing/isomorphisms. Trivial-log pro-finite étale comparison is `ClassicalAdicEtaleCohomology` §§1.1–1.4, 8.2, 11.1–11.2 (cartan leray spectral sequence) (b).

The continuous-cohomology form requires `F(Ṽ×S)=C(S,F(Ṽ))`; this holds for the stated completed structure sheaves and pulled-back coefficients on log affinoid perfectoid Ṽ.

**Checks.**

- For the toric tower `Ṽ → V` of [6.26](#section-6-26) with `Γ ≅ Ẑ(1)^n`, the spectral sequence computes `H^i(V_két,L⊗O⁺/p)`, up to almost isomorphism, from `H^i(Γ,(L⊗O⁺/p)(Ṽ))`; after trivializing the finite free `𝔽_p`-local system L the coefficient is `L(Ṽ)⊗_{𝔽_p}R⁺/p`. It vanishes for `i>n`. For `P=0`, `V=Ṽ=Spa(C,O_C)` and `L=𝔽_p`, degree zero is `O_C/p`, not `𝔽_p`.
- For trivial log structure and `Γ` finite, (3) is the Hochschild–Serre spectral sequence of a finite étale Galois cover.
- Without the profinite-function hypothesis, a skyscraper-type sheaf can have `F(Ṽ × Γ) ≠ C(Γ, F(Ṽ))`, and only the Čech form remains.

Sources: [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Prop. 5.1.12, p. 73.

*Needs:* [6.17](#section-6-17); [6.23](#section-6-23); [6.24](#section-6-24); `DiamondsAndVStacks` D0 (cech to derived comparison); `ClassicalAdicEtaleCohomology` §§1.1–1.4, 8.2, 11.1–11.2 (cartan leray spectral sequence).

<a id="section-6-26"></a>

### 6.26 All-root toric Kummer towers

For sharp fs P set `P_{Q≥0}=colim_m(1/m)P` over divisibility, uniquely n-divisible for every n. Toric charts are strictly étale rational/finite étale composites. Geometric towers use affinoid perfectoid pro-étale presentations over analytic locally noetherian trivial-log X/`Spa(ℤ_p,ℤ_p)`, with index order `i≥j,n|m`. Field towers require perfectoid characteristic-zero k with all roots and `k⁺=O_k`; arithmetic towers use p-adic k, `k_m=k(μ_m)`, `k_∞=∪k_m` and its completion.

- `TauCeti.LogAdic.AllRootTower`: The divisibility-indexed root presentation together with its field/root-of-unity data.
- `TauCeti.LogAdic.AllRootTower.character_action`: `γ(e^a)=χ_a(γ)e^a` on a root monomial.
- `TauCeti.LogAdic.AllRootTower.geometric_group`: The geometric group is `Hom(P^gp,Ẑ(1))`.
- `TauCeti.LogAdic.AllRootTower.cyclotomic_conjugation`: Arithmetic conjugation acts on the geometric Ẑ(1)-directions through the cyclotomic character.
- `TauCeti.LogAdic.AllRootTower.chart_limit_divisible`: The chart colimit is `P_{Q≥0}=colim_m (1/m)P`, sharp, saturated and uniquely n-divisible for every `n≥1`.
- `TauCeti.LogAdic.AllRootTower.character_decomposition`: `k⁺[P_{Q≥0}]=⊕_χ k⁺[P_{Q≥0}]_χ` over the finite-order characters `χ∈P_Q^gp/P^gp` of `Γ`; the trivial summand is `k⁺[P]` and each summand is a finite `k⁺[P]`-module (Lemma 6.1.6).
- `TauCeti.LogAdic.AllRootTower.exists_toric_chart`: A log smooth fs X over `(k,k⁺)` étale locally admits a toric chart `X→Spa(k⟨P⟩,k⁺⟨P⟩)`, P sharp fs, that is a composition of rational localizations and finite étale maps (Proposition 3.1.10).

**Checks.**

- `TauCeti.LogAdic.AllRootTower.rank_zero`: For `P=0`, the geometric root group is trivial.
- `TauCeti.LogAdic.AllRootTower.two_coordinates`: For `P=N²` the geometric group is `Ẑ(1)²`.
- `TauCeti.LogAdic.AllRootTower.p_only_insufficient`: The monoid `N[1/p]` is not q-divisible for a prime `q≠p`; its p-only tower does not satisfy the all-root chart-limit condition.
- `TauCeti.LogAdic.AllRootTower.trivial_character_summand`: For `P=N`, the Γ-invariant summand of `k⁺[N_{Q≥0}]` is `k⁺[N]`: `e^{1/2}` lies in the summand of the character of order 2, not in the invariants.
- The chart-limit divisibility is for every integer n, not just powers of p.
- For `P=N`, `Γ/m≅μ_m` and `ζ∈μ_m` acts by `e^{1/m}↦ζ·e^{1/m}`; the invariant summand of `k⁺[N_{Q≥0}]` is `k⁺[N]`.

Sources: [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Prop. 3.1.10 and Def. 3.1.12, pp. 24–25; [DLLZ-RH], §2.3, p. 15, and (3.3.4), p. 29.

*Needs:* [6.13](#section-6-13); [6.7](#section-6-7); [6.21](#section-6-21); `PerfectoidSpaces` P1 (perfectoid tate rings and algebras); `AdicEtaleGeometry` A4 (perfectoid uniform completion).

<a id="section-6-27"></a>

### 6.27 Log affinoid perfectoid pro-objects

For analytic locally noetherian fs X/`Spa(ℤ_p,ℤ_p)`, log affinoid perfectoid means a pro-Kummer presentation with initial stage, sharp fs global charts, Kummer transition charts, perfectoid completed colimit of uniformizations and all-integer-divisible chart colimit (hence uniquely divisible). Over `Spa(ℚ_p,ℤ_p)` ordinary p-completion suffices. Its associated `Û=Spa(R,R⁺)` has the inverse-limit space; it need not itself be a pro-Kummer object.

- `TauCeti.LogAdic.LogAffinoidPerfectoid`: The finite-stage sharp-chart presentation, all-integer divisibility and perfectoid completed-pair data.
- `TauCeti.LogAdic.LogAffinoidPerfectoid.realization`: The associated completed perfectoid Huber pair and its Spa.
- `TauCeti.LogAdic.LogAffinoidPerfectoid.topology`: The realization topology is canonically the inverse-limit topology of the presentation.
- `TauCeti.LogAdic.LogAffinoidPerfectoid.strict_pullback`: Strict closed pullback and Kummer étale localization preserve these objects with the source completion convention.
- `TauCeti.LogAdic.LogAffinoidPerfectoid.isQcqs`: A log affinoid perfectoid object is quasi-compact and quasi-separated in `X_prokét` (Remark 5.3.3, from Proposition 5.1.5).
- `TauCeti.LogAdic.LogAffinoidPerfectoid.realization_map`: `U↦Û` is a functor from log affinoid perfectoid objects to affinoid perfectoid spaces (Remark 5.3.5), compatible with the homeomorphism `|Û|≅lim|U_i|` of Lemma 5.3.6.

**Checks.**

- `TauCeti.LogAdic.LogAffinoidPerfectoid.trivial_chart`: With zero characteristic chart the definition agrees with ordinary affinoid perfectoid pro-objects.
- `TauCeti.LogAdic.LogAffinoidPerfectoid.all_divisibility`: For each `n>0` and a in `colim P_i` there is a unique b with `nb=a`.
- `TauCeti.LogAdic.LogAffinoidPerfectoid.no_p_only`: A presentation over a perfectoid base whose chart colimit is `N[1/p]` (the p-power root tower of a coordinate) is not a perfectoid presentation: condition (4) fails for every `n>1` prime to p.
- A constant presentation of `Spa(ℚ_p,ℤ_p)` with chart 0 is not log affinoid perfectoid: its chart is divisible by every integer, but its completed field ℚ_p is discretely valued and not perfectoid. Chart divisibility alone does not imply the perfectoid-ring condition.
- The object/presentation and its completed affinoid realization are different data.

Sources: [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Def. 5.3.1, pp. 74–75.

*Needs:* [6.26](#section-6-26); [6.23](#section-6-23); [6.13](#section-6-13); `AdicSpacesPartII` R0 (uniformization); `PerfectoidSpaces` P1 (perfectoid tate rings and algebras); `PerfectoidSpaces` P3 (almost purity theorem).

<a id="section-6-28"></a>

### 6.28 Étale and pro-étale cohomology on perfectoid spaces

Prove `TauCeti.LogAdic.perfectoid_proetale_comparison`. For perfectoid X and `ν:X_proét→X_ét`, prove `F≅Rν_*ν*F` for abelian F, equality of étale/pro-étale cohomology, and `H^i(U,ν*F)=colimH^i(U_j,F)` on qcqs presentations. For affinoid perfectoid X with every finite étale cover split, locally constant p-torsion L is constant and positively acyclic. The locally noetherian version is `ClassicalAdicEtaleCohomology` §§1.1–1.4, 8.2, 11.1–11.2 (proetale etale comparison); the diamond analogue is `DiamondEtaleCohomology` C0.17/C0.23. This target concerns the adic pro-étale site.

**Checks.**

- For `X = Spa(C, O_C)`, (2) gives `H^i(Spa(C)_ét, 𝔽_p) = 0` for `i > 0`.
- For `X = Spa(K, O_K)` with K a perfectoid field that is not algebraically closed (for instance the completion of `ℚ_p(μ_{p^∞})`), `H¹(X_ét, 𝔽_p) = H¹(Gal(K̄/K), 𝔽_p) ≠ 0`: the splitting hypothesis in (2) is needed.
- For `X = Spa(C, O_C)` and `F = ℤ/n`, both sides of (1) are `ℤ/n` in degree 0 and vanish in positive degrees.

Sources: [SCH13], Cor. 3.17, p. 20.

*Needs:* `DiamondsAndVStacks` D0 (filtered colimits and cohomology on coherent sites); `DiamondsAndVStacks` D0 (quasicompact objects in a topos); `PerfectoidSpaces` P3 (etale almost acyclicity); `PerfectoidSpaces` P3 (etale site tilting equivalence); `ClassicalAdicEtaleCohomology` §§1.1–1.4, 8.2, 11.1–11.2 (proetale etale comparison).

<a id="section-6-29"></a>

### 6.29 Perfectoid basis and Kummer strictification

Prove `TauCeti.LogAdic.log_perfectoid_basis`. For analytic locally noetherian fs X/`Spa(ℤ_p,ℤ_p)`, log affinoid perfectoids form a fibre-product-stable basis, with completed associated space `V̂×_ÛŴ`. Strict closed base change remains log affinoid perfectoid and induces a closed immersion of associated spaces. Pullback of an affinoid Kummer étale (finite Kummer étale) map becomes étale (finite étale), remains log affinoid perfectoid, and induces the same property on associated spaces; completion gives `Û_proét^∼≃(X_prokét/U)^∼`. A basis can be chosen acyclic for all pulled-back p-torsion locally constant sheaves.

**Checks.**

- Retain the analytic locally noetherian fs hypotheses; a smoothness assumption would unnecessarily weaken the source.
- For X with trivial log structure, (1) recovers the affinoid perfectoid basis of `X_proét` (Scholze 2013 Proposition 4.8).

Sources: [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Prop. 5.3.12, p. 77.

*Needs:* [6.27](#section-6-27); [6.26](#section-6-26); [6.13](#section-6-13); [6.21](#section-6-21); `PerfectoidSpaces` P3 (almost purity theorem); `AdicEtaleGeometry` A1 (pro etale site corrected); `AdicEtaleGeometry` A4 (perfectoid uniform completion); [6.28](#section-6-28); `PerfectoidSpaces` P3 (etale almost acyclicity); `PerfectoidSpaces` P3 (etale site tilting equivalence).

<a id="section-6-30"></a>

### 6.30 Completed and tilted structural log sheaves

For locally noetherian fs X/`Spa(ℚ_p,ℤ_p)`, use `O⁺=ν⁻¹O⁺_két`, `O=ν⁻¹O_két`, `M=ν⁻¹M_két`, `M♭=lim_pM` and induced `α♭`. Tilt addition is the characteristic-p limit addition. On qcqs presentations `M(U)=colim_iM_{U_i}(U_i)`; elsewhere sheafify from that basis. All limits/localizations are sheaf operations.

Uses `M_két`.

- `TauCeti.LogAdic.CompletedLogStructure`: The inverse-image, completed and tilted ring/monoid sheaves with their maps.
- `TauCeti.LogAdic.CompletedLogStructure.mod_p`: On a log affinoid perfectoid U with associated `(R,R⁺)`, `Ô⁺(U)/p=R⁺/p`. The natural map to `(O⁺/p)(U)` is an almost isomorphism; taking sections of a quotient sheaf is not identified with quotienting sections without proof (Theorem 5.4.3(1),(3)).
- `TauCeti.LogAdic.CompletedLogStructure.tilt_projection`: The nth ring projection `Ô^{♭+}→O⁺/p` from the characteristic-p Frobenius limit, and `sharp:Ô^{♭+}→Ô⁺` as a multiplicative monoid map. Sharp is not asserted additive.
- `TauCeti.LogAdic.CompletedLogStructure.functorial`: Log pullback gives compatible maps of all structural sheaves and their completions.
- `TauCeti.LogAdic.CompletedLogStructure.monoid_sections`: For a qcqs pro-Kummer presentation `U=lim U_i` by qcqs finite stages, `M(U)=colim_iM_{U_i}(U_i)`. For arbitrary U recover `M(U)` by descent from this basis; there is no unrestricted sectionwise colimit formula (corrected scope of Proposition 5.4.2).

**Checks.**

- `TauCeti.LogAdic.CompletedLogStructure.constant_point`: For a log affinoid perfectoid U whose associated perfectoid space is `Spa(K,K⁺)` with K a perfectoid field, `Ô⁺(U)=K⁺` and `Ô(U)=K`.
- `TauCeti.LogAdic.CompletedLogStructure.frobenius_relation`: A tilt sequence satisfies `x_{n+1}^p=x_n` modulo p.
- `TauCeti.LogAdic.CompletedLogStructure.not_localize_first`: Taking p-adic completion after inverting p yields zero quotients, so it cannot replace `Ô⁺` followed by inversion.
- `TauCeti.LogAdic.CompletedLogStructure.trivial_log`: If X has trivial log structure, `X_prokét=X_proét` and `O⁺`, `Ô⁺`, `Ô`, `Ô^{♭+}` are Scholze's sheaves of the same names, with `M=O^×` and `α` the inclusion.
- `TauCeti.LogAdic.CompletedLogStructure.noncompact_sections`: On a countable disjoint union of coordinate log discs, take the same i!-root level on every component at stage i. In the all-root limit, the section whose j-th component has characteristic exponent 1/j! exists by sheaf descent, but descends to no common finite level. Thus filtered colimits of monoid sections cannot be computed sectionwise on arbitrary non-quasi-compact presentations.
- Distinguish `O⁺`, `Ô⁺` and their tilt before inverting p.

Sources: [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Def. 5.4.1, p. 78.

*Needs:* [6.24](#section-6-24); [6.15](#section-6-15); [6.27](#section-6-27); `AdicEtaleGeometry` A1 (etale structure sheaf); `AdicCompletion`; `DiamondsAndVStacks` D0 (filtered colimits and cohomology on coherent sites).

<a id="section-6-31"></a>

### 6.31 Derived inverse limits over a site with an acyclic basis

Prove `TauCeti.LogAdic.rlim_vanishing_of_acyclic_basis`. On any site T, let `(F_i)` be an inverse sequence and B a basis with `R¹lim_iF_i(U)=0` and `H^{j>0}(U,F_i)=0` for `U∈B`. Prove `R^{j>0}lim_iF_i=0`, sectionwise limits on every object, and positive acyclicity of the limit on B. The same implications hold with almost-zero groups. No repleteness is assumed.

`EnhancedDerivedSheaves` E2 owns the replete-topos form and `ClassicalAdicEtaleCohomology` §1.3 the analytic lisse-tower form; this target owns the arbitrary-site basis criterion.

**Checks.**

- For T a point and `F_i = ℤ/p^i` with the natural surjections, `lim = ℤ_p` and `R¹lim = 0`.
- For `F_i = ℤ` with transition maps multiplication by p, (i) fails on a point: `R¹lim = ℤ_p/ℤ ≠ 0`, and `lim = 0`.
- For `F_i = O⁺/p^i` on a log affinoid perfectoid basis of `X_prokét`, (ii) holds only up to almost zero modules, and the almost form gives `H^j(U, Ô⁺)^a = 0` for `j > 0`.

Sources: [SCH13], Lem. 3.18 and its proof, p. 21; [CDM12], proof of Thm. 3.20, p. 21.

*Needs:* `CategoryTheory.Sheaf`; `CategoryTheory.GrothendieckTopology`; `EnhancedDerivedSheaves` E2.2 (derived limits on a replete topos); `ClassicalAdicEtaleCohomology` §1.3 (lisse-tower derived limit).

<a id="section-6-32"></a>

### 6.32 Almost acyclicity on log perfectoid objects

Prove `TauCeti.LogAdic.log_perfectoid_almost_acyclicity`. For locally noetherian fs X/`Spa(ℚ_p,ℤ_p)` and log affinoid perfectoid U associated with `(R,R⁺)`, prove `O⁺(U)/p^n=R⁺/p^n≈(O⁺/p^n)(U)` for `n>0`. Higher cohomology of `O⁺/p^n`, `Ô⁺`, `Ô^{♭+}` is almost zero. Sections are `Ô⁺(U)=R⁺`, `Ô(U)=R`, `Ô^{♭+}(U)=R^{♭+}`, `Ô♭(U)=R♭`, with `Ô⁺(U)` the p-completion of `O⁺(U)`. Finite locally free `Ô|_U`-modules are equivalent to finite projective R-modules, inverse `H↦(V↦H⊗_RÔ(V))`, and have zero positive cohomology; in particular so does `Ô`.

**Checks.**

- On the trivial-log perfectoid point `Spa(C,O_C)`, the completed structure sections are `Ô⁺=O_C`, `Ô=C`; the integral reduction has sections `O_C/p` up to the stated almost comparison.
- For the free rank-r completed bundle on U, sections are `R^r` and positive cohomology is zero. At rank zero both sections and every cohomology group are zero.

- Integral higher cohomology is almost zero, not asserted to vanish exactly.

Sources: [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Theorem 5.4.3, pp.79–80, and Theorem 5.4.4, pp.80–81.

*Needs:* [6.29](#section-6-29); [6.30](#section-6-30); [6.23](#section-6-23); `PerfectoidSpaces` P3 (almost purity theorem); `PerfectoidSpaces` P0 (almost cech acyclicity criterion); [6.31](#section-6-31); `PerfectoidSpaces` P3 (etale almost acyclicity); `PerfectoidSpaces` P3 (etale site tilting equivalence).

<a id="section-6-33"></a>

### 6.33 Kummer étale p-adic local systems

On the locally noetherian fs Kummer site, lisse `ℤ_p`-objects are pro-systems of locally constant finite `ℤ/p^n`-modules admitting strict representatives `L_{n+1}/p^n=L_n`, with torsion allowed. Rational objects form the stackified isogeny category, without a required global lattice.

- `TauCeti.LogAdic.KummerLisse`: The compatible locally constant torsion system, with pro-isomorphism to a strict system.
- `TauCeti.LogAdic.KummerLisse.reduction`: Evaluation at level n and the reduction isomorphism for a strict representative.
- `TauCeti.LogAdic.KummerLisse.rationalization`: Pass to the isogeny stack to obtain the associated `Q_p-local` system.
- `TauCeti.LogAdic.KummerLisse.morphism`: Morphisms are compatible pro-morphisms of torsion systems; rational morphisms are local isogeny morphisms glued in the stack.
- `TauCeti.LogAdic.KummerLisse.stalk`: At a log geometric point `ξ̃` the stalk `L_ξ̃=lim_n (L_n)_ξ̃` of a strict representative is a finitely generated `Z_p`-module with a continuous action of `π_1^két(X,ξ̃)`; for a `Q_p-local` system, Definition 6.3.7 tests monodromy on the `Q_p-stalk` (`L_ξ̃` of a local `Z_p-representative`, `⊗Q_p`) under the restricted action of `π_1^két(X(ξ),ξ̃)`, `X(ξ)` the strict localization with pulled-back log structure.

**Checks.**

- `TauCeti.LogAdic.KummerLisse.constant_free`: The constant system `(Z/p^n)^r` realizes a free rank-r `Z_p-local` system.
- `TauCeti.LogAdic.KummerLisse.constant_torsion`: The compatible constant Fp-system is permitted and is not free over `Z_p`.
- `TauCeti.LogAdic.KummerLisse.zero`: The zero system has rank zero and rationalizes to zero.
- `TauCeti.LogAdic.KummerLisse.torsion_rationalizes_zero`: The constant `F_p-system` (`L_n=F_p` with identity transitions) becomes zero in the isogeny category, so its associated `Q_p-local` system is 0, while `Z_p` itself rationalizes to the constant rank-one `Q_p-local` system.
- Fp is a valid torsion `Z_p-local` system; rational tensor assertions use finite-rank local systems.

Sources: [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Def. 6.3.1(1), p. 88.

*Needs:* [6.17](#section-6-17); [6.15](#section-6-15); `DiamondsAndVStacks` D0 (stackification).

<a id="section-6-34"></a>

### 6.34 Completion of Kummer local systems

For locally noetherian fs X/`Spa(ℚ_p,ℤ_p)`, use `Ẑ_p=limℤ/p^n`, `Q̂_p=Ẑ_p[1/p]`. Completed local systems are locally `L⊗Ẑ_p`, L finite over `ℤ_p`, with rational analogue. Complete by `limν⁻¹L_n`; retain torsion and rational local lattices.

- `TauCeti.LogAdic.CompletedKummerLisse`: The inverse limit of `ν⁻¹L_n` over the completed coefficient ring.
- `TauCeti.LogAdic.CompletedKummerLisse.mod_pn`: For a strict system the nth reduction agrees with `ν⁻¹L_n`.
- `TauCeti.LogAdic.CompletedKummerLisse.equivalence`: Completion and reduction are quasi-inverse on the specified lisse categories.
- `TauCeti.LogAdic.CompletedKummerLisse.map_comp`: Completion preserves identity and composition of local-system morphisms.
- `TauCeti.LogAdic.CompletedKummerLisse.rlim_vanishing`: `R^i lim_n ν⁻¹(L_n)=0` for all `i>0`, so `L̂=R lim_n ν⁻¹(L_n)` and `RΓ(X_prokét,L̂)=R lim_n RΓ(X_két,L_n)` (Lemma 6.3.3(2) with Proposition 5.1.7).
- `TauCeti.LogAdic.CompletedKummerLisse.rationalization`: `L̂⊗_{Ẑ_p}Q̂_p` is a `Q̂_p-local` system on `X_prokét`, where `Q̂_p=Ẑ_p[1/p]` (Lemma 6.3.3(1)).
- `TauCeti.LogAdic.CompletedKummerLisse.closed_pullback_completed`: For a strict closed immersion `ı:Z→X` over `Spa(Q_p,Z_p)`, a `Q̂_p-local` system L̂ on `X_prokét` and log affinoid perfectoid U, `(L̂⊗Ô_X)(U)⊗_{Ô_X(U)}Ô_Z(U×_X Z)≅(ı⁻¹L̂⊗Ô_Z)(U×_X Z)` canonically (Lemma 6.3.6).

**Checks.**

- `TauCeti.LogAdic.CompletedKummerLisse.constant`: A constant finite-generated `Z_p` module L completes to `L⊗Z_p Ẑ_p`.
- `TauCeti.LogAdic.CompletedKummerLisse.torsion`: The constant Fp-system completes to the constant Fp-sheaf.
- `TauCeti.LogAdic.CompletedKummerLisse.representative`: Pro-isomorphic strict representatives give canonically isomorphic completed local systems.
- The construction commutes with finite direct sums and rationalization.

Sources: [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Def. 6.3.2, p. 88.

*Needs:* [6.33](#section-6-33); [6.29](#section-6-29); [6.24](#section-6-24); [6.31](#section-6-31); [6.32](#section-6-32); [6.30](#section-6-30).

<a id="section-6-35"></a>

### 6.35 Unipotent geometric boundary monodromy

For smooth rigid normal-crossings `(X,D)`/k and rational Kummer L, local geometric inertia is `Hom(M̄^gp,Ẑ′(1))=Ẑ′(1)^r` for r branches (all roots in characteristic zero). Unipotence means unipotent action, quasi-unipotence after open restriction. Example 6.3.8's smooth geometrically connected strata identify branch factors with `Γ^J`; Lemma 6.3.11 reduces testing to each component's smooth locus.

- `TauCeti.LogAdic.BoundaryMonodromy`: The geometric inertia action with its specified log geometric stalk.
- `TauCeti.LogAdic.BoundaryMonodromy.logarithm`: For a unipotent generator, its finite logarithm is nilpotent; commuting generators give commuting logarithms.
- `TauCeti.LogAdic.BoundaryMonodromy.smooth_locus`: Unipotence/quasi-unipotence can be checked on the smooth part of each boundary component.
- `TauCeti.LogAdic.BoundaryMonodromy.tensor`: Tensor and dual of unipotent boundary local systems remain unipotent.
- `TauCeti.LogAdic.BoundaryMonodromy.unipotent_along`: For an irreducible component Z of D: unipotence (quasi-unipotence) of the inertia Ẑ′(1) at geometric points of Z over the smooth locus of D; L|U has unipotent geometric monodromy along D iff it has along every component. This defines `n_Z` in DLLZ-RH Theorem 3.2.3(4).

**Checks.**

- `TauCeti.LogAdic.BoundaryMonodromy.trivial`: The constant local system has zero logarithm and unipotent inertia.
- `TauCeti.LogAdic.BoundaryMonodromy.jordan`: For `U=[[1,1],[0,1]]`, `log U=[[0,1],[0,0]]` and its square is zero.
- `TauCeti.LogAdic.BoundaryMonodromy.finite_character`: A rank-one local system given by a finite-order character whose restriction to `π_1^két(X(ξ))` is nontrivial for some geometric point `ξ` of D (e.g. the quadratic character of adjoining √T on the closed unit disc with `D={T=0}`, `char k≠2`) has quasi-unipotent but not unipotent geometric monodromy along D; a nontrivial finite-order character that is trivial on all these inertia groups has unipotent monodromy.
- `TauCeti.LogAdic.BoundaryMonodromy.componentwise`: On `X=D²` over k with `char k≠2` and `D=Z₁∪Z₂`, `Z_i={T_i=0}`, the rank-one Kummer local system on which `γ₁` acts trivially and `γ₂` by `−1` (from adjoining √T₂) has unipotent geometric monodromy along Z₁ but not along Z₂, hence not along D.
- A finite nontrivial tame character is quasi-unipotent and is not unipotent.

Sources: [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Def. 6.3.7, p. 89; [DLLZ-RH], Thm. 3.2.3(4), p. 25.

*Needs:* [6.33](#section-6-33); [6.17](#section-6-17); [6.26](#section-6-26); [6.5](#section-6-5); `ClassicalAdicEtaleCohomology` §§1.1–1.4, 8.2, 11.1–11.2.

<a id="section-6-36"></a>

### 6.36 Cohomological dimension of the analytic site

Prove `TauCeti.LogAdic.analytic_cohomological_dimension`. For qcqs rigid X/k of dimension d, locally of finite type over nonarchimedean k, prove `H^i(X_an,F)=0` for every abelian analytic sheaf F and `i>d`.

The étale ℓ-torsion bound belongs to `ClassicalAdicEtaleCohomology` §11.2 (`ordinary_etale_cohomological_dimension`).

**Checks.**

- For X a point `(d = 0)`, `H^i(X_an, F) = 0` for `i > 0`.
- For the closed unit disc `(d = 1)`, `H²(X_an, F) = 0` for every abelian sheaf F.
- For a Tate curve over `C (d = 1)`, `H¹(X_an, ℤ) ≅ ℤ` is nonzero, so the bound d cannot be lowered for arbitrary abelian sheaves, whereas coherent sheaves on affinoids are acyclic in all positive degrees ([6.1](#section-6-1)).

Sources: [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), proof of the remaining statements of Thm. 6.2.1, p. 87.

*Needs:* `AdicSpacesPartII` R0 (locally noetherian adic space); `AdicSpacesPartII` R1 (affinoid domain equidimensional).

<a id="section-6-37"></a>

### 6.37 The projection formula for locally free coefficients

Prove `TauCeti.LogAdic.projection_formula_locallyFree`. For ringed-site morphism `µ:T→S`, complex F and finite locally free E (or a bounded complex thereof), prove `Rµ_*F⊗E≅Rµ_*(F⊗µ*E)`, natural under composition and tensor products in E. Apply termwise to `µ′:X_prokét→X_an` for log smooth fs X and its locally free log de Rham terms: `Rµ′_*(L̂⊗OB_dR,log⊗Ω^{log,•})≅Rµ′_*(L̂⊗OB_dR,log)⊗Ω^{log,•}`.

**Checks.**

- For `E = O_S` the map is the identity of `Rμ_*F`.
- For `μ` the identity of `(S, O_S)` the formula is the associativity of tensor products.
- For `E = O_S^n` the isomorphism is the n-fold sum of the identity of `Rμ_*F`: the formula carries no sign or twist, which fixes its normalization in the connection of `RH_log`.

Sources: [DLLZ-RH], §3.3, (3.3.1), p. 28; §3.5, p. 42.

*Needs:* `EnhancedDerivedSheaves` E1 (presentability and derived tensor); `CategoryTheory.Sheaf`.

## Layer 7: Logarithmic periods and canonical local systems

<a id="section-7-1"></a>

### 7.1 Toric character cohomology estimates

Prove `TauCeti.LogAdic.toric_kummer_cohomology`. Let k be perfectoid of characteristic zero, residue characteristic p, with all roots of unity and `k⁺=O_k`. For a sharp fs toric chart `V=Spa(S₁,S₁⁺)→Spa(k⟨P⟩,k⁺⟨P⟩)`, V log smooth affinoid of dimension n, and `𝔽_p`-local system L, prove `H^i(V_két,L⊗O⁺/p)≈0` for `i>n`. Restriction to rational `V′` with closure contained in V has almost finitely generated image in every degree. For any `r≥0`, `Γ=Hom(P^gp,Ẑ(1))` and `k⁺/p^r`-module M with primitive order-m character, `ζ_m−1` kills all `H^i(Γ,M)`. They are finitely presented over `T₀⊗_{k₀⁺/p^r}k⁺/p^r` if `M=M₀⊗_{k₀⁺/p^r}k⁺/p^r` equivariantly, with `k₀/ℚ_p(μ_m)` finite in k, T₀ a finitely generated `k₀⁺/p^r`-algebra and M₀ finite over T₀.

**Checks.**

- For a nontrivial character `χ` of order m, every `H^i(Γ,(k⁺/p)[P_{Q≥0}]_χ)` is killed by `ζ_m−1` (Lemma 6.1.7); for `χ=1` the summand is `(k⁺/p)[P]` with trivial `Γ`-action and `H^i(Γ,(k⁺/p)[P])≅(k⁺/p)[P]^{⊕C(r,i)}`, `r=rk P^gp`, which is nonzero for `0≤i≤r`.
- For `P=0` and `V=Spa(k,O_k)`, `Γ` is trivial and `H^i(V_két,O⁺/p)` is almost zero for every `i>0`.

Sources: [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Prop. 6.1.1, p. 81.

*Needs:* [6.26](#section-6-26); [6.32](#section-6-32); [6.17](#section-6-17); [6.24](#section-6-24); `PerfectoidSpaces` P0 (almost faithfully flat descent); [6.25](#section-6-25); `PerfectoidSpaces` P0 (almost finitely generated and presented); `PadicHodgeTheory` §2.7 (early primitive comparison and finiteness).

<a id="section-7-2"></a>

### 7.2 Proper log almost finiteness

Prove `TauCeti.LogAdic.proper_log_almost_finiteness`. For algebraically closed characteristic-zero affinoid `(k,k⁺)` of residue characteristic p, proper log smooth fs X and `𝔽_p`-local system L, `H^i(X_két,L⊗O⁺/p)` is almost finitely generated over k⁺ in every degree and almost zero in high degrees. Almost means relative to `m_k⊂k⁺`; no exact integral finiteness/vanishing is asserted.

**Checks.**

- Proper smooth trivial-log spaces specialize to the ordinary primitive input.
- For `X=Spa(k,O_k)` and `L=F_p`, `H^0` is `k⁺/p` and `H^i=0` for `i>0`.

Sources: [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Thm. 6.2.1, p. 85.

*Needs:* [7.1](#section-7-1); [6.26](#section-6-26); [6.29](#section-6-29); [6.24](#section-6-24); `PadicHodgeTheory` §§2.1–2.7, 7.1–7.3; `DiamondsAndVStacks` D0 (cech to derived comparison); `PerfectoidSpaces` P0 (almost finitely generated and presented); `PadicHodgeTheory` §2.7 (early primitive comparison and finiteness).

<a id="section-7-3"></a>

### 7.3 Logarithmic primitive comparison

Prove `TauCeti.LogAdic.log_primitive_comparison`. For proper log smooth fs X over `Spa(k,k⁺)`, k algebraically closed of characteristic zero and residue characteristic p, and an `F_p-local` system L on `X_két`, the canonical map `H^i(X_két,L)⊗_{F_p}(k⁺/p)→H^i(X_két,L⊗_{F_p}O⁺_X/p)` is an almost isomorphism of `k⁺`-modules for every `i≥0`. Transport along `ν` gives the matching pro-Kummer formulation. Its properness hypothesis is retained by every finite-level application.

**Checks.**

- For the constant Fp-sheaf on a geometric point the map is `Fp⊗Fp` `k⁺/p≃k⁺/p`.
- Empty boundary agrees with Scholze’s ordinary primitive theorem.

Sources: [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), §6.2 and Thm. 6.2.1(2), p. 85.

*Needs:* [7.2](#section-7-2); [6.32](#section-6-32); [6.30](#section-6-30); [6.29](#section-6-29); [6.24](#section-6-24); [6.31](#section-6-31); `PadicHodgeTheory` §2.7 (early primitive comparison and finiteness).

<a id="section-7-4"></a>

### 7.4 Logarithmic cohomological finiteness and vanishing

Prove `TauCeti.LogAdic.log_cohomology_finite_vanishing`. For algebraically closed k of characteristic zero and residue characteristic p, proper log smooth fs X and `𝔽_p`-local system L, cohomology is finite-dimensional in all degrees and zero in high degrees. For smooth rigid normal-crossings X the bound is `i>2dim X`. For `U=X−D` with X proper smooth and D normal crossings, the same finiteness and `2dim U` bound hold for all `𝔽_p`-local systems on `U_ét`.

The smooth normal-crossings compactification in (3) is a hypothesis; no rigid resolution-of-singularities target is assumed.

**Checks.**

- The closed unit disc is a counterexample to finiteness without proper compactification, as Remark 6.2.2 states.

Sources: [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Thm. 6.2.1, consequences, p. 85.

*Needs:* [7.3](#section-7-3); [7.2](#section-7-2); [7.1](#section-7-1); [6.20](#section-6-20); [6.5](#section-6-5); [6.36](#section-6-36); `ClassicalAdicEtaleCohomology` §11.2 (`ordinary_etale_cohomological_dimension`); AdicSpacesPartIV R4 (smooth pair).

<a id="section-7-5"></a>

### 7.5 Proper p-adic boundary cohomology

Prove `TauCeti.LogAdic.proper_padic_boundary_cohomology`. For complete nonarchimedean `k/ℚ_p`, `k⁺=O_k`, smooth rigid X with normal-crossings D and `U=X−D`, any étale `ℤ_p`-local system L (torsion allowed) extends uniquely as `L̄=j_két,*L`; every Kummer local system arises this way. Over completed algebraic closure k̄, cohomology agrees levelwise by Theorem 4.6.1 without properness. For proper X, prove `H^i(U_{k̄,ét},L)≅H^i(X_{k̄,két},L̄)≅H^i(X_{k̄,prokét},L̄^)`, finite over `ℤ_p` for each i.

Uses `L_m`.

**Checks.**

- Constant Fp on the nonproper closed disc is excluded from the finite-cohomology claim.
- For X proper with `D=∅` and `L=Z_p`, the statement is the finiteness of `H^i(X_{k̄,ét},Z_p)` and its agreement with pro-étale cohomology of `Ẑ_p`.

Sources: [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Cor. 6.3.4, p. 88.

*Needs:* [7.4](#section-7-4); [6.33](#section-6-33); [6.34](#section-6-34); [6.20](#section-6-20); [6.24](#section-6-24); [6.31](#section-6-31).

<a id="section-7-6"></a>

### 7.6 Relative finiteness of proper smooth pushforwards

Prove `TauCeti.LogAdic.proper_smooth_local_system`. For proper smooth rigid `f:X→Y` over complete nonarchimedean k of characteristic zero and residue characteristic p, and an `𝔽_p`, `ℤ/p^n` or `ℤ_p` local system L, prove every `R^if_ét,*L` locally constant, compatible with arbitrary rigid base change, with geometric stalk `H^i(X_ȳ,ét,L)`. Section 7.6 owns Scholze–Weinstein’s geometric proper-smooth local-constancy theorem over complete algebraically closed `C/ℚ_p`, its descent to k, the p-power and ℤ_p extensions, and the arbitrary rigid-base-change comparison. DLLZ-adic Corollary 6.3.5 uses this geometric theorem. The p-primary input is proved here; `DiamondEtaleCohomology` C5.8 applies only under its separate quasi-pro-étale or prime-to-p coefficient hypotheses.

**Checks.**

- For `f = id`, `R⁰f_*L = L` and `R^if_*L` `= 0` for `i > 0`.
- For an elliptic curve `E/C→Spa(C,O_C)` and `L=𝔽_p`, the proper smooth map has positive relative dimension and is not quasi-pro-étale; p-primary coefficients also fail C5.8’s prime-to-p alternative. The geometric theorem here gives constant `R¹` of rank two.
- For f: `E → Y` the Tate curve over the punctured disc `0 < |q| < 1` (proper smooth), `R¹f_*𝔽_p` is a local system of rank two that is not constant (it is trivialized only after adjoining `μ_p` and `q^{1/p}`); over the whole disc f is not smooth, and `R¹f_*𝔽_p` is not a local system at `q = 0`.
- For the open immersion j (smooth, not proper) of the punctured disc into the disc, `R¹j_*𝔽_p` is supported at the puncture, where it is `𝔽_p(−1)`, so it is not a local system.

Sources: Scholze–Weinstein, *Berkeley Lectures on p-adic Geometry*, Thm. 10.5.1 and proof, Appendix to Lecture 10, pp. 82–88; [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Cor. 6.3.5 and its proof, p. 89.

*Needs:* [6.33](#section-6-33); [6.34](#section-6-34); [6.31](#section-6-31); [7.4](#section-7-4); [7.5](#section-7-5); `AdicEtaleGeometry` A1 (étale descent); `DiamondEtaleCohomology` C7.9 (local systems of finitely generated `Λ`-modules); `PadicHodgeTheory` §2.7 (early primitive comparison and finiteness); `AdicSpacesPartII` R0 (smooth morphism).

<a id="section-7-7"></a>

### 7.7 Kummer proper pushforward of p-adic local systems

Prove `TauCeti.LogAdic.kummer_proper_pushforward_local_systems`. For characteristic-zero nonarchimedean k, `k⁺=O_k`, smooth rigid normal-crossings pairs `(X,D)`, `(Y,E)` and log smooth f, require both f and `f:X−D→Y−E` proper. Then all `R^if_két,*L`, `i≥0`, are `ℤ_p`-local systems for every such L on `X_két`.

**Checks.**

- If `D=E=∅` the statement is the relative finiteness theorem for étale `Z_p-local` systems along a proper smooth morphism of rigid analytic varieties.
- If `Y=Spa(k,O_k)` with k algebraically closed and `E=∅`, properness of `X−D` forces `D=∅` and the conclusion is that `H^i(X_ét,L)` is a finitely generated `Z_p`-module.

Sources: [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Cor. 6.3.5, p. 89.

*Needs:* [7.5](#section-7-5); [6.20](#section-6-20); [6.33](#section-6-33); [6.7](#section-6-7); [6.5](#section-6-5); [7.6](#section-7-6).

<a id="section-7-8"></a>

### 7.8 Ordinary periods on the pro-Kummer site

For locally noetherian fs X/`Spa(ℚ_p,ℤ_p)`, set `A_inf=W(Ô^{♭+})`, `B_inf=A_inf[1/p]`, `B_dR⁺=lim_rB_inf/(kerθ)^r`, `B_dR=B_dR⁺[t⁻¹]`. The section/acyclicity API gives the locally regular generator t and its independent filtration; these are ordinary local period rings on the log site.

- `TauCeti.LogAdic.LogConstantPeriods.horizontal_agreement`: On smooth proper strict-normal-crossings pairs over finite p-adic k, identify these sheaves with B3.log.3’s periods on `horizontalLogSites`, preserving θ, filtrations, graded Tate twists and basis evaluation.
- `TauCeti.LogAdic.LogConstantPeriods`: The sheaves `A_inf`, `B_inf`, `B_dR⁺`, `B_dR` on `X_prokét` obtained from `Ô^{♭+}` by the ordinary period functors, with `θ` and the filtrations of Definition 2.2.3.
- `TauCeti.LogAdic.LogConstantPeriods.theta`: `θ:A_inf→Ô⁺`, and its p-inverted and completed versions `θ:B_inf→Ô`, `θ:B_dR⁺→Ô`, surjective with kernel `Fil¹`.
- `TauCeti.LogAdic.LogConstantPeriods.fil`: `Fil^r B_dR⁺=(ker θ)^r B_dR⁺` and `Fil^r B_dR=∑_{s≥−r}t^{−s}Fil^{r+s}B_dR⁺`; decreasing, separated and complete, independent of the local generator t.
- `TauCeti.LogAdic.LogConstantPeriods.grade`: If X lies over a perfectoid field containing all roots of unity, `gr^r B_dR≅Ô(r)` canonically for all `r∈Z` (Corollary 2.2.6); sectionwise `gr^r B_dR(R,R⁺)≅ξ^rR` in general.
- `TauCeti.LogAdic.LogConstantPeriods.sections`: For a log affinoid perfectoid U with associated perfectoid `Û=Spa(R,R⁺)`: `A_inf(U)≅W(R^{♭+})`, `B_inf(U)≅W(R^{♭+})[1/p]`, `B_dR⁺(U)≅B_dR⁺(R,R⁺)` and `B_dR(U)≅B_dR(R,R⁺)`, compatibly with `θ` and filtrations (Proposition 2.2.4(1)).
- `TauCeti.LogAdic.LogConstantPeriods.acyclic_log_affinoid_perfectoid`: For a log affinoid perfectoid U, `H^j(U,B_dR⁺)=H^j(U,B_dR)=0` for all `j>0` (Proposition 2.2.4(2)).
- `TauCeti.LogAdic.LogConstantPeriods.closed_restriction_surjective`: For a strict closed immersion `ı:Z→X`, `B_dR,X⁺→ı_{prokét,*}B_dR,Z⁺` is surjective, already on sections over every log affinoid perfectoid U (Corollary 2.2.7).

On the common smooth proper strict-normal-crossings range over finite k, use `AutomorphicBundles` B3.log.3’s period sheaves.

**Checks.**

- `TauCeti.LogAdic.LogConstantPeriods.trivial_log`: For the trivial log structure, under `X_prokét≃X_proét` these sheaves, `θ` and filtrations are `PadicHodgeTheory §§2.1–2.3’s A_inf`, `B_inf`, `B_dR⁺`, `B_dR`.
- `TauCeti.LogAdic.LogConstantPeriods.grade_zero`: `θ` induces `B_dR⁺/Fil¹B_dR⁺≅Ô`; on a log affinoid perfectoid U this is `B_dR⁺(R,R⁺)/ξ≅R`.
- `TauCeti.LogAdic.LogConstantPeriods.not_integral_completion`: `(lim_r A_inf(R,R⁺)/ξ^r)[1/p]=A_inf(R,R⁺)[1/p]` is not `B_dR⁺(R,R⁺)`: the convergent series `∑_{n≥0}p^{−n}ξ^n` lies in `B_dR⁺(R,R⁺)` but not in `A_inf(R,R⁺)[1/p]`.
- `TauCeti.LogAdic.LogConstantPeriods.point_values`: For `X=Spa(K,O_K)` with K a perfectoid field and trivial log structure, `U=X` is log affinoid perfectoid and `B_dR⁺(U)=B_dR⁺(K,O_K)`, Fontaine's ring, with `Fil^r=ξ^rB_dR⁺(K,O_K)`.
- There is no new local period-ring definition duplicating §§2.7, 7.1–7.3: sectionwise the rings are `A_inf(R,R⁺)`, `B_dR⁺(R,R⁺)`, `B_dR(R,R⁺)` of the associated perfectoid pair.
- On every log affinoid perfectoid U the sections are those of the associated perfectoid pair and `H^j(U,B_dR⁺)=H^j(U,B_dR)=0` for `j>0`; this is the evaluation used by PerfectoidShimuraVarieties S6.

Sources: [DLLZ-RH], Def. 2.2.3(2), p. 12; Prop. 2.2.4(1)–(2), p. 12; Rem. 2.2.5, p. 12; Cor. 2.2.6, p. 12.

*Needs:* `AutomorphicBundles` B3.log.3 (periods, filtered Poincaré lemma and de Rham unipotent tensor comparison); [6.30](#section-6-30); [6.32](#section-6-32); [6.27](#section-6-27); [6.29](#section-6-29); `PadicHodgeTheory` §§2.1–2.4 (period sheaves definitions); `PadicHodgeTheory` §§2.1–2.4 (period sheaves on affinoid perfectoids); `PadicHodgeTheory` §§2.1–2.4 (rational acyclicity of de rham period sheaves); `PadicHodgeTheory` §§2.1–2.4 (de rham period sheaf); `PadicHodgeTheory` §§2.1–2.4 (graded de rham period sheaf tate twist); `BDeRhamPlus`; `fontaineThetaInvertP`.

<a id="section-7-9"></a>

### 7.9 Positive structural logarithmic periods

For locally noetherian fs X/`Spa(k,k⁺)`, k characteristic zero with perfect residue κ of characteristic p, and log affinoid perfectoid `U=lim_iU_i` associated with `(R,R⁺)`, put `M_i=M_i(U_i)`, `M=colim_iM_i=M(U)`, `M♭=lim_pM`. Define `S_{i,r}=(R_i⊗̂_{W(κ)}W(R^{♭+})/ξ^r)[M_i×_MM♭]/(α_i(a′)⊗1−(1⊗[α♭(a″)])e_a)`, `a=(a′,a″)`. Teichmüller terms act after inverting p, already a unit in `R_i`. Set `θ_log(e_a)=1`, `Ŝ_i=lim_{r,s}S_{i,r}/(kerθ_log)^s`; sheafify `colim_iŜ_i` on the log perfectoid basis, with its kernel-power filtration. This supplies the following coefficient/structural algebra maps.

- `TauCeti.LogAdic.StructuralLogPeriodPlus.horizontal_agreement`: On smooth proper strict-normal-crossings pairs over finite p-adic k, identify §§7.9–7.11’s positive and filtration-completed periods with B3.log.3’s, preserving θ, both algebra structures, filtrations, connections and pullback.
- `TauCeti.LogAdic.StructuralLogPeriodPlus`: The sheafification of `U↦colim_iŜ_i` on log affinoid perfectoid objects, with `θ_log` and the filtration `Fil^r=(ker θ_log)^r`.
- `TauCeti.LogAdic.StructuralLogPeriodPlus.theta_generator`: `θ_log(e_a)=1` for every `a∈M_i×_M M♭`.
- `TauCeti.LogAdic.StructuralLogPeriodPlus.structural_relation`: `α_i(a′)=[α♭(a″)]e_a` in `S_{i,r}`, hence in `OB⁺_dR,log`, for `a=(a′,a″)`.
- `TauCeti.LogAdic.StructuralLogPeriodPlus.presentation_invariance`: Cofinal changes of the pro-presentation of U induce canonical filtered isomorphisms of `colim_iŜ_i`.
- `TauCeti.LogAdic.StructuralLogPeriodPlus.theta_surjective`: `θ_log:OB⁺_dR,log→Ô` is surjective with kernel `Fil¹OB⁺_dR,log`.
- `TauCeti.LogAdic.StructuralLogPeriodPlus.bdr_algebra`: The filtered `B_dR⁺`-algebra structure induced by `W(R^{♭+})/ξ^r→S_{i,r}`; `θ_log` restricts to `θ` on `B_dR⁺`.
- `TauCeti.LogAdic.StructuralLogPeriodPlus.structure_algebra`: The `O_{X_prokét}`-algebra structure induced by `R_i→S_{i,r}`; `θ_log` restricts to `O_{X_prokét}→Ô`.
- `TauCeti.LogAdic.StructuralLogPeriodPlus.pullback`: A morphism `f:X→Y` of locally noetherian fs log adic spaces over `Spa(k,k⁺)` induces a filtered map `f_prokét⁻¹OB⁺_dR,log,Y→OB⁺_dR,log,X` compatible with `θ_log`, the `e_a` and the `B_dR⁺-structures`, with `map_id` and `map_comp`.

On the common smooth proper strict-normal-crossings range over finite k, use B3.log.3’s supplied structural periods; §§7.9–7.11 extend them.

**Checks.**

- `TauCeti.LogAdic.StructuralLogPeriodPlus.rank_zero`: For the trivial log structure, under `X_prokét≃X_proét`, `OB⁺_dR,log` is filtered isomorphic to `PadicHodgeTheory` §2.3’s corrected `OB_dR⁺`, each `e_a` being `α_i(a′)[α♭(a″)]⁻¹`.
- `TauCeti.LogAdic.StructuralLogPeriodPlus.theta`: `θ_log` induces `OB⁺_dR,log/Fil¹≅Ô`.
- `TauCeti.LogAdic.StructuralLogPeriodPlus.boundary_relation`: If `α♭(a″)=0` (a boundary coordinate vanishing on the stratum), the relation gives `α_i(a′)=0` and imposes no constraint on `e_a`; the relation is not rewritten as `e_a=α_i(a′)/[α♭(a″)]`.
- Boundary coordinates remain visible through `e_a`; replacing them by ordinary tensor periods loses dlog terms.
- For the trivial log structure the relation forces `e_a=α_i(a′)[α♭(a″)]⁻¹` and `S_{i,r}=R_i⊗̂_{W(κ)}(W(R^{♭+})/ξ^r)`, so `OB⁺_dR,log` agrees with `PadicHodgeTheory` §2.3’s corrected `OB_dR⁺`.

Sources: [DLLZ-RH], Equation (2.2.8) and following, p. 13; Equation (2.2.9), p. 13; Def. 2.2.10(1), p. 13; Rem. 2.2.12, p. 14.

*Needs:* `AutomorphicBundles` B3.log.3 (periods, filtered Poincaré lemma and de Rham unipotent tensor comparison); [6.4](#section-6-4); [6.30](#section-6-30); [7.8](#section-7-8); [6.27](#section-6-27); [6.29](#section-6-29); `AdicCompletion`; `AdicSpacesPartII` R0 (completed tensor product).

<a id="section-7-10"></a>

### 7.10 Filtered completion of structural periods

Under 7.9, complete `OB⁺_dR,log[t⁻¹]` for its convolution filtration: `Fil^rOB_dR,log=lim_{s≥0}Fil^r/Fil^{r+s}`, then union over r. This additional completion is required even with trivial logs; develop the following ring/graded API.

- `TauCeti.LogAdic.StructuralLogPeriod`: The filtration completion of `OB⁺_dR,log[t⁻¹]`, with its filtration pieces and `OC_log=gr⁰`.
- `TauCeti.LogAdic.StructuralLogPeriod.completion_map`: The filtered map from `OB⁺_dR,log[t⁻¹]` into its filtration completion.
- `TauCeti.LogAdic.StructuralLogPeriod.grade`: The completion map induces isomorphisms on all `gr^r`.
- `TauCeti.LogAdic.StructuralLogPeriod.complete_piece`: Each `Fil^r` is the inverse limit of its `Fil^r/Fil^{r+s}` quotients, `s≥0`.
- `TauCeti.LogAdic.StructuralLogPeriod.fil_zero_ring`: `Fil⁰OB_dR,log` is a sheaf of rings, `Fil^r·Fil^s⊂Fil^{r+s}`, and `OB_dR,log=(Fil⁰OB_dR,log)[t⁻¹]`.
- `TauCeti.LogAdic.StructuralLogPeriod.oc_log`: `OC_log=gr⁰OB_dR,log`, an Ô-algebra receiving `Fil⁰OB_dR,log`.
- `TauCeti.LogAdic.StructuralLogPeriod.bdr_algebra`: The filtered `B_dR`-algebra map `B_dR→OB_dR,log` extending `B_dR⁺→OB⁺_dR,log`.
- `TauCeti.LogAdic.StructuralLogPeriod.t_independent`: The filtration and the completion do not depend on the local generator t of `Fil¹B_dR⁺`.

On the common smooth-pair range, use B3.log.3’s filtration-completed structural periods through 7.9’s agreement.

**Checks.**

- `TauCeti.LogAdic.StructuralLogPeriod.zero_log`: For the trivial log structure `OB_dR,log` is the filtration completion of `PadicHodgeTheory §§2.1–2.3’s OB_dR⁺[t⁻¹]` and contains the series of `cauchy_sum`, which is not in `OB_dR⁺[t⁻¹]`; it is not the uncompleted `OB_dR`.
- `TauCeti.LogAdic.StructuralLogPeriod.cauchy_sum`: In the local one-variable model with `W=y/t`, `∑_{n≥0}t^nW^{n²}` converges in `Fil⁰=B_dR⁺{W}` for the coefficientwise t-adic completion.
- `TauCeti.LogAdic.StructuralLogPeriod.localization_insufficient`: The same series has `y^{n²}`-coefficient `t^{n−n²}`, with unbounded negative t-valuations, and hence is not in `B_dR⁺[[y]][1/t]`; its inclusion requires the additional filtration completion.
- Trivial logs compare with the filtration-completed ordinary structural periods, not with the uncompleted `OB_dR⁺[t⁻¹]` of Brinon and Scholze (Remark 2.2.11).
- `OC_log=gr⁰OB_dR,log` is an Ô-algebra; over a toric chart it is `Ô[W_1,…,W_n]` ([7.12](#section-7-12)).

Sources: [DLLZ-RH], Def. 2.2.10(3) and the note after it, p. 13; Rem. 2.2.11, p. 13.

*Needs:* `AutomorphicBundles` B3.log.3 (periods, filtered Poincaré lemma and de Rham unipotent tensor comparison); [7.9](#section-7-9); [7.8](#section-7-8).

<a id="section-7-11"></a>

### 7.11 Continuous structural log connection

Under 7.9–7.10 extend d by `∇e_a=e_aδ(a′)`, `B_dR⁺`-linearly before localization and `B_dR`-linearly after localization/filtration completion. Use 6.10's continuous log differentials for integrability, Leibniz, transversality and relative connections.

- `TauCeti.LogAdic.StructuralLogConnection`: The continuous `B_dR`-linear log connection on `OB_dR,log` restricting to the `B_dR⁺`-linear one on `OB⁺_dR,log`.
- `TauCeti.LogAdic.StructuralLogConnection.generator`: `∇e_a=e_aδ(a′)` for `a=(a′,a″)∈M_i×_M M♭`.
- `TauCeti.LogAdic.StructuralLogConnection.transverse`: `∇(Fil^r)⊂Fil^{r−1}⊗Ω^log_X` on `OB⁺_dR,log`, `OB⁺_dR,log[t⁻¹]` and `OB_dR,log`.
- `TauCeti.LogAdic.StructuralLogConnection.integrable`: `∇∘∇=0` on the associated log de Rham complex `OB_dR,log⊗Ω^{log,•}_X`.
- `TauCeti.LogAdic.StructuralLogConnection.leibniz`: `∇(fx)=f∇x+x⊗df` for `f∈O_{X_prokét}`, and `∇` restricted to `O_{X_prokét}` is d.
- `TauCeti.LogAdic.StructuralLogConnection.bdr_linear`: `∇` is `B_dR`-linear; the image of `B_dR` in `OB_dR,log` is horizontal.
- `TauCeti.LogAdic.StructuralLogConnection.relative`: For a log smooth `f:X→X′`, composing with `Ω^log_X→Ω^log_{X/X′}` gives the relative connection `∇_{X/X′}`, linear over the image of `f_prokét⁻¹OB_dR,log,X′` (used in Corollary 2.4.6).

On the common smooth-pair range, use B3.log.3’s supplied connection through 7.9’s agreement.

**Checks.**

- `TauCeti.LogAdic.StructuralLogConnection.constants`: `∇` vanishes on the image of `B_dR→OB_dR,log`.
- `TauCeti.LogAdic.StructuralLogConnection.log_coordinate`: For `X=D¹` with log structure at 0 and `y=log(e^{(a,a)})` over its all-root cover, `∇y=δ(a)=dlog T`; the same holds on the stratum `{T=0}` with the induced log structure, where dlog T is still a nonzero section of `Ω^log`.
- `TauCeti.LogAdic.StructuralLogConnection.normalized_coordinate`: `∇W_T=t⁻¹dlog T` for `W_T=y/t`, so omitting the `t⁻¹` would give the wrong filtered connection.
- The connection is not `O_X`-linear; it satisfies the log Leibniz rule.
- On `S_{i,r}`, `∇(α_i(a′)−[α♭(a″)]e_a)=(α_i(a′)−[α♭(a″)]e_a)δ(a′)`, so the structural relation is preserved.

Sources: [DLLZ-RH], Equations (2.2.13)–(2.2.14), p. 14; Equation (2.2.15), p. 14; Equations (2.2.16)–(2.2.17), p. 14.

*Needs:* `AutomorphicBundles` B3.log.3 (periods, filtered Poincaré lemma and de Rham unipotent tensor comparison); [7.10](#section-7-10); [7.9](#section-7-9); [6.8](#section-6-8); [6.10](#section-6-10); [6.11](#section-6-11).

<a id="section-7-12"></a>

### 7.12 Toric power-series description of log periods

Prove `TauCeti.LogAdic.toric_structural_period_model`. For p-adic k, toric `P=P̄⊕Q`, take the pulled-log stratum `E=Spa(k⟨P̄⟩,k⁺⟨P̄⟩)`, strictly étale affinoid `X→E`, and all-root cover X̃ with group Γ. Put `M=(e_a−1:a∈P)`, `B_dR⁺[[P−1]]=lim_rB_dR⁺[P]/M^r`, `Fil^r=(ξ,M)^r`. On `X_prokét/X̃`, prove unique structural lifts `v:O→B_dR⁺[[P−1]]`, `a↦[T^{ā♭}]e_a`, and `β:M♭→(B_dR⁺[[P−1]])×` with `vα(a♯)=[α♭(a)]β(a)` (Lemmas 2.3.`7/2`.3.12). The map `e_a↦e_{(a,a)}` identifies this filtered sheaf with `OB⁺_dR,log`; on log perfectoid U, every `Ŝ_i→OB⁺(U)` is an isomorphism. For a basis `a_j` of `P^gp`, set `y_a=log(e^{a⁺})−log(e^{a⁻})`, `y_j=y_{a_j}`. Obtain `B_dR⁺[[P−1]]=B_dR⁺[[y₁,…,y_n]]`, matching M and `(ξ,M)` powers. With `W_j=y_j/t`, prove `Fil^rOB_dR,log=t^rB_dR⁺{W}`, `gr^r=t^rÔ[W]`, `gr^•=Ô[t^{±1},W]`. For strict Z pulled from a direct-summand closed stratum Q′ of P̄, preserve pullback/pushforward; quotient `B_dR,X⁺(U)/ξ^r` by the completed ideal `([T^{sa♭}]:s∈ℚ_{>0},a∈Q′−{0})` to obtain `B_dR,Z⁺(V)/ξ^r`.

Uses `m_i`.

**Checks.**

- For `P=ℤ_{≥0}` (`X=D¹` with log structure at 0, `Q=0`): `OB⁺_dR,log|_X̃≅B_dR⁺|_X̃[[y]]` with `y=log(e^{(a,a)})` and `Fil^r=(ξ,y)^r`, and `Fil⁰OB_dR,log≅B_dR⁺{W}` with `W=y/t`; `∑_n t^nW^{n²}` lies in `Fil⁰OB_dR,log` but not in `B_dR⁺[[y]][t⁻¹]`.
- The positive model uses formal power series `B_dR⁺[[y]]`, the completed one t-adically convergent series `B_dR⁺{W}`; neither is replaced by the other.
- On every log affinoid perfectoid U over X̃ the presheaf value `Ŝ_i` is already the sheaf value `OB⁺_dR,log(U)` (the evaluation used by PerfectoidShimuraVarieties S6).

Sources: [DLLZ-RH], Prop. 2.3.15, p. 18; paragraph after the proof of Prop. 2.3.15, p. 19; Cor. 2.3.17, p. 19; Cor. 2.3.20, pp. 19–20.

*Needs:* [7.9](#section-7-9); [7.10](#section-7-10); [7.8](#section-7-8); [6.26](#section-6-26); [6.27](#section-6-27); `PadicHodgeTheory` §§2.1–2.4 (structural algebra structure on bdr power series); `AdicSpacesPartII` R0 (etale algebraic model).

<a id="section-7-13"></a>

### 7.13 Logarithmic period Poincaré lemma

Prove `TauCeti.LogAdic.log_poincare`. For p-adic k, let X be log smooth fs or a smooth intersection of normal-crossings boundary components with the ambient pulled-back log structure (Remark 2.4.1). On `X_prokét`, with tensor products over `O_{X_prokét}`: (1) `0→B_dR⁺→OB⁺_dR,log→OB⁺_dR,log⊗Ω^{log,1}_X→OB⁺_dR,log⊗Ω^{log,2}_X→⋯` (differentials `∇`) is exact; (2) the same holds with `B_dR` and `OB_dR,log`; (3) for each `r∈Z` the subcomplex `0→Fil^rB_dR→Fil^rOB_dR,log→Fil^{r−1}OB_dR,log⊗Ω^{log,1}_X→Fil^{r−2}OB_dR,log⊗Ω^{log,2}_X→⋯` is exact; (4) for each `r∈Z` the quotient complex `0→gr^rB_dR→gr^rOB_dR,log→gr^{r−1}OB_dR,log⊗Ω^{log,1}_X→⋯` is exact and identifies with `0→Ô(r)→OC_log(r)→OC_log(r)⊗Ω^{log,1}_X(−1)→OC_log(r)⊗Ω^{log,2}_X(−2)→⋯` (Corollary 2.4.2). If `f:X→X′` is log smooth with X and X′ both as in Remark 2.4.1, then `0→B⁺_dR,X⊗̂_{f⁻¹B⁺_dR,X′}f⁻¹OB⁺_dR,log,X′→OB⁺_dR,log,X→OB⁺_dR,log,X⊗Ω^{log,1}_{X/X′}→OB⁺_dR,log,X⊗Ω^{log,2}_{X/X′}→⋯` is exact, where `⊗̂` is the tensor product completed for the filtration (locally `B⁺_dR,X[[y′_1,…,y′_{n′}]]` in the base coordinates); the analogous complex with `B_dR,X`, `B_dR,X′`, `OB_dR,log,X`, `OB_dR,log,X′` (first term locally `B_dR,X{W′_1,…,W′_{n′}}`) is exact and strictly compatible with the filtrations (Corollary 2.4.6, with the completed tensor product).

Uses `W_j`.

On the common smooth proper strict-normal-crossings range over finite k, use B3.log.3’s `unipotentLogPeriodComparison_poincare`; identify this resolution with the supplied filtered resolution, including its maps and graded Tate twists.

**Checks.**

- In rank zero `(Ω^log_X=0)` the resolution is `B_dR≅OB_dR,log` with no higher log-coordinate terms.
- The filtration of the qth term is `r−q`, not r.
- For `X=D¹` with log structure at 0, locally `0→B⁺_dR→B⁺_dR[[y]]→B⁺_dR[[y]]·dlog T→0` with `∇=∂/∂y⊗dlog T` is exact.
- For the projection `T²→T¹` (trivial log), the section `∑_k[T₂♭]^ky₁^k` of `B⁺_dR,X[[y₁,y₂]]` is horizontal for `∇_{X/X′}` but is not in the image of the uncompleted tensor product, so the completed tensor product is needed.

Sources: [DLLZ-RH], Rem. 2.4.1, p. 20; Cor. 2.4.2 and its proof, pp. 20–21; Cor. 2.4.6, p. 21.

*Needs:* `AutomorphicBundles` B3.log.3 (periods, filtered Poincaré lemma and de Rham unipotent tensor comparison); [7.12](#section-7-12); [7.11](#section-7-11); [7.8](#section-7-8); [6.11](#section-6-11); [6.10](#section-6-10); [6.7](#section-6-7); [6.29](#section-6-29); `PadicHodgeTheory` §§2.1–2.4 (poincare lemma and faltings extension).

<a id="section-7-14"></a>

### 7.14 Logarithmic Faltings extension

Prove `TauCeti.LogAdic.log_faltings_extension`. For p-adic k and X either log smooth fs or a smooth boundary-component intersection with the ambient pulled-back log structure (Remark 2.4.1), prove `0→Ô(1)→gr¹OB⁺_dR,log→Ô⊗Ω^log_X→0` on `X_prokét`. The maps are `gr¹(B_dR⁺→OB⁺_dR,log)` and `gr¹∇`, with `gr¹B_dR⁺=Ô(1)`. On a toric cover `gr¹OB⁺_dR,log=Ôξ⊕⊕Ôy_j`, `y_j↦δ(a_j)`, giving local splitting.

**Checks.**

- For the trivial log structure (X smooth) the sequence is `PadicHodgeTheory` §2.3’s Faltings extension `0→Ô(1)→gr¹OB_dR⁺→Ô⊗Ω¹_X→0`.
- For `X=D¹` with log structure at 0, the class of `y=log(e^{(a,a)})` maps to dlog T, which is not in `Ô⊗Ω¹_X` along `T=0`; a log coordinate contributes its dlog class.

Sources: [DLLZ-RH], Cor. 2.4.5, p. 21; Rem. 2.4.1, p. 20.

*Needs:* [7.12](#section-7-12); [7.8](#section-7-8); [7.11](#section-7-11); [7.13](#section-7-13); [6.10](#section-6-10); `PadicHodgeTheory` §§2.1–2.4 (faltings extension).

<a id="section-7-15"></a>

### 7.15 Agreement with the modular-curve logarithmic period construction

Prove `TauCeti.LogAdic.modularCurve_logPeriod_agreement`. For a compactified modular-curve affinoid V₀ over finite `K/ℚ_p` with K-rational cusps D, identify `CohomologyComparisons` §6.1's cusp-chart Kummer/pro-Kummer sites with 6.`15/6`.23 for 6.5's divisorial log structure, preserving the projections ν and ν′. Identify its `OB⁺_dR,log`, `θ_log`, filtration and connection with 7.9–7.11, and its Poincaré sequence and Faltings extension `0→Ô(1)→gr¹OB⁺_dR,log→Ô⊗Ω¹_{V₀}(D)→0` with 7.13–7.14. Preserve `G_K`, the small-level-group action, and change of level, field and chart.

**Checks.**

- At a one-dimensional chart, both sides are `B_dR⁺[[X]]` with X in filtration degree one, and the identification fixes X.
- The residue of dlog q at the cusp is 1 on both sides; replacing `Ω¹(D)` by `Ω¹` would fail this.
- Away from the cusps both log structures are trivial and (2) is the identification of the ordinary period sheaves of `PadicHodgeTheory` §§2.1–2.7, 7.1–7.3.

Sources: [DLLZ-RH], Def. 2.2.10 and (2.2.13)–(2.2.15), pp. 13–14; Prop. 2.3.15, pp. 18–19; Cors. 2.4.2 and 2.4.5, pp. 20–21.

*Needs:* [6.4](#section-6-4); [6.5](#section-6-5); [6.15](#section-6-15); [6.23](#section-6-23); [7.9](#section-7-9); [7.11](#section-7-11); [7.13](#section-7-13); [7.14](#section-7-14); `CohomologyComparisons` §6.1.

<a id="section-7-16"></a>

### 7.16 `B_dR`-coefficient structure sheaves on analytic sites

For p-adic k, perfectoid `K⊇k_∞` and locally noetherian X/k, use `B_dR⁺(K,O_K)`, `t=log[ε]` and the unique lift `k→B_dR⁺`. On affinoids take inverse limits of `A⊗̂_k(B_dR⁺/t^r)` on analytic/étale sites. Localized bundles use the t-isogeny stack; a global positive model is not required.

- `TauCeti.LogAdic.BdRCoefficientSheaf`: The sheaves `O_X⊗̂_k(B_dR⁺/t^r)`, `O_X⊗̂_kB_dR⁺=lim_r` and `O_X⊗̂_kB_dR=(⋯)[t⁻¹]` on `X_an` and on `X_ét`.
- `TauCeti.LogAdic.BdRCoefficientSheaf.fil`: `Fil^r=t^r(O_X⊗̂_kB_dR⁺)` and `Fil^r(O_X⊗̂_kB_dR)=t^{−s}Fil^{r+s}(O_X⊗̂_kB_dR⁺)` for any `s≥−r`; [a,b]-truncations `(O_X⊗̂_kB_dR)^{[a,b]}=Fil^a/Fil^{b+1}`.
- `TauCeti.LogAdic.BdRCoefficientSheaf.affinoid_sections`: Lemma 3.1.4(1): on affinoid `X=Spa(A,A⁺)`, sections are `A⊗̂_k(B_dR⁺/t^r)` and higher étale cohomology vanishes.
- `TauCeti.LogAdic.BdRCoefficientSheaf.grade`: Lemma 3.1.4(2): `gr^r(O_{X_ét}⊗̂_kB_dR)≅O_{X_ét}⊗̂_kK(r)`, `Gal(K/k)`-equivariantly.
- `TauCeti.LogAdic.BdRCoefficientSheaf.analytic_etale`: Lemma 3.1.4(3),(5): the analytic sheaves are `λ_*` and `Rλ_*` of the étale ones, and `λ_*` is an equivalence on finite locally free modules.
- `TauCeti.LogAdic.BdRCoefficientSheaf.affinoid_modules`: Lemma 3.1.4(4): on affinoid X, finite projective `A⊗̂_kB_dR⁺`-modules are equivalent to finite locally free modules on `X_an` and on `X_ét`.
- `TauCeti.LogAdic.BdRCoefficientSheaf.VectorBundle`: Vector bundles on `X⁺` (finite locally free `O_X⊗̂_kB_dR⁺`-modules) and on X (t-isogeny stack); `E⊗_{O_X}M` for a vector bundle E on `X_an`.
- `TauCeti.LogAdic.BdRCoefficientSheaf.pullback`: A morphism `f:Y→X` of locally noetherian adic spaces over k induces `f⁻¹(O_X⊗̂_kB_dR⁺)→O_Y⊗̂_kB_dR⁺` compatibly with filtrations, with `map_id` and `map_comp`; `Gal(K/k)` acts through the coefficients.

**Checks.**

- `TauCeti.LogAdic.BdRCoefficientSheaf.point`: For `X=Spa(k,O_k)`, `O_X⊗̂_kB_dR⁺=B_dR⁺(K,O_K)` with `Fil^r=t^rB_dR⁺` and `gr⁰=K`.
- `TauCeti.LogAdic.BdRCoefficientSheaf.gr_zero`: `gr⁰(O_X⊗̂_kB_dR)=O_X⊗̂_kK`; for `X=Spa(k⟨T⟩)` its sections are K⟨T⟩.
- `TauCeti.LogAdic.BdRCoefficientSheaf.not_algebraic_tensor`: For `X=Spa(k⟨T⟩)`, the section `∑_np^nx_nT^n` of `O_X⊗̂_kK`, with `x_n∈O_K` linearly independent over k, is not in `k⟨T⟩⊗_kK`, whose elements have coefficients in a finite-dimensional k-subspace of K.
- `TauCeti.LogAdic.BdRCoefficientSheaf.twist`: `Gal(K/k)` acts on `gr¹(O_X⊗̂_kB_dR⁺)=t·(O_X⊗̂_kK)` through `σ(tf)=χ(σ)t·σ(f)`, so `gr¹≅O_X⊗̂_kK(1)` and not `O_X⊗̂_kK` as Galois-equivariant sheaves.
- For `X=Spa(k)`, `O_X⊗̂_kB_dR⁺=B_dR⁺` with `Fil^r=t^rB_dR⁺` and `gr⁰=K`.
- `gr⁰(O_X⊗̂_kB_dR)=O_X⊗̂_kK`, so finite locally free `gr⁰`-modules are vector bundles on `X_{K,an}` (Remark 3.1.3).

Sources: [DLLZ-RH], Def. 3.1.1(1), p. 22; Lem. 3.1.4, p. 22; Lem. 3.1.4(5), p. 23; Equation (3.1.5) and following, p. 23.

*Needs:* `PadicHodgeTheory` §§0.2–0.3 (de rham period ring); `PadicHodgeTheory` §§0.2–0.3 (fontaine element t); `AdicSpacesPartII` R0 (completed tensor product); [6.1](#section-6-1); [6.37](#section-6-37); `ClassicalAdicEtaleCohomology` §§1.1–1.4, 8.2, 11.1–11.2 (etale acyclicity of vector bundles).

<a id="section-7-17"></a>

### 7.17 Filtered period log connections and Higgs reduction

For p-adic k, perfectoid `K⊇k_∞`, log smooth locally noetherian fs X/k, use coefficient sites `𝒳⁺`, `𝒳` of 7.16 and scalar-extended log differentials. Integrable connections are `B_dR`-linear; t-connections are `B_dR⁺`-linear with `∇⁺(fe)=te⊗df+f∇⁺e`; Higgs fields are `O_{X_K}`-linear into `Ω^log(−1)`. Coherent variants are k-linear with coherent transversal filtration.

- `TauCeti.LogAdic.FilteredLogConnection`: An integrable `B_dR`-linear log connection on a vector bundle on X with a decreasing filtration by locally free `O_X⊗̂_kB_dR⁺-submodules` satisfying Griffiths transversality.
- `TauCeti.LogAdic.FilteredLogConnection.transversality`: `∇(Fil^r)⊂Fil^{r−1}⊗Ω^log`; on the de Rham complex the qth term carries `Fil^{r−q}` and the differential maps `Fil^{r−q}` into `Fil^{r−q−1}`.
- `TauCeti.LogAdic.FilteredLogConnection.t_connection`: Lemma 3.1.8: `(E⁺,∇⁺)↦(E⁺⊗B_dR,t⁻¹∇⁺,{t^rE⁺}_{r≥0})` is an equivalence onto filtered log connections with `Fil^r=t·Fil^{r−1}` for `r≥1`.
- `TauCeti.LogAdic.FilteredLogConnection.higgs`: Lemma 3.1.9: reduction of an integrable log t-connection modulo t is a log Higgs bundle `E⁺/t→E⁺/t⊗Ω^log_{X_K}(−1)`, functorial in `(E⁺,∇⁺)`.
- `TauCeti.LogAdic.FilteredLogConnection.de_rham_complex`: The log de Rham complex `DR_log(E)=(E⊗Ω^{log,•}_{X/B_dR},∇)` and log de Rham cohomology `H^i_{log dR}(X,E)=H^i(X,DR_log(E))` (Definition 3.1.7(1)).
- `TauCeti.LogAdic.FilteredLogConnection.higgs_complex`: For a log Higgs bundle, the complex `(E⊗Ω^{log,•}_{X_K}(−•),θ)` and `H^i_{log Higgs}(X_K,E)` (Definition 3.1.7(3)).
- `TauCeti.LogAdic.FilteredLogConnection.coherent_filtered`: Definition 3.1.7(4): a k-linear log connection on a coherent sheaf with a Griffiths-transversal coherent filtration, `Fil^rDR_log(E)=(Fil^{r−•}E⊗Ω^{log,•}_X,∇)`, log Hodge cohomology `H^{a,b}_{log Hodge}=H^{a+b}(X,gr^aDR_log(E))` and the Hodge–de Rham spectral sequence.

**Checks.**

- `TauCeti.LogAdic.FilteredLogConnection.trivial`: `E=O_X⊗̂_kB_dR` with `∇=d⊗1` and `Fil^r=t^r(O_X⊗̂_kB_dR⁺)` is a filtered log connection; under Lemma 3.1.8 it corresponds to `(O_X⊗̂_kB_dR⁺,t·d)`, whose reduction modulo t is `(O_{X_K},θ=0)`.
- `TauCeti.LogAdic.FilteredLogConnection.mod_t_linear`: The term `(te)⊗df` vanishes modulo t, so the reduced map is O-linear.
- `TauCeti.LogAdic.FilteredLogConnection.not_unshifted`: The filtered de Rham qth term has `Fil^{r−q}`; an unshifted `Fil^r` in every degree does not encode transversality.
- `TauCeti.LogAdic.FilteredLogConnection.higgs_twist`: If `∇` is `Gal(K/k)`-equivariant then `∇⁺=t∇` satisfies `∇⁺(σe)=χ(σ)⁻¹σ(∇⁺e)`, so `θ=∇⁺ mod t` is equivariant as a map to `E⊗Ω^log_{X_K}(−1)` and not to `E⊗Ω^log_{X_K}(1)`.
- The graded differential is O-linear; its Tate twist is `−1`.
- Lemma 3.1.8 sends `(E⁺,∇⁺)` to the filtration `{t^rE⁺}_{r≥0}`; it does not produce arbitrary transversal filtrations.

Sources: [DLLZ-RH], Def. 3.1.7(2), p. 24; Def. 3.1.7(3), p. 24; Lem. 3.1.8, p. 24; Lem. 3.1.9, p. 24.

*Needs:* [7.16](#section-7-16); [6.11](#section-6-11); [6.10](#section-6-10).

<a id="section-7-18"></a>

### 7.18 Decompletion of logarithmic Kummer towers

Prove `TauCeti.LogAdic.log_tower_decompletion`. For a filtered Γ-system `(A_i,Â_∞)`, complete `Â_∞` with dense `colim A_i`, decompletion means: every finite projective Γ-module over `Â_∞` has a finite-level model, and every model becomes good at all sufficiently large levels, meaning `H^•(Γ,L_i)=H^•(Γ,L_∞)`. Prove `colim_iProj_{A_i}(Γ)≃Proj_{Â_∞}(Γ)`, with eventual uniqueness (A.1.2–A.1.3). For a weakly/stably decompleting triple with initial stage 0 and uniformly continuous family `ψ_s:Γ→A₀×` (each neighbourhood of 1 contains all `ψ_s(V)` for one open V), finite free/projective models twist to models and become good at one common level for all s (A.1.21). Establish the listed systems: arithmetic `A_{p^l}=A⊗_{ℚ_p}ℚ_p(μ_{p^l})`, p-completed union Â, all stably uniform, `Γ₁=Gal(ℚ_p(μ_{p^∞})/ℚ_p)` for Huber A, also `A⊗_kk(μ_{p^l})` for Banach A over p-adic k; geometric `A_{m,k̂_∞}`, Â from §2.3's strictly étale toric X and all-root X̃, `Γ₁=Hom(P^gp_ℚ/P^gp,μ_∞)=Hom(P^gp,Ẑ(1))`, `γT^a=γ(a)T^a`, `Γ̃=Γ₁⋊Gal(k_∞/k)`, also closed subgroups containing Γ₁; deformations `B_{r,m}=A⊗̂_k(B_dR⁺/ξ^r)⊗_{(B_dR⁺/ξ^r)⟨P⟩}(B_dR⁺/ξ^r)⟨(1/m)P⟩`, `r≥1`, completed `B̂_{r,∞}=B_dR⁺(X̃)/ξ^r`, with group Γ₁. Arithmetic/geometric systems are stably decompleting (A.2.1.1/A.2.2.1); deformations are weakly decompleting (A.2.3.3/A.2.3.4).

Apply decompletion only to the listed towers and their §3.3 pullbacks `R_{K,m}`, `R̄_{K,m}` and `{R′_{p^l}}`.

Develop the weak/stable formalism of DLLZ-RH A.1.6–A.1.10: isometric actions and splittings `Â_∞→Â_∞/A_i`, with uniform strict exactness of `C^•(Γ_i,Â_∞/A_i)`, give weak decompletion (A.1.8); stable decompletion (A.1.9) gives a decompletion system (A.1.10).

**Checks.**

- For `r=1` the deformation tower is the geometric tower: `B_{1,m}=A_{m,k̂_∞}` and `B̂_{1,∞}=Â_∞` with equivalent norms.
- For `P=Z_{≥0}`, (A.2.2.2) reads `k_∞⁺[Q_{≥0}]=k_∞⁺[Z_{≥0}]⊕⊕_{χ≠1}(k_∞⁺[Q_{≥0}])_χ`, the χ-part spanned by the `T^a` with `a∉Z` on which `Γ_1` acts through `χ`.
- Decompletion is not used beyond the listed towers; Remark 3.3.12 (non-isomorphic boundary comparison) is a property of the unipotent part, not of the models.

Sources: [DLLZ-RH], Def. A.1.2(2), p. 67; Thm. A.2.1.2 and its proof, p. 73; Thm. A.2.2.3 and its proof, p. 74; Thm. A.2.3.4, pp. 75–76.

*Needs:* [6.26](#section-6-26); [7.12](#section-7-12); [7.1](#section-7-1); [6.25](#section-6-25).

<a id="section-7-19"></a>

### 7.19 Logarithmic OC pushforward and coherence

Prove `TauCeti.LogAdic.log_oc_pushforward`. For p-adic k, perfectoid `K⊇k_∞`, smooth rigid normal-crossings pair `(X,D)`, and Z either X or an open smooth intersection of boundary components with pulled-back log structure, let `µ′_Z:Z_prokét/Z_K→Z_an`. For any rational Kummer L on X, `R^iµ′_{Z,*}(L̂_Z⊗OC_log,Z)=0` for `i>0`, and degree zero is finite locally free over `O_Z⊗̂_kK=gr⁰(O_Z⊗̂_kB_dR)`, of rank rk L for `Z=X`. On a toric affinoid with `K=k̂_∞`, identify sections with the unipotent good-model part `L(Z_K)`, finite projective over `R̄_K`, compatible with rational/finite étale pullback. Retain only a surjection `L(X_K)/(T₁,…,T_l)↠L(Z_K)`; `L(X_K)⊗R_{K,m₀}→L_{m₀}(X_K)` need not be an isomorphism.

Uses `m_0`.

**Checks.**

- Keep the non-surjective boundary-model comparison of Remark 3.3.12 as a rejection test for an overly strong base-change claim.
- For `Z≠X` the rank of `µ′_{Z,*}(L̂_Z⊗OC_log,Z) can` be smaller than rk L (only the unipotent part along the stratum survives); no rank equality is asserted there.
- For L trivial of rank one and `Z=X`, the pushforward is `O_X⊗̂_kK`, with `L(X_K)=R_K`.

Sources: [DLLZ-RH], Prop. 3.3.3 and the definition of Z before Lem. 3.3.2, p. 28; Lem. 3.3.15, p. 31; Lem. 3.3.16, p. 31; Rem. 3.3.12, p. 31.

*Needs:* [7.18](#section-7-18); [7.12](#section-7-12); [7.10](#section-7-10); [7.16](#section-7-16); [6.34](#section-6-34); [6.32](#section-6-32); [6.35](#section-6-35); `ClassicalAdicEtaleCohomology` §§1.1–1.4, 8.2, 11.1–11.2; `ClassicalAdicEtaleCohomology` §§1.1–1.4, 8.2, 11.1–11.2 (profinite g set cohomology).

<a id="section-7-20"></a>

### 7.20 Geometric logarithmic Riemann–Hilbert

For p-adic k, perfectoid `K⊇k_∞`, smooth rigid X/k with reduced normal-crossings D, and any rational Kummer L, let `µ′:X_prokét/X_K→X_an`. Construct RH on 7.16's 𝒳. Tensor compatibility needs 7.26's unipotence; residues use 7.23.

- `TauCeti.LogAdic.LogRH`: The geometric derived pushforward `Rµ′_*(L̂⊗OB_dR,log)`, identified with a degree-zero `Gal(K/k)`-equivariant filtered vector bundle on 𝒳 with integrable log connection.
- `TauCeti.LogAdic.LogRH.rank`: The bundle has `rank rk_{Q_p}L`.
- `TauCeti.LogAdic.LogRH.grade`: `gr^r RH_log(L)≅µ′_*(L̂⊗OC_log)(r)` for every `r∈Z`; this is `H_log(L)(r)` once the log Higgs functor is defined.
- `TauCeti.LogAdic.LogRH.plus`: `RH⁺_log(L)=Fil⁰RH_log(L)` is a vector bundle on `𝒳⁺` with integrable log t-connection `t∇_L`, and `Fil^r RH_log(L)=t^r RH⁺_log(L)` for all r (Lemma 3.1.8).
- `TauCeti.LogAdic.LogRH.exact`: `L↦RH_log(L)` is exact, and `R^iµ′_*(L̂⊗Fil^r OB_dR,log)=0` for `i>0` and all r.
- `TauCeti.LogAdic.LogRH.map_comp`: Pushforward of coefficient maps preserves identities and composition.
- `TauCeti.LogAdic.LogRH.restrict_open`: For an open immersion `j:X′→X` with the restricted divisor, `j*RH_log(L)≅RH_log(j⁻¹L)` compatibly with connections and filtrations (Remark 3.5.1).
- `TauCeti.LogAdic.LogRH.trivial_log`: Trivial-log specialization is the ordinary RH functor with the corrected filtration-completed structural periods.

**Checks.**

- `TauCeti.LogAdic.LogRH.constant`: `RH_log(Q_p)≅O_X⊗̂_k B_dR` with connection `d⊗1` (all residues zero) and `Fil^r=t^r(O_X⊗̂_k B_dR⁺)` (Lemma 3.3.2 with the whole interval).
- `TauCeti.LogAdic.LogRH.zero`: The zero local system gives the zero bundle.
- `TauCeti.LogAdic.LogRH.fractional_residue`: A finite boundary character with normalized residue `2/3` has a tensor square with normalized residue `1/3`; it cannot be modeled by an unrestricted tensor functor adding residues to `4/3`.
- Its rank equals that of L, without a de Rham assumption on L.
- K ranges over all perfectoid fields containing `k_∞`; the comparison theorems that need K to be the completion of k̄ are separate results.

Sources: [DLLZ-RH], §3 opening, p. 22; Equation (3.2.2) and Thm. 3.2.3(1), p. 25; §3.3, proof of Thm. 3.2.3(1), pp. 27–28; §3.3, (3.3.1) and following, p. 28.

*Needs:* [7.19](#section-7-19); [7.11](#section-7-11); [7.17](#section-7-17); [6.34](#section-6-34); [6.37](#section-6-37); [6.31](#section-6-31); [7.16](#section-7-16).

<a id="section-7-21"></a>

### 7.21 Geometric logarithmic Higgs functor

For 7.20's k, K, pair and L, reduce `RH⁺_log(L)` with its integrable t-connection modulo t. Preserve Galois action and the `−q` twist in degree q.

- `TauCeti.LogAdic.LogHiggs`: Degree-zero reduction with its O-linear integrable log Higgs field.
- `TauCeti.LogAdic.LogHiggs.underlying`: Its underlying module is `gr⁰ RH_log(L)`.
- `TauCeti.LogAdic.LogHiggs.pushforward_OC`: `H_log(L)≅µ′_*(L̂⊗OC_log)`, and `R^iµ′_*(L̂⊗OC_log)=0` for `i>0`.
- `TauCeti.LogAdic.LogHiggs.rank`: `H_log(L)` is a vector bundle on `X_K,an` of `rank rk_{Q_p}L`.
- `TauCeti.LogAdic.LogHiggs.field`: The field takes values in `Ω¹_log(−1)`.
- `TauCeti.LogAdic.LogHiggs.complex`: The log Higgs complex `(H_log(L)⊗Ω^{log,•}_{X_K}(−•),θ_L)` and its hypercohomology `H^i_logHiggs(X_K,an,H_log(L))` (Definition 3.1.7(3)).
- `TauCeti.LogAdic.LogHiggs.map_comp`: The assignment preserves identity and composition of coefficient morphisms.

**Checks.**

- `TauCeti.LogAdic.LogHiggs.constant`: The constant local system has `H_log(Q_p)=O_{X_K}` with zero log Higgs field.
- `TauCeti.LogAdic.LogHiggs.twist`: The qth Higgs-complex term carries Tate twist `−q`.
- `TauCeti.LogAdic.LogHiggs.residue`: For X the closed unit disc over k with `D={T=0}` and a rank-two `Q_p-local` system on `X_két` whose boundary inertia acts unipotently but nontrivially, `θ_L` is nonzero, `θ_L∧θ_L=0`, and its residue along D is a nonzero nilpotent endomorphism of `H_log(L)|_D` (valued in the `(−1)` twist); for the constant system the residue is zero.
- The Tate twist cannot be discarded when describing the Higgs field.

Sources: [DLLZ-RH], Thm. 3.2.4(1), p. 25; Thm. 3.2.4(1), pp. 25–26; Lem. 3.1.9, p. 24; Def. 3.1.7(3), p. 24.

*Needs:* [7.20](#section-7-20); [7.17](#section-7-17); [7.19](#section-7-19).

<a id="section-7-22"></a>

### 7.22 Regularity and normalized log extensions

Prove `TauCeti.LogAdic.log_regularity_and_extension`. For smooth rigid normal-crossings `(X,D)` and `U=X−D`, a torsion-free coherent integrable log connection with residue eigenvalues in `ℚ∩[0,1)` is locally free when reflexive. A horizontal map from a locally free such F to torsion-free coherent such F′, invertible on U, is invertible on X. The latter also holds for coefficient `O_X⊗̂_kB_dR`-modules on 𝒳.

**Checks.**

- A boundary modification changing residue by an integer shows why the normalization interval matters.

Sources: [DLLZ-RH], Prop. 3.4.16, p. 37; Prop. 3.4.17, p. 37; Proof of Prop. 3.4.17, p. 37.

*Needs:* [6.11](#section-6-11); [6.5](#section-6-5); [7.17](#section-7-17); AdicSpacesPartIII R3 (coherent sheaf); AdicSpacesPartIII R3 (coherent sheaf operations); AdicSpacesPartIII R3 (locally free sheaf).

<a id="section-7-23"></a>

### 7.23 Rational normalized logarithmic residues

Prove `TauCeti.LogAdic.normalized_log_residues`. For 7.20's k,K,pair,L and component Z geometrically irreducible after finite field extension, RH residues have eigenvalues in `ℚ∩[0,1)`. On toric affinoids, `RH⁺(L)(X)=N⁺⊂N_∞=(L̂⊗B_dR⁺)(X̃)` consists of c with `(γ−1)^Λc→0` t-adically, and `RH(L)(X)=N⁺[t⁻¹]`. Residue at `T_i=0` is `t⁻¹logγ_i` on `N/T_iN`, independent of roots of unity. Unipotent boundary inertia makes it nilpotent.

For geometric RH require `Z_k̄` irreducible, after finite extension if necessary. Nilpotence requires geometric boundary unipotence.

**Checks.**

- Unipotent Jordan inertia produces zero residue eigenvalues, not necessarily a zero residue operator.
- A nontrivial finite-order Kummer character along D gives a nonzero rational residue eigenvalue, so nilpotence genuinely needs unipotence.

Sources: [DLLZ-RH], Thm. 3.2.3(2), p. 25; Lem. 3.4.7, p. 35; Proof of Thm. 3.2.12, p. 38.

*Needs:* [7.20](#section-7-20); [6.35](#section-6-35); [7.18](#section-7-18); [7.12](#section-7-12); [6.11](#section-6-11); [6.34](#section-6-34).

<a id="section-7-24"></a>

### 7.24 Arithmetic logarithmic de Rham functor

For 7.20's k, pair and any rational L, set `D_dR,log(L)=µ_*(L̂⊗OB_dR,log)` with induced connection and filtration. This is an underived arithmetic pushforward; higher arithmetic pushforwards need not vanish. For `X=Spa(ℚ_p,ℤ_p)` and `L=ℚ_p`, the class `log χ` is nonzero in `H¹(G_{ℚ_p},B_dR)`. Higher-direct-image vanishing in 7.20 concerns the geometric projection µ′. Invariants use `K=k̂_∞`. Interior de Rhamness is required for association and total graded rank; boundary geometric irreducibility is unnecessary.

- `TauCeti.LogAdic.ArithmeticLogDR`: The arithmetic degree-zero pushforward with its induced connection and coherent filtration.
- `TauCeti.LogAdic.ArithmeticLogDR.geometric_invariants`: For `K=k̂_∞`, the arithmetic pushforward is `RH_log(L)^{Gal(k_∞/k)}`, with `Fil^rD_dR,log(L)=(Fil^rRH_log(L))^{Gal(k_∞/k)}` (Lemma 3.3.17). This formula is not a descent claim through `Aut(K/k)` for arbitrary perfectoid K.
- `TauCeti.LogAdic.ArithmeticLogDR.residue_eigenvalues`: For every irreducible component Z of D the eigenvalues of `Res_Z(∇_L)` lie in `ℚ∩[0,1)`; they are all 0 when L|U has unipotent geometric monodromy along D.
- `TauCeti.LogAdic.ArithmeticLogDR.toRH`: The adjunction map `D_dR,log(L)⊗̂_k B_dR→RH_log(L)` is horizontal, injective and strictly compatible with filtrations (Lemma 3.4.18).
- `TauCeti.LogAdic.ArithmeticLogDR.toRH_iso_of_isDeRham`: If L|U is de Rham, the adjunction map is an isomorphism of filtered vector bundles with log connection (Corollary 3.4.21).
- `TauCeti.LogAdic.ArithmeticLogDR.de_rham_grade_rank`: For de Rham interior input its total graded rank equals rk L.
- `TauCeti.LogAdic.ArithmeticLogDR.restrict_interior`: On U with trivial log structure, `D_dR,log(L)|U` is the ordinary arithmetic de Rham functor of L|U (Remark 3.5.1).
- `TauCeti.LogAdic.ArithmeticLogDR.map_comp`: Coefficient maps induce horizontal filtered maps, preserving composition.

For de Rham coefficients with unipotent geometric boundary monodromy on smooth proper strict-normal-crossings pairs over finite k, use B3.log.3’s arithmetic functor; 7.26 identifies the general extension with it.

**Checks.**

- `TauCeti.LogAdic.ArithmeticLogDR.constant`: For the trivial `Q_p` coefficient system, `D_dR,log=O_X` with d and its weight-zero filtration.
- `TauCeti.LogAdic.ArithmeticLogDR.tate`: For `L=Q_p(m)`, `D_dR,log(L)=O_X·(e_m⊗t^{−m})` with `∇=d`, and `gr^{−m}` is its only nonzero graded piece.
- At `X=Spa(ℚ_p,ℤ_p)` with constant L, `log χ` cannot be a coboundary in `B_dR`: a primitive with a negative t-leading term would give a nonzero invariant in `C_p(r)` for `r<0`; a primitive in `B_dR⁺` would reduce to a primitive in `C_p`, contradicting its nonzero Tate–Sen class.
- `TauCeti.LogAdic.ArithmeticLogDR.zero`: The zero local system maps to the zero filtered bundle.
- `TauCeti.LogAdic.ArithmeticLogDR.non_de_rham`: For `X=Spa(k,O_k)` with empty boundary and a `Q_p-character` of `Gal(k̄/k)` whose Sen weight is not an integer, `D_dR,log(L)=0` although `rk L=1`, so the rank equality needs the de Rham hypothesis.
- Do not require de Rham input to define the functor or assert equal ranks for non-de Rham input.

Sources: [SCH13], Prop. 6.16(ii), p. 39 (the arithmetic `log χ` class); [DLLZ-RH], Equation (3.2.6) and Thm. 3.2.7(1), p. 26; Thm. 3.2.7(2), p. 26; Lem. 3.4.18, p. 38; Cor. 3.4.21, p. 38; Lem. 3.3.17 and its proof, pp. 31–32.

*Needs:* `AutomorphicBundles` B3.log.3 (periods, filtered Poincaré lemma and de Rham unipotent tensor comparison); [7.20](#section-7-20); [7.21](#section-7-21); [7.19](#section-7-19); [7.18](#section-7-18); [7.23](#section-7-23); [7.22](#section-7-22); `PadicHodgeTheory` §§2.1–2.4 (de rham period sheaf); `PadicHodgeTheory` §7.2 (de rham lisse sheaf); `PadicHodgeTheory` §0.1 (Tate–Sen cohomology); `ClassicalAdicEtaleCohomology` §§1.1–1.4, 8.2, 11.1–11.2; AdicSpacesPartIII R3 (coherent sheaf); AdicSpacesPartIII R3 (coherent sheaf operations); AdicSpacesPartIII R3 (locally free sheaf).

<a id="section-7-25"></a>

### 7.25 Restricted logarithmic comparison under pullback

Prove `TauCeti.LogAdic.log_rh_pullback`. For a morphism of smooth rigid normal-crossings log pairs `h:(Y,E)→(X,D)` over p-adic k and rational Kummer L, the `H_log`, `RH_log` and `D_dR,log` pullback adjunctions are injective, the latter two filtration-strict. Put `m_WZ=mult_W(h⁻¹Z)` and `n_Z` zero for unipotent geometric inertia, one otherwise. If `Σ_Zm_WZn_Z≤1` for every W, they are isomorphisms preserving connection/Higgs/filtration and geometric Galois action. Residues pull back by the commuting sum `Res_W(h*∇)=Σ_{h(W)⊂Z}m_WZh*_{WZ}Res_Z∇`.

Uses `V_K`, `Y_K`.

**Checks.**

- For `h:S↦T=S²` on the disc `(m_WZ=2)` and a Kummer character along `Z={T=0}` with residue `2/3 (n_Z=1)`, the pulled-back residue is `4/3` while `RH_log(h⁻¹L)` has residue `1/3`, so the adjunction map is injective but not an isomorphism.

Sources: [DLLZ-RH], Thm. 3.2.3(4), p. 25; Lem. 3.5.3, p. 39; Cor. 3.5.7, p. 39; Proof of Cor. 3.5.7, p. 40.

*Needs:* [7.20](#section-7-20); [7.21](#section-7-21); [7.24](#section-7-24); [7.23](#section-7-23); [7.22](#section-7-22); [6.35](#section-6-35); [6.11](#section-6-11).

<a id="section-7-26"></a>

### 7.26 Tensor comparison for unipotent boundary systems

Prove `TauCeti.LogAdic.unipotent_log_tensor`. For rational Kummer local systems with unipotent geometric boundary monodromy, `RH_log/H_log` are tensor functors to filtered Galois-equivariant integrable log connections with nilpotent residues/log Higgs bundles. Their period maps `µ′⁻¹RH_log(L)⊗OB_dR,log→L̂⊗OB_dR,log` and `µ′⁻¹H_log(L)⊗OC_log→L̂⊗OC_log` are isomorphisms. With de Rham interior, `D_dR,log` is likewise tensor into filtered nilpotent log connections on `X_an`, and `µ⁻¹D_dR,log(L)⊗OB_dR,log→L̂⊗OB_dR,log` is an isomorphism. The unipotence condition is retained throughout.

For smooth proper strict-normal-crossings pairs over finite k and de Rham interior input, use B3.log.3’s supplied de Rham unipotent tensor comparison.

- `TauCeti.LogAdic.unipotent_log_tensor.horizontal_agreement`: On this common de Rham range, identify the arithmetic functor, its filtration and connection, and its horizontal comparison map with `unipotentLogPeriodComparison`, preserving unit, tensor, dual, direct-summand projectors and pullback.

**Checks.**

- On a smooth proper pair over finite k with constant `ℚ_p` coefficients, the common comparison is the unit map on structural periods with its d connection; both tensor-unit maps agree.

- For a Kummer character `χ` along D with residue `2/3`, `RH_log(χ)⊗RH_log(χ)` has residue `4/3` while `RH_log(χ²)` has residue `1/3`, so the unrestricted tensor statement is false; `χ` does not have unipotent monodromy.

- A rank-one residue `3/4` tensors with itself to `3/2`, whose normalized residue is `1/2`.

Sources: [DLLZ-RH], Thm. 3.2.12(1), p. 27; Thm. 3.2.12(2), p. 27; Paragraph before Thm. 3.2.12, p. 27; Proof of Thm. 3.2.12, p. 39.

*Needs:* `AutomorphicBundles` B3.log.3 (periods, filtered Poincaré lemma and de Rham unipotent tensor comparison); [7.20](#section-7-20); [7.21](#section-7-21); [7.24](#section-7-24); [7.19](#section-7-19); [7.23](#section-7-23); [6.35](#section-6-35); `PadicHodgeTheory` §7.2 (de rham lisse sheaf).

<a id="section-7-27"></a>

### 7.27 Proper logarithmic period cohomology comparison

Prove `TauCeti.LogAdic.proper_log_period_cohomology`. Let X be proper over k (smooth, with normal crossings divisor D), K the completion of an algebraic closure k̄ of k, and L a `Z_p-local` system on `X_két`. For each `i≥0` there are canonical `Gal(K/k)`-equivariant isomorphisms `H^i(X_K,két,L)⊗_{Z_p}B_dR≅H^i_logdR(𝒳,RH_log(L))`, compatible with filtrations, and `H^i(X_K,két,L)⊗_{ℤ_p}K≅H^i_logHiggs(X_K,an,H_log(L))`; they factor through `H^i(X_K,prokét,L̂⊗B_dR)` and `H^i(X_K,prokét,L̂⊗Ô)` (Lemmas 3.6.1–3.6.2). If moreover L|U is de Rham, `H^i(X_K,két,L)⊗_{Z_p}B_dR≅H^i_logdR(X_an,D_dR,log(L))⊗_k B_dR` compatibly with filtrations, the log Hodge–de Rham spectral sequence of `D_dR,log(L)` degenerates at E₁, and `H^i(X_K,két,L)⊗_{ℤ_p}K≅⊕_{a+b=i}H^{a,b}_logHodge(X_an,D_dR,log(L))⊗_k K(−a)`, the 0-th graded piece of the previous isomorphism. No compactly supported or subcanonical version is asserted.

**Checks.**

- The Tate twist is `−a`; the decomposition concerns coefficient log Hodge cohomology, not just ordinary differential-form cohomology.

Sources: [DLLZ-RH], Thm. 3.2.3(3), p. 25; Lem. 3.6.1, pp. 41–42; §3.6, after Lem. 3.6.2, p. 42; Thm. 3.2.7(3), p. 26.

*Needs:* [7.5](#section-7-5); [7.3](#section-7-3); [7.8](#section-7-8); [7.13](#section-7-13); [7.20](#section-7-20); [7.19](#section-7-19); [7.21](#section-7-21); [7.24](#section-7-24); `PadicHodgeTheory` §7.2 (de rham lisse sheaf); [6.37](#section-6-37); [6.31](#section-6-31); AdicSpacesPartIII R3 (kiehl proper mapping theorem); AdicSpacesPartIII R3 (proper coherent cohomology field extension).

<a id="section-7-28"></a>

### 7.28 Relative logarithmic de Rham comparison

Prove `TauCeti.LogAdic.relative_log_comparison`. For proper log smooth f between smooth rigid normal-crossings pairs `(X,D)`, `(Y,E)` over p-adic k, require also proper smooth `U=X−D→V=Y−E`; then `D=f⁻¹E`. For a `ℤ_p`-local system L with de Rham interior, `R^if_két,*L` is lisse with de Rham interior and `D_dR,log(R^if_két,*L)≅(R^if_logdR,*D_dR,log(L))_free` as filtered Gauss–Manin log connections; free denotes the `O_Y`-torsion-free quotient.

**Checks.**

- A relative conclusion omitting the interior properness or the torsion-free quotient is rejected.

Sources: [DLLZ-RH], Thm. 3.2.7(5), p. 26; Thm. 3.2.7(5), p. 27; Proof of Cor. 3.5.14, p. 41.

*Needs:* [7.13](#section-7-13); [7.20](#section-7-20); [7.24](#section-7-24); [7.22](#section-7-22); [6.34](#section-6-34); [6.20](#section-6-20); `PadicHodgeTheory` §7.3 (de rham pair derived pushforward); [6.37](#section-6-37); [7.6](#section-7-6); [7.7](#section-7-7); [6.24](#section-6-24); AdicSpacesPartIII R3 (kiehl proper mapping theorem).

<a id="section-7-29"></a>

### 7.29 Canonical coefficients of a Hodge-type datum on the log site

For neat Hodge-type data with fixed Siegel V₀ and universal A, use smooth projective toroidal compactification with normal-crossings boundary over p-adic k containing the reflex field. For `W∈Rep_{ℚ_p}(Gᶜ)`, `Gᶜ=G`, import B2.general/B3.general's full-group realizations and B3.log.2–B3.log.3's `canonicalKummerCoefficient` and canonical unipotent comparison. The targets below identify their realizations with the general functors of Layers 6–7. Here `V₀=H₁(A)`, dual to `R¹f_*`; irreducibles are cut from `V₀^{⊗m_W}(−t_W)` by `s_W`, then extend additively. Use 6.20 to identify the supplied Kummer extension; the Betti realization uses `ι:ℚ̄_p≅ℂ`.

- `TauCeti.LogAdic.CanonicalLogRealizations`: The compatibility identifications between the supplied coefficient functors on the toroidal Kummer/pro-Kummer sites and 7.24's realizations `p-W_dR` and `p-W_B`.
- `TauCeti.LogAdic.CanonicalLogRealizations.etale_restriction`: Restriction to the interior recovers the canonical p-adic local system.
- `TauCeti.LogAdic.CanonicalLogRealizations.de_rham_extension`: Its filtered log bundle agrees with the supplied nilpotent-residue canonical extension.
- `TauCeti.LogAdic.CanonicalLogRealizations.de_rham`: The de Rham realization of 7.24 agrees with `unipotentLogPeriodComparison_associated`, via the relative comparison for `A^m` and the Hodge tensors `s_W`.
- `TauCeti.LogAdic.CanonicalLogRealizations.hecke`: Pullbacks under finite-level Hecke maps agree with the coefficient representation action.
- `TauCeti.LogAdic.CanonicalLogRealizations.unipotent_monodromy`: The unipotent boundary monodromy supplied by `canonicalKummerCoefficient_monodromy` identifies with 6.35's monodromy and makes the residues of `p-W_dR` nilpotent (DLLZ-RH Theorem 3.2.12(2)); the Kummer-étale extension itself is unique by the boundary local-system equivalence, independently of unipotence.
- `TauCeti.LogAdic.CanonicalLogRealizations.p_de_rham`: `p-W_dR=D_dR,log(W_p)` of 7.24 identifies with the supplied filtered log connection with nilpotent residues on `S^tor_{K,Σ,k}`, preserving its tensor structure (DLLZ-RH Theorem 3.2.12(2)).
- `TauCeti.LogAdic.CanonicalLogRealizations.p_betti`: After `ι:ℚ̄_p≅C`, the horizontal sections of the analytified `p-W_dR|S_K` identify with the supplied C-local system `p-W_B`, preserving its `G(𝔸_f)`-equivariant tensor structure.
- `TauCeti.LogAdic.CanonicalLogRealizations.tensor`: The tensor, dual and unit isomorphisms for `W_p`, `W_dR`, `p-W_dR` and `p-W_B` agree with `unipotentLogPeriodComparison_tensor`.

**Checks.**

- `TauCeti.LogAdic.CanonicalLogRealizations.unit`: The trivial representation gives the constant `ℚ_p` sheaf and trivial filtered O bundle.
- `TauCeti.LogAdic.CanonicalLogRealizations.siegel`: In the Siegel case the standard representation is the semiabelian Tate/de Rham coefficient with its boundary extension.
- `TauCeti.LogAdic.CanonicalLogRealizations.no_levi_connection`: An arbitrary Levi coefficient has an automorphic bundle but is not thereby assigned a full-group flat local system.
- `TauCeti.LogAdic.CanonicalLogRealizations.p_de_rham_unit`: For the trivial representation `p-W_dR` is O with d and the filtration `Fil⁰=O`, `Fil¹=0`, and `p-W_B` is the constant sheaf C; a nontrivial filtration jump or residue would fail this.
- For the modular curve and `W = V₀`, `W_p` is the dual of `R¹f_*ℚ_p` of the universal elliptic curve, de Rham with `D_dR = (H¹_dR)^∨`; its residue at a cusp is nilpotent and nonzero (Tate curve).

Sources: [DLLZ-RH], Prop. 5.2.10, p. 54; §5.2, (5.2.12)–(5.2.16), p. 55; §5.5, the setting before Lem. 5.5.3, p. 62, and Lem. 5.5.6, p. 63; Prop. 5.2.17, p. 56; [BPC25], §4.4.38, p. 79.

*Needs:* `AutomorphicBundles` B3.log.2–B3.log.3 (`canonicalKummerCoefficient`, the associated, graded and tensor comparisons); [6.20](#section-6-20); [6.34](#section-6-34); [6.35](#section-6-35); [7.24](#section-7-24); [7.26](#section-7-26); [1.3](#section-1-3); `PadicHodgeTheory` §7.3 (de rham pair derived pushforward); `AutomorphicBundles` B1 (hodge tensor realizations); `AutomorphicBundles` B2 (etale coefficient local system); `AutomorphicBundles` B2.general (general flat realizations); `AutomorphicBundles` B3.general.2 (general logarithmic comparison); `ShimuraCompactifications` C2 (smooth normal crossings).

The compatibility preserves period maps, tensors and residues by DLLZ-RH Theorem 5.3.1. PerfectoidShimuraVarieties S6 consumes these finite-level compatibility identifications.

<a id="section-7-30"></a>

### 7.30 Agreement with the supplied canonical association

Prove `TauCeti.LogAdic.canonical_log_period_comparison`. Under 7.29's Hodge-type, neat, smooth projective toroidal hypotheses and finite k containing the completed reflex field E, prove that 7.24's association agrees with `AutomorphicBundles` B3.log.3's `unipotentLogPeriodComparison_associated`: use its supplied identification `p-W_dR≅W_dR⊗_Ek` and filtered horizontal period isomorphism. Agreement on the interior is fixed by 1.1–1.3's abelian tensor comparison; normalized nilpotent extensions determine agreement on the boundary. Match `unipotentLogPeriodComparison_graded` and `_tensor`, including duals, Hecke, level change, morphisms of Hodge-type data and reflex-field descent, and the induced horizontal `p-W_B≅W_B,ℂ` after ι. This is an equality of the general and supplied comparison maps on identified ringed sites.

**Checks.**

- For the trivial representation the isomorphism is the identity of (O, d) with `Fil⁰ = O`, `Fil¹ = 0`.
- For the modular curve and `W = V₀`, the isomorphism is the relative de Rham comparison of the universal elliptic curve; its Hodge–Tate graded piece on `S_K` is the sequence `0 → ω^{−1}(1) → T_pE ⊗ Ô → ω → 0` of 2.6.
- The isomorphism is not chosen up to scalar: it is fixed by the relative comparison of the abelian scheme, so no normalization at special points is needed in Hodge type.

Sources: [DLLZ-RH], Lem. 5.5.3 and its proof, pp. 62–63; Lem. 5.5.6 and Cor. 5.5.7, p. 63; Thm. 5.3.1, p. 56; proof of Thm. 3.2.12(2), pp. 38–39; [BPC25], §4.4.38 and Rem. 4.4.39, p. 79.

*Needs:* `AutomorphicBundles` B3.log.2–B3.log.3 (`canonicalKummerCoefficient`, the associated, graded and tensor comparisons); [7.29](#section-7-29); [7.24](#section-7-24); [7.22](#section-7-22); [7.26](#section-7-26); [7.25](#section-7-25); [1.1](#section-1-1); [1.3](#section-1-3); `PadicHodgeTheory` §7.3 (de rham pair derived pushforward); `AutomorphicBundles` B1 (hodge tensor realizations); `AutomorphicBundles` B3.general (general canonical extension); `AutomorphicBundles` B3.general (general boundary functoriality).

<a id="section-7-31"></a>

### 7.31 The two de Rham lattices of a canonical coefficient

For canonical unipotent/de Rham coefficients on the smooth toroidal pair, put `M=Ŵ_p⊗B_dR⁺`, `M⁰=(W_dR⊗OB⁺_dR,log)^{∇=0}` in their common localized module, each with `Fil^iL=t^iL`. Use horizontal toric Taylor frames, rather than the structural tensor product's Hodge-intersection filtration; intersections/quotients are sheafwise.

- `TauCeti.LogAdic.TwoDeRhamLattices`: The common localized module with M, `M⁰` and their specified filtrations.
- `TauCeti.LogAdic.TwoDeRhamLattices.common_localization`: Inverting t identifies both lattice localizations with the association’s period local system.
- `TauCeti.LogAdic.TwoDeRhamLattices.first_quotient`: `M/Fil¹M` identifies with `W_p⊗Ô`.
- `TauCeti.LogAdic.TwoDeRhamLattices.map`: A morphism of canonical coefficient representations carries both lattices and filtrations compatibly.
- `TauCeti.LogAdic.TwoDeRhamLattices.fil_eq`: `Fil^iM=Fil^iB_dR·M` and `Fil^iM⁰=Fil^iB_dR·M⁰` for all `i∈Z`; in particular `Fil^{i+1}L=t·Fil^iL` where t is defined.
- `TauCeti.LogAdic.TwoDeRhamLattices.horizontal_frame`: `M⁰⊗_{B_dR⁺}OB⁺_dR,log≅W_dR⊗_{O}OB⁺_dR,log` compatibly with connections.
- `TauCeti.LogAdic.TwoDeRhamLattices.tensor`: M and `M⁰` of `W⊗W′` and of `W^∨` are the tensor products and duals of those of W and W′, compatibly with their filtrations.

**Checks.**

- `TauCeti.LogAdic.TwoDeRhamLattices.unit`: For the trivial representation the two lattices agree with `B_dR⁺`.
- `TauCeti.LogAdic.TwoDeRhamLattices.relative_position`: For scalar rank-one lattices `M=Ae` and `M⁰=tᵃAe` in A[1/t]e, both localize to A[1/t]e, `Fil^iM⁰=t^{a+i}Ae=Fil^{a+i}M` for all `i∈Z`, and `M∩Fil^jM⁰=t^{max(0,a+j)}Ae`; for `a≠0` the lattices differ although their localizations agree.
- `TauCeti.LogAdic.TwoDeRhamLattices.horizontal_requirement`: The unrestricted module `W_dR⊗OB_dR,log⁺` is not itself `M⁰`; its horizontal kernel is required.
- `TauCeti.LogAdic.TwoDeRhamLattices.tate_line`: For a rank-one associated pair with `Ŵ_p≅Q_p(1)` and `W_dR=(O,d)` with `Gr^{−1}W_dR=W_dR`, one has `M⁰=Fil^{−1}B_dR·M=t⁻¹M`, whereas `Fil⁰` of the Hodge-induced filtration on `(W_dR⊗OB_dR,log)^{∇=0}` is M itself.
- The construction needs the relative position of two lattices; a single filtration of `W_dR` alone is insufficient.

Sources: [BPC25], Rem. 4.4.39 and following text, p. 79; Rem. 4.4.39 and following text, p. 79.

*Needs:* [7.30](#section-7-30); [7.13](#section-7-13); [7.8](#section-7-8); [7.12](#section-7-12); `PadicHodgeTheory` §§2.1–2.4 (poincare lemma and faltings extension). The horizontal frame for the coefficient connection is constructed here; §§2.7, 7.1–7.3:local-rational supplies the untwisted Poincaré lemma.

<a id="section-7-32"></a>

### 7.32 The lattice Hodge–Tate filtration

For 7.31 set `F_{−j}=image(M∩Fil^jM⁰→M/Fil¹M)`, kernel `Fil¹M∩Fil^jM⁰`. Use BPC25 indexing `Gr_j=F_j/F_{j−1}`; the ascending filtration is locally split with finite locally free gradeds.

- `TauCeti.LogAdic.LatticeHTFiltration`: The image filtration with `F_{−j}=image(M∩Fil^jM⁰→M/Fil¹M)`.
- `TauCeti.LogAdic.LatticeHTFiltration.mem`: A quotient class lies in `F_{−j}` iff it has a lift belonging to `M∩Fil^jM⁰`.
- `TauCeti.LogAdic.LatticeHTFiltration.mono`: The image filtration is increasing in the HT index because `Fil^jM⁰` is decreasing.
- `TauCeti.LogAdic.LatticeHTFiltration.grade`: With the displayed BPC25 indexing, its graded identification agrees with `AutomorphicBundles` B3.log.3's `unipotentLogPeriodComparison_graded`, with the Tate twist: `Gr_j(Ŵ_p⊗Ô)(j)≃Gr^jW_dR⊗Ô`.
- `TauCeti.LogAdic.LatticeHTFiltration.map`: Compatible maps of the two filtered lattices induce filtered quotient maps.
- `TauCeti.LogAdic.LatticeHTFiltration.locally_split`: Each `F_i` is a locally direct-summand Ô-submodule, `F_i=0` for i below the lowest Hodge jump and `F_i=Ŵ_p⊗Ô` from the highest jump on.

**Checks.**

- `TauCeti.LogAdic.LatticeHTFiltration.weight_zero`: For a weight-zero line, `F_i=0` for `i<0` and `F_i` is the full line for `i≥0`.
- `TauCeti.LogAdic.LatticeHTFiltration.lattice_shift`: For scalar t-adic filtration and `M⁰=t^aM` in rank one, `F_i` is zero for `i<a` and the full quotient for `i≥a`.
- `TauCeti.LogAdic.LatticeHTFiltration.correct_denominator`: The quotient kernel at `−j` is `Fil¹M∩Fil^jM⁰`, not all of `Fil¹M` when that is not contained in `Fil^jM⁰`.
- `TauCeti.LogAdic.LatticeHTFiltration.tate_line`: For the associated pair `Ŵ_p≅Q_p(1)`, `W_dR=(O,d)` with `Gr^{−1}W_dR=W_dR`, `F_{−2}=0` and `F_{−1}=Ô(1)`, so `Gr_{−1}(−1)≅Ô≅Gr^{−1}W_dR⊗Ô`; a convention with `F_j` in place of `F_{−j}` would put the jump at +1.
- `TauCeti.LogAdic.LatticeHTFiltration.siegel_h1`: On the open Siegel variety, for the pair `(H₁(A,Q_p),H_{1,dR}(A))` of the universal abelian scheme, `F_{−2}=0`, `F_{−1}=Lie(A)⊗Ô(1)` and `F₀=H₁(A,Q_p)⊗Ô`, recovering `0→Lie(A)⊗Ô(1)→H₁(A,Q_p)⊗Ô→ω_{A^t}⊗Ô→0 (BPC25 §4.4.8, p. 67)`.
- Increasing the ascending index enlarges F.
- For scalar t-adic filtration and a rank-one second lattice `M⁰=t^aM`, the ascending filtration jumps at a; translating this to named Tate weights requires the imported Layer 1 convention.

Sources: [BPC25], text after Rem. 4.4.39, p. 79; text after Rem. 4.4.39, p. 79.

*Needs:* `AutomorphicBundles` B3.log.2–B3.log.3 (`canonicalKummerCoefficient`, the associated, graded and tensor comparisons); [7.31](#section-7-31); [7.30](#section-7-30); [7.13](#section-7-13); [1.2](#section-1-2); [2.11](#section-2-11); `CohomologyComparisons` §0.4 (twist frobenius filtration normalization).

<a id="section-7-33"></a>

### 7.33 Tensor and Hecke compatibility of the finite-level HT flag

Prove `TauCeti.LogAdic.canonical_ht_tensor`. For canonical full-group Gᶜ coefficients, prove tensor, dual, unit and Hecke compatibility: `F_i(W⊗W′)=Σ_{a+b=i}F_aW⊗F_bW′`, `F_i(W∨)=(F_{−i−1}W)^⊥`, and unit `F₋₁=0`, `F₀=Ô`. These maps agree with `unipotentLogPeriodComparison_tensor` on the supplied canonical coefficients. The filtered functor is exact, has exact gradeds and type µ, supplying 7.34's parabolic reduction.

**Checks.**

- For the tensor unit the lattice filtration jumps only at zero, and its comparison is the identity.
- A Tate line with ascending jump −1 has dual with jump +1; their tensor product jumps at zero. The supplied duality and the two-lattice annihilator formula give the same result.

- Tate lines of weights m,n tensor to the line of weight m+n.

Sources: [BPC25], text after Rem. 4.4.39, p. 80.

*Needs:* `AutomorphicBundles` B3.log.2–B3.log.3 (`canonicalKummerCoefficient`, the associated, graded and tensor comparisons); [7.32](#section-7-32); [7.31](#section-7-31); [7.30](#section-7-30); [7.26](#section-7-26); `AutomorphicBundles` B2 (coefficient tensor hecke); [7.25](#section-7-25); [2.11](#section-2-11); `AutomorphicBundles` B0 (hodge parabolic convention).

<a id="section-7-34"></a>

### 7.34 The Hodge–Tate `P^c_µ`-reduction of the canonical p-adic torsor

For the neat smooth projective toroidal Hodge-type pair, extend p-adic F to define µ and split G. Set `G_pet,p=Isom^⊗(W⊗Q̂_p,Ŵ_p)`; extend `G^{c,an}` by `Gᶜ(Ô(U))`. `P_HT` carries `Fil_iW=⊕_{w≥−i}W[µ=w]` to 7.32. Its `P_µ^c` uses the conjugation limit at zero; de Rham `P_dR` is étale with `P_µ^{std,c}` defined by the limit at infinity and the Hodge filtration. The HT torsor is pro-Kummer.

- `TauCeti.LogAdic.HodgeTateReduction`: The pair `(G_pet,p, P_HT)` on the pro-Kummer-étale site of `S^tor_{K,Σ}`, with the imported de Rham reduction `P_dR`.
- `TauCeti.LogAdic.HodgeTateReduction.torsor_assoc`: `G_pet,p×^{Gᶜ(Q_p)}W≅Ŵ_p` naturally and tensor-compatibly in W.
- `TauCeti.LogAdic.HodgeTateReduction.mem`: A local trivialization lies in `P_HT` iff it carries `Fil_•W⊗Ô` to `F_•(Ŵ_p⊗Ô)` for one (equivalently every) faithful W.
- `TauCeti.LogAdic.HodgeTateReduction.isTorsor`: `P_HT` is locally nonempty and simply transitive under `P^{c,an}_µ`.
- `TauCeti.LogAdic.HodgeTateReduction.levi`: `P_HT×^{P^{c,an}_µ}M^{c,an}_µ` is `M_HT^an`, the Levi torsor of [7.35](#section-7-35); similarly `P_dR` gives `M_dR^an`.
- `TauCeti.LogAdic.HodgeTateReduction.hecke`: Hecke pullbacks and change of level carry `(G_pet,p,P_HT)` and `P_dR` to the corresponding objects.
- `TauCeti.LogAdic.HodgeTateReduction.open_restriction`: Restricted to the pro-étale site of `S_K`, `P_HT` is the reduction defined by the same filtration of the interior local systems.

**Checks.**

- `TauCeti.LogAdic.HodgeTateReduction.torus`: If Gᶜ is a torus (µ central), `P^c_µ=Gᶜ` and `P_HT` is the whole pushed-out torsor.
- `TauCeti.LogAdic.HodgeTateReduction.siegel`: On the open Siegel variety `P_HT` is the torsor of similitude trivializations of `H₁(A,Q_p)⊗Ô` carrying the µ-weight-one Lagrangian of `Q_p^{2g}` (which is `Fil_{−1}`) to `Lie(A)⊗Ô(1)` (BPC25 §4.4.8, with W the standard representation realized as `H₁(A,Q_p)`).
- `TauCeti.LogAdic.HodgeTateReduction.stabilizer_faithful`: For a faithful W the stabilizer in Gᶜ of the ascending filtration `Fil_•W` is `P^c_µ`, not `P^{std,c}_µ`; the latter stabilizes the Hodge filtration of `W_dR`.
- `P_HT` has structure group `P^c_µ` and `P_dR` has structure group `P^{std,c}_µ`; they are opposite parabolics with common Levi `M^c_µ`.
- No statement about the toroidal tower, its diamond or v-descent is made here.

Sources: [BPC25], text after Rem. 4.4.39, p. 80; text after Rem. 4.4.39, p. 80; §4.4.8, p. 68; §4.0, p. 49.

*Needs:* [7.33](#section-7-33); [7.32](#section-7-32); [7.29](#section-7-29); `AutomorphicBundles` B0 (central split quotient); `AutomorphicBundles` B0 (hodge parabolic convention); `AutomorphicBundles` B1 (filtration reduction); `AutomorphicBundles` B3.general (general canonical extension); [2.9](#section-2-9); [2.11](#section-2-11).

<a id="section-7-35"></a>

### 7.35 Finite-level cyclotomic Levi-torsor comparison

Under 7.34, take the Levi quotients of the two reductions via the common Levi of `P_µ/P_µ^std`. Prove that this two-lattice construction agrees with the finite-level ringed-site comparison supplied in `AutomorphicBundles` B3.HT.7 (`rationalHTLeviTorsor`), and hence with its rational tower pullback. Transport B0.3's Hodge/opposite and dual-coefficient dictionary explicitly: a local central weight `w=−j` corresponds to supplied Hodge coefficient degree `j`, giving the same twist `Ô(−j)=Ô(w)`. In this convention the supplied isomorphism reads `M_HT^an≅M_dR^an×^{µ,ℤ_p×}ℤ_p(1)` on the toroidal pro-Kummer site. The comparison is independent of embedding, preserves tensors and Hecke, and respects boundary restrictions and fan refinements. The cyclotomic twist descends étale; an untwisted identification requires a generator.

- `TauCeti.LogAdic.FiniteLeviComparison`: The agreement of the finite-level two-lattice Levi comparison with the supplied rational comparison after the Hodge/opposite and Tate-sign transport.
- `TauCeti.LogAdic.FiniteLeviComparison.central_twist`: Under this agreement the twisting action is through the central cocharacter `µ:Z_p×→M_µᶜ`.
- `TauCeti.LogAdic.FiniteLeviComparison.hecke`: The comparison's finite-level Hecke pullbacks match `rationalHTLeviTorsor_actions`.
- `TauCeti.LogAdic.FiniteLeviComparison.trivialization`: Choosing a compatible generator of `Z_p(1)` identifies the contracted product with `M_dR`; changing that generator acts through µ.
- `TauCeti.LogAdic.FiniteLeviComparison.assoc_bundle`: For an `M^c_µ-representation` V on which µ(z) acts by `z^w`, `M_HT^an×^{M^c_µ}V≅(M_dR^an×^{M^c_µ}V)⊗Ô(w)`, compatibly with tensor products and duals.

**Checks.**

- For the supplied BCGP `GSp₄` coefficient `(1,0;−1)`, transporting the opposite/dual convention recovers `ω_A(−1)` of `rationalHTLeviTorsor_associated`; the standard homology and its polarization retain their specified Tate pairings. A cocharacter sign change without coefficient transport does not suffice.

- `TauCeti.LogAdic.FiniteLeviComparison.weight_zero`: For central weight zero the cyclotomic twist is trivial.
- `TauCeti.LogAdic.FiniteLeviComparison.weight_one`: On a central weight-one character the contracted product is the associated Tate line, not an untwisted line with the same Galois action.
- `TauCeti.LogAdic.FiniteLeviComparison.change_generator`: Replacing a cyclotomic generator by u times it changes the trivialized comparison by µ(u); there is no generator-independent untwisted equality.
- `TauCeti.LogAdic.FiniteLeviComparison.graded_compatibility`: For `W∈Rep(Gᶜ)`, the isomorphism induced on associated graded bundles is `Gr_j(Ŵ_p⊗Ô)≅Gr^jW_dR⊗Ô(−j)`, the graded relation of [7.32](#section-7-32); the twist by `µ⁻¹` instead of µ would give `Ô(j)`.
- The result exported to S6 includes the central cyclotomic twist; it does not construct the tower map.

Sources: [BPC25], text after Rem. 4.4.39, p. 80; text after Rem. 4.4.39, p. 80; §4.4.8, p. 68; §4.0, p. 49.

*Needs:* `AutomorphicBundles` B3.HT.7 (`rationalHTLeviTorsor_associated`, `_tensor`, `_actions`, `_boundary`); `AutomorphicBundles` B0.3 (Hodge/opposite and dual-coefficient dictionary); [7.34](#section-7-34); [7.33](#section-7-33); [7.30](#section-7-30); `AutomorphicBundles` B0 (hodge parabolic convention); `AutomorphicBundles` B3.general (general canonical extension); [2.9](#section-2-9); [2.10](#section-2-10).

<a id="section-7-36"></a>

### 7.36 Agreement with the open-tower construction of Layer 2

Prove `TauCeti.LogAdic.hodge_type_comparison_agreement`. For 7.29's Hodge-type data with `V₀=H₁(A)=(R¹f_*)∨`, use BPC25 §4.4.8 and `AutomorphicBundles` B1 (hodge tensor realizations); DLLZ-RH (5.5.2)'s contragredient convention is transported by duality. On `S_K`, 7.30's association is 1.1–1.3's abelian tensor comparison. Consequently the two lattices (7.31), filtration (7.32), `P_HT` (7.34) and twisted Levi comparison (7.35) restrict to 2.6, 2.9 and 2.10 respectively.

Across the boundary the extension is characterized by nilpotent residues, rather than an abelian-scheme comparison.

**Checks.**

- For the modular curve, `M/Fil¹M = T_pE ⊗ Ô` with lattice filtration `0 ⊂ ω^{−1} ⊗ Ô(1) ⊂ T_pE ⊗ Ô` on `S_K`, the sequence of 2.6.
- The agreement is proved on the open Shimura variety; across the boundary only the nilpotent-residue characterization applies.

Sources: [BPC25], Rem. 4.4.39, p. 79; [CS17], §2.2, Prop. 2.2.3 and Cor. 2.2.4, pp. 14–15.

*Needs:* [7.30](#section-7-30); [7.31](#section-7-31); [7.32](#section-7-32); [7.34](#section-7-34); [7.35](#section-7-35); [1.2](#section-1-2); [2.6](#section-2-6); [2.9](#section-2-9); [2.10](#section-2-10); `AutomorphicBundles` B1 (hodge tensor realizations).

## Layer 8: Canonical local systems of Hodge-type data and logarithmic comparison

<a id="section-8-1"></a>

### 8.1 Finite-level canonical comparison package

Assemble `TauCeti.LogAdic.finite_level_canonical_package`. For neat Hodge-type data and smooth projective toroidal model with normal-crossings boundary, export the completed-logarithmic tensor association, ascending HT flag, `P_HT` and `M_HT≅M_dR×^{µ,ℤ_p×}ℤ_p(1)`, Hecke-compatibly, agreeing with Layer 2 on the open variety. PerfectoidShimuraVarieties S6 owns the toroidal-tower diamond map/coefficient pullback (BPC25 Theorem 4.4.40). The log primitive comparison (7.3) is a separate export to completed/coherent cohomology.

**Checks.**

- S6 imports the finite-level package; there is no reverse prerequisite `S6→Layer` 8.

Sources: [BPC25], §4.4.38, p. 79; text before Thm. 4.4.40, p. 80.

*Needs:* [7.30](#section-7-30); [7.35](#section-7-35); [7.33](#section-7-33); [7.34](#section-7-34); [7.36](#section-7-36); [7.3](#section-7-3).

## Downstream consumers

PerfectoidShimuraVarieties S0–S6 consumes the tower, the open Hodge–Tate morphism and the finite canonical coefficient package for Shimura data of Hodge type. OverconvergentAutomorphicForms O2–O8 uses the canonical domains, coordinates, integral lattices and AIP torsor; its O5 owns coefficient sheaves and their comparison. IgusaVarietiesAndTorsionConcentration IG.3 studies period-map fibres. TorsionCohomologyInfrastructure TC.2 and HigherHidaAndColemanTheory use the proper logarithmic primitive comparison.

## References

Locators refer to the versions named here, identified by SHA-256, and not to the different pagination of published versions where these differ.

- **FAR10.** Laurent Fargues, [*La filtration de Harder–Narasimhan des schémas en groupes finis et plats*](https://webusers.imj-prg.fr/~laurent.fargues/HNgp.pdf). J. reine angew. Math. 645 (2010), 1–39; author copy HNgp.pdf (29 pp.), whose page numbers differ from Crelle's. SHA-256 67b58427c00ea67b20bd8e9f7fcd0d90b50b4f0965e90cd95ad2324265c7637a.
- **FAR11.** Laurent Fargues, [*La filtration canonique des points de torsion des groupes p-divisibles (avec la collaboration de Yichao Tian)*](https://webusers.imj-prg.fr/~laurent.fargues/canoniqueHN.pdf). Ann. Sci. ÉNS 44 (2011), 905–961; author copy canoniqueHN.pdf dated 20 October 2011 (46 pp.). SHA-256 2424f3b23fa138b44dbf98cbad50db8be4944c6640514084fc0fb26e2a65ccd4.
- **SCH15.** Peter Scholze, [*On torsion in the cohomology of locally symmetric varieties*](https://arxiv.org/abs/1306.2070). arXiv:1306.2070v2 (2 June 2015); published Ann. of Math. 182 (2015), 945–1066 (numbering `III.x.y = 3.x.y`). SHA-256 `e15abf4e7ab3e400ecaae963e5ccd80b340919d8499ebfde5b55f2ceb83ab285`.
- **SCH13.** Peter Scholze, [*p-adic Hodge theory for rigid-analytic varieties*](https://arxiv.org/abs/1205.3463). arXiv:1205.3463v2; published Forum Math. Pi 1 (2013), e1. SHA-256 `ed9187b3269adb7e9964369470073ce8760ef56ef0c0b89538c0a1509f811959`.
- **BHW.** Christopher Birkbeck, Ben Heuer, Chris Williams, [*Overconvergent Hilbert modular forms via perfectoid modular varieties*](https://arxiv.org/abs/1902.03985). arXiv:1902.03985v4 (10 May 2021); published Ann. Inst. Fourier 73 (2023), 1709–1794 (§5/§7 statements collated with the published version). SHA-256 8ee48970dc500f60a6409cca0e6d9feeb693071da00a8b37174776717b708dac.
- **PIL20.** Vincent Pilloni, [*Higher coherent cohomology and p-adic modular forms of singular weights*](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf). Duke Math. J. 169 (2020), 1647–1807; author copy complexhidatheorygsp4.pdf (113 pp.). SHA-256 4c05724efeab1dbbb108f980ec9a722127d2a8cd2abf6e8c2a6a2251cf0f9f58.
- **PS16.** Vincent Pilloni, Benoît Stroh, [*Cohomologie cohérente et représentations galoisiennes*](https://www.imo.universite-paris-saclay.fr/~pilloni/koko.pdf). Ann. Math. Québec 40 (2016), 167–202; author copy koko.pdf (31 pp.), numbered differently from the published version. SHA-256 2c9f90c39f0efacd3fa076ef189b1d552da900d1968e34c3c8b3e551dcb4e3a1.
- **BP26.** George Boxer, Vincent Pilloni, [*Higher Hida theory for Siegel modular forms*](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf). Invent. Math. (2026); author copy higherhidaSiegel.pdf (65 pp.). SHA-256 `af70d084612b1b75761694923ef2395752d23b41e0b8b458910d096df4c8c3c6`.
- **BCGP21.** George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, [*Abelian surfaces over totally real fields are potentially modular*](https://arxiv.org/abs/1812.09269). arXiv:1812.09269v3 (28 Nov 2021); published Publ. Math. IHÉS 134 (2021). SHA-256 7c8d74b0628d8b9cc841a853372ca2d0bc18c086ab46d138f75afd15f35689ed.
- **CS17.** Ana Caraiani, Peter Scholze, [*On the generic part of the cohomology of compact unitary Shimura varieties*](https://arxiv.org/abs/1511.02418). arXiv:1511.02418v1 (8 Nov 2015); published Ann. of Math. 186 (2017), Proposition 2.3.9 collated at pp.673–674. SHA-256 `aa93df3947e57ab78b070a82d638e70c25ae2ae15aeb60346575e74fdf85b349`.
- **SW13.** Peter Scholze, Jared Weinstein, [*Moduli of p-divisible groups*](https://arxiv.org/abs/1211.6357). arXiv:1211.6357v2 (13 Apr 2013); Camb. J. Math. 1 (2013). SHA-256 984411ef6c3d735a713684d4c9251fbad411a40eab33cefed8ab5c8412b09f6d.
- **AIPH.** Fabrizio Andreatta, Adrian Iovita, Vincent Pilloni, [*The adic, cuspidal, Hilbert eigenvarieties*](https://www.imo.universite-paris-saclay.fr/~pilloni/Hilbert_adicfinal.pdf). Res. Math. Sci. 3 (2016); author copy `Hilbert_adicfinal.pdf` dated 16 May 2016 (40 pp.). SHA-256 34f517fd8d02d778f16f19745f4303b3955d48646d0ce6665b88a10f6fcdebbd.
- **AIP15.** Fabrizio Andreatta, Adrian Iovita, Vincent Pilloni, [*p-adic families of Siegel modular cuspforms*](https://arxiv.org/abs/1212.3812). arXiv:1212.3812v1 (16 Dec 2012); published Ann. of Math. 181 (2015), 623–697. SHA-256 546120d2dcbf50bc86a3b980602728c9dcebd90cc2b08528df4415ec2f7ea851.
- **HALO.** Fabrizio Andreatta, Adrian Iovita, Vincent Pilloni, [*Le halo spectral*](https://mypage.concordia.ca/mathstat/iovita/Halo_spectral.pdf). Author copy `Halo_spectral.pdf`; Appendix A. SHA-256 154459bdefa0e91b5a103ba5a78d81bcced20e67d8bb9a0fb737de22494bee27.
- **CDM12.** Peter Scholze, [*Perfectoid spaces: a survey*](https://people.mpim-bonn.mpg.de/scholze/CDM.pdf). Author copy of the 2012 Current Developments in Mathematics survey. SHA-256 85a0b85e13163d8953c25d521c7f568afcc2a67c8f192228a8608f533b5f11eb.
- **ZIE.** Paul Ziegler, [*Graded and filtered fiber functors on Tannakian categories*](https://arxiv.org/pdf/1111.1981v2). arXiv:1111.1981v2. SHA-256 7e553f590404cd31f92bf528d925755043ad4e2bb009e058a6ca39ab8d39ed40.
- **BPC25.** George Boxer, Vincent Pilloni, [*Higher Coleman theory*](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf). Author revised manuscript dated 3 March 2025, HigherColeman.pdf (180 pp.); locators refer to this version. SHA-256 `d340c9a020cc5fdbca781a8630b6fae35e14607142bed700d6ab82334faa80ae`.
- **DLLZ-adic.** Hansheng Diao, Kai-Wen Lan, Ruochuan Liu, Xinwen Zhu, [*Logarithmic adic spaces: some foundational results*](https://www.kwlan.org/articles/log-adic.pdf). Public author copy, 100 pages; arXiv:1912.09836v2 final-version record (2022-10-30); published chapter `DOI 10.1007/978-3-031-21550-6_3 (2022)`. SHA-256 209e59836048eabbbf9735012a38c7c393fb2a30f69ce50ffac7e83b37ee1105.
- **DLLZ-RH.** Hansheng Diao, Kai-Wen Lan, Ruochuan Liu, Xinwen Zhu, [*Logarithmic Riemann–Hilbert correspondences for rigid varieties*](https://www.kwlan.org/articles/log-RH.pdf). Public author copy, 80 pages; J. Amer. Math. Soc. 36 (2023), DOI 10.1090/jams/1002. SHA-256 `dccd18f6605380a92e6fa9e2143547b7cfa12ddb01b08ff5af0e083818539d04`.
- **MILNE-SV.** J. S. Milne, [*Introduction to Shimura varieties*](https://www.jmilne.org/math/xnotes/svi.pdf). Notes dated 23 October 2004, revised 16 September 2017 (numbering as in Harmonic analysis, the trace formula, and Shimura varieties, Clay Math. Proc. 4, 2005); printed page `= PDF` page. SHA-256 `f637e61735ff9cf9730c43d978d8f05185685a37d5e1920fc3347061c83d7c7e`.
- **ECD.** Peter Scholze, [*Étale cohomology of diamonds*](https://arxiv.org/abs/1709.07343v4). arXiv:1709.07343v4; printed page `= PDF` page. SHA-256 78ca42bba46f1d43c894b0dbfdfb41105efab4959ba5ba6e32e1e5cf7ef33efc.

BPC25 and BP26 are different papers of Boxer and Pilloni: BPC25 is *Higher Coleman theory* and BP26 is *Higher Hida theory for Siegel modular forms*.

Related published versions and model references:

- [Published AIF 73 (2023), 1709–1794; §5 and §7.](https://www.numdam.org/item/10.5802/aif.3560.pdf) (published, SHA-256 `d59b7f701eb5258c351d959be08d49f17946245ed1e5779317d2371981c2c5c4`)
- [Published Annals 182 (2015), 945–1066; §III.3.](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf) (published, SHA-256 `ebac854f47381c19a987b43b59d2c05cad55c3186c4d8cde067a7be0d06cbd16`)
- [Kai-Wen Lan, Integral models of toroidal compactifications with projective cone decompositions, IMRN 2017, no. 11, 3237–3280, doi:10.1093/imrn/rnw123; author compilation incorporates known errata. Definition 8.5 and Theorems 8.6–8.7.](https://www.kwlan.org/articles/cpt-ram-nbl.pdf) (author copy, SHA-256 `ff2229d32fc6dd99174d8ff392ebdf6c93c3a455118bd7d54f54a74a967d31ac`)
- [Integral models of toroidal compactifications with projective cone decompositions — Errata; author errata linked from Lan’s academic page. Item (3) adds the dimension-one boundary exception to Theorem 8.7.](https://www.kwlan.org/articles/cpt-ram-nbl-err.pdf) (author errata, SHA-256 `e0ecf94c74332660867965dc9877836ef97f2a03161c53b5f0ff1a1a7f616b04`)
- [Caraiani–Scholze, Annals 186 (2017), 649–766; Proposition 2.3.9 and proof, pp.673–674 (published formulation)](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf) (published version, SHA-256 4f9449e5ecfd8fb8b43a04acef73060f531be995babaa9f744f3db36aaa5e61a)

[FAR10]: https://webusers.imj-prg.fr/~laurent.fargues/HNgp.pdf
[SW13]: https://arxiv.org/abs/1211.6357
[AIP15]: https://arxiv.org/abs/1212.3812
[CDM12]: https://people.mpim-bonn.mpg.de/scholze/CDM.pdf
[FAR11]: https://webusers.imj-prg.fr/~laurent.fargues/canoniqueHN.pdf
[PIL20]: https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf
[BP26]: https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf
[BCGP21]: https://arxiv.org/abs/1812.09269
[SCH15]: https://arxiv.org/abs/1306.2070
[PS16]: https://www.imo.universite-paris-saclay.fr/~pilloni/koko.pdf
[CS17]: https://arxiv.org/abs/1511.02418
[SCH13]: https://arxiv.org/abs/1205.3463
[MILNE-SV]: https://www.jmilne.org/math/xnotes/svi.pdf
[ECD]: https://arxiv.org/abs/1709.07343v4
[BHW]: https://arxiv.org/abs/1902.03985
[BPC25]: https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf
[ZIE]: https://arxiv.org/pdf/1111.1981v2
[HALO]: https://mypage.concordia.ca/mathstat/iovita/Halo_spectral.pdf
[AIPH]: https://www.imo.universite-paris-saclay.fr/~pilloni/Hilbert_adicfinal.pdf
[DLLZ-RH]: https://www.kwlan.org/articles/log-RH.pdf
