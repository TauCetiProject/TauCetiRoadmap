# Roadmap: L-functions — completions and functional equations

This roadmap develops the analytic theory of the principal L-functions attached to number
fields. It starts with a normalization-conscious record for completed L-functions, proves the
Poisson and theta identities used in Hecke's method, constructs the continued Dedekind zeta and
Hecke L-functions, and packages conductors, root numbers, and Grossencharacters.

Two neighbouring roadmaps deliberately own the reusable substrate. Arithmetic Dirichlet Series
owns ideal weights, norm regrouping, Euler products, density, summation, and Tauberian methods.
Global Number Fields owns moduli, ray class groups, ray class characters, and the Hecke-character
carrier. This roadmap consumes those declarations and owns the analytic presentations,
completions, and functional equations attached to them.

Suggested home: `TauCeti/NumberTheory/LFunctions/`, divided into `Data/`, `Theta/`,
`DedekindZeta/`, `Dirichlet/`, `Hecke/`, and `Grossencharacter/`.
[`Suggested.lean`](Suggested.lean) pins the most important declaration shapes; it is not an
exhaustive checklist. Dated provenance records are maintained privately and are non-normative.

## Scope and ownership

### Owned here

- analytic- and arithmetic-normalized completed L-function records and their duals;
- conductor, gamma-shift, degree, root-number, polar-divisor, and normalization conventions;
- Poisson summation and Gaussian theta transformations needed by Hecke's method, together with
  the single theorem that fixes the additive character, the self-dual measure, the Fourier sign,
  the discriminant factor and both archimedean factors at once;
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
AlgebraicInfinityType
FiniteOrderInfinityType
rayClassIdealMainTerm
```

The character carrier is therefore available without importing Class Field Theory. Reciprocity
and class fields are not used merely to restate a Hecke character.

### Not owned here

- generic ideal-series operations, Euler-product calculus, norm regrouping, logarithmic
  derivatives, density predicates, Abel/Perron summation, Landau, or Wiener--Ikehara
  (`ArithmeticDirichletSeries`);
- moduli, ray classes, adeles, ideles, and Hecke-character carriers (`GlobalNumberFields`);
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
| `GlobalNumberFields.integralIdealsPrimeTo` and `idealClass` | the ray class of an ideal, on the carrier that already contains the coprimality proof. ⚠ There is no total `idealClass` on `Ideal (𝓞 K)`: the class indicator and the ray-class weight are defined through this carrier, never through a junk class at a bad ideal |
| `GlobalNumberFields.RayClassCharacter` | finite-order Hecke L-functions |
| `RayClassCharacter.induced` and `.IsPrimitive` | the primitive-character carrier, its universal property, and the imprimitive Euler-factor correction |
| `GlobalNumberFields.rayClassCharacter_partialSums` | continuation of nontrivial ray-class L-functions to a strip containing `Re s = 1` |
| `GlobalNumberFields.rayClassIdealMainTerm` and `rayClassIdealMainTerm_eq` | the common residue of the partial zeta functions. The supplier owns its closed form — the Dedekind-zeta residue times the Euler factors at the primes dividing the finite modulus, divided by the ray class number — and this roadmap proves that the analytic residue is that same constant, rather than introducing a second one |
| `GlobalNumberFields.HeckeCharacter` | the unique idelic carrier presented by Grossencharacter analytic data |
| `HeckeCharacter.ofRayClassCharacter` | comparison of the finite-order and general constructions |
| `HeckeCharacter.shift` and `.unitaryPart` | recentering a nonunitary L-function at its real shift |
| `GlobalNumberFields.AlgebraicInfinityType` | algebraic infinity types and their gamma shifts. ⚠ This is the integer-exponent carrier, the one Grossencharacter data uses; the general `ContinuousInfinityType` of an arbitrary Hecke character has complex archimedean exponents, and the finite-order characters of Layer 5 have only `FiniteOrderInfinityType` signs |

`rayClassIdealCount` is arithmetic input to Chebotarev, not to this roadmap. Its omission from the
table is a boundary check.

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
| ray-class coefficients | every ray-class coefficient carries coprimality to the finite modulus, so every such series is missing the Euler factors at the primes dividing it. `finiteEulerCorrection 𝔪 s = ∏_{𝔭 ∣ 𝔪₀} (1 - N𝔭^(-s))` is the single name for those factors, and it is `1` only for a trivial finite part. |
| primitive scope | a primitive conductor, root number, completion, Gauss sum, or card takes `PrimitiveRayClassCharacter`, which carries the conductor and the primitivity proof together. A presentation level is never stored as an arithmetic conductor, and a character never carries two conductors. |
| imprimitive series | retain the presented L-series and a finite Euler-factor correction to the canonical primitive series; do not manufacture a second completed card. |
| Hecke shift | the shift is real, and the full completion is defined by recentering the unitary completion at `s-shift`. |
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
Prove existence, uniqueness, degree invariance, and equivalence of the two functional equations.
The coefficient translation is stated only for `n ≠ 0`; the analytic target stores its own zero
proof, while the arithmetic source inherits the convention from its card. Consequently
`existsUnique` cannot be applied to a malformed source with nonzero zeroth coefficient, and the
weight-zero comparison remains an exact equality of cards rather than merely `EqOffZero`.

Mandatory tests:

- weight zero gives the identity translation;
- the weight-12 discriminant form has analytic complex gamma shift `+11/2`, not `-11/2`;
- the Riemann-zeta card has degree one, conductor one, root number one, and simple poles at zero
  and one;
- a non-real character uses a genuinely distinct dual card.

### Layer 1: Poisson summation and theta transformation

For a full `ℤ`-lattice in a finite-dimensional real inner-product space, develop the Fourier
transform of a Gaussian and prove Poisson summation for Schwartz functions. Include translation,
scaling, covolume, dual-lattice, biduality, and product formulas needed by number fields.

Fix the analytic conventions once, as data rather than as prose. The additive character is
Mathlib's `Real.fourierChar`, so `𝐞 x = exp(2 π i x)`; the pairing is the Euclidean `mixedInner`,
not the trace form; the measure is `volume`, which is self-dual for that pairing; and the sign is
Mathlib's, `𝐞(-⟨x, y⟩)`. `mixedFourier` is the transform built from exactly those four choices,
and every later normalization is a consequence of them.

For the mixed embedding of a fractional ideal, compare the Euclidean dual with the trace dual.
The comparison map is the identity on real coordinates and `z ↦ 2 conj z` on complex coordinates.
One complex coordinate has real determinant `-4`, so the absolute determinant is `4`; the global
absolute determinant is `4^r₂`. The covolume itself is Mathlib's
`NumberField.mixedEmbedding.covolume_idealLattice`, equal to `N(I) 2^(-r₂) sqrt|d_K|`; this
roadmap consumes that computation rather than restating it, and checks it at `K = ℚ(i)`, where
the ring of integers has covolume one.

Use Poisson summation to prove the Gaussian theta transformation, including the level, epsilon
scalar, and constant terms. Package the Mellin transform as a functional-equation pair with level;
the `epsilon` field occurs explicitly in its transformation law. The holomorphic
upper-half-plane theta function and its modular transformation belong to the Integral Lattices
roadmap; only the real-parameter Gaussian theta needed by Hecke's method is owned here.

**One normalization theorem.** The functional equation depends on the additive character, the
self-dual measure, the Fourier sign, the discriminant factor, the factor `2` inside
`Gammaℂ s = 2 (2π)^(-s) Γ(s)`, and the archimedean shifts. Scattered remarks about those choices
do not prevent a factor-of-two or an inverse-discriminant error, so they are collected into the
single theorem `gaussianTheta_mellin_normalization`: the Gaussian is self-dual for `mixedFourier`
with the factor `t^(-[K:ℚ]/2)`; the theta series of an ideal lattice transforms with that factor
and the covolume; the completed zeta is the Mellin transform `∫ θ t * t^s dt/t`, the same Mellin
convention as `exists_mellin_completedHeckeLFunction`; and the completed zeta carries exactly
`|d_K|^(s/2)`, `Gammaℝ(s)^r₁` and `Gammaℂ(s)^r₂`.

Two worked checks are mandatory, and neither is redundant.

- `K = ℚ`: `completedDedekindZeta ℚ` is Mathlib's `completedRiemannZeta` off the poles at `0` and
  `1`. This fixes the real gamma factor and conductor one.
- `K = ℚ(i)`: `|d| = 4` and `r₂ = 1`, so `4^(s/2) Gammaℂ(s) ζ_{ℚ(i)}(s)` must equal
  `2 π^(-s) Γ(s) ζ(s) L(s, χ₋₄)` on `Re s > 1`, by Legendre duplication against the quadratic
  factorization. ⚠ Dropping the factor `2` in `Gammaℂ`, or writing the conductor power as
  `|d|^(-s/2)`, changes this constant, and the rational check sees neither error.

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

Name that product once, as `finiteEulerCorrection`, and use the same name everywhere it recurs:
in the trivial-character L-function of Layer 5, in the imprimitive comparisons, and in the
residue. Equality with `ζ_K` holds exactly when the finite part is trivial, which is the separate
class-group statement below; a modulus with one prime in its support already breaks it, and that
is a required rejection test.

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

Apply the theta transformation to partial zeta functions to construct `dedekindZetaC K` and
`completedDedekindZeta K`. Prove:

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
`ArithmeticDirichletSeries.UnitaryIdealWeight` from `idealClass`, using value zero on the zero ideal and
at primes dividing the finite part. Pin both values as theorems: the weight of an ideal prime to
the modulus is the character of its ray class, read through the supplier's prime-to carrier, and
the weight vanishes elsewhere. Define the presented `heckeLFunctionC χ` and prove its agreement
with the shared norm-regrouped series and Euler product on `Re s > 1`.

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
character through `Re s = 1`. Build the theta and Mellin presentation for a primitive character,
evaluate the Gauss sum, and define its conductor, gamma factors, completion, and root number.
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

### Layer 6: general Hecke characters and Grossencharacters

Consume `GlobalNumberFields.HeckeCharacter K`, its real shift, unitary part, and infinity type.
Define a `Grossencharacter` as analytic presentation data for that carrier, not as a second Hecke
character. Its fields include the unitary ideal weight, real shift, finite character, local
archimedean parameters, and one compatibility law for the full character. Keep unitary and full
weights separate: a law mixing a unitary ideal factor with a nonunitary archimedean factor is
false when the shift is nonzero.

The archimedean parameter is the supplier's `AlgebraicInfinityType`, the integer-exponent carrier
`x ↦ ∏ σ, σ(x)^(n σ)`, with the shift carried separately. ⚠ It is not the carrier of a general
Hecke character: an arbitrary continuous idele-class character has complex archimedean exponents,
which is `ContinuousInfinityType`, and the finite-order characters of Layer 5 have only signs,
which is `FiniteOrderInfinityType`.

Construct inverse and conjugate presentations canonically. If `χ = χ_unit N^σ`, then
`χ⁻¹ = conj(χ) N^(-2σ)`; the functional equation reflects against the inverse, not simply the
conjugate. The full L-function converges for `Re s > 1+σ`.

Build the unitary completion first and define the full completion by recentering:

```text
Λ(χ,s) = Λ_unit(χ,s-σ).
```

Equivalently, with primitive conductor `A`, its conductor power is `A^((s-σ)/2)` and its gamma
factor is evaluated at `s-σ`. Prove the root-number involution, inverse and conjugate comparisons,
canonical primitive reduction, and the completed functional equation. A norm twist `N^(iu)` has
poles at `iu` and `1+iu`; its completed card carries the conductor constants forced by the
recentered definition. ⚠ Those poles are exactly why the completed functional equation is stated
pointwise only where the polar divisors of both cards vanish, with a germ statement covering every
point; the card's completed function is the presentation's, so the polar divisor that restricts it
is the right one.

Required regression examples:

- the unitary norm twist over `ℚ` has one real gamma shift `-iu`;
- over `ℚ(i)` it has one complex gamma shift `-iu`, not `-2iu`;
- the odd modulo-`4` and even modulo-`5` characters agree field-by-field with Layer 5;
- the principal character's canonical primitive card is `dedekindZetaData`, while its presented
  series retains the deleted Euler factors;
- at a real place an algebraic infinity type relates to the real shift and angular exponent, not
  to parity alone;
- Hecke's angular characters of `ℚ(i)`, `𝔞 = (α) ↦ (α/|α|)^(4k)`, are the infinite-order case.
  Their algebraic infinity type has exponent `2k` at one embedding and `-2k` at its conjugate, so
  the two exponents **sum** to zero — the character is unitary and its shift vanishes — and
  **differ** by `4k`. Their card has no real gamma factor, one complex gamma factor shifted by
  `2|k|`, conductor `4`, degree two, and, for `k ≠ 0`, no pole. ⚠ The shift is `2|k|`, half the
  angular frequency: an interface that stores only a weight, or that adds the conjugate exponents,
  records `0` for every `k` and cannot tell these characters apart from the trivial one. This is
  the acceptance test that a finite character family cannot supply.

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
primitive ray-class characters, and unitary Grossencharacters. Prove all
comparisons with `EqOffZero`, so conductors, gamma factors, root numbers, completions, polar
divisors, and positive-index coefficients are checked together.

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

Layer 0 can proceed with the completed-function record while Layer 1 develops Poisson summation.
Layer 2 consumes Global Number Fields and the shared arithmetic-series substrate. Layers 3 and 4
then settle the zeta and Dirichlet instances. Layers 5 and 6 build the Hecke instances; Layer 7
uses their continuation, and Layer 8 records exact interoperability cards and examples.

The roadmap-level dependency graph is exactly

```text
ArithmeticDirichletSeries ─┐
                           ├──> LFunctions ──> ZerosOfLFunctions
GlobalNumberFields ────────┘
```

Chebotarev also consumes the two suppliers but is not a dependency of L-functions.

The boundary exports do not reverse an arrow. Arithmetic Dirichlet Series does not import this
roadmap: it states its prime ideal theorem conditionally on a record it names, and this roadmap
constructs that record. The arrow into `LFunctions` stays the only one between them.

## References

- E. Hecke, *Lectures on the Theory of Algebraic Numbers*.
- J. Neukirch, *Algebraic Number Theory*, Chapters VI and VII.
- H. Iwaniec and E. Kowalski, *Analytic Number Theory*, Chapters 3 and 5.
- D. Loeffler and M. Stoll, *Formalizing zeta and L-functions in Lean*.
