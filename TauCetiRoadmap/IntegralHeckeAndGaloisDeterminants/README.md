# Roadmap: integral Hecke actions, determinants and interpolation

**Summary.** This roadmap builds the integral algebra that attaches Galois data to Hecke eigensystems: Chenevier's determinants (polynomial laws whose characteristic coefficients survive torsion and nonreduced coefficient rings), reconstruction of representations over henselian and complete local rings, integral and derived Hecke actions on cohomology, the normalisation of Hecke polynomials for GL_n and GSp₄, interpolation of determinants through finite quotients with quantified nilpotent errors, and integral Ribet modules with their Fitting ideals. We want it because the modern route to Galois representations for torsion classes, and to modularity lifting over CM fields, works with Hecke algebras that are not reduced and coefficient rings that are not fields; determinants, derived Hecke actions and the quantified interpolation are exactly the tools those arguments use, and the Ribet modules are what the Euler-system and main-conjecture roadmaps consume.

This roadmap builds the integral algebra that connects a Hecke action on cohomology to Galois data
over its coefficient ring. The central object is a multiplicative polynomial law of specified degree,
Chenevier's determinant: its characteristic coefficients remain meaningful in torsion and over
nonreduced rings, where trace data or characteristic-zero points lose information. From that object
the roadmap builds reconstruction of representations over henselian and complete local rings, the
derived Hecke images of a complex with their ghost comparison, the normalisation of unramified Hecke
polynomials for `GLₙ` and `GSp₄`, interpolation of determinants through finite quotients, quantified
nilpotent errors, and integral Ribet extension modules. Its end theorems are the interpolation
theorem of Layer IHG.4 (a continuous determinant over a nonreduced coefficient ring with prescribed
Frobenius polynomials, unique and unramified outside a fixed set), the quantified descent of
Layer IHG.5 (the same over a quotient by a nilpotent error ideal with a uniform exponent), and the
integral Ribet theorem of Layer IHG.6 (a finite module carrying a cocycle class whose zeroth Fitting
ideal lies in the congruence ideal, including coincident residual characters and residue
characteristic two).

Every interface retains the coefficient ring: reconstruction carries stated residual hypotheses,
Hecke images retain the abstract action, and interpolation carries a specified nilpotent error. The
mathematical assertions below are targets for formalisation; the existing library inputs are
distinguished in the `*Needs:*` annotations. Each construction states its usable API and its checks.
The companion [Suggested.lean](Suggested.lean), in the namespace
`TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants`, states headline theorems against the pinned
libraries, using concrete definitions where needed to express them. A target that ends with a
`*Lean:*` line has the indicated acceptance statement; the other targets and all Checks are specified in this README. This document fixes
the mathematical scope, including hypotheses whose carriers come from another roadmap.

## Scope and ownership

The roadmap owns determinant polynomial laws and their reconstruction and interpolation theory:
Chenevier determinants with their characteristic polynomials, kernels and Cayley–Hamilton ideals,
the determinant coordinate ring, the Amitsur formula and the comparison with pseudocharacters,
continuous determinants, contragredients, finite projective and Azumaya determinants, connected
reductive pseudocharacters with their invariant-coordinate evaluations, the general untwisted
invariant-word colimit and its representing-ring comparison, rational cohomology of a
flat affine group scheme, henselian reconstruction, generalized matrix algebras with their
reducibility ideals and extension modules, coefficient descent, the compatible local compressions
of Caraiani–Newton, and GL pseudocharacter reconstruction. It also owns
the four Hecke images of a complex (chain, homotopy, derived, cohomology), their ghost comparison,
local factors and operator localisation, the explicit `GLₙ` and `GSp₄` polynomial conversions
between Hecke and Galois conventions, maximal ideals of Galois type, interpolation through finite
quotients and inverse limits, the arithmetic of nilpotent error ideals, and the algebraic Ribet
construction with its Fitting-ideal bound, underlying Buchsbaum–Rim relation complexes,
and the integral GL₂ induction and countable good-filtration interfaces. The latter include
acyclicity and tensor closure, the twisted lower-Borel calculations and the compatibility of
connecting maps with invariant products needed in §§6.4–6.7. The equivariant relation-complex
comparison is an owned target of §6.6 and supplies a prerequisite for the Fitting-ideal bound.

Interpolation here is on ordinary group algebras through supplied coefficient quotients.
Completed coefficient-tensor evaluation, completed Cayley–Hamilton topology and continuous
pseudodeformation representability remain outside this scope.

It consumes the following developments by name and does not rebuild their general theories; the
exact declarations are listed under *Exact supplier contracts*.

- Mathlib supplies polynomial laws, tensor products, matrices, group algebras, divided powers, the
  exterior algebra, module and derived categories, quotient, local and topological algebra, and the
  Azumaya predicate. DerivedModuleAlgebra §§0.DP.1–0.DP.2 supplies the homogeneous and
  multiplicative law predicates and Roby algebras; the determinant structure extends that carrier
  here. DerivedModuleAlgebra §0.K.1 supplies the linear-functional Koszul theory.
- Tau Ceti supplies right comodules over a coalgebra, the completed group algebra, Fitting ideals,
  the classical rank-two Satake parameters, conjugacy of algebra isomorphisms over a field and the
  arithmetic-Frobenius value of the cyclotomic character.
- The roadmap **SemisimpleAlgebras** (layers 0, 2, 3, 4 and 5) supplies the Jacobson-radical unit
  criteria, Artin–Wedderburn at its artinian hypotheses, density and double centralisers after the
  appropriate dimension bound, finite-dimensional central-simple splitting over the centre, and
  conjugacy of algebra isomorphisms; the determinant-specific boundedness and inseparable norm
  factors are developed here.
- The roadmap **ReductiveGroups** (layer 1) supplies the comodule, morphism, tensor and
  regular-representation foundations. Their native Tau Ceti API supplies cofree comodules and
  the cofree adjunction; §0.7 builds rational cohomology and algebraic induction over arbitrary
  commutative bases with flat coordinate Hopf algebras on these foundations.
  ReductiveGroups layer 9 supplies split reductive group schemes over `ℤ` with
  their Hopf algebras, points functor and base change, for a given root datum; `GLₙ` and `GSp₂ₙ`
  enter as the split groups of their root data. Tau Ceti supplies `GeneralLinear.coordinateHopfAlgebra` and its generic
  matrix dictionary. The invariant coordinate algebras of Layer IHG.0 use an actual commutative
  Hopf algebra and its represented points; the
  `GSp₄` statements of Layers IHG.3a and IHG.3b take the similitude as a matrix identity
  `ρ(g)ᵀ J ρ(g) = μ(g) J` for a fixed invertible alternating `J`; **ReductiveGroupsPartII** (RG2.2, RG2.3)
  supplies the bounded-orbit building fixed-point theorem (RG2.2) and hyperspecial
  containment after finite extension for a single element of `G(ℚ_p)` lying in a compact open
  subgroup (RG2.3).
- **SmoothRepresentationsOfLocalGroups** (SR.4, SR.6) supplies the integral spherical double-coset
  generators, normalised Satake, the `GSp₄` spin polynomial, the integral finite-wild cocycle scheme
  (SR.6.1) and the finite-wild excursion algebra with its twisted applications (SR.6.3).
  This roadmap owns the arbitrary-base, arbitrary-group untwisted construction in §0.7,
  *General invariant-word colimit*. Its comparison with SR.6.3 at trivial Weil action identifies
  their colimit cocones, so this specialization uses one carrier. SR.6 retains the finite-wild
  finiteness and cocycle-quotient comparison theorems at their stated hypotheses, and the finite
  Weil action in the twisted theory. The pseudocharacter representing-ring comparison, its
  evaluations, and the GL determinant comparison are proved here.
- **ClassFieldTheory** (layer 7) supplies local Artin reciprocity with an explicit Frobenius
  normalisation and its inverse conversion; **Chebotarev** (layer 10) supplies the density of
  conjugacy classes of unramified Frobenius in every finite quotient of `G_{F,S}`.
- **ProfiniteCohomology** (layer 2) supplies explicit continuous cochains, 1-cocycles,
  coboundaries and `H¹`; **ModularForms** (layer 9) supplies the classical Hecke polynomial
  `X²−a_ℓX+ω(ℓ)ℓ^{k−1}`; **PadicMeasuresIwasawaAlgebras** (§5.1) supplies the ring-level
  finite-projective determinant-line API; AlgebraicVectorBundles L0C sheafifies it.
- **SchemeAndStackFoundations** (§0.20) owns `Ring.IsJapanese.of_complete_local` and
  `Ring.IsNagata.of_complete_local`, including finite normalization in inseparable extensions;
  §2.22 owns affine Azumaya étale splitting and the
  finite-cover-to-one-faithfully-flat-étale-algebra adapter in the neutral `IsAzumaya` API.
  The reduced-norm polynomial law is owned here.
- **PadicMeasuresIwasawaAlgebras** (§4.5) owns `TauCeti.Module.fittingIdeal_le_annihilator`;
  the Ribet consequences are owned here.

Tau Ceti's `HeckeRing.GL2.Newform.satakeParameters` carries the classical rank-two polynomial
`X²−a_pX+χ(p)p^(k−1)` over `ℂ`; the rank-two normalisation in Layer IHG.3a only matches coefficient
conventions against it. The applications to locally symmetric spaces, higher coherent cohomology,
automorphic congruences, Iwasawa theory and Galois deformation spaces supply their own geometric
Hecke comparisons and classical congruence witnesses. This roadmap specifies the exact algebraic
inputs those applications must provide; it does not infer them from the existence of
characteristic-zero eigenforms.

The following are the library or roadmap halves of statements kept here, each of
which adds the polynomial-law, local-ring or integral clause: the `GSp₄` spin polynomial and its
Calegari–Geraghty normalisation, `SpinPolynomial`, `SpinPolynomial.reciprocal`, its
similitude and `gsp4-galois-comparison` of SmoothRepresentationsOfLocalGroups,
SR.4, whose *gln-generators* supplies the Satake values `S(T_r) = q^{r(n−r)/2} e_r` substituted
into `glnPolynomial_satake`; the trivial-action finite-wild excursion specialization of SR.6,
identified with *General invariant-word colimit*; the henselian and artinian interfaces
`IsAdicComplete.henselianRing` and `IsArtinianRing.equivPi`; the invertible top exterior power at
constant rank (PadicMeasuresIwasawaAlgebras, §5.1); conjugacy
of algebra isomorphisms over a field (Tau Ceti `exists_unit_conj_of_algEquiv`; SemisimpleAlgebras,
layer 5); arithmetic and geometric Frobenius and the Artin map (ClassFieldTheory, layer 7,
`geometricArtinMap`, `isArithFrobeniusLift_of_mk_eq_artinMap_uniformizer`); the Hecke polynomial
`X²−a_ℓX+ω(ℓ)ℓ^{k−1}` (ModularForms, layer 9); the carrier `A[[G]]` (Tau Ceti
`completedGroupAlgebra`); coboundaries under restriction (ProfiniteCohomology, layer 2, `B1`,
`explicitRes1`); Mathlib `Ideal.sup_pow_add_le_pow_sup_pow` (the exponent `a+b`, sharpened to
`a+b−1` here), `LinearMap.eventually_isCompl_ker_pow_range_pow` (the finite-length case of the
ghost decomposition), `Matrix.det_fromBlocks_zero₂₁`, `MvPolynomial.mul_esymm_eq_sum`,
`Matrix.charpoly_inv`, `Matrix.reverse_charpoly`, `Matrix.det_one_add_mul_comm` and the
group-algebra antipode, the `HopfAlgebra (MonoidAlgebra A G)` instance of
`Mathlib/RingTheory/HopfAlgebra/MonoidAlgebra.lean`, with `MonoidAlgebra.antipode_single`, each the
matrix or universal case of a determinant statement here. The Fitting ideal is
`TauCeti.fittingIdeal`, its base change `TauCeti.fittingIdeal_baseChange`, the character map of a
group algebra `MonoidAlgebra.lift`, and the spin polynomials are those of
SmoothRepresentationsOfLocalGroups. The integral Ribet statements in `Suggested.lean` use
`TauCeti.fittingIdeal` and `MonoidAlgebra.lift` directly.

## Conventions

- **Rings and modules.** `A` is a commutative ring; `R` is an associative unital `A`-algebra,
  possibly noncommutative. Modules are unital.
- **Polynomial laws.** A polynomial law is a natural family over **all** commutative coefficient
  `A`-algebras `S`, on `S ⊗_A M`. Mathlib's `toFun'` takes `S` in the universe of `A` and its
  `toFun` extends the evaluation to larger universes. Equality of determinants, residual factor
  identities and descent equations always mean equality of these laws, not merely equality on
  elements of `R`.
- **Characteristic polynomials.** For a degree-`d` determinant `D`, `χ_D(x,X) = D_{A[X]}(X−x)`
  and `χ_D = ∑ᵢ (−1)ⁱ Λᵢ X^(d−i)`. The monic convention is `X−x`. Degree zero is allowed and gives
  the constant-one law. Multiplicativity is kept separate from the `A`-linearity of the first
  coefficient. Trace determines `D` when `d!` is a unit; determinant reconstruction over fields
  works in all characteristics without that assumption. Divided-power multiplication inside a fixed
  degree is induced by multiplication on `R` through the tensor law and differs from
  multiplication in the graded divided-power algebra.
- **Group determinants.** `A[G]` is Mathlib's `MonoidAlgebra A G`. The dual pulls back along the
  anti-involution `g ↦ g⁻¹`. A twist by a unit character `θ` multiplies the `i`-th characteristic
  coefficient by `θ(g)ⁱ`. For a monic polynomial `P` with unit constant term, the monic
  inverse-root polynomial is `X^d P(X⁻¹)/P(0)`; the coefficient reversal `X^d P(X⁻¹)` has constant
  term `1` and need not be monic.
- **Frobenius and Satake.** Write `ε` for the `p`-adic cyclotomic character. At an unramified
  place with residue cardinality `q`, arithmetic Frobenius has `ε = q` (Tau Ceti
  `IsArithFrobeniusLift.coe_localCyclotomicCharacter`) and geometric Frobenius has `ε = q⁻¹`; they
  are inverse conjugacy classes, and a chosen Artin map must name its convention. Spherical Haar
  measure is normalised by `vol(K) = 1`; `T₀ = 1` for `GLₙ`; `s² = q` with `s` a unit in the Satake
  coefficient ring. For `GSp₄`, `T₀` denotes the central double coset and is invertible; the full
  multiplier `μ` is retained separately from `det ρ = μ²`, and tensoring a contragredient with `θ`
  gives multiplier `μ⁻¹θ²`.
- **Topologies and limits.** Complete local rings carry their maximal-ideal-adic topology unless
  another specified ideal supplies it. A continuous determinant means continuity of every
  coefficient of the group characteristic polynomial `g ↦ χ_D(g,X)`. Galois interpolation fixes the same finite ramification set `S`
  throughout a limit.
- **Fitting ideals.** Fitting ideals are zeroth Fitting ideals, Tau Ceti's
  `TauCeti.fittingIdeal A M 0`; for a finite module a finite list of generators is enough, while
  its relation module can be infinitely generated, and all maximal minors of finite relation
  selections are then used.
- **Ribet modules.** Let `α = χψ⁻¹` and use the left action `g·m = α(g)m`. The cocycle equation is
  `κ(gh) = κ(g) + α(g)κ(h)`, and the coboundary attached to `y` is `(α(g)−1)y`. Local quotient
  relations use `κ(g) − (α(g)−1)y`. Every Ext statement keeps the quotient constituent's actual
  vector module and its `S_J`-action; the image in ambient Ext consists exactly of the extensions
  restricting from that same quotient.
- **Symbols.** `X` is the polynomial variable throughout. The generic `2×2` matrices of Layer
  IHG.6.3 are `Y_i = [[a_i, b_i],[c_i, d_i]]`, the adjoint module of Layer IHG.6.4 is `𝒜` with
  basis `A, B, C, D` (so that `A` the coefficient ring and `A` the basis vector never meet in one
  statement), the cofinal open ideals of Layer IHG.4 are `𝔞_r`, the nilpotent error ideals of
  Layer IHG.5 are `J`, and the relation ideals of Layer IHG.6 are `J` and `J′`; the generic linear
  equations of Layer IHG.6.5 are written with coefficients `α_ij` and unknowns `x_j`.
- **Construction order.** The layers follow the mathematical dependencies: IHG.0; the polynomial
  and multiplier part of IHG.3 (IHG.3a); IHG.1; IHG.2; the residual Galois-type part of IHG.3
  (IHG.3b); IHG.4; IHG.5; IHG.6. Splitting IHG.3 in this way places its full multiplier identity
  before symplectic descent, and field reconstruction before the definition of Galois-type maximal
  ideals. Within each subsection the targets are ordered by their dependencies, and each `*Needs:*`
  annotation names the earlier constructions or the external owner it relies on, with transitive
  inputs supplied through the cited constructions.
- **Library pins.** The library vocabulary is that of Mathlib
  `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti
  `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. A prerequisite to a Tau Ceti roadmap layer refers to
  that layer's stated development, not to an implemented theory; a Mathlib prerequisite refers only
  to the named declaration.

## Exact supplier contracts

- `Submodule.minorsIdeal` in `TauCeti/RingTheory/FittingIdeal/Basic.lean` supplies
  the ideal of minors of a submodule. The maximal-minor ideal of a map `f` in §6.5 is only
  `(LinearMap.range f).minorsIdeal m`, with no separate ideal construction.
- `exteriorPower.zeroEquiv`, `exteriorPower.oneEquiv`, and `exteriorPower.map`
  in `Mathlib/LinearAlgebra/ExteriorPower/Basic.lean` supply the low-degree identifications
  and functorial exterior maps used by the Koszul and determinant complexes.
- `CliffordAlgebra.contractLeft` and `CliffordAlgebra.contractLeft_ι_mul` in
  `Mathlib/LinearAlgebra/CliffordAlgebra/Contraction.lean` supply contraction on the
  exterior algebra by taking the zero quadratic form. The graded one-form contraction of §6.5
  asks additionally for its restriction from exterior degree `n+1` to degree `n`.

All names in this section are part of the dependency contract.

- Layer 5 uses `RingHom.kerLift`, `RingHom.kerLift_mk`, and
  `RingHom.kerLift_injective` in `Mathlib/RingTheory/Ideal/Quotient/Operations.lean`;
  `Ideal.Quotient.factor` and `Ideal.Quotient.factor_mk` in
  `Mathlib/RingTheory/Ideal/Quotient/Defs.lean`; `Ideal.map_pow` in
  `Mathlib/RingTheory/Ideal/Maps.lean`; and `Ideal.IsPrime.pow_le_iff`,
  `Ideal.span_singleton_pow`, `Ideal.sup_pow_add_le_pow_sup_pow` in
  `Mathlib/RingTheory/Ideal/Operations.lean`. The sum target improves the last
  declaration's exponent from `a+b` to `a+b−1` for positive `a,b`.
  `Ideal.span_singleton_eq_bot` in `Mathlib/RingTheory/Ideal/Span.lean` reduces
  the finite-ring Checks to element computations; `Matrix.mul_apply` in
  `Mathlib/Data/Matrix/Mul.lean` supplies the matrix-coordinate calculations.
- `groupCohomology.IsCoboundary₁` in
  `Mathlib/RepresentationTheory/Homological/GroupCohomology/LowDegree.lean` and
  `groupCohomology.map`, `groupCohomology.mapShortComplexH1` in
  `Mathlib/RepresentationTheory/Homological/GroupCohomology/Functoriality.lean`
  supply class transport and restriction. Layer 5's scalar-action formula additionally
  tracks the chosen local witness and the diagonal change of coordinates.

- `PadicInt.ker_toZModPow`, `PadicInt.lift`, `PadicInt.lift_spec` and
  `PadicInt.lift_unique` in `Mathlib/NumberTheory/Padics/RingHoms.lean`, together with
  `PadicInt.inverseLimitRingEquiv` and `PadicInt.inverseLimitContinuousMulEquiv` in
  `TauCeti/NumberTheory/Padics/InverseLimit.lean`, supply the prime-`p` coefficient-limit
  example in Layer 4. The kernel formula identifies the residue quotients with the ideal quotients.

- `QuotientGroup.map`, `QuotientGroup.map_mk` in
  `Mathlib/GroupTheory/QuotientGroup/Defs.lean` and `MonoidAlgebra.mapDomainAlgHom` in
  `Mathlib/Algebra/MonoidAlgebra/Basic.lean` supply the actual quotient and group-algebra
  maps used by Layer 4's determinant pullbacks.
- `RingCat.sectionsSubring` in `Mathlib/Algebra/Category/Ring/Limits.lean` supplies the
  ring of compatible sections of a diagram; the ring of compatible residue classes of Layer 4
  specializes it to an explicit descending ideal sequence, rather than constructing generic limits.
  `IsAdicComplete.liftRingHom` in `Mathlib/RingTheory/AdicCompletion/RingHom.lean`
  handles powers of one ideal; the Layer 4 presentation also allows arbitrary descending ideals.

- `TwoSidedIdeal.ker`, `TwoSidedIdeal.mem_ker` in
  `Mathlib/RingTheory/TwoSidedIdeal/Kernel.lean` supply the kernel ideal; the ghost ideal of
  Layer 2 specializes this carrier to the assembled homology action, and membership in it is the
  predicate `HeckeImage.IsGhost`, vanishing on every cohomology module.
- `Module.DirectLimit`, `Module.DirectLimit.of`, `Module.DirectLimit.of_f`,
  `Module.DirectLimit.lift` and `Module.DirectLimit.hom_ext` in
  `Mathlib/Algebra/Colimit/Module.lean` supply the module colimit and its universal property.
  The module telescope of Layer 2 is its `ModuleCat` packaging for the transition
  `t^(j-i)`, with insertion maps `Module.DirectLimit.of`; its presentation identifies the
  adjacent-relations quotient with that colimit.
- `AlgHom.subalgebraMap`, `AlgHom.subalgebraMap_surjective` and
  `Subalgebra.range_comp_val` in `Mathlib/Algebra/Algebra/Subalgebra/Basic.lean`
  supply the induced surjections between image algebras.
- `CochainComplex.IsKProjective.Qh_map_bijective` in
  `Mathlib/Algebra/Homology/DerivedCategory/KProjective.lean` supplies the
  homotopy-to-derived full-faithfulness comparison for a K-projective source.
- `DerivedCategory.singleFunctorCompHomologyFunctorIso` in
  `Mathlib/Algebra/Homology/DerivedCategory/FullyFaithful.lean` supplies the coordinates
  used in the single-degree examples.
- `PrimeSpectrum.comap_quotientMk_bijective_of_le_nilradical` in
  `Mathlib/RingTheory/Spectrum/Prime/Topology.lean` and
  `Ideal.relIsoOfSurjective` in `Mathlib/RingTheory/Ideal/Maps.lean`
  supply the spectrum and ideal correspondences for the nilpotent cohomology quotient.
- `IsIdempotentElem.one_sub` in `Mathlib/Algebra/Ring/Idempotent.lean` supplies the
  complementary idempotent; its scalar and matrix specializations need no new theorem.

- `DividedPowerAlgebra.map`, `DividedPowerAlgebra.map_apply_dp`, `DividedPowerAlgebra.dp_sum_smul`,
  `DividedPowerAlgebra.dp_mul` in `Mathlib/RingTheory/DividedPowerAlgebra/Init.lean` supply
  the raw divided-power algebra operations. DerivedModuleAlgebra §0.DP.2 supplies the restriction
  `Γ^d(f)` to a fixed homogeneous submodule and its separate internal multiplication.
- `PolynomialLaw.toFun` and its comparison lemma `toFun'_eq_toFun` in
  `Mathlib/RingTheory/PolynomialLaw/Basic.lean` supply evaluation in arbitrary universes.
- `PiTensorProduct.reindex`, `PiTensorProduct.tprod` in
  `Mathlib/LinearAlgebra/PiTensorProduct/Basic.lean` supply the permutation action and pure
  tensors used for the symmetric-tensor comparison. `DirectSum.lof` in
  `Mathlib/Algebra/DirectSum/Module.lean` supplies the homogeneous-piece inclusions.
- `Algebra.TensorProduct.lift` in `Mathlib/RingTheory/TensorProduct/Maps.lean` contracts
  coefficient tensors along the supplied algebra maps.

The following APIs are used directly, with no additional image or Fitting aliases:

- `AlgHom.range`, `AlgHom.mem_range`, `AlgHom.rangeRestrict`,
  `AlgHom.rangeRestrict_surjective` in `Mathlib/Algebra/Algebra/Subalgebra/Basic.lean`;
  inclusion injectivity is `Subtype.val_injective`.
- `Ideal.Quotient.factorₐ`, `Ideal.Quotient.factorₐ_apply_mk` in
  `Mathlib/RingTheory/Ideal/Quotient/Operations.lean` supply `A/J →ₐ[A] A/m`
  for `J ≤ m`, including its value on each quotient class.
- `AlgHom.quotientKerEquivRange` in `Mathlib/RingTheory/Ideal/Quotient/Operations.lean`.
- `IsIdempotentElem.Corner.instAlgebra`, `TauCeti.cornerSubmodule`,
  `TauCeti.mem_cornerSubmodule_iff` and `IsIdempotentElem.cornerLinearEquivCornerSubmodule`
  in `TauCeti/RingTheory/Idempotents/Corner.lean` supply corners and their scalar structure.
  The `Corner` abbreviation uses Mathlib's carrier and the imported Tau Ceti instance directly,
  with `a • x = ax` and `algebraMap a = ae` (`IsIdempotentElem.Corner.val_algebraMap`).
  The GMA block modules `e_i R e_j` and entry modules `A_ij` of Layer 1 are this carrier, taken at
  the block idempotents and at the primitive idempotents; membership in each is given by the two
  fixed-point equations `e x = x = x f`, and the primitive idempotents are idempotent. Compression
  belongs to the
  range by `TauCeti.cornerMap_apply`. Corner determinants, Peirce decomposition, pairings,
  reducibility ideals and extension modules all use this carrier.
- `Module.Projective.of_split` in `Mathlib/Algebra/Module/Projective.lean` and
  `Module.Finite.of_surjective` in `Mathlib/RingTheory/Finiteness/Basic.lean` apply to the
  split projection `x ↦ xe` for an idempotent `e`; no separate GMA projectivity theorem is needed.
- `MonoidAlgebra.lift` in `Mathlib/Algebra/MonoidAlgebra/Basic.lean`, for the character map
  `A[G] → A`.
- `TauCeti.fittingIdeal`, `TauCeti.fittingIdeal_eq_minorsIdeal_ker` and
  `Submodule.det_mem_minorsIdeal` in `TauCeti/RingTheory/FittingIdeal/Basic.lean`;
  `TauCeti.fittingIdeal_baseChange` in `TauCeti/RingTheory/FittingIdeal/BaseChange.lean`.
- `Matrix.reverse_charpoly`, `Matrix.charpolyRev`, `Matrix.charpoly_inv` and
  `Matrix.charpoly_diagonal` in `Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean`
  (the last declaration is in `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean`).
  These supply matrix reversal, inversion and diagonal computations. Layer 3a's
  reciprocal characteristic-polynomial identity is the polynomial-law determinant analogue over
  arbitrary commutative coefficient rings; it does not assume a matrix realization.
- `Ideal.Quotient.field` in `Mathlib/RingTheory/Ideal/Quotient/Basic.lean` supplies
  the residue-field structure used by Layer 3b.
- `Polynomial.scaleRoots`, `Polynomial.coeff_scaleRoots` and
  `Polynomial.mul_scaleRoots_of_noZeroDivisors` in `Mathlib/RingTheory/Polynomial/ScaleRoots.lean`,
  and `Polynomial.reflect` in `Mathlib/Algebra/Polynomial/Reverse.lean`, supply Layer 3b's
  transformed polynomials. Its targets concern existence, continuity, semisimplicity and
  absolute irreducibility of realizing representations, beyond these polynomial operations.
- `Matrix.charpoly_one`, `Matrix.charpoly_isEmpty` and `Matrix.charpoly_transpose` in
  `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean`, and `Matrix.charpoly_monic`,
  `Matrix.charpoly_natDegree_eq_dim`, `Matrix.det_eq_sign_charpoly_coeff` in
  `Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean`, supply Layer 3b's rank and unit tests.
- `SmoothRepresentationsOfLocalGroups.SpinPolynomial` and
  `SmoothRepresentationsOfLocalGroups.SpinPolynomial.reciprocal` in
  `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/Suggested.lean`.
  Its `T1,T2` correspond to `T₂,T₁` here. The monic variant `Q`
  reflects the degree-four polynomial and swaps those indices; the dual-spin variant
  `P` additionally inverts the central unit.



### From Mathlib

Polynomial laws, tensor products, matrices and group algebras: `PolynomialLaw`,
`PolynomialLaw.ground`, `PolynomialLaw.id`, `PolynomialLaw.comp`, `Algebra.TensorProduct.instRing`,
`Algebra.TensorProduct.rid`, `MonoidAlgebra`, `MonoidAlgebra.of`, `MonoidAlgebra.mapDomainAlgHom`,
`Matrix.det`, `Matrix.charpoly`, `Matrix.trace`. DerivedModuleAlgebra §0.DP.1 supplies
homogeneity and multiplicativity on this existing law carrier; the determinant structure here uses
them.

Divided powers and the exterior algebra: `DividedPowerAlgebra` and `DividedPowerAlgebra.dp` supply
the entire divided-power algebra and its generators; DerivedModuleAlgebra §0.DP.2 supplies its
homogeneous pieces and their internal algebra multiplication. `exteriorPower.map`, the existing tensor
powers and `SymmetricAlgebra` are used for the subsequent constructions.

Module and derived categories: `ModuleCat`, `DerivedCategory`, `DerivedCategory.Q`,
`DerivedCategory.Qh` and `ModuleCat.finite_ext`. Finite derived morphism modules are built here by
truncation induction. `ModuleCat.restrictScalars`, `Module.compHom` and
`CategoryTheory.Functor.mapExtLinearMap` are reused for generalized-matrix-algebra extensions with
their actual module actions. `ModuleCat.finite_ext` needs a noetherian base and two finite modules
and does not assert finite projective dimension.

Quotient, local and topological algebra: `TwoSidedIdeal`, `TwoSidedIdeal.span`, `Submodule.mkQ`,
`IsIdempotentElem.Corner`, `HenselianLocalRing`, `IsDiscreteValuationRing`, `IsFractionRing`,
`IsAdicComplete`, `IsAdic`, `Continuous.ext_on`, and `RingTheory.Sequence.IsWeaklyRegular`. A
corner has identity `e`; it is not a unital subalgebra with identity `1`.
`Module.free_of_flat_of_isLocalRing` requires finite generation.

The Azumaya predicate `IsAzumaya`: finite projective, faithful, with `R ⊗ Rᵒᵖ → End(R)` bijective.
It bundles finite projectivity, faithfulness and the two-sided endomorphism isomorphism without a
chosen matrix splitting. The reduced-norm construction in Layer 0 requires a proof of faithfully
flat matrix splitting; this is stronger than the supplied predicate.

Exterior-algebra contraction: `CliffordAlgebra.contractLeft` (`Mathlib/LinearAlgebra/CliffordAlgebra/Contraction.lean`)
for one-forms, extended to all forms through `ExteriorAlgebra.lift`; `ExteriorAlgebra.map`,
`LinearMap.dualMap`, `TensorPower` (`⨂[A]^k`), `PiTensorProduct.tprod` and `finProdFinEquiv` build
Buchsbaum's exterior-bar modules. Nothing here redefines the one-form contraction: the graded
one-form contraction of §6.5 is its restriction.

Constant rank is Mathlib's `Module.rankAtStalk` (`Mathlib/RingTheory/Spectrum/Prime/FreeLocus.lean`),
written `Module.rankAtStalk (R := A) V = d` as in `Mathlib/RingTheory/TotallySplit.lean`; for a finite
projective module this is the dimension of every field fibre, so no private constant-rank predicate
is introduced.

The cocycle identity is Mathlib's `groupCohomology.IsCocycle₁`, `f(gh) = g • f(h) + f(g)`. The
matrix and universal cases already in Mathlib, listed under *Scope and ownership* as the library
halves of statements kept here, are `Ideal.sup_pow_add_le_pow_sup_pow`, `LinearMap.eventually_isCompl_ker_pow_range_pow`,
`Matrix.det_fromBlocks_zero₂₁`, `MvPolynomial.mul_esymm_eq_sum`, `Matrix.charpoly_inv`,
`Matrix.reverse_charpoly`, `Matrix.det_one_add_mul_comm`, `IsAdicComplete.henselianRing`,
`IsArtinianRing.equivPi` and the `HopfAlgebra (MonoidAlgebra A G)` instance of
`Mathlib/RingTheory/HopfAlgebra/MonoidAlgebra.lean`, with `MonoidAlgebra.antipode_single`; the
character map of a group algebra is `MonoidAlgebra.lift`.

### From Tau Ceti

`TauCeti.Comodule` (`Algebra/Coalgebra/Comodule/`): right comodules over a coalgebra, the fixed
subcomodule `Comodule.fixedSubcomodule`, the abelian category of comodules over a flat coalgebra,
`Comodule.tensor`, `Comodule.cofree`, the coaction embedding `Comodule.Hom.cofreeUnit` and
the cofree adjunction `Comodule.Hom.cofreeEquiv`. `Comodule.Corestrict` corestricts a right
coaction along a coalgebra morphism. Conjugation invariants, rational cohomology and good
filtrations are built on these in Layers IHG.0 and IHG.6.

`TauCeti.completedGroupAlgebra`, `TauCeti.completedGroupAlgebra.proj` and
`TauCeti.completedGroupAlgebra.isEmbedding_coeffFamily` in
`TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean`:
the inverse limit over finite group quotients for a commutative coefficient ring.
Layer 4 interpolates coefficients on ordinary group algebras; this supplier does not identify
simultaneous coefficient and group limits.

`TauCeti.fittingIdeal` (`RingTheory/FittingIdeal/Basic.lean`, `BaseChange.lean`,
`Generators.lean`): Fitting ideals of a finite module, independence of the presentation
(`fittingIdeal_eq_minorsIdeal_ker`), the minors of relation vectors (`Submodule.det_mem_minorsIdeal`,
`fittingIdeal_eq_minorsIdealOfSet`) and base change (`fittingIdeal_baseChange`). `Fitt₀` below is
`fittingIdeal A M 0`, and its base change is `TauCeti.fittingIdeal_baseChange`.

`HeckeRing.GL2.Newform.satakeParameters`, the classical rank-two polynomial over `ℂ`, matched
against in Layer IHG.3a only; `IsArithFrobeniusLift.coe_localCyclotomicCharacter`, the value
`ε = q` at arithmetic Frobenius; `exists_unit_conj_of_algEquiv`, conjugacy of algebra isomorphisms
over a field, the field case of the inner-conjugacy statement of Layer IHG.1.

### From TauCetiRoadmap.DerivedModuleAlgebra

| Supplier | Supplied interface |
| --- | --- |
| DerivedModuleAlgebra §0.DP.1 | Homogeneous and multiplicative polynomial laws on Mathlib's carrier, their composition laws and degree-one characterizations. |
| DerivedModuleAlgebra §0.DP.2 | Homogeneous divided powers, grading, universal law and Roby representability, arbitrary base change, tensor map, internal multiplication, and free symmetric tensors. |
| DerivedModuleAlgebra §0.K.1 | Linear-functional Koszul complexes, finite-sequence specialization, chain maps, concatenation tensor formula, null-homotopies and weakly regular resolutions. |

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

SR.4: the spherical double cosets `T_r = [K diag(ϖ, …, ϖ, 1, …, 1) K]` and their normalised
Satake images `q^{r(n−r)/2} e_r` in the symmetric Laurent ring over `ℤ[q^{±1/2}]`, for
`vol(K) = 1` and after adjoining an invertible square root of `q`. SR.4 does not assert that the
`T_r` generate the spherical Hecke algebra over `ℤ`, and nothing here uses such generation: the
`GLₙ` Hecke polynomial of Layer IHG.3a is a formal expression in `q` and the `T_r`; the `GSp₄` spin polynomial with constant term `1`
(`SpinPolynomial`), its reciprocal monic form (`SpinPolynomial.reciprocal`), its similitude
(a README-only target of SR.4), the comparison with the Calegari–Geraghty normalisation
(`gsp4-galois-comparison`) and the Satake values `S(T_r) = q^{r(n−r)/2} e_r` (SR.4's *gln-generators*),
which are the substitution `T_i = s^{i(n−i)} e_i` read in `glnPolynomial_satake`. Its general
construction is applied here to `GLₙ` and to the two specified `GSp₄` representations. SR.6.1 and
SR.6.3: the integral finite-wild cocycle scheme (*One integral finite-wild cocycle scheme*) and the
finite-wild excursion algebra (*Finite-wild excursion algebra*), with the coefficient ring, dual
group, finite Weil action and wild quotient specified there. The arbitrary commutative-base,
arbitrary-group untwisted colimit is owned here by §0.7, *General invariant-word colimit*.
*Untwisted excursion comparison* identifies its cocone with SR.6.3's cocone when those finite-wild
hypotheses hold and the Weil action is trivial; SR.6.3's twisted construction and arithmetic
comparison theorems retain their own hypotheses.

### From TauCetiRoadmap.ProfiniteCohomology

Layer 2: explicit continuous cochains, 1-cocycles, coboundaries and `H¹` for a topological group
acting continuously on a topological module, with restriction and coefficient maps, in particular
`B1` and `explicitRes1` for coboundaries under restriction. The cocycle identity is Mathlib's
`groupCohomology.IsCocycle₁`. A finite module means finitely generated over its coefficient ring,
and can be infinite as a set.

### From TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras

Layers 0, 2, 3 and 4: Jacobson radical unit criteria; Artin–Wedderburn at its artinian
hypotheses; density and double centralisers after the appropriate dimension bound;
finite-dimensional central-simple splitting over the centre. Layer 5: conjugacy of algebra
isomorphisms over a field. The determinant-specific boundedness and inseparable norm factors are
developed here (Layer IHG.1).

### From TauCetiRoadmap.ReductiveGroups and TauCetiRoadmap.ReductiveGroupsPartII

ReductiveGroups layer 1: comodules, comodule morphisms, tensor products and the regular
representation, together with the representation–comodule dictionary. The native Tau Ceti
cofree and corestriction APIs listed above supply the adjunction and change of coaction used
in §0.7. The arbitrary-base cofree-resolution comparison and algebraic induction are targets
of §0.7; the integral `GL₂` cohomology and good-filtration calculations are targets of §6.4.

ReductiveGroups layer 9: split reductive group schemes over `ℤ` constructed from a root datum
(Chevalley–Demazure), with their Hopf algebras, base change and points over a field; `GLₙ` and
`GSp₂ₙ` are the split groups of their root data. Tau Ceti supplies the explicit `GLₙ` coordinate Hopf algebra and generic matrix.
The general root-datum construction belongs to that layer; here they are data (a commutative Hopf
algebra with the identity component given, and the similitude as a matrix identity against a fixed invertible
alternating form), and the Hopf algebras of layer 9 are the intended instances. [Reductive groups, Part II](../ReductiveGroupsPartII/README.md) RG2.2 and
RG2.3: respectively the bounded-orbit building fixed-point theorem and hyperspecial containment
after finite extension for a single element of `G(ℚ_p)` lying in a compact open subgroup.
The latter does not supply simultaneous containment for a prescribed compact subgroup.

### From TauCetiRoadmap.ClassFieldTheory and TauCetiRoadmap.Chebotarev

ClassFieldTheory layer 7: local Artin reciprocity with an explicit Frobenius normalisation and its
inverse conversion (`geometricArtinMap`, `isArithFrobeniusLift_of_mk_eq_artinMap_uniformizer`);
reciprocity is consumed from here, not from SR.4. Chebotarev layer 10: density of conjugacy
classes of unramified Frobenius in every finite quotient of `G_{F,S}`.

### From TauCetiRoadmap.ModularForms and TauCetiRoadmap.PadicMeasuresIwasawaAlgebras

ModularForms layer 9: the Hecke polynomial `X²−a_ℓX+ω(ℓ)ℓ^{k−1}` of a normalised eigenform, the
classical half of the rank-two normalisation of Layer IHG.3a.
PadicMeasuresIwasawaAlgebras §5.1
supplies `projectiveDeterminant`, `projectiveDeterminant_constantRank`,
`projectiveDeterminant_baseChange` and the exterior-map formula on finite projective modules.
The degree-`d` multiplicative polynomial law on endomorphisms is the additional construction here.
AlgebraicVectorBundles L0C consumes that ring-level foundation for sheaf determinants.

PadicMeasuresIwasawaAlgebras §4.5
supplies `TauCeti.Module.fittingIdeal_le_annihilator` on the existing `TauCeti.fittingIdeal`
carrier: for a commutative ring `A` and `[Module.FinitePresentation A M]`,
`fittingIdeal A M 0 ≤ Module.annihilator A M`, that is, for finitely presented modules; the Ribet
modules of Layer 6 are finite over the noetherian `T`, hence finitely presented, so this form
suffices. This is the common bound consumed by Ribet and Iwasawa theory.

### From TauCetiRoadmap.SchemeAndStackFoundations

SchemeAndStackFoundations §0.20
supplies `Ring.IsJapanese`, `Ring.IsNagata`, `Ring.IsJapanese.of_complete_local` and
`Ring.IsNagata.of_complete_local` in the neutral ring-level API. For a complete noetherian local
domain `A`, the Japanese condition gives `Module.Finite A (integralClosure A E)` for every
finite extension `E` of its fraction field, including inseparable extensions
([Stacks Lemma 10.162.8, tag 032W](https://stacks.math.columbia.edu/tag/032W)).
The finiteness of integral closures used in §6.1 only specializes
`Ring.IsJapanese.of_complete_local` to the supplied fraction field and scalar tower. The
additional result here is the global difference lattice of §6.1; together with the
fraction-lattice topology of §6.1 it supplies the finite-lattice and topology inputs to
`IntegralRibet.local_ribet`.

SchemeAndStackFoundations §2.22
owns the affine splitting content of `azumaya_affine_iff` and `azumaya_equivalent_conditions`.
Its ring-level supplier is `IsAzumaya.exists_etale_matrix_splitting`: for `IsAzumaya A R`,
`d>0` and `rankAtStalk R=d²`, it returns an étale faithfully flat commutative `A`-algebra `B`
and `B⊗_A R ≃ₐ[B] M_d(B)`. Its finite-cover adapter takes affine étale splitting charts
`Spec Bᵢ → Spec A` with jointly surjective images and uses their finite product `B = ∏ᵢ Bᵢ`.
It proves `Algebra.Etale A B`, `Module.FaithfullyFlat A B`, and the matrix-splitting
equivalence over that same `B`. Both the sheaf equivalence and the reduced-norm construction consume
this neutral ring-theory result; neither needs an import of the other's whole development.

The matrix action uses `Matrix.toLinAlgEquiv'` in
`Mathlib/LinearAlgebra/Matrix/ToLin.lean`, followed by `Module.compHom` restriction of
scalars. `matrixModule ρ` packages that vector module in `ModuleCat R`.
`IsSimpleModule` and `IsSemisimpleModule` are the predicates from
`Mathlib/RingTheory/SimpleModule/Basic.lean`, shared with SemisimpleAlgebras.
The action of `r` is multiplication by the matrix `ρ(r)`. The submodules of `matrixModule ρ` are
the `ρ`-stable subspaces of `Kᵈ`, with the same underlying subsets, and this gives the
invariant-subspace characterizations of simplicity and semisimplicity of `matrixModule ρ`.
Simplicity includes nontriviality; the dimension-zero example is rejected. Reconstruction,
residual specialization and the determinant-specific multiplicity-free predicate use this same
module action; absolute irreducibility is `IsAbsolutelyIrreducible`, stated on the matrix family of
a realising representation.

## How to read the build

`README.md` is normative; `Suggested.lean` states the headline results whose objects can be
expressed at the library pins. Its module documentation identifies the signatures that need
additional objects. The targets that end with a `*Lean:*` line have the indicated acceptance
statements; the others are specified in this README. Each
`*Needs:*` annotation names its mathematical prerequisites. The build order is
IHG.0 → IHG.3a → IHG.1 → IHG.2 → IHG.3b → IHG.4 → IHG.5 → IHG.6.

- **Layer 0** delivers polynomial laws, determinants, their characteristic coefficients, kernels,
  the determinant coordinate ring using DerivedModuleAlgebra §0.DP.2, the Amitsur formula and the trace
  comparisons, continuity, duals, finite projective and Azumaya determinants, and connected
  invariant-coordinate pseudocharacters and their algebraic representing rings, with rational
  cohomology of a flat affine group scheme.
- **Layer 3a** delivers the `GLₙ` Hecke polynomial, its Satake normalisation, the character twist,
  reciprocal and Frobenius conversions, the `GSp₄` dual-spin polynomial and the full similitude
  identity used by symplectic coefficient descent.
- **Layer 1** delivers Cayley–Hamilton algebras, semisimple reconstruction over fields, henselian
  lifting and generalized matrix algebras, reducibility ideals and extension modules, universal Cayley–Hamilton algebras, coefficient descent, compatible local
  compressions, GL pseudocharacter reconstruction and generic representation algebras.
- **Layer 2** delivers the four Hecke images of a complex, the ghost ideal with its amplitude
  bound, local factors and localized summands over a complete coefficient ring, and operator
  localisation with ordinary parts.
- **Layer 3b** delivers maximal ideals of Galois type and non-Eisenstein ideals, with their dual and
  twist compatibility.
- **Layer 4** delivers uniqueness from Frobenius density, gluing over compact coefficient rings,
  compatible finite-quotient data, the inverse-limit determinant, uniform congruence witnesses, and
  the integral interpolation theorem from prescribed Frobenius polynomials.
- **Layer 5** delivers descent of a determinant through a quantified nilpotent error ideal, the
  arithmetic of nilpotence exponents through extensions, sums, products, filtrations and limits,
  and residual specialisation.
- **Layer 6** delivers the Ribet cocycle and its module with local conditions, relation minors,
  the formal matrix algebra and its invariant error, integral induction and good filtrations, Buchsbaum–Rim
  complexes with generic regularity, the two relation complexes, and the weighted Fitting
  containment with the local and global Ribet extension theorems.

## Layer 0: polynomial laws, determinants and invariant evaluations

This layer defines the full scalar-extension objects first, then their coefficient, kernel and
representability APIs. The determinant language is retained in small characteristic; the trace
comparisons explicitly carry their invertibility assumptions. Its last subsection builds compatible invariant evaluations for affine group schemes,
with connected reductive applications, and the rational cohomology of a flat affine group scheme
that Layers IHG.1 and IHG.6 consume.

### 0.1 Homogeneous and multiplicative laws

DerivedModuleAlgebra §0.DP.1 supplies homogeneity and multiplicativity of Mathlib polynomial
laws, including their scalar-extension definitions and degree-one characterizations.

### 0.2 Scalar-extension laws and degree one

**Linear-map laws and ground-value adapters.** For a commutative ring `A` and arbitrary
`A`-modules `M, N`, construct the polynomial law of an `A`-linear map `ℓ : M → N` on Mathlib's
`PolynomialLaw` carrier. Its scalar-extension map is `ℓ_S = S ⊗ ℓ` (`LinearMap.lTensor`) for
every commutative `A`-algebra `S`. Prove that its ground map is `ℓ` under `A ⊗_A M ≅ M`, and
that two such laws agree iff the linear maps agree. Using the degree-one characterization of
DerivedModuleAlgebra §0.DP.1, prove that a homogeneous degree-one law `P : M → N` is the law of
the unique linear map whose underlying function is `P.ground`, without flatness or
finite-generation assumptions ([Chenevier](https://arxiv.org/pdf/0809.0415v2),
Example 1.2(i) and footnote 11, p.7). *Needs:* DerivedModuleAlgebra §0.DP.1 / Homogeneous
polynomial laws; Mathlib `PolynomialLaw.ground`, `TensorProduct.lid`, `LinearMap.lTensor`.

**Checks.**

- The law of `id` is `PolynomialLaw.id`: the scalar extension of the identity is the identity on
  every `S ⊗_A M`, so a construction inserting a nontrivial coefficient would fail here.
- Its value map is `ℓ`: the ground evaluation of the law of `ℓ` at `m` is `ℓ(m)`, so a construction
  that forgot to identify `A ⊗_A M` with `M` would compute a different map.
- The law of `0` is the zero law, the degenerate case; a construction producing a nonzero constant
  term would fail it.
- For `A = ℤ`, `M = N = ℤ/2`, the identity law corresponds uniquely to `id` despite the
  torsion. The characteristic-polynomial target uses this adapter for determinant traces,
  and the one-dimensional determinant target uses it for algebra maps.

**Determinants (Chenevier).** For `A` commutative and `R` any associative unital `A`-algebra, a
`d`-dimensional determinant valued in `A` is a degree-`d` homogeneous polynomial law `D : R → A`
that preserves `1` and multiplication after every commutative scalar extension; `d ≥ 0` is allowed,
and for `d = 0` the only determinant is the constant `1`. For `R = A[G]`, with `G` a group or
monoid, it is called a determinant on `G`. Define the structure `Determinant` and its ground value
`D(x)`, and prove `D(xy) = D(x)D(y)`, `D(1) = 1`, `D(ax) = a^d D(x)` and that units go
to units ([Chenevier](https://arxiv.org/pdf/0809.0415v2), §1.5, Definition,
p. 9). *Needs:* DerivedModuleAlgebra §0.DP.1 (homogeneous and multiplicative polynomial laws), Mathlib `PolynomialLaw.ground`.

**Checks.**

- `D_id(M) = det(M)` on `M_d(A)`: the determinant law of the identity representation
  computes the matrix determinant, so a law normalised differently would fail on `M = 1`.
- A determinant of dimension `0` is the constant `1`, the degenerate case; a definition forcing
  `D(0) = 0` would exclude it.
- Over `𝔽_p`, on the polynomial algebra `𝔽_p[T]`, the `p`-th powers of evaluation at `0` and at
  `1` are two different `p`-dimensional determinants with the same trace, namely zero, so a
  definition that recorded only the trace would identify two distinct determinants.

**Characteristic polynomial and trace of a determinant.** For `D` a `d`-dimensional determinant on
`R` and `x ∈ R`, define `χ(x, t) := D_{A[t]}(t − x) ∈ A[t]`, where `A[t]` is a commutative
`A`-algebra in the universe of `A`, so that `D_{A[t]}` is defined; write

```text
χ(x, t) = Σ_{i=0}^{d} (−1)^i Λ_i(x) t^{d−i}.
```

It is monic, with `natDegree = d` when `A` is nonzero. For `d ≥ 1`, `Λ_0 = 1`, `Λ_d = D`, and `Λ_1 =: Tr` is an `A`-linear map with
`Tr(1) = d`. Define `Determinant.charpoly` (`χ`) and `Determinant.trace` (`Λ_1`, set to `0` in
degree zero), prove that `χ(x, t)` is monic, that `deg χ = d`, and that `χ(x, 0) = (−1)^d D(x)`,
construct `Tr` as an `A`-linear map and prove `Tr(1) = d`
([Chenevier](https://arxiv.org/pdf/0809.0415v2), §1.10, p. 12;
[Chenevier](https://arxiv.org/pdf/0809.0415v2), §1.10, (1.3), p. 12). *Needs:* Determinants (Chenevier), Mathlib `Polynomial`, `Algebra.TensorProduct.rid`, `Polynomial.Monic`,
§0.2 / Linear-map laws and ground-value adapters.

**Checks.**

- `χ(1, t) = (t − 1)^d`: evaluating `D_{A[t]}` at `t − 1 = (t − 1)·1` uses homogeneity, so a
  definition with the sign convention `x − t` would produce `(1 − t)^d` instead.
- For `det ∘ ρ` the characteristic polynomial is `Matrix.charpoly (ρ x)`, so a definition whose
  coefficients `Λ_i` were indexed or signed differently would disagree with Mathlib's `charpoly`.
- For `det ∘ ρ`, `Tr` is the matrix trace: the coefficient of `t^{d−1}` in `det(t − ρ(x))` is
  `−tr ρ(x)`, so a `Λ_1` extracted with the wrong sign would give `−tr`.

**The determinant of a matrix representation.** For an `A`-algebra homomorphism `ρ : R → M_d(A)`
into the full matrix algebra, prove that `D := det ∘ ρ`, computed after each scalar extension as
`det_S ∘ (ρ ⊗ S)`, is a `d`-dimensional determinant with `D(x) = det ρ(x)`,
`χ(x, t) = charpoly ρ(x)` and `Tr = tr ∘ ρ`, and that conjugate representations give the same
determinant. Construct the matrix determinant law `det ∘ ρ` and prove `D(x) = det ρ(x)`, `Tr = tr ∘ ρ`,
`χ(x) = charpoly ρ(x)` and that conjugate representations have the
same determinant ([Chenevier](https://arxiv.org/pdf/0809.0415v2), §1.5, p. 9). *Needs:* Characteristic polynomial and trace of a determinant, Mathlib `Matrix.det`, `Matrix.det_mul`, `Matrix.det_smul`,
`Matrix.det_conj`, `RingHom.map_det`, `Matrix.charpoly`, `Matrix.trace`.

**Checks.**

- The determinant law of the identity on `M_d(A)` evaluates to `det`: the construction applied to the identity
  representation computes the ordinary determinant, so any scalar-extension step that failed to
  commute with `det` would already show here.
- Its trace is the matrix trace, so a construction whose `Λ_1` did not agree with `Matrix.trace`
  under `ρ = id` would be wrong.
- A block-diagonal representation gives the product determinant: `det` of a block sum is the
  product of the block determinants, so a construction not multiplicative across blocks would fail.

**Direct sums of determinants.** For determinants `D_1, D_2` on `R` of dimensions `d_1, d_2` over a
commutative `A`, so that products of multiplicative laws are multiplicative, prove that the product
`D_1·D_2`, taken pointwise after each scalar extension, is a determinant of dimension `d_1 + d_2`,
with `Tr = Tr_1 + Tr_2` and `χ = χ_1χ_2`. Prove `(D_1 D_2)(x) = D_1(x) D_2(x)`,
`Tr(D_1 D_2) = Tr D_1 + Tr D_2` and `χ(D_1 D_2) = χ(D_1) χ(D_2)` ([Chenevier](https://arxiv.org/pdf/0809.0415v2),
Proof of Lemma 2.2, p. 24). *Needs:* Characteristic polynomial and trace of a determinant.

**Checks.**

- The determinant law of a block sum is the product of the determinant laws of the blocks, so a product law not
  agreeing with the matrix determinant of `diag(ρ_1, ρ_2)` would fail.
- Traces add: `Tr(D_1 D_2)(x) = Tr_1(x) + Tr_2(x)`, so a product whose degree-`(d−1)` coefficient
  was not the sum would be detected.
- Multiplying by the dimension-`0` determinant changes nothing, the degenerate case: `D·1 = D` with
  dimension `d + 0`, so a construction that shifted the dimension or the value would fail.

**Restriction of determinants.** For an `A`-algebra homomorphism `φ : R′ → R` and a `d`-dimensional
determinant `D` on `R`, prove that `D ∘ φ`, the composition of polynomial laws with the degree-one
law of `φ`, is a `d`-dimensional determinant on `R′`; for a subgroup `H ≤ G`, restriction along
`A[H] → A[G]` is restriction to `H`. Prove `(D ∘ φ)(x) = D(φ x)`, that restriction along the
identity is `D`, and that restriction along `ψ ∘ φ` is restriction along `ψ` then `φ` ([Chenevier](https://arxiv.org/pdf/0809.0415v2),
§1.5, p. 9 (determinants on A[G])). *Needs:* Determinants (Chenevier),
§0.2 / Linear-map laws and ground-value adapters; Mathlib `MonoidAlgebra.mapDomainAlgHom`.

**Checks.**

- Restriction along the identity returns `D` itself, so a comap that re-indexed or re-scaled the
  law would fail on `φ = id`.
- Restriction of `det ∘ ρ` along `φ` is `det ∘ (ρ ∘ φ)`: both compute `det ρ(φ x)`, so a comap not
  compatible with the matrix determinant law would give a different law.
- Restriction to a subgroup `H ≤ G` along `A[H] → A[G]` computes `D` on `H`-elements, so a comap
  that did not use `MonoidAlgebra.mapDomainAlgHom` of the inclusion would not be restriction.

**Scalar extension of determinants.** For a commutative `A`-algebra `S` in the universe of `A`, as
for Mathlib's polynomial laws, and a `d`-dimensional determinant `D` on `R`, define `D ⊗_A S` as an
`S`-valued `d`-dimensional determinant on `S ⊗_A R`, with `(D ⊗ S)(1 ⊗ x) = D(x) ⊗ 1`; this is the
identification `M^d_A(R, S) ≅ M^d_S(R ⊗_A S, S)`. Prove that `(D ⊗ S)(1 ⊗ x)` is the image of
`D(x)`, that `χ` commutes with base change, and that the trace of `D ⊗ S` on `1 ⊗ x` is the image
of `Tr(x)` ([Chenevier](https://arxiv.org/pdf/0809.0415v2), Remark 1.4, p.9;
[Chenevier](https://arxiv.org/pdf/0809.0415v2), §1.5, p. 9). *Needs:* Determinants (Chenevier),
Mathlib `TensorProduct.AlgebraTensorModule.cancelBaseChange`.

**Checks.**

- Base change to `A` itself is `D`: `D ⊗ A = D` under `A ⊗_A R ≅ R`, so a construction not using
  the cancellation isomorphism would produce a different law.
- Base change of `det ∘ ρ` is `det ∘ (ρ ⊗ S)`, so a construction not commuting with the matrix determinant law would
  fail on the matrix case.
- Transitivity: `(D ⊗ S) ⊗ T = D ⊗ T` for `S → T`, so a construction depending on the intermediate
  algebra would give two different laws on `T ⊗_A R`.

**One-dimensional determinants are algebra homomorphisms.** With no hypothesis on `A`, prove that
the map `D ↦ D_A` is a bijection between `1`-dimensional `A`-valued determinants on `R` and
`A`-algebra homomorphisms `R → A`; for `R = A[G]`, these are the characters `G → A^×`
([Chenevier](https://arxiv.org/pdf/0809.0415v2), §1.5, p. 9). *Needs:* Determinants (Chenevier),
Mathlib `AlgHom`; §0.2 / Linear-map laws and ground-value adapters.

**Two-dimensional determinants on a group.** For a group `G` (for monoids, Chenevier's form with
`f(g, h)` applies instead), prove that `D ↦ (T, D|_G)` is a bijection between `2`-dimensional
`A`-valued determinants on `G` and pairs `(T, D)` of functions `G → A` with `D : G → A^×` a
homomorphism, `T(1) = 2`, `T(gh) = T(hg)` and

```text
D(g)T(g^{-1}h) − T(g)T(h) + T(gh) = 0
```

for all `g, h` ([Chenevier](https://arxiv.org/pdf/0809.0415v2), Example 1.8 and Lemma 1.9, pp. 10–11). *Needs:*
Determinants (Chenevier), Mathlib `MonoidAlgebra`.

**D(1 + rr′) = D(1 + r′r).** For a `d`-dimensional determinant `D` on `R` and `r, r′ ∈ R`, prove
`D(1 + rr′) = D(1 + r′r)` ([Chenevier](https://arxiv.org/pdf/0809.0415v2), Lemma 1.12(i) and its proof,
pp. 12–13). *Needs:* Characteristic polynomial and trace of a determinant.

**Pseudocharacters.** Over an arbitrary commutative ring `A`, with no hypothesis on `d!`, a
`d`-dimensional `A`-valued pseudocharacter on `R` is (Chenevier's definition, p.2, also requires
`d! ∈ A^×`; here that hypothesis is carried by the comparison theorems instead) an `A`-linear `T : R → A` that is central,
with `T(1) = d`, `T(xy) = T(yx)`, and the pseudocharacter identity

```text
Σ_{σ ∈ S_{d+1}} sgn(σ) T^σ(x_1, …, x_{d+1}) = 0
```

for all `x_i ∈ R`, where `T^σ(x) = ∏` over the cycles `(j_1 … j_s)` of `σ` of
`T(x_{j_1}⋯x_{j_s})`, fixed points included. Define `cycleProduct` (the product of `x` along a
cycle), `cycleTerm` (`T^σ(x)`) and the predicate `IsPseudocharacter`, and prove
that the trace of a determinant is a pseudocharacter ([Chenevier](https://arxiv.org/pdf/0809.0415v2), §1.10, Lemma 1.12(iii) and
§1.26, pp. 12, 20). *Needs:* Mathlib `Equiv.Perm.sign`, `Equiv.Perm.SameCycle`,
`Function.minimalPeriod`, `LinearMap`.

FreeProbability §F8, Gaussian and Haar random-matrix asymptotic freeness, consumes
`cycleProduct` and `cycleTerm` for normalized complex-matrix traces, with the permutation
conventions specified in the downstream contract below.

**Checks.**

- `tr` on `M_d(A)` is a `d`-dimensional pseudocharacter: the `S_{d+1}` identity holds for the matrix
  trace, so a `cycleTerm` with the wrong cycle products or a missing fixed-point factor would break
  it.
- `tr` on `M_2(ℚ)` is not `1`-dimensional: `T(1) = 2 ≠ 1`, and the `S_2` identity
  `T(x)T(y) − T(xy) = 0` fails on matrices, so a definition dropping either condition would accept
  the wrong dimension.
- `id : ℚ → ℚ` is a `1`-dimensional pseudocharacter: `T(1) = 1` and `T(x)T(y) = T(xy)`, so a
  definition with a wrong sign in the `S_2` identity would reject it.

### 0.3 Kernels and quotient laws

**The kernel of a polynomial law.** For an `A`-polynomial law `P : M → N` between arbitrary
`A`-modules `M, N`, define `Ker(P) ⊆ M` as the set of `x` such that `P_S(b ⊗ x + m) = P_S(m)` for
every commutative `A`-algebra `S`, `b ∈ S` and `m ∈ S ⊗_A M`; it is an `A`-submodule, and `P` is
faithful if `Ker(P) = 0`. Define `PolynomialLaw.ker` (the kernel as a submodule) and faithfulness
(`Ker(P) = 0`), and prove that `P` factors through `M/K` iff `K ≤ Ker(P)`
([Chenevier](https://arxiv.org/pdf/0809.0415v2), §1.17, p. 16).
*Needs:* Mathlib `PolynomialLaw`, `Submodule`, `TensorProduct`.

**Checks.**

- The identity law is faithful: `b ⊗ x + m = m` for all `S, b, m` forces `x = 0`, so a kernel that
  tested only `S = A` or only `m = 0` could be larger.
- The zero law has kernel everything, the degenerate case, so a definition requiring the kernel to
  be proper would fail.
- On upper-triangular `2 × 2` matrices the determinant is not faithful: the strictly
  upper-triangular matrices lie in the kernel, so a definition that called every determinant
  faithful would be wrong.

**Kernels are compatible with base change.** For a commutative `A`-algebra `B`, prove that the
image of `Ker(P) ⊗ B` in `M ⊗ B` lies in `Ker(P ⊗ B)` ([Chenevier](https://arxiv.org/pdf/0809.0415v2), Lemma
1.18(iii), p. 16). *Needs:* The kernel of a polynomial law, Mathlib
`TensorProduct.AlgebraTensorModule.cancelBaseChange`.

**Laws factor through their kernel.** For an `A`-submodule `K` of `M` with quotient map
`π : M → M/K`, prove that `Ker(P)` is the largest submodule `K ⊆ M` such that `P = P̃ ∘ π` for a
polynomial law `P̃ : M/K → N`: `P` factors through `M/K` iff `K ≤ Ker(P)`
([Chenevier](https://arxiv.org/pdf/0809.0415v2), Lemma 1.18(i), p. 16). *Needs:*
DerivedModuleAlgebra §0.DP.1 / Homogeneous polynomial laws (scalar-extension law of a linear map),
Kernels are compatible with base change, Mathlib `Submodule.mkQ`.

**The induced law on M/Ker(P) is faithful.** Prove that if `P = P̃ ∘ π` with
`π : M → M/Ker(P)`, then `P̃` is faithful ([Chenevier](https://arxiv.org/pdf/0809.0415v2), Lemma 1.18(ii), p. 16).
*Needs:* Laws factor through their kernel.

### 0.4 Roby algebras and representability

DerivedModuleAlgebra §0.DP.2 supplies the homogeneous divided-power pieces, their grading,
Roby representability, arbitrary base change, the tensor map, the internal algebra of multiplicative
laws and the free-module comparison with symmetric tensors. This section constructs the determinant
coordinate ring and its generic-matrix comparison from that algebra.

**Determinant coordinate ring.** For `d ≥ 0` and any `A`-algebra `R`, define
`Z_A(R, d) = Γ^d_A(R)^ab`, the quotient by the two-sided ideal generated by all commutators for the
internal multiplication. Prove that its universal law represents determinants with commutative
coefficient algebras: `Hom_{A-alg}(Z_A(R, d), B) ≅ Det_d(B ⊗_A R, B)`. Define the coordinate ring
`Z_A(R, d)`, the abelianized internal degree-`d` divided-power algebra, and the universal
determinant on `Z_A(R, d) ⊗_A R`, and prove that the `A`-algebra maps `Z_A(R, d) → B` correspond
naturally to `B`-valued determinants and that `B ⊗_A Z_A(R, d) ≅ Z_B(B ⊗_A R, d)`
([Chenevier](https://arxiv.org/pdf/0809.0415v2), Proposition 1.6 and Example 1.7(iv), pp.9–10). *Needs:* DerivedModuleAlgebra §0.DP.2 / Roby algebra of multiplicative laws, Determinants (Chenevier).

**Checks.**

- `Z_A(R, 1) = R^ab`: in degree one the internal algebra is `R` and the abelianization is the
  ordinary one, so a coordinate ring that did not reduce to `R^ab` would be wrong.
- `Z_A(A, d) ≅ A` with universal law `a ↦ a^d`, so a coordinate ring with extra generators in this
  case would be wrong.
- `Z_A(A[t], d) ≅ A[e₁, …, e_d]`, and the universal characteristic polynomial of `t` is
  `X^d − e₁X^(d−1) + … + (−1)^d e_d`: a construction that identified fewer or more free
  coefficients, or signed them differently, would fail this computation.

**Vaccarino universal determinant theorem.** For any set `X`, prove that the determinant of the
generic `d × d` matrices induces an isomorphism `Γ^d_ℤ(ℤ{X})^ab ≅ E_X(d)`, where `E_X(d)` is the
subring of `ℤ[x_(a,i,j)]` generated by all characteristic-polynomial coefficients of words in the
generic matrices; in particular the determinant coordinate ring is torsion-free. The proof
establishes the integral generic-matrix invariant presentation, including its generator and
relation theorem and the identification with the divided-power abelianization.
On divided-power classes the comparison is the determinant of the generic evaluation.
Characteristic-zero
invariant generation does not supply the integral relations ([Chenevier](https://arxiv.org/pdf/0809.0415v2),
Theorem 1.15, pp.14–15; [Emerson–Morel](https://arxiv.org/pdf/2310.03869v2), Theorem 1.12, p.5). *Needs:* Determinant coordinate ring, DerivedModuleAlgebra §0.DP.2 / Free divided powers and symmetric tensors.

### 0.5 Characteristic coefficients and trace comparisons

**Amitsur's formula for determinants.** For a degree-`d` determinant on an associative
`A`-algebra `R`, over any commutative ring `A`, prove the following identity after every
commutative coefficient extension. For a finite ordered family `r_j`, take one Lyndon
representative `w` of each primitive cyclic word in the indexed letters `j`, write `|w|` for its
length, `r_w` for its ordered product, and `t_w = ∏_j t_j^{number of occurrences of j in w}`.
With `Λ₀ = 1` and `Λ_m = 0` for `m > d`, the mixed expansion is

```text
Λ_i(∑_j t_j r_j) = ∑_(m) (−1)^(i−∑_w m_w) ∏_w Λ_(m_w)(r_w) t_w^(m_w),
                  ∑_w m_w |w| = i.
```

Here `m` ranges over finitely supported families of nonnegative integers on these
representatives; each family occurs once. Thus the multiplicity of a given monomial is the
number of families contributing it, rather than an extra orbit-size factor. Equivalently,
`D(1−∑ t_j r_j) = ∏_w ∑_(m=0)^d (−1)^m Λ_m(r_w)t_w^m` in the formal power-series ring.
Prove cyclic independence of each coefficient, the homogeneous-degree extraction, and
compatibility with scalar extension; the coefficient of every `t^α` gives the corresponding
mixed characteristic coefficient ([Chenevier](https://arxiv.org/pdf/0809.0415v2), §1.10,
Lemma 1.12(ii), equations (1.4)–(1.5), pp.12–14). *Needs:* Characteristic polynomial and trace of a
determinant, D(1 + rr′) = D(1 + r′r).

**Checks.**

- In degree one, `Λ₁(tr+us)=tΛ₁(r)+uΛ₁(s)`: no length-two word contributes.
- In degree two, `Λ₂(tr+us)=t²Λ₂(r)+u²Λ₂(s)+tu(Λ₁(r)Λ₁(s)−Λ₁(rs))`.
  For `r=E₀₁,s=E₁₀` over `ℤ`, this is `−tu`; over `𝔽₂` it is `tu`.
- With two equal rank-two identity matrices, the same formula gives `(t+u)²`,
  whose mixed coefficient is `2`; with no inputs, only `Λ₀(0)=1` survives.

**Coefficient reconstruction from group words.** For a monoid `G`, a commutative ring `A`
and two determinants `D,E : A[G] → A` of the same degree, prove
`Determinant.eq_of_charpoly_eq`: if their characteristic polynomials agree at every `g ∈ G`,
then their entire polynomial laws agree, including mixed coefficients after scalar extension.
The proof uses Amitsur's expansion of characteristic coefficients of a sum in terms of
characteristic coefficients of words. No invertibility of a factorial is required
([Chenevier](https://arxiv.org/pdf/0809.0415v2), Lemma 1.12(ii), equations (1.4)–(1.5), and
Corollary 1.14, pp.12–15). *Needs:* Characteristic polynomial and trace of a determinant,
Amitsur's formula for determinants.
*Lean:* `Determinant.eq_of_charpoly_eq`.

**Integral Newton identities.** For `d ≥ 1`, a determinant `D` and `r ∈ R`, writing
`p_j = Tr_D(r^j)` and `Λ₀ = 1`, prove that

```text
kΛ_k(r) = ∑_(j=1)^k (−1)^(j−1) Λ_(k−j)(r) p_j      for 1 ≤ k ≤ d.
```

These identities are integral; recovering `Λ_k` by division requires `k` to be a unit
([Chenevier](https://arxiv.org/pdf/0809.0415v2), Example 1.11(ii), equation (1.3), p.12). *Needs:*
Characteristic polynomial and trace of a determinant,
Determinant coordinate ring.

**The trace of a determinant is a pseudocharacter.** For a `d`-dimensional determinant `D` on `R`,
with no hypothesis on `A`, prove that `Tr = Λ_1` is a `d`-dimensional pseudocharacter
([Chenevier](https://arxiv.org/pdf/0809.0415v2), Lemma 1.12(iii) and its proof, pp. 12–14). *Needs:*
Amitsur's formula for determinants, D(1 + rr′) = D(1 + r′r),
Pseudocharacters.
*Lean:* `Determinant.isPseudocharacter_trace`.

**A determinant is determined by its trace when d! is invertible.** Prove `Determinant.injective_trace`. If `d! ∈ A^×`, prove that
`D ↦ Tr` is injective on `d`-dimensional `A`-valued determinants on `R`. Without the invertibility
of `d!` the statement fails ([Chenevier](https://arxiv.org/pdf/0809.0415v2), Proposition 1.27 and its proof,
p. 20). *Needs:* Integral Newton identities.
*Lean:* `Determinant.injective_trace`.

**Over ℚ-algebras determinants are pseudocharacters.** Prove `Determinant.exists_unique_trace_eq`. If `A` is a `ℚ`-algebra, prove that
`D ↦ Tr` is a bijection between `d`-dimensional `A`-valued determinants on `R` and `d`-dimensional
`A`-valued pseudocharacters on `R`. The inverse is the Newton polynomial in the traces of powers.
To prove multiplicativity, construct a faithful coefficient extension on which a rational
pseudocharacter is a matrix trace (Procesi representation theorem), then descend the matrix
determinant identity; Newton coefficients alone give homogeneity but do not prove multiplicativity
([Chenevier](https://arxiv.org/pdf/0809.0415v2), Proposition 1.27 and its proof, p. 20). *Needs:*
A determinant is determined by its trace when d! is invertible,
Pseudocharacters.
*Lean:* `Determinant.exists_unique_trace_eq`.

**Determinants and pseudocharacters when (2d)! is invertible.** Prove `Determinant.exists_unique_trace_eq_of_isUnit`. If `(2d)! ∈ A^×`, or `d = 2` and
`2 ∈ A^×`, prove that `D ↦ Tr` is a bijection between `d`-dimensional `A`-valued determinants and
`d`-dimensional `A`-valued pseudocharacters on `R`. Establish the integral antisymmetrizer argument
in the symmetric-group algebra over `ℤ[1/(2d)!]`, with its splitness and torsion-free quotient, to
transfer the rational identity; for degree two use the corresponding `S₄` idempotent calculation
over `ℤ[1/2]` ([Chenevier](https://arxiv.org/pdf/0809.0415v2), Proposition 1.29 and proof, pp.20–22). *Needs:*
A determinant is determined by its trace when d! is invertible,
Pseudocharacters, Two-dimensional determinants on a group.
*Lean:* `Determinant.exists_unique_trace_eq_of_isUnit`.

**The kernel of a determinant.** For a `d`-dimensional determinant `D` on `R`, prove that
`r ∈ Ker(D)` iff `D_S(1 + r r′) = 1` for every commutative `A`-algebra `S` and `r′ ∈ S ⊗ R`, iff
`D_S(1 + r′ r) = 1` for all such `S`, `r′` ([Chenevier](https://arxiv.org/pdf/0809.0415v2), Lemma 1.19(i),
p. 17). *Needs:* The kernel of a polynomial law, D(1 + rr′) = D(1 + r′r).

**The kernel of a determinant is a two-sided ideal.** For a `d`-dimensional determinant `D`, prove
that `Ker(D)` is a two-sided ideal of `R`, proper if `d > 0` and `R ≠ 0`, and that it is the largest
two-sided ideal `K` such that `D` factors through a determinant of `R/K`. Define `Ker(D)` as a
two-sided ideal whose membership agrees with the submodule kernel `PolynomialLaw.ker` of the
underlying law, and prove that it is proper for `d > 0` and `R` nontrivial; the kernel clause of semisimple reconstruction
in `Suggested.lean` is written as membership in `PolynomialLaw.ker` ([Chenevier](https://arxiv.org/pdf/0809.0415v2), Lemma 1.19(ii), p. 17). *Needs:*
The kernel of a determinant, Laws factor through their kernel, Mathlib
`TwoSidedIdeal`.

**Checks.**

- For `d > 0`, `det` on `M_d(A)` is faithful, while the `d = 0` matrix algebra is the zero ring:
  the kernel computes to `0` in positive dimension, so a kernel that contained a nonzero matrix
  would be wrong, and the `d = 0` case is why properness needs `d > 0` and `R ≠ 0`.
- In dimension `0` the kernel is everything: the constant law `1` satisfies `D(1 + rr′) = 1` for
  all `r`, so a definition that made the kernel proper in every dimension would fail.
- On upper-triangular matrices the kernel is the strictly upper-triangular ideal: a definition
  returning only `0` would miss the nilpotent off-diagonal part that `det` cannot see.

**The characteristic polynomial law χ : R → R.** For a determinant `D`, define the degree-`d`
polynomial law `χ : R → R`,

```text
χ(r) = r^d − Λ_1(r) r^{d−1} + Λ_2(r) r^{d−2} − ⋯ + (−1)^d Λ_d(r),
```

and its coefficients `χ_α(r_1, …, r_n) ∈ R` by `χ(t_1r_1 + ⋯ + t_nr_n) = Σ_α χ_α(r_1, …, r_n) t^α`;
the coefficients are extracted through the monomial basis of `A[t_1, …, t_n]` and
`(ι →₀ A) ⊗ R ≅ ι →₀ R`, since `R` may be noncommutative. Define the law `χ` and its
coefficients `χ_α`, and prove that `χ` is homogeneous of degree `d`
([Chenevier](https://arxiv.org/pdf/0809.0415v2), §1.10, p. 12). *Needs:*
Characteristic polynomial and trace of a determinant, Mathlib
`MvPolynomial.basisMonomials`, `TensorProduct.finsuppScalarLeft`, `LinearEquiv.rTensor`.

**Checks.**

- For `det` on `M_d(A)`, `χ` is the zero law (Cayley–Hamilton): evaluating `χ` on every matrix
  after every scalar extension gives `0`, so a law with a wrong sign pattern would be nonzero on
  a diagonal matrix.
- In dimension one `χ(r) = r − D(r)`: the degree-one case computes to the difference with the
  algebra map `D`, so a definition omitting the `(−1)^d Λ_d` term would give `r`.
- `χ(1) = (1 − 1)^d = 0` for `d ≥ 1`: the coefficients `Λ_i(1) = C(d, i)` collapse the sum, so a
  definition in which `Λ_i(1)` were not binomial coefficients would fail this value.

**The Cayley–Hamilton identity for determinants.** For a determinant `D` on `R`, elements
`r, r_1, …, r_n ∈ R` and a multi-index `α`, with no hypothesis on `A`, prove
`D(1 + χ_α(r_1, …, r_n)·r) = 1` ([Chenevier](https://arxiv.org/pdf/0809.0415v2), Lemma 1.12(iv) and the
paragraph on Vaccarino's theorem, pp. 12–15). *Needs:*
The characteristic polynomial law χ : R → R,
Amitsur's formula for determinants,
Vaccarino universal determinant theorem.

**A determinant descends to the subring of its coefficients.** Let `D` be an `A`-valued
determinant on a monoid `G` and write `C ⊆ A` for the smallest subring containing all `Λ_i(g)`,
`g ∈ G`. Prove that there is exactly one same-degree `C`-valued determinant whose coefficient
extension is `D`; consequently each polynomial `D(Σ t_j g_j)` has its coefficients in `C`
([Chenevier](https://arxiv.org/pdf/0809.0415v2), Corollary 1.14, p. 14). *Needs:*
Amitsur's formula for determinants, Mathlib `Subring.closure`, `MonoidAlgebra.of`.

**Continuous determinants.** For a group `G` and a commutative ring `A`, each with a topology, a determinant
`D` on `A[G]` is continuous if every coefficient map of `g ↦ χ_D(g,X)` is continuous.
Over a topological ring `A`, this is equivalent to continuity of every `Λ_i`. If `G` is
also a topological group, Amitsur's formula makes these conditions equivalent to continuity
of all mixed maps `D^{[α]} : G^d → A` in Chenevier's definition. Define
`Determinant.IsContinuous` using the coefficients of `χ_D`; prove that a continuous determinant is determined on a dense subgroup and that, for profinite `G` and discrete
`A`, continuity means that the kernel is open ([Chenevier](https://arxiv.org/pdf/0809.0415v2), §2.30, p. 37). *Needs:*
Amitsur's formula for determinants, Mathlib `Continuous`, `MonoidAlgebra.of`.

**Checks.**

- Compactness cannot be discarded when concluding finite image: discrete `ℤ` is noncompact,
  and the continuous character `n ↦ 2ⁿ` into discrete `ℚˣ` has infinite image since `2^n ≠ 1`
  for every positive integer `n`.

- On a discrete group every determinant is continuous: each polynomial coefficient is a function on a discrete
  space, so a definition that demanded more than continuity of the coefficients would reject some
  of these.
- Over a topological ring, `det ∘ ρ` is continuous for continuous `ρ`: its coefficients are the polynomial functions
  `Λ_i(ρ(g))` of the matrix entries, so a definition under which the matrix determinant of a
  continuous representation failed would be wrong.
- Over a topological ring, a determinant of dimension one coming from a discontinuous
  character is not continuous, the non-example: the constant coefficient of `χ(g,t) = t − D(g)`
  is `−D(g)`, so a definition that only tested `Λ_0 = 1` would accept it. The topological-ring
  hypothesis is needed: on `ℤ` with the upper-set topology (negation is not continuous) and
  `ℤ/2` with only the nonidentity point open, the sign character is discontinuous but its
  negative is continuous, so that one-dimensional determinant is continuous.
- The topological-group hypothesis is necessary for the mixed-map equivalence. Give
  `GL₂(ℚ)` the topology induced by `(trace,det)` into discrete `ℚ²`. The tautological
  determinant has continuous characteristic coefficients. The matrices
  `g=diag(2,1)` and `g′=diag(1,2)` have the same neighbourhoods, but with `h=g` the
  coefficient of `st` in `det(sg+th)` is `4`, while in `det(sg′+th)` it is `5`.
  Thus this mixed map is discontinuous. Multiplication is also discontinuous, since
  `gh=diag(4,1)` and `g′h=diag(2,2)` have different traces.

**Continuous determinants are determined on a dense subgroup.** If `A` is Hausdorff (`T2`) and
`H ≤ G` is dense, prove that two continuous determinants on `G` with the same characteristic
polynomials on `H` are equal ([Chenevier](https://arxiv.org/pdf/0809.0415v2), Example 2.31, p. 38). *Needs:*
Continuous determinants, Mathlib `Continuous.ext_on`.

**Continuity is openness of the kernel.** Let `G` be a compact Hausdorff totally disconnected topological group and let `A` be discrete. Prove that a determinant `D` on `A[G]` is continuous iff its kernel
contains `J(H) = ker(A[G] → A[G/H])` for some open normal `H ≤ G`, that is `g − gh ∈ Ker(D)` for
all `g ∈ G`, `h ∈ H`; then `G → (A[G]/Ker(D))^×` factors through the finite group `G/H`
([Chenevier](https://arxiv.org/pdf/0809.0415v2), Lemma 2.33, p. 38). *Needs:*
Continuous determinants,
The kernel of a determinant is a two-sided ideal, Mathlib `Subgroup.Normal`,
`IsOpen`.

### 0.6 Duals, projective modules and reduced norms

**Contragredient determinant.** For a group `G` and a determinant `D` on `A[G]`, define `D∨` by
precomposition with the `A`-linear anti-involution `ι(g) = g⁻¹`. Since coefficients commute,
reversal of products still gives a multiplicative polynomial law of the same degree, and it agrees
with the determinant of the dual representation. Define `D∨`, the determinant pulled back by
group-algebra inversion; prove `(D∨)∨ = D`, that for `g ∈ G`,
`P_D∨,g(X) = X^d P_D,g(X⁻¹)/P_D,g(0)`, and that the determinant of the transpose-inverse matrix
representation is `D∨` ([Quast](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf), §3.4, p.17; Chenevier §1.5, p.9, for the definition of a determinant on `A[G]`). *Needs:*
The determinant of a matrix representation. The identity `χ_{D∨}(g) = χ_D(g⁻¹)` pins inversion
on every group element, so the dual is read as evaluation of `D` at `g⁻¹`; the reciprocal
characteristic-polynomial identity of Layer 3a is stated in that form and follows from this
identity and the formula for `P_D∨,g`.

**Checks.**

- The dual of a unit character `χ` is `χ⁻¹`: the degree-one computation along `g ↦ g⁻¹`, so a
  dual defined by precomposition with the identity instead of inversion would return `χ`.
- The trivial `d`-dimensional representation is fixed by duality: all coefficients are binomial
  constants, the degenerate case that any sign-twisted dual would fail.
- For a diagonal unit pair `(a, b)` the dual characteristic polynomial is
  `X² − (a⁻¹ + b⁻¹)X + (ab)⁻¹`: the inverse-root polynomial, so a dual that reversed coefficients
  without dividing by `P(0)` would give a non-monic answer.

**Determinant of a finite projective representation.** Let `V` be a finite projective `A`-module of
constant rank `d ≥ 0`, stated with Mathlib's `Module.rankAtStalk (R := A) V = d` (no separate
constant-rank predicate is introduced), and `ρ : R → End_A(V)` an `A`-algebra map. Since `∧^d V` is an invertible
`A`-module, `∧^d ρ(r)` is multiplication by a unique scalar, and doing this after every scalar
extension defines a degree-`d` multiplicative polynomial law `D_ρ : R → A`. Prove the top exterior
power is invertible at constant rank, identify its scalar endomorphisms, and glue matrix laws over
local trivializations; these localization and descent steps are required even though the
free-module determinant is available. Define `D_ρ` as the determinant law of `ρ` on a finite
projective constant-rank module; prove that the induced top exterior-power endomorphism is scalar
multiplication by `D_ρ(r)`, that for a finite basis this law equals `det` of the corresponding
matrix representation, and that scalar extension of `V` and `ρ` commutes with `D_ρ`
([Chenevier](https://arxiv.org/pdf/0809.0415v2), §1.5 matrix example and its local finite-projective extension,
p.9). *Needs:* PadicMeasuresIwasawaAlgebras §5.1 `projectiveDeterminant_constantRank`
and `projectiveDeterminant_baseChange`, Mathlib `exteriorPower.map`,
The determinant of a matrix representation.

**Checks.**

- On an invertible rank-one module, the scalar `a` has determinant `a`: `∧^1 V = V` and the
  endomorphism is multiplication by `a`, independent of a choice of trivialisation.
- The identity endomorphism has determinant `1`: the normalisation that a law failing
  multiplicativity at `1` would miss.
- For `V = A²` with a specified basis, the determinant equals Mathlib's `Matrix.det`, including the
  off-diagonal sign: the computed value is `ad − bc`, so a construction that lost the sign of the
  transposition in `∧²` would give `ad + bc`.

**Azumaya reduced-norm determinant.** For an Azumaya `A`-algebra `R` of constant rank `d²`
(`Module.rankAtStalk (R := A) R = d * d`), with `d > 0`, its
reduced norm `Nrd_R : R → A` is the unique degree-`d` determinant law that becomes `Matrix.det`
under every faithfully flat matrix splitting, and its representing coordinate ring `Γ^d_A(R)^ab`
is canonically `A`. Define the law after a faithfully flat matrix splitting and descend it; two
splittings differ by an automorphism of a matrix algebra, which preserves the determinant. Define
the degree-`d` reduced-norm determinant; prove that under a matrix splitting it becomes
`Matrix.det` and that every degree-`d` determinant on `R` equals the reduced norm
([Chenevier](https://arxiv.org/pdf/0809.0415v2), Example 1.7(ii), p.10 and Exercise 2.5, p.26;
[Grothendieck](http://www.numdam.org/item/SB_1964-1966__9__199_0.pdf), Théorème 5.1, p.210, for étale matrix splitting;
Théorème 5.10 and §5.13, pp.212–213, for automorphism invariance and descent of the reduced norm). *Needs:* SchemeAndStackFoundations §2.22 `IsAzumaya.exists_etale_matrix_splitting`,
Determinant coordinate ring,
The determinant of a matrix representation.

The supplier `IsAzumaya.exists_etale_matrix_splitting` from SchemeAndStackFoundations §2.22
states the splitting used here: for
`IsAzumaya A R`, positive `d`, and constant rank `d²`, there is a faithfully flat étale
commutative `A`-algebra `B` with `B⊗R ≃ M_d(B)` (Grothendieck, *Le groupe de Brauer I*,
Theorem 5.1(ii)–(iii), p.210). The same supplier takes the product of finitely many jointly
surjective affine étale splitting charts and proves faithful flatness and splitting over that product.
Its Checks are the split matrix algebra, `ℂ⊗_ℝ ℍ ≃ M₂(ℂ)`
with `Algebra.Etale ℝ ℂ` and `Module.FaithfullyFlat ℝ ℂ`, and the absence of an
`ℝ`-algebra isomorphism `ℍ ≃ M₂(ℝ)`.
*Lean:* `Determinant.existsUnique_of_isAzumaya`.

**Checks.**

- For `R = M₂(A)` the norm is `ad − bc`: the split case computes the ordinary determinant, so a
  descent that picked up a unit twist on the trivial splitting would be detected.
- For `R = A`, `d = 1`, the norm is the identity: the degenerate rank-one case, which a definition
  of degree `d²` instead of `d` would fail.
- For the Hamilton quaternion algebra over `ℝ`, `Nrd(a + bi + cj + dk) = a² + b² + c² + d²`: a
  nonsplit example whose value is computed after the splitting over `ℂ`, so a construction that
  only existed for split algebras would not produce it.

**Checks for duality and twisting.** The identity group element has dual characteristic
polynomial `(X−1)^d`, including `d=0`; together with the inverse-character and two-dimensional
reciprocal computations this tests the dual, read as evaluation at `g⁻¹`. For the twist by a
unit character `θ`, the trivial character leaves the law fixed, evaluation at `g` is multiplied by
`θ(g)^d`, and the rank-one law of `χ` becomes the rank-one law of `θχ`; the last two distinguish
character inversion and the degree exponent. The definition and locators are those in §0.6.

### 0.7 Connected reductive invariant evaluations

**Invariant coordinate algebras under conjugation.** The input is a commutative Hopf
`O`-algebra, an object of Mathlib's `CommHopfAlgCat O`. Its multiplication, unit, coproduct, counit and antipode obey the
bialgebra compatibility, coassociativity, both counit identities and both antipode identities of
`HopfAlgebra`. The represented points and their naturality in coefficient algebras are supplied
by `TauCeti.HopfAlgebra.points` and its points functor. For a commutative Hopf algebra `C`, the
tensor coordinates in arity `n` are the left-associated tensor power, starting at `O`, and tensor
evaluation is its algebra map determined by evaluation on each factor. The invariant coordinate
algebra `C_n` is the subalgebra of functions unchanged by simultaneous
conjugation over **every** commutative `O`-algebra `S`. Thus it is the scheme-invariant algebra,
including at nonreduced points. The reindexing and multiplication pullbacks are the coordinate
pullbacks specified by the two evaluation formulas of *Compatible invariant-coordinate
evaluation*. This construction takes invariants under the whole
group; the reductive applications here use connected groups. The identity-component invariant
construction for disconnected groups has a different input.
([Quast](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf),
Definition 3.1, pp.10–11; [DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Definition 4.1,
p.22.) *Needs:* Mathlib `CommHopfAlgCat`, `HopfAlgebra`; Tau Ceti's Hopf points functor.

**Checks.**

- The tensor-coordinate terms in arities zero, one and two are `O`, `O ⊗ C`, and
  `(O ⊗ C) ⊗ C`. The zero-arity evaluation is the coefficient map, and evaluation of
  `a ⊗ b` is the product of the preceding evaluation with the last point evaluated at `b`.
- For `C = O[GL₁]`, every tensor coordinate is conjugation invariant. For `GL₂` over nonzero `O`,
  trace and determinant are invariant but the upper-left matrix coordinate is not.
- `mergeLast(g₀,g₁) = (g₀g₁)` and `mergeLast(g₀,g₁,g₂) = (g₀,g₁g₂)`.
  Reindexing repeats or permutes entries, while the multiplication pullback evaluates on these
  ordered products. For zero-arity coordinates, every tuple evaluates a scalar to that scalar.

**Rational cohomology of a flat affine group scheme.** Let `A` be commutative, `H` a commutative
Hopf `A`-algebra flat over `A`, and `M` any right `H`-comodule, without a finiteness or
`A`-flatness hypothesis on `M`. Use the comodule foundations of ReductiveGroups layer 1 and
the native Tau Ceti cofree adjunction. Establish enough injectives by embedding the underlying
module into an injective `A`-module `I` and using `M → M ⊗ H → I ⊗ H`; flatness of `H`
makes the second map injective, and the cofree adjunction makes `I ⊗ H` injective as a comodule
(Jantzen I.3.9, p.43). Construct the augmented cofree resolution and its comparison with an
injective resolution. Its underlying module complex is split exact by the counit, and its
terms are acyclic for scheme invariants. The resulting invariants complex has degree-`n` term
`M ⊗ H^⊗n`, associated to the left. The cofaces insert the coefficient coaction at the beginning,
the coproduct at each interior position, and the unit at the end. The differential is their
alternating sum, and the resulting cochain complex is the Hochschild complex. Define the
rational cohomology `Hⁿ(H, M)` as its homology. For flat `H` this computes derived
scheme invariants (Jantzen I.4.2, I.4.14–4.16, pp.50, 55–56).
Prove that degree zero is `ker(ρ − (m ↦ m ⊗ 1))`, and compute the regular comodule `H` by its
counit contraction: it is acyclic, with `H⁰(H, H) = A` (Jantzen I.4.15). More generally, the
cofree comodule `N ⊗ H` has `H⁰(H, N ⊗ H) ≅ N` and zero positive cohomology for every
`A`-module `N`; this acyclicity does not require `N` to be injective (Jantzen I.4.7(a), p.52).
*Needs:* ReductiveGroups layer 1 (comodules, morphisms and regular representation);
Tau Ceti `Comodule.cofree`, `Comodule.Hom.cofreeUnit`, `Comodule.Hom.cofreeEquiv` and
the abelian comodule category for flat `H`; Mathlib module injectives, `CochainComplex` and
module homology.

Prove the natural chain isomorphism to the coefficient-last tensor convention. Its degree-`n`
map is the tensor permutation `τ_n(m ⊗ h₁ ⊗ ⋯ ⊗ h_n) = h₁ ⊗ ⋯ ⊗ h_n ⊗ m`, with the
associators understood, and the target cofaces are `τ_(n+1) δ_i τ_n⁻¹`. In particular the
coaction coface sends `h₁ ⊗ ⋯ ⊗ h_n ⊗ m` to
`Σ m₁ ⊗ h₁ ⊗ ⋯ ⊗ h_n ⊗ m₀` when `ρ(m) = Σ m₀ ⊗ m₁`; the unit coface appends `1`
before `m`. The Hopf factors and the coface numbering retain their order, so no sign is
introduced. Require compatibility with coefficient maps, the derived-invariants comparison
and connecting maps (Jantzen I.4.14–4.16, pp.55–56, transported by tensor symmetry).

A comodule morphism `f : M → N` induces the map of complexes acting by `f` on the first
tensor factor, in every degree.
Its degree-zero, one-Hopf-factor and two-Hopf-factor Checks send `m`, `m⊗h` and
`(m⊗h)⊗k` to `f(m)`, `f(m)⊗h` and `(f(m)⊗h)⊗k`.
Prove that its degree-zero map is `f` and that it is functorial (identities and composites); the
map on cohomology is the induced Mathlib homology map. For equivariant maps
`M → N → P` which are injective, exact and surjective, respectively, construct the connecting map
and prove exactness at `H^i(P)` and `H^(i+1)(M)`
(Jantzen I.4.2, I.4.16, pp.50, 55–56). The invariant product is the cochain product
`H^i(M) × H⁰(N) → H^i(M⊗N)`; prove that a right invariant
factor commutes with the boundary, with sign `+`; its tensor factor is flat so the
tensored coefficient sequence stays exact. The diagonal specializations used here are
specified in §6.4, following DKSW Lemma 4.12 and the proof of Corollary 4.13, pp.24–25.

**Checks.**

- Over `ℚ`, with trivial Hopf algebra and coefficient module `ℚ²`, the terms in
  degrees `0,1,2` each have rank two.
  The three coface values are `δ₀⁰(m)=ρ(m)`, `δ₁⁰(m)=m⊗1`, and
  `δ₁¹(m⊗h)=assoc⁻¹(m⊗Δh)`.
  The coefficient-last comparisons in these degrees are respectively `m ↦ m`,
  `m⊗h ↦ h⊗m` and `(m⊗h)⊗k ↦ (h⊗k)⊗m`.
  For `H = ℤ[t,t⁻¹]` and the weight-one line `M = ℤ`, the transported differential is
  `τ₁ d⁰(1) = (t − 1) ⊗ 1`, with the Hopf factor first.
- The computed two-term differential is `d⁰(m)=ρ(m)−m⊗1`; the next is
  `d¹(m⊗h)=ρ(m)⊗h−assoc⁻¹(m⊗Δh)+(m⊗h)⊗1`. Their composite is zero.
  For the trivial group over `ℤ`, the complex sends `3` to zero in degree zero,
  `3⊗1` to `(3⊗1)⊗1` in degree one, and `(3⊗1)⊗1` to zero in degree two.
- For the regular comodule, `H⁰(H,H)=A`, `H¹(H,H)=0`, and `H²(H,H)=0`.
  For the trivial group over `ℤ`, the module `ℤ` is nevertheless not injective:
  no `ℤ`-linear map has `f(2)=1`.
  The nonflat coefficient module `ℤ/2` is also acyclic for the trivial group, with
  `H⁰ = ℤ/2`; neither the cofree comparison nor its contraction requires flat coefficients.

**Algebraic induction.** For flat commutative Hopf `A`-algebras `H,K`, a bialgebra map
`f:H→K`, and a right `K`-comodule `M`, the induced module `Ind_f M` is the cotensor equalizer
inside `M⊗H` of `ρ_M⊗1` and `(1⊗f⊗1)(1⊗Δ_H)`, with the displayed associator.
Its `H`-comodule structure restricts `1⊗Δ_H` along the inclusion into `M⊗H`.
Frobenius reciprocity is the natural bijection
`Hom_H(N, Ind_f M) ≅ Hom_K(Corestrict_f N, M)` for every right `H`-comodule `N`.
Its forward map is evaluation at the identity using the counit, and its inverse sends
`u` to `(u ⊗ 1)ρ_N`. Construct this arbitrary-base induction on the native comodule and
corestriction carriers; flatness of `H` makes its coaction restrict to the equalizer.
The cotensor convention is `F(hg)=hF(g)` with right translation on `F`.
Prove that `F ↦ (g ↦ F(g⁻¹))`, induced on tensors by `1 ⊗ S_H`, identifies it with
Jantzen's `f(gh)=h⁻¹f(g)` with left translation. This involution intertwines the group
actions, fixes counit evaluation and hence identifies the reciprocity bijections, naturally
in the coefficient comodule and over every commutative `A`-algebra
(Jantzen I.3.3–3.7, pp.37–41). The integral `GL₂` applications in §6.4 use this comparison.
*Needs:* ReductiveGroups layer 1 (comodule morphisms and the representation–comodule
dictionary); Tau Ceti `Comodule.Corestrict`, the Hopf counit and antipode, and tensor equalizers.

**Checks.**

- For constant group schemes over `ℤ`, `Ind₁^{C₂}(ℤ)=Map(C₂,ℤ)` has rank two;
  the nonidentity element swaps the delta-function basis. The nonzero equivariant map
  from the trivial module taking `1` to the constant function `1` corresponds under
  reciprocity to `id_ℤ`, since counit evaluation gives `1` at the identity.
- `Ind_{C₂}^{C₂}(sign)` consists of `F` with `F(h)=hF(1)`; evaluation at the identity
  identifies it with `ℤ`, and right translation by the nonidentity acts as `−1`.
- For `C₂=⟨(12)⟩⊂S₃` with trivial coefficients, `Ind_{C₂}^{S₃}(ℤ)` has rank three,
  with the delta basis of right cosets `C₂g`. Right translation takes the delta function
  of `C₂g` to that of `C₂gk⁻¹`; a three-cycle permutes the three basis vectors cyclically.
  Inversion sends the basis function of `C₂g` to that of `g⁻¹C₂` in the left-translation
  convention; for `g=(123)` this is the left coset `(132)C₂`.

**Compatible invariant-coordinate evaluation.** For the invariant coordinate algebras
`Cₙ = O[Hⁿ]^H`, the group `H(A)`, and a commutative `O`-algebra `A`, a compatible evaluation is a
family `Eₙ : Cₙ → Map(H(A)ⁿ, A)` of `O`-algebra maps satisfying `Eₘ(C(ζ)f)(h) = Eₙ(f)(h ∘ ζ)` for
every coordinate reindexing `ζ`, and `Eₙ₊₂(C(mul)f)(h) = Eₙ₊₁(f)(mergeLast(h))`. Evaluation at the
actual scheme points has these equations; the coordinate carrier is the family `C_n` of
Invariant coordinate algebras under conjugation and evaluation is at its scheme
points. Define compatible evaluations through a group homomorphism into the actual Hopf-algebra
points, with evaluation given by restriction of tensor evaluation, and regular matrix invariance as the
predicate that, over algebraically closed `k`, each evaluated `GL_d` invariant is a polynomial in
entries and inverse determinants, invariant under simultaneous conjugation; prove that evaluating a
coordinate pullback is evaluating on the reindexed tuple and that evaluating the final-product
pullback is evaluating on the tuple with its last two entries multiplied ([Quast](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf), Definition 3.1 and the representation
evaluation immediately following it, pp.11–12; [BHKT](https://arxiv.org/pdf/1609.03491), Definition 4.1 and Lemma 4.3,
pp.13–14). *Needs:* Invariant coordinate algebras under conjugation, Mathlib
`MvPolynomial`.

**Checks.**

- Reindexing uses precomposition. For the three-cycle `σ=(0 1 2)`, the tuple `(2,3,5)`
  becomes `(3,5,2)`, whereas precomposition with `σ⁻¹` gives `(5,2,3)`.
  A transposition alone cannot distinguish these conventions.
- The final product is ordered. Over `ℚ`, take `x=diag(2,1)`,
  `g=[[1,1],[0,1]]`, `h=[[1,0],[1,1]]`. For the two-coordinate invariant
  `f(x,y)=tr(xy)`, `f(x,gh)=5` and `f(x,hg)=4`.
  All three matrices are invertible over `ℚ`. A one-coordinate class function cannot
  distinguish `gh` from `hg`, since these elements are conjugate.
- A family of algebra maps violating a reindexing equation is not a compatible evaluation, the
  non-example: a definition that only asked for algebra maps would accept it.

**Connected reductive pseudocharacter.** Let `O` be commutative and let `H` be an affine
`O`-group scheme with its commutative Hopf algebra. The compatible-evaluation construction
is defined for this general input; the applications to reductive pseudocharacters use
connected reductive `H`. An `H`-pseudocharacter of `Γ` with values in a
commutative `O`-algebra `A` is a family of `O`-algebra maps `Θ_m : O[H^m]^H → Map(Γ^m, A)`,
`m ≥ 0` (arity zero is the coefficient map), compatible with every reindexing of coordinates and with multiplication of the final two
coordinates; conjugation is by `H`. For the construction from
`ρ : Γ → H(A)`, supply a compatible invariant-coordinate evaluation `E`; an arbitrary family of
algebra homomorphisms is insufficient. Define the `H`-pseudocharacters as the families `Θ_m` with
reindexing and multiplication equations, and the pseudocharacter `Θ_ρ` of `ρ : Γ → H(A)` with
compatible evaluation `E`, `Θρ,ₙ(f)(γ) = Eₙ(f)(ρ ∘ γ)`,
whose axioms follow from the equations and the homomorphism law; prove extensionality (pointwise
equality of every `Θ_m`), that coefficient maps postcompose and group maps precompose, and the
evaluation formula `Θρ,ₙ(f)(γ) = Eₙ(f)(ρ ∘ γ)` ([Quast](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf), Definition 3.1, pp.10–11). *Needs:*
[ReductiveGroups, layer 9][reductivegroups9],
Compatible invariant-coordinate evaluation.

**Checks.**

- For `H = G_m`, an `H`-pseudocharacter is a unit character `Γ → Aˣ`: the invariant algebras are
  the Laurent polynomial rings, so a definition that produced more data than a character in the
  commutative case would be wrong.
- With compatible `E`, the trivial representation evaluates `f` at the identity tuple: the
  degenerate case, computed as `Eₙ(f)(1, …, 1)`, which a construction that evaluated at `ρ` without
  `E` could not even state.
- Over algebraically closed `k` with regular simultaneous-conjugation-invariant `GL₂` evaluation
  `E`, the nontrivial upper-unipotent representation of `ℤ` and the trivial rank-two representation
  have equal pseudocharacters: a definition under which the pseudocharacter separated these
  non-semisimple representations would not be conjugation-invariant.

**Continuous reductive pseudocharacter.** For topological `Γ` and `A`, an `H`-pseudocharacter is
continuous if for every `m ≥ 0` and every invariant `f ∈ O[H^m]^H`, the function
`Θ_m(f) : Γ^m → A` is continuous. Coefficient change at fixed `O` and base change of the group
scheme `O → O′` are distinct operations. The representation constructor uses the compatible
evaluation `E`, and explicitly assumes continuity of each map `Eₙ(f) : H(A)ⁿ → A` for the supplied topology.
Define continuity as continuity of every evaluation on invariant coordinates; prove that a
continuous `ρ` induces a continuous pseudocharacter when `E` is compatible and every invariant
evaluation `Eₙ(f)` is continuous, and that for Hausdorff `A`, continuous pseudocharacters agreeing
on a dense subgroup are equal ([Quast](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf), Definition 3.1 and
Lemma 3.2, pp.11–12). *Needs:* Connected reductive pseudocharacter.

**Checks.**

- Every pseudocharacter on a discrete `Γ` is continuous: each `Θ_m(f)` is a function on a discrete
  space, so a definition requiring continuity of something other than these functions would reject
  some.
- For `H = G_m` the condition is continuity of the associated unit character: the degree-one
  computation, which a definition testing continuity only at `m = 2` would fail to reduce to.
- A finite-quotient representation into a discrete finite coefficient ring gives a continuous
  pseudocharacter on a profinite group: `Θ_m(f)` factors through a finite quotient, so a definition
  that demanded continuity for a finer topology on `A` would fail this.

**Kernel of a reductive pseudocharacter.** For an `H`-pseudocharacter `Θ` define
`ker Θ = {δ ∈ Γ : Θ_m(f)(γ₁, …, γ_mδ) = Θ_m(f)(γ₁, …, γ_m) for all m, f and tuples}` and prove that
it is a normal subgroup. For the actual point representation, `ker ρ ⊆ ker Θ_ρ`. When the
evaluation `E` carries an additional point map `p` into `H(A)`, the inclusion concerns the
composite `p ∘ ρ`; an arbitrary such `p` need not be faithful. Define `ker Θ` as the normal
subgroup defined by all invariant evaluations; prove that membership is invariance under right
multiplication in any coordinate, and that for normal `Δ ⊆ ker Θ` there is a unique descended
pseudocharacter on `Γ/Δ`
([Quast](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf), Definition 3.10 and Lemmas 3.11–3.12, p.16). *Needs:*
Connected reductive pseudocharacter.

**Checks.**

- For the trivial representation and compatible `E`, `ker Θρ = Γ`: every evaluation is constant,
  the degenerate case that a kernel defined by `Θ_m(f)(δ, …, δ) = Θ_m(f)(1, …, 1)` alone would also
  give, but a kernel wrongly required to be contained in `ker ρ` would fail.
- For `H = G_m` the kernel is the kernel of the unit character: the degree-one computation, which a
  definition quantifying only over `m = 1` with the wrong coordinate would miss.
- Over an algebraically closed characteristic-zero field with regular `GL₂` invariant evaluation,
  the upper-unipotent representation of `ℤ` is faithful but its pseudocharacter kernel is all of
  `ℤ`: the inclusion `ker ρ ⊆ ker Θ_ρ` is strict, so a definition asserting equality without complete
  reducibility would be false.

**Determinants and GLn excursion pseudocharacters.** For every commutative ring `A`, group `Γ` and
`d ≥ 1`, prove that Chenevier determinants on `A[Γ]` are naturally in bijection with `GL_d`-valued
Lafforgue pseudocharacters. This comparison needs no invertibility of `d!` and is distinct from
comparison with the trace-only pseudocharacter ([Emerson–Morel](https://arxiv.org/pdf/2310.03869v2), Theorem 4.1 and proof,
pp.13–15). *Needs:* Connected reductive pseudocharacter,
Vaccarino universal determinant theorem.

The comparison is stated for positive `d` and
`C=TauCeti.GeneralLinear.coordinateHopfAlgebra A d`, with its normalization fixed against
`c_{d,i}`, the actual coefficient of `X^i` in the characteristic polynomial of the generic matrix.

**Checks.**

- `c_{1,1}=1`, `c_{2,2}=1`, and `c_{2,3}=0`.
- In dimension one the determinant value is minus evaluation of `c_{1,0}`.
- In dimension two the trace is minus evaluation of `c_{2,1}` and the determinant
  is evaluation of `c_{2,0}`. These give `X−a` and `X²−tX+d`, including in
  characteristic two, without a factorial-invertibility hypothesis.

**Checks for coefficient and cycle interfaces.** These specialize the definitions in
Chenevier §§1.5, 1.9, 1.17–1.19 and the divided-power functor of §1.3.

| Interface | Computed Checks |
|---|---|
| `Tr` | The degree-one identity sends `a` to `a`; the trace of `[[2,3],[4,5]]` is `7`; every degree-zero trace is zero. |
| One-dimensional determinants as algebra maps | The inverse at `f` evaluates to `f(r)`; the identity over `ℤ` takes `2` to `2`; the identity over `𝔽₂` has polynomial `X−1` at `1`. The inverse is this evaluation at every input. |
| `cycleProduct` | The identity permutation returns the chosen entry; the transposition starting at `0` gives `x₀x₁`; starting at `1` gives `x₁x₀`. |
| `cycleTerm` | The empty tuple gives `1`; the identity on two entries gives `T(x₀)T(x₁)`; the transposition gives `T(x₀x₁)`, with one cycle factor. |
| Two-dimensional determinants on a group | The unit-valued character takes `1` to `1`; its trace takes `1` to `2`; its trace at `g` is the determinant trace. Both components are fixed on all group elements. |
| `Ker(D)` as a two-sided ideal (membership in `PolynomialLaw.ker`) | A degree-zero law has full kernel; the determinant on a matrix algebra has zero kernel; on upper triangular matrices its kernel consists of the strictly upper triangular matrices. |
| The coefficients `χ_α` of the law `χ` | Matrix determinants have zero coefficients of the CH law; evaluation at `0` on `ℤ[X]` gives coefficient `X` in multidegree one of the input `tX`, and zero in multidegree two. |
| The coefficient subring `C` | Over `ℤ` it is all of `ℤ`; every group characteristic coefficient belongs to it; a degree-zero law generates just the prime subring. |

**Checks for restriction.** Restriction of an `H`-pseudocharacter along a group map is
precomposition on every tuple. Restriction by the identity fixes `Θ`; restriction by the
trivial homomorphism evaluates every coordinate at the group identity; two successive
restrictions equal restriction by the composite in the same order. All three are computed with
the group and coefficient ring unchanged.
The source is Quast, Definition 3.1, pp.10–11.

**Canonical universal maps.** The quotient map `Γ^d_A(R) → Z_A(R, d)` is surjective, with kernel
exactly the two-sided ideal generated by internal commutators. This specifies the
abelianization, including its quotient map.
The representing equivalence is specified on every scalar-extended
input: contract the law corresponding to `φ` composed with the quotient map along the coefficient
map. The universal determinant is the case `φ=id`; the equivalence is natural in coefficient
change; the base-change isomorphism is specified on the image of every
homogeneous divided-power element. These are the maps of Chenevier, Proposition 1.6 and
Example 1.7(iv), pp.9–10.
The homogeneous-piece scalar extension, universal homogeneous law, mixed-coefficient tensor
map and functoriality used here are supplied by DerivedModuleAlgebra §0.DP.2.

The law `χ` is evaluation of the characteristic polynomial at its
argument after every scalar extension. The integral Newton relation is the identity of
*Integral Newton identities*, and kernel translations are also stated after
an additional coefficient extension. Descent to the coefficient subring includes uniqueness.

Restriction, products, scalar extension and matrix determinants are specified on the entire
polynomial law, after every scalar extension. For the matrix formula, the extended representation is required to agree
with the original on every pure tensor; its linearity then fixes it on all inputs.
These are the scalar-extension constructions in Chenevier, §§1.1–1.5.

**Checks for the canonical maps and conventions.**

| Definitions or convention | Computed Checks |
|---|---|
| `Determinant`, `D(x)`, `det ∘ ρ`, `Determinant.charpoly`, `Determinant.trace`, `Tr`, the law `χ`, the CH ideal and the Cayley–Hamilton property | On the scalar algebra `ℤ`, the empty representation at zero has determinant and characteristic polynomial `1`, trace `0`, and CH ideal the unit ideal. Rank one at `−3` gives `−3`, `X+3`, trace `−3`, and zero CH ideal. On `M₂(ℤ)`, `[[2,3],[4,5]]` gives `−2`, `X²−7X−2`, trace `7`, and zero CH law. |
| The law of a linear map | Identity, zero, and multiplication by two evaluated at three gives six. |
| Products of determinants | Two identity characters at three give value `9`, polynomial `X²−6X+9`, trace `6`; the two projections at `(0,3)` give `0`, `X²−3X`, `3`; degree zero is the unit. |
| Restriction of determinants | Identity; evaluation at two takes `X` to `2`; evaluation at zero kills `X` and preserves `1`. |
| Scalar extension of determinants | Reduction sends `2` to `0`; rational extension retains determinant `−2`; rank zero remains `1` at zero. |
| The quotient map to `Z_A(R, d)`, the universal determinant and the representing equivalence | For `A=R=ℤ`, their degree-zero, degree-one and degree-two values are respectively `1` at zero, `3` at three and `9` at three; specialization to `ℚ` has the same values. |
| Base change of `Z_A(R, d)` | Reduction modulo two preserves the degree-zero class as `1` and kills the degree-one class of `2`; rational extension sends the degree-two class of `3` to `9`. |
| Compatible evaluation and its evaluation map | Identity tuples use the counit on both factors; arity zero over `ℚ` gives scalar `3`; scalar `2` vanishes over `𝔽₂` at a two-term tuple. |
| Regular matrix invariance | Constant identity points are regular; actual `GL_d` points are regular; complex conjugation on `GL₁(ℂ)` is not a Laurent polynomial and fails regularity. The matrix-coordinate hypotheses specify the entire point map. |
| Coefficient change of `H`-pseudocharacters | Identity fixes the family; reduction takes an integral value `2` to zero; rational extension retains a value `−3`. |
| Quotient descent of `H`-pseudocharacters | The bottom subgroup retains values; the trivial point representation descends through the whole group; a coordinate separating `gδ` from `g` prevents descent by a subgroup containing `δ`. |
| Two-dimensional determinants on a group | At identity the pair is `(2,1)`; at `diag(2,3)` it is `(5,6)`; at the swap matrix it is `(0,−1)`. These fix the `(trace, determinant)` order. |
| The coefficient subring | Integral coefficients generate `ℤ`; degree zero generates the prime subring; the rank-one character `n↦(1/2)^n` on the multiplicative copy of `ℕ` generates `ℤ[1/2]`, containing `1/2` and excluding `1/3`. |
| The universal ring `B_H^Γ` and its representing equivalence | For `GL₁`, the homomorphism representing a point character takes the universal coordinate at a group element to `2`, to `−3`, and at the identity over `𝔽₂` to `1`. The values are images of the universal coordinate under the representing homomorphism. |
| Tensor coordinates | Arity zero over `ℚ` has dimension one; the torus variable is not idempotent; the variables on the two torus factors are distinct. |
| Tensor evaluation | The arity-zero scalar `3` gives `3`, the square of the torus coordinate at `2` gives `4`, and the tensor of the two coordinates at `(2,3)` gives `6`. |
| Dual coefficient convention | At `diag(2,3)` over `ℚ`, the dual characteristic polynomial, that is the polynomial at `g⁻¹`, is `X²−(5/6)X+1/6`, fixing both reciprocal coefficients. |
| Reindexing pullback | At torus values `(2,3)`, selecting the first or second coordinate gives `2` or `3`; repeating the point `2` in the two-variable product gives `4`. |
| Multiplication pullback | The one-variable coordinate at `(2,3)` becomes `6`; at `(2,3,5)` the first coordinate stays `2` and the last becomes `15`. These distinguish multiplication of the final pair from the first pair. |
| `mergeLast` | `(2,3)` gives `(6)` and `(2,3,5)` gives `(2,15)`; for the noncommuting matrix pair of the ordered-products Check of *Compatible invariant-coordinate evaluation*, reversing the final pair changes the tested trace from `5` to `4`. |
| Newton and cycle signs | For `M=[[2,3],[4,5]]`, `2det(M)=49−53=−4`. The two-permutation sum for the identity trace at `(2,3)` is `6−6=0`; starting the swap cycle at opposite matrix units gives `E₀₀` and `E₁₁`. |

**General invariant-word colimit.** For any commutative ring `O`, a commutative Hopf
`O`-algebra `C` representing an affine group `H`, and an arbitrary abstract group `Γ`, all in a
fixed common universe, construct the following diagram in Mathlib's `CommAlgCat O`. No
flatness, reductivity, finite presentation or topology is required. Its small index category has
objects `(n,γ)` with `n≥0` and `γ : F_n → Γ`, where `F_n = FreeGroup (Fin n)`. A morphism
`(n,γ) → (m,δ)` is a group homomorphism `u : F_n → F_m` satisfying `δ ∘ u = γ`; identities and
composition are those of group homomorphisms. The object algebra is `C_n = O[H^n]^H`, with the
whole-group scheme invariants of *Invariant coordinate algebras under conjugation*.

Construct every word-substitution pullback `u* : C_n → C_m`: on points over every commutative
`O`-algebra `S`, substitute the words `u(x_i)` into the `m` basis values in `H(S)`.
Multiplication, inversion and the empty word use the coproduct, antipode and counit of `C`.
Prove equivariance for simultaneous conjugation, restriction to scheme invariants, and the identity
and composition laws. Take the colimit `B_H^Γ` in `CommAlgCat O`, with maps `ι_(n,γ)` obeying
`ι_(m,δ) ∘ u* = ι_(n,γ)`. For every commutative `O`-algebra `A`, prove that postcomposition with
these maps bijects algebra maps from the colimit to `A` with families of algebra maps
`a_(n,γ) : C_n → A` satisfying every such cocone equation. Prove extensionality on these maps,
generation by their images, and naturality in coefficient postcomposition and group
homomorphisms `Γ → Γ′`, the latter sending `ι_(n,γ)(f)` to `ι_(n,h ∘ γ)(f)`.

This roadmap owns this general untwisted construction; *Untwisted excursion comparison* supplies
its specialization to the finite-wild carrier of SmoothRepresentationsOfLocalGroups SR.6.3. The construction follows
[Quast §3.6–3.7, Example 3.14, Proposition 3.19 and the proof of Theorem 3.20,
pp.18–20](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf), using
whole-group invariants here; the word maps and colimit argument require no reductivity.
*Needs:* Invariant coordinate algebras under conjugation, Mathlib `FreeGroup.lift`,
`CommAlgCat` and its `HasColimits` instance. This target is specified in this README only.

**Checks.**

- For `Γ = 1`, `(0,F_0 → 1)` is terminal in the index category, so the colimit is `O` and every
  structure map is evaluation at the identity tuple by the counit.
- For `H = G_m` and every `Γ`, the colimit is `O[Γᵃᵇ]`, using Mathlib
  `MonoidAlgebra O (Abelianization Γ)`: the `i`th Laurent coordinate at `(n,γ)` maps to the group
  basis element of the class of `γ(x_i)`. This represents `Γ → Aˣ`. In particular, `O = ℤ` and
  `Γ = S₃` give `ℤ[C₂]`, including a base outside SR.6.3's `ℤ_ℓ` domain.
- For `Γ = F_r`, `(r,id)` is terminal, so the colimit is exactly `C_r`, with simultaneous
  conjugation invariants. For `r = 0` this recovers `O`.
- For `G_m`, the substitutions `x ↦ x⁻¹`, `x ↦ 1` and `x ↦ xy` take the Laurent coordinate
  to `t⁻¹`, `1` and `t₁t₂`, respectively. They impose inversion, identity and multiplication,
  including for nonreduced coefficient algebras.

**Universal reductive pseudocharacter ring.** For `Γ` and the actual Hopf-coordinate input `H/O`, define
`B_H^Γ` using *General invariant-word colimit*, owned in §0.7 for arbitrary commutative `O`,
commutative Hopf-coordinate input and abstract `Γ`. Prove directly from its cocone equations
`Hom_O(B_H^Γ, A) ≃ PC_H^Γ(A)`: `O`-algebra maps `B_H^Γ → A` are exactly `H`-pseudocharacters
with values in `A`. A cocone gives `Θ_n(f)(g)` by its map at `(n,g)`;
Reindexing and final-pair multiplication give compatibility with positive-word substitutions.
For invertible substitutions this also gives compatibility with their inverses; these generate
all free-group word substitutions, including inverse letters and identity insertion
(Quast Lemma 3.18 and Proposition 3.19, pp.19–20). The coordinate maps use the Hopf
antipode and counit. Conversely these compatibilities
give a cocone, and the colimit property makes the two constructions inverse, natural in
coefficient maps. The algebraic completion at a supplied ideal `m` is Mathlib
`AdicCompletion m B_H^Γ`; no local wrapper is needed. The representing-ring target
concerns algebraic pseudocharacters. It does not include a continuous deformation-functor
comparison or a noetherianity assertion for this completion.
([Quast](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf),
Theorem 3.20, p.20, for the representing ring.) *Needs:* Connected reductive pseudocharacter,
General invariant-word colimit, Mathlib `AdicCompletion`.

**Checks.**

- For the trivial target group `H`, `B_H^Γ = O`: every invariant algebra is `O`, so a construction
  that added a generator per free-group map would not collapse to `O`.
- For `H = GL₁` and `Γ = ℤ`, `B_H^Γ = O[t, t⁻¹]`: the colimit computes the coordinate ring of the
  character variety of `ℤ`, so a construction omitting the inverse `t⁻¹`, or keeping a variable
  for every word, would fail.
- For `Γ = ℤ`, the trivial coordinate system has universal ring `ℤ`, which is not
  `ℤ[t,t⁻¹]`. The GL determinant comparison requires the actual simultaneous-conjugation
  invariant coordinate algebras; it does not hold for an arbitrary invariant-coordinate input.

**Universal compatible evaluations.** For a group `Γ` and the Hopf input `C`, the universal
ring `B_H^Γ` of *Universal reductive pseudocharacter ring*, for the group scheme `H` of `C`,
represents the compatible evaluations defined here. The representing equivalence is
natural in coefficient postcomposition, and the evaluations of its universal pseudocharacter
generate this algebra. This is the generators-and-relations construction in Quast, Theorem 3.20,
p.20; it uses the whole-group invariant algebras here, with connected reductive groups as
an application. Coefficient change and quotient descent are fixed on every tuple. The latter,
together with extensionality and surjectivity of `Γ→Γ/Δ`,
uniquely specifies descent for a normal `Δ` contained in the evaluation kernel.
*Needs:* Universal reductive pseudocharacter ring, Compatible invariant-coordinate evaluation.

**Checks.** For `GL₁`, the universal character coordinate at a chosen generator maps to `2`
over `ℚ`, to `−3` over `ℚ`, and at the identity over `𝔽₂` to `1`; these are the
values of its representing algebra homomorphism.

**Untwisted excursion comparison.** For the commutative base `O` and Hopf input `C` of
*General invariant-word colimit*, construct the free-group trivial-action cocycle coordinates:
over every coefficient algebra `S`, trivial-action `F_n`-cocycles are homomorphisms
`F_n → H(S)`, represented by the `n`-fold tensor power of `C` via their free basis values.
Gauge invariants are exactly `C_n`, and this coordinate identification commutes with every
word pullback. Identify the resulting invariant-word colimit with the universal ring `B_H^Γ`
of *Universal compatible evaluations*. It sends `ι_(n,γ)(f)` to the universal evaluation
`θ_n(f)(γ(x_1), …, γ(x_n))`, and identifies every map to a coefficient algebra with its
represented pseudocharacter, naturally in coefficient postcomposition. Use the all-word
compatibility of *Universal reductive pseudocharacter ring* to identify this cocone with the
universal pseudocharacter evaluations.

Under SR.6.3's actual hypotheses (`O = ℤ_ℓ`, `ℓ ≠ p`, split reductive `H`, and
`Γ = W_F⁰/P_F^e`) and **trivial** Weil action on `H`, construct an isomorphism from this same
colimit to SR.6.3's *Finite-wild excursion algebra*, commuting with every structure map.
The free-group coordinate identification agrees with SR.6.1's cocycle coordinates at that
specialization. Uniqueness from the colimit property identifies the carriers and all evaluations.
SR.6's twisted applications, finiteness and excursion-to-cocycle-quotient comparisons keep their
stated arithmetic hypotheses. The comparison with SR.6 uses its `Type` universe; the intrinsic
pseudocharacter API retains its existing universe generality. This target is specified in this
README only.

The general comparison applies the free-group and colimit universal properties to
[Quast §3.6–3.7, Proposition 3.19 and Theorem 3.20, pp.19–20](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf);
the finite-wild specialization uses SR.6.3 and
[Fargues–Scholze, Definition VIII.3.4, p.287](https://arxiv.org/pdf/2102.13459).
*Needs:* General invariant-word colimit, Universal compatible evaluations; for the finite-wild
specialization only, SmoothRepresentationsOfLocalGroups SR.6.1 (*One integral finite-wild cocycle
scheme*, its points and invariant pullbacks) and SR.6.3 (*Finite-wild excursion algebra*, its
colimit cocone and universal property).

**Checks.** For the map on coordinates, the empty tuple preserves the scalar `7`; one coordinate
evaluates at the chosen free generator; swapping two coordinates swaps their actual point values.
For the representing-ring isomorphism, coefficients preserve `7`, the empty scalar excursion is
`1`, and the product-word excursion in a two-element tuple maps to the universal singleton
evaluation at `gh`. In the finite-wild trivial-action specialization the scalar, singleton and
product-word structure maps agree with those of SR.6.3 under the comparison isomorphism.

### Examples

The checks of this layer return to a small set of objects. The matrix algebra `M_d(A)` with `det`
is the reference determinant throughout: it computes `Matrix.det`, `Matrix.charpoly` and the matrix
trace (The determinant of a matrix representation), it is faithful and
Cayley–Hamilton with `χ = 0` (The characteristic polynomial law χ : R → R), and its
trace is the model pseudocharacter (Pseudocharacters). The upper-triangular `2 × 2`
algebra is the standing non-faithful example, with kernel the strictly upper-triangular ideal
(The kernel of a polynomial law,
The kernel of a determinant is a two-sided ideal). `Γ_ℤ(ℤ)` with `γ₁(1)² = 2γ₂(1)`
and `γ₂(1) ⋆ γ₂(1) = γ₂(1)` separates the graded and the internal multiplications
(DerivedModuleAlgebra §0.DP.2 / Homogeneous divided-power piece, DerivedModuleAlgebra §0.DP.2 / Roby algebra of multiplicative laws),
and `Z_A(A[t], d) ≅ A[e₁, …, e_d]` carries the universal characteristic polynomial
(Determinant coordinate ring). Over `𝔽_p`, the trace-blind determinants on `𝔽_p[T]`
show why the determinant language is kept (DerivedModuleAlgebra §0.DP.1 / Homogeneous polynomial laws,
Determinants (Chenevier)). The Hamilton quaternions over `ℝ` give the nonsplit reduced
norm `a² + b² + c² + d²` (Azumaya reduced-norm determinant), the diagonal unit pair
`(a, b)` the inverse-root polynomial of the dual (Contragredient determinant), and
`V = A²` the sign check against `Matrix.det`
(Determinant of a finite projective representation). On the reductive side, `G_m`,
`GL₂` with `a + d` and `ad − bc`, and the upper-unipotent representation of `ℤ` whose
pseudocharacter kernel is all of `ℤ` are the recurring examples
(Invariant coordinate algebras under conjugation,
Rational cohomology of a flat affine group scheme,
Kernel of a reductive pseudocharacter).

### Dependencies

This layer is the base of the roadmap and uses no earlier IHG layer. DerivedModuleAlgebra
§§0.DP.1–0.DP.2 supplies homogeneous and multiplicative laws and the Roby algebra theory.
From Mathlib it uses the
polynomial-law carrier `PolynomialLaw` with `PolynomialLaw.id`, `PolynomialLaw.comp`,
`PolynomialLaw.ground`, `TensorProduct`, `LinearMap.lTensor`,
`TensorProduct.AlgebraTensorModule.cancelBaseChange`, `TensorProduct.finsuppScalarLeft`,
`LinearEquiv.rTensor`, `Algebra.TensorProduct.instRing`, `Algebra.TensorProduct.rid`, `Polynomial`,
`Polynomial.Monic`, `MvPolynomial`, `MvPolynomial.basisMonomials`, `MvPowerSeries`, `Matrix.det`,
`Matrix.det_mul`, `Matrix.det_smul`, `Matrix.det_conj`, `RingHom.map_det`, `Matrix.charpoly`,
`Matrix.trace`, `MonoidAlgebra`, `MonoidAlgebra.of`, `MonoidAlgebra.mapDomainAlgHom`, `AlgHom`,
`Submodule`, `Submodule.mkQ`, `Subring.closure`, `TwoSidedIdeal`, `DividedPowerAlgebra`,
`DividedPowerAlgebra.dp`, `exteriorPower.map`, `Equiv.Perm.sign`, `Equiv.Perm.SameCycle`,
`Function.minimalPeriod`, `LinearMap`, `Continuous`, `Continuous.ext_on`, `Subgroup.Normal`,
`IsOpen`, `HopfAlgebra` and `CategoryTheory.Abelian`. From Tau Ceti it uses `TauCeti.Comodule`,
`TauCeti.Comodule.fixedSubcomodule` and `TauCeti.Comodule.cofree`. From the roadmaps it uses
ReductiveGroups layer 1 (comodule foundations and the representation–comodule dictionary),
layer 9 (the split reductive group schemes and their Hopf algebras) and the
top exterior power at constant rank from PadicMeasuresIwasawaAlgebras §5.1, with Mathlib `IsAzumaya`
and SchemeAndStackFoundations §2.22 `IsAzumaya.exists_etale_matrix_splitting`, including its
finite-cover adapter, for the reduced-norm input. General invariant-word colimit is constructed
here using Mathlib's commutative-algebra colimits; SmoothRepresentationsOfLocalGroups SR.6.1 and
SR.6.3 enter only in its finite-wild trivial-action specialization.

## Layer 3a: Hecke polynomial and multiplier conventions

This algebraic part of IHG.3 precedes reconstruction so that its full multiplier identity can be
used in symplectic coefficient descent. Satake and the `GSp₄` spin polynomial with its Satake
interpretation are imported from SmoothRepresentationsOfLocalGroups, SR.4 (reciprocity from
ClassFieldTheory, layer 7) with the stated normalization; the explicit coefficient comparisons are
proved here. The coefficient ring `A` is any commutative ring, including the zero ring.
The formulas use `q,Tᵢ ∈ A`; an operator algebra is obtained by taking that algebra as `A`.

### 3a.1 GLₙ Hecke polynomials and Frobenius conventions

**Integral GLn Hecke polynomial.** For `n ≥ 0`, `q ∈ A` and operators `T_0, …, T_n` in a
commutative ring `A`, define `P` as

```text
P(X) = ∑_{i=0}^n (−1)^i q^{i(i−1)/2} T_i X^{n−i}.
```

For an unramified `GL_n` place the `T_i` are the characteristic functions of
`K diag(π, …, π, 1, …, 1) K` with `π` repeated `i` times and `1` repeated `n−i` times, for
`vol(K) = 1`. When `T₀=1` the polynomial is monic; it is defined integrally, and its
determinant coefficient is
`q^{n(n−1)/2} T_n`. Prove that for `0 ≤ i ≤ n` the coefficient of `X^{n−i}` is
`(−1)^i q^{i(i−1)/2} T_i`, that `P` is monic if `T_0 = 1`, even in the zero ring, that it has
degree `n` when `A` is nonzero, and that it is compatible with every ring homomorphism ([ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §2.2.5, equation (2.2.6),
p.922). *Needs:* IHG.0, Characteristic polynomial and trace of a determinant; [Smooth representations of local
groups](../SmoothRepresentationsOfLocalGroups/README.md) SR.4.3, *gln-generators*.

**Checks.**

- At rank zero, the formula is the constant `T₀`; `T₀ = 1` gives the empty determinant,
  whereas `T₀ = 0` over `ℤ` is not monic.

- For `n = 1` the polynomial is `X − T_1`: the single nontrivial coefficient carries no power of
  `q`, so a definition whose exponent were `i(i+1)/2` instead of `i(i−1)/2` would produce `X − qT_1`.
- For `n = 2` it is `X² − T_1X + qT_2`: the constant term computes `q^{1}T_2`, so a definition
  with the wrong sign or `q`-power on the top coefficient would fail here.
- A homomorphism `A → B` transports `P` coefficient by coefficient, without choosing `√q`: the
  polynomial is integral in `q` and the `T_i`, so a definition that only existed after adjoining a
  square root of `q` would not transport along an arbitrary coefficient map.

**Normalized Satake coefficients for GLn.** The Satake factorization of `P` holds for every `s ∈ A`, with `q = s²`, and every
`z : Fin n → A`. Its elementary symmetric coefficient is the sum of products over all
`i`-element subsets of `Fin n`. In the Satake interpretation, `q` is a unit and `s` is a
chosen square root in a coefficient extension. Under `S(T_i) = s^{i(n−i)} e_i(z_1, …, z_n)` one has

```text
S(P(X)) = ∏_{j=1}^n (X − s^{n−1} z_j).
```

The equality follows because `i(i−1) + i(n−i) = i(n−1)`. The integral polynomial `P` is independent
of the square-root extension ([ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §2.2.5, equation (2.2.6), pp.921–922; the displayed factorization is the elementary
symmetric expansion with the stated Satake normalization). *Needs:* Integral GLn Hecke polynomial.

**Determinant coefficient of the GLn parameter.** Prove the determinant coefficient identity
for any `A`-algebra `R`, a degree-`n` determinant `D` on `R` and `r ∈ R` with
`D.charpoly r = P`: its value is `q^{n(n−1)/2}T_n`. In particular, at a specified
Frobenius element `F_v`,
`D(F_v) = q_v^{n(n−1)/2} T_{v,n}`; with normalized Satake parameters `z_j` its value is
`s^{n(n−1)} ∏ z_j`. This target is an equality at a specified element; global character identification is
outside this layer ([ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §2.2.5, equation (2.2.6), p.922). *Needs:*
Integral GLn Hecke polynomial.

**Characteristic polynomial under a character twist.** For a rank-`n` determinant `D` of `G`, a
character `θ : G → A^×` and `g ∈ G`, twisting the group algebra by `h ↦ θ(h)h` gives

```text
χ_{D⊗θ,g}(X) = ∑_{i=0}^n (−1)^i θ(g)^i Λ_i(g) X^{n−i}.
```

The coefficient target is the following: for any degree-`n`
determinant on an `A`-algebra, `r` in that algebra, `a ∈ A` and `i ≤ n`, the coefficient
of degree `n−i` at `a • r` is `a^i` times the coefficient at `r`. Apply this with
`r = g`, `a = θ(g)` and restriction along `h ↦ θ(h)h`. The determinant character
changes by `θ^n` by the homogeneity `D(ax) = a^d D(x)` of a determinant ([ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §2.2.20–24,
pp.932–934). *Needs:* Restriction of determinants.

**Normalized reciprocal characteristic polynomial.** For a degree-`n` determinant on `A[G]`
and a group element `g` (hence a unit of the group algebra),
write `P_g(X) = ∑ a_i X^{n−i}` with `a_0 = 1` and `a_n` a unit. Prove that
`P_{g^{-1}}(X) = a_n^{-1} ∑_{i=0}^n a_i X^i`, equivalently `X^n P_g(X^{-1}) / P_g(0)`; this is
the monic polynomial with inverse roots ([ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §2.2.20, p.932). The
statement is coefficientwise: the coefficient of `X^i` at `g⁻¹`, multiplied by `P_g(0)`, is the
coefficient of `X^{n−i}` at `g`. *Needs:*
Characteristic polynomial and trace of a determinant.

**Arithmetic and geometric Frobenius conversion.** Fix `F_v^ar` with `F_v^geom = (F_v^ar)^{-1}`.
Apply the reciprocal characteristic-polynomial identity: if `P` is the characteristic polynomial at `F_v^ar`, the polynomial at `F_v^geom` is the
normalized reciprocal of `P`, and that if a source instead specifies `P` at geometric Frobenius,
its arithmetic polynomial is that reciprocal. ACC23 explicitly uses geometric Frobenius, so
importing its polynomial requires this convention conversion. The cyclotomic character has
`ε(F_v^ar) = q_v` and `ε(F_v^geom) = q_v^{-1}` ([ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Notation §1.2, pp.905–906 and
§2.2.20). *Needs:* Normalized reciprocal characteristic polynomial,
[ClassFieldTheory, layer 7][classfieldtheory7].

**Inversion of spherical double cosets.** The coefficient comparison takes the generator
rule `T_i ↦ T_{n−i}/T_n` as input; constructing the double-coset involution is outside
this layer. Assume `q,T_n ∈ Aˣ` and `T_0=1`. Prove
`ι(P(X)) = q^{n(n−1)} P^rec(q^{1−n} X)`, where `ι(P)` denotes substitution of that generator rule and `P^rec` is the monic
normalized reciprocal. The coefficientwise form clears the unit constant coefficient: its
coefficient of degree `n−i`, multiplied by `P(0)`, equals `q^{i(n−1)} P.coeff i`. Thus
the corresponding determinant is `D∨ ⊗ ε^{1−n}` when Frobenius is geometric as in ACC23
([ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §2.2.20, p.932). *Needs:* Integral GLn Hecke polynomial,
Normalized reciprocal characteristic polynomial.

**Rank-one normalization by reciprocity.** For `GL_1`, `K = O_v^×` and `T_1 = [KπK]`, so
`P = X − T_1`. The degree-one reciprocal characteristic-polynomial identity says that an unramified character with `θ(F_v^ar) = u` has arithmetic polynomial
`X − u` and geometric polynomial `X − u^{-1}`. Reciprocity sends `π` to the explicitly chosen
Frobenius, so a character evaluated under the opposite Artin convention is inverted
([ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Notation and §2.2.5, equation (2.2.6), pp.905–906, 921–922). *Needs:*
Integral GLn Hecke polynomial, Arithmetic and geometric Frobenius conversion.

**Rank-two classical modular-form normalization.** For the standard arithmetic Galois
representation of a normalized eigenform `f` of natural weight `k ≥ 2` and nebentype `ω` at `ℓ ∤ Np`, the
polynomial is `X² − a_ℓ X + ω(ℓ) ℓ^{k−1}`. Prove that the `GL_2` cohomological formula
`X² − T_1 X + ℓ T_2` agrees with it after `T_1 = a_ℓ` and `T_2 = ω(ℓ) ℓ^{k−2}`, and that passing to
geometric Frobenius takes its normalized reciprocal. The classical geometric owner supplies its
eigenvalues and the stated arithmetic Frobenius characteristic polynomial; this comparison only
identifies the two coefficient conventions ([ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §2.2.5, equation (2.2.6), n=2
specialization, pp.921–922). *Needs:* Integral GLn Hecke polynomial, Arithmetic and geometric Frobenius conversion, Tau Ceti `HeckeRing.GL2.Newform.satakeParameters`.

### 3a.2 Spin, dual-spin and full multiplier

**GSp4 dual-spin Hecke polynomial.** Let

```text
Q(X) = X⁴ − T_1 X³ + (qT_2 + (q³+q)T_0) X² − q³ T_0 T_1 X + q⁶ T_0²
```

be the monic spin polynomial of SmoothRepresentationsOfLocalGroups, SR.4 (its
`SpinPolynomial.reciprocal`), with `T_0, T_1, T_2` the double cosets of `diag(ϖ,ϖ,ϖ,ϖ)`,
`diag(ϖ,ϖ,1,1)`, `diag(ϖ²,ϖ,ϖ,1)` for a uniformiser `ϖ`, `q` the residue cardinality, that is
SR.4's `T0`, `T2`, `T1`. The explicit formula `Q` equals the
fixed-degree reflection of that supplied polynomial with these indices exchanged.
Its constant coefficient `q⁶T_0²` and its compatibility with every coefficient change are
targets. The dual definition needs only `T_0 ∈ Aˣ`; `q` can be any
element. Define `P`
as

```text
P(X) = X⁴ − T_0^{-1} T_1 X³ + T_0^{-2}(qT_2 + (q³+q)T_0) X² − q³ T_0^{-2} T_1 X + q⁶ T_0^{-2},
```

the scaled dual polynomial. Assume additionally that `q` is a unit for the reciprocal
interpretation. Prove
the scaled reciprocal identity (`P(X) = X⁴ Q(q³/X) / Q(0)`, stated coefficient by
coefficient after clearing `Q(0)`) and `P(0) = q⁶ T_0^{-2}`; the roots of `P` are `q³`
divided by the spin-`Q` roots ([BCGP](https://arxiv.org/pdf/2502.20645v1), Equation (1.8.27) and Lemma 1.8.28, p.17).
*Needs:* IHG.0, Characteristic polynomial and trace of a determinant; [Smooth representations of local groups](../SmoothRepresentationsOfLocalGroups/README.md)
SR.4.5, *gsp4-spin-polynomial* and *gsp4-galois-comparison*.

**Checks.** The three direct dual-polynomial computations in the table below distinguish
`q=0`, the identity parameter, and a nontrivial central unit. In particular,
`q=T₀=1` alone cannot detect a wrong power of either parameter. The pair of
constant coefficients `Q(0)=256`, `P(0)=16` at `q=T₀=2` distinguishes scaled
duality from the unscaled normalized reciprocal, whose constant is `1/256`.

**Geometric-Frobenius dual-spin conversion.** For an arbitrary degree-four determinant on `A[G]`,
a specified `g ∈ G`, units `q,T₀` and the displayed characteristic polynomial `Q`, identify the characteristic polynomial of the dual at `q³ • g`, that is the characteristic
polynomial of `D` at `q³ • g⁻¹`, with `P`.
For BCGP25 geometric Frobenius `F_ℓ`, this says that if
`det(X − ρ(F_ℓ)) = Q_ℓ(X)`, then `det(X − (ρ∨ ⊗ ε^{-3})(F_ℓ)) = P_ℓ(X)`, because
`ε(F_ℓ) = ℓ^{-1}`. Arithmetic Frobenius values require the normalized reciprocals of these
polynomials. This conversion applies to a determinant whenever duality and the twist are defined
([BCGP](https://arxiv.org/pdf/2502.20645v1), Lemma 1.8.28, p.17). *Needs:* GSp4 dual-spin Hecke polynomial,
Characteristic polynomial under a character twist, Arithmetic and geometric Frobenius conversion, Contragredient determinant.

**Full similitude character under duality and twist.** Prove that for invertible matrices `r,J` over `A` and units
`μ,θ`, if `rᵀJr=μJ`, then `θr⁻ᵀ` preserves `J⁻¹` up to `μ⁻¹θ²`.
This matrix identity holds in every size, including zero, and does not require an
alternating form. For a symplectic representation it applies pointwise: if `ρ : G → GSp4(A)` has
similitude `μ : G → A^×`, then `ρ∨ ⊗ θ` has similitude `μ^{-1} θ²`; in particular the cohomological
dual-spin representation `ρ∨ ⊗ ε^{-3}` has `μ^{-1} ε^{-6}`. At BCGP25 geometric Frobenius these
values are `q³ T_0` for `ρ` and `q³ T_0^{-1}` for the converted representation. The determinant
`μ²` does not determine `μ`, including over `ℤ/4`, where `1` and `−1` have equal squares; over a field of
characteristic two the squaring map is injective ([BCGP](https://arxiv.org/pdf/2502.20645v1),
§1.8.7–8 and Lemma 1.8.28, pp.9–10, 16–17). *Needs:* Geometric-Frobenius dual-spin conversion, [ReductiveGroups, layer 9][reductivegroups9].

### Examples

**Checks.** The three definitions each have three direct computations; the further rows pin the
normalizations and excluded hypotheses.

| Definition or convention | Computation |
|---|---|
| `P` | `n=0,q=0,T₀=1`: `1`; `n=1,q=7,T=(1,3)`: `X−3`; `n=2,q=2,T=(1,3,5)`: `X²−3X+10` |
| Integral base change and monicity | Over `𝔽₂`, `q=0,T=(1,1,1)` gives `X²+X`; rank zero with `T₀=0` over `ℤ` is not monic |
| `Q` | At `(q,T₀,T₁,T₂)=(1,1,4,4)`: `(X−1)⁴`; at `(0,1,3,5)`: `X⁴−3X³`; at `(2,1,3,5)`: `X⁴−3X³+20X²−24X+64` |
| `P` | At `(1,1,4,4)`: `(X−1)⁴`; at `(0,2,3,5)` over `ℚ`: `X⁴−(3/2)X³`; at `(2,2,3,5)`: `X⁴−(3/2)X³+(15/2)X²−6X+16` |
| Satake powers and determinant sign | `s=2,z=(3,5)` gives `(X−6)(X−10)=X²−16X+60`; the determinant is `60`, not `−60` |
| Double-coset inversion | `q=2,T=(1,5,3)` gives `X²−5X+6`; transformed generators give `X²−(5/3)X+2/3=(2/3) reflect₂(P)(X/2)` |
| Classical weight | `k=4,q=2,a=3,ω=1` gives `X²−3X+8`; using truncated natural subtraction at weight one would give constant `2` instead of `1` |
| Frobenius and reciprocity | Arithmetic root `2` gives `X−2`, geometric root `1/2` gives `X−1/2`; roots `2,3` give reciprocal `X²−(5/6)X+1/6` |
| Character twist | Roots `2,3` twisted by `5` give `X²−25X+150`; the constant scales by `5²` |
| Scaled spin duality | Paired roots `2,4` of multiplier `8` become `4,2` under `8/r`; at `q=T₀=2` the four-dimensional constants are `256` and `16` |
| Full multiplier | On the symplectic plane, `diag(2,3)` has multiplier `6`; its dual twisted by `5` has multiplier `25/6`. In `ℤ/4`, `1≠−1` but their squares agree |

### Dependencies

Layer IHG.0 (Characteristic polynomial and trace of a determinant, Restriction of determinants, Contragredient determinant); SmoothRepresentationsOfLocalGroups
SR.4 for the spherical generators, normalised Satake and the spin polynomial
`SpinPolynomial.reciprocal`; ClassFieldTheory layer 7 for the Frobenius normalisation of the Artin
map; ReductiveGroups layer 9 for the `GSp₄` similitude; Tau Ceti
`HeckeRing.GL2.Newform.satakeParameters` for the classical rank-two comparison.

## Layer 1: Cayley–Hamilton algebras and reconstruction

This layer constructs the characteristic-coefficient quotient, establishes its field structure,
and lifts its split residual constituents henselianly. It then builds generalized matrix algebras
with labelled constituents, their reducibility and Ext interfaces, and coefficient descent. The final subsections give the compatible local compressions of
Caraiani–Newton and reconstruct GL pseudocharacters.

### 1.1 The Cayley–Hamilton ideal and Cayley–Hamilton algebras

**The Cayley–Hamilton ideal.** For a determinant `D` on `R`, define
`CH(D) ⊆ R`, the two-sided ideal generated by all `χ_α(r_1, …, r_n)` (`n ≥ 1`, `r_i ∈ R`), the
coefficients of `χ(t_1r_1 + ⋯ + t_nr_n) ∈ R[t_1, …, t_n]`. Prove `CH(D) ⊆ Ker(D)` and that each
`χ_α(r_1, …, r_n)` lies in `CH(D)` ([Chenevier](https://arxiv.org/pdf/0809.0415v2), §1.17, p. 17). *Needs:* The characteristic polynomial law χ : R → R, Mathlib `TwoSidedIdeal.span`.

**Checks.**

- `CH(det) = 0` on `M_d(A)`: every coefficient of the characteristic law vanishes by
  Cayley–Hamilton, so a definition that generated the ideal from the wrong coefficients (say the
  `Λ_i(r)` themselves) would produce a nonzero ideal here.
- `CH = 0` on upper-triangular matrices: the characteristic law of the restricted determinant
  still vanishes, so a definition tied to faithfulness would wrongly make this ideal nonzero.
- In dimension one `CH(D)` is generated by the `r − D(r)`: the degree-one characteristic law is
  `r ↦ r − D(r)`, whereas omitting the constant term `(−1)^d Λ_d` leaves the identity map and generates the
  unit ideal. Over `ℤ`, the identity character has `CH = 0`, while the values of `x ↦ x`
  generate `(1)`.

**Cayley–Hamilton algebras.** A determinant `D` on `R` is Cayley–Hamilton if `CH(D) = 0`,
equivalently if the law `χ : R → R` vanishes identically; `(R, D)` is then a Cayley–Hamilton
`A`-algebra of degree `d`. Define the Cayley–Hamilton property as `CH(D) = 0`. Prove that it
holds iff `χ = 0` as a law and that it is stable under base change
([Chenevier](https://arxiv.org/pdf/0809.0415v2), §1.17, p. 17). *Needs:* The Cayley–Hamilton ideal.

**Checks.**

- `(M_d(A), det)` is Cayley–Hamilton: the matrix Cayley–Hamilton theorem computes `χ = 0`, so a
  definition requiring more than vanishing of the law would reject the reference example.
- Upper-triangular matrices are Cayley–Hamilton but not faithful: `χ = 0` while the kernel is the
  strictly upper-triangular ideal, so a definition identifying Cayley–Hamilton with faithful would
  fail on this algebra.
- A faithful determinant is Cayley–Hamilton: `CH(D) ⊆ Ker(D) = 0`, so a definition under which
  faithfulness did not force `CH(D) = 0` would be inconsistent with the kernel containment.

**Cayley–Hamilton is stable under base change.** Prove that if `D` is Cayley–Hamilton, so is
`D ⊗_A S` for every commutative `A`-algebra `S` ([Chenevier](https://arxiv.org/pdf/0809.0415v2), §1.17, p. 17).
*Needs:* Cayley–Hamilton algebras, Scalar extension of determinants.

**Cayley–Hamilton restricts to subalgebras.** Prove that if `D` is Cayley–Hamilton on `R` and
`φ : R′ → R` is an injective `A`-algebra map, then `D ∘ φ` is Cayley–Hamilton on `R′`
([Chenevier](https://arxiv.org/pdf/0809.0415v2), Example 1.20(ii), p. 18). *Needs:* Cayley–Hamilton algebras, Restriction of determinants.

**The kernel contains the Cayley–Hamilton ideal.** Prove `CH(D) ⊆ Ker(D)` for every determinant
`D`, with no hypothesis on `A` ([Chenevier](https://arxiv.org/pdf/0809.0415v2), Lemma 1.21, p. 18). *Needs:* The kernel of a determinant is a two-sided ideal, The Cayley–Hamilton identity for determinants, The Cayley–Hamilton ideal.

**Faithful determinants are Cayley–Hamilton.** Prove that if `D` is faithful, then `(R, D)` is a
Cayley–Hamilton algebra; in particular the faithful quotient `R/Ker(D)` of any determinant is
Cayley–Hamilton ([Chenevier](https://arxiv.org/pdf/0809.0415v2), Lemma 1.21, p. 18). *Needs:* The kernel contains the Cayley–Hamilton ideal, The induced law on M/Ker(P) is faithful, Cayley–Hamilton algebras.

### 1.2 Field structure and semisimple reconstruction

**Determinants on product algebras.** For a nonzero commutative `A` with connected spectrum and
`A`-algebras `R₁, R₂`, prove that every dimension-`d` determinant on `R₁ × R₂` is uniquely a
product `D₁D₂`, with dimensions `d₁ + d₂ = d`. Without connectedness, the dimensions are locally
constant on `Spec(A)` ([Chenevier](https://arxiv.org/pdf/0809.0415v2), Lemma 2.2(iii), pp.23–24). *Needs:* DerivedModuleAlgebra §0.DP.2 / Roby algebra of multiplicative laws.

**Corner determinant.** For `D : R → A` with `A` nonzero and connected and `e² = e` in `R`, define
`D_e : eRe → A`, `D_e(x) = D(x + 1 − e)`, naturally after every scalar
extension, on the corner algebra with unit `e`. Its degree `r(e)` is the degree of `D(1 − e + te)`,
and `r(e) + r(1 − e) = d`. Prove `D(1 − e + te) = t^{r(e)}` and that the restriction to the two
diagonal corners is `D_e D_(1−e)`
([Chenevier](https://arxiv.org/pdf/0809.0415v2), Lemma 2.4(1–2), p.25). *Needs:* Determinants on product algebras, Determinants (Chenevier), Mathlib `IsIdempotentElem.Corner`,
`Subsemigroup.mem_corner_iff`.

**Checks.**

- For the usual determinant on `M₃(A)` and `e = diag(1,1,0)`, `D_e` is the `2 × 2` determinant:
  `det(x + 1 − e)` on a block matrix computes the upper-left `2 × 2` determinant, so a definition
  using `D(x)` or `D(x + e)` instead of `D(x + 1 − e)` would give `0` or a wrong polynomial.
- For `e = 0` the corner determinant has degree zero and constant value one: `D(0 + 1 − 0) = 1`,
  the degenerate case a definition that did not allow degree `0` would fail.
- Over `𝔽₂` a rank-two projection has trace zero but corner degree two: `r(e)` is read from
  `D(1 − e + te) = t²`, not from `Tr(e) = 0`, so a definition of the corner rank via the trace
  would fail in characteristic two.

**Cayley–Hamilton corner restriction.** Prove that if `D` is Cayley–Hamilton, `D_e` is
Cayley–Hamilton, and if `D` is faithful, `D_e` is faithful. Corner formation commutes with
arbitrary scalar extension because `eRe` is a direct summand of `R`
([Chenevier](https://arxiv.org/pdf/0809.0415v2), Lemma 2.4(3), p.25). *Needs:* Corner determinant,
Cayley–Hamilton algebras, D(1 + rr′) = D(1 + r′r).

**Bound on orthogonal nonzero corners.** For a dimension-`d` Cayley–Hamilton determinant over
nonzero connected `A`, prove that every nonzero idempotent `e` has `r(e) > 0`, that a family of
nonzero orthogonal idempotents has length at most `d`, and that its corner ranks sum to `d` iff its
sum is one ([Chenevier](https://arxiv.org/pdf/0809.0415v2), Lemma 2.4(4), pp.25–26). *Needs:* Cayley–Hamilton corner restriction.

**Cayley–Hamilton unit criterion.** For a Cayley–Hamilton determinant `D : R → A` and `x ∈ R`,
prove that `x` is a unit iff `D(x)` is a unit in `A` ([Chenevier](https://arxiv.org/pdf/0809.0415v2), Proof of
Lemma 2.7(i), p.27). *Needs:* Cayley–Hamilton algebras.

**Nilpotent ideals vanish under field determinants.** For a field `k`, prove that any determinant
`D : R → k` and two-sided `J ⊂ R` with `J^s = 0` satisfy `J ⊂ ker(D)`; `D` need not be
Cayley–Hamilton ([Chenevier](https://arxiv.org/pdf/0809.0415v2), Lemma 2.7(v), p.27). *Needs:* The kernel of a determinant is a two-sided ideal.

**Separable algebraic base change of the determinant kernel.** For a separable algebraic field
extension `K/k` and `D : R → k`, prove `ker(D_K) = K ⊗ ker(D)`; purely inseparable extension is
excluded. The proof descends the invariant kernel subspace through finite Galois extensions and
then through the directed union of finite separable extensions; purely inseparable coefficient
changes have a separate norm-power behavior and do not give this equality
([Chenevier](https://arxiv.org/pdf/0809.0415v2), Lemma 2.8(i) and Example 2.9, pp.27–28). *Needs:* The kernel of a determinant is a two-sided ideal.

**Field Cayley–Hamilton radical and kernel.** For a Cayley–Hamilton determinant `D : R → k` over a
field, prove `ker(D) = Rad(R)`, and that every element of this ideal satisfies `x^d = 0`. This
gives a nil ideal, without a uniform ideal-power bound in small characteristic
([Chenevier](https://arxiv.org/pdf/0809.0415v2), Lemma 2.8(ii), pp.27–28). *Needs:* Cayley–Hamilton unit criterion, Separable algebraic base change of the determinant kernel,
[SemisimpleAlgebras, layer 0][semisimplealgebras0].

**Bounded algebraicity bounds simple-module dimension.** Let `R` be a `k`-algebra whose elements
have algebraic degree `< n`. Prove that for every simple `R`-module `V` with division
endomorphism ring `E`, `dim_E V` is finite and `< n`, and the action `R → End_E(V)` is surjective
([Chenevier](https://arxiv.org/pdf/0809.0415v2), Proof of Lemma 2.14, pp.29–30). *Needs:* [SemisimpleAlgebras,
layer 3][semisimplealgebras3].

**Finiteness of simple factors.** Prove that if `R` has zero radical, is algebraic with a uniform
degree bound and has a uniform bound on orthogonal nonzero idempotents, it has finitely many
simple-module isomorphism classes and is their finite product of full endomorphism algebras
([Chenevier](https://arxiv.org/pdf/0809.0415v2), Proof of Lemma 2.14, p.30). *Needs:* Bounded algebraicity bounds simple-module dimension, [SemisimpleAlgebras, layer 0][semisimplealgebras0],
[SemisimpleAlgebras, layer 2][semisimplealgebras2], Bound on orthogonal nonzero corners.

**Centers of bounded algebraic semisimple factors.** Under Lemma 2.14 hypotheses over `k` and
`k^sep`, prove that the division factors are finite over their centers, that each center `k_i` has
maximal separable subextension `separableClosure k k_i` finite over `k` and satisfies
`k_i^q ⊆ separableClosure k k_i` for `q` the largest power of the exponential characteristic below
`n` (so `k_i/k` is finite separable in characteristic zero), and that finite dimension over `k`
follows if `k` is perfect, `[k : k^p] < ∞`, or `p > n`. Finite dimension over a factor center is
kept separate from finite dimension over the original field ([Chenevier](https://arxiv.org/pdf/0809.0415v2), Lemma 2.14, pp.29–30). *Needs:*
Finiteness of simple factors, [SemisimpleAlgebras, layer 4][semisimplealgebras4].

**Determinants on split simple factors.** Over algebraically closed `k`, prove that a faithful
dimension-`d` determinant identifies its algebra with `∏_i M_{n_i}(k)` and is `∏_i det_i^{m_i}`,
with positive `m_i` and `∑_i n_i m_i = d` ([Chenevier](https://arxiv.org/pdf/0809.0415v2), Proof of Theorem 2.12,
pp.30–31). *Needs:* The induced law on M/Ker(P) is faithful, Field Cayley–Hamilton radical and kernel, Centers of bounded algebraic semisimple factors,
Azumaya reduced-norm determinant.

**Semisimple reconstruction of field determinants.** Let `k` be algebraically closed, `R` any
`k`-algebra and `d ≥ 1`. Prove that every dimension-`d` determinant `D : R → k` is `det ∘ ρ` for a
semisimple representation `ρ : R → M_d(k)`, unique up to conjugacy, with `ker ρ = ker D`. No
factorial assumption is required ([Chenevier](https://arxiv.org/pdf/0809.0415v2), Theorem 2.12, pp.28–31).
Semisimplicity is that of `matrixModule ρ` as an `R`-module, uniqueness is among semisimple
representations, and the kernel clause says that `ρ(r) = 0` iff `r` lies in `PolynomialLaw.ker` of
the law of `D`. The predicate `Determinant.IsRealizedBy` identifies the entire scalar-extended
law with the matrix determinant.
*Needs:* Determinants on split simple factors.
*Lean:* `Determinant.exists_semisimple_realization`.

**The Frobenius law of a finite-exponent extension.** Let `k` be a field of exponential
characteristic `p` and `L/k` a field extension with maximal separable subextension
`L_s = separableClosure k L`. The extension has *finite exponent* `(f, q)` if `L_s` is finite over
`k` of degree `f` and `IsPurelyInseparable.HasExponent L_s L` holds, with
`q = p ^ IsPurelyInseparable.exponent L_s L`. Thus `q` is the least power of `p` with
`L^q ⊆ L_s`, `q = 1` exactly when `L = L_s`, and only `q = 1` occurs in characteristic zero; `q`
is not `[L : L_s]`, which can be larger or infinite. For each commutative `k`-algebra `B` define

```text
F^q_B : B ⊗_k L → B ⊗_k L_s,    Σ_j b_j ⊗ ℓ_j ↦ Σ_j b_j^q ⊗ ℓ_j^q.
```

Prove that it is well defined: `(b, ℓ) ↦ b^q ⊗ ℓ^q` is additive in each variable, as `B ⊗_k L`
has characteristic `p` when `q > 1`, and `k`-balanced, as `λ^q ∈ k` for `λ ∈ k`. Prove that
followed by the injection `B ⊗_k L_s → B ⊗_k L` it is `x ↦ x^q`, and hence that `F^q` is natural
in `B`, multiplicative with `F^q(1) = 1` and homogeneous of degree `q`. It is therefore a
`k`-polynomial law `L → L_s`; its ground map is `IsPurelyInseparable.iterateFrobenius` at the
exponent. When `L_s = k` it is a faithful `k`-valued determinant of dimension `q` on `L`
([Chenevier](https://arxiv.org/pdf/0809.0415v2), Example 2.9, p.28, and the construction before
Theorem 2.16, p.31). *Needs:* Mathlib `PolynomialLaw`, `separableClosure`,
`IsPurelyInseparable.HasExponent`, `IsPurelyInseparable.exponent`,
`IsPurelyInseparable.iterateFrobenius`.

**Checks.**

- If `L = L_s`, for instance in characteristic zero or for `ℂ/ℝ`, then `q = 1` and `F^1` is the
  identity law: the degenerate case, which a construction always raising to the `p`-th power would
  fail.
- For `k = 𝔽₂(u, v)` and `L = k(√u, √v)` the exponent is `(1, 2)` and `F²(√u) = u`, a law of
  degree `2`. Mathlib's `Algebra.norm k` on `L` has degree `[L : k] = 4` and sends `√u` to `u²`,
  so the field norm is not this law.
- For `k = 𝔽_p(u₁, u₂, …)` and `L = k(u_i^{1/p} : i ≥ 1)` the exponent is `(1, p)` although
  `[L : k]` is infinite: `F^p` has degree `p`, whereas `Algebra.norm k` on `L` is identically `1`
  by `Algebra.norm_eq_one_of_not_module_finite`.
- Over `B = k[t]`, `F^q(t ⊗ ℓ) = t^q ⊗ ℓ^q`: the coefficients are raised to the `q`-th power too.
  In the `𝔽₂(u, v)` example, extending the ground map `B`-linearly by `b ⊗ ℓ ↦ b ⊗ ℓ²` is not well
  defined, since `u ⊗ 1 = 1 ⊗ u` would go to both `u ⊗ 1` and `u² ⊗ 1`.

**Norm determinant of a central simple algebra.** Let `L/k` have finite exponent `(f, q)` and let
`C` be a central simple `L`-algebra of degree `n`, so `dim_L C = n²`; it is Azumaya over `L` of
constant rank `n²` ([SemisimpleAlgebras, layer 4][semisimplealgebras4]). Regard its reduced norm
`Nrd_{C/L}` as a `k`-polynomial law `C → L`, evaluating it at `B ⊗_k L` through
`B ⊗_k C ≅ (B ⊗_k L) ⊗_L C`, and let `N_{L_s/k} = det ∘ Algebra.leftMulMatrix b`
for a `k`-basis `b` of `L_s`. Define, with `PolynomialLaw.comp`,

```text
δ_C = N_{L_s/k} ∘ F^q ∘ Nrd_{C/L} : C → k.
```

Prove that `δ_C` is a `k`-valued determinant of dimension `n f q` on the `k`-algebra `C`,
independent of `b`. Let `ι : L_s →ₐ[k] L` be the canonical inclusion and
`z_c : L_s = ⟨Nrd_{C/L}(c)^q, h_c⟩`, where `h_c` is membership in the separable-closure
subfield supplied by the exponent condition, so `ι(z_c)=Nrd_{C/L}(c)^q`. Its ground value at
`c ∈ C` is `Algebra.norm k z_c`, with domain `L_s`, the finite separable extension of `k`. Prove also
that `L ⊗_k k^sep` is a product of `f` fields `L_i`, each separably closed, purely inseparable over
`k^sep` of exponent `q` and permuted transitively by `Gal(k^sep/k)`, and that the scalar extension
of `δ_C` to `k^sep` is the product of the `δ_{C ⊗_L L_i}`
([Chenevier](https://arxiv.org/pdf/0809.0415v2), the construction before Theorem 2.16, p.31, and
the proof of Lemma 2.17, p.32). *Needs:* The Frobenius law of a finite-exponent extension, Azumaya
reduced-norm determinant, The determinant of a matrix representation, Scalar extension of
determinants, Mathlib `PolynomialLaw.comp`, `Algebra.leftMulMatrix`, `Algebra.norm_eq_matrix_det`,
`Algebra.FormallyEtale.equivPiOfIsSepClosed`.

**Checks.**

- For `C = L = ℂ` over `k = ℝ`, `(n, f, q) = (1, 2, 1)` and `δ_ℂ(a + bi) = a² + b²`: a
  construction omitting the separable norm would not be `ℝ`-valued.
- For the Hamilton quaternions over `L = k = ℝ`, `δ_ℍ = Nrd` has dimension `2`, while the
  determinant of the left regular representation `ℍ → M₄(ℝ)` is `Nrd²`: a construction through
  the regular representation of `C` over `k` would have the wrong dimension.
- For `k = 𝔽₂(u,v)`, `L = k(√u,√v)`, `C=L` and `c=√u`, `z_c=u` in `L_s=k`,
  so `δ_C(c)=N_{L_s/k}(z_c)=u`; applying `N_{L/k}` to `z_c=u` instead would give
  `N_{L/k}(z_c)=u⁴`, whereas `N_{L/k}(c)=u²`.
- For `k = 𝔽₂(u, v)`, `L = k(√u, √v)` and `C = M₂(L)`, `δ_C = (det)²` has values in `k` and
  dimension `n f q = 4`, whereas `Algebra.norm k ∘ det` has dimension `n [L : k] = 8`: the
  inseparable factor enters through `q = 2`, not through `[L : L_s] = 4`.

**Determinants on central simple algebras over finite-exponent extensions.** For `L/k` of finite
exponent `(f, q)` and a central simple `L`-algebra `C` of degree `n`, prove that every `k`-valued
determinant `D` of dimension `d` on the `k`-algebra `C` equals `δ_C^m` as polynomial laws for a
unique `m ≥ 0`, so that `d = m n f q`. Uniqueness is homogeneity. A determinant is determined by
its scalar extension along an injective coefficient map, by the determinant coordinate ring, so
it suffices to work over `k′ = k^sep`, where `δ_C` is the product of the `δ_{C ⊗_L L_i}` and `D`
is a product of determinants `D_i` on the factors `C ⊗_L L_i`. Each factor is split, by the étale
matrix splitting of `C` and `Algebra.FormallyEtale.equivPiOfIsSepClosed`. On a factor write
`K = L_i`, so `C ⊗_L K ≅ M_n(K)`, and extend scalars to `K`: the kernel `I` of
`K ⊗_{k′} K → K` is generated by elements `x ⊗ 1 − 1 ⊗ x` whose `q`-th powers vanish, so every
finitely generated `I₀ ⊆ I` is nilpotent and the nilpotent two-sided ideals `M_n(I₀)` lie in the
kernel. The extended determinant factors through `M_n(K)`, where it is `det^s` with `d_i = ns`:
for `d_i ≥ 1` it is faithful, `M_n` being simple, so after extension to an algebraic closure
Determinants on split simple factors and the inner conjugacy of automorphisms of `M_n` apply, and
the result descends by injectivity. The values `a^s` of `D_i` at `diag(a, 1, …, 1)` lie in `k′`
for all `a ∈ K`, which forces `q ∣ s`, because an element purely inseparable over `k′` whose
`u`-th power lies in `k′` with `p ∤ u` lies in `k′`. Hence `D_i = δ_{C ⊗_L K}^{s/q}`, and Galois
equivariance makes the `f` exponents equal
([Chenevier](https://arxiv.org/pdf/0809.0415v2), Lemma 2.17 and its proof, pp.31–32, with Lemma
2.15, p.30). *Needs:* Norm determinant of a central simple algebra, Determinant coordinate ring,
Scalar extension of determinants, Determinants on product algebras, Nilpotent ideals vanish under
field determinants, The induced law on M/Ker(P) is faithful, Restriction of determinants,
Determinants on split simple factors, SchemeAndStackFoundations §2.22
`IsAzumaya.exists_etale_matrix_splitting`, Mathlib `Algebra.FormallyEtale.equivPiOfIsSepClosed`,
Tau Ceti `TauCeti.exists_unit_conj_of_algEquiv`.

**Checks.**

- For `C = L = ℂ` over `k = ℝ`, the `ℝ`-valued determinants on `ℂ` are the powers of the norm,
  all of even dimension. By One-dimensional determinants are algebra homomorphisms, a
  dimension-one determinant would be an `ℝ`-algebra map `ℂ → ℝ`, so a classification admitting
  `z ↦ z` would fail.
- For the Hamilton quaternions over `ℝ`, the determinant of the left regular representation on
  `ℝ⁴` is `δ_ℍ²`, with `m = 2`, `n = 2` and `f = q = 1`.
- For `k = 𝔽₂(u, v)` and `C = L = k(√u, √v)` the determinants are `(F²)^m` of dimension `2m`.
  The field norm is the case `m = 2`, so a classification by powers of `Algebra.norm k` would miss
  every odd `m`, beginning with `F²` itself.

**Faithful quotients over arbitrary fields.** For any field `k` and a determinant `D : R → k` of
dimension `d ≥ 1`, prove that there are finitely many, and at least one, field extensions `k_i/k`
of finite exponent `(f_i, q_i)` and central simple `k_i`-algebras `S_i` of degree `n_i ≥ 1`, with a
`k`-algebra isomorphism `R/ker D ≅ ∏_i S_i` under which the induced law of `D` is the product
`∏_i δ_{S_i}^{m_i}` of polynomial laws, with uniquely determined `m_i ≥ 1` and
`d = Σ_i m_i n_i f_i q_i`; positivity of the `m_i` is faithfulness. In particular `R/ker D` is
semisimple, and it is finite over `k` exactly when every `k_i` is, which holds if `k` is perfect,
if `char k = p > 0` with `[k : k^p] < ∞`, or if `d < p`; over an arbitrary imperfect `k` it can
fail. The proof checks the hypotheses of Lemma 2.14 with `n = d + 1` for `R/ker D` and its
separable base change, applies the center bounds, splits `D` along the product and classifies each
factor ([Chenevier](https://arxiv.org/pdf/0809.0415v2), Theorem 2.16, pp.31–32). *Needs:*
The induced law on M/Ker(P) is faithful, Faithful determinants are Cayley–Hamilton, Separable
algebraic base change of the determinant kernel, Field Cayley–Hamilton radical and kernel, Bound on
orthogonal nonzero corners, Centers of bounded algebraic semisimple factors, Determinants on
product algebras, Determinants on central simple algebras over finite-exponent extensions.

**Checks.**

- For `k = 𝔽_p(u₁, u₂, …)`, `R = L = k(u_i^{1/p} : i ≥ 1)` and `D = F^p` of dimension `p`, `D` is
  faithful with one factor `S_1 = k_1 = L` and `(n, f, q, m) = (1, 1, p, 1)`, and `R/ker D = L` is
  infinite-dimensional over `k`: finite dimension over every field would be false, and a dimension
  formula with `[k_1 : k]` in place of `f_1 q_1` would be meaningless.
- For `R = ℂ × ℝ` over `ℝ` and `D(z, x) = |z|² x` of dimension `3` there are two factors, with
  `(n, f, q, m)` equal to `(1, 2, 1, 1)` and `(1, 1, 1, 1)`: a formula `Σ m_i n_i` without the
  separable degrees would give `2`.
- For `R = ℍ` over `ℝ`, the reduced norm and the determinant of the regular representation have
  the same faithful quotient `ℍ`, with `m = 1` and `m = 2`: the multiplicities are read from the
  law, not from the algebra.

**Residual determinant properties.** For `D : R → A` with `A` local and residue field `k`, the
residual determinant is `D̄ : R/mR → k`. It is split when its faithful quotient `(R/mR)/ker(D̄)` is
a finite product of full matrix algebras over `k`; absolutely irreducible if its reconstructed
representation over `k̄` is irreducible; multiplicity-free if that representation has pairwise
inequivalent irreducible constituents. Splitness and absolute irreducibility are independent; a
`k`-representation realizing `D̄` is weaker than splitness. Define the residual determinant as the
scalar extension to `A/m`; splitness as the condition that the faithful quotient is a
finite product of full matrix algebras over `k`, expressed by a surjective map with kernel
`ker D` (mere `k`-linear realizability is insufficient); absolute irreducibility as
positive-dimensional irreducibility after algebraically closed coefficient extensions,
independently of splitness over the base field; and multiplicity-freeness as the
condition that every simple constituent occurs once after algebraic closure
([Chenevier](https://arxiv.org/pdf/0809.0415v2), Definition-Proposition 2.18 and Definition 2.19, pp.32–33;
splitness equivalence). *Needs:* Scalar extension of determinants,
Semisimple reconstruction of field determinants.

Where the residual determinant is given together with a representation `ρ̄` realising it, as in
henselian reconstruction, coefficient descent and Layer 3b, absolute irreducibility is stated on
that representation: `IsAbsolutelyIrreducible` asks of the family of matrices `ρ̄(g)` that `d > 0`
and that after every extension to an algebraically closed field no proper nonzero subspace is
stable. Two copies of the trivial character are not absolutely irreducible, while every character
is.

**Checks.**

- Residue-field base change of the degree-zero matrix determinant has value `1` at `0`;
  the scalar determinant over `ℚ` has residual value `7` at `1 ⊗ 7`; and the two-by-two
  determinant has residual value `2·7−3·5=−1` at `1 ⊗ [[2,3],[5,7]]`. These distinguish
  degree zero from a zero law, degree one from a squared scalar law, and the determinant
  from the diagonal product.
- A one-dimensional character determinant is split and absolutely irreducible: its faithful
  quotient is `k` itself and the representation is a line, so a definition of splitness that
  required a nontrivial matrix block, or of irreducibility that excluded dimension one, would fail.
- `χ²` is split but not multiplicity-free, including in characteristic two: the two constituents
  coincide, so a definition that tested multiplicity-freeness only through distinct traces would
  wrongly accept it when `2χ = 0`.
- `χψ` for distinct `k`-valued characters is split, multiplicity-free and reducible: the two
  constituents are distinct lines, so a definition conflating multiplicity-free with absolutely
  irreducible would misclassify it.
- The Hamilton quaternion reduced norm over `ℝ` is absolutely irreducible and not split over `ℝ`:
  over `ℂ` it becomes `det` on `M₂(ℂ)`, while over `ℝ` the faithful quotient is a division
  algebra, so a definition identifying splitness with absolute irreducibility would fail.
- The norm `ℂ → ℝ` is realized by the real regular representation and is geometrically
  multiplicity-free, but its faithful quotient `ℂ` is not a product of matrix algebras over `ℝ`,
  so it is not split; a definition of splitness by mere `k`-linear realizability would wrongly
  call it split.

### 1.3 Henselian lifting and generalized matrix algebras

**Radical of a local Cayley–Hamilton algebra.** For `D : R → A` Cayley–Hamilton with `A` local,
prove that `Rad(R)` is the inverse image of `ker D̄` under `R → R/mR`
([Chenevier](https://arxiv.org/pdf/0809.0415v2), Lemma 2.10(i), p.28). *Needs:* Residual determinant properties.

**Henselian lifting of matrix units.** Let `A` be henselian local and `R` integral over `A`, with
`R/Rad(R) ≅ ∏_i M_{d_i}(k)`. Prove that a complete orthogonal family of diagonal idempotents and
matrix units in each block lifts to `R`, with the corresponding multiplicative relations. The proof
establishes simultaneous orthogonal idempotent and matrix-unit lifting in an integral algebra over a
henselian local ring; the algebra need not be finite as an `A`-module, so a finite-algebra lifting
theorem alone is insufficient ([Chenevier](https://arxiv.org/pdf/0809.0415v2), Proof of Theorem 2.22, p.34).
*Needs:* Radical of a local Cayley–Hamilton algebra.

**Rank-one Cayley–Hamilton algebras.** Prove that a degree-one Cayley–Hamilton determinant
`D : R → A` makes `algebraMap A R` an isomorphism with inverse `D`; every element `x` equals
`D(x)·1` ([Chenevier](https://arxiv.org/pdf/0809.0415v2), Lemma 2.6, p.26). *Needs:* Cayley–Hamilton algebras, One-dimensional determinants are algebra homomorphisms.

**Reconstruction from rank-one corners.** Prove that if `R` has a complete `d × d` matrix-unit
system `E_ij` and `E_ii R E_ii = A E_ii` with faithful scalar map, the map `M_d(A) → R`,
`(a_ij) ↦ ∑ a_ij E_ij`, is an `A`-algebra isomorphism ([Chenevier](https://arxiv.org/pdf/0809.0415v2), Proof of
Theorem 2.22(i), p.34). *Needs:* Henselian lifting of matrix units, Rank-one Cayley–Hamilton algebras.

**Inner conjugacy of local matrix algebras.** For a commutative local ring `A`, a positive matrix
size `d > 0` and an `A`-algebra automorphism `f` of `M_d(A)` (an algebra equivalence), prove that
`f` is conjugation by an invertible matrix `P`. Applied to the two full-matrix identifications of
the same residually absolutely irreducible Cayley–Hamilton quotient, it conjugates their group
representations ([Allen–Newton–Thorne](https://arxiv.org/pdf/1912.11269v2), Proof of Theorem 2.4, p.5;
[Caraiani–Newton](https://arxiv.org/pdf/2301.10509v3), Proof of Proposition 3.2.4(3), p.50). *Needs:* Mathlib
`Matrix.toLinAlgEquiv'`, `Module.Projective`, `Module.free_of_flat_of_isLocalRing`,
`Module.Flat.of_projective`.

**Checks.**

- For `d=1`, every `A`-algebra automorphism is the identity and `P=1` suffices.
- Over `ℤ₃`, conjugation by `[[1,1],[0,1]]` sends `E₀₀` to `[[1,−1],[0,0]]`.
- Over any local `A`, conjugation by the swap matrix exchanges `E₀₀` and `E₁₁`;
  the identity automorphism is implemented by `1`, regardless of nilpotents in `A`.

**Henselian irreducible reconstruction.** For a dimension-`d` Cayley–Hamilton `D : R → A` over
henselian local `A`, prove that if `D̄` is split and absolutely irreducible then `R ≅ M_d(A)` and
`D` is the matrix determinant. Applying this to `R = A[G]/CH(D)` reconstructs an actual
`G → GL_d(A)`. Without residual splitness a central-simple obstruction remains
([Chenevier](https://arxiv.org/pdf/0809.0415v2), Theorem 2.22(i), p.34). *Needs:* Reconstruction from rank-one corners,
Inner conjugacy of local matrix algebras.
The group-algebra form is the Lean target: a determinant on `A[G]` whose coefficient change to the
residue field is `det ∘ ρ̄` for a representation `ρ̄` that is absolutely irreducible as a matrix
family (so that `D̄` is split, the image of `ρ̄` being `M_d(k)`) is `det ∘ ρ` for a representation
`ρ : A[G] → M_d(A)`, unique up to conjugation.
*Lean:* `Determinant.exists_realization_of_henselian`.

**Generalized matrix algebra.** A GMA of block sizes `(d_i)` over `A` is an `A`-algebra `R` with
orthogonal idempotents `e_i` summing to one, isomorphisms `e_i R e_i ≅ M_{d_i}(A)`, and a cyclic
`A`-linear trace equal to the usual matrix trace on each diagonal block. Primitive matrix units
identify off-diagonal blocks with `M_{d_i,d_j}(A_ij)`; multiplication comes from associative
pairings `A_ij ⊗ A_jk → A_ik`. Define GMA data as the idempotents, corner matrix algebra
isomorphisms and cyclic trace, and the entry module `A_ij = E_i,11 R E_j,11`. Prove the Peirce
decomposition `R ≅ ⊕_(i,j) e_i R e_j` as `A`-modules and that the off-diagonal
multiplication pairings are associative ([Bellaïche–Chenevier](https://arxiv.org/pdf/math/0602340v2), Definition 1.3.1,
§1.3.2 and Lemma 1.3.5, pp.20–22). *Needs:* The trace of a determinant is a pseudocharacter.

**Checks.**

- For `R = M_d(A)` partitioned into blocks, every `A_ij = A`: the primitive-unit corners compute
  the scalar ring, so a definition whose entry module were the whole block `e_i R e_j` rather than
  its `(1,1)`-corner would return `M_{d_i,d_j}(A)` here.
- For upper triangular `2 × 2` matrices, `A_12 = A` and `A_21 = 0`: the zero lower entry module is
  the degenerate case, which a definition demanding nonzero entry modules would exclude. The zero module is free.
- For `R = [[A, J], [A, A]]` with a nonprincipal ideal `J`, `A_12 = J` need not be free: a
  definition that assumed free entry modules, or a `d`-dimensional free representation, would
  fail on this GMA.

**Adapted GMA representation ring.** For a GMA with entry modules `A_ij`, the functor of
representations that are the prescribed standard representations on diagonal blocks is
represented by `Sym_A(⊕_{i≠j} A_ij)` modulo the relations `xy − φ_ijk(x, y)`, and the universal
map `R → M_d(B_ad)` is universally injective as an `A`-module map. The proof constructs an
`A`-linear splitting of the universal adapted representation, compatible with coefficient
extension; merely imposing the pairing relations in a symmetric-algebra quotient does not prove
injectivity. Define the adapted ring `B_ad` as the symmetric-algebra quotient by the pairing
relations and the universal adapted representation `R → M_d(B_ad)`, universally injective.
Prove that `A`-algebra maps from `B_ad` to `B` correspond to adapted
representations ([Wang–Erickson](https://sites.pitt.edu/~caw203/pdfs/algfam.pdf), §2.3, pp.15–16; BC09 Propositions 1.3.9 and
1.3.13). *Needs:* Generalized matrix algebra.

**Checks.**

- For one block `M_d(A)`, `B_ad = A`: there are no off-diagonal entry modules, so a definition
  that adjoined variables for diagonal entries would produce a larger ring.
- For the full `2 × 2` matrix algebra, `B_ad = A[b, c]/(bc − 1)`, with off-diagonal entries
  `b, c`: the pairing `A_12 ⊗ A_21 → A` is the identity, so a definition that forgot the relation
  `xy − φ(x, y)` would give the polynomial ring `A[b, c]`.
- For upper triangular `2 × 2` matrices, `B_ad = A[b]` and the universal upper entry is `b`: the
  zero lower entry contributes no variable and no relation, so a definition that produced a
  relation from the zero pairing would collapse `b`.

**Canonical GMA determinant.** A dimension-`d` GMA has a canonical Cayley–Hamilton determinant
`D_E : R → A`, given by the signed cycle product of its scalar corner pairings; it has the
prescribed cyclic trace and agrees after any scalar extension with the determinant of the universal
adapted representation. No factorial is inverted. Define `D_E` as the signed
cycle-product homogeneous law. Prove that the trace of `D_E` is the given GMA trace, that every
adapted representation realizes `D_E`, and the same equality of full laws after scalar extension,
for every adapted representation obtained from the universal one by an algebra map `f : B_ad → B`
([Wang–Erickson](https://sites.pitt.edu/~caw203/pdfs/algfam.pdf), Proposition 2.23 and proof, pp.16–17). *Needs:* Adapted GMA representation ring, The determinant of a matrix representation.

**Checks.**

- For `[[a, b], [c, d]]` with scalar blocks, `D_E = ad − φ(b, c)`: the two-cycle term carries the
  pairing and a minus sign, so a definition with the wrong sign or with `bc` in place of `φ(b, c)`
  would differ.
- For triangular matrices it is the product of diagonal determinants: the only nonzero cycles are
  the trivial ones, so a definition that did not kill cycles through a zero entry module would
  fail.
- Over `𝔽₂` the determinant still detects a repeated scalar character although its trace is zero:
  `D_E = χ²` while `Tr = 2χ = 0`, so a definition that recovered `D_E` from its trace would lose
  it.

**Ordered residual GMA constituents.** For henselian local `A` with residue field `k` and GMA data
`E` on `S` with block sizes `nᵢ`, the residual dictionary consists of algebra representations
`ρ̄ᵢ : k ⊗ₐ S → M_nᵢ(k)` whose determinants are absolutely irreducible, whose vector modules are
pairwise nonisomorphic, with `ρ̄ᵢ(eⱼ) = δᵢⱼ`, the diagonal identifications reducing to `ρ̄ᵢ` on
`eᵢ S eᵢ`, and the residual GMA determinant equal to the product of these determinants as a law.
For `J ⊆ mₐ`, a factor over `A/J` is reduced through `A/J → k` and
`k ⊗_(A/J) ((A/J) ⊗ₐ S) ≅ k ⊗ₐ S`. Define the residual data as the ordered residual
representations with absolute irreducibility, nonisomorphism, projector equations, diagonal
compatibility and the full-law product; take `Ideal.Quotient.factorₐ A hJ` as `A/J → k` for
`J ⊆ mₐ`; define the transport isomorphism `k ⊗_(A/J) ((A/J) ⊗ₐ S) ≅ k ⊗ₐ S` for associative `S`,
and the residual factor, the reduction of a determinant over `A/J` to `k ⊗ₐ S` along it
([Allen–Newton–Thorne](https://arxiv.org/pdf/1912.11269v2), Theorem 2.4, Proposition 2.5 and proof, pp.5–6;
[Bellaïche–Chenevier](https://arxiv.org/pdf/math/0602340v2), §1.4.1 and Lemma 1.4.3, pp.29–30). *Needs:* Canonical GMA determinant, Residual determinant properties.

**Checks.**

- On the `i`-th residual constituent, `eᵢ` has characteristic polynomial `(X − 1)^nᵢ` and `eⱼ`,
  `j ≠ i`, has characteristic polynomial `X^nᵢ`: the projector equations `ρ̄ᵢ(eⱼ) = δᵢⱼ` compute
  these, so data in which a constituent did not see its own idempotent as the identity would fail.
- For `S` the upper triangular algebra over a field and `x = [[a, b], [0, c]]`, the ordered
  residual characters evaluate at `a` and `c` and their determinant product evaluates at `ac`:
  the full-law product is `det`, so a definition that ordered the characters the other way or
  dropped one would not match the GMA determinant.
- Two labelled isomorphic residual modules cannot be residual dictionary data, even if the
  determinant product has the requested total degree: pairwise nonisomorphism is part of the
  definition, so a definition checking only the degree sum would wrongly accept them.

**Multiplicity-free henselian GMA structure.** For a Cayley–Hamilton `D` over henselian local `A`
with split multiplicity-free `D̄`, prove that its algebra and trace admit a GMA decomposition with
block sizes the residual constituent dimensions. This does not make off-diagonal modules free or
yield a `d`-dimensional free representation over `A` ([Chenevier](https://arxiv.org/pdf/0809.0415v2), Theorem
2.22(ii), p.34). *Needs:* Henselian irreducible reconstruction, Ordered residual GMA constituents.

**Conjugacy of adapted henselian GMA data.** Let `A` be henselian local and `D : R → A`
Cayley–Hamilton, with fixed ordered, pairwise nonisomorphic, absolutely irreducible split
residual representations `ρ̄_i` whose determinant product is `D̄`. For any two adapted data
`(e_i,ψ_i)` and `(e′_i,ψ′_i)` on this same algebra, prove that a unit `u ∈ Rˣ` satisfies
`ue_i u⁻¹=e′_i` and `ψ′_i(uxu⁻¹)=ψ_i(x)` for every `x ∈ e_i R e_i`.
First compare the two complete orthogonal families modulo `Rad(R)`; their ordered block
projectors coincide. The element `u₀=∑_i e′_i e_i` is `1` modulo `Rad(R)`, hence a
unit, and satisfies `u₀e_i=e′_iu₀`. Then correct the corner identifications by a block-diagonal unit, applying
local matrix inner conjugacy in each positive-size block. Conjugation transports primitive
entry modules and their multiplication pairings ([Allen–Newton–Thorne](https://arxiv.org/pdf/1912.11269v2),
Theorem 2.4 and proof, p.5; [Bellaïche–Chenevier](https://arxiv.org/pdf/math/0602340v2),
Lemma 1.4.3 and Theorem 1.4.4(i), pp.30–31). *Needs:* Multiplicity-free henselian GMA structure,
Radical of a local Cayley–Hamilton algebra, Inner conjugacy of local matrix algebras.

**Checks.**

- In one block `R=M_d(A)`, the block idempotent is `1`; an inner change of `ψ` is
  corrected by its implementing unit even though the block idempotent stays fixed.
- In the upper-triangular algebra over henselian local `A`, `u=[[1,t],[0,1]]` takes
  `e₁=E₀₀` to `[[1,−t],[0,0]]` and `e₂` to its complement, preserving the two ordered
  residual characters; both corner scalar identifications remain the identity.
- For `R=A×A` with its two labelled residual characters, the ordered projectors are
  fixed by every inner conjugation. Exchanging their labels is excluded by the fixed
  residual dictionary; the identity data are conjugate by `1`.

### 1.4 Reducibility ideals and quotient extensions

**Partition reducibility for determinants.** For henselian local `A`, a determinant `D` with
split multiplicity-free residual law `∏ det ρ̄ᵢ` and a partition `P` of these labelled
constituents into nonempty parts, there is a canonical ideal `I_P`: for each `J ⊆ mₐ`, `I_P ⊆ J`
iff a unique family of determinant factors `F_m` of degrees `∑_(i∈P_m) nᵢ` satisfies
`D mod J = ∏ F_m` and `F_m mod mₐ = ∏_(i∈P_m) det ρ̄ᵢ`; the kernel of `D mod J` lies in every
factor kernel. For any quotient `R → S` with `CH(D) ⊆ ker(R → S) ⊆ ker D` and adapted residual
GMA data `E`, `I_P` is the sum of opposite primitive-entry pairing ideals between different parts,
independent of the quotient and the data. If `d!` is invertible, traces recover BC09 Proposition
1.5.1; the trace corollary alone requires `d!` invertible. The proof compares adapted data by inner
conjugacy, reduces to the zero pairing ideal, and uses the determinant kernel criterion to kill
cross-part entries; the faithful quotient then decomposes into part corners. Conversely residual
degree zero puts each other-part idempotent in the factor kernel. This proves uniqueness and
factor-kernel containment without replacing full laws by traces. Define
`I_P` as the sum of opposite primitive-entry pairing ideals over pairs
in different partition parts. Prove that for chosen Cayley–Hamilton GMA
data with its residual dictionary, `I_P ⊆ J` iff a unique family of factors has the specified
degrees, full product law and residual products ([Bellaïche–Chenevier](https://arxiv.org/pdf/math/0602340v2), Proposition
1.5.1, pp.32–34; [Allen–Newton–Thorne](https://arxiv.org/pdf/1912.11269v2), Proposition 2.5 and its entire proof, pp.5–6).
*Needs:* Ordered residual GMA constituents, Conjugacy of adapted henselian GMA data,
The kernel contains the Cayley–Hamilton ideal, A determinant is determined by its trace when d! is invertible.

**Two-block determinant reducibility ideal.** For a henselian local `A` and a two-block
Cayley–Hamilton GMA `(S, D_E)` with ordered residual dictionary `(ρ̄ᵢ, ρ̄ⱼ)`, `i ≠ j`, whose
residual factors are specified, split, absolutely irreducible and distinct, define
`I_red`, the ideal of products of opposite off-diagonal entry modules
`Aᵢⱼ Aⱼᵢ`. Prove that for the same two-block residual dictionary, `D_E`
Cayley–Hamilton and `J ⊆ mₐ`, `I_red ⊆ J` iff there exists a unique ordered pair of determinants
`Fᵢ, Fⱼ` on `(A/J) ⊗ₐ S` of degrees `nᵢ, nⱼ` with `D_E mod J = Fᵢ Fⱼ` as full laws, and with
`Fᵢ mod mₐ = det ρ̄ᵢ` and `Fⱼ mod mₐ = det ρ̄ⱼ` under the canonical residual tensor
identification; and that under a local quotient `A → A/J` the
ideal maps to `I_red(A/J)`. No factorial invertibility is assumed
([Caraiani–Newton](https://arxiv.org/pdf/2301.10509v3), Proposition 3.2.3, p.49, which imports the Allen–Newton–Thorne result;
[Allen–Newton–Thorne](https://arxiv.org/pdf/1912.11269v2), Proposition 2.5 and its entire proof, pp.5–6). *Needs:*
Multiplicity-free henselian GMA structure, Partition reducibility for determinants.

**Checks.**

- For an upper triangular algebra the ideal is zero: `A₂₁ = 0` so `A₁₂A₂₁ = 0`, and the
  determinant factors as the two diagonal characters for every `J`; a definition that used
  `A₁₂ + A₂₁` instead of the product would give a nonzero ideal.
- For `[[A, A], [π^r A, A]]` over a DVR, `I_red = (π^r)`: the product of the entry modules
  computes `π^r A`, so a definition that took the sum of the entry modules would give the unit
  ideal.
- For `M₂(A)` the opposite pairing is the unit ideal; there is no two-block determinant
  factorization with two distinct residual characters, so a definition that admitted a
  factorization modulo the unit ideal (that is, over the zero ring) as witness would wrongly
  declare `I_red ⊆ J` for a proper `J`.
- Over the triangular algebra over any field, including characteristic two, the unique degree-one
  determinant factors are fixed by their ordered residual diagonal characters: a definition that
  identified factors only up to order, or through traces (zero when `2 = 0`), would lose
  uniqueness.

**GMA quotient constituent module.** For GMA `E` on `S`, a labelled partition `P`, a singleton
part `{i}`, and `I_P ⊆ J`, diagonal compression `eᵢ x eᵢ` followed by the chosen matrix
identification and `A → A/J` is an `(A/J)`-algebra representation of `S_J = (A/J) ⊗ₐ S` in
`M_nᵢ(A/J)`. Its quotient constituent `Mᵢ` is the actual vector module `(A/J)^nᵢ` with this action.
If `S` is a chosen quotient of `R`, this same module is restricted along `R_J → S_J` to form the
ambient Ext endpoint. Define, for a singleton part, the quotient representation, the diagonal
compression representation `S_J → M_nᵢ(A/J)`, and the quotient constituent, the vector module
`(A/J)^nᵢ` with the actual compressed `S_J`-action. Prove that on
`1 ⊗ x` the quotient representation is the selected diagonal block `eᵢ x eᵢ`, reduced entrywise
modulo `J` ([Bellaïche–Chenevier](https://arxiv.org/pdf/math/0602340v2), §1.5.4 and Theorems 1.5.5–1.5.6, pp.34–37;
[Allen–Newton–Thorne](https://arxiv.org/pdf/1912.11269v2), Proposition 2.5 and proof, pp.5–6). *Needs:* Partition reducibility for determinants, Mathlib `Matrix.toLinAlgEquiv'`, `Module.compHom`,
`ModuleCat.restrictScalars`.

**Checks.**

- For the upper triangular two-block algebra, the `i`-th rank-one quotient action is the `i`-th
  diagonal entry reduced modulo the same coefficient ideal: `eᵢ x eᵢ` computes that entry, so a
  definition reducing modulo a different ideal, or taking the other diagonal entry, would fail.
- For the triangular algebra over a field, each prescribed rank-one quotient constituent is
  nonzero, excluding arbitrary zero Ext endpoints: the module is `k^1 ≠ 0`, so a definition
  allowing the Ext endpoints to be arbitrary modules would admit the zero module here.
- For the upper triangular algebra over a field, `Ext¹` of the second diagonal constituent by the
  first is one-dimensional, and the endpoints have their actual quotient actions: a definition
  that gave the constituents the wrong action (say the trivial one) would compute a different
  `Ext¹`.

**GMA extension module.** For distinct residual blocks `i, j` of a GMA `S` and a quotient `A/J`
with `J` containing the partition reducibility ideal and singleton parts `i, j`, let
`A′_ij = ∑_{k≠i,j} A_ik A_kj` and `E_ij = A_ij / A′_ij`. The module of linear functionals `E_ij → A/J` is isomorphic to the
module of extension classes of `ρ_j` by `ρ_i` under the hypotheses below. Define the extension
module `E_ij = A_ij / (∑_{k≠i,j} A_ik A_kj)`. Prove that the multiplication
defect of the `ij` block vanishes in `E_ij` and that for two blocks
`E_12 = A_12` ([Bellaïche–Chenevier](https://arxiv.org/pdf/math/0602340v2), §1.5.3, p.35). *Needs:* Partition reducibility for determinants.

**Checks.**

- With two blocks the intermediate sum is zero: there is no `k ≠ i, j`, so `E_12 = A_12`, and a
  definition whose sum ran over all `k` (including `i` and `j`) would quotient by `A_ii A_ij`
  instead.
- For three scalar blocks of `M₃(A)`, `A_13 / A_12 A_23 = 0`: the intermediate path fills the
  entry, so a definition that forgot the intermediate paths would give `E_13 = A ≠ 0`.
- For `[[A, B], [0, A]]`, the upper extension module is `B`: the degenerate zero lower entry
  contributes nothing, so a definition that symmetrised `E_12` with `E_21` would fail.

**GMA extension identification.** Under the hypotheses of the following injection,
prove that `Hom_A(Eᵢⱼ,A/J)` and
`Ext¹_(S_J)(Mⱼ,Mᵢ)` are isomorphic as `(A/J)`-modules. Both endpoints are the specified quotient
constituents of the same ordered residual GMA, and `d!` is invertible in `A`.
This target asserts existence of a linear equivalence; it does not select an extension-class
map or a projective cover. The source proves existence by analyzing a primitive projective
summand and its kernel
([Bellaïche–Chenevier](https://arxiv.org/pdf/math/0602340v2), Theorem 1.5.6(1), pp.36–37,
with the pseudocharacter convention of §1.2.1, p.14).
*Needs:* GMA extension module, GMA quotient constituent module, Mathlib module-category Ext.

**Off-diagonal extension injection.** Let `A` be henselian local with `d!` invertible, `D` a split residually
multiplicity-free determinant on `R`, `q : R → S` a surjective quotient with
`CH(D) ⊆ ker q ⊆ ker D`, GMA data `E` with its ordered residual dictionary and `D_E ∘ q = D` as
laws. Let `P` have distinct singleton parts `{i}, {j}` and `I_P ⊆ J ⊆ mₐ`. With
`Eᵢⱼ = Aᵢⱼ / ∑_(k≠i,j) Aᵢk A_kⱼ` and the quotient vector modules `Mᵢ, Mⱼ` over `S_J`, prove that
there is an injective `(A/J)`-linear map
`Hom_A(Eᵢⱼ, A/J) → Ext¹_(R_J)(q_J* Mⱼ, q_J* Mᵢ)` whose image is the range of restriction of
scalars `Ext¹_(S_J)(Mⱼ, Mᵢ) → Ext¹_(R_J)(q_J* Mⱼ, q_J* Mᵢ)`. The same chosen Cayley–Hamilton
quotient, labelled residual dictionary, singleton parts and quotient constituent modules are used
throughout; neither Ext endpoint is an arbitrary module ([Bellaïche–Chenevier](https://arxiv.org/pdf/math/0602340v2),
Theorem 1.5.5 and proof, pp.35–36). *Needs:* GMA extension identification, Mathlib `CategoryTheory.Functor.mapExtLinearMap`,
`ModuleCat.preservesLimit_restrictScalars`, `ModuleCat.preservesColimit_restrictScalars`.

**Checks for quotient Ext.** Over a field, take two size-one blocks and `J=0`.
A zero lower entry and a one-dimensional upper entry give
`dim Ext¹(M₂,M₁)=1`; reversing the endpoints gives zero; setting both off-diagonal entries to
zero also gives zero. These are checks of the stated Ext endpoints and the existence
identification, including the split case.

For the coboundary convention, `U₅ diag(2,3) U₋₅=[[2,5],[0,3]]`, where
`U_t=[[1,t],[0,1]]`: the upper entry is `t(ψ−χ)`.
With equal characters, `U_t [[1,1],[0,1]] U₋t=[[1,1],[0,1]]`, so the nonzero
upper class cannot be removed by changing the section. Both are computed Checks.

**Extension dimensions bound reducibility generators.** For reduced noetherian henselian local
`A` and a split residually two-block multiplicity-free trace pseudocharacter with `d!` invertible,
prove that the minimal number of generators of `I_red` is at most
`dim_k Ext¹_S/mS(ρ̄₁, ρ̄₂) · dim_k Ext¹_S/mS(ρ̄₂, ρ̄₁)` ([Bellaïche–Chenevier](https://arxiv.org/pdf/math/0602340v2),
Proposition 1.7.1, p.42). *Needs:* Two-block determinant reducibility ideal,
Off-diagonal extension injection.

**Classical Ribet lattice.** Let `A` be a complete DVR with residue field `k` and fraction field
`K`, where `K` is complete, locally compact and nonarchimedean and `A` is exactly its norm unit
ball. Let `G` be a compact Hausdorff topological group and `ρ : G → GL₂(K)` continuous and
irreducible, with characteristic polynomials having coefficients in `A`, whose residual
characteristic polynomials are `(X − χ̄(g))(X − ψ̄(g))` for prescribed distinct characters
`χ̄, ψ̄ : G → kˣ`. Prove that there is an actual `G`-stable finite free full `A`-submodule `L` of
`K²`, with an `A`-basis and an integral representation intertwining the original
`K`-representation, such that in that basis its residual matrices have diagonal `(χ̄, ψ̄)`, lower
entry zero, and upper entry `b(g)` for which no `v ∈ k` satisfies `b(g) = (ψ̄(g) − χ̄(g)) v` for
all `g`. Thus the residual representation is a nonsplit extension of `ψ̄` by `χ̄`; interchanging
the prescribed characters gives the opposite orientation. The proof constructs a stable full
lattice from compactness in the specified locally compact nonarchimedean fraction field, bounds its
entry fractional ideals and rescales to retain a nonzero upper residual extension in the stated
orientation ([Ribet](https://math.berkeley.edu/~ribet/Articles/invent_34.pdf), Proposition 2.1 and proof,
pp.154–155). Ribet states the result for finite extensions of `ℚ_p`; his successive
unipotent-conjugation proof uses precisely the complete discrete valuation hypotheses retained
here, and the compactness assumption supplies the initial stable lattice. *Needs:*
Two-block determinant reducibility ideal, Off-diagonal extension injection, Mathlib `IsDiscreteValuationRing`, `IsFractionRing`, `NormedField`,
`IsUltrametricDist`, `IsAdicComplete`.

*Lean:* `classical_ribet_lattice`.

### 1.5 Universal algebras and coefficient descent

**Universal Cayley–Hamilton algebra.** For a group `G` and `d ≥ 0`, let `Z(G,d)` represent
dimension-`d` determinants on `ℤ[G]`. Define the universal
Cayley–Hamilton algebra `R(G,d) = (Z(G,d) ⊗_ℤ ℤ[G]) / CH(D_univ)`, the CH quotient over `Z(G,d)`,
with the descended determinant and the quotient
map `Z(G,d)[G] → R(G,d)`. Specialization is along an explicit coefficient algebra map
`φ : Z(G,d) → B`, and `D_φ` is the determinant represented by that same map. Maps to a
Cayley–Hamilton algebra carrying a `G`-representation and compatible determinant are uniquely
induced by the quotient: define the lift, the coefficient-compatible map `R(G,d) → S` attached to a
Cayley–Hamilton `D_S` with `D_S ∘ r = D_φ` as laws, and prove that it sends `c·g` to
`r(φ(c) ⊗ g)` and that a coefficient-compatible map with these values
equals the lift. Define the specialization `B ⊗_{Z(G,d)} R(G,d)`
along `φ`, and prove that it is
`B[G]/CH(D_φ)`. Matrix specialization assumes `B` henselian local, `d > 0`, and `D_φ` residually
split absolutely irreducible ([Chenevier](https://arxiv.org/pdf/0809.0415v2), §1.22 and Proposition 1.23,
pp.18–19). *Needs:* The kernel contains the Cayley–Hamilton ideal, Henselian irreducible reconstruction, Mathlib `HenselianLocalRing`.

**Checks.**

- For `d = 1` the universal Cayley–Hamilton algebra equals the universal character ring: the
  Cayley–Hamilton ideal in degree one is generated by the `g − D(g)`, and in this degree the Cayley–Hamilton ideal equals the determinant kernel. This check
  does not distinguish the two ideals.
- For `G = {1}`, `R(G,d) = ℤ` for `d ≥ 1`: the group algebra is `ℤ` and the Cayley–Hamilton
  relation of `1` is `(1−1)^d = 0`, so a construction adding spurious generators would not
  collapse to `ℤ`.
- For henselian local `B` and `d > 0`, if the specialized universal determinant `D_φ` has split
  absolutely irreducible residue, `B ⊗_{Z(G,d)} R(G,d) ≅ M_d(B)`: the base change computes the
  full matrix algebra, so a construction for which base change did not commute with the CH
  quotient would fail.
- The coefficient map `φ` and the residual properties belong to `D_φ` itself: a construction that
  attached them to `R(G,d)` without the specialization would state the matrix isomorphism without
  its hypothesis.

**Absolutely irreducible coefficient descent.** Prove `coefficient_descent`. Let `A ⊂ B` be complete noetherian local rings
with `m_B ∩ A = m_A` and common residue field. For a profinite `G` and continuous
`ρ : G → GL_d(B)`, assume residual absolute irreducibility, stated as `IsAbsolutelyIrreducible`
of the reduced matrices, and `tr ρ(G) ⊂ A`. Prove that `ρ` is
conjugate by `1 + M_d(m_B)` to a representation into `GL_d(A)` ([CHT](https://www.numdam.org/article/PMIHES_2008__108__1_0.pdf), Lemma
2.1.10 and proof, pp.13–15). *Needs:* Henselian irreducible reconstruction, The trace of a determinant is a pseudocharacter.
*Lean:* `coefficient_descent`.

**Symplectic coefficient descent with prescribed multiplier.** Prove `symplectic_coefficient_descent`. Let `A ⊂ B` be complete noetherian
local rings with their maximal-ideal adic topologies and the same residue field of characteristic
`p > 2`, the inclusion being injective, local and inducing that residue identification. Let `G` be
profinite and `ρ : G → GL₄(B)` continuous and residually absolutely irreducible (stated as
`IsAbsolutelyIrreducible` of the reduced matrices), with all traces in `A`. Fix a nondegenerate alternating form `J` over `A`,
alternating and invertible, and a continuous full multiplier `ν : G → Aˣ`, the specified `A`-valued
unit character with its sign, such that `ρ(g)ᵗ J ρ(g) = ν(g) J` over `B`. Prove that there are a
continuous `A`-valued representation `ρ_A` with this same form and full multiplier and a
conjugating `P ∈ GSp(J, B)`, `P ≡ 1 mod m_B`, with `ρ_A(g) = P ρ(g) P⁻¹`. The proof first descends
in `GL₄`, then constructs the descended invertible alternating form with the prescribed multiplier
and selects a symplectic basis, controlling the near-identity conjugator; the `p > 2` hypothesis in
this general result is essential to the cited argument ([Gee–Geraghty](https://arxiv.org/pdf/1001.2044), Lemma 7.1.1 and
proof, p.25). *Needs:* Absolutely irreducible coefficient descent, Full similitude character under duality and twist, Mathlib `IsAdicComplete`, `IsAdic`.

*Lean:* `symplectic_coefficient_descent`.

### 1.6 Compatible local compression

**Cayley–Hamilton recognition of isotypic modules.** Let `A` be henselian local,
`ρ : G → GL_d(A)` have split absolutely irreducible residual representation, and `M` be an
`A[G]`-module with compatible `A`-action annihilated by `CH(det ρ)`. Prove that there is an
`A`-module `N` and a `G`-equivariant `A`-linear isomorphism `M ≅ A^d ⊗_A N`,
with `G` acting through `ρ` on the first factor ([Chenevier](https://arxiv.org/pdf/0809.0415v2),
Theorem 2.22(i) and proof, pp.34–35; matrix-unit module consequence). *Needs:* Henselian irreducible reconstruction.

**Residual projector from a local subgroup.** Suppose two absolutely irreducible global residual
representations are inequivalent and their restrictions to a subgroup `H` have disjoint sets of
simple constituents. Prove that in their product image algebra the central projector `(1, 0)`
belongs to the image of `k[H]` ([Caraiani–Newton](https://arxiv.org/pdf/2301.10509v3), Lemma 3.2.2(1–2), pp.48–49).
*Needs:* Residual determinant properties.

**Integral lift of the local projector.** In the CN23 setup with `Ã` finite flat over a complete
DVR, `Ã[1/p]` a product of fields and integral characteristic coefficients, prove that the local
residual projector lifts to an idempotent `ẽ` in the integral local image algebra, and that it
projects on each specified local subrepresentation, provided its residual constituents are exactly
the selected block ([Caraiani–Newton](https://arxiv.org/pdf/2301.10509v3), Lemma 3.2.2(3–4), pp.48–49). *Needs:* Residual projector from a local subgroup, Henselian lifting of matrix units.

**Global compression modulo reducibility.** For a two-block GMA and `J ⊃ I_red`, prove that
`x ↦ exe` modulo `J` is an algebra homomorphism into `eRe ⊗ A/J` and realizes the unique
determinant factor lifting the selected residual constituent ([Caraiani–Newton](https://arxiv.org/pdf/2301.10509v3),
Proposition 3.2.4(1), p.50). *Needs:* Two-block determinant reducibility ideal,
Integral lift of the local projector.

**Integral compression on a stable local summand.** In the CN23 setup, prove that `x ↦ ẽxẽ` from
`Ã[H]` to `ẽR̃ẽ` is an integral algebra homomorphism when `im(ẽ)` is `H`-stable in every generic
field factor, and that after inverting `p` it is the chosen local subrepresentation
([Caraiani–Newton](https://arxiv.org/pdf/2301.10509v3), Proposition 3.2.4(2), p.50). *Needs:* Integral lift of the local projector.

**Local lifts compatible with global quotient reconstruction.** Let `B → A` be surjective, with `B` local and
`A` henselian local. Let `S` be a `B`-algebra with a two-block GMA `E` of sizes `(d,d)`
and `r : G → Sˣ`. For a subgroup `H`, supply `ρ,σ : G → GL_d(A)` with equal determinant
laws and `ρ` residually absolutely irreducible, with `σ` the reduction of the selected
corner of `r`. Supply `λ : H → GL_d(B)` equal to that corner on `H`. For finitely many
coefficient fields `K_i` over `B`, supply selected representations and bases identifying
`λ ⊗ K_i` with them. There is a `B`-valued representation of `H` reducing to `ρ|_H`,
conjugate over `B` to `λ`, whose base change to every `K_i` is conjugate to the selected
representation. This assertion is algebraic. The common determinant identifies the two
full matrix Cayley–Hamilton quotients; inner conjugacy over `A` and lifting its conjugator
to `B` give the result. In the arithmetic application the projector and compression
constructions supply these data with `B=Ã` finite flat over the DVR and `K_i` its generic
factors ([Caraiani–Newton](https://arxiv.org/pdf/2301.10509v3), Proposition 3.2.4(3) and proof,
p.50). *Needs:* Global compression modulo reducibility, Integral compression on a stable local summand,
Henselian irreducible reconstruction, GMA quotient constituent module, Inner conjugacy of local matrix algebras.

**Checks for the Iwahori fixtures.** The upper unipotent Iwahori unit has matrix
`[[1,1],[0,1]]`, inverse `[[1,−1],[0,1]]`, and square `[[1,2],[0,1]]` for every level ideal.
Both residual diagonal characters of this unit equal one. On `diag(−1,1)` over `ℚ`,
the first diagonal character equals `−1` and the second equals `1`;
both send the identity to one. These computed examples fix the diagonal ordering used above. The
Iwahori sign unit has square one,
conjugates `[[1,1],[0,1]]` to `[[1,−1],[0,1]]`, and has distinct residual diagonal values
`−1,1`. The fixtures rest on the triangular partition, membership of upper-triangular elements
and of matrix entries, the Cayley–Hamilton property of the identity, matrix and product
determinants, idempotence of the diagonal idempotents of sizes three and two, membership in the
diagonal corners, idempotence of the biproduct projections, and membership of the torus
coordinates.


### 1.7 GL reconstruction and generic representation algebras

**GL pseudocharacter reconstruction.** For algebraically closed `k`, a group `Γ` and positive
`d`, prove that every pseudocharacter for the actual
Hopf algebra `TauCeti.GeneralLinear.coordinateHopfAlgebra k d` is realized by a semisimple
representation of `k[Γ]`. The comparison of *Determinants and GLn excursion pseudocharacters*, with
its normalization against `c_{d,i}`, identifies its determinant and every characteristic
coefficient with the supplied invariant evaluation. Uniqueness up to conjugacy is the
uniqueness already stated in *Semisimple reconstruction of field determinants*
(`Determinant.exists_semisimple_realization`).
([Emerson–Morel](https://arxiv.org/pdf/2310.03869v2), Theorem 4.1, pp.13–15;
[Chenevier](https://arxiv.org/pdf/0809.0415v2), Theorem 2.12.) *Needs:* Determinants and GLn
excursion pseudocharacters, Semisimple reconstruction of field determinants.

**Generic Cayley–Hamilton representation algebra.** For a commutative ring `A` and a
Cayley–Hamilton `A`-algebra `(E, D)` finite as an `A`-module, define
a commutative `A`-algebra `A_gen` of finite type and
the universal determinant-preserving `A`-algebra map
`j : E → M_d(A_gen)`. Prove that for every commutative
`A`-algebra `B`, `A`-algebra maps `A_gen → B` are naturally bijective with `A`-algebra maps
`f : E → M_d(B)` satisfying `det ∘ f = D_B`. Finite type does not assert that `A_gen` is finite as
an `A`-module ([BIP](https://arxiv.org/pdf/2110.01638), Lemma 3.1 and proof, pp.10–11). *Needs:* Cayley–Hamilton algebras.

**Checks.**

- For `E = A`, `d = 1`, `D = id`, `A_gen ≅ A`: a degree-one determinant-preserving map is the
  identity, so a construction adding free variables here would fail.
- For `E = M_d(A)`, `D = det`, the identity representation gives a specialization `A_gen → A`: the
  universal property produces the point of `A_gen` corresponding to `id`, which a construction
  without the universal property would not supply.
- For `d = 2` and `E = A × A` with `D(a, b) = ab`, complementary rank-one idempotent matrices vary:
  over a field their coordinate ring has positive dimension and is not finite as a vector space,
  so a construction asserting finiteness of `A_gen` as a module would be false.

**Checks for corner and matrix-block maps.** All scalar matrix examples work over a
commutative base; the invariant-subspace examples use the stated fields or `ℤ`.

| Definition | Computed Check | Degenerate Check | Agreement or non-example Check |
|---|---|---|---|
| `TauCeti.cornerSubmodule A e e` | `e=diag(1,0)` in `M₂(ℤ)` gives `ℤE₀₀` | `e=0` gives zero | `e=1` gives all of `R` |
| `Corner` | The unit at `diag(1,0)` is that matrix | The zero corner is the zero ring | The corner at `1` is `R` as an algebra |
| Lifting into a corner | Lifting `3E₀₀` into the `diag(1,0)` corner retains that matrix | Lifting zero into the zero corner gives zero | Lifting `x` at `e=1` has underlying value `x` |
| Submodules of `matrixModule ρ` as stable subspaces | The coordinate line `ℚ(1,0)` is not stable under the full matrix algebra | The zero submodule is stable | The whole vector space is stable |
| `IsSimpleModule R (matrixModule ρ)` | The natural full-matrix action of positive size over a field is irreducible | The scalar action on `ℚ²` is reducible | The upper-unipotent integral action is reducible |
| `IsSemisimpleModule R (matrixModule ρ)` | The natural full-matrix action over a field is semisimple | The scalar action on `ℚ²` is semisimple | The upper-unipotent integral action is not semisimple |
| GMA block module | Scalar blocks of `M_s(A)` give `AEᵢⱼ` | The lower block of the upper-triangular algebra vanishes | The single block of `M_d(A)` is all of `M_d(A)` |
| Primitive idempotent of a GMA block | Scalar blocks give `Eᵢᵢ` | A single size-one block gives `1` | A single size-two block gives `E₀₀`, not the whole block idempotent |
| Peirce component | The `(0,1)` component of `[[a,b],[c,d]]` is `bE₀₁` | Zero has all components zero | For one block, the component of `1` is `1` |
| GMA pairing | `(aE₀₁)(bE₁₀)=abE₀₀` | The reverse block in the triangular algebra is zero, so its pairing vanishes | In `M₃(ℤ)`, `(2E₀₁)(3E₁₂)=6E₀₂` |
| Partition reducibility ideal `I_P` | Separate labels in `M₂(A)` give `(1)` | A constant label gives zero | Separate labels in the upper-triangular algebra give zero |
| Intermediate products `∑_{k≠i,j} A_ik A_kj` | In `M₃(A)`, the `(0,2)` entry is generated through block `1` | For two blocks and distinct endpoints there is no intermediate block | The upper-triangular two-block example also gives zero |
| Extension module `E_ij` | For `M₂(A)`, the `(0,1)` module is `A` | For `M₃(A)`, the `(0,2)` module is zero | The lower extension module of the upper-triangular algebra is zero |

Irreducibility requires a nonzero vector module. The empty matrix action is not irreducible
while it is semisimple. The positive-dimensional natural
action is irreducible. The three residual predicates have a field as
coefficient ring, so their algebraic-closure tests do not become vacuous over the zero ring.

The Peirce components and the pairings are specified by their underlying
values, `eᵢ r eⱼ` and ordinary multiplication in `R`, respectively.

**Checks for quotient and representation fixtures.** The product determinant on `ℤ×ℤ`
evaluates `(2,3)` to `6` and `(0,3)` to zero, and its polynomial at `(2,3)` is
`X²−5X+6`. The unipotent units `t ↦ [[1,t],[0,1]]` over `ℚ` send `0` to the identity and `2`
to `[[1,2],[0,1]]`; over `𝔽₂` the kernel of this map from `ℤ` is nonzero. The single-block GMA has block idempotent `1`; in size one
its trace at `3` is `3`, while in size two over `𝔽₂` its trace at `1` is zero.

For the Cayley–Hamilton quotient `R/CH(D)`, the empty matrix algebra gives the zero ring, the
full two-by-two matrix algebra is unchanged, and the degree-one law `ℤ[X]→ℤ`, `X↦0`, gives
quotient `ℤ`. Its quotient map kills `X` in the last example and is both injective and surjective
in the matrix example. The faithful quotient `R/Ker(D)` is `ℤ×ℤ` for the product determinant,
`M₂(A)` for the matrix determinant, and `ℤ` for evaluation at zero on `ℤ[X]`.

**Checks for residual specialization.** The residual determinant agrees with scalar extension
to `IsLocalRing.ResidueField A`; its value on `1⊗r` is the residue of `D(r)`; for the product
determinant over `𝔽₂`, the residual trace of `(1,1)` is zero.

**Evaluation contracts.** The corner determinant sends a corner element `x` to
`D(x+1−e)`, with the same formula for every
coefficient algebra, including nonreduced ones, and its degrees satisfy
`r(e)+r(1−e)=d`. The representing equivalence of `B_ad` sends `f : B_ad → B` to the entrywise image
under `f` of the universal adapted representation, which has an `A`-linear retraction.
The latter implies injectivity after arbitrary coefficient extension
(Chenevier, Lemma 2.4, p.25; Bellaïche–Chenevier, Propositions 1.3.9 and 1.3.13,
pp.23 and 27–28).

`Ideal.Quotient.factorₐ_apply_mk` sends the class of `a` to its residue, and
the transport isomorphism sends `c ⊗ ([a] ⊗ r)` to `c·ā ⊗ r`.
The residual factor of `D mod J` is, as an entire law, the residual determinant of `D`.
The two-block identification `E_12 = A_12` sends the quotient class of `x` back to `x`.
These maps use the stated local-ring and ideal-containment hypotheses; tensor transport
allows noncommutative `R` (Allen–Newton–Thorne, Proposition 2.5, pp.5–6;
Bellaïche–Chenevier, §1.5.3, p.35).

The quotient map to `R/CH(D)` is Mathlib's `RingCon.mkₐ` for the ring congruence of `CH(D)`, and
the `A`-algebra structure of `R/CH(D)` is Mathlib's `RingCon` quotient algebra
(`Mathlib/RingTheory/Congruence/Basic.lean`); neither is redefined.
The quotient map `Z(G,d)[G] → R(G,d)` sends `c·g` to the class of `c ⊗ g`;
the specialization isomorphism sends `b ⊗ [g]` to `[b ⊗ g]`.
The representing equivalence of `A_gen` specializes the universal matrix
entrywise, and `A_gen` is of finite type
over `A`, assuming `R` is finite over `A` and `D` is Cayley–Hamilton
(Chenevier, §1.22 and Proposition 1.23, pp.18–19; BIP, Lemma 3.1, pp.10–11).

**Checks for the evaluation contracts.**

| Definition | Three discriminating Checks |
|---|---|
| Universal adapted representation and the representing equivalence of `B_ad` | For the single standard size-two block over `ℤ`, `diag(2,3)` retains entry `2`; `[[0,2],[3,0]]` retains upper entry `2`; `(2E₀₁)(3E₁₀)` retains entry `6` at `(0,0)`. These fix coordinates and multiplication order for the universal map and its specializations. |
| Ordered residual data | One full matrix block of positive size admits its residual data; two size-one blocks with zero lower module admit the two diagonal residual characters; two scalar blocks in the full `M₂(k)` admit no such data. All three use fields `k`, including `𝔽₂`. |
| `Ideal.Quotient.factorₐ` (supplier) | Over `ℚ` with `J=0`, `[7]` maps to `7`; with `J=m` the map is bijective; with `J=0` a nilpotent maps to zero. |
| Residual transport isomorphism | `3 ⊗ ([2] ⊗ 7)` becomes `42`; `1 ⊗ (1 ⊗ (2E₀₁)(3E₁₀))` becomes `1 ⊗ 6E₀₀`; a zero middle coefficient kills a nonzero matrix. |
| Residual factor | The empty determinant takes zero to one; the scalar degree-one law takes `7` to `7`; the matrix `[[2,3],[5,7]]` gives `−1`. The accompanying identification with the residual determinant is at full-law level. |
| Quotient representation | Compression of `2eᵢ+3eⱼ`, `i≠j`, gives `2I`; a cross-block entry acts by zero; the coefficient unit ideal gives zero. |
| Quotient constituent | `2eᵢ+3eⱼ` acts by `2` on the selected vector module; a proper coefficient ideal gives a nonzero module; the unit ideal kills it. |
| Two-block identification `E_12 = A_12` | For standard scalar blocks in `M₂(ℚ)`, `[7E₀₁]` maps to `7E₀₁`, and the inverse retains `−3E₀₁`; over `ℤ`, `[3·(2E₀₁)]` maps to `6E₀₁`. |
| Specialized universal determinant `D_φ` | For the trivial group the scalar `7` has values `1`, `7`, `49` in degrees `0`, `1`, `2`. |
| Quotient map `Z(G,d)[G] → R(G,d)` | Degree zero kills every generator; degree one makes all generators commute; in degree two the two free generators need not commute. |
| Specialization `B ⊗_{Z(G,d)} R(G,d)` | The trivial group in degree zero gives the zero algebra over `ℚ`; degree one gives exactly `ℚ`; degree two gives exactly `𝔽₂` after specialization to that field. |
| Generic representation `j` and the representing equivalence of `A_gen` | Specializing at the identity action retains scalar `7` in size one, the mixed matrix `[[2,3],[5,7]]` over `ℚ`, and `[[1,1],[1,0]]` over `𝔽₂`. These compare the chosen universal map with the inverse of the representing equivalence. |

For the lift and the specialization isomorphism of *Universal Cayley–Hamilton algebra*, use
generators with images
`U=[[1,2],[0,1]]`, `V=[[1,0],[3,1]]` over `ℚ`, and take the coefficient map representing
this same matrix determinant. Then `UV=[[7,2],[3,1]]`, `VU=[[1,2],[3,7]]`, and
`UV−VU=diag(6,−6)`. The six Checks evaluate the lift and the specialization isomorphism on the
product `UV`, the reversed product `VU` and the difference `UV−VU`. The free group on two generators realizes these inputs;
the computations fix the multiplication order and the sign of the two-term difference.
The degree-zero universal algebra is the zero ring; the positive-degree
trivial-group checks above always require `d>0`.

### Examples

The checks of this layer return to a few objects. `M_d(A)` with `det` is Cayley–Hamilton with
`CH = 0`, and the upper-triangular `2 × 2` algebra is Cayley–Hamilton but not faithful (The Cayley–Hamilton ideal, Cayley–Hamilton algebras); the corner
`e = diag(1,1,0)` of `M₃(A)` gives the `2 × 2` determinant, and over `𝔽₂` a rank-two projection
has trace zero but corner degree two (Corner determinant). The Hamilton quaternions
over `ℝ` and the norm `ℂ → ℝ` separate absolute irreducibility from splitness (Residual determinant properties). On the generalized-matrix-algebra side the recurring examples
are `[[A, J], [A, A]]` with a nonprincipal ideal `J` (Generalized matrix algebra),
`B_ad = A[b, c]/(bc − 1)` for `M₂(A)` and `A[b]` for the triangular algebra (Adapted GMA representation ring), `D_E = ad − φ(b, c)` (Canonical GMA determinant),
`[[A, A], [π^r A, A]]` over a DVR with `I_red = (π^r)` (Two-block determinant reducibility ideal), and the one-dimensional `Ext¹` of the triangular algebra (GMA quotient constituent module). For the universal objects: `R(G, 1)` is the universal character
ring and `R({1}, d) = ℤ` (Universal Cayley–Hamilton algebra); `B_{GL₁}^ℤ = O[t, t⁻¹]`
(Universal reductive pseudocharacter ring); and `E = A × A` with `D(a, b) = ab`
has a generic representation ring of positive dimension (Generic Cayley–Hamilton representation algebra).

### Dependencies

Layer IHG.0 throughout (determinants, kernels, the characteristic polynomial law, pseudocharacters,
scalar extension and restriction, Azumaya determinants, continuous determinants,
and the connected reductive pseudocharacters of IHG.0.7 with their invariant coordinate algebras
and evaluations); Layer IHG.3a for the full similitude identity (Full similitude character under duality and twist) consumed by symplectic descent. From Mathlib: `TwoSidedIdeal.span`,
`IsIdempotentElem.Corner`, `Subsemigroup.mem_corner_iff`, `HenselianLocalRing`,
`Matrix.toLinAlgEquiv'`, `Module.Projective`, `Module.compHom`, `ModuleCat.restrictScalars`,
`CategoryTheory.Functor.mapExtLinearMap`, `ModuleCat.preservesLimit_restrictScalars`,
`ModuleCat.preservesColimit_restrictScalars`, `IsDiscreteValuationRing`, `IsFractionRing`,
`NormedField`, `IsUltrametricDist`, `IsAdicComplete`, `IsAdic`, `Module.free_of_flat_of_isLocalRing`
and `Module.Flat.of_projective`. From the roadmaps: SemisimpleAlgebras layers 0, 2, 3 and 4
(radical, Artin–Wedderburn, density, central simple algebras), with Tau Ceti
`exists_unit_conj_of_algEquiv` as the field case of inner conjugacy; ProfiniteCohomology layer 2
for continuous group cohomology;
ReductiveGroups layer 9 through the
invariant coordinate algebras of Layer IHG.0.

## Layer 2: integral and derived Hecke actions

Work over a commutative ring `A`, with modules in the universe of `A` and their standard
module derived category. An action always retains its map `α : H →ₐ[A] End(C)`, with `H`
commutative. Write `T_der = α.range`. Ring multiplication of endomorphisms is composition:
`f*g = g ≫ f`. Cohomological degree one is `M[−1]`; a class in `Ext¹(M,M)` gives a map
`M[−1] → M`. The telescope relation is `[n,x] = [n+1,t x]`, from **identity minus forward
shift**. These conventions apply to every construction below.

### 2.1 Hecke images in the derived category

**Finite morphism modules.** Prove `HeckeImage.derived_hom_finite`: if `A` is noetherian,
`M` is supported on an integer interval `[a,b]`, `N` on `[c,e]`, and each cohomology
module of both objects is finite, then `Hom(M,N)` is a finite `A`-module. Empty support
intervals force the corresponding object to be zero. Induct on the two amplitudes,
using truncation triangles and Mathlib's finite Ext modules. This is the bounded-finite
extension of the endomorphism finiteness argument in
[Boxer–Pilloni, proof of Lemma 2.4.3, p.18](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf).
No finite projective dimension is assumed. Prove that the image `α.range` of any commutative
action on such a `C` is a finite `A`-module, as a submodule of `End(C)`.
*Needs:* `ModuleCat.finite_ext`, `DerivedCategory`.
*Lean:* `HeckeImage.derived_hom_finite`.

**Checks.**

- `(ℤ²)[0]` is supported on `[0,0]` and on `[−1,3]` but not on `[1,1]`.
- An object supported on `[1,0]` is zero.
- `ℤ[0]` has finite cohomology while `(⊕_{n∈ℕ} ℤ)[0]` does not.
- Every object supported on an empty interval has finite cohomology.

**Chain, homotopy and derived images.** Use `AlgHom.range` for each actual action;
use `AlgHom.rangeRestrict`, `Subalgebra.val` and `AlgHom.quotientKerEquivRange` for
its surjection, inclusion and kernel quotient. Prove that a chain action descends to the homotopy
and derived categories, with the formulas `α_K(h) = quotient.map (α(h))` and `α_D(h) = Q.map (α(h))`.
The induced maps of images are the supplier's `AlgHom.subalgebraMap`; their
surjectivity is `AlgHom.subalgebraMap_surjective`. For a K-projective source the
homotopy-to-derived comparison uses `CochainComplex.IsKProjective.Qh_map_bijective`.
This specifies the maps in `T_ch → T_hom → T_der`; no new image carrier is needed.
Source: [ACC, §2.2.3, pp.920–921](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf).
*Needs:* `DerivedCategory.Q`, `DerivedCategory.Qh`, `HomotopyCategory.quotient`.

**Cohomology action and its quotient.** Define the cohomology action of `C` as the
`A`-algebra map from `End(C)` to the product of endomorphism rings of all `H^i(C)`,
with component `homologyFunctor.map f` at `f`. The new content
is assembling the homology functors into this algebra map, not the general range API.
Define the ghost ideal of `C` using `TwoSidedIdeal.ker` of that map, and prove that
membership means every homology map is zero; such an endomorphism is a ghost, and the
predicate `HeckeImage.IsGhost` states exactly this vanishing. For the action `α`,
the action ghost kernel, of the `h` with `α(h)` a ghost, is the ideal in **H**, while the image
ghost ideal is the kernel of cohomology on **α.range**. The former contains `ker α`, which need
not vanish. Define the cohomology image quotient using the supplier's quotient equivalence, with
the codomain identified as the range of the cohomology action composed with `α`; it
sends `[α(h)]` to `(H^i(α(h)))_i`.
Source: [ACC, Lemma 2.2.4 and its setup, p.920](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf).
*Needs:* the preceding image constructions.

**Checks.** Scalar values and the nonzero Ext class distinguish the cohomology action
from the derived action. The two-degree column is in `D(ℤ)`, where
`Ext¹_ℤ(𝔽₂,𝔽₂)=𝔽₂`, computed from the resolution `ℤ --2→ ℤ → 𝔽₂`.

| Definition | Zero-object Check | Scalar Check on `ℤ[0]` | Two-degree Check |
|---|---|---|---|
| Cohomology action | scalar 7 acts by zero | scalar 2 sends 3 to 6 | a nonzero square-zero `X` acts by zero on all cohomology |
| Ghost ideal (`HeckeImage.IsGhost`) | the ideal is zero in the zero endomorphism ring | the ideal is zero | it contains the nonzero `X` |
| Action ghost kernel | the ideal in `ℤ` is the unit ideal | the ideal is zero | for `ℤ[X]` acting on `𝔽₂[0] ⊕ 𝔽₂[−1]`, it is `(2,X)`, while `ker α = (2,X²)` |
| Image ghost ideal | the ideal is the whole zero ring | the ideal is zero | the nonzero class of `X` belongs and the square of the ideal vanishes |
| Cohomology image quotient | the class of scalar 7 maps to zero | the image of the class of 2 sends 3 to 6 | the nonzero derived class of `X` maps to zero, while the class of 1 remains nonzero |

A further Check computes evaluation `X↦0` on `ℤ[0]`: its source ghost
kernel is `(X)` and its image ghost ideal is zero. This distinguishes the two ideals
even without an Ext class. The chain/homotopy distinction is the two-term complex
`A --1→ A`: its identity is nonzero as a chain map for nonzero `A`, but vanishes in
`K(A)` and `D(A)`.

### 2.2 Ghosts and local factors

**Ghost nilpotence and annihilators.** Prove `HeckeImage.ghost_nilpotence`: for `a ≤ b`
and `H^i(C)=0` outside `[a,b]`, any ordered product of `b−a+1` ghosts vanishes. This
is a statement about the full, possibly noncommutative endomorphism ring. In the
proof, truncate a product of `b−a` ghosts below the top degree. Once that truncation
vanishes, the product factors through `C → H^b(C)[−b]`. The remaining ghost factors
through `τ≤b−1 C → C`, so their composite is zero. Prove
the action-annihilator bound: if `I` lies in the action ghost kernel of `α`, then
`I^(b−a+1) ≤ ker α`. Source: [ACC, proof of Lemma 2.2.4, pp.920–921](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf).
*Needs:* the cohomology action and truncation triangles.
*Lean:* `HeckeImage.ghost_nilpotence`.

**Checks and orientation.** On `[a,a]` the exponent is one: every ghost vanishes.
The orientation Check uses the nonzero class `δ : 𝔽₂[−1] → 𝔽₂[0]`: the matrix with
upper-right entry `δ` has square zero, upper-right entry `δ`, and lower-left entry
zero. This pins the degree convention. The order Check computes
`E₀₁E₁₀(2,3)=(2,0)` and `E₁₀E₀₁(2,3)=(0,3)` in the derived endomorphism ring,
pinning the multiplication order.
The two-degree Ext Check of §2.1 shows that exponent two on `[0,1]` cannot be reduced to one.
Nilpotence gives the prime-spectrum comparison by
`PrimeSpectrum.comap_quotientMk_bijective_of_le_nilradical`; maximal ideals correspond
under the supplier's quotient ideal correspondence. These are library applications,
not additional spectrum constructions.

**Finite local factors.** Prove the finite local-factor decomposition: if `A` is
complete noetherian local and `T` is a finite commutative `A`-algebra, there are
`s : ℕ`, finite `A`-algebras `B_i`, and `T ≃ₐ[A] ∏ i : Fin s, B_i`, with each `B_i`
noetherian, local and complete at its own maximal ideal. Allow `s=0` for the zero
algebra. This product decomposition is the algebra input to the summand construction;
the chosen coordinate idempotents are transported by the algebra equivalence.
Source: [Stacks, Lemma 10.160.2](https://stacks.math.columbia.edu/tag/0325).
*Needs:* finite algebras, adic completeness.

**Specified idempotent summands.** For every `C ∈ D(A)` and `e²=e`, define
the localized complex `eC`, with inclusion `i` and
projection `p`, and prove `i ≫ p = 1` and
`p ≫ i = e`. This is idempotent splitting in `D(A)`, for every commutative `A`.
The countable coproduct input is the existence of countable coproducts in `D(A)`; construct
it using coproducts of module complexes and their localization. Source:
[Bökstedt–Neeman, Corollary 1.7, p.213, and Proposition 3.2, pp.221–222](https://www.numdam.org/item/CM_1993__86_2_209_0.pdf).

Construct `H^i(eC) ≅ range H^i(e)` and prove that its composite with the submodule inclusion is
`H^i(i)`. Construct `eC ⊞ (1−e)C ≅ C` and prove that its forward map is the pair of splitting
inclusions. Prove that `eC` is zero iff every `H^i(e)` is zero. These statements
need neither finiteness nor a local coefficient ring; the finite-factor application
uses the preceding paragraph. They are the homology and complementary-summand
consequences of the same splitting argument. *Needs:* idempotent splitting.

**Checks.** All three columns use `C = (ℤ²)[0]`. The splitting objects have ranks
0, 2, 1, respectively.

| Definition | `e=0` | `e=1` | `e(a,b)=(a,0)` |
|---|---|---|---|
| The summand `eC` | zero object | isomorphic to `(ℤ²)[0]` | isomorphic to `ℤ[0]` |
| Projection `p` | the projection of `(2,3)` has coordinate `(0,0)` | it has coordinate `(2,3)` | it has coordinate `(2,0)` |
| Inclusion `i` | that projected vector includes as `(0,0)` | it includes as `(2,3)` | it includes as `(2,0)` |
| `H⁰(eC) ≅ range H⁰(e)` | that projected vector maps to `(0,0)` in the range | it maps to `(2,3)` | it maps to `(2,0)` |
| `eC ⊞ (1−e)C ≅ C` | projecting `(2,5)` to `e` and `(7,3)` to `1−e`, then adding, gives `(7,3)` | the same computation gives `(2,5)` | it gives `(2,3)` |

### 2.3 Operator localization and ordinary parts

**Telescope and homology.** For arbitrary `C ∈ D(A)` and `t ∈ End(C)`, define
the telescope `C[t⁻¹]` with maps `ι_n`
from its successive copies. Prove the stage relation `ι_n = t ≫ ι_(n+1)` and the
distinguished triangle whose
first map on the countable coproduct is `ι_n − t ≫ ι_(n+1)` and whose second map is
the family of telescope inclusions. For a module `M`, the module telescope `M[t⁻¹]` is the
`ModuleCat` packaging of `Module.DirectLimit (fun _ : ℕ => M) (fun i j _ => t^(j-i))`.
Its stage map at `n` is Mathlib's `Module.DirectLimit.of`; `Module.DirectLimit.of_f` gives the
stage relations and `Module.DirectLimit.lift`/`Module.DirectLimit.hom_ext` give its universal
property. Prove that the quotient of `ℕ →₀ M` by the span of
`single n x − single (n+1) (t x)` is linearly equivalent to this colimit, sending
that generator's class to `Module.DirectLimit.of … n x`.
Construct `H^i(C[t⁻¹]) ≅ H^i(C)[H^i(t)⁻¹]` and
prove that it sends `H^i(ι_n)(x)` to `[n,x]`.
Source: [Bökstedt–Neeman, Definition 2.1 and Remark 2.2, p.213](https://www.numdam.org/item/CM_1993__86_2_209_0.pdf).
*Needs:* countable coproducts and exact filtered colimits of modules.

**Comparison with an idempotent.** Construct, for
`e²=e`, `te=et`, an inverse on the selected factor (`u=eue`, `tu=ut=e`), and
nilpotence on the complement (`(t(1−e))^n=0` for some positive `n`), an isomorphism identifying
the telescope with the summand `eC`. Prove that
the initial-copy map followed by this
isomorphism is the splitting projection. This is the invertible/nilpotent
calculation in [Boxer–Pilloni, proof of Lemma 2.4.3, p.18](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf);
the explicit hypotheses here make it valid over every commutative `A`.
*Needs:* the telescope, the splitting and their homology maps.

**Checks.** The following tests use `(ℤ²)[0]`, with `t=e` and input `(2,3)` at
stage one. The comparisons are checked on that vector, not just on object isomorphisms.

| Definition | `e=0` | `e=1` | `e(a,b)=(a,0)` |
|---|---|---|---|
| The telescope `C[t⁻¹]` | rank 0 | rank 2 | rank 1 (these three are assertions about the object) |
| Stage map `ι` | the input has zero homology class | its class is `[0,(2,3)]` | its class is `[0,(2,0)]` |
| `H⁰(C[t⁻¹]) ≅ H⁰(C)[H⁰(t)⁻¹]` | sends it to `[0,(0,0)]` | sends it to `[0,(2,3)]` | sends it to `[0,(2,0)]` |
| Comparison with `eC` | after inclusion the coordinate is `(0,0)` | it is `(2,3)` | it is `(2,0)` |

For the module telescope and its stage maps, zero transition kills `[7,3]`;
identity transition identifies `[n,x]` with `x`; the first projection
identifies `[n,(a,b)]` with `a`. **Two-term sign Check:** for `t=−1`,
`[0,3]+[1,3]=0`, and the homology comparison sends stage-one
3 to minus stage-zero 3. The telescope of
multiplication by 2 on `ℤ` is `ℤ[1/2]`, with `[0,1]` going to 1.

**Factorial powers.** Prove the following for complete noetherian local
`A` with finite residue field, a finite commutative `A`-algebra `T` and `t ∈ T`. There is an
idempotent `e` such that, for every `k`, eventually `t^(n!)−e ∈ (m_A T)^k`.
Modulo each maximal ideal of `T`, `e` is zero when `t` belongs to that ideal and
one otherwise. The proof uses eventual factorial powers in each finite quotient
`T/(m_A T)^k`, then completeness; finite local factors distinguish the unit and
nonunit cases. This spells out the finite-quotient justification for the ordinary
projectors in [Calegari–Geraghty, §7.1, p.73](https://arxiv.org/pdf/1207.4224).
Over `𝔽₂×𝔽₂`, `(1,0)^(n!)=(1,0)`.
The negative control: `2^(n!)≠1` in the discrete
field `ℚ`. *Needs:* finite local factors and adic completeness.

**Ordinary finiteness.** Prove the following for artinian local `A` and
`C` with bounded finite cohomology. Every operator has an idempotent `e`, an inverse
on `eC`, and a nilpotent complementary restriction, with the exact equations of
*Comparison with an idempotent*. Its telescope has finite cohomology on the same
support interval. This is the discrete module-derived statement of
[Boxer–Pilloni, Lemma 2.4.3, p.18](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf).
Prove that for `u : M → C`, `v : C → M` with the same
bounded finite hypothesis on `C`, the telescope isomorphism for `vu` and `uv`
sends the initial map out of `M` to the initial map out of `C` composed with `u`.
The telescope of `vu` has bounded finite cohomology. This is the bounded form of
[Boxer–Pilloni, Lemma 2.4.6 and proof, p.19](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf).
The scope is the algebraic telescope and bounded finite cohomology. An analytic
localization comparison or a separate perfect-complex interface is outside this layer.
*Needs:* finite morphism modules, local factors and operator localization.

**Completion of a supplied split algebra.** Prove that
for commutative `A`, finite commutative `A`-algebra `T`, complete local commutative
`A`-algebra `O`, a supplied `O`-algebra equivalence `O ⊗_A T ≃ O^s`, and `i : Fin s`,
completion at the inverse image of `m_O` under the ith projection is `O`.
No noetherian hypothesis on `O` is needed: in the product presentation the nth
ideal power has ith component `m_O^n` and every other component the unit ideal.
Taking the inverse limit proves the claim from the definition of completion
([Stacks, §10.96, opening definition](https://stacks.math.columbia.edu/tag/00M9)).
The arithmetic existence of a splitting is outside this statement.

### Examples

The image calculations distinguish zero complexes, faithful scalar actions, source
kernels, and an actual nonzero Ext ghost. The two-degree Ext calculation pins the
nilpotence exponent and orientation. On `(ℤ²)[0]` the three projectors explicitly
separate zero, identity, and first-factor localization, including the maps on vectors.
The sign calculation for `t=−1` pins the forward telescope relation. The telescope
of multiplication by 2 on `ℤ[0]` is nonzero; topological
nilpotence is not the nilpotence hypothesis of the idempotent comparison.

### Dependencies

No earlier IHG layer. Use Mathlib's `DerivedCategory`, `ModuleCat.finite_ext`,
`DerivedCategory.Q`, `DerivedCategory.Qh`, `DerivedCategory.homologyFunctor`,
`CochainComplex.IsKProjective.Qh_map_bijective`, `AlgHom.range`, quotient/image API,
`TwoSidedIdeal.ker`, and `Module.DirectLimit`. Predicates `HeckeImage.Supported` and
`HeckeImage.FiniteCohomology` mean vanishing outside the specified interval and degreewise
finite modules, respectively. Layer IHG.5 consumes `HeckeImage.ghost_nilpotence`.

## Layer 3b: residual maximal ideals of Galois type

### 3b.1 Galois-type and non-Eisenstein maximal ideals

**Maximal ideals of Galois type.** Let `T` be any commutative ring, `m` a maximal ideal with
finite residue field `k = T/m` equipped with the discrete topology, `G` a group with a topology,
`n : ℕ`, `Frob : V → G`, and `P : V → k[X]`. Define Galois type for `m,n,Frob,P`
by existence of a continuous semisimple representation on `kⁿ` whose characteristic polynomial
at `Frob v` is `P v`. Lean uses its equivalent algebra map `k[G] →ₐ[k] M_n(k)` and the
invariant-complement condition from Layer 1, semisimplicity of `matrixModule ρ`. Define
non-Eisenstein by existence of such a representation whose matrix family is
absolutely irreducible in the sense of Layer 1 (`IsAbsolutelyIrreducible`).
It implies Galois type and `0 < n`; rank zero is allowed only for Galois type. The two predicates
use the same realizing representation inside each existential, including its Frobenius identities.

For a spherical Hecke algebra away from `S`, take `G = G_{F,S}`, `V` the finite places outside
`S`, and the reductions of Layer 3a's Hecke polynomials. This is the specialization of
[ACC, Definition 2.3.6, p.938](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf).
Existence for geometric cohomology is supplied by its geometric owner. The general predicates
make no density assumption on `Frob` and allow `V` to be empty.

**Basic consequences.** Prove the following consequences: under the hypotheses
above, a non-Eisenstein system is Galois type of positive rank, and every observed polynomial
of a Galois-type system is monic of degree exactly `n` with nonzero constant term. These are
consequences of the definitions, positivity in absolute irreducibility, and the characteristic
polynomial of an invertible matrix (Mathlib's `Matrix.charpoly_monic`,
`Matrix.charpoly_natDegree_eq_dim`, `Matrix.det_eq_sign_charpoly_coeff`).

**Uniqueness.** Prove the following for continuous degree-`n` determinants
of `k[G]` over any Hausdorff topological field `k`, with the conjugacy saturation of `Frob(V)`
dense in `G`: equality of the characteristic polynomials at every `Frob v` implies equality
of the determinants. Neither finiteness of `k` nor compactness of `G` is required here.
Continuity extends the characteristic-polynomial identities from the dense set; field
reconstruction and Brauer–Nesbitt then apply
([Chenevier, Theorem 2.12 and its uniqueness proof, pp.28–31](https://arxiv.org/pdf/0809.0415v2)).
For the finite residue-field representations above, Layer 1 identifies their semisimple
realizations after a common algebraic closure. Empty observations do not supply density in a group.

**Checks.** In the finite
field checks take `T = 𝔽_p`, `m = 0`, and identify `T/m` with `𝔽_p`.

| Definition | Discriminating Checks |
|---|---|
| Galois type | Trivial group, rank zero, polynomial `1` is realized; trivial group over `𝔽₂`, rank one, `X−1` is realized; rank two gives `(X−1)²`; at the identity over `𝔽₅`, `X−2` cannot occur in rank one; `X` cannot occur for a group element; rank two cannot have polynomial `X−1`; with `V = ∅`, the trivial line is still realized. |
| non-Eisenstein | The zero representation is rejected; the trivial line over `𝔽₂` is accepted; two equal trivial characters are rejected although their sum is semisimple; the tautological character of `(𝔽₅)ˣ` is accepted; the trivial line remains absolutely irreducible with no observations. |

Over `𝔽₂`, `(X−1)² = X²+1`: a zero trace does not lower the
rank. The trivial and sign characters of `C₂` over `𝔽₃` differ
at the nonidentity element (`X−1` versus `X+1`); observing only the identity cannot give uniqueness.

### 3b.2 Duality and character twists of residual polynomial systems

**Transport.** Under the finite discrete residue-field hypotheses of 3b.1, let
`θ : G → kˣ` be a continuous character. Prove that tensoring by `θ` preserves the respective
predicates, replacing
`P_v` by `P_v.scaleRoots (θ(Frob v))`. The coefficient of `X^(n−i)` is multiplied by
`θ(Frob v)^i` for `0 ≤ i ≤ n`. Use Mathlib's `Polynomial.scaleRoots` directly.

Prove that contragredient
followed by tensoring by `θ` also preserves the predicates, with transformed polynomial

```text
(C (P_v(0)⁻¹) * Polynomial.reflect n P_v).scaleRoots (θ(Frob v)).
```

The nonzero constant coefficient follows from the basic consequences of 3b.1. The matrix action
is `g ↦ θ(g) • ρ(g⁻¹)ᵀ`, so the dual is read through evaluation at `g⁻¹`, and the roots are `θ(Frob v)/α_i`. These residual transport statements
are the representation-theoretic content of
[ACC, the paragraph after Definition 2.3.6, p.938](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf).
This layer specifies transport of residue-field polynomial systems; construction of automorphisms
of a spherical Hecke algebra or induced maps on its maximal ideals is outside this layer.

For geometric Frobenius at places with `q_v ∈ kˣ`, `ε(Frob_v) = q_v⁻¹`. The ACC dual twist is the integer power
`θ = ε^(1−n)`, so its root multiplier is `q_v^(n−1)` when `n ≥ 1`. The general transport
statements also allow `n = 0`; the polynomial remains `1`. Continuity and unit values of the
character are explicit assumptions throughout.

**Checks.** Under root multiplier `5`, `(X−2)(X−3)` becomes
`(X−10)(X−15) = X²−25X+150`. Normalized reflection of `(X−2)(X−3)` is
`(X−1/2)(X−1/3)`; the normalizing constant is `1/6`. The geometric Check combines the two:
for `n = 2`, `q = 5`, and `ε(Frob) = 1/5`, the dual-twist roots are `5/2,5/3`, not `1/10,1/15`.
All three computations take place over `ℚ` to distinguish the signs and exponents before
reduction. In rank zero the dual twist gives `1`.

### Examples

The trivial line, its doubled semisimple representation in characteristic two, and the
nontrivial tautological character over `𝔽₅` distinguish Galois type from non-Eisenstein.
The zero-rank and empty-observation examples separate positivity from density. The two-root
computations fix the twist multiplier, reciprocal normalization and geometric Frobenius exponent.

### Dependencies

Layer IHG.1 supplies matrix semisimplicity, absolute irreducibility and semisimple field
reconstruction. Layer IHG.3a supplies the Hecke polynomials and geometric Frobenius convention
for the arithmetic specialization. Mathlib supplies polynomial root scaling, reflection and
matrix characteristic polynomials. The geometric owner supplies the existence of residual
representations in applications.

## Layer 4: interpolation over integral coefficient rings

Characteristic polynomials on a conjugacy-dense set determine a continuous determinant.
Existence needs integral coefficient descent or compatible quotient laws. All laws here are on
ordinary group algebras. In the Galois application the group is the fixed `G_{F,S}` throughout.
The algebraic constructions allow arbitrary commutative rings, including nonreduced and zero
rings, and every degree `d : ℕ`, including zero. No factorial is inverted.

Use the monic convention `D(X−g)`. Scholze uses `D(1−Xg)`; convert by
`P(X) ↦ X^d P(X⁻¹)`, with the specified degree `d`, without dividing by a coefficient.
**Check.** For the two eigenvalues `1,−1`, the two
polynomials are `(X−1)(X+1)=X²−1` and `(1−X)(1+X)=1−X²`. In characteristic two both
become `X²+1`; equality there alone would not detect the sign convention.
See [Scholze, Definition 5.1.8 and Remark 5.1.9, p.1037](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf).

### 4.1 Uniqueness and gluing of continuous determinants

**Group-algebra coefficient change.** The coefficient change of a determinant `D` on `A[G]`
along a ring map `φ : A → B` is scalar extension followed by `B ⊗_A A[G] ≃ B[G]`.
It sends each characteristic polynomial to its coefficientwise image, and it is the identity
along `id` and compatible with composition, on the full law.
These have no topological, finiteness or positive-degree hypothesis. They specialize scalar
extension from Layer 0 to group algebras, rather than introducing a second scalar-extension law.
By *Coefficient reconstruction from group words* (`Determinant.eq_of_charpoly_eq`), a determinant
`E` on `B[G]` is the coefficient change of `D` iff at every group element its characteristic
polynomial is the coefficientwise image of that of `D`; the statements in `Suggested.lean` use
this characterization, the predicate `Determinant.IsCoefficientChange`.
Source: [Chenevier, §1.1, pp.6–7 and §2.30, p.37](https://arxiv.org/pdf/0809.0415v2).

**Uniqueness from Frobenius density.** `Determinant.eq_of_charpoly_frobenius` takes a group
`G` with a topology, a Hausdorff coefficient ring `A`, continuous degree-`d` determinants `D,E`,
and `Frob : V → G` such that `{h Frob(v) h⁻¹}` is dense. Equality of the monic characteristic
polynomials at every `Frob(v)` implies `D=E`. Neither compactness nor finiteness is needed for
this implication. In the arithmetic application Chebotarev layer 10 supplies conjugacy density
in `G_{F,S}`; chosen representatives alone need not be dense. The algebraic input is that
characteristic polynomials on group elements determine the law, including its values on sums.
Sources: [Chenevier, Lemma 1.12(ii), p.12 and §2.30, p.37](https://arxiv.org/pdf/0809.0415v2);
[Scholze, Corollary 5.1.10, p.1037](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf).
*Lean:* `Determinant.eq_of_charpoly_frobenius`.

**Compact coefficient-ring gluing.** `Determinant.existsUnique_isCoefficientChange_of_compact` takes any group `G` with a topology,
compact Hausdorff `A`, any family of Hausdorff coefficient rings `B_i`, continuous ring maps
`φ_i : A → B_i` that are jointly injective, continuous degree-`d` laws `D_i`, and a dense set
`S ⊆ G`. For every `g ∈ S` and coefficient index `k`, assume there is one `a ∈ A` mapping to
all the `k`th coefficients. There is a unique continuous law over `A` extending to every `D_i`,
that is, whose coefficient change along each `φ_i` is `D_i`.
The family can be infinite or empty; an empty jointly injective family forces `A` to be the
zero ring. Compactness of `A` makes its continuous injection into the Hausdorff product
a closed embedding. Density and continuity of the characteristic coefficients then give
integrality on all of `G`; the integral Amitsur formula gives algebraic descent. These steps
impose no compactness hypothesis on `G`.
Source: [Chenevier, Example 2.32 and Corollary 1.14, pp.38 and 14](https://arxiv.org/pdf/0809.0415v2).
*Lean:* `Determinant.existsUnique_isCoefficientChange_of_compact`.

**Gluing over an intersection of quotient ideals.** This target
specializes compact gluing to `A/(I∩J) → A/I × A/J`. Require compact Hausdorff `A/(I∩J)`, Hausdorff
`A/I,A/J`, continuous canonical maps, any group `G` with a topology, continuous laws on the two quotients, and
simultaneous coefficient lifts on a dense subset of `G`. Its unique continuous law reduces to
both input laws. Agreement after passing to reduced rings is insufficient. The case `I=J`
recovers the same law; `I=⊤` discards the zero-ring component; comaximal ideals allow arbitrary
pairs by the Chinese remainder theorem. Source: the preceding gluing result, applied in
[Scholze, proof of Corollary 5.1.11, p.1038](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf).

**Checks.** The gluing theorem applies to
`G=ℤ` with its discrete topology and the identity coefficient map on `𝔽₂`; `ℤ` is not compact.
The descended law of a uniform congruence witness on that same source is continuous and
equal to every classical quotient law. The witness construction applies compact gluing on the
conjugacy-saturated Frobenius set, retaining compact
Hausdorff coefficients and full polynomial-law descent.

### 4.2 Finite-quotient witnesses and interpolation

**Compatible quotient determinants.** Compatible quotient data of degree `d` take an
arbitrary descending sequence of ideals `J` in a commutative ring `A` and a group `G` with a
topology. They consist of laws `D_r` over `A/J_r`, continuity of their characteristic coefficients
for the discrete quotient topology (local constancy), and equality of the full reduced laws for `r≤s`.
The structure itself imposes no finiteness, compactness, completeness or openness assumption.
In the finite arithmetic application the quotients are finite and `G` is profinite; Layer 0's
continuity/kernel theorem then supplies finite group quotients. The compatibility for `r≤s` is
the projection from level `s` to level `r`. Source: [Chenevier, Lemmas 2.33 and 3.2, pp.38–39 and 41](https://arxiv.org/pdf/0809.0415v2).

**Refining the group quotient.** For any normal subgroups `V≤U`,
the refinement pulls a law on `(A/J_r)[G/U]` back along
`(A/J_r)[G/V] → (A/J_r)[G/U]`. It uses `QuotientGroup.map`, `MonoidAlgebra.mapDomainAlgHom`
and Layer 0's restriction of determinants. No family `F`, topology, finite index or open-subgroup
hypothesis is needed for this algebraic operation. Prove that its characteristic polynomial
at the class of `g` is the original polynomial at the class of `g`.
For finite quotients choose normal open subgroups and refine them by finite intersections;
there need not be one subgroup working for every coefficient level. Source: the factorization
in [Chenevier, Lemma 2.33, pp.38–39](https://arxiv.org/pdf/0809.0415v2).

**The quotient-limit ring.** The quotient-limit ring of `J` is the subring of
`∏_r A/J_r` whose `s`th coordinate reduces to its `r`th coordinate for `r≤s`.
This concrete presentation handles arbitrary descending ideals, unlike the powers of one ideal
in `AdicCompletion`; generic categorical limits are supplied by `RingCat.sectionsSubring`.
An identification `complete` of `A` with the quotient-limit ring must additionally satisfy
`(complete a)_r = a mod J_r`. An unrelated abstract ring isomorphism does not certify the
canonical quotient system. In `Determinant.existsUnique_interpolation` this canonical
identification is stated as `⋂_r J_r = 0` together with surjectivity of `a ↦ (a mod J_r)_r` onto
compatible sequences. Source: the inverse-limit construction used in
[Chenevier, proof of Lemma 3.2, p.41](https://arxiv.org/pdf/0809.0415v2).

**Determinant from a compatible inverse limit.** The inverse-limit determinant
takes quotient data and this canonical complete identification, and returns a degree-`d` law
on `A[G]`. Prove that its reduction to every level is `D_r`, and that
any law with those reductions equals it, without a
continuity assumption on the competing law. The construction uses the representing ring of
multiplicative laws over `ℤ`; it makes no assertion that tensor products commute with inverse
limits. The continuous form adds a topology on `A`, discrete topologies on the
quotients, and a topological embedding `A → ∏_r A/J_r`. It concludes existence and uniqueness
of a continuous law with the given reductions. The general formulation is the representability
argument of [Chenevier, Lemma 3.2, p.41](https://arxiv.org/pdf/0809.0415v2), applied without the
fixed residual determinant or local coefficient-ring restrictions of that lemma's deformation
functor; neither restriction enters the argument.

**Uniform congruence witnesses for classical systems.**
A uniform congruence witness of degree `d` takes compact Hausdorff `A`, a group `G` with a topology, and a
finite family of Hausdorff `A`-algebras with continuous structure maps and continuous laws.
It requires conjugacy density of `Frob`, joint injectivity of the coefficient maps, and a common
`A`-lift of each Frobenius coefficient across all components. The finite family can be empty
only when joint injectivity allows it. Compact gluing gives the descended law; prove that it is
continuous and that its coefficient change to each component is the full law of that component.
For two such witnesses, a continuous coefficient map, and exact
transport of every Frobenius polynomial, prove equality of the transported laws.
This is the finite-family specialization of compact gluing, from
[Chenevier, Example 2.32, p.38](https://arxiv.org/pdf/0809.0415v2). The geometric construction of
uniform congruences remains input: at each level one ideal controls all unramified places
simultaneously, as in [Scholze, proof of Corollary 5.1.11, p.1038](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf).

**Integral interpolation with uniform congruences.** The statement
takes one witness over each discrete compact quotient `A/J_r`, canonical completeness and the
quotient-family topological embedding, and compatibility of the witness Frobenius polynomials
under reduction for every `r≤s`. It yields a unique continuous law reducing to the descended
law of each witness. Compactness is required of the coefficient quotients for descent;
no compactness of `G` is assumed. This combines the preceding compatibility and inverse-limit targets;
its sources are [Chenevier, Example 2.32 and Lemma 3.2, pp.38 and 41](https://arxiv.org/pdf/0809.0415v2).

The Lean statement records the conclusion through prescribed Frobenius polynomials. Let `A` be
separated and complete for a descending chain `J_r` that is a basis of neighbourhoods of `0`, let
`Frob : V → G` have dense conjugates, let `P_v ∈ A[X]`, and let `D_r` be laws over `A/J_r` with
locally constant coefficients and polynomial `P_v mod J_r` at every `Frob v`, as the descended laws
of the witnesses supply. Then there is a unique continuous determinant over `A` with polynomial
`P_v` at every `Frob v` ([Scholze, Corollary 5.1.11, p.1038](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf));
by *Uniqueness from Frobenius density* it reduces to every `D_r`.
*Lean:* `Determinant.existsUnique_interpolation`.

**Coefficient change in interpolation.** The statement takes
quotient data on `A/J_r` and `B/K_r`, canonical complete identifications for both rings, a ring
map `φ : A → B`, maps `φ_r : A/J_r → B/K_r` commuting with the quotient maps, and equality of
the transported quotient laws. It concludes equality of the transported inverse-limit laws.
This algebraic assertion needs no topology on `A,B` or continuity of `φ`; the continuous
application uses the continuous form of the inverse-limit determinant separately. It is a consequence of uniqueness in
[Chenevier, proof of Lemma 3.2, p.41](https://arxiv.org/pdf/0809.0415v2).

**Hecke level change in interpolation.** The statement takes continuous laws
on `G`, a continuous coefficient map `A→B` with `B` Hausdorff, a conjugacy-dense Frobenius
family, and transport of all its characteristic polynomials. It concludes transport of the
whole law. In the Hecke application the geometric owner supplies the continuous level map and
transport of every normalized Hecke coefficient, which gives the polynomial hypothesis. No
existence of a geometric level map is asserted here. This is a consequence of Frobenius
uniqueness, used with [Scholze, Corollary 5.1.11, p.1038](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf).

**Fixed ramification set in coefficient limits.** The statement
takes quotient data on groups `G,H`, the same canonically complete coefficient system, a group
homomorphism `q : G → H`, and equality between the pullbacks of the level laws on `H` and the
level laws on `G`. The reconstructed laws satisfy the same pullback identity. This algebraic
identity needs neither surjectivity nor continuity of `q`. Applying it to the fixed quotient
onto `G_{F,S}` proves preservation of that factorization. Uniform unramifiedness of the
classical sources is an input, not a conclusion of coefficient interpolation. Source: naturality
of the representing-ring construction in [Chenevier, proof of Lemma 3.2, p.41](https://arxiv.org/pdf/0809.0415v2).

**Failure of field-point integrality on nilpotents.** Take any
field `k`. Over `k[ε]/ε²` the rank-one characters of `ℤ` given by `n↦1` and
`n↦(1+ε)^n=1+nε` give distinct laws, with values `1` and `1+ε` at the generator. Every ring map
to any field kills `ε`, so their extended laws agree at every field-valued point. This includes
characteristic two. Source: the dual-number setting of
[Chenevier, §2.24, p.35](https://arxiv.org/pdf/0809.0415v2); the character computation specifies
this example completely.

**Checks.**

| Definition | Three discriminating Checks |
| --- | --- |
| Coefficient change (`Determinant.IsCoefficientChange`) | Degree zero has value `1` even at zero after `ℤ→𝔽₂`; the two eigenvalues `1,−1` have `X²−1 ↦ X²+1`; the rank-one value `3∈ℤ/4` survives identity change but becomes `1` modulo two. |
| Compatible quotient data | Augmentation gives a constant zero-ideal family over `𝔽₂` for discrete `G`; the unit-ideal system has the unique zero-ring law in every degree; values `1` and `−1` at one group element cannot occur at different levels of a constant `𝔽₃` system. |
| Refinement of the group quotient | `V=U` leaves the full law unchanged; refining from `G/G` gives `(X−1)²` at every element in degree two; the two-term input `2[g]+3[h]` maps to `5[1]`, so its degree-two determinant is `25`. |
| Quotient-limit ring | Zero-ideal compatibility forces a constant sequence, rejecting a varying sequence; the unit-ideal limit is the zero ring; with `J₀=⊤` and `J_r=0` for `r>0`, the compatible image of `3` has initial coordinate zero and a nonzero tail. |
| Inverse-limit determinant | Degree zero evaluates to `1` at zero; rank-one quotient values `1,−1` on `g,h` reconstruct value `−1` on `2[g]+3[h]`; the constant zero-ideal system over `ℤ/4` reconstructs value `3=1+2`, distinct from `1`. |
| Uniform congruence witness | A fully specified identity witness over `𝔽₂`; a two-component witness over `𝔽₂×𝔽₃` using both projections; an empty witness over the zero ring. The negative control excludes an empty family over `𝔽₂`. |
| Descended law of a witness | The identity witness returns the augmentation, with value `0` on `1+1` over `𝔽₂`; the two-projection witness returns the product augmentation, with value `(0,2)` on `1+1`; the empty zero-ring witness returns the unique law, with value zero at zero. |

### Examples

The checks include degree zero, the unit ideal, empty coefficient families, characteristic two,
a nonreduced ring, and two-term inputs outside the group basis. The product witness is also the
intersection example for the two projection kernels of `𝔽₂×𝔽₃`, whose intersection is zero.
For a prime `p`, use `A=ℤ_p` and `J_r=(p^r)`. The supplied
`PadicInt.inverseLimitRingEquiv`, `PadicInt.inverseLimitContinuousMulEquiv` and `PadicInt.ker_toZModPow`
identify the coefficient system and its topology; at `r=0` the quotient is the zero ring. Compatible characters give degree-one
laws and the continuous inverse-limit determinant assembles them with the inverse-limit topology.

### Dependencies

Layer 0 supplies scalar extension, pullback, the rank-one algebra-homomorphism correspondence,
coefficient descent, coefficientwise continuity, the open-kernel criterion in the profinite case,
and the determinant coordinate ring. DerivedModuleAlgebra §0.DP.2 supplies representability of
multiplicative laws. Layer 3a supplies the normalized Hecke polynomials.
[Chebotarev layer 10][chebotarev10] supplies arithmetic conjugacy density. Coefficient interpolation
uses the ordinary group algebra and the specified quotient-limit ring.

## Layer 5: quantified nilpotent comparison

A Hecke comparison supplies an error ideal and a uniform exponent. Descent produces a
determinant over the quotient by that ideal. All coefficient rings in this layer are
commutative; no factorial invertibility or residue-characteristic restriction is imposed.

### 5.1 Descent through a nilpotent error ideal

**Determinant from a quantified Hecke comparison.** Prove
`Determinant.existsUnique_descent_kerLift`. Let `G` be a compact topological space with a group
structure, `φ : T → B` a ring homomorphism, and `J = ker φ`. In the application `J^N = 0`
for some `N > 0`, but the descent statement does not use this: the exponent enters only the
bounds of §5.2, and the statement holds for every `J`.
Give `T/J` a compact Hausdorff topology and `B` a Hausdorff topology, and assume the
injective kernel lift `T/J → B` is continuous. For a continuous degree-`d` determinant
`D` over `B`, suppose every characteristic coefficient on a specified dense subset of `G`
lies in the image of the kernel lift. There is a unique continuous determinant `E` over
`T/J` whose coefficient extension is `D`. This statement permits `d = 0`; it does not
require a topology on `T`. For Frobenius data the dense subset includes the conjugates of
the selected representatives. This abstracts the descent in
[Scholze, proof of Theorem 5.4.1, pp.1058–1059](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf).
*Needs:* Layer 4, Compact coefficient-ring gluing; `RingHom.kerLift_injective`.
*Lean:* `Determinant.existsUnique_descent_kerLift`.

**Functoriality of nilpotent descent.**
For ideals `J ⊂ T`, `J′ ⊂ T′`, supply a continuous ring map
`q : T/J → T′/J′`. Let `E` and `E′` be degree-`d` determinants over `T/J` and `T′/J′`,
respectively. Assume `T′/J′` Hausdorff, both
quotient determinants continuous, and their characteristic polynomials agree after `q`
on Frobenius representatives whose conjugates are dense in `G`. Then the coefficient change of
`E` along `q` is `E′`.
Nilpotence is needed to quantify the original error, not for this compatibility assertion.
This is the quotient-ring
specialization of Layer 4's *Hecke level change in interpolation*, with the same hypotheses
(uniqueness by the dense-set argument used in Scholze, Corollary 5.1.10, p.1037).
*Needs:* Uniqueness from Frobenius density.

**Checks.** For discrete finite G, take the dense subset to be all of G and
`q : ℤ/(4) → ℤ/(2)` to be reduction.

- The sign character of C₂ has polynomial `X−3` at its generator over `ℤ/(4)`;
  its coefficient change has polynomial `X−1` over `ℤ/(2)`.
- The sum of the sign and trivial characters has polynomial `X²+3` at that generator;
  reduction gives `X²+1 = (X−1)²`, with trace zero and determinant one.
- The degree-zero determinant has polynomial `1` on every group element over both rings;
  coefficient change preserves it.

### 5.2 Nilpotence exponents

These are elementary ideal-power and module-filtration consequences. The two-factor
comparison occurs in [Scholze, proof of Theorem 5.4.1, p.1059](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf);
the sharper numerical bounds below follow by multiplying ideal powers and expanding a
commutative ideal sum, rather than being separately numbered results of that paper.

**Nilpotence through a quotient extension.** For ideals `J,K`
and natural numbers `a,b`, `K^a = 0` and `J^b ⊆ K` imply `J^(ab) = 0`.
Containment `K ⊆ J` is needed only for the interpretation as `J/K`.
The power identity `(J^b)^a = J^(ba)` proves the bound, including zero exponents in the
zero ring. *Needs:* Mathlib ideal multiplication and powers.

**Nilpotence of sums of commutative ideals.** If `a,b > 0`,
`I^a = 0` and `J^b = 0`, then `(I+J)^(a+b−1) = 0`.
For a finite family with positive exponents `a_i`, the sum has
exponent `1 + Σ(a_i−1)`, including exponent one for the empty family.
In every product of `a+b−1` factors, either at least `a` come from `I` or at least `b`
from `J`. This sharpens `Ideal.sup_pow_add_le_pow_sup_pow` (exponent `a+b`).
*Needs:* Mathlib `Ideal`, distributivity of ideal multiplication over sums.

**Nilpotence in a product of coefficient rings.** A jointly
injective family `f_i : A → B_i` detects a common exponent: if `(J.map f_i)^N = 0`
for every `i`, then `J^N = 0`. The index family need not be finite.
For a finite family with positive bounds `a_i`, the product bound is exponent
`1 + max_i(a_i−1)`, with maximum zero on empty input. For nonempty input this is
`max_i a_i`. This formulation covers product ideals using coordinate projections and
inverse images under an injection. For empty input joint injectivity forces `A` to be
the zero ring. *Needs:* `Ideal.map_pow` and injectivity of the assembled map.

**Error ideal on a filtered module.** For any `A`-module
`M`, submodule `M′`, and natural numbers `a,b`, if `J^a M′ = 0` and `J^b M ⊆ M′`,
then `J^(a+b) M = 0`. A product of two endomorphisms that vanish on both factors of
`0 ⊂ M′ ⊂ M` is zero: the second maps into `M′`, and the first kills `M′`.
Thus the kernel of the action on both factors is square-zero inside the image algebra
acting faithfully on `M`. For an arbitrary acting algebra the conclusion is annihilation
on `M`, unless its action is faithful. *Needs:* Mathlib `Submodule`, ideal powers.

**Quantified composition of Hecke error ideals.** For ring maps
`f : T → T₁`, `g : T → T₂`, assume `(ker f ∩ ker g)^a = 0` and error ideals
`J₁^b = J₂^c = 0` with `b,c > 0`. Then
`(f⁻¹(J₁) ∩ g⁻¹(J₂))^(a·max(b,c)) = 0`.
For an action faithful on a two-factor filtered module, the comparison kernel has `a = 2`.
For a derived-to-cohomology comparison, use the inclusive amplitude exponent.
*Needs:* Nilpotence through a quotient extension; Nilpotence in a product of coefficient rings;
Layer 2, Ghost nilpotence and annihilators.

**Checks.**

- For `T = ℤ/(8)`, `f = g = id` and `J₁ = J₂ = (2)`, take `a=1`, `b=c=3`.
  The comparison ideal is `(2)` with nonzero square and zero cube.
- For `T = ℤ/(64)` and both maps reduction to `ℤ/(8)`, the joint kernel `(8)` has
  square zero. With `J₁ = J₂ = (2)` the bound is `2·3=6`, and `(2)⁵ ≠ 0` in T.
- For `T = ℤ/(8)`, `f = id`, `g` reduction to `ℤ/(4)` and `J₁ = J₂ = (2)` in their
  respective rings, `a=1`, `b=3`, `c=2` give exponent three. Exponent two fails.

**Uniform nilpotence in an inverse limit.** For ideals `K_r`
in `A` with `⋂ K_r = 0`, an ideal `J`, and one natural number `N`, assume
`(J.map (A → A/K_r))^N = 0` for every `r`. Then `J^N = 0`.
No completeness or monotonicity is needed for this detection statement. To apply it to
an actual inverse limit, take `J` to be the ideal of elements whose coordinates belong
to the specified compatible error ideals; its coordinate images are contained in those
ideals. Uniformity is essential (Scholze, Corollary 5.4.2, footnote 29, p.1060).
*Needs:* Nilpotence in a product of coefficient rings, separation by the coefficient quotients.

### 5.3 Residual specialization, representations and lattices

**Residual semisimple specialization.** For `d > 0`, a maximal ideal `m` of `T`, an inclusion `J ⊆ m`, an algebraically closed
field `k` with a specified `T/m`-algebra structure, and a determinant `D` over `T/J`,
the coefficient change along `T/J → T/m → k` is the determinant of a semisimple
matrix representation, unique among semisimple representations up to conjugation by
`GL_d(k)`. This is an algebraic statement for an arbitrary group `G`. If `J^N = 0`
with `N > 0`, the inclusion follows from `Ideal.IsPrime.pow_le_iff`.
The algebraic theorem is [Chenevier, Theorem 2.12, p.28](https://arxiv.org/pdf/0809.0415v2),
used in [Scholze, Corollary 5.4.3, p.1060](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf).
*Needs:* Layer 1, Semisimple reconstruction of field determinants;
Group-algebra coefficient change; `Ideal.Quotient.factor`.

**Representation over the nilpotent quotient.** Let `d > 0`, `T/J` be henselian local,
and the residual determinant be split and absolutely irreducible. Construct an algebra
isomorphism `e : (T/J)[G]/CH(D) ≃ M_d(T/J)` such that the composite of `e` with the
canonical CH quotient map realizes `D`. Any matrix representation realizing `D` is
conjugate to this one. Here `J` can be any ideal for which the hypotheses hold;
nilpotence records its origin in the comparison. The algebraic input is [Chenevier, Theorem 2.22(i), pp.34–35](https://arxiv.org/pdf/0809.0415v2),
applied in Scholze, Corollary 5.4.4, p.1060.
*Needs:* Layer 1, Henselian irreducible reconstruction and the canonical CH quotient.

**Local conditions and change of lattice.** Fix a commutative ring `A`, arbitrary
`A`-modules `M,N`, a character `α : G → Aˣ`, and a scalar-action cocycle
`c(gh) = c(g) + α(g)c(h)`. Prove that an `A`-linear
map `F : M → N` preserves this equation and sends a specified local witness
`c(h) = (α(h)−1)y`, `h ∈ H`, to the witness `F(y)`. Cohomology classes and restriction
use Mathlib's `groupCohomology.map` and `groupCohomology.mapShortComplexH1`;
the coordinate statement here retains the actual witness. Reflection of local triviality
requires an isomorphism; a zero map can kill a nontrivial class.
For a rank-two triangular representation with diagonal characters `χ,ψ`, use `α=χ/ψ`
and `c=b/ψ`. Prove over any commutative ring that,
for units `r,s`, the convention `ρ′=PρP⁻¹`, `P=diag(r,s)`, gives `b′=(r/s)b`
and `c′=(r/s)c`. This specifies a coordinate change; it asserts no equality of Fitting
ideals for nonisomorphic lattice modules. These formulas follow directly from linearity
and `Matrix.mul_apply`. *Needs:* Mathlib group-cohomology functoriality and matrix multiplication.

### Examples

**Checks.** This layer introduces no definitions; it uses the determinant, CH quotient, ideal,
module and cohomology carriers specified by its dependencies.

| Check | Computation and discriminating case |
|---|---|
| Extension bound | In `ℤ/64`, `J=(2)`, `K=(8)`: `K²=0`, `J³=K`, `J⁶=0`, but `J⁵≠0`. The extension bound is the product `2·3`. |
| Error not square-zero | In `ℤ/8`, `(2)³=0`, `(2)²≠0`. |
| Sharp sum bound | In `ℚ[x,y]/(x²,y³)`, `(x+y)³=3xy²≠0`, `(x+y)⁴=0`; the bound `2+3−1=4` is sharp. |
| Two-factor kernel | On `0⊂ℤe₁⊂ℤ²`, `U=[[0,1],[0,0]]` is nonzero, kills both factors, and `U²=0`. This fixes the order of the filtration argument. |
| Nonfaithful kernel | The scalar action of ℤ on the zero module has kernel `(1)`, whose square is nonzero; faithfulness is essential for a square-zero kernel in the acting algebra. |
| Empty bounds | The empty finite sum and product bounds are both one. |
| Zero exponent | In `𝔽₂`, every ideal has zeroth power `(1)≠0`. |
| Unbounded limit | The image of `2` in `ℤ/2^(r+1)` has `(r+1)`st power zero, but every power of `2` in `ℤ₂` is nonzero. |
| Quotient direction | Reduction `ℤ/(4) → ℤ/(2)` sends `[3]` to `[1]` and `[2]` to `0`; the direction is from the smaller ideal's quotient. |
| Degree zero | The determinant on the empty matrix has characteristic polynomial `1`. Descent permits this case; the reconstruction targets specify positive degree. |
| Trivial rank one | The trivial rank-one representation over `𝔽₂` has polynomial `X−1`. |
| Repeated residual | Two copies of the trivial character over `𝔽₂` fail absolute irreducibility. |
| Infinite discrete character | The values `2^n` in `ℚ`, for `n∈ℤ`, form an infinite set. A discrete continuous character need not have finite image for a noncompact source. |
| Rescaling ratio | With `P=diag(2,3)` and `U=[[2,6],[0,3]]` over `ℚ`, `PUP⁻¹=[[2,4],[0,3]]`: `c=2` becomes `4/3=(2/3)c`. |
| Coboundary direction | The additive character `n↦n` for the trivial action on `ℤ` is not a coboundary; the zero module map kills it. |

### Dependencies

Layer 4: compact determinant gluing, coefficient change and Frobenius-density uniqueness.
Layer 2: the amplitude bound for ghost nilpotence. Layer 1: algebraically closed
semisimple reconstruction, henselian irreducible reconstruction and the CH quotient.
Mathlib: ideal powers and quotient maps, linear maps, matrix multiplication, and
group-cohomology functoriality.

## Layer 6: integral Ribet modules and Fitting ideals

Fitting ideals are Tau Ceti's `TauCeti.fittingIdeal`. PadicMeasuresIwasawaAlgebras §4.5 supplies
the general finite-module annihilator bound `Fitt₀_A(M) ⊆ Ann_A(M)`. The layer constructs the cocycle module and its local quotient,
then proves the weighted Fitting containment through stabilized relation minors. The proof uses
integral scheme invariants and two explicit relation complexes, with generic regularity providing
exactness only for the upper-entry complex. The local and global extension theorems are assembled
last.

**Standing hypotheses of Layer IHG.6** (the hypotheses of [DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Theorem 2.1,
pp.7–8, which every statement below that says "under the standing hypotheses" assumes in full).
`T ⊆ T̃` is an inclusion of commutative noetherian rings, `T` local with maximal ideal `m`, both
complete and separated for the `m`-adic topology; `Ĩ ⊆ T̃` is a proper nonzero ideal and
`I = Ĩ ∩ T`; `K = Frac(T̃)` is the total ring of fractions of `T̃`, assumed to be a finite product of
local rings whose maximal ideals are principal, with reduced quotient `K₀ = ∏ k_i` a finite product
of fields. `K` is artinian with every ideal principal; equivalently here it is a finite product of
artinian local principal ideal rings. Equip `K` with a Hausdorff ring topology such that
`T → K` is a topological embedding for the `m`-adic topology. The results below use this
explicit topology hypothesis, as well as continuity of both characters. `G` is a compact
topological group and `ρ : G → GL₂(K)` is continuous. For every `g ∈ G` the characteristic
polynomial of `ρ(g)` lies in `T[X]` and reduces modulo `I` to `(X − χ(g))(X − ψ(g))` for two
continuous characters `χ, ψ : G → T^×` with `χ ≡ ψ` modulo `m` (residual indistinguishability; the
residually distinguished case is Ribet theory for distinct residual characters). For
every projection `K → K₀ → k_i` the induced representation `G → GL₂(k_i)` is irreducible over `k_i`
(no `G`-stable line). The local data are a finite set `S = Σ ⊔ P` of subgroups `G_v ⊆ G`, for each
`v ∈ S` a basis of `K²` in which `ρ|G_v` is lower triangular with diagonal characters
`η_v, ξ_v : G_v → T̃^×`, for `v ∈ Σ` the congruence `ξ_v ≡ ψ|G_v` modulo `Ĩ`, for `v ∈ P` a
subgroup `I_v ⊆ G_v` with `ξ_v|I_v ≡ χ|I_v` modulo `Ĩ`, a chosen `v₀ ∈ Σ` when `Σ` is nonempty, and
a chosen `σ_v ∈ G_v` for each `v ∈ P`. The **global hypotheses** (Theorem 1.1 of DKSW, pp.2–3) are
the special case `T̃ = T`, `Ĩ = I`, `S = ∅`, with `T` reduced and without the residual
indistinguishability, so that `K = Frac(T)` is a finite product of fields. Irreducibility is not a
consequence of the congruences: the scalar representation `ψ·I₂` with `χ = ψ` satisfies every
congruence and is excluded only by this hypothesis, and without it the Fitting containments below
fail (the local module is `0` and its Fitting ideal is the unit ideal). The Checks record this: the
scalar representation fails irreducibility, satisfies the congruences and refutes the
containment, and for the trivial group the only cocycle is `0`, which refutes the global theorem
without irreducibility.

**Check.** The zero ring cannot serve as the total fraction ring of `ℤ`. If the
fraction-ring hypothesis were omitted, every assertion about field quotients of that zero ring
would be vacuous; `¬ IsLocalization (nonZeroDivisors ℤ) (ZMod 1)` excludes this case.

**Fitting annihilator bound.** The supplier `TauCeti.Module.fittingIdeal_le_annihilator`, owned
by PadicMeasuresIwasawaAlgebras §4.5, states
`Fitt₀_A(M) ⊆ Ann_A(M)` for a finitely presented module over a commutative ring
([Stacks](https://stacks.math.columbia.edu/tag/07ZA), Lemma 15.8.4(6), tag 07ZA); the Ribet
modules of this layer are finite over the noetherian `T`, hence finitely presented. The supplier
proves the bound using adjugates of finite relation minors.
*Needs:* PadicMeasuresIwasawaAlgebras §4.5, Tau Ceti `fittingIdeal`, Mathlib `Module.annihilator`.

**Checks.**

- For the cyclic module, `Ann_ℤ(ℤ/6)=(6)`.
- The containment can be strict: `Fitt₀_ℤ((ℤ/2)²)=(4)` while its annihilator is `(2)`.
- For the zero module both ideals are the unit ideal.

### 6.1 Character differences and the Ribet cocycle

**Character congruence on the group algebra.** Let `A ⊆ B` be commutative rings, `J ⊆ A` an
ideal, `ρ : G → GL₂(B)` an `A`-linear representation and `χ, ψ : G → Aˣ` characters. Prove that if
`tr(ρ(g))` and `det(ρ(g))` lie in `A` and reduce to `χ(g) + ψ(g)` and `χ(g)ψ(g)` modulo `J` for
every `g`, then for every `t ∈ A[G]` the characteristic polynomial of `ρ(t)` lies in `A[X]` and
reduces to `(X − χ(t))(X − ψ(t))` modulo `J` ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §2.1, equation (13), p.8).
*Needs:* Amitsur's formula for determinants.

**Character difference modules.** For an `A`-algebra representation `ρ : A[G] → M₂(B)` and a
character `ψ : A[G] → A`, define `IntegralRibet.differenceModule` as `Δψ`, the range of the
`A`-linear map `IntegralRibet.differenceMap`, `t ↦ ρ(t) − ψ(t)I₂` on `A[G]`, and for `χ, ψ` define
`ΔχΔψ`, the ambient product submodule, the `A`-span of all
products `x*y` with `x ∈ Δχ`, `y ∈ Δψ`. Prove that `Δψ`
is generated by the `ρ(g) − ψ(g)I₂` for `g ∈ G` ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §2.1, equation (14),
pp.8–9). *Needs:* Mathlib `MonoidAlgebra`, `Matrix`, `Submodule`.

**Checks.**

- If `ρ(g) = ψ(g)I₂` for all `g` and `χ = ψ`, then `Δψ = 0`: every difference `ρ(t) − ψ(t)I₂`
  vanishes, so a definition that took the span of the `ρ(g)` rather than of the differences would
  return a nonzero module here.
- For the trivial group and the trivial scalar representation, `Δψ = 0`: the degenerate case,
  where a definition that inserted the identity matrix as a generator would fail.
- For `G = ℤ`, `A = B = ℤ` and `ρ(n) = [[1,n],[0,1]]`, `χ = ψ = 1`: `Δψ = ℤ E₁₂` (the differences
  are `n E₁₂`) and `ΔχΔψ = 0` (since `E₁₂² = 0`), whereas the sum of the two difference modules is nonzero. The Lie bracket is also zero
  in this example. A separate check uses
  `G=ℤˣ`, `ρ(u)=uI₂`, and `χ=ψ=1`: `Δψ=2ℤI₂`, whereas
  `ΔχΔψ=4ℤI₂≠0`. All commutators vanish. This distinguishes multiplication from
  the bracket and from the sum of the two difference modules.

**Product containment of difference modules.** For the preceding algebra maps, prove
`ΔχΔψ ⊆ Δψ` ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §2.1, p.9). *Needs:* Character difference modules.

**Checks.**

- Matching scalar data have zero product and zero right difference module.
- For the integral upper-unipotent action with both characters trivial, the product is zero
  inside the nonzero module `ℤE₁₂`.
- For the sign scalar action with both comparison characters trivial, the containment is
  `4ℤI₂ ⊆ 2ℤI₂`, and the two modules differ.

**Initial Ribet quotient module.** Define `IntegralRibet.initialModule` as
`M₀ = Δψ / (ΔχΔψ)`, interpreting the product submodule inside `Δψ` by the preceding containment
(`IntegralRibet.productInside`), with the quotient map from `Δψ` to `M₀`. Prove that
the classes of `ρ(g) − ψ(g)I₂` generate `M₀`
([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §2.1, equation (14), p.9). *Needs:* Product containment of difference modules.

**Checks.**

- For `ρ = ψI₂` and `χ = ψ`, `M₀ = 0`: both `Δψ` and the product vanish, so a definition whose
  quotient were taken in `M₂(B)` rather than in `Δψ` would not give zero.
- For the integral upper-unipotent representation of `ℤ` and `χ = ψ = 1`, `M₀ ≅ ℤ`: `Δψ = ℤE₁₂`
  and the product is zero, so this is a torsion-free nonzero quotient. The zero denominator does not distinguish a
  submodule product from its ambient two-sided ideal.
  The normalized identification sends the canonical cocycle at `n` to `n`.
- An `A`-linear map `Δψ → L` factors uniquely through `M₀` iff it annihilates every product
  `(ρ(t) − χ(t))(ρ(u) − ψ(u))`: this is the universal property of the quotient, which a definition
  with the wrong submodule in the denominator would fail.

**Canonical Ribet cocycle.** For the preceding modules define `α = χψ⁻¹` and
`IntegralRibet.canonicalCocycle` as the cocycle `κ₀` with scalar action `χψ⁻¹`, given by
`κ₀(g) = ψ(g)⁻¹[ρ(g) − ψ(g)I₂]` in `M₀`. Prove that it is a
one-cocycle for the scalar action `α`, `κ₀(gh) = κ₀(g) + α(g)κ₀(h)`, and
that the `A`-span of `κ₀(G)` is all of `M₀`
([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Lemma 2.3 and proof, p.9). *Needs:* [ProfiniteCohomology, layer
2][profinitecohomology2], Initial Ribet quotient module.

**Checks.**

- `κ₀(1) = 0`: the difference `ρ(1) − ψ(1)I₂` vanishes, as the cocycle equation at `g = h = 1`
  forces; this is the degenerate value, and a definition that recorded the class of `ρ(g)` rather
  than of `ρ(g) − ψ(g)I₂` would return the class of `I₂` here instead of `0`.
- For the integral upper-unipotent representation of `ℤ` with `χ = ψ = 1`, `κ₀(n) = n` in
  `M₀ ≅ ℤ`: the cocycle is the identity `ℤ → ℤ`, so a definition that divided by `χ(g)` instead
  of `ψ(g)` still agrees here, but one that recorded the class of `ρ(n)` rather than of
  `ρ(n) − I₂` would return a constant.
- The underlying function satisfies the continuous cochain API's twisted cocycle equation, with
  `α(g)`, rather than `α(h)`, multiplying `κ₀(h)`: a definition using the opposite twist
  convention `κ(gh) = α(h)κ(g) + κ(h)` would not match the API's `IsCocycle₁` shape.

- For `g = diag(2,3)` and `h = [[1,1],[0,1]]` over `ℚ`, the upper entry of `gh` is `2`
  and its lower diagonal entry is `3`. Thus `κ(gh) = 2/3 = κ(g) + (2/3)κ(h)`, with
  `κ(g)=0`, `κ(h)=1`. Dividing the upper entry by `χ(gh)=2` would instead give `1`.
  This two-factor calculation fixes the `ψ⁻¹` normalization and the order of the twisted action.

**Ribet module with local conditions.** Given a finite partition `S = Σ ⊔ P` of subgroups
`G_v ⊆ G`, inertia subgroups `I_v ⊆ G_v` for `v ∈ P`, and `v₀ ∈ Σ` when `Σ` is nonempty, form
`N₀ = M₀ ⊕ ⊕_{v ∈ Σ∖{v₀}} A y_v`. Let `Q` be generated by `κ₀(G_{v₀})`, by
`κ₀(g) − (α(g) − 1)y_v` for `g ∈ G_v` and `v ∈ Σ∖{v₀}`, and by `κ₀(I_v)` for `v ∈ P`. Define
`IntegralRibet.localModule` as `N = N₀/Q`, the quotient of `M₀` with the adjoined coboundary
vectors, and `IntegralRibet.localCocycle` as the image `κ` of `κ₀` in `N`. When `Σ` is empty there
is no `v₀` relation and no `y_v`. Prove that `κ|G_{v₀} = 0`,
`κ(g) = (α(g) − 1)y_v` on the other `Σ` subgroups, and `κ|I_v = 0` for `v ∈ P`, and that
`N` is generated by `κ(G)` together with the `y_v`
([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §2.1, pp.9–10, with the sign corrected to Theorem 2.1). *Needs:* Canonical Ribet cocycle.

**Checks.**

- For `S = ∅`, `N = M₀` and `κ = κ₀`: no relations and no adjoined vectors, so a definition that
  always inserted a `v₀` relation would quotient `M₀` wrongly.
- For `Σ = {v₀}`, `G_{v₀} = G` and `P = ∅`, `N = 0`: the relation `κ₀(G)` kills the generating set
  of `M₀`, so a definition whose `v₀` relation used only `I_{v₀}` or omitted it would leave `N`
  nonzero.
- For scalar `ρ = ψI₂`, `χ = ψ`, `Σ = {v₀, v₁}` and both subgroups trivial, `M₀ = 0` but
  `N ≅ A y_{v₁}`; the cocycle alone does not generate `N`, so a definition of `N` as the span of
  `κ(G)` alone, or a span lemma without the `y_v`, would fail.

**Finite and continuous Ribet modules.** For the canonical local construction over a
noetherian inclusion `T ⊆ T̃`, supply a finite `T`-submodule `Λ ⊆ M₂(K)` containing both
`Δχ` and `Δψ`. Require that the topology induced from `M₂(K)` on `Λ` equals its
`m_T`-adic module topology. These are additional inputs to `IntegralRibet.local_ribet`;
`T̃` need not be finite over `T`, the residue field need not be finite, and irreducibility
is over the reduced field factors, including inseparable characteristic-two representations.

Prove that over noetherian `T`, this containment makes
`Δχ`, `Δψ`, `M₀` and `N` finite. Prove that for any ideal
`m`, a submodule of a finite module with its induced `m`-adic topology has that same topology
intrinsically, by [Artin–Rees, Stacks Lemma 10.51.2](https://stacks.math.columbia.edu/tag/00IN).
Prove that for any module `M`, ideal `m` and submodule `Q`,
the `m`-adic topology on `M/Q` is the topology coinduced by `M → M/Q` from the `m`-adic
topology on `M`; the images of `mⁿM` are `mⁿ(M/Q)`
([Stacks §10.96](https://stacks.math.columbia.edu/tag/00M9)).
These then give continuity of both canonical cocycles
for their intrinsic adic topologies, assuming continuous `ρ`, `ψ`, and `T → K`, an adic topology
on `T`, and a topological ring `K`. This uses the preceding submodule comparison, scalar
multiplication and the two quotient maps. The algebraic construction is
[DKSW §2.1, equations (13)–(14), printed pp.8–9](https://arxiv.org/pdf/2310.16396v2).
*Needs:* Ribet module with local conditions, Mathlib noetherian submodules and quotient modules.

**Finite orders and the global coefficient ring.** Prove
that an `A`-subalgebra `Ω ⊆ M₂(K)` containing `ρ(G)` contains both character difference
modules. An arithmetic use of a finite coefficient order must establish `Module.Finite A Ω`,
containment of `ρ(G)`, and equality of the induced and adic topologies on `Ω`; compactness
alone supplies none of these three inputs over an arbitrary extension.

For the global case `K=Frac(T)` with `T` complete reduced noetherian local, prove
that if each field-factor representation is irreducible
and all characteristic polynomials lie in `T[X]`, both difference modules lie in a finite
`T`-submodule of `M₂(K)`. This is an algebraic boundedness theorem, independent of compactness.
Its proof decomposes `K` into its finitely many field factors. The image algebra on a
two-dimensional irreducible factor is either the full matrix algebra or a quadratic field.
In the matrix case a basis selected from group elements and the nondegenerate matrix trace
pairing bound the coefficients by a finite trace-dual module. In the field case the image
elements are integral over the corresponding domain quotient of `T`; finite normalization
bounds them even for a purely inseparable quadratic field. SchemeAndStackFoundations §0.20
supplies `Ring.IsJapanese.of_complete_local` and `Ring.IsNagata.of_complete_local`:
the integral closure of a complete noetherian local domain in any finite extension of its
fraction field is finite, including inseparable extensions
([Stacks Lemma 10.162.8, tag 032W](https://stacks.math.columbia.edu/tag/032W)).
The finiteness of integral closures used here is only the specialization of that Japanese
condition to the fraction field and scalar tower used here. Consume these neutral ring-level
exports for the domain quotients of `T`.
The finite product of these bounds contains the original image and its scalar differences.
This supplies the boundedness step in [DKSW Theorem 1.1, pp.2–3 and §2.1, pp.8–9](https://arxiv.org/pdf/2310.16396v2).

The fraction-lattice topology target proves the topology input for every finite submodule
of `M₂(Frac(T))`, assuming `T` noetherian local with its adic topology, a topological ring
structure on `Frac(T)`, and an embedding `T → Frac(T)`. Clear a common regular denominator
and use Artin–Rees inside a finite free `T`-module. Thus `T̃=T` supplies both inputs to the
canonical local theorem without changing the global hypotheses. *Needs:* SemisimpleAlgebras
layers 2–4, SchemeAndStackFoundations §0.20 `Ring.IsJapanese.of_complete_local` and
`Ring.IsNagata.of_complete_local` through the finiteness of integral closures above, and the
submodule topology comparison of Finite and continuous Ribet modules.

**Checks.**

- Scalar data with no local places give the finite zero module.
- Integral upper-unipotent data give the finite nonzero
  quotient `M₀ ≃ ℤ`.
- If the matrix coefficients themselves lie in a
  finite `A`-algebra, the whole matrix module is a valid finite bound for every local datum.
- The `2`-adic topology on `ℤ/(4)` is the quotient of that on `ℤ`.
- The unchanged global coefficient hypotheses supply
  both the finite lattice and its topology comparison by applying their actual suppliers.
- In characteristic two, `J=[[0,t],[1,0]]`
  satisfies `J²=tI₂`, and every product in `k[J]` has matrix trace zero. When `t` is nonsquare,
  this algebra acts irreducibly, so its finite bound uses normalization instead of trace duality.
  A further check shows that no nonzero vector is an eigenvector when
  `t` is nonsquare, retaining ordinary irreducibility in characteristic two.
- If functionals `ℓᵢ : Δ → T/m` kill `Δ²`
  and take values `ℓᵢ(δⱼ)=δᵢⱼ`, the empty-local quotient is not finite. In particular take
  `k=𝔽₂(u₁,u₂,…)`, `k′=k(a₁,a₂,…)`, `aᵢ²=uᵢ`, `T=k[[t]]`, `T̃=k′[[t]]`,
  `J=[[0,t],[1,0]]`, and the compact group `∏_{i≥0} ℤ₂` acting by `I₂+J` in coordinate zero
  and `(1+aᵢtⁱ)I₂` in coordinate `i≥1`, with `χ=ψ=1`. Squarefree monomial weights
  `w(S)=Σ_{i∈S}i` show that extraction of the `aᵢtⁱ` scalar coefficient kills `Δ²` and
  separates those differences. Also `tΔ⊆Δ²`. The characteristic polynomials are integral
  and split modulo `t`, while `J` has no invariant line over `k′((t))`.
- An `m`-annihilated module is discrete
  for its adic topology. Nonzero canonical cocycle values on a sequence tending to the identity
  therefore exclude continuity. The coordinate generators in the preceding example give such
  a sequence. Its infinite quotient cannot satisfy the finite-lattice input.

**Every cocycle representative generates.** Let `(T, m)` be local, `M` a finite `T`-module and
`α : G → Tˣ` with `α(g) ≡ 1` modulo `m`. Prove that if a cocycle `κ` has `T`-span `M`, every
cohomologous cocycle `κ′(g) = κ(g) + (α(g) − 1)y` also has `T`-span `M` ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf),
Theorem 1.1 and §2.1, pp.3,9). *Needs:* [ProfiniteCohomology, layer 2][profinitecohomology2].

**Ribet theory for distinct residual characters.** Under the global hypotheses of this layer
(`T` complete reduced noetherian local, `K = Frac(T)`, continuous `ρ`, the characteristic
polynomial congruence modulo `I`, irreducibility on every field factor) with `χ ≢ ψ`
modulo `m`, choose `τ` with `χ(τ) − ψ(τ)` a unit and diagonalize `ρ(τ)` using its two Henselian
roots. Let `B` be the finite `T`-module generated by the upper-right matrix entries `b(g)`. Prove
that `κ(g) = ψ(g)⁻¹ b(g)` modulo `IB` is a continuous cocycle, that every representative generates
`B/IB`, that `B` is faithful and that `Fitt₀_T(B/IB) ⊆ I`. The proof chooses a residual character
separator, lifts its two spectral roots henselianly, and controls the products of opposite
off-diagonal entries, using the upper-entry lattice in that basis and its separate local-condition
calculation ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Introduction, pp.4–5). *Needs:* Tau Ceti `TauCeti.fittingIdeal`,
Character congruence on the group algebra, [ProfiniteCohomology, layer
2][profinitecohomology2], Henselian lifting of matrix units.

`IntegralRibet.fieldRepresentation ρ φ` extends the coefficient-changed group action
linearly to `k[G]`. Irreducibility on the field quotient `φ` is `IsSimpleModule (k[G])`
on its `matrixModule`, and `IntegralRibet.IrreducibleOnFields` asks for it at every surjection
onto a field; the same invariant-subspace dictionary, specialized to group generators,
characterizes it. The dimension-two field module is nonzero, so its
characterization needs no additional nonzero hypothesis.

**Checks for the Ribet predicates.** The scalar representation of `χ` satisfies
`IntegralRibet.Congruence` with `(χ,χ)` and ideal zero; the integer upper-unipotent
representation satisfies it with `(1,1)` and ideal zero. Every representation over `A` satisfies
it modulo the unit ideal, since its characteristic polynomial is already integral.
Irreducibility on a field quotient fails for a scalar representation over `ℚ` and for the integer
upper-unipotent representation after reduction along the surjective map `ℤ→𝔽₂`: the
proper nonzero line `𝔽₂(1,0)` is invariant; it holds for the natural representation
of `GL₂(ℚ)`. `IntegralRibet.IrreducibleOnFields` fails for scalar `ℚ` and integer upper-unipotent
representations, but holds vacuously over the zero coefficient ring, which has no maps to fields.
The total-fraction hypotheses in the extension theorems exclude that last input. These
predicates express the conditions of DKSW Theorem 2.1, pp.7–8.

**Checks for the triangular local input.** The empty place set accepts arbitrary
representations. For `G=ℤˣ`, `ρ(u)=uI₂`, ideal zero,
and one distinguished place with subgroup all of `G`, there is
local input with identity basis and both characters equal to `u`. For the same representation,
local input with both prescribed characters equal to `1` is rejected: at `u=−1`
every conjugate is `−I₂`, so its second diagonal entry cannot be `1` in `ℤ`.
These are the empty case, a full structure, and a failed congruence for
`IntegralRibet.LocalInput` (DKSW Theorem 2.1 (9)–(11), pp.7–8).

### 6.2 Relation minors and the auxiliary matrices

**Five types of Ribet module relations.** Choose `g_i` such that
`ρ_i = ρ(g_i) − ψ(g_i)I₂` span `Δψ` and the `ρ(g_i) − χ(g_i)I₂` span `Δχ`. Adjoin
the `y_v`, and write `ν_i = ψ(g_i) − χ(g_i)`. Prove that a presentation of `N` consists of
relations of five types: (I) linear relations among the `ρ_i`; (II) the coefficients `δ_ijk` from
`(ρ_i + ν_i)ρ_j = ∑ δ_ijk ρ_k`; (III) the coefficients of `ρ(σ) − ψ(σ)`, `σ ∈ G_{v₀}`; (IV) those
for `σ ∈ I_v`; (V) those for `σ ∈ G_v` together with `ψ(σ) − χ(σ)` in the `y_v` column
([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §2.2, equations (18)–(24), pp.10–11). *Needs:* Ribet module with local conditions, Tau Ceti `TauCeti.fittingIdeal`.

**Checks.**

- For `G = (ℤ/2)²`, `T = ℤ₂`, trivial `ρ`, `ψ(a,b) = (−1)^a`, `χ(a,b) = (−1)^b`
  and `S = ∅`, both difference modules are `2ℤ₂I₂` and their product is `4ℤ₂I₂`.
  Choosing only `g₁=(1,0)` gives `ρ₁=2I₂`, `ν₁=−2` and a zero type (II) relation,
  incorrectly presenting `ℤ₂`. Adjoining `g₂=(0,1)` supplies the missing χ-generator:
  `ρ₂=0`, `ν₂=2`, and `(ρ₂+ν₂I₂)ρ₁=2ρ₁` gives the relation `2`, so
  `N ≅ ℤ/2` and `Fitt₀(N)=(2)`.
- For the integral upper-unipotent representation of `ℤ`, `χ=ψ=1` and `S=∅`,
  the single difference generator `E₁₂` spans both modules, its square is zero, and
  the presentation gives `N ≅ ℤ` with `Fitt₀(N)=0`.
- For `ρ=ψI₂`, `χ=ψ` and `S=∅`, all chosen difference generators are zero;
  type (I) relations kill each of them, giving `N=0` and `Fitt₀(N)=T`.

**Stabilization of local relation rows.** Prove that adding each locally appearing
`ρ(σ) − ψ(σ)` as a new generator, with a defining relation and a pivot row, changes the
presentation but preserves its square relation determinant up to a chosen row/column ordering
sign; local rows then have one pivot and at most one `y_v` entry. Include also each chosen
`ρ(σ_v) − ψ(σ_v)` for `v ∈ P`, adjoining its defining type (I) relation to the minor, so the
auxiliary top row has a pivot in that generator's column. Use a separate generator slot for
each selected local occurrence, even if its group element repeats. Write `i(σ)` for that slot
and use it for all four matrix coordinates and the character difference of the occurrence
([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §2.3,
pp.11–12; §3.2, local indexing, p.18). *Needs:* Five types of Ribet module relations, Tau Ceti
`TauCeti.fittingIdeal_eq_minorsIdeal_ker`.

**Checks.**

- Adjoining a generator with defining row `(α, −1)` to the one-row minor `(d)` gives
  `[[d,0],[α,−1]]`, of determinant `−d`; the ordering sign accounts for the change.
- Stabilizing the type (V) row `(2,3,ν_σ)` gives defining row `(2,3,−1,0)` and
  local row `(0,0,1,ν_σ)`, with the new generator column before the `y_v` column.
- For two occurrences of the same group element with difference matrix `[[1,2],[3,4]]`,
  the upper-coordinate difference `b_{i(σ,1)}−b_{i(σ,2)}` specializes to `2−2=0`,
  although it is a nonzero polynomial in the unconstrained formal slots.

**Weighted auxiliary matrix.** For a stabilized square relation matrix `D` and local choices
`σ_v`, adjoin a block upper-triangular matrix `E_arith` over `T̃` with diagonal
`z_v = ξ_v(σ_v) − χ(σ_v)`: with
`t = |P|` and `D` of size `r + s`, `E_arith` is the `(r + s + t)`-square matrix with the `t × t` diagonal
block `diag(z_{σ_v})`, the coefficients `α_{σ_v, j}` of `ρ(σ_v) − ψ(σ_v) = ∑_j α_{σ_v, j} ρ_j`
to their right (the pivot vector after stabilization), a zero block below, and `D` in the lower right.
The original type (IV) entries in the place columns are zero and the type (V) `y_v` entries
are `ν_σ = ψ(σ) − χ(σ)`. Prove the exact arithmetic identity
`det E_arith = (∏_{v ∈ P} z_v) det D` ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §2.4, equation (28), p.12). Write `ρ_j =
ρ(g_j) − ψ(g_j) = [[a_j, b_j],[c_j, d_j]]` for the chosen generators, `x_σ = ξ_v(σ) − ψ(σ)` and
`a(σ) = a_{i(σ)}` after stabilization. The altered arithmetic matrix
`E′_arith ∈ M_{r+s+t}(K)` is obtained from `E_arith` by
replacing each diagonal entry `z_{σ_v}` by `x_{σ_v} − a(σ_v)`, leaving rows of types (I) and (III)
unchanged, replacing in each type (II) row `δ_ijj` by `δ_ijj − a_i − ν_i` and `δ_iji` by
`δ_iji − d_j`, inserting `ξ_v(σ) − ψ(σ) − a(σ)` into the `v`-column among the first `t` columns of
each type (IV) row, and replacing the `y_v`-entry `ψ(σ) − χ(σ)` of each type (V) row by
`ξ_v(σ) − ψ(σ) − a(σ)` ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §2.4, equations (29)–(30) and the list (I)–(V),
pp.12–13). If `i=j` in a type (II) row, both subtractions apply to its single `i`-entry.
*Needs:* Stabilization of local relation rows.

**Checks.**

- With `P = ∅`, `E_arith = D`, so the empty weight is `1`.
- For `D=(5)`, `z_v=2` and top pivot `1`, `E_arith=[[2,1],[0,5]]` has determinant `10`.
- For `D=(5)` and `z_v=0`, the arithmetic determinant is zero whatever the top coefficient;
  the identity uses no division by a local factor.

**Kernel vector for the altered matrix.** Under the standing hypotheses of Layer IHG.6,
choose the global basis lower triangular on `G_{v₀}` with second diagonal character `ξ_{v₀}`
when `Σ` is nonempty, before choosing the generators and forming `E′_arith`.
Prove that this matrix has, on each principal artinian local factor `K_i`, a kernel vector
with a unit coordinate. If all local
`D_v` are units, its entries are `−B_v/D_v`, the `b_i` and `−B_w/D_w`; otherwise multiply by a
maximal power of the principal maximal-ideal generator and normalize the corresponding local `D_v`
([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Lemma 2.4 and proof, pp.13–14). *Needs:* Weighted auxiliary matrix.

**Vanishing of the altered determinant.** Under the standing hypotheses of Layer IHG.6,
with `E′_arith` formed in the same distinguished-place basis as in the preceding target, prove
`det E′_arith = 0` in `K` ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Lemma 2.4, pp.13–14). *Needs:* Kernel vector for the altered matrix.

**Checks for the kernel vector and determinant.**

- Over `ℚ`, `[[2,1],[4,2]]` kills `(-1/2,1)` and has determinant zero; the unit
  coordinate forces the determinant to vanish by the adjugate identity.
- Over `ℤ/(4)`, take `D_v=2`, `B_v=1`, `b=1` and `x−a=2` in the local identity
  `D_v b = B_v(x−a)`. Division by `D_v` is unavailable, but the scaled vector `(-1,2)`
  has a unit coordinate and is killed by `[[2,1],[0,0]]`, whose determinant is zero.
- Over `ℤ/(4)`, the matrix `(2)` kills the nonzero vector `(2)` but has nonzero
  determinant. A merely nonzero kernel vector cannot replace the unit-coordinate condition.
- Without irreducibility, take `ρ=ψI₂`, `χ=ψ`, `S=P=∅` and the single generator `g₁=1`.
  Then `ρ₁=0`, the valid type (I) relation matrix is `D=(1)`, and `E′_arith=D` has
  determinant one and no nonzero kernel. The total-fraction-ring assumption alone is insufficient.

**Trace congruences for difference words.** For a noncommutative polynomial `f(X₁, …, X_r)` with
zero constant term, prove `tr f(ρ₁, …, ρ_r) ≡ f(−ν₁, …, −ν_r)` modulo `I`, and also
`det(Δψ) ⊂ I`. These are integral rank-two identities ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Lemmas 2.5–2.6,
pp.15–16). *Needs:* Character congruence on the group algebra.

### 6.3 Formal matrix algebra and invariant error

**Formal Ribet matrix ring.** When `Σ` is nonempty, first conjugate the global
representation into the supplied lower-triangular basis at `v₀`, before choosing the difference
generators and relation minor; transport every other local basis through that conjugation.
Thus, for a distinguished-place occurrence, `b_σ=0` and
`d_σ=ξ_{v₀}(σ)−ψ(σ)` in this global basis. When `Σ` is empty no basis constraint is imposed.
For a fixed finite relation minor in this basis, let
`R₀ = ℤ[ν_i, ε_(row,i), δ_(row,ijk), x_σ]` with distinct variables for each selected relation, let
`R₁ = R₀[a_i, b_i, c_i, d_i]` and define the formal Ribet ring
`R = R₁/(b_σ : σ ∈ B_{v₀})`, with distinct row-indexed coefficient variables. The matrices
`Y_i = [[a_i, b_i],[c_i, d_i]]` have a conjugation coaction of the lower Borel `B` of `GL₂/ℤ`, with
`R₀` trivial; define this integral lower-Borel conjugation
coaction on `R`, and the evaluation algebra map `π : R → K` determined
by the relation data, sending all variables to the chosen relation coefficients, differences and
local diagonal values. Use the stabilized occurrence slots of §6.2: `ν_σ` denotes the coefficient
variable `ν_{i(σ)} ∈ R₀`, with `π(ν_σ)=ψ(σ)−χ(σ)`, and `a_σ,b_σ,c_σ,d_σ` denote the coordinates
of `Y_{i(σ)}`. For each selected type (IV), type (V), or auxiliary top occurrence, its coefficient
variable `x_σ` specializes to `ξ_v(σ)−ψ(σ)`. Repeated group elements retain separate formal
slots with equal specialized values ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §3.1,
equations (35)–(37), pp.17–18). *Needs:* Five types of Ribet module relations, Stabilization of local relation rows.

**Checks.**

- With no matrices or relation variables, `R = ℤ`: the degenerate case, which a definition that
  always adjoined at least one generic matrix would fail.
- With one matrix and no `v₀` constraint, `R = ℤ[a, b, c, d]` apart from the `R₀` variables: no
  `b_σ` is killed, so a definition that imposed `b = 0` for every matrix rather than only for
  `σ ∈ B_{v₀}` would compute a smaller ring.
- Over `ℤ₃`, `g=[[1,3],[0,4]]` lies in `1+3M₂(ℤ₃)` and has a lower-triangular
  conjugate by the swap matrix, although its original upper entry is `3`. After choosing
  that lower-triangular global basis, `ρ(g)−1=[[3,0],[3,0]]`, so the distinguished
  upper entry evaluates to zero and the evaluation factors through `R`.
- Imposing `b = 0` gives `ℤ[a, c, d]`, whose lower-Borel torus fixes `a, d` and weights `c`: the
  coaction computes the weight of `c` as the ratio of the diagonal entries, so a definition using
  the upper Borel or the inverse weight would fail this.

**Checks for the formal coaction.** The coaction is inverse
conjugation on each generic matrix and fixes the coefficient variables.
The formal comodule is the right comodule obtained by interchanging the factors of this algebra map;
its coassociativity and counit are the full comodule axioms (DKSW Example 4.2, p.22).
The matching computations are `δ(u)=1⊗u` for a coefficient variable,
`δ(b)=(z/x)⊗b` for an upper-right entry, and `δ(a+d)=1⊗(a+d)`.
The evaluation `π` is fixed on every generator,
subject to the selected upper-right entries being zero.

**Modified formal auxiliary matrices.** Construct `𝔈, 𝔈′ ∈ M_{r+s+t}(R)` for the stabilized
minor. Lift every type (I) coefficient, including coefficients of defining relations, to its
row-indexed `ε` variable, and every type (II) coefficient to its row-indexed `δ` variable.
Keep the fixed local and auxiliary top pivots, and zero entries outside the coefficient
positions and the place entries specified here. In `𝔈`, put `x_σ+ν_σ` in each auxiliary top diagonal
entry, each type (IV) place entry, and each type (V) `y_v` entry. Define `𝔈′` by replacing
these entries by `x_σ−a_σ`, leaving types (I) and (III) unchanged, and subtracting `a_i+ν_i`
in column `j` and `d_j` in column `i` of a type (II) row indexed by `(i,j)`; both subtractions
apply if `i=j`. All indices and variables are those of Formal Ribet matrix ring
([DKSW](https://arxiv.org/pdf/2310.16396v2), §3.1, matrix construction, printed pp.17–18).
*Needs:* Weighted auxiliary matrix, Formal Ribet matrix ring.

**Checks.**

- At `x_σ=2`, `ν_σ=3`, `a_σ=7`, an auxiliary top row has place entry `5`, a pivot `1`,
  and altered place entry `−5`.
- At the same values, a type (IV) row has formal place entry `5` and altered entry `−5`,
  while its unaltered arithmetic place entry is zero.
- At the same values, a type (V) row has formal `y_v` entry `5` and altered entry `−5`,
  while its unaltered arithmetic `y_v` entry is `3`.

**Specialization of the formal auxiliary matrices.** Under the standing hypotheses of Layer IHG.6,
identify `T̃` with its image in the total fraction ring `K`. Prove that every entry of
`π(𝔈)−E_arith` lies in `Ĩ ⊆ T̃`, that `π(𝔈′)=E′_arith` in `M_{r+s+t}(K)`, and that
`π(det 𝔈)−det E_arith ∈ Ĩ`. The top entries specialize exactly because
`π(x_σ+ν_σ)=ξ_v(σ)−χ(σ)`. On a type (IV) row their difference from zero is
`ξ_v(σ)−χ(σ) ∈ Ĩ` for `σ ∈ I_v`; on a type (V) row the difference is
`ξ_v(σ)−ψ(σ) ∈ Ĩ` for `v ∈ Σ`. All other entries specialize exactly.
Thus `π(𝔈)` and `E_arith` are matrices over `T̃`; reduction modulo `Ĩ` and determinant
functoriality give the determinant congruence. The altered equality holds in `K`, where
the matrix coordinates take their values ([DKSW](https://arxiv.org/pdf/2310.16396v2), §3.1,
equation (38) and the following comparison, printed pp.17–18).
*Needs:* Modified formal auxiliary matrices, `IntegralRibet.LocalInput`, Mathlib `RingHom.map_det`.

**Checks.**

- In the schematic type (V) block `[[u11,u12,0],[u21,u22,0],[1,0,ν]]`, put
  `h=u11*u22−u12*u21`. Replacing `ν` by `x+ν` changes its determinant by `x*h`;
  a specialization with `x∈Ĩ` makes this zero modulo `Ĩ`, without making the two determinants equal.
- For a type (IV) entry, specialize `x=2`, `ν=3` over `ℤ` with `Ĩ=(5)`.
  The formal place entry becomes `5`, congruent to the arithmetic zero entry but unequal to it.
- In the type (V) block take `h=1`, `x=2`, `ν=3`, `a=7` over `ℤ`, `Ĩ=(2)`.
  The arithmetic determinant is `3`, the unaltered formal determinant specializes to `5`,
  and both altered matrices have determinant `−5`.

**Formal Ribet relation ideals.** In the formal ring `R` define
the full four-entry ideal `J` generated by the four entries of each linear relation matrix, each
product relation `(Y_i + ν_i)Y_j − ∑ δ_ijk Y_k`, and, for each local block
`B_v` with `v≠v₀`, each local matrix `[[A_στ, B_στ],[C_στ, D_στ]]` for pairs
of distinct stabilized occurrence indices `σ≠τ` in that same block, where

```text
A_στ = b_σ c_τ − (x_τ − d_τ)(x_σ − a_σ),
B_στ = b_σ (x_τ − a_τ) − b_τ (x_σ − a_σ),
C_στ = c_σ (x_τ − d_τ) − c_τ (x_σ − d_σ),
D_στ = A_τσ.
```

Define the `b`-entry subideal `J′ ⊂ J` generated only by
their `b` entries. Prove `J′ ⊂ J` and that
`J` and `J′` are lower-Borel stable ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf),
§3.2, (39)–(42), pp.18–19; Lemma 4.18, p.30). *Needs:* Formal Ribet matrix ring.

**Checks.**

- A singleton local block contributes no generators to `J` or `J′`. The excluded
  self-pair would give `A_σσ=bc−(x−d)(x−a)`, which at `b=c=0,x=1,a=d=0` is `−1`;
  adjoining it would change the ideal.
- With no selected relation rows or local pairs, `J = J′ = 0`: the degenerate case, where a
  definition generating `J` by all matrix entries would give the whole augmentation ideal.
- For `ε₁X₁ + ε₂X₂`, `J` has the four scalar coefficients and `J′` is `(ε₁b₁ + ε₂b₂)`: the
  `b`-entry ideal computes exactly one generator, so a definition of `J′` that took all entries of
  the upper row, or the `c` entries, would differ.
- `B_στ = −B_τσ` and `D_στ = A_τσ`; in characteristic two the alternating relation still has
  `B_σσ = 0`: a definition of `B_στ` that were merely antisymmetric rather than alternating would
  leave a nonzero `B_σσ` over `𝔽₂`.

**Evaluation annihilates the formal relation ideal.** For the chosen integral relation
coefficients and local triangularizations, prove `π(J) = 0` ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Lemma 3.1,
p.19). *Needs:* Formal Ribet relation ideals.

**Trace and determinant invariant subring.** In `R` let `A₀` be the image of the `R₀`-subalgebra
of `R₁` generated by `tr f(Y_i)` and `det f(Y_i)` for all noncommutative polynomials `f`, and define
`A = A₀[d_τ : τ ∈ B_{v₀}]`, that is
`R₀[trace/determinant words, d_τ]`. Prove the subring inclusions `R₀⊆A₀⊆A`,
that every specified word trace and determinant belongs to `A₀`, and that each selected
`d_τ` belongs to `A`. The equality with the lower-Borel invariant subring is the target
*Invariants of the formal Ribet ring* in §6.4 ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §3.3, p.19; Corollary 4.17, p.27). *Needs:* Formal Ribet matrix ring.

**Checks.**

- Before triangular constraints, the invariants of one `2×2` matrix are generated by `a + d` and
  `ad − bc`: the trace and determinant words of a single matrix, so a definition of `A₀` that
  omitted determinant words would miss `ad − bc` as a generator.
- With `b = 0` the Borel invariants are `ℤ[a, d]`: the adjoined `d_τ` and the traces generate
  them, so a definition of `A` without the `d_τ` would not equal `H⁰(B, R)`.
- Over `𝔽₂`, scalar matrices have trace zero but determinant `a²`; the determinant generator
  cannot be omitted, so a definition generating `A₀` by traces alone would lose `a²` in
  characteristic two.

**Polarized local character congruence.** For a local triangularization with characters `η, ξ`
and the `χ, ψ` congruence, prove
`(ξ(σ) − χ(σ))(ξ(τ) − ψ(τ)) + (ξ(τ) − χ(τ))(ξ(σ) − ψ(σ)) ≡ 0` modulo `Ĩ`. Thus if `τ ∈ I_v` and
`ξ(τ) ≡ χ(τ)`, the first product vanishes even when `σ` is outside `I_v` ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf),
Lemma 3.2, last local step, equation (47), pp.20–21). *Needs:* Character congruence on the group algebra.

**Invariant intersection with the character error ideal.** Let
`I_R = (a_i + ν_i, b_i, c_i, d_i) ⊂ R`. Prove `π(A ∩ (I_R + J)) ⊂ Ĩ` ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf),
Lemma 3.2, pp.20–21). *Needs:* Trace and determinant invariant subring, Trace congruences for difference words, Evaluation annihilates the formal relation ideal, Polarized local character congruence.

### 6.4 Koszul complexes, induction and good filtrations

DerivedModuleAlgebra §0.K.1 supplies the linear-functional Koszul complex, its finite-sequence
specialization, functoriality, tensor and homotopy interfaces, and weakly regular resolutions.

**Integral restriction to the lower Borel.** For `G = GL₂/ℤ`, its lower Borel `B`, every rational
`G`-module `V` and every `i ≥ 0`, prove that restriction `Hⁱ(G, V) → Hⁱ(B, V)` is an isomorphism.
Cohomology is derived scheme invariants, not cohomology of `G(ℤ)` ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Theorem
4.4, p.23). *Needs:* Rational cohomology of a flat affine group scheme, Invariant coordinate algebras under conjugation.

**Adjoint weight and dual identities.** For the inverse-conjugation coordinate representation `𝒜 = ℤA ⊕ ℤB ⊕ ℤC ⊕ ℤD`
of `B`, the submodule `V = ℤA ⊕ ℤB` has action `A ↦ A + (y/x)B`, `B ↦ (z/x)B`. Write `ℤ(1) = ℤB`.
Prove `∧²V ≅ ℤ(1)`, `V* ≅ V(−1)`, `V ⊗ V* ≅ 𝒜` and `V ⊗ V ≅ 𝒜(1)` ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Example
4.2, p.22; Lemma 5.10, p.42). *Needs:* Tau Ceti `TauCeti.Comodule`, Rational cohomology of a flat affine group scheme.

**Lower-Borel Hopf coordinates.** The coordinate ring of the lower Borel is
`ℤ[x,z,y,x⁻¹,z⁻¹]`, with its five generators ordered as displayed.
It carries all Hopf axioms, with coproduct, counit and
antipode specified on every generator: `x,z` are group-like,
`Δy=y⊗x+z⊗y`, `ε(y)=0`, and `S(y)=−x⁻¹yz⁻¹`; the inverse coordinates are also group-like.
The restriction Hopf map from `GL₂` sends the generic `GL₂` matrix to `[[x,0],[y,z]]`.
The character of weight `(a,b)` is `x^a z^b`, with rank-one
coaction `m↦m⊗x^a z^b` (DKSW Definition 4.1 and Example 4.2, p.22;
Jantzen I.2.3, pp.21–22, and I.3.3, pp.38–39).

**Checks.**

- `xx⁻¹=1`, `zz⁻¹=1`, and `ε(y)=0`. The restriction map sends the upper-right coordinate
  to zero, the lower-left coordinate to `y`, and the determinant to `xz`.
- The universal coordinates satisfy `x≠1`, `y≠0`, and `x≠z`.
  Evaluation at rational lower-triangular matrices with respective coordinates
  `(2,1,0)`, `(1,1,1)`, and `(2,3,0)` distinguishes these elements.
- For `g=[[2,0],[3,5]]` and `h=[[7,0],[11,13]]` over `ℚ`, the lower-left
  entry of `gh` is `3·7+5·11=76`, whereas that of `hg` is `61`.
  Computing both matrices pins the order in `Δy`.
- Weights `(1,0)`, `(0,−1)`, `(0,0)` give respectively `x`, `z⁻¹`, `1`;
  their coactions on `1` give respectively `1⊗x`, `1⊗z⁻¹`, `1⊗1`.
- `H⁰((0,0))` is `ℤ`, `H⁰((0,1))` is zero, and `H⁰((0,−1))` has underlying module
  `ℤ²`. Each of `H⁰((0,0))`, `H⁰((1,0))`, `H⁰((0,−1))` has a one-step good
  filtration. A nonzero `H¹(G,M)` excludes a good filtration on `M`.

**Good filtrations and acyclicity.** For `G = GL₂/ℤ` with lower Borel `B`, use *Algebraic induction*
of §0.7 in its inversion-equivalent Jantzen convention. For a `B`-module `W` it is
`Ind_B^G(W) = (O[G] ⊗_ℤ W)^B`, with `B` acting on `O[G]` through right
translation. For a character `λ = (λ₁, λ₂)` of the diagonal torus, extended to `B`, this is the
module of functions `f ∈ O[G]` with `f(gb) = λ(b)⁻¹ f(g)`, on which `G` acts by left translation;
it is the dual Weyl module `H⁰(λ)`, nonzero exactly when `λ` is dominant for the upper Borel,
`λ₁ ≥ λ₂` (Jantzen, *Representations of algebraic groups*, I.3.3, pp.38–39, and II.2.6, pp.178–179, with `B` the negative
Borel). Since `B` is the lower Borel, the sign conventions are pinned by the computed example:
for `b = [[x, 0],[y, z]]` the second-column coordinates satisfy `b(gb) = z·b(g)`, `d(gb) = z·d(g)`,
so `Ind_B^G((0, −1)) = ℤb ⊕ ℤd ≅ (ℤ²)^∨` (highest weight `(0, −1)`), while `Ind_B^G((0, 1)) = 0`;
and `Ind_B^G((1, 0)) = ℤ(b/det) ⊕ ℤ(d/det) ≅ ℤ²`, the standard representation. DKSW write these
modules as `Ind_B^G(−λ)` because their `B`-action on a rank-one module is through the inverse of
the universal element (their Example 4.2 gives `B` the weight `z/x`); this roadmap writes
`H⁰(λ)` with `λ` dominant for the upper Borel, and the two conventions name the same modules.
The induced module `H⁰((a,b))` is formed from the actual restriction Hopf map from `GL₂` to `B`
and the rank-one comodule of the character `(a,b)`.
Good-filtration data on `M` consist of comodules `V_n` with injective comodule maps into `M`,
zero initial image, increasing images exhausting `M`, and successive quotients either zero or
`H⁰((a,b))` with `b≤a`. Quotient identifications are specified by surjective comodule maps
whose kernels are the preceding image. `M` has a good filtration if such data exist.
This is the countable exhaustive form, without a homogeneity restriction; it includes finite
filtrations by allowing zero factors. Jantzen II.4.16, pp.210–211, supplies the field definition;
the integral vanishing and tensor statements use DKSW's integral results.
The exhaustive form is needed because the coordinate rings of Layer IHG.6.4 have infinite-rank
central-weight components; DKSW's
Definition 4.6 states only the finite case. Prove that a countably filtered `G`-module with a
good filtration is `G`-acyclic, `H^i(G, V) = 0` for `i > 0` (rational cohomology of a flat affine
group scheme commutes with filtered colimits, Jantzen I.4.17, p.57, so the finite case of DKSW
Theorem 4.7 gives the exhaustive one), and that the tensor product of two
`G`-modules with good filtrations has a good filtration ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Definition 4.6 and
Theorem 4.7, p.23; Theorem 4.8, p.24). *Needs:* Rational cohomology of a flat affine group scheme,
Algebraic induction, Adjoint weight and dual identities.

**Checks.**

- The trivial module `ℤ = H⁰(0)` has a good filtration, with one step and the zero weight; a
  predicate that required a nonzero dominant weight would reject it.
- `H⁰((0, −1))` is the span of the coordinate functions `b, d` of the second column, and
  `H⁰((0, 1)) = 0`: the computed pin of the sign, which a definition using `f(gb) = λ(b) f(g)`, the
  upper Borel, or `−λ` without the inverse action would get wrong (it would make `(0, 1)` the
  nonzero case).
- The standard representation `ℤ² = H⁰((1, 0))` and its dual `(ℤ²)^∨ = H⁰((0, −1))` have one-step
  good filtrations; they are not isomorphic (their highest weights differ), so a predicate that
  identified `V` with `V^∨` would be wrong.
- A module with `H^1(G, V) ≠ 0` has no good filtration: the non-example, by the acyclicity
  theorem, which a predicate accepting arbitrary finite filtrations would wrongly admit.
- The polynomial ring `ℤ[a, b, c, d]` under conjugation has an exhaustive but no finite good
  filtration (its central-weight-zero component has infinite rank): a predicate demanding finite
  filtrations would exclude every coordinate ring used below.

**Twisted lower-Borel calculations.** All locators in this paragraph refer to
[DKSW, arXiv:2310.16396v2](https://arxiv.org/pdf/2310.16396v2), with printed page numbers.
For `B = {[[x,0],[y,z]]}`, the twist `M(j)` multiplies the right
coaction by `(z/x)^j`, the character of weight `(−j, j)`; this is `M(j)` of Example 4.2,
equation (48), p.22. Its cohomology is the existing rational cohomology of *Rational cohomology of
a flat affine group scheme* with that coaction. The `B`-cohomology of a `GL₂`-module first
restricts from `GL₂` along the restriction Hopf map. The restriction comparison is that
of Theorem 4.4, p.23 (*Integral restriction to the lower Borel*). No new continuous
group-cohomology carrier is involved.

For a countably exhaustively good integral `GL₂` module `V`, prove
that `H^i(B,V(j))=0` for natural `j` and `i>j`
(Lemma 4.11, p.24). Identify `H¹(B,V(1))` with `H⁰(GL₂,V)`; in particular
`H¹(B,ℤ(1))≅ℤ` (Lemma 4.12(1), p.24).
For `i>1`, prove that `H^i(B,V(i))⊗𝔽_p` is zero
for each prime `p>2`, and identify the reduction of `H^i(B,V(i))` modulo two with
`H⁰(GL₂,V)⊗𝔽₂` (Lemma 4.12(2)–(3), pp.24–25). Filtered colimits extend the finite
calculations to these exhaustive filtrations (Jantzen I.4.17, p.57).

For an injective equivariant map of commutative integral `GL₂`-algebras `S→T`, both
good, the twisted invariant product is induced by `a⊗b↦f(a)b`, with the first factor
twisted and the second invariant. The algebra coactions must preserve multiplication
and the unit. Prove that the identifications in twist one and in the diagonal twist modulo two
commute with this product; the proof uses the compatibility of the invariant product with
connecting maps (*Rational cohomology of a flat affine group scheme*), not just a graded-ring
structure. Prove that every diagonal class over `T` is a finite
sum of these products (Corollary 4.13, p.25). This is equivalently surjectivity of
the product map tensored over `H⁰(B,S)`; its stated form uses the tensor product over
`ℤ`, whose map factors through the balancing relations.

**Finite twisted resolutions and triangular acyclicity.** Prove
that a B-module admitting a bounded augmented
exact chain complex with term `V_k(k)` in degree `k`, each `V_k` good, has zero
positive B-cohomology (Lemma 4.14, pp.25–26). The augmentation is surjective,
exactness is required at every term, and all maps and term identifications are
comodule maps. The bound is essential to the downward dimension-shifting argument.

The adjoint comodule `𝒜` is the rank-four adjoint coordinate representation
of Example 4.2, p.22, with the inverse-conjugation coefficients
on the ordered matrix units. Its powers `𝒜^{⊗k}` are left-associated tensor powers, with
coactions specified in power zero and from each power to the next.
Prove that every natural power, including zero, has a good filtration and is `ℤ`-flat
(Corollary 4.9, p.24). Prove that for a
**ℤ-flat** good `V`, every positive cohomology group of
`V ⊗ R`, for a formal ring `R` of §6.3 with triangular constraints, vanishes, after restriction
to B and with the diagonal tensor coaction (Theorem 4.15, p.26). The coefficient variables are
fixed; any subset of upper-right coordinates is killed. The proof tensors the regular-coordinate
Koszul resolution with `V` and applies the finite twisted resolution above to its terms.
This supplies the result for every adjoint tensor power
appearing in `D`, and hence for all terms of that
complex (Proposition 5.5(2), pp.39–40).

**Checks.** The three Checks respectively give `H¹(B,ℤ(1))≠0`, `H¹(B,ℤ)=0` and
`H²(B,ℤ(1))=0`. Thus the bound is strict, and an arbitrary twist of a good module
is not asserted acyclic. The coaction sends `1` to `1⊗x⁻¹z` in twist one, `3` to `3⊗1` in twist zero,
and `1` to `1⊗xz⁻¹` in twist minus one.
The zeroth adjoint
power is `ℤ`, and its first two powers have rational ranks `4` and `16`.

**Integral trace and determinant invariants.** For a `ℤ`-flat commutative `R₀` with trivial `G`
action, prove that the `GL₂` scheme invariants in `R₀[a_i, b_i, c_i, d_i]` are generated over `R₀`
by the traces and determinants of all matrices in the algebra of the generic matrices. The proof
establishes the integral trace/determinant generator theorem with its relations, then commutes
flat extension with the invariant equalizer; the standard `GL₂` representation and its dual are
distinct integral representations ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Theorem 4.16, pp.26–27). *Needs:*
Rational cohomology of a flat affine group scheme, the subring definitions of
Trace and determinant invariant subring.

**Invariants of entirely triangular matrices.** For `R = R₀[a_τ, c_τ, d_τ]`, obtained by setting
every `b_τ` to zero, prove `R^B = R₀[a_τ, d_τ]` ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Corollary 4.17, first part,
p.27). *Needs:* Adjoint weight and dual identities.

**Invariants of the formal Ribet ring.** For the formal ring `R` with the chosen `b_τ = 0`
constraints, prove `H⁰(B, R) = A₀[d_τ]`, the subring specified above ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf),
Corollary 4.17, pp.27–28). *Needs:* Integral trace and determinant invariants,
Invariants of entirely triangular matrices, Trace and determinant invariant subring,
DerivedModuleAlgebra §0.K.1 / Koszul complex of a finite sequence.

**Checks.**

- With no generic matrices, `H⁰(B,R)=R₀`, agreeing with `A₀=A=R₀`.
- One entirely triangular matrix gives `R₀[a,d]`; trace `a+d` and the adjoined `d`
  generate the two independent diagonal coordinates.
- Over `𝔽₂`, a scalar matrix has trace zero and determinant `a²`; the equality retains
  this determinant generator and cannot be obtained by discarding it.

**Lower-Borel stability of relation ideals.** Under `g = [[x, 0],[y, z]]`, prove that each
relation quadruple transforms by inverse conjugation as

```text
A ↦ A + (y/x)B,
B ↦ (z/x)B,
C ↦ (x/z)C − (y/z)A − (y²/xz)B + (y/z)D,
D ↦ D − (y/x)B,
```

so that `J` and its `b`-entry ideal `J′` are `B`-stable ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Lemma 4.18,
pp.29–30; Example 4.2, p.22, for the action formulas). For the local quadruples this
follows from the identity
`[[A,B],[C,D]] = −(x_σ − Y_σ)·adj(x_τ − Y_τ)`
because `adj(g⁻¹Mg) = g⁻¹ adj(M) g`; the linear and product rows are linear
combinations of products of the `Y_i`, so the stability of *Formal Ribet relation ideals* applies to
every row. *Needs:* Formal Ribet relation ideals, Adjoint weight and dual identities.

### 6.5 Buchsbaum–Rim complexes and generic regularity

**Composition of exterior contractions.** For a module `U` over a commutative ring, `λ₁, …, λ_r`
homogeneous alternating forms on `U` and `β ∈ ∧U`, prove that determinant contraction satisfies
`ω(λ₁ ∧ … ∧ λ_r)(β) = (−1)^{r+1} ω(λ₁) ⋯ ω(λ_r)(β)`, with the sign convention of Buchsbaum §1; the
formula defines all signs in the bar differential ([Buchsbaum](https://people.brandeis.edu/~buchsbau/miscpapers/009.pdf), Lemma 1.1,
pp.184–185). For two forms this is `ω(λ∧μ) = −ω(λ)∘ω(μ)`, which iterates to
the displayed sign. *Needs:* DerivedModuleAlgebra §0.K.1 / Koszul complex of a finite sequence.

**Checks.** For the exterior-contraction convention, on `ℤ²` with its ordered basis,
`ω(e₁* ∧ e₂*)(e₁ ∧ e₂) = det([[1,0],[0,1]]) = 1`, whereas
`ω(e₁*)ω(e₂*)(e₁ ∧ e₂) = 0·0 − 1·1 = −1`.
Thus the two-form composition has the minus sign in Buchsbaum's Lemma 1.1.
The graded one-form contraction by `ℓ` acts on actual exterior powers and is characterized by the
alternating deletion formula on wedges. The two-form contraction by `ℓ, μ` is the negative of
the composite of the one-form contractions by `ℓ` and by `μ`; on a wedge of two vectors it is the
two-by-two determinant. Its three Checks are zero for equal covectors, a sign change when they are
interchanged, and value `1` on the two ordered dual-basis forms and the ordered basis wedge. For
the one-form contraction, the one-vector value is `ℓ(v)`, the two-vector value is
`ℓ(v)w−ℓ(w)v`, and a zero covector gives zero. The displayed two-term composite is
an equality of values of these exterior-power maps.

**Exterior-bar construction.** For `f : U = Rⁿ → W = Rᵐ`, define Buchsbaum's contraction
`ω : ∧(W*) → End(∧U)` on the whole exterior algebras as `−ω′`, where `ω′` is the
algebra map extending `ℓ ↦ −(ℓ ⌋ ·)` (Mathlib `ExteriorAlgebra.lift` of
`CliffordAlgebra.contractLeft`); this is exactly the sign rule of Buchsbaum's Lemma 1.1, and
the graded one-form contraction is its restriction. On the bar module
`(∧W*)^{⊗k} ⊗ ∧U` define the bar differential,
characterized on pure tensors: on `λ₀ ⊗ ⋯ ⊗ λ_k ⊗ α` it is
`λ₀ ⊗ ⋯ ⊗ λ_{k−1} ⊗ ω(∧f*(λ_k))[α] + (−1)^{k+1} ∑_{i<k} (−1)^i λ₀ ⊗ ⋯ ⊗ (λ_i ∧ λ_{i+1}) ⊗ ⋯ ⊗ α`
(Buchsbaum §1, p.185, with his `d(n)` for `n = k+1` factors). The bar submodule
`T(f; k; p, q)` is the span of pure tensors whose first form has degree `≥ q`, whose other forms
have degree `≥ 1`, and whose vector factor has degree `p` plus the total form degree (Buchsbaum
p.187: `r ≥ 0` and `s(i), t(i) ≥ 1`); prove that the differential preserves it.
Every higher term and differential of the two Buchsbaum–Rim complexes below is pinned to this
construction; with all signs `+`, the composite `d₁d₂` vanishes because `∧^{m+1}W = 0`, so this
is the mapping-cone complex `K(f; p, q)` up to the sign normalization fixed by `d₂`.
*Needs:* Mathlib `CliffordAlgebra.contractLeft`, `ExteriorAlgebra.lift`, `ExteriorAlgebra.map`,
`LinearMap.dualMap`, `TensorPower`.

**Checks.** On `(ℤ²)*`, `ω(e₀* ∧ e₁*)[v ∧ w] = v₀w₁ − w₀v₁`, the positive determinant of Buchsbaum's
formula with `σ = (1,2)`; in rank one the bar differential of one form is the contraction
`ω(f*e*)`; and `e* ∧ e* = 0` in `∧(ℤ¹)*`, so in rank one no merge survives and the bar complex is
the Koszul complex. On `1 ⊗ e* ⊗ e` in rank one with `f = id` the bar differential is
`1 ⊗ 1 + e* ⊗ e`, fixing the sign `+` of the merge term. For `T(f; k; p, q)`: in bar degree zero
it is `∧ᵖU` carried by the empty tensor; a first form of degree `0 < q` is excluded;
and `vol* ⊗ (e₀∧e₁∧e₂)` lies in the degree-two term of `BR` for `ℤ³ → ℤ²`.

**Buchsbaum–Rim module complex.** The carriers accept all natural `m,n`; their
specified low terms below also cover rank zero. The regularity and resolution results
require `1≤m≤n`. For `R` commutative and `f : U = Rⁿ → W = Rᵐ`, `1 ≤ m ≤ n`,
define `BR(f) = K(f; 1, m)`, a nonnegative finite free chain
complex built with the exterior-bar mapping cone of Buchsbaum §1: its degrees `0, 1` are `W, U`
with `d₁ = f`, and `d₂ : ∧ᵐW* ⊗ ∧^{m+1}U → U` is the signed maximal-minor contraction, which for
`m = 2` sends the basis triple to `r_ij e_k + r_jk e_i + r_ki e_j`. In degree two the term `∧ᵐW* ⊗ ∧^{m+1}U` is written `∧^{m+1}U` through the ordered dual volume
`e₀*∧⋯∧e_{m−1}*`, and in degree `k+3` it is
`T(f; k+2; 1, m)`; every differential from `d₂` on is the exterior-bar differential.
Prove
that its degree-one differential is `f` and that
for `m = 1` it is `K(x)` of the row `x`
([Buchsbaum](https://people.brandeis.edu/~buchsbau/miscpapers/009.pdf), §1 pp.185–187; DKSW23 §5.3.1 equation (60)). *Needs:* Composition of exterior contractions, DerivedModuleAlgebra §0.K.1 / Koszul complex of a finite sequence, Mathlib
`exteriorPower.map`.

**Checks.**

- For `f = id : R² → R²`, the complex is the exact two-term identity complex: `d₂` has nothing to
  contract, so a definition that added a spurious degree-two term would not be exact.
- For `f = 0 : R³ → R²`, `H₁(BR(f)) = R³`, so it is not exact unless `R` is zero: the kernel of
  `d₁ = 0` is all of `U` and `d₂` vanishes, so a definition claiming exactness of `BR(f)` for every
  `f` is refuted.
- For columns `(b_i, b′_i)`, `d₂` on `e₁ ∧ e₂ ∧ e₃` is `r₁₂e₃ + r₂₃e₁ + r₃₁e₂`, and `f(d₂) = 0`:
  the cyclic-sign contraction is computed, so a definition with a different sign pattern would
  fail `f ∘ d₂ = 0`.

**Buchsbaum–Rim determinant complex.** For the same `f`, define
`DetBR(f) = K(f; m, 1)` with its determinant-line degree zero: degree zero is `∧ᵐW`; degree
`k ≥ 1` is the direct sum over `s₁, …, s_{k−1} ≥ 1` of `(⊗_j ∧^{s_j} W*) ⊗ ∧^{m + ∑ s_j} U`; its
first differential is `∧ᵐf`, with the exterior-bar differential in higher degrees: degree `k+2`
is `T(f; k+1; m, 1)`, `d₂` is `λ ⊗ α ↦ ω(∧f*(λ))[α]`,
the higher differentials are the bar differential, and the comparison map below is
`id ⊗ ∧g` in those degrees. Prove
`d₁ = ∧ᵐf`, that
if `f′ ∘ g = f` then `∧g` gives `DetBR(f) → DetBR(f′)`, retaining the same target `W`, and that
after choosing `det(W) ≅ R`, `H₀ = R/I_m(f)`
([Buchsbaum](https://people.brandeis.edu/~buchsbau/miscpapers/009.pdf), §1 p.186; DKSW equation (62), p.37). *Needs:* Buchsbaum–Rim module complex.

**Checks.**

- For `m = 1` it equals the usual Koszul complex, including its integral signs: a definition whose
  bar signs disagreed with the Koszul signs would differ already in rank one.
- For `f : R² → R²`, the complex is `R --det(f)→ R` in degrees `1, 0`: the single maximal minor
  is computed, so a definition with higher nonzero terms in the square case would fail.
- For a generic `2 × 3` matrix, `d₁` has generators `r₁₂, r₁₃, r₂₃` and `d₂` has the two column
  syzygies; no division by `2` occurs, so a definition that normalised the bar differential by
  factorials would not be integral.

**Regularity of a finite free map.** For an ordered finite free map `f : Rⁿ → Rᵐ`, define regularity as the predicate that `H₁(BR(f|_{Rᵏ})) = 0` for
every `m ≤ k ≤ n` (all prefix first homology groups vanish). For `n<m` the predicate is vacuous; its
exactness theorem requires `1≤m≤n`. No noetherianity, domain hypothesis
or nonzero-cokernel condition is imposed, and properly regular adds `coker(f) ≠ 0`. Prove
that a prefix of length at least `m` of a regular map is regular and
that for `m = 1` regularity is weak regularity of the ordered Koszul
sequence (proper regularity also requires a nonzero quotient) ([Buchsbaum](https://people.brandeis.edu/~buchsbau/miscpapers/009.pdf), §3
Definition, p.194; DKSW Definition 5.1, p.37). *Needs:* Buchsbaum–Rim module complex.

**Checks.**

- Every ordered identity square matrix is regular even when its cokernel is zero: the prefix
  complexes are exact, so a definition that built the nonzero-cokernel condition into regularity
  would reject the identity.
- A square matrix is regular iff its underlying `R`-linear map is injective, with no domain
  assumption made: `H₁` of the two-term complex is the kernel, so a definition that required `R`
  to be a domain, would reject the identity matrix over `ℤ/4`, although it is injective. The
  criterion uses the kernel; it does not require the base ring itself to be a domain.
- Multiplication by `2` on `ℤ` is regular, while multiplication by `2` on `ℤ/4` is not: the
  kernel `{0, 2}` over `ℤ/4` is `H₁`, so a definition insensitive to the base ring would fail.

**Mapping cone for adjoining a column.** Prove that if `f : U → Rᵐ` and `ρ : R → Rᵐ`, then
`BR(f ⊕ ρ)` is the mapping cone of the contraction-induced map `DetBR(f) → BR(f)`; this gives the
homology long exact sequence used in prefix induction ([Buchsbaum](https://people.brandeis.edu/~buchsbau/miscpapers/009.pdf), Proposition 2.1
and Corollary 2.2, p.187). *Needs:* Buchsbaum–Rim determinant complex.

**Transfer of acyclicity to determinant complexes.** For every `f : Rⁿ → Rᵐ`, every `R`-module
`E` and `j > 0`, prove that if `H_i(BR(f) ⊗ E) = 0` for all `i ≥ j`, then
`H_i(DetBR(f) ⊗ E) = 0` for all `i ≥ j`. The proof constructs the transpose/exterior-duality
identifications and the contraction-cycle normal forms of Buchsbaum Lemmas 2.3–2.8 and 2.10–2.11
(pp.188–193), which provide boundaries in each degree, including the separate degree-one
adjustments ([Buchsbaum](https://people.brandeis.edu/~buchsbau/miscpapers/009.pdf), Theorem 2.9, pp.191–193). *Needs:* Buchsbaum–Rim determinant complex.

**Exactness of regular Buchsbaum–Rim maps.** Prove that if `f` is regular, then `H_i(BR(f)) = 0`
and `H_i(DetBR(f)) = 0` for every `i > 0`; consequently, after a determinant-line trivialization,
`DetBR(f)` is a finite free resolution of `R/I_m(f)`. The proof inducts on the number of columns
beyond the square prefix, with prefix `H₁`-vanishing as the input; the adjoining-column cone and
the transfer theorem then give all positive homology vanishing for both complexes
([Buchsbaum](https://people.brandeis.edu/~buchsbau/miscpapers/009.pdf), Proposition 3.1, pp.194–195; DKSW Theorem 5.2, p.37). *Needs:*
Regularity of a finite free map, Mapping cone for adjoining a column,
Transfer of acyclicity to determinant complexes.

**Tensor resolutions of ordered determinantal ideals.** For maps `f_i : R^{n_i} → R^{m_i}` with
`1 ≤ m_i ≤ n_i`, write `J_i = I_{m_i}(f_i)`. Prove that if each `f_i` modulo `J₁ + … + J_{i−1}` is
regular, then the finite tensor product `⊗_i DetBR(f_i)`, with determinant lines trivialized,
resolves `R/(∑ J_i)` ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Lemma 5.4 and proof, pp.37–38). *Needs:* Exactness of regular Buchsbaum–Rim maps.

**A two-column regularity criterion.** For `f : Rⁿ → R²` with columns `(b_i, b′_i)`, let
`r_ij = b_i b′_j − b_j b′_i`. Prove that if for every `k ≥ 2` the implication
`r₁k · x ∈ (r₁₂, …, r₁(k−1)) ⟹ x ∈ (r_ij : i, j < k)` holds, then `f` is regular
([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Lemma 5.11 and proof, p.43). *Needs:* Regularity of a finite free map.

**Localized chart for generic two-column minors.** For `R = R₀[b_i, b′_i]`,
`J_k = (r_ij : i, j ≤ k)` and `V = b′₁`, prove that

```text
R[V⁻¹] / J_k R[V⁻¹] ≅ R₀[b′₁, …, b′_n, b₁, b_{k+1}, …, b_n, V⁻¹],
```

and that for `1 ≤ k < n`, in this quotient `r₁(k+1)` is a non-zero-divisor ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Corollary 5.12,
equation (70), p.43). *Needs:* Mathlib `MvPolynomial`, `IsLocalization.Away`.

**Saturation of the generic minor ideal.** For the same generic ring and `1 ≤ k ≤ n`, prove that
`R ∩ J_k R[(b′₁)⁻¹] = J_k` ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Corollary 5.12, proof, p.43). *Needs:*
Localized chart for generic two-column minors.

**Regularity of a generic two-column map.** For every commutative `R₀` and `n ≥ 2`, prove that
the generic map `R₀[b_i, b′_i]ⁿ → R₀[b_i, b′_i]²` with columns `(b_i, b′_i)` is regular
([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Corollary 5.12, p.43). *Needs:* A two-column regularity criterion, Saturation of the generic minor ideal.

**A pivot chart for generic linear sequences.** For `R = R₀[α_ij, x_j]` and
`L_i = ∑_{j=1}^n α_ij x_j − c_i` with `c_i ∈ R₀[α_ij]`, `1 ≤ m ≤ n`, prove that the ordered sequence
`L₁, …, L_m` is weakly regular after inverting `α₁₁` ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Proposition 5.13,
Claim 1, pp.44–45). *Needs:* Mathlib `RingTheory.Sequence.IsWeaklyRegular`.

**Generic linear prefixes at a zero pivot.** In the same ring, prove that `L₁, …, L_{m−1}` is
weakly regular modulo `α₁₁` ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Proposition 5.13, Claim 2, p.45). *Needs:*
Mathlib `RingTheory.Sequence.IsWeaklyRegular`.

**Cancellation of pivot denominators.** Prove that if `α₁₁^e P` lies in `(L₁, …, L_{m−1})` in the
generic system, then `P` lies in that ideal ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Proposition 5.13, Claim 3,
p.45). *Needs:* Generic linear prefixes at a zero pivot.

**Weak regularity of generic linear equations.** For arbitrary commutative `R₀`, generic `m × n`
coefficients `α_ij` with `m ≤ n`, and `c_i ∈ R₀[α_ij]`, prove that the sequence
`∑ α_ij x_j − c_i` is weakly regular in `R₀[α_ij, x_j]`, and that if the final quotient is nonzero
it is regular in Mathlib's stronger convention ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Proposition 5.13, pp.44–45).
*Needs:* A pivot chart for generic linear sequences, Cancellation of pivot denominators.

**Generic combinations of an ideal containing a regular sequence.** For any commutative
ring `A`, a finite list of generators `b₁, …, b_h`, and an ideal `(b)` containing a weakly
regular sequence of length `d`, prove that the independent generic combinations
`L_i = ∑_j V_ij b_j`, `1 ≤ i ≤ ℓ ≤ d`, are weakly regular in `A[V_ij]`.
No noetherianity or nonzero-quotient hypothesis is required. This target owns the
Koszul-cohomology argument: define the cochain complex `Hom_A(K(b), A)`, prove that
`H^q` vanishes for `q<d` by induction on the given regular sequence, and prove that
multiplication by every element of `(b)` is nullhomotopic. Its degree-zero cohomology
is the common annihilator of the `b_j`. McCoy's generic-element criterion therefore
makes `L₁` a non-zero-divisor. The long exact cohomology sequence for quotienting by
`L₁` gives vanishing in degrees `<d−1`; repeat with each independent coefficient row.
Polynomial extension commutes with this finite cochain complex and its cohomology.
These constructions and vanishing results hold for arbitrary rings. After coefficient
change the conclusion requires the regular-sequence hypothesis over the new ring;
Coordinate regularity in disjoint minor quotients supplies that hypothesis for every
coefficient ring in the mixed-minor application
([Stacks](https://stacks.math.columbia.edu/tag/068P), Lemma 15.31.16, tag 068P, for the
generic-element step; Lemma 15.29.6, tag 0663, for the Koszul homotopy; the iterated
argument is a target here). *Needs:* DerivedModuleAlgebra §0.K.1 / Koszul complex of a finite sequence, Mathlib
`RingTheory.Sequence.IsWeaklyRegular`, homology long exact sequences.
*Lean:* `IntegralRibet.generic_combinations_regular`.

**Checks.**

- For `(b)=(x,y)` in `ℤ[x,y]`, two independent generic combinations are weakly regular;
  this is the case `d=2`, without inverting their coefficient determinant.
- For `(b)=(2)` in `ℤ`, one generic combination `2V` is regular. In `ℤ/4` the same
  expression kills `2`, and the regular-sequence hypothesis fails.
- For `(b)=(x)` in `ℤ[x]`, `V₁x,V₂x` is not weakly regular: modulo `V₁x`, the nonzero
  class of `V₁` kills `V₂x`. The bound on the number of equations is necessary.

**Coordinate regularity in disjoint minor quotients.** Over any commutative `R₀`, let
`Q=R₀[b_j,b′_j,z₁,…,z_u]/∑_a I₂((b_j,b′_j)_{j∈S_a})`, with disjoint nonempty
blocks `S₁,…,S_k`. Prove that the unused variables `z₁,…,z_u`, followed by one chosen
`b_j` from each block, form a weakly regular sequence of length `u+k`.
Build the integral monomial normal form of each local quotient: the map
`b_j↦s w_j`, `b′_j↦t w_j` identifies it with the subalgebra of `R₀[s,t,w_j]`
spanned by monomials `s^p t^q ∏w_j^{e_j}` with `p+q=∑e_j`. Prove that the minors
are exactly the kernel, these monomials are an `R₀`-basis, and multiplication by a
chosen `b_j` embeds that basis into itself. Its quotient has the complementary
monomial basis and is free over `R₀`. Tensoring disjoint blocks and their coordinate
quotients proves the assertion over every `R₀`, including rings with torsion.
Empty blocks contribute no variables or equations; a singleton has zero minor ideal
and its `b_j` can instead be counted among the unused variables, with `b′_j` absorbed
in `R₀` ([DKSW](https://arxiv.org/pdf/2310.16396v2), Corollary 5.12, monomial equivalence
argument, printed p.43). *Needs:* Mathlib `MvPolynomial`, tensor products.

**Checks.**

- In `ℤ[b₁,b₂,b′₁,b′₂]/(b₁b′₂−b₂b′₁)`, multiplication by `b₁` is injective, but
  after killing `b₁`, the nonzero class `b′₁` is killed by `b₂`. A block contributes one
  coordinate to this sequence, not its number of columns.
- The same multiplication by `b₁` is injective over `ℤ/4`; the monomial-basis proof
  requires no domain hypothesis on the coefficient ring.
- With two disjoint two-column blocks, one `b` from each is a weakly regular sequence.
  With no blocks, the sequence consists of the `u` polynomial variables; with a singleton,
  its local ideal is zero and moving its `b` to the unused list preserves the length.

**Mixed minor and linear resolutions.** Let
`R=R₀[b′₁,…,b′_n,b₁,…,b_{n+u},V_ij]`, partition `{1,…,n}` into `k` nonempty blocks
`S_a`, and let `f_a` have columns `(b_j,b′_j)` for `j∈S_a`. For `ℓ≤u+k` independent
coefficient rows, put `L_i=∑_{j≤n+u}V_ij b_j`. Prove that `L₁,…,L_ℓ` is weakly
regular modulo the sum of the local minor ideals, and that
`K(L)⊗_R⊗_a DetBR(f_a)` resolves the quotient by those minors and the `L_i`.
Omit empty and singleton determinant factors, which contribute zero local ideal; moving
singleton coordinates into the unused list preserves `u+k`.
Coordinate regularity in disjoint minor quotients supplies a regular sequence of length
`u+k` in the ideal of all `b` coordinates. Generic combinations of an ideal containing a
regular sequence supplies scalar regularity at this bound. The disjoint local maps are
regular in order by Corollary 5.12, and tensor resolutions supply exactness.
This target extends the unused-variable case `ℓ≤u` of
[DKSW](https://arxiv.org/pdf/2310.16396v2), Proposition 5.14, printed p.46, using the
specified Koszul-cohomology argument. It is asserted over arbitrary commutative `R₀`,
with independent coefficients retained; it does not assert exactness after specializing
those coefficients. The local and scalar prefix quotients are flat over `R₀`: the local
normal forms are free, and scalar regularity over every `R₀/I` supplies universal
regularity for each successive quotient. Apply the pinned
`Module.Flat.quotient_span_singleton_of_lTensor_mulLeft_injective` at every scalar step.
*Needs:* Coordinate regularity in disjoint minor quotients, Generic combinations of an ideal
containing a regular sequence, Regularity of a generic two-column map, Tensor resolutions
of ordered determinantal ideals, Tau Ceti `RingTheory/Flat/QuotientRegular.lean`.
*Lean:* `IntegralRibet.mixed_scalar_regular`.

**Checks.**

- For one block `{3,4}`, unused `b₁,b₂`, and three independent coefficient rows,
  `L_i=∑_{j=1}^4V_ijb_j` is weakly regular modulo `b₃b′₄−b₄b′₃` over `ℤ` and over
  `ℤ/4`. Here `ℓ=3=u+k`, exceeding the two unused variables. Specializing to
  `L₁=b₁,L₂=b₂,L₃=b₃` gives quotient
  `ℤ[b′₃,b′₄,b₄]/(b₄b′₃)`; the third equation is still a non-zero-divisor before
  taking that quotient.
- With no blocks the bound is `ℓ≤u`, the generic linear theorem. With one singleton
  block and `u=0`, its one generic equation is `Vb`; the local determinant factor is the
  unit complex and the equation is weakly regular.
- For one two-column block and no unused variables, two generic equations exceed the
  bound. Modulo the minor and `L₁`, the nonzero class `V₁₁b′₁+V₁₂b′₂` is killed
  by `L₂`: its product with each `b_j` equals `b′_jL₁`. It is nonzero because setting
  both `b` coordinates to zero retains this polynomial. Specializing all coefficients
  to zero also destroys regularity for one equation.
  These computations give the two-equation boundary.

**Generic variable count for the Ribet relations.** Let `N` count difference-generator
slots after stabilization, `s=|Σ∖{v₀}|`, `t=|P|`, and `a₃,a₄,a₅` count selected rows
of types (III), (IV), (V). Prove that the `(N+s)`-square relation matrix has
`L=N+s−a₃−a₄−a₅` scalar rows of types (I)/(II). The formal quotient kills the `a₃`
distinguished-place `b` coordinates. Separate occurrence slots put `a₄+a₅+t` surviving
coordinates into local blocks, including each auxiliary top occurrence. Before discarding
singleton blocks the number of unused surviving coordinates is
`u₀=N−a₃−a₄−a₅−t`, so `L=u₀+s+t`.
An empty nondistinguished-place block means its entire `y_v` column is zero in `D`,
`𝔈` and `𝔈′`; its arithmetic and formal determinants are zero, and the weighted
Fitting minor is discharged directly. Auxiliary `P` blocks are nonempty because of
their top occurrence. For the remaining minors all `s+t` local blocks are nonempty.
Discarding `q` singleton blocks gives `u=u₀+q` and `k=s+t−q`, hence `L=u+k`.
Their zero minors and repeated-index minors add no generators or determinant factors.
Identify `J′` with the resulting disjoint minor ideals plus these `L` generic scalar
rows: translate the independent row coefficients of a type (II) row by `a_i+ν_i`
and `d_j` (both in its single coefficient when `i=j`), and replace `x_σ` by
`b′_σ+a_σ`. Killed `b` coordinates disappear from scalar rows; all remaining scalar
coefficients are still independent polynomial variables over the other coordinates.
These polynomial changes identify the underlying ideals and complexes; they do not
alter the prescribed coactions or replace the equivariant comparison
([DKSW](https://arxiv.org/pdf/2310.16396v2), §§2.3–2.4, printed pp.11–13; §5.9, printed p.46).
*Needs:* Stabilization of local relation rows, Formal Ribet relation ideals, Modified formal
auxiliary matrices, Mixed minor and linear resolutions.

**Checks.**

- With `N=4,s=1,t=0,a₃=a₄=0,a₅=2`, the block `{3,4}` leaves `u=2,k=1,L=3`.
  Three coefficient rows followed by `(0,0,1,0,ν₃)` and `(0,0,0,1,ν₄)` form a
  `5×5` matrix. Specializing the first three rows to the first three coordinate rows
  gives determinant `−ν₃`; this pattern is not discarded as a zero minor.
- A singleton nondistinguished block with `N=2,s=1,a₅=1` has `L=2,u₀=1`.
  Omitting its zero local ideal gives `u=2,k=0`, preserving `L=u+k`. An empty such
  block instead gives a zero `y_v` column and a zero determinant.
- With `N=3,s=0,t=1,a₃=1,a₄=1,a₅=0`, the `P` block contains its local and top
  occurrences. Thus `u=0,k=1,L=1`; killing the type (III) coordinate does not remove
  the auxiliary top coordinate or its contribution to the count.

**Checks for prefixes and maximal minors.** The prefix of length `k` restricts `f` along the
extension by zero from the first `k` coordinates. The empty prefix is zero, the full prefix is
`f`, and the first column of `[[2,3],[4,5]]` applied to `7` gives `(14,28)`.
The maximal-minor ideal is the unit ideal for the `2×2` identity, zero for the
zero `2×3` matrix, and `(6)` for `diag(2,3)` over `ℤ`. These six Checks distinguish
column order, maximal-minor size and the empty-prefix convention; the source is Buchsbaum,
§§2–3, with the ordered-prefix regularity convention used above.

### 6.6 The two relation complexes

**Upper-entry relation complex.** The carrier
is the underlying module complex for arbitrary commutative `R`, a finite sequence of scalar
relations, and a finite family of maps `R^{n_v}→R²`. Its degree zero is literally `R`.
For the formal Ribet ring and its `b`-entry relations, equip this carrier with the
coactions specified in *Equivariant comparison of the relation complexes* below; its
mathematical construction is
the specified tensor complex

```text
C = Koszul(f) ⊗_R ⊗_v DetBR(f_v)(−1),
```

where `f(e_i) = L_i` and `f_v(e_σ) = A ⊗ b_σ + B ⊗ (x_σ − a_σ)` in `V_R`; degree zero is `R`,
`im(d₁) = J′`, and each local determinant-line twist `(−1)` is retained. On underlying modules
the carrier is isomorphic to
`K(L) ⊗ ⊗_t DetBR(f_t)`,
the tensor product in the given order (the empty family is the unit complex `R`). Prove
that its degree-one image is `J′` and define
the natural augmentation `C → R/J′`
([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §5.4 equations (63)–(65), pp.38–39). *Needs:* Buchsbaum–Rim determinant complex, Adjoint weight and dual identities, Formal Ribet relation ideals.

**Checks.**

- With no selected relation generators or local pairs, `C = R` in degree zero: the empty tensor
  product is `R`, the degenerate case a construction that required at least one factor would miss.
- With only one linear relation `L` it is the two-term Koszul complex `R --L→ R`: the single
  Koszul factor is computed, so a construction whose `f` did not send `e_i` to `L_i` would fail.
- With two local rows and no linear relations it is `R --(b₁b′₂ − b₂b′₁)→ R` after the
  determinant-line twist: the `2 × 2` minor is the degree-one differential, so using the module complex instead of the determinant complex would fail.
  This underlying-module check does not detect the twist; the equivariant comparison target
  specifies that additional structure.

**Exactness of the upper-entry resolution.** For a stabilized formal minor with every
nondistinguished-place block nonempty, prove that the augmented upper-entry complex
`C → R/J′` is a finite free resolution. The count `L=u+k`, after omitting singleton factors,
applies Mixed minor and linear resolutions at its block bound. Minors with an empty
nondistinguished-place block have zero determinant and contribute zero to the weighted
Fitting ideal ([DKSW](https://arxiv.org/pdf/2310.16396v2), Proposition 5.5(1) and §5.9,
printed pp.39,46). *Needs:* Upper-entry relation complex, Mixed minor and linear resolutions,
Generic variable count for the Ribet relations.

**Checks.**

- The `N=4,s=1,a₅=2` pattern gives the Koszul complex of three scalar rows tensored
  with the two-term complex for `b₃b′₄−b₄b′₃`; its augmentation is exact.
- With no places, there are `N` scalar rows and `N` unused coordinates; this is the
  original generic linear resolution, including `N=0` and the unit complex.
- An empty nondistinguished-place block gives a zero determinant. Its extra scalar row
  is not covered by the block bound and no upper exactness assertion is used for that minor.

**Full-entry relation complex.** The underlying construction takes linear/product matrix rows,
a finite family of local sizes, and for each local block the actual matrices `Y_σ` and scalars
`x_σ`. Define the full relation ideal `J` to be the sum of the entry ideal of the rows and
the entries of the local relation matrix `[[A_στ, B_στ],[C_στ, D_στ]]` of `Y_σ, Y_τ, x_σ, x_τ`
for distinct pairs in the same block.
Define the underlying `R`-module tensor complex `D`, the tensor product of the adjoint multilinear Koszul
subcomplex and the local distinct-block determinant subcomplexes as `R`-module complexes.
Its construction for arbitrary
commutative `R` is as follows: the matrix-row factor in degree `a` is the sum, over increasing
`a`-tuples of distinct row indices, of one tensor product of `a` copies of `M₂(R)`;
its differential deletes one factor with sign `(−1)^j` and evaluates that factor
against the corresponding row entries. The local degree `b≥1` factor is the sum,
over `s₁,…,s_{b−1}∈{1,2}` and increasing tuples of `2+∑s_i` distinct local
indices, of `(⊗_i ∧^{s_i}(R²)*) ⊗ (R²)^{⊗(2+∑s_i)}` with the determinant line
trivialized by the ordered basis. The differential is the restriction of the
exterior-bar differential for the map whose two columns at index `σ` are
`(x_σ−d_σ,c_σ)` and `(b_σ,x_σ−a_σ)`. Prove these submodules are closed under
that differential. Tensor these factors in the given index order, with the usual
homological tensor sign, to obtain `D`, and require the comparison
isomorphism to send each ordered pure tensor to its displayed wedge. The row factor of a row `U`
is the complex `M₂(R) → R`, `Z ↦ ∑ U_{ij}Z_{ij}`, of its row functional; the local
map has the two columns at each local index, indexed by `(σ, ε)` through `finProdFinEquiv`; and the
local distinct-block factor is pinned by a degreewise injective chain map
into `DetBR` of the local map, whose image is everything in degree zero,
the wedges of distinct local indices in degree one, and the bar
tensors with a distinct-index vector factor from degree two on.
Prove that `D` is isomorphic to the tensor product of the row complexes with the tensor product of
the local distinct-block complexes.

**Checks for the tensor and local carriers.** The tensor product of the empty family of
complexes has zeroth homology `ℤ` over `ℤ`, of one complex is that complex, and
`K(2) ⊗ K(3)` over `ℤ` has `H₀ = ℤ/(2,3) = 0`. The row functional
against the identity row is the trace (`5` at `[[2,7],[11,3]]`), against `E₀₁` reads `7`, and the
zero row gives `0`; the row complex of `U` is `M₂(R) → R` with
`H₀ = R/(U_{ij})` and zero above degree one.
The local map for `Y = [[1,2],[3,4]]`, `x = 9` has columns `(5,3)` then `(2,8)`, fixing their
order, and its single maximal minor is `(x−d)(x−a) − bc`. The distinct-index wedges include
`e_{(0,0)}∧e_{(1,1)}` and `1` but not
`e_{(0,0)}∧e_{(0,1)}`. The local distinct-block complex is `R` in degree zero,
vanishes in positive degrees for one local index,
and has a rank-four degree-one term for two indices. Thus this is
a construction contract in every degree, not just an assertion about module ranks.
The equivariant comparison target below supplies the coactions on the formal input.
Prove that `D₀ = R` with degree-one image
`J`, and that each `D_k` is a direct sum of adjoint tensor
powers of the free rank-four matrix module. Exactness in positive degrees is not part of this construction
([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §5.4 equation (66), p.39). *Needs:* DerivedModuleAlgebra §0.K.1 / Koszul complex of a finite sequence, Buchsbaum–Rim determinant complex.

**Checks.**

For the full relation ideal, the matching cases are: empty input gives zero; one matrix row with no
local blocks gives the ideal of its four entries; one local block of size one contributes zero,
regardless of its matrix and scalar, because there is no distinct pair.

- Without relation blocks, `D = R` in degree zero and `J = 0`: the empty case, which a
  construction with a mandatory factor would fail.
- A single matrix relation has `D₁ = A ⊗ R → R` with its four entries, and no repeated-block
  exterior terms: the degree-one term is one copy of the adjoint, so a construction keeping
  wedges from the same block would have extra terms.
- For distinct indices `σ≠τ` of one local block `B_v`, the four basis wedges give
  `−C_στ, −D_στ, A_στ, B_στ`, so the degree-one image is exactly `J_v`.
  Wedges repeating an index are excluded; admitting them would enlarge the image beyond `J`.

**Equivariant comparison of the relation complexes.**
The comparison has as input the formal ring,
the selected type I and II matrix rows, the local matrices and scalars arising from a
stabilized relation minor, and their specified lower-Borel coactions. Its equivariance part is
stated over the formal ring with triangular constraints: every selected matrix row
and local matrix transforms by lower-Borel inverse conjugation, and each local scalar is invariant.
These equations hold for the selected type I and II rows; the equivariance construction
itself does not require the variable-count condition used for exactness.
The upper local columns send the local basis vector at `σ` to `(b_σ, x_σ−a_σ)`.
The degreewise right comodules on `C` and `D` are given by the tensor constructions below. The
comparison theorem asserts their agreement with the formal comodule in degree zero, equivariance of
every differential, and equivariance of the comparison chain map, whose degree-zero component is
the identity.
Construct the Borel-comodule structures on the upper and full complexes and a chain map `C→D`
whose degree-zero component is `id_R`. The upper linear generators have weight `z/x`;
local determinant factors carry the inverse of that weight. On the full side use the
multilinear Koszul subcomplex: in degree `k` select `k` distinct matrix-row blocks and
one vector from each. In a local determinant factor, each exterior word selects distinct
local indices; the bar factors are
`(∧^{s₁}V*)⊗⋯⊗(∧^{s_{k−1}}V*)`, with each `s_i∈{1,2}`, and the last wedge has
`2+∑s_i` factors. Retain Buchsbaum's exterior-bar differential on these submodules.
The comparison inserts the upper-entry vector in each row and the `B` vector at each
local index. Prove it is equivariant, `im d₁(C)=J′`, `im d₁(D)=J`, that the augmented
`C` is exact when every nondistinguished-place block is nonempty, and that every term
of `D` is Borel-acyclic.
For these nonempty-block minors, the finite truncations resolving the ideals give the zero maps
`H^j(B,J′)→H^j(B,J)` for `j≥1`. This is the bridge used by invariant lifting;
exactness is not claimed after an arbitrary specialization of the relation coefficients
(DKSW Theorems 4.22–4.23, pp.33–34; Proposition 5.5 and Lemmas 5.6–5.10, pp.39–42).

The finite resolution comparison is stated
on these actual carriers (DKSW Theorem 4.23, p.33; Proposition 5.5, pp.39–40).
Its hypotheses require each local two-row map to be Buchsbaum–Rim regular modulo the sum of the
earlier local minor ideals, and the ordered scalar row entries
to be weakly regular modulo all local minor ideals. Tensor exactness is proved in
that order; the tensor symmetry places the Koszul factor first in the displayed `C`. Empty and singleton local blocks contribute
zero minor ideals. For minors with no empty nondistinguished-place block, the
count `L=u+k` and Mixed minor and linear resolutions of §6.5 supply scalar weak
regularity over the integral formal ring. Empty nondistinguished-place blocks give zero
determinants and are discharged directly. The prefix Checks give zero at
index zero, the sum of all local minor ideals at the number of blocks, and the same
ideal one index beyond that bound. Its conclusions are positive-degree
exactness of `C`, boundedness of both complexes, the equivariant comparison with
identity in degree zero, and B-acyclicity of every term of `D`.
The vanishing criterion for finite comparisons in rational cohomology applies to the
ideal-augmented truncations:
replace degree zero by `J′` and `J`, and retain the positive terms. With upper exactness,
a finite upper bound and acyclic positive lower terms, it gives the zero induced map
`H^j(B,J′)→H^j(B,J)` for every `j>0` (Theorem 4.22, pp.33–34).

**Checks for the local-column orientation.** Write the two columns at `σ` as
`A_σ=(x_σ−d_σ,c_σ)` and `B_σ=(b_σ,x_σ−a_σ)` and order `σ` before `τ`.
The wedges `A_σ∧A_τ`, `A_σ∧B_τ`, `B_σ∧A_τ`, `B_σ∧B_τ` map to
`−C_στ,−D_στ,A_στ,B_στ`. For
`Y_σ=[[1,2],[3,4]]`, `Y_τ=[[5,6],[7,8]]`, `x_σ=9`, `x_τ=10`,
the four values are `29,7,−2,−38`; the Check computes all four. A singleton local index has no such wedge. This fixes the local signs in
DKSW Lemma 5.9, p.42, without identifying repeated-index wedges with relations.

### 6.7 Invariant determinant comparison and extension theorems

**The determinant difference in the formal error ideal.** For the modified formal matrices
`𝔈,𝔈′` of §6.3, prove entrywise that `𝔈′−𝔈` lies in
`I_R = (a_i + ν_i, b_i, c_i, d_i)`, and hence that `e = det 𝔈′ − det 𝔈 ∈ I_R`.
The local entry difference is `−(a_σ+ν_σ)` and the product-row differences are
`−(a_i+ν_i)` and `−d_j`; determinant multilinearity gives the result
([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §3.3, p.19).
*Needs:* Modified formal auxiliary matrices.

**Checks.**

- Over the free polynomial ring, the schematic type (V) matrices
  `𝔈=[[u11,u12,0],[u21,u22,0],[1,0,x+ν]]` and
  `𝔈′=[[u11,u12,0],[u21,u22,0],[1,0,x−a]]` give
  `e=−(a+ν)*(u11*u22−u12*u21)`, which reduces to zero under `a↦−ν`.
- With the same altered matrix, the direct lift with last entry `ν` instead gives
  `(x−a−ν)*(u11*u22−u12*u21)`, reducing to the nonzero polynomial
  `x*(u11*u22−u12*u21)`. This is a formal polynomial example, independent of arithmetic
  representation hypotheses.
- For a product row with `i=j`, the single altered coefficient differs by
  `−(a_i+ν_i)−d_i`; it still reduces to zero when `a_i↦−ν_i` and `d_i↦0`.

**Pairing determinant terms along a local column.** Let `J′` be an ideal of a commutative ring
and `M` a square matrix over that ring whose rows are partitioned into nonlocal rows and pairwise
disjoint local blocks `L_v`, indexed by places `v`. Fix a distinguished column `c` and, for each
place, a place column `p_v ≠ c`. Assume:

1. `M_{r,c} ∈ J′` for every nonlocal row `r`;
2. `M_{r,p_v} ∈ J′` for every place `v` and every row `r ∉ L_v`, for instance because the place
   column vanishes off its block;
3. `M_{r,c} M_{r′,p_v} − M_{r,p_v} M_{r′,c} ∈ J′` for every place `v` and rows `r, r′ ∈ L_v`.

Prove `det M ∈ J′`. In the Leibniz expansion, the term of a permutation has a factor in `J′`
unless the row `w` it sends to `c` lies in a block `L_v` and the row `w′` it sends to `p_v` lies in
the same block. On the remaining terms, exchanging the values at `w` and `w′` is a sign-reversing
involution without fixed points, and each pair sums to a minor of condition 3 times a common
product. The source applies this to local rows with entries `b_σ` and `x_σ − a_σ`, whose minors
are `B_στ` ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Lemma 4.20, equation (54),
pp.31–32), and to local rows with entries `t b_σ` and `x_σ − a_σ` or `x_σ − a_σ − t b_σ`, whose
minors are `t B_στ` (Lemma 4.21, equation (55), pp.32–33). *Needs:* Mathlib `Matrix.det_apply`.

**Checks.**

- Over `ℤ` with `J′ = 0`, take `I₂` with distinguished column `1`, row `1` the only local row of a
  place with place column `2`, and row `2` nonlocal. Conditions 1 and 3 hold, the only minor having
  `r = r′`, but `M_{2,2} = 1` violates condition 2 and `det I₂ = 1`; over `ℤ[a, b, x]` the matrix
  `[[b, x − a],[0, 1]]` has determinant `b` in the same way. Without condition 2 the statement is
  false.
- Take `I₂` with both rows in one block, distinguished column `1` and place column `2`: conditions
  1 and 2 are vacuous, the minor of the two rows is `1` and `det I₂ = 1`, so condition 3 is needed.
- The `1 × 1` matrix `(1)` with its row local and `p_v = c` satisfies conditions 1–3, its only
  minor vanishing, and has determinant `1`, so the place column must differ from `c`.

**Unipotent invariance for product rows.** Prove that replacing every product row of `𝔈′` by its
image under the lower unipotent universal element `τ_t` leaves `det 𝔈′` unchanged modulo `J′R[t]`
([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Lemma 4.20, pp.31–32). Prove first that in
`𝔈′` the column of a place is zero on every row not attached to that place: the column of `v ∈ P`
among the first `|P|` columns is nonzero only at its diagonal entry and the type (IV) entries at
`v`, and a `y_v` column is nonzero only on the type (V) rows at `v`. The difference of
determinants is the sum of the determinants of the matrices in which a nonempty set of product
rows `w` is replaced by `τ_t(w) − w`, which has `t b_j` in the `ρ_i` column and `−t b_i` in the `ρ_j` column for the index
`(i, j)` of `w`, and vanishes if `i = j`. Fix one such row with `i ≠ j`, replace it by `t` and `−t`
in those columns, multiply the `ρ_i` and `ρ_j` entries of every other row by `b_i` and `b_j`, and
add to the `ρ_i` column the `ρ_j` column and `b_k` times every other `ρ_k` column; the
determinant is unchanged. The result satisfies the pairing hypotheses with distinguished column
the new `ρ_i` column, nonlocal rows those of types (I)–(III), whose entries there lie in `J′`,
local blocks the local rows of each place, with entries `b_σ`, and place columns the columns of
the places. The operations leave these columns unchanged, so they vanish off their own rows, and
the same-place minors are `B_στ`. *Needs:* Pairing determinant terms along a local column,
Lower-Borel stability of relation ideals.

**Unipotent invariance for one local block.** Prove that changing the local rows for one place `v`
from `x_σ − a_σ` to `x_σ − a_σ − t b_σ` leaves `det 𝔈′` unchanged modulo `J′R[t]`, even when the
product rows and earlier local blocks have already changed
([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Lemma 4.21, pp.32–33). Adding `t b_j` times
every `ρ_j` column to the `v` column of the changed matrix restores the entries `x_σ − a_σ` on the
rows at `v`, puts `t b_σ` on the local rows at every other place `v′`, and puts elements of
`J′R[t]` on the rows of types (I)–(III), by lower-Borel stability. By linearity in the `v` column,
the difference of the two determinants is the determinant of the matrix whose `v` column is the
difference of the two `v` columns and whose other columns are unchanged. It satisfies the pairing
hypotheses with distinguished column the `v` column, nonlocal rows those of types (I)–(III) and
the rows at `v`, local blocks the rows at the other places `v′`, and their columns as place
columns, which vanish off those rows. The same-place minors are `t B_στ`, whether or not the block
at `v′` has already changed. *Needs:* Pairing determinant terms along a local column, Lower-Borel
stability of relation ideals.

**Borel invariance of the determinant difference.** Prove that the image of
`e = det 𝔈′ − det 𝔈` in `R/J′` is `B`-invariant; `𝔈` itself has only coefficient-ring
entries and hence has invariant determinant ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Lemma 4.19, pp.30–33).
*Needs:* Unipotent invariance for product rows, Unipotent invariance for one local block.

**Lifting the invariant error across the full ideal.**
For a minor with every nondistinguished-place block nonempty, the invariant lifting criterion
of rational cohomology applies to the two short exact sequences
`0→J′→R→R/J′→0` and `0→J→R→R/J→0`, their inclusion and quotient maps,
and the zero map on `H¹` supplied by the exact relation-complex comparison. It places the image of `H⁰(B,R/J′)` inside the image of
`H⁰(B,R)→H⁰(B,R/J)`, by naturality and exactness of the connecting maps. Prove that the image of `e` in `R/J` lies
in the image of `H⁰(B, R) = A`. For an empty nondistinguished-place block,
`det 𝔈=det 𝔈′=0`, so `e=0` has the invariant lift zero directly
([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §4.4 exact sequence (52), p.29). *Needs:*
Borel invariance of the determinant difference, Equivariant comparison of the relation complexes,
Generic variable count for the Ribet relations, Invariants of the formal Ribet ring.

**Checks.**

- A zero place column in both formal matrices gives `e=0`, with lift `q=0`, without
  any exactness assertion for the upper complex of that minor.
- If `J′=J` and `H¹(B,J)=0`, the same exact sequence lifts every invariant class in
  `R/J` to an invariant in `R`; the required map on `H¹` is zero.
- For the trivial group scheme the positive rational cohomology vanishes, and every
  class in `R/J` has an invariant lift through the surjective quotient map.

**Formal determinant comparison.**
For every stabilized relation minor under the full local Ribet input, prove
`π(e) ∈ Ĩ` for `e=det 𝔈′−det 𝔈`. Empty nondistinguished-place blocks give zero
formal and arithmetic determinants directly. For the other minors the invariant lift
writes `e=q+j` with `q∈A`, `j∈J`; since `e∈I_R`,
the invariant lift satisfies `q∈A∩(I_R+J)`. The invariant character-error intersection gives
`π(q)∈Ĩ`, and evaluation annihilates `j`. By specialization,
`π(det 𝔈′)=det E′_arith=0` in `K`, so `π(det 𝔈)∈Ĩ`. Use the congruence
`π(det 𝔈)−det E_arith∈Ĩ` to obtain `det E_arith∈Ĩ` in `T̃`, and only then use
`det E_arith=(∏_{v∈P}(ξ_v(σ_v)−χ(σ_v))) det D` to give the weighted relation-minor containment
([DKSW](https://arxiv.org/pdf/2310.16396v2), Proposition 3.3, printed p.21; §§4.4–4.6).
*Needs:* The determinant difference in the formal error ideal, Lifting the invariant error across
the full ideal, Invariant intersection with the character error ideal, Evaluation annihilates
the formal relation ideal, Specialization of the formal auxiliary matrices,
Vanishing of the altered determinant, Weighted auxiliary matrix.

**Checks.**

- For the schematic type (V) block with `h=1`, specialize `x=2`, `ν=4`, `a=2` over `ℤ`
  with `Ĩ=(2)`. The altered determinant is zero, `π(e)=−6∈Ĩ`, and the specialization
  correction is `6−4=2∈Ĩ`; thus the arithmetic determinant `4` belongs to `Ĩ`.
- With the same `h,x,ν` but `a=7`, one has `π(e)=−11∉(2)` and altered determinant `−5≠0`;
  the specialization congruence alone supplies neither premise of the comparison.
- For the arithmetic block `[[2,1],[0,5]]` over `ℤ`, the final weighted minor is `2*5=10`.
  If comparison places its determinant in `(2)`, the weight cannot be cancelled: `5∉(2)`.

**Weighted Fitting containment.** Assume
`Module.Finite T N` for the prescribed local quotient, together with Theorem 2.1’s hypotheses, including `χ ≡ ψ`
modulo `m`, local triangularizations `diag(η_v, ξ_v)`, `ξ_v ≡ ψ` on `Σ`, `ξ_v ≡ χ` on `I_v` for
`v ∈ P`, and chosen `σ_v ∈ G_v`, prove that the finite local quotient `N` satisfies

```text
(∏_{v∈P} (ξ_v(σ_v) − χ(σ_v))) · Fitt₀_T(N) · T̃ ⊆ Ĩ.
```

For a stabilized presentation minor `D` with an empty nondistinguished-place block, its
weighted determinant is zero. Apply the comparison to every other arithmetic `E_arith`,
then use its exact weighted identity and the stabilization ordering sign to cover the
minors generating `Fitt₀_T(N)`. The containment is in `T̃`; the local factors need not belong to `T` ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf),
Theorem 2.1, equation (12), pp.7–8). Finiteness is a premise of this conditional theorem;
Finite and continuous Ribet modules supplies it when a finite bound is given. *Needs:* Formal determinant comparison.

**Checks.**

- With `P=∅`, the empty weight is one and the conclusion is the unweighted containment
  `Fitt₀_T(N)·T̃⊆Ĩ`.
- A relation minor with an empty nondistinguished-place block contributes zero to the
  weighted determinantal ideal, independently of its scalar-row count.
- For a weight `2` and minor `5` over `ℤ`, the weighted generator is `10` and belongs
  to `(2)` although `5` does not; the weighted containment permits no cancellation.

The proof-plan edges are as follows; each names the result that supplies it.

1. Rational-cohomology functoriality and exact sequences → the twisted calculations:
   functoriality of the complex map (identities and composites), exactness of the connecting
   maps and the restriction comparison of Integral restriction to the lower Borel supply the
   functorial and dimension-shifting inputs to the vanishing `H^i(B,V(j))=0` for `i>j`, the
   twist-one identification, and the diagonal twists at odd primes and modulo two
   (DKSW Lemmas 4.11–4.12).
2. Twisted calculations → triangular-coordinate acyclicity:
   the finite twisted resolution supplies the dimension-shifting criterion;
   triangular-coordinate acyclicity applies it to the coordinate Koszul resolution,
   and the good filtrations on the adjoint powers with their triangular acyclicity supply the
   tensor powers in `D` (Lemma 4.14 and Theorem 4.15).
3. Triangular-coordinate acyclicity → equivariant `C→D` comparison:
   acyclicity of the terms of `D` supplies lower-term acyclicity;
   Equivariant comparison of the relation complexes supplies the coactions and map;
   the finite resolution comparison, using §6.5 regularity,
   supplies exactness and boundedness (Theorem 4.23).
4. Equivariant comparison → the zero maps `H^j(B,J′)→H^j(B,J)`:
   the vanishing criterion for finite comparisons supplies the cascade (Theorem 4.22).
5. The zero map on `H¹` → invariant lifting:
   the invariant lifting criterion supplies the comparison of invariant images
   (equation (52), p.29). For the computation of `H⁰(B,R)`, the compatibility of the
   invariant product with connecting maps and with the twist-one and diagonal-twist
   identifications supplies product compatibility, and surjectivity of the twisted invariant
   product supplies Corollary 4.13; the identity `A = H⁰(B,R)` of **Invariants of the formal Ribet ring**
   supplies the formal-ring invariant description (Corollary 4.17).
6. Invariant lifting → formal determinant comparison:
   Formal determinant comparison combines that lift for `e=det 𝔈′−det 𝔈` with the
   invariant character-error intersection and evaluation of the relation ideal, then uses
   Specialization of the formal auxiliary matrices and `det E′_arith=0` to obtain `det E_arith∈Ĩ`
   (Proposition 3.3, p.21).
7. Formal determinant comparison → weighted Fitting containment:
   Weighted Fitting containment applies the comparison to the stabilized
   relation minors via the exact identity for `E_arith` (Theorem 2.1(12), pp.7–8).

**Ribet extension with all local conditions.** Prove `IntegralRibet.local_ribet`. For a noetherian inclusion `T ⊆ T̃`, `T` local and
both complete for `m_T`, a proper nonzero `Ĩ ⊆ T̃`, `I = Ĩ ∩ T`, `K = Frac(T̃)` a finite product of
local rings with principal maximal ideals and reduced quotient a product of fields, a compact `G`
and continuous `ρ : G → GL₂(K)`, assume the characteristic polynomials lie in `T[X]` and reduce
modulo `I` to `(X − χ)(X − ψ)`, that `χ ≡ ψ` modulo `m_T`, and that every reduced field-factor
representation is irreducible. Supply a finite `T`-submodule `Λ ⊆ M₂(K)` containing `Δχ` and
`Δψ`, with its induced topology equal to its `m_T`-adic topology. With the finite triangular
local input, prove that the prescribed `IntegralRibet.localModule` is finite, and its canonical
cocycle `κ` is continuous, with vectors `y_v` having all its
prescribed local values, generating `N` together, and satisfying its weighted Fitting containment
([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Theorem 2.1, pp.7–8, and §2.1, pp.8–9, with the finite-lattice and topology inputs stated
explicitly for the canonical construction). *Needs:* Finite and continuous Ribet modules,
Weighted Fitting containment.
*Lean:* `IntegralRibet.local_ribet`.

**Irreducibility excludes an exact split determinant.** Under the global Ribet hypotheses with
`T` nonzero, prove that the congruence ideal `I` cannot be zero: otherwise the determinant on
every field-factor representation is the direct sum of the two `T`-valued characters,
contradicting its irreducibility. When `I = 0`, the proof extends the character-polynomial
identity from group elements to the full group algebra and applies semisimple determinant
reconstruction in a field factor; an irreducible two-dimensional factor cannot have the split
character determinant ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Theorem 1.1 and its reduction to Theorem 2.1,
pp.2–3, 7–8). *Needs:* Faithful quotients over arbitrary fields, Character congruence on the group algebra.

**Ribet extension without residual distinctness.** Prove `IntegralRibet.global_ribet`. Let `T` be complete reduced noetherian local,
`I ⊆ T` any ideal, `G` compact and `ρ : G → GL₂(Frac(T))` continuous. Assume every characteristic
polynomial lies in `T[X]`, reduces modulo `I` to `(X − χ(g))(X − ψ(g))` for continuous `T`-unit
characters `χ, ψ`, and that every field-factor representation is irreducible. Prove that there
are a finite `T`-module `M` and a continuous class in `H¹(G, M(χψ⁻¹))` for which every
representative cocycle generates `M`, and `Fitt₀_T(M) ⊆ I`; residual equality and residue
characteristic two are allowed. For `I = T` the proof takes the zero module; `I = 0` is excluded
by irreducibility; for a proper nonzero ideal it separates the coincident-character construction
from the distinct-character lattice argument. The global difference lattice and the
fraction-lattice topology of Finite orders and the global coefficient ring supply the canonical
theorem’s extra inputs when `T̃=T`; the
distinct-character upper-entry lattice uses the same boundedness and topology results after
the chosen change of basis. Only the coincident case uses the Nakayama
every-representative lemma ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Theorem 1.1, pp.2–3). *Needs:* Ribet extension with all local conditions, Every cocycle representative generates,
Ribet theory for distinct residual characters, Irreducibility excludes an exact split determinant.
*Lean:* `IntegralRibet.global_ribet`.

**Checks for difference and local-relation maps.** The integral unipotent example is
`ρ(n)=[[1,n],[0,1]]`, with additive integers
written as `Multiplicative ℤ` and both characters trivial. The scalar representation is
`ρ(g)=ψ(g)I₂`. The sign-character input uses
`G=ℤˣ`, `ρ(u)=uI₂` and both comparison characters equal to `1`; its differences span
`2ℤI₂` and their products span `4ℤI₂`. The unipotent quotient comparison is normalized by
sending the class of `E₀₁` to `1`.
The table gives the resulting Checks.

| Definition | Computed Check | Degenerate Check | Agreement Check |
|---|---|---|---|
| `differenceMap` | At `n`, the unipotent map gives `nE₀₁` | A scalar representation minus its character gives zero | At the group identity every difference is zero |
| `ΔχΔψ` | Both unipotent difference modules are `ℤE₀₁`, whose product is zero | Scalar differences have zero product | The product lies inside the right difference module `Δψ` |
| `productInside` | The unipotent product submodule is zero | The scalar product submodule is zero | For the sign-character input, `2I₂` is outside and `4I₂` inside |
| Quotient map `Δψ → M₀` | The unipotent quotient map is injective | For scalar data it is the zero map | For the sign-character input, the class of `2I₂` survives and twice it vanishes |
| Difference class in `M₀` | The unipotent class of `n` is `n` under the normalized identification `M₀ ≅ ℤ` | Scalar classes vanish | The identity class is zero |
| `extraPlaces` | The two-place local datum gives `{1}` | The full local datum, with its single distinguished place, gives the empty set | With three places, all in `sigma`, and distinguished place `1`, the result is `{0,2}` |
| `localRelations` | For unipotent data with the full local datum, relations fill the enlarged module | Empty scalar data have no relations | Scalar data with the two-place local datum have no relations despite the surviving free generator |
| `localCocycle` | With unipotent data and the full local datum, every class vanishes | Empty scalar data give zero | With empty local input and the sign-character representation, `κ(−1)≠0` |
| `localVector` | Over `A = ℤ` and for any `ρ, χ, ψ`, the two-place local datum gives a local vector at place `1` of infinite order | The full local datum has no local vector | With three places, all in `sigma`, trivial subgroups and distinguished place `1`, the local vectors at places `0` and `2` differ over a nonzero ring |

**Checks for formal coordinates and relations.** These are computations in the specified
polynomial quotients.

| Definition | Computed Check | Degenerate Check | Agreement or non-example Check |
|---|---|---|---|
| Generic matrix `Y_i` | The upper entry of the selected triangular matrix is zero | With no triangular constraint that entry is nonzero | The lower entry survives the triangular constraint |
| Coefficient variable | Sending the sole coefficient to `7` evaluates it to `7` | A sole free coefficient is nonzero | Two coefficient variables are distinct |
| Evaluation `π` | The matrix `[[1,2],[3,4]]` evaluates the upper coordinate to `2` | The triangular matrix `[[1,0],[3,4]]` evaluates it to zero | With the coefficient sent to `7`, its translate by `1` evaluates to `8` |
| Full relation ideal `J` | The row `diag(2,4)` over `ℤ` generates `(2)` | Empty rows generate zero | The identity row generates `(1)` |
| Upper relation ideal `J′` | The row `[[2,3],[4,5]]` generates `(3)` | Empty rows generate zero | The identity row has upper ideal zero, although its full ideal is `(1)` |
| Local relation matrix `[[A,B],[C,D]]` | `X=[[1,2],[3,4]]`, `Y=[[5,6],[7,8]]`, `x=9`, `y=10` gives `[[-2,−38],[−29,−7]]` | All inputs zero give zero | `X=Y=0`, `x=2`, `y=3` gives `−6I₂` |
| Lower-Borel inverse conjugation | The upper entry of the conjugate of `E₀₁` is `z/x` | Zero maps to zero | The identity maps to the identity |
| Word evaluation | A matrix generator evaluates to its assigned `[[1,2],[3,4]]` | With no generators, `1` evaluates to `I₂` | A coefficient generator assigned `3` evaluates to `3I₂` |
| Invariant subring `A` | Each free coefficient belongs to the subring | With no generators over `ℤ` it is all of `ℤ` | The lower-right entry of a selected triangular matrix belongs to it |
| Borel invariants `H⁰(B, R)` | The trace of a generic matrix belongs to it | With no variables it is the entire ring | The upper entry of a full generic matrix does not belong to it |

**Local-data carriers.** The empty datum has count `0`, empty `sigma`, and no
distinguished place. The full datum has count `1`, subgroup equal to the entire
group, and distinguished place `0`. The two-place datum has count `2`, full
subgroup and distinguished place at `0`, trivial subgroup at place `1`, and both places in
`sigma`. The three-place datum has count `3`, all places in `sigma`, trivial
subgroups and distinguished place `1`. Each fixture has trivial inertia
(DKSW Theorem 2.1, pp.7–8). For an arbitrary `IntegralRibet.LocalData`, count zero forces no
distinguished place;
empty `sigma` does the same; nonempty `sigma` excludes `distinguished=none`.

**Checks for local-data fixtures.** The enlarged module for the empty and the full local data
is the initial module `IntegralRibet.initialModule`, and both have no local-vector index. Their
local quotients differ: with the integer upper-unipotent representation, the empty datum leaves
the nonzero initial cocycle, whereas the full datum kills its entire span. For scalar data with
the two-place datum, the enlarged
module and local quotient are both `A`, and over a nonzero ring the local vector at place
`1` is nonzero. These module and cocycle computations are the Checks; the record-field
identities above specify the carriers.
The identification `M₀ ≅ ℤ` for the upper-unipotent representation is normalized so that the class
of `ρ(1) − 1 = E₀₁` goes to `1` (the other basis would send it to `−1`). It then sends zero to
zero, the difference class of `1` to `1`, and the difference class of `−2` to `−2`.
The GMA fixtures for the full matrix algebra with scalar blocks, for a single block and for an
order carry explicit diagonal identifications
(the `(i,i)` entry, respectively the identity of `M_d(A)`), so their primitive idempotents are
determined: for a single block of size two the primitive is `E₀₀`, which an arbitrary
automorphism of `M₂(A)` would move. The `GL₁` comparison is evaluation of the
coordinate `x`, excluding the composite with inversion.

**Comparison maps and their values.** The degree-`k` term of `K(x)` is the
actual exterior-power term `⋀^k Aⁿ`, by the identity; in degrees zero and one the identifications
are Mathlib's `exteriorPower.zeroEquiv` and `exteriorPower.oneEquiv`. The generator formula
on wedges fixes every differential: the first deleted vector has positive sign.
The chain map `K(x) → K(x′)` is the exterior power of the given linear map in every degree.
The inverse tensor comparison `K(x) ⊗ K(y) → K(x, y)` places left vectors
before right vectors. The map onto `H₀(K(x)) = A/(x)` sends the cycle of a scalar to its residue
class.
These contracts apply over every commutative coefficient ring (Stacks tags
[0622](https://stacks.math.columbia.edu/tag/0622),
[0624](https://stacks.math.columbia.edu/tag/0624), and
[0664](https://stacks.math.columbia.edu/tag/0664)).

The degree-zero and degree-one Buchsbaum–Rim identifications are identities on their
specified carriers. The rank-one comparison `BR(f) ≅ K(x)` fixes the source generators and the
scalar unit, fixes degree two, and
inserts the ordered dual volumes in every degree `k+3`.
In rank two, `d₂` is the cyclic-minor contraction on every triple.
The comparison map `DetBR(f) → DetBR(f′)` is the identity on the target determinant line and
`∧^m g` on the source determinant term. The map onto `H₀(DetBR(f)) = R/I_m(f)` sends the ordered
target volume to `1 mod I_m(f)` (Buchsbaum §1, pp.185–187; DKSW (60)–(62), pp.36–37).
The augmentation `C → R/J′` in degree zero is the scalar quotient map; both relation
complexes use the identity on their literal degree-zero term `R` (DKSW (65)–(66), p.39).

**Checks for comparison maps.**
Identity unfoldings record the carriers; the three Checks for each target below instead
compute wedges, boundaries, or quotient classes.
The empty wedge denotes the unit of exterior degree zero.

| Definition | Three discriminating Checks |
|---|---|
| Terms `⋀^k Aⁿ` of `K(x)` | Wedge of `(2,0),(0,3)` is six times the volume; reversing the basis negates the volume; a repeated vector gives zero |
| Degree zero of `K(x)` | Empty sequence sends empty wedge to `1`; negative empty wedge to `−1`; empty wedge stays `1` over `𝔽₂` |
| Degree one of `K(x)` | First and second basis wedges go to their respective basis vectors; zero wedge goes to zero |
| Chain map `K(x) → K(x′)` | Identity chain map; zero source map kills degree one; the same map preserves degree-zero unit |
| `H₀(K(x)) = A/(x)` | Scalar `3` goes to `1 mod 2`, `3 mod 0`, `0 mod 1` |
| `K(x, y) ≅ K(x) ⊗ K(y)` | Left generator becomes `e₀`; right generator becomes `e₁`; their tensor becomes `e₀∧e₁` |
| Degree zero of `BR(f)` | Boundary of `(2,−3)` is `(0,0)`, `(2,−3)`, `(-5,-7)` for zero, identity, and `[[2,3],[4,5]]` |
| Degree one of `BR(f)` | Boundary of `(2,−3)` is `(0,0)`, `(2,−3)`, `(-5,-7)` for zero, identity, and `[[2,3],[4,5]]` |
| Degree two of `BR(f)` in rank two | Scaling the first two basis vectors by `2,3` gives six times the volume; exchanging them negates it; repeated-vector wedge goes to zero |
| `BR(f) ≅ K(x)` in rank one | Preserves `3`, `−2`, `1` in source degree one for identity, zero, multiplication by `2` |
| Degree zero of `DetBR(f)` | Boundary of the ordered source volume is `0`, the target volume, and `−2` times that volume for zero, identity, and `[[2,3],[4,5]]` |
| Degree one of `DetBR(f)` | Boundary of the ordered source volume is `0`, the target volume, and `−2` times that volume for zero, identity, and `[[2,3],[4,5]]` |
| Comparison map `DetBR(f) → DetBR(f′)` | Identity preserves the source wedge; zero source map kills it; that map still preserves the target volume |
| `H₀(DetBR(f)) = R/I_m(f)` | For `diag(2,3)`, scalar `7` goes to `1 mod 6`; for zero, `3` goes to `3`; for identity, `3` goes to zero |
| Degree zero of `C` | Boundary images in scalar coordinates are `0`, `0`, and `(2)` for empty, zero, and `(2)` relations |
| Augmentation `C → R/J′` | Scalar `3` goes to `3`, `3`, `1 mod 2` in those cases |
| Degree zero of `D` | Boundary images in scalar coordinates are `0`, `0`, and `ℤ` for empty, zero, and `[[2,3],[4,5]]` rows |

The rank-two degree-two carrier uses the ordered dual volume to identify
`∧²(R²)* ⊗ ∧³(Rⁿ)` with `∧³(Rⁿ)`, and its comparison is the identity.
For the maps with rows `(e₀*,e₁*)`, `(e₁*,e₀*)`, and zero, the boundary of
the ordered triple is respectively `e₂`, `−e₂`, and zero.
For the rank-one module-complex comparison, use the standard generator of `R¹`
and its dual to remove all one-dimensional bar and determinant factors; the
resulting ordered source wedge maps to the same wedge in `K(x)` in every degree.
This fixes the full comparison, including maps with zero differential.
For the comparison map `DetBR(f) → DetBR(f′)`, every exterior-bar summand fixes its target dual
factors and applies `∧^{m+∑s_i}g` to its source wedge; this specifies the map
also above degree one (Buchsbaum §1, pp.185–187).

**Two-term sign check.** For the sequence `(2,3)` over `ℤ`,
`d(e₀∧e₁)=2e₁−3e₀`, so its coordinate vector is `(−3,2)` and its next
boundary is `2(−3)+3·2=0`. Together with the ordered
concatenation check this pins the tensor differential convention
`d(u⊗v)=du⊗v+(−1)^deg(u)u⊗dv`.

### Examples

The checks of this layer run on a handful of objects. The integral upper-unipotent representation
`n ↦ [[1, n], [0, 1]]` of `ℤ` with `χ = ψ = 1` has `Δψ = ℤ E₁₂`, `ΔχΔψ = 0`, `M₀ ≅ ℤ` and
`κ₀(n) = n` (Character difference modules, Initial Ribet quotient module, Canonical Ribet cocycle); the scalar representation `ρ = ψ I₂`
with `Σ = {v₀, v₁}` has `M₀ = 0` but `N ≅ A y_{v₁}` (Ribet module with local conditions). On the formal side the examples are the ring of one generic matrix with
`b = 0`, whose lower-Borel invariants are `ℤ[a, d]` (Formal Ribet matrix ring,
Trace and determinant invariant subring), the relation `ε₁X₁ + ε₂X₂` with
`J′ = (ε₁b₁ + ε₂b₂)` (Formal Ribet relation ideals), and the `𝔽₂` scalar matrices
with zero trace and determinant `a²`. For the group-scheme side, the trivial module
`ℤ = Ind_B^G(0)` and the standard representation `ℤ²` have good filtrations, while a module with
`H¹(G, V) ≠ 0` has none (Good filtrations and acyclicity). For the complexes:
`K(2)` over `ℤ` and over `ℤ/4`, and `K(0)` (DerivedModuleAlgebra §0.K.1 / Koszul complex of a finite sequence);
`f = id : R² → R²`, `f = 0 : R³ → R²` and the cyclic contraction `r₁₂e₃ + r₂₃e₁ + r₃₁e₂`
(Buchsbaum–Rim module complex); the generic `2 × 3` matrix with its three minors
and two syzygies (Buchsbaum–Rim determinant complex); multiplication by `2` on `ℤ`
and on `ℤ/4` (Regularity of a finite free map); and the relation complexes `R`,
`R --L→ R` and `R --(b₁b′₂ − b₂b′₁)→ R` (Upper-entry relation complex,
Full-entry relation complex).

### Dependencies

DerivedModuleAlgebra §0.K.1 supplies the Koszul complexes and their tensor, homotopy and
weakly regular resolution interfaces. Layer IHG.0 (Amitsur's formula for determinants for the character congruence,
Invariant coordinate algebras under conjugation and Rational cohomology of a flat affine group scheme for the integral Borel cohomology); Layer IHG.1 (Henselian lifting of matrix units for the distinct-character case and Faithful quotients over arbitrary fields for excluding `I = 0`). Tau Ceti `TauCeti.fittingIdeal` with
`TauCeti.fittingIdeal_eq_minorsIdeal_ker`, and `TauCeti.Comodule`; ProfiniteCohomology layer 2 for
cocycles, coboundaries and `H¹`. PadicMeasuresIwasawaAlgebras §4.5 supplies the general
annihilator bound `TauCeti.Module.fittingIdeal_le_annihilator`; the relation-minor argument here
proves the Ribet-specific weighted containment of §6.7. From Mathlib: `MonoidAlgebra`, `Matrix`, `Submodule`,
`ExteriorAlgebra`, `exteriorPower.map`, `RingTheory.Sequence.IsWeaklyRegular`, `MvPolynomial` and
`IsLocalization.Away`. SchemeAndStackFoundations §0.20 supplies
`Ring.IsJapanese.of_complete_local` and `Ring.IsNagata.of_complete_local` for the finite
normalization used by the global difference lattice. The sources are DKSW, Buchsbaum and the
Stacks Project.

## Downstream consumers

The consumers of this roadmap are the applications that connect a geometric Hecke action to Galois
data: locally symmetric spaces and their torsion cohomology (the interpolation of Layer IHG.4 and
the quantified nilpotent comparison of Layer IHG.5 are the algebraic form of Scholze's Corollary
5.1.11 and Theorem 5.4.1), higher coherent cohomology and higher Hida theory for `GSp₄` (the
ordinary parts and operator localisations of Layer IHG.2, the dual-spin conversions of Layer
IHG.3a and the symplectic descent of Layer IHG.1), automorphic congruences and modularity lifting
(Galois-type maximal ideals of Layer IHG.3b, the reconstruction and coefficient descent of Layer
IHG.1, the compatible local compressions of Caraiani–Newton), Iwasawa theory and Ribet's method
(the integral Ribet modules and Fitting-ideal bounds of Layer IHG.6, including the residually
indistinguishable case), and Galois deformation spaces (the invariant-coordinate representing
rings of Layer IHG.0 and the universal Cayley–Hamilton algebras and generic representation
algebra of Böckle–Iyengar–Paškūnas in Layer IHG.1). Each such application supplies its own geometric Hecke comparison,
classical congruence witnesses and eigenvalue systems in the exact algebraic form this roadmap
specifies: a congruence witness of Uniform congruence witnesses for classical systems, an error ideal with a uniform exponent for Determinant from a quantified Hecke comparison, the existence of the residual representation for Maximal ideals of Galois type, and the integral lattice and local triangularisations of Ribet extension with all local conditions. Within the roadmap, Layer IHG.3b consumes IHG.1 and IHG.3a;
IHG.4 consumes IHG.0 and IHG.3a; IHG.5 consumes IHG.1, IHG.2 and IHG.4; IHG.6 consumes IHG.0 and
IHG.1.

| Consumer | Supplied interface | Conventions and consumer work |
|---|---|---|
| FreeProbability §F8 / Gaussian and Haar random-matrix asymptotic freeness | §0.2 / Pseudocharacters supplies `cycleProduct` and `cycleTerm`; F8 identifies its permutation-trace functional with `cycleTerm tr_N σ D` for `R = M_N(ℂ)`, `A = ℂ`, `T = tr_N`, `N > 0` and a matrix word `D`. | Here `tr_N(M) = N⁻¹ tr(M)`: one factor per cycle, fixed points included, with word order `i, σi, σ²i, …` starting at the least cycle representative. Cyclicity of `tr_N` handles changing starting points; F8 supplies the explicit permutation inversion/orientation comparison needed by its Wick and Kreweras formulas. Since `tr_N(1) = 1` while ordinary matrix trace has `T(1) = N`, this contract consumes the cycle construction without asserting that normalized trace is a dimension-`N` pseudocharacter. |

## References

Page numbers below refer to the stated public text. Preprint pagination is used unless journal
pagination is specified. Each statement above supplies its own precise locator.

**Chenevier** — Gaëtan Chenevier. [The p-adic analytic space of pseudocharacters of a profinite
group and pseudorepresentations over arbitrary rings](https://arxiv.org/pdf/0809.0415v2).
arXiv:0809.0415v2 (2013), 56-page preprint; published in LMS Lecture Note Series 414 (2014),
pp.221–285. Locators above use the preprint pages.

**ACC** — Allen, Calegari, Caraiani, Gee, Helm, Le Hung, Newton, Scholze, Taylor and Thorne.
[Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf).
Annals 197 (2023); public author PDF with journal pagination

**Boxer–Pilloni** — George Boxer and Vincent Pilloni. [Higher Hida theory for Siegel modular
forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf). Author PDF built
5 November 2025; Inventiones 244 (2026), 45–141

**Bökstedt–Neeman** — Marcel Bökstedt and Amnon Neeman. [Homotopy limits in triangulated
categories](https://www.numdam.org/item/CM_1993__86_2_209_0.pdf). Compositio 86 (1993), 209–234;
Numdam version of record

**BCGP** — Boxer, Calegari, Gee and Pilloni. [Modularity theorems for abelian
surfaces](https://arxiv.org/pdf/2502.20645v1). arXiv:2502.20645v1

**Calegari–Geraghty 2018** — Frank Calegari and David Geraghty. [Modularity lifting beyond the
Taylor–Wiles method](https://arxiv.org/pdf/1207.4224). arXiv:1207.4224 public version

**Calegari–Geraghty–Harris** — Calegari, Geraghty and Harris. [Bloch–Kato conjectures for
automorphic motives](https://arxiv.org/pdf/1907.08694). arXiv:1907.08694

**Scholze** — Peter Scholze. [On torsion in the cohomology of locally symmetric
varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf). Annals
182 (2015), public version of record

**DKSW** — Samit Dasgupta, Mahesh Kakde, Jesse Silliman and Jiuya Wang. [The residually
indistinguishable case of Ribet’s method for GL₂](https://math.iisc.ac.in/~maheshkakde/rl.pdf).
Author manuscript, 21 September 2023

**Roby** — Norbert Roby. [Lois polynômes et lois formelles en théorie des
modules](https://www.numdam.org/item/ASENS_1963_3_80_3_213_0.pdf). Ann. Sci. ENS (3) 80 (1963),
213–348; Numdam version of record

**Emerson–Morel** — Kathleen Emerson and Sophie Morel. [Comparison of different definitions of
pseudocharacters](https://arxiv.org/pdf/2310.03869v2). arXiv:2310.03869v2, 17 October 2023

**Quast** — Julian Quast. [Deformations of G-valued
pseudocharacters](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf).
Author PDF retaining arXiv:2310.14886v1 and date 23 October 2023

**Paškūnas–Quast** — Vytautas Paškūnas and Julian Quast. [On local Galois deformation rings:
generalised reductive
groups](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/2D7C5400C4BA7789C0E1CFF008D12E60/S2050508626100304a.pdf/div-class-title-on-local-galois-deformation-rings-generalised-reductive-groups-div.pdf).
Forum of Mathematics, Pi 14 (2026), e15; public publisher PDF

**Bellaïche–Chenevier** — Joël Bellaïche and Gaëtan Chenevier. [Families of Galois representations
and Selmer groups](https://arxiv.org/pdf/math/0602340v2). arXiv:math/0602340v2 (2007), preprint
pagination; published as Astérisque 324 (2009).

**Caraiani–Newton** — Ana Caraiani and James Newton. [On the modularity of elliptic curves over
imaginary quadratic fields](https://arxiv.org/pdf/2301.10509v3). arXiv:2301.10509v3

**Wang–Erickson** — Carl Wang-Erickson. [Algebraic families of Galois representations and
potentially semi-stable pseudodeformation rings](https://sites.pitt.edu/~caw203/pdfs/algfam.pdf).
Mathematische Annalen 371 (2018), 1615–1681; public author manuscript

**CHT** — Laurent Clozel, Michael Harris and Richard Taylor. [Automorphy for some l-adic lifts of
automorphic mod l Galois representations](https://www.numdam.org/item/PMIHES_2008__108__1_0.pdf).
Publications mathématiques IHÉS 108 (2008), 1–181; Numdam version of record

**Gee–Geraghty** — Toby Gee and David Geraghty. [Companion forms for unitary and symplectic
groups](https://arxiv.org/pdf/1001.2044). Duke Mathematical Journal 161 (2012), 247–303;
arXiv:1001.2044

**BHKT** — Gebhard Böckle, Michael Harris, Chandrashekhar Khare and Jack A. Thorne. [G-local
systems on smooth projective curves are potentially
automorphic](https://arxiv.org/pdf/1609.03491). Acta Mathematica 223 (2019), 1–111;
arXiv:1609.03491

**BIP** — Gebhard Böckle, Ashwin Iyengar and Vytautas Paškūnas. [On local Galois deformation
rings](https://arxiv.org/pdf/2110.01638). Forum of Mathematics, Pi 11 (2023), e30;
arXiv:2110.01638

**Buchsbaum** — David A. Buchsbaum. [A generalized Koszul complex.
I](https://people.brandeis.edu/~buchsbau/miscpapers/009.pdf). Transactions AMS 111 (1964),
183–196; scanned author-linked journal copy

**Pilloni** — Vincent Pilloni. [Higher coherent cohomology and p-adic modular forms of singular
weights](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf). Duke
Mathematical Journal 169 (2020), 1647–1807; public author manuscript

**Genestier–Tilouine** — Alain Genestier and Jacques Tilouine. [Systèmes de Taylor–Wiles pour
GSp₄](https://numdam.org/item/AST_2005__302__177_0.pdf). Astérisque 302 (2005), 177–290; public
Numdam journal copy

**Calegari–Geraghty 2020** — Frank Calegari and David Geraghty. [Modularity lifting for
non-regular symplectic representations](https://arxiv.org/pdf/1907.08691). Duke Mathematical
Journal 169 (2020), 801–896; public author manuscript

**Grothendieck** — Alexander Grothendieck. [Le groupe de Brauer I: Algèbres d'Azumaya et
interprétations diverses](http://www.numdam.org/item/SB_1964-1966__9__199_0.pdf). Séminaire
Bourbaki 9 (1964–1966), exposé 290, 199–219; Numdam version of record

**Stacks** — The Stacks Project authors. [The Stacks Project](https://stacks.math.columbia.edu).
More on Algebra, §15.29 The Koszul complex and §15.31 Koszul regular sequences; cited by tag

**Allen–Newton–Thorne** — Patrick B. Allen, James Newton and Jack A. Thorne. [Automorphy lifting
for residually reducible l-adic Galois representations, II](https://arxiv.org/pdf/1912.11269v2).
Accepted version, arXiv:1912.11269v2, 13 August 2020

[reductivegroups9]: ../ReductiveGroups/README.md#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ
[classfieldtheory7]: ../ClassFieldTheory/README.md#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors
[semisimplealgebras0]: ../RepresentationTheory/SemisimpleAlgebras/README.md#layer-0-the-jacobson-radical-and-the-semisimplicity-criterion-supporting-api-optional
[semisimplealgebras3]: ../RepresentationTheory/SemisimpleAlgebras/README.md#layer-3-the-double-centralizer-density-theorem
[semisimplealgebras2]: ../RepresentationTheory/SemisimpleAlgebras/README.md#layer-2-artin-wedderburn-assembled-with-uniqueness
[semisimplealgebras4]: ../RepresentationTheory/SemisimpleAlgebras/README.md#layer-4-central-simple-algebras-and-their-tensor-products
[chebotarev10]: ../Chebotarev/README.md#layer-10-dirichlet-density-chebotarev
[profinitecohomology2]: ../ProfiniteCohomology/README.md#layer-2-the-explicit-low-degree-complex-and-its-functoriality

**Ribet** — Kenneth A. Ribet. [A modular construction of unramified p-extensions of
Q(μ_p)](https://math.berkeley.edu/~ribet/Articles/invent_34.pdf). Inventiones 34 (1976),
151–162; Proposition 2.1, pp.154–155.

**Jantzen** — Jens Carsten Jantzen. *Representations of Algebraic Groups*, second edition.
AMS Mathematical Surveys and Monographs 107 (2003). Part I, §§3.3–3.7 and 4.2–4.17;
Part II, §§4.16–4.21.
