# Roadmap: complex multiplication and explicit reciprocity

**Summary.** Complex multiplication turns ideal arithmetic into geometry and explicit class fields. This roadmap uses CM types and reflex norms to build integral reflex data, elliptic ideal actions, polarized CM uniformization, reciprocity on torsion and regular modular values, actual CM Hecke characters and their local factors, and the reduction and coefficient comparisons needed to determine class polynomials and ordinary endomorphism orders. Every comparison retains the order, CM action, polarization, model field and level; forgetting them can change the stabilizer or generated field.

The elliptic case gives ring and ray class fields of imaginary quadratic fields. Higher-dimensional CM gives reflex-field reciprocity and polarized moduli orbits. Height/Colmez comparisons belong to ComplexMultiplicationAndExplicitReciprocityPartII; Heegner-point, Euler-system and `p`-converse arguments consume the interfaces here. The scope is the CM fields and algebras stated below, with no claim to Hilbert’s twelfth problem for arbitrary number fields.

## Scope and ownership

ShimuraVarieties §5.1 supplies CM types, primitive induction, trace reflex fields and reflex norms; §§4.2 and 5.8–5.11 supply torus reciprocity, the main CM theorem and the Shimura–Taniyama formula. CM.0 adds closure-independence, primitive/double-reflex and integral reflex-order comparisons for the supplied reflex pair. CM.2 specializes the supplied reciprocity theorems to ideal, torsion, polarization and level formulas, and constructs the regular Siegel level-function interface. These dependencies run from ShimuraVarieties to this roadmap.

| Material used here | Owning roadmap and interface |
| --- | --- |
| Orders, conductors, proper invertible ideals, their finite class groups, extension and contraction | GlobalNumberFields, Layer 11; use Mathlib's existing `ClassGroup` and `Pic` |
| Fractional ray congruences, ideal/idele comparison, norms, Hecke characters and infinity types | GlobalNumberFields, Layers 7–10 |
| Galois avatars of algebraic Hecke characters, with geometric Artin normalization | AutomorphicGaloisRepresentationsPartII, AG2.0, `AlgHeckeChar.galoisChar`, `galoisChar_local` and `galoisChar_mul` |
| Maximal-order elliptic CM characters, ideal kernels, norm degrees, differential normalization and isogeny to maximal order | ArithmeticStatisticsPartVII, `support-cm`, `cm_hecke_character` and `cm_ideal_isogeny_comparison` |
| Arithmetic Artin map, class-field correspondence, quadratic ring and ray class fields | ClassFieldTheory, Layers 11–13 |
| CM-action vocabulary, equation/scheme comparison, ordinary finite-field endomorphism orders, twists, torsion, Weil pairing, local reduction | EllipticCurves, Layers 1–5 |
| Elliptic complex uniformization, analytic/algebraic Hom comparison, regular level-function evaluation | ModularCurvesPartII §§1.1–1.5, 3.14 and 6.1 |
| Relative Lie theory, the Serre tensor and its realizations, Hodge/period realization, polarized uniformization, Rosati, degree and primitive CM simplicity | AbelianSchemesAndArithmeticModuli, A0–A6, in particular A1.3a/A4.7a for the Serre tensor and A6.37 `cmIsotypic` |
| Crystalline Dieudonné realization, rational slope decomposition and group/isocrystal slope comparison | AbelianSchemesAndArithmeticModuli A4.CR.7.2; CrystallineCohomology CR.4.7; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.15–R07.2.16 |
| Cocharacter reflex field, CM types and norms, main CM theorem, polarized Siegel moduli and canonical tower | ShimuraVarieties §§P.3, 4.2, 5.0–5.11 and 8.1–8.3 |
| Covariant Tate realizations, local characters, inertia, induction, Artin/Swan conductors and Frobenius recognition | ArithmeticGaloisRepresentations §§1.3, 1.12, 2.1–2.5, 3.1–3.5, 5.1, 5.3, 6.1–6.4 |
| `H¹` étale local Euler polynomials and Néron–Ogg–Shafarevich | NeronModelsAndSemistableAbelianVarieties §§5.1, 5.3i and 5.6 |
| Quadratic automorphic induction and CM newform compatible systems | GL2AutomorphicRepresentationsAndTransfer R17.4.16; AutomorphicGaloisRepresentations §§1.5 and 7.3 |
| Binary form/ideal dictionary and complete reduced-class census | IntegralLattices, B2, B3 and B5 |
| Embedded quaternion-order lattices and localization | GeometryOfNumbersAndQuadraticArithmetic §2.8 |
| Supersingular cyclic-level endomorphism orders, including maximality at level one | SerreWeightAndLevelOptimisation §2.6, `deuring-eichler-supersingular-comparison` |
| Rational quaternion algebras, reduced norm and split/division comparison | QuadraticFormInvariants, Layer 2 |
| Existence of primes with specified class-field Artin class | Chebotarev, Layer 9 |

ModularForms Layer 0 supplies the independent `LevelOne.JInputs` interface: normalized `j`, its `q`-expansion and special values. ModularCurvesPartII §5.6 supplies the integral cyclic modular polynomials. The prime diagonal comparison in CM.3 uses these two inputs before singular-modulus integrality. Separation of elliptic isomorphism classes uses EllipticCurves Layer 1 and the ModularCurvesPartII §§1.1–1.5 uniformization comparison. The exact contracts consumed from these owners follow below. General constructions remain with their owners; this roadmap supplies CM specializations and comparisons.

### Existing interfaces

Use Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 as the reference interfaces. A CM field already exists as `NumberField.IsCMField`: a totally complex quadratic extension of its maximal real subfield. Its `complexConj` is a maximal-real-subfield algebra automorphism, with `φ(c(x)) = conjugate(φ(x))`, `c(c(x)) = x` and fixed elements exactly in the maximal real subfield. Integral-over-`ℚ` hypotheses on this conjugation API hold for the number fields used here.

`FractionalIdeal` is the native submodule carrier with a common denominator; invertibility is extra data, expressed by its units. `ClassGroup R`, for every commutative domain `R`, is the quotient of invertible fractional ideals by principal ones. `ClassGroup.mk` is the class map on a chosen fraction field, and `ClassGroup.equivPic` identifies this group with `CommRing.Pic R`. `CommRing.Pic.mapAlgebra` is invertible-module base change. These definitions already apply to nonmaximal orders. GlobalNumberFields Layer 11 supplies the additional arithmetic: properness, order-specific finiteness, conductor behavior and norms. A nonzero ideal of a nonmaximal order need not be invertible.

`IntermediateField.adjoin` and `adjoin_le_iff` supply the trace-generated reflex field and its universal property. `NumberField.RingOfIntegers` is the integral closure of `ℤ` in the field. `WeierstrassCurve.j` is `Δ⁻¹c₄³` with invertible discriminant. `TauCeti.AlgebraicGeometry.AbelianVariety` is a proper geometrically integral group scheme over the given field; its `End` is the additive wrapper of its endomorphism morphisms, with composition as multiplication. `TauCeti.Isogeny` is the native Weierstrass affine isogeny, and `Isogeny.degree` is the dimension of the source function field over the pulled-back target field. Transport these objects through the supplied uniformization and equation/scheme comparisons rather than introducing private substitutes.

### Outputs

| Layer | Output |
| --- | --- |
| CM.0 | Comparisons for supplied reflex pairs, integral reflex orders and concrete field Checks |
| CM.1 | Elliptic ideal actions, Picard classification, Serre tensor and CM Hodge/period comparisons |
| CM.2 | Polarized lattices and explicit reciprocity dictionaries after ShimuraVarieties §5.10 |
| CM.3 | Class polynomials and precisely generated ring/ray value fields |
| CM.4 | CM Hecke characters, full local factorizations and coefficient components |
| CM.5 | Reduction, isogeny graphs, coefficient bounds, conductor criteria and polynomial reconstruction |

The non-Galois quartic example is in CM.0, the dimension-two torsion/polarization example in CM.2, and the complete Gaussian class-field example in CM.3. Applications import the actual declarations from these layers. Examples and exports introduce no additional mathematical layer.

Tau Ceti supplies the Gaussian lattice as `TauCeti.GeometryOfNumbers.gaussianLattice`, its membership description and separation bounds, and `TauCeti.NumberField.complexConj_eq_complexConjugationAt` identifies place conjugation with Mathlib’s CM conjugation. Reuse these results. IntegralLattices B2/B3/B5 already owns the binary-form/class-group dictionary, composition and reduced representatives. The CM-point comparison below consumes them; it does not reconstruct those theories.

For the unit-obstruction bound, use Tau Ceti's `NumberField.units_sq_index_le` from `TauCeti.NumberTheory.EffectiveBounds.UnitSquares.Basic`, which bounds the unit-square index by `2^[F:ℚ]`. Layer 2 supplies the CM-specific injection into a totally positive unit/norm quotient and the fact that squares are relative norms; the general unit-square bound is already available.

## Conventions

**Fields and types.** A CM algebra `E` is a finite product of CM number fields. A type selects one complex embedding from each conjugate pair; all factor images lie in a common closure. Trace reflex fields and embedding partitions use this generality. A unique primitive core and a single inverse-coset reflex type are statements for a CM field. Distinguish the original field `E`, its reflex field `E*`, a model field `k` over which all specified endomorphisms are defined, and fields of moduli or definition. A totally complex field containing a CM field is additional data in the Kings–Sprang applications; its lifted type is not silently a primitive type on that larger field.

**Artin and ideals.** Artin sends a prime uniformizer to arithmetic Frobenius `x ↦ x^q`. Milne's geometric-art convention is translated by `s = t⁻¹`. The left ideal action is `[a] ⋆ [ℂ/I] = [ℂ/a⁻¹I]`. For a nonmaximal order only proper invertible ideals enter this action. Extension/contraction and the reflex ideal map have the stated prime-to-conductor restrictions.

**Polarization.** Write `E_ξ(x,y) = Tr_{E/ℚ}(ξxȳ)`, with `ξ̄ = −ξ` and `Im φ(ξ) > 0` for `φ ∈ Φ`; positivity is `E_ξ(x,Jx) > 0`. Streng uses `E_Str,ξ(x,y)=Tr(ξx̄y)=−E_ξ(x,y)`, with the same positive-imaginary parameter `ξ` (Streng §2.5.1, p.5). Expressing Streng's form with our `xȳ` trace formula instead gives parameter `−ξ`. The Riemann forms of AbelianSchemesAndArithmeticModuli A5.2 use the opposite positivity `E(Jv,v) > 0`, with `E(i,1) = 1` on `ℤ+ℤi`. The A5 Riemann form attached to `(I,ξ)` is therefore `−E_ξ(x,y) = Tr_{E/ℚ}(ξx̄y)`. For `(ℤ[i], i/2)` one has `E_ξ(1,i) = 1` and `−E_ξ(i,1) = 1`, the latter matching the supplier's Gaussian check. Lattice homothety by `u` sends `(I,ξ)` to `(uI, ξ/(uū))`. For `f = N_Φ(t)⁻¹ = N_Φ(t⁻¹)`, the `E`-linear comparison `α` satisfies `α(fx) = σ(x)` and has polarization multiplier `χ_cyc(σ)/(f f̄)`. The natural Galois torsion map has multiplier `χ_cyc(σ)`. Uniformization therefore sends `I` to `fI` and `ξ` to `ξχ_cyc(σ)/(f f̄)`. These are different maps with different multipliers.

**Realizations and local factors.** `H₁` and Tate modules are covariant; arithmetic Frobenius has polynomial `X² − a_vX + q` in the elliptic case. A positive ideal infinity type `(1,0)` corresponds to idelic exponents `(−1,0)`. The ArithmeticGaloisRepresentations §6.3 Euler convention instead uses `H¹_et = V_l(A)∨` and geometric Frobenius. At potentially good CM places, finite-inertia averaging identifies its determinant with the arithmetic-Frobenius determinant on covariant Tate invariants. Keep the duality in the local comparison, including ramified primes.

**Discriminants and order tests.** The reflex-order discriminant is a relative ideal over `O_{E*}`. For `E = ℚ(i)` and `O = ℤ + 3ℤi` the selected reflex image is `O_E`, with relative discriminant `1`; the input order has absolute `ℤ`-discriminant `−36`. Geometric endomorphisms mean endomorphisms over an algebraic closure. The endomorphism ring over a finite model field can be smaller, especially in the supersingular case. All characteristic-`p` classification and reduction statements include `p = 2` and `p = 3`.


**Positive dimensions and levels.** Geometric CM objects have `g≥1`, full lattices have rank `2g`, finite fields have `q=pʳ` with `p` prime and `r≥1`, and level `N` is a positive integer. Multiplication-degree formulas for isogenies require `n≠0`: `[0]` on a positive-dimensional variety is not an isogeny. The general finite-product bounds below also state the empty-index case, separately from a CM class census, which is nonempty. Compactness and discreteness in complex uniformization are supplied by the full lattice hypothesis.

## Exact supplier contracts

### From Mathlib and Tau Ceti

Mathlib `NumberTheory.NumberField.CMField` supplies `NumberField.IsCMField`,
`NumberField.IsCMField.complexConj`, `complexEmbedding_complexConj`,
`complexConj_apply_apply` and `complexConj_eq_self_iff`. Its native `FractionalIdeal`,
`ClassGroup` and `ClassGroup.mk` are used throughout. `RingTheory.PicardGroup` supplies
`CommRing.Pic`, `ClassGroup.equivPic` and `CommRing.Pic.mapAlgebra`;
`IntermediateField.adjoin` and `adjoin_le_iff` specify generated subfields, and
`NumberField.RingOfIntegers` specifies integral closures.

Under `TauCeti.NumberTheory.NumberField.Global.Orders`, use `Basic`’s
`TauCeti.GlobalNumberFields.NumberFieldOrder`,
`NumberFieldOrder.toRingOfIntegers`, `ProperIdeal`’s
`NumberFieldOrder.multiplierRing`,
`Picard`'s `TauCeti.GlobalNumberFields.Pic` and `NumberFieldOrder.mkPic`,
`Conductor`'s `NumberFieldOrder.conductor`, `Discriminant`'s
`NumberFieldOrder.discr_eq_index_sq_mul`, and `AwayConductor`'s
`NumberFieldOrder.integralIdealsAwayConductorEquiv` and
`NumberFieldOrder.integralIdealsAwayConductorToInvertible`.
`RayClass`'s `NumberFieldOrder.finite_pic` gives finiteness on the same Picard carrier.
These are the existing order-theoretic interfaces of GlobalNumberFields Layer 11.
The relative discriminant of the selected reflex order is a distinct comparison in CM.0.2.

`TauCeti.AlgebraicGeometry.AbelianVariety.Basic` supplies
`TauCeti.AlgebraicGeometry.AbelianVariety`; its `End.Basic` module supplies the ring
`TauCeti.AlgebraicGeometry.AbelianVariety.End` and the maps `End.toHom` and `End.ofHom`.
`TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.Basic` and `.Degree` supply
`TauCeti.Isogeny` and `TauCeti.Isogeny.degree`. These geometric carriers are transported
through the equation, uniformization and realization comparisons below.

`TauCeti.NumberTheory.GeometryOfNumbers.RankTwoDoubling` supplies
`TauCeti.GeometryOfNumbers.gaussianLattice`, `mem_gaussianLattice` and
`one_le_norm_of_mem_gaussianLattice_of_ne_zero`.
`TauCeti.NumberTheory.NumberField.ComplexConjugation.CMField` supplies
`TauCeti.NumberField.complexConj_eq_complexConjugationAt`.
`TauCeti.NumberTheory.EffectiveBounds.UnitSquares.Basic` supplies
`NumberField.units_sq_index_le`: the index of the squares in `(𝓞 F)ˣ` is at most
`2 ^ Module.finrank ℚ F` for every number field `F`.

### From the geometric and arithmetic roadmaps

- `AbelianSchemesAndArithmeticModuli:A0.1–A0.2`: The abelian-scheme carrier `AbelianScheme S` over an arbitrary base and its comparisons with Tau Ceti's field carrier and with elliptic curves.
- `AbelianSchemesAndArithmeticModuli:A1.1–A1.3`: Products, arbitrary base change and the locally constant relative dimension (dimension zero is the identity scheme `S`); rigidity, including A1.2(3): a homomorphism vanishing on one geometric fibre of each connected component is zero; invariant differentials `ω_A`, locally free of rank `g`, with `Lie(A/S)=ω_A^∨`, all compatible with base change.
- `AbelianSchemesAndArithmeticModuli:A1.3a/relativeSerreTensor`: For any scheme `S`, any abelian scheme `A/S`, any associative unital ring `R` with a unital map `R→End_S(A)`, and any finitely generated projective right `R`-module `M`, the presheaf `T↦M⊗_R A(T)` is already an fppf sheaf and is represented by an abelian scheme `M⊗_R A`, unique up to unique isomorphism with its universal balanced map. It is built as the kernel of `1−e` for the projector `e` on `Aⁿ` given by a splitting `M⊕N≅Rⁿ`, and `M⊗_R A(T)≅Hom_R(M*,A(T))` with `M*=Hom_{Rᵒᵖ}(M,R)`. Its Checks include `M=R` (giving `A`), `M=0` (giving the identity scheme), `M=Rⁿ` (giving `Aⁿ`, also for `n=0`) and a nonprincipal invertible ideal.
- `AbelianSchemesAndArithmeticModuli:A1.3a/relativeSerreTensor-functoriality`: Module maps `M→N` and `R`-linear homomorphisms `A→B` induce `f⊗u`, characterized on points by `m⊗a↦f(m)⊗u(a)`, with identity, composition and additivity laws; `(M⊕N)⊗A≅(M⊗A)×_S(N⊗A)` including the empty sum; independence of the chosen projective splitting and complement, with the cocycle identity.
- `AbelianSchemesAndArithmeticModuli:A1.3a/relativeSerreTensor-base-change`: `(M⊗_R A)_{S′}≅M⊗_R A_{S′}` for every `S′→S`, compatible with universal maps, module maps, homomorphisms and finite sums, with identity and iterated-pullback coherence.
- `AbelianSchemesAndArithmeticModuli:A3.1/IsAbelianIsogeny`: Isogenies over a base are finite, flat, surjective homomorphisms; the kernel is finite locally free, the rank (degree) equals the rank of the kernel, is locally constant and multiplies under composition (`IsAbelianIsogeny.comp_rank`).
- `AbelianSchemesAndArithmeticModuli:A4.1, A4.3`: The integral Tate module `AbelianTate` for `ℓ` invertible on `S`, functorial in homomorphisms and compatible with base change; first de Rham cohomology `AbelianH1dR` with the Hodge sequence `0→ω_A→H¹_dR(A/S)→Lie(A^∨)→0`, base change, contravariant pullback along homomorphisms (hence the CM action) and the perfect pairing between `H¹_dR(A/S)` and `H¹_dR(A^∨/S)`. The covariant sequence `0→ω_{A^∨}→H_A→Lie(A)→0` used in CM.1 is the A4.3 sequence of `A^∨`, with `H_A=H¹_dR(A^∨/S)≅Hom(H¹_dR(A/S),O_S)`.
- `AbelianSchemesAndArithmeticModuli:A4.5/BarsottiTate`: The `p`-divisible group of an abelian scheme over an arbitrary base, with truncations.
- `AbelianSchemesAndArithmeticModuli:A4.CR.7.2`: The crystalline Dieudonné crystal, its contravariance, Frobenius and Tate-twist conventions.
- `CrystallineCohomology:CR.4.7`, *Slope decomposition on the existing isocrystal carrier*: rational slope summands on Mathlib’s `WittVector.Isocrystal`, with finite-field slopes given by normalized Frobenius valuations.
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2.15/dieudonneManinClassification` and `R07.2.16/slopeSequence`, `slopeSequence_baseChange`: the integral Dieudonné/group comparison, multiplicity equal to block dimension, and invariance under perfect-field extension.
- `AbelianSchemesAndArithmeticModuli:A6.37/cmIsotypic`: Irreducible rational polarized CM Hodge structures correspond to CM fields with primitive types; the associated complex abelian varieties are simple with that rational endomorphism field. CM.2.1 transports this through the lattice classification.
- `AbelianSchemesAndArithmeticModuli:A4.7a/relativeSerreTensor-lie-tate`: For `B=M⊗_R A` as in A1.3a: `Lie(B/S)≅M⊗_R Lie(A/S)` as `O_S`-modules, with the differentiated `R`-action; `T_ℓB≅M⊗_R T_ℓA` and `B[ℓʳ]≅M⊗_R A[ℓʳ]` for `ℓ` invertible on `S`; `H¹_dR(B/S)≅Hom_{Rᵒᵖ}(M,H¹_dR(A/S))` respecting the Hodge filtration (and the Gauss–Manin connection over a smooth base), equivalently `H₁,dR(B/S)≅M⊗_R H₁,dR(A/S)`; `B[p^∞]≅M⊗_R A[p^∞]` and the contravariant Dieudonné comparison when `p` is locally nilpotent. All are natural in module maps and `R`-linear homomorphisms and commute with base change; its Checks show that `M⊗Lie(A)` can be nonzero when `M` is torsion and the fppf tensor sheaf vanishes, so finite projectivity is essential.
- `AbelianSchemesAndArithmeticModuli:A5.1–A5.8`: Lattice uniformization `A^an≅Lie(A)/Λ` with `Λ=H₁(A^an,ℤ)` and `T_ℓA=Λ⊗ℤ_ℓ` (A5.1); integral Riemann forms with positivity `E(Jv,v)>0`, the negative of the `E_ξ` convention used here, and principality as a perfect pairing (A5.2); algebraization of a complex torus with a positive Riemann form, applied here to `ℂ^Φ/Φ(I)` (A5.3); polarization types (A5.4); the polarized Hodge equivalence, i.e. the analytic/algebraic Hom comparison (A5.5); the de Rham–Betti comparison (A5.6) and the degree-one realization conventions over `ℂ` (A5.7), whose composite is the integration pairing `ω_A×H₁(A(ℂ),ℤ)→ℂ`; symplectic period matrices and the Siegel family (A5.8).
- `ArithmeticGaloisRepresentations:§§1.3, 1.12, 2.1–2.5 and 6.3`: Rank-one local inertia and Weil–Deligne character, duality between covariant Tate and cohomological `H¹`, inertia-invariant Euler factors with geometric Frobenius on `H¹`, and induction/restriction at all primes.
- `ArithmeticGaloisRepresentations:§§3.1–3.5`: Artin/Swan conductors and local rank-one conductor additivity under direct sums, including ramified places.
- `ArithmeticGaloisRepresentations:§§5.1 and 5.3`: Semisimple representation recognition by good Frobenius polynomials and Chebotarev.
- `ArithmeticGaloisRepresentations:§§6.1–6.2 and 6.4`: Canonical covariant Tate module for abelian varieties, `E⊗ℚ_ℓ` action, extension of coefficients and direct-summand realizations.
- `AutomorphicGaloisRepresentationsPartII:AG2.0`, *The `l`-adic character `r_{l,ι}(χ)` of an algebraic Hecke character*: `AlgHeckeChar.galoisChar`, `galoisChar_local` and `galoisChar_mul` construct the avatar and its local and multiplicative comparisons. Its Artin map sends uniformizers to geometric Frobenius, so an unramified character with finite uniformizer value `c` has arithmetic Frobenius value `ι⁻¹(c⁻¹)`. CM.4 applies this construction to the inverse idelic character to obtain the covariant Tate eigenvalue (BLGGT, §A.2 p.87 and Notation p.9, as cited by the supplier).
- `ArithmeticStatisticsPartVII:support-cm`, *CM twist and descent estimates*: `cm_hecke_character` supplies the continuous character for a maximal-order CM elliptic curve over a number field containing its CM field, with all CM endomorphisms defined there, using the differential embedding. It includes the norm-ideal, torsion and good-Frobenius identities in the arithmetic Artin convention (Rubin, Theorem 5.15 and Corollary 5.16, pp.19–20). `cm_ideal_isogeny_comparison` supplies its base-stable ideal kernels of rank `N(a)`, CM quotient, differential scalar and base-defined CM isogeny from an arbitrary quadratic order to maximal order (Rubin, Propositions 5.3–5.4, pp.15–16, and Proposition 3.14, p.11). CM.1 uses these in the maximal quadratic-order cases; CM.4 transports the elliptic character through this isogeny for nonmaximal orders and constructs the higher-dimensional character with agreement in dimension one.
- `GL2AutomorphicRepresentationsAndTransfer:R17.4.16/quadratic-induction`: Quadratic automorphic induction of algebraic Hecke characters, with local induction parameters, twisting, the cuspidality criterion and the CM theta-series realization. `AutomorphicGaloisRepresentations:§§1.5 and 7.3` supplies the rank-two newform realization and its strict fixed-eigenform compatible system; ArithmeticGaloisRepresentations §5.3 compares the resulting semisimple representations by good Frobenius polynomials.
- `GeometryOfNumbersAndQuadraticArithmetic:§2.8`: Embedded full lattices stable under a chosen quaternion order, their localization and standard involution, on the existing rational quaternion algebra. CM.5 uses this carrier to compare the supplied supersingular endomorphism order and its reduced discriminant.
- `SerreWeightAndLevelOptimisation:§2.6/deuring-eichler-supersingular-comparison`: For every prime `p` and positive `N` prime to `p`, the endomorphisms of a supersingular pair `(A,C)` with `C` cyclic of order `N` form an Eichler order of level `N` in `B_{p,∞}`. The case `N=1` supplies maximality of `End_geom(A)`. The supplier also identifies enhanced supersingular isogenies with ideal correspondences, retaining automorphisms and multiplicities (Ribet, §3, Proposition 3.3 and Variant 3.4, p.440). CM.5 adds the reduced CM embedding, optimality and reduced-discriminant comparison on the embedded lattice carrier.
- `IntegralLattices:B2,B3,B5`: The existing primitive positive binary-form/proper-ideal-class equivalence, composition, complete reduced representatives, boundary identifications and stabilizer weights. CM supplies only the comparison with oriented analytic CM points.
- `ModularCurvesPartII:§§1.1–1.5`: Elliptic lattice↔Weierstrass curve comparison, analytic functions and normalized `j`, full faithfulness for origin-preserving maps.
- `ModularCurvesPartII:§§3.14 and 6.1`: Open and compact analytic–algebraic uniformization for the supplied level curves. Transport their rational functions and local rings through this comparison. CM.2.3 supplies the arithmetic function-field action and regular evaluation; CM.3.2 proves that admissible functions separate the required finite CM orbit.
- [ModularCurvesPartII §5.6][modularcurvespartii-polynomial]: Integral cyclic modular polynomial `Φ_N(U,V)`, with `Φ₁=V−U`; for `N≥2` it is symmetric and monic of degree `ψ(N)` in each variable. Its roots parametrize cyclic degree-`N` isogenies in characteristic zero. This construction is independent of CM and counts cyclic subgroups, including coincident target `j`-values with multiplicity.
- `ShimuraVarieties:§P.3 and §5.1`: Generic cocharacter reflex-field carrier and stabilizer, with comparison to the trace-generated field of a CM type.
- `ShimuraVarieties:§4.2 and §5.1`: Special-torus reflex norm on finite ideles, rational elements and ideals, conjugation norm identity and exact Artin/level convention, independent of CM.2.
- `ShimuraVarieties:§§5.4–5.11`: Main CM theorem and general Shimura–Taniyama theorem: actual CM abelian varieties, polarization similitude, torsion/finite-adelic `H₁` and Galois conjugation, on the CM types of its §5.1. Its rational rank-one Tate theorem (§5.4) permits nonmaximal orders; integral freeness requires maximal order or an invertible local lattice.
- `ShimuraVarieties:§5.0 and §§8.1–8.3`: Rational polarized Siegel moduli, their complex uniformization, the canonical algebraic tower, finite-level maps and rational similitude translations. CM.2.3 constructs the associated regular modular-function field and its semilinear finite-level action from these schemes and maps; that function-field comparison is a target here.
- [Chebotarev Layer 9][chebotarev-9]: Abelian Chebotarev: each class-field Artin class contains infinitely many degree-one primes avoiding any finite set; in particular infinitely many rational primes splitting completely in the quadratic ring class field.
- [ClassFieldTheory Layer 11][classfieldtheory-11]: Arithmetic global Artin reciprocity, `Art(uniformizer)=arithmetic Frobenius`, compatible with norms and finite extensions.
- [ClassFieldTheory Layer 12][classfieldtheory-12]: Global class-field correspondence for arbitrary number fields: ray/idele open-subgroup fields, exact arithmetic Artin quotient, least conductor and conductor divisibility, uniqueness and field inclusion reversal.
- [ClassFieldTheory Layer 13][classfieldtheory-13]: Imaginary quadratic ring/ray class fields with Artin/Picard and Artin/ray-class isomorphisms; conductor divisibility.
- [EllipticCurves Layer 1][ellipticcurves-1]: Weierstrass elliptic curve↔elliptic scheme comparison, transporting twists, endomorphisms, `j` and Tate modules through the pinned carriers. Elliptic CMAction/order-embedding, algebraic `End` and automorphism/isogeny carriers compatible with the pinned Weierstrass isogeny and degree; elliptic Lie scalar identification. For an ordinary curve over `𝔽_q`, its endomorphism ring is an order in `ℚ(π_q)` containing `ℤ[π_q]`.
- [EllipticCurves Layer 2][ellipticcurves-2]: Covariant elliptic Tate module and Weil pairing, integral torsion kernels and degrees, compatibility with Weierstrass maps.
- [EllipticCurves Layer 3][ellipticcurves-3]: Ordinary/supersingular predicates, geometric endomorphisms, Frobenius, trace and finite-field trace in all characteristics, including `2` and `3`.
- [EllipticCurves Layer 4][ellipticcurves-4]: Generic elliptic local reduction theorem: integral `j` iff potentially good reduction, good-model specialization of endomorphisms and conductor/local Euler compatibility, with no exclusion of residue characteristics `2` or `3`.
- [EllipticCurves Layer 5][ellipticcurves-5]: Quadratic-twist equation/isomorphism and descent with Galois cocycle; twisting a rational CM curve by its CM quadratic character.
- [GlobalNumberFields Layer 10][globalnumberfields-10]: Archimedean exponent conventions, algebraic infinity types, conjugation, cyclotomic character and coefficient embeddings; positive ideal type versus negative idelic type.
- [GlobalNumberFields Layer 11][globalnumberfields-11]: Generic finite `ℤ`-orders `R` in number fields, conductor ideal, proper invertible fractional ideals, order-specific finiteness/API on the existing ClassGroup/Pic carriers, extension/contraction away from the conductor, ideal norms and the quadratic-order class number formula.
- [GlobalNumberFields Layer 7][globalnumberfields-7]: Ideal/idele ray-class comparison, `mod×` congruences for fractional elements, arithmetic normalization and ideals prime to a modulus.
- [GlobalNumberFields Layer 8][globalnumberfields-8]: Norms and base change for ideals/ideles of finite extensions, compatible with arithmetic Artin maps.
- [GlobalNumberFields Layers 9–10][globalnumberfields-9]: Hecke characters on ideles/ideals, their finite conductors and local components, and algebraic infinity types with the ideal/idele exponent comparison. The Galois-avatar construction is the AutomorphicGaloisRepresentationsPartII AG2.0 contract above.
- [ModularForms Layer 0][modularforms-0]: Independent `LevelOne.JInputs`: normalized modular `j` with `q`-expansion `q⁻¹+744+196884q+…`, modular invariance, holomorphy on the upper half-plane, and exact elliptic orders giving `j(i)=1728` and `j(exp(2πi/3))=0`. This module has no dependency on CM.
- [QuadraticFormInvariants Layer 2][quadraticforminvariants-2]: Existing quaternion algebra/reduced norm and split-or-division API; reuse actual `QuaternionAlgebra` and its naturality, not a new CM-specific division algebra carrier.

The field-level interfaces of AbelianSchemesAndArithmeticModuli are used on the same abelian-variety action as the A4/A5 comparisons: A3.9 `Polarization.rosati`; A6.1 `Hom.deg` (finite-flat `deg`ree, inseparable part included, multiplicative, `deg[n]=|n|^{2g}`); A6.10 `End.charpoly`; A6.11 `charpolyTate` (`P_α` is the characteristic polynomial on `V_ℓ` for `ℓ≠char`); A6.12 `traceDegreeSubfield` (for a subfield `F⊂End⁰A` of `deg`ree `f` with the same identity, `V_ℓA` is free of rank 2g/f over `F⊗ℚ_ℓ` and `deg α=N_{F/ℚ}(α)^{2g/f}`); and A6.18 `polarizedAutomorphisms` (finiteness, and rigidity at level `n≥3`, tested on points when `n` is prime to the characteristic). ArithmeticGaloisRepresentations §6.3 defines the local Euler polynomial with cohomological geometric Frobenius; NeronModelsAndSemistableAbelianVarieties §§5.6 and 5.3i prove its independence and elliptic comparison, and §5.1 relates unramified Tate realization to good reduction. These comparisons must transport the equation, scheme, endomorphism and realization data together.

The general Serre tensor, its functoriality, base change and realizations are A1.3a and A4.7a above; CM.1.3 specializes them to rings of integers acting with `[L:ℚ]=2·dim` and adds only the CM conclusions: ideal-isogeny degrees with their inseparable parts, preservation of the CM type, and the eigenspace and period comparisons of an abelian scheme with its ideal twists.

Primality, actual traces, residue sizes, endomorphism orders, root bounds, coefficient intervals and completeness of finite orbits are mathematical hypotheses wherever used. Their production by a search or numerical procedure is outside these contracts.

<a id="cm-0-1"></a>

### From ShimuraVarieties §5.1: embedding partitions, primitive induction and trace fields

The supplied namespace is `TauCeti.CM.CMType`; the short names below refer to that interface. Its types use actual embeddings, so conjugation, induction and cardinality serve both torus and geometric realizations. The primitive-core construction uses the right stabilizer; the trace reflex field uses the left stabilizer.

**CM types of finite étale CM algebras** — `CMType`. For a finite product `E` of CM number fields, a CM type `Φ` is a subset of `Hom_ℚ-alg(E,ℂ)` containing exactly one of `φ` and `cφ` for every embedding. Use the existing CM-field/conjugation structure on each factor; `|Φ|=[E:ℚ]/2`. Conjugate type `cΦ` is the complement. A CM field is not defined again.

Sources: [MilneCM](#source-milnecm), Definition 1.8, p.11; [AGHMP](#source-aghmp), §3.4 p.420. Prerequisites: [NumberField.IsCMField][mathlib-numberfield.iscmfield]; [NumberField.IsCMField.complexConj][mathlib-numberfield.iscmfield.complexconj]; [NumberField.IsCMField.complexEmbedding_complexConj][mathlib-numberfield.iscmfield.complexembedding_complexconj]; [NumberField.IsCMField.complexConj_apply_apply][mathlib-numberfield.iscmfield.complexconj_apply_apply].

**Induced and primitive CM types** — primitivity of the supplied `CMType`. For a CM subalgebra `E₀⊂E`, `Φ` is induced from `Φ₀` iff `Φ` consists of all embeddings whose restriction belongs to `Φ₀`. For a CM FIELD `E`, the pair is primitive iff no proper CM subfield induces its type. Its unique primitive core is the fixed field of the right stabilizer of the extended type in a common Galois CM closure; the reflex field uses the left stabilizer. The field hypothesis is part of Milne Definition 1.8 and Proposition 1.9: no single primitive core is asserted for a product CM algebra.

Sources: [MilneCM](#source-milnecm), Proposition 1.9, pp.11–12; [Tsimerman](#source-tsimerman), §4 pp.384–385. Prerequisites: [CMType](#cm-0-1).

Conjugation composes an existing rational embedding with complex conjugation; `CMType.conjugate` takes the image of the selected finite set. For a rational algebra map `ι:E₀→E`, induction records `φ∈Φ` iff `φ∘ι∈Φ₀`; it applies to CM algebra inclusions as well as CM subfields. The primitive-core and double-reflex assertions retain the CM-field hypothesis. ShimuraVarieties §5.1, `TauCeti.CM.CMType.card`, supplies the embedding-partition cardinality theorem for every reduced finite-dimensional `ℚ`-algebra, including rank zero. Convert its rational ring maps to `AlgHom`s when using a finite selection; rational ring maps automatically preserve the rational algebra structure.

**Checks.**

- Conjugating an embedding twice returns it, and evaluation sends `i` to `−i` and `2+i` to `2−i` in the Gaussian case.
- A type and its conjugate have disjoint selections covering every embedding; conjugating the type twice returns it.
- If a selected embedding restricts outside the proposed inducing selection, the proposed induction fails. Restriction to the whole field instead gives the original selection.

**Basic API.**

- `CMType.ext`: Types with the same embedding subset are equal.
- `CMType.mem_conjugate_iff`: `φ∈cΦ` iff `φ∉Φ`.
- `CMType.card`: `2|Φ|=[E:ℚ]`.
- `CMType.conjugate_conjugate`: `c(cΦ)=Φ`.
- `CMType.induced_mem`: `φ` lies in the induced type iff `φ|E₀` lies in `Φ₀`.
- `CMType.induced_trans`: Induction along `E₀⊂E₁⊂E₂` equals direct induction.
- `CMType.primitive_core_unique`: For `E` a CM field, any primitive CM subpair inducing `Φ` is uniquely the embedded primitive core.

**Checks.**

- `CMType.test_gaussian`: For `E=ℚ(i)`, the type selecting `i↦i` has cardinal one.
- `CMType.test_not_full`: The entire embedding set of `ℚ(i)` is not a CM type.
- `CMType.test_product`: Types on `E₁×E₂` correspond to pairs of types, with additive cardinalities.
- Every CM type on an imaginary quadratic field is primitive.
- `CMType.test_zeta8_induced`: The stated two embeddings of `ℚ(ζ₈)` restrict to the same embedding of `ℚ(√−2)`, so this type is not primitive.
- For `E/E₀` finite, an induced type has cardinal `[E:E₀]|Φ₀|`.

**Required calculations and boundary cases.** For `ℚ(i)`, `{i↦i}` has cardinal one; both embeddings together and the empty set fail. For `ℚ(i)×ℚ(√−3)`, a type has one embedding of each factor, cardinal two. On `ℚ(ζ₈)`, the type with `ζ₈↦ζ₈` and `ζ₈↦ζ₈³` is induced from `ℚ(√−2)`; primitive must fail.

**Checks.**

- Restriction along `E⊂E` induces the original type, and conjugating an induced type conjugates its inducing type.
- A quadratic CM field has no proper CM subfield and every type on it is primitive. A proper CM subfield inducing a type contradicts primitivity.
- The two `ℚ(ζ₈)` embeddings above induce the same `ℚ(√−2)` type and are nonprimitive. Product types have no single primitive-core assertion.

<a id="cm-trace-contract"></a>

#### Trace reflex-field contract

The trace description supplies an intrinsic field inside `ℂ` and a comparison with ShimuraVarieties §P.3. The inverse-coset reflex-pair comparisons of CM.0 retain the field hypothesis.

**Trace description of the CM reflex field** — `CMType.reflexField`. For a finite étale CM algebra `E` and CM type `Φ`, choose a common finite Galois CM field `L⊂ℂ` containing the images of every embedding of every field factor. The reflex field is `E* = ℚ(Σ_{φ∈Φ} φ(a) : a ∈ E) ⊂ L`. Equivalently `E*=L^{Stab(Φ)}`, where Galois acts on `Hom_ℚ-alg(E,L)`; if `E` is a field this is the left stabilizer of the extended type `S⊂Gal(L/ℚ)`. A product algebra `E` is not embedded as a subalgebra of `L`. Identify this actual trace subfield with ShimuraVarieties §§P.3 and 5.1’s cocharacter reflex field, without a second generic carrier.

Sources: [MilneCM](#source-milnecm), Proposition 1.16, Definition 1.17 and Proposition 1.18, pp.13–14; [YZ](#source-yz), §2.2 p.546. Prerequisites: [CMType](#cm-0-1); [IntermediateField.adjoin][mathlib-intermediatefield.adjoin]; [IntermediateField.adjoin_le_iff][mathlib-intermediatefield.adjoin_le_iff]; `ShimuraVarieties:§P.3 and §5.1`.

**Supplied type-product, conjugation and change-of-type identities** — `CMType.typeNorm_identities`. For a CM FIELD `E` with type `Φ` and reflex type `Φ*` on `E*`, and `a∈(E*)×`, `NΦ(a)=∏ψ∈Φ*ψ(a)` lies in `E×`, satisfies `NΦ(a)·conjugate(NΦ(a))=N_{E*/ℚ}(a)`, and is multiplicative. For `γ∈Gal(ℚ̄/ℚ)`, transport the embedded pairs: `N_{γΦ}(γa)=γNΦ(a)`. Induction from the primitive core leaves the reflex field unchanged and the map to `E` is the inclusion of the primitive-core type product. These are algebraic formulas, not another construction of ShimuraVarieties §4.2’s idelic torus norm. For product CM algebras use ShimuraVarieties §4.2’s cocharacter norm rather than asserting one primitive reflex pair.

Sources: [MilneCM](#source-milnecm), Proposition 1.23, Remark 1.24 and Proposition 1.26, pp.15–17; Example 1.28, p.18. Prerequisites: ShimuraVarieties §5.1; [NumberField.IsCMField.complexEmbedding_complexConj][mathlib-numberfield.iscmfield.complexembedding_complexconj].

**Basic API.**

- `CMType.typeTrace`: `typeTraceΦ(a)=Σφ∈Φ φ(a)`.
- The type trace is `ℚ`-linear and sends `1` to `|Φ|`. It is not generally a field homomorphism.
- `CMType.reflexField_le_iff`: `E*⊂F` iff every `typeTraceΦ(a)` belongs to `F`.
- `CMType.typeTrace_conjugate` conjugates each finite trace sum. `CMType.reflexField_conjugate` identifies the two trace fields for finite reduced `ℚ`-algebras with a CM partition. The comparison with the conjugate image of the native `IntermediateField.adjoin` also holds for any rational algebra and finite embedding selection, without reducedness or finite-dimensionality; CM.0.1 states this as `embeddingPartitionTrace_conjugate`.
- `CMType.reflexField_stabilizer`: `Gal(L/E*)` is the stabilizer of `Φ` in `Hom_ℚ-alg(E,L)`; for `E` a field it is the left stabilizer of its extended type `S`.
- `CMType.reflexField_generic`: The trace subfield is the ShimuraVarieties §P.3 cocharacter reflex field under its specified embedding.

## How to read the build

The layers proceed from the supplied embedding partitions through reflex-pair and integral comparisons to realizations, then reciprocity and class fields, characters, and reduction. New names are proposed in `TauCetiRoadmap.ComplexMultiplicationAndExplicitReciprocity`; CM-type operations extend the supplied `TauCeti.CM.CMType` interface. Each definition has its API and discriminating Checks; each theorem records its hypotheses, source and immediate inputs. Source pages are printed page numbers in the editions under References. Checks involving heavy geometric carriers specify mathematical tests of those targets.

[Suggested.lean](Suggested.lean) states the light definitions and consequences expressible with the existing carriers, with representative calculations. The geometric, Hecke-character, level-function and quaternion-order constructions are specified here on the named supplier interfaces; an arbitrary function or matrix is not substituted for any of them. The finite-product lemmas in Layer 5 deliberately state their full algebraic generality before their CM specializations.

## Layer 0: Reflex pairs, integral data and concrete fields

<a id="cm-0-2"></a>

### 0.1 Inverse-coset reflex pairs

**Comparisons for the supplied inverse-coset reflex type** — `CMType.reflexType` from ShimuraVarieties §5.1, `TauCeti.CM.CMType.typeNorm_identities(d)`. Let `E` be a CM FIELD and `Φ` a CM type. Let `L/ℚ` be a finite Galois CM closure containing `E`, `G=Gal(L/ℚ)`, `H=Gal(L/E)` and `S={g:g|E∈Φ}`. Put `H*=Stab_left(S)`; import the supplier’s decomposition of the right H*-stable inverse set `S⁻¹` into cosets and its resulting `Φ*` on `E*=L^{H*}`. Prove that the embedded reflex pair is independent of `L`. The reflex pair is primitive; its double reflex is the primitive core of `(E,Φ)`, and recovers the original pair only when `Φ` is primitive. The supplied inverse-coset reflex-type construction and these comparisons are field-scoped; the trace reflex field of a CM algebra remains available separately.

Sources: [MilneCM](#source-milnecm), Examples 1.19 and 1.28, pp.14,18. Prerequisites: ShimuraVarieties §5.1, `TauCeti.CM.CMType.typeNorm_identities(d)`; [CMType](#cm-0-1); [primitive CM types](#cm-0-1); [CMType.reflexField](#cm-trace-contract); [CMType.reflexField_stabilizer](#cm-trace-contract).

**Basic API.**

- `embeddingPartitionTrace_conjugate`: For any rational algebra and any finite embedding selection, the field generated by the conjugates of its trace sums is the complex-conjugate image of its trace field. For a conjugate-partition selection this is the trace field of the conjugate type. Conjugating finite sums and applying native field adjunction proves this without a partition, finite-dimensionality or reducedness (MilneCM, Definition 1.17, p.13, with the finite-sum argument).
- `CMType.reflexType_closure_independent`: Enlarging or changing the common Galois CM closure preserves the embedded reflex pair.
- `CMType.reflexType_primitive`: The reflex type is primitive.
- `CMType.doubleReflex_primitiveCore`: The double reflex is canonically the primitive core, with the original embedded pair recovered in the primitive case.

**Checks.**

- `CMType.test_reflex_quadratic`: The reflex field of `ℚ(i)` with `i↦i` is `ℚ(i)` inside `ℂ`.
- `CMType.test_reflex_induced`: An induced type and its primitive core have the same reflex field.
- `CMType.test_reflex_not_Q`: For the selected Gaussian type, `typeTrace(i)=i`, so the reflex field is not `ℚ`.
- `CMType.test_reflex_type_quadratic`: The Gaussian type is its own reflex type after identifying its embedded reflex field.
- `CMType.test_double_reflex_induced`: For the `ℚ(ζ₈)` type induced from `ℚ(√−2)`, the double reflex has degree two.
- `CMType.test_closure_independence`: Two extensions of the same reflex embedding give the same inverse-coset membership; enlarging the normal closure therefore preserves the embedded reflex pair.

**Required calculations and boundary cases.** For an imaginary quadratic field, `E* =` the selected embedded copy of `E`. Inducing a type does not change its reflex field; this is not the primitive-core fixed field in general. A nonprimitive `ℚ(ζ₈)` type has quadratic double reflex, not the original quartic field. For quadratic `E=E*`, `NΦ` is the identity under the selected embedding; `NΦ(2+i)·conjugate(NΦ(2+i))=5`. Replacing `Φ` by its conjugate conjugates the norm, rather than leaving it equal.

**Checks.**

- On the selected `ℚ(i)` embedding, `typeTrace(1)=1`, `typeTrace(i)=i` and `typeTrace(2+i)=2+i`; on the conjugate type the last value is `2−i`. The trace field is the selected `ℚ(i)`, not `ℚ`.
- On a product of two quadratic CM fields, `typeTrace(1)=2`, ruling out a replacement by an arbitrary embedding. The trace of zero is zero, also for the rank-zero étale algebra and its empty type.
- The Gaussian reflex type is the same singleton; its conjugate gives the conjugate singleton; for the induced quartic type the double reflex is quadratic, so a rule always returning the original pair fails. The finite étale trace field remains available independently of the field-only reflex type.

<a id="cm-0-3"></a>

### 0.2 Integral reflex data and concrete fields

The integral selected-factor image carries the relative reflex discriminant. The examples make original/reflex and input/image distinctions computationally visible before these data enter reciprocity.

**The CM reflex order** — `CMType.reflexOrder`. For a CM field `E` with order `O` and type `Φ`, use `E*` and YZ §2.2’s trace-selected splitting `E*⊗_ℚ E=~E_Φ⊕~E_Φ^c`. Define `R_Φ` as the image of `O_{E*}⊗_ℤ O` in `~E_Φ`. It is an `O_{E*}`-order in that finite étale `E*`-algebra. Define `d_Φ` as its RELATIVE trace-discriminant ideal in `O_{E*}`, distinct from the absolute discriminant of `O` or `E`. It need not generally be the full integral closure. In the quadratic case `E*=E` and `~E_Φ=E`, the first tensor factor already maps onto `O_E`, so `R_Φ=O_E` for every `O⊂O_E` and `d_Φ=(1)`.

Sources: [YZ](#source-yz), §2.2 p.546. Prerequisites: [CMType.reflexField](#cm-trace-contract); [CMType](#cm-0-1); [GlobalNumberFields Layer 11][globalnumberfields-11]; [ClassGroup][mathlib-classgroup]; [ClassGroup.mk][mathlib-classgroup.mk]; [CommRing.Pic][mathlib-commring.pic]; [ClassGroup.equivPic][mathlib-classgroup.equivpic].

**A non-Galois quartic CM type and its reflex** — `quarticReflexField`. Let `a=i√(3+√2)`, `b=i√(3−√2)`, `E=ℚ(a)`, and `Φ` send `a` to `a` and `b`. Then `a⁴+6a²+7=0`, `E` has real subfield `ℚ(√2)`, `E/ℚ` is non-Galois, `Φ` is primitive, and `E*=ℚ(a+b)`, with `(a+b)⁴+12(a+b)²+8=0` and real subfield `ℚ(√7)`. In the `D₄` Galois closure, the inverse-coset construction gives `Φ*`; recover `E` by the double reflex. The two quartic fields must not be identified by degree alone. On native intermediate fields, `quarticReflexField` supplies rational algebra embeddings taking the generator of `ℚ(a)` to `a` and `b`, identifies the field of their trace sums with `ℚ(a+b)`, proves that both fields have degree four and that `E/ℚ` is non-Galois, and identifies the real elements of the two fields with `ℚ(√2)` and `ℚ(√7)`, respectively.

**Checks.**

- The selected roots satisfy `a²=−3−√2`, `b²=−3+√2` and `ab=−√7`; replacing `b` by `−b` reverses the product sign.
- The trace sum of the generator is `a+b`, whose polynomial is `X⁴+12X²+8`; its degree is four.
- The real subfields `ℚ(√2)` and `ℚ(√7)` are distinct, so neither equality of degrees nor a same-real-subfield identification proves the reflex comparison.

Sources: [MilneCM](#source-milnecm), §1 pp.11–19, stabilizer construction. Prerequisites: [CMType.reflexField](#cm-trace-contract); [CMType.reflexType](#cm-0-2); [CMType.typeNorm_identities](#cm-trace-contract).

**Conductor-sensitive nonmaximal quadratic order example** — worked Check. For `E=ℚ(i)`, `O=ℤ+3ℤi` has conductor 3OE, discriminant `−36`, units {±1}, and `|Pic(O)|=2` whereas `|Cl(OE)|=1`. The invertible `O`-ideal `a=(2,1+3i)` has norm `2` and represents the nontrivial class of order two. Ideals meeting the conductor cannot be transported by the prime-to-conductor extension/contraction equivalence without an additional argument.

Sources: [MIT16](#source-mit16), §16.4, Definition 16.9 and Theorem 16.12, pp.6–7; [MilneCM](#source-milnecm), §9 p.78, footnote 25. Prerequisites: [GlobalNumberFields Layer 11][globalnumberfields-11]; [CMType](#cm-0-1); [ClassGroup][mathlib-classgroup]; [ClassGroup.mk][mathlib-classgroup.mk]; [CommRing.Pic][mathlib-commring.pic]; [ClassGroup.equivPic][mathlib-classgroup.equivpic].

**Basic API.**

- `CMType.reflexOrder_image`: Elements of `RΦ` are images of elements of `OE*⊗O`.
- `CMType.reflexOrder_fractionAlgebra`: `RΦ⊗ℚ` is the selected factor `~EΦ`.
- `CMType.reflexOrder_discriminant`: `dΦ` is the relative `O_{E*}`-ideal discriminant of the trace pairing on `RΦ`. On each localization where this finite torsion-free `O_{E*}`-module is free, take the determinant in an integral basis; change of basis multiplies it by a unit square, so these local ideals glue. This relative ideal is constructed with the selected factor, separately from GlobalNumberFields Layer 11’s absolute integer discriminant; it is not `disc_ℤ(O)`.

**Checks.**

- `CMType.test_reflex_order_quadratic`: For a maximal imaginary quadratic order, `RΦ` identifies with `OE`.
- `CMType.test_reflex_order_nonnormal`: For `E=ℚ(ζ₅)`, `Φ={id,σ₂}` and `O=ℤ+2O_E`, the reflex field is `E` and the selected algebra is `E×E`, with tensor image `x⊗y↦(xy,xσ₂(y))`. This image lies in `{(x,y)∈O_E²:x≡y mod 2O_E}` and excludes `(1,0)`. Its integral closure is `O_E²`, so the image is strictly smaller. This is the nonnormal-order boundary target for `CMType.reflexOrder` (YZ §2.2 p.546 and the displayed tensor-image calculation).
- `CMType.test_order_discriminant`: For `E=ℚ(i)` and `O=ℤ+3ℤi`, the reflex image `RΦ` is `O_E` and its relative discriminant `dΦ` is the unit ideal, although `disc_ℤ(O)=−36`. Using the absolute discriminant of `O` as `dΦ` gives the wrong answer.

**Required calculations and boundary cases.** For any imaginary quadratic `O⊂OE`, the selected factor is `E`, the image is `OE` and the relative discriminant is the unit ideal. In higher degree, do not simplify the image to its integral closure without a proof. Extending YZ’s maximal-order input to `O` requires the image/full-rank argument. Check both quartic polynomials, different real subfields and the complete embedding partition. Degree four alone is not the criterion for primitivity. Reject a maximal-order class-group replacement: it gives cardinal one and extra units. Reject a rule declaring every nonzero ideal of `O` invertible.

**Concrete input API.** Use the native intermediate field `ℚ(i)⊂ℂ` and its selected singleton type from ShimuraVarieties §5.1. `quarticA` and `quarticB` are the displayed complex numbers; expose their squares and positive imaginary parts. Their square, quartic-polynomial and product-sign identities are the worked Checks below. The supplied Gaussian trace-reflex comparison identifies its reflex field with the selected embedded `ℚ(i)`. `gaussianOrderThree` is the actual subring `{m+3ni:m,n∈ℤ}⊂ℂ`, not a new abstract quadratic-order carrier. Its identification with the GlobalNumberFields Layer 11 order transports the unit group. The class-number value two is a worked Check; applications requiring that value carry it as an explicit hypothesis.

**Checks.**

- `ℚ(i)` contains `i` and `2+i`, while `ℚ` does not contain `i`. Its selected type has one embedding; the empty and full embedding sets both fail the partition condition.
- `a²=−3−√2`, `a⁴+6a²+7=0` and `Im(a)>0`. Similarly `b²=−3+√2`, `b⁴+6b²+7=0`, `Im(b)>0` and `ab=−√7`. These signs give `(a+b)²=−6−2√7` and the reflex polynomial above. The lower-half-plane root `−b` has the same square and quartic polynomial, so those two identities alone do not select the required embedding value.
- `i` is absent from `gaussianOrderThree`, while `3i` and `2+3i` belong. Its unit group and Picard group both have cardinal two; replacing it with `ℤ[i]` changes these to four and one respectively.

### Examples

The Gaussian singleton and its conjugate pin the partition and trace. The induced `ζ₈` type distinguishes the primitive core from the original field. The non-Galois quartic computes both defining polynomials and different real subfields. The conductor-three Gaussian order separates its Picard group, units and absolute discriminant from those of the reflex image.

### Dependencies

Mathlib’s CM fields, embeddings and intermediate-field adjunction; GlobalNumberFields Layer 11 for orders; ShimuraVarieties §§P.3 and 5.1 for CM types, primitive induction, trace reflex fields and type norms.

## Layer 1: Ideal lattices and CM realizations

<a id="cm-1-1"></a>

### 1.1 Lattice curves, action and classification

Specialize complex uniformization to proper invertible quadratic-order ideals. The comparison transports origins, scalar endomorphisms and algebraic automorphisms, so the ideal action and Picard classification are statements about elliptic curves as well as analytic quotients.

**The elliptic curve of an ideal lattice** — `idealLatticeCurve`. Fix an imaginary quadratic field `E⊂ℂ`, an order `O⊂E` and a proper invertible fractional `O`-ideal `I`. Its image `Λ=I⊂ℂ` is a rank-two `ℤ`-lattice. Apply AbelianSchemesAndArithmeticModuli A5 / ModularCurvesPartII §§1.1–1.5 uniformization to construct the actual elliptic scheme `E_I` and a Weierstrass equation whose analytic group is `ℂ/Λ`; the multiplier ring `{x∈E:xI⊂I}` acts on `E_I` and identifies with `End_ℂ(E_I)=O`. The chosen equation is compared through EllipticCurves Layer 1 / ModularCurvesPartII §§1.1–1.5, not treated as a new curve carrier.

Sources: [MIT16](#source-mit16), Introduction p.1; Theorem 16.4 p.4 and Corollary 16.5 p.5; §16.4, Definition 16.9 and Theorem 16.12, pp.6–7; [MilneCM](#source-milnecm), Proposition 3.17, p.31. Prerequisites: [CMType](#cm-0-1); [GlobalNumberFields Layer 11][globalnumberfields-11]; `AbelianSchemesAndArithmeticModuli:A5`; `ModularCurvesPartII:§§1.1–1.5`; [EllipticCurves Layer 1][ellipticcurves-1]; `TauCeti.AlgebraicGeometry.AbelianVariety`; `TauCeti.AlgebraicGeometry.AbelianVariety.End`; [WeierstrassCurve.j][mathlib-weierstrasscurve.j]; [ClassGroup][mathlib-classgroup]; [ClassGroup.mk][mathlib-classgroup.mk]; [CommRing.Pic][mathlib-commring.pic]; [ClassGroup.equivPic][mathlib-classgroup.equivpic].

**The left ideal action on CM elliptic curves** — `idealAction`. For a proper invertible fractional `O`-ideal `a`, define `[a]⋆E_I=E_{a⁻¹I}`. For an integral invertible `a`, inclusion `I⊂a⁻¹I` gives an `O`-linear isogeny `φ_a:E_I→E_{a⁻¹I}` with kernel `a⁻¹I/I`. Transport it to the existing Weierstrass isogeny. Ideal multiplication is compatible with composition, with the target of the second map tracked; principal ideals act trivially on isomorphism classes, but their chosen maps need not be identity maps.

Sources: [MIT20](#source-mit20), §20.3 p.5, ideal-action/class-group torsor and norm-degree formulas; [GZ](#source-gz), Chapter III §4 p.257, equation (4.2). Prerequisites: [idealLatticeCurve](#cm-1-1); [GlobalNumberFields Layer 11][globalnumberfields-11]; [EllipticCurves Layer 1][ellipticcurves-1]; `TauCeti.Isogeny`; `TauCeti.Isogeny.degree`; [ClassGroup][mathlib-classgroup]; [ClassGroup.mk][mathlib-classgroup.mk]; [CommRing.Pic][mathlib-commring.pic]; [ClassGroup.equivPic][mathlib-classgroup.equivpic].

**Elliptic CM Picard classification** — `idealAction.picardEquiv`. The map `[I]↦[E_I,O-action]` is a bijection `Pic(O) →` the complex `O`-linear isomorphism classes of elliptic curves with the fixed embedded CM type and full endomorphism ring `O`. The ideal action is simply transitive. Forgetting the specified action/type requires the conjugation adapter; the statement does not replace `Pic(O)` by `Cl(O_E)`.

Sources: [MIT20](#source-mit20), §20.3 p.5, ideal-action/class-group torsor and norm-degree formulas. Prerequisites: [idealLatticeCurve](#cm-1-1); [idealAction](#cm-1-1); [GlobalNumberFields Layer 11][globalnumberfields-11]; [ClassGroup][mathlib-classgroup]; [ClassGroup.mk][mathlib-classgroup.mk]; [CommRing.Pic][mathlib-commring.pic]; [ClassGroup.equivPic][mathlib-classgroup.equivpic].

**Exceptional CM automorphism factors** — `idealLatticeCurve.automorphism_factors`. For `E_I/ℂ` with full quadratic order `O`, `Aut(E_I,0)=O×`. Its order is `6` for `O=ℤ[ζ₃] (j=0)`, `4` for `O=ℤ[i] (j=1728)`, and `2` for every other quadratic order. This concerns origin-preserving automorphisms, not translations. In counting isogeny kernels or level orbits, retain these factors; level `N≥3` rigidifies a polarized elliptic object when the characteristic is prime to `N`.

Sources: [MIT22](#source-mit22), Remark 22.2, pp.1–2. Prerequisites: [idealLatticeCurve](#cm-1-1); [EllipticCurves Layer 1][ellipticcurves-1]; `AbelianSchemesAndArithmeticModuli:A6.18/polarizedAutomorphisms`; [idealLatticeCurve.endomorphismRing](#cm-1-1).

**Basic API.**

- `idealLatticeCurve.uniformization`: `E_I(ℂ)≅ℂ/I` as complex Lie groups, carrying its origin and `O`-action.
- `idealLatticeCurve.homothety`: For `u∈E×`, multiplication by `u` induces an `O`-linear isomorphism `E_I≅E_{uI}`.
- `idealLatticeCurve.endomorphismRing`: `End(E_I)` is the actual multiplier ring of `I`, equal to `O` for proper `I`.
- `idealLatticeCurve.j`: The pinned Weierstrass `j` equals normalized modular `j(τ)` for any oriented basis `I=ℤω₁+ℤω₂`, `τ=ω₂/ω₁` in `H`.
- `idealAction.one`: `[O]⋆E_I=E_I` up to the specified `O`-linear identification.
- `idealAction.mul`: `[ab]⋆E_I=[a]⋆([b]⋆E_I)`, with the canonical multiplication identification of lattices.
- `idealAction.kernel`: For integral invertible `a`, `ker φ_a=a⁻¹I/I` as an `O`-module.
- `idealAction.principal`: For `a=(u)`, multiplication by `u` identifies `a⁻¹I` with `I` and trivializes the class action.

**Checks.**

- `idealLatticeCurve.test_gaussian`: The square lattice gives `j=1728` and four origin-preserving automorphisms.
- `idealLatticeCurve.test_nonmaximal`: For `O=ℤ+3ℤi` and `I=O`, multiplication by `i` fails to preserve `I` and is not an endomorphism.
- `idealLatticeCurve.test_scale`: Replacing `I` by `2I` gives an isomorphic CM elliptic scheme and the same `j`.
- `idealAction.test_gaussian_prime`: `a=(2+i)` on `ℤ[i]` gives a kernel of cardinal `5`.
- `idealAction.test_inverse`: Acting by `a` and `a⁻¹` successively returns the same CM isomorphism class.
- `idealAction.test_conductor`: The conductor ideal `3ℤ[i]` as an ideal of `ℤ+3ℤi` is not an admissible invertible ideal for this action.

**Required calculations and boundary cases.** For `I=ℤ[i]`, `j(E_I)=1728` and `End` is `ℤ[i]`. For `I=ℤ+3ℤi`, `End` is precisely that order; its missing `i` cannot be inserted. For `O=ℤ[i]` and `a=(2+i)`, the map has degree `5` and target is isomorphic to the original curve. For `O=ℤ+3ℤi`, the norm-two nonprincipal ideal changes the CM isomorphism class. `O=ℤ+3ℤi` yields exactly two classes, while `O_E=ℤ[i]` yields one. The nonmaximal Gaussian order of conductor `3` has only `±1`, despite its CM field containing `i`.

**Checks.**

- The unit ideal gives the identity map; `(2+i)` on `ℤ[i]` gives degree five while fixing the class.
- The norm-two nonprincipal ideal of `ℤ+3ℤi` exchanges its two CM classes. Its square returns the class, although the composite isogeny is not the identity map.
- The lattice curve has `j=1728` for `ℤ[i]`, `j=0` for the Eisenstein lattice, and full endomorphism order `ℤ+3ℤi` for that nonmaximal lattice.

<a id="cm-1-2"></a>

### 1.2 Forms, isogeny degree and rational twisting

Positive forms give a finite arithmetic description of the same CM points. Lattice index computes the degree of the algebraized ideal isogeny. Quadratic twisting records how the extra rational-CM endomorphism transforms under Galois descent.

**Forms-to-CM-point comparison** — `quadraticFormsCMComparison`. For `D<0`, `D≡0` or `1 mod 4`, consume IntegralLattices B2’s equivalence between primitive positive forms and proper ideal classes, and B5’s complete reduced representatives. For `[a,b,c]`, its supplied ideal `ℤa+ℤ(−b+√D)/2` uniformizes to the CM point `τ=(−b+√D)/(2a)∈H`. Prove compatibility with the elliptic `O_D`-action and normalized `j`. This is the comparison with analytic/algebraic CM points; the form/ideal equivalence and reduction theory remain owned by IntegralLattices. Imprimitive forms do not have this full endomorphism order.

Sources: [MIT16](#source-mit16), §16.4, Definition 16.9 and Theorem 16.12, pp.6–7; [CRT](#source-crt), §5.2, pp.17–18, polycyclic/reduced-form enumeration. Prerequisites: [idealAction.picardEquiv](#cm-1-1); [GlobalNumberFields Layer 11][globalnumberfields-11]; `ModularCurvesPartII:§§1.1–1.5`; [ClassGroup][mathlib-classgroup]; [ClassGroup.mk][mathlib-classgroup.mk]; [CommRing.Pic][mathlib-commring.pic]; [ClassGroup.equivPic][mathlib-classgroup.equivpic]; `IntegralLattices:B5`.

**Degree of an ideal isogeny** — `idealAction.degree_eq_norm`. For any nonzero integral proper invertible quadratic-order ideal `a`, `deg(φ_a)=|a⁻¹I/I|=N_O(a)=[O:a]`. For maximal-order elliptic number-field models, consume ArithmeticStatisticsPartVII `cm_ideal_isogeny_comparison` and compare its kernel with `a⁻¹I/I`; the proper invertible nonmaximal-order lattice comparison is a target here. Invertibility suffices; prime-to-conductor conditions are needed for the separate extension/contraction comparison. This is total scheme degree; in characteristic zero all these maps are separable. Multiplication by nonzero `u∈O` has degree `|N_{E/ℚ}(u)|`. Compatibility must identify this index with `TauCeti.Isogeny.degree`, not with a chosen equation’s polynomial degree.

Sources: [MIT20](#source-mit20), §20.3 p.5, ideal-action/class-group torsor and norm-degree formulas; [GZ](#source-gz), Chapter III §4 p.257. Prerequisites: [idealAction](#cm-1-1); `ArithmeticStatisticsPartVII:support-cm/cm_ideal_isogeny_comparison`; `TauCeti.Isogeny.degree`; `AbelianSchemesAndArithmeticModuli:A6.1/Hom.deg`; `AbelianSchemesAndArithmeticModuli:A6.12/traceDegreeSubfield`; [GlobalNumberFields Layer 11][globalnumberfields-11]; [ClassGroup][mathlib-classgroup]; [ClassGroup.mk][mathlib-classgroup.mk]; [CommRing.Pic][mathlib-commring.pic]; [ClassGroup.equivPic][mathlib-classgroup.equivpic]; [idealAction.kernel](#cm-1-1).

**The rational CM quadratic self-twist isogeny** — `rationalCMSelfTwist`. Let `E/ℚ` be an elliptic curve with `End_ℚ̄(E)` an order in an imaginary quadratic `K`. For its quadratic character `χ_K`, `E` and the Weierstrass quadratic twist `E^{χ_K}` are `ℚ`-isogenous. Choose a nonzero anti-invariant `α∈O (ᾱ=−α)`; under the standard K-isomorphism from the twist to `E`, multiplication by `α` descends to the required `ℚ`-isogeny. Transport between the equation and elliptic-scheme carriers through EllipticCurves Layer 1 / ModularCurvesPartII §§1.1–1.5. Its kernel/degree is the existing ideal/multiplication map, not an asserted isomorphism.

Source: derived from [MIT16](#source-mit16), Theorem 16.4 and Corollary 16.5, pp.4–5, and [EllipticCurves Layer 5][ellipticcurves-5] (AEC X.2, X.5). The Lie-scalar identification is Galois equivariant, so `σ(α)=χ_K(σ)α`; composing with the twist trivialization cancels the quadratic cocycles and descends the nonzero map. BT §3.1 p.6 supplies context for the L-factorization. Prerequisites: [idealLatticeCurve](#cm-1-1); [idealAction.degree_eq_norm](#cm-1-2); [EllipticCurves Layer 5][ellipticcurves-5]; [EllipticCurves Layer 1][ellipticcurves-1].

**Checks.**

- On `y²=x³−x`, the anti-invariant unit `i` gives a degree-one quadratic self-twist map.
- For the conductor-three Gaussian order, `3i` is anti-invariant and has norm nine; using `i` would leave the actual endomorphism order.
- The two Galois signs cancel in the composed twist map; the anti-invariant endomorphism alone is not a rational endomorphism.

**Required calculations and boundary cases.** For `D=−36` the reduced classes `[1,0,9]` and `[2,2,5]` give the two proper classes. An imprimitive form describes a different order and must not enter `H_D`. For `(2+i)` the degree is `5`; for integer `[n]`, `n≠0`, the degree is `n²`. In `O=ℤ+3ℤi`, the principal ideal `3O` is invertible and has norm nine, although it meets the conductor; the degree theorem applies to it. The conductor ideal `3ℤ[i]` is a different `O`-ideal. For `y²=x³−x` and `K=ℚ(i)`, `α=i` gives degree-one self-twist; for a nonmaximal order, use its actual anti-invariant element, not `i` if `i` is absent.

<a id="cm-1-3"></a>

### 1.3 Serre tensor, Lie and period comparisons

The Serre tensor, with its functoriality, base change and realizations, is AbelianSchemesAndArithmeticModuli A1.3a and A4.7a. Here it is specialized to a ring of integers acting with `[L:ℚ]` equal to twice the relative dimension. The CM content is the degree of the ideal isogenies, inseparable part included, the preservation of the CM type, and the eigenspace and period comparisons between an abelian scheme and its ideal twists. For maximal quadratic-order elliptic curves over number fields, consume ArithmeticStatisticsPartVII `cm_ideal_isogeny_comparison` for ideal kernels, norm degrees and the differential embedding; compare those supplied maps with the Serre-tensor maps. The arbitrary-base and higher-dimensional comparisons are targets here. Lie algebras, finite-flat kernels, eigenspace ranks and both period pairings refer to the same action and the same underlying abelian scheme.

**Serre tensoring by a CM ideal** — `cmSerreTensor`. Let `L` be a totally complex number field with `[L:ℚ]=2d`, `S` a scheme and `A/S` an abelian scheme of relative dimension `d` with an injective ring map `ι:O_L→End_S(A)`. For a finite projective `O_L`-module `M` (`O_L` is commutative, so its left and right module structures agree), `cmSerreTensor M A` is the abelian scheme `M⊗_{O_L}A` of A1.3a `relativeSerreTensor`, with `T`-points `M⊗_{O_L}A(T)` and with `O_L` acting through `M`. Since `Spec O_L` is connected, `M` has constant rank `r`. By A4.7a, `Lie(M⊗A/S)≅(M⊗_ℤ O_S)⊗_{O_L⊗O_S}Lie(A/S)`, and `M⊗_ℤ O_S` is free of rank `r` over each semilocal ring `O_L⊗O_{S,s}`; so `M⊗A` has relative dimension `rd`. Rank zero gives the identity scheme `S` of A1.3a, of relative dimension zero, which is not a CM object. A module map `f:M→N` induces `f⊗A` by A1.3a-functoriality; in particular nonzero fractional ideals `a⊂b` give a homomorphism `a⊗A→b⊗A`. For an invertible fractional ideal `a`, choose nonzero integers `m∈ℤ` with `ma⊂O_L` and `n∈a`. The maps induced by `a→O_L`, `y↦my`, and `O_L→a`, `1↦n`, compose in both orders to multiplication by `mn`. So `a⊗A` is `O_L`-linearly isogenous to `A`. For `M≠0` the `O_L`-action on `M⊗A` is again injective: `End_S(M⊗A)` is torsion-free, `M⊗A` has positive relative dimension, and every nonzero ideal of `O_L` has finite index. When `Lie(A/S)` is moreover projective over `O_L⊗O_S`, so that `A` has CM by `O_L` in the sense of KS, the same holds for `a⊗A`: `a⊗_ℤ O_S` is locally on `S` free of rank one over `O_L⊗O_S`, so `Lie(a⊗A/S)` is locally on `S` isomorphic to `Lie(A/S)` as an `O_L⊗O_S`-module. Over an `O_{L^Gal}[1/d_L]`-algebra, where the decomposition into embedding eigenspaces is defined, `a⊗A` therefore has the same CM type as `A`. The generic tensor, Lie and cohomology carriers are not constructed again.

Sources: [KS](#source-ks), §1.2, Definition 1.8, the Serre construction (1.2.3) and the Lie identification that follows it, p.9. Prerequisites: [CMType](#cm-0-1); `AbelianSchemesAndArithmeticModuli:A1.3a/relativeSerreTensor`; `AbelianSchemesAndArithmeticModuli:A1.3a/relativeSerreTensor-functoriality`; `AbelianSchemesAndArithmeticModuli:A4.7a/relativeSerreTensor-lie-tate`; `AbelianSchemesAndArithmeticModuli:A0.1–A0.2`; `AbelianSchemesAndArithmeticModuli:A1.1–A1.3`; `TauCeti.AlgebraicGeometry.AbelianVariety`; [CommRing.Pic.mapAlgebra][mathlib-commring.pic.mapalgebra].

**CM tensor ideal inclusions and their kernels** — `cmSerreTensor.ideal_kernel_degree`. Assume only the hypotheses of `cmSerreTensor`: an injective `O_L`-action with `[L:ℚ]` twice the relative dimension, with no type or Lie condition. Then nonzero fractional ideals `a⊂b` induce an isogeny `a⊗A→b⊗A` in the sense of A3.1, whose kernel is finite locally free of rank `[b:a]`. For a nonzero integral ideal `c⊂O_L`, the map `[c]:A→c⁻¹⊗A` induced by `O_L⊂c⁻¹` is the `c`-multiplication map. Under the A1.3a identification `(c⁻¹⊗A)(T)≅Hom_{O_L}(c,A(T))`, coming from `Hom_{O_L}(c⁻¹,O_L)=c`, it sends a point `P` to `x↦xP`. Its kernel is therefore `A[c]=⋂_{x∈c}ker[x]`, already cut out by two generators of `c`, and its degree is `N_{L/ℚ}(c)=[O_L:c]`. For `c=(n)` with `n≠0` the degree is `|n|^{[L:ℚ]}=|n|^{2d}`. These degrees are finite-flat ranks: inseparable contributions at residue characteristics dividing `[b:a]` are counted.

The proof first shows that `x∈O_L∖{0}` acts with rank `N_{L/ℚ}(x)` on any abelian scheme `B/S` of relative dimension `d` with injective `O_L`-action, such as `b⊗A`. `End_S(B)` is torsion-free, and a homomorphism vanishing on a geometric fibre vanishes on that component (A1.2(3)); since `O_L/I` is finite for every nonzero ideal `I`, the action stays injective on every geometric fibre. There A6.12 `traceDegreeSubfield`, with `F=L` of `deg`ree `2d`, gives `deg x=N_{L/ℚ}(x)`; ranks are locally constant by A3.1. Now let `a⊂b`, put `c=ab⁻¹⊂O_L`, fix a prime `ℓ`, and choose `x∈c` with `v_𝔭(x)=v_𝔭(c)` at every prime `𝔭` above `ℓ`. The module maps `b→xb (y↦xy)`, `xb⊂a` and `a⊂b` compose to multiplication by `x` on `b`. By A1.3a-functoriality the induced maps compose to the action of `x` on `b⊗A`, so all three are isogenies and their ranks multiply (A3.1 `IsAbelianIsogeny.comp_rank`) to `N(x)=[b:xb]=[b:a]·[a:xb]`. The integral ideal `c′=xc⁻¹` is prime to `ℓ`, and `z=N(c′)=[a:xb]` lies in `c′`, so `za⊂xb`. The maps `a→xb (y↦zy)` and `xb⊂a` compose to multiplication by `z` on `a`, hence to `[z]` on `a⊗A`, of rank `z^{2d}`. So the map `xb⊗A→a⊗A` has rank prime to `ℓ`, and the `ℓ`-part of the rank of `a⊗A→b⊗A` is the `ℓ`-part of `[b:a]`. Since `ℓ` is arbitrary, the rank is `[b:a]`.

Sources: [KS](#source-ks), §1.2, the statement after equation (1.2.3), p.9, and Definition 1.9, p.10; KS state the degree formula without proof, and the argument above supplies it from the cited supplier targets. Prerequisites: [cmSerreTensor](#cm-1-3); `AbelianSchemesAndArithmeticModuli:A1.3a/relativeSerreTensor`; `AbelianSchemesAndArithmeticModuli:A1.3a/relativeSerreTensor-functoriality`; `AbelianSchemesAndArithmeticModuli:A1.1–A1.3`; `AbelianSchemesAndArithmeticModuli:A3.1/IsAbelianIsogeny`; `AbelianSchemesAndArithmeticModuli:A6.12/traceDegreeSubfield`; [GlobalNumberFields Layer 11][globalnumberfields-11].

**CM Lie and Hodge eigenspace comparison** — `cmHodgeEigenspaces`. Let `R⊂ℂ` be an `O_{L^Gal}[1/d_L]`-algebra and `A/R` an abelian scheme with CM by `O_L` in the sense of `cmSerreTensor`: an injective `O_L`-action with `[L:ℚ]=2d` and `Lie(A/R)` projective over `O_L⊗R`. There is a CM type `Σ` of `L`, lifted from a CM subfield and called the type of `A`, such that `Lie(A/R)` has type `Σ` and `ω_{A∨/R}` has type `Σ̄`. The covariant Hodge sequence `0→ω_{A∨/R}→H_A→Lie(A/R)→0`, with `H_A=Hom(H¹_dR(A/R),O_R)≅H¹_dR(A∨/R)`, splits as `T_{L,R}`-modules into `H_A(Σ̄)⊕H_A(Σ)`. The first summand is `ω_{A∨/R}`, and the second maps isomorphically onto `Lie(A/R)`. The `R`-dual `ω_A` of `Lie(A/R)` carries the inverse torus action: `ω_A=⊕_{σ∈Σ}ω_A(−σ)`, with `γ∈O_L×` acting on `ω_A(−σ)` by `σ(γ)⁻¹`. This inverse action is distinguished from pullback by the multiplication map. For an invertible fractional ideal `a`, `a⊗A` again has CM by `O_L` of type `Σ`. The covariant comparison of A4.7a, `H_{a⊗A}≅a⊗_{O_L}H_A`, gives `H_{a⊗A}(σ)≅(a⊗_{O_L,σ}R)⊗_R H_A(σ)` for every embedding `σ`, compatibly with the Hodge sequences of `A` and `a⊗A`. The isogeny `[c]` induces on `H` the map coming from `O_L⊂c⁻¹`.

Sources: [KS](#source-ks), Proposition 1.11 and Corollary 1.12, pp.10–11; Definition 1.7, p.9, for `H_A`. Prerequisites: [cmSerreTensor](#cm-1-3); [cmSerreTensor.lie](#cm-1-3); `AbelianSchemesAndArithmeticModuli:A4.3/AbelianH1dR`; `AbelianSchemesAndArithmeticModuli:A4.7a/relativeSerreTensor-lie-tate`; `AbelianSchemesAndArithmeticModuli:A5.6–A5.7`; [CommRing.Pic.mapAlgebra][mathlib-commring.pic.mapalgebra].

**CM period and de Rham pairings** — `cmPeriodPairings`. Under the same complex CM hypotheses, the degree-one integration pairing of A5.6–A5.7 restricts to `ω_{A/ℂ}×H₁(A(ℂ),ℤ)→ℂ^Σ`. The `O_L`-linear de Rham duality of A4.3 and the Hodge decomposition induce a nondegenerate pairing `conjugate(ω_{A/ℂ})×ω_{A∨/ℂ}→ℂ^{Σ̄}`. Its first argument is the complex-conjugate vector space; it is not the bilinear pairing `ω_A×ω_{A∨}` without conjugation. The period pairing is natural in `O_L`-linear homomorphisms `f:A→B`, in the sense that `⟨f^*ω,γ⟩_A=⟨ω,f_*γ⟩_B`; the de Rham pairing is natural with `f^∨` on the dual side. For the ideal twists of `cmSerreTensor.periodLattice`, all Lie algebras are identified with the same `ℂ^Σ` and `H₁((a⊗A)(ℂ),ℤ)` is `aΛ`. The pairing of `a⊗A` is the evaluation of `ω_{A/ℂ}=Hom_ℂ(ℂ^Σ,ℂ)` on the lattice `aΛ⊂ℂ^Σ`, made `L⊗ℂ`-linear as for `A`, and `[c]^*` and `[c]_*` intertwine the pairings of `A` and `c⁻¹⊗A`.

Sources: [KS](#source-ks), Corollary 1.13, p.11, and the period lattice (1.3.3)–(1.3.4), p.12. Prerequisites: [cmHodgeEigenspaces](#cm-1-3); [cmSerreTensor.periodLattice](#cm-1-3); `AbelianSchemesAndArithmeticModuli:A4.3/AbelianH1dR`; `AbelianSchemesAndArithmeticModuli:A5.1/AbelianLattice`; `AbelianSchemesAndArithmeticModuli:A5.6–A5.7`.

**Basic API.**

- `cmSerreTensor.unit`: `O_L⊗A≅A` as abelian schemes with `O_L`-action (A1.3a, the case `M=R`).
- `cmSerreTensor.directSum`: `(M⊕N)⊗A≅(M⊗A)×_S(N⊗A)`, including the empty sum (A1.3a-functoriality).
- `cmSerreTensor.assoc`: `M⊗(N⊗A)≅(M⊗N)⊗A`, from the point formula of A1.3a and Yoneda; this uses that `O_L` is commutative, so that `N⊗A` carries an `O_L`-action.
- `cmSerreTensor.faithful`: For `M≠0` the `O_L`-action on `M⊗A` is injective, and `a⊗A` is `O_L`-linearly isogenous to `A` for every invertible `a`.
- `cmSerreTensor.lie`: `Lie(M⊗A)=M⊗_{O_L}Lie(A)` as `O_L⊗O_S`-modules; for invertible `a`, `Lie(a⊗A)` is locally on `S` isomorphic to `Lie(A)`, so the type is preserved (A4.7a; KS p.9).
- `cmSerreTensor.baseChange`: `(M⊗A)_{S′}≅M⊗A_{S′}` with the pulled-back `O_L`-action, for every `S′→S` (A1.3a-base-change).
- `cmSerreTensor.tate`: For `ℓ` invertible on `S`, `T_ℓ(M⊗A)≅M⊗_{O_L}T_ℓA` (A4.7a). On a geometric fibre `T_ℓA` is locally free of rank one over `O_L⊗ℤ_ℓ` (A6.12 and torsion-freeness over the product of discrete valuation rings `O_L⊗ℤ_ℓ`), so `T_ℓ(a⊗A)≅a⊗T_ℓA` has rank one as well.
- `cmSerreTensor.periodLattice`: Over `ℂ`, fix `ω(A):Lie(A/ℂ)≅ℂ^Σ=(L⊗ℂ)(Σ)`. Then `Lie(a⊗A/ℂ)=a⊗_{O_L}Lie(A/ℂ)` is identified with `ℂ^Σ` through `a⊗_{O_L}L=L`, the period lattice of `a⊗A` is `aΛ`, and `(a⊗A)(ℂ)≅ℂ^Σ/aΛ`. Under these identifications `[c]` is the projection `ℂ^Σ/Λ→ℂ^Σ/c⁻¹Λ`. This follows from `(a⊗A)(ℂ)=a⊗A(ℂ)` (A1.3a), the Lie comparison, and the exponential sequence of A5.1 applied to the projector that defines `a⊗A`, since tensoring with the projective module `a` is exact.

**Checks.**

- `cmSerreTensor.test_unit`: Tensoring by `O_L` returns the original CM abelian scheme; tensoring by a principal ideal `xO_L` returns an `O_L`-isomorphic one, through `xO_L≅O_L`, `y↦y/x`.
- `cmSerreTensor.test_directSum`: Tensoring by `O_L⊕O_L` gives `A×A`, of relative dimension `2d`.
- `cmSerreTensor.test_zero`: Tensoring by the zero module gives the identity scheme `S`, of relative dimension zero.
- `cmSerreTensor.test_nonprincipal`: For `L=ℚ(√−5)`, `A=ℂ/O_L` with its multiplication action and `a=(2,1+√−5)`, `a⊗A≅ℂ/a` has the same type and is `O_L`-isogenous to `A`, but is not `O_L`-isomorphic to it: an isomorphism would be multiplication by some `u∈L×` with `ua=O_L`, making a principal. Its `j`-invariant is the second root of `H_{−20}`.
- `cmSerreTensor.test_torsion_excluded`: For a nonzero proper ideal `c`, `O_L/c` is nonzero torsion and not projective, so it is outside the contract. Over `𝔽̄₅`, let `ℤ[i]` act on the ordinary curve `y²=x³−x` by `i(x,y)=(−x,3y)`, so that `i` acts on Lie by `3`. The fppf tensor sheaf `(ℤ[i]/(2+i))⊗A` vanishes, because the map induced by `(2+i)⊂ℤ[i]` is the isogeny `2+i`, which is fppf surjective. But `(ℤ[i]/(2+i))⊗Lie(A)=Lie(A)≠0`, since `2+i` acts on Lie by `2+3=0`. The Lie formula therefore fails outside projective modules. For `c=O_L` the quotient is zero and projective.

**Required calculations and boundary cases.** `M=O_L` returns `A`; `M=a⊕b` gives the product of the two ideal tensors. For equal ideals the degree is `1`, for `c=O_L` the map `[c]` is the identity, and `n=0` is excluded because `(0)` is not a nonzero ideal. For `d=2`, `[n]` has degree `n⁴`; `n²` would incorrectly reuse the elliptic result. For `L=ℚ(i)` and `c=(2+i)`, `[c]` has degree `5`. Over `ℂ` its kernel is `(2+i)⁻¹ℤ[i]/ℤ[i]`, with five points and lattice `(2+i)⁻¹ℤ[i]` for `c⁻¹⊗A`. Over `𝔽̄₅`, with `i` acting on Lie by `3` as above, `[2+i]` has zero differential, so its kernel is connected of rank `5` with one geometric point, while `[2−i]` has étale kernel with five points. A degree defined by counting geometric kernel points therefore gives `1` for `[2+i]`. For a Gaussian type, Lie selects `i` while the dual-abelian invariant form in the Hodge sequence selects the conjugate embedding. A diagonal action `σ(γ)` instead of `σ(γ)⁻¹` fails the source invariant-differential convention. For a principal twist `(x)`, the eigenspace comparison multiplies `H_A(σ)` by `σ(x)`, and an ideal twist never exchanges `Σ` and `Σ̄`. For dimension two, the codomain has two selected complex coordinates, not a single arbitrary period.

### Examples

The Gaussian norm-five map fixes the curve class but has five-element kernel. The two conductor-three Gaussian classes are exchanged by the norm-two ideal. Serre tensor by `O_L` returns `A`, by zero returns the identity scheme, and by `a⊕b` returns the product; multiplication by `n≠0` in dimension two has degree `n⁴`. Over `𝔽̄₅` the two Gaussian primes above `5` give one connected and one étale kernel of rank five. The nonprincipal ideal of `ℤ[√−5]` twists `ℂ/ℤ[√−5]` into the other curve with CM by that order. The square Gaussian differential has inverse `i`-action `−i`, while multiplication pullback has `i`-action.

### Dependencies

Layer 0; GlobalNumberFields 11; IntegralLattices B2/B5 for the consumed form/ideal dictionary; EllipticCurves 1/2/5; ModularCurvesPartII §§1.1–1.5; ArithmeticStatisticsPartVII `support-cm/cm_ideal_isogeny_comparison`; AbelianSchemesAndArithmeticModuli A0.1–A0.2, A1.1–A1.3a, A3.1, A4.1, A4.3, A4.7a, A5.1–A5.7, A6.1, A6.12 and A6.18.

## Layer 2: Polarized lattices and explicit reciprocity

<a id="cm-2-1"></a>

### 2.1 Polarized classification in every dimension

Separate an integral Riemann form from its positivity and from the principal-polarization condition. The classification is for the chosen order, action and type. Product types remain admissible even when the full geometric endomorphism algebra is larger than the specified commutative CM algebra.

**Polarized CM lattice data** — `PolarizedCMLattice`. For a CM algebra `E` of dimension `2g` over `ℚ` and type `Φ`, polarized lattice data are a full `ℤ`-lattice `I⊂E` and `ξ∈E×` with `ξ̄=−ξ`, `Im φ(ξ)>0` for `φ∈Φ`, and `Tr_{E/ℚ}(ξĪI)⊂ℤ`. Put `Eξ(x,y)=Tr(ξxȳ)`. Require `I` stable under the specified order `O`, whose action on `E` is faithful; proper/invertible is an additional condition, automatic for fractional ideals of the maximal order but not imposed on all higher-dimensional nonmaximal lattices. Principal means `I=I^#` where `I^#={x:Tr(ξx̄I)⊂ℤ}`. Equivalence is `(I,ξ)∼(uI,ξ/(uū))` for `u∈E×`.

Sources: [MilneCM](#source-milnecm), §2.9 pp.25–26; Proposition 3.17 p.31. Prerequisites: [CMType](#cm-0-1); [GlobalNumberFields Layer 11][globalnumberfields-11]; `AbelianSchemesAndArithmeticModuli:A5`; `AbelianSchemesAndArithmeticModuli:A3.9/Polarization.rosati`; [NumberField.IsCMField.complexConj][mathlib-numberfield.iscmfield.complexconj]; [ClassGroup][mathlib-classgroup]; [ClassGroup.mk][mathlib-classgroup.mk]; [CommRing.Pic][mathlib-commring.pic]; [ClassGroup.equivPic][mathlib-classgroup.equivpic]; [NumberField.RingOfIntegers][mathlib-numberfield.ringofintegers].

**CM lattices and ideal isogenies in arbitrary dimension** — `arbitraryCMClassification`. For triples `(A,ι,λ)` of type `(E,Φ)`, require that the Rosati involution of `λ` preserve `ι(E)` and satisfy `ι(x)^†=ι(conjugate(x))` for every `x∈E`. These A5-algebraized polarized CM-action triples correspond to `PolarizedCMLattice` modulo the displayed `E×` equivalence. This compatibility is required also for product CM algebras. For a CM field with maximal order `O_E`, unpolarized `O_E`-equivariant isomorphism classes form a `Pic(O_E)`-torsor under `a⁻¹I` and have cardinal `h_E`. Integral ideals give `O_E`-linear isogenies of degree `N_E/ℚ(a)`. If `E` is a field and `Φ` is primitive, transport AbelianSchemesAndArithmeticModuli A6.37 `cmIsotypic` through this lattice classification to obtain simplicity and `End⁰(A)=E`; with full `O_E` action integrality gives `End(A)=O_E`. A fixed polarization changes the torsor and its stabilizer.

Sources: [MilneCM](#source-milnecm), Propositions 3.12–3.13 and 3.17, pp.29–31; [Tsimerman](#source-tsimerman), §4 pp.384–385. Prerequisites: [PolarizedCMLattice](#cm-2-1); [primitive CM types](#cm-0-1); `AbelianSchemesAndArithmeticModuli:A3.9/Polarization.rosati`; `AbelianSchemesAndArithmeticModuli:A6.37/cmIsotypic`; `AbelianSchemesAndArithmeticModuli:A5`; `AbelianSchemesAndArithmeticModuli:A6.1/Hom.deg`; `AbelianSchemesAndArithmeticModuli:A6.12/traceDegreeSubfield`; [GlobalNumberFields Layer 11][globalnumberfields-11]; [ClassGroup][mathlib-classgroup]; [ClassGroup.mk][mathlib-classgroup.mk]; [CommRing.Pic][mathlib-commring.pic]; [ClassGroup.equivPic][mathlib-classgroup.equivpic].

**Basic API.**

- `PolarizedCMLattice.form`: The alternating `ℤ`-form is `(x,y)↦Tr(ξxȳ)`, with `Eξ(x,Jx)>0`.
- `PolarizedCMLattice.scale`: Multiplication by `u` carries `(I,ξ)` to `(uI,ξ/(uū))` without changing the polarized object.
- `PolarizedCMLattice.principal_iff`: The polarization is principal iff `I=I^#`.
- `PolarizedCMLattice.rosati`: The imported Rosati involution on `E` is CM conjugation.

**Checks.**

- `PolarizedCMLattice.test_square`: For `(ℤ[i],i/2)`, `Eξ(1,i)=1` and the polarization is principal.
- `PolarizedCMLattice.test_negative`: For type `i↦i`, `ξ=−i/2` violates the positive-imaginary condition.
- `PolarizedCMLattice.test_scale`: `(2ℤ[i],i/8)` is equivalent to `(ℤ[i],i/2)`; leaving `ξ=i/2` multiplies the form by `4`.
- `arbitraryCMClassification.test_gaussian`: The standard Gaussian action and principal polarization correspond to `(ℤ[i],i/2)` with conjugation as Rosati.
- `arbitraryCMClassification.test_product`: The product principal polarization on `(ℂ/ℤ[i])²` is compatible with the diagonal algebra `ℚ(i)²` and is represented by the product lattice with `ξ=(i/2,i/2)`.
- `arbitraryCMClassification.test_incompatible_polarization`: On the same surface with the same diagonal action, the positive definite integral Hermitian matrix `H=[[1,1],[1,2]]`, of determinant one, defines a principal polarization. Its Rosati sends `diag(i,0)` to `H⁻¹ diag(−i,0) H=[[−2i,−2i],[i,i]]`, outside the diagonal algebra. This triple is excluded: a trace-`ξ` form for `ℚ(i)²` has zero cross terms. The boundary uses the Rosati condition immediately before MilneCM Proposition 3.17, p.31.

**Required calculations and boundary cases.** For `E=ℚ(i)`, `I=ℤ[i]`, `ξ=i/2` gives the principal square-lattice form with `Eξ(1,i)=1`. The negative `ξ` fails positivity for the same selected type. In dimension two, `[n]` has degree `n⁴`; an induced product type may have `End⁰` larger than `E`. Do not generalize the maximal-order Picard classification to all higher-dimensional nonmaximal lattices.

The light function `squareForm(x,y)=Re(2(i/2)x conjugate(y))` is the scalar extension of this Gaussian trace form. Its API is alternating real bilinearity and the displayed lattice values. The milestone `squareForm_positive` states `squareForm(x, i x) > 0` for every nonzero `x ∈ ℂ` (MilneCM, §2.9, pp.25–26); no positivity is asserted at zero.

**Checks.**

- `E(1,i)=1`, while `E(i,1)=−1`; interchanging the arguments reverses the sign.
- `E(1,1)=0`; the form is alternating, rather than a positive symmetric norm form.
- On the scaled lattice `E_{i/8}(2,2i)=1`, whereas leaving `ξ=i/2` gives `4`. This pins the homothety factor.

<a id="cm-2-2"></a>

### 2.2 Reflex ideals, torsion and polarization

Apply ShimuraVarieties §§4.2 and 5.8–5.11 with arithmetic Artin throughout. The ideal dictionary must commute with maximal-order extension away from the conductor. The `E`-linear comparison and the natural Galois map agree only after the indicated `f` is inserted, which fixes their polarization multipliers.

**The conductor-restricted reflex ideal map** — `reflexIdealMap`. Import ShimuraVarieties §4.2’s norm `NΦ:A_{E*,f}×→A_{E,f}×` and compare its algebraic formula to CM.0. For an order `O⊂E`, let `F` be the smallest positive integer with `F O_E⊂O`. For an `E*`-ideal `a` prime to `NF`, apply the maximal-order reflex ideal norm and contract to `O`, obtaining `NΦ,O(a)`. It is a proper invertible `O`-ideal. This map is multiplicative. For a principal input `(u)` prime to `NF`, its image is `NΦ(u)O` provided `NΦ(u)∈(O⊗ℤ_p)×` for every rational prime `p|F`. A sufficient condition is `u≡1 mod× F O_{E*}`, together with prime-to-`N` support. Local maximal-order units alone do not suffice. After extension back to `O_E` the map is the maximal reflex norm. The map on Picard/ray-class quotients is derived only for the specified modulus and hypotheses.

Sources: [Streng](#source-streng), §2.6 pp.6–7 and §4.2 p.13. Prerequisites: [CMType.typeNorm_identities](#cm-trace-contract); [CMType.reflexType](#cm-0-2); `ShimuraVarieties:§4.2 and §5.1`; [GlobalNumberFields Layer 11][globalnumberfields-11]; [GlobalNumberFields Layer 7][globalnumberfields-7]; [GlobalNumberFields Layer 8][globalnumberfields-8]; [ClassGroup][mathlib-classgroup]; [ClassGroup.mk][mathlib-classgroup.mk]; [CommRing.Pic][mathlib-commring.pic]; [ClassGroup.equivPic][mathlib-classgroup.equivpic]; [NumberField.RingOfIntegers][mathlib-numberfield.ringofintegers].

**Normalized idele and torsion dictionary** — `ideleTorsionDictionary`. Let `A/ℂ` have CM type `(E,Φ)`, `σ∈Aut(ℂ/E*)` and `t∈A_{E*,f}×` with arithmetic `Art(t)=σ` on `E*ab`. Put `f=NΦ(t)⁻¹`. Under the imported ShimuraVarieties §5.10 theorem, there is a unique `E`-linear quasi-isogeny `α:A→σA` whose induced finite-adelic isomorphism satisfies `α(fx)=σ(x)` for every `x∈V_f(A)`, with its analytic/algebraic comparison fixed. Equivalently, for a model `k` containing `E*` on which all specified `E`-endomorphisms are defined, use `NΦ(N_{k/E*}t_k)⁻¹`. No claim is made that a model exists over `E` or over `E*` solely from its type. Integral freeness over `O⊗ℤ_l` is asserted only at `l` prime to `[O_E:O]`.

Sources: [MilneCM](#source-milnecm), Theorem 9.10 and footnote 25, pp.78–80; [MilneFT](#source-milneft), §3 pp.20–21. Prerequisites: [reflexIdealMap](#cm-2-2); `ShimuraVarieties:§§5.4–5.11`; `ShimuraVarieties:§4.2 and §5.1`; `AbelianSchemesAndArithmeticModuli:A4`; `ArithmeticGaloisRepresentations:§§6.1–6.2 and 6.4`.

**The polarization and lattice reciprocity formula** — `polarizationReciprocityDictionary`. With normalized `σ,t,f=NΦ(t)⁻¹` as above, an `E`-linear comparison quasi-isogeny `α` has finite-adelic realization satisfying `α(fx)=σx`. Its pairing multiplier is `(σEξ)(αx,αy)=[χ_cyc(σ)/(f f̄)``]Eξ(x,y)`, where ShimuraVarieties §5.11 identifies `c=χ_cyc(σ)/(f f̄)` with a positive rational scalar. Thus `ξc` is an element of `E`, rather than an arbitrary finite idele used as a complex number. The natural Galois map `x↦σx=α(fx)` instead has multiplier `χ_cyc(σ)`. The conjugate CM lattice/polarization has type (`E,Φ; fI, ξ·χ_cyc(σ)/(f f̄)`), interpreted on integral Zhat-lattices inside the finite-adelic Tate modules and their rational comparison. Ideals change the lattice by `NΦ(a)⁻¹` with the corresponding positive rational norm factor. Keep ordinary isomorphisms, polarized similitudes and finite-level equivalences distinct.

Sources: [MilneCM](#source-milnecm), Remark 9.11(c), p.78, and Theorem 9.17, pp.80–81. Prerequisites: [ideleTorsionDictionary](#cm-2-2); [PolarizedCMLattice](#cm-2-1); `ShimuraVarieties:§§5.4–5.11`; `AbelianSchemesAndArithmeticModuli:A5`; `AbelianSchemesAndArithmeticModuli:A4`.

**Basic API.**

- `reflexIdealMap.mul`: `NΦ,O(ab)=NΦ,O(a)NΦ,O(b)` for ideals prime to `NF`.
- `reflexIdealMap.principal`: For `(u)` prime to `NF`, `NΦ,O((u))=NΦ(u)O` when `NΦ(u)` is a unit of `O⊗ℤ_p` at every `p|F`; in particular for `u≡1 mod× F O_{E*}` with prime-to-`N` support.
- `reflexIdealMap.extend`: Extending `NΦ,O(a)` to `O_E` gives the maximal-order reflex ideal norm.
- `reflexIdealMap.conjugate`: If `O` is stable under CM conjugation, `NΦ,O(a)·conjugate(NΦ,O(a))=N_{E*/ℚ}(a)O`, with the positive rational ideal norm. For arbitrary `O`, conjugation sends ideals to ideals of `conjugate(O)`; the identity holds after extending both factors to `O_E`. Integral-order uses of this identity retain conjugation stability.

**Checks.**

- `reflexIdealMap.test_quadratic`: For a quadratic CM pair with maximal order, the map sends `(2+i)` to `(2+i)`.
- `reflexIdealMap.test_one`: The unit ideal maps to the unit ideal.
- `reflexIdealMap.test_conductor_prime`: The prime-to-`F` contract cannot be applied to an ideal over `3` for `O=ℤ+3ℤi`.
- `gaussianOrderThree_unit_boundary`: For `O=ℤ+3ℤi`, `u=i` is a maximal-order unit above `3`, but `(u)=O_E` maps to `O`, whereas `iO≠O` since `i∉O`. The named Lean boundary states the failure of equality with the rotated order on its actual subring carrier.
- `reflexIdealMap.test_nonstable_order`: In `E=ℚ(ζ₅)`, the preimage of equal residues at `ζ₅↦3,9` modulo `11` is a full order containing `11O_E`. It contains `ζ₅²−ζ₅` (residues `6,6`), whose conjugate has residues `1,9`. At `a=1`, `O·conjugate(O)≠O`, since that product contains `conjugate(O)`. This boundary target requires extension to `O_E` in the arbitrary-order norm formula (MilneCM, Remark 1.24 pp.16–17, and the residue calculation).

**Required calculations and boundary cases.** In the elliptic case this is the identity ideal map under `E*=E`. At a prime dividing `F`, invertibility and the contraction equality are not asserted. For an elliptic quadratic type, the lattice is `a⁻¹I` under arithmetic `Art(a)`. An `ℓ` dividing the order index is not allowed to inherit a free rank-one integral `O_l` module. A formula changing `I` but keeping `ξ` without the norm/cyclotomic factor fails already for multiplication by an integer on a polarized surface.

<a id="cm-2-3"></a>

### 2.3 Level functions, stabilizers and relative fields

Throughout CM.2.3, `O={x∈E:xI⊂I}` is the full multiplier order of the chosen lattice; mere stability under a suborder is insufficient. Principality identifies `I` with its trace dual, so Rosati preserves this order and restricts to CM conjugation; the order is therefore conjugation stable. Symplectic bases use `E_Str,ξ(x,y)=Tr(ξx̄y)` with the same positive-imaginary `ξ` as in `PolarizedCMLattice`. A symplectic level marking determines the matrix acting on regular modular functions. Stabilizers retain the scalar, polarization and level congruence simultaneously. Their quotient describes the relative marked geometric reciprocity orbit; CM.3.2 identifies its field of regular modular values.

**Siegel level functions and regular evaluation** — `siegelLevelFunctionField`. For every `g ≥ 1` and `N ≥ 1`, construct the field `F_N` of quotients of equal-weight level-`N` Siegel modular forms with Fourier coefficients in `ℚ(ζ_N)`, viewed as meromorphic functions on the Siegel upper half-space. Identify it with the rational function field of the fixed-pairing component of the canonical Siegel moduli scheme over `ℚ(ζ_N)` supplied by ShimuraVarieties §5.0 and §§8.1–8.3. At levels with automorphisms use its coarse scheme; a universal family is not required. Include the comparison between Fourier coefficients and this arithmetic field of definition.

Its API is `siegelLevelFunctionField.action`, the semilinear right `GSp_{2g}(ℤ/Nℤ)` action, with `ζ_N^U = ζ_N^{ν(U)}`; `siegelLevelFunctionField.rational_similitude`, pullback by positive rational similitudes with the appropriate source and target levels; `siegelLevelFunctionField.level_inclusion` for divisibility of levels; and `siegelLevelFunctionField.regularEvaluation`, the residue homomorphism on the local ring at a point. In genus one compare these with ModularCurvesPartII §§3.14 and 6.1. Sources: [Streng](#source-streng), §§2.1–2.4, pp.2–5, and §3, pp.10–12. Prerequisites: the stated ShimuraVarieties moduli and tower contracts, AbelianSchemesAndArithmeticModuli A5, and ordinary function fields and local rings of the supplied integral schemes.

**Checks.**

- In genus one at level one, `F_1 = ℚ(j)` and regular evaluation at the Gaussian point sends `j` to `1728`.
- The function `1/(j − 1728)` has a pole at that point and is outside the evaluation local ring.
- A constant `ζ_N` evaluates to itself; a similitude of multiplier `a` prime to `N` sends it to `ζ_N^a`. Omitting the coefficient action fails already at `N = 5`, `a = 2`.

**Explicit reciprocity on CM level functions** — `explicitLevelReciprocity`. Let `(E,Φ)` be primitive, `(I,ξ)` principally polarized in Streng’s Riemann-form convention, `B` a symplectic basis, `τ` its Siegel period matrix, `N≥1`, `O={x∈E:xI⊂I}` and `F O_E⊂O` with `F` least. Let `f∈F_N` have `q`-expansion in `ℚ(ζ_N)` and be finite at `τ`. For an `E*`-ideal `a` prime to `NF`, choose a symplectic basis `C` of `NΦ,O(a)⁻¹I` for the rescaled form `N(a)ξ`. If `C=M B` (row convention), then `τ′=Mτ`, `ν(M)=N(a)⁻¹`, `U=(M mod N)⁻¹` and `f(τ)^{Art(a)}=f^U(τ′)`. Both the coefficient-field action and the inverse matrix are part of the formula.

Sources: [Streng](#source-streng), Theorem 2.4 pp.7–8; proof §4.4 pp.15–16. Prerequisites: [reflexIdealMap](#cm-2-2); [ideleTorsionDictionary](#cm-2-2); [polarizationReciprocityDictionary](#cm-2-2); `siegelLevelFunctionField`; `ShimuraVarieties:§5.0 and §§8.1–8.3`; `AbelianSchemesAndArithmeticModuli:A5`; [GlobalNumberFields Layer 7][globalnumberfields-7].

**The polarized CM level stabilizer** — `polarizedLevelStabilizer`. Under the preceding primitive principal-polarization and full-multiplier-order hypotheses, `H_{Φ,O}(N)` is the subgroup of `I_{E*}(NF)` consisting of ideals a for which `NΦ,O(a)=µO` for some `µ∈E×`, `µµ̄=N_{E*/ℚ}(a)` as positive rational elements and `µ≡1 mod× NO`. The last congruence means `µ=u/v` with `u,v∈O` both units modulo `NF O` and `u≡v mod NO`, as in Streng. At `N=1` it is the polarized stabilizer. Distinguish it from `ker(Cl(E*)→Cl(E))`, which forgets the norm-compatible polarization trivialization.

Sources: [Streng](#source-streng), Theorem 2.5 and Definition 2.7, pp.7–8. Prerequisites: [reflexIdealMap](#cm-2-2); [PolarizedCMLattice](#cm-2-1); [GlobalNumberFields Layer 7][globalnumberfields-7]; [GlobalNumberFields Layer 11][globalnumberfields-11]; [ClassGroup][mathlib-classgroup]; [ClassGroup.mk][mathlib-classgroup.mk]; [CommRing.Pic][mathlib-commring.pic]; [ClassGroup.equivPic][mathlib-classgroup.equivpic].

**Reflex class map and the polarized unit obstruction** — `reflexClassMap_unitObstruction`. For a CM field `E`, maximal order, primitive type and principal polarized lattice, the reflex ideal map induces `r:Cl(E*)→Cl(E)`. Let `H` be the `N=1` polarized stabilizer modulo principal reflex ideals. Then `H⊂ker r` and `ker r/H` injects into `O_{E⁺}^{×,+}/N_{E/E⁺}(O_E×)`. The unit quotient, and hence `ker r/H`, has exponent two and size at most `2^g`, since squares of totally real units are norms and the totally positive subgroup has rank `g−1`. In the polarized norm equation, `N(a)` is the absolute norm of the `E*`-ideal `a`, not a norm with domain `E`.

Sources: [Tsimerman](#source-tsimerman), §5 pp.385–386. Prerequisites: [reflexIdealMap](#cm-2-2); [polarizedLevelStabilizer](#cm-2-3); [arbitraryCMClassification](#cm-2-1); [GlobalNumberFields Layer 11][globalnumberfields-11]; [NumberField.IsCMField.complexConj_eq_self_iff][mathlib-numberfield.iscmfield.complexconj_eq_self_iff]; [ClassGroup][mathlib-classgroup]; [ClassGroup.mk][mathlib-classgroup.mk]; [CommRing.Pic][mathlib-commring.pic]; [ClassGroup.equivPic][mathlib-classgroup.equivpic]; [reflexIdealMap.principal](#cm-2-2).

**Relative polarized geometric moduli orbit** — `relativeCMModuliOrbit`. For the fixed principally polarized primitive CM-action triple with full multiplier order `O`, its marked geometric orbit under arithmetic reciprocity over the reflex field is `I_{E*}(F)/H_{Φ,O}(1)`. For level `N` use `I_{E*}(NF)/H_{Φ,O}(N)`. The comparison identifies geometric objects and their stabilizers; CM.3.2 identifies the field generated by regular modular values. The absolute field of moduli over `ℚ`, the moduli field after forgetting the specified CM action, a field of definition and the reflex field are separate objects. No equality `[ℚ(A):ℚ]=|Cl(E*)/H|` is asserted; a passage to the unmarked absolute moduli field requires separate descent and forgetting-action theorems.

Sources: [Streng](#source-streng), Theorem 2.5, pp.7–8; [Tsimerman](#source-tsimerman), §5 p.386. Prerequisites: [polarizedLevelStabilizer](#cm-2-3); [explicitLevelReciprocity](#cm-2-3); [ClassFieldTheory Layer 12][classfieldtheory-12]; `ShimuraVarieties:§5.0 and §§8.1–8.3`; `ModularCurvesPartII:§§3.14 and 6.1`.

**Forgetting the specified CM action** — `relativeCMModuliOrbit.forget_action`. For the same polarized CM triple `x` over `ℚ̄`, let `G_rel` be its marked stabilizer in `G_{E*}`, and `G_abs` the stabilizer in `G_Q` of its underlying polarized abelian variety. Forgetting the action gives `G_rel⊂G_abs`. Thus its absolute unmarked field of moduli `M_abs=ℚ̄^{G_abs}` is contained in the relative marked field `M_rel=ℚ̄^{G_rel}`, and `E*M_abs⊂M_rel`. Equality `E*M_abs=M_rel` holds exactly when `G_abs∩G_{E*}=G_rel`. This compares the fixed fields of the actual stabilizers; it does not assert descent to either field of moduli. The generic fixed-field correspondence is imported, while the comparison identifies the stabilizers of these CM objects.

Source: the marked stabilizer of [Streng](#source-streng), Theorem 2.5 pp.7–8; the stated inclusion and equality criterion follow by forgetting the action and applying the fixed-field correspondence. Prerequisites: `relativeCMModuliOrbit`; the polarized-object isomorphisms from A5/A6; [ClassFieldTheory Layer 12][classfieldtheory-12].

**Basic API.**

- `polarizedLevelStabilizer.mem_iff`: Membership is exactly existence of `µ` with the three specified equations/congruence.
- `polarizedLevelStabilizer.one`: The unit ideal lies in `H`, with witness `µ=1`.
- `polarizedLevelStabilizer.mul`: Witnesses `µ,ν` multiply to the witness `µν` for `ab`, and inverse witnesses give a subgroup.
- `polarizedLevelStabilizer.forget_level`: For `N|M` and common prime-to-`MF` ideals, `H(M)⊂H(N)`.

**Checks.**

- `polarizedLevelStabilizer.test_multiplier_order`: For `I=ℤ[i]`, `ξ=i/2`, `N=1`, the preserving suborder `ℤ+3ℤi` has Picard group of size two, but the actual multiplier order is `ℤ[i]` and the relative value field is `ℚ(i)(1728)=ℚ(i)`. The suborder stabilizer gives the wrong orbit.
- `polarizedLevelStabilizer.test_unit`: The unit ideal is in `H(N)` for every `N`.
- `polarizedLevelStabilizer.test_quadratic_level_one`: For a maximal quadratic order and `N=1`, `H(1)` is the subgroup of principal ideals, since every generator has `µµ̄=N(a)`.
- `polarizedLevelStabilizer.test_gaussian_level3`: For `O=ℤ[i]`, the ideal `(2+i)` belongs to `H(1)` but not `H(3)`. Every generator has norm `5≡2 mod 3`, while a generator congruent to `1` modulo `3O` would have norm `1 mod 3`.

**Required calculations and boundary cases.** `N=1` removes the finite level matrix action, but does not remove the lattice class action. For `g=1`, `ν=det`; reversing `U` to `M` changes arithmetic Frobenius to its inverse. At `N=1` the congruence is vacuous; at `N>1` it can shrink the field stabilizer. A principal image ideal with arbitrary generator is insufficient without `µµ̄=N(a)`. In `g=1` every generator has its required norm, so `H=ker r` and the obstruction is trivial. The class map has domain the reflex class group, not `Cl(E)`. For the Gaussian elliptic curve `j=1728`, `ℚ(j)=ℚ` but `E*=ℚ(i)`; equalities of these two moduli fields are false.

**Checks.**

- At `N=5` the matrix `M=diag(2,1)` has inverse `diag(3,1)`, with determinants `2` and `3` in `𝔽₅`. Their actions on the first basis vector differ, pinning `U` rather than `M`.
- For the Gaussian stabilizer, the unit ideal has witness `1`; `(2+i)` fixes the level-one class but moves the level-three marked object, because its generators have norm `2 mod 3`.
- Polarization-preserving automorphisms are essential for full-level rigidity: an unpolarized CM surface can have infinite-order units congruent to `1` modulo `3`. No absolute unmarked moduli-degree identity follows from that rigidity.
- For the Gaussian polarized elliptic curve, `M_abs=ℚ` and `M_rel=E*=ℚ(i)`; after adjoining `E*` the two fields agree. If forgetting the action leaves the `G_{E*}`-stabilizer unchanged, the equality criterion gives `E*M_abs=M_rel`; a strictly larger stabilizer instead gives a proper subfield. These checks distinguish the two stabilizers and do not assert a field of definition.

<a id="cm-2-4"></a>

### 2.4 A surface calculation

Carry the normalization through an explicit product surface. This example uses a nonprimitive product type; the displayed CM algebra is not its full `End⁰`.

**A dimension-two torsion and polarization example** — worked Check. Let `E₀:y²=x³−x` over `ℚ(i)`, with `i` acting by `(x,y)↦(−x,iy)`, and `A=E₀×E₀` with product principal polarization and CM algebra `ℚ(i)×ℚ(i)`, type selecting the standard embedding on each factor. At `P=(5,i−3)`, `E₀` has arithmetic Frobenius `π=−1+2i`, so on prime-to-`5` Tate modules `A` has diagonal CM action `(π,π)`; on `3`-torsion, `(ℤ/3)^4`, the same action is multiplication by `π mod 3`, represented in the `(1,i)` basis on each factor by `[[2,1],[2,2]]`. The Weil pairing multiplier is `5 mod 3=2`, and the Frobenius characteristic polynomial is `(X²+2X+5)²`. The ideal isogeny on the product has degree `25`. Separately, the non-Galois quartic example in CM.0 has reflex real subfield `ℚ(√7)`, demonstrating that higher-dimensional reflex fields need not equal the original CM field.

Sources: [MilneCM](#source-milnecm), Theorem 9.10, Remark 9.11 and Theorem 9.17, pp.78–81. Prerequisites: [ideleTorsionDictionary](#cm-2-2); [polarizationReciprocityDictionary](#cm-2-2); [arbitraryCMClassification](#cm-2-1); [the quartic field Check](#cm-0-3); [EllipticCurves Layer 3][ellipticcurves-3]; [EllipticCurves Layer 2][ellipticcurves-2]; `AbelianSchemesAndArithmeticModuli:A6.11/charpolyTate`.

**Required calculations and boundary cases.** Check the two rank-one CM components in each elliptic factor, four-dimensional rational Tate module, degree `25` and multiplier `2` on `3`-torsion. The product type is not primitive; its full `End⁰` is `M₂(ℚ(i))`, so the primitive `End` theorem cannot be applied.

### Examples

The square lattice has `E(1,i)=1` and `E(i,1)=−1`; scaling the lattice by `2` divides `ξ` by `4`. The product surface has rank-four `3`-torsion, multiplier `2`, polynomial `(X²+2X+5)²` and ideal degree `25`. Its full endomorphism algebra is `M₂(ℚ(i))`, so its product type does not satisfy the primitive-field conclusion.

### Dependencies

Layers 0–1; GlobalNumberFields 7/8/11; ClassFieldTheory 11/12; AbelianSchemesAndArithmeticModuli A2/A3/A4/A5/A6, including A6.37 `cmIsotypic`; ArithmeticGaloisRepresentations §§6.1–6.2 and 6.4; ShimuraVarieties §§4.2, 5.1, 5.4–5.11 and 8.1–8.3. ShimuraVarieties supplies its CM and reciprocity theory independently of these explicit comparisons.

## Layer 3: Class polynomials and generated class fields

<a id="cm-3-1"></a>

### 3.1 Class polynomial, integrality and ring class generation

Form the polynomial from the complete proper-ideal-class census and the normalized analytic/algebraic `j` comparison. First prove integrality using independent modular-polynomial inputs, then identify the arithmetic Artin action and the ring class field over the quadratic base.

**Prime diagonal comparison** — `modularPolynomial.primeDiagonal`. For every rational prime `l`, let `Φ_l` be the normalized cyclic modular polynomial supplied by ModularCurvesPartII §5.6. Then `−Φ_l(X,X)` is monic in `ℤ[X]` of degree `2l`. Use the cyclic quotient factorization at `j(τ)`: the factor `j(τ)−j(lτ)` has leading term `−q⁻ˡ`, and each of the `l` remaining factors `j(τ)−j((τ+k)/l)` has leading term `q⁻¹`. Their product starts with `−q⁻²ˡ`, whereas `j(τ)` starts with `q⁻¹`. This comparison precedes and uses no CM integrality theorem. Sources: [MIT20](#source-mit20), Lemma 20.9 p.5 and Remark 20.10 p.6. Prerequisites: [ModularCurvesPartII §5.6][modularcurvespartii-polynomial]; [ModularForms Layer 0][modularforms-0]; `ModularCurvesPartII:§§3.14 and 6.1` for the analytic cyclic quotient comparison.

**Checks.**

- At `l=2` the diagonal has leading term `−X⁴`, so its negative is monic of degree four.
- At `N=1` the diagonal is zero because `Φ₁(U,V)=V−U`; the prime hypothesis cannot be omitted.
- At `N=4` the cyclic representatives give `j(4τ)`, the four `j((τ+k)/4)`, and `j(τ+1/2)`. The diagonal product has leading term `−2q⁻⁹`, hence `Φ₄(X,X)` has degree nine and leading coefficient `−2`. Its negative is not monic. The full-subgroup degree-four correspondence instead includes `E[2]` and has an identically zero diagonal; it is a different polynomial.

**The order class polynomial** — `classPolynomial`. For an imaginary quadratic order `O_D` of discriminant `D<0`, define `H_D(X) = ∏_{[I]∈Pic(O_D)} (X − j(E_I))` in `ℂ[X]` using the normalized `j` and each CM class exactly once. Its indexing is independent of ideal representatives and embedding-oriented bases. The integral coefficient theorem below identifies it with a unique monic polynomial in `ℤ[X]`; the initial product definition does not assume rounded numerical values are its coefficients.

Sources: [MIT20](#source-mit20), Introduction p.1 and §20.3 p.5, defining product for `H_D`. Prerequisites: [idealAction.picardEquiv](#cm-1-1); [quadraticFormsCMComparison](#cm-1-2); [idealLatticeCurve](#cm-1-1); [WeierstrassCurve.j][mathlib-weierstrasscurve.j]; [ModularForms Layer 0][modularforms-0]; [GlobalNumberFields Layer 11][globalnumberfields-11]; [ClassGroup][mathlib-classgroup]; [ClassGroup.mk][mathlib-classgroup.mk]; [CommRing.Pic][mathlib-commring.pic]; [ClassGroup.equivPic][mathlib-classgroup.equivpic].

**Integrality of singular moduli and class polynomials** — `classPolynomial.integral`. For every imaginary quadratic order `O_D`, all `j(E_I)` are algebraic integers and `H_D` belongs to `ℤ[X]`. The polynomial is separable and has degree `h(O_D)`. Choose a principal prime ideal of rational prime norm `l` avoiding the conductor; `modularPolynomial.primeDiagonal` makes `−Φ_l(X,X)` a monic polynomial vanishing at `j`. Galois permutes the CM `j`-values with the same full order. No integrality argument uses a class polynomial computation or reduction theorem from CM.5.

Sources: [MIT20](#source-mit20), Lemma 20.9 p.5; Theorem 20.12 and Corollary 20.13 p.6. Prerequisites: [classPolynomial](#cm-3-1); [idealAction](#cm-1-1); [idealAction.degree_eq_norm](#cm-1-2); [ideleTorsionDictionary](#cm-2-2); `modularPolynomial.primeDiagonal` above; [ClassFieldTheory Layer 13][classfieldtheory-13]; `ModularCurvesPartII:§§3.14 and 6.1`; [Chebotarev Layer 9][chebotarev-9].

**Galois equivariance of class-polynomial roots** — `classPolynomial.galois`. For an ideal a of `K` prime to the quadratic order conductor `f`, arithmetic `Art_K(a)` sends `j(E_I)` to `j(E_{a⁻¹I})` in the ring class field. Complex conjugation sends the selected type/lattice to its conjugate and acts by inversion on the proper ideal class torsor after fixing the base class. Thus Gal over `ℚ` has generalized dihedral action on the root set. Stabilizers of individual `j`-values over `K` are trivial in the ring-class Artin/Picard quotient; over `ℚ` the unmarked moduli field can be smaller than the full splitting field.

Sources: [MIT21](#source-mit21), §21.1 pp.1–3. Prerequisites: [classPolynomial](#cm-3-1); [classPolynomial.integral](#cm-3-1); [ideleTorsionDictionary](#cm-2-2); [idealAction.picardEquiv](#cm-1-1); [ClassFieldTheory Layer 11][classfieldtheory-11]; [ClassFieldTheory Layer 13][classfieldtheory-13]; [classPolynomial.roots](#cm-3-1).

**Singular moduli generate the ring class field** — `classPolynomial.ringClassField`. Let `K` be imaginary quadratic, `O_f=ℤ+fO_K`, and `L_f/K` the ring class field already supplied by ClassFieldTheory Layer 13. For any proper ideal `I`, `K(j(E_I))=L_f`, and `L_f` is the splitting field of `H_D` over `K`. Its degree is `|Pic(O_f)|` and the Artin/Picard action is the preceding arithmetic action. Hence `H_D` is irreducible over `K`. This identifies the generator with the supplied class field; it does not construct a second class field or assert `ℚ(j)=L_f`.

Sources: [MIT21](#source-mit21), Theorem 21.1 and opening discussion, pp.1–3. Prerequisites: [classPolynomial.galois](#cm-3-1); [idealAction.picardEquiv](#cm-1-1); [ClassFieldTheory Layer 13][classfieldtheory-13]; [classPolynomial.integral](#cm-3-1).

**Basic API.**

- `classPolynomial.monic`: The finite product is monic.
- `classPolynomial.degree`: `deg H_D=|Pic(O_D)|`.
- `classPolynomial.roots`: The complex roots, each once, are exactly the normalized `j`-values of elliptic curves with full endomorphism order `O_D`.
- `classPolynomial.representatives`: Replacing any ideal by a principal multiple or a basis by `SL₂(ℤ)` leaves `H_D` unchanged.

**Checks.**

- `classPolynomial.test_minus4`: `H_{−4}=X−1728`.
- `classPolynomial.test_minus3`: `H_{−3}=X`.
- `classPolynomial.test_nonmaximal_degree`: `H_{−36}` has degree two; substituting `Cl(ℤ[i])` incorrectly gives degree one.

**Required calculations and boundary cases.** `H_{−4}=X−1728` and `H_{−3}=X`. For `D=−36` its degree is two, not the maximal Gaussian class number one. The leading term is from `−Φ_l(X,X)`; its sign and prime-degree hypothesis are essential. The cyclic level-four diagonal is nonzero but its negative is not monic, as computed above; a full-subgroup correspondence cannot replace the cyclic one. An order-two class swaps its two `j`-roots; a principal ideal fixes each `j` but may act nontrivially on level/torsion values. For `K=ℚ(i)`, `j=1728` gives `L_1=K` while `ℚ(j)=ℚ`.

<a id="cm-3-2"></a>

### 3.2 Regular level values and exact generation

Throughout CM.3.2 the order is the full multiplier order `O={x∈E:xI⊂I}` of the polarized lattice, as in CM.2.3; this hypothesis also applies to `cmValueField.rayClassField` and `cmValueField.separates`. Evaluation is defined on the local ring of functions regular at the CM point. The full value field has an exact stabilizer; a finite list generates it only after a separation theorem. A pole or an arbitrary level function is not a generator.

**The field of admissible CM level values** — `cmValueField`. For a principally polarized CM point `τ` of primitive type `(E,Φ)`, full multiplier order `O={x∈E:xI⊂I}` and `N≥1`, define `M_N=E*(f(τ): f∈F_N, f finite at τ)`, using the actual intermediate-field adjunction carrier. `F_N` consists of quotients of equal-weight level-`N` Siegel forms whose Fourier coefficients lie in `ℚ(ζ_N)`; denominator nonvanishing at `τ` is mandatory for the evaluation. The definition includes all regular values, not an arbitrary one of them. All dimensions use `siegelLevelFunctionField` of CM.2.3; its elliptic comparison is the regular function field of ModularCurvesPartII §§3.14 and 6.1.

Sources: [Streng](#source-streng), Theorem 2.5 pp.7–8. Prerequisites: [explicitLevelReciprocity](#cm-2-3); [IntermediateField.adjoin][mathlib-intermediatefield.adjoin]; [IntermediateField.adjoin_le_iff][mathlib-intermediatefield.adjoin_le_iff]; `ShimuraVarieties:§5.0 and §§8.1–8.3`; `ModularCurvesPartII:§§3.14 and 6.1`.

**Separation of the finite CM reciprocity orbit** — `cmValueField.separates`. For the primitive principally polarized CM point with its full multiplier order and level fixed, every ideal outside `H_{Φ,O}(N)` moves at least one admissible regular value. A finite family of such functions separates its finite geometric reciprocity orbit. Use the modular-function comparison and regular functions separating this finite moduli orbit, including the coefficient action on `ℚ(ζ_N)`.

Sources: [Streng](#source-streng), Theorem 2.5 and proof §4.5, pp.7,16–17. Prerequisites: [cmValueField](#cm-3-2); [relativeCMModuliOrbit](#cm-2-3) for the geometric orbit only; [siegelLevelFunctionField](#cm-2-3); [explicitLevelReciprocity](#cm-2-3).

**Exact ray-level field and generation criterion** — `cmValueField.rayClassField`. With `N,F,τ` as in the value-field construction, `M_N` lies in the ray class field of `E*` of modulus `NF` and `Gal(M_N/E*)=I_{E*}(NF)/H_{Φ,O}(N)`. For an elliptic maximal order `O_K`, the type norm is identity and the polarized norm equation is automatic for a principal ideal, so `H(N)` is precisely the ray principal subgroup and `M_N` is the ray class field of modulus `NO_K`. For a nonmaximal order or higher dimension use the displayed stabilizer, not an unsupported equality with a full ray field or an exact conductor `NF`. A finite family of functions generates `M_N` exactly when its joint value stabilizer equals `H(N)`; unit automorphisms and level congruences are included.

Sources: [Streng](#source-streng), Theorem 2.5, pp.7–8, and its proof §4.5, pp.16–17. Prerequisites: [cmValueField](#cm-3-2); [polarizedLevelStabilizer](#cm-2-3); [relativeCMModuliOrbit](#cm-2-3) for the geometric orbit only; [cmValueField.separates](#cm-3-2); [ClassFieldTheory Layer 12][classfieldtheory-12]; [ClassFieldTheory Layer 13][classfieldtheory-13]; [GlobalNumberFields Layer 7][globalnumberfields-7].

**Basic API.**

- `cmValueField.contains`: Every finite-at-`τ` level-`N` value belongs to `M_N`.
- `cmValueField.le_iff`: `M_N⊂F` iff `F` contains `E*` and every admissible level-`N` value.
- `cmValueField.level_inclusion`: For `N|M` the natural function-field embedding gives `M_N⊂M_M`.
- `cmValueField.no_poles`: The generating value set uses functions regular at `τ`; meromorphic poles are not generators.

**Checks.**

- `cmValueField.test_level_one`: For elliptic maximal-order CM, `M_1=K(j)`.
- `cmValueField.test_gaussian_ray5`: For `K=ℚ(i)`, the level-five value field has degree `|(ℤ[i]/5)×|/|ℤ[i]×|=16/4=4` over `K`, compared with degree two at level three and degree one at level one.
- `cmValueField.test_gaussian_ray3`: For `K=ℚ(i)`, `j=1728` lies in `K`, whereas the ray class field of modulus `3` has degree two; `j` alone does not generate it.

**Required calculations and boundary cases.** A function with a pole at `τ` is excluded rather than assigned a spurious field element. At level one in the elliptic case the value field is `K(j)`; at higher levels `j` alone need not generate it. For the Gaussian modulus `3`, ray degree `|(ℤ[i]/3)×|/|ℤ[i]×|=8/4=2`; `j` alone fails the stabilizer criterion. At `N=1` the class field is the ring class field, including nonmaximal conductor restrictions.

<a id="cm-3-3"></a>

### 3.3 The Gaussian ring and ray examples

Compute the field degrees and exceptional unit factors explicitly. The example distinguishes `ℚ(j)`, `K(j)`, the nonmaximal ring class field and the full ray-value field.

**The complete Gaussian ring-class example** — worked Check. For `K=ℚ(i)`, `O=ℤ[i]`, the unique ideal class has `j=1728`, `H_{−4}=X−1728∈ℤ[X]`, splitting field over `K` equal to `K`, and Artin action trivial on the single root. The prime ideal `(2+i)` of norm `5` gives an ideal isogeny of degree `5` with trivial class action. The four units are the exceptional automorphism group; they do not create four roots. The exact polynomial equality follows from `j(i)=1728` and `Pic(O)=1`, by an exact identity. The modulus-3 ray example has degree two and demonstrates why the ring-class generator does not already export a full ray field.

Sources: [MIT20](#source-mit20), Introduction p.1 and §20.3 p.5, defining product for `H_D`. Prerequisites: [classPolynomial.ringClassField](#cm-3-1); [cmValueField.rayClassField](#cm-3-2); [idealLatticeCurve.automorphism_factors](#cm-1-1); [idealAction.degree_eq_norm](#cm-1-2); [classPolynomial](#cm-3-1); [ModularForms Layer 0][modularforms-0]; [GlobalNumberFields Layer 11][globalnumberfields-11]; [ClassGroup][mathlib-classgroup]; [ClassGroup.mk][mathlib-classgroup.mk]; [CommRing.Pic][mathlib-commring.pic]; [ClassGroup.equivPic][mathlib-classgroup.equivpic].

**Required calculations and boundary cases.** Exact integer coefficient `−1728`, splitting field `K`, degree-five prime action and the ray unit quotient are all checked symbolically.

### Examples

The class products at `D=−4` and `D=−3` are `X−1728` and `X`. At `D=−36` there are two roots. The modulus-three Gaussian ray field has degree `8/4=2`, whereas `j=1728` generates `K` over `K` and `ℚ` over `ℚ`. A pole at the CM point is excluded from evaluation.

### Dependencies

Layers 1–2; GlobalNumberFields 7/11; ClassFieldTheory 11–13; Chebotarev 9; ModularForms 0 and ModularCurvesPartII §§3.14, 5.6 and 6.1; ShimuraVarieties §5.0 and §§8.1–8.3 for higher-dimensional level values.

## Layer 4: CM Hecke characters and their realizations

<a id="cm-4-1"></a>

### 4.1 Attached character, coefficient components and Frobenius

Use ArithmeticStatisticsPartVII `support-cm/cm_hecke_character` for the maximal-order elliptic character and extend it to nonmaximal orders through the supplied base-defined CM isogeny to maximal order. Construct the higher-dimensional character of the actual model with its full CM action defined over `k`, proving agreement with the supplied elliptic character in dimension one. Identify its principal-element law and least finite conductor, then compare each coefficient embedding with its rank-one Tate summand using AutomorphicGaloisRepresentationsPartII AG2.0. A full rational Tate representation has rank `2g`, not rank one.

**The algebraic Hecke character of a CM abelian variety** — `cmHeckeCharacter`. Let `A/k` be a `g`-dimensional abelian variety over a number field, with a CM field `E⊂End⁰_k(A)` of degree `2g` and all specified endomorphisms defined over `k`; its type has reflex field `E*⊂k`. On the Hecke-character and algebraic infinity-type carriers of GlobalNumberFields Layers 9–10, obtain `ψ_A:I_k(m)→E×` initially on a sufficiently large working modulus `m` containing bad reduction and the integral-order exceptions. In dimension one use ArithmeticStatisticsPartVII `cm_hecke_character`, transported through `cm_ideal_isogeny_comparison` for nonmaximal orders; in higher dimension construct the character and prove agreement with this elliptic specialization. At a good prime `v` prime to `m`, `ψ_A(v)` is the `E`-linear Frobenius element on `A_v`. For `a∈k×` with `a≡1 mod× m`, `ψ_A((a))=NΦ(N_{k/E*}a)`. Its complex components have the algebraic infinity type determined by `Φ` (positive ideal exponent; negative idelic exponent). Extend to the ideal character away from its finite conductor `f(ψ_A)`, the least modulus for the character’s principal-congruence law, independently of the extra working support. It divides every working modulus and need not contain the endomorphism-order exceptions. Values are in `E×`, not generally in `O_E×`.

Sources: [MilneCM](#source-milnecm), §9, Frobenius and idele dictionary pp.74–84; [BT](#source-bt), §3.1, proof of Theorem 1.1, p.6; [Kato](#source-kato), §15.10 p.260. Prerequisites: [ideleTorsionDictionary](#cm-2-2); [reflexIdealMap](#cm-2-2); [arbitraryCMClassification](#cm-2-1); `ArithmeticStatisticsPartVII:support-cm/cm_hecke_character` and `cm_ideal_isogeny_comparison`; [GlobalNumberFields Layer 9][globalnumberfields-9]; [GlobalNumberFields Layer 10][globalnumberfields-10]; [GlobalNumberFields Layer 8][globalnumberfields-8]; `ShimuraVarieties:§§5.4–5.11`; `ArithmeticGaloisRepresentations:§§6.1–6.2 and 6.4`; `AbelianSchemesAndArithmeticModuli:A6.11/charpolyTate`.

**One-dimensional CM components of the Tate module** — `cmTateComponents`. Under the CM-character hypotheses, `V_l(A)` is free of rank one over `E⊗ℚ_ℓ`. Fix an embedding `j:E→ℚ̄_l` and an isomorphism `η:ℚ̄_l≅ℂ` with `η∘j=τ`, the chosen complex component. Let `χ_{A,τ}` be the algebraic idelic character with finite uniformizer values `τ(ψ_A(v))` at good unramified primes. Apply AutomorphicGaloisRepresentationsPartII AG2.0 to its inverse: `ψ_{A,j}=r_{l,η}(χ_{A,τ}⁻¹)`. That supplier uses geometric Artin, so this character has arithmetic Frobenius value `j(ψ_A(v))` at every good `v∤l`. The CM-specific comparison identifies the one-dimensional `j`-coefficient summand with `ψ_{A,j}`, giving `V_l(A)⊗ℚ̄_l=⊕_j ψ_{A,j}` as actual `G_k` modules. The underlying `ℚ_l` dimension is `2g`. Integral rank-one freeness over `O⊗ℤ_l` requires `l` prime to the endomorphism-order index; it is not inferred from the rational comparison.

Sources: [MilneCM](#source-milnecm), Proposition 7.3 p.53; Theorem 9.10 and footnote 25 p.78; [BT](#source-bt), §3.1, proof of Theorem 1.1, p.6. Prerequisites: [cmHeckeCharacter](#cm-4-1); [ideleTorsionDictionary](#cm-2-2); `AutomorphicGaloisRepresentationsPartII:AG2.0/AlgHeckeChar.galoisChar`, `galoisChar_local` and `galoisChar_mul`; `ArithmeticGaloisRepresentations:§§6.1–6.2 and 6.4`; [GlobalNumberFields Layer 9][globalnumberfields-9]; [GlobalNumberFields Layer 10][globalnumberfields-10]; `AbelianSchemesAndArithmeticModuli:A6.11/charpolyTate`.

**Frobenius and infinity-type identities** — `cmFrobeniusIdentities`. At a good prime `v` with residue size `q` and CM character `ψ_A`, its Frobenius element `π_v=ψ_A(v)` satisfies `π_v̄π_v=q`, all complex absolute values `|τπ_v|=√q`, and the Tate polynomial equals `∏_{τ:E→ℚ̄}(X−τπ_v)`. The component infinity types are those of `Φ` transported by `τ`. For elliptic `A/K`, the polynomial is `X²−Tr_{K/ℚ}(π_v)X+q`; at an inert rational good prime `p` for `A/ℚ`, the rational trace is zero while the prime of `K` has norm `p²` and Frobenius `π_v=−p`.

Sources: [MilneCM](#source-milnecm), §8.1–8.3 pp.66–68; [Kato](#source-kato), §15.10 p.260 and §15.11 p.261. Prerequisites: [cmHeckeCharacter](#cm-4-1); [cmTateComponents](#cm-4-1); [GlobalNumberFields Layer 10][globalnumberfields-10]; `AutomorphicGaloisRepresentations:§§1.5 and 7.3; GL2AutomorphicRepresentationsAndTransfer:R17.4.16/quadratic-induction`; `AbelianSchemesAndArithmeticModuli:A6.11/charpolyTate`; `NeronModelsAndSemistableAbelianVarieties:§5.3i`; [cmHeckeCharacter.frobenius](#cm-4-1).

**Basic API.**

- `cmHeckeCharacter.principal`: For `a≡1 mod×m`, `ψ_A((a))=NΦ(N_{k/E*}a)`.
- `cmHeckeCharacter.frobenius`: At every good `v` away from `m`, `ψ_A(v)` is the actual `E`-linear arithmetic Frobenius.
- `cmHeckeCharacter.conductor_minimal`: `f(ψ_A)` divides every modulus admissible for the character and is itself admissible for the character; it need not be a working modulus containing the order exceptions.
- `cmHeckeCharacter.baseChange`: For a finite model-field extension k′/k, `ψ_{A/k′}=ψ_{A/k}∘N_{k′/k}`, with its least conductor recalculated.

**Checks.**

- `cmHeckeCharacter.test_working_support`: An elliptic curve with order `ℤ+3ℤi` acquires good reduction above `3` after a finite model-field extension. Néron–Ogg–Shafarevich and the Tate-character comparison make its CM character unramified there, so the character conductor omits that prime although the working modulus includes it.
- `cmHeckeCharacter.test_ideal_type`: In elliptic dimension, positive ideal type `(1,0)` matches negative idelic type `(−1,0)`.
- `cmHeckeCharacter.test_nonunit`: For `E:y²=x³−x` at `P=(5,i−3)`, `ψ(P)=−1+2i` has norm `5` and is not a Gaussian unit.
- `cmHeckeCharacter.test_inert_baseChange`: For the same curve at the inert rational prime `7`, the `K`-prime has norm `49` and `ψ((7))=−7`, not an element of norm `7`.

**Required calculations and boundary cases.** For an elliptic curve over its endomorphism field the ideal infinity type is `(1,0)`; the matching idelic type is `(−1,0)`. A good Frobenius value has nontrivial norm `q`, so need not be a unit. A CM elliptic `V_l` has rank two over `ℚ_ℓ` and rank one over `K⊗ℚ_ℓ`; it is not one-dimensional over `ℚ_ℓ` for inert coefficient primes. For `y²=x³−x`, rational good primes `5` and `7` give `X²+2X+5` and `X²+7`; over `K` at `7` the factor is `(X+7)²`.

<a id="cm-4-2"></a>

### 4.2 All-prime factors and induction

Good-prime formulas are inputs to Frobenius recognition, while ramified local factors and Artin/Swan conductors come from the actual local representation. The residual normalizer theorem records containment and the quadratic quotient, without claiming an unrestricted full image.

**Full elliptic CM L-factorization, including bad primes** — `ellipticCMLFactorization`. Let `A/K` be an elliptic curve with CM by an order in `K` and every endomorphism defined over `K`. For every finite prime `v` and coefficient `l≠char κ(v)`, define `P_v(A,T) = det(1 − Frob_geom,v T | H¹_et(A_K̄, ℚ_l)^{I_v})`, using ArithmeticGaloisRepresentations §6.3’s cohomological carrier `H¹_et=V_l(A)∨`. It equals `P_v(ψ,T)P_v(̄ψ,T)`, where an unramified rank-one factor is `1−ψ(v)T` and a ramified factor is `1`. CM `j` is integral, so `A` has potentially good reduction and finite inertia image: duality and averaging identify this determinant with that of arithmetic Frobenius on `V_l(A)^{I_v}`. Hence `L(A/K,s)=L(ψ,s)L(̄ψ,s)`, retaining every finite bad factor. The Artin exponent is `a_v(A)=a_v(ψ)+a_v(̄ψ)`; conjugation preserves these exponents, giving conductor ideal `f(ψ)²`.

Sources: [BT](#source-bt), §3.1, proof of Theorem 1.1, p.6; [BKO](#source-bko), §3.0.1 pp.950–951. Prerequisites: [cmTateComponents](#cm-4-1); [cmHeckeCharacter](#cm-4-1); [classPolynomial.integral](#cm-3-1); `ArithmeticGaloisRepresentations:§§1.3, 1.12, 2.1–2.5 and 6.3`; `ArithmeticGaloisRepresentations:§§3.1–3.5`; `NeronModelsAndSemistableAbelianVarieties:§5.6/LocalEulerPolynomial`; `NeronModelsAndSemistableAbelianVarieties:§5.3i`; [GlobalNumberFields Layer 9][globalnumberfields-9].

**CM induction and compatible-system comparison** — `cmInductionComparison`. For a rational CM elliptic curve `A/ℚ` with CM field `K`, its rational two-dimensional Tate representation after extension of coefficients is `Ind_{G_K}^{G_Q} ψ_l`. Restriction to `G_K` is `ψ_l⊕̄ψ_l`, and the representation is invariant under twisting by `χ_K`, consistent with CM.1’s actual self-twist isogeny. The weight-two theta-series/newform realization has the same good Frobenius polynomials and is compared by ArithmeticGaloisRepresentations §5.3 / AutomorphicGaloisRepresentations §§1.5 and 7.3. This imports generic induction and modular compatible systems; it is not another definition of automorphic induction.

Sources: [Kato](#source-kato), §15.10 pp.260–261; [BT](#source-bt), §3.1, proof of Theorem 1.1, p.6. Prerequisites: [cmTateComponents](#cm-4-1); [rationalCMSelfTwist](#cm-1-2); `ArithmeticGaloisRepresentations:§§5.1 and 5.3`; `AutomorphicGaloisRepresentations:§§1.5 and 7.3; GL2AutomorphicRepresentationsAndTransfer:R17.4.16/quadratic-induction`; [cmFrobeniusIdentities](#cm-4-1).

**Unramified CM residual Cartan normalizer** — `cmResidualCartanNormalizer`. For `A/ℚ` with CM by a quadratic order `O` and an odd rational prime `l` prime to `disc(O)`, the residual representation `A[l]` carries a rank-one `O/lO` action. The `G_K` image lies in the unit Cartan `C_l=(O/lO)×`, split if `l` splits in `K` and nonsplit if it is inert. The full `G_Q` image lies in its normalizer, with the quotient action given by `χ_K` and conjugation on `O/lO`. Every element outside the Cartan has trace zero and its projective order divides two. Neither equality with the full normalizer nor a Cartan claim at ramified/conductor primes is asserted.

Sources: [MilneCM](#source-milnecm), Proposition 7.3 and Remark 7.6, p.53, for the rank-one integral local module. Galois equivariance of the actual order action, `ρ(σ)ι(x)ρ(σ)⁻¹=ι(σx)`, and complex conjugation give the quadratic normalizer quotient. In the split model the other coset has off-diagonal matrices; in the nonsplit model its maps are `x↦a·conjugate(x)`. Both have trace zero and scalar square. [BS](#source-bs), §6 pp.372–373, is the Gaussian application. Prerequisites: the Galois/order-action comparison from the Lie-scalar identification in [rationalCMSelfTwist](#cm-1-2); [cmTateComponents](#cm-4-1); [cmInductionComparison](#cm-4-2); [GlobalNumberFields Layer 11][globalnumberfields-11]; `ArithmeticGaloisRepresentations:§§6.1–6.2 and 6.4`; [ClassGroup][mathlib-classgroup]; [ClassGroup.mk][mathlib-classgroup.mk]; [CommRing.Pic][mathlib-commring.pic]; [ClassGroup.equivPic][mathlib-classgroup.equivpic].

**Required calculations and boundary cases.** For the Gaussian curve, the bad prime above `2` has ramified characters and local factor `1`; omitting it from the product is not an all-prime proof. At good inert rational `p=7` over `K`, the local factor is `(1+7T)²` at norm `49`. At a split rational good prime the two eigenvalues are conjugate CM values; at an inert good prime the rational trace is zero. For Gaussian CM and `l=3` the Cartan is nonsplit of order `8`; `l=5` gives split order `16`. At `l=2` the Gaussian order is ramified and this assertion is outside its hypotheses.

<a id="cm-4-3"></a>

### 4.3 Canonical Gross conditions and inert reduction

Keep a canonical-character predicate separate from its existence and from its attachment to a canonical curve. Conductor support alone does not determine all local exponents. The good-reduction specialization carries the precise odd-discriminant and inert-prime hypotheses.

**Canonical Gross characters and their conductor support** — `IsCanonicalGrossCharacter`. On GlobalNumberFields Layer 9’s algebraic Hecke-character carrier for imaginary quadratic `K`, call `ψ` canonical in the Gross–Rohrlich sense when `ψ(̄a)=conjugate(ψ(a))` for ideals away from its conductor, `ψ((α))=±α` for principal ideals away from it, and every conductor prime ramifies in `K/ℚ`. Keep the finite sign character and its least conductor, rather than setting every principal value equal to `α`. In the BKO application use odd fundamental discriminant and `p≥5` inert with `p∤h_K`. Canonical characters over `K` give `ψ_H=ψ∘N_{H/K}` attached to a canonical CM elliptic curve over the Hilbert class field `H`, up to `H`-isogeny. The definition alone is not an existence proof.

Sources: [Yang](#source-yang), Introduction conditions (0.1)–(0.3), pp.1–2; [BKO](#source-bko), §3.0.1 pp.950–951 and equation (3.8) p.953. Prerequisites: [cmHeckeCharacter](#cm-4-1); [GlobalNumberFields Layer 9][globalnumberfields-9]; [GlobalNumberFields Layer 10][globalnumberfields-10]; [ClassFieldTheory Layer 13][classfieldtheory-13]; [GlobalNumberFields Layer 8][globalnumberfields-8]; [NumberField.RingOfIntegers][mathlib-numberfield.ringofintegers].

**Checks.**

- Its unit-ideal value is `1`; the generator `−1` requires the minus sign in the principal rule.
- For `K=ℚ(i)`, the generator `i` of the unit ideal is neither `1` nor `−1`, excluding a canonical character.
- For `K=ℚ(√−3)`, the unit `ζ₃` also has neither sign equal to `1`. The same principal-sign condition excludes this field, despite its odd discriminant.
- Class-character twists have trivial norm pullback from `H` and preserve the conjugation/sign/support conditions.

**Canonical Gross existence and attachment** — `canonicalGrossExistence`. For an imaginary quadratic field of fundamental discriminant `D<0`, a character satisfying the preceding three conditions exists exactly when `D≠−3` and either `D` is odd or `8` divides `D`. Its values may lie in an algebraic coefficient extension of `K`, not necessarily `K` itself. For `H/K` the Hilbert class field, the norm pullback of such a character is attached to a CM elliptic curve over `H`, unique up to `H`-isogeny for that character family. There is one such `H`-isogeny class when `D<−3` is odd and two when `8` divides `D`. The exceptional fields of discriminants `−3` and `−4` fail the unit test above; the existence assertion for `D<−4` uses the quadratic finite characters in Yang §4, where the source explicitly assumes `|D|>4`. The `D≡4 mod 8` simplest-character construction is different and is outside this target.

Sources: [Yang](#source-yang), Introduction (0.1)–(0.3) and attachment p.2; §4 equations (4.5)–(4.9), Proposition 4.2 and Corollary 4.3, pp.16–19, with `|D|>4`. The two unit obstructions are direct consequences of the defining principal-sign law. Prerequisites: [IsCanonicalGrossCharacter](#cm-4-3); [cmHeckeCharacter](#cm-4-1); [ClassFieldTheory Layer 13][classfieldtheory-13].

**Canonical Gross good reduction away from the discriminant** — `canonicalGrossGoodReduction`. For an attached canonical CM curve over `H` as above, every prime of `H` over a rational prime not dividing `D` is a good-reduction prime. Indeed its Hecke character is unramified there, since its conductor has only `K/ℚ`-ramified support and `H/K` is unramified. The Tate comparison and Néron–Ogg–Shafarevich give the assertion. This includes the BKO specialization `D` odd, `p≥5` inert and `p∤h_K`; these extra assumptions belong to the later local arithmetic, not to this good-reduction implication. No conductor exponents are inferred from support alone.

Sources: [BKO](#source-bko), §3.0.1 pp.950–951 and (3.8) p.953 for the inert specialization; the general consequence uses [Yang](#source-yang), (0.3) p.1 and Néron–Ogg–Shafarevich. Prerequisites: [canonicalGrossExistence](#cm-4-3); [cmTateComponents](#cm-4-1); `NeronModelsAndSemistableAbelianVarieties:§5.1`; [GlobalNumberFields Layer 8][globalnumberfields-8].

**Basic API.**

- `IsCanonicalGrossCharacter.conjugation`: `ψ(̄a)=conjugate(ψ(a))` away from the finite conductor.
- `IsCanonicalGrossCharacter.principal_sign`: `ψ((α))/α` is a sign for `α` prime to the conductor.
- `IsCanonicalGrossCharacter.conductor_support`: Every prime divisor of `f(ψ)` is ramified in `K/ℚ`.
- `IsCanonicalGrossCharacter.class_twist`: Twisting by a class character preserves the canonical family conditions and leaves its `H`-norm pullback unchanged.

**Checks.**

- `IsCanonicalGrossCharacter.test_sign`: Dropping the finite sign character and assigning `ψ((−1))=−1` contradicts `ψ(O_K)=1`.
- `IsCanonicalGrossCharacter.test_inert_unramified`: For the BKO inert `p` unramified in `K`, `p` does not divide the canonical conductor.
- `IsCanonicalGrossCharacter.test_even_excluded`: For the Gaussian field, an excluded `D≡4 mod 8` case, the unit `i` generates the unit ideal but is neither `1` nor `−1`. The canonical principal-sign condition therefore cannot hold; a simplest character must not be relabeled canonical.

**Required calculations and boundary cases.** For odd `D<−3` the canonical family is considered up to unramified class-character twist. The Eisenstein and Gaussian units exclude `D=−3` and `D=−4` respectively. For discriminant valuation exactly two at `2` (`D≡4 mod 8`), canonical characters of these three conditions do not exist; Yang’s simplest higher-dimensional characters are a different construction. An arbitrary CM quadratic twist can introduce extra conductor primes and is not covered by the canonical conductor-support statement.

### Examples

At `p=5` the Gaussian Frobenius is `−1+2i` with norm five; at rational `p=7` the trace is zero, while over `K` the Frobenius is `−7` of norm `49`. At the bad prime above `2` its character is ramified and its local Euler factor is `1`. The residual Gaussian Cartans have sizes eight at `l=3` and sixteen at `l=5`; `l=2` violates the unramified-order hypothesis.

### Dependencies

Layers 1–3; GlobalNumberFields 8–10; ClassFieldTheory 13; ArithmeticStatisticsPartVII `support-cm/cm_hecke_character` and `cm_ideal_isogeny_comparison`; AutomorphicGaloisRepresentationsPartII AG2.0 `AlgHeckeChar.galoisChar`, `galoisChar_local` and `galoisChar_mul`; ArithmeticGaloisRepresentations §§1.3, 1.12, 2.1–2.5, 3.1–3.5, 5.1, 5.3, 6.1–6.4; AutomorphicGaloisRepresentations §§1.5 and 7.3; GL2AutomorphicRepresentationsAndTransfer R17.4.16/quadratic-induction; NeronModelsAndSemistableAbelianVarieties §§5.1, 5.3i and 5.6.

## Layer 5: Reduction, isogeny graphs and mathematical recovery

<a id="cm-5-1"></a>

### 5.1 Deuring classification, specialization and lifting

Distinguish model-field endomorphisms from geometric ones before applying the finite-field classification. The specialization theorem gives ordinary split reduction and supersingular nonsplit reduction. Deuring lifting preserves one endomorphism, not the full quaternion ring.

**Deuring’s characteristic-`p` endomorphism classification** — `deuringClassification`. For every elliptic curve `A/k` in characteristic `p>0`, let `End_geom(A)=End_{k̄}(A_k̄)`. It is either `ℤ`, an order in an imaginary quadratic field where `p` splits and whose conductor is prime to `p`, or a maximal order in the definite rational quaternion algebra `B_{p,∞}` ramified exactly at `p` and `∞`. The quaternion case is precisely supersingular. Over `k̄=𝔽̄_p` the `ℤ` case does not occur; every ordinary curve has the quadratic-order case and every supersingular curve the maximal quaternion-order case. Every maximal-order conjugacy type occurs for a supersingular curve. The ordinary finite-field order statement is consumed from EllipticCurves Layer 1; this classification adds arbitrary characteristic-`p` base fields, the split/conductor condition and realization of every maximal-order type, using SerreWeightAndLevelOptimisation §2.6 `deuring-eichler-supersingular-comparison` at `N=1` for quaternionic maximality. It includes `p=2,3`; `End_k` can be smaller than `End_geom`.

Sources: [Deuring](#source-deuring), Introduction §§2–3 pp.198–199; §2.4 pp.212–213, §2.5–10 pp.213–218, and §8 conclusion p.258; [GZ](#source-gz), Chapter III §7 p.261. Prerequisites: [EllipticCurves Layer 1][ellipticcurves-1]; [EllipticCurves Layer 3][ellipticcurves-3]; [EllipticCurves Layer 2][ellipticcurves-2]; `AbelianSchemesAndArithmeticModuli:A6.10/End.charpoly`; [QuadraticFormInvariants Layer 2][quadraticforminvariants-2]; `SerreWeightAndLevelOptimisation:§2.6/deuring-eichler-supersingular-comparison`; `GeometryOfNumbersAndQuadraticArithmetic:§2.8`; `TauCeti.AlgebraicGeometry.AbelianVariety.End`.

Use the supplied `N=1` supersingular order and isogeny/ideal comparison, retaining the inseparable `p`-power part. In the ordinary case the one-dimensional `p`-adic action forces `p` to split in the quadratic field, and its integral local order is maximal at `p`; this is the conductor-prime-to-p conclusion. Finally realize every quaternion maximal-order type using the associated ideal quotient. These comparisons are on the actual torsion kernels and embedded endomorphism lattices, not on assumed numerical counts.

**Potential good reduction and the split/non-split dichotomy** — `cmReductionDictionary`. Let `A` be an elliptic curve with full CM order `O_f` in imaginary quadratic `K` over a number field. It has potentially good reduction at every finite place because `j` is an algebraic integer. After a finite extension giving good reduction at residue characteristic `p`, the geometric reduction is ordinary iff `p` splits in `K`, and supersingular iff `p` is inert or ramified in `K`. The reduction map embeds `O_f` in `End_geom` of the reduction. In the ordinary case its order conductor is `f/p^{v_p(f)}`; in the supersingular case `End_geom` is a maximal quaternion order containing the reduced CM order, with optimality tracked separately. No extension of the residue coefficient field turns supersingular reduction into an ordinary one.

Sources: [Deuring](#source-deuring), Introduction §§2–3 pp.198–200; [GZ](#source-gz), Chapter III §7 p.261. Prerequisites: [deuringClassification](#cm-5-1); [classPolynomial.integral](#cm-3-1); `NeronModelsAndSemistableAbelianVarieties:§5.1`; [EllipticCurves Layer 4][ellipticcurves-4]; [EllipticCurves Layer 3][ellipticcurves-3]; [GlobalNumberFields Layer 11][globalnumberfields-11]; [ClassGroup][mathlib-classgroup]; [ClassGroup.mk][mathlib-classgroup.mk]; [CommRing.Pic][mathlib-commring.pic]; [ClassGroup.equivPic][mathlib-classgroup.equivpic].

**The explicit CM Frobenius ideal formula** — `shimuraTaniyamaDictionary`. Let `A/k` have full `O_E`-CM of type `Φ`, where `k` is a number field containing a normal closure of the embedded CM field `E`, with the CM action defined over `k`. Assume good reduction at `P|p` and `p` unramified in `E`. With `q=|κ(P)|`, its Frobenius `π∈O_E` has

`(π)=∏_{φ∈Φ}φ⁻¹(N_{k/φ(E)}P)=NΦ(N_{k/E*}P)`.

The norms here are norms of number-field ideals. Alternatively one may formulate local numerical norms using specified completions, but `N_{k/φ(E)}` cannot be a number-field ideal norm when `k` is a `p`-adic field. The conjugates and prime `P` are part of the input.

Sources: [MilneCM](#source-milnecm), Theorem 8.1 and Corollaries 8.2–8.3 pp.66–68, number-field version in Remark 8.6(a) p.69. Prerequisites: `ShimuraVarieties:§§5.4–5.11`; [reflexIdealMap](#cm-2-2); [cmHeckeCharacter](#cm-4-1); [GlobalNumberFields Layer 8][globalnumberfields-8].

**The slope formula, including ramified primes** — `cmNewtonSlopes`. Let `A/k` have CM type `(E,Φ)`, with `E⊂End⁰_k(A)` a CM field of degree `2·dim A`, all specified endomorphisms defined over the number field `k` containing a normal closure of `E`, and good reduction at `P|p`. Allow ramification at `p` and nonmaximal integral CM orders. Fix an embedding `k↪ℚ̄_p` inducing the chosen reduction prime `P`, and use its restriction to the embedded normal closure of `E` to transport the complex CM type `Φ`. For `v|p`, let `H_v` be all embeddings `E→ℚ̄_p` inducing `v`; the count `|Φ∩H_v|` uses this transported type. A choice of embedding inducing a different prime of `k` cannot be paired with reduction at `P`. The `v`-component of the `p`-divisible group up to isogeny is isoclinic of slope `|Φ∩H_v|/|H_v|`, repeated `[E_v:ℚ_p]` times. Define the rational local component by the `E⊗ℚ_p` idempotent on the crystalline Dieudonné isocrystal of the reduction, with the variance and twists of A4.CR.7.2. Compare its Frobenius valuations with ShimuraVarieties §5.8 and the CR.4.7 slope decomposition; an integral product decomposition at a nonmaximal order is not assumed. Prove the extension to nonmaximal CM orders by a CM isogeny to a maximal-order lattice, extending the isogeny over good reduction and using invariance of the rational Dieudonné module. Thus the formula also applies to nonmaximal CM orders. For a product CM algebra apply the statement to each factor. It specializes in the unramified maximal-order case to `ord_v(π)/ord_v(q)=|Φ∩H_v|/|H_v|`. Every `H_v` is nonempty; the denominator is never an arbitrarily supplied zero cardinality. This comparison specializes ShimuraVarieties §§5.8–5.11’s general Shimura–Taniyama theorem and does not rebuild it.

Sources: [MilneCM](#source-milnecm), Remark 8.4 p.69; Proposition 8.11 and Theorem 8.12, equation (61), pp.72–73. Prerequisites: `ShimuraVarieties:§§5.4–5.11`; `AbelianSchemesAndArithmeticModuli:A4.5/BarsottiTate` and `A4.CR.7.2`; `CrystallineCohomology:CR.4.7`, *Slope decomposition on the existing isocrystal carrier*; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2.15/dieudonneManinClassification`, `R07.2.16/slopeSequence` and `slopeSequence_baseChange`; the extension of homomorphisms and the abelian-scheme Néron comparison from `NeronModelsAndSemistableAbelianVarieties:§§1.5, 1.8`, and good reduction under isogeny from its §5.1.

**Checks.**

- For a split elliptic CM prime the two local factors have slopes `0` and `1`, each once.
- For an inert elliptic CM prime the local factor has slope `1/2` with multiplicity two.
- For `E=ℚ(ζ₅)` at inert `p=2`, the selected-embedding count is two and the local degree is four: the slope `2/4=1/2` occurs four times.
- Replacing a good-reduction CM variety by a CM-isogenous one with maximal-order action preserves its slope sequence, including at primes dividing the original order index.
- `cmNewtonSlopes.test_prime_compatibility`: For the Gaussian curve at `P=(5,i−3)`, `π=−1+2i` has valuation one at `v₃=(5,i−3)` and zero at `v₂=(5,i−2)`, while `q=5` has valuation one at both. The embedding inducing `P` transports the standard CM type to `v₃`, giving slopes `1` at `v₃` and `0` at `v₂`. Transport through the embedding `i↦2 mod 5` would interchange these labels and contradict the valuations for this `P`.

**Deuring lifting with an endomorphism** — `deuringLifting`. For an elliptic curve `A` over a finite field `𝔽_q` and nonzero `α∈End_{𝔽_q}(A)`, there are a number field `L`, a prime `P` with residue field identified with `𝔽_q`, an elliptic curve `A*/L` with good reduction at `P` and `α*∈End_L(A*)` reducing to the pair `(A,α)`. A non-scalar `α` yields an imaginary-quadratic CM lift. The statement does not claim a lift of the entire supersingular quaternion endomorphism ring as characteristic-zero endomorphisms.

Sources: [Deuring](#source-deuring), §9.1 pp.258–262; [MIT21](#source-mit21), Theorem 21.15 p.10. Prerequisites: [deuringClassification](#cm-5-1); [EllipticCurves Layer 3][ellipticcurves-3]; [EllipticCurves Layer 1][ellipticcurves-1]; `ModularCurvesPartII:§§3.14 and 6.1`.

**Required calculations and boundary cases.** Over `𝔽₅`, `y²=x³−x` is ordinary; over `𝔽₇` it is supersingular and its geometric `End⁰` is quaternion, although `End_{𝔽₇}⁰` is quadratic. A transcendental ordinary `j` in characteristic `p` can have `End_geom=ℤ`; the finite-field assumption cannot be silently dropped. For the Gaussian curve, `p=5` is split/ordinary and `p=7` is inert/supersingular. Ramified `p` belongs to the supersingular side; dropping ramified primes gives an incomplete dichotomy. For elliptic split `p` the slopes are `0` and `1`; for inert unramified `p` they are both `1/2`. In dimension two the selected-embedding count determines the numerator of the slope; the multiplicity of the `v`-component is `[E_v:ℚ_p]`. For `ℚ(ζ₅)` at inert `2`, slope `1/2` occurs four times. For a supersingular curve, two noncommuting quaternion endomorphisms cannot both be identified with a characteristic-zero CM endomorphism ring.

**Checks.**

- In characteristic `2` the smooth model `y²+y=x³` has three `𝔽₂`-points including infinity, and trace zero. A short equation `y²=x³+ax+b` cannot replace a general Weierstrass model there.
- In characteristic `3` the smooth curve `y²=x³−x` has four `𝔽₃`-points including infinity and trace zero. These supersingular cases are included in the classification.
- The Gaussian curve has eight `𝔽₅`-points (trace `−2`) and eight `𝔽₇`-points (trace zero). Extending the latter residue field preserves supersingularity, rather than making its geometric endomorphism ring quadratic.

<a id="cm-5-2"></a>

### 5.2 Ordinary order levels and supersingular level pairs

Horizontal ideal actions belong to the ordinary exact-order level. Vertical steps change the conductor. A supersingular curve has a maximal quaternion order, whereas the endomorphisms preserving a prime-to-`p` cyclic level subgroup form an Eichler order.

**CM order levels and horizontal isogeny graphs** — `cmIsogenyGraphDictionary`. For ordinary `A/𝔽_q` with geometric order `O_f` and `l≠p`, an `l`-isogeny changes the endomorphism order only horizontally (same order), by index `l` upward or by index `l` downward. Count the `l+1` cyclic geometric kernels, including multiplicities when targets coincide. If `l∤f`, the horizontal kernels correspond to invertible ideals of norm `l`, giving `1+(D_K/l)` horizontal, zero ascending and `l−(D_K/l)` descending kernels. If `l|f`, there are zero horizontal, one ascending and `l` descending kernels. In particular ramified, split and inert `l∤f` give respectively one, two and zero horizontal kernels. These are counts over the algebraic closure: an `𝔽_q`-rational edge additionally requires a Frobenius-stable kernel, so the full geometric count is not asserted over `𝔽_q`. Retain the exceptional `j=0,1728` kernel multiplicities. A graph vertex is a `j`-invariant up to geometric isomorphism; a finite-field twist is not fixed by a `j`-root. Supersingular components use quaternionic ideals and cannot use the ordinary order volcano as an order criterion.

Sources: [MIT22](#source-mit22), §22.1, Theorems 22.3 and 22.5 and Definition 22.4, pp.2–3. Prerequisites: [cmReductionDictionary](#cm-5-1); [idealAction](#cm-1-1); [idealLatticeCurve.automorphism_factors](#cm-1-1); [idealAction.degree_eq_norm](#cm-1-2); [GlobalNumberFields Layer 11][globalnumberfields-11]; [EllipticCurves Layer 3][ellipticcurves-3]; [ClassGroup][mathlib-classgroup]; [ClassGroup.mk][mathlib-classgroup.mk]; [CommRing.Pic][mathlib-commring.pic]; [ClassGroup.equivPic][mathlib-classgroup.equivpic].

**Quaternion orders of a curve and of a level pair** — `supersingularLevelOrderComparison`. For a supersingular curve `A/𝔽̄_p` and cyclic subgroup `C` of positive order `N` prime to `p`, consume SerreWeightAndLevelOptimisation §2.6 `deuring-eichler-supersingular-comparison`: `End(A,C)`, the endomorphisms preserving `C`, is an Eichler order of level `N` in `B_{p,∞}`. At `N=1` this is the maximal order `End_geom(A)`. Compare the reduced CM embedding with this supplied order and track its optimality. On the embedded lattice carrier, identify the reduced discriminant as `Np`, giving `p` for the curve itself; the pair order is maximal at `p` but need not be maximal away from `p`. In the Gross–Zagier situation `p` is non-split in the CM field, `p∤N` and `N` satisfies the Heegner splitting conditions; the reduced CM embedding and its optimality must be tracked in the pair’s order. `End` of the pair must never be called the full maximal `End` of the curve.

Here an order is an embedded full finite `ℤ`-subalgebra of the supplied quaternion algebra; maximal means maximal among such subalgebras. Reduced discriminant is the positive square root of the absolute determinant of its reduced-trace pairing. Transport the supplied Eichler order to GeometryOfNumbersAndQuadraticArithmetic §2.8’s lattice/localization API. Compute its reduced-trace determinant from its local level: at split `l≠p` the source and quotient maximal orders have distance `ν_l(N)`, while the division order at `p` has reduced discriminant `p`. The order classification remains with its supplier; the CM embedding and reduced-discriminant comparisons are targets here.

Sources: [GZ](#source-gz), Chapter III §7 p.261. Prerequisites: [deuringClassification](#cm-5-1); [cmReductionDictionary](#cm-5-1); [QuadraticFormInvariants Layer 2][quadraticforminvariants-2]; `SerreWeightAndLevelOptimisation:§2.6/deuring-eichler-supersingular-comparison`; `GeometryOfNumbersAndQuadraticArithmetic:§2.8`; [EllipticCurves Layer 1][ellipticcurves-1].

**Checks.**

- For the Gaussian curve at `p=7`, level one gives the maximal order of reduced discriminant `7`; its reduced `ℤ[i]` embedding is optimal since `ℤ[i]` is already maximal in `ℚ(i)`.
- On that curve, the cyclic subgroup `C=ker[2+i]` has order `5` and is preserved by `ℤ[i]`. The pair order has reduced discriminant `35`, while the full curve order has reduced discriminant `7`; the CM embedding remains optimal.
- For `y²+y=x³` over `𝔽̄₂` and a cyclic subgroup of order `3`, the pair order has reduced discriminant `6`. The comparison includes residue characteristic two.

**Required calculations and boundary cases.** An inert `l` gives no horizontal edges, not two after coefficient extension. Exceptional `j` graph multiplicities count kernels, not merely distinct target `j`-values. For `l=2` and `l∤f`, the split, ramified and inert rows have (horizontal,ascending,descending) counts `(2,0,1)`, `(1,0,2)`, and `(0,0,3)`; at `2|f` they are `(0,1,2)`. Each row totals `l+1=3`. Frobenius-stable kernels form a subset of this geometric list; a target `j` in `𝔽_q` alone does not specify a rational kernel or a twist. At `N=1` recover the maximal order; at a nontrivial squarefree `N` the reduced discriminant is `Np`.

<a id="cm-5-3"></a>

### 5.3 Height, perturbation and integral coefficients

**An unconditional class-polynomial bound** — `classPolynomialHeightBound`. Let `(a_k,b_k,c_k)`, `1≤k≤h`, be the complete reduced primitive positive-form census for a negative quadratic discriminant `D`. For `τ_k=(−b_k+i√|D|)/(2a_k)`, put `M_k=exp(π√|D|/a_k)+2114567/1000`. Then `|j(τ_k)|≤M_k`, and every coefficient of `H_D` has absolute value at most `B_D=⌈∏_k(1+M_k)⌉`. Any real or integer upper bound for this expression is also sufficient. This bound is unconditional.

The algebraic input `rootProduct_coeff_bound` is more general: for any finite index set `J` and complex roots `z_k` with `|z_k|≤M_k` and `M_k≥0`, every coefficient of `∏_k(X−z_k)` has norm at most `∏_k(1+M_k)`. It includes the empty product, which is `1`. It uses the native polynomial product, without defining another polynomial carrier.

Sources: [CRT](#source-crt), Appendix 1 Lemma 8 and its proof pp.31–32; the coefficient bound follows by expansion in elementary symmetric functions. Prerequisites: [classPolynomial](#cm-3-1); [classPolynomial.integral](#cm-3-1); `IntegralLattices:B5`; [ModularForms Layer 0][modularforms-0].

**Perturbation of a finite root product** — `rootProduct_coeff_perturbation`. Let `J` be finite of cardinal `h`, `z,w:J→ℂ`, `M≥0` and `0≤δ≤1`, with `|z_k|≤M` and `|w_k−z_k|≤δ` for every `k`. Then every coefficient of `∏(X−w_k)−∏(X−z_k)` has norm at most `hδ(1+M+δ)^{h−1}`. For `h=0` the difference is zero and the bound is zero (the natural-number exponent is truncated). For `h≥1`, `δ<1/(4h(2+M)^{h−1})` implies this error is `<1/4`. Prove the estimate by telescoping products and summing absolute coefficients. The exact coefficients are integral only after applying CM.3 to an actual complete CM root census.

The positive-cardinality consequence is named `rootProduct_precision`. Source: elementary product estimate applied to [CRT](#source-crt), Appendix 1 pp.31–32; the displayed safe error bound is a derived lemma, not a quoted numbered theorem. Prerequisites: native finite polynomial products and complex norm; [classPolynomial.integral](#cm-3-1) for its CM application.

**Recovery from coefficient intervals** — `classPolynomial_interval_recovery`. Let `H=H_D∈ℤ[X]`, `P∈ℤ[X]`, and real intervals `[l_k,u_k]` for every `k≤max(deg H,deg P)`. Assume `l_k≤H.coeff(k)≤u_k` and that `P.coeff(k)` is the unique integer in this interval. Then `P=H`. The interval-membership assumption concerns the exact coefficient, not just an approximate center. The general statement holds for any two integer polynomials with these assumptions; no evaluation or rounding procedure is part of it. Permuting a complete CM root census leaves the polynomial and all resulting equalities unchanged.

The general polynomial theorem is named `coefficient_interval_recovery`. Source: integrality from [MIT20](#source-mit20), Theorem 20.12 and Corollary 20.13 p.6; polynomial extensionality and uniqueness of integers give the consequence. Prerequisites: [classPolynomial.integral](#cm-3-1); the preceding norm bounds when used to establish interval membership.

**Checks.**

- At `D=−4` the exact constant coefficient is `−1728`, and `[−17281/10,−17279/10]` contains that integer uniquely. The positive root interval [17279/10,17281/10] instead singles out `j(i)=1728`; root and constant-coefficient signs differ.
- `[−1728,−1727]` contains two integers and cannot determine one coefficient. Small interval width without uniqueness is insufficient.
- For `h=1` the error bound is `δ`. For `h=2`, roots `1` and `2` perturbed to `1+δ` and `2+δ` change the constant coefficient by `3δ+δ²` and the `X` coefficient by `−2δ`. Omitting one factor or one linear term fails this witness.
- An empty root product is `1`. A CM class census is nonempty; in particular a singleton cannot represent `Pic(ℤ+3ℤi)`, whose size is two.
- `H_{−4}=X−1728` and `H_{−3}=X` are exact one-root cases. No hypothesis concerning a floating-point value replaces a bound on the exact root.

<a id="cm-5-4"></a>

### 5.4 Signed relations and the ordinary conductor

**Signed ideal-relation count** — `signedRelationCount`. For any commutative group `G`, classes `a_i∈G` and natural exponents `e_i`, this is the number of sign vectors `ε_i∈{−1,1}` with `∏a_i^{ε_i e_i}=1`. The light group definition permits `e_i=0`; such a coordinate doubles the count. An arithmetic relation `R` uses positive exponents and split primes `l_i` prime to the Frobenius conductor `v` and characteristic `p`. In an order `O_D`, take `a_i` to be a chosen prime-ideal class over `l_i` in `Pic(O_D)`, obtaining `#R/D`. Conjugating a selected ideal changes one sign coordinate, so the number is well defined. Count sign vectors even when they yield the same ideal class or target `j`. On an ordinary curve of actual order `O_D`, the horizontal ideal-action dictionary identifies this with the number of signed horizontal paths returning to its geometric class. This identification defines `#R/A`.

**API.** `signedRelationCount.invert_choice` preserves the count when a selected class is inverted; `signedRelationCount.bound` gives `#R/D≤2^n`; `signedRelationCount.even` gives evenness when `n>0`; `signedRelationCount.isogeny_comparison` identifies the actual curve and class counts under the stated ordinary-order hypotheses. For the empty relation the count is one, so evenness requires `n>0`. Extension to an overorder injects the solution set and weakly increases the count.

Sources: [Endo](#source-endo), §2.3 equation (3) pp.4–5 and §2.4 Lemma 3 p.5. Prerequisites: [cmIsogenyGraphDictionary](#cm-5-2); [idealAction.picardEquiv](#cm-1-1); [GlobalNumberFields Layer 11][globalnumberfields-11].

**Checks.**

- The empty relation has count one. A unary relation with principal class has count two, from its two signs, even though both products coincide.
- For a class `a` of order three, two occurrences with exponent one have count two (the opposite-sign vectors); a unary occurrence has count zero. For an order-two class the same two-occurrence count is four.
- Replacing any one class by its inverse preserves the count. Counting only distinct target `j`-values would lose these multiplicities.

**Prime-power separation of conductors** — `ordinaryConductor_primePower`. Let `A/𝔽_q` be ordinary, `q=pʳ` with `p` prime and `r≥1`, `t` its actual trace with `p∤t`, `t²−4q=v²D_K` and `D_K` fundamental negative. Its actual conductor `u_A` divides `v`. For any prime power `r_0^k|v`, `k≥1`, put `j=ν_{r_0}(v)−k+1`, `D1=(v/r_0^j)²D_K` and `D2=r_0^{2k}D_K`. Given an actual signed relation `R` with `#R/D1>#R/D2`, one has

`r_0^k | u_A  ⇔  #R/A < #R/D1`.

The implication holds also at `r_0=2` or `3` if such a separating relation is supplied. Existence of infinitely many separating unary relations is asserted for `r_0>3` only. The curve count is the intrinsic count just defined, and the class counts are in the actual two orders. One cannot replace these hypotheses with Boolean decisions or arbitrary count tables.

**Determining the whole ordinary order** — `ordinaryConductor_eq_iff`. Let `u>0` divide `v`. Assume `ν_2(u_A)=ν_2(u)` and `ν_3(u_A)=ν_3(u)`. For every prime power `r_0^k|v` with `r_0>3` choose a relation satisfying the preceding inequality. Then `u_A=u` iff every corresponding inequality `#R/A<#R/D1` holds exactly for those `r_0^k` dividing `u`. This is a mathematical criterion with the two small-prime valuations as explicit hypotheses. It has no procedure for obtaining those valuations. Agreement at every prime power, rather than only at each prime, determines the divisor.

Sources: [Endo](#source-endo), §2.4 Corollary 4 and Proposition 5 pp.5–6; combine the corollary with uniqueness of prime-power factorization. Prerequisites: the preceding signed-count comparison; [deuringClassification](#cm-5-1); [GlobalNumberFields Layer 11][globalnumberfields-11].

**Checks.**

- If `v=1` then `u_A=u=1`; the ordinary, trace and discriminant hypotheses are still required.
- The data `q=641,t=8,D_K=−4,v=25` satisfy `t²−4q=25²D_K`. For `u=5`, the 5-divisibility decision is true and the 25-divisibility decision false; prime support alone cannot distinguish `5` from `25`. Here (D1,D2) are `(−4,−100)` at `k=1` and `(−100,−2500)` at `k=2`.
- If the actual class counts fail the strict separation inequality, that relation supplies no conclusion about `u_A`. A `j`-root of `H_D` modulo `p` supplies no replacement for an endomorphism-order hypothesis.
- Supersingular curves, including any extension of the Gaussian curve at `p=7`, have `p|t` and are outside this ordinary criterion. The ordinary theory is valid in characteristic `2` and `3` as well, with its stated hypotheses.

<a id="cm-5-5"></a>

### 5.5 Reduction products and integer reconstruction

**Ordinary reduction of the complete CM class set** — `classPolynomial_reduction_product`. Let `D<0` be an order discriminant, `K` its quadratic field and `L_f/K` its ring class field. Let `p` be a rational prime, `p∤D`, splitting completely in `L_f/ℚ`. For a compatible good ordinary reduction at a prime above `p`, the reductions of the full `Pic(O_D)`-orbit give exactly the `j`-values in `𝔽_p` with geometric endomorphism order `O_D`, each once. Consequently `H_D mod p=∏_{[I]∈Pic(O_D)}(X−j(A_I))` in `𝔽_p[X]`. Equivalently, take as explicit hypotheses a full Picard torsor of ordinary curves of that exact order, together with its identification with the reductions of `E_I`; a list of `h` roots without that identification is insufficient. The exact-order hypothesis is independent of polynomial root membership.

Sources: [CRT](#source-crt), §5.2 p.17 and §6 pp.18–20; [MIT21](#source-mit21), Theorem 21.14 p.10 with the ordinary split restriction. Prerequisites: [classPolynomial](#cm-3-1); [classPolynomial.ringClassField](#cm-3-1); [cmReductionDictionary](#cm-5-1); [idealAction](#cm-1-1).

**Bounded reconstruction** — `classPolynomial_CRT_recovery`. Let `p_1,…,p_s` be pairwise distinct rational primes as above and let `H_i` be those complete reduction products. Let `B≥0` bound the absolute values of every coefficient of `H_D`, let `P∈ℤ[X]` have the same coefficient bound, and assume `P mod p_i=H_i` for all `i`. If `M=∏p_i>2B` then `P=H_D`. More generally, for any integer polynomials `P,Q` bounded coefficientwise by `B`, congruence coefficientwise modulo a positive integer `M>2B` implies `P = Q`. The product modulus follows from coprimality of the distinct primes, using the existing integer congruence/CRT API. No condition on how primes or curves were found enters this statement.

The general bounded-congruence theorem is named `polynomial_bounded_congruence`. Source: [CRT](#source-crt), §§5.2–6 pp.17–20, standard integer CRT argument. Prerequisites: the preceding reduction theorem; [classPolynomialHeightBound](#cm-5-3); native polynomial coefficients and `Int.ModEq`.

**Checks.**

- With `B=10` the integers `−10` and `10` are congruent modulo `20` but are unequal. Modulus `21` meets the strict sufficient bound and distinguishes all integers in `[−10,10]`.
- Repeating `p=5` does not strengthen congruence modulo `5` to congruence modulo `25`: `0` and `5` witness the difference. Primes must be distinct.
- The Gaussian curve at inert `p=7` is supersingular over every finite extension and cannot provide the ordinary reductions in this theorem, even if all its `j`-values lie in that extension.
- For `D=−23`, `H_D=X³+3491750X²−5151296875X+12771880859375` reduces to `X³` modulo `5`. Although the principal `K`-prime `(5)` splits over `K` in the Hilbert class field and has norm `25`, its rational residue characteristic is inert. A norm or root-count hypothesis alone would give a false distinct-root conclusion.
- `D=−4` and `D=−3` give the exact polynomials `X−1728` and `X`. Changing the chosen admissible distinct primes leaves the bounded reconstruction equal to the same `H_D`.

### Examples

The split/inert Gaussian examples give slopes {0,1} and {1/2,1/2}; ramified primes belong to the supersingular side. The conductor-`25` example requires two distinct prime-power decisions. The two-root perturbation and the boundary congruence `−10≡10` (mod `20`) distinguish the strict bounds from weaker false statements.

### Dependencies

Layers 0–4; EllipticCurves 1/3/4; GlobalNumberFields 8/11; IntegralLattices B5; SerreWeightAndLevelOptimisation §2.6 `deuring-eichler-supersingular-comparison`; GeometryOfNumbersAndQuadraticArithmetic §2.8; QuadraticFormInvariants 2; ShimuraVarieties §§5.4–5.11; AbelianSchemesAndArithmeticModuli A4.CR.7.2; CrystallineCohomology CR.4.7; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.15–R07.2.16; NeronModelsAndSemistableAbelianVarieties §§1.5, 1.8 and 5.1. Trace, exact-order, interval and residue assertions are explicit hypotheses, not procedural suppliers.

## Downstream consumers

ComplexMultiplicationAndExplicitReciprocityPartII consumes types, reflex orders, CM character realizations and polarized moduli comparisons for height and Colmez statements. Heegner-point and Gross–Zagier roadmaps consume the proper-order class action, ring-class Artin formula, reduction and level-pair quaternion comparison. Euler-system and `p`-converse roadmaps consume the canonical-character attachment, good reduction, Hodge/period and local-factor comparisons. CM theta-series applications use the induction comparison with AutomorphicGaloisRepresentations §§1.5 and 7.3, keeping the coefficient field and covariant/cohomological convention explicit.

## References

Page numbers in the build are the source's printed pages, including author-copy pagination where stated. The cited preprints of BT, KS, Streng, CRT and Endo fix their theorem numbering; publication metadata does not assert that another version has identical statements. The primary sources support individual constructions and comparisons rather than determining this roadmap's layer order.

<a id="source-milnecm"></a>

**MilneCM** — James S. Milne, [Complex Multiplication](https://www.jmilne.org/math/CourseNotes/CM.pdf). v0.10, 14 July 2020. Relevant locators: §1 pp.11–19; Example 2.9 pp.25–26; §3.11–3.17 pp.29–31; §8.1–8.7 pp.66–70; §9 pp.74–84, especially Theorem 9.10, Remark 9.11(c) and Theorem 9.17.

<a id="source-milneft"></a>

**MilneFT** — James S. Milne, [The fundamental theorem of complex multiplication](https://arxiv.org/pdf/0705.3446v1). arXiv:0705.3446v1, 2007. Relevant locators: Introduction pp.1–3; §3 pp.20–21 (Artin normalization).

<a id="source-streng"></a>

**Streng** — Marco Streng, [An explicit version of Shimura’s reciprocity law for Siegel modular functions](https://arxiv.org/pdf/1201.0020v4). arXiv:1201.0020v4, 22 April 2024. Relevant locators: §2.5–2.8 pp.5–8, Theorems 2.4–2.5; §4.2 pp.13–14; §4.4–4.5 pp.15–17.

<a id="source-bt"></a>

**BT** — Ashay A. Burungale and Ye Tian, [A rank zero `p`-converse to a theorem of Gross–Zagier, Kolyvagin and Rubin](https://arxiv.org/pdf/2506.03465v2). arXiv:2506.03465v2, October 2025; published in Annals 203 (2026). Relevant locators: Complete 7-page preprint; CM types §2.2.5 p.5 and the proof of Theorem 1.1 in §3.1 p.6.

<a id="source-ks"></a>

**KS** — Guido Kings and Johannes Sprang, [Eisenstein–Kronecker classes, integrality of critical values of Hecke L-functions and `p`-adic interpolation](https://arxiv.org/pdf/1912.03657v4). arXiv:1912.03657v4, 14 September 2024; published in Annals 202 (2025). Relevant locators: §1.1–1.3 pp.6–12; Definition 1.8 and Serre equation (1.2.3) p.9; Definition 1.9 p.10; Proposition 1.11 pp.10–11 and Corollaries 1.12–1.13 p.11; period lattices (1.3.3)–(1.3.4) p.12.

<a id="source-bko"></a>

**BKO** — Ashay A. Burungale, Shinichi Kobayashi and Kazuto Ota, [Rubin’s conjecture on local units in the anticyclotomic tower at inert primes](https://authors.library.caltech.edu/records/8svwt-jn031/files/annals.2021.194.3.8.pdf?download=1). Published Annals 194 (2021), 943–966, Caltech deposited copy. Relevant locators: §3.0.1 pp.950–951; Theorem 3.4 proof p.953 and equation (3.8).

<a id="source-bs"></a>

**BS** — Michael A. Bennett and Samir Siksek, [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf). Published Annals 191 (2020), 355–392. Relevant locators: §6 pp.372–373 (Gaussian CM Cartan normalizer application).

<a id="source-tsimerman"></a>

**Tsimerman** — Jacob Tsimerman, [The André–Oort conjecture for `A_g`](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf). Published Annals 187 (2018), 379–390. Relevant locators: §4 pp.384–385 and §5 pp.385–386; earlier pages are not a source of additional targets here.

<a id="source-aghmp"></a>

**AGHMP** — Fabrizio Andreatta, Eyal ℤ. Goren, Benjamin Howard and Keerthi Madapusi Pera, [Faltings heights of abelian varieties with complex multiplication](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf). Published Annals 187 (2018), 391–531. Relevant locators: §3.4 p.420 (CM types and total-reflex character restriction); §9.1 pp.508–509.

<a id="source-yz"></a>

**YZ** — Xinyi Yuan and Shou-Wu Zhang, [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf). Published Annals 187 (2018), 533–638; §2.2 reflex data. Relevant locators: §2.2 p.546 (trace reflex field, reflex order); height comparisons outside scope.

<a id="source-gz"></a>

**GZ** — Benedict H. Gross and Don B. Zagier, [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf). Published Inventiones 84 (1986), 225–320; GDZ scan. Relevant locators: Chapter III, §4 p.257 and §7 p.261.

<a id="source-deuring"></a>

**Deuring** — Max Deuring, [Die Typen der Multiplikatorenringe elliptischer Funktionenkörper](https://download.uni-mainz.de/mathematik/Algebraische%20Geometrie/Lehre/WS23.Padische.1941.Deuring.pdf). Published Abhandlungen Hamburg 14 (1941), 197–272; Mainz scan. Relevant locators: Introduction pp.197–200; §2.4 pp.212–213 and §2.5–10 pp.213–218 (endomorphism ideals and local counts); §8 conclusion p.258; §9.1 pp.258–262 (lifting).

<a id="source-crt"></a>

**CRT** — Andrew V. Sutherland, [Computing Hilbert class polynomials with the Chinese Remainder Theorem](https://arxiv.org/pdf/0903.2785v4). arXiv:0903.2785v4, 22 November 2013; published Math. Comp. 80 (2011). Relevant locators: Introduction pp.1–2; §4.2–5.2 pp.13–17, Proposition 5 and unconditional class enumeration; §6–7 pp.18–22; Appendix 1 Lemma 8 pp.31–32.

<a id="source-endo"></a>

**Endo** — Gaetan Bisson and Andrew V. Sutherland, [Computing the endomorphism ring of an ordinary elliptic curve over a finite field](https://arxiv.org/pdf/0902.4670v2). arXiv:0902.4670v2, 17 March 2009. Relevant locators: arXiv v2 §2.1 p.3; §2.4 Lemma 3, Corollary 4 and Proposition 5 pp.5–6; §3.1–3.3 pp.6–8.

<a id="source-kato"></a>

**Kato** — Kazuya Kato, [`p`-adic Hodge theory and values of zeta functions of modular forms](https://www.numdam.org/item/AST_2004__295__117_0/). Published Astérisque 295 (2004), 117–290. Relevant locators: §§15.10–15.11 pp.260–262 (CM induction and type conventions).

<a id="source-yang"></a>

**Yang** — Tonghai Yang, [On CM abelian varieties over imaginary quadratic fields](https://people.math.wisc.edu/~tonghaiyang/HKCM.pdf). Author copy of Math. Ann. 329 (2004), 87–117. Relevant locators: Introduction pp.1–3, canonical characters and attachment; §4 pp.16–19, finite-character construction with `|D|>4`, Proposition 4.2 and Corollary 4.3.

<a id="source-mit16"></a>

**MIT16** — Andrew V. Sutherland, [18.783 Elliptic Curves, Lecture 16](https://math.mit.edu/classes/18.783/2023/LectureNotes16.pdf). Fall 2023 lecture notes. Relevant locators: Introduction p.1; Theorem 16.4 p.4 and Corollary 16.5 p.5; §16.4, Definition 16.9 and Theorem 16.12 pp.6–7.

<a id="source-mit20"></a>

**MIT20** — Andrew V. Sutherland, [18.783 Elliptic Curves, Lecture 20](https://math.mit.edu/classes/18.783/2023/LectureNotes20.pdf). Fall 2023 lecture notes. Relevant locators: Complete 8-page lecture; lattice/isogeny comparison pp.1–3; §20.3 pp.5–7, product, ideal action, Lemma 20.9, Theorems 20.11–20.12.

<a id="source-mit21"></a>

**MIT21** — Andrew V. Sutherland, [18.783 Elliptic Curves, Lecture 21](https://math.mit.edu/classes/18.783/2023/LectureNotes21.pdf). Fall 2023 lecture notes. Relevant locators: §21.1 pp.1–3; §21.6 p.10; §21.7 diagram p.11.

<a id="source-mit22"></a>

**MIT22** — Andrew V. Sutherland, [18.783 Elliptic Curves, Lecture 22](https://math.mit.edu/classes/18.783/2023/LectureNotes22.pdf). Fall 2023 lecture notes. Relevant locators: Remark 22.2 pp.1–2; §22.1, Theorems 22.3 and 22.5 and Definition 22.4, pp.2–3 (CM horizontal/ascending/descending isogenies).

[chebotarev-9]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/Chebotarev/README.md#layer-9-abelian-chebotarev
[classfieldtheory-11]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassFieldTheory/README.md#layer-11-the-global-class-formation-and-global-artin-reciprocity
[classfieldtheory-12]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassFieldTheory/README.md#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence
[classfieldtheory-13]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassFieldTheory/README.md#layer-13-norm-theorems-and-class-fields
[ellipticcurves-1]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/EllipticCurves/README.md#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv
[ellipticcurves-2]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/EllipticCurves/README.md#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68
[ellipticcurves-3]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/EllipticCurves/README.md#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1
[ellipticcurves-4]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/EllipticCurves/README.md#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv
[ellipticcurves-5]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/EllipticCurves/README.md#layer-5-twists-aec-x2-x5
[globalnumberfields-10]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/GlobalNumberFields/README.md#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic
[globalnumberfields-11]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/GlobalNumberFields/README.md#layer-11-orders-and-picard-groups
[globalnumberfields-7]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/GlobalNumberFields/README.md#layer-7-congruence-subgroups-and-the-ray-class-dictionary
[globalnumberfields-8]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/GlobalNumberFields/README.md#layer-8-finite-extensions-of-adeles-and-ideles
[globalnumberfields-9]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/GlobalNumberFields/README.md#layer-9-hecke-and-ray-class-characters
[mathlib-classgroup]: https://leanprover-community.github.io/mathlib4_docs/find/?pattern=ClassGroup
[mathlib-classgroup.equivpic]: https://leanprover-community.github.io/mathlib4_docs/find/?pattern=ClassGroup.equivPic
[mathlib-classgroup.mk]: https://leanprover-community.github.io/mathlib4_docs/find/?pattern=ClassGroup.mk
[mathlib-commring.pic]: https://leanprover-community.github.io/mathlib4_docs/find/?pattern=CommRing.Pic
[mathlib-commring.pic.mapalgebra]: https://leanprover-community.github.io/mathlib4_docs/find/?pattern=CommRing.Pic.mapAlgebra
[mathlib-intermediatefield.adjoin]: https://leanprover-community.github.io/mathlib4_docs/find/?pattern=IntermediateField.adjoin
[mathlib-intermediatefield.adjoin_le_iff]: https://leanprover-community.github.io/mathlib4_docs/find/?pattern=IntermediateField.adjoin_le_iff
[mathlib-numberfield.iscmfield]: https://leanprover-community.github.io/mathlib4_docs/find/?pattern=NumberField.IsCMField
[mathlib-numberfield.iscmfield.complexconj]: https://leanprover-community.github.io/mathlib4_docs/find/?pattern=NumberField.IsCMField.complexConj
[mathlib-numberfield.iscmfield.complexconj_apply_apply]: https://leanprover-community.github.io/mathlib4_docs/find/?pattern=NumberField.IsCMField.complexConj_apply_apply
[mathlib-numberfield.iscmfield.complexconj_eq_self_iff]: https://leanprover-community.github.io/mathlib4_docs/find/?pattern=NumberField.IsCMField.complexConj_eq_self_iff
[mathlib-numberfield.iscmfield.complexembedding_complexconj]: https://leanprover-community.github.io/mathlib4_docs/find/?pattern=NumberField.IsCMField.complexEmbedding_complexConj
[mathlib-numberfield.ringofintegers]: https://leanprover-community.github.io/mathlib4_docs/find/?pattern=NumberField.RingOfIntegers
[mathlib-weierstrasscurve.j]: https://leanprover-community.github.io/mathlib4_docs/find/?pattern=WeierstrassCurve.j
[modularforms-0]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularForms/README.md#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus
[modularcurvespartii-polynomial]: ../ModularCurvesPartII/README.md#s5-6
[quadraticforminvariants-2]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/QuadraticFormInvariants/README.md#layer-2-quaternion-algebras-and-the-four-fold-splitting-criterion
