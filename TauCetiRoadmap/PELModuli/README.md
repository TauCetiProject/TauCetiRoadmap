# Roadmap: Siegel and PEL moduli problems

**Summary.** This roadmap builds the moduli spaces of abelian schemes with a polarization, an
action of an order in a semisimple algebra with positive involution, and a level structure: the
PEL moduli problems of Shimura, Deligne, Kottwitz and Lan, which contain the Siegel moduli of
principally and nonprincipally polarized abelian schemes, the elliptic modular curves, the
Hilbert–Blumenthal problems and the unitary problems over CM fields. It starts from linear algebra:
positive involutions and their Albert types, orders and discriminants, symplectic lattices with an
order action, integral, rational and `p`-integral PEL data, the similitude group with its
multiplier, the polarized Hodge structure attached to a datum, signatures, the determinant
polynomial, the reflex field and the Kottwitz determinant condition, and the hermitian and
skew-hermitian language of unitary data. It then defines the relative objects — prime-to-`□`
quasi-isogenies, PEL-type abelian schemes, the finite étale pro-system of symplectic Tate trivializations,
principal and arbitrary level structures — and the integral isomorphism problem `M_H`, the rational
quasi-isogeny problem `M_H^rat` and the characteristic-zero adelic problem `M_K^ad`, with their
comparison, descent and Hecke action. It proves that `M_H` is a smooth separated algebraic stack of
finite type over the good reflex base `Spec O_{F₀,(□)}`, an algebraic space at neat level, with
universal family and Kodaira–Spencer isomorphism, and it proves properness in the division-algebra
case, the Grothendieck–Messing description of unitary deformations, the kernel-rank identities for
isogenies between unitary abelian schemes and Wedhorn's ordinariness criterion. Over `ℂ` it
identifies `M_K^ad` with the disjoint union, over `ker¹(ℚ, G)`, of the arithmetic quotients
`G^{(i)}(ℚ) ∖ (X × G(𝔸_f)/K)`, as analytic spaces and then algebraically; it shows that the generic
fibres are canonical models, compatible with level, Hecke maps and morphisms of data, builds normal
integral models at higher `p`-level and the rank-one CM moduli schemes with their torus trace. It
ends with the Siegel, Hilbert and unitary examples and the arithmetic moduli interface used by
heights and finiteness: the stacks `𝔄_g` and `𝔄_{g,d}` over `ℤ`, coarse spaces, fields of moduli,
forms and the descent obstruction, models over bounded extensions, the Hodge bundle and Hodge line,
and finiteness over finite fields.

Every object keeps its full structure. The polarization of an integral object is an actual
polarization, never only a quasi-isogeny class; the order action, the Tate twist of every pairing,
the multiplier of every level structure and the descent data of every family are retained. The
integral isomorphism problem and the rational isogeny problem have different morphisms, and their
comparison transports the lattice and the level. The determinant condition is a polynomial identity
on the base, not an equality of traces. Groups are the full, possibly disconnected, similitude
groups; a Shimura-variety name is used only when the axiom SV3 holds.

| Layer | Title | Headline targets |
| --- | --- | --- |
| M0 | Linear algebra and reflex fields | `PositiveInvolution`, `albertTypes`, `IntegralPELDatum`, `similitudeGroup`, `galoisH1`, `ker1`, `hodgeStructureOfDatum`, `reflexField`, `SatisfiesDetCondition`, `GeneralizedCMType` |
| M1 | Relative PEL families, levels and descent | `QuasiIsogeny`, `PELTriple`, `symplecticIsomSheaf`, `PrincipalLevel`, `moduliProblem`, `ratModuliProblem`, `adelicModuli`, `isoIsogenyComparison`, `effectiveDescent`, `heckeTranslate` |
| M2 | Representability and smooth good models | `rigidity`, `IsNeat`, `isomScheme_finite`, `formalSmoothness`, `representability`, `universal`, `kodairaSpencer`, `properOfDivision`, `Display`, `wedhornOrdinary` |
| M3 | Galois forms and complex uniformization | `ker1Classification`, `hasseCases`, `arithmeticQuotient_structure`, `complexPoints`, `uniformization`, `algebraization`, `typeDComparison`, `hermitianHomOfAbelianSchemes` |
| M4 | Canonical models, twists and integral level changes | `cmReciprocity`, `canonicalModel`, `twist`, `normalizedModel`, `cmModuli`, `torusTrace` |
| M5 | Siegel, Hilbert and unitary examples | `siegelIntegralDatum`, `siegelModuli`, `genusOneComparison`, `hilbertIntegralDatum`, `unitaryRationalDatum` |
| M6 | Arithmetic moduli, coarse spaces and Hodge lines | `levelForgetting_finiteEtale`, `arbitraryLevelStack`, `siegelStack`, `polarizedStackFiniteType`, `coarseModuli`, `fieldOfModuli`, `descentObstruction`, `PELModuli.hodgeLine`, `finiteFieldFiniteness` |

`Suggested.lean` states `detPoly_classifies` and `detPoly_classifies_charZero` (M0.15),
with the definition `detPoly` (M0.14), and `compatibleComplexStructures_conjugacy` (M0.11).
Other target names below specify the interfaces to build.

## Scope and ownership

**Owned here.** Positive involutions on finite-dimensional semisimple `ℚ`-algebras and their PEL Albert
types, using AbelianSchemesAndArithmeticModuli A6.15 for the general real positive-involution normal
form; star-stable enrichment of arithmetic orders, their reduced-trace discriminant and inverse
different; symplectic `O`-lattices, their dual lattice and multi-rank, with polarization type exposed from AbelianSchemesAndArithmeticModuli
A5.4(1); integral, rational and `p`-integral PEL data, their
rationalization and restriction; the similitude group `G` of a PEL datum with its multiplier, over
arbitrary base rings, its coordinate Hopf algebra and its structure over `ℚ`; bad and good primes and
the good reflex base; the polarized Hodge structure and the Shimura datum of a PEL datum; signatures;
the determinant polynomial `Det_{O|M}` and its classification theorem; the PEL reflex field and its
comparison with the Shimura reflex field; the Kottwitz determinant condition and its comparison with
the representation over a splitting field; self-dual lattices at good primes; the signature
constancy of Bijakowski–Pilloni–Stroh; hermitian and skew-hermitian spaces over CM orders, `GU`, the
norm-similitude torus `T₀` and rank-one classification; generalized CM types, their reflex fields,
the reflexive closure of a CM field and `τ`-parts at unramified primes. Prime-to-`□` quasi-isogenies
and quasi-polarizations; PEL-type abelian schemes and unitary `O_F`-abelian schemes; the pro-system of
symplectic Tate trivializations; principal and arbitrary integral and rational level structures; the
moduli problems `M_H`, `M_H^rat`, `M_K^ad`, their comparison, change of lattice and of good primes,
effective descent, Hecke action and functoriality in the datum, including the forgetful morphism to
Siegel moduli. Rigidity for PEL automorphisms from the polarized-automorphism supplier,
neat levels, finiteness of `Isom`, deformation theory, formal smoothness, effectivity, representability, the universal family, the Kodaira–Spencer
map and isomorphism, properness when `End_B(V)` is a division algebra, unitary Grothendieck–Messing
deformations, kernel ranks of isogenies of unitary abelian schemes with the perfect-field Dieudonné
length identity, Zink's displays with their polarized `O`-version and Wedhorn's ordinariness
criterion. The torsor/Galois-cohomology comparison for smooth affine groups over arbitrary fields, continuous
nonabelian Galois cohomology of the PEL group and `ker¹(ℚ, G)`, the Hasse
principle in Cases A and C, the complex points and the analytic and algebraic uniformization of
`M_K^ad`, including the full disconnected group in type D, and the hermitian space of homomorphisms
from a CM object. Reciprocity on CM points, canonical models, the twisting automorphisms of Case A
with odd rank, functoriality of canonical models, normal integral models at higher `p`-level, the
rank-one CM moduli schemes and the torus trace. The Siegel datum of every genus and polarization type,
the integral Siegel moduli `A_{g,D,n}` and their generic-fibre comparison with
ShimuraVarieties §5.0, which supplies the characteristic-zero Siegel schemes and analytic
families; the genus-one comparison with the modular curves, the principal
Hilbert datum and the unitary data with prescribed signatures, with their examples. Level-forgetting
maps, the stack at arbitrary level, the stacks `𝔄_g` and `𝔄_{g,d}` over `ℤ`, coarse moduli spaces,
fields of moduli, forms and the descent gerbe, bounded fields of definition, the descent of
universal Hodge bundles and lines, the export interface for heights and finiteness, finiteness over finite fields and
explicit nonempty examples.

**Built in Tau Ceti and cited.**

- *The Tau Ceti library.* `TauCeti.AlgebraicGeometry.AbelianVariety` with `End`, `mulBy` and
  `IsIsogeny`; the symplectic, orthogonal, general linear, roots-of-unity and constant-form group
  schemes `TauCeti.Symplectic.groupScheme`, `TauCeti.Orthogonal.groupScheme`,
  `TauCeti.GeneralLinear.groupScheme`, `TauCeti.RootsOfUnityGroup.groupScheme`,
  `TauCeti.ConstantForm.groupScheme`; compatible almost complex structures
  `TauCeti.SymplecticForm`, `TauCeti.SymplecticForm.Compatible`, `TauCeti.SymplecticForm.exists_compatible`,
  `TauCeti.AlmostComplexStructure` and `TauCeti.AlmostComplexStructure.hodgeStructure`; Hodge
  structures `TauCeti.Hodge.HodgeStructureOn`, `TauCeti.Hodge.IsPolarization`,
  `TauCeti.AlmostComplexStructure.IsRiemannForm.isPolarization` and the weight-one
  criterion `TauCeti.Hodge.isPolarization_of_weilOperator_invariant_on_realPoints_of_pos`; the dual
  lattice of a nondegenerate bilinear form `LinearMap.BilinForm.dualSubmodule_dualSubmodule_flip`;
  `Matrix.exists_smith_normal_form_of_det_ne_zero`; the symplectic multiplier identity
  `Matrix.transpose_mul_J_mul_eq_det_smul`; quadratic twists of Weierstrass curves
  `WeierstrassCurve.j_quadraticTwist` and `WeierstrassCurve.not_exists_smul_quadraticTwist_eq`.
- *TauCetiRoadmap.AdelicAlgebraicGroups.* Layer 1 (adelic points of affine groups, §1.2
  restricted-product realization, §1.3 rational points and functoriality); Layer 3, §3.4 (finite adelic class sets and arithmetic component stabilizers);
  Layer 4, §4.1 (coordinate torsors over a field and their comparison with the fppf class set
  `torsorClasses G` of SchemeAndStackFoundations §§1.15 and 2.3,
  local triviality of torsors under semisimple simply connected groups over
  nonarchimedean local fields of characteristic zero, the Hasse principle at real places for
  semisimple simply connected groups) and §4.3 (neat elements and neat levels).
- *TauCetiRoadmap.GlobalNumberFields, Layer 11.* `NumberFieldOrder` for orders in
  a number field; the PEL star-order permits noncommutative semisimple algebras.
- *TauCetiRoadmap.ReductiveGroups.* Layer 3 (subgroups, quotients and component groups) and Layer 6
  (reductive and semisimple groups, centre, derived group, simply connected groups).
- *TauCetiRoadmap.ReductiveGroupsPartII.* RG2.3.7 `Lang.lang_surjective` and finite-field
  torsor triviality; RG2.5.1 `AbsoluteRootData` with based Galois action and cocharacter lattice.
- *ArithmeticGaloisDuality.* R02.4.6, “All-place Sha duality and transfer adjunction”:
  for the finite Galois module `M = Z(G^der)(ℚ̄)`, its Cartier dual is
  `M^D = X^*(Z(G^der))`, and `Ш²(ℚ,M)` is perfectly paired with `Ш¹(ℚ,M^D)`,
  retaining the supplier's complete Tate terms at real places. M3.2 owns the
  type-A centre identification and the vanishing application.
- *TauCetiRoadmap.ClassFieldTheory, Layer 13.* The cyclic Hasse norm theorem `cyclicHasseNorm`
  and its local-everywhere export `isGlobalNorm_iff_isLocalNormEverywhere`.
- *Further Tau Ceti inputs.* `TauCeti.FieldTheory.GaloisCohomology.Hilbert90`:
  `TauCeti.hilbert90` and `TauCeti.subsingleton_H1_unitsCoeff` for continuous Hilbert 90;
  `TauCeti.Analysis.Matrix.HermitianSignature`: `Matrix.IsHermitian.signature`,
  `Matrix.IsHermitian.signature_congr`, `Matrix.IsHermitian.signature_diagonal` and
  `Matrix.IsHermitian.signature_neg` for matrix signatures;
  `TauCeti.Geometry.Symplectic.Hermitian`: `TauCeti.SymplecticForm.complexAssociatedForm`
  and `TauCeti.SymplecticForm.Compatible.hermitianCore` for the complex inner product of a compatible real pair.
  The PEL signature records the multiplicities of a coefficient-algebra representation;
  the CM-order hermitian API retains integral coefficients and first-variable linearity.
- *TauCetiRoadmap.LocalFieldsRamification, Layer 2*, and *TauCetiRoadmap.NumberFieldArithmetic.*
  Finite unramified extensions of `ℚ_p` with their integer rings, residue fields and Frobenius; the
  completions of a number field at its places.
- *TauCetiRoadmap.ModularCurves.* §0E (effective affine descent), §2E (Cartier–Nishi duality and the Weil pairing `e_N` of an
  elliptic curve), §3C (the four level structures, in particular `[Γ(N)]`), §5B (the full level
  scheme `Y_full(N)` over `ℤ[1/N]` and its fibre `Y(N, ζ)` over `ℤ[1/N, ζ_N]`), §7D (universal
  deformations of elliptic curves over `W(k)[[T]]`), §9E (the coarse `j`-line).
- *TauCetiRoadmap.ProfiniteArithmetic, Layer 0*, and *RestrictedProducts.* The ring `Ẑ` with its
  product decomposition over primes, and the restricted-product topology on adeles.

Elliptic curves themselves, their level structures and the modular curves are ModularCurves'; this
roadmap compares its genus-one Siegel moduli with them (M5.3) and never rebuilds them. The general
theory of algebraic groups, geometric torsors, strong approximation and neat subgroups is
AdelicAlgebraicGroups' and ReductiveGroups'; the PEL group is constructed here as a closed subgroup
of `GL(L) × G_m` and these theories are applied to it.

**Built in other roadmaps and cited.**

- *ClassicalArithmeticCompletion.* §7.4 `IntegralOrder.IsOrder` and `IntegralOrder.isOrder_iff`
  for orders in finite-dimensional, possibly noncommutative algebras; §7.21
  `IntegralOrder.IsMaximalOrder` and overorder inclusions; §7.49 (a common regular-trace-dual
  bound for overorders); §7.56 (containment in a maximal order when the regular-trace pairing
  is nondegenerate). Specialize to `ℤ ⊆ ℚ` for PEL orders. Generic orders and maximality
  belong to this supplier; M0.1 supplies the star-stable adapter, and M0.3 supplies the
  reduced-trace invariants and their consequences for good primes.
- *AbelianSchemesAndArithmeticModuli.* A1 (abelian schemes over arbitrary bases, rigidity,
  products, base change, relative dimension, one-dimensional abelian schemes as elliptic curves);
  A2 (the dual abelian scheme and Poincaré bundle, polarizations `Polarization` and their local
  representatives by ample line bundles `A2.6`, ample cohomology and degree `A2.4`, projective
  presentations with very ampleness of `L^n` for `n ≥ 3` in every characteristic `A2.8`); A3
  (isogenies, `[n]`, torsion, Weil pairings `polarizedWeilPairing` on `A[n]`, full level structures,
  the Rosati involution over a field `A3.9`); A4 (the integral Tate module with
  `AbelianTate.dualPairing`, the universal vector extension, `H¹_dR` with its Hodge filtration
  `A4.3`, Barsotti–Tate groups, `grothendieckMessing` with polarizations and endomorphisms `A4.7`,
  `polarizedEffectivity` `A4.8`, `serreTate` with structures `A4.9`); A5 (lattice uniformization,
  Riemann forms, the polarized Hodge equivalence, analytic families and the Siegel family,
  A5.4(1) `alternating_elementaryDivisors` for integral alternating normal form); A6
  (Rosati positivity `A6.14`, the general real positive-involution normal form
  `realRosatiDecomposition` `A6.15`, finiteness of polarized automorphisms `A6.18`, Silverberg's descent of
  homomorphisms `A6.20`, localized Hom and coefficient Hom `A6.26`–`A6.27`, the Hodge bundle, its determinant line, base change, product and
  analytic transition factor for an abelian scheme, A6.38).
- *AlgebraicModuliForArithmeticGeometry.* Layer 2 (Hilbert families, Hom and Isom schemes
  `homAndIsomSchemes`, `automorphismGroupScheme`); Layer 3 (fpqc descent
  `fpqcQuasicoherentDescent`, `spaceFpqcQuasicoherentDescent`, polarized descent
  `ModuliDescent.polarizedDescentComparison`, §3.5); Layer 4 (gerbes, bands and neutralizations); Layer 5 (rigidification, levels and quotient recovery
  `levelRemovalQuotient`, finite correspondences `coarse_finite`, normalization); Layer 7 (Artin's
  criteria `artin_space_criterion`, `artin_stack_criterion`, rigidification of invertible sheaves
  `rigidification_gm_torsor`, `sectionRigidifiedPicard`);
  Layer 8 (framed deformation functors `FramedDeformation` and versality
  `familyVersalAt_completion_iff`).
- *SchemeAndStackFoundations.* §§1.1–1.2 (fpqc/fppf descent), §§1.4–1.11 (algebraic
  spaces and their étale presentations), §1.18 (`StackInGroupoids`, `Stack.stackification`,
  two-fibre products), §1.19 (`IsAlgebraicStack`, `IsDeligneMumford`), §1.21
  (`Stack.quotient`, quotient stacks), §1.23 (`FineModuliSpace`, `IsCoarseModuliSpace`,
  `keel_mori`); §§0.20–0.21 (Nagata and excellent schemes), Layer 2 (sheaf and
  quasi-coherent cohomology), §3.8 (invariant differentials), §§4.1–4.4 (formal smoothness,
  `schlessinger_hull`, `schlessinger_prorepresentable`), §4.10 (Grothendieck existence),
  §4.14 (`hilbert_quot_schemes`). General polarized descent is the
  AlgebraicModuliForArithmeticGeometry §3.5 contract above.
- *ComplexComparisonPartII.* §C−1.1 (`ComplexAnalyticSpace`, `complexSchemeAnalytification`
  and `complexSchemeAnalytification.etaleLocalIso`), §C−1.2
  (`completedAnalyticStalkComparison`), §C−1.3 (`SpaceAnalytification`,
  `complex_local_comparison`), §C0.4 (`coherentAnalytification_faithful`). These are the
  analytic spaces with their local ring sheaves, including nilpotents; algebraic spaces
  are locally separated and locally of finite type over `ℂ`.
- *AbelianSchemesAndArithmeticModuli, §A4.CR.7.2.* The crystalline Dieudonné crystal
  of a Barsotti–Tate group over a `p`-nilpotent base, its variance, Tate twists and
  evaluation on PD thickenings. Its crystalline sites are CrystallineCohomology Layer CR.1.
- *FiniteFlatGroupsAndIntegralPadicHodgeTheory, R07.2.* Dieudonné theory of finite group schemes
  and `p`-divisible groups over perfect fields, lengths and heights, the covariant Dieudonné module;
  R07.2.15–R07.2.16 supply Dieudonné–Manin slopes and `slopeSequence`, and R07.2.20 fixes
  `M_cov(G) = M_contra(Gᴰ)`. The PEL Newton point with coefficient action and pairing, the
  covariant cocharacter adapter and its Galois average are constructed in M2.16 using `F`,
  with slopes `0` on multiplicative groups and `1` on étale groups.
- *NeronModelsAndSemistableAbelianVarieties.* R11.1 §§1.5 and 1.8 (extension of homomorphisms;
  abelian schemes are their own Néron models); R11.3 §3.10 (potential semistability,
  with the toric part and its character group in Layer 3); R11.5 §§5.1–5.2
  (`NeronOggShafarevich` over excellent henselian discrete valuation rings and
  good-reduction descent from the henselization).
- *EtaleCohomologyFoundations.* §F.0.2 `VanishingCycles.finiteEtaleGaloisCategory` (finite étale
  schemes, continuous fundamental-group actions and basepoint transport); §F.2.5 (compactly supported cohomology), §0.11
  (`ClassicalAlgebraic.smoothTrace`), §§F.5–F.6 (duality and smooth purity), and
  §§F.4.1–F.4.6 (integral and rational adic realization). The torsion coefficient
  exponent and the adic residue characteristic are invertible on the schemes.
- *ShimuraVarieties.* §P.1 (`TauCeti.Shimura.PureDatum`, morphisms, Hodge type, special
  pairs and points), §P.2 (Hermitian components), §P.3 (cocharacter conjugacy classes
  and their reflex fields), §P.4 (levels, the genus-`g` Siegel datum for `g ≥ 1`, and
  the terminal genus-zero datum); §P.5 `TauCeti.Shimura.real_approximation_tori`
  (real approximation for connected `ℚ`-algebraic groups). Layers 0–1 supply arithmetic components and the
  complex analytic tower; §2.7 supplies Baily–Borel algebraization and §3.2 Borel
  algebraicity. §§4.1–4.4 supply `geometricArtin`, reflex norms and `CanonicalModel`;
  §4.12 supplies `CanonicalModel.unique_iso`. §5.0 supplies rational polarized Siegel
  charts `TauCeti.Shimura.rational_siegel_moduli` and their complex uniformization
  `TauCeti.Shimura.siegel_moduli_uniformization`; §5.1 supplies rank-one CM types and their
  reflex fields; §§5.10–5.11 supply `main_cm` and `cm_polarization_level`;
  §§6.1–6.2 supply `hodge_inheritance` and `hodge_canonical`. §§8.11–8.13 fix the
  determinant, fixed-pairing and row-basis conventions. These contracts use connected
  groups and SV3; M3.3 supplies the adapter for general PEL quotients. The integral
  Hilbert datum, its rational trace embedding and the unitary PEL data are constructed
  here in M5.4–M5.5.

**Not here.** Toroidal and minimal compactifications of `M_H`, the integral quasi-projectivity of
`M_H` at neat level over `Spec O_{F₀,(□)}` that follows from them, and the ampleness of the Hodge line
on the minimal compactification are ShimuraCompactifications', which builds on this roadmap; nothing
here uses them, since every construction below is made on algebraic spaces and stacks. Hilbert
modular varieties with nonprincipal polarization modules, their Deligne–Pappas models at ramified
primes and Shimura curves are HilbertModularVarietiesAndShimuraCurves'; the principal Hilbert datum
of M5.4 is the example they specialize. Igusa varieties, Newton strata beyond the ordinary locus and
perfectoid towers are IgusaVarietiesAndTorsionConcentration's and PerfectoidShimuraVarieties'.
Shimura varieties of Hodge and abelian type that are not of PEL type, and general canonical-model
theory, are ShimuraVarieties'. Heights of abelian varieties and Faltings' finiteness theorems consume
the export of M6.10.

## Conventions

- **Algebras and involutions.** `B` is a finite-dimensional semisimple `ℚ`-algebra, `*` a
  `ℚ`-linear anti-automorphism of order dividing two. Positivity means `Trd_{B/ℚ}(x x*) > 0` for
  `x ≠ 0`, with the reduced trace `Trd` taken factorwise through the centre. `F` is the centre of
  `B`, a product of number fields, and `F₀ = F^{*=1}` is a product of totally real fields.
  On each simple factor its centre is totally real with trivial involution, or CM with conjugation;
  statements using a field `F` or `F₀` are read on one simple factor. (The letter `F₀` is also used for the reflex field of a datum below; the context fixes
  which, and the reflex field is always written as a subfield of `ℂ`.)
- **Lattices and pairings.** An order `O ⊆ B` is a subring, finitely generated over `ℤ` and spanning
  `B`. A symplectic `O`-lattice is a finite free `ℤ`-module `L` with an `O`-action and an alternating
  pairing `⟨·,·⟩ : L × L → ℤ(1)`, nondegenerate over `ℚ`, with `⟨bx, y⟩ = ⟨x, b*y⟩`. Here
  `ℤ(1) = ker(exp : ℂ → ℂ^×) = 2π√−1·ℤ`; choosing `√−1` identifies `ℤ(1)` with `ℤ`, and nothing below
  depends on the choice. The dual lattice `L^#` is computed in `ℚ ⊗ L` with this pairing.
- **Positivity sign.** Write `φ = ⟨·,·⟩` for the Tate-valued form and `ψ = φ/(2π√−1)` for its
  scalar-valued counterpart. The complex structure `J = h(√−1)` makes `ψ(x, Jy)` symmetric and
  positive definite, equivalently `(1/√−1)φ(x, Jy) = 2πψ(x, Jy)` is positive definite.
  With the standard symplectic basis `e_i, f_i`, `ψ(e_i, f_i) = 1`, the Gram matrix
  is `−J_std` for Mathlib's `Matrix.J`, and `J e_i = f_i`, `J f_i = −e_i`. Tau Ceti's weight-one Hodge
  carrier tests `Q(Jx, x) > 0`; the PEL test `ψ(x, Jx) > 0` is converted to it with `Q = −ψ`. The
  Riemann-form convention of AbelianSchemesAndArithmeticModuli A5 is `E(Jx, x) > 0`, so its input is
  `E = −ψ` (and `E = −ε(h′)q_g ψ` on the full real orbit, M3.5).
- **Hodge types.** Homological convention: `V = L ⊗ ℚ` has Hodge type `{(−1,0),(0,−1)}` with
  `V^{−1,0} = V₀ := {v ∈ V ⊗ ℂ : h(z)v = zv}`, the `+√−1`-eigenspace of `J`. Over `ℂ`, `V₀` is
  `Lie A`. Kottwitz writes the same datum with `h⁻¹`; Deligne's conventions are used throughout and
  every translation is recorded at the target that needs it.
- **Good primes.** `□` is a set of primes; `ℤ_(□)` inverts the integers prime to every element of `□`;
  `Ẑ^□ = ∏_{ℓ ∉ □} ℤ_ℓ` and `𝔸^{∞,□} = Ẑ^□ ⊗ ℚ`. At level `n` the bad-prime integer is
  `n · I_bad · Disc · [L^# : L]`, with `I_bad = 2` exactly when a type D factor occurs.
  Every congruence level `n` is a positive integer with no prime divisor in `□`;
  this is the range of all uses of `U^□(n)`, `principalCongruence` and
  `completedPrincipalCongruence`. The good
  reflex base is `S₀ = Spec O_{F₀,(□)}` for the reflex field `F₀` (`S₀ = Spec F₀` when `□ = ∅`).
- **Determinant condition.** For a locally free module `M` with `O`-action over a base `S`,
  `Det_{O|M}` is the determinant of the generic element of `O` on `M`, a polynomial in the
  coordinates of a basis of `O`. The determinant condition is the equality of `Det_{O|Lie}` with the
  image of `Det_{O|V₀}` in `Γ(S, O_S)[O^∨]`; on nonreduced bases and in positive characteristic it is
  not implied by equality of traces.
- **Levels and Hecke operators.** A level structure is an orbit of `O`-linear symplectic similitudes
  `L ⊗ Ẑ^□ ≅ T^□A` or `V ⊗ 𝔸^{∞,□} ≅ V^□A` together with their multiplier `Ẑ^□(1) ≅ T^□G_m`. Hecke
  operators act on the right by precomposition: translation by `h` and then by `g` sends `α` to
  `α ∘ h ∘ g`, so it is translation by `hg`.
- **Rational forms and uniformization.** Complex uniformization uses the full similitude group and
  the union over the classes of `ker¹(ℚ, G)`. On the full real orbit `X` of `h` the Riemann form is
  `E = −ε(h′) q_g ψ`: the sign `ε(h′) ∈ {±1}` makes `E(h′(√−1)x, x) > 0` for `x ≠ 0`, and the positive
  rational `q_g` makes `q_g c(g)` a unit of `Ẑ` on the chosen lattice. For `γ ∈ G(ℚ)`,
  `ε(γh′) = sign(c(γ)) ε(h′)` and `q_{γg} = q_g/|c(γ)|`, so the family is `G(ℚ)`-equivariant.
- **SV3.** A Shimura-datum or canonical-model statement additionally requires that the projection
  of `h` to every `ℚ`-simple factor of `G^ad` be nontrivial and that `G` be connected. A rank-one
  definite torus satisfies SV3 vacuously; a wholly definite unitary factor of rank at least two does
  not. The arithmetic quotient and its family are constructed without SV3.
- **CM fields.** For a CM field `F` the reflexive closure is `F` joined with the intersection of the
  reflex fields of all rank-one CM types of `F` (the published definition of
  Liu–Tian–Xiao–Zhang–Zhu); the composite of `F` with all those reflex fields is a different field,
  the Galois closure. The rank-one CM moduli scheme lives over the integers of the reflex field of the
  selected CM type, localized at `p`, not over the reflexive closure.
- **Stacks.** Moduli problems are categories fibred in groupoids over schemes over `S₀`. The functor
  of isomorphism classes is a different object, used only where objects have no automorphisms. A
  rational point of a coarse space and an object over that field are related through the gerbe of
  M6.7; a family exists only when that gerbe is neutral.
- **Hodge bundle.** `ω_{A/S} = e^*Ω¹_{A/S}`, the Hodge line `ω̄_{A/S} = det ω_{A/S}`.

## Exact supplier contracts

### From Mathlib at `6b7abb3`

`StarRing`, `IsSemisimpleRing` with `IsSemisimpleRing.exists_algEquiv_pi_matrix_divisionRing`
(Wedderburn–Artin), `Algebra.trace`, `Algebra.discr`, `NumberField.discr`, `Algebra.IsSeparable`,
`LinearMap.BilinForm.IsAlt`, `LinearMap.BilinForm.Nondegenerate`, `LinearMap.BilinForm.dualSubmodule`,
`LinearMap.IsAdjointPair`, `Submodule.IsLattice`, `LinearMap.charpoly` with
`LinearMap.charpoly_baseChange`, `LinearMap.polyCharpoly` with `LinearMap.polyCharpoly_baseChange`
and `LinearMap.polyCharpoly_map_eq_charpoly` (the generic characteristic polynomial of a family of
endomorphisms), `Matrix.J` with `Matrix.J_squared`, `Matrix.unitaryGroup`, `NumberField.IsCMField` with
`NumberField.IsCMField.complexConj`, `NumberField.IsTotallyReal`, `NumberField.maximalRealSubfield`,
`NumberField.ComplexEmbedding.conjugate`, `IntermediateField.fixedField`,
`IntermediateField.normalClosure`, `FractionalIdeal.dual`, `IsDedekindDomain.FiniteAdeleRing`,
`UpperHalfPlane`, `Algebra.FormallySmooth`, `AlgebraicGeometry.Scheme` with
`Scheme.etaleTopology` and `Scheme.fppfTopology`, the morphism properties `Smooth`, `Etale`, `Flat`,
`IsFinite`, `IsSeparated`, `LocallyOfFinitePresentation`, the relative normalization
`Scheme.Hom.normalization` with `Scheme.Hom.normalizationDesc`, `CategoryTheory.Functor.IsFibered`,
`CategoryTheory.Pseudofunctor.IsStack`, `CategoryTheory.PresheafOfGroups.H1`,
`WeierstrassCurve.ofJ` with `WeierstrassCurve.ofJ_j`. Each is used with the hypotheses its Mathlib
statement has; where the roadmap needs a different generality the target says so.

### From Tau Ceti at `a91d3aa`

The declarations listed under *Built in Tau Ceti and cited*. Two conventions are imported with them:
`TauCeti.Symplectic.groupScheme ℤ g` is the isometry group of the form with Gram matrix `Matrix.J`
over `ℤ` after the standard block-basis reindexing, so the principal PEL Siegel form (Gram matrix `−J`) has the same isometry group, and
`TauCeti.AlmostComplexStructure.hodgeStructure` is the weight-one structure on the real carrier
with Weil operator `J`. The homological structure on `V` is supplied by
AbelianSchemesAndArithmeticModuli A5.2 `RiemannForm.homological` with `E = −ψ`, as in M0.11;
its cohomological dual lives on `V∨`. The real complex structure of an integral datum uses
`TauCeti.AlmostComplexStructure` directly, including its `square_neg` law; it
does not introduce another complex-structure carrier. The Siegel complex-structure
matrix is Mathlib's `Matrix.J (Fin g) ℝ`, with square identity `Matrix.J_squared`.
Double duality of the underlying alternating lattice is the supplied
`LinearMap.BilinForm.dualSubmodule_dualSubmodule_flip`; no separate PEL
double-duality theorem is required.

### From the supplier roadmaps

Each layer's `Dependencies` paragraph lists the layers it consumes; the contracts are the statements
named in *Built in other roadmaps and cited*, with these precise readings:

- AbelianSchemesAndArithmeticModuli A2.6 represents a polarization by an ample line bundle fppf
  locally on the base, and étale locally when `2` is invertible; descent arguments below use the
  fppf form. A2.4 gives `h⁰(L) = χ(L) = c₁(L)^g/g!` for ample `L` on an abelian variety, hence
  `h⁰(L³) = 3^g d` when `χ(L) = d`. A4.1 identifies `T(A^∨)` with `Hom(T A, ℤ̂(1))`; composed with
  `T(λ)` it gives the `λ`-Weil pairing `e^λ` on Tate modules, which M1.4 uses. Here a lisse Tate
  module means the inverse system of finite étale torsion schemes, with geometric fibre obtained
  by taking their fibres first and then their profinite inverse limit. Pullback is termwise.
  The source coefficients in M1.4 are the pro-constant systems `(L/nL)_S` and `((ℤ/n)(1))_S`.
- AbelianSchemesAndArithmeticModuli A6.15 `realRosatiDecomposition` supplies the general normal form
  for any finite-dimensional real algebra with a real-linear involution and a cyclic,
  involution-invariant real linear trace `t` satisfying `t(x x*) > 0` for `x ≠ 0`: a finite product
  of real, complex and quaternionic matrix algebras with their standard adjoints. M0.1 supplies
  these hypotheses for `B ⊗ ℝ` with the regular trace. M0.2 derives the rational-centre
  consequences, the PEL A/C/D labels, their constancy and the classical-group comparisons.
- AlgebraicModuliForArithmeticGeometry Layer 2 represents `Hom` and `Isom` of projective flat
  families by disjoint unions of quasi-projective schemes; finiteness of the PEL `Isom` scheme is
  proved in M2.4, not imported.
- EtaleCohomologyFoundations §F.0.2 identifies finite étale schemes over a connected nonempty
  locally noetherian scheme with finite continuous `π₁`-sets. Applying its fibre functor termwise
  to the systems in M1.4 gives their profinite fibres and monodromy; invariant finite subsets
  and their orbit sets give ordinary finite étale sheaves. Basepoint comparisons retain the
  chosen path, while invariant orbit sets are independent as in M1.6.
- AlgebraicModuliForArithmeticGeometry Layer 7 states Artin's criterion over a locally Noetherian
  base whose local rings are G-rings; `O_{F₀,(□)}` is excellent. The openness-of-versality input in
  the form needed for PEL problems is proved in M2.8.
- SchemeAndStackFoundations §§1.19 and 1.23 supply algebraic and Deligne–Mumford stacks and the Keel–Mori
  coarse space; AlgebraicModuliForArithmeticGeometry Layer 5 supplies quotient recovery for rigid
  levels and finite group quotients.
- ShimuraVarieties Layers 0–3 are stated for Shimura data with `G` connected. The PEL arithmetic quotients
  for disconnected `G` or when SV3 fails reduce to their connected-component statements by M3.3.

## How to read the build

Section numbers group interfaces by subject. Within M0 the dependency order is:

1. Build the datum carriers and underlying lattice/group constructions independently of their
   Hodge, signature and reflex-field adapters. Build the primitive generalized-CM-type predicate,
   its positive imaginary cone and type-reflex field (M0.25), then the split `τ`-decomposition
   (M0.27). These primitive constructions use neither signatures nor the PEL reflex field.
2. Build the Hodge decomposition (M0.11), signatures (M0.13), determinant polynomial and module
   classification (M0.14–M0.15), and PEL reflex field (M0.16). Then compare the generalized-CM-type
   and PEL signatures/reflex fields in M0.25. The `signatureType` adapter uses only the primitive
   conjugate-pair predicate. Construct `goodBase` (M0.10) after M0.16; its bad-prime integer and
   prime predicates need only the underlying order and lattice.
3. Build M0.18's linear unitary rank criterion from the split idempotents of M0.27; M1.3 applies
   that criterion to `Lie A`. No relative abelian-scheme construction is an input to M0.18.

In M6 build forms and the descent gerbe (M6.7) before field-of-moduli descent (M6.6).

M0 is linear algebra over `ℚ`, `ℤ`, `ℤ_p` and `ℝ`: it fixes every convention (sign, twist,
multiplier, determinant, reflex field) that the moduli problems use, and its examples compute each
invariant for the Siegel, Hilbert and unitary data. M1 defines the relative objects and the three
moduli problems, compares them, proves descent and constructs the Hecke action; nothing in M1 needs
representability. M2 proves that `M_H` is algebraic, smooth over the good reflex base and separated,
constructs the universal family, the Kodaira–Spencer isomorphism and the local `p`-adic theory
(unitary deformations, kernel ranks, displays and Wedhorn's criterion). M3 classifies rational forms
by `ker¹(ℚ, G)` and identifies the complex fibre with arithmetic quotients, first analytically and
then algebraically. M4 descends that identification to the reflex field (canonical models) and
builds the integral models at higher `p`-level and the CM moduli schemes. M5 instantiates everything
for the Siegel, Hilbert and unitary data and is the place to test conventions. M6 is the arithmetic
interface: stacks at arbitrary level and over `ℤ`, coarse spaces, fields of moduli, forms and the
descent gerbe, the Hodge line and finiteness; it uses M1–M2 and not M3–M5.

## Layer M0: Linear algebra and reflex fields

M0 constructs the involution, order, lattice and complex-structure data, the group, the Hodge
structure, the determinant polynomial and the reflex field, and fixes the unitary vocabulary. Integral
group points exist over every base ring, including nonflat ones; uniqueness of the multiplier needs
flatness and a nonzero lattice. The Shimura-datum adapter needs connectedness and SV3.

### M0.1 Positive involutions

Define `PositiveInvolution B` for a finite-dimensional semisimple `ℚ`-algebra `B` with a
`ℚ`-linear involution `x ↦ x*` (`(xy)* = y*x*`, `x** = x`): the condition `Trd_{B/ℚ}(x x*) > 0` for
every nonzero `x ∈ B`, where `Trd_{B/ℚ}` is the sum over the simple factors `B_i` with centre `F_i`
of `Tr_{F_i/ℚ}` composed with the reduced trace of `B_i` over `F_i` (computed through
`IsSemisimpleRing.exists_algEquiv_pi_matrix_divisionRing`, retaining each factor's degree). Define
`StarOrder`: an `O : Subalgebra ℤ B` with ClassicalArithmeticCompletion §7.4's
`IntegralOrder.IsOrder O` and `O* = O`; it inherits the involution. The forgetful carrier
`StarOrder.toSubalgebra` retains `O`, and `StarOrder.toSubring` is its underlying subring.
The order condition is `Submodule.IsLattice ℚ O.toSubmodule`, exactly the supplier's
defining condition.
Prove `StarOrder.orderEquiv`, the canonical equivalence with the subtype of pairs consisting
of a `ℤ`-subalgebra and proofs that it is an `IntegralOrder.IsOrder` and is star-stable.
Both directions retain the same carrier; proof irrelevance gives the inverse identities.
Thus inclusions are inclusions of the underlying subalgebras, and extension to `ℤ_(p)` or `ℤ_p`
uses their scalar-extension images. These identifications commute with forgetting the star
structure. Every use of an overorder or maximality uses the supplier's `IntegralOrder.IsOrder`
and `IntegralOrder.IsMaximalOrder`, including for overorders without an involution
(Lan, Definitions 1.1.1.2–1.1.1.4, pp. 2–3, and §1.2.1, p. 45).
The API is `PositiveInvolution.trd_mul_star_pos` (the defining
inequality); `PositiveInvolution.iff_trace_pos` (positivity for `Trd` is equivalent to positivity
for the unreduced trace `Tr_{B/ℚ}` of left multiplication, which is a positive multiple of `Trd` on
each simple factor); `PositiveInvolution.iff_real` (equivalently the `ℝ`-linear extension is
positive on `B ⊗ ℝ`); `PositiveInvolution.ofStarRing` (a positive involution is a `StarRing`
structure with `(qx)* = q x*` for `q ∈ ℚ`, and conversely a `StarRing` structure satisfying the
inequality is one); `PositiveInvolution.center_stable` (it preserves the centre);
`PositiveInvolution.centralIdempotent_fixed` (every central idempotent is fixed);
`PositiveInvolution.center_classification` (if `B` is simple and a number field `F` is identified
with its centre, `F` is totally real or CM); `PositiveInvolution.fixedCenter_totallyReal` (the fixed
centre `F₀` of a simple `B` is totally real). Positivity on `B` extends to `B ⊗ ℝ` by density and
positive definiteness: density first gives positive semidefiniteness; a nonzero
radical of this rational quadratic form would contain a nonzero rational vector,
contradicting strict positivity. Classification of finite-dimensional star-algebras uses
the stated semisimplicity hypothesis (Milne, *Introduction to Shimura varieties*, Proposition 8.10 and
Definition 8.11, pp. 84–85); the PEL data start from such a pair (Lan, *Arithmetic compactifications
of PEL-type Shimura varieties*, thesis, §1.2.1, p. 45; Kottwitz, *Points on some Shimura varieties
over finite fields*, §5, p. 389). Positivity fixes central idempotents, and on each simple centre it
induces the identity of a totally real field or the conjugation of a CM field. *Needs:* Mathlib
`StarRing`, `IsSemisimpleRing`, `IsSemisimpleRing.exists_algEquiv_pi_matrix_divisionRing`,
`Algebra.trace`, `Submodule.IsLattice`; ClassicalArithmeticCompletion §7.4.

**Checks.**

- `positiveInvolution_rat`: on `B = ℚ` with the identity, `Trd(x·x) = x² > 0` for `x ≠ 0`.
- `positiveInvolution_transpose`: on `M_n(ℚ)` with `x* = xᵀ`, `Trd(x xᵀ) = Σ_{i,j} x_{ij}² > 0` for
  `x ≠ 0`.
- `not_positiveInvolution_adjugate`: on `M_2(ℚ)` with `x* = adj(x)`, `x x* = det(x)·1`, so
  `Trd(x x*) = 2 det x = −2` at `x = diag(1, −1)`, and the unreduced
  trace of left multiplication is `−4`; the canonical involution is not positive.
- Integer order: the integer order in `ℚ` contains `2` and excludes `1/2`;
  `StarOrder.orderEquiv` gives the supplier's scalar order with the identity involution.
- Nonmaximal order: `ℤ[2i] ⊆ ℚ(i)` is conjugation-stable and spans the field;
  its forgetful image is an `IntegralOrder.IsOrder` but not an `IntegralOrder.IsMaximalOrder`.
- Nonintegral subring: the whole subring `ℚ ⊆ ℚ` spans and is star-stable but
  is not finitely generated over `ℤ`, so it is not a star-order.
- `starOrder_matrix_adapter`: transposition makes `M₂(ℤ) ⊆ M₂(ℚ)` a star-order;
  `StarOrder.orderEquiv` retains its noncommutative carrier and the standard matrix units.
  The inclusion `ℤ[2i] ⊆ ℤ[i]` likewise retains index `2`, and becomes equality over `ℤ_(p)`
  for odd `p` after forgetting either star-order.
- `not_positiveInvolution_id_imaginary`: on `ℚ(i)` the identity is not positive (`Trd(i·i) = −2`),
  while complex conjugation is (`Trd(x x̄) = 2|x|²`).

### M0.2 The Albert types A, C and D

Prove `albertTypes`. Let `(B, *)` be a finite-dimensional semisimple `ℚ`-algebra with positive
involution, centre `F` and `F₀ = F^{*=1}`. Then `*` preserves each simple factor `B_[τ]`. For each
real embedding `τ : F₀ → ℝ` of a simple factor, the real algebra with involution
`B ⊗_{F₀,τ} ℝ` is isomorphic, compatibly with the involutions, to
exactly one of `M_k(ℝ)` with `x ↦ xᵀ` (type C), `M_k(ℍ)` with `x ↦ x̄ᵀ` (type D) and `M_k(ℂ)` with
`x ↦ x̄ᵀ` (type A, an involution of the second kind). The type is constant on each simple factor.
Put `I_bad = 2` if some factor has type D and `I_bad = 1` otherwise. When `B` is simple, `*` is of the
second kind exactly in type A, and the simple factors of `G^ad_ℂ` for the similitude group (M0.7) of
any PEL datum over `(B, *)` have the corresponding classical group form, with the
usual small-rank exceptions: `SO₂` is a torus and `SO₄` has two type-`A₁` factors. Apply
AbelianSchemesAndArithmeticModuli A6.15 `realRosatiDecomposition` to `B ⊗ ℝ` with its regular trace:
M0.1 gives real positivity and the regular/reduced-trace comparison; cyclicity and invariance under
the involution give the supplier's remaining trace hypotheses (Milne, Proposition 8.10, p. 84).
This imports the real matrix normal form. Stability of the simple factors (Lan, Lemma 1.2.1.11)
and the rational-centre classification give totally real `F₀` and `F = F₀` or a CM extension
(Kottwitz, §5, p. 391). Derive the PEL labels, their constancy and `I_bad` from that normal form
(Lan, Definitions 1.2.1.15 and 1.2.1.17, pp. 53–54).
The Dynkin types of `G^ad_ℂ` come from `G₁ ⊗ ℂ`, a product of `GL_n`, `Sp_{2n}` or `O_{2n}` (Kottwitz,
§5, p. 391). *Needs:* M0.1; AbelianSchemesAndArithmeticModuli A6.15 `realRosatiDecomposition`;
Mathlib `IsSemisimpleRing.exists_algEquiv_pi_matrix_divisionRing`,
`NumberField.IsTotallyReal`, `NumberField.IsCMField`.

**Checks.**

- `albertTypes_rat`: `B = ℚ` has type C and `I_bad = 1`.
- `albertTypes_imagQuad`: an imaginary quadratic field with complex conjugation has type A.
- `albertTypes_definiteQuaternion`: a definite quaternion algebra over `ℚ` with its canonical
  involution has type D (`B ⊗ ℝ ≅ ℍ`) and `I_bad = 2`.
- `albertTypes_indefiniteQuaternion`: an indefinite quaternion algebra with the positive involution
  `x ↦ t⁻¹ x̄ t` (for suitable `t` with `t̄ = −t`) has type C. Thus a quaternion algebra need not
  give type D: an indefinite quaternion algebra with a positive involution gives type C.
- Swapping the factors of `ℚ × ℚ` gives `x x* = 0` at `x = (1,0)`, violating strict positivity;
  semisimplicity alone does not supply the normal-form hypothesis.

### M0.3 Orders, discriminant and unramified primes

Use ClassicalArithmeticCompletion §§7.4 and 7.21 for orders, overorders and maximality,
through M0.1's forgetful interface. No star-stability is imposed on a generic overorder.
Number-field orders agree with the GlobalNumberFields Layer 11 supplier `NumberFieldOrder`;
their completions and discriminants are the NumberFieldArithmetic and Mathlib suppliers.

Define `Order.disc` for a full order `O` in a finite-dimensional semisimple `ℚ`-algebra `B` with an
indexed `ℤ`-basis `(e_i)`: the signed determinant `det(Trd(e_i e_j))` in `ℚ`. The discriminant ideal
`Disc_{O/ℤ}` is the ideal of `ℤ` it generates; it is generated by the determinants of all
`m`-tuples of elements of `O`, `m = dim_ℚ B`, and a change of integral basis multiplies the
determinant by the square of a unit. The inverse different is `Diff⁻¹ = {x ∈ B : Trd(xO) ⊆ ℤ}`. The
API is `Order.disc_eq_det_basis` (the ideal is generated by the Gram determinant of any integral
basis); `Order.disc_eq_index_diffInv` (the positive generator is the index `[Diff⁻¹ : O]`, computed
with `LinearMap.BilinForm.dualSubmodule` and Smith normal form);
`Order.maximality_of_not_dvd_disc` (if `p ∤ Disc` then `p` does not divide `[O′ : O]` for any full
overorder `O′`, not necessarily star-stable, so `O ⊗ ℤ_(p)` satisfies
`IntegralOrder.IsMaximalOrder`);
`Order.matrixOrder_of_not_dvd_disc` (if `p ∤ Disc`, `O ⊗ ℤ_p` is a product of matrix algebras over the
integer rings of finite unramified extensions of `ℚ_p`, and `B ⊗ ℚ_p` the corresponding product of
matrix algebras; in particular `p` is unramified in `B` and in its centre);
`Order.disc_numberField` (for `B = F` a number field and `O = O_F`, the Gram determinant is
`NumberField.discr F`); `Order.map_star` (a star-order restricts the involution); and
`Order.inverseDifferent_star` (the inverse different of a star-order is star-stable). The discriminant
uses reduced traces (Lan, Definition 1.1.1.6, p. 4); the consequences of `p ∤ Disc` are Lan,
Proposition 1.1.1.17 and its proof, pp. 7–8: the trace pairing is perfect at `p`, which forces
maximality, and a maximal order in a product of matrix algebras over unramified local fields is a
product of matrix orders. The supplier's maximal-overorder existence theorem applies because
the regular-trace pairing of a semisimple `ℚ`-algebra is nondegenerate: on each simple factor
of degree `n_i` over its centre it is `n_i` times the reduced-trace pairing, followed by the
field trace to `ℚ`. All `n_i` are nonzero in `ℚ`. This comparison supplies that hypothesis,
but does not identify the two integral trace-duals or discriminants.
*Needs:* M0.1; ClassicalArithmeticCompletion §§7.4, 7.21, 7.49 and 7.56;
Mathlib `Algebra.discr`, `NumberField.discr`,
`IsSemisimpleRing.exists_algEquiv_pi_matrix_divisionRing`, `LinearMap.BilinForm.dualSubmodule`; Tau
Ceti `Matrix.exists_smith_normal_form_of_det_ne_zero`; LocalFieldsRamification Layer 2 (unramified
extensions, integer rings, residue fields); NumberFieldArithmetic (completions).

**Checks.**

- `Order.disc_numberField_quadratic`: for the basis `(1, i)` of `ℤ[i]`, the Gram matrix is
  `diag(2, −2)`, determinant `−4`, ideal `4ℤ`.
- `Order.disc_matrix`: for the matrix-unit basis of `M_n(ℤ)`, `Trd(E_{ij}E_{kl}) = δ_{jk}δ_{il}`, the
  Gram matrix is the permutation matrix of `(ij) ↦ (ji)`, and its determinant is
  `(−1)^{n(n−1)/2}`; the ideal is `ℤ` and every prime is unramified.
- `Order.disc_regularTrace_matrix`: on `M₂(ℚ)`, the regular trace is twice the reduced trace.
  On the matrix-unit basis of `M₂(ℤ)` their Gram determinants are `−16` and `−1`, respectively;
  their trace-duals are `(1/2)M₂(ℤ)` and `M₂(ℤ)`. The prime `2` remains a good order prime,
  although it divides the regular-trace discriminant.
- `Order.disc_nonmaximal`: for the basis `(1, 2i)` of `ℤ[2i]` the Gram determinant is `−16`; the order
  is not maximal at `2`.
- `Order.disc_quaternion`: a maximal order in the definite quaternion algebra of discriminant `2` has
  `Disc = 4ℤ` (the square of the reduced discriminant), and `2` is ramified.

### M0.4 Symplectic O-lattices and their duals

This alternating, order-linear lattice API extends the symmetric-lattice scope of
TauCetiRoadmap.IntegralLattices; the underlying lattice and index inputs here
are the Mathlib and Tau Ceti declarations listed below.

Define `SymplecticOLattice O`: a left `O`-module `L`, finite free over `ℤ`, with a `ℤ`-bilinear
alternating pairing `⟨·,·⟩ : L × L → ℤ(1)`, nondegenerate after `⊗ ℚ`, for which `b` and `b*` are
adjoint: `⟨bx, y⟩ = ⟨x, b*y⟩` (Mathlib `LinearMap.BilinForm.IsAlt`, `LinearMap.IsAdjointPair` after
identifying `ℤ(1)` with `ℤ`). Its dual is `L^# = {x ∈ L ⊗ ℚ : ⟨x, L⟩ ⊆ ℤ(1)}`, an `O`-lattice
containing `L` with finite index; `L` is self-dual at `p` if `L ⊗ ℤ_p = L^# ⊗ ℤ_p`. The API is
`SymplecticOLattice.adjoint`; `SymplecticOLattice.dual` (an `O`-submodule of `L ⊗ ℚ`, stable because
the adjoint of `b` is `b*`, built with `LinearMap.BilinForm.dualSubmodule`);
`SymplecticOLattice.le_dual` (the image of `L` lies in `L^#`; its index is `dualIndex`);
`SymplecticOLattice.IsSelfDualAt` (holds for all `p ∤ [L^# : L]`); `SymplecticOLattice.multiRank`
(the multiplicity of the absolutely simple module after splitting each central simple factor).
For `B_i = M_r(D)` with `D` of degree `s` over its centre, rational simple-module
multiplicity `m` becomes geometric multiplicity `s m`: the rational simple module
`D^r` has dimension `r s²`, and its split constituents have dimension `r s`.
This is the correction to Lan, Lemma 1.2.5.3 in the thesis errata, p. 7. The API includes
`SymplecticOLattice.polarizationType` (for `O = ℤ`, the elementary divisors `d_1 | ⋯ | d_g` with
`L ≅ ⊕ (ℤe_i ⊕ ℤf_i)`, `⟨e_i, f_i⟩ = d_i`, and `[L^# : L] = (d_1⋯d_g)²`).
This exposes AbelianSchemesAndArithmeticModuli A5.4(1) `alternating_elementaryDivisors`
on the underlying integral alternating lattice; that supplier gives the normal form, uniqueness
and Gram determinant. The new order-linear API here is the `O`-stable dual, its index, multi-rank
and scalar extension. Smith normal form computes the index. The API also includes `SymplecticOLattice.baseChange` (`L ⊗ R` with an
`R(1)`-valued form for every commutative ring `R`; nondegeneracy is not preserved for nonflat `R`). The pairing is
`ℤ(1)`-valued (Lan, §1.2.1, p. 46), the index enters the bad primes (Lan, Definition 1.4.1.1, p. 148),
and the rational object is Kottwitz's skew-hermitian `B`-module (Kottwitz, §1, p. 374). *Needs:* M0.1;
Mathlib `LinearMap.BilinForm.IsAlt`, `LinearMap.IsAdjointPair`, `LinearMap.BilinForm.Nondegenerate`,
`LinearMap.BilinForm.dualSubmodule`, `Submodule.IsLattice`; Tau Ceti
`LinearMap.BilinForm.dualSubmodule_dualSubmodule_flip`, `Matrix.exists_smith_normal_form_of_det_ne_zero`;
AbelianSchemesAndArithmeticModuli A5.4(1) `alternating_elementaryDivisors`.

**Checks.**

- Standard symplectic plane: the rank-two lattice with Gram matrix `((0,1),(−1,0))` has dual
  index one.
- Nonprincipal symplectic lattice: rank four with alternating blocks of weights `1` and `d` has dual
  index `d²` for `d ≠ 0`.
- For a quaternion division algebra `B/ℚ`, `V = B` has rational simple-module
  multiplicity one and split multi-rank two; recording one after splitting loses
  the division-algebra degree.
- `SymplecticOLattice.zero`: the zero lattice has dual index one.
- Alternation boundary: `(ℤ, ⟨x, y⟩ = xy)` is not alternating, hence not a symplectic
  lattice, although double duality holds for it; alternation is what must be checked.

### M0.5 Integral PEL data

Define `IntegralPELDatum`: a tuple `(O, *, L, ⟨·,·⟩, h)` with `O` a star-order in a
finite-dimensional semisimple `ℚ`-algebra with positive involution, `(L, ⟨·,·⟩)` a symplectic
`O`-lattice, and `h : ℂ → End_{O ⊗ ℝ}(L ⊗ ℝ)` an `ℝ`-algebra homomorphism with (1)
`⟨h(z)x, y⟩ = ⟨x, h(z̄)y⟩` and (2) the form `(x, y) ↦ (1/√−1)⟨x, h(√−1)y⟩` symmetric and positive
definite on `L ⊗ ℝ` (Lan's Condition 1.2.1.2, pp. 46–47; Definition 1.2.1.3, p. 47). The order
action may be nonfaithful and `L` may be zero. Equivalently, `h` is an `O`-linear almost complex
structure `J = h(√−1)` with these adjointness and positivity conditions. Only the existence of `h`
enters the moduli problems: any two choices are conjugate under `G₁(ℝ)` (M0.11). The API is
`IntegralPELDatum.h_adjoint`; `IntegralPELDatum.pos`; `IntegralPELDatum.compatible` (with
`ω = (1/√−1)⟨·,·⟩` and `J = h(√−1)`, Tau Ceti `SymplecticForm.Compatible ω J` holds, and conversely a
compatible `J` commuting with `O ⊗ ℝ` defines `h(a + b√−1) = a + bJ`);
`IntegralPELDatum.nondegenerate_real` (condition (2) forces nondegeneracy over `ℝ`);
`IntegralPELDatum.rationalize` (given `B ≅ O ⊗ ℚ`, a compatible star and a faithful action on
`L ⊗ ℚ`, the datum promotes to a rational datum, M0.6; zero or nonfaithful integral data have no
such promotion). For every integral datum, scalar extension still gives the possibly
nonfaithful `B = O ⊗ ℚ`-representation `V = L ⊗ ℚ` with form and `J`. The linear
Hodge decomposition, signatures, determinant polynomial and reflex field of
M0.11, M0.13, M0.16 and M0.18 apply to this representation without faithfulness;
only promotion to `RationalPELDatum` and its group/Shimura adapters requires it.
The API also includes `IntegralPELDatum.ofSubOrder` and `IntegralPELDatum.ofSubOrder_form` (restriction of
the action to a full star-stable suborder, keeping the form and `J`). Kottwitz's rational data are
compared in Lan, Remark 1.2.1.4, p. 47. The real extension of the pairing is
`ℝ`-bilinear with `ψ_ℝ(1 ⊗ x, 1 ⊗ y) = ψ(x,y)`; the real extension of the action is
`ℝ`-linear, sends `1 ⊗ x` to `1 ⊗ bx`, and respects identity and multiplication.
These are base-change operations on the existing bilinear-form and endomorphism carriers.
*Needs:* M0.1, M0.4; Tau Ceti `SymplecticForm`,
`SymplecticForm.Compatible`, `AlmostComplexStructure`.

**Checks.**

- `IntegralPELDatum.siegel`: in every genus `g`, `(ℤ, id, ℤ^{2g}, ψ, h)` with Gram matrix `−Matrix.J`
  and `h(√−1) e_i = f_i`, `h(√−1) f_i = −e_i` is an integral datum with dual index one.
- `IntegralPELDatum.zero`: the zero-lattice datum exists and has dual index one.
- For `O = ℤ × ℤ` acting on the principal rank-two lattice through the first
  projection, the integral datum exists; its Hodge line has determinant `X₁`,
  reflex field `ℚ`, and multiplicity zero on the second factor. It defines M1.2
  over its good reflex base without a faithful rational promotion.
- `IntegralPELDatum.wrong_sign`: for `g > 0`, with the same lattice and form but `h(√−1)` replaced by its negative,
  `(1/√−1)⟨x, h(√−1)x⟩` is negative definite; that tuple is not a datum.
- On the principal rank-two lattice, `ψ_ℝ(e,f) = 1` and the real action of `2`
  sends `e` to `2e`; composing the actions of `2` and `3` gives `6e`.
  The form retains its integral normalization and the action retains multiplication.
- For the zero lattice, the extended pairing and every extended action are the unique
  zero maps; the underlying endomorphism ring has `0 = 1`.
- For an integral vector `x`, the real action of `−1` sends `1 ⊗ x` to `−(1 ⊗ x)`;
  on the standard pair, `ψ_ℝ(2e,f) = 2` and `ψ_ℝ(f,2e) = −2`.
  These computations detect a lost scalar or an exchanged argument.
- `IntegralPELDatum.compatible_iff`: for a datum and a nonzero real vector `x`, the pairing of `x`
  with `Jx` is strictly positive in the convention of the `Compatible` adapter.

### M0.6 Rational and p-integral PEL data

Define `RationalPELDatum`: `(B, *, V, ⟨·,·⟩, h)` with `B` as in M0.1, `V` a finitely generated
faithful left `B`-module, `⟨·,·⟩` a nondegenerate alternating `ℚ`-valued (equivalently
`ℚ(1)`-valued) form with `⟨bv, w⟩ = ⟨v, b*w⟩`, and `h : ℂ → End_B(V ⊗ ℝ)` satisfying Condition 1.2.1.2.
Define `PIntegralPELDatum` for a prime `p` (Kottwitz, §5, p. 389): a rational datum with a star-stable
`ℤ_(p)`-order `O_B ⊆ B` maximal at `p` such that `B ⊗ ℚ_p` is a product of matrix algebras over
unramified extensions of `ℚ_p`, and an `O_B ⊗ ℤ_p`-stable lattice `Λ₀ ⊆ V ⊗ ℚ_p` self-dual for
`⟨·,·⟩`. The API is `IntegralPELDatum.toRational` (for a faithful rationalized action, the `ℚ`-scalar extension of the form; the
`rationalize` constructor of M0.5 additionally identifies `O ⊗ ℚ` with `B` and extends star, action
and `J` faithfully); `IntegralPELDatum.toPIntegral` (for a faithful rationalized action and `p ∤ I_bad · Disc · [L^# : L]`, the same
rationalization with `O ⊗ ℤ_(p)` and the completed lattice `L ⊗ ℤ_p` is a `p`-integral datum, by
M0.3 and M0.4); `RationalPELDatum.adelicLattice` (the completed integral lattice is the
`Ẑ`-span of `L` inside `𝔸_f ⊗ V`, identified with `Ẑ ⊗ L` through ProfiniteArithmetic's
product decomposition of `Ẑ`, not the image of `L` itself); and `RationalPELDatum.centralizer` (the
algebra `C = End_B(V)` with the adjoint involution of `⟨·,·⟩`; `h` takes values in `C ⊗ ℝ`, Kottwitz,
§5, p. 389). Rationalization is Lan, Remark 1.2.1.4, p. 47. *Needs:* M0.3, M0.5; LocalFieldsRamification
Layer 2; ProfiniteArithmetic Layer 0.

**Checks.**

- `RationalPELDatum.siegel_pIntegral`: the rank-two datum with unimodular standard Gram matrix is
  self-dual at every prime.
- `IntegralPELDatum.toPIntegral_type`: for the Siegel datum of type `(1 | p)`, `L ⊗ ℤ_p` is not
  self-dual, so `toPIntegral` is unavailable at `p` and available at every `ℓ ≠ p`.
- `RationalPELDatum.zero`: for nonzero `B` and `V = 0` faithfulness fails, so there is no rational
  datum.
- `IntegralPELDatum.toRational_injective_fails`: `ℤ²` and `2ℤ ⊕ ℤ` with the restricted standard form
  have the same rationalization; the rational datum forgets the lattice.

### M0.7 The similitude group

Define, for an integral PEL datum and a commutative ring `R`, the group
`IntegralPELDatum.similitudePoints R` of pairs `(g, r) ∈ GL_{O⊗R}(L ⊗ R) × R^×` with
`⟨gx, gy⟩ = r⟨x, y⟩` for all `x, y ∈ L ⊗ R`; no flatness is needed to define it. Represent these
equations by a commutative Hopf algebra over `ℤ` (`IntegralPELDatum.coordinate`), the closed subgroup
scheme `G ⊆ GL(L) × G_m` cut out by `O`-linearity and the multiplier equation, with
`IntegralPELDatum.coordinatePoints` (its `R`-points, under convolution, are the pair group). The
similitude character is `PELDatum.multiplier : G → G_m`, `(g, r) ↦ r`, with kernel the isometry group
`PELDatum.isometryGroup = G₁`; the multiplier-one closed subgroup has its own coordinate algebra
`IntegralPELDatum.isometryCoordinate`. Identity, composition and inverse respect the
order-commutation and multiplier equations; the zero-lattice and nonflat Checks below
keep the multiplier as data. Over `ℚ` define `PELDatum.similitudeGroup` (the pair group over
`ℚ`-algebras), `RationalPELDatum.coordinate` and `RationalPELDatum.coordinatePoints`; this is the group
of `B`-linear symplectic similitudes of `V`. From `G` define `G(ℤ/nℤ)`, `G(Ẑ^□)`, the principal
congruence subgroup, for `n ≥ 1` with no prime divisor in `□`,
`U^□(n) = ker(G(Ẑ^□) → G(ℤ/nℤ))` (the canonical reduction uses these hypotheses
and retains the multiplier;
`PELDatum.similitudeGroup.completedPrincipalCongruence`) and `G(𝔸^{∞,□})`. The API further contains
`PELDatum.similitudeGroup.points_iff` (membership is `O ⊗ R`-linearity plus the multiplier equation);
`IntegralPELDatum.multiplier_unique` (for `R` flat over `ℤ`, `L ≠ 0` and `R ≠ 0`, two units scaling the
same automorphism agree) with its rational form `PELDatum.similitudeGroup.multiplier_unique`;
`PELDatum.similitudeGroup.siegelEmbedding` (forgetting `B`-linearity, `G ↪ GSp(L, ⟨·,·⟩)`, keeping the
multiplier); `PELDatum.similitudeGroup.isometry_siegel` (for the principal Siegel lattice of genus
`g`, the multiplier-one coordinate Hopf algebra is isomorphic to that of Tau Ceti
`Symplectic.groupScheme ℤ g` after the basis change between `Fin (2g)` and `Fin g ⊕ Fin g`); and
`PELDatum.similitudeGroup.ofZero`, `IntegralPELDatum.zeroSimilitudeEquiv` (for `L = 0` every unit is a
multiplier of the identity and `G = G_m`). `G` need not be smooth over `ℤ` (Lan, Definition 1.2.1.5,
p. 47, and Remark 1.2.1.6, p. 48); uniqueness of the multiplier needs flatness (Lan's thesis errata,
p. 4, correcting Definition 1.2.1.5: for the form `5J` on `ℤ²`, over `𝔽₅` the form vanishes and the
identity has every multiplier). Over `ℚ` the group is described through `C = End_B(V)` (Kottwitz, §5,
p. 389). For the Siegel datum `G = GSp_{2g}` and `G₁ = Sp_{2g}`; for an imaginary quadratic `K` and a
hermitian space, `G_ℚ = GU(V)` and `G₁ = U(V)`. *Needs:* M0.5; Tau Ceti `ConstantForm.groupScheme`,
`GeneralLinear.groupScheme`, `Symplectic.groupScheme`, `Matrix.transpose_mul_J_mul_eq_det_smul`;
AdelicAlgebraicGroups Layer 1 (§1.2, §1.3: adelic points and rational points of affine groups);
ProfiniteArithmetic Layer 0.

**Checks.**

- `similitudeGroup_siegel_one`: for genus one, `Aᵀ J A = det(A) J`, so every element of `GL₂` is a
  similitude with multiplier `det`; this is `GL₂ = GSp₂`.
- `similitudeGroup_zero`: for `L = 0`, `G(R) = R^×` for every `R`.
- With `□ = {3}`, `3` is a unit in `Ẑ^□`, so no unital reduction to `ℤ/3`
  exists. The definition excludes both `n = 3` here and `n = 0`.
- `isometryGroup_siegel`: for the Siegel datum, `G₁` is `TauCeti.Symplectic.groupScheme ℤ g` as closed
  subgroup schemes of `GL_{2g}`.
- `similitudeGroup_not_isometry`: in genus one `diag(2, 1)` is a similitude with multiplier `2`
  (`det = 2`) but not an isometry; in genus two `diag(2, 1, 1, 1)` scales `⟨e₁, f₁⟩` by `2` and
  `⟨e₂, f₂⟩` by `1`, so it is not even a similitude.
- `similitudeGroup_multiplier_nonflat`: on `ℤ²` with the form `5J`, over `𝔽₅` the identity has both
  multipliers `1` and `2`; uniqueness fails on this nonflat base although the form is nondegenerate
  over `ℤ`. Both distinct multipliers belong to the pair group over this base.

### M0.8 Structure of the similitude group

Prove `similitudeGroupStructure`. Let `(B, *, V, ⟨·,·⟩, h)` be a rational datum with `B` simple (the
semisimple case is the fibre product over `G_m` of the factor groups). In Cases A and C, `G` is
connected reductive with simply connected derived group; in Case D, `G` has reductive identity
component and `2^{[F₀:ℚ]}` geometric connected components. In Cases A and C the torus `D = G/G^der` is `G_m` (Case C) or
`{(x, t) ∈ F^× × ℚ^× : N_{F/F₀}(x) = t^n}` (Case A, `n` the hermitian dimension). Two elements of
`G(K)`, `K` algebraically closed of characteristic zero, are conjugate iff they have the same
multiplier and conjugate images in `(End_B V)^×`. Over `ℚ̄`, `G₁` is a product over the embeddings of
`F₀` of `GL_n` (A), `Sp_{2n}` (C) or `O_{2n}` (D) (Kottwitz, §5, p. 391; Milne, Proposition 8.7,
p. 83, and Remark 8.9, p. 84); connectedness and simple connectivity in Cases A and C come from `GL_n`, `SL_n`,
`Sp_{2n}`, and `O_{2n}` has two components. `G/G^der` is computed from the norm and the multiplier
(Kottwitz, §7, p. 393) and the conjugacy criterion is Kottwitz, Lemma 7.1, p. 395, proved factorwise.
*Needs:* M0.2, M0.7; Tau Ceti `Symplectic.groupScheme`, `Orthogonal.groupScheme`; ReductiveGroups
Layers 3 and 6 (identity components, derived groups, simple connectivity).

**Checks.**

- `similitudeGroupStructure_siegel`: `GSp_{2g}` is connected, `G^der = Sp_{2g}` is simply connected
  and `D = G_m`.
- `similitudeGroupStructure_typeD`: for a definite quaternion algebra over `ℚ` and `V = B²`, `G` has
  two components.
- `similitudeGroupStructure_unitary`: for `K` imaginary quadratic and `n = 3`, `D` is the torus
  `{(x, t) : N(x) = t³}`, not `G_m`.

### M0.9 Galois cohomology of the similitude group and ker¹

This identifies PEL continuous cocycles with the common torsor classes and supplies the finite,
all-place kernel for possibly disconnected PEL groups, using the coordinate comparison and simply
connected Hasse statements of AdelicAlgebraicGroups §4.1.

Define, for a smooth affine group `G` of finite type over any field `k`, possibly disconnected,
the pointed set `galoisH1 k G = H¹(k, G)` of continuous cocycles
`Γ_k → G(k^sep)` (profinite `Γ_k = Gal(k^sep/k)`, discrete `G(k^sep)`) modulo coboundaries,
functorial in `G` and in `k`. In characteristic zero `k^sep = k̄`; for an abelian `G` this is
the continuous cohomology of TauCetiRoadmap.ProfiniteCohomology.
Define the localization maps `H¹(ℚ, G) → H¹(ℚ_v, G)` at every place `v ≤ ∞` and
`ker1 G = ker¹(ℚ, G)`, the classes that are trivial at every place (Kottwitz, §7, p. 393). Prove:
(1) `smoothAffineTorsor_galoisH1`: construct here the pointed bijection from the common class set
`torsorClasses G = NonabelianH1 (fppfTopology.over (Spec k)) h_G` of
SchemeAndStackFoundations §§1.15 and 2.3 to `galoisH1 k G`, and its inverse
`galoisH1_equiv_torsorClasses`, for every smooth affine finite-type `G/k`, without a connectedness
hypothesis (Milne, *Algebraic Groups* (2017), Proposition 3.50, p. 80).
An fppf torsor under `G` is an affine scheme by affine descent, and is smooth, nonempty and of finite
type over `k`; hence it has a point over a finite separable extension. A choice of point over
`k^sep` gives a continuous cocycle. Conversely a continuous cocycle has finite image and, after
choosing an open normal subgroup contained in `c⁻¹(1)` and fixing all its values, factors through
`Gal(K/k)` with values in `G(K)` for a finite Galois extension `K/k`. On the trivial right
`G_K`-torsor use the semilinear descent action `x ↦ c_σ σ(x)`; affine Galois descent gives a
right `G`-torsor over `k`. Prove that changes of point give exactly gauge equivalence, that both
composites are the identity on classes, and that the bijections preserve the trivial class,
arbitrary field extensions and pushforward along homomorphisms of smooth affine finite-type groups.
Use ModularCurves §0E for effective affine descent and SchemeAndStackFoundations §§1.15, 2.3
for torsor representability, base change and pushforward. AdelicAlgebraicGroups §4.1 identifies the resulting
geometric classes with its coordinate torsor classes, so its local and Hasse statements transport
through this bijection.
For a right torsor use `σ(s) = s·c_σ`, so `c_{στ} = c_σ σ(c_τ)` and replacing `s` by `s·g`
gives `g⁻¹c_σ σ(g)`; the common left action is `g·s = s·g⁻¹`.
The comparison, localization maps and all-place kernels are owned here.
(2) `twist_bijection`: over a characteristic-zero field `k`, forms of a structure on a vector space whose
automorphism group scheme is `G` are classified by `H¹(k, G)`, and for a class `c` the twist `G_c` is
an inner form with `H¹(k, G_c) ≅ H¹(k, G)` carrying the base point to `c` (Borel–Serre, §§1.6–1.10 and §2.2, pp. 116–118 and 127–128); (3) `ker1_finite`: `ker¹(ℚ, G)` is finite for every linear
algebraic group over `ℚ`, connected or not (Borel–Serre, *Théorèmes de finitude en cohomologie
galoisienne*, Theorem 7.1, p. 158, with the empty exceptional set; Kottwitz, §8, p. 399); (4)
`ker1_of_simplyConnectedDerived`: if `G` is connected reductive with simply connected derived group
and `D = G/G^der`, and `H¹(ℚ, D) → ∏_{v≤∞} H¹(ℚ_v, D)` is injective, then a class of `H¹(ℚ, G)` trivial
at every place `v ≤ ∞` is trivial (Milne, Lemma 8.20, p. 89). The proof of (4) uses
`H¹(ℚ_ℓ, G^der) = 1` (Kneser) and injectivity of `H¹(ℚ, G^der) → H¹(ℝ, G^der)` (both
AdelicAlgebraicGroups §4.1), that the image of `G(ℝ)` in `D(ℝ)` contains `D(ℝ)^+` and that
`D(ℚ) D(ℝ)^+ = D(ℝ)` (ShimuraVarieties §P.5
`TauCeti.Shimura.real_approximation_tori`, Milne, Theorem 5.4: density gives surjectivity
`D(ℚ) → π₀D(ℝ)`); a diagram chase on
`D(ℚ) → H¹(ℚ, G^der) → H¹(ℚ, G) → H¹(ℚ, D)` and its real analogue concludes. (5) `ker1_normOneTorus`:
for a cyclic extension `F/F₀` the norm-one torus has trivial `ker¹`, and for a quadratic extension, so does
`{(x, t) : N_{F/F₀}(x) = t^n}` for `n` even (Milne, Lemma 8.21, p. 89, from ClassFieldTheory Layer 13
`isGlobalNorm_iff_isLocalNormEverywhere` (the local-everywhere form of `cyclicHasseNorm`)
and Hilbert 90 for `G_m`, `TauCeti.hilbert90`). *Needs:* M0.7, M0.8;
TauCetiRoadmap.AdelicAlgebraicGroups §4.1 (coordinate/geometric torsor comparison, local triviality and the real Hasse
principle for semisimple simply connected groups); the continuous Hilbert-90 library supplier;
TauCetiRoadmap.ClassFieldTheory Layer 13; TauCetiRoadmap.ReductiveGroups Layer 6;
TauCetiRoadmap.ModularCurves §0E; SchemeAndStackFoundations §§1.15 and 2.3;
ShimuraVarieties §P.5 `TauCeti.Shimura.real_approximation_tori`.

**Checks.**

- `galoisH1_Gm`: `H¹(ℚ, G_m) = 1` (Hilbert 90), so `ker¹(ℚ, G_m) = 1`.
- `galoisH1_mu2`: `H¹(ℚ, μ₂) = ℚ^×/ℚ^{×2}`, and the class of `2` is nontrivial at `ℚ_2` but trivial at
  every `ℚ_p` with `p ≡ ±1 mod 8`; `ker¹(ℚ, μ₂) = 1`.
- `ker1_normOneTorus_quadratic`: for `F = ℚ(i)`, `F₀ = ℚ`, the norm-one torus has trivial `ker¹`: a
  rational number that is a norm from `ℚ_v(i)` at every `v` is a norm from `ℚ(i)`.
- `ker1_disconnected`: for `G = μ₂` (disconnected, finite), (1) identifies `H¹` with quadratic
  étale algebras up to isomorphism. The right torsor `Spec ℚ(√2)` gives
  `c_σ = σ(√2)/√2`, becomes trivial over `ℚ(√2)`, and has no rational section; (4) does not apply.
- For the smooth disconnected constant group `C₂/𝔽_q`, the two classes are the trivial torsor
  and `Spec 𝔽_{q²}`, corresponding to the two possible images of Frobenius in `C₂`.
  This includes characteristic two and tests the comparison beyond characteristic zero.
- Smoothness is essential: for `k = 𝔽_p(t)`, the nonsmooth group `α_p` has the nontrivial fppf
  torsor `x^p = t`, with no point over `k^sep`, while `α_p(k^sep) = 0` makes its continuous
  Galois `H¹` trivial.

- `ker1_infinity_essential`: for the simply connected group `SL₁(D)` with `D` the
  Hamilton quaternion algebra over `ℚ`, the torsor `Nrd(x) = −1` has points at every
  finite place (local reduced norms are surjective), but none over `ℝ` (the norm is
  positive). Omitting `∞` from (4) gives a false assertion even when `D = G/G^der`
  is the trivial torus.

### M0.10 Bad primes and the good-prime base

For every integral datum, including zero or nonfaithful actions, define
`PELDatum.badPrimeInteger n = n · I_bad · Disc · [L^# : L]`, `PELDatum.IsGoodPrime p`
(`p` is prime and `p ∤` that integer), `PELDatum.IsGoodSet □` (no element of `□` is bad), and `PELDatum.goodBase □`,
the scheme `S₀ = Spec O_{F₀,(□)}` for the reflex field `F₀` of M0.16 (`Spec F₀` when `□ = ∅`). For
`p ∈ □` a good set gives: `p ∤ Disc` (so `O` is maximal and `B` unramified at `p`), `p ≠ 2` when a type
D factor occurs, `L ⊗ ℤ_p` self-dual, and `p ∤ n`, so that a level `H ⊆ G(Ẑ^□)` has no component at
`p`. These are separate conditions, not consequences of `p` being large (Lan, Definition 1.4.1.1,
p. 148; Kottwitz, §5, p. 391, for the exclusion of `2` in type D). The API is
`PELDatum.IsGoodPrime.not_dvd_dualIndex`, `PELDatum.IsGoodPrime.not_two_of_typeD`, the promotion to a
`p`-integral datum when the rationalized action is faithful
(`IntegralPELDatum.toPIntegral`, M0.6), and the unramified-reflex assertion
of M0.16, including its integral interface (`RationalPELDatum.unramified_reflex`
for rational data: a
prime unramified in the centre is unramified in the reflex field, Lan, Corollary 1.2.5.7, p. 91; a
good prime is unramified in the centre by M0.3). *Needs:* M0.2, M0.3, M0.4, M0.6;
M0.16 for `goodBase` and unramifiedness of the reflex field.

**Checks.**

- `goodPrime_siegel`: for the principal Siegel datum and `n = 3`, the bad primes are `{3}`.
- `goodPrime_type`: for the Siegel datum of type `(1 | 6)` and `n = 1`, the bad primes are `{2, 3}`.
- `goodPrime_typeD_two`: for the definite quaternion algebra ramified at `{3, ∞}` with its canonical
  involution, `I_bad = 2`, so `2` is bad even when it divides neither `n`, `Disc` nor `[L^# : L]`.
- `goodBase_empty`: for `□ = ∅` the base is `Spec F₀` and every datum is good.

### M0.11 The polarized Hodge structure of a datum

Prove `hodgeStructureOfDatum`. Let `B` be as in M0.1 and let `V` be a finite
`B`-module with nondegenerate alternating scalar form `ψ : V × V → ℚ` and star-adjoint action,
without a faithfulness assumption. Put `φ = 2π√−1·ψ : V × V → ℚ(1)` and let
`h : ℂ → End_B(V ⊗ ℝ)` be an `ℝ`-algebra homomorphism with `ψ(h(z)x, y) = ψ(x, h(z̄)y)`. The following
are equivalent: (a) `(x, y) ↦ ψ(x, h(√−1)y)` is symmetric positive definite; (b) the Hodge
structure on `V` of type `{(−1,0),(0,−1)}` with `V^{−1,0} = V₀` is polarized by `φ` in
Deligne's conventions (Milne, Propositions 8.12 and 8.14, pp. 85–87), and `B` acts by Hodge endomorphisms.
Moreover `V ⊗ ℂ = V₀ ⊕ V₀^c` with both
summands totally isotropic `B ⊗ ℂ`-submodules; for `(B, *)` of type A or C such an `h` exists (Milne,
Proposition 8.14, p. 86, after Zink); and whenever it exists any two such `h` are conjugate under
`G₁(ℝ)` (Kottwitz, Lemma 4.3, p. 388), so the `G(ℝ)`-conjugacy class `X` of `h` depends only on the
datum. The decomposition and isotropy are Lan, §1.3.4, p. 125. For an integral datum this provides `IntegralPELDatum.hodgeStructure` without
faithfulness. Apply AbelianSchemesAndArithmeticModuli A5.2
`RiemannForm.homological` with `E = −ψ`: on `V` the `(−1,0)`-piece is `V_{+i}`,
the Weil operator is `−J` and the Tau Ceti polarizing form is `Q = ψ`, since
`Q(−Jx,x) = ψ(x,Jx) > 0`. The weight-one structure
`AlmostComplexStructure.hodgeStructure` on the same real space instead has Weil
operator `J` and form `−ψ`. Dualizing the homological structure gives the
cohomological structure on `V∨`, with form
`Q∨(ξ,η) = ψ((ψ♭)⁻¹ξ,(ψ♭)⁻¹η)`. Keep this dual carrier and form explicit;
an integral dual form requires the denominator adjustment of A5.2. For an integral datum,
`E = −ψ` is a Riemann form for `J`.
Applying `TauCeti.AlmostComplexStructure.IsRiemannForm.isPolarization` to it gives the polarization
of the effective weight-one structure of `J` by `−ψ`.
The statement `compatibleComplexStructures_conjugacy` in `Suggested.lean` gives the conjugacy
assertion on a finite-dimensional real space with a star-adjoint order action: any two
order-linear complex structures compatible with the same symplectic form are intertwined
by an order-linear isometry. *Needs:* M0.5, M0.6, M0.7; Tau Ceti `AlmostComplexStructure.hodgeStructure`,
`Hodge.HodgeStructureOn`, `Hodge.IsPolarization`,
`Hodge.isPolarization_of_weilOperator_invariant_on_realPoints_of_pos`, `SymplecticForm.exists_compatible`,
`SymplecticForm.Compatible`; AbelianSchemesAndArithmeticModuli A5.2
(`RiemannForm.homological`, `RiemannForm.hodgeDual`).

**Checks.**

- On `V = ℚe ⊕ ℚf` with `ψ(e,f) = 1`, `Je = f`, `Jf = −e`, the scalar test gives
  `ψ(e,Je) = 1`, while `(1/i)φ(e,Je) = 2π`. The expression `(1/i)ψ(e,Je) = −i`
  is not real and cannot be a positivity test.
- On the Gaussian plane with `J1 = i` and `ψ(1,i) = 1`, the homological
  structure has `V^{−1,0} = V_{+i}` and `Q(−J1,1) = 1`; using `Q = −ψ`
  gives `−1`. The dual lives on `V∨`, not on `V` through an unchanged Hodge structure.
- `hodgeStructure_siegel`: for the Siegel datum, `V₀` is the `+√−1`-eigenspace of `J` and the
  polarization is the standard Riemann form.
- `hodgeStructure_cm`: for a CM field `K` acting on `V = K^n` with signature `(r_τ, s_τ)`,
  `dim_ℂ (V₀)_τ = r_τ`.
- `hodgeStructure_sign`: for `V ≠ 0`, replacing `h` by `h̄` (that is `J` by `−J`)
  exchanges `V₀` and `V₀^c` and violates (a). For `V = 0`, `J = −J = 0` and both satisfy (a).

### M0.12 The Shimura datum of a PEL datum

Define `RationalPELDatum.domain`: the `G(ℝ)`-conjugacy class `X` of `h`, viewed through the Deligne
torus as homomorphisms `S → G_ℝ`, with `(V, h)` of type `{(−1,0),(0,−1)}`. Prove that `h(ℝ^×)` is
central, that the cocharacter `μ_h` acts on `Lie G_ℂ` with weights in `{−1, 0, 1}`, and that
`Int h(√−1)` is a Cartan involution of `G₁/Z` (Kottwitz, Lemma 4.1, p. 386, through a positive
involution on `C ⊗ ℂ`). When `G` is connected and `h` projects nontrivially to every `ℚ`-simple factor
of `G^ad` (SV3), `(G, X)` is a Shimura datum in the sense of ShimuraVarieties §P.1 `TauCeti.Shimura.PureDatum`, and the
Siegel embedding gives a morphism of Shimura data to the Siegel datum of ShimuraVarieties §P.4, so `(G, X)` is of Hodge type (Milne, §8, p. 87). Kottwitz writes the same object as
`(G, h⁻¹)` (Kottwitz, §8, p. 400). The API is `RationalPELDatum.domain_indep` (every `B`-linear `J′`
with `J′² = −1`, adjoint-compatible and positive, lies in the `G₁(ℝ)`-orbit of `J`; adjoint
compatibility is essential); `RationalPELDatum.kottwitzSymmetricForm` (the real form `ψ(x, Jy)` is
symmetric); `RationalPELDatum.toShimuraDatum` (for connected `G` and SV3, the §P.1 datum with the PEL
group and the `h`-orbit); `RationalPELDatum.siegelMorphism` (for connected `G` with SV3 and
`dim_ℚ V = 2g`, `g > 0`, the morphism to ShimuraVarieties §P.4's genus-`g` Siegel datum); and
`RationalPELDatum.signConvention` (replacing `J` by `−J` exchanges the `±√−1`-eigenspaces; this is the
translation between Kottwitz's and Deligne's conventions). Milne's account (§8, pp. 87–88) deduces SV3
from the nontriviality of `h` and simplicity of `G^ad`; this is incorrect for wholly definite unitary
data of rank `n ≥ 2` (signature `(n, 0)` at every real place), where `h(ℂ^×)` is central, `G^ad(ℝ)` is
compact and `X` is a point, so the hypothesis SV3 is stated explicitly here; a rank-one definite datum
has trivial adjoint group and satisfies SV3 vacuously. *Needs:* M0.8, M0.11; ShimuraVarieties §§P.1 and P.4 (pure data, their morphisms, Hodge type and Siegel data).

**Checks.**

- `pelShimuraDatum_siegel`: the Siegel PEL datum gives ShimuraVarieties §P.4's genus-`g` Siegel datum, including its real
  orbit (the Siegel double half space).
- `pelShimuraDatum_definite`: if `J` commutes with every real similitude, its real conjugacy orbit is
  the single point `J`; for a nontrivial adjoint factor this is the excluded wholly definite case.
- `pelShimuraDatum_typeD`: the orthogonal (type D) example has a disconnected group; the PEL
  comparisons keep that group, while the Shimura-datum adapter has the separate connectedness
  hypothesis.
- `pelShimuraDatum_gl2`: the principal genus-one datum is the `GL₂` Siegel datum; its multiplier-one
  group is `SL₂`.

### M0.13 Signatures

Define `IntegralPELDatum.signature` for the rationalized representation of any
integral datum, and `RationalPELDatum.signature` for a rational datum: with `F` the centre of `B` (or of a chosen simple factor), for
each embedding `τ : F → ℂ` let `W_τ` be the unique simple `B ⊗_{F,τ} ℂ`-module and write
`V₀ ≅ ⊕_τ W_τ^{p_τ}`, `V₀^c ≅ ⊕_τ W_τ^{q_τ}`; the pairs `(p_τ, q_τ)` are the signatures (Lan,
Definition 1.2.5.1, p. 90). The embeddings use the identification of `F` with the actual centre; for
noncommutative `B` the multiplicities are taken after Morita equivalence. The API is
`RationalPELDatum.signature_add` (`p_τ + q_τ = multiRank_[τ]`, the geometric multi-rank of M0.4);
`RationalPELDatum.signature_conj` (`p_{c∘τ} = q_τ`), both from `V ⊗ ℂ = V₀ ⊕ V₀^c` and complex
conjugation (Lan, §1.2.5, p. 90); `RationalPELDatum.signature_unitary` (for `B = K` a CM field,
`V = K^n` with nondegenerate hermitian form `H`, and, after identifying the Tate-twist line,
`ψ = Tr_{K/ℚ}(δH)` with `δ ∈ K^×`, `δ̄ = −δ`, choose a CM type `Φ` with
`Im τ(δ) > 0` for `τ ∈ Φ`. If `τ(H)` has signature `(r_τ, s_τ)`, then
`(p_τ, q_τ) = (r_τ, s_τ)` for `τ ∈ Φ` and `(p_τ̄, q_τ̄) = (s_τ, r_τ)`.
Indeed, on the real factor indexed by `τ ∈ Φ`, `ψ(x, Jy)` is
`2 Im τ(δ) Re H_τ(x, −iJy)`, so positivity identifies the positive and negative
directions of `H_τ` with the `+i` and `−i` eigenspaces of `J`, respectively
(Kottwitz, proof of Lemma 4.3, pp. 388–389; Bijakowski–Pilloni–Stroh,
*Classicité de formes modulaires surconvergentes*, §1.1, p. 979, for `(a_τ, b_τ)`).
Entrywise conjugation preserves the inertia of `τ(H)`; use the pinned hermitian-inertia API,
including `Matrix.IsHermitian.signature_map_starRingEnd`, for this matrix comparison);
and `RationalPELDatum.signatureType` (for `B = K`, `Σ_τ p_τ τ` is a generalized CM type of rank
`dim_K V`, M0.25). The addition and conjugation identities hold also for
`IntegralPELDatum.signature`, allowing zero multiplicities on unused factors.
*Needs:* M0.4, M0.11; the primitive conjugate-pair predicate of M0.25 for `signatureType`
and the CM type in the unitary comparison; Tau Ceti `Matrix.IsHermitian.signature_map_starRingEnd`.

**Checks.**

- `signature_siegel`: the Siegel datum of genus `g` has `F = ℚ`, the simple complex module `W = ℂ`, and `(p, q) = (g, g)`.
- `signature_picard`: for `K = ℚ(√−3)`, `τ ∈ Φ` with `Im τ(δ) > 0` and `H` of signature `(2, 1)`, `(p_τ, q_τ) = (2, 1)` and
  `(p_τ̄, q_τ̄) = (1, 2)`.
- `signature_gaussian_trace`: for `K = ℚ(i)`, `V = K`, `L = ℤ[i]`, `H(x,y) = xȳ`,
  `δ = i/2` and `Jx = ix`, the trace pairing has Gram matrix `[0,1;−1,0]` on `(1,i)`
  and `ψ(x,Jx) = a²+b² > 0` for `x = a+bi ≠ 0`. Thus the lattice is unimodular.
  At `τ(i) = i` the Hodge pair is `(1,0)` and at `τ̄` it is `(0,1)`, although both
  hermitian Gram matrices are `[1]` with inertia `(1,0)`.
- For quaternion division `B/ℚ` and `V = B`, `p_τ + q_τ = 2`, although the
  rational simple-module multiplicity is one (Lan's thesis errata, p. 7).
- `signature_zero`: for the zero module both complex eigenspaces have dimension zero (a zero module
  over nonzero `B` is excluded from rational data by faithfulness; the check is of the linear
  adapter).
- `signature_not_free`: `(p_τ, q_τ) = (2, 0)` together with `(p_τ̄, q_τ̄) = (2, 0)` violates
  `p_τ̄ = q_τ` and is the signature of no datum.

### M0.14 The determinant polynomial

Define `detPoly`: for a noetherian domain `R₀`, an `R₀`-order `O` free with basis `α₁, …, α_t`, a
scheme `S` over `R₀` and a locally free `O_S`-module `M` of finite rank with an `O`-action,
`Det_{O|M}(X₁, …, X_t) = det_{O_S}(X₁α₁ + ⋯ + X_tα_t | M) ∈ O_S[X₁, …, X_t]`, defined locally on a
trivialization and glued, with coefficientwise restriction;
equivalently an element of `Sym(O^∨) ⊗ O_S` (Lan, Definition 1.1.2.17, p. 19; Kottwitz's polynomial
`f`, §5, p. 389). Prove independence of the basis by linear substitution, evaluation at
`x ∈ O ⊗ O_S` as `det(x | M)`, compatibility with base change
`Det_{O|f*M} = f*Det_{O|M}`, multiplicativity in short exact sequences of `O`-modules by
block-triangular determinants, and homogeneity of degree `rank M`.
With `φ : O → End(M)` and basis `b`, this is `(−1)^{rank M}` times the constant coefficient of
Mathlib's `LinearMap.polyCharpoly φ b`, the characteristic polynomial of the generic element;
base change is supplied by `LinearMap.polyCharpoly_baseChange` and specialization by
`LinearMap.polyCharpoly_map_eq_charpoly`. This gives the definition `detPoly` in `Suggested.lean`
needed for the classification theorem M0.15.
The affine statements use finite free modules over any commutative ring; the sheaf statements
are their local versions. The basis statement substitutes the coordinates of the new generic
element, and the exact-sequence statement carries injectivity, surjectivity and equivariance.
*Needs:* Mathlib `LinearMap.polyCharpoly`, `LinearMap.polyCharpoly_baseChange`,
`LinearMap.polyCharpoly_map_eq_charpoly`, `LinearMap.charpoly`, `LinearMap.charpoly_baseChange`.

**Checks.**

- Scalar action: for `O = ℤ` with basis `1` and `M` free of rank `r`, `Det = X^r`.
- Gaussian actions: for `O = ℤ[i]` with basis `(1, i)` and `M = ℂ` with `i` acting by `√−1`,
  `Det = X₁ + √−1 X₂`; with `i` acting by `−√−1`, `Det = X₁ − √−1 X₂`.
- For `x ∈ O`, `Det_{O|M}` at the coordinates of `−x` equals
  `(LinearMap.charpoly (φ x)).eval 0`; for `x = 1` on a rank-one module both sides are `−1`, so no
  extra sign appears.
- Characteristic-three boundary: for `O = ℤ[i]`, `k = 𝔽₉`, `τ : ℤ[i] → 𝔽₉`, `M = k³` with `i` acting by `τ(i)`
  and `M′ = k³` with `i` acting by `−τ(i)`: both trace maps are `3τ(x) = 0`, but
  `Det_M = (X₁ + τ(i)X₂)³ ≠ (X₁ − τ(i)X₂)³ = Det_{M′}`.

### M0.15 The determinant polynomial classifies modules

Prove `detPoly_classifies`. Let `k` be a field, `C` a finite-dimensional semisimple `k`-algebra whose
centre is separable over `k`, and `K ⊇ k` a field. Two finite `C ⊗_k K`-modules are isomorphic iff
their determinant polynomials agree in `K[C^∨]`. If `char k = 0` they are isomorphic iff their trace
maps agree on `C`; this fails in positive characteristic, where `pM` has zero trace map (Lan,
Proposition 1.1.2.16, p. 18, and Remark 1.1.2.11, p. 14; Milne, Proposition 8.1 and Remark 8.2,
p. 79; Kottwitz, §5, p. 390, for why the determinant is used). The proof decomposes each module into
simple modules (Lan, Corollary 1.1.2.5), restricts the generic determinant to the centre after splitting: there it is a
product of distinct embedding linear forms, with exponents recording the simple-module
multiplicities (Lan, Lemma 1.1.2.15, pp. 16–17). For the full noncommutative algebra a simple
module contributes a generic matrix determinant, which need not split into linear forms. The
central restrictions distinguish different simple factors, and concludes by unique factorization; in characteristic zero the traces of the
simple modules are linearly independent (Dedekind; Lan, Lemma 1.1.2.9).
The same-field statement `detPoly_classifies` takes two unital algebra actions and identifies
equality of their determinant polynomials with a linear equivalence intertwining every element.
It applies to any finite-dimensional semisimple algebra over that field. In the scalar-extension
statement above it is applied to `C ⊗_k K`, whose semisimplicity follows from the separable-centre
hypothesis. The statements `detPoly_classifies` and `detPoly_classifies_charZero`
in `Suggested.lean` give the determinant and characteristic-zero trace classifications,
respectively. *Needs:* M0.14; Mathlib
`IsSemisimpleRing.exists_algEquiv_pi_matrix_divisionRing`, `Algebra.IsSeparable`.

**Checks.**

- `detCondition_not_trace`: over `𝔽_p` with `C = 𝔽_p`, the modules `𝔽_p^p` and `0` have equal
  (zero) traces and different determinant polynomials `X^p` and `1`, over every field of
  characteristic `p`.
- `detPoly_classifies_charZero`: over `ℚ` with `C = ℚ × ℚ`, modules with equal traces are isomorphic.
- For `C = M₂(ℚ)` and its standard simple module, the generic determinant is
  `X₁₁X₂₂ − X₁₂X₂₁`, rather than a product of embedding linear forms; its
  square is the determinant polynomial of two copies.

### M0.16 The reflex field

Define `IntegralPELDatum.reflexField` using the Hodge submodule of the rationalized
representation of every integral datum, including zero and nonfaithful actions;
`RationalPELDatum.reflexField` is the same construction for a rational datum: the subfield `F₀ ⊆ ℂ` fixed by
`{σ ∈ Aut(ℂ/ℚ) : V₀ ⊗_{ℂ,σ} ℂ ≅ V₀ as B ⊗ ℂ-modules}`, the field of definition of the isomorphism
class of the complex representation `V₀` (Lan, Definition 1.2.5.4, pp. 90–91; Kottwitz's `E`, §5,
p. 389). It is computed inside the algebraic closure of `ℚ` in `ℂ` with
`IntermediateField.fixedField`. The API is `RationalPELDatum.reflexField_eq_traces`
(`F₀ = ℚ(Tr(b | V₀) : b ∈ O)`, by M0.15 since characteristic zero; Lan, Corollary 1.2.5.6, p. 91);
`RationalPELDatum.reflexField_le_galoisClosure` (if a finite normal subfield of `ℂ` contains every
embedded conjugate of the centre `F`, it contains the traces and `F₀`; Lan,
Corollary 1.1.2.8, p. 12, applied to `V₀`; see also the proof of
Corollary 1.2.5.7, p. 91);
`RationalPELDatum.reflexField_finite` (a number field); `RationalPELDatum.unramified_reflex` (a
rational prime unramified in `F` is unramified in `F₀`, Lan, Corollary 1.2.5.7, p. 91);
`RationalPELDatum.detPoly_integral` (for a full star-order and any finite family in `O`, the
coefficients of the determinant polynomial on `V₀` are integral, hence `Det_{O|V₀}` lies in
`O_{F₀}[O^∨]`); and `RationalPELDatum.reflexField_siegel`. Integrality does not require a model of
`V₀` over `F₀`: Lan's thesis asserted an `O_{F₀}`-lattice model (Lemma 1.2.5.10, p. 92), which his
thesis errata (p. 7) retracts and replaces by a finite auxiliary extension `F₀′/F₀`, unramified at a
prescribed finite set of good primes, over which a lattice exists; the coefficients are integral
there, invariant under the stabilizer of the class of `V₀`, hence lie in `O_{F₀}`.
The trace description, finiteness, containment, unramifiedness and coefficient
integrality have the same proofs without faithfulness: apply the semisimple
representation results of M0.15, allowing zero multiplicities. These are also
part of the integral-datum interface; in particular
`IntegralPELDatum.detPoly_integral` supplies the reference polynomial for M0.18
and `PELDatum.goodBase` uses this reflex field. *Needs:* M0.11,
M0.14, M0.15; Mathlib `IntermediateField.fixedField`, `IntermediateField.normalClosure`.

**Checks.**

- The zero Hodge module has determinant polynomial `1` and reflex field `ℚ`.
  For `O = ℤ × ℤ` acting through the first factor on a Hodge line, the polynomial
  is `X₁` and the reflex field is `ℚ`; neither calculation uses faithfulness.
- `reflexField_siegel`: for the Siegel datum `Tr(b | V₀) = g·b ∈ ℚ`, so `F₀ = ℚ`.
- `reflexField_picard`: for `K = ℚ(√−3)` and signature `(2, 1)`, `Tr(a | V₀) = 2τ(a) + τ̄(a)` equals
  `√−3 ∉ ℚ` at `a = √−3`, so `F₀ = K`.
- `reflexField_U11`: for signature `(1, 1)`, `Tr(a | V₀) = Tr_{K/ℚ}(a) ∈ ℚ`, so `F₀ = ℚ`.
- `reflexField_not_center`: for the Hilbert datum (`B = F` totally real, M5.4) `F₀ = ℚ` although the
  centre is `F`.

### M0.17 The PEL reflex field is the Shimura reflex field

Prove `reflexField_eq_shimura`. If `(G, X)` is a Shimura datum (M0.12: `G` connected, SV3), the reflex
field `E(G, X)` of ShimuraVarieties §P.3 — the field of definition of the `G(ℂ)`-conjugacy class
of `μ_h` for the same `h` — equals `F₀`. Conjugacy of `μ_h` is equivalent to
isomorphism of its weight submodule `V₀` as a `B ⊗ ℂ`-module (the trace map determines the class,
Milne, Proposition 8.13, p. 86), and the Galois stabilizers then coincide (Milne, Definition 12.2,
p. 112; Kottwitz, §5, pp. 389–390; Lan, Definition 1.2.5.4, p. 91). *Needs:* M0.8, M0.12, M0.16;
ShimuraVarieties §P.3 (cocharacter classes and reflex fields).

**Checks.**

- `reflexField_eq_shimura_siegel`: both fields are `ℚ` for the Siegel datum.
- `reflexField_eq_shimura_picard`: both are `K` for the unitary signature `(n−1, 1)`, `n ≥ 3`, over an
  imaginary quadratic `K`.

### M0.18 The Kottwitz determinant condition

Define `SatisfiesDetCondition`: for an integral datum with its possibly nonfaithful
rationalized representation, or a rational datum with order `O`, its reflex field `F₀`, a set `□`
of primes, a locally noetherian `O_{F₀,(□)}`-scheme `S` and a locally free `O_S`-module `M` of finite
rank with an `O ⊗ ℤ_(□)`-action, the equality of `Det_{O|M}` with the image of `Det_{O|V₀}` under
`O_{F₀,(□)} → Γ(S, O_S)` (Lan, Definition 1.3.4.2, p. 126; Kottwitz, §5, p. 390). The condition is
the polynomial identity on the base; a trace identity does not imply it in positive characteristic.
The API is `SatisfiesDetCondition.baseChange` (stable under pullback);
`SatisfiesDetCondition.descent` (it holds iff it holds after an fpqc cover, being an equality of
sections); `SatisfiesDetCondition.rank` (it implies `rank M = dim_ℂ V₀`);
`SatisfiesDetCondition.iff_eval` (equivalently `det(x | M)` equals the image of `det(x | V₀)` for all
`x ∈ O ⊗ O_S` after base change to the polynomial ring); and `SatisfiesDetCondition.unitary` (for
`B = F` a CM field, `O = O_F`, `p` unramified in `F` and `S` over the ring `ℤ_p^◇` of M0.27, it is
equivalent to `rank M_τ = r_τ` for all `τ`). Prove this linear criterion directly:
the split idempotents of M0.27 give `M = ⊕ M_τ`, and the generic determinant is
`∏ X_τ^{rank M_τ}` locally on constant-rank opens. Equality of these monomials detects
every exponent over nonzero local rings, including nonreduced rings. M1.3 applies this
criterion to the Lie module. *Needs:* M0.14, M0.16, M0.27.

For unital algebra actions on finite free modules over a commutative ring,
the determinant condition gives equality of the characteristic polynomials of every
element. It uses the whole polynomial identity specialized at
`T·1 − a`, retaining the unital-action hypothesis.

**Checks.**

- Over `𝔽₃`, the linear families `φ(a) = a diag(1,0)` and `ψ = 0` on
  `𝔽₃²` have equal zero determinant polynomials and different traces at `1`.
  The trace implication uses unital algebra actions; polynomial equality for arbitrary
  linear families does not imply it.
- `detCondition_siegel`: for the Siegel datum of genus `g`, `Det_{ℤ|V₀} = X^g` and `M` satisfies the
  condition iff it is locally free of rank `g`.
- `detCondition_char3_signature`: for `K = ℚ(i)`, a unitary datum of signature `(3, 0)` at `τ`
  (`F₀ = K`) and `S = Spec 𝔽₉` over `O_{K,(3)}`, the module `𝔽₉³` with `i` acting by `−τ(i)` has the
  same (zero) trace map as `V₀ ⊗ 𝔽₉` but fails the condition.
- `detCondition_zero`: for `V₀ = 0` the reference polynomial is `1`, `F₀ = ℚ`,
  and the condition says `M = 0`, also for a nonzero coefficient algebra.
- For `O = ℤ × ℤ` acting on the principal plane through the first projection,
  the reference polynomial is `X₁`; on a split test module it forces rank one
  on the first factor and rank zero on the second.
- `detCondition_baseChange_C`: over `S = Spec ℂ` the condition holds iff `M ≅ V₀` as `O ⊗ ℂ`-modules
  (M0.15).

### M0.19 The determinant condition over a splitting field

Prove `detCondition_splitting`. Let `□` be a finite set of primes not dividing `Disc`, `k` an
algebraically closed field over `O_{F₀,(□)}`, `F₀′/F₀` a finite extension unramified at `□` with an
`O ⊗ O_{F₀′}`-lattice `L₀` whose complexification is `V₀`, and `O_{F₀′,(□)} → k` compatible. Then a
finite-dimensional `O ⊗ k`-module satisfies the determinant condition iff it is isomorphic to
`L₀ ⊗ k`. No canonical model of `V₀` over `F₀` is asserted (Lan's thesis errata, p. 7, correcting
Lemma 1.2.5.10 and (1.2.5.15)). For a finite locally free module over a connected locally noetherian
base at good primes, the multiplicities can be read at one geometric point after a finite étale
splitting of `O`; on nonreduced bases the polynomial identity remains the definition, and pointwise
vanishing is not a substitute. The proof uses that at good primes `O ⊗ k` is a product of matrix
algebras (M0.3), so a full basis in the determinant polynomial detects all multiplicities (M0.15);
validity in positive characteristic needs `p ∤ Disc` (Lan, §1.3.4, p. 126). *Needs:* M0.3, M0.15,
M0.18.

**Checks.**

- `detCondition_splitting_siegel`: both conditions say `dim M = g`.
- `detCondition_splitting_picard`: for the Picard datum `(2, 1)` at a prime split in `K`, the condition
  is `M ≅ k² ⊕ k` with `O_K` acting through the two embeddings.

### M0.20 Self-dual lattices at good primes

Prove `selfDualLattice_unique`. Let `p ∤ I_bad · Disc`. (1) In Cases A and C, two self-dual symplectic
`O ⊗ ℤ_p`-lattices of the same multi-rank are isomorphic as symplectic modules, up to the scalar
identification `ℤ_p(1) ≅ ℤ_p`. (2) Fix `D : PIntegralPELDatum p` from M0.6, with algebra `B`,
rational module `V`, order `O_B`, pairing `⟨·,·⟩` and similitude group `G`. Put
`V_p = V ⊗ ℚ_p` and `Λ = D.Λ₀`, an `O_B ⊗ ℤ_p`-stable self-dual lattice in `V_p`.
Let `(V′, ⟨·,·⟩′)` be a nondegenerate skew-hermitian
`B ⊗ ℚ_p`-module isomorphic to `V_p` as a `B ⊗ ℚ_p`-module, with an
`O_B ⊗ ℤ_p`-stable self-dual lattice `Λ′ ⊆ V′`; in Case D assume `p ≠ 2`
and that the class of `V′` in `H¹(ℚ_p, G)` maps trivially to `H¹(ℚ_p, G/G°)`. Then there is an
isomorphism of skew-hermitian `B ⊗ ℚ_p`-modules `V_p ≅ V′` carrying `Λ` to `Λ′` (Kottwitz, Lemma 7.2,
pp. 395–396). (3) Consequently, with `p ≠ 2` in Case D, `G(ℚ_p)` acts transitively on the
`O_B ⊗ ℤ_p`-lattices in `V_p` that are self-dual up to a scalar in `ℚ_p^×` (Kottwitz, Corollary 7.3,
p. 396; Lan, Remark 1.4.4.2, p. 168). For an integral datum with faithful rationalized action,
the specialization `Λ = L ⊗ ℤ_p` requires `p ∤ I_bad · Disc · [L^# : L]` and uses
`IntegralPELDatum.toPIntegral` (M0.6). The proof applies Morita equivalence at the unramified maximal
order to the order-linear forms (not only to the underlying alternating matrices), uses the local
hermitian and skew-hermitian classification in Cases A and C, keeps `p ≠ 2` and the component class
in Case D, and lifts the residual isometry to the completed lattices by smoothness. *Needs:* M0.3,
M0.4, M0.6, M0.8; M0.9 (local Galois cohomology classes, for the hypothesis of (2)).

**Checks.**

- `selfDualLattice_siegel`: any two self-dual symplectic `ℤ_p`-lattices in `ℚ_p^{2g}` are
  `GSp_{2g}(ℚ_p)`-conjugate.
- `selfDualLattice_scaled`: `pL` is self-dual for the form scaled by `p⁻²`, so it lies in the same
  orbit; the lattice spanned by `e₁, f₁, e₂, pf₂` in `ℚ_p⁴` (elementary divisors `1, p`) is self-dual
  for no scaling of the form, so it is in no orbit of self-dual lattices.
- For odd `p`, take `B = ℚ`, `O = ℤ`, `L = ℤe₁ ⊕ ℤf₁ ⊕ ℤe₂ ⊕ ℤf₂`, with
  `ψ(e₁,f₁) = 1`, `ψ(e₂,f₂) = p` and all other cross-pairings zero. Although
  `I_bad = Disc = 1`, the completed lattice has `Λ^#/Λ ≅ (ℤ/p)²` and Gram determinant `p²`.
  The lattice `Λ′ = ℤ_p e₁ ⊕ ℤ_p f₁ ⊕ ℤ_p e₂ ⊕ ℤ_p(p⁻¹f₂)` is self-dual in the same rational
  space. A similitude carrying `Λ` to `Λ′` would force `0 = 4v_p(c) + 2`, impossible for
  `v_p(c) ∈ ℤ`. Thus the integral specialization needs the dual-index factor.

### M0.21 Signature constancy above a prime

Prove `bpsSignatureConstancy`. Let the datum be of type A or C as in Bijakowski–Pilloni–Stroh §1.1,
with centre `F`, `F₀ = F^{*=1}` of degree `d`, and let `p` satisfy their Hypothèse 1.1.1 (p. 980): `p`
unramified in `F₀` and, in type A, every place of `F₀` above `p` split in `F`; `B ⊗ ℚ_p` a product of
matrix algebras over unramified extensions; `O_B` maximal at `p`; the pairing perfect at `p`; and `p`
totally split in the reflex field `E`. Fix `ℂ ≅ ℂ_p`. In type A, for each real `τ : F₀ → ℝ`, order the two
embeddings `σ, σ̄` of `F` above `τ` so that `σ` lies above `π_i^+` (their Remarque 1.1.3, p. 981).
Then `(a_τ, b_τ) = (a_{τ′}, b_{τ′})` whenever `τ, τ′` lie above the same prime `π_i` of `F₀`.
In type C, `F = F₀` and the single multiplicity `a_τ` is the common value
`dim_ℚ U_ℚ / (2nd)` (their §1.1, p. 980, and Lemme 1.1.4, p. 981).
In type A the other ordering exchanges `a_τ` and `b_τ`, and the proof evaluates the determinant polynomial on
`diag(x−1, 0, …, 0) + Id = diag(x, 1, …, 1)` in the selected matrix factor
above `π_i^+` for `x ∈ O_{F, π_i^+}`, with the identity in every other factor, obtaining `∏_{τ_j ∈ Σ_i} σ_j(x)^{a_{τ_j}}`;
total splitting in `E` makes the determinant `ℤ_p`-valued on `O_B ⊗ ℤ_p`, which forces the exponents
to be constant along the Galois orbit `Σ_i`. *Needs:* M0.10, M0.13, M0.14, M0.16.

**Checks.**

- On a one-dimensional selected block at `x = 1`, the determinant is `1`;
  adding the identity to `diag(x,1,…,1)` would instead give `2` in rank one.
- `bpsSignatureConstancy_imagQuad`: for `F₀ = ℚ` (imaginary quadratic `F`) the statement is vacuous.
- `bpsSignatureConstancy_realQuad`: for `F₀` real quadratic with `p` inert, the two signatures above
  `p` coincide.
- `bpsSignatureConstancy_order`: exchanging the order of `σ, σ̄` exchanges `(a_τ, b_τ)` with
  `(b_τ, a_τ)`; a definition that ignores the ordering fails on signature `(2, 1)`.
- For the genus-`g` Siegel datum (type C), `F = F₀ = ℚ`, `n = d = 1` and
  `dim_ℚ U_ℚ = 2g`, so `a_τ = g`; there is one embedding above `τ` and no pair `π_i^±`.

### M0.22 Hermitian spaces over CM orders

Define `HermitianSpace`: for a CM field `F` with maximal totally real subfield `F⁺` and conjugation
`c`, a finite set `Σ⁺_bad` of places of `F⁺` containing those ramified in `F`, and an
`O_{F⁺}[(Σ⁺_bad)⁻¹]`-algebra `R`, a hermitian space of rank `N` over `O_F ⊗ R` is a projective
`O_F ⊗ R`-module `V` of rank `N` with a perfect pairing `(·,·)_V : V × V → O_F ⊗ R`, linear in the
first variable, `(c ⊗ id)`-semilinear in the second, with `(x, y)_V = (y, x)_V^c` (Liu–Tian–Xiao–
Zhang–Zhu, *On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives*, Definition 3.1.7,
p. 140). Define `HermitianSpace.unitaryGroup` (the `O_F ⊗ R`-linear isometries; its group-scheme
realization `HermitianSpace.coordinate` is the closed subgroup cut out by the adjoint equations, for
a finite étale coefficient algebra over `R` with involution fixing `R`) and `HermitianSpace.sharp`
(`V_♯ = V ⊕ (O_F ⊗ R)·1` with `(1, 1) = 1`, an orthogonal sum). The API is
`HermitianSpace.Isometry.sharp` (`f ↦ f_♯ = f ⊕ id`, with `(f ∘ g)_♯ = f_♯ ∘ g_♯`, `id_♯ = id`);
`HermitianSpace.unitaryGroup_le_sharp` (`U(V) ↪ U(V_♯)`); `HermitianSpace.toSkewHermitian` (over `ℚ`, for a
totally imaginary `δ ∈ F^×`, `⟨x, y⟩ = Tr_{F/ℚ}(δ(x, y)_V)` is a skew-hermitian structure with the same
unitary group, M0.23) and its finite-locally-free form `HermitianSpace.traceSkewHermitian` (for an
anti-invariant unit `δ`, `Tr_{A/R}(δH)` is a perfect skew-hermitian `R`-valued form); and
`HermitianSpace.unitaryGroup_matrix` (for the standard complex hermitian form, membership in Mathlib's
`Matrix.unitaryGroup` is `star U · U = 1`). *Needs:* M0.1; Mathlib `NumberField.IsCMField`,
`NumberField.IsCMField.complexConj`, `NumberField.maximalRealSubfield`, `Matrix.unitaryGroup`,
`Algebra.trace`.

**Checks.**

- `hermitianSpace_sharp_rank`: `V_♯` restricts to the original pairing on `V`, its new vector `1`
  satisfies `((x,a),1) = a` and `(1,(x,a)) = a^c`, and `rank V_♯ = rank V + 1`.
- `hermitianSpace_unitary_matrix`: for `V = F^N` with `Σ x_i ȳ_i`, `U(V)(F⁺)` is
  `Matrix.unitaryGroup (Fin N) F` for the star given by complex conjugation.
- `hermitianSpace_not_symmetric`: the product `xy` on `ℂ` is not conjugate-linear in the second
  variable (at `1` and `i`), so it is not hermitian.
- `hermitianSpace_trace_dictionary`: on `ℚ(i)` with `(x, y) = xȳ` and `δ = √−1`,
  `⟨x, y⟩ = Tr(√−1 x ȳ)` is alternating and satisfies `⟨ax, y⟩ = ⟨x, ā y⟩`.

### M0.23 Skew-hermitian spaces, GU and the norm-similitude torus

Define `SkewHermitianSpace`: for a CM field `F` and a `ℤ[(disc F)⁻¹]`-algebra `R`, a free
`O_F ⊗ R`-module `W` of rank `N` with an `R`-bilinear alternating perfect pairing `⟨·,·⟩_W` with
`⟨ax, y⟩_W = ⟨x, a^c y⟩_W` (Liu–Tian–Xiao–Zhang–Zhu, Definition 3.5.1, p. 156). Define
`SkewHermitianSpace.Similitude` (an `O_F ⊗ R`-linear isomorphism scaling the pairing by a unit
`c(f)`), `SkewHermitianSpace.Similar` (an equivalence relation), `SkewHermitianSpace.GU` (the
self-similitudes, with the multiplier existential as in that source, so the group of the zero space is
trivial, whereas the pair convention of M0.7 gives `G_m`; the two zero-rank functors are never
identified), and `cmTorus`, the torus `T₀ ⊆ Res_{O_F/ℤ} G_m ⊗ ℤ[(disc F)⁻¹]` with
`T₀(R) = {a ∈ (O_F ⊗ R) : N_{F/F⁺}(a) ∈ R^×}`. For a CM type `Φ`, define
`SkewHermitianSpace.HasCMType Φ` for a rank-one `W₀` over `O_F ⊗ ℤ_(p)`: `⟨ax, x⟩ ≥ 0` for all `x` and
all totally imaginary `a` with `Im τ(a) > 0` for `τ ∈ Φ` (published Definition 3.5.3, p. 157, with
`≥ 0`; the arXiv version's strict inequality fails at `x = 0`), with positive cone
`GeneralizedCMType.positiveImaginaryCone` (M0.25). The API is `SkewHermitianSpace.gu_rankOne`
(multiplication by `a` with `N(a)` the image of `c` is a self-similitude) and
`SkewHermitianSpace.gu_rankOneEquiv` (for a perfect rank-one finite étale CM module, `GU(W₀) ≅ T₀`,
identifying the multiplier with the norm); `SkewHermitianSpace.toIntegralPELDatum` (a rank-one
CM-type space with a full star-stable lattice on which the form is integral gives
the integral PEL datum with pairing `ψ_PEL = −⟨·,·⟩_W₀` and `J` whose
`+i`-eigenspace is `Φ`; arbitrary skew-hermitian data do not supply the lattice
and `J`). Negating the pairing preserves the similitude group and its multiplier;
source-to-PEL Betti and Tate comparisons negate both pairings and keep the
marking and multiplier.
*Needs:* M0.5, M0.7, M0.22; the primitive positive cone of M0.25;
Mathlib `NumberField.IsCMField`.

**Checks.**

- `cmTorus_points_imagQuad`: every nonzero complex scalar lies in `T₀(ℝ)` for an imaginary quadratic
  `F`, since its norm is a nonzero real.
- `gu_rankOne_multiplier`: on rank one, multiplication by `a ∈ T₀(R)` is a similitude with
  `c = a a^c`.
- For `F = ℚ(i)`, `p = 3`, `Φ(i) = i` and
  `⟨x,y⟩ = Tr(−i xȳ)`, `⟨i,1⟩ = 2` but `⟨1,i⟩ = −2`.
  The PEL pairing is its negative, so `ψ_PEL(1,J1) = 2` for `J = i`.
- `skewHermitian_type_flip`: if `W₀` has type `Φ`, then `(W₀, −⟨·,·⟩)` has type `cΦ` and not `Φ`.
- `skewHermitian_zero`: the zero space has trivial `GU` in this convention, while the pair convention
  gives `G_m`.

### M0.24 Rank-one skew-hermitian spaces and ker¹ of the CM torus

**Integral torsors of the CM torus.** Prove `cmTorus_integralH1_trivial`: if `p` is unramified
in the CM field `F`, the torus `T₀` of M0.23 has `H¹_fppf(ℤ_p, T₀) = 0`.
Its integral model is a smooth torus with geometrically connected special fibre. A torsor's
special fibre has an `𝔽_p`-point by ReductiveGroupsPartII RG2.3.7 `Lang.lang_surjective`
and its torsor-triviality consequence; smoothness lifts this point over the henselian ring
`ℤ_p`, giving a section. The generic-fibre restriction is therefore the trivial class.
(Source: Lang, *Algebraic groups over finite fields*, Theorem 1 and its homogeneous-space
corollary, pp. 556–558; Liu–Tian–Xiao–Zhang–Zhu, Remark 3.5.2, p. 156.)
*Needs:* M0.23; ReductiveGroupsPartII RG2.3.7; SchemeAndStackFoundations §0.14
(`henselian_smooth_lifting`, Stacks Tag 0H74).

**Checks.**

- For `F = ℚ(i)` and `p = 5`, `T₀,ℤ₅ ≅ G_m²` and its integral torsors are trivial.
- For `F = ℚ(i)` and `p = 3`, `T₀,ℤ₃ = Res_{W(𝔽₉)/ℤ₃} G_m` also has trivial integral `H¹`;
  splitting over `ℤ_p` is not required.
- The smooth disconnected group `μ₂/ℤ₃` has the nontrivial torsor `x² = 2`, whose special
  fibre has no rational point; connectedness is essential to the Lang argument.

Prove `rankOneSkewHermitian_classification`. Let `F` be CM, `p` unramified in `F` and `W₀` a rank-one
skew-hermitian space over `O_F ⊗ ℤ_(p)`. Then `GU(W₀) ≅ T₀ ⊗ ℤ_(p)` canonically, and the similarity
classes of rank-one `W₀′` with `W₀′ ⊗ 𝔸` similar to `W₀ ⊗ 𝔸` are in canonical bijection with
`ker¹(T₀) = ker(H¹(ℚ, T₀) → ∏_{v ≤ ∞} H¹(ℚ_v, T₀))`, a finite abelian group (Liu–Tian–Xiao–Zhang–Zhu,
Remark 3.5.2, p. 156). Everywhere locally similar forms are classified by `ker¹` of the automorphism
group by twisting (M0.9); integrality at `p` is harmless because `T₀` is smooth over `ℤ_(p)` with
`H¹(ℤ_p, T₀) = 0` (`cmTorus_integralH1_trivial`); finiteness is M0.9(3). If `F/F⁺` satisfies the Hasse norm theorem (it is
cyclic of degree two, ClassFieldTheory Layer 13 `isGlobalNorm_iff_isLocalNormEverywhere`,
the local-everywhere form of `cyclicHasseNorm`), `ker¹` of the norm-one torus
vanishes; `ker¹(T₀)` itself can be nontrivial. *Needs:* M0.23; M0.9;
`cmTorus_integralH1_trivial`; ClassFieldTheory Layer 13.

**Checks.**

- `rankOne_gu_torus`: `GU(W₀) ≅ T₀ ⊗ ℤ_(p)`, with multiplier the norm.
- `rankOne_normOne_trivial`: `ker¹` of the norm-one torus of `F/F⁺` is trivial (Hasse norm theorem).
- `rankOne_imagQuad`: for `F` imaginary quadratic, `T₀ = Res_{F/ℚ} G_m` and `ker¹(T₀) = 1` by Hilbert
  90 and the Hasse principle for `Res G_m`, so the class is unique.

### M0.25 Generalized CM types and their reflex fields

For a CM field `F` with maximal totally real subfield `F⁺`, fix a coefficient embedding
`τ_∞ : F ↪ ℂ` and write `τ̄_∞ = τ_∞|_{F⁺}` for its real restriction.
In the CM field constructions below, the unadorned subfield `F ⊆ ℂ` means `τ_∞(F)`
(Liu–Tian–Xiao–Zhang–Zhu, Ground fields, p. 119).

Define `GeneralizedCMType`: for a CM field `F` with set of complex embeddings `Σ_∞`, a finitely
supported `Ψ = Σ_τ r_τ τ ∈ ℕ[Σ_∞]` (Mathlib `Finsupp`) with `r_τ + r_{τ^c} = N` for all `τ`
(Liu–Tian–Xiao–Zhang–Zhu, Definition 3.3.1, p. 147). Its reflex field `GeneralizedCMType.reflexField`
is the fixed field of the stabilizer of `Ψ` in `Aut(ℂ/ℚ)` (computed in a finite Galois extension
containing all `τ(F)`). In rank one, every coefficient is at most one, so `Ψ` is the indicator
of a CM type supplied by ShimuraVarieties §5.1;
its type-reflex field agrees with that supplier's `TauCeti.CM.CMType.reflexField`. The API is
`GeneralizedCMType.galois_smul` (transport `τ ↦ σ ∘ τ`) and `GeneralizedCMType.galois_reflex`
(`z ∈ F_Ψ` iff `σ(z) ∈ F_{σΨ}`); `GeneralizedCMType.reflexField_eq_pel` (for a unitary PEL datum over
`F` with signature coefficients `Ψ`, `F_Ψ` equals the PEL reflex field `F₀`, because
`Tr(a | V₀) = Σ_τ p_τ τ(a)` and Dedekind independence identifies the stabilizers);
`GeneralizedCMType.nPhi_sub` (for `N ≥ 1` and a CM type `Φ` containing the fixed embedding `τ_∞`,
`NΦ − τ_∞ + τ_∞^c` is a generalized CM type of rank `N`); and
`GeneralizedCMType.positiveImaginaryCone` (for rank-one `Φ`, the anti-invariant `a`
with `Im τ(a) > 0` at every `τ` with coefficient one). The primitive type, cone,
type-reflex field and Galois laws use only ShimuraVarieties §5.1 and the number-field
inputs; `reflexField_eq_pel` is constructed after signatures and the PEL reflex field.
*Needs:* ShimuraVarieties §5.1; M0.13 and M0.16 only for `reflexField_eq_pel`; Mathlib
`NumberField.IsCMField`, `IntermediateField.fixedField`, `NumberField.ComplexEmbedding.conjugate`.

**Checks.**

- `gcmType_reflex_imagQuad`: for imaginary quadratic `F` and the rank-three type with coefficients
  `(2, 1)`, the reflex field is the image of the chosen embedding; for `(n−1)τ + τ̄` it is `F` when
  `n ≠ 2` and `ℚ` when `n = 2`.
- `gcmType_cm_rank1`: in rank one every coefficient is `0` or `1` and the type is a CM type.
- `gcmType_not`: for a quartic CM field, `τ₁ + τ̄₁ + 2τ₂ + τ̄₂` is not a generalized CM type
  (`r_{τ₁} + r_{τ̄₁} = 2` but `r_{τ₂} + r_{τ̄₂} = 3`).

### M0.26 The reflexive closure of a CM field

Define `CMField.reflexiveClosure F`: the subfield of `ℂ` generated by `F` and `⋂_Φ F_Φ`, the
intersection over all CM types `Φ` of `F` of their reflex fields (published Definition 3.3.2 and
Remark 3.3.3 of Liu–Tian–Xiao–Zhang–Zhu, p. 147; the arXiv versions used the composite of `F` with all
`F_Φ`, which is the Galois closure of `F`, a different field). Put `F_rflx⁺ = (F_rflx)^{c=1}`
(`CMField.realSubfield`). The API is `CMField.reflexiveClosure_isCM` (it is CM: `⋂_Φ F_Φ` is Galois
over `ℚ` because the set of CM types is `Aut(ℂ/ℚ)`-stable, and is CM or totally real);
`CMField.reflexiveClosure_galois` (finite Galois over `F`); `CMField.reflexiveClosure_real_galois`
(`F_rflx⁺` is its maximal totally real subfield and is finite Galois over `F⁺`);
`CMField.reflexiveClosure_eq_of_galois` (`F` Galois over `ℚ` gives `F_rflx = F`, since then every
`F_Φ ⊆ F`); `CMField.reflexiveClosure_eq_of_imagQuad` (`F` containing an imaginary quadratic `K` gives
`F_rflx = F`, since the type induced from `K` has reflex field `K ⊆ F`); and
`CMField.reflexiveClosure_le_galoisClosure`. *Needs:* M0.25; Mathlib `IntermediateField.normalClosure`.

**Checks.**

- `reflexiveClosure_imagQuad`: `ℚ(√−5)` is its own reflexive closure.
- `reflexiveClosure_galois`: `ℚ(ζ₅)` is its own reflexive closure.
- `reflexiveClosure_not_intersection_alone`: for `F = ℚ(√2, i)` the CM types are induced from `ℚ(i)`
  or `ℚ(√−2)`, so `⋂_Φ F_Φ = ℚ`, while `F_rflx = F`; omitting `F` from the definition gives the wrong
  field.

### M0.27 `τ`-parts at an unramified prime

Define, for a CM field `F` with M0.25's fixed coefficient embedding `τ_∞ : F ↪ ℂ`, a prime `p`
unramified in `F` and a fixed `ι_p : ℂ ≅ ℚ̄_p` (so that `Σ_∞` is also the set of `p`-adic embeddings):
`tauField τ` (the composite `ℚ_p^τ` of `τ(F)` and `ℚ_p`,
unramified, with integers `ℤ_p^τ` and residue field `𝔽_p^τ`); `diamondField` (`ℚ_p^◇`, the composite
of all `ℚ_p^τ`); `psiField Ψ` (`ℚ_p^Ψ = ℚ_p · τ_∞(F) · F_Ψ ⊆ ℚ_p^◇`, with both complex subfields
transported by `ι_p`); and `tauPart` / `tauSubmodule`
(for an `O_S`-module `ℱ` with commuting `O_F`-action over a `ℤ_p^τ`-scheme, `ℱ_τ` is the largest
submodule on which `O_F` acts through `τ`) (Liu–Tian–Xiao–Zhang–Zhu, Notation 3.3.6, p. 148, and
Remark 3.4.6, p. 150). Since `τ_∞^c(F) = τ_∞(F)`, both distinguished `tauField`s lie in
`psiField Ψ`, so a `ℤ_p^Ψ`-scheme has both labelled parts. Other embeddings can require larger
coefficient rings. The API is `unramifiedTauDecomposition` (`ℤ_p^◇ ⊗ O_F ≅ ∏_{τ} ℤ_p^◇`, by
evaluation, because `p` is unramified); `tauPart_decomp` and `tauPart_decomp_linear` (over a
`ℤ_p^◇`-scheme every `O_F ⊗ O_S`-module is `⊕_τ ℱ_τ`, also on nonreduced bases, through the
idempotents of the finite étale splitting); `frobeniusOnEmbeddings` (the action of Frobenius `σ` on
`Σ_∞ = Hom(O_F, 𝔽_p^◇)`); and `tauPart_frobeniusTwist` (over a perfect residue field the `τ`-part of
the Frobenius twist is the Frobenius pullback of the `τ′`-part, where Frobenius sends `τ′` to `τ`).
*Needs:* the primitive generalized CM type and type-reflex field of M0.25;
LocalFieldsRamification Layer 2 (finite unramified extensions, integer rings, residue
fields, Frobenius).

**Checks.**

- `tauField_split`: if the `p`-adic embedding lands in `ℚ_p`, the generated field is `ℚ_p`.
- `tauField_inert`: for `F = ℚ(i)` and `p ≡ 3 mod 4`, `ℚ_p^τ = ℚ_{p²}` has degree two over `ℚ_p` and
  Frobenius swaps `τ, τ̄`; for `p ≡ 1 mod 4`, `ℚ_p^τ = ℚ_p` and Frobenius fixes each `τ`.
- `tauPart_ramified`: for `ℤ[i]` at `p = 2` (ramified), an element on which the uniformizer acts
  nontrivially but which `τ` sends to zero is in no `τ`-eigensummand; the decomposition needs `p`
  unramified.
- `tauPart_zero`: every `τ`-part of `0` is `0`.
- `tauComposite_quadratic`: for `F = ℚ(i)` and `p ≡ 3 mod 4`, both conjugate
  `tauField`s and `diamondField` are `ℚ_{p²}`. For the zero generalized CM type
  the reflex field is `ℚ`, but `psiField` is still `ℚ_{p²}` because its definition
  retains `F`; omitting that factor gives the wrong field.
- `tauComposite_degrees`: if the residue degrees in a non-Galois CM field at an
  unramified prime include `2` and `3` and all divide `6`, `diamondField` has
  degree `6` over `ℚ_p`; choosing one `tauField` would give degree `2` or `3`.
  For any `Ψ`, the residue degrees of the selected embeddings of `F` and `F_Ψ`
  determine `psiField` by the same least-common-multiple calculation.
- `tauComposite_mixedQuartic`: let `F = ℚ(α)`, `α² = −3 − √2`, `F⁺ = ℚ(√2)` and `p = 17`.
  The polynomial `X⁴ + 6X² + 7` has discriminant `7168` and reduces to
  `(X − 5)(X + 5)(X² − 3)`, with `3` a nonsquare modulo `17`. Choose `ι_p` so that
  `τ₀(α)` reduces to `5`; the other conjugate pair `τ₁, τ₁^c` generates the unramified
  quadratic extension `K₂/ℚ₁₇`. For `Ψ = 2τ₀ + 0τ₀^c + τ₁ + τ₁^c`, its stabilizer fixes
  exactly the field `τ₀(F)`, so `F_Ψ = τ₀(F)`. With coefficient embedding `τ_∞ = τ₀`,
  `psiField Ψ = ℚ₁₇` while `tauField τ₁ = K₂`. The factor `O_{K₂}` in
  `O_F ⊗ ℤ₁₇ ≅ ℤ₁₇ × ℤ₁₇ × O_{K₂}` has no two labelled scalar eigensummands over
  `ℤ₁₇` or `𝔽₁₇`. Choosing coefficient embedding `τ_∞ = τ₁` instead gives `psiField Ψ = K₂`.

### Examples

- The Siegel datum: type C, `I_bad = 1`, `Disc = 1`, `[L^# : L] = 1`, reflex field `ℚ`, signature
  `(g, g)`, `G = GSp_{2g}`, the determinant condition is `rank = g` (M0.2–M0.18).
- The Picard datum over `K = ℚ(√−3)` with signature `(2, 1)`: type A, reflex field `K`, `D` the torus
  `{N(x) = t³}`, and the determinant condition at a split prime is `M ≅ k² ⊕ k` (M0.8, M0.16, M0.19).
- A definite quaternion algebra over `ℚ`: type D, `I_bad = 2`, `G` with two components (M0.2, M0.8,
  M0.10).

### Dependencies

Mathlib and Tau Ceti as listed above; TauCetiRoadmap.AdelicAlgebraicGroups Layer 1,
TauCetiRoadmap.ReductiveGroups Layers 3 and 6, TauCetiRoadmap.ClassFieldTheory Layer 13,
TauCetiRoadmap.LocalFieldsRamification Layer 2, TauCetiRoadmap.NumberFieldArithmetic,
TauCetiRoadmap.ProfiniteArithmetic Layer 0; ShimuraVarieties §§P.1–P.5 and §5.1;
ReductiveGroupsPartII RG2.3.7; AbelianSchemesAndArithmeticModuli A5.4(1), A6.15; Tau Ceti continuous Hilbert 90.

## Layer M1: Relative PEL families, levels and descent

M1 builds relative triples before choosing a level. Quasi-isogenies are locally invertible
sections of sheafified localized relative Hom for actual abelian schemes; a positive quasi-polarization is cleared by a positive
locally constant integer. Integral families carry actual prime-to-`□` polarizations and integral
order actions; rational families carry localized actions, positive rational polarization classes and
quasi-isogeny morphisms. Levels are monodromy-invariant orbits of actual Tate similitudes, and
principal levels keep a completed lift and the multiplier.

### M1.1 Prime-to-□ quasi-isogenies and quasi-polarizations

For abelian schemes over any base `S` and a localization `ℤ ⊆ D ⊆ ℚ`, define
`RelativeLocalizedHom D A A′` as the fppf sheafification of
`T ↦ Hom_T(A_T, A′_T) ⊗ D`. Composition and duality extend locally and descend.
Define `QuasiIsogeny A A′` as the locally invertible sections for `D = ℚ`;
`QuasiIsogeny.Class` identifies local fraction presentations when their integral numerators
agree after clearing denominators. Locally these are spans `A ← B → A′` of isogenies
(Lan, Definitions 1.3.1.14–1.3.1.15, pp. 110–111), with inverse obtained by exchanging the legs.
`QuasiIsogeny.IsPrimeTo □` means invertibility in `RelativeLocalizedHom ℤ_(□) A A′`,
equivalently local representability by prime-to-`□` spans. Composition, inverse and dual
make these sections a groupoid (`QuasiIsogeny.comp`). Denominators are local and can be
unbounded across infinitely many components. Compare with AbelianSchemesAndArithmeticModuli
A6.26's global localized category only after establishing a common denominator, as over
quasi-compact bases; this comparison does not change that supplier's category.
Define `BoxPolarization` (a `ℤ_(□)^×`-polarization): a symmetric
prime-to-`□` quasi-isogeny `λ : A ⇢ A^∨` such that `[N] ∘ λ` is an actual polarization for a positive
locally constant integer `N` locally on `S` (Lan, Definition 1.3.2.27, p. 121).
Every localized order action and quasi-polarization in M1.3, M1.8 and M1.9 uses
`RelativeLocalizedHom`; positivity and clearing denominators are local conditions,
and scalar polarization factors are locally constant positive units of the coefficient ring.
The API is `QuasiIsogeny.dual`
(`f ↦ f^∨` through spans, with `(f ∘ g)^∨ = g^∨ ∘ f^∨`, `id^∨ = id`; Lan, Definition 1.3.2.24);
`QuasiIsogeny.ofIsogeny` (an isogeny, in particular Tau Ceti's `AbelianVariety.IsIsogeny` over a
field, is a quasi-isogeny); `BoxPolarization.pullback` (`f^∨ ∘ λ ∘ f` for prime-to-`□` `f`);
`BoxPolarization.inverse` and `BoxPolarization.inv_pos` (the positive inverse quasi-polarization on
the dual through the canonical bidual identification; Lan, Corollary 1.3.2.25, using pullback of
relatively ample sheaves along isogenies); and the variant of Liu–Tian–Xiao–Zhang–Zhu for `□ = {p}`,
`QuasiIsogeny.IsQuasiP` (locally `cφ` is a homomorphism or isogeny for some `c ∈ ℤ_(p)^×`), with
`QuasiIsogeny.primeTo_iff_both_quasiP` (prime to `p` exactly when `φ` and `φ⁻¹` are quasi-`p`) and
`p`-principal quasi-polarizations (Definition 3.4.5, pp. 149–150). *Needs:* AbelianSchemesAndArithmeticModuli
A2 (dual, Poincaré bundle, polarizations), A3 (isogenies, dual isogenies, `[n]`), A6.26–A6.27
(localized Hom); Tau Ceti `AbelianVariety.IsIsogeny`.

**Checks.**

- On `S = ⨿_{n≥1} Spec ℂ`, let `A = E × S`, `End(E) = ℤ`, and `f|_{S_n} = [2^n]`.
  The sheafified rational Hom contains its inverse `(2^{−n})_n`;
  `(∏_n ℤ) ⊗ ℚ` does not, because it requires a bounded common denominator.
  With `D = ℤ[1/2]` the same example distinguishes sheafification from A6.26.
- `quasiIsogeny_mulBy`: for positive `n`, `[n]/n` is the identity quasi-isogeny; `[n]` is prime to `□`
  iff `n` is when `A` has positive relative dimension; for the zero abelian scheme
  every `[n]` is the identity and prime to every `□`.
- `quasiIsogeny_id`: `id_A` is prime to every `□`; for `□ = ∅` every quasi-isogeny is prime to `□`.
- `quasiIsogeny_frobenius_not_primeTo`: the relative Frobenius `E → E^{(p)}` of an elliptic curve over
  `𝔽_p` has degree `p` and is not prime to `□` when `p ∈ □`.
- `boxPolarization_neg`: for positive-dimensional `A`, `−λ` is not positive (on the zero abelian
  scheme `λ = −λ`, so the check needs positive dimension).
- `boxPolarization_elliptic`: every symmetric positive rational quasi-polarization of an elliptic curve
  is a positive rational multiple of the canonical principal polarization.

### M1.2 PEL-type abelian schemes

Define `PELTriple`: for an integral PEL datum, a set `□` of good primes and a locally noetherian
scheme `S` over `S₀ = Spec O_{F₀,(□)}`, a triple `(A, λ, i)` with `A` an abelian scheme over `S`,
`λ : A → A^∨` an actual prime-to-`□` polarization (not a quasi-isogeny class: Lan's thesis
Definitions 1.4.1.2 and 1.4.1.4 call it a polarization, and both the thesis errata, p. 10, and the
published-book errata, p. 1, specify the actual polarization for the integral problem),
`i : O → End_S(A)` a ring homomorphism with the Rosati condition `i(b)^∨ ∘ λ = λ ∘ i(b*)` (Lan,
Definition 1.3.3.1, p. 122), and `Lie_{A/S}` with its `O ⊗ ℤ_(□)`-action satisfying the determinant
condition M0.18 (Lan, Definition 1.4.1.4, pp. 149–150; Kottwitz's triples, §5, p. 390). Morphisms
`(A, λ, i) → (A′, λ′, i′)` are isomorphisms `f : A → A′` with `λ = f^∨ ∘ λ′ ∘ f` and
`f ∘ i(b) = i′(b) ∘ f` (`PELTriple.Hom`, a groupoid). `PELModuli.Triple` is the relative version over
every test scheme, with pullback. The API is `PELTriple.rosati`; `PELTriple.detCondition`;
`PELTriple.pullback` (along `T → S`, with the coherence `(g ∘ f)^* ≅ f^* g^*`); `PELTriple.relDim`
(`rel.dim A = dim_ℂ V₀`, from the determinant condition); `PELTriple.siegel` (for `O = ℤ` the
determinant condition is `rank Lie = g`); and `PELTriple.toAbelianVariety` (over `Spec k`, `A` is a Tau
Ceti `AbelianVariety k` with `i : O → AbelianVariety.End A`). Over `ℂ` a triple gives the polarized
Hodge structure `H₁(A, ℚ)` with `B`-action and `V^{−1,0} ≅ Lie A ≅ V₀` (Kottwitz, §8). *Needs:* M0.5,
M0.18, M1.1; AbelianSchemesAndArithmeticModuli A1, A2, A4 (Lie algebra); Tau Ceti `AbelianVariety`,
`AbelianVariety.End`.

**Checks.**

- `pelTriple_siegel`: for the genus-one `ℤ`-datum the determinant condition is `rank Lie = 1`.
- `pelTriple_rosati_fails`: for the Gaussian order with `* = ` conjugation, the Rosati equation pairs
  `i(√−1)` with `i(−√−1)`; with the identity involution it fails for a CM elliptic curve.
- `pelTriple_zero`: the constant determinant polynomial `1` forces `Lie = 0` over a nonzero base.
- `pelTriple_det_picard`: a nonzero homogeneous determinant polynomial of degree three forces
  `rank Lie = 3`; the `τ`-ranks are fixed by the signature.

### M1.3 Unitary `O_F`-abelian schemes and signature type

Define, for a CM field `F`, a subring `P ⊆ ℚ` and a `P`-scheme `S`: `LocalizedOFAbelianScheme`
(`(A, i)` with `i : O_F → RelativeLocalizedHom P A A` unital) and its integral-action case `OFAbelianScheme`;
`LocalizedUnitaryOFAbelianScheme` (`(A, i, λ)` with `λ` a quasi-polarization in the sheafified
localized Hom, `i(a^c)^∨ ∘ λ = λ ∘ i(a)`, and `cλ` a polarization locally for a positive
coefficient unit `c ∈ P^×`) and its
positive-integral case `UnitaryOFAbelianScheme` (Liu–Tian–Xiao–Zhang–Zhu, Definition 3.4.2, p. 148).
For a generalized CM type `Ψ = Σ r_τ τ` of rank `N` and `S` over `O_{F_Ψ} ⊗ P`, define
`HasSignatureType Ψ`: for every finite family in `O_F` the determinant polynomial of its action on
`Lie_{A/S}` equals `∏_τ (linear form of τ)^{r_τ}`; in particular
`charpoly(i(a) | Lie) = ∏_τ (T − τ(a))^{r_τ}` (Definition 3.4.3, p. 149; checking characteristic polynomials of single
elements over a finite residue field is not enough). The API is `HasSignatureType.iff_detCondition`
and `LocalizedOFAbelianScheme.iff_detCondition` (for `p` unramified in `F`, signature type `Ψ` is the
Kottwitz condition of the unitary datum of signature `Ψ`, M0.18); `HasSignatureType.dim` and
`LocalizedOFAbelianScheme.dim` (`dim A = N[F⁺ : ℚ]`); `HasSignatureType.hodge_tau` and
`LocalizedUnitaryOFAbelianScheme.hodge_tau` (over `S ∈ Sch/ℤ_p^τ` with `p` unramified, the homological
Hodge sequence `0 → ω_{A^∨/S,τ} → H^dR_1(A/S)_τ → Lie_{A/S,τ} → 0` has locally free terms of ranks
`N − r_τ`, `N`, `r_τ`; Remark 3.4.6, p. 150) with
`LocalizedUnitaryOFAbelianScheme.hodge_sequence_exact`; `UnitaryOFAbelianScheme.pairingTau` and
`LocalizedUnitaryOFAbelianScheme.pairingTau` (the pairing
`⟨·,·⟩_{λ,τ} : H^dR_1(A/S)_τ × H^dR_1(A/S)_{τ^c} → O_S` induced by `λ`, Notation 3.4.7, p. 150) with
`pairingTau_perfect` (perfect when `λ` is `p`-principal; no converse); and
`UnitaryOFAbelianScheme.toPELTriple` (after clearing a positive quasi-polarization to an ample integral
one and supplying the prime-to-`□` and determinant conditions, an integral triple of M1.2; a general
localized quasi-polarization belongs to the rational problem M1.8). The ranks of `τ`-parts come from
`H^dR_1` being locally free of rank `N` over `O_F ⊗ O_S` (M0.27; AbelianSchemesAndArithmeticModuli
A4.3, with homological `H^dR_1` the dual of `H¹_dR`). *Needs:* M0.22, M0.23, M0.25, M0.27, M1.2;
AbelianSchemesAndArithmeticModuli A4.3.

**Checks.**

- `signatureType_cm_elliptic`: an elliptic curve over `ℂ` with CM by `O_K`, normalized so that
  `i(a)` acts on `Lie E` by `τ(a)`, has signature type `τ` (`r_τ = 1`, `r_τ̄ = 0`).
- `signatureType_conj`: on a rank-one complex Lie module the characters `τ` and `τ̄` are
  distinct: for `K = ℚ(i)` their values on `i` are `i` and `−i`. Hence they cannot both describe it.
- `signatureType_iff_det`: for `p` unramified in `F` and `S` over `ℤ_p^◇`, signature type `Ψ`,
  `rank Lie_τ = r_τ` for all `τ`, and the M0.18 condition are equivalent.
- `unitary_zero`: `(0, 0, 0)` is a unitary `O_F`-abelian scheme of the zero signature type of rank 0.

### M1.4 The pro-system of symplectic Tate trivializations

Define `symplecticIsomSheaf` as a pro-object in finite étale `S`-schemes for a PEL triple
`(A, λ, i)` over a connected locally noetherian `S₀`-scheme `S`. Index by positive integers `n`
prime to `□`, ordered by divisibility. Its term `I_n` is the open-and-closed finite étale subscheme
of `Isom((L/nL)_S, A[n]) × Isom(((ℤ/n)(1))_S, μ_n)` cut out by `O`-linearity and
`e_n^λ(α_n x, α_n y) = ν_n(⟨x,y⟩ mod n)`, with reduction maps for `m | n`.
The source is the pro-constant coefficient system `((L/nL)_S, ((ℤ/n)(1))_S)`;
the target Tate systems are `(A[n])_n` and `(μ_n)_n`. The pairing comes from
AbelianSchemesAndArithmeticModuli A4.1 `AbelianTate.dualPairing`, composed with `T(λ)`;
its finite terms are A3.7's polarized Weil pairings. The roots of unity are Tau Ceti
`RootsOfUnityGroup.groupScheme` (Lan, Definition 1.3.6.1, pp. 132–134, and Definition 1.3.7.4,
pp. 141–142; Kottwitz, §5, p. 390).

The geometric-fibre functor sends this pro-object to the profinite set
`lim_n I_n(s̄)`, taking finite geometric fibres before the inverse limit. Its elements are pairs
`(α̂, ν(α̂))` of continuous `O`-linear isomorphisms `L ⊗ Ẑ^□ ≅ T^□A_{s̄}` and
`Ẑ^□(1) ≅ T^□G_{m,s̄}` preserving the pairings with that multiplier. This definition retains the
finite systems; it does not identify their profinite fibre with the stalk of their inverse limit
in ordinary small-étale sheaves.
The API is `symplecticIsomSheaf.act` (the continuous right `G(Ẑ^□)`-action on the pro-system,
with `ν(α̂ g) = ν(α̂) ν(g)`); `symplecticIsomSheaf.torsor` (a nonempty profinite geometric fibre is a
continuous `G(Ẑ^□)`-torsor, Lan, Definition 1.1.4.11 and §1.3.5);
`symplecticIsomSheaf.galois` (the continuous left `π₁(S, s̄)`-action on that fibre, commuting with
the right action); `symplecticIsomSheaf.reduce` (projection to `I_n(s̄)`, whose image is precisely
the liftable finite pairs of M1.5). This image is a `π₁`-stable finite subset, hence defines an
ordinary finite étale subscheme of `I_n`; its finite orbit sheaves are the carriers in M1.6.
The API also includes `symplecticIsomSheaf.rational` (on geometric fibres, the continuous
similitude torsor from `V ⊗ 𝔸^{∞,□}` to `V^□A_{s̄}`, with its Tate-twist multiplier and
`G(𝔸^{∞,□})`-action, formed by rationalizing the Tate representations); and
`symplecticIsomSheaf.baseChange` (termwise pullback of the finite étale schemes, inducing the
canonical comparison of profinite geometric fibres and restriction of monodromy).
*Needs:* M0.7, M1.2; AbelianSchemesAndArithmeticModuli A3.7, A4.1;
EtaleCohomologyFoundations §F.0.2 `VanishingCycles.finiteEtaleGaloisCategory`;
Tau Ceti `RootsOfUnityGroup.groupScheme`; Mathlib `Scheme.etaleTopology`.

**Checks.**

- For a principally polarized elliptic curve over `ℂ` at `n = 3`, the finite
  similitude-trivialization fibre has `|GL₂(𝔽₃)| = (9−1)(9−3) = 48` elements.
  Each basis determines its multiplier by the nondegenerate Weil pairing; each fixed
  multiplier has `24` bases.
- For the type-`(3)` plane and `λ = 3λ_can` at `n = 3`, both reduced pairings are zero.
  Fix the reduction `α₃` of a completed similitude with multiplier `ν₀`. The finite
  pair `(α₃,2ν₀)` obeys the zero pairing equation but has no completed lift: relative
  to the first lift, a change of basis congruent to `Id` has determinant `1 mod 3`,
  and hence cannot change the multiplier by `2 mod 3`.
- At `□ = ∅`, `n = 1`, a principal lattice and an elliptic curve with
  `λ = 2λ_can` have trivial finite level modules. No completed symplectic similitude
  exists: the determinant of the pairing has `2`-adic valuation `0` on the lattice
  and `2` on the Tate module. Thus there is no principal level-1 structure.
- `symplecticIsom_relative_torsor`: for invertible `n` and a geometric section, the sheaf of
  similitudes `(L/nL) ≅ A[n]` is a torsor under the finite group `G(ℤ/n)`.
- Over `Spec ℚ`, for every prime `ℓ` and finite extension `K/ℚ`,
  `lim_r μ_{ℓ^r}(K) = 0`, since `K` has only finitely many roots of unity and the transitions are
  `ℓ`th powers. The inverse limit as ordinary small-étale sheaves therefore has zero stalk,
  whereas the profinite geometric fibre is `lim_r μ_{ℓ^r}(ℚ̄) = ℤ_ℓ(1)`.
- `symplecticIsom_relative_monodromy`: monodromy commutes with the similitude action on the
  profinite geometric fibre, so an open-compact-level orbit descends exactly when it is
  monodromy-invariant.
- `symplecticIsom_relative_empty`: if there is no similitude between the torsion modules, the fibre is
  empty (for instance when `ker λ` and `L^#/L` differ).
- `symplecticIsom_siegel`: for the Siegel datum over `Spec k`, the fibre is the set of symplectic bases
  of `T^□A` up to the multiplier, a `GSp_{2g}(Ẑ^□)`-torsor when nonempty.

### M1.5 Principal level structures

Define `PrincipalLevel n`: for `n ≥ 1` prime to `□` and a PEL triple with `λ` prime to `□` and
`i : O → End_S(A)`, a pair `(α_n, ν(α_n))` of an `O`-linear isomorphism `α_n : (L/nL)_S ≅ A[n]` and an
isomorphism `ν(α_n) : ((ℤ/n)(1))_S ≅ μ_{n,S}` such that at every geometric point `s̄` there is an
`O`-equivariant symplectic `(α̂, ν(α̂)) : L ⊗ Ẑ^□ ≅ T^□A_{s̄}` reducing to `(α_n, ν(α_n))` mod `n`
(liftability; Lan, Definition 1.3.6.1, pp. 133–134). The multiplier is part of the datum: the mod-`n`
pairing alone does not determine it where `L` is not self-dual (for `L = ℓ·L_std` and `n = ℓ` the
reduced form vanishes), and it is pinned only through liftability. The API is
`PrincipalLevel.symplectic` (`e^λ_n(α_n x, α_n y) = ν_n(⟨x, y⟩ mod n)`); `PrincipalLevel.liftable`
(liftability at all geometric points, equivalently at one point per connected component, because the
lifts form a `π₁`-stable set; Lan, Corollary 1.3.6.7); `PrincipalLevel.ker_polarization` (at each
geometric point, liftability identifies `ker λ` with `(L^#/L) ⊗ Ẑ^□`; Lan, Remark 1.3.6.2, p. 134; at
`n = 1` this is fibrewise and gives no global trivialization of `ker λ`); `PrincipalLevel.pullback`;
`PrincipalLevel.reduce` (to level `m | n`); `PrincipalLevel.act` (the completed group `G(Ẑ^□)` acts
through its reduction; a finite similitude acts only with a completed lift); and
`PrincipalLevel.multiplier_data`. *Needs:* M1.2, M1.4; AbelianSchemesAndArithmeticModuli A3 (`A[n]`
finite étale for invertible `n`); Tau Ceti `RootsOfUnityGroup.groupScheme`.

**Checks.**

- For a principally polarized elliptic curve over `ℂ` at `n = 3`, the finite
  similitude-trivialization fibre has `|GL₂(𝔽₃)| = (9−1)(9−3) = 48` elements.
  Each basis determines its multiplier by the nondegenerate Weil pairing; each fixed
  multiplier has `24` bases.
- For the type-`(3)` plane and `λ = 3λ_can` at `n = 3`, both reduced pairings are zero.
  Fix the reduction `α₃` of a completed similitude with multiplier `ν₀`. The finite
  pair `(α₃,2ν₀)` obeys the zero pairing equation but has no completed lift: relative
  to the first lift, a change of basis congruent to `Id` has determinant `1 mod 3`,
  and hence cannot change the multiplier by `2 mod 3`.
- At `□ = ∅`, `n = 1`, a principal lattice and an elliptic curve with
  `λ = 2λ_can` have trivial finite level modules. No completed symplectic similitude
  exists: the determinant of the pairing has `2`-adic valuation `0` on the lattice
  and `2` on the Tate module. Thus there is no principal level-1 structure.
- `principalLevel_relative_pairing`: a lifted principal structure preserves the torsion Weil pairing
  with its multiplier.
- `principalLevel_relative_lift`: a compatible completed lift reduces to the prescribed finite
  structure.
- `principalLevel_relative_kernel`: at every geometric point `ker λ ≅ (L^#/L) ⊗ Ẑ^□`.
- `principalLevel_multiplier_scaled`: for a degenerate finite pairing two different units satisfy the
  same scaling equation; only liftability retains the multiplier.
- `principalLevel_siegel_g1`: for `g = 1` and `L` self-dual, `α_n` is a basis `(P, Q)` of `E[n]` and
  `ν(α_n)` is determined by `e_n(P, Q)`.

### M1.6 Integral and rational level structures

Define, for an open compact `H ⊆ G(Ẑ^□)`, `IntegralLevel H`: a compatible family over `n` prime to `□`
with `U^□(n) ⊆ H` of `H/U^□(n)`-orbits `α_{H_n}` of étale-locally defined principal level-`n`
structures, each represented by a closed subscheme of
`Isom_S((L/nL)_S, A[n]) × Isom_S((ℤ/n)(1)_S, μ_n)` (Lan, Definition 1.3.7.8, p. 143; the family is
determined by one member, Remark 1.3.7.9 and Corollary 1.3.7.7). For an open compact
`H ⊆ G(𝔸^{∞,□})` define `RelativeRationalLevel H`: on each connected component with geometric point
`s̄`, a `π₁(S, s̄)`-invariant `H`-orbit `[α̂]_H` of `O`-linear symplectic similitudes
`α̂ : V ⊗ 𝔸^{∞,□} ≅ V^□A_{s̄}`, independent of `s̄` by transport (Kottwitz, §5, pp. 390–391). The API
is `IntegralLevel.rationalize` (every integral structure gives a rational one, by lifting a
finite-level representative in a geometric fibre after a finite étale cover trivializing `α_{H_n}`;
Lan, Construction 1.3.7.10; no full Tate trivialization is chosen);
`RelativeRationalLevel.integral_iff` (for `H ⊆ G(Ẑ^□)` a rational
orbit comes from a unique integral structure iff some, equivalently every, `α̂` in it maps `L ⊗ Ẑ^□`
onto `T^□A_{s̄}` and `Ẑ^□(1)` onto `T^□G_m`; Lan, Corollary 1.3.7.11, p. 144);
`RelativeRationalLevel.basepointIndep` (two geometric points give a canonical bijection of invariant
orbit sets; Lan, Corollary 1.3.7.13; the full trivialization torsors need not be canonically
identified); `IntegralLevel.ofPrincipal` (for `H = U^□(n)` this is `PrincipalLevel n`; Lan, Remark
1.4.1.6); `RelativeRationalLevel.changeLevel` (enlarging orbits along inclusions of levels); and
`IntegralLevel.pullback`. *Needs:* M0.7, M1.4, M1.5; Mathlib `IsDedekindDomain.FiniteAdeleRing`.

**Checks.**

- `level_full_unique`: for `H = G(Ẑ^□)` and a liftable triple the level-`H` structure exists and is
  unique.
- `level_principal_eq`: for `H = U^□(n)`, `IntegralLevel H` is equivalent to `PrincipalLevel n`.
- `rationalLevel_not_integral`: take the principal genus-one datum, `S = Spec ℂ`, `□ = {2}`,
  `H = GSp₂(Ẑ^□) = GL₂(Ẑ^□)`, and an elliptic curve with `λ = 3λ_can`, of degree `9`.
  An integral marking `(α₀,ν₀)` for `λ_can` gives the rational marking `(α₀,3ν₀)` for `λ`.
  Every representative `(α₀h,3ν₀ det(h))`, `h ∈ H`, maps `L ⊗ Ẑ^□` onto `T^□E`.
  Its multiplier at `3` has valuation `1` and maps `ℤ₃(1)` onto `3T₃G_m`, so no
  representative preserves both integral lattices, as required by `integral_iff`.
- `rationalLevel_change_compose`: `changeLevel` along `H″ ⊆ H′ ⊆ H` is `changeLevel` along `H″ ⊆ H`.

### M1.7 The PEL moduli problem `M_H`

Define `PELModuli.moduliProblem H` (written `M_H`): for an integral datum, a set `□` of good primes,
`S₀ = Spec O_{F₀,(□)}` and an open compact `H ⊆ G(Ẑ^□)`, the category fibred in groupoids over
locally noetherian `S₀`-schemes whose fibre over `S` has objects `(A, λ, i, α_H)` — a PEL triple of
M1.2 with an integral level-`H` structure — and morphisms the isomorphisms `f : A → A′` with
`λ = f^∨ λ′ f`, `f i(b) = i′(b) f` and `α_{H_n} = (f|_{A[n]} × id)^* α′_{H_n}` for one, equivalently
every, `n` (Lan, Definition 1.4.1.4, pp. 149–150). `M_n = M_{U^□(n)}`. It is assembled as a
pseudofunctor of groupoids on the opposite category of test schemes (`moduliProblem.obj` is the
groupoid of triples with descended integral level, not a set of fibrewise coordinates). The API is
`PELModuli.moduliProblem.isFibered` (Mathlib `Functor.IsFibered`); `moduliProblem.principal`
(`M_n = M_{U^□(n)}`); `moduliProblem.isoClasses` (the presheaf `S ↦ M_H(S)/≅`, a different object, in
general not a sheaf; Lan, Remark 1.4.1.7, p. 151); `moduliProblem.changeLevel` (`M_{H′} → M_H` for
`H′ ⊆ H`); `moduliProblem.siegel` (for the Siegel datum of any genus and type, a natural equivalence
with the subfunctor of polarized families whose `FullLevel` torsion bases
satisfy M1.5's symplectic multiplier and completed-lift conditions, descended
along the prescribed `H`-orbits of M1.6. Construct this subfunctor here;
AbelianSchemesAndArithmeticModuli A3.8 supplies the underlying torsion-basis
torsor with its `GL_{2g}` change of basis, and A3.7 supplies the pairing); and
`moduliProblem.aut` (automorphisms preserve `λ`, `i` and the level). *Needs:* M0.10, M1.2, M1.6;
Mathlib `CategoryTheory.Functor.IsFibered`, `AlgebraicGeometry.Scheme`.

**Checks.**

- `moduliProblem_siegel_g1`: for the Siegel datum, `g = 1`, `n ≥ 3`, `M_n(S)` is equivalent to the
  groupoid of elliptic curves over `S` with a basis `(P, Q)` of `E[n]` and `ν_n` with
  `e_n(P, Q) = ν_n(ζ)` (ModularCurves §3C, §5B).
- `moduliProblem_isoClasses_not_sheaf`: for `g = 1` and `H = GL₂(Ẑ^□)`, let `E/ℚ` have
  `j ≠ 0, 1728` and let `d ∈ ℚ^× ∖ ℚ^{×2}`. Then `E` and its quadratic twist `E^d`
  become isomorphic over `ℚ(√d)` (Tau Ceti
  `WeierstrassCurve.j_quadraticTwist`) but not over `ℚ`
  (`WeierstrassCurve.not_exists_smul_quadraticTwist_eq`). Their distinct global isomorphism classes
  have equal restrictions to this quadratic cover, violating the separatedness part of the sheaf condition.
  For `d = 1` the twist is `E` itself and supplies no such pair of classes.
- `moduliProblem_zero`: for `L = 0`, `M_H(S)` is the groupoid of trivializations `ν` of `μ` modulo `H`
  acting through `ν(H) ⊆ Ẑ^{□×}`.
- In genus two at level `3`, an arbitrary `FullLevel` basis need not be a
  symplectic similitude basis: precompose a symplectic basis by
  `diag(−1,1,1,1)` in `(e₁,e₂,f₁,f₂)` order. The two standard pairs acquire
  different multipliers, so this basis is excluded by the Siegel subfunctor.
- `moduliProblem_det_matters`: for a unitary datum of signature `(2, 1)`, triples of signature
  `(1, 2)` are not objects; dropping the determinant condition adds the conjugate problem.

### M1.8 The rational quasi-isogeny problem `M_H^rat`

Define `PELModuli.ratModuliProblem H` (written `M_H^rat`) for an open compact `H ⊆ G(𝔸^{∞,□})`: objects
over `S` are `(A, λ, i, [α̂]_H)` with `A` an abelian scheme, `λ` a `ℤ_(□)^×`-polarization (M1.1),
`i : O ⊗ ℤ_(□) → RelativeLocalizedHom ℤ_(□) A A`, `Lie_{A/S}` satisfying the determinant condition, and `[α̂]_H` a
rational level structure; morphisms are prime-to-`□` quasi-isogenies `f` with `λ = r f^∨ λ′ f` for
a locally constant positive unit `r ∈ ℤ_(□)^×`, `f i(b) = i′(b) f`, and `(α̂′)⁻¹ ∘ V^□(f) ∘ α̂` in the `H`-orbit of the identity
with `ν(α̂′)⁻¹ ν(α̂)` in the `ν(H)`-orbit of `r` (Lan, Definition 1.4.2.4, pp. 156–157). The definition
uses only `(V ⊗ 𝔸^{∞,□}, ⟨·,·⟩)`, `O ⊗ ℤ_(□)` and the existence of `L` (Lan, Remarks 1.4.2.7 and
1.4.3.13). The API is `ratModuliProblem.hom`; `ratModuliProblem.dependsOnlyOn` (two integral
presentations of the same rational datum and transported level give naturally isomorphic problems);
`ratModuliProblem.kottwitz` (for `□ = {p}` at level `K^p`, a natural isomorphism with Kottwitz's
functor of quadruples up to prime-to-`p` isogeny, §5, p. 390); and `ratModuliProblem.changeLevel`.
*Needs:* M0.6, M1.1, M1.2, M1.6.

**Checks.**

- `ratModuli_scalar_iso`: for a positive `m ∈ ℤ_(□)^×`, `[m]` is an isomorphism
  `(A, λ, i, [α̂]_H) ≅ (A, λ, i, [mα̂]_H)` in `M_H^rat` with `r = m⁻²`, interpreting `[m]` in `RelativeLocalizedHom`.
- `ratModuli_siegel_kottwitz`: for the Siegel datum and `□ = {p}`, isomorphism classes over a field
  are Kottwitz's quadruples.
- `ratModuli_lattice_indep`: lattices `L₁, L₂` with the same localized data give equivalent `M_H` (after
  transporting the level, M1.10–M1.11) and equivalent `M_H^rat`; inequivalence is never asserted.
- `ratModuli_principal`: for `H = U^□(n)` this is Lan's `M_n^rat` (Remark 1.4.2.6).

### M1.9 The characteristic-zero adelic problem `M_K^ad`

Define `PELModuli.adelicModuli K` (written `M_K^ad`) for an open compact `K ⊆ G(𝔸_f)` over `F₀`-schemes:
objects are `(A, λ, i, η̄)` with `A` an abelian scheme, `λ` a positive quasi-polarization
in the sheafified rational Hom up to locally constant `ℚ_{>0}^×`,
`i : B → RelativeLocalizedHom ℚ A A` with the Rosati condition, `Lie_{A/S}` satisfying the determinant condition,
and `η̄` a `π₁`-invariant `K`-orbit of `B ⊗ 𝔸_f`-linear isomorphisms `η : V ⊗ 𝔸_f ≅ V_f(A)` sending
`⟨·,·⟩` to an `𝔸_f^×`-multiple of the `λ`-Weil pairing; morphisms are quasi-isogenies preserving these
data. Full level is allowed at every prime only in characteristic zero. Over `ℂ` its points are Milne's
quadruples (*Introduction to Shimura varieties*, Theorem 8.17, p. 88) without his condition `(∗∗)`,
which selects the component attached to `V` itself (M3.4); Kottwitz, §8, p. 398, describes the complex
points of the `p`-integral problem. The API is `adelicModuli.ofRational` (comparison with the `□ = ∅`
specialization of M1.8, where `ℤ_(∅) = ℚ` and `𝔸^{∞,∅} = 𝔸_f`); `adelicModuli.hecke` (right
translations by `G(𝔸_f)`); `adelicModuli.abelian`, `adelicModuli.levelOrbit`,
`adelicModuli.heckeOrbit` and `adelicModuli.hecke_orbit` (the translated orbit is the old markings
precomposed by `g`, with multiplier multiplied by `ν(g)`); and `adelicModuli.complexPoints` (over `ℂ`
the set of isomorphism classes is the union of the rational-form double quotients, M3.4). *Needs:*
M0.6, M1.8; Mathlib `IsDedekindDomain.FiniteAdeleRing`.

**Checks.**

- `adelicModuli_coefficient_compare`: the completed integral Tate module rationalizes to the full
  finite adelic homology `V_f(A)`.
- `adelicModuli_actual_hecke`: right translation by `g` carries the `K`-orbit to the `g⁻¹Kg`-orbit on
  the same family.
- `adelicModuli_all_primes_points`: over `ℂ`, the groupoid modulo isomorphism is the union of every
  global rational-form double quotient, not only the piece of `V`.
- `adelicModuli_siegel`: for the Siegel datum and `K = K(N)`, `M_K^ad` is the moduli of principally
  polarized abelian schemes with full level `N` up to isogeny, equivalently up to isomorphism with
  `L = ℤ^{2g}` (M1.10).

### M1.10 The integral and rational problems agree

**Tate lattices and localized homomorphisms.** Prove `primeToLatticeRealization`. Let `S` be
connected and locally noetherian with every residue characteristic zero or in `□`, fix a geometric
point `s̄`, and let `(A, λ, i)` have a `BoxPolarization` and a Rosati-compatible
`O ⊗ ℤ_(□)`-action in `RelativeLocalizedHom ℤ_(□)`. For a `π₁(S,s̄)`-stable, `O`-stable open
compact `Ẑ^□`-lattice `Λ ⊆ V^□A_{s̄}`, there are an abelian scheme `A₁/S` and a prime-to-`□`
quasi-isogeny `f : A ⇢ A₁`, a unit of `RelativeLocalizedHom ℤ_(□)`, such that
`V^□(f)(Λ) = T^□A₁`. The transported action `i₁ = f i f⁻¹` is integral on `O`, and
`λ₁ = (f⁻¹)^∨ λ f⁻¹` is a `BoxPolarization`. The pair `(A₁,f)` is unique up to a unique
isomorphism commuting with `f`. To prove existence, choose a positive integer `N` prime to `□`
with `T^□A ⊆ N⁻¹Λ`. The finite monodromy module `N⁻¹Λ/T^□A` gives a finite étale subgroup
`K ⊆ A`; its quotient `q : A → A/K` gives `f = q/N` in localized Hom.
(Source: Lan, Lemma 1.3.5.2, Proposition 1.3.5.3 and Corollary 1.3.5.4, pp. 128–130;
the quasi-isogeny convention is Definition 1.3.1.15, pp. 110–111.)

Prove also `localizedHom_integral_of_tate`: over such an `S`, for abelian schemes `A,A′` and
`u ∈ RelativeLocalizedHom ℤ_(□) A A′`, `u` comes from an actual homomorphism iff
`V^□(u)(T^□A_{s̄}) ⊆ T^□A′_{s̄}`. Locally write `u = g/N`, with `N` prime to `□`.
The lattice inclusion forces `g` to kill `A[N]`, so the quotient property of `[N]` gives the
integral homomorphism; uniqueness glues these local morphisms. In particular a prime-to-`□`
quasi-isogeny mapping the integral lattices onto each other and its inverse are actual morphisms,
hence inverse isomorphisms. This also proves the uniqueness in lattice realization and the
integrality of the transported order action.
(Source: Lan, Corollary 1.3.5.4 and proof of Proposition 1.4.3.3, pp. 129–130 and 159;
AbelianSchemesAndArithmeticModuli A3.4's torsion-divisibility argument.)
*Needs:* M1.1; AbelianSchemesAndArithmeticModuli A3.3–A3.4, A4.1;
EtaleCohomologyFoundations §F.0.2 `VanishingCycles.finiteEtaleGaloisCategory`.

**Checks.**

- For `Λ = T^□A`, lattice realization is `(A,id)`; a localized unit preserving this lattice in
  both directions is an actual isomorphism.
- Over `ℂ`, with `□ = {2}` and an elliptic curve `A`, `Λ = 3T^□A` is realized by
  `A₁ = A`, `f = id_A/3`. No actual isogeny in the direction `A → A₁` realizes it:
  `V₃(f)(3T₃A) ⊆ 3T₃A₁ ⊊ T₃A₁` for every actual isogeny `f`.
- In the same example, `Λ = (1/3)T^□A` is realized by the actual isogeny `[3]`.
  The localized unit `id_A/3` itself fails the integral-lattice inclusion at `3` and is not an
  actual homomorphism.

**Integral–rational comparison.** Prove `isoIsogenyComparison`: for `H ⊆ G(Ẑ^□)` open compact,
the morphism `M_H → M_H^rat`,
`(A, λ, i, α_H) ↦ (A, λ, i, [α̂]_H)` (Lan, Construction 1.4.3.1), is an isomorphism of fibred
groupoids in the sense of a fibrewise equivalence (Lan, Proposition 1.4.3.3 and Remark 1.4.3.4,
p. 159). Reduce to `S` connected with a geometric point. Full faithfulness: a prime-to-`□`
quasi-isogeny respecting integral level structures maps `T^□` onto `T^□`; apply
`localizedHom_integral_of_tate` to it and its inverse to obtain an actual isomorphism.
The integral multiplier lattices force the positive scalar `r` in M1.8 to be a unit at every
prime, hence `r = 1`, so the actual polarization is preserved. Essential surjectivity: apply
`primeToLatticeRealization` to the monodromy-stable lattice `α̂(L ⊗ Ẑ^□)` to obtain a
prime-to-`□` quasi-isogeny `f : A ⇢ A₁` with
`V^□(f)(α̂(L ⊗ Ẑ^□)) = T^□A₁`. Transport the action, quasi-polarization and marking along `f`.
Rescale the transported quasi-polarization by the unique positive `r ∈ ℤ_(□)^×` that makes the
multiplier carry `Ẑ^□(1)` onto `T^□G_m` (Lan, proof of Proposition 1.4.3.3, pp. 160–162).
Since `L ⊆ L^#`, its Tate realization then preserves integral lattices; apply
`localizedHom_integral_of_tate` to obtain an actual polarization, and conclude by M1.6's
integrality criterion. *Needs:* M1.1, M1.6, M1.7, M1.8;
`primeToLatticeRealization`, `localizedHom_integral_of_tate`.

**Checks.**

- `isoIsogeny_g1`: for the genus-one Siegel datum, an elliptic curve with a rational level structure up
  to prime-to-`□` isogeny has a unique representative with an integral level structure.
- `isoIsogeny_scalar`: for a positive `m ∈ ℤ_(□)^×`, `(A, λ, i, [mα̂])`
  corresponds to the same integral object as `(A, λ, i, [α̂])`, by `ratModuli_scalar_iso`.
  For `□ = {2}`, scalar `2` is excluded: the two full-level-5 integral objects in M1.13 are distinct.
- For an integral genus-one marking `α₀` over `ℂ` and `□ = {2}`, `α̂ = 3α₀` has multiplier `9`.
  Lattice realization uses `f = id_A/3`; the transported polarization is `9λ`, and rescaling it
  by `r = 1/9` returns the integral object `(A,λ,i,α₀)`.

### M1.11 Changes of order, lattice and good primes

Prove `changeOfLatticeAndPrimes`. (1) If star-orders `O, O′` and lattices `L, L′` have
`O ⊗ ℤ_(□) ≅ O′ ⊗ ℤ_(□)` and `(L ⊗ ℤ_(□), ⟨·,·⟩) ≅ (L′ ⊗ ℤ_(□), ⟨·,·⟩′)` compatibly, with `□` good for
both, then `M_H ≅ M′_H` over `S₀` (Lan, Corollary 1.4.3.7, p. 163); in particular one may keep `O` and
enlarge `L` to its span under a containing maximal order while the localized lattice and form stay
isomorphic. This containing order is supplied by ClassicalArithmeticCompletion §7.56 applied
to `StarOrder.toSubalgebra`, using M0.3's nondegenerate regular-trace pairing; its maximality
means `IntegralOrder.IsMaximalOrder`. It need not be star-stable. At good primes M0.3 makes
its localization equal to that of `O`; the PEL action remains the original `O`-action
(Lan's thesis errata, p. 11, correcting Remark 1.4.3.8).
(2) Prove `changeOfPrimes_openClosed`: for good sets `□ ⊆ □′`, write
`S₀′ = Spec O_{F₀,(□′)}`, let `H′ ⊆ G(Ẑ^□′)` be open compact, and put
`H = H′ × ∏_{p ∈ □′ ∖ □} G(ℤ_p)`. Forgetting the additional full local orbits defines a functor
`M_H → M_{H′} ×_{S₀′} S₀` representable by an open-and-closed immersion, without a
self-dual-lattice uniqueness hypothesis (Lan, revised thesis, Lemma 1.4.4.2, pp. 105–106).
Its image is the locus where the extra symplectic Tate trivializations at `p ∈ □′ ∖ □` exist.
The finite étale liftability and orbit conditions of M1.4–M1.6 give finite étale pullbacks to test
schemes. A nonempty local trivialization torsor has a unique full `G(ℤ_p)`-orbit, so these
pullbacks have at most one geometric point in each fibre and are open-and-closed immersions.
Consequently, for good sets `□₁, □₂` with `□ = □₁ ∩ □₂` and
`H = H_i × ∏_{p ∈ □_i ∖ □} G(ℤ_p)`, if at every `p ∈ □₁ ∪ □₂` the self-dual `O ⊗ ℤ_p`-modules of each
multi-rank form a single isomorphism class, then `M_H ≅ M_{H_i} ×_{S_i} S₀` (Lan, Proposition 1.4.4.1,
p. 166): at `p ∈ □_i ∖ □` the `λ`-Weil pairing on `T_pA` is a self-dual lattice of the multi-rank of
`L ⊗ ℤ_p`, so the extra liftability is automatic. The hypothesis holds in Cases A and C (M0.20); in type
D no unrestricted equivalence is asserted (Lan's thesis errata, p. 11, retracts the unsupported failure
assertion of Remark 1.4.4.3). (3) For finite `□` and the same uniqueness hypothesis, the generic fibre
of `M_H^rat` is `M_K^ad` with `K = H × ∏_{p ∈ □} Stab(L ⊗ ℤ_p)` (Kottwitz, §8, via Lemma 7.2; the
finiteness of `□` is required by the errata to Remark 1.4.3.11, p. 11). *Needs:* M0.10, M0.20, M1.9,
M1.10; M0.1, M0.3, M1.4–M1.6; ClassicalArithmeticCompletion §§7.4, 7.21 and 7.56.

**Checks.**

- `changeOfPrimes_siegel`: for the Siegel datum (type C) the change of good primes (2) holds without
  further hypothesis.
- `changeOfLattice_enlarge`: replacing `L` by `2L` changes neither `M_H` (for `2 ∉ □`) nor `M_H^rat`.
- `changeOfPrimes_generic_siegel`: for the Siegel datum and `□ = {p}`, the generic fibre of
  `M_{K^p}^rat` is `M_K^ad` with `K = K^p · GSp_{2g}(ℤ_p)`.
- For `□′ = □` and `H′ = H`, `changeOfPrimes_openClosed` is the identity.
- At an odd good prime in type D, the geometric fibre of `changeOfPrimes_openClosed` is empty
  when the required order-linear Tate similitude does not exist and a singleton when it does.
  The immersion statement requires no assertion that all self-dual lattices are isomorphic.
- Over a connected test scheme, if the extra Tate trivializations exist at one geometric point,
  the clopen pullback is the entire scheme; if they exist at none, the pullback is empty.

### M1.12 Effective descent

Prove `effectiveDescent`: for every `S₀`-scheme `S` and fppf covering `{S_j → S}`, (a) for objects
`x, y` of `M_H` over `S` the presheaf `Isom(x, y)` on `S`-schemes is an fppf sheaf, and (b) every descent
datum of objects is effective; the same holds for `M_H^rat`, and both are stacks in the sense of
Mathlib `Pseudofunctor.IsStack`. The presheaf of isomorphism classes is not a sheaf in general (M1.7).
Morphisms descend because homomorphisms of abelian schemes are morphisms of schemes, the fppf topology
is subcanonical (Mathlib `Scheme.fppfTopology`), and the conditions on `λ, i, α` are equalities of
morphisms or sections of `RelativeLocalizedHom`. Rational morphisms glue in that sheaf
without a global denominator bound. For rational objects use the local equivalence M1.10
after choosing integral lattice presentations and transport integral descent across it.
Integral objects: pulling the Poincaré bundle back along `(id, λ)` gives a canonical relatively
ample bundle representing `2λ` (Faltings–Chai, I, Definition 1.6 and the following discussion,
pp. 4–5; AbelianSchemesAndArithmeticModuli A2). This construction respects the polarized descent
isomorphisms, so it supplies an ample descent datum; effective descent of quasi-coherent modules and of quasi-projective schemes with ample
descent data (AlgebraicModuliForArithmeticGeometry Layer 3, `fpqcQuasicoherentDescent`,
`ModuliDescent.polarizedDescentComparison`, §3.5)
descends `A`, and the group law, `λ`, `i` and `α_H` descend as morphisms. Polarized abelian schemes
are projective, which is what makes descent available (Kottwitz, §5, p. 391; Lan, Appendix A.5 and
Remark 1.4.1.7, p. 151). The stack carrier and stackification are
SchemeAndStackFoundations §1.18. *Needs:* M1.7, M1.8; AbelianSchemesAndArithmeticModuli A2.6;
M1.10 for rational objects; AlgebraicModuliForArithmeticGeometry §3.5; SchemeAndStackFoundations §1.18;
Mathlib `Scheme.fppfTopology`, `Pseudofunctor.IsStack`.

**Checks.**

- `effectiveDescent_g1`: for `g = 1` this recovers descent of elliptic curves with level structure.
- `effectiveDescent_twist`: the quadratic-twist descent datum of M1.7 is effective, with descended
  object `E^d`, although the isomorphism-class presheaf does not see it.

### M1.13 Level change and the Hecke action

Define `PELModuli.forgetLevel` (`M_{H′}^rat → M_H^rat` for `H′ ⊆ H`, enlarging invariant orbits) and
`PELModuli.heckeTranslate g` for `g ∈ G(𝔸^{∞,□})`: from level `H′ ⊆ H ∩ gHg⁻¹` to level `H`, sending
`[α̂]` to `[α̂ ∘ g]` and multiplying the Tate-twist multiplier by `ν(g)` (Lan, Remark 1.4.3.10, p. 164;
Kottwitz, §6, p. 392). Define `PELModuli.heckeCorrespondence g`, the span
`M_H^rat ← M_{H ∩ gHg⁻¹}^rat → M_H^rat`. The API is `heckeTranslate_comp` (at a common refined source
level, translation by `h` followed by `g` is translation by `hg`; the identity translation is forgetting
level); `heckeTranslate_central` (a positive rational scalar `m ∈ ℤ_(□)^×` acts by a
natural isomorphism through the prime-to-`□` quasi-isogeny `[m]` and the
inverse-square polarization factor; for `□ = ∅` this includes every positive
rational scalar; central elements of `H` act trivially;
arbitrary central ideles are not asserted to act trivially); and `heckeTranslate_integral` (under
M1.10 the action preserves integral level structures for `g ∈ G(Ẑ^□)`). The maps of a Hecke span are
finite étale once representability is known (M6.1). *Needs:* M1.6, M1.8.

**Checks.**

- `heckeTranslate_id`: the identity translation is the identity on objects with level.
- `heckeTranslate_siegel_scalar`: a central scalar acts on the level orbit by its precomposition.
- `heckeTranslate_right_order`: first `h` then `g` gives the marking `η ∘ h ∘ g`, so the composite is
  translation by `hg`.
- `hecke_matrices_noncommute`: `((1,1),(0,1))` and `((1,0),(1,1))` do not commute, so the order test
  detects reversal.
- With `□ = {2}`, `H = U^□(5)` and a generic principally polarized elliptic
  curve over `ℂ`, scalar `2` changes a level basis `(P,Q)` to `(2P,2Q)` and
  its Weil pairing from `ζ₅` to `ζ₅⁴`. A prime-to-`2` self-quasi-isogeny
  compatible with the integral Tate lattices would be `±1`, neither of which
  induces this marking; scalar `2` is excluded from the triviality assertion.
- `heckeTranslate_siegel_isogeny`: for the principal Siegel datum, `ℓ ∉ □`,
  `H = H^(ℓ) · GSp_{2g}(ℤ_ℓ)` (so `ℓ ∤ n` at principal level `n`), and
  `g = diag(1, …, 1, ℓ, …, ℓ)`, the correspondence parametrizes degree-`ℓ^g`
  isogenies with maximal isotropic kernel in `A[ℓ]`, transporting the prime-to-`ℓ` level.
  For nonprincipal type also require `ℓ ∤ [L^# : L]`. Nonmaximal level at `ℓ` retains
  the `H ∩ gHg⁻¹` refinement data.
- At `H = K(3)` in genus one and `ℓ = 3`, the local refinement fibre for
  `g = diag(1,3)` has `3` cosets (intersection imposes the lower-left entry divisible
  by `9`), whereas `E[3]` has `4` lines; the maximal-level description does not apply.

### M1.14 Functoriality in the datum and the forgetful map to Siegel moduli

Define `PELDatum.Hom` (a star-homomorphism `O′ → O`, for instance an inclusion of orders, and an
isometric `O′`-linear identification `L ≅ L′` compatible with `h`) and `PELModuli.mapOfDatumFunctor`
(the induced natural map of moduli problems, `(A, λ, i, α) ↦ (A, λ, i ∘ φ, α)`, compatible with
identity and composition, for admissible order maps preserving the determinant polynomial and with
transported level). Define `PELModuli.toSiegelFunctor`: forgetting `i` gives `M_H → A_{g,D,H^S}`, the
Siegel moduli problem of `(L, ⟨·,·⟩)` of type `D` with a Siegel level `H^S ⊆ GSp(L ⊗ Ẑ^□)` containing
the image of `H` (Kottwitz, §5, p. 391). Prove `toSiegel_finite`: it is relatively representable by
finite unramified morphisms. Étale locally `λ` comes from an ample line bundle (A2.6); compatible order
actions are represented through graph loci in Hom schemes (AlgebraicModuliForArithmeticGeometry Layer
2, `homAndIsomSchemes`); for each of finitely many order generators `b`, Rosati adjointness gives
`i(b)† = i(b*)` and the `O`-linear Tate marking identifies `Tr(i(b) i(b)†)` with the fixed trace of
`bb*` on the lattice, so Rosati positivity (AbelianSchemesAndArithmeticModuli A6.14) and finiteness of
polarized automorphisms (A6.18) bound the graph Hilbert polynomials; rigidity (A1) gives
unramifiedness; actions extend over discrete valuation rings by the Néron property
(NeronModelsAndSemistableAbelianVarieties R11.1); the bounded locus is proper and quasi-finite, hence
finite. A disjoint union of Hom loci without this bound would not give finiteness. For a fixed action
the PEL refinements of a Siegel level form the finite set of cosets of `H` in the intersection of the
Siegel level with `G`, so the fibre stays finite. The API is `PELModuli.toSiegel_fiber` (the relative
fibre over a polarized Siegel family is the discrete sheaf of compatible order actions with the
Rosati, determinant and descended-level conditions) and `PELModuli.productFamilyEquivalence` (the
family functor of an orthogonal product datum is pairs of families with common multiplier and
compatible product level, after base change to the common reflex base). *Needs:* M0.7, M1.7;
AbelianSchemesAndArithmeticModuli A1, A2.6, A6.14, A6.18; AlgebraicModuliForArithmeticGeometry Layer 2;
NeronModelsAndSemistableAbelianVarieties R11.1.

**Checks.**

- `mapOfDatum_id`: the identity morphism of data induces the identity of `M_H` and the identity natural
  transformation of family functors.
- `toSiegel_g1`: for an imaginary quadratic field `K`, over an algebraically closed field of
  characteristic zero the distinct `j`-invariants of elliptic curves admitting an `O_K`-action
  number `h(O_K)` (Kohel, thesis, §3.2, Theorem 17, p. 29). In each good positive-characteristic
  geometric fibre the set of underlying `j`-invariants remains finite; its cardinality need not
  equal `h(O_K)`.
- For `K = ℚ(√−23)`, `h(O_K) = 3`, but over `𝔽̄₅` the set is `{0}`. The prime `5` is inert and
  unramified and is good for the principal rank-one datum at level prime to `5`. Any such curve is
  supersingular: an ordinary curve would give a unital embedding `K ⊗ ℚ₅ → ℚ₅` on its rational
  étale Tate module. For `y² = x³ + ax + b` the Hasse invariant is `2a`, so supersingularity forces
  `j = 0`. On `E : y² = x³ + 1`, take `ρ(x,y) = (ζ₃x,y)` and `π` the `5`-power Frobenius.
  Then `π² = −5`, `ρ² + ρ + 1 = 0` and `πρ = ρ²π`; hence `β = π − ρ` satisfies
  `β² − β + 6 = 0` and `β† = 1 − β`, giving a Rosati-compatible `O_K`-action. The same collision
  appears as `H_{−23}(T) mod 5 = T³` (Sage reference manual,
  [`hilbert_class_polynomial`, discriminant `−23` example](https://doc.sagemath.org/html/en/reference/arithmetic_curves/sage/schemes/elliptic_curves/cm.html#sage.schemes.elliptic_curves.cm.hilbert_class_polynomial),
  and the [`hasse_invariant` criterion](https://doc.sagemath.org/html/en/reference/arithmetic_curves/sage/schemes/elliptic_curves/ell_field.html#sage.schemes.elliptic_curves.ell_field.EllipticCurve_field.hasse_invariant)).
- `toSiegel_not_injective_on_objects`: for `O = ℤ × ℤ` acting on a product `E₁ × E₂` of two
  nonisogenous complex elliptic curves through the two projectors, swapping the projectors gives
  nonisomorphic PEL triples with the same polarized abelian surface and the same Lie determinant
  `X₁X₂`.
- `toSiegel_cm`: the rank-one datum of a CM field `K` maps to the Siegel datum of dimension
  `[K⁺ : ℚ]`; forgetting `i` on a Picard datum maps to genus-three Siegel moduli.

### Examples

- For the Siegel datum and `□` the primes not dividing `n`, `M_n` is the moduli of principally
  polarized abelian schemes of dimension `g` with a full symplectic level-`n` structure and a
  `μ_n`-trivialization over `ℤ[1/n]`.
- For `g = 1`, `M_n` is ModularCurves' `[Γ(n)]` problem with the Weil-pairing multiplier, and the
  isomorphism-class presheaf at the level-free group `GL₂(Ẑ^□)` fails to be a sheaf because of quadratic twists.

### Dependencies

M0; AbelianSchemesAndArithmeticModuli A1–A4, A6; AlgebraicModuliForArithmeticGeometry Layers 2–3;
SchemeAndStackFoundations §1.18; EtaleCohomologyFoundations §F.0.2; NeronModelsAndSemistableAbelianVarieties
R11.1; TauCetiRoadmap.ModularCurves §3C, §5B; Tau Ceti `AbelianVariety`, `RootsOfUnityGroup.groupScheme`,
`WeierstrassCurve.j_quadraticTwist`, `WeierstrassCurve.not_exists_smul_quadraticTwist_eq`.

## Layer M2: Representability and smooth good models

M2 proves that `M_H` is a smooth separated algebraic stack of finite type over `S₀ = Spec O_{F₀,(□)}`,
an algebraic space at neat level, constructs the universal family and the Kodaira–Spencer
isomorphism, and supplies the local `p`-adic theory used at good primes. Rigidity is a statement on
geometric fibres; deformation functors carry their special-fibre marking; the representability
argument uses a finite `Isom` diagonal, limit preservation, effective formal objects and an
openness-of-versality criterion over the excellent Dedekind base. Quasi-projectivity is not part of
this layer.

### M2.1 Rigidity of polarized automorphisms

Prove `rigidity` for PEL objects: for `ξ = (A, λ, i, α_H)` over a scheme `S`
and `n ≥ 3` invertible on `S`, restriction to `A[n]` is injective on the
automorphisms commuting with `O` and preserving `λ` and `α_H`. Apply
AbelianSchemesAndArithmeticModuli A6.18 `polarizedAutomorphisms`: its full-level
rigidity gives the injection on `Aut_S(A,λ)`, and restriction to this PEL
subgroup gives the export. Its geometric finiteness gives finite order and
roots of unity as Tate eigenvalues for every geometric PEL automorphism
(Lan, Lemma 1.4.1.10 and Remark 1.4.1.9, p. 152). The general polarized
automorphism and congruence theorems are the supplier's targets.
*Needs:* AbelianSchemesAndArithmeticModuli A1, A6.18; Tau Ceti `AbelianVariety.mulBy`.

**Checks.**

- `rigidity_n2_fails`: for `n = 2` and positive relative dimension, `[−1]` is a nontrivial automorphism of `(A, λ)` acting trivially on
  `A[2]`.
- `rigidity_j1728`: for the elliptic curve with `j = 1728` over `ℂ`, `[i]` acts nontrivially on `E[3]`.
- `rigidity_finite_order`: an automorphism of a polarized elliptic curve has order dividing `4` or `6`.

### M2.2 Neat open compact subgroups

Define `IsPinkNeatElement` and `IsNeat` for an open compact subgroup of the PEL group:
these are the adelic, common-local-torsion condition of Lan, rather than the
rational-intersection condition of AdelicAlgebraicGroups §4.3. Use the faithful representation
`G(Ẑ^□) ⊆ GL(L ⊗ Ẑ^□) × G_m(Ẑ^□)`. For `g = (g_p)`, let `Γ_p` be the
subgroup of `ℚ̄_p^×` generated by all eigenvalues of `g_p`, and require
`⋂_{p∉□}(ℚ̄^× ∩ Γ_p)_tors = {1}`; the torsion subgroup is independent of the
embedding of `ℚ̄` into `ℚ̄_p`. `IsNeat H` means this holds for every `g ∈ H`
(Lan, Definition 1.4.1.8 and Remark 1.4.1.9, p. 152;
Liu–Tian–Xiao–Zhang–Zhu, Definition 3.1.11(1), p. 143).
The API is `IsNeat.mono`, `IsNeat.conj`, `IsNeat.repr_indep`,
`isNeat_principalCongruence` (`U^□(n)` is neat for `n ≥ 3` prime to `□`,
by Serre's congruence lemma), and `IsNeat.implies_arithmeticNeat`: for `□ = ∅`,
every rational element in every conjugate of `H` is neat in the supplier's sense.
The latter implication supplies the neat arithmetic stabilizers used in M3; an
equivalence with the supplier's level predicate is not asserted.
*Needs:* M0.7; the rational neatness and arithmetic-level supplier named in Scope.

**Checks.**

- `isNeat_U3`: for the Siegel datum with `3 ∉ □`, `U^□(3)` is neat.
- `not_isNeat_minus_one`: for `g > 0`, the Siegel scalar `−1` has nontrivial
  common local torsion; a subgroup containing it, such as `U^□(2)`, is not neat.
- `isNeat_zero_lattice`: if `L = 0`, use the multiplier representation of `G_m`;
  the zero-dimensional standard representation alone would incorrectly declare every level neat.
- `not_isNeat_generated_ratio`: rational eigenvalues `2` and `−2` generate `−1`,
  although each has infinite order.
- `arithmeticNeat_not_PinkNeat`: for `G_m`, let
  `H = {u ∈ Ẑ^× : χ₃(u₃) = χ₅(u₅)}`, with quadratic characters modulo `3` and `5`.
  Every rational intersection is `{1}`: the only rational profinite units are `±1`,
  and `−1` fails this character equation. Nevertheless the element with `u₃ = −1`,
  `u₅` the order-four Teichmüller lift of `2`, and `u_ℓ = −1` elsewhere belongs to
  `H`; every local eigenvalue subgroup contains `−1`. Thus `H` is arithmetic-neat
  in the supplier's sense and fails `IsNeat`.

### M2.3 No automorphisms at neat level

Prove `noAutomorphisms_of_neat`: if `H` is neat, every object `(A, λ, i, α_H)` of `M_H(S)` has trivial
automorphism group; hence `M_H(S)` is equivalent to a set and the isomorphism-class functor is the
functor of the stack (Lan, Corollary 1.4.1.11, p. 152). Reduce to geometric points (relative rigidity,
A1); by M2.1 an automorphism has finite order and its Tate eigenvalues are roots of unity; preserving
`α_H` puts it in a conjugate of `H` at every `p ∉ □`, so neatness forces it to be `1`. *Needs:* M1.7,
M2.1, M2.2.

**Checks.**

- `noAutomorphisms_siegel`: for the Siegel datum and `n ≥ 3`, `M_n(S)` is a set for every `S`.
- `automorphisms_nonneat`: for `g > 0`, at level `GSp_{2g}(Ẑ^□)` the nontrivial automorphism `[−1]` survives.

### M2.4 Isom schemes are finite and unramified

Prove `isomScheme_finite`: for objects `ξ, η` of `M_H` over a locally noetherian `S₀`-scheme `U`, the
sheaf `Isom_U(ξ, η)` is representable by a scheme finite and unramified over `U`; hence the diagonal of
`M_H` over `S₀` is representable, finite and unramified, and `M_H` is separated once algebraic (Lan,
Theorem 1.4.1.12, p. 153, with the Isom-diagonal argument of §2.3.3, pp. 265–267; Kottwitz, §5,
pp. 390–391). Represent `Hom` and `Isom` of the projective abelian schemes by graph loci
(AlgebraicModuliForArithmeticGeometry Layer 2, `homAndIsomSchemes`: disjoint unions of quasi-projective
schemes) and impose the group, polarization, order and level equations; the ample polarization bounds
the Hilbert polynomial of the graphs; relative rigidity makes the functor unramified and quasi-finite;
over a discrete valuation ring homomorphisms extend by the Néron property
(NeronModelsAndSemistableAbelianVarieties R11.1) and the polarization extends the inverse, giving the
valuative criterion; proper and quasi-finite is finite. *Needs:* M1.7, M2.1;
AlgebraicModuliForArithmeticGeometry Layer 2; NeronModelsAndSemistableAbelianVarieties R11.1;
AbelianSchemesAndArithmeticModuli A2.

**Checks.**

- `isomScheme_neat`: for neat `H`, `Isom_U(ξ, ξ) = U`.
- `isomScheme_full_level`: for the Siegel datum with `g > 0` and `H = GSp_{2g}(Ẑ)`, `Isom(ξ, ξ)` over a field
  contains `±1`, so it has degree at least two.

### M2.5 Prorepresentability of deformations

Prove `deformation_prorepresentable`. Let `k` be a field over `S₀` (perfect, or as in Lan §2.2),
`ξ₀ = (A₀, λ₀, i₀, α_{H,0}) ∈ M_H(k)`. Fix a complete Noetherian local coefficient ring `Λ`
with residue field identified with `k` and a map `Spec Λ → S₀` extending the given `k`-point.
Use `Λ = k` in characteristic zero; for perfect `k` of characteristic `p ∈ □`, use `Λ = W(k)`
with the compatible lift of the unramified reflex-base map. More generally retain a compatible
Cohen coefficient ring. Lan §2.2.1, pp. 225–229, fixes these coefficients before defining the functors.
Let `Def_{ξ₀}` be the functor on
SchemeAndStackFoundations §4.2's `ArtinLocalAlg Λ k`: Artinian local `Λ`-algebras with a specified
residue identification, and local `Λ`-algebra maps inducing the identity on `k`. Its values are
isomorphism classes of deformations with a specified identification of the special fibre with `ξ₀`;
isomorphisms of deformations respect that marking. Then `Def_{A₀}`,
`Def_{(A₀,λ₀)}`, `Def_{(A₀,λ₀,i₀)}` and `Def_{ξ₀}` are prorepresentable on
this coefficient category by complete Noetherian local `Λ`-algebras with residue `k`, equivalently
as formal functors on its completion, and the forgetful maps are
relatively representable by closed immersions (for `λ` and `i`) and isomorphisms (for prime-to-`□`
level) (Lan, Theorem 2.2.3.10, p. 245). Schlessinger's criterion (SchemeAndStackFoundations §4.4,
`schlessinger_prorepresentable`; Lan, Theorem 2.2.1.4, p. 229) applies to `Def_{A₀}` with finite tangent space
`H¹(A₀, T_{A₀})`. Rigidity gives uniqueness of lifts of `λ` and `i` when they exist
(Lan, Lemma 2.2.2.1 and Corollaries 2.2.2.6–2.2.2.7, pp. 231–237).
The forgetful functors are subfunctors, and étale level structures deform uniquely
(Corollaries 2.2.2.8 and 2.2.2.10, pp. 237–240). Prorepresentability of the polarized and
endomorphism subfunctors is Propositions 2.2.3.7 and 2.2.3.9, pp. 243–245.
Their injective relative tangent maps give surjections of the complete local representing
`Λ`-algebras by complete local Nakayama, so existence of the extra structures is a closed condition.
Rigidity of automorphisms reducing to the identity (M2.1) is what is used; neatness is not needed for the marked
functor. Comparisons with completed local rings of charts retain the same coefficient and residue
maps (AlgebraicModuliForArithmeticGeometry §8.3, `FramedDeformation`, `familyVersalAt_completion_iff`).
For a larger geometric residue field, first make the specified coefficient base change and choose
a `k`-rational lift on the base-changed chart; its completion is not identified with the original stalk.
*Needs:* M1.7, M2.1; AbelianSchemesAndArithmeticModuli A4.7; AlgebraicModuliForArithmeticGeometry
Layer 8; SchemeAndStackFoundations Layer 4; TauCetiRoadmap.ModularCurves §7D.

**Checks.**

- `deformation_elliptic`: for an elliptic curve `E₀/k` over a perfect field of characteristic `p > 0`,
  with `Λ = W(k)`, `Def_{E₀} = Def_{(E₀,λ₀)}` is prorepresented by
  `W(k)[[t]]` (ModularCurves §7D).
- For a complex abelian surface the unpolarized formal tangent space has
  dimension `4`; fixing a principal polarization gives dimension `3`.
  Artinian prorepresentability of the former does not algebraize its universal
  formal family over the complete representing ring.
- `deformation_closed_polarization`: for a supersingular elliptic curve `E₀/𝔽_p`, the condition that its
  Frobenius endomorphism of degree `p` lifts cuts out a proper closed subscheme of `Spf W(k)[[t]]`.
- For `k = ℚ(t)` and the zero abelian scheme over `S₀ = Spec ℚ`, the marked deformation functor
  on `ArtinLocalAlg k k` is the singleton functor represented by `k`. The section
  `a ↦ a + ε·da/dt` into `k[ε]/(ε²)` preserves the residue but is not `k`-linear;
  allowing it alongside the constant section would give two Hom points for a singleton functor.

### M2.6 Formal smoothness at good primes

Prove `formalSmoothness`: let `□` be good, `ξ₀ ∈ M_H(k)`, and fix the compatible coefficient ring
`Λ` of M2.5. Then `Def_{ξ₀}` is formally smooth: every deformation over `R` lifts along every
small surjection `R̃ → R` in `ArtinLocalAlg Λ k` (Lan, Theorem 2.2.4.16, p. 260; the thesis errata, p. 15,
state the conclusion as formal smoothness). Its tangent space has the dimension of M2.10. Each good-prime
hypothesis is used separately: `p ∤ Disc` for projectivity of `O ⊗ k`-modules and the determinant
condition over nonreduced bases, `p ≠ 2` in type D for lifting symmetric forms (Lan, Remark 1.2.2.3,
p. 60), and self-duality for perfectness of the pairing on `H^dR_1`. By Grothendieck–Messing and
Serre–Tate with structures (AbelianSchemesAndArithmeticModuli A4.7, A4.9), deformations over a PD
thickening are `O`-stable, `λ`-isotropic lifts of the Hodge filtration satisfying the determinant
condition; at good primes these are the points of a smooth flag variety `G/P₀` (Lan, Proposition
1.2.5.20 and Corollary 1.2.5.23, using M0.20 and the auxiliary finite étale extension of the errata,
pp. 7 and 15); polarizations, then the action, then étale level are added (Lan, Propositions 2.2.4.4
and 2.2.4.11, Theorem 2.2.4.16; Kottwitz, §5, p. 391). *Needs:* M0.10, M0.19, M0.20, M2.5;
AbelianSchemesAndArithmeticModuli A4.7, A4.9; Mathlib `Algebra.FormallySmooth`.
The representing ring is noncanonically `Λ[[t₁,…,t_d]]`, with `d` this tangent dimension;
the isomorphism is one of complete local `Λ`-algebras inducing the fixed residue identification.

**Checks.**

- `formalSmoothness_siegel`: for a principally polarized `(A₀, λ₀)` over perfect `k` of
  characteristic `p > 0`, with `Λ = W(k)`,
  `Def_{(A₀,λ₀)} ≅ Spf W(k)[[t_{ij} : 1 ≤ i ≤ j ≤ g]]`, with `g(g+1)/2` variables.
- `formalSmoothness_typeD_two`: for a type D datum at `p = 2` the argument fails (Lan, Remark 1.2.2.3);
  `2` is bad by M0.10.
- `formalSmoothness_tangent`: for the Picard datum `(2, 1)` the tangent space of `Def_{ξ₀}` has
  dimension `2`, the relative dimension of M2.10.

### M2.7 Effectivity of formal deformations

Prove `effectivity`: for a complete local noetherian `O_{S₀}`-algebra `R` with maximal ideal `m`, a
compatible system of objects of `M_H` over the `R/m^{i+1}` is induced by an object over `R`, unique up
to unique isomorphism compatible with the formal identifications. Thus precisely
the polarized functors `Def_{(A₀,λ₀)}`, `Def_{(A₀,λ₀,i₀)}` and `Def_{ξ₀}` of
M2.5 are effectively prorepresentable (Lan, Proposition 2.3.2.1 and its proof, pp. 263–264). The abelian scheme
with its polarization algebraizes by polarized Grothendieck existence
(AbelianSchemesAndArithmeticModuli A4.8, `polarizedEffectivity`); the group law, zero, polarization and
order maps algebraize by full faithfulness; Rosati and determinant identities are checked after
completion; finite étale level data lift uniquely along nilpotent thickenings; relative rigidity gives
uniqueness. *Needs:* M2.5; AbelianSchemesAndArithmeticModuli A4.8; AlgebraicModuliForArithmeticGeometry
Layer 3.

**Checks.**

- `effectivity_elliptic`: the universal formal deformation of an elliptic curve algebraizes to an
  elliptic curve over `W(k)[[t]]`.
- For a generic complex principally polarized abelian surface, the universal
  four-dimensional unpolarized formal deformation has directions that do not
  lift a polarization; M2.7 algebraizes the three-dimensional polarized
  deformation, not that unpolarized formal family.
- `effectivity_needs_polarization`: a formal lift of the Barsotti–Tate group alone, without the
  polarization, does not give an abelian scheme over `R`; the polarization is what makes A4.8 apply.

### M2.8 Representability and smoothness

Prove `representability`: let `□` be good, `S₀ = Spec O_{F₀,(□)}` and `H ⊆ G(Ẑ^□)` open compact. Then
`M_H` is an algebraic stack over `S₀`, smooth, separated (finite diagonal) and of finite type; it is an
algebraic space (Deligne–Mumford with trivial inertia) when `H` is neat, and more generally whenever
objects have no nontrivial automorphisms. The same holds for `M_H^rat` (M1.10). Scheme
representability and quasi-projectivity over `S₀` are not part of this theorem (Lan, Theorem 1.4.1.12,
p. 153, and Remark 1.4.1.14, p. 154). Apply Artin's criterion (AlgebraicModuliForArithmeticGeometry
§7.1, `artin_stack_criterion`, `artin_space_criterion`; `O_{F₀,(□)}` is excellent,
SchemeAndStackFoundations Layer 0): the stack property is M1.12; limit preservation is descent of finitely
presented objects and morphisms; the diagonal is M2.4; effective prorepresentability is M2.5 and M2.7
after a finite separable extension of the residue field (Lan, Appendix B.3.10, pp. 1023–1024).
For openness of versality use Lan, Appendix B.3.12, pp. 1024–1026, with its
actual base and dimension hypotheses: a finite-type base over a field, or an
excellent Dedekind base with infinitely many closed points, and normal universal
deformation rings of the same Krull dimension at finite-type points. First choose
`U^□(n) ⊆ H` and let `□′` be the cofinite set of good primes not dividing `n`.
Then `□ ⊆ □′` and `H = H′ × ∏_{p ∈ □′ ∖ □} G(ℤ_p)` for an open compact `H′`.
The finite-level conditions of M1.5–M1.6 define `M_{H′}` over the open Dedekind base
`S₀′ = Spec O_{F₀,(□′)}`, obtained by inverting the bad-prime integer and `n`.
Prove representability there, base change to `S₀`, and take the clopen liftability locus
`M_H ↪ M_{H′} ×_{S₀′} S₀` of M1.11 `changeOfPrimes_openClosed` (Lan, revised thesis,
§2.3.4, using Lemma 1.4.4.2; original thesis errata, p. 16). This gives the specified problem
also in type D, without assuming self-dual-lattice uniqueness.
On each open-and-closed signature stratum the relative tangent dimension is a
constant `d`; M2.6 with `Λ = W(k)` gives normal formal power-series rings of dimension `d+1` at
closed points of that Dedekind base, and with `Λ = k` gives dimension `d` over the generic field.
Apply the criterion separately in these two settings, then base change. Applying
B.3.12 directly to a semilocal Dedekind base, or combining its generic and closed
points in one dimension assertion, would omit hypotheses. Appendix B.3.8,
pp. 1018–1023, assembles the criterion; §2.3.3, pp. 265–268, verifies it for PEL
problems. Quasi-compactness follows from the bounded polarized Hilbert presentation together with
the finitely presented order and level conditions (as in §2.3.3); smoothness from M2.6; trivial inertia
at neat level from M2.3. For arbitrary `H` the Deligne–Mumford conclusion is M6.2. *Needs:* M1.10,
M1.11, M1.12, M2.3, M2.4, M2.5, M2.6, M2.7; AlgebraicModuliForArithmeticGeometry Layer 7;
SchemeAndStackFoundations §0.21 and §§1.4, 1.19 (`AlgebraicSpace`, `IsAlgebraicStack`); Mathlib `Smooth`,
`IsSeparated`.

**Checks.**

- `representability_siegel`: for the Siegel datum and `H = U(n)`, `n ≥ 3`, `M_n` is a smooth separated
  algebraic space of finite type over `ℤ[1/n]` of relative dimension `g(g+1)/2`.
- `representability_full_level`: for `g > 0`, `□ = ∅` and `H = GSp_{2g}(Ẑ)`, the stack `M_H` is Deligne–Mumford
  and smooth over `ℚ` but is not an algebraic space (`[−1]` is an automorphism).
- `representability_zero`: for `L = 0`, `M_H` is finite étale over `S₀` (a torsor under a finite
  quotient of `Ẑ^{□×}` over each component).
- In type D with `□ = {p}` for an odd good prime, choose the cofinite `□′` above.
  The specified moduli stack is the clopen Tate-liftability locus in the base-changed
  `M_{H′}`, so representability over the semilocal base does not require lattice uniqueness.

### M2.9 The universal family at neat level

Define `PELModuli.universal`: for neat `H` and the algebraic space `M_H` of M2.8, the universal object
`(A^univ, λ^univ, i^univ, α_H^univ)` corresponding to the identity, with `A^univ → M_H` an abelian
algebraic space (an abelian scheme étale locally on `M_H`), such that every object over an `S₀`-scheme
`S` is the pullback along a unique `PELModuli.classify ξ : S → M_H` (Lan, Proposition 2.3.4.2,
p. 269; Kottwitz, §5, p. 391). It is obtained from an étale atlas and descent of objects over it
(M1.12; SchemeAndStackFoundations Layer 1, `FineModuliSpace`). At non-neat level the universal object
lives on the stack. The API is `PELModuli.classify_pullback` and `PELModuli.classify_universal`
(naturality of classifying maps and `ξ ≅ classify(ξ)^* universal`); `PELModuli.universal_baseChange`
(compatible with `S₀′ → S₀`); `PELModuli.universal_relDim` (relative dimension `dim_ℂ V₀`);
`PELModuli.universal_lie` (its Lie algebra satisfies the determinant condition);
`PELModuli.universal_hecke` (Hecke translates pull universal objects back to prime-to-`□` isogenous
ones); and `PELModuli.universal_siegel` (for the principal genus-one datum and level `n ≥ 3`, the
universal elliptic curve of ModularCurves §5B). *Needs:* M1.12, M2.8; SchemeAndStackFoundations Layer 1.

**Checks.**

- `universal_g1`: for `g = 1` and `n ≥ 3` the universal object is the universal elliptic curve over
  `Y(n)` with its full level-`n` structure and Weil-pairing multiplier.
- `universal_classify_self`: `classify(universal) = id`.
- `universal_nonneat`: for `g > 0` and `H = GSp_{2g}(Ẑ)` no universal object exists over an algebraic space
  representing the isomorphism classes, because of `[−1]`.
- `universal_zero`: for `L = 0` the universal abelian scheme is the dimension-zero group over `M_H`,
  namely `M_H → M_H` with its unique group law; it is not the empty scheme.

### M2.10 The Kodaira–Spencer map and isomorphism

Define the Kodaira–Spencer class and map of a smooth morphism `X → S` over `U`: the extension class of
`0 → f^*Ω¹_{S/U} → Ω¹_{X/U} → Ω¹_{X/S} → 0`, and for an abelian scheme `A → S` with `Ω¹_{S/U}` locally
free the map `KS_{A/S/U} : Lie^∨_{A/S} ⊗ Lie^∨_{A^∨/S} → Ω¹_{S/U}` it induces (Lan, Definitions 2.1.7.1
and 2.1.7.8, pp. 221 and 225; this is defined from deformation theory and needs no Gauss–Manin
connection; it agrees with the Gauss–Manin description on `H¹_dR`, AbelianSchemesAndArithmeticModuli
A4.3, where both are defined). Prove `kodairaSpencer`: for the object over `S` attached to `S → M_H`
with `Ω¹_{S/S₀}` locally free, `KS(λ^*(y) ⊗ z) = KS(λ^*(z) ⊗ y)` and
`KS(i(b)^*(x) ⊗ y) = KS(x ⊗ (i(b)^∨)^*(y))`, so `KS` factors through the quotient `KS_{(A,λ,i)/S}` by
these relations; the universal map is an isomorphism `KS_{(A,λ,i)/M_H} ≅ Ω¹_{M_H/S₀}`; and
`kodairaSpencer_etale_iff`: for `S → M_H` locally of finite presentation, it is étale iff it is flat
and `KS_{(A,λ,i)/S} ≅ Ω¹_{S/S₀}` (Lan, Proposition 2.3.4.2, pp. 269–270, with the completed-local-ring
comparison corrected in the thesis errata, p. 16; Stacks, Tag 02GU). The finite-presentation
hypothesis is necessary: Lan's thesis states the converse for every locally noetherian `S`, but for a
nonempty smooth presentation `M` of the generic fibre over a number field `E`, the projection
`M ×_E Ē → M` is flat with vanishing relative differentials and the same KS isomorphism, and is not
étale (not locally of finite presentation). Consequently `M_H` is smooth over `S₀` of relative
dimension `rank KS_{(A,λ,i)}`, the dimension of the quotient of `V₀^∨ ⊗ (V₀^c)^∨` by the symmetry and
`O`-relations: `g(g+1)/2` for the Siegel datum, `Σ_{τ ∈ Φ} p_τ q_τ` for a unitary datum over a CM field
with CM type `Φ`, and `[F : ℚ]` for the Hilbert datum. The symmetry and `O`-relations come from lifting
`λ` and `i(b)` to the first infinitesimal neighbourhood of the diagonal (Lan, Proposition 2.1.3.2 and
the proof of 2.3.4.2); the ranks from `V₀ = ⊕ W_τ^{p_τ}`. *Needs:* M0.13, M2.6, M2.8;
SchemeAndStackFoundations Layers 2–3 (cohomology, relative differentials); AbelianSchemesAndArithmeticModuli
A4.3; Stacks Tag 02GU.

**Checks.**

- `kodairaSpencer_g1`: for `g = 1`, `KS : ω^{⊗2} ≅ Ω¹_{Y(n)/ℤ[1/n]}`.
- `kodairaSpencer_picard`: the Picard datum `(2, 1)` has relative dimension `2 · 1 = 2`.
- `kodairaSpencer_needs_finite_presentation`: the base change `M ×_E Ē → M` above satisfies the flat
  and KS conditions and is not étale.
- `kodairaSpencer_cm`: a rank-one CM datum with signature a CM type has relative dimension `0`.

### M2.11 Properness when `End_B(V)` is a division algebra

Prove `properOfDivision`: let the rational datum have `B` simple and `C = End_B(V)` a division algebra
(equivalently `V` a simple `B`-module), `□` good and `H` neat. Then `M_H` is proper over `S₀`; for the
rank-one unitary datum of a CM field with signature a CM type (`C = F`), `M_H` is finite étale over
`S₀` (Kottwitz, §5, p. 392). Valuative criterion: since the base is excellent and `M_H` is separated of
finite type, test complete discrete valuation traits `R` with fraction field
`K` (hence excellent and henselian). After a finite extension of `K`, `A_K` has semistable reduction and the torus part `T` of the
special fibre of the Néron model has `X^*(T) ⊗ ℚ` a `B`-module of dimension at most `dim V/2`
(NeronModelsAndSemistableAbelianVarieties R11.3 §3.10); since `V` is simple, `T = 0` and the Néron model is
an abelian scheme; `λ` and `i` extend (homomorphisms of Néron models, R11.1), `λ` stays a polarization,
level extends because `A[n]` is étale, and the determinant identity extends from `K`. To descend good
reduction to the original `R`: inertia acts on `T^□A_K` through a finite group (potential good
reduction); it preserves the level orbit, hence lies in a conjugate of the neat `H` at primes
`ℓ ∉ □` different from the residue characteristic, so it is trivial; by the criterion of
Néron–Ogg–Shafarevich (R11.5 §5.1) `A_K` has good reduction over `R`.
For excellent nonhenselian traits, use R11.5 §5.2 to descend from the henselization. Torus rank zero after extension alone
does not give the valuative criterion over `R`. In the finite étale case the relative dimension is
`Σ p_τ q_τ = 0` (M2.10). *Needs:* M2.2, M2.8, M2.10; NeronModelsAndSemistableAbelianVarieties R11.1,
R11.3 §3.10, R11.5 §§5.1–5.2.

**Checks.**

- `proper_siegel_fails`: for the Siegel datum with `g ≥ 1`, `C = M_{2g}(ℚ)` is not a division algebra and `A_g` is not
  proper (it has cusps).
- `proper_cm`: for the rank-one CM datum, `M_H` is finite étale over `O_{F_Φ,(□)}`.
- `proper_indefinite_quaternion`: for `B` an indefinite division quaternion algebra over `ℚ` with a positive
  involution of type C and `V = B`, `C = B^op` is a division algebra and the moduli space of abelian
  surfaces with quaternionic multiplication (a Shimura curve) is proper over `S₀`; it has no cusps.

### M2.12 Deformations of unitary `O_F`-abelian schemes

Prove `unitaryDeformation`: let `F` be CM with the fixed coefficient embedding `τ_∞ : F ↪ ℂ`
used in M0.27's `psiField`, and put `τ̄_∞ = τ_∞|_{F⁺}`. Let `p > 2` be unramified in `F` and
`Ψ` a generalized CM type of rank `N` with `min(r_τ, r_{τ^c}) = 0` for every `τ` not above
the real place `τ̄_∞`,
`S ↪ Ŝ` a closed immersion of `ℤ_p^Ψ`-schemes with `p` locally nilpotent and a locally nilpotent PD
structure on its ideal, and `(A, λ)` a unitary `O_F`-abelian scheme of signature type `Ψ` over `S`.
Let `H^cris_1(A/Ŝ)` be the value at `Ŝ` of crystalline homology (a locally free `O_Ŝ ⊗ O_F`-module)
with the pairing `⟨·,·⟩^cris_{λ,τ_∞}` between its `τ_∞` and `τ_∞^c` parts. Then
`(Â, λ̂) ↦ (ω_{Â^∨/Ŝ,τ_∞}, ω_{Â^∨/Ŝ,τ_∞^c})` is an equivalence from deformations of `(A, λ)` to `Ŝ`
onto pairs of subbundles lifting `ω_{A^∨/S,τ}` for `τ ∈ {τ_∞, τ_∞^c}` that are mutually orthogonal
for that pairing; the deformations retain the `O_F`-action, signature `Ψ` and marking on `S`
(Liu–Tian–Xiao–Zhang–Zhu, Ground fields, p. 119, Notation 3.3.6, p. 148, and Proposition 3.4.8
and its proof, pp. 150–151). The inclusion `τ_∞(F) ⊆ ℚ_p^Ψ` supplies both distinguished parts
already over `Ŝ`, since `τ_∞^c(F) = τ_∞(F)`. Apply Grothendieck–Messing with
the localized `O_F`-action and quasi-polarization (AbelianSchemesAndArithmeticModuli A4.7; the crystal
is AbelianSchemesAndArithmeticModuli §A4.CR.7.2). After the finite étale faithfully flat base
change `ℤ_p^Ψ → ℤ_p^◇`, decompose into all `τ`-parts (M0.27). The extremal signatures away
from `τ̄_∞` force the filtrations there to be zero or the whole component; at the distinguished
pair keep both orthogonal subbundles. Uniqueness of the forced components and invariance of `Ψ`
give descent data, and étale descent recovers the equivalence over `ℤ_p^Ψ`.
*Needs:* M0.27, M1.3, M1.12; AbelianSchemesAndArithmeticModuli A4.7; AbelianSchemesAndArithmeticModuli
§A4.CR.7.2.

**Checks.**

- `unitaryDeformation_dimension`: for `N ≥ 1`, a CM type `Φ` containing the fixed coefficient
  embedding `τ_∞`, `Ψ = NΦ − τ_∞ + τ_∞^c` and a `p`-principal
  polarization, the deformation space at a point is the
  space of isotropic line–hyperplane pairs, of dimension `N − 1`.
- `unitaryDeformation_cm`: for `N = 1`, `Ψ` a CM type and a `p`-principal polarization, there are no deformations (dimension `0`),
  matching M2.11.
- `unitaryDeformation_mixedSplitting`: for M0.27's quartic type, the nonextremal real place is
  `τ₁|_{F⁺}`. Taking `τ_∞ = τ₁` makes `ℚ₁₇^Ψ = K₂`, so both distinguished crystalline parts
  exist over `O_{K₂}`. The coefficient ring `ℤ₁₇` obtained from `τ₀` does not support this pair.

### M2.13 Dieudonné modules of isogenies: cokernel length and kernel height

Prove `isogenyDieudonne_coker_length`: for an isogeny `α : X → Y` of `p`-divisible groups
over a perfect field `k` of characteristic `p`, its covariant Dieudonné map is injective and
its cokernel has `W(k)`-length `log_p |ker α|`. This is the isogeny specialization of the
length–order theorem supplied by FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2
(covariant module `R07.2.20`), rather than a new construction of Dieudonné theory. Exactness
applied to `0 → ker α → X → Y → 0` proves the specialization. The crystalline argument
needed over nonperfect bases is the narrower one in M2.14, in Liu–Tian–Xiao–Zhang–Zhu,
proof of Lemma 3.4.12, pp. 154–155. *Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.

**Checks.**

- `dieudonne_frobenius`: Frobenius of an elliptic curve over `𝔽_p` has kernel height and cokernel length `1`.
- `dieudonne_mul_p`: `[p]` on height `h` has kernel height and cokernel length `h`.
- `dieudonne_etale`: an isomorphism has zero cokernel length.
- `dieudonne_deRham_not_length`: `[p²]` has cokernel length `2h` over `W(k)`,
  whereas its reduction on de Rham homology is zero on a rank-`h` vector space. Its
  kernel and cokernel there have rank `h`, so evaluation at a characteristic-`p` base
  cannot identify arbitrary isogeny heights with de Rham ranks.

### M2.14 Kernel ranks of isogenies of unitary abelian schemes

Prove `isogenyKernelRanks`: let `p` be odd and unramified in `F`, and `F⁺ ⊆ ℚ_p` through `τ_∞`, with induced prime `𝔭` of `F⁺` inert in `F`,
`ϖ ∈ O_{F⁺}` with `val_𝔭(ϖ) = 1`, `A, B` unitary `O_F`-abelian schemes over `S ∈ Sch/𝔽_{p²}`, and
`α : A → B`, `β : B → A` `O_F`-linear quasi-`p`-isogenies with `β ∘ α = ϖ · id_A`. Then: (1) for
`τ ∈ {τ_∞, τ_∞^c}`, `ker α_{*,τ} = im β_{*,τ}` and `ker β_{*,τ} = im α_{*,τ}` on `H^dR_1`, all locally
free; (2) `rank Lie_{B,τ_∞} − rank Lie_{A,τ_∞} = rank ker α_{*,τ_∞} − rank ker α_{*,τ_∞^c}` (this uses that
`𝔭` is inert; it fails if `𝔭` splits); (3) if `λ_A, λ_B` make `A, B` unitary of dimension `N[F⁺ : ℚ]`
with `α^∨ λ_B α = ϖ λ_A`, then `ρ = rank ker α_{*,τ_∞} + rank ker α_{*,τ_∞^c}` is `N` if both are
`p`-principal, `N − 1` if `λ_A` is `p`-principal and `ker λ_B[𝔭^∞]` has rank `p²`, `N + 1` in the
reverse case, and `N` if both kernels have rank `p²`; (4) if instead `α^∨ λ_B α = λ_A`,
`ker λ_A[𝔭^∞]` has rank `p²` and `λ_B` is `p`-principal, then `ρ = 1` (Liu–Tian–Xiao–Zhang–Zhu,
Lemma 3.4.12 and its proof, pp. 153–155). In general, with `deg α[𝔭^∞] = p^ρ` and the `𝔭`-primary
degrees `p^{d_A}, p^{d_B}` of `λ_A, λ_B`, the identity `α^∨ λ_B α = ϖ^e λ_A` gives
`2ρ + d_B = 2Ne + d_A`, and the four cases are its substitutions. The proof uses the covariant
crystals with `F`, `V` and the perfect conjugate-`τ` pairings, intersects with the Hodge sequence of
M1.3, uses M2.13 on geometric fibres and the special factorization `βα = ϖ`: the
crystal quotient `D(B)/ϖD(B)` is locally free of rank `2N` over the crystalline structure
sheaf modulo `p`. The proof of the cited lemma establishes the complementary image/kernel
identities and local freeness in this setting, then takes degrees on the `𝔭`-divisible groups.
It does not assert local freeness for an arbitrary isogeny over an arbitrary base. *Needs:* M0.27, M1.1, M1.3, M2.13; AbelianSchemesAndArithmeticModuli A4.3.

**Checks.**

- `isogenyKernelRanks_N1`: in case (3a) with `N = 1`, `ρ = 1`: `α` kills exactly a line in the
  `τ_∞ ⊕ τ_∞^c` parts.
- `isogenyKernelRanks_degree`: `e = 1`, `d_A = 0`, `d_B = 2` gives `2ρ + 2 = 2N`, so `ρ = N − 1`.
- `isogenyKernelRanks_split_fails`: for `𝔭` split in `F`, (2) fails, so inertness is a hypothesis.

### M2.15 Displays and polarized O-displays

Define `Display`, Zink's displays over a ring `R` of characteristic `p`: a 3n-display is `(P, Q, F, V⁻¹)` with `P`
a finitely generated projective `W(R)`-module, `I_R P ⊆ Q ⊆ P` with `P/Q` a direct summand of
`P/I_R P`, `F : P → P` and `V⁻¹ : Q → P` Frobenius-linear, the `W(R)`-linearization of `V⁻¹` surjective, and
`V⁻¹(V(w)x) = wFx`; a display is a 3n-display whose `V^♯`-iterate is topologically nilpotent
(Wedhorn, *Ordinariness in good reductions of Shimura varieties of PEL-type*, (3.1.3)–(3.1.6),
pp. 592–593). Define duals (3.1.8), base change (3.1.10), the identification of 3n-displays over a
perfect field with Dieudonné modules (3.1.9), and Zink's functor `BT` to formal `p`-divisible groups
with `Lie(BT(P)) = P/Q` and `ht(BT(P)) = rank P`, an equivalence over complete local noetherian rings
with perfect residue field (Zink's theorem as stated in Wedhorn (3.1.11)–(3.1.12), p. 594). Define
principally quasi-polarized displays with `O`-module structure `(P, λ, ι)` for a `ℤ_p`-algebra `O` with
involution (Wedhorn (3.2.1), p. 594). Define `Display.deformationEndomorphism`: over a perfect field `k`, a `W(k)`-linear
endomorphism `N` of the bi-infinitesimal summand of a principally quasi-polarized
`O`-display, satisfying `N² = 0`, commuting with `O`, and
`⟨Nx,y⟩ + ⟨x,Ny⟩ = 0`. Its API is `Display.deformationEndomorphism.zero`,
`Display.deformationEndomorphism.intertwine` (an `O`-linear display map
extends to the constructed 3n-displays iff it intertwines the endomorphisms),
`Display.deformationEndomorphism.isometry` (`1 + [t]N` preserves the extended pairing),
and `polarizedDisplay_lifting`: over `k[[t]]`, on the base-changed underlying pair `P,Q`,
`F_N = (1+[t]N)F₀` and `V_N⁻¹ = (1+[t]N)V₀⁻¹` give a principally
quasi-polarized `O`-**3n-display** lifting the original; it can cease to be a
display over `k[[t]]` because its generic fibre can acquire an étale part. Pass
to the associated adic system to obtain the `p`-divisible group. On the étale and multiplicative
summands keep the constant 3n-displays (Wedhorn (3.2.5)–(3.2.9), pp. 595–598).
This is a construction of particular liftings, rather than a classification over every
nilpotent thickening. M2.16 uses these explicit one-parameter liftings; Serre–Tate
(AbelianSchemesAndArithmeticModuli A4.9) transfers them to abelian schemes. *Needs:*
M2.6; AbelianSchemesAndArithmeticModuli A4.9; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.

**Checks.**

- `display_height_dimension`: over a perfect field `BT(P)` has height `rank P` and dimension
  `rank(P/Q)`; the display of the formal group of a supersingular elliptic curve has `rank P = 2` and
  `rank(P/Q) = 1`.
- `display_etale_excluded`: the 3n-display of an étale `p`-divisible group over a perfect field has
  `P/Q = Lie = 0`, so `Q = P`, and it is not a display (a 3n-display is a display iff its étale part
  vanishes, Wedhorn (3.1.9)).
- `display_dual`: the dual 3n-display of the display of `μ_{p^∞}` is the 3n-display of `ℚ_p/ℤ_p`,
  which is not a display; duality preserves displays only in the bi-infinitesimal case.

- `display_deformation_zero`: `N = 0` gives the constant display.
- `display_deformation_skew`: for the rank-two alternating matrix `J`,
  `N = ((0,1),(0,0))` has `N² = 0` and `NᵀJ + JN = 0`; thus `1+[t]N` is symplectic.
- `display_deformation_not_skew`: `N = ((0,1),(0,0))` for the symmetric identity
  pairing is square zero but not skew, since `Nᵀ + N ≠ 0`; square zero alone is insufficient.

### M2.16 Wedhorn's ordinariness criterion

**Covariant Hodge cocharacter.** Under the connected type-A or type-C and good-reduction
hypotheses below, construct `covariantHodgeCocharacter`. Keep M0.12's Shimura cocharacter
`μ_h(z) = h_ℂ(z,1)`, of weight `1` on `V₀` and `0` on `V₀^c`. Let `ω(z) = z·id_V` be the
rational central scalar cocharacter and define `μ_cov(z) = ω(z) μ_h(z)⁻¹ = h_ℂ(1,z)`.
Prove that this cocharacter commutes with the `B`-action and has weights `0` on `V₀` and `1`
on `V₀^c`, retaining every coefficient embedding. Its similitude character is `z`, since
`ν(ω(z)) = z²` and `ν(μ_h(z)) = z`. The operation `μ ↦ ω − μ` on commuting cocharacters
respects conjugacy and the Galois action and is an involution, so the conjugacy classes of
`μ_h` and `μ_cov` have the same reflex field. Transport `μ_cov` to `ℚ̄_p` through the fixed
place and then take its dominant representative.

Prove the normalization dictionary with FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.20:
use the unscaled Frobenius `F` on `M_cov(A[p∞]) = M_contra(A[p∞]ᴰ)`, with slopes in `[0,1]`.
The ordinary `O`-linear quotient `M_cov/VM_cov ≅ Lie A` has the determinant type of `V₀`;
`V₀` is the weight-zero space for `μ_cov`. The complementary weight-one space specifies the
Hodge type of `F`; the polarization gives `⟨Fx,Fy⟩ = p σ(⟨x,y⟩)` after trivializing its
rank-one target, matching `ν(μ_cov(z)) = z`. Identify Wedhorn's local cocharacter by its
weight-zero determinant space in §2.1.4, and transport his Newton comparison and density theorem
with this coefficient action and pairing. (Source: ShimuraVarieties §P.3;
FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.20;
Wedhorn §§1.3.1–1.3.3, pp. 580–581, and §2.1.4, p. 586.)
*Needs:* M0.7, M0.11–M0.12, M0.18; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.20;
ShimuraVarieties §P.3.

**Checks.**

- For rank-one CM by `ℚ(i)` at `p = 5`, fix the CM embedding `τ` in `Lie A`. At an ordinary
  geometric CM point, the labelled groups are `μ_{5∞,τ} ⊕ (ℚ₅/ℤ₅)_{τ̄}`. In `(τ,τ̄)` order,
  `μ_h = (1,0)`, `μ_cov = (0,1)` and the covariant `F`-Newton point is `(0,1)`.
  Frobenius fixes the labels; the split torus has trivial Weyl group and its dominance order
  is equality. Thus the CM fibre is `μ`-ordinary with `μ_cov`; comparison with `μ_h` fails.
- For the genus-one Siegel datum, the two cocharacters are Weyl conjugate with defining weights
  `{0,1}` and multiplier `z`; the unlabelled slope sequence does not distinguish them.
- For rank-one CM at an inert prime, Frobenius exchanges the two embedding labels.
  The Galois averages of both cocharacters are `(½,½)`, while before averaging their labelled
  weights are complementary. With the separate normalization `φ = p⁻¹F` the Newton weights
  would instead be `(−½,−½)`.

**PEL Newton point and averaged Hodge cocharacter.** Under the connected type-A or type-C
and good-reduction hypotheses below, construct `pelNewtonPoint` and `averagedHodgeCocharacter`
in the dominant rational cocharacter chamber of `G_{ℚ_p}`. Use the absolute based root datum,
cocharacter lattice and finite based Galois action of ReductiveGroupsPartII RG2.5.1
`AbsoluteRootData` (with ReductiveGroups Layer 7). Let `μ_cov^dom` be the dominant representative
of `covariantHodgeCocharacter`, and define `averagedHodgeCocharacter`, written `μ̄_cov`, as the
average of its finite local Galois orbit for the based action.
For a geometric PEL point `x`, its covariant Dieudonné isocrystal with unscaled `F` retains the
`B`-action and alternating pairing up to similitude. A pairing-preserving `B`-linear trivialization identifies
Frobenius with `bσ`, `b ∈ G(Frac W(k))`; changing trivialization gives `σ`-conjugacy.
Construct the Newton rational cocharacter `ν(x)` by the tensor-compatible slope decompositions
in algebraic representations of `G`, retaining the coefficient idempotents and pairing. Its
weights on the defining representation recover the supplied covariant `F`-slope sequence.
Prove independence of splitting field and trivialization and invariance under algebraically
closed field extension. Define `IsMuOrdinary x` by `ν(x) = μ̄_cov`, and `muOrdinaryLocus` by this
condition on geometric points; prove it is well defined on underlying points. The slope bound
`ν(x) ≤ μ̄_cov` and specialization of Newton points make this locus open; density is
`wedhornOrdinary`. These PEL adapters are constructed here, using the ordinary slope
construction of FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.15–R07.2.16 and the
normalization dictionary of `covariantHodgeCocharacter`.
(Source: Wedhorn §§1.4.3–1.6.1, pp. 583–584, and §2.1.1, p. 585;
Rapoport–Richartz §§3.4–3.6 as cited there.)
*Needs:* M0.8, M0.12, M0.27, M2.8; `covariantHodgeCocharacter`;
FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.15–R07.2.16, R07.2.20;
ReductiveGroupsPartII RG2.5.1 `AbsoluteRootData`; ReductiveGroups Layer 7.

**Checks.**

- In Siegel genus one, `μ̄_cov` has slopes `(0,1)`; the supersingular point with slopes
  `(½,½)` is excluded from `muOrdinaryLocus`.
- For rank-one CM by an imaginary quadratic field at an inert prime, Frobenius exchanges
  the two embedding labels and `μ̄_cov` has slopes `(½,½)`. The CM point is `μ`-ordinary
  although its elliptic curve is supersingular.
- For inert Picard signature `(2,1)`, averaging the two labelled covariant Hodge cocharacters gives
  slopes `(0,0,½,½,1,1)` on the six-dimensional rational representation. The `μ`-ordinary
  point is not ordinary; discarding the embedding labels before averaging loses this calculation.

Prove `wedhornOrdinary`: let the PEL datum have connected group `G` (type A or C) and let `p` satisfy
Wedhorn's good-reduction hypotheses (§1.4, p. 582: the local algebra is a product of matrix algebras
over unramified extensions, a maximal star-stable order and a self-dual lattice exist, and the level at
`p` is hyperspecial). Fix a place `v` of the reflex field `E` above `p` and a small enough prime-to-`p`
level so that the smooth moduli space exists over `O_{E,v}`. The `μ`-ordinary locus of the special
fibre at `v` is open and dense (Wedhorn's Density Theorem (1.6.2), p. 584), and the ordinary locus is
nonempty iff it is dense iff `E_v = ℚ_p` (Wedhorn, (1.6.3), pp. 584–585; Bijakowski–Pilloni–Stroh,
§1.5, p. 987, and Remarque 1.5.1, p. 988). Since `E_v` is unramified, this is the condition that the
residue degree at the chosen `v` is `1`; complete splitting of `p` in `E` implies it at every `v`, but
the criterion at one `v` says nothing about the other places, and the hypothesis of
Bijakowski–Pilloni–Stroh (Hypothèse 1.1.1, complete splitting) is stronger than good reduction. The
proof identifies the completed local rings with display deformations (M2.15 and Serre–Tate), reduces
by Morita equivalence to four special cases (Wedhorn, Chapter 2, pp. 585–591), constructs the explicit
deformations in the linear, unitary, symplectic and orthogonal cases (Chapter 4, pp. 599–617) to show
that the `μ`-ordinary Newton polygon (§1.5, p. 583) occurs generically in every deformation, and
compares: the ordinary polygon is the `μ`-ordinary one exactly when Frobenius fixes the conjugacy class
of `μ_cov`, equivalently of `μ_h` by the central complement involution, that is `E_v = ℚ_p`.
*Needs:* M0.10, M0.16, M2.8, M2.15; `covariantHodgeCocharacter`;
`pelNewtonPoint`, `averagedHodgeCocharacter`, `IsMuOrdinary`, `muOrdinaryLocus`.

**Checks.**

- `wedhorn_siegel`: for the Siegel datum `E = ℚ` and the ordinary locus of `A_g ⊗ 𝔽_p` is dense.
- `wedhorn_picard_inert`: for the Picard datum over `K` imaginary quadratic with `p` inert in `K`,
  `E_v = K_v ≠ ℚ_p`, so the ordinary locus is empty (the `μ`-ordinary locus is not ordinary).
- `wedhorn_picard_split`: for `p` split in `K`, `E_v = ℚ_p` and the ordinary locus is dense.

### Examples

- Siegel: `A_{g,n}` is a smooth algebraic space of relative dimension `g(g+1)/2` over `ℤ[1/n]` for
  `n ≥ 3`, with universal family, and its ordinary locus mod `p` is dense.
- Rank-one CM: `M_H` is finite étale, with no deformations.
- Picard `(2, 1)`: smooth of relative dimension `2`; the ordinary locus is empty at inert primes.

### Dependencies

M0, M1; AbelianSchemesAndArithmeticModuli A1, A2, A4.3, A4.7–A4.9, A6.18;
AlgebraicModuliForArithmeticGeometry Layers 2, 3, 7, 8; SchemeAndStackFoundations Layers 0–4;
NeronModelsAndSemistableAbelianVarieties R11.1, R11.3, R11.5; AbelianSchemesAndArithmeticModuli §A4.CR.7.2;
FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2; ReductiveGroupsPartII RG2.5.1;
ReductiveGroups Layer 7; ShimuraVarieties §P.3;
TauCetiRoadmap.AdelicAlgebraicGroups §4.3; TauCetiRoadmap.ModularCurves §5B, §7D.

## Layer M3: Galois forms and complex uniformization

M3 classifies the rational forms of a PEL datum by `ker¹(ℚ, G)` and identifies the complex fibre of
`M_K^ad` with the disjoint union of the arithmetic quotients of those forms, first as analytic spaces and
then algebraically. It keeps every locally trivial global form and the full, possibly disconnected,
group. The comparison does not need SV3; the Shimura-variety name does.

### M3.1 Forms of the skew-hermitian module and `ker¹(ℚ, G)`

Prove `ker1Classification`: for a rational datum `(B, *, V, ⟨·,·⟩)` with similitude group `G`, the
similarity classes of nondegenerate skew-hermitian `B`-modules `(V′, ⟨·,·⟩′)`
geometrically similar to `(V, ⟨·,·⟩)` (hence with its `B`-multi-rank),
isomorphisms being allowed to scale the form by `ℚ^×`, are classified by `H¹(ℚ, G)`, and those with
`(V′ ⊗ ℚ_v, ⟨·,·⟩′) ≅ (V ⊗ ℚ_v, ⟨·,·⟩)` up to `ℚ_v^×` at every place are classified by the finite pointed
set `ker¹(ℚ, G)` (Kottwitz, §8, p. 399, and §7, p. 393). Choosing representatives
`V^{(1)} = V, …, V^{(m)}` and local isomorphisms `V^{(i)} ⊗ ℚ_v ≅ V ⊗ ℚ_v` gives inner forms `G^{(i)}`
of `G` with identifications `G^{(i)}(ℚ_v) ≅ G(ℚ_v)` for all `v` (`ker1Forms`). The `B`-module has no
nontrivial forms because `H¹` of the `B`-linear general linear group vanishes (Hilbert 90 for the
semisimple algebra `C`); forms of the pairing up to scalars are twists by `H¹(ℚ, G)` (M0.9(2)),
realized as torsors (TauCetiRoadmap.AdelicAlgebraicGroups §4.1 through M0.9(1)); finiteness is M0.9(3).
*Needs:* M0.6, M0.8, M0.9.

**Checks.**

- `ker1_siegel`: `ker¹(ℚ, GSp_{2g}) = 1`, so `m = 1`.
- `ker1_scaling`: `(V, c⟨·,·⟩)` for `c ∈ ℚ^×` is the trivial class (isomorphisms may scale).
- `ker1_unitary_odd`: unitary similitude groups in an odd number of variables can have `ker¹ ≠ 1`
  (Kottwitz, §7), so the union over `ker¹` cannot be dropped.

### M3.2 When the Hasse principle holds

**Finite unitary centre and its all-place obstruction.** For a rational datum with `B` simple
of Case A, CM centre `F/F₀` and hermitian dimension `n ≥ 1`, put `Z = Z(G)`,
`Z₀ = Z(G^der)` and `D₁ = Res_{F₀/ℚ} ker(N_{F/F₀} : Res_{F/F₀} G_m → G_m)`.
Identify `Z₀ = D₁[n]`, a finite group scheme, and its character module with
`Ind_{Γ_{F₀}}^{Γ_ℚ}(ℤ/n(χ_{F/F₀}))`, where the nontrivial quadratic automorphism acts by
`−1`. The inclusions of norm-one scalars give a commutative diagram from
`1 → Z₀ → D₁ →[n] D₁ → 1` to `1 → Z₀ → Z → D → 1`, with identity on `Z₀`
and `D = G/G^der` (Kottwitz, §7, p. 394).

Prove `unitaryCentre_sha_vanishing`: `Ш¹(ℚ,X^*(Z₀)) = 0` and `Ш²(ℚ,Z₀) = 0`,
where `Ш` denotes the kernel of localisation at all places. Shapiro reduces the first
claim to the sign module `A = ℤ/n(χ_{F/F₀})` over `F₀`. Restriction to `F` makes `A`
constant; a locally trivial continuous character into this finite group is zero by
Chebotarev. Inflation–restriction therefore places the original class in
`H¹(Gal(F/F₀),A)`. At a finite place of `F₀` inert in `F`, local inflation is injective
and the decomposition group maps onto `Gal(F/F₀)`, so local triviality kills this class.
This argument applies to every `n ≥ 1`.

For the second claim, apply ArithmeticGaloisDuality R02.4.6, “All-place Sha duality and
transfer adjunction”, to the finite module `M = Z₀(ℚ̄)` of exponent dividing `n`, whose
Cartier dual `Hom(M, μ_n)` is `X^*(Z₀)`. It gives the perfect pairing
`Ш²(ℚ,Z₀) × Ш¹(ℚ,X^*(Z₀)) → ℚ/ℤ`, including the real Tate terms, hence the vanishing.
In particular every `d ∈ Ш¹(ℚ,D)` lifts to `H¹(ℚ,Z)`: its connecting obstruction lies
in `Ш²(ℚ,Z₀)` (Kottwitz, §7, p. 394).
*Needs:* M0.8, M0.9; ArithmeticGaloisDuality R02.4.6 (the finite-coefficient target named above);
ProfiniteCohomology Layers 5, 7 and 10 (inflation–restriction, Shapiro and exact sequences);
Chebotarev Layer 10.

**Checks.**

- For an imaginary-quadratic rank-three unitary datum, `G^der_ℚ̄ ≅ SL₃`,
  `Z₀,ℚ̄ ≅ μ₃` and `X^*(Z₀) ≅ ℤ/3` geometrically, with quadratic sign action.
  Thus `Z₀` is finite and its character module is torsion, rather than a torus lattice.
- For `n = 1`, `Z₀` is trivial and both obstruction groups vanish.
- For an imaginary-quadratic rank-two datum, the sign action on `ℤ/2` is trivial and
  `H¹(Gal(F/ℚ),ℤ/2) ≅ ℤ/2`. Its nonzero class is detected at an inert finite place;
  the all-place kernel still vanishes without assuming that this global `H¹` vanishes.

Prove `hasseCases`: let the datum have `B` simple. (C) In Case C, `G/G^der = G_m` and `ker¹(ℚ, G) = 1`.
(A) In Case A with hermitian dimension `n` even, `ker¹(ℚ, G) = 1`; with `n` odd, `G` may fail the Hasse
principle and `ker¹(ℚ, Z) → ker¹(ℚ, G)` is a bijection for the centre `Z` of `G` (Kottwitz, §7,
pp. 393–394). (D) In Case D no single-variety statement is made. Consequently, when SV3 also holds, in
Cases C and A with `n` even the characteristic-zero moduli at level `K` is one Shimura variety
(M3.4), and in Case A with `n` odd it is a disjoint union of `|ker¹(ℚ, G)|` of them. In Cases A and C,
`G^der` is simply connected (M0.8), so by M0.9(4) a class trivial at all places, including `∞`, is trivial
whenever `H¹(ℚ, D) → ∏_{v≤∞} H¹(ℚ_v, D)` is injective for `D = G/G^der` (Milne, Lemma 8.20, p. 89); in Case C
`D = G_m` (Hilbert 90); in Case A with `n` even `D ≅ D₁ × G_m` with `D₁` the norm-one torus of the cyclic
`F/F₀`, and the Hasse norm theorem gives injectivity (Milne, Lemma 8.21, p. 89; M0.9(5)).
For `n` odd, `H¹(k,D₁)` is killed by `2` for `k = ℚ` and every `ℚ_v`. Multiplication by
`n` is therefore bijective on these groups. The norm-one row of the diagram shows that
`H¹(k,Z₀) → H¹(k,D₁) → H¹(k,Z)` is zero, so `H¹(k,Z) → H¹(k,D)` is injective.
The lift supplied by `unitaryCentre_sha_vanishing` is consequently locally trivial,
giving a bijection `ker¹(ℚ,Z) → ker¹(ℚ,D)`. For a class in `ker¹(ℚ,G)`, lift its
image in `ker¹(ℚ,D)` to `z ∈ ker¹(ℚ,Z)` and twist by `z⁻¹`. The resulting class
has trivial image in `H¹(ℚ,D)`; the simply connected Hasse and real-approximation
argument of M0.9(4) makes it trivial. Injectivity follows from
`H¹(ℚ,Z) → H¹(ℚ,D)`. This proves the central bijection (Kottwitz, §7, p. 394).
*Needs:* M0.2, M0.8, M0.9, M3.1; `unitaryCentre_sha_vanishing`;
TauCetiRoadmap.ClassFieldTheory Layer 13; TauCetiRoadmap.AdelicAlgebraicGroups §4.1.

**Checks.**

- `hasse_siegel_hilbert`: the Siegel and Hilbert data (Case C) have `ker¹ = 1`.
- `hasse_GU21`: over an imaginary quadratic field, for `GU(2,1)` the quotient torus
  `{N(x)=t³}` is `Res_{K/ℚ} G_m` via `y ↦ (N(y)y,N(y))`, so Hilbert 90 gives `ker¹ = 1`.
  Odd-rank failure concerns more general CM centres, not this Picard example.
- `hasse_U22`: for `U(2, 2)` (`n = 4` even), `ker¹(ℚ, G) = 1`.

### M3.3 Arithmetic quotients of PEL groups

Prove `arithmeticQuotient_structure`: for the full PEL similitude group `G`, its
real orbit `X` and a Pink-neat open compact `K`, the quotient
`G(ℚ) ∖ (X × G(𝔸_f)/K)` is a finite union of quotients `Γ_j\X_j⁺`.
Here `Γ_j` means the effective image of a rational stabilizer on a connected
Hermitian symmetric domain `X_j⁺`, rather than the stabilizer with its central
kernel retained. These images are torsion-free arithmetic subgroups of the
holomorphic automorphism group, acting freely and properly discontinuously.
Each quotient has its complex-manifold structure, Baily–Borel quasi-projective
algebraization and Borel algebraicity for holomorphic maps from smooth
quasi-projective complex varieties (Milne, Proposition 3.6, p. 34,
Theorems 3.12 and 3.14, pp. 38–39; Lan, *An example-based introduction*,
§5.1.3, pp. 54–56, for the full group).

Prove the adapter `arithmeticQuotient_effectiveImage` first: reduction theory
gives finitely many rational/adelic component stabilizers. A rational
stabilizer has multiplier in `ℚ^× ∩ ν(K) ⊆ {±1}`, and preserving the positive
domain forces multiplier `1`. Work therefore in `(G₁)°`, rather than projecting
the noncompact similitude centre directly. The centre of `(G₁)°(ℝ)` is compact;
so are the real factors acting trivially on the domain, by the Cartan-involution
condition. The stabilizer is arithmetic there, and projection to its effective
real image has compact kernel, as required by Milne's definition (p. 34).
Discreteness before projection and compactness of that kernel make its arithmetic
intersection finite. Neatness makes this intersection trivial and kills any
finite-order effective stabilizer. Thus the image is discrete and torsion free. To apply the connected-Shimura suppliers,
quotient `(G°)^ad` only by its **`ℚ`-simple factors** on which `h` is trivial;
this yields an effective adjoint connected datum satisfying SV3, with the same
domain. Retain any `ℚ`-simple factor having both compact and noncompact real
factors: its compact real factors need not define a quotient over `ℚ`.
Use Milne's connected-Shimura-variety formulation (§4, p. 46) for the
arithmetic images; extend the finite component decomposition through the
full group. No rational group obtained by deleting arbitrary compact real
factors is assumed. This adapter supplies the missing interface between
the general PEL quotient and ShimuraVarieties Layers 0–3.
When `G` is connected and SV3 holds, the result is `Sh_K(G,X)`.
*Needs:* M0.8, M0.12, M2.2; ShimuraVarieties Layers 0–3; the reduction-theory
and group-quotient suppliers named in Scope.

**Checks.**

- `arithmeticQuotient_siegel`: for `GSp_{2g}`, `g > 0`, and `K(n)`, `n ≥ 3`,
  the components are the `φ(n)` copies of `Γ(n)\ℍ_g`.
- `arithmeticQuotient_definite`: if the whole adjoint real group is compact,
  its domain is a point and the quotient is a finite set; effective stabilizers are trivial.
- `arithmeticQuotient_mixed_real`: restriction of scalars of a quaternion
  norm-one group over a real quadratic field, split at one real place and
  division at the other, is `ℚ`-simple. Its compact real factor acts trivially
  on the upper half-plane but cannot be removed as a `ℚ`-factor.
- `arithmeticQuotient_typeD`: component indices use the full group; the
  index set is computed by double cosets, not by counting connected components of `G`.

### M3.4 Complex points of PEL moduli

Prove `complexPoints`: let the rational datum be of Case A or C, `X` the `G(ℝ)`-class of `h`,
`K ⊆ G(𝔸_f)` open compact, and `V^{(1)} = V, …, V^{(m)}` representatives of `ker¹(ℚ, G)` with inner
forms `G^{(i)}`. Then `M_K^ad(ℂ)` is the disjoint union of the subsets `M_K^ad(ℂ)^{(i)}` of quadruples
whose `H₁(A, ℚ)` is isomorphic to `V^{(i)}` as a skew-hermitian `B`-module, and
`M_K^ad(ℂ)^{(i)} ≅ G^{(i)}(ℚ) ∖ (X × G(𝔸_f)/K)` by `(A, λ, i, η̄) ↦ [(h_A, a ∘ η)]` for a `B`-isomorphism
`a : H₁(A, ℚ) ≅ V^{(i)}`; each piece is nonempty (Kottwitz, §8, p. 400; Milne, Theorem 8.17, p. 88, for
the piece of `V` and its condition `(∗∗)`). When SV3 holds and `ker¹ = 1` (Cases C and A with `n` even),
`M_K^ad(ℂ) = Sh_K(G, X)(ℂ)`. For the `p`-integral problem the same holds for `M_H^rat(ℂ)` with
`K = H · K_p`, `K_p` the stabilizer of a self-dual lattice, using M0.20 at `p` (Kottwitz, §8). For a
complex point, `H₁(A, ℚ)` with its `B`-action and `λ`-Weil form is isomorphic to `V` at every finite
place (through `η`) and at `∞` (the determinant condition gives `H^{−1,0} ≅ V₀`, then Kottwitz's
Lemma 4.2), so its class is in `ker¹`; `a ∘ h_A ∘ a⁻¹ ∈ X` (Kottwitz, Lemma 4.2; Milne, Proposition
8.13(a)); changing `a` changes the pair by `G^{(i)}(ℚ)`. Bijectivity uses Riemann's theorem
(AbelianSchemesAndArithmeticModuli A5, the polarized Hodge equivalence): from `(h′, g)` build the
abelian variety with lattice `g(L ⊗ Ẑ) ∩ V^{(i)}`, polarized by `ε(h′)ψ` cleared of denominators (the
polarization class does not depend on the positive clearing scalar). Nonemptiness: `V^{(i)}` carries a
lattice and an `h` (Lan, Remark 1.4.3.13). SV3 is not used. *Needs:* M0.11, M0.20, M1.9, M3.1;
AbelianSchemesAndArithmeticModuli A5.

The object-level realization consequence takes a finite free integral lattice,
an almost complex structure, a Riemann form, and an order action whose real extension commutes
with the complex structure. It produces a complex abelian variety `A`, a unital order action
`i : O → End(A)` and `g ≥ 0` with `rank L = 2g`, `dim A = g`, and
`i(b) = 0` iff `b` annihilates `L`. It permits nonfaithful and zero-rank actions. Riemann's
equivalence supplies the variety, and its full faithfulness transports the endomorphisms
(Milne, Theorems 6.7–6.8, pp. 72–73); the full `complexPoints` target also retains the polarization,
level and comparison of homology.

**Checks.**

- `complexPoints_siegel`: `A_{g,n}(ℂ) ≅ GSp_{2g}(ℚ) ∖ (ℍ_g^± × GSp_{2g}(𝔸_f)/K(n)) ≅ ⊔_{(ℤ/n)^×} Γ(n)\ℍ_g`.
- `complexPoints_nonempty`: every `ker¹`-piece contains a point.
- `complexPoints_not_only_V`: for a Case-A odd datum with `ker¹ ≠ 1`, Milne's condition `(∗∗)` selects
  one piece and drops the others; `M_K^ad(ℂ)` contains them all.
- For the principal rank-two lattice, realization gives an elliptic curve with
  faithful scalar action and `g = 1`.
- For `O = ℤ × ℤ` acting through the first projection on that lattice, the resulting action
  kills exactly the second factor; an injective order action would give the wrong realization.
- For the zero lattice, the resulting abelian variety has dimension zero and the action is zero.

### M3.5 The complex uniformization morphism

Define `PELModuli.analyticFamily`: for neat `K`, choose a full `O`-stable lattice
`L_K ⊆ V` whose completion is `K`-stable and scale `ψ` by a positive rational
so it is integral on `L_K`. Such a lattice exists: locally take the sum of the
`O ⊗ ℤ_ℓ`-spans of
`kΛ_ℓ` for `k ∈ K_ℓ`. Compactness bounds this sum inside a fixed fractional
lattice, and `K_ℓ` commutes with `O`. At almost all primes the original
lattice is already stable; intersect the resulting completions with `V`.
For a class `i ∈ ker¹(ℚ, G)`, over `X × G(𝔸_f)/K` the
family of complex tori `A_{h′,g} = V_ℝ^{(i)}/L_g`, `L_g = V^{(i)} ∩ g(L_K ⊗ Ẑ)`, with complex structure
`h′(√−1)`, polarization represented by `ε(h′) q_g ⟨·,·⟩`, the `B`-action, and the level induced by `g`.
The lattice is independent of the representative of `gK` by `K`-stability.
Construct the actual family using the integral presentation for `L_K` (M1.10);
comparisons for different such lattices are in the rational isogeny category.
Here `ε(h′) ∈ {±1}` makes `ε(h′)ψ(x, h′(√−1)x) > 0` on the component of `h′`, and `q_g > 0` is rational
with `q_g c(g) ∈ Ẑ^×`. The family is `G^{(i)}(ℚ)`-equivariant (`analyticFamily_equivariant`: `γ` maps
`A_{h′,g}` to `A_{γh′γ⁻¹, γg}` through `γ : V_ℝ → V_ℝ`, with `ε(γh′) = sign(c(γ))ε(h′)` and
`q_{γg} = q_g/|c(γ)|`, so the polarization is preserved; the raw PEL form `ψ(x, h′(√−1)x)` is
negative on components with `ε(h′) = −1`, when such components exist). It is built from the relative
Riemann theorem for analytic families and the Siegel family (AbelianSchemesAndArithmeticModuli A5,
whose Riemann-form convention needs the input
`E = −ε(h′) q_g ψ`) and descends to `Q_K^{(i),an} = G^{(i)}(ℚ) ∖ (X × G(𝔸_f)/K)` by M3.3.

Construct `PELModuli.periodMap`: for a Case A or C datum and neat `K`, the morphism
`per : (M_K^ad ⊗_{F₀} ℂ)^an → ⊔_i Q_K^{(i),an}`. On an étale scheme atlas of the moduli space,
use M1.10's integral presentation and M2.9's universal family. Analytify this algebraic family and
apply AbelianSchemesAndArithmeticModuli A5.6. On simply connected analytic opens, mark the rational
Betti homology as a `B`-module with pairing up to rational scalar by `V^{(i)}`. The action and pairing
are flat, so the rational-form index is locally constant; M3.4 supplies its allowed values.
The holomorphic Hodge filtration gives a holomorphic map to the flag variety.
The order action, polarization and determinant condition put its image in `X`; the Betti–étale
comparison transports the level to a locally constant coset in `G(𝔸_f)/K`.
Changing the marking by `γ ∈ G^{(i)}(ℚ)` changes `(h′,gK)` to `(γh′γ⁻¹,γgK)`.
Thus the maps to the quotient agree on marking overlaps and on the analytified atlas relation.
Their structure-sheaf maps are pullbacks of holomorphic functions along these flag-coordinate maps;
ComplexComparisonPartII §C−1.3 `SpaceAnalytification.quotient` descends them to `per`.
This constructs a morphism of analytic spaces, including its sheaf map (Milne, §2, pp. 28–29,
for holomorphic filtrations and their differential, and Proposition 6.3, p. 70, for the marking
formula; Kottwitz, §8, p. 400, for the rational-form pieces).

Prove that `per` is an isomorphism: M3.4 gives bijectivity on points, and its differential is the
variation of the Hodge filtration, identified by A5.6 with the Kodaira–Spencer map of M2.10.
That is an isomorphism onto the tangent space of `X`. Both source and target are complex manifolds
by M2.8 and M3.3, so the analytic inverse function theorem gives local analytic inverses, which glue
by bijectivity (Tau Ceti `AnalyticAt.exists_openPartialHomeomorph`, used in
ComplexComparisonPartII §C−1.1). Define `PELModuli.uniformization` by this inverse, with restrictions
`u^{(i)} : Q_K^{(i),an} → (M_K^ad ⊗_{F₀} ℂ)^an`. Each is an open and closed immersion
(`uniformization_openClosed`, `uniformization_analyticOpenClosed`). The API further has
`uniformization_hecke` (commutes with level change and Hecke translation), `uniformization_universal`
(`u^{(i)*}(A^univ)^an`, using the integral presentation for `L_K`, is the descended family by A5.6
applied to the marked Hodge variations, with `λ`, `i` and level), and `uniformization_siegel`
(for the principal genus-one datum, the modular analytic family). The notation `Q` is the PEL arithmetic quotient; it is
`Sh_K(G^{(i)}, X)` when SV3 holds and `G` is connected (Kottwitz, §8, p. 400; Milne, Proposition 6.3,
p. 70, for the Siegel case; Tsimerman, *The André–Oort conjecture for `A_g`*, §6.1, p. 387). *Needs:* M1.10, M2.8, M2.9,
M2.10, M3.3, M3.4; AbelianSchemesAndArithmeticModuli A5.6; ComplexComparisonPartII §§C−1.1–C−1.3;
ShimuraVarieties Layers 0–1; SchemeAndStackFoundations Layer 1; Mathlib `UpperHalfPlane`.

**Checks.**

- For `L = ℤ²`, `a = diag(2,1)` and the neat subgroup `K = aK(3)a⁻¹`,
  the element `k = ((1,0),(3/2,1))` lies in `K` but does not preserve `L`.
  Representatives `1,k` of the same coset give distinct lattices with the raw
  formula. Choosing `L_K = aℤ²` makes the formula invariant.
- `uniformization_g1`: for `g = 1`, `⊔_{(ℤ/n)^×} Γ(n)\ℍ → Y(n)(ℂ)^an`,
  `(a,τ) ↦ (ℂ/(ℤ + ℤτ), (1/n, aτ/n))`, with
  `ζ_n = exp(2πi/n)`, has polarized PEL pairing `e_n^pol = ζ_n^a` and ModularCurves
  equation pairing `e_n^MC = ζ_n^(−a)` (AbelianSchemesAndArithmeticModuli A3.5–A3.7;
  ModularCurvesPartII §1.5). The basis `(1/n,τ/n)` has PEL label `a = 1` and lies in
  `Y(n,ζ_n⁻¹)`. At `n = 3`, `a = 2`, `τ = i`, the equation pairing is
  `ζ₃^(−2) = ζ₃`, distinct from the PEL pairing `ζ₃²`.
- `periodMap_constant`: a constant polarized PEL family with constant level on a connected analytic
  open has constant `per`; its Hodge filtration is constant in a flat marking.
- `periodMap_marking`: replacing a marking by `γ` changes both the filtration and the level coset
  by the displayed full rational action, so the quotient map and its structure-sheaf pullback agree.
- `periodMap_g1`: on the standard marked elliptic family over `ℍ`, `per` is the quotient of
  `τ ↦ τ`; its differential is the identity in the period coordinate, and its inverse recovers
  the family `ℂ/(ℤ + ℤτ)` with its level and polarization.
- `uniformization_all_pieces`: every locally trivial rational form contributes its own open and closed
  piece.
- `uniformization_family_pullback`: pulling back the universal family along `u^{(i)}` gives the
  period-domain family with action, polarization and level.
- `uniformization_negative_component`: replacing `J` by `−J` makes `ψ(x, Jx)` negative for all
  `x ≠ 0`; negating `ψ` restores positivity, which is why `ε(h′)` is chosen componentwise.
- In genus one with `ψ(e,f) = 1`, `Je = f` and `ε = q_g = 1`, the Riemann input
  `E = −ψ` has `E(Je,e) = 1`; the positive-sign choice has `ψ(Je,e) = −1`.
- For a rank-one imaginary-quadratic CM torus, `G(ℝ) = ℂ^×` has multiplier
  `c(z) = z z̄ = |z|² > 0`. Its conjugacy orbit `X` is a point and `ε` is constantly `+1`;
  there is no negative-multiplier component.

### M3.6 Algebraization of the uniformization

Prove `algebraization`: for neat `K` in Case A or C, `M_K^ad ⊗_{F₀} ℂ` is a quasi-projective scheme
and `⊔_i u^{(i)}` is the analytification of a unique isomorphism of `ℂ`-schemes
`⊔_{i ∈ ker¹(ℚ, G)} Q_K^{(i)} ≅ M_K^ad ⊗ ℂ`, where `Q_K^{(i)}` is the Baily–Borel algebraization of
M3.3; each piece is open and closed, and the identification is compatible with level change, Hecke
operators and universal families (Kottwitz, §8, p. 400; Lan, Remark 1.4.3.11, pp. 164–165, for several
Shimura varieties in the generic fibre). This uses neither an integral compactification nor a claim
that `M_K^ad` is one Shimura variety. Choose an étale atlas `U → M_K^ad ⊗ ℂ` by a scheme with
quasi-projective affine pieces; the holomorphic map `U^an → ⊔ Q_K^{(i),an}` lands in Baily–Borel
quasi-projective varieties (M3.3, ShimuraVarieties Layer 2), so Borel's theorem (Layer 3) makes it algebraic; the
maps agree on `U ×_M U` and descend to an algebraic morphism `M_K^ad ⊗ ℂ → ⊔ Q_K^{(i)}`. To see that it
is an isomorphism: at each point the completed analytic and algebraic local rings agree
(ComplexComparisonPartII §§C−1.1–C−1.3, `completedAnalyticStalkComparison`) and analytification is
faithfully flat on local rings (ComplexComparisonPartII §C0.4, `coherentAnalytification_faithful`); an
algebraic morphism whose analytification is a local isomorphism therefore induces isomorphisms of
completed local rings, hence is étale (the converse direction is §C−1.1 `complexSchemeAnalytification.etaleLocalIso`); étale and
bijective on geometric points between algebraic spaces of finite type is an isomorphism. Proper GAGA
cannot be applied directly because these spaces are not proper. *Needs:* M2.8, M3.3, M3.5;
ShimuraVarieties §§2.7 and 3.2; ComplexComparisonPartII §§C−1.1–C−1.3 and C0.4.

**Checks.**

- `algebraization_siegel`: for `n ≥ 3`, `A_{g,n} ⊗ ℂ` is quasi-projective and isomorphic to
  `⊔_{(ℤ/n)^×} Γ(n)\ℍ_g` with its Baily–Borel structure.
- `algebraization_pieces`: in Case A with `n` odd and `ker¹ ≠ 1` the generic fibre has several open and
  closed pieces.
- `algebraization_etale_test`: the identity of `𝔸¹_ℂ` composed with analytification is a local
  isomorphism and étale; `z ↦ z²` is not étale at `0`, and its analytification is not a local
  isomorphism there.

### M3.7 The full-group comparison in type D

Prove `typeDComparison`: for an integral datum with a type D factor, keep the full, possibly
disconnected, similitude group `G`. For neat `K`, the complex moduli `M_K^ad(ℂ)` is the disjoint union
over the finite pointed set `ker¹(ℚ, G)` of the full rational-form quotients
`G^{(i)}(ℚ) ∖ (X × G(𝔸_f)/K)`, with the same positive complex-structure orbit and transported level, and
the analytic comparison of M3.5 holds for these quotients (Lan, *An example-based introduction*,
§5.1.3, pp. 54–56). No replacement of `G` by `G°` with a separate component formula is made. The proof
is direct: Lan's Hodge–lattice equivalence for the full group, the forms indexed by `ker¹(ℚ, G)`
(M3.1, with M0.9 for disconnected groups), and the relative Riemann family descended by the full
rational action (M3.3). Extend `PELModuli.periodMap` by the atlas and marked-filtration construction
of M3.5, now using this full-group point classification: changes of marking lie in the full
`G^{(i)}(ℚ)`, including its disconnected components, and descend both the holomorphic maps and their
sheaf pullbacks. M2.10 identifies its differential with an isomorphism; the analytic inverse theorem
therefore gives the comparison as its inverse, with the universal-family identification from A5.6.
*Needs:* M0.8, M0.9, M0.11, M0.20, M1.9, M2.9, M2.10, M3.1, M3.3, M3.5;
AbelianSchemesAndArithmeticModuli A5.6; ComplexComparisonPartII §§C−1.1–C−1.3, C0.4.

**Checks.**

- `typeD_not_connected_datum`: a type D datum is not identified with the connected-group Shimura datum;
  the component and level comparison is made with the full group.
- `typeD_period_marking`: a change of marking in a nonidentity component of `G^{(i)}(ℚ)`
  still gives the same period-map value in the full quotient; quotienting only by `G°(ℚ)`
  need not identify these markings.
- `typeD_components`: for a definite quaternion algebra over `ℚ` with `V = B²`, `G` has two components
  before taking double cosets. Whether their adelic representatives remain distinct depends
  on `G(ℚ)` and `K`; component count alone does not determine the quotient index set.

### M3.8 The hermitian space of homomorphisms from a CM object

Define `hermitianHomOfAbelianSchemes`: for an algebraically closed field `K` over `O_{F_Ψ} ⊗ P`, a
unitary `O_F`-abelian scheme `(A₀, i₀, λ₀)` of signature type `Φ` (a CM type) and one `(A, i, λ)` of
signature type `Ψ`, and a set `□` of places containing `∞` and `char K`, the module
`Hom_{F ⊗ 𝔸^□}(H₁^ét(A₀, 𝔸^□), H₁^ét(A, 𝔸^□))` with
`(x, y) = i₀⁻¹((λ_{0*})⁻¹ ∘ y^∨ ∘ λ_* ∘ x) ∈ i₀⁻¹ End_{F⊗𝔸^□}(H₁^ét(A₀, 𝔸^□)) = F ⊗ 𝔸^□`; over `ℂ` the same with
Betti homology gives a hermitian space over `F` whose signature is determined by `Ψ` and `Φ`, used to
compare unitary moduli with `Sh(U(V), K)` (Liu–Tian–Xiao–Zhang–Zhu, Construction 3.4.4, p. 149). The
general-module form is `hermitianHom`. The API is `hermitianHom_isHermitian` (linear in `x`,
`c`-semilinear in `y`, hermitian and perfect: `H₁^ét(A₀)` is free of rank one over `F ⊗ 𝔸^□`, the
Rosati relation `λ₀ i₀(a) = i₀(a^c)^∨ λ₀` gives semilinearity, symmetry of polarizations gives the
hermitian symmetry, and nondegeneracy of Weil pairings gives perfectness); `hermitianHom_rank` (rank
`N` for `Ψ` of rank `N`); `hermitianHom_functorial` (postcomposition; preserving the form needs the
similitude conditions); and `hermitianHomOfAbelianSchemes_complex` with
`hermitianHomOfAbelianSchemes_complex_pairing` (the Betti–étale comparison is `O_F ⊗ 𝔸_f`-linear and
preserves the pairing). *Needs:* M0.22, M1.3, M1.4.

**Checks.**

- `hermitianHom_rank_one`: for `A = A₀`, `Hom = F ⊗ 𝔸^□` with `(x, y) = x ȳ` up to the unit given by
  `λ, λ₀`.
- `hermitianHom_scaling`: replacing `λ` by `cλ`, `c ∈ ℚ_{>0}`, multiplies the pairing by `c`.
- `hermitianHom_not_bilinear`: for `F = ℚ(i)`, `A = A₀` and `λ = λ₀`,
  the rank-one form is `H(x,y) = xȳ`, so `H(1,i) = −i ≠ iH(1,1)`; it is not bilinear.
  For `A = 0` the form is zero and is also bilinear.
- `hermitianHom_zero`: for `A = 0` (`N = 0`) the space is `0`; for `A = A₀^N` it is `(F ⊗ 𝔸^□)^N` with the
  standard form.

### M3.9 Siegel moduli at full level over `ℂ`

Prove `siegelFineUniformization` by comparing the generic fibre of the integral problem
with ShimuraVarieties §5.0 `TauCeti.Shimura.rational_siegel_moduli` via M1.10 and applying
`TauCeti.Shimura.siegel_moduli_uniformization` to its analytic family. This comparison retains
the lattice, polarization, multiplier and universal-family identification. For the Siegel datum
of genus `g ≥ 1` and `n ≥ 3`, the complex fibre of
`A_{g,n} = M_{U(n)}` over `ℤ[1/n]` satisfies `A_{g,n}(ℂ) ≅ ⊔_{ζ ∈ μ_n^prim} Γ(n)\ℍ_g`, with `ℍ_g` the
symmetric complex `g × g` matrices with positive definite imaginary part and
`Γ(n) = ker(Sp_{2g}(ℤ) → Sp_{2g}(ℤ/n))`; the component indexed by `ζ` consists of the points with
`ν_n(1) = ζ` (Milne, Theorem 6.11 and its full-level specialization, pp. 74–75;
Tsimerman, §6.1, p. 387, for the level-one quotient). For `g = 1` this is `⊔ Γ(n)\ℍ` with
Mathlib's `UpperHalfPlane`. The scheme and period family are supplied by §5.0;
strong approximation for `Sp_{2g}` and
`ν(K(n)) = Ẑ^× ∩ (1 + nẐ)` identify `G(ℚ) ∖ (ℍ_g^± × G(𝔸_f)/K(n))` with `⊔_{(ℤ/n)^×} Γ(n)\ℍ_g`
(ShimuraVarieties Layer 0). *Needs:* M1.10, M3.4, M3.5; ShimuraVarieties Layer 0 and §5.0
`TauCeti.Shimura.rational_siegel_moduli`, `TauCeti.Shimura.siegel_moduli_uniformization`;
Mathlib `UpperHalfPlane`.

**Checks.**

- `siegelFine_g1_n3`: `(ℤ/3)^×` has two elements, so `A_{1,3}(ℂ)` has two components, each `Γ(3)\ℍ`.
- `siegelFine_components`: the number of components of `A_{g,n}(ℂ)` is `φ(n)`, independent of `g`.
- The generic-fibre comparison identifies the actual universal family at `n ≥ 3`,
  while at level `2` the supplied coarse space has no universal-family assertion.

### Examples

- Siegel, `g = 1`: `Y(n)(ℂ) ≅ ⊔_{(ℤ/n)^×} Γ(n)\ℍ` analytically and algebraically.
- Picard `(2, 1)` over `ℚ(√−3)`: the generic fibre is one Picard Shimura variety (`ker¹ = 1`), whose
  connected ball-quotient components are determined by the level double cosets.

### Dependencies

M0, M1, M2; AbelianSchemesAndArithmeticModuli A5; ComplexComparisonPartII §§C−1.1–C−1.3;
ComplexComparisonPartII §§C−1.1–C−1.3, C0.4; ShimuraVarieties Layers 0–3; SchemeAndStackFoundations Layer 1;
TauCetiRoadmap.AdelicAlgebraicGroups Layers 3–4; TauCetiRoadmap.ClassFieldTheory Layer 13;
ArithmeticGaloisDuality R02.4.6; ShimuraVarieties §5.0.

## Layer M4: Canonical models, twists and integral level changes

M4 descends the complex comparison of M3 to the reflex field. Reciprocity on CM points of each
inner datum, with density and uniqueness, identifies every `ker¹`-piece with its canonical model.
For a simple type-A algebra of odd hermitian rank, Kottwitz's central and adelic twists also
transport the pieces and their families; locally trivial global classes retain their labels.
M4 then builds normal integral models at higher `p`-level by relative normalization,
the rank-one CM moduli schemes over the reflex field of a CM type, and the trace on their torus-invariant
cohomology. Statements with Shimura-variety names assume SV3 and connected `G`.

### M4.1 Reciprocity on CM points

Prove `cmReciprocity`: assume the connected datum satisfies SV3, `K` neat, Case A or C. Let `(T, h)` be
a special pair of the inner datum `(G^{(i)}, X)` (ShimuraVarieties §P.1) with reflex field `E(T, h) ⊇ F₀`, and
`x = [h, g]` a special point of the `i`-th piece of `M_K^ad(ℂ)` (ShimuraVarieties §P.1; `A_x` has CM by a CM
algebra containing the image of `T`). For `σ ∈ Aut(ℂ/E(T, h))` and `s ∈ 𝔸^×_{E(T,h),f}` with
`art(s) = σ|_{E(T,h)^ab}` in the normalization of ShimuraVarieties Layer 4 (`geometricArtin`), the point
`σ(x)` given by the `F₀`-structure of the moduli problem (base change of `(A, λ, i, η̄)` along `σ`) is
`[h, r_{(T,h)}(s) g]`, with `r_{(T,h)}` the reflex-norm reciprocity map. Hence the `F₀`-structure on
`M_K^ad` satisfies the canonical-model condition of Layer 4 on special points (Kottwitz, §8, p. 400; Milne,
Proposition 14.12, p. 125, for the strategy). Apply the main theorem of complex multiplication with
polarization and level (ShimuraVarieties Layer 5, `main_cm`, `cm_polarization_level`) to `A_x` with its full
finite adelic level; compute the action of `σ` through the reflex norm and Layer 4's Artin normalization,
including the Tate-twist multiplier. *Needs:* M3.4, M3.6; ShimuraVarieties §P.1, §§4.1–4.4 and §§5.10–5.11.

**Checks.**

- `cmReciprocity_g1`: for an elliptic curve with CM by `O_K` and `σ ∈ Aut(ℂ/K)`, `σ` acts on `j(E)` through
  the Artin symbol of the class group of `K` (classical CM).
- `cmReciprocity_normalization`: with the inverse Artin normalization the computed action would be by
  `r(s)⁻¹`; the Layer 4 convention fixes the sign.

### M4.2 Twisting automorphisms between ker¹-pieces

Define `PELModuli.twist (a, β)`: for `B` simple in Kottwitz's Case-A odd-rank situation (§8, pp. 398–401, especially
p. 400), for a totally positive self-adjoint central `a`, a unit at the fixed good `p` for the `p`-integral problem, and `β` in the
finite adeles of the centre away from `p` with `a N(β_v)` a scalar in `ℚ_v^×` at every `v ≠ p`, the
natural automorphism of the rational family functor sending `(A, λ, i, [η])` to
`(A, λ ∘ i(a), i, [η ∘ β])` with the corresponding scalar multiplier. `H¹(ℚ, Z) = F₀^×/ℚ^× N_{F/F₀}(F^×)`
and `H¹(ℚ, Z(𝔸)) = 𝔸_{F₀}^×/𝔸^× N(𝔸_F^×)` (Kottwitz, §8) determine the choices; `λ ∘ i(a)` is a
polarization because `a` is central and totally positive, the Rosati involution is unchanged since
`a* = a`, and the change of multiplier is compensated by `β` on the level. The API is
`PELModuli.twist_hecke` (commutes with Hecke maps); `PELModuli.twist_mul`
(`twist(a, β) ∘ twist(a′, β′) = twist(aa′, ββ′)`); `PELModuli.twist_trivial` (the identity data give
the identity); and `PELModuli.twist_maps_piece` (the twist carries the neutral analytic piece to the
piece of the global class `z_i` of the twisted form, because `H₁` changes by the twist of the form by
`a`). Define `PELModuli.adelicTwist` on `M_K^ad` by the same formula with
`β` at **all finite places**, imposing `a N(β_v) ∈ ℚ_v^×` there; characteristic
zero requires no integrality condition on `a` at `p`. The same identity,
composition, Hecke and piece-transport API applies. For a class in `ker¹`, local
triviality gives these norm-similitude data at every finite place, and real
triviality permits a totally positive representative. This gives piece transport
at arbitrary `K` in this simple-algebra case of M4.3; the away-from-`p` version applies at hyperspecial `p`-level.
If `ker¹ = 1` the construction gives automorphisms of the single piece. *Needs:* M1.13, M3.2, M3.6.

**Checks.**

- `twist_identity`: for `a = 1`, `β = 1` the twist is the identity.
- `twist_polarization_positive`: the central scalar of twist data is positive at every complex
  embedding, which is what makes `λ ∘ i(a)` a polarization.
- `twist_needs_positivity`: `a = −1` is excluded: `λ ∘ i(−1) = −λ` is not a polarization.

### M4.3 PEL generic fibres are canonical models

Prove `canonicalModel`: assume the connected datum satisfies SV3, `K` neat, Case A or C. The
`F₀`-scheme `M_K^ad` (for `p`-integral data, `M_{K^p} ⊗ F₀` with `K = K^p K_p`, `K_p` hyperspecial)
decomposes as `⊔_{i ∈ ker¹(ℚ, G)} S^{(i)}` with each `S^{(i)}` open, closed and defined over `F₀`, and
`S^{(i)}` is the canonical model of `Sh_K(G^{(i)}, X)` over `E(G, X) = F₀` (ShimuraVarieties Layer 4; M0.17
for the reflex field); the identification of M3.6 is defined over `F₀`. When `ker¹(ℚ, G) = 1`, `M_K^ad`
is the canonical model of `Sh_K(G, X)` (Kottwitz, §8, p. 400; Lan, Remark 1.4.3.11, p. 164). This includes
semisimple `B`, with its common-multiplier group of M0.8. M3.6 gives open and closed algebraic pieces
with the right uniformizing family. Apply M4.1 to every inner datum `(G^{(i)}, X)` separately.
For descent of a piece, its clopen idempotent has a finite Galois field of definition; reciprocity
preserves the piece on the dense Hecke orbit of a special point. A special torus reflex field
linearly disjoint from that finite field forces descent to `F₀` (ShimuraVarieties §§4.8 and 4.10).
On each descended piece M4.1 gives the canonical-model condition; uniqueness identifies it with the
Hodge-type model (ShimuraVarieties §4.12 `CanonicalModel.unique_iso` and Layer 6 `hodge_canonical`).
M4.2 additionally transports the polarized levelled families in its simple type-A odd-rank scope;
the semisimple argument uses the individual reciprocity calculations. The union is compatible with
level maps and Hecke translations. *Needs:* M0.17, M3.6, M4.1;
ShimuraVarieties Layer 4, especially §§4.8, 4.10 and 4.12, and §§6.1–6.2.

**Checks.**

- `canonicalModel_siegel`: `A_{g,n} ⊗ ℚ` is the canonical model of `Sh_{K(n)}(GSp_{2g}, ℍ_g^±)`.
- `canonicalModel_picard`: for the Picard datum over `K`, `M ⊗ K` is a union of `|ker¹|` canonical models
  over `K`.
- `canonicalModel_field`: the pieces are defined over `F₀`, not only over `ℂ`: for the `U(1, 1)` datum
  (`F₀ = ℚ`) they are `ℚ`-schemes although the datum involves `K`.
- For `B = K × K` with `K` imaginary quadratic, signatures `(2,1)` and `(2,2)` give
  `G = GU(2,1) ×_{G_m} GU(2,2)`. The two ranks differ; the canonical-model argument applies
  M4.1 on every inner piece of this group, without a simple-algebra centre-lifting assertion.

### M4.4 Functoriality of canonical models

Prove `canonicalModel_functorial`: assume SV3 and neat levels. The identifications of M4.3 commute with
(a) level change `M_{K′}^ad → M_K^ad` and `Sh_{K′} → Sh_K` for `K′ ⊆ K`; (b) Hecke translations by
`g ∈ G(𝔸_f)`; (c) morphisms of PEL data (M1.14), in particular the Siegel morphism
`M_K^ad → A_{g,D,K^S}` and the Hodge-type morphism `(G, X) → (GSp(V), X(ψ))`, whose canonical models are
compared by ShimuraVarieties Layer 6 `hodge_inheritance`; (d) prime-to-`□` isogenies of data changing `L`
inside `L ⊗ ℚ` (Kottwitz, §6, p. 392; Milne, Proposition 14.14, p. 127, and Theorem 13.6 with Remark 13.8,
pp. 118–119). Level and Hecke maps are defined over `F₀`; for a morphism changing the datum,
base change both sides to the compositum of their reflex fields. These maps are defined over that base on the moduli side and by adelic formulas on the Shimura
side; they agree on `ℂ`-points by M3.4, and a morphism of reduced schemes agreeing on a dense set of
points with a morphism of `F₀`-schemes is that morphism. *Needs:* M1.13, M1.14, M4.3; ShimuraVarieties Layer 6.

**Checks.**

- `canonicalModel_siegel_morphism`: the Siegel morphism from a unitary PEL variety to `A_g` is defined
  over `F₀` and agrees with the morphism of canonical models.
- `canonicalModel_hecke_order`: the comparison respects the right-action order of M1.13: Hecke by `h`
  then `g` is Hecke by `hg` on both sides.

### M4.5 Normal integral models at higher p-level

Define `PELModuli.normalizedModel`: let `p` be good, `v | p` a prime of `F₀`, `K^p ⊆ G(𝔸_f^p)` neat,
`K_p⁰ = G(ℤ_p)` the stabilizer of `L ⊗ ℤ_p` and `K_p ⊆ K_p⁰` open compact. With
`𝔐 = M_{K^p} ⊗ O_{F₀,v}` the smooth good-level model (M2.8) and
`π : M^ad_{K_pK^p} ⊗ F₀,v → 𝔐_{F₀,v}` the finite étale level-change map of the generic fibre, let
`𝔐_{K_pK^p}` be the relative normalization of `𝔐` in `M^ad_{K_pK^p} ⊗ F₀,v` along
`𝔐_{F₀,v} ↪ 𝔐`, built étale locally on `𝔐` with Mathlib `Scheme.Hom.normalization` and glued by
compatibility of normalization with étale base change (no scheme structure on `𝔐` is needed). It has a
finite morphism to `𝔐` and an identification of its generic fibre; no smoothness, moduli
interpretation or universal `p`-level structure is asserted, and the universal abelian scheme pulled back
from `𝔐` has no level-`K_p` structure on the special fibre. The API is `normalizedModel_toGood`;
`normalizedModel_generic` (the canonical map from the generic cover, whose composite to the base is the
cover); `normalizedModel_universal` (for any integral factorization `Y → T → 𝔐` of the cover, the unique
map from the normalization to `T`; Mathlib `Scheme.Hom.normalizationDesc`);
`normalizedModel_normalSource` (for a normal flat `O_{F₀,v}`-scheme `T` with dense generic open `T_η`
and a compatible `T_η → Y`, the unique extension `T → 𝔐_{K_pK^p}`, the opposite direction);
`normalizedModel_level` (finite maps `𝔐_{K_p′K^p} → 𝔐_{K_pK^p}` for `K_p′ ⊆ K_p`, compatible in towers);
`normalizedModel_hecke` (generic-cover automorphisms over `𝔐_η` and prime-to-`p` Hecke
correspondences over the good models extend); and
`normalizedModel_good` (for `K_p = K_p⁰` it is `𝔐`, which is normal, being smooth).
Use Stacks, Tag 035I for the integral-factorization property, Tag 035J for functoriality of
relative normalization, Tag 03GV for smooth, hence étale, base change, and Tag 03GR only for
finiteness over the Nagata good model (M4.6). The morphism from the generic cover to `𝔐` is
quasi-compact and quasi-separated, as required by Mathlib `Scheme.Hom.normalizationDesc`;
the intermediate map `T → 𝔐` in its universal property is integral. On a normal flat source,
the images of integral functions from the cover are regular, which gives
`normalizedModel_normalSource`. For `normalizedModel_level`, apply Tag 035J to the generic
level-change map over the fixed good model. For `normalizedModel_hecke`, apply it to the maps
of good models and generic covers supplied by M1.13 and M1.10; étale base change identifies
the normalized intermediate spaces in the prime-to-`p` Hecke span. Uniqueness gives the
tower and composition laws.
*Needs:* M1.10, M1.13, M2.8, M3.6; SchemeAndStackFoundations §0.20 (Nagata schemes);
Mathlib `Scheme.Hom.normalization`, `Scheme.Hom.normalizationDesc`,
`Scheme.Hom.normalization.hom_ext`, `Scheme.Hom.normalizationPullback`, `Etale`.

**Checks.**

- For odd `p`, the normalization of `ℤ_p` in `ℚ_p(√p)` is
  `ℤ_p[√p]`: the Eisenstein uniformizer `t = √p` gives special fibre
  `𝔽_p[t]/(t²)`, which is nonreduced. The generic identification sends
  `t` to `√p`. For the nonnormal integral order `C = ℤ_p[p√p]`, the
  factorization map `Spec ℤ_p[√p] → Spec C` is induced by
  `p√p ↦ p t`, and its generic composite is the identity cover.
- For the unramified quadratic extension `L/ℚ_p`, the normalization is its
  integer ring `O_L`, finite étale with special fibre `𝔽_{p²}`. Its generic
  fibre is `Spec L` through the inclusion `O_L ⊆ L`; the integral
  factorization through `C = ℤ_p + p O_L` receives
  `Spec O_L → Spec C` from the inclusion `C ⊆ O_L`.
- In `ℚ_p × ℚ_p` the normalization is `ℤ_p × ℤ_p`, with generic map the
  two identity inclusions. The integral order
  `C = {(a,b) ∈ ℤ_p² : a ≡ b mod p}` receives
  `Spec(ℤ_p × ℤ_p) → Spec C` induced by inclusion; normalization separates
  the two branches that meet in the special fibre of `Spec C`.

### M4.6 Finiteness, normality and flatness of the normalized models

Prove `normalizedModel_finite_normal_flat`: in the setting of M4.5, `𝔐_{K_pK^p}` is finite over `𝔐`,
normal and flat over `O_{F₀,v}`; its special fibre is equidimensional of the dimension of the generic
fibre and need not be reduced or smooth. Finiteness: `𝔐` is of finite type over the excellent
`O_{F₀,v}`, hence Nagata (SchemeAndStackFoundations Layer 0, `IsExcellentScheme`), and the normalization of
a Nagata scheme in a reduced finite-type scheme is finite (Stacks, Tag 03GR; Tag 035S for the absolute
case), applied on an étale atlas. Normality: the generic cover is finite étale over the smooth
characteristic-zero good model, hence normal (Stacks, Tag 033C). On an affine chart write `A` for
the good-model ring and `B` for the normal generic-cover algebra, finite étale over `A[1/p]`.
Its relative integral closure `C` of `A` inside `B` equals the integral closure of `A` in the
product of function fields of `B`: any element of that product integral over `A` is integral over
`B`, hence lies in `B` by normality. Componentwise integral closure in those fields is normal;
the component idempotents are themselves integral over `A`. This gives normality on the atlas
and hence on the normalized model (Stacks, Tag 035L, whose finite-component hypothesis holds
because the generic cover is noetherian). Flatness: every irreducible component
dominates `Spec O_{F₀,v}` because the structure sheaf injects into the pushforward from the generic
fibre, so the local rings are torsion free over the discrete valuation ring, hence flat (Stacks, Tag
0539). *Needs:* M4.5; SchemeAndStackFoundations Layer 0; Mathlib `Flat`, `IsFinite`;
ModularCurvesPartII §11.5 for the genus-one special-fibre Check.

**Checks.**

- `normalizedModel_gamma0`: for `p ≥ 5`, the modular curve at level `Γ₀(p)` with a
  rigidifying neat prime-to-`p` level, the normalized model is flat over
  `ℤ_p`. After fixing a geometrically connected prime-to-`p` component and splitting
  its multiplier, its reduced special fibre has two irreducible components, the
  Frobenius and Verschiebung branches (ModularCurvesPartII §11.5). For full ordered-basis
  level `n ≥ 3`, `p ∤ n`, the total is `2φ(n)` geometric irreducible components.
  In particular `p = 7`, `n = 3` gives four, with the two primitive cube-root multipliers
  already split over `𝔽₇`.
- `normalizedModel_equidimensional`: for the Siegel datum of genus `g` and any `K_p`, every component of
  the special fibre has dimension `g(g+1)/2`, the dimension of the generic fibre; a definition that
  allowed vertical components of smaller dimension would fail flatness.
- `normalizedModel_requires_normal_cover`: for `A = ℚ[t²] ⊆ B = ℚ[t²,t³]`, the relative integral
  closure inside `B` is `B` because `t³` is integral over `A`. Although `B` is reduced with fraction
  field `ℚ(t)`, it is not normal: `t` is integral and missing. Closure inside `ℚ(t)` is `ℚ[t]`;
  this distinguishes the normal generic cover used above from an arbitrary reduced algebra.
- `normalizedModel_not_smooth`: for `p ≥ 5`, at level `Γ₀(p)` with neat prime-to-`p` level, the model is not smooth at the supersingular points.

### M4.7 The rank-one CM moduli schemes

Define `cmModuli1`: for a CM field `F`, a CM type `Φ`, `p` unramified in `F`, a rank-one skew-hermitian
`ℤ_(p)`-module `W₀` of type `Φ` and a neat open compact `K₀ ⊆ T₀(𝔸_f^p)`, the scheme over
`O_{F_Φ} ⊗ ℤ_(p)` — `F_Φ` the reflex field of the selected CM type, not the reflexive closure —
representing prime-to-`p` quasi-isogeny classes of `p`-principal localized unitary `O_F`-abelian
schemes of signature `Φ` with invariant `K₀`-level orbits; it is the rational PEL problem M1.8 with
`□ = {p}` for the rank-one datum of signature `Φ` with
`ψ_PEL = −⟨·,·⟩_W₀` (`cmModuli_eq_pel`, M0.23). In this comparison the
source-convention Betti and Tate forms induced by `λ₀` are also negated;
the same level map is then a similitude with the same multiplier, and the
underlying polarization stays positive in the PEL convention. The Betti lattices give
`cmModuli1_w : T_p^1(ℂ) → ker¹(ℚ, T₀)` (M0.24), and `cmModuli` is the minimal open and closed subscheme
of `T_p^1` containing `w⁻¹(neutral)`; it need not be all of `T_p^1` (Liu–Tian–Xiao–Zhang–Zhu, Remark
3.5.2 and Definitions 3.5.3–3.5.4, pp. 156–157). Prove `cmModuli1_represented`: `T_p^1` and `T_p` are
finite étale over `O_{F_Φ} ⊗ ℤ_(p)`; the source states this without proof and it follows from M2.8
(smooth of relative dimension `Σ p_τ q_τ = 0`, so étale) and M2.11 (`End_F(W₀) = F` is a field, so
proper), a proper étale algebraic space with quasi-finite fibres being a finite étale scheme. The API
is `cmModuliAct` (the finite torus quotient acts by precomposing the level orbit) and `torusGroupoid`
(the one-object groupoid of that finite abelian group, acting on `T_p` over the reflex base).
*Needs:* M0.23, M0.24, M0.25, M1.3, M1.8, M2.3, M2.8, M2.11.

**Checks.**

- `cmModuli_finite_etale`: for `F` imaginary quadratic, `T_p` is a finite étale `O_F ⊗ ℤ_(p)`-scheme
  whose complex points are CM elliptic curves with level.
- `cmModuli_torus_torsor`: the finite torus quotient acts freely and transitively on each geometric
  fibre of `T_p`.
- `cmModuli_reciprocity_test`: the Galois action on a generic CM point is the reflex norm composed with
  Artin reciprocity (M4.1).
- `cmModuli_open_closed`: `T_p` is the minimal clopen containing the neutral `w`-fibre; it is not
  replaced by all of `T_p^1` when `ker¹(T₀) ≠ 1`.

### M4.8 Galois structure of the CM moduli schemes

Prove `cmModuli_galois`: over `O_{F_Φ} ⊗ ℤ_(p)`, `Γ = T₀(𝔸_f^p)/(T₀(ℤ_(p))K₀)` is finite abelian and acts
freely and transitively on each geometric fibre of `T_p`, so `T_p` is a finite étale `Γ`-torsor; its
Galois action at the geometric generic fibre is the `Φ`-reflex norm composed with Artin reciprocity in the
normalization of ShimuraVarieties Layers 4–5, and it commutes with the `Γ`-action (Liu–Tian–Xiao–Zhang–Zhu,
Definition 3.5.4 and the following discussion, pp. 157–158). Finiteness of `Γ`: it injects into
`T₀(ℚ)\T₀(𝔸_f)/T₀(ℤ_p)K₀`, finite by finiteness of class groups of tori (TauCetiRoadmap.AdelicAlgebraicGroups
Layer 3); transitivity on `ℂ`-points is M3.4 for the torus datum after fixing the similarity class;
Galois equivariance is M4.1. *Needs:* M3.4, M4.1, M4.7; TauCetiRoadmap.AdelicAlgebraicGroups Layer 3.

**Checks.**

- `cmModuli_galois_imagQuad`: for `F` imaginary quadratic, `T_p` over `F` is the spectrum of a product of
  abelian extensions of `F` cut out by the reflex norm (class fields of `F` for the level `K₀`).
- `cmModuli_galois_free`: no element of `Γ` other than `1` fixes a geometric point.

### M4.9 Torus-invariant cohomology and its trace

Define `torusInvariantCohomology`: for the groupoid `𝔗` of the finite group `Γ` of M4.8, a functor
`X : 𝔗 → Sch` (a scheme `X(∗)` with `Γ`-action) and a coefficient ring `L` in the torsion or adic domains specified below, the submodules
`H^i_𝔗(X, L(j)) ⊆ H^i_ét(X(∗), L(j))` and `H^i_{𝔗,c}(X, L(j)) ⊆ H^i_{ét,c}(X(∗), L(j))` of `Γ`-invariants
(invariants, not coinvariants), functorial for `Γ`-equivariant maps for which the relevant pullback or
pushforward is defined (`torusInvariantCohomology_functorial`). The ordinary variant uses
the domain of the supplied étale cohomology; the compact-support variant requires
`X(∗) → Spec κ` separated of finite type and the supplier's coefficient domain.
Define `torusTrace`: if `κ` is
algebraically closed of characteristic `p`, `L` is `p`-coprime, `X(∗)` is smooth, separated and of finite type of pure
dimension `d` over `κ` and `Γ` acts freely on `π₀(X(∗))`,
`∫^𝔗_X : H^{2d}_{𝔗,c}(X(∗), L(d)) → L` is the inclusion into `H^{2d}_c(X(∗), L(d))`, followed by the
projection to `⊕_Y H^{2d}_c(Y, L(d))` over a set `{Y}` of representatives of the `Γ`-orbits of connected
components, followed by `Σ tr_Y` (Liu–Tian–Xiao–Zhang–Zhu, Notation 3.5.7 and Definition 3.5.8,
p. 158). The API is `torusTrace_indep` (independent of the representatives: on an invariant class the
traces on `Y` and `gY` agree because `tr` is compatible with `g : Y → gY`; no division by `|Γ|` occurs)
and `torusTrace_trivial` (for trivial `Γ` and connected `X(∗)` it is `tr`). Compactly supported
cohomology, smooth trace and duality are supplied by EtaleCohomologyFoundations
§F.2.5, §0.11 and §§F.5–F.6, with the adic realizations of §§F.4.1–F.4.6.
Here `L` is a finite commutative coefficient ring annihilated by an integer
prime to `p`, or the integer ring or field of a finite extension of `ℚ_ℓ`,
`ℓ ≠ p`, in the supplied constructible adic domain.
*Needs:* M4.8; EtaleCohomologyFoundations §F.2.5, §0.11, §§F.4.1–F.4.6 and F.5–F.6.

**Checks.**

- The affine line with doubled origin over `κ` is smooth of finite type and pure
  dimension one, but is nonseparated. Even with trivial `Γ`, it lies outside the
  compact-support and trace domains. The separated PEL spaces of M2.8 satisfy this restriction.
- `torusTrace_trivial_group`: for trivial `Γ` and connected `X(∗)`, `∫^𝔗 = tr`.
- `torusTrace_two_orbits`: two orbits of components give the sum of the traces of two representatives.
- `torusTrace_not_average`: for a free `C₂`-orbit of two points in odd characteristic and `L = 𝔽₂`, the
  invariant class `(1, 1)` has total trace `0` and orbit trace `1`; no division by `2` is available. If
  `|Γ|` is invertible in `L`, the orbit trace is `|Γ|⁻¹` times the total trace.
- `torusTrace_needs_free`: a nontrivial group acting trivially on the components of a connected `X(∗)`
  does not satisfy the freeness hypothesis, and the definition is not made for it.

### Examples

- Siegel: `A_{g,n} ⊗ ℚ` is the canonical model, and its normalized models at level `Γ₀(p)`-type
  parahorics are flat and normal.
- Imaginary quadratic CM: `T_p` is a finite étale torsor under a class group quotient over `O_F ⊗ ℤ_(p)`,
  with Galois action by Artin reciprocity.

### Dependencies

M0–M3; ShimuraVarieties Layer 4, §§5.10–5.11 and §§6.1–6.2; ShimuraVarieties §P.1; SchemeAndStackFoundations Layer 0;
EtaleCohomologyFoundations §F.2.5, §0.11, §§F.4.1–F.4.6 and F.5–F.6; TauCetiRoadmap.AdelicAlgebraicGroups Layer 3; Mathlib
`Scheme.Hom.normalization`; Stacks Tags 033C, 035I, 035J, 035L, 035S, 03GR, 03GV, 0539.

## Layer M5: Siegel, Hilbert and unitary examples

M5 instantiates M0–M4 for the Siegel data of every genus and polarization type, the principal Hilbert
datum and unitary data over CM fields with prescribed signatures. It is where the conventions of M0 are
tested on explicit lattices and where the comparison with the modular curves is made.

### M5.1 Siegel PEL data of every genus and type

Define `siegelIntegralDatum g D`: for `g ≥ 0` and positive integers `d₁ | d₂ | ⋯ | d_g`, the datum
`(ℤ, id, L_D, ⟨·,·⟩_D, h)` with `L_D = ℤ^{2g}` on the basis `e₁, …, e_g, f₁, …, f_g`,
`⟨e_i, f_j⟩_D = d_i δ_{ij}` (in `ℤ(1)` after the choice of `√−1`), `⟨e_i, e_j⟩ = ⟨f_i, f_j⟩ = 0`, and
`h(√−1) = J_D` with `J_D = Matrix.J (Fin g) ℝ`, `J_D e_i = f_i`, `J_D f_i = −e_i`, so that
`⟨x, J_D y⟩ = Σ_i d_i (x_{e_i}y_{e_i} + x_{f_i}y_{f_i})` is positive definite for arbitrary positive
weights. The integral Gram matrix is formed from blocks `0`, `diag(D)`, `−diag(D)`, `0`;
its principal form is `−Matrix.J`, and its determinant is `(∏ d_i)²`.
Replacing `J` by `−J` makes the associated real form negative definite in positive genus.
Genus zero is allowed integrally. `siegelRationalDatum` is its rationalization for `g > 0`. The API is
`siegelDatum_coordinate` (for `g > 0` the coordinate Hopf algebra of the rationalized datum is that of
`GSp_{2g}`, independent of `D`); `siegelDatum_reflex` (`ℚ`); `siegelDatum_badPrimes` (at level `n`
for `g > 0` the bad primes are those dividing `n d_g`; Lan, Definition 1.4.1.1, p. 148); `siegelDatum_dualIndex`
(`[L_D^# : L_D] = (d₁⋯d_g)²`, with `L_D^# = ⊕(d_i⁻¹ℤe_i ⊕ d_i⁻¹ℤf_i)`); `siegelDatum_signature`
(`(g, g)`, `dim V₀ = g`); `siegelDatum_type` (the elementary divisors of the Gram matrix are `D`, Tau Ceti
`Matrix.exists_smith_normal_form_of_det_ne_zero`); and `siegelDatum_shimura` (for `g > 0`, its Shimura datum is
the genus-`g` Siegel datum of ShimuraVarieties §P.4 for every `D`). Its group is `GSp(L_D)` (Case C, `I_bad = 1`, `Disc = 1`),
with `G₁ = Sp(L_D)`, which for `D = 1` is Tau Ceti `Symplectic.groupScheme` (Milne, §6, Proposition 6.3,
p. 70). *Needs:* M0.5, M0.7, M0.10, M0.12, M0.16; ShimuraVarieties §P.4; Tau Ceti
`Matrix.exists_smith_normal_form_of_det_ne_zero`, `Symplectic.groupScheme`; Mathlib `Matrix.J`.

**Checks.**

- `siegelDatum_index_12`: for `g = 2` and `D = (1, 2)`, `[L_D^# : L_D] = 4`, and at level `n = 3` the bad
  primes are `{2, 3}`.
- `siegelDatum_principal_good`: for the principal datum at level one every prime is good.
- `siegelDatum_shimura_indep`: the rational data of types `(1, 1)` and `(1, 2)` coincide (both `GSp₄`
  with Siegel half spaces); only the integral moduli problems differ.
- `siegelDatum_not_type_unordered`: `(2, 1)` violates `d₁ | d₂`; it is not a polarization type.

### M5.2 Siegel moduli `A_{g,D,n}`

Prove `siegelModuli`: for the Siegel datum of genus `g ≥ 1` and type `D` and `n ≥ 1`,
`A_{g,D,n} = M_{U(n)}` over `ℤ[1/(n d_g)]` is the moduli problem of abelian schemes of relative
dimension `g` with a polarization whose kernel is étale locally `(⊕_i ℤ/d_i)²` and a symplectic
level-`n` structure of type `L_D` with multiplier and the liftability condition
of M1.5 (required even when the reduced pairing is degenerate). It is a smooth separated algebraic stack of finite
type of relative dimension `g(g+1)/2` over `ℤ[1/(n d_g)]`, with its universal family on the stack.
For `n ≥ 3` it is a fine algebraic space, and its characteristic-zero fibre is a quasi-projective
scheme whose components are canonical models; its complex analytification is
`⊔_{(ℤ/n)^×} Γ_D(n)\ℍ_g`. For every `n ≥ 1`, the characteristic-zero coarse space is a
quasi-projective scheme with that ordinary analytic quotient and canonical-model components.
The stack retains stabilizers at `n = 1, 2`; no universal family on its coarse space is asserted
(Lan, Corollary 1.4.1.13, p. 153, and Remark 1.4.1.14, p. 154;
Kottwitz, §5, p. 391). The order structure is trivial and the determinant condition is `rank Lie = g`,
automatic. In genus zero define `A_{0,∅,n}` over `ℤ[1/n]`: the abelian scheme
is the trivial group scheme and the only remaining datum is
`(ℤ/n)(1) ≅ μ_n`, so it is the finite étale scheme of primitive `n`th roots
(with `n = 1` giving the base). Its construction uses the integral zero datum
and M2.8 directly, without rationalizing a zero representation. For `g ≥ 1`
construct the integral model by M2.8, M2.9 and M2.10 (`Sym²` of a rank-`g` space).
Compare its generic fibre and analytic family with ShimuraVarieties §5.0
`TauCeti.Shimura.rational_siegel_moduli` and `TauCeti.Shimura.siegel_moduli_uniformization`
using M1.10 and M3.9 at fine level, then apply M4.3 (`ker¹ = 1` in Case C).
For arbitrary `n`, take the characteristic-zero quotient of full level `3n` by `U(n)/U(3n)`;
SchemeAndStackFoundations §1.23 and ShimuraVarieties §§3.4a and 5.0 give its coarse-space
interpretation and descend the analytic and canonical-model comparisons.
*Needs:* M1.7, M1.10, M2.8, M2.9, M2.10, M3.6, M3.9, M4.3, M5.1; ShimuraVarieties §5.0
`TauCeti.Shimura.rational_siegel_moduli`, `TauCeti.Shimura.siegel_moduli_uniformization`, §3.4a;
SchemeAndStackFoundations §1.23.

**Checks.**

- `siegelModuli_g1`: for `g = 1`, `D = (1)`, `n ≥ 3`, `A_{1,1,n}` is `Y(n)` over `ℤ[1/n]` (M5.3).
- `siegelModuli_dim2`: `A_{2,D,n}` has relative dimension `3`.
- `siegelModuli_nonneat`: for `g > 0` and `n ≤ 2` it is a stack, not an algebraic space (`[−1]` survives).
- Over `ℂ`, for `g = 1`, `D = (1)` and `n = 1` or `2`, `[-1]` is a nonidentity automorphism
  preserving the polarization and level (it is the identity on `E[2]`). Thus the coarse
  arithmetic quotient forgets a stabilizer even in characteristic zero; the stack is not a scheme.

### M5.3 Genus one: comparison with the modular curves

Prove `genusOneComparison`: for `g = 1`, `D = (1)` and `n ≥ 3` there is an isomorphism over `ℤ[1/n]`
between `A_{1,1,n} = M_{U(n)}` and ModularCurves' full level scheme `Y_full(n)` (§5B), sending
`(A, λ, α_n, ν_n)` to the elliptic curve `A` with its basis `(P, Q) = (α_n(e₁), α_n(f₁))`.
Write `e_n^pol` for M1.4's polarized pairing and `e_n^MC` for ModularCurves' equation pairing.
With `⟨e₁, f₁⟩` the chosen generator of `ℤ(1)`, the normalization is
`e_n^pol(P, Q) = ν_n(1)` and `e_n^MC(P, Q) = ν_n(1)⁻¹`.
Indeed the positive elliptic self-duality `ι_E(y) = O([−y] − [0])` is
`λ_E^MC ∘ [−1]`, where `λ_E^MC(y) = O([y] − [0])`; AbelianSchemesAndArithmeticModuli
A3.5–A3.7's inversion adapter gives `e_n^MC = (e_n^pol)⁻¹`.
Over `ℤ[1/n, ζ_n]` the fibre `ν_n(1) = ζ` is therefore `Y(n, ζ⁻¹)` (§5B).
One-dimensional abelian schemes are elliptic curves
(AbelianSchemesAndArithmeticModuli A1), each with a unique principal polarization, so `λ` is determined;
liftability is automatic for the self-dual `L`; the level structures match ModularCurves' `[Γ(n)]`
(§3C) with the Cartier–Nishi/equation comparison (§2E) and this inversion adapter; universal
objects correspond by their universal properties, and the `GL₂(ℤ/n)`-actions agree after the transpose
convention between row and column vectors (ShimuraVarieties §§8.11–8.13 pin it). A basis change
`u ∈ GL₂(ℤ/n)` raises both pairings to `det u`, so the component dictionary `ζ ↦ ζ⁻¹`
commutes with this action (Lan, Definition 1.3.6.1,
p. 133; Milne, Theorem 6.11, p. 74, and the remark on full level `N`, p. 75). *Needs:* M1.5, M5.2;
AbelianSchemesAndArithmeticModuli A1, A3.5–A3.7; TauCetiRoadmap.ModularCurves §2E, §3C, §5B;
ModularCurvesPartII §1.5 (Conrad, *Modular curves*, Example 7.15 and Proposition 7.16, p. 17).

**Checks.**

- `genusOne_complex`: over `ℂ`, `τ ∈ ℍ` maps to `(ℂ/(ℤ + ℤτ), 1/n, τ/n)` with
  `e_n^pol = ζ_n` and `e_n^MC = ζ_n⁻¹`. For `n = 3`, `τ = i`, `P = 1/3`, `Q = i/3`,
  `e_3^MC(P, Q) = ζ₃⁻¹ ≠ ζ₃`, so this PEL fibre maps to `Y(3, ζ₃⁻¹)`.
- `genusOne_sign`: replacing `(P, Q)` by `(Q, P)` inverts both pairings and replaces
  `ν_n` by `ν_n⁻¹`; the original fibre `ν_n(1) = ζ` maps to `Y(n, ζ⁻¹)` and the swapped
  fibre maps to `Y(n, ζ)`.
- `genusOne_universal`: the universal object of M2.9 is the universal elliptic curve over `Y(n)`.

### M5.4 The principal Hilbert datum

Define `hilbertIntegralDatum F`: for a totally real field `F` of degree `d` with different `𝔡`, the
integral datum `(O_F, id, L, ψ, h)` with `L = O_F ⊕ 𝔡⁻¹ ⊆ F²`,
`ψ((x₁, x₂), (y₁, y₂)) = Tr_{F/ℚ}(x₁y₂ − x₂y₁)` (`hilbertPairing`) and `h(√−1)` acting on
`L ⊗ ℝ = ⊕_{τ : F → ℝ} ℝ²` by `(a, b) ↦ (−b, a)` in each factor. The pairing is alternating, satisfies
`ψ(bx, y) = ψ(x, by)` for `b ∈ O_F` (`* = id`), is `ℤ`-valued on `L` because `O_F · 𝔡⁻¹ ⊆ 𝔡⁻¹`, and
`L` is self-dual: the trace dual of `O_F` is `𝔡⁻¹` and that of `𝔡⁻¹` is `O_F` (Mathlib
`FractionalIdeal.dual`). In each real factor `ψ((a, b), (−b, a)) = a² + b² > 0`, so Condition 1.2.1.2
holds. Define its rationalization `hilbertRationalDatum` by M0.6 and its rational closed
trace embedding `hilbertTraceEmbedding : G → GSp(F², ψ)` by the action on `F²`
viewed as a `2d`-dimensional `ℚ`-space. The embedding carries the real `h`-orbit
to the Siegel orbit and hence is a morphism of pure data by M0.12. Its API is
`hilbertTraceEmbedding_injective`, `hilbertTraceEmbedding_multiplier` (the multiplier
is the common rational determinant), and `hilbertTraceEmbedding_h` (compatibility
with the displayed complex structure). Prove `hilbertExample`: the datum is of Case C (`G` the subgroup of
`Res_{F/ℚ} GL₂` with determinant in `ℚ^×`), `I_bad = 1`, `Disc(O_F) = disc(F)`, the good primes at level
`n` are those not dividing `n · disc(F)`, the signatures are `(1, 1)` at each real embedding, the reflex
field is `ℚ` (`Tr(a | V₀) = Tr_{F/ℚ}(a)`; Lan, Corollary 1.2.5.6, p. 91), `ker¹(ℚ, G) = 1` (M3.2; the
characteristic-zero moduli is one Shimura variety, Kottwitz, §7, p. 393), the relative dimension is `d`
(M2.10), and at good primes the determinant condition is the Rapoport condition that `Lie_{A/S}` be
locally free of rank one over `O_F ⊗ O_S` (M0.19). Hilbert–Blumenthal moduli with a general
polarization module, and their models at primes dividing `disc(F)`, are not targets here (see *Scope*).
*Needs:* M0.2, M0.3, M0.10, M0.16, M0.19, M2.10, M3.2; ShimuraVarieties §P.4; Mathlib `FractionalIdeal.dual`,
`Algebra.trace`. The theorem `hilbertPairing_selfDual` identifies `O_F ⊕ 𝔡⁻¹`
with its dual using the integral-value criterion for `hilbertPairing`, for any number field `F`;
total reality is used for the positive complex structure. The pairing API includes `hilbertPairing_self`
(`ψ(x,x) = 0`) and `hilbertPairing_smul` (`ψ(bx,y) = ψ(x,by)`).

Define the convention adapter `hilbertConventionMap : F² ≃ₗ[F] F²` by
`f(a,b) = (a,−b)`. It preserves `O_F ⊕ 𝔡⁻¹`, and its real extension satisfies
`f J f⁻¹ = −J` and `(-ψ)(fx,fy) = ψ(x,y)` for `J(a,b) = (−b,a)`.
Thus it transports the datum with positive pair `(J,ψ)` to the convention `(-J,-ψ)`
and conjugates the trace embedding with the same rational multiplier. The API is
`hilbertConventionMap_pairing`, `hilbertConventionMap_complexStructure` and
`hilbertConventionMap_mem_prod` (it preserves any product of two `ℤ`-submodules of `F`,
in particular the principal inverse-different lattice). These are direct substitutions in
the displayed trace and complex-structure formulas; positivity is Lan's Condition 1.2.1.2.

**Checks.**

- For `F = ℚ`, `hilbertPairing (1,0) (0,1) = 1`, while reversing the
  arguments gives `−1`; this fixes the alternating sign.
- `hilbert_rat`: for `F = ℚ` the datum is the principal genus-one Siegel datum.
- `hilbert_realQuadratic`: for `F = ℚ(√5)`, `𝔡 = (√5)`, the lattice `O_F ⊕ (1/√5)O_F` is self-dual, the
  good primes at level `n` are those not dividing `5n`, and the moduli space has relative dimension `2`
  with reflex field `ℚ`.
- `hilbert_not_selfdual_without_different`: `O_F ⊕ O_F` with the same pairing has dual `𝔡⁻¹ ⊕ 𝔡⁻¹` and
  index `disc(F)²`, so it is not self-dual when `disc(F) ≠ 1`.
- For `F = ℚ`, `f(e₁) = e₁`, `f(e₂) = −e₂` and
  `(-ψ)(f(e₁),(-J)f(e₁)) = 1`; transporting only `J` would give `−1`.
- For `F = ℚ(√5)`, negation preserves `(1/√5)O_F`, so `f` stabilizes the self-dual
  lattice without changing the different or the good primes.
- Conjugation by `f` is involutive and preserves the common determinant. Passing from
  columns to rows transposes the transported action; the alternating determinant formula agrees.

### M5.5 Unitary PEL data with prescribed signatures

Define `unitaryRationalDatum`: for a CM field `K` with maximal totally real `K⁺`, a CM type `Φ`, a
hermitian space `(V, H)` over `K` of dimension `n ≥ 1` with signature `(r_τ, s_τ)` at `τ ∈ Φ`
(`r_τ + s_τ = n`), and `δ ∈ K^×` with `δ̄ = −δ` and `Im τ(δ) > 0` for `τ ∈ Φ`, the datum
`(K, c, V, φ, h)` with scalar form `ψ(x, y) = Tr_{K/ℚ}(δ H(x, y)) : ℚ` (`unitaryTraceForm`),
Tate-valued form `φ = 2π√−1·ψ : V × V → ℚ(1)`, and `h(√−1)` acting on
`V ⊗_{K,τ} ℂ ≅ ℂ^n` by `diag(√−1 · 1_{r_τ}, −√−1 · 1_{s_τ})` in an `H`-orthogonal basis, with the sign
fixed by positivity of `ψ(x, h(√−1)y)`; an integral version uses an `O_K`-lattice `L` with
`ψ(L, L) ⊆ ℤ`, equivalently `φ(L, L) ⊆ ℤ(1)`. Alternation: `δH(x, x)` is totally imaginary,
so its trace vanishes; adjointness:
`ψ(ax, y) = ψ(x, āy)` (M0.22); positivity: on `V ⊗_{K,τ} ℂ` the scalar real form is `2 Im τ(δ)` times `±Re H` with
signs matching the signature (Kottwitz, proof of Lemma 4.3, pp. 388–389).
The function `unitaryTraceForm` accepts `H` on an arbitrary vector space. Its theorem
`unitaryTraceForm_properties` carries first-variable additivity and linearity, hermitian symmetry,
nondegeneracy and a nonzero anti-invariant `δ`, and supplies the alternating nondegenerate
rational bilinear form with the order action star-adjoint. The API is
`unitaryDatum_group` (`GU(V)`, Case A); `unitaryDatum_signature` (`(r_τ, s_τ)` at `τ ∈ Φ`, `(s_τ, r_τ)` at
`τ̄`); `unitaryDatum_reflex_general` (the reflex field is `F_Ψ` for `Ψ = Σ_{τ ∈ Φ}(r_τ τ + s_τ τ̄)`,
M0.25); `unitaryDatum_reflex` (for imaginary quadratic `K` with embedding `τ`, signature `(r, s)` has
reflex field `ℚ` if `r = s` and `τ(K)` otherwise); `unitaryDatum_relDim` (`Σ_{τ ∈ Φ} r_τ s_τ`, M2.10);
`unitaryDatum_badPrimes` (at full level `m`, bad primes divide `m · Disc(O_K) · [L^# : L]`; `2` may be good);
`unitaryDatum_ker1` (`ker¹(ℚ, GU(V)) = 1` for `n` even and `≅ ker¹(ℚ, Z)` for `n` odd, M3.2); and
`unitaryDatum_shimura` (under connectedness and SV3, the pure datum of M0.12 with group `GU(V)`; a definite
rank-one datum has trivial adjoint group, while a wholly definite datum of rank at least two fails SV3)
(Bijakowski–Pilloni–Stroh, §1.1, p. 980; Liu–Tian–Xiao–Zhang–Zhu, Definition 3.3.1, p. 147). *Needs:*
M0.5, M0.10, M0.13, M0.22, M0.23, M0.25, M2.10, M3.2; Mathlib `NumberField.IsCMField`.

**Checks.**

- `unitaryDatum_picard_reflex`: `K = ℚ(√−3)`, `n = 3`, signature `(2, 1)`: reflex field `K`, relative
  dimension `2`.
- `unitaryDatum_U11`: signature `(1, 1)` over imaginary quadratic `K`: reflex field `ℚ`, relative
  dimension `1`.
- `unitaryDatum_definite`: the rank-one definite imaginary-quadratic datum has trivial adjoint group, so
  SV3 holds vacuously, while signature `(2, 0)` fails SV3.
- `unitaryDatum_wrong_delta`: `δ = 1` is not anti-invariant; `Tr(H(x, x))` is not alternating.
  `unitaryTraceForm_one_not_alternating` states this boundary for the standard rank-one form.
- For `K = ℚ(i)`, `H(x,y) = xȳ`, `δ = i/2` and `Jx = ix`, the scalar form has
  `ψ(1,i) = 1` and `ψ(x,Jx) = a²+b²` for `x = a+bi`; the Tate-valued form has
  `φ(1,i) = 2πi` and gives the same positivity after division by `i`.

### M5.6 Unitary examples

Prove `unitaryExamples`. (a) Picard: `K = ℚ(√−d)` imaginary quadratic of discriminant `d_K`, `V = K³`
with `H = diag(1, 1, −1)`, `L = O_K³` and `δ = 1/s`, where `s² = d_K` and the chosen embedding `τ ∈ Φ` has
`Im τ(s) < 0`, hence `Im τ(δ) > 0` (a generator of the inverse different, so `L` is self-dual): signature `(2, 1)`, reflex field `K`, relative dimension `2`, good primes `p ∤ m d_K` at full level `m`, and
`ker¹(ℚ, G) = 1`: the imaginary-quadratic odd-rank quotient torus is
`Res_{K/ℚ} G_m` (M3.2; Kottwitz, §7, pp. 393–394). (b) `U(1, 1)`:
`H = diag(1, −1)`: reflex field `ℚ`, relative dimension `1`, `ker¹ = 1`. (c) `U(2, 2)`: signature
`(2, 2)`: reflex field `ℚ`, relative dimension `4`, `ker¹ = 1`. (d) For a general signature over a CM
field and `p` satisfying Bijakowski–Pilloni–Stroh's Hypothèse 1.1.1, the signatures are constant above
each prime of `K⁺` (M0.21; Lemme 1.1.4, p. 981). Each case instantiates M5.5 and checks the sign of
`Im τ(δ)` for positivity. *Needs:* M0.21, M2.10, M3.2, M5.5.

**Checks.**

- `picard_selfdual`: for `K = ℚ(√−3)`, `δ = 1/s` with `s² = −3` and `Im τ(s) < 0`, the lattice `O_K³` with `Tr(δH)` has dual index `1`.
- `unitary_dimensions`: the relative dimensions of (a), (b), (c) are `2`, `1`, `4`.
- `unitary_reflex`: the reflex fields of (a), (b), (c) are `K`, `ℚ`, `ℚ`.

- `unitary_sign_witness`: for `K = ℚ(i)`, `δ = i` and `H(x,y) = xȳ`,
  `ψ(1,i) = Tr(i·(−i)) = 2 > 0`. With `δ = −i` this value is `−2`.

### M5.7 A nonprincipal polarization type

Prove `nonprincipalExample`. For the Siegel type `(1, p)`, the surface datum has dual index `p²`,
polarization degree `p²`, and `p` is excluded from the good smooth base; with level it is a genuine
nonprincipal object. For a CM elliptic curve `E` with `ℤ[i]`-action defined over a number field `k`, the
product `E × E′` of `E` with the copy `E′` on which `ℤ[i]` acts through the conjugate action, polarized
by `λ_E × pλ_{E′}`, is a unitary surface with Lie signature `(1, 1)` and polarization degree `p²`; its
lattice can be written `O_F ⊕ pO_F` with the second trace pairing scaled by `1/p`, which transports
under `x ↦ px` to `p` times the standard pairing, whereas the unscaled restricted pairing would give
degree `p⁴` (Lan, Remark 1.3.6.2, p. 134: away from `□` the type of `λ` is that of `L`). The level
structures exist after a finite extension (M3–M4 place the object in the nonprincipal moduli). *Needs:*
M5.1, M5.2, M5.5; Tau Ceti `Matrix.exists_smith_normal_form_of_det_ne_zero`.

**Checks.**

- `nonprincipal_degree`: `λ_E × pλ_{E′}` has kernel `E′[p]`, geometrically isomorphic to `(ℤ/p)²`, of order `p²`.
- `nonprincipal_type`: the elementary divisors of the transported Gram matrix are `(1, p)`.
- `nonprincipal_unscaled`: the unscaled restricted pairing on `O_F ⊕ pO_F` has elementary divisors
  `(1, p²)` and degree `p⁴`, so it is a different object.

### Examples

- Siegel genus one: `A_{1,1,n} ≅ Y(n)` over `ℤ[1/n]` with the Weil-pairing multiplier.
- Hilbert over `ℚ(√5)`: a Hilbert modular surface of relative dimension `2`, reflex field `ℚ`, good away
  from `5n`.
- Picard over `ℚ(√−3)`: a ball quotient surface of relative dimension `2` with reflex field `K`.

### Dependencies

M0–M4; ShimuraVarieties §P.4; AbelianSchemesAndArithmeticModuli A1; TauCetiRoadmap.ModularCurves §2E, §3C, §5B;
Tau Ceti `Matrix.exists_smith_normal_form_of_det_ne_zero`, `Symplectic.groupScheme`; Mathlib `Matrix.J`,
`FractionalIdeal.dual`, `NumberField.IsCMField`.

## Layer M6: Arithmetic moduli, coarse spaces and Hodge lines

M6 is the interface consumed by heights, isogeny and finiteness theorems. It uses M1–M2 and not M3–M5.
Its stacks are ordinary algebraic stacks with finite inertia; coarse spaces are algebraic spaces;
rational points of coarse spaces are related to objects through the gerbe of M6.7, and consumers receive
objects, not only points. Torsion marking (`n ≥ 3` invertible) and symplectic marking of a fixed type
(`n` also prime to the polarization degree) have different prime restrictions.

### M6.1 Level-forgetting and Hecke maps are finite étale

Prove `levelForgetting_finiteEtale`: for open compact `H′ ⊆ H ⊆ G(Ẑ^□)`, the forgetful morphism
`M_{H′} → M_H` (M1.13) is representable, finite and étale; if `H` is neat and `H′` is normal in `H`, it is
a Galois cover of algebraic spaces with group `H/H′` acting freely by Hecke translation; for
`g ∈ G(𝔸^{∞,□})` both maps of the Hecke correspondence `M_H ← M_{H ∩ gHg⁻¹} → M_H` are finite étale
(Kottwitz, §6, p. 392; Lan, Remark 1.4.3.10, p. 164). Étale locally an integral level-`H` structure
lifts to an `H′`-structure. Étale locally the refinements are the finite coset
set `H/H′`, or `H_n/H′_n` for `n ≥ 1` prime to `□` with `U^□(n) ⊆ H′`.
When `H′` is normal this is a quotient group and the refinement scheme is an
`H/H′`-torsor
(Lan, Definition 1.3.7.8); the fibre over an object is the finite étale scheme of `H′`-refinements; at
neat level the action is free because objects have no automorphisms (M2.3). *Needs:* M1.6, M1.13, M2.3,
M2.8; Mathlib `Etale`, `IsFinite`.

**Checks.**

- `levelForgetting_g1`: for `g = 1` and `n ≥ 3`, `Y(nm) → Y(n)` after base change to `ℤ[1/(nm)]` is finite étale Galois with group the
  kernel of `GL₂(ℤ/nm) → GL₂(ℤ/n)`, both problems keeping the multiplier.
- `levelForgetting_degree`: for `g = 1` over `ℤ[1/3]`, the representable map
  `M_{U(3)} → M_{GL₂(Ẑ^□)}` has degree `|GL₂(𝔽₃)| = 48`, while the induced map of coarse spaces
  `Y(3) → 𝔸¹_j` has degree `24`, because `[−1]` acts trivially on coarse points.
- For `H = GL₂(Ẑ)` and `H′` the inverse image of the upper triangular
  Borel modulo `3`, the refinement fibre is `ℙ¹(𝔽₃)`, of cardinality `4`.
  The Borel is nonnormal, so this fibre is a coset set, with no quotient-group
  torsor assertion.
- `levelForgetting_nonneat`: at nonneat level the map is a map of stacks whose representable fibre is
  the finite set of level refinements.

### M6.2 The moduli stack at arbitrary level

Prove `arbitraryLevelStack`: for any open compact `H` and a neat open normal `H′ ⊆ H`, the action of the
finite group `H/H′` on the algebraic space `M_{H′}` by Hecke translation gives an isomorphism of stacks
`[M_{H′}/(H/H′)] ≅ M_H`; hence `M_H` is a separated Deligne–Mumford stack, smooth of finite type over
`S₀`, with finite inertia, and the presentation is independent of `H′` up to canonical equivalence; the
universal object of `M_{H′}` descends to the universal object of the stack (Lan, Theorem 1.4.1.12,
p. 153; Kottwitz, §6, p. 392). The quotient stack of an algebraic space by a finite group is
Deligne–Mumford (SchemeAndStackFoundations §§1.19–1.21);
`M_{H′} → M_H` is an `H/H′`-torsor of fibred categories (M6.1), which identifies the quotient; automorphism
groups are subgroups of stabilizers in `H/H′`; separatedness is M2.4; for `H″ ⊆ H′` both neat and normal
the presentations are compatible. *Needs:* M1.7, M2.4, M2.8, M6.1;
SchemeAndStackFoundations §§1.19–1.21.

**Checks.**

- `arbitraryLevel_g1`: for `g = 1` and `H = GL₂(Ẑ^□)`, `M_H = [Y(n)/GL₂(ℤ/n)]` over `ℤ[1/n]` for
  `n ≥ 3`, the moduli stack of elliptic curves.
- `arbitraryLevel_inertia`: the inertia of `[Y(3)/GL₂(ℤ/3)]` at `j = 1728` is cyclic of order `4` in
  characteristic `≠ 2, 3`.
- `arbitraryLevel_indep`: the presentations by `U(3)` and `U(6)` give equivalent stacks over
  `ℤ[1/6]`.

### M6.3 The stack `𝔄_g` over `ℤ`

Prove `siegelStack`: the fibred category `𝔄_g` over `Sch/ℤ` of principally polarized abelian schemes of
relative dimension `g` is a smooth separated Deligne–Mumford stack of finite type over `Spec ℤ` of
relative dimension `g(g+1)/2`, with universal abelian scheme; over `ℤ[1/n]`, `n ≥ 3`,
`𝔄_g ⊗ ℤ[1/n] ≅ [A_{g,1,n}/GSp_{2g}(ℤ/n)]`, and `𝔄_g` is glued from the presentations over `ℤ[1/3]` and
`ℤ[1/4]`, which cover `Spec ℤ` including characteristics `2` and `3` (Lan, Corollary 1.4.1.13, p. 153).
The principal integral datum and its family problem come from M0.5 and M1.7 directly (M5 is not used);
M2.8 gives fine smooth algebraic spaces at levels `3` and `4`; their finite group quotients represent
the level-free groupoid; effective descent (M1.12) and independence of the neat cover glue them; the
universal family, the finite `Isom` diagonal and the Kodaira–Spencer dimension descend. *Needs:* M0.5,
M1.5, M1.7, M1.12, M2.8, M2.10, M6.2; SchemeAndStackFoundations §1.21.

**Checks.**

- `siegelStack_g1`: `𝔄_1` is the moduli stack of elliptic curves over `ℤ`.
- `siegelStack_cover`: `Spec ℤ[1/3] ∪ Spec ℤ[1/4] = Spec ℤ`, while `ℤ[1/3]` and `ℤ[1/6]` alone would miss
  the prime `3`.
- `siegelStack_dimension`: `𝔄_2` has relative dimension `3` over `ℤ`.

### M6.4 The stack of polarized abelian schemes of degree d² is of finite type

Prove `polarizedStackFiniteType`: for `g, d > 0`, the stack `𝔄_{g,d}` of abelian schemes of dimension `g`
with an actual polarization of degree `d²` is separated Deligne–Mumford and of finite type over `ℤ`,
including every characteristic dividing `d`; over a base where some `n ≥ 3` is invertible, marking the
finite étale group `A[n]` kills polarized automorphisms and gives a finite-type algebraic space; a full
symplectic marking of a fixed type `D` with `∏ d_i = d` needs `n` prime to `d` and is not the
all-characteristic presentation. Smoothness at primes dividing `d` is not asserted. Fppf locally the
polarization is `φ_L` for an ample `L` (AbelianSchemesAndArithmeticModuli A2.6); `L³` is very ample in
every characteristic (A2.8) with `h⁰(L³) = 3^g d` (A2.4), so embedded abelian schemes with their line
bundle, group law and identity are parameterized by a locally closed piece of a Hilbert scheme with
fixed Hilbert polynomial (AlgebraicModuliForArithmeticGeometry Layer 2; SchemeAndStackFoundations Layer 4,
`hilbert_quot_schemes`) modulo the projective linear group (SchemeAndStackFoundations §1.21), with the scalar automorphisms
of `L` rigidified (Layer 7, `rigidification_gm_torsor`); the line bundles inducing a fixed polarization
form a torsor under the relative `Pic⁰` (A2.6), and descending along it gives the polarization stack,
not the line-bundle stack; polarized `Isom` is finite unramified (M2.4's argument); marking `A[n]` for
`n = 3, 4` on a cover of the base proves finite type, including `p | d`. Faltings–Chai, *Degeneration of
Abelian Varieties*, Chapter I, Definition 1.6, p. 4, and the preceding discussion, pp. 3–5, give the `Pic⁰`
torsor, and §4.11, pp. 23–24, the principal case of this presentation (Kottwitz, §5, p. 391;
Lipnowski–Tsimerman, *How large is `A_g(F_q)`?*, §4.1 and Remark 4.2, p. 17, for polarizations over
finite fields coming from line bundles). The descent uses AlgebraicModuliForArithmeticGeometry Layer 3.
*Needs:* M1.12, M2.4; AbelianSchemesAndArithmeticModuli A2.4, A2.6, A2.8; AlgebraicModuliForArithmeticGeometry
Layers 2, 3, 4, 7; SchemeAndStackFoundations Layers 1 and 4.

**Checks.**

- `polarizedStack_d1`: `𝔄_{g,1} = 𝔄_g` (M6.3).
- `polarizedStack_cubic`: for an elliptic curve and `L = O(0)` (`d = 1`), `L³` embeds it as a plane cubic
  with `h⁰ = 3`.
- `polarizedStack_not_smooth`: for `p | d`, `𝔄_{g,d} ⊗ 𝔽_p` is of finite type but not smooth in general;
  the theorem asserts only finite type.

### M6.5 Coarse moduli spaces

Prove `coarseModuli`: for every open compact `H`, the stack `M_H` (finite inertia, M2.4 and M2.8) has a coarse
moduli space `π : M_H → M_H^c`, a separated algebraic space of finite type over `S₀`, universal for maps
to algebraic spaces and bijective on geometric points; `π` is an isomorphism for neat `H`;
when a neat normal open `H′ ⊆ H` exists,
`M_H^c ≅ M_{H′}/(H/H′)`. Its formation commutes with flat base change
`S₀′ → S₀`, and with arbitrary base change when such a presentation exists
and `|H/H′|` is invertible on `S₀` (SchemeAndStackFoundations
Layer 1, `keel_mori`, `IsCoarseModuliSpace`; AlgebraicModuliForArithmeticGeometry Layer 5,
`levelRemovalQuotient`, `coarse_finite`; Lan, Definition A.6.4.1, p. 980). The same holds for `𝔄_g` and
`𝔄_{g,d}` over `ℤ`: the coarse space `A_g` of `𝔄_g` has `A_g(K̄)` the set of isomorphism classes of
principally polarized abelian varieties over `K̄`, and a principally polarized `A` over a field `K` has a
moduli point `x_A ∈ A_g(K)` (Tsimerman, §1, footnote 1, p. 380). Invariants of a finite group commute
with flat base change. In general apply `keel_mori` directly to the finite
inertia stack of M2.8 and M2.4; existence of a neat prime-to-`□` cover is
not needed. For the all-prime Siegel problem use the compatible presentations
after localizing at `3` and `4` from M6.3. *Needs:* M6.2, M6.3, M6.4; SchemeAndStackFoundations Layer 1;
AlgebraicModuliForArithmeticGeometry Layer 5; TauCetiRoadmap.ModularCurves §9E.

**Checks.**

- `coarseModuli_g1`: the coarse space of `𝔄_1` is the `j`-line `𝔸¹_ℤ` (ModularCurves §9E).
- For `□` all primes, the principal level-one Siegel problem still has
  coarse space `A_g`, although `G(Ẑ^□) = 1` has no Pink-neat subgroup:
  the empty intersection in M2.2 contains every root of unity. The local
  level-`3` and level-`4` presentations of M6.3 cover this case.
- `coarseModuli_neat`: for neat `H`, `M_H^c = M_H`.
- `coarseModuli_points`: two elliptic curves over `ℚ` with the same `j ≠ 0, 1728` (quadratic twists) give
  the same point of `A_1(ℚ)`.

### M6.6 Field of moduli

Define `fieldOfModuli` for `𝔄_{g,d}` over any characteristic-zero field `k`,
and `PELModuli.fieldOfModuliPEL` for a characteristic-zero `S₀`-field `k`
with a fixed structural embedding `F₀ ↪ k`. For an algebraic closure `K/k`
and an object `ξ` of the respective stack over `K` — polarization, action and
level included — take the fixed field in `K` of the isomorphism stabilizer
`PELModuli.isomorphismStabilizer ξ = {σ ∈ Gal(K/k) : σ^*ξ ≅ ξ}`, an open subgroup because `ξ` is
defined over a finite extension (Tsimerman, §1, footnote 1, p. 380). The API is
`fieldOfModuli_eq_residue` and `fieldOfModuliPEL_residue` (it is the residue field of the image point of
the coarse space of the same stack, since `M_H → M_H^c` is bijective on geometric points);
`fieldOfModuli_le_of_model` and `fieldOfModuliPEL_le` (a model over `k₁ ⊆ K` containing `k`, with all its
structure, forces `k(ξ) ⊆ k₁`); `fieldOfModuli_galois` (`k(σ^*ξ) = σ(k(ξ))`); and `fieldOfModuli_fine`
and `fieldOfModuliPEL_fine` (if `ξ` has no automorphisms, for instance at neat level, its isomorphisms
satisfy the unique descent cocycle and `ξ` has a model over `k(ξ)`, M6.7). With inertia the gerbe of
M6.7 may obstruct a model. *Needs:* M6.5, M6.7.

**Checks.**

- `fieldOfModuli_elliptic`: for an elliptic curve with its canonical polarization and no extra
  structure, the field of moduli over `ℚ` is `ℚ(j)`; adding level can enlarge it.
- `fieldOfModuli_le`: a model over `k₁` gives `k(ξ) ⊆ k₁`.
- `fieldOfModuli_twist`: geometrically isomorphic objects (for example quadratic twists) have the same
  field of moduli though they need not be isomorphic over the base.
- For a Picard datum with reflex field `ℚ(i)`, complex conjugation over
  `ℚ` changes the structural embedding and conjugates the signature; it is
  not an automorphism over the fixed PEL base. Taking `k` over `ℚ(i)`
  makes every element of `Gal(K/k)` preserve that base.
- `fieldOfModuli_base`: an object defined over `k` has field of moduli `k`.

### M6.7 Forms and the descent gerbe

Prove `descentObstruction`. (a) For an object `ξ` of `M_H` (or `𝔄_g`) over a field `K` and a finite
Galois `K′/K`, the `K`-forms of `ξ` split by `K′` — objects `ξ′` over `K` with `ξ′_{K′} ≅ ξ_{K′}`, up to
`K`-isomorphism — are in bijection with the pointed set `H¹(Gal(K′/K), Aut_{K′}(ξ_{K′}))` (Mathlib
`PresheafOfGroups.H1` for the Čech cover `Spec K′ → Spec K`): the comparison
`formsCechComparison` identifies its overlap ring `K′ ⊗_K K′` with
`∏_{σ ∈ Gal(K′/K)} K′`, so the Čech cocycle and coboundary equations become the
displayed group-cohomology equations. A descent datum on `ξ_{K′}` is therefore
a cocycle in its automorphism group, and Galois descent for quasi-projective schemes with ample descent data (M1.12) makes twists
effective. (b) For a perfect field `k` and a point `x ∈ M_H^c(k)`, define the gerbe `𝒢_x` over
`(Spec k)_ét` whose objects over a finite separable `k′/k` are the objects of `M_H(k′)` with coarse
image `x_{k′}`: it is a gerbe
(locally nonempty because `x` lifts over `k̄`, the object and its structures descend to a finite
extension of `k`, and every such extension is separable when `k` is perfect; locally
connected because `M_H → M_H^c` is bijective on geometric points and `Isom`
over a field is finite étale: M2.4 gives finite unramifiedness, and flatness over
a field gives étaleness)
banded by the finite geometric automorphism group, whose band need not come from a `k`-group in the
nonneutral case (AlgebraicModuliForArithmeticGeometry Layer 4: gerbes, bands and neutralizations); `x`
lifts to an object over `k` iff `𝒢_x` is neutral. If objects have no automorphisms (neat `H`), every
`k`-point of `M_H^c = M_H` lifts uniquely. (c) For a level-free stack such as `𝔄_g`, a `K`-rational coarse
point is not by itself a polarized abelian variety over `K`; consumers use objects, or a rigidifying
level with its field extension (M6.10) (Tsimerman, proof of Lemma 4.1, p. 384; Lipnowski–Tsimerman,
Definition 4.3, p. 17). *Needs:* M0.9, M1.12, M2.4, M6.2, M6.5; AlgebraicModuliForArithmeticGeometry
Layer 4; Mathlib `CategoryTheory.PresheafOfGroups.H1`, `WeierstrassCurve.ofJ`, `WeierstrassCurve.ofJ_j`;
Tau Ceti `WeierstrassCurve.j_quadraticTwist`, `WeierstrassCurve.not_exists_smul_quadraticTwist_eq`.

**Checks.**

- `forms_elliptic`: over a field of characteristic `≠ 2, 3` every point of the `j`-line lifts (Mathlib
  `WeierstrassCurve.ofJ` with `ofJ_j`), and the forms are the quadratic twists (quartic or sextic at
  `j = 1728, 0`), classified by `H¹(Gal, Aut E)`.
- `forms_twist_nontrivial`: for an elliptic curve `E/ℚ` with `j(E) ∉ {0,1728}` and
  `d ∈ ℚ^× ∖ ℚ^{×2}`, `E` and `E^d` become isomorphic over the nontrivial quadratic extension
  `ℚ(√d)` and are not isomorphic over `ℚ`, with their canonical polarizations
  (Tau Ceti `WeierstrassCurve.not_exists_smul_quadraticTwist_eq`).
- `forms_twist_exceptional`: for `E : y² = x³ − x`, `j(E) = 1728` and the nonsquare `d = −1`,
  the short-Weierstrass twist `(A,B) ↦ (d²A,d³B)` leaves the equation unchanged, so the polarized
  curves are already isomorphic over `ℚ`. The trace/norm representative with discriminant `−4`
  is `y² = x³ − 16x`; the map `(x,y) ↦ (4x,8y)` from `E` is a `ℚ`-isomorphism.
  The full `Aut E` in the forms classification retains this exceptional behavior.
- `gerbe_neat_trivial`: at neat level the band is trivial and `𝒢_x` is `Spec k`.
- For `k = 𝔽_p(t)`, let the constant étale group `C_p` act by `σ(u,v) = (u+v,v)` on `𝔸²_k`.
  Its invariants are `k[v,w]`, `w = u^p − u v^{p−1}`. The coarse point `(v,w) = (0,t)` of
  `[𝔸²_k/C_p]` lifts over `k̄` but not over `k^sep`: every `C_p`-torsor there is trivial, and
  a lift would require `u^p = t`. This smooth separated Deligne–Mumford stack with finite
  inertia shows why a finite algebraic lifting field need not give an étale-local lift over
  an imperfect field; the gerbe assertion in (b) uses perfectness.

### M6.8 Models over a bounded extension of the field of moduli

Prove `boundedFieldOfDefinition`: for a polarized abelian variety `(A, λ)` of dimension `g` over `ℚ̄`, let
`F` be the field of moduli of `(A, λ)`, `F_m` that of `(A, λ)` with a marked basis of `A[3]`, and
`F′ = F_m(ζ₃)`. Then `(A, λ)` has a polarized model over `F′`, every geometric endomorphism of `A`
descends to that model, and `[F′ : F] ≤ 2 · 3^{4g²}` (Tsimerman, Lemma 4.1 and its proof, p. 384). The
Galois orbit of the polarized pair on bases of `A[3]` has at most `|GL_{2g}(𝔽₃)| ≤ 3^{4g²}` elements, so
`[F_m : F]` is bounded; level-`3` polarized rigidity (M2.1) kills automorphisms, so effective descent
gives a model of the marked pair over `F_m` (M6.6, M6.7), not just a coarse point; adjoining `ζ₃` costs at
most `2`; over `F′` the Weil pairing defines the dual `3`-torsion, and Silverberg's theorem
(AbelianSchemesAndArithmeticModuli A6.20; Tsimerman cites it as his reference [19], Proposition 2.3)
descends all endomorphisms. The marking is of the polarized pair: Tsimerman states an unpolarized
variant, and rigidity of an unpolarized abelian variety under level-`3` marking is not used. *Needs:*
M2.1, M6.6, M6.7; AbelianSchemesAndArithmeticModuli A6.20.

**Checks.**

- `boundedField_g1`: for `g = 1`, `F′` lies in the `3`-division field of an elliptic curve over `ℚ(j)`
  with `ζ₃` adjoined, of degree at most `2 · |GL₂(𝔽₃)| = 96 ≤ 2 · 3⁴`.
- `boundedField_bound`: `|GL_{2g}(𝔽₃)| < 3^{(2g)²}` for every `g ≥ 1`.

- `boundedField_zero`: for `g = 0`, the object and every endomorphism are already
  defined over `ℚ`; adjoining `ζ₃` has degree `2`, the stated bound.
- `boundedField_unpolarized_control`: the integral shear matrices congruent to
  `1 mod 3` give infinitely many automorphisms of `E × E` fixing its `3`-torsion
  without a polarization; polarized rigidity is indispensable to the descent argument.

### M6.9 The Hodge bundle and the Hodge line

Define `PELModuli.hodgeBundle` and `PELModuli.hodgeLine`: the descent to the
PEL stacks and their fine algebraic spaces of the supplier's Hodge bundle
and determinant line of the universal abelian scheme. These targets own
**universal PEL descent**, rather than another definition of invariant
differentials for arbitrary abelian schemes. On an atlas use the supplier
bundles; universal-family isomorphisms give the cocycle, including the
inertia action at nonneat level. Their API is `PELModuli.hodgeBundle_atlas`,
`PELModuli.hodgeBundle_universal`, `PELModuli.hodgeBundle_levelPullback`
and `PELModuli.hodgeLine_classify` (pullback is the Hodge bundle or line of
the classified family), and `PELModuli.hodgeLine_ks_siegel`: for the principal
Siegel datum on its good smooth base, M2.10 gives
`Sym² ω ≅ Ω¹_{M/S₀}` and
`(det ω)^{⊗(g+1)} ≅ Ω^{g(g+1)/2}_{M/S₀}` (Lan,
Proposition 2.3.4.2, pp. 269–270). The determinant identity follows by
diagonal weights: each weight of a rank-`g` bundle appears `g+1` times
in `det(Sym² ω)`. *Needs:* M2.9, M2.10, M6.2; the Hodge-bundle/line
supplier contract in Scope; AlgebraicModuliForArithmeticGeometry Layer 3.

**Checks.**

- `hodgeLine_g1`: on `Y(n)`, the descended line is the modular-forms line
  and the Kodaira–Spencer identity is `ω^{⊗2} ≅ Ω¹`.
- `hodgeLine_inertia`: over `ℂ`, on the stack at `j = 1728`, the automorphism
  `[i]` acts on the invariant differential by `i`; forgetting inertia would
  give an incorrect descent to the coarse space.
- `hodgeLine_level`: the lines on levels `n` and `nm` agree by pullback
  over `ℤ[1/(nm)]`, including their universal-family identifications.
- `hodgeBundle_zero`: the dimension-zero universal family has bundle `0`
  and determinant line `O_M`; the Kodaira–Spencer determinant identity is the identity of `O_M`.

### M6.10 The arithmetic moduli interface

Define `PELModuli.classifyingMap` (for an object `ξ` over `S`, `c_ξ : S → M_H` with `c_ξ^*(universal) ≅ ξ`,
unique up to unique 2-isomorphism), `PELModuli.moduliPoint` (`x_A ∈ M^c(K)` for an object over a field
`K`), `PELModuli.rigidifyingExtension` (for a neat `H′ ⊆ H` and an object over `K`, the finite extension
`K′` over which a level-`H′` structure exists, with `[K′ : K] ≤ [H : H′]`, and the `K′`-point of the fine
space `M_{H′}`: the level-`H′` structures on `A_K` form a finite étale `K`-scheme, M6.1), and the
interface it assembles: the stacks `M_H`, `𝔄_g`, `𝔄_{g,d}` with universal objects and Hodge bundles; the
classifying maps; moduli points; rigidifying extensions; and the descent comparison of M6.7. The API is
`PELModuli.hodgeLine_classify` (`c_ξ^* ω̄^univ ≅ ω̄_{A_ξ}`); `PELModuli.export_obstruction` (for a
perfect field `K`, a `K`-point of `M^c` lifts to an object over `K` iff its gerbe is neutral); and
`PELModuli.export_siegel` (the
universal fine family for the Siegel datum and a neat level, transported to the Siegel moduli
representative; at arbitrary level the universal object lives on the stack) (Tsimerman, proof of
Lemma 4.1, p. 384; Kottwitz, §5, p. 391). *Needs:* M6.1, M6.2, M6.3, M6.4, M6.5, M6.7, M6.9.

**Checks.**

- `export_classify_universal`: the classifying map of the universal object is the identity.
- `export_model_point`: a polarized model over a field gives a point of the coarse space; a point does
  not give back a model.
- `export_not_family`: a morphism `Spec K → A_1` does not determine an object over `K`: an elliptic curve
  and its quadratic twists give the same `K`-point.
- `export_rigidify_g1`: for an elliptic curve over a number field `K` and `n = 3`, `K′ = K(E[3])` and the
  object gives a `K′`-point of `Y(3)`.

### M6.11 Finiteness over a finite field

Prove `finiteFieldFiniteness`: for a finite field `k` and `g, d ≥ 1`, there are finitely many
`k`-isomorphism classes of abelian varieties of dimension `g` over `k` admitting a polarization of degree
`d²` defined over `k`, including when `char k` divides `d`; finiteness without fixing the degree is not
asserted. The coarse space of `𝔄_{g,d}` (M6.4, M6.5) is of finite type, so it has finitely many
`k`-points; every polarized object over `k` maps to one; for each point with an object, its `k`-forms
are classified by continuous `H¹(Gal(k̄/k), Aut(ξ_{k̄}))` for the finite group of polarized automorphisms
(AbelianSchemesAndArithmeticModuli A6.18), and over a finite field a continuous cocycle is determined by
its value on Frobenius, so this set is finite; take the union, and forget the polarization
(Lipnowski–Tsimerman, Remark 4.2, p. 17, and Corollary 2.2, p. 5). *Needs:* M6.4, M6.5, M6.7;
AbelianSchemesAndArithmeticModuli A6.18.

**Checks.**

- `finiteField_elliptic`: for `g = d = 1` and `char k ≥ 5` there are finitely many elliptic curves over
  `𝔽_q`, at most `2q + 6` classes.
- `finiteField_forms`: for each `j ∈ 𝔽_q` with `j ≠ 0, 1728` (`q` odd) there are exactly two classes, an
  elliptic curve and its quadratic twist.

### M6.12 Explicit nonempty examples

Prove `nonemptyExamples`. (a) For `L_{(1,d)} = ℤ⁴` with `⟨e₁, f₁⟩ = 1`, `⟨e₂, f₂⟩ = d` (an integral datum
with `O = ℤ`, M0.5), elliptic curves `E₁, E₂` over `ℚ` and `d ≥ 1`, `(E₁ × E₂, λ_{E₁} × dλ_{E₂})` is a
polarized abelian surface of type `(1, d)` over `ℚ`, an object of `𝔄_{2,d}` over `ℚ` (not only a coarse
point); for `n ≥ 3` prime to `d`, after the finite extension `ℚ(E₁[n], E₂[n], ζ_n)` it gives a point of `A_{2,(1,d),n}`. (b) For an
imaginary quadratic `K` of class number one, an elliptic curve `E/ℚ` with CM by `O_K` (the action defined
over `K`) and a prime `p` unramified in `K`, the object `(E × Ē′, λ_E × pλ_{Ē′})` with `O_K` acting
through the CM on `E` and through the conjugate action on the copy `Ē′` gives a `K`-point of the unitary
problem of signature `(1, 1)` with lattice `O_K ⊕ pO_K`, the second pairing scaled by `1/p` relative to
the standard trace pairing; transport by `x ↦ px` gives `p` times the standard form and polarization
degree `p²`, whereas the unscaled restricted pairing gives `p⁴` (Lan, Remark 1.4.3.13, pp. 165–166, for
nonemptiness from the lattice). The PEL conditions are checked directly on the M1 carriers: the type
from kernels, the Rosati condition from complex conjugation on `O_K`, the determinant condition from
the two actions; level structures exist over the stated extensions (M6.10). These are objects over the
stated fields, so M6.7 is not needed to produce them. *Needs:* M0.5, M0.22, M0.23, M1.2, M1.7, M6.4,
M6.10.

**Checks.**

- `nonempty_type_1d`: `λ_{E₁} × dλ_{E₂}` has kernel `E₂[d]`, geometrically `(ℤ/d)²`, and type `(1, d)`.
- `nonempty_unitary_signature`: the Lie algebra of `E × Ē′` has `O_K` acting through `τ` on one line and
  `τ̄` on the other, signature `(1, 1)`.
- `nonempty_object_not_point`: the surface of (a) is an object over `ℚ`, so its rationality does not
  depend on a gerbe.

### Examples

- `𝔄_1` over `ℤ` with coarse space the `j`-line; field of moduli `ℚ(j)`; forms are twists.
- `𝔄_{2,d}` is of finite type over `ℤ` for every `d`, with the explicit `ℚ`-objects `E₁ × E₂`.

### Dependencies

M0–M2 (M3–M5 are not used); AbelianSchemesAndArithmeticModuli A2.4, A2.6, A2.8, A4.3, A6.18, A6.20;
AlgebraicModuliForArithmeticGeometry Layers 2–5, 7; SchemeAndStackFoundations Layers 1 and 4;
TauCetiRoadmap.ModularCurves §9E; Tau Ceti `WeierstrassCurve.j_quadraticTwist`,
`WeierstrassCurve.not_exists_smul_quadraticTwist_eq`; Mathlib `WeierstrassCurve.ofJ`,
`CategoryTheory.PresheafOfGroups.H1`.

## Worked examples

- **The modular curves.** The genus-one Siegel datum `(ℤ, id, ℤ², −J, J)` has `G = GL₂`, reflex field
  `ℚ`, signature `(1, 1)` and determinant condition `rank Lie = 1`. For `n ≥ 3`, `M_n = A_{1,1,n}` is the
  smooth affine curve `Y_full(n)` over `ℤ[1/n]` (M5.3), its complex points are `φ(n)` copies of
  `Γ(n)\ℍ` (M3.9), its Kodaira–Spencer isomorphism is `ω^{⊗2} ≅ Ω¹` (M2.10), its generic fibre is the
  canonical model (M4.3), its level-free stack is the moduli stack of elliptic curves with coarse space
  the `j`-line (M6.2, M6.5), and the level-free isomorphism-class presheaf fails to be a sheaf because
  of quadratic twists (M1.7, M6.7).
- **A nonprincipal Siegel type.** For `g = 2` and `D = (1, 2)`, `[L^# : L] = 4`, the prime `2` is bad, and
  `E₁ × E₂` with `λ_{E₁} × 2λ_{E₂}` is an object over `ℚ` of `𝔄_{2,2}` (M5.1, M6.12); `𝔄_{2,2}` is of finite
  type over `ℤ` including at `2` (M6.4), but the smooth model of M2.8 exists only over `ℤ[1/2]`.
- **The Picard datum.** `K = ℚ(√−3)`, `V = K³`, `H = diag(1, 1, −1)`, `δ = 1/s`, `s² = −3`, `Im τ(s) < 0`, `L = O_K³`: type A,
  reflex field `K`, relative dimension `2`, good primes those not dividing `3n`, `ker¹(ℚ, G) = 1`
  (M5.6); the determinant condition at a split prime is `Lie ≅ k² ⊕ k`, and in positive characteristic
  it is not a trace condition (M0.18–M0.19); the ordinary locus is dense at split and empty
  at inert primes (M2.16).
- **The principal Hilbert datum.** For `F = ℚ(√5)`, `L = O_F ⊕ (1/√5)O_F` is self-dual for the trace
  pairing; the moduli space is a smooth surface over `ℤ[1/5n]` with reflex field `ℚ` and `ker¹ = 1`
  (M5.4), and its determinant condition is Rapoport's.
- **Rank-one CM.** For `F` imaginary quadratic and `Φ = {τ}`, the moduli problem is finite étale over
  `O_F ⊗ ℤ_(p)` (M2.11), a torsor under a finite torus quotient with Galois action by Artin
  reciprocity (M4.7–M4.8), and its torus trace counts one representative per orbit of components
  (M4.9).

## Downstream consumers

ShimuraCompactifications builds the
toroidal and minimal compactifications of `M_H`, proves integral quasi-projectivity and the ampleness of
the Hodge line on the minimal compactification. HilbertModularVarietiesAndShimuraCurves consumes
PELModuli M5.4's scalar-determinant PEL datum `hilbertIntegralDatum`, its rationalization
`hilbertRationalDatum`, principal inverse-different lattice and
`hilbertTraceEmbedding`, combining `hilbertConventionMap` with its row/column transpose comparison.
It imports the full `Res_{F/ℚ} GL₂` datum with independent real signs from ShimuraData §5.3
(HilbertModularVarietiesAndShimuraCurves §H0.0), and owns general polarization modules (§H1),
nonprincipal integral lattices (§§H0.3–H0.5) and the Hilbert integral models stated in §H2,
including at ramified primes. IgusaVarietiesAndTorsionConcentration and
PerfectoidShimuraVarieties use the good models, the universal family and the Hecke action at
`p`-power level. AutomorphicGaloisRepresentationsPartII and AutomorphicPadicLFunctions use the unitary
data, the CM moduli schemes and the torus trace. FaltingsFinitenessAndIsogenyTheorems and
ArakelovGeometryAndAbelianHeights consume the interface of M6.10: the stacks, classifying maps, moduli
points, rigidifying extensions, Hodge line and the descent gerbe.

## References

- K.-W. Lan, *Arithmetic compactifications of PEL-type Shimura varieties*, Harvard PhD thesis, May
  2008 (https://www.kwlan.org/articles/cpt-PEL-type-thesis.pdf); published as London
  Mathematical Society Monographs 36, Princeton University Press, 2013. Locators above are to the thesis.
  Revised thesis (https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), with its own locators where specified.
  Official thesis errata (https://www.kwlan.org/articles/cpt-PEL-type-thesis-errata.pdf) and book errata
  (https://www.kwlan.org/articles/cpt-PEL-type-book-pup-err.pdf).
- K.-W. Lan, *An example-based introduction to Shimura varieties*
  (https://www.kwlan.org/articles/intro-sh-ex.pdf).
- R. E. Kottwitz, *Points on some Shimura varieties over finite fields*, J. Amer. Math. Soc. 5 (1992),
  373–444 (https://webusers.imj-prg.fr/~christophe.cornut/M2/Ref/Kottwitz_PointsShiModp.pdf).
- J. S. Milne, *Introduction to Shimura varieties*, revised version of September 16, 2017
  (https://www.jmilne.org/math/xnotes/svi.pdf), numbering as in Clay Math. Proc. 4 (2005).
- Y. Liu, Y. Tian, L. Xiao, W. Zhang and X. Zhu, *On the Beilinson–Bloch–Kato conjecture for
  Rankin–Selberg motives*, Invent. Math. 228 (2022), 107–375 (public access copy
  https://par.nsf.gov/servlets/purl/10323568; arXiv:1912.11942). Page numbers are those of the published
  version; Definition 3.3.2 (the reflexive closure) differs between the published and arXiv versions.
- S. Bijakowski, V. Pilloni and B. Stroh, *Classicité de formes modulaires surconvergentes*, Ann. of
  Math. 183 (2016), 975–1014.
- T. Wedhorn, *Ordinariness in good reductions of Shimura varieties of PEL-type*, Ann. Sci. École Norm.
  Sup. (4) 32 (1999), 575–618.
- J. Tsimerman, *The André–Oort conjecture for `A_g`*, Ann. of Math. 187 (2018), 379–390.
- M. Lipnowski and J. Tsimerman, *How large is `A_g(F_q)`?*, Duke Math. J. 167 (2018), 3403–3453
  (arXiv:1511.02212v1; locators to the arXiv version).
- G. Faltings and C.-L. Chai, *Degeneration of Abelian Varieties*, Ergebnisse der Mathematik (3) 22,
  Springer, 1990.
- A. Borel and J.-P. Serre, *Théorèmes de finitude en cohomologie galoisienne*, Comment. Math. Helv. 39
  (1964), 111–164
  (https://www.college-de-france.fr/media/jean-pierre-serre/UPL6720771035987925133_Borel_Serre_Theoremes_de_finitude.pdf).
- J.-P. Serre, *Galois Cohomology*, Springer, 1997.
- D. Mumford, *Abelian Varieties*, Oxford University Press, 1970.
- The Stacks Project, https://stacks.math.columbia.edu (Tags 02GU, 033C, 035I, 035J, 035L, 035S, 03GR, 03GV, 0539, 0H74).
