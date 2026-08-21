# Roadmap: global number fields, ray classes, adeles, and Hecke characters

This roadmap builds the reusable global arithmetic carried by a number field before reciprocity or
L-function analysis begins. Its central objects are the places and completions of a number field,
weak approximation, moduli and ray class groups, additive and multiplicative adeles, the idele
class group, ray class and Hecke characters, algebraic infinity types, and orders with their Picard
groups. Geometry of numbers supplies the uniform ideal-counting statements that analytic consumers
need.

The organizing principle is one carrier per mathematical object. Finite-place Frobenius,
ramification, and the ideal Artin map are consumed from Number Field Arithmetic. Reciprocity,
class fields, norm-index theorems, and ring class fields belong to Class Field Theory. Algebraic
groups over adeles and Tamagawa measures belong to Adelic Algebraic Groups. This roadmap supplies
the arithmetic objects on which all three developments operate.

Suggested home: `TauCeti/NumberTheory/NumberField/Global/`, with subdirectories `Places/`,
`Approximation/`, `RayClass/`, `Counting/`, `Adeles/`, `Ideles/`, `HeckeCharacter/`,
`InfinityType/`, `Cyclotomic/`, and `Orders/`. Public declarations live in the namespace
`GlobalNumberFields` or in the namespace of their principal carrier.

[`Suggested.lean`](Suggested.lean) gives representative declaration shapes. The markdown roadmap
is definitive. A dated, non-normative account of the source material and ecosystem is maintained
in a private provenance ledger.

## Scope

### In scope

- finite and infinite places as one global indexing vocabulary, with their completions;
- the normalized local absolute values and the product formula;
- Artin--Whaples weak approximation, including mixed finite and infinite places;
- moduli, multiplicative congruences, ray class groups, narrow class groups, and transition maps;
- geometry-of-numbers counts in ideal and ray classes, with uniform power-saving errors;
- the finite adele ring, the full adele ring, and their diagonal embeddings;
- additive strong approximation for finite adeles, discreteness in full adeles, and compactness of
  the additive quotient;
- ideles, the idele class group, the global norm, the norm-one subgroup, and its compactness;
- base change, Galois action, extension maps, and norm maps for adeles and ideles;
- archimedean completion classification and normalized absolute values;
- ray class characters, Hecke characters, their conductors, shifts, and unitary parts;
- the arithmetic splitting and ramification package for cyclotomic fields;
- continuous and algebraic infinity types;
- orders in number fields, conductors, invertible proper fractional ideals, their wide and narrow
  Picard groups, and the separate ideal class monoid that also sees noninvertible ideals.

### Out of scope

- constructing finite-place Frobenius, ramification groups, different/discriminant comparisons, or
  the ideal Artin map;
- local or global reciprocity, norm-index equalities, Hasse norm theorems, existence theorems, or
  class formations;
- ray class fields, Hilbert class fields, ring class fields, and Kronecker--Weber;
- Dedekind, Hecke, Grossencharacter, or Artin L-functions and their analytic continuation;
- Chebotarev density and prime-counting theorems;
- algebraic groups evaluated on adeles, adelic orbits, Haar normalization on algebraic groups,
  Tamagawa measures, and strong approximation for algebraic groups;
- Hasse--Minkowski and global quadratic-form classification.

The first exclusion is owned by Number Field Arithmetic. The next two are owned by Class Field
Theory. The analytic exclusions are owned by Arithmetic Dirichlet Series, L-functions, and
Chebotarev. The algebraic-group exclusions are owned by Adelic Algebraic Groups. The last is owned
by Global Quadratic Forms.

## Dependencies and ownership contracts

### Mathlib

Mathlib supplies `HeightOneSpectrum (𝓞 K)`, `InfinitePlace K`, the finite and infinite completion
types, `FiniteAdeleRing`, `AdeleRing`, the canonical embeddings, the canonical-embedding lattice,
the product formula, fractional ideals, class groups, Dirichlet's unit theorem, and the
cyclotomic-field API. This roadmap extends those objects and does not replace them with wrappers.

### Number Field Arithmetic

The dependency is one-way. The exact declarations consumed here are:

| Declaration | Use here |
| --- | --- |
| `idealsAway` | The group of fractional ideals whose valuations vanish at a finite set of primes. `idealsPrimeTo 𝔪` is a reducible abbreviation at `𝔪.support`, never another subgroup. |
| `idealsAwayInclusion` | Transition of prime-to ideal groups when the support grows. |
| `integralIdealsAway`, `integralIdealsAwayHom` | Nonzero integral ideals prime to a finite set and their map to the fractional-ideal group. |
| the finite-completion dictionary | Identification of `v.adicCompletion K` with the canonical nonarchimedean local-field data, including normalized valuation and residue cardinality. |

No Artin symbol or Artin homomorphism is consumed in the construction of the carriers here.
Class Field Theory consumes those maps separately when it builds reciprocity.

### Interfaces supplied to Class Field Theory

Class Field Theory consumes the following named objects and does not redefine them:

```text
Modulus
Modulus.support
Modulus.exponent
congruenceSubgroup
idealsPrimeTo
ray
RayClassGroup
idealClass
classMap
narrowModulus
IdeleGroup
IdeleClassGroup
ideleNorm
IdeleClassGroup.normOne
IdeleCongruenceSubgroup
RaySubgroup
rayClassQuotient
adeleExtension
adeleNorm
ideleExtension
ideleNorm
HeckeCharacter
RayClassCharacter
HeckeCharacter.shift
HeckeCharacter.unitaryPart
```

These are arithmetic and topological carriers. A reciprocity map from an idele class quotient to a
Galois group is not among the exports.

### Interfaces supplied to analytic roadmaps

L-functions consumes the character carriers, their conductor and unitary decomposition, and the
ray-class arithmetic. Chebotarev additionally consumes the two uniform counting declarations:

| Declaration | Exact contract |
| --- | --- |
| `GlobalNumberFields.rayClassIdealCount` | Every ray class has the same positive linear main term in the number of nonzero integral ideals prime to the modulus, with one power-saving exponent uniform over the finite ray class group. |
| `GlobalNumberFields.rayClassCharacter_partialSums` | For a nontrivial ray class character, the common main terms cancel and the character sum over ideals of norm at most `x` satisfies a power-saving bound. |

Total ideal counting is not a substitute for either theorem. The second is what continues a
nontrivial ray-class character series through `Re s = 1` by Abel summation.

### Interface supplied to Global Quadratic Forms

The load-bearing approximation export is exactly

```text
GlobalNumberFields.weakApproximation_denseRange.
```

It states density of the diagonal image in a finite product containing both finite and infinite
completions. A finite-place congruence corollary is not strong enough for the Hasse-principle
argument, which approximates vector coordinates at a mixed set of places.

### Interface supplied to Adelic Algebraic Groups

This roadmap supplies `FiniteAdeleRing`, `AdeleRing`, their placewise projections, the diagonal
embedding, `denseRange_algebraMap_finiteAdeleRing`, `IdeleGroup`, `IdeleClassGroup`, and the
normalized local/global absolute values. Adelic Algebraic Groups owns every construction involving
`G(𝔸_K)`, restricted products of group points, quotient volumes, and Tamagawa numbers.

### Interface supplied to Integral Lattices

```text
NumberFieldOrder
NumberFieldOrder.conductor
NumberFieldOrder.IsProperFractionalIdeal
NumberFieldOrder.invertibleProperFractionalIdeals
IdealClassMonoid
Pic
NarrowPic
```

The ring class field attached to an order is deliberately absent: it belongs to Class Field Theory.

## Standing hypotheses and levels of generality

The standing number-field context is `[Field K] [NumberField K]`; write `𝓞 K` for the ring of
integers. Finite places are `HeightOneSpectrum (𝓞 K)`, infinite places are `InfinitePlace K`, and
the completion types are Mathlib's `v.adicCompletion K` and `w.Completion`.

Finite-part ideal and ray constructions are first stated for a Dedekind domain with fraction field.
Real places, geometry-of-numbers finiteness, adeles, Hecke characters, and orders are stated for
number fields. A general Dedekind domain need not have finite residue rings or finite class group,
so ray-class finiteness and counting always carry number-field or explicit finiteness hypotheses.

An order is generally not integrally closed and is therefore not inserted into the Dedekind-generic
ray-class theory. Its invertible ideal theory is built separately. A fractional ideal is **proper**
when its multiplier ring is the order, but properness does not imply invertibility for an arbitrary
order. The equivalence is stated only under an explicit Gorenstein hypothesis (and, in particular,
for quadratic orders). Noninvertible ideals belong to the ideal class monoid, not either Picard
group.

## Pinned conventions

| Subject | Convention |
| --- | --- |
| Finite place | `HeightOneSpectrum (𝓞 K)`. Its completion and valuation are Mathlib's; no second finite-place structure is introduced. |
| Infinite place | `InfinitePlace K`, with real places represented by the subtype `{w // w.IsReal}`. A modulus can contain only real places. |
| Absolute values | At a finite place, a uniformizer has absolute value `q_v⁻¹`; at a real place use `|x|`; at a complex place use `|z|²`. These are exactly the multiplicities in Mathlib's product formula. |
| Weak approximation | Density of `K` in any finite product of its finite and infinite completions. The mixed product is the primary theorem; congruence and sign statements are corollaries. |
| Modulus | A nonzero integral ideal and a `Finset` of real places. Complex places never divide a modulus. |
| Divisibility | `𝔪 ∣ 𝔫` means that the finite exponents and the infinite set grow. The transition map runs `Cl_𝔫 ↠ Cl_𝔪`. |
| Multiplicative congruence | `x ≡ 1 mod* 𝔪` is a condition on `Kˣ`: the prescribed valuation of `x-1` at finite divisors and positivity at the selected real places. It is not unqualified membership in `1 + 𝔪₀`. |
| Prime-to ideal group | `idealsPrimeTo 𝔪` abbreviates `NumberFieldArithmetic.idealsAway 𝔪.support`. There is one group. |
| Ray class group | `Cl_𝔪 K = J^{𝔪₀}/P_𝔪`. The trivial modulus comparison with `ClassGroup (𝓞 K)` is a named equivalence, not definitional equality. |
| Narrow class group | The ray class group for the modulus with unit finite part and every real place. It agrees with the wide group for a totally imaginary field by theorem. |
| Idele topology | The topology on the units of `AdeleRing` is the units topology from `x ↦ (x,x⁻¹)`, not the subspace topology inherited from the ring. |
| Idele norm | Product of normalized local absolute values. It is `1` on principal ideles, and therefore descends to the idele class group. |
| Hecke character | A continuous multiplicative character of the idele class group. A collection of ideal coefficients, gamma shifts, and finite characters is a presentation of one, not another carrier. |
| Shift | The unique **real** `σ` with `|χ| = ‖·‖^σ`; allowing a complex shift destroys uniqueness up to unitary norm twists. |
| Proper ideal of an order | A fractional ideal `I` with multiplier ring `{x | xI ⊆ I}` equal to the order. This is necessary but, for a general non-Gorenstein order, not sufficient for invertibility. |
| Picard group of an order | The group of **invertible proper fractional ideals** modulo nonzero principal fractional ideals. It is not the ideal class monoid of all fractional ideals. |
| Narrow Picard group | The same invertible carrier modulo principal fractional ideals with a totally positive generator (equivalently positive norm only in the quadratic cases where that dictionary is used). |
| Ideal class monoid | Homothety classes of nonzero fractional ideals, including noninvertible classes. Its group of units recovers `Pic O`; the whole monoid is not forced into a group. |

## The build, in twelve layers

### Layer 0: places, completions, and the product formula

Adopt Mathlib's finite and infinite place types and build a uniform API for ranging over all places.
For a finite `v`, consume the Number Field Arithmetic comparison between `v.adicCompletion K` and
its nonarchimedean local-field data. For an infinite `w`, prove that `w.Completion` is topologically
isomorphic to `ℝ` when `w` is real and to `ℂ` when it is complex, compatibly with the embedding of
`K`.

Define the normalized local absolute value on each side of this partition and prove:

- agreement with `HeightOneSpectrum.valuation` at finite places;
- the real and squared-complex formulas at infinite places;
- finiteness of the set on which `|x|_v ≠ 1` for `x ∈ Kˣ`;
- the global product formula as a transport of `NumberField.prod_abs_eq_one`;
- functoriality under a finite extension, with local degrees in the exponents.

This layer contains no local reciprocity map and no Frobenius construction.

### Layer 1: weak approximation and multiplicative congruences

Prove Artin--Whaples weak approximation in the named mixed-completion form
`GlobalNumberFields.weakApproximation_denseRange`. For finite sets `S_f` and `S_∞`, the diagonal map

```text
K → (∏ v ∈ S_f, K_v) × (∏ w ∈ S_∞, K_w)
```

has dense range. Derive simultaneous independent finite-place targets and real-place signs for one
element of `Kˣ`. The conclusion uses `Kˣ`: a formulation in `K` can accidentally allow `0` to meet
negative sign requests.

Define the total sign homomorphism to the product of `ℤˣ` over real places. Prove its surjectivity
on `Kˣ`, while recording that the restriction to `𝓞_Kˣ` need not be surjective. This failure is the
narrow-class obstruction.

Strong approximation is not part of this layer: integrality at every omitted finite place is an
additional condition and is proved adelically in Layer 6.

### Layer 2: moduli and ray class carriers

Define `Modulus K`, its finite support and exponent function, divisibility, `gcd`, `lcm`, the trivial
modulus, and `narrowModulus`. Define `IsCongrOne`, `primeToSubgroup`, and `congruenceSubgroup`, with
the valuation and positivity clauses visible.

Define `idealsPrimeTo 𝔪` as the reducible abbreviation of
`NumberFieldArithmetic.idealsAway 𝔪.support`. Define the ray of principal ideals generated by
`congruenceSubgroup 𝔪`, then define `RayClassGroup 𝔪` as the quotient. Supply:

- the named subgroups `primeToSubgroup` and `unitsCongruenceSubgroup`, so reduction and the
  unit correction in the class-number formula have exact carriers;
- `idealClass`, its multiplicativity and the named triviality criterion
  `idealClass_eq_one_iff`;
- the moving lemma and `idealClass_surjective`;
- `classMap` and `finiteUnitsMap`, their direction from a larger modulus to a smaller one,
  surjectivity where appropriate, composition, and compatibility with `idealClass`;
- the ray-class exact sequence including the unit-sign obstruction;
- `finite_rayClassGroup` and the class-number formula;
- the trivial-modulus equivalence with `ClassGroup (𝓞 K)`;
- the narrow class group, its surjection to the wide group, and its kernel formula.

A direct-product decomposition into residue units, signs, and the ordinary class group is false in
general because the image of global units glues the factors.

### Layer 3: geometry of numbers and ray-class ideal counting

Build the Minkowski embedding and its lattice/covolume API from Mathlib's canonical embedding.
Prove a Lipschitz-boundary lattice-point estimate for the expanding regions used to count integral
ideals. Recover Mathlib's total ideal-counting asymptotic as an agreement theorem.

Refine the argument to every ray class. Define `rayClassIdealCountingFunction 𝔪 c x` using only
nonzero integral ideals prime to `𝔪` whose `idealClass` is `c`. Define the positive common coefficient
`rayClassIdealMainTerm 𝔪`; identify it with the Dedekind-zeta residue times the finite Euler factors,
divided by `#RayClassGroup 𝔪`.

Prove the exact consumer export

```text
GlobalNumberFields.rayClassIdealCount
```

with one exponent `δ > 0`, independent of `c`, such that every class count is

```text
rayClassIdealMainTerm 𝔪 * x + O(x^(1-δ)).
```

For a nontrivial `χ : RayClassCharacter 𝔪`, use finite-character orthogonality to cancel the common
main terms and prove the exact export

```text
GlobalNumberFields.rayClassCharacter_partialSums.
```

The sum is over all nonzero integral ideals prime to the modulus. It is not a sum over chosen class
representatives. This layer is arithmetic counting; analytic continuation is performed by the
consumer.

### Layer 4: finite adeles

Develop the placewise API of Mathlib's `FiniteAdeleRing (𝓞 K) K`: projections, integral
subrings, elements supported at one place, the restricted-product condition, local compactness,
and the unit group. Prove that the diagonal embedding agrees with the finite completion maps.

Give the finite-idele description of `ClassGroup (𝓞 K)`: quotient by the everywhere-integral units
and principal finite ideles. Relate valuations of finite ideles to `idealsAway` and its integral
submonoid. This comparison is an equivalence or a named homomorphism with a kernel theorem, not an
informal dictionary.

### Layer 5: full adeles and the additive quotient

Use Mathlib's `AdeleRing (𝓞 K) K` as the product of infinite adeles and finite adeles. Prove the
componentwise topology, local compactness, and continuity of the diagonal embedding. Prove that
`K` is discrete in the full adele ring and that `𝔸_K/K` is compact.

These are the additive global finiteness statements underlying the later compactness of the
norm-one idele class group. At `K = ℚ`, identify a standard fundamental domain and verify that its
translates cover.

### Layer 6: additive strong approximation and ideles

Prove the separately named theorem

```text
denseRange_algebraMap_finiteAdeleRing :
  DenseRange (algebraMap K (FiniteAdeleRing (𝓞 K) K)).
```

This is strong approximation with the archimedean places omitted. It is neither Layer 1's weak
approximation nor discreteness in the full adele ring.

Define `IdeleGroup K` as the units of the full adele ring and `IdeleClassGroup K` as the quotient by
principal ideles, retaining Mathlib's units topology. Prove local compactness and Hausdorffness.
Define the idele norm from Layer 0's local absolute values, prove it is trivial on principal ideles,
and define the closed norm-one subgroup `IdeleClassGroup.normOne`. Prove its compactness and recover
class-group finiteness and Dirichlet's unit theorem as agreement corollaries.

The full idele class group is not compact: its norm quotient contains `ℝ_{>0}`.

### Layer 7: congruence subgroups and the ray-class dictionary

Define one `IdeleCongruenceSubgroup 𝔪`. At a finite divisor of `𝔪` it uses principal units of the
specified level; at other finite places it uses local units; at a selected real place it uses
positive elements; and at all remaining infinite places it imposes no condition. Define its image
`RaySubgroup 𝔪` in the idele class group.

Prove openness, antitonicity, and

```text
rayClassQuotient : IdeleClassGroup K →* RayClassGroup 𝔪
```

with surjectivity and kernel `RaySubgroup 𝔪`. Prove compatibility with `classMap`. Prove that every
open subgroup of the idele class group contains a ray subgroup and describe the identity component
`D_K`, including `D_K ≤ RaySubgroup 𝔪` and the profiniteness of `C_K/D_K`.

### Layer 8: finite extensions of adeles and ideles

For a finite extension `L/K`, construct the `𝔸_K`-algebra structure on `𝔸_L` and the topological
comparison with `L ⊗_K 𝔸_K`. Construct the Galois action placewise and prove continuity. Define the
extension and norm maps on adeles, ideles, and idele classes, with component formulas over the
places above each base place.

Prove composition in towers, compatibility with principal elements, the projection formula, and
the local-degree formula for the global norm. These are carrier and functoriality theorems. Do not
state a norm-index equality, a cohomological fixed-point theorem, or reciprocity.

### Layer 9: Hecke and ray class characters

Define the canonical carrier

```text
HeckeCharacter K := ContinuousMonoidHom (IdeleClassGroup K) ℂˣ
```

and `RayClassCharacter 𝔪 := RayClassGroup 𝔪 →* ℂˣ`. Construct
`HeckeCharacter.ofRayClassCharacter` as pullback along `rayClassQuotient`; prove injectivity and
characterize its image.

Prove that finite order, open kernel, and factoring through some ray class group are equivalent.
Define local components and the finite conductor ideal. For characters trivial on the identity
component, define the least ray conductor modulus. Define `RayClassCharacter.induced` against
`classMap` and `RayClassCharacter.IsPrimitive`; prove that the trivial character of a nontrivial
modulus is imprimitive.

Define `HeckeCharacter.shift : ℝ` and `HeckeCharacter.unitaryPart`, prove uniqueness of the real
shift, norm one of the unitary part, and vanishing of the shift for ray-class characters. Over `ℚ`,
prove the conductor- and parity-compatible dictionary with Dirichlet characters.

### Layer 10: archimedean characters, infinity types, and cyclotomic arithmetic

Classify continuous characters of `ℝˣ` as `|x|^s sgn(x)^ε`, with `ε : ZMod 2`, and of `ℂˣ` as
`(z/|z|)^k |z|^s`, with `k : ℤ`. Define `InfinityType K` by its integer exponents at embeddings and
the conjugation bookkeeping. Define algebraicity of a Hecke character through this carrier and
prove the unit compatibility, purity, norm twists, base change, and the ideal-side character.

For `ℚ(ζ_n)`, prove the splitting law, the prime-power and general ramification formulas, and the
conductor-normalized statement accounting for `ℚ(ζ₆)=ℚ(ζ₃)`. Prove
`RayClassGroup (ratModulus n h) ≃* (ZMod n)ˣ`, for the named modulus `(n)·∞`, and its
compatibility with Mathlib's cyclotomic Galois
group and arithmetic Frobenius. This is an arithmetic identification of carriers; no global Artin
map or class-field existence theorem is constructed.

### Layer 11: orders and Picard groups

Define `NumberFieldOrder K` as a `ℤ`-subalgebra finite over `ℤ` and spanning `K` over `ℚ`; derive
the fraction-field instance. Define `NumberFieldOrder.conductor` as the largest `𝓞_K`-ideal inside
the order and prove the annihilator, index, and discriminant descriptions.

Define the multiplier-ring predicate `NumberFieldOrder.IsProperFractionalIdeal`. Define
`NumberFieldOrder.invertibleProperFractionalIdeals` as the group of units in the fractional-ideal
monoid and prove that every such ideal is proper. Define `Pic O` as this invertible carrier modulo
nonzero principal fractional ideals. Define `NumberFieldOrder.narrowPrincipal` as a subgroup of
the same invertible carrier and

```text
NarrowPic O := O.invertibleProperFractionalIdeals / O.narrowPrincipal.
```

Do **not** assert that every proper ideal is invertible. State that equivalence only for a
Gorenstein order, with the quadratic-order result as a named specialization. Define the separate
`IdealClassMonoid O` from homothety classes of nonzero fractional ideals so that noninvertible
proper ideals have a home without being assigned inverses.

Construct extension and contraction between **invertible** ideals prime to the conductor and
maximal-order ideals prime to the conductor. Put both restrictions in the carrier types of the
maps, and prove they are inverse equivalences there. Likewise, the prime correspondence is only
between primes away from the conductor. Prove the ray-class-style congruence description and
finiteness for the invertible Picard carrier; do not use noninvertible ideal classes in a
group-valued statement. The unrestricted maximal-order comparison is valid only after specializing
to the maximal order, where every nonzero fractional ideal is invertible. The wide/narrow
comparison is the named canonical map
`NumberFieldOrder.narrowToPic : NarrowPic O →* Pic O`: give its value on an ideal class, prove
surjectivity, and identify its kernel through the exact sequence
`Oˣ → {±1}^{r₁} → NarrowPic O → Pic O → 1`. Prove naturality for order morphisms and state the
commuting maximal-order specialization as `narrowClassToClass`; the old existential
`narrowPic_surjective` remains only as a corollary of the named map.

Do not define `ringClassField O`. Class Field Theory consumes the congruence description and builds
that field.

Include the following regression example (and its named target): let
`K = ℚ(∛2)`, `α = ∛2`, `O = ℤ + 2ℤα + 2ℤα²`, and
`A = 8ℤ + 2ℤα + 2ℤα²`. Then the multiplier ring of `A` is `O`, while `A` is not
invertible. Thus `A` gives a proper noninvertible ideal in a non-Gorenstein cubic order and must
produce a nonunit class in `IdealClassMonoid O`, never an element of `Pic O`.

## Acceptance tests and nearby false statements

1. A mixed finite/real set of places is accepted by `weakApproximation_denseRange`; a theorem only
   about infinite places or only about congruences does not discharge the target.
2. Weak approximation does not assert integrality at every omitted finite place.
3. `idealsPrimeTo 𝔪` unfolds to `NumberFieldArithmetic.idealsAway 𝔪.support`.
4. A modulus over a real field is tested with a nonempty infinite part; otherwise every narrow
   statement can silently collapse to the wide one.
5. The transition map runs from a larger modulus to a smaller modulus.
6. The ray class group is not a product of residue units, signs, and the class group; global units
   impose the extension.
7. `rayClassIdealCount` has one main coefficient and one power-saving exponent uniform in the ray
   class. Total ideal counting does not imply it.
8. `rayClassCharacter_partialSums` assumes the character is nontrivial. For the trivial character,
   the linear main term survives.
9. `K` is dense in the finite adeles and discrete in the full adeles. Interchanging those ambient
   rings makes both statements false.
10. At a complex place the local norm uses `|z|²`, not `|z|`.
11. The idele topology is the units topology, not the subspace topology.
12. A complex shift in the unitary decomposition is rejected because uniqueness fails.
13. `ℚ(ζ₆)` is unramified at `2`; “ramified exactly at primes dividing `n`” is rejected without
    conductor normalization.
14. A proper ideal in a general order need not be invertible. The cubic regression ideal
    `8ℤ + 2ℤ∛2 + 2ℤ(∛2)²` is proper but noninvertible and belongs only to the ideal class
    monoid.
15. `Pic` and `NarrowPic` use invertible proper fractional ideals; neither quotients all proper
    ideals into a group.
16. Extension/contraction and prime correspondence are stated on invertible ideals or primes away
    from the conductor. The maximal-order comparison does not erase these hypotheses before the
    actual maximal-order specialization.
17. No declaration named `ringClassField`, `globalArtinMap`, or `reciprocity` is introduced here.

## Ordering and parallelism

Layers 0 and 1 start from Mathlib and the finite-completion exports of Number Field Arithmetic.
Layer 2 uses Layer 1 and the consumed `idealsAway`. Layer 3 uses Layer 2 and can proceed in parallel
with Layers 4--5. Layers 6--8 build the adelic spine. Layer 9 depends on Layers 2 and 7. Layers 10
and 11 are independent after their carrier dependencies are present.

Class Field Theory, L-functions, Chebotarev, Adelic Algebraic Groups, Global Quadratic Forms, and
Integral Lattices consume this roadmap after these contracts stabilize.

## References

- J. Neukirch, *Algebraic Number Theory*, Chapters II, V, VI, and VII.
- G. J. Janusz, *Algebraic Number Fields*, Chapter IV §1.
- J. W. S. Cassels and A. Fröhlich, eds., *Algebraic Number Theory*, Chapter II.
- A. Weil, *Basic Number Theory*, Chapters II and IV.
- S. Lang, *Algebraic Number Theory*, Chapters V, VII, and XV.
- J. Tate, “Fourier analysis in number fields and Hecke's zeta-functions,” for the adelic carrier
  conventions (not as an instruction to use Tate's thesis analytically here).
- G. S. Kopp and J. C. Lagarias, *Class Field Theory for Orders of Number Fields*, §2, for
  invertible fractional ideals, conductor-prime restrictions, ideal class monoids, and the explicit
  cubic proper-noninvertible example.
- D. A. Cox, *Primes of the Form x² + ny²*, §7, only for the specialization to **quadratic**
  orders, where proper fractional ideals are invertible; it is not a source for that equivalence for
  arbitrary number-field orders.
