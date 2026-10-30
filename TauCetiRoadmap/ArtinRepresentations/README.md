# Roadmap: Artin representations, Artin L-functions, and the LMFDB invariants

An Artin representation of a field `F` is a continuous homomorphism `ρ : Gal(F̄/F) → GL(V)` into
the automorphisms of a finite-dimensional complex vector space; continuity forces the image to be
finite, so `ρ` is a representation of the Galois group of a finite Galois extension `K/F`, its
*Artin field*. For a number field `F` such a `ρ` has an Artin conductor, an L-function
`L(s, ρ) = ∏_v det(1 − ρ(Frob_v) Nv^{−s} | V^{I_v})^{−1}`, a completion `Λ(s, ρ)` with a functional
equation `Λ(s, ρ) = W(ρ) Λ(1 − s, ρ^∨)`, and a root number `W(ρ)` of absolute value one. The
LMFDB's [Artin representation pages](https://www.lmfdb.org/ArtinRepresentation/) record, for each
`ρ` over `ℚ`: its dimension, conductor, determinant (as a Dirichlet character), parity, Frobenius–Schur
indicator, trace of complex conjugation, root number, Galois orbit, image group, projective image
and its type (dihedral, `A₄`, `S₄`, `A₅` in dimension two), Artin field, stem field, projective
field, smallest permutation container, and the local polynomials `det(1 − ρ(Frob_p) X | V^{I_p})`;
its weight-one modular form pages record the Artin field, projective image and Stark unit of a
weight-one newform; its `p`-adic field pages record a local root number; its elliptic curve pages
record local root numbers; and its mod-`ℓ` Galois representation pages record the image, index,
determinant, conductor prime to `ℓ`, Frobenius matrices and the kernel fields of a continuous
`ρ̄ : Gal(ℚ̄/ℚ) → GL_n(𝔽_ℓ)`.

This roadmap builds the Artin representation as an object with its complete basic theory, the
Artin L-function with Artin's formalism (additivity, invariance under induction and inflation,
`ζ_K = ∏_χ L(s, χ)^{χ(1)}`), its meromorphic continuation and functional equation through Brauer
induction and the Hecke L-functions of the [L-functions roadmap](../LFunctions/README.md), the
global root number and the general conductor–discriminant formula, the root numbers of `p`-adic
fields and the local root numbers of elliptic curves, every invariant the LMFDB displays or
searches on, the statements of Artin's conjecture, the weight-one dictionary and Stark's
conjecture at `s = 0`, and a final layer on finite-image representations into `GL_n(𝔽̄_ℓ)`.
Conductors, Swan conductors, Deligne–Langlands local constants and Chebotarev recognition are
consumed from the [arithmetic Galois representations roadmap](../ArithmeticGaloisRepresentations/README.md),
and the proved cases of Artin's conjecture and of the weight-one dictionary from the
[`GL₂` automorphic representations roadmap](../GL2AutomorphicRepresentationsAndTransfer/README.md)
and the [automorphic Galois representations roadmap](../AutomorphicGaloisRepresentations/README.md).

The primary carrier is `ArtinRep F V`: Mathlib's `ContRepresentation ℂ (Field.absoluteGaloisGroup F) V`
on a finite-dimensional complex normed space `V`, together with the continuity of `ρ : G_F → GL(V)`
for the Krull topology on `G_F := Field.absoluteGaloisGroup F`, which Mathlib's structure (a bare
homomorphism `G →* V →L[ℂ] V`) does not carry. Every statement about a specific `ρ` is proved at the **finite level**, on a
`Representation ℂ (L ≃ₐ[F] L) V` for a finite Galois `L/F` through which `ρ` factors, and
transported by inflation; the finite-level objects are Mathlib's `Representation`, `FDRep`,
`Representation.character`, `Representation.invariants`, `Ideal.inertia`, `IsArithFrobAt` and
Tau Ceti's `artinSymbol`, `complexConjugationAt`, `frobeniusSchurIndicator` and Brauer induction,
so that nothing about Frobenius elements, inertia groups, characters or induction is restated here.

Suggested home: `TauCeti/NumberTheory/ArtinRepresentation/`, with subdirectories `Basic/` (the
carrier, the Artin field, inflation and the finite-level dictionary), `Local/` (inertia invariants,
local polynomials, local Euler factors, root numbers of `p`-adic fields), `LFunction/` (the Euler
product, Artin's formalism, continuation, completion, functional equation, root number, the
analytic card), `ConductorDiscriminant/`, `RootNumber/` (orthogonal and symplectic root numbers,
elliptic curves), `Invariants/` (the LMFDB invariants, projective images, Klein's classification,
containers, stem fields, Galois conjugates), `Conjectures/` (Artin, weight one, Stark), and
`ModL/` (finite-image representations over finite fields).

`Suggested.lean` states the targets that can be written over Mathlib and the pinned Tau Ceti: the
carrier, the Artin field, inflation, the finite level and restriction (Layer 1), the local
polynomials and the Euler product (Layers 2–3), the meromorphic Artin L-function and the gamma
factor (4.1, 4.2, 4.4), the LMFDB invariants (Layer 7), Artin's conjecture (8.1) and the mod-`ℓ`
carrier (Layer 9). Induction along a finite extension (1.5), the root number of a `p`-adic field
(2.4, 6.4), the analytic conductor (3.5), the completed L-function, the functional equation and the
root number (4.2, 4.3, 6.2), the local root numbers of elliptic curves (6.5) and the top slope
(9.2) rest on conductors and local constants of other roadmaps, or on a construction too long to
state in that file; they are specified in this README only, each with its definition and a
**Checks.** list.

## Prerequisites

Every milestone names its direct prerequisites, each of one of four kinds and nothing else:

- **Mathlib.** A declaration present in Mathlib at the pin.
- **Tau Ceti.** A declaration present in the Tau Ceti code repository, imported by module.
- **Layer n.m.** An earlier milestone of this roadmap, strictly earlier in document order.
- **Roadmap R, layer n.** A named layer or milestone of another roadmap in this repository,
  cited by its own numbering and consumed by its own names.

The suppliers are listed under *Scope and ownership*; the exact Mathlib and Tau Ceti declarations
under *What Mathlib supplies* and *What Tau Ceti supplies*. In particular the
[arithmetic Galois representations roadmap](../ArithmeticGaloisRepresentations/README.md) is a
declared dependency throughout the conductor and local-constant material (its §§2.7, 3.1–3.6,
4.1, 4.4, 5.1, 5.3, 5.7), the [L-functions roadmap](../LFunctions/README.md) throughout the
continuation material (its Layers 0, 3–5), the
[class field theory roadmap](../ClassFieldTheory/README.md) for the local and global Artin maps
and conductors of characters (its Layers 7, 9, 11–13), and
[`RepresentationTheory/InductionRestriction`](../RepresentationTheory/InductionRestriction/README.md)
Layer 6 for Brauer induction. None of them is reimplemented.

## Scope and ownership

### Owned here

- **The carrier and its basic theory** (Layer 1): Artin representations of an arbitrary field
  `F`, open kernel and finite image, the Artin field `K_ρ` and the faithful finite-level
  representation, inflation from any finite Galois extension through which `ρ` factors,
  isomorphism, direct sums, tensor products, duals, restriction to the open subgroup `G_L` of a
  finite extension `L/F`, induction from it, the character as a class function on `G_F`,
  semisimplicity and the decomposition into irreducibles, the Galois action on representations
  and characters, the character field, and the Grothendieck group of virtual Artin representations
  with Brauer induction read on it.
- **Local Artin representations** (Layer 2): inertia and wild-inertia invariants, the unramified
  and tame predicates, the local polynomial `P(ρ, X) = det(1 − X ρ(Φ) | V^{I_K})` and its
  independence of the Frobenius lift, the local Euler factor, its behaviour under direct sums,
  unramified twists, induction and inflation, and the comparison with the arithmetic Frobenius
  characteristic polynomial at an unramified `ρ`.
- **Global local data** (Layer 3): the local polynomial `P_v(ρ, X)` of a global `ρ` at a finite
  place `v` through the decomposition group of a prime above `v` in the Artin field, the ramified
  set and the ramified primes of the Artin field, Frobenius characteristic polynomials at
  unramified places, the local polynomial at a real place (the `±1`-eigenspace dimensions of
  complex conjugation), and the Euler product `L(s, ρ)` on `Re s > 1` with Artin's formalism.
- **The Artin L-function as a meromorphic function** (Layer 4): `artinLFunctionC ρ`, its
  characterization, the completion `completedArtinLFunction ρ`, the functional equation, the root
  number `W(ρ)` with `|W(ρ)| = 1` and `W(ρ^∨) = conj W(ρ)`, the order of vanishing at `s = 0`, the
  analytic card of the L-functions roadmap, and Artin's conjecture as a named proposition.
- **The conductor–discriminant formula** (Layer 5) for an arbitrary finite Galois extension of
  number fields, and the identification of the conductor of a one-dimensional `ρ` with the
  conductor of its Hecke character and, over `ℚ`, of its Dirichlet character.
- **Root numbers** (Layer 6): the product formula `W(ρ) = ∏_v W(ρ_v, ψ_v)` read on this roadmap's
  carrier, `W(ρ) = 1` for orthogonal `ρ`, `W(ρ) = ±1` for symplectic `ρ`, the root number of a
  `p`-adic field in the LMFDB's normalization with its fourth-root-of-unity property, and the local
  root numbers of elliptic curves with Rohrlich's formulas.
- **The LMFDB invariants** (Layer 7): dimension, conductor, determinant as a Dirichlet or Hecke
  character, parity, the trace of complex conjugation and the eigenspace dimensions `n₊, n₋`,
  Frobenius–Schur indicator, character field and Galois conjugates, image group, projective image
  and the projective type predicates with Klein's classification of the finite subgroups of
  `PGL₂(ℂ)`, Artin field, stem fields, projective field and projective stem fields, the smallest
  permutation container, ramified primes, the cycle-type recipe for Frobenius away from the
  discriminant of a defining polynomial, and the local polynomial table.
- **The conjectures as statements** (Layer 8): Artin's conjecture, the strong Artin conjecture
  and the weight-one dictionary as propositions on this carrier, with the proved cases consumed;
  the order of vanishing at `s = 0`; Stark's conjecture at `s = 0` in Tate's formulation and
  Chinburg's weight-one Stark unit.
- **Finite-image representations over finite fields** (Layer 9): the carrier
  `ρ̄ : G_F → GL_n(𝔽)`, image, order, index, surjectivity, determinant and determinant index,
  abelian and solvable images, irreducibility and absolute irreducibility, Frobenius matrices
  with their characteristic polynomials, traces, determinants and orders, generating sets of
  Frobenius classes, the splitting field and the projective kernel field, the top slope, the
  comparison with the reduction of an Artin representation, and Chebotarev recognition read on
  this carrier.

### Consumed, not redefined

- From Mathlib: the declarations listed under *What Mathlib supplies* — the absolute Galois
  group with its Krull topology, `ContRepresentation`, the finite-group representation theory
  (`Representation`, `FDRep`, characters, invariants, duals, induction, irreducibility,
  semisimplicity), `IsArithFrobAt` and `Ideal.inertia`, infinite places and complex embeddings,
  Dirichlet characters, `LSeries` and `dedekindZeta`, the gamma factors and meromorphy,
  `Matrix.ProjGenLinGroup`, the dihedral, alternating and symmetric groups, the reduction classes
  of a Weierstrass curve over a discrete valuation ring, and `IsNonarchimedeanLocalField`.
- From Tau Ceti: the declarations listed by module under *What Tau Ceti supplies* — profiniteness
  of `G_F` and the open subgroups of finite extensions, `Representation.isOpen_ker_of_finite`, the
  character table and Frobenius–Schur library, induction and Brauer induction, projective
  representations, Frobenius elements and the Artin symbol, complex conjugation, ramified primes,
  decomposition groups, the local inertia and ramification filtrations, Hecke characters and
  `ratDirichletEquiv`, Euler product data, and the Tate module of an elliptic curve.
- From the [étale cohomology foundations roadmap](../EtaleCohomologyFoundations/README.md)
  §F.4.0: `ContinuousRep Γ A M` (a `Representation` with a joint-continuity proof), its `Iso`,
  `ofCharacter` and `baseChange`. For `Γ = G_F`, `A = ℂ` and `M = V` finite-dimensional this is the
  same object as `ArtinRep F V`; Layer 1.1 records the comparison and duplicates nothing.
- From the [arithmetic Galois representations roadmap](../ArithmeticGaloisRepresentations/README.md),
  by milestone: §1.4 *No small subgroups* (a continuous homomorphism from a profinite group to
  `GL_n(ℂ)` has open kernel; `subgroup_units_eq_bot_of_norm_sub_one_le`,
  `continuous_iff_isOpen_ker`); §2.7 *Arithmetic character constants* (`tateLocalConstant`),
  *Root-number product formula* (`rootNumber_eq_prod_tateLocalConstant`), *Globalisation and
  Deligne's transfer*, and *Deligne–Langlands local constants* (`epsilonWeil`, `WeilDeligneRep.epsilon`);
  §3.1 (`Conductor.breaks`, `Conductor.highestBreak`, `Conductor.swanConductor`); §3.2
  (`Conductor.artinConductor`, `Conductor.artinConductorNat`, the comparison with
  `characterConductorExp`); §3.3 (`Conductor.globalConductor`, `Conductor.primeToPConductor`,
  `AdmissibleExcludedPlaces`); §3.4 functoriality; §3.5 *The local induction formula* and
  *The global induction formula*, *Hasse–Arf integrality*; §3.6 conductors of reductions; §4.1
  (`GaloisRep.IsComplexConjugation`, `GaloisRep.IsOdd`); §4.4 Dickson's classification
  (`GL2Subgroup.dickson_projectiveImage`); §5.1 (`GaloisRep.dense_frobeniusSet`); §5.3
  (`GaloisRep.iso_of_charpoly_eq_on_dense`, `GaloisRep.iso_of_frobenius_charpoly_eq`); §5.7
  (`GaloisRep.realizable_of_charpoly_mem`). This roadmap's local Euler factors are stated with
  arithmetic Frobenius on the representation itself; that roadmap's `GaloisRep.localEulerFactor`
  uses geometric Frobenius, and its §2.5a records that the two agree on dual representations.
- From the [L-functions roadmap](../LFunctions/README.md): Layer 0 (`AnalyticLFunctionData`,
  the dual record, the continuation and functional-equation predicates, `EqOffZero`); Layer 3
  (`dedekindZetaC`, `completedDedekindZeta`, `eq_of_meromorphic_of_eqOn_halfPlane`,
  `eventuallyEq_of_meromorphic_of_eqOn_halfPlane`); Layer 4 (`dirichletData`); Layer 5
  (`heckeLFunctionC`, `PrimitiveRayClassCharacter`, `completedHeckeLFunction`, its Gauss sum and
  root number, `eulerCorrection`, `finiteEulerCorrection`, the functional equation
  `Λ(χ, s) = W(χ) Λ(χ⁻¹, 1 − s)` and entirety for nontrivial primitive `χ`). The continuation of
  `L(s, ρ)` in Layer 4 is assembled from `heckeLFunctionC` by Brauer induction; no second Hecke
  L-function is built.
- From the [class field theory roadmap](../ClassFieldTheory/README.md): Layer 7 (`artinMap`,
  `conductorExponent`, `characterConductorExp`, `unramifiedCoordinate`,
  `isArithFrobeniusLift_of_mk_eq_artinMap_uniformizer`); Layer 9 (`WeilGroup`, `weilRestrict`);
  Layer 11 (`globalArtinMap`, `globalArtinMap_local`, `globalArtinMap_ideal`); Layer 12
  (`globalAbelianExistence`); Layer 13 (`abelianConductor`, `kroneckerWeber`, the abelian
  conductor–discriminant formula). The dictionary between one-dimensional Artin representations
  and finite-order Hecke characters is read through `globalArtinMap`.
- From [`RepresentationTheory/CharacterTheory`](../RepresentationTheory/CharacterTheory/README.md):
  Layer 4 (character values in `ℚ(ζ_e)`, the Galois action by power maps, the field of values) and
  Layer 7 (the Frobenius–Schur indicator and the orthogonal/complex/symplectic trichotomy); from
  [`RepresentationTheory/InductionRestriction`](../RepresentationTheory/InductionRestriction/README.md):
  Layer 2 (induced characters, Frobenius reciprocity), Layer 6 (the virtual-character ring, Artin
  and Brauer induction, elementary subgroups) and Layer 7 (projective representations and the
  lifting of a homomorphism to `PGL`).
- From the [local fields and ramification roadmap](../LocalFieldsRamification/README.md): Layer 2
  (Frobenius of unramified extensions), Layer 3 (the lower and upper filtrations, Herbrand
  functions, Hasse–Arf) and Layer 4 (the tame quotient); from the
  [local Galois groups roadmap](../LocalGaloisGroups/README.md): the conventions on `G_K` for a
  `p`-adic field and nothing else.
- From the [completed number-field arithmetic roadmap](../../Completed/NumberFieldArithmetic/README.md):
  Layer 2 (`artinSymbol`, `artinHomAway`, the tower formula), Layer 4 (`relDiscr`), Layer 5 (the
  completion at a finite place, `decompositionHom`), Layer 6 (the global ramification groups).
- From the [Chebotarev roadmap](../Chebotarev/README.md): `frobeniusPrimeSet`,
  `hasDirichletDensity_frobeniusPrimeSet`, `hasNaturalDensity_frobeniusPrimeSet`.
- From the [`GL₂` automorphic representations roadmap](../GL2AutomorphicRepresentationsAndTransfer/README.md):
  R17.5.1, R17.5.6–R17.5.8 (dihedral, tetrahedral, octahedral and solvable strong Artin), R17.5.9
  and R17.5.10 (odd solvable Artin representations and weight one); from the
  [automorphic Galois representations roadmap](../AutomorphicGaloisRepresentations/README.md):
  §2.10 (the Deligne–Serre representation of a weight-one eigenform); from the
  [modularity and Langlands extensions roadmap](../ModularityAndLanglandsExtensions/README.md):
  §1.2 (`IsAutomorphicArtin`, `IsWeaklyAutomorphicArtin`, `IsAutomorphicArtin.lFunction_entire`)
  and §1.9 (the odd Artin conjecture over totally real fields); from the
  [analytic number theory roadmap](../AnalyticNumberTheoryPartI/README.md): §2.31 (continuation
  near `Re s = 1` of the incomplete Artin L-function) and §2.39 (Aramata–Brauer). The predicates
  `ArtinHolomorphy` and `ArtinConjecture` of its §2.41 are the same propositions as Layer 8.1
  here, read on the unique meromorphic continuation; Layer 8.1 records the agreement.
- From the [adelic algebraic groups roadmap](../AdelicAlgebraicGroups/README.md) AA.2.4
  (*Convergence factors from the character module*): nothing is imported, since that milestone
  specifies its finite-image Artin factors in prose only and names no Lean declaration; Layer 3.6
  records that its local factors on inertia invariants with arithmetic Frobenius are
  `localPolynomialAt` of this roadmap, so that its convergence factors are this roadmap's Euler
  factors by name once it reads them here.
- From the sibling `PadicExtensionFamilies` 2.7: the top slope `topSlope K L` of a finite extension
  of `p`-adic fields (the largest Artin slope `1 + u` of its Galois closure, `0` when unramified,
  `1` when tamely ramified), which 9.2 applies to the completions of the splitting field of a
  mod-`ℓ` representation at the places above `ℓ` and maximizes over them.

### Not owned here

- **Conductors.** The Artin conductor, the Swan conductor, the breaks, Hasse–Arf integrality,
  the induction and twist formulas, the conductor of a Weil–Deligne representation, global
  conductors and the prime-to-`ℓ` conductor of a residual representation belong to the
  [arithmetic Galois representations roadmap](../ArithmeticGaloisRepresentations/README.md) Layer 3
  and are consumed by name. This roadmap defines no conductor exponent and no second ramification
  filtration; the conductor–discriminant formula of Layer 5 is an assembly of that roadmap's §3.5.
- **Local constants.** Tate's local constants of characters, their globalization, and the
  Deligne–Langlands constants `ε(V, ψ, dx)` of representations of local Weil groups, with their
  existence, uniqueness, inductivity in degree zero and the product formula, are that roadmap's
  §2.7. Layer 6 here reads `W(ρ_v, ψ_v) := ε(ρ_v ⊗ |·|^{1/2}, ψ_v, dx_{ψ_v})` from it and proves
  nothing about `ε` beyond what the LMFDB invariants need.
- **The proved cases of Artin's conjecture and of the weight-one dictionary.** Dihedral,
  tetrahedral, octahedral and solvable strong Artin, the weight-one newform attached to an odd
  solvable two-dimensional `ρ`, the Deligne–Serre representation of a weight-one eigenform, and
  the odd Artin conjecture over totally real fields are the three Langlands-family roadmaps named
  above. Layer 8 states the dictionary on this carrier and cites the proofs.
- **Analytic consequences.** Nonvanishing on `Re s = 1`, zero-free regions, the Brauer–Siegel and
  Heilbronn–Aramata theorems, effective Chebotarev, and every estimate uniform in the conductor
  belong to the [analytic number theory roadmap](../AnalyticNumberTheoryPartI/README.md) and the
  zeros roadmaps; Chebotarev density itself belongs to the [Chebotarev roadmap](../Chebotarev/README.md).
- **Galois module structure.** Tame local Galois Gauss sums, symplectic root signs as Galois
  module invariants, Fröhlich's Hom-description and Taylor's theorem are
  [`ClassicalArithmeticCompletion`](../ClassicalArithmeticCompletion/README.md) Layer 7, which
  consumes `completedArtinLFunction` and the functional equation of Layer 4 here under exactly
  those names.
- **Labels, orderings and normal forms.** Label components beyond the intrinsic prefix (the
  orbit letter `a` and the conjugate letter `b` of a label `dim.cond.dtj.a.b`, and the `T`-number
  of a container of degree above 11), the choice of displayed stem field among several, the stored
  `HardPrimes` set (the primes dividing the discriminant of the stored defining polynomial of the
  stem field), the canonical sequence of generating primes of a mod-`ℓ` representation, the
  minimal sibling of a splitting field, the `image_label`, and every stored list are not targets.
  This roadmap states the intrinsic label prefix (dimension and conductor), the predicates a label
  is built from, and the permutation group of the container up to conjugacy, never a letter or an
  index.
- **Transitive-group classification.** The classification of transitive subgroups of `Sₙ` and
  the data of `nTj` belong to the [polynomial Galois groups roadmap](../PolynomialGaloisGroups/README.md).
- **Sato–Tate groups as objects** — the ambient groups, the axioms, the statistics, and the
  weight-`0` degree-`1` groups `μ(n)` — belong to `SatoTateGroups`; the Sato–Tate group of an
  Artin representation of dimension `d` is its image group (7.4) read inside `U(d)` through a
  `G_F`-invariant Hermitian form, an instance of that roadmap's Layer 1–3 objects that no LMFDB
  page displays beyond `d = 1` and that no milestone here states beyond 7.4; the `ℓ`-adic images of elliptic curves and modular forms to
  `AdelicImagesAndModularCurves`; the arithmetic of `p`-adic field families and the Galois
  splitting models of the `lf` pages to `PadicExtensionFamilies`; the Hilbert weight-one
  dictionary over totally real fields to `HilbertModularForms`, which consumes R17.5.10 and
  Layer 8.3 here; the isomorphism invariants of the image groups as abstract groups to
  `FiniteGroupInvariants`; their labels (`gps_groups`) are not a target.
- **Weil–Deligne representations and `ℓ`-adic representations** with infinite image, Tate
  modules, compatible systems, and the elliptic conductor are the arithmetic Galois
  representations roadmap's; Layer 6.5 consumes the Weil–Deligne representation of an elliptic
  curve only to name its local root number.
- **The dual pair of algebras** of a mod-`ℓ` representation (its presentation as a finite étale
  group scheme) is not an invariant of the representation but a presentation of a group scheme;
  no milestone here states it, and no roadmap in this repository owns it.

## Pinned conventions

Decide these once. Every one of them has two spellings in the literature, and a roadmap that
leaves one open gets implemented twice.

| Object | Convention |
|---|---|
| Carrier | `ArtinRep F V`, the structure extending Mathlib's `ContRepresentation ℂ (Field.absoluteGaloisGroup F) V` by the single field `continuous_toFun : Continuous ρ`, for `F` any field and `V` a finite-dimensional complex normed space (`[NormedAddCommGroup V] [NormedSpace ℂ V] [FiniteDimensional ℂ V]`). Mathlib's structure is a bare homomorphism `G_F →* (V →L[ℂ] V)`; `G_F` carries its Krull topology (Mathlib's instance; Tau Ceti's `CompactSpace`), `V →L[ℂ] V` the operator-norm topology, and Layer 1.1 proves continuity equivalent to `ρ.ker` being open and to `Set.range ρ` being finite (`continuous_iff_isOpen_ker`), so the field is the only condition added. No joint-continuity carrier and no "finite image" predicate is introduced; the jointly continuous `ContinuousRep G_F ℂ V` of the [étale cohomology foundations roadmap](../EtaleCohomologyFoundations/README.md) §F.4.0 is the same object and Layer 1.1 records the comparison. |
| Finite level | A finite Galois extension is an `L : IntermediateField F (AlgebraicClosure F)` with `[IsGalois F L] [FiniteDimensional F L]`, or a separate `[Field L] [Algebra F L] [IsGalois F L] [FiniteDimensional F L]`; its representations are `Representation ℂ (L ≃ₐ[F] L) V`. Inflation is composition with `AlgEquiv.restrictNormalHom L`. The Artin field is `artinField ρ := IntermediateField.fixedField ρ.ker`. |
| Frobenius | **Arithmetic**, everywhere: Mathlib's `IsArithFrobAt` at a prime of a number field, Tau Ceti's `IsArithFrobeniusLift` in `G_K` for a local field `K`, Tau Ceti's `artinSymbol` for the conjugacy class. Geometric Frobenius is its inverse and is always called geometric. |
| Local polynomial | `P(ρ, X) := det(1 − X ρ(Φ) | V^{ρ(I)})`, for `Φ` any arithmetic Frobenius lift and `V^{ρ(I)}` the inertia invariants (Mathlib's `Representation.invariants` of the restriction to inertia); as a polynomial, `(LinearMap.charpoly (ρ Φ restricted to V^{ρ(I)})).reverse`. At an unramified `ρ` it is the reversed characteristic polynomial of `ρ(Frob)`. This is the LMFDB's `LocalFactors` entry and Neukirch VII (10.1)'s local factor; it is **not** the characteristic polynomial `det(X − ρ(Frob))`, whose name here is `frobeniusCharpoly`. |
| Euler factor and L-function | `L_v(s, ρ) := P_v(ρ, Nv^{−s})^{−1}`, `L(s, ρ) := ∏_{v finite} L_v(s, ρ)` on `Re s > 1`, over **all** finite places including the ramified ones; no archimedean factor is part of `L(s, ρ)`. With arithmetic Frobenius this is the function whose one-dimensional case is the Hecke L-function of the character `χ ∘ globalArtinMap` with `χ(Frob_v) = L_v`-eigenvalue, and whose trivial case is `ζ_F`. The [arithmetic Galois representations roadmap](../ArithmeticGaloisRepresentations/README.md) writes its `ℓ`-adic Euler factors with geometric Frobenius; on a finite-image `ρ` its factor is this roadmap's factor of `ρ^∨`. |
| Dual | `ρ^∨ := Representation.dual` made continuous; its character is `χ̄` (`FDRep.conj_char`). The functional equation reflects `ρ` to `ρ^∨`, never to a "conjugate representation" defined separately. |
| Conductor | `𝔣(ρ) := Conductor.globalConductor ρ ∅` and its exponents `a_v(ρ) := Conductor.artinConductorNat (ρ at v)` of the [arithmetic Galois representations roadmap](../ArithmeticGaloisRepresentations/README.md) §§3.2–3.3, with `Σ = ∅` admissible for Artin representations. `a_v(ρ) = Σ_{i ≥ 0} (|G_i|/|G_0|) codim V^{G_i}` over the lower filtration of any finite Galois quotient through which `ρ_v` factors, `G_0` inertia, is that roadmap's lower-sum formula and the LMFDB's `artin.conductor` knowl. The **analytic conductor** is `C(ρ) := |disc F|^{dim ρ} · N(𝔣(ρ))`, a positive integer; over `ℚ` it is `N(𝔣(ρ))`, the LMFDB's `Conductor`. |
| Complex conjugation | At a real place `v` of `F`, a complex conjugation is any `c ∈ G_F` with `ι ∘ c = conj ∘ ι` for an embedding `ι : F̄ → ℂ` above `v` (`GaloisRep.IsComplexConjugation v c` of that roadmap's §4.1); at the finite level it is Tau Ceti's `complexConjugationAt w hw` for a ramified `w` above `v` and `1` for an unramified one. `n₊(ρ, v)`, `n₋(ρ, v)` are the dimensions of the `+1` and `−1` eigenspaces of `ρ(c)`; they do not depend on the choice of `c`. |
| Gamma factors | `Γ_ℝ(s) = π^{−s/2} Γ(s/2)` and `Γ_ℂ(s) = 2 (2π)^{−s} Γ(s)` are Mathlib's `Complex.Gammaℝ` and `Complex.Gammaℂ`. The archimedean factor of `ρ` is `∏_{v real} Γ_ℝ(s)^{n₊(ρ,v)} Γ_ℝ(s+1)^{n₋(ρ,v)} · ∏_{v complex} Γ_ℂ(s)^{dim ρ}`. |
| Completion and functional equation | `Λ(s, ρ) := C(ρ)^{s/2} · (archimedean factor) · L(s, ρ)`, the conductor power inside the completion as in the L-functions roadmap; `Λ(s, ρ) = W(ρ) Λ(1 − s, ρ^∨)` with `|W(ρ)| = 1`, as an equality of meromorphic germs at every point and of values away from the polar loci. The analytic normalization reflects `s ↦ 1 − s`; no arithmetic weight occurs. |
| Root number | `W(ρ)` is the constant of that equation; it is a function of the isomorphism class of `ρ`, satisfies `W(ρ ⊕ ρ') = W(ρ) W(ρ')`, `W(ρ^∨) = conj W(ρ)`, `W(Ind ρ) = W(ρ)`, and is the LMFDB's `Sign` (`root_number`). For one-dimensional `ρ` over `ℚ` it is the Gauss-sum root number `τ(χ)/(i^a √N)` of the primitive Dirichlet character `χ`, `a ∈ {0, 1}` its parity. |
| Additive characters and local root numbers | The standard character `ψ_F = ψ_ℚ ∘ Tr_{F/ℚ}` with `ψ_{ℚ,∞}(x) = e^{2πix}` and `ψ_{ℚ,p}(x) = e^{−2πi{x}_p}`, and the self-dual measures `dx_ψ`, are the [arithmetic Galois representations roadmap](../ArithmeticGaloisRepresentations/README.md) §2.7's. `W(ρ_v, ψ_v) := ε(ρ_v ⊗ |·|_v^{1/2}, ψ_v, dx_{ψ_v})`, `|W(ρ_v, ψ_v)| = 1`, and `W(ρ) = ∏_v W(ρ_v, ψ_v)` for every global additive character trivial on `F`; each local factor depends on `ψ_v` through `W(ρ_v, ψ_v(b·)) = det ρ_v(b) W(ρ_v, ψ_v)` for `b ∈ F_v^×` (with `det ρ_v(b)` meaning `det ρ_v` at `Art_{F_v}(b)`), the product does not. At a real place `W(1) = 1` and `W(sgn, ψ_∞) = i`. |
| The root number of a `p`-adic field | The LMFDB's `lf.root_number` uses the **conjugate** character `ψ̄_p(x) = e^{2πi{x}_p}`, for which `W(sgn, ψ̄_∞) = −i` is the value its knowl states. So `rootNumber K := W(Ind_{G_K}^{G_{ℚ_p}} 1, ψ̄_p) = det(Ind 1)(Art(−1)) · W(Ind 1, ψ_p)`, with `det(Ind 1)` the quadratic character of the discriminant root field `ℚ_p(√disc K)` (the LMFDB's `rf`). It lies in `{1, i, −1, −i}` (Layer 6.4). The two conventions are related, never conflated. |
| Determinant as a character | `det ρ : G_F → ℂ^×` is the determinant of the representation (`LinearMap.det ∘ ρ`), a one-dimensional Artin representation. Over a number field its **Hecke character** is `det ρ ∘ globalArtinMap`, a finite-order `HeckeCharacter F` of conductor `𝔣(det ρ)`. Over `ℚ` its **Dirichlet character** is the primitive `χ : DirichletCharacter ℂ N`, `N = N(𝔣(det ρ))`, with `χ(p) = det ρ(Frob_p)` for `p ∤ N` (arithmetic Frobenius; by Kronecker–Weber and `ratDirichletEquiv`), so that `χ(−1) = det ρ(c)`. The LMFDB's `Dets` and `central_character`, and its displayed determinant, are this character, and in dimension one it is the representation itself. |
| Parity | `ρ` is **even** when `det ρ(c) = 1` and **odd** when `det ρ(c) = −1`, for `c` any complex conjugation (the LMFDB's `Is_Even`); it is a property of `det ρ`, not of `ρ(c)`. Over a number field with several real places the predicates are per place and "totally odd" is odd at every real place. |
| Frobenius–Schur indicator | Tau Ceti's `frobeniusSchurIndicator`, `ν₂(ρ) = |G|⁻¹ Σ_g χ(g²)` on the image group, with `+1` orthogonal, `−1` symplectic, `0` complex (the LMFDB's `Indicator`); an **irreducible** `ρ` is self-dual iff `ν₂(ρ) ≠ 0`. The indicator is additive, so the equivalence fails for reducible `ρ`: `χ ⊕ χ̄` with `χ ≠ χ̄` is self-dual with `ν₂ = 0`. |
| Character field and Galois conjugates | `ℚ(χ) ⊆ ℂ` is the subfield generated by the character values; it is an abelian number field inside `ℚ(ζ_e)`, `e` the exponent of the image, and its **conductor** `n` (the least `n` with `ℚ(χ) ⊆ ℚ(ζ_n)`) is the LMFDB's `CharacterField`. `Aut(ℂ)` acts on Artin representations by applying `σ` to matrix entries (`ρ^σ`), on characters by `σ ∘ χ`; the action factors through `Gal(ℚ(ζ_e)/ℚ) ≅ (ℤ/e)^×` acting by `χ ↦ (g ↦ χ(g^k))`. The **Galois orbit** is the orbit of the isomorphism class; its size is the LMFDB's `galois_conjugacy_size`. |
| Projective image | `Pρ : G_F → PGL(V)` is `ρ` followed by the quotient by scalars; the projective image is `ρ(G_F)ℂ^×/ℂ^×`, a finite subgroup of `PGL(V)` given up to conjugacy, and the projective field is `fixedField (ker Pρ)`. In dimension two the **type** is one of `cyclic`, `dihedral n` (`n ≥ 2`, `D₂ = V₄`, the LMFDB's `Dn`), `A₄`, `S₄`, `A₅`, by Klein's classification (Layer 7.6); an irreducible `ρ` is never cyclic. |
| Stem field | `IsStemField ρ E`: `E` is an intermediate field `F ⊆ E ⊆ K_ρ` whose Galois closure over `F` is `K_ρ`, equivalently `Gal(K_ρ/E)` contains no nontrivial normal subgroup of `Gal(K_ρ/F)`. The LMFDB's `NFGal`/`stem_field` is one stem field of minimal degree; which one is a labelling choice. |
| Container | `containerDegree ρ := min {[G : H] : H ≤ G, V^{ρ(H)} ≠ 0}` for `G = Gal(K_ρ/F)` and `ρ` irreducible; by Frobenius reciprocity it is the least degree of a permutation representation of `G` containing `ρ`, and the permutation group `G ↷ G/H` for a minimizing `H` is the container up to conjugacy. Its `T`-number is not formed here. |
| Ramified, bad, hard primes | `ρ` is **unramified at** `v` when `I_v ⊆ ker ρ`, equivalently `a_v(ρ) = 0`; the ramified primes are the LMFDB's `BadPrimes` (support of the conductor), and they are exactly the primes ramified in the Artin field `K_ρ`, since `ρ` is faithful on `Gal(K_ρ/F)`. The LMFDB's `HardPrimes` are the primes dividing the discriminant of the **stored** defining polynomial of the stem field, those at which the Frobenius class is not read from the factorization type; the set contains the bad primes, depends on the polynomial, and is not a target. What is intrinsic here is the recipe (7.8): at a prime not dividing the discriminant of a defining polynomial `f` of a stem field, the Frobenius class is the cycle type of `f` modulo the prime. |
| Mod-`ℓ` carrier | `ρ̄ : G_F →* GL n 𝔽` continuous for the discrete topology on a finite field `𝔽` of characteristic `ℓ`; equivalently of open kernel. The **codomain** is `GL n (ZMod ℓ)` (or the symplectic similitude group) when `𝔽 = 𝔽_ℓ`; image, order and index are of the image in that codomain; the determinant index is `[𝔽_ℓ^× : det ρ̄(G_F)]`. Frobenius matrices at an unramified `p ∤ ℓ` are the conjugacy class of `ρ̄(Frob_p)` in the codomain. The **conductor** is the prime-to-`ℓ` conductor `Conductor.primeToPConductor ρ̄`, which excludes the places above `ℓ` rather than assigning them exponent `0`. The **top slope** is the largest Artin slope of the splitting field at the places above `ℓ`: `1 + u` for `u` the largest upper ramification break there, `0` when unramified, `1` when tamely ramified. |
| Classifications | Klein's classification of finite subgroups of `PGL₂(ℂ)` is proved as a theorem. No finite subgroup of `PGL_n(ℂ)` for `n ≥ 3`, no transitive-group table and no list of groups `nTj` is asserted. |
| LMFDB intrinsic label prefix | `dim.cond` with `dim = dim ρ` and `cond = N(𝔣(ρ))` for `F = ℚ`; the container `dtj` (whose `T`-number is the polynomial Galois groups roadmap's `TransitiveGroupLabel` for `d ≤ 11`, by its Layers 6 and 1D), the orbit letter `a` and the conjugate letter `b` of a full label `dim.cond.dtj.a.b` are not formed here and are not targets. |

## What Mathlib supplies

- `Field.absoluteGaloisGroup F := AlgebraicClosure F ≃ₐ[F] AlgebraicClosure F` with the Krull
  topology and `IsTopologicalGroup`; `IntermediateField.fixingSubgroup_isOpen`,
  `isOpen_iff_finite` (an intermediate field is finite-dimensional iff its fixing subgroup is
  open), `fixedField_fixingSubgroup` for the Galois correspondence of a Galois extension.
- `ContRepresentation R G V` (a homomorphism `G →* V →L[R] V`), its `toRepresentation`;
  `Representation`, `Representation.character` with `char_one`, `char_conj`, `char_dual`,
  `char_tensor`, `char_iso`, `char_orthonormal`; `Representation.invariants`, `averageMap`;
  `Representation.dual`, `tprod`, `prod`, `ind` (`Mathlib/RepresentationTheory/Induced.lean`),
  `IsIrreducible`, `IsSemisimpleRepresentation`, Maschke; `FDRep`, `FDRep.of`, `FDRep.character`.
- `AlgHom.IsArithFrobAt`, `IsArithFrobAt` with `exists_of_isInvariant`, `conj`,
  `mul_inv_mem_inertia`, `eq_of_isUnramifiedAt`; `Ideal.inertia`, `MulAction.stabilizer`,
  `Ideal.Quotient.stabilizerHom`; `Algebra.IsUnramifiedAt`, `Ideal.ramificationIdx`,
  `Ideal.inertiaDeg`, `Ideal.primesOver`.
- `NumberField.InfinitePlace`, `IsReal`, `IsComplex`, `ComplexEmbedding.IsConj`,
  `InfinitePlace.IsRamified`; `NumberField.discr`, `Ideal.absNorm`, `differentIdeal`.
- `DirichletCharacter`, `conductor`, `Odd`, `Even`, `gaussSum`; `LSeries`; `NumberField.dedekindZeta`,
  `dedekindZeta_residue`; `Complex.Gammaℝ`, `Complex.Gammaℂ`, `riemannZeta`, `completedRiemannZeta`;
  `MeromorphicOn`, `MeromorphicAt`, `meromorphicOrderAt`, `AnalyticOnNhd`.
- `LinearMap.charpoly`, `Polynomial.reverse`, `LinearMap.det`, `LinearMap.restrict`,
  `Module.End.eigenspace`; `Matrix.GeneralLinearGroup`, `Matrix.ProjGenLinGroup` with `mk`,
  `lift`, `signDet`; `DihedralGroup`, `alternatingGroup`, `Equiv.Perm`, `QuaternionGroup`,
  `IsCyclic`, `Subgroup.index`, `Subgroup.normalCore`.
- `IsNonarchimedeanLocalField`, `ValuativeRel`, `IsLocalRing.ResidueField`, `Padic`.
- `WeierstrassCurve.IsMinimal R`, `HasGoodReduction R`, `HasMultiplicativeReduction R`,
  `HasSplitMultiplicativeReduction R`, `HasAdditiveReduction R` for a Weierstrass curve over the
  fraction field of a discrete valuation ring `R` (`Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean`),
  and `WeierstrassCurve.localPolynomial`.

## What Tau Ceti supplies

- `TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/`: `CompactSpace (Field.absoluteGaloisGroup K)`,
  `galoisSubgroup K L σ : OpenSubgroup G_K` with `galoisSubgroup_index`, `galoisSubgroupEquiv`
  (`G_L ≃ₜ* galoisSubgroup`), `absoluteGaloisGroupExtend`, `exists_absoluteGaloisGroupExtend_eq_conj`.
- `TauCeti/RepresentationTheory/GaloisLattice/FiniteQuotient.lean`: `Representation.isOpen_ker_of_finite`.
- `TauCeti/RepresentationTheory/CharacterTable/`: `ClassFunction k G` (a `Submodule k (G → k)`)
  with `comap`, `map`, `powMap`, `invMap`, `ofCharacter`, `ofFDRep`, `equivConjClasses`;
  `virtualCharacters k G : AddSubgroup (G → k)`, `irreducibleCharacters`,
  `irreducibleCharacter`, `irreducibleRepresentation`, `characterDegree`, `characterPairing`;
  `frobeniusSchurIndicator ρ`, `FDRep.frobeniusSchurIndicator`, `TauCeti.Representation.frobeniusSchurIndicator_eq_one_iff`,
  `_eq_neg_one_iff`, `_eq_zero_iff`, `Representation.frobeniusSchurIndicator_eq_one_iff_isRealizableOverReal`;
  `FDRep.conj_char` (`χ(g⁻¹) = conj χ(g)` over `ℂ`), `char_mem_adjoin_of_isPrimitiveRoot`,
  `isIntegral_char`, `norm_char_le_finrank`, `FDRep.exists_apply_eq_smul_of_norm_char_eq_finrank`;
  `FDRep.mem_ker_iff_char_eq`, `FDRep.ker_eq_ker_of_char_eq`; the Galois action
  `FDRep.map_character_eq_character_pow`, `FDRep.character_pow_eq_character_of_mem_range`.
- `TauCeti/RepresentationTheory/Induction/`: `indFDRep`, `finrank_indFDRep`, `TauCeti.character_indFDRep`,
  `indClassFun`, `FrobeniusReciprocity.lean` (`frobenius_reciprocity`), `Permutation.lean`
  (`indTrivialIso`, `char_ind_trivial`,
  `char_ofMulAction`), `VirtualCharacter.lean`, `Artin/Basic.lean`
  (`natCard_nsmul_mem_indVirtualCharacters_isCyclic`), `Brauer/Induction.lean`
  (`ClassFunction.indVirtualCharacters_eq_virtualCharacters_isElementary`,
  `ClassFunction.character_mem_indCharacterSpanInt_isElementary`), `Brauer/Characterization.lean`
  (`mem_virtualCharacters_iff_forall_comp_subtype_isElementary`), `Monomial.lean`.
- `TauCeti/RepresentationTheory/ProjectiveRepresentation/`: `IsProjectiveRep`, `toPGL`,
  `exists_isProjectiveRep_toPGL_eq`, `schurMultiplier`.
- `TauCeti/NumberTheory/NumberField/`: `Frobenius.lean` (`exists_isArithFrobAt`,
  `isArithFrobAt_eq_of_isUnramifiedAt`, `subsingleton_isArithFrobAt`, `isArithFrobAt_autCongr`),
  `Frobenius/Restriction.lean`, `Frobenius/Tower.lean`, `Frobenius/DecompositionGroup.lean`
  (`Ideal.isUnramifiedAt_iff_inertia_eq_bot`), `ArtinSymbol.lean` (`artinSymbol`,
  `artinSymbol_eq_mk_of_isArithFrobAt`, `artinSymbol_map_restrictNormalHom`,
  `artinSymbol_eq_one_iff_inertiaDeg_eq_one`), `Ideal/ArtinMap.lean` (`artinElement`,
  `artinHomAway`), `ComplexConjugation/Basic.lean` (`complexConjugationAt`,
  `isConj_complexConjugationAt`, `orderOf_complexConjugationAt`,
  `complexConjugationAt_restrictNormal_eq_one_of_isReal`, `_of_isComplex`),
  `RamifiedPrimes.lean`, `LocalGlobal/DecompositionGroup.lean` (`decompositionHom`,
  `decompositionEquiv`), `LocalGlobal/RamificationGroup.lean` (`ramificationGroup`,
  `card_ramificationGroup_eq_card_lowerRamificationGroup`), `LocalGlobal/Frobenius.lean`
  (`decompositionHom_eq_frobeniusAlgEquiv`), `DedekindZeta.lean`,
  `Global/HeckeCharacter/` (`HeckeCharacter`, `IsFiniteOrder`, `ofRayClassCharacter`,
  `conductor`, `finiteConductor`, `conductorExponent`, `infinityType`),
  `Global/RayClass/Character/Dirichlet.lean` (`ratDirichletEquiv`, `even_ratDirichletEquiv_iff`,
  `conductor_finitePart_eq_span`).
- `TauCeti/NumberTheory/LocalField/`: `Unramified/Inertia/Basic.lean` (`inertiaSubgroup`,
  `IsArithFrobeniusLift`, `exists_isArithFrobeniusLift`, `unramifiedQuotient`),
  `WildInertia.lean` (`wildInertiaSubgroup`, `isProP_wildInertiaSubgroup`), `RamificationGroup.lean`
  (`lowerRamificationGroup`, `largestLowerJump`), `Herbrand/` (`upperRamificationGroup`,
  `UpperJump`, `herbrand`, `HasseArf.lean`), `Tame/` (`tameQuotient`), `Frobenius.lean`.
- `TauCeti/NumberTheory/ClassFieldTheory/`: `Local/ArtinMap.lean`, `ClassField.lean`
  (`classField`, `galClassFieldEquiv`), `Global/`.
- `TauCeti/NumberTheory/ArithmeticDirichletSeries/`: `IdealArithmeticFunction`, `EulerProductData`
  with `localPowerSeries`, `eulerFactor`, `idealTerm`, `UnitaryIdealWeight`.
- `TauCeti/AlgebraicGeometry/EllipticCurve/`: `tateModuleGaloisRepresentation`,
  `tateModuleWeilPairing`, `IsSemistable`, and the minimal-model and local-polynomial theorems over
  Mathlib's reduction classes.
- `TauCeti/NumberTheory/Chebotarev/`: `frobeniusPrimeSet`, `mem_frobeniusPrimeSet_iff_artinSymbol_eq`.

## What is missing

Nothing in Mathlib or Tau Ceti names an Artin representation, an inertia-invariant local
polynomial, an Artin L-function, a completed Artin L-function, an Artin root number, a projective
image type, a stem field, a container, or a mod-`ℓ` Galois representation as an object with its
LMFDB invariants. Specifically absent, and built here:

- the carrier of Layer 1 with open-kernel, Artin-field and inflation API, and the finite-level
  dictionary for characters, invariants, duals and induction;
- inertia invariants of a local Artin representation and the local polynomial, with its
  independence of the Frobenius lift and its behaviour under induction and inflation (Layer 2);
- local polynomials of a global `ρ` and their independence of the prime above `v` (Layer 3);
- the Euler product, its absolute convergence, Artin's formalism, `ζ_K = ∏ L(s, χ)^{χ(1)}`
  (Layer 3);
- the meromorphic Artin L-function, its completion, functional equation, root number and card
  (Layer 4);
- the general conductor–discriminant formula as a statement about `NumberField.discr` and
  `relDiscr` (Layer 5);
- the root numbers of `p`-adic fields and the elliptic local root numbers, with Rohrlich's
  formulas (Layer 6);
- Klein's classification of finite subgroups of `PGL₂(ℂ)` and the projective type predicates,
  stem fields, containers, the Galois action on Artin representations (Layer 7);
- the conjectures as named propositions (Layer 8);
- the mod-`ℓ` carrier with its image invariants, Frobenius matrices, kernel fields and top slope
  (Layer 9).

## Layer 1: Artin representations of a field

Standing hypotheses: `F` is a field, `G_F := Field.absoluteGaloisGroup F`, `V` a finite-dimensional
complex normed space. No arithmetic is used in this layer: every statement holds for an arbitrary
field, the number-field and local-field specializations begin in Layers 2 and 3.

### 1.1 The carrier, open kernels and finite image

Define `ArtinRep F V` as the structure extending Mathlib's `ContRepresentation ℂ G_F V` by the
single field `continuous_toFun : Continuous (ρ : G_F → V →L[ℂ] V)`. Prove, for `ρ : ArtinRep F V`:

- `ρ.ker` (the kernel of the underlying `G_F →* (V →L[ℂ] V)`) is an open normal subgroup
  (`isOpen_ker`), hence closed and of finite index;
- `Set.range ρ` is finite, and the image `ρ.range` is a finite subgroup of `GL(V)`
  (`finite_range`);
- conversely a homomorphism `G_F →* (V →L[ℂ] V)` with open kernel is continuous
  (`continuous_of_isOpen_ker`, from Tau Ceti's `Representation.isOpen_ker_of_finite` read
  backwards), so the three conditions are equivalent (`continuous_iff_isOpen_ker`, stated on the
  bare `ContRepresentation`, so that the continuity field is the only condition the structure adds).

The forward direction is the no-small-subgroups argument of the
[arithmetic Galois representations roadmap](../ArithmeticGaloisRepresentations/README.md) §1.4,
consumed: a neighbourhood `{g : ‖g − 1‖ < 1}` of the identity in `GL(V)` contains no nontrivial
subgroup, and `G_F` has a basis of open subgroups at `1` (profiniteness), so `ρ⁻¹` of that
neighbourhood contains an open subgroup killed by `ρ`.

**New object: `ArtinRep`.** Basic API:

- *Constructors.* `ArtinRep.trivial`, `ofFinite` (1.2), `ofLinearCharacter` for a continuous
  `G_F →* ℂ^×`, `prod` (direct sum), `tprod`, `dual`, `conj σ` for `σ : ℂ ≃+* ℂ` (1.6),
  `restrict` to `G_L` and `ind` from `G_L` (1.5).
- *Morphisms.* `ArtinRep.Iso ρ ρ'` is a continuous equivariant linear equivalence; `Iso` is an
  equivalence relation, and every linear equivariant equivalence is automatically continuous
  (finite dimension).
- *Comparison.* `toRepresentation` is injective; `toContinuousRep ρ : ContinuousRep G_F ℂ V` of the
  [étale cohomology foundations roadmap](../EtaleCohomologyFoundations/README.md) §F.4.0 (joint
  continuity of `G_F × V → V` is continuity of `ρ` in finite dimension) with inverse
  `ofContinuousRep`; `character ρ := ρ.toRepresentation.character`
  is a continuous class function on `G_F`, constant on the cosets of `ρ.ker`, with
  `character ρ 1 = finrank V` and `character (dual ρ) g = conj (character ρ g)`.
- *Edge cases.* `V = 0` is an Artin representation with `ker = ⊤` and `character = 0`; the
  trivial representation on `V` has `ker = ⊤`.

*Prerequisites:* Mathlib `ContRepresentation`, `Field.absoluteGaloisGroup`, Krull topology; Tau Ceti
`CompactSpace (Field.absoluteGaloisGroup K)`, `Representation.isOpen_ker_of_finite`;
[arithmetic Galois representations](../ArithmeticGaloisRepresentations/README.md) §1.4;
[étale cohomology foundations](../EtaleCohomologyFoundations/README.md) §F.4.0.

### 1.2 The Artin field and the finite level

Define `artinField ρ : IntermediateField F (AlgebraicClosure F) := IntermediateField.fixedField ρ.ker`
and prove: `FiniteDimensional F (artinField ρ)` and `IsGalois F (artinField ρ)` (an open normal
subgroup fixes a finite Galois extension, by `isOpen_iff_finite` and normality);
`(artinField ρ).fixingSubgroup = ρ.ker` (the Galois correspondence for closed subgroups);
`finrank F (artinField ρ) = Nat.card ρ.range`.

Define the inflation `ofFinite L W : ArtinRep F V` of a `W : Representation ℂ (L ≃ₐ[F] L) V`
along `AlgEquiv.restrictNormalHom L`, for `L` a finite Galois intermediate field of
`AlgebraicClosure F`, by composing with `LinearMap.toContinuousLinearMap`, and prove that it is
continuous (its kernel contains the open `L.fixingSubgroup`), that `character (ofFinite L W)` is
`W.character ∘ restrictNormalHom L`, and that `ofFinite` is injective on isomorphism classes and
compatible with `prod`, `tprod`, `dual`.

Define the faithful finite-level representation `toFinite ρ : Representation ℂ (artinField ρ ≃ₐ[F] artinField ρ) V`
through the quotient `G_F ⧸ ρ.ker ≃* Gal(artinField ρ / F)` (Mathlib's
`AlgEquiv.restrictNormalHom` is surjective with kernel the fixing subgroup), and prove
`ofFinite (artinField ρ) (toFinite ρ) = ρ`, that `toFinite ρ` is faithful, and more generally
`exists_ofFinite_eq_iff`: `ρ` is `ofFinite L W` for some `W` iff `L` contains the Artin field
(`artinField ρ ≤ L`), and then `W` is unique.

⚠ The Artin field is the field cut out by `ker ρ`, not by `ker (character ρ)` as a function:
the two agree (`FDRep.ker_eq_ker_of_char_eq`, `mem_ker_iff_char_eq`), and a lemma of this
milestone records that `artinField ρ` is the fixed field of `{g | character ρ g = character ρ 1}`,
so that the LMFDB's computation of the Artin field from the character table is a theorem.

*Prerequisites:* Mathlib `IntermediateField.fixedField`, `isOpen_iff_finite`,
`fixedField_fixingSubgroup`, `AlgEquiv.restrictNormalHom`, `LinearMap.toContinuousLinearMap`;
Tau Ceti `FDRep.mem_ker_iff_char_eq`; Layer 1.1.

### 1.3 Semisimplicity, irreducibility and characters

Transport Maschke and the character theory of the finite group `Gal(artinField ρ/F)` to `ρ`:
every Artin representation is semisimple (`isSemisimple`), is a finite direct sum of irreducible
Artin representations, two Artin representations are isomorphic iff their characters agree
(`iso_iff_character_eq`), and irreducibility of `ρ` is irreducibility of `toFinite ρ`,
equivalently `characterPairing χ χ = 1`. The multiplicity of an irreducible
`π` in `ρ` is `⟨χ_ρ, χ_π⟩`, and `dim V^{G_F} = ⟨χ_ρ, 1⟩`. The character of `ρ` determines
`artinField ρ`, `dim ρ`, the invariants under every closed subgroup, and (Layer 7) every LMFDB
invariant, so the LMFDB's storage of a representation by its character table is a faithful
storage.

*Prerequisites:* Mathlib Maschke (`IsSemisimpleRepresentation` for `char ∤ |G|`),
`char_orthonormal`; Tau Ceti `characterPairing`, `irreducibleCharacters`,
`TauCeti.character_eq_sum_nsmul_irreducibleCharacter`; Layer 1.2.

### 1.4 Operations and their characters

For Artin representations `ρ, ρ'` of `F`: `prod ρ ρ'` on `V × V'` with character `χ + χ'`;
`tprod ρ ρ'` on `V ⊗ V'` with character `χ χ'`; `dual ρ` on `Module.Dual ℂ V` with character
`g ↦ χ(g⁻¹) = conj χ(g)`; `det ρ : G_F →* ℂ^×`, continuous, the determinant of the
one-dimensional Artin representation `⋀^{dim V} ρ`, with `det (prod ρ ρ') = det ρ · det ρ'` and
`det (dual ρ) = (det ρ)⁻¹`; the twist `ρ ⊗ ψ` by a continuous character `ψ : G_F →* ℂ^×`, with
`det (ρ ⊗ ψ) = det ρ · ψ^{dim ρ}`; and the symmetric and exterior squares with their characters
`½(χ(g)² ± χ(g²))`, consumed from the Frobenius–Schur layer of
[`RepresentationTheory/CharacterTheory`](../RepresentationTheory/CharacterTheory/README.md) at the
finite level. Each operation commutes with `ofFinite`.

*Prerequisites:* Mathlib `Representation.prod`, `tprod`, `dual`, `char_tensor`, `char_dual`,
`LinearMap.det`; Tau Ceti `Representation.charTwist`; Layer 1.2.

### 1.5 Restriction and induction along a finite extension

For a finite separable extension `L/F` embedded in `AlgebraicClosure F` by `σ`, Tau Ceti's
`galoisSubgroupEquiv : G_L ≃ₜ* galoisSubgroup F L σ` identifies `G_L` with an open subgroup of
index `[L : F]`. Define `restrict ρ : ArtinRep L V` (composition with `absoluteGaloisGroupExtend`)
and `ind τ : ArtinRep F (IndV …)` for `τ : ArtinRep L W`, by Mathlib's `Representation.ind` along
the inclusion of the open subgroup, and prove: `dim (ind τ) = [L : F] dim τ`; continuity (the
kernel of `ind τ` contains the normal core of `ker τ`, which is open); the character of `ind τ` is
`indClassFun` of the character of `τ` (Tau Ceti `TauCeti.character_indFDRep` at the finite level);
Frobenius reciprocity `⟨χ_{ind τ}, χ_ρ⟩_F = ⟨χ_τ, χ_{restrict ρ}⟩_L`; transitivity in towers;
independence of the embedding `σ` up to isomorphism (`exists_absoluteGaloisGroupExtend_eq_conj`);
`ind (trivial L) ≅ ofFinite` of the permutation representation of `Gal(K/F)` on
`Hom_F(L, K)` for any Galois `K ⊇ L` (Tau Ceti `indTrivialIso`, `char_ofMulAction`); and
`artinField (ind τ) = ` the Galois closure over `F` of `artinField τ`.

*Prerequisites:* Mathlib `Representation.ind`, `Subgroup.normalCore`; Tau Ceti `galoisSubgroup`,
`galoisSubgroupEquiv`, `absoluteGaloisGroupExtend`, `indFDRep`, `TauCeti.character_indFDRep`,
`frobenius_reciprocity`, `indTrivialIso`; Layers 1.2–1.4.

Lean: `restrict` is stated in `Suggested.lean`; `ind`, whose carrier needs a choice of coset
representatives of the open subgroup `G_L`, and its API are specified in this README only.

**Checks.**

- (value) `ind_{ℚ(i)/ℚ} 1 ≅ 1 ⊕ χ₋₄`, with `χ₋₄` the character `1.4.2t1.a.a`: dimension `2`,
  determinant `χ₋₄`, hence odd with trace of conjugation `0`.
- (value) for the cubic field `3.1.23.1`, `ind 1 ≅ 1 ⊕ ρ` with `ρ` the representation
  `2.23.3t2.b.a`; the character of `ind 1` at `Frob_p` is the number of roots of `x³ − x + 1`
  modulo `p`: `0` at `p = 2, 3, 13`, `1` at `p = 5, 7, 11`, `3` at `p = 59`, which is `1` plus the
  traces `−1, 0, 2` of `ρ` listed under §Worked examples.
- (boundary) along `L = F` with `σ` the identity, `ind τ ≅ τ`; in general
  `dim (ind τ) = [L : F] · dim τ`.
- (non-example) for `[L : F] > 1`, `ind (trivial L)` is not irreducible: by Frobenius reciprocity
  it contains the trivial representation of `F` exactly once.
- (comparison) at the finite level the character of `ind τ` is Tau Ceti's `indClassFun` of the
  character of `τ` (`TauCeti.character_indFDRep`).

### 1.6 The Galois action, the character field, and virtual representations

For `σ : ℂ ≃+* ℂ`, define `conj σ ρ`, the representation on `V` with `σ` applied to matrix
entries in a basis (equivalently base change along `σ`), and prove its character is `σ ∘ χ`, that
`conj σ` preserves dimension, irreducibility, kernel (hence Artin field), determinant up to `σ`,
and induction, and that `conj (σ ∘ τ) = conj σ ∘ conj τ` on isomorphism classes. Define the
**character field** `characterField ρ : IntermediateField ℚ ℂ := ℚ(χ(g) : g ∈ G_F)` and prove:
it is finite over `ℚ` and contained in `ℚ(ζ_e)` for `e` the exponent of `ρ.range` (Tau Ceti
`char_mem_adjoin_of_isPrimitiveRoot`); the stabilizer of the isomorphism class of `ρ` in `Aut(ℂ)`
is the pointwise stabilizer of `characterField ρ`; the orbit of `ρ` under `Aut(ℂ)` is finite of
size `[characterField ρ : ℚ]`, and it is the orbit under `Gal(ℚ(ζ_e)/ℚ) ≅ (ℤ/e)^×` acting by
`χ ↦ (g ↦ χ(g^k))` (Tau Ceti `FDRep.map_character_eq_character_pow`). Define
`characterFieldConductor ρ : ℕ`, the least `n` with `characterField ρ ≤ ℚ(ζ_n)`, and prove it
divides `e`; `conj` by complex conjugation is `dual` (Layer 1.4).

Define the Grothendieck group `VirtualArtinRep F` of isomorphism classes under direct sum, with
its ring structure from `tprod`, its character map into the class functions on `G_F`, injective
with image the `ℤ`-span of irreducible characters; and read Brauer's theorem on it: for a finite
Galois `K/F` every virtual character of `Gal(K/F)` is a `ℤ`-combination of characters induced
from one-dimensional characters of subgroups (Tau Ceti
`ClassFunction.character_mem_indCharacterSpanInt_isElementary` and the nilpotent-monomial
theorem), hence every virtual Artin representation of `F` is `Σ nᵢ ind_{Lᵢ/F} ψᵢ` with `Lᵢ ⊆ K`
and `ψᵢ` one-dimensional Artin representations of `Lᵢ` (`exists_brauer_expression`). This is the
only form in which Brauer induction is used below; no second induction theorem is proved.

*Prerequisites:* Tau Ceti `ClassFunction.map`, `virtualCharacters`,
`char_mem_adjoin_of_isPrimitiveRoot`, `FDRep.map_character_eq_character_pow`,
`ClassFunction.character_mem_indCharacterSpanInt_isElementary`, `FDRep.exists_character_eq_indClassFun_of_isNilpotent`;
[`RepresentationTheory/InductionRestriction`](../RepresentationTheory/InductionRestriction/README.md)
Layer 6; [`RepresentationTheory/CharacterTheory`](../RepresentationTheory/CharacterTheory/README.md)
Layer 4; Layers 1.3–1.5.

## Layer 2: local Artin representations

Standing hypotheses: `K` is a nonarchimedean local field (`[ValuativeRel K] [TopologicalSpace K]
[IsNonarchimedeanLocalField K]`, the context of Tau Ceti's `inertiaSubgroup`), `q` its residue
cardinality, `I_K := inertiaSubgroup K`, `P_K := wildInertiaSubgroup K`, and `ρ : ArtinRep K V`.

### 2.1 Inertia invariants and the ramification predicates

Define `inertiaInvariants ρ : Submodule ℂ V := (ρ.toRepresentation.comp I_K.subtype).invariants`
and `wildInvariants ρ` likewise for `P_K`; prove both are `G_K`-stable (inertia is normal), that
`inertiaInvariants ρ ≤ wildInvariants ρ`, and that `inertiaInvariants` of `prod`, `dual`,
`restrict` and `ofFinite` are the expected ones (for `ofFinite L W` it is the invariants of the
image of `I_K` in `Gal(L/K)`, Tau Ceti's `lowerRamificationGroup_zero_eq_map_inertiaSubgroup`).
Define `IsUnramified ρ := I_K ≤ ρ.ker` and `IsTame ρ := P_K ≤ ρ.ker`, and prove
`IsUnramified ρ ↔ inertiaInvariants ρ = ⊤`, `IsTame ρ ↔ wildInvariants ρ = ⊤`, that
`IsUnramified ρ` iff `artinField ρ` is unramified over `K`, and that `IsTame ρ` iff it is tamely
ramified; the image `ρ(P_K)` is a `p`-group (Tau Ceti `isProP_wildInertiaSubgroup`).

*Prerequisites:* Mathlib `Representation.invariants`; Tau Ceti `inertiaSubgroup`,
`wildInertiaSubgroup`, `isProP_wildInertiaSubgroup`, `lowerRamificationGroup_zero_eq_map_inertiaSubgroup`;
Layer 1.

### 2.2 The local polynomial and the local Euler factor

Define `localPolynomial ρ : ℂ[X] := (LinearMap.charpoly ((ρ Φ).restrict (inertiaInvariants ρ))).reverse`
for `Φ` a Frobenius lift chosen by `exists_isArithFrobeniusLift`, and prove it is independent of
the choice (two lifts differ by an element of `I_K`, which acts trivially on the invariants), is
`det(1 − X ρ(Φ))` on `V^{I_K}` as a determinant, has degree `dim V^{I_K} ≤ dim V`, constant
coefficient `1`, and roots of unity as inverse roots (`ρ(Φ)` has finite order), hence
coefficients in `characterField ρ`'s ring of integers. Define
`localEulerFactor ρ s := ((localPolynomial ρ).eval (q^{−s}))⁻¹`.

API: `localPolynomial_of_isUnramified` (the reversed characteristic polynomial of `ρ(Φ)` on all
of `V`); `localPolynomial_prod` (multiplicativity); the local polynomial of `dual ρ` has the
complex-conjugate coefficients; twisting by an unramified character `ψ` rescales `X` by `ψ(Φ)`;
the local polynomial of `ofFinite L W` is computed in `Gal(L/K)` with
`lowerRamificationGroup K L 0` and `frobeniusAlgEquiv` of the residue extension; and the
**induction formula**: for `L/K` finite separable of residue degree `f` and `τ : ArtinRep L W`,
`localPolynomial (ind τ) = (localPolynomial τ).comp (X^f)`, i.e. `L(s, ind τ) = L(s, τ)` with
`q_L = q^f`. The proof is Mackey at the finite level: `(Ind W)^{I_K} ≅ (W^{I_L})^{f}` with `Φ_K`
acting as the cyclic block of `Φ_L` (Deligne 1973, 3.8(ii)); the
[arithmetic Galois representations roadmap](../ArithmeticGaloisRepresentations/README.md) §2.5
proves the same identity for Weil–Deligne representations with geometric Frobenius, and its
`charpoly_cyclicBlock` is the linear-algebra input consumed here.

⚠ `localPolynomial` is formed on `V^{I_K}`, not on `V`: for the ramified quadratic character of
`ℚ_3(√−3)/ℚ_3` it is `1`, and for the two-dimensional dihedral representation of Layer 7's
worked example at `23` it is `1 − X`, not `1 − X²`.

*Prerequisites:* Mathlib `LinearMap.charpoly`, `Polynomial.reverse`, `LinearMap.restrict`; Tau
Ceti `IsArithFrobeniusLift`, `exists_isArithFrobeniusLift`, `frobeniusAlgEquiv`; Layers 1.5, 2.1;
[arithmetic Galois representations](../ArithmeticGaloisRepresentations/README.md) §2.5
(`cyclicBlock`, `charpoly_cyclicBlock`).

### 2.3 Conductors of local Artin representations, consumed

Record the specialization of the [arithmetic Galois representations roadmap](../ArithmeticGaloisRepresentations/README.md)
§§3.1–3.2 to this carrier: `a(ρ) := Conductor.artinConductorNat ρ`, `Sw(ρ) := Conductor.swanConductor ρ`
(an integer by that roadmap's *Hasse–Arf integrality*), `a(ρ) = codim V^{I_K} + Sw(ρ)`,
`a(ρ) = 0 ↔ IsUnramified ρ`, `Sw(ρ) = 0 ↔ IsTame ρ`, `a(prod ρ ρ') = a(ρ) + a(ρ')`,
`a(dual ρ) = a(ρ)`, the lower-sum formula on any finite Galois quotient, and for one-dimensional
`ρ` the equality with `characterConductorExp (ρ ∘ artinMap)` of the
[class field theory roadmap](../ClassFieldTheory/README.md) Layer 7. Nothing is proved here; the
milestone is the adapter from `ArtinRep` to that roadmap's hypotheses (finite wild image is
automatic) and the statement of these equalities on this carrier.

*Prerequisites:* [arithmetic Galois representations](../ArithmeticGaloisRepresentations/README.md)
§§3.1, 3.2, 3.4, 3.5; [class field theory](../ClassFieldTheory/README.md) Layer 7; Layer 2.1.

### 2.4 The local root number, consumed, and the root number of a `p`-adic field

Record `W(ρ, ψ) := epsilonWeil (ρ ⊗ |·|^{1/2}) ψ dx_ψ` of that roadmap's §2.7 (the restriction of
`ρ` to the Weil group of the [class field theory roadmap](../ClassFieldTheory/README.md) Layer 9
has open kernel on inertia, so it is in the domain of `epsilonWeil`), with: `|W(ρ, ψ)| = 1`;
`W(prod ρ ρ', ψ) = W(ρ, ψ) W(ρ', ψ)`; `W(ρ, ψ) = 1` for unramified `ρ` and `n(ψ) = 0`;
`W(ρ, ψ(b·)) = det ρ(Art_K(b)) W(ρ, ψ)`; `W(ρ, ψ) W(ρ^∨, ψ) = det ρ(Art_K(−1))`;
`W(ind τ, ψ_K) = λ(L/K, ψ_K)^{dim τ} W(τ, ψ_K ∘ Tr_{L/K})` with the Langlands constant
`λ(L/K, ψ_K) := W(ind 1_L, ψ_K)`; and for one-dimensional `ρ` the Gauss-sum formula
`tateLocalConstant`. The LMFDB's root number of a `p`-adic field `K/ℚ_p` is

```text
padicFieldRootNumber K := W(ind_{G_K}^{G_{ℚ_p}} 1, ψ̄_p),   ψ̄_p(x) = e^{2πi{x}_p},
```

and the milestone proves `padicFieldRootNumber K = χ_{disc K}(−1) · λ(K/ℚ_p, ψ_p)` by the
scaling law, where `χ_{disc K}` is `det (ind 1)`, the quadratic character of the discriminant
root field; its fourth-root-of-unity property is Layer 6.4.

*Prerequisites:* [arithmetic Galois representations](../ArithmeticGaloisRepresentations/README.md)
§2.7 (*Arithmetic character constants*, *Deligne–Langlands local constants*);
[class field theory](../ClassFieldTheory/README.md) Layers 7 and 9; Layers 1.5, 2.1.

Lean: none; `W(ρ, ψ)` and `padicFieldRootNumber` rest on that roadmap's `epsilonWeil` and are
specified in this README only. `padicFieldRootNumber K` is defined for a finite extension `K` of
`ℚ_p`, with `ind` along any `ℚ_p`-embedding of `K` into `ℚ̄_p` (the value does not depend on it).

**Checks.**

- (value) `padicFieldRootNumber ℚ₂(i) = i`, while `W(ind 1, ψ₂) = −i` in the convention of the
  local constants: the two differ by `χ_disc(−1) = −1`, since `−1` is not a norm from `ℚ₂(i)`.
- (boundary) `padicFieldRootNumber ℚ_p = 1` for the trivial extension, and
  `padicFieldRootNumber ℚ₂(√−3) = 1` for the unramified quadratic extension.
- (value) `padicFieldRootNumber ℚ₃(√−3) = i` and `padicFieldRootNumber ℚ₃(√3) = −i`, the second the
  twist of the first by the unramified quadratic character, `η(3) = −1`.
- (convention) at the real place the conjugate character gives `W(sgn, ψ̄_∞) = −i`, the value the
  `lf.root_number` knowl states; the standard character gives `W(sgn, ψ_∞) = i`.

## Layer 3: local data of a global Artin representation and the Euler product

Standing hypotheses: `F` is a number field, `ρ : ArtinRep F V`, `K := artinField ρ` with group
`G := Gal(K/F)`, `W := toFinite ρ`; `v` a finite place (`HeightOneSpectrum (𝓞 F)`, with its
prime ideal `𝔭 = v.asIdeal`), `Q` a prime of `𝓞 K` over `𝔭`, `I_Q := Q.inertia G`,
`D_Q := MulAction.stabilizer G Q`.

### 3.1 Local polynomials of a global representation

Define `localPolynomialAt ρ v : ℂ[X]` as `(LinearMap.charpoly ((W σ).restrict (W.comp I_Q.subtype).invariants)).reverse`
for `Q` any prime over `𝔭` and `σ` any `IsArithFrobAt (𝓞 F) σ Q` (Tau Ceti `exists_isArithFrobAt`),
and prove independence of `σ` (Mathlib `IsArithFrobAt.mul_inv_mem_inertia`) and of `Q`
(`IsArithFrobAt.conj` and `inertia` of a conjugate prime, the invariants being carried by `W(τ)`),
and independence of the finite Galois extension through which `ρ` factors (inflation invariance:
the inertia and Frobenius of `L ⊇ K` restrict to those of `K`, Tau Ceti `Frobenius/Restriction.lean`).
Prove the comparison with Layer 2 through the completion: `localPolynomialAt ρ v` is
`localPolynomial` of the restriction of `ρ` to `G_{F_v}` read through Tau Ceti's
`decompositionEquiv : D_Q ≃* Gal(K_Q/F_v)` and the identification of `I_Q` with
`lowerRamificationGroup F_v K_Q 0` (`card_ramificationGroup_eq_card_lowerRamificationGroup`,
`decompositionHom_eq_frobeniusAlgEquiv`).

API: `IsUnramifiedAt ρ v := I_Q ≤ ker W` (independent of `Q`), equivalent to
`Algebra.IsUnramifiedAt` of `𝔭` in `artinField ρ` and to `a_v(ρ) = 0`;
`ramifiedSet ρ : Finset (HeightOneSpectrum (𝓞 F))` (finite, Tau Ceti `finite_ramifiedPrimes`
through the Artin field), the LMFDB's `BadPrimes`, equal to the set of primes ramified in
`artinField ρ` (faithfulness of `toFinite ρ`); `frobeniusCharpoly ρ v : ℂ[X]` at an unramified `v`, the characteristic
polynomial of `W(σ)` for any `σ` in `artinSymbol 𝔭`, with
`localPolynomialAt ρ v = (frobeniusCharpoly ρ v).reverse` there; the trace of Frobenius
`frobeniusTrace ρ v = character ρ (σ)`; and `localPolynomialAt_prod`, `_dual`, `_ofFinite`.

*Prerequisites:* Mathlib `IsArithFrobAt`, `Ideal.inertia`, `MulAction.stabilizer`; Tau Ceti
`exists_isArithFrobAt`, `isArithFrobAt_eq_of_isUnramifiedAt`, `artinSymbol`,
`Frobenius/Restriction.lean`, `decompositionEquiv`, `card_ramificationGroup_eq_card_lowerRamificationGroup`,
`decompositionHom_eq_frobeniusAlgEquiv`, `finite_ramifiedPrimes`; Layers 1.2, 2.2.

### 3.2 Induction and the local polynomial

For `L/F` finite with `τ : ArtinRep L W'`, prove
`localPolynomialAt (ind τ) v = ∏_{w | v} (localPolynomialAt τ w).comp (X^{f(w/v)})`, from Layer 2.2
at each completion and the Mackey decomposition of `Ind` restricted to `D_Q` over the double
cosets `D_Q \ G / Gal(K/L)`, which are the primes `w` of `L` above `v` (Tau Ceti's double-coset
splitting law in the [completed number-field arithmetic roadmap](../../Completed/NumberFieldArithmetic/README.md)
Layer 1.4). With `τ = 1_L`: `localPolynomialAt (ind 1_L) v = ∏_{w|v} (1 − X^{f(w/v)})`, the
local factor of `ζ_L` at `v`.

*Prerequisites:* [completed number-field arithmetic](../../Completed/NumberFieldArithmetic/README.md)
Layer 1.4; Layers 1.5, 2.2, 3.1.

### 3.3 Complex conjugation and the archimedean data

For a real place `v` of `F`, define `nMinus ρ v` and `nPlus ρ v := dim V − nMinus ρ v`, the
dimensions `n₋, n₊` of the `∓1`-eigenspaces of `W(c)` for `c` the complex conjugation at a place `w`
of `K` above `v` (Tau Ceti `complexConjugationAt w hw` when `w` is complex, `1` when real), and
prove independence of `w` (conjugate places give conjugate elements) and `n₊ + n₋ = dim V`;
define `traceOfComplexConjugation ρ v := n₊ − n₋ = character ρ c ∈ ℤ`; prove
`det ρ(c) = (−1)^{n₋}`, so `IsOddAt ρ v ↔ Odd n₋`, and the compatibility with `prod`, `dual`
(unchanged), twists by a character `ψ` (`ψ(c) = −1` swaps the two), `ofFinite` and `ind`
(`n₊(ind τ, v) = Σ_{w|v real} n₊(τ, w) + Σ_{w|v complex} dim τ`). For `F = ℚ` these are the
LMFDB's `trace_complex_conjugation` and its `(dim ± trace)/2`.

*Prerequisites:* Tau Ceti `complexConjugationAt`, `isConj_complexConjugationAt`,
`complexConjugationAt_restrictNormal_eq_one_of_isReal`, `_of_isComplex`; Mathlib
`Module.End.eigenspace`; Layers 1.4, 1.5, 3.1.

### 3.4 The Euler product on `Re s > 1`

Define the Artin L-series as the `EulerProductData F` of
[`ArithmeticDirichletSeries`](../../Completed/ArithmeticDirichletSeries/README.md) with local
power series the formal reciprocal of `localPolynomialAt ρ v` (its inverse roots have absolute
value `1`), `localEulerFactorAt ρ v s := P_v(ρ, Nv^{−s})^{−1}` and
`artinLSeries ρ s := ∏' v, localEulerFactorAt ρ v s` on `Re s > 1`. Prove absolute
convergence and multipliability for `Re s > 1` (the product is dominated by `ζ_F(Re s)^{dim V}`),
agreement with the norm-regrouped Dirichlet series `Σ_𝔞 a_ρ(𝔞) N𝔞^{−s}` of that roadmap, and
nonvanishing on `Re s > 1`. Prove the **formalism**:

- `artinLSeries (prod ρ ρ') = artinLSeries ρ · artinLSeries ρ'` (additivity);
- `artinLSeries (ind τ) = artinLSeries τ` for `τ` over a finite extension `L/F` (induction
  invariance; from Layer 3.2 and the bijection between places of `L` and pairs `(v, w | v)`);
- `artinLSeries (ofFinite L W) = artinLSeries (ofFinite L' (inflate W))` for `L ⊆ L'`
  (inflation invariance; immediate from Layer 3.1);
- `artinLSeries (trivial) = dedekindZeta F` on `Re s > 1`;
- `dedekindZeta K = ∏_{χ ∈ Irr(G)} (artinLSeries (ρ_χ))^{χ(1)}` for a finite Galois `K/F`
  (`dedekindZeta_eq_prod_artinLSeries_pow`), from `ind_{K/F} 1 = ⊕ ρ_χ^{χ(1)}` (Tau Ceti
  `TauCeti.character_eq_sum_nsmul_irreducibleCharacter` for the regular character and `indTrivialIso`);
- for one-dimensional `ρ`, `artinLSeries ρ = heckeLFunctionC` of the primitive ray-class
  presentation of `ρ ∘ globalArtinMap`: at an unramified `v`
  both local factors are `(1 − ρ(Frob_v) Nv^{−s})⁻¹` by `globalArtinMap_local` and
  `unramifiedCoordinate_artinMap`, and at a ramified `v` both are `1` (the primitive Hecke
  presentation omits exactly the conductor primes, the L-functions roadmap's *Primitive versus
  presented*). Over `ℚ` this is `LSeries` of the primitive Dirichlet character of
  §Pinned conventions, through `ratDirichletEquiv` and `kroneckerWeber`.

⚠ Both sides of each identity are stated as functions on the half-plane `Re s > 1`, where the
products converge; their meromorphic forms are Layer 4.

*Prerequisites:* Tau Ceti `EulerProductData`, `eulerFactor`, `dedekindZeta_eulerProduct_hasProd`,
`TauCeti.character_eq_sum_nsmul_irreducibleCharacter`, `indTrivialIso`, `ratDirichletEquiv`; Mathlib
`NumberField.dedekindZeta`, `LSeries`; [class field theory](../ClassFieldTheory/README.md)
Layers 11, 13 (`globalArtinMap`, `globalArtinMap_local`, `kroneckerWeber`); [L-functions](../LFunctions/README.md)
Layer 5 (`heckeLFunctionC`, *Primitive versus presented*); Layers 3.1–3.2.

### 3.5 Conductors of global representations, consumed

Record `𝔣(ρ) := Conductor.globalConductor ρ ∅` of the [arithmetic Galois representations roadmap](../ArithmeticGaloisRepresentations/README.md)
§3.3 on this carrier: `v_𝔭(𝔣(ρ)) = a_v(ρ)` with `a_v` the exponent of Layer 2.3 at the
completion; `𝔣(ρ) = 1 ↔ ∀ v, IsUnramifiedAt ρ v`; multiplicativity on `prod`; invariance under
`dual` and isomorphism; and the induction formula `𝔣(ind τ) = 𝔡_{L/F}^{dim τ} · N_{L/F}(𝔣(τ))`
(that roadmap's *The global induction formula*). Define
`analyticConductor ρ : ℕ := |discr F|^{dim V} · absNorm 𝔣(ρ)` and prove it positive,
multiplicative on `prod`, and `analyticConductor (ind τ) = analyticConductor τ` (the
discriminant tower formula `|d_L| = |d_F|^{[L:F]} N(𝔡_{L/F})`). Over `ℚ`, `analyticConductor ρ`
is the LMFDB's `Conductor`, and `ramifiedSet ρ` its prime support.

*Prerequisites:* [arithmetic Galois representations](../ArithmeticGaloisRepresentations/README.md)
§§3.3, 3.5; Mathlib `NumberField.discr`, `Ideal.absNorm`; [completed number-field arithmetic](../../Completed/NumberFieldArithmetic/README.md)
Layer 4 (`relDiscr`, the discriminant tower); Layers 1.5, 2.3, 3.1.

Lean: none; `𝔣(ρ)` is the arithmetic Galois representations roadmap's `Conductor.globalConductor`,
so `analyticConductor` and its API are specified in this README only.

**Checks.**

- (value) `1.4.2t1.a.a`: `analyticConductor χ₋₄ = 4`, with `a₂ = 2` (wild: the `i = 0` term of the
  lower-sum formula alone would give exponent `1`).
- (value) `2.23.3t2.b.a`: `analyticConductor ρ = 23` (`a₂₃ = 1`, tame, `V^I` a line);
  `2.163.8t12.a.a`: `163`, while `ρ₀` of the same example has `163²` (`V^I = 0` under tame inertia
  of order `3`, exponent `2`).
- (boundary) `analyticConductor (trivial F) = |disc F|`; over `ℚ` it is `1`.
- (comparison) induction invariance on `ind_{ℚ(i)/ℚ} 1 ≅ 1 ⊕ χ₋₄`:
  `analyticConductor (ind 1) = |d_ℚ(i)| = 4 = 1 · 4`.

### 3.6 The comparison with the adelic convergence factors

Record, for the [adelic algebraic groups roadmap](../AdelicAlgebraicGroups/README.md) AA.2.4,
that its "inertia-invariant local polynomial with arithmetic Frobenius" of a finite-image
complex representation is `localPolynomialAt ρ v`, its induction formula is Layer 3.2 and its
one-dimensional Artin–Hecke comparison is Layer 3.4's identity of `artinLSeries` with
`heckeLFunctionC`; no
object of that roadmap is restated.

*Prerequisites:* Layers 3.1, 3.2, 3.4.

## Layer 4: continuation, the functional equation and the root number

Standing hypotheses as in Layer 3. Every identity between continued functions is stated on
`Re s > 1`, promoted to an equality of meromorphic germs at every point by uniqueness of
continuation (the L-functions roadmap's `eventuallyEq_of_meromorphic_of_eqOn_halfPlane`), and
stated pointwise only off the polar loci; an unrestricted equality of total functions is never
asserted.

### 4.1 The meromorphic Artin L-function

Define `artinLFunctionC ρ : ℂ → ℂ`, taken in Mathlib's meromorphic normal form
(`MeromorphicNFOn`, so that its value at a removable singularity is the limit there and analyticity
at a point is a property of the germ), and pinned by three theorems: `artinLFunctionC_eqOn`, equality
with `artinLSeries ρ` on `Re s > 1`; `meromorphicOn_artinLFunctionC`, meromorphy on `ℂ`; and
`artinLFunctionC_unique`, that any meromorphic function agreeing with `artinLSeries ρ` on
`Re s > 1` agrees with it as a germ everywhere. Existence is Brauer induction: by Layer 1.6
`ρ = Σ nᵢ ind_{Lᵢ/F} ψᵢ` as virtual representations, so by Layer 3.4
`artinLSeries ρ = ∏ heckeLFunctionC(ψᵢ)^{nᵢ}` on `Re s > 1`, and the right side is meromorphic
on `ℂ` by the L-functions roadmap's Layer 5; uniqueness shows the germ is independent of the
Brauer expression. Prove: `artinLFunctionC_prod`, `_ind`, `_inflate` (the formalism of Layer 3.4
as germ identities), `artinLFunctionC_trivial = dedekindZetaC F`, `artinLFunctionC_one_dim =
heckeLFunctionC` (primitive presentation), and
`dedekindZetaC K = ∏_χ artinLFunctionC(ρ_χ)^{χ(1)}` as germs. Prove that `artinLFunctionC ρ` is
holomorphic and nonvanishing on `Re s > 1`, has at most a pole at `s = 1` on the line `Re s = 1`,
of order exactly `⟨χ, 1⟩ = dim V^{G_F}` there (the Hecke factors are entire and nonzero on
`Re s = 1` away from `s = 1`, the L-functions roadmap's Layer 7, and `ζ_F` has a simple pole), and
that `(s − 1)^{dim V^{G}} artinLFunctionC ρ s` has a finite nonzero limit at `1`.

⚠ A Brauer expression has negative coefficients; `artinLFunctionC ρ` is meromorphic, not
asserted holomorphic. Holomorphy away from `s = 1` is Artin's conjecture, Layer 8.1.

*Prerequisites:* [L-functions](../LFunctions/README.md) Layers 3, 5, 7
(`heckeLFunctionC`, `eventuallyEq_of_meromorphic_of_eqOn_halfPlane`, `dedekindZetaC`, entirety
and nonvanishing of primitive Hecke L-functions); Mathlib `MeromorphicOn`,
`meromorphicOrderAt`; Layers 1.6, 3.4.

### 4.2 The completed L-function

Define the archimedean factor `gammaFactor ρ s := ∏_{v real} Γ_ℝ(s)^{n₊(ρ,v)} Γ_ℝ(s+1)^{n₋(ρ,v)} · ∏_{v complex} Γ_ℂ(s)^{dim V}`
from Layer 3.3, and

```text
completedArtinLFunction ρ s := (analyticConductor ρ : ℂ)^(s/2) · gammaFactor ρ s · artinLFunctionC ρ s.
```

Prove `completedArtinLFunction_prod`, `_ind` (the gamma factor is inductive: a real place of `F`
with real places `w` above it in `L` contributes `Γ_ℝ(s)^{n₊} Γ_ℝ(s+1)^{n₋}` from each, and with
complex `w` contributes `Γ_ℂ(s)^{dim τ} = Γ_ℝ(s)^{dim τ} Γ_ℝ(s+1)^{dim τ}` by the duplication
formula, matching Layer 3.3's formula for `n_±(ind τ)`; the conductor power is inductive by
Layer 3.5), `_inflate`, `_one_dim = completedHeckeLFunction` of the primitive presentation (the
L-functions roadmap's completion carries the same conductor `|d_F| N(𝔣)`, the same real gamma
shift by parity and `Γ_ℂ` at complex places), and
`completedArtinLFunction_trivial = completedDedekindZeta F`. Prove meromorphy, and that
`completedArtinLFunction ρ` is holomorphic away from `{0, 1}` when every Brauer coefficient is
nonnegative (the general statement is Layer 8.1's hypothesis).

*Prerequisites:* Mathlib `Complex.Gammaℝ`, `Gammaℂ`, the duplication formula
`Complex.Gammaℝ_mul_Gammaℝ_add_one`; [L-functions](../LFunctions/README.md) Layers 3, 5;
Layers 3.3, 3.5, 4.1.

Lean: `gammaFactor` is stated in `Suggested.lean`; `completedArtinLFunction` contains the analytic
conductor of Layer 3.5 and is specified in this README only.

**Checks.**

- (value) `1.4.2t1.a.a`: `Λ(s, χ₋₄) = 4^(s/2) Γ_ℝ(s+1) L(s, χ₋₄)` (`n₊ = 0`, `n₋ = 1`).
- (value) `2.23.3t2.b.a`: `Λ(s, ρ) = 23^(s/2) Γ_ℝ(s) Γ_ℝ(s+1) L(s, ρ) = 23^(s/2) Γ_ℂ(s) L(s, ρ)`
  (`n₊ = n₋ = 1`, the duplication formula).
- (convention) the even `ρ = ρ₀ ⊗ ω` of `2.163.8t12.a.a` has `n₊ = 0`, `n₋ = 2`, so its gamma
  factor is `Γ_ℝ(s+1)²`, not `Γ_ℝ(s)²`: the shifts come from the eigenspaces of `ρ(c)`, not from
  the parity of `det ρ`.
- (boundary) `completedArtinLFunction (trivial F) = completedDedekindZeta F` as germs; over `ℚ` it
  is `Γ_ℝ(s) ζ(s)`, whose germ at every point is that of Mathlib's `completedRiemannZeta`.

### 4.3 The functional equation and the root number

Prove, as germs at every point and pointwise off the poles,

```text
completedArtinLFunction ρ s = rootNumber ρ · completedArtinLFunction (dual ρ) (1 − s),
```

with `rootNumber ρ : ℂ` a constant of absolute value `1`: by Brauer induction and Layers 4.2 and
3.4 the completed function is `∏ Λ(ψᵢ, s)^{nᵢ}` for one-dimensional `ψᵢ` over `Lᵢ`, each of which
satisfies the L-functions roadmap's `Λ(ψ, s) = W(ψ) Λ(ψ⁻¹, 1 − s)`, and `dual` commutes with
induction. Define `rootNumber ρ` as that constant (`functionalEquation`, `rootNumber_unique`: it is
determined by the equation since `completedArtinLFunction ρ` is a nonzero germ) and prove:
`norm_rootNumber = 1`; `rootNumber_prod`; `rootNumber_ind`; `rootNumber_inflate`;
`rootNumber_dual = conj (rootNumber ρ)`; `rootNumber (trivial) = 1`;
`rootNumber_one_dim = W(ψ)` of the L-functions roadmap; over `ℚ`, for one-dimensional `ρ` with
primitive Dirichlet character `χ` of conductor `N` and parity `a`,
`rootNumber ρ = gaussSum χ / (i^a √N)` (the L-functions roadmap's `dirichletData`); and
`rootNumber ρ = ∏ rootNumber(ψᵢ)^{nᵢ}` for every Brauer expression (`rootNumber_brauer`), which
is how it is computed. The [arithmetic Galois representations roadmap](../ArithmeticGaloisRepresentations/README.md)
§2.7 (*Globalisation and Deligne's transfer*) derives the same equation on its way to the
Deligne–Langlands constants; Layer 6.1 identifies `rootNumber ρ` with its product of local
constants.

*Prerequisites:* [L-functions](../LFunctions/README.md) Layers 4, 5 (the functional equation of
`completedHeckeLFunction`, `dirichletData`); Layers 1.4–1.6, 4.1, 4.2.

Lean: none; `rootNumber`, `functionalEquation` and their API involve `completedArtinLFunction` and
are specified in this README only.

**Checks.**

- (value) `1.4.2t1.a.a`: `τ(χ₋₄) = 2i`, so `rootNumber χ₋₄ = 2i/(i · 2) = 1`; the quadratic `χ₅`
  has `τ(χ₅)/√5 = 1`; `2.23.3t2.b.a` has root number `1`.
- (value) the order-`4` character `χ` modulo `5` with `χ(2) = i` (`1.5.4t1.a.a`):
  `rootNumber χ = τ(χ)/(i√5) ≈ 0.8507 + 0.5257 i`, of absolute value `1`.
- (convention) the equation reflects `ρ` to `dual ρ`: `dual χ = χ³` has root number
  `conj (rootNumber χ) ≈ 0.8507 − 0.5257 i`.
- (boundary) `rootNumber (trivial F) = 1`; over `ℚ` the equation is Riemann's for `ζ`.

### 4.4 The order of vanishing at `s = 0` and the analytic card

Prove `meromorphicOrderAt (artinLFunctionC ρ) 0 = r(ρ) := Σ_{v | ∞} dim V^{G_v} − dim V^{G_F}`,
where `V^{G_v}` is `V` at a complex place and the `+1`-eigenspace of complex conjugation at a
real place (Tate 1984, Ch. I, Prop. 3.4): from the functional equation at `s = 0`, the pole of
`gammaFactor ρ` at `s = 0` of order `Σ_v dim V^{G_v}` (`Γ_ℝ(s)` and `Γ_ℂ(s)` have simple poles
at `0`, `Γ_ℝ(s+1)` none), and the pole of `completedArtinLFunction (dual ρ)` at `1` of order
`dim V^{G}`, which is that of `artinLFunctionC (dual ρ)` (Layer 4.1) since every gamma factor is
finite and nonzero at `1`. In particular
`artinLFunctionC ρ 0 ≠ 0` iff `r(ρ) = 0`, and for `F = ℚ` and `ρ` irreducible nontrivial of
dimension two, `r(ρ) = n₊(ρ) ∈ {0, 1, 2}`, equal to `1` iff `ρ` is odd.

Build the `AnalyticLFunctionData` of the L-functions roadmap for `ρ`: norm-indexed coefficients
from Layer 3.4, conductor `analyticConductor ρ`, real gamma shifts `0` with multiplicity
`Σ_v n₊(ρ,v)` and `1` with multiplicity `Σ_v n₋(ρ,v)`, complex shifts `0` with multiplicity
`r₂(F) dim V`, root number `rootNumber ρ`, completed function `completedArtinLFunction ρ`, polar
divisor supported in `{0, 1}` with order `dim V^{G_F}` at both, degree `[F : ℚ] dim V`; prove its
continuation and functional-equation predicates and that its dual card is the card of `dual ρ`.
Over `ℚ` the card's gamma shifts are the LMFDB's `mu_fe = [0^{n₊}, 1^{n₋}]`.

*Prerequisites:* [L-functions](../LFunctions/README.md) Layer 0; Layers 3.3, 4.1–4.3.

## Layer 5: the conductor–discriminant formula

### 5.1 The formula

For a finite Galois extension `K/F` of number fields with group `G`, prove

```text
relDiscr (𝓞 F) (𝓞 K) = ∏_{χ ∈ Irr(G)} 𝔣(ρ_χ)^{χ(1)}      (as ideals of 𝓞 F),
```

and over `F = ℚ`, `|discr K| = ∏_χ N(𝔣(ρ_χ))^{χ(1)}`: `ind_{K/F} 1 ≅ ⊕_χ ρ_χ^{χ(1)}` (Layer 3.4),
`𝔣` is multiplicative (Layer 3.5), and `𝔣(ind_{K/F} 1) = 𝔡_{K/F}` is the
[arithmetic Galois representations roadmap](../ArithmeticGaloisRepresentations/README.md) §3.5
(*The global induction formula* with `τ = 1`). Record the abelian case, where it is the
[class field theory roadmap](../ClassFieldTheory/README.md) Layer 13's formula for
`abelianConductor`, and the quadratic case `|d| = N(𝔣(χ))` with `χ` the quadratic character.
Prove the local form `v_𝔭(𝔡_{K/F}) = Σ_χ χ(1) a_𝔭(ρ_χ)` and the corollary that `𝔭` ramifies in
`K` iff some irreducible `ρ_χ` is ramified at `𝔭`.

*Prerequisites:* [arithmetic Galois representations](../ArithmeticGaloisRepresentations/README.md)
§3.5; [completed number-field arithmetic](../../Completed/NumberFieldArithmetic/README.md)
Layer 4; [class field theory](../ClassFieldTheory/README.md) Layer 13; Layers 3.4, 3.5.

### 5.2 Conductors of one-dimensional representations and of their characters

Prove that for one-dimensional `ρ` over a number field, `𝔣(ρ)` is the finite part of the
conductor `HeckeCharacter.conductor` of `ρ ∘ globalArtinMap` (Layer 2.3's local identity with
`characterConductorExp` at every `v`, and `globalArtinMap_local`), and over `ℚ` that `N(𝔣(ρ))` is
`DirichletCharacter.conductor` of the Dirichlet character of §Pinned conventions and that
`analyticConductor ρ = N(𝔣(ρ))`. Prove `𝔣(det ρ) ∣ 𝔣(ρ)` (termwise in the lower-sum formula:
`(det V)^{G_i} = 0` forces `V^{G_i} ≠ V`); for `ρ` of dimension two and `F = ℚ` this is the
statement that the nebentypus of the weight-one form of Layer 8.2 divides its level.

*Prerequisites:* [class field theory](../ClassFieldTheory/README.md) Layers 7, 11; Tau Ceti
`HeckeCharacter.conductor`, `ratDirichletEquiv`, `conductor_finitePart_eq_span`; Mathlib
`DirichletCharacter.conductor`; Layers 2.3, 3.5.

## Layer 6: root numbers

### 6.1 The product formula

Prove `rootNumber ρ = ∏_v W(ρ_v, ψ_v)` over all places, finite and infinite, for `ψ` the standard
additive character of `𝔸_F/F` of the [arithmetic Galois representations roadmap](../ArithmeticGaloisRepresentations/README.md)
§2.7, with `ρ_v` the restriction to a decomposition group at `v` (Layer 3.1's completion
comparison at finite `v`; at a real place `W(ρ_v, ψ_∞) = i^{n₋(ρ,v)}`, at a complex place `1`),
almost all factors being `1`: by `rootNumber_brauer` and inductivity in degree zero it reduces to
one-dimensional `ψᵢ`, where it is that roadmap's `rootNumber_eq_prod_tateLocalConstant` at
`s = 1/2`. Prove independence of the global additive character (the product of the scaling
factors `det ρ(Art(b))` over all `v` is `1` by global reciprocity, `globalArtinMap` killing the
diagonal `F^×`).

*Prerequisites:* [arithmetic Galois representations](../ArithmeticGaloisRepresentations/README.md)
§2.7 (*Root-number product formula*, *Deligne–Langlands local constants*); [class field theory](../ClassFieldTheory/README.md)
Layer 11; Layers 2.4, 3.1, 4.3.

### 6.2 Self-dual representations: real root numbers

Prove `rootNumber ρ ∈ {1, −1}` when `ρ ≅ dual ρ`, i.e. `frobeniusSchurIndicator ρ ≠ 0`
(`rootNumber_dual` with `|W| = 1`); `rootNumber (ρ ⊕ dual ρ) = 1`; and `rootNumber ρ = 1` when
`ρ` is **orthogonal** (`frobeniusSchurIndicator ρ = 1`), the theorem of Fröhlich–Queyrut
(Fröhlich–Queyrut 1973; Deligne 1976). Record that the symplectic case carries no such
constraint and is the subject of
[`ClassicalArithmeticCompletion`](../ClassicalArithmeticCompletion/README.md) 7.30. Consequently
the LMFDB's `Sign` is `±1` exactly when `Indicator ≠ 0`, and `+1` when `Indicator = 1`.

*Prerequisites:* Tau Ceti `TauCeti.Representation.frobeniusSchurIndicator_eq_one_iff`, `_eq_zero_iff`; Layers 4.3, 6.1.

Lean: none; these statements are about `rootNumber` (Layer 4.3) and are specified in this README
only.

**Checks.**

- (value) orthogonal: `2.23.3t2.b.a` and `χ₋₄` have indicator `1` and root number `1`.
- (value) for the order-`4` character `χ` modulo `5`, `χ ⊕ dual χ` is self-dual with indicator
  `0` and root number `rootNumber χ · conj (rootNumber χ) = 1`.
- (non-example) `χ` itself has indicator `0`, is not self-dual, and its root number
  `≈ 0.8507 + 0.5257 i` is not real: the `±1` statement needs `ρ ≅ dual ρ`.
- (boundary) symplectic: `ρ₀` of `2.163.8t12.a.a` has indicator `−1` and root number `±1`;
  Fröhlich–Queyrut says nothing more about it.

### 6.3 Orthogonal local constants

For an orthogonal `ρ_v` of a local field, prove Deligne's formula
`W(ρ_v, ψ)² = det ρ_v(Art(−1))` (from `W(ρ, ψ) W(ρ^∨, ψ) = det ρ(−1)` and `ρ ≅ ρ^∨`), hence
`W(ρ_v, ψ) ∈ μ₄`, and `W(ρ_v, ψ) ∈ {±1}` when `det ρ_v(−1) = 1`; and state `W(ρ_v, ψ) = W(det ρ_v, ψ)`
when the second Stiefel–Whitney class of `ρ_v` vanishes (Deligne 1976's theorem
`W(ρ_v, ψ) = W(det ρ_v, ψ) · (−1)^{w₂(ρ_v)}`, in the Stiefel–Whitney reading of Fröhlich 1985,
consumed as cited; the Stiefel–Whitney class itself is a target of no roadmap here and this
clause is stated as an implication from a named hypothesis on it).

*Prerequisites:* Layer 2.4; [arithmetic Galois representations](../ArithmeticGaloisRepresentations/README.md)
§2.7.

### 6.4 The root number of a `p`-adic field

For `K/ℚ_p` finite, with `padicFieldRootNumber K` of Layer 2.4, prove: it is a fourth root of
unity (Layer 6.3: `ind 1` is orthogonal with `det = χ_{disc K}`); it is `1` when `K/ℚ_p` is
unramified; it is multiplicative in products of fields (`ind` of a direct sum); it is
`χ_{disc K}(−1) λ(K/ℚ_p, ψ_p)`; for a number field `E` and its completions,
`∏_{p} padicFieldRootNumber (E ⊗ ℚ_p) · (−i)^{r₂(E)} = 1` (the global root number of `ζ_E` is
`1`, Layer 4.3 for `ind_{E/ℚ} 1`, with `W(sgn, ψ̄_∞) = −i` at each complex place), the formula
the LMFDB's knowl states; and the quadratic table
`padicFieldRootNumber (ℚ_p(√u)) = 1` for `u` a unit, and for a ramified quadratic
`K = ℚ_p(√d)`, `padicFieldRootNumber K = W(χ_d, ψ̄_p)`, with the values of §Worked examples.

*Prerequisites:* Layers 2.4, 4.3, 6.1, 6.3; [arithmetic Galois representations](../ArithmeticGaloisRepresentations/README.md)
§2.7.

Lean: none; `padicFieldRootNumber` is specified in Layer 2.4 of this README, and these statements
with it.

**Checks.**

- (value) the quadratic table of §Worked examples: `ℚ₂(√−2) : i`, `ℚ₂(√2) : 1`, `ℚ₂(√3) : i`,
  `ℚ₂(√6) : −i`, `ℚ₂(√−6) : −1`, `ℚ₃(√−3) : i`, `ℚ₃(√3) : −i`; each is a fourth root of unity.
- (product formula) for `E = ℚ(i)`, only `p = 2` ramifies and `r₂ = 1`:
  `padicFieldRootNumber ℚ₂(i) · (−i) = i · (−i) = 1`.
- (boundary) unramified fields give `1`: `ℚ_p` itself and `ℚ₂(√−3)`.
- (non-example) `padicFieldRootNumber ℚ₂(i) = i` is not real: unlike the root number of a
  self-dual global representation, the root number of a `p`-adic field is not a sign.

### 6.5 Local root numbers of elliptic curves

For an elliptic curve `E` over a nonarchimedean local field `K_v` of residue characteristic `p`,
define `ecLocalRootNumber E v := W(σ'_{E,v}, ψ_v) := ε(σ'_{E,v} ⊗ |·|^{1/2}, ψ_v, dx_ψ)` where
`σ'_{E,v}` is the Weil–Deligne representation attached to the dual of the `ℓ`-adic Tate module
(`WeierstrassCurve.tateModuleGaloisRepresentation` through the
[arithmetic Galois representations roadmap](../ArithmeticGaloisRepresentations/README.md)
§§2.4, 2.7, 6.3; it is independent of `ℓ ≠ p` and of `ψ_v` because `det σ' = |·|^{-1}` is
trivial at `−1`), and prove it is `±1` and: `+1` for good reduction (`σ'` unramified, `N = 0`);
`−1` for split multiplicative and `+1` for nonsplit multiplicative reduction (`σ' = sp(2) ⊗ η`
with `η` trivial or the unramified quadratic character; `ε(sp(2)) = −1`, that roadmap's §2.7
check); `χ(−1)` for additive potentially multiplicative reduction, `χ` the ramified quadratic
character over which `E` becomes multiplicative, which for `p` odd is the quadratic residue
symbol `(−1/k_v)`; and **Rohrlich's formulas** for additive potentially good reduction with
`p ≥ 5`: with `e := 12 / gcd(12, v(Δ_min))`, `W = 1` if `e = 1`, `(−1/k_v)` if `e ∈ {2, 6}`,
`(−3/k_v)` if `e = 3`, `(−2/k_v)` if `e = 4`, where `(a/k_v)` is the quadratic residue symbol of
the residue field (Rohrlich 1993; Rohrlich 1994). For `p ∈ {2, 3}` no closed formula is claimed:
the value is the local constant of `σ'_{E,v}`, and Halberstadt's tables are an acceptance test,
not a theorem statement. In Lean the curve is a `WeierstrassCurve K` with `[IsElliptic]` over the
fraction field `K` of a discrete valuation ring `R` with finite residue field, the reduction types
are Mathlib's classes `HasGoodReduction R`, `HasMultiplicativeReduction R`,
`HasSplitMultiplicativeReduction R`, `HasAdditiveReduction R`, and the root number is
`ecLocalRootNumber R E`. Define `globalRootNumber E := ∏_v ecLocalRootNumber E v · (−1)^{r₁(F)+r₂(F)}`
for `E` over a number field (`W(E/ℝ) = W(E/ℂ) = −1`) and record that its identification with
the sign of the functional equation of `L(E, s)` is a statement of the modularity roadmaps, not
of this one. The LMFDB's `ec.local_root_number` is `ecLocalRootNumber`.

*Prerequisites:* [arithmetic Galois representations](../ArithmeticGaloisRepresentations/README.md)
§§2.4, 2.7, 6.3; Mathlib `WeierstrassCurve.HasGoodReduction R`, `HasMultiplicativeReduction R`,
`HasSplitMultiplicativeReduction R`, `HasAdditiveReduction R`, `IsMinimal R`; Tau Ceti
`tateModuleGaloisRepresentation`; Layer 2.4.

Lean: none; `ecLocalRootNumber` rests on the Deligne–Langlands constants of the arithmetic Galois
representations roadmap and is specified in this README only.

**Checks.**

- (value) `11.a2` (`y² + y = x³ − x² − 10x − 20`) is split multiplicative at `11`:
  `ecLocalRootNumber = −1` there, `+1` at every other prime, and `globalRootNumber = +1`.
- (value) `37.a1` (`y² + y = x³ − x`) is nonsplit multiplicative at `37`: `ecLocalRootNumber = +1`
  there and `globalRootNumber = −1`.
- (value) Rohrlich at `p ≥ 5`: `y² = x³ − p` (`v(Δ) = 2`, `e = 6`) gives `+1, −1, −1` at
  `p = 5, 7, 11`; `y² = x³ − px` (`v(Δ) = 3`, `e = 4`) gives `−1, −1, +1`.
- (boundary) good reduction gives `+1`.

## Layer 7: the LMFDB invariants

Standing hypotheses: `F` a number field (`F = ℚ` for the LMFDB pages), `ρ : ArtinRep F V`
irreducible unless said otherwise, `K := artinField ρ`, `G := Gal(K/F)`, `W := toFinite ρ`.

### 7.1 Dimension, conductor, determinant, parity, trace of conjugation

Package the invariants already built: `dim ρ := finrank ℂ V`; `𝔣(ρ)` and `analyticConductor ρ`
(Layer 3.5); `det ρ` as a one-dimensional Artin representation, its Hecke character
`det ρ ∘ globalArtinMap` and, over `ℚ`, its primitive Dirichlet character `dirichletDet ρ`
(§Pinned conventions, by `kroneckerWeber`, `ratDirichletEquiv` and Layer 5.2), with
`dirichletDet_apply_prime` (`χ(p) = det ρ(Frob_p)` for `p ∤ N`, the LMFDB's
`central_char_function`, which reads `det ρ(Frob_p)` as `(−1)^{dim}` times the leading
coefficient of `localPolynomialAt ρ p` at unramified `p`); `IsEven ρ`, `IsOdd ρ`
(`det ρ(c) = ±1`), with `IsEven ρ ↔ Even (dirichletDet ρ)` over `ℚ`; and
`traceOfComplexConjugation ρ` with `n₊, n₋` (Layer 3.3). Prove the consistency relations
`det ρ(c) = (−1)^{n₋}`, `|traceOfComplexConjugation ρ| ≤ dim ρ`, and that for `dim ρ = 2`,
`ρ` is odd iff `traceOfComplexConjugation ρ = 0`.

*Prerequisites:* Layers 1.4, 3.3, 3.5, 5.2.

### 7.2 Frobenius–Schur indicator and self-duality

Define `frobeniusSchurIndicator ρ := TauCeti.frobeniusSchurIndicator W ∈ {1, 0, −1}` and prove it
independent of the finite level, `= 1` iff `ρ` is orthogonal (carries a nonzero invariant
symmetric form; iff realizable over `ℝ`), `= −1` iff symplectic, `= 0` iff `ρ ≇ dual ρ` iff the
character is not real-valued; `frobeniusSchurIndicator (conj σ ρ) = frobeniusSchurIndicator ρ`;
for one-dimensional `ρ` it is `1` if `ρ² = 1`, else `0`; and for a dihedral induction
`ρ = ind_{L/F} ψ` with `[L : F] = 2` and `ψ^σ = ψ⁻¹`, `frobeniusSchurIndicator ρ = ψ(g²)` for any
`g ∈ G_F \ G_L` (the value is `±1` and independent of `g`; Tau Ceti
`TauCeti.frobeniusSchurIndicator_indFDRep_ofLinearCharacter_eq_apply_sq_of_conj_eq_inv`).

*Prerequisites:* Tau Ceti `frobeniusSchurIndicator` and its trichotomy; Layers 1.4, 1.6.

### 7.3 Character field and Galois conjugates

From Layer 1.6: `characterField ρ`, `characterFieldConductor ρ` (the LMFDB's `CharacterField`),
`galoisOrbit ρ : Finset` of isomorphism classes with `card = [characterField ρ : ℚ]`
(the LMFDB's `galois_conjugacy_size`), the Galois conjugates' shared invariants (`dim`, `𝔣`,
`artinField`, parity, `frobeniusSchurIndicator`, projective image, container, stem fields) and
their conjugated invariants (`det`, `rootNumber`, local polynomials, `characterField` itself),
with `localPolynomialAt (conj σ ρ) v = σ (localPolynomialAt ρ v)` coefficientwise and
`rootNumber (conj σ ρ) = σ (rootNumber ρ)` for `σ` restricted to the Galois closure of
`characterField ρ` (the root number lies in a cyclotomic field by `rootNumber_brauer` and the
Gauss-sum formula).

*Prerequisites:* Layers 1.6, 3.1, 4.3.

### 7.4 Image, Artin field and stem fields

Define `image ρ := ρ.range` (a finite subgroup of `GL(V)`, isomorphic to `G`, the LMFDB's
`Group` and `GaloisLabel`); prove `Nat.card (image ρ) = finrank F K`. Define
`IsStemField ρ E` for an intermediate field `F ⊆ E ⊆ K`: the normal closure of `E` in `K` is `K`,
equivalently `(E.fixingSubgroup).normalCore = ⊥` in `G`; prove `K` itself is a stem field, that a
stem field of minimal degree exists, that the minimal degree of a stem field is the minimal
index of a core-free subgroup of `G`, and that for a permutation representation `G ↷ G/H` with
`H` core-free, `E = K^H` is a stem field. The LMFDB's `NFGal`, `Artin stem field`
and the field whose Galois closure is displayed are stem fields of minimal degree; which one is
displayed is a database convention, not a target.

*Prerequisites:* Mathlib `IntermediateField.fixingSubgroup`, `Subgroup.normalCore`,
`IntermediateField.normalClosure`; Layer 1.2.

### 7.5 Projective image and projective field

Define `projective ρ : G_F →* PGL(V)` (quotient by `ℂ^×`), `projectiveImage ρ` its range,
`projectiveField ρ := fixedField (ker (projective ρ))`, an intermediate field of `K` with
`Gal(projectiveField ρ / F) ≅ projectiveImage ρ`; prove `projectiveField ρ ≤ artinField ρ`,
equality iff `ρ(G_F) ∩ ℂ^× = 1`, `projectiveField (ρ ⊗ ψ) = projectiveField ρ`,
`projectiveField (conj σ ρ) = projectiveField ρ`, and that `ker (projective ρ)` is the set of `g`
with `|χ(g)| = dim ρ` (Tau Ceti `FDRep.exists_apply_eq_smul_of_norm_char_eq_finrank`), so the
projective field is read off the character table. Define `IsProjectiveStemField ρ E` as in 7.4
for the projective field. Record the LMFDB's `Proj_GAP`, `Proj_nTj`, `Proj_Polynomial` as the
abstract group of `projectiveImage ρ`, the permutation group of a minimal projective stem field,
and such a field.

*Prerequisites:* Mathlib `Matrix.ProjGenLinGroup.mk`, `Subgroup.center`; Tau Ceti
`FDRep.exists_apply_eq_smul_of_norm_char_eq_finrank`; Layers 1.2, 1.4.

### 7.6 Klein's classification and the projective type in dimension two

Prove **Klein's theorem**: a finite subgroup of `PGL₂(ℂ)` is conjugate to exactly one of the
cyclic group `C_n` (`n ≥ 1`), the dihedral group `D_n` of order `2n` (`n ≥ 2`, `D₂ = V₄`), `A₄`,
`S₄`, `A₅` (realized as the rotation groups of the regular solids in `PSL₂(ℂ) ≅ SO₃(ℂ)`, or
directly: the stabilizers of the points of `ℙ¹(ℂ)` with nontrivial stabilizer and the orbit-count
identity `2 − 2/|Γ| = Σ (1 − 1/eᵢ)` with at most three orbits). Define the predicates
`IsCyclicType ρ`, `IsDihedralType ρ n`, `IsTetrahedralType ρ`, `IsOctahedralType ρ`,
`IsIcosahedralType ρ` on `projectiveImage ρ` for `dim ρ = 2`, prove they are exhaustive and
exclusive, that an irreducible `ρ` is not cyclic, that `IsDihedralType ρ n` iff `ρ ≅ ind_{L/F} ψ`
for a quadratic `L/F` and a character `ψ` of `G_L` with `ψ ≠ ψ^σ` whose order modulo
`G_F`-characters is `n` (the dihedral classification, Serre 1977 §8.2 for `D_n`), that
`IsTetrahedralType`, `IsOctahedralType`, `IsIcosahedralType` are preserved by twists, Galois
conjugation and duals, and that the projective field is a quartic, `S₄`-, `A₅`-field's Galois
closure of degree `12`, `24`, `60` respectively. The LMFDB's `projective_image_type` search is
these five predicates.

*Prerequisites:* Mathlib `DihedralGroup`, `alternatingGroup`, `Equiv.Perm (Fin 4)`,
`Equiv.Perm (Fin 5)`, `Matrix.ProjGenLinGroup`, `MulAction.orbit`, `MulAction.stabilizer`;
Layers 1.5, 7.5. Klein's theorem is a classification with five cases and is proved, not certified.

### 7.7 The smallest permutation container

Define `containerDegree ρ := min {[G : H] : H ≤ G, (W.comp H.subtype).invariants ≠ ⊥}` for
irreducible `ρ`, prove by Frobenius reciprocity that it is the least `n` such that `ρ` is a
constituent of a permutation representation `ℂ[G/H]` of degree `n`, that `containerDegree ρ ≤ |G|`
(the regular representation contains `ρ`), `containerDegree ρ = 1` iff `ρ` is trivial,
`containerDegree ρ = 2` iff `ρ` is a nontrivial quadratic character, and
`containerDegree (ind_{L/F} 1 constituent) ≤ [L : F]`. Define `IsContainer ρ H` for a minimizing
`H`, and `containerPermutationGroup ρ H`, the image of `G` in `Equiv.Perm (G ⧸ H)`, given up to
conjugacy in `Sₙ`; prove it is transitive and that `K^H` is a stem field of `ρ` when `ρ` is
faithful and `H` is core-free. The LMFDB's `Container` is `containerDegree ρ` together with the
`T`-number of `containerPermutationGroup`; for `containerDegree ρ ≤ 11` the `T`-number is
[polynomial Galois groups](../PolynomialGaloisGroups/README.md)' `TransitiveGroupLabel` (its Layer 6
for degree at most 5 and its Layer 1D up to degree 11), and above degree 11 it is not a target.

*Prerequisites:* Tau Ceti `frobenius_reciprocity`, `indTrivialIso`, `char_ind_trivial`; Mathlib
`Subgroup.index`, `MulAction.IsPretransitive`; Layers 1.3, 1.5, 7.4.

### 7.8 Ramified primes, the cycle-type recipe and the local polynomial table

Define `badPrimes ρ := ramifiedSet ρ` and `numBadPrimes ρ`; prove `badPrimes ρ = ramifiedPrimes K`
(Tau Ceti `ramifiedPrimes`; `toFinite ρ` is faithful) and `badPrimes ρ = badPrimes (ind_{K/F} 1)`.
Prove the LMFDB's local-factor recipe: for a monic `f ∈ 𝓞_F[X]` defining a stem field `E` of `ρ`
and a prime `p ∤ disc f`, `p` is unramified in `K`, the cycle type of `artinSymbol p` on
`Hom_F(E, K)` is the factorization type of `f` modulo `p` (Tau Ceti
`exists_gal_fullCycleType_eq_factorizationType`), and `localPolynomialAt ρ p` is the reversed
characteristic polynomial of `W` at that class, so that it is a function of the factorization type
alone. At every other prime it is Layer 3.1's polynomial on inertia invariants, read on a prime
above `p`. State the `LocalFactors` table as the function `ConjClasses G → ℂ[X]`,
`C ↦ (charpoly W(C)).reverse`, together with `localPolynomialAt ρ p` at the primes dividing
`disc f`. The LMFDB's `HardPrimes` is the set `{p ∣ disc f}` for its stored `f` and `HardFactors`
the values of `localPolynomialAt ρ p` there; the stored `f`, hence the set, is not a target, and
the set contains `badPrimes ρ` but is in general larger
(§Worked examples, `163`).

*Prerequisites:* Tau Ceti `ramifiedPrimes`, `exists_gal_fullCycleType_eq_factorizationType`,
`artinSymbol`; Layers 3.1, 7.4.

### 7.9 The invariant suite and the LMFDB boundary

Record, for `F = ℚ`, the map from the LMFDB's columns to the invariants: `Dim` (7.1),
`Conductor` (7.1), `Dets`/`central_character` (7.1), `Is_Even` (7.1), `Indicator` (7.2),
`Sign` (Layer 4.3), `CharacterField` and `GaloisConjugates` (7.3), `GaloisLabel`/`Group`,
`NFGal` (7.4), `Proj_GAP`/`Proj_nTj`/`Proj_Polynomial` (7.5, 7.6), `Container` (7.7),
`BadPrimes`, `NumBadPrimes`, `LocalFactors`, and the values `HardFactors` (7.8),
`trace_complex_conjugation` (7.1); and the intrinsic label prefix `dim.cond`. The displayed
stem field, the stored `HardPrimes` set, and the orbit letter `a` and conjugate letter `b` of
`dim.cond.dtj.a.b` are not targets.

*Prerequisites:* Layers 7.1–7.8.

## Layer 8: the conjectures and the dictionaries, as statements

### 8.1 Artin's conjecture

Define `ArtinHolomorphic ρ`: `artinLFunctionC ρ` is analytic at every `s ≠ 1`, and
`meromorphicOrderAt (artinLFunctionC ρ) 1 = −dim V^{G_F}`; and `ArtinConjecture F`: every
Artin representation of `F` is `ArtinHolomorphic` (quantified over the representations on
`Fin n → ℂ`, which exhaust the isomorphism classes and pin no universe). Prove: one-dimensional `ρ` are
`ArtinHolomorphic` (Layer 4.1 and the entirety of nontrivial Hecke L-functions);
`ArtinHolomorphic` is closed under `prod` and `ind` and inflation; `ArtinHolomorphic ρ` iff
`completedArtinLFunction ρ` is analytic away from `{0, 1}` with poles of order `dim V^{G_F}`
there; `ArtinHolomorphic ρ` for every `ρ` whose Brauer expression can be chosen with
nonnegative coefficients, in particular for monomial `ρ` (induced from a character) and for every
`ρ` of a nilpotent, supersolvable or `M`-group image (Tau Ceti's nilpotent-monomial theorem);
and that the predicate agrees with `ArtinHolomorphy` of the
[analytic number theory roadmap](../AnalyticNumberTheoryPartI/README.md) §2.41, read on the same
germ. The **strong Artin conjecture** `IsAutomorphicArtin ρ` is the
[modularity and Langlands extensions roadmap](../ModularityAndLanglandsExtensions/README.md)
§1.2's predicate; prove `IsAutomorphicArtin ρ → ArtinHolomorphic ρ` for irreducible `ρ` from its
`IsAutomorphicArtin.lFunction_entire`, after identifying its `L(ρ, s)` with `artinLFunctionC ρ`
(both are the unique continuation of Layer 3.4's Euler product; that roadmap's convention
dualizes before comparing with `rec`, so that its classical arithmetic Artin factors are
`localPolynomialAt`). Record the proved cases: solvable projective image
([`GL₂` automorphic representations](../GL2AutomorphicRepresentationsAndTransfer/README.md)
R17.5.8), `A₅` image over totally real fields for totally odd `ρ`
([modularity and Langlands extensions](../ModularityAndLanglandsExtensions/README.md) §1.9).

*Prerequisites:* Layers 4.1, 4.2; Tau Ceti `FDRep.exists_character_eq_indClassFun_of_isNilpotent`;
the three roadmaps cited.

### 8.2 The weight-one dictionary over `ℚ`

State, on this carrier, the dictionary between irreducible odd two-dimensional Artin
representations `ρ` of `ℚ` and normalized weight-one newforms `f` of level `N(𝔣(ρ))` and
nebentypus `dirichletDet ρ`: `L(s, f) = artinLFunctionC ρ`, `a_p(f) = frobeniusTrace ρ p` for
`p ∤ N`, and the Artin field, projective image, projective field and Frobenius–Schur indicator
of `f` are those of `ρ` (the LMFDB's `cmf.artin_field`, `cmf.artin_image`,
`cmf.projective_image`, `cmf.projective_field`, `cmf.rm_cm`). Record the two directions as
consumed theorems: `ρ ↦ f` for solvable projective image is R17.5.9 of the
[`GL₂` automorphic representations roadmap](../GL2AutomorphicRepresentationsAndTransfer/README.md)
and for `A₅` image is [modularity and Langlands extensions](../ModularityAndLanglandsExtensions/README.md)
§1.9 (through §1.2); `f ↦ ρ` (Deligne–Serre) is §2.10 of the
[automorphic Galois representations roadmap](../AutomorphicGaloisRepresentations/README.md),
whose "arithmetic good polynomial `X² − a_p X + ψ(p)`" is `frobeniusCharpoly ρ p`. Prove on this
side what needs no automorphic input: the dihedral case `ρ = ind_{L/ℚ} ψ` with `L` imaginary
quadratic is the theta series of `ψ` (its L-function is `L(s, ψ)` by Layer 3.4, a Hecke
L-function of an imaginary quadratic field), and `ind_{L/ℚ} ψ` is odd iff `ψ` has mixed
signature at the two real places of a real quadratic `L`, and is always odd for imaginary
quadratic `L` (Layer 3.3). Define `HasRealMultiplication f`/`HasComplexMultiplication f` for the corresponding
`ρ` as the existence of a self-twist by a real, resp. imaginary, quadratic character, and prove
they are the dihedral cases by real, resp. imaginary, quadratic fields.

*Prerequisites:* Layers 1.5, 3.3, 3.4, 4.1, 7.6; [`GL₂` automorphic representations](../GL2AutomorphicRepresentationsAndTransfer/README.md)
R17.5.1, R17.5.9; [automorphic Galois representations](../AutomorphicGaloisRepresentations/README.md)
§2.10; [modularity and Langlands extensions](../ModularityAndLanglandsExtensions/README.md)
§§1.2, 1.9; [modular forms](../ModularForms/README.md) Layer 4 (newforms, nebentypus).

### 8.3 Stark's conjecture at `s = 0`

Define, for a finite Galois `K/F` with group `G`, a finite set `S` of places of `F` containing
the archimedean ones and the ramified ones, and `χ` a character of `G`: the `S`-truncated
L-function `L_S(s, χ)` (Layer 3.4's product with the factors at `S` omitted), its order of
vanishing `r_S(χ)` at `0` (Layer 4.4 with the finite places of `S` contributing `dim V^{G_v}`
each), the `S`-unit group `U_S` of `K` and the free abelian group `Y` on the places of `K` above
`S` with its augmentation kernel `X`, the regulator pairing `log |·|_w`, and for a
`ℚ[G]`-isomorphism `f : ℚX ≃ ℚU_S` the **Stark regulator**
`R(χ, f) := det(λ ∘ f_ℂ | Hom_G(V^∨, ℂX))` with `λ : ℂU_S → ℂX` the logarithmic embedding
(Tate 1984, Ch. I §5). State **Stark's conjecture** `StarkConjecture K F S χ`: for every such
`f`, `A(χ, f) := R(χ, f) / L_S^*(0, χ)` (the leading coefficient at `0`) lies in `ℚ(χ)` and
satisfies `A(χ^α, f) = A(χ, f)^α` for `α ∈ Aut(ℂ)` (Tate 1984, Ch. I, Conj. 5.1). Prove the
unconditional parts (Tate 1984, Ch. I, Prop. 3.4, 5.3, 7.1–7.3): the order of vanishing
`ord_{s=0} L_S(s, χ) = r_S(χ) = dim Hom_G(V^∨, ℂX)`, independence of the conjecture from `f` and
from `S`, invariance under inflation and induction, additivity, and its truth for the trivial
character (the class number formula, Mathlib's `dedekindZeta_residue`) and hence for rational
characters.

State **Chinburg's weight-one Stark unit**, the LMFDB's `cmf.stark_unit`: for a weight-one
newform `f = Σ a_n q^n` with Artin representation `ρ` (Layer 8.2), coefficient field
`E = ℚ((a_n))`, `Δ = Gal(E/ℚ)` and conjugate forms `f^α`, Chinburg's conjecture (Chinburg 1983)
asserts that `exp(Σ_{α ∈ Δ} L'(0, f^α))` is, under a fixed real embedding of the Artin field, a
unit of the Artin field (the `b = 1`, `m = 1` case of the knowl's statement), and Stark's version
that for every `b ∈ E^×` some positive power is such a unit. State both as propositions
`StarkUnitProperty f` and `ChinburgStarkUnit f` and prove `ChinburgStarkUnit f → StarkUnitProperty f`;
prove that `r(ρ) = 1` for odd irreducible two-dimensional `ρ`, so `L'(0, f)` is the leading
coefficient.

*Prerequisites:* Mathlib `NumberField.Units`, `dedekindZeta_residue`; Layers 3.4, 4.1, 4.4,
8.2.

## Layer 9: finite-image representations over finite fields

Standing hypotheses: `𝔽` a finite field of characteristic `ℓ` with the discrete topology, `F` a
number field (`ℚ` for the LMFDB pages), `ρ̄ : G_F →* GL (Fin n) 𝔽` continuous.

### 9.1 The carrier and its image invariants

Define `ModLRep F n 𝔽` as the continuous homomorphisms `G_F →* GL (Fin n) 𝔽` (equivalently, with
open kernel: the kernel of a homomorphism to a discrete group is open iff the map is continuous),
`ρ̄.ker`, `splittingField ρ̄ := fixedField ρ̄.ker` (finite Galois, the LMFDB's
`splitting_field`; its minimal sibling is not a target), `image ρ̄`,
`imageOrder`, `imageIndex := (image ρ̄).index` in `GL (Fin n) 𝔽`, `IsSurjective ρ̄`
(`imageIndex = 1`), `det ρ̄ : G_F →* 𝔽^×` (a `ModLRep F 1 𝔽`), `determinantIndex := [𝔽^× : det ρ̄(G_F)]`
and `det_surjective ↔ determinantIndex = 1`, `IsAbelianImage`, `IsSolvableImage`
(Mathlib `IsSolvable`), `IsIrreducible ρ̄` and `IsAbsolutelyIrreducible ρ̄` (irreducible after
base change to `AlgebraicClosure 𝔽`), with `IsAbsolutelyIrreducible → IsIrreducible`, and for
`n = 2` the converse under oddness at a real place, consumed from the
[arithmetic Galois representations roadmap](../ArithmeticGaloisRepresentations/README.md) §4.1
(*Absolute irreducibility from oddness*). Prove `Nat.card (image ρ̄) = [splittingField ρ̄ : F]`,
and the comparison with Layer 1: an Artin representation `ρ` with a `G_F`-stable lattice `Λ`
(every `ρ` has one, Layer 1.1's finite image) reduces to `ρ̄_Λ`, with `splittingField ρ̄_Λ ≤ artinField ρ`
and `imageOrder ρ̄_Λ ∣ Nat.card (image ρ)`.

*Prerequisites:* Mathlib `Matrix.GeneralLinearGroup`, `Subgroup.index`, `IsSolvable`,
`Representation.IsIrreducible`; Layers 1.1, 1.2; [arithmetic Galois representations](../ArithmeticGaloisRepresentations/README.md)
§§1.4, 4.1.

### 9.2 Ramification, conductor and top slope

Define `IsUnramifiedAt ρ̄ v` (`I_v ≤ ker ρ̄` through the splitting field), `ramifiedSet ρ̄`
(the LMFDB's `conductor_primes`, together with the places above `ℓ`), `IsGoodPrime ρ̄ v`
(`v ∤ ℓ` and unramified, the LMFDB's `frobenius_prime`), and
`conductor ρ̄ := Conductor.primeToPConductor ρ̄` of that roadmap's §3.3, an ideal prime to `ℓ`
with `v_𝔭(conductor ρ̄) = a_𝔭(ρ̄)` the Artin exponent of the finite-image `ρ̄` at `𝔭 ∤ ℓ`
(computed from `ρ̄` itself, never from a lift: that roadmap's §3.6). Define
`topSlope ρ̄ : ℚ` as the maximum over the places `w | ℓ` of `splittingField ρ̄` of the sibling
`PadicExtensionFamilies` 2.7's `topSlope F_v (splittingField ρ̄)_w` — there `1 + u_w` with `u_w`
the largest upper ramification break of that Galois extension of `F_v`, on Tau Ceti's upper
filtration (`UpperJump`, `upperRamificationGroup`), `0` when unramified, `1` when tamely ramified
— so that `topSlope ρ̄ = 0` iff `ρ̄` is unramified at every `v | ℓ` and `= 1` iff tamely ramified
and ramified there. The local invariant is the sibling's and is not redefined; only the maximum
over the places above `ℓ` is this roadmap's. No representation-theoretic break is used, since the
arithmetic Galois representations roadmap's `Conductor.highestBreak` is defined only away from the
residue characteristic. For `F = ℚ` and `n = 1`, a Dirichlet character with values in `𝔽^×`
has order prime to `ℓ`, so its splitting field lies in `ℚ(ζ_ℓ)` times a field unramified at `ℓ`:
the `ℓ`-part of its conductor is `1` or `ℓ`, and `topSlope` is `0` or `1` accordingly.

*Prerequisites:* [arithmetic Galois representations](../ArithmeticGaloisRepresentations/README.md)
§§3.3, 3.6; the sibling `PadicExtensionFamilies` 2.7; Tau Ceti `upperRamificationGroup`, `UpperJump`,
`herbrand`, `HasseArf.lean`; [local fields and ramification](../LocalFieldsRamification/README.md)
Layer 3; Layers 3.1, 9.1.

Lean: `IsUnramifiedAt` and `IsGoodPrime` are stated in `Suggested.lean`; `topSlope` rests on the
`PadicExtensionFamilies` top slope and is specified in this README only.

**Checks.**

- (value) `ρ̄_{37.a1, 2}`: inertia at `2` is the `C₃` of the totally ramified cubic, tame, so
  `topSlope = 1`, although the conductor `37` is prime to `2`.
- (value) the mod-`5` cyclotomic character (`n = 1`), the determinant of `ρ̄_{11.a2, 5}`: its
  splitting field `ℚ(ζ₅)` is totally and tamely ramified at `5` (`e = 4`), so `topSlope = 1`.
- (boundary) `χ₋₄` modulo `2` is the trivial representation: splitting field `ℚ`, `topSlope = 0`.
- (convention) `topSlope` is the Artin slope `1 + u`, not the upper break `u`: a tamely ramified
  `ρ̄` has `u = 0` and `topSlope = 1`.

### 9.3 Frobenius matrices, generating primes and recognition

For a good prime `v`, define `frobeniusClass ρ̄ v : ConjClasses (GL (Fin n) 𝔽)`, the class of
`ρ̄(σ)` for `σ` a Frobenius at a prime above `v` in the splitting field (well defined by
`IsArithFrobAt.conj` and `isArithFrobAt_eq_of_isUnramifiedAt`); `frobeniusCharpoly ρ̄ v : 𝔽[X]`,
`frobeniusTrace`, `frobeniusDet` (`= det ρ̄ (Frob_v)`), `frobeniusOrder` (`orderOf` in the
codomain), the LMFDB's Frobenius table. Prove `frobeniusDet ρ̄ v = frobeniusCharpoly`'s constant
term up to sign, `frobeniusCharpoly ρ̄ v ∣ X^{frobeniusOrder} − 1`, and for `n = 2`,
`frobeniusCharpoly = X² − t X + d`. Define `IsGeneratingSet ρ̄ P` for a finite set `P` of good
primes: the classes `frobeniusClass ρ̄ p`, `p ∈ P`, generate `image ρ̄` (as a normal subgroup
they always generate; the LMFDB's `generating_primes` asks for generation by chosen
representatives and canonicalizes the choice, which is not a target); prove a
generating set exists (Chebotarev: every class is a Frobenius class, that roadmap's §5.1). Read
**Chebotarev recognition** on this carrier from that roadmap's §5.3 and §5.7: two semisimple
`ρ̄, ρ̄'` with equal `frobeniusCharpoly` at all good primes outside a finite set are isomorphic
over `AlgebraicClosure 𝔽`, and with equal traces when `n! ≠ 0` in `𝔽`; and a semisimple `ρ̄`
over `AlgebraicClosure 𝔽` is defined over the field generated by its Frobenius polynomials'
coefficients. Prove the finite-level consequence used by the LMFDB: the Frobenius polynomials at
the good primes up to the bound at which the classes exhaust `image ρ̄` determine the
semisimplification.

*Prerequisites:* Tau Ceti `exists_isArithFrobAt`, `isArithFrobAt_eq_of_isUnramifiedAt`; Mathlib
`ConjClasses`, `Matrix.charpoly`, `orderOf`; [arithmetic Galois representations](../ArithmeticGaloisRepresentations/README.md)
§§5.1, 5.3, 5.7; [Chebotarev](../Chebotarev/README.md) `hasDirichletDensity_frobeniusPrimeSet`;
Layers 9.1, 9.2.

### 9.4 Projective representation and the projective kernel field

Define `projective ρ̄ : G_F →* PGL (Fin n) 𝔽`, `projectiveKernelField ρ̄ := fixedField (ker (projective ρ̄))`
(the LMFDB's `projective_kernel_polynomial` field, displayed for `ℓ ≠ 2`), `projectiveImage ρ̄`
and its abstract group; prove `projectiveKernelField ρ̄ ≤ splittingField ρ̄` with equality iff
`image ρ̄ ∩ scalars = 1`, invariance under twists by characters `G_F → 𝔽^×`, and for `n = 2` read
Dickson's classification of `projectiveImage ρ̄` from that roadmap's §4.4
(`GL2Subgroup.dickson_projectiveImage`): it fixes a point, or is conjugate to `PSL₂(𝔽_q)`,
`PGL₂(𝔽_q)`, dihedral of order prime to `ℓ`, `A₄`, `S₄` or `A₅`.

*Prerequisites:* Mathlib `Matrix.ProjGenLinGroup`; [arithmetic Galois representations](../ArithmeticGaloisRepresentations/README.md)
§4.4; Layer 9.1.

### 9.5 The sources of mod-`ℓ` representations and the invariant suite

Record the constructions whose reductions the LMFDB stores, each consumed from its owner and
compared with this carrier: the `ℓ`-torsion of an elliptic curve `E/ℚ` (`ρ̄_{E,ℓ}` from
`tateModuleGaloisRepresentation`, with `frobeniusCharpoly ρ̄ p = X² − a_p X + p mod ℓ` at good
`p ∤ ℓ N`, its determinant the mod-`ℓ` cyclotomic character, hence surjective, and oddness), the
reduction of a weight-one or higher-weight newform's representation, the reduction of an Artin
representation (9.1), and Dirichlet characters (`n = 1`, `ρ̄` the composite of the cyclotomic
character with a character of `(ℤ/N)^×`, the LMFDB's `related_objects` of type `Dirichlet`).
Record the LMFDB columns: `base_ring_characteristic`, `dimension`, `conductor`, `codomain`,
`image_label` with the abstract group of the image, `image_index`, `image_order`, `determinant_label`,
`determinant_index`, `is_surjective`, `is_solvable`, `is_absolutely_irreducible`, `top_slope`,
`frobenius_matrices`, `generating_primes`, `kernel_polynomial`, `projective_kernel_polynomial`,
mapped to 9.1–9.4; the `image_label` (a label of a subgroup of `GL₂(𝔽_ℓ)` up to conjugacy), the
minimal siblings and the canonical generating sequence are not targets, and the dual pair of
algebras is excluded.

*Prerequisites:* Tau Ceti `tateModuleGaloisRepresentation`, `tateModuleWeilPairing`; Mathlib
`DirichletCharacter`; Layers 9.1–9.4.

## Explicit scope exclusions

- **No conductor is defined here**, no Swan conductor, no break decomposition, no ramification
  filtration, no Hasse–Arf. Layers 2.3, 3.5 and 9.2 consume the
  [arithmetic Galois representations roadmap](../ArithmeticGaloisRepresentations/README.md) Layer 3
  by name, and Layer 5 assembles its induction formula.
- **No local constant is constructed here.** `W(ρ_v, ψ_v)` is that roadmap's `epsilonWeil`
  at `s = 1/2`; this roadmap proves nothing about `ε` beyond the consequences for `W(ρ)`,
  `padicFieldRootNumber` and `ecLocalRootNumber` stated in Layer 6.
- **No `ℓ`-adic representation with infinite image**, no Weil–Deligne representation, no
  compatible system, no Tate module theory: Layer 6.5 names the Weil–Deligne representation of an
  elliptic curve only to define its local root number, and Layer 9 treats finite-image
  representations only.
- **No automorphic input.** The proved cases of Artin's conjecture and of the weight-one
  dictionary are cited, not proved; no cuspidal representation, Hecke eigenform or local Langlands
  correspondence is constructed.
- **No analytic estimate**: no nonvanishing on `Re s = 1` beyond the Hecke case consumed from
  the L-functions roadmap, no zero-free region, no Brauer–Siegel, no Aramata–Brauer (the
  entirety of `ζ_K/ζ_F`, which is the [analytic number theory roadmap](../AnalyticNumberTheoryPartI/README.md)
  §2.39), no effective Chebotarev.
- **No Galois module structure**: no Galois Gauss sums beyond the one-dimensional constants
  consumed in Layer 2.4, no symplectic root sign as a class-group invariant, no normal integral
  basis theorem (`ClassicalArithmeticCompletion` Layer 7).
- **No Stiefel–Whitney classes**: Layer 6.3's orthogonal formula is stated as an implication from
  the vanishing of `w₂`, which is defined in no roadmap of this repository.
- **No label semantics**: no `nTj` numbers, no ordering of stem fields, no orbit or conjugate
  letter of a label, no stored `HardPrimes` set, no canonical generating sequence, no minimal sibling, no `image_label` of a
  subgroup of `GL₂(𝔽_ℓ)`, and no classification of transitive
  groups ([polynomial Galois groups](../PolynomialGaloisGroups/README.md)).
- **No Sato–Tate statistics** (the Sato–Tate group of an Artin representation is its image, 7.4),
  no `ℓ`-adic image of an elliptic curve or modular form, no
  `p`-adic field family, no Hilbert weight-one dictionary, no abstract-group invariant of an image
  group (the sibling roadmaps named under *Not owned here*).
- **No dual pair of algebras** for a mod-`ℓ` representation.
- **No root-number formula for elliptic curves at `p ∈ {2, 3}`** beyond the definition through
  the local constant; Halberstadt's tables are acceptance tests.
- **No Stark conjecture beyond `s = 0`**, no Rubin–Stark, no Brumer–Stark, no Gross
  conjecture, and no `p`-adic L-function.

## Worked examples (acceptance criteria)

Each example states the value of every milestone-defined invariant it exercises and the milestone
that computes it; each was verified by computation (Sage/PARI) or by the cited source. Labels
are LMFDB labels used as external names; the only parts of a label formed here are the prefix
`dim.conductor`.

### `1.4.2t1.a.a`: the character `χ₋₄`

`ρ = χ₋₄ : G_ℚ → {±1}`, Artin field `ℚ(i)`. *Dimension* `1`; *conductor* `4`
(`a₂ = 2`, wild: the term `i = 0` alone would give `1`); *determinant* `χ₋₄` itself, the
primitive Dirichlet character modulo `4` with `χ(3) = −1` (7.1); *parity* odd, `χ(−1) = −1`,
`n₊ = 0`, `n₋ = 1`, trace of conjugation `−1` (3.3, 7.1); *indicator* `1` (7.2); *character
field* `ℚ`, orbit size `1` (7.3); *root number* `1`: `τ(χ₋₄) = 2i`, `W = 2i/(i·2) = 1` (4.3);
*local polynomials* `1 − X` at `p ≡ 1 (4)`, `1 + X` at `p ≡ 3 (4)`, `1` at `p = 2` (3.1);
`L(s, ρ) = L(s, χ₋₄)`, `Λ(s, ρ) = 4^{s/2} Γ_ℝ(s+1) L(s, χ₋₄)`, entire (4.1, 4.2, 8.1);
`ζ_{ℚ(i)}(s) = ζ(s) L(s, χ₋₄)` (3.4), the conductor–discriminant formula `4 = 1 · 4` (5.1);
*container degree* `2` (7.7); *projective image* trivial, projective field `ℚ` (7.5).
*Local root numbers:* `W(χ₋₄, ψ₂) = −i` and `W(χ₋₄, ψ_∞) = i` in the convention of Layer 2.4
(their product is `1`), so in the LMFDB's conjugate convention `W(sgn, ψ̄_∞) = −i` and the root
number of the `p`-adic field `ℚ₂(i)` is `padicFieldRootNumber ℚ₂(i) = i` (6.4: `ind 1 = 1 ⊕ χ₋₄`,
`W(1) = 1`, and the global product over `ℚ(i)` is `1`).

### `1.5.2t1.a.a` and `1.5.4t1.a.a`: the characters modulo `5`

The quadratic character `χ₅` is even (`χ₅(−1) = 1`), of conductor `5`, indicator `1`, root
number `τ(χ₅)/√5 = 1`, trace of conjugation `1`, `n₊ = 1`. The order-`4` character `χ` with
`χ(2) = i` is odd (`χ(4) = −1`), of conductor `5`, indicator `0` (not self-dual: `χ̄ = χ³ ≠ χ`),
character field `ℚ(i)` with `CharacterField = 4`, Galois orbit `{χ, χ³}` of size `2`, root number
`W(χ) = τ(χ)/(i√5) = (2/√5)(sin(2π/5) + i sin(π/5)) ≈ 0.8507 + 0.5257 i`, with
`W(χ³) = conj W(χ)` (7.3). The Artin field of `χ` is `ℚ(ζ₅)`; Layer 5.1 reads
`125 = |d_{ℚ(ζ₅)}| = 1 · 5 · 5 · 5` from the four characters modulo `5`.

### `2.23.3t2.b.a`: the dihedral representation of conductor `23`

`K` the splitting field of `x³ − x + 1` (`3.1.23.1` is a stem field; `K` has degree `6`,
discriminant `−23³ = −12167`, signature `(0, 3)`), `G ≅ S₃`, `ρ` its two-dimensional
irreducible representation. *Dimension* `2`; *conductor* `23`: `23 = 𝔭₁²𝔭₂` in the cubic field,
inertia of order `2` generated by a transposition, `V^I` one-dimensional, tame, `a₂₃ = 1` (2.3,
3.5); *determinant* `χ₋₂₃`, the quadratic character of conductor `23` (7.1); *parity* odd,
`n₊ = n₋ = 1`, trace of conjugation `0` (3.3); *indicator* `1`, orthogonal (7.2); *character field*
`ℚ`, orbit size `1`; *projective image* `S₃ = D₃`, dihedral type with `n = 3`, projective field
`= K` (7.5, 7.6), `ρ ≅ ind_{ℚ(√−23)/ℚ} ψ` for `ψ` a cubic character of the class group of
`ℚ(√−23)` (class number `3`); *container degree* `3`, container `G ↷ G/⟨(12)⟩`, i.e. `S₃` on `3`
points (7.7); *stem field* of minimal degree the cubic field; `disc(x³ − x + 1) = −23`, so the
cycle-type recipe of 7.8 applies at every `p ≠ 23`.
*Local polynomials* (3.1): at `p = 2, 3` the cubic is irreducible (Frobenius a `3`-cycle, trace
`−1`): `1 + X + X²`; at `p = 5, 7, 11` the cubic has exactly one root (transposition, trace `0`):
`1 − X²`; at `13` it is again irreducible: `1 + X + X²`; at `59` it splits completely (Frobenius trivial, trace `2`): `(1 − X)²`; at `23`: `1 − X` on the
one-dimensional `V^I` (Frobenius acts trivially there, since `D = I`). These are the coefficients
`a_p = −1, −1, 0, 0, 0, −1, 2` of `η(z)η(23z) ∈ S₁(Γ₀(23), χ₋₂₃)`, the weight-one form of Layer 8.2,
whose `a₂₃ = 1`. *L-function:* `L(s, ρ) = ζ_{3.1.23.1}(s)/ζ(s)` (3.4: `ind 1 = 1 ⊕ ρ` for the
cubic field), entire (8.1, monomial), `Λ(s, ρ) = 23^{s/2} Γ_ℝ(s) Γ_ℝ(s+1) L(s, ρ) = 23^{s/2} Γ_ℂ(s) L(s,ρ)`,
*root number* `1` (4.3: the root number of `ζ_{3.1.23.1}` is `1`, and `W(ζ) = 1`), consistent
with 6.2 (orthogonal). *Conductor–discriminant* (5.1): `|d_K| = 12167 = 1 · 23 · 23²`
(`χ(1) = 1, 1, 2` for the trivial, sign and two-dimensional characters, `𝔣(sgn) = 23`).

### `2.163.8t12.a.a`: the tetrahedral representation of conductor `163`

The `A₄`-quartic `f = x⁴ − x³ − 7x² + 2x + 9` has discriminant `163²` and is totally real; its
Galois closure `M` has degree `12`. A quadratic extension of `M` unramified outside `163` and
Galois over `ℚ` with group `SL(2,3)` (`[24, 3]`, a group with a unique involution) has the octic
stem field `ℚ(β)`, `g(β) = β⁸ − 4β⁷ + 16β⁶ − 34β⁵ + 54β⁴ − 56β³ + 36β² − 13β + 2`, of field
discriminant `163⁴`, polynomial discriminant `3² · 163⁴`, and signature `(0, 4)`; the Artin field
`K` is its Galois closure, totally imaginary of degree `24`. Let `ρ₀` be the two-dimensional representation of `SL(2,3)` with
rational character (values `2, −2, 0, −1, 1` on the classes of orders `1, 2, 4, 3, 6`) and `ω` the
cubic character `SL(2,3) → SL(2,3)/Q₈ ≅ C₃`, which is the cubic Dirichlet character modulo `163`
with `ω(2) = ζ₃` (the resolvent cubic `x³ + 7x² − 38x − 265` of `f` cuts out the cyclic cubic
field of conductor `163`). Then:

- `ρ := ρ₀ ⊗ ω` has *conductor* `163`: `163 = 𝔓₁³𝔓₂` in the octic with `f = 2` each, inertia
  `C₃` acting on `V` with eigenvalues `{ω(h)ζ₃, ω(h)ζ₃²} ∋ 1`, so `V^I` is a line and `a₁₆₃ = 1`
  (2.3, 3.5); *dimension* `2`; *determinant* `ω² = ω̄`, the other cubic character modulo `163`,
  even (7.1); *parity* even with `ρ(c) = −1`: `c` is the unique involution of `SL(2,3)`,
  `trace of conjugation = −2`, `n₊ = 0`, `n₋ = 2` (3.3) — an even representation whose
  conjugation is not trivial, the regression against defining parity by `ρ(c) = 1`;
  *indicator* `0` (values `−ζ₃` are not real) (7.2); *character field* `ℚ(ζ₃)`, `CharacterField = 3`,
  Galois orbit `{ρ₀ ⊗ ω, ρ₀ ⊗ ω²}` of size `2` (7.3); *projective image* `A₄`, tetrahedral type,
  projective field `M`, projective stem field `ℚ(α)`, `f(α) = 0` (7.5, 7.6); *Artin stem field*
  `ℚ(β)` of degree `8`, *container degree* `8`, container `SL(2,3)` on `8` points (7.7);
  *bad primes* `{163}`, while `disc g = 3² · 163⁴`: the cycle-type recipe of 7.8 applies to `g` at
  every `p ∉ {3, 163}`, and a hard-prime set formed from `g` contains the good prime `3`, the
  regression against identifying `HardPrimes` with the bad primes.
- *Local polynomials* (3.1), with `ζ = ζ₃`: Frobenius at `p` is read from the factorization of
  `g` modulo `p` (types `1⁸, 2⁴, 4², 3²1², 6·2` for the classes of orders `1, 2, 4, 3, 6`, traces
  of `ρ₀` `2, −2, 0, −1, 1`) and `ω(p)`:
  `p = 2`: type `3²1²`, `ω(2) = ζ`, trace `−ζ`, determinant `ζ²`: `1 + ζX + ζ²X²`;
  `p = 5, 13, 17, 23`: type `4²`, `ω = 1`, trace `0`, determinant `1`: `1 + X²`;
  `p = 7`: type `6·2`, `ω(7) = ζ`, trace `ζ`: `1 − ζX + ζ²X²`;
  `p = 11, 19, 29`: type `6·2`, `ω = ζ²`, trace `ζ²`: `1 − ζ²X + ζX²`;
  `p = 43`: type `3²1²`, `ω = ζ²`, trace `−ζ²`: `1 + ζ²X + ζX²`;
  `p = 163`: `V^I` a line on which Frobenius acts by `−1` (`f = 2`, the Frobenius class modulo
  inertia is the involution `−1`): `1 + X`. The conjugate `ρ₀ ⊗ ω²` has the conjugate table (7.3).
- `ρ₀` itself is an Artin representation of *conductor* `163²` (`V^I = 0` under inertia of
  order `3`), *determinant* trivial, *parity* even with trace of conjugation `−2`, *indicator*
  `−1`, symplectic (`ρ₀` factors through `Q₈ ⊂ SL₂(ℂ)` restricted from `SL(2,3)`), *root number*
  `±1` (6.2), the same projective image and fields. It is the regression for the indicator value
  `−1` and for a conductor exponent `2` at a tame prime.
- `ζ_M(s) = ζ(s) L(s, ω) L(s, ω²) L(s, ρ₃)³` with `ρ₃` the three-dimensional representation of
  `A₄`, and `ζ_K(s) = ζ_M(s) · L(s, ρ₀)² L(s, ρ₀ ⊗ ω)² L(s, ρ₀ ⊗ ω²)²` (3.4); the
  conductor–discriminant formula (5.1) gives `|d_M| = 163^{1+1+2·3} = 163⁸` and
  `|d_K| = 163⁸ · (163²)² · 163² · 163² = 163^{16}`.

### Root numbers of `p`-adic fields (Layer 6.4)

In the LMFDB's convention (`W(sgn, ψ̄_∞) = −i`), by the global product formula applied to the
quadratic fields `ℚ(√d)` and the scaling law `W(χη) = η(ϖ) W(χ)` for the unramified quadratic
`η`: `padicFieldRootNumber` takes the values `ℚ₂(√−3) : 1` (unramified); `ℚ₂(i) : i`; `ℚ₂(√−2) : i` (from `ℚ(√−2)`, odd, one finite ramified place);
`ℚ₂(√2) : 1` (from `ℚ(√2)`, even); `ℚ₃(√−3) : i` (from `ℚ(√−3)`); `ℚ₃(√3) : −i` (the twist
of the previous by the unramified quadratic character, `η(3) = −1`); `ℚ₂(√3) : i` and
`ℚ₂(√6) : −i`, `ℚ₂(√−6) : −1` (from `ℚ(√3)`, `ℚ(√6)`, `ℚ(√−6)` with the `3`-adic values just
listed). In the convention of Layer 2.4 every value is conjugated. The fourth-root-of-unity
property (6.4) and `padicFieldRootNumber = 1` for unramified fields hold in every case.

### Elliptic curves (Layer 6.5)

`11.a2` (`y² + y = x³ − x² − 10x − 20`): split multiplicative at `11` (`a₁₁ = 1`), so
`ecLocalRootNumber = −1` at `11`, `+1` at every other prime, and `globalRootNumber = (−1)(−1) = +1`,
the sign of a rank-`0` curve. `37.a1` (`y² + y = x³ − x`): nonsplit multiplicative at `37`
(`a₃₇ = −1`), `ecLocalRootNumber = +1` at `37`, `globalRootNumber = −1`, the sign of a rank-`1`
curve. Additive examples with `p ≥ 5`: `y² = x³ − p` over `ℚ_p` has `Δ = −432 p²`, `v(Δ) = 2`,
`e = 12/gcd(12,2) = 6`, `W = (−1/p)` (`+1, −1, −1` at `p = 5, 7, 11`); `y² = x³ − px` has
`Δ = 64 p³`, `v(Δ) = 3`, `e = 4`, `W = (−2/p)` (`−1, −1, +1` at `p = 5, 7, 11`).

### Mod-`ℓ` representations (Layer 9)

`ρ̄_{37.a1, 2}`: splitting field the `2`-division field, the `S₃`-closure of
`4x³ − 4x + 1` (polynomial discriminant `2⁴ · 37`; the cubic field is `3.3.148.1`, of discriminant
`148 = 2² · 37`, and `X³ − 4X + 2` is Eisenstein at `2`; the closure has discriminant `2⁴ · 37³`);
image `GL₂(𝔽₂) ≅ S₃`, order `6`, index `1`, surjective,
solvable, absolutely irreducible, determinant trivial (index `1` in `𝔽₂^× = 1`); conductor `37`
(prime to `2`); Frobenius polynomials: `X² + X + 1` (order `3`) at `p = 3, 7, 11, 41, 47, 53`
(`a_p` odd), `X² + 1 = (X+1)²` (order `2`, nonsplit `2`-division polynomial) at
`p = 5, 13, 17, 19, 23, 29, 31, 43, 59`, and the identity (trace `0`, `(X+1)²`, three roots of
the division polynomial) at the primes splitting completely in the splitting field, none below
`60`; ramified at `2` although `2 ∤ 37` (the conductor is prime to `ℓ` by definition and says
nothing about `ℓ`): inertia at `2` is the `C₃` of the totally ramified cubic, tame, so top slope
`1` (9.2); generating set `{3, 5}` (a `3`-cycle and a transposition
generate `S₃`); projective kernel field `=` splitting field (`𝔽₂^× = 1`).
`ρ̄_{11.a2, 5}`: reducible (a rational `5`-torsion point), `ρ̄^{ss} = 1 ⊕ χ₅` with `χ₅` the
mod-`5` cyclotomic character, Frobenius polynomials `(X − 1)(X − p)` modulo `5`: `(X+2)(X+4)` at
`3`, `(X+3)(X+4)` at `7`, `(X+4)²` at `31`; determinant surjective (index `1`), image contained in
a Borel, not absolutely irreducible, conductor `11`.

### Boundary and off-hypothesis checks

- `ρ ⊕ ρ'` with `ρ, ρ'` nontrivial irreducible is not irreducible: `containerDegree`,
  `IsStemField` and the projective type are defined for irreducible `ρ` only; `1 ⊕ 1` has
  `L(s, ρ)² = ζ(s)²` with a double pole, so `ArtinHolomorphic (1 ⊕ 1)` holds with order `−2`,
  and the strong Artin predicate of 8.1 does not apply.
- The representation `1 ⊕ χ₋₄` (`= ind_{ℚ(i)/ℚ} 1`) has `det(c) = −1`, so it is odd, with trace of
  conjugation `0`; the representation `χ₋₃ ⊕ χ₋₄` has `ρ(c) = −1`, determinant `1`: even, trace
  `−2`, `n₋ = 2`. Parity is a property of the determinant.
- The local polynomial of the dihedral `ρ` of conductor `23` at `23` is `1 − X`, not `1 − X²`
  and not `1`: a definition on all of `V`, or one that discards ramified primes, fails the
  comparison with `a₂₃(η(z)η(23z)) = 1`.
- A local polynomial defined with geometric Frobenius gives `1 + ζ²X + ζX²` at `p = 2` for the
  tetrahedral `ρ`, the value of its Galois conjugate; the arithmetic choice is pinned by `ω(2) = ζ₃`.
- `padicFieldRootNumber` and `W(·, ψ_p)` differ by `χ_{disc}(−1)`: for `ℚ₂(i)` the two values are
  `i` and `−i`; a roadmap that conflates the two conventions gets the wrong sign at every
  `K` with `−1` not a norm.
- `χ₋₄` modulo `2`, read as a mod-`2` representation, is trivial: `imageOrder = 1`,
  `conductor = 1`; the conductor of a reduction is computed from the reduction.
- A continuous `ρ : G_ℚ → GL₂(ℂ)` with image `{1}` has Artin field `ℚ`, `containerDegree = 1`,
  projective image trivial; a cyclic projective image never occurs for irreducible `ρ` (7.6).

## Ordering

The layer numbering is a dependency order. The useful extra information:

- **Layer 1** comes first and is arithmetic-free; 1.1–1.4 are independent of 1.5–1.6.
- **Layer 2** needs Layer 1 only; 2.3 and 2.4 are adapters to the arithmetic Galois
  representations roadmap and can be written as soon as 2.1 exists.
- **Layer 3** needs Layers 1 and 2; 3.3 is independent of 3.1–3.2; 3.4 needs 3.1–3.2 and the
  class field theory and L-functions roadmaps' Layer 5 only for the one-dimensional comparison;
  3.5 needs 3.1 and the conductor supplier.
- **Layer 4** needs Layer 3 and the L-functions roadmap's Layer 5; 4.4 needs 4.3.
- **Layer 5** needs 3.4, 3.5 and the supplier's §3.5; it is independent of Layer 4.
- **Layer 6** needs Layer 4 (6.1–6.2), Layer 2.4 (6.3–6.5); 6.5 is independent of 6.1–6.4.
- **Layer 7** needs Layers 1, 3.1, 3.3, 3.5 and 4.3 (for `Sign`); 7.6 (Klein) is independent
  of everything but 7.5 and can be done first; 7.7 needs 1.5.
- **Layer 8** needs Layer 4 (8.1), 7.6 and 3.4 (8.2), 4.4 (8.3); the three are independent.
- **Layer 9** needs Layers 1.1–1.2 and 3.1 and the supplier's Layers 3–5; it is independent of
  Layers 4–8 and can proceed in parallel with them.

## References

**J. Neukirch, *Algebraic Number Theory*, Springer 1999.** Ch. VII §10 Artin L-series:
(10.1) the definition with the local factor on inertia invariants, (10.4) Artin's formalism
(additivity, induction, inflation), (10.5) `ζ_L = ∏ L(χ)^{χ(1)}`. §11 the Artin conductor:
(11.4) the local conductor, (11.7) `f(Ind χ) = 𝔡^{χ(1)} N(f(χ))`, (11.9) the
conductor–discriminant formula. §12 the functional equation: (12.6) continuation and
`Λ(χ, s) = W(χ) Λ(χ̄, 1 − s)`, and the gamma factors through `n₊, n₋`. Ch. VII §8 the Hecke
functional equation consumed through the L-functions roadmap.

**J.-P. Serre, *Local Fields*, GTM 67.** Ch. IV §§1–3 the ramification filtration and
Herbrand; Ch. V §7 Hasse–Arf; Ch. VI §§1–3 the Artin representation and conductor, cited as the
boundary with the supplier.

**J.-P. Serre, *Linear Representations of Finite Groups*, GTM 42.** §§2–3 characters and
orthogonality; §7 induction and Frobenius reciprocity; §8.2 the dihedral groups; §§9–10 Artin's
and Brauer's theorems; §12.1 the rationality questions and `ℚ(ζ_e)`; §13.2 the Frobenius–Schur
indicator.

**J. Tate, "Number theoretic background", Proc. Sympos. Pure Math. 33 (Corvallis), 1979.**
§3 local constants `ε(V, ψ, dx)`: (3.2) Tate's constants of characters, (3.4) Deligne's theorem
and the properties (3.4.1)–(3.4.7); §4 global ε-factors and the product formula.

**P. Deligne, "Les constantes des équations fonctionnelles des fonctions L", LNM 349, 1973.**
§3 local factors of induced representations (3.8–3.9) and the cyclic block; §4 Theorem 4.1
existence and uniqueness of local constants; §5 the archimedean constants; §8.12 the
unramified-twist formula.

**P. Deligne, "Les constantes locales de l'équation fonctionnelle de la fonction L d'Artin
d'une représentation orthogonale", Invent. Math. 35 (1976).** The orthogonal root number formula
cited in Layer 6.3.

**A. Fröhlich and J. Queyrut, "On the functional equation of the Artin L-function for
characters of real representations", Invent. Math. 20 (1973).** `W(ρ) = 1` for orthogonal `ρ`
(Layer 6.2).

**A. Fröhlich, "Orthogonal representations of Galois groups, Stiefel–Whitney classes and
Hasse–Witt invariants", Crelle 360 (1985).** On disk in `references/`; the Stiefel–Whitney
reading of orthogonal local constants named in Layer 6.3.

**J. Martinet, "Character theory and Artin L-functions", in *Algebraic Number Fields* (Durham
1975), Academic Press 1977.** The survey of Artin's formalism, Brauer induction, the conductor
and the functional equation followed in Layers 3–5.

**J. Tate, *Les Conjectures de Stark sur les Fonctions L d'Artin en s = 0*, Progress in Math.
47, Birkhäuser 1984.** Ch. I §3 Prop. 3.4 the order of vanishing at `s = 0`; Ch. I §5 the Stark
regulator and Conj. 5.1; §§5–7 the independence and functoriality statements of Layer 8.3.

**T. Chinburg, "Stark's conjecture for L-functions with first-order zeros at s = 0", Adv. in
Math. 48 (1983).** The weight-one Stark unit statement (Layer 8.3), as the LMFDB's
`cmf.stark_unit` knowl cites it.

**D. E. Rohrlich, "Variation of the root number in families of elliptic curves", Compositio
Math. 87 (1993)**, and **"Elliptic curves and the Weil–Deligne group", CRM Proc. Lecture Notes 4
(1994).** The local root numbers of elliptic curves: the multiplicative cases and the formulas
for additive potentially good reduction at residue characteristic `≥ 5` (Layer 6.5). Theorem
numbers are not cited; the formulas are stated in the text of Layer 6.5 and verified on the
worked examples.

**E. Halberstadt, "Signes locaux des courbes elliptiques en 2 et 3", C. R. Acad. Sci. Paris
326 (1998).** The tables at `p = 2, 3`, acceptance tests only.

**P. Deligne and J.-P. Serre, "Formes modulaires de poids 1", Ann. Sci. ENS 7 (1974).**
Théorème 4.1 and 4.6, the weight-one dictionary consumed in Layer 8.2.

**J. W. Jones and D. P. Roberts, "A database of local fields", J. Symbolic Comput. 41 (2006).**
The root number of a `p`-adic field as the LMFDB displays it (Layer 6.4).

**F. Klein, *Vorlesungen über das Ikosaeder*, Teubner 1884.** The classification of the finite
subgroups of `PGL₂(ℂ)` (Layer 7.6), proved here by the orbit-count argument.

**The LMFDB knowls** `artin.*`, `modlgal.*`, `lf.root_number`, `ec.local_root_number`,
`cmf.artin_field`, `cmf.projective_image`, `cmf.stark_unit`, and the source files
`lmfdb/artin_representations/math_classes.py`, `lmfdb/modl_galois_representations/web_modlgal.py`:
the definitions of the invariants as the database states them, which Layers 7 and 9 formalize.
