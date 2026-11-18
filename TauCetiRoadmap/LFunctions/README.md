# Roadmap: L-functions — completions and functional equations

This roadmap develops the analytic theory of the principal L-functions attached to number
fields. It starts with a normalization-conscious record for completed L-functions, specializes
lattice Poisson summation to the mixed embedding and proves the theta identities used in Hecke's
method, constructs the continued Dedekind zeta and Hecke L-functions, and packages conductors,
root numbers, and the L-functions of algebraic Hecke characters (Weil's type `A₀`).

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
[`Suggested.lean`](Suggested.lean) states the headline theorems against the pinned libraries; it is
not the roadmap.

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
  constant term, the extension of Mathlib's Mellin principle `WeakFEPair` to a level, and the
  single theorem that fixes the additive character, the self-dual measure, the Fourier sign, the
  discriminant factor and both archimedean factors at once;
- partial zeta functions and the continuation, residue, and functional equation of Dedekind zeta;
- special values and exact quadratic and cyclotomic factorizations;
- Dirichlet L-function cards extending Mathlib's continued functions;
- finite-order ray-class Hecke L-functions and the L-functions of algebraic Hecke characters
  (Weil's type `A₀`, the Grossencharacters with integral infinity type);
- the bundled primitive-character carrier over the supplier's conductor, the conductor of an
  algebraic Hecke character presentation, Gauss sums, root numbers, continuations, and functional
  equations;
- character-specific nonvanishing on `Re s = 1`, as an intrinsic theorem about the named
  continued L-function, and the boundary data that a prime-distribution consumer needs from it;
- Mertens' product over a number field, whose constant is the residue of `ζ_K` at `s = 1`.

### Consumed, not redefined

From `ArithmeticDirichletSeries`:

```text
UnitaryIdealWeight
normCoeff
regroupByNorm
EulerProductData
landau
idealSummatory_mul_eq_sub_integral_mul
primeVonMangoldtCoeff
PrimeBoundaryRemainder
```

This roadmap specializes these declarations to zeta and Hecke coefficients. It does not
define another ideal weight, another norm-regrouped series, or another generic Euler product.
Through the same supplier it reaches the Dedekind-zeta boundary package that Tau Ceti already
provides, and consumes it instead of rebuilding it:

```text
TauCeti.LFunctions.primeIdealVonMangoldtBoundary
TauCeti.LFunctions.primeIdealVonMangoldtBoundary_series
TauCeti.LSeries_primeVonMangoldtCoeff_univ_eq_deriv_dedekindZeta_div
TauCeti.hasSum_idealTerm_vonMangoldt
TauCeti.IdealArithmeticFunction.vonMangoldt_re_nonneg
TauCeti.IdealArithmeticFunction.vonMangoldt_im
```

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
RayClassCharacter.conductor
RayClassCharacter.primitiveCharacter
RayClassCharacter.conductor_dvd_iff
RayClassCharacter.induced_primitiveCharacter
RayClassCharacter.isPrimitive_iff_conductor_eq
RayClassCharacter.isPrimitive_primitiveCharacter
RayClassCharacter.conductor_one
RayClassCharacter.conductor_inv
ratModulus
ratFiniteModulus
ratDirichletEquiv
```

and, for Hecke characters, infinity types and ideles:

```text
HeckeCharacter
HeckeCharacter.ofRayClassCharacter
HeckeCharacter.shift
HeckeCharacter.unitaryPart
HeckeCharacter.infinityType
HeckeCharacter.IsFiniteOrder
HeckeCharacter.isFiniteOrder_iff_exists_rayClassCharacter
HeckeCharacter.shift_ofRayClassCharacter
HeckeCharacter.conductor
HeckeCharacter.finiteConductor
HeckeCharacter.finiteComponent
HeckeCharacter.idealCharacter
HeckeCharacter.toUnitaryIdealWeightAt
ContinuousInfinityType
ContinuousInfinityType.AgreesOnIdentityComponent
AlgebraicInfinityType
FiniteOrderInfinityType
IdeleGroup
IdeleCongruenceSubgroup
ideleInfiniteCoord
ideleNorm
narrowModulus
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
product space. Layer 1 here specializes them to the mixed embedding of a fractional ideal. It
states no second Poisson theorem, no second dual-lattice notion, and no theta series on the upper
half plane. Theta Series is not part of the pinned libraries, so `Suggested.lean` cannot import
it. It states the specialization `poissonSummation_idealLattice` directly, and takes the dual
lattice as Mathlib's `LinearMap.BilinForm.dualSubmodule` of `mixedInnerBilin`, which is the
supplier's `dual` read in Mathlib's Euclidean model of the mixed space.

Moduli, ray classes, ray-class characters and their unitary weights, ideles, infinity types and
Hecke characters are formalized in Tau Ceti at the pin, in the namespace
`TauCeti.GlobalNumberFields` (modules `TauCeti.NumberTheory.NumberField.Global.*`), and
`Suggested.lean` uses those declarations. They differ from the names above in two places: the
congruence subgroup is `ideleCongruenceSubgroup`, and the idele group is Mathlib's
`NumberField.IdeleGroup (𝓞 K) K`. An algebraic infinity type is a function
`(K →+* ℂ) → ℤ`, read through `AlgebraicInfinityType.toContinuous`, and the angular frequency at a
complex place is `complexAngularFrequency`. The ray-class weight `rayClassIdealWeight` is Tau
Ceti's `RayClassCharacter.toUnitaryIdealWeight`.

From Mathlib, the Mellin principle: `WeakFEPair` and `IsStrongFEPair` in
`Mathlib/NumberTheory/LSeries/AbstractFuncEq.lean`, with `WeakFEPair.Λ`, `hasMellin`,
`functional_equation`, `Λ_residue_zero`, `Λ_residue_k` and `differentiableAt_Λ`, and `mellin` with
`mellin_comp_mul_right` from `Mathlib/Analysis/MellinTransform.lean`. They are consumed through the
level transport of Layer 1; no second Mellin theory is developed.

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
  transfer, `Chebotarev` the Frobenius counting). Mertens' product of Layer 8 consumes the prime
  ideal theorem only for the Chebyshev bound `ψ_K(x) = O(x)`;
- zero distributions, zero-free regions, zero counting, the explicit formula, and effective
  estimates (`ZerosOfLFunctions`);
- local epsilon factors and the adelic proof of the functional equation (Tate's thesis);
- Artin representations, their local reciprocal polynomials and conductors, Artin L-functions,
  Brauer induction, or Artin formalism (a future `ArtinRepresentations` roadmap);
- Artin reciprocity and class fields (`ClassFieldTheory`);
- the L-functions of Hecke characters that are not algebraic — an infinity type with a real
  frequency `|x_w|^(i q_w)`, such as Hecke's unitary characters `|x₁|^(iλ) |x₂|^(-iλ)` of a real
  quadratic field, `λ ∈ (π / log ε) ℤ` — whose theta kernel carries the weights `|x_w|^(i q_w)`
  and whose gamma shifts become `ε_w + i q_w` and `|k_w|/2 + i q_w` (Neukirch VII (8.5) at the
  supplier's `ContinuousInfinityType`): LFunctions, Part II, which starts from Layer 6 here. The
  base roadmap stops at integral infinity types; the imaginary norm twists `N^(it)` of an
  algebraic character enter Layer 7 through the weight, not as Grossencharacters.

The absence of zero-distribution targets is intentional. A theorem that one named character
L-function is nonzero on `Re s = 1` belongs here because it is part of that function's basic
analytic theory. Uniform zero-free regions, zero counting, and consequences extracted from zeros
belong downstream.

## Exact supplier contracts

### Arithmetic Dirichlet Series

| Declaration | Use here |
| --- | --- |
| `ArithmeticDirichletSeries.UnitaryIdealWeight` | coefficient systems of ray-class and Grossencharacter presentations. ⚠ The supplier has `MultiplicativeIdealWeight` and its unitary refinement, and no `IdealWeight`; everything used here — `HasCancellation`, pointwise products, `IsNormTwistOnGood`, `continuedLFunctionOfWeight` — is stated for the unitary one (or, for `IsNormTwistOnGood`, for its underlying multiplicative weight) |
| `ArithmeticDirichletSeries.normCoeff` | conversion of an ideal-indexed L-function into Mathlib's `LSeries` coefficients |
| `ArithmeticDirichletSeries.regroupByNorm` | equality between the ideal sum and the norm-indexed series |
| `ArithmeticDirichletSeries.EulerProductData` | local Euler factors and the global Euler-product theorem |
| `ArithmeticDirichletSeries.landau` | positivity input in the character-specific nonvanishing argument: the `3-4-1` bound and, in the exceptional quadratic case, Landau's argument on `ζ_K L(χ)` |
| `TauCeti.idealSummatory_mul_eq_sub_integral_mul` (`TauCeti/NumberTheory/ArithmeticDirichletSeries/AbelSummation.lean`), the ideal form of Mathlib's `sum_mul_eq_sub_sub_integral_mul` | Abel summation: continuation of a nontrivial ray-class series from its arithmetic partial sums to `Re s > 1 - 1/[K:ℚ]`, and the partial summations in the proof of Mertens' product |
| `TauCeti.isBigO_card_idealsLE_sub` (`TauCeti/NumberTheory/NumberField/DedekindZeta.lean`) | the ideal count with a power saving, `#{𝔞 ≠ 0 : N𝔞 ≤ x} = κ_K x + O(x^(1 - 1/[K:ℚ]))`, `κ_K` Mathlib's `dedekindZeta_residue`: the input of Mertens' first theorem for `K` |
| `TauCeti.primeIdealTheorem` (`TauCeti/NumberTheory/ArithmeticDirichletSeries/Prime/PrimeIdealTheorem.lean`) | `ψ_K(x) ~ x`, used only through its consequence `ψ_K(x) = O(x)` in Mertens' first theorem for `K` |
| `ArithmeticDirichletSeries.primeVonMangoldtCoeff` and `PrimeBoundaryRemainder` | the carrier and the record shape of Tau Ceti's `TauCeti.LFunctions.primeIdealVonMangoldtBoundary`, the boundary datum on which the supplier's prime ideal theorem is conditional; this roadmap compares its series with the named continuation (`primeIdealVonMangoldtBoundary_series_eq`) |

The density predicates, the Perron kernel, Wiener--Ikehara itself and the `ψ → ϑ → π` transfer
have no consumer here, and this roadmap draws none of their arithmetic conclusions beyond the
Chebyshev bound that Mertens' product takes from `TauCeti.primeIdealTheorem`. The supplier's
`primeIdealTheorem_of_boundary` is conditional on the boundary record
`primeIdealVonMangoldtBoundary`, which Tau Ceti already provides at this pin: it is built from
Mathlib's `dedekindZeta` and Tau Ceti's continuous extension of `-ζ_K'/ζ_K - 1/(s - 1)` to
`Re s ≥ 1` (`exists_continuousOn_eq_neg_deriv_dedekindZeta_div_sub`). This roadmap consumes that
package and proves only the comparison of its series with the named continuation `dedekindZetaC`
on `Re s > 1`. What remains new here is the full-plane continuation of `ζ_K` and of the Hecke
L-functions, and the twisted boundary datum `Grossencharacter.exists_continuousOn_logDeriv`.

### Global Number Fields

| Declaration | Use here |
| --- | --- |
| `GlobalNumberFields.Modulus`, `Modulus.support` and `Modulus.IsCoprimeTo` | finite and infinite conductor data, the domain of ray-class coefficients, and the primes whose Euler factors a ray-class series deletes |
| `Modulus.mem_support_iff` and `Modulus.support_one` | the characterization `v ∈ 𝔪.support ↔ v.asIdeal ∣ 𝔪.finitePart`, which reads `finiteEulerCorrection`'s product over `𝔪.support` as the product over the primes dividing `𝔪₀`, and its trivial-modulus case, in which the correction is the empty product `1` |
| `GlobalNumberFields.integralIdealsPrimeTo` and `idealClass` | the ray class of an ideal, on the carrier that already contains the coprimality proof. ⚠ There is no total `idealClass` on `Ideal (𝓞 K)`: the class indicator and the ray-class weight are defined through this carrier, never through a junk class at a bad ideal |
| `GlobalNumberFields.RayClassCharacter` | finite-order Hecke L-functions |
| `RayClassCharacter.induced` and `.IsPrimitive` | the imprimitive Euler-factor correction, and the primitivity proof that `PrimitiveRayClassCharacter` bundles |
| `RayClassCharacter.conductor`, `.primitiveCharacter`, `.conductor_dvd_iff`, `.induced_primitiveCharacter`, `.isPrimitive_iff_conductor_eq`, `.isPrimitive_primitiveCharacter`, `.conductor_one`, `.conductor_inv` (`TauCeti/NumberTheory/NumberField/Global/RayClass/Character/Conductor.lean`) | the conductor of a ray-class character and its universal property — `𝔫 ∣ 𝔪` admits a presentation of `χ` exactly when the conductor divides `𝔫`, and `χ` is induced from its primitive character — are the supplier's. `PrimitiveRayClassCharacter.of χ` bundles `χ.conductor`, `χ.primitiveCharacter` and `isPrimitive_primitiveCharacter`; `PrimitiveRayClassCharacter.inv` is primitive by `conductor_inv`; the conductor of the trivial character is `Modulus.one` at every presentation by `conductor_one`. Nothing about the ray-class conductor is planned here |
| `ratModulus`, `ratFiniteModulus` (`RayClass/Rat.lean`) and `ratDirichletEquiv`, `ratDirichletEquiv_absNorm`, the ray-class conductor lemmas `conductor_finitePart_eq_span` and `conductor_infinitePart_eq_empty_iff_even` (`RayClass/Character/Dirichlet.lean`) | the moduli `(n)·∞` and `(n)` of `ℚ`, the identification of ray-class characters of `(n)·∞` with Dirichlet characters mod `n` (value at a prime-to-`n` ideal is the Dirichlet character at its norm), and their conductors, the real place included exactly for an odd character. The odd character mod `4∞` is `(ratDirichletEquiv 4 _).symm χ₄`, and the even character mod `5` lives on `ratFiniteModulus 5` |
| `HeckeCharacter.conductor` (`HeckeCharacter/Conductor.lean`, finite-order characters), `HeckeCharacter.finiteConductor` with `pow_dvd_finiteConductor_iff` and `finitePart_conductor` (`HeckeCharacter/FiniteComponent.lean`) | the finite part of `Grossencharacter.primitiveConductor` is the supplier's `finiteConductor` of the primary object, `∏_v v^(a_v)` with `a_v` the least `n` for which the local component is trivial on the `n`-th unit group; for a finite-order character it is the finite part of the supplier's `conductor`. Only the infinite part, the presentation condition at the real places, is this roadmap's (see the conductor convention) |
| `HeckeCharacter.finiteComponent` (`HeckeCharacter/FiniteComponent.lean`) and `HeckeCharacter.idealCharacter`, `idealCharacter_apply_prime`, `idealCharacter_apply_toPrincipalIdeal`, `idealCharacter_apply_toPrincipalIdeal_eq_embeddingCharacter_inv` (`HeckeCharacter/Ideal.lean`) | the local component of a Hecke character at a finite place and its ideal character on the fractional ideals prime to the finite conductor. `unitaryWeight` is pinned to `unitaryPart.finiteComponent` at a uniformizer, which is `unitaryPart.idealCharacter` at the prime by `idealCharacter_apply_prime`; `toHeckeCharacter_primeIdele` is the same evaluation for the primary object; and the unit relation `compatibility` is the supplier's `idealCharacter_apply_toPrincipalIdeal` — on `(x)` with `x ≡ 1` modulo the finite conductor, the ideal character is the inverse of the product of the infinite components — with the same inverse sign, read through `infinityType_eq` |
| `HeckeCharacter.toUnitaryIdealWeightAt` and `toUnitaryIdealWeightAt_ofRayClassCharacter` (`HeckeCharacter/Weight.lean`) | the unitary ideal weight of a finite-order Hecke character at a modulus through which it factors; `unitaryWeight_eq_rayClassIdealWeight` is this identification read on a presentation |
| `GlobalNumberFields.rayClassCharacter_partialSums` | continuation of nontrivial ray-class L-functions to a strip containing `Re s = 1` |
| `GlobalNumberFields.rayClassIdealMainTerm` and `rayClassIdealMainTerm_eq` | the common residue of the partial zeta functions. The supplier owns its closed form — the Dedekind-zeta residue times the Euler factors at the primes dividing the finite modulus, divided by the ray class number — and this roadmap proves that the analytic residue is that same constant, rather than introducing a second one |
| `GlobalNumberFields.HeckeCharacter` | the primary object of a `Grossencharacter` presentation: every other field is an equation in it, and a presentation is determined by it (`Grossencharacter.ext`) |
| `HeckeCharacter.ofRayClassCharacter`, `.IsFiniteOrder`, `.isFiniteOrder_iff_exists_rayClassCharacter` and `.shift_ofRayClassCharacter` | the finite-order case: `Grossencharacter.ofRayClassCharacter` is built from the first by its fields, `exists_rayClassCharacter_of_isFiniteOrder` is the finite presentation at the stated modulus, and `idealShift_eq_zero_of_isFiniteOrder` is closed by the last two |
| `HeckeCharacter.shift` and `.unitaryPart` | the ideal-side shift `Grossencharacter.idealShift` is the **negative** of the former on the primary object; the latter is what `unitaryWeight` is pinned to at the prime ideles, and the full completion recenters the unitary completion at `s - idealShift`. The supplier fixes the sign idelically, `|χ| = ‖·‖^shift`, in the Global Number Fields README's convention table, and Tau Ceti implements it as `HeckeCharacter.norm_apply_eq_rpow_shift`. Since `‖π_𝔭‖ = N𝔭⁻¹`, the ideal-side convention `χ(π_𝔭) = χ_u(𝔭) N𝔭^idealShift` of `toHeckeCharacter_primeIdele` needs `idealShift = -shift`: the idele class character `‖·‖^(-m)` has shift `-m` and ideal values `N𝔞^m` (`ratNormPow_shift`, `ratNormPow_idealShift`) |
| `HeckeCharacter.infinityType`, `ContinuousInfinityType` and `ContinuousInfinityType.AgreesOnIdentityComponent` | the archimedean restriction of the primary object and the supplier's identity-component comparison, by which `Grossencharacter.infinityType` is pinned to it; `realParity` is compared on the nose outside the modulus and supplies the real gamma shifts. ⚠ This is the *idelic* infinity type: Hecke's classical infinity type, the one in `χ((a)) = χ_f(a) χ_∞(a)`, is its negative (Neukirch VII (6.13)), which is the sign in the unit relation `compatibility` and in the harmonic polynomial of the theta kernel |
| `primeToSubgroup` | the fractions prime to the finite modulus, Neukirch's `K^(𝔪)`: the domain on which the derived finite character `Grossencharacter.finiteCharacter` extends multiplicatively (`finiteCharacterK`), which is what the twisted theta series of a fractional ideal evaluates |
| `ideleNorm` and `narrowModulus` | the idele norm in which the supplier's shift is defined (`HeckeCharacter.norm_apply_eq_rpow_shift`), and the modulus `∞` at which the norm powers of `ℚ` are presented (`ratNormPow`) |
| `IdeleGroup` and `ideleInfiniteCoord` | the ideles of the congruence subgroup with all archimedean coordinates `1`, on which the modulus condition `eq_one_of_mem` of a presentation is stated. The value at a prime idele is read through the supplier's `HeckeCharacter.finiteComponent` at a uniformizer, so no prime idele is constructed here |
| `IdeleCongruenceSubgroup` | the modulus condition of a presentation: triviality on the finite part of the subgroup, the ideles in it with all archimedean coordinates `1`. ⚠ Triviality on the whole subgroup, which contains the archimedean identity components, is the finite-order condition |
| `IsCongrOne` | the multiplicative congruence `a ≡ 1 mod* 𝔪`, positivity at the real places of `𝔪` included, on which Hecke's unit relation holds |
| `GlobalNumberFields.AlgebraicInfinityType` | algebraic infinity types and their gamma shifts. ⚠ This is the integer-exponent carrier, the one Grossencharacter data uses; the general `ContinuousInfinityType` of an arbitrary Hecke character has complex archimedean exponents, and the finite-order characters of Layer 5 have only `FiniteOrderInfinityType` signs |

`rayClassIdealCount` is arithmetic input to Chebotarev, not to this roadmap. Its omission from the
table is a boundary check.

### Theta Series

| Declaration | Use here |
| --- | --- |
| `ThetaSeries.poissonSummation` | `∑' ℓ : L, f (v + ℓ) = (covolume L volume)⁻¹ * ∑' m : L^∨, 𝓕 f m * exp (2 π i ⟪v, m⟫)` for `f : 𝓢(E, ℂ)` and `v : E`, over a finite-dimensional real inner product space `E` with its Borel structure and `L : Submodule ℤ E` with `[DiscreteTopology L] [IsZLattice ℝ L]`; the sign is that of Mathlib's `𝓕`. `poissonSummation_idealLattice` is its instance at the Euclidean model of `σ(I)` and `v = 0`. ⚠ `mixedSpace K` is not an inner product space: the theorem is applied in Mathlib's `NumberField.mixedEmbedding.euclidean.mixedSpace`, which is, and transported back along `euclidean.toMixed` by `mixedInner_toMixed` (the inner product goes to `mixedInner`), `mixedFourier_toMixed` (`𝓕` goes to `mixedFourier`, by Mathlib's `euclidean.volumePreserving_toMixed`) and Mathlib's `ZLattice.covolume_comap` |
| `ThetaSeries.summable_poisson_left` and `summable_poisson_right` | absolute summability of the two sides on their own, `Summable fun ℓ : L ↦ f (v + ℓ)` and `Summable fun m : L^∨ ↦ 𝓕 f m * exp (2 π i ⟪v, m⟫)`, rather than only inside the Poisson equality; the Mellin transform of a theta series is computed by exchanging the sum with the integral, which the equality alone does not license |
| `ThetaSeries.dual` and `ThetaSeries.dual_dual` | `dual L` is Mathlib's `BilinForm.dualSubmodule (innerₗ E) L`, written `L^∨`, and `ThetaSeries.dual_dual : (L^∨)^∨ = L`. `dualIdealLattice` is the same dual submodule taken for `mixedInnerBilin`, the inner product of the Euclidean model read on the mixed space, so it is the supplier's `dual` transported; `mem_dualIdealLattice_iff` is its elementwise description, the form `analyticDual_mixedEmbedding` compares with the trace dual, `dualSubmodule_dualIdealLattice` is `ThetaSeries.dual_dual` at the ideal lattice, and `discreteTopology_mixedDual` and `isZLattice_mixedDual` say that the Euclidean dual `mixedDual` of a full-rank lattice is again one |
| `ThetaSeries.covolume_dual` | `covolume (L^∨) volume = (covolume L volume)⁻¹`; `covolume_dualIdealLattice` is its instance at the ideal lattice, read through Mathlib's `ZLattice.covolume_comap` on both sides of the change of model, so Mathlib's covolume of the ideal lattice gives the covolume of its dual without a second determinant computation |
| `ThetaSeries.gaussian` and `gaussian_apply` | `gaussian (τ : ℍ) : 𝓢(E, ℂ)` with `gaussian τ x = exp (π i ‖x‖² τ)`. `mixedGaussian K t` is `gaussian (t i)` read in the mixed space through `mixedInner_toMixed`, and being Schwartz, the hypothesis Poisson summation takes, is part of the supplier's type rather than a separate lemma |
| `ThetaSeries.fourier_gaussian` | `𝓕 (gaussian τ) y = (τ / i) ^ (-(finrank ℝ E) / 2) * exp (π i ‖y‖² (-1/τ))`, with `Complex.cpow`. At `τ = t i` it is the self-duality with factor `t ^ (-[K:ℚ]/2)` by Mathlib's `euclidean.finrank`, which through the two transports is the first conjunct of `gaussianTheta_mellin_normalization` |

The rest of that roadmap has no consumer here. The theta series on the upper half plane, the coset
theta series, the `T`- and `S`-transformation laws, the Gauss sums and the two modularity theorems
are its own; Hecke's method needs the Gaussian only on the imaginary axis, and this roadmap takes
its Mellin transform there. Theta Series in turn consumes the integral quadratic forms and lattices
roadmap (`IntegralLattices`, on main) for its rank-16 lattices; that roadmap states that no
analytic input reaches it and consumes nothing from here, so the path through `ThetaSeries` ends
on main and closes no cycle. This roadmap uses none of the Integral Lattices material itself.

## Conventions

The number-field context is `[Field K] [NumberField K]`. Finite-order Hecke theory is over a
modulus `𝔪 : GlobalNumberFields.Modulus K`; the general carrier is
`GlobalNumberFields.HeckeCharacter K`.

| Subject | Convention |
| --- | --- |
| normalization | Analytic normalization reflects `s ↦ 1-s`; arithmetic weight `w` reflects `s ↦ w+1-s`. |
| completion | The conductor factor `N^(s/2)` is part of `completed`, so the functional equation has no extra conductor constant. |
| degree | `#gammaR + 2 #gammaC`; it is not inferred from coefficients or from `HasDirichletAgreement`. |
| dual | conjugate coefficients and gamma shifts, conjugate root number, reflected completed function, and conjugated polar divisor. |
| continuation | every continued L-function is `meromorphicContinuation σ f`: the function in Mathlib's meromorphic normal form on all of `ℂ` (`MeromorphicNFOn`: equal to its limit at a removable point and `0` at a pole) that agrees with the Dirichlet series `f` on `Re s > σ`, and `0` if there is none. Two such functions that agree on an open half-plane agree everywhere, so the continuation is one function; the continuation theorem of each L-function says that the first case occurs. |
| poles | `polarOrder p = n` records an exact pole of order `n`; value equalities are asserted only off poles, while germ equalities cover poles. |
| global identities | every identity between two continued functions — a factorization, a functional equation, an imprimitive comparison — is stated on a right half-plane, promoted by uniqueness of meromorphic continuation to an equality of germs at every point, and stated pointwise only away from the polar loci. An unrestricted equality of total representatives is never asserted: Mathlib's value at a pole is junk, and `1/(1-s)` at `s = 1` is `0`. |
| ray-class coefficients | every ray-class coefficient carries coprimality to the finite modulus, so every such series is missing the Euler factors at the primes dividing it. `finiteEulerCorrection 𝔪 s = ∏_{𝔭 ∣ 𝔪₀} (1 - N𝔭^(-s))` is the single name for those factors — a product over `𝔪.support`, equal to the divisor-indexed product by the supplier's `Modulus.mem_support_iff` — and it is `1` only for a trivial finite part. |
| primitive scope | a primitive conductor, root number, completion, Gauss sum, or card takes `PrimitiveRayClassCharacter`, which carries the conductor and the primitivity proof together. A presentation level is never stored as an arithmetic conductor, and a character never carries two conductors. |
| imprimitive series | retain the presented L-series and a finite Euler-factor correction to the canonical primitive series; do not manufacture a second completed card. |
| Grossencharacter presentation | the idele class character is the primary object; the weight, the infinity type and the modulus condition are equations in it, so a presentation is determined by its Hecke character. The analytic card is the unitary part's. |
| Hecke shift | "the shift" means the ideal-side `idealShift`, with `χ = χ_u N^shift` on ideals — at a prime idele `χ(π_𝔭) = χ_u(𝔭) N𝔭^shift` (`toHeckeCharacter_primeIdele`) — and the full completion is defined by recentering the unitary completion at `s-shift`. It is the **negative** of the supplier's `HeckeCharacter.shift`, which is fixed idelically by `‖χ y‖ = ‖y‖^(HeckeCharacter.shift)` (Tau Ceti's `HeckeCharacter.norm_apply_eq_rpow_shift`): `N^m` is the idele class character `‖·‖^(-m)`, of supplier shift `-m` and ideal-side shift `m`. |
| archimedean sign | `infinityType` is the idelic archimedean exponent `n`; the finite value on a principal ideal `(a)`, `a ≡ 1 mod* 𝔪`, is the **inverse** of the archimedean value: `χ_u((a)) N(a)^shift · ∏_τ τ(a)^(n_τ) = 1` (`compatibility`, Neukirch VII (6.13)). Hecke's classical infinity type is `-n`; the harmonic polynomial of the theta kernel puts the conjugate coordinate at a complex place of positive angular frequency. The nonreal witness is the Layer 6 Check at `a = 2 + i` over `ℚ(i)`. |
| Mellin transform | Mathlib's `mellin f s = ∫_0^∞ t^(s-1) f(t) dt`, so Neukirch's (1.4) `L(f, s) = ∫ (f(t) - f(∞)) t^s dt/t` is `mellin (f - f(∞)) s`. The Mellin principle is Mathlib's `WeakFEPair`, reached from the carrier `FEPairWithLevel` by the level transport of Layer 1. The completed partial zeta function at `s` is the Mellin transform of its kernel minus its constant term at `s/2` (5.5); the unitary completion of a Grossencharacter at `s` is the transform of its kernel at `(s + Tr p / n)/2` (8.3). No kernel is left to an existential. |
| root-number duality | `W(χ⁻¹) = W(χ)⁻¹`; for a unitary character this is also `conj W(χ)`. |
| conductor of a presentation | `Grossencharacter.primitiveConductor` has finite part the supplier's `HeckeCharacter.finiteConductor` of the primary object, and infinite part the real places at which the parity `realParity` of the archimedean restriction differs from the parity of the algebraic exponent: exactly the real places every presentation must contain (`realParity_eq`). ⚠ At a real place this is the presentation conductor, not the ramification conductor: `N^m = ‖·‖^(-m)` over `ℚ` with `m` odd is unramified at `∞` (its archimedean component `|x|^(-m)` is trivial on `±1`), yet `∞` divides its conductor here because its algebraic exponent is odd. For a finite-order character the algebraic exponent is `0`, the two notions agree, and the conductor is the supplier's `RayClassCharacter.conductor`. Everything that depends on ramification alone — the theta constant `heckeEpsilon`, the scale `heckeScale` and the conductor `|d_K| N(𝔣₀)` of the card — reads `toHeckeCharacter.finiteConductor`. |

## How to read the build

Layer 0 can proceed with the completed-function record while Layer 1 fixes the mixed-space Fourier
conventions and specializes the supplier's Poisson theorem. Layer 2 consumes Global Number Fields
and the shared arithmetic-series substrate. Layers 3 and 4 then settle the zeta and Dirichlet
instances. Layers 5 and 6 build the Hecke instances; Layer 7 uses their continuation, and Layer 8
records exact interoperability cards and examples.

The direct roadmap-level dependencies are

```text
ArithmeticDirichletSeries ─┐
GlobalNumberFields ────────┼──> LFunctions ──> ZerosOfLFunctions
ThetaSeries ───────────────┘
```

Chebotarev also consumes the first two suppliers but is not a dependency of L-functions. The
`ThetaSeries` arrow is used by Layer 1 alone, and it does not reverse: that roadmap states no
number-field theta function and consumes nothing from here. Behind it, Theta Series consumes
Integral Lattices, which is on main and consumes nothing from here either, so the arrow is
acyclic.

The boundary exports do not reverse an arrow. Arithmetic Dirichlet Series does not import this
roadmap: it states its prime ideal theorem conditionally on a record it names, Tau Ceti provides
that record, and this roadmap consumes it and proves the comparison of its series with
`dedekindZetaC`. The arrow into `LFunctions` stays the only one between them.

## Layer 0: completed L-function data

Define `AnalyticLFunctionData` with norm-indexed coefficients, positive integral conductor, real
and complex gamma-shift multisets, root number, completed function, and a finitely supported polar
divisor. Define its degree and gamma factor. Define the card `AnalyticLFunctionData.ofSeries` of a
Dirichlet series with given coefficients, conductor `N`, gamma shifts and polar divisor: its
completed function is the meromorphic continuation of `N^(s/2) γ(s) L(s)` from `Re s > 1`, and its
root number is read off that function at `s = 2`, `ε = Λ(2) / conj Λ(-1)`. The functional
equation `Λ(s) = ε conj Λ(1 - conj s)` at `s = 2` gives this value whenever the card has one,
because `Λ(2) ≠ 0` (Euler product, nonvanishing gamma factors) and `-1` is not a pole for any
L-function of this roadmap. The Hecke and Grossencharacter cards are built this way.

*Needs:* Mathlib `Gammaℝ`, `Gammaℂ`, `LSeries`, `MeromorphicNFOn`; `meromorphicContinuation`
(Conventions).

Construct the full dual record. Prove involutivity, degree preservation, gamma-factor conjugation,
transport of continuation and coefficient-growth predicates, and the functional equation against
the dual record. State the equation between values only where both sides are regular; state an
eventual equality of punctured germs at every point.

*Needs:* `AnalyticLFunctionData` and its gamma factor; Mathlib `meromorphicOrderAt` and the
identity theorem for meromorphic functions.

Split the basic properties into reusable predicates:

- Dirichlet-series agreement on `Re s > 1`;
- meromorphic continuation with exact poles and analyticity away from them;
- functional equation and unit-modulus root number;
- average coefficient growth.

*Needs:* `AnalyticLFunctionData`; Mathlib `LSeries`, `Meromorphic`, `AnalyticAt`.

Define `EqOffZero` to compare general analytic cards while ignoring coefficient zero, which
Mathlib's `LSeries` does not read. This remains necessary because independently defined analytic
presentations may use different junk values there. Do not impose a global zero convention on
`AnalyticLFunctionData`.

*Needs:* `AnalyticLFunctionData` only.

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

*Needs:* `AnalyticLFunctionData`, `HasFunctionalEquation`, `EqOffZero`.

**Checks.**

- weight zero gives the identity translation;
- the weight-12 discriminant form has analytic complex gamma shift `+11/2`, not `-11/2`;
- the Riemann-zeta card has degree one, conductor one, root number one, and simple poles at zero
  and one;
- a non-real character uses a genuinely distinct dual card;
- ⚠ a card with a malformed polar divisor — weight zero, completed function identically zero,
  polar divisor supported at `0` only — satisfies the root-number and value clauses and has no
  functional equation; it is the regression against weakening the
  equivalence to the value equation, and nothing in the equivalence's hypotheses excludes it.

### Examples

- `riemannZetaData`: coefficients `1`, conductor `1`, one real gamma shift `0`, no complex shift,
  degree `1`, root number `1`, completed function Mathlib's `completedRiemannZeta`, and simple poles
  at `0` and `1`; its dual is itself;
- the discriminant form `Δ`, of weight `12`, has arithmetic weight `w = 11` (its completed function
  `Gammaℂ(s) L(Δ, s)` is symmetric under `s ↦ 12 - s = w + 1 - s`) and arithmetic complex gamma
  shift `0`; its analytic translation has complex shift `11/2` and is symmetric under `s ↦ 1 - s`,
  and the factor `N^(-w/4)` is `1` at conductor `N = 1`.

### Dependencies

Mathlib: `Gammaℝ`, `Gammaℂ`, `LSeries`, `MeromorphicNFOn`, `meromorphicOrderAt`,
`completedRiemannZeta`. No earlier layer.

## Layer 1: the mixed-space specialization of Poisson summation, and theta

Lattice Poisson summation is not developed here. `ThetaSeries` owns it, for a full-rank
`ℤ`-lattice in a finite-dimensional real inner product space and a Schwartz function, along with
the Fourier transform of a Gaussian and the dual-lattice, biduality, covolume and summability
lemmas that go with it; the exact declarations consumed are tabulated above. This
layer builds what a number field adds to them, and nothing else.

Fix the analytic conventions once, as data rather than as prose. The additive character is
Mathlib's `Real.fourierChar`, so `𝐞 x = exp(2 π i x)`; the pairing is the Euclidean `mixedInner`,
not the trace form; the measure is `volume`, which is self-dual for that pairing; and the sign is
Mathlib's, `𝐞(-⟨x, y⟩)`. `mixedFourier` is the transform built from exactly those four choices,
and every later normalization is a consequence of them.

*Needs:* Mathlib `Real.fourierChar`, `NumberField.mixedEmbedding.mixedSpace` and its `volume`.

**Checks** for `mixedInner`, over `ℚ(i)` with its one complex place:

- `mixedInner σ(1) σ(1) = 1`, where the trace form gives `Tr(1 · 1) = 2`;
- `mixedInner σ(i) σ(i) = Re(i · conj i) = 1`, where the trace form gives `Tr(i · i) = -2`: the trace
  form is not positive at a complex place, so it cannot carry a Gaussian;
- `mixedInner σ(1+i) σ(1+i) = |1+i|² = 2`, where a metric counting each complex place twice, as
  Neukirch's canonical one does, gives `4`; over `ℚ` the two agree, `mixedInner x y = x y`, so only
  a field with a complex place separates them.

Transport the supplier's theorem onto the mixed space. `mixedSpace K` carries Mathlib's product
sup norm and is not an inner product space, so the theorem does not apply to it as it stands;
Mathlib's `NumberField.mixedEmbedding.euclidean.mixedSpace` is one, and `euclidean.toMixed` is a
continuous linear equivalence between the two. Prove `mixedInner_toMixed`: that equivalence
carries the inner product of the Euclidean model to `mixedInner`. Mathlib's
`euclidean.volumePreserving_toMixed` carries `volume` to `volume`, so `mixedFourier` transported
along the equivalence is Mathlib's `𝓕` (`mixedFourier_toMixed`), and pulling the ideal lattice
back along the equivalence gives a full-rank `ℤ`-lattice there with the same covolume (Mathlib's
`ZLattice.covolume_comap`). Define the dual ideal lattice `dualIdealLattice` as Mathlib's
`LinearMap.BilinForm.dualSubmodule` of `mixedInnerBilin`, the Euclidean inner product read on the
mixed space, which is the supplier's `dual` in the Euclidean model. Prove its elementwise
description `mem_dualIdealLattice_iff`, its trace-dual comparison `coe_dualIdealLattice`,
biduality `dualSubmodule_dualIdealLattice` and the dual covolume `covolume_dualIdealLattice`
(the supplier's `ThetaSeries.dual_dual` and `covolume_dual`), and that the Euclidean dual `mixedDual` of a
full-rank lattice is again discrete and of full rank (`discreteTopology_mixedDual`,
`isZLattice_mixedDual`). Those facts are what turn `ThetaSeries.poissonSummation` into
`poissonSummation_idealLattice`, which is therefore a specialization and not a second proof.

*Needs:* Theta Series `poissonSummation`, `summable_poisson_left`, `dual`, `ThetaSeries.dual_dual`,
`covolume_dual`; Mathlib `euclidean.toMixed`, `euclidean.volumePreserving_toMixed`,
`ZLattice.covolume_comap`, `LinearMap.BilinForm.dualSubmodule`; `mixedInner`, `mixedFourier`.

For the mixed embedding of a fractional ideal, compare the Euclidean dual with the trace dual.
The comparison map is the identity on real coordinates and `z ↦ 2 conj z` on complex coordinates.
One complex coordinate has real determinant `-4`, so the absolute determinant is `4`; the global
absolute determinant is `4^r₂`. The covolume itself is Mathlib's
`NumberField.mixedEmbedding.covolume_idealLattice`, equal to `N(I) 2^(-r₂) sqrt|d_K|`; this
roadmap consumes that computation rather than restating it, and checks it at `K = ℚ(i)`, where
the ring of integers has covolume one.

*Needs:* `dualIdealLattice`; Mathlib `mixedEmbedding.covolume_idealLattice` and the trace dual of
a fractional ideal.

Use the transported Poisson summation to prove the Gaussian theta transformation, including the
level, epsilon scalar, and constant terms. The real-parameter Gaussian `mixedGaussian` is the
supplier's `ThetaSeries.gaussian` on the imaginary axis, at `τ = i t`, read through
`mixedInner_toMixed`; its self-duality is `ThetaSeries.fourier_gaussian` at that point, and it is
the first conjunct of `gaussianTheta_mellin_normalization`. The holomorphic upper-half-plane theta function, the coset theta series,
the `T`- and `S`-transformation laws and every modularity statement belong to `ThetaSeries`;
Hecke's method needs the Gaussian only on the imaginary axis and never leaves it.

*Needs:* `poissonSummation_idealLattice`, `mixedInner_toMixed`; Theta Series `gaussian`,
`gaussian_apply`, `fourier_gaussian`.

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
  measure `dy/y = ∏_w dy_w/y_w` (`archHaar`), and the Haar measure `d*x` of `S` for which
  `dy/y = d*x × dt/t` (`archHaar_eq_map`). Since `∫_1^e dt/t = 1`, `d*x` is defined
  (`surfaceHaar`) as the image under `surfacePart` of `dy/y` on the shell `1 ≤ N(y) ≤ e`, read on
  `S`;
- a bounded fundamental domain for the unit action on `S` (`IsUnitFundamentalDomain`), of which
  Neukirch's `F` is taken from Mathlib: the parameters whose square root lies in
  `NumberField.mixedEmbedding.fundamentalCone K` (`unitFundamentalDomain`), a fundamental domain
  for `(𝓞 K)ˣ` modulo torsion that depends only on `|x_w|`, is bounded on `S`
  (`fundamentalCone.isBounded_normLeOne`), and is the cone through which Mathlib itself
  enumerates the ideals of a class; inversion and translation on `S` carry fundamental domains to
  fundamental domains. ⚠ Boundedness is part of the definition because the kernel theorems of
  Layer 3 hold for every lattice: a bounded subset of `S` has compact closure in the open orthant,
  whereas over an unbounded measurable fundamental domain the theta series of a lattice that is
  not unit-stable can fail to be integrable;
- Neukirch's (5.6), `vol(F) = 2^(r-1) R` with `r = r₁ + r₂` and `R` Mathlib's regulator, for
  every fundamental domain (`surfaceHaar_of_isUnitFundamentalDomain`). ⚠ Two normalizations differ
  from Neukirch's and are audited in the worked cases: the Gaussian uses `mixedInner`, in which a
  complex coordinate counts once, and `dy/y` is the product over places, whereas Neukirch's
  canonical measure carries `e_𝔭 = 2` at a complex place and is `2^r₂` times it. So `vol(F)` reads
  `2^(r-1) R / 2^r₂` here, the compensating `2^r₂` sits in the Mellin kernel, and the kernel's
  constant term is Neukirch's `2^(r-1) R / w` in both.

*Needs:* `mixedFourier`, `mixedDual`; Theta Series `fourier_gaussian`, `summable_poisson_left`;
Mathlib `realSpace`, `fundamentalCone`, `fundamentalCone.isBounded_normLeOne`,
`NumberField.Units.regulator`. `surfaceHaar_of_isUnitFundamentalDomain` needs these and nothing
from the Poisson part of the layer.

**Checks** for `archHaar` and `surfaceHaar`:

- over `ℚ`, one real place: `archHaar` is `dt/t` on `(0, ∞)` and gives `[1, e]` mass `1`; `S` is
  the point `{1}` and `surfaceHaar` gives it mass `1 = 2^(r-1) R / 2^r₂` (`r = 1`, `R = 1`, `r₂ = 0`);
- over `ℚ(i)`, one complex place: `archHaar` gives `{1 ≤ y ≤ e}` mass `1`, where Neukirch's
  canonical measure, with `e_𝔭 = 2`, gives `2`; the shell `1 ≤ N(y) = y² ≤ e` is `[1, e^(1/2)]`, of
  mass `1/2`, so `S = {1}` has `surfaceHaar` mass `1/2 = 2^(r-1) R / 2^r₂` (`r = 1`, `r₂ = 1`),
  and `1` in Neukirch's normalization;
- over a real quadratic field with fundamental unit `ε`: a unit fundamental domain on the hyperbola
  `y₁ y₂ = 1` has `surfaceHaar` mass `2 log ε = 2^(r-1) R` (`r = 2`, `R = log ε`), which a
  definition through the one-parameter Gaussian cannot see, since its `S` would be a point.

**The Mellin principle is Mathlib's.** Mathlib's `WeakFEPair` packages Neukirch's (1.4) for the
law `f(1/x) = ε x^k g(x)`, with its completed function `Λ`, the Mellin representation
`hasMellin`, the functional equation, the residues `Λ_residue_zero` and `Λ_residue_k`, and the
entire case `IsStrongFEPair`. Extend it to a level by transport, as the level note in its file
proposes, and develop no second Mellin theory. The carrier `FEPairWithLevel` has the hypotheses of
`WeakFEPair` field for field: `f` and `g` locally integrable on `(0, ∞)`, equal to constants `f₀`
and `g₀` at `∞` up to an error that decays faster than every power, a weight `k > 0` and a root
number `ε ≠ 0`. Its law is taken at a level `N > 0`, `f(1/(N t)) = ε t^k g(t)`. The transport
`toWeakFEPair` replaces `g(x)` by `g(x/N)` and `ε` by `ε N^(-k)`, which turns the law into
`f(1/x) = (ε N^(-k)) x^k g(x/N)`, exactly a `WeakFEPair`. It does not move `f`, so
`FEPairWithLevel.Λ` is Mathlib's `Λ` of the transported pair, and its Mellin representation on
`Re s > k` (`hasMellin`), its residues `-f₀` at `0` and `ε N^(-k) g₀` at `k` and its
differentiability off `{0, k}` are Mathlib's statements read through the transport. The one fact
the level adds is that the dual side, the continued Mellin transform of `g(·/N)`, is `N^s` times
that of `g`: Mathlib's `mellin_comp_mul_right` on `Re s > k`, then the identity theorem on
`ℂ ∖ {0, k}` (`toWeakFEPair_symm_Λ`). With Mathlib's functional equation it gives
`Λ(f, s) = ε N^(-s) Λ(g, k - s)` off the poles and as germs at every point (`Λ_eq`,
`Λ_eventuallyEq`). Neukirch's exponential decay `O(e^{-c t^α})` gives Mathlib's `O(t^r)` for every
`r` (`isBigO_rpow_of_isBigO_exp_neg`). ⚠ The positive weight and the nonzero `ε` are hypotheses
of (1.4) and cannot be dropped. With `ε = 0` the pair `f ≡ 0`, `g ≡ 1` satisfies the law while
its reverse reads `1 = 0`; with `k = 0` the pair `f = g ≡ 1` satisfies it while its residues
`-1` and `1` sit at the same point. Both are rejected by the carrier's hypotheses `k > 0` and
`ε ≠ 0`, and each is a Check. The Dedekind kernels of Layer 3 and the Grossencharacter kernels of
Layer 6 are its instances, each discharging every hypothesis from a named property of its kernel;
nothing else continues a completed function.

*Needs:* Mathlib `WeakFEPair`, `IsStrongFEPair`, `mellin_comp_mul_right`,
`isLittleO_exp_neg_mul_rpow_atTop`; nothing number-theoretic.

**Checks** for `FEPairWithLevel`:

- the Dedekind kernel of `ℚ`, `f = g = θ(iu)/2` with `θ(iu) = ∑_{n ∈ ℤ} e^{-π u n²}`, at level
  `1`, weight `1/2`, `ε = 1`, constants `f₀ = g₀ = 1/2`: the transport is the identity, `Λ(s/2)` is
  `completedRiemannZeta s`, and the residues `-1/2` at `0` and `1/2` at `1/2` become `-1` at
  `s = 0` and `1` at `s = 1`;
- the same pair at level `N`, `f(t) = θ(it)/2` and `g(t) = N^(1/2) θ(iNt)/2`, satisfies the law
  `f(1/(N t)) = t^(1/2) g(t)`, and the transport returns `g(x/N) = N^(1/2) θ(ix)/2` with
  `ε N^(-1/2)`, Mathlib's level-one pair; a transport that rescaled `g(x)` to `g(N x)` would
  produce `θ(iN²x)` and fail the law for `N ≠ 1`;
- the rejected degenerate pairs above: `ε = 0` with `f ≡ 0`, `g ≡ 1`, and `k = 0` with
  `f = g ≡ 1`, each violating a hypothesis of the carrier.

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

*Needs:* `mixedGaussian`, `poissonSummation_idealLattice`, `mellinKernel`, `mellinConstant`,
`completedDedekindZeta_eq` (Layer 3); Theta Series `fourier_gaussian`.

### Examples

Three worked examples are required, and none is redundant.

- `K = ℚ`: `completedDedekindZeta ℚ` is Mathlib's `completedRiemannZeta` off the poles at `0` and
  `1`. This fixes the real gamma factor and conductor one.
- `K = ℚ(i)`: `|d| = 4` and `r₂ = 1`, so `4^(s/2) Gammaℂ(s) ζ_{ℚ(i)}(s)` must equal
  `2 π^(-s) Γ(s) ζ(s) L(s, χ₋₄)` on `Re s > 1`, by Legendre duplication against the quadratic
  factorization. ⚠ Dropping the factor `2` in `Gammaℂ`, or writing the conductor power as
  `|d|^(-s/2)`, changes this constant, and the rational check sees neither error. The kernel's
  constant term `2^(r-1) R / w` is `1/4` here (`w = 4`) and `1/2` over `ℚ` (`w = 2`).
- `K` real quadratic: the unit-quotient check. Both
  fields above have a finite unit group and a fundamental domain that is a point; a real quadratic
  field has unit rank one, `w = 2` and regulator `log ε`, so the fundamental domain is one period
  of the hyperbola `y_1 y_2 = 1` under `y ↦ |ε|² y`, of volume `2R`, the kernel's constant term is
  `R`, and every partial zeta function has residue `2R` at `s = 1`, summing over the `h` classes
  to the residue `2hR` of `completedDedekindZeta`. ⚠ A construction that Mellin-transforms the
  one-parameter theta series passes the first two checks and fails this one, because its
  lattice-point sum is not summable in positive unit rank (`not_summable_absNorm_of_rank_pos`).

### Dependencies

Theta Series: `poissonSummation`, `summable_poisson_left`, `summable_poisson_right`, `dual`,
`ThetaSeries.dual_dual`, `covolume_dual`, `gaussian`, `gaussian_apply`, `fourier_gaussian`. Mathlib:
`NumberField.mixedEmbedding.euclidean.mixedSpace` with `euclidean.toMixed` and
`euclidean.volumePreserving_toMixed`, `ZLattice.covolume_comap`,
`mixedEmbedding.covolume_idealLattice`, `fundamentalCone` with `fundamentalCone.isBounded_normLeOne`,
`NumberField.Units.regulator`, `WeakFEPair`, `mellin`, `mellin_comp_mul_right`. Layer 0 is not
needed.

## Layer 2: partial zeta functions

For a modulus and ray class supplied by Global Number Fields, define its indicator as an
`ArithmeticDirichletSeries.IdealArithmeticFunction` on nonzero ideals, equal to one exactly on
prime-to-modulus ideals in that class. The class is read off the supplier's prime-to carrier, so
the coprimality proof travels with the ideal and no junk class is available at a bad one. It is
not a `UnitaryIdealWeight`: the indicator of a nontrivial class is not completely multiplicative.

*Needs:* Global Number Fields `integralIdealsPrimeTo`, `idealClass`, `RayClassGroup`; Arithmetic
Dirichlet Series `IdealArithmeticFunction`.

**Checks** for the class indicator `rayClassCoeff`, over `ℚ`, where the ray class group of
`ratModulus n` is `(ℤ/n)ˣ` through the positive generator (the supplier's `ratModulusEquivZMod`):

- at the trivial modulus there is one class, and the indicator is `1` at every nonzero ideal;
- at `ratModulus 4`, the indicator of the class of `3` is `1` at `(3)` and `(7)` and `0` at `(5)`
  and at `(2)`, which is not prime to `4`; reading the class off the generator `-3 ≡ 1` would put
  `(3)` in the trivial class;
- at `ratFiniteModulus 5`, whose ray class group is `(ℤ/5)ˣ/{±1}`, the indicator of the trivial
  class is `1` at `(4)` and `(9)`, since `4 ≡ -1`; a definition that forgot the sign quotient gives
  `0` there.

Define the partial zeta series using the shared `normCoeff` and `regroupByNorm` API. Establish
convergence on `Re s > 1`, the sum over ray classes, and the common residue. Continue each
partial zeta function minus its pole to the half-plane `Re s > 1 - 1/[K:ℚ]` by Abel summation
(Tau Ceti's `idealSummatory_mul_eq_sub_integral_mul`) from the uniform ray-class count
`#{𝔞 ∈ c : N𝔞 ≤ x} = κ_𝔪 x + O(x^(1 - 1/[K:ℚ]))`, `κ_𝔪` the supplier's `rayClassIdealMainTerm`
(Global Number Fields, Layer 3); the exponent is that of the supplier's `HasCancellation`.

*Needs:* `rayClassCoeff`; Arithmetic Dirichlet Series `normCoeff`, `regroupByNorm`,
`idealSummatory_mul_eq_sub_integral_mul`; Global Number Fields `rayClassIdealMainTerm` and Tau
Ceti's `isBigO_rayClassIdealCountingFunction_sub`.

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

*Needs:* `partialZeta`; Global Number Fields `Modulus.support`, `Modulus.mem_support_iff`;
Mathlib `dedekindZeta`.

The common residue follows: every ray class has the same simple pole at `s = 1`, with residue the
Dedekind-zeta residue times that finite Euler correction, divided by the ray class number. ⚠
`κ_K / #Cl_𝔪` is wrong for a nontrivial finite part. This constant is the supplier's
`rayClassIdealMainTerm`, whose closed form the supplier proves; prove that the analytic residue is
that same constant instead of introducing a second one.

*Needs:* `partialZeta`, `finiteEulerCorrection`; Global Number Fields `rayClassIdealMainTerm_eq`;
Mathlib `dedekindZeta_residue`.

Construct the class-group specialization for the trivial modulus, where the correction is an empty
product and the partial zeta functions do sum to `ζ_K`. Prove independence from choices of ideal
representatives and compatibility with change of modulus. No generic ideal series or Euler product
is introduced in this layer.

*Needs:* `partialZeta`, `finiteEulerCorrection`; Global Number Fields `Modulus.support_one`.

### Examples

- over `ℚ` at `ratModulus 4`: two ray classes, `ζ(s, [1]) + ζ(s, [3]) = ζ(s)(1 - 2^(-s))`, and each
  partial zeta function has residue `κ_ℚ (1 - 1/2) / 2 = 1/4` at `s = 1`, where `κ_ℚ / #Cl_𝔪 = 1/2`
  is the wrong value;
- over `ℚ` at `ratFiniteModulus 5`: two classes, each of residue `(1 - 1/5)/2 = 2/5`;
- over `ℚ(√-5)` at the trivial modulus: two ideal classes, whose partial zeta functions sum to
  `ζ_K`, each of residue `κ_K / 2 = π/(2√5)`.

### Dependencies

Global Number Fields: `Modulus`, `Modulus.support`, `Modulus.mem_support_iff`, `RayClassGroup`,
`integralIdealsPrimeTo`, `idealClass`, `rayClassIdealMainTerm` with `rayClassIdealMainTerm_eq`,
and the uniform ray-class count of its Layer 3. Arithmetic Dirichlet Series:
`IdealArithmeticFunction`, `normCoeff`, `regroupByNorm`, `idealSummatory_mul_eq_sub_integral_mul`.
No earlier layer.

## Layer 3: Dedekind zeta

Construct the completed partial zeta functions from the theta kernel of Layer 1, following
Neukirch VII (5.3)–(5.9) step by step, and `dedekindZetaC K` and `completedDedekindZeta K` as
their sum over the classes (`completedDedekindZeta_eq_sum_completedPartialZeta`):

- (5.3)–(5.4): the integral ideals of the class of `𝔞⁻¹` are the `a 𝔞⁻¹` for `a ∈ 𝔞 ∖ 0` modulo
  units, so `ζ(𝔎, s) = N(𝔞)^s ∑_{a ∈ 𝔞*/𝔬*} |N(a)|^(-s)`; Mathlib has the bijection through its
  fundamental cone (`fundamentalCone.idealSetEquiv`, `card_isPrincipal_norm_eq_mul_torsion`), and
  the completed partial zeta function `completedPartialZeta` of a fractional ideal is pinned by
  both sums (`completedPartialZeta_eq_tsum`, `completedPartialZeta_eq_tsum_fundamentalCone`) and
  linked to Layer 2's ray-class partial zeta function (`completedPartialZeta_eq_partialZeta`);
- ⚠ the Epstein regression first: the radial Mellin transform of the one-parameter theta series
  minus its constant term `1` is `π^(-s) Γ(s)` times the Epstein zeta function of `mixedInner` on
  `σ(𝔞)`, a sum over the nonzero points (`radialMellin_eq_epsteinZeta`), and in positive unit rank
  the corresponding sum over norms is not summable at all (`not_summable_absNorm_of_rank_pos`). The
  constant is subtracted from the theta series, not from each term, since `∑ (e^{-π t Q(x)} - 1)`
  does not converge;
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
  with `Z(𝔎, s) = ∫_0^∞ (f_D(𝔞, u) - a₀) u^(s/2) du/u` for `Re s > 1`, Mathlib's `mellin` at `s/2`
  (`completedPartialZeta_eq_mellin`); its constant term `a₀ = 2^(r-1) R / w` (`mellinConstant`) is
  the same for every fundamental domain;
- (5.8): the kernel is continuous on `(0, ∞)` (`continuousOn_mellinKernel`) and
  `a₀ + O(e^{-c u^(1/n)})` at `∞` (`mellinKernel_sub_const_isBigO`), and it
  transforms by `f_D(L, 1/u) = u^(1/2) f_{D⁻¹}(L^∨, u)` for every lattice, from `latticeTheta_inv`
  and the substitution `x ↦ x⁻¹` on `S` (`mellinKernel_inv`); the Euclidean dual of `σ(𝔞)` is the
  trace dual `σ((𝔞𝔡)⁻¹)` moved by `traceToEuclidean`, which on the parameters is the translation
  by the point `traceShift` of `S` (`mellinKernel_dualIdealLattice`), the covolumes
  `V_{(𝔞𝔡)⁻¹} = V_𝔞⁻¹ 4^(-r₂)` absorbing the `16^r₂` of the doubled complex coordinates;
- the Mellin principle: `dedekindFEPair`, level `1`, weight `1/2`, `ε = 1`, both constants `a₀`,
  each hypothesis of Mathlib's pair discharged from the kernel (local integrability from its
  continuity, the law from `mellinKernel_inv`, the rapid decay from its exponential decay), whose
  `Λ` at `s/2` is `Z(𝔎, s)` by Mathlib's `hasMellin` (`dedekindFEPair_completed`); this continues
  `completedPartialZeta` (`meromorphic_completedPartialZeta`, `analyticAt_completedPartialZeta`);
- (5.9): `Z(𝔎, s) = Z(𝔎', 1 - s)` with `𝔎𝔎' = [𝔡]`, i.e. against `(𝔞𝔡)⁻¹` (`dualUnit`), pointwise
  off `0`, `1` and as germs (`completedPartialZeta_one_sub`, `_eventuallyEq`), and the residue
  `2 a₀ = 2^r R / w` at `s = 1` (`tendsto_sub_one_mul_completedPartialZeta`), which summed over
  the `h` classes is `2^(r₁+r₂) h R / w`, the residue of `completedDedekindZeta` by the class number
  formula with `Γ_ℝ(1) = 1` and `Γ_ℂ(1) = 1/π`.

*Needs:* Layer 1 `latticeTheta`, `latticeTheta_inv`, `IsUnitFundamentalDomain`,
`surfaceHaar_of_isUnitFundamentalDomain`, `FEPairWithLevel`, `Λ_eq`; Layer 2 `partialZeta`; Mathlib
`fundamentalCone.idealSetEquiv`, `card_isPrincipal_norm_eq_mul_torsion`, `WeakFEPair`.

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

The exact downstream contracts include `analyticAt_dedekindZetaC`,
`meromorphicOrderAt_dedekindZetaC_one`, `tendsto_sub_one_mul_dedekindZetaC`,
`eq_of_meromorphic_of_eqOn_halfPlane`, the corresponding completed-zeta pole and regularity
theorems, and `tendsto_mul_completedDedekindZeta_zero`.

*Needs:* `completedPartialZeta` and `completedDedekindZeta_eq_sum_completedPartialZeta`; Layer 0
`AnalyticLFunctionData`; Mathlib `dedekindZeta`, `dedekindZeta_residue`.

Prove uniqueness of meromorphic continuation in both the forms this roadmap uses:
`eq_of_meromorphic_of_eqOn_halfPlane`, which compares values off `{0, 1}`, and
`eventuallyEq_of_meromorphic_of_eqOn_halfPlane`, which turns agreement on a right half-plane into
equality of germs at every point of the plane; a value is read off a germ only where both sides
are analytic, hence continuous. Every global identity in Layers 4 to 6 is stated
through these two, and never as an unrestricted equality of total representatives.

*Needs:* Mathlib `Meromorphic` and the identity theorem on the connected plane; no earlier layer.

Prove the behaviour at `s = 0` (Neukirch VII (5.11)): `dedekindZetaC K` has a zero of order exactly
the unit rank `r = r₁ + r₂ - 1` at `0`, and `ζ_K(s) / s^r → -h R / w` as `s → 0`, `s ≠ 0`, with
Mathlib's `NumberField.classNumber`, `NumberField.Units.regulator` and
`NumberField.Units.torsionOrder` (`dedekindZetaC_leading_zero`). It follows from the functional
equation and the residue `2^(r₁+r₂) h R / w` of the completed function at `s = 1`, since
`Gammaℝ(s)^r₁` has a pole of order `r₁` at `0` and `Gammaℂ(s)^r₂` one of order `r₂`. Prove the
analytic class number formula `Res_(s=1) ζ_K = 2^r₁ (2π)^r₂ h R / (w √|d_K|)` for the named
continuation (`tendsto_sub_one_mul_dedekindZetaC`, whose constant is Mathlib's
`dedekindZeta_residue`, so the compatibility with Mathlib's one-sided residue theorem
`NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT` is the agreement on `Re s > 1`). Special-value
statements use named continued functions, never the junk values of raw Dirichlet series outside
convergence.

*Needs:* `completedDedekindZeta_one_sub`, `tendsto_sub_one_mul_completedDedekindZeta`; Mathlib
`Gammaℝ`, `Gammaℂ`, `NumberField.classNumber`, `NumberField.Units.regulator`,
`NumberField.Units.torsionOrder`, `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`.

**Checks.**

- over `ℚ`, `r = 0`, `h = R = 1`, `w = 2`: the order at `0` is `0` and the value is `ζ(0) = -1/2`;
  the sign `+hR/w` would give `+1/2`;
- over `ℚ(i)`, `r = 0`, `w = 4`: the value is `ζ(0) L(0, χ₋₄) = (-1/2)(1/2) = -1/4`, which a
  formula with `w = 2` (counting only `±1`) misses by a factor two;
- over a real quadratic field, `r = 1`, `w = 2`: a simple zero with derivative `-h log ε / 2`; the
  quadratic factorization gives `ζ(0) L'(0, χ_d)` with `L(0, χ_d) = 0` for an even character, so an
  order read off `r₁ + r₂` instead of `r₁ + r₂ - 1` is wrong already here.

### Examples

- `K = ℚ`: `completedDedekindZeta ℚ` is `completedRiemannZeta`, with residue `1` at `1` and `-1`
  at `0`, and `mellinConstant ℚ = 2^0 · 1 / 2 = 1/2`;
- `K = ℚ(i)`: the residue of `completedDedekindZeta` at `1` is `2^(r₁+r₂) h R / w = 2/4 = 1/2`,
  equal to `√4 · Gammaℂ(1) · Res ζ_K = 2 · (1/π) · (π/4)`;
- `K` real quadratic: the unit-quotient check of Layer 1, and the simple zero at `s = 0` of the
  Checks above.

### Dependencies

Layer 1: `mixedInner`, `archGaussian`, `latticeTheta`, `latticeTheta_inv`, `unitScale`,
`normOneSurface`, `surfaceHaar`, `IsUnitFundamentalDomain`, `surfaceHaar_of_isUnitFundamentalDomain`,
`FEPairWithLevel`. Layer 2: `partialZeta`, `finiteEulerCorrection`. Mathlib: `dedekindZeta`,
`dedekindZeta_residue`, `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`,
`fundamentalCone.idealSetEquiv`, `NumberField.classNumber`, `NumberField.Units.regulator`,
`NumberField.Units.torsionOrder`, `NumberField.Units.rank`.

## Layer 4: Dirichlet L-functions and factorizations

Package Mathlib's continued primitive Dirichlet L-functions as `dirichletData`, proving the exact
conductor, parity-dependent real gamma shift, Gauss-sum root number, unit norm, continuation, and
functional equation. Preserve Mathlib's function rather than wrapping a second analytic function.

*Needs:* Layer 0 `AnalyticLFunctionData`, `HasMeromorphicContinuation`, `HasFunctionalEquation`;
Mathlib `DirichletCharacter.completedLFunction`, `DirichletCharacter.rootNumber`.

**Checks** for `dirichletData`:

- the primitive character `χ₄` modulo `4` is odd: one real gamma shift `1`, conductor `4`, Gauss
  sum `i - (-i) = 2i` and root number `2i/(i √4) = 1`; a card with shift `0` (the parity ignored)
  fails `HasDirichletAgreement`, since Mathlib's completed function carries `Γ_ℝ(s + 1)`;
- the quadratic character modulo `5` is even: shift `0`, Gauss sum `√5`, root number `1`; Mathlib's
  `Λ_M(χ, 1 - s) = 5^(s - 1/2) Λ_M(χ, s)` is symmetric only after the factor `5^(s/2)`, so a card
  that omits the conductor power fails `HasFunctionalEquation`;
- the trivial character modulo `1`: conductor `1`, shift `0`, root number `1`, completed function
  `completedRiemannZeta` and simple poles at `0` and `1`, field for field `riemannZetaData`; a
  card without the poles at `N = 1` fails `HasMeromorphicContinuation`.

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

*Needs:* Layer 3 `dedekindZetaC` and `eventuallyEq_of_meromorphic_of_eqOn_halfPlane`; Mathlib
`riemannZeta`, `DirichletCharacter.LFunction`, `DirichletCharacter.changeLevel`,
`IsCyclotomicExtension`, and the decomposition of rational primes in quadratic and cyclotomic
fields. Layer 0 is not needed.

**Checks** for `dedekindZetaC_quadratic`, `dedekindZetaC_cyclotomic` and
`dedekindZetaC_cyclotomic_imprimitive`:

- `ℚ(i)`, `χ₄`: at the ramified prime `2` the left side has the one factor `(1 - 2^(-s))⁻¹`, `ζ`
  supplies it and `L(χ₄)` has factor `1`; at `p = 5` the two primes of norm `5` give
  `(1 - 5^(-s))⁻²`, and at `p = 3` the one prime of norm `9` gives `(1 - 9^(-s))⁻¹`, matching
  `(1 - 3^(-s))⁻¹ (1 + 3^(-s))⁻¹`;
- the level characters modulo `4` with `ℚ(i)`: the trivial character of level `4` has
  `L = ζ(s)(1 - 2^(-s))`, so the imprimitive form multiplies `ζ_{ℚ(i)}` by `1 - 2^(-s)`; the
  correction placed on the other side, or with the inverse factor, is off by `(1 - 2^(-s))²`;
- `ℚ(ζ₅)`, primitive form: the trivial character has conductor `1` and the other three have
  conductor `5`; the totally ramified prime `5` contributes `(1 - 5^(-s))⁻¹` on the left, supplied
  by `ζ` alone, the three nontrivial L-functions having factor `1` there.

### Examples

- `ζ_{ℚ(i)}(s) = ζ(s)L(s,χ₋₄)` including the ramified prime `2`;
- the primitive character modulo `4` is odd and has gamma shift `1`;
- the quadratic character modulo `5` is even and has gamma shift `0`; as a ray-class character it
  is the unique nontrivial character of the ray class group of Tau Ceti's `ratFiniteModulus 5`,
  which is `(ℤ/5)ˣ/{±1}`, of order `2` — a definition that forgot the sign quotient would see the
  four characters of `(ℤ/5)ˣ`, two of them odd;
- the conductor-one principal character recovers the Riemann-zeta card.

### Dependencies

Mathlib: `DirichletCharacter.LFunction`, `DirichletCharacter.completedLFunction` and its
functional equation, `gaussSum`, `riemannZeta`. Layer 0: `AnalyticLFunctionData` and `ofSeries`.
Layer 3: `dedekindZetaC` and the uniqueness theorems `eq_of_meromorphic_of_eqOn_halfPlane` and
`eventuallyEq_of_meromorphic_of_eqOn_halfPlane`.

## Layer 5: finite-order Hecke L-functions

For `χ : GlobalNumberFields.RayClassCharacter 𝔪`, derive an
`ArithmeticDirichletSeries.UnitaryIdealWeight` from `idealClass`, using value zero on the zero
ideal and at primes dividing the finite part. Pin both values as theorems: the weight of an ideal
prime to the modulus is the character of its ray class, read through the supplier's prime-to
carrier, and the weight vanishes elsewhere. Define the presented `heckeLFunctionC χ` and prove
its agreement with the shared norm-regrouped series and Euler product on `Re s > 1`.

*Needs:* Global Number Fields `RayClassCharacter.toUnitaryIdealWeight`, `integralIdealsPrimeTo`;
Arithmetic Dirichlet Series `UnitaryIdealWeight`, `regroupByNorm`, `EulerProductData`;
`meromorphicContinuation`.

**Checks** for `rayClassIdealWeight` and `heckeLFunctionC`:

- the odd character mod `4∞` of `ℚ`: the weight is `χ₄(n)` at `(n)` prime to `2` by the supplier's
  `ratDirichletEquiv_absNorm`, so `-1` at `(3)` and `1` at `(5)`, and `0` at `(2)`; the series is
  `L(s, χ₄)`;
- the trivial character at `ratModulus 4`: weight `0` at `(2)` and `1` at every odd ideal, so the
  series is `ζ(s)(1 - 2^(-s))`, not `ζ(s)`;
- the trivial character at `Modulus.one K`: the series is `dedekindZetaC K` on `Re s > 1`; at a
  modulus with a prime `𝔭` in its support the weight is `0` at `𝔭` and the series loses exactly
  the Euler factor at `𝔭`.

**Primitive versus presented.** A ray-class character can be presented at every multiple of its
conductor, so a conductor stored beside a presentation modulus lets one character carry several
incompatible conductors, and with them several incompatible gamma factors, root numbers and local
factors. The conductor and its universal property are the supplier's: Tau Ceti's
`RayClassCharacter.conductor` is the least modulus from which the character is induced
(`conductor_dvd_iff`), the character is induced from `primitiveCharacter` at it
(`induced_primitiveCharacter`), and the conductor of the trivial character is the trivial modulus
at every presentation (`conductor_one`). This roadmap only bundles them: `PrimitiveRayClassCharacter`
carries a conductor, a character of that modulus and its primitivity proof, so that a primitive
character cannot carry a second conductor; `PrimitiveRayClassCharacter.of χ` is the bundle of
`χ.conductor`, `χ.primitiveCharacter` and `isPrimitive_primitiveCharacter`, and
`PrimitiveRayClassCharacter.inv` is primitive by the supplier's `conductor_inv`. The completion,
Gauss sum, root number and analytic card all take this carrier, while `heckeLFunctionC` keeps
taking a presentation, because the presented series genuinely depends on it.

*Needs:* Global Number Fields `RayClassCharacter.conductor`, `primitiveCharacter`,
`isPrimitive_primitiveCharacter`, `conductor_inv`, `RayClassCharacter.IsPrimitive`.

**Checks** for `PrimitiveRayClassCharacter`:

- `PrimitiveRayClassCharacter.of` the trivial character at `ratModulus 4` has conductor
  `Modulus.one ℚ` (the supplier's `conductor_one`); a bundle that kept the presentation modulus
  would record `(4)·∞` and the gamma shift and conductor of an odd character;
- `of` the odd character mod `4∞` has conductor `ratModulus 4`, the real place included, and `of`
  the even character mod `5` presented at `ratFiniteModulus 10` has conductor `ratFiniteModulus 5`,
  without it, since the conductor divides the presentation (the supplier's `conductor_dvd_iff`);
- `inv` of the order-three character modulo `7` is its conjugate, of the same conductor; `inv` of a
  quadratic character is itself.

Prove the orthogonality reconstruction, which recovers each partial zeta function from the
character L-functions: `#Cl_𝔪 · ζ(s,c) = ∑_χ conj(χ(c)) L(s,χ)`. ⚠ Both sides run over the ideals
prime to the modulus, so no Euler correction appears in it; the correction appears only when the
principal-character term is rewritten as `ζ_K`.

*Needs:* `heckeLFunctionC`, Layer 2 `partialZeta`; orthogonality of the characters of the finite
abelian group `RayClassGroup 𝔪` (Global Number Fields `finite_rayClassGroup`).

Use `GlobalNumberFields.rayClassCharacter_partialSums`, which bounds the partial sums of a
nontrivial character by `O(x^(1 - δ))` for some `δ > 0` (the supplier's witness is
`δ = 1/[K:ℚ]`), and Abel summation (`idealSummatory_mul_eq_sub_integral_mul`) to continue a
nontrivial character to `Re s > 1 - 1/[K:ℚ]`, which contains `Re s = 1`. The theta and Mellin presentation of a primitive character is the
finite-order case of the Grossencharacter kernel of Layer 6 — trivial angular frequencies, `Tr(p)`
the number of odd real places — and `completedHeckeLFunction` is that kernel's Mellin transform at
`(s + Tr p / n)/2` (`completedHeckeLFunction_eq_mellin`); `exists_mellin_completedHeckeLFunction`
is its existential shadow, kept because the zeros roadmap consumes it by name. Define the Gauss sum
`τ_𝔪(χ_f, y) = ∑_{x mod 𝔪₀} χ_f(x) e^(2πi Tr(xy))` (`gaussSum`, Neukirch VII (6.3)) as a finite
sum over the residue units of `𝓞/𝔪₀`, for `y ∈ 𝔪₀⁻¹𝔡⁻¹` — the domain on which `Tr(xy) mod ℤ`
depends only on `x mod 𝔪₀` — with `χ_f` the residue character `Grossencharacter.residueCharacter`
of the finite-order presentation, Mathlib's `MulChar` of `𝓞/𝔪₀`, read on the residue class itself,
so that only the trace needs representatives and any may be used (`gaussSum_eq_sum`). Prove (6.4)
with its hypotheses in the types: for `y ∈ 𝔪₀⁻¹𝔡⁻¹` and a primitive character,
`τ_𝔪(χ_f, a y) = conj(χ_f(a)) τ_𝔪(χ_f, y)` with `χ_f(a)` the residue character at `a mod 𝔪₀`
(`gaussSum_mul`) — the reindexing `x ↦ x a⁻¹` produces the **inverse** value, Mathlib's
`gaussSum_mulShift_eq` convention, and the equation covers the vanishing case `(a, 𝔪₀) ≠ 1` because
`a` is then not a unit mod `𝔪₀`, where the `MulChar` vanishes — and `|τ_𝔪(χ_f, y)| = √N(𝔪₀)` when
moreover the integral ideal `y 𝔪₀ 𝔡` is prime to `𝔪₀` (`norm_gaussSum`). At conductor one the
residue ring has one element, a unit, where `χ_f` is `1`, and the Gauss sum is `1`
(`gaussSum_of_finitePart_eq_top`). ⚠ This is why the Gauss sum reads the residue character and not
the coefficient `finiteCharacter` at a representative: the coefficient is `0` at the element `0`,
which may represent the one residue class, and (6.4) at `a = 0` would read `1 = 0`. ⚠ Quadratic
characters cannot see the conjugate: an even primitive character of order `3` modulo `7` with
`χ_f(3) = ω` has `τ(χ, 3/7) = ω⁻¹ τ(χ, 1/7)`.
⚠ Without the domain hypothesis the vanishing case is false: over `ℚ` with the even character mod
`5`, `a = 5` and `y = 1/25 ∉ (1/5)ℤ` would force `τ(χ, 1/5) = 0`, against `|τ(χ, 1/5)| = √5`. The
root number is pinned by the transformation law of the kernel (Layer 6), of which Neukirch's
`W(χ) = [i^(Tr p) N((md/|md|)^p)]⁻¹ τ(χ_f)/√N(𝔪)` (his `τ(χ_f)` being the Gauss sum of (7.4), in
ideal-number normalization) is the evaluation. Define the conductor, gamma factors, completion,
and root number.
Prove entirety for a nontrivial primitive character and the meromorphic two-pole statement for the
trivial primitive character.

*Needs:* for the continuation, Global Number Fields `rayClassCharacter_partialSums` and Arithmetic
Dirichlet Series `idealSummatory_mul_eq_sub_integral_mul`; for the Mellin presentation, Layer 6
`heckeMellinTotal` and `grossencharacterFEPair`; for `gaussSum`, `gaussSum_mul` and
`norm_gaussSum`, Layer 6 `residueCharacter` and Mathlib `MulChar`, `Algebra.trace`,
`gaussSum_mulShift_eq`, and nothing from the kernel; for the root number and completion, Layer 0
`ofSeries` and Layer 6 `heckeMellinTotal_inv`.

**Checks** for `gaussSum` and `heckeData`:

- conductor one: the residue ring has one element and the Gauss sum is `1`; a sum read through the
  coefficient `finiteCharacter` at the representative `0` gives `0`;
- the odd character mod `4∞`, `y = 1/4`: `τ = χ₄(1) e^(2πi/4) + χ₄(3) e^(6πi/4) = i - (-i) = 2i`,
  of absolute value `2 = √4`, with `y 𝔪₀ 𝔡 = (1)` prime to `4`;
- the even character mod `5`, `y = 1/5`: `τ = √5`, and at `a = 2`, `τ(χ, 2/5) = conj(χ(2)) τ = -√5`;
  the conjugation in `gaussSum_mul` is invisible here and is seen by the order-three character
  modulo `7` above;
- the card of the odd character mod `4∞`: conductor `|d_ℚ| · 4 = 4`, one real gamma shift `1`, root
  number `1`, the fields of `dirichletData` for `χ₄`; over `ℚ(i)` every card has one complex gamma
  factor and degree `2`, where the relative degree `1` of a character is a different invariant.

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

*Needs:* `heckeLFunctionC`, `rayClassIdealWeight`; Global Number Fields `RayClassCharacter.induced`,
`induced_primitiveCharacter`; Layer 2 `finiteEulerCorrection`; Layer 3
`eventuallyEq_of_meromorphic_of_eqOn_halfPlane`.

**Checks** for `eulerCorrection`:

- the even character `χ` mod `5` presented at `ratFiniteModulus 10`: the correction is
  `1 - χ(2) 2^(-s) = 1 + 2^(-s)`, since `2` is not a square mod `5`; a correction read with the
  presented character, which vanishes at `2`, is `1`;
- the same character presented at `ratFiniteModulus 15`: `1 - χ(3) 3^(-s) = 1 + 3^(-s)`, and the
  prime `5` dividing the conductor contributes nothing;
- the trivial character at a modulus with finite part `𝔪₀`: the correction to the primitive series
  `dedekindZetaC` is `finiteEulerCorrection`, the product of Layer 2, not a second notion.

### Examples

- the trivial character presented at `ratModulus 4` is imprimitive, its conductor is
  `Modulus.one` (the supplier's `conductor_one`), and its presented series is `ζ(s)(1 - 2^(-s))`;
- the odd character mod `4∞` is primitive of conductor `ratModulus 4` (the supplier's
  `conductor_finitePart_eq_span` and `conductor_infinitePart_eq_empty_iff_even`); its card has
  conductor `4`, real gamma shift `1` and root number `1`, and `L(1, χ₄) = π/4`;
- the even character mod `5` presented at `ratFiniteModulus 10` differs from the primitive series by
  `eulerCorrection = 1 - χ(2) 2^(-s) = 1 + 2^(-s)`, since `2` is not a square mod `5`.

### Dependencies

Global Number Fields: `RayClassCharacter`, `RayClassCharacter.toUnitaryIdealWeight`,
`RayClassCharacter.induced`, `IsPrimitive`, the conductor declarations of the supplier contract,
`rayClassCharacter_partialSums`, `ratModulus`, `ratFiniteModulus`, `ratDirichletEquiv`. Arithmetic
Dirichlet Series: `UnitaryIdealWeight`, `EulerProductData`, `idealSummatory_mul_eq_sub_integral_mul`.
Layer 0 (`ofSeries`), Layer 2 (`finiteEulerCorrection`, `partialZeta`), Layer 3 (`dedekindZetaC`),
and, for the Mellin presentation `completedHeckeLFunction_eq_mellin` only, the kernel of Layer 6.

## Layer 6: Grossencharacters

Consume `GlobalNumberFields.HeckeCharacter K`, its real shift, unitary part and archimedean
parameters `HeckeCharacter.infinityType`, and the idelic vocabulary that pins a character's finite
behaviour: `IdeleGroup`, `ideleInfiniteCoord`, `ideleCongruenceSubgroup` and the local components
`HeckeCharacter.finiteComponent`.
Define a `Grossencharacter K 𝔪` as a presentation, at the modulus `𝔪`, of an **algebraic** Hecke
character — Weil's type `A₀` — with the idele class character as its primary object. Every other
field is pinned to that object by an equation, so a presentation is determined by its Hecke
character (`Grossencharacter.ext`) and the L-function, conductor, root number and completions
describe one character:

- `unitaryWeight`, a `UnitaryIdealWeight`, is the ideal weight induced by the unitary part: at a
  prime `𝔭 ∤ 𝔪₀` it is the supplier's local component `unitaryPart.finiteComponent 𝔭` at any
  uniformizer of `K_𝔭`, which is the supplier's `unitaryPart.idealCharacter` at `𝔭` by
  `idealCharacter_apply_prime`, and it vanishes at the ideals not prime to `𝔪`. Complete
  multiplicativity fixes it everywhere else, so it is the supplier's ideal character of the unitary
  part, extended by zero at the primes of `𝔪`. ⚠ The value does not depend on the uniformizer:
  two differ by a unit at `𝔭`, on which a character presented at `𝔪` is trivial.
- `infinityType`, an `AlgebraicInfinityType`, is the archimedean restriction: it agrees with the
  supplier's `HeckeCharacter.infinityType` on the identity component, through the supplier's own
  `AgreesOnIdentityComponent` — exactly a witness of `IsAlgebraic` — and on the nose at the real
  places outside `𝔪`, where no sign twist is presented.
- `𝔪` is a modulus of definition: the character is trivial on the finite part of
  `ideleCongruenceSubgroup 𝔪`, the ideles of that subgroup with all archimedean coordinates `1`.
  ⚠ Not on the whole subgroup, which contains the archimedean identity components and would force
  finite order.

*Needs:* Global Number Fields `HeckeCharacter`, `HeckeCharacter.unitaryPart`,
`HeckeCharacter.finiteComponent`, `HeckeCharacter.infinityType`,
`ContinuousInfinityType.AgreesOnIdentityComponent`, `AlgebraicInfinityType.toContinuous`,
`ideleCongruenceSubgroup`; Arithmetic Dirichlet Series `UnitaryIdealWeight`.

**Checks** for `Grossencharacter`:

- `ofRayClassCharacter` of the trivial character of `Modulus.one K` has the trivial Hecke character,
  weight `1` on nonzero ideals, infinity type `0` and shift `0`;
- `ratNormPow m` has supplier shift `-m`, ideal-side shift `m`, and L-function `ζ(s - m)`; with the
  supplier's shift in the prime-idele equation `χ(π_p) = p^m` would force `χ_u(p) = p^(2m)`, which
  is not unitary;
- the angular characters of `ℚ(i)` have exponents `-2k` and `2k`, so for `k ≠ 0` they are of
  infinite order and have no ray-class presentation;
- non-example: `normCharacter K t` with `t ≠ 0` is not algebraic (`not_isAlgebraic_normCharacter`),
  so it has no presentation; an interface that accepted it would need the real frequency `t` in its
  gamma shifts.

The real shift is not a field: `Grossencharacter.idealShift` is the negative of the supplier's
`HeckeCharacter.shift` of the primary object. There is no finite-character field. A ray-class
character of `𝔪` presents the character exactly in the finite-order case, `exists_rayClassCharacter_of_isFiniteOrder`; then
the weight is the ray-class weight of Layer 5 (`unitaryWeight_eq_rayClassIdealWeight`), the
infinity type is zero (`infinityType_eq_zero_of_isFiniteOrder`) and the shift is zero
(`idealShift_eq_zero_of_isFiniteOrder`, closed by the supplier's `shift_ofRayClassCharacter`). ⚠ An
infinite-order character has no ray-class presentation at any modulus: the angular characters of
`ℚ(i)` below are unramified and nontrivial, and the only ray-class character of the trivial
modulus of `ℚ(i)` is trivial. Prove that a ray-class character has a presentation whose three
pins are the supplier's `HeckeCharacter.ofRayClassCharacter`, `rayClassIdealWeight` and the zero
infinity type (`exists_ofRayClassCharacter`), take `ofRayClassCharacter` to be it (it is unique
by `Grossencharacter.ext`), and prove that its L-function is the ray-class L-function of Layer 5.

*Needs:* `Grossencharacter`; Global Number Fields `HeckeCharacter.ofRayClassCharacter`,
`isFiniteOrder_iff_exists_rayClassCharacter`, `shift_ofRayClassCharacter`,
`HeckeCharacter.toUnitaryIdealWeightAt`; Layer 5 `rayClassIdealWeight`, `heckeLFunctionC`.

**The sign of the shift.** The supplier already fixes it: the Global Number Fields README defines
`HeckeCharacter.shift` by `|χ| = ‖·‖^shift`, and Tau Ceti implements exactly that
(`HeckeCharacter.norm_apply_eq_rpow_shift`, with `shift_normPow` and unitary part
`χ ‖·‖^(-shift)`). This roadmap's L-functions are
written in the ideal-side convention `χ = χ_u N^σ`, fixed at a prime idele by
`toHeckeCharacter_primeIdele`: `χ(π_𝔭) = χ_u(𝔭) N𝔭^σ`. Since `‖π_𝔭‖ = N𝔭⁻¹`, that `σ` is
the **negative** of the supplier's shift, and it is introduced as such:
`Grossencharacter.idealShift := -toHeckeCharacter.shift`. Every formula below with `s - shift`
— the coefficients `lFunctionC_eq`, the recentering in the definition of `completed`, the polar divisors of
`completed_one_sub` — reads the ideal-side shift; the inverse presentation has ideal-side shift
`-σ` and the angular characters have `0`. ⚠ The supplier's shift in its place makes the
prime-idele equation false at once: `‖·‖` over `ℚ` has shift `1` and trivial unitary part, and the
equation would read `1/p = p`. The integral norm powers of `ℚ` are presented by name
(`ratNormPow m`, the presentation at the modulus `∞` of the idele class character `‖·‖^(-m)`,
which exists by `exists_ratNormPow`), with supplier shift
`-m` (`ratNormPow_shift`), ideal-side shift `m` (`ratNormPow_idealShift`), and L-function
`ζ(s - m)` (`lFunctionC_ratNormPow`).

*Needs:* Global Number Fields `HeckeCharacter.shift`, `HeckeCharacter.norm_apply_eq_rpow_shift`,
`narrowModulus`, `ideleNorm`.

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
value is `((3+4i)/5)^(-2k)`, unequal for `k ≠ 0` since `(3+4i)/5` is not a root of unity; a
real-valued or finite-order example cannot see
the inversion, because for those the two laws coincide. ⚠ The relation holds only for
`a ≡ 1 mod* 𝔪`: for other `a` the two sides differ by the finite character of
`(𝓞/𝔪₀)ˣ × {±1}^𝔪∞` that the relation determines, and a relation quantified over all `a` leaves
only the unramified characters. Keep unitary and full weights separate: a law mixing a unitary
ideal factor with a nonunitary archimedean factor is false when the shift is nonzero.

*Needs:* `Grossencharacter` and `toHeckeCharacter_primeIdele`; Global Number Fields `IsCongrOne`
and `idealCharacter_apply_toPrincipalIdeal`.

**The theta kernel (Neukirch VII (6.1)–(6.4), (7.4)–(7.8), (8.2)–(8.5)).** Derive Hecke's finite
character from the primary object instead of storing it: `χ_f(a) := χ_u((a)) N(a)^shift · χ_∞(a)`
(`finiteCharacter`), where `χ_∞` is the **full archimedean value** `archimedeanValue` — the
algebraic `∏_τ τ(a)^(n_τ)` times, at each real place, the sign `sgn(τ_w a)^(ε_w - n_w)` by which
the actual parity of the archimedean restriction differs from the parity of the algebraic
exponent, trivial outside `𝔪∞` by `realParity_eq`. ⚠ The algebraic exponents alone miss the sign:
the odd character mod `4∞` of `ℚ` has exponent `0` and parity `1`, so its finite character must be
`-1` at `-1`, matching the harmonic polynomial `x^1` there; built without the sign it would be even,
the unit compensation would read `-1 = 1`, and the odd theta series would vanish by pairing `a`
with `-a`, whereas with the sign the kernel over `ℤ` is Riemann's odd theta function
`2 ∑ χ₄(n) n e^{-π y n²}`. The algebraic infinity-type convention is kept: finite-order
odd characters keep exponent `0`. So defined, `χ_f` is `1` on `a ≡ 1 mod* 𝔪` by the unit relation,
multiplicative, zero exactly off the elements prime to `𝔪₀`, and — because the signs are exactly
what `archimedeanValue` strips — on nonzero elements a function of the residue mod `𝔪₀` alone
(`finiteCharacter_residue`). This is Neukirch's `χ_f = χ((a)) χ_∞(a)⁻¹` of (6.1), whose modulus is
a finite ideal and whose `χ_∞` is the whole archimedean character, and it is the finite character
of the unitary part; extend it multiplicatively to the fractions prime to `𝔪₀` (`finiteCharacterK`,
on the supplier's `primeToSubgroup`). The residue character of `(𝓞/𝔪₀)ˣ` itself is
`residueCharacter`, Mathlib's `MulChar` of `𝓞/𝔪₀`, unique with the value of `χ_f` at every nonzero
element (`existsUnique_residueCharacter`); it is what the Gauss sum
evaluates. ⚠ Keep the two apart. The coefficient `finiteCharacter` is `0` at the element `0`
since `(0)` is not prime to `𝔪`, the value the twisted theta series needs; at conductor one the residue
ring has one element, a unit, where the residue character is `1`, so the coefficient does not
descend to the residue ring through `0`. Conductor-one characters, the trivial one and the
Dedekind zeta function among them, stay in the programme. Read the harmonic polynomial `N(a^p)`
off the infinity type of the unitary part with the sign of the unit relation: `x^(ε_w)` at a real
place, `ε_w` the parity of the archimedean restriction, and at a complex place of angular frequency
`k_w = n_τ - n_τ̄` the monomial `conj(z)^(k_w)` for `k_w ≥ 0` and `z^(-k_w)` for `k_w < 0`
(`harmonicFactor`), with per-place degree `P_w` (`harmonicExponent`) and total degree `Tr(p)`
(`harmonicDegree`). Prove
Hecke's lemma: the polynomial times the Gaussian is a Fourier eigenfunction up to `(-i)^(Tr p)`
and the weights `y_w^(-P_w)` (`mixedFourier_harmonicFactor_mul_archGaussian`). Define the twisted
theta series `θ_χ(𝔞, y) = ε(χ) + ∑_{a ∈ 𝔞} χ_f(a) N(a^p) e^{-π ∑ y_w |a_w|²}` over a fractional
ideal (`heckeTheta`), where the constant `ε(χ)` (`heckeEpsilon`) is `1` exactly when the finite
conductor `𝔣₀`, the supplier's `toHeckeCharacter.finiteConductor`, is `1` and `Tr p = 0`: it is
the residue character at the class of `0` times the polynomial at `0`. ⚠ The finite conductor,
not the whole `primitiveConductor`: a real place divides the latter whenever the parity of the
archimedean restriction differs from that of the algebraic exponent, which happens for the odd
norm powers of `ℚ`, unramified at `∞`, with a constant polynomial. Prove (8.2):
the archimedean weight `N(x^(p/2))` (`archWeight`) times the
theta series is invariant under the unit action, because `χ_f(u) N(u^p) = ∏_w |u_w|^(P_w)` on a
unit (`finiteCharacter_mul_harmonicFactor_unit`). Define the Mellin kernel (8.3) with its constants
made explicit (`heckeMellinKernel`): the product of `(2^r₂/w) · 2^(-(∑ P_w)/2) · λ_𝔞^(-Tr p / 2n)`,
the sum over the complex places, with `∫_D N(x^(p/2)) θ_χ(𝔞, x (u/λ_𝔞)^(1/n)) d*x`, where
`λ_𝔞 = V_𝔞² N(𝔣₀)`; the constants come from the gamma
integral of the weighted Gaussian at a complex place,
`2^(2s + P/2 - 1) Γ_ℂ(2s + P/2) |z|^(-4s - P)`, whose `|z|^(-P)` cancels the `|a_w|^(P_w)` of
`χ_f(a) N(a^p) = χ_u((a)) ∏_w |a_w|^(P_w)` — that
cancellation is why the gamma shifts of the card are `ε_w` and `|k_w|/2`. Prove the per-class
Mellin identity `Λ(𝔎, χ_u, s) = χ_u(𝔞)⁻¹ ∫ (f_D(χ, 𝔞, u) - ε(χ) a₀) u^((s + Tr p/n)/2) du/u`
(`unitaryPartialCompletion_eq_mellin`), sum it over a system of representatives prime to the
conductor into the total kernel `F_D(χ, ·)` (`heckeMellinTotal`, independent of the
representatives) with `Λ(χ_u, s) = ∫ (F_D(χ, u) - a₀(χ)) u^((s + Tr p/n)/2) du/u`
(`unitaryCompletion_eq_mellin`), and prove (8.4):
`F_D(χ, 1/u) = W(χ) u^(1/2 + Tr p/n) F_{D⁻¹}(χ⁻¹, u)` (`heckeMellinTotal_inv`), with exponential decay to the constant term. That law
is what pins `rootNumber`; the instance `grossencharacterFEPair` of the Mellin principle, of
weight `1/2 + Tr p/n` and `ε = W(χ)`, takes its local integrability from the continuity of the total
kernel (`continuousOn_heckeMellinTotal`), its law from (8.4), its rapid decay from the exponential
decay and `ε ≠ 0` from `|W(χ)| = 1`. It continues the unitary completion
(`grossencharacterFEPair_completed`: Mathlib's `hasMellin` when `Tr p = 0`, and its strong-pair
form when `Tr p > 0`, where both constants vanish) and proves its functional equation, and the full
completion follows by recentering.

*Needs:* for `finiteCharacter` and `residueCharacter`, `compatibility`, `archimedeanValue`, Global
Number Fields `primeToSubgroup` and Mathlib `MulChar`; for `harmonicFactor` and Hecke's lemma,
Layer 1 `archGaussian` and `mixedFourier`; for `heckeTheta` and `heckeMellinKernel`, Layer 1
`unitScale`, `surfaceHaar`, `IsUnitFundamentalDomain` and Mathlib
`mixedEmbedding.covolume_idealLattice`; for (8.4) and `grossencharacterFEPair`, Layer 1
`latticeTheta_inv`, `FEPairWithLevel` and `Λ_eq`, and Layer 5 `gaussSum`.

**Checks** for `finiteCharacter`, `residueCharacter` and `harmonicFactor`:

- the odd character mod `4∞` of `ℚ`: `χ_f(-1) = -1`, `χ_f(3) = -1`, `χ_f(5) = 1`, `χ_f(2) = 0`; its
  residue character on `ℤ/4` is `χ₄`; its polynomial is `x` at the real place, `-1` at `-1`, of
  degree `1`, and `χ_f(-1)` times it is `1`; built from the algebraic exponents alone, `χ_f(-1)`
  would be `1`;
- the trivial character of `ℚ` at conductor one: `χ_f(0) = 0` and `χ_f(1) = 1`, while the residue
  character of the one-element ring `ℤ/ℤ` is `1`; a residue character defined through the
  representative `0` would be `0`;
- `ratNormPow m`, `m` odd: `χ_f(n) = |n|^m n^(-m) sgn(n) = 1` at every nonzero integer, and the
  polynomial is constant; with the supplier's shift it would be `|n|^(-2m)`;
- the angular character of `ℚ(i)` with `k > 0`: the one complex place has angular frequency `±4k`,
  the polynomial is `conj(z)^(4k)` or `z^(4k)`, of degree `4k`; a factor read off the sum of the two
  exponents has degree `0`.

**Checks** for `heckeTheta` and `heckeMellinKernel`:

- the trivial character of `ℚ`, `𝔞 = ℤ`: `ε = 1`, `χ_f(0) = 0`, so `θ_χ(ℤ, y) = ∑_{n ∈ ℤ} e^{-π y n²}`,
  Jacobi's `θ(iy)`, and the kernel is `mellinKernel` of `ζ` (`heckeMellinKernel_one`);
- the odd character mod `4∞`: `ε = 0` and the series is `2 ∑_{n ≥ 1} χ₄(n) n e^{-π y n²}`;
  the even character mod `5`: `ε = 0` and the series is `2 ∑_{n ≥ 1} χ₅(n) e^{-π y n²}`, where a
  constant read off the polynomial alone adds `1`;
- the scale `λ_ℤ = 4` of the odd character mod `4∞` puts `4^(s/2)` into the completion, and the
  constant term `ε(χ) a₀` of its kernel is `0`, so its completed L-function has no pole.

**Checks** for `heckeEpsilon` and `heckeScale`:

- the trivial character of `ℚ` at conductor one: `ε = 1`, the constant term of Jacobi's theta, and
  `λ_ℤ = 1`;
- the odd character mod `4∞`: `𝔣₀ = (4)` and `Tr p = 1`, so `ε = 0` on both counts, and
  `λ_ℤ = 1 · 4 = 4`, which puts the conductor power `4^(s/2)` into the completion;
- the even character mod `5`: `Tr p = 0` but `𝔣₀ = (5)`, so `ε = 0`; a constant read off the
  polynomial alone gives `1`;
- `N^m` over `ℚ`, `m` odd: `𝔣₀ = ⊤`, so `ε = 1` and `λ_ℤ = 1`, although `∞` divides the
  presentation conductor; a constant read off `primitiveConductor` gives `0`;
- over `ℚ(i)`, `𝔞 = ℤ[i]` and an unramified character: Mathlib's covolume
  `N(𝔞) 2^(-r₂) √|d_K| = 1 · 1/2 · 2 = 1`, so `λ = 1`, where the covolume of Neukirch's
  normalization, `√|d_K| = 2`, would give `4`.

⚠ The archimedean carrier is the integer-exponent `AlgebraicInfinityType`, not the carrier of a
general Hecke character, and this layer is the theory of algebraic Hecke characters only. An
arbitrary continuous idele-class character has an archimedean part with real frequencies, which
is `ContinuousInfinityType`, and its L-function, kernel and gamma shifts are LFunctions, Part II
(Scope); `normCharacter K t` for `t ≠ 0` is not
algebraic (`not_isAlgebraic_normCharacter`). The imaginary norm twists of Layer 7 act on the
weight, through `imaginaryNormTwist` (the supplier's `UnitaryIdealWeight.normTwist` at `z = -it`), and are not Grossencharacters here; the
finite-order characters of Layer 5 have only `FiniteOrderInfinityType` signs.

Characterize the presented L-function: on `Re s > 1 + shift`, `lFunctionC χ` is the
norm-regrouped series of the presented unitary weight at `s - shift`, that is
`∑ χ_u(𝔞) N𝔞^(shift - s)` over the ideals prime to `𝔪`, with the supplier's Euler factors at
`s - shift`. The conductor `primitiveConductor` has finite part the supplier's
`HeckeCharacter.finiteConductor` of the primary object and infinite part the real places at which
the parity of the archimedean restriction differs from that of the algebraic exponent (the
conductor convention). Prove its universal property: a modulus `𝔫` presents the same Hecke
character exactly when the conductor divides `𝔫` (`primitiveConductor_dvd_iff`; the finite half
is the supplier's `pow_dvd_finiteConductor_iff`, the infinite half `realParity_eq`), so the
conductor, the primitive
presentation `Grossencharacter.primitive`, the completions and the root number are functions of
the Hecke character alone (`_congr`), while the presented series is the primitive series times
`∏_{𝔭 ∣ 𝔪₀, 𝔭 ∤ 𝔣₀} (1 - χ_u(𝔭) N𝔭^(shift - s))`, on the half-plane and as germs.

*Needs:* `Grossencharacter`, `idealShift`; Arithmetic Dirichlet Series `regroupByNorm`,
`EulerProductData`; Global Number Fields `HeckeCharacter.finiteConductor`,
`pow_dvd_finiteConductor_iff`; Layer 3 `eventuallyEq_of_meromorphic_of_eqOn_halfPlane`.

Prove that the inverse presentation exists, with the inverse Hecke character, the conjugate
unitary weight and the negated infinity type (`exists_inverse`), and take `inverse` to be it. If `χ = χ_u N^σ`, then `χ⁻¹ = conj(χ_u) N^(-σ)`,
of shift `-σ`; the functional equation reflects against the inverse, not simply the conjugate.
The full L-function converges for `Re s > 1+σ`.

*Needs:* `Grossencharacter`, `Grossencharacter.ext`; the group structure of Global Number Fields
`HeckeCharacter`.

Build the unitary completion first and define the full completion by recentering:

```text
Λ(χ,s) = Λ_unit(χ,s-σ).
```

Equivalently, with primitive conductor `A`, its conductor power is `A^((s-σ)/2)` and its gamma
factor is evaluated at `s-σ`. Prove the root-number involution, inverse and conjugate comparisons,
canonical primitive reduction, and the completed functional equation.

*Needs:* `grossencharacterData`, `idealShift`, `inverse`, `grossencharacterFEPair_completed`.

The analytic card `grossencharacterData` is the card of the **unitary part**, at the conductor,
and is pinned field by field: coefficients the norm-regrouped primitive unitary weight, conductor
`|d_K| N(𝔣₀)`, one real gamma shift per real place equal to the parity of the archimedean
restriction of the unitary part there — the supplier's `realParity`, ⚠ not the parity of the
algebraic exponent, which `N^m` with `m` odd distinguishes — one complex gamma shift
`|n_σ - n_σ̄|/2` per complex place, and simple poles at `0` and `1` exactly when the unitary
part is trivial. Its completed function and root number are those of
`AnalyticLFunctionData.ofSeries`, and they define `unitaryCompletion` and `rootNumber`; it is a function of the Hecke character alone and satisfies the three
Layer 0 predicates. ⚠ The full completion is not the completed function of an analytic card when the
shift is nonzero: its equation is centered at `1/2 + σ` and reflects against the inverse, whose
shift is `-σ`, not against the conjugate card. The integral norm powers `N^m` show the
consequence: `Λ(N^m, s) = Λ_K(s - m)` has poles at `m` and `1 + m`, so the completed functional
equation is stated pointwise only where the polar divisors of the two unitary cards vanish, read
at `s - σ`, with a germ statement covering every point.

*Needs:* Layer 0 `ofSeries`, `HasDirichletAgreement`, `HasMeromorphicContinuation`,
`HasFunctionalEquation`; Global Number Fields `ContinuousInfinityType`; `primitiveConductor`,
`grossencharacterFEPair_completed`.

### Examples

- the norm power `N^m` over `ℚ` has one real gamma shift `-m` in its full completion and `0` in
  its unitary card;
- over `ℚ(i)` it has one complex gamma shift `-m` in its full completion, not `-2m`;
- the odd modulo-`4` and even modulo-`5` characters agree field-by-field with Layer 5;
- the principal character's canonical primitive card is `dedekindZetaData`, while its presented
  series retains the deleted Euler factors;
- at a real place the gamma shift is the parity of the unitary part, which for `N^m` with `m`
  odd is `0` while the algebraic exponent is odd;
- Hecke's angular characters of `ℚ(i)`, `𝔞 = (α) ↦ (α/|α|)^(4k) = (α/ᾱ)^(2k)`, are the
  infinite-order case. They exist by `exists_angularGrossencharacter`, which fixes the exponent
  `-2k` at one embedding and the ideal-side values on every ideal of the principal ring `ℤ[i]`;
  the unit relation then fixes the other exponent and the shift. Their idelic archimedean component is the inverse, `z ↦ (z/|z|)^(-4k)`, so
  the algebraic infinity type has exponent `-2k` at the embedding through which the ideal value is
  read and `2k` at its conjugate; the two exponents
  **sum** to zero — the character is unitary and its shift vanishes — and **differ** by `4k`.
  Their card has no real gamma factor, one complex gamma factor shifted by `2|k|`, conductor `4`,
  degree two, and, for `k ≠ 0`, no pole. ⚠ The shift is `2|k|`, half the angular frequency: an
  interface that stores only a weight, or that adds the conjugate exponents, records `0` for every
  `k` and cannot tell these characters apart from the trivial one. This is the acceptance test
  that a finite character family cannot supply;
- the nonreal sign test: at `a = 2 + i` the finite value `((3+4i)/5)^(2k)` of the angular character
  is not real and is the inverse, not the equal, of the archimedean value;
- the real sign test: for the odd character mod `4∞` at the unit `-1`, `χ_f(-1) = -1`, the harmonic
  polynomial is `-1`, their product is `1`, and the theta kernel over `ℤ` is Riemann's odd theta
  function; a finite character built from the algebraic
  exponents alone fails it;
- the conductor-one residue test: for the trivial character of `ℚ` at conductor one the
  coefficient `finiteCharacter` is `0` at `0` and `1` at `1`, the two have the same residue in
  `𝓞/𝓞`, and the residue character is `1` there; a
  descent of the coefficient to the residue ring that includes `0` fails it;
- the theta-constant test: for odd `m` the norm power `N^m` of `ℚ` (`ratNormPow m`, the idele
  class character `‖·‖^(-m)` at the modulus `∞`) has presentation conductor `∞` — the parity
  mismatch, although `‖·‖^(-m)` is unramified at `∞` — but finite conductor `⊤`, a
  constant polynomial, and finite character `1` at every nonzero integer, so `ε = 1`, its theta
  series is Jacobi's `θ(iy) = ∑_{n ∈ ℤ} e^{-π y n²}` with the constant term, its kernel is the
  Riemann kernel `mellinKernel`, and its constant is `1/2`. An `ε` read
  off the whole conductor fails it — the total kernel becomes `(θ(iu) - 1)/2`, against theta
  inversion — and so does the supplier's shift in place of the ideal-side one, under which the
  finite character is `|n|^(-2m)`.

### Dependencies

Global Number Fields: `HeckeCharacter` with `shift`, `unitaryPart`, `infinityType`,
`finiteConductor`, `finiteComponent`, `idealCharacter`, `ofRayClassCharacter` and
`isFiniteOrder_iff_exists_rayClassCharacter`; `ContinuousInfinityType`, `AlgebraicInfinityType`
with `toContinuous`, `ideleCongruenceSubgroup`, `IsCongrOne`, `primeToSubgroup`, `ideleNorm`,
`narrowModulus`. Arithmetic Dirichlet Series: `UnitaryIdealWeight`, `normCoeff`, `EulerProductData`.
Layer 0 (`ofSeries`), Layer 1 (`archGaussian`, `mixedFourier`, the unit fundamental domains,
`FEPairWithLevel`), Layer 3 (`mellinKernel`, the uniqueness theorems), Layer 5
(`rayClassIdealWeight`, `heckeLFunctionC`, `gaussSum`).

## Layer 7: intrinsic nonvanishing

Specialize `ArithmeticDirichletSeries.landau` to the finite-order Hecke family. Prove the
`3-4-1` nonnegative coefficient combination and use it to show that a nontrivial primitive
finite-order Hecke L-function has no zero on `Re s = 1`.

*Needs:* Arithmetic Dirichlet Series `landau`; Tau Ceti `TauCeti.LSeries.ne_zero_of_threeFourOne`;
Layer 5 `PrimitiveRayClassCharacter`, `heckeLFunctionC` and its continuation.

The two hypothesis packages keep their assumptions visible rather than hiding them in this
specialization. The finite-family package is indexed by a finite commutative character group, is closed
under products and conjugation, and requires cancellation of every norm twist of each
**nontrivial** member. Its identity law applies only to good ideals, where good explicitly includes
`I ≠ ⊥`. `UnitaryCancelling` treats one possibly infinite-order unitary character: it excludes pure
norm twists and allows the square of each boundary twist either to be another norm twist or to
cancel. Requiring the square always to cancel incorrectly excludes quadratic characters; requiring
the trivial member's nonzero norm twists to cancel makes the finite-family package uninhabitable.

*Needs:* Arithmetic Dirichlet Series `HasCancellation`, `UnitaryIdealWeight.normTwist`,
`IsNormTwistOnGood`.

**Checks** for `UnitaryCancelling` and the finite-family package:

- the weight of `χ₄` over `ℚ`: it cancels, every norm twist of it cancels, and its square is the
  trivial weight on good ideals, a norm twist, so it satisfies the package through the
  square-twist alternative; a package requiring the square to cancel rejects it;
- the trivial weight, and every `N^(it)`, is a pure norm twist and is excluded: its series is a
  translate of `ζ_K` with a pole on `Re s = 1`, so no cancellation premise can hold for it;
- the two characters modulo `4`, as a finite family: the trivial member's twists are not required
  to cancel (its partial sums grow like `x/2`), and its identity law holds at odd ideals only,
  where good includes `I ≠ ⊥`; requiring `1` at the ideal `(2)` fails, since the weight is `0`
  there.

At the boundary point `1 + it` of a unitary character `χ_u` the `3-4-1` argument pairs
`L(s, χ_u)` at `1 + it` with the companion `L(s, χ_u²)` at `1 + 2it`. Either `χ_u²` cancels
(the square-twist alternative of `UnitaryCancelling` with cancellation), the companion is then
continuous at `1 + 2it`, and the pinned criterion `TauCeti.LSeries.ne_zero_of_threeFourOne`
applies; or `χ_u²` is trivial on good ideals and the companion is `ζ_K` with finitely many Euler
factors deleted. For `t ≠ 0` that companion is continuous at `1 + 2it` and the criterion still
applies. For `t = 0` the companion has the zeta pole at `1` itself, the orders are
`-3 + 4 - 1 = 0`, and the `3-4-1` bound excludes nothing: this is the exceptional quadratic case,
and it cannot be discarded by an invalid cancellation. Prove it by Landau's argument. For a
Grossencharacter with `χ_u` of order two, `L(s, χ_u)` continues to an entire function (Layer 5, as
the L-function of a nontrivial finite-order Hecke character, Neukirch VII (8.5)); if
`L(1, χ_u) = 0` then `ζ_K(s) L(s, χ_u)` is entire. Its Dirichlet coefficient at `𝔠` is
`∑_{𝔞𝔟 = 𝔠} χ_u(𝔟)`, which is multiplicative, equal at `𝔭^k` to `k + 1`, to `1` or `0` by the
parity of `k`, or to `1`, according as `χ_u(𝔭)` is `1`, `-1` or `0`; so it is nonnegative and
at least `1` at every square ideal. By `ArithmeticDirichletSeries.landau` the series then converges
at every real `s`, and for real `s > 1/2` it is at least `ζ_K(2s)`, which tends to infinity as
`s → 1/2⁺`, against continuity of the entire function at `1/2`. A cancellation hypothesis alone
does not supply this step: it continues the series of a weight only to `Re s > 1 - 1/[K:ℚ]`, which
for `[K:ℚ] ≥ 2` does not contain `s = 1/2`. State the
Grossencharacter boundary as `Re s = 1+shift` and reduce it to the unitary statement by
recentering.

*Needs:* Layer 3 `dedekindZetaC` and its pole; Layer 5 `differentiable_completedHeckeLFunction`;
Arithmetic Dirichlet Series `landau`; `lFunctionC_eq`.

Keep nonvanishing in meromorphic-order form at poles: `dedekindZetaC K` has order `-1` at `1` and
order `0` at `1+it` for `t ≠ 0`; a nontrivial family member has order `0` for every real `t`.
Construct the `UnitaryCancelling` premise for every Grossencharacter outside the pure-norm-twist
exception rather than taking that premise as an extra hypothesis.

*Needs:* `meromorphicOrderAt_dedekindZetaC_one`, `Grossencharacter.unitaryCancelling`; Global
Number Fields `rayClassCharacter_partialSums`.

Apply this to the angular characters of Layer 6: for `k ≠ 0` they are not norm twists, which is
the exception clause of the single-character package, so their L-functions have no zero on
`Re s = 1` unconditionally.

*Needs:* `angularGrossencharacter`, `angularGrossencharacter_not_isNormTwist`,
`Grossencharacter.meromorphicOrderAt_lFunctionC`.

Export the boundary data that a prime-distribution argument takes from an L-function, and stop
there. For a Grossencharacter `χ` whose unitary weight `χ_u` is not a pure imaginary norm twist
on its good ideals, the logarithmic derivative of the continued L-function
`ArithmeticDirichletSeries.continuedLFunctionOfWeight χ_u` extends continuously to `Re s ≥ 1`
with no residue (`Grossencharacter.exists_continuousOn_logDeriv`). That is a theorem about a
named continued L-function, which is why it belongs here. Route: on `Re s > 1` the continued
L-function of `χ_u` is `lFunctionC χ (s + idealShift)`, by `lFunctionC_eq` and Tau Ceti's
`continuedLFunctionOfWeight_eq_LSeries`; it is holomorphic on `Re s ≥ 1` under the premise
`Grossencharacter.unitaryCancelling` (Tau Ceti's `differentiableAt_continuedLFunctionOfWeight`),
and zero-free there by `Grossencharacter.meromorphicOrderAt_lFunctionC`, including the
exceptional quadratic case above, the finitely many deleted Euler factors being nonzero on
`Re s ≥ 1`; the quotient `-L'/L` is then continuous on the closed half-plane. The theorem is not
stated for an arbitrary unitary weight satisfying `UnitaryCancelling`: the ideal Liouville
weight `λ_K(𝔭) = -1` of a field of degree `d ≥ 3` has series `ζ_K(2s)/ζ_K(s)`, with a simple zero
at `1`, and nothing in that package excludes it: under the Riemann hypothesis for `ζ_K` its ideal
partial sums are `O(x^(1/2 + ε))` for every `ε > 0`, inside the bound `O(x^(1 - 1/d))` of
`HasCancellation`, and every other field of the package then follows. For the trivial weight the record with
residue `1`, `PrimeBoundaryRemainder K Set.univ 1`, already exists: it is Tau Ceti's
`TauCeti.LFunctions.primeIdealVonMangoldtBoundary`, the datum Arithmetic Dirichlet Series names
and on which its prime ideal theorem is conditional. Consume it, and prove only that its series is
the logarithmic derivative of `dedekindZetaC` on `Re s > 1`
(`primeIdealVonMangoldtBoundary_series_eq`).

*Needs:* `lFunctionC_eq`, `Grossencharacter.meromorphicOrderAt_lFunctionC`; Arithmetic Dirichlet
Series `continuedLFunctionOfWeight_eq_LSeries`, `differentiableAt_continuedLFunctionOfWeight`; Tau
Ceti `TauCeti.LFunctions.primeIdealVonMangoldtBoundary` and `dedekindZetaC_eq`.

⚠ Hecke's angular equidistribution of Gaussian primes is **not** proved here. It is a
prime-distribution theorem: beyond the exports above it needs a Tauberian step and Fourier
analysis on the angular character group, neither of which is owned by this roadmap. What this
roadmap owes such an argument is the analytic input, and that input is named.

This layer proves no zero-free region, no zero counting, and no explicit formula. Those are
downstream uses of the named nonvanishing theorem and completed cards.

### Examples

- `dedekindZetaC ℚ = ζ` has order `-1` at `1` and order `0` at `1 + it` for `t ≠ 0`;
- `L(1, χ₄) = π/4 ≠ 0`: `χ₄` has order two, so this is the exceptional quadratic case, closed by
  Landau's argument and not by the `3-4-1` bound;
- the angular characters of `ℚ(i)` with `k ≠ 0` are not norm twists, so their L-functions have no
  zero on `Re s = 1`.

### Dependencies

Arithmetic Dirichlet Series: `landau`, `HasCancellation`, `continuedLFunctionOfWeight` with
`continuedLFunctionOfWeight_eq_LSeries` and `differentiableAt_continuedLFunctionOfWeight`,
`IsNormTwistOnGood`, `UnitaryIdealWeight.normTwist`, `UnitaryIdealWeight.conj`,
`PrimeBoundaryRemainder`. Tau Ceti: `TauCeti.LSeries.ne_zero_of_threeFourOne`,
`TauCeti.LFunctions.primeIdealVonMangoldtBoundary`. Layer 3 (`dedekindZetaC`), Layer 5
(continuation of a nontrivial finite-order character), Layer 6 (`Grossencharacter`, `lFunctionC`,
`angularGrossencharacter`).

## Layer 8: interoperability and examples

Supply named comparison cards for Riemann zeta, Dedekind zeta, primitive Dirichlet characters,
primitive ray-class characters, and Grossencharacters, whose card is that of the unitary part.
Prove all comparisons with `EqOffZero`, so conductors, gamma factors, root numbers, completions,
polar divisors, and positive-index coefficients are checked together.

*Needs:* Layer 0 `EqOffZero`, `riemannZetaData`; Layer 3 `dedekindZetaData`; Layer 4
`dirichletData`; Layer 5 `heckeData`; Layer 6 `grossencharacterData`.

**Checks** for the comparison cards:

- `dedekindZetaData ℚ` and `riemannZetaData`: one ideal of each norm `n ≥ 1`, conductor `1`, one
  real shift `0`, root number `1`, poles at `0` and `1`; they agree in every field, the coefficient
  at `0` included, since `⊥` is the one ideal of norm `0`; over `ℚ(i)` the coefficient at `5` is
  `2`, the two primes of norm `5`, where a card with coefficients `1` would give `1`;
- `heckeData` of the odd character mod `4∞` and `dirichletData` of `χ₄`: conductor `4`, shift `1`,
  root number `1`; a ray-class card that forgot the real place in the conductor would have shift
  `0`;
- `grossencharacterData` of `ratNormPow m` and `riemannZetaData`: the unitary part is trivial, so
  conductor `1` and real shift `0`, even for `m` odd; a card reading the parity of the algebraic
  exponent would have shift `1`.

Prove two theorems about the prime ideals of `K` that read off `ζ_K`:

- on `Re s > 1`, the norm-regrouped ideal von Mangoldt series is exactly
  `-ζ'_K(s)/ζ_K(s)`, with the summability required by Tauberian consumers; export this as
  `dedekindZeta_logDeriv_eq`, together with the exact positivity input
  `dedekindZeta_idealVonMangoldt_nonneg`, both consumed by name by Zeros of L-functions. Tau Ceti
  proves both for Mathlib's `dedekindZeta` (`hasSum_idealTerm_vonMangoldt`, `vonMangoldt_re_nonneg`
  with `vonMangoldt_im`), so they are closed by citation through the agreement of `dedekindZetaC`
  with `dedekindZeta` on `Re s > 1`; the form for the supplier's own coefficient carrier is Tau
  Ceti's `LSeries_primeVonMangoldtCoeff_univ_eq_deriv_dedekindZeta_div` and is consumed, not
  restated;

  *Needs:* Tau Ceti `hasSum_idealTerm_vonMangoldt`, `IdealArithmeticFunction.vonMangoldt_re_nonneg`,
  `IdealArithmeticFunction.vonMangoldt_im`; Layer 3 `dedekindZetaC_eq`;
- Mertens' product for `K` (`tendsto_prod_one_sub_inv_absNorm_div_log`): as `x → ∞`,
  `∏_{N𝔭 ≤ x} (1 - N𝔭⁻¹)⁻¹ = e^γ κ_K log x · (1 + o(1))`, the product over the nonzero prime
  ideals of `𝓞_K` of norm at most `x`, `γ` Euler's constant and `κ_K = Res_(s=1) ζ_K(s)` the
  residue of `tendsto_sub_one_mul_dedekindZetaC` (Rosen's theorem, in the form of Lebacque,
  *Generalised Mertens and Brauer–Siegel theorems*, Theorem 5 (NF), with `γ_K = γ + log κ_K`).
  No supplier states a reciprocal-prime sum or product over a number field, so this roadmap owns
  it. Route, after Rosen and Lebacque §4.1:
  1. Mertens' first theorem for `K`, `∑_{N𝔭 ≤ x} log N𝔭 / N𝔭 = log x + O(1)`. Evaluate
     `∑_{N𝔞 ≤ x} log N𝔞` twice. Abel summation (`idealSummatory_mul_eq_sub_integral_mul`) against
     the ideal count `TauCeti.isBigO_card_idealsLE_sub` gives `κ_K x log x + O(x)`. Writing
     `log N𝔞 = ∑_{𝔟 ∣ 𝔞} Λ(𝔟)` gives `∑_{N𝔟 ≤ x} Λ(𝔟) #{N𝔞 ≤ x/N𝔟}`, which by the same count is
     `κ_K x ∑_{N𝔟 ≤ x} Λ(𝔟)/N𝔟 + O(x)`: the error terms sum to
     `x^(1 - 1/[K:ℚ]) ∑_{N𝔟 ≤ x} Λ(𝔟) N𝔟^(1/[K:ℚ] - 1) = O(x)` by partial summation from the
     Chebyshev bound `ψ_K(x) = O(x)` (`TauCeti.primeIdealTheorem`). Divide by `κ_K x > 0`
     (`dedekindZeta_residue_pos`); the prime powers `𝔭^k`, `k ≥ 2`, contribute `O(1)`, since at
     most `[K:ℚ]` primes lie over each rational prime.
  2. Partial summation of step 1 gives `∑_{N𝔭 ≤ x} 1/N𝔭 = log log x + B_K + ε_K(x)` with
     `ε_K(x) → 0`, the remainder being `O(1/log x)` plus the tail of an integral that converges
     because the error of step 1 is bounded (Lebacque, Proposition 2, which reaches the same
     expansion from the prime ideal theorem with an error term).
  3. `B_K = γ + log κ_K + ∑_𝔭 (log(1 - N𝔭⁻¹) + N𝔭⁻¹)`: as `δ → 0⁺`, partial summation of step 2
     gives `∑_𝔭 N𝔭^(-1-δ) = B_K - γ - log δ + o(1)`, while the Euler product of `ζ_K` and the
     residue give `log ζ_K(1 + δ) = -log δ + log κ_K + o(1)`; the difference of the two left sides
     tends to `-∑_𝔭 (log(1 - N𝔭⁻¹) + N𝔭⁻¹)` by dominated convergence against `∑_𝔭 N𝔭⁻²`
     (Lebacque, Proposition 3).
  4. Subtracting, `∑_{N𝔭 ≤ x} log (1 - N𝔭⁻¹)⁻¹ = log log x + γ + log κ_K + o(1)`, the tail
     `∑_{N𝔭 > x} |log(1 - N𝔭⁻¹) + N𝔭⁻¹|` being at most `∑_{N𝔭 > x} N𝔭⁻² → 0`; exponentiate.

  *Needs:* Layer 3 `tendsto_sub_one_mul_dedekindZetaC`; Tau Ceti `isBigO_card_idealsLE_sub` and
  `primeIdealTheorem`; Arithmetic Dirichlet Series `idealSummatory_mul_eq_sub_integral_mul` and
  `EulerProductData`; Mathlib `dedekindZeta_residue_pos`, `eulerMascheroniConstant`.

  **Checks.**

  - over `ℚ` it is Mertens' third theorem, `∏_{p ≤ x} (1 - 1/p)⁻¹ ~ e^γ log x`, with `κ_ℚ = 1`;
    a statement that drops `e^γ` (the naive `log x`) fails it, since `e^γ ≈ 1.781`;
  - over `K = ℚ(√-5)`, `h = 2`, `w = 2`, `|d_K| = 20`, `r₁ = 0`, `r₂ = 1`, `R = 1`, so
    `κ_K = 2^(r₁) (2π)^(r₂) h R/(w √|d_K|) = 4π/(2 √20) = π/√5 ≈ 1.405`; omitting the residue passes
    the rational test and is false here;
  - over `ℚ(i)`, `κ = 2π/(4·2) = π/4`, and the product runs over prime ideals, not rational
    primes: it is `(1 - 1/2)⁻¹ · ∏_{p ≡ 1 (4), p ≤ x} (1 - 1/p)⁻²` times
    `∏_{p ≡ 3 (4), p² ≤ x} (1 - 1/p²)⁻¹`, the ramified `(1 + i)` of norm `2` once, two primes of norm `p` for
    `p ≡ 1 mod 4` and one of norm `p²` for `p ≡ 3 mod 4`. This is
    `∏_{p ≤ x} (1 - 1/p)⁻¹ (1 - χ₄(p)/p)⁻¹` up to a factor tending to `1`, so it is
    `~ e^γ L(1, χ₄) log x = e^γ (π/4) log x`, agreeing with `κ = π/4`; a product indexed by norms
    without multiplicity gives a different constant;
  - the direction of the product: `∏ (1 - N𝔭⁻¹)` without the inverse tends to `0` like
    `e^(-γ) / (κ_K log x)`, Lebacque's form of (NF); the ratio in the statement would then tend to
    `0`, not `1`.

### Examples

Add examples over `ℚ`, `ℚ(i)`, and a real quadratic field. Each example must exercise a convention
that is invisible in the easiest case: an odd real gamma factor, a complex-place multiplicity, a
nontrivial dual, or an imprimitive Euler factor.

### Dependencies

Layers 0 and 3 to 6 (the cards). Mathlib: `riemannZeta`, `completedRiemannZeta`. Tau Ceti:
`hasSum_idealTerm_vonMangoldt`, `IdealArithmeticFunction.vonMangoldt_re_nonneg`,
`LSeries_primeVonMangoldtCoeff_univ_eq_deriv_dedekindZeta_div`. Mertens' product: Layer 3
(`tendsto_sub_one_mul_dedekindZetaC`), Tau Ceti `isBigO_card_idealsLE_sub` and
`primeIdealTheorem`, Arithmetic Dirichlet Series `idealSummatory_mul_eq_sub_integral_mul` and
`EulerProductData`, Mathlib `dedekindZeta_residue`, `dedekindZeta_residue_pos` and
`eulerMascheroniConstant`; Lebacque, Theorem 5 (NF) and Propositions 2–3.

## Downstream consumers

### Zeros of L-functions

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

### Prime distribution

A prime-distribution consumer — the `ψ → ϑ → π` transfer of Arithmetic Dirichlet Series, or a
Frobenius count in Chebotarev — takes its analytic input as named declarations, and no
prose-level promise:

```text
TauCeti.LFunctions.primeIdealVonMangoldtBoundary
primeIdealVonMangoldtBoundary_series_eq
Grossencharacter.exists_continuousOn_logDeriv
```

The first is Tau Ceti's record `PrimeBoundaryRemainder K Set.univ 1` on which the supplier's
`primeIdealTheorem_of_boundary` is explicitly conditional: residue `1` from the simple pole of
`ζ_K`, and a continuous remainder across `Re s = 1` that exists because `ζ_K` has no zero there.
It is consumed here, not rebuilt; the second identifies its series with the logarithmic
derivative of the named continuation `dedekindZetaC` on `Re s > 1`. The third is the twisted
counterpart, and the one this roadmap supplies: for a Grossencharacter whose unitary weight is
not a pure imaginary norm twist on its good ideals, the logarithmic derivative of the continued
L-function of that weight extends continuously to `Re s ≥ 1` with no residue. It is stated for
genuine Grossencharacters and not for every unitary weight satisfying `UnitaryCancelling`: that
package continues the series only to `Re s > 1 - 1/[K:ℚ]`, and the exceptional quadratic case
needs the continuation of Layer 5 (see Layer 7). Hecke's angular equidistribution of Gaussian
primes is a consumer of the third together with `angularGrossencharacterData`; it needs a Tauberian step and Fourier analysis on the angular
character group, so it is a prime-distribution theorem and is not proved here.

## References

- E. Hecke, *Lectures on the Theory of Algebraic Numbers*.
- J. Neukirch, *Algebraic Number Theory*, Chapters VI and VII. Chapter VII is cited by number:
  (1.4) the Mellin principle; (3.6) the theta transformation; (5.3)–(5.9) the unit quotient, the
  fundamental domain and its volume, the Mellin kernel, its transformation law and the functional
  equation of the partial zeta functions; (5.11) the order and leading coefficient of `ζ_K` at
  `s = 0`; (6.1)–(6.4) Größencharaktere, the finite character and
  the Gauss sum; (6.13)–(6.14) the correspondence with idele class characters and the sign of the
  archimedean component; (7.4)–(7.8) the theta series with a harmonic polynomial and its
  transformation; (8.2)–(8.6) the Hecke L-series as a Mellin transform, its transformation law,
  root number and functional equation.
- H. Iwaniec and E. Kowalski, *Analytic Number Theory*, Chapters 3 and 5.
- P. Lebacque, *Generalised Mertens and Brauer–Siegel theorems*, Acta Arith. (2007)
  (arXiv:math/0703570), Theorem 5 (NF), and Propositions 2 and 3 of §4.1 (pp. 8–9): Mertens'
  product over a number field and the expansion of `∑ 1/N𝔭`, due to M. Rosen,
  *A generalization of Mertens' theorem*, J. Ramanujan Math. Soc. 14 (1999).
- D. Loeffler and M. Stoll, *Formalizing zeta and L-functions in Lean*.
