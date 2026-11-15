# Restricted power series and Tate algebras

Develop a shared library of restricted power series over nonarchimedean coefficient
rings, with its normed and topological interpretations, evaluation and substitution,
Weierstrass theory, and the algebraic structure of Tate algebras. The library should
support Newton polygons, nonarchimedean functional analysis, Fredholm determinants,
rigid and adic geometry, and overconvergent automorphic forms through the same series
objects and compatible maps.

The central results are Weierstrass division and preparation at every positive
radius over an ultrametric Banach ring with a multiplicatively distinguished
divisor; their several-variable forms obtained by iteration; the noetherian,
factorial and dimension theory of Tate algebras over a complete nonarchimedean field;
and the comparison of coefficient, Gauss-norm and completed topological models.
The general Banach-ring statements are essential: coefficient algebras of families
can have nilpotents and need not admit a multiplicative norm.

[Suggested.lean](Suggested.lean) records representative definitions and theorem
signatures. It is neither an exhaustive checklist nor a replacement for this
README, which is the mathematical specification. All interfaces below are required;
those marked as supplier contracts are consumed from their named roadmaps. The
remaining targets extend the common library on the same carriers.

## Scope and ownership

The roadmap specifies the following shared series interfaces. The ownership
contracts immediately below distinguish new work from supplied prerequisites.

- Restricted series in one or several variables, including module-valued series,
  coefficient maps, polynomial approximation, reindexing, iteration and quotient maps.
- Gauss norms at arbitrary strictly positive real polyradii, completeness,
  multiplicativity under its actual hypotheses, radius restriction and rescaling.
- Topological restricted series and the series part of Wedhorn's subset-weighted
  construction, with their comparison to the normed construction where applicable.
- Evaluation, analytic substitution, translation, differentiation, Hasse derivatives
  and coefficient recovery from functions under explicit hypotheses.
- Multiplicative units, distinguishedness, Weierstrass division and preparation,
  with uniqueness, norm estimates and compatibility with coefficient maps.
- Unit-radius Tate algebras over fields: reduction, maximum modulus, distinguished
  coordinates, finite quotients, noetherianity, factoriality, Jacobson property,
  Krull dimension, and strict closedness of ideals and finite-module subobjects.
- Restricted series over complete adic noetherian rings, including their polynomial
  reductions and noetherianity.
- The common coefficient algebra of open-disc, entire and overconvergent series:
  their radius conditions, evaluation, natural maps and topologies specified below;
  entire division by a polynomial with invertible leading coefficient.

**Supplier contracts.** These retain their existing owners. A mathematical statement
recalled below is not a second implementation target when this table assigns it to
a supplier.

| Supplier | Interface consumed here | Additional work here |
| --- | --- | --- |
| [AdicSpaces §§0.4–0.5](../../Completed/AdicSpaces/README.md#04-weighted-restricted-series-and-topological-localisation) | Topological and subset-weighted series, module series, universal properties, iteration and quotient interfaces; field Weierstrass theory and unit-radius Tate noetherianity | Explicit Gauss estimates and arbitrary-polyradius normed interfaces in Layers 0–2; Banach-ring division without a globally multiplicative norm in Layer 4; coherence of normed and completed carriers in §6.2 |
| [AdicSpaces Part III §F0.1](https://github.com/TauCetiProject/TauCetiRoadmap/pull/813), `restricted-power-series-adic` | Adic restricted series, their polynomial reductions, universal property and noetherianity, recalled in §6.3 | Compatibility of those reductions and maps with the normed comparisons of §6.2 |
| [AdicSpaces Part IV §F1.1](https://github.com/TauCetiProject/TauCetiRoadmap/pull/815), `overconvergent-tate-algebra` and `overconvergent-tate-algebra-properties` | The algebra `W_n`, its inclusion in `T_n` and completion for the unit Gauss norm | The radius-controlled substitution and derivative comparisons in §7.3 |
| [AdicSpaces Part II §R0.3](https://github.com/TauCetiProject/TauCetiRoadmap/pull/817), `completed-tensor-restricted-power-series` | Base change of weighted series along adic coefficient maps | The normed coefficient-map and finite-presentation interfaces of §6.4 |

The Tate-specific algebra in Layer 5 is shared input to classical rigid geometry;
general affinoid quotients and their geometry are not targets here. Field division
and Tate noetherianity already assigned to AdicSpaces remain supplied results,
including when the broader Banach-ring theorem gives another proof. Open-disc and
entire-series algebra here supplies the scalar interfaces needed by
[LocallyAnalyticDistributions](https://github.com/TauCetiProject/TauCetiRoadmap/pull/854);
its analytic function spaces, distribution topologies and operator theory remain
separate targets. No application-specific copy of a series definition is needed.

The following boundaries specify the consumers of the combined interfaces.

| Neighbouring area | Shared series interface | Owned by the neighbouring area |
| --- | --- | --- |
| Newton polygons | Gauss norms, dominant coefficients, normed Weierstrass division and preparation, Strassmann's theorem | Convexity, valuation normalisation, slopes, polygon-specific factorisations and root-counting dictionaries |
| Nonarchimedean functional analysis | Restricted coefficient modules, their weighted norms, the unit-radius `c₀` comparison, evaluation and substitution | General Banach modules, bounded operators, open mapping, orthonormalisability, Mahler and Amice bases, locally analytic functions and distributions |
| Compact operators and Fredholm theory | Radius restriction maps and coefficient bounds, entire-series algebra and division, monic entire resultants and normalised entire preparation | Compactness of those maps, Fredholm determinants, resolvents, Coleman's spectral resultant transform, Riesz theory and operator slope decompositions |
| Classical rigid geometry | Tate-algebra structure and series comparisons | General affinoid algebras and their presentation-independent topology, spectral seminorms on quotients, weak stability and Japanese-ring theory, rational domains, sheaves and global geometry |
| Adic geometry | Normed/topological comparisons and bounded coefficient maps | The topological series supplier above, general Huber-ring and completion theory, topological localisation, Huber pairs, strong noetherianness, general completed tensors, `Spa` and its sheaves |
| Formal geometry | Compatibility of normed comparisons with adic reductions | The adic restricted-series supplier above, formal spectra, formal schemes, admissible models and generic fibres |
| Dagger geometry | Positive-radius Tate algebras and analytic operations compatible with `W_n` | The overconvergent-algebra supplier above, general dagger quotients, fringe topology, weak completions, dagger spaces and cohomology |
| Iwasawa theory | Comparisons of radius conditions and evaluation of bounded-coefficient series inside the open disc | Measures, completed group algebras, formal `O⟦T⟧` and Iwasawa invariants; formal DVR preparation is the contract in [PadicMeasuresIwasawaAlgebras §4.3](../PadicMeasuresIwasawaAlgebras/README.md#43-weierstrass-theory-of-ot), using Mathlib's ideal-adic preparation |
| Automorphic forms | Substitution, re-expansion and differentiation of series | Weight actions, automorphy factors, Hecke operators and classicality |

General Laurent-series rings, Robba rings, perfectoid algebras, Newton polytopes and
noncommutative multivariable series are outside the scope. Evaluating a one-variable
series in a noncommutative Banach algebra is included in §2.1, since Fredholm theory
uses evaluation at an operator.

## Conventions

1. **Coefficient hypotheses are local.** The normed ring theory uses an ultrametric
   normed commutative ring `R`; completeness and `‖1‖ = 1` are imposed where needed.
   Multiplicativity of the norm is an additional hypothesis, never a standing
   assumption for Banach-ring Weierstrass theory. Field results use a complete
   nontrivially normed ultrametric field `K`, with no assumption of discrete
   valuation, characteristic zero, algebraic closedness or spherical completeness.

2. **Radii are positive real numbers.** For `r : σ → ℝ`, write
   `R⟨r⁻¹X⟩` for the series `Σ a_ν X^ν` with
   `‖a_ν‖ ∏ᵢ rᵢ^(νᵢ) → 0` along the cofinite filter on `σ →₀ ℕ`.
   Require `∀ i, 0 < r i`. The coefficient and norm theory allows arbitrary `σ`;
   evaluation, topological Huber comparisons and the algebraic structure theorems
   below use finitely many variables. In finitely many variables the coefficient
   condition is equivalent to decay as total degree tends to infinity.

3. **Use the library's carriers.** The normed construction uses Mathlib's
   `PowerSeries.IsRestricted`, `MvPowerSeries.IsRestricted` and their restricted
   subrings/types. The Gauss norm is Mathlib's `PowerSeries.gaussNorm` or
   `MvPowerSeries.gaussNorm`. Topological series use Tau Ceti's
   `Huber.restrictedMvPowerSeriesSubring`, `restrictedMvPowerSeriesCompletion` and
   `weightedRestrictedSubring`. Supply comparison equivalences; do not introduce a
   new representation of coefficients to avoid using these APIs. A change adopted
   by Mathlib is followed by an import and a refactor.

4. **The topology must be named.** A restricted algebra carries the Gauss-norm or
   corresponding uniform coefficient topology, not the topology inherited from
   the product of coefficient spaces. Entire and open-disc series carry the
   topology of all their indicated Gauss norms. The overconvergent series algebra
   in §7.3 has the norm induced by the unit Gauss norm when its completion is
   discussed; this is not an assertion about the fringe topology of dagger geometry.

5. **Do not use a real supremum outside its domain of validity.** Norm statements
   carry restrictedness or an explicit `HasGaussNorm` hypothesis. An unbounded
   coefficient family can give the junk value zero for a real `iSup`.

6. **Formal and analytic substitution have different hypotheses.** Analytic
   substitution is constructed by a convergent sum. It allows a nonzero constant
   term in the substituted series when the radius bounds hold. Agreement with
   Mathlib's formal substitution is a theorem under the formal substitution
   hypotheses; it is not used as the definition in the general analytic case.

7. **Distinguishedness includes the coefficient hypothesis.** A multiplicative
   unit `u` is an invertible element such that `‖u a‖ = ‖u‖ ‖a‖` for every `a`.
   A series is distinguished of degree `s` at radius `r` when its coefficient at
   `s` is a multiplicative unit, its weighted norm attains the Gauss norm, and
   every coefficient at index greater than `s` has strictly smaller weighted norm.
   Earlier indices may tie. Use `IsNormMulUnit` and `IsMulDistinguished` if those
   notions are present in the chosen library; otherwise introduce this theory once.
   Refine `TauCeti.PowerSeries.IsDistinguished` by the multiplicative-unit
   condition, retaining its attainment and distinguished-degree API.

8. **Split a specified variable.** Iteration is natural under reindexing. The
   concrete `Fin (n + 1)` form distinguishes `X 0` and uses `Fin.tail r` for the
   other radii. Statements in a source using the last variable are transported
   by an explicit permutation. The norm on a coefficient series is its Gauss norm.

9. **Norm comparisons have their real strength.** A contractive coefficient map
   gives contractive maps of restricted series. A map bounded by `C` gives the
   corresponding bound by `C`. A topological algebra equivalence does not by itself
   assert equality of arbitrarily chosen norms. Exact isometries are specified
   for the coefficient, reindexing, iteration and isometric scalar-extension maps.

10. **One theorem has one owner.** A stronger statement includes comparison with
    the previously implemented theorem. Targets already implemented at the chosen
    Tau Ceti/Mathlib pin are consumed through their actual declarations. Proofs and
    generalisations are made there, rather than copied under an application namespace.

## Existing foundations

Mathlib supplies power series and multivariate power series, polynomial embeddings,
coefficient maps, formal substitution and derivatives, the restrictedness predicates,
Gauss norms, ultrametric summability, completions, normed algebra and continuous-linear
map vocabulary, `ZeroAtInftyContinuousMap`, and the algebraic notions used in the
Tate-algebra structure theorems. Its ideal-adic Weierstrass factorisation is a
different theorem from the radius-dependent division developed here.

The following Tau Ceti modules supply substantial parts of the specification.
The implementation should extend these modules and their public APIs. The source
links identify the dependency snapshot used by the prototype; the repository's
`lake-manifest.json` determines the build environment.

| Existing module | Interface to consume |
| --- | --- |
| [`MvPowerSeries/TateAlgebra/Basic.lean`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Basic.lean) | Gauss-norm instances at positive polyradii, completeness, coefficient bounds, attainment and `MvPowerSeries.IsRestricted.gaussNorm_mul` |
| [`MvPowerSeries/TateAlgebra/Iterate.lean`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Iterate.lean) | Unit-polyradius splitting into a univariate series over a coefficient Tate algebra |
| [`PowerSeries/Weierstrass/Division.lean`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/RingTheory/PowerSeries/Weierstrass/Division.lean) and [`Preparation.lean`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/RingTheory/PowerSeries/Weierstrass/Preparation.lean) | Arbitrary-radius Weierstrass theory with a multiplicative coefficient norm; §4 removes that global hypothesis in favour of multiplicative distinguishedness |
| [`Huber/Restricted/GaussNorm.lean`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/RingTheory/Huber/Restricted/GaussNorm.lean) | `restrictedMvPowerSeriesGaussEquiv` and the completed ring/algebra comparisons |
| [`Huber/WeightedRestrictedSeries/`](https://github.com/TauCetiProject/TauCeti/tree/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/RingTheory/Huber/WeightedRestrictedSeries) | Weighted series, topology, completion, iteration, renaming, quotient and power-boundedness interfaces |

Mathlib's [multivariate Gauss-norm API proposal #42871](https://github.com/leanprover-community/mathlib4/pull/42871)
provides the design for monomial, coefficient-map and dominant-antidiagonal lemmas.
Use declarations already available at the dependency pin and extend the same API
for missing results; adopt Mathlib's versions as they become available. In
particular, restrictedness discharges boundedness hypotheses, rather than
replacing `gaussNorm` by a private supremum.

The general topological foundations are the accepted
[AdicSpaces roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdicSpaces/README.md),
§§0.1–0.3: bounded sets, Huber rings, rings of definition and separated completion.
The normed branch below does not depend on valuation spectra, adic spaces, affinoid
geometry, compact operators or Newton polygons.

## Layer 0: Coefficients and series algebras

### 0.1 Native restricted-series algebra

Use the native coefficient predicates and build any missing coefficientwise API:
extensionality, constants, variables, monomials, polynomial inclusion, sums, products,
scalar multiplication, and compatible ring and algebra maps. The coefficients of a
product are the usual finite antidiagonal sums. Prove compatibility with the ambient
formal-series operations, including the zero-variable algebra equivalence with `R`
and the one-variable comparison.

Reindexing by an equivalence of variable sets induces an algebra equivalence with
the correspondingly reindexed radii. Include its values on coefficients, constants
and variables and its identity/composition laws. Polynomial embeddings are injective.
These are extensions of the native objects, not a replacement ring implementation.

### 0.2 Maps of coefficients

For a ring homomorphism `φ : R →+* S` with
`‖φ a‖ ≤ C ‖a‖` for all `a`, where `C ≥ 0`, coefficientwise mapping preserves
restrictedness at the same radii. Prove the coefficient formula, identity and
composition laws, compatibility with polynomial inclusion and reindexing, and
injectivity when `φ` is injective. After Layer 1, prove the Gauss-norm bound by `C`
and equality when `φ` preserves norms.

For a surjective bounded `φ`, require a uniform lifting bound before asserting
surjectivity on restricted series: there is `L > 0` such that every `b : S` has a
lift `a : R` with `‖a‖ ≤ L ‖b‖`. Choose coefficient lifts, prove their
restrictedness, and obtain the same bound for the lifted series. Describe the
kernel coefficientwise. With the norm topologies this yields a quotient map.
An isometric quotient statement requires the corresponding sharp lifting/quotient
norm hypothesis; mere algebraic surjectivity is not such a hypothesis.

### 0.3 Module-valued coefficients

For an ultrametric normed additive group `E`, construct the additive group of
coefficient families `a : (σ →₀ ℕ) → E` satisfying the weighted decay condition.
Give coefficient maps, extensionality and finite-support inclusions. For an ultrametric normed
`R`-module with `‖a • e‖ ≤ ‖a‖ ‖e‖`, construct the coefficientwise
`R`-module and bounded maps induced by bounded linear maps of coefficient modules.
Construct multiplication by scalar restricted series through convolution and prove
the module laws and norm inequality of Layer 1.

Use the native coefficient-family carrier whenever available. A function-valued
realisation of this module is a comparison in §2.4, not its definition.

**Checks.** Zero variables recover the coefficient ring or module. The variable
`X i` has exactly one nonzero coefficient. Coefficient mapping sends it to `X i`.
Zero coefficient rings and zero modules are allowed here. Over `ℚ_p`, the series
`Σ p^n X^n` is restricted at radius one and fails to be restricted at radius `p`.

**Dependencies.** Mathlib formal series, restrictedness, finite antidiagonals and
ultrametric norm inequalities. Sources: [BGR] §5.1; [Martin] §1.3 for Banach-ring radii.

## Layer 1: Gauss norms and radius calculus

### 1.1 Norms, completeness and approximation

On restricted series the Gauss supremum is finite, and for a nonzero series is
attained. Its attaining indices form a finite nonempty set. Prove the coefficient
bound, definiteness, the ultrametric triangle inequality and submultiplicativity.
The norms of constants and monomials are
`‖C a‖ = ‖a‖` and `‖a X^ν‖ = ‖a‖ r^ν`; in a norm-one ring, `‖X i‖ = r i`.
When the coefficient norm is multiplicative the Gauss norm is multiplicative.
Consume the existing attainment and dominant-antidiagonal proofs.

Complete coefficients give a complete restricted algebra/module. Coefficient
functionals are continuous with bound `(r^ν)⁻¹`. Finite-support truncations converge
in norm; in finitely many variables, total-degree truncations suffice. A dense
coefficient subset gives dense polynomials with coefficients in that subset.
Record the completion of the polynomial algebra with its Gauss norm as this
restricted algebra, compatibly with constants, variables and coefficient maps.

### 1.2 Changing the radii

If `0 < r i ≤ s i` for every `i`, there is a contractive injective map
`R⟨s⁻¹X⟩ → R⟨r⁻¹X⟩`, coefficientwise the identity. It has dense image because
it contains the polynomials. Prove identity and composition laws and compatibility
with coefficient maps and variable permutations.

For finite variables over a normed field, scaling by nonzero `u_i` gives the
isometry `f(X) ↦ f(u_i X_i)` from radii `r` to radii `s` when
`‖u_i‖ s_i = r_i`. Give the inverse and coefficient formula. Over a normed ring,
use multiplicative units and the same norm equation. Radius theorems themselves
hold at every positive real radius; this rescaling theorem cannot replace them.

### 1.3 The coefficient model and iteration

At unit radii the coefficient map is an additive isometry, and an `R`-linear
isometry for the normed modules of §0.3, between restricted `E`-valued series and `C₀(σ →₀ ℕ, E)`, with the exponent set discrete. It sends
monomials to the standard single-coordinate vectors. For general radii use the
weighted coefficient norm. Obtain an unweighted `c₀` isometry by scalar rescaling
when scalars realising the weights act norm-multiplicatively on `E`; do not assert
that isometry for arbitrary real radii without this hypothesis.

For disjoint variable sets and positive radii, splitting coefficients gives an
isometric algebra equivalence
`R⟨r⁻¹X, s⁻¹Y⟩ ≃ R⟨r⁻¹X⟩⟨s⁻¹Y⟩`.
The outer coefficient condition is decay of the **Gauss norms of the slices**.
Prove both directions, coefficient formulas, compatibility with polynomials,
reassociation, permutations and coefficient maps. State the analogous module
equivalence. The `Fin (n + 1)` specialisation is the input for multivariate division.

**Checks.** `X^n` tends coefficientwise to zero but does not tend to zero in the
unit Gauss norm. At radius `r`, `‖X‖ = r`; use `r = √p` over `ℚ_p` to check that
the construction requires no scalar of norm `r`. Each row of the array
`a_ij = 1` if `i = j`, zero otherwise, is a restricted coefficient family, but the
array is not jointly restricted at unit radii: its row norms do not tend to zero.

**Dependencies.** Layer 0; native Gauss norms, `C₀` and completeness.
Sources: [BGR] §§5.1.1–5.1.2; the arbitrary-radius estimates follow directly from
weighted coefficients, as in [Martin] §1.3.

## Layer 2: Evaluation, substitution and functions

### 2.1 Evaluation and its universal property

Let `R` and `B` be ultrametric normed commutative rings, with `B` complete, and
let `φ : R →+* B` be contractive. For finitely many `b_i` satisfying
`‖b_i‖ ≤ r_i`, evaluation is the convergent monomial sum
`Σ_ν φ(a_ν) b^ν`. It is a contractive ring homomorphism, agrees with polynomial
evaluation, sends constants through `φ`, and sends each variable to `b_i`.
It is the unique continuous ring homomorphism with these values. Supply its
functoriality and algebra/module forms on the native restricted carrier, and
compare it with the topological evaluation supplied by AdicSpaces §0.5. State the version for a coefficient map bounded by `C`, with norm bound `C`.

For a complete normed `R`-algebra `B` which can be noncommutative, include the
one-variable evaluation at `b : B`, under the same bound on the coefficient map
and `‖b‖ ≤ r`. The image of `R` is central; this makes the sum a ring homomorphism.
In particular it applies to a complete normed algebra of bounded operators when
that algebra structure has been supplied by functional analysis. Construct no
operator algebra or Fredholm determinant in this layer.

### 2.2 Analytic substitution and translation

Take `g_i ∈ R⟨s⁻¹Y⟩` with `‖g_i‖_s ≤ r_i`, for finitely many source variables,
over a complete coefficient ring. Evaluation in the target restricted algebra
defines a contractive substitution `R⟨r⁻¹X⟩ → R⟨s⁻¹Y⟩`.
Prove the coefficient sum formula, identity and composition laws, compatibility
with evaluation and coefficient mapping, and comparison with formal substitution
whenever the latter's hypotheses hold.

For `‖a_i‖ ≤ r_i`, translation `X_i ↦ X_i + a_i` is an isometric automorphism
of the algebra at radii `r`, with inverse translation by `-a_i`. Give its
binomial coefficient formula. Affine maps `X_i ↦ a_i + u_i Y_i` with
`‖a_i‖ ≤ r_i` and `‖u_i‖ s_i ≤ r_i` are contractive, with composition and
evaluation laws. These maps supply the changes of disc coordinates used by
locally analytic functions and automorphic forms.

### 2.3 Derivatives and Hasse derivatives

Use the formal derivative and coefficient-defined Hasse derivatives. In one
variable, `coeff n (D^[k] f) = (n+k choose k) • coeff (n+k) f`.
They preserve restrictedness at radius `r` and satisfy
`‖D^[k] f‖_r ≤ r^(-k) ‖f‖_r`. Include the several-variable multi-index form,
Leibniz, the Hasse composition identity, commutation of different variables,
coefficient maps, and compatibility with polynomial Hasse derivatives.
Prove the chain rule for the ordinary derivative under analytic substitution.

The one-variable coefficient construction is available over any semiring,
including a noncommutative operator algebra: natural-number multiplication in
the formula does not require commutative coefficients. Supply identity,
additivity, left scalar compatibility and the ordered Leibniz rule, then
compare with the commutative Hasse derivative. The semiring construction is
the common definition; the commutative theory is its specialisation. Test `Δ²(T²)=1` in characteristic
two, where the second ordinary derivative is zero. Normed and analytic
statements retain their completeness, ultrametric and radius hypotheses.

The translated coefficients are `D^[ν] f(a)`, and the corresponding Taylor
expansion converges in the allowed closed polydisc. Ordinary iterated derivatives
equal the relevant factorial times Hasse derivatives. Do not divide by those
factorials in positive characteristic.

### 2.4 Identity and maximum principles

For one-variable restricted series over `K`, prove Strassmann's bound: if `f ≠ 0`
and `s` is the greatest index attaining its radius-`r` Gauss norm, it has at most
`s` distinct zeros in the radius-`r` closed ball in any complete isometrically
normed field extension. Derive it from §4.3 and the field unit criterion of §3.2.
A series vanishing on an infinite subset of that ball is zero.

For a Banach `ℚ_p`-module `E` with a specified jointly injective family of bounded
`ℚ_p`-linear maps to complete normed extension fields of `ℚ_p`, prove injectivity
of evaluation of unit-radius `E`-valued series on `ℤ_p`. Obtain the finite-variable
version on `ℤ_p^n` by iteration. The family of functionals is a hypothesis, not
asserted to exist for every Banach module.

For `f ∈ T_n = K⟨X₁,…,X_n⟩`, there is a finite normed field extension `L/K`
and a tuple `x ∈ (L°)^n` such that `‖f(x)‖ = ‖f‖`. Combine evaluation with
the reduction of §3.3: a nonzero reduction can be evaluated nontrivially after a
finite residue-field extension, realised by suitable prime-to-residue-characteristic
roots of unity. Include the finite-extension and residue-separation lemmas this
argument needs. No general affinoid Nullstellensatz is an input. Deduce that the
Gauss norm is the supremum over such extension-valued points.

**Checks.** Translation by `1` is allowed at radius one although its constant
term is nonzero. Over `ℚ_p`, `X^p - X` has Gauss norm one but takes values of norm
at most `p⁻¹` on `ℤ_p`; maximum modulus cannot use only `K`-rational points.
Over `𝔽_p`, the same nonzero polynomial vanishes at all points of the unit ball;
unqualified coefficient recovery for arbitrary coefficient rings is false.

**Dependencies.** §§2.1–2.3 use Layers 0–1. The Strassmann and coefficient-recovery
parts of §2.4 use §§3.2 and 4.3; maximum modulus uses §3.3. Sources: [BGR] §§5.1.3–5.1.4;
[Martin] §1.3; [Colmez] §I.4 for the disc realisation.

## Layer 3: Multiplicative units and reduction

### 3.1 Multiplicative units over Banach rings

Develop the multiplicative-unit predicate of Convention 7. In a norm-one ring,
prove closure under products and inverses and the equivalence, for `u : Rˣ`, with
`‖u⁻¹‖ = ‖u‖⁻¹`. In a complete ultrametric norm-one ring, `1 + a` is a
multiplicative unit when `‖a‖ < 1`. Every unit is multiplicative when the
coefficient norm is multiplicative. Constants and isometric algebra equivalences
preserve multiplicative units. These statements are prerequisites of §4, with no
field or reducedness assumption.

### 3.2 Units of restricted algebras

Here `R` is complete, ultrametric and norm-one.

For `f ∈ R⟨r⁻¹X⟩`, if `a_0` is a multiplicative unit and
`‖f - C a_0‖_r < ‖a_0‖`, construct its inverse by a Neumann series and prove
that `f` is a multiplicative unit. Include the resulting inverse norm and
compatibility with evaluation.

When the coefficient ring is nontrivial and its norm is multiplicative, prove the
converse: `f` is a unit if and only if `a_0` is a unit and every nonconstant weighted coefficient norm
is strictly smaller than `‖a_0‖`. Restrictedness upgrades the pointwise strict
inequalities to a uniform strict bound. This includes arbitrary positive
polyradii. In particular, a nonzero field-valued series is invertible exactly
when the constant coefficient is its unique Gauss-norm-attaining coefficient.

### 3.3 Integral structure at unit radii

For a complete nontrivially normed ultrametric field `K`, construct the coefficient
comparison `K°⟨X⟩ ≃ T_n°`, where `T_n°` is the Gauss unit ball, and prove it is
the topologically power-bounded subring. Its topologically nilpotent ideal is
`{f | ‖f‖ < 1}`. Give the coefficient criteria and prove that coefficient
reduction induces
`T_n° / T_n°° ≃ K̃[X₁,…,X_n]`.
The reduced series is a polynomial because its nonzero coefficients are finite
in number. Prove surjectivity, the kernel formula, compatibility with constants,
variables, coefficient maps of valued fields, and evaluation at integral points.

Prove that a unit of `T_n°` reduces to a unit, that a unit reduction lifts to a
unit, and that nonzero reduction is equivalent to norm one. Distinguish units of
`T_n°` from units of `T_n`: a nonzero constant of norm less than one is a unit
of `T_n` but not of `T_n°`. General normed rings do not inherit the identification
of their power-bounded elements with a chosen norm unit ball without a theorem.

**Checks.** `1 - pX` is a unit in `ℚ_p⟨X⟩`; `1 - X` is not. In
`R = K[ε]/(ε²)` with the coefficient maximum norm, `1 + εX` is a unit with
inverse `1 - εX` although its nonconstant coefficient can have norm one. This
rules out extending the field unit criterion to all Banach rings. Reduction of
`Σ p^n X^n` is the constant polynomial one.

**Dependencies.** Layers 0–1 and existing topological power-boundedness vocabulary.
Sources: [Martin] Definitions 1.20 and 1.24, Lemma 1.21 and Remark 1.22;
[BGR] §§5.1.2–5.1.3. The arbitrary-radius converse uses dominant exponents in §1.1.

## Layer 4: Weierstrass theory over Banach rings

### 4.1 Distinguished series and the multiplication estimate

Let `R` be a complete ultrametric normed commutative ring with `‖1‖ = 1`, let
`r > 0`, and let `g ∈ R⟨r⁻¹T⟩` be distinguished of degree `s` as in
Convention 7. Prove `g ≠ 0` and `‖g‖_r > 0`. Multiplication by `g` is
norm-multiplicative: `‖gq‖_r = ‖g‖_r ‖q‖_r`.
If `k` is the greatest attaining index of a nonzero `q`, the corresponding
greatest attaining index of `gq` is `s + k`. Include the strict estimates for
the other contributions to that product coefficient.

For any polynomial `b` of degree less than `s`, prove
`‖gq + b‖_r = max (‖g‖_r ‖q‖_r) ‖b‖_r`.
This estimate supplies uniqueness and the bounds; a global `NormMulClass R`
must not appear in its hypotheses.

### 4.2 Division with bounded quotient and remainder

For every `f ∈ R⟨r⁻¹T⟩`, construct unique
`q ∈ R⟨r⁻¹T⟩` and `b ∈ R[T]` with
`deg b < s` and `f = gq + b`. State uniqueness for the pair, including `s = 0`
and `f = 0`. Prove
`‖q‖_r ≤ ‖f‖_r / ‖g‖_r`, `‖b‖_r ≤ ‖f‖_r`, and the norm identity of §4.1.
For fixed `g`, quotient and remainder are bounded `R`-linear maps; give their
values on `gq`, on lower-degree polynomials and on sums and scalar multiples.

The construction truncates the divisor, divides by its polynomial part after
normalising the leading coefficient, and iterates the tail error with a uniform
contraction factor less than one. Supply the convergence and uniqueness argument
inside the complete restricted algebra. It applies at every real `r > 0`.

### 4.3 Preparation and normalisation

Construct unique `w ∈ R[T]` and `e ∈ R⟨r⁻¹T⟩` such that `w` is monic of
degree `s`, `‖w‖_r = r^s`, `e` is a multiplicative unit, and `g = e w`.
Prove uniqueness under these normalisations and the compatibility with division.
Give the polynomial case and recover the existing field/multiplicative-norm
theorems by comparison with their distinguishedness predicates.

A bounded coefficient homomorphism transports division and preparation whenever
the original and image divisors satisfy distinguishedness at the stated radius
and degree. Prove naturality from uniqueness, including the norm-preserving
field-extension case. Do not assume that an arbitrary bounded map preserves
distinguishedness or a particular distinguished degree.

### 4.4 Several variables

Apply §§4.1–4.3 over the coefficient ring in the other variables, using the
isometric iteration of §1.3. The distinguished coefficient is a multiplicative
unit of that **coefficient restricted algebra**. Obtain division with remainder
a polynomial of degree less than `s` in the chosen variable and restricted
coefficients in the others. Include preparation, uniqueness, the full norm
estimates, naturality, and compatibility with reindexing.

**Checks.** `X - 1` is distinguished at radius one and is its own Weierstrass
polynomial; lower coefficients need not have norm strictly less than one. Degree
zero division has zero remainder. Work at a radius outside `|ℚ_p×|`. Over the
dual-number ring of §3.2, divide `T⁴` by `T² - ε`; quotient `T² + ε` and
remainder zero give a test with nonreduced coefficients.

**Dependencies.** Layers 0–1 and §3.1. Neither Newton polygons nor affinoid geometry
is needed. Sources: [Martin] Definition 1.24, Lemma 1.26, Proposition 1.27,
Corollary 1.28 and the several-variable remark following it; [BGR] §§5.2.1–5.2.2
for the field specialisation.

## Layer 5: Algebraic structure of Tate algebras

Here `T_n = K⟨X₁,…,X_n⟩` at unit polyradius. All results hold for the field
generality of Convention 1. Unit-radius noetherianity is supplied by AdicSpaces
§0.5; the remaining Tate-specific algebraic and normed interfaces are targets here.

### 5.1 Weierstrass polynomials and distinguished coordinates

A Weierstrass polynomial in the chosen variable is monic with Gauss norm one.
Its nonleading coefficients have norms at most one. Monic factors of a
Weierstrass polynomial are Weierstrass polynomials. For such a polynomial `w`
of degree `s`, identify `T_n/(w)` with a finite free module over `T_(n-1)`
on `1, X, …, X^(s-1)`. Give the reduction-to-remainder map and multiplication
in these coordinates. A finite `T_n`-module killed by `w` is finite over
`T_(n-1)`.

For each nonzero `f ∈ T_n`, with `n > 0`, construct an isometric triangular
change of variables making `f` distinguished in a specified variable. Choose
the exponents from a bound on the finite set of dominant monomials; one change
works for a finite family of nonzero series. Prove the polynomial statement
first and lift it through reduction. The substitutions and their inverses are
the analytic maps of §2.2.

### 5.2 Noetherian, factorial and dimension theory

Consume noetherianity of `T_n` from AdicSpaces §0.5. Prove that it is a unique
factorisation domain, integrally closed and Jacobson, and has Krull dimension `n`.
The induction uses §5.1 and preparation.

The auxiliary Rückert interface of [BGR] §5.2.5 consists of an injective ring
map `φ : A[X] → B` and a family `W` of monic polynomials, closed under taking
monic factors, such that `A[X]/(w) → B/(φ(w))` is an isomorphism for each
`w ∈ W`, and every nonzero `b ∈ B` satisfies `u · α(b) = φ(w)` for some
ring automorphism `α`, unit `u` and `w ∈ W`. Build its finite-quotient descent
and the transfer of unique factorisation over domains. For the Jacobson
criterion, assume that `A` is Jacobson and the Jacobson radical of `B` is zero;
the latter condition is essential. Prove it for `T_n` using the finite-extension
points of §2.4: evaluation has field image and separates nonzero series. The
Rückert hypotheses then make each nonzero prime the intersection of the maximal
ideals above it. For `T_(n+1)` over `T_n`, use the Weierstrass polynomials of
§5.1 as `W`. These algebraic lemmas are targets here on native ring, ideal and
polynomial carriers.

Prove that maximal ideals of `T_n` are generated by polynomials and that their
residue fields are finite over `K`. Use the finite-quotient induction; no geometry
of general affinoids is an input. For the dimension calculation include the
coordinate prime chain and the upper bound from finite descent. Export these
results on both the Gauss-normed carrier and the completed Huber carrier of §6.2.

### 5.3 Closed ideals and finite-module subobjects

For a submodule `N ≤ T_n^m` with the maximum norm, prove closedness and strict
closedness: every coset has a representative of least norm. Give finite
generators of norm one for nonzero `N` such that each `x ∈ N` has an expression
in them with coefficient norms at most `‖x‖`. Treat `N = 0` with an empty
generating family. Ideals are the case `m = 1`.

The quotient norm on `T_n^m/N` is complete and its values lie in `|K|`.
For finite modules, prove equivalence of the complete quotient topologies from
different finite presentations and continuity/strictness of linear maps in
these topologies. Here strictness means that the quotient by the kernel maps
homeomorphically to the image with its subspace topology; record that the image
is closed. These Tate-specific conclusions are exposed to the general
finite-module topology API of functional analysis.

Include the supporting bald-subring and orthonormal-lifting lemmas of [Bosch]
§1.3, Proposition 3, Theorem 6 and Corollaries 7–10, unless already supplied by a cited module. Do not assume spherical
completeness of `K` or a general nearest-point theorem for Banach spaces.

### 5.4 Positive polyradii and finite presentations

Retain the Banach algebra at every positive polyradius. When
`r_i ∈ √|K×|`, choose `s_i ≥ 1` and `c_i ∈ K×` with `‖c_i‖ r_i^s_i = 1`.
The map from the unit Tate algebra sending `Y_i` to `c_i X_i^s_i` is injective
and finite. Construct the finite monomial module generators
`X^ν`, `0 ≤ ν_i < s_i`, with their coefficient/norm estimates, and prove
noetherianity in this case. This is an algebraic input to the classical
strict-affinoid criterion. The converse criterion belongs to rigid geometry,
where the required general affinoid maximum-modulus theorem is available.

**Checks.** `T_0 = K`, `dim T_1 = 1`, and `T_1/(X-a) ≃ K` for `‖a‖ ≤ 1`.
The quotient by `X - 1` has rank one; the quotient by the degree-zero polynomial
one is zero. For the polynomial `X²-p` over `ℚ_p`, the quotient has basis
`1, X`, with `X² = p`. Include the finite presentation at radius `√p`.

**Dependencies.** §§2.1–2.3, the maximum principle of §2.4, Layer 3 and Layer 4;
Mathlib polynomial, finite-module,
integrality and dimension APIs. Sources: [BGR] §§5.2.3–5.2.7 and 7.1.1;
[Bosch] §§1.2–1.3. The radius presentation is a weighted coefficient construction.

## Layer 6: Topological and adic series comparisons

### 6.1 Topological and subset-weighted restricted series

**Supplier contract: AdicSpaces §§0.4–0.5.** Consume the plain and subset-weighted
series on Tau Ceti's existing carriers, together with its §§0.1–0.3 topological-ring
notions and separated completion. In finitely many variables the required
interface is as follows. Retain Wedhorn's admissibility hypothesis
on each weight set `M_i`: the ideal generated by `M_i` is open. Include the
weighted polynomial topology, the coefficient description, density, completion,
renaming and iteration.

For complete Hausdorff coefficient rings and bounded admissible weight sets,
state the universal property for a continuous coefficient homomorphism `φ` to a
complete Hausdorff nonarchimedean target ring, with the set `⋃ᵢ {φ(m) b_i | m ∈ M_i}` power-bounded.
For finitely many variables in a commutative ring this is equivalent to
power-boundedness of each indicated set; pointwise power-boundedness alone is
not the hypothesis.
Consume uniqueness, naturality and compatibility with polynomial evaluation. In
the trivial-weight case this requires power-bounded variable images. General
topological localisation and its denominators remain in AdicSpaces §0.4.

### 6.2 Normed and completed comparisons

At unit polyradius, the normed and topological coefficient conditions agree.
Consume and extend the native ring and algebra equivalences; prove agreement
of their topologies, coefficients, polynomial embeddings and variables. For
complete coefficients, compare the separated completion as well. These
comparisons commute with evaluation, coefficient maps and iteration.

Give the weighted comparison when the chosen subsets encode radii through
multiplicative units, stating the conversion of weight bounds to norm bounds.
Arbitrary real polyradii remain the normed construction; a set of arbitrary
real numbers is not a Huber weight family. Transport the supplied Tate-algebra
noetherianity theorem along the unit-radius comparison, and identify the result
with AdicSpaces' field instance of strong noetherianness.

### 6.3 Series over an adic noetherian ring

**Supplier contract: AdicSpaces Part III §F0.1, `restricted-power-series-adic`.**
The following adic algebra is consumed, not reassigned. This roadmap proves
compatibility of its reductions and continuous maps with §6.2 wherever both
constructions apply.

For a commutative noetherian ring `A`, complete and separated for a finitely
generated ideal `I`, the supplier gives the native restricted-series carrier
`A{X₁,…,X_n}`, complete and separated for the ideals `I^m A{X}`, and
`A{X}/I^m A{X} ≃ (A/I^m)[X₁,…,X_n]` for `m ≥ 1`.
Its compatible reductions give the inverse-limit description, and its adic
completion theorem gives noetherianity. Consume the comparison of completed
and coefficient-subring carriers when proving the compatibility above.

For a complete separated linearly topologised commutative `A`-algebra with a
continuous structure map, arbitrary choices of the variables define a unique
continuous map out of `A{X}`. Explain the distinction from §6.1: ideal
neighbourhoods make every element of this target power-bounded. Include
coefficient base change and reduction compatibility wherever the stated
continuous map and completion hypotheses apply, without a flatness assertion.

### 6.4 Quotient and tensor interfaces

Expose coefficientwise kernels and bounded lifts from §0.2 as continuous maps
on the compared series carriers. For a finite free coefficient module, prove
that forming restricted series commutes with its finite-coordinate presentation;
for finite modules over `T_n`, use the strict finite presentations of §5.3.
Explicitly, a presentation `T_n^a → T_n^b → M → 0` induces
`T_n⟨Y⟩^a → T_n⟨Y⟩^b → M⟨Y⟩ → 0`, with the same presentation matrix,
where `M⟨Y⟩` is the module-valued construction of §0.3 with a complete quotient
norm on `M`. Prove exactness, the quotient topology and independence from the
chosen presentation. Use bounded lifts to establish surjectivity on restricted
coefficient families, rather than inferring it from algebraic surjectivity alone.

The general completed tensor product of Huber pairs and the theorem
`B ⊗̂_A A⟨X⟩_M ≃ B⟨X⟩_φ(M)` along an adic coefficient map are owned by
AdicSpaces Part II §R0.3, target `completed-tensor-restricted-power-series`.
The interfaces supplied here are the coefficient map, continuity, the series
universal property and the compatibility with constants, variables and
iteration. Consumers apply that theorem with its admissibility and adicness
hypotheses; this roadmap does not assume a completed-tensor comparison for an
arbitrary continuous map or construct the general tensor product itself.

**Checks.** For discrete `A`, restricted series are polynomials. For `A = ℤ_p`
with its `p`-adic topology, reduction of `ℤ_p⟨X⟩` modulo `p^m` is
`(ℤ/p^m)[X]`. The series `Σ X^n` lies in the full formal ring `ℤ_p⟦X⟧`
but not in `ℤ_p⟨X⟩`. The completion in zero variables is `Â`, and is
identified with `A` only under completeness and separatedness.

**Dependencies.** §6.1 consumes AdicSpaces §§0.1–0.3 and its existing weighted
series modules. §6.2 also uses Layers 0–2; its noetherian consequence uses §5.2.
§6.3 consumes AdicSpaces Part III §F0.1 (`restricted-power-series-adic`),
which in turn uses `adic-completion-noetherian`, independently of formal schemes.
§6.4 uses §0.2 and §5.3. Sources: [Wedhorn] §5.6, especially 5.48–5.50;
[EGA] 0, §§7.5.1–7.5.4. The general tensor supplier is [Huber] §1.2.

## Layer 7: Open-disc, entire and overconvergent series

### 7.1 Series on an open disc

For `R₀ > 0`, define a series on the open disc of radius `R₀` by restrictedness
at every `0 < r < R₀`. It is a subring of the native formal series and carries
the topology generated by those Gauss norms. For complete coefficients it is
complete; give its description as compatible restricted series along a countable
sequence of radii increasing to `R₀`. Prove independence of that sequence,
polynomial density, coefficient continuity and evaluation at `‖x‖ < R₀`.

Bounded coefficient series lie in the open unit-disc algebra. Give the inclusion
of the bounded-coefficient algebra and its continuous evaluations at strict
unit-ball points. Surjectivity of this inclusion is not asserted. Translation,
derivatives, coefficient maps and substitution carry the radius conditions
obtained in Layers 1–2. The bounded and algebraic locally analytic Amice
transforms belong to functional analysis and the
[locally analytic distributions roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/pull/854).
Measure theory, distribution topologies and geometric Mellin transforms are
consumers of the coefficient algebra, not inputs to its construction.

### 7.2 Entire series and polynomial division

A series is entire when it is restricted at every real radius `r > 0`. Define
the subring on native `PowerSeries`, prove closure under the algebraic operations,
rescaling and Hasse derivatives, and give evaluation in every complete normed
coefficient algebra as in §2.1. Prove completeness and polynomial density for
the topology of all Gauss norms, equivalently those of a sequence tending to
infinity. No single Banach norm represents this topology.

For a polynomial `P` with invertible leading coefficient and an entire `F`
over a complete ultrametric norm-one commutative ring, prove unique division
`F = P Q + B`, with `Q` entire and `B` a polynomial of degree less than
`deg P`. Normalise `P` to be monic, apply §4.2 at every sufficiently large
radius, and use uniqueness to identify the quotients and remainders. Recover
the norm identity when the leading coefficient is a multiplicative unit and
the radius makes the polynomial distinguished. Include the zero remainder
case, division by `T-a`, and `F(a)=0` if and only if `F=(T-a)Q` for an entire `Q`.

Prove that coefficient maps commute with entire division and with evaluation
under their boundedness hypotheses. The associated coprimality notion uses
`IsCoprime` in the entire-series ring; provide its basic algebraic consequences.

**Explicit monic division.** For monic `P` of degree `d`, if
`Σ b_k T^k = (P.reverse)⁻¹`, prove that the quotient has coefficients
`Σ_k coeff (n+d+k) F · b_k`. Establish convergence and agreement with the
unique quotient above, including `P=1`. Export the quotient, its entireness,
the division identity and the evaluation/linear-factor criterion as a common API.
For `F(0)=1` and `F(a)=0`, prove `a` a unit with inverse
`−Σ_n coeff (n+1) F · a^n` (`IsEntire.isUnit_of_evalAt_eq_zero`).

**Monic entire resultant.** Define `entireResultant P F` as the determinant
of multiplication by the remainder on the finite free algebra `R[T]/(P)`.
Prove invariance modulo `P`, multiplicativity in `F`, bounded base change,
agreement with the degree-bounded polynomial resultant, and
`Res(T−a,F)=F(a)`. Supply `Res(P,F)=PG+HF` with `G` entire and `H` a
polynomial of degree less than `deg P`. Deduce that the resultant is a unit
exactly when `P,F` are coprime in the entire ring. These identities form the
public API for entire reduction, multiplication and Bézout arguments.
For degree zero the quotient algebra has rank zero: `Res(1,F)=1`, even for
`F=0`. For positive-degree monic `P`, `Res(P,0)=Res(P,P)=0`.
Test `Res(T²,a+bT)=a²` over rings with nilpotents, and the quotient `T−a`
and remainder `(a²−b)T+ab` in division of `T³` by `T²+aT+b`.

**Normalised entire preparation.** If `F(0)=1` and `F` is distinguished at
radius `r` of degree `d` as in §4.3, deduce `F=PG`, where `P(0)=G(0)=1`,
`deg P=d`, the leading coefficient of `P` is a unit, and `G` is entire and
invertible in the radius-`r` restricted algebra. Specify that the monic
normalisation of `P` is the distinguished polynomial of §4.3. Prove
uniqueness with this normalisation, entire coprimality of `P,G`, and
compatibility at nested radii where the hypotheses hold. Obtain entirety of
`G` by entire polynomial division and uniqueness after restricted preparation.
The monic polynomial from dividing `T^d` by `F` is `T^d` minus its remainder;
it is not its reciprocal. A zero series is excluded by `F(0)=1`.

These generic interfaces supply compact-operator and Fredholm theory.
Coleman's spectral transform, Fredholm resolvents and projectors are operator
constructions and remain outside this roadmap.

### 7.3 Overconvergent series

**Supplier contract: AdicSpaces Part IV §F1.1.** For finite variables over `K`,
consume its algebra
`W_n = ⋃_{ρ>1} K⟨ρ⁻¹X₁,…,ρ⁻¹X_n⟩`
inside the native formal-series ring, its ring/algebra structure, inclusion
in `T_n`, polynomial density and completion for the restricted unit Gauss norm.
This roadmap proves the comparison with the condition using a positive
polyradius whose coordinates are all greater than one, and compatibility of
the derivative and substitution operations with that inclusion.

Give the correct radius control for substitution: for overconvergent `f` and
overconvergent inner series of unit Gauss norm at most one, choose a common
radius slightly greater than one on which substitution satisfies §2.2.
Prove compatibility of the resulting substitutions with inclusion in `T_n`.
Radii in `√|K×|` suffice in the union; radii in `|K×|` alone need not suffice
for a discretely valued field. General dagger algebras and their locally convex
fringe topology are supplied by AdicSpaces Part IV §F1.

**Checks.** `Σ X^n` is open-unit-disc analytic and not unit-radius restricted.
`Σ p^n X^n` is overconvergent over `ℚ_p` but is not entire: its boundary radius
is `p`. `Σ p^(n²) X^n` is entire. Polynomials belong to all three constructions.
Over `ℚ_p`, the exponential `Σ X^n/n!` has a finite convergence radius and
must not be used as an example of an entire series.

**Dependencies.** §§7.1 and 7.3 use Layers 0–2; §7.3 also consumes the
`W_n` contract of AdicSpaces Part IV §F1.1. Entire division also uses Layer 4.
Sources: [Colmez] §§I.4 and II for open-disc coefficient analysis;
[Coleman] Appendix A3 for entire division; [GK] §1 for overconvergent series.
The stated radius-limit and coefficient-map compatibilities are explicit
consequences of the radius estimates and completeness in Layers 0–2.

## Dependency order

The normed construction and its Weierstrass theory have this order:

```text
Mathlib coefficients and ultrametric analysis
  → Layer 0 → Layer 1 → evaluation and substitution in §§2.1–2.3
                   ↘ Layer 3 → Layer 4 → Layer 5
                        ↘          ↘
                        maximum    Strassmann and coefficient recovery in §2.4
                        modulus

Layers 0–2 → open-disc series
Layers 0–2 and Part IV §F1.1 → overconvergent analytic comparisons
Layers 0–2 and 4 → entire series and polynomial division

AdicSpaces topological algebra → §6.1
§6.1 and normed Layers 0–2 → §6.2
Part III §F0.1 adic restricted series and §6.2 → §6.3 comparisons
§0.2 and §5.3 → §6.4
```

The arrows to §2.4 are deliberate: none of Layers 3–5 uses Strassmann's theorem.
Layer 5 uses only its maximum principle, which follows from Layer 3 without
division. Thus this dependence introduces no cycle.
General affinoid geometry, Newton polygons and Fredholm theory consume the
results; they are not prerequisites. A dependency on a subsection does not
require completing the rest of that consumer's roadmap.

## Completion criteria

The roadmap is complete when the following interfaces agree on the specified
carriers and all layer checks are proved, using the named suppliers for the
contracts they own. This criterion does not require separate proofs of supplied
theorems.

1. Polynomial approximation, coefficient maps, normed restricted series and
   topological completions commute through the named comparisons.
2. Evaluation and analytic substitution have the stated universal properties,
   radius bounds, coefficient formulas and compatibility with formal operations.
3. Division and preparation work at arbitrary positive radii with general
   Banach-ring coefficients and a multiplicatively distinguished divisor;
   the existing multiplicative-norm and field versions are recovered.
4. The several-variable Tate-algebra structure and finite-module results are
   available in all characteristics on the common unit-radius carrier.
5. Adic restricted series reduce to polynomial rings, and the hypotheses
   distinguishing the topological and normed universal properties are explicit.
6. Open-disc, entire and overconvergent series share the radius/evaluation API
   while retaining their distinct defining conditions and topologies.

An implementation should exercise these through actual consumers: Newton
factorisation uses §4; the locally analytic disc model uses §§1.3 and 2;
radius-improving operators use §1.2; entire Fredholm algebra uses §7.2;
classical affinoid presentations use Layer 5; and Huber and dagger constructions
use Layers 6–7. Those applications do not become additional targets here.

## References

- **[BGR]** S. Bosch, U. Güntzer and R. Remmert, *Non-Archimedean Analysis*,
  Grundlehren 261, Springer, 1984. §§5.1–5.2 for Tate algebras and Weierstrass
  theory; §7.1.1 for polynomial generators of maximal ideals. Banach-ring
  generalisations are stated with the hypotheses of [Martin].
- **[Bosch]** S. Bosch, *Lectures on Formal and Rigid Geometry*, April 2008
  preprint, SFB 478 Heft 378; published as LNM 2105, Springer, 2014.
  Section references here use the [preprint](https://www.uni-muenster.de/IVV5WS/WebHop/user/weckerm/heft378.pdf): §§1.2–1.3, especially the
  distinguished-coordinate and strict-closedness arguments. The book renumbers them.
- **[Martin]** F. Martin, [*Overconvergent subanalytic subsets in the framework
  of Berkovich spaces*](https://ems.press/journals/jems/articles/14025),
  J. Eur. Math. Soc. 18 (2016), 2405–2457, §1.3. Multiplicative units,
  distinguishedness, division and preparation are Definitions 1.20 and 1.24,
  Lemma 1.26, Proposition 1.27 and Corollary 1.28 of the published article.
- **[Wedhorn]** T. Wedhorn, [*Adic Spaces*, arXiv:1910.05934v1](https://arxiv.org/abs/1910.05934v1),
  §5.6, especially 5.48–5.50 for the weighted series and their universal property.
- **[EGA]** A. Grothendieck and J. Dieudonné, *Éléments de géométrie algébrique I*,
  Chapter 0, §§7.5.1–7.5.4: restricted series over adic rings and their reductions.
- **[Huber]** R. Huber, *Étale cohomology of rigid analytic varieties and adic
  spaces*, Vieweg, 1996, §1.2. General completed tensor products are consumed
  through the explicitly named AdicSpaces Part II target.
- **[Colmez]** P. Colmez, *Fonctions d'une variable p-adique*, Astérisque 330
  (2010), 13–59, §§I.4 and II. The functional-analytic and distribution-theoretic
  objects remain with their own roadmaps.
- **[Coleman]** R. Coleman, *p-adic Banach spaces and families of modular forms*,
  Invent. Math. 127 (1997), 417–479, Appendix A3. The entire-series division
  statements here retain entireness in uniqueness assertions.
- **[GK]** E. Große-Klönne, [*Rigid analytic spaces with overconvergent structure
  sheaf*](https://arxiv.org/abs/1408.3329), J. Reine Angew. Math. 519 (2000),
  73–95, §1. Only the series algebra and its unit-norm completion are developed here.

## Existing Lean work

William Coram's [restricted-series development](https://github.com/WilliamCoram/PhD/tree/eefb3d91f34b27d0bc7822140fa85fecae029884/PhD/TauCeti/Code/RigidAnalyticGeometry/Restricted)
is prior work for the Banach-ring and polyradius targets. In particular,
[`NormMulUnit.lean`](https://github.com/WilliamCoram/PhD/blob/eefb3d91f34b27d0bc7822140fa85fecae029884/PhD/TauCeti/Code/RigidAnalyticGeometry/Restricted/NormMulUnit.lean)
and the `PowerSeries/MulDistinguished`, `PowerSeries/MulWeierstrassDivision` and
`PowerSeries/MulWeierstrassPrep` modules implement candidate definitions and
proofs for Layer 4. The neighbouring
[Tate-algebra development](https://github.com/WilliamCoram/PhD/tree/eefb3d91f34b27d0bc7822140fa85fecae029884/PhD/TauCeti/Code/RigidAnalyticGeometry/TateAlgebra)
is prior work for Layer 5.

These links are secondary provenance, not dependencies or a prescribed proof
route. Audit any reused proofs against the hypotheses and native carriers in
this specification, preserve attribution, and use the existing Tau Ceti result
when it already supplies the interface. Production mathematics does not import
roadmap prototypes or their admitted theorem targets.
