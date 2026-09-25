# Roadmap: L-functions — completions and functional equations

This roadmap develops the analytic theory of the principal L-functions attached to number
fields. It starts with a normalization-conscious record for completed L-functions, specializes
lattice Poisson summation to the mixed embedding and proves the theta identities used in Hecke's
method, constructs the continued Dedekind zeta and Hecke L-functions, and packages conductors,
root numbers, and Grossencharacters.

Three neighbouring roadmaps deliberately own the reusable substrate. Arithmetic Dirichlet Series
owns ideal weights, norm regrouping, Euler products, density, summation, and Tauberian methods.
Global Number Fields owns moduli, ray class groups, ray class characters, and the Hecke-character
carrier. Theta Series owns Poisson summation for a full-rank `ℤ`-lattice in a finite-dimensional
real inner product space, the Fourier transform of a Gaussian on such a space, and the theta
series of a lattice with its transformation laws and its modularity. This roadmap consumes those
declarations and owns the analytic presentations, completions, and functional equations attached
to them; of the theta material it owns the number-field specialization and nothing generic.

Suggested home: `TauCeti/NumberTheory/LFunctions/`, divided into `Data/`, `Theta/`,
`DedekindZeta/`, `Dirichlet/`, `Hecke/`, and `Grossencharacter/`.
[`Suggested.lean`](Suggested.lean) pins the most important declaration shapes; it is not an
exhaustive checklist. Dated provenance records are maintained privately and are non-normative.

## Scope and ownership

### Owned here

- analytic- and arithmetic-normalized completed L-function records and their duals;
- conductor, gamma-shift, degree, root-number, polar-divisor, and normalization conventions;
- the number-field specialization of lattice Poisson summation: the Euclidean pairing of the
  mixed space and its transport to Mathlib's Euclidean model, the comparison of the Euclidean dual
  of an ideal lattice with its trace dual, the Gaussian of an ideal lattice with one positive
  parameter per infinite place and its theta series, the action of the units on those parameters,
  the norm-one hypersurface with its Haar measure and a fundamental domain for the units on it
  (Mathlib's fundamental cone, with Neukirch's volume `2^(r-1) R`), the Mellin kernel of a partial
  zeta function — the theta series averaged over that domain — with its transformation law and its
  constant term, the Mellin principle on a functional-equation pair, and the single theorem that
  fixes the additive character, the self-dual measure, the Fourier sign, the discriminant factor
  and both archimedean factors at once;
- partial zeta functions and the continuation, residue, and functional equation of Dedekind zeta;
- special values and exact quadratic and cyclotomic factorizations;
- Dirichlet L-function cards extending Mathlib's continued functions;
- finite-order ray-class Hecke L-functions and general Grossencharacter L-functions;
- the primitive-character carrier, primitive conductors and their universal property, Gauss sums,
  root numbers, continuations, and functional equations;
- character-specific nonvanishing on `Re s = 1`, as an intrinsic theorem about the named
  continued L-function, and the boundary data that a prime-distribution consumer needs from it.

### Consumed, not redefined

From `ArithmeticDirichletSeries`:

```text
UnitaryIdealWeight
normCoeff
regroupByNorm
EulerProductData
landau
abelSummation
primeVonMangoldtCoeff
PrimeBoundaryRemainder
```

This roadmap specializes these declarations to zeta and Hecke coefficients. It does not
define another ideal weight, another norm-regrouped series, or another generic Euler product.

From `GlobalNumberFields`:

```text
Modulus
Modulus.support
Modulus.mem_support_iff
Modulus.support_one
RayClassGroup
integralIdealsPrimeTo
idealClass
RayClassCharacter
RayClassCharacter.induced
RayClassCharacter.IsPrimitive
HeckeCharacter
HeckeCharacter.ofRayClassCharacter
HeckeCharacter.shift
HeckeCharacter.unitaryPart
HeckeCharacter.infinityType
HeckeCharacter.IsFiniteOrder
HeckeCharacter.isFiniteOrder_iff_exists_rayClassCharacter
HeckeCharacter.shift_ofRayClassCharacter
ContinuousInfinityType
ContinuousInfinityType.EqOnIdentityComponent
AlgebraicInfinityType
FiniteOrderInfinityType
IdeleGroup
IdeleCongruenceSubgroup
ideleFiniteCoord
ideleInfiniteCoord
IsCongrOne
primeToSubgroup
rayClassIdealMainTerm
```

The character carrier is therefore available without importing Class Field Theory. Reciprocity
and class fields are not used merely to restate a Hecke character. The idelic names are what pin
a Grossencharacter presentation to its Hecke character: no idele, prime idele or congruence
subgroup is constructed here.

From `ThetaSeries`:

```text
poissonSummation
summable_poisson_left
summable_poisson_right
dual
dual_dual
covolume_dual
gaussian
gaussian_apply
fourier_gaussian
```

Lattice Poisson summation, the dual lattice and the Fourier transform of a Gaussian are that
roadmap's, stated for a full-rank `ℤ`-lattice in an arbitrary finite-dimensional real inner
product space. They are consumed by `import TauCetiRoadmap.ThetaSeries.Suggested` and applied by
name: `dualIdealLattice` is defined through `dual`, `dual_comap_dualIdealLattice` and
`covolume_dualIdealLattice` are closed by `dual_dual` and `covolume_dual`, `mixedGaussian_toMixed`
is closed by `gaussian_apply`, and a closed-checks section applies all nine at the ideal lattice,
so that a supplier rename or retype breaks this roadmap's file rather than a docstring. Layer 1
here specializes them to the mixed embedding of a fractional ideal. It states no second Poisson
theorem, no second dual-lattice notion, and no theta series on the upper half plane.

### Not owned here

- generic ideal-series operations, Euler-product calculus, norm regrouping, logarithmic
  derivatives, density predicates, Abel/Perron summation, Landau, or Wiener--Ikehara
  (`ArithmeticDirichletSeries`);
- moduli, ray classes, adeles, ideles, and Hecke-character carriers (`GlobalNumberFields`);
- Poisson summation for a lattice in a real inner product space, the Fourier transform of a
  Gaussian on such a space, the dual-lattice, covolume, biduality and scaling lemmas that go with
  them, the theta series of a lattice and of its cosets on the upper half plane, the `T`- and
  `S`-transformation laws, Gauss sums of a lattice, and every modularity statement
  (`ThetaSeries`);
- Frobenius or Artin-symbol carriers (`NumberFieldArithmetic`);
- Frobenius prime sets, cyclotomic crossing, fixed-field fibres, Chebotarev density, Frobenius von
  Mangoldt weights, or qualitative Chebotarev prime counting (`Chebotarev`);
- prime counting itself: the `ψ`, `ϑ` and `π` transfer, the prime ideal theorem, and any
  equidistribution statement about prime ideals are consequences drawn by a consumer of the
  boundary data exported below, not milestones here (`ArithmeticDirichletSeries` owns the
  transfer, `Chebotarev` the Frobenius counting);
- zero distributions, zero-free regions, zero counting, the explicit formula, and effective
  estimates (`ZerosOfLFunctions`);
- local epsilon factors and the adelic proof of the functional equation (Tate's thesis);
- Artin representations, their local reciprocal polynomials and conductors, Artin L-functions,
  Brauer induction, or Artin formalism (a future `ArtinRepresentations` roadmap);
- Artin reciprocity and class fields (`ClassFieldTheory`).

The absence of zero-distribution targets is intentional. A theorem that one named character
L-function is nonzero on `Re s = 1` belongs here because it is part of that function's basic
analytic theory. Uniform zero-free regions, zero counting, and consequences extracted from zeros
belong downstream.

## Exact dependency contracts

### Arithmetic Dirichlet Series

| Declaration | Use here |
| --- | --- |
| `ArithmeticDirichletSeries.UnitaryIdealWeight` | coefficient systems of ray-class and Grossencharacter presentations. ⚠ The accepted supplier has `MultiplicativeIdealWeight` and its unitary refinement, and no `IdealWeight`; everything used here — `HasCancellation`, `sq`, `IsNormTwistOnGood`, `continuedLFunctionOfWeight` — is stated for the unitary one |
| `ArithmeticDirichletSeries.normCoeff` | conversion of an ideal-indexed L-function into Mathlib's `LSeries` coefficients |
| `ArithmeticDirichletSeries.regroupByNorm` | equality between the ideal sum and the norm-indexed series |
| `ArithmeticDirichletSeries.EulerProductData` | local Euler factors and the global Euler-product theorem |
| `ArithmeticDirichletSeries.landau` | positivity input in the character-specific `3-4-1` nonvanishing argument |
| `ArithmeticDirichletSeries.abelSummation` | continuation of a nontrivial ray-class series from arithmetic partial sums |
| `ArithmeticDirichletSeries.primeVonMangoldtCoeff` and `PrimeBoundaryRemainder` | the carrier and the record shape of `primeIdealVonMangoldtBoundary`, the boundary datum this roadmap owes the supplier |

The density predicates, the Perron kernel, Wiener--Ikehara itself and the `ψ → ϑ → π` transfer
have no consumer here: this roadmap **supplies** the analytic input those theorems take and draws
none of their arithmetic conclusions. The supplier's `primeIdealTheorem_of_boundary` is
conditional on the exact export `primeIdealVonMangoldtBoundary`, and producing it needs the
continuation of `ζ_K`, its simple pole, and its nonvanishing on `Re s = 1`, all owned here.

### Global Number Fields

| Declaration | Use here |
| --- | --- |
| `GlobalNumberFields.Modulus`, `Modulus.support` and `Modulus.IsCoprimeTo` | finite and infinite conductor data, the domain of ray-class coefficients, and the primes whose Euler factors a ray-class series deletes |
| `Modulus.mem_support_iff` and `Modulus.support_one` | the characterization `v ∈ 𝔪.support ↔ v.asIdeal ∣ 𝔪.finitePart`, which reads `finiteEulerCorrection`'s product over `𝔪.support` as the product over the primes dividing `𝔪₀`, and its trivial-modulus case, which closes `finiteEulerCorrection_one` |
| `GlobalNumberFields.integralIdealsPrimeTo` and `idealClass` | the ray class of an ideal, on the carrier that already contains the coprimality proof. ⚠ There is no total `idealClass` on `Ideal (𝓞 K)`: the class indicator and the ray-class weight are defined through this carrier, never through a junk class at a bad ideal |
| `GlobalNumberFields.RayClassCharacter` | finite-order Hecke L-functions |
| `RayClassCharacter.induced` and `.IsPrimitive` | the primitive-character carrier, its universal property, and the imprimitive Euler-factor correction |
| `GlobalNumberFields.rayClassCharacter_partialSums` | continuation of nontrivial ray-class L-functions to a strip containing `Re s = 1` |
| `GlobalNumberFields.rayClassIdealMainTerm` and `rayClassIdealMainTerm_eq` | the common residue of the partial zeta functions. The supplier owns its closed form — the Dedekind-zeta residue times the Euler factors at the primes dividing the finite modulus, divided by the ray class number — and this roadmap proves that the analytic residue is that same constant, rather than introducing a second one |
| `GlobalNumberFields.HeckeCharacter` | the primary object of a `Grossencharacter` presentation: every other field is an equation in it, and a presentation is determined by it (`Grossencharacter.ext`) |
| `HeckeCharacter.ofRayClassCharacter`, `.IsFiniteOrder`, `.isFiniteOrder_iff_exists_rayClassCharacter` and `.shift_ofRayClassCharacter` | the finite-order case: `Grossencharacter.ofRayClassCharacter` is built from the first by its fields, `exists_rayClassCharacter_of_isFiniteOrder` is the finite presentation at the stated modulus, and `shift_eq_zero_of_isFiniteOrder` is closed by the last two |
| `HeckeCharacter.shift` and `.unitaryPart` | `Grossencharacter.shift` is the former of the primary object; the latter is what `unitaryWeight` is pinned to at the prime ideles, and the full completion recenters the unitary completion at `s - shift`. ⚠ The supplier pins `shift` only by `shift_eq_zero_iff`, so its sign is fixed here, by `toHeckeCharacter_primeIdele`: `χ(π_𝔭) = χ_u(𝔭) N𝔭^shift`, the ideal-side `χ = χ_u N^shift`. Since `‖π_𝔭‖ = N𝔭⁻¹`, this is `‖χ y‖ = ‖y‖^(-shift)` idelically — Tate's exponent is `-shift` — and that one equation is requested of the supplier |
| `HeckeCharacter.infinityType`, `ContinuousInfinityType` and `ContinuousInfinityType.EqOnIdentityComponent` | the archimedean restriction of the primary object and the supplier's identity-component comparison, by which `Grossencharacter.infinityType` is pinned to it; `realParity` is compared on the nose outside the modulus and supplies the real gamma shifts. ⚠ This is the *idelic* infinity type: Hecke's classical infinity type, the one in `χ((a)) = χ_f(a) χ_∞(a)`, is its negative (Neukirch VII (6.13)), which is the sign in the unit relation `compatibility` and in the harmonic polynomial of the theta kernel |
| `primeToSubgroup` | the fractions prime to the finite modulus, Neukirch's `K^(𝔪)`: the domain on which the derived finite character `Grossencharacter.finiteCharacter` extends multiplicatively (`finiteCharacterK`), which is what the twisted theta series of a fractional ideal evaluates |
| `IdeleGroup`, `ideleFiniteCoord` and `ideleInfiniteCoord` | the prime ideles at which `unitaryWeight` is pinned to the unitary part, described by their coordinates — a uniformizer at one finite place, `1` at every other finite and infinite place. ⚠ No prime idele is constructed here: the equation quantifies over the ideles with those coordinates, whose classes differ by units at the place, on which a character presented at `𝔪` is trivial |
| `IdeleCongruenceSubgroup` | the modulus condition of a presentation: triviality on the finite part of the subgroup, the ideles in it with all archimedean coordinates `1`. ⚠ Triviality on the whole subgroup, which contains the archimedean identity components, is the finite-order condition |
| `IsCongrOne` | the multiplicative congruence `a ≡ 1 mod* 𝔪`, positivity at the real places of `𝔪` included, on which Hecke's unit relation holds |
| `GlobalNumberFields.AlgebraicInfinityType` | algebraic infinity types and their gamma shifts. ⚠ This is the integer-exponent carrier, the one Grossencharacter data uses; the general `ContinuousInfinityType` of an arbitrary Hecke character has complex archimedean exponents, and the finite-order characters of Layer 5 have only `FiniteOrderInfinityType` signs |

`rayClassIdealCount` is arithmetic input to Chebotarev, not to this roadmap. Its omission from the
table is a boundary check.

### Theta Series

| Declaration | Use here |
| --- | --- |
| `ThetaSeries.poissonSummation` | `∑' ℓ : L, f (v + ℓ) = (covolume L volume)⁻¹ * ∑' m : L^∨, 𝓕 f m * exp (2 π i ⟪v, m⟫)` for `f : 𝓢(E, ℂ)` and `v : E`, over a finite-dimensional real inner product space `E` with its Borel structure and `L : Submodule ℤ E` with `[DiscreteTopology L] [IsZLattice ℝ L]`; the sign is that of Mathlib's `𝓕`. `poissonSummation_idealLattice` is its instance at `euclideanIdealLattice` and `v = 0`. ⚠ `mixedSpace K` is not an inner product space: the theorem is applied in Mathlib's `NumberField.mixedEmbedding.euclidean.mixedSpace`, which is, and transported back along `euclidean.toMixed` by `mixedInner_toMixed` (the inner product goes to `mixedInner`), `mixedFourier_toMixed` (`𝓕` goes to `mixedFourier`, by Mathlib's `euclidean.volumePreserving_toMixed`) and `covolume_euclideanIdealLattice` (Mathlib's `ZLattice.covolume_comap`) |
| `ThetaSeries.summable_poisson_left` and `summable_poisson_right` | absolute summability of the two sides on their own, `Summable fun ℓ : L ↦ f (v + ℓ)` and `Summable fun m : L^∨ ↦ 𝓕 f m * exp (2 π i ⟪v, m⟫)`, rather than only inside the Poisson equality; the Mellin transform of a theta series is computed by exchanging the sum with the integral, which the equality alone does not license |
| `ThetaSeries.dual` and `ThetaSeries.dual_dual` | `dual L` is Mathlib's `BilinForm.dualSubmodule (innerₗ E) L`, written `L^∨`, and `dual_dual : (L^∨)^∨ = L`. `dualIdealLattice` **is** `dual (euclideanIdealLattice K I)` pulled back to the mixed space along `euclidean.toMixed`; `mem_dualIdealLattice_iff` is its elementwise description, the form `analyticDual_mixedEmbedding` compares with the trace dual, and `dual_comap_dualIdealLattice` is `dual_dual` at the ideal lattice, closed |
| `ThetaSeries.covolume_dual` | `covolume (L^∨) volume = (covolume L volume)⁻¹`; `covolume_dualIdealLattice` is its instance, closed through Mathlib's `ZLattice.covolume_comap` on both sides of the change of model, so Mathlib's covolume of the ideal lattice gives the covolume of its dual without a second determinant computation |
| `ThetaSeries.gaussian` and `gaussian_apply` | `gaussian (τ : ℍ) : 𝓢(E, ℂ)` with `gaussian τ x = exp (π i ‖x‖² τ)`. `mixedGaussian K t` is `gaussian (t i)` read in the mixed space — `mixedGaussian_toMixed`, closed by `gaussian_apply` and `mixedInner_toMixed` — and being Schwartz, the hypothesis Poisson summation takes, is part of the supplier's type rather than a separate lemma |
| `ThetaSeries.fourier_gaussian` | `𝓕 (gaussian τ) y = (τ / i) ^ (-(finrank ℝ E) / 2) * exp (π i ‖y‖² (-1/τ))`, with `Complex.cpow`. At `τ = t i` it is `fourier_gaussian_imaginaryAxis`, the self-duality with factor `t ^ (-[K:ℚ]/2)` by Mathlib's `euclidean.finrank`, which through the two transports is the first conjunct of `gaussianTheta_mellin_normalization` |

The rest of that roadmap has no consumer here. The theta series on the upper half plane, the coset
theta series, the `T`- and `S`-transformation laws, the Gauss sums and the two modularity theorems
are its own; Hecke's method needs the Gaussian only on the imaginary axis, and this roadmap takes
its Mellin transform there. Theta Series itself imports no roadmap — its lattice inputs come from
the Tau Ceti library — so the `ThetaSeries` arrow is a leaf of this roadmap's import graph and
cannot close a cycle; this roadmap consumes nothing from Integral Lattices, directly or through
Theta Series.

### Exports to Zeros of L-functions

The downstream zeros roadmap consumes the following exact declarations and no prose-level promise:

```text
AnalyticLFunctionData
AnalyticLFunctionData.dual
AnalyticLFunctionData.HasDirichletAgreement
AnalyticLFunctionData.HasMeromorphicContinuation
AnalyticLFunctionData.HasFunctionalEquation
NormalizationTranslation
riemannZetaData
dedekindZetaC
completedDedekindZeta
dedekindZetaData
dirichletData
heckeLFunctionC
completedHeckeLFunction
heckeData
grossencharacterData
```

For every continued function, regularity away from its named polar divisor is exported as
`AnalyticAt` or `AnalyticOnNhd`, not merely by an inequality for `meromorphicOrderAt`. The latter
depends only on a punctured germ and does not constrain the total representative's value.

### Exports to prime distribution

A prime-distribution consumer — the `ψ → ϑ → π` transfer of Arithmetic Dirichlet Series, or a
Frobenius count in Chebotarev — takes analytic input from this roadmap and nothing else. That
input is these two declarations, and no prose-level promise:

```text
primeIdealVonMangoldtBoundary
exists_continuousOn_logDeriv_of_unitaryCancelling
```

The first is the record `PrimeBoundaryRemainder K Set.univ 1` on which the supplier's
`primeIdealTheorem_of_boundary` is explicitly conditional: residue `1` from the simple pole of
`ζ_K`, and a continuous remainder across `Re s = 1` that exists because `ζ_K` has no zero there.
The second is its twisted counterpart: for a unitary weight covered by `UnitaryCancelling`, the
logarithmic derivative of the named continuation extends continuously to `Re s ≥ 1` with no
residue. Hecke's angular equidistribution of Gaussian primes is a consumer of the second together
with `angularGrossencharacterData`; it needs a Tauberian step and Fourier analysis on the angular
character group, so it is a prime-distribution theorem and is not proved here.

## Standing hypotheses and pinned conventions

The number-field context is `[Field K] [NumberField K]`. Finite-order Hecke theory is over a
modulus `𝔪 : GlobalNumberFields.Modulus K`; the general carrier is
`GlobalNumberFields.HeckeCharacter K`.

| Subject | Convention |
| --- | --- |
| normalization | Analytic normalization reflects `s ↦ 1-s`; arithmetic weight `w` reflects `s ↦ w+1-s`. |
| completion | The conductor factor `N^(s/2)` is part of `completed`, so the functional equation has no extra conductor constant. |
| degree | `#gammaR + 2 #gammaC`; it is not inferred from coefficients or from `HasDirichletAgreement`. |
| dual | conjugate coefficients and gamma shifts, conjugate root number, reflected completed function, and conjugated polar divisor. |
| poles | `polarOrder p = n` records an exact pole of order `n`; value equalities are asserted only off poles, while germ equalities cover poles. |
| global identities | every identity between two continued functions — a factorization, a functional equation, an imprimitive comparison — is stated on a right half-plane, promoted by uniqueness of meromorphic continuation to an equality of germs at every point, and stated pointwise only away from the polar loci. An unrestricted equality of total representatives is never asserted: Mathlib's value at a pole is junk, and `1/(1-s)` at `s = 1` is `0`. |
| ray-class coefficients | every ray-class coefficient carries coprimality to the finite modulus, so every such series is missing the Euler factors at the primes dividing it. `finiteEulerCorrection 𝔪 s = ∏_{𝔭 ∣ 𝔪₀} (1 - N𝔭^(-s))` is the single name for those factors — a product over `𝔪.support`, equal to the divisor-indexed product by the supplier's `Modulus.mem_support_iff` — and it is `1` only for a trivial finite part. |
| primitive scope | a primitive conductor, root number, completion, Gauss sum, or card takes `PrimitiveRayClassCharacter`, which carries the conductor and the primitivity proof together. A presentation level is never stored as an arithmetic conductor, and a character never carries two conductors. |
| imprimitive series | retain the presented L-series and a finite Euler-factor correction to the canonical primitive series; do not manufacture a second completed card. |
| Grossencharacter presentation | the idele class character is the primary object; the weight, the infinity type and the modulus condition are equations in it, so a presentation is determined by its Hecke character. The analytic card is the unitary part's. |
| Hecke shift | the shift is the supplier's `HeckeCharacter.shift` of the primary object, `χ = χ_u N^shift` on ideals — at a prime idele `χ(π_𝔭) = χ_u(𝔭) N𝔭^shift` (`toHeckeCharacter_primeIdele`), i.e. `‖χ y‖ = ‖y‖^(-shift)` idelically — and the full completion is defined by recentering the unitary completion at `s-shift`. |
| archimedean sign | `infinityType` is the idelic archimedean exponent `n`; the finite value on a principal ideal `(a)`, `a ≡ 1 mod* 𝔪`, is the **inverse** of the archimedean value: `χ_u((a)) N(a)^shift · ∏_τ τ(a)^(n_τ) = 1` (`compatibility`, Neukirch VII (6.13)). Hecke's classical infinity type is `-n`; the harmonic polynomial of the theta kernel puts the conjugate coordinate at a complex place of positive angular frequency. The nonreal test is `angularGrossencharacter_compatibility_test`. |
| Mellin transform | Neukirch's (1.4): `L(f, s) = ∫ (f(t) - f(∞)) t^s dt/t`, on the carrier `FEPairWithLevel`. The completed partial zeta function at `s` is the Mellin transform of its kernel at `s/2` (5.5); the unitary completion of a Grossencharacter at `s` is the transform of its kernel at `(s + Tr p / n)/2` (8.3). No kernel is left to an existential. |
| root-number duality | `W(χ⁻¹) = W(χ)⁻¹`; for a unitary character this is also `conj W(χ)`. |

## The build, in layers

### Layer 0: completed L-function data

Define `AnalyticLFunctionData` with norm-indexed coefficients, positive integral conductor, real
and complex gamma-shift multisets, root number, completed function, and a finitely supported polar
divisor. Define its degree and gamma factor.

Construct the full dual record. Prove involutivity, degree preservation, gamma-factor conjugation,
transport of continuation and coefficient-growth predicates, and the functional equation against
the dual record. State the equation between values only where both sides are regular; state an
eventual equality of punctured germs at every point.

Split the basic properties into reusable predicates:

- Dirichlet-series agreement on `Re s > 1`;
- meromorphic continuation with exact poles and analyticity away from them;
- functional equation and unit-modulus root number;
- average coefficient growth.

Define `EqOffZero` to compare general analytic cards while ignoring coefficient zero, which
Mathlib's `LSeries` does not read. This remains necessary because independently defined analytic
presentations may use different junk values there. Do not impose a global zero convention on
`AnalyticLFunctionData`.

Build `ArithmeticLFunctionData` with a structural field
`coeff_zero : toAnalyticLFunctionData.coeff 0 = 0`, and build `NormalizationTranslation` from it.
If the arithmetic weight is `w`, the analytic series is obtained by shifting `s` to `s+w/2`;
gamma shifts move by `+w/2`, and the completed function carries the forced constant `N^(-w/4)`.
Prove existence, uniqueness, degree invariance, and equivalence of the two functional equations;
the equivalence translates all three fields of the predicate — the unit-modulus root number, the
reflection symmetry of the polar divisor, which becomes
`polarOrder s = polarOrder (w + 1 - conj s)`, and the value equation off both polar loci — and not
the value equation alone.
The coefficient translation is stated only for `n ≠ 0`; the analytic target stores its own zero
proof, while the arithmetic source inherits the convention from its card. Consequently
`existsUnique` cannot be applied to a malformed source with nonzero zeroth coefficient, and the
weight-zero comparison remains an exact equality of cards rather than merely `EqOffZero`.

Mandatory tests:

- weight zero gives the identity translation;
- the weight-12 discriminant form has analytic complex gamma shift `+11/2`, not `-11/2`;
- the Riemann-zeta card has degree one, conductor one, root number one, and simple poles at zero
  and one;
- a non-real character uses a genuinely distinct dual card;
- ⚠ a card with a malformed polar divisor — weight zero, completed function identically zero,
  polar divisor supported at `0` only — satisfies the root-number and value clauses and has no
  functional equation (`malformedPolarCard`); it is the regression against weakening the
  equivalence to the value equation, and nothing in the equivalence's hypotheses excludes it.

### Layer 1: the mixed-space specialization of Poisson summation, and theta

Lattice Poisson summation is not developed here. `ThetaSeries` owns it, for a full-rank
`ℤ`-lattice in a finite-dimensional real inner product space and a Schwartz function, along with
the Fourier transform of a Gaussian and the dual-lattice, biduality, covolume and summability
lemmas that go with it; the exact declarations consumed are imported and tabulated above. This
layer builds what a number field adds to them, and nothing else.

Fix the analytic conventions once, as data rather than as prose. The additive character is
Mathlib's `Real.fourierChar`, so `𝐞 x = exp(2 π i x)`; the pairing is the Euclidean `mixedInner`,
not the trace form; the measure is `volume`, which is self-dual for that pairing; and the sign is
Mathlib's, `𝐞(-⟨x, y⟩)`. `mixedFourier` is the transform built from exactly those four choices,
and every later normalization is a consequence of them.

Transport the supplier's theorem onto the mixed space. `mixedSpace K` carries Mathlib's product
sup norm and is not an inner product space, so the theorem does not apply to it as it stands;
Mathlib's `NumberField.mixedEmbedding.euclidean.mixedSpace` is one, and `euclidean.toMixed` is a
continuous linear equivalence between the two. Prove `mixedInner_toMixed`: that equivalence
carries the inner product of the Euclidean model to `mixedInner`. Mathlib's
`euclidean.volumePreserving_toMixed` carries `volume` to `volume`, so `mixedFourier` transported
along the equivalence is Mathlib's `𝓕` (`mixedFourier_toMixed`), and pulling the ideal lattice
back along the equivalence gives `euclideanIdealLattice`, a full-rank `ℤ`-lattice there with the
same covolume (`covolume_euclideanIdealLattice`, Mathlib's `ZLattice.covolume_comap`). Define the
dual ideal lattice as the supplier's `dual` of `euclideanIdealLattice`, pulled back along the
same equivalence; prove its elementwise description `mem_dualIdealLattice_iff` and its
trace-dual comparison `coe_dualIdealLattice`, and read biduality and the dual covolume off the
supplier's `dual_dual` and `covolume_dual` (`dual_comap_dualIdealLattice`,
`covolume_dualIdealLattice`). Those facts are what turn `ThetaSeries.poissonSummation` into
`poissonSummation_idealLattice`, which is therefore a specialization and not a second proof.

For the mixed embedding of a fractional ideal, compare the Euclidean dual with the trace dual.
The comparison map is the identity on real coordinates and `z ↦ 2 conj z` on complex coordinates.
One complex coordinate has real determinant `-4`, so the absolute determinant is `4`; the global
absolute determinant is `4^r₂`. The covolume itself is Mathlib's
`NumberField.mixedEmbedding.covolume_idealLattice`, equal to `N(I) 2^(-r₂) sqrt|d_K|`; this
roadmap consumes that computation rather than restating it, and checks it at `K = ℚ(i)`, where
the ring of integers has covolume one.

Use the transported Poisson summation to prove the Gaussian theta transformation, including the
level, epsilon scalar, and constant terms. The real-parameter Gaussian is the supplier's
`ThetaSeries.gaussian` on the imaginary axis, at `τ = i t` (`mixedGaussian_toMixed`, closed by
`gaussian_apply`), and its self-duality is `ThetaSeries.fourier_gaussian` at that point
(`fourier_gaussian_imaginaryAxis`). Close the layer with a checks section applying each of the nine
consumed declarations at the ideal lattice, so that the dependency is verified by the elaborator
and not by a docstring. The holomorphic upper-half-plane theta function, the coset theta series,
the `T`- and `S`-transformation laws and every modularity statement belong to `ThetaSeries`;
Hecke's method needs the Gaussian only on the imaginary axis and never leaves it.

**The archimedean parameter and the unit quotient (Neukirch VII §5).** ⚠ A Gaussian with one
parameter `t`, Mellin-transformed in `t`, gives the Epstein zeta function of the lattice `σ(𝔞)` —
a sum over lattice points, `∑_{x ≠ 0} Q(x)^(-s)` — and not the partial zeta function, a sum over
ideals, that is over lattice points modulo the unit group. In positive unit rank the lattice-point
sum `∑_{a ∈ 𝔞, a ≠ 0} N((a))^(-s)` is not even summable, since every ideal is hit by infinitely
many units; the two constructions coincide only when the unit group is finite. Hecke's method
therefore needs, and this layer names in Neukirch's order:

- the parameter space `R_+^*` (`ArchParam`, Mathlib's `realSpace K`) with its norm
  `N(y) = ∏_w y_w^(mult w)` (`archNorm`), and the Gaussian `exp(-π ∑_w y_w |x_w|²)` with one
  positive parameter per infinite place (`archGaussian`), whose Fourier transform is
  `N(y)^(-1/2)` times the Gaussian at `y⁻¹` (`mixedFourier_archGaussian`) — the supplier's
  `fourier_gaussian` after the change of variable `x ↦ √y • x`, of Jacobian `N(y)^(1/2)`;
- the theta series `θ_L(y)` of a lattice at that parameter (`latticeTheta`), its absolute
  convergence from the supplier's `summable_poisson_left` (`summable_archGaussian`), and its
  transformation `θ_L(y) = covol(L)⁻¹ N(y)^(-1/2) θ_{L^∨}(y⁻¹)` (`latticeTheta_inv`, Neukirch
  (3.6) on the imaginary axis), against the Euclidean dual `mixedDual`, of which `dualIdealLattice`
  is the instance at an ideal lattice;
- the action of a unit `u` on the parameters, `y_w ↦ |u|_w² y_w` (`unitScale`, Neukirch's
  `|ε|² y`), which is `x ↦ u • x` read on the Gaussian (`archGaussian_unit_smul`), preserves the
  norm, has the torsion as kernel (`unitScale_eq_self_iff`), and leaves the theta series of an
  ideal lattice invariant (`latticeTheta_unitScale`) — the one place the unit group enters, and
  what a constant parameter cannot see;
- the norm-one hypersurface `S = {N(y) = 1}` (`normOneSurface`), the decomposition
  `R_+^* = S × ℝ_+^*`, `y = x t^(1/n)` (`surfaceScale`, `surfacePart`), the multiplicative Haar
  measure `dy/y = ∏_w dy_w/y_w` (`archHaar`), and the Haar measure `d*x` of `S` pinned by
  `dy/y = d*x × dt/t` (`surfaceHaar`, `archHaar_eq_map`) — "we will not need any more explicit
  description of `d*x`", and none is given;
- a fundamental domain for the unit action on `S` (`IsUnitFundamentalDomain`), of which
  Neukirch's `F` is taken from Mathlib: the parameters whose square root lies in
  `NumberField.mixedEmbedding.fundamentalCone K` (`unitFundamentalDomain`), a fundamental domain
  for `(𝓞 K)ˣ` modulo torsion that depends only on `|x_w|` and is the cone through which Mathlib
  itself enumerates the ideals of a class; inversion and translation on `S` carry fundamental
  domains to fundamental domains;
- Neukirch's (5.6), `vol(F) = 2^(r-1) R` with `r = r₁ + r₂` and `R` Mathlib's regulator, for
  every fundamental domain (`surfaceHaar_of_isUnitFundamentalDomain`). ⚠ Two normalizations differ
  from Neukirch's and are audited in the worked cases: the Gaussian uses `mixedInner`, in which a
  complex coordinate counts once, and `dy/y` is the product over places, whereas Neukirch's
  canonical measure carries `e_𝔭 = 2` at a complex place and is `2^r₂` times it. So `vol(F)` reads
  `2^(r-1) R / 2^r₂` here, the compensating `2^r₂` sits in the Mellin kernel, and the kernel's
  constant term is Neukirch's `2^(r-1) R / w` in both.

**The Mellin principle.** Package it once, on the carrier `FEPairWithLevel`: two functions on
`(0, ∞)` with exponentially approached limits at `∞`, related by
`f(1/(level t)) = ε t^weight g(t)` — the `epsilon` field occurs in that law — and the continued
Mellin transform `L(f, s) = ∫ (f(t) - f(∞)) t^s dt/t` (`completed_eq_mellin`), which Neukirch's
(1.4) continues to the plane with simple poles at `0` and `weight` of residues `-f(∞)` and
`ε level^(-weight) g(∞)` and the equation `L(f, s) = ε level^(-s) L(g, weight - s)`
(`completed_eq`, `residue_zero`, `residue_weight`). The Dedekind kernels of Layer 3 and the
Grossencharacter kernels of Layer 6 are its instances; nothing else continues a completed
function.

**One normalization theorem.** The functional equation depends on the additive character, the
self-dual measure, the Fourier sign, the discriminant factor, the factor `2` inside
`Gammaℂ s = 2 (2π)^(-s) Γ(s)`, and the archimedean shifts. Scattered remarks about those choices
do not prevent a factor-of-two or an inverse-discriminant error, so they are collected into the
single theorem `gaussianTheta_mellin_normalization`: the Gaussian is self-dual for `mixedFourier`
with the factor `t^(-[K:ℚ]/2)`; the theta series of an ideal lattice transforms with that factor
and the covolume; every completed partial zeta function is the Mellin transform at `s/2` of the
named kernel `mellinKernel` minus its constant term `mellinConstant`, for every fundamental domain
(Neukirch (5.5)) — not of an unnamed `θ`, which would hide the unit quotient; and the completed
zeta carries exactly `|d_K|^(s/2)`, `Gammaℝ(s)^r₁` and `Gammaℂ(s)^r₂`.

Three worked checks are mandatory, and none is redundant.

- `K = ℚ`: `completedDedekindZeta ℚ` is Mathlib's `completedRiemannZeta` off the poles at `0` and
  `1`. This fixes the real gamma factor and conductor one.
- `K = ℚ(i)`: `|d| = 4` and `r₂ = 1`, so `4^(s/2) Gammaℂ(s) ζ_{ℚ(i)}(s)` must equal
  `2 π^(-s) Γ(s) ζ(s) L(s, χ₋₄)` on `Re s > 1`, by Legendre duplication against the quadratic
  factorization. ⚠ Dropping the factor `2` in `Gammaℂ`, or writing the conductor power as
  `|d|^(-s/2)`, changes this constant, and the rational check sees neither error. The kernel's
  constant term is `1/4` here and `1/2` over `ℚ` (`mellinConstant_cyclotomic_four`,
  `mellinConstant_rat`).
- `K` real quadratic: the unit-quotient check, `realQuadratic_unitQuotient_test` of Layer 3. Both
  fields above have a finite unit group and a fundamental domain that is a point; a real quadratic
  field has unit rank one, `w = 2` and regulator `log ε`, so the fundamental domain is one period
  of the hyperbola `y_1 y_2 = 1` under `y ↦ |ε|² y`, of volume `2R`, the kernel's constant term is
  `R`, and every partial zeta function has residue `2R` at `s = 1`, summing over the `h` classes
  to the residue `2hR` of `completedDedekindZeta`. ⚠ A construction that Mellin-transforms the
  one-parameter theta series passes the first two checks and fails this one, because its
  lattice-point sum is not summable in positive unit rank (`not_summable_absNorm_of_rank_pos`).

### Layer 2: partial zeta functions

For a modulus and ray class supplied by Global Number Fields, define its indicator as an
`ArithmeticDirichletSeries.IdealArithmeticFunction` on nonzero ideals, equal to one exactly on
prime-to-modulus ideals in that class. The class is read off the supplier's prime-to carrier, so
the coprimality proof travels with the ideal and no junk class is available at a bad one. It is
not a `UnitaryIdealWeight`: the indicator of a nontrivial class is not completely multiplicative.
Define the partial zeta series using the shared `normCoeff` and `regroupByNorm` API. Establish
convergence on `Re s > 1`, the sum over ray classes, the common residue, and continuation to a
strip by Abel summation and the uniform ray-class arithmetic.

⚠ **The sum over ray classes is not `ζ_K`.** Summing the class indicators gives the indicator of
the ideals prime to the finite part of the modulus, so

```text
∑_{c ∈ Cl_𝔪} ζ(s, c) = ∑_{(𝔞, 𝔪₀) = 1} N𝔞^(-s) = ζ_K(s) ∏_{𝔭 ∣ 𝔪₀} (1 - N𝔭^(-s)).
```

Name that product once, as `finiteEulerCorrection` — a product over `𝔪.support`, which is the
product over `𝔭 ∣ 𝔪₀` by the supplier's `Modulus.mem_support_iff`, never a second divisor set —
and use the same name everywhere it recurs: in the trivial-character L-function of Layer 5, in
the imprimitive comparisons, and in the residue. Equality with `ζ_K` holds exactly when the
finite part is trivial, which is the separate class-group statement below; a modulus with one
prime in its support already breaks it, and that is a required rejection test.

The common residue follows: every ray class has the same simple pole at `s = 1`, with residue the
Dedekind-zeta residue times that finite Euler correction, divided by the ray class number. ⚠
`κ_K / #Cl_𝔪` is wrong for a nontrivial finite part. This constant is the supplier's
`rayClassIdealMainTerm`, whose closed form the supplier proves; prove that the analytic residue is
that same constant instead of introducing a second one.

Construct the class-group specialization for the trivial modulus, where the correction is an empty
product and the partial zeta functions do sum to `ζ_K`. Prove independence from choices of ideal
representatives and compatibility with change of modulus. No generic ideal series or Euler product
is introduced in this layer.

### Layer 3: Dedekind zeta

Construct the completed partial zeta functions from the theta kernel of Layer 1, following
Neukirch VII (5.3)–(5.9) step by step, and `dedekindZetaC K` and `completedDedekindZeta K` as
their sum over the classes (`completedDedekindZeta_eq_sum_completedPartialZeta`):

- (5.3)–(5.4): the integral ideals of the class of `𝔞⁻¹` are the `a 𝔞⁻¹` for `a ∈ 𝔞 ∖ 0` modulo
  units, so `ζ(𝔎, s) = N(𝔞)^s ∑_{a ∈ 𝔞*/𝔬*} |N(a)|^(-s)`; Mathlib has the bijection through its
  fundamental cone (`fundamentalCone.idealSetEquiv`, `card_isPrincipal_norm_eq_mul_torsion`), and
  the completed partial zeta function `completedPartialZeta` of a fractional ideal is pinned by
  both sums (`completedPartialZeta_eq_tsum`, `completedPartialZeta_eq_tsum_fundamentalCone`) and
  linked to Layer 2's ray-class partial zeta function (`completedPartialZeta_eq_partialZeta`);
- ⚠ the Epstein regression first: the radial Mellin transform of the one-parameter theta series is
  `π^(-s) Γ(s)` times the Epstein zeta function of `mixedInner` on `σ(𝔞)`, a sum over points
  (`radialMellin_eq_epsteinZeta`), and in positive unit rank the corresponding sum over norms is
  not summable at all (`not_summable_absNorm_of_rank_pos`);
- the unfolding, (5.5) before the Mellin substitution: over the cone `D × ℝ_+^*` above a
  fundamental domain (`unitCone`) the theta series minus its constant term integrates against
  `N(y)^(s/2) dy/y` to `Z(𝔎, s)` (`completedPartialZeta_eq_integral_unitCone`). The constants are
  `2^r₂` from the Euclidean normalization at the complex places — the gamma integral of
  `e^{-π y |z|²}` against `y^(2s) dy/y` is `2^(2s-1) Γ_ℂ(2s) |z|^(-4s)` — `1/w` from the torsion,
  and the covolume `V_𝔞 = N(𝔞) 2^(-r₂) √|d_K|`, whose square rescales the parameter so that
  `|d_K|^(s/2)` and the `N(𝔞)^s` of (5.4) both come out. The exchange of the sum over lattice
  points with the integral is licensed by absolute convergence over the cone
  (`summable_integral_unitCone`): each unit orbit contributes one gamma integral and
  `∑_𝔟 N𝔟^(-Re s)` converges for `Re s > 1` — whereas over all of `R_+^*` the same sum diverges,
  which is the Epstein regression seen from the integral side;
- (5.5): the Mellin kernel `f_D(𝔞, u) = (2^r₂/w) ∫_D θ_𝔞(x (u/V_𝔞²)^(1/n)) d*x` (`mellinKernel`),
  with `Z(𝔎, s) = ∫_0^∞ (f_D(𝔞, u) - a₀) u^(s/2) du/u` for `Re s > 1`
  (`completedPartialZeta_eq_mellin`); its constant term `a₀ = 2^(r-1) R / w` (`mellinConstant`) is
  the same for every fundamental domain;
- (5.8): the kernel is `a₀ + O(e^{-c u^(1/n)})` at `∞` (`mellinKernel_sub_const_isBigO`), and it
  transforms by `f_D(L, 1/u) = u^(1/2) f_{D⁻¹}(L^∨, u)` for every lattice, from `latticeTheta_inv`
  and the substitution `x ↦ x⁻¹` on `S` (`mellinKernel_inv`); the Euclidean dual of `σ(𝔞)` is the
  trace dual `σ((𝔞𝔡)⁻¹)` moved by `traceToEuclidean`, which on the parameters is the translation
  by the point `traceShift` of `S` (`mellinKernel_dualIdealLattice`), the covolumes
  `V_{(𝔞𝔡)⁻¹} = V_𝔞⁻¹ 4^(-r₂)` absorbing the `16^r₂` of the doubled complex coordinates;
- the Mellin principle: `dedekindFEPair`, level `1`, weight `1/2`, `ε = 1`, both limits `a₀`,
  whose `completed` at `s/2` is `Z(𝔎, s)` (`dedekindFEPair_completed`); this continues
  `completedPartialZeta` (`meromorphic_completedPartialZeta`, `analyticAt_completedPartialZeta`);
- (5.9): `Z(𝔎, s) = Z(𝔎', 1 - s)` with `𝔎𝔎' = [𝔡]`, i.e. against `(𝔞𝔡)⁻¹` (`dualUnit`), pointwise
  off `0`, `1` and as germs (`completedPartialZeta_one_sub`, `_eventuallyEq`), and the residue
  `2 a₀ = 2^r R / w` at `s = 1` (`tendsto_sub_one_mul_completedPartialZeta`), which summed over
  the `h` classes is `2^(r₁+r₂) h R / w`, the residue of `completedDedekindZeta` by the class number
  formula with `Γ_ℝ(1) = 1` and `Γ_ℂ(1) = 1/π`.

Then prove for `completedDedekindZeta K` and `dedekindZetaC K`:

- agreement with Mathlib's `dedekindZeta` on `Re s > 1`;
- meromorphic continuation to the plane;
- a unique simple pole of the uncompleted function at `s = 1`;
- simple poles of the completed function at `s = 0` and `s = 1`;
- analyticity everywhere else;
- the residues at both poles;
- `Λ_K(1-s) = Λ_K(s)` away from the poles and equality of meromorphic germs everywhere;
- uniqueness among continuations with the stated regularity;
- the card `dedekindZetaData`, of degree `[K:ℚ]`, conductor `|d_K|`, and root number one.

The exact downstream contracts include `analyticOnNhd_dedekindZetaC`,
`meromorphicOrderAt_dedekindZetaC_nonneg`, `tendsto_sub_one_mul_dedekindZetaC`,
`eq_of_meromorphic_of_eqOn_halfPlane`, the corresponding completed-zeta pole and regularity
theorems, and `tendsto_mul_completedDedekindZeta_zero`.

Prove uniqueness of meromorphic continuation in both the forms this roadmap uses:
`eq_of_meromorphic_of_eqOn_halfPlane`, which compares values off `{0, 1}`, and
`eventuallyEq_of_meromorphic_of_eqOn_halfPlane`, which turns agreement on a right half-plane into
equality of germs at every point of the plane, with `eq_of_eventuallyEq_of_analyticAt` reading a
value off a germ where both sides are analytic. Every global identity in Layers 4 to 6 is stated
through these two, and never as an unrestricted equality of total representatives.

Develop the value at zero and the leading term at zero, the analytic class number formula, and the
compatibility with Mathlib's real one-sided residue theorem. Special-value statements use named
continued functions, never the junk values of raw Dirichlet series outside convergence.

### Layer 4: Dirichlet L-functions and factorizations

Package Mathlib's continued primitive Dirichlet L-functions as `dirichletData`, proving the exact
conductor, parity-dependent real gamma shift, Gauss-sum root number, unit norm, continuation, and
functional equation. Preserve Mathlib's function rather than wrapping a second analytic function.

Prove factorization of Dedekind zeta for quadratic and cyclotomic fields at coefficient, convergent
series, and continued-function levels. In the cyclotomic factorization, distinguish primitive
characters from level characters. If level characters are used, the missing Euler factors occur
with the inverse correction forced by
`L(χ,s) = L(χ*,s) ∏(1-χ*(p)p^(-s))`.

⚠ At the continued-function level these are identities of meromorphic functions, not of total
representatives. Both sides have a simple pole at `s = 1` — the trivial character contributes
`riemannZeta` — and Mathlib's value there is junk, so each factorization is stated three times:
on `Re s > 1`, as an equality of germs at every point, and pointwise away from `s = 1`. The germ
statement is what uniqueness of meromorphic continuation produces from the first, and the
pointwise statement is read off it where both sides are analytic.

Mandatory examples:

- `ζ_{ℚ(i)}(s) = ζ(s)L(s,χ₋₄)` including the ramified prime `2`;
- the primitive character modulo `4` is odd and has gamma shift `1`;
- the quadratic character modulo `5` is even and has gamma shift `0`;
- the conductor-one principal character recovers the Riemann-zeta card.

### Layer 5: finite-order Hecke L-functions

For `χ : GlobalNumberFields.RayClassCharacter 𝔪`, derive an
`ArithmeticDirichletSeries.UnitaryIdealWeight` from `idealClass`, using value zero on the zero
ideal and at primes dividing the finite part. Pin both values as theorems: the weight of an ideal
prime to the modulus is the character of its ray class, read through the supplier's prime-to
carrier, and the weight vanishes elsewhere. Define the presented `heckeLFunctionC χ` and prove
its agreement with the shared norm-regrouped series and Euler product on `Re s > 1`.

**Primitive versus presented.** A ray-class character can be presented at every multiple of its
conductor, so a conductor stored beside a presentation modulus lets one character carry several
incompatible conductors, and with them several incompatible gamma factors, root numbers and local
factors. Introduce `PrimitiveRayClassCharacter`, carrying a conductor, a character of that
modulus, and its primitivity proof, and prove its universal property: every presentation is
induced from exactly one primitive character. That uniqueness is what makes `conductorOf` a
function of the character rather than of the modulus it was written at; the conductor of the
trivial character is the trivial modulus at every presentation. The completion, Gauss sum, root
number and analytic card all take this carrier, while `heckeLFunctionC` keeps taking a
presentation, because the presented series genuinely depends on it.

Prove the orthogonality reconstruction, which recovers each partial zeta function from the
character L-functions: `#Cl_𝔪 · ζ(s,c) = ∑_χ conj(χ(c)) L(s,χ)`. ⚠ Both sides run over the ideals
prime to the modulus, so no Euler correction appears in it; the correction appears only when the
principal-character term is rewritten as `ζ_K`.

Use `GlobalNumberFields.rayClassCharacter_partialSums` and Abel summation to continue a nontrivial
character through `Re s = 1`. The theta and Mellin presentation of a primitive character is the
finite-order case of the Grossencharacter kernel of Layer 6 — trivial angular frequencies, `Tr(p)`
the number of odd real places — and `completedHeckeLFunction` is that kernel's Mellin transform at
`(s + Tr p / n)/2` (`completedHeckeLFunction_eq_mellin`); `exists_mellin_completedHeckeLFunction`
is its existential shadow, kept because the zeros roadmap consumes it by name. Define the Gauss sum
`τ_𝔪(χ_f, y) = ∑_{x mod 𝔪₀} χ_f(x) e^(2πi Tr(xy))` (`gaussSum`, Neukirch VII (6.3)) as a finite
sum over the residue units of `𝓞/𝔪₀`, for `y ∈ 𝔪₀⁻¹𝔡⁻¹` — the domain on which `Tr(xy) mod ℤ`
depends only on `x mod 𝔪₀` — with `χ_f` the residue character `Grossencharacter.finiteCharacter`
of the finite-order presentation, which factors through `(𝓞/𝔪₀)ˣ` (`finiteCharacter_residue`) so
that any representatives may be used (`gaussSum_eq_sum`). Prove (6.4) with its hypotheses in the
types: for `y ∈ 𝔪₀⁻¹𝔡⁻¹` and a primitive character, `τ_𝔪(χ_f, a y) = conj(χ_f(a)) τ_𝔪(χ_f, y)`
(`gaussSum_mul`) — the reindexing `x ↦ x a⁻¹` produces the **inverse** value, Mathlib's
`gaussSum_mulShift_eq` convention, and the equation covers the vanishing case `(a, 𝔪₀) ≠ 1` because
`χ_f` already vanishes there — and `|τ_𝔪(χ_f, y)| = √N(𝔪₀)` when moreover the integral ideal
`y 𝔪₀ 𝔡` is prime to `𝔪₀` (`norm_gaussSum`). ⚠ Quadratic characters cannot see the conjugate: an
even primitive character of order `3` modulo `7` with `χ_f(3) = ω` has `τ(χ, 3/7) = ω⁻¹ τ(χ, 1/7)`.
⚠ Without the domain hypothesis the vanishing case is false: over `ℚ` with the even character mod
`5`, `a = 5` and `y = 1/25 ∉ (1/5)ℤ` would force `τ(χ, 1/5) = 0`, against `|τ(χ, 1/5)| = √5`. The
root number is pinned by the transformation law of the kernel (Layer 6), of which Neukirch's
`W(χ) = [i^(Tr p) N((md/|md|)^p)]⁻¹ τ(χ_f)/√N(𝔪)` (his `τ(χ_f)` being the Gauss sum of (7.4), in
ideal-number normalization) is the evaluation. Define the conductor, gamma factors, completion,
and root number.
Prove entirety for a nontrivial primitive character and the meromorphic two-pole statement for the
trivial primitive character.

Export the entirety and Mellin contracts as `differentiable_completedHeckeLFunction` and
`exists_mellin_completedHeckeLFunction`; zero-distribution consumers should use these named
theorems rather than recover them from the construction narrative.

The analytic card has absolute degree `[K:ℚ]`, computed from its `r₁` real and `r₂` complex gamma
factors. Keep this distinct from the relative degree one of a character of `K`; the two invariants
are not alternative values of one field.

The functional equation is

```text
Λ(χ,s) = W(χ) Λ(χ⁻¹,1-s),    |W(χ)| = 1.
```

For an induced character, identify the finite Euler factors removed from the primitive series:
`eulerCorrection χ 𝔫 s = ∏_{𝔭 ∣ 𝔫₀, 𝔭 ∤ 𝔪₀} (1 - χ([𝔭]) N𝔭^(-s))`, taking the character value
through the total ray-class weight so that no junk class is read at a bad prime. Only a primitive
character has a card at the displayed modulus. The trivial character at a nontrivial modulus is
the required regression: it is imprimitive, its presented series is `ζ_K` times removed Euler
factors — the correction of Layer 2, not a second notion — and it has no card with the
presentation modulus as conductor. As everywhere else, that comparison is stated on `Re s > 1` and
as germs, since both sides have a pole at `s = 1`.

### Layer 6: Grossencharacters

Consume `GlobalNumberFields.HeckeCharacter K`, its real shift, unitary part and archimedean
parameters `HeckeCharacter.infinityType`, and the idelic vocabulary that pins a character's finite
behaviour: `IdeleGroup`, `ideleFiniteCoord`, `ideleInfiniteCoord` and `IdeleCongruenceSubgroup`.
Define a `Grossencharacter K 𝔪` as a presentation, at the modulus `𝔪`, of an **algebraic** Hecke
character — Weil's type `A₀` — with the idele class character as its primary object. Every other
field is pinned to that object by an equation, so a presentation is determined by its Hecke
character (`Grossencharacter.ext`) and the L-function, conductor, root number and completions
describe one character:

- `unitaryWeight`, a `UnitaryIdealWeight`, is the ideal weight induced by the unitary part: at a
  prime `𝔭 ∤ 𝔪₀` it is the value of `toHeckeCharacter.unitaryPart` at the class of a prime idele
  at `𝔭` — an idele whose `𝔭`-coordinate is a uniformizer and whose every other finite and
  infinite coordinate is `1`, described through the supplier's coordinate maps — and it vanishes
  at the ideals not prime to `𝔪`. Complete multiplicativity fixes it everywhere else. ⚠ Quantify
  over the ideles with those coordinates; do not construct a prime idele here. Their classes
  differ by units at `𝔭`, on which a character presented at `𝔪` is trivial.
- `infinityType`, an `AlgebraicInfinityType`, is the archimedean restriction: it agrees with the
  supplier's `HeckeCharacter.infinityType` on the identity component, through the supplier's own
  `EqOnIdentityComponent` — exactly a witness of `IsAlgebraic` — and on the nose at the real
  places outside `𝔪`, where no sign twist is presented.
- `𝔪` is a modulus of definition: the character is trivial on the finite part of
  `IdeleCongruenceSubgroup 𝔪`, the ideles of that subgroup with all archimedean coordinates `1`.
  ⚠ Not on the whole subgroup, which contains the archimedean identity components and would force
  finite order.

The real shift is not a field: `Grossencharacter.shift` is the supplier's `HeckeCharacter.shift`
of the primary object. There is no finite-character field. A ray-class character of `𝔪` presents
the character exactly in the finite-order case, `exists_rayClassCharacter_of_isFiniteOrder`; then
the weight is the ray-class weight of Layer 5 (`unitaryWeight_eq_rayClassIdealWeight`), the
infinity type is zero (`infinityType_eq_zero_of_isFiniteOrder`) and the shift is zero
(`shift_eq_zero_of_isFiniteOrder`, closed by the supplier's `shift_ofRayClassCharacter`). ⚠ An
infinite-order character has no ray-class presentation at any modulus: the angular characters of
`ℚ(i)` below are unramified and nontrivial, and the only ray-class character of the trivial
modulus of `ℚ(i)` is trivial. Construct `ofRayClassCharacter` by its fields — the supplier's
`HeckeCharacter.ofRayClassCharacter`, `rayClassIdealWeight`, the zero infinity type — so that its
pins are definitional, and prove that its L-function is the ray-class L-function of Layer 5.

**The sign of the shift** is fixed by one equation at a prime idele, `toHeckeCharacter_primeIdele`:
`χ(π_𝔭) = χ_u(𝔭) N𝔭^shift`, the ideal-side `χ = χ_u N^shift` of `lFunctionC_eq` and
`completed_recenter`. ⚠ The supplier pins `shift` only through `shift_eq_zero_iff`; since
`‖π_𝔭‖ = N𝔭⁻¹`, this equation says `‖χ y‖ = ‖y‖^(-shift)` idelically — Tate's exponent is
`-shift` — and it is recorded in the dependency table as the one equation requested of the
supplier. The recentering, the inverse presentation (shift `-σ`) and the angular characters (shift
`0`) are all stated in this convention.

Hecke's unit relation is a theorem, not a field, and its sign is the one the primary object
forces: for `a ∈ 𝓞_K` with `a ≡ 1 mod* 𝔪` — the supplier's `IsCongrOne`, positivity at the real
places of `𝔪` included — the full weight `χ_u((a)) N(a)^shift` is the **inverse** of the
archimedean value `∏_τ τ(a)^(n_τ)`:

```text
χ_u((a)) · N(a)^shift · ∏_τ τ(a)^(n_τ) = 1        (compatibility).
```

It follows from triviality on the principal idele of `a`: its finite coordinates evaluate, by the
prime-idele equation and `eq_one_of_mem`, to `χ_u((a)) N(a)^shift`, its archimedean coordinates,
by `infinityType_eq` and `realParity_eq`, to `∏_τ τ(a)^(n_τ)`, and the product is `1`. This is
Neukirch VII (6.13): the archimedean component of the idele class character is `b ↦ b⁻¹` against
Hecke's `χ_∞`, so Hecke's classical infinity type is `-n` and his `χ((a)) = χ_f(a) χ_∞(a)` reads
`χ_u((a)) N(a)^shift = ∏_τ τ(a)^(-n_τ)` on `a ≡ 1 mod* 𝔪`. ⚠ The law with `∏_τ τ(a)^(n_τ)` on the
right is false for every nonreal angular character, already at shift zero: over `ℚ(i)`, for
`(α) ↦ (α/ᾱ)^(2k)` and `a = 2 + i`, the finite value is `((3+4i)/5)^(2k)` and the archimedean
value is `((3+4i)/5)^(-2k)`, unequal for `k ≠ 0` since `(3+4i)/5` is not a root of unity
(`angularGrossencharacter_compatibility_test`); a real-valued or finite-order example cannot see
the inversion, because for those the two laws coincide. ⚠ The relation holds only for
`a ≡ 1 mod* 𝔪`: for other `a` the two sides differ by the finite character of
`(𝓞/𝔪₀)ˣ × {±1}^𝔪∞` that the relation determines, and a relation quantified over all `a` leaves
only the unramified characters. Keep unitary and full weights separate: a law mixing a unitary
ideal factor with a nonunitary archimedean factor is false when the shift is nonzero.

**The theta kernel (Neukirch VII (6.1)–(6.4), (7.4)–(7.8), (8.2)–(8.5)).** Derive Hecke's finite
character from the primary object instead of storing it: `χ_f(a) := χ_u((a)) N(a)^shift · χ_∞(a)`
(`finiteCharacter`), where `χ_∞` is the **full archimedean value** `archimedeanValue` — the
algebraic `∏_τ τ(a)^(n_τ)` times, at each real place, the sign `sgn(τ_w a)^(ε_w - n_w)` by which
the actual parity of the archimedean restriction differs from the parity of the algebraic
exponent, trivial outside `𝔪∞` by `realParity_eq`. ⚠ The algebraic exponents alone miss the sign:
the odd character mod `4∞` of `ℚ` has exponent `0` and parity `1`, so its finite character must be
`-1` at `-1`, matching the harmonic polynomial `x^1` there; built without the sign it would be even,
the unit compensation would read `-1 = 1`, and the odd theta series would vanish by pairing `a`
with `-a` (`oddCharacter_mod_four_sign_test`, which also states the kernel as Riemann's odd theta
function `2 ∑ χ₄(n) n e^{-π y n²}`). The algebraic infinity-type convention is kept: finite-order
odd characters keep exponent `0`. So defined, `χ_f` is `1` on `a ≡ 1 mod* 𝔪` by the unit relation,
multiplicative, zero exactly off the elements prime to `𝔪₀`, and — because the signs are exactly
what `archimedeanValue` strips — a character of the residue units `(𝓞/𝔪₀)ˣ` alone
(`finiteCharacter_residue`), which is what the Gauss sum evaluates at arbitrary representatives.
This is Neukirch's `χ_f = χ((a)) χ_∞(a)⁻¹` of (6.1), whose modulus is a finite ideal and whose `χ_∞`
is the whole archimedean character, and it is the finite character of the unitary part; extend it
multiplicatively to the fractions prime to `𝔪₀` (`finiteCharacterK`, on the supplier's
`primeToSubgroup`). Read the harmonic polynomial `N(a^p)` off the infinity type of
the unitary part with the sign of the unit relation: `x^(ε_w)` at a real place, `ε_w` the parity
of the archimedean restriction, and at a complex place of angular frequency `k_w = n_τ - n_τ̄` the
monomial `conj(z)^(k_w)` for `k_w ≥ 0` and `z^(-k_w)` for `k_w < 0` (`harmonicFactor`), with
per-place degree `P_w` (`harmonicExponent`) and total degree `Tr(p)` (`harmonicDegree`). Prove
Hecke's lemma: the polynomial times the Gaussian is a Fourier eigenfunction up to `(-i)^(Tr p)`
and the weights `y_w^(-P_w)` (`mixedFourier_harmonicFactor_mul_archGaussian`). Define the twisted
theta series `θ_χ(𝔞, y) = ε(χ) + ∑_{a ∈ 𝔞} χ_f(a) N(a^p) e^{-π ∑ y_w |a_w|²}` over a fractional
ideal (`heckeTheta`) and prove (8.2): the archimedean weight `N(x^(p/2))` (`archWeight`) times the
theta series is invariant under the unit action, because `χ_f(u) N(u^p) = ∏_w |u_w|^(P_w)` on a
unit (`finiteCharacter_mul_harmonicFactor_unit`). Define the Mellin kernel (8.3) with its constants
made explicit (`heckeMellinKernel`): `(2^r₂/w) · 2^(-∑_{complex} P_w/2) · λ_𝔞^(-Tr p / 2n)
∫_D N(x^(p/2)) θ_χ(𝔞, x (u/λ_𝔞)^(1/n)) d*x` with `λ_𝔞 = V_𝔞² N(𝔣₀)`, which come from the gamma
integral of the weighted Gaussian at a complex place,
`2^(2s + P/2 - 1) Γ_ℂ(2s + P/2) |z|^(-4s - P)`, whose `|z|^(-P)` cancels the `|a_w|^(P_w)` of
`χ_f(a) N(a^p) = χ_u((a)) ∏_w |a_w|^(P_w)` — that
cancellation is why the gamma shifts of the card are `ε_w` and `|k_w|/2`. Prove the per-class
Mellin identity `Λ(𝔎, χ_u, s) = χ_u(𝔞)⁻¹ ∫ (f_D(χ, 𝔞, u) - ε(χ) a₀) u^((s + Tr p/n)/2) du/u`
(`unitaryPartialCompletion_eq_mellin`), sum it over a system of representatives prime to the
conductor into the total kernel `F_D(χ, ·)` (`heckeMellinTotal`, independent of the
representatives) with `Λ(χ_u, s) = ∫ (F_D(χ, u) - a₀(χ)) u^((s + Tr p/n)/2) du/u`
(`unitaryCompletion_eq_mellin`), and prove (8.4): `F_D(χ, 1/u) = W(χ) u^(1/2 + Tr p/n)
F_{D⁻¹}(χ⁻¹, u)` (`heckeMellinTotal_inv`), with exponential decay to the constant term. That law
is what pins `rootNumber`; the instance `grossencharacterFEPair` of the Mellin principle, of
weight `1/2 + Tr p/n` and `ε = W(χ)`, continues the unitary completion and proves its functional
equation, and the full completion follows by recentering.

⚠ The archimedean carrier is the integer-exponent `AlgebraicInfinityType`, not the carrier of a
general Hecke character: an arbitrary continuous idele-class character has complex archimedean
exponents, which is `ContinuousInfinityType`, and `normCharacter K t` for `t ≠ 0` is not
algebraic (`not_isAlgebraic_normCharacter`). The imaginary norm twists of Layer 7 act on the
weight, through `UnitaryIdealWeight.imaginaryNormTwist`, and are not Grossencharacters here; the
finite-order characters of Layer 5 have only `FiniteOrderInfinityType` signs.

Characterize the presented L-function: on `Re s > 1 + shift`, `lFunctionC χ` is the
norm-regrouped series of the presented unitary weight at `s - shift`, that is
`∑ χ_u(𝔞) N𝔞^(shift - s)` over the ideals prime to `𝔪`, with the supplier's Euler factors at
`s - shift`. Define the conductor by its universal property: a modulus `𝔫` presents the same
Hecke character exactly when the conductor divides `𝔫`, so the conductor, the primitive
presentation `Grossencharacter.primitive`, the completions and the root number are functions of
the Hecke character alone (`_congr`), while the presented series is the primitive series times
`∏_{𝔭 ∣ 𝔪₀, 𝔭 ∤ 𝔣₀} (1 - χ_u(𝔭) N𝔭^(shift - s))`, on the half-plane and as germs.

Construct the inverse presentation by its fields: the inverse Hecke character, the conjugate
unitary weight and the negated infinity type. If `χ = χ_u N^σ`, then `χ⁻¹ = conj(χ_u) N^(-σ)`,
of shift `-σ`; the functional equation reflects against the inverse, not simply the conjugate.
The full L-function converges for `Re s > 1+σ`.

Build the unitary completion first and define the full completion by recentering:

```text
Λ(χ,s) = Λ_unit(χ,s-σ).
```

Equivalently, with primitive conductor `A`, its conductor power is `A^((s-σ)/2)` and its gamma
factor is evaluated at `s-σ`. Prove the root-number involution, inverse and conjugate comparisons,
canonical primitive reduction, and the completed functional equation.

The analytic card `grossencharacterData` is the card of the **unitary part**, at the conductor,
and is pinned field by field: coefficients the norm-regrouped primitive unitary weight, conductor
`|d_K| N(𝔣₀)`, one real gamma shift per real place equal to the parity of the archimedean
restriction of the unitary part there — the supplier's `realParity`, ⚠ not the parity of the
algebraic exponent, which `N^m` with `m` odd distinguishes — one complex gamma shift
`|n_σ - n_σ̄|/2` per complex place, root number `rootNumber`, and completed function
`unitaryCompletion`; it is a function of the Hecke character alone and satisfies the three
Layer 0 predicates. ⚠ The full completion is not the completed function of an analytic card when the
shift is nonzero: its equation is centered at `1/2 + σ` and reflects against the inverse, whose
shift is `-σ`, not against the conjugate card. The integral norm powers `N^m` show the
consequence: `Λ(N^m, s) = Λ_K(s - m)` has poles at `m` and `1 + m`, so the completed functional
equation is stated pointwise only where the polar divisors of the two unitary cards vanish, read
at `s - σ`, with a germ statement covering every point.

Required regression examples:

- the norm power `N^m` over `ℚ` has one real gamma shift `-m` in its full completion and `0` in
  its unitary card;
- over `ℚ(i)` it has one complex gamma shift `-m` in its full completion, not `-2m`;
- the odd modulo-`4` and even modulo-`5` characters agree field-by-field with Layer 5;
- the principal character's canonical primitive card is `dedekindZetaData`, while its presented
  series retains the deleted Euler factors;
- at a real place the gamma shift is the parity of the unitary part, which for `N^m` with `m`
  odd is `0` while the algebraic exponent is odd;
- Hecke's angular characters of `ℚ(i)`, `𝔞 = (α) ↦ (α/|α|)^(4k) = (α/ᾱ)^(2k)`, are the
  infinite-order case. Their idelic archimedean component is the inverse, `z ↦ (z/|z|)^(-4k)`, so
  the algebraic infinity type has exponent `-2k` at the embedding through which the ideal value is
  read and `2k` at its conjugate (`angularGrossencharacter_unitaryWeight_span`); the two exponents
  **sum** to zero — the character is unitary and its shift vanishes — and **differ** by `4k`.
  Their card has no real gamma factor, one complex gamma factor shifted by `2|k|`, conductor `4`,
  degree two, and, for `k ≠ 0`, no pole. ⚠ The shift is `2|k|`, half the angular frequency: an
  interface that stores only a weight, or that adds the conjugate exponents, records `0` for every
  `k` and cannot tell these characters apart from the trivial one. This is the acceptance test
  that a finite character family cannot supply;
- the nonreal sign test: at `a = 2 + i` the finite value `((3+4i)/5)^(2k)` of the angular character
  is not real and is the inverse, not the equal, of the archimedean value
  (`angularGrossencharacter_compatibility_test`);
- the real sign test: for the odd character mod `4∞` at the unit `-1`, `χ_f(-1) = -1`, the harmonic
  polynomial is `-1`, their product is `1`, and the theta kernel over `ℤ` is Riemann's odd theta
  function (`oddCharacter_mod_four_sign_test`); a finite character built from the algebraic
  exponents alone fails it.

### Layer 7: intrinsic nonvanishing

Specialize `ArithmeticDirichletSeries.landau` to the finite-order Hecke family. Prove the
`3-4-1` nonnegative coefficient combination and use it to show that a nontrivial primitive
finite-order Hecke L-function has no zero on `Re s = 1`.

Retain the two reviewed hypothesis packages rather than hiding their assumptions in this
specialization. `CancellingFamily` is indexed by a finite commutative character group, is closed
under products and conjugation, and requires cancellation of every norm twist of each
**nontrivial** member. Its identity law applies only to good ideals, where good explicitly includes
`I ≠ ⊥`. `UnitaryCancelling` treats one possibly infinite-order unitary character: it excludes pure
norm twists and allows the square of each boundary twist either to be another norm twist or to
cancel. Requiring the square always to cancel incorrectly excludes quadratic characters; requiring
the trivial member's nonzero norm twists to cancel makes the finite-family package uninhabitable.

The square twist has three cases: nontrivial, trivial because the character has order two, and a
nonunitary norm twist. The trivial-square case contributes a zeta pole; it cannot be discarded by
an invalid cancellation. State the Grossencharacter boundary as `Re s = 1+shift` and reduce it to
the unitary statement by recentering.

Keep nonvanishing in meromorphic-order form at poles: `dedekindZetaC K` has order `-1` at `1` and
order `0` at `1+it` for `t ≠ 0`; a nontrivial family member has order `0` for every real `t`.
Construct the `UnitaryCancelling` premise for every Grossencharacter outside the pure-norm-twist
exception rather than taking that premise as an extra hypothesis.

Apply this to the angular characters of Layer 6: for `k ≠ 0` they are not norm twists, which is
the exception clause of the single-character package, so their L-functions have no zero on
`Re s = 1` unconditionally.

Export the boundary data that a prime-distribution argument takes from an L-function, and stop
there. For a unitary weight covered by `UnitaryCancelling`, the logarithmic derivative of the
named continuation extends continuously to `Re s ≥ 1` with no residue; for the trivial weight, the
same construction with residue `1` is the record `PrimeBoundaryRemainder K Set.univ 1` that
Arithmetic Dirichlet Series names as `primeIdealVonMangoldtBoundary` and on which its prime ideal
theorem is conditional. Both are theorems about a named continued L-function, which is why they
belong here.

⚠ Hecke's angular equidistribution of Gaussian primes is **not** proved here. It is a
prime-distribution theorem: beyond the two exports above it needs a Tauberian step and Fourier
analysis on the angular character group, neither of which is owned by this roadmap. What this
roadmap owes such an argument is the analytic input, and that input is named.

This layer proves no zero-free region, no zero counting, and no explicit formula. Those are
downstream uses of the named nonvanishing theorem and completed cards.

### Layer 8: interoperability and examples

Supply named comparison cards for Riemann zeta, Dedekind zeta, primitive Dirichlet characters,
primitive ray-class characters, and Grossencharacters, whose card is that of the unitary part.
Prove all comparisons with `EqOffZero`, so conductors, gamma factors, root numbers, completions,
polar divisors, and positive-index coefficients are checked together.

Add examples over `ℚ`, `ℚ(i)`, and a real quadratic field. Each example must exercise a convention
that is invisible in the easiest case: an odd real gamma factor, a complex-place multiplicity, a
nontrivial dual, or an imprimitive Euler factor.

Retain two number-field zeta specializations of the shared arithmetic-series infrastructure:

- on `Re s > 1`, the norm-regrouped ideal von Mangoldt series is exactly
  `-ζ'_K(s)/ζ_K(s)`, with the summability required by Tauberian consumers; export this as
  `dedekindZeta_logDeriv_eq`, together with the exact positivity input
  `dedekindZeta_idealVonMangoldt_nonneg` and the form
  `lSeries_primeVonMangoldtCoeff_univ` stated for the supplier's own coefficient carrier, which is
  the `F` field of `primeIdealVonMangoldtBoundary`;
- Mertens' product has constant `exp(γ) * κ_K`, where
  `κ_K = Res_(s=1) ζ_K(s)`. The generic sum/product transfer belongs to Arithmetic Dirichlet
  Series, but this residue specialization belongs here. The mandatory non-rational test is
  `K = ℚ(√-5)`, where `κ_K = π/√5`; omitting the residue passes the rational test and is false.

## Ordering and parallelism

Layer 0 can proceed with the completed-function record while Layer 1 fixes the mixed-space Fourier
conventions and specializes the supplier's Poisson theorem. Layer 2 consumes Global Number Fields
and the shared arithmetic-series substrate. Layers 3 and 4 then settle the zeta and Dirichlet
instances. Layers 5 and 6 build the Hecke instances; Layer 7 uses their continuation, and Layer 8
records exact interoperability cards and examples.

The roadmap-level dependency graph is exactly

```text
ArithmeticDirichletSeries ─┐
GlobalNumberFields ────────┼──> LFunctions ──> ZerosOfLFunctions
ThetaSeries ───────────────┘
```

Chebotarev also consumes the first two suppliers but is not a dependency of L-functions. The
`ThetaSeries` arrow is used by Layer 1 alone, and it does not reverse: that roadmap states no
number-field theta function and consumes nothing from here. Behind it, Theta Series imports no
roadmap (its lattices are the Tau Ceti library's), so `LFunctions → ThetaSeries` ends there and
is acyclic.

The boundary exports do not reverse an arrow. Arithmetic Dirichlet Series does not import this
roadmap: it states its prime ideal theorem conditionally on a record it names, and this roadmap
constructs that record. The arrow into `LFunctions` stays the only one between them.

## References

- E. Hecke, *Lectures on the Theory of Algebraic Numbers*.
- J. Neukirch, *Algebraic Number Theory*, Chapters VI and VII. Chapter VII is cited by number:
  (1.4) the Mellin principle; (3.6) the theta transformation; (5.3)–(5.9) the unit quotient, the
  fundamental domain and its volume, the Mellin kernel, its transformation law and the functional
  equation of the partial zeta functions; (6.1)–(6.4) Größencharaktere, the finite character and
  the Gauss sum; (6.13)–(6.14) the correspondence with idele class characters and the sign of the
  archimedean component; (7.4)–(7.8) the theta series with a harmonic polynomial and its
  transformation; (8.2)–(8.6) the Hecke L-series as a Mellin transform, its transformation law,
  root number and functional equation.
- H. Iwaniec and E. Kowalski, *Analytic Number Theory*, Chapters 3 and 5.
- D. Loeffler and M. Stoll, *Formalizing zeta and L-functions in Lean*.
