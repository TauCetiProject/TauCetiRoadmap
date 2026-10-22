# Roadmap: Weil conjectures and cohomological zeta functions

**Summary.** This roadmap connects rational points over finite fields to the integral zeta function, its cohomological degree factors, and its functional equation. Its endpoint is a theorem about an actual smooth proper scheme over a finite field: integral factors independent of the coefficient prime, reciprocal roots of the prescribed absolute values in every complex embedding, the signed functional equation, and trace formulas for every finite extension. The same interfaces support point-count recurrences, polynomial-count criteria, weighted stack counts, and explicit curve and surface calculations.

The constructions start with the rational-point and rational étale cohomology interfaces of **EtaleCohomologyFoundations §§`F`.4 and `F`.10.1–`F`.10.2b**. The proof of purity belongs to **DeligneWeightsAndPurity**. Perfect pairings, cycle classes and weak Lefschetz use **EtaleCohomologyFoundations §§`F`.5–`F`.7** and **EtaleDualityAndPerverseSheaves §§1, 4 and 8**. Here the work is to compare those constructions with counting interfaces, provide algebraic descent and factor-extraction adapters, and expose consequences that retain their exact hypotheses.

There are two routes for curves. The general route imports purity and then takes traces. A second route imports the graph-of-Frobenius Hodge-index inequality on the product of a curve with itself and proves root bounds from estimates for all powers. The numerical argument is independent of the purity theorem. This distinction makes it possible to use either proof without a circular dependency.

## Scope and ownership

This roadmap owns finite groupoid mass, signed Frobenius configurations, their
inverse-zeta and sieve applications, the general finite-spectrum moment criteria,
arbitrary-field rational-series descent, local Fatou normalization over `ℚ_ℓ`,
finite-Galois factor-extraction adapters,
signed functional-equation assembly and its arithmetic
sign descent, polynomial-count and equivariant Tate conclusions, and the geometric
comparisons in WC.0–WC.7. It preserves the distinction between a theorem about
actual cohomology and a numerical theorem about a supplied spectrum.

Scheme geometry, descent, Chow groups, intersection theory and the surface Weil
bound are supplied by SchemeAndStackFoundations §§0–5. Rational adic carriers,
Frobenius and base change are supplied by EtaleCohomologyFoundations §§`F`.0–`F`.4,
`F`.10.1–`F`.10.5. Geometric trace identities belong to
InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T4.
DeligneWeightsAndPurity §1.10 supplies finite-field zeta rationality; §4.4
supplies normalized integral rational-series presentations and
`degreeFactorExtraction`; §§4.4 and 7.15 supply projective and
smooth proper canonical factors. Its §§10.2 and 8.24 supply component bounds and
smooth proper DM purity, respectively. The targets below identify these supplied objects
with integral Euler expansions and with the counting and sign interfaces here;
they do not introduce competing geometric carriers. The arbitrary-field
rational-series theorem and the finite-Galois polynomial extraction theorem
state the algebraic cores separately from those geometric applications.

The elliptic Hasse theorem and the Weierstrass point-count convention are supplied
by EllipticCurves Layer 3 and Tau Ceti. AlgebraicCurves Layers 7, 10 and 12 own the
function-field/model/genus dictionary. Surface numerical divisor local systems
and their cohomological descent comparisons needed here are targets in WC.7,
as are the stated characteristic-sensitive surface invariant comparisons.
DeligneWeightsAndPurity §8.24 supplies rational DM cohomology, Frobenius-equivariant
coarse comparison and smooth proper DM duality. WC.1 constructs point-groupoid
masses, their cohomological comparison, and the remaining compact-support, trace
and arithmetic-family extensions; its pairing export adapts the supplied pairing.
NeronModelsAndSemistableAbelianVarietiesPartII §§2.1, 4.0, 4.5 and 5.0–5.2 supply
the genus-one fibration carrier and rational-surface blowup, Picard and cohomology
comparisons. WC.7 extends the rank-ten comparisons to arbitrary Picard rank and
the Jacobian genus-one case to fibrations without a section.

## Conventions

Fix an actual finite field `k` of characteristic `p` and cardinality `q = p^f`, with `f ≥ 1`. The extension `k_r/k` has degree `r ≥ 1` and cardinality `q^r`. All formulas allow nonprime `q`. For a finite-type `k`-scheme `X`, `N_r` denotes the natural cardinality of Hom over `Spec k` from `Spec k_r` to `X`. Field-isomorphism transport is part of this notation. Finiteness belongs to the rational-point theorem; it is never inferred from finiteness of the topological space of `X`.

Arithmetic Frobenius on geometric points sends coordinates to their `q`-th powers. On rational ℓ-adic cohomology, `ℓ` is prime and `ℓ ≠ p`, and `F` denotes **geometric Galois Frobenius**, inverse to the arithmetic generator. The supplier's convention bridge identifies this `F` with pullback by the scheme `q`-Frobenius. Thus geometric Frobenius on `ℚ_ℓ(1)` is `q⁻¹`, and on `ℚ_ℓ(−d)` is `q^d`. Extension to `k_r` replaces `F` by `F^r`.

For separated finite-type `X`, use `H_c^i(X over the algebraic closure, ℚ_ℓ)`. For proper `X` these agree with `H^i`. Write

```text
P_{i,ℓ}(T) = det(1 − TF | H_c^i),    b_{i,ℓ} = dim H_c^i.
```

The polynomial has constant term one. Its **reciprocal roots** are the eigenvalues of `F`; its zeros are their inverses. All eigenvalue lists retain algebraic multiplicities, including nonsemisimple Frobenius. An invertible `F` makes the degree equal to the dimension. A zero-dimensional vector space contributes the polynomial one.

`Z_X` has constant term one and satisfies

```text
Z_X(T) = ∏_i P_{i,ℓ}(T)^((-1)^(i+1)).
```

This determinant identity is an identity of rational functions with a specified expansion at zero. An Euler product first lives in `ℤ[[T]]`, and its exponential expression lives in `ℚ[[T]]`. Reciprocal substitution belongs to a rational-function or Laurent-series field, not to arbitrary ordinary power series. Negative Euler exponents use integer powers.

For smooth proper pure-`d` `X` put

```text
χ = ∑_{i=0}^{2d} (-1)^i b_i ∈ ℤ,    Δ = ∏_{i=0}^{2d} det(F_i)^((-1)^i).
```

The determinant multiplier is retained until rational descent proves its field of definition. Purity of weight `i` means algebraicity over `ℚ` and modulus `q^{i/2}` under **every** complex embedding of the eigenvalue field. A modulus statement in one embedding is insufficient. In mixed-sheaf statements the weights are integral algebraic weights.

For a stack, a count is a rational **mass**, summing inverse automorphism orders over isomorphism classes. Stack zeta expressions use WC.1’s weighted trace series and mass comparison; integer coefficients are not inferred from rational masses. For a smooth proper scheme over `Spec ℤ`, a polynomial count is an exact identity at every positive prime power, with values elsewhere irrelevant.

## Exact supplier contracts

### From Mathlib and Tau Ceti

Use Mathlib at `6b7abb3` and Tau Ceti at `a91d3aa`. The algebraic targets below extend the following interfaces.

* **Finite fields:** `FiniteField.Extension k p r`, with the prime and positive-degree instances, `finrank_extension`, `natCard_extension`, `algEquivExtension`, and `natCard_algHom_of_finrank_dvd`. These provide fields and algebra maps; the geometric point transport is a separate comparison.
* **Determinants:** `Matrix.charpolyRev`, `Matrix.reverse_charpoly`, `Matrix.eval_charpolyRev`, `Matrix.coeff_charpolyRev_eq_neg_trace`, and `Matrix.charpoly_inv`. The chosen determinant is `det(1 − TF)`, rather than `det(T − F)`.
* **Series:** `PowerSeries.mk`, coefficient extensionality, rescaling and polynomial inclusion; `HahnSeries.ofPowerSeries_injective`; and the existing maps from `RatFunc` and power series to `LaurentSeries`. The Laurent-series field is the common carrier when a rational expression is compared with a formal expansion.
* **Descent and integrality:** `IsGalois.mem_range_algebraMap_iff_fixed` for a finite Galois extension, `IsIntegrallyClosed.eq_map_mul_C_of_dvd` for factors of monic polynomials, Möbius inversion, `padicNorm`, and polynomial equality from infinitely many evaluations.
* **Finite spectra:** `Matrix.vandermonde`, `det_vandermonde_ne_zero_iff`, `mul_nonsing_inv`, geometric-series summation, and the finite-sum norm inequality.
* **Groupoids and characters:** `CategoryTheory.isIsomorphicSetoid`, `Aut`, `Aut.autMulEquivOfIso`, discrete categories, single-object groupoids, action categories, and Tau Ceti's `repRing`, `repRingCharacter`, its injectivity for finite groups in characteristic zero, and its virtual-character image criterion.
* **Elliptic counts:** `WeierstrassCurve.pointCount`, `pointCount_eq_card_point`, and `frobeniusTrace`. The first counts affine solutions and adds infinity; its comparison with the elliptic point carrier requires nonsingularity.

Mathlib's `Scheme.EllAdicCohomology` is an additive-group construction from an integral pro-étale sheaf. Rational finite-dimensional spaces, compact support, continuous Frobenius, and the trace theorem are additional geometric inputs. The roadmap uses the supplier's rational construction explicitly.

### From other roadmaps

| Supplier | Exact contract consumed |
| --- | --- |
| SchemeAndStackFoundations §§0.29, 1.1–1.2, 1.15, 1.18–1.21 | The `q`-power scheme Frobenius over `k`, effective descent, torsors, algebraic/DM stacks and quotients. Effective finite twists are required with their descent datum, rather than inferred from an operator trace. |
| SchemeAndStackFoundations §§3.2–3.4, 5.1–5.6, 5.9–5.11 | Curves and genus, Chow groups and intersection products; adjunction, numerical divisors, Hodge index and `weil_bound_via_surfaces`, over arbitrary characteristic with its actual graph and fibre intersections. |
| EtaleCohomologyFoundations §§`F`.0.2–`F`.0.3, `F`.2–`F`.4 | Constructible coefficient categories, Tate twists, proper/smooth base change, compact supports, finite-dimensional rational realization, Künneth, coefficient extension and continuous actions. Rationalization uses an integral model with the uniform bounds required there. |
| EtaleCohomologyFoundations §§`F`.10.1–`F`.10.2b | `VanishingCycles.frobeniusFixedPoints`, `VanishingCycles.numberOfRationalPoints`, `VanishingCycles.rationalAdicRealization` and `VanishingCycles.frobeniusCohomology`: actual finite point sets, extension fields and geometric/scheme Frobenius compatibility. The rational realization itself is §`F`.4.5. |
| EtaleCohomologyFoundations §§`F`.5–`F`.7, 0.9–0.11 | Exceptional inverse image and duality, the smooth trace, cycle maps with Tate orientation, projective bundles and weak Lefschetz. Use the Frobenius-equivariant perfect pairing, not only equality of Betti numbers. |
| InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T4 | Curve/Jacobian realization and graph trace, finite and rational constructible Grothendieck–Lefschetz, and constant-sheaf counts for every extension with compact support. §IG.0.T4 supplies the independent affine/projective-space and multiplicative-group cohomology comparisons. |
| DeligneWeightsAndPurity §§0.1, 0.10–0.16, 1.6–1.10 | All-conjugates Weil numbers, characteristic power series, powers, tensor products and reciprocal pairings; curve purity and the coefficient Euler product/rational zeta construction `finiteFieldZetaRationality`. |
| DeligneWeightsAndPurity §§4.3–4.4, 7.8–7.15, 8.24, 10.2 | Projective purity, normalized integral rational-series presentations and `degreeFactorExtraction`; canonical projective, smooth proper and homology-manifold factors; mixed direct-image bounds; `dmStack_etaleCohomology`, `dmStack_smoothProper_purity`, Frobenius-equivariant rational coarse comparison and smooth proper DM duality; component-aware bounds. WC.3 compares its finite-Galois algebraic extraction with these canonical factors. |
| EtaleDualityAndPerverseSheaves §§1.3, 4.3, 4.7, 8.1–8.2 | Chow/étale cycle comparison, complete-intersection primitive Betti comparison, alternating middle pairing, graded determinant reciprocity and its sign `poincareReciprocityExport`. WC.1 adapts the DM pairing supplied by DeligneWeightsAndPurity §8.24. |
| ComplexComparisonPartII §§C6.3–C6.6 | Finite, integral and rational Artin comparison, including compact support, cup products, coefficient maps and finite group actions. WC.4 supplies the actual family and transport path. |
| AbelianSchemesAndArithmeticModuli §A4.4; AlgebraicCurves Layers 7, 10, 12 | Jacobian Tate/first-cohomology realization and the field/model/place/genus comparisons, Artin–Schreier different and Hurwitz formula. These retain `b₁=2g` rather than identifying Betti and coherent genus without a comparison. |
| ReductiveGroupsPartII §RG2.3 | Lang torsor triviality for connected smooth linear algebraic groups over finite fields; disconnected groups retain their torsor forms. |
| ArithmeticGaloisRepresentations §§5.1, 5.3 | Frobenius density and characteristic-zero semisimple recognition from density-one traces, for the actual continuous generic Galois representations. |
| PadicHodgeTheory §§5.3, 8.1; Mathlib `NumberField.finrank_eq_one_of_unramified` (`Mathlib.NumberTheory.NumberField.ExistsRamified`) | Potential semistability and good-reduction crystallinity; the Mathlib theorem makes each finite Galois extension cut out by a finite image quotient of an everywhere-unramified representation have degree one. WC.5 proves the required extension-splitting implication, with the hypotheses of van den Bogaart–Edixhoven Lemma 4.2. |
| PadicDifferentialEquationsAndRigidCohomology §§RD.7.1–RD.7.9 | The linear `q`-Frobenius comparison and equality of rigid/crystalline/étale degree factors, with explicit coefficient maps. |
| ClassicalArithmeticCompletion §6.44; LocalFieldsRamification Layer 0 | The Hankel criterion for rational series; finite extensions and norms for WC.1's local Fatou theorem. |
| EllipticCurves Layer 3 | The independent Hasse theorem and Weierstrass normalization. |
| NeronModelsAndSemistableAbelianVarietiesPartII §§2.1, 4.0, 4.5, 5.0–5.2 | `GenusOneFibration`, relative minimality and model/base-change API; `rationalSurface_commonBlowup`, `blowup_Picard_intersection`, `rationalSurface_coherent_vanishing`, `pointBlowup_ellAdicCohomology`, `rationalSurface_cycleClass` and the rank-ten Picard-constancy criterion. WC.7 generalizes the rank and the Jacobian genus-one restriction and agrees with these specializations. |

Tau Ceti supplies `TauCeti.repRing`, `TauCeti.repRingCharacter` and
`TauCeti.mem_range_repRingCharacter_iff` in
`TauCeti.RepresentationTheory.RepresentationRing.Basic`,
`TauCeti.repRingCharacter_injective` in
`TauCeti.RepresentationTheory.RepresentationRing.Injective`, and
`TauCeti.mem_virtualCharacters_iff` in
`TauCeti.RepresentationTheory.CharacterTable.VirtualCharacter`. The virtual-character
criterion uses a finite group, algebraically closed characteristic-zero coefficients
and the irreducible-character expansion; rational irreducibles retain Schur indices.
`WeierstrassCurve.pointCount`, `WeierstrassCurve.pointCount_eq_card_point` and
`WeierstrassCurve.frobeniusTrace` are in
`TauCeti.AlgebraicGeometry.EllipticCurve.PointCount`; its comparison to the nonsingular
point carrier assumes ellipticity and finite affine solutions. The independent
`WeierstrassCurve.hasse_bound` is in
`TauCeti.AlgebraicGeometry.EllipticCurve.HasseBound`.

Tau Ceti's `TauCeti.Toric.Fan`, `TauCeti.Toric.Fan.IsRegular`,
`TauCeti.Toric.Fan.IsComplete`, `TauCeti.Toric.dualSemigroup` and
`TauCeti.Toric.Fan.algebraicRealization` occur in the modules
`TauCeti.Geometry.Toric.Algebraic.Fan.Basic`,
`TauCeti.Geometry.Toric.Algebraic.Regular`,
`TauCeti.Geometry.Toric.Algebraic.DualSemigroup.Basic` and
`TauCeti.Geometry.Toric.Algebraic.Fan.Scheme`. AnalyticToricGeometry Layer 0
records their lattice, cone and gluing contracts. The pinned affine and fan
scheme constructions use complex coefficients; WC.6 owns the integral model
and finite-field comparison of its specified fan, rather than citing those
complex schemes as finite-field constructions.

## How to read the build

WC.0 fixes points and Frobenius. WC.1 handles integral zeta arithmetic and
counting operations without purity, including the stack extensions. WC.2 assembles the signed
equation, and WC.3 uses purity to separate integral degree factors. WC.4 compares
Betti numbers only in a specified family. WC.5 develops the numerical moment
criteria and polynomial-count consequences, with an independent surface route
to curve RH. WC.6 applies the arithmetic to smooth proper schemes and mixed
coefficients; WC.7 identifies the factors in actual geometry and assembles the
endpoint.

`Suggested.lean` states absolute convergence of the arithmetic Euler product,
integral rationality of the actual point-count series,
the smooth proper signed functional equation, rational-series descent, local
Fatou normalization, pure factor extraction and the two principal numerical
moment theorems. Its two definitions use Mathlib's extension fields, scheme
morphisms and formal power series. The sections below explicitly identify these
acceptance statements; other named interfaces describe library targets.

## Layer WC.0: Rational points and Frobenius conventions

This layer fixes the geometric meaning of the subsequent counts and determinants. Its three comparisons prevent the field, point-set and cohomological conventions from diverging.

### Rational points in an extension tower

For finite-type `X → Spec k` and `r ≥ 1`, identify the supplied finite rational-point type with Hom over `Spec k` from `Spec k_r` to `X`. Define the count notation `N_r` by the natural cardinal of that type. If `L/k` and `L′/k` have degree `r`, a `k`-algebra isomorphism between them induces a point bijection, so the count is independent of the extension model. For `r` dividing `s`, chosen extension inclusions must give commuting point-transport squares and commute with `q`-power Frobenius.

The comparison exports finiteness on the actual Hom type. It does not install a finite type on the underlying scheme or its algebraic-closure points. The finite-field cardinality theorem makes `#k_r = q^r`, rather than `p^r` when `q` is not prime.

`extensionPointCount` in `Suggested.lean` takes the cardinality of this actual
Hom type in the category of schemes over `Spec k`, using
`FiniteField.Extension k p r` for each positive degree `r`.

*Needs:* Mathlib's finite-field extension, dimension, cardinality and isomorphism declarations above; EtaleCohomologyFoundations §F.10.1. **Source:** Deligne I, §1.4(a)–(d), equation (1.4.1), pp. 274–275; EtaleCohomologyFoundations §F.10.1. Library target: `finite_extension_point_tower_comparison`.

### Closed points as Frobenius orbits

Identify the closed points of finite-type `X/k` with arithmetic-`q`-Frobenius orbits on `X` over the algebraic closure. The orbit corresponding to `x` has length `deg(x) = [κ(x):k]`. There are finitely many degree-`m` closed points for each `m`. An orbit of length `m` contributes `m` points over `k_r` precisely when `m` divides `r`, and contributes none otherwise.

This comparison supplies both the closed-point counts `a_m` and their relation to `N_r`. The exponent in `1 − T^{deg(x)}` is the residue-field **degree**. The norm `#κ(x) = q^{deg(x)}` appears instead in the arithmetic Dirichlet Euler factor.

*Needs:* the extension-tower comparison; `FiniteField.natCard_algHom_of_finrank_dvd`; EtaleCohomologyFoundations §F.10.1 and DeligneWeightsAndPurity §1.10. **Source:** Deligne I, §1.4(c)–(d), p. 275. Library target: `closed_point_degree_comparison`.

### The rational geometric-Frobenius realization

For separated finite-type `X/k` and `ℓ ≠ p`, identify the spaces used in this roadmap with the supplier's finite-dimensional rational `H_c^i`. For proper `X` also identify them with `H^i`. The operator must be the continuous geometric Galois generator and, under the convention bridge, the pullback by `q`-Frobenius. Verify `F_{k_r} = F_k^r` and the Tate scalars `q⁻¹` on `ℚ_ℓ(1)` and `q^d` on `ℚ_ℓ(−d)`.

The comparison includes compatibility with coefficient extension: dimensions, traces and characteristic polynomials transport by the specified scalar-extension maps. Rationalization is a construction with its own finiteness theorem; the existence of integral cohomology groups alone does not supply these conclusions.

*Needs:* the point-tower comparison; EtaleCohomologyFoundations §§F.4.1–F.4.6 and F.10.2b; `Matrix.charpolyRev`. **Source:** Deligne I, §1.15, p. 279, and §2.2, pp. 280–281. Library target: `geometric_frobenius_realization_comparison`.

The convention checks are a geometric point, a degree-two closed point, and `ℙ¹` over `𝔽₄`. Their expected scalars and counts distinguish inverse Frobenius, degree from norm, and `q` from `p` before the zeta formulas are used.

### Examples

The geometric point has `N_r=1` and Frobenius `1`; a degree-two point has counts `0,2,0,2,…`; `ℙ¹/𝔽₄` has `N₁=5` and Tate eigenvalue `4`.

### Dependencies

*Needs:* Mathlib finite-field extensions; EtaleCohomologyFoundations §§F.4, F.10.1–F.10.2b; SchemeAndStackFoundations §0.29.

## Layer WC.1: Integral zeta arithmetic, masses and configurations

The first part of this layer derives rational and integral arithmetic presentations without purity. The second part supplies the counting operations used for stacks, twists and sieves. Curve numerators are available here before any Riemann-hypothesis assertion.

### Arithmetic Euler products over the integers

For every finite-type scheme `X/ℤ`, construct its formal Dirichlet Euler product
`ζ_X(s)=∏_(x closed) (1−#κ(x)^(−s))⁻¹`. Closed residue fields are finite and
there are finitely many closed points of bounded norm, so each Dirichlet
coefficient is a finite sum. Prove that the constant coefficient is `1`,
open–closed decompositions give products, and that there is a real `c_X` such
that the product and its Dirichlet expansion converge absolutely for
`Re(s)>c_X`. The analytic identity is asserted on this half-plane. For an
`𝔽_q`-scheme prove agreement with `Z_X(q^(−s))` there. Export
`arithmeticZetaEulerProduct`, `arithmeticZeta_openClosed`,
`arithmeticZeta_absoluteConvergence` and `arithmeticZeta_finiteFieldComparison`.
The intended carrier is Mathlib's formal Dirichlet series and, on the stated
half-plane, its complex-valued sum. This target contains no functional equation.
(Source: Deligne I, §§1.1–1.1.3, pp. 273–274.)

`arithmeticZeta_absoluteConvergence` in `Suggested.lean` states absolute Euler
product convergence on a right half-plane for the actual closed points of a
finite-type scheme over `Spec ℤ`, with norms given by residue-field cardinalities.

**Checks.**

- `Spec 𝔽_(q^m)` over `ℤ` contributes `(1−q^(−ms))⁻¹`; replacing degree by norm
  in a power-series exponent gives a different finite-field comparison.
- `Spec ℤ` has one Euler factor `(1−p^(−s))⁻¹` for each prime and converges
  absolutely for `Re(s)>1`; the empty scheme has series `1`.
- `𝔸¹/𝔽_q` has `Z(T)=(1−qT)⁻¹` and hence value `(1−q^(1−s))⁻¹` on its
  convergence half-plane. This fixes the sign and norm in the substitution.

*Needs:* WC.0 closed points; SchemeAndStackFoundations §§0.7–0.9 for
finite-type dimension and affine covers; Mathlib formal Dirichlet series and
absolute convergence of Dirichlet series.

### Euler product and point-count series

For separated finite-type `X/k`, compare DeligneWeightsAndPurity §1.10’s `Z_X` coefficientwise with

```text
∏_{x closed} (1 − T^(deg x))⁻¹ ∈ ℤ[[T]],    exp(∑_{r≥1} N_r T^r/r) ∈ ℚ[[T]].
```

The product is locally finite in each coefficient. `Z_X(0) = 1`. Finite disjoint unions give products of zeta functions; an open–closed decomposition `X = U ⨿ Y` gives `Z_X = Z_U Z_Y`. After extension of degree `s`, the sequence is `N_{sr}`. These are identifications with the owner's constructions and preserve their coefficient maps.

For a finite-type scheme over `ℤ`, the arithmetic extension uses the closed-point norm `N(x) = #κ(x)`, with Euler factor `(1 − N(x)^{−s})⁻¹`. Its formal Dirichlet expansion has constant term one; an analytic comparison requires a supplied right half-plane of absolute convergence. Over `𝔽_q`, the substitution is `ζ_X(s) = Z_X(q^{−s})` in that convergence region. Use the arithmetic-product target above for its construction and convergence; the finite-field construction alone does not give that extension.

`zetaSeries` in `Suggested.lean` is the displayed exponential series, formed by
substitution into Mathlib's formal exponential.

*Needs:* both point comparisons in WC.0; DeligneWeightsAndPurity §1.10; SchemeAndStackFoundations Layer 1 and the arithmetic-product target above for the last assertion. **Source:** Deligne I, §§1.1–1.1.3, pp. 273–274. Library target: `zeta_euler_comparison`.

### Closed-point Möbius inversion

For `r ≥ 1` the orbit comparison gives integer identities

```text
N_r = ∑_{m∣r} m a_m,    r a_r = ∑_{m∣r} μ(m) N_{r/m}.
```

Consequently the second sum is nonnegative and divisible by `r`. Recovering `a_r` uses this divisibility, not a rational rounding rule. Empty schemes and permuted geometric components satisfy the same identities.

The algebraic form takes arbitrary integer-valued `a` and `N` with the first identity and derives the second by Mathlib's Möbius inversion. Nonnegativity is a separate consequence of their geometric meaning.

*Needs:* WC.0 closed points; `ArithmeticFunction.sum_eq_iff_sum_smul_moebius_eq`. **Source:** Deligne I, §1.4(d) and (1.4.1), p. 275; Mathlib's stated Möbius theorem. Library target: `closed_point_counts_mobius`.

### The cohomological determinant comparison

For separated finite-type `X/k` use the actual compact-support realization and compare the imported identities

```text
N_r = ∑_i (-1)^i Tr(F_i^r),    Z_X(T) = ∏_i det(1 − TF_i)^((-1)^(i+1)) ∈ ℚ_ℓ(T).
```

Only finitely many degrees occur, and the rational expression has the specified Euler-series expansion at zero. For proper `X` pass to ordinary cohomology through the supplied isomorphism. Frobenius is invertible, so `deg P_{i,ℓ} = b_{i,ℓ}`, including `P = 1` for the zero space. Neither eigenvalue purity nor semisimplicity is used.

*Needs:* WC.0 rational realization; the Euler comparison; InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T3–IG.0.T4 and DeligneWeightsAndPurity §1.10; DeligneWeightsAndPurity §0.10; `Matrix.charpolyRev` and `reverse_charpoly`. **Source:** Deligne I, §§1.5–1.5.4, pp. 275–276, and §1.15, p. 279. Library target: `cohomological_zeta_comparison`.

### Rational-series descent

Let `K → L` be a field extension and `f ∈ K[[T]]`. Suppose there are `P,Q ∈ L[T]`, `Q(0) ≠ 0`, with `Q` times the coefficient image of `f` equal to `P`. Then there are such numerator and denominator polynomials over `K`. This is a statement about equality of formal series and does not depend on analytic convergence.

A proof may use eventual recurrences, finite Hankel rank and descent of the resulting linear equations. Applying it with `K = ℚ` and `L = ℚ_ℓ` to the Euler series gives `Z_X ∈ ℚ(T)`. Reduce the fraction and normalize each constant coefficient to one. Uniqueness of the reduced pair follows over the field; integrality comes next.

`rational_series_descent` in `Suggested.lean` states this theorem for arbitrary
field extensions.

*Needs:* `PowerSeries.ext` and polynomial/field algebra; ClassicalArithmeticCompletion §6.44 for the Hankel criterion; the cohomological comparison and DeligneWeightsAndPurity §1.10 for compatibility with supplied geometric rationality. **Source:** Milne, Lemma 27.9 and proof, pp. 156–157; Deligne I, proof of (1.7) ⇒ (1.6), p. 276, for the Hankel descent. Library target: `rational_series_descent`.

### Local Fatou normalization

Prove the following local Fatou theorem over `ℚ_ℓ`; DeligneWeightsAndPurity
§4.4 supplies the global normalized integral rational-series presentation used below.
Let `ℓ` be any prime. If `f ∈ 1 + Tℤ_ℓ[[T]]` and `P,Q ∈ ℚ_ℓ[T]` are coprime with `P(0) = Q(0) = 1` and `Qf = P`, every coefficient of `P` and `Q` has ℓ-adic norm **at most** one. Thus both polynomials are integral. The coefficient norm hypothesis is inclusive at one.

In a splitting field, a denominator reciprocal root of norm greater than one would give a zero of `Q` in the convergence disc of `f`. Evaluating `Qf = P` there contradicts coprimality. Apply the argument to `f⁻¹` as well for the numerator. This local statement applies even when `ℓ = p`, although `p` cannot be used as the coefficient prime in the étale trace formula.

`local_fatou_normalization` in `Suggested.lean` states this theorem for every
prime, with both numerator and denominator bounds.

*Needs:* local fields and their finite extensions from **LocalFieldsRamification, Layer 0**; norm comparison for series, `Summable.of_norm_bounded`, geometric-series summability, and `PowerSeries.ext`. **Source:** Milne, Lemma 27.10 and proof, p. 158. Library target: `local_fatou_normalization`.

**Checks.**

- The geometric series `f=1/(1−T)` has `P=1`, `Q=1−T`; its denominator's
  linear coefficient has norm exactly one, so a strict bound would fail.
- For `f=1−T`, `P=1−T` and `Q=1`, the numerator's linear coefficient also
  has norm one. The conclusion controls both polynomials.
- Without coprimality, `f=1` and `P=Q=1−ℓ⁻¹T` satisfy the normalized series
  identity, but their linear coefficient has norm `ℓ>1`.

### The normalized integral rational presentation

For separated finite-type `X/k`, let `Z_X = U/V` be the reduced rational presentation over `ℚ`, normalized by `U(0) = V(0) = 1`. Then `U,V` belong to `ℤ[T]` and are coprime over `ℚ`. Their expansion is exactly the integral Euler series. Normalization, reduction, numerator and denominator commute with field embeddings.

Compare the integral Euler series and determinant expression here with the normalized integral presentation supplied by DeligneWeightsAndPurity §4.4. Its global integral-series theorem applies to the Euler series. Uniqueness of the reduced normalized pair identifies the supplied numerator and denominator with this counting presentation. No weight statement enters; the reduced `U` and `V` are parity products after cancellations, rather than individual degree factors.

`normalized_integral_zeta_presentation` in `Suggested.lean` states this for the
actual `zetaSeries` of a scheme over any finite field. Finite type is expressed
by Mathlib's locally finite type and quasi-compact morphism classes.

*Needs:* the cohomological and Euler comparisons; DeligneWeightsAndPurity §§1.10 and 4.4 normalized integral rational-series presentation; Mathlib `padicNorm` and rational arithmetic. **Source:** Milne, Proposition 27.11 and proof, p. 158; Deligne I, proof of (1.7) ⇒ (1.6), p. 276. Library target: `normalized_integral_zeta_presentation`.

### Finite groupoid mass

For a groupoid `C` whose isomorphism-class quotient is finite and whose automorphism groups are finite, define

```text
mass(C) = ∑_{[x]∈π₀C} 1/#Aut(x) ∈ ℚ.
```

Use Mathlib's `isIsomorphicSetoid` and `Aut`. Automorphism cardinalities are positive because the identity exists. An isomorphism conjugates automorphism groups, so the summand is independent of representatives. The finiteness data are arguments, to be proved before applying the definition to a point groupoid.

Name the library definition `groupoidMass`. Prove that isomorphisms identify
finite automorphism cardinalities and that equivalences preserve mass. A finite
discrete groupoid has mass equal to its number of objects; a single-object
groupoid attached to a finite group `G` has mass `1/#G`. Products multiply
masses and disjoint unions add them. For a finite group acting on a finite set
`Y`, orbit–stabilizer gives mass `#Y/#G`, including nonfree actions. For a sum
or action category, carry any groupoid instance that instance search requires
explicitly.

**Checks.**

- The empty discrete groupoid has mass `0`; a discrete three-element set has mass `3`.
- The single-object groupoid of the group of order two has mass `1/2`, different from `1`.
- Its regular action groupoid has mass `1`, despite having two objects.

These distinguish objects from isomorphism classes and preserve automorphism denominators.

*Needs:* `isIsomorphicSetoid`, `Aut.autMulEquivOfIso`, `SingleObj.groupoid`, `Units.toAut`, `Discrete`, products, sums and `ActionCategory`. **Source:** Bergström–Faber–Payne, §1, weighted count preceding Proposition 1.3, published pp. 1324–1325; elementary equivalence and orbit–stabilizer consequences. The API and checks use the same definition and source.

### Stack points, compact supports and duality

Use SchemeAndStackFoundations §§1.18–1.21's stack carriers. For a finite-type
algebraic stack `𝒳/k` with affine stabilizers, construct its
point groupoid over each `k_r` by evaluating the stack at `Spec k_r`. Prove finite
isomorphism classes and finite automorphism groups, with extension, equivalence
and locally closed stratification compatibility. The intended interface
`stackPointGroupoid(𝒳, k_r)` returns a groupoid with these finiteness theorems;
its numerical mass is the finite-groupoid definition above, applied after finiteness is proved.
For a DM stack with coarse space `π:𝒳→X`, use DeligneWeightsAndPurity §8.24
for rational coarse comparison `Rπ_*ℚ_ℓ≃ℚ_ℓ` in characteristic `p≠ℓ`,
with Frobenius equivariance. Construct its compatibility with the compact-support
interface below. Rational coefficients allow stabilizer orders divisible by `ℓ`. (Bergström–Faber–Payne, Proposition 1.3, pp. 1324–1325;
van den Bogaart–Edixhoven §3, pp. 4–6, for rational coarse comparison.)

Extend DeligneWeightsAndPurity §8.24's rational DM coefficient descent to
`stackCompactSupportCohomology(𝒳, E)`, for separated finite-type DM stacks and
finite `E/ℚ_ℓ`, by descent of the constructible lower-shriek operation. Prove
atlas-refinement invariance, finite-dimensionality and boundedness, localization,
Künneth, coefficient extension, finite group actions and geometric Frobenius
compatibility. Prove the weighted trace identity for every `r≥1`:
`mass(𝒳(k_r)) = ∑_i (-1)^i Tr(F^r | H_c^i(𝒳_k̄, ℚ_ℓ))`.
For smooth proper pure-dimensional DM stacks adapt DeligneWeightsAndPurity
§8.24's Frobenius-equivariant perfect pairing
`H^i ⊗ H^(2d−i) → ℚ_ℓ(−d)` to WC.2, retaining graded symmetry, alternating
middle degree when `d` is odd, and determinant reciprocity. Name these exports
`stackCompactSupportTrace` and `stackPoincarePairing`. Their API includes proper
comparison `H_c=H`, base extension `F↦F^r`, pullback and finite-action compatibility,
and the adjunction, tensor and Tate comparison maps. Stack rational smooth proper
transport and Artin comparison are constructed by descent from
EtaleCohomologyFoundations §§`F`.2–`F`.4 and ComplexComparisonPartII §C6.6. For smooth
proper DM stacks over a `p`-adic trait, include descent of the rational crystalline
and de Rham comparison of PadicHodgeTheory §8.1; it is the input to the stack
polynomial-count theorem over all `Spec ℤ`. (Bergström–Faber–Payne, proofs of
Propositions 3.1, 4.2 and 9.3, pp. 1330–1331, 1352; van den Bogaart–Edixhoven,
Theorem 2.1 and §3–§4, pp. 3–10.)

**Checks.**

- `Spec k` has one point class with trivial automorphisms, mass `1`, and just
  `H⁰=ℚ_ℓ` with Frobenius `1`; the empty stack has mass and every group zero.
- For a finite constant group `G`, the groupoid `BG(k)` includes torsors as well
  as the trivial torsor. For `G=C₂` it has two classes, each of weight `1/2`,
  hence mass `1`, agreeing with coarse `Spec k`. Keeping only the trivial torsor
  gives the incorrect answer `1/2`. Over the geometric field rational higher
  group cohomology vanishes even for `ℓ=2`.
- `ℙ¹` as a stack has pairing to `ℚ_ℓ(−1)` and endpoint eigenvalues `1,q`;
  replacing the target by `ℚ_ℓ(1)` reverses the top scalar. The open `𝔾_m`
  requires compact-support degrees `1,2`, not ordinary degrees `0,1`.
- A stack family with a nontrivial finite group action retains that action
  under Artin and `p`-adic comparison; it cannot be replaced by the dimensions
  of its coarse-space cohomology.

*Needs:* SchemeAndStackFoundations §§1.18–1.21;
DeligneWeightsAndPurity §8.24 rational DM coefficients, coarse comparison and smooth proper pairing;
EtaleCohomologyFoundations §§`F`.2–`F`.6;
InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T3–IG.0.T4 for scheme traces;
ComplexComparisonPartII §C6.6 and PadicHodgeTheory §8.1 for the indicated comparisons.

### Stack mass, quotients and traces

Compare a finite-type stack's weighted count with groupoidMass on its actual finite-field point groupoid, assuming the finite-class and finite-automorphism conditions. A finite locally closed stratification gives an additive mass formula.

For `[Y/G]`, with `Y` finite type and `G` a connected smooth linear algebraic group over `k`, Lang's torsor triviality gives `#Y(k)/#G(k)`. A disconnected group requires the torsor forms; the connected formula cannot be used without them. For a finite-type DM stack with coarse space `X_c`, the rational weighted count equals `#X_c(k)`. For a separated finite-type DM stack with bounded finite-dimensional rational compact-support cohomology and its stack trace theorem, the mass is the alternating Frobenius trace.

*Needs:* finite groupoid mass; WC.0 rational realization; SchemeAndStackFoundations Layer 1 and WC.1 stack point/coarse/trace targets; ReductiveGroupsPartII §RG2.3 for Lang. **Source:** Bergström–Faber–Payne, Proposition 1.3(i)–(iv), published pp. 1324–1325. Library target: `stack_count_comparison`.

### Twists and Frobenius

Let a finite group `G` act over `k` on separated finite-type `X`, and assume effective finite descent for the forms under consideration; quasiprojectivity is a sufficient setting. For `σ ∈ G`, let `X^σ` be the descended form whose arithmetic action on transported geometric points is `σF_q`. Its `k`-points are `Fix(σF_q)`, and the compact-support trace formula gives their count as the alternating trace of `F_q*σ*` on `H_c^i`. Properness permits ordinary cohomology.

The action is defined over `k`, so it commutes with Frobenius. Extension of this fixed twist to `k_r` has descent operator `σ^rF_q^r`. It usually differs from constructing the σ-twist anew over `k_r`, whose operator is `σF_q^r`. This distinction is part of the comparison API.

*Needs:* WC.0 point transport; the cohomological comparison; SchemeAndStackFoundations Layer 1 effective descent; EtaleCohomologyFoundations §§F.4.5–F.4.6 and InverseGaloisAndArithmeticFundamentalGroups §IG.0.T3. **Source:** Bergström–Faber–Payne, §§9.1–9.2 and Remark 9.2, published pp. 1351–1352. Library target: `twisted_frobenius_point_comparison`.

### The integral character lattice

Under those twist hypotheses, `f(σ) = #X^σ(k)` is a class function. In a characteristic-zero complex realization of the finite cohomological trace data, expand `f = Σ_λ a_λχ_λ` in the irreducible-character basis. Here `a_λ` is the alternating Frobenius trace on the multiplicity spaces `Hom_G(V_λ,H_c^i)`.

There is a unique lift of `f` to the integral complex representation ring if and only if every `a_λ` is an integer. Its value at the identity then recovers the ordinary count; addition and product agree with representation-ring operations whenever the summands lie in this lattice. Merely being a Frobenius trace of a class function does not establish lattice membership. WC.5 will provide an application where actual Betti representation classes establish integrality.

*Needs:* the twist comparison; Tau Ceti `repRing`, `repRingCharacter`, `mem_range_repRingCharacter_iff`, `repRingCharacter_injective`, and `mem_virtualCharacters_iff`, with a finite group and characteristic-zero coefficients. **Source:** Bergström–Faber–Payne, Definition 9.1 and its surrounding discussion, published p. 1351; the precise lattice qualification uses Tau Ceti's character-image criterion. Library target: `equivariant_count_character_lattice`.

### Signed Frobenius configurations

Let `σ` be a permutation of a type `A`. Assume that for each `n` there are finitely many `σ`-stable finite subsets `S` of `A` of cardinality `n`. Let `o(S)` be the number of orbits of `σ` contained in `S`, computed by the image of `S` in the orbit quotient for the cyclic subgroup generated by `σ`. Define

```text
c_n(σ) = ∑_{S : |S|=n, σS=S} (-1)^(o(S)) ∈ ℤ.
```

Name the library definition `signedConfigurationCoefficient`. A finite subset contains distinct points. Its sign counts orbits, so an orbit of length two has sign `−1`. For `A = X` over the algebraic closure, the finite configuration condition follows from WC.0's finiteness of closed points of every bounded degree.

Prove that `c₀=1` and `c₁=−#Fix(σ)`, and that conjugating by a bijection
preserves every coefficient. For finite `A`, coefficients above `#A` vanish.
Disjoint union gives `c_n(σ ⊕ τ)=Σ_{i+j=n} c_i(σ)c_j(τ)` under the stated
finiteness hypotheses. For finite `A`, the generating polynomial is
`Σ_{n≤#A} c_nT^n=∏_{O orbit}(1−T^{#O})` in `ℤ[T]`.

**Checks.**

- The empty permutation has `c₀=1` and `c₁=0`.
- Two fixed points give coefficients `1,−2,1`.
- One two-cycle gives `c₁=0` and `c₂=−1`, different from `+1`.
- A fixed point disjoint from a two-cycle has coefficients `1,−1,−1,1`: the
  convolution API gives `(1−T)(1−T²)`.

*Needs:* WC.0 closed points; `MulAction.orbitRel`, `Subgroup.zpowers`, finite subsets and the existing quotient. **Source:** Bergström–Faber–Payne, §7, equation (8), Definition 7.3 and equation (9), published pp. 1337–1338. The API and checks are finite combinatorial consequences of this definition.

### Inverse zeta and configuration coefficients

For separated finite-type `Y/k`, the coefficient of `T^n` in `Z_Y⁻¹` is `c_n` of arithmetic Frobenius on geometric points. Grouping by partitions `λ` of `n` gives a sum of `(−1)^{length(λ)}` times the number of distinct-point configurations with those orbit lengths. A degree-`m` orbit contributes `1 − T^m`.

Every coefficient sum is finite although the whole geometric point set may be infinite. The proof uses the Euler product and bounded-degree closed-point finiteness, then the finite generating-polynomial API coefficientwise.

*Needs:* signed configurations; the Euler product; SchemeAndStackFoundations Layer 1 for the geometric configuration interpretation. **Source:** Bergström–Faber–Payne, §7, equation (8), published p. 1337, citing the configuration identity of Vakil–Wood. Library target: `inverse_zeta_configuration_formula`.

### Termination for proper even cohomology

Let `Y` be nonempty and proper over `k`, with bounded finite-dimensional rational cohomology and no odd cohomology. Put `B = Σ_{i even} dim H^i`. Then

```text
Z_Y⁻¹ = ∏_{i even} det(1 − TF_i)
```

is a polynomial of degree `B`, so `c_n = 0` for `n > B`. Moreover `Σ_{n=0}^B c_n = 0`. Indeed the constant function gives a Frobenius-fixed vector in `H⁰` even if components are permuted, so the product vanishes at `T = 1`. For empty `Y` the inverse zeta is 1 and the coefficient sum is 1.

*Needs:* cohomological and configuration comparisons. **Source:** Bergström–Faber–Payne, Proposition 7.4 and proof, published p. 1338. Library target: `inverse_zeta_even_termination`.

### The Hasse–Weil sieve

Let `V` be a finite-type parameter scheme over `k` carrying a surjective family of curves. Fibres may be nonreduced. Suppose each scheme-theoretic singular locus `Y_v` is proper of finite type and has no odd rational cohomology; positive-dimensional singular loci are allowed. For `v ∈ V(k)`, set `s_n(v) = c_n(F on Y_v)`, `S_n = Σ_v s_n(v)`, and `B = max_v Σ_{i even} dim H^i(Y_v)`, with `B = 0` if `V(k)` is empty.

Then the number of smooth fibres is

```text
#V_smooth(k) = #V(k) + ∑_{n=1}^B S_n.
```

For `0 ≤ h < B`, the exact error after truncating at `h` is `Σ_{n=h+1}^B S_n`. A fibre contributes to this tail only when its even Betti sum exceeds `h`. Finiteness is coefficientwise configuration finiteness, not finiteness of all geometric singular points. The reduced-curve case specializes to finite singular loci. No flatness assumption or unproved uniform asymptotic estimate is introduced into the sieve.

*Needs:* termination, signed configurations and WC.0 finite parameter points; the proper singular-locus hypotheses are supplied by the application. **Source:** Bergström–Faber–Payne, Propositions 7.1 and 7.5, Remark 7.6 and their proofs, published pp. 1336–1339. Library target: `hasse_weil_sieve`.

### A curve numerator before root bounds

For a smooth projective geometrically connected curve `C/k` of genus `g`, use the independent curve/Jacobian realization to obtain `H⁰ = ℚ_ℓ`, `H² = ℚ_ℓ(−1)` and `dim H¹ = 2g` with their actual Frobenius actions. The numerator `Π_C` has constant term one, integer coefficients and degree `2g`, and its `ℚ_ℓ` image is `det(1 − TF on H¹)`. Thus

```text
Z_C = Π_C(T)/((1 − T)(1 − qT)),    N_r = 1 + q^r − ∑_{j=1}^{2g} α_j^r  (r ≥ 1).
```

The `α_j` are all reciprocal roots with multiplicity. One can derive integrality directly from `Π_C = (1 − T)(1 − qT)Z_C` and the integral series once the cohomological numerator is a polynomial. Rational descent identifies its coefficients. This construction asserts no modulus bound and is available to the surface proof of curve RH.

*Needs:* the cohomological and Euler comparisons; DeligneWeightsAndPurity §0.10; AbelianSchemesAndArithmeticModuli §A4.4 and InverseGaloisAndArithmeticFundamentalGroups §IG.0.T1, including `b₁ = 2g`. **Source:** Deligne I, §§1.5–1.5.4, pp. 275–276; Mustață, Remark 3.7 and equations (3.8)–(3.10), p. 21. Library target: `curve_zeta_numerator_without_rh`.

### Examples

The groupoid, configuration and arithmetic-product Checks above fix denominators, orbit signs and norms. For a smooth projective genus-zero curve the root-bound-free numerator is `1`, giving `Z=1/((1−T)(1−qT))`.

### Dependencies

*Needs:* WC.0; SchemeAndStackFoundations §§1.1–1.21; EtaleCohomologyFoundations §§F.4–F.6; InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T4; DeligneWeightsAndPurity §§0.10, 1.10, 8.24; ReductiveGroupsPartII §RG2.3.

## Layer WC.2: Duality and the signed functional equation

This layer uses duality without purity. Its algebraic assembly accepts the perfect graded pairing and the resulting determinant reciprocity; the smooth proper geometric application obtains that pairing from EtaleCohomologyFoundations §`F`.6. The dualizing-object application in WC.6 uses the corresponding pairing from EtaleCohomologyFoundations §`F`.5 biduality.

### The determinant multiplier

For smooth proper `X/k` of pure dimension `d`, the imported Frobenius-equivariant perfect pairing is

```text
H^i ⊗ H^(2d−i) → ℚ_ℓ(−d).
```

Its target has Frobenius scalar `q^d`. It gives `b_i = b_{2d−i}`, invertible operators, and a reciprocal eigenvalue correspondence `α ↔ q^d/α` with multiplicities. The determinant identity supplied by this pairing is used as linear algebra, so no diagonalization is needed.

Set `χ` and `Δ` as in the conventions. Assemble the exact equation

```text
Z_X(1/(q^d T)) = (-1)^χ Δ T^χ Z_X(T),    Δ² = q^(dχ).
```

in `ℚ_ℓ(T)`. More explicitly, with `δ_i = det F_i`, each degree identity is

```text
P_i(1/(q^d T)) = (-1)^(b_i) δ_i q^(−d b_i) T^(−b_i) P_{2d−i}(T).
```

Taking the alternating product and pairing determinants yields the displayed zeta equation. The algebraic signature can state these degree identities on polynomials over any field and prove the product identity there. Its evaluated form assumes `q` and `T` nonzero and the displayed denominators nonzero; the geometric statement is in the rational-function field.

*Needs:* WC.1 cohomological comparison; EtaleCohomologyFoundations §§F.5–F.6 and EtaleDualityAndPerverseSheaves §8.2; DeligneWeightsAndPurity §0.16; `Matrix.charpoly_inv`. **Source:** Deligne I, §§2.3–2.6, pp. 281–282; Milne, Theorem 27.12 and proof, p. 158. Library target: `signed_zeta_functional_equation`.

### The integral half exponent

For the same `X`, `dχ` is even. If `d` is even there is nothing to prove. If `d` is odd, the middle pairing is alternating and nondegenerate over a field of characteristic zero, so `b_d` is even. Every other degree is paired with a degree of the same parity, and `χ` is even. Consequently `m = dχ/2` belongs to `ℤ`, including when `χ` is negative.

The algebraic parity signature needs only the symmetric Betti list `b_i = b_{2d−i}` and evenness of `b_d` when `d` is odd. Its geometric specialization imports the alternating-pairing theorem. Rational `ℚ₂` coefficients are allowed when `p ≠ 2`: the residue field of `ℤ₂` does not change the characteristic of `ℚ₂`.

*Needs:* the signed assembly; EtaleCohomologyFoundations §§F.5–F.6 and EtaleDualityAndPerverseSheaves §8.2. **Source:** Deligne I, §2.6, p. 281; Milne, Theorem 27.12 and Remark 27.13, pp. 158–159. Library target: `middle_degree_parity`.

### Rational descent and the exact sign

The scalar `A = (−1)^χΔ` belongs to `ℚ×`. Indeed

```text
Z_X(1/(q^d T))/(T^χ Z_X(T))
```

is a nonzero rational function over `ℚ` by WC.1, and its coefficient image is constant over `ℚ_ℓ`. A nonzero coefficient comparison descends the constant. With `m = dχ/2`, define `ε = A/q^m`. Since `ε² = 1`, it is one of `+1` and `−1`. The rational equation is

```text
Z_X(1/(q^d T)) = ε q^m T^χ Z_X(T).
```

For odd `d`, the alternating middle pairing gives `ε = +1`. For even `d`, `ε = (−1)^e`, where `e` is the algebraic multiplicity of the eigenvalue **`+q^{d/2}`** in `H^d`. This is the dimension of the generalized eigenspace. It need not be the dimension of the eigenspace, and Frobenius semisimplicity is not assumed.

*Needs:* the signed equation and parity; WC.1 rational descent; the determinant-sign input from EtaleDualityAndPerverseSheaves §§8.1–8.2. **Source:** Deligne I, §2.6, pp. 281–282; Milne, Remark 27.13, p. 159. Library target: `functional_equation_multiplier_descent`.

### Finite extension and the sign

Under extension `k_r/k`, the Betti list and `χ` stay fixed, `F` becomes `F^r`, and `Δ_r = Δ^r`. The exact multiplier is `(−1)^χΔ^r`. The normalized sign obeys

```text
ε_r = (-1)^((r+1)χ) ε^r,
```

with `q` replaced by `q^r` in the functional equation. In particular, raising `ε` alone to the r-th power can give the wrong answer. The determinant of the powered permutation handles nontrivial component cycles automatically.

*Needs:* WC.0 Frobenius extension compatibility and the preceding multiplier descent. **Source:** Deligne I, §2.6, pp. 281–282, together with the base-extension argument in §7.2 ⇒ §1.7, p. 301. Library target: `functional_equation_base_extension`.

A geometric point has `χ = 1` and `ε = −1`; its sign is still `−1` after a degree-two extension, whereas `ε² = +1`. The projective plane has `χ = 3` and multiplier `−q³T³`. A genus-two curve has `χ = −2` and multiplier `q⁻¹T⁻²`. These are checks of the same rational-function identity. The equivariant coefficientwise duality application appears after the polynomial-count theorem in WC.5.

### Examples

For `Spec k`, the multiplier is `−T`; for `ℙ²` it is `−q³T³`; for a genus-two curve it is `q⁻¹T⁻²`. A degree-two finite étale point changes its normalized sign under extension according to the displayed `ε_r` formula.

### Dependencies

*Needs:* WC.0–WC.1; EtaleCohomologyFoundations §§F.5–F.6; EtaleDualityAndPerverseSheaves §§8.1–8.2; DeligneWeightsAndPurity §§0.10, 0.16.

## Layer WC.3: Separating integral factors by weight

The arithmetic presentation of WC.1 determines a reduced numerator and denominator. Purity makes the contribution of each cohomological degree distinguishable inside those polynomials. The generic extraction theorem is kept independent of projectivity so that WC.6 can use it again.

### Generic degreewise extraction

Let `q > 1` be an integer. Consider finitely many normalized polynomials `P_i` over a characteristic-zero realization field. Their reciprocal roots `α_{i,j}` are nonzero and algebraic over `ℚ`, with multiplicities `b_i`. Suppose each `α_{i,j}` has modulus `q^{i/2}` under every ℚ-embedding of its number field into `ℂ`. Suppose the alternating product of the `P_i` is a fixed `R ∈ ℚ(T)`, whose reduced numerator and denominator are in `ℤ[T]` with constant coefficient one.

Then each `P_i` is the coefficient image of a unique `Π_i ∈ ℤ[T]`, normalized by `Π_i(0) = 1` and of degree `b_i`. Different degrees give `Π_i` that are coprime over `ℚ`. For odd `i`, `Π_i` is the weight-`i` part of the reduced numerator; for even `i`, it is the weight-`i` part of the reduced denominator. This characterizes the factors independently of a realization field or coefficient prime.

The proof has three distinct steps. Since `q > 1`, the degree moduli differ, so no reciprocal root cancels across different degrees. In a finite Galois splitting field over `ℚ`, the set of roots belonging to each weight is Galois stable, giving rational coefficients. Reversing normalized factors makes their reciprocal roots roots of monic integral polynomials; integral closure or Gauss's lemma then gives integer coefficients for `Π_i`. The degree statement uses nonzero reciprocal roots. The theorem applies to any actual realization with these hypotheses. Compare its
integer factors with DeligneWeightsAndPurity §4.4's `degreeFactorExtraction` by
uniqueness. Rational companion matrices of the reversed factors give the
supplier's invertible `ℚ_ℓ`-Frobenius modules for a singleton coefficient-prime
set; this adapter does not require geometric purity.

`degreewise_pure_factor_extraction` in `Suggested.lean` allows any
characteristic-zero realization field. Algebraicity and the modulus under every
complex embedding of each root's generated number field are explicit hypotheses;
the conclusion retains multiplicities, normalization, degrees and coprimality.

*Needs:* WC.1 normalized integral presentation; DeligneWeightsAndPurity §§0.1 and 4.4 `degreeFactorExtraction`; `IsGalois.mem_range_algebraMap_iff_fixed` under finite-dimensional Galois hypotheses and `IsIntegrallyClosed.eq_map_mul_C_of_dvd`. **Source:** Deligne I, proof of (1.7) ⇒ (1.6), pp. 276–277; Milne, §27.14(c)–(d) and proof, p. 159. Library target: `degreewise_pure_factor_extraction`.

### The projective Weil factors

For smooth projective `X/k`, import projective purity and canonical integral
factors from DeligneWeightsAndPurity §§4.3–4.4. No geometric-connectedness
hypothesis is needed. Compare these factors with generic extraction on the
WC.1 determinant expression; uniqueness identifies both families. For every `i` there is a unique `Π_i ∈ ℤ[T]` whose coefficient image equals `det(1 − TF on H^i)` for every `ℓ ≠ p`. It has constant coefficient one and degree `b_i`.

Its reciprocal roots are algebraic integers, and every complex conjugate of each has modulus `q^{i/2}`. Factors in different degrees are coprime; both the factors and their degrees are independent of `ℓ`. This conclusion contains no Frobenius semisimplicity statement.

*Needs:* WC.0 rational realization; WC.1 cohomological comparison; generic extraction; DeligneWeightsAndPurity §§4.3–4.4 projective purity and canonical factors. **Source:** Deligne I, Theorem 1.6 and Lemma 1.7, p. 276, with the extraction proof on pp. 276–277. Library target: `integral_projective_weil_factors`.

The zero space gives `Π_i = 1`. A permutation in degree zero retains its cycle factors and all roots of unity with their multiplicities. A unipotent block has the same polynomial as its semisimplification; this does not identify the two operators. These checks preserve the scope of the theorem.

### Examples

The empty degree factor is `1`; degree-zero component cycles preserve roots of unity. The rank-two unipotent block has factor `(1−T)²`, so extraction preserves multiplicities and implies no operator semisimplicity.

### Dependencies

*Needs:* WC.0–WC.1; DeligneWeightsAndPurity §§0.1, 4.3–4.4; Mathlib Galois descent and integral closure.

## Layer WC.4: Betti numbers in a specified comparison family

### Transport to a complex fibre

Let `f:X → S` be smooth proper, `S` connected, and `ℓ` invertible on `S`. Specify a geometric finite-field fibre, a complex geometric fibre, and an étale transport path `γ` between them. Compose the supplied rational fibre transport with Artin comparison to obtain

```text
H^i_et(X_s̄, ℚ_ℓ) ≃ H^i_sing(X_t(ℂ), ℚ) ⊗_ℚ ℚ_ℓ.
```

The isomorphism depends on `γ`; dimensions and Betti numbers do not. Compatibility with cup products, Tate twists and finite group actions is part of the supplied comparison. The exact family and path are arguments. No conclusion constructs a lifting family or complex variety from an arbitrary finite-field scheme.

*Needs:* WC.0 rational realization; EtaleCohomologyFoundations §§F.2.1–F.2.2 and F.4.6 for lisse transport; ComplexComparisonPartII §§C6.3–C6.6 for Artin comparison. **Source:** Milne, §27.14(e), p. 159, with proper-smooth transport in Theorems 20.2–20.4, pp. 127–128, its lifting application in Theorem 20.5, p. 129, and Artin comparison in Theorem 21.1, p. 130; the named comparison layers specify the maps and compatibilities. Library target: `betti_comparison_supplied_family`.

This interface can compare a complete intersection with a supplied complex complete intersection, or compare the fibres of a family over `Spec ℤ` after removing the coefficient prime. A case with no specified complex fibre still has the WC.3 factor theorem; it does not receive a complex Betti comparison. Equivariant polynomial counts use this transport only after WC.5 establishes the Tate conclusion.

### Examples

A supplied smooth proper family with a complex projective-line fibre has Betti dimensions `1,0,1` in every transported fibre. Two choices of transport path can give different isomorphisms with the same dimensions; absence of a complex fibre gives no lifting conclusion.

### Dependencies

*Needs:* WC.0; EtaleCohomologyFoundations §§F.2, F.4; ComplexComparisonPartII §§C6.3–C6.6.

## Layer WC.5: Counts, finite spectra and polynomial consequences

This layer has a numerical component that is useful independently of algebraic geometry, then applications to canonical factors and arithmetic families. The surface route is an independent branch at the end.

### Finite spectra: recovering a root from a window of moments

Let `K` be a field, `β:Fin d → K` injective, and `c:Fin d → K` arbitrary. Let `V` have entries `V_{ij} = β_i^j`, with rows indexed by roots and columns by exponents, and let `A = V⁻¹` be Mathlib's nonsingular inverse. For `n ≥ 0` and `k < d`,

```text
c_k β_k^n = ∑_{j<d} A_{jk} (∑_{i<d} c_i β_i^(n+j)).
```

Distinctness makes `V` invertible. The coefficient uses `A_{jk}`, not `A_{kj}`: a moment window is the row vector `(c_iβ_i^n)_i` multiplied by `V`. Zero roots and arbitrary characteristic are allowed. For an empty family there is no `k`.

*Needs:* `Matrix.vandermonde`, `det_vandermonde_ne_zero_iff`, `mul_nonsing_inv`. **Source:** Mathlib, LinearAlgebra/Vandermonde and Matrix/NonsingularInverse, the named determinant and inverse theorems; this is their finite-matrix consequence. Library target: `recover_consecutive_moments`.

### A quantitative moment-window bound

Now let `K` be a normed field, `C,R ≥ 0`, and suppose `|Σ_i c_iβ_i^m| ≤ CR^m` for all `m ≥ N`. For `n ≥ N`, the previous identity and the triangle inequality give

```text
‖c_k‖ ‖β_k‖^n ≤ C R^n ∑_{j<d} ‖A_{jk}‖ R^j.
```

The window constant depends on `β` and `R` but not on `n`. No division by `R` or `c_k` appears, so `R = 0` and zero coefficients are permitted. Use positive `n` when deducing a conclusion from the zero-radius case.

*Needs:* moment recovery and Mathlib `norm_sum_le`. **Source:** the same Vandermonde and inverse declarations, with finite-sum norm inequalities. Library target: `consecutive_moment_bound`.

### Visible distinct roots

With the same eventual bound and an injective `β`, `c_k ≠ 0` implies `|β_k| ≤ R`. If `R > 0` and `|β_k| > R`, the quantitative bound contradicts unbounded powers of `|β_k|/R`. If `R = 0`, positive tail moments vanish and the recovery identity forces `c_kβ_k^n = 0`.

This theorem needs neither completeness nor characteristic zero. The tail may begin at any fixed `N`. A root with zero coefficient is invisible and has no asserted bound.

*Needs:* the moment-window bound; unbounded powers for a ratio greater than one; the Vandermonde moment-uniqueness theorem for the zero case. **Source:** Hongjie Yu, Appendix C, unnumbered finite-spectrum lemma and proof, p. 81; the weighted distinct-root form is proved by the explicit matrix argument above. Library target: `norm_le_of_distinct_moment_bound`.

### Grouping coincident roots

For `α,w:Fin d → K` with possible repeats, write `a_β = Σ_{i:α_i=β}w_i`. If the weighted moment sum is eventually bounded by `CR^n`, every root with `a_β ≠ 0` has modulus at most `R`. Grouping takes place before the distinct-root theorem. A nonzero individual `w_i` is insufficient if the full fibre sum vanishes.

`norm_le_of_grouped_moment_bound` in `Suggested.lean` states this weighted
finite-spectrum theorem over any normed field, with an arbitrary eventual tail.

*Needs:* the visible distinct-root theorem and finite fibre grouping. **Source:** Yu, Appendix C, p. 81; grouping is the finite algebraic reduction to distinct roots. Library target: `norm_le_of_grouped_moment_bound`.

### The unweighted power-sum converse

For a characteristic-zero normed field and any finite family `α`, an eventual bound `|Σ_iα_i^n| ≤ CR^n`, `C,R ≥ 0`, implies `|α_i| ≤ R` for every `i`. Equal roots have a positive integer multiplicity, and its image in `K` is nonzero. This is exactly the use of characteristic zero. Neither nonzero roots nor distinctness are required.

*Needs:* the grouped-spectrum theorem. **Source:** Yu, Appendix C, p. 81. Library target: `norm_le_of_power_sum_bound`.

### Equivalence with bounds for all positive powers

For such a family and `R ≥ 0`, every root has modulus at most `R` if and only if there exists `C ≥ 0` with `|Σ_iα_i^n| ≤ CR^n` for every `n ≥ 1`. In the forward direction take `C = d`. The converse uses the preceding theorem.

The quantifier over all positive powers is essential: a first moment, or any prescribed finite initial window without control of the tail, can miss cancellation.

*Needs:* the power-sum converse and `norm_sum_le`. **Source:** Yu, Appendix C, p. 81; the reverse estimate is the finite triangle inequality. Library target: `power_sum_bound_iff`.

### Reciprocal moments escaping the unit ball

Let `K` be a normed field, `d > 0`, `γ` injective, `0 < |γ_i| < 1` and `c_i ≠ 0` for every `i`. For every `N` there exists `n ≥ max(N,1)` such that

```text
‖∑_i c_i (γ_i⁻¹)^n‖ > 1.
```

Otherwise the distinct-root theorem with `R = C = 1` would bound every inverse root by one. In a p-adic field the displayed sum lies outside the valuation ring. The explicit proof works for arbitrary nonzero coefficients, not only integral coefficients, and proves escape arbitrarily far out.

*Needs:* the distinct-spectrum bound. **Source:** Yu, Appendix C, p. 81, with this stronger coefficient generality supplied by the preceding proof. Library target: `reciprocal_moments_escape`.

### The convergent generating expression

For a normed field `K`, finite `β,c`, and `z` with `|β_i z| < 1` for every `i`, the positive-exponent series has the specified sum

```text
∑_{n≥0} (∑_i c_i β_i^(n+1)) z^(n+1) = ∑_i c_i β_i z/(1 − β_i z).
```

State it using `HasSum`, rather than assigning a totalized infinite sum to a possibly divergent series. Repeated and zero roots are allowed. Each geometric series already has a sum in `K`; completeness is unnecessary here.

*Needs:* Mathlib `hasSum_geometric_of_norm_lt_one` and finite interchange of sums. **Source:** Milne, Lemma 27.5 and proof, pp. 155–156; Mustață, proof of Lemma 3.8, equations (3.11)–(3.12), p. 21. Library target: `hasSum_power_sum_generating`.

### A common numerator and denominator

Over any field `K` define local polynomial expressions

```text
D(T) = ∏_i (1 − β_i T),    B(T) = ∑_i c_i β_i T ∏_{j≠i} (1 − β_j T).
```

Then `D(0) = 1`, hence `D ≠ 0`. Whenever all factors `1 − β_i z` are nonzero, `B(z)/D(z) = Σ_i c_iβ_i z/(1 − β_i z)`. Thus `B/D` is a well-defined element of the existing rational-function field, and is the rational expression of the convergent sum. For an empty family `D = 1` and `B = 0`.

*Needs:* polynomial evaluation, finite products and field algebra. **Source:** Milne, Lemma 27.5, pp. 155–156; Mustață, equations (3.11)–(3.12), p. 21, with denominators explicitly combined. Library target: `generating_common_denominator`.

### The formal polynomial identity

Over any commutative ring `K`, retain the same `D` and `B` and let `G` be the existing PowerSeries constructor with coefficient zero at index zero and coefficient `Σ_i c_iβ_i^n` at `n > 0`. Then

```text
D G = B in K[[T]].
```

This theorem requires no norm, convergence, characteristic restriction, root distinctness, or field hypothesis. It holds with zero divisors. Prove the single-root geometric coefficient identity and multiply by the remaining factors, then sum. `D`, `B` and `G` are local expressions on existing carriers, not new structures.

*Needs:* `PowerSeries.mk`, `coeff_mk`, `ext`, `mk_one_mul_one_sub_eq_one`, rescaling and coefficient multiplication, and polynomial inclusion. **Source:** Mathlib, RingTheory/PowerSeries/WellKnown, the named geometric-series product identity, with Basic's coefficient and rescale API. Library target: `formal_power_sum_product`.

### Comparison in Laurent series

When `K` is a field, the image of `G` in `LaurentSeries K` equals the image of `B/D` from `RatFunc K` under its existing algebra map. Since `D(0) = 1`, cancellation in the Laurent-series field follows from `DG = B`. The resulting expansion has no negative terms, constant coefficient zero, and positive coefficients `Σ_i c_iβ_i^n`.

This uses a common field of Laurent series. It does not require, or assert, a direct inclusion of every rational function into power series.

*Needs:* the formal product and common-denominator identities; polynomial inclusion injectivity, `HahnSeries.ofPowerSeries_injective`, `RatFunc.coe_coe`, `RatFunc.algebraMap_apply_div` and coefficient comparison. **Source:** Mathlib, RingTheory/LaurentSeries and HahnSeries/PowerSeries, the named embeddings and rational-function compatibility declarations. Library target: `formal_power_sum_eq_ratFunc`.

### The exact pole-cancellation criterion

Let `β` be injective over a field and `β_k ≠ 0`. Evaluating `B` at `β_k⁻¹` leaves only the k-th summand:

```text
B(β_k⁻¹) = c_k ∏_{j≠k} (1 − β_j/β_k).
```

All displayed factors are nonzero, so this value is zero exactly when `c_k = 0`. `D` has a simple zero there. The reduced rational function therefore has a pole at `β_k⁻¹` exactly when `c_k ≠ 0`. With repeats, first group the roots and use their total coefficient. A zero root has no finite reciprocal pole.

*Needs:* the common numerator and denominator. **Source:** Milne, Lemma 27.5, pp. 155–156; Mustață, proof of Lemma 3.8, p. 21, with cancellation explicitly resolved. Library target: `generating_pole_cancellation_iff`.

### No poles in the bounded disc

Suppose `β` is injective, every `c_i` is nonzero, and the weighted moments satisfy an eventual `CR^n` bound with `C,R ≥ 0`. If `R|z| < 1`, then all `1 − β_i z` are nonzero and the positive generating series has the rational sum above. For `R > 0` this is the open disc of radius `1/R`. For `R = 0` every visible root is zero and the generating expression vanishes.

Use the finite-spectrum bound first and then geometric summation. Pole analysis is a consequence and is not used circularly to establish the root bound. Coefficients that become zero after grouping must be removed before asserting denominator nonvanishing.

*Needs:* distinct-spectrum bound, generating sum and common denominator. **Source:** Milne, Lemma 27.5, pp. 155–156; Mustață, equations (3.11)–(3.12), p. 21. Library target: `no_pole_of_power_sum_bound`.

### Reciprocal pairing upgrades the bound to equality

Let `α` be a finite complex family, `τ` a permutation of its index set, `R > 0`, and suppose `α_iα_{τ(i)} = R²`. If its unweighted moments are eventually bounded by `CR^n` with `C ≥ 0`, the converse gives `|α_i| ≤ R`. Multiplying the two bounds in each pair and using the product `R²` forces `|α_i| = R`.

Taking `R = √q` gives the numerical curve-RH conclusion. In geometry the reciprocal pairing is an explicit duality input, and this argument is applied in every complex embedding.

*Needs:* the unweighted converse and the specified reciprocal pairing. **Source:** Mustață, Remark 3.7, p. 21. Library target: `norm_eq_of_reciprocal_pairing`.

### A strict bound from little-o moments

For a normed field `K`, injective `β`, coefficients `c` and `R > 0`, suppose `|Σ_i c_iβ_i^n|/R^n` tends to zero. Then `c_k ≠ 0` implies `|β_k| < R`. Apply moment recovery to consecutive shifts: every recovered `c_kβ_k^n/R^n` tends to zero, which excludes a visible root on or outside the boundary.

For repeated roots, group the full fibre coefficients first. The weighted statement needs neither completeness nor characteristic zero.

*Needs:* moment recovery and finite norm inequalities. **Source:** van den Bogaart–Edixhoven, Lemma 4.1 and proof, pp. 6–7, with this weighted form obtained by the Vandermonde argument. Library target: `norm_lt_of_moments_little_o`.

### Polynomial approximation of graded moments

Let `p > 1` be real; let `r,s` be natural numbers and `b_i` finite nonnegative integers for `0 ≤ i ≤ r`. Let `α_{i,j}` be complex numbers of modulus `p^{i/2}`. If `P ∈ ℚ[T]` and

```text
∑_{i=0}^r (-1)^i ∑_j α_{i,j}^n − P(p^n) = o(p^(sn/2)),
```

then `b_i = 0` for odd `i ≥ s`. For even `i = 2j ≥ s` with `i ≤ r`, `P_j = b_i` and every `α_{i,k}` equals the positive real `p^j`. Also `P_j = 0` whenever `2j ≥ s` and `2j > r`.

Group the combined roots from the graded moments and the polynomial terms. At or above the cutoff, the strict little-o bound forces each total coefficient to vanish. Distinct cohomological moduli prevent cancellation between different degrees. Odd-degree coefficients have one sign and cannot cancel; in an even degree only the polynomial root `p^j` can remain. This formulation also handles `s > r` and makes no assertion about lower polynomial coefficients.

`graded_polynomial_approximation` in `Suggested.lean` states this theorem with
unrestricted natural cutoffs `r,s`, including the coefficients beyond degree `r`.

*Needs:* the strict visible-root theorem. **Source:** van den Bogaart–Edixhoven, Lemma 4.1, pp. 6–7, whose range is `s ≤ r ≤ 2s`; Bergström–Faber–Payne, proof of Proposition 3.1, published p. 1330. The unrestricted high-cutoff form is the stated numerical extension. Library target: `graded_polynomial_approximation`.

The numerical checks include an empty spectrum; repeated roots with their multiplicities; roots 2 and −2 whose first moment vanishes and second moment is 8; a root with cancelling fibre weights; and two equal roots in characteristic two whose multiplicity disappears. Four roots `1, i, −1, −i` have their first three moments zero and fourth moment 4. Further checks fix the inverse-Vandermonde transpose, zero-radius tails, zero at the origin, positive rather than zero exponents, repeated denominators, a zero root with no finite pole, and the reciprocal pair `3 ± 4i` of modulus 5. Formal-series checks include an empty family, one root, characteristic-two cancellation, and the special constant coefficient at the origin.

### The all-extension Weil estimate

For smooth projective geometrically connected `X/k` of dimension `d ≥ 1` and every `r ≥ 1`,

```text
|N_r − (1 + q^(dr))| ≤ ∑_{i=1}^{2d−1} b_i q^(ir/2).
```

The `b_i` are degrees of the canonical integral factors of WC.3. Geometric connectedness identifies `H⁰` and `H^{2d}` with the scalar endpoint lines, so only interior degrees appear in the error. Apply the all-power trace formula and the triangle inequality to the eigenvalues in any complex embedding. For curves the coefficient is `b₁ = 2g`, with no additional factor of two.

*Needs:* WC.3 projective factors; WC.1 all-power trace comparison; EtaleCohomologyFoundations §§F.5–F.6 for the endpoints; `norm_sum_le`. **Source:** Deligne I, Lemma 1.7, p. 276, and the trace application in Theorem 8.1 and proof, pp. 301–302. Library target: `all_extension_point_count_bound`.

### Components and dimension zero

For smooth projective pure-`d` `X/k` with `d ≥ 1`, let `σ` permute its geometric connected components and let `c_r` be the number fixed by `σ^r`. The endpoint trace is `c_r(1 + q^{dr})`; the same interior sum bounds

```text
|N_r − c_r(1 + q^(dr))|.
```

For `d = 0`, `X` is finite étale and there is only degree-zero cohomology: `N_r = c_r`. Its zeta is the product of `(1 − T^m)⁻¹` over component cycles of lengths `m`. A geometric point gives `N_r = 1`. A single degree-`m` closed point gives `m` if `m` divides `r` and zero otherwise. The dimension-zero case is kept separate so that the same line is not counted twice as both endpoints.

*Needs:* WC.0 orbit dictionary; the preceding estimate for positive dimension; EtaleCohomologyFoundations §F.6 pairings for the top permutation module; EtaleCohomologyFoundations §§F.0.2 and F.4.5 for finite-étale permutation cohomology. **Source:** Deligne I, §§1.4–1.5, pp. 274–275, and §2.5, p. 281. Library target: `component_and_dimension_zero_counts`. The explicit finite-étale factor comparison is used again in WC.7.

### Compatibility with curve and elliptic bounds

For a smooth projective geometrically connected genus-`g` curve, use the actual curve/Jacobian comparison `b₁ = 2g` to identify the WC bound with the independent Jacobian/Rosati bound from DeligneWeightsAndPurity §1. For a nonsingular Weierstrass elliptic model, identify the scheme count with `WeierstrassCurve.pointCount` and its existing point type. Its trace `a_q = q + 1 − N₁` is `frobeniusTrace`, and `|a_q| ≤ 2√q` agrees with the independent Hasse theorem.

Make the same comparison over each `k_r` using WC.0's extension transport. The result is agreement of counts and estimates. It does not repeat the Jacobian or elliptic proof.

*Needs:* the all-extension estimate; DeligneWeightsAndPurity §§1.6–1.7; **EllipticCurves, Layer 3**; Tau Ceti `pointCount`, `pointCount_eq_card_point` with ellipticity and finite affine solutions, and `frobeniusTrace`. **Source:** Milne, Theorem 27.15, p. 159, for the purity estimate; Mustață, Example 3.10, pp. 22–23, for elliptic normalization. Library target: `curve_elliptic_bound_comparison`.

### Recurrences and Newton recovery

Let a canonical factor be `Π_i(T) = 1 + c_{i,1}T + ⋯ + c_{i,b_i}T^{b_i}` and set `S_{i,n} = Tr(F_i^n)`, with the algebraic zeroth moment `S_{i,0} = b_i`. Then for `n ≥ b_i`,

```text
S_{i,n} + ∑_{j=1}^{b_i} c_{i,j} S_{i,n−j} = 0.
```

For `1 ≤ n ≤ b_i`, Newton's identity reads

```text
S_{i,n} + ∑_{j=1}^{n−1} c_{i,j} S_{i,n−j} + n c_{i,n} = 0.
```

In characteristic zero the first `b_i` moments recover the factor recursively. These algebraic statements are valid for any finite list of roots, including repeated roots and a zero-dimensional list. Their geometric application requires the appropriate factor realization, but not a root-modulus bound.

For a genus-`g` curve, `S_n = 1 + q^n − N_n` and `S₀ = 2g`. In any dimension, `Q_total = ∏_i Π_i` annihilates the point-count moment sequence after the algebraic extension `N₀ = χ`. This is not a point count over a field with one element. Its degree `Σ_i b_i` is an upper bound on recurrence order; cancellations can reduce the minimal order.

*Needs:* DeligneWeightsAndPurity §0.10 and `Matrix.reverse_charpoly`; WC.3 for general canonical projective factors and WC.1's root-bound-free curve numerator for curves. **Source:** Milne, Lemma 27.5 and Theorem 27.6, pp. 155–156; Deligne I, equation (1.5.3), pp. 275–276, and §1.15, p. 279. Library target: `extension_count_recurrence`.

### Complete intersections

Let `X/k` be a smooth projective geometrically connected complete intersection of dimension `n ≥ 1` and fixed multidegree. Through the complete-intersection comparison, let b′ be the middle Betti number of a smooth complex complete intersection of the same dimension and multidegree. Put `b = b′` if `n` is odd and `b = b′ − 1` if `n` is even. Then for all `r ≥ 1`,

```text
|#X(k_r) − #ℙ^n(k_r)| ≤ b q^(nr/2).
```

Weak Lefschetz identifies the nonmiddle cohomology with projective space. The middle primitive part has exactly b reciprocal roots and is the only error term, with trace sign `(−1)^n`. The complex model and comparison come from the complete-intersection supplier, rather than an arbitrary lifting assumption for all varieties.

*Needs:* the Weil estimate; WC.4 comparison in the supplied family; EtaleDualityAndPerverseSheaves §§4.3 and 4.7. **Source:** Deligne I, Theorem 8.1 and its proof, pp. 301–302. Library target: `complete_intersection_point_count`.

### Exact polynomial point count

For an isomorphism-invariant count function `N:ℕ → ℚ` and `P ∈ ℚ[T]`, define the library predicate `HasPolynomialPointCount N P` by

```text
∀ q ∈ ℕ, IsPrimePow(q) → N(q) = P(q).
```

Mathlib's prime-power predicate means `p^r` with `p` prime and `r ≥ 1`. Values of `N` at 0, 1 and non-prime-powers do not affect the predicate. Actual point sets or finite-mass groupoids supply `N` through WC.0 and WC.1. This definition does not create geometric point sets from a numerical function.

Prove evaluation at every prime power and uniqueness of the polynomial witness.
The zero function has witness zero; pointwise sums and products have the sum and
product of their witnesses. Functions equal on prime powers have exactly the
same witnesses. Uniqueness uses infinitely many prime-power evaluations and
Mathlib's `Polynomial.eq_of_infinite_eval_eq`. The operation lemmas transport
disjoint-union and product counts when the geometric comparisons supply those
operations.

**Checks.**

- `N(q)=q+1` has witness `T+1` for a projective line.
- The empty count has witness zero; `N(q)=q−1` has witness `T−1` for the multiplicative group.
- Replacing `N(4)` by zero while retaining `q+1` elsewhere fails the predicate despite agreement at every prime.
- Two distinct polynomials can agree at `q=2`, so one field does not identify a witness.

*Needs:* `IsPrimePow`, polynomial evaluation and infinite-evaluation equality. **Source:** Bergström–Faber–Payne, §1 polynomial-count property, published p. 1324, and Proposition 9.3, p. 1352; van den Bogaart–Edixhoven, Theorem 2.1, hypothesis (*), p. 3. The API and checks use this exact quantifier.

### A local cutoff for approximate polynomial counts

Let `X` be smooth proper of pure relative dimension `d` over `ℤ_p` and `s ≥ d` an integer. Choose the geometric, coefficient and comparison data giving the generic rational Betti spaces, with `ℓ ≠ p`. Suppose `P ∈ ℚ[T]` and

```text
#X(𝔽_(p^n)) − P(p^n) = o(p^(sn/2)) as n → ∞.
```

Then `H^k` vanishes for odd `k ≥ s`. For `s ≤ 2j ≤ 2d`, `P_j = dim H^{2j}`, and all reciprocal Frobenius roots in that degree are `p^j`. These are eigenvalue and dimension conclusions, not semisimplicity conclusions.

For a DM stack, use mass and the actual stack trace, purity, smooth proper transport and rational comparison contracts. The same graded-moment argument then applies. The error exponent used throughout the proof is `s`, so it remains valid when `s > d`.

*Needs:* graded polynomial approximation; WC.4 supplied comparison; WC.1 stack trace where applicable; DeligneWeightsAndPurity §7.15 and DeligneWeightsAndPurity §8.24’s smooth proper DM purity. **Source:** Bergström–Faber–Payne, Proposition 3.1 and proof, published p. 1330; van den Bogaart–Edixhoven, Lemma 4.1, pp. 6–7. Library target: `local_polynomial_count_cutoff`.

### Approximate counts and Tate semisimplification

Let `U` be a nonempty open in `Spec ℤ`, and `X/U` smooth proper of finite type and pure relative dimension `d`. Let `S` be a set of primes in `U` of **Dirichlet density one**. Suppose a fixed `P ∈ ℚ[T]` satisfies, for each `p ∈ S`,

```text
#X(𝔽_(p^n)) = P(p^n) + o(p^(nd/2)) as n → ∞.
```

There is a unique palindromic polynomial `C ∈ ℤ[T]` with nonnegative coefficients, degree at most `d`, and `C_j = P_j` for `2j ≥ d`. For every `p` in `U` and `n ≥ 1` the exact count is `C(p^n)`. If the generic fibre is nonempty, `deg C = d`; an empty family gives `C = 0`.

For every `ℓ`, the actual generic Galois representation has `H^odd = 0` and

```text
H^(2j)(X_ℚ̄, ℚ_ℓ)^ss ≃ ℚ_ℓ(−j)^(C_j).
```

Smooth proper transport supplies the good-reduction Frobenius traces; duality recovers low degrees from the high-cutoff conclusions; the density-one theorem identifies the semisimplifications. Varying `ℓ` permits the exact count at any good prime, including one equal to an initially chosen coefficient prime.

The input `P` may have incorrect lower coefficients. For example, on `ℙ²` the approximation `T² + T` has error 1, which is little-o of `p^n`, while the exact count is `T² + T + 1`. The theorem constructs `C` instead of asserting `P = C`. For a DM stack, all of the stack trace, comparison, purity and duality inputs are explicit requirements.

*Needs:* the local cutoff; WC.4 transport; WC.2 duality; **ArithmeticGaloisRepresentations §§5.1 and 5.3** for density-one Frobenius determination; polynomial equality on infinitely many evaluations. **Source:** van den Bogaart–Edixhoven, Theorem 2.1, p. 3, and proof in §4, pp. 6–9. Library target: `approximate_counts_tate_semisimplification`.

### Polynomial counts over all `Spec ℤ`

For smooth proper finite-type `X` over **all** `Spec ℤ`, of pure relative dimension `d`, exact polynomial counts over every finite field are equivalent to the existence of nonnegative integers `C_j` such that for every `ℓ`,

```text
H^odd = 0,    H^(2j)(X_ℚ̄, ℚ_ℓ) ≃ ℚ_ℓ(−j)^(C_j)
```

as actual continuous Galois representations. The unique count polynomial is `Σ_j C_jT^j` and is palindromic. This is stronger than the open-`U` result.

To remove semisimplification, twist each even-degree representation to weight zero. Good reduction gives unramifiedness away from `ℓ`, and local potential semistability at `ℓ` is supplied by PadicHodgeTheory §§5.3 and 8.1. The local extension theorem used in van den Bogaart–Edixhoven's Lemma 4.2 makes successive extensions of trivial representations unramified at `ℓ`. The global absence of nontrivial everywhere-unramified extensions of `ℚ` then splits the resulting representation. Explicitly prove `tateExtension_unramified`: for `n≥1`, a potentially semistable representation `V` in an exact sequence `0→ℚ_ℓ^n→V→ℚ_ℓ→0` of `G_ℚℓ`-representations is unramified (van den Bogaart–Edixhoven, Lemma 4.2, pp. 8–10). For a global representation unramified at every finite prime, its compact image is profinite. Each continuous finite quotient cuts out a finite Galois extension of `ℚ` unramified at every finite prime. Apply Mathlib's `NumberField.finrank_eq_one_of_unramified` to that extension and its ring of integers: its degree is one. Thus every such quotient is trivial, and so is the compact image. Induct on the dimension of the global representation after its Tate twist: the invariant codimension-one subrepresentation is trivial by induction, so this exact-sequence lemma applies at `ℓ`. The all-Spec-`ℤ` hypothesis is necessary for this argument. The reverse implication is the all-power trace formula at each prime with a different coefficient prime.

The DM version has the same conclusion only with the stack extension of the comparison and local p-adic inputs, as well as trace, purity and duality. The theorem does not infer that extension from the scheme case.

*Needs:* exact polynomial count; the open-`U` theorem; **PadicHodgeTheory §§5.3 and 8.1**; Mathlib `NumberField.finrank_eq_one_of_unramified` (`Mathlib.NumberTheory.NumberField.ExistsRamified`), applied to the finite Galois extensions cut out by finite image quotients; WC.1 stack comparison contracts when applicable. **Source:** van den Bogaart–Edixhoven, Theorem 2.1 last clause, p. 3, Lemma 4.2 and the end of the proof, pp. 8–10; Bergström–Faber–Payne, §3, p. 1330, and Proposition 9.3, p. 1352. Library target: `polynomial_counts_over_z_tate_cohomology`.

### Equivariant polynomial counts

Let a finite group `G` act over `ℤ` on such a smooth proper scheme `X`, and assume scalar polynomial point counts at every finite field. Use the actual rational Betti representations of its complex fibre to form

```text
A(T) = ∑_j [H^(2j)_sing(X(ℂ), ℚ)] T^j ∈ R_ℚ(G)[T].
```

Odd cohomology vanishes. For every `q` and `σ ∈ G`, the character of `A(q)` at `σ` is `#X^σ(𝔽_q)`, where the twist is constructed over that field. Functorial comparison intertwines `G` and Frobenius, and the preceding full Tate theorem makes Frobenius `q^j` times the identity in degree `2j`. Hence the coefficients are actual representation classes, with nonnegative integral complex multiplicities.

For rational irreducible representations, retain their Schur indices and endomorphism fields when extracting multiplicities. Complex character inner products alone do not automatically give rational-irrep multiplicities. The DM version also requires effective twists and the stack comparison/purity/duality and arithmetic inputs.

*Needs:* WC.4 comparison; the all-Spec-ℤ Tate theorem; WC.1 twists and character-lattice comparison; Tau Ceti `repRing` and `repRingCharacter`. **Source:** Bergström–Faber–Payne, Proposition 9.3 and proof, published p. 1352. Library target: `equivariant_polynomial_point_counts`.

### Equivariant palindromicity

Under the preceding hypotheses with pure relative dimension `d`, `G`-equivariant Poincaré duality identifies the coefficient in degree `j` with the dual of that in degree `d − j`. In the existing rational representation ring,

```text
A_j = A_{d−j}^∨,    A(T) = T^d A(T⁻¹)^∨.
```

The second equality is a Laurent-polynomial identity, with dual applied to each coefficient. Multiplicity polynomials for dual irreducibles are paired. Each is palindromic when that irreducible is self-dual. A DM application uses stack duality, rather than the scheme pairing.

*Needs:* equivariant polynomial counts; EtaleCohomologyFoundations §§F.5–F.6, or WC.1 stack pairing; the contragredient on rational representations and its induced map on Tau Ceti’s representation ring. **Source:** Bergström–Faber–Payne, Remark 9.4, published p. 1352. Library target: `equivariant_polynomial_duality`.

### The independent surface route to curve bounds

For a smooth projective geometrically connected curve `C/k` of genus `g` and every `r ≥ 1`, import the SchemeAndStackFoundations §§5.9–5.11 graph/diagonal Hodge-index theorem over `k_r` and compare its fixed-point count with `N_r`.

Its surface contract works on `C × C` over the algebraic closure. Set `A = {P} × C`, `B = C × {P}`, `Δ` the diagonal, and `Γ_r` the graph `(x,F_q^r x)`. The intersection convention is

```text
A² = B² = 0,    A B = 1,    Δ A = Δ B = 1,    Γ_r A = 1,    Γ_r B = q^r,
```

```text
Δ² = 2 − 2g,    Γ_r² = (2 − 2g) q^r,    Δ Γ_r = N_r.
```

With `D = Δ − A − B` and `E = Γ_r − q^rA − B`, both are orthogonal to the ample divisor `A + B`, and

```text
D² = −2g,    E² = −2g q^r,    D E = N_r − 1 − q^r.
```

Hodge index gives `|N_r − 1 − q^r| ≤ 2gq^{r/2}`. SchemeAndStackFoundations §§5.9–5.11 owns the intersections, adjunction, ampleness and Hodge-index inequality. Here the comparison transports that result to the exact extension-point tower, retaining every `r`.

*Needs:* SchemeAndStackFoundations §§5.9–5.11 surface theorem; WC.0 point-tower and orbit comparisons. **Source:** Mustață, proof of Theorem 3.6 and Proposition 3.9, p. 22, with the fibre labels fixed as above. Library target: `surface_all_extension_bound_comparison`.

### Curve RH from the surface bound

Take the WC.1 integral degree-`2g` numerator `Π_C`, which was constructed without a root bound. Its trace formula and the surface estimate give `|Σ_jα_j^r| ≤ 2gq^{r/2}` for every positive `r`. The finite-spectrum converse gives `|α_j| ≤ √q`. The purity-independent reciprocal pairing from WC.2 then forces equality.

Since `Π_C` has rational integral coefficients, its full reciprocal-root multiset includes every complex conjugate with multiplicity. This establishes the all-conjugates curve RH statement and agrees with the same numerator and functional equation. This route does not use the curve-purity results of DeligneWeightsAndPurity §§1.1–1.9, projective purity in §§4.3–4.4, WC.3 projective purity, or the earlier WC.5 Weil estimate. It does use the purity-free zeta rationality and formal-series compatibility of DeligneWeightsAndPurity §1.10 through WC.1.

*Needs:* surface all-extension bound; WC.1 curve numerator and trace formula; WC.2 duality; finite-spectrum converse and reciprocal-pairing equality. **Source:** Mustață, Remark 3.7, Lemma 3.8 and Theorem 3.6, pp. 21–22. Library target: `curve_rh_from_surface_bound`.

### Examples

The finite-spectrum checks above retain cancellation and repeated roots. On `ℙ²`, the approximate polynomial `T²+T` has small error but the exact polynomial is `T²+T+1`. The independent curve branch takes the numerator from WC.1 and the surface estimate, without projective purity.

### Dependencies

*Needs:* WC.0–WC.4; DeligneWeightsAndPurity §§1.6–1.7, 7.15, 8.24; EtaleDualityAndPerverseSheaves §§4.3, 4.7; SchemeAndStackFoundations §5.11; ArithmeticGaloisRepresentations §§5.1, 5.3; PadicHodgeTheory §§5.3, 8.1; Mathlib `NumberField.finrank_eq_one_of_unramified` (`Mathlib.NumberTheory.NumberField.ExistsRamified`), applied to the finite Galois extensions cut out by finite image quotients.

## Layer WC.6: Smooth proper and mixed extensions

This layer reuses the preceding arithmetic and determinant algebra with broader geometric inputs. Smooth proper purity is an import from DeligneWeightsAndPurity §7.15, while the mixed statement controls the divisor of an `L`-function and has a different conclusion.

### Integral factors for smooth proper schemes

Let `X/k` be smooth proper of finite type and dimension at most `d`. For every `i` there is a unique `Π_i ∈ ℤ[T]` whose coefficient image is `det(1 − TF on H^i)` for every prime `ℓ ≠ p`. It has constant coefficient one, degree `dim H^i`, and reciprocal roots that are algebraic integers pure of weight `i` in every complex embedding. For `i > 2d` or empty `X`, `Π_i = 1`. The factors and dimensions are independent of `ℓ`.

Projectivity, geometric connectedness and Frobenius semisimplicity are not hypotheses. DeligneWeightsAndPurity §§4.4 and 7.15 supply smooth proper purity and these
canonical integral factors. Identify them with the factors obtained by WC.3's
generic algebraic adapter from WC.1's counting presentation. Uniqueness gives
compatibility with coefficient maps and finite extensions, without another
geometric factor construction or the projective specialization.

The nonprojective toric threefold target below supplies an actual smooth proper nonprojective variety with its cohomology comparison. Projective spaces alone do not exercise the removal of projectivity. The empty scheme and a degree-`m` finite étale point separately check trivial factors and a nontrivial degree-zero permutation.

*Needs:* SchemeAndStackFoundations Layers 0–2 actual geometry; WC.0 realization; WC.1 cohomological comparison and normalized integral presentation; WC.3 generic degreewise extraction; DeligneWeightsAndPurity §7.15; `Matrix.charpolyRev` and `eval_charpolyRev`. **Source:** Deligne II, Corollary 3.3.9 and proof, p. 207; Deligne I, proof of (1.7) ⇒ (1.6), pp. 276–277. Library target: `exists_unique_integral_degree_factors_of_smooth_proper`.

### A smooth proper nonprojective threefold

Use Tau Ceti's finite-fan and dual-semigroup carriers for the following fan `Σ`
in `ℤ³`, with the standard lattice map to `ℝ³`. Its rays are generated by

```text
v₁=(1,0,0), v₂=(0,1,0), v₃=(0,0,1), v₄=(−1,−1,−1),
v₅=(−1,−1,0), v₆=(0,−1,−1), v₇=(−1,0,−1).
```

The maximal cones have index triples

```text
123, 127, 136, 167, 235, 257, 356, 456, 457, 467.
```

Include all faces. Prove this is a complete regular fan. Define
`nonprojectiveToricModel` over `Spec ℤ` by gluing
`Spec ℤ[σ∨∩Hom(ℤ³,ℤ)]` along face localizations for this fixed fan, and let
`nonprojectiveToricThreefold(k)` be its fibre over a field `k`. This is the
integral-coefficient version of Tau Ceti's complex fan gluing; prove its complex
base change is the existing `TauCeti.Toric.Fan.algebraicRealization` of `Σ`.
No replacement fan or semigroup carrier is introduced. Prove smoothness,
properness, dimension three and geometric connectedness by the regular complete
fan criterion, and geometric nonprojectivity by the cyclic primitive relations

```text
v₂+v₆=v₁+v₇,    v₃+v₇=v₂+v₅,    v₁+v₅=v₃+v₆.
```

The three strict inequalities required of an ample support function sum to a
contradiction. Export chart and base-change comparisons,
`nonprojectiveToric_smoothProper` and `nonprojectiveToric_notProjective`.
(Fujino–Sato, *On non-projective complete toric varieties*, version 0.27,
Example 4.1, pp. 7–8.)

**Chow presentation of the specified fan.** Before the cohomology comparison,
construct `nonprojectiveToric_chowPresentation`: for every field `k`, identify
the native graded Chow ring of `nonprojectiveToricThreefold(k)` with

```text
ℤ[x₁,…,x₇]/(I_Σ + J_Σ),    deg x_i = 1,
J_Σ = (x₁−x₄−x₅−x₇, x₂−x₄−x₅−x₆, x₃−x₄−x₆−x₇).
```

Here `I_Σ` is generated by squarefree monomials whose ray sets are not cones,
and `J_Σ` consists of the character relations `Σ_i (v_i)_a x_i`, `a=1,2,3`.
Send `x_i` to the invariant divisor of ray `i`; construct the inverse using
invariant-cycle generation and the relations from divisors of characters on
orbit closures. Prove the grading, product and unit laws, compatibility with
field extension, the orbit-closure formula for products along a cone, and the
degree map in codimension three. Compute free graded ranks `1,4,4,1` in
codimensions `0,1,2,3`, with zero groups in higher codimensions. The ring is
that of the field fibre, not the four-dimensional integral total space.

Source: Fulton, *Introduction to Toric Varieties*, §§5.1–5.2; the invariant-cycle
presentation in Fulton–Sturmfels, *Intersection theory on toric varieties*,
Proposition 1.1 and equation (1.1), preprint pp. 4–5.

**Checks.**

- The `123` cone gives `deg(x₁x₂x₃)=1`, the class of its rational fixed point.
- Rays `1,4` lie in no cone, so `x₁x₄=0`; each of the three displayed linear
  relations maps to the principal divisor of its coordinate character.
- The degree-one quotient has rank `7−3=4`; the full presentation has free
  ranks `1,4,4,1`, rather than the `1,1,1,1` of projective three-space. These
  ranks and the invariant generators persist in every field fibre.

Using this presentation, construct `nonprojectiveToric_etaleComparison`:
for every finite field and `ℓ≠p`, rational étale cohomology is Tate in degrees
`0,2,4,6` of dimensions `1,4,4,1` and zero in odd degrees. Construct the cycle-class
isomorphisms `CH^j⊗ℚ_ℓ≃H^(2j)(ℚ_ℓ(j))` by localization along split-torus
orbits and the invariant-cycle presentation, retaining products and extension
of fields. The invariant cycles are defined over the base field, so twisted
Frobenius is the identity and untwisted Frobenius is `q^j`. Compare these actual
operators with this layer's canonical factors. (Fulton, §5.2, for the complex
cycle/cohomology comparison; the localization and finite-field étale comparison
are constructions here on the integral model.)

**Checks.**

- The `123` chart is affine three-space over `ℤ`; the zero-cone overlap is the
  split three-dimensional torus. The glued fibre is not this single affine chart.
- Each of the ten maximal cones has determinant of absolute value one. The
  three primitive relations exclude an ample divisor despite completeness,
  so properness cannot be replaced by projectivity.
- The complex fibre agrees with the supplied complex fan scheme; over `𝔽_q`,
  the degree-two Frobenius operator is `q` on four cycle classes. The factor
  comparison therefore has degrees `1,4,4,1`, exercising smooth proper purity
  on a genuinely nonprojective scheme.

*Needs:* Tau Ceti's fan, regular-cone and dual-semigroup APIs;
SchemeAndStackFoundations §§0–1 and 5.1–5.6 for gluing, properness and the native Chow ring;
the Chow presentation precedes the étale comparison;
EtaleCohomologyFoundations §§`F`.5–`F`.7 for cycle maps, localization and blowups;
WC.3 algebraic extraction and this layer's smooth proper factor theorem.

### Reciprocal zeros and poles of mixed `L`-functions

Let `X/k` be separated finite type of dimension at most `d`. Let `ℓ ≠ p` and let a constructible algebraic `ℚ̄_ℓ`-sheaf descend to a finite extension `E/ℚ_ℓ`, mixed of integral weights at most `n` in the all-complex-conjugates sense. Use its closed-point Euler product and rational compact-support determinant realization `L(X,ℱ,T) ∈ E(T)`.

If `β ≠ 0` is a zero or pole of the **reduced** rational function, then `α = β⁻¹` is algebraic over `ℚ` and has an integral weight `w ≤ n + 2d`: every conjugate has modulus `q^{w/2}`. Compact-support degree `i` contributes weights at most `n + i`, and `i ≤ 2d`. Cancellation can remove a divisor contribution but cannot introduce a new reciprocal root.

There is no smoothness or properness assumption. The result does not assert integer coefficients or `ℓ`-independence for individual cohomological factors, nor weight exactly `i`. A sheaf with a real weight relative to only one chosen embedding does not meet the algebraic mixedness hypothesis here.

*Needs:* SchemeAndStackFoundations Layers 0–2; DeligneWeightsAndPurity §§5.2–5.3 and 7.8–7.12; InverseGaloisAndArithmeticFundamentalGroups §IG.0.T3 and DeligneWeightsAndPurity §1.10; matrix determinants and `RatFunc`. **Source:** Deligne II, Corollary 3.3.4, p. 206; SGA 4½, Rapport, §§3.1–3.4 and 3.6, pp. 86–88, for determinant rationality and the closed-point formula. Library target: `reciprocal_divisor_weight_le`.

### The smooth proper signed equation

For smooth proper pure-`d` `X/k`, apply WC.2 to the actual graded pairing and the canonical factors just obtained. With `b_i = deg Π_i`, `χ = Σ_i(−1)^i b_i` and `Δ` the alternating determinant, `Δ` is the same nonzero rational number for every `ℓ`, and

```text
Δ² = q^(dχ),    Z_X(1/(q^d T)) = (-1)^χ Δ T^χ Z_X(T) in ℚ(T).
```

The determinants can also be read from the highest coefficients of `Π_i`: their normalization makes this another check of `ℓ`-independence. Integer exponents handle negative `χ`. This is the WC.2 theorem on the smooth proper factor package, not a second construction of the multiplier.

`functional_equation_of_smooth_proper` in `Suggested.lean` states the signed
rational-function identity for an actual smooth proper pure-dimensional scheme.
Given its reduced normalized presentation, it reads `χ=deg V−deg U` and
characterizes `Δ` uniquely by the equation and its square. Identifying these with
the cohomological Euler characteristic and determinant is the comparison above.

*Needs:* smooth proper integral factors; WC.2 signed assembly, parity and multiplier descent; EtaleCohomologyFoundations §§F.5–F.6 and EtaleDualityAndPerverseSheaves §8.2; SchemeAndStackFoundations Layers 0–2. **Source:** Deligne I, §§2.3–2.6, pp. 281–282, with (1.5.4). Library target: `functional_equation_of_smooth_proper`.

<a id="homology-manifold-weil-assembly"></a>

### Proper rational homology manifolds

The export `WC.6/homology-manifold-weil-assembly` is implemented by
`weil_factors_of_dualizing_constant`.

Let `X/k` be proper finite type of pure dimension `d`. For every `ℓ` under consideration suppose its actual dualizing object has a **Frobenius-equivariant** isomorphism

```text
a! ℚ_ℓ ≃ ℚ_ℓ(d)[2d],    a : X → Spec k.
```

This geometric dualizing-object condition gives the rational homology-manifold form of duality. DeligneWeightsAndPurity §7.15 then gives weight `i` for constant `H^i`. WC.1 and generic extraction yield normalized integral `Π_i`, independent of `ℓ`. EtaleCohomologyFoundations §`F`.5 biduality must supply the perfect graded Frobenius pairing and its determinant reciprocity; the algebraic WC.2 assembly gives the signed functional equation with the actual `Δ` and integer `χ`.

The geometric isomorphism is the hypothesis. It is not replaced by a field asserting purity or RH. No smoothness is required once this dualizing-object contract is supplied.

*Needs:* DeligneWeightsAndPurity §7.15; EtaleCohomologyFoundations §F.5 and EtaleDualityAndPerverseSheaves §8.2 for the pairing/determinant extension; WC.1 normalized zeta; WC.3 generic extraction; WC.2 algebraic assembly; SchemeAndStackFoundations Layers 0–2. **Source:** Deligne II, §3.3.11, p. 207. Library target: `weil_factors_of_dualizing_constant`.

### Smooth proper DM stack purity

For a smooth proper finite-type DM stack over `k` with finite diagonal and `ℓ ≠ p`, its genuine finite-dimensional rational `H^i`, with geometric Frobenius, is pure of weight `i` in every complex embedding. Rational coefficients impose no restriction that `ℓ` be prime to stabilizer orders, and no global quotient presentation is a hypothesis.

Use DeligneWeightsAndPurity §8.24's `dmStack_etaleCohomology`, Frobenius-equivariant
rational coarse comparison, smooth proper duality and `dmStack_smoothProper_purity`.
Identify the supplied purity theorem with WC.1's point-mass, compact-support
and pairing adapters. The underlying purity and perfect pairing are supplied
by that section; WC.1 provides their counting and determinant compatibilities.

*Needs:* SchemeAndStackFoundations §§1.19–1.20; WC.1 stack counting and pairing adapters; DeligneWeightsAndPurity §§7.15 and 8.24 coarse comparison, duality and purity. **Source:** Bergström–Faber–Payne, proof of Proposition 3.1, published p. 1330, and proof of Proposition 4.2, p. 1331; Deligne II, §3.3.11, p. 207. van den Bogaart–Edixhoven, Lemma 3.2, p. 5, gives the coarse comparison in characteristic zero; the finite-characteristic comparison is supplied by DeligneWeightsAndPurity §8.24. Library target: `pure_cohomology_of_smooth_proper_dm_stack`.

### The rigid/crystalline comparison boundary

For smooth proper `X` over `𝔽_q`, PadicDifferentialEquationsAndRigidCohomology §RD.7 supplies the equality between its rigid/crystalline Frobenius determinants and the canonical integral degree factors. When `q = p^f`, the comparison uses the **linear** `q`-Frobenius `φ^f`, rather than comparing a `p`-semilinear map as though it were an ordinary linear endomorphism. Degreewise weight separation reuses WC.3's generic extraction after the RD trace and purity inputs.

The imported equality is an equality of characteristic polynomials with specified coefficient maps. It does not assert a universal equivalence between crystalline and ℓ-adic cohomology spaces. **Source and owner:** **PadicDifferentialEquationsAndRigidCohomology §§RD.7.1–RD.7.9**; Kedlaya, Notes on isocrystals, §§8.1–8.8 and 9.1–9.7, pp. 20–22, and §§10.1–10.3, p. 27 of arXiv v6; Fourier transforms and p-adic Weil II, published §5.3, Proposition 5.3.1, Theorem 5.3.2 and consequences (a)–(c), pp. 1445–1446 (preprint §6.6, pp. 50–52). This is the interface to that roadmap's theorem.

### Examples

Use the nonprojective toric threefold constructed in this layer alongside the empty scheme and a finite étale point. On `𝔾_m`, the degree-one compact-support root has weight zero, exercising the mixed rather than the smooth proper conclusion.

### Dependencies

*Needs:* WC.0–WC.3; DeligneWeightsAndPurity §§7.8–7.15, 8.24; EtaleCohomologyFoundations §§F.5–F.6; EtaleDualityAndPerverseSheaves §8.2; PadicDifferentialEquationsAndRigidCohomology §§RD.7.1–RD.7.9.

## Layer WC.7: Geometric calculations and the assembled theorem

The examples in this layer compare the canonical factors with independently constructed geometry. A matrix with the expected eigenvalues is a useful convention check, but the geometric application also needs a comparison identifying that matrix with Frobenius on the specified scheme. Counts over every extension use the same Frobenius operator and the all-power trace formula. The cycle and surface calculations therefore use WC.1's trace theorem and WC.5's recurrence interfaces, while purity is used to identify their canonical integral factors.

### Projective spaces

Let `n ≥ 0` and take the actual projective space `ℙⁿ/k`. The supplier's hyperplane class identifies `H^{2j}` with `ℚ_ℓ(−j)` for `0 ≤ j ≤ n`, and all odd groups vanish. Thus

```text
Π_{2j}(T) = 1 − q^j T  (0 ≤ j ≤ n),    Π_i(T) = 1 otherwise,
```

```text
Z_{ℙ^n}(T) = ∏_{j=0}^n (1 − q^j T)⁻¹,    N_r = ∑_{j=0}^n q^(jr)  (r ≥ 1).
```

The cohomology computation and its Frobenius action precede the zeta calculation. They are not reconstructed by guessing eigenvalues from the point count. For `n = 0` the answer is `1/(1 − T)`, consistent with the dimension-zero branch of WC.5. For `n = 1`, `N₁ = q + 1` and the signed multiplier is `qT²`.

*Needs:* SchemeAndStackFoundations Layers 0–2 projective-space construction; EtaleCohomologyFoundations §§0.9 and F.7, and InverseGaloisAndArithmeticFundamentalGroups §IG.0.T4; WC.6 smooth proper factors; WC.1 all-power trace formula; WC.5 recurrence interface. **Source:** Deligne I, §§1.5 and 2.5–2.6, pp. 275–276 and 281–282, specialized to these Tate classes. Library target: `degree_factors_projective_space`.

### Finite étale schemes

For finite étale `X/k`, write its finite geometric point set as disjoint Frobenius orbits of lengths `m₁,…,m_s`, each positive. Frobenius acts by the corresponding permutation on `H⁰`. Its characteristic determinant is

```text
Π₀(T) = ∏_{a=1}^s (1 − T^(m_a)),    Π_i(T) = 1  (i > 0),    N_r = ∑_{a : m_a∣r} m_a.
```

This identifies the actual canonical factor with the orbit polynomial, including multiplicities when orbit lengths coincide. For `Spec k_m` there is a single factor `1 − T^m`, and the count is `m` for `m ∣ r` and zero otherwise. Its zeros are roots of unity, as weight zero requires. Empty `X` has the empty product one and every count zero. This is the geometric factor application of the WC.0 orbit dictionary and WC.5 dimension-zero calculation.

*Needs:* SchemeAndStackFoundations Layers 0–2 finite étale schemes; WC.0 closed points; EtaleCohomologyFoundations §§F.0.2 and F.4.5; WC.1 determinant trace formula; WC.6 smooth proper factors. **Source:** Deligne I, §1.4(c)–(d), p. 275; SGA 4½, Rapport, Corollary 3.4 and Remark 3.5, pp. 87–88. Library target: `degree_factor_finite_etale_orbits`.

### Products and Künneth

Let `X,Y/k` be smooth proper, with canonical degree factors and actual Frobenius operators `F_i,G_j`. The Frobenius-equivariant Künneth isomorphism gives, for each `n`,

```text
Π_n(X ×_k Y, T) ↦ ∏_{i+j=n} det(1 − T(F_i ⊗ G_j))
```

under the specified map from `ℤ[T]` to the coefficient field. Tensor products multiply eigenvalues; direct sums multiply determinant polynomials. This formula agrees with `N_r(X × Y) = N_r(X)N_r(Y)` for every `r ≥ 1`, since traces of tensor products multiply. It does not give a product formula `Z_{X×Y} = Z_XZ_Y`.

For `ℙ¹ × ℙ¹` the degree factors are `1 − T`, `(1 − qT)²` and `1 − q²T` in degrees `0,2,4`, and one in every odd degree. Hence

```text
Z(T) = 1/((1 − T)(1 − qT)²(1 − q²T)),    N_r = (1 + q^r)².
```

*Needs:* SchemeAndStackFoundations Layers 0–2 fibre products; EtaleCohomologyFoundations §§F.4.5–F.4.6 Künneth and actions, and InverseGaloisAndArithmeticFundamentalGroups §IG.0.T4; WC.6 factors; the projective-space computation; WC.5 all-power traces and recurrences. **Source:** Deligne I, §1.5.3, pp. 275–276, with the supplier's Künneth isomorphism. Library target: `degree_factors_product_of_smooth_proper`.

### Curves and their Jacobians

Let `C/k` be smooth proper and geometrically connected of genus `g`. The curve/Jacobian realization compares the canonical `Π₁` with `det(1 − TF | H¹_et)` and with the Frobenius polynomial of its Jacobian. Then

```text
Π₀ = 1 − T,    Π₂ = 1 − qT,    deg Π₁ = 2g,    Π₁(T) = q^g T^(2g) Π₁(1/(qT)),
```

```text
N_r = 1 + q^r − S_r,    S_r = Tr(F^r | H¹),    r ≥ 1.
```

The identification with the Jacobian is a comparison of constructions, including Frobenius and Tate conventions. It imports the curve/Jacobian Betti-number theorem; coherent genus alone does not supply it. WC.5 recovers the polynomial and all `S_r` from the initial moments, and gives the recurrence and the precise pole multiplicities. None of these trace identities requires semisimplicity. The numerator comparison with WC.1 remains valid before RH is supplied; WC.6 additionally identifies the canonical integral factor and its pure reciprocal roots.

At `g = 0`, `Π₁ = 1` and `N_r = 1 + q^r`. At `g = 1`, writing `a = q + 1 − N₁` gives `Π₁ = 1 − aT + qT²` and `S_r = aS_{r−1} − qS_{r−2}`, with `S₀ = 2`. These normalizations connect the curve factor to the independent elliptic point-count carrier.

*Needs:* SchemeAndStackFoundations Layers 0–2 curves; AbelianSchemesAndArithmeticModuli §A4.4 and InverseGaloisAndArithmeticFundamentalGroups §IG.0.T1; WC.1 curve numerator; WC.6 smooth proper factors and signed equation; WC.5 recurrence and moment recovery. **Source:** Deligne I, §§1.5–1.5.4, pp. 275–276; Mustață, Remark 3.7, equations (3.8)–(3.10), p. 21. Library target: `degree_one_factor_curve`.

### Worked elliptic example over `𝔽₅`

Use the actual Weierstrass curve with `a₁ = a₂ = a₃ = a₆ = 0` and `a₄ = −1` over `𝔽₅`, giving `y² = x³ − x`. Its discriminant is 64, nonzero modulo 5, so its smooth proper completion is an elliptic curve. Take `N₁=8` as an explicit hypothesis of this zeta specialization. As a small worked Check, the affine solution counts for `x=0,1,2,3,4` are `1,1,2,2,1`, respectively. The point at infinity gives `N₁ = 8` and `a = −2`. Therefore

```text
Π₁ = 1 + 2T + 5T²,    Z_E(T) = (1 + 2T + 5T²)/((1 − T)(1 − 5T)).
```

The reciprocal roots have sum −2 and product 5. The all-extension recurrence is

```text
S₀ = 2,    S₁ = −2,    S_r = −2 S_{r−1} − 5 S_{r−2}  (r ≥ 2).
```

It gives `S₂ = −6` and `N₂ = 1 + 25 − (−6) = 32`. The specialization compares its count hypothesis with `WeierstrassCurve.pointCount_eq_card_point` and the scheme’s point dictionary. Checking the affine equation or a `2 × 2` companion matrix alone is only part of this geometric application.

*Needs:* the curve factor comparison; SchemeAndStackFoundations Layers 0–2 model and point dictionary; Mathlib `WeierstrassCurve`, `WeierstrassCurve.Δ`, and `WeierstrassCurve.Affine.Equation`; Tau Ceti `pointCount`, `pointCount_eq_card_point` and `frobeniusTrace`; WC.5 recurrence. **Source:** the elementary enumeration just given uses the specified equation, with the genus-one normalization of Mustață, Example 3.10, pp. 22–23. Library target: `zeta_weierstrass_five`.

### Worked genus-two example with negative Euler characteristic

Let `C/𝔽₂` be the smooth projective curve of the function field defined by `y² + y = x⁵`. The Artin–Schreier supplier constructs the model, proves geometric connectedness, and gives genus 2 and a single rational point at infinity. Its reduced pole order is 5, and the Artin–Schreier different and Hurwitz formula supply the genus. The affine equation is not itself the proper model.

For `k_r = 𝔽_{2^r}`, the map `y ↦ y² + y` has kernel of size two and image the trace-zero elements. Thus

```text
N_r = 1 + 2 #{x ∈ k_r : Tr_{k_r/𝔽₂}(x⁵) = 0}.
```

Take `N₁=3`, `N₂=5`, `N₃=9`, `N₄=33` as explicit hypotheses of the numerator specialization; the displayed finite-field trace formula is the small worked Check of these values. Accordingly `S₁ = S₂ = S₃ = 0` and `S₄ = −16`. Newton recovery of the degree-four numerator yields

```text
Π₁(T) = 1 + 4T⁴,    Z_C(T) = (1 + 4T⁴)/((1 − T)(1 − 2T)).
```

The Euler characteristic is `χ = 2 − 2g = −2`, and `Δ = 1/2`. The rational-function identity is

```text
Z_C(1/(2T)) = (1/2) T^(−2) Z_C(T).
```

This example exercises integer powers and reciprocal substitution. An attempted identity using a natural-valued Euler characteristic would discard its exponent. Beyond the four initial counts, the numerator supplies `S_{r+4} + 4S_r = 0` for `r ≥ 0`, with `S₀ = 4`, hence every extension count.

*Needs:* the curve factor comparison and WC.5 Newton/recurrence API; **AlgebraicCurves, Layer 10** Artin–Schreier model, reduced local invariant and different; **Layer 7** Hurwitz; **Layer 12B–12E** model/place/genus dictionary. **Source:** AlgebraicCurves Layers 7, 10 and 12; the displayed finite-field trace calculation and Newton identities determine this specialization. Library target: `zeta_artin_schreier_genus_two`.

### The sign for the projective plane

The independently realized factors of `ℙ²/k` are `1 − T`, `1 − qT` and `1 − q²T`. Thus `χ = 3`, `Δ = q³`, `d = 2` and

```text
Z_{ℙ²}(1/(q²T)) = −q³ T³ Z_{ℙ²}(T).
```

The minus sign is required. It comes from `(−1)^χ`, not from a discretionary convention for a square root of `q^{dχ}`. The factors also give `N_r = 1 + q^r + q^{2r}`; direct substitution in this rational expression checks the sign for every prime power `q`.

*Needs:* projective-space factors; WC.6 signed smooth proper equation, itself reusing WC.2; Mathlib `RatFunc`. **Source:** Deligne I, §2.6, pp. 281–282, specialized to the projective-space computation. Library target: `functional_equation_projective_plane`.

### The multiplicative group and compact support

For the actual multiplicative group `𝔾_m/k` and constant coefficients, the localization sequence for `{0} ⊂ 𝔸¹` gives `H_c¹ ≅ ℚ_ℓ` with `F = 1` and `H_c² ≅ ℚ_ℓ(−1)` with `F = q`. All other compact-support groups vanish. Hence

```text
P_{1,c} = 1 − T,    P_{2,c} = 1 − qT,    Z_{𝔾_m}(T) = (1 − T)/(1 − qT),    N_r = q^r − 1.
```

The reciprocal zero 1 has weight 0, whereas the reciprocal pole `q` has weight 2. In particular the degree-one compact-support group has weight zero. This is compatible with the mixed upper bound and illustrates why the smooth proper pure-degree rule cannot be applied to an open curve. The comparison identifies the localization realization with InverseGaloisAndArithmeticFundamentalGroups §IG.0.T4’s ordinary/compact-support example and with the arithmetic zeta expression.

*Needs:* SchemeAndStackFoundations Layers 0–2; EtaleCohomologyFoundations §§0.7, F.4.5 and InverseGaloisAndArithmeticFundamentalGroups §IG.0.T4; WC.6 mixed divisor bound; WC.5 recurrence compatibility. **Source:** SGA 4½, Rapport, §§3.1–3.2 and 3.6, pp. 86 and 88, for the compact-support determinant convention. Library target: `l_function_multiplicative_group`.

### Frobenius from base-field algebraic cycles

Let `X/k` be smooth proper, let `j ≥ 0` and `ℓ ≠ p`. Suppose the actual base-field cycle map

```text
CH^j(X) ⊗ ℚ_ℓ → H^(2j)(X_k̄, ℚ_ℓ(j))
```

is surjective. The image of every base-field cycle is Galois invariant by cycle-class equivariance. Therefore `F` is the identity on the twisted group, and is `q^j` times the identity on untwisted `H^{2j}`. This conclusion is an equality of endomorphisms, not just an equality of eigenvalue multisets.

Surjectivity from `CH^j(X_{k̄})` instead would only say that geometric cycles span. Frobenius can permute those classes. The descent to `k` in the hypothesis is what forces scalar action. This distinction remains essential in the numerical Picard applications below.

*Needs:* SchemeAndStackFoundations Layers 0–2; EtaleCohomologyFoundations §F.6 and EtaleDualityAndPerverseSheaves §1.3 and their Galois/Tate compatibilities; WC.0 Frobenius convention. **Source:** Schröer, §7 Tate-twist discussion, p. 20, and proof of Proposition 7.1, p. 21. Library target: `frobenius_scalar_of_surjective_base_cycle_map`.

### Zeta factors from algebraic cycles

Let `X/k` be smooth proper geometrically connected of dimension `d`. For a prime `ℓ ≠ p`, assume every odd `H^{2j+1}` is zero and every base-field cycle map above, for `0 ≤ j ≤ d`, is surjective. Write `b_{2j} = dim H^{2j}`. Then

```text
Π_{2j}(T) = (1 − q^j T)^(b_{2j}),    Π_{2j+1}(T) = 1,    Z_X(T) = ∏_{j=0}^d (1 − q^j T)^(−b_{2j}).
```

WC.6 identifies these polynomials with the canonical integral factors. In particular the `b_{2j}` are independent of `ℓ`, although the hypothesis may be checked at one chosen coefficient prime. The determinant calculation itself uses the scalar-action theorem and WC.1; it does not use root bounds to infer scalar action. At degree zero geometric connectedness gives `b₀ = 1`.

*Needs:* base-field scalar Frobenius; WC.1 cohomological determinant comparison; WC.6 canonical factors; SchemeAndStackFoundations Layers 0–2 actual scheme. **Source:** Schröer, Proposition 7.1 and proof, pp. 20–21. Library target: `zeta_of_surjective_base_cycles`.

### Counts over every extension from cycles

Under the preceding cycle hypotheses, for every `r ≥ 1`,

```text
N_r = ∑_{j=0}^d b_{2j} q^(jr).
```

The same base-field cycles identify `F` once; the extension theorem uses its powers `F^r`. There is no separate descent assumption for each extension. The all-power trace formula or the logarithmic derivative of the displayed zeta product gives the count, and WC.5's recurrence agrees with both. In particular `N₁ ≥ 1`, since `b₀ = 1` and all summands are nonnegative. The dimension-zero connected case gives `N_r = 1`.

*Needs:* scalar Frobenius and the cycle zeta product; WC.1 all-power trace formula; WC.5 recurrence interface; SchemeAndStackFoundations Layers 0–2 rational-point finiteness. **Source:** Schröer, Proposition 7.1 point-count conclusion and proof, pp. 20–21. Library target: `count_extension_of_surjective_base_cycles`.

### Numerical divisor descent and surface invariant comparisons

Use SchemeAndStackFoundations §5.10's numerical divisor quotient, and prove its
extension to smooth proper surfaces over finite fields by projective modification
and birational comparison. For smooth proper geometrically connected `X/k`,
construct `numericalPicardLocalSystem(X/k)` from the geometric divisor group
modulo numerical equivalence, with its continuous finite-image `G_k` action.
Its rank is `ρ`; constancy means that this action is trivial. Prove finite
rank, torsion-free quotient, base extension and pullback compatibility, and
agreement with the supplied projective numerical quotient. Construct the
rational divisor cycle comparison
`Num(X_k̄) ⊗ ℚ_ℓ → H²(X_k̄, ℚ_ℓ(1))`, prove injectivity and equality with the
usual divisor cycle map after passing to the quotient, and prove it is an
isomorphism when `ρ=b₂`. For a constant numerical local system prove that each
class is represented by a base-field divisor after a nonzero integer multiple:
use finite-field descent, norms and rational annihilation of its obstruction.
Export `numericalPicard_cycleInjection`, `numericalPicard_cycleIso_of_rank`,
`numericalPicard_baseDivisorDescent` and
`numericalPicard_baseCycleSurjective`. The last export assumes `ρ=b₂` and
constancy. (Schröer §1, pp. 4–5, especially Lemma 1.1, and §7,
pp. 19–21, especially Corollary 7.2; SchemeAndStackFoundations §§5.9–5.10.)

**Checks.**

- `ℙ²` has numerical lattice `ℤ`, trivial action and a single hyperplane class
  spanning `H²(1)`, so `ρ=b₂=1` and descent gives scalar untwisted Frobenius `q`.
- On the split quadric `ℙ¹×ℙ¹` the two ruling classes descend; on a nonsplit
  smooth quadric surface over a finite field Frobenius exchanges them. Their
  sum descends in both cases, but the nonsplit rank-two local system is not
  constant and untwisted `H²` has eigenvalues `q,−q`.
- An algebraically trivial line bundle is numerically trivial and has zero
  rational divisor cycle class. On `ℙ¹×ℙ¹`, `O(1,−1)` has zero intersection
  with `O(1,1)` but is not numerically trivial: it intersects a ruling by `±1`
  and has nonzero class `(1,−1)` in `H²(1)`. Numerical equivalence tests all
  divisor classes. When `ρ<b₂`, injectivity alone gives no surjectivity.

For a smooth proper geometrically connected surface, define `IsEnriques`
by numerical triviality of the canonical line bundle and `χ(O_X)=1`. Use the
characteristic-sensitive Picard and canonical-bundle possibilities; in
characteristic two this includes nonclassical Enriques surfaces with trivial
canonical bundle. Prove projectivity and equivalence with the numerical-canonical and `b₂=10`
Enriques convention of Schröer §4, stability under field extension, and the invariant theorem
`b₁=0`, `b₂=ρ=10`. Name these targets `enriques_characterization`,
`enriques_baseChange` and `enriques_etaleInvariants`. No classical-only
hypothesis `h¹(O_X)=0` or nontriviality of the canonical bundle is imposed.
(Schröer §4, pp. 12–13, and §7, Corollary 7.3, p. 21.)

**Checks.**

- Classical Enriques surfaces have a nontrivial canonical line bundle of order
  two; nonclassical characteristic-two Enriques surfaces may have trivial
  canonical line bundle. Both satisfy this numerical convention.
- A K3 surface has `χ(O_X)=2`, and an abelian surface has `χ(O_X)=0`; neither
  satisfies `IsEnriques` despite numerical triviality of its canonical bundle.
- Blowing up an Enriques surface gives an exceptional curve intersecting the
  canonical divisor by `−1`, so the blown-up surface fails numerical triviality.

Use NeronModelsAndSemistableAbelianVarietiesPartII §2.1's `GenusOneFibration`
and relative-minimality predicate, specialized to base `ℙ¹_k` and projective
smooth geometrically connected total surface. Retain proper flat surjectivity,
geometrically connected fibres, the regular geometrically integral generic
curve of arithmetic genus one, and absence of geometric vertical exceptional
curves of the first kind. This includes elliptic and quasi-elliptic generic
fibres, multiple fibres and absence of a section. The adapter
`genusOneFibration_modelComparison` identifies this specialization with the
supplier's model; `genusOneFibration_baseChange` reuses its base-change and
isomorphism API with proofs of preservation of these hypotheses and relative
minimality. For geometrically rational `X`, prove `b₁=0` and `b₂=ρ=10` as
`rationalGenusOne_etaleInvariants`. Use the supplier's §4.5 for the Jacobian
case; extend the invariant calculation to fibrations without a section using
`K²=0` and the blowup relation `rank Pic + K²=10`.

For every smooth projective geometrically rational surface, generalize
NeronModelsAndSemistableAbelianVarietiesPartII §5.2's rank-ten comparison to
arbitrary Picard rank: geometric Picard is a finite-rank free lattice,
`Pic⁰=0`, its Galois action has finite image, `b₁=b₃=0`, and
`Pic(X_k̄)⊗ℚ_ℓ≃H²(X_k̄,ℚ_ℓ(1))`. Name this adapter
`rationalSurface_picardEtaleComparison` and prove agreement with the supplied
`rationalSurface_cycleClass` at rank ten. Import §4.0's
`rationalSurface_commonBlowup`, `blowup_Picard_intersection` and
`rationalSurface_coherent_vanishing`, and §5.0's
`pointBlowup_ellAdicCohomology`; transport the Picard and cycle maps through
the common blowups. (Schröer §7, Corollaries 7.2–7.3 and their proofs,
pp. 20–21; Stacks, tags 0C5H, 0C5R and 0C5S for surface resolution and
factorization.)

**Checks.**

- A relatively minimal rational elliptic surface has the required invariants;
  a rational genus-one fibration without a section still satisfies the
  definition. A chosen section cannot be part of its data.
- In characteristics two and three a quasi-elliptic fibration has a singular
  geometric generic fibre of arithmetic genus one. A definition requiring
  smoothness of that fibre would exclude this case.
- Blowing up a point on a fibre introduces a vertical exceptional curve and
  fails relative minimality. Meanwhile `ℙ²` has Picard rank one, so geometric
  rationality alone does not imply the ten-class conclusion.

*Needs:* NeronModelsAndSemistableAbelianVarietiesPartII §§2.1, 4.0, 4.5 and
5.0–5.2 for the genus-one carrier, common surface blowups, Picard and
cohomology comparisons; SchemeAndStackFoundations §§3.1–3.4, 4.11–4.12,
5.9–5.10 for Picard, blowups, intersections and numerical divisors; EtaleCohomologyFoundations
§§`F`.5–`F`.7 for divisor cycles and blowup cohomology. These surface targets
precede the constant-numerical-Picard and ten-class consequences below.

### Surfaces with constant numerical Picard group

Let `X/k` be smooth proper geometrically connected of dimension two. Assume `b₁ = 0`, `b₂ = ρ(X_{k̄})`, and the étale numerical Picard local system `Num_{X/k}` is constant. Here `ρ` is the rank of the geometric numerical divisor lattice. The numerical divisor descent target above provides two geometric comparisons: the injection of the rational numerical divisor space into `H²(1)`, which becomes an isomorphism when `b₂ = ρ`; and descent of numerical divisor classes to base-field cycles after multiplication by nonzero integers. Over a finite field the relevant descent obstruction vanishes or is killed by rationalization. These inputs turn constancy of `Num` into surjectivity of the base-field codimension-one cycle map.

Duality gives `b₃ = b₁ = 0`. Geometric connectedness and the fundamental class identify the endpoint groups. The result is

```text
Π₀ = 1 − T,    Π₂ = (1 − qT)^(b₂),    Π₄ = 1 − q²T,    Π₁ = Π₃ = 1,
```

```text
Z_X(T) = 1/((1 − T)(1 − qT)^(b₂)(1 − q²T)),    N_r = 1 + b₂ q^r + q^(2r)  (r ≥ 1).
```

The statement allows nonprime `q`; `N₁` is the count over `k`, not a count over its prime subfield. Its mere-proper formulation requires the numerical divisor comparison in that generality. A projective Hodge-index theorem can be used only after projectivity is proved, or through the proper-surface comparison just specified.

*Needs:* cycle zeta product and all-extension count; EtaleCohomologyFoundations §§F.5–F.6; EtaleCohomologyFoundations §F.6 and EtaleDualityAndPerverseSheaves §1.3; SchemeAndStackFoundations §§5.9–5.11 surface intersections; WC.7 numerical divisor descent for the specified lattice comparison and base-defined divisor descent. **Source:** Schröer, Corollary 7.2 and proof, p. 21, with the divisor-cycle discussion on pp. 19–20. Library target: `count_surface_of_constant_num`.

### Twenty-five points over `𝔽₂`

Let `X/k` be either an Enriques surface or a smooth projective geometrically rational surface equipped with a relatively minimal genus-one fibration `X → ℙ¹`. Suppose the numerical Picard local system is constant. The surface invariant targets above prove `b₁=0` and `b₂=ρ=10` for these cases, with the characteristic-sensitive Enriques and genus-one-fibration definitions. The preceding theorem gives

```text
Z_X(T) = 1/((1 − T)(1 − qT)^10(1 − q²T)),    N_r = 1 + 10 q^r + q^(2r)  (r ≥ 1).
```

For `k = 𝔽₂`, `N₁ = 25` and `N₂ = 57`. A genus-one fibration need not have a section, so none is added. In the second case both geometric rationality and relative minimality are retained; their role is to supply the stated invariants, and they are not discarded merely because the final numerical expression is simple.

*Needs:* the constant-Num surface theorem; WC.7 Enriques and rational genus-one invariant comparisons and numerical divisor descent. **Source:** Schröer, Corollary 7.3 and proof, p. 21. Library target: `count_enriques_or_rational_genus_one`.

### A maximal-count criterion for rational surfaces

Let `X/k` be a smooth projective geometrically rational surface and put `ρ = rank Pic(X_{k̄})`. The rational-surface comparison target above identifies `Pic(X_{k̄})` as a finite-rank free lattice with `Pic⁰ = 0`, identifies `Pic ⊗ ℚ_ℓ` with `H²(1)`, and proves that the Galois action has finite image. Then

```text
Pic_{X/k} is constant ↔ N₁ = 1 + ρ q + q².
```

For the forward implication the lattice classes descend rationally, so scalar Frobenius gives the count. For the converse let `A` be Frobenius on the twisted Picard space. The trace formula gives `N₁ = 1 + q Tr(A) + q²`. Since `A` has finite order, its complex eigenvalues are roots of unity. Equality `Tr(A) = ρ` forces the real part of every eigenvalue to be one, hence every eigenvalue is one. Finite order in characteristic zero then makes `A` the identity, and faithfulness of rationalization for a free lattice gives the identity on `Pic`. Continuity and the procyclic finite-field Galois group give constancy of the étale local system.

The freeness, `Pic⁰ = 0` and finite-order hypotheses are supplied by geometric rationality. This argument does not provide a criterion for arbitrary Picard schemes with a positive-dimensional `Pic⁰` or torsion. It is a consequence of the surface trace comparison and the finite lattice action.
At `ρ=10` it agrees with NeronModelsAndSemistableAbelianVarietiesPartII §5.2's
Picard-constancy criterion, using the same cycle-class map.

*Needs:* NeronModelsAndSemistableAbelianVarietiesPartII §§4.0, 5.0–5.2 common blowups, Picard/cohomology and rank-ten criterion; SchemeAndStackFoundations Layers 0–2 actual rational surface; SchemeAndStackFoundations §§5.9–5.11 surface comparison; EtaleCohomologyFoundations §§F.5–F.6 and EtaleCohomologyFoundations §F.6 and EtaleDualityAndPerverseSheaves §1.3; WC.1 trace and WC.5 finite-spectrum compatibility; WC.7 rational-surface Picard/étale comparison and finite-order action. **Source:** Schröer, §7 and Corollary 7.2, pp. 19–21; the reverse implication is the finite-order trace argument above. Library target: `constant_picard_iff_maximal_count_rational_surface`.

### The smooth proper endpoint

For an actual smooth proper geometrically connected `X/k` of pure dimension `d`, the arithmetic point-count series has a normalized rational representative `Z_X ∈ ℚ(T)` and canonical polynomials `Π_i ∈ ℤ[T]`. The interfaces assembled here give:

* The Euler product and exponential series agree with the expansion of `Z_X` at zero, with constant term one.
* For every prime `ℓ ≠ p`, `Π_i` maps to `det(1 − TF | H^i(X_{k̄},ℚ_ℓ))`. Its degree is the cohomology dimension, independently of `ℓ`, and it is one outside `0 ≤ i ≤ 2d`.
* Every reciprocal root `α` of `Π_i` is algebraic integral, and every complex embedding satisfies `|σ(α)| = q^{i/2}`.
* `Z_X = ∏_i Π_i^{(−1)^{i+1}}` and, for every `r ≥ 1`, `N_r = Σ_i(−1)^i Tr(F^r | H^i)`.
* With integer `χ = Σ_i(−1)^i deg Π_i` and the actual rational nonzero determinant multiplier `Δ`, `Δ² = q^{dχ}` and `Z_X(1/(q^dT)) = (−1)^χ ΔT^χ Z_X(T)`.

The endpoint assembles the individual comparisons rather than using any one conclusion as a field of an input structure. It makes no semisimplicity assumption. Betti numbers of a complex fibre are additionally compared only when the actual smooth proper family and path of WC.4 are supplied. An arbitrary finite-field scheme is not asserted to lift to characteristic zero. For mixed sheaves the separate reciprocal-divisor upper-weight theorem remains the available export; individual integral pure-degree factors are not inferred from it.

Applications can consume a single interface—such as the all-power trace formula for a recurrence—without importing every part of the endpoint. The dimension-zero and negative-Euler-characteristic examples test the edges of the signed equation, while the open-curve example tests the distinction between degree and weight.

*Needs:* WC.0 actual point/Frobenius comparisons; WC.1 arithmetic zeta, normalized rationality and all-power trace formula; WC.2 signed determinant assembly; WC.3 generic factor extraction; WC.4 supplied-family comparison; WC.5 numerical/recurrence interfaces; WC.6 smooth proper factors and mixed divisor bound; SchemeAndStackFoundations Layers 0–2; DeligneWeightsAndPurity §7.15. **Source:** Deligne II, Corollary 3.3.9 and §3.3.11, p. 207; Deligne I, §§1.4–1.7 and 2.2–2.6, pp. 274–277 and 280–282; InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T3–IG.0.T4. Library target: `weil_conclusions_of_smooth_proper`.

### Examples

The elliptic and genus-two specializations above use their initial counts as explicit hypotheses and apply the geometric factor/recurrence comparisons. The ten-class surface formula gives `25` and `57` over `𝔽₂` and `𝔽₄`; the nonsplit-quadric Check prevents geometric spanning from being mistaken for base-field descent.

### Dependencies

*Needs:* WC.0–WC.6; NeronModelsAndSemistableAbelianVarietiesPartII §§2.1, 4.0, 4.5, 5.0–5.2; SchemeAndStackFoundations §§3–5; AlgebraicCurves Layers 7, 10, 12; InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T4; EtaleCohomologyFoundations §§F.5–F.7; EtaleDualityAndPerverseSheaves §1.3.

## References and the interfaces they support

The locators above refer to printed pagination unless a particular arXiv version is specified. Statements and constructions in this roadmap use the following primary sources and supplier specifications.

* **Pierre Deligne, La conjecture de Weil. I**, Publications Mathématiques de l'IHÉS **43** (1974), 273–307. [Freely readable article](https://www.numdam.org/item/PMIHES_1974__43__273_0/). §§1.1–1.7, pp. 273–277, give the point, series and factor conventions; §§2.2–2.6, pp. 280–282, give the signed duality calculation; Theorem 8.1 and proof, pp. 301–302, give the complete-intersection estimate. The proof of projective purity is consumed through DeligneWeightsAndPurity §§4.3–4.4.
* **Pierre Deligne, La conjecture de Weil. II**, Publications Mathématiques de l'IHÉS **52** (1980), 137–252. [Freely readable article](https://www.numdam.org/item/PMIHES_1980__52__137_0/). Corollary 3.3.4, p. 206, and §§3.3.7–3.3.11, pp. 206–207, supply the mixed bounds and smooth proper/homology-manifold applications through DeligneWeightsAndPurity §7.15.
* **Pierre Deligne, Cohomologie étale (SGA 4½)**, Lecture Notes in Mathematics **569** (1977), exposé *Rapport sur la formule des traces*. [Freely readable volume](https://publications.ias.edu/sites/default/files/Number32.pdf). §§3.1–3.4 and 3.6, pp. 86–88, fix the determinant, trace, closed-point and compact-support formulas. The general trace theorem remains with InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T4.
* **J. S. Milne, Lectures on Étale Cohomology**, version 2.21, 22 March 2013. [Author's course notes](https://www.jmilne.org/math/CourseNotes/LEC.pdf). Theorems 20.2–20.5, pp. 127–129, and Theorem 21.1, p. 130, are the base-change, lifting and complex-comparison sources; §27, pp. 155–160, gives the finite-spectrum, descent, local integrality and functional-equation arguments used here.
* **Mircea Mustață, Zeta functions in algebraic geometry**, §3.3, Theorem 3.6 through Example 3.10, pp. 21–23. [Author's notes](https://public.websites.umich.edu/~mmustata/zeta_book.pdf). These provide the independent surface-intersection proof of curve bounds and the all-power root-bound argument.
* **Theo van den Bogaart and Bas Edixhoven, Algebraic stacks whose number of points over finite fields is a polynomial**, arXiv:math/0505178v3. [Freely readable preprint](https://arxiv.org/abs/math/0505178). Theorem 2.1, p. 3, smooth proper stack comparison in §3, pp. 4–6, Lemma 4.1, pp. 6–7, and Lemma 4.2 and the proof in §4, pp. 8–10, support the polynomial-count and Tate consequences.
* **Jonas Bergström, Carel Faber and Sam Payne, Polynomial point counts and odd cohomology vanishing on moduli spaces of stable curves**, Annals of Mathematics **199** (2024), 1323–1365. [Authors' freely readable published text](https://web.ma.utexas.edu/users/sampayne/pdf/PolynomialPointCounts.pdf); [arXiv:2206.07759](https://arxiv.org/abs/2206.07759). Proposition 1.3, pp. 1324–1325, concerns stack counts; Proposition 3.1, p. 1330, supplies the local cutoff; §7, pp. 1336–1339, supplies signed configurations, inverse zeta and the sieve; §§9.1–9.2, pp. 1351–1352, supply twists and equivariant polynomial counts. This roadmap uses those general counting results, not a new plan for the moduli spaces treated in the paper.
* **Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe**, arXiv:1807.04659v5, Appendix C, pp. 79–81, especially the unnumbered finite-spectrum lemma on p. 81. [Freely readable preprint](https://arxiv.org/abs/1807.04659). The finite-spectrum layer develops its numerical mechanism with explicit weights and cancellation; the other arguments about automorphic forms and moduli in that paper belong to their respective owners.
* **Osamu Fujino and Hiroshi Sato, On non-projective complete toric varieties**, version 0.27, 12 July 2025, Example 4.1, pp. 7–8. [Authors’ text](https://www.math.kyoto-u.ac.jp/~fujino/toric-projectivity11.pdf). **William Fulton, Introduction to Toric Varieties**, Annals of Mathematics Studies 131, §5.2. These specify the nonprojective fan and the Chow and complex cohomology inputs in WC.6.
  **William Fulton and Bernd Sturmfels, Intersection theory on toric varieties**,
  arXiv:alg-geom/9403002, Proposition 1.1 and equation (1.1), pp. 4–5.
  [Freely readable preprint](https://arxiv.org/abs/alg-geom/9403002). Its invariant-cycle
  generators and character relations underlie the specified Chow presentation.
* **Stefan Schröer, There is no Enriques surface over the integers**, arXiv:2004.07025v3, §7, pp. 19–21, especially Proposition 7.1 and Corollaries 7.2–7.3. [Freely readable preprint](https://arxiv.org/abs/2004.07025). These are the cycle, numerical Picard and explicit surface point-count applications. WC.7 constructs the numerical-divisor descent and surface invariant comparisons used in these applications.
* **Kiran S. Kedlaya, Notes on isocrystals**, arXiv:1606.01321v6, §§8.1–8.8 and 9.1–9.7, pp. 20–22, and §§10.1–10.3, p. 27. [Freely readable preprint](https://arxiv.org/abs/1606.01321). **Fourier transforms and p-adic “Weil II”**, Compositio Mathematica **142** (2006), 1426–1450, Proposition 5.3.1, Theorem 5.3.2 and the ensuing consequences, pp. 1445–1446. [Published article](https://doi.org/10.1112/S0010437X06002338); [freely readable preprint](https://arxiv.org/abs/math/0210149). These support the rigid/crystalline interface imported from PadicDifferentialEquationsAndRigidCohomology §RD.7.
* **AlgebraicCurves**, [Layers 7, 10 and 12](../AlgebraicCurves/README.md), supplies the function-field/model/genus interfaces for the Artin–Schreier example.
