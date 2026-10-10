# Roadmap: integral Hecke actions, determinants and interpolation

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
distinguished in the `*Needs:*` annotations. Each construction names its usable API and its checks.
The signatures use the namespace `TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants`. The companion [Suggested.lean](Suggested.lean)
proposes signatures and the `example` tests named in the `**Checks.**` lists; this document fixes
the mathematical scope, including hypotheses whose carriers come from another roadmap.

## Scope and ownership

The roadmap owns determinant polynomial laws and their reconstruction and interpolation theory:
homogeneous and multiplicative polynomial laws, Chenevier determinants with their characteristic
polynomials, kernels and Cayley–Hamilton ideals, the Roby divided-power representing algebras and
the determinant coordinate ring, the Amitsur formula and the comparison with pseudocharacters,
continuous determinants, contragredients, finite projective and Azumaya determinants, connected
reductive pseudocharacters with their invariant-coordinate evaluations, rational cohomology of a
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
  Azumaya predicate; homogeneity, multiplicativity and the determinant structure extend Mathlib's
  law carrier here.
- Tau Ceti supplies right comodules over a coalgebra, the completed group algebra, Fitting ideals,
  the classical rank-two Satake parameters, conjugacy of algebra isomorphisms over a field and the
  arithmetic-Frobenius value of the cyclotomic character.
- The roadmap **SemisimpleAlgebras** (layers 0, 2, 3, 4 and 5) supplies the Jacobson-radical unit
  criteria, Artin–Wedderburn at its artinian hypotheses, density and double centralisers after the
  appropriate dimension bound, finite-dimensional central-simple splitting over the centre, and
  conjugacy of algebra isomorphisms; the determinant-specific boundedness and inseparable norm
  factors are developed here.
- The roadmap **ReductiveGroups** (layer 9) supplies split reductive group schemes over `ℤ` with
  their Hopf algebras, points functor and base change, for a given root datum; `GLₙ` and `GSp₂ₙ`
  enter as the split groups of their root data. Tau Ceti supplies `GeneralLinear.coordinateHopfAlgebra` and its generic
  matrix dictionary. The invariant coordinate algebras of Layer IHG.0 use an actual commutative
  Hopf algebra (`InvariantCoordinateInput`) and its represented points (`InvariantEvaluation`); the
  `GSp₄` statements of Layers IHG.3a and IHG.3b take the similitude as a matrix identity
  `ρ(g)ᵀ J ρ(g) = μ(g) J` for a fixed invertible alternating `J`; **ReductiveGroupsPartII** (RG2.2, RG2.3)
  supplies bounded-action building fixed points and the passage, after finite field extension and
  conjugation, to a hyperspecial integral model.
- **SmoothRepresentationsOfLocalGroups** (SR.4, SR.6) supplies the integral spherical double-coset
  generators, normalised Satake, the `GSp₄` spin polynomial and the generic invariant-word colimit and its twisted excursion applications. The trivial-action
  comparison with the pseudocharacter representing ring, its evaluations, and the GL determinant
  comparison are proved here; a finite Weil action is retained in the twisted theory.
- **ClassFieldTheory** (layer 7) supplies local Artin reciprocity with an explicit Frobenius
  normalisation and its inverse conversion; **Chebotarev** (layer 10) supplies the density of
  conjugacy classes of unramified Frobenius in every finite quotient of `G_{F,S}`.
- **ProfiniteCohomology** (layer 2) supplies explicit continuous cochains, 1-cocycles,
  coboundaries and `H¹`; **ModularForms** (layer 9) supplies the classical Hecke polynomial
  `X²−a_ℓX+ω(ℓ)ℓ^{k−1}`; **PadicMeasuresIwasawaAlgebras** (§5.1) supplies the ring-level
  finite-projective determinant-line API; AlgebraicVectorBundles L0C sheafifies it.
- **SchemeAndStackFoundations** (§0.20) owns `IsJapanese.of_complete_local` and
  `IsNagata.of_complete_local`, including finite normalization in inseparable extensions;
  §2.22 owns affine Azumaya étale splitting and the
  finite-cover-to-one-faithfully-flat-étale-algebra adapter in the neutral `IsAzumaya` API.
  The reduced-norm polynomial law is owned here.
- **PadicMeasuresIwasawaAlgebras** (§4.5) owns `TauCeti.fittingIdeal_le_annihilator` in
  `TauCeti/RingTheory/FittingIdeal`; the Ribet consequences are owned here.

Tau Ceti's `HeckeRing.GL2.Newform.satakeParameters` carries the classical rank-two polynomial
`X²−a_pX+χ(p)p^(k−1)` over `ℂ`; the rank-two normalisation in Layer IHG.3a only matches coefficient
conventions against it. The applications to locally symmetric spaces, higher coherent cohomology,
automorphic congruences, Iwasawa theory and Galois deformation spaces supply their own geometric
Hecke comparisons and classical congruence witnesses. This roadmap specifies the exact algebraic
inputs those applications must provide; it does not infer them from the existence of
characteristic-zero eigenforms.

The following are the library or roadmap halves of statements kept here, each of
which adds the polynomial-law, local-ring or integral clause: the `GSp₄` spin polynomial and its
Calegari–Geraghty normalisation, `SpinPolynomial`, `SpinPolynomial.reciprocal`,
`SpinPolynomial.similitude` and `gsp4-galois-comparison` of SmoothRepresentationsOfLocalGroups,
SR.4, whose `gln-generators` is the hypothesis of the `GLₙ` product formula; the excursion algebra
of SR.6; the henselian and artinian interfaces
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
group-algebra antipode `MonoidAlgebra.antipode`, each the matrix or universal case of a determinant
statement here. In `Suggested.lean` the Fitting ideal is `TauCeti.fittingIdeal`, its base change
`TauCeti.fittingIdeal_baseChange`, the character map of a group algebra `MonoidAlgebra.lift`, and
the spin polynomials are those of SmoothRepresentationsOfLocalGroups.

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
  another specified ideal supplies it. A continuous determinant means continuity of each group
  characteristic coefficient. Galois interpolation fixes the same finite ramification set `S`
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
  the ideal of minors of a submodule. `BuchsbaumRim.maximalMinorIdeal f` is only the
  abbreviation `(LinearMap.range f).minorsIdeal m`, with no separate ideal construction.
- `exteriorPower.zeroEquiv`, `exteriorPower.oneEquiv`, and `exteriorPower.map`
  in `Mathlib/LinearAlgebra/ExteriorPower/Basic.lean` supply the low-degree identifications
  and functorial exterior maps used by the Koszul and determinant complexes.
- `CliffordAlgebra.contractLeft` and `CliffordAlgebra.contractLeft_ι_mul` in
  `Mathlib/LinearAlgebra/CliffordAlgebra/Contraction.lean` supply contraction on the
  exterior algebra by taking the zero quadratic form. `BuchsbaumRim.contractOne`
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
  ring of compatible sections of a diagram; `Interpolation.quotientLimit` specializes
  it to an explicit descending ideal sequence, rather than constructing generic limits.
  `IsAdicComplete.liftRingHom` in `Mathlib/RingTheory/AdicCompletion/RingHom.lean`
  handles powers of one ideal; the Layer 4 presentation also allows arbitrary descending ideals.

- `TwoSidedIdeal.ker`, `TwoSidedIdeal.mem_ker` in
  `Mathlib/RingTheory/TwoSidedIdeal/Kernel.lean` supply the kernel ideal; the retained
  `HeckeImage.ghostIdeal` specializes this carrier to the assembled homology action.
- `Module.DirectLimit`, `Module.DirectLimit.of`, `Module.DirectLimit.of_f`,
  `Module.DirectLimit.lift` and `Module.DirectLimit.hom_ext` in
  `Mathlib/Algebra/Colimit/Module.lean` supply the module colimit and its universal property.
  `HeckeImage.moduleTelescope` abbreviates its `ModuleCat` packaging for the transition
  `t^(j-i)`; `moduleTelescope_ι` abbreviates `Module.DirectLimit.of`.
  `moduleTelescope_presentation` identifies the adjacent-relations quotient with that colimit.
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
  the raw divided-power algebra operations. `DividedPower.degree_map` restricts this map to a fixed
  homogeneous submodule; the internal multiplication is a separate operation.
- `PolynomialLaw.toFun`, `PolynomialLaw.toFun'_eq_toFun` in
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
  `GMA.blockModule` and `GMA.entryModule` are definitional abbreviations of this carrier.
  `GMA.mem_blockModule` and `GMA.mem_entryModule` give the two fixed-point equations;
  `GMA.primitive_idempotent` supplies primitive idempotence. Compression belongs to the
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
  `Theorems.reciprocal_charpoly` is the polynomial-law determinant analogue over
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
  Its `T1,T2` correspond to `T₂,T₁` here. The retained monic variant reflects the degree-four
  polynomial and swaps those indices; the dual-spin variant additionally inverts the central unit.



### From Mathlib

Polynomial laws, tensor products, matrices and group algebras: `PolynomialLaw`,
`PolynomialLaw.ground`, `PolynomialLaw.id`, `PolynomialLaw.comp`, `Algebra.TensorProduct.instRing`,
`Algebra.TensorProduct.rid`, `MonoidAlgebra`, `MonoidAlgebra.of`, `MonoidAlgebra.mapDomainAlgHom`,
`Matrix.det`, `Matrix.charpoly`, `Matrix.trace`. Homogeneity, multiplicativity and determinant
structure extend this existing law carrier; nothing here redefines a polynomial law.

Divided powers and the exterior algebra: `DividedPowerAlgebra` and `DividedPowerAlgebra.dp` supply
the entire divided-power algebra and its generators; its homogeneous pieces and their internal
algebra multiplication are defined here (Layer IHG.0). `exteriorPower.map`, the existing tensor
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
`BuchsbaumRim.contractOne` is its restriction (`contractOne_eq_omega`).

Constant rank is Mathlib's `Module.rankAtStalk` (`Mathlib/RingTheory/Spectrum/Prime/FreeLocus.lean`),
written `Module.rankAtStalk (R := A) V = d` as in `Mathlib/RingTheory/TotallySplit.lean`; for a finite
projective module this is the dimension of every field fibre, so no private constant-rank predicate
is introduced.

The cocycle identity is Mathlib's `groupCohomology.IsCocycle₁`, `f(gh) = g • f(h) + f(g)`. The
matrix and universal cases already in Mathlib, listed under *Scope and ownership* as the library
halves of statements kept here, are `Ideal.sup_pow_add_le_pow_sup_pow`, `LinearMap.eventually_isCompl_ker_pow_range_pow`,
`Matrix.det_fromBlocks_zero₂₁`, `MvPolynomial.mul_esymm_eq_sum`, `Matrix.charpoly_inv`,
`Matrix.reverse_charpoly`, `Matrix.det_one_add_mul_comm`, `MonoidAlgebra.antipode`,
`IsAdicComplete.henselianRing` and `IsArtinianRing.equivPi`; the character map of a group algebra is
`MonoidAlgebra.lift`.

### From Tau Ceti

`TauCeti.Comodule` (`Algebra/Coalgebra/Comodule/`): right comodules over a coalgebra, the fixed
subcomodule `Comodule.fixedSubcomodule`, the abelian category of comodules over a flat coalgebra,
`Comodule.tensor` and `Comodule.cofree`. Conjugation invariants, rational cohomology and good
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
`fittingIdeal A M 0`; in `Suggested.lean` its base change is `TauCeti.fittingIdeal_baseChange`.

`HeckeRing.GL2.Newform.satakeParameters`, the classical rank-two polynomial over `ℂ`, matched
against in Layer IHG.3a only; `IsArithFrobeniusLift.coe_localCyclotomicCharacter`, the value
`ε = q` at arithmetic Frobenius; `exists_unit_conj_of_algEquiv`, conjugacy of algebra isomorphisms
over a field, the field case of the inner-conjugacy statement of Layer IHG.1.

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

SR.4: the spherical double cosets `T_r = [K diag(ϖ, …, ϖ, 1, …, 1) K]` and their normalised
Satake images `q^{r(n−r)/2} e_r` in the symmetric Laurent ring over `ℤ[q^{±1/2}]`, for
`vol(K) = 1` and after adjoining an invertible square root of `q`. SR.4 does not assert that the
`T_r` generate the spherical Hecke algebra over `ℤ`, and nothing here uses such generation: the
`GLₙ` Hecke polynomial of Layer IHG.3a is a formal expression in `q` and the `T_r`; the `GSp₄` spin polynomial with constant term `1`
(`SpinPolynomial`), its reciprocal monic form (`SpinPolynomial.reciprocal`), its similitude
(`SpinPolynomial.similitude`), the comparison with the Calegari–Geraghty normalisation
(`gsp4-galois-comparison`) and the `GLₙ` generator statement `gln-generators`, which is the
hypothesis of the `GLₙ` product formula of Layer IHG.3a. Its general construction is applied here
to `GLₙ` and to the two specified `GSp₄` representations. SR.6: the excursion algebra, the
library half of the universal reductive pseudocharacter ring of Layer IHG.1.

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

ReductiveGroups layer 9: split reductive group schemes over `ℤ` constructed from a root datum
(Chevalley–Demazure), with their Hopf algebras, base change and points over a field; `GLₙ` and
`GSp₂ₙ` are the split groups of their root data. Tau Ceti supplies the explicit `GLₙ` coordinate Hopf algebra and generic matrix.
The general root-datum construction belongs to that layer; here they are data (`InvariantCoordinateInput` with the
identity component given, and the similitude as a matrix identity against a fixed invertible
alternating form), and the Hopf algebras of layer 9 are the intended instances. [Reductive groups, Part II](../ReductiveGroupsPartII/README.md) RG2.2 and
RG2.3: bounded-action building fixed points and passage, after finite field extension and
conjugation, to a hyperspecial integral model, used for the integral model of Layer IHG.1.

### From TauCetiRoadmap.ClassFieldTheory and TauCetiRoadmap.Chebotarev

ClassFieldTheory layer 7: local Artin reciprocity with an explicit Frobenius normalisation and its
inverse conversion (`geometricArtinMap`, `isArithFrobeniusLift_of_mk_eq_artinMap_uniformizer`);
reciprocity is consumed from here, not from SR.4. Chebotarev layer 10: density of conjugacy
classes of unramified Frobenius in every finite quotient of `G_{F,S}`.

### From TauCetiRoadmap.ModularForms and TauCetiRoadmap.PadicMeasuresIwasawaAlgebras

ModularForms layer 9: the Hecke polynomial `X²−a_ℓX+ω(ℓ)ℓ^{k−1}` of a normalised eigenform, the
classical half of the rank-two normalisation of Layer IHG.3a.
[PadicMeasuresIwasawaAlgebras §5.1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/4c2b687410d8df022e1212fdf22129450963d696/TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md#51-determinant-lines-of-perfect-complexes)
supplies `projectiveDeterminant`, `projectiveDeterminant_constantRank`,
`projectiveDeterminant_baseChange` and the exterior-map formula on finite projective modules.
The degree-`d` multiplicative polynomial law on endomorphisms is the additional construction here.
AlgebraicVectorBundles L0C consumes that ring-level foundation for sheaf determinants.

[PadicMeasuresIwasawaAlgebras §4.5](https://github.com/TauCetiProject/TauCetiRoadmap/blob/4c2b687410d8df022e1212fdf22129450963d696/TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md#45-the-iwasawa-coordinate-and-the-initial-fitting-ideal)
supplies `TauCeti.fittingIdeal_le_annihilator` on the existing `TauCeti.fittingIdeal` carrier:
for a commutative ring `A` and `[Module.Finite A M]`, `fittingIdeal A M 0 ≤ Module.annihilator A M`.
Its implementation belongs to `TauCeti/RingTheory/FittingIdeal`, without finite-presentation
hypotheses. This is the common bound consumed by Ribet and Iwasawa theory.

### From TauCetiRoadmap.SchemeAndStackFoundations

[SchemeAndStackFoundations §0.20](https://github.com/TauCetiProject/TauCetiRoadmap/blob/2a5f34f36fd23d27dd9eaa4a2c69a12d857213fe/TauCetiRoadmap/SchemeAndStackFoundations/README.md#020-japanese-and-nagata-rings)
supplies `Ring.IsJapanese`, `Ring.IsNagata`, `IsJapanese.of_complete_local` and
`IsNagata.of_complete_local` in the neutral ring-level API. For a complete noetherian local
domain `A`, the Japanese condition gives `Module.Finite A (integralClosure A E)` for every
finite extension `E` of its fraction field, including inseparable extensions
([Stacks Lemma 10.162.8, tag 032W](https://stacks.math.columbia.edu/tag/032W)).
`Theorems.finite_integralClosure_complete` only specializes `IsJapanese.of_complete_local`
to the supplied fraction field and scalar tower. The additional result here is
`Theorems.global_difference_lattice`; together with `IntegralRibet.fraction_lattice_topology`
it supplies the finite-lattice and topology inputs to `Theorems.local_ribet_theorem`.

[SchemeAndStackFoundations §2.22](https://github.com/TauCetiProject/TauCetiRoadmap/blob/2a5f34f36fd23d27dd9eaa4a2c69a12d857213fe/TauCetiRoadmap/SchemeAndStackFoundations/README.md#222-sheaves-of-algebras-azumaya-algebras-and-the-brauer-group-of-a-scheme)
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
`matrixModule_smul` identifies the action with matrix multiplication;
`matrixModule_submoduleEquiv_mem` fixes the underlying subsets.
`matrixModule_submoduleEquiv`, `matrixModule_isSimple_iff` and
`matrixModule_isSemisimple_iff` give the invariant-subspace characterizations.
Simplicity includes nontriviality; the dimension-zero example is rejected. Reconstruction,
residual specialization and the determinant-specific absolute-irreducibility and
multiplicity-free predicates use this same module action.

## How to read the build

`README.md` is normative; `Suggested.lean` pins names, signatures and the `example` checks for the
central objects. Each `*Needs:*` annotation names its mathematical prerequisites. The build order is
IHG.0 → IHG.3a → IHG.1 → IHG.2 → IHG.3b → IHG.4 → IHG.5 → IHG.6.

- **Layer 0** delivers polynomial laws, determinants, their characteristic coefficients, kernels,
  Roby representability and the determinant coordinate ring, the Amitsur formula and the trace
  comparisons, continuity, duals, finite projective and Azumaya determinants, and connected
  invariant-coordinate pseudocharacters with rational cohomology of a flat affine group scheme.
- **Layer 3a** delivers the `GLₙ` Hecke polynomial, its Satake normalisation, the character twist,
  reciprocal and Frobenius conversions, the `GSp₄` dual-spin polynomial and the full similitude
  identity used by symplectic coefficient descent.
- **Layer 1** delivers Cayley–Hamilton algebras, semisimple reconstruction over fields, henselian
  lifting and generalized matrix algebras, reducibility ideals and extension modules, universal Cayley–Hamilton algebras, coefficient descent, compatible local
  compressions, GL pseudocharacter reconstruction and algebraic representing rings.
- **Layer 2** delivers the four Hecke images of a complex, the ghost ideal with its amplitude
  bound, local factors and localized summands over a complete coefficient ring, and operator
  localisation with ordinary parts.
- **Layer 3b** delivers maximal ideals of Galois type and non-Eisenstein ideals, with their dual and
  twist compatibility.
- **Layer 4** delivers uniqueness from Frobenius density, gluing over compact coefficient rings,
  compatible finite-quotient data, the inverse-limit determinant, uniform congruence witnesses, the
  integral interpolation theorem.
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

**Homogeneous polynomial laws.** For `A` a commutative ring and `A`-modules `M` and `N`, an
`A`-polynomial law `f : M → N` is a family `f_S : S ⊗_A M → S ⊗_A N` natural in the commutative
`A`-algebra `S`, Mathlib's `PolynomialLaw`; `S` ranges over commutative `A`-algebras in the universe
of `A`, as in Mathlib's `PolynomialLaw`, whose extension to all universes is Mathlib's `toFun`. Such
a law is homogeneous of degree `n` if `f_S(s·x) = s^n·f_S(x)` for every commutative `A`-algebra `S`,
`s ∈ S` and `x ∈ S ⊗_A M`. Prove `PolynomialLaw.isHomogeneousOfDegree_zero` (the zero law is
homogeneous of every degree), `PolynomialLaw.IsHomogeneousOfDegree.add` (closed under addition),
`PolynomialLaw.IsHomogeneousOfDegree.comp` (composition multiplies degrees) and
`PolynomialLaw.isHomogeneousOfDegree_one_iff` (degree one iff base change of a linear map)
([Chenevier](https://arxiv.org/pdf/0809.0415v2), §1.1, pp.6–7). *Needs:* Mathlib `PolynomialLaw`,
`PolynomialLaw.comp`, `TensorProduct`.

**Checks.**

- The identity law is homogeneous of degree `1`: `id_S(s·x) = s·x` on every scalar extension, so a
  definition demanding `s^n` for some other `n`, or testing only ground points, would misclassify
  the identity.
- Over `𝔽_p` some degree-`(p+1)` law vanishes on all `𝔽_p`-points without being the zero law:
  homogeneity and vanishing are tested on every scalar extension `S`, so a definition that
  quantified only over `S = A` would wrongly call this law zero.
- The zero law is homogeneous of degree `n` for every `n`, the degenerate case; a definition that
  assigned each law a unique degree would reject it.

**Multiplicative polynomial laws.** For `A`-algebras `R` and `B`, associative and unital but not
necessarily commutative, an `A`-polynomial law `f : R → B` is multiplicative if `f_S(1) = 1` and
`f_S(xy) = f_S(x)f_S(y)` for every commutative `A`-algebra `S` and `x, y ∈ S ⊗_A R`, where the ring
structure on `S ⊗_A R` is Mathlib's `Algebra.TensorProduct` ring structure. Prove
`PolynomialLaw.isMultiplicative_id` (the identity is multiplicative),
`PolynomialLaw.IsMultiplicative.comp` (multiplicative laws compose) and `Determinant.dimOneEquiv`
(multiplicative laws of degree one to `A` are `A`-algebra maps) ([Chenevier](https://arxiv.org/pdf/0809.0415v2),
§1.1, p. 7). *Needs:* Mathlib `PolynomialLaw`, `PolynomialLaw.id`, `PolynomialLaw.comp`,
`Algebra.TensorProduct.instRing`.

**Checks.**

- The identity law is multiplicative: `1 ↦ 1` and `xy ↦ xy` on every `S ⊗_A R`, so a definition
  using a wrong ring structure on the tensor product would already fail on the identity.
- The matrix determinant law `M_d(A) → A` is multiplicative, computing `det(XY) = det X · det Y` after
  every scalar extension; a definition that only asked for multiplicativity on `R` itself would
  not be testable against the scalar-extended matrix identity.
- The zero law on a nonzero ring preserves products but sends `1` to `0`; it fails precisely
  the unit condition. Over `ℤ`, `2 • id` fails both the unit and product conditions.

### 0.2 Scalar-extension laws and degree one

**The polynomial law of a linear map.** For an `A`-linear map `ℓ : M → N`, define
`PolynomialLaw.ofLinearMap` as the degree-one polynomial law with `ℓ_S = S ⊗ ℓ` (`lTensor`) for
every commutative `A`-algebra `S`. Prove `PolynomialLaw.isHomogeneousOfDegree_one_iff` (the
degree-one laws are exactly these) and `PolynomialLaw.ofLinearMap_ground`
(`(ofLinearMap ℓ).ground = ℓ`) ([Chenevier](https://arxiv.org/pdf/0809.0415v2), Example 1.2(i), p. 7). *Needs:*
Homogeneous polynomial laws, Mathlib `LinearMap.lTensor`.

**Checks.**

- `ofLinearMap id` is `PolynomialLaw.id`: the scalar extension of the identity is the identity on
  every `S ⊗_A M`, so a construction inserting a nontrivial coefficient would fail here.
- Its value map is `ℓ`: the ground evaluation of `ofLinearMap ℓ` at `m` is `ℓ(m)`, so a construction
  that forgot to identify `A ⊗_A M` with `M` would compute a different map.
- `ofLinearMap 0` is the zero law, the degenerate case; a construction producing a nonzero constant
  term would fail it.

**Degree-one polynomial laws are linear.** For arbitrary `A`-modules `M, N`, prove that a polynomial
law `P : M → N` is homogeneous of degree one if and only if it is the scalar-extension law of a
unique `A`-linear map `ℓ : M → N`; no flatness or finite-generation hypothesis is needed. The proof
expands `P(uX + vY)` and compares total degree after the substitution `(X, Y) ↦ (XT, YT)`: its two
coefficients give additivity, and homogeneity gives scalar linearity. Naturality then identifies
every scalar-extension value with the induced linear map, including for torsion modules
([Chenevier](https://arxiv.org/pdf/0809.0415v2), Example 1.2(i) and footnote 11, p.7). *Needs:* The polynomial law of a linear map.

**Determinants (Chenevier).** For `A` commutative and `R` any associative unital `A`-algebra, a
`d`-dimensional determinant valued in `A` is a degree-`d` homogeneous polynomial law `D : R → A`
that preserves `1` and multiplication after every commutative scalar extension; `d ≥ 0` is allowed,
and for `d = 0` the only determinant is the constant `1`. For `R = A[G]`, with `G` a group or
monoid, it is called a determinant on `G`. Prove `Determinant.eval_mul` (`D(xy) = D(x)D(y)`),
`Determinant.eval_one` (`D(1) = 1`), `Determinant.eval_smul` (`D(ax) = a^d D(x)`) and
`Determinant.isUnit_eval` (units go to units) ([Chenevier](https://arxiv.org/pdf/0809.0415v2), §1.5, Definition,
p. 9). *Needs:* Homogeneous polynomial laws, Multiplicative polynomial laws, Mathlib `PolynomialLaw.ground`.

**Checks.**

- `eval (ofMatrix id) M = det M` on `M_d(A)`: the determinant law of the identity representation
  computes the matrix determinant, so a law normalised differently would fail on `M = 1`.
- A determinant of dimension `0` is the constant `1`, the degenerate case; a definition forcing
  `D(0) = 0` would exclude it.
- Over `(ℤ/p)[X]` two different `p`-dimensional determinants have the same trace, so a definition
  that recorded only the trace would identify two distinct determinants.

**Characteristic polynomial and trace of a determinant.** For `D` a `d`-dimensional determinant on
`R` and `x ∈ R`, define `χ(x, t) := D_{A[t]}(t − x) ∈ A[t]`, where `A[t]` is a commutative
`A`-algebra in the universe of `A`, so that `D_{A[t]}` is defined; write

```text
χ(x, t) = Σ_{i=0}^{d} (−1)^i Λ_i(x) t^{d−i}.
```

It is monic, with `natDegree = d` when `A` is nonzero. For `d ≥ 1`, `Λ_0 = 1`, `Λ_d = D`, and `Λ_1 =: Tr` is an `A`-linear map with
`Tr(1) = d`. Prove `Determinant.charpoly_monic` (`χ(x, t)` is monic),
`Determinant.charpoly_natDegree` (`deg χ = d`), `Determinant.charpoly_coeff_zero`
(`χ(x, 0) = (−1)^d D(x)`), define `Determinant.traceLinear` (`Tr` as an `A`-linear map) and prove
`Determinant.trace_one` (`Tr(1) = d`) ([Chenevier](https://arxiv.org/pdf/0809.0415v2), §1.10, p. 12;
[Chenevier](https://arxiv.org/pdf/0809.0415v2), §1.10, (1.3), p. 12). *Needs:* Determinants (Chenevier), Mathlib `Polynomial`, `Algebra.TensorProduct.rid`, `Polynomial.Monic`,
Degree-one polynomial laws are linear.

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
determinant. Prove `Determinant.eval_ofMatrix` (`D(x) = det ρ(x)`), `Determinant.trace_ofMatrix`
(`Tr = tr ∘ ρ`), `Determinant.charpoly_ofMatrix` (`χ(x) = charpoly ρ(x)`) and
`Determinant.ofMatrix_conj` (conjugate representations have the same determinant)
([Chenevier](https://arxiv.org/pdf/0809.0415v2), §1.5, p. 9). *Needs:* Characteristic polynomial and trace of a determinant, Mathlib `Matrix.det`, `Matrix.det_mul`, `Matrix.det_smul`,
`Matrix.det_conj`, `RingHom.map_det`, `Matrix.charpoly`, `Matrix.trace`.

**Checks.**

- `ofMatrix id` on `M_d(A)` evaluates to `det`: the construction applied to the identity
  representation computes the ordinary determinant, so any scalar-extension step that failed to
  commute with `det` would already show here.
- Its trace is the matrix trace, so a construction whose `Λ_1` did not agree with `Matrix.trace`
  under `ρ = id` would be wrong.
- A block-diagonal representation gives the product determinant: `det` of a block sum is the
  product of the block determinants, so a construction not multiplicative across blocks would fail.

**Direct sums of determinants.** For determinants `D_1, D_2` on `R` of dimensions `d_1, d_2` over a
commutative `A`, so that products of multiplicative laws are multiplicative, prove that the product
`D_1·D_2`, taken pointwise after each scalar extension, is a determinant of dimension `d_1 + d_2`,
with `Tr = Tr_1 + Tr_2` and `χ = χ_1χ_2`. Prove `Determinant.eval_mul_det`
(`(D_1 D_2)(x) = D_1(x) D_2(x)`), `Determinant.trace_mul_det` (`Tr(D_1 D_2) = Tr D_1 + Tr D_2`) and
`Determinant.charpoly_mul_det` (`χ(D_1 D_2) = χ(D_1) χ(D_2)`) ([Chenevier](https://arxiv.org/pdf/0809.0415v2),
Proof of Lemma 2.2, p. 24). *Needs:* Characteristic polynomial and trace of a determinant.

**Checks.**

- `ofMatrix` of a block sum is the product of the `ofMatrix` of the blocks, so a product law not
  agreeing with the matrix determinant of `diag(ρ_1, ρ_2)` would fail.
- Traces add: `Tr(D_1 D_2)(x) = Tr_1(x) + Tr_2(x)`, so a product whose degree-`(d−1)` coefficient
  was not the sum would be detected.
- Multiplying by the dimension-`0` determinant changes nothing, the degenerate case: `D·1 = D` with
  dimension `d + 0`, so a construction that shifted the dimension or the value would fail.

**Restriction of determinants.** For an `A`-algebra homomorphism `φ : R′ → R` and a `d`-dimensional
determinant `D` on `R`, prove that `D ∘ φ`, the composition of polynomial laws with the degree-one
law of `φ`, is a `d`-dimensional determinant on `R′`; for a subgroup `H ≤ G`, restriction along
`A[H] → A[G]` is restriction to `H`. Prove `Determinant.eval_comap` (`(D ∘ φ)(x) = D(φ x)`),
`Determinant.comap_id` (restriction along the identity is `D`) and `Determinant.comap_comp`
(restriction along `ψ ∘ φ` is restriction along `ψ` then `φ`) ([Chenevier](https://arxiv.org/pdf/0809.0415v2),
§1.5, p. 9 (determinants on A[G])). *Needs:* Determinants (Chenevier), Mathlib
`MonoidAlgebra.mapDomainAlgHom`.

**Checks.**

- Restriction along the identity returns `D` itself, so a comap that re-indexed or re-scaled the
  law would fail on `φ = id`.
- Restriction of `det ∘ ρ` along `φ` is `det ∘ (ρ ∘ φ)`: both compute `det ρ(φ x)`, so a comap not
  compatible with `ofMatrix` would give a different law.
- Restriction to a subgroup `H ≤ G` along `A[H] → A[G]` computes `D` on `H`-elements, so a comap
  that did not use `MonoidAlgebra.mapDomainAlgHom` of the inclusion would not be restriction.

**Scalar extension of determinants.** For a commutative `A`-algebra `S` in the universe of `A`, as
for Mathlib's polynomial laws, and a `d`-dimensional determinant `D` on `R`, define `D ⊗_A S` as an
`S`-valued `d`-dimensional determinant on `S ⊗_A R`, with `(D ⊗ S)(1 ⊗ x) = D(x) ⊗ 1`; this is the
identification `M^d_A(R, S) ≅ M^d_S(R ⊗_A S, S)`. Prove `Determinant.eval_baseChange_tmul`
(`(D ⊗ S)(1 ⊗ x)` is the image of `D(x)`), `Determinant.charpoly_baseChange_tmul` (`χ` commutes
with base change) and `Determinant.trace_baseChange_tmul` (the trace of `D ⊗ S` on `1 ⊗ x` is the
image of `Tr(x)`) ([Chenevier](https://arxiv.org/pdf/0809.0415v2), Remark 1.4, p.9;
[Chenevier](https://arxiv.org/pdf/0809.0415v2), §1.5, p. 9). *Needs:* Determinants (Chenevier),
Mathlib `TensorProduct.AlgebraTensorModule.cancelBaseChange`.

**Checks.**

- Base change to `A` itself is `D`: `D ⊗ A = D` under `A ⊗_A R ≅ R`, so a construction not using
  the cancellation isomorphism would produce a different law.
- Base change of `det ∘ ρ` is `det ∘ (ρ ⊗ S)`, so a construction not commuting with `ofMatrix` would
  fail on the matrix case.
- Transitivity: `(D ⊗ S) ⊗ T = D ⊗ T` for `S → T`, so a construction depending on the intermediate
  algebra would give two different laws on `T ⊗_A R`.

**One-dimensional determinants are algebra homomorphisms.** With no hypothesis on `A`, prove that
the map `D ↦ D_A` is a bijection between `1`-dimensional `A`-valued determinants on `R` and
`A`-algebra homomorphisms `R → A`; for `R = A[G]`, these are the characters `G → A^×`
([Chenevier](https://arxiv.org/pdf/0809.0415v2), §1.5, p. 9). *Needs:* Determinants (Chenevier),
Mathlib `AlgHom`, Degree-one polynomial laws are linear.

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
cycle) and `cycleTerm` (`T^σ(x)`), and prove `Determinant.isPseudocharacter_trace` (the trace of a
determinant is a pseudocharacter) ([Chenevier](https://arxiv.org/pdf/0809.0415v2), §1.10, Lemma 1.12(iii) and
§1.26, pp. 12, 20). *Needs:* Mathlib `Equiv.Perm.sign`, `Equiv.Perm.SameCycle`,
`Function.minimalPeriod`, `LinearMap`.

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
faithful if `Ker(P) = 0`. Define `PolynomialLaw.ker` (the kernel as a submodule) and
`PolynomialLaw.IsFaithful` (`Ker(P) = 0`), and prove `PolynomialLaw.exists_factor_iff_le_ker`
(`P` factors through `M/K` iff `K ≤ Ker(P)`) ([Chenevier](https://arxiv.org/pdf/0809.0415v2), §1.17, p. 16).
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
([Chenevier](https://arxiv.org/pdf/0809.0415v2), Lemma 1.18(i), p. 16). *Needs:* The polynomial law of a linear map, Kernels are compatible with base change, Mathlib `Submodule.mkQ`.

**The induced law on M/Ker(P) is faithful.** Prove that if `P = P̃ ∘ π` with
`π : M → M/Ker(P)`, then `P̃` is faithful ([Chenevier](https://arxiv.org/pdf/0809.0415v2), Lemma 1.18(ii), p. 16).
*Needs:* Laws factor through their kernel.

### 0.4 Roby algebras and representability

**Homogeneous divided-power piece.** For an `A`-module `M` and `d ≥ 0`, define `Γ^d_A(M)` as the
`A`-submodule of Mathlib's `DividedPowerAlgebra A M` spanned by the products `∏_j γ_(n_j)(m_j)` with
`∑_j n_j = d`. It is a graded piece of the full commutative algebra, not an algebra under its
degree-adding multiplication. Define `DividedPower.degree` (the homogeneous submodule `Γ^d_A(M)`),
prove `DividedPower.gamma` (`γ_d(m)` belongs to `Γ^d_A(M)`) and define `DividedPower.degree_map`
(an `A`-linear `M → N` induces `Γ^d_A(M) → Γ^d_A(N)`, taking `γ_d(m)` to `γ_d(f(m))`)
([Chenevier](https://arxiv.org/pdf/0809.0415v2), §1.2, p.8). *Needs:* Mathlib `DividedPowerAlgebra`,
`DividedPowerAlgebra.dp`.

**Checks.**

- `Γ^0_A(M) ≅ A`, with `γ₀(m) = 1`: the degree-zero piece is spanned by the empty product, so a
  definition whose span omitted the unit would compute `0`.
- `Γ^1_A(M) ≅ M`, and `γ₁` corresponds to the identity: so a definition in which `γ₁` were not
  injective, or `Γ^1` had extra relations, would fail here.
- In the full `Γ_ℤ(ℤ)`, `γ₁(1)² = 2γ₂(1)`, and `γ₂(1)` is a basis of `Γ²_ℤ(ℤ)`: the divided-power
  grading cannot be replaced by an ordinary polynomial grading, which would make `γ₁(1)²` a basis
  and lose the element `γ₂(1)`.

**Direct-sum grading of divided powers.** For any commutative ring `A` and module `M`, prove that
the sum map `⊕_(d≥0) Γ^d_A(M) → Γ_A(M)` is an `A`-linear equivalence, that multiplication maps
degrees `a, b` to `a + b`, and that `γ_d(m)` has degree `d`. The proof gives the polynomial
generators their weight `n` and proves each Roby relation homogeneous; the quotient decomposition
must establish directness as well as generation (`DividedPower.grading`, `DividedPower.graded_mul`) ([Roby](https://www.numdam.org/item/ASENS_1963_3_80_3_213_0.pdf), III §§1–2, pp.248–250).
*Needs:* Homogeneous divided-power piece.

**Universal homogeneous polynomial law.** For every `d ≥ 0` and `A`-module `M`, construct the
homogeneous polynomial law `γ^univ_d : M → Γ^d_A(M)` whose value at `∑_j s_j ⊗ m_j` after scalar
extension is

```text
∑_(∑ n_j = d) (∏_j s_j^{n_j}) ⊗ ∏_j γ_(n_j)(m_j).
```

Define `DividedPower.universalLaw` (the homogeneous law with ground value `m ↦ γ_d(m)`), and prove
`DividedPower.universalLaw_ground` (the ground evaluation of `γ^univ_d` at `m` is `γ_d(m)`) and
`DividedPower.universalLaw_mixed` (the coefficient of `∏ T_j^{n_j}` in `γ^univ_d(∑ T_j m_j)` is
`∏ γ_(n_j)(m_j)`) ([Roby](https://www.numdam.org/item/ASENS_1963_3_80_3_213_0.pdf), Proposition IV.1 and Theorem IV.1, pp.265–267). *Needs:*
Direct-sum grading of divided powers, Homogeneous polynomial laws.

**Checks.**

- The degree-zero law is constant `1` in `Γ⁰ ≅ A`, the degenerate case; a construction whose empty
  sum gave `0` would fail.
- Under `Γ¹ ≅ M` it is Mathlib's identity polynomial law, so a construction not agreeing with
  `PolynomialLaw.id` in degree one would be wrong.
- The coefficient of `UV` in `γ²(Ux + Vy)` is `γ₁(x)γ₁(y)`, with no factor `2` inserted: a
  construction modelled on `(Ux + Vy)²/2` would produce a spurious `2`, or fail over `𝔽_2`.

**Roby representability.** For all `A`-modules `M, N` and `d ≥ 0`, prove that composition with
`γ^univ_d` is a natural `A`-linear equivalence between `Hom_A(Γ^d_A(M), N)` and the homogeneous
degree-`d` `A`-polynomial laws `M → N`; no flatness or projectivity of `M` is assumed
([Roby](https://www.numdam.org/item/ASENS_1963_3_80_3_213_0.pdf), Theorem IV.1 and proof, pp.266–267). *Needs:* Universal homogeneous polynomial law.

**Arbitrary base change of divided powers.** For any commutative `A`-algebra `B` and `A`-module `M`,
prove that the canonical map `B ⊗_A Γ^d_A(M) → Γ^d_B(B ⊗_A M)` is a `B`-linear equivalence for
every `d`, taking `1 ⊗ γ_d(m)` to `γ_d(1 ⊗ m)`; flatness of `B` is unnecessary
([Roby](https://www.numdam.org/item/ASENS_1963_3_80_3_213_0.pdf), Theorem III.3 and proof, pp.261–262). *Needs:* Roby representability.

**Tensor map for homogeneous divided powers.** For `A`-modules `M, N`, construct the natural
`A`-linear map `Γ^d_A(M) ⊗_A Γ^d_A(N) → Γ^d_A(M ⊗_A N)`, characterized by the polynomial law
`(m, n) ↦ γ_d(m ⊗ n)`, separately homogeneous of degree `d`. Its mixed coefficient formula is
required; no assertion that this map is an isomorphism is made. Define `DividedPower.tensorMap`
(the linear map `Γ^d(M) ⊗ Γ^d(N) → Γ^d(M ⊗ N)`), and prove `DividedPower.tensorMap_gamma`
(`γ_d(m) ⊗ γ_d(n)` maps to `γ_d(m ⊗ n)`) and `DividedPower.tensorMap_naturality` (it commutes with
`Γ^d(f) ⊗ Γ^d(g)` and `Γ^d(f ⊗ g)`) ([Chenevier](https://arxiv.org/pdf/0809.0415v2), §1.2 and the Roby algebra
structure, p.8; [Roby](https://www.numdam.org/item/ASENS_1963_3_80_3_213_0.pdf), IV §11, Proposition IV.9 and proof, pp.284–286). *Needs:*
Arbitrary base change of divided powers.

**Checks.**

- For `d = 1` the map is the identity on `M ⊗ N` under `Γ¹ ≅ identity`, so a construction with an
  extra scalar or a twist would fail in degree one.
- For `d = 0` it is `A ⊗_A A ≅ A`, the degenerate case; a construction that was not the canonical
  multiplication in degree zero would fail.
- For `d = 2` and `M = N = ℤ`, the basis element `γ₂(1) ⊗ γ₂(1)` maps to `γ₂(1 ⊗ 1)` with
  coefficient `1`: a construction modelled on symmetric tensors `(m^{⊗2}) ⊗ (n^{⊗2}) ↦ (m ⊗ n)^{⊗2}`
  with a divided-power normalisation would insert a factor `2` or `1/2` here.

**Roby algebra of multiplicative laws.** For an associative unital `A`-algebra `R`, equip
`Γ^d_A(R)` with the internal multiplication `Γ^d(R) ⊗ Γ^d(R) → Γ^d(R ⊗ R) → Γ^d(R)`, induced by the
multiplication of `R`, and unit `γ_d(1)`. Prove that algebra maps `Γ^d_A(R) → S` are naturally
equivalent to multiplicative homogeneous degree-`d` polynomial laws `R → S`. The addition and scalar action are those of the homogeneous submodule in Mathlib’s
divided-power algebra; the unit is `gamma d 1` and the scalar map sends `a` to `a • gamma d 1`. This internal algebra
can be noncommutative and is distinct from the graded multiplication on `Γ_A(R)`. Define
`DividedPower.internalAlgebra` (the degree-`d` representing module with its internal associative
`A`-algebra structure), prove `DividedPower.internal_mul_gamma` (`γ_d(x) ⋆ γ_d(y) = γ_d(xy)`, with
unit `γ_d(1)`) and construct `DividedPower.multiplicativeLawEquiv` (algebra maps from this internal
algebra are the multiplicative degree-`d` laws) ([Chenevier](https://arxiv.org/pdf/0809.0415v2), §1.2 and footnote
13, p.8). *Needs:* Tensor map for homogeneous divided powers, Multiplicative polynomial laws.

**Checks.**

- `Γ¹_A(R)` with its internal multiplication is `R` as an `A`-algebra, so an internal product not
  reducing to the multiplication of `R` in degree one would fail.
- For `R = ℤ`, `d = 2`: `γ₂(1) ⋆ γ₂(1) = γ₂(1)`, while the full graded product `γ₂(1)γ₂(1) = 6γ₄(1)`
  is a different operation; a definition that used the graded product of `Γ_A(R)` would compute
  `6γ₄(1)` and leave degree `2`.
- For `R = A` the universal multiplicative law is `a ↦ a^d` and its representing algebra is `A`, so
  a representing algebra larger than `A` in this case would mean spurious generators.

For `multiplicativeLawEquiv`, the three ground-value Checks for `R=S=A` are degree zero
`a↦1`, degree one `a↦a`, and degree two `a↦a²`, for every algebra map from the corresponding
internal algebra. `multiplicativeLawEquiv_ground` specifies evaluation on `gamma`; `internal_mul`
specifies the complete internal product via `tensorMap` and `LinearMap.mul'`.

**Determinant coordinate ring.** For `d ≥ 0` and any `A`-algebra `R`, define
`Z_A(R, d) = Γ^d_A(R)^ab`, the quotient by the two-sided ideal generated by all commutators for the
internal multiplication. Prove that its universal law represents determinants with commutative
coefficient algebras: `Hom_{A-alg}(Z_A(R, d), B) ≅ Det_d(B ⊗_A R, B)`. Define
`Determinant.coordinateRing` (the abelianized internal degree-`d` divided-power algebra) and
`Determinant.universal` (the universal determinant on `Z_A(R, d) ⊗_A R`), and prove
`Determinant.coordinateRingEquiv` (its `A`-algebra maps to `B` correspond naturally to `B`-valued
determinants) and `Determinant.coordinateRing_baseChange` (`B ⊗_A Z_A(R, d) ≅ Z_B(B ⊗_A R, d)`)
([Chenevier](https://arxiv.org/pdf/0809.0415v2), Proposition 1.6 and Example 1.7(iv), pp.9–10). *Needs:* Roby algebra of multiplicative laws, Determinants (Chenevier).

**Checks.**

- `Z_A(R, 1) = R^ab`: in degree one the internal algebra is `R` and the abelianization is the
  ordinary one, so a coordinate ring that did not reduce to `R^ab` would be wrong.
- `Z_A(A, d) ≅ A` with universal law `a ↦ a^d`, so a coordinate ring with extra generators in this
  case would be wrong.
- `Z_A(A[t], d) ≅ A[e₁, …, e_d]`, and the universal characteristic polynomial of `t` is
  `X^d − e₁X^(d−1) + … + (−1)^d e_d`: a construction that identified fewer or more free
  coefficients, or signed them differently, would fail this computation.

**Free divided powers and symmetric tensors.** For any free `A`-module `M`, prove that
`Γ^d_A(M) → (M^(⊗d))^(S_d)`, `γ_d(m) ↦ m^(⊗d)`, is an `A`-linear equivalence. `DividedPower.symmetricTensor_equiv`
states the module comparison, with permutation-fixed tensors as the intersection of the
kernels of `reindex σ − id` ([Roby](https://www.numdam.org/item/ASENS_1963_3_80_3_213_0.pdf),
Theorem IV.2 and Proposition IV.5, p.272). *Needs:* Roby algebra of multiplicative laws.

**Vaccarino universal determinant theorem.** For any set `X`, prove that the determinant of the
generic `d × d` matrices induces an isomorphism `Γ^d_ℤ(ℤ{X})^ab ≅ E_X(d)`, where `E_X(d)` is the
subring of `ℤ[x_(a,i,j)]` generated by all characteristic-polynomial coefficients of words in the
generic matrices; in particular the determinant coordinate ring is torsion-free. The proof
establishes the integral generic-matrix invariant presentation, including its generator and
relation theorem and the identification with the divided-power abelianization.
`Theorems.vaccarino_universal_matrices_eval` identifies the comparison on
divided-power classes with determinants of the generic evaluation. Characteristic-zero
invariant generation does not supply the integral relations ([Chenevier](https://arxiv.org/pdf/0809.0415v2),
Theorem 1.15, pp.14–15; [Emerson–Morel](https://arxiv.org/pdf/2310.03869v2), Theorem 1.12, p.5). *Needs:* Determinant coordinate ring, Free divided powers and symmetric tensors.

### 0.5 Characteristic coefficients and trace comparisons

**Coefficient reconstruction from group words.** For a monoid `G`, a commutative ring `A`
and two determinants `D,E : A[G] → A` of the same degree, prove
`Determinant.eq_of_charpoly_eq`: if their characteristic polynomials agree at every `g ∈ G`,
then their entire polynomial laws agree, including mixed coefficients after scalar extension.
The proof uses Amitsur's expansion of characteristic coefficients of a sum in terms of
characteristic coefficients of words. No invertibility of a factorial is required
([Chenevier](https://arxiv.org/pdf/0809.0415v2), Lemma 1.12(ii), equations (1.4)–(1.5), and
Corollary 1.14, pp.12–15). *Needs:* Characteristic polynomial and trace of a determinant.

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

**A determinant is determined by its trace when d! is invertible.** Prove `Determinant.injective_trace`. If `d! ∈ A^×`, prove that
`D ↦ Tr` is injective on `d`-dimensional `A`-valued determinants on `R`. Without the invertibility
of `d!` the statement fails ([Chenevier](https://arxiv.org/pdf/0809.0415v2), Proposition 1.27 and its proof,
p. 20). *Needs:* Integral Newton identities.

**Over ℚ-algebras determinants are pseudocharacters.** Prove `Determinant.exists_unique_trace_eq`. If `A` is a `ℚ`-algebra, prove that
`D ↦ Tr` is a bijection between `d`-dimensional `A`-valued determinants on `R` and `d`-dimensional
`A`-valued pseudocharacters on `R`. The inverse is the Newton polynomial in the traces of powers.
To prove multiplicativity, construct a faithful coefficient extension on which a rational
pseudocharacter is a matrix trace (Procesi representation theorem), then descend the matrix
determinant identity; Newton coefficients alone give homogeneity but do not prove multiplicativity
([Chenevier](https://arxiv.org/pdf/0809.0415v2), Proposition 1.27 and its proof, p. 20). *Needs:*
A determinant is determined by its trace when d! is invertible,
Pseudocharacters.

**Determinants and pseudocharacters when (2d)! is invertible.** Prove `Determinant.exists_unique_trace_eq_of_isUnit`. If `(2d)! ∈ A^×`, or `d = 2` and
`2 ∈ A^×`, prove that `D ↦ Tr` is a bijection between `d`-dimensional `A`-valued determinants and
`d`-dimensional `A`-valued pseudocharacters on `R`. Establish the integral antisymmetrizer argument
in the symmetric-group algebra over `ℤ[1/(2d)!]`, with its splitness and torsion-free quotient, to
transfer the rational identity; for degree two use the corresponding `S₄` idempotent calculation
over `ℤ[1/2]` ([Chenevier](https://arxiv.org/pdf/0809.0415v2), Proposition 1.29 and proof, pp.20–22). *Needs:*
A determinant is determined by its trace when d! is invertible,
Pseudocharacters, Two-dimensional determinants on a group.

**The kernel of a determinant.** For a `d`-dimensional determinant `D` on `R`, prove that
`r ∈ Ker(D)` iff `D_S(1 + r r′) = 1` for every commutative `A`-algebra `S` and `r′ ∈ S ⊗ R`, iff
`D_S(1 + r′ r) = 1` for all such `S`, `r′` ([Chenevier](https://arxiv.org/pdf/0809.0415v2), Lemma 1.19(i),
p. 17). *Needs:* The kernel of a polynomial law, D(1 + rr′) = D(1 + r′r).

**The kernel of a determinant is a two-sided ideal.** For a `d`-dimensional determinant `D`, prove
that `Ker(D)` is a two-sided ideal of `R`, proper if `d > 0` and `R ≠ 0`, and that it is the largest
two-sided ideal `K` such that `D` factors through a determinant of `R/K`. Define
`Determinant.kerTwoSided` as `Ker(D)` as a two-sided ideal; prove `Determinant.mem_kerTwoSided`
(membership agrees with the submodule kernel) and `Determinant.kerTwoSided_ne_top` (proper for
`d > 0` and `R` nontrivial) ([Chenevier](https://arxiv.org/pdf/0809.0415v2), Lemma 1.19(ii), p. 17). *Needs:*
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
`(ι →₀ A) ⊗ R ≅ ι →₀ R`, since `R` may be noncommutative. Define `Determinant.charpolyLaw` as the
law `χ` and `Determinant.chiCoeff` as the coefficients `χ_α`; prove
`Determinant.isHomogeneousOfDegree_charpolyLaw` (`χ` is homogeneous of degree `d`)
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
`D` on `A[G]` is continuous if every coefficient map `g ↦ Λ_i(g)`, `i ≤ d`, is continuous.
When `A` is a topological ring, Amitsur's formula makes this equivalent to Chenevier's definition by continuity of the maps
`D^{[α]} : G^d → A`. Define `Determinant.IsContinuous` as continuity of every `Λ_i`; prove
`Determinant.eq_of_eqOn_dense` (determined on a dense subgroup) and
`Determinant.isContinuous_iff_exists_openNormal` (for profinite `G` and discrete `A`, the kernel is
open) ([Chenevier](https://arxiv.org/pdf/0809.0415v2), §2.30, p. 37). *Needs:*
Amitsur's formula for determinants, Mathlib `Continuous`, `MonoidAlgebra.of`.

**Checks.**

- Compactness cannot be discarded when concluding finite image: discrete `ℤ` is noncompact,
  and the continuous character `n ↦ 2ⁿ` into discrete `ℚˣ` has infinite image since `2^n ≠ 1`
  for every positive integer `n`.

- On a discrete group every determinant is continuous: each `Λ_i` is a function on a discrete
  space, so a definition that demanded more than continuity of the coefficients would reject some
  of these.
- `det ∘ ρ` is continuous for continuous `ρ`: its coefficients are the polynomial functions
  `Λ_i(ρ(g))` of the matrix entries, so a definition under which the matrix determinant of a
  continuous representation failed would be wrong.
- Over a topological ring, a determinant of dimension one coming from a discontinuous
  character is not continuous, the non-example: the constant coefficient of `χ(g,t) = t − D(g)`
  is `−D(g)`, so a definition that only tested `Λ_0 = 1` would accept it. The topological-ring
  hypothesis is needed: on `ℤ` with the upper-set topology (negation is not continuous) and
  `ℤ/2` with only the nonidentity point open, the sign character is discontinuous but its
  negative is continuous, so that one-dimensional determinant is continuous
  (`continuous_not_without_ring_topology`).

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
with the determinant of the dual representation. Define `Determinant.dual` as `D∨`, the determinant
pulled back by group-algebra inversion; prove `Determinant.dual_involutive` (`(D∨)∨ = D`),
`Determinant.dual_charpoly` (for `g ∈ G`, `P_D∨,g(X) = X^d P_D,g(X⁻¹)/P_D,g(0)`) and
`Determinant.dual_ofRepresentation` (taking the determinant of the transpose-inverse matrix representation gives `D∨`) ([Quast](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf), §3.4, p.17; Chenevier §1.5, p.9). *Needs:*
The determinant of a matrix representation. The identity
`Determinant.dual_charpoly_of`, `D.dual.charpoly (of g) = D.charpoly (of g⁻¹)`, pins inversion
on every group element; `Theorems.reciprocal_charpoly` follows from it and
`Determinant.dual_charpoly`.

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
free-module determinant is available. Define `Determinant.ofFiniteProjective` as the determinant
law of `ρ` on a finite projective constant-rank module; prove
`Determinant.ofFiniteProjective_exterior` (the induced top exterior-power endomorphism is scalar
multiplication by `D_ρ(r)`), `Determinant.ofFiniteProjective_basis` (for a finite basis, this law
equals `det` of the corresponding matrix representation) and
`Determinant.ofFiniteProjective_baseChange` (scalar extension of `V` and `ρ` commutes with `D_ρ`)
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
`Determinant.ofAzumaya` as the degree-`d` reduced-norm determinant; prove
`Determinant.ofAzumaya_split` (under a matrix splitting it becomes `Matrix.det`) and
`Determinant.ofAzumaya_unique` (every degree-`d` determinant on `R` equals the reduced norm)
([Chenevier](https://arxiv.org/pdf/0809.0415v2), Example 1.7(ii), p.10 and Example 2.5, p.24;
[Grothendieck](http://www.numdam.org/item/SB_1964-1966__9__199_0.pdf), Théorème 5.1 and §5, pp.208–211, for the étale-local matrix
splitting and the reduced norm). *Needs:* SchemeAndStackFoundations §2.22 `IsAzumaya.exists_etale_matrix_splitting`,
Determinant coordinate ring,
The determinant of a matrix representation.

The supplier `IsAzumaya.exists_etale_matrix_splitting` from SchemeAndStackFoundations §2.22
states the splitting used here: for
`IsAzumaya A R`, positive `d`, and constant rank `d²`, there is a faithfully flat étale
commutative `A`-algebra `B` with `B⊗R ≃ M_d(B)` (Grothendieck, *Le groupe de Brauer I*,
Theorem 5.1(ii)–(iii), p.210). The same supplier takes the product of finitely many jointly
surjective affine étale splitting charts and proves faithful flatness and splitting over that product.
Its Checks, mirrored by named Lean examples, are the split matrix algebra
(`exists_etale_matrix_splitting_matrix`), `ℂ⊗_ℝ ℍ ≃ M₂(ℂ)`
with `Algebra.Etale ℝ ℂ` and `Module.FaithfullyFlat ℝ ℂ`
(`exists_etale_matrix_splitting_quaternion_complex`), and the absence of an
`ℝ`-algebra isomorphism `ℍ ≃ M₂(ℝ)` (`exists_etale_matrix_splitting_quaternion_real`).

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
reciprocal computations this tests `Determinant.dual`. For `Determinant.twist`, the trivial
character leaves the law fixed, evaluation at `g` is multiplied by `θ(g)^d`, and the rank-one
law of `χ` becomes the rank-one law of `θχ`. These are Lean examples; the last two distinguish
character inversion and the degree exponent. The definition and locators are those in §0.6.

### 0.7 Connected reductive invariant evaluations

**Invariant coordinate algebras under conjugation.** `InvariantCoordinateInput O` is
Mathlib's `CommHopfAlgCat O`. Its multiplication, unit, coproduct, counit and antipode obey the
bialgebra compatibility, coassociativity, both counit identities and both antipode identities of
`HopfAlgebra`. The represented points and their naturality in coefficient algebras are supplied
by `TauCeti.HopfAlgebra.points` and its points functor. For a commutative Hopf algebra `C`,
`InvariantCoordinateInput.tensorCoordinates C n` is the left-associated tensor power, starting at
`O`. `tensorEvaluate` is its algebra map determined by evaluation on each factor.
`InvariantCoordinateInput.ring C n` is the subalgebra of functions unchanged by simultaneous
conjugation over **every** commutative `O`-algebra `S`. Thus it is the scheme-invariant algebra,
including at nonreduced points. `reindex` and `multiply` are the coordinate pullbacks specified by
`reindex_evaluate` and `multiply_evaluate`. This construction takes invariants under the whole
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
Hopf `A`-algebra flat over `A`, and `M` an `H`-comodule. `RationalCohomology.term A H M n` is
`M ⊗ H^⊗n`, associated to the left. `coface` inserts the coefficient coaction at the beginning,
the coproduct at each interior position, and the unit at the end. `differential` is their
alternating sum, and `complex` is the resulting cochain complex. Define
`RationalCohomology.cohomology A H M n` as its homology. For flat `H` this computes derived
scheme invariants (Jantzen I.4.2, I.4.14–4.16, pp.50, 55–56).
`cohomology_zero` identifies degree zero with `ker(ρ − (m ↦ m ⊗ 1))`;
`regular_acyclic` and `regular_cohomology_zero` compute the regular comodule `H` by its counit
contraction (Jantzen I.4.15). Cofree comodules need not be injective unless the underlying
module is injective. *Needs:* Tau Ceti `Comodule`, Mathlib `CochainComplex` and module homology.

`RationalCohomology.complexMap` acts by the coefficient comodule morphism on the first
tensor factor; `termMap` specifies this in every degree through `complexMap_f`.
Its degree-zero, one-Hopf-factor and two-Hopf-factor Checks send `m`, `m⊗h` and
`(m⊗h)⊗k` to `f(m)`, `f(m)⊗h` and `(f(m)⊗h)⊗k`.
`complexMap_zero`, `map_id` and `map_comp` identify its degree-zero map
and its functoriality. `map` is the induced Mathlib homology map. For equivariant maps
`M → N → P` which are injective, exact and surjective, respectively, construct `connecting`.
`connecting_exact` states exactness at `H^i(P)` and `H^(i+1)(M)`
(Jantzen I.4.2, I.4.16, pp.50, 55–56). `invariantProduct` is the cochain product
`H^i(M) × H⁰(N) → H^i(M⊗N)`. `connecting_invariantProduct` says a right invariant
factor commutes with the boundary, with sign `+`; its tensor factor is flat so the
tensored coefficient sequence stays exact. The diagonal specializations used here are
specified in §6.4, following DKSW Lemma 4.12 and the proof of Corollary 4.13, pp.24–25.

**Checks.**

- Over `ℚ`, with trivial Hopf algebra and coefficient module `ℚ²`, the terms in
  degrees `0,1,2` each have rank two (`rational_term_zero_rank`,
  `rational_term_one_rank`, `rational_term_two_rank`).
  The three coface values are `δ₀⁰(m)=ρ(m)`, `δ₁⁰(m)=m⊗1`, and
  `δ₁¹(m⊗h)=assoc⁻¹(m⊗Δh)`.
- The computed two-term differential is `d⁰(m)=ρ(m)−m⊗1`; the next is
  `d¹(m⊗h)=ρ(m)⊗h−assoc⁻¹(m⊗Δh)+(m⊗h)⊗1`. Their composite is zero.
  For the trivial group over `ℤ`, the complex sends `3` to zero in degree zero,
  `3⊗1` to `(3⊗1)⊗1` in degree one, and `(3⊗1)⊗1` to zero in degree two
  (`rational_complex_zero`, `rational_complex_one`, `rational_complex_two`).
- For the regular comodule, `H⁰(H,H)=A`, `H¹(H,H)=0`, and `H²(H,H)=0`.
  For the trivial group over `ℤ`, the module `ℤ` is nevertheless not injective:
  no `ℤ`-linear map has `f(2)=1`.

**Algebraic induction.** For flat commutative Hopf `A`-algebras `H,K`, a bialgebra map
`f:H→K`, and a right `K`-comodule `M`, `AlgebraicInduction.module f` is the cotensor equalizer
inside `M⊗H` of `ρ_M⊗1` and `(1⊗f⊗1)(1⊗Δ_H)`, with the displayed associator.
`moduleComodule` restricts `1⊗Δ_H`, as specified by `coact_inclusion`.
`reciprocity` is Frobenius reciprocity against restriction along `f`;
`reciprocity_apply` evaluates at the identity using the counit. The cotensor convention is
`F(hg)=hF(g)` with right translation on `F`; inversion gives Jantzen's
`f(gh)=h⁻¹f(g)` with left translation (Jantzen I.3.3–3.7, pp.37–41).
*Needs:* Tau Ceti `Comodule.Corestrict`, the Hopf counit and tensor equalizers.

**Checks.**

- Induction along the identity is `M`. Membership in `module f` is exactly equality of the
  two displayed coactions; zero belongs to that equalizer.
- `reciprocity` is bijective and sends the zero map to zero. For the identity subgroup,
  the value of the forward map at `x` is `(id⊗ε)(q(x))`.
- Over the trivial group scheme over `ℤ`, the cofree module `ℤ` is acyclic but is not
  injective, as witnessed by the absence of a linear map taking `2` to `1`.

**Compatible invariant-coordinate evaluation.** For the invariant coordinate algebras
`Cₙ = O[Hⁿ]^H`, the group `H(A)`, and a commutative `O`-algebra `A`, a compatible evaluation is a
family `Eₙ : Cₙ → Map(H(A)ⁿ, A)` of `O`-algebra maps satisfying `Eₘ(C(ζ)f)(h) = Eₙ(f)(h ∘ ζ)` for
every coordinate reindexing `ζ`, and `Eₙ₊₂(C(mul)f)(h) = Eₙ₊₁(f)(mergeLast(h))`. Evaluation at the
actual scheme points has these equations; the coordinate carrier is the family `C_n` of
Invariant coordinate algebras under conjugation and evaluation is at its scheme
points. Define `InvariantEvaluation` by a group homomorphism into the actual Hopf-algebra
points, and `InvariantEvaluation.evaluate` by restriction of tensor evaluation and `InvariantEvaluation.IsRegularMatrixInvariant` as the predicate that,
over algebraically closed `k`, each evaluated `GL_d` invariant is a polynomial in entries and inverse
determinants, invariant under simultaneous conjugation; prove `InvariantCoordinateInput.reindex_evaluate`
(evaluating a coordinate pullback is evaluating on the reindexed tuple) and
`InvariantCoordinateInput.multiply_evaluate` (evaluating the final-product pullback is evaluating on the tuple
with its last two entries multiplied) ([Quast](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf), Definition 3.1 and the representation
evaluation immediately following it, pp.11–12; [BHKT](https://arxiv.org/pdf/1609.03491), Definition 4.1 and Lemma 4.3,
pp.13–14). *Needs:* Invariant coordinate algebras under conjugation, Mathlib
`MvPolynomial`.

**Checks.**

- Reindexing uses precomposition. For the three-cycle `σ=(0 1 2)`, the tuple `(2,3,5)`
  becomes `(3,5,2)`, whereas precomposition with `σ⁻¹` gives `(5,2,3)`
  (`three_cycle`). A transposition alone cannot distinguish these conventions.
- The final product is ordered. Over `ℚ`, take `x=diag(2,1)`,
  `g=[[1,1],[0,1]]`, `h=[[1,0],[1,1]]`. For the two-coordinate invariant
  `f(x,y)=tr(xy)`, `f(x,gh)=5` and `f(x,hg)=4` (`ordered_products`).
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
algebra homomorphisms is insufficient. Define `ReductivePseudocharacter` as the family `Θ_m` with
reindexing and multiplication equations and `ReductivePseudocharacter.ofRepresentation` as the
pseudocharacter of `ρ : Γ → H(A)` with compatible evaluation `E`, `Θρ,ₙ(f)(γ) = Eₙ(f)(ρ ∘ γ)`,
whose axioms follow from the equations and the homomorphism law; prove
`ReductivePseudocharacter.ext` (pointwise equality of every `Θ_m`),
`ReductivePseudocharacter.map` (coefficient maps postcompose) and
`ReductivePseudocharacter.restrict` (group maps precompose) and `ReductivePseudocharacter.ofRepresentation_theta`
(`Θρ,ₙ(f)(γ) = Eₙ(f)(ρ ∘ γ)`) ([Quast](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf), Definition 3.1, pp.10–11). *Needs:*
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
Define `ReductivePseudocharacter.IsContinuous` as continuity of every evaluation on invariant
coordinates; prove `ReductivePseudocharacter.continuous_ofRepresentation` (a continuous `ρ` induces
a continuous pseudocharacter when `E` is compatible and every invariant evaluation `Eₙ(f)` is
continuous) and `ReductivePseudocharacter.continuous_dense_ext` (for Hausdorff `A`, continuous
pseudocharacters agreeing on a dense subgroup are equal) ([Quast](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf), Definition 3.1 and
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
it is a normal subgroup. For the actual point representation, `ker ρ ⊆ ker Θ_ρ`. With an
additional map `E.point`, the inclusion concerns the composite `E.point ∘ ρ`; an arbitrary
`E.point` need not be faithful. Define `ReductivePseudocharacter.kernel` as the normal subgroup defined
by all invariant evaluations; prove `ReductivePseudocharacter.kernel_mem` (membership is
invariance under right multiplication in any coordinate) and `ReductivePseudocharacter.quotient`
(for normal `Δ ⊆ ker Θ` there is a unique descended pseudocharacter on `Γ/Δ`)
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

The named comparison is `ReductivePseudocharacter.glEquiv d hd` for positive `d` and
`C=TauCeti.GeneralLinear.coordinateHopfAlgebra A d`; `glEquiv_coeff` fixes its normalization
against `glCoefficient d i`, the actual coefficient of the generic matrix polynomial.

**Checks.**

- `glCoefficient 1 1=1`, `glCoefficient 2 2=1`, and `glCoefficient 2 3=0`.
- In dimension one the determinant value is minus evaluation of `glCoefficient 1 0`.
- In dimension two the trace is minus evaluation of `glCoefficient 2 1` and the determinant
  is evaluation of `glCoefficient 2 0`. These give `X−a` and `X²−tX+d`, including in
  characteristic two, without a factorial-invertibility hypothesis.

**Checks for coefficient and cycle interfaces.** These specialize the definitions in
Chenevier §§1.5, 1.9, 1.17–1.19 and the divided-power functor of §1.3.

| Interface | Computed Checks mirrored in Lean |
|---|---|
| `PolynomialLaw.IsHomogeneousOfDegree` | The identity has degree one; the zero law has every degree; the identity over `ℤ` does not have degree two (evaluate at `2`). |
| `Determinant.traceLinear` | The degree-one identity sends `a` to `a`; the trace of `[[2,3],[4,5]]` is `7`; every degree-zero trace is zero. |
| `Determinant.dimOneEquiv` | The inverse at `f` evaluates to `f(r)`; the identity over `ℤ` takes `2` to `2`; the identity over `𝔽₂` has polynomial `X−1` at `1`. `dimOneEquiv_apply` fixes this evaluation for every input. |
| `cycleProduct` | The identity permutation returns the chosen entry; the transposition starting at `0` gives `x₀x₁`; starting at `1` gives `x₁x₀`. |
| `cycleTerm` | The empty tuple gives `1`; the identity on two entries gives `T(x₀)T(x₁)`; the transposition gives `T(x₀x₁)`, with one cycle factor. |
| `dimTwoEquiv` | The unit-valued character takes `1` to `1`; its trace takes `1` to `2`; its trace at `g` is the determinant trace. `dimTwoEquiv_det` and `dimTwoEquiv_trace` fix both components on all group elements. |
| `Determinant.kerTwoSided` | A degree-zero law has full kernel; the determinant on a matrix algebra has zero kernel; on upper triangular matrices its kernel consists of the strictly upper triangular matrices. |
| `Determinant.chiCoeff` | Matrix determinants have zero coefficients of the CH law; evaluation at `0` on `ℤ[X]` gives coefficient `X` in multidegree one of the input `tX`, and zero in multidegree two. |
| `Determinant.coefficientSubring` | Over `ℤ` it is all of `ℤ`; every group characteristic coefficient belongs to it; a degree-zero law generates just the prime subring. |
| `DividedPower.degree_map` | The identity induces the identity; the zero map preserves `γ₀(m)=1`; in degree one it sends `γ₁(m)` to zero. |

**Checks for restriction.** `ReductivePseudocharacter.restrict_theta` specifies
precomposition on every tuple. Restriction by the identity fixes `Θ`; restriction by the
trivial homomorphism evaluates every coordinate at the group identity; two successive
restrictions equal restriction by the composite in the same order. All three are Lean
examples of `ReductivePseudocharacter.restrict`, with the group and coefficient ring unchanged.
The source is Quast, Definition 3.1, pp.10–11.

**Canonical universal maps.** `Determinant.coordinateQuotient` is surjective, with kernel
exactly the two-sided ideal generated by internal commutators (`coordinateQuotient_surjective`,
`coordinateQuotient_ker`). This specifies the abelianization, including its quotient map.
`coordinateRingEquiv_toFun` specifies the representing equivalence on every scalar-extended
input: contract the law corresponding to `φ ∘ coordinateQuotient` along the coefficient map.
`universal_eq` uses `φ=id`; `coordinateRingEquiv_natural` fixes coefficient change;
`coordinateRing_baseChange_eval` specifies the base-change isomorphism on the image of every
homogeneous divided-power element. These are the maps of Chenevier, Proposition 1.6 and
Example 1.7(iv), pp.9–10.
`DividedPower.degree_baseChange_monomial` fixes scalar extension on the spanning mixed
monomials; `multiplicativeLawEquiv_law` identifies the full represented law with
composition through `universalLaw`; `universalLaw_baseChange` specifies the entire universal law. The full tensor map is
specified by `tensorMap_mixed`: sum over nonnegative matrices with the prescribed row and
column sums, with coefficient one for each divided-power monomial (Roby, Theorem III.3,
pp.261–262, and Proposition IV.9, pp.284–286). `degree_map_val` is restriction of
Mathlib's `DividedPowerAlgebra.map` to the homogeneous piece.

`Determinant.charpolyLaw_toFun` fixes evaluation of the characteristic polynomial at its
argument after every scalar extension. `Determinant.newton` states the integral Newton
relation above, and `PolynomialLaw.ker_translation_tower` expresses kernel translations after
an additional coefficient extension. `exists_restrict_coefficients` includes uniqueness.

`Determinant.comap_toLaw`, `mul_toFun`, `baseChange_toFun` and `ofMatrix_toFun`
specify restriction, products, scalar extension and matrix determinants on the entire
polynomial law. For the matrix formula, the extended representation is required to agree
with the original on every pure tensor; its linearity then fixes it on all inputs.
These are the scalar-extension constructions in Chenevier, §§1.1–1.5.

**Universal compatible evaluations.** For a group `Γ` and the Hopf input `C`,
`ReductivePseudocharacter.universalRing Γ C` represents the compatible evaluations defined
here. `universalRing_equiv_natural` identifies coefficient postcomposition;
`universalRing_generated` says that evaluations of its universal pseudocharacter generate
this algebra. This is the generators-and-relations construction in Quast, Theorem 3.20,
p.20; it uses the whole-group invariant algebras here, with connected reductive groups as
an application. `map_theta` and `quotient_theta` fix coefficient change and quotient descent
on every tuple. The latter, together with extensionality and surjectivity of `Γ→Γ/Δ`,
uniquely specifies descent for a normal `Δ` contained in the evaluation kernel.

**Checks for the canonical maps and conventions.** Each label below identifies a Lean
`example` in `LayerZeroChecks`.

| Definitions or convention | Computed Checks and example labels |
|---|---|
| `Determinant`, `eval`, `ofMatrix`, `charpoly`, `trace`, `traceLinear`, `charpolyLaw`, `chIdeal`, `IsCayleyHamilton` | On the scalar algebra `ℤ`, the empty representation at zero has determinant and characteristic polynomial `1`, trace `0`, and CH ideal the unit ideal (`matrix_empty`). Rank one at `−3` gives `−3`, `X+3`, trace `−3`, and zero CH ideal (`matrix_one`). On `M₂(ℤ)`, `[[2,3],[4,5]]` gives `−2`, `X²−7X−2`, trace `7`, and zero CH law (`matrix_two`). |
| `PolynomialLaw.ofLinearMap` | Identity, zero (`ofLinearMap_id`, `ofLinearMap_zero`), and multiplication by two evaluated at three gives six (`linear_double`). |
| `Determinant.mul` | Two identity characters at three give value `9`, polynomial `X²−6X+9`, trace `6` (`product_two`); the two projections at `(0,3)` give `0`, `X²−3X`, `3` (`product_zero`); degree zero is the unit (`mul_dim_zero`). |
| `Determinant.comap` | Identity (`comap_id`); evaluation at two takes `X` to `2` (`restriction_eval_two`); evaluation at zero kills `X` and preserves `1` (`restriction_eval_zero`). |
| `Determinant.baseChange` | Reduction sends `2` to `0` (`base_change_mod_two`); rational extension retains determinant `−2` (`base_change_rational`); rank zero remains `1` at zero (`base_change_empty`). |
| `DividedPower.degree` | The degree-zero piece is `A` (`divided_power_degree_zero`); degree one is the input module (`divided_power_degree_one`); the quadratic piece on `ℚ²` has dimension three (`degree_two_rank`). |
| `DividedPower.gamma` | `γ₀(0)=1`, `γ₁(2)=2γ₁(1)`, `γ₂(2)=4γ₂(1)` (`gamma_zero`, `gamma_one`, `gamma_two`). |
| `DividedPower.degree_baseChange` | Modulo two the degree-zero generator remains `1`, the degree-one generator is nonzero, and `γ₂(2)` vanishes (`degree_base_zero`, `degree_base_one`, `degree_base_two`). This includes nonflat base change. |
| `coordinateQuotient`, `universal`, `coordinateRingEquiv` | For `A=R=ℤ`, their degree-zero, degree-one and degree-two values are respectively `1` at zero, `3` at three and `9` at three; specialization to `ℚ` has the same values (`coordinate_zero`, `coordinate_one`, `coordinate_two`). |
| `coordinateRing_baseChange` | Reduction modulo two preserves the degree-zero class as `1` and kills the degree-one class of `2`; rational extension sends the degree-two class of `3` to `9` (`coordinate_base_zero`, `coordinate_base_one`, `coordinate_base_two`). |
| `InvariantEvaluation`, `evaluate` | Identity tuples use the counit on both factors (`evaluation_identity`); arity zero over `ℚ` gives scalar `3` (`evaluation_scalar`); scalar `2` vanishes over `𝔽₂` at a two-term tuple (`evaluation_reduce_two`). |
| `IsRegularMatrixInvariant` | Constant identity points are regular (`regular_trivial`); actual `GL_d` points are regular (`regular_standard`); complex conjugation on `GL₁(ℂ)` is not a Laurent polynomial and fails regularity (`regular_conjugation_not`). The matrix-coordinate hypotheses specify the entire point map. |
| `ReductivePseudocharacter.map` | Identity fixes the family (`map_identity`); reduction takes an integral value `2` to zero (`map_reduction`); rational extension retains a value `−3` (`map_extension`). |
| `ReductivePseudocharacter.quotient` | The bottom subgroup retains values (`quotient_bottom`); the trivial point representation descends through the whole group (`quotient_trivial`); a coordinate separating `gδ` from `g` prevents descent by a subgroup containing `δ` (`quotient_obstruction`). |
| `dimTwoEquiv` | At identity the pair is `(1,2)`; at `diag(2,3)` it is `(6,5)` (`dimension_two_diagonal`); at the swap matrix it is `(−1,0)` (`dimension_two_swap`). These fix which component is the determinant. |
| `coefficientSubring` | Integral coefficients generate `ℤ`; degree zero generates the prime subring; the rank-one character `n↦(1/2)^n` on the multiplicative copy of `ℕ` generates `ℤ[1/2]`, containing `1/2` and excluding `1/3` (`coefficient_dyadic`). |
| `ReductivePseudocharacter.universalRing`, `universalRing_equiv` | For `GL₁`, the homomorphism representing a point character takes the universal coordinate at a group element to `2`, to `−3`, and at the identity over `𝔽₂` to `1` (`universal_torus_two`, `universal_torus_negative`, `universal_torus_identity`). The values are images of the universal coordinate under the representing homomorphism. |
| `InvariantCoordinateInput.tensorCoordinates` | Arity zero over `ℚ` has dimension one (`coordinates_rank_zero`); the torus variable is not idempotent (`coordinates_torus_variable`); the variables on the two torus factors are distinct (`coordinates_two_distinct`). |
| `InvariantCoordinateInput.tensorEvaluate` | The arity-zero scalar `3` gives `3`, the square of the torus coordinate at `2` gives `4`, and the tensor of the two coordinates at `(2,3)` gives `6` (`tensor_value_scalar`, `tensor_value_square`, `tensor_value_product`). |
| Dual coefficient convention | At `diag(2,3)` over `ℚ`, the dual characteristic polynomial is `X²−(5/6)X+1/6` (`dual_diagonal`), fixing both reciprocal coefficients. |
| `DividedPower.internalRing` | Degree one agrees with the input algebra (`internal_degree_one`); `γ₂(1)` is internally idempotent (`internal_integer_degree_two`); the internal product of `γ₂(2)` and `γ₂(3)` is `36γ₂(1)` (`internal_product_six`). The graded square `γ₁(1)²=2γ₂(1)` has a different coefficient. |
| `DividedPower.internalAlgebra` | In degree two the image of scalar `2` differs from `γ₂(2)` (`internal_scalar_not_gamma`); scalar `3` times `γ₂(2)` is `12γ₂(1)` (`internal_scalar_action`); degree zero retains scalar `−3` (`internal_scalar_zero_degree`). |
| `InvariantCoordinateInput.reindex` | At torus values `(2,3)`, selecting the first or second coordinate gives `2` or `3` (`reindex_first`, `reindex_second`); repeating the point `2` in the two-variable product gives `4` (`reindex_repeat`). |
| `InvariantCoordinateInput.multiply` | The one-variable coordinate at `(2,3)` becomes `6` (`multiply_six`); at `(2,3,5)` the first coordinate stays `2` and the last becomes `15` (`multiply_retains_first`, `multiply_last_fifteen`). These distinguish multiplication of the final pair from the first pair. |
| `mergeLast` | `(2,3)` gives `(6)` and `(2,3,5)` gives `(2,15)` (`merge_numeric`); for the noncommuting matrix pair in `ordered_products`, reversing the final pair changes the tested trace from `5` to `4`. |
| Newton and cycle signs | For `M=[[2,3],[4,5]]`, `2det(M)=49−53=−4` (`newton_two`). The two-permutation sum for the identity trace at `(2,3)` is `6−6=0` (`cycle_sign`); starting the swap cycle at opposite matrix units gives `E₀₀` and `E₁₁` (`cycle_order`). |

**Untwisted excursion comparison.** SR.6.3 owns the generic colimit of invariant coordinate
rings over finite free-group maps, with every word-substitution relation. Its imported API is
`ExcursionAlgebra.algebra`, `generator`, `generator_words`, `algebra_universal` and
`comparison_generator` in SmoothRepresentationsOfLocalGroups/Suggested.lean. It also owns
the finite-Weil-action applications. Here `ReductivePseudocharacter.universalRing` represents
compatible pseudocharacter evaluations; the common trivial-action specialization is identified
by `ReductivePseudocharacter.excursionEquiv`. No identification with a nontrivial twisted
Weil action is asserted. The comparison uses the supplier's `Type` universe; the intrinsic
pseudocharacter API retains its existing universe generality.

For a commutative base `O`, an affine group Hopf algebra `C`, and `n≥0`, define
`ReductivePseudocharacter.untwistedFreeCoordinates C n` from `C.ring n` to the gauge-invariant
coordinate ring of trivial-action `F_n`-cocycles. Prove `untwistedFreeCoordinates_evaluate`:
over every coefficient algebra `S`, evaluation at a cocycle is tensor evaluation at its free
basis values. Define `excursionEquiv` for a group `Γ` and the trivial `Γ`-action on `C`;
`excursionEquiv_generator` sends the excursion indexed by `(n,γ,f)` to the universal
pseudocharacter's `θ_n(f)(γ)`. `excursionEquiv_evaluate` identifies every map to a coefficient
algebra with its represented pseudocharacter and commutes with coefficient postcomposition.
These targets apply the free-group cocycle universal property and the colimit property to
[Quast §3.6–3.7, Proposition 3.19 and Theorem 3.20, pp.19–20](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf) and SR.6.3; no reductivity is needed.
*Needs:* SR.6.3 `CocycleScheme.points`, `CocycleScheme.invariantPullback`,
`ExcursionAlgebra.algebra_universal`, `universalRing_equiv_natural`.

**Checks.** For `untwistedFreeCoordinates`, the empty tuple preserves the scalar `7`
(`untwistedFreeCoordinates_empty`); one coordinate evaluates at the chosen free generator
(`untwistedFreeCoordinates_single`); swapping two coordinates swaps their actual point values
(`untwistedFreeCoordinates_swap`). For `excursionEquiv`, coefficients preserve `7`
(`excursionEquiv_scalar`), the empty scalar excursion is `1` (`excursionEquiv_empty`), and
the product-word excursion in a two-element tuple maps to the universal singleton evaluation at `gh`
(`excursionEquiv_product_word`). These six Checks are mirrored by named `example` docstrings.

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
(Homogeneous divided-power piece, Roby algebra of multiplicative laws),
and `Z_A(A[t], d) ≅ A[e₁, …, e_d]` carries the universal characteristic polynomial
(Determinant coordinate ring). Over `𝔽_p` and `(ℤ/p)[X]`, trace-blind determinants
show why the determinant language is kept (Homogeneous polynomial laws,
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

This layer is the base of the roadmap and uses no earlier IHG layer. From Mathlib it uses the
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
ReductiveGroups layer 9 (the split reductive group schemes and their Hopf algebras) and the
top exterior power at constant rank from PadicMeasuresIwasawaAlgebras §5.1, with Mathlib `IsAzumaya`
and SchemeAndStackFoundations §2.22 `IsAzumaya.exists_etale_matrix_splitting`, including its
finite-cover adapter, for the reduced-norm input.

## Layer 3a: Hecke polynomial and multiplier conventions

This algebraic part of IHG.3 precedes reconstruction so that its full multiplier identity can be
used in symplectic coefficient descent. Satake and the `GSp₄` spin polynomial with its Satake
interpretation are imported from SmoothRepresentationsOfLocalGroups, SR.4 (reciprocity from
ClassFieldTheory, layer 7) with the stated normalization; the explicit coefficient comparisons are
proved here. The coefficient ring `A` is any commutative ring, including the zero ring.
The formulas use `q,Tᵢ ∈ A`; an operator algebra is obtained by taking that algebra as `A`.

### 3a.1 GLₙ Hecke polynomials and Frobenius conventions

**Integral GLn Hecke polynomial.** For `n ≥ 0`, `q ∈ A` and operators `T_0, …, T_n` in a
commutative ring `A`, define `Spherical.glnPolynomial` as

```text
P(X) = ∑_{i=0}^n (−1)^i q^{i(i−1)/2} T_i X^{n−i}.
```

For an unramified `GL_n` place the `T_i` are the characteristic functions of
`K diag(π, …, π, 1, …, 1) K` with `π` repeated `i` times and `1` repeated `n−i` times, for
`vol(K) = 1`. When `T₀=1` the polynomial is monic; it is defined integrally, and its
determinant coefficient is
`q^{n(n−1)/2} T_n`. Prove `Spherical.glnPolynomial_coeff` (for `0 ≤ i ≤ n` the coefficient of
`X^{n−i}` is `(−1)^i q^{i(i−1)/2} T_i`) and `Spherical.glnPolynomial_monic` (if `T_0 = 1`, `P` is
monic, even in the zero ring), `Spherical.glnPolynomial_natDegree` (degree `n` when
`A` is nonzero), and `Spherical.glnPolynomial_map` (compatibility with every ring homomorphism) ([ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §2.2.5, equation (2.2.6),
p.922). *Needs:* [Smooth representations of local
groups](../SmoothRepresentationsOfLocalGroups/README.md) SR.4, Characteristic polynomial and trace of a determinant.

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

**Normalized Satake coefficients for GLn.** The algebraic target
`Spherical.glnPolynomial_satake` holds for every `s ∈ A`, with `q = s²`, and every
`z : Fin n → A`. Its elementary symmetric coefficient is the sum of products over all
`i`-element subsets of `Fin n`. In the Satake interpretation, `q` is a unit and `s` is a
chosen square root in a coefficient extension. Under `S(T_i) = s^{i(n−i)} e_i(z_1, …, z_n)` one has

```text
S(P(X)) = ∏_{j=1}^n (X − s^{n−1} z_j).
```

The equality follows because `i(i−1) + i(n−i) = i(n−1)`. The integral polynomial `P` is independent
of the square-root extension ([ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §2.2.5, equation (2.2.6), pp.921–922; the displayed factorization is the elementary
symmetric expansion with the stated Satake normalization). *Needs:* Integral GLn Hecke polynomial.

**Determinant coefficient of the GLn parameter.** Prove `Theorems.gln_determinant_value`
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

The named coefficient target is `Theorems.charpoly_scalar_coeff`: for any degree-`n`
determinant on an `A`-algebra, `r` in that algebra, `a ∈ A` and `i ≤ n`, the coefficient
of degree `n−i` at `a • r` is `a^i` times the coefficient at `r`. Apply this with
`r = g`, `a = θ(g)` and restriction along `h ↦ θ(h)h`. The determinant character
changes by `θ^n` by `Determinant.eval_smul` ([ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §2.2.20–24,
pp.932–934). *Needs:* Restriction of determinants.

**Normalized reciprocal characteristic polynomial.** For a degree-`n` determinant on `A[G]`
and a group element `g` (hence a unit of the group algebra),
use `Theorems.reciprocal_charpoly` and write `P_g(X) = ∑ a_i X^{n−i}` with `a_0 = 1` and `a_n` a unit. Prove that
`P_{g^{-1}}(X) = a_n^{-1} ∑_{i=0}^n a_i X^i`, equivalently `X^n P_g(X^{-1}) / P_g(0)`; this is
the monic polynomial with inverse roots ([ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §2.2.20, p.932). *Needs:*
Characteristic polynomial and trace of a determinant.

**Arithmetic and geometric Frobenius conversion.** Fix `F_v^ar` with `F_v^geom = (F_v^ar)^{-1}`.
Apply `Theorems.reciprocal_charpoly`: if `P` is the characteristic polynomial at `F_v^ar`, the polynomial at `F_v^geom` is the
normalized reciprocal of `P`, and that if a source instead specifies `P` at geometric Frobenius,
its arithmetic polynomial is that reciprocal. ACC23 explicitly uses geometric Frobenius, so
importing its polynomial requires this convention conversion. The cyclotomic character has
`ε(F_v^ar) = q_v` and `ε(F_v^geom) = q_v^{-1}` ([ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Notation §1.2, pp.905–906 and
§2.2.20). *Needs:* Normalized reciprocal characteristic polynomial,
[ClassFieldTheory, layer 7][classfieldtheory7].

**Inversion of spherical double cosets.** The coefficient comparison takes the generator
rule `T_i ↦ T_{n−i}/T_n` as input; constructing the double-coset involution is outside
this layer. Assume `q,T_n ∈ Aˣ` and `T_0=1`. Prove `Spherical.glnPolynomial_inversion`:
`ι(P(X)) = q^{n(n−1)} P^rec(q^{1−n} X)`, where `ι(P)` denotes substitution of that generator rule and `P^rec` is the monic
normalized reciprocal. The Lean target clears the unit constant coefficient: its
coefficient of degree `n−i`, multiplied by `P(0)`, equals `q^{i(n−1)} P.coeff i`. Thus
the corresponding determinant is `D∨ ⊗ ε^{1−n}` when Frobenius is geometric as in ACC23
([ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §2.2.20, p.932). *Needs:* Integral GLn Hecke polynomial,
Normalized reciprocal characteristic polynomial.

**Rank-one normalization by reciprocity.** For `GL_1`, `K = O_v^×` and `T_1 = [KπK]`, so
`P = X − T_1`. The degree-one case of `Theorems.reciprocal_charpoly` says that an unramified character with `θ(F_v^ar) = u` has arithmetic polynomial
`X − u` and geometric polynomial `X − u^{-1}`. Reciprocity sends `π` to the explicitly chosen
Frobenius, so a character evaluated under the opposite Artin convention is inverted
([ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Notation and §2.2.5, equation (2.2.6), pp.905–906, 921–922). *Needs:*
Integral GLn Hecke polynomial, Arithmetic and geometric Frobenius conversion.

**Rank-two classical modular-form normalization.** For the standard arithmetic Galois
representation of a normalized eigenform `f` of natural weight `k ≥ 2` and nebentype `ω` at `ℓ ∤ Np`, the
polynomial is `X² − a_ℓ X + ω(ℓ) ℓ^{k−1}`. Prove `Spherical.glnPolynomial_classical`: the `GL_2` cohomological formula
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
SR.4's `T0`, `T2`, `T1`. The wrapper `Spherical.gsp4SpinPolynomial` is the
fixed-degree reflection of that supplied polynomial with these indices exchanged.
Its constant and coefficient-change targets are `gsp4SpinPolynomial_constant` and
`gsp4SpinPolynomial_map`. The dual definition needs only `T_0 ∈ Aˣ`; `q` can be any
element. Define `Spherical.gsp4DualSpinPolynomial`
as

```text
P(X) = X⁴ − T_0^{-1} T_1 X³ + T_0^{-2}(qT_2 + (q³+q)T_0) X² − q³ T_0^{-2} T_1 X + q⁶ T_0^{-2},
```

the scaled dual polynomial. Assume additionally that `q` is a unit for the reciprocal
interpretation. Prove
`Spherical.gsp4DualSpinPolynomial_reciprocal` (`P(X) = X⁴ Q(q³/X) / Q(0)`) and
`Spherical.gsp4DualSpinPolynomial_constant` (`P(0) = q⁶ T_0^{-2}`); the roots of `P` are `q³`
divided by the spin-`Q` roots ([BCGP](https://arxiv.org/pdf/2502.20645v1), Equation (1.8.27) and Lemma 1.8.28, p.17).
*Needs:* [Smooth representations of local groups](../SmoothRepresentationsOfLocalGroups/README.md)
SR.4, Normalized reciprocal characteristic polynomial.

**Checks.** The three direct dual-polynomial computations in the table below distinguish
`q=0`, the identity parameter, and a nontrivial central unit. In particular,
`q=T₀=1` alone cannot detect a wrong power of either parameter. The pair of
constant coefficients `Q(0)=256`, `P(0)=16` at `q=T₀=2` distinguishes scaled
duality from the unscaled normalized reciprocal, whose constant is `1/256`.

**Geometric-Frobenius dual-spin conversion.** The named target is
`Theorems.gsp4_dual_frobenius`, for an arbitrary degree-four determinant on `A[G]`,
a specified `g ∈ G`, units `q,T₀` and the displayed characteristic polynomial `Q`.
It identifies the characteristic polynomial of the dual at `q³ • g` with `P`.
For BCGP25 geometric Frobenius `F_ℓ`, this says that if
`det(X − ρ(F_ℓ)) = Q_ℓ(X)`, then `det(X − (ρ∨ ⊗ ε^{-3})(F_ℓ)) = P_ℓ(X)`, because
`ε(F_ℓ) = ℓ^{-1}`. Arithmetic Frobenius values require the normalized reciprocals of these
polynomials. This conversion applies to a determinant whenever duality and the twist are defined
([BCGP](https://arxiv.org/pdf/2502.20645v1), Lemma 1.8.28, p.17). *Needs:* GSp4 dual-spin Hecke polynomial,
Characteristic polynomial under a character twist, Arithmetic and geometric Frobenius conversion, Contragredient determinant.

**Full similitude character under duality and twist.** Prove
`Theorems.similitude_dual_twist`: for invertible matrices `r,J` over `A` and units
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

**Checks.** Every name in this table labels a Lean `example` in the Layer 3a sections.
The three definitions each have three direct computations; the further rows pin the
normalizations and excluded hypotheses.

| Definition or convention | Computation | Lean example names |
|---|---|---|
| `Spherical.glnPolynomial` | `n=0,q=0,T₀=1`: `1`; `n=1,q=7,T=(1,3)`: `X−3`; `n=2,q=2,T=(1,3,5)`: `X²−3X+10` | `l3a_gln_empty`, `l3a_gln_linear`, `l3a_gln_quadratic` |
| Integral base change and monicity | Over `𝔽₂`, `q=0,T=(1,1,1)` gives `X²+X`; rank zero with `T₀=0` over `ℤ` is not monic | `l3a_gln_mod_two`, `l3a_gln_nonmonic` |
| `Spherical.gsp4SpinPolynomial` | At `(q,T₀,T₁,T₂)=(1,1,4,4)`: `(X−1)⁴`; at `(0,1,3,5)`: `X⁴−3X³`; at `(2,1,3,5)`: `X⁴−3X³+20X²−24X+64` | `l3a_spin_identity`, `l3a_spin_q_zero`, `l3a_spin_index_order` |
| `Spherical.gsp4DualSpinPolynomial` | At `(1,1,4,4)`: `(X−1)⁴`; at `(0,2,3,5)` over `ℚ`: `X⁴−(3/2)X³`; at `(2,2,3,5)`: `X⁴−(3/2)X³+(15/2)X²−6X+16` | `l3a_dual_identity`, `l3a_dual_q_zero`, `l3a_dual_central` |
| Satake powers and determinant sign | `s=2,z=(3,5)` gives `(X−6)(X−10)=X²−16X+60`; the determinant is `60`, not `−60` | `l3a_satake_pair` |
| Double-coset inversion | `q=2,T=(1,5,3)` gives `X²−5X+6`; transformed generators give `X²−(5/3)X+2/3=(2/3) reflect₂(P)(X/2)` | `l3a_inversion_pair` |
| Classical weight | `k=4,q=2,a=3,ω=1` gives `X²−3X+8`; using truncated natural subtraction at weight one would give constant `2` instead of `1` | `l3a_classical_pair`, `l3a_weight_one_boundary` |
| Frobenius and reciprocity | Arithmetic root `2` gives `X−2`, geometric root `1/2` gives `X−1/2`; roots `2,3` give reciprocal `X²−(5/6)X+1/6` | `l3a_reciprocal_linear`, `l3a_reciprocal_pair` |
| Character twist | Roots `2,3` twisted by `5` give `X²−25X+150`; the constant scales by `5²` | `l3a_twist_pair` |
| Scaled spin duality | Paired roots `2,4` of multiplier `8` become `4,2` under `8/r`; at `q=T₀=2` the four-dimensional constants are `256` and `16` | `l3a_dual_spin_pair`, `l3a_scaled_reciprocal` |
| Full multiplier | On the symplectic plane, `diag(2,3)` has multiplier `6`; its dual twisted by `5` has multiplier `25/6`. In `ℤ/4`, `1≠−1` but their squares agree | `l3a_multiplier_pair`, `l3a_multiplier_residue_two` |

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

**The Cayley–Hamilton ideal.** For a determinant `D` on `R`, define `Determinant.chIdeal` as
`CH(D) ⊆ R`, the two-sided ideal generated by all `χ_α(r_1, …, r_n)` (`n ≥ 1`, `r_i ∈ R`), the
coefficients of `χ(t_1r_1 + ⋯ + t_nr_n) ∈ R[t_1, …, t_n]`. Prove
`Determinant.chIdeal_le_kerTwoSided` (`CH(D) ⊆ Ker(D)`) and `Determinant.chiCoeff_mem_chIdeal`
(each `χ_α(r_1, …, r_n)` lies in `CH(D)`) ([Chenevier](https://arxiv.org/pdf/0809.0415v2), §1.17, p. 17). *Needs:* The characteristic polynomial law χ : R → R, Mathlib `TwoSidedIdeal.span`.

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
`A`-algebra of degree `d`. Define `Determinant.IsCayleyHamilton` as `CH(D) = 0`. Prove
`Determinant.isCayleyHamilton_iff` (iff `χ = 0` as a law) and
`Determinant.IsCayleyHamilton.baseChange` (stable under base change)
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
constant on `Spec(A)` ([Chenevier](https://arxiv.org/pdf/0809.0415v2), Lemma 2.2(iii), pp.23–24). *Needs:* Roby algebra of multiplicative laws.

**Corner determinant.** For `D : R → A` with `A` nonzero and connected and `e² = e` in `R`, define
`Determinant.corner` as `D_e : eRe → A`, `D_e(x) = D(x + 1 − e)`, naturally after every scalar
extension, on the corner algebra with unit `e`. Its degree `r(e)` is the degree of `D(1 − e + te)`,
and `r(e) + r(1 − e) = d`. Prove `Determinant.corner_rank` (`D(1 − e + te) = t^{r(e)}`) and
`Determinant.corner_complement` (the restriction to the two diagonal corners is `D_e D_(1−e)`)
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
`k^sep`, prove that the division factors are finite over their centers, that their center
extensions have finite separable part and purely inseparable exponent bounded by the largest
`p`-power below `n`, and that finite dimension over `k` follows if `k` is perfect, `[k : k^p] < ∞`,
or `p > n`. Finite dimension over a factor center is kept separate from finite dimension over the
original field; the separable-center alternatives and the inseparable exponent are established in
the norm classification ([Chenevier](https://arxiv.org/pdf/0809.0415v2), Lemma 2.14, pp.29–30). *Needs:*
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
*Needs:* Determinants on split simple factors.

**Faithful quotients over arbitrary fields.** For any field `k` and positive-dimensional determinant,
prove that `R/ker D` is a finite product of matrix algebras over division rings finite over their
centers, with determinant a product of reduced norms and bounded inseparable norm laws. It is
finite over `k` under the three conditions of bounded-centers, and can fail to be finite over an
arbitrary imperfect `k` ([Chenevier](https://arxiv.org/pdf/0809.0415v2), Theorem 2.16, pp.31–32). *Needs:*
Semisimple reconstruction of field determinants. The signature
`Theorems.field_faithful_quotient` states the nonempty product decomposition with positive block
sizes; the center bounds and norm formulas are the separate targets above.

**Residual determinant properties.** For `D : R → A` with `A` local and residue field `k`, the
residual determinant is `D̄ : R/mR → k`. It is split when its faithful quotient `(R/mR)/ker(D̄)` is
a finite product of full matrix algebras over `k`; absolutely irreducible if its reconstructed
representation over `k̄` is irreducible; multiplicity-free if that representation has pairwise
inequivalent irreducible constituents. Splitness and absolute irreducibility are independent; a
`k`-representation realizing `D̄` is weaker than splitness. Define `Determinant.residual` as the
scalar extension to `A/m`; `Determinant.IsSplit` as the condition that the faithful quotient is a
finite product of full matrix algebras over `k`, expressed by a surjective map with kernel
`ker D` (mere `k`-linear realizability is insufficient); `Determinant.IsAbsolutelyIrreducible` as
positive-dimensional irreducibility after algebraically closed coefficient extensions,
independently of splitness over the base field; and `Determinant.IsMultiplicityFree` as the
condition that every simple constituent occurs once after algebraic closure
([Chenevier](https://arxiv.org/pdf/0809.0415v2), Definition-Proposition 2.18 and Definition 2.19, pp.32–33;
splitness equivalence). *Needs:* Scalar extension of determinants,
Semisimple reconstruction of field determinants.

**Checks.**

- Residue-field base change of the degree-zero matrix determinant has value `1` at `0`;
  the scalar determinant over `ℚ` has residual value `7` at `1 ⊗ 7`; and the two-by-two
  determinant has residual value `2·7−3·5=−1` at `1 ⊗ [[2,3],[5,7]]`. These distinguish
  degree zero from a zero law, degree one from a squared scalar law, and the determinant
  from the diagonal product (`residual_empty`, `residual_line`, `residual_mixed`).
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

**Henselian irreducible reconstruction.** Prove `Theorems.henselian_irreducible`. For a dimension-`d` Cayley–Hamilton `D : R → A` over
henselian local `A`, prove that if `D̄` is split and absolutely irreducible then `R ≅ M_d(A)` and
`D` is the matrix determinant. Applying this to `R = A[G]/CH(D)` reconstructs an actual
`G → GL_d(A)`. Without residual splitness a central-simple obstruction remains
([Chenevier](https://arxiv.org/pdf/0809.0415v2), Theorem 2.22(i), p.34). *Needs:* Reconstruction from rank-one corners.

**Generalized matrix algebra.** A GMA of block sizes `(d_i)` over `A` is an `A`-algebra `R` with
orthogonal idempotents `e_i` summing to one, isomorphisms `e_i R e_i ≅ M_{d_i}(A)`, and a cyclic
`A`-linear trace equal to the usual matrix trace on each diagonal block. Primitive matrix units
identify off-diagonal blocks with `M_{d_i,d_j}(A_ij)`; multiplication comes from associative
pairings `A_ij ⊗ A_jk → A_ik`. Define `GMA.Data` as the idempotents, corner matrix algebra
isomorphisms and cyclic trace, and `GMA.entryModule` as `A_ij = E_i,11 R E_j,11`. Prove
`GMA.peirce` (`R ≅ ⊕_(i,j) e_i R e_j` as `A`-modules) and `GMA.pairing_assoc` (the off-diagonal
multiplication pairings are associative) ([Bellaïche–Chenevier](https://arxiv.org/pdf/math/0602340v2), Definition 1.3.1 and
Lemma 1.3.2, pp.20–21). *Needs:* The trace of a determinant is a pseudocharacter.

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
injectivity. Define `GMA.adaptedRing` as the symmetric-algebra quotient by the pairing relations
and `GMA.universalAdapted` as the universally injective adapted representation `R → M_d(B_ad)`.
Prove `GMA.adaptedRing_equiv` (`A`-algebra maps from `B_ad` to `B` correspond to adapted
representations) ([Wang–Erickson](https://sites.pitt.edu/~caw203/pdfs/algfam.pdf), §2.3, pp.15–16; BC09 Propositions 1.3.9 and
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
adapted representation. No factorial is inverted. Define `GMA.determinant` as the signed
cycle-product homogeneous law. Prove `GMA.trace_determinant` (the determinant trace is the given
GMA trace), `GMA.determinant_adapted` (every adapted representation realizes `D_E`) and
`GMA.determinant_adapted_toFun` (the same equality of full laws after scalar extension, for every
adapted representation `f ∘ universalAdapted`)
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
`k ⊗_(A/J) ((A/J) ⊗ₐ S) ≅ k ⊗ₐ S`. Define `GMA.ResidualData` as the ordered residual
representations with absolute irreducibility, nonisomorphism, projector equations, diagonal
compatibility and the full-law product; `Ideal.Quotient.factorₐ A hJ` as `A/J → k` for `J ⊆ mₐ`;
`GMA.quotientResidualTransport` as `k ⊗_(A/J) ((A/J) ⊗ₐ S) ≅ k ⊗ₐ S` for associative `S`; and
`GMA.residualFactor` as the reduction of a determinant over `A/J` to `k ⊗ₐ S` along it
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

**Multiplicity-free henselian GMA structure.** Prove `Theorems.henselian_multiplicity_free`. For a Cayley–Hamilton `D` over henselian local `A`
with split multiplicity-free `D̄`, prove that its algebra and trace admit a GMA decomposition with
block sizes the residual constituent dimensions. This does not make off-diagonal modules free or
yield a `d`-dimensional free representation over `A` ([Chenevier](https://arxiv.org/pdf/0809.0415v2), Theorem
2.22(ii), p.34). *Needs:* Henselian irreducible reconstruction, Ordered residual GMA constituents.

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
`GMA.partitionReducibilityIdeal` as the sum of opposite primitive-entry pairing ideals over pairs
in different partition parts. Prove `GMA.partition_reducibility` (for chosen Cayley–Hamilton GMA
data with its residual dictionary, `I_P ⊆ J` iff a unique family of factors has the specified
degrees, full product law and residual products) ([Bellaïche–Chenevier](https://arxiv.org/pdf/math/0602340v2), Proposition
1.5.1, pp.32–34; [Allen–Newton–Thorne](https://arxiv.org/pdf/1912.11269v2), Proposition 2.5 and its entire proof, pp.5–6).
*Needs:* Ordered residual GMA constituents, The kernel contains the Cayley–Hamilton ideal, A determinant is determined by its trace when d! is invertible.

**Two-block determinant reducibility ideal.** For a henselian local `A` and a two-block
Cayley–Hamilton GMA `(S, D_E)` with ordered residual dictionary `(ρ̄ᵢ, ρ̄ⱼ)`, `i ≠ j`, whose
residual factors are specified, split, absolutely irreducible and distinct, define
`GMA.reducibilityIdeal` as `I_red`, the ideal of products of opposite off-diagonal entry modules
`Aᵢⱼ Aⱼᵢ`. Prove `GMA.reducibilityIdeal_le_iff` (for the same two-block residual dictionary, `D_E`
Cayley–Hamilton and `J ⊆ mₐ`: `I_red ⊆ J` iff there exists a unique ordered pair of determinants
`Fᵢ, Fⱼ` on `(A/J) ⊗ₐ S` of degrees `nᵢ, nⱼ` with `D_E mod J = Fᵢ Fⱼ` as full laws, and with
`Fᵢ mod mₐ = det ρ̄ᵢ` and `Fⱼ mod mₐ = det ρ̄ⱼ` under the canonical residual tensor
identification) and `GMA.reducibilityIdeal_baseChange` (under a local quotient `A → A/J`, the
ideal maps to `I_red(A/J)`). No factorial invertibility is assumed
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
ambient Ext endpoint. Define `GMA.quotientRepresentation` as, for a singleton part, the diagonal
compression representation `S_J → M_nᵢ(A/J)`, and `GMA.quotientConstituent` as the vector module
`(A/J)^nᵢ` with the actual compressed `S_J`-action. Prove `GMA.quotientRepresentation_apply` (on
`1 ⊗ x` it is the selected diagonal block `eᵢ x eᵢ`, reduced entrywise modulo `J`)
([Bellaïche–Chenevier](https://arxiv.org/pdf/math/0602340v2), §1.5.4 and Theorems 1.5.5–1.5.6, pp.34–37;
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
module of extension classes of `ρ_j` by `ρ_i` under the hypotheses below. Define `GMA.extensionModule` as
`E_ij = A_ij / (∑_{k≠i,j} A_ik A_kj)`. Prove `GMA.extension_offDiagonal` (the multiplication
defect of the `ij` block vanishes in `E_ij`) and `GMA.extensionModule_twoBlocks` (for two blocks
`E_12 = A_12`) ([Bellaïche–Chenevier](https://arxiv.org/pdf/math/0602340v2), §1.5.3, p.35). *Needs:* Partition reducibility for determinants.

**Checks.**

- With two blocks the intermediate sum is zero: there is no `k ≠ i, j`, so `E_12 = A_12`, and a
  definition whose sum ran over all `k` (including `i` and `j`) would quotient by `A_ii A_ij`
  instead.
- For three scalar blocks of `M₃(A)`, `A_13 / A_12 A_23 = 0`: the intermediate path fills the
  entry, so a definition that forgot the intermediate paths would give `E_13 = A ≠ 0`.
- For `[[A, B], [0, A]]`, the upper extension module is `B`: the degenerate zero lower entry
  contributes nothing, so a definition that symmetrised `E_12` with `E_21` would fail.

**GMA extension identification.** Under the hypotheses of the following injection,
`Theorems.gma_extension_equiv` identifies `Hom_A(Eᵢⱼ,A/J)` with
`Ext¹_(S_J)(Mⱼ,Mᵢ)` as `(A/J)`-modules. Both endpoints are the specified quotient
constituents of the same ordered residual GMA, and `d!` is invertible in `A`.
This target asserts existence of a linear equivalence; it does not select an extension-class
map or a projective cover. The source proves existence by analyzing a primitive projective
summand and its kernel
([Bellaïche–Chenevier](https://arxiv.org/pdf/math/0602340v2), Theorem 1.5.6(1), pp.36–37,
with the pseudocharacter convention of §1.2.1, p.14).
*Needs:* GMA extension module, GMA quotient constituent module, Mathlib module-category Ext.

**Off-diagonal extension injection.** Prove `Theorems.gma_extension_injection`. Let `A` be henselian local with `d!` invertible, `D` a split residually
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
`dim Ext¹(M₂,M₁)=1` (`ext_triangular_upper`); reversing the endpoints gives zero
(`ext_triangular_reverse`); setting both off-diagonal entries to zero also gives zero
(`ext_diagonal_split`). These are checks of the stated Ext endpoints and the existence
identification, including the split case.

For the coboundary convention, `U₅ diag(2,3) U₋₅=[[2,5],[0,3]]`, where
`U_t=[[1,t],[0,1]]`: the upper entry is `t(ψ−χ)`.
With equal characters, `U_t [[1,1],[0,1]] U₋t=[[1,1],[0,1]]`, so the nonzero
upper class cannot be removed by changing the section. These computed Checks are
`extension_coboundary_sign` and `extension_equal_characters`.

**Extension dimensions bound reducibility generators.** For reduced noetherian henselian local
`A` and a split residually two-block multiplicity-free trace pseudocharacter with `d!` invertible,
prove that the minimal number of generators of `I_red` is at most
`dim_k Ext¹_S/mS(ρ̄₁, ρ̄₂) · dim_k Ext¹_S/mS(ρ̄₂, ρ̄₁)` ([Bellaïche–Chenevier](https://arxiv.org/pdf/math/0602340v2),
Proposition 1.7.1, p.42). *Needs:* Two-block determinant reducibility ideal,
Off-diagonal extension injection.

**Classical Ribet lattice.** Prove `Theorems.ribet_lattice`. Let `A` be a complete DVR with residue field `k` and fraction field
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

### 1.5 Universal algebras and coefficient descent

**Universal Cayley–Hamilton algebra.** For a group `G` and `d ≥ 0`, let `Z(G,d)` represent
dimension-`d` determinants on `ℤ[G]`. Define `CayleyHamilton.universalAlgebra` as the universal
Cayley–Hamilton algebra `R(G,d) = (Z(G,d) ⊗_ℤ ℤ[G]) / CH(D_univ)`, the CH quotient over `Z(G,d)`,
with the descended determinant, and `CayleyHamilton.universalAlgebra_quotientMap` as the quotient
map `Z(G,d)[G] → R(G,d)`. Specialization is along an explicit coefficient algebra map
`φ : Z(G,d) → B`, and `D_φ` is the determinant represented by that same map: define
`CayleyHamilton.universalSpecialization` as this `D_φ`. Maps to a Cayley–Hamilton algebra carrying
a `G`-representation and compatible determinant are uniquely induced by the quotient: define
`CayleyHamilton.universalAlgebra_lift` as the coefficient-compatible map `R(G,d) → S` attached to a
Cayley–Hamilton `D_S` with `D_S ∘ r = D_φ` as laws, and prove
`CayleyHamilton.universalAlgebra_lift_single` (it sends `c·g` to `r(φ(c) ⊗ g)`) and
`CayleyHamilton.universalAlgebra_lift_unique` (a coefficient-compatible map with these values
equals the lift). Define `CayleyHamilton.universalAlgebra_baseChange` as `B ⊗_{Z(G,d)} R(G,d)`
along `φ`, and prove `CayleyHamilton.universalAlgebra_specializationEquiv` (it is
`B[G]/CH(D_φ)`). Matrix specialization assumes `B` henselian local, `d > 0`, and `D_φ` residually
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

**Absolutely irreducible coefficient descent.** Prove `Theorems.coefficient_descent`. Let `A ⊂ B` be complete noetherian local rings
with `m_B ∩ A = m_A` and common residue field. For a profinite `G` and continuous
`ρ : G → GL_d(B)`, assume residual absolute irreducibility and `tr ρ(G) ⊂ A`. Prove that `ρ` is
conjugate by `1 + M_d(m_B)` to a representation into `GL_d(A)` ([CHT](https://www.numdam.org/article/PMIHES_2008__108__1_0.pdf), Lemma
2.1.10 and proof, pp.13–15). *Needs:* Henselian irreducible reconstruction, The trace of a determinant is a pseudocharacter.

**Symplectic coefficient descent with prescribed multiplier.** Prove `Theorems.symplectic_coefficient_descent`. Let `A ⊂ B` be complete noetherian
local rings with their maximal-ideal adic topologies and the same residue field of characteristic
`p > 2`, the inclusion being injective, local and inducing that residue identification. Let `G` be
profinite and `ρ : G → GL₄(B)` continuous and residually absolutely irreducible (the residual
determinant predicate), with all traces in `A`. Fix a nondegenerate alternating form `J` over `A`,
alternating and invertible, and a continuous full multiplier `ν : G → Aˣ`, the specified `A`-valued
unit character with its sign, such that `ρ(g)ᵗ J ρ(g) = ν(g) J` over `B`. Prove that there are a
continuous `A`-valued representation `ρ_A` with this same form and full multiplier and a
conjugating `P ∈ GSp(J, B)`, `P ≡ 1 mod m_B`, with `ρ_A(g) = P ρ(g) P⁻¹`. The proof first descends
in `GL₄`, then constructs the descended invertible alternating form with the prescribed multiplier
and selects a symplectic basis, controlling the near-identity conjugator; the `p > 2` hypothesis in
this general result is essential to the cited argument ([Gee–Geraghty](https://arxiv.org/pdf/1001.2044), Lemma 7.1.1 and
proof, p.25). *Needs:* Absolutely irreducible coefficient descent, Full similitude character under duality and twist, Mathlib `IsAdicComplete`, `IsAdic`.

### 1.6 Compatible local compression

**Cayley–Hamilton recognition of isotypic modules.** Prove `Theorems.brauer_nesbitt_module_recognition`. Let `A` be henselian local,
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

**Inner conjugacy of local matrix algebras.** Prove `Theorems.local_matrix_inner_conjugacy`. For a commutative local ring `A`, a positive matrix
size `d > 0` and an `A`-algebra automorphism `f` of `M_d(A)` (an algebra equivalence), prove that
`f` is conjugation by an invertible matrix `P`. Applied to the two full-matrix identifications of
the same residually absolutely irreducible Cayley–Hamilton quotient, it conjugates their group
representations ([Allen–Newton–Thorne](https://arxiv.org/pdf/1912.11269v2), Proof of Theorem 2.4, p.5;
[Caraiani–Newton](https://arxiv.org/pdf/2301.10509v3), Proof of Proposition 3.2.4(3), p.50). *Needs:* Mathlib
`Matrix.toLinAlgEquiv'`, `Module.Projective`, `Module.free_of_flat_of_isLocalRing`,
`Module.Flat.of_projective`.

**Local lifts compatible with global quotient reconstruction.** Prove
`Theorems.compatible_local_reconstruction`. Let `B → A` be surjective, with `B` local and
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

**Checks for the Iwahori fixtures.** `Fixtures.iwahoriUpperUnipotent` has matrix
`[[1,1],[0,1]]`, inverse `[[1,−1],[0,1]]`, and square `[[1,2],[0,1]]` for every level ideal.
Both residual diagonal characters of this unit equal one. On `diag(−1,1)` over `ℚ`,
`Fixtures.iwahoriDiagonal 0` equals `−1` and `Fixtures.iwahoriDiagonal 1` equals `1`;
both send the identity to one. These computed examples fix the diagonal ordering used above. The sign unit `Fixtures.iwahoriSign` has square one,
conjugates `[[1,1],[0,1]]` to `[[1,−1],[0,1]]`, and has distinct residual diagonal values
`−1,1` (`iwahori_sign_square`, `iwahori_sign_upper`, `iwahori_sign_diagonal`).
`Fixtures.triangular_partition`, `upper_mem`, `matrix_entry_mem`, `identity_ch`, `matrix_ch`,
`product_ch`, `diagonal_three_idem`, `diagonal_two_idem`, `diagonal_corner_mem`, `biprod_idem`
and `torus_coordinate_mem` provide the membership and structural proofs used by these fixtures.


### 1.7 GL reconstruction and invariant-coordinate representing rings

**GL pseudocharacter reconstruction.** For algebraically closed `k`, a group `Γ` and positive
`d`, `ReductivePseudocharacter.gl_reconstruction` realizes every pseudocharacter for the actual
Hopf algebra `TauCeti.GeneralLinear.coordinateHopfAlgebra k d` by a semisimple representation of
`k[Γ]`. `glEquiv` and `glEquiv_coeff` identify its determinant and every characteristic
coefficient with the supplied invariant evaluation. Uniqueness up to conjugacy is the
uniqueness already stated in `Theorems.algebraically_closed_reconstruction`.
([Emerson–Morel](https://arxiv.org/pdf/2310.03869v2), Theorem 4.1, pp.13–15;
[Chenevier](https://arxiv.org/pdf/0809.0415v2), Theorem 2.12.) *Needs:* Determinants and GLn
excursion pseudocharacters, Semisimple reconstruction of field determinants.

**Universal reductive pseudocharacter ring.** For `Γ` and the actual Hopf-coordinate input `H/O`, define
`ReductivePseudocharacter.universalRing` as `B_H^Γ`, the colimit of `O[H^m]^H` over free-group
maps `F_m → Γ`, using SR.6.3’s generic invariant-word colimit and the trivial-action
`ReductivePseudocharacter.excursionEquiv` above. Prove `ReductivePseudocharacter.universalRing_equiv`
(`Hom_O(B_H^Γ, A) ≃ PC_H^Γ(A)`: `O`-algebra maps `B_H^Γ → A` are exactly `H`-pseudocharacters
with values in `A`). The algebraic completion at a supplied ideal `m` is Mathlib
`AdicCompletion m (ReductivePseudocharacter.universalRing G C)`; no local wrapper is needed. The representing-ring target
concerns algebraic pseudocharacters. It does not include a continuous deformation-functor
comparison or a noetherianity assertion for this completion.
([Quast](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf),
Theorem 3.20, p.20, for the representing ring.) *Needs:* Connected reductive pseudocharacter,
Mathlib `AdicCompletion`.

**Checks.**

- For the trivial target group `H`, `B_H^Γ = O`: every invariant algebra is `O`, so a construction
  that added a generator per free-group map would not collapse to `O`.
- For `H = GL₁` and `Γ = ℤ`, `B_H^Γ = O[t, t⁻¹]`: the colimit computes the coordinate ring of the
  character variety of `ℤ`, so a construction omitting the inverse `t⁻¹`, or keeping a variable
  for every word, would fail.
- For `Γ = ℤ`, the trivial coordinate system has universal ring `ℤ`, which is not
  `ℤ[t,t⁻¹]`. The GL determinant comparison requires the actual simultaneous-conjugation
  invariant coordinate algebras; it does not hold for arbitrary `InvariantCoordinateInput`.

**Generic Cayley–Hamilton representation algebra.** For a commutative ring `A` and a
Cayley–Hamilton `A`-algebra `(E, D)` finite as an `A`-module, define
`CayleyHamilton.genericRepresentationRing` as a commutative `A`-algebra `A_gen` of finite type and
`CayleyHamilton.genericRepresentation` as the universal determinant-preserving `A`-algebra map
`j : E → M_d(A_gen)`. Prove `CayleyHamilton.genericRepresentationRing_equiv` (for every commutative
`A`-algebra `B`, `A`-algebra maps `A_gen → B` are naturally bijective with `A`-algebra maps
`f : E → M_d(B)` satisfying `det ∘ f = D_B`). Finite type does not assert that `A_gen` is finite as
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
| `cornerLift` | Lifting `3E₀₀` into the `diag(1,0)` corner retains that matrix | Lifting zero into the zero corner gives zero | Lifting `x` at `e=1` has underlying value `x` |
| `matrixModule_submoduleEquiv` | The coordinate line `ℚ(1,0)` is not stable under the full matrix algebra | The zero submodule is stable | The whole vector space is stable |
| `IsSimpleModule R (matrixModule ρ)` | The natural full-matrix action of positive size over a field is irreducible | The scalar action on `ℚ²` is reducible | The upper-unipotent integral action is reducible |
| `IsSemisimpleModule R (matrixModule ρ)` | The natural full-matrix action over a field is semisimple | The scalar action on `ℚ²` is semisimple | The upper-unipotent integral action is not semisimple |
| `GMA.blockModule` | Scalar blocks of `M_s(A)` give `AEᵢⱼ` | The lower block of the upper-triangular algebra vanishes | The single block of `M_d(A)` is all of `M_d(A)` |
| `GMA.primitive` | Scalar blocks give `Eᵢᵢ` | A single size-one block gives `1` | A single size-two block gives `E₀₀`, not the whole block idempotent |
| `GMA.peirce` | The `(0,1)` component of `[[a,b],[c,d]]` is `bE₀₁` | Zero has all components zero | For one block, the component of `1` is `1` |
| `GMA.pairing` | `(aE₀₁)(bE₁₀)=abE₀₀` | The reverse block in the triangular algebra is zero, so its pairing vanishes | In `M₃(ℤ)`, `(2E₀₁)(3E₁₂)=6E₀₂` |
| `GMA.partitionReducibilityIdeal` | Separate labels in `M₂(A)` give `(1)` | A constant label gives zero | Separate labels in the upper-triangular algebra give zero |
| `GMA.intermediateProducts` | In `M₃(A)`, the `(0,2)` entry is generated through block `1` | For two blocks and distinct endpoints there is no intermediate block | The upper-triangular two-block example also gives zero |
| `GMA.extensionModule` | For `M₂(A)`, the `(0,1)` module is `A` | For `M₃(A)`, the `(0,2)` module is zero | The lower extension module of the upper-triangular algebra is zero |

Irreducibility requires a nonzero vector module. The empty matrix action is not irreducible
(`irreducible_zero_rejected`), while it is semisimple. The positive-dimensional natural
action is `irreducible_positive_matrix`. The three residual predicates have a field as
coefficient ring, so their algebraic-closure tests do not become vacuous over the zero ring.

The defining map contracts are `GMA.peirce_apply` and `GMA.pairing_coe`: their underlying
values are `eᵢ r eⱼ` and ordinary multiplication in `R`, respectively.

**Checks for quotient and representation fixtures.** The product determinant on `ℤ×ℤ`
evaluates `(2,3)` to `6` and `(0,3)` to zero, and its polynomial at `(2,3)` is
`X²−5X+6`. `unipotentUnits ℚ` sends `0` to the identity and `2` to `[[1,2],[0,1]]`;
over `𝔽₂` its kernel is nonzero. The single-block GMA has block idempotent `1`; in size one
its trace at `3` is `3`, while in size two over `𝔽₂` its trace at `1` is zero.

For `CHQuotient`, the empty matrix algebra gives the zero ring, the full two-by-two matrix
algebra is unchanged, and the degree-one law `ℤ[X]→ℤ`, `X↦0`, gives quotient `ℤ`.
Its `chQuotientMap` kills `X` in the last example and is both injective and surjective in
the matrix example. `Theorems.FaithfulQuotient` is `ℤ×ℤ` for the product determinant,
`M₂(A)` for the matrix determinant, and `ℤ` for evaluation at zero on `ℤ[X]`.

**Checks for residual specialization.** `Determinant.residual` agrees with scalar extension
to `IsLocalRing.ResidueField A`; its value on `1⊗r` is the residue of `D(r)`; for the product
determinant over `𝔽₂`, the residual trace of `(1,1)` is zero. Each check is a Lean example.

**Evaluation contracts.** `Determinant.corner_eval` sends a corner element `x` to
`D(x+1−e)`; `Determinant.corner_eval_baseChange` gives the same formula for every
coefficient algebra, including nonreduced ones. `Determinant.corner_rank_add` gives
`r(e)+r(1−e)=d`. `GMA.adaptedRing_equiv_apply` sends `f : B_ad → B` to the entrywise image under `f`
of `GMA.universalAdapted`; `GMA.universalAdapted_split` supplies an `A`-linear retraction.
The latter implies injectivity after arbitrary coefficient extension
(Chenevier, Lemma 2.4, p.25; Bellaïche–Chenevier, Propositions 1.3.9 and 1.3.13,
pp.23 and 27–28).

`Ideal.Quotient.factorₐ_apply_mk` sends the class of `a` to its residue, and
`GMA.quotientResidualTransport_tmul` sends `c ⊗ ([a] ⊗ r)` to `c·ā ⊗ r`.
`GMA.residualFactor_baseChange` identifies the entire resulting law with `D.residual`.
`GMA.extensionModule_twoBlocks_mk` sends the quotient class of `x` back to `x`.
These maps use the stated local-ring and ideal-containment hypotheses; tensor transport
allows noncommutative `R` (Allen–Newton–Thorne, Proposition 2.5, pp.5–6;
Bellaïche–Chenevier, §1.5.3, p.35).

`chQuotientMap` is Mathlib's `RingCon.mkₐ` for the ring congruence of `CH(D)`, and the
`A`-algebra structure of `CHQuotient` is Mathlib's `RingCon` quotient algebra
(`Mathlib/RingTheory/Congruence/Basic.lean`); neither is redefined.
`CayleyHamilton.universalAlgebra_quotientMap_single` sends `c·g` to the class of `c ⊗ g`;
`CayleyHamilton.universalAlgebra_specializationEquiv_tmul` sends `b ⊗ [g]` to `[b ⊗ g]`.
`CayleyHamilton.genericRepresentationRing_equiv_apply` specializes the universal matrix
entrywise, and `CayleyHamilton.genericRepresentationRing_finiteType` asserts finite type
over `A`, assuming `R` is finite over `A` and `D` is Cayley–Hamilton
(Chenevier, §1.22 and Proposition 1.23, pp.18–19; BIP, Lemma 3.1, pp.10–11).

**Checks for the evaluation contracts.** Names below label Lean `example`s.

| Definition | Three discriminating Checks and example names |
|---|---|
| `GMA.universalAdapted`, `GMA.adaptedRing_equiv` | For the single standard size-two block over `ℤ`, `diag(2,3)` retains entry `2` (`adapted_diagonal`); `[[0,2],[3,0]]` retains upper entry `2` (`adapted_upper`); `(2E₀₁)(3E₁₀)` retains entry `6` at `(0,0)` (`adapted_product`). These fix coordinates and multiplication order for the universal map and its specializations. |
| `GMA.ResidualData` | One full matrix block of positive size admits its residual data (`residual_one_block`); two size-one blocks with zero lower module admit the two diagonal residual characters (`residual_triangular_exists`); two scalar blocks in the full `M₂(k)` admit no such data (`residual_full_matrix_rejected`). All three use fields `k`, including `𝔽₂`. |
| `Ideal.Quotient.factorₐ` (supplier) | Over `ℚ` with `J=0`, `[7]` maps to `7` (`residue_field_seven`); with `J=m` the map is bijective (`residue_maximal_injective`); with `J=0` a nilpotent maps to zero (`residue_nilpotent`). |
| `GMA.quotientResidualTransport` | `3 ⊗ ([2] ⊗ 7)` becomes `42` (`transport_scalar_product`); `1 ⊗ (1 ⊗ (2E₀₁)(3E₁₀))` becomes `1 ⊗ 6E₀₀` (`transport_matrix_order`); a zero middle coefficient kills a nonzero matrix (`transport_zero_coefficient`). |
| `GMA.residualFactor` | The empty determinant takes zero to one (`residual_factor_empty`); the scalar degree-one law takes `7` to `7` (`residual_factor_line`); the matrix `[[2,3],[5,7]]` gives `−1` (`residual_factor_matrix`). The accompanying equality `residualFactor_baseChange` is at full-law level. |
| `GMA.quotientRepresentation` | Compression of `2eᵢ+3eⱼ`, `i≠j`, gives `2I` (`quotient_rep_selected`); a cross-block entry acts by zero (`quotient_rep_off_diagonal`); the coefficient unit ideal gives zero (`quotient_rep_unit_ideal`). |
| `GMA.quotientConstituent` | `2eᵢ+3eⱼ` acts by `2` on the selected vector module (`constituent_selected`); a proper coefficient ideal gives a nonzero module (`constituent_proper_nonzero`); the unit ideal kills it (`constituent_unit_ideal`). |
| `GMA.extensionModule_twoBlocks` | For standard scalar blocks in `M₂(ℚ)`, `[7E₀₁]` maps to `7E₀₁` (`two_block_seven`), and the inverse retains `−3E₀₁` (`two_block_negative`); over `ℤ`, `[3·(2E₀₁)]` maps to `6E₀₁` (`two_block_integral_product`). |
| `CayleyHamilton.universalSpecialization` | For the trivial group the scalar `7` has values `1`, `7`, `49` in degrees `0`, `1`, `2` (`specialization_empty`, `specialization_line`, `specialization_square`). |
| `CayleyHamilton.universalAlgebra_quotientMap` | Degree zero kills every generator (`universal_quotient_zero_degree`); degree one makes all generators commute (`universal_quotient_line_commutes`); in degree two the two free generators need not commute (`universal_quotient_two_noncommutes`). |
| `CayleyHamilton.universalAlgebra_baseChange` | The trivial group in degree zero gives the zero algebra over `ℚ` (`baseChange_zero_degree`); degree one gives exactly `ℚ` (`baseChange_trivial_line`); degree two gives exactly `𝔽₂` after specialization to that field (`baseChange_trivial_square`). |
| `CayleyHamilton.genericRepresentation`, `CayleyHamilton.genericRepresentationRing_equiv` | Specializing at the identity action retains scalar `7` in size one (`generic_line`), the mixed matrix `[[2,3],[5,7]]` over `ℚ` (`generic_mixed`), and `[[1,1],[1,0]]` over `𝔽₂` (`generic_char_two`). These compare the chosen universal map with the inverse of the representing equivalence. |

For `CayleyHamilton.universalAlgebra_lift` and
`CayleyHamilton.universalAlgebra_specializationEquiv`, use generators with images
`U=[[1,2],[0,1]]`, `V=[[1,0],[3,1]]` over `ℚ`, and take the coefficient map representing
this same matrix determinant. Then `UV=[[7,2],[3,1]]`, `VU=[[1,2],[3,7]]`, and
`UV−VU=diag(6,−6)`. The examples are `lift_product_order`, `lift_reverse_order`,
`lift_difference`, and `specialization_equiv_product`, `specialization_equiv_reverse`,
`specialization_equiv_difference`. The free group on two generators realizes these inputs;
the computations fix the multiplication order and the sign of the two-term difference.
The degree-zero universal algebra is the zero ring (`universal_zero_degree`); the positive-degree
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
scalar extension and restriction, the Roby algebra, Azumaya determinants, continuous determinants,
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
ReductiveGroupsPartII RG2.2 and RG2.3 for the integral model; ReductiveGroups layer 9 through the
invariant coordinate algebras of Layer IHG.0.

## Layer 2: integral and derived Hecke actions

Work over a commutative ring `A`, with modules in the universe of `A` and their standard
module derived category. An action always retains its map `α : H →ₐ[A] End(C)`, with `H`
commutative. Write `T_der = α.range`. Ring multiplication of endomorphisms is composition:
`f*g = g ≫ f`. Cohomological degree one is `M[−1]`; a class in `Ext¹(M,M)` gives a map
`M[−1] → M`. The telescope relation is `[n,x] = [n+1,t x]`, from **identity minus forward
shift**. These conventions apply to every construction below.

### 2.1 Hecke images in the derived category

**Finite morphism modules.** Prove `Theorems.derived_hom_finite`: if `A` is noetherian,
`M` is supported on an integer interval `[a,b]`, `N` on `[c,e]`, and each cohomology
module of both objects is finite, then `Hom(M,N)` is a finite `A`-module. Empty support
intervals force the corresponding object to be zero. Induct on the two amplitudes,
using truncation triangles and Mathlib's finite Ext modules. This is the bounded-finite
extension of the endomorphism finiteness argument in
[Boxer–Pilloni, proof of Lemma 2.4.3, p.18](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf).
No finite projective dimension is assumed. Prove `Theorems.derived_image_finite` for
any commutative action on such a `C`, by taking the submodule `α.range` of `End(C)`.
*Needs:* `ModuleCat.finite_ext`, `DerivedCategory`.

**Chain, homotopy and derived images.** Use `AlgHom.range` for each actual action;
use `AlgHom.rangeRestrict`, `Subalgebra.val` and `AlgHom.quotientKerEquivRange` for
its surjection, inclusion and kernel quotient. Prove `Theorems.chain_action_descent`
with the formulas `α_K(h) = quotient.map (α(h))` and `α_D(h) = Q.map (α(h))`.
The induced maps of images are the supplier's `AlgHom.subalgebraMap`; their
surjectivity is `AlgHom.subalgebraMap_surjective`. For a K-projective source the
homotopy-to-derived comparison uses `CochainComplex.IsKProjective.Qh_map_bijective`.
This specifies the maps in `T_ch → T_hom → T_der`; no new image carrier is needed.
Source: [ACC, §2.2.3, pp.920–921](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf).
*Needs:* `DerivedCategory.Q`, `DerivedCategory.Qh`, `HomotopyCategory.quotient`.

**Cohomology action and its quotient.** Define `HeckeImage.cohomologyAction C` as the
`A`-algebra map from `End(C)` to the product of endomorphism rings of all `H^i(C)`.
Prove `cohomologyAction_apply` with component `homologyFunctor.map f`. The new content
is assembling the homology functors into this algebra map, not the general range API.
Define `ghostIdeal C` using `TwoSidedIdeal.ker` of that map, and prove
`mem_ghostIdeal`: membership means every homology map is zero. For the action `α`,
`actionGhostKernel` is the ideal in **H**, while `imageGhostIdeal` is the kernel of
cohomology on **α.range**. The former contains `ker α`, which need not vanish.
Define `cohomologyImage_quotient` using the supplier's quotient equivalence, with the
codomain identified as `(cohomologyAction.comp α).range`. Its additional contract
`cohomologyImage_quotient_mk` sends `[α(h)]` to `(H^i(α(h)))_i`.
Source: [ACC, Lemma 2.2.4 and its setup, p.920](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf).
*Needs:* the preceding image constructions.

**Checks.** Scalar values and the nonzero Ext class distinguish the cohomology action
from the derived action.

| Definition | Zero-object Check | Scalar Check on `ℤ[0]` | Two-degree Check |
|---|---|---|---|
| `cohomologyAction` | `hecke_zero`: scalar 7 acts by zero | `hecke_scalar`: scalar 2 sends 3 to 6 | `hecke_ext_two`: a nonzero square-zero `X` acts by zero on all cohomology |
| `ghostIdeal` | `hecke_zero`: the ideal is zero in the zero endomorphism ring | `hecke_scalar`: the ideal is zero | `hecke_ext_two`: it contains the nonzero `X` |
| `actionGhostKernel` | `hecke_zero`: the ideal in `ℤ` is the unit ideal | `hecke_scalar`: the ideal is zero | `hecke_ext_two`: for `ℤ[X]` acting on `𝔽₂[0] ⊕ 𝔽₂[−1]`, it is `(2,X)`, while `ker α = (2,X²)` |
| `imageGhostIdeal` | `hecke_zero`: the ideal is the whole zero ring | `hecke_scalar`: the ideal is zero | `hecke_ext_two`: the nonzero class of `X` belongs and the square of the ideal vanishes |
| `cohomologyImage_quotient` | `hecke_zero`: the class of scalar 7 maps to zero | `hecke_scalar`: the image of the class of 2 sends 3 to 6 | `hecke_ext_two`: the nonzero derived class of `X` maps to zero, while the class of 1 remains nonzero |

`hecke_kernel_not_image` also computes evaluation `X↦0` on `ℤ[0]`: its source ghost
kernel is `(X)` and its image ghost ideal is zero. This distinguishes the two ideals
even without an Ext class. The chain/homotopy distinction is the two-term complex
`A --1→ A`: its identity is nonzero as a chain map for nonzero `A`, but vanishes in
`K(A)` and `D(A)` (`chain_image_contractible`, `homotopy_image_contractible`).

### 2.2 Ghosts and local factors

**Ghost nilpotence and annihilators.** Prove `Theorems.ghost_nilpotence`: for `a ≤ b`
and `H^i(C)=0` outside `[a,b]`, any ordered product of `b−a+1` ghosts vanishes. This
is a statement about the full, possibly noncommutative endomorphism ring. In the
proof, truncate a product of `b−a` ghosts below the top degree. Once that truncation
vanishes, the product factors through `C → H^b(C)[−b]`. The remaining ghost factors
through `τ≤b−1 C → C`, so their composite is zero. Prove
`Theorems.action_annihilator_power`: if `I ≤ actionGhostKernel C α`, then
`I^(b−a+1) ≤ ker α`. Source: [ACC, proof of Lemma 2.2.4, pp.920–921](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf).
*Needs:* the cohomology action and truncation triangles.

**Checks and orientation.** `ghost_amplitude_one` computes exponent one on `[a,a]`.
`ghost_orientation` uses the nonzero class `δ : 𝔽₂[−1] → 𝔽₂[0]`: the matrix with
upper-right entry `δ` has square zero, upper-right entry `δ`, and lower-left entry
zero. This pins the degree convention. `endomorphism_two_term_order` computes
`E₀₁E₁₀(2,3)=(2,0)` and `E₁₀E₀₁(2,3)=(0,3)` in the derived endomorphism ring,
pinning the multiplication order.
`hecke_ext_two` shows that exponent two on `[0,1]` cannot be reduced to one.
Nilpotence gives the prime-spectrum comparison by
`PrimeSpectrum.comap_quotientMk_bijective_of_le_nilradical`; maximal ideals correspond
under the supplier's quotient ideal correspondence. These are library applications,
not additional spectrum constructions.

**Finite local factors.** Prove `Theorems.finite_hecke_local_factors`: if `A` is
complete noetherian local and `T` is a finite commutative `A`-algebra, there are
`s : ℕ`, finite `A`-algebras `B_i`, and `T ≃ₐ[A] ∏ i : Fin s, B_i`, with each `B_i`
noetherian, local and complete at its own maximal ideal. Allow `s=0` for the zero
algebra. This product decomposition is the algebra input to the summand construction;
the chosen coordinate idempotents are transported by the algebra equivalence.
Source: [Stacks, Lemma 10.160.2](https://stacks.math.columbia.edu/tag/0323).
*Needs:* finite algebras, adic completeness.

**Specified idempotent summands.** For every `C ∈ D(A)` and `e²=e`, define
`HeckeImage.localizedComplex C e he`, with inclusion `localizedComplex_ι` and
projection `localizedComplex_π`. Prove `localizedComplex_split`: `i ≫ p = 1` and
`p ≫ i = e`. Prove `Theorems.derived_idempotent_splitting` for every commutative `A`.
The countable coproduct input is `HeckeImage.derivedCountableCoproducts`; construct
it using coproducts of module complexes and their localization. Source:
[Bökstedt–Neeman, Corollary 1.7, p.213, and Proposition 3.2, pp.221–222](https://www.numdam.org/item/CM_1993__86_2_209_0.pdf).

Construct `localizedComplex_homology : H^i(eC) ≅ range H^i(e)` and prove
`localizedComplex_homology_ι`: its composite with the submodule inclusion is `H^i(i)`.
Construct `localizedComplex_decomposition : eC ⊞ (1−e)C ≅ C`; prove
`localizedComplex_decomposition_hom` is the pair of splitting inclusions. Prove
`Theorems.localized_support`: `eC` is zero iff every `H^i(e)` is zero. These statements
need neither finiteness nor a local coefficient ring; the finite-factor application
uses the preceding paragraph. They are the homology and complementary-summand
consequences of the same splitting argument. *Needs:* idempotent splitting.

**Checks.** All three columns use `C = (ℤ²)[0]`. The splitting objects have ranks
0, 2, 1, respectively (`summand_object_zero`, `summand_object_identity`, `summand_object_first`).

| Definition | `summand_zero`, `e=0` | `summand_identity`, `e=1` | `summand_first`, `e(a,b)=(a,0)` |
|---|---|---|---|
| `localizedComplex` | zero object | isomorphic to `(ℤ²)[0]` | isomorphic to `ℤ[0]` |
| `localizedComplex_π` | the projection of `(2,3)` has coordinate `(0,0)` | it has coordinate `(2,3)` | it has coordinate `(2,0)` |
| `localizedComplex_ι` | that projected vector includes as `(0,0)` | it includes as `(2,3)` | it includes as `(2,0)` |
| `localizedComplex_homology` | that projected vector maps to `(0,0)` in the range | it maps to `(2,3)` | it maps to `(2,0)` |
| `localizedComplex_decomposition` | projecting `(2,5)` to `e` and `(7,3)` to `1−e`, then adding, gives `(7,3)` | the same computation gives `(2,5)` | it gives `(2,3)` |

### 2.3 Operator localization and ordinary parts

**Telescope and homology.** For arbitrary `C ∈ D(A)` and `t ∈ End(C)`, define
`HeckeImage.operatorLocalization C t` with maps `operatorLocalization_ι C t n`
from its successive copies. Prove `operatorLocalization_relation` and
`operatorLocalization_triangle`: the latter is the distinguished triangle whose
first map on the countable coproduct is `ι_n − t ≫ ι_(n+1)`, whose second map is
the family of telescope inclusions. For a module `M`, `moduleTelescope M t` is the
`ModuleCat` packaging of `Module.DirectLimit (fun _ : ℕ => M) (fun i j _ => t^(j-i))`.
`moduleTelescope_ι M t n` is Mathlib's `of` map at stage `n`; `of_f` gives the stage
relations and `lift`/`hom_ext` give its universal property. Prove
`moduleTelescope_presentation`: the quotient of `ℕ →₀ M` by the span of
`single n x − single (n+1) (t x)` is linearly equivalent to this colimit, sending
that generator's class to `Module.DirectLimit.of … n x`.
Construct `operatorLocalization_homology : H^i(C[t⁻¹]) ≅ moduleTelescope H^i(C) H^i(t)`;
prove `operatorLocalization_homology_ι` sends `H^i(ι_n)(x)` to `[n,x]`.
Source: [Bökstedt–Neeman, Definition 2.1 and Remark 2.2, p.213](https://www.numdam.org/item/CM_1993__86_2_209_0.pdf).
*Needs:* countable coproducts and exact filtered colimits of modules.

**Comparison with an idempotent.** Define `operatorLocalization_idempotent` for
`e²=e`, `te=et`, an inverse on the selected factor (`u=eue`, `tu=ut=e`), and
nilpotence on the complement (`(t(1−e))^n=0` for some positive `n`). It identifies
the telescope with `localizedComplex C e he`. Prove
`operatorLocalization_idempotent_ι`: the initial-copy map followed by this
isomorphism is the splitting projection. This is the invertible/nilpotent
calculation in [Boxer–Pilloni, proof of Lemma 2.4.3, p.18](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf);
the explicit hypotheses here make it valid over every commutative `A`.
*Needs:* the telescope, the splitting and their homology maps.

**Checks.** The following tests use `(ℤ²)[0]`, with `t=e` and input `(2,3)` at
stage one. The comparisons are checked on that vector, not just on object isomorphisms.

| Definition | `telescope_zero` | `telescope_identity` | `telescope_first` |
|---|---|---|---|
| `operatorLocalization` | rank 0 | rank 2 | rank 1 (object assertions: `telescope_object_zero`, `telescope_object_identity`, `telescope_object_first`) |
| `operatorLocalization_ι` | the input has zero homology class | its class is `[0,(2,3)]` | its class is `[0,(2,0)]` |
| `operatorLocalization_homology` | sends it to `[0,(0,0)]` | sends it to `[0,(2,3)]` | sends it to `[0,(2,0)]` |
| `operatorLocalization_idempotent` | after inclusion the coordinate is `(0,0)` | it is `(2,3)` | it is `(2,0)` |

For `moduleTelescope` and its stage map `moduleTelescope_ι`, `module_telescope_zero` kills `[7,3]` for zero transition;
`module_telescope_identity` identifies `[n,x]` with `x`; `module_telescope_first`
identifies `[n,(a,b)]` with `a`. **Two-term sign Check:** `telescope_two_term_sign`
computes `[0,3]+[1,3]=0` for `t=−1`, and the homology comparison sends stage-one
3 to minus stage-zero 3. `telescope_nonunit` identifies the telescope of
multiplication by 2 on `ℤ` with `ℤ[1/2]`, taking `[0,1]` to 1.

**Factorial powers.** Prove `Theorems.factorial_powers` for complete noetherian local
`A` with finite residue field and a finite commutative `A`-algebra `T`. There is an
idempotent `e` such that, for every `k`, eventually `t^(n!)−e ∈ (m_A T)^k`.
Modulo each maximal ideal of `T`, `e` is zero when `t` belongs to that ideal and
one otherwise. The proof uses eventual factorial powers in each finite quotient
`T/(m_A T)^k`, then completeness; finite local factors distinguish the unit and
nonunit cases. This spells out the finite-quotient justification for the ordinary
projectors in [Calegari–Geraghty, §7.1, p.73](https://arxiv.org/pdf/1207.4224).
`factorial_unit_nonunit` computes `(1,0)^(n!)=(1,0)` over `𝔽₂×𝔽₂`.
`factorial_infinite_field` gives the negative control: `2^(n!)≠1` in the discrete
field `ℚ`. *Needs:* finite local factors and adic completeness.

**Ordinary finiteness.** Prove `Theorems.ordinary_finite` for artinian local `A` and
`C` with bounded finite cohomology. Every operator has an idempotent `e`, an inverse
on `eC`, and a nilpotent complementary restriction, with the exact equations of
`operatorLocalization_idempotent`. Its telescope has finite cohomology on the same
support interval. This is the discrete module-derived statement of
[Boxer–Pilloni, Lemma 2.4.3, p.18](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf).
Prove `Theorems.ordinary_finite_factor`: for `u : M → C`, `v : C → M` with the same
bounded finite hypothesis on `C`, the telescope isomorphism for `vu` and `uv`
sends the initial map out of `M` to the initial map out of `C` composed with `u`.
The telescope of `vu` has bounded finite cohomology. This is the bounded form of
[Boxer–Pilloni, Lemma 2.4.6 and proof, p.19](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf).
The scope is the algebraic telescope and bounded finite cohomology. An analytic
localization comparison or a separate perfect-complex interface is outside this layer.
*Needs:* finite morphism modules, local factors and operator localization.

**Completion of a supplied split algebra.** Prove `Theorems.large_prime_hecke_completion`:
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
of multiplication by 2 on `ℤ[0]` is nonzero (`ordinary_nonartinian`); topological
nilpotence is not the nilpotence hypothesis of the idempotent comparison.

### Dependencies

No earlier IHG layer. Use Mathlib's `DerivedCategory`, `ModuleCat.finite_ext`,
`DerivedCategory.Q`, `DerivedCategory.Qh`, `DerivedCategory.homologyFunctor`,
`CochainComplex.IsKProjective.Qh_map_bijective`, `AlgHom.range`, quotient/image API,
`TwoSidedIdeal.ker`, and `Module.DirectLimit`. Predicates `Theorems.Supported` and
`Theorems.FiniteCohomology` mean vanishing outside the specified interval and degreewise
finite modules, respectively. Layer IHG.5 consumes `Theorems.ghost_nilpotence`.

## Layer 3b: residual maximal ideals of Galois type

### 3b.1 Galois-type and non-Eisenstein maximal ideals

**Maximal ideals of Galois type.** Let `T` be any commutative ring, `m` a maximal ideal with
finite residue field `k = T/m` equipped with the discrete topology, `G` a group with a topology,
`n : ℕ`, `Frob : V → G`, and `P : V → k[X]`. Define `Spherical.IsGaloisType m n Frob P`
by existence of a continuous semisimple representation on `kⁿ` whose characteristic polynomial
at `Frob v` is `P v`. Lean uses its equivalent algebra map `k[G] →ₐ[k] M_n(k)` and the
invariant-complement condition from Layer 1. Define `Spherical.IsNonEisenstein` by existence
of such a representation whose determinant is absolutely irreducible in the sense of Layer 1.
It implies Galois type and `0 < n`; rank zero is allowed only for Galois type. The two predicates
use the same realizing representation inside each existential, including its Frobenius identities.

For a spherical Hecke algebra away from `S`, take `G = G_{F,S}`, `V` the finite places outside
`S`, and the reductions of Layer 3a's Hecke polynomials. This is the specialization of
[ACC, Definition 2.3.6, p.938](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf).
Existence for geometric cohomology is supplied by its geometric owner. The general predicates
make no density assumption on `Frob` and allow `V` to be empty.

**Basic consequences.** Prove `Spherical.IsNonEisenstein.isGaloisType`,
`Spherical.IsNonEisenstein.pos`, and `Spherical.IsGaloisType.polynomial`: under the hypotheses
above, a non-Eisenstein system is Galois type of positive rank, and every observed polynomial
of a Galois-type system is monic of degree exactly `n` with nonzero constant term. These are
consequences of the definitions, positivity in absolute irreducibility, and the characteristic
polynomial of an invertible matrix (Mathlib's `Matrix.charpoly_monic`,
`Matrix.charpoly_natDegree_eq_dim`, `Matrix.det_eq_sign_charpoly_coeff`).

**Uniqueness.** Prove `Spherical.galoisType_unique` for continuous degree-`n` determinants
of `k[G]` over any Hausdorff topological field `k`, with the conjugacy saturation of `Frob(V)`
dense in `G`. Equality of the characteristic polynomials at every `Frob v` implies equality
of the determinants. Neither finiteness of `k` nor compactness of `G` is required here.
Continuity extends the characteristic-polynomial identities from the dense set; field
reconstruction and Brauer–Nesbitt then apply
([Chenevier, Theorem 2.12 and its uniqueness proof, pp.28–31](https://arxiv.org/pdf/0809.0415v2)).
For the finite residue-field representations above, Layer 1 identifies their semisimple
realizations after a common algebraic closure. Empty observations do not supply density in a group.

**Checks.** The names below identify `example` declarations in `Suggested.lean`. In the finite
field checks take `T = 𝔽_p`, `m = 0`, and identify `T/m` with `𝔽_p`.

| Definition | Discriminating Checks |
|---|---|
| `Spherical.IsGaloisType` | `l3b_zero`: trivial group, rank zero, polynomial `1` is realized; `l3b_line`: trivial group over `𝔽₂`, rank one, `X−1` is realized; `l3b_split_pair`: rank two gives `(X−1)²`; `l3b_wrong_identity`: at the identity over `𝔽₅`, `X−2` cannot occur in rank one; `l3b_zero_root`: `X` cannot occur for a group element; `l3b_wrong_degree`: rank two cannot have polynomial `X−1`; `l3b_empty_observations`: with `V = ∅`, the trivial line is still realized. |
| `Spherical.IsNonEisenstein` | `l3b_zero`: the zero representation is rejected; `l3b_line`: the trivial line over `𝔽₂` is accepted; `l3b_split_pair`: two equal trivial characters are rejected although their sum is semisimple; `l3b_character`: the tautological character of `(𝔽₅)ˣ` is accepted; `l3b_empty_observations`: the trivial line remains absolutely irreducible with no observations. |

`l3b_split_charpoly` computes `(X−1)² = X²+1` over `𝔽₂`: a zero trace does not lower the
rank. `l3b_density_needed` distinguishes the trivial and sign characters of `C₂` over `𝔽₃`
at the nonidentity element (`X−1` versus `X+1`); observing only the identity cannot give uniqueness.

### 3b.2 Duality and character twists of residual polynomial systems

**Transport.** Under the finite discrete residue-field hypotheses of 3b.1, let
`θ : G → kˣ` be a continuous character. Prove `Spherical.galoisType_twist` and
`Spherical.nonEisenstein_twist`: tensoring by `θ` preserves the respective predicates, replacing
`P_v` by `P_v.scaleRoots (θ(Frob v))`. The coefficient of `X^(n−i)` is multiplied by
`θ(Frob v)^i` for `0 ≤ i ≤ n`. Use Mathlib's `Polynomial.scaleRoots` directly.

Prove `Spherical.galoisType_dual_twist` and `Spherical.nonEisenstein_dual_twist`: contragredient
followed by tensoring by `θ` also preserves the predicates, with transformed polynomial

```text
(C (P_v(0)⁻¹) * Polynomial.reflect n P_v).scaleRoots (θ(Frob v)).
```

The nonzero constant coefficient follows from `IsGaloisType.polynomial`. The matrix action
is `g ↦ θ(g) • ρ(g⁻¹)ᵀ`, and the roots are `θ(Frob v)/α_i`. These residual transport statements
are the representation-theoretic content of
[ACC, the paragraph after Definition 2.3.6, p.938](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf).
This layer specifies transport of residue-field polynomial systems; construction of automorphisms
of a spherical Hecke algebra or induced maps on its maximal ideals is outside this layer.

For geometric Frobenius at places with `q_v ∈ kˣ`, `ε(Frob_v) = q_v⁻¹`. The ACC dual twist is the integer power
`θ = ε^(1−n)`, so its root multiplier is `q_v^(n−1)` when `n ≥ 1`. The general transport
statements also allow `n = 0`; the polynomial remains `1`. Continuity and unit values of the
character are explicit assumptions throughout.

**Checks.** `l3b_twist_pair` computes `(X−2)(X−3)` under root multiplier `5` as
`(X−10)(X−15) = X²−25X+150`. `l3b_dual_pair` computes normalized reflection as
`(X−1/2)(X−1/3)`; the normalizing constant is `1/6`. `l3b_geometric_pair` combines the two:
for `n = 2`, `q = 5`, and `ε(Frob) = 1/5`, the dual-twist roots are `5/2,5/3`, not `1/10,1/15`.
All three computations take place over `ℚ` to distinguish the signs and exponents before
reduction. `l3b_empty_dual` gives `1` in rank zero.

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
**Check (`interpolation_polynomial_convention`).** For the two eigenvalues `1,−1`, the two
polynomials are `(X−1)(X+1)=X²−1` and `(1−X)(1+X)=1−X²`. In characteristic two both
become `X²+1`; equality there alone would not detect the sign convention.
See [Scholze, Definition 5.1.8 and Remark 5.1.9, p.1037](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf).

### 4.1 Uniqueness and gluing of continuous determinants

**Group-algebra coefficient change.** `Determinant.mapCoefficients D φ`, for a ring map
`φ : A → B`, is scalar extension followed by `B ⊗_A A[G] ≃ B[G]`.
`mapCoefficients_charpoly` sends each polynomial to its coefficientwise image;
`mapCoefficients_id` and `mapCoefficients_comp` assert identity and composition on the full law.
These have no topological, finiteness or positive-degree hypothesis. They specialize scalar
extension from Layer 0 to group algebras, rather than introducing a second scalar-extension law.
Source: [Chenevier, §1.1, pp.6–7 and §2.30, p.37](https://arxiv.org/pdf/0809.0415v2).

**Uniqueness from Frobenius density.** `Theorems.frobenius_determinant_uniqueness` takes a group
`G` with a topology, a Hausdorff coefficient ring `A`, continuous degree-`d` determinants `D,E`,
and `Frob : V → G` such that `{h Frob(v) h⁻¹}` is dense. Equality of the monic characteristic
polynomials at every `Frob(v)` implies `D=E`. Neither compactness nor finiteness is needed for
this implication. In the arithmetic application Chebotarev layer 10 supplies conjugacy density
in `G_{F,S}`; chosen representatives alone need not be dense. The algebraic input is that
characteristic polynomials on group elements determine the law, including its values on sums.
Sources: [Chenevier, Lemma 1.12(ii), p.12 and §2.30, p.37](https://arxiv.org/pdf/0809.0415v2);
[Scholze, Corollary 5.1.10, p.1037](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf).

**Compact coefficient-ring gluing.** `Theorems.compact_determinant_gluing` takes any group `G` with a topology,
compact Hausdorff `A`, any family of Hausdorff coefficient rings `B_i`, continuous ring maps
`φ_i : A → B_i` that are jointly injective, continuous degree-`d` laws `D_i`, and a dense set
`S ⊆ G`. For every `g ∈ S` and coefficient index `k`, assume there is one `a ∈ A` mapping to
all the `k`th coefficients. There is a unique continuous law over `A` extending to every `D_i`.
The family can be infinite or empty; an empty jointly injective family forces `A` to be the
zero ring. Compactness of `A` makes its continuous injection into the Hausdorff product
a closed embedding. Density and continuity of the characteristic coefficients then give
integrality on all of `G`; the integral Amitsur formula gives algebraic descent. These steps
impose no compactness hypothesis on `G`.
Source: [Chenevier, Example 2.32 and Corollary 1.14, pp.38 and 14](https://arxiv.org/pdf/0809.0415v2).

**Gluing over an intersection of quotient ideals.** `Theorems.intersection_determinant_gluing`
specializes this to `A/(I∩J) → A/I × A/J`. Require compact Hausdorff `A/(I∩J)`, Hausdorff
`A/I,A/J`, continuous canonical maps, any group `G` with a topology, continuous laws on the two quotients, and
simultaneous coefficient lifts on a dense subset of `G`. Its unique continuous law reduces to
both input laws. Agreement after passing to reduced rings is insufficient. The case `I=J`
recovers the same law; `I=⊤` discards the zero-ring component; comaximal ideals allow arbitrary
pairs by the Chinese remainder theorem. Source: the preceding gluing result, applied in
[Scholze, proof of Corollary 5.1.11, p.1038](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf).

**Checks.** `compact_determinant_gluing_noncompact` applies the actual gluing theorem to
`G=ℤ` with its discrete topology and the identity coefficient map on `𝔽₂`; `ℤ` is not compact.
`determinant_noncompact_witness` applies `CongruenceWitness.determinant` to that same source
and checks continuity and equality with every classical quotient law. The construction calls
`compact_determinant_gluing` on the conjugacy-saturated Frobenius set, retaining compact
Hausdorff coefficients and full polynomial-law descent.

### 4.2 Finite-quotient witnesses and interpolation

**Compatible quotient determinants.** `Interpolation.FiniteQuotientData A G d J hJ` takes an
arbitrary descending sequence of ideals `J` in a commutative ring `A` and a group `G` with a
topology. It consists of laws `D_r` over `A/J_r`, continuity of their characteristic coefficients
for the discrete quotient topology, and equality of the full reduced laws for `r≤s`.
The structure itself imposes no finiteness, compactness, completeness or openness assumption.
In the finite arithmetic application the quotients are finite and `G` is profinite; Layer 0's
continuity/kernel theorem then supplies finite group quotients. `FiniteQuotientData.reduce`
is the compatibility projection. Source: [Chenevier, Lemmas 2.33 and 3.2, pp.38–39 and 41](https://arxiv.org/pdf/0809.0415v2).

**Refining the group quotient.** For any normal subgroups `V≤U`,
`Interpolation.FiniteQuotientData.refineGroup` pulls a law on `(A/J_r)[G/U]` back along
`(A/J_r)[G/V] → (A/J_r)[G/U]`. It uses `QuotientGroup.map`, `MonoidAlgebra.mapDomainAlgHom`
and Layer 0's `Determinant.comap`. No family `F`, topology, finite index or open-subgroup
hypothesis is needed for this algebraic operation. `refineGroup_charpoly` identifies its value
at the class of `g` with the original polynomial at the class of `g`.
For finite quotients choose normal open subgroups and refine them by finite intersections;
there need not be one subgroup working for every coefficient level. Source: the factorization
in [Chenevier, Lemma 2.33, pp.38–39](https://arxiv.org/pdf/0809.0415v2).

**The quotient-limit ring.** `Interpolation.quotientLimit J hJ` is the subring of
`∏_r A/J_r` whose `s`th coordinate reduces to its `r`th coordinate for `r≤s`.
This concrete presentation handles arbitrary descending ideals, unlike the powers of one ideal
in `AdicCompletion`; generic categorical limits are supplied by `RingCat.sectionsSubring`.
An identification `complete : A ≃+* quotientLimit J hJ` must additionally satisfy
`(complete a)_r = a mod J_r`. An unrelated abstract ring isomorphism does not certify the
canonical quotient system. Source: the inverse-limit construction used in
[Chenevier, proof of Lemma 3.2, p.41](https://arxiv.org/pdf/0809.0415v2).

**Determinant from a compatible inverse limit.** `Interpolation.inverseLimitDeterminant`
takes quotient data and this canonical complete identification, and returns a degree-`d` law
on `A[G]`. `inverseLimitDeterminant_reduce` identifies every reduction;
`inverseLimitDeterminant_unique` says any law with those reductions equals it, without a
continuity assumption on the competing law. The construction uses the representing ring of
multiplicative laws over `ℤ`; it makes no assertion that tensor products commute with inverse
limits. `Theorems.classical_interpolation` adds a topology on `A`, discrete topologies on the
quotients, and a topological embedding `A → ∏_r A/J_r`. It concludes existence and uniqueness
of a continuous law with the given reductions. The general formulation is the representability
argument of [Chenevier, Lemma 3.2, p.41](https://arxiv.org/pdf/0809.0415v2), applied without the
fixed residual determinant or local coefficient-ring restrictions of that lemma's deformation
functor; neither restriction enters the argument.

**Uniform congruence witnesses for classical systems.**
`Interpolation.CongruenceWitness A G V d Frob` takes compact Hausdorff `A`, a group `G` with a topology, and a
finite family of Hausdorff `A`-algebras with continuous structure maps and continuous laws.
It requires conjugacy density of `Frob`, joint injectivity of the coefficient maps, and a common
`A`-lift of each Frobenius coefficient across all components. The finite family can be empty
only when joint injectivity allows it. `CongruenceWitness.determinant` gives the descended law;
`determinant_continuous` and `determinant_classical` assert continuity and equality of the full
extended laws. `compatible` takes two such witnesses, a continuous coefficient map, and exact
transport of every Frobenius polynomial, and concludes equality of the transported laws.
This is the finite-family specialization of compact gluing, from
[Chenevier, Example 2.32, p.38](https://arxiv.org/pdf/0809.0415v2). The geometric construction of
uniform congruences remains input: at each level one ideal controls all unramified places
simultaneously, as in [Scholze, proof of Corollary 5.1.11, p.1038](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf).

**Integral interpolation with uniform congruences.** `Theorems.uniform_congruence_interpolation`
takes one witness over each discrete compact quotient `A/J_r`, canonical completeness and the
quotient-family topological embedding, and compatibility of the witness Frobenius polynomials
under reduction for every `r≤s`. It yields a unique continuous law reducing to the descended
law of each witness. Compactness is required of the coefficient quotients for descent;
no compactness of `G` is assumed. This combines the preceding compatibility and inverse-limit targets;
its sources are [Chenevier, Example 2.32 and Lemma 3.2, pp.38 and 41](https://arxiv.org/pdf/0809.0415v2).

**Coefficient change in interpolation.** `Theorems.interpolation_coefficient_change` takes
quotient data on `A/J_r` and `B/K_r`, canonical complete identifications for both rings, a ring
map `φ : A → B`, maps `φ_r : A/J_r → B/K_r` commuting with the quotient maps, and equality of
the transported quotient laws. It concludes equality of the transported inverse-limit laws.
This algebraic assertion needs no topology on `A,B` or continuity of `φ`; the continuous
application uses `classical_interpolation` separately. It is a consequence of uniqueness in
[Chenevier, proof of Lemma 3.2, p.41](https://arxiv.org/pdf/0809.0415v2).

**Hecke level change in interpolation.** `Theorems.hecke_level_change` takes continuous laws
on `G`, a continuous coefficient map `A→B` with `B` Hausdorff, a conjugacy-dense Frobenius
family, and transport of all its characteristic polynomials. It concludes transport of the
whole law. In the Hecke application the geometric owner supplies the continuous level map and
transport of every normalized Hecke coefficient, which gives the polynomial hypothesis. No
existence of a geometric level map is asserted here. This is a consequence of Frobenius
uniqueness, used with [Scholze, Corollary 5.1.11, p.1038](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf).

**Fixed ramification set in coefficient limits.** `Theorems.interpolation_group_pullback`
takes quotient data on groups `G,H`, the same canonically complete coefficient system, a group
homomorphism `q : G → H`, and equality between the pullbacks of the level laws on `H` and the
level laws on `G`. The reconstructed laws satisfy the same pullback identity. This algebraic
identity needs neither surjectivity nor continuity of `q`. Applying it to the fixed quotient
onto `G_{F,S}` proves preservation of that factorization. Uniform unramifiedness of the
classical sources is an input, not a conclusion of coefficient interpolation. Source: naturality
of the representing-ring construction in [Chenevier, proof of Lemma 3.2, p.41](https://arxiv.org/pdf/0809.0415v2).

**Failure of field-point integrality on nilpotents.** `Theorems.field_points_fail` takes any
field `k`. Over `k[ε]/ε²` the rank-one characters of `ℤ` given by `n↦1` and
`n↦(1+ε)^n=1+nε` give distinct laws, with values `1` and `1+ε` at the generator. Every ring map
to any field kills `ε`, so their extended laws agree at every field-valued point. This includes
characteristic two. Source: the dual-number setting of
[Chenevier, §2.24, p.35](https://arxiv.org/pdf/0809.0415v2); the character computation specifies
this example completely.

**Checks.** Each name below labels a Lean `example` in `Interpolation.Checks`.

| Definition | Three discriminating Checks and matching examples |
| --- | --- |
| `Determinant.mapCoefficients` | Degree zero has value `1` even at zero after `ℤ→𝔽₂` (`coeff_rank_zero`); the two eigenvalues `1,−1` have `X²−1 ↦ X²+1` (`coeff_two_term`); the rank-one value `3∈ℤ/4` survives identity change but becomes `1` modulo two (`coeff_nilpotent`). |
| `FiniteQuotientData` | Augmentation gives a constant zero-ideal family over `𝔽₂` for discrete `G` (`family_constant`); the unit-ideal system has the unique zero-ring law in every degree (`family_unit_ideal`); values `1` and `−1` at one group element cannot occur at different levels of a constant `𝔽₃` system (`family_incompatible`). |
| `FiniteQuotientData.refineGroup` | `V=U` leaves the full law unchanged (`refine_identity`); refining from `G/G` gives `(X−1)²` at every element in degree two (`refine_trivial_quotient`); the two-term input `2[g]+3[h]` maps to `5[1]`, so its degree-two determinant is `25` (`refine_two_term`). |
| `quotientLimit` | Zero-ideal compatibility forces a constant sequence, rejecting a varying sequence (`limit_carrier_constant`); the unit-ideal limit is the zero ring (`limit_carrier_unit`); with `J₀=⊤` and `J_r=0` for `r>0`, the compatible image of `3` has initial coordinate zero and a nonzero tail (`limit_carrier_direction`). |
| `inverseLimitDeterminant` | Degree zero evaluates to `1` at zero (`interpolate_rank_zero`); rank-one quotient values `1,−1` on `g,h` reconstruct value `−1` on `2[g]+3[h]` (`interpolate_two_term`); the constant zero-ideal system over `ℤ/4` reconstructs value `3=1+2`, distinct from `1` (`interpolate_nilpotent`). |
| `CongruenceWitness` | A fully specified identity witness over `𝔽₂` (`witness_identity`); a two-component witness over `𝔽₂×𝔽₃` using both projections (`witness_product`); an empty witness over the zero ring (`witness_empty_zero_ring`). The negative control `witness_empty_rejected` excludes an empty family over `𝔽₂`. |
| `CongruenceWitness.determinant` | The identity witness returns the augmentation, with value `0` on `1+1` over `𝔽₂` (`witness_identity`); the two-projection witness returns the product augmentation, with value `(0,2)` on `1+1` (`witness_product`); the empty zero-ring witness returns the unique law, with value zero at zero (`witness_empty_zero_ring`). |

### Examples

The checks include degree zero, the unit ideal, empty coefficient families, characteristic two,
a nonreduced ring, and two-term inputs outside the group basis. The product witness is also the
intersection example for the two projection kernels of `𝔽₂×𝔽₃`, whose intersection is zero.
For a prime `p`, use `A=ℤ_p` and `J_r=(p^r)`. The supplied
`PadicInt.inverseLimitRingEquiv`, `inverseLimitContinuousMulEquiv` and `ker_toZModPow`
identify the coefficient system and its topology; at `r=0` the quotient is the zero ring. Compatible characters give degree-one
laws and `classical_interpolation` assembles them with the inverse-limit topology.

### Dependencies

Layer 0 supplies scalar extension, pullback, the rank-one algebra-homomorphism correspondence,
coefficient descent, coefficientwise continuity, the open-kernel criterion in the profinite case,
and representability of multiplicative laws. Layer 3a supplies the normalized Hecke polynomials.
[Chebotarev layer 10][chebotarev10] supplies arithmetic conjugacy density. Coefficient interpolation
uses the ordinary group algebra and the specified quotient-limit ring.

## Layer 5: quantified nilpotent comparison

A Hecke comparison supplies an error ideal and a uniform exponent. Descent produces a
determinant over the quotient by that ideal. All coefficient rings in this layer are
commutative; no factorial invertibility or residue-characteristic restriction is imposed.

### 5.1 Descent through a nilpotent error ideal

**Determinant from a quantified Hecke comparison.** Prove
`Theorems.nilpotent_comparison_schema`. Let `G` be a compact topological space with a group
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
*Needs:* Layer 4, `Theorems.compact_determinant_gluing`; `RingHom.kerLift_injective`.

**Functoriality of nilpotent descent.** Prove `Theorems.nilpotent_descent_functorial`.
For ideals `J ⊂ T`, `J′ ⊂ T′`, supply a continuous ring map
`q : T/J → T′/J′`. Assume `T′/J′` Hausdorff, both
quotient determinants continuous, and their characteristic polynomials agree after `q`
on Frobenius representatives whose conjugates are dense in `G`. Then `D.mapCoefficients q = E`.
Nilpotence is needed to quantify the original error, not for this compatibility assertion.
This is the quotient-ring
specialization of Layer 4's `Theorems.hecke_level_change`, with the same hypotheses
(uniqueness by the dense-set argument used in Scholze, Corollary 5.1.10, p.1037).
*Needs:* Uniqueness from Frobenius density.

### 5.2 Nilpotence exponents

These are elementary ideal-power and module-filtration consequences. The two-factor
comparison occurs in [Scholze, proof of Theorem 5.4.1, p.1059](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf);
the sharper numerical bounds below follow by multiplying ideal powers and expanding a
commutative ideal sum, rather than being separately numbered results of that paper.

**Nilpotence through a quotient extension.** `Nilpotence.extension`: for ideals `J,K`
and natural numbers `a,b`, `K^a = 0` and `J^b ⊆ K` imply `J^(ab) = 0`.
Containment `K ⊆ J` is needed only for the interpretation as `J/K`.
The power identity `(J^b)^a = J^(ba)` proves the bound, including zero exponents in the
zero ring. *Needs:* Mathlib ideal multiplication and powers.

**Nilpotence of sums of commutative ideals.** `Nilpotence.sup`: if `a,b > 0`,
`I^a = 0` and `J^b = 0`, then `(I+J)^(a+b−1) = 0`.
`Nilpotence.finite_sup`: for a finite family with positive exponents `a_i`, the sum has
exponent `1 + Σ(a_i−1)`, including exponent one for the empty family.
In every product of `a+b−1` factors, either at least `a` come from `I` or at least `b`
from `J`. This sharpens `Ideal.sup_pow_add_le_pow_sup_pow` (exponent `a+b`).
*Needs:* Mathlib `Ideal`, distributivity of ideal multiplication over sums.

**Nilpotence in a product of coefficient rings.** `Nilpotence.detected`: a jointly
injective family `f_i : A → B_i` detects a common exponent: if `(J.map f_i)^N = 0`
for every `i`, then `J^N = 0`. The index family need not be finite.
For a finite family with positive bounds `a_i`, `Nilpotence.product` gives exponent
`1 + max_i(a_i−1)`, with maximum zero on empty input. For nonempty input this is
`max_i a_i`. This formulation covers product ideals using coordinate projections and
inverse images under an injection. For empty input joint injectivity forces `A` to be
the zero ring. *Needs:* `Ideal.map_pow` and injectivity of the assembled map.

**Error ideal on a filtered module.** `Nilpotence.submodule_extension`: for any `A`-module
`M`, submodule `M′`, and natural numbers `a,b`, if `J^a M′ = 0` and `J^b M ⊆ M′`,
then `J^(a+b) M = 0`. A product of two endomorphisms that vanish on both factors of
`0 ⊂ M′ ⊂ M` is zero: the second maps into `M′`, and the first kills `M′`.
Thus the kernel of the action on both factors is square-zero inside the image algebra
acting faithfully on `M`. For an arbitrary acting algebra the conclusion is annihilation
on `M`, unless its action is faithful. *Needs:* Mathlib `Submodule`, ideal powers.

**Quantified composition of Hecke error ideals.** `Nilpotence.comparison`: for ring maps
`f : T → T₁`, `g : T → T₂`, assume `(ker f ∩ ker g)^a = 0` and error ideals
`J₁^b = J₂^c = 0` with `b,c > 0`. Then
`(f⁻¹(J₁) ∩ g⁻¹(J₂))^(a·max(b,c)) = 0`.
For an action faithful on a two-factor filtered module, the comparison kernel has `a = 2`.
For a derived-to-cohomology comparison, use the inclusive amplitude exponent.
*Needs:* Nilpotence through a quotient extension; nilpotence detected by products;
Layer 2, Amplitude bound for ghost nilpotence.

**Uniform nilpotence in an inverse limit.** `Nilpotence.inverse_limit`: for ideals `K_r`
in `A` with `⋂ K_r = 0`, an ideal `J`, and one natural number `N`, assume
`(J.map (A → A/K_r))^N = 0` for every `r`. Then `J^N = 0`.
No completeness or monotonicity is needed for this detection statement. To apply it to
an actual inverse limit, take `J` to be the ideal of elements whose coordinates belong
to the specified compatible error ideals; its coordinate images are contained in those
ideals. Uniformity is essential (Scholze, Corollary 5.4.2, footnote 29, p.1060).
*Needs:* `Nilpotence.detected`, separation by the coefficient quotients.

### 5.3 Residual specialization, representations and lattices

**Residual semisimple specialization.** Prove `Theorems.residual_semisimple_specialization`.
For `d > 0`, a maximal ideal `m` of `T`, an inclusion `J ⊆ m`, an algebraically closed
field `k` with a specified `T/m`-algebra structure, and a determinant `D` over `T/J`,
the coefficient change along `T/J → T/m → k` is the determinant of a semisimple
matrix representation, unique among semisimple representations up to conjugation by
`GL_d(k)`. This is an algebraic statement for an arbitrary group `G`. If `J^N = 0`
with `N > 0`, the inclusion follows from `Ideal.IsPrime.pow_le_iff`.
The algebraic theorem is [Chenevier, Theorem 2.12, p.28](https://arxiv.org/pdf/0809.0415v2),
used in [Scholze, Corollary 5.4.3, p.1060](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf).
*Needs:* Layer 1, `Theorems.algebraically_closed_reconstruction`;
`Determinant.mapCoefficients`; `Ideal.Quotient.factor`.

**Representation over the nilpotent quotient.** Prove
`Theorems.residual_irreducible_quotient_lift`. Let `d > 0`, `T/J` be henselian local,
and the residual determinant be split and absolutely irreducible. Construct an algebra
isomorphism `e : CHQuotient D ≃ M_d(T/J)` such that the composite of `e` with the
canonical CH quotient map realizes `D`. Any matrix representation realizing `D` is
conjugate to this one. Here `J` can be any ideal for which the hypotheses hold;
nilpotence records its origin in the comparison. The algebraic input is [Chenevier, Theorem 2.22(i), pp.34–35](https://arxiv.org/pdf/0809.0415v2),
applied in Scholze, Corollary 5.4.4, p.1060.
*Needs:* Layer 1, Henselian irreducible reconstruction and the canonical CH quotient.

**Local conditions and change of lattice.** Fix a commutative ring `A`, arbitrary
`A`-modules `M,N`, a character `α : G → Aˣ`, and a scalar-action cocycle
`c(gh) = c(g) + α(g)c(h)`. Prove `Theorems.lattice_cocycle_transport`: an `A`-linear
map `F : M → N` preserves this equation and sends a specified local witness
`c(h) = (α(h)−1)y`, `h ∈ H`, to the witness `F(y)`. Cohomology classes and restriction
use Mathlib's `groupCohomology.map` and `groupCohomology.mapShortComplexH1`;
the coordinate statement here retains the actual witness. Reflection of local triviality
requires an isomorphism; a zero map can kill a nontrivial class.
For a rank-two triangular representation with diagonal characters `χ,ψ`, use `α=χ/ψ`
and `c=b/ψ`. Prove `Theorems.lattice_diagonal_rescale` over any commutative ring:
for units `r,s`, the convention `ρ′=PρP⁻¹`, `P=diag(r,s)`, gives `b′=(r/s)b`
and `c′=(r/s)c`. This specifies a coordinate change; it asserts no equality of Fitting
ideals for nonisomorphic lattice modules. These formulas follow directly from linearity
and `Matrix.mul_apply`. *Needs:* Mathlib group-cohomology functoriality and matrix multiplication.

### Examples

**Checks.** The identifiers name Lean `example`s in the Layer 5 theorem section.
This layer introduces no definitions; it uses the determinant, CH quotient, ideal,
module and cohomology carriers specified by its dependencies.

| Check | Computation and discriminating case |
|---|---|
| `l5_extension_six` | In `ℤ/64`, `J=(2)`, `K=(8)`: `K²=0`, `J³=K`, `J⁶=0`, but `J⁵≠0`. The extension bound is the product `2·3`. |
| `l5_error_not_square_zero` | In `ℤ/8`, `(2)³=0`, `(2)²≠0`. |
| `l5_sum_sharp` | In `ℚ[x,y]/(x²,y³)`, `(x+y)³=3xy²≠0`, `(x+y)⁴=0`; the bound `2+3−1=4` is sharp. |
| `l5_two_factor_kernel` | On `0⊂ℤe₁⊂ℤ²`, `U=[[0,1],[0,0]]` is nonzero, kills both factors, and `U²=0`. This fixes the order of the filtration argument. |
| `l5_nonfaithful_kernel` | The scalar action of ℤ on the zero module has kernel `(1)`, whose square is nonzero; faithfulness is essential for a square-zero kernel in the acting algebra. |
| `l5_empty_bounds` | The empty finite sum and product bounds are both one. |
| `l5_zero_exponent` | In `𝔽₂`, every ideal has zeroth power `(1)≠0`. |
| `l5_unbounded_limit` | The image of `2` in `ℤ/2^(r+1)` has `(r+1)`st power zero, but every power of `2` in `ℤ₂` is nonzero. |
| `l5_quotient_square` | Reduction `ℤ/(4) → ℤ/(2)` sends `[3]` to `[1]` and `[2]` to `0`; the direction is from the smaller ideal's quotient. |
| `l5_degree_zero` | The determinant on the empty matrix has characteristic polynomial `1`. Descent permits this case; the reconstruction targets specify positive degree. |
| `l5_trivial_rank_one` | The trivial rank-one representation over `𝔽₂` has polynomial `X−1`. |
| `l5_repeated_residual` | Two copies of the trivial character over `𝔽₂` fail absolute irreducibility. |
| `l5_infinite_discrete_character` | The values `2^n` in `ℚ`, for `n∈ℤ`, form an infinite set. A discrete continuous character need not have finite image for a noncompact source. |
| `l5_rescale_ratio` | With `P=diag(2,3)` and `U=[[2,6],[0,3]]` over `ℚ`, `PUP⁻¹=[[2,4],[0,3]]`: `c=2` becomes `4/3=(2/3)c`. |
| `l5_coboundary_direction` | The additive character `n↦n` for the trivial action on `ℤ` is not a coboundary; the zero module map kills it. |

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
fail (the local module is `0` and its Fitting ideal is the unit ideal; the checks
`ribet_scalar_not_irreducible`, `ribet_scalar_congruence_holds`, `ribet_scalar_refutes_containment`
and `ribet_trivial_group_refutes_global` record this).

**Check.** The zero ring cannot serve as the total fraction ring of `ℤ`. If the
fraction-ring hypothesis were omitted, every assertion about field quotients of that zero ring
would be vacuous; `¬ IsLocalization (nonZeroDivisors ℤ) (ZMod 1)` excludes this case.

**Fitting annihilator bound.** The supplier `TauCeti.fittingIdeal_le_annihilator`, owned by
PadicMeasuresIwasawaAlgebras §4.5, states
`Fitt₀_A(M) ⊆ Ann_A(M)` for a finite module over a commutative ring, without a finite-presentation
hypothesis ([Stacks](https://stacks.math.columbia.edu/tag/07ZA), Lemma 15.8.4(6), tag 07ZA). The supplier proves the bound using adjugates of finite relation minors.
*Needs:* PadicMeasuresIwasawaAlgebras §4.5, Tau Ceti `fittingIdeal`, Mathlib `Module.annihilator`.

**Checks.**

- `fittingIdeal_le_annihilator_cyclic`: `Ann_ℤ(ℤ/6)=(6)`.
- `fittingIdeal_le_annihilator_strict`: `Fitt₀_ℤ((ℤ/2)²)=(4)` while its annihilator is `(2)`.
- `fittingIdeal_le_annihilator_zero`: for the zero module both ideals are the unit ideal.

### 6.1 Character differences and the Ribet cocycle

**Character congruence on the group algebra.** Let `A ⊆ B` be commutative rings, `J ⊆ A` an
ideal, `ρ : G → GL₂(B)` an `A`-linear representation and `χ, ψ : G → Aˣ` characters. Prove that if
`tr(ρ(g))` and `det(ρ(g))` lie in `A` and reduce to `χ(g) + ψ(g)` and `χ(g)ψ(g)` modulo `J` for
every `g`, then for every `t ∈ A[G]` the characteristic polynomial of `ρ(t)` lies in `A[X]` and
reduces to `(X − χ(t))(X − ψ(t))` modulo `J` ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §2.1, equation (13), p.8).
*Needs:* Amitsur's formula for determinants.

**Character difference modules.** For an `A`-algebra representation `ρ : A[G] → M₂(B)` and a
character `ψ : A[G] → A`, define `IntegralRibet.differenceModule` as `Δψ`, the range of the
`A`-linear map `t ↦ ρ(t) − ψ(t)I₂` on `A[G]`, and for `χ, ψ` define
`IntegralRibet.differenceProduct` as `ΔχΔψ`, the ambient product submodule, the `A`-span of all
products `x*y` with `x ∈ Δχ`, `y ∈ Δψ`. Prove `IntegralRibet.differenceModule_generators` (`Δψ`
is generated by the `ρ(g) − ψ(g)I₂` for `g ∈ G`) ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §2.1, equation (14),
pp.8–9). *Needs:* Mathlib `MonoidAlgebra`, `Matrix`, `Submodule`.

**Checks.**

- If `ρ(g) = ψ(g)I₂` for all `g` and `χ = ψ`, then `Δψ = 0`: every difference `ρ(t) − ψ(t)I₂`
  vanishes, so a definition that took the span of the `ρ(g)` rather than of the differences would
  return a nonzero module here.
- For the trivial group and the trivial scalar representation, `Δψ = 0`: the degenerate case,
  where a definition that inserted the identity matrix as a generator would fail.
- For `G = ℤ`, `A = B = ℤ` and `ρ(n) = [[1,n],[0,1]]`, `χ = ψ = 1`: `Δψ = ℤ E₁₂` (the differences
  are `n E₁₂`) and `ΔχΔψ = 0` (since `E₁₂² = 0`), whereas the sum of the two difference modules is nonzero. The Lie bracket is also zero
  in this example. A separate check, `difference_product_sign_character`, uses
  `G=ℤˣ`, `ρ(u)=uI₂`, and `χ=ψ=1`: `Δψ=2ℤI₂`, whereas
  `ΔχΔψ=4ℤI₂≠0`. All commutators vanish. This distinguishes multiplication from
  the bracket and from the sum of the two difference modules.

**Product containment of difference modules.** `IntegralRibet.differenceProduct_le`: for the preceding algebra maps, prove
`ΔχΔψ ⊆ Δψ` ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §2.1, p.9). *Needs:* Character difference modules.

**Initial Ribet quotient module.** Define `IntegralRibet.initialModule` as
`M₀ = Δψ / (ΔχΔψ)`, interpreting the product submodule inside `Δψ` by the preceding containment,
and `IntegralRibet.initialModule_mk` as the quotient map from `Δψ` to `M₀`. Prove
`IntegralRibet.initialModule_generators` (the classes of `ρ(g) − ψ(g)I₂` generate `M₀`)
([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §2.1, equation (14), p.9). *Needs:* Product containment of difference modules.

**Checks.**

- For `ρ = ψI₂` and `χ = ψ`, `M₀ = 0`: both `Δψ` and the product vanish, so a definition whose
  quotient were taken in `M₂(B)` rather than in `Δψ` would not give zero.
- For the integral upper-unipotent representation of `ℤ` and `χ = ψ = 1`, `M₀ ≅ ℤ`: `Δψ = ℤE₁₂`
  and the product is zero, so this is a torsion-free nonzero quotient. The zero denominator does not distinguish a
  submodule product from its ambient two-sided ideal.
- An `A`-linear map `Δψ → L` factors uniquely through `M₀` iff it annihilates every product
  `(ρ(t) − χ(t))(ρ(u) − ψ(u))`: this is the universal property of the quotient, which a definition
  with the wrong submodule in the denominator would fail.

**Canonical Ribet cocycle.** For the preceding modules define `α = χψ⁻¹` and
`IntegralRibet.canonicalCocycle` as the cocycle `κ₀` with scalar action `χψ⁻¹`, given by
`IntegralRibet.canonicalCocycle_apply`, `κ₀(g) = ψ(g)⁻¹[ρ(g) − ψ(g)I₂]` in `M₀`. Prove that it is a
one-cocycle for the scalar action `α` (`IntegralRibet.canonicalCocycle_mul`), `κ₀(gh) = κ₀(g) + α(g)κ₀(h)`, and
`IntegralRibet.canonicalCocycle_span` (the `A`-span of `κ₀(G)` is all of `M₀`)
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
is no `v₀` relation and no `y_v`. Prove `IntegralRibet.localCocycle_restriction` (`κ|G_{v₀} = 0`,
`κ(g) = (α(g) − 1)y_v` on the other `Σ` subgroups, and `κ|I_v = 0` for `v ∈ P`) and
`IntegralRibet.localModule_span` (`N` is generated by `κ(G)` together with the `y_v`)
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
`m_T`-adic module topology. These are additional inputs to `Theorems.local_ribet_theorem`;
`T̃` need not be finite over `T`, the residue field need not be finite, and irreducibility
is over the reduced field factors, including inseparable characteristic-two representations.

Prove `IntegralRibet.modules_finite_of_lattice`: over noetherian `T`, this containment makes
`Δχ`, `Δψ`, `M₀` and `N` finite. Prove `IntegralRibet.lattice_submodule_topology`: for any ideal
`m`, a submodule of a finite module with its induced `m`-adic topology has that same topology
intrinsically, by [Artin–Rees, Stacks Lemma 10.51.2](https://stacks.math.columbia.edu/tag/00IN).
Prove `IntegralRibet.adic_quotient_topology`: for any module `M`, ideal `m` and submodule `Q`,
the `m`-adic topology on `M/Q` is the topology coinduced by `M → M/Q` from the `m`-adic
topology on `M`; the images of `mⁿM` are `mⁿ(M/Q)`
([Stacks §10.96](https://stacks.math.columbia.edu/tag/00M9)).
`IntegralRibet.cocycles_continuous_of_lattice` then gives continuity of both canonical cocycles
for their intrinsic adic topologies, assuming continuous `ρ`, `ψ`, and `T → K`, an adic topology
on `T`, and a topological ring `K`. This uses the preceding submodule comparison, scalar
multiplication and the two quotient maps. The algebraic construction is
[DKSW §2.1, equations (13)–(14), printed pp.8–9](https://arxiv.org/pdf/2310.16396v2).
*Needs:* Ribet module with local conditions, Mathlib noetherian submodules and quotient modules.

**Finite orders and the global coefficient ring.** `IntegralRibet.differences_le_order` says
that an `A`-subalgebra `Ω ⊆ M₂(K)` containing `ρ(G)` contains both character difference
modules. An arithmetic use of a finite coefficient order must establish `Module.Finite A Ω`,
containment of `ρ(G)`, and equality of the induced and adic topologies on `Ω`; compactness
alone supplies none of these three inputs over an arbitrary extension.

For the global case `K=Frac(T)` with `T` complete reduced noetherian local, prove
`Theorems.global_difference_lattice`: if each field-factor representation is irreducible
and all characteristic polynomials lie in `T[X]`, both difference modules lie in a finite
`T`-submodule of `M₂(K)`. This is an algebraic boundedness theorem, independent of compactness.
Its proof decomposes `K` into its finitely many field factors. The image algebra on a
two-dimensional irreducible factor is either the full matrix algebra or a quadratic field.
In the matrix case a basis selected from group elements and the nondegenerate matrix trace
pairing bound the coefficients by a finite trace-dual module. In the field case the image
elements are integral over the corresponding domain quotient of `T`; finite normalization
bounds them even for a purely inseparable quadratic field. SchemeAndStackFoundations §0.20
supplies `IsJapanese.of_complete_local` and `IsNagata.of_complete_local`:
the integral closure of a complete noetherian local domain in any finite extension of its
fraction field is finite, including inseparable extensions
([Stacks Lemma 10.162.8, tag 032W](https://stacks.math.columbia.edu/tag/032W)).
`Theorems.finite_integralClosure_complete` is only the specialization of that Japanese
condition to the fraction field and scalar tower used here. Consume these neutral ring-level
exports for the domain quotients of `T`.
The finite product of these bounds contains the original image and its scalar differences.
This supplies the boundedness step in [DKSW Theorem 1.1, pp.2–3 and §2.1, pp.8–9](https://arxiv.org/pdf/2310.16396v2).

`IntegralRibet.fraction_lattice_topology` proves the topology input for every finite submodule
of `M₂(Frac(T))`, assuming `T` noetherian local with its adic topology, a topological ring
structure on `Frac(T)`, and an embedding `T → Frac(T)`. Clear a common regular denominator
and use Artin–Rees inside a finite free `T`-module. Thus `T̃=T` supplies both inputs to the
canonical local theorem without changing the global hypotheses. *Needs:* SemisimpleAlgebras
layers 2–4, SchemeAndStackFoundations §0.20 `IsJapanese.of_complete_local` and
`IsNagata.of_complete_local` through `finite_integralClosure_complete`,
`lattice_submodule_topology`.

**Checks.** Each named Check is an `example` in Suggested.lean.

- `modules_finite_of_lattice_zero`: scalar data with no local places give the finite zero module.
- `modules_finite_of_lattice_unipotent`: integral upper-unipotent data give the finite nonzero
  quotient `M₀ ≃ ℤ`.
- `modules_finite_of_lattice_finite_extension`: if the matrix coefficients themselves lie in a
  finite `A`-algebra, the whole matrix module is a valid finite bound for every local datum.
- `adic_quotient_topology_two`: the `2`-adic topology on `ℤ/(4)` is the quotient of that on `ℤ`.
- `global_difference_lattice_specialization`: the unchanged global coefficient hypotheses supply
  both the finite lattice and its topology comparison by applying their actual suppliers.
- `global_difference_lattice_inseparable_trace`: in characteristic two, `J=[[0,t],[1,0]]`
  satisfies `J²=tI₂`, and every product in `k[J]` has matrix trace zero. When `t` is nonsquare,
  this algebra acts irreducibly, so its finite bound uses normalization instead of trace duality.
  `global_difference_lattice_nonsquare` checks that no nonzero vector is an eigenvector when
  `t` is nonsquare, retaining ordinary irreducibility in characteristic two.
- `modules_finite_of_lattice_infinite_residue`: if functionals `ℓᵢ : Δ → T/m` kill `Δ²`
  and take values `ℓᵢ(δⱼ)=δᵢⱼ`, the empty-local quotient is not finite. In particular take
  `k=𝔽₂(u₁,u₂,…)`, `k′=k(a₁,a₂,…)`, `aᵢ²=uᵢ`, `T=k[[t]]`, `T̃=k′[[t]]`,
  `J=[[0,t],[1,0]]`, and the compact group `∏_{i≥0} ℤ₂` acting by `I₂+J` in coordinate zero
  and `(1+aᵢtⁱ)I₂` in coordinate `i≥1`, with `χ=ψ=1`. Squarefree monomial weights
  `w(S)=Σ_{i∈S}i` show that extraction of the `aᵢtⁱ` scalar coefficient kills `Δ²` and
  separates those differences. Also `tΔ⊆Δ²`. The characteristic polynomials are integral
  and split modulo `t`, while `J` has no invariant line over `k′((t))`.
- `cocycles_continuous_of_lattice_discrete_obstruction`: an `m`-annihilated module is discrete
  for its adic topology. Nonzero canonical cocycle values on a sequence tending to the identity
  therefore exclude continuity. The coordinate generators in the preceding example give such
  a sequence. Its infinite quotient cannot satisfy the finite-lattice input.

**Every cocycle representative generates.** Let `(T, m)` be local, `M` a finite `T`-module and
`α : G → Tˣ` with `α(g) ≡ 1` modulo `m`. Prove that if a cocycle `κ` has `T`-span `M`, every
cohomologous cocycle `κ′(g) = κ(g) + (α(g) − 1)y` also has `T`-span `M` ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf),
Theorem 1.1 and §2.1, pp.3,9). *Needs:* [ProfiniteCohomology, layer 2][profinitecohomology2].

**Ribet theory for distinct residual characters.** Prove `Theorems.distinct_character_ribet`. Under the global hypotheses of this layer
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

`Theorems.ribetFieldRepresentation ρ φ` extends the coefficient-changed group action
linearly to `k[G]`. `Theorems.RibetIrreducibleOn` abbreviates `IsSimpleModule (k[G])`
on its `matrixModule`; `ribetIrreducibleOn_iff` specializes the same invariant-subspace
dictionary to group generators. The dimension-two field module is nonzero, so its
characterization needs no additional nonzero hypothesis.

**Checks for the Ribet predicates.** The scalar representation of `χ` satisfies
`Theorems.RibetCongruence` with `(χ,χ)` and ideal zero; the integer upper-unipotent
representation satisfies it with `(1,1)` and ideal zero. Every representation over `A` satisfies
it modulo the unit ideal, since its characteristic polynomial is already integral.
`Theorems.RibetIrreducibleOn` fails for a scalar representation over `ℚ` and for the integer
upper-unipotent representation after mapping to `ℚ`; it holds for the natural representation
of `GL₂(ℚ)`. `Theorems.RibetIrreducible` fails for scalar `ℚ` and integer upper-unipotent
representations, but holds vacuously over the zero coefficient ring, which has no maps to fields.
The total-fraction hypotheses in the extension theorems exclude that last input. All nine
cases are Lean examples. These predicates express the conditions of DKSW Theorem 2.1, pp.7–8.

**Checks for the triangular local input.** `local_input_empty` accepts arbitrary
representations when the place set is empty. For `G=ℤˣ`, `ρ(u)=uI₂`, ideal zero,
and one distinguished place with subgroup all of `G`, `local_input_scalar` constructs
local input with identity basis and both characters equal to `u`. For the same representation,
`local_input_wrong_character` rejects both prescribed characters equal to `1`: at `u=−1`
every conjugate is `−I₂`, so its second diagonal entry cannot be `1` in `ℤ`.
These are the empty case, a full structure, and a failed congruence for
`Theorems.RibetLocalInput` (DKSW Theorem 2.1 (9)–(11), pp.7–8).

### 6.2 Relation minors and the auxiliary matrices

**Five types of Ribet module relations.** Choose `ρ_i = ρ(g_i) − ψ(g_i)` spanning `Δψ` and adjoin
the `y_v`, and write `ν_i = ψ(g_i) − χ(g_i)`. Prove that a presentation of `N` consists of
relations of five types: (I) linear relations among the `ρ_i`; (II) the coefficients `δ_ijk` from
`(ρ_i + ν_i)ρ_j = ∑ δ_ijk ρ_k`; (III) the coefficients of `ρ(σ) − ψ(σ)`, `σ ∈ G_{v₀}`; (IV) those
for `σ ∈ I_v`; (V) those for `σ ∈ G_v` together with `ψ(σ) − χ(σ)` in the `y_v` column
([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §2.2, equations (18)–(24), pp.10–11). *Needs:* Ribet module with local conditions, Tau Ceti `TauCeti.fittingIdeal`.

**Stabilization of local relation rows.** Prove that adding each locally appearing
`ρ(σ) − ψ(σ)` as a new generator, with a defining relation and a pivot row, changes the
presentation but preserves its square relation determinant up to a chosen row/column ordering
sign; local rows then have one pivot and at most one `y_v` entry ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §2.3,
pp.11–12). *Needs:* Five types of Ribet module relations, Tau Ceti
`TauCeti.fittingIdeal_eq_minorsIdeal_ker`.

**Weighted auxiliary matrix.** For a stabilized square relation matrix `D` and local choices
`σ_v`, adjoin a block upper-triangular matrix `E` with diagonal `z_v = ξ_v(σ_v) − χ(σ_v)`: with
`t = |P|` and `D` of size `r + s`, `E` is the `(r + s + t)`-square matrix with the `t × t` diagonal
block `diag(z_{σ_v})`, the coefficients `α_{σ_v, j}` of `ρ(σ_v) − ψ(σ_v) = ∑_j α_{σ_v, j} ρ_j`
to their right, a zero block below, and `D` in the lower right. Prove
`det E = (∏_{v ∈ P} z_v) det D` ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §2.4, equation (28), p.12). Write `ρ_j =
ρ(g_j) − ψ(g_j) = [[a_j, b_j],[c_j, d_j]]` for the chosen generators, `x_σ = ξ_v(σ) − ψ(σ)` and
`a(σ) = ∑_j a_j α_{σ, j}`. The **altered matrix** `E′ ∈ M_{r+s+t}(K)` is obtained from `E` by
replacing each diagonal entry `z_{σ_v}` by `x_{σ_v} − a(σ_v)`, leaving rows of types (I) and (III)
unchanged, replacing in each type (II) row `δ_ijj` by `δ_ijj − a_i − ν_i` and `δ_iji` by
`δ_iji − d_j`, inserting `ξ_v(σ) − ψ(σ) − a(σ)` into the `v`-column among the first `t` columns of
each type (IV) row, and replacing the `y_v`-entry `ψ(σ) − χ(σ)` of each type (V) row by
`ξ_v(σ) − ψ(σ) − a(σ)` ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §2.4, equations (29)–(30) and the list (I)–(V),
pp.12–13). *Needs:* Stabilization of local relation rows.

**Kernel vector for the altered matrix.** Prove that the altered matrix `E′` just defined has,
on each principal artinian local factor `K_i`, a kernel vector with a unit coordinate. If all local
`D_v` are units, its entries are `−B_v/D_v`, the `b_i` and `−B_w/D_w`; otherwise multiply by a
maximal power of the principal maximal-ideal generator and normalize the corresponding local `D_v`
([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Lemma 2.4 and proof, pp.13–14). *Needs:* Weighted auxiliary matrix.

**Vanishing of the altered determinant.** With the source total-fraction-ring hypotheses, prove
`det E′ = 0` in `K` ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Lemma 2.4, pp.13–14). *Needs:* Kernel vector for the altered matrix.

**Trace congruences for difference words.** For a noncommutative polynomial `f(X₁, …, X_r)` with
zero constant term, prove `tr f(ρ₁, …, ρ_r) ≡ f(−ν₁, …, −ν_r)` modulo `I`, and also
`det(Δψ) ⊂ I`. These are integral rank-two identities ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Lemmas 2.5–2.6,
pp.15–16). *Needs:* Character congruence on the group algebra.

### 6.3 Formal matrix algebra and invariant error

**Formal Ribet matrix ring.** For a fixed finite relation minor, let
`R₀ = ℤ[ν_i, ε_(row,i), δ_(row,ijk), x_σ]` with distinct variables for each selected relation, let
`R₁ = R₀[a_i, b_i, c_i, d_i]` and define `IntegralRibet.formalRing` as
`R = R₁/(b_σ : σ ∈ B_{v₀})`, with distinct row-indexed coefficient variables. The matrices
`Y_i = [[a_i, b_i],[c_i, d_i]]` have a conjugation coaction of the lower Borel `B` of `GL₂/ℤ`, with
`R₀` trivial; define `IntegralRibet.formalRing_borel` as this integral lower-Borel conjugation
coaction, and `IntegralRibet.formalRing_eval` as the evaluation algebra map `π : R → K` determined
by the relation data, sending all variables to the chosen relation coefficients, differences and
local diagonal values ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §3.1, equations (35)–(37), pp.17–18). *Needs:* Five types of Ribet module relations.

**Checks.**

- With no matrices or relation variables, `R = ℤ`: the degenerate case, which a definition that
  always adjoined at least one generic matrix would fail.
- With one matrix and no `v₀` constraint, `R = ℤ[a, b, c, d]` apart from the `R₀` variables: no
  `b_σ` is killed, so a definition that imposed `b = 0` for every matrix rather than only for
  `σ ∈ B_{v₀}` would compute a smaller ring.
- Imposing `b = 0` gives `ℤ[a, c, d]`, whose lower-Borel torus fixes `a, d` and weights `c`: the
  coaction computes the weight of `c` as the ratio of the diagonal entries, so a definition using
  the upper Borel or the inverse weight would fail this.

**Checks for the formal coaction.** `IntegralRibet.formalRing_borel_matrix` specifies inverse
conjugation of each generic matrix; `formalRing_borel_coefficient` fixes the coefficient variables.
`formalComodule` is the right comodule obtained by interchanging the factors of this algebra map;
its coassociativity and counit are the full comodule axioms (DKSW Example 4.2, p.22).
The matching computations are `δ(u)=1⊗u` for a coefficient variable,
`δ(b)=(z/x)⊗b` for an upper-right entry, and `δ(a+d)=1⊗(a+d)`.
`formalRing_eval_matrix` and `formalRing_eval_coefficient` fix evaluation on every generator,
subject to the selected upper-right entries being zero.

**Formal Ribet relation ideals.** In the formal ring `R` define `IntegralRibet.relationIdeal` as
the full four-entry ideal `J` generated by the four entries of each linear relation matrix, each
product relation `(Y_i + ν_i)Y_j − ∑ δ_ijk Y_k`, and each local matrix
`[[A_στ, B_στ],[C_στ, D_στ]]`, where

```text
A_στ = b_σ c_τ − (x_τ − d_τ)(x_σ − a_σ),
B_στ = b_σ (x_τ − a_τ) − b_τ (x_σ − a_σ),
C_στ = c_σ (x_τ − d_τ) − c_τ (x_σ − d_σ),
D_στ = A_τσ.
```

Define `IntegralRibet.upperRelationIdeal` as the `b`-entry subideal `J′ ⊂ J` generated only by
their `b` entries. Prove `IntegralRibet.upperRelationIdeal_le` (`J′ ⊂ J`) and
`IntegralRibet.relationIdeal_stable` (`J` and `J′` are lower-Borel stable) ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf),
§3.2, (39)–(42), pp.18–19; Lemma 4.18, p.30). *Needs:* Formal Ribet matrix ring.

**Checks.**

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
`IntegralRibet.invariantSubring` as `A = A₀[d_τ : τ ∈ B_{v₀}]`, that is
`R₀[trace/determinant words, d_τ]`; this is the lower-Borel invariant subring after the specified
upper-entry quotient. Prove `IntegralRibet.trace_mem_invariantSubring` (every word trace lies in
`A`) and `IntegralRibet.invariantSubring_eq_borel` (`A = H⁰(B, R)`, with rational scheme
cohomology) ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §3.3, p.19; Corollary 4.17, p.27). *Needs:* Formal Ribet matrix ring.

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

**Koszul complex of a finite sequence.** For a commutative ring `A` and `x = (x₁, …, xₙ)` in `A`,
define `Koszul.complex` as `K(x)`, the exterior algebra `⋀(Aⁿ)` with the degree `−1` derivation
determined by `e_i ↦ x_i`, as a nonnegative chain complex with `K(x)_k = ⋀^k Aⁿ`. Prove
`Koszul.complex_d_one` (its first differential is `d₁(v) = ∑ x_i v_i`), `Koszul.homology_zero`
(`H₀(K(x)) = A/(x)`), `Koszul.complex_append` (`K(x, y) ≅ K(x) ⊗_A K(y)` for concatenated
sequences), `Koszul.map` (functoriality in the sequence: a linear map `g : Aⁿ → A^{n′}` with
`x′ ∘ g = x` induces a chain map `K(x) → K(x′)`) and `Koszul.isZero_homology_of_isWeaklyRegular`
(if `x` is weakly regular, `H_k(K(x)) = 0` for `k > 0`, so `K(x) → A/(x)` is a finite free
resolution) ([Stacks](https://stacks.math.columbia.edu), Definitions 15.29.1–15.29.2 (tags 0622, 0623), Lemma 15.29.3
(tag 0624), Lemma 15.29.12 (tag 0664) and Lemma 15.31.2 (tag 062F)). *Needs:* Mathlib
`ExteriorAlgebra`, `exteriorPower.map`, `RingTheory.Sequence.IsWeaklyRegular`.

Use the linear-functional API of Mathlib [PR #43708](https://github.com/leanprover-community/mathlib4/pull/43708):
`koszulComplex φ`, for a linear functional `φ : M →ₗ[A] A`, has exterior-power terms,
alternating-deletion differential, and `koszulComplex.map` induced by `φ′ ∘ g = φ`.
The finite-sequence notation here specializes this construction to
`φ(v)=∑ x_i v_i`; `complex_d_wedge` and `map_f` specify exactly those operations.
The tensor and homotopy interfaces follow [PR #43711](https://github.com/leanprover-community/mathlib4/pull/43711)
and [PR #43706](https://github.com/leanprover-community/mathlib4/pull/43706).
Build these contracts in Tau Ceti when absent from the pin and use Mathlib's declarations
when supplied; the local finite-sequence notation adds no competing complex construction.

**Checks.**

- `K(x)` for a single element is `A --x→ A` in degrees `1, 0`: the one-variable exterior algebra
  has two terms and the differential is multiplication by `x`, so a definition with the wrong
  degree convention or sign would fail here.
- `K` of the empty sequence is `A` in degree `0`: the degenerate case, which a definition that
  required at least one generator would not produce.
- Over `ℤ`, `K(2)` has `H₁ = 0` while `K(0)` has `H₁ = ℤ`; over `ℤ/4`, `K(2)` has `H₁ ≅ ℤ/2`, so
  acyclicity needs regularity: a definition asserting acyclicity without the weak-regularity
  hypothesis would be refuted by `ℤ/4`.

**Integral restriction to the lower Borel.** For `G = GL₂/ℤ`, its lower Borel `B`, every rational
`G`-module `V` and every `i ≥ 0`, prove that restriction `Hⁱ(G, V) → Hⁱ(B, V)` is an isomorphism.
Cohomology is derived scheme invariants, not cohomology of `G(ℤ)` ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Theorem
4.4, p.23). *Needs:* Rational cohomology of a flat affine group scheme, Invariant coordinate algebras under conjugation.

**Adjoint weight and dual identities.** For the inverse-conjugation coordinate representation `𝒜 = ℤA ⊕ ℤB ⊕ ℤC ⊕ ℤD`
of `B`, the submodule `V = ℤA ⊕ ℤB` has action `A ↦ A + (y/x)B`, `B ↦ (z/x)B`. Write `ℤ(1) = ℤB`.
Prove `∧²V ≅ ℤ(1)`, `V* ≅ V(−1)`, `V ⊗ V* ≅ 𝒜` and `V ⊗ V ≅ 𝒜(1)` ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Example
4.2, p.22; Lemma 5.10, p.42). *Needs:* Tau Ceti `TauCeti.Comodule`, Rational cohomology of a flat affine group scheme.

**Lower-Borel Hopf coordinates.** `IntegralRibet.lowerBorelRing` is
`ℤ[x,z,y,x⁻¹,z⁻¹]`. `borelCoordinate` orders these five generators as displayed.
`lowerBorelHopf` carries all Hopf axioms, and `borel_comul`, `borel_counit`,
`borel_antipode` specify them on every generator: `x,z` are group-like,
`Δy=y⊗x+z⊗y`, `ε(y)=0`, and `S(y)=−x⁻¹yz⁻¹`; the inverse coordinates are also group-like.
`borelRestriction_matrix` sends the generic `GL₂` matrix to `[[x,0],[y,z]]`.
`GoodFiltration.character a b=x^a z^b` and `character_coact` specifies the rank-one
coaction `m↦m⊗x^a z^b` (DKSW Definition 4.1 and Example 4.2, p.22;
Jantzen I.2.3, pp.21–22, and I.3.3, pp.38–39).

**Checks.**

- `xx⁻¹=1`, `zz⁻¹=1`, and `ε(y)=0`. The restriction map sends the upper-right coordinate
  to zero, the lower-left coordinate to `y`, and the determinant to `xz`.
- The universal coordinates satisfy `x≠1`, `y≠0`, and `x≠z`
  (`borel_x_not_one`, `borel_y_nonzero`, `borel_distinct_diagonals`).
  Evaluation at rational lower-triangular matrices with respective coordinates
  `(2,1,0)`, `(1,1,1)`, and `(2,3,0)` distinguishes these elements.
- For `g=[[2,0],[3,5]]` and `h=[[7,0],[11,13]]` over `ℚ`, the lower-left
  entry of `gh` is `3·7+5·11=76`, whereas that of `hg` is `61`.
  `lower_borel_product_order` computes both matrices and pins the order in `Δy`.
- Weights `(1,0)`, `(0,−1)`, `(0,0)` give respectively `x`, `z⁻¹`, `1`;
  their coactions on `1` give respectively `1⊗x`, `1⊗z⁻¹`, `1⊗1`.
- `induced 0 0` is `ℤ`, `induced 0 1` is zero, and `induced 0 (-1)` has underlying module
  `ℤ²`. Each of `induced 0 0`, `induced 1 0`, `induced 0 (-1)` has a one-step good
  filtration. A nonzero `H¹(G,M)` excludes `GoodFiltration.Has M`.

**Good filtrations and acyclicity.** For `G = GL₂/ℤ` with lower Borel `B`, algebraic induction of
a `B`-module `W` is `Ind_B^G(W) = (O[G] ⊗_ℤ W)^B`, with `B` acting on `O[G]` through right
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
`GoodFiltration.induced a b` is this induced module, formed from the actual
`IntegralRibet.borelRestriction` Hopf map and `GoodFiltration.characterComodule a b`.
`GoodFiltration.Data M` consists of comodules `V_n` with injective comodule maps into `M`,
zero initial image, increasing images exhausting `M`, and successive quotients either zero or
`induced a b` with `b≤a`. Quotient identifications are specified by surjective comodule maps
whose kernels are the preceding image. `GoodFiltration.Has M` is nonemptiness of this data.
This is the countable exhaustive form, without a homogeneity restriction; it includes finite
filtrations by allowing zero factors. Jantzen II.4.16, pp.210–211, supplies the field definition;
the integral vanishing and tensor statements use DKSW's integral results.
The exhaustive form is needed because the coordinate rings of Layer IHG.6.4 have infinite-rank
central-weight components; DKSW's
Definition 4.6 states only the finite case. Prove `GoodFiltration.acyclic` (a countably filtered `G`-module with a
good filtration is `G`-acyclic, `H^i(G, V) = 0` for `i > 0`: rational cohomology of a flat affine
group scheme commutes with filtered colimits, Jantzen I.4.17, p.57, so the finite case of DKSW
Theorem 4.7 gives the exhaustive one) and `GoodFiltration.tensor` (the tensor product of two
`G`-modules with good filtrations has a good filtration) ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Definition 4.6 and
Theorem 4.7, p.23; Theorem 4.8, p.24). *Needs:* Rational cohomology of a flat affine group scheme, Adjoint weight and dual identities.

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
For `B = {[[x,0],[y,z]]}`, `GoodFiltration.twistComodule M j` multiplies the right
coaction by `(z/x)^j = character (-j) j`; this is `M(j)` of Example 4.2,
equation (48), p.22. `twistedCohomology` abbreviates the existing
`RationalCohomology.cohomology` with that coaction. `borelCohomology` first restricts
from `GL₂` using `borelRestriction`. `restriction_equiv` is the restriction comparison
of Theorem 4.4, p.23. No new continuous group-cohomology carrier is involved.

For a countably exhaustively good integral `GL₂` module `V`, prove
`GoodFiltration.twisted_vanishing`: `H^i(B,V(j))=0` for natural `j` and `i>j`
(Lemma 4.11, p.24). `twist_one_equiv` identifies `H¹(B,V(1))` with `H⁰(GL₂,V)`;
`twist_one_integer` gives `H¹(B,ℤ(1))≅ℤ` (Lemma 4.12(1), p.24).
For `i>1`, `diagonal_twist_odd` gives zero after tensoring `H^i(B,V(i))` with `𝔽_p`
for each prime `p>2`; `diagonal_twist_two` identifies its reduction modulo two with
`H⁰(GL₂,V)⊗𝔽₂` (Lemma 4.12(2)–(3), pp.24–25). Filtered colimits extend the finite
calculations to these exhaustive filtrations (Jantzen I.4.17, p.57).

For an injective equivariant map of commutative integral `GL₂`-algebras `S→T`, both
good, `twistedInvariantProduct` is induced by `a⊗b↦f(a)b`, with the first factor
twisted and the second invariant. The algebra coactions must preserve multiplication
and the unit. `twist_one_product` and `diagonal_twist_two_product` assert that the
preceding identifications commute with this product; their proof uses
`RationalCohomology.connecting_invariantProduct`, not just a graded-ring structure.
`twistedInvariantProduct_surjective` says every diagonal class over `T` is a finite
sum of these products (Corollary 4.13, p.25). This is equivalently surjectivity of
the product map tensored over `H⁰(B,S)`; its Lean form uses the tensor product over
`ℤ`, whose map factors through the balancing relations.

**Finite twisted resolutions and triangular acyclicity.** Prove
`GoodFiltration.finite_twisted_resolution`: a B-module admitting a bounded augmented
exact chain complex with term `V_k(k)` in degree `k`, each `V_k` good, has zero
positive B-cohomology (Lemma 4.14, pp.25–26). The augmentation is surjective,
exactness is required at every term, and all maps and term identifications are
comodule maps. The bound is essential to the downward dimension-shifting argument.

`GoodFiltration.adjointComodule` is the rank-four adjoint coordinate representation
of Example 4.2, p.22; `adjoint_coact` specifies the inverse-conjugation coefficients
on the ordered matrix units. `adjointPower` uses left-associated tensor powers, with
`adjointPower_coact_zero` and `adjointPower_coact_succ` specifying the coactions.
Prove `adjointPower_good` and `adjointPowerFlat` for every natural power, including
zero (Corollary 4.9, p.24). `triangular_coordinate_acyclic` states that for a
**ℤ-flat** good `V`, every positive cohomology group of
`V⊗formalRing c n triangular` vanishes, after restriction to B and with the diagonal
tensor coaction (Theorem 4.15, p.26). The coefficient variables are fixed; any subset
of upper-right coordinates is killed. The proof tensors the regular-coordinate
Koszul resolution with `V` and applies `finite_twisted_resolution` to its terms.
`triangular_adjoint_acyclic` supplies this result for every adjoint tensor power
appearing in `D`; `fullRelationComplex_acyclic` applies it to all terms of that
complex (Proposition 5.5(2), pp.39–40).

**Checks.** `twist_one_nonzero`, `twist_zero_positive` and
`twist_one_above_diagonal` respectively give `H¹(B,ℤ(1))≠0`, `H¹(B,ℤ)=0` and
`H²(B,ℤ(1))=0`. Thus the bound is strict, and an arbitrary twist of a good module
is not asserted acyclic. The coaction sends `1` to `1⊗x⁻¹z` in twist one, `3` to `3⊗1` in twist zero,
and `1` to `1⊗xz⁻¹` in twist minus one (`twist_character_values` and its adjacent examples).
The zeroth adjoint
power is `ℤ`, and its first two powers have rational ranks `4` and `16`.

**Integral trace and determinant invariants.** For a `ℤ`-flat commutative `R₀` with trivial `G`
action, prove that the `GL₂` scheme invariants in `R₀[a_i, b_i, c_i, d_i]` are generated over `R₀`
by the traces and determinants of all matrices in the algebra of the generic matrices. The proof
establishes the integral trace/determinant generator theorem with its relations, then commutes
flat extension with the invariant equalizer; the standard `GL₂` representation and its dual are
distinct integral representations ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Theorem 4.16, pp.26–27). *Needs:*
Rational cohomology of a flat affine group scheme, Trace and determinant invariant subring.

**Invariants of entirely triangular matrices.** For `R = R₀[a_τ, c_τ, d_τ]`, obtained by setting
every `b_τ` to zero, prove `R^B = R₀[a_τ, d_τ]` ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Corollary 4.17, first part,
p.27). *Needs:* Adjoint weight and dual identities.

**Invariants of the formal Ribet ring.** For the formal ring `R` with the chosen `b_τ = 0`
constraints, prove `H⁰(B, R) = A₀[d_τ]`, the subring specified above ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf),
Corollary 4.17, pp.27–28). *Needs:* Integral trace and determinant invariants,
Invariants of entirely triangular matrices, Koszul complex of a finite sequence.

**Lower-Borel stability of relation ideals.** Under `g = [[x, 0],[y, z]]`, prove that each
relation quadruple transforms by inverse conjugation as

```text
A ↦ A + (y/x)B,
B ↦ (z/x)B,
C ↦ (x/z)C − (y/z)A − (y²/xz)B + (y/z)D,
D ↦ D − (y/x)B,
```

so that `J` and its `b`-entry ideal `J′` are `B`-stable ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Lemma 4.18,
pp.29–30; Example 4.2, p.22, for the action formulas). For the local quadruples this is
`IntegralRibet.localRelationMatrix_conj`, which follows from the identity
`[[A,B],[C,D]] = −(x_σ − Y_σ)·adj(x_τ − Y_τ)` (`localRelationMatrix_eq_adjugate`, proved in
`Suggested.lean`) because `adj(g⁻¹Mg) = g⁻¹ adj(M) g`; the linear and product rows are linear
combinations of products of the `Y_i`, so `relationIdeal_stable` applies to every row. *Needs:* Formal Ribet relation ideals, Adjoint weight and dual identities.

### 6.5 Buchsbaum–Rim complexes and generic regularity

**Composition of exterior contractions.** For a module `U` over a commutative ring, `λ₁, …, λ_r`
homogeneous alternating forms on `U` and `β ∈ ∧U`, prove that determinant contraction satisfies
`ω(λ₁ ∧ … ∧ λ_r)(β) = (−1)^{r+1} ω(λ₁) ⋯ ω(λ_r)(β)`, with the sign convention of Buchsbaum §1; the
formula defines all signs in the bar differential ([Buchsbaum](https://people.brandeis.edu/~buchsbau/miscpapers/009.pdf), Lemma 1.1,
pp.184–185). In Lean this is `BuchsbaumRim.omega_mul` (`ω(λ∧μ) = −ω(λ)∘ω(μ)`), which iterates to
the displayed sign. *Needs:* Koszul complex of a finite sequence.

**Checks.** For the exterior-contraction convention, on `ℤ²` with its ordered basis,
`ω(e₁* ∧ e₂*)(e₁ ∧ e₂) = det([[1,0],[0,1]]) = 1`, whereas
`ω(e₁*)ω(e₂*)(e₁ ∧ e₂) = 0·0 − 1·1 = −1`.
Thus the two-form composition has the minus sign in Buchsbaum's Lemma 1.1.
`BuchsbaumRim.contractOne` acts on actual exterior powers and is characterized by the
alternating deletion formula `contractOne_wedge`. `contractTwo ℓ μ` is the negative of
`contractOne ℓ ∘ contractOne μ`; `contractTwo_wedge` gives the two-by-two determinant.
Its three Checks are zero for equal covectors, a sign change when they are interchanged,
and value `1` on the two ordered dual-basis forms and the ordered basis wedge. For
`contractOne`, the one-vector value is `ℓ(v)`, the two-vector value is
`ℓ(v)w−ℓ(w)v`, and a zero covector gives zero. The displayed two-term composite is now
an equality of values of these exterior-power maps in Lean.

**Exterior-bar construction.** For `f : U = Rⁿ → W = Rᵐ`, define Buchsbaum's contraction
`BuchsbaumRim.omega : ∧(W*) → End(∧U)` on the whole exterior algebras as `−ω′`, where `ω′` is the
algebra map extending `ℓ ↦ −(ℓ ⌋ ·)` (Mathlib `ExteriorAlgebra.lift` of
`CliffordAlgebra.contractLeft`); this is exactly the sign rule of Buchsbaum's Lemma 1.1, and
`BuchsbaumRim.contractOne_eq_omega` identifies the graded one-form contraction with it. On
`BuchsbaumRim.barModule m n k = (∧W*)^{⊗k} ⊗ ∧U` define `BuchsbaumRim.barDifferential`,
characterized by `barDifferential_tprod`: on `λ₀ ⊗ ⋯ ⊗ λ_k ⊗ α` it is
`λ₀ ⊗ ⋯ ⊗ λ_{k−1} ⊗ ω(∧f*(λ_k))[α] + (−1)^{k+1} ∑_{i<k} (−1)^i λ₀ ⊗ ⋯ ⊗ (λ_i ∧ λ_{i+1}) ⊗ ⋯ ⊗ α`
(Buchsbaum §1, p.185, with his `d(n)` for `n = k+1` factors). `BuchsbaumRim.barSubmodule p q k`
is `T(f; k; p, q)`: the span of pure tensors whose first form has degree `≥ q`, whose other forms
have degree `≥ 1`, and whose vector factor has degree `p` plus the total form degree (Buchsbaum
p.187: `r ≥ 0` and `s(i), t(i) ≥ 1`); `barDifferential_mem` says the differential preserves it.
Every higher term and differential of the two Buchsbaum–Rim complexes below is pinned to this
construction; with all signs `+`, the composite `d₁d₂` vanishes because `∧^{m+1}W = 0`, so this
is the mapping-cone complex `K(f; p, q)` up to the sign normalization fixed by `d₂`.
*Needs:* Mathlib `CliffordAlgebra.contractLeft`, `ExteriorAlgebra.lift`, `ExteriorAlgebra.map`,
`LinearMap.dualMap`, `TensorPower`.

**Checks.** On `(ℤ²)*`, `ω(e₀* ∧ e₁*)[v ∧ w] = v₀w₁ − w₀v₁`, the positive determinant of Buchsbaum's
formula with `σ = (1,2)`; in rank one the bar differential of one form is the contraction
`ω(f*e*)`; and `e* ∧ e* = 0` in `∧(ℤ¹)*`, so in rank one no merge survives and the bar complex is
the Koszul complex. On `1 ⊗ e* ⊗ e` in rank one with `f = id` the bar differential is
`1 ⊗ 1 + e* ⊗ e`, fixing the sign `+` of the merge term (`bar_merge_sign`). For `barSubmodule`: in bar degree zero it is `∧ᵖU` carried by the empty
tensor (`bar_degree_zero`); a first form of degree `0 < q` is excluded (`bar_low_form_rejected`);
and `vol* ⊗ (e₀∧e₁∧e₂)` lies in the degree-two term of `BR` for `ℤ³ → ℤ²` (`bar_degree_two_br`).
These are Lean examples in the `ExteriorBar` section.

**Buchsbaum–Rim module complex.** The carriers accept all natural `m,n`; their
specified low terms below also cover rank zero. The regularity and resolution results
require `1≤m≤n`. For `R` commutative and `f : U = Rⁿ → W = Rᵐ`, `1 ≤ m ≤ n`,
define `BuchsbaumRim.moduleComplex` as `BR(f) = K(f; 1, m)`, a nonnegative finite free chain
complex built with the exterior-bar mapping cone of Buchsbaum §1: its degrees `0, 1` are `W, U`
with `d₁ = f`, and `d₂ : ∧ᵐW* ⊗ ∧^{m+1}U → U` is the signed maximal-minor contraction, which for
`m = 2` sends the basis triple to `r_ij e_k + r_jk e_i + r_ki e_j`. In degree two the term `∧ᵐW* ⊗ ∧^{m+1}U` is written `∧^{m+1}U` through the ordered dual volume
`e₀*∧⋯∧e_{m−1}*` (`moduleComplex_X_two`), and in degree `k+3` it is
`T(f; k+2; 1, m)` (`moduleComplex_X_bar`); `moduleComplex_d_two`, `moduleComplex_d_three` and
`moduleComplex_d_bar` identify every differential from `d₂` on with the exterior-bar differential.
Prove
`BuchsbaumRim.moduleComplex_d_one` (its degree-one differential is `f`) and
`BuchsbaumRim.moduleComplex_rank_one` (for `m = 1` this is `K(x)` of the row `x`)
([Buchsbaum](https://people.brandeis.edu/~buchsbau/miscpapers/009.pdf), §1 pp.185–187; DKSW23 §5.3.1 equation (60)). *Needs:* Composition of exterior contractions, Koszul complex of a finite sequence, Mathlib
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

**Buchsbaum–Rim determinant complex.** For the same `f`, define `BuchsbaumRim.determinantalComplex`
as `DetBR(f) = K(f; m, 1)` with its determinant-line degree zero: degree zero is `∧ᵐW`; degree
`k ≥ 1` is the direct sum over `s₁, …, s_{k−1} ≥ 1` of `(⊗_j ∧^{s_j} W*) ⊗ ∧^{m + ∑ s_j} U`; its
first differential is `∧ᵐf`, with the exterior-bar differential in higher degrees: degree `k+2`
is `T(f; k+1; m, 1)` (`determinantalComplex_X_bar`), `d₂` is `λ ⊗ α ↦ ω(∧f*(λ))[α]`
(`determinantalComplex_d_two`), the higher differentials are `barDifferential`
(`determinantalComplex_d_bar`), and `determinantalComplex_map_bar` gives the comparison map
as `id ⊗ ∧g` in those degrees. Prove
`BuchsbaumRim.determinantalComplex_d_one` (`d₁ = ∧ᵐf`), `BuchsbaumRim.determinantalComplex_map`
(if `f′ ∘ g = f` then `∧g` gives `DetBR(f) → DetBR(f′)`, retaining the same target `W`) and
`BuchsbaumRim.determinantalComplex_homology_zero` (after choosing `det(W) ≅ R`, `H₀ = R/I_m(f)`)
([Buchsbaum](https://people.brandeis.edu/~buchsbau/miscpapers/009.pdf), §1 p.186; DKSW equation (62), p.37). *Needs:* Buchsbaum–Rim module complex.

**Checks.**

- For `m = 1` it equals the usual Koszul complex, including its integral signs: a definition whose
  bar signs disagreed with the Koszul signs would differ already in rank one.
- For `f : R² → R²`, the complex is `R --det(f)→ R` in degrees `1, 0`: the single maximal minor
  is computed, so a definition with higher nonzero terms in the square case would fail.
- For a generic `2 × 3` matrix, `d₁` has generators `r₁₂, r₁₃, r₂₃` and `d₂` has the two column
  syzygies; no division by `2` occurs, so a definition that normalised the bar differential by
  factorials would not be integral.

**Regularity of a finite free map.** For an ordered finite free map `f : Rⁿ → Rᵐ`, define `BuchsbaumRim.IsRegular` as the predicate that `H₁(BR(f|_{Rᵏ})) = 0` for
every `m ≤ k ≤ n` (all prefix first homology groups vanish). For `n<m` the predicate is vacuous; its
exactness theorem requires `1≤m≤n`. No noetherianity, domain hypothesis
or nonzero-cokernel condition is imposed, and properly regular adds `coker(f) ≠ 0`. Prove
`BuchsbaumRim.IsRegular_prefix` (a prefix of length at least `m` of a regular map is regular) and
`BuchsbaumRim.IsRegular_rank_one` (for `m = 1` it is weak regularity of the ordered Koszul
sequence; proper regularity also requires a nonzero quotient) ([Buchsbaum](https://people.brandeis.edu/~buchsbau/miscpapers/009.pdf), §3
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

**Exactness of regular Buchsbaum–Rim maps.** Prove `Theorems.buchsbaum_rim_exactness`. Prove that if `f` is regular, then `H_i(BR(f)) = 0`
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

**Regularity of a generic two-column map.** Prove `Theorems.generic_two_column_regularity`. For every commutative `R₀` and `n ≥ 2`, prove that
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

**Weak regularity of generic linear equations.** Prove `Theorems.generic_linear_regularity`. For arbitrary commutative `R₀`, generic `m × n`
coefficients `α_ij` with `m ≤ n`, and `c_i ∈ R₀[α_ij]`, prove that the sequence
`∑ α_ij x_j − c_i` is weakly regular in `R₀[α_ij, x_j]`, and that if the final quotient is nonzero
it is regular in Mathlib's stronger convention ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Proposition 5.13, pp.44–45).
*Needs:* A pivot chart for generic linear sequences, Cancellation of pivot denominators.

**Mixed minor and linear resolutions.** Let `R = R₀[b′₁, …, b′_n, b₁, …, b_{n+r}, V_ij]`,
partition `{1, …, n}` into blocks `S_a`, let `f_a` have columns `(b_j, b′_j)` for `j ∈ S_a`, and
add `f_{k+1}(e_i) = ∑_{j ≤ n+r} V_ij b_j` for `i ≤ r`. Prove that `⊗_a DetBR(f_a)` resolves the
quotient by the sum of their image-minor ideals, with singleton blocks interpreted as zero local
ideal and omitted ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Proposition 5.14, p.46). *Needs:* Regularity of a generic two-column map, Weak regularity of generic linear equations,
Tensor resolutions of ordered determinantal ideals.

**Generic variable count for the Ribet relations.** Prove that after the presentation
stabilization, the formal `b`-entry ideal `J′` consists of local `2 × 2` minors and `r` generic
linear equations with exactly `r` `b` variables not assigned to a local block: type III
contributes one row for each assigned local generator, and subtracting these from the square
presentation leaves the required equality of counts ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §5.9 final paragraph,
p.46). *Needs:* Stabilization of local relation rows, Formal Ribet relation ideals.

**Checks for prefixes and maximal minors.** `BuchsbaumRim.prefixMap_apply` specifies
extension by zero into the first `k` coordinates. The empty prefix is zero, the full prefix is
`f`, and the first column of `[[2,3],[4,5]]` applied to `7` gives `(14,28)`.
`BuchsbaumRim.maximalMinorIdeal` is the unit ideal for the `2×2` identity, zero for the
zero `2×3` matrix, and `(6)` for `diag(2,3)` over `ℤ`. These six Lean examples distinguish
column order, maximal-minor size and the empty-prefix convention; the source is Buchsbaum,
§§2–3, with the ordered-prefix regularity convention used above.

### 6.6 The two relation complexes

**Upper-entry relation complex.** The Lean carrier `IntegralRibet.upperRelationComplex`
is the underlying module complex for arbitrary commutative `R`, a finite sequence of scalar
relations, and a finite family of maps `R^{n_v}→R²`. Its degree zero is literally `R`.
For the formal Ribet ring and its `b`-entry relations, equip this carrier with the
coactions specified in `IntegralRibet.relationComplex_equivariant_comparison` below; its
mathematical construction is
`IntegralRibet.upperRelationComplex` as the specified tensor complex

```text
C = Koszul(f) ⊗_R ⊗_v DetBR(f_v)(−1),
```

where `f(e_i) = L_i` and `f_v(e_σ) = A ⊗ b_σ + B ⊗ (x_σ − a_σ)` in `V_R`; degree zero is `R`,
`im(d₁) = J′`, and each local determinant-line twist `(−1)` is retained. On underlying modules this
is `IntegralRibet.upperRelationComplex_tensor`: the carrier is isomorphic to
`Koszul.complex L ⊗ IntegralRibet.tensorFamily (t ↦ BuchsbaumRim.determinantalComplex f_t)`,
the tensor product in the given order (the empty family is the unit complex `R`). Prove
`IntegralRibet.upperRelationComplex_image` (its degree-one image is `J′`) and define
`IntegralRibet.upperRelationComplex_augmentation` as the natural augmentation `C → R/J′`
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

**Exactness of the upper-entry resolution.** Prove that the augmented upper-entry complex
`C → R/J′` is a finite free resolution ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Proposition 5.5(1) and §5.9,
pp.39,46). *Needs:* Upper-entry relation complex, Mixed minor and linear resolutions, Generic variable count for the Ribet relations.

**Full-entry relation complex.** The underlying construction takes linear/product matrix rows,
a finite family of local sizes, and for each local block the actual matrices `Y_σ` and scalars
`x_σ`. Define `IntegralRibet.fullRelationIdeal` to be the sum of the entry ideal of the rows and
the entries of `localRelationMatrix Y_σ Y_τ x_σ x_τ` for distinct pairs in the same block.
Define `IntegralRibet.fullRelationComplex` as the underlying `R`-module tensor complex `D`, the tensor product of the adjoint multilinear Koszul
subcomplex and the local distinct-block determinant subcomplexes as `R`-module complexes.
`IntegralRibet.fullRelationComplex_multilinear` specifies its construction for arbitrary
commutative `R`: the matrix-row factor in degree `a` is the sum, over increasing
`a`-tuples of distinct row indices, of one tensor product of `a` copies of `M₂(R)`;
its differential deletes one factor with sign `(−1)^j` and evaluates that factor
against the corresponding row entries. The local degree `b≥1` factor is the sum,
over `s₁,…,s_{b−1}∈{1,2}` and increasing tuples of `2+∑s_i` distinct local
indices, of `(⊗_i ∧^{s_i}(R²)*) ⊗ (R²)^{⊗(2+∑s_i)}` with the determinant line
trivialized by the ordered basis. The differential is the restriction of the
exterior-bar differential for the map whose two columns at index `σ` are
`(x_σ−d_σ,c_σ)` and `(b_σ,x_σ−a_σ)`. Prove these submodules are closed under
that differential. Tensor these factors in the given index order, with the usual
homological tensor sign, to obtain `fullRelationComplex`, and require the comparison
isomorphism to send each ordered pure tensor to its displayed wedge. In Lean the row factor is
`IntegralRibet.rowComplex U` (`M₂(R) → R`, `Z ↦ ∑ U_{ij}Z_{ij}`, via `rowFunctional`), the local
map is `IntegralRibet.localColumns` (index `(σ, ε)` through `finProdFinEquiv`), and the local
factor `IntegralRibet.localDistinctComplex` is pinned by a degreewise injective chain map
`localDistinctComplex_ι` into `DetBR(localColumns)`, with injectivity stated by
`IntegralRibet.localDistinctComplex_ι_injective`, whose image is everything in degree zero,
the `IntegralRibet.distinctWedges` in degree one (`localDistinctComplex_range_one`), and the bar
tensors with a distinct-index vector factor from degree two on (`localDistinctComplex_range_bar`).
`IntegralRibet.fullRelationComplex_multilinear` is the isomorphism of `fullRelationComplex`
with `tensorFamily rowComplex ⊗ tensorFamily localDistinctComplex`.

**Checks for the tensor and local carriers.** `tensorFamily` of the empty family has zeroth homology `ℤ` over `ℤ`
(`tensor_family_empty`), of one complex is that complex (`tensor_family_single`), and
`K(2) ⊗ K(3)` over `ℤ` has `H₀ = ℤ/(2,3) = 0` (`tensor_family_two_koszul`). `rowFunctional`
against the identity row is the trace (`5` at `[[2,7],[11,3]]`), against `E₀₁` reads `7`, and the
zero row gives `0` (`row_functional_values`); `rowComplex U` is `M₂(R) → R` with
`H₀ = R/(U_{ij})` and zero above degree one (`row_complex_homology`, `row_complex_terms`).
`localColumns` for `Y = [[1,2],[3,4]]`, `x = 9` has columns `(5,3)` then `(2,8)`, fixing their
order (`local_columns_orientation`), and its single maximal minor is `(x−d)(x−a) − bc`
(`local_columns_maximal_minor`). `distinctWedges` contains `e_{(0,0)}∧e_{(1,1)}` and `1` but not
`e_{(0,0)}∧e_{(0,1)}` (`distinct_wedges`). `localDistinctComplex` is `R` in degree zero
(`local_distinct_degree_zero`), vanishes in positive degrees for one local index
(`local_distinct_single`), and has a rank-four degree-one term for two indices
(`local_distinct_pair`). Thus this is
a construction contract in every degree, not just an assertion about module ranks.
The equivariant comparison target below supplies the coactions on the formal input.
Prove `IntegralRibet.fullRelationComplex_image` (`D₀ = R` and its degree-one image is
`J`) and `IntegralRibet.fullRelationComplex_terms` (each `D_k` is a direct sum of adjoint tensor
powers of the free rank-four matrix module). Exactness in positive degrees is not part of this construction
([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §5.4 equation (66), p.39). *Needs:* Koszul complex of a finite sequence, Buchsbaum–Rim determinant complex.

**Checks.**

For `fullRelationIdeal`, the matching cases are: empty input gives zero; one matrix row with no
local blocks gives the ideal of its four entries; one local block of size one contributes zero,
regardless of its matrix and scalar, because there is no distinct pair.

- Without relation blocks, `D = R` in degree zero and `J = 0`: the empty case, which a
  construction with a mandatory factor would fail.
- A single matrix relation has `D₁ = A ⊗ R → R` with its four entries, and no repeated-block
  exterior terms: the degree-one term is one copy of the adjoint, so a construction keeping
  wedges from the same block would have extra terms.
- For two distinct local blocks the four basis wedges give all four local relation entries, while
  wedges from one block alone are excluded: the image is exactly `J_v`, so a construction that
  admitted same-block wedges would enlarge the degree-one image beyond `J`.

**Equivariant comparison of the relation complexes.**
`IntegralRibet.relationComplex_equivariant_comparison` has as input the formal ring,
the selected type I and II matrix rows, the local matrices and scalars arising from a
stabilized relation minor, and their specified lower-Borel coactions. Its Lean signature
states the equivariance part over `formalRing c n triangular`: every selected matrix row
and local matrix transforms by `lowerBorelConjugate`, and each local scalar is invariant.
These equations hold for the selected type I and II rows; the equivariance construction
itself does not require the variable-count condition used for exactness.
`upperLocalColumns` sends the local basis vector at `σ` to `(b_σ, x_σ−a_σ)`.
`upperRelationComplex_borel` and `fullRelationComplex_borel` give the degreewise right
comodules by the tensor constructions below. The comparison theorem asserts their
agreement with `formalComodule` in degree zero, equivariance of every differential,
and equivariance of `relationComplex_comparison`, whose degree-zero component is the identity.
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
`C` is exact for this formal relation input, and that every term of `D` is Borel-acyclic.
The finite truncations resolving the ideals then give the zero maps
`H^j(B,J′)→H^j(B,J)` for `j≥1`. This is the bridge used by invariant lifting;
exactness is not claimed after an arbitrary specialization of the relation coefficients
(DKSW Theorems 4.22–4.23, pp.33–34; Proposition 5.5 and Lemmas 5.6–5.10, pp.39–42).

`GoodFiltration.relationComplex_resolution_comparison` states the finite comparison
on these actual carriers (DKSW Theorem 4.23, p.33; Proposition 5.5, pp.39–40).
Its hypotheses require each local two-row map to be Buchsbaum–Rim regular modulo
earlier local minor ideals (`relationPrefixIdeal`), and the ordered scalar row entries
to be weakly regular modulo all local minor ideals. Tensor exactness is proved in
that order; the tensor symmetry places the Koszul factor first in the displayed `C`. Empty and singleton local blocks contribute
zero minor ideals. The generic regularity and variable count of §6.5 supply these
hypotheses for the stabilized formal presentation. The prefix Checks give zero at
index zero, the sum of all local minor ideals at the number of blocks, and the same
ideal one index beyond that bound (`relation_prefix_zero`, `relation_prefix_all`,
`relation_prefix_beyond`). Its conclusions are positive-degree
exactness of `C`, boundedness of both complexes, the equivariant comparison with
identity in degree zero, and B-acyclicity of every term of `D`.
`RationalCohomology.finite_comparison_zero` applies to the ideal-augmented truncations:
replace degree zero by `J′` and `J`, and retain the positive terms. With upper exactness,
a finite upper bound and acyclic positive lower terms, it gives the zero induced map
`H^j(B,J′)→H^j(B,J)` for every `j>0` (Theorem 4.22, pp.33–34).

**Checks for the local-column orientation.** Write the two columns at `σ` as
`A_σ=(x_σ−d_σ,c_σ)` and `B_σ=(b_σ,x_σ−a_σ)` and order `σ` before `τ`.
The wedges `A_σ∧A_τ`, `A_σ∧B_τ`, `B_σ∧A_τ`, `B_σ∧B_τ` map to
`−C_στ,−D_στ,A_στ,B_στ`. For
`Y_σ=[[1,2],[3,4]]`, `Y_τ=[[5,6],[7,8]]`, `x_σ=9`, `x_τ=10`,
the four values are `29,7,−2,−38`; `local_column_orientation` computes all four
in Lean. A singleton local index has no such wedge. This fixes the local signs in
DKSW Lemma 5.9, p.42, without identifying repeated-index wedges with relations.

### 6.7 Invariant determinant comparison and extension theorems

**The determinant difference in the formal error ideal.** For the formal versions of `E, E′`,
prove that their determinant difference `e = det E′ − det E` lies in
`I_R = (a_i + ν_i, b_i, c_i, d_i)` ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §3.3, p.19). *Needs:* Weighted auxiliary matrix, Formal Ribet matrix ring.

**Pairing determinant terms along a local column.** Suppose a square matrix has a distinguished
column whose nonlocal entries lie in `J′`, each local row has entries `b_σ` and `x_σ − a_σ` in
that column and its unique place column, and same-place `2 × 2` minors lie in `J′`. Prove that its
determinant belongs to `J′` ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Lemma 4.20, equation (54), pp.31–32). *Needs:*
Formal Ribet relation ideals.

**Unipotent invariance for product rows.** Prove that replacing every product row of `E′` by its
image under the lower unipotent universal element `τ_t` leaves `det E′` unchanged modulo `J′`
([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Lemma 4.20, pp.31–32). *Needs:* Pairing determinant terms along a local column, Lower-Borel stability of relation ideals.

**Unipotent invariance for one local block.** Prove that changing the local rows for one place
from `x_σ − a_σ` to `x_σ − a_σ − t b_σ` leaves `det E′` unchanged modulo `J′`, even when earlier
local blocks have already changed ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Lemma 4.21, pp.32–33). *Needs:* Pairing determinant terms along a local column, Lower-Borel stability of relation ideals.

**Borel invariance of the determinant difference.** Prove that the image of
`e = det E′ − det E` in `R/J′` is `B`-invariant ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Lemma 4.19, pp.30–33).
*Needs:* Unipotent invariance for product rows, Unipotent invariance for one local block.

**Lifting the invariant error across the full ideal.**
`RationalCohomology.invariant_lifting` applies to the two short exact sequences
`0→J′→R→R/J′→0` and `0→J→R→R/J→0`, their inclusion and quotient maps,
and the zero map on `H¹`. It places the image of `H⁰(B,R/J′)` inside the image of
`H⁰(B,R)→H⁰(B,R/J)`, by naturality and exactness of the connecting maps. Prove that the image of `e` in `R/J` lies
in the image of `H⁰(B, R) = A` ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), §4.4 exact sequence (52), p.29). *Needs:*
Borel invariance of the determinant difference, Equivariant comparison of the relation complexes, Invariants of the formal Ribet ring.

**Formal determinant comparison.** Prove `IntegralRibet.formal_determinant_comparison`.
For every stabilized relation minor under the full local Ribet
input, prove that `det E′ − det E` evaluates into `Ĩ`; since `π(det E′) = 0` in `K` and
`det E = (∏_{v∈P} (ξ_v(σ_v) − χ(σ_v))) det D`, this gives the weighted relation-minor containment
in `Ĩ`. The proof writes the determinant difference as an invariant lift plus a full relation: its
invariant lift belongs to the character-error intersection, and evaluation kills the full relation
ideal; this is combined with the vanishing of the altered determinant and the weighted auxiliary
determinant identity ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Proposition 3.3, p.21; §§4.4–4.6). *Needs:* The determinant difference in the formal error ideal, Lifting the invariant error across the full ideal, Invariant intersection with the character error ideal,
Vanishing of the altered determinant.

**Weighted Fitting containment.** Prove `Theorems.weighted_fitting_containment`. Assume
`Module.Finite T N` for the prescribed local quotient, together with Theorem 2.1’s hypotheses, including `χ ≡ ψ`
modulo `m`, local triangularizations `diag(η_v, ξ_v)`, `ξ_v ≡ ψ` on `Σ`, `ξ_v ≡ χ` on `I_v` for
`v ∈ P`, and chosen `σ_v ∈ G_v`, prove that the finite local quotient `N` satisfies

```text
(∏_{v∈P} (ξ_v(σ_v) − χ(σ_v))) · Fitt₀_T(N) · T̃ ⊆ Ĩ.
```

The containment is in `T̃`; the local factors need not belong to `T` ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf),
Theorem 2.1, equation (12), pp.7–8). Finiteness is a premise of this conditional theorem;
`modules_finite_of_lattice` supplies it when a finite bound is given. *Needs:* Formal determinant comparison.

The proof-plan edges are as follows; each names the result that supplies it.

1. Rational-cohomology functoriality and exact sequences → the twisted calculations:
   `RationalCohomology.map_id`, `map_comp`, `connecting_exact` and
   `GoodFiltration.restriction_equiv` supply the functorial and dimension-shifting
   inputs to `twisted_vanishing`, `twist_one_equiv`, `diagonal_twist_odd` and
   `diagonal_twist_two` (DKSW Lemmas 4.11–4.12).
2. Twisted calculations → triangular-coordinate acyclicity:
   `finite_twisted_resolution` supplies the dimension-shifting criterion;
   `triangular_coordinate_acyclic` applies it to the coordinate Koszul resolution,
   and `adjointPower_good` with `triangular_adjoint_acyclic` supplies the tensor powers
   in `D` (Lemma 4.14 and Theorem 4.15).
3. Triangular-coordinate acyclicity → equivariant `C→D` comparison:
   `fullRelationComplex_acyclic` supplies lower-term acyclicity;
   `IntegralRibet.relationComplex_equivariant_comparison` supplies the coactions and map;
   `GoodFiltration.relationComplex_resolution_comparison`, using §6.5 regularity,
   supplies exactness and boundedness (Theorem 4.23).
4. Equivariant comparison → the zero maps `H^j(B,J′)→H^j(B,J)`:
   `RationalCohomology.finite_comparison_zero` supplies the cascade (Theorem 4.22).
5. The zero map on `H¹` → invariant lifting:
   `RationalCohomology.invariant_lifting` supplies the comparison of invariant images
   (equation (52), p.29). For the computation of `H⁰(B,R)`,
   `connecting_invariantProduct`, `twist_one_product` and `diagonal_twist_two_product`
   supply product compatibility and `twistedInvariantProduct_surjective` supplies
   Corollary 4.13; `IntegralRibet.invariantSubring_eq_borel` supplies the formal-ring
   invariant description (Corollary 4.17).
6. Invariant lifting → formal determinant comparison:
   `IntegralRibet.formal_determinant_comparison` combines that lift with the
   invariant character-error intersection and evaluation of the relation ideal
   (Proposition 3.3, p.21).
7. Formal determinant comparison → weighted Fitting containment:
   `Theorems.weighted_fitting_containment` applies the comparison to the stabilized
   relation minors and their weighted auxiliary determinants (Theorem 2.1(12), pp.7–8).

**Ribet extension with all local conditions.** Prove `Theorems.local_ribet_theorem`. For a noetherian inclusion `T ⊆ T̃`, `T` local and
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
explicitly for the canonical construction). *Needs:* `modules_finite_of_lattice`,
`cocycles_continuous_of_lattice`, Weighted Fitting containment.

**Irreducibility excludes an exact split determinant.** Under the global Ribet hypotheses with
`T` nonzero, prove that the congruence ideal `I` cannot be zero: otherwise the determinant on
every field-factor representation is the direct sum of the two `T`-valued characters,
contradicting its irreducibility. When `I = 0`, the proof extends the character-polynomial
identity from group elements to the full group algebra and applies semisimple determinant
reconstruction in a field factor; an irreducible two-dimensional factor cannot have the split
character determinant ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Theorem 1.1 and its reduction to Theorem 2.1,
pp.2–3, 7–8). *Needs:* Faithful quotients over arbitrary fields, Character congruence on the group algebra.

**Ribet extension without residual distinctness.** Prove `Theorems.global_ribet_theorem`. Let `T` be complete reduced noetherian local,
`I ⊆ T` any ideal, `G` compact and `ρ : G → GL₂(Frac(T))` continuous. Assume every characteristic
polynomial lies in `T[X]`, reduces modulo `I` to `(X − χ(g))(X − ψ(g))` for continuous `T`-unit
characters `χ, ψ`, and that every field-factor representation is irreducible. Prove that there
are a finite `T`-module `M` and a continuous class in `H¹(G, M(χψ⁻¹))` for which every
representative cocycle generates `M`, and `Fitt₀_T(M) ⊆ I`; residual equality and residue
characteristic two are allowed. For `I = T` the proof takes the zero module; `I = 0` is excluded
by irreducibility; for a proper nonzero ideal it separates the coincident-character construction
from the distinct-character lattice argument. `global_difference_lattice` and
`fraction_lattice_topology` supply the canonical theorem’s extra inputs when `T̃=T`; the
distinct-character upper-entry lattice uses the same boundedness and topology results after
the chosen change of basis. Only the coincident case uses the Nakayama
every-representative lemma ([DKSW](https://math.iisc.ac.in/~maheshkakde/rl.pdf), Theorem 1.1, pp.2–3). *Needs:* Ribet extension with all local conditions, Every cocycle representative generates,
Ribet theory for distinct residual characters, Irreducibility excludes an exact split determinant.

**Checks for difference and local-relation maps.** The integral unipotent example is
`ρ(n)=[[1,n],[0,1]]`, with both characters trivial.

| Definition | Computed Check | Degenerate Check | Agreement Check |
|---|---|---|---|
| `differenceMap` | At `n`, the unipotent map gives `nE₀₁` | A scalar representation minus its character gives zero | At the group identity every difference is zero |
| `differenceProduct` | Both unipotent difference modules are `ℤE₀₁`, whose product is zero | Scalar differences have zero product | The product lies inside the right difference module `Δψ` |
| `productInside` | The unipotent product submodule is zero | The scalar product submodule is zero | For the sign-character input, `2I₂` is outside and `4I₂` inside (`sign_character_quotient`) |
| `initialModule_mk` | The unipotent quotient map is injective | For scalar data it is the zero map | For the sign-character input, the class of `2I₂` survives and twice it vanishes (`sign_character_quotient`) |
| `differenceClass` | The unipotent class of `n` is `n` under `upperUnipotentInitial` | Scalar classes vanish | The identity class is zero |
| `extraPlaces` | The two-place `extraLocal` fixture gives `{1}` | The singleton distinguished `fullLocal` gives the empty set | With three places, all in `sigma`, and distinguished place `1`, the result is `{0,2}` (`extra_places_middle`) |
| `localRelations` | For unipotent data with `fullLocal`, relations fill the enlarged module | Empty scalar data have no relations | The scalar `extraLocal` fixture has no relations despite its surviving free generator |
| `localCocycle` | With unipotent `fullLocal`, every class vanishes | Empty scalar data give zero | With empty local input and the sign-character representation, `κ(−1)≠0` (`local_cocycle_sign_nonzero`) |

**Checks for formal coordinates and relations.** These are computations in the specified
polynomial quotients, with matching Lean examples.

| Definition | Computed Check | Degenerate Check | Agreement or non-example Check |
|---|---|---|---|
| `formalMatrix` | The upper entry of the selected triangular matrix is zero | With no triangular constraint that entry is nonzero | The lower entry survives the triangular constraint |
| `formalCoefficient` | Sending the sole coefficient to `7` evaluates it to `7` | A sole free coefficient is nonzero | Two coefficient variables are distinct |
| `formalRing_eval` | The matrix `[[1,2],[3,4]]` evaluates the upper coordinate to `2` | The triangular matrix `[[1,0],[3,4]]` evaluates it to zero | With the coefficient sent to `7`, its translate by `1` evaluates to `8` |
| `relationIdeal` | The row `diag(2,4)` over `ℤ` generates `(2)` | Empty rows generate zero | The identity row generates `(1)` |
| `upperRelationIdeal` | The row `[[2,3],[4,5]]` generates `(3)` | Empty rows generate zero | The identity row has upper ideal zero, although its full ideal is `(1)` |
| `localRelationMatrix` | `X=[[1,2],[3,4]]`, `Y=[[5,6],[7,8]]`, `x=9`, `y=10` gives `[[-2,−38],[−29,−7]]` | All inputs zero give zero | `X=Y=0`, `x=2`, `y=3` gives `−6I₂` |
| `lowerBorelConjugate` | The upper entry of the conjugate of `E₀₁` is `z/x` | Zero maps to zero | The identity maps to the identity |
| `wordEvaluation` | A matrix generator evaluates to its assigned `[[1,2],[3,4]]` | With no generators, `1` evaluates to `I₂` | A coefficient generator assigned `3` evaluates to `3I₂` |
| `invariantSubring` | Each free coefficient belongs to the subring | With no generators over `ℤ` it is all of `ℤ` | The lower-right entry of a selected triangular matrix belongs to it |
| `borelInvariants` | The trace of a generic matrix belongs to it | With no variables it is the entire ring | The upper entry of a full generic matrix does not belong to it |

**Local-data carriers.** `emptyLocal` has count `0`, empty `sigma`, and no
distinguished place. `fullLocal` has count `1`, subgroup equal to the entire group, and
distinguished place `0`. `extraLocal` has count `2`, trivial subgroup at place `1`, and both
places in `sigma`. For an arbitrary `LocalData`, count zero forces no distinguished place;
empty `sigma` does the same; nonempty `sigma` excludes `distinguished=none`.

**Checks for local-data fixtures.** The enlarged module for `emptyLocal` and `fullLocal`
is `initialModule`, and both have no local-vector index. Their local quotients differ:
with the integer upper-unipotent representation, `emptyLocal` leaves the nonzero initial
cocycle, whereas `fullLocal` kills its entire span. For scalar `extraLocal`, the enlarged
module and local quotient are both `A`, and over a nonzero ring the local vector at place
`1` is nonzero. These module and cocycle computations are the Checks; the record-field
identities above specify the carriers.
The basis `upperUnipotentInitial` is normalized by `upperUnipotentInitial_symm_one`: the class
of `ρ(1) − 1 = E₀₁` goes to `1` (the other basis would send it to `−1`). It then sends zero to
zero, the difference class of `1` to `1`, and the difference class of `−2` to `−2`.
The fixtures `matrixGMA`, `oneBlockGMA` and `orderGMA` carry explicit diagonal identifications
(the `(i,i)` entry, respectively the identity of `M_d(A)`), so their primitive idempotents are
determined: for `oneBlockGMA A 2` the primitive is `E₀₀`, which an arbitrary automorphism of
`M₂(A)` would move. `torusEquiv_apply` fixes the `GL₁` comparison as evaluation of the
coordinate `x`, excluding the composite with inversion.

**Comparison maps and their values.** `Koszul.complex_X` is the identity on the
actual exterior-power term. `complex_X_zero` and `complex_X_one` use Mathlib's
`exteriorPower.zeroEquiv` and `exteriorPower.oneEquiv`. The generator formula
`complex_d_wedge` fixes every differential: the first deleted vector has positive sign.
`Koszul.map_f` is the exterior power of the given linear map in every degree.
`complex_append_wedge` specifies the inverse tensor comparison by placing left vectors
before right vectors. `homology_zero_π` sends the cycle of a scalar to its residue class.
These contracts apply over every commutative coefficient ring (Stacks tags
[0622](https://stacks.math.columbia.edu/tag/0622),
[0624](https://stacks.math.columbia.edu/tag/0624), and
[0664](https://stacks.math.columbia.edu/tag/0664)).

The degree-zero and degree-one Buchsbaum–Rim identifications are identities on their
specified carriers. `moduleComplex_rank_one_f` fixes the source generators and the scalar
unit. `moduleComplex_rank_one_f_two` fixes degree two and
`moduleComplex_rank_one_inv_bar` inserts the ordered dual volumes in every degree `k+3`.
`moduleComplex_d_two_rank_two` fixes the cyclic-minor contraction on every triple.
`determinantalComplex_map_f` is the identity on the target determinant line and `∧^m g`
on the source determinant term. `determinantalComplex_homology_zero_π` sends the ordered
target volume to `1 mod I_m(f)` (Buchsbaum §1, pp.185–187; DKSW (60)–(62), pp.36–37).
`upperRelationComplex_augmentation_f_zero` is the scalar quotient map; both relation
complexes use the identity on their literal degree-zero term `R` (DKSW (65)–(66), p.39).

**Checks for comparison maps.** Each identifier below labels a Lean `example`.
Identity unfoldings record the carriers; the three Checks for each target below instead
compute wedges, boundaries, or quotient classes.
The empty wedge denotes the unit of exterior degree zero.

| Definition | Three discriminating Checks and example names |
|---|---|
| `Koszul.complex_X` | Wedge of `(2,0),(0,3)` is six times the volume (`koszul_terms_empty_wedge`); reversing the basis negates the volume (`koszul_terms_vector`); a repeated vector gives zero (`koszul_terms_orientation`) |
| `Koszul.complex_X_zero` | Empty sequence sends empty wedge to `1` (`koszul_zero_empty`); negative empty wedge to `−1` (`koszul_zero_negative`); empty wedge stays `1` over `𝔽₂` (`koszul_zero_characteristic_two`) |
| `Koszul.complex_X_one` | First and second basis wedges go to their respective basis vectors (`koszul_one_first`, `koszul_one_second`); zero wedge goes to zero (`koszul_one_zero`) |
| `Koszul.map` | Identity chain map (`koszul_map_identity`); zero source map kills degree one (`koszul_map_zero_positive`); the same map preserves degree-zero unit (`koszul_map_zero_degree_zero`) |
| `Koszul.homology_zero` | Scalar `3` goes to `1 mod 2`, `3 mod 0`, `0 mod 1` (`koszul_hzero_two`, `koszul_hzero_zero`, `koszul_hzero_unit`) |
| `Koszul.complex_append` | Left generator becomes `e₀` (`koszul_append_left`); right generator becomes `e₁` (`koszul_append_right`); their tensor becomes `e₀∧e₁` (`koszul_append_ordered_pair`) |
| `BuchsbaumRim.moduleComplex_X_zero` | Boundary of `(2,−3)` is `(0,0)`, `(2,−3)`, `(-5,-7)` for zero, identity, and `[[2,3],[4,5]]` (`br_zero_zero`, `br_zero_identity`, `br_zero_non_diagonal`) |
| `BuchsbaumRim.moduleComplex_X_one` | Boundary of `(2,−3)` is `(0,0)`, `(2,−3)`, `(-5,-7)` for zero, identity, and `[[2,3],[4,5]]` (`br_zero_zero`, `br_zero_identity`, `br_zero_non_diagonal`) |
| `BuchsbaumRim.moduleComplex_X_two_rank_two` | Scaling the first two basis vectors by `2,3` gives six times the volume (`br_two_wedge_positive`); exchanging them negates it (`br_two_wedge_negative`); repeated-vector wedge goes to zero (`br_two_wedge_zero`) |
| `BuchsbaumRim.moduleComplex_rank_one` | Preserves `3`, `−2`, `1` in source degree one for identity, zero, multiplication by `2` (`br_rank_one_identity`, `br_rank_one_zero`, `br_rank_one_two`) |
| `BuchsbaumRim.determinantalComplex_X_zero` | Boundary of the ordered source volume is `0`, the target volume, and `−2` times that volume for zero, identity, and `[[2,3],[4,5]]` (`detbr_zero_zero`, `detbr_zero_identity`, `detbr_zero_non_diagonal`) |
| `BuchsbaumRim.determinantalComplex_X_one` | Boundary of the ordered source volume is `0`, the target volume, and `−2` times that volume for zero, identity, and `[[2,3],[4,5]]` (`detbr_zero_zero`, `detbr_zero_identity`, `detbr_zero_non_diagonal`) |
| `BuchsbaumRim.determinantalComplex_map` | Identity preserves the source wedge (`detbr_map_identity`); zero source map kills it (`detbr_map_zero`); that map still preserves the target volume (`detbr_map_zero_unit`) |
| `BuchsbaumRim.determinantalComplex_homology_zero` | For `diag(2,3)`, scalar `7` goes to `1 mod 6`; for zero, `3` goes to `3`; for identity, `3` goes to zero (`detbr_hzero_six`, `detbr_hzero_zero`, `detbr_hzero_unit`) |
| `IntegralRibet.upperRelationComplex_X_zero` | Boundary images in scalar coordinates are `0`, `0`, and `(2)` for empty, zero, and `(2)` relations (`upper_zero_empty`, `upper_zero_zero`, `upper_zero_two`) |
| `IntegralRibet.upperRelationComplex_augmentation` | Scalar `3` goes to `3`, `3`, `1 mod 2` in those cases (`upper_augmentation_empty`, `upper_augmentation_zero`, `upper_augmentation_two`) |
| `IntegralRibet.fullRelationComplex_X_zero` | Boundary images in scalar coordinates are `0`, `0`, and `ℤ` for empty, zero, and `[[2,3],[4,5]]` rows (`full_zero_empty`, `full_zero_zero`, `full_zero_nonzero`) |

The rank-two degree-two carrier uses the ordered dual volume to identify
`∧²(R²)* ⊗ ∧³(Rⁿ)` with `∧³(Rⁿ)`, and its comparison is the identity.
For the maps with rows `(e₀*,e₁*)`, `(e₁*,e₀*)`, and zero, the boundary of
the ordered triple is respectively `e₂`, `−e₂`, and zero
(`br_two_positive`, `br_two_negative`, `br_two_zero`).
For the rank-one module-complex comparison, use the standard generator of `R¹`
and its dual to remove all one-dimensional bar and determinant factors; the
resulting ordered source wedge maps to the same wedge in `K(x)` in every degree.
This fixes the full comparison, including maps with zero differential.
For `determinantalComplex_map`, every exterior-bar summand fixes its target dual
factors and applies `∧^{m+∑s_i}g` to its source wedge; this specifies the map
also above degree one (Buchsbaum §1, pp.185–187).

**Two-term sign check.** For the sequence `(2,3)` over `ℤ`,
`d(e₀∧e₁)=2e₁−3e₀`, so its coordinate vector is `(−3,2)` and its next
boundary is `2(−3)+3·2=0` (`koszul_two_term_sign`). Together with the ordered
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
`K(2)` over `ℤ` and over `ℤ/4`, and `K(0)` (Koszul complex of a finite sequence);
`f = id : R² → R²`, `f = 0 : R³ → R²` and the cyclic contraction `r₁₂e₃ + r₂₃e₁ + r₃₁e₂`
(Buchsbaum–Rim module complex); the generic `2 × 3` matrix with its three minors
and two syzygies (Buchsbaum–Rim determinant complex); multiplication by `2` on `ℤ`
and on `ℤ/4` (Regularity of a finite free map); and the relation complexes `R`,
`R --L→ R` and `R --(b₁b′₂ − b₂b′₁)→ R` (Upper-entry relation complex,
Full-entry relation complex).

### Dependencies

Layer IHG.0 (Amitsur's formula for determinants for the character congruence,
Invariant coordinate algebras under conjugation and Rational cohomology of a flat affine group scheme for the integral Borel cohomology); Layer IHG.1 (Henselian lifting of matrix units for the distinct-character case and Faithful quotients over arbitrary fields for excluding `I = 0`). Tau Ceti `TauCeti.fittingIdeal` with
`TauCeti.fittingIdeal_eq_minorsIdeal_ker`, and `TauCeti.Comodule`; ProfiniteCohomology layer 2 for
cocycles, coboundaries and `H¹`. The annihilator bound is an additional relation-minor argument
in this layer. From Mathlib: `MonoidAlgebra`, `Matrix`, `Submodule`,
`ExteriorAlgebra`, `exteriorPower.map`, `RingTheory.Sequence.IsWeaklyRegular`, `MvPolynomial` and
`IsLocalization.Away`. SchemeAndStackFoundations §0.20 supplies
`IsJapanese.of_complete_local` and `IsNagata.of_complete_local` for the finite normalization
used by `global_difference_lattice`. The sources are DKSW, Buchsbaum and the Stacks Project.

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
indistinguishable case), and Galois deformation spaces (the universal Cayley–Hamilton algebras and
invariant-coordinate representing rings of Layer IHG.1, the generic representation algebra of
Böckle–Iyengar–Paškūnas). Each such application supplies its own geometric Hecke comparison,
classical congruence witnesses and eigenvalue systems in the exact algebraic form this roadmap
specifies: a congruence witness of Uniform congruence witnesses for classical systems, an error ideal with a uniform exponent for Determinant from a quantified Hecke comparison, the existence of the residual representation for Maximal ideals of Galois type, and the integral lattice and local triangularisations of Ribet extension with all local conditions. Within the roadmap, Layer IHG.3b consumes IHG.1 and IHG.3a;
IHG.4 consumes IHG.0 and IHG.3a; IHG.5 consumes IHG.1, IHG.2 and IHG.4; IHG.6 consumes IHG.0 and
IHG.1.

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
