# Roadmap: curves over finite fields — zeta functions, the Riemann hypothesis, and Weil polynomials

A curve over a finite field `𝔽_q` is, for this roadmap, an algebraic function field `F / k` in one
variable over a finite constant field `k` with `q = #k` elements, exactly as Tau Ceti's function-field
library (built to the [algebraic curves roadmap](../AlgebraicCurves/README.md)) presents it: places,
divisors, Riemann–Roch spaces, the genus `g`, the degree-zero class group `Cl⁰(F)` and its order
`h_F`. The arithmetic that a finite constant field adds is built in
[FunctionFieldArithmetic](../FunctionFieldArithmetic/README.md): its Layer 5 defines the zeta
function `Z(F, T)` as the generating series of effective divisors, proves its Euler product,
rationality and functional equation and the identity `L_F(1) = h_F` for the numerator
`L_F(T) ∈ ℤ[T]`, compares `Z(F, T)` with the scheme zeta function and `L_F` with the Jacobian
numerator, treats constant-field extensions, and recovers `L_F` from the first `g` point counts,
importing the Riemann hypothesis for curves (the inverse roots of `L_F` have absolute value `√q`);
[SchemeAndStackFoundations](../SchemeAndStackFoundations/README.md) §5.11 proves the Weil bound by
intersection theory on `C × C`. This roadmap reads those results in the vocabulary of Weil
polynomials — the reversed, monic form `P_F(T)` of `L_F` is a **Weil `q`-polynomial** — and builds
what follows from them: the Serre and Ihara bounds, the class-number bounds, the relations among
the point counts `N_r` over the constant-field extensions, and the maximal-curve criterion.

The second half of the roadmap is the theory of Weil `q`-polynomials **as combinatorics on `ℤ[T]`**:
the predicate, `q`-Weil numbers, finiteness in each degree, the symmetry that the functional equation
imposes, real Weil polynomials and the `±√q` dictionary, the Newton polygon at `p` with the `p`-rank
and the ordinary / almost-ordinary / supersingular predicates, Frobenius angles and the angle rank,
the number field and the Galois group of a Weil polynomial, irreducibility and factorization
predicates, Weil powers with the polynomial twist relation and Weil roots (the polynomial side of base
change), and the point-count sequences
a Weil polynomial determines. None of this refers to an abelian variety. It is exactly the shape of the
LMFDB's search space of isogeny classes of abelian varieties over finite fields (`av.fq`), and the
sibling roadmap `AbelianVarietiesOverFiniteFields` consumes every polynomial-level object from here
by the public names fixed in the conventions below; nothing is supplied in the other direction.

**Carrier.** Throughout the function-field layers: `k` and `F` are fields with `[Algebra k F]`,
`[Finite k]`, `hF : TauCeti.IsFunctionField k F` and `hex : IsIntegrallyClosedIn k F` (exact
constants), both passed explicitly; `q := Nat.card k`; `g := TauCeti.genus k F`. Throughout the
Weil-polynomial layers: a natural number `q` and a polynomial `P : ℤ[X]`, with `IsPrimePow q`,
`p := q.minFac` and `r := q.factorization p` assumed only where the Newton polygon needs them.

**Suggested home.** `TauCeti/NumberTheory/FunctionField/Zeta/` for Layers 2, 3 and 5 (the Weil
polynomial of a function field, the bounds, the comparisons), and
`TauCeti/NumberTheory/WeilPolynomial/` for Layer 4 (the polynomial theory, which imports nothing
from the function-field side). [`Suggested.lean`](Suggested.lean) states the headline theorems
against the pinned libraries; it is not the roadmap.

## Prerequisites

- **Tau Ceti's function-field library** (the implementation of the
  [algebraic curves roadmap](../AlgebraicCurves/README.md)), under `TauCeti/FieldTheory/FunctionField/`:
  `TauCeti.IsFunctionField`, `TauCeti.Place` with `Place.degree`, `TauCeti.Divisor`, `TauCeti.genus`,
  the class number `Divisor.classNumber` with `Place.degreeOneEquivDegreeZeroClassGroup`, the
  compositum `TauCeti.constantCompositum` with the constant-field-extension theorems of
  `ConstantExtension/` (genus preserved along separable constant extensions), and the elliptic
  dictionary of `Elliptic/` (`IsEllipticFunctionField`, `Place.IsWeierstrassCoordinates`).
- **[FunctionFieldArithmetic](../FunctionFieldArithmetic/README.md)** §0.2 and §§5.1–5.6, and
  **[SchemeAndStackFoundations](../SchemeAndStackFoundations/README.md)** §5.11 (see *Consumed, not
  redefined*).
- **Mathlib**: polynomials over `ℤ` (`Polynomial.reverse`, `Polynomial.aroots`, `Polynomial.Monic`,
  `Polynomial.dickson`, `Polynomial.Gal`, `AdjoinRoot.powerBasis'`, `LinearMap.toMatrix`,
  `Matrix.charpoly`), the Mahler measure (`Polynomial.finite_mahlerMeasure_le`), number fields and
  their embeddings (`NumberField`, `NumberField.IsCMField`,
  `NumberField.Embeddings.pow_eq_one_of_norm_eq_one`), `padicValInt`, `IsPrimePow`,
  `Nat.factorization`, `ArithmeticFunction.moebius`.
- **Tau Ceti's elliptic-curve library** at `TauCeti/AlgebraicGeometry/EllipticCurve/`:
  `WeierstrassCurve.pointCount`, `WeierstrassCurve.frobeniusTrace` and
  `WeierstrassCurve.frobeniusTrace_sq_le_four_mul_card` / `WeierstrassCurve.hasse_bound` (the
  implementation of [EllipticCurves](../EllipticCurves/README.md) Layer 3).

## Scope and ownership

### Owned here

- **The Weil polynomial of a function field** (Layer 2): `P_F := reverse L_F` for the
  `L`-polynomial of FunctionFieldArithmetic §5.3, its symmetry and its roots in the vocabulary of
  Layer 4, the integer point-count formula `N_r = virtualCurveCount q P_F r`, constant-field
  extension as a Weil power, and the genus-one case.
- **The Riemann hypothesis in Weil-polynomial form and its corollaries** (Layer 3):
  `IsWeilPolynomial q P_F`, the coefficient and class-number bounds, Serre's and Ihara's bounds, the
  relations among the `N_r`, and the maximal-curve criterion. The Riemann hypothesis for the roots
  of `L_F` and the Hasse–Weil bound themselves are consumed.
- **Weil polynomials as combinatorics on `ℤ[T]`** (Layer 4): everything listed in the introduction.
  This is the home of every polynomial-level invariant of an `av.fq` isogeny class; the sibling
  `AbelianVarietiesOverFiniteFields` consumes 4.1–4.11 by section and defines none of these
  objects a second time (its polynomial preliminaries are citations of this layer).
- **Comparison contracts** (Layer 5) with Tau Ceti's elliptic-curve point counts, Hasse bound,
  supersingularity and zeta function, and between the two Weil-number predicates.

### Consumed, not redefined

- From Tau Ceti's function-field library (the merged [AlgebraicCurves](../AlgebraicCurves/README.md)
  roadmap): places, degrees, divisors, `Cl⁰(F)`, the genus and the class number `h_F` (its Layers
  0–5), constant-field extensions with the preservation of the genus along separable extensions of
  constants (its Layer 8), and the elliptic dictionary with Weierstrass coordinates (its Layer 10).
  Everything is consumed by the Tau Ceti declaration names listed under *Prerequisites*; this
  roadmap adds no second definition of any of them. The Hermitian function field `y^q + y = x^{q+1}`
  with its translation group is not at the pin (*What Tau Ceti supplies*) and is cited by module
  path in prose: `TauCeti/FieldTheory/FunctionField/Hermitian/*`.
- From [FunctionFieldArithmetic](../FunctionFieldArithmetic/README.md), the whole zeta-function
  theory of a function field over a finite constant field, with its names: §0.2
  `exists_divisor_degree_eq_one` (a divisor of degree one exists); §5.1 `placeCount d`
  (`a_d(F)`), `effectiveDivisorCount n` (`A_n(F)`), `pointCount r` (`N_r(F) := ∑_{d ∣ r} d · a_d`),
  the zeta series `zeta k F := ∑_n A_n T^n ∈ ℤ⟦T⟧`, its Euler product `zeta_eulerProduct`, the
  logarithmic derivative `zeta_logDeriv` (`log Z = ∑_r N_r T^r / r` over `ℚ`), `pointCount_eq`
  (`N_r(F)` is the number of degree-one places of the constant extension `F · 𝔽_{q^r}`), the
  rational function field (`N_r = q^r + 1`), `N_r(F · 𝔽_{q^s}) = N_{rs}(F)` and the Möbius inversion
  `r · a_r = ∑_{d ∣ r} μ(r/d) N_d`; §5.2 `effectiveDivisorCount_eq` and
  `effectiveDivisorCount_of_large` (the class-number formula for `A_n`); §5.3 `zeta_rationality`
  (`L_F := (1 − T)(1 − qT) Z(F, T)` is a polynomial of degree `2g` with `L_F(0) = 1`,
  `b_1 = N_1 − (q + 1)`, leading coefficient `q^g`, `b_{2g−j} = q^{g−j} b_j`, `L_F(1) = h_F`);
  §5.4 `zeta_eq_schemeZeta` (`Z(F, T)` is the zeta function of the regular projective model and
  `L_F` the curve numerator of WeilConjectures WC.1 and the reversed Jacobian characteristic
  polynomial of DeligneWeightsAndPurity §1.6, whence `N_r = q^r + 1 − ∑ α_i^r`, `|α_i| = √q` and
  `|N_r − q^r − 1| ≤ 2g q^{r/2}`); §5.5 `lPolynomial_constantExtension`
  (`L_{F·𝔽_{q^r}}(T^r) = ∏_{ζ^r = 1} L_F(ζ T)`) and `zeta_constantExtension`; §5.6
  `IsLPolynomialData`, `IsLPolynomialData.unique` and `lPolynomial_isLPolynomialData` (`N_1, …, N_g`
  determine `L_F`). Here `LPolynomial k F` is a reducible alias of §5.3's `L_F`, and
  `a_d`, `A_n`, `N_r`, `Z(F, T)` always mean that roadmap's objects.
- From [SchemeAndStackFoundations](../SchemeAndStackFoundations/README.md) §5.11
  `weil_bound_via_surfaces`: `|#C(𝔽_q) − (q + 1)| ≤ 2g√q` for a smooth projective geometrically
  irreducible curve `C / 𝔽_q`, by the Hodge index theorem on `C × C`, with its agreement with Tau
  Ceti's `WeierstrassCurve.hasse_bound` at `g = 1` (`weilBound_eq_hasse`). Applied to the constant
  extensions through FunctionFieldArithmetic §5.1's `pointCount_eq`, it is the Hasse–Weil bound for
  every `N_r(F)`; Layer 3 and 5.1 consume it.
- From [NewtonPolygons](../NewtonPolygons/README.md): the Newton polygon of a polynomial for an
  additive valuation with an explicit normalisation (its Conventions 1–4 and §2.1), the finite slope
  multiset (§2.1, §3.3) and the product rule for slopes (§3.2). That roadmap names
  `Polynomial.newtonPolygon` (§2.1); `Polynomial.newtonSlopes f v` for the finite slope multiset
  and `newtonSlopes_mul`, `newtonSlopes_eq_map_roots` for its §3.2 and §3.3 are this roadmap's
  suggested names for those targets, not declarations at the pin. The Newton polygon of a Weil
  polynomial (4.6) is that polygon
  for the `p`-adic valuation normalised by `v(q) = 1`, and no second polygon or envelope is defined
  here. The `p`-rank and the supersingular / ordinary / almost-ordinary predicates have elementary
  coefficient definitions of their own (4.6), and their identification with slope data is a theorem.
- From [EllipticCurves](../EllipticCurves/README.md) Layer 3, as implemented in Tau Ceti:
  `WeierstrassCurve.pointCount` (all `k`-points of the projective Weierstrass model),
  `WeierstrassCurve.frobeniusTrace` `a_q = q + 1 − pointCount`, and the Hasse bound
  `frobeniusTrace_sq_le_four_mul_card`. Layer 5 identifies these with `N_1(F)` and with the
  coefficient of `T` in `L_F` for the function field of an elliptic curve; the Hasse bound is then
  the `g = 1` case of the Hasse–Weil bound consumed above, and the proofs are reconciled, not
  duplicated. Its zeta function
  `WeierstrassCurve.zetaFunction : ℚ⟦X⟧` with `zetaRatFunc`, `logOf_zetaFunction` and
  `zetaFunction_eq_mul_inv`, and its model of record for `E(𝔽_{qⁿ})` as the fixed points of the
  `q`-power map (both not at the pin, *What Tau Ceti supplies*), are the objects 5.2 compares
  with.
- From the Deligne weights roadmap `DeligneWeightsAndPurity` (directory
  `TauCetiRoadmap/DeligneWeightsAndPurity/`): §0.1 `IsWeilNumber q n α` (algebraic over `ℚ`, every
  complex root of the minimal polynomial of modulus `q^{n/2}`, with `1 < q`) and §0.2–0.3 (products,
  inverses, conjugates, change of `q` to `q^r`). The predicate `IsWeilPolynomial` of 4.1 is stated on
  polynomials and 4.1 records the comparison: `P` is a Weil `q`-polynomial iff every root of `P` is
  an `IsWeilNumber q 1`.
- From the Faltings finiteness roadmap `FaltingsFinitenessAndIsogenyTheorems` (directory
  `TauCetiRoadmap/FaltingsFinitenessAndIsogenyTheorems/`): R28.5.1 `finite_weilPolynomials`, the
  finiteness of monic `P ∈ ℤ[X]` of degree `n` all of whose complex roots have absolute value `r`,
  by Mathlib's Mahler-measure Northcott theorem. 4.3 consumes it.
- From [PolynomialGaloisGroups](../../Completed/PolynomialGaloisGroups/README.md): the permutation
  representation of `Polynomial.Gal p` on the roots (its Layer 0), the dictionary between Galois
  theory and permutation groups (its Layer 2), and the transitive-group label predicates of its
  Layer 6 for `n ≤ 5`. 4.8 states the Galois group of a Weil polynomial as `Polynomial.Gal` and
  stops: which `nTj` label it carries is that roadmap's vocabulary.
- From the completed [Number Field Arithmetic](../../Completed/NumberFieldArithmetic/README.md)
  roadmap, as Tau Ceti and Mathlib library code: number fields given by an irreducible polynomial,
  their degree, discriminant and infinite places; 4.8 constructs `ℚ(π)` and states its CM structure
  against Mathlib's `NumberField.IsCMField`.

### Not owned here

- **Abelian varieties over finite fields** — Frobenius endomorphisms, Tate's isogeny theorem,
  Honda–Tate, isogeny classes, endomorphism algebras, polarizations, Jacobians, the `is_simple`,
  `is_geometrically_simple`, `has_jacobian`, `has_principal_polarization`, `size`, `is_cyclic`,
  `noncyclic_primes`, `curves`, `jacobian_count`, `hyp_count`, `geometric_extension_degree`,
  `is_primitive`, `primitive_models`, `twists`, `twist_count` and `max_twist_degree` columns of
  `av.fq` *as statements about abelian varieties* — are the sibling roadmap
  `AbelianVarietiesOverFiniteFields` (its 5.4, 5.5 and 5.6 for the last six: which Weil polynomial
  is the `P_B` of an abelian variety is Honda–Tate, and base-change models and twists range over
  realized classes only). It consumes `IsWeilPolynomial`, `IsWeilSymmetric`,
  `realWeilPolynomial`, `pRank`, `IsOrdinary`, `IsSupersingular`, `IsAlmostOrdinary`,
  `frobeniusAngles`, `angleRank`, `weilPower`, `weilPowerSum`, `virtualCurveCount`,
  `virtualAbvarCount`, `IsTwistOver`, `twistDegree`, `weilRoots`, `geometricExtensionDegree`, the
  factorization predicates of 4.9 and the number field and Galois group of 4.8 from here, and
  proves that the Weil polynomial of an abelian variety has these invariants — including
  Waterhouse's list of the traces of elliptic curves over `𝔽_{p^r}` and, through it, the agreement
  of the geometric supersingularity of an elliptic curve with the coefficient criterion
  `IsSupersingular q P_E` of 4.6 for `r ≥ 3` (5.1 proves the cases `r ≤ 2`, which are polynomial
  identities). Nothing from that roadmap is an input here.
- **Étale cohomology and the cohomological route** to zeta functions and weights: the
  `CohomologicalPointCounting` family, `WeilConjectures` and `DeligneWeightsAndPurity`. The
  comparison of the zeta function with them is FunctionFieldArithmetic §5.4; nothing cohomological
  is built or stated here.
- **Character sums** — Gauss and Jacobi sums, Hasse–Davenport, Kloosterman sums and the Weil bound for
  character sums, including the point counts of Kummer and Artin–Schreier covers of `ℙ¹` expressed
  through them — are the sibling `CharacterSumsOverFiniteFields`, a neighbour with its own
  Stepanov route that consumes nothing from here; no character sum is defined here.
- **Hyperelliptic curves and their reductions**: the models, Igusa invariants, bad primes and the
  reduction of a genus-2 curve over `ℚ` modulo `p` are the sibling `HyperellipticCurves`. The good
  Euler factor `L_p(T)` displayed on a `g2c` page is the `L`-polynomial of the function field of the
  reduced curve (FunctionFieldArithmetic §5.3), which that roadmap reads in the vocabulary of 2.1
  and 3.1 (*Downstream consumers*); the reduction itself is theirs, as are the Euler factors at bad
  primes.
- **Modular and Shimura curves**: `AdelicImagesAndModularCurves` and `QuaternionArithmetic` own the
  curves; point counts of their reductions over `𝔽_p` are instances of FunctionFieldArithmetic
  Layer 5 and of Layers 2–3 here applied to the function field of the reduction, with nothing
  modular-specific here.
- **Labels, orderings and stored lists**: label components beyond the intrinsic prefix, orderings
  fixed by convention, stored lists, and the completeness of database tables are not targets. These
  include the base-26 encoding of the `isog` part of an `av.fq` label, the ordering of isogeny
  classes, the transitive-group label of a Galois group and the LMFDB label of a number field, the
  enumeration of isogeny classes of given `(g, q)`, and the stored counts of twists, Jacobians and
  hyperelliptic Jacobians per class. The *intrinsic prefix* of an `av.fq` label is `(g, q, a_1, …, a_g)` where `L = 1 + a_1 T + ⋯ + a_g T^g + ⋯`
  (the coefficients of the `L`-polynomial below the middle), and that prefix is defined here (4.4);
  nothing enumerative is.
- **Asymptotics and finer bounds**: the Drinfeld–Vlăduţ bound, Ihara's constant `A(q)`, towers of
  function fields, Oesterlé's explicit-formula bound and the Stöhr–Voloch bound. They are not
  milestones of any layer here.
- **Equidistribution of Frobenius angles** (Sato–Tate over function fields, Deligne's
  equidistribution) is `DeligneWeightsAndPurity` DWP.10 and the sibling `SatoTateGroups`; the angles
  themselves are defined here (4.7).
- **Goppa codes**: the completed [Algebraic Coding Theory](../../Completed/AlgebraicCodingTheory/README.md)
  roadmap uses only finite fields and no function field; there is no interface in either direction.

### The LMFDB invariants of `av.fq`, placed

| LMFDB column / knowl | Owner | Where |
| --- | --- | --- |
| `poly` (the `L`-polynomial, `av.fq.l-polynomial`), `av.fq.weil_polynomial`, `initial_coefficients` | here (for a function field, the reverse of FunctionFieldArithmetic §5.3's `L_F`) | 2.1, 4.1, 4.4 |
| `real_poly` (the real Weil polynomial) | here | 4.4 |
| `g`, `q`, `p` | here (the carrier) | conventions |
| `p_rank`, `p_corank`, `slopes` (`lf.newton_slopes`), `newton_elevation`, `is_ordinary`, `is_supersingular`, almost ordinary | here | 4.6 |
| `angles` (`av.fq.frobenius_angles`), `angle_rank`, `angle_corank` | here | 4.7 |
| `number_fields`, `galois_groups` (`av.fq.number_field`, `av.fq.galois_group`) | here (the field and the group); their labels are not a target | 4.8 |
| `is_simple`, `simple_distinct`, `simple_multiplicities`, `geom_squarefree` at the level of `P` | here (irreducibility, isotypy, squarefreeness, factor multiset of `P` and of `P^{(r)}`); the equivalence with simplicity of the variety: `AbelianVarietiesOverFiniteFields` | 4.9, 4.10 |
| `is_primitive`, `primitive_models` | `AbelianVarietiesOverFiniteFields` 5.5 (a base-change model must be realized, which is Honda–Tate); the finite set of polynomial models `weilRoots` it searches: 4.10 | 4.10 (supplier) |
| `twists`, `twist_count`, `max_twist_degree` | `AbelianVarietiesOverFiniteFields` 5.6 (over realized classes); the polynomial relation `IsTwistOver` and the degree `twistDegree` it is decided by: 4.10; the order of the stored list is not a target | 4.10 (supplier) |
| `geometric_extension_degree` | `AbelianVarietiesOverFiniteFields` 5.4 (the endomorphism field); the polynomial invariant `geometricExtensionDegree` it equals: 4.10 | 4.10 (supplier) |
| `curve_counts` (`av.fq.curve_point_counts`), `abvar_counts` (`ag.fq.point_counts`) | here as the sequences `P` determines (4.11); their equality with `N_r(F)` for a Jacobian: `AbelianVarietiesOverFiniteFields` | 4.11, 2.2 |
| `is_geometrically_simple` | `AbelianVarietiesOverFiniteFields` 5.3; the polynomial-level sufficient condition `IsGeometricallyIrreducible` (every Weil power irreducible): 4.10 | 4.10 (supplier) |
| `has_jacobian`, `has_principal_polarization`, `size`, `is_cyclic`, `noncyclic_primes`, `curves`, `jacobian_count`, `hyp_count` | `AbelianVarietiesOverFiniteFields` (the counts as definitions: its 10.6); the stored `curves` list is not a target | — |
| `av.fq.class_number_1` (the eight curves of class number one) | not owned here; the polynomial-level necessary conditions are 3.4 and 4.11 | — |
| `g2c` good Euler factors (`g2c.good_lfactors`) | `HyperellipticCurves` (the reduction), reading the `L`-polynomial FunctionFieldArithmetic §5.3 attaches to the reduced curve's function field through 2.1 and 3.1 | *Downstream consumers* |
| `ec` `a_p` | [EllipticCurves](../EllipticCurves/README.md) Layer 3 (Tau Ceti `frobeniusTrace`), identified with `q + 1 − N_1` here | 5.1 |

## Pinned conventions

1. **Standing hypotheses.** `[Field k] [Field F] [Algebra k F] [Finite k]`, `hF : IsFunctionField k F`
   and `hex : IsIntegrallyClosedIn k F` are explicit arguments, never bundled, as in
   FunctionFieldArithmetic Layer 5. `q := Nat.card k`,
   `g := TauCeti.genus k F`. Exactness of constants is the hypothesis under which `L(0) = k`,
   degrees are the honest ones and `L_F` has degree `2g`; over a non-exact constant field the
   definitions below return junk and the theorems carry `hex`.
2. **Counts.** `a_d(F)`, `A_n(F)` and `N_r(F)` are FunctionFieldArithmetic §5.1's `placeCount d`,
   `effectiveDivisorCount n` and `pointCount r`: `Nat.card` of the places of degree `d`, `Nat.card`
   of the effective divisors of degree `n`, and `N_r := ∑_{d ∣ r} d · a_d` over `Nat.divisors r`
   (so `N_0 = 0`). `Nat.card`'s junk value `0` on an infinite type is never reached under `hF`, by
   Tau Ceti's `Place.finite_setOf_degree_le` and `Divisor.finite_setOf_isEffective_degree_le`.
3. **Point counts are intrinsic.** `N_r(F)` names no chosen extension field; that it is the number
   of degree-one places of the degree-`r` constant extension is FunctionFieldArithmetic §5.1's
   `pointCount_eq`, a theorem, so `FiniteField.Extension`'s noncanonical choice never enters a
   definition. A statement here about a constant extension takes a model `F' / k'`: `[Finite k']`,
   the scalar tower of Tau Ceti's `ConstantExtension/`, `constantCompositum F k' F' = ⊤`,
   `Module.finrank k k' = r`. (The merged [EllipticCurves](../EllipticCurves/README.md) roadmap pins
   the fixed points of the `q`-power map as its model of `E(𝔽_{qⁿ})`; 5.2 reconciles the two.)
4. **The zeta function** is FunctionFieldArithmetic §5.1's `zeta k F = ∑_{n ≥ 0} A_n(F) T^n ∈ ℤ⟦T⟧`,
   with that section's Euler product and logarithmic derivative; no zeta function is defined here.
5. **`L`-polynomial and Weil polynomial.** `L_F ∈ ℤ[T]` is FunctionFieldArithmetic §5.3's polynomial
   `(1 − T)(1 − qT) Z(F, T)` (the polynomial of `zeta_rationality`), written `LPolynomial k F` as a
   reducible alias, with coefficients `b_n := L_F.coeff n`: `L_F(0) = 1`, `deg L_F = 2g`, leading
   coefficient `q^g`, `L_F(1) = h_F`. The **Weil polynomial** of `F` is
   `P_F := Polynomial.reverse L_F = T^{2g} L_F(1/T)`, monic of degree `2g` with `P_F(0) = q^g`. The
   `α_1, …, α_{2g}` are the complex roots of `P_F` (the reciprocal roots of `L_F`), as the multiset
   `P_F.aroots ℂ`. The LMFDB's `poly` column is the coefficient list of `L_F`; its "Weil polynomial"
   and "characteristic polynomial" is `P_F`; "`L`-polynomial" and "Weil polynomial" are used with
   exactly these meanings here.
6. **The functional equation**, coefficientwise and integral. FunctionFieldArithmetic §5.3 states
   `b_{2g−j} = q^{g−j} b_j` for `0 ≤ j ≤ g`; it is used here in the equivalent form
   `q^j · b_{2g−j} = q^g · b_j` for all `0 ≤ j ≤ 2g`, and for `P_F = ∑ a_j T^j` (so `a_j = b_{2g−j}`)
   as `q^j · a_j = q^g · a_{2g−j}` for all `0 ≤ j ≤ 2g`. No division.
7. **Weil polynomials.** For `q : ℕ` and `P : ℤ[X]`, `IsWeilPolynomial q P :=
   P.Monic ∧ ∀ z ∈ P.aroots ℂ, ‖z‖ = √q` — the LMFDB's `nf.weil_polynomial` (monic, integer
   coefficients, all complex roots of absolute value `√q`); odd degrees and real roots `±√q` are
   allowed, `P = 1` is a Weil polynomial of degree `0`, and `q` is any natural number (the theorems
   that need `IsPrimePow q` say so). A **`q`-Weil number** is a root of a Weil `q`-polynomial,
   equivalently an algebraic integer all of whose conjugates have modulus `√q`;
   `DeligneWeightsAndPurity` §0.1's `IsWeilNumber q 1 α` is that predicate on an element of a
   characteristic-zero field, and 4.1 records the equivalence. **Symmetry**:
   `IsWeilSymmetric q g P := P.natDegree = 2g ∧ ∀ j ≤ 2g, q^j · P.coeff j = q^g · P.coeff (2g − j)`,
   the functional-equation shape of item 6. The Weil polynomial of a function field is symmetric
   (2.1); a Weil polynomial need not be (`T² − 2` for `q = 2`).
8. **The real Weil polynomial** of a symmetric `P` of degree `2g` is
   `h_P := C(a_g) + ∑_{i=1}^{g} C(a_{g+i}) · dickson 1 (q : ℤ) i ∈ ℤ[X]`, Mathlib's Dickson
   polynomials of the first kind with parameter `q`, so that `P(T) = T^g h_P(T + q/T)` and the roots
   of `h_P` are `α_i + ᾱ_i = 2√q cos(π θ_i)`. This is the definition; the polynomial identity is a
   theorem (4.4).
9. **Newton polygon and slopes.** For `IsPrimePow q`, `p := q.minFac`, `r := q.factorization p`, the
   Newton polygon of a Weil polynomial `P` at `p` is the Newton polygon, in the sense of
   [NewtonPolygons](../NewtonPolygons/README.md) Convention 2, of the **`L`-polynomial**
   `reverse P` (constant term `1`, so the polygon starts at `(0, 0)`, as the LMFDB knowl
   `lf.newton_polygon` says) for the additive valuation `v := v_p / r`, normalised so that
   `v(q) = 1`. Its slope multiset `slopes P` (that roadmap's `newtonSlopes`) has `2g` entries in
   `[0, 1] ∩ ℚ`, is symmetric under `s ↦ 1 − s`, and with that roadmap's orientation its slopes are
   the normalised `p`-adic valuations of the `α_i` taken in `ℚ̄_p`. The **`p`-rank** is defined
   elementarily, `pRank p P := natDegree P − sInf {j | p ∤ P.coeff j}` (for monic `P` the set
   contains `natDegree P`), equal to the multiplicity of the slope `0` (4.6).
   `IsOrdinary q g P ⇔ pRank p P = g`, `IsAlmostOrdinary q g P ⇔ pRank p P = g − 1`, and
   `IsSupersingular q P := ∀ j, P.coeff j = 0 ∨ r · (2g − j) ≤ 2 · padicValInt p (P.coeff j)`
   (every point of the `L`-polygon lies on or above the line of slope `1/2`); all three
   predicates take `q` and derive `p := q.minFac`. For a Weil `q`-polynomial the last is
   equivalent to "all slopes equal `1/2`" (4.6); for an arbitrary monic `P` it is not (`T² + 16`
   at `q = 2` satisfies it with slopes `{2, 2}`). The **elevation** is the number of lattice points `(x, y)` with
   `0 ≤ x ≤ g`, `y ≥ 0`, lying strictly below the polygon (knowl `av.fq.newton_elevation`).
10. **Frobenius angles.** `frobeniusAngles P : Multiset ℝ` is the image of the roots `z` of `P` in
    `ℂ` with `0 ≤ z.im` under `z ↦ Complex.arg z / π`: one angle `θ ∈ [0, 1]` per pair of non-real
    conjugate roots, with multiplicity, and the real roots `√q` and `−√q` contributing `0` and `1`
    **each with its full multiplicity**. This is the LMFDB's `angles` list verbatim (`1.4.ae`, with
    `P = (T − 2)²` and `g = 1`, stores `[0, 0]`; `2.2.a_ae` stores `[0, 0, 1, 1]`), so a symmetric `P`
    of degree `2g` has `g` angles when it has no real root and `g + m/2` when it has `m` real roots
    (`m` is even, 4.5). The **angle rank** is
    `angleRank P := Module.finrank ℚ (Submodule.span ℚ ({1} ∪ {θ | θ ∈ frobeniusAngles P})) − 1`
    (knowl `av.fq.angle_rank`: `dim_ℚ Span_ℚ({θ_i} ∪ {1}) − 1`); the angle corank is
    `g − angleRank P`. The LMFDB computes the angle rank numerically (knowl
    `av.fq.frobenius_angles_correctness`); here it is the exact rational dimension.
11. **Weil powers.** For monic `P` and `r ≥ 1`, `weilPower hP r` is the characteristic polynomial of
    multiplication by `root^r` on `AdjoinRoot P` with respect to the power basis
    `AdjoinRoot.powerBasis' hP` — the monic integer polynomial whose roots are the `α_i^r` with
    multiplicity, written `P^{(r)}` — and `weilPowerSum hP r` is its trace, the integer
    `s_r = ∑ α_i^r`. Both are honest integer definitions; the root descriptions are theorems.
12. **Point counts of a Weil polynomial.** `virtualCurveCount q hP r := q^r + 1 − weilPowerSum hP r`
    and `virtualAbvarCount hP r := (weilPower hP r).eval 1`, integers for all `r ≥ 1`; for `P = P_F`
    the first is `N_r(F)` (2.2).
13. **The elliptic convention.** For an elliptic function field (genus `1` with a degree-one place),
    `L_F = 1 − a T + q T²` with `a := q + 1 − N_1(F)`; this `a` is
    `WeierstrassCurve.frobeniusTrace` of any Weierstrass model, and `N_1(F)` is its `pointCount`
    (5.1). Supersingularity of an elliptic curve is **not** `a = 0` (the two agree only for prime
    `q ≥ 5`); it is `p ∣ a` ([EllipticCurves](../EllipticCurves/README.md) Layer 3). The `g = 1`
    case of item 9 is `a = 0 ∨ 2 v_p(a) ≥ r` for `q = p^r`, which is `p ∣ a` when `r ≤ 2` but not
    at the polynomial level in general: `T² − 2T + 8` has `2 ∣ 2` and slopes `1/3, 2/3`. The two
    agree on the trace of every elliptic curve (no elliptic curve over `𝔽_8` has trace `±2`), which
    is 5.1's reconciliation.

## What Mathlib supplies

- `RatFunc ℚ`, in which 4.4 states the reciprocal form `P = T^{2g} P(q/T)/q^g`.
- Polynomials over `ℤ`: `Polynomial.reverse`/`reflect` with `reverse_mul_of_domain`,
  `reverse_leadingCoeff`, `reverse_natDegree`; `Polynomial.aroots` and `rootSet`;
  `IsAlgClosed.splits_domain` with `card_roots_map_eq_natDegree_of_isUnit_leadingCoeff` (a monic
  integer polynomial has exactly `natDegree` complex roots with multiplicity); Vieta
  (`Multiset.prod_X_sub_X_eq_sum_esymm`); Gauss's lemma for monic factors
  (`IsIntegrallyClosed.eq_map_mul_C_of_dvd`); `Polynomial.dickson 1 a n` with
  `dickson_one_one_eval_add_inv` (the `a = 1` instance of the identity 4.4 needs for general `a`);
  `Polynomial.Gal` with `galActionHom` and `card_of_separable`; `AdjoinRoot` with `powerBasis'`
  (monic case over a commutative ring) and the `NumberField (AdjoinRoot f)` instance for
  irreducible `f ∈ ℚ[X]`; `LinearMap.toMatrix`, `Matrix.charpoly`, `Matrix.trace`,
  `Matrix.charpolyRev`.
- Finiteness: `Polynomial.finite_mahlerMeasure_le n B` (Northcott: finitely many `p ∈ ℤ[X]` with
  `natDegree ≤ n` and Mahler measure `≤ B`) and
  `Polynomial.mahlerMeasure_eq_leadingCoeff_mul_prod_roots` — exactly the two inputs 4.3 needs.
- Finite fields: `GaloisField p n`, `FiniteField.Extension k p n` (a noncanonically chosen
  extension of degree `n`), `FiniteField.card`, `FiniteField.frobeniusAlgHom`, `Nat.card`;
  `IsPrimePow`, `Nat.minFac`, `Nat.factorization`; `padicValInt`.
- Number fields: `NumberField`, `NumberField.InfinitePlace`, `NumberField.IsTotallyReal`,
  `IsTotallyComplex`, `NumberField.IsCMField` (a totally complex quadratic extension of its maximal
  real subfield), and Kronecker's theorem
  `NumberField.Embeddings.pow_eq_one_of_norm_eq_one` (an algebraic integer all of whose complex
  embeddings have modulus `1` is a root of unity) — the input of 4.7.
- Arithmetic functions: `ArithmeticFunction.moebius` and Möbius inversion
  (`Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean`), `Nat.divisors`, `Nat.sqrt`.
- Elliptic curves: `WeierstrassCurve`, `IsElliptic`, `Affine.Point`, `baseChange`, the formal
  `WeierstrassCurve.LFunction : ArithmeticFunction ℤ` (a global object; not compared with here).

## What Tau Ceti supplies

At the pin of this repository (consumed by name, see *Prerequisites*): the function-field library
listed there, including `TauCeti.genus`, `Divisor.classNumber` and `classNumber_pos`,
`genus_eq_genus_of_constantCompositum_eq_top`, `IsEllipticFunctionField`,
`Place.IsWeierstrassCoordinates` with `exists_isWeierstrassCoordinates_of_genus_eq_one`,
`Place.degreeOneEquivDegreeZeroClassGroup`; and the elliptic-curve point count and Hasse bound named
above.

Not at the pin (cited in prose, with no Lean declaration here): the Newton-polygon modules
`TauCeti/NumberTheory/NewtonPolygon/*`; `WeierstrassCurve.zetaFunction`
(`TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Frobenius/Zeta.lean`) and the fixed-point model
`Affine/Point/FrobeniusFixed.lean`; the Hermitian function field
`TauCeti/FieldTheory/FunctionField/Hermitian/*`.

## What is missing (build here)

The zeta function of a function field, its rationality, functional equation and class-number
identity, its comparison with the scheme zeta function, and the Riemann hypothesis and Hasse–Weil
bound for its numerator are FunctionFieldArithmetic's and SchemeAndStackFoundations'. Nowhere in
Mathlib, Tau Ceti or those two roadmaps is there a notion of Weil polynomial, real Weil polynomial,
`p`-rank, Frobenius angle, angle rank, Weil power or twist; nor the Serre or
Ihara bound, the class-number bounds, the relations among the `N_r`, or the maximal-curve
criterion. Mathlib's `Polynomial.dickson` identity is stated only for parameter `1`. All of it is
built in the layers below.

## The build, in layers

Every milestone names what it rests on: Mathlib, Tau Ceti at the pin, an earlier milestone of this
roadmap, or a cited milestone of another roadmap. The counts, the zeta function and `L_F` with its
rationality, functional equation and class-number identity are FunctionFieldArithmetic §0.2 and
§§5.1–5.6 (*Consumed, not redefined*), and the function-field layers start from them, at Layer 2.
Stichtenoth's *Algebraic Function Fields and Codes* (2nd ed.) Chapter 5 is the source for Layers
2–3; section-level citations are given.

## Layer 2: the Weil polynomial of a function field

FunctionFieldArithmetic §5.3 supplies `L_F` with Stichtenoth's Theorem 5.1.15(a)–(d) (degree,
functional equation, `L(1) = h`, the coefficients); this layer reverses it into the vocabulary of
Layer 4 and states Theorem 5.1.15(e)–(f) and Corollary 5.1.16 in that vocabulary.

### 2.1 The Weil polynomial and its roots

`weilPolynomial k F := reverse (LPolynomial k F)`, monic of degree `2g` (its leading coefficient is
`L_F(0) = 1`), constant coefficient `q^g`, and `IsWeilSymmetric q g (weilPolynomial k F)` (the
functional equation in the form of convention 6); over `ℂ`, `P_F = ∏_{i=1}^{2g} (T − α_i)` with the
multiset `α := P_F.aroots ℂ` of cardinality `2g`, and `L_F = ∏ (1 − α_i T)`; the roots are
algebraic integers, nonzero, and the multiset is stable under `α ↦ q/α` (4.4's dictionary applied
to a symmetric polynomial). Also `∏ α_i = q^g` and `∑ α_i = q + 1 − N_1` (FunctionFieldArithmetic
§5.3: `b_1 = N_1 − (q + 1)`).

**Checks.**

- For `1.2.ac` over `𝔽_2`, `L = 1 − 2T + 2T²` gives `weilPolynomial = T² − 2T + 2`: constant
  coefficient `2 = q^g`, roots `1 ± i` of modulus `√2`, `∑ α_i = 2 = 2 + 1 − N_1` with `N_1 = 1`.
  Reading `L` itself as the Weil polynomial (no reversal) would give the non-monic `2T² − 2T + 1`.
- For `ℙ¹` (`g = 0`): `L = 1`, so `weilPolynomial = 1`, of degree `0`, with no roots; `∏ α_i = 1 =
  q^0`.
- For `2.2.a_a` over `𝔽_2`, `L = 1 + 4T⁴` reverses to `T⁴ + 4`, not to `4T⁴ + 1`: the middle
  coefficients `0` are kept in place and `P(0) = 4 = q^g`.

### 2.2 Point counts from the roots

For all `r ≥ 1`, `N_r(F) = q^r + 1 − ∑_{i=1}^{2g} α_i^r` as complex numbers is FunctionFieldArithmetic
§5.4 (Stichtenoth Corollary 5.1.16), read through the roots of 2.1. Milestones here: the integer form
**`N_r(F) = virtualCurveCount q P_F r`** of convention 12 (4.10's `weilPowerSum hP_F r = ∑ α_i^r`);
and the integer recursion `s_{r+2g} = −∑_{j=1}^{2g} a_{2g−j} s_{r+2g−j}` for `s_r := weilPowerSum
hP_F r` and `P_F = ∑ a_j T^j`, for all `r ≥ 0` with `s_0 = 2g`. That `N_1, …, N_g` determine `L_F`,
and with it every `N_r`, is FunctionFieldArithmetic §5.6 (`IsLPolynomialData.unique`); 4.11 states
the same for any symmetric Weil polynomial.

### 2.3 Constant-field extension

For a model `F' / k'` of the degree-`r` constant extension (convention 3): `g(F') = g(F)` (Tau Ceti
`genus_eq_genus_of_constantCompositum_eq_top`); **`P_{F'} = weilPower hP_F r = P_F^{(r)}`**, since by
FunctionFieldArithmetic §5.5 (`lPolynomial_constantExtension`, Stichtenoth Theorem 5.1.15(f)) the
inverse roots of `L_{F'}` are the `α_i^r`, and two monic integer polynomials with the same complex
root multiset are equal (4.10 for the roots of `weilPower`); and
`h_{F'} = ∏_i (1 − α_i^r) = virtualAbvarCount hP_F r` (FunctionFieldArithmetic §5.3's `L(1) = h` for `F'`).

### 2.4 Genus one

For an elliptic function field (`IsEllipticFunctionField`, exact constants, `[Finite k]`):
FunctionFieldArithmetic §5.3 at `g = 1` gives `L_F = 1 − a T + q T²` with `a := q + 1 − N_1(F)`
(`b_1 = N_1 − (q + 1)`, `b_2 = q`). Milestones: `P_F = T² − aT + q`, `h_F = L_F(1) = N_1(F)`, and
`N_r = q^r + 1 − α^r − ᾱ^r` with `α + ᾱ = a`, `αᾱ = q`; the integer recursion
`s_{r+2} = a s_{r+1} − q s_r`, `s_0 = 2`, `s_1 = a`, is the one the merged
[EllipticCurves](../EllipticCurves/README.md) roadmap states for its trace sequence. `h_F = N_1(F)`
is also `Place.degreeOneEquivDegreeZeroClassGroup` (the degree-one places are in bijection with
`Cl⁰(F)`), and that bijection is the honest reason, independent of `L_F(1) = h_F`.

## Layer 3: the Riemann hypothesis in Weil-polynomial form, and the bounds

The Riemann hypothesis for curves — every inverse root of `L_F` has absolute value `√q` — is
FunctionFieldArithmetic §5.4, which takes it from DeligneWeightsAndPurity §1.6 through the Jacobian
numerator and derives the Hasse–Weil bound `(N_r − (q^r + 1))² ≤ 4 g² q^r` (Stichtenoth Theorems
5.2.1 and 5.2.3); SchemeAndStackFoundations §5.11 `weil_bound_via_surfaces` proves the same bound
for the points of a curve over every finite field by intersection theory on `C × C`. This layer
states the first in the vocabulary of Layer 4 and proves what follows from it. Stichtenoth §5.3 is
the source for 3.2–3.3.

### 3.1 The Riemann hypothesis as a Weil-polynomial statement, and its corollaries

**For every `F / k` with `[Finite k]`, `hF`, `hex`: `IsWeilPolynomial q (weilPolynomial k F)`** (and
`IsWeilSymmetric q g`, 2.1): the roots of `P_F` are the inverse roots of `L_F` (2.1), of absolute
value `√q` by FunctionFieldArithmetic §5.4. This is the link theorem through which every result of
Layer 4 applies to `P_F`. Corollaries, each a milestone: `|b_j| ≤ \binom{2g}{j} q^{j/2}`;
`h_F ≥ (√q − 1)^{2g}` and `h_F ≤ (√q + 1)^{2g}` (`h_F = L_F(1) = ∏ (1 − α_i)`,
FunctionFieldArithmetic §5.3; `classNumber_bounds`); for `g ≥ 1`, `h_F = 1 ⟹ q ≤ 4`
(`card_le_four_of_classNumber_eq_one`), with `q = 4 ⟹ L_F = (1 − 2T)^{2g}`
and `g ≤ 1` (the real-root case of the equality in `|1 − α| ≥ √q − 1`; `ℙ¹` has `h = 1` over every
`𝔽_q`); and `N_r(F) = q^r + 1 − q^{r/2} ∑_{i=1}^{2g} cos(π r θ(α_i))` with `θ(α) := arg α / π` over
all `2g` roots: a pair of non-real conjugate roots with Frobenius angle `θ` (4.7) contributes
`2 q^{r/2} cos(π r θ)`, a real root `±√q` contributes `(±1)^r q^{r/2}`.

### 3.2 Serre's bound

`|N_1(F) − (q + 1)| ≤ g · ⌊2√q⌋` (`Nat.sqrt (4q)`; `serre_bound`); Serre 1983, Stichtenoth
Theorem 5.3.1. Proof:
with `x_1, …, x_g` the roots of the real Weil polynomial `h_{P_F}` (4.4; `x_i = α_i + ᾱ_i =
2√q cos(π θ_i)`, one per `α ↦ q/α`-orbit, so a real root `±√q` of multiplicity `2` gives one
`x_i = ±2√q`) and `m := ⌊2√q⌋`, the numbers `m + 1 + x_i` and `m + 1 − x_i` are positive, and
their products over
`i` are positive algebraic integers fixed by every automorphism (they are `∏(m + 1 ± (α_i + ᾱ_i))`,
symmetric functions of the roots of the real Weil polynomial 4.4), hence `≥ 1`; the arithmetic–
geometric mean inequality then gives `∑ x_i ≤ g m` and `∑ x_i ≥ −g m`.

### 3.3 Ihara's bound

`N_1(F) ≤ q + 1 + (√((8q + 1) g² + 4 (q² − q) g) − g) / 2` as a real inequality (`ihara_bound`);
Ihara 1981. Proof:
`N_2 ≥ N_1` (FunctionFieldArithmetic §5.1: `N_2 = a_1(F) + 2 a_2(F)`) with `N_1 = q + 1 − ∑ x_i`,
`N_2 = q² + 1 − ∑ (x_i² − 2q)` and the Cauchy–Schwarz inequality `(∑ x_i)² ≤ g ∑ x_i²`, with the
`x_i` of 3.2. (The bound is valid for every `g`; it improves on the Hasse–Weil bound exactly when
`g > (q − √q)/2`, so a maximal function field in the sense of 3.5
has `g ≤ (q − √q)/2`: Stichtenoth Proposition 5.3.3.)

### 3.4 Relations among the point counts, and the Jacobian-compatibility conditions

For a symmetric Weil `q`-polynomial `P` of degree `2g`, write `N_r := virtualCurveCount q hP r`.
The **necessary conditions for `P = P_F` for some `F`** are the elementary relations among the
counts of FunctionFieldArithmetic §5.1, read through 2.2, for `r ≥ 1`: `N_r ≥ 0`; `d ∣ r ⟹ N_d ≤ N_r`
(every place of degree dividing `d` has degree dividing `r`; a milestone here);
`∑_{d ∣ r} μ(r/d) N_d ≥ 0` and `≡ 0 (mod r)` (that section's Möbius inversion: the sum is
`r · a_r(F)`); `N_1 ≤ q + 1 + g ⌊2√q⌋` (3.2). The knowl `av.fq.curve_point_counts` rejects a
class as "not a Jacobian" exactly when the first two fail; the worked example `2.2.a_ae` below is
such a rejection. The converse (which symmetric Weil polynomials are `P_F` for a function field, or
the Weil polynomial of a Jacobian) is a question about abelian varieties and is not a milestone here.

### 3.5 Maximal and minimal curves

`N_1(F) = q + 1 + 2g√q` iff every `α_i = −√q` iff `L_F = (1 + √q T)^{2g}` (so `q` is a square when
`g ≥ 1`); dually `N_1 = q + 1 − 2g√q` iff `L_F = (1 − √q T)^{2g}`. On the carrier this reads: for
`[Finite k]` with `Nat.card k = q₀²`, `N_1(F) = q₀² + 1 + 2 g q₀ ⟺ L_F = (1 + q₀ T)^{2g}`, and
`N_1(F) = q₀² + 1 − 2 g q₀ ⟺ L_F = (1 − q₀ T)^{2g}`. The Hermitian function field
`y^{q₀} + y = x^{q₀+1}` over `𝔽_{q₀²}` (Tau Ceti, not at the pin) is the acceptance instance, in
the worked examples at `q₀ = 2` where it is the elliptic curve `1.4.e`.

## Layer 4: Weil polynomials as combinatorics on `ℤ[T]`

Imports nothing from Layers 2–3; everything is about a natural number `q` and `P : ℤ[X]`.
Sources: Waterhouse 1969, Chapter 2, pp. 527–528, for `q`-Weil numbers and the real/`±√q`
dictionary, the LMFDB knowls named per milestone, Mathlib for the tools.

### 4.1 The predicate and `q`-Weil numbers

`IsWeilPolynomial q P` (convention 7). Milestones: `P ≠ 0`; `P.map (Int.castRingHom ℂ)` splits with
exactly `natDegree P` roots (`IsAlgClosed.splits_domain`,
`card_roots_map_eq_natDegree_of_isUnit_leadingCoeff`); every root is an algebraic integer
(`IsIntegral ℤ`), nonzero when `1 ≤ q` (then `‖α‖ = √q > 0`; for `q = 0` the Weil polynomials are
exactly the powers of `T`, and every theorem that needs it carries `1 ≤ q`);
`IsWeilPolynomial 1 P ⟺ P` is monic with all roots on the unit circle `⟺ P` is a product of
cyclotomic polynomials (Kronecker; `NumberField.Embeddings.pow_eq_one_of_norm_eq_one`); the
comparison with the Deligne weights roadmap: **`IsWeilPolynomial q P ⟺ P.Monic ∧ ∀ α ∈ P.aroots ℂ,
IsWeilNumber (q : ℝ) 1 α`** for `1 < q`, consuming `DeligneWeightsAndPurity` §0.1's predicate and
two of its API facts (a nonzero `P ∈ ℚ[T]` with `P(α) = 0` all of whose complex roots have modulus
`q^{n/2}` makes `α` a Weil `q`-number of weight `n`; every embedding into `ℂ` sends a Weil number
to a number of modulus `q^{n/2}`), cited in prose: that roadmap's file is not importable.
The Weil polynomial of a function field satisfies the predicate by 3.1. The modulus `q` is
determined by any Weil polynomial of positive degree: `(P.coeff 0)² = q^{natDegree P}`.

**Checks.**

- `T² − 2T + 2` satisfies `IsWeilPolynomial 2` (roots `1 ± i`, modulus `√2`); `T² − 3T + 2 =
  (T − 1)(T − 2)` satisfies it for no `q` (its roots `1` and `2` have different moduli).
- Degenerate cases: `P = 1` satisfies it for every `q`; `T` only for `q = 0`; `T − 1` for `q = 1`
  and `T − 2` for `q = 4` (odd degree is allowed); `0` for no `q` (not monic).
- Wrong models excluded: `2T² − 4T + 4` has the right roots and fails (not monic), so "all roots
  of modulus `√q`" alone is not the predicate; `T² − 2` satisfies `IsWeilPolynomial 2`, so the
  predicate does not include the symmetry of 4.4; and `(P.coeff 0)² = q^{natDegree P}` is
  necessary, not sufficient: `T² − 3T + 2` has `P(0)² = 4 = 2²` at `q = 2` and is not Weil.

### 4.2 Closure properties

Products of Weil `q`-polynomials are Weil `q`-polynomials; a **monic divisor in `ℤ[X]`** of a Weil
`q`-polynomial is one (Gauss's lemma: `IsIntegrallyClosed.eq_map_mul_C_of_dvd`, so a monic factor over
`ℚ` is over `ℤ`); the irreducible factors over `ℚ` of a Weil polynomial are Weil polynomials, and
`P` is Weil iff all its monic irreducible factors are; `P^{(r)}` (4.10) of a Weil `q`-polynomial is a
Weil `q^r`-polynomial; `IsWeilPolynomial q P ⟺ IsWeilPolynomial (q^r) (weilPower hP r)` for `r ≥ 1`
(the change-of-`q` statement, matching `DeligneWeightsAndPurity` §0.3).

### 4.3 Finiteness

**For every `q` and `n`, `{P | IsWeilPolynomial q P ∧ P.natDegree = n}` is finite.** Consumed from
`FaltingsFinitenessAndIsogenyTheorems` R28.5.1 `finite_weilPolynomials` (stated there for an
arbitrary real modulus `r`, here `r = √q`); the proof is Mathlib's
`Polynomial.finite_mahlerMeasure_le n ⟨(max 1 √q)^n, _⟩` together with
`mahlerMeasure_eq_leadingCoeff_mul_prod_roots` (a Weil `q`-polynomial of degree `n` has Mahler
measure exactly `max(1, √q)^n`). Corollary: the coefficient bounds `|P.coeff j| ≤ \binom{n}{j} q^{(n−j)/2}`, which is what the
LMFDB's enumeration of isogeny classes of given `(g, q)` rests on (the enumeration itself is not a
target).

### 4.4 Symmetric Weil polynomials and the real Weil polynomial

`IsWeilSymmetric q g P` (convention 7), throughout for `1 ≤ q` (at `q = 0` the symmetry condition
says only `P(0) = 0`: `T⁴ + T` is `0`-symmetric of degree `4` with `h_P = u²`, whose roots are real
in `[0, 0]`, yet it is no Weil `0`-polynomial). Milestones: for symmetric `P`, `P(0) = q^g` and
`P = T^{2g} P(q/T)/q^g` in `RatFunc ℚ`; **the root multiset of a symmetric `P` is stable under
`α ↦ q/α`** (`IsWeilSymmetric.aroots_map_div`; no Weil hypothesis: `T^{2g} P(q/T) = q^g P(T)` as
polynomials and `P(0) = q^g · leadingCoeff P ≠ 0`, so `P` and `∏ (T − q/α_i)` are proportional),
and conversely a monic `P` of degree `2g` whose root multiset is stable under `α ↦ q/α` and has
`P(0) = q^g` is symmetric. The **real Weil polynomial** `realWeilPolynomial
q g P := h_P` (convention 8, Mathlib `Polynomial.dickson 1 (q:ℤ)`), with: the Dickson identity for
general parameter `(dickson 1 a n).eval (x + y) = x^n + y^n` whenever `x y = a` (Mathlib has `a = 1`;
the general case is a milestone, by the same recursion `D_{n+2} = X D_{n+1} − a D_n`); the
**polynomial identity** `P = ∑_{i=0}^{g} C (h_P.coeff i) · (X² + C q)^i · X^{g−i}` (this is
`P(T) = T^g h_P(T + q/T)`; `realWeilPolynomial_spec`); `h_P` is monic of degree `g`; the roots of
`h_P` over `ℂ` are the `α_i + q/α_i` (one per `α ↦ q/α`-orbit, counted correctly: a root `±√q` of
`P` of multiplicity `2m` gives the root `±2√q` of `h_P` of multiplicity `m`); **`P` is Weil iff
`h_P` has all its roots real in `[−2√q, 2√q]`** (`isWeilPolynomial_iff_realWeilPolynomial`); and
the construction is a bijection between symmetric Weil `q`-polynomials of
degree `2g` and monic `h ∈ ℤ[X]` of degree `g` with all roots real in `[−2√q, 2√q]`, with inverse
`h ↦ ∑ C(h.coeff i) (X² + C q)^i X^{g−i}`. The coefficients `a_{g+1}, …, a_{2g}` of `P` and those of
`h_P` determine each other by a unimodular triangular change (the Dickson basis). **The intrinsic
label prefix** of a symmetric `P` of degree `2g` is `(g, q, c_1, …, c_g)` with
`c_j := (reverse P).coeff j = P.coeff (2g − j)`, the coefficients of the `L`-polynomial `reverse P`
below the middle (knowl `av.fq.lmfdb_label`); for `1 ≤ q` it determines `P`, the remaining
coefficients being `c_{2g−j} = q^{g−j} c_j`, and for `P = P_F` it is `(g, q, b_1, …, b_g)`.

**Checks** (`IsWeilSymmetric`).

- `T² − 2T + 2` is `2`-symmetric of genus `1`: `j = 0`: `1 · 2 = 2 · 1`; `j = 1`: `2 · (−2) =
  2 · (−2)`; `j = 2`: `4 · 1 = 2 · 2`. `T² − 2` is not (`j = 0`: `−2 ≠ 2`), though it is Weil.
- Degenerate cases: `IsWeilSymmetric q 0 P` holds exactly for the nonzero constants; at `q = 0`,
  `T⁴ + T` is `0`-symmetric of genus `2` (every equation reads `0 = 0`) and is not Weil; the
  degree clause rejects `T² − 2T + 2` as `2`-symmetric of genus `2`.
- Wrong model excluded: the unweighted palindromic condition `a_j = a_{2g−j}` would accept
  `T² + 1` at `q = 2` (rejected here: `j = 0` gives `1 ≠ 2`) and reject the Weil polynomial
  `T² − 2T + 2` of `1.2.ac` (`a_0 = 2 ≠ 1 = a_2`).

**Checks** (`realWeilPolynomial`).

- `1.2.ac`: `h = C(a_1) + C(a_2) · D_1 = X − 2`, whose root `2 = α + ᾱ`; `2.2.ac_c`,
  `P = T⁴ − 2T³ + 2T² − 4T + 4`: `h = C(2) + C(−2) X + (X² − 4) = X² − 2X − 2`, roots
  `1 ± √3 = 2√2 cos(π/12), 2√2 cos(7π/12)`.
- Degenerate cases: `g = 0` gives `h = C(P.coeff 0) = 1` for `P = 1`; `(T − 2)²` at `q = 4` gives
  `X − 4` (the LMFDB's `real_poly = [1, −4]` for `1.4.ae`); `(T² − 2)²` at `q = 2` gives
  `X² − 8`.
- Wrong model excluded: Dickson polynomials with parameter `1` (`D_2 = X² − 2`) would give
  `X² − 2X` for `2.2.ac_c`, whose roots `0, 2` are not `α + ᾱ`; Chebyshev normalisation
  (`D_2 = 2X² − 1`) would not even be monic.

**Checks** (the intrinsic label prefix).

- `2.2.ac_c ↦ (2, 2, −2, 2)`, `1.4.ae ↦ (1, 4, −4)`, `3.2.ad_c_b ↦ (3, 2, −3, 2, 1)`: the
  coefficients of `L` below the middle, with `c_{2g−j} = q^{g−j} c_j` giving `L` back
  (`c_3 = 2 · (−2) = −4`, `c_4 = 4` for `2.2.ac_c`).
- Degenerate case: `g = 0` gives `(0, q)`, the prefix of `ℙ¹`.
- Non-example: at `q = 0` the prefix `(2, 0, 0, 0)` belongs to both `T⁴` and `T⁴ + T`, which are
  both `0`-symmetric: the prefix determines `P` only for `1 ≤ q`.

### 4.5 The `±√q` dictionary

Real roots of a Weil `q`-polynomial are `√q` and `−√q`. Milestones: the monic irreducible Weil
`q`-polynomials with a real root are exactly `T² − q` when `q` is not a square, and `T − √q`,
`T + √q` when it is (`irreducible_real_root`) (if `q` is not a square, `√q ∉ ℚ` and its minimal polynomial is `T² − q`); in
a **symmetric** Weil polynomial of degree `2g` the multiplicities of `√q` and of `−√q` are even when
`q` is a square: `P(0) = ∏ α_i = q^g · (−1)^{m_−}` forces `m_−` even, and `m_+ + m_−` is even
because the non-real roots pair off, so `h_P` is divisible by
`(X − 2√q)^{m_+/2} (X + 2√q)^{m_−/2}`; when `q` is not a square, `T² − q` divides `P` with
multiplicity `m`, `m` is even for symmetric `P` by the same sign argument
(`P(0) = (−q)^m q^{g−m}`), and `X² − 4q` divides `h_P` with multiplicity `m/2` (the root `±√q` of
`P` of multiplicity `m` is the root `±2√q` of `h_P` of multiplicity `m/2`, 4.4: for
`P = (T² − 2)²` at `q = 2`, `m = 2` and `h_P = X² − 8 = X² − 4q` with multiplicity `1`). Every Weil `q`-polynomial is
uniquely `P = P_real · P_cplx` with `P_real` a product of the real-rooted irreducibles above and
`P_cplx` without real roots; `P_cplx` is symmetric (its roots pair off as `α, ᾱ = q/α`) and
`P` is symmetric iff `P_real` is, which for non-square `q` is automatic and for square `q` means
even multiplicities. The `L`-polynomials in the worked examples `2.2.a_ae` and `1.4.ae` exercise
both branches.

**Checks.**

- `2.2.a_ae`, `P = (T² − 2)²` at `q = 2`: `m = 2`, `P_real = P`, `P_cplx = 1`, and `h_P = X² − 8`
  is divisible by `X² − 4q = X² − 8` exactly once (`m/2 = 1`, not `m = 2`).
- `1.4.ae`, `P = (T − 2)²` at `q = 4`: `m_+ = 2`, `m_− = 0`, `h_P = X − 4 = X − 2√q` with
  multiplicity `1`; `1.4.e`, `(T + 2)²`: `m_− = 2`, `h_P = X + 4`.
- Non-example: `(T² − 2)(T² − 2T + 2) = T⁴ − 2T³ + 4T − 4` at `q = 2` is a Weil `2`-polynomial
  with `P_real = T² − 2` of odd multiplicity `m = 1`, and it is not symmetric (`j = 0`:
  `−4 ≠ 4`), as the sign argument predicts.

### 4.6 The Newton polygon, slopes, `p`-rank and the Newton strata

Hypotheses `IsPrimePow q`, `p := q.minFac`, `r := q.factorization p` (so `q = p^r`). Milestones:
the normalised valuation `v := (1/r) · v_p` on `ℚ` as an `AddValuation ℚ (WithTop ℝ)` with
`v(q) = 1` (NewtonPolygons Convention 2, principal case `Γ = ℚ` normalised at `q`); the Newton
polygon `newtonPolygon (reverse P) v` and slopes `slopes P := newtonSlopes (reverse P) v`
(NewtonPolygons §2.1, §3.3; the names are the suggestions of *Consumed, not redefined*),
for a monic `P` of degree `2g` a multiset of `2g` rationals; **for a Weil polynomial they lie in
`[0, 1]`** (each `α_i` is an algebraic integer dividing `q`: `α ᾱ = q`), **and the multiset is
symmetric under `s ↦ 1 − s`** for symmetric `P`; the slopes are the normalised `p`-adic valuations
of the roots of `P` in an algebraic closure of `ℚ_p` (NewtonPolygons §3.3's slope–root dictionary,
with that roadmap's orientation: a slope `m` of `reverse P` is a root `1/α` of valuation `−m`,
i.e. `v(α) = m`). **`pRank p P`** (convention 9) equals the multiplicity of the slope `0`
(the polygon's horizontal initial segment ends at the largest index `i` with `p ∤ coeff i (reverse
P)`). `IsOrdinary q g P := pRank p P = g`; `IsSupersingular q P` by the coefficient criterion of
convention 9, **equivalent, for a Weil `q`-polynomial, to every slope equals `1/2`**: the
polygon of `reverse P` ends at `(2g, v(P(0)))`, which is `(2g, g)` exactly when `|P(0)| = q^g`
(4.1's `P(0)² = q^{2g}`), and a polygon from `(0, 0)` to `(2g, g)` is the straight segment iff
every coefficient point lies on or above it. Without the Weil hypothesis the criterion is weaker:
`T² + 16` at `q = 2` satisfies it (`j = 0`: `2 ≤ 2 v_2(16) = 8`) with slopes `{2, 2}`.
`IsAlmostOrdinary q g P := pRank p P + 1 = g`, equivalent to Newton elevation `1` (below), and for `q = p` or `q = p²` to the
slope multiset `{0^{g−1}, 1/2, 1/2, 1^{g−1}}` (the two edges between `(g − 1, 0)` and `(g + 1, 1)`
can break only at a point of height in `(1/r)ℤ ∩ (0, 1/2)`, which is empty for `r ≤ 2`) — but not
for `r ≥ 3`: over `𝔽_8`, `(T² − 2T + 8)(T² − T + 8)` has `p`-rank `1 = g − 1` and slopes
`{0, 1/3, 2/3, 1}` (`L = 1 − 3T + 18T² − 24T³ + 64T⁴`, `2`-adic heights `0, 0, 1, 3, 6`, normalised
by `r = 3`). For the Weil polynomial of an abelian variety the three agree (a slope `1/3` occurs
with multiplicity divisible by `3`), which is the sibling's business.
The **elevation** (convention 9) is defined from the polygon's heights at `x = 0, …, g`; milestones:
elevation `0 ⟺` ordinary, elevation `1 ⟺` almost ordinary, elevation of a supersingular polygon
is `(g+1)²/4` for odd `g` and `g(g+2)/4` for even `g` (knowl `av.fq.newton_elevation`), and the
polygon of a product is the Minkowski sum with the slope multisets concatenated (NewtonPolygons
§3.2), so `pRank` is additive and supersingularity is inherited by factors.
The elementary `p`-rank criterion `pRank p P = g ⟺ p ∤ P.coeff g` (the middle coefficient) is the
LMFDB's ordinariness test and a milestone (`isOrdinary_iff_not_dvd_coeff`, for symmetric monic `P`
and `IsPrimePow q`). For `g = 1` and `P = T² − aT + q`, `q = p^r`:
`IsSupersingular q P ⟺ a = 0 ∨ 2 v_p(a) ≥ r`, which is `p ∣ a` for `r ≤ 2` and strictly stronger
for `r ≥ 3` (`T² − 2T + 8` has `2 ∣ 2`, slopes `1/3, 2/3`, `p`-rank `0`, and is not supersingular;
`T² − 4T + 8`, the class `1.8.ae`, is). The criterion `p ∣ a` of
[EllipticCurves](../EllipticCurves/README.md) Layer 3 is a statement about elliptic curves, and
5.1 reconciles the two.

**Checks** (`pRank`, `IsOrdinary`, `IsAlmostOrdinary`).

- `pRank 2 (T⁴ − 3T³ + 5T² − 6T + 4) = 2` (coefficients `4, −6, 5, …`: the least index with an
  odd coefficient is `2`, and `4 − 2 = 2`), so `IsOrdinary 2 2` holds for `2.2.ad_f`;
  `pRank 2 (T⁴ − T³ − 2T + 4) = 1` (`4, −2, 0, −1`: index `3`, `4 − 3 = 1`), so `2.2.ab_a` is
  `IsAlmostOrdinary 2 2`; `pRank 2 (T² − 2T + 8) = 0`.
- Degenerate cases: `pRank p 1 = 0` (index `0`, degree `0`), so `IsOrdinary q 0 1` holds and
  `IsAlmostOrdinary q 0 P` never does; for `g = 1`, `IsAlmostOrdinary q 1 P ⟺ pRank p P = 0`,
  which for `P = T² − aT + q` is `p ∣ a`; a non-prime-power `q = 12` evaluates all three with
  `p = 2` (junk, guarded by `IsPrimePow q` in every theorem).
- Wrong models excluded: "the number of coefficients prime to `p`" would give `3` for `2.2.ad_f`;
  "`natDegree P` minus the largest index of a coefficient prime to `p`" would give `0` for every
  monic `P`; `IsOrdinary` on the prime `p` rather than on `q` would make `IsOrdinary 2 1 P` and
  `IsSupersingular 4 P` refer to different fields.

**Checks** (`IsSupersingular`, slopes and elevation).

- `IsSupersingular 2` accepts `T² + 2` (`j = 0`: `2 ≤ 2`), `T² − 2T + 2` and `2.2.ac_c`, and
  rejects `T² − T + 2` (`j = 1`: `1 ≤ 0` fails); `IsSupersingular 8` accepts `T² − 4T + 8`
  (`j = 1`: `3 ≤ 4`) and rejects `T² − 2T + 8` (`3 ≤ 2` fails), though `2 ∣ 2`.
- The slopes, normalised at `q`: `[1/2, 1/2]` for `T² + 4` at `q = 4` (`v_2(α) = 1`, `r = 2`;
  without the normalisation one would read `1`), `[1/3, 2/3]` for `T² − 2T + 8` at `q = 8`, and
  `[0, 1/3, 2/3, 1]` for `(T² − 2T + 8)(T² − T + 8)` (the product rule; `p`-rank `1`, elevation
  `1`, neither ordinary nor supersingular, and almost ordinary by the `p`-rank definition only).
  Elevation: `0` for `2.2.ad_f` (heights `0, 0, 0`), `1` for `2.2.ab_a` (heights `0, 0, 1/2`: one
  lattice point `(2, 0)` strictly below) and for every supersingular `g = 1` polynomial, `2` for
  `2.2.ac_c` (heights `0, 1/2, 1`: the points `(1, 0)`, `(2, 0)`), `4 = (3 + 1)²/4` for a
  supersingular `g = 3` polygon; counting points *on* the polygon too would give `2` for an
  ordinary `g = 1` polynomial instead of `0`.
- Negative control: `T² + 16` at `q = 2` satisfies `IsSupersingular 2` (`j = 0`:
  `2 ≤ 2 v_2(16) = 8`), yet its `L`-polygon runs from `(0, 0)` to `(2, 4)` with slopes `{2, 2}`:
  it is not a Weil `2`-polynomial (`P(0)² = 256 ≠ 2²`), and the equivalence with "all slopes
  `1/2`" needs the Weil hypothesis. `P = 1` is supersingular (vacuously) with no slopes; `q = 1`
  gives `r = 0` and accepts every `P` (junk).

### 4.7 Frobenius angles and the angle rank

`frobeniusAngles P` and `angleRank P` (convention 10). Milestones: `2 · card (frobeniusAngles P) =
2g + m` for a symmetric Weil `P` of degree `2g` with `m` real roots (`card_frobeniusAngles`; so
exactly `g` angles when `P` has no real root; `1.4.ae` has two angles with `g = 1`); the angles
determine `P` given `q` (`α_i = √q e^{iπθ_i}`, each real-root angle contributing one root);
`0 ≤ angleRank P ≤ g`; **`angleRank P = 0 ⟺ IsSupersingular q P`** for a symmetric Weil
`q`-polynomial with `IsPrimePow q` (`angleRank_eq_zero_iff`) — angle rank `0` means every `θ_i` is rational, i.e. every `α_i/√q` is a root of
unity (equivalently `α_i^{2n} = q^n` for some `n ≥ 1`), and that is equivalent to all slopes
`1/2`: one direction is `v(α_i) = v(√q) = 1/2`; the other is Kronecker's theorem applied to
`α_i²/q`, an algebraic integer at every prime (a unit away from `p` since `α ᾱ = q`, and of
valuation `0` above `p` by the slope hypothesis) with all complex embeddings of modulus `1`
(`NumberField.Embeddings.pow_eq_one_of_norm_eq_one`). Also: `angleRank (P₁ P₂) ≤ angleRank P₁ +
angleRank P₂`, `angleRank (weilPower hP r) = angleRank P` for `r ≥ 1`, and the angles of
`weilPower hP r` are the `r θ_i` reduced modulo `2` into `[−1, 1]` and then replaced by their
absolute values.

**Checks** (`frobeniusAngles`).

- `1.2.ac ↦ [1/4]` (root `1 + i`), `2.2.ac_c ↦ [1/12, 7/12]`, `2.2.a_a ↦ [1/4, 3/4]`; `1.4.ae ↦
  [0, 0]` and `2.2.a_ae ↦ [0, 0, 1, 1]`: real roots contribute with their full multiplicity.
- Degenerate case: `P = 1 ↦ []`; `T − 2` at `q = 4 ↦ [0]`.
- Wrong models excluded: `arg z / (2π)` would give `1/8` for `1.2.ac`; omitting the filter
  `0 ≤ im z` would give `[1/4, −1/4]`, twice the LMFDB's list and outside `[0, 1]`.

**Checks** (`angleRank`).

- `1.2.ab ↦ 1`, `2.2.ab_a ↦ 2`; `2.2.ad_f ↦ 1`, because `θ₂ − θ₁ = 1/3` exactly (its root ratios
  are sixth roots of unity); `3.2.ad_c_b ↦ 1`, because `θ₁ + θ₂ = 2/7` and `θ₁ + θ₃ = 6/7`
  (seventh roots of unity); both are ordinary with angle rank below `g`.
- Degenerate cases: `P = 1 ↦ 0` (`Span_ℚ{1}` has dimension `1`); `(T − 2)² ↦ 0` and
  `1.2.ac ↦ 0` (angle `1/4` rational): the supersingular ones, as 4.7's equivalence says.
- Wrong model excluded: "the number of irrational angles" would give `2` for `2.2.ad_f` and `3` for
  `3.2.ad_c_b`.

### 4.8 The number field and the Galois group of a Weil polynomial

For `P` with `P_ℚ := P.map (Int.castRingHom ℚ)` irreducible: `weilNumberField P := AdjoinRoot P_ℚ`
with Mathlib's `NumberField` instance, of degree `natDegree P`, generated by the class `π` of `X`;
`weilGaloisGroup P := Polynomial.Gal P_ℚ` with its faithful transitive action on the `natDegree P`
roots (`galActionHom`, Mathlib; its permutation-group reading is
[PolynomialGaloisGroups](../../Completed/PolynomialGaloisGroups/README.md) Layers 0 and 2). **CM structure**: if
moreover `P` is a symmetric Weil `q`-polynomial with no real root, then `ℚ(π + q/π) ⊆ ℚ(π)` is the
field `AdjoinRoot (h_P)_ℚ` of the real Weil polynomial, it is totally real (`IsTotallyReal`, the
roots of `h_P` being real by 4.4), `ℚ(π)` is a totally complex (`IsTotallyComplex`) quadratic
extension of it (`π` satisfies `T² − (π + q/π) T + q`), hence `NumberField.IsCMField (ℚ(π))`
(`isCMField_weilNumberField`) with maximal real subfield `ℚ(π + q/π)`; `[ℚ(π) : ℚ] = 2g` and `[ℚ(π + q/π) : ℚ] = g`. With a real root
(`P = T² − q` or `T ∓ √q`) the field is `ℚ(√q)` or `ℚ`, totally real. For reducible `P`, the number
fields and Galois groups of the irreducible factors (4.9) are the per-factor data; the Galois group
of the splitting field of `P` is `Polynomial.Gal P_ℚ` in every case, and the LMFDB shows the group
of the irreducible `P` only.

**Checks.**

- `1.2.ac`: `ℚ(π) = ℚ(i)` (discriminant `−4`), Galois group `C₂`, maximal real subfield `ℚ`;
  `2.2.ac_c`: `ℚ(π)` of degree `4` and discriminant `144`, i.e. `ℚ(ζ₁₂)`, group `C₂ × C₂`, real
  subfield `ℚ(√3)` (the field of `u² − 2u − 2`); `3.2.ad_c_b`: `ℚ(ζ₇)`, group `C₆`.
- Degenerate cases: `T − 2` at `q = 4` gives `ℚ` and the trivial group; `T² − 2` gives `ℚ(√2)`,
  totally real, not a CM field (the no-real-root hypothesis of the CM statement is needed).
- Wrong model excluded: the Galois group of the real Weil polynomial is not the group of `P`:
  for `2.2.ab_a`, `u² − u − 4` has group `C₂` while `P` has `D₄` of order `8`.

### 4.9 Factorization predicates

Over `ℚ[X]` (equivalently, by Gauss, over `ℤ[X]` with monic factors): `IsIrreducible`
(`Irreducible P_ℚ`); `IsIsotypic P := ∃ m e, Irreducible m ∧ 1 ≤ e ∧ P_ℚ = m^e`;
`Squarefree P_ℚ`; the multiset of monic irreducible factors with multiplicities
(`UniqueFactorizationMonoid.normalizedFactors` in `ℚ[X]`, normalised monic), each a Weil
`q`-polynomial (4.2), with `P = ∏ m_i^{e_i}`. These are the polynomial-level readings of the LMFDB's
`is_simple` (the isogeny class is simple iff `P` is isotypic; irreducible `P` is the case displayed
with a number field), `simple_distinct`, `simple_multiplicities` and `geom_squarefree`; the
identification with the decomposition of the abelian variety is the sibling's.

**Checks.**

- `2.2.a_a`, `T⁴ + 4 = (T² − 2T + 2)(T² + 2T + 2)`: reducible, squarefree, not isotypic, factor
  multiset `{T² − 2T + 2, T² + 2T + 2}`; `2.2.ac_c`: irreducible, hence isotypic with `e = 1`.
- `(T − 2)²` and `(T² − 2)²`: isotypic with `e = 2`, not squarefree, not irreducible.
- Degenerate case: `P = 1` is a unit, so it is neither irreducible nor isotypic (`1 ≤ e` and
  `Irreducible m` exclude `1 = m^e`); its factor multiset is empty.

### 4.10 Weil powers, polynomial twists, Weil roots, geometric irreducibility

For monic `P` and `r ≥ 1`: `weilPower hP r` and `weilPowerSum hP r` (convention 11). Milestones:
`(weilPower hP r).aroots ℂ = (P.aroots ℂ).map (· ^ r)` (`aroots_weilPower`) and
`weilPowerSum hP r = ∑ α_i^r` as complex numbers (`weilPowerSum_eq`), via the power basis;
`weilPower hP 1 = P`; `weilPower (weilPower hP r) s = weilPower hP (rs)`; symmetry and Weilness
transport (`IsWeilSymmetric q g P → IsWeilSymmetric (q^r) g (weilPower hP r)`;
`IsWeilPolynomial (q^r) (weilPower hP r) ↔ IsWeilPolynomial q P`, `isWeilPolynomial_weilPower_iff`,
4.2); the product formula
`∏_{ζ^r=1} P(ζT) = (−1)^{(r−1)·n} · (weilPower hP r)(T^r)` in `ℂ[T]`, `n := natDegree P`
(`prod_rootsOfUnity_comp_weilPower`; the product of the `r`-th roots of unity is `(−1)^{r−1}`),
which is also an honest definition of `P^{(r)}` over `ℤ` by comparing coefficients of `T^{rj}`. **Polynomial twists**: `IsTwistOver r hP₁
hP₂ := weilPower hP₁ r = weilPower hP₂ r` (`P₁` and `P₂` become equal after base change to
`𝔽_{q^r}`), for each `r ≥ 1` an equivalence relation on monic polynomials of a fixed degree, with
`IsTwistOver r → IsTwistOver (r s)` and `P₂` ranging over finitely many classes for fixed `P₁` and
`r` (4.3: the twists of a Weil `q`-polynomial are Weil `q`-polynomials of the same degree);
`twistDegree hP₁ hP₂ := sInf {r | 0 < r ∧ IsTwistOver r hP₁ hP₂}` (the least such `r`, the LMFDB's
*extension degree* of a twist; `0` when there is none). The set `{r | IsTwistOver r hP₁ hP₂}` is
the union, over the bijections `σ` of the root multisets with every `β_{σ(i)}/α_i` a root of
unity, of the multiples of `lcm_i ord(β_{σ(i)}/α_i)`; it is **not** in general the set of multiples
of `twistDegree`: over `𝔽_3`, `T² − 3T + 3` and `T² + 3T + 3` (the classes `1.3.ad` and `1.3.d`,
roots `√3 e^{±iπ/6}` and `√3 e^{±5iπ/6}`) have equal Weil powers for `r = 2` and for `r = 3`, so
`twistDegree = 2` and `2 ∤ 3`. The **polynomial twist class** of `P` is `{P₂ | ∃ r ≥ 1, IsTwistOver
r hP hP₂}`, finite (the ratios `β_j/α_i` are roots of unity in a field of degree `≤ (n!)²`, hence of
bounded order). It contains polynomials that are the characteristic polynomial of no abelian
variety: over `𝔽_2`, `T² − 2` lies in the class of `T² + 2` (`r = 4`: both Weil powers are
`(T − 4)²`), and no abelian variety over `𝔽_2` has `T² − 2` (Honda–Tate,
[AbelianSchemesAndArithmeticModuliPartII](../AbelianSchemesAndArithmeticModuliPartII/README.md) F3.2,
as the sibling consumes it). The
LMFDB's `twists`, `twist_count` and `max_twist_degree` range over realized classes and are the
sibling's 5.6, which decides membership by `IsTwistOver` and reads degrees from `twistDegree`.
**Weil roots** (the polynomial side of base change): `weilRoots r P := {Q | ∃ hQ : Q.Monic,
weilPower hQ r = P}`, finite for `r ≥ 1` (`weilRoots_finite`: the roots of `Q` are `r`-th roots of
the roots of `P`, finitely many multisets), with `Q ∈ weilRoots r P → (IsWeilPolynomial q₀ Q ↔ IsWeilPolynomial
(q₀^r) P)` (4.2). An isogeny class over `𝔽_q` with Weil polynomial `P` is a base change from
`𝔽_{q₀}`, `q₀^r = q`, exactly when some `Q ∈ weilRoots r P` is the characteristic polynomial of an
abelian variety over `𝔽_{q₀}`, and whether it is one is Honda–Tate: `is_primitive` and
`primitive_models` (knowl `ag.primitive`) are the sibling's 5.5. The purely polynomial condition
"`weilRoots r P` contains no `q₀`-Weil polynomial for any `r ≥ 2`" is *not* that column: over
`𝔽_4`, `(T − 2)²` is the primitive isogeny class `1.4.ae`, yet `T² − 2 ∈ weilRoots 2 ((T − 2)²)` is
a `2`-Weil polynomial (realized by nothing over `𝔽_2`). **Geometric irreducibility**:
`IsGeometricallyIrreducible hP := ∀ r ≥ 1, Irreducible (weilPower hP r)_ℚ`, a sufficient condition
for the sibling's `is_geometrically_simple` (its 5.3; the converse needs Honda–Tate's exponent); and
`geometricExtensionDegree P := sInf {r | 0 < r ∧ ∀ α β ∈ P.aroots ℂ, IsOfFinOrder (α/β) →
(α/β)^r = 1}`, the least `r` such that no ratio of roots is a root of unity other than after
raising to `r` — equivalently the order of the group generated by the root-of-unity ratios —
with the milestones: it divides every `s` with `weilPower hP s` having the same number of
coincidences `#{(i, j) | α_i^s = α_j^s}` as all `weilPower hP (st)`, and it is `1` iff no ratio
`α_i/α_j`, `i ≠ j` as multiset positions, is a nontrivial root of unity. The sibling's 5.4 proves it
is the degree of the field over which all endomorphisms of an abelian variety with Weil polynomial
`P` are defined, the LMFDB's `geometric_extension_degree`; here it is a polynomial invariant.

**Checks** (`weilPower`, `weilPowerSum`).

- `weilPower (T² − 2T + 2) 2 = T² + 4` (roots `(1 ± i)² = ±2i`), `weilPower (T² + 2) 2 =
  (T + 2)²`, `weilPower (T² − 2) 2 = (T − 2)²`; `weilPowerSum (T² − 2T + 2) r = 2, 0, −4, −8` for
  `r = 1, …, 4`, so `N_r = 1, 5, 13, 25` for `1.2.ac`.
- Degenerate cases: `weilPower hP 1 = P`; `weilPower hP 0 = (T − 1)^{natDegree P}`;
  `weilPowerSum hP 0 = natDegree P`; for `P = 1` (`AdjoinRoot 1` is the zero ring, empty basis)
  `weilPower = 1` and `weilPowerSum = 0` for every `r`.
- Wrong model excluded: the minimal polynomial of `π^r` over `ℚ`, of degree `[ℚ(π^r) : ℚ]`, is
  not `weilPower`: for `T² − 2T + 2` and `r = 4` it is `T + 4`, while `weilPower hP 4 = (T + 4)²`
  keeps the multiplicities and the degree `natDegree P`.

**Checks** (`IsTwistOver`, `twistDegree`).

- `T² − 3T + 3` and `T² + 3T + 3` (`1.3.ad`, `1.3.d`): `IsTwistOver 2` (both `T² − 3T + 9`) and
  `IsTwistOver 3` (both `T² + 27`) hold, `twistDegree = 2`; `T² − 2` and `T² + 2` at `q = 2`:
  `IsTwistOver 2` fails (`(T − 2)²` against `(T + 2)²`), `IsTwistOver 4` holds (`(T − 4)²`),
  `twistDegree = 4`; `T² − 2T + 2` and `T² + 2T + 2` (`1.2.ac`, `1.2.c`): `twistDegree = 2`.
- Degenerate case: `twistDegree hP hP = 1`.
- Non-twist: `T² − T + 2` and `T² − 2T + 2` have `twistDegree = 0`: `(1 + i)^n` is real for
  `4 ∣ n` while `((1 + i√7)/2)^n` is never real (its angle `0.38497…` is irrational), so no power
  of the two root multisets agrees and `sInf ∅ = 0`.

**Checks** (`weilRoots`, `IsGeometricallyIrreducible`, `geometricExtensionDegree`).

- `weilRoots 2 ((T − 2)²) = {T² − 2}` (the only integral monic polynomial with roots in `{±√2}`
  whose squares are `2, 2`); `weilRoots 2 (T² + 4) = {T² − 2T + 2, T² + 2T + 2}`; `weilRoots 2
  (T + 2) = ∅` (a monic linear `Q` with `root² = −2` is not integral); `weilRoots 1 P = {P}` and
  `weilRoots r 1 = {1}`.
- `IsGeometricallyIrreducible` holds for `T² − T + 2` (every `weilPower` is `T² − s_r T + 2^r`
  with non-real roots, since no root ratio is a root of unity) and fails for the irreducible
  `T² − 2T + 2` (`weilPower 4 = (T + 4)²`) and `2.2.ac_c` (`weilPower 12 = (T + 64)⁴`); it fails for
  `P = 1` (a unit is not irreducible) and holds for `T − 2`.
- `geometricExtensionDegree`: `T² + 2 ↦ 2` (ratio `−1`), `T² − 2T + 2 ↦ 4` (ratio `i`), `T⁴ + 4
  ↦ 4`, `(T² − 2)² ↦ 2`, `2.2.ac_c ↦ 12`, `2.2.ad_f ↦ 6`, `3.2.ad_c_b ↦ 7`, `T² − T + 2 ↦ 1`,
  `2.2.ab_a ↦ 1`, `P = 1 ↦ 1` (empty condition, `sInf {r | 0 < r} = 1`). Wrong model excluded:
  "the least `r` at which two roots of `weilPower hP r` coincide" gives `2` for `T⁴ + 4`
  (`(1 + i)² = (−1 − i)²`), not `4`.

### 4.11 Point counts determined by a Weil polynomial

`virtualCurveCount q hP r` and `virtualAbvarCount hP r` (convention 12), for symmetric Weil
`q`-polynomials of degree `2g`. Milestones: the complex formulas `N_r = q^r + 1 − ∑ α_i^r`,
`A_r = ∏ (1 − α_i^r)`; `virtualAbvarCount hP 1 = P(1) = (reverse P)(1)` (the class number of a
function field with `P = P_F`, FunctionFieldArithmetic §5.3); the bounds
`(√q^r − 1)^{2g} ≤ A_r ≤ (√q^r + 1)^{2g}` and `|N_r − q^r − 1| ≤ 2g q^{r/2}`
(`virtualCurveCount_sub_sq_le`; as in 3.1 and the Hasse–Weil bound for `P_F`, now for an
arbitrary symmetric Weil polynomial); the Jacobian-compatibility conditions of 3.4 as the
predicate `IsJacobianCompatible q hP` on `P`; `virtualAbvarCount hP (rs) =
virtualAbvarCount (weilPower hP r) s`. **Against FunctionFieldArithmetic §5.6's
`IsLPolynomialData`**: for `1 ≤ q` and `N : ℕ → ℤ`, `IsLPolynomialData q g N (reverse P) ↔
∀ r, 1 ≤ r → r ≤ g → N r = virtualCurveCount q hP r`. The direction `←` is Newton's identities for
the roots of `P` with the symmetry of 4.4, the analogue for an arbitrary symmetric `P` of that
section's `lPolynomial_isLPolynomialData`; the direction `→` recovers the counts from the
coefficients, since `N_r − q^r − 1` enters the `r`-th identity with coefficient
`(reverse P).coeff 0 = 1`. Hence, by `IsLPolynomialData.unique`, `N_1, …, N_g` determine `P`; so
does the full sequence `(A_r)_{r ≥ 1}` when `q ≥ 2` (in `A_r = ∑_S (−1)^{|S|} (∏_{i ∈ S} α_i)^r` the
terms of modulus `q^{r/2}` are exactly the `−α_i^r`).
For `P = P_F` these are `N_r(F)` (2.2) and `h_{F_r}` (2.3).

**Checks.**

- `2.2.ac_c`: `N_1, …, N_4 = 1, 5, 1, 9` and `A_1, …, A_4 = 1, 13, 25, 169`, and
  `IsJacobianCompatible` holds (`N_1 ≤ N_2`, `N_1 ≤ N_3`, `N_2 ≤ N_4`; the Möbius sums
  `4, 0, 4` for `r = 2, 3, 4` are nonnegative and divisible by `r`); `1.2.a`: `N = 3, 9, 9, 9`,
  compatible (Möbius sums `6, 6, 0`).
- `2.2.a_ae`: `N_1, …, N_4 = 3, −3, 9, 1`, so `IsJacobianCompatible` fails at `0 ≤ N_2`, while
  `A_1 = 1` as for `2.2.ac_c` (the abelian counts do not see the obstruction); `T² + 16` at
  `q = 2`: `N = 3, 37, 9, −495`, rejected by `N_4 < 0` and by `N_2 ≤ N_4`.
- Degenerate cases: `P = 1` gives `N_r = q^r + 1` and `A_r = 1` (`ℙ¹`); `r = 0` gives the junk
  `virtualCurveCount q hP 0 = 2 − natDegree P` and `virtualAbvarCount hP 0 = 0`, so every
  statement carries `1 ≤ r`.

## Layer 5: comparison contracts

Each item is a theorem identifying an object of this roadmap with another library's object; none
builds the other side.

### 5.1 Elliptic curves: point counts and the Hasse bound

For `[Finite k]`, an elliptic function field `F / k` with exact constants, a degree-one place `P`
and Weierstrass coordinates `(x, y)` for `W : WeierstrassCurve k` at `P`
(`Place.IsWeierstrassCoordinates P W x y`, Tau Ceti; they exist by
`exists_isWeierstrassCoordinates_of_genus_eq_one`): `W.IsElliptic`; **`N_1(F) = W.pointCount`**
(`card_degreeOne_eq_pointCount`: the degree-one places other than `P` are the affine `k`-points
`(x(Q), y(Q))`, `P` is the point at infinity, and `W` is nonsingular — the point–place dictionary
of [AlgebraicCurves](../AlgebraicCurves/README.md) Layer 10(iii), restated here at the pin's
`IsWeierstrassCoordinates`; genus one is needed, since the cuspidal `y² = x³` has Weierstrass
coordinates `x = t²`, `y = t³` at the infinite place of `k(t)`, where the degree-one places number
`q + 1` and the nodal `y² = x³ + x²` has `q` projective points but `k(t)` still has `q + 1`
places of degree one); hence **`L_F = 1 − C (W.frobeniusTrace) X + C q X²`** (2.4), and the
Hasse–Weil bound at `g = 1` (FunctionFieldArithmetic §5.4, SchemeAndStackFoundations §5.11) *is*
`WeierstrassCurve.frobeniusTrace_sq_le_four_mul_card`. Tau Ceti's degree-form proof and the
suppliers' proofs prove the same integer inequality about the same `W` (SchemeAndStackFoundations
§5.11 records the agreement as `weilBound_eq_hasse`), and the milestone is the equality of the two
statements, not a re-proof.
Conversely, for a Weierstrass elliptic `W` over `k`, Mathlib's `W.toAffine.FunctionField` is an
elliptic function field over `k` with exact constants whose places of degree one are the points
(AlgebraicCurves Layer 10(i)–(iii), consumed), so FunctionFieldArithmetic Layer 5 and every
statement of Layers 2–3 apply to `W`;
in particular the ordinary/supersingular dichotomy of [EllipticCurves](../EllipticCurves/README.md)
Layer 3 (`IsSupersingular E ↔ ringChar F ∣ frobeniusTrace E`, on Tau Ceti's
`WeierstrassCurve.IsSupersingular p W`: no nonzero `p`-torsion over the algebraic closure) agrees
with 4.6's `IsSupersingular q P_E` for `P_E = T² − aT + q` whenever `q = p` or `q = p²`
(`isSupersingular_iff_isSupersingular_weilPolynomial`): both predicates are `p ∣ a`, the second
by the `g = 1` clause of 4.6 (`a = 0 ∨ 2 v_p(a) ≥ r` with `r ≤ 2`). For `r ≥ 3` the two still
agree on every elliptic curve over `𝔽_{p^r}` (no supersingular curve has `0 < v_p(a) < r/2`), but
that is a statement about which traces occur, Waterhouse's list, which the sibling
`AbelianVarietiesOverFiniteFields` proves and which is neither an input nor a milestone here.

### 5.2 Elliptic curves: the zeta function

With `WeierstrassCurve.zetaFunction : ℚ⟦X⟧ := exp (∑ #E(𝔽_{qⁿ}) T^n / n)` of Tau Ceti (not at
the pin; `#E(𝔽_{qⁿ})` there is the fixed-point count of the `q`-power map), and `F` as in 5.1: `(zeta k F).map (Int.castRingHom ℚ) =
W.zetaFunction` for FunctionFieldArithmetic's `zeta k F`, from its §5.1 (`zeta_logDeriv`:
`log Z = ∑ N_r T^r/r` over `ℚ`; `pointCount_eq`: `N_r(F)` is the count of rational places of the
degree-`r` constant extension) and the fixed-point model (the rational places of `F·𝔽_{qⁿ}` other
than the one at infinity are the affine points fixed by the `q^n`-power map). Its
`zetaFunction_eq_mul_inv` is then FunctionFieldArithmetic §5.3's rationality at `g = 1`.

### 5.3 Weil numbers across the two predicates

For `1 < q`: `IsWeilPolynomial q P ⟺ P.Monic ∧ ∀ α ∈ P.aroots ℂ, IsWeilNumber (q : ℝ) 1 α`
(4.1), and for an algebraic integer `α` in a characteristic-zero field, `IsWeilNumber q 1 α ⟺
IsWeilPolynomial q (minpoly ℤ α)`. The sibling `AbelianVarietiesOverFiniteFields` uses the
polynomial form; `DeligneWeightsAndPurity` the scalar form; this item is the dictionary.

## Explicit scope exclusions

Not milestones of any layer: abelian varieties and Jacobians (including Honda–Tate, Tate's theorem,
the classification of Weil polynomials that occur, `has_jacobian`); étale cohomology; character sums;
the Drinfeld–Vlăduţ, Oesterlé and Stöhr–Voloch bounds and all asymptotics; equidistribution; the
existence and completeness of the eight class-number-one function fields (only the polynomial-level
necessary conditions 3.1, 3.4, 4.11 are here); the enumeration of Weil polynomials for given
`(g, q)`, the base-26 label encoding and the stored `twists` and Jacobian lists; twists, primitivity and
base-change models *of isogeny classes* (the sibling's 5.5, 5.6); transitive-group labels
and number-field labels of the fields and groups of 4.8; the Weil restriction of a function field;
the zeta functions of singular or non-geometrically-irreducible curves (a function field with
non-exact constants is handled only by passing to its exact constant field).

## Worked examples (acceptance criteria)

All numbers below were computed (Sage: `frobenius_polynomial`, `cardinality`, root valuations in
`ℚ_p`, `arg`, number-field discriminants and Galois groups) and the equations verified against the
stated counts. `L` is the `L`-polynomial (LMFDB `poly`), `P` the Weil polynomial, `N_r` the counts,
`A_r = virtualAbvarCount`, slopes are normalised at `q`, angles are `θ ∈ [0, 1]`.

- **`ℙ¹` over `𝔽_q`** (FunctionFieldArithmetic §§5.1–5.3; 2.1 with `P = 1`): `a_1 = q + 1`,
  `a_2 = (q² − q)/2`, `N_r = q^r + 1`,
  `A_n = (q^{n+1} − 1)/(q − 1)`, `L = 1`, `g = 0`, `h = 1`. Over `𝔽_2`: `a_1, …, a_6 = 3, 1, 2, 3,
  6, 9` (the Gauss counts `2, 1, 2, 3, 6, 9` of monic irreducibles, plus the place at infinity in
  degree `1`).
- **`1.2.ac`: `y² + y = x³ + x + 1` over `𝔽_2`** (2.4, 3.1, 4.6, 4.7, 4.8): `N_1 = 1` (only the
  point at infinity), `L = 1 − 2T + 2T²`, `P = T² − 2T + 2`, `h = L(1) = 1` (the genus-1 class-number-
  one field of the knowl `av.fq.1.2.ac.bottom`), `N_1, …, N_6 = 1, 5, 13, 25, 41, 65`
  (`N_2 = 5 ≥ N_1`, `N_3 = 13`, `N_6 = 65 ≥ N_2, N_3`), roots `1 ± i` of modulus `√2`,
  `p`-rank `0`, slopes `[1/2, 1/2]`, supersingular, angle `1/4`, angle rank `0`, real Weil
  polynomial `u − 2`, `ℚ(π) = ℚ(i)` (discriminant `−4`), Galois group `C₂`. Hasse–Weil
  `|1 − 3| = 2 ≤ 2√2`; Serre `≤ 1 · ⌊2√2⌋ = 2` with equality.
- **`1.2.ab`: `y² + xy = x³ + x² + 1` over `𝔽_2`** (ordinary): `N_1 = 2`, `L = 1 − T + 2T²`,
  `P = T² − T + 2`, roots `(1 ± i√7)/2` (the check of `DeligneWeightsAndPurity` §0.1),
  `p`-rank `1`, slopes `[0, 1]`, ordinary, angle `≈ 0.38497`, angle rank `1`, real Weil polynomial
  `u − 1`, `ℚ(√−7)`, `N_1, …, N_4 = 2, 8, 14, 16`, `h = 2`.
- **`1.2.a`: `y² + y = x³` over `𝔽_2`**: `N_1 = 3`, `L = 1 + 2T²`, `P = T² + 2`, `a = 0`,
  supersingular, angle `1/2`, `h = 3`, `N_2 = N_3 = N_4 = 9` (so `N_d ≤ N_r` is not strict).
- **`1.2.c`: `y² + y = x³ + x` over `𝔽_2`** (maximal, 3.5 in the non-square-`q` sense of attaining
  Serre's bound): `N_1 = 5 = 2 + 1 + 1 · ⌊2√2⌋`, `L = 1 + 2T + 2T²`, angle `3/4`, supersingular,
  `a = −2 ≠ 0` with `p = 2 ∣ a` — the example that keeps supersingularity `p ∣ a` rather than `a = 0`
  (convention 13).
- **`1.3.ad`: `y² = x³ − x − 1` over `𝔽_3`**: `N_1 = 1`, `L = 1 − 3T + 3T²`, `P = T² − 3T + 3`,
  `h = 1`, supersingular (`3 ∣ 3`), angle `1/6`, `ℚ(√−3)`, `N_1, …, N_4 = 1, 7, 28, 91`.
- **`1.4.ae`: `y² + y = x³ + ω` over `𝔽_4 = 𝔽_2(ω)`** (4.5's square-`q` branch): `N_1 = 1`,
  `L = 1 − 4T + 4T² = (1 − 2T)²`, `P = (T − 2)²`, real roots `√4 = 2` with even multiplicity,
  angles `[0, 0]` (two angles for `g = 1`, the LMFDB's list; convention 10), angle rank `0`, real
  Weil polynomial `u − 4` (LMFDB `real_poly = [1, −4]`), `h = 1`, `N_r = (2^r − 1)²`:
  `1, 9, 49, 225`. Here `P` is reducible, `T − 2` is a Weil `4`-polynomial of odd degree `1`, and
  the class-number-one consequence of 3.1 (`q = 4 ⟹ L = (1 − 2T)^{2g}`, `g ≤ 1`) is attained.
- **`1.4.e`: the Hermitian curve `y² + y = x³` over `𝔽_4`** (3.5): `N_1 = 9 = 4 + 1 + 2 · 1 · 2`,
  `L = (1 + 2T)²`, `P = (T + 2)²`, angles `[1, 1]`, `h = 9`, `N_2 = 9`, `N_3 = 81`.
- **`2.2.ac_c`: `y² + y = x⁵ + x³ + 1` over `𝔽_2`** (genus 2): `N_1, …, N_4 = 1, 5, 1, 9`
  (`N_3 = 1 ≥ N_1 = 1`, `N_4 = 9 ≥ N_2 = 5`), `L = 1 − 2T + 2T² − 4T³ + 4T⁴`,
  `P = T⁴ − 2T³ + 2T² − 4T + 4`, `h = 1` (knowl `av.fq.2.2.ac_c.bottom`), `A_1, …, A_4 = 1, 13,
  25, 169`, `p`-rank `0`, slopes `[1/2, 1/2, 1/2, 1/2]`, supersingular, angles `[1/12, 7/12]`, angle
  rank `0`, real Weil polynomial `u² − 2u − 2`, `ℚ(π)` of degree `4` and discriminant `144`
  (`ℚ(ζ₁₂)`), Galois group `C₂ × C₂`, irreducible. Label prefix `(2, 2, −2, 2)`.
- **`2.2.ab_a`: `y² + x² y = x⁵ + x⁴ + x` over `𝔽_2`** (almost ordinary): `N_1, …, N_4 = 2, 4, 2,
  24`, `L = 1 − T − 2T³ + 4T⁴`, `P = T⁴ − T³ − 2T + 4`, `p`-rank `1 = g − 1`, slopes
  `[0, 1/2, 1/2, 1]`, elevation `1`, angles `≈ [0.13939, 0.68617]`, angle rank `2` (no rational
  relation among `1, θ₁, θ₂`; `geometricExtensionDegree = 1`), real Weil polynomial `u² − u − 4`,
  discriminant `2312`, Galois group of order `8` (`D₄`), `h = 2`.
- **`2.2.a_a`: `y² + y = x⁵` over `𝔽_2`**: `L = 1 + 4T⁴`, `P = T⁴ + 4 = (T² − 2T + 2)(T² + 2T + 2)`
  — reducible, not isotypic, squarefree; angles `[1/4, 3/4]`; `N_1, …, N_4 = 3, 5, 9, 33`;
  `A_1 = 5`.
- **`2.2.ad_f` (polynomial level only)**: `L = 1 − 3T + 5T² − 6T³ + 4T⁴`, `P = T⁴ − 3T³ + 5T² − 6T +
  4`, `L(1) = 1`, ordinary (`p`-rank `2`, `2 ∤ 5`), slopes `[0, 0, 1, 1]`, elevation `0`, angles
  `≈ [0.12355, 0.45688]` with `θ₂ − θ₁ = 1/3` exactly (the ratios of roots are sixth roots of
  unity, `geometricExtensionDegree = 6`), so `Span_ℚ{1, θ₁, θ₂}` has dimension `2` and the angle
  rank is `1`, not the number `2` of angles; real Weil polynomial `u² − 3u + 1`, discriminant
  `225`, Galois group `C₂ × C₂`, not geometrically irreducible, virtual counts
  `N_1, …, N_4 = 0, 6, 9, 10` (a Jacobian-compatible sequence with `N_1 = 0`).
- **`2.2.a_ae`: not a Jacobian** (3.4, 4.5): `L = 1 − 4T² + 4T⁴`, `P = (T² − 2)²`, a symmetric
  Weil `2`-polynomial (real roots `±√2`, `T² − 2` with multiplicity `2`), angles `[0, 0, 1, 1]`,
  supersingular, `h = L(1) = 1`, but `N_1, N_2 = 3, −3`: `N_2 < 0` and `N_2 < N_1`, so 3.4 rejects
  it — the knowl `av.fq.2.2.a_ae.bottom`'s "abelian surface with only one rational point"
  (`A_1 = 1`) is no curve.
- **`3.2.ad_c_b` (polynomial level)**: `L = 1 − 3T + 2T² + T³ + 4T⁴ − 12T⁵ + 8T⁶`, `P = T⁶ − 3T⁵ +
  2T⁴ + T³ + 4T² − 12T + 8`, `L(1) = 1`, ordinary (`p`-rank `3`), angles `≈ [0.09926, 0.18646,
  0.75788]` with `θ₁ + θ₂ = 2/7` and `θ₁ + θ₃ = 6/7` exactly (the root ratios are seventh roots
  of unity, `geometricExtensionDegree = 7`), so the angle rank is `1`, not `3`; real Weil
  polynomial `u³ − 3u² − 4u + 13`, `ℚ(π)` of degree `6` and discriminant `−16807 = −7⁵` (so
  `ℚ(ζ₇)`), Galois group `C₆`, virtual counts `0, 0, 3, 28`.
- **Off-hypothesis checks**: `T² − 2` is a Weil `2`-polynomial (`IsWeilPolynomial 2`) but **not**
  symmetric (`P(0) = −2 ≠ 2`), so it is no `P_F`; `T² − 3T + 2 = (T − 1)(T − 2)` is a Weil
  `q`-polynomial for no `q`; `T − 2` is a Weil `4`-polynomial of odd degree, and `T − 1` a Weil
  `1`-polynomial; `IsSupersingular` rejects `T² − T + 2` at `p = 2` (`2 ∤ −1`), accepts `T² + 2`;
  `pRank 2 (T⁴ − 3T³ + 5T² − 6T + 4) = 2` and `pRank 2 (T⁴ − T³ − 2T + 4) = 1`;
  `angleRank` of `(T − 2)²` is `0` and of `T² − T + 2` is `1`; `IsSupersingular 8` rejects
  `T² − 2T + 8` (`3 · 1 ≤ 2 · 1` fails at `j = 1`) and accepts `T² − 4T + 8`, while
  `pRank 2 (T² − 2T + 8) = 0`; `(T² − 2T + 8)(T² − T + 8)` has `pRank 2 = 1` but slopes
  `{0, 1/3, 2/3, 1}`; `IsTwistOver 2` and `IsTwistOver 3` both hold for `T² − 3T + 3`, `T² + 3T + 3`
  (so `twistDegree = 2` does not divide the twist exponent `3`); `IsWeilSymmetric 0 2 (T⁴ + T)`
  holds while `IsWeilPolynomial 0 (T⁴ + T)` fails.
- **Bounds table** (the Hasse–Weil bound, 3.2, 3.3), `(q, g) ↦ (⌊Hasse–Weil⌋, Serre, ⌊Ihara⌋)` for `N_1`: `(2, 1) ↦ (5, 5,
  5)`, `(2, 2) ↦ (8, 7, 6)`, `(2, 3) ↦ (11, 9, 8)`, `(2, 4) ↦ (14, 11, 9)`, `(3, 2) ↦ (10, 10, 9)`,
  `(4, 2) ↦ (13, 13, 11)`, `(7, 3) ↦ (23, 23, 22)`; and `(16, 1) ↦ (25, 25, 33)`, where Ihara's
  bound is weaker than Hasse–Weil, as 3.3's remark predicts (`g ≤ (q − √q)/2`).

## Ordering and parallelism

**Layer 4 imports nothing from Layers 2–3** and can proceed from the start, in the order
4.1–4.2 → 4.3, 4.4 → 4.5, 4.6, 4.7 (4.7 needs 4.6 for the equivalence), 4.8–4.9, 4.10 → 4.11
(4.11's comparison with `IsLPolynomialData` needs FunctionFieldArithmetic §5.6). The function-field
side consumes its vocabulary, so those definitions precede Layer 2 in build order (as
`Suggested.lean` places them): 2.1–2.3 use 4.1, 4.4 and 4.10 (`IsWeilSymmetric`, the `α ↦ q/α`
dictionary, `weilPower`, `weilPowerSum`) on top of FunctionFieldArithmetic §§5.3–5.5. Layer 3 needs
Layer 2 and FunctionFieldArithmetic §5.4: 3.1 first (it uses 4.1 and 4.7 and returns the link
theorem `IsWeilPolynomial q P_F`), then 3.2–3.5 (3.2 uses 4.4, 3.4 uses 4.11). Layer 5 needs 2.4,
4.6 and SchemeAndStackFoundations §5.11 (5.1), FunctionFieldArithmetic §5.1 (5.2), and 4.1 (5.3).

```
FunctionFieldArithmetic §§5.1–5.6 ─► 2.1–2.4 ─► 3.1 ─► 3.2–3.5 ─► 5.1
                                        ▲        ▲
4.1–4.11 (no input from Layers 2–3) ────┴────────┴─► 5.3
   (4.1, 4.4, 4.7, 4.10, 4.11 are consumed by 2.1–2.3, 3.1, 3.2, 3.4)
FunctionFieldArithmetic §5.1 ─► 5.2
```

### Cross-roadmap milestone contracts

| Supplier | Supplied | Consumer here |
| --- | --- | --- |
| Tau Ceti function-field library ([AlgebraicCurves](../AlgebraicCurves/README.md) Layers 0–5, 8, 10) | places, divisors, genus, class number, constant extensions, Weierstrass coordinates | 2.3, 2.4, 3.1, 5.1 |
| [FunctionFieldArithmetic](../FunctionFieldArithmetic/README.md) §0.2, §§5.1–5.6 | counts, zeta function, `L_F` with rationality, functional equation and `L(1) = h`, the scheme-zeta and Jacobian comparison with the root bound, constant extensions, `IsLPolynomialData` | Layers 2–3, 4.11, 5.2 |
| [SchemeAndStackFoundations](../SchemeAndStackFoundations/README.md) §5.11 | `weil_bound_via_surfaces`, `weilBound_eq_hasse` | Layer 3, 5.1 |
| [NewtonPolygons](../NewtonPolygons/README.md) §§2.1, 3.2, 3.3 | the Newton polygon, its slope multiset, products | 4.6 |
| [EllipticCurves](../EllipticCurves/README.md) Layer 3 (Tau Ceti) | `pointCount`, `frobeniusTrace`, Hasse bound, `IsSupersingular`, `zetaFunction` | 5.1, 5.2 |
| `DeligneWeightsAndPurity` §§0.1–0.3 | `IsWeilNumber` | 4.1, 4.2, 5.3 |
| `FaltingsFinitenessAndIsogenyTheorems` R28.5.1 | finiteness of Weil polynomials of fixed degree and modulus | 4.3 |
| [PolynomialGaloisGroups](../../Completed/PolynomialGaloisGroups/README.md) Layers 0, 2, 6 | permutation reading of `Polynomial.Gal` | 4.8 |

### Downstream consumers

| Supplied here | What | Consumer |
| --- | --- | --- |
| Layer 4 | every polynomial-level `av.fq` invariant, consumed by section (4.1–4.11) and by the names of the conventions; that roadmap's polynomial preliminaries cite this layer and define nothing a second time, and it supplies nothing here | `AbelianVarietiesOverFiniteFields` |
| 2.1, 3.1 | the good Euler factor `L_p(T)` of a genus-2 curve over `ℚ` at a prime `p` of good reduction (`g2c.good_lfactors`, the reverse of the characteristic polynomial of Frobenius on the reduction) read as `LPolynomial 𝔽_p F_p` for the function field `F_p` of the reduction, of degree `4`, with `L_p(1) = h_{F_p}`, `b_1 = −(p + 1 − N_1(F_p))`, its Weil polynomial from 2.1, its Riemann hypothesis from 3.1 and the intrinsic prefix `(2, p, b_1, b_2)` of 4.4; the reduction is that roadmap's | `HyperellipticCurves` |
| Layers 2–3 | the Weil polynomial of the function field of any curve over `𝔽_q` in Layer 4's vocabulary, and the Serre and Ihara bounds | the modular- and Shimura-curve roadmaps |

## References

- H. Stichtenoth, *Algebraic Function Fields and Codes*, 2nd ed., GTM 254, Springer, 2009 — Ch. 5:
  §5.1 (Theorem 5.1.15(e)–(f) and Corollary 5.1.16 are read in 2.1–2.3; parts (a)–(d) are
  FunctionFieldArithmetic §5.3's), §5.2 (Theorem 5.2.1, the Riemann hypothesis read in 3.1, and
  Theorem 5.2.3, the Hasse–Weil bound, both consumed), §5.3 (improvements: Theorem 5.3.1 is Serre's
  bound 3.2, Proposition 5.3.3 the maximal-genus form of Ihara's bound in 3.3).
- J.-P. Serre, *Sur le nombre des points rationnels d'une courbe algébrique sur un corps fini*,
  C. R. Acad. Sci. Paris 296 (1983), 397–402 — Serre's bound (3.2).
- J.-P. Serre, *Rational Points on Curves over Finite Fields*, Documents Mathématiques 18, SMF, 2020
  — the bounds of 3.2–3.3 and the maximal-curve discussion of 3.5.
- Y. Ihara, *Some remarks on the number of rational points of algebraic curves over finite fields*,
  J. Fac. Sci. Univ. Tokyo 28 (1981), 721–724 — Ihara's bound (3.3).
- W. C. Waterhouse, *Abelian varieties over finite fields*, Ann. Sci. ÉNS (4) 2 (1969), 521–560 —
  Chapter 2, pp. 527–528: the arithmetic of Weil numbers, the real-root cases and the `±√q`
  dictionary (4.4–4.5); cited for the polynomial-level statements only.
- J. Tate, *Endomorphisms of abelian varieties over finite fields*, Invent. Math. 2 (1966), 134–144,
  and T. Honda, *Isogeny classes of abelian varieties over finite fields*, J. Math. Soc. Japan 20
  (1968), 83–95 — background for the sibling roadmap; here only the motivation for which polynomial
  invariants to define.
- Mathlib, `Mathlib/RingTheory/Polynomial/Dickson.lean` (`Polynomial.dickson`, with its recursion
  `D_{n+2} = X D_{n+1} − a D_n`, `D_0 = 2`, `D_1 = X`, and the identity
  `dickson_one_one_eval_add_inv` for parameter `1`; its docstring cites R. Lidl, G. L. Mullen,
  G. Turnwald, *Dickson polynomials*, Pitman Monographs 65, Longman, 1993) — the Dickson
  polynomials of 4.4.
- LMFDB knowls `av.fq.weil_polynomial`, `av.fq.l-polynomial`, `nf.weil_polynomial`,
  `av.fq.lmfdb_label`, `av.fq.frobenius_angles`, `av.fq.angle_rank`, `av.fq.newton_elevation`,
  `av.fq.p_rank`, `av.fq.ordinary`, `av.fq.supersingular`, `av.fq.number_field`,
  `av.fq.galois_group`, `av.fq.curve_point_counts`, `av.fq.initial_coefficients`,
  `lf.newton_polygon`, `lf.newton_slopes`, `g2c.good_lfactors` — the definitions
  formalized as the knowls state them (conventions 5, 7, 9, 10, 12).
