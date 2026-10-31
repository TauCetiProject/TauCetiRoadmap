# Roadmap: modularity of elliptic curves over imaginary quadratic fields

**Summary.** Every elliptic curve over every imaginary quadratic field has an automorphic
realization. This roadmap builds the geometric prime switch that makes the
modularity lifting theorems apply without a restriction on the original curve's
small residual images. A family of cyclic covers connects its quadratic twist
to a second elliptic curve through three integral congruences. Two degenerations
supply, respectively, the required local reduction types and enough monodromy
to choose one specialization satisfying all the residual conditions.

The endpoint is **`imaginary_quadratic_modularity`**: for an imaginary quadratic
number field K and an elliptic curve E/K, there is an isobaric automorphic
representation π_E of GL₂(𝔸_K), of weight zero and trivial central character,
whose realizations are H¹_ét(E_K̄, Q̄_ℓ) for every ℓ and coefficient isomorphism.
Its finite local parameters agree with the full Frobenius-semisimple
Weil–Deligne parameters, including monodromy, at v∤ℓ. The coefficient-prime
local factors also agree. Its complex parameter is
`z ↦ diag(z/|z|, conjugate(z)/|z|)`, and
`L(E/K,s) = L(π_E,s−1/2)` in unitary normalization. The representation is
cuspidal if E is geometrically non-CM. For CM curves it is quadratic automorphic
induction, or an isobaric sum when the CM field is K. These are the conclusions
of [OpenAI, Theorem 1.1, p.1](#references), with the local assertions separated
in §8.5 below.

## Scope and ownership

This roadmap owns the specific covers of quadratic twists of E, their two
semistable degenerations, the integral regular-module calculation, the four
rank-two character systems and their congruences, and the simultaneous
specialization and automorphy propagation arguments. The geometry, integral
congruences and local specialization results are stated over arbitrary number
fields wherever their proofs permit. Imaginary quadraticity enters the final
choice of a CM cyclotomic extension and its descent, not the definition of the
covers.

CrystallineLocalGlobalCompatibilityCM owns CN's integral local–global
comparison, fixed-determinant refinement, non-neat PGL₂ complexes, prepared
patching and qualified lifting theorem. Layer 0 retains the distinct AKT
GL₂/dyadic and general-weight ordinary inputs and the independent elliptic
seed. Its preparation dichotomy supplies the additional cyclotomic branch
used to recover unrestricted lifting in §5.2. Section 0.3 owns the
prescribed-type elliptic construction, including its cohomological and
non-CM outputs; §5.1 owns Serre's theorem that a geometrically non-CM
elliptic curve over a number field has mod-p image containing SL₂(𝔽_p)
for all but finitely many p, as the target
`nonCM_elliptic_large_residual_primes`. AdelicImagesAndModularCurves §4.3
states the stronger surjectivity onto GL₂(𝔽_ℓ) for all but finitely many
ℓ; its own inputs lie beyond this roadmap in the supplier order, so that
statement is downstream of the inclusion owned here and supplies nothing
to §5.1. ModularityAndLanglandsExtensions §§2.18 and 2.29 are downstream
adapters of these outputs, retaining that roadmap's additional
ordinary-prime density and progression arguments.
Jacobians, semistable abelian varieties, vanishing cycles,
Hilbert irreducibility, Galois representations, local Langlands and automorphic
transfer also retain their existing owners. A generic cyclic-cover theorem or
a general potential-modularity theorem is not rebuilt here. The mathematical
work here proves the hypotheses of those interfaces for this family and
transports the resulting realization to the next coefficient prime.

The starting theorem for an auxiliary elliptic curve is the residual criterion
of Caraiani–Newton §6.1, assembled from these suppliers in §5.3; their exceptional modular-curve analysis in §7 is not
used. In particular the auxiliary curve's modularity is proved before the
three new lifts, independently of the desired modularity of E.

The definitions of smooth proper curves, relative Jacobians, continuous
compatible systems and automorphic representations use the supplier carriers
below. Their source-specific constructions are targets on those geometric carriers.
`Suggested.lean` declares `cm_discriminant_descent`, `discriminant_coupling`,
`nonCM_elliptic_large_residual_primes` and `SymplecticTorsionEquiv`. The first
three are headline arithmetic statements; the last defines the actual
Galois-equivariant, pairing-preserving torsion isomorphisms needed for coupling.
The other named targets specify mathematical interfaces in this README.
The module docstring identifies the geometric, cohomological and automorphic
objects absent at the pins that prevent stating the remaining headline results.

## Conventions

- Number fields have fixed algebraic closures; G_L denotes the absolute Galois
  group. E is a smooth proper genus-one curve with its specified origin O.
  In characteristic zero write E as `y²=h(x)` for a separable cubic h. A
  coordinate model does not replace its smooth projective completion.
  Passage between the pointed curve, a Weierstrass equation and its local
  minimal models uses EllipticCurves Layer 4.5a, “invariant theory over a
  Dedekind domain”, together with its Layers 1 and 4. Reduction types are
  read on local minimal models; no global minimal equation over K is assumed.
- H¹ means cohomological étale H¹. The homological Tate module V_ℓ(E) has
  determinant ε_ℓ; its dual H¹ has determinant ε_ℓ⁻¹. Use
  `HT(ε_ℓ)=−1`, so H¹(E) has labelled weights {0,1}. Changing the numerical
  Hodge convention is separate from dualizing a representation.
- Frobenius in the compatible systems and local Langlands is geometric.
  `rec^T(π_v)=rec(π_v⊗|det|_v^(−1/2))`. A good-place H¹ Frobenius polynomial
  is `T²−a_vT+q_v`, whereas its Euler polynomial is `1−a_vT+q_vT²`.
  Frobenius semisimplification of WD retains N; semisimplifying just the Weil
  representation loses information needed at multiplicative places.
- The full covariant Tate-module polynomial in §6.2 instead uses arithmetic
  Frobenius. This is an explicit local device, with its torus, abelian and
  lattice graded pieces. It is not the polynomial on inertia invariants and
  is not obtained by forgetting N in an Euler factor.
- A character θ:μ_n→Q̄_ℓ× acts through the deck action on H¹. Fix an abstract
  coefficient field M=Q(μ_n), an embedding into ℂ and compatible embeddings
  into Q̄_ℓ. A change of prime uses these embeddings, not an independently
  chosen permutation of the character labels. Residual equivalence means
  equality up to isomorphism of semisimplified reductions of stable lattices
  over a common finite coefficient extension. For an elliptic curve A over
  a number field L, the covariant action on A[p] is
  `TateModule.residualRep A p` from ArithmeticGaloisRepresentations
  [§6.1](../ArithmeticGaloisRepresentations/README.md#elliptic-residual-representation),
  written in a basis only when a GL₂ matrix is needed. It has cyclotomic
  determinant. The residual H¹ representation is its dual, with inverse
  cyclotomic determinant; lattice congruences compare semisimplifications.
- Matrices act on columns. In the integral symplectic basis `(a_i,b_i)`,
  `⟨a_i,b_j⟩=δ_ij`. The two Picard–Lefschetz signs are independent
  σ_a,σ_b∈{1,−1}. All existence arguments work for all four choices.
  The scalar operator is `c(u)=2−u−u⁻¹`, with `c(2)=−1/2` and `c(−1)=4`
  over Q.
- Local ordinary, supersingular and multiplicative assertions are potential
  assertions unless an extension giving the stated reduction is specified.
  A supersingular elliptic curve has both normalized Newton slopes 1/2;
  “nonordinary” for an arbitrary higher-dimensional abelian variety does
  not imply that slope condition.

These conventions follow OpenAI §2, p.4, §§4–5, pp.8–14, and §7.2,
pp.16–19. At a split Tate place the covariant arithmetic Frobenius has roots
1,q and H¹ geometric Frobenius has roots 1,q, with nonzero N. At the complex
argument i the unitary diagonal entries are i and −i, determinant one and
trace zero. Explicitly, the arithmetic Frobenius matrices diag(1,4) on a
split Tate module and diag(1,1/4) on its dual have determinants 4 and 1/4;
geometric Frobenius inverts the second matrix. These matrices pin the
duality direction. The complex witness excludes replacing the conjugate
entry by a second copy of z.

## Exact supplier contracts

The named outputs below are consumed with their hypotheses. Roadmap interfaces are mathematical targets of their named owners; library declarations below are available at the stated pins. The quadratic-twist layer and relative Picard interfaces have those same owners.

| Supplier and exact location | Contract consumed; use in this roadmap |
|---|---|
| `EllipticCurves`, Layers 1–4, Layer 4.5a “invariant theory over a Dedekind domain” and Layer 5 “twists” | `quadraticTwistOf`, `quadraticTwist`, `quadraticTwistPointEquiv` and Galois compatibility; torsion, Weil pairing, Tate duality, local reduction and the integral-j criterion for potential good reduction. Use the curve/equation and local-minimal-model comparisons for the reduction conditions in §0.3, the existing twist in §1.1 and its quadratic character in §8.4. The main CM theorem is not supplied by its CM-action vocabulary. |
| `JacobianChallenge`, Layers A–D and F | Divisors, Abel's criterion, Riemann–Roch, Pic⁰ and pullback/norm. Pic⁰ exists for a smooth proper geometrically connected curve without a rational point; its identification with the curve requires a point. Used in §§1.2, 4.2. |
| `AbelianSchemesAndArithmeticModuli`, A0.3, A3 and A6 | `abelianPicardInputs`, finite-flat torsion and pairings, rational endomorphisms, isogeny factors and realization functoriality. The relative Jacobian and the action of deck correspondences remain actual schemes and maps. |
| `NeronModelsAndSemistableAbelianVarieties`, §§3.5, 3.10, 3.14; §§4.1–4.4, 4.13; §§5.3, 5.6; §6.10 `StrictCompatibleSystemExport` | Raynaud uniformization and valuation pairing; Pic⁰ of a nodal curve and its graph lattice; compact-type Jacobians; potentially semistable comparison including the residue prime; compatible H¹. The local constancy deduction and the characterwise rank argument in Layer 6 are owned here. |
| `LefschetzPencilsAndVanishingCycles`, LPV.2 §2.8 and LPV.7a nodal-curve monodromy | Picard–Lefschetz and the local smoothing-order-one transvection. Layer 3 supplies this family's actual cycles, integral marking and common transport, rather than assuming its monodromy is that of a Lefschetz pencil. |
| `SmallRamificationAndAbelianVarietyBaseCases` §5.0d | Shared `AutomorphicSystemData` for an arbitrary number field and rank, with coefficient field, good polynomials, finite realization fields and labelled Hodge data. Its operations are separate from compatibility predicates. Populate this carrier in §4.1; do not create a competing rank-two carrier. |
| `PotentialModularityAndCompatibleSystems`, Layer 1 (§§1.1–1.4), together with `AutomorphicGaloisRepresentations` §7.1 | Compatibility predicates, coefficient extension, finite restriction, residual semisimplification and common-polynomial recognition, adapted to the single shared raw carrier above. Potential modularity Layer 5 is a transitive input to the residual-modularity supplier, not a hypothesis on E. |
| `ArithmeticGaloisRepresentations`, Layers 1–2, §§4.2–4.7, Layers 5–6 | Full WD carrier and conventions; restriction and persistence of an assumed large image, commutators, Goursat, Chebotarev and Brauer–Nesbitt recognition; dual Tate modules and determinant; [§6.1 `TateModule.residualRep`](../ArithmeticGaloisRepresentations/README.md#elliptic-residual-representation) supplies the basis-free action on elliptic p-torsion over each number field, with scalar extension and change of basis. Section 5.1 owns Serre's non-CM elliptic large-prime existence theorem and consumes §§4.4–4.5 and the tame and fundamental inertia characters of §2.3 for its proof; Layer 7 owns the simultaneous all-character specialization. |
| `FaltingsFinitenessAndIsogenyTheorems`, R28.4, §§R28.6.2–R28.6.3 and R28.6.5–R28.6.6 | Semisimplicity of the rational Tate representation of an abelian variety, preserved on deck-character summands; for §5.1, the elliptic semisimplicity and Tate Hom comparison, the finiteness of the isogeny class of an elliptic curve over a number field and the infinite cyclic group of homomorphisms to an isogenous curve without extra endomorphisms. |
| `AutomorphicGaloisRepresentations` §3.13 (geometric characters and algebraic Hecke characters), and `AutomorphicGaloisRepresentationsPartII` AG2.0, `AlgHeckeChar.galoisChar` | A continuous rank-one character over a finite extension of Q_ℓ, finitely ramified and de Rham above ℓ, is an algebraic Hecke-character avatar; conversely such avatars have the prescribed labelled Hodge degrees and local class-field parameters. Together with CM endomorphism eigenspaces and common Frobenius polynomials, this supplies the CM comparison in §8.6. No higher-rank Fontaine–Mazur assertion is consumed. |
| `CrystallineLocalGlobalCompatibilityCM` §§7.5–7.6, 8.7 and 9.1–9.12 | CN's general-rank integral deformation factorization and fixed-determinant refinement; non-neat PGL₂ perfectness and derived augmentation; prepared deformation–Hecke maps with uniform nilpotence, paired support and prepared lifting. The §9.12 export retains `[F(ζ_p):F] ≠ 3` or projective image different from A₄. Section 0.1 supplies the additional preparation branch, and §5.2 consumes that qualified export without copying its arithmetic construction. |
| LocalGaloisDeformationRings Layers 1–6 and 8; GlobalGaloisDeformations R04.3–R04.6; DeformationAndDerivedPatchingAlgebra §§8.2–8.5 and 9.4–9.7 | Local crystalline/ordinary components, global deformation rings, finite-complex patching, paired residual data and spectral support transport. Layer 0 constructs the distinct AKT ordinary and dyadic arithmetic inputs on these interfaces. |
| ArithmeticLocallySymmetricSpaces ALS.1.2–ALS.1.7, ALS.4.9 and ALS.5a.6; ModularCurves §0E and §5C; ModularCurvesPartII §§5.13–5.14 | Equivariant Hecke complexes and compactified full-level twists for rational representations and their base changes. Layer 0 supplies GL₂ non-neat non-Eisenstein perfectness, arbitrary-number-field paired twists, rationality and the independent AKT seed. |
| PadicHodgeTheory §3.6 and §§8.1–8.2, 9.1–9.4; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.19, R07.4.19, R07.5 and R07.6.1 | Labelled ordinary flags, proper-smooth/semistable comparisons, Tate's Hodge–Tate decomposition of the Tate module of a p-divisible group and the Kummer crystalline criterion. The independent CM ordinary/dihedral lifting proofs are §0.1; §8.1 proves the automorphic ordinary calculation for all quadratic Steinberg twists. |
| `AutomorphicGaloisRepresentationsPartII`, AG2.4–AG2.7 | Attached semisimple Galois representations, common good-place polynomials and Varma's underlying semisimplified Weil comparison at v∤ℓ. Full ramified nonselfdual N equality is not an input for an arbitrary intermediate π. Layer 8 derives precisely what it needs. |
| `InverseGaloisAndArithmeticFundamentalGroups`, IG.0 arithmetic fundamental groups and IG.2 “Hilbert specialization with local conditions” | Hilbert subsets are dense in finite products of local opens on affine space. Apply also to connected finite covers with a constant field. Layer 7 identifies the finite quotient and its constant-field kernel. No Hilbert theorem for an arbitrary variety is assumed. |
| `GL2AutomorphicRepresentationsAndTransfer`, R16.3–R16.6, R17.4 | prime-cyclic all-place base change (§R17.4.3), descent (§R17.4.4), cyclic-descent fibers, soluble towers and `quadraticInduction` with local compatibility, central character and twists; strong multiplicity one. Used in §§8.4–8.6. |
| SchemeAndStackFoundations §§0.19, 3.2, 4.13 and 4.18; AlgebraicCurves Layer 7 | Finite normalization, scheme and function-field Riemann–Hurwitz, regular models and nodal families. The two specific blow-up/normalization calculations remain §2.1 targets. |
| ComplexComparisonPartII §§C5 and C6.6, `adicArtinComparison` | Relative Hodge types and integral/rational singular–étale comparison for proper smooth curves, natural for deck maps and cup products. Use this integral comparison in §3.1, including at ℓ dividing the deck degree. |
| ShimuraVarieties §5.6, `TauCeti.Shimura.cm_potential_good_reduction` | A full-CM abelian variety has potentially good reduction everywhere once its CM endomorphisms are defined. A retained Tate place in §0.3 therefore excludes geometric CM. |
| GlobalNumberFields Layer 1; ClassFieldTheory Layer 11 | Weak approximation, completions and the local/global character reciprocity dictionary. Compose arithmetic reciprocity with inversion for the geometric convention used here. |

The seed and lifting statements in §§0.3 and 5.2–5.3 are over CM fields
and use no modularity theorem over ℚ: the AKT seed is proved by the CM
dihedral and ordinary lifting theorems of §0.1, and the CN residual
criterion by §0.3 and §5.2.

The shared carrier’s good polynomials
do not force descent of a λ-adic representation to M_λ: the specified finite
realization extension is retained. No comparison is asserted by raw data alone.

The prerequisites include AbelianSchemesAndArithmeticModuli,
FiniteFlatGroupsAndIntegralPadicHodgeTheory,
SmallRamificationAndAbelianVarietyBaseCases and PadicHodgeTheory,
with the contracts above, as well as
CrystallineLocalGlobalCompatibilityCM. These suppliers precede this
roadmap in the supplier order. Its typed elliptic and general large-prime
exports are inputs to the downstream modularity extensions.

The arithmetic statements in `Suggested.lean` use Mathlib's CM fields,
splitting fields, algebraic closures, finite torsion groups, bases and special
linear groups, together with Tau Ceti's elliptic endomorphisms, finite-torsion
Galois action and Weil pairing. The pins are Mathlib
`6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Matrix transvections, circulants,
root-of-unity groups and generic character orthogonality already belong to
the libraries; §§3.3 and 7.1 specify the family's combination `2−u−u⁻¹`
and its word. Tau Ceti supplies the elliptic Tate Galois representation
`WeierstrassCurve.tateModuleGaloisRepresentation`; it is consumed through
ArithmeticGaloisRepresentations, not redeclared with a new carrier.

### Pinned library declarations

| Mathlib declaration | Module and contract |
|---|---|
| `Finsupp.single`, `Finsupp.sum` | `Mathlib.Data.Finsupp.Single` and `Mathlib.Data.Finsupp.Defs`: finite point divisors and their finite-support sums. Degree and Abel sum of the particular cover divisor are §1.2. |
| `RatFunc.mk`, `RatFunc.eval` | `Mathlib.FieldTheory.RatFunc.Defs` and `Mathlib.FieldTheory.RatFunc.AsPolynomial`: polynomial fractions and evaluation after reduction. A zero denominator is totalized; §2.2’s displayed evaluation theorem retains its nonvanishing guards. |
| `Matrix.circulant`, `Matrix.circulant_apply`, `Matrix.transpose_circulant`, `Matrix.circulant_isSymm_iff` | `Mathlib.LinearAlgebra.Matrix.Circulant`: entry `v(i−j)`, transpose and symmetry. These supply the generic operator API; §3.3 specializes to `2−u−u⁻¹`. |
| `Matrix.mulVec`, `Matrix.det`, `Matrix.trace` | `Mathlib.Data.Matrix.Mul`, `Mathlib.LinearAlgebra.Matrix.Determinant.Basic`, `Mathlib.LinearAlgebra.Matrix.Trace`: column action, determinant and trace. The family’s word and independent signs are §7.1. |
| `Polynomial.C`, `Polynomial.X`, `ZMod`, `orderOf`, `Complex.norm_mul`, `star` | Polynomial scalars/variable, cyclic indices, element order and complex norm/conjugation, used in the explicit formulas of §§1.2, 2.2, 3.3, 7.1 and 8.5. |
| `AlgebraicGeometry.Scheme.Hom.normalization`, `AlgebraicGeometry.Scheme.Hom.normalizationPullback` | `Mathlib.AlgebraicGeometry.Normalization`: relative normalization and its smooth-base-change isomorphism; the input for the actual curve constructions, without asserting their smoothness in advance. |
| `groupCohomology.H1ofAutOnUnitsUnique` | `Mathlib.RepresentationTheory.Homological.GroupCohomology.Hilbert90`: multiplicative Hilbert 90 for a finite Galois field extension; §0.2 separately proves that its paired projective cocycle has the required lift. |

| Tau Ceti declaration | Meaning and module |
|---|---|
| `WeierstrassCurve.tateModuleGaloisRepresentation` | Integral Tate representation; `TauCeti.AlgebraicGeometry.EllipticCurve.TateModule.Galois`. |
| `TauCeti.det_tateModuleGaloisRepresentation` | Its determinant equals the cyclotomic character, for a separably closed extension and ℓ invertible in that field; `TauCeti.AlgebraicGeometry.EllipticCurve.TateModule.Determinant`. Rationalization and duality transport this supplied identity. |
| `TauCeti.AlgebraicGeometry.SchemeWeilDivisor.classGroupAddEquivLineBundleClass` | Weil divisor classes and line-bundle classes under the curve/DVR hypotheses stated below; `TauCeti.AlgebraicGeometry.WeilDivisor.Scheme.Picard`. |
| `TauCeti.AlgebraicGeometry.SchemeWeilDivisor.classGroupPicZeroAddEquivPicZero` | Degree-zero restriction under properness and the finite-dimensional H¹ hypothesis; `TauCeti.AlgebraicGeometry.WeilDivisor.Scheme.PicZero`. |
| `TauCeti.AlgebraicGeometry.rigidifiedPicardFunctor` | Picard functor rigidified along a section; `TauCeti.AlgebraicGeometry.PicardFunctor.Rigidified`. |

The twist formulas and their point/Galois comparison are
`WeierstrassCurve.quadraticTwistOf`, `WeierstrassCurve.quadraticTwist`,
`WeierstrassCurve.quadraticTwistPointEquiv` and
`WeierstrassCurve.quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map`
in `TauCeti.AlgebraicGeometry.EllipticCurve.QuadraticTwist.Basic`.
They supply the actual twist rather than a second construction here.
The scheme Picard equivalences above use a Noetherian integral curve with DVR
codimension-one local rings; the degree-zero comparison also requires
properness and finite-dimensional H¹ of the trivial invertible sheaf.
Rigidification requires a section. These class-group equivalences do not
assert that every rational point of an unpointed Jacobian descends to a
rational divisor. JacobianChallenge Layer D supplies the relative Picard
scheme of a curve without a rational point used in §4.2.

## How to read the build

| Layer | Output used next |
|---|---|
| 0 | Supplied CN arithmetic inputs, AKT ordinary/dyadic additions, cyclotomic preparation, paired twists, the independent elliptic seed and prescribed-type outputs. |
| 1 | Normalized cyclic covers of the twist, with compatible quotient maps and reflection. |
| 2 | Compact-type fiber E^m and the second nodal fiber with m smoothing-order-one nodes. |
| 3 | Integral regular-module marking and two opposite monodromies in a common basis. |
| 4 | Rank-two character systems, elliptic endpoints and integral congruence chain. |
| 5 | Full CN lifting, the independent residual criterion and the auxiliary-prime choice. |
| 6 | Nonempty local parameter opens preserving the required three potential reduction types. |
| 7 | One Hilbert specialization giving every residual and local condition simultaneously. |
| 8 | Initial seed, three lifts, descent, all-place comparison and the CM alternatives. |

Each named target below has its hypotheses, proof route and prerequisites in
its subsection. “API” names the usable outputs of a definition or construction;
“Checks” distinguishes it from plausible incorrect versions. Page numbers are
printed pages of the fixed sources in References. Layer 3 is integral even at
coefficient primes dividing the cover degree. That integrality is the reason
the route can change primes at Layer 4.

## Layer 0: Independent lifting and arithmetic bridges

### 0.1 Supplied CN arithmetic and independent AKT lifting inputs

CrystallineLocalGlobalCompatibilityCM §7.5 (local–global compatibility
at p via deformation rings) and §7.6 (fixed-determinant refinement)
supply the integral deformation factorization and its fixed-determinant
refinement in general rank n, with
its finite conjugation-stable ramification set T, parabolic alternatives,
non-Eisenstein decomposed-generic localization, invertible positive central
Hecke operators and local degree inequality. Use its integral derived Hecke
image, coefficient reductions and one nilpotence exponent depending only
on n and [F⁺:ℚ], uniformly in weight, level and coefficient length. The
fixed-determinant refinement requires p∤n and a crystalline determinant
with the specified labelled Hodge weights. For the weight-zero GL₂
application this is εp⁻¹ of labelled weight 1 at odd p. These are supplied
arithmetic theorems, rather than consequences of generic patching algebra.
(CN, Theorem 4.2.15 and Corollary 4.2.16, pp.71–72.)

CrystallineLocalGlobalCompatibilityCM §§8.7, 9.4 and 9.6 supplies the
non-neat PGL₂ perfect complexes and Hecke-equivariant derived
Taylor–Wiles augmentation; retain odd p, ζp∈F, an absolutely irreducible
residual localization and a coefficient system trivial modulo ϖ.
Its §9.1 supplies the prepared CN datum and its §9.10 the automorphy
lifting theorem in the prepared special case. Use all fifteen preparation
hypotheses of its §9.1: in particular the imaginary-quadratic splitting
conditions, the local degree distribution, residual triviality at p and R,
the crystalline/ordinary partition, and either ζp∈F with S=Sp∪R or the
two auxiliary smooth places. Its deformation–Hecke maps, compatible
coefficient diagrams and paired residual complexes have a single uniform
nilpotence exponent at every Taylor–Wiles level. Their augmentation is a
derived isomorphism; their support bridge relates the two residual generics
to a common auxiliary component, without asserting uniqueness of that
component. (CN, Propositions 5.6.1–5.6.3 and Lemma 5.6.4, pp.82–85.)

**Checks on the supplied inputs.**

- A coefficient-torsion annihilator is insufficient: in ℤ/9ℤ the unit
  ideal J has `(3J)²=0` but `J²≠0`, even with a unit auxiliary Hecke factor.
- The ideals (t) in k[t]/(t^N) have increasing nilpotence exponents;
  the inverse-limit ideal in k[[t]] is not nilpotent. The supplied exponent
  is independent of coefficient length and Taylor–Wiles level.
- At Q empty the derived augmentation recovers the original complex and
  its Hecke action. Agreement only on top cohomology cannot replace it.
- A support bridge through one auxiliary component gives no transfer
  between residual generics on different auxiliary components.

Write O for the ring of integers of a sufficiently large finite extension
of ℚp, with uniformizer ϖ and residue field k. Derived Hecke algebras below
are the commutative images of the specified Hecke operators in derived
endomorphisms, with their coefficient and level maps. The GL₂ perfectness
and AKT ordinary arithmetic constructions below are additional targets here.

**`cm_nonneat_perfect_augmentation`** — For a CM number field F, let G be
GL₂ and U a product compact level, hyperspecial outside a finite S
containing Sp. Let A(U,M) and C(U,M∨) be equivariant cohomology and homology,
not the cohomology of the coarse quotient. Take R=O or O/ϖʳ and an R-finite
free smooth coefficient system M with `M⊗_R k≅k` as a level representation.
Suppose m is a non-Eisenstein Hecke maximal ideal with residue field k and
absolutely irreducible residual representation. Require ζp∈F and that
`U∩Z_G(F)` contains no nontrivial p-torsion. Then `H^i(A(U,M)_m)=0` outside `[0,dim_ℝ X_G]`, and this
localized complex is R-perfect. For V normal in U with abelian p-power
quotient Δ, construct the residual-matching localization n and an
R[Δ]-perfect homology complex with its Hecke-equivariant derived augmentation
`C(U/V,M∨)_n ⊗ᴸ_{R[Δ]} R ≅ C(U,M∨)_m`.
Retain coefficient reduction, trace and localization compatibilities, and the
corresponding dual perfect complexes. The PGL₂ version is consumed from
CrystallineLocalGlobalCompatibilityCM §§8.7 and 9.6. (AKT, Theorem 5.11,
pp.46–47.)

*Needs:* ArithmeticLocallySymmetricSpaces ALS.1.2–ALS.1.7 and ALS.4.9;
ArithmeticGaloisRepresentations Layers 1–4;
AutomorphicGaloisRepresentationsPartII AG2.5–AG2.7;
DeformationAndDerivedPatchingAlgebra Layer 7 for perfect-complex algebra.

**Checks.**

- A point with stabilizer C_p over 𝔽p has unbounded equivariant cohomology;
  localization at an arbitrary Hecke ideal cannot replace the
  non-Eisenstein hypothesis.
- At neat level the usual free-cell perfect model agrees with this
  localized complex; at non-neat level with p-torsion stabilizers there is
  no averaging by the quotient order.
- AKT's GL₂ level U(c₀,c) removes central 2-torsion and permits the
  dyadic application; replacing it by U(1,c) without that restriction
  loses a hypothesis. The supplied odd-p PGL₂ theorem does not cover p=2.

**`cm_lifting_preparation_dichotomy`** — Let K be CM, p odd and
r:G_K→GL₂(Q̄_p) a continuous finitely ramified lift with determinant εp⁻¹, decomposed
generic residual representation ρ̄ absolutely irreducible on G_K(ζp),
and a residual-matching regular algebraic cuspidal π of PGL₂(𝔸_K). Assume either the
general-weight ordinary hypotheses of `cm_ordinary_lifting` or the
weight-zero local alternatives of `potentiallySemistableCM`, including
their p=5 projective-field condition. Construct a finite Galois soluble
CM extension F/K satisfying the prepared CN or AKT ordinary hypotheses,
and descent, with the following alternatives. (CN, end of the proof of
Theorem 5.2, pp.85–87; AKT, proof of Theorem A.14, pp.94–95;
DDT, Lemma 4.11, p.119.)

If ζp∈K, use the prepared branch without the two auxiliary smooth places.
Otherwise set G=im ρ̄. If some g∈G has det(g)≠1 and
`tr(g)² ≠ (1+det(g))²`, preserve G and its determinant character during
residual-disjoint preparation. Chebotarev then supplies two auxiliary
degree-one places of distinct residue characteristics, outside R∪Rᶜ,
with `q_v ≠ 1 mod p` and `H²(F_v,ad⁰ρ̄)=0`, as in the cited proofs.

If every g with det(g)≠1 satisfies that trace identity, every
rational decomposed-generic witness q satisfies `q ≡ 1 mod p`. Indeed,
for eigenvalues α,β with αβ=det(g), the identity forces
`α/β ∈ {det(g),det(g)⁻¹}`. This algebraic implication
holds over any field; applying it at any place over q contradicts genericity
when q≠1 mod p. Thus q splits
completely in K_c=K(ζp), since it already splits in K. Make this preliminary
cyclotomic base change, then perform residual-disjoint preparation over
K_c. The all-places witness survives, and
`ρ̄(G_K_c)=ρ̄(G_K(ζp))` is exactly the original absolutely irreducible
cyclotomic image. Subsequent preparation preserves that image. Since the
prepared field contains ζp, its prepared lifting theorem requires neither
of the two auxiliary smooth places. No reducibility assertion for the
determinant kernel is used in this branch. The §9.2 criterion
`CrystallineCM.determinant_kernel_reducible_except_tetrahedral` of
CrystallineLocalGlobalCompatibilityCM gives that reducibility outside
the cubic/A₄ case; this dichotomy refines it by covering the excluded
case through the cyclotomic branch instead.

In both branches compare the attached representation of each automorphic
base change with the restriction of the specified seed. Residual
irreducibility preserves cuspidality throughout the soluble tower.
Transport each local crystalline/noncrystalline and potential-ordinary
alternative and automorphic ordinarity. For AKT retain the ordinary flags,
pull back each labelled weight by restriction of embeddings, and reach
the prepared compatibility
`∏_τ τ(u)^(λ_τ−μ_τ)=1` for every local p-power root of unity u.
Use AKT's weight-control preparation for this condition after the
cyclotomic step; its set V preserves the new cyclotomic residual image
and every place over q. After prepared lifting, soluble descent with the
cyclic-descent character correction recovers r itself and, in the ordinary
case, its original weight and ordinarity. This supplies both full lifting
exports without changing their hypotheses.

*Needs:* CrystallineLocalGlobalCompatibilityCM §§9.1–9.3 and 9.10–9.12;
PotentialModularityAndCompatibleSystems §§2.12–2.16;
PotentialAutomorphyInfrastructure §§2.3 and 2.5;
ArithmeticGaloisRepresentations §§4.2–4.7;
GL2AutomorphicRepresentationsAndTransfer R17.4;
PadicHodgeTheory §3.6.

**Checks.**

- Over 𝔽₇ take `I=[[0,1],[6,0]]`, `J=[[2,3],[3,5]]` and
  `H=[[4,2],[0,1]]`. Their group has order 24 and determinant image
  {1,2,4}; its determinant kernel is ⟨I,J⟩≅Q₈. The traces at determinant
  2 are ±3 and at determinant 4 are ±2, so the trace identity holds
  outside the kernel. Yet `I²=J²=−Id` and `IJ=−JI` exclude an invariant
  line even over 𝔽̄₇: the two invertible scalar restrictions would
  anticommute in odd characteristic. This is the cubic/A₄ boundary and
  uses the cyclotomic branch.
- A split witness q≠1 mod p would have forbidden eigenvalue ratio q or
  q⁻¹ under the trace identity. Merely preserving one place over q would
  not preserve decomposed genericity; all its places are retained.
- If ζp∈K already, the cyclotomic step is the identity. In particular the
  three lifts over K(μ₃p) at p,3,p need no auxiliary trace-violating element.
- Nonzero dominant ordinary weights remain in scope: their pulled-back
  flags and the p-power-root compatibility are retained, not replaced by
  a weight-zero calculation.

**`cm_ordinary_integral_patch_data`** — Construct the corresponding ordinary
integral arithmetic inputs for both AKT lifting proofs, retaining the general
weights of `cm_ordinary_lifting`. In the odd-p branch use exactly the prepared
data of AKT §A.3, pp.87–88: local degrees [F_v:ℚp]>4 at p, the
imaginary-quadratic splitting condition for primes ramifying in F or below S,
residual cyclotomic absolute irreducibility and decomposed genericity, the
p=5 exclusion, residual triviality at R, ζp∈F when S=Sp∪R, and otherwise
two auxiliary places of distinct residue characteristics, outside Rᶜ with
vanishing adjoint H². The residual-matching π is ordinary of weight μ,
with pro-p Iwahori invariants at p, Iwahori invariants at R and unramified
outside S. For a lift of weight λ≥0 keep determinant εp⁻¹ and local shape
`(ψ_v,*;0,εp⁻¹ψ_v⁻¹)`, where on inertia
`ψ_v(σ)=∏_τ τ(Art_v⁻¹(σ))^{λ_τ}`. For every p-power root u∈F_v require
`∏_τ τ(u)^{λ_τ−μ_τ}=1`, as in AKT Theorem A.7.
Use its weight-control comparisons and non-Eisenstein perfectness to construct
the ordinary complexes over the chosen regular weight component Λ and their
Taylor–Wiles augmentations. Construct the deformation-to-derived-Hecke
surjections with one exponent δ(F) at every level and weight, with the
fixed determinant and diamond actions, as in Propositions A.11 and A.13.
Supply the paired datum of §8.2 over Λ for χ=1 and χ_v²≠1, including
weight specialization and all residual action diagrams. (AKT, Lemmas A.8,
A.10 and A.12 and Propositions A.9, A.11 and A.13, pp.89–92; paired patch,
pp.92–93.)

For the dyadic branch use AKT §6.1's prepared GL₂ data: an absolutely
irreducible soluble ρ̄ over a finite characteristic-two k, decomposed generic,
unramified outside 2,
with local shape `(1,α_v;0,1)` at every v|2, where α_v is the Kummer
character of an element of odd valuation, as in §4.2.1; a v₀|2
preserving all 2-power roots of unity; conjugation-stable R with ρ̄ trivial
there and `[F⁺:ℚ]>8|R|+10`; and a residual-matching ordinary weight-zero π,
Iwahori at 2, unramified outside S₂∪R, with the distinct inverse 2-power
inertia characters prescribed in §6.1 at R. Require the same splitting in
imaginary quadratic subfields for every prime below S₂∪R or ramifying in F.
Use the actual U(c₀,c) levels without central 2-torsion and distinguish
`Λ₀↪Λ₁↠Λ`: perfectness is over regular Λ₀, and the Hecke weight action
factors through Λ. Construct the ordinary minimal complexes, their coefficient
and Taylor–Wiles augmentation maps, and the ordinary deformation-to-Hecke
maps modulo ideals with one exponent δ(F). Retain the variable determinant
of this GL₂ branch and its local ordinary characters; the odd-p
fixed-determinant refinement is not applicable at p=2. Supply the paired
finite datum over Λ₀ with the Λ₁ action and its factorization on the Hecke
image, as in AKT §6.2. (AKT, Lemma 6.2, Theorem 6.3, Corollary 6.4,
Theorem 6.8, Corollary 6.9 and §6.2, pp.53–66.)

For each branch verify its local dimension/component bounds and nonzero
characteristic-zero cuspidal seed before applying patching and spectral
support transport. The dyadic soluble CM preparation and descent are those
of AKT §7. The odd-p preparation uses `cm_lifting_preparation_dichotomy`,
retaining labelled weights and root-of-unity compatibility. These
AKT constructions use no geometric switching or imaginary-quadratic
modularity endpoint.

*Needs:* `cm_nonneat_perfect_augmentation`;
CrystallineLocalGlobalCompatibilityCM §§7.5–7.6, 8.7 and 9.6;
GlobalGaloisDeformations R04.3–R04.6;
LocalGaloisDeformationRings Layers 1–6 and 8;
DeformationAndDerivedPatchingAlgebra §§8.2–8.5 and 9.4–9.7;
AutomorphicGaloisRepresentationsPartII AG2.5–AG2.7;
GL2AutomorphicRepresentationsAndTransfer R17.4.

**Checks.**

- For odd p, λ=0 specializes the ordinary family to weight zero; the
  construction also retains nonzero dominant λ and its inertial characters.
- At p=2, perfectness over Λ₀ does not assert perfectness over Λ₁ or Λ;
  imposing a fixed determinant by the p∤n refinement would be unjustified.
- Augmenting the Taylor–Wiles variables recovers the same ordinary complex
  with its weight action, not merely a characteristic-zero eigensystem.

**`cm_dihedral_lifting`** — For AKT Theorem 7.1 (§7, p.67), let K be CM and
ρ:GK→GL₂(ℚ̄₂) continuous. Its residual representation is decomposed generic,
dihedral with quadratic inducing field M/K, and extends to
GK⁺→GL₂(𝔽₂). Require ρ unramified away from finitely many places. At every
v|2, its ordinary weight-zero shape is upper triangular with diagonal
αv, ε₂⁻¹βv for unramified αv,βv, and its Weil–Deligne representation is
unipotently ramified. The field M is ramified at each such v; write
Mv=Kv(√u) with ordv(u) odd. Also Kv(√−1)/Kv is unramified.
The output is a cuspidal, weight-zero, ι-ordinary GL₂ representation with
attached representation isomorphic to ρ, for an isomorphism ι:ℚ̄₂≅ℂ.
The dyadic residual image here is dihedral; a theorem assuming a nonsolvable
residual image does not provide this interface.

*Needs:* `cm_ordinary_integral_patch_data`; GL2AutomorphicRepresentationsAndTransfer R17.4.

**Checks.**

- A local inducing class of odd valuation gives the ramified dyadic condition;
  an unramified inducing extension does not satisfy this target.
- The prepared GL₂ complex uses central-2-torsion-free levels even though
  p=2; the odd-p PGL₂ perfectness theorem is not its substitute.
- Residual dihedral induction supplies the automorphic seed before the
  independent integral patch and either elliptic switching conclusion.

**`cm_ordinary_lifting`** — For AKT Theorem 8.1 (§8, pp.71–72; restated as Theorem A.14, §A.4, p.94),
take odd p, CM K and continuous ρ:GK→GL₂(ℚ̄p), unramified away from a finite
set, with det ρ=εp⁻¹. Require its residual representation to be decomposed
generic and absolutely irreducible on GK(ζp). Require ordinarity of weight
λ∈(ℤ²₊,₀)^Hom(K,ℚ̄p). There is an isomorphism ι:ℚ̄p≅ℂ and an
ι-ordinary cohomological cuspidal representation π of PGL₂(𝔸K) whose residual
attached representation is isomorphic to that of ρ. If p=5 and the projective
residual image on GK(ζ5) is PSL₂(𝔽5), the field cut out by the full projective
residual representation must exclude ζ5. The conclusion is a cuspidal
PGL₂ representation Π of weight ιλ, ι-ordinary, with rΠ,ι≅ρ.
Section 0.3 uses its weight-zero specialization together with the dyadic theorem;
both general lifting theorems are targets here, independent of the switching endpoints.
The odd-p proof uses `cm_lifting_preparation_dichotomy` before applying the
prepared ordinary theorem, with its general labelled weights and root-of-unity
condition. The cubic/A₄ trace-identity branch passes first to K(ζp).

*Needs:* `cm_ordinary_integral_patch_data`; `cm_lifting_preparation_dichotomy`;
GL2AutomorphicRepresentationsAndTransfer R17.4.

**Checks.**

- At λ=0 the conclusion has weight zero; nonzero dominant λ retains the
  corresponding ordinary inertia characters and is also in scope.
- At p=5 the PSL₂(𝔽5) case retains the full projective-field exclusion;
  cyclotomic absolute irreducibility alone is insufficient.
- At p=2 this statement is inapplicable; the separate dyadic GL₂ theorem
  supplies that seed.

### 0.2 Discriminants and coupling

**`cm_discriminant_descent`** — For a CM field K, `n ≥ 1` and `a ∈ Kˣ`,
let L be the splitting field of `T^n − a/aᶜ`. Then L/K is soluble CM and
there is `z ∈ L⁺ˣ` with `a/z ∈ (Lˣ)^n`. The nonzero hypothesis permits
`a/aᶜ` and the multiplicative power class. Specialize to n=6 for the
Weierstrass discriminant. AKT state the corollary for n ≥ 2; at n=1 the
polynomial is linear, L=K, and `z=a·aᶜ` with `a/z=(1/aᶜ)^1` proves it
directly. (AKT, Corollary 9.4, p.74.)
`Suggested.lean` states `cm_discriminant_descent` on Mathlib's CM-field
and splitting-field types.

**Checks.**

- At n=0 the polynomial is the constant `1−a/aᶜ`, so L=K, and the
  conclusion would make `a=z` totally real: false for `a=i` in ℚ(i).
  The hypothesis `n ≥ 1` is sharp.
- For `K=ℚ(i)`, `a=i` and n=2: `a/aᶜ=−1`, the roots `±i` lie in K, so
  L=K; with `w=1+i` one has `w/w̄=i=a`, so `z=a/w²=1/2 ∈ ℚ` and `b=w`
  give `a/z=2i=b²`. Taking `z=a` itself would not be totally real.
- For `a=1+i` and n=2 the quotient `a/aᶜ=i` has splitting field
  `L=ℚ(ζ₈)`, CM and abelian over K. The root `β=ζ₈` has `β·β̄=1`, so
  Hilbert 90 writes `β=γ/γ̄` with `γ=1+ζ₈`, and `z=a/γ²=√2−1` lies in
  `L⁺=ℚ(√2)`. The root β itself is not the n-th root b of the conclusion.

**`fixed_pairing_twist`** — For every number field F, p∈{3,5}, continuous
ρ̄:GF→GL₂(𝔽p) with cyclotomic determinant, and specified equivariant
pairing ∧²ρ̄≅μp, construct the fine fixed-pairing twist Yρ̄/F and its
smooth proper completion Xρ̄/F by carrying out ModularCurves §5C's descent
over F. Prove the extension-field point dictionary of the adopted interface,
naturality of field base change with identity and composition laws, and
geometric genus zero. Identify these objects with ModularCurvesPartII §5.14
when ρ̄ is the restriction of a representation over ℚ. Normalize the j-line
in Yρ̄ to form the completion; finite separable frame extensions are smooth,
so normalization commutes with this base change. (AKT §9, paragraph preceding
Lemma 9.7 and its proof, p.75; Stacks Tag 03GV.)

*Needs:* ModularCurves §5C and ModularCurvesPartII §5.14, EllipticCurves Layer 2; Mathlib
`AlgebraicGeometry.Scheme.Hom.normalizationPullback` and its smooth-base-change
isomorphism; ModularCurves §0E and ModularCurvesPartII §5.13.

**Checks.**

- A symplectic frame over a splitting extension identifies this construction
  with the fixed-pairing full-level curve, rather than the disconnected
  unpaired full-level curve.
- For ρ̄=E[p], the pair (E,id) is an F-point and base change transports it
  to (E_K,id) over each extension K/F.
- A representation of GF need not descend to Gℚ; its twist is still defined
  over F, while the comparison with §5.14 requires that descent hypothesis.

**`fixed_pairing_twist_rational`** — Under the hypotheses of
`fixed_pairing_twist`, Xρ̄ is F-isomorphic to ℙ¹ and Yρ̄ is its cusp
complement. Prove that the projective twisting cocycle lifts to an SL₂-cocycle
and hence is trivial by Hilbert 90, with the determinant/pairing compatibility
needed for the lift. Apply Shepherd-Barron–Taylor's level-five argument and
its level-three analogue. This supplies rationality without assuming a global
point or deducing one from geometric genus zero. (AKT, proof of Lemma 9.7,
p.75; Shepherd-Barron–Taylor, Lemma 1.1 and proof, author p.3.)

*Needs:* §0.2 `fixed_pairing_twist`; ModularCurves §0E (effective descent);
the SL₂ lift and cocycle-trivialization argument of the cited proof, included
in this target.

**Checks.**

- For ρ̄=E[p], the completion's rationality agrees with the rational point
  (E,id) and geometric genus zero.
- Removing the finite cusp divisor from ℙ¹ over a number field leaves
  infinitely many F-points, even without a chosen elliptic realization of ρ̄.
- A general genus-zero curve, such as x²+y²+z²=0 over ℚ, need not have a
  rational point. The specified determinant-compatible lift is essential.

**`mixed_fixed_pairing_twist_six`** — For elliptic curves A,E over any
number field K, construct the fine K-curve Y classifying elliptic curves C
with symplectic isomorphisms C[2]≅A[2] and C[3]≅E[3], and its smooth
proper geometrically connected genus-one completion X. Descend the paired
full-level-six curve using the module A[2]×E[3] and its Weil pairings.
Prove the point dictionary over every extension of K and base-change laws
for identity and composition. Write X_A and X_E for the corresponding
pure twists using A[6] and E[6]. Let V_A,V_E be the normal Klein four
K-subgroups in PSp(A[3]), PSp(E[3]), and C_A,C_E the normal order-three
K-subgroups in PSp(A[2]), PSp(E[2]). If ΔA/ΔE is a cube, prove
X_A/V_A≅X/V_E; if it is a square, prove X/C_A≅X_E/C_E, with the quotient
maps extended to the completions. (AKT, Lemmas 9.5–9.6, pp.74–75.)

*Needs:* ModularCurves §0E and §5C for descent and the paired frame
construction; ModularCurvesPartII §5.13 for the compactified full-level-six
carrier; EllipticCurves Layer 2; the genus-one calculation and quotient comparisons
of AKT Lemmas 9.5–9.6, included in this target.

**Checks.**

- For A=E the curve is the twist by E[6], and (E,id,id) is a K-point
  of its elliptic open.
- Over a field with symplectic frames the completion is the connected
  fixed-pairing X(6), of genus one; the unpaired full-level curve has two
  geometric components and cannot replace it.
- Under both square and cube conditions, the images of the points on
  X_A and X_E give rational divisors on X of degrees four and three.
  Their difference gives degree one; geometric genus one alone does not
  imply that a twist has a K-point.

**`discriminant_coupling`** — For any number field K and elliptic A,E/K,
if `ΔA/ΔE ∈ (Kˣ)^6` and E[3] is irreducible, there is an elliptic C/K
with `ΔC/ΔA ∈ (Kˣ)^6` and symplectic isomorphisms `C[2] ≅ A[2]`,
`C[3] ≅ E[3]`. Use the mixed fixed-pairing level-six curve, whose rational
divisors of degrees three and four give a degree-one divisor; the
irreducibility assumption excludes rational cusps. (AKT, Lemma 9.6,
pp.74–75; ModularCurves §5C; ModularCurvesPartII §5.14.)
The statement `discriminant_coupling` in `Suggested.lean` uses
`SymplecticTorsionEquiv`, a subtype of additive isomorphisms between actual
torsion groups over the algebraic closure, preserving their Galois actions
and Tau Ceti's Weil pairings. Irreducibility of E[3] is expressed by the
absence of proper nonzero Galois-stable subgroups.

The local nonemptiness and open-condition application is AKT Lemma 9.7,
pp.75–76, used in `hilbert_local_selection`. The CM globalization target
`solvable_preparation` realizes those compatible choices while preserving
the avoidance field and every place over the generic witness. A sixth-power
discriminant class retains the square and cube conditions simultaneously;
replacing it by a twelfth-power class is not the specified coupling.

*Needs:* §0.2 `mixed_fixed_pairing_twist_six`; ModularCurves §5C;
ModularCurvesPartII §5.14; JacobianChallenge Layers B and D;
Mathlib `groupCohomology.H1ofAutOnUnitsUnique`.

**Checks for `discriminant_coupling`.**

- The sixth-power condition supplies both the square and cube conditions
  needed for the two quotient comparisons.
- The rational degree-four and degree-three divisors give degree one by
  subtraction; Riemann–Roch on the genus-one completion gives a K-point.
- Irreducibility of E[3] excludes rational cusps. Without it, the
  degree-one argument alone need not supply a point of the elliptic open.

### 0.3 Local preparation and the independent elliptic seed

In this layer “modular” for an elliptic curve over a CM field means either
geometric CM or a cuspidal weight-zero automorphic realization of its H¹ at
one prime. The non-CM seed outputs below use the second alternative. The
comparison `modular_elliptic_all_coefficients` in this section gives all-prime
compatibility once that one realization is proved; §8.6
constructs the actual isobaric realization for the CM branch.


Geometric genus zero does not give a rational point. §0.2 `fixed_pairing_twist` constructs the number-field twist, including its actual rigidification at level 3, and `fixed_pairing_twist_rational` identifies the completion with a projective line. Local preparation supplies the local prototypes and open conditions. Its globalization contract simultaneously controls the CM real subfield, the avoidance field and every place over the chosen generic q.

**`solvable_preparation`** — Let F be imaginary CM, p∈{3,5}, ρ̄:GF→GL₂(𝔽p) continuous, cyclotomic determinant and decomposed generic, and Favoid/F finite Galois. There is a finite Galois solvable CM extension L/F disjoint from Favoid such that each w|2,3,p is split over L⁺ and ρ̄|GLw is trivial; for every w|p there are local elliptic curves with good ordinary and good supersingular reduction and rational p-torsion; Lw(√−1)/Lw is unramified at w|2; a rational prime q>5 witnessing decomposed genericity splits completely in L. Local degrees and the chosen witness are part of the output. Where ζ5 must be excluded, enlarge the avoidance field by F(ζ5) before constructing L. (CN, Proof of Proposition 6.1.5, p.89; proof of Proposition 6.1.6, p.90, compared with AKT 9.13–9.15; AKT §9, Propositions 9.13 and 9.15, pp.79–81.)

*Needs:* GlobalNumberFields Layer 1, InverseGaloisAndArithmeticFundamentalGroups IG.2.4 and IG.2.7, ArithmeticGaloisRepresentations §§4.2–4.7, EllipticCurves Layer 4, AutomorphicGaloisRepresentationsPartII AG2.7, “Infinitely many decomposed generic primes”.

The witness q is one rational prime and every place above it is retained, not only one selected place. Disjointness from Favoid preserves residual image only if the required residual field was included in Favoid. A retained q supplies genericity; full image preservation separately requires the residual field in the avoidance datum. No enormousness assumption is inserted at p=3.

#### The independent modularity seed and Hilbert selection

Local reduction
conditions on A use EllipticCurves Layer 4 and Layer 4.5a's model comparisons;
the discriminant conditions below refer to the specified equation.

The general CM dihedral 2-adic and ordinary odd-prime lifting theorems are proved in §0.1. AKT discriminant descent and the mod-2/mod-3 coupling belong to §0.2. Here their hypotheses are assembled for the auxiliary curve, with locally open discriminant conditions and thin-set avoidance. The p-adic reduction partition is prescribed separately.

**`seed_modular`** — Let K be imaginary CM and A/K elliptic with discriminant Δ from a chosen Weierstrass equation. Suppose: at each v|2, A is a Tate curve, Kv(√−1)/Kv is unramified, ordv Δ≡3 mod 6, and Δ/Δc is a square in Kv; at each v|3, A is a Tate curve, ordv Δ≡2 or 4 mod 6, and Δ/Δc is a cube in Kv; for M=K(ζ12,(Δ/Δc)^(1/6)), r̄A,3|GM is decomposed generic and its image on GM(ζ3) is conjugate to SL₂(𝔽3). Then A is modular. Here c is the CM involution; the choices of sixth root do not affect the field M. (AKT, §9, Proposition 9.12, p.79; Lemma 9.11, pp.78–79, and Corollary 9.4, p.74.)

*Needs:* GL2AutomorphicRepresentationsAndTransfer R17.4 (base change, descent and character twists), ModularCurvesPartII §5.14, ArithmeticGaloisRepresentations §§4.2–4.7, EllipticCurves Layer 4, ModularCurvesPartII §5.14 and §0.2 `discriminant_coupling`, §0.1 `cm_dihedral_lifting` and `cm_ordinary_lifting` with the independent AKT CM lifting contracts stated above.

No condition at places above 5 occurs; changing the 5-adic reduction does not affect this seed. The residue characteristic two hypothesis is dihedral, not nonsolvable; a nonsolvable dyadic lifting theorem does not supply it.

**Checks for `seed_modular`.**

- The Tate conditions at 2 and 3 are simultaneous; the specified valuation
  classes supply different square and cube constraints for the coupling.
- The residual image and all-place genericity are imposed over
  M=K(ζ12,(Δ/Δc)^(1/6)), not just over K. Restriction can otherwise
  destroy the residual hypothesis used by ordinary lifting.
- No condition at 5 is required. Its ordinary or supersingular reduction
  is independent of this seed.

**`hilbert_local_selection`** — For the twist over L constructed by §0.2 `fixed_pairing_twist`, use `fixed_pairing_twist_rational` to identify Yρ̄ with an open subcurve of ℙ¹L after `solvable_preparation`. Then, given nonempty open subsets Ωw⊂Yρ̄(Lw) at all the finitely many selected places and the finite covers encoding auxiliary large mod-3 or mod-5 image, there is an L-point in every Ωw outside the relevant thin exceptional sets. In the p=5 construction impose the AKT 9.7 discriminant-conjugacy, Tate valuation and large mod-3 conditions for seed_modular; independently choose at every w|5 ordinary, supersingular or split multiplicative local prototypes according to the prescribed partition. In the p=3 construction impose Tate reduction at every place above 5 for the ordinary mod-5 seed without constraining the prescribed 3-adic ordinary/supersingular/multiplicative choices. (CN, §6.1, proofs of Propositions 6.1.5–6.1.6, pp.89–90; AKT §9, Lemma 9.7, pp.75–76, Propositions 9.13 and 9.15 and Corollary 9.14, pp.79–81.)

*Needs:* §0.2 `fixed_pairing_twist`, §0.2 `fixed_pairing_twist_rational`, §0.3 `solvable_preparation`, GlobalNumberFields Layer 1, InverseGaloisAndArithmeticFundamentalGroups IG.2.4 and IG.2.7, EllipticCurves Layer 4.

**Checks for `hilbert_local_selection`.**

- Empty Ωw cannot yield a point satisfying all local conditions; nonemptiness
  is required at each selected place.
- For a trivial residual representation after local preparation, a local
  ordinary prototype and a local supersingular prototype give different open
  conditions on the same rational parameter curve.
- An anisotropic genus-zero curve has no rational point; this target
  uses `fixed_pairing_twist_rational`, not local nonemptiness alone, to invoke
  Hilbert irreducibility on ℙ¹.

Every place over the prescribed prime is constrained, not just the chosen lift of a place. A point found by finite search is not a substitute for avoiding the thin set.

#### What elliptic modularity supplies after it is known

Retain the elliptic comparison **`modular_elliptic_all_coefficients`** as an
application of the automorphic Galois, purity and transfer suppliers:
for a non-CM elliptic D over a CM number field, if a weight-zero cuspidal π
realizes H¹(D) at one prime, the same π has trivial central character,
realizes H¹(D) at every prime and coefficient isomorphism, and satisfies
full `WD^(F-ss)=rec^T(π_v)` for v∤ℓ, with N retained. At a potentially
multiplicative v|ℓ it is ι-ordinary of weight zero. The API components retain the names `automorphic_unique` (uniqueness and
trivial central character), `automorphic_all_primes` (the same π at all
coefficients), `automorphic_wd` (full away-prime WD comparison) and
`automorphic_potentially_multiplicative_ordinary` (the coefficient-prime
ordinary conclusion). All carry precisely the non-CM, CM-base and initial
realization hypotheses of this paragraph. Uniqueness is up to isomorphism
by strong multiplicity one. (OpenAI Theorem 6.4, pp.15–16;
CN Lemma 6.1.3(1)–(4), p.88.)

Equality of good-place polynomials and semisimplicity identify the same
π at all coefficient primes by Chebotarev–Brauer–Nesbitt; strong multiplicity
one gives uniqueness, and the determinant gives trivial central character.
For full away-prime WD comparison, use Varma’s Weil comparison and monodromy
bound. If the elliptic N is zero, potential good reduction makes the two
Weil roots have equal absolute value; a nonzero automorphic N would force
a norm ratio. This excludes the only remaining strict monodromy inequality
in rank two. At a potentially multiplicative place use a different coefficient prime:
full WD comparison identifies the local factor as a quadratic Steinberg twist.
The normalized U_v eigenline at a level trivializing that finite character
has unit eigenvalue, giving ι-ordinarity also for ramified quadratic twists.
These arguments use only the initial elliptic realization. (AKT, Lemma 9.1
and Corollary 9.2, p.73; CN, Lemma 6.1.3, p.88.)

*Needs:* AutomorphicGaloisRepresentationsPartII AG2.5–AG2.7;
ArithmeticGaloisRepresentations §2.6 and Layers 5–6;
NeronModelsAndSemistableAbelianVarieties §6.10;
FaltingsFinitenessAndIsogenyTheorems R28.4;
GL2AutomorphicRepresentationsAndTransfer R16.3–R16.6 and R17.4.

**Checks.** The all-coefficient conclusion is for the same π, not a new
choice at each prime. At a Tate place N has rank one, so Weil
semisimplification alone would omit a necessary part of the conclusion.
At v|ℓ the ordinary conclusion uses an auxiliary coefficient prime to
recognize the local Steinberg twist; it does not apply away-prime comparison
with the coefficient and residue primes equal.

#### Prescribed-type outputs and their automorphic local types

The retained Tate places give the auxiliary curve a non-CM witness independently of its prescribed ordinary/supersingular partition. Use ShimuraVarieties §5.6 after a finite extension defining all geometric CM endomorphisms to obtain potential good reduction everywhere; combine this with nonintegral j at a Tate place before choosing its cuspidal modular representation. The good-reduction comparison then gives an unramified local factor, while the multiplicative comparison gives ordinarity.

**`switch_five`** — Let F be imaginary CM, ρ̄:GF→GL₂(𝔽5) continuous with det=ε̄5 and decomposed generic, and partition the places v|5 as S5st⊔S5ord⊔S5ss. For every finite Galois Favoid/F there exist a finite Galois solvable CM extension L/F and a non-CM modular elliptic curve A/L such that L∩Favoid=F, A/Lw has respectively split multiplicative, good ordinary or good supersingular reduction for every w|v in the corresponding part, r̄A,5≅ρ̄|GL, and ρ̄|GL remains decomposed generic. ζ5∉F is not a hypothesis of this proposition. The construction also retains Tate reduction at every place above 2 and 3, independently of the prescribed 5-adic partition. These Tate places force A to be non-CM because a CM elliptic curve has potentially good reduction everywhere. (CN, Proposition 6.1.5, pp.88–89.)

*Needs:* §0.3 `solvable_preparation`, §0.3 `hilbert_local_selection`, §0.3 `seed_modular`, EllipticCurves Layer 1, EllipticCurves Layer 4, ShimuraVarieties §5.6 `TauCeti.Shimura.cm_potential_good_reduction`.

Taking S5ss to be all 5-adic places yields an auxiliary curve with good supersingular reduction everywhere above 5. The modularity argument never invokes the target CN Theorem 6.1, avoiding a cycle. The auxiliary curve is non-CM even when every prescribed 5-adic place is supersingular: retain its Tate places above 2 and 3.

**`switch_three`** — Let F be imaginary CM with ζ5∉F, ρ̄:GF→GL₂(𝔽3) continuous with det=ε̄3 and decomposed generic, and partition all places v|3 as S3st⊔S3ord⊔S3ss. For every finite Galois Favoid/F there exist a finite Galois solvable CM extension L/F and a non-CM modular elliptic curve A/L such that L∩Favoid=F, A/Lw has respectively split multiplicative, good ordinary or good supersingular reduction for every w|v in the corresponding part, r̄A,3≅ρ̄|GL, and ρ̄|GL remains decomposed generic. The construction also retains Tate reduction at every place above 5, independently of the prescribed 3-adic partition. These Tate places force A to be non-CM because a CM elliptic curve has potentially good reduction everywhere. (CN, Proposition 6.1.6, pp.89–90; AKT §9, Corollary 9.14 and Proposition 9.15, pp.80–81.)

*Needs:* §0.3 `solvable_preparation`, §0.3 `hilbert_local_selection`, §0.3 `switch_five`, §0.3 `seed_modular`, §0.3 `modular_elliptic_all_coefficients`, ArithmeticGaloisRepresentations §§4.2–4.7, EllipticCurves Layer 1, EllipticCurves Layer 4, ShimuraVarieties §5.6 `TauCeti.Shimura.cm_potential_good_reduction`.

The ζ5 condition belongs here and is kept when invoking the ordinary mod-5 seed. Supersingular at 3 is allowed; ordinary modularity lifting is used at 5, not incorrectly at 3. The auxiliary curve is non-CM even when every prescribed 3-adic place is supersingular: retain its Tate places above 5.

**`auxiliary_local_types`** — For A/L supplied by switch_five (p=5) or switch_three (p=3), A is non-CM by its retained Tate places; let π be its weight-zero cuspidal modular representation with rπ,ι≅H¹(A). For every w|p above v of F, π is ι-ordinary if v∈Spst; πw is unramified if v∈Spord∪Spss. In the latter case the associated p-adic representation is crystalline with N=0 and is potentially ordinary precisely in the ordinary case. Use p=5 for switch_five and p=3 for switch_three when applying CN Lemma 6.1.7. (CN, Lemma 6.1.7, p.90, and Theorem 6.1 proof.)

*Needs:* §0.3 `switch_five`, §0.3 `switch_three`, §0.3 `modular_elliptic_all_coefficients`, EllipticCurves Layers 1 and 4, ShimuraVarieties §5.6 `TauCeti.Shimura.cm_potential_good_reduction`.

For a good ordinary or supersingular A/Lw, apply `automorphic_wd` at a
coefficient prime different from the residue characteristic of w. Its
unramified elliptic WD parameter with N=0 gives a spherical πw by local
Langlands. At a Tate place use
`automorphic_potentially_multiplicative_ordinary` from the same comparison.
The p-adic crystallinity assertion uses A’s actual good reduction over Lw;
no character-family specialization is needed.

**Checks for the switching outputs and `auxiliary_local_types`.**

- Prescribing supersingular reduction at all 5-adic places leaves the Tate
  places above 2 and 3 in `switch_five`, and hence its non-CM witness.
- Prescribing supersingular reduction at all 3-adic places leaves the Tate
  places above 5 in `switch_three`, and hence its non-CM witness.
- A negative valuation of j at a retained Tate place remains negative after
  every finite extension; it contradicts potential good reduction from CM.
- At a good ordinary or supersingular place N=0; at a split multiplicative
  place N≠0 and the automorphic factor is ordinary Steinberg-type.

A Tate place excludes CM of A; no inference from CM of A to modularity of the target E is used.


#### Fixed-pairing point and base-change contract

The §0.2 `fixed_pairing_twist` construction has the following contract, extending ModularCurvesPartII §5.14 beyond base changes of representations over ℚ. For p∈{3,5}, a number field F and continuous ρ̄:GF→GL₂(𝔽p) with det ρ̄=ε̄p, use the smooth affine twist Yρ̄/F of the fixed-pairing full-level curve. For every extension K/F its K-points classify pairs (A/K,α), up to isomorphism, where A is elliptic and α:𝔽p²≅A[p](K̄) is a GK-equivariant symplectic identification with the restriction of the given ρ̄, with the standard determinant pairing on ρ̄ matched to the Weil pairing. For p=3 the simultaneous sign automorphism and the actual rigidified moduli problem must be treated through ModularCurves §5C’s level-structure construction; no coarse universal curve is assumed. Its smooth proper completion has geometric genus zero. (CN, Proof of Proposition 6.1.5, p.89; AKT §9, twists in Lemmas 9.6–9.7, pp.74–76.)

*Needs:* §0.2 `fixed_pairing_twist`, EllipticCurves Layer 2, ArithmeticGaloisRepresentations §6.1.

Its point, base-change and genus-zero interfaces are used as follows.

- The stated K-point classification holds naturally in K/F, with symplectic isomorphisms and the correct isomorphism relation.
- For an extension K/F the base change of Yρ̄ is canonically the twist associated to ρ̄\|GK; these identifications satisfy identity and composition.
- If the smooth completion has an F-point, its genus-zero curve is F-isomorphic to ℙ¹, and Yρ̄ is the corresponding complement of the cusps.

**Checks.**

- For ρ̄=A[p] in a symplectic basis, (A,id) gives an F-point of Yρ̄.
- At p=5, the change of level basis diag(2,1) multiplies the Weil pairing exponent by 2 and is not symplectic; it cannot act as a pairing-preserving identification.
- Over a local field K containing μp, the trivial ρ̄ and any A with all p-torsion K-rational yield a K-point after choosing a symplectic basis; geometric genus zero alone does not assert a K-point.

### Examples

At a non-neat level with p-torsion stabilizers, the localized perfect complex
uses the non-Eisenstein vanishing theorem; replacing it by coarse quotient
cohomology loses the augmentation comparison. For the elliptic seed, prescribing
supersingular reduction at every place above five remains compatible with the
Tate conditions above two and three. Those independent Tate places force the
auxiliary curve to be non-CM. Neither argument uses a point classification on
an exceptional modular curve.

### Dependencies

CrystallineLocalGlobalCompatibilityCM §§7.5–7.6, 8.7 and 9.1–9.12 supplies
the CN integral arithmetic and qualified lifting inputs. The additional
AKT lifting inputs use ArithmeticLocallySymmetricSpaces ALS.1–ALS.4,
AutomorphicGaloisRepresentationsPartII AG2.P and AG2.5–AG2.7,
GlobalGaloisDeformations R04.3–R04.6, LocalGaloisDeformationRings Layers 1–6
and 8, and DeformationAndDerivedPatchingAlgebra §§8.2–8.5 and 9.4–9.7.
The seed geometry uses ModularCurves §0E and §5C, ModularCurvesPartII §§5.13–5.14,
EllipticCurves Layers 1–4, JacobianChallenge Layers B and D, and
InverseGaloisAndArithmeticFundamentalGroups IG.2.4 and IG.2.7. The AKT
arithmetic maps and uniform bounds, the exceptional cyclotomic preparation
and the discriminant comparisons remain targets here. None is a hypothesis
on the final elliptic curve.

## Layer 1: Cyclic covers of a family of quadratic twists

### 1.1 The parameter open and its marked points

For an arbitrary number field k, an elliptic E/k in the form `y²=h(x)`, and
an odd n≥3, set `B_t: h(t)y²=h(x)`, with origin O and marked point
`R_t=(t,1)`. Put `S_t=[n]R_t`. Define **`switchParameterOpen`** as the
nonempty Zariski open U⊂A¹_k where h(t)≠0 and the five points
`O,R_t,−R_t,S_t,−S_t` are pairwise distinct. The B_t are the existing
quadratic twists from EllipticCurves; the displayed equation is their
coordinate presentation. Define **`markedTwistFamily`** as this elliptic
scheme with its two sections over U. (OpenAI §3, before Lemma 3.1, p.5.)

To prove nonemptiness, use the x-coordinate morphism
`E ∖ {O} → A¹`, `(t,s)↦t`, restricted to h(t)≠0. The equation
identifies B_t with the constant E by `(x,y)↦(x,sy)`, sending R_t to the
parameter R=(t,s). Coincidences among the five sections force R into the
kernels of [2], [n], [2n], [n−1] or [n+1]; all are finite in characteristic
zero, with n−1 nonzero. Thus removing these points and the branch points
leaves a nonempty open. This also proves **`parameter_open_nonempty`**.

**API.** Membership in the parameter open is exactly the two guards above.
The family carries the two sections R and S with S=[n]R, and the displayed
isomorphism with the constant curve over the double cover respects the
origin, R and all multiplication maps.
These identifications commute with finite extensions of k.

**Checks.**

- A root t of h has h(t)=0 and is excluded even if the equation has points;
  it is not an elliptic twist in this family.
- At n=1 one has S=R identically and this open would be empty. The hypothesis
  n≥3 is necessary. For n=3 the excluded torsion includes [2]R=0 and [4]R=0.
- Changing s to −s changes the constant-family isomorphism by [−1]. The
  twist and its origin remain defined over k; no global square root of h(t)
  is assumed in U(k).
- If a proper open U′⊊U omits a point satisfying the two guards, that point
  still belongs to the parameter open and has the functions and smooth
  cover fibers of §§1.2–1.3. Restriction to U′ does not change the canonical
  membership characterization.

### 1.2 The normalized principal function

For an abelian group G write **`coverDivisor n R S`** for the formal divisor
`(S)−(−S)−n(R)+n(−R)` in `G→₀Z`. This is a light definition on point
divisors; the geometric comparison uses divisors on B_t. Its degree is zero
and its Abel sum is `2S−2nR`. In the family S=[n]R, Abel's criterion on a
genus-one curve makes it principal. There is a unique function **`coverFunction`**
on B_t with this divisor and value 1 at O. Since all the data and O are
k-rational, uniqueness descends the function to k. Over the entire canonical
U, the relative degree-zero divisor has zero class in Pic⁰(B/U); its
rigidification at O trivializes the pullback line bundle from U. This gives
a normalized relative function with exactly the stated horizontal divisor.
Equivalently, spread out the normalized generic-fiber function: inversion
preserves every integral fiber and negates its divisor, so every vertical
valuation is zero. No further shrinking of U is needed. (OpenAI Lemma 3.1
and proof, p.5; JacobianChallenge Layer D.)

**API.** Prove the degree and Abel-sum formulas above, including vanishing
of the Abel sum for S=[n]R. The divisor of f and its value 1 at O specify
f and its scalar; the inversion identity `f(−Z)=f(Z)⁻¹` follows by
comparing divisors and values at O. The normalized functions are identified
under field extension, restriction to an open of U and the constant-family
pullback of §1.1. These are restrictions of the function on the same
canonical U. This is
principality of this divisor, not the assertion that all degree-zero divisors
are principal.

For n=3 on E: y²=x³−x+1, take R=(0,1). The group law gives
2R=(1/4,−7/8) and S=3R=(56,419). The normalized function is

```text
f(x,y) = ((y+1−x/2)(y+1−15x/2)) / ((y−1+x/2)(y−1+15x/2)).
```

The tangent and secant slopes at R and through R,2R are −1/2 and −15/2.
The ratio of the corresponding Miller functions at −R and R has the
required divisor; their common vertical factors cancel and the value at O
is 1. Thus this formula is the constant-family `coverFunction`.

**Checks.**

- On the test group Z, n=3,R=1,S=3 gives coefficients 1,−1,−3,3 at
  3,−3,1,−1 respectively, and Abel sum zero.
- For n=3,R=1,S=4 the degree is still zero but the Abel sum is 2. This
  negative control rules out omitting S=[n]R from principality.
- For n=1,S=R the formal divisor vanishes. The algebraic definition is
  meaningful there but gives no two-branch cover. Collision guards are
  attached to the geometric construction, not silently built into Finsupp.
- In the displayed n=3 example, f(1,1)=−11/5. This distinguishes f
  from its negative, which has the same divisor and inversion relation.
- In the same example f(−1,1)=19/3; this is another nonsupport point
  and also distinguishes the reciprocal function.
- At the negative of (1,1), f(1,−1)=−5/11. Together these three rational
  evaluations test both normalization and inversion.
- Multiplying f by a constant a with a²≠1 preserves its divisor but destroys
  the relation `f(−Z)=f(Z)⁻¹`. Multiplication by −1 preserves that relation
  but changes f(O) to −1; value 1 at O fixes this remaining ambiguity.

### 1.3 The covers and their dihedral symmetry

For m>1 dividing n construct **`cyclicCover m`**, the normalization of the
smooth proper B_t in `k(B_t)[Y]/(Y^m−f)`, and its map to B_t. The ±S
valuations of f are ±1, while the ±R valuations are multiples of m. Thus
there are exactly two totally ramified branch sections, the cover is
geometrically connected and Riemann–Hurwitz gives genus m. Spread this
construction to a smooth proper family C_m→U over the entire canonical
`switchParameterOpen`. Near ±R remove a local parameter to the power ±n/m
from Y, leaving an étale Kummer equation for a unit. Near ±S, after an
étale root of that unit, the equation is the m-th root of a transverse
parameter. Away from these sections the cover is étale. Since m is
invertible in characteristic zero, these charts prove relative smoothness
at every point over U; finite normalization gives properness. The
construction and the reflection
`w(Z,Y)=(−Z,Y⁻¹)` are over k. The rotations `u_ζ(Z,Y)=(Z,ζY)` are defined
over k(μ_m). They satisfy `w²=1` and `wu_ζw=u_ζ⁻¹`.
(OpenAI Lemma 3.1, pp.5–6.)

**API.** Identify the two branch divisors and their ramification indices,
prove that the genus is m, and construct the displayed maps and relations
on the proper normalization, including the charts where Y=0 or ∞. For d|m,
the quotient map `(Z,Y)↦(Z,Y^(m/d))` to C_d is compatible with
composition, rotations and w. The d=1 output is B_t, denoted C₁ for this
quotient statement; it is not another branched cover of genus m.

**Checks.**

- For m=3 the two ramification contributions total 4, so `2g−2=4` and
  g=3. Taking an unramified cover instead would give genus one.
- With n=3p and m=3p, the quotient to C₃ uses Y↦Y^p and the quotient to
  C_p uses Y↦Y³. Interchanging these exponents gives the wrong equations.
  At p=101 the exponents are 303/3=101 and 303/101=3.
- Reflection conjugates a rotation to its inverse, and is defined before
  adjoining μ_m. Commutation would be false for a primitive cubic rotation.
  The integral matrix witness `R=[[0,−1],[1,−1]]`, `W=[[0,1],[1,0]]`
  gives `WRW=[[−1,1],[−1,0]]` and `R(WRW)=I`. It tests the dihedral
  convention, without replacing the curve maps.
- At m=1 the map is the identity of B_t; at m=2 the odd-degree geometry
  below is not asserted. Positive residue characteristic dividing m is not
  included in this characteristic-zero smooth-family statement.

### Examples

For n=3p, the tower contains C₃p, C₃, C_p and B. Pullback after choosing
s²=h(t) turns the base twist into E but keeps the normalization f(O)=1.
This common normalization supplies compatible covers in the tower rather
than separately chosen μ_m-twists. The m=3 branch calculation already
explains why a genus-one reflection quotient can appear later.

### Dependencies

EllipticCurves Layer 5 supplies twists and their Galois action; JacobianChallenge Layers A–B and D–F supply divisors and Abel’s criterion. SchemeAndStackFoundations §§3.2 and 4.13 supplies scheme Riemann–Hurwitz and regular curve models; its §4.18 supplies nodal families. AlgebraicCurves Layer 7 supplies the function-field Hurwitz formula. Normalization uses Mathlib `AlgebraicGeometry.Scheme.Hom.normalization` and the finite-normalization interface of SchemeAndStackFoundations §0.19. No modularity theorem is used in Layer 1.

## Layer 2: Two degenerations with different Jacobian behavior

### 2.1 The regular local models

Work on the constant-E parameter cover from §1.1. Over a finite extension of
k containing the chosen boundary point and μ_m, complete the parameter curve
at R=O, or at `R_*=a/(2n)` in a complex uniformization
`E(C)=C/(Za+Zb)` with a,b an oriented lattice basis. Here `[n]R_*=a/2` is
nonzero two-torsion, and the remaining marked points stay distinct. These
complex labels select algebraic torsion points; the local model descends to
a number field containing them. **`boundary_regular_model`** constructs one
blow-up of the colliding branch sections followed by normalization and proves
regular semistability with m nodes, each of smoothing order one.
(OpenAI Lemma 3.2, p.6, and Lemma 3.5, p.7.)

At O the four tangent positions on the exceptional line are 1,−1,n,−n;
characteristic zero and n≥3 make them distinct. At the second boundary the
local equation at each node has the form `XU=−2nt`, with t=R−R_* a local
parameter. The unit −2n makes the exponent of t equal to one. A ramified
change t=s^e would multiply the exponent by e; no such base change is hidden
in the monodromy calculation.

**Checks.** The four tangent positions at n=3 are ±1,±3; they collide at
n=1. The coefficient −2n is a unit in these characteristic-zero local rings,
including when a later coefficient prime divides n. A model over the local
ring of the parameter in characteristic zero says nothing about smoothness
of an integral arithmetic model modulo a prime dividing m.

### 2.2 The compact-type fiber and its exceptional function

Define **`compactTypeModel`** to be this regular model at O with its deck
action and marking of the components. Its special fiber consists of a
rational spine meeting m disjoint elliptic leaves, each isomorphic to E;
the deck rotation cyclically permutes the leaves. The dual graph is a tree.
Therefore the relative Pic⁰ is an abelian scheme near O and its fiber is
E^m, with the factors marked by the deck action. This yields
**`compact_type_jacobian`**. (OpenAI Proposition 3.3, pp.6–7.)

The function on the exceptional line with coordinate v is the light
**`exceptionalFunction K n`**:
`((v−n)/(v+n)) ((v+1)/(v−1))^n` in RatFunc K. For m|n, the substitution
`Y'=Y((v−1)/(v+1))^(n/m)` reduces the equation to
`Y'^m=(v−n)/(v+n)`, a rational component. For odd n, the attaching values
at v=0 and v=∞ are both 1. On the other component the normalized function
is 1, which gives m copies of E, each attached at one point. This describes
the components and the actual gluing, not just their arithmetic genus.

**API.** The model records its leaves, spine and nodes; the deck rotation
acts on the leaves as the regular permutation; and Pic⁰ is identified with
the product of the leaf Jacobians. Prove the displayed evaluation formula where v+n and v−1 are
nonzero, the substitution identity for m>0,m|n and the odd-n value at zero.
At infinity the reduced numerator and denominator have the same leading
coefficient, giving value 1. These rational identities hold on RatFunc over
any field where stated; the geometric semistability conclusion retains the
number-field and odd-n hypotheses.

**Checks.**

- At n=m=3 the graph has four vertices and three edges: its first Betti
  number is zero and Pic⁰ is E³, an abelian variety of dimension three.
- Over Q, the function at v=0 is 1 for n=3, but −1 for n=2. Its value
  at v=2 for n=3 is −27/5, fixing both reciprocal choices.
- At n=1 the rational function cancels to 1. This algebraic boundary does
  not create a genus-one branched family with four distinct tangent positions.
  The n=0 function is also 1. At n=1,v=1, RatFunc evaluation after
  cancellation is 1; the displayed quotient formula requires v−1≠0.
  In characteristic three, n=3 gives value −1 at zero after cancellation,
  so the odd-n attaching-value theorem retains characteristic zero. These
  controls distinguish reduced evaluation from the displayed quotient.
- For n=3p,m=3 the exponent n/m is p. Replacing it by m/n does not cancel
  the n-th power, and misses the rational spine.

### 2.3 The nodal fiber and its graph lattice

Define **`nodalModel`** at R_* with the two components and all nodes marked.
One component is a connected unramified degree-m elliptic cover E'→E;
the other is rational. The class determining E' has exact order m,
represented in the chosen uniformization by −a/m. They meet in m nodes,
cyclically permuted by the deck group. Its graph has two vertices and m
parallel edges, hence first Betti number m−1 and arithmetic genus
`1+(m−1)=m`. Its generalized Jacobian has abelian part E' and toric rank
m−1. (OpenAI Lemma 3.5, p.7.)

**API.** The elliptic component is recorded with its connectedness, exact
degree and order-m class; the dual graph is identified with the edge
permutation module and its augmentation kernel; and the order-one node
charts come from §2.1. The marked edge differences become the vanishing
cycles in §3.2. A disconnected trivial μ_m-torsor over E would change the
component graph and fails this interface.

**Checks.**

- At m=3 there are two vertices and three edges, giving toric rank two
  and total genus three, rather than the toric rank zero of §2.2.
- At m=1 the graph Betti number is zero. The formula is meaningful for a
  graph but the constructed branched family is only for odd m>1.
- Dividing a by m gives an exact-order-m class because a is primitive.
  A class of smaller order would split the unramified cover and is excluded.
- The exponent in `XU=−2nt` is one. Replacing it by t^m would multiply
  every node transvection by m and invalidate reduction modulo m.

### Examples

The two degenerations have equal genus and sharply different integral
monodromy. The O fiber is compact type and marks H₁ as m elliptic factors.
The R_* fiber contributes m node cycles with one relation. Keeping the
first marking while moving to the second degeneration is what allows two
transverse monodromies to be compared in one lattice in Layer 3.

### Dependencies

Layer 1 supplies normalized functions and the common covers. The Néron-model
supplier §§4.1–4.4 and 4.13 supplies Pic⁰ of nodal curves, its graph character
lattice and the compact-type criterion. Local normalization and blow-ups are
used here for these equations; arithmetic semistable reduction is not inferred
from this parameter degeneration.

## Layer 3: Integral homology and a common monodromy basis

### 3.1 A unimodular regular-module marking

Over C, take R_s=(s/n)a with 0<s<1/2, initially sufficiently close to O,
and slit E along the short arc from −sa to sa. Its endpoints are the branch
points ±[n]R_s. **`slit_marking`** identifies the cover outside this slit
with m sheets and describes cyclic gluing along the slit. Choose the a and
b loops on each sheet away from it. Their lifts a_i,b_i, indexed by Z/m,
have intersection `⟨a_i,b_j⟩=δ_ij`, and zero pairings within the a's or
within the b's. They form an integral basis, not just a rational basis.
(OpenAI Lemma 4.1, p.8, Proposition 4.2, p.9.)

The target **`integral_regular_module`** identifies H₁(C_m,Z), and then
H¹(C_m,Z), with `Z[μ_m]^2`, the direct sum of two copies of the **group
ring of the finite cyclic group**. The deck generator shifts each index
by one. To prove integrality, the intersection matrix of the displayed
2m classes has determinant one. A full-rank sublattice of index d in the
unimodular H₁ lattice would have determinant d², hence d=1. Taking the
integral dual uses the perfect coefficient-of-identity pairing on the
regular group ring. It uses no averaging by 1/m.

**API.** The marking returns the integral symplectic basis with its
orientation, and the deck generator acts as the cyclic shift. The étale comparison
**`integral_regular_module_etale`** gives a free rank-two
`Z_ℓ[μ_m]`-module H¹_ét(C_m,Q̄ base,Z_ℓ) for every ℓ, including ℓ|m.
Its marking and the quotient maps of §1.3 are retained for the character
specializations in Layer 4. (OpenAI Proposition 4.2 and Remark 4.3, p.9,
with integral singular–étale comparison.)

**Checks.**

- For n=m=3 and R=a/1000, the branch points are ±3a/1000.
  A slit only from −R to R leaves both branch points in its complement
  and cannot give a trivial unramified three-sheet cover there.
- For m=3 the integral lattice has Z-rank six. The cyclotomic integer ring
  Z[ζ₃]² has rank four and cannot be substituted for Z[μ₃]².
- A sublattice generated by 2a₀ and the other basis vectors has index two
  and intersection determinant four. Rational spanning alone does not pass
  the integral test.
- For ℓ=3,m=3 the group ring is not semisimple modulo 3; freeness still
  holds. An idempotent formula requiring 1/3 would not prove this statement.
- Rank zero or a single regular summand fails the rank 2m requirement.
  The genus-one quotient will be obtained by invariants, not by replacing
  the whole H¹ lattice by one elliptic factor.

### 3.2 Vanishing cycles as adjacent differences

Keep the marking of §3.1 and move R_s=(s/n)a as s approaches 1/2,
so R_s approaches a/(2n).
The m vanishing cycles are
`δ_i=±(a_i−a_(i+1))`, after a possible reversal of the cyclic indexing;
the signs of individual cycles do not affect their transvections.
**`vanishing_cycles_adjacent`** proves this formula by following the short
slit to the collapsing nodes. The sum of the adjacent differences is zero
and their span has rank m−1. Transporting the compact marking along the
b-direction instead gives the corresponding b differences, in the same
near-O fiber. (OpenAI Lemma 4.4, p.9, proof of Theorem 4.5, pp.10–11.)

The graph-cycle description from §2.3 and the topological cycles are compared
integrally, before tensoring with Q_ℓ. Each node has smoothing order one,
so Picard–Lefschetz contributes one transvection per adjacent difference.
No assertion about all possible monodromy generators of an arbitrary family
is needed.

**Checks.** At m=3 the differences a₀−a₁, a₁−a₂, a₂−a₀ sum to zero
and any two are independent. Reversing a vanishing cycle changes both
factors in the transvection and leaves its contribution unchanged. Replacing
the adjacent differences by a_i would give rank m and the wrong invariant
trivial-character subspace.

### 3.3 The two transformations in one basis

Define the light **`cyclicLaplacian m`** as the circulant integral matrix
for `2−u−u⁻¹` on Z[Z/m]. Its `(i,j)` entry is
`2 δ_ij − δ_(i,j+1) − δ_(i,j−1)`, with multiplicities even when the two
neighbors coincide. **`common_basis_monodromy`** gives two transformations
T_a,T_b on the marked H₁:

```text
T_a(a_j)=a_j,  T_a(b_j)=b_j+σ_a(2a_j−a_(j−1)−a_(j+1)),
T_b(b_j)=b_j,  T_b(a_j)=a_j+σ_b(2b_j−b_(j−1)−b_(j+1)).
```

Both formulas use this single basis; σ_a and σ_b are independent signs.
They follow by summing the node transvections of §3.2 and transporting both
paths through the compact-type neighborhood. Two independent choices of
bases would not show that the two unipotents have different fixed lines.
(OpenAI Theorem 4.5, pp.10–11.)

**API.** Prove symmetry, row sum zero for m>0 and the pairing identity
`Σ_i x_i(Ly)_i=Σ_i(x_i−x_(i+1))(y_i−y_(i+1))` over Z.
The character evaluation of `common_basis_monodromy` substitutes a character
value λ for u to give the two opposite-root unipotents with entries
σ_a c(λ),σ_b c(λ), up to the common dual convention. Contragredience
interchanges/inverts the two matrices and preserves all later irreducibility
and trace tests. Its sign is retained rather than guessed.

**Checks.**

- For m=1 the matrix is zero. For m=2 its first row is (2,−2); for m=3
  it is (2,−1,−1). These rows rule out losing the repeated edge at m=2
  or either minus sign.
- On a vector with x₀=1 and all other x_i=0 at m=3, the quadratic value
  is 2, the sum of the two adjacent squared differences. Constants have
  value zero and are fixed by both transformations. The cyclic operator
  kills constant vectors for every m>0.
- At a primitive cubic root λ, `c(λ)=3`; the trivial character gives c=0.
  Irreducibility below excludes the trivial character and coefficient
  characteristic dividing the character order.
- The two rank-one shear matrices with nonzero upper and lower entries
  fix the lines y=0 and x=0 respectively. A common upper-triangular pair
  would leave y=0 invariant and fails the required conclusion.

### Examples

The integral calculation survives at ℓ|m, where character projectors cannot
be used. At the later geometric-monodromy step ℓ∤m, the same lattice can
be evaluated on characters. At m=3 and ℓ=5 this gives c=3, an invertible
coefficient, so the two local monodromies have opposite fixed lines modulo 5.

### Dependencies

Layer 2 marks the compact-type lattice and supplies the node charts. The
Picard–Lefschetz supplier LPV.2 §2.8 supplies transvections; ComplexComparisonPartII §C6.6 `adicArtinComparison` transports the integral singular marking to étale cohomology, compatibly with the deck action and cup product; its §C5 supplies the relative Hodge comparison. Mathlib's
circulant, finite cyclic groups and matrix pairing operations are consumed
as they stand.

## Layer 4: Character systems, elliptic endpoints and integral congruences

### 4.1 The rank-two realizations on the shared carrier

For any number field k, odd n≥3, t∈U(k) and F=k(μ_n), define
**`characterSystem θ`** by the actual θ-eigenspaces
`V_(θ,ℓ)={x∈H¹_ét(C_n(t)_F̄,Q̄_ℓ) : u*x=j_ℓ(θ(u))x for all u∈μ_n}`.
Populate the shared `AutomorphicSystemData` with coefficient field M=Q(μ_n),
finite realization fields containing the character values and the given
Galois action. The target **`character_system_properties`** proves that these
are semisimple two-dimensional representations with determinant ε_ℓ⁻¹,
unramified away from one finite set and the coefficient prime, potentially
semistable with weights {0,1} at every labelled embedding. Away from the
finite set they have M-valued common Frobenius polynomials, independent of
ℓ with the fixed coefficient embeddings. They are pure of weight one at
good places. No CM hypothesis on k or E is used here.
(OpenAI Proposition 5.1, pp.12–13; its proof uses only number-field geometry.)

Rank two follows from §3.1, not from an assumed decomposition into elliptic
curves. For determinant, the reflection exchanges θ and θ⁻¹; define
`[x,y]_θ=⟨x,w*y⟩`, using the cup-product pairing on H¹. It is alternating,
perfect and valued in Q̄_ℓ(−1). On a two-dimensional space it identifies the
determinant with ε_ℓ⁻¹. Hodge comparison gives two Hodge types; reflection
identifies the holomorphic θ and θ⁻¹ multiplicities, so each contributes
one, giving the labelled weights. Faltings semisimplicity is applied to
the Jacobian H¹ before taking the character summand. Common polynomials
come from the action of the deck correspondences over F on the compatible
cohomology of the curve; retain the chosen character labels under every
coefficient embedding.

**API.** The stored member at each prime is identified with the
θ-eigenspace; rank, determinant and all labelled weights are as stated;
weak compatibility holds with the finite bad set; the reflection pairing
just described is part of the data; and finite base change is identified
with restriction on the same shared carrier, transporting
the coefficient choices. No field of definition for a member smaller than
its specified finite realization extension is inferred.

**Checks.**

- θ=1 gives the H¹ of the elliptic quotient B_t, still rank two and
  determinant ε⁻¹, not a trivial representation of dimension one.
- Ordinary cup product pairs θ with θ⁻¹ and need not restrict perfectly
  to θ itself. Inserting w is essential when θ has order three or p.
- A putative rank-two member with weights {0,2} or determinant ε is
  excluded. In the fixed Hodge convention the cup-product value Q̄_ℓ(−1)
  has weight 1, agreeing with the sum 0+1.
- Finite coefficient extensions and changes of ℓ preserve the abstract θ
  through j_ℓ. Replacing θ by an unrelated conjugate at one prime would
  not meet the common-polynomial comparison used in Layer 8.

### 4.2 Quotient realizations and the second elliptic curve

The target **`character_order_quotient`** identifies the θ-part for an
order-m character of μ_n with the corresponding primitive part of H¹(C_m).
Pullback along C_n→C_m is an isomorphism onto the invariants of its kernel
over Q̄_ℓ. Its inverse is the normalized norm over the characteristic-zero
coefficient field. This is a rational statement, even at ℓ|n/m.
For θ=1, the quotient gives **`trivial_character_twist`**:
`V₁=H¹(B_t)`. (OpenAI Proposition 5.2, p.13.)

For n divisible by three let η have order three. Form the actual smooth
proper reflection quotient `D_t=C₃(t)/⟨w⟩` and define the elliptic curve
**`auxiliaryEllipticCurve`** to be `A_t=Pic⁰(D_t)`. The target
**`cubic_character_elliptic`** proves D_t has genus one and
`V_η≅H¹(A_t)` as systems over F, with the fixed embeddings. On the
trivial deck summand H¹(B_t), w is [−1]. On the two nontrivial summands it
exchanges V_η,V_η⁻¹. Hence the w-invariants have dimension two, and projection
`x+w*x↦x` identifies them with V_η. This computes the quotient's genus
and its realization. (OpenAI Proposition 5.2, p.13.)

**API.** A_t is the Jacobian of the actual quotient and is defined over k
before base change to F. The system isomorphism is given through pullback
and projection, and it is compatible with finite field extension and all
coefficient realizations. It supplies an origin on A_t,
not a point on D_t. The quotient construction is functorial in the marked
cover and reflection from Layer 1.

**Checks.**

- H¹(C₃) has dimension six: the trivial two-dimensional part contributes
  no w-invariants and the exchanged four-dimensional part contributes two.
  Taking all of that four-dimensional part would give the wrong genus.
- A genus-one quotient without a rational point still has an elliptic
  Pic⁰. Identifying D_t itself with A_t without choosing a point is not
  part of the construction.
- At the trivial character the curve is B_t; at an order-three character
  it is A_t. Both are elliptic endpoints but they are not asserted to be
  isogenous, since their residual representations need agree at only one prime.
- Pullback/norm composition is multiplication by the degree. It gives a
  rational isomorphism of the required subspaces, but is not asserted to be
  an integral isomorphism at primes dividing that degree.

### 4.3 Integral character evaluation

For t,F as above, fix ℓ and a finite coefficient extension L/Q_ℓ containing
j_ℓ(M), with valuation ring O and maximal ideal 𝔪. Use the actual deck action
to define **`characterLattice θ`**:

```text
T_θ = H¹_ét(C_n(t)_F̄,Z_ℓ) ⊗_(Z_ℓ[μ_n], θ) O.
```

It is an O-free rank-two G_F-stable lattice. After inverting ℓ it realizes
V_(θ,ℓ), with the character convention of §4.1. If θ and θ' have equal
reductions as evaluation homomorphisms `Z_ℓ[μ_n]→O/𝔪`, then
`T_θ/𝔪T_θ≅T_θ'/𝔪T_θ'` Galois-equivariantly. The proof tensors the single
free rank-two regular-module lattice of §3.1 and compares the two residual
base changes. This works when ℓ|n. (OpenAI Lemma 5.3, pp.13–14.)

**API.** The lattice is O-free of rank two; its rationalization is the
θ-eigenspace; equal evaluation maps give the residual comparison; and the
construction commutes with extension of O and its residue field. The G_F-action commutes with the
deck action because μ_n⊂F, so it descends through the tensor quotient.

**Checks.**

- For an order-p root ψ and residue characteristic p, ψ reduces to 1.
  Thus the evaluations for ηψ and η coincide modulo p; the lattice still
  has rank two rather than becoming an eigenspace of a nonsemisimple ring.
- At residue characteristic three, η reduces to 1, so ηψ and ψ have the
  same evaluation. An arbitrary pair of characters need not have equal
  reductions; equal dimensions alone gives no congruence.
- The characteristic-zero projector `(1/n)Σ θ(u)⁻¹u` does not define an
  integral projector at ℓ|n. The tensor quotient does not use it.
- If μ_n is not in the base field, Galois permutes the character labels.
  The asserted rank-two G_F-stable lattice is over F=k(μ_n), not over k
  without a descent argument.

### 4.4 The three congruences with their exact coefficient primes

Now let n=3p with p>3 prime, choose η of order three and ψ of order p, and
put χ=ηψ, of order 3p. The target **`prime_switch_congruences`** is

```text
V_η ≡_p V_χ,       V_χ ≡_3 V_ψ,       V_ψ ≡_p V₁.
```

It holds over F=k(μ₃p) for every number field k and every t∈U(k), with no
local, residual-image or automorphy hypothesis. The evaluation identities
in §4.3 prove the chain. At the ends use
`V_η≅H¹(A_t)` and `V₁≅H¹(B_t)` from §4.2. Rational comparison with a
smaller cover preserves the semisimplified residual representation even
if a natural integral pullback has nonunit index. Lattice independence
is invoked only after semisimplification. (OpenAI Corollary 5.4, p.14.)

The formulation deliberately distinguishes the lattice congruence supplied
on C_n from the resulting semisimple congruence on an elliptic endpoint.
It neither upgrades an arbitrary lattice quotient to a direct summand nor
claims an isomorphism of elliptic p-divisible groups.

**Checks.** Modulo p the order-p character disappears while the cubic one
remains; modulo three it is the cubic character that disappears. Reversing
these primes is false. The final link is at p, so the route needs the
mod-p residual conditions for both the cubic endpoint and the trivial
endpoint, while the middle lift needs the order-p piece at three. There
is no congruence at five in this chain; five is reserved for the seed.

### Examples

For a prime p>100 the chain has four rank-two systems, congruence primes
p,3,p, and only two elliptic realizations. None of the middle primitive
character systems is claimed to be an elliptic curve. Their ordinary or
toric local behavior will instead come from the Jacobian and the reflection
pairing. This prevents importing an elliptic local theorem at a middle link
without proving its hypotheses.

### Dependencies

Layers 1–3 provide quotient maps, reflection and integral freeness. The
shared compatible-system carrier comes from
SmallRamificationAndAbelianVarietyBaseCases §5.0d, with
compatibility predicates from the compatible-system owners. Faltings,
Hodge comparison and Néron-model §6.10 give semisimplicity, Hodge types and
geometric compatibility. JacobianChallenge supplies the unpointed genus-one
Pic⁰ used for A_t.

## Layer 5: Automorphy inputs and the auxiliary-prime choice

### 5.1 Decomposed genericity and a large original image

Use the supplier predicate **decomposed generic** for a residual rank-two
representation over a number field L: there is a rational prime q≠ℓ,
split completely in L, such that it is unramified at every v|q and the
ratio of its two Frobenius eigenvalues is neither q nor q⁻¹ in F̄_ℓ.
The unordered pair of eigenvalues is used, so this excludes both ratios.
Distinct eigenvalues alone suffice only when q≡1 mod ℓ.
(OpenAI Definition 6.1, pp.14–15.)

Prove **`nonCM_elliptic_large_residual_primes`**: for a number field k
and a geometrically non-CM elliptic E/k, all but finitely many rational
primes p satisfy `im(E[p]|G_k)⊇SL₂(F_p)`. This target owns the proof of
Serre's elliptic open-image input; his stronger mod-p surjectivity theorem
implies the stated inclusion. Geometric non-CM means that every
endomorphism over the algebraic closure is an integer multiple of the
identity; the k-rational version would be false, since `y²=x³−x` over ℚ
has CM only over ℚ(i) and a Cartan image at split primes. Apply the
theorem separately over any fixed finite extension, in particular the
normal closure of k, where E remains geometrically non-CM. No bound
independent of E and k is asserted.
(Serre, *Propriétés galoisiennes*, §4.2, Théorème 2, p.294.)
The route is Serre's. For p large, a proper subgroup of GL₂(𝔽_p) not
containing SL₂(𝔽_p) lies in a Borel subgroup or in the normalizer of a
Cartan subgroup, or has projective image A₄, S₄ or A₅
(ArithmeticGaloisRepresentations §§4.4–4.5). A Borel image at infinitely
many p gives k-rational cyclic isogenies of infinitely many prime degrees
into one member of the finite isogeny class of E, whereas the
homomorphisms from E to that member form an infinite cyclic group whose
nonzero elements have degree a square times a fixed integer
(FaltingsFinitenessAndIsogenyTheorems R28.6.5–R28.6.6). The exceptional
images are excluded once p≥7 by the image of inertia at a place of good
reduction above a prime p unramified in k: it contains a semisimple
element of projective order p−1 (good ordinary) or p+1 (supersingular),
larger than every element order of A₄, S₄ and A₅. This inertia
computation is proved here from the tame and fundamental characters of
ArithmeticGaloisRepresentations §2.3 and the formal group and reduction
of EllipticCurves Layers 1 and 4. The Cartan-normalizer case is excluded,
as in Serre, through the p₀-adic image at one fixed auxiliary prime p₀,
using the finiteness of the quadratic characters of G_k unramified
outside a fixed finite set (Mathlib `NumberField.finite_of_discr_bdd_of_isReal`
and `NumberField.finite_of_discr_bdd_of_isComplex`), the integrality of
Frobenius traces and Chebotarev (ArithmeticGaloisRepresentations
§§4.2–4.7); the openness of that p₀-adic image for a
geometrically non-CM curve is proved here from the semisimplicity and Hom
comparison of FaltingsFinitenessAndIsogenyTheorems R28.6.2–R28.6.3 and
the Hodge–Tate weights 0 and 1 of the Tate module at a place of good
reduction (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.19). Nothing
here depends on a uniform bound.
`Suggested.lean` states `nonCM_elliptic_large_residual_primes` using
`TauCeti.Isogeny.Hom` over the algebraic closure for the geometric non-CM
hypothesis and `WeierstrassCurve.torsionGaloisAction` on actual p-torsion.
For every sufficiently large prime and every torsion basis, each matrix
in SL₂(𝔽p) is realized by a Galois automorphism. The basis type is
inhabited by Tau Ceti's rank-two finite-torsion theorem.

*Needs:* ArithmeticGaloisRepresentations Layers 1–2, §§2.3, 4.4–4.5 and
[§6.1 `TateModule.residualRep`](../ArithmeticGaloisRepresentations/README.md#elliptic-residual-representation),
with §6.2 for its determinant; FaltingsFinitenessAndIsogenyTheorems
R28.6.2–R28.6.3 and R28.6.5–R28.6.6; FiniteFlatGroupsAndIntegralPadicHodgeTheory
R07.1.19; EllipticCurves Layers 1 and 4; Mathlib
`NumberField.finite_of_discr_bdd_of_isReal` and
`NumberField.finite_of_discr_bdd_of_isComplex`; Chebotarev through
ArithmeticGaloisRepresentations §§4.2–4.7. Its §4.7 supplies restriction
and persistence after this existence theorem, rather than its proof.

**Checks.**

- For y²=x³−x over Q(i), the CM action puts the image in a Cartan;
  for split p>3 it cannot contain SL₂(F_p). Geometric non-CM is essential.
- The non-CM curve y²=x³−x²−x over Q has rational two-torsion and
  c₄=64, Δ=80 and j=c₄³/Δ=16384/5, so its mod-2 image fixes a nonzero
  vector and is not SL₂(F₂). The finite exceptional set cannot be discarded.
- After replacing k by its normal closure, geometric non-CM persists.
  Apply the theorem over that field and discard its finite exceptional set
  before imposing p>max{100,2[k:Q]+1}; an image assumption over k alone
  does not justify the stronger choice over the normal closure.

For a non-CM E over an imaginary quadratic K choose p>100 with
`im(E[p]|G_K)⊇SL₂(F_p)` using
`nonCM_elliptic_large_residual_primes`. Put
n=3p and F=K(μ_n). The target **`cyclotomic_switch_field`** proves F/K
is abelian, F/Q is abelian and F is CM. It also proves ζ₅∉F: Q(μ₃p)
is unramified at five, so the ramification index at five in its compositum
with the quadratic K is at most two; Q(ζ₅) would require index four.
(OpenAI §5, p.11.)

**Checks.**

- q≡1 mod ℓ reduces the forbidden ratios to 1. For q≠1 mod ℓ, distinct
  eigenvalues can still have forbidden ratio q, so the full definition is kept.
- p>100 excludes 3 and 5; n is odd and Q(μ₃p) is unramified at five.
  Including p=5 would invalidate the ζ₅ exclusion and the stated lifting route.
- K may itself ramify at five; the ramification index bound is still two.
  Unramifiedness of K at five is not imposed.
- The commutator of SL₂(F_p) is SL₂(F_p) for p>3. Thus restricting to
  the abelian extension F/K preserves this subgroup. A statement for p=3
  using perfectness would fail.

### 5.2 The exact lifting theorem applied at three and p

Prove **`potentiallySemistableCM`**, the unrestricted CN Theorem 5.2,
using CrystallineLocalGlobalCompatibilityCM's qualified lifting export and
the preparation dichotomy of §0.1. Its hypotheses are:
L is CM, ℓ is odd, and
`r:G_L→GL₂(Q̄_ℓ)` is continuous, finitely ramified, determinant ε_ℓ⁻¹,
and potentially semistable at every v|ℓ with all labelled weights {0,1}.
Its residual semisimplification, valued in GL₂(F̄_ℓ), is decomposed
generic and irreducible on G_(L(ζ_ℓ)); over the algebraically closed
coefficient field this is absolute irreducibility, as in CN's hypothesis
(3). There is a cuspidal weight-zero regular algebraic
π of PGL₂(𝔸_L) whose residual representation is isomorphic to that of r. If ℓ=5 and the projective residual image on G_(L(ζ₅)) is PSL₂(F₅), require that the extension cut out by the projective representation of G_L does not contain ζ₅.
At each v|ℓ require one of:

1. The target r is potentially crystalline, potential ordinarity of weight zero is equivalent in r and the seed realization, and the
   automorphic parameter rec(π_v) has N=0.
2. Neither local Galois representation is potentially crystalline, and π_v
   is ι-ordinary of weight zero.

Then r is realized by a cuspidal weight-zero regular algebraic Π of
PGL₂(𝔸_L). (OpenAI Theorem 6.2, p.15; CN Theorem 5.2 and Remarks
5.2.1–5.2.3, pp.73–74.) When `[L(ζ_ℓ):L] ≠ 3` or the projective
residual image is not A₄, apply the qualified potentially Barsotti–Tate
lifting theorem of CrystallineLocalGlobalCompatibilityCM §9.12 directly.
For the remaining cases use `cm_lifting_preparation_dichotomy`: a
trace-violating element supplies the auxiliary smooth places, while the
trace-identity branch first passes to L(ζ_ℓ), retaining the all-places
generic witness and the absolutely irreducible cyclotomic image. Apply
the special-case automorphy lifting of CrystallineLocalGlobalCompatibilityCM
§9.10 over the prepared field
and descend to the specified r. Thus no unrestricted finite-group
reducibility criterion is needed. The supplier retains its qualification;
the additional preparation argument supplies the full statement here.

The geometric switch applies the theorem at ℓ=p,3,p over F=K(μ₃p),
which already contains the corresponding roots of unity. The elliptic
seed uses only 3 and 5, whose cyclotomic degrees divide 2 and 4 and
hence satisfy the supplier's qualification. No additional adequacy,
enormousness, polarization or scalar-outside-cyclotomic hypothesis is
inserted, including at residual SL₂(F₃).

*Needs:* CrystallineLocalGlobalCompatibilityCM §§9.10–9.12;
§0.1 `cm_lifting_preparation_dichotomy`;
GL2AutomorphicRepresentationsAndTransfer R17.4.

The target **`switch_lifting_hypotheses`** is the application interface:
for two systems in one adjacent row of §4.4, suppose the residual conditions
of Layer 7 and the local type conclusions of Layer 6, and suppose the first
system is realized by a cuspidal weight-zero PGL₂ representation. After the
coefficient and automorphic-local comparisons of §8.1, the second meets
every condition above. Its proof is supplied row by row in §8.3 rather than
by an unconnected bundle of arbitrary propositions.

**Checks.** A supersingular potentially crystalline target cannot use an
ordinary crystalline seed. A toric target cannot use a potentially crystalline
seed, even if their semisimplified residual representations agree. N=0 on
the seed's automorphic parameter is a separate condition from potential
crystallinity of its Galois realization, and is proved in §8.1. Places with
ramified finite-order quadratic characters remain allowed in the ordinary
Steinberg alternative.

### 5.3 The independently modular elliptic starting point

Prove **`cm_modularity`**, the CN elliptic residual criterion: for any CM
number field L with ζ₅∉L and elliptic A/L, if for some ℓ∈{3,5} its mod-ℓ
representation is decomposed generic and absolutely irreducible on
G_(L(ζ_ℓ)), then A is modular. For non-CM A the conclusion is a cuspidal
weight-zero PGL₂ realization of H¹(A); geometric CM retains the character
branch. No Galois-over-Q assumption on L is imposed. Use §0.3 `switch_five`
or `switch_three` at the chosen ℓ and §5.2 `potentiallySemistableCM`.
The geometric prime switch uses the ℓ=5, non-CM specialization. Duality translates
the covariant elliptic residual convention to H¹ and preserves these two
residual properties. (OpenAI Theorem 6.3, p.15; CN Theorem 6.1 and
Lemma 6.1.3, pp.87–88.)

The proof uses the independently modular auxiliary curves of §0.3, prescribed local types and soluble descent. Choose the avoidance field to include the residual kernel, its cyclotomic extension and L(ζ₅). Good ordinary and supersingular places use the matching crystalline alternative; potentially multiplicative places use the ordinary noncrystalline alternative. At five retain the full projective-field exclusion; ArithmeticGaloisRepresentations §4.7(f), the CN Lemma 6.1.4 elliptic projective-field exclusion, supplies it over the auxiliary CM field, whose ζ₅ exclusion is preserved by the avoidance condition. At three the exceptional five-adic clause is absent. Its underlying AKT ordinary/dihedral inputs are proved in §0.1. This proof is independent of the geometric prime switch.
The target **`auxiliary_seed_automorphic`** applies it to A_t over F, using
§5.1 for ζ₅∉F and §7.4 for the actual residual conditions and non-CM.

**Checks.** The seed is used at five exactly once. The three later lifts
are at p,3,p. If A_t were CM, the stated non-CM cuspidal seed contract
would not apply; non-CM is proved by two noncommuting odd-order unipotents.
For a general CM base K, ζ₅∉K alone would not imply ζ₅∉K(μ₃p); the
imaginary quadratic ramification proof is essential here.

### Examples

The chain needs lifting at ℓ=3, where residual adequacy is particularly
unhelpful as an extra hypothesis. Its two geometric unipotents supply the
required absolute irreducibility directly. The initial mod-5 elliptic
criterion supplies a cuspidal seed; its independent proof and the full lifting theorem use Layer 0.

### Dependencies

Layer 4 supplies the systems and congruences. Layer 0 consumes the CN
arithmetic and prepared patching exports, supplies the additional
cyclotomic preparation and AKT inputs, and retains the independent elliptic
seed and prescribed-type construction. The local–global, deformation and automorphic suppliers in the exact supplier table provide the underlying carriers and comparisons. Section 5.1 `nonCM_elliptic_large_residual_primes` supplies large-prime
existence;
ArithmeticGaloisRepresentations §§4.2–4.7 supplies restriction and the
perfectness of SL₂(F_p). No small
modular-curve point computation is a prerequisite.

## Layer 6: Prescribing reduction in local parameter opens

### 6.1 Local constancy of finite torsion, including residue-prime torsion

For a finite extension L/Q_r, a smooth L-variety X, an abelian scheme
A→X, a point x₀∈X(L), and an integer N≥1, prove
**`finite_torsion_locally_constant`**: some analytic neighborhood Ω of x₀
has G_L-equivariant isomorphisms `A_x[N]≅A_x₀[N]` for every x∈Ω.
The order N may be divisible by r. These are finite étale group schemes
over the characteristic-zero parameter variety, not over its residue field.
The level-isomorphism torsor is finite étale and the L-adic inverse function
theorem at the identity-level point supplies a local section.
(OpenAI Lemma 7.1, p.16.)

Retain the group structure and the action of G_L in the level torsor;
constancy of the abstract number of torsion points would say nothing about
the local representation. Shrink to a neighborhood on which the section is
defined. No global trivialization of A[N] over all of X is asserted.

**Checks.** At N=1 this is the unique zero torsion group and imposes no
useful reduction constraint. At N=r the statement still holds because L
has characteristic zero. It does not say that a group scheme over a
characteristic-r special fiber is étale: ordinary and supersingular
r-divisible groups remain different. An empty local open would give no
specialization; the construction contains x₀.

### 6.2 A finite set of full Tate-module Frobenius polynomials

Fix g≥1 and a local field L with residue cardinality Q>1. For a semistable
g-dimensional abelian variety A/L and an auxiliary odd prime d≠r, choose
an arithmetic Frobenius lift on the full covariant V_d(A). The target
**`full_tate_polynomial_finite`** proves its polynomial is an integral
monic degree-2g polynomial from a finite set depending only on g,Q,
independent of d and the Frobenius lift. If the toric rank is s, its graded
roots consist of s roots of absolute value Q from the torus, s roots of
absolute value 1 from the lattice, and 2(g−s) roots of absolute value √Q
from the abelian quotient. Thus the polynomial determines s and, if s=0,
the Newton polygon of the good special fiber.
(OpenAI Lemma 7.2, pp.16–17.)

Write the polynomial `T^(2g)+Σ_(j=1)^(2g) a_jT^(2g−j)`. Every root has
absolute value ≤Q, so `|a_j|≤binom(2g,j)Q^j`; bounded integral coefficients
give finiteness. The finite torus/lattice action and the good abelian
Frobenius give integral, d-independent graded polynomials. Unipotent
inertia changes the extension but not these diagonal blocks, proving
independence of the Frobenius lift. This argument uses all 2g dimensions,
not just the inertia invariants.

**Checks.**

- For a split Tate elliptic curve the full polynomial is `(T−1)(T−Q)`.
  The invariant local Euler factor has degree one and loses a graded root;
  substituting it would not satisfy this construction.
- For a good ordinary elliptic curve over residue size r, the slopes are
  0,1; for a supersingular elliptic curve they are 1/2,1/2. At s=0 the
  same polynomial distinguishes these Newton polygons.
- Q=1 would merge the absolute-value ranges 1,√Q,Q and cannot detect
  toric rank. It is excluded by the local-field residue hypothesis.
- At g=0 the polynomial is 1 and the rank is zero, but it supplies no
  ordinary/supersingular distinction; later type conclusions use g≥1.

### 6.3 Local constancy of toric rank and Newton polygon

Let A→X,x₀,L be as in §6.1, with relative dimension g≥1. Prove
**`local_reduction_constancy`**: there is a finite extension L'/L and a
nonempty neighborhood of x₀ such that all nearby fibers over L' are
semistable with the same toric rank as A_x₀ over L'; if that rank is zero,
they have the same Newton polygon. Choose first one L' making A_x₀
semistable and rationalizing its d-torsion for an odd d≠r. Local constancy
of d-torsion makes inertia act on all nearby Tate modules through
`1+dM_(2g)(Z_d)`. The semistable criterion and odd d force its finite
semisimple inertia eigenvalues to be 1, giving semistability. Then choose
j sufficiently large so reduction modulo d^j separates the finite set of
polynomials in §6.2. Apply §6.1 again to A[d^j]; nearby Frobenius
polynomials coincide, fixing the toric rank and good Newton polygon.
(OpenAI Proposition 7.3, pp.17–18.)

**Checks.**

- Rational two-torsion would not suffice for this semistability step:
  −1≡1 mod 2 is a nontrivial finite-order inertia eigenvalue. The
  auxiliary d is odd.
- At potentially good ordinary A_x₀≅E₀^g, all nearby good fibers have
  exactly g slopes 0 and g slopes 1, hence are ordinary. At a supersingular
  E₀^g all 2g slopes are 1/2, a stronger conclusion than “nonordinary”.
- At a totally toric A_x₀ the nearby toric rank is g. Preserving only
  “bad reduction” would be insufficient for the rank calculation below.
- The fixed extension L' works on a whole neighborhood; an extension
  chosen separately for each point would not be the stated local family result.

### 6.4 Full monodromy rank in the totally toric case

For any g-dimensional abelian A over a local field L/Q_r which becomes
semistable of toric rank g, prove **`totally_toric_monodromy_rank`**: N on
WD(H¹(A,Q_d)) has rank g for every coefficient prime d, including d=r.
Rank is unchanged by a finite field extension, so split the torus and its
period lattice. The periods q_ij have nonsingular valuation matrix
`(v_L(q_ij))`. For d≠r this is the standard toric monodromy pairing.
(OpenAI Lemma 7.4, pp.18–19.)

For d=r use the semistable extension
`0→Q_r(1)^g→V_r(A)→Q_r^g→0` whose classes are the Kummer classes of q_ij.
The induced monodromy map between the two graded D_st spaces has a kernel
stable under unramified Frobenius, by `Nφ=rφN`. If its rank were smaller
than g, finite unramified Galois descent gives a nonzero vector in Q_r^g
in that kernel. Pulling back along its line gives a crystalline Kummer
extension. Coordinatewise the crystalline Kummer classes have valuation
zero, contradicting nonsingularity of the valuation matrix. Duality
preserves rank and proves the H¹ statement. This argument uses Q_r-linear
descent, not an assertion that the kernel already contains a rational
Q-vector. The residue-prime monodromy is indispensable at the middle lift.

**Checks.** For a split Tate elliptic curve the valuation matrix is the
one-by-one matrix `[v(q)]` with v(q)>0, so N has rank one at every prime.
For its g-fold product it is a nonsingular diagonal matrix and N has rank g.
Good reduction has N=0 and cannot enter the totally toric conclusion for
g>0. In all cases N²=0 for an abelian H¹, so rank g is the maximum in
dimension 2g; higher nilpotency is not inferred.

### 6.5 Pulling the neighborhood back to the original parameter line

Set n=3p and F=k(μ_n). Given any finite set S of finite places of k
containing all those above 3p, construct **`local_type_opens`**: for every
v₀∈S a nonempty analytic open Ω_v₀⊂U(k_v₀) such that any t in all these
opens has the following property at **every** v of F above v₀. The
Jacobian J_t=Pic⁰(C_n(t)) has, after a fixed extension of F_v independent
of t, the same one of these potential types as E:

- good ordinary, with slopes 0 and 1, each of multiplicity n;
- good supersingular, with all 2n slopes 1/2;
- semistable totally toric, of toric rank n.

Here the original E is elliptic, so these exhaust its potential reduction
possibilities. (OpenAI Proposition 7.5, p.19, with Proposition 7.3.)

Use the constant-E parameter cover and the compact-type abelian scheme
near O with fiber E^n from §2.2. Apply §6.3 at each completion of F;
intersect the finitely many resulting neighborhoods after restriction from
k_v₀. Choose a nonzero R₀=(t₀,s₀) in E(k_v₀) sufficiently near O and
away from the finitely many forbidden points and the branch of x. The
inverse function theorem provides s(t) with s(t)²=h(t), so
`(x,y)↦(x,s(t)y)` identifies B_t with E throughout a local open in the
t-line. Normalization f(O)=1 makes the pulled-back covers coincide,
without an uncontrolled scalar Kummer twist. This descends the local
condition to t∈k_v₀ rather than leaving it on E(F_v).

**API.** Each Ω_v₀ is nonempty, with a witness in U(k_v₀); the asserted
condition holds at every v|v₀ with its fixed semistabilizing extension;
and the local isomorphism B_t≅E is compatible with the normalized cover. The opens may be shrunk and
additional finitely many local constraints intersected when nonempty.

**Checks.**

- O itself lies outside the original affine U, so the witness is a
  nonzero nearby R₀, not the degenerate boundary point.
- An open found only in U(F_v) need not contain a k_v₀-point. Choosing
  R₀∈E(k_v₀) and applying the local x-chart supplies the required witness.
- The n leaves of the compact-type fiber give toric rank n when E is
  potentially multiplicative, not the rank n−1 of the other degeneration.
- Every v above v₀ is included before selecting t. One chosen embedding
  into a completion of F would not suffice for the global lifting theorem.

### 6.6 Characterwise local types

For t in the opens of §6.5 prove **`character_local_types`** at every v|3p
for each of the n characters θ. Let ℓ be the residue characteristic of v.
If E is potentially good ordinary, V_(θ,ℓ) is
potentially crystalline ordinary of weight zero; if E is potentially
supersingular, it is potentially crystalline and nonordinary, with both
slopes 1/2 after good reduction; if E is potentially multiplicative, it
is not potentially crystalline and its two-dimensional WD monodromy has
rank one. The rank-one monodromy assertion holds at every coefficient
prime, including ℓ. Potential crystallinity and the ordinary filtration
here refer to the member at the residue coefficient prime ℓ; at other
coefficient primes the potentially good cases instead give N=0 and
potentially unramified representations. (OpenAI Corollary 7.6, p.20.)

In the ordinary case the weight-zero slope filtration cuts out a line in
each character summand and is compatible with descent, giving potential
ordinarity. The all-slope-1/2 case cannot have that ordinary line. In the
toric case §6.4 gives total rank n for N on a direct sum of n spaces of
dimension two. N commutes with the deck action and each summand has N²=0,
so its rank is at most one. Their ranks sum to n; every summand therefore
has rank one. The argument does not assume the character summands are
elliptic curves.

**Checks.** The trivial and cubic character endpoints recover the same
potential type for B_t and A_t at these places. If only positive toric
rank were known for J_t, some character summand could have N=0; the total
rank n hypothesis is what excludes it. Nonordinary potentially crystalline
and noncrystalline are different alternatives: the supersingular case has
N=0, whereas the toric case has N of rank one.

### Examples

Prescribe potentially supersingular reduction at a place above three and
potentially multiplicative reduction at a place above p. The local opens
are chosen independently at those finitely many completions; one later
Hilbert point lies in their product. All four systems then have the same
appropriate local alternative at each place, including the residue-prime
N comparison at three. No global ordinary hypothesis on E is imposed.

### Dependencies

Layer 2 supplies the abelian extension of the Jacobian near O. The
abelian-scheme torsion supplier, local inverse function theorem and Néron
semistability criterion give local constancy. Néron-model §§3.10, 3.14 and
5.3 supply toric uniformization and semistable comparison; its §6.10 supplies
the coefficient-independent graded Frobenius polynomials. The finite-set
argument, local parameter pullback and characterwise rank deduction are
source-specific targets here.

## Layer 7: One specialization with all residual conditions

### 7.1 Geometric irreducibility and a regular word

For the pairs `(m,ℓ)=(3,p),(3,5),(p,3)`, evaluate the two common-basis
monodromies of §3.3 at every primitive order-m character. Since ℓ∤m,
its root λ stays nontrivial after reduction, and
`c(λ)=2−λ−λ⁻¹=−(λ−1)²/λ` is nonzero. The two matrices have distinct
unique fixed lines and no common invariant line after any coefficient
extension. The target **`character_geometric_irreducibility`** is absolute
irreducibility of each of these residual geometric representations.
(OpenAI Lemma 8.1, p.21.)

The light **`switchCoefficient`** is this scalar on a unit λ in any field.
The light **`switchMonodromyWord c σ τ k`** is
`[[1,σc],[0,1]] [[1,0],[τc,1]]^k` over any commutative ring. Its determinant
is one and its trace is `2+στkc²`. For determinant-one matrices in odd
characteristic, distinct eigenvalues are equivalent to trace different
from ±2. The target **`character_regular_word`** gives one common word
regular for every character in each pair and for every conjugate parameter
factor. For m=3 take k=2: c=3 and the two sign products give traces 20
and −16, regular modulo 5 and modulo p>100. For m=p,ℓ=3 take k=1.
A failure would imply c²=0 or ±4. The first is excluded; either remaining
equation makes λ a root of a nonzero polynomial of degree at most four
over F₃. It would lie in F_(3^e), e≤4, so its order p divides 3^e−1≤80,
contrary to p>100. Signs are allowed to vary; the word length still works.

**API.** Prove the coefficient's factorization, inversion symmetry and
nonvanishing criterion, and the word's exact determinant and trace.
For an order-p unit in characteristic three, p>100 prime, prove `c²≠4,−4`.
Identify the two fixed lines and prove noncommutation of the opposite
unipotents, as used for the auxiliary elliptic curve. The geometric identification
of these matrices with this family's image is the character evaluation of
`common_basis_monodromy` in §3.3;
the formula on arbitrary matrices alone does not assert geometric image.

**Checks.**

- For λ=1, c=0 and both matrices are the identity. This character is
  excluded from the geometric irreducibility statement. For λ=2 over Q,
  c=−1/2; for λ=−1, c=4; a cubic root gives c=3.
- The two k=2 traces at c=3 are 20 and −16. Modulo five these are 0 and
  4, neither 2 nor −2.
- k=0 leaves a single unipotent with trace 2, so it is not a regular word.
  In characteristic two, 2=−2 and the odd-characteristic reasoning cannot
  be reused; for c=1,k=2 the trace is 0.
- With upper and lower entries both 1, the products have diagonals (2,1)
  and (1,2). They do not commute, including in characteristic three.
  Nonzero entries on just one root would fail both the fixed-line and
  non-CM arguments.

### 7.2 Genericity of the original elliptic endpoint

For K imaginary quadratic and p,F as in §5.1, prove
**`original_endpoint_generic`**: for every t∈U(K), the mod-p representation
of V₁=H¹(B_t) is absolutely irreducible on G_(F(ζ_p)) and decomposed
generic. Since μ_p⊂F, this cyclotomic subgroup is G_F. Restriction of
E[p] to G_F has image SL₂(F_p), by perfectness and the abelian extension
F/K, and B_t is its quadratic twist. Twisting preserves absolute
irreducibility and eigenvalue ratios. (OpenAI Lemma 8.2, p.22.)

For the rational split prime in decomposed genericity, do not assume that E
and its K-conjugate are independent. Their joint image is a subdirect
product of two SL₂(F_p)'s. In SL₂(F_p), each of trace 2 and trace −2
has p² elements, while the group has size p(p²−1). In any subdirect
product, projection to either factor has uniform fibers. The fraction of
elements bad in one of the two factors is at most
`4p/(p²−1)<1`. Hence one element avoids both bad traces. Realize its
conjugacy class by a rational prime split in the constant cyclotomic
field; every prime over it has distinct eigenvalues. Since q≡1 mod p,
this is exactly decomposed genericity, simultaneously for the conjugates.
A quadratic twist only changes both eigenvalues by the same sign.

The geometric specialization below can be stated for a general number
field k of degree d. Apply §5.1 `nonCM_elliptic_large_residual_primes`
to E over the fixed normal closure of k, and choose p outside its finite
exceptional set with p>max{100,2d+1}. Thus E[p] over that normal closure
has SL₂(F_p) in its image. Adjoining
the required cyclotomic constants is abelian over that normal closure,
so perfectness preserves SL₂. Apply the same subdirect-product argument
to the d conjugate curves; independence is still unnecessary. The fraction
bound is `2dp/(p²−1)<1`, since each of the d projections has uniform
fibers and each excludes at most `2p²` of the `p(p²−1)` elements. This is
the generality of the residual image step used in §7.4, not a modularity
theorem over arbitrary k; the d-conjugate extension of OpenAI Lemma 8.2
is this roadmap's own argument.

**Checks.** A diagonal subdirect product, as for isomorphic conjugate
representations, still has a good element. A product-independence hypothesis
would wrongly exclude this example. At d=2,p=101 the bound is 404/10200<1;
at d=1 it is smaller. p=3 cannot be used for the perfectness argument.
A rational prime merely splitting in K but not in the relevant cyclotomic
constants need not satisfy q≡1 mod p and is not the witness chosen here.

### 7.3 Hilbert specialization with the constant-field quotient retained

Let W⊂A^d_Q be nonempty open, D/Q finite Galois and
`π₁(W)↠H↠Gal(D/Q)` a finite quotient compatible with the arithmetic
map. For a finite set of places v of Q and one nonempty local open in
W(Q_v) at each of them, prove
**`hilbert_full_quotient`**: some x∈W(Q) satisfies every open condition
and its specialization homomorphism `s_x:G_Q→H` is surjective. Moreover
`s_x(G_D)=ker(H→Gal(D/Q))`. Apply the IG.2 Hilbert-with-local-conditions
contract to the connected finite cover belonging to the quotient; the
connected fiber gives surjectivity. For the kernel identity, surjectivity
lifts any kernel element to G_Q and compatibility with D forces that lift
into G_D. (OpenAI Lemma 8.3, p.23.)

Connectedness of the cover is sufficient. Requiring geometric connectedness
would discard the constant-field quotient that is essential to make the
Chebotarev prime split in D. Conversely, applying Hilbert only after
discarding the constants would not prove the claimed G_D image. Normal
cores of the finite covers may be taken to put all conjugate character
representations into one finite Galois quotient.

**Checks.** For a constant connected cover D×W the specialization map is
the actual quotient G_Q↠Gal(D/Q), despite failure of geometric
connectedness. When D=Q the kernel identity reduces to surjectivity onto H.
For the cover Y²=T and a positive-real and 2-adic square neighborhood,
Hilbert specialization can still choose a rational nonsquare such as 17;
local splitting does not force a disconnected global fiber. These are
applications of the imported Hilbert theorem, not new definitions in Lean.

### 7.4 Weil restriction and simultaneous specialization

Return first to an arbitrary number field k, non-CM E/k and sufficiently
large p as in §7.2. Let F=k(μ₃p), and let S be a finite set of finite
places of k containing all places above 3p. For each v₀∈S prescribe a
nonempty analytic open Ω_v₀⊂U(k_v₀). The target
**`simultaneous_specialization`** produces one t∈U(k) in all the prescribed
Ω_v₀, such that:

1. For each of `(m,ℓ)=(3,p),(3,5),(p,3)` and **every** order-m
   character, its residual V_θ is absolutely irreducible on G_(F(ζ_ℓ))
   and decomposed generic over F.
2. The residual V₁,p is absolutely irreducible on G_(F(ζ_p)) and
   decomposed generic.
3. A_t is non-CM.

The residual assertions remain valid after the coefficient extensions used
to contain all character values. The proof is OpenAI Proposition 8.4,
pp.23–25 for imaginary quadratic k; the same finite-quotient proof on d
factors, with the large-image hypothesis specified in §7.2, works for
arbitrary number fields, and that extension is carried out here.
This general statement retains the stronger prime choice over the normal
closure; choosing p from the image over k alone is not substituted for it.

Use `W=Res_(k/Q) U`, a nonempty open in A^d_Q. Its rational points are
U(k), and its Q_v-points are the products of U(k_w) over w|v. Over a
finite Galois D equal to the compositum of the normal closure of k with
Q(μ₃p,ζ₅), it splits
into d conjugate factors. Form a finite quotient H of π₁(W) containing
all the residual local systems in the three pairs, their conjugates and
this constant-field quotient. Separate geometric loops in the d factors
supply the two monodromies in each factor. Their common word from §7.1
is regular for all the characters being considered. Take normal cores
so conjugation permutes the full collection of factors and character
labels. Apply §7.3 to this one quotient and the product local opens.

The specialized G_D image contains the geometric monodromy, so it gives
absolute irreducibility after adjoining ζ_ℓ. The same kernel contains
the common regular element. Chebotarev applied to its conjugacy class
in the finite quotient of G_Q gives a rational prime q split in D,
away from all the ramification and coefficient primes. Every conjugate
Frobenius image is regular on every relevant factor and character, so
**all** places of F over q have distinct eigenvalues. Since ζ_ℓ∈D,
q≡1 mod ℓ; this proves decomposed genericity. Different pairs may use
different witness primes. The endpoint V₁,p is supplied by §7.2.

Finally the pair (3,p) puts two opposite nonidentity p-unipotents in the
residual H¹(A_t) image. They do not commute. If A_t had CM, its image
would have an abelian normal subgroup of index at most two, from the
field of definition of the CM endomorphisms. Both odd-order unipotents
would belong to that subgroup, a contradiction. This proves non-CM
without any assumption that the family has nonconstant j.

**API.** The output t has its actual memberships in U and all Ω_v₀; the
specified geometric image lies inside the specialized G_D image; for each
pair a rational split prime with the all-places eigenvalue condition is
supplied; and A_t is shown non-CM.
The images and witness primes refer to this same t. These outputs are a
single construction, not separately quantified existence assertions that
could choose incompatible parameters.

**Checks.**

- For k imaginary quadratic d=2, W has two conjugate factors. Controlling
  one of them would not prove the all-places condition for a rational
  split prime; both enter H before applying Hilbert.
- For d=1 there is one factor, and the same argument and the smaller
  trace union bound work. No imaginary or CM condition is needed for
  this specialization construction.
- Including ζ₅ in D does not assert ζ₅∈F. The former is needed for the
  (3,5) residual restriction; the latter must fail for the CM seed in
  the imaginary quadratic application.
- The two unipotents have order p>2. An element of order two could map
  nontrivially to the CM index-two quotient; this is why oddness matters.
- Local opens are imposed in W(Q_v), including every k-place over v;
  selecting independent t's at three and p would not produce this output.
- Finiteness of S is necessary: for k=Q enumerate U(Q) as {t_j}, choose
  distinct primes v_j away from 3p and a nonempty ball Ω_v_j excluding
  t_j. Adding opens at 3 and p gives infinitely many nonempty conditions
  with no rational parameter satisfying them all.

### Examples

When K=Q(i), no special property of the original mod-three or mod-five
image is assumed. Choose a sufficiently large p and one t. The cubic
character at five supplies the seed's residual conditions, the cubic
character at p supplies the first lift's conditions, and the p-th
character at three supplies the middle lift's conditions. The endpoint
at p already has the original curve's large image. This explains why
small residual exceptions of E disappear from the endpoint's hypotheses.

### Dependencies

Layers 3–4 supply integral monodromy and residual systems; Layer 6 supplies
nonempty local opens. Section 5.1 `nonCM_elliptic_large_residual_primes`
supplies large-prime existence over the normal closure.
ArithmeticGaloisRepresentations §§4.2–4.7 supplies image persistence,
subdirect-product reasoning and Chebotarev. IG.0 and IG.2 supply
finite arithmetic fundamental-group quotients and Hilbert irreducibility
with local conditions. The Weil restriction, the joint quotient and the
all-character/all-conjugate deduction are the new application here.

## Layer 8: Three lifts, descent and the full modularity theorem

### 8.1 Changing coefficient prime and recovering automorphic local types

Prove **`character_automorphy_change_prime`**: if a weight-zero regular
algebraic cuspidal π realizes one member of V_θ, it realizes every member,
using the coefficient embeddings fixed in §4.1. Outside one finite set,
the good-place Frobenius polynomials of V_θ and of π agree at the original
prime and hence as algebraic polynomials. They then agree after every
coefficient embedding. Semisimplicity of both representations and
Chebotarev–Brauer–Nesbitt give the isomorphism at the next prime.
(OpenAI Lemma 9.1, p.25.) This does not yet identify all bad-place monodromy.

Prove **`character_automorphic_local_type`** for such a cuspidal PGL₂ π
and a place v|ℓ, ℓ∈{3,p}, at a specialization of §7.4. In the potentially
good case `N(rec(π_v))=0`. In the totally toric case π_v is a trivial or
quadratic twist of Steinberg and is ι_ℓ-ordinary of weight zero. For the
proof choose an auxiliary coefficient prime a different from the residue
characteristic of v. Use the preceding theorem to identify r_(π,a) with
V_(θ,a), then Varma's semisimplified **Weil** comparison. In the good
case the two eigenvalues have equal complex absolute value after potential
good reduction; nonzero N in rank two would force a norm ratio, so is
impossible. In the toric case §6.6 gives rank-one N and Weil roots with
norm ratio. With that Weil semisimplification the local Langlands
possibilities are the special parameter or the zero-N parameter of a
one-dimensional, nongeneric GL₂ representation. Cuspidality makes every
π_v generic and excludes the latter. Trivial central character makes
the Steinberg twist quadratic. Prove the local ordinary calculation also for ramified quadratic twists at sufficiently deep level: pass to the level on which the finite character is trivial, retain the unit normalized U_v eigenline and transport it with the twist. This is automorphic ι-ordinarity in CN’s convention, rather than the stronger unramified-quotient Galois convention.
(OpenAI Lemma 9.2, pp.25–26; CN Lemma 6.1.3(4), p.88.)

**Checks.** A semisimplified Weil comparison alone permits both the
Steinberg and nongeneric alternatives, so it cannot be called full WD
compatibility. Equal good-reduction root sizes exclude N because Q>1;
this argument would fail with the fictional value Q=1. In the toric
case genericity, rather than an assumed monodromy equality for arbitrary
nonselfdual π, selects Steinberg. A ramified quadratic twist need not
be spherical and remains permitted in the ordinary alternative.

### 8.2 The starting elliptic curve

Now specialize to imaginary quadratic K and F=K(μ₃p). Choose t from
§7.4 inside the opens from §6.5. By §4.2, V_η=H¹(A_t), and by §7.4
A_t is non-CM, its mod-5 residual representation is decomposed generic
and absolutely irreducible on G_(F(ζ₅)). Since ζ₅∉F by §5.1, apply the
elliptic starting criterion §5.3. This proves
**`auxiliary_seed_automorphic`**, a cuspidal weight-zero representation
π_η of PGL₂(𝔸_F) realizing V_η. (OpenAI Proposition 9.3, first paragraph,
p.26, using Theorem 6.3.)

The seed theorem supplies all-coefficient elliptic compatibility through
§0.3. In particular it supplies the member at p needed for the first
congruence. This is the only invocation of a modularity criterion at
five. Its local five-adic proof is §0.3 and §5.3; the new local
opens here were imposed at three and p.

### 8.3 The lifting table with every hypothesis attached

The target **`three_lift_automorphy`** constructs cuspidal weight-zero
PGL₂ representations realizing V_χ,V_ψ,V₁ in that order. The common
specialization and coefficient conventions are fixed throughout.
(OpenAI Proposition 9.3, p.26.)

| Lift | Residual isomorphism | Cyclotomic irreducibility and decomposed genericity | Local input at every place over the lifting prime |
|---|---|---|---|
| V_η → V_χ at p | §4.4, reduction of ψ to 1 | §7.4 for the order-three piece at p; the isomorphism gives the same residual for χ | §6.6 gives both local Galois types; §§0.3, 8.1 give the seed's N=0 or ordinary Steinberg type. |
| V_χ → V_ψ at 3 | §4.4, reduction of η to 1 | §7.4 for every order-p piece at three | Change π_χ to coefficient three by §8.1; both local Galois types come from §6.6, and the automorphic N/ordinary condition from §8.1. |
| V_ψ → V₁ at p | §4.4, reduction of ψ to 1 | §7.2 for V₁,p, and the residual isomorphism for ψ | Change π_ψ to coefficient p by §8.1; §6.6 and the automorphic-local comparison give the same alternative between potential crystallinity and its failure. |

Every target member has determinant ε⁻¹, finite ramification, labelled
weights {0,1} and potential semistability by §4.1. At a potentially good
ordinary place the seed and target are both potentially crystalline and
potentially ordinary of weight zero. At a potentially supersingular place
both are potentially crystalline and neither is potentially ordinary. These
crystalline comparisons use the fixed semistabilizing extensions of §6.5.
At a potentially multiplicative place neither is potentially crystalline,
and the seed is automorphically ordinary. Thus the exact alternatives of
§5.2 hold at **every** place above the relevant prime in each row. All
residual comparisons are semisimplified and absolutely irreducible, so
they give the residual isomorphism required by the lifting theorem.
At no point is the original E[3] or E[5] required to be irreducible.

**Checks.**

- The middle lift uses three, not the seed prime five; the last lift returns
  to p. Omitting the change of coefficient prime after the first row would
  leave no residual matching at three.
- A local supersingular place uses the potentially crystalline alternative
  without potential ordinarity; assuming ordinarity everywhere would weaken
  the endpoint.
- The large prime is p>100 and the other lifting prime is three. The
  exceptional five-adic projective-field clause is absent in these three rows.
- Take p=103, K=Q(i) and E: y²=x³+103x+103². Tate inertia at five
  gives a residual transvection since Δ=−16·103³·2785 and v₅(Δ)=1.
  Here c₄=−48·103. At eleven #E(F₁₁)=8, so a₁₁=4 has
  discriminant 75, nonsquare modulo 103; the Frobenius over K is its square
  and still irreducible, with discriminant 67=4²·75 modulo 103. Thus the
  image contains SL₂(F₁₀₃). At 103, v(Δ)=3 and v(c₄)=1 give type III.
  In F=K(μ₃₀₉) the ramification index is 102 and the minimal discriminant
  valuation is 6, with 102·3≡6 mod 12. Hence E remains bad but potentially
  good over F_v. The local splitting B_t≅E in §6.5 makes V₁ potentially
  crystalline but not crystalline over F_v.

### 8.4 Descent of the same representation, then removal of the twist

Prove **`cyclic_representation_descent`** for a prime-cyclic CM extension
L'/L: if a continuous semisimple rank-two representation r of G_L has
absolutely irreducible restriction to G_L' realized by a weight-zero
cuspidal Π over L', then r itself is realized by a weight-zero cuspidal
representation over L. Conjugation invariance of r|G_L' and strong
multiplicity one make Π Galois invariant. Cyclic descent supplies π₀.
After coefficient extension, the attached r_(π₀) and r restrict to the
same irreducible representation, so `r_(π₀)≅r⊗δ` for a character δ of
Gal(L'/L). Twist π₀ by the Hecke character corresponding to δ⁻¹ under
the fixed reciprocity convention, fixing
the equality over G_L. (OpenAI Lemma 9.4, p.27.)

The target **`switch_descent_to_original_curve`** applies this through
a prime-cyclic tower of the abelian extension F/K. Every intermediate
field contains imaginary quadratic K and is CM. The non-CM elliptic
B_t has absolutely irreducible H¹ after finite extensions: Faltings
semisimplicity and the Tate Hom comparison identify its commutant over any
finite extension L with `End_L(B_t)⊗Q_ℓ=Q_ℓ`, giving absolute irreducibility
(FaltingsFinitenessAndIsogenyTheorems §§R28.6.2–R28.6.3). Thus the restriction hypothesis is satisfied at
every step. Start with the realization of V₁=H¹(B_t) from §8.3. The
result over K realizes H¹(B_t), not merely its restriction to F.
Finally use `B_t⊗χ_(h(t))≅E` in H¹ and twist the automorphic
representation by that same quadratic character. This gives the
non-CM automorphic realization for E. (OpenAI §9.3, p.27.)

**Checks.** At a quadratic descent step there can be two descents differing
by its nontrivial quadratic character; equality after restriction alone
cannot distinguish them. The δ⁻¹ correction is therefore part of the
theorem. Twisting twice by χ_(h(t)) is the identity, as h(t)≠0. For the
split example h(t) a square the twist character is trivial. Without
absolute irreducibility after restriction, the difference between two
extensions need not be a single character; that hypothesis is retained.
The cubic scalar witness modulo seven has δ=2 and δ⁻¹=4:
`2·4=1`, whereas `2·2=4≠1`. This scalar calculation pins the correction's
inverse direction; the Hecke-character comparison itself uses the
supplier's reciprocity convention.

### 8.5 All coefficient primes, finite places and the complex parameter

Apply §0.3 to the now modular non-CM E/K to obtain one π_E with trivial
central character realizing H¹(E) for every prime ℓ and every coefficient
isomorphism. Prove **`elliptic_full_local_comparison`**:

```text
ι WD(H¹_ét(E_K̄,Q̄_ℓ)|G_Kv)^(F-ss)
       ≅ rec_Kv(π_E,v ⊗ |det|_v^(−1/2))      (v finite, v∤ℓ).
```

The equality retains N, by the elliptic pure-parameter comparison, rather
than being asserted for every intermediate nonselfdual representation.
The local factor at v|ℓ is the same elliptic factor as well: at good
reduction compare crystalline Frobenius; at potentially good bad reduction
the nontrivial finite inertia action in the determinant-one rank-two WD
parameter has no invariants, so its factor is 1; at potentially
multiplicative reduction the quadratic Tate uniformization gives the
same rank-one-invariant factor, or factor 1 when the quadratic character
is ramified. These cases compare local factors at the residue coefficient
prime without misapplying an away-prime theorem there.
(OpenAI §9.4, pp.27–28; CN Lemma 6.1.3, p.88.)

Define the light **`complexInfinityParameter z`** to be the diagonal matrix
`diag(z/|z|,conjugate(z)/|z|)` on C, used as a group parameter on C×.
The target **`elliptic_complex_parameter`** identifies the complex local
Langlands parameter of π_E with its restriction to C×. Genericity and
weight zero specify the Hodge types (1,0),(0,1) in unitary normalization.
It follows that **`elliptic_L_function_identity`** is
`L(E/K,s)=L(π_E,s−1/2)`, with the finite factors and the corresponding
archimedean normalization. At a good finite place q,a, the eigenvalues
α,β of H¹ satisfy α+β=a,αβ=q; unitary Satake roots are
α/√q,β/√q, so evaluation at s−1/2 gives exactly
`(1−a q^(−s)+q^(1−2s))⁻¹`. This two-root computation fixes the shift's
direction. (OpenAI Theorem 1.1, p.1, §2, p.4, §9.4, p.27.)

**API.** Prove determinant one for z≠0, multiplicativity of the matrix
formula and exchange of the two entries under conjugation.
For q=4,α=β=2 the two geometric Euler factors have product
`(1−2T)²=1−4T+4T²`, and the unitary roots are both 1, so the variable
change T_unitary=2T_cohomological recovers them. The local Satake and
Hodge comparisons use their actual supplier carriers.

**Checks.**

- At z=i the diagonal is (i,−i), trace zero and determinant one. Using
  (i,i) would give determinant −1 and the wrong central character.
- At z=2 the parameter is the identity; at z=−1 it is minus the identity.
  Its totalized matrix at z=0 is zero and has determinant zero, so the
  group domain must be C×.
- At a split Tate place N has rank one and its Euler factor has degree
  one. A potentially good bad place with nontrivial inertia has degree
  zero, whereas a good place has degree two. Equal Weil semisimplifications
  alone would not recover these three Euler factors without N.
- For the q=4,α=β=2 witness, the cohomological polynomial has middle
  coefficient −4 and quadratic coefficient 4. Reversing the variable
  scaling or the sign of the half-shift would fail this two-term check.

### 8.6 CM curves and the unconditional endpoint

For a geometrically CM elliptic E/K let M be its imaginary quadratic
endomorphism field. The endomorphisms are defined over KM. The target
**`cm_elliptic_realization`** writes H¹(E)|G_KM as the two corresponding
algebraic Hecke-character realizations, with the cohomological infinity
type and the fixed Tate normalization. More precisely, CM endomorphisms
split H¹ over Q̄_ℓ into two rank-one eigenspaces. They are finitely
ramified and de Rham by the abelian H¹ comparison and stability under
direct summands. Apply the geometric-character theorem of
AutomorphicGaloisRepresentations §3.13 to these characters. Its converse
and AG2.0's `AlgHeckeChar.galoisChar` realize the same algebraic
characters at every coefficient prime: the M-linear good Frobenius
polynomials from AbelianSchemesAndArithmeticModuli A6 identify those
realizations with the two CM eigenspaces by Chebotarev. This is an
application of the rank-one supplier, not a new general CM reciprocity
theorem. Local class field theory gives the character parameters,
including their inertia and coefficient-prime de Rham comparison.
For the rank-one bridge see the second Lemma 1 of the algebraic
Hecke-character notes, pp.9–10, with the geometricity input supplied by
the named owner. If M is not contained in K, induce the character
from KM to K and use the
supplier `quadraticInduction`, including every local parameter. If M=K,
use the isobaric sum of the two characters over K. The induced case is
cuspidal when the character is not Galois invariant; the sum case is
not. The determinant ε⁻¹, together with the algebraic-to-unitary norm
twist, gives trivial central character. (OpenAI §9.4, pp.27–28.)

**Checks.** For K=Q(i), a curve with CM by Q(i), such as y²=x³−x,
uses the isobaric sum. For the same K, a curve with CM by Q(√−3),
such as y²=x³+1, uses induction from KQ(√−3), not a sum over K.
Thus “all CM curves are noncuspidal over K” is false. Geometric non-CM
is a condition on endomorphisms over K̄, not only on K-rational
endomorphisms. Both CM alternatives have the same determinant, complex
parameter and L-function normalization as the non-CM construction.

The endpoint **`imaginary_quadratic_modularity`** states: for **every**
imaginary quadratic number field K and **every** elliptic E/K, construct
an isobaric automorphic π_E of GL₂(𝔸_K), trivial central character and
weight zero, realizing H¹(E_K̄,Q̄_ℓ) for every ℓ and ι. For v∤ℓ its full
Frobenius-semisimple WD parameter agrees with rec^T(π_E,v), including
inertia and N. Every finite local factor, including the factor obtained
at the residue coefficient prime, agrees. Its complex parameter and
L-function identity are exactly those in §8.5. If E is non-CM π_E is
cuspidal; if E is CM it is the induction or isobaric sum just described.
This combines §§8.2–8.5 with the CM branch and is OpenAI Theorem 1.1,
p.1. The only hypotheses are that K is imaginary quadratic and E/K is elliptic.

### Examples

Every elliptic curve over Q(√−10) is included. A non-CM curve with reducible original
mod-three and mod-five images is included: the auxiliary curve, rather
than E, supplies the seed at five. A CM curve whose CM field is already
K is included through the sum branch and is not forced into a cuspidal
existence statement.

### Dependencies

Layers 4–7 supply all systems, congruences, local types and simultaneous
residual conditions. Section 5.2 supplies the three lifts using the CN supplier and Layer 0's
preparation; §5.3 supplies the initial elliptic seed independently. The automorphic Galois and local Langlands suppliers give
coefficient changes and the local comparisons. R17.4 supplies cyclic
descent, twisting and quadratic induction. CM eigenspaces use the
endomorphism/realization interface A6, the geometric-character theorem
of AutomorphicGaloisRepresentations §3.13 and the all-prime avatar/local
dictionary of AG2.0; general CM reciprocity is not redeveloped here.

## Downstream consumers and boundaries

The endpoint supplies unrestricted elliptic modularity over every imaginary
quadratic field, in an all-prime, all-local-factor normalization suitable
for arithmetic applications. Consumers needing a cuspidal representation
must retain the geometric non-CM hypothesis; a CM sum has different
analytic and representation-theoretic behavior. The geometric outputs are
also reusable independently: the integral group-ring marking and its
residue-prime character evaluation supply congruences even where rational
character projectors are not integral.

ModularityAndLanglandsExtensions §2.29's
`CMResidual.modular_curve_with_types` is a downstream adapter of
`switch_five` and `switch_three`, with the same symplectic pairing,
avoidance extension, reduction partition and all-places genericity.
Duality changes the determinant from ε̄p to ε̄p⁻¹ for its cohomological
form; the p=3 adapter retains ζ₅∉F. Its elliptic residual criterion uses
`cm_modularity`; its additional height-density argument remains there.
Its §2.18 rational-curve large-image assertion specializes
`nonCM_elliptic_large_residual_primes` to E/ℚ over a number field L.
For sufficiently large p unramified in L, `L∩ℚ(ζp)=ℚ`; cyclotomic
determinant surjectivity upgrades the SL₂ inclusion to full GL₂ image.
That roadmap combines this with ordinary-prime density and progressions;
the general large-prime existence theorem has the single owner §5.1 here.
AdelicImagesAndModularCurves §4.3 states Serre's full surjectivity onto
GL₂(𝔽_ℓ) for all but finitely many ℓ for the same geometrically non-CM
curves; that roadmap's inputs lie beyond this one in the supplier order,
so its statement is the determinant upgrade of the inclusion owned here,
obtained as above, and is a consumer of §5.1, not a supplier.

The imaginary quadratic hypothesis enters in exactly two places: the
ramification proof of ζ₅∉F in §5.1, and the descent of §8.4 through CM
fields containing K. The covers, degenerations, integral monodromy and
local prescription of Layers 1–4 and 6 are stated over arbitrary number
fields, and §7.4 gives the d-conjugate specialization with its explicit
large-image prime choice. Extending the endpoint to other CM fields or
to totally real fields is outside this roadmap.

For any such extension it is essential to place the seed correctly.
ζ₅∉K does **not** imply ζ₅∉F=K(μ₃p): the field
`K=Q(ζ₁₅+ζ₁₅⁻¹,i)`, of degree eight inside `Q(ζ₆₀)`, is the fixed field
of `{1,29}` in `(Z/60)ˣ`, and 29≢1 mod 5 shows ζ₅∉K, whereas
`K(ζ₃)⊇Q(ζ₁₅)⁺(ζ₃,i)=Q(ζ₆₀)∋ζ₅`. Over such a K the seed at five would
have to be established before the cyclotomic base change. The imaginary
quadratic proof here instead proves ζ₅∉F by ramification and starts over
F; §8.2 is not reused over an arbitrary CM K.

There is no quantitative height bound for the chosen parameter, no
algorithm for constructing the automorphic form, and no finite arithmetic
certificate required by the proof route. Those are separate questions.


## References

All results above are stated in our own words. Page locators are the printed
pagination of the indicated fixed versions; the OpenAI PDF has printed
pages 1–30.

- **OpenAI.** [Modularity of elliptic curves over imaginary quadratic fields](https://github.com/openai/math/blob/adc7f1241b42e322a6451854ab7e4b4c146bf78a/preprints/Modularity-of-elliptic-curves-over-imaginary-quadratic-fields-October-4-2026/paper.pdf), dated 4 October 2026, fixed repository revision `adc7f1241b42e322a6451854ab7e4b4c146bf78a`. Theorem 1.1 p.1; conventions §2 p.4; covers and degenerations §3 pp.5–7; integral monodromy §4 pp.8–11; character systems §5 pp.11–14; imported automorphy inputs §6 pp.14–16; local prescription §7 pp.16–20; specialization §8 pp.20–25; propagation and descent §9 pp.25–28. PDF SHA-256 `c74cc37755f500be0c22ccb4d08ce81df309404a7175a7fb6cf7321330b5187c`.
- **CN.** Ana Caraiani and James Newton, [On the modularity of elliptic curves over imaginary quadratic fields](https://arxiv.org/pdf/2301.10509v3), arXiv:2301.10509v3, 27 March 2025. Theorem 5.2 and Remarks 5.2.1–5.2.3 pp.73–74; Theorem 6.1 pp.87,90; Lemma 6.1.3 p.88; residual constructions Lemmas 6.1.4, 6.1.7 and Propositions 6.1.5–6.1.6 pp.88–90. The exceptional modular-curve analysis of §7 is outside the proof route here.
- **AKT.** Patrick B. Allen, Chandrashekhar Khare and Jack A. Thorne, [Modularity of GL₂(F_p)-representations over CM fields](https://arxiv.org/pdf/1910.12986v2), arXiv:1910.12986v2, 2 September 2022. Theorems 7.1 and 8.1 pp.67,71–72; independent elliptic seed Proposition 9.12 p.79 and prescribed-type constructions in §9 pp.73–81. Their independent lifting and elliptic seed arguments are the targets of Layer 0.
- **DDT.** Henri Darmon, Fred Diamond and Richard Taylor, [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), Lemma 4.11, p.119. Its determinant-character trace criterion retains the degree-three projective-A₄ alternative; §0.1 supplies a cyclotomic preparation branch for that case.
- **Serre.** Jean-Pierre Serre, *Propriétés galoisiennes des points d’ordre fini des courbes elliptiques*, Inventiones mathematicae 15 (1972), 259–331, DOI 10.1007/BF01405086; §4.2, Théorème 2, p.294, cited by locator (the journal copy is not openly available). This is the non-CM elliptic large-prime theorem proved in §5.1.
- **Varma.** Ila Varma, [Local-global compatibility for regular algebraic cuspidal automorphic representations when ℓ is different from p](https://arxiv.org/pdf/1411.2520v1), arXiv:1411.2520v1. Theorem (1ss), p.1, gives the underlying semisimplified Weil compatibility; Theorem (1), on the same page, bounds monodromy. Its application in OpenAI Lemma 9.2 is the local comparison used here, without an unproved general monodromy equality.
- **ACC+.** P. B. Allen, F. Calegari, A. Caraiani, T. Gee, D. Helm, B. V. Le Hung, J. Newton, P. Scholze, R. Taylor and J. A. Thorne, [Potential automorphy over CM fields](https://arxiv.org/pdf/1812.09999v2), arXiv:1812.09999v2, 16 June 2022; published in Annals of Mathematics 197 (2023), 897–1113. The cited PDF's §7.1 pp.189–190 specifies compatible-system data and predicates. The shared carrier's single owner is SmallRamificationAndAbelianVarietyBaseCases §5.0d.
- **Algebraic Hecke-character notes.** [Algebraic Hecke Characters](https://math.stanford.edu/~conrad/DarmonCM/2011Notes/algebraicHeckecharacters.pdf), seminar notes hosted by Brian Conrad; second Lemma 1 and proof, pp.9–10. Used through AutomorphicGaloisRepresentations §3.13, with its local algebraicity and coefficient-field hypotheses discharged there.

- **Shepherd-Barron–Taylor.** N. I. Shepherd-Barron and R. Taylor, [Mod 2 and mod 5 icosahedral representations](https://math.stanford.edu/~rltaylor/klein.pdf), J. Amer. Math. Soc. 10 (1997), 283–298, Lemma 1.1 and proof, author manuscript p.3. The fixed-pairing rationality argument is used in §0.2.
- **Stacks Project.** [Tag 03GV](https://stacks.math.columbia.edu/tag/03GV), normalization and smooth base change, used for the fixed-pairing twists in §0.2.
