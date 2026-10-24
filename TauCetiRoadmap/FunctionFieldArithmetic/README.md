# Roadmap: function field arithmetic — algebraic curves, Part II

**Summary.** This roadmap continues
[AlgebraicCurves](../AlgebraicCurves/README.md) at the point where that roadmap stops: function
fields of one variable whose exact constant field is a finite field `𝔽_q`. It fixes the degree,
sign and Frobenius conventions that every finite-constant-field statement depends on, and then
builds the following arithmetic that no other roadmap owns: the Riemann–Roch spaces of a finite
extension of `𝔽_q(t)` described by reduced bases of a pair of lattices (Hess); the volumes of
divisor lattices and the Fourier transforms of their indicators in the completed adeles, for the
self-dual measure of a rational differential; Artin–Schreier–Witt theory, with reduced Witt–Laurent
representatives and the conductor formula of Kosters–Wan; equal-characteristic local class field
theory through Lubin–Tate formal modules, including the `p`-primary existence theorem that the
Tau Ceti ClassFieldTheory roadmap leaves out, the Schmid–Witt symbol, and the perfect-field universal property of generalized Picard
schemes, with the finite-abelian-group extension of the supplied Lang-cover realization; the zeta function of a
function field built from effective divisors, its Riemann–Roch rationality and functional
equation, the identity `L(1) = h`, and the recovery of the `L`-polynomial from the first `g`
point counts; the finite-coefficient `L`-function of a local system on a curve; automorphic
functions with integral coefficients on a reductive group over a function field, their constant
terms, Harder's finiteness theorem and Yu's degree-zero nonvanishing; and the unitary
Siegel–Eisenstein series of Feng–Yun–Zhang with the formula for its nonsingular Fourier
coefficients. The end theorems are the rationality theorem for the zeta function (§5.3), local
abelian existence in equal characteristic (§4.2), finite ray-cover classification with least
conductors (§4.10), Harder's finiteness theorem with integral
coefficients (§6.4–§6.5) and the Feng–Yun–Zhang coefficient formula (§7.6).

## Scope and ownership

AlgebraicCurves owns places, divisors, `L(D)`, Weil differentials and Riemann–Roch, completions
and local expansions at a place, extensions of function fields with their ramification, the
different and Riemann–Hurwitz, constant-field extensions, Kummer and Artin–Schreier covers with
their genus formulas, and the curve/function-field dictionary. Its scope section names zeta
functions and the arithmetic of finite constant fields as the subject of a separate roadmap that
consumes it; this is that roadmap. The divisor-degree formula and product formula are
consumed from `TauCeti.Divisor.degree` and `TauCeti.Divisor.degree_principal`; the
chosen-generator comparison with Mathlib's `FunctionField` is AlgebraicCurves Layer 0.
Neither is a separate target here.
It starts from AlgebraicCurves Layers 0–12 and the finiteness of `Cl⁰(F)` over a finite constant
field (AlgebraicCurves Layer 5; Stichtenoth, §5.1, Definition 5.1.2 and Proposition 5.1.3,
p. 186), and plans nothing those layers state. In particular, finite
exact constants are supplied by `TauCeti.IsFunctionField.finiteDimensional_algebraicClosure`,
`TauCeti.isIntegrallyClosedIn_algebraicClosure` and `TauCeti.IsFunctionField.algebraicClosure`
in `TauCeti/FieldTheory/FunctionField/ConstantField.lean`. For example, the exact constants of
`𝔽_q(t)` are `𝔽_q`, whereas `𝔽_{q²}(t)` viewed over `𝔽_q` has `dim_{𝔽_q} L(0) = 2` and must
be viewed over `𝔽_{q²}` for the geometrically connected curve dictionary. Constant extensions,
including the perfect-field hypotheses and the inseparable genus-drop warning, are consumed from
AlgebraicCurves Layer 8. The one-pole Artin–Schreier genus and different are also supplied there
(Layer 10), implemented by
`TauCeti.two_mul_genus_eq_of_exists_reduced_artinSchreier_pole_ratFunc` in
`TauCeti/FieldTheory/FunctionField/ArtinSchreier/Genus.lean`; §3.3 adds the comparison with Witt
classes and their localization maps.

This roadmap owns:

- the conventions for finite exact constants, valuation and idele degrees, and arithmetic
  versus geometric Frobenius (Layer 0);
- the reduced-basis description of `L(D)` relative to a polynomial subring `k[x] ⊆ F` (Layer 1);
- divisor lattices in the completed adeles, the self-dual measure of a rational differential and
  the Fourier transforms of lattice indicators (Layer 2);
- Artin–Schreier–Witt theory of fields of characteristic `p`, reduced representatives over
  `k((T))` and the conductor formula (Layer 3);
- Lubin–Tate formal modules in equal characteristic, `p`-primary local existence, local
  Kronecker–Weber and injectivity of the local Artin map in equal characteristic, and the
  Schmid–Witt symbol; the additional scheme and structure assertions for rigidified Picard
  spaces, Rosenlicht's perfect-field universal property at a fixed modulus, and the extension
  of the supplied rank-one Lang-cover dictionary to arbitrary finite abelian groups (Layer 4);
- the zeta function and `L`-polynomial of a function field over `𝔽_q`, their Riemann–Roch
  properties, their comparison with the scheme-theoretic zeta function, recovery from `g` point
  counts, finite-coefficient `L`-functions of local systems, and quantitative degree-sensitive
  Chebotarev with the constant-field congruence (Layer 5);
- adelic points of affine groups over a function field, automorphic function modules with
  coefficients in a `ℤ[1/p]`-algebra, constant terms, cusp modules, Harder's finiteness theorem,
  integral coefficient models, the global unramified Hecke action and Yu's degree-zero
  nonvanishing (Layer 6);
- inducing characters with their unramified obstruction and finite ramification, unitary
  Eisenstein continuation from all parabolics and discrete data, the Siegel series and its
  Hermitian Fourier coefficients, split Hermitian local densities, the local Whittaker–density
  identity and the Feng–Yun–Zhang global coefficient formula (Layer 7).

It leaves the following to the roadmaps that state them, and states none of them again:

- **ArithmeticGaloisDuality**, §R02.3.2, *Function-field places, ideles and `S`-units*: the
  idele group `GlobalFunctionField.ideles F`, the idele class group `ideleClassGroup F`, the
  degree `ideleDegree`, F. K. Schmidt's theorem `ideleDegree_surjective`, compactness of the
  degree-zero idele classes and the splitting `ideleClassGroup F ≅ ker(deg) × ℤ`, `S`-units and
  `S`-class groups; *The class formation of a global function field*: the Brauer sequence, the
  class formation, the reciprocity isomorphisms `C_F/N_{L/F}C_L ≅ Gal(L/F)^ab` compatible with
  local reciprocity, the description of norm groups as the open subgroups of finite index, and the
  `S`-version with cokernel `Ẑ/ℤ`.
- **AutomorphicLFunctionsAndLocalFactors**, Layer AL.3: *Curve additive analysis* (the
  completion-valued adeles `𝔸_K` with their topology, the identification of `𝔸_Kˣ` with the
  ideles above, the valuation-divisor map with kernel `∏_v O_vˣ` and quotient `Pic(X)`, the
  discrete cocompact diagonal with quotient volume `q^(g−1)` for local integral volume one, the
  residue character of a differential with its conductor, self-dual measures and Poisson
  summation); *Rank-one unramified reciprocity* (the zero-modulus Picard and Lang-cover
  comparison, including the constant-field direction); *Ramified rank-one curve reciprocity*
  (the finite-field generalized Picard objects for every effective modulus, ray-class
  comparison, Abel and Lang maps, finite-cover comparison and rank-one character dictionary
  with least conductor); *The `GL(n)`
  cuspidal Fourier expansion*, *Global Whittaker factorization* and *Spherical Whittaker normalization
  at nonzero conductor*; and *Function-field local factors, multiplicity one and converse theorem*.
- **ArithmeticGaloisRepresentations**: §2.5 *Local factors* (`GaloisRep.localEulerFactor` on
  inertia invariants, for any coefficient field); §3.7 *Artin–Schreier characters* (break `m`,
  Swan conductor `m`, Artin conductor `m + 1`, different exponent `(p − 1)(m + 1)`); §5.13
  *Function fields over finite fields* (restricted-ramification groups and Frobenius, the curve
  point-counting input, Chebotarev for function fields including enlarged constant fields,
  profinite Frobenius density and recognition of semisimple representations by Frobenius
  characteristic polynomials); §1.8 Brauer–Nesbitt.
- **DeligneWeightsAndPurity**: §1.6 (the Weil estimate for curves through the Jacobian and
  `Z(C, t) = P^rev_{π_J}(t)/((1 − t)(1 − qt))`) and §1.9 (base extension).
  Its §3.7 supplies `finiteCover_degreeChebotarev`, including the prescribed
  constant-field Frobenius coset; §5.8 adds an explicit error estimate and compares it
  with that supplied asymptotic statement.
- **WeilConjectures**: WC.1 *A curve numerator before root bounds*
  (`curve_zeta_numerator_without_rh`) and WC.5 *Recurrences and Newton recovery*
  (`extension_count_recurrence`).
- **SchemeAndStackFoundations**: §2.16 *Tsen's theorem*, §3.3 *Vector bundles and duality on
  curves*, §3.6 *Picard schemes and Picard torsors of a curve without a rational point*, and
  §5.11 *Weil bound via surfaces*.
- **AutomorphicSpectralTheory**: §§1.11–1.13 (function-field `GLₙ` character tori, spherical
  sections and induction normalization), §§2.15–2.16 (intertwiners), §§4.11–4.17
  (discrete and residual data). These are its everywhere-unramified `GLₙ` branch; they do not
  supply the unitary-group Eisenstein theory of Layer 7.
- **LubinTateFormalModulesAndQuasiCanonicalLifts**, LT.0 *Formal modules, coordinates and
  complete points*: formal homomorphisms, tangent-compatible coefficient actions and
  evaluated adic points. Its LT.1–LT.2 supply the mixed-characteristic Lubin–Tate
  construction, torsion and arithmetic Artin comparison. Section 4.1 extends that
  construction to equal characteristic using the same formal-module carriers.
- **ClassFieldTheory** (Tau Ceti): class formations and Tate's theorem (Layers 1–4), local
  invariants (Layer 5), the local class formation and reciprocity (Layers 6–7) and the
  prime-to-`p` local existence theorem of Layer 8. Its scope section excludes Lubin–Tate theory,
  Artin–Schreier–Witt theory and `p`-primary existence in equal characteristic; those are
  Layers 3–4 here.
- **LocalFieldsRamification** (Tau Ceti), Layer 3: lower and upper numbering, Herbrand functions
  and Hasse–Arf.
- **ReductiveGroupsPartII**: §RG2.3.7 Lang's theorem, Layer RG2.4 Iwasawa and Cartan
  decompositions. **SmoothRepresentationsOfLocalGroups**: §SR.4.1 the Satake transform and
  isomorphism, §SR.4.4 unramified unitary groups. **AdelicAlgebraicGroups**: Layer AA.0
  restricted products of Haar measures (stated for countable families of second countable
  locally compact groups, so it applies to function fields unchanged).
- **GeometryOfNumbersAndQuadraticArithmetic**, §3.2: Hermitian local densities, the normalized
  Siegel polynomial and the Cho–Yamauchi overlattice formula over an unramified quadratic field
  extension of a nonarchimedean local field of characteristic other than two.

The adelic points of an affine group over a function field (§6.1) are built here because
AdelicAlgebraicGroups Layer 1 is written for number fields only. The split and inert equal-characteristic-two cases of Hermitian
local density (§7.4) are built here because GeometryOfNumbersAndQuadraticArithmetic §3.2
supplies the inert case over base fields of characteristic different from two, including
dyadic residue fields.

RelativeJacobiansAndIntegralCurveModels §§1.3–1.5 supplies the finite-flat rigidified
Picard sheaf, unit sequence, smooth representing algebraic space and universal rigidified
family. Section 4.6 specializes these objects to perfect-field curves and proves their
additional scheme and structure assertions; §4.7 proves Rosenlicht's fixed-modulus
universal property over every perfect field. AutomorphicLFunctionsAndLocalFactors AL.3,
*Ramified rank-one curve reciprocity*, supplies the finite-field generalized Picard objects,
ray-class comparison, Abel and Lang maps and finite-character dictionary with least modulus.
Sections 4.5 and 4.8–4.10 consume those constructions, specify coordinate conventions and
extend the rank-one dictionary to arbitrary finite abelian groups. ArithmeticGaloisDuality
§R02.3.2 supplies the compatible finite Artin maps and constant-field projection.

## Conventions

For the global arithmetic, `k = 𝔽_q` is a finite field of characteristic `p`, `F` is a field with
`[Algebra k F]`, `hF : TauCeti.IsFunctionField k F` is passed explicitly, and
`IsIntegrallyClosedIn k F` holds (the constants are exact, as in Rosen, Chapter 5, p. 46).
The broader settings of Layers 1,
3 and 4 are stated there. Equivalently (AlgebraicCurves
Layer 12) `F = k(X)` for a smooth projective geometrically connected curve `X/k`; `g` is
`TauCeti.genus k F`, and `h = TauCeti.Divisor.classNumber hF = #Cl⁰(F)`.

- **Places and degrees.** A place `v` is a `TauCeti.Place k F`; `π_v` is a uniformizer,
  `ord_v(π_v) = 1`, `κ(v)` is the residue field, `d_v = deg v = [κ(v) : k]` and
  `q_v = q^(d_v)`. The divisor degree is `TauCeti.Divisor.degree D = Σ_v D_v d_v`. For `x ≠ 0`, the normalized
  absolute value is `|x|_v = q^(−d_v ord_v x)`, and `|0|_v = 0`. Minima of additive
  valuations use extended value `∞` at zero; they do not use the native total additive
  order's junk value at zero.
- **Two degrees of an idele.** The valuation degree of an idele `a` is
  `deg a = Σ_v d_v ord_v(a_v)`; this is ArithmeticGaloisDuality's `ideleDegree`. Yu's degree is its
  negative, `deg_Yu a = −deg a`, so that `|a| = q^(deg_Yu a)`. For `GL_n` the determinant degree
  of `a·1_n` is `n · deg a`. Every statement below says which degree it uses; Layer 6.7 uses Yu's.
- **Frobenius.** The arithmetic Frobenius `φ_v` acts on an algebraic closure of `κ(v)` by
  `x ↦ x^(q_v)`; the geometric
  Frobenius is `Fr_v = φ_v⁻¹`. Local reciprocity is normalized as in ClassFieldTheory Layer 7: a
  uniformizer acts on unramified extensions by `φ_v`. Euler factors, étale cohomology and the
  Satake parameter use `Fr_v`. Yoshida's local class field theory (Layer 4) uses the geometric
  normalization and is translated by one inversion.
- **Zeta variable.** `T = q^(−s)` for `F/𝔽_q`; a place of degree `d` contributes through `T^d`.
- **Witt vectors.** `W(F)` and `W_n(F)` are Mathlib's `WittVector p F` and
  `TruncatedWittVector p n F`, with the Witt ring structure; `Frob` is `WittVector.frobenius`, and
  `℘ = Frob − id`.
- **Coefficients.** In Layers 6–7, `R` is a commutative ring in which `p` is invertible; complex
  statements specialize `R = ℂ`.
- **Universes and total definitions.** Fields may lie in independent universes; finite groups,
  divisors and coefficient modules use their native carriers. The counting definitions use
  `Nat.card` on every input; their arithmetic interpretation requires the finite exact-constant
  hypotheses of Layer 5. In particular `pointCount 0 = 0`, since `Nat.divisors 0` is empty.
  Fractions in `T` are identities of rational functions, and formal Euler factors are inverted
  only when their constant coefficient is a unit. A finite field has `q ≥ 2`, so `q−1 ≠ 0`.

## Exact supplier contracts

### From Mathlib

`WittVector`, `WittVector.frobenius`, `WittVector.verschiebung`, `WittVector.truncate`,
`TruncatedWittVector`; `PowerSeries`, `Polynomial`, `Polynomial.reverse`; `RestrictedProduct`
and `RestrictedProduct.unitsEquiv`; `Valuation.Completion`; `LaurentSeries` and
`LaurentSeries.ratfuncAdicComplRingEquiv`; `FormalGroup` (one-dimensional formal group laws;
commutativity is a separate hypothesis); `Field.absoluteGaloisGroup`; `IsIntegrallyClosedIn`,
`algebraicClosure`; `MeasureTheory.Measure.haar`; `Algebra.trace_surjective`
(`Mathlib/RingTheory/Trace/Basic.lean`, for a finite-dimensional separable field extension).

### From Tau Ceti

`TauCeti.IsFunctionField` (an explicit proposition, not a class);
`TauCeti.IsFunctionField.finiteDimensional_algebraicClosure`,
`TauCeti.isIntegrallyClosedIn_algebraicClosure`, `TauCeti.IsFunctionField.algebraicClosure` and
`TauCeti.IsFunctionField.exists_intermediateField_isIntegrallyClosedIn` (passage to finite exact
constants); `TauCeti.Place`, `TauCeti.Place.degree`, `TauCeti.Place.one_le_degree_of_isFunctionField`;
`TauCeti.Divisor := WeilDivisor (Place k F)`, `TauCeti.Divisor.degree`,
`TauCeti.Divisor.principal`, `TauCeti.Divisor.degree_principal`, `TauCeti.Divisor.dim`;
`TauCeti.Divisor.degree_eq_zero_iff` (`TauCeti/FieldTheory/FunctionField/Divisor/Basic.lean`,
for an effective divisor and an explicit function-field hypothesis);
`TauCeti.riemannRochSpace`; `TauCeti.genus`; `TauCeti.Divisor.finite_setOf_isEffective_degree_le`,
`TauCeti.Divisor.finite_ker_degreeClass`, `TauCeti.Divisor.classNumber`,
`TauCeti.Divisor.classNumber_pos`; `TauCeti.weilDifferentialSpace`,
`TauCeti.degree_weilDifferentialDivisor` (a nonzero Weil differential over exact constants has
divisor degree `2g − 2`); `TauCeti.ReductiveAffineGroupSchemeCat` and `TauCeti.AlgHom.instGroup`
(convolution points of a Hopf algebra form a group). Tau Ceti also has
`TauCeti.Place.Completion := P.valuation.Completion` with `completionEmbedding` and
`completionIntegersEquivPowerSeries` at a rational place, the AlgebraicCurves Layer 5 and 9
completion and expansion targets; this roadmap uses those names.

### From TauCetiRoadmap.AlgebraicCurves

AlgebraicCurves Layers 0–12 provide intrinsic function fields and the chosen-generator
comparison, finite normalization over both rational charts, divisors and Riemann–Roch,
finite degree-zero classes, completion and expansion maps, ramification and the different,
constant extensions, one-pole Artin–Schreier genus and the curve/function-field dictionary.
Layer 1 uses finite normalization without a separability assumption; all geometrically
connected finite-field statements use exact constants.

### From TauCetiRoadmap.ArithmeticGaloisDuality

ArithmeticGaloisDuality §R02.3.2 states its function-field results for Mathlib's
`FunctionField 𝔽_q F` with `𝔽_q` algebraically closed in `F`. AlgebraicCurves Layer 0's
chosen-generator comparison transports this contract to the intrinsic
`TauCeti.IsFunctionField` setting.
Its compatible finite Artin quotients give the dense reciprocity map
`C_F → Gal(F^ab/F)` and the isomorphism from the profinite completion of `C_F` onto that
Galois group. The constant-field projection is arithmetic Frobenius to the valuation degree;
equivalently it is inverse Frobenius to Yu's degree. The discrete `ℤ` degree direction is
completed to `ℤ̂`, so the uncompleted idele class group is not itself profinite.

### From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors

AutomorphicLFunctionsAndLocalFactors AL.3 constructs the completed adeles `𝔸_K`, the residue
character `ψ_ω(a) = ψ₀(Σ_v Tr_{κ(v)/k} res_v(a_v ω))` of a nonzero rational differential `ω`
and a nontrivial `ψ₀ : 𝔽_q → ℂˣ`, the conductor exponent `n_v = ord_v(ω)` (triviality on
`π_v^(−n_v) O_v`, nontriviality on `π_v^(−n_v−1) O_v`), self-dual measures and Poisson
summation. Layer 2 uses exactly these objects. Its *Ramified rank-one curve reciprocity*
supplies the finite-field objects and comparisons consumed in §§4.5 and 4.8–4.10,
including every positive modulus. Its convention is `χ(a)=ρ(Art_ar(a)⁻¹)` for a
rank-one local system; the deck action on a Lang torsor below instead records
arithmetic Artin itself, so passing to that local system inverts the character.

### From TauCetiRoadmap.ArithmeticGaloisRepresentations

ArithmeticGaloisRepresentations §2.5 defines `GaloisRep.localEulerFactor` as
`det(1 − X ρ(Fr) | V^{ρ(I)})` for any coefficient field, independent of the lift of `Fr`;
Layer 5.7 substitutes `X = T^(d_v)`.

### From TauCetiRoadmap.ClassFieldTheory

ClassFieldTheory Layers 1–4 provide class formations and Tate's theorem; Layers 5–7
provide local invariants, unramified extensions and arithmetic local reciprocity.
Layer 8 supplies local existence for finite extensions of `ℚ_p` and the prime-to-residue-
characteristic existence theorem in equal characteristic. These are the domains used here.

### From TauCetiRoadmap.LubinTateFormalModulesAndQuasiCanonicalLifts

LubinTateFormalModulesAndQuasiCanonicalLifts LT.0, targets *Formal group homomorphisms*,
*One-dimensional formal modules* and *Adic formal-module points*, supplies formal
homomorphisms, coefficient actions with the specified tangent map, and evaluated
maximal-ideal points with coefficient and coordinate functoriality. Their ring and adic
hypotheses are retained in §4.1. LT.1–LT.2 supply the mixed-characteristic specialization;
§4.1 supplies the equal-characteristic case.

### From TauCetiRoadmap.LocalFieldsRamification

LocalFieldsRamification Layer 3 provides lower and upper ramification groups, Herbrand
functions, compatibility with quotients and Hasse–Arf.

### From TauCetiRoadmap.DeligneWeightsAndPurity

DeligneWeightsAndPurity §§1.6 and 1.9 provide the Jacobian numerator, the Weil bound and
base extension. Section 3.7 supplies `finiteCover_degreeChebotarev` on each compatible
constant-field Frobenius progression; §5.8 here adds its explicit numerical error.

### From TauCetiRoadmap.WeilConjectures

WeilConjectures WC.1, *A curve numerator before root bounds*, supplies
`curve_zeta_numerator_without_rh` on the scheme zeta function. WC.5, *Recurrences and Newton
recovery*, supplies `extension_count_recurrence` for a known-degree polynomial; §5.6 here
uses reciprocal symmetry to recover the numerator from only `g` point counts.

### From TauCetiRoadmap.SchemeAndStackFoundations

SchemeAndStackFoundations §3.6 (`picardComponent`, `picardComponent_torsor`,
`picardComponent_point_iff`) supplies ordinary Picard components and torsors, using
JacobianChallenge Layer D for representability and the Picard–Brauer obstruction.
SchemeAndStackFoundations §3.7 `abelMaps_highDegree` supplies ordinary high-degree Abel
maps with Brauer–Severi descent. JacobianChallenge Layers A–C supply line bundles,
coherent curve cohomology and pushforward vanishing and base change. Section 4.6 adds
scheme representability and structure to the rigidified algebraic space supplied by
RelativeJacobiansAndIntegralCurveModels §§1.3–1.5; §4.7 adds the perfect-field modulus
universal property.
SchemeAndStackFoundations §1.1 supplies quasi-coherent module descent; ModularCurves
Layer 0E supplies effective descent of affine schemes. The subcanonical flat topology
supplies descent of morphisms.

### From TauCetiRoadmap.JacobianChallenge

JacobianChallenge Layers A–C supply line bundles, coherent curve cohomology, pushforward
vanishing and base change. Layer D supplies ordinary Picard representability and its
Picard–Brauer comparison, through SchemeAndStackFoundations §3.6.

### From TauCetiRoadmap.ModularCurves

ModularCurves Layer 0E supplies effective descent of affine schemes, used to descend
the affine rigidification presentation in §4.6.

### From TauCetiRoadmap.RelativeJacobiansAndIntegralCurveModels

RelativeJacobiansAndIntegralCurveModels §§1.3–1.5 supplies the rigidified sheaf for a
finite-flat rigidificator, its unit sequence, smooth algebraic-space representability
for curves and universal family. A nonzero effective divisor on the geometrically
connected smooth projective curve is a rigidificator because universal global functions
are the base functions and its finite positive length is faithfully flat. The supplier's
rigidification `O_m ≅ L|_m` is the convention used here; no inversion is required.
A presentation using `L|_m ≅ O_m` must invert its trivialization before comparison.

### From TauCetiRoadmap.ReductiveGroupsPartII

ReductiveGroupsPartII §RG2.3.7 states Lang's theorem for a smooth connected group over `𝔽_q`.
Section 4.9 uses its commutative form `Frob_q − id` on a generalized Jacobian, including its
unipotent part. RG2.0a supplies affine restriction of scalars along finite locally free
maps, so `Res_{m/k} 𝔾_m` includes nonreduced finite `m`.

ReductiveGroupsPartII RG2.0 supplies affine point topologies, their functoriality and the
topological group of points over every topological base algebra, including the adeles.
Section 6.1 adds the function-field restricted-product comparison.

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 supply smooth/parabolic induction,
its finite-level double-coset description and Whittaker functionals. Section SR.4.1 gives the Satake isomorphism of the spherical Hecke
algebra with `Z[q_v^(±1/2)]`-coefficients and its compatibility with parabolic restriction.

### From TauCetiRoadmap.AdelicAlgebraicGroups

AdelicAlgebraicGroups Layer AA.0 supplies restricted products of Haar measures for
countable families of second countable locally compact groups. The places of a finite-
constant-field function field satisfy these hypotheses.

### From TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic

GeometryOfNumbersAndQuadraticArithmetic §3.2 supplies Hermitian local densities,
normalized Siegel polynomials and the Cho–Yamauchi overlattice formula for an unramified
quadratic field extension when the base field has characteristic different from two,
including dyadic residue fields.

### From TauCetiRoadmap.AutomorphicSpectralTheory

AutomorphicSpectralTheory §§1.11–1.13 supply function-field `GL_n` unramified character
parameters, including every component of the fixed-centre diagonalizable group, spherical
sections and induction normalization. Sections 2.15–2.16 and 4.11–4.17 provide the
corresponding intertwiner and discrete/residual interfaces for comparison.

### From TauCetiRoadmap.EtaleCohomologyFoundations

EtaleCohomologyFoundations §§F.2.5 and F.3 give the actual compact-support functor and
perfectness for bounded constructible finite-Tor-amplitude coefficients; §§F.10.2–F.10.3
give Frobenius comparison and finite-projective trace/determinant algebra. These are roadmap contracts, rather than implementation declarations at the pins. Section 5.7 adds the finite-coefficient Euler-product
identity; equality of power traces alone is not its supplier.

### From TauCetiRoadmap.PadicMeasuresIwasawaAlgebras

PadicMeasuresIwasawaAlgebras §5.1 supplies `detLine`, `detLine_quasiIso`,
`detLine_shortExact`, `detLine_baseChange`, `detLine_shift` and `detLine_acyclic` for
perfect complexes over commutative rings. Section 5.7 forms the characteristic series
from this functor; EtaleCohomologyFoundations §F.10.3 supplies traces and determinants
of finite projective modules, not this derived determinant construction.

### From TauCetiRoadmap.MetaplecticAutomorphicForms

MetaplecticAutomorphicForms §6.2 and its local Schrödinger, Weil-representation and
Weil-index interfaces supply the Siegel–Weil sections used in §7.5. This consumption is
in the odd-characteristic global branch of Layer 7.

## How to read the build

Layer 0 fixes the setting and conventions and transports F. K. Schmidt's theorem to divisors.
Layers 1–3 are independent of each other: Layer 1 is the polynomial-lattice description of
`L(D)`, Layer 2 the additive adelic volumes, Layer 3 Artin–Schreier–Witt theory. Layer 4 needs
Layer 3 for the Schmid–Witt symbol and Layer 2 for the local-coordinate comparison.
Its geometric branch (§§4.6–4.10) uses the supplied rigidified Picard spaces and
finite-field Lang covers, curve Riemann–Roch and compatible finite Artin reciprocity. It does not
depend on Layer 5's Chebotarev estimate or on the higher-rank automorphic results.
Layer 5 needs Layer 0 and AlgebraicCurves Layers 3–5; its finite-ray comparisons use §4.5. Layer 6
needs Layer 2 (unipotent quotient volumes) and Layer 0. Layer 7 needs Layers 2 and 6. The worked
examples after Layer 7 use Layers 0, 3 and 5.

## Layer 0: finite constant fields, degrees and normalisations

This layer compares the degree and reciprocity conventions and transports degree-one divisors
and the finite-field Picard comparison into the `TauCeti.Divisor` vocabulary. No rational point
of the curve is assumed.

### 0.1 Degrees, idele degrees and Frobenius conventions

Prove degree_conventions, comparing the supplied degrees and reciprocity maps:

1. Under the valuation-divisor map of AutomorphicLFunctionsAndLocalFactors *Curve additive
   analysis*, ArithmeticGaloisDuality's `ideleDegree a` equals `TauCeti.Divisor.degree` of the
   divisor `Σ_v ord_v(a_v)[v]`. Yu's degree is `deg_Yu = −ideleDegree`, and `|a| = q^(deg_Yu a)`.
2. **Constant-field reciprocity.** For the global reciprocity map `Art` of ArithmeticGaloisDuality
   *The class formation of a global function field*, and `r ≥ 1`, the image of an idele class `a`
   in `Gal(𝔽_{q^r}F/F) ≅ ℤ/r` is `φ^(ideleDegree a)`, where `φ` is arithmetic `q`-Frobenius;
   equivalently `φ^(−deg_Yu a)`. In the geometric normalization the exponent changes sign.

*Proof sketch.* (1) compares the two coordinate sums place by place. For (2), `Art` is compatible with local
reciprocity, a constant extension is unramified at every place, and at a place of degree `d_v` it has
`gcd(r,d_v)` completion factors, each unramified of degree `r/gcd(r,d_v)`. Local arithmetic
Frobenius restricts to `φ^(d_v)` on `𝔽_{q^r}`; multiplicativity in `a` and triviality on
`Fˣ` give the formula. (Yu, §2.2.1, p. 8 and §2.2.3, p. 9, for the idele norm and
the sign of his degree; ArithmeticGaloisDuality §R02.3.2 for the global map.)

*Needs:* Tau Ceti `Divisor.degree`, `Divisor.degree_principal`, `Place.ordAddMonoidHom`;
ArithmeticGaloisDuality §R02.3.2; AutomorphicLFunctionsAndLocalFactors AL.3 *Curve additive
analysis*; AlgebraicCurves Layer 0.

**Checks.**

- The idele equal to `π_v` at `v` and `1` elsewhere has `ideleDegree = d_v` and `deg_Yu = −d_v`;
  a degree that forgot the residue degree would give `±1`.
- At `x=0`, the absolute value is `0`. Substituting the native total additive order
  `ord_v(0)=0` into the nonzero formula would give `q^0=1`.
- A principal idele has both degrees zero.
- For the cyclic constant extension of degree `r` and a place of degree `d`, the uniformizer
  idele acts by `φ^d`; replacing arithmetic by geometric Frobenius inverts this element without
  changing any divisor degree, so the two conventions are distinguished only by the reciprocity
  map, never by a degree.
- For `r=d_v=2`, there are two completion factors of degree one and `φ²=1`. For
  `r=3,d_v=2`, there is one factor of degree three and `φ²` has order three. In each
  case the sum of the local degrees is `r`, so using local degree `r` in the first case fails.

### 0.2 Divisors of degree one

Prove `exists_divisor_degree_eq_one`: if `k` is finite, `hF : IsFunctionField k F` and
`IsIntegrallyClosedIn k F`, then some `D : TauCeti.Divisor k F` has `Divisor.degree D = 1`.
Equivalently the greatest common divisor of the degrees of all places is `1`, and
`Divisor.degree : Divisor k F →+ ℤ` is surjective (surjectivity of the degree map). This does not
assert the existence of a place of degree one, nor of a rational point of the model.

*Proof sketch.* This is the divisor form of F. K. Schmidt's theorem, ArithmeticGaloisDuality's
`ideleDegree_surjective`, transported along the valuation-divisor map of
AutomorphicLFunctionsAndLocalFactors AL.3 and the comparison 0.1(1): a degree-one idele maps to
a degree-one divisor. A direct proof, independent of class field theory, runs through the Weil
bound: if `e > 1` divided every place degree, the model would have no `𝔽_{q^r}`-points for
`e ∤ r`, contradicting `|#X(𝔽_{q^r}) − q^r − 1| ≤ 2g q^(r/2)` (SchemeAndStackFoundations §5.11 *Weil bound via surfaces*,
together with DeligneWeightsAndPurity §1.9 for base extension) for large `r` prime to `e`; Bézout
then combines finitely many places into a degree-one divisor. (Roquette, *Class field theory in
characteristic p*, §4.3.3, p. 26, which records the theorem and its original zeta-function proof;
§8.1 for Witt's algebraic proof.)

*Needs:* ArithmeticGaloisDuality §R02.3.2 `ideleDegree_surjective`; AutomorphicLFunctionsAndLocalFactors
AL.3 *Curve additive analysis*; Layer 0.1.

**Checks.**

- A genus-one curve over `𝔽_q` always has a rational point by the Weil bound, but a curve of
  genus `g ≥ 2` can have `X(𝔽_q) = ∅`; it still has a degree-one divisor. A formalisation that
  produced a rational point would be false for such curves.
- For `F = 𝔽_q(t)` the place at infinity already has degree one.
- Over a non-finite field the statement fails: the function field of a pointless conic over `ℝ`
  has every divisor of even degree (SchemeAndStackFoundations §3.6, *picardComponent_test_conic*).

### 0.3 Divisor classes and Picard points over a finite field

Prove divisorClass_picardPoints: for `F = k(X)` with finite exact constants `k`, the divisor class
group `Cl(F)` is isomorphic to `Pic(X)` and to the group of `k`-points
`Pic_{X/k}(k)` of the Picard scheme, compatibly with degree; in particular
`Cl⁰(F) ≅ Pic⁰_{X/k}(k) = J(k)` for the Jacobian `J`, and the class number is
`h = #J(k)`. The degree-one component `Pic¹_{X/k}` is the trivial `J`-torsor (it has a `k`-point,
the class of a degree-one divisor from 0.2), but such a point is not a point of `X(k)`.

*Proof sketch.* AlgebraicCurves Layer 12D identifies `Divisor k F` with the Weil divisors of the
model and `Cl(F)` with its Picard group; SchemeAndStackFoundations §3.6 gives the injection `Pic(X) → Pic_{X/k}(k)` with cokernel
inside `Br(k)`, and `Br(k) = 0` for a finite field (Wedderburn; ClassFieldTheory Layer 5). The
torsor `Pic¹` has a `k`-point by 0.2 and `picardComponent_point_iff`. (Milne, *Arithmetic Duality
Theorems*, 2nd ed., Appendix A, proof of A.7, pp. 131–132, for the use of this comparison over
finite fields.)

*Needs:* AlgebraicCurves Layer 12; SchemeAndStackFoundations §3.6; ClassFieldTheory Layer 5;
Tau Ceti `Divisor.degreeClass`, `Divisor.finite_ker_degreeClass`, `Divisor.classNumber`; Layer 0.2.

**Checks.**

- For `ℙ¹`, `Pic⁰(𝔽_q) = 0` while `Pic(ℙ¹) = ℤ`, so `h = 1`.
- The class group of an affine chart `Spec R_x` depends on the removed places; it agrees with
  `Cl⁰(F)` only through AlgebraicCurves Layer 3's exact sequence, never by definition.
- Over `ℝ` the same comparison has nonzero cokernel `Br(ℝ) = ℤ/2` (the pointless conic), so
  `Br(k) = 0` is a genuine hypothesis.

### Examples

For `F = 𝔽_q(t)`: `k̃ = 𝔽_q`, `g = 0`, `h = 1`, the place `∞` has degree one, and the idele with
`t⁻¹` at `∞` and `1` elsewhere has `ideleDegree = 1`.

### Dependencies

AlgebraicCurves Layers 0, 3, 5, 8 and 12; ArithmeticGaloisDuality §R02.3.2;
AutomorphicLFunctionsAndLocalFactors AL.3 *Curve additive analysis*; SchemeAndStackFoundations
§3.6 and §5.11; DeligneWeightsAndPurity §1.9; ClassFieldTheory Layer 5.

## Layer 1: Riemann–Roch spaces over a polynomial subring

Fix `x ∈ F` transcendental over `k` (the constant field `k` here is any field; finiteness is not
used in this layer), `n = [F : k(x)]`, and the two charts of AlgebraicCurves Layer 2: the
integral closure `O_fin` of `k[x]` in `F` and the integral closure `O_∞` of the local ring
`k[1/x]_{(1/x)}` in `F`. Both are finite free modules of rank `n` over their (principal) base
rings by AlgebraicCurves Layer 2's finite normalization, with no separability hypothesis. This
layer describes `L(D)` through these two lattices; it is the mathematics behind every explicit
computation of a Riemann–Roch space, stated as theorems about the native `TauCeti.riemannRochSpace`.
Hess assumes `x` separating; his arguments use only that both integral closures are finite free
modules over their base rings, which AlgebraicCurves Layer 2 proves for every transcendental `x`, so
the statements below are made for every such `x`.

### 1.1 The two-chart description of `L(D)`

Associate to `D` the pair `(D_fin, D_∞)` of fractional ideals of `O_fin` and `O_∞`
attached to a divisor `D` (the place–prime bijection of AlgebraicCurves Layer 2 and the
divisor–fractional-ideal isomorphism of AlgebraicCurves Layer 3, applied on each chart), and prove
riemannRochSpace_eq_inf_chartIdeals:

```text
L(D) = (D_fin)⁻¹ ∩ (D_∞)⁻¹      inside F,
```

where the intersection is of `k`-subspaces of `F`. The two chart ideals have the following API:

- Addition of divisors multiplies the ideals; the resulting map is a group isomorphism from
  divisors onto pairs of invertible fractional ideals on the two charts.
- For every integer `r`, `D + r·(x)_∞` corresponds to `(D_fin, x^(−r)·D_∞)` and
  `D + r·(x)_0` corresponds to `(x^r·D_fin, D_∞)`.
- A principal divisor gives principal ideals generated by the same element on both charts.

*Proof sketch.* A nonzero function `a ∈ F` lies in `(D_fin)⁻¹` exactly when `ord_v(a) ≥ −D_v` at every
place `v` with `ord_v(x) ≥ 0`, because `O_fin` is Dedekind with these places as its primes; the
same holds on the infinite chart for the places with `ord_v(x) < 0`. Every place lies on one of
the two charts. Zero belongs to both fractional ideals and to `L(D)` by the
multiplicative membership condition. (Hess, *Computing Riemann–Roch spaces in algebraic function fields and related
topics*, Proposition 9 and proof, p. 7; Remark 10, p. 7, for the pole shifts.)

*Needs:* AlgebraicCurves Layers 2 and 3; Tau Ceti `riemannRochSpace`.

**Checks.**

- For `F = k(t)`, `x = t` and `D = 2·∞`, the pair is `(k[t], t^(−2)·k[1/t]_{(1/t)})`;
  its inverse pair is `(k[t], t²·k[1/t]_{(1/t)})`. Their intersection is the polynomials of
  degree at most `2`, the span of `1, t, t²`. Reversing the first sign instead gives `L(−2∞) = 0`.
- For `deg D < 0` the intersection is `0`, matching `L(D) = 0`; using additive valuations with the
  junk value `ord_v(0) = 0` would wrongly exclude `0` when some `D_v < 0`, so membership is the
  multiplicative inequality of `TauCeti.riemannRochSpace`.
- Using only the finite chart gives the infinite-dimensional `k`-space `(D_fin)⁻¹`; the infinite
  chart is what makes `L(D)` finite-dimensional.

### 1.2 Reduced bases and the invariants of a divisor

Prove exists_reducedBasis: for free modules `M_fin` over `k[x]` and `M_∞` over `O_{k(x),∞}` of
the same rank `n` spanning the same `k(x)`-vector space, there are bases `v₁, …, vₙ` of `M_fin`
and integers `d₁ ≥ ⋯ ≥ dₙ` such that `x^d₁ v₁, …, x^dₙ vₙ` is a basis of `M_∞`; the
integers are unique. Then prove `riemannRoch_reducedBasis`: for every divisor `D` there are
uniquely determined integers `d₁ ≥ ⋯ ≥ dₙ` (the `k[x]`-invariants `|D|_i` of `D`) and elements
`v₁, …, vₙ ∈ F`, linearly independent over `k(x)`, such that for every `r ∈ ℤ`

```text
{ x^j v_i : 1 ≤ i ≤ n, 0 ≤ j ≤ d_i + r }   is a k-basis of L(D + r·(x)_∞).
```

Consequently `ℓ(D) = Σ_i max(0, d_i + 1)` and, by Riemann–Roch,
`Σ_i d_i = deg_k D + [k̃ : k](1 − g_exact) − n` (Hess, Corollary 11, p. 8), where `k̃` is the
exact constant field and `g_exact = TauCeti.genus k̃ F`. When `k` is exact this is the standing
`g`; otherwise one must first transport the places and divisors to `k̃`. The truncated
`TauCeti.genus k F` over a nonexact base does not in general equal `g_exact`.

The reduced invariants and bases have the following API:

- The sorted integers `d_i` are unique.
- For every integer `r`, `|D + r·(x)_∞|_i = |D|_i + r`.
- The dimension is `ℓ(D) = Σ_i max(0, d_i + 1)`.
- Their sum is `deg_k D + [k̃:k](1−g_exact) − n`.
- For `f ∈ Fˣ`, `|D − div f|_i = |D|_i`, and multiplication by `f` carries a reduced
  basis for `D` to one for `D − div f`.

*Proof sketch.* Choose bases of `(D_fin)⁻¹` and `(D_∞)⁻¹` and the transition matrix
`M ∈ GL_n(k(x))`. Column reduction by unimodular `k[x]`-operations, guided by the leading
coefficients in `1/x` (Hess Lemma 1: the leading-coefficient matrix is nonsingular exactly when
the basis is reduced), strictly lowers the sum of the column degrees, which is bounded below by
the degree of `det M`; this gives the normal form of Corollaries 3–4. In a reduced basis an
element `Σ_i a_i v_i` with `a_i ∈ k[x]` lies in `(D_∞)⁻¹` exactly when `deg a_i ≤ d_i`, with polynomial degree `deg 0=−∞`, because
the degree of a sum is the maximum of the degrees of its terms. (Hess, Lemma 1, p. 4;
Corollaries 3 and 4, pp. 5–6; Theorem 7 and its proof, pp. 6–8; Corollary 11, p. 8.)

*Needs:* Layer 1.1; AlgebraicCurves Layers 2–4 (finite normalization, divisors, Riemann–Roch,
exact constants); Mathlib matrices over `Polynomial k` and `RatFunc k`.

**Checks.**

- For `F = k(t)`, `x = t`, `n = 1`: `|D|₁ = deg D + (1 − 0) − 1 = deg D` when `g = 0`, `k̃ = k`, so
  `ℓ(m·∞) = m + 1` for `m ≥ 0` and `0` for `m < 0`; a formula without the `max(0, ·)` would give
  negative dimensions.
- For an elliptic function field `F = k(x, y)`, `y² = x³ + ax + b` (characteristic not `2` or
  `3`, nonsingular), `n = 2` and `D = 0`: `L(r·(x)_∞)` has basis `1, x, …, x^r` and
  `y, xy, …, x^(r−2)y`, so `(|0|₁, |0|₂) = (0, −2)` with sum `−2 = 0 + (1 − 1) − 2`.
- The invariants depend on `x`: replacing `x` by `x²` changes `n` and the `d_i`, while `ℓ(D)` does
  not change; a definition that forgot the dependence on `k[x]` would be ill posed.
- In characteristic `p`, take `F=k(t)` and the inseparable subfield `k(x)` with `x=t^p`.
  For `D=0`, use `v=(1,t,…,t^(p−1))` and invariants `0,−1,…,−1`. At `r=0` the
  basis is just `1`; at `r=1` it is `1,t,…,t^p`, of dimension `p+1`, and at `r=−1`
  it is empty. Separability of `F/k(x)` cannot be required by this headline.
- For exact constants `k̃/k` of degree `2` and `g_exact = 2`, the sum is `deg_k D − 2 − n`.
  Here the native supremum over `k` is `TauCeti.genus k F = 3`; using it in Hess's formula
  would incorrectly give `deg_k D − 4 − n`.

### Examples

On `𝔽_5(x, y)` with `y² = x³ + x + 1`, `L(2·O) = span(1, x)` and `L(3·O) = span(1, x, y)`,
where `O` is the place at infinity, `(x)_∞ = 2·O`; the invariants of `D = 0` are `(0, −2)`.

### Dependencies

AlgebraicCurves Layers 2, 3 and 4; Tau Ceti `riemannRochSpace`, `genus`.

## Layer 2: divisor lattices and self-dual volumes in the completed adeles

Here `k = 𝔽_q` with exact constants; write `K=F` for the function field. The completed adeles `𝔸_K`, the residue character `ψ_ω` of a
nonzero rational differential `ω`, its conductor exponents `n_v = ord_v(ω)`, the self-dual
measures and Poisson summation are those of AutomorphicLFunctionsAndLocalFactors AL.3, *Curve
additive analysis*; they are not constructed again. This layer adds the lattice-level statements
that make Riemann–Roch visible in that adelic picture and pins the volume normalisations used by
Layers 6 and 7. Only the definitions of the additive character, the self-dual measure and the
adelic Fourier transform are used; no theorem of Tate's thesis is stated or cited.

### 2.1 Divisor lattices

Define the divisor lattice `A(D)={a ∈ 𝔸_K : a_v ∈ π_v^(−D_v) O_v for every place v}` for a divisor
`D` (membership is the valuation inequality `|a_v|_v ≤ q_v^(D_v)`, which includes `a_v = 0`).
Prove divisorLattice_isCompactOpen, divisorLattice_inter_diagonal
(`A(D) ∩ K = L(D)` under the diagonal embedding, with `0` included for every `D`),
and divisorLattice_quotient: the quotient `𝔸_K ⧸ (A(D) + K)` is a finite-dimensional
`k`-vector space, naturally isomorphic to the repartition quotient
`A_F ⧸ (A_F(D) + F)` of AlgebraicCurves Layer 4, hence of dimension `i(D) = ℓ(W − D)` for a
canonical divisor `W`. The lattice API is:

- If `D ≤ D′`, then `A(D) ⊆ A(D′)`.
- For `f ∈ Kˣ`, multiplication gives `f · A(D) = A(D − div f)`.
- For `D ≤ D′`, the index is `[A(D′) : A(D)] = q^(deg D′ − deg D)`.

*Proof sketch.* Compact openness is the product of the compact open `π_v^(−D_v) O_v` with almost
all factors `O_v`. The diagonal intersection is the definition of `L(D)`. For the quotient,
AlgebraicCurves Layer 5's completion comparison gives a map of repartitions into `𝔸_K` with dense
image in the `D`-filtration sense; since `A(D)` is open, every class of
`𝔸_K ⧸ A(D)` is hit by a repartition, and the kernel of the induced map is
`A_F(D) + F` by the diagonal intersection. The index is the local count
`dim_k(π_v^(−b)O_v/π_v^(−a)O_v) = (b − a)d_v` of AlgebraicCurves Layer 4. (Parshin, *Notes on the
Poisson formula*, §2.1, p. 7, and §2.2, pp. 9–10, for divisor lattices in the full adeles.)

*Needs:* AutomorphicLFunctionsAndLocalFactors AL.3 *Curve additive analysis*; AlgebraicCurves
Layers 4 and 5; Tau Ceti `riemannRochSpace`.

**Checks.**

- On `𝔽_q(t)`, with canonical divisor `W = −2∞`: for `D = −∞`, `A(D) ∩ K = 0` and
  the quotient has dimension `i(−∞) = ℓ(−∞) = 0`; for `D = −2∞` it has dimension `ℓ(0) = 1`.
- If the condition at `∞` is dropped (the affine finite adeles of `𝔽_q(t)`), the intersection
  of `K` with `∏_{v≠∞} π_v^(−D_v) O_v` is the infinite-dimensional space of functions with bounded
  poles away from `∞`; the condition at `∞` is what cuts it down to `L(D)`.
- The index formula weights by `d_v`: for a single place `v` of degree `2`,
  `[A([v]) : A(0)] = q²`, not `q`.

### 2.2 The self-dual measure of a differential and its volumes

For a nonzero rational differential `ω` with local conductor exponents `n_v = ord_v(ω)` (so
`Σ_v n_v d_v = 2g − 2` by `TauCeti.degree_weilDifferentialDivisor`), let `μ_{ω,v}` be the Haar
measure on `K_v` that is self-dual for the pairing `(a, b) ↦ ψ_{ω,v}(ab)`, and `μ_ω` their
restricted product on `𝔸_K` (AdelicAlgebraicGroups Layer AA.0). Prove selfDual_local_volume:
`μ_{ω,v}(O_v) = q_v^(−n_v/2)`; and selfDual_global_volumes:

```text
μ_ω(∏_v O_v) = q^(1−g),   μ_ω(A(D)) = q^(deg D + 1 − g),   μ_ω(𝔸_K/K) = 1.
```

The measure and annihilator API is:

- For `f ∈ Kˣ`, `μ_{fω,v} = |f|_v^(1/2) μ_{ω,v}` at each place and `μ_{fω} = μ_ω`
  globally by the product formula.
- The annihilator of `O_v` under `ψ_{ω,v}` is `π_v^(−n_v) O_v`.
- The measures satisfy `μ_ω = q^(1−g) · μ_int`, where `μ_int` gives each `O_v` volume one.

*Proof sketch.* Self-duality forces `μ_{ω,v}(O_v) · μ_{ω,v}(O_v^⊥) = 1`, and
`O_v^⊥ = π_v^(−n_v) O_v` has `μ_{ω,v}`-volume `q_v^(n_v) μ_{ω,v}(O_v)`. The product over `v` is
`q^(−Σ n_v d_v / 2) = q^(1−g)`. The lattice volume follows from the index in 2.1. AL.3 gives
`μ_int(𝔸_K/K) = q^(g−1)`, so `μ_ω(𝔸_K/K) = q^(1−g) q^(g−1) = 1`. (Parshin, §2.2, pp. 9–10,
formulas (9)–(10); see the remark on source corrections below.)

*Needs:* Layer 2.1; AutomorphicLFunctionsAndLocalFactors AL.3 *Curve additive analysis*;
AdelicAlgebraicGroups Layer AA.0; Tau Ceti `degree_weilDifferentialDivisor`, `Divisor.degree_principal`.

**Checks.**

- On `𝔽_q(t)` with `ω = dt`, `(ω) = −2∞`, so `n_∞ = −2`, `μ_{ω,∞}(O_∞) = q` and
  `μ_ω(∏ O_v) = q = q^(1−0)`, not `1`.
- At a place with `n_v = 2`, `μ_{ω,v}(O_v) = q_v^(−1)`.
- Replacing `ω` by `t·ω` on `𝔽_q(t)` changes the local factors at `0` and `∞` by inverse powers
  of `q^(1/2)` and leaves `μ_ω` unchanged.

### 2.3 Fourier transforms of lattice indicators

With the Fourier transform `f̂(b) = ∫ f(a) ψ_ω(ab) dμ_ω(a)` of AL.3, prove
fourier_indicator_divisorLattice: for every divisor `D`,

```text
(1_{A(D)})^ = q^(deg D + 1 − g) · 1_{A((ω) − D)},
```

and for a translate, `(1_{c + A(D)})^(b) = ψ_ω(cb) · (1_{A(D)})^(b)`.
Prove testFunctions_span_translates: the locally constant compactly supported functions on
`𝔸_K` are the finite linear combinations of indicators of translates `c + A(D)`; the
unshifted indicators `1_{A(D)}` alone do not span.

*Proof sketch.* The indicator of a compact open subgroup has Fourier transform equal to its volume
times the indicator of its annihilator; the annihilator of `A(D)` under `ψ_ω` is
`A((ω) − D)` by 2.2's local annihilator statement. A test function is constant on
cosets of some `A(D)` and supported on finitely many cosets of a larger one.
(Parshin, §2.1, p. 7, and §2.2, pp. 9–10.)

*Needs:* Layers 2.1–2.2; AutomorphicLFunctionsAndLocalFactors AL.3 *Curve additive analysis*.

**Checks.**

- For `𝔽_q(t)`, `ω = dt`, `D = 0`: `(1_{∏O_v})^ = q · 1_{A(−2∞)}`.
- Applying the transform twice to `1_{A(D)}` gives
  `q^(deg D + 1 − g) q^(deg((ω) − D) + 1 − g) = q^(2g − 2 + 2 − 2g) = 1` times the indicator, in
  line with `f̂̂(a) = f(−a)`.
- For `|k| > 2`, the indicator of a coset `c + A(D′)` moved by multiplication by a
  constant `λ ∈ kˣ` is not in the span of the `kˣ`-invariant unshifted indicators.

**Source corrections.** Parshin's §2.2 (p. 9) writes the adelic pairing as a sum of local
character values; it is their product (equivalently the character applied to the finite sum of
traced residues), since a sum over all places of values in `U(1)` diverges. The same page calls
the additive character of `𝔽_q` injective; for `q = p^f` with `f > 1` every character of `𝔽_q`
has image in `μ_p`, and the correct choice is a nontrivial character of `𝔽_p` composed with the
trace, whose induced pairing is nondegenerate. Parshin's §2.1 (p. 7, footnote 4) asserts that the
unshifted lattice indicators span the test functions; translates are needed, as in 2.3.

### Examples

On `𝔽_q(t)`, `ω = dt`: `μ_ω(A(m∞)) = q^(m+1)`, which for `m ≥ 0` is `q^(ℓ(m∞))`.

### Dependencies

AutomorphicLFunctionsAndLocalFactors AL.3 *Curve additive analysis*; AdelicAlgebraicGroups Layer
AA.0; AlgebraicCurves Layers 4 and 5; Tau Ceti `degree_weilDifferentialDivisor`.

## Layer 3: Artin–Schreier–Witt theory

`F` is any field of characteristic `p`. The tame and Kummer theory of covers, the general
ramification filtrations and Hasse–Arf are AlgebraicCurves Layers 6–8 and LocalFieldsRamification
Layer 3; the length-one Artin–Schreier conductor is ArithmeticGaloisRepresentations §3.7 and the
Artin–Schreier genus formula is AlgebraicCurves Layer 10. This layer supplies the cyclic
`p`-power theory of every length, which none of those layers states.

### 3.1 The Artin–Schreier–Witt operator and cyclic `p`-power extensions

Define `artinSchreierWitt p F : WittVector p F →+ WittVector p F` as `℘ = Frob − id`, where
`Frob = WittVector.frobenius` (on a field of characteristic `p` it raises every Witt coordinate to
the `p`-th power), and its truncation `℘_n` on `TruncatedWittVector p n F` (Frobenius preserves the
kernel of `WittVector.truncate n`). At length one this is the additive polynomial `x^p − x`
over every extension field, including characteristic two (Goss, §1.1, Example 1.1.1 and
Proposition 1.1.2, p. 1). Define `aswQuotient p F n`, the Artin–Schreier–Witt group of
length `n`,

```text
Q_n(F) := W_n(F) ⧸ ℘_n W_n(F)   ≅   W(F) ⧸ (℘ W(F) + ker(truncate n)),
```

and `Q_∞(F) := W(F)/℘W(F) ≅ lim_n Q_n(F)`. Give each finite-length group the discrete topology
and the infinite group this inverse-limit topology, equivalently its `p`-adic module topology.
For `a ∈ W_n(F)` let `F(℘⁻¹a)` be the field generated by the
coordinates of any solution of `℘_n y = a` in `W_n(F^sep)`; it depends only on the class of `a`.

Prove **Witt-vector additive Hilbert 90**, `witt_additiveHilbert90`: for a finite cyclic Galois extension `L/F`
in characteristic `p`, a chosen generator `σ`, and every `n ≥ 0`, the sequence
`0 → W_n(L)/W_n(F) → W_n(L) → W_n(F) → 0` is exact. The maps are
`[a] ↦ a−σa` and `Tr_W(a) = Σ_{τ ∈ Gal(L/F)} τa`, where both the sum and subtraction
use the Witt group law. Construct this trace, identify its values with invariant vectors,
and prove that it commutes with truncation. The kernel of `1−σ` is `W_n(F)`, its
image is the trace kernel, and the trace is onto. (Kosters–Wan, Proposition 3.1, p. 6.)
*Needs:* Mathlib Witt operations and the finite Galois correspondence; `Algebra.trace_surjective` for a finite separable field extension, followed by induction
on Witt length.

**Checks for Hilbert 90.**

- At `n = 0` all three groups are zero and both maps are zero.
- For `L = F`, the first group is zero and the trace is the identity, including at `n = 1`.
- For `y^p−y=a` of degree `p`, the length-one trace of `1` is `0`, whereas
  `Tr(−y^(p−1)) = 1`; thus trace surjectivity cannot be tested on `1` alone.
- At `p=2,n=2`, take `L=𝔽₂(t,y)` with `y²+y=t` and `σy=y+1`. The Witt trace of
  `[y]=(y,0)` is `(1,t)`, an invariant vector. Summing the coordinates separately
  would give `(1,0)`, so the trace must use Witt addition.

Prove `artinSchreierWitt_galois`: (i) every cyclic extension `L/F` of degree `p^n` inside `F^sep`
is `F(℘⁻¹a)` for some `a ∈ W_n(F)` whose image in `Q_1(F) = F/℘F` is nonzero (`n ≥ 1`);
the length-zero case is the trivial extension; (ii) for every
`a`, `F(℘⁻¹a)/F` is cyclic of degree equal to the additive order of the class of `a` in `Q_n(F)`
(namely `p^s` with `s = n − r` and `r ≤ n` the largest index with `π_r(a) = 0`); (iii) the pairing
`Gal(F^ab/F)/p^n × Q_n(F) → W_n(𝔽_p) = ℤ/p^n`, `(σ, ℘y) ↦ σy − y`, is a perfect pairing, giving
a topological isomorphism `Q_n(F) ≅ Hom_cont(G_F, ℤ/p^n)`; at infinite length,
`Q_∞(F) ≅ Hom_cont(G_F, ℤ_p)` and the maximal pro-`p` abelian quotient of `G_F`, with its
Krull topology, is `Hom_cont,ℤ_p(Q_∞(F), ℤ_p)` with the topology obtained from the finite-length
pairings. This inverse-limit duality is the meaning of perfectness at infinite length; it is
not a pairing into the Pontryagin dualizing group `ℚ_p/ℤ_p`. (iv) two classes generate the same subfield exactly when they
generate the same cyclic subgroup of `Q_n(F)`.

The operator and quotient have the following API:

- The operator is additive for the Witt group law and commutes with truncation.
- Classes generate the same field exactly when they generate the same cyclic subgroup;
  the extension degree equals the order of the class.
- Field embeddings induce maps on the quotients; localization gives `Q_n(F) → Q_n(F_v)`,
  whose kernel consists of classes split at `v`, and need not be zero.
- For `m ≤ n`, truncation induces the projection `Q_n(F) → Q_m(F)`.

*Proof sketch.* Additive Hilbert 90 for Witt vectors over a cyclic extension (the exact sequence
`0 → W_n(L)/W_n(F) → W_n(L) → W_n(F) → 0` given by `a ↦ a − σa` and the trace) produces the
generator in (i). In (ii), on `Q_n(F)` multiplication by `p` is the Verschiebung, which reads off
the order; the comparison with the length-`(r + 1)` Artin–Schreier extension shows the degree is
the full order. (iii) follows from (i)–(ii) by Pontryagin duality of the finite pieces. (Kosters–Wan,
*On the arithmetic of `ℤ_p`-extensions*, Proposition 3.1, p. 6; Theorem 3.2 and proof, pp. 6–8;
Theorem 3.4 and proof, pp. 8–9.)

*Needs:* Mathlib `WittVector`, `WittVector.frobenius`, `WittVector.verschiebung`,
`WittVector.truncate`, `TruncatedWittVector`, `Field.absoluteGaloisGroup`, `InfiniteGalois`
(Krull topology and the Galois correspondence); Witt-vector additive Hilbert 90 above.

**Checks.**

- `Q_0(F) = 0`, and `F(℘⁻¹0) = F`.
- At every length a coboundary `℘b` has class zero and gives the extension `F`.
  In contrast, in `Q_1(𝔽_p)` the class of `1` is nonzero, since `x^p−x = 0`
  for every `x ∈ 𝔽_p`; its extension has degree `p`.
- For `n = 2`, `p = 2` and `F = 𝔽_2(t)`, `℘` is not the coordinatewise map
  `(x₀, x₁) ↦ (x₀² − x₀, x₁² − x₁)`: on the Teichmüller vector `[t] = (t,0,…)` its first two coordinates are
  `(t²+t, t²+t³)`, and `t²+t³ ≠ 0`. The class of `(t,0)` in `Q_2(F)` has order `4`;
  a coordinatewise additive quotient would have exponent `2`.
- Multiplying a class by a unit of `ℤ/p^n` preserves the generated field and changes the attached
  character; a definition that attached a field to a character, rather than to a cyclic
  subgroup, would distinguish them.

### 3.2 Reduced Witt–Laurent representatives

Let `K = k((T))` with `k` finite of characteristic `p`, `T` a uniformizer, `α ∈ k` with
`Tr_{k/𝔽_p}(α) ≠ 0` and `β = [α] ∈ W(k)` its Teichmüller lift. Prove aswReduced_exists_unique:
every class in `Q_∞(K)` has a unique representative

```text
c·β + Σ_{i > 0, p ∤ i} c_i·[T^(−i)],   c ∈ W(𝔽_p) = ℤ_p,  c_i ∈ W(k),  c_i → 0 p-adically,
```

and at finite length `n` the same holds with `c ∈ ℤ/p^n`, `c_i ∈ W_n(k)` and only finitely many
`c_i ≠ 0`. Moreover: if every coordinate of `x` has positive valuation then `x ∈ ℘W(K)`; if every
coordinate is integral then `x ≡ cβ`; and if the first coordinate `x_j` of negative valuation has
`p ∤ v(x_j)`, then `min_i v(c_i) = j`, where `v` on `W(k)` is the index of the first nonzero
coordinate.

The reduced representatives have the following API:

- Reassembly from `c` and the `c_i` recovers the original quotient class.
- All `c_i` vanish exactly for unramified classes; their extensions are constant, of degree
  equal to the order of `c`.
- Put `n_c = min_i v(c_i)` and `n₀ = min(n_c,v(c))`. The length-`n₀` part is trivial;
  the length-`n_c` extension is unramified of degree `p^(n_c−n₀)` and every higher step is
  totally ramified when `n_c < ∞`. If all `c_i=0`, the length-`n` extension is unramified
  of degree `p^max(0,n−v(c))`, with degree `1` for the zero class.
- Changing the uniformizer changes the representative while preserving the attached extensions.

*Proof sketch.* Eliminate pole orders divisible by `p` using `℘`: since
`Frob[b T^(−i)] = [b^p T^(−pi)]`, the term `[a T^(−pi)]` is congruent to `[a^(1/p) T^(−i)]` modulo
`℘W(K)` (`k` is perfect). Integral terms are moved into the constant part through the trace,
using that `℘` is surjective on the subgroup of Witt vectors all of whose coordinates lie in
`Tk[[T]]`; uniqueness is proved modulo `p^j` by induction on
`j`. (Kosters–Wan, Proposition 4.3 and proof, pp. 15–16; Lemma 4.13 and proof, p. 22.)

*Needs:* Layer 3.1; Mathlib `WittVector.teichmuller`.

**Checks.**

- `W(k)/℘W(k) ≅ ℤ_p` through `Tr_{W(k)/ℤ_p}`, and `β = [α]` with `Tr_{k/𝔽_p}(α) ≠ 0` maps to a
  unit, so it generates the unramified `ℤ_p`-extension; for `α′` with `Tr_{k/𝔽_p}(α′) = 0` the
  class of `[α′]` is divisible by `p` and does not generate, so the trace condition on `β` is
  necessary to represent every unramified class with `c ∈ ℤ_p`.
- For `x = [T^(−p)]` the reduced form is `[T^(−1)]`, not `[T^(−p)]`; a "reduced form" that kept
  pole orders divisible by `p` would not be unique.
- Integral classes are constant: `[1 + T] − [1]` has all coordinates of positive valuation, so
  `[1 + T] ≡ [1] ≡ c β` with `c = [k : 𝔽_p] / Tr_{W(k)/ℤ_p}(β)`; for `k = 𝔽_{p^p}` this `c` lies in
  `pℤ_p`.

### 3.3 Comparing one-pole covers with Witt classes

Prove artinSchreier_onePole_comparison: over `F = k(t)` with `k` finite of characteristic `p`,
for `m > 0` with `p ∤ m`, the cover `F(y)/F`, `y^p − y = t^(−m)`, corresponds under 3.1 to
the cyclic subgroup generated by the class of `t^(−m)` in `Q_1(F)`. Localization at `0` sends
it to the reduced class of `T^(−m)` in `Q_1(k((T)))`, while localization at `∞` sends it to
zero. The class remains nonzero after every constant extension. This compares the cover and
Witt-class constructions; it does not construct their genus or ramification formulas again.

*Proof sketch.* The degree-`p` equation is the length-one Witt equation. Its pole at `0` has
order prime to `p`, even after extending the constants, so the local reduced class is nonzero.
At `∞` the right side has positive valuation and is a coboundary by 3.2. The field comparison
is 3.1's cyclic-subgroup correspondence. (Kosters–Wan, Theorem 3.2, pp. 6–8;
Proposition 4.3, pp. 15–16.)

*Needs:* Layers 3.1–3.2; ArithmeticGaloisRepresentations §3.7; AlgebraicCurves Layers 6, 7 and 10.

**Checks.**

- For `k = 𝔽_3`, `m = 2`: different exponent `6`, genus `1`, conductor `3·[0]`, and the model has
  exactly `4` rational points (worked example (4) below), using the supplied genus and different
  formulas; the local class at `0` is nonzero, whereas `∞` splits into three rational places. Over `𝔽_9` the same curve has sixteen
  rational points; the genus and local conductor remain unchanged.
- For `p = 2`, `m = 1`: genus `0`, and indeed `y² + y = 1/t` is a rational curve.
- With `m = p` the right side is congruent to `t^(−1)` and the formula for `m = p` would give the
  wrong genus.

### Examples

Over `𝔽_3((T))`, the class of `[T^(−6)] + [1]` reduces to `[T^(−2)] + cβ` with `c` read off from the
trace. At length one take `β = 1`, so `c = 1`. The ramified class `T^(−2)` and the unramified
class `1` are independent: their compositum has group `(ℤ/3)²` and degree `9`. Their sum
defines a degree-`3`, totally ramified diagonal subfield of that compositum, rather than the
whole compositum. Addition of characters must not be confused with adjoining both classes.

### Dependencies

Mathlib Witt vectors and infinite Galois theory; ArithmeticGaloisRepresentations §3.7;
AlgebraicCurves Layers 6, 7 and 10.

## Layer 4: equal-characteristic class field theory and ray geometry

`K` is an equal-characteristic nonarchimedean local field of characteristic `p`: complete
for a discrete valuation with finite residue field
`𝔽_Q`, ring of integers `O`, maximal ideal `𝔭` and uniformizer `π`. The mixed-characteristic specialization is consumed from
LubinTateFormalModulesAndQuasiCanonicalLifts LT.1–LT.2 and ClassFieldTheory; this layer
adds the equal-characteristic construction and combines the two cases. ClassFieldTheory
Layers 5–8 supply the local invariant, the local class formation, the absolute local Artin map
`Art_K : Kˣ → Gal(K^ab/K)` (arithmetic normalization), its conductors, and local existence for
finite extensions of `ℚ_p` and for norm subgroups of index prime to `p`; its scope section
excludes Lubin–Tate theory and `p`-primary existence in equal characteristic, which this layer
supplies. The completion `F_v` of a function field over `𝔽_q` at a place is such a field
(AlgebraicCurves Layer 9; Tau Ceti `Place.completionIntegersEquivPowerSeries` at a
rational place), so every statement applies at the places of Layers 0–7.

### 4.1 Lubin–Tate formal modules

Use the formal homomorphism, coefficient-action and evaluated-point carriers of
LubinTateFormalModulesAndQuasiCanonicalLifts LT.0. The construction below is for
`char K=p`; its statements agree with that supplier's LT.1–LT.2 over finite extensions
of `ℚ_p`.

A *Lubin–Tate series* for `π` is `f ∈ O[[X]]` with `f ≡ πX` modulo degree `2` and
`f ≡ X^Q` modulo `π`; `πX + X^Q` is one. Define `F_f`, the unique commutative
one-dimensional formal group law over `O` (Mathlib `FormalGroup` with `FormalGroup.IsComm`) for
which `f` is an endomorphism, and `[·]_f : O → End(F_f)`, the unique ring
homomorphism with `[a]_f ≡ aX` modulo degree `2` and `[π]_f = f`. Define the torsion
`μ_{f,m} := {α ∈ 𝔪_{K^sep} : f^{∘m}(α) = 0}` (evaluated only in maximal ideals of finite
extensions, where the series converge) and `K_{π,m} := K(μ_{f,m})`.

Prove lubinTate_torsion: for `m ≥ 1`, the Weierstrass polynomial of the power series `f^{∘m}`
has distinct roots, and `μ_{f,m}` is an `O`-module
isomorphic to `O/𝔭^m` (any `α ∈ μ_{f,m} ∖ μ_{f,m−1}` is a generator), `K_{π,m}/K` is totally
ramified and abelian of degree `(Q − 1)Q^(m−1)`, `α` is a uniformizer of `K_{π,m}`, `π` is a norm
from `K_{π,m}`, and `u ↦ (α ↦ [u]_f(α))` is an isomorphism `(O/𝔭^m)ˣ ≅ Gal(K_{π,m}/K)`. Neither
`K_{π,m}` nor the Galois action depends on the choice of `f` for the given `π`.
The formal-module and torsion API is:

- The formal group is commutative, and the linear term of `[a]_f` is `aX`.
- Two series for the same `π` give a unique isomorphism tangent to the identity and
  commuting with their `O`-actions.
- Torsion identifies with `O/𝔭^m`; the field is Galois of the stated degree and `π` is a norm.
- For `x ∈ Kˣ` with `d=ord_K(x)>0`, take the unramified extension `L/K` of degree `d`
  and a uniformizer `π_L` with `N_{L/K}(π_L)=x`. Relative formal modules give abelian
  fields `K_{x,m}/K` containing `L`, totally ramified over `L`, of degree
  `d(Q−1)Q^(m−1)` and norm group `⟨x⟩ × U_K^m` for `m≥1`.
  The unramified degree equals `ord_K(x)` and is not an independent parameter.

*Proof sketch.* The coefficients of `F_f` and `[a]_f` are built degree by degree; at each degree
the obstruction is divided by `π^t − π` with `t ≥ 2`, a unit times `π`, and uniqueness gives
associativity, commutativity and the ring-homomorphism laws. Separability of `f^{∘m}` in
characteristic `p` needs a separate argument (its derivative is not a unit in general); it is
proved by showing that the roots are simple through the `O`-module structure. The degree is
computed by Newton polygons: the constant term of `f^{∘m}/f^{∘(m−1)}` is a unit times `π`, and all
its roots have the same valuation. (Yoshida, *Local class field theory via Lubin–Tate theory*,
§§3.1–4.2: Lemma 3.4, p. 416; Proposition 3.5, p. 417; Corollary 3.7, p. 418; Proposition 4.4,
p. 419; §5.1, Definition 5.3 and Proposition 5.4, p. 423; Proposition 5.10, p. 425;
Appendix II, Proposition 8.1, p. 436.)

*Needs:* LubinTateFormalModulesAndQuasiCanonicalLifts LT.0; Mathlib `FormalGroup`,
`PowerSeries`; ClassFieldTheory Layer 5 (local fields and their
unramified extensions); AlgebraicCurves Layer 9 (the expansion of a completed place).

**Checks.**

- For `m = 1` the degree is `Q − 1`, prime to `p`; for `Q = 2`, `K_{π,1} = K` and `K_{π,2}/K`
  has degree `2`.
- For `m ≥ 2` the degree is divisible by `Q^(m−1)`, so the extension is wildly ramified and lies
  outside the prime-to-`p` existence theorem of ClassFieldTheory Layer 8.
- For `K = 𝔽_Q((π))` and `f = πX + X^Q`, `f` is additive, `F_f` is the additive formal
  group `X + Y` and `[a]_f = aX` for `a ∈ 𝔽_Q`; in mixed characteristic no Lubin–Tate formal
  group is additive, so a construction that silently used the additive group would be wrong there.
- If `ord_K(x) = 2`, the relative field has unramified degree `2`, total degree
  `2(Q − 1)Q^(m−1)`, and its norm group has valuation subgroup `2ℤ`; using an unramified
  extension of degree `1` cannot give that norm group.

### 4.2 Local existence, local Kronecker–Weber and injectivity in equal characteristic

Prove localKroneckerWeber: `K^ab = K^ur · K_π` with `K_π = ⋃_m K_{π,m}`. Prove
`localAbelianExistence_laurentSeries` for `K = k((T))` with finite `k`, and its
transport localAbelianExistence_all to every equal-characteristic local field: for every open subgroup `H ⊆ Kˣ` of finite index (in particular of
index divisible by `p` when `char K = p`) there is a unique finite abelian extension `L/K` inside
`K^sep` with `N_{L/K}(Lˣ) = H`, and `[L : K] = [Kˣ : H]`. Prove injective_artinMap_all: the
absolute Artin map of ClassFieldTheory Layer 7 is injective with image the abelian Weil group
`W_K^ab = {σ : σ|_{K^ur} ∈ φ^ℤ}`, it induces an isomorphism of the profinite completion `K̂ˣ`
with `Gal(K^ab/K)`, and the complete local class-field correspondence holds for every local field.
Prove lubinTate_artin: `Art_K(π)` is trivial on `K_π` and acts as `φ` on `K^ur`, and for
`u ∈ Oˣ`, `Art_K(u)` is trivial on `K^ur` and acts on `μ_{f,m}` by `[u⁻¹]_f`. Prove
conductor_existence_all: the norm subgroup of an abelian extension of conductor exponent `n`
contains `U^(n)` and not `U^(n−1)` (for `n ≥ 1`), in every characteristic.

These extend, without restating, ClassFieldTheory Layer 8's `localAbelianExistence`,
`injective_artinMap` and `localClassFieldCorrespondence` (there stated for finite extensions of
`ℚ_p`) to all nonarchimedean local fields.

*Proof sketch.* The Lubin–Tate extensions give norm groups `⟨π⟩ × (1 + 𝔭^m)` (Yoshida
Proposition 5.10, using the relative formal modules for an element `x` of positive valuation in
place of `π`); combined with the unramified extensions they realize every open subgroup of finite
index, and the base-change property (Theorem 5.15) shows the resulting map
`Kˣ → Gal(K_LT/K)` is compatible with norms from finite separable extensions. Local
Kronecker–Weber follows from the Hasse–Arf theorem (LocalFieldsRamification Layer 3) as in
Yoshida §6. The map so constructed satisfies the two characterizing properties of the Artin map
(action on `K^ur` and triviality on norms), so it is ClassFieldTheory's `Art_K` up to the
normalization: Yoshida uses geometric Frobenius, and his `Art_K(x)` is the inverse of
ClassFieldTheory's. (Yoshida, Theorem A, pp. 411–412; Definition 4.10, p. 422; Proposition 5.10,
p. 425; Theorem 5.15 and Corollary 5.16, p. 427; the existence theorem in §5.3(iv), p. 428;
Theorems 6.11 and 6.15, pp. 432–433.)

*Needs:* Layer 4.1; ClassFieldTheory Layers 4, 6, 7 and 8; LocalFieldsRamification Layer 3.

**Checks.**

- `H = ord⁻¹(rℤ)` for `r≥1` gives the unramified extension of degree `r`; the norm
  has valuation subgroup `rℤ` and is onto the units. For `r=1`, `H=Kˣ`, the extension
  is `K` and both its degree and the subgroup index are `1`.
- `H = ⟨π⟩ × (1 + 𝔭^m)` gives `K_{π,m}`, of degree `(Q − 1)Q^(m−1)`.
- For `K = 𝔽_p((T))`, the subgroup `H = ⟨𝔽_pˣ, T, 1 + T²O⟩`, of index `p`, is the norm group of
  the Artin–Schreier extension `y^p − y = T^(−1)` (conductor exponent `2`, Layer 4.4; by 4.3,
  `[T^(−1), T) = 0` and `[T^(−1), 1 − aT) = −a`). Every norm subgroup of index prime to `p`
  contains `1 + TO`, so the prime-to-`p` theorem of ClassFieldTheory Layer 8 cannot produce `H`.
- With Yoshida's normalization substituted for ClassFieldTheory's, lubinTate_artin would read
  `[u]_f` instead of `[u⁻¹]_f`; the sign check is the action of `Art_K(π)` on `K^ur`.

### 4.3 The Schmid–Witt symbol

Define `[·,·)_n : Q_n(K) × Kˣ → ℤ/p^n` (`K` of characteristic `p`) by
`[℘y, b)_n := Art_K(b)(y) − y`, and `[·,·)_∞ : Q_∞(K) × K̂ˣ → ℤ_p` on the `p`-adic
completion `K̂ˣ = lim Kˣ/(Kˣ)^(p^n)` by the same formula (using the pro-`p` quotient of
`Art_K` from 4.2). Here every finite-level quotient has the quotient topology from the local
field and `K̂ˣ` its inverse-limit, profinite topology. Its `p`-adic module topology is generally
finer and is not used for this duality.
Prove schmidWitt_perfect: `[ , )_n` is bilinear, kills `(Kˣ)^(p^n)` and induces a perfect
pairing of the discrete group `Q_n(K)` with the profinite group `Kˣ/(Kˣ)^(p^n)`; the infinite
version identifies each side with the continuous `ℤ_p`-linear dual of the other, with the
topologies specified in 3.1. At a fixed finite length it is not perfect
against the whole of `K̂ˣ`. Prove schmidWitt_characterization: the symbol is the unique
`ℤ_p`-bilinear continuous pairing with `[a, T′) = Tr_{W(k)/ℤ_p}(a)` for `a ∈ W(k)` and any
uniformizer `T′`, and `[[cT′^(−i)], T′) = 0` for `c ∈ k`, `i > 0`, `p ∤ i`. Prove
schmidWitt_formula: for `x ∈ W(K)` and `y ∈ K̂ˣ`,

```text
[x, y) = Tr_{W(k)/ℤ_p} Res( x̃ · dlog ỹ ),
```

where `x̃` lies in the `p`-adic completion `R = lim_m W_m(k)((T))` of `W(k)((T))`, and is
the characteristic-zero lift of the reduced representative of Layer 3.2
(`[cT^(−i)] ↦ [c]T^(−i)`) and, for `y = T^e ∏ (1 − a_{ij}T^i)^(p^j)` in the pro-`p` completion (`e ∈ ℤ_p`),
`dlog ỹ := e·dT/T + Σ_{i,j} p^j dlog(1 − [a_{ij}]T^i)`. For `e ∈ ℤ` this is the logarithmic
derivative of the usual Teichmüller-coefficient lift. For general `e` it is the limit of these
logarithmic derivatives at finite precision; no Laurent monomial `T^e` with noninteger exponent
is required. The residue is taken at each finite precision and
then passed to the inverse limit; the pole orders need not have one common lower bound.
Finally prove schmidWitt_normGroup: for a finite
subgroup `B ⊆ Q_n(K)`, the compositum of the extensions `K(℘⁻¹b)`, `b ∈ B`, has norm group the
annihilator of `B` in `Kˣ`.

*Proof sketch.* Bilinearity and the kernel are formal from Layer 3.1 (iii). Perfectness is
Layer 3.1 (iii) combined with the topological isomorphism `K̂ˣ ≅ Gal(K^ab/K)^(p)` of 4.2. The
characterization holds because the pairing is continuous and the elements `T′`, `1 − aT′^i`
topologically generate `K̂ˣ`; the value on `W(k)` is the Frobenius computation on the unramified
extension, and the vanishing on Teichmüller poles is Schmid's theorem. The explicit formula is
checked on the generators `(x, T)`, `(β, 1 − aT^i)` and `([bT^(−l)], 1 − aT^i)`, using that the
right side is also bilinear and continuous. The norm-group statement is the annihilator form of
4.2. (Kosters–Wan, Theorem 3.4, pp. 8–9; §4.1 and Remark 4.1, pp. 14–15; Proposition 4.2, p. 15;
Proposition 4.4 and proof, pp. 15–16; §4.4's completed ring `R`, p. 17; Theorem 4.7 and proof, pp. 18–19.)

*Needs:* Layers 3.1, 3.2 and 4.2; ClassFieldTheory Layer 7.

**Checks.**

- A constant class `a ∈ W(k)` pairs with `b` as `v(b) · Tr_{W(k)/ℤ_p}(a)`: trivially with units,
  and by the trace with a uniformizer.
- At `n = 1`, `T^p` pairs trivially with every class, while its image in `K̂ˣ` has valuation
  coordinate `p ≠ 0`: perfectness at finite length needs the quotient by `(Kˣ)^p`.
- Computing `[x, y)` by dividing ghost coordinates in characteristic `p` is meaningless (the ghost
  map is not injective there); the formula requires the characteristic-zero completed ring `R`.
- The reduced class `Σ_{j≥0} p^j[T^(−(pj+1))]` has coefficients tending to zero but unbounded
  pole orders. Its lift lies in `R` and not in ordinary `W(k)((T))`; modulo `p^m` only finitely
  many negative terms remain, so every finite-precision residue is defined.

### 4.4 Conductors of Artin–Schreier–Witt extensions

For `x ∈ W(K)` in the reduced form of Layer 3.2, prove aswConductor_eq: for `n ≥ 1` the
conductor exponent of `K(℘⁻¹π_n(x))/K`, the least `u` with `U^(u) ⊆ ker Art_K` on that extension
(`U^(0) = Oˣ`, `U^(u) = 1 + 𝔭^u`), is

```text
u_n = 0                                               if v(c_i) ≥ n for all i,
u_n = 1 + max { i · p^(n − v(c_i) − 1) : v(c_i) < n }   otherwise.
```

Prove aswUpperRamification: under `Gal(K(℘⁻¹x)/K) ≅ Hom(⟨x⟩, ℤ_p)`, the upper ramification
group `G^r` (`r ≥ 1`) corresponds to the characters `τ` with
`v(τ(x)) ≥ min_{p ∤ i} (v(c_i) + max(0, ⌈log_p(r/i)⌉))`, with `v(0) = ∞` and the minimum of
an empty family equal to `∞`. Finite layers use the image of this subgroup in the corresponding
finite Galois quotient. The conductor API is:

- For finite abelian extensions, `f(L₁L₂/K)=lcm(f(L₁/K),f(L₂/K))` as conductor ideals;
  the exponents therefore take their maximum.
- At length one, a nonzero pole part has conductor `1+max{i:c_i≠0}`.
- A constant-only class has conductor zero, in agreement with
  ArithmeticGaloisRepresentations §3.7.

*Proof sketch.* The image of `U^(r)` under the Schmid–Witt symbol is computed from the explicit
formula of 4.3 on the topological generators `(1 − aT^i)^(p^j)` of the principal units, which lie
in `U^(r)` exactly when `ip^j ≥ r`, with `j ≥ 0`; thus the least allowed `j` is
`max(0, ⌈log_p(r/i)⌉)`. This nonnegative bound must be retained when passing to a character
quotient; Herbrand's theorem passes to quotients. (Kosters–Wan,
Theorem 4.12, pp. 21–22; Proposition 4.14 and proof, pp. 22–23.)

**Source correction.** The displayed bound in Kosters–Wan Proposition 4.14 omits this clamp,
as does the expression for `φ₁(U^r)` in Theorem 4.12.
The unit generators preceding Theorem 4.12 have nonnegative indices; negative powers of `p`
cannot supply additional units. The conductor formula itself is unchanged.

*Needs:* Layers 3.2 and 4.3; LocalFieldsRamification Layer 3; ClassFieldTheory Layer 7.

**Checks.**

- Every constant class has conductor exponent `0`.
- At length `1` a single coefficient `c_m ≠ 0`, `p ∤ m`, gives `m + 1`.
- At length `2` a sole coefficient `c_m` with `v(c_m) = 1` gives `m + 1`, while a unit coefficient
  gives `pm + 1`; a formula ignoring `v(c_i)` would give `pm + 1` in both cases.
- For `x = β + p[T^(−m)]`, `m > p` prime to `p`, the infinite extension has Galois group
  `ℤ_p` and inertia `pℤ_p`. At `r = 1` the corrected bound is `1`; the unclamped bound is
  at most `0` and incorrectly makes the whole Galois group inertia. A constant-only class
  has `G^r = 0` for every `r ≥ 1`.

### 4.5 Finite ray characters and local-coordinate comparisons

For an effective modulus `m`, use AL.3, *Ramified rank-one curve reciprocity*, for the
ray quotient `C_m = C_K / im U_m`, with
`U_m = ∏_v U_v^{m_v}`, `U_v^0 = O_vˣ` and `U_v^j = 1 + 𝔭_v^j` for `j ≥ 1`.
Its degree and rigidified-Picard comparisons give
`0 → C_m⁰ → C_m → ℤ → 0`, with `C_m⁰` finite. For `m ≠ 0`, the kernel of
`C_m → Pic(X)` is the quotient of `∏_{v|m}(O_v/𝔭_v^{m_v})ˣ` by the image of `kˣ`;
for `m = 0` it is trivial. Finiteness follows from this sequence and finiteness of `Cl⁰`.
Approximation moves a degree-one divisor away from `m`. Fix a class `a ∈ C_m` of
valuation degree `1`, and `r ≥ 1`. The finite quotient `C_m/⟨a^r⟩` fixes the degree direction;
`C_m` itself is infinite. Define RayCharacterData to consist of a finite abelian group `A`,
a specified isomorphism `C_m/⟨a^r⟩ ≅ A`, a character `A → μ_N` for a specified `N ≥ 1`, and
its local restriction maps. These data use the existing ray class group and finite-group
notions. Define rayCharacterData_conductor as the least `m′ ≤ m` whose local unit groups
are killed. Here `U_v^0 = O_vˣ` and `U_v^j = 1 + 𝔭_v^j` for `j ≥ 1`.

The ray-character data and least conductor have the following API:

- The induced global character has finite image.
- A positive local conductor exponent `c` kills `U_v^c` and does not kill `U_v^(c−1)`.
- The exponent is zero exactly when every local unit is killed.
- After the degree splitting, the recorded value at `a` determines the constant-field part.

The local wild cyclic parts use §§3.2 and 4.3–4.4; the prime-to-`p` parts use ClassFieldTheory.
(Milne, Appendix A, A.10–A.11, pp. 134–136, for finite norm quotients;
Kosters–Wan, Proposition 4.14, pp. 22–23, for the wild conductor;
Conrad, *Geometric global class field theory*, §2, pp. 1–3, for the ray-class interpretation.)

For an actual normalized place `v`, consume the local expansion isomorphism
`ι : F_v ≃ κ(v)((T))` from AlgebraicCurves Layer 9, specified by a coefficient-field section
`κ(v) → O_v` and a uniformizer sent to `T`. Prove schmidWitt_localCoordinates: transporting
through `ι` preserves normalized valuations, unit filtrations, the residue conductor and the
self-dual volume of the differential used in Layer 2. Prove schmidWitt_changeParameter:
changing the uniformizer and coefficient section changes reduced representatives and lifts,
but the transported Artin symbol and conductor are unchanged. Both are comparison statements
on the supplied completion, not an identification of the global field with its Laurent-series
completion. (Kosters–Wan, Proposition 4.2, p. 15, and Proposition 4.4 and proof, pp. 15–16, whose
characterization uses every uniformizer; Yoshida, Appendix I, §7, p. 434, for local expansions.)

Prove localCoordinates_truncation: for every `N ≥ 1`, the integral-coordinate map induces
a ring isomorphism `O_v/𝔭_v^N ≃ κ(v)[T]/(T^N)`, compatible with the projections for
`N′ ≤ N`; for `N = 0` both sides are the zero ring. This is the quotient of the supplied
integral expansion isomorphism by the corresponding powers of the maximal ideals
(AlgebraicCurves Layer 9; Yoshida, Appendix I, §7, p. 434).

*Needs:* §§0.1–0.2, 2.1–2.2, 3.1–3.2 and 4.1–4.4; AlgebraicCurves Layer 9; ArithmeticGaloisDuality §R02.3.2;
AlgebraicCurves Layers 3 and 5 (approximation and finite degree-zero classes);
Mathlib finite abelian groups and characters.

**Checks.**

- On `𝔽_q(t)` with `m = 0`, the quotient is `ℤ/r`; a degree character has conductor zero
  regardless of its value on the degree-one class, so that value cannot be reconstructed from
  its restrictions to local units.
- On `𝔽_q(t)`, the degree-zero ray group is trivial for `m = 0`, has order `q−1` for
  `m = [0]+[∞]`, and is the additive group of order `q` for `m = 2[0]`.
  In the last case the classes of `1+cT` modulo `T²` add their coefficients;
  replacing all positive unit depths by the tame quotient misses this wild part.
- For `y^p−y = T⁻¹`, the local character kills `U^2` and not `U^1`; its conductor is `2`,
  whereas an unramified character kills `U^0` and has conductor `0`.
- Omitting the finite degree quotient gives an infinite group and cannot define finite
  RayCharacterData.
- For `F = 𝔽_q(t)`, `v = ∞` and `π_v = t⁻¹`, the local coordinate sends `π_v` to `T`
  and `dt` to `−T⁻² dT`, giving conductor exponent `−2` and `μ(O_v) = q`.
  Sending `t` to `T` reverses the valuation and fails the comparison.
- Modulo `T²`, `(1+T)² = 1+2T`; in characteristic two it is `1`.
  Keeping the quadratic coefficient gives the wrong precision-two multiplication.

### 4.6 Rigidified Picard schemes

Here, and in §4.7, `k` may be any perfect field, `X/k` is a smooth projective geometrically
connected curve of genus `g`, and `m` is any effective divisor, viewed as a finite closed
subscheme of length `N = deg_k m`. Put `U = X − supp(m)`. No point of `X(k)` is chosen.
For `m ≠ 0`, use the degree-`d` part of the rigidified Picard sheaf and its smooth
representing algebraic space from RelativeJacobiansAndIntegralCurveModels §§1.3–1.5.
Its pairs are `(L,ψ)` with `ψ : O_{m_T} ≅ L|_{m_T}`; the supplier uses this same direction.
For `m=0`, use SchemeAndStackFoundations §3.6's ordinary relative Picard sheaf.
Write `Pic_m^d` for these spaces and `J_m=Pic_m^0`. The supplied unit sequence and
universal rigidified family are used with tensor, dual and base change as supplied.

Prove generalizedPicard_schemeStructure: each component is a smooth separated
geometrically connected scheme, `J_m` is a commutative algebraic group and `Pic_m^d`
is a `J_m`-torsor under tensor product. Its dimension is `g+N−1` for `N>0`, and `g`
for `m=0`. The forgetful maps `Pic_{m′}^d → Pic_m^d` for `m≤m′` are morphisms of
these schemes, compatible with composition, tensor and field extension. This adds
scheme representability and this structure to the supplied algebraic spaces.

For `m≠0`, use the supplied exact unit sequence

```text
1 → 𝔾_m → Res_{m/k} 𝔾_m → J_m → J → 0,
```

where `J=Pic_X^0` and the boundary of `u` is `(O_X,u)`. Prove
generalizedJacobian_linearStructure: the kernel of `J_m → J` is smooth connected
affine of dimension `N−1`. Over an algebraic closure, with `r=#supp(m_k̄)`, its torus
quotient has rank `r−1` and its unipotent kernel has dimension `N−r`; the unit filtration
has additive successive quotients. The unipotent group need not be a product of
additive groups. At `m=0`, the forgetful map is the identity with zero kernel.

*Proof sketch.* After a finite separable field extension splitting a point of `m`,
normalize the ordinary Poincaré bundle there. With `A` the rank-`N` algebra of `m` and
`M` its restricted universal line bundle, normalized generating sections satisfy
`λ(β)=1` and `Aβ=M`, where evaluation at the chosen point is `λ : M → O`.
The generator condition inverts the determinant of `A → M`, `a ↦ aβ`, so this is an
affine open in a rank-`N−1` affine bundle. The supplied rigidified space is therefore
affine over the ordinary Picard scheme after this extension; affine descent makes it
a scheme over `k`. The supplied unit sequence identifies its geometric fibers with
units modulo scalars; splitting the Artin algebra gives the dimension and structure.
(Guignard, §4.7, Proposition 4.8 and Lemma 4.9, pp. 1317–1319; Conrad, §2, pp. 1–3.)

*Needs:* RelativeJacobiansAndIntegralCurveModels §§1.3–1.5; SchemeAndStackFoundations
§§1.1, 3.3 and 3.6; ModularCurves Layer 0E (affine descent); JacobianChallenge Layers
A–C; ReductiveGroupsPartII RG2.0a.

**Checks.**

- At `m = 0`, both the functor and `Pic_m^d` are the ordinary Picard sheaf and its degree
  component. The expression `g+N−1` is not used at `N=0`.
- If `m` is one rational point, normalizing the fiber removes scalar automorphisms and
  `Pic_m^d ≅ Pic_X^d`; `J_m → J` has zero-dimensional trivial kernel, not a new `𝔾_m`.
- On `ℙ¹`, `m=[0]+[∞]` gives `J_m=(𝔾_m²)/𝔾_m ≅ 𝔾_m`. For `m=2[∞]`, a normalized
  unit is `1+bT` modulo `T²`, and multiplication adds `b`, so `J_m ≅ 𝔾_a` in every
  characteristic, including two. Inverting the coordinate gives the same test at `2[0]`.
- A single closed point of degree two has, after separable closure, two points in its support;
  its kernel is `Res_{κ(v)/k} 𝔾_m/𝔾_m`, a one-dimensional torus, not `𝔾_a`.
  This tests degree and field extension in the functor and in both representing schemes.
- On the real conic `x²+y²+z²=0`, take a closed point `m` of degree two. There is no
  real degree-one line bundle, so `Pic_m^1(ℝ)=∅`, although the ordinary relative
  `Pic_X^1` has a real point with a nonzero Brauer obstruction. The construction gives
  a torsor without promising a rational point. Finite-field points are established in §4.8.

### 4.7 The ray Abel map and Rosenlicht's universal property

Over every perfect field, form the ray Abel map `α_m : U → Pic_m^1` by `x ↦ (O(x),1|_m)` when `m ≠ 0`, and by the ordinary
Abel map when `m=0`. Over finite fields this is AL.3's supplied Abel map. Extend its
base-change and forgetful compatibilities and its additive maps `Sym^n U → Pic_m^n`
to the perfect-field setting, compatible with addition of divisors
and with `n=0,1`. For `m ≠ 0` and `n ≥ max(0,2g+N−1)`, prove
rayAbel_affineBundle: this map is a torsor under the vector bundle
`pr_* L_univ(−m)` of rank `n−N−g+1`, hence smooth surjective with geometrically connected
fibers. Indeed, the base-change-compatible exact sequence
`0 → pr_*L(−m) → pr_*L → pr_*(L|_m) → 0` identifies its fiber with the inverse image of
the universal rigidification. Every such section is nonzero on every curve fiber and cuts
out an effective degree-`n` divisor disjoint from `m`. The `m=0` projective-bundle form is
§3.7, `abelMaps_highDegree`, with its descent when there is no rational point. (Guignard, Propositions
4.11–4.12, pp. 1319–1320, and Proposition 4.14 and proof, pp. 1320–1321.)

Let `G` be a smooth connected commutative algebraic group over the perfect field `k`, `Q` a
`G`-torsor, and `u : U → Q` a morphism. Say that `u` has modulus `m` when, after every
algebraically closed field extension, `u(div f)=0` for every rational function `f` with
`f ≡ 1 mod m`. Its divisor is supported in `U`; at `m=0` every nonzero `f` is allowed.
For a degree-zero divisor, the sum of values in the torsor is a well-defined element of
`G`, independent of a temporary choice of origin in `Q`.
Prove rayAbel_rosenlicht: `u` has modulus `m` if and only if there is a unique pair
of a group homomorphism `h : J_m → G` and an `h`-equivariant morphism
`h¹ : Pic_m^1 → Q` such that `u = h¹ ∘ α_m`. The modulus and Abel-map API is:

- Modulus and the induced maps commute with field base change.
- Composition with a homomorphism of torsors preserves the modulus and composes the induced maps.
- Enlarging the modulus and restricting the open set preserves the modulus relation.
- The factoring pair is unique and compatible with all three operations.

This is the universal property for a specified modulus; it is stated over
perfect fields, not only finite fields. (Russell, §3.3, p. 34, for the principal-congruence
form of Rosenlicht's property; the following proof uses the preceding Abel-bundle theorem.)

*Proof sketch.* Over an algebraic closure, sum `u` on `Sym^n U`, with values in the `n`-fold
contracted product of `Q`. Two effective divisors in a fiber of the ray Abel map differ by
`div f` with `f ≡ 1 mod m` (with no condition at zero modulus). The modulus relation makes
their images equal. In high degree, the Abel map is smooth surjective with geometrically
reduced fibers, so equality on geometric points gives equality on its fiber product;
fppf descent gives a morphism on `Pic_m^n`. Addition of effective divisors makes these
morphisms compatible as `n` increases. Translate by high-degree divisors and subtract their
values to obtain `h` on `Pic_m^0` and `h¹` on `Pic_m^1`. Every divisor class is a difference
of effective classes in arbitrarily high degrees, so the resulting maps are independent
of the translation, are equivariant and are unique. Uniqueness descends them to `k`.
Conversely, the rigidified bundle associated to `div f` with `f ≡ 1 mod m` is the unit,
so any such factorization kills that divisor. This proof uses no fundamental-group
invariance for affine bundles.

*Needs:* §4.6; AL.3, *Ramified rank-one curve reciprocity* (the finite-field Abel map);
JacobianChallenge Layers A–C (coherent cohomology and base change);
SchemeAndStackFoundations §§1.1 and 3.7 (descent and ordinary Abel maps).

**Checks.**

- At `m=0`, the Abel map and universal property recover the ordinary Picard torsor and
  Albanese property. On `ℙ¹`, its degree-zero group is trivial and a map with modulus zero
  to a commutative group torsor is constant.
- On `ℙ¹`, `m=[0]+[∞]`, trivialize degree zero using `[1]`. For
  `D=[c]−[1]`, multiplication by `(t−c)/(t−1)` carries its canonical rigidification to
  `(c,1)`. In the coordinate `u_0/u_∞` on `J_m`, the Abel map is `c ↦ c`, and `t : 𝔾_m → 𝔾_m`
  satisfies the modulus relation. Inversion would fail this factorization test.
- On `ℙ¹`, `m=2[∞]`, put `T=t⁻¹` and translate by `[0]`. Normalize a rigidification to
  `1+bT` and use coordinate `−b` on `J_m ≅ 𝔾_a`. The divisor `[c]−[0]` is principal with
  function `1−cT`, so the Abel map is `c ↦ c`. The map `t : 𝔸¹ → 𝔾_a` has modulus `2[∞]`:
  the coefficient of `T` in the principal congruence relation forces the sum of its values
  to be zero. It fails modulus `[∞]`, since `(t−1)/t ≡ 1 mod T` but
  `u([1]−[0])=1`. This also works in characteristic two.
- For positive `m`, a high-degree Abel fiber has dimension `n−N−g+1`; for
  `ℙ¹,m=2[∞],n=1` it is a point, and for `n=2` it is an affine line. The latter has
  nontrivial Artin–Schreier covers in characteristic `p`. Connected fibers alone do not
  identify finite étale covers of the total space and base.
- For an elliptic curve and `m=[P]`, the degree-one map from `X−{P}` misses the class
  of `P`. Thus surjectivity cannot be asserted below `n≥2g+N−1=2` in general.

### 4.8 Ray classes as rational rigidified line bundles

Return to `k=𝔽_q`, with `q` any prime power, including powers of two, and the exact-constant
curve of §0. Consume AL.3, *Ramified rank-one curve reciprocity*, for the degree-preserving
isomorphism `C_m ≅ ⨿_{d∈ℤ} Pic_m^d(k)`, its degree-zero identification with `J_m(k)`,
its degree-one torsor comparison and its modulus, tensor and divisor compatibilities.
In particular `Pic_m^1(k)` is nonempty, even when `U(k)` is empty; no effective degree-one
divisor is assumed.

Prove rayPicard_coordinateComparison: in the convention `O_m → L|_m` of §4.6, the
supplied comparison sends an idele `b` to `O(D)`, `D=Σ_v ord_v(b_v)[v]`, with
rigidification section `b_v⁻¹` at each `v|m`. Thus a local unit `u` maps to `(O,u⁻¹)`,
whereas the boundary in the supplied unit sequence is `(O,u)`. Approximation gives a
meromorphic section with the prescribed jets, and changing that section by a function
congruent to one preserves the pair; this identifies the convention with the supplied
ray-class isomorphism. The inverse direction for the rigidification must not be substituted
without also inverting its section. (Conrad, §2 and Theorem 3.2, pp. 1–4; Guignard,
§4.7, pp. 1317–1318.)

*Needs:* AL.3, *Ramified rank-one curve reciprocity*; §4.6; AlgebraicCurves Layers 3–5
(divisors and approximation).

**Checks.**

- On `ℙ¹`, `m=0`, the full group is `ℤ`, its degree-zero part is zero and its degree-one
  fiber is a singleton. Replacing the full group by `J_m(k)` loses constant characters.
- For `m=[0]+[∞]`, the divisor `[c]−[1]` maps to `c` in the multiplicative coordinate of
  §4.7, while an idele with local unit `λ` at zero and one elsewhere maps to `λ⁻¹`.
  Over `𝔽_5`, `λ=2` therefore gives `3`, not `2`.
- For `m=2[∞]`, a local idele unit `1+bT` maps to rigidification `1−bT` modulo `T²`,
  hence to `b` in the additive coordinate of §4.7. The degree-zero ray group has order
  `q`, and forgetting to `[∞]` kills it. The same inversion computation is valid at `p=2`.
- A degree-one divisor need not be effective, and need not be a rational point outside
  `m`. Using an effective degree-one divisor as the degree splitting would impose an
  extra hypothesis on `X`; the comparison imposes none.

### 4.9 Lang ray covers, Frobenius and geometric connectedness

Choose `a ∈ Pic_m^1(k)` and put `A=J_m(k)`. Use AL.3, *Ramified rank-one curve
reciprocity*, for the Lang isogeny `L_m(y)=Frob_q(y)−y` with kernel `A` and its pullback
along `α_a(x)=α_m(x)−a`. Denote the supplied torsor by `Y_{m,a} → U`; its deck action
is translation on `y`. Its finite étaleness, modulus compatibilities and geometric
connectedness are part of that supplied geometric construction and comparison.

Prove rayLang_coordinateComparison: with §4.8's coordinates, arithmetic Frobenius at
a degree-`d` closed point `v∈U` translates by `[v]−d·a`, and its Artin character is
`b ↦ [b]_m−deg(b)·a` from `C_K` to `A`. Sum the Lang equation over the `d`
conjugates of a geometric point: the left side is `Frob_q^d(y)−y`, and the right side
is `[v]−d·a`. The supplied finite-cover comparison then gives the displayed Artin
character. Geometric Frobenius has the opposite translation. The rank-one local-system
convention in AL.3 evaluates a character on inverse arithmetic Artin, so it inverts
these deck eigenvalues. (Conrad, Theorem 3.2, p. 4.)

*Needs:* AL.3, *Ramified rank-one curve reciprocity*; ArithmeticGaloisDuality §R02.3.2;
§§4.6–4.8; ReductiveGroupsPartII RG2.3.7 for the supplied Lang isogeny.

**Checks.**

- On `ℙ¹`, `m=0`, `A=0` and the Lang cover is the identity, which is geometrically
  connected. Constant extensions will come from the degree factor in §4.10.
- For `m=[0]+[∞]`, `a=[1]`, the equation is `z^(q−1)=t` over `𝔾_m` and the deck group is
  `𝔽_qˣ`. Over `𝔽_5`, the fiber at `t=2` satisfies `z^5=2z`: arithmetic Frobenius
  multiplies by `2`, while geometric Frobenius multiplies by `3`. At `q=2` the group is
  trivial and the equation gives the identity cover, although `J_m=𝔾_m` remains nontrivial.
- For `m=2[∞]`, `a=[0]`, the equation is `y^q−y=t`, with additive deck group `𝔽_q`.
  At `q=3,t=1`, arithmetic Frobenius translates by `1`, not `−1=2`. At `q=2` this is a
  nontrivial degree-two geometrically connected cover, so the construction retains wild
  ramification in characteristic two.
- Replacing `a` by `a+b`, `b∈A`, subtracts `d b` from the Frobenius value at degree `d`.
  The geometric Lang cover can change by a constant twist; it is the full ray character,
  including its degree-one value, that is independent of this splitting.
- Over `𝔽_3`, take `m=2[∞]`, `a=[1]` and the degree-two place `t²+1`. The Lang equation
  is `y³−y=t−1`, and `Frob_9(y)−y=Tr_{𝔽_9/𝔽_3}(t−1)=−2=1`. Replacing `d·a` by `a`
  would instead give `−1=2`; the degree multiplier is essential even on `ℙ¹`.

### 4.10 Finite ray characters, constant covers and least conductors

Let `B` be any finite abelian group and `θ : C_m → B` a homomorphism. Choose `r≥1` killing
`θ(a)`, where the degree-one ray class `a` and its Picard point are identified by §4.8.
Extend AL.3's finite rank-one character dictionary to arbitrary finite abelian `B`.
Form its `B`-torsor by pushing out the product of the supplied `Y_{m,a}` and
the constant cover `U_{𝔽_{q^r}} → U` along

```text
A × ℤ/r → B,       (x,j) ↦ θ(x) + j·θ(a).
```

This is a finite étale `B`-torsor. Its construction API is:

- A homomorphism of finite abelian groups pushes out the torsor and its Artin character.
- The generic character is the specified composition of `θ` with `C_K→C_m`.
- If `θ` factors through a smaller ray quotient, construction at the larger modulus
  agrees with restriction of the smaller-modulus cover.
- Its isomorphism class is independent of `r` and the degree splitting.

A torsor can have deck automorphisms, so no uniqueness of an unpointed isomorphism is asserted. The Artin character of this construction is `θ`
composed with `C_K → C_m`, by §4.9 and the arithmetic Frobenius degree convention.

Prove finiteRayLangCover_classifies, the arbitrary-finite-abelian-group extension:
the construction is a bijection between
`Hom(C_m,B)` and isomorphism classes of finite étale `B`-torsors on `U` whose generic
characters kill every `U_v^{m_v}`. Conversely, a torsor gives its continuous finite
Galois representation; finite Artin reciprocity and local compatibility give the map
on `C_K`, and the unit condition makes it factor through `C_m`. Equality of the generic
representations gives an isomorphism on `U`, since `U` is normal. This proves surjectivity
and injectivity, including disconnected torsors. For a surjective `θ`, the associated
connected abelian cover has exact constant field
`𝔽_{q^c}`, where `c=[B:θ(C_m^0)]`; its geometric monodromy is `θ(C_m^0)`.
Thus finiteRayLangCover_connected says connectedness is equivalent to surjectivity
of `θ`, and finiteRayLangCover_geometricallyConnected says geometric connectedness is
equivalent to `θ(C_m^0)=B`. A nonsurjective map gives `[B:im θ]` connected components.
Prove finiteRayLangCover_normGroup: if `θ` is onto and `L/K` is the constructed field
cover, `N_{L/K} C_L` is the inverse image of `ker θ` in `C_K`, and `[L:K]=|B|`.
This follows by applying the supplied finite Artin isomorphism to this actual extension.
For an open finite-index `H≤C_K`, choose `m` with `im U_m≤H` and take
`B=C_K/H`. The resulting cover realizes the arithmetic class field of `H` by the
stated Lang and constant-cover construction; uniqueness in a fixed separable closure is
the supplied class-field uniqueness. The proof uses finite reciprocity for constructed
extensions and does not assume existence in order to construct these covers.

Use AL.3's least-conductor comparison on each character of `B`. Prove its
finite-abelian-group extension rayLangCover_conductor: the least modulus for this torsor (or for its connected
field cover when `θ` is onto) has local exponent the least `j≥0` killing `U_v^j` under
`θ`. Equivalently it is the componentwise maximum of the conductors of all characters
`χ∘θ`, `χ : B → ℚ/ℤ`. Exponent zero means unramified, and an exponent `j>0` kills
`U_v^j` but not `U_v^(j−1)`. This is the conductor of RayCharacterData in §4.5; its
wild part is computed by §§4.3–4.4 and its tame part by ClassFieldTheory. Prove
rayLangCover_modulusFactor: factorization through `C_{m′}`, `m′≤m`, is equivalent to
that conductor dividing `m′`, and to being obtained from the finite-ray construction
for `m′` with its specified ramification bound. Extension of the underlying finite étale
cover to `X − supp(m′)` detects only disappearance of ramification at removed support
points; it cannot detect a decrease between two positive exponents. The input modulus
need not be least.
The proof uses §4.9's coordinate comparison, the supplied rank-one conductor theorem
and the local norm/ramification correspondence; it
does not infer unramifiedness from Swan conductor zero, which also allows tame ramification.
(Conrad, Theorem 3.2, p. 4; Milne ADT, Appendix A, Corollaries A.8–A.9,
pp. 132–133, Lemma A.10 and Propositions A.11–A.12, pp. 134–136, for finite
Artin/norm quotients over finite constants; Kosters–Wan, Proposition 4.14,
pp. 22–23, with the correction of §4.4, for the local wild filtration.)

**Checks.**

- On `ℙ¹`, `m=0`, reduction of degree modulo `r>1` gives the connected constant cover
  `ℙ¹_{𝔽_{q^r}} → ℙ¹`. Its conductor is zero and it has `r` geometric components. The
  norm subgroup is `deg⁻¹(rℤ)`, not the whole degree-zero kernel. The trivial character
  gives the identity cover; with a larger specified group `B`, the
  zero homomorphism gives the disjoint trivial `B`-torsor.
- The cover `z^(q−1)=t` has least modulus `[0]+[∞]` when `q>2`: it is tamely ramified
  at both points, with exponent one and Swan zero. At `q=2` it is the identity cover
  and its least modulus is zero. A rule returning the input modulus fails this test.
- The cover `y^q−y=t` has least modulus `2[∞]`. Every nontrivial additive character
  reduces to a length-one Artin–Schreier character with a simple pole, of conductor two.
  Its group has order `q`, its constant degree is one, and this holds for every `q`,
  including `2`. Replacing `2[∞]` by `[∞]` would discard the cover. In particular `y^p−y=t`
  is already finite étale on `𝔸¹` for both moduli `2[∞]` and `[∞]`, but its character
  factors through only the former ray group: identical opens do not detect multiplicity.
- If `θ(C_m^0)=0` and `θ(a)` generates `B`, the torsor is connected with constant degree
  `|B|`; if `θ(C_m^0)=B`, it is geometrically connected irrespective of `θ(a)`.
  A proper image of `θ` gives a disconnected torsor even though every local conductor
  can still be correctly bounded: `B=ℤ/4`, `θ(D)=2 deg D` gives two connected components,
  each a constant quadratic cover. These test all three monodromy conditions separately.
- Changing `a` to `a+b` changes the geometric Frobenius term by `−d·θ(b)` and the
  constant term by `+d·θ(b)`. Their sum is still `θ([v])`, so the complete torsor and
  its least conductor do not depend on this auxiliary choice.

### Examples

Over `𝔽_3((T))`: the length-one class of `[T^(−2)]` has conductor exponent `3`; the length-two class
of `[T^(−2)]` has exponent `1 + 2·3 = 7`; the length-two class of `3·[T^(−2)]`, whose coefficient
has `v = 1`, has exponent `3`.

The geometric examples on `ℙ¹` distinguish ordinary, tame, wild and constant covers.
With degree-one classes `[1]` for `[0]+[∞]` and `[0]` for `2[∞]`, the two Lang equations
are `z^(q−1)=t` and `y^q−y=t`. Their rational-fiber Frobenius actions are multiplication
by `t` and addition of `t`. A constant extension of degree `r` instead sends a degree-`d`
place to `d mod r`; it has conductor zero and has geometric monodromy zero.
For the combined modulus `[0]+2[∞]`, the unit calculation gives `J_m ≅ 𝔾_m × 𝔾_a`.
Quotients of the product of the two displayed Lang covers and a suitable constant cover
therefore realize all finite ray-character data for this modulus, including the degree value.

### Dependencies

Layers 0, 2 and 3; LubinTateFormalModulesAndQuasiCanonicalLifts LT.0–LT.2;
ClassFieldTheory Layers 4–8; LocalFieldsRamification Layer 3;
AlgebraicCurves Layers 3, 5 and 9; ArithmeticGaloisDuality §R02.3.2; Mathlib `FormalGroup`.
The geometric branch also uses AlgebraicCurves Layers 8 and 12, JacobianChallenge Layers
A–C, SchemeAndStackFoundations §1.1, §§3.3, 3.6–3.7, ReductiveGroupsPartII RG2.0a and RG2.3.7,
RelativeJacobiansAndIntegralCurveModels §§1.3–1.5, and AL.3's
*Ramified rank-one curve reciprocity*. No result of
GlobalShtukasAndFunctionFieldLanglands is an input.

## Layer 5: zeta functions and `L`-polynomials of function fields

Here `k = 𝔽_q`, `hF : IsFunctionField k F` and `IsIntegrallyClosedIn k F`. The zeta function is
defined from divisors of the function field, with no scheme and no cohomology; its comparison with
the scheme-theoretic zeta function of WeilConjectures WC.1 and with the Jacobian numerator of
DeligneWeightsAndPurity §1.6 is a theorem of this layer (5.4). The Riemann hypothesis for curves (the inverse roots of
`L` have absolute value `√q`) is imported from DeligneWeightsAndPurity §1.6 and
SchemeAndStackFoundations §5.11 *Weil bound via surfaces*, never derived here.

### 5.1 The zeta series, its Euler product and point counts

Define `effectiveDivisorCount n := #{D : Divisor k F | D effective, deg D = n}` (finite by
`TauCeti.Divisor.finite_setOf_isEffective_degree_le`), the zeta series
`zeta F := Σ_{n ≥ 0} effectiveDivisorCount n · T^n ∈ ℤ[[T]]`, `placeCount d := #{v : deg v = d}`
(finite by AlgebraicCurves Layer 5) and `pointCount r := Σ_{d ∣ r} d · placeCount d` for `r ≥ 1`.
Prove `zeta_eulerProduct`: `zeta F = ∏_v (1 − T^(deg v))⁻¹` as formal power series (each coefficient
involves only finitely many places, so the product converges `T`-adically); `zeta_logDeriv`: for
every `r ≥ 1`,

```text
r · A_r = Σ_{i=1}^{r} N_i · A_{r−i},       A_n = effectiveDivisorCount n,  N_i = pointCount i,
```

equivalently `T·Z′/Z = Σ_{r≥1} N_r T^r`, and over `ℚ`, `log Z = Σ_{r≥1} N_r T^r / r`; and
pointCount_eq: `N_r` equals the number of places of degree one of the constant extension
`F·𝔽_{q^r}` and the number of `𝔽_{q^r}`-points of the regular projective model of `F`.

The counting definitions have the following API:

- The zero divisor is the only effective divisor of degree zero, so `A_0 = 1` and
  the constant coefficient of the zeta series is one.
- For the rational function field, `N_r = q^r + 1` for `r ≥ 1`.
- For `r,s ≥ 1`, the constant extension has `N_r(F·𝔽_{q^s}) = N_{rs}(F)`.
- For `r ≥ 1`, Möbius inversion gives `r · placeCount r = Σ_{d ∣ r} μ(r/d) N_d`.

*Proof sketch.* An effective divisor is a unique finite sum of places with multiplicities, which is
the coefficientwise expansion of the Euler product. Differentiating logarithmically gives
`Σ_v d_v T^(d_v)/(1 − T^(d_v))`, whose `r`-th coefficient is `Σ_{d∣r} d · placeCount d`. A place of
degree `d` splits in `F·𝔽_{q^r}` into `gcd(d, r)` places of degree `d / gcd(d, r)` (AlgebraicCurves
Layer 8: a constant extension is unramified and composes residue fields, `F″_{P″} = F_P·𝔽_{q^r}`),
and the degree-one ones are counted by `d ∣ r`. (Roquette, *Class field theory in
characteristic p*, equation (4), p. 22, for the Euler product; §4.3.3, pp. 25–26,
for the zeta-function setting.)

*Needs:* Tau Ceti `Divisor.finite_setOf_isEffective_degree_le`, `Place.degree`,
`Place.one_le_degree_of_isFunctionField`; AlgebraicCurves Layers 5, 8 and 12; Layer 0.1.

**Checks.**

- For `F = 𝔽_q(t)`: `A_n = (q^(n+1) − 1)/(q − 1)`, `zeta = 1/((1 − T)(1 − qT))` and
  `N_r = q^r + 1` (the monic irreducible polynomials together with `∞`).
- A place of degree two contributes first in `T²` and contributes `2` to `N_2` but nothing to
  `N_1`; counting places instead of points (`N_r = placeCount r`) breaks `zeta_logDeriv` at
  `r = 2`.
- `A_0 = 1`, and the empty divisor is the unique effective divisor of degree `0`; a definition
  counting divisor classes instead of divisors would give `h` for large degrees and fail at `𝔽_q(t)`.
- At index zero `pointCount 0 = 0`, while `A_0 = 1`; zero is not an extension-field degree.
- On `ℙ¹`, `placeCount 0 = 0`, `placeCount 1 = q+1` and
  `placeCount 2 = (q²-q)/2`. Thus `pointCount 2 = (q+1)+2·(q²-q)/2 = q²+1`, whereas
  `effectiveDivisorCount 2 = q²+q+1`. These three counts are different; confusing any two
  changes the second coefficient of the zeta series or its logarithmic derivative.

### 5.2 Effective divisors in large degree

Prove effectiveDivisorCount_eq: for every `n ≥ 0`,
`A_n = Σ_{[C] : deg C = n} (q^(ℓ(C)) − 1)/(q − 1)`, the sum over divisor classes of degree `n`,
and there are exactly `h` such classes for every `n ∈ ℤ`. Consequently, for `n > 2g − 2`
(`effectiveDivisorCount_of_large`, stated in the cleared form `(q − 1)·A_n = h·(q^(n + 1 − g) − 1)`),

```text
A_n = h · (q^(n + 1 − g) − 1)/(q − 1).
```

*Proof sketch.* Effective divisors linearly equivalent to `C` correspond to the lines in `L(C)`,
there are `(q^(ℓ(C)) − 1)/(q − 1)` of them. Translation by a degree-one divisor class
(Layer 0.2) identifies the classes of each degree with `Cl⁰(F)`. For `n > 2g − 2`,
`ℓ(C) = n + 1 − g` (AlgebraicCurves Layer 5). (Roquette, §4.3.3, p. 27, for the grouping by
classes.)

*Needs:* Layers 0.2 and 5.1; AlgebraicCurves Layers 3–5; Tau Ceti `Divisor.classNumber`,
`Divisor.finite_ker_degreeClass`.

**Checks.**

- For `𝔽_q(t)`, `h = 1`, `g = 0`: `A_n = (q^(n+1) − 1)/(q − 1)` for all `n ≥ 0`.
- For an elliptic function field (`g = 1`): `A_n = h(q^n − 1)/(q − 1)` for `n ≥ 1`, so
  `A_1 = h = N_1`, the number of rational places.
- Without Layer 0.2 the classes of degree `n` could be empty (they are, for `n` not divisible by
  the gcd of the place degrees); over a finite field this never happens.

### 5.3 Rationality, functional equation and the class number

Write `L_F=(1 − T)(1 − qT)Z_F`. Prove `zeta_rationality`: `L_F` is a
polynomial `L(T) = Σ_{j=0}^{2g} a_j T^j ∈ ℤ[T]` of degree exactly `2g` with

```text
a_0 = 1,   a_1 = N_1 − (q + 1),   a_{2g} = q^g,   a_{2g−j} = q^(g−j) a_j  (0 ≤ j ≤ g),
L(1) = h,   L(T) = q^g T^(2g) L(1/(qT)).
```

Equivalently `Z(T) = L(T)/((1 − T)(1 − qT))` and `Z(1/(qT)) = q^(1−g) T^(2−2g) Z(T)`.

*Proof sketch.* Split the sum of 5.2 at degree `2g − 2`: the classes of degree at most `2g − 2`
give a polynomial, and the classes of larger degree give two geometric series whose sum has
denominator `(1 − T)(1 − qT)`. For the functional equation, pair each class `C` with `W − C` for a
canonical class `W` (degree `2g − 2`): Riemann–Roch gives `ℓ(C) − ℓ(W − C) = deg C + 1 − g`, which
interchanges the two halves of the sum. After cancellation in this rational expression, evaluating the polynomial numerator
at `T=1` gives `h` from the geometric-series residue; no value of `Z(1)` is taken. (Roquette, §4.3.3, p. 26 (rationality, residue and
functional equation), p. 27 (the class-sum argument) and p. 28 (the numerator, its degree `2g` and
`a_1 = N_1 − (q + 1)`).)

*Needs:* Layers 0.2, 5.1 and 5.2; AlgebraicCurves Layer 4 (Riemann–Roch and the canonical class);
Tau Ceti `genus`, `Divisor.classNumber`.

**Checks.**

- For `g = 0`: `L = 1`.
- For `g = 1`: `L = 1 + (N_1 − q − 1)T + qT²` and `L(1) = N_1 = h`.
- The leading coefficient is `q^g`, not `1`; a numerator normalized to be monic would violate
  `L(0) = 1`.

### 5.4 Comparison with the scheme zeta function and the Jacobian

Prove zeta_eq_schemeZeta: `zeta F` equals the zeta function `Z(X, T)` of the regular projective
model `X` (WeilConjectures WC.1, the closed-point Euler product), and `L_F`
equals the curve numerator of WeilConjectures WC.1 (`curve_zeta_numerator_without_rh`) and the
reversed characteristic polynomial `P^rev_{π_J}` of the Frobenius endomorphism of the Jacobian
(DeligneWeightsAndPurity §1.6). Consequently `N_r = q^r + 1 − Σ_{i=1}^{2g} α_i^r` with
`L(T) = ∏_i (1 − α_i T)`, `|α_i| = √q` for every complex embedding, `#J(𝔽_q) = L(1) = h`, and
`|N_r − q^r − 1| ≤ 2g q^(r/2)`.

*Proof sketch.* Closed points of `X` are places, with the same degrees (AlgebraicCurves
Layer 12), so the two Euler products agree term by term. The identification of the numerators is
then forced by equality of the power series. The root bound and the Jacobian identification are
DeligneWeightsAndPurity §1.6; this layer's divisor-theoretic rationality (5.3) and the
cohomological numerator of WeilConjectures WC.1 are compared through their actual Euler products.

*Needs:* Layers 5.1–5.3; DeligneWeightsAndPurity §1.6; WeilConjectures WC.1;
AlgebraicCurves Layer 12.

**Checks.**

- For `y² = x³ + x + 1` over `𝔽_5`: `N_1 = 9`, `L = 1 + 3T + 5T²`, inverse roots of absolute value
  `√5` (discriminant `9 − 20 < 0`), and `h = L(1) = 9`.
- For `𝔽_q(t)`, `L = 1` and `N_r = q^r + 1` exactly.
- An identification of `L` with the non-reversed characteristic polynomial would give leading
  coefficient `1` and constant term `q^g`.

### 5.5 Constant field extensions

Prove lPolynomial_constantExtension: for `r ≥ 1`,
`L_{F·𝔽_{q^r}}(T^r) = ∏_{ζ^r = 1} L_F(ζT)`, equivalently the inverse roots of `L_{F·𝔽_{q^r}}` are
the `α_i^r`; and zeta_constantExtension: `Z_{F·𝔽_{q^r}}(T^r) = ∏_{ζ^r=1} Z_F(ζT)`.

*Proof sketch.* Compare Euler factors: a place of degree `d` splits into `gcd(d, r)` places of
degree `d/gcd(d, r)` in `F·𝔽_{q^r}` (from the unramifiedness of constant extensions and the
composition of residue fields in AlgebraicCurves Layer 8), and
`∏_{ζ^r = 1}(1 − (ζT)^d) = (1 − T^(dr/e))^e` with `e = gcd(d, r)`. (Roquette, equation (4), p. 22, for the Euler product;
AlgebraicCurves Layer 8 for the constant-extension splitting law.)

*Needs:* Layers 5.1 and 5.3; AlgebraicCurves Layer 8.

**Checks.**

- For `y² = x³ + x + 1` over `𝔽_{25}`: `N_2 = 27` and `L = 1 + T + 25T²` (since `α + β = −3`,
  `αβ = 5` give `α² + β² = −1`).
- For `r = 1` both identities are tautologies. For `𝔽_q(t)` both sides of the numerator
  identity are `1`; the zeta identity instead gives `1/((1 − T^r)(1 − q^r T^r))`.
- Substituting `T` instead of `T^r` on the left gives a polynomial of the wrong degree `2g` versus
  `2gr`.

### 5.6 Recovering the `L`-polynomial from `g` point counts

Define `IsLPolynomialData q g N P` for `P ∈ ℤ[T]` and `N : ℕ → ℤ`: `P(0) = 1`, `deg P ≤ 2g`,
`a_{2g−j} = q^(g−j) a_j` for `0 ≤ j ≤ g`, and the Newton identities
`r · a_r = Σ_{i=1}^{r} (N_i − q^i − 1) a_{r−i}` for `1 ≤ r ≤ g`. Prove `lPolynomial_isLPolynomialData`
(`L_F` satisfies it with `N = pointCount`) and `IsLPolynomialData.unique` (two polynomials
satisfying it for the same `q, g, N_1, …, N_g` are equal). Hence the counts `N_1, …, N_g` determine
`L_F`, `h` and every `N_r`.
The polynomial-data API is:

- Only the values `N_1,…,N_g` affect the predicate; changing the other entries preserves it.
- The normalization and symmetry give the coefficient `a_{2g}=q^g`; when `q>0` the degree is
  exactly `2g`, including degree zero at `g=0`.
- The Newton identities determine the first `g` coefficients over `ℤ`, and reciprocal symmetry
  determines the rest, as expressed by `IsLPolynomialData.unique`.

*Proof sketch.* The Newton identities are the first `g` coefficients of `T·L′/L = Σ (N_r − q^r − 1)T^r`
(5.1 divided by the denominator), and they determine `a_1, …, a_g` recursively because the
coefficient of `a_r` is `r`, nonzero in `ℤ`; the functional equation (5.3) gives the remaining
coefficients. WeilConjectures WC.5 states the general recurrence for a factor of known degree from
its first `b` moments; the functional equation halves the number needed. (Roquette, §4.3.3, p. 28,
for `a_1 = N_1 − (q + 1)`.)

*Needs:* Layers 5.1 and 5.3; WeilConjectures WC.5 *Recurrences and Newton recovery*.

**Checks.**

- `g = 0`: no count is needed and `P = 1`.
- The total polynomial predicate also permits `q=0,1`: with `g=1,N_1=9`, its polynomials
  are `1+8T` and `1+7T+T²`, respectively. These are not finite-field zeta data.
- `q = 5`, `g = 1`, `N_1 = 9`: the unique solution is `1 + 3T + 5T²`.
- Pairing `N_1 = 8` with `1 + 3T + 5T²` fails the predicate. Pairing it with
  `1 + 2T + 5T²` passes, but this is not the polynomial of the displayed curve.
  The counts must be proved to equal the point counts of the specified curve.

### 5.7 `L`-functions of local systems with finite coefficients

For a perfect complex `C` over a commutative ring `A` and a derived endomorphism `u`,
define its **characteristic series** in `1 + T A[[T]]` as the scalar by which `1−Tu`
acts on the supplied determinant line of `C ⊗_A^L A[[T]]`. A strictly perfect
representative gives the invertible chain map `1−Tu`, with inverse `Σ_{j≥0} T^j u^j`.
Its API is:

- The series is independent of the strictly perfect representative and chain lift.
- It commutes with arbitrary ring base change.
- A shift by one inverts the series.
- When cohomology is finite projective it equals
  `∏_i det(1−Tu | H^i C)^((−1)^i)`.

This characteristic-series bridge uses PadicMeasuresIwasawaAlgebras §5.1's determinant
functor and its canonical quasi-isomorphism, acyclic and base-change identifications;
no new determinant-line construction is made.
(Stacks, Tag 03UZ, Theorem 64.20.1 and its perfect-complex determinant convention;
Abdurrahman–Venkatesh, §3.2, equations (3.1)–(3.2), p. 27.)

**Checks for the characteristic series.**

- A rank-one module in degree zero with `u=a` gives `1−aT`; shifting it by one
  gives `(1−aT)⁻¹`, distinguishing the cohomological sign.
- The contractible complex `[A →^1 A]` with the identity has series
  `(1−T)/(1−T) = 1`, independently of the two chosen bases.
- Over `A = ℤ/4`, `[A →^2 A]` with the identity again gives `1`; its two
  cohomology modules are `ℤ/2`, and neither has a projective determinant over `A`.

Let `Λ` be a finite field of characteristic `ℓ ≠ p` (or a finite commutative ring of order prime to `p`,
with the additional hypothesis that the sheaf `j_*ρ` below is flat over `Λ`) and `ρ` a
continuous representation of `Gal(F^sep/F)` on a finite free `Λ`-module `V`, unramified outside a
finite set of places. Define
`L(X, ρ, T) := ∏_v P_v(ρ,T^(d_v))⁻¹ ∈ Λ[[T]]ˣ`, where
`P_v(ρ,X) := det(1 − X Fr_v | V^{I_v})` uses geometric Frobenius on the
inertia invariants. Flatness of `j_*ρ` makes these finite stalks projective, so this determinant
is defined over `Λ`. Over a field it agrees with ArithmeticGaloisRepresentations §2.5's
`GaloisRep.localEulerFactor`; the finite-ring extension is a target here. Its API is:

- Over a field it agrees with that local Euler factor.
- At an unramified place it is the determinant on the whole representation module.
- It is independent of the Frobenius lift.
- Its constant coefficient is `1`.

Prove lFunction_cohomological: with `j : U → X` the inclusion of the unramified open,

```text
L(X, ρ, T) = det(1 − T·Fr | RΓ(X_{k̄}, j_*ρ))⁻¹     in Λ[[T]],
```

where the determinant is the characteristic series of the perfect cohomology complex. If all cohomology modules are
projective (in particular over a field), lFunction_cohomological_projective expresses it as
`∏_{i=0}^{2} det(1 − T·Fr | H^i(X_{k̄}, j_*ρ))^((−1)^(i+1))`. For general finite rings the
individual cohomology modules need not be projective, and this latter expression is not used.
The Euler product over the closed points of `U` alone uses `RΓ_c(U_{k̄}, ρ)`. No lift of `ρ` to
characteristic zero is assumed or used.

*Proof sketch.* The stalk of `j_*ρ` at a point outside `U` is `V^{I_v}` with its Frobenius, so
`L(X, ρ, T)` is the `L`-function of the constructible sheaf `j_*ρ`, and the identity is the
finite-coefficient cohomological interpretation of `L`-functions: for a scheme of finite type
over `𝔽_q`, a finite ring `Λ` of order prime to `p` and a constructible flat `Λ`-sheaf `𝓕`,
`L(X, 𝓕, T) = det(1 − Fr·T | RΓ_c(X_{k̄}, 𝓕))⁻¹` (Stacks Project, Tag 03UZ, Theorem 64.20.1,
whose proof refers to SGA 4½, *Fonctions L modulo ℓⁿ et modulo p*, Théorème 2.2). For a proper
curve `RΓ_c = RΓ`. In characteristic `ℓ`, equality of traces for all powers of Frobenius does not by itself determine the
determinant, because a logarithmic derivative divides by integers; the determinant identity is
proved directly over `Λ[[T]]` as in loc. cit. (Abdurrahman–Venkatesh, *Symplectic L-functions and
symplectic Reidemeister torsion*, §3.2, equations (3.1)–(3.2), p. 27, for this statement on a
curve with torsion coefficients.)

*Needs:* ArithmeticGaloisRepresentations §2.5; EtaleCohomologyFoundations §§F.2.5, F.3 and F.10.2–F.10.3 (compact supports, finiteness, Frobenius and
perfect-complex traces and finite-projective determinant comparisons);
PadicMeasuresIwasawaAlgebras §5.1 (`detLine`, `detLine_quasiIso`, `detLine_shortExact`,
`detLine_baseChange`, `detLine_shift`, `detLine_acyclic`); the characteristic-series
bridge above; Layer 5.1.

**Checks.**

- The constant rank-one sheaf `Λ` on `ℙ¹` gives `L = 1/((1 − T)(1 − qT))` in `Λ[[T]]`.
- At a place where `ρ` restricted to inertia is a nontrivial tame character of rank one, the local
  factor is `1` (no inertia invariants), and the invariants are computed as a kernel; averaging
  over inertia is invalid when `ℓ` divides the order of the inertia image.
- In characteristic `ℓ`, the identity of an `ℓ`-dimensional space has every power trace equal to
  `0` while `det(1 − T·id) = (1 − T)^ℓ = 1 − T^ℓ ≠ 1`; equality of all power traces does not imply
  equality of determinants.
- For `Λ = ℤ/4`, the perfect complex `[Λ →^{2} Λ]` in degrees `0,1` has both cohomology
  modules isomorphic to `ℤ/2`, which is not projective over `Λ`. For the identity chain map
  its complex determinant is `(1 − T)/(1 − T) = 1`; determinants on its two cohomology modules
  are not available. This tests the distinction even when the coefficient ring is finite.
- At an unramified rank-one stalk with Frobenius `a ∈ Λˣ`,
  `P_v=1−aT`; at a zero stalk it is `1`. In either case the constant
  coefficient is a unit, which justifies inversion in the Euler product.

### 5.8 Quantitative Chebotarev in each degree

Let `M/F` be a finite Galois extension, with exact constants `k_M = 𝔽_{q^h}`,
`G = Gal(M/F)`, geometric subgroup `N = Gal(M/Fk_M)`, and a conjugacy class `C ⊆ G`.
Define `π_C(r)` to count the unramified places of `F` of degree `r ≥ 1`
whose arithmetic Frobenius lies in `C`. Its API is:

- The set counted is finite by degree-bounded place finiteness.
- The count is independent of the choice of a conjugate Frobenius lift.
- Extending the count to conjugation-stable subsets is additive on disjoint unions, and
  the empty subset has count zero.

Prove frobeniusPlaceCount_constant_congruence:
the count is zero unless the image of `C` in `Gal(k_M/k)` is `Frob_q^r`. In a compatible
degree, prove degree_sensitive_chebotarev:

```text
|r · π_C(r) − (|C|/|N|)(q^r+1)|
  ≤ (2g_M + r(1+2g_X))q^(r/2) + r + R.
```

Here `g_M` is the genus over the exact constants of `M`, `g_X` is the genus of `F/k`,
`R` is the sum of the degrees of the ramified places of `F`, and the inequality is in `ℝ`.
Both `|N|` and `q` are positive, with `q > 1`. The factor `|C|/|N|`, rather than `|C|/|G|`,
is essential when constants enlarge. The explicit error tends to zero after division by `q^r`, and recovers
DeligneWeightsAndPurity §3.7's supplied `finiteCover_degreeChebotarev` on each compatible
constant-field progression. Its asymptotic and Haar-null conclusions are imported there;
the additional target here is this numerical bound, not their general proof.

For the proof, use Kosters, *A short proof of a Chebotarev density theorem for function fields*,
Theorem 1.1 and Corollary 1.2, p. 2, with Lemmas 1.3–1.4 and proofs, pp. 3–5. The corollary's
sum is over rational places, as its proof shows; the printed all-place subscript is not the
intended statement. Its per-element estimate gives the following degree-`r` deduction.
Extend the constants of `F` to `k_r = 𝔽_{q^r}` and choose a field component `Mk_r`.
With `d = gcd(h,r)`, its group over `Fk_r` is the preimage of
`Gal(k_M/𝔽_{q^d})` in `G`. Its geometric subgroup is still `N`. Every element of a compatible
`C` belongs to the arithmetic-Frobenius coset for `k_r`. Sum the per-element weighted estimate
over `C`, allowing `C` to split into conjugacy classes of this smaller group. The resulting
weighted rational-point count `W_C(r)` satisfies
`|W_C(r) − (|C|/|N|)(q^r+1)| ≤ 2g_M q^(r/2)`, since `|C| ≤ |N|`.
For an unramified place of degree `e | r`, its `e` rational points after base change contribute
according to `Frob_v^(r/e) ∈ C`. The degree-`r` contribution is precisely
`r · π_C(r)`; all smaller degrees are at most `r/2`.
Their total contribution is at most
`Σ_{e | r, e < r} #X(𝔽_{q^e}) ≤ r((1+2g_X)q^(r/2)+1)` by the curve Weil bound.
Ramified contributions are nonnegative and at most `R`. The triangle inequality gives the
displayed estimate. This deduction does not identify all rational points after base change
with places of degree exactly `r`.

*Needs:* AlgebraicCurves Layers 6 and 8 (Galois places, constant-field components and genus);
§5.1; DeligneWeightsAndPurity §§1.6 and 3.7 (`finiteCover_degreeChebotarev`, for
comparison with its asymptotic); finite-group conjugacy and arithmetic Frobenius.

**Checks.**

- For a pure constant extension of degree `h`, `N = 1` and the only possible degree-`r`
  Frobenius is `Frob_q^r`; using `1/|G|` would give the wrong main term by a factor of `h`.
  In a quadratic constant extension, odd degrees cannot have trivial Frobenius.
- For `M = F = 𝔽_q(t)` and `r = 1`, the count is `q+1`, `R = g_M = g_X = 0`, and the
  main term agrees exactly. For `r = 2`, `2 · π_C(2) = q²−q`;
  the difference from `q²+1` is the `q+1` degree-one points, which must be subtracted.
- For a geometric extension (`h = 1`), the main coefficient becomes `|C|/|G|`.
  For `r = 1` there are no smaller-degree contributions, and the sharper intermediate
  error is `2g_M√q + R`; ramified rational points cannot be counted as unramified ones.

### Examples

For `F = 𝔽_q(t)`: `Z = 1/((1 − T)(1 − qT))`, `L = 1`, `h = 1`, `N_r = q^r + 1`. For the elliptic
function field `y² = x³ + x + 1` over `𝔽_5` (discriminant `−16·31 ≢ 0` mod `5`): the affine fibres over
`x = 0, 1, 2, 3, 4` have `2, 0, 2, 2, 2` points, so `N_1 = 9`, `L = 1 + 3T + 5T²`, `h = 9`.

### Dependencies

Layers 0.1–0.2 and 4.5; AlgebraicCurves Layers 2, 3, 4, 5, 6, 8 and 12; DeligneWeightsAndPurity §§1.6 and 1.9; WeilConjectures WC.1 and WC.5; ArithmeticGaloisRepresentations §2.5;
EtaleCohomologyFoundations §§F.2.5, F.3 and
F.10.2–F.10.3; PadicMeasuresIwasawaAlgebras §5.1.

## Layer 6: automorphic functions over function fields

`K = k(X)` with `k = 𝔽_q`, `𝔸 = 𝔸_K` the completed adeles of AutomorphicLFunctionsAndLocalFactors
AL.3. This layer supplies arithmetic automorphic functions, constant terms and cuspidal finiteness
for arbitrary connected reductive groups over `K` and coefficient rings in which `p` is invertible,
as the work of V. Lafforgue and Böckle–Harris–Khare–Thorne requires. The complex `GLₙ` specialization
is compared with AutomorphicLFunctionsAndLocalFactors' supplied function spaces
in *Representation prerequisites — Restricted tensor realizations* and with
AutomorphicSpectralTheory's function-field branch.

### 6.1 Adelic points of affine groups over a function field

For a finitely generated commutative Hopf algebra `H` over `K` (an affine group scheme `G` of
finite type), define `G(𝔸) := WithConv (H →ₐ[K] 𝔸)` (a group by
`TauCeti.AlgHom.instGroup`), with the affine point topology supplied by ReductiveGroupsPartII
RG2.0. The additional function-field target adelicPoints_restrictedProduct compares these
points with the restricted product over the completed global places:
for a finite nonempty set `S` of places and a flat affine group scheme model `𝒢` of finite type over the `S`-integers
`O_S`, the natural map

```text
G(𝔸)  →  ∏′_{v} ( G(K_v), 𝒢(O_v) )
```

to the restricted product (Mathlib `RestrictedProduct`, with `G(K_v)` for `v ∈ S`) is a
homeomorphism of topological groups, independent of `(S, 𝒢)` up to enlarging `S`. Prove
adelicPoints_diagonal_discrete: `G(K) → G(𝔸)` is a closed embedding onto a discrete subgroup, and
adelicPoints_finite_stabilizer: for `U ⊆ G(𝔸)` compact open and `g ∈ G(𝔸)`, `g G(K) g⁻¹ ∩ U` is
finite. The adelic-point API is:

- Morphisms of Hopf algebras induce the corresponding continuous group homomorphisms on points.
- The adelic point group is locally compact.
- The construction commutes with products of groups.
- For `G=𝔾_m` it is ArithmeticGaloisDuality §R02.3.2's idele group, with the topology
  controlling both a unit and its inverse.
- For `G=𝔾_a` it is the additive group `𝔸`.

*Proof sketch.* Use the embedding-independent point topology of ReductiveGroupsPartII RG2.0;
continuity and openness of the restricted-product comparison maps follow from writing
`𝔸` as the direct limit of the open subrings `∏_{v∈S} K_v × ∏_{v∉S} O_v`. Discreteness of `G(K)`
follows from the discreteness of `K` in `𝔸` (AL.3). This is the function-field counterpart of
AdelicAlgebraicGroups Layer 1, which is written for number fields only. (Conrad, *Weil and Grothendieck approaches to
adelic points*, Proposition 2.1, p. 2; Example 2.3, p. 3; Theorem 3.6, p. 6, all for an arbitrary
global field; Böckle–Harris–Khare–Thorne, *Ĝ-local systems on smooth projective curves are
potentially automorphic*, Proposition 8.1, p. 34.)

*Needs:* AutomorphicLFunctionsAndLocalFactors AL.3 *Curve additive analysis*; Tau Ceti
`AlgHom.instGroup`, `ReductiveAffineGroupSchemeCat`; ReductiveGroupsPartII RG2.0;
Mathlib `RestrictedProduct`,
`RestrictedProduct.unitsEquiv`.

**Checks.**

- `𝔾_m(𝔸)` is the idele group with its own topology: the subspace topology from `𝔸` would make
  inversion discontinuous (a sequence of ideles converging to `1` in `𝔸` can have inverses that
  diverge).
- For `G = 𝔾_m`, `Kˣ` is discrete in the ideles but the quotient `C_K` is not compact (it surjects
  onto `ℤ` by degree), whereas for `G = 𝔾_a` the quotient `𝔸/K` is compact: discreteness of `G(K)`
  does not imply cocompactness.
- For `G = GL₁` and `U = ∏_v O_vˣ`, `g G(K) g⁻¹ ∩ U = 𝔽_qˣ` is finite of order `q − 1`.

### 6.2 Automorphic function modules

Let `G` be a connected reductive group over `K`, `U ⊆ G(𝔸)` a compact open subgroup, `Ξ ⊆ Z(𝔸)` a
discrete subgroup of the centre for which `Z(K)∖Z(𝔸)/((Z(𝔸) ∩ U)Ξ)` is finite (for
`G = GL_n`, the subgroup generated by the scalar of a degree-one idele, which exists by Layer 0.2),
and `R` a commutative ring. Define `𝒜(G,U,Ξ;R)`, the `R`-module of functions
`G(K)∖G(𝔸)/U → R` invariant under `Ξ`, and, for a character `χ : Z(K)∖Z(𝔸) → Rˣ` trivial on
`Z(𝔸) ∩ U` and on `Ξ`, the submodule of `χ`-equivariant functions, `f(zg)=χ(z)f(g)`.
The automorphic-function API is:

- Evaluation at a double-coset representative is `R`-linear.
- For `U′⊆U`, pullback from level `U` to level `U′` is injective.
- Finite double-coset sums define convolution by the algebra `H(G(𝔸),U)` of compactly
  supported `R`-valued `U`-bi-invariant functions.
- An `R`-algebra map `R→S` induces `𝒜(G,U,Ξ;R)⊗_R S → 𝒜(G,U,Ξ;S)`, an isomorphism
  on finitely supported functions.
- For `G=𝔾_m` these are functions on `C_K/(U·Ξ)`, with the supplied idele class group.

For `G = GL_n`, `R = ℂ` and a fixed unitary central character, prove the comparison
with the smooth central-character automorphic function space and its constant terms in
AutomorphicLFunctionsAndLocalFactors, *Representation prerequisites — Restricted tensor
realizations*. Restriction to level `U` and `Ξ` identifies the two spaces, their quotient
measures, Hecke actions and cusp subspaces. This comparison is the input to §6.7's use of
AL.3 Fourier reconstruction; the supplied complex theory has no dependence on Layer 6.

*Proof sketch.* These are definitions over Layer 6.1; the Hecke action is well defined because
`UgU` is a finite union of `U`-cosets. (Yu, *Comptage des systèmes locaux ℓ-adiques sur une courbe*,
§§2.2–2.3, pp. 8–12; Harder, *Chevalley groups over function fields and automorphic forms*, §1.1,
pp. 252–253; Böckle–Harris–Khare–Thorne, §8.1, p. 34.)

*Needs:* Layer 6.1; Layer 0.2; ArithmeticGaloisDuality §R02.3.2;
AutomorphicLFunctionsAndLocalFactors, *Representation prerequisites — Restricted tensor
realizations*, for the complex `GL_n` comparison.

**Checks.**

- For `GL₁` with `U = ∏_v O_vˣ` and no central quotient, the double-coset set is `Pic(X)`, which
  surjects onto `ℤ` by degree and is infinite.
- For `K = 𝔽_q(t)`, `U = ∏_v O_vˣ` and `Ξ` generated by an idele of degree `r > 0`, there are exactly
  `r` double cosets for `GL₁`.
- For `G = GL₁`, `K = 𝔽_q(t)`, maximal integral level and `Ξ` generated by a
  degree-two idele, the quotient is `ℤ/2`. The admissible character `χ(d) = (−1)^d`
  forces values `(a,−a)`. Over `ℚ` no nonzero constant function is equivariant;
  over `ℤ/4` the constant function `(2,2)` is equivariant.

### 6.3 Constant terms and the cusp module

For a proper parabolic `K`-subgroup `P = MN` of `G`, the unipotent radical `N` is `K`-split, so
`N(K)∖N(𝔸)` is compact; normalize the invariant quotient measure to have volume one. Assume
`p` is invertible in `R`.
For `f ∈ 𝒜(G,U,Ξ;R)` define the constant term
`CT_P f (g) := ∫_{N(K)∖N(𝔸)} f(ng) dn`; since `f(·g)` is invariant under the
compact open subgroup `J = N(𝔸) ∩ gUg⁻¹`, the integral is the finite weighted sum
over the double-coset set `N(K)∖N(𝔸)/J`. This set is generally not a group. The weight of a
representative `n` is `μ(J)/#(N(K) ∩ nJn⁻¹)`, where `μ` is Haar measure on `N(𝔸)` with
covolume `1` for `N(K)`. A filtration with vector-group quotients shows `μ(J) ∈ ℤ[1/p]`, and
each finite stabilizer has `p`-power order. The weights therefore lie in `ℤ[1/p]` and sum to `1`,
so the integral is defined in `R`. Define
`C_cusp(G,U,Ξ;R)` as the intersection over all proper `K`-parabolics `P` of the kernels of
`CT_P`. The constant-term and cusp-module API is:

- Each constant term is `R`-linear and at `R=ℂ` equals the ordinary integral.
- Under refinement, the finer weights sum to each old weight, so the integral is unchanged.
- Membership in the cusp module means every proper constant term vanishes. It suffices
  to test maximal parabolics containing a fixed minimal one, up to `G(K)`-conjugacy.
- The cusp module is stable under the Hecke action.

*Proof sketch.* `K`-splitness of the unipotent radical gives a filtration by normal subgroups
with vector-group quotients on which `P` acts linearly (Morris I, §5.4, p. 104, after SGA 3 XXVI,
Proposition 2.1, and Borel–Tits, Théorème 3.17), and the compactness of `K∖𝔸` (AL.3) gives compactness of `N(K)∖N(𝔸)`; the
quotient measure is built in stages from these vector-group quotients and AdelicAlgebraicGroups
Layer AA.0's Haar products. (Böckle–Harris–Khare–
Thorne, §8.1, definition of `C_cusp(U, R)`, p. 34; Ciubotaru–Harris, *On the generalized Ramanujan
and Arthur conjectures over function fields*, §3, p. 8; Morris, *Eisenstein series for reductive
groups over global function fields I*, §4, Proposition on the compactness of `N(F)∖N°`, p. 102.)

*Needs:* Layer 6.2; AutomorphicLFunctionsAndLocalFactors AL.3; AdelicAlgebraicGroups Layer AA.0;
ReductiveGroupsPartII Layer RG2.4 (parabolic subgroups and decompositions).

**Checks.**

- For a torus there is no proper parabolic, so every automorphic function is cuspidal; finiteness
  still needs the central quotient by `Ξ`.
- A nonzero constant function on `GL₂` has nonzero constant term along the Borel subgroup and is
  not cuspidal.
- If `p` is not invertible in `R` (e.g. `R = 𝔽_p`), the average over a quotient of order `p` is
  undefined, so the hypothesis cannot be dropped.
- Unequal weights already occur in a finite Heisenberg group `H(𝔽_p)` of order `p³`. Take
  `Γ = J = {(x,0,0)}` and `g_y = (0,y,0)`. The stabilizer `Γ ∩ g_y J g_y⁻¹` has order `p`
  for `y = 0` and `1` for `y ≠ 0`; the corresponding orbits in `Γ∖H` have probability
  `1/p²` and `1/p`. Treating a nonabelian double quotient as a group with uniform weights
  gives the wrong integral.

### 6.4 Compact support and finiteness of cusp forms

Prove **function-field reduction** for every connected reductive `G/K`, every compact
open `U ⊆ G(𝔸)`, and all characteristics, including nonsplit and anisotropic groups.
Choose a minimal rational parabolic `P₀ = M₀N₀`, its relative simple roots `Δ`, and
`H₀ : M₀(𝔸) → Hom(X_K^*(M₀), ℝ)` given by `⟨χ,H₀(m)⟩ = log_q |χ(m)|`.
Extend the relative roots to the corresponding rational linear forms on this space.
For `c ∈ ℝ`, put `P₀[c] = {nm : ⟨α,H₀(m)⟩ ≥ c for all α ∈ Δ}`.
There are `c₁ ∈ ℝ` and a finite `Σ ⊆ G(𝔸)` such that
`G(𝔸) = G(K) P₀[c₁] Σ U`. For `c₂ ≥ c₁`, impose also
`⟨α,H₀(m)⟩ ≤ c₂` for every `α`. The images of these bounded regions are relatively
compact in `G(K)∖G(𝔸)/Z(𝔸)`; every relatively compact subset is contained in such
an image for some `c₂`. For `Δ = ∅` this says that the entire quotient modulo the
centre is compact. Prove also finite invariant quotient volume modulo `Z(𝔸)`;
equivalently use the kernel of all adelic rational-character norms and its finite-index
central comparison. The reduction API is:

- Refining the compact open level gives a compatible reduction covering.
- Rationally conjugate choices of minimal parabolic give equivalent regions.
- Decreasing the lower bound or increasing the upper bound enlarges the region.

(Morris I, §§4.1–4.3, p. 101; §§4.4–4.7, pp. 102–103; Harder, §§1.1–1.2,
pp. 252–256, for the split specialization.) *Needs:* §6.1; ArithmeticGaloisDuality
§R02.3.2 (compact degree-zero idele classes); ReductiveGroupsPartII RG2.3–RG2.4
(relative roots, rational parabolics and local Iwasawa decomposition).

**Checks for reduction.**

- For `G = 𝔾_m`, `Δ` is empty and the quotient by the full adelic centre has one point;
  before that quotient the degree takes every integer, so it is not compact.
- In the split `GL₂` Borel, `m = diag(π_v^a,1)` at a degree-one place has
  `⟨α,H₀(m)⟩ = −a`; the opposite choice of positive root reverses this number.
  Bounds `c₁ ≤ −a ≤ c₂` allow finitely many integral values of `a`.
- For an anisotropic semisimple group there are zero simple rational roots and the
  whole adelic quotient is compact. For split `SL₂` there is one root and the unbounded
  cusp is excluded by the upper bound, so the two cases cannot use the same empty test.

Prove cuspFunctions_compactSupport: for every connected reductive `G` and compact open `U` there
is a compact subset `C ⊆ G(K)∖G(𝔸)/Z(𝔸)` containing the support of every cusp form of level `U`;
with `Ξ` as in 6.2 the supports lie in a finite subset of `G(K)∖G(𝔸)/UΞ`. Consequently, for `R`
Noetherian with `p` invertible, `C_cusp(G,U,Ξ;R)` is a finitely generated `R`-module, and for a
field `R` it is finite-dimensional. For split `G` (Harder's setting) the support bound is explicit:
there is a constant `c′` with support inside `⋃_i G(K) · B_i(𝔸)[c, c′]⁻¹ · U` for finitely many Borel
subgroups `B_i` (the inverse of Harder's Siegel sets, since his quotient is on the right), and under bounded values of all rational characters the space is
finite-dimensional.

*Proof sketch.* Function-field reduction above gives `G(𝔸) = G(K)·P₀(c₁)·Σ·U` for a Siegel set and a finite
set `Σ`. If a point of a Siegel set lies far enough in the direction of a simple root, the
`U`-invariance and the compactness of the unipotent quotients force `f` to equal its constant
term along the corresponding maximal parabolic there, which vanishes for a cusp form; this bounds
the support, and the compactness criterion of reduction theory turns the bound into compactness
modulo the centre. Compactness modulo `Ξ` follows because `Ξ` covers the split central degree
directions. Finitely many double cosets meet a compact set, so cusp forms are supported on a
finite set and lie in a finite free `R`-module. (Harder, Theorem 1.2.1 and Lemma 1.2.2,
pp. 255–256, and Corollary 1.2.3, p. 256, for split groups; Morris I, §§4.1–4.3, p. 101 (the
reduction theory of Harder for connected reductive groups over global function fields) and
§§5.3–5.6, pp. 104–106 (compact support modulo `Z(𝔸)G(K)` of `K`-finite cuspidal functions, with a
bound depending only on the level);
Böckle–Harris–Khare–Thorne, Proposition 8.2, pp. 34–35.)

*Needs:* Layers 6.1–6.3; function-field reduction above; Layer 0.2; ReductiveGroupsPartII Layer RG2.4.

**Checks.**

- Without a central quotient even `G = 𝔾_m`, `U = ∏ O_vˣ` gives all functions on `Pic(X)`.
  The indicators of its infinitely many degree components are linearly independent cusp forms.
  This disproves finiteness without `Ξ`; central translations of a form with a fixed central
  character would instead be scalar multiples, so they are not such a counterexample.
- The support bound is uniform over all cusp forms of level `U`, not form by form.
- For `G = 𝔾_m` and `U = ∏_v O_vˣ`, `Ξ = ⟨a⟩` with `deg a = 1`: cuspFunctions is the free module of
  rank `h` on `C_K/(UΞ) ≅ Cl⁰(F)`.

For a Noetherian `ℤ[1/p]`-algebra `R` and a flat `R`-algebra `S`, prove
cusp-module base change: `C_cusp(…;R) ⊗_R S ≅ C_cusp(…;S)`.
The common finite support just proved puts both modules inside functions on one finite set;
the coefficient rows of the constant-term conditions generate a submodule of its finite
free dual. Noetherianity makes that submodule finitely generated, so finitely many of the
original rows suffice; flatness preserves their common kernel. *Needs:* the definitions in §6.3 and the uniform finite-support theorem
in §6.4. This statement is not an input to that support theorem.

**Checks for base change.**

- On a two-point quotient the equation `x−y=0` has kernel `R·(1,1)`; scalar extension
  gives `S·(1,1)`.
- Over `ℤ[1/3]`, the rows `2,4,8,…` are infinitely many distinct rows but generate
  the single row module `2ℤ[1/3]`; their common kernel is zero.
- Reducing the equation `2x=0` from `ℤ[1/3]` to `𝔽₂` changes its kernel from zero
  to all of `𝔽₂`; this coefficient change is not flat.

### 6.5 Integral coefficient models and algebraic Hecke eigenvalues

Prove cuspFunctions_integralModel: if `R` is a Noetherian `ℤ[1/p]`-algebra with an embedding into
an algebraically closed field `C` of characteristic zero, then
`C_cusp(G,U,Ξ;R) ⊗_R C ≅ C_cusp(G,U,Ξ;C)`. Prove heckeEigenvalue_algebraic: the
eigenvalues of the unramified Hecke algebra `H^S(G, U)` (places outside the finite set where `U` is
not hyperspecial) on `C_cusp(G,U,Ξ;C)` are algebraic numbers, and every irreducible cuspidal
automorphic representation (with central character trivial on `Ξ`) has a model over a number
field. Algebraicity is asserted for the model over `ℤ[1/p]` or a number field; it is not asserted for
a transcendental central character.

*Proof sketch.* By 6.4 the cusp module is cut out of a finite free `R`-module by finitely many
linear equations with coefficients in `ℤ[1/p]`; an embedding `R ⊆ C` factors through the fraction
field, so scalar extension is flat. The Hecke operators preserve the `ℚ`-structure, so their
characteristic polynomials have rational coefficients, and Cayley–Hamilton gives algebraic
eigenvalues. (Ciubotaru–Harris, §3, Proposition 3.1 and Lemma 3.2, pp. 8–9; Böckle–Harris–Khare–
Thorne, Proposition 8.2, pp. 34–35.)

*Needs:* Layers 6.3–6.4.

**Checks.**

- A fixed-level cuspidal Hecke eigenvalue on the `ℤ[1/p]`-model is algebraic over `ℚ`.
- A central character with a transcendental value cannot be put on a number-field model by this
  argument; the theorem fixes `Ξ` and the character to be of finite order.
- For the non-flat map `ℤ[1/p] → 𝔽_ℓ` the base change of the cusp module need not equal the cusp
  module with `𝔽_ℓ`-coefficients (the cusp equations can acquire solutions modulo `ℓ` that do not
  lift), so flatness is a genuine hypothesis.

### 6.6 The global unramified Hecke action and the Satake normalization

At a place `v` where `U_v = G(O_v)` is hyperspecial, use SmoothRepresentationsOfLocalGroups §SR.4.1:
the spherical Hecke algebra `H(G(K_v), U_v)` with `vol(U_v) = 1` and its Satake isomorphism after
adjoining `q_v^(±1/2)`. Prove heckeAction_unramified_cusp: the global action of 6.2 at `v`
preserves cuspFunctions, and for a standard parabolic `P = MN`,
use right convolution `T_h f(g) = ∫ h(x) f(gx) dx`. Set
`S*_P h(m) = ∫_{N(K_v)} h(mn) dn`, with `N(O_v)` of volume one, and
`δ_P(m) = |det(Ad(m)|Lie N)|_v`. The raw constant term, restricted to `M(𝔸)`, satisfies
`CT_P(T_h f) = T_{S*_P h}(CT_P f)`.
Define `CTⁿ_P f(m) := δ_P(m)^(−1/2) CT_P f(m)` with the adelic
product modulus. Prove normalizedConstantTerm_hecke: it intertwines `T_h` with
`T_{S_P h}`, where `S_P h=δ_P^(1/2)S*_P h` is normalized Satake.
The normalized constant-term API is:

- Evaluation at `1` is unchanged by normalization.
- For `m,l∈M(𝔸)`, `CTⁿ_P(R_m f)(l)=δ_P(m)^(1/2)CTⁿ_P(f)(lm)`.
- For standard `Q⊆P`, `CTⁿ_Q=CTⁿ_{Q∩M}∘CTⁿ_P`, with compatible quotient measures
  and restriction to the Levi of `Q`.

These targets use coefficient rings containing the required square roots of the residue
cardinalities.
Prove satake_gl1_reciprocity: for
`G = GL₁` the Hecke operator of a uniformizer `π_v` acts by translation by the idele `π_v`, and for
an eigenfunction `f` with idele class character `χ` the eigenvalue is `χ(π_v)`; under the
reciprocity map of ArithmeticGaloisDuality this is the value of the corresponding Galois character
on `Art(π_v)`, which is arithmetic Frobenius. The geometric Frobenius used in Euler factors and in
the Satake parameter is its inverse, so exactly one inversion separates the two conventions.

*Proof sketch.* Constant terms commute with right translation; the relative Satake identity is
the computation of a constant term of a right convolution by integrating over `N(K_v)` first.
(Böckle–Harris–Khare–Thorne, §8.1, (8.1)–(8.3), p. 35; Yu, §§2.2–2.3, pp. 8–12.)

*Needs:* Layers 6.2–6.3; SmoothRepresentationsOfLocalGroups §SR.4.1; ArithmeticGaloisDuality
§R02.3.2; Layer 0.1.

**Checks.**

- For `GL₁`, translation by a uniformizer at a place of degree `d` multiplies the eigenvalue of a
  degree character `χ = λ^deg` by `λ^d`.
- For `GL₂`, write `X_i` for translation by `π_v` in the `i`th diagonal coordinate. For
  `h = 1_{U_v diag(π_v,1) U_v}`, `S*_B h = q_v X₁ + X₂` and
  `S_B h = q_v^(1/2)(X₁ + X₂)`. The constant function has Hecke eigenvalue `q_v + 1`;
  applying normalized Satake to its raw constant term would instead give `2q_v^(1/2)`.
  On `CTⁿ_B(1) = δ_B^(−1/2)`, the two translates have factors
  `q_v^(1/2)` and `q_v^(−1/2)`, giving the correct `q_v + 1`.
- For `P = G`, the unipotent radical is trivial, `δ_P = 1`, and the normalized constant term
  is the identity. For the zero function every normalized constant term is zero.
- An operator at a ramified place is not covered by the Satake description.

### 6.7 Yu's degree-zero nonvanishing

Prove cuspForm_exists_degreeZero_ne_zero: let `π` be an irreducible cuspidal automorphic
representation of `GL_n(𝔸)`, `n ≥ 1`, unramified at every place, and `φ ∈ π` a nonzero
`GL_n(Ô)`-invariant vector. Then `φ(g) ≠ 0` for some `g ∈ GL_n(𝔸)` with `deg_Yu(det g) = 0`.

*Proof sketch.* Fix a nonzero rational differential `ω` with `n_v = ord_v(ω)` and the residue
character of AL.3. Fourier reconstruction (AL.3 *The `GL(n)` cuspidal Fourier expansion*, in its
function-field case) shows that some
Whittaker coefficient `W_φ` is nonzero; by the global Whittaker factorization and the spherical
normalization at nonzero conductor (AL.3), `W_φ(t) ≠ 0` for `t = (t_v)` with
`t_v = diag(π_v^(−(n−1)n_v), …, π_v^(−n_v), 1)`. Its valuation degree is
`−(n(n−1)/2)·Σ_v n_v d_v = −n(n−1)(g − 1)`, so `deg_Yu(det t) = +n(n−1)(g − 1)`. Multiplying by the
scalar `a^(−(n−1)(g−1))` for an idele `a` with `deg_Yu a = 1` (Layer 0.2) changes `deg_Yu det` by
`−n(n−1)(g−1)` and multiplies values by a central character value, which is nonzero; a nonzero
Whittaker integral then yields a nonzero unipotent translate, of the same determinant degree.
(Yu, §5.3.1, Lemma 5.3.3 and proof, pp. 36–38.)

**Source corrections.** Yu's Lemma 5.3.3 (p. 36) quantifies over every vector of `π`; the zero
vector must be excluded, and in Yu's setting the vector is spherical. In the proof (pp. 37–38) the
determinant of `t` is assigned Yu degree `−n(n−1)(g − 1)` and a scalar power `(n−1)(g−1)` is used;
in Yu's own convention (`deg g = −Σ_v [κ(v):𝔽_q] v(g_v)`, §2.2.1, p. 8) the degree is
`+n(n−1)(g − 1)` and the scalar power must be `−(n−1)(g−1)`, as above.

*Needs:* Layers 0.1–0.2 and 6.2–6.3; AutomorphicLFunctionsAndLocalFactors AL.3 *The `GL(n)`
cuspidal Fourier expansion*, *Global Whittaker factorization*, *Spherical Whittaker normalization at
nonzero conductor*; Tau Ceti `degree_weilDifferentialDivisor`.

**Checks.**

- For `n = 1` the determinant shift is `0` and the statement is that an unramified idele class
  character is nonzero somewhere in degree zero.
- The zero vector fails the conclusion, so `φ ≠ 0` is a necessary hypothesis.
- With the uncorrected sign the scalar would double the degree to `2n(n−1)(g − 1)` instead of
  cancelling it (visible already for `n = 2`, `g = 2`).

### Examples

For `G = 𝔾_m`, `K = 𝔽_q(t)`, `U = ∏_v O_vˣ` and `Ξ` generated by the idele `t⁻¹` at `∞`: the
automorphic functions are the functions on a single point, every one is cuspidal, and the Hecke
operator at `∞` acts by `1`.

### Dependencies

Layers 0.1–0.2 and 2; AutomorphicLFunctionsAndLocalFactors AL.3; ArithmeticGaloisDuality §R02.3.2;
AdelicAlgebraicGroups Layer AA.0; ReductiveGroupsPartII Layer RG2.4; SmoothRepresentationsOfLocalGroups
§SR.4.1; Tau Ceti `AlgHom.instGroup`, `ReductiveAffineGroupSchemeCat`, `degree_weilDifferentialDivisor`.

## Layer 7: unitary Siegel–Eisenstein series and their nonsingular coefficients

For the global Eisenstein statements in §§7.1–7.3 and 7.5–7.6, `p ≠ 2`.
Sections 7.4–7.5 use `q` for the local residue cardinality; Section 7.4 has its own
local setting in every characteristic. Let `X/𝔽_q` be as before with `F = k(X)`, and `ν : X′ → X` is a finite étale double
cover (possibly the trivial cover `X ⊔ X`, or the constant cover `X ⊗ 𝔽_{q²}`) with
`F′ = k(X′)` the corresponding quadratic étale `F`-algebra and `σ` its involution. Let `W` be the
standard split skew-Hermitian `F′`-space of dimension `2n`, `H_n = U(W)`, and `P_n = M_n N_n` the
Siegel parabolic, `m(α) = diag(α, ᵗᾱ⁻¹)` for `α ∈ GL_n(𝔸_{F′})` and `n(b) = (1 b; 0 1)` for
`b ∈ Herm_n(𝔸_F)`. The unitary group, its Siegel parabolic and their local integral models are
ReductiveGroupsPartII Layers RG2.3–RG2.4 and SmoothRepresentationsOfLocalGroups §SR.4.4.

### 7.1 Inducing characters and the unramified obstruction

Let `η : C_F → {±1}` be the quadratic character of `F′/F`, with arithmetic reciprocity
from ArithmeticGaloisDuality §R02.3.2 (trivial for `F′ = F × F`). For `n ≥ 0`, prove
**the unramified extension criterion**: an everywhere-unramified character
`χ : C_{F′} → ℂˣ` with `χ|_{C_F} = η^n` exists if and only if `η^n` is trivial on
`ker(ν^* : Pic(X) → Pic(X′))`. When this holds it can be chosen unitary, and the set
of choices is a torsor under the unramified characters trivial on `ν^* Pic(X)`.
For even `n`, the trivial character works. For a connected cover any such unramified
extension has finite order, since `ν^* Pic(X)` has finite index in `Pic(X′)`; for a
split cover the choices are `(χ₀,χ₀⁻¹)` and can have infinite order.

Prove **arithmetic evaluation of the obstruction**: for `D = Σ_v a_v[v]` in this
kernel, `η(D) = (−1)^(Σ_{v inert} a_v)`, with each closed point counted once with its
multiplicity, using its local splitting in `X′`; this evaluation is unchanged by a
principal divisor. Thus geometric cup-product alternation does not establish the
criterion. (Feng–Yun–Zhang, §2.1, Remark 2.1, pp. 8–9, for the extension criterion;
ArithmeticGaloisDuality §R02.3.2 for the arithmetic Artin evaluation.)

**Source correction.** The assertion in FYZ Remark 2.1 that the criterion always holds
for odd `n` is false. On `E/𝔽_3 : y² = x³+2x²+2x`, let `O` be the identity,
`P=(0,0)` and
`ν(x,y) = (x+2+2/x, y(1−2/x²))`. This extends to a separable degree-two isogeny
`E → E` with kernel `{O,P}`, hence an étale double cover. Its pullback satisfies
`ν^*(P−O) = div(y/x)`. The fibre at `O` is `{O,P}`, whereas the fibre at `P` is
the single degree-two point with `y=0` and `x²+2x+2=0`. Hence
`η(P−O) = (−1)/(+1) = −1`, and no unramified extension exists for odd `n`.

Prove **existence with finite ramification** for every such cover and every `n`:
there is a continuous unitary character `χ : C_{F′} → U(1)` restricting to `η^n`,
trivial on the integral units outside a finite set `S`. The idele-class embedding
`C_F → C_{F′}` has closed image: for a field cover, Hilbert 90 identifies its
image with the fixed subgroup `C_{F′}^σ`, a closed subgroup with the induced idele-class
topology; for the split cover it is the diagonal embedding. Choose a compact open subgroup `V`
of `C_{F′}` whose intersection with that image lies in `ker η^n`. Extend the resulting
character of the image in the discrete group `C_{F′}/V` into the divisible group
`U(1)` and pull back. This gives a continuous character with an open kernel and
therefore finite ramification. The inducing-character API is:

- Each local restriction has its finite least conductor exponent.
- Restriction to `C_F` is exactly `η^n`.
- The ratio of any two choices is a character trivial on `C_F`, and multiplication by
  such a character gives every other choice.

*Needs:* ArithmeticGaloisDuality §R02.3.2 (idele classes, topology and reciprocity);
Layer 0.3; SchemeAndStackFoundations §§2.11 and 3.6 (Hilbert 90 and Picard objects);
divisibility of `U(1)` and extension of homomorphisms from subgroups of abelian groups.
The arithmetic obstruction is evaluated before any choice of inducing character.

**Checks.**

- For `n=0` or any even `n`, the criterion reads `1=1` and `χ=1` works with `S=∅`.
  For the split cover `ν^*` is diagonal and `(χ₀,χ₀⁻¹)` restricts to `1`.
- For the constant quadratic cover, `η(D)=(−1)^(deg D)`. The character
  `χ=(−1)^(deg_{𝔽_{q²}})` on `Pic(X′)` extends it: an inert degree-`d` point
  has degree `d` after extension and a split even-degree point gives two of degree `d/2`.
- In the displayed elliptic example `#E(𝔽_3)=2`, `ν^*(P−O)=0` in the Picard group,
  but `η(P−O)=−1`; for odd `n`, every inducing character must be ramified somewhere.
  The same character has no obstruction to a finite-ramification extension on idele classes.
- Two choices have ratio trivial on `C_F`; unitarity does not force an unramified
  choice. A character ramified at `v` has no nonzero hyperspecial-fixed inducing section
  there, since a Levi unit on which it is nontrivial acts through that character.

### 7.2 The unitary Siegel–Eisenstein series

Choose a continuous unitary `χ` from §7.1, allowing finite ramification `S`.
The split case also allows any continuous pair `(χ₀,χ₀⁻¹)`: its nonunitary
norm part extends through the determinant of `H_n ≅ GL_{2n}`, giving a twist of the
unitary family. For the spherical statements choose an everywhere-unramified `χ` and assume
explicitly that the obstruction in §7.1 vanishes. The general construction uses all
rational parabolics of `H_n`, not just its Siegel parabolic.

For every rational parabolic `P=MN` of `H_n`, put `⟨χ,H_M(m)⟩=log_q|χ(m)|` for `χ ∈ X_F^*(M)` and let `Λ_M` be its image,
and `𝒯_M = Hom(Λ_M,ℂˣ)` its complex torus. A point `z` defines an unramified
character `m ↦ z(H_M(m))`. When the central character is fixed, use the full closed
diagonalizable subgroup `𝒯_M^{H_n}` trivial on the image of `Z_{H_n}(𝔸)`. This group
need not be connected; retain every component and interpret rational continuation and
common-denominator identities on each component in its coordinate ring. For a cuspidal representation `π` of `M` with unitary
central character and a flat section `f_z` of normalized `Ind_P^{H_n}(π⊗z)`, prove
**cuspidal Eisenstein rational continuation**. At every fixed compact open level and
finite-dimensional space of inducing sections there is a nonzero Laurent polynomial
`D(z)` on each such component such that `D(z)E_P(g,f_z)` and `D(z)M(w,π,z)f_z` are Laurent-polynomial
families for every `g`. Here `M(w,π,z)` maps the induced space for `(M,π,z)` to that
for `(wM,wπ,wz)` and is initially the standard integral over the corresponding
rational-unipotent intersection quotient. There is a real `c(π)` such that the series
and integrals converge whenever `Re⟨λ,α∨⟩ > c(π)` for every simple root of `P`,
where `z=q^λ` means `z(H_M(m))=q^(⟨λ,H_M(m)⟩)`.
The pole locus is contained in `D(z)=0`; identities hold as rational families and hence
at every regular parameter. Prove the constant-term formula as the Weyl sum of these
intertwiners and their composition and functional-equation identities.
(Morris I, p. 134 and pp. 160–168.)

Prove **unitary Levi discrete decomposition**: for every rational parabolic `P=MN`
of `H_n` and unitary automorphic central character `ω` of `M(𝔸)`, the discrete part
of `L²(M(F)Z_M(𝔸)∖M(𝔸),ω)` is a Hilbert sum of irreducible representations with
finite multiplicities. Each summand is cuspidal or arises by iterated residues of
Eisenstein series from cuspidal representations of rational Levi subgroups of `M`.
Retain every compact open level, arbitrary finite ramification and the action of the
full unramified-character lattice; no spherical restriction is imposed.
Here the central-character notation means equivariant functions with the quotient norm,
not scalar-valued functions invariant under a nontrivial `ω`.
(Morris II, §5.5, Theorem, p. 1145.)

Prove **discrete-data Eisenstein continuation** with these same maps, level and
parameter conventions for every discrete `π`: realize residual `π` by the iterated
residues above, prove independence when presentations give the same inducing vector
in its specified L² realization, and commute residue operations
with induction, constant terms and intertwining. A nonzero common denominator in the
coordinate ring of each parameter component on each finite-dimensional level space gives the pole domain; no assertion of regularity
at a pole is made. The resulting rational identities include the Weyl functional
equations. (Morris II, §§6.5–6.6, Lemma, p. 1164.)
*Needs for these three targets:* §6.4 function-field reduction and compact-support
finiteness; §§6.1–6.3 complex automorphic modules and constant terms; ReductiveGroupsPartII
RG2.3–RG2.4 (parabolics, relative roots and Iwasawa integration);
SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 (smooth induction and Whittaker functionals). Cuspidal continuation
precedes construction of residues, which precedes the discrete-data extension.
The Levi discrete decomposition uses that cuspidal continuation and its residues;
it is not an input to cuspidal continuation.

**Checks for continuation.**

- For `P=H_n`, the Eisenstein sum has one term, the intertwiner is the identity and
  `E(f)=f`; the denominator can be `1`. A torus Levi of a proper parabolic can have
  several ambient Weyl terms: the Borel of split `H₁=GL₂` has two.
- For split `H₁=GL₂` and `P=H₁`, the full fixed-centre parameter group is `μ₂`.
  Central scalar ideles have determinant degree `2d`, so both `z=1` and `z=−1` satisfy
  `z^(2d)=1`; keeping only the identity component would discard the degree-parity twist.
- For split `H₁=GL₂`, `π=1` on the torus and standard upper Borel, the constant term
  has two terms. At `m(π_v,1)`, the first section has value `q_v^(−s−1/2)`;
  its intertwining transform has exponent `−s` and cannot be replaced by that section.
- A one-dimensional unitary determinant character on `GL₂` is discrete modulo the centre
  but has nonzero Borel constant term: integrating its unipotent restriction gives `1`.
  It therefore tests the residual extension rather than cuspidal continuation alone.

Specialize SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.2 to define the degenerate principal series
`I_n(s, χ) := Ind_{P_n(𝔸)}^{H_n(𝔸)} (χ(det α) |det α|_{F′}^(s + n/2))` (unnormalized smooth
induction; `χ` extended trivially on `N_n(𝔸)`). For unramified `χ` define the spherical
section `Φ(·, s)`, the unique
`H_n(Ô)`-invariant section with `Φ(1, s) = 1`, factorized as `⊗_v Φ_v`.
For general `χ`, choose compact open `U_v` inside its conductor level and standard flat
sections `Φ_v` whose restriction to a maximal compact is independent of `s`, with the
spherical choice outside `S`; their tensor product defines `Φ`. More explicitly, use
sections supported on `P_n(F_v)kU_v` with value `1` at `k`, whenever `χ_v` is trivial
on the determinant of `P_n(F_v)∩kU_vk⁻¹`; this condition makes their transformation law
well defined, and these sections span the `U_v`-fixed induced space. Define the series

```text
E(g, s, Φ) := Σ_{γ ∈ P_n(F)∖H_n(F)} Φ(γg, s).
```

Prove siegelEisenstein_converges: the series converges absolutely and uniformly on compact sets
for `Re s > n/2` for unitary `χ` and for the split determinant twists just specified;
and siegelEisenstein_rational: for each `g`, `s ↦ E(g, s, Φ)` is a rational
function of `q^(−s)` (in particular meromorphic in `s` and periodic with period `2πi/log q`), left
`H_n(F)`-invariant wherever defined. The section and series API is:

- The spherical section satisfies `Φ(1,s)=1`.
- Every section satisfies `Φ(m(α)n(b)g,s)=χ(det α)|det α|_{F′}^(s+n/2)Φ(g,s)`.
- Every section satisfies `Φ(n(b),s)=Φ(1,s)`, equal to `1` in the spherical case.
- The Eisenstein series is left `H_n(F)`-invariant at every regular parameter.
- For every section, `Φ(m(α)g,s)=χ(det α)q^(deg_Yu,Fq(det α)(s+n/2))Φ(g,s)`.
  This degree uses the original `𝔽_q` on both components in the split case.

The homogeneity belongs to the inducing section; the Eisenstein constant term has several
exponents.

*Proof sketch.* Convergence is Godement's criterion for Eisenstein series in the positive cone,
applied to the degenerate parameter and every chosen flat section, using the Iwasawa decomposition `H_n(𝔸) = P_n(𝔸) H_n(Ô)`
(ReductiveGroupsPartII Layer RG2.4) and function-field reduction in 6.4. Prove
leviDetCharacter_discrete: the inducing datum
`χ ∘ det` is a one-dimensional discrete automorphic representation of the Levi after fixing its
unitary central character: for `n = 1` it is cuspidal on a torus, and for `n > 1` it lies in
the residual spectrum. The square-integrability follows from finite-volume reduction theory
for `GL_n` modulo its centre; the unitary Levi discrete decomposition above separates the cuspidal and residual
parts. For a nonunitary split character `(χ₀, χ₀⁻¹)`, first remove its absolute-value part:
it extends to a character of the split group `H_n ≅ GL_{2n}` through the determinant, so this
only twists the value at `g` and changes neither convergence nor rationality. Thus
cuspidal Eisenstein rational continuation and its discrete-data extension above give the
continuation. The discrete-datum assertion uses finite-volume reduction and the
Levi discrete decomposition; it does not assume Siegel rationality. (Feng–Yun–Zhang, §2.1,
p. 8, for the data and normalizations; Morris I, Lemma (Godement), p. 118, and the lemma on
`φ_λ`, p. 119, for convergence; Morris I, pp. 134 and 160–168, for the rationality of cuspidal
Eisenstein series; Morris, *Eisenstein series for reductive groups over global function fields II*,
§5.5, Theorem, p. 1145, for the spectral decomposition, and §§6.5–6.6, Lemma, p. 1164, for rational continuation
from discrete Levi data.)

*Needs:* Layers 6.1–6.4 and 7.1; unitary Levi discrete decomposition, cuspidal
Eisenstein rational continuation and discrete-data continuation above;
ReductiveGroupsPartII Layers RG2.3–RG2.4;
SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3, SR.4.1 and SR.4.4.

**Checks.**

- For the spherical section, scaling `Φ` by `c ≠ 1` violates `Φ(1, s) = 1`; the normalization fixes the section uniquely.
- For the spherical section, `Φ(n(b), s) = 1` for every `b ∈ Herm_n(𝔸_F)`;
  for any section the value is `Φ(1,s)`.
- Normalized induction of `χ|det|^s` and unnormalized induction of
  `χ|det|^(s+n/2)` give the same section and Eisenstein series, since
  `δ_{P_n}^(1/2) = |det|_{F′}^(n/2)`. In split rank one with trivial `χ`, both sections
  take value `q^(−s−1/2)` at `m(π,1)`. Keeping the exponent `s+n/2` while switching
  to normalized induction instead shifts the series parameter to `s+n/2`.
- On the split group with `n = 1`, the constant term is the sum of the section at `s` and
  its standard intertwining transform at `−s`. These have different Levi exponents for generic
  `s`; a single section homogeneity law cannot be imposed on `E`.

### 7.3 Hermitian Fourier coefficients

The dual of `N_n(𝔸) = Herm_n(𝔸_F)` is `Herm_n(𝔸_F, ω_F)`, the Hermitian forms valued in the rational
canonical line `ω_F`, through the residue pairing `⟨T, b⟩ = Res(−Tr(Tb))` and a fixed nontrivial
`ψ₀ : 𝔽_q → ℂˣ` (AL.3's residue character, applied entrywise). Define

```text
E_T(g, s, Φ) := ∫_{N_n(F)∖N_n(𝔸)} E(n(b)g, s, Φ) ψ₀(⟨T, b⟩) db,
```

for **rational** `T ∈ Herm_n(F, ω_F)`, with `N_n(F)∖N_n(𝔸)` of volume one, and the local Whittaker functions
`W_{T,v}(g_v, s, Φ_v) := ∫_{N_n(F_v)} Φ_v(w_n⁻¹ n(b) g_v, s) ψ₀(⟨T, b⟩_v) db_v` with `N_n(O_v)` of
volume one and `w_n = (0 1; −1 0)`; a local index may be any
`T_v ∈ Herm_n(F_v, ω_{F_v})`. For the sections of §7.2, including the finite-ramification choices, prove fourierExpansion
(`E = Σ_{T ∈ Herm_n(F, ω_F)} E_T`) and fourierCoefficient_rationalLevi: for
`α ∈ GL_n(F′)`,

```text
E_T(m(α)g, s, Φ) = E_{ᵗᾱTα}(g, s, Φ).
```

The character and norm factors are `1` for rational `α`. Prove whittaker_levi: for every
local `α ∈ GL_n(F′_v)`,

```text
W_{T,v}(m(α)g_v, s, Φ_v) = χ_v(det ᾱ)⁻¹ |det α|_{F′_v}^(−s+n/2) W_{ᵗᾱTα,v}(g_v, s, Φ_v).
```

Finally prove fourierCoefficient_factor: for nonsingular rational `T` and factorizable `Φ`,

```text
E_T(g, s, Φ) = q^(−n²(g_X − 1)) ∏_v W_{T,v}(g_v, s, Φ_v),
```

where `q^(−n²(g_X − 1))` is the ratio of the volume-one quotient measure to the product of the local
integral-volume-one measures; each `W_{T,v}` continues analytically in `s`.

*Proof sketch.* The duality is Layer 2's residue duality on the `n²`-dimensional `F`-space
`Herm_n`; the trace pairing is unimodular on `Herm_n(O_{F′_v})` at every unramified
place, split or inert. Each diagonal coordinate pairs by ordinary multiplication; each
off-diagonal pair uses the unimodular trace form of the unramified quadratic étale
algebra. In the split case it is the matrix trace pairing on `M_n(O_v)`. This step uses
no restriction on `p`. Unfold the Eisenstein series in the convergence region: for nonsingular `T` only the big
Bruhat cell contributes, and the integral factorizes. The measure ratio is
`μ_int(N(F)∖N(𝔸)) = q^(n²(g_X−1))` (Layer 2.2 applied to each of the `n²` coordinates). For
rational `α` use left automorphy and change variables on the compact quotient. For local `α`
use the section's transformation law in the Whittaker integral; its Jacobian contributes
`|det α|_{F′_v}^n`, giving exponent `−s+n/2`. Multiplying these local identities gives the
adelic-Levi formula for a nonsingular global coefficient as a product of transformed local
Whittaker functions. (Feng–Yun–Zhang, §2.2, equations (2.1)–(2.4),
pp. 9–10.)

**Source correction.** In FYZ (2.1), an adelic `α` makes `ᵗᾱTα` adelic, so it is not a global
Fourier index in general. The global rational covariance and the local Whittaker covariance
above have explicit domains. The latter is FYZ (2.3); together with (2.2) it supplies the
adelic nonsingular calculation needed in §7.6. The full, possibly singular global coefficient
is not assigned the local Whittaker transformation law.

*Needs:* Layers 2.2 and 7.2; AutomorphicLFunctionsAndLocalFactors AL.3 *Curve additive analysis*.

**Checks.**

- For `g_X = 1` the measure factor is `1`; for `g_X = 0` it is `q^(n²)`.
- Over `𝔽₂`, the diagonal coordinate of `Herm_1` pairs as `tb`, with Gram matrix
  `[1]`. For an inert off-diagonal pair use `𝔽₄=𝔽₂[u]/(u²+u+1)`:
  `Tr(xȳ)` on the basis `1,u` has matrix `[[0,1],[1,0]]`, of determinant `1`.
  In the split matrix model the matrix units pair by `Tr(E_ij E_kl)=δ_jk δ_il`.
  Thus neither case introduces a factor `2` in the dual lattice.
- For `det T = 0` the factorization is not asserted: further Bruhat cells contribute.
- If the local integrals are taken with the local self-dual measures of 2.2 instead of `N_n(O_v)` of
  volume one, the prefactor disappears, since `μ_ω(𝔸/K) = 1`; the factor `q^(−n²(g_X − 1))`
  belongs to the integral-volume-one normalization, and the two must not be mixed.
- With `n = 1`, `T = 0` and generic `s`, the full constant coefficient has both `s` and `−s`
  exponents. A single local Whittaker exponent gives a false adelic transformation law for it.
- Rational `α` preserves rational indices and has norm `1`; a general adelic `α` has neither
  property. In particular no global symbol `E_{ᵗᾱTα}` is formed in the latter case.

For each `v ∈ S`, nonsingular `T_v ∈ Herm_n(F_v,ω_{F_v})`, and a specified
`U_v`-fixed flat section, define the **ramified local Fourier factor**
`𝓦_v(T_v,g_v;z)`, `z=q_v^(−s)`, as the rational continuation of the local Whittaker
integral above from `Re s > n/2`. Prove rationality for every such section by the
local Bruhat integral, compatibility with linear combinations and refinement of `U_v`,
and the displayed local Levi covariance. Finite-dimensional level spaces admit a
nonzero common Laurent denominator; the factor is evaluated away from its zero locus,
or used as a rational function. A change of section scales the factor linearly; there
is no density-only formula independent of that section. The nonsingular global
factorization holds with these factors at `S` and the spherical factors elsewhere.
(Morris I, pp. 160–168, for rational section/intertwining families; FYZ §2.2,
equations (2.2)–(2.3), pp. 9–10, for the unfolded Whittaker integral and covariance.)
*Needs:* §7.2 continuation, §7.3 unfolding and local Levi covariance, SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.3 (local induced spaces and functionals),
and ReductiveGroupsPartII RG2.4 and SmoothRepresentationsOfLocalGroups SR.4.4 (local unitary groups).

**Checks for ramified factors.**

- For `Φ_v=0`, the integral and its rational continuation are `0`; replacing the
  factor by an unqualified density polynomial would give a nonzero value in general.
- Replacing `Φ_v` by `2Φ_v` multiplies the factor by `2` at every regular parameter.
  Thus normalizing a global formula requires the local sections as data.
- For unramified `χ_v`, the spherical section, a self-dual rank-one lattice and `s=0`,
  the factor is `1−η_v(π_v)q_v⁻¹`; at a split place with `q_v=3` this is `2/3`.
  Section 7.5 proves this specialization from the density comparison.

### 7.4 Split Hermitian local densities

Let `F_v` be any nonarchimedean local field and `F′_v/F_v` an unramified quadratic
étale algebra, including `F_v × F_v`. There is no characteristic or residue-characteristic
restriction in this section. In its local formulas abbreviate `F=F_v` and `F′=F′_v`.
Fix a uniformizer `π`, put `q = #κ(F_v) ≥ 2`, and set
`η(π)=1` in the split case and `η(π)=−1` in the inert case. All lattices in the
polynomial statements are integral and nondegenerate. In the split case a Hermitian `O_{F′}`-lattice is a pair of
`O_F`-lattices `(L₁, L₂)` with an integral `O_F`-bilinear pairing perfect after `⊗ F`.
Define `L^∨ = (L₁^∨, L₂^∨)`, where `L₁^∨` is the lattice in `L₁ ⊗ F` pairing integrally with
`L₂`, and `L₂^∨` pairs integrally with `L₁`; these are cross-duals.
Define, for both cases, the representation density
`Den(M, L) := lim_N #Rep_{M,L}(O_F/π^N) / q^(N n(2m−n))` for ranks `m ≥ n`, with zero density
if no generic isometric embedding exists (and define it as zero for `m < n`). The expected
dimension `n(2m−n)` is used even when the generic fiber is empty. Put
`m(a; T) := ∏_{i=0}^{a−1} (1 − (η(π)q)^i T)`. For a finite-length torsion `O_{F′}`-module `T`, let
`ℓ′(T)` be its `O_{F′}`-length in the inert case, and half its underlying `O_F`-length
in the split case. Let `t′(T)` be `dim_{κ(F′)} T/πT` in the inert case and
`(dim_{κ(F)} T/πT)/2` in the split case. For arbitrary split
torsion modules these half-lengths may be half-integers. The Hermitian quotient `L^∨/L` has
equal lengths and types in its two components, so its half-length and half-type are integers.
For an integral lattice write `t′(L) := t′(L^∨/L)`; this is the type used in the overlattice sum.
Prove
hermitianDensity_split (Cho–Yamauchi formula, split and inert uniformly):

```text
(1)  Den(⟨1⟩^(n+j), ⟨1⟩^n) = ∏_{i=1}^{n} (1 − (η(π)q)^(−i) T)  at  T = (η(π)q)^(−j);
(2)  there is a unique Den(T, L) ∈ ℤ[T] with Den((η(π)q)^(−j), L) = Den(⟨1⟩^(n+j), L)/Den(⟨1⟩^(n+j), ⟨1⟩^n)
     for all j ≥ 0;
(3)  Den(T, L) = Σ_{L ⊆ L′ ⊆ L′^∨ ⊆ L^∨} T^(2ℓ′(L′/L)) m(t′(L′); T).
```

The auxiliary invariant API includes:

- Cross-duality is involutive on nondegenerate split lattices, and reverses lattice inclusion.
- Length is additive in short exact sequences; type is the residue dimension of the quotient
  by `π`. Both vanish on the zero torsion module, with the stated half-normalization in the
  split case.
- The weight polynomial satisfies `m(0;T)=1` and
  `m(a+1;T)=m(a;T)(1−(η(π)q)^aT)` for `a≥0`.

Every exponent `2ℓ′(L′/L)` is an integer, although `ℓ′(L′/L)` need not be. The denominator
in (2) is nonzero: each factor is `1 − (η(π)q)^(−i−j)` with `i+j ≥ 1` and `q > 1`.
The rank-zero products are `1`.

GeometryOfNumbersAndQuadraticArithmetic §3.2 supplies the inert case when the base field
has characteristic different from two, including dyadic residue fields. This section adds
the split case, the inert equal-characteristic-two case and their uniform comparison.
For the latter the primitive Gram differential is onto: matrix off-diagonal coordinates
are free and the diagonal uses the surjective trace of the unramified quadratic algebra,
including `𝔽_4 → 𝔽_2`. Saturation into finitely many integral overlattices then proves
stabilization and the same interpolation identity, without division by two. The normalized density polynomial has the following API:

- For self-dual `L`, `Den(T,L)=1`.
- The polynomial depends only on the Hermitian torsion module `L^∨/L`.
- It satisfies `Den(T,L) = (η(π)T)^(ℓ′(L^∨/L)) Den(1/T,L)` as a Laurent-polynomial
  identity; its degree is `ℓ′(L^∨/L)` and its constant term is `1`.

*Proof sketch.* As for quadratic forms, `Den(⟨1⟩^m, L)` is a sum over integral overlattices
`L′ ⊇ L` of `#(L′/L)^(−(m−n))` times the number of isometric embeddings of the reduction `L′ ⊗ k`
into `⟨1⟩^m ⊗ k`. In the split case the residue algebra is `k × k`, Hermitian spaces over it are
pairs of `k`-spaces with a pairing, and the embedding counts are products of counts of injective
linear maps, `q^(2mn−n²) ∏_{i=0}^{n+a−1} (1 − q^(i−m))` for a reduction with radical of rank `a`.
(Feng–Yun–Zhang, §§2.3–2.4, Definition 2.2 and Theorem 2.3 with proof, pp. 10–12; Remarks 2.4–2.6,
pp. 12–13; Li–Zhang, *Kudla–Rapoport cycles and derivatives of local densities*, §3.5,
Theorem 3.5.1, pp. 17–18, for the inert case.)

*Needs:* GeometryOfNumbersAndQuadraticArithmetic §3.2; Mathlib finite-field linear algebra.

**Checks.**

- For self-dual `L`, `Den(T, L) = 1`, `t′(L^∨/L) = 0` and
  `ℓ′(L^∨/L) = 0`; for the zero torsion module both invariants are zero.
- `m(0;T) = 1`, `m(1;T) = 1−T`, and
  `m(2;T) = (1−T)(1−η(π)qT)`. Thus the first two cases do not detect the inert
  sign, but the third does.
- For a rank-one lattice with Gram element `π^r`, `r > 0`, `t′(L^∨/L) = 1` and
  `ℓ′(L^∨/L) = r` in either case. A lattice with Gram element `π⁻¹`
  is not integral and has no quotient `L^∨/L`; it is excluded from these targets.
- In the split case `η(π) = 1`, so `m(a; T) = ∏_{i<a}(1 − q^i T)`, and the exponent `2ℓ′` equals the
  total `O_F`-length `ℓ(L′₁/L₁) + ℓ(L′₂/L₂)`, an integer.
- For `n = 1` and `L` of type `π^r` (split: `(O, π^r O)` with the product pairing; inert: `O_{F′}`
  with the form `π^r x ȳ`), formula (3) gives `Den(T, L) = Σ_{i=0}^{r} T^i` in the split case and
  `Σ_{i=0}^{r} (−T)^i` in the inert case; using the inert formula in the split case gives the
  wrong signs.
- In the split case `L = (O, πO)`, `L′ = (O,O)` is an integral self-dual overlattice.
  Here `ℓ(L′/L) = 1` and `ℓ′(L′/L) = 1/2`, so its term has exponent `1`, not `2`.
- With residue field `𝔽_2`, the split rank-one lattice `(O,πO)` has polynomial
  `1+T`, while the inert rank-one lattice with Gram element `π` has `1−T`.
  For the inert unit line the residue norm-one fibre has `3` elements and the trace
  takes values `Tr(0)=Tr(1)=0`, `Tr(u)=Tr(u+1)=1` for `u²+u+1=0`.
- For the rank-zero lattice the representation scheme has one point, and its density and
  normalized polynomial are both `1`; for `m < n` there is no generic embedding and density `0`.

### 7.5 Local Whittaker functions and densities

For odd-characteristic global data and an unramified `χ_v`, use the normalized spherical
section. Here `q=q_v`, `O_F=O_v` and `O_{F′}=O_{F′_v}` in the local formulas. Prove whittaker_eq_density: at that place, with `L` a Hermitian `O_{F′}`-lattice of rank
`n`, `T` the Gram matrix of an `O_{F′}`-basis of `L` and `θ` a generator of `ω_{O_F}`,

```text
W_{Tθ}(1, s, Φ_v) = L_{n,v}(s)⁻¹ · Den(q^(−2s), L),      L_{n,v}(s) = ∏_{i=1}^{n} (1 − η(π)^i q^(−i−2s))⁻¹.
```

*Proof sketch.* Both sides are rational in `q^(−s)`, so it suffices to compare them at
`s = j ≥ 0`. There `L_{n,v}(j) = Den(⟨1⟩^(n+2j), ⟨1⟩^n)⁻¹` by 7.4(1), so the claim becomes
`W_{Tθ}(1, j, Φ_v) = Den(⟨1⟩^(n+2j), L)`. Realize the section at `s = j` through the Weil
representation on a self-dual lattice of rank `n + 2j` (Rallis' interpolation), so that the
Whittaker integral becomes a Fourier integral of the characteristic function of `L^n` and computes
the representation density. The source rank is `n + 2j`, with `X = q^(−2j)`, not `n + j` with an
unchanged argument. (Feng–Yun–Zhang, §2.5, Lemma 2.7 and proof, pp. 13–14; Kudla–Rapoport,
*Special cycles on unitary Shimura varieties II: global theory*, §10, Proposition 10.1 and proof,
pp. 37–38 of arXiv:0912.3758v2, for the same computation over `ℚ_p`.)

*Needs:* Layers 7.2–7.4; MetaplecticAutomorphicForms (the Weil representation and Weil index over
every local field); SmoothRepresentationsOfLocalGroups §SR.4.4.

**Checks.**

- For self-dual `L`, `W_{Tθ}(1, s, Φ_v) = L_{n,v}(s)⁻¹`.
- At `s = 0` the identity reads `W_{Tθ}(1, 0) = Den(⟨1⟩^n, L)`, the classical representation
  density.
- In the split case, replacing `q^(−2s)` by `q^(−s)` would match the rank-`(n + j)` density at
  `s = j`, which is the wrong normalization for this section.

### 7.6 The global coefficient formula of Feng–Yun–Zhang

For a chosen everywhere-unramified `χ` as in §7.1 and its normalized spherical section,
let `𝓔` be a vector bundle of rank `n` on `X′` and `a : 𝓔 → σ^*𝓔^∨` an injective Hermitian map,
with `𝓔^∨ = Hom(𝓔, ω_{X′})` (Serre duality, SchemeAndStackFoundations §3.3). Define
`Den(T, (𝓔, a)) := ∏_{v ∈ |X|} Den_v(T^(d_v), (𝓔_v, a_v))`, a finite product (almost every factor
is `1`), and `E_a(m(𝓔), s, Φ)` the coefficient of 7.3 attached to `(𝓔, a)` through a rational
trivialization of `𝓔` (independent of the choice). Prove fyz_globalCoefficient:

```text
E_a(m(𝓔), s, Φ) = χ(det 𝓔) · q^(−deg(𝓔)(s − n/2) − n² deg(ω_X)/2) · L_n(s)⁻¹ · Den(q^(−2s), (𝓔, a)),
```

with `L_n(s) = ∏_v L_{n,v}(s)` and `deg ω_X = 2g_X − 2`.

Degrees here are measured over the original `𝔽_q`, also for the constant or disconnected
double cover: `deg_{𝔽_q} ω_{X′} = 2 deg_{𝔽_q} ω_X`. If the local lattices are
`α_v O_{F′_v}^n`, the conventions are `deg_{𝔽_q} 𝓔 = −Σ_{v′} [κ(v′):𝔽_q] ord_{v′}(det α)`
and `χ(det 𝓔) = χ(det α)`, hence `|det α|_{F′} = q^(deg_{𝔽_q} 𝓔)`.

*Proof sketch.* Choose a rational trivialization of `𝓔`; then `a` becomes a nonsingular
`ω_F`-valued Hermitian matrix `T` and `𝓔` an element `m(α)` of the Levi. Apply the factorization
of 7.3, its local whittaker_levi at every place to extract `χ(det 𝓔)` and the degree factor,
and 7.5 at every place;
self-duality almost everywhere makes the product finite, and changes of trivialization cancel by
the product formula and the triviality of `χ` on `F′ˣ`. (Feng–Yun–Zhang, §2.6, equations
(2.10)–(2.12), Theorem 2.8 and proof, pp. 14–15.)

*Needs:* Layers 7.3–7.5; SchemeAndStackFoundations §3.3 (degrees of vector bundles and Serre
duality on curves); Layer 0.1.

**Checks.**

- At `g_X = 1` the canonical-degree factor is `1`.
- If every local lattice is self-dual, `Den(q^(−2s), (𝓔, a)) = 1`.
- The global substitution is `T^(d_v)` at a place of degree `d_v`; substituting `T` at every place
  gives the wrong `L`-factor and the wrong density.
- The dual uses `ω_{X′}`, of degree `n deg ω_{X′} − deg 𝓔` for `𝓔^∨`; the plain dual of degree
  `−deg 𝓔` would shift the exponent.
- For the constant cover, an `𝔽_{q²}`-degree-`d` line bundle has degree `2d` in this formula;
  its norm is `(q²)^d = q^(2d)`. The exact-constant degree used to describe `χ` in §7.1
  cannot replace this degree in the exponent.

For every finite-ramification inducing character, also prove the **general coefficient
formula with level data**. Keep a rational nonsingular index `T`, an adelic matrix
`α`, and the chosen local sections at `S` as part of the data; a vector bundle alone
forgets ramified-level information. Write `L_n^S(s)=∏_{v∉S}L_{n,v}(s)` and
`Den^S=∏_{v∉S}Den_v(q_v^(−2s),L_v)`, where the `L_v` have Gram matrix
`ᵗᾱ_vT_vα_v` after choosing a generator of `ω_{O_v}`. Then

```text
E_T(m(α),s,Φ) = q^(−n²(g_X−1)) χ(det ᾱ)⁻¹ |det α|_{F′}^(−s+n/2)
                · L_n^S(s)⁻¹ · Den^S · ∏_{v∈S} 𝓦_v(T′_v,1;q_v^(−s)),
T′_v = ᵗᾱ_v T_v α_v.
```

Prove this as an identity of rational functions, using §7.3 factorization and covariance,
§7.5 at `v∉S`, and the ramified factors at `S`. Enlarge `S` to include all nonintegral
or nonspherical local data. Products of the good density polynomials are finite, and
the good Euler product is continued by §§5.1–5.5: the quadratic-character
Euler product is `Z(X′,T)/Z(X,T)`, and the trivial character uses `Z(X,T)`.
At a ramified place changing the integral frame changes the section and its local factor
with it; the formula is invariant under this simultaneous change, and under rational
trivializations by automorphy and the product formula. No character value of an
unframed bundle is asserted in the ramified case. *Needs:* §§5.1–5.5, 7.1–7.3 and 7.5.

**Checks for the general coefficient formula.**

- If `S=∅`, `χ(det ᾱ)⁻¹=χ(det α)` since `χ` kills norms from `F′`; the formula
  becomes the displayed spherical formula with `deg 𝓔=log_q|det α|`.
- For `α=1` the character and determinant-norm factors are both `1`; scaling one
  bad local section by `2` multiplies both sides by `2`.
- Moving one unramified spherical place into `S` replaces its factor
  `L_{n,v}(s)⁻¹Den_v` by exactly that Whittaker integral, leaving the product unchanged.

### Examples

For `n = 1`, `X = ℙ¹`, `F′ = F × F` and `(𝓔, a)` self-dual, the formula reads
`E_a = χ(det 𝓔) q^(−deg(𝓔)(s − 1/2) + 1) ∏_v (1 − q_v^(−1−2s))`.

### Dependencies

Layers 0, 2, 6; ArithmeticGaloisDuality §R02.3.2; AutomorphicLFunctionsAndLocalFactors AL.3;
ReductiveGroupsPartII Layers RG2.3–RG2.4; SmoothRepresentationsOfLocalGroups
§§SR.2.1–SR.2.3, SR.4.1 and SR.4.4;
GeometryOfNumbersAndQuadraticArithmetic §3.2; MetaplecticAutomorphicForms; SchemeAndStackFoundations
§§2.11, 3.3 and 3.6; EtaleCohomologyFoundations §0.11.

## Worked examples

Each example fixes a convention or a hypothesis that a plausible wrong formalisation would get
wrong; each is a test of the layers cited.

1. **The rational function field** `F = 𝔽_q(t)` (Layers 0, 2, 5). `k̃ = 𝔽_q`, `g = 0`, `h = 1`;
   `N_r = q^r + 1` (the `q` places `t = a` and `∞`, plus higher-degree places counted with their
   degrees); `Z = 1/((1 − T)(1 − qT))`, `L = 1`; for `ω = dt`, `(ω) = −2∞` and
   `μ_ω(∏_v O_v) = q`; the finite-chart polynomial ring alone sees only `q` of the `q + 1` places of
   degree one. For `m ≥ 0`, `L(m∞)` has basis `1,t,…,t^m`; `L(−∞) = 0`. At infinity choose
   `u = t⁻¹`, giving completion `𝔽_q((u))` and `dt = −u⁻² du`. Its valuation degree is `1`
   on the uniformizer idele and Yu degree `−1`.
2. **An elliptic function field over `𝔽_5`** (Layers 1, 5). `y² = x³ + x + 1`: the discriminant is
   `−16·31 ≡ 4` modulo `5`, so the curve is smooth of genus one. The affine fibres over
   `x = 0, 1, 2, 3, 4` contain `2, 0, 2, 2, 2` points (`x³ + x + 1 = 1, 3, 1, 1, 4` and the squares
   modulo `5` are `0, 1, 4`); with the point at infinity, `N_1 = 9`. Hence `a_1 = 9 − 6 = 3`,
   `L = 1 + 3T + 5T²`, `h = 9`, and the Newton data of 5.6 with `N_1 = 9` have this unique solution.
   The invariants of `D = 0` relative to `k[x]` are `(0, −2)`;
   `L(2O) = span(1,x)` and `L(3O) = span(1,x,y)`. At `O` use `u = −x/y`, with
   `ord_O x = −2`, `ord_O y = −3`, so `F_O ≃ 𝔽_5((u))`. The invariant differential
   `dx/(2y)` has order zero; its self-dual integral volume is `1`. The place degree is `1`.
3. **Its constant extension to `𝔽_{25}`** (Layer 5.5). With `α + β = −3` and `αβ = 5`,
   `α² + β² = −1`, so `N_2 = 25 + 1 + 1 = 27` and `L_{F·𝔽_{25}} = 1 + T + 25T²`; equivalently
   `L(T)L(−T) = (1 + 5T²)² − 9T² = 1 + T² + 25T⁴`.
   Independently enumerate `x,y ∈ 𝔽_5[u]/(u²−2)`: thirteen `x` values have two solutions
   and twelve have none, giving `26` affine points and `O`, hence `27`. Base change preserves
   the displayed RR bases; `O` has completion `𝔽_{25}((−x/y))` and degree `1` over
   `𝔽_{25}`, or degree `2` over the original `𝔽_5`. Counts use the former exact constants.
4. **A wild cover over `𝔽_3`** (Layers 3, 5). `y³ − y = t^(−2)` over `𝔽_3(t)`: one totally ramified
   place over `t = 0` with conductor `3·[0]` and different `6·[0]`; at `t = 1` and `t = 2` the
   right side is `1` and `y³ − y − 1` has no root in `𝔽_3`, so no rational point lies there; over
   `∞` the residue equation `y³ − y = 0` splits, giving three rational places. Hence `N_1 = 4`,
   `g = 1`, `a_1 = 4 − 4 = 0` and `L = 1 + 3T²`. A tame Riemann–Hurwitz count (different exponent
   `e − 1 = 2`) would give `2g − 2 = 3(−2) + 2 = −4`, which is impossible; the wild exponent `6`
   gives `2g − 2 = −6 + 6 = 0`. Write `z = t⁻¹` and `O` for the place over `t = 0`.
   The equation is `z² = y³−y`, so `ord_O y = −2`, `ord_O z = −3` and
   `L(3O) = span(1,y,z)`. Relative to `𝔽_3[z]` the invariants of `D = 0` are `(0,−1,−2)`.
   Choose `π = y/z = ty` at `O`, giving completion `𝔽_3((π))` and place degree `1`.
   At each of the three places over infinity, `t⁻¹` is a uniformizer and the residue of `y`
   is respectively `0,1,2`. These are distinct projective places, each of degree `1`.

## Downstream consumers

- **GlobalShtukasAndFunctionFieldLanglands**: automorphic function modules with
  integral coefficients, cusp modules, Harder finiteness and the unramified Hecke action
  (Layer 6) for V. Lafforgue's excursion construction, and the Feng–Yun–Zhang coefficients
  (Layer 7) for the higher Siegel–Weil formula; the generalized Picard and ramified rank-one
  Lang-cover comparison, with the constant-field direction and least conductor (§§4.6–4.10).
- **ExcursionOperatorsAndSpectralAction**: Layer 6 and the equal-characteristic local theory of
  Layer 4.
- **HigherLocalFieldsAndHigherClassFieldTheory** and **DrinfeldModulesAndTModules**:
  the conventions of Layer 0 and the equal-characteristic local
  class field theory and Artin–Schreier–Witt theory of Layers 3–4.
- **CountingBundlesAndHallAlgebrasOfCurves**, **FiniteFieldsAndCharacterSums** and
  **GlobalGaloisDeformationsPartII**: the zeta functions and `L`-polynomials of Layer 5.
- **ExoticMonoidalStructuresAndAbstractAutomorphicity**: Layers 4–6.

## References

- **Rosen**: M. Rosen, *Number Theory in Function Fields*, Graduate Texts in Mathematics 210,
  Springer, 2002, Chapter 5, pp. 45–46 (function fields and exact constants),
  [publisher preview](https://page-one.springer.com/pdf/preview/10.1007/978-1-4757-6046-0_5).
- **Goss**: D. Goss, *Basic Structures of Function Field Arithmetic*, Ergebnisse der Mathematik
  und ihrer Grenzgebiete 35, Springer, 1998 printing, §1.1, Example 1.1.1 and Proposition 1.1.2,
  p. 1 (additive polynomials),
  [publisher preview](https://page-one.springer.com/pdf/preview/10.1007/978-3-642-61480-4_1).
- **Stichtenoth**: H. Stichtenoth, *Algebraic Function Fields and Codes*, 2nd ed., Graduate Texts
  in Mathematics 254, Springer, 2009, §5.1, Lemma 5.1.1, p. 185, Definition 5.1.2 and
  Proposition 5.1.3, p. 186 (finite divisor counts and the class number),
  [publisher preview](https://page-one.springer.com/pdf/preview/10.1007/978-3-540-76878-4_5).
- **Yu**: H. Yu, *Comptage des systèmes locaux ℓ-adiques sur une courbe*, Ann. of Math. 197 (2023);
  [arXiv:1807.04659v5](https://arxiv.org/abs/1807.04659v5). §§2.1–2.3, pp. 6–12; §5.3.1, Lemma 5.3.3,
  pp. 36–38.
- **Kosters–Wan**: M. Kosters and D. Wan, *On the arithmetic of `ℤ_p`-extensions*,
  [arXiv:1607.00523v1](https://arxiv.org/abs/1607.00523v1). §§3.1–3.2, pp. 6–10; §§4.1–4.4,
  pp. 14–19; Theorem 4.12 and Proposition 4.14, pp. 21–23.
- **Kosters**: M. Kosters, *A short proof of a Chebotarev density theorem for function fields*,
  [arXiv:1404.6345v1](https://arxiv.org/abs/1404.6345v1). Theorem 1.1 and Corollary 1.2, p. 2;
  Lemmas 1.3–1.4 and proofs, pp. 3–5.
- **Yoshida**: T. Yoshida, *Local class field theory via Lubin–Tate theory*, Ann. Fac. Sci.
  Toulouse Math. 17 (2008), 411–438, [Numdam](https://www.numdam.org/item/10.5802/afst.1188.pdf).
- **Hess**: F. Hess, *Computing Riemann–Roch spaces in algebraic function fields and related
  topics*, J. Symbolic Comput. 33 (2002); author manuscript (21 pp.) used for the page numbers.
- **Parshin**: A. N. Parshin, *Notes on the Poisson formula*,
  [arXiv:1011.3392v1](https://arxiv.org/abs/1011.3392v1). §2.1, p. 7; §2.2, pp. 9–10.
- **Roquette**: P. Roquette, *Class field theory in characteristic p, its origin and development*,
  [author PDF](https://www.mathi.uni-heidelberg.de/~roquette/klkall.pdf). §4.3.3, pp. 25–28.
- **Milne ADT**: J. S. Milne, *Arithmetic Duality Theorems*, 2nd ed., 2006,
  [author PDF](https://www.jmilne.org/math/Books/ADTnot.pdf). Appendix A, A.7, pp. 131–132,
  A.8–A.9, pp. 132–133, and A.10–A.12, pp. 134–136.
- **Conrad (geometric)**: B. Conrad, *Geometric global class field theory*,
  [handout](https://math.stanford.edu/~conrad/249BW09Page/handouts/geomcft.pdf), §2, pp. 1–3,
  Theorems 3.1–3.2, pp. 3–4.
- **Guignard**: Q. Guignard, *On the ramified class field theory of relative curves*,
  Algebra & Number Theory 13 (2019), 1299–1326,
  [publisher PDF](https://msp.org/ant/2019/13-6/ant-v13-n6-p03-s.pdf).
  §4.7, Proposition 4.8 and Lemma 4.9, pp. 1317–1319; Propositions 4.11–4.14 and proofs,
  pp. 1319–1321. Section 4.6 uses the rigidified-Picard construction, and §4.7 uses the
  Abel-bundle argument.
- **Russell**: H. Russell, *Albanese varieties with modulus over a perfect field*,
  [arXiv:0902.2533v3](https://arxiv.org/abs/0902.2533v3), §3.3, Theorems 3.24–3.25,
  p. 34, for the principal-congruence formulation and linear part of a generalized
  Jacobian. The fixed-modulus universal property in §4.7 is deduced from the Abel bundle.
- **Harder**: G. Harder, *Chevalley groups over function fields and automorphic forms*, Ann. of
  Math. 100 (1974), 249–306. §§1.1–1.2, pp. 252–256.
- **Morris I, II**: L. E. Morris, *Eisenstein series for reductive groups over global function
  fields I. The cusp form case*, Canad. J. Math. 34 (1982), 91–168; *II. The general case*, ibid.,
  1112–1182 (both free on Cambridge Core).
- **Conrad**: B. Conrad, *Weil and Grothendieck approaches to adelic points*, Enseign. Math. 58
  (2012), 61–97, [author PDF](https://math.stanford.edu/~conrad/papers/adelictop.pdf).
- **BHKT**: G. Böckle, M. Harris, C. Khare and J. A. Thorne, *Ĝ-local systems on smooth projective
  curves are potentially automorphic*, Acta Math. 223 (2019);
  [arXiv:1609.03491v2](https://arxiv.org/abs/1609.03491v2). §8.1, pp. 34–35.
- **Ciubotaru–Harris**: D. Ciubotaru and M. Harris, *On the generalized Ramanujan and Arthur
  conjectures over function fields*, [arXiv:2311.15300v1](https://arxiv.org/abs/2311.15300v1). §3,
  pp. 8–9.
- **Abdurrahman–Venkatesh**: A. Abdurrahman and A. Venkatesh, *Symplectic L-functions and symplectic
  Reidemeister torsion (mod squares)*, [arXiv:2303.13436v1](https://arxiv.org/abs/2303.13436v1).
  §3.2, p. 27.
- **Stacks**: The Stacks Project, Chapter 64 *The Trace Formula*, Section 64.20,
  [Tag 03UZ](https://stacks.math.columbia.edu/tag/03UZ) (Theorem 64.20.1).
- **SGA 4½**: P. Deligne, *Fonctions L modulo ℓⁿ et modulo p*, in *Cohomologie étale (SGA 4½)*,
  Lecture Notes in Math. 569, Springer, 1977; Théorème 2.2.
- **Feng–Yun–Zhang**: T. Feng, Z. Yun and W. Zhang, *Higher Siegel–Weil formula for unitary groups:
  the non-singular terms*, [arXiv:2103.11514v4](https://arxiv.org/abs/2103.11514v4). §§2.1–2.6,
  pp. 8–15.
- **Li–Zhang**: C. Li and W. Zhang, *Kudla–Rapoport cycles and derivatives of local densities*,
  [arXiv:1908.01701v3](https://arxiv.org/abs/1908.01701v3). §3.5, pp. 17–18.
- **Kudla–Rapoport**: S. Kudla and M. Rapoport, *Special cycles on unitary Shimura varieties II:
  global theory*, J. reine angew. Math. 697 (2014);
  [arXiv:0912.3758v2](https://arxiv.org/abs/0912.3758v2). §10, Proposition 10.1, pp. 37–38.

- **SGA 3**: M. Demazure and A. Grothendieck (eds.), *Schémas en groupes*, Tome III,
  Exposé XXVI, Proposition 2.1; Gille–Polo re-edition, May 2009 version,
  [Exposé XXVI](https://wstein.org/sga/SGA3/Expo26.pdf).
- **Borel–Tits**: A. Borel and J. Tits, *Groupes réductifs*, Publ. Math. IHÉS 27 (1965),
  Théorème 3.17, [publisher archive](https://www.numdam.org/item/PMIHES_1965__27__55_0/).
