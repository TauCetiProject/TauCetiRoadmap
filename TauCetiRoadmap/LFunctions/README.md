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
exhaustive checklist. [`PROVENANCE.md`](PROVENANCE.md) is dated and non-normative.

## Scope and ownership

### Owned here

- analytic- and arithmetic-normalized completed L-function records and their duals;
- conductor, gamma-shift, degree, root-number, polar-divisor, and normalization conventions;
- Poisson summation and Gaussian theta transformations needed by Hecke's method;
- partial zeta functions and the continuation, residue, and functional equation of Dedekind zeta;
- special values and exact quadratic and cyclotomic factorizations;
- Dirichlet L-function cards extending Mathlib's continued functions;
- finite-order ray-class Hecke L-functions and general Grossencharacter L-functions;
- primitive conductors, Gauss sums, root numbers, continuations, and functional equations;
- character-specific nonvanishing on `Re s = 1`, as an intrinsic theorem about the named
  continued L-function.

### Consumed, not redefined

From `ArithmeticDirichletSeries`:

```text
IdealWeight
normCoeff
regroupByNorm
EulerProductData
landau
abelSummation
```

This roadmap specializes these declarations to zeta and Hecke coefficients. It does not
define another ideal weight, another norm-regrouped series, or another generic Euler product.

From `GlobalNumberFields`:

```text
Modulus
RayClassGroup
RayClassCharacter
RayClassCharacter.induced
RayClassCharacter.IsPrimitive
HeckeCharacter
HeckeCharacter.ofRayClassCharacter
HeckeCharacter.shift
HeckeCharacter.unitaryPart
InfinityType
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
| `ArithmeticDirichletSeries.IdealWeight` | coefficient systems of ray-class and Grossencharacter presentations |
| `ArithmeticDirichletSeries.normCoeff` | conversion of an ideal-indexed L-function into Mathlib's `LSeries` coefficients |
| `ArithmeticDirichletSeries.regroupByNorm` | equality between the ideal sum and the norm-indexed series |
| `ArithmeticDirichletSeries.EulerProductData` | local Euler factors and the global Euler-product theorem |
| `ArithmeticDirichletSeries.landau` | positivity input in the character-specific `3-4-1` nonvanishing argument |
| `ArithmeticDirichletSeries.abelSummation` | continuation of a nontrivial ray-class series from arithmetic partial sums |

Density, Perron, Wiener--Ikehara, and prime-counting exports have no consumer in this roadmap.

### Global Number Fields

| Declaration | Use here |
| --- | --- |
| `GlobalNumberFields.Modulus` and `Modulus.IsCoprimeTo` | finite and infinite conductor data and the domain of ray-class coefficients |
| `GlobalNumberFields.RayClassCharacter` | finite-order Hecke L-functions |
| `RayClassCharacter.induced` and `.IsPrimitive` | primitive conductor and imprimitive Euler-factor correction |
| `GlobalNumberFields.rayClassCharacter_partialSums` | continuation of nontrivial ray-class L-functions to a strip containing `Re s = 1` |
| `GlobalNumberFields.HeckeCharacter` | the unique idelic carrier presented by Grossencharacter analytic data |
| `HeckeCharacter.ofRayClassCharacter` | comparison of the finite-order and general constructions |
| `HeckeCharacter.shift` and `.unitaryPart` | recentering a nonunitary L-function at its real shift |
| `GlobalNumberFields.InfinityType` | algebraic infinity types and their gamma shifts |

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
| primitive scope | a primitive conductor, root number, completion, or card takes the primitivity proof as an argument. A presentation level is never stored as an arithmetic conductor. |
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

Define `EqOffZero` to compare cards while ignoring coefficient zero, which Mathlib's `LSeries`
does not read. This is necessary because the ideal-weight convention gives coefficient zero at
`n = 0`, whereas an independently defined ideal-counting coefficient may use a different junk
value.

Build `ArithmeticLFunctionData` and `NormalizationTranslation`. If the arithmetic weight is `w`,
the analytic series is obtained by shifting `s` to `s+w/2`; gamma shifts move by `+w/2`, and the
completed function carries the forced constant `N^(-w/4)`. Prove existence, uniqueness, degree
invariance, and equivalence of the two functional equations.

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

For the mixed embedding of a fractional ideal, compare the Euclidean dual with the trace dual.
The comparison map is the identity on real coordinates and `z ↦ 2 conj z` on complex coordinates.
One complex coordinate has real determinant `-4`, so the absolute determinant is `4`; the global
absolute determinant is `4^r₂`. The resulting covolume formula must recover the standard
`2^(-r₂) sqrt(|d_K|) N(I)` normalization and pass the `K = ℚ(i)` test.

Use Poisson summation to prove the Gaussian theta transformation, including the level and constant
terms. Package the Mellin transform as a functional-equation pair with level. The holomorphic
upper-half-plane theta function and its modular transformation belong to the Integral Lattices
roadmap; only the real-parameter Gaussian theta needed by Hecke's method is owned here.

### Layer 2: partial zeta functions

For a modulus and ray class supplied by Global Number Fields, define the partial zeta series by
specializing the shared ideal-weight and norm-regrouping API. Establish convergence on
`Re s > 1`, the sum over ray classes, the common residue, and continuation to a strip by Abel
summation and the uniform ray-class arithmetic.

Construct the class-group specialization for the trivial modulus. Prove independence from choices
of ideal representatives and compatibility with change of modulus. No generic ideal series or
Euler product is introduced in this layer.

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

Mandatory examples:

- `ζ_{ℚ(i)}(s) = ζ(s)L(s,χ₋₄)` including the ramified prime `2`;
- the primitive character modulo `4` is odd and has gamma shift `1`;
- the quadratic character modulo `5` is even and has gamma shift `0`;
- the conductor-one principal character recovers the Riemann-zeta card.

### Layer 5: finite-order Hecke L-functions

For `χ : GlobalNumberFields.RayClassCharacter 𝔪`, derive an
`ArithmeticDirichletSeries.IdealWeight` from `idealClass`, using value zero on the zero ideal and
at primes dividing the finite part. Define the presented `heckeLFunctionC χ` and prove its
agreement with the shared norm-regrouped series and Euler product on `Re s > 1`.

Use `GlobalNumberFields.rayClassCharacter_partialSums` and Abel summation to continue a nontrivial
character through `Re s = 1`. Build the theta and Mellin presentation for a primitive character,
evaluate the Gauss sum, and define its conductor, gamma factors, completion, and root number.
Prove entirety for a nontrivial primitive character and the meromorphic two-pole statement for the
trivial primitive character.

The analytic card has absolute degree `[K:ℚ]`, computed from its `r₁` real and `r₂` complex gamma
factors. Keep this distinct from the relative degree one of a character of `K`; the two invariants
are not alternative values of one field.

The functional equation is

```text
Λ(χ,s) = W(χ) Λ(χ⁻¹,1-s),    |W(χ)| = 1.
```

For an induced character, identify the finite Euler factors removed from the primitive series.
Only a primitive character has a card at the displayed modulus. The trivial character at a
nontrivial modulus is the required regression: it is imprimitive, its presented series is
`ζ_K` times removed Euler factors, and it has no card with the presentation modulus as conductor.

### Layer 6: general Hecke characters and Grossencharacters

Consume `GlobalNumberFields.HeckeCharacter K`, its real shift, unitary part, and infinity type.
Define a `Grossencharacter` as analytic presentation data for that carrier, not as a second Hecke
character. Its fields include the unitary ideal weight, real shift, finite character, local
archimedean parameters, and one compatibility law for the full character. Keep unitary and full
weights separate: a law mixing a unitary ideal factor with a nonunitary archimedean factor is
false when the shift is nonzero.

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
recentered definition.

Required regression examples:

- the unitary norm twist over `ℚ` has one real gamma shift `-iu`;
- over `ℚ(i)` it has one complex gamma shift `-iu`, not `-2iu`;
- the odd modulo-`4` and even modulo-`5` characters agree field-by-field with Layer 5;
- the principal character's canonical primitive card is `dedekindZetaData`, while its presented
  series retains the deleted Euler factors;
- at a real place an algebraic infinity type relates to the real shift and angular exponent, not
  to parity alone.

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

As the load-bearing acceptance example, prove Hecke's angular equidistribution of Gaussian primes
using the infinite-order characters `𝔞 ↦ (α/|α|)^(4k)`. This example cannot be discharged through a
finite character family and detects an infinity-type interface that merely typechecks.

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
  `dedekindZeta_idealVonMangoldt_nonneg`;
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

## References

- E. Hecke, *Lectures on the Theory of Algebraic Numbers*.
- J. Neukirch, *Algebraic Number Theory*, Chapters VI and VII.
- H. Iwaniec and E. Kowalski, *Analytic Number Theory*, Chapters 3 and 5.
- D. Loeffler and M. Stoll, *Formalizing zeta and L-functions in Lean*.
