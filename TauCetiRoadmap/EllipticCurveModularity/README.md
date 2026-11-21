# Roadmap: modularity and modular parametrisations of elliptic curves over ℚ

**Summary.** An elliptic curve over ℚ carries two kinds of arithmetic: the numbers of points
of its reductions modulo primes, which are the coefficients of its L-function, and its ℓ-adic
Galois representations. Modularity says that the same numbers are the Fourier coefficients of
a weight-two newform, and that the curve is a quotient of the Jacobian of a modular curve.
This roadmap states modularity of every elliptic curve over ℚ in its three classical forms,
deduces it from the modularity theorem over totally real fields, and develops the comparison
between a curve and its newform.

The main theorem says that for every elliptic curve E over ℚ, of conductor `N_E`, there is a
normalized newform of weight two, level exactly `N_E` and trivial character whose n-th
coefficient equals the n-th coefficient of the L-function of E for every n; these
coefficients are integers. Equivalently, there is a surjective homomorphism over ℚ from the
modular Jacobian `J₀(N_E)` onto E, and there is a nonconstant morphism over ℚ from the
modular curve `X₀(N_E)` to E sending the cusp ∞ to the origin. Curves with complex
multiplication over ℚ̄ are included. As a consequence the completed L-function
`N_E^(s/2)(2π)^(−s)Γ(s)L(E,s)` extends to an entire function and is carried to itself, up to a
sign ±1, by `s ↦ 2 − s`.

The existence of the newform is the case of the rational field in the theorem that every
elliptic curve over a totally real field is modular, proved in
EllipticCurveModularityTotallyReal. The description of newforms over ℚ by cuspidal
automorphic representations, from GL2AutomorphicRepresentationsAndTransfer, turns the
automorphic representation given there into a classical newform. Everything else here holds
for any newform attached to E, meaning a newform of trivial character whose Hecke eigenvalues
agree with the Frobenius traces of E at almost all primes. Such a form is unique, has integer
coefficients and level `N_E`, and has the Euler factor of E at every prime, bad primes
included. Faltings's isogeny theorem then gives an isogeny over ℚ from the elliptic quotient
of `J₀(N_E)` attached to the form onto E, and through it a modular parametrisation that pulls
the invariant differential of E back to a nonzero rational multiple of `2πi f(z) dz`.
Conversely, a surjective homomorphism from `J₀(N′)` onto E, at any level `N′`, produces an
attached newform, and its level `N_E` divides `N′`. These comparisons apply equally when the
modularity of a particular curve comes from a geometric construction.

The roadmap also proves that every endomorphism of E defined over ℚ is multiplication by an
integer, curves with complex multiplication included; together with Faltings's theorems this
makes the rational Tate modules of E absolutely irreducible. It records the relations
satisfied by the j-invariant of a curve with a rational cyclic 3- or 5-isogeny, and the four
j-invariants of curves with both. Over every number field it proves that the Dirichlet series
of an elliptic curve converges absolutely for `Re s > 3/2`.

Besides those two roadmaps, it builds on ModularForms for newforms, strong multiplicity one
and their L-functions, on ModularCurvesPartII for modular Jacobians and their quotients, and on
FaltingsFinitenessAndIsogenyTheorems for semisimplicity and the isogeny criterion. Modularity
of abelian varieties of GL₂-type over ℚ, which contains the case of dimension one, is the
subject of EllipticCurveModularityPartIIGL2TypeAbelianVarieties.

The first layer treats rational endomorphisms and rational isogenies, and the second
residual attachment of a curve to a newform at a prime. The third defines attachment, proves
uniqueness and rationality, obtains an attached newform for every curve and selects the newform
of the curve. The fourth compares Tate modules, conductors and Euler factors, the fifth
constructs the isogeny and the modular parametrisation, and the sixth proves the converse, the
equivalence of the three formulations and the functional equation of the L-function.

## How to read the build

Layer R29.1 proves that every endomorphism of an elliptic curve over ℚ defined over ℚ is an
integer and treats rational cyclic subgroups and the rational 3-, 5- and 15-isogenies. Layer
R29.2 defines residual attachment of a curve to a newform at a prime and derives it from
attachment. Layer R29.3 defines the attachment predicate and proves its uniqueness and
rationality without any existence input; its existence theorem is the case `K=ℚ` of
EllipticCurveModularityTotallyReal §4.4, read through the classical newform dictionary of
GL2AutomorphicRepresentationsAndTransfer, and it selects the newform `F_E`. Layer R29.4
identifies every local factor, R29.5 constructs the chosen parametrisation, and R29.6 proves
the geometric converse and transfers the analytic continuation. Definitions that involve
choices of new objects have their full mathematical specification below even when their
carriers are not available to the representative Lean file.

## Conventions

Write `E` for a smooth projective elliptic curve over ℚ with origin `O`, presented by a
nonsingular Weierstrass equation

`y²+a_1xy+a_3y=x³+a_2x²+a_4x+a_6.`

The coefficients of a model are ordered `a_1,a_2,a_3,a_4,a_6`. In Mathlib this is a
`WeierstrassCurve ℚ` with the instance `E.IsElliptic`; this instance asserts that the
discriminant is a unit. Reduction types always refer to a minimal model over ℤℓ. An
integral presentation is used for calculations, but the conductor and the arithmetic
conclusions depend only on the elliptic curve. Valuations have `v_ℓ(ℓ)=1`, and
`j_E=c_4³/Δ`. At multiplicative reduction `v_ℓ(j_E)<0`, so only finitely many
rational primes divide it.

Let `N=N_E≥1` be the conductor. A prime ℓ is good exactly when `ℓ∤ N`,
multiplicative exactly when `v_ℓ(N)=1`, and additive when `v_ℓ(N)≥2`. The
latter exponent includes wild contributions at 2 and 3. The conductor is the product of
the local Artin conductors of the rational Tate representations, using an auxiliary
prime different from the place being measured.

Put `G_(ℚ)=Gal(ℚ̄/ℚ)`, write
`ρ̄_(E,p)` for the representation on `E[p](ℚ̄)`, and write
`V_r(E)=T_r(E)⊗_(ℤ_r)ℚ_r`. Both have dimension two over their
respective coefficient fields. At a good prime ℓ different from the coefficient
characteristic, **arithmetic Frobenius** has polynomial

`X²-a_ℓ(E)X+ℓ, a_ℓ(E)=ℓ+1-#Ẽ(𝔽_ℓ).`

The determinant is the cyclotomic character. For the residual representation,
`N(ρ̄_(E,p))` always means its **prime-to-`p`** Artin conductor. It has no factor
at `p`, even when `E` has bad reduction there.

The Euler polynomial is `P_ℓ(E,T)`, with local factor `P_ℓ(E,ℓ^(-s))^(-1)`. The
four possibilities are

| Reduction of `E` at ℓ | `a_ℓ(E)` | `P_ℓ(E,T)` |
| --- | --- | --- |
| good | `ℓ+1-#Ẽ(𝔽_ℓ)` | `1-a_ℓ(E)T+ℓ T²` |
| split multiplicative | `1` | `1-T` |
| nonsplit multiplicative | `-1` | `1+T` |
| additive | `0` | `1` |

For the homological representation `V_r(E)` and arithmetic Frobenius the local
polynomial is obtained on inertia **coinvariants**. Equivalently it is obtained from the
dual cohomological representation on inertia invariants using geometric Frobenius. At
split multiplicative reduction, arithmetic Frobenius acts by ℓ on the invariant line in
`V_r(E)`; using that line in the displayed Euler polynomial would incorrectly give
`1-ℓ T`. Local compatibility must carry the duality and Frobenius convention
explicitly.

The integer `a_n(E)` is the coefficient of Mathlib's `WeierstrassCurve.LFunction`. It is
multiplicative at coprime positive indices, has `a_1(E)=1`, and is determined by the
local polynomials. Its value at zero is zero, as for an arithmetic function. The complex
L-series is `WeierstrassCurve.LSeries`. Its definition as a Dirichlet series does not
itself provide analytic continuation; continuation is a theorem of Layer R29.6.

A form `F` has expansion `∑_(n≥1)A_n(F)q^n`, with `q=e^(2π iz)`, and is
normalized by `A_1(F)=1`. A newform in this roadmap has weight two, positive level, and
trivial nebentypus unless explicitly stated otherwise. The bundled library type is
`HeckeRing.GL2.Newform M 2`. Its underlying form is on `Γ₁(M)`, with a character `(ℤ/Mℤ)^×→ℂ^×`. The trivial-character condition identifies the
relevant `Γ₀(M)` subspace. The record contains newness, normalization, and the
away-from-level Hecke eigenvalue system; the bad-prime eigenvalue theory is imported
from ModularForms Layer 4. Write `K_F=ℚ(A_n(F):n≥1)` for its coefficient
field.

For trivial character let `A_F^0` be the modular quotient of `J₀(M)` attached to `F`.
The quotient `A_F^1` of `J₁(M)` has a compatible `K_F`-action and is ℚ-isogenous to
`A_F^0`. The superscripts distinguish the actual quotients; `A_F^0` is abbreviated to
`A_F` below. Isogeny of these two quotients suffices for comparing Tate modules but does
not identify their elliptic models. At level 11, this distinction separates 11a1 and
11a3.

## Coefficient and local-reduction notation

Use the light specialization `lCoeff E n := E.LFunction n`, with coefficient field ℤ,
and `coeff F n := (UpperHalfPlane.qExpansion 1 F.toCuspForm).coeff n`, with field ℂ.
Their API is the supplied zero/one normalization, coprime multiplicativity, good-prime
quadratic recurrence, bad-prime linear recurrence, and transport through equality of
models or forms. The normalization at infinity is q, not a rescaled cusp parameter
(Mathlib `WeierstrassCurve.LFunction`; ModularForms Layers 1, 4 and 7;
Cremona §2.6, (2.6.1)–(2.6.2), pp. 24–25).

**Checks.**

- `lCoeff E 0 = 0` and `coeff F 0 = 0`, while both first coefficients are 1 for E
  elliptic and F normalized; reversing the q-index fails this check.
- For the displayed 11a1 model, the explicit good-prime inputs `a₂ = −2, a₃ = −1`
  give `a₄ = (−2)² − 2 = 2` and `a₆ = (−2)(−1) = 2`.
- For its attached form at the split multiplicative prime 11, the input `a₁₁ = 1`
  gives `a₁₂₁ = 1`; applying the good-prime recurrence there would give −10.

Good and multiplicative reduction of E at a prime p mean the corresponding
Mathlib predicates on the minimal base change over `ℤ_[p]`. Their API is
invariance under rational isomorphism and change of integral presentation, disjointness
of the reduction types, and the conductor comparisons in the supplier contracts. The
supplied `minimal` operation is used before testing the type; these two predicates do
not define a new reduction theory (EllipticCurves Layer 4; Silverman, AEC VII.5).

**Checks.**

- For the 11a1 model, the input minimal discriminant `−11⁵` gives good reduction at
  7 and split multiplicative reduction at 11; the two predicates differ at both places.
- For `y² = x³ − x` at 2, the input additive reduction makes both predicates false.
- A nonminimal rationally isomorphic equation with discriminant multiplied by `7¹²`
  still has good reduction at 7 when 11a1 does; the raw equation's discriminant is not
  the good-reduction predicate.

## Layer R29.1: Rational endomorphisms and rational isogenies

This layer proves that every endomorphism of an elliptic curve over ℚ that is defined over ℚ
is multiplication by an integer, defines Galois-stable cyclic subgroups, and records the
j-invariant relations of rational cyclic 3-, 5- and 15-isogenies.

### Rational endomorphisms, including geometric complex multiplication

Prove that for every elliptic curve E over ℚ, every ℚ-defined endomorphism is
multiplication by a unique integer, so the canonical ring map `ℤ → End_ℚ(E)`,
`n ↦ [n]`, is bijective.
The headline statement `rationalEndomorphisms_eq_int` in `Suggested.lean` uses the pinned
`TauCeti.AlgebraicGeometry.AbelianVariety.End` ring for any abelian variety A over ℚ
with `A.dim = 1`. Use the action on the
one-dimensional rational invariant-differential line to embed `End_ℚ(E)` into ℚ:
in characteristic zero a nonzero elliptic endomorphism is separable and has nonzero
differential. Every endomorphism is integral over ℤ (the degree/dual-isogeny quadratic
relation of EllipticCurves Layer 1), so its rational differential scalar lies in ℤ.
Subtract multiplication by that integer and use injectivity. This proves the statement
over ℚ without discarding geometric CM. Expose uniqueness, compatibility with addition,
composition and the differential, and `deg[n] = n²` (Silverman, AEC III.4.2–III.4.3,
III.5 and III.9, endomorphisms and invariant differentials).

**Checks.**

- The identity has differential scalar 1 and degree 1; the zero endomorphism has scalar
  0 and degree 0.
- Multiplication by −2 has scalar −2 and degree 4, so degree alone does not identify it.
- For `y² = x³ − x`, geometric multiplication by i has differential scalar i and is
  defined over ℚ(i), not ℚ. Its existence does not enlarge `End_ℚ(E)`.

*Needs:* EllipticCurves Layer 1, isogeny degree, dual and invariant-differential API;
Mathlib rational integrality. Faltings is not needed for this assertion. The headline on
`AbelianVariety ℚ` also needs the carrier comparisons AbelianSchemesAndArithmeticModuli
A0.2 and A1.6 (a one-dimensional abelian variety over ℚ is an elliptic curve with its
group law, which has a Weierstrass model by ModularCurves Layer 1.3) and
FaltingsFinitenessAndIsogenyTheorems §R28.6.1(i) (`Hom_ℚ(E, E′)` and
`Hom_ℚ(E_ab, E′_ab)` correspond compatibly with composition and degree); neither is a
Faltings theorem.

### Cyclic subgroups and their Galois stability

The intended predicate `HasRationalCyclicSubgroup E p` uses the native point action
listed in the supplier contracts. Its API identifies stability under each Galois
automorphism with equality of its transported subgroup, relates prime-order subgroups
to residual invariant lines, and relates them to kernels of ℚ-defined prime-degree
cyclic isogenies (ArithmeticGaloisRepresentations §6.1; EllipticCurves Layer 1).
Prime-order cyclicity follows from the order hypothesis,
but rationality of a chosen generator does not.

**Checks.**

- At p=1 the zero subgroup has order one and is stable; at p=0 no finite subgroup
  has cardinality zero. The predicate is defined for all natural p although its
  isogeny applications require p prime.
- The given order-5 rational point on 11a1 generates a stable cyclic subgroup; the
  given Frobenius polynomial irreducible over 𝔽₇ excludes a stable order-7 subgroup.
- For 162b1, `y²+xy+y=x³−x²−5x+5`, the irreducible cubic `x³−3x²+3` divides the
  7-division polynomial and its roots are permuted by duplication, giving the three
  pairs of nonzero points of an order-7 subgroup. That subgroup has a Galois orbit of
  x-coordinates of degree three. It is stable even though it has no rational nonzero generator:
  the rational point group of `y²+xy+y=x³−x²−5x+5` has no nonzero seven-torsion.
  Its good reduction at 5 has six points, excluding rational seven-torsion.
  This Check asserts the stable order-7 subgroup and the absence of rational
  seven-torsion together.

### Rational 3-, 5- and 15-isogenies

**Hauptmodul relations** (`three_isogeny_j` and `five_isogeny_j` in `Suggested.lean`). For every elliptic
curve E over ℚ with a rational cyclic 3-isogeny, there is `u∈ℚ`, `u≠0`, such that
`j_E·u=(u+27)(u+3)³`. For a rational cyclic 5-isogeny there is `v∈ℚ`, `v≠0`, such
that `j_E·v=(v²+10v+5)³`. These are necessary relations for the given curve, including
the special j-values; they do not identify a rational kernel generator. Use the
modular-curve/isogeny dictionary of ModularCurvesPartII §5.6 (cyclic subgroups and
cyclic isogenies) and §3.9 (level structures), and the native cyclic
subgroups above. The source for both relations is Barrios,
[*Explicit classification of isogeny graphs of rational elliptic curves*](https://arxiv.org/abs/2208.05603),
arXiv:2208.05603v1, Theorem 2.3 and Table 1, p. 6. Apply the parameterization to the dual isogeny
so that E is the target in Table 1's second column of j-functions. The choice of
these three isogeny targets follows the Imperial College London FLT project.

**Checks.**

- In the 3-isogeny relation, `u=−3` and `u=−27` give `j=0`; this case is included.
  In the 5-isogeny relation, `v²+10v+5` has no rational zero, so `j=0` is excluded.
- For 11a1 the stable order-5 subgroup gives v=−1/11 in the 5-isogeny
  relation: both sides equal 122023936/1771561.
  The 3-isogeny relation does not apply: at 2 its Frobenius polynomial is irreducible
  over `𝔽₃`, excluding a stable order-3 subgroup.
- The parameters 0 and ∞ are cusps, not nonsingular elliptic curves. In the displayed
  affine relations, `u=0` or `v=0` would force respectively `729=0` or `125=0`.

**The 15-isogeny boundary** (rational cyclic 15-isogenies). If E has both rational
cyclic 3- and 5-isogenies, their kernels generate a rational cyclic subgroup of order 15 and

`j_E ∈ {−25/2, −349938025/8, −121945/32, 46969655/32768}.`

The headline `fifteen_isogeny_j` in `Suggested.lean` states this four-value conclusion
for every E with both cyclic subgroups. Also assume
that E has good or multiplicative reduction at 5 and exclude the simultaneous
isogenies. For the four displayed values, `v_5(j_E)` is respectively `2,2,1,1`.
For nonzero j, good reduction at 5 makes its valuation a nonnegative multiple of 3, while
multiplicative reduction makes it negative. Thus the local hypothesis suffices; global
semistability is a special case, recorded in the Checks below. The source is
Darmon–Diamond–Taylor,
[*Fermat's Last Theorem*](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf),
§3.6, proof of Theorem 3.48, p. 102, for the four noncuspidal points and their
failure of semistability; González–Jiménez–Lario,
[*Faltings elliptic curves in twisted ℚ-isogeny classes*, supplementary tables](https://web.mat.upc.edu/joan.carles.lario/types.pdf),
§19.1, p. 93, gives their j-values. This target includes establishing the rational-point
list of `X₀(15)` and evaluating its j-map: four cusps and four noncuspidal rational
points. ModularCurvesPartII §5.6 supplies the isogeny dictionary; the rational-point
calculation is owned here, using the descent and torsion theory of EllipticCurves
Layers 2 and 6. EllipticCurves Layer 4 supplies the valuation criteria.

**Checks.**

- A globally semistable E cannot have both isogenies: it is semistable at 5.
- The curve `y²=x³−x²−8x+112` has `j=−25/2` and both isogenies; it has additive
  reduction at 5. Omitting the reduction hypothesis from the exclusion is false.
- The remaining three j-values have 5-adic valuations `2,1,1`, so the same local
  obstruction excludes each; the four-value theorem itself retains all four.

### Concrete models used in the Checks

The worked Checks use the following coefficient tuples, in the order
`a₁,a₂,a₃,a₄,a₆`. They use Mathlib's `WeierstrassCurve` coefficient
projections, discriminant and c-invariants. For these literal models, no database
lookup or classification is a target. The formulas are those of Silverman, AEC III.1 and Mathlib's
`WeierstrassCurve.Δ` and `WeierstrassCurve.c₄`.

| Model | Coefficient tuple | Δ | c₄ |
| --- | --- | --- | --- |
| 11a1 | `(0, -1, 1, -10, -20)` | `-161051` | `496` |
| 11a2 | `(0, -1, 1, -7820, -263580)` | `-11` | `375376` |
| 11a3 | `(0, -1, 1, 0, 0)` | `-11` | `16` |
| 162b1 | `(1, -1, 1, -5, 5)` | `-648` | `225` |
| 32a2 | `(0, 0, 0, -1, 0)` | `64` | `48` |
| 37a1 | `(0, 0, 1, -1, 0)` | `37` | `48` |
| the twist of 11a1 by −1 | `(0, 4, 0, -160, 1264)` | `-659664896` | `7936` |

**Checks.** For each row separately:

- The fourth and sixth coefficient projections give exactly the displayed a₄ and a₆;
  swapping the a₃ and a₄ slots changes the equation and fails this check.
- Substitution in the discriminant formula gives exactly the displayed nonzero integer,
  so the literal model is nonsingular; replacing the discriminant by its absolute value
  fails on each negative row.
- The c₄ formula gives the displayed value, independently fixing the j-invariant by
  `j = c₄³/Δ`. This distinguishes isogenous models at level 11 and checks that the
  twist has the same j-invariant as 11a1 despite a different discriminant.

### Examples

The CM curve `y² = x³ − x` fixes the ground-field scope of the endomorphism theorem, and
the 162b1 subgroup separates a rational subgroup from a rational generator.

### Dependencies

*Needs:* EllipticCurves Layers 1, 2 and 4; FaltingsFinitenessAndIsogenyTheorems
§R28.6.1; AbelianSchemesAndArithmeticModuli A0.2 and A1.6; ModularCurves Layer 1.3;
ArithmeticGaloisRepresentations §§6.1–6.3.

## Layer R29.2: Residual attachment

This layer defines residual attachment of an elliptic curve to a weight-two newform at a
prime and proves that a newform attached to the curve is residually attached to it at
every prime.

### Residual attachment of a curve to a newform

**Curve-level residual attachment.** For a prime p and a weight-two newform F of
positive level N, say that E is residually attached to F at p if there exist a finite
extension k/𝔽ₚ and a 𝔽ₚ-basis of E[p] such that the scalar extension of the residual
representation to k, expressed on `Fin 2 → k`, satisfies the residual attachment
predicate of AlgebraicModularFormsAndSerreWeights
[§7.5, S-type and modularity predicates](../AlgebraicModularFormsAndSerreWeights/README.md#75-s-type-and-modularity-predicates)
for the full eigenform underlying F. It uses one unital map from the ring generated
by F's Hecke eigenvalues and unit character values to k, with unramifiedness and the
full Frobenius trace and determinant identities at every prime away from Np. The map is shared by all those identities.
The full eigenform is supplied by ModularForms Layer 4, with `Newform.toEigenform`
in Tau Ceti's `NumberTheory/ModularForms/Newforms/FullEigenform.lean`; it has the same
Fourier coefficients and character as F. ArithmeticGaloisRepresentations
[§6.1, Basis-free elliptic residual representation](../ArithmeticGaloisRepresentations/README.md#elliptic-residual-representation)
supplies the action on E[p]. Conjugating this action preserves unramifiedness and
characteristic polynomials, so attachment is independent of the chosen basis.
Say that E is residually attached at level N if such an F exists with trivial
character and primitive level N. No equality between N and the residual conductor
is built into this condition. The coefficient-map interface follows the Imperial
College London FLT project.

Prove that `IsNewformOf E F` gives residual attachment to F at every prime p,
including 2, 3, primes of bad reduction and primes at which `E[p]` is reducible. Prove also that a Galois-equivariant 𝔽ₚ-linear
equivalence E[p] ≃ E′[p] transports residual attachment. Neither assertion needs
residual irreducibility. For reducible representations the shared predicate's
integral-model interpretation identifies semisimplifications; it does not identify a
nonsplit extension with its semisimplification. The first theorem uses the exact level
and all-coefficient comparison of R29.4.

*Source and prerequisites.* Serre §3.3, (3.3.1), p. 198.
The coefficient-prime and integral-model equivalences are supplied by
AlgebraicModularFormsAndSerreWeights §7.5. Good Frobenius traces and cyclotomic
determinants use ArithmeticGaloisRepresentations §§6.1–6.2.

**Checks.**

- For 11a1, residual attachment at p=5 to the level-11 form holds although E[5] is
  reducible. Its semisimplification is 1 ⊕ χ̄₅; Frobenius 2
  has trace 3 and determinant 2, giving X²−3X+2. Rational integral coefficients
  permit k=𝔽₅, and extension to 𝔽₂₅ preserves attachment.
- At p=3 the level-11 form gives trace −2=1 and determinant 2 at Frobenius 2.
  The trivial rank-two representation has trace 2 and determinant 1 and fails attachment.
- The rational degree-5 isogeny between 11a1 and 11a3 identifies their p-torsion for
  p≠5, so transport applies. At p=5 its torsion map is not an equivalence;
  attachment of both curves instead follows from their attached characteristic-zero form.

### Examples

At level 11 the normalized weight-two form is

`f_(11)(z)=η(z)²η(11z)² =q∏_(n≥1)(1-q^n)²(1-q^(11n))².`

Assume its eta-product identity, newness and first coefficients
`A_1=1, A_2=-2, A_3=-1` as the explicit level-11 data for the Checks of this layer and
the next. The residual Checks above at 3 and 5 use this form.

### Dependencies

*Needs:* Layer R29.4 for the attached-form theorem; AlgebraicModularFormsAndSerreWeights
§7.5; ModularForms Layer 4; ArithmeticGaloisRepresentations §§6.1–6.2;
AutomorphicGaloisRepresentations §6.2.

## Layer R29.3: One newform with exact coefficients

This layer defines the attachment predicate independently of existence, proves its
uniqueness, and determines the coefficient field. It then obtains an attached newform for
every elliptic curve over ℚ, as the case `K=ℚ` of the modularity theorem over totally real
fields, and selects the newform of the curve.

### Vanishing of an algebraic integer

Let `K` be a number field and `α∈𝓞_K`. Suppose `P` is an infinite set of
distinct rational primes and, for each `p∈ P`, there is a prime ideal `𝔭_p⊂𝓞_K` above `p` containing `α`. Then `α=0`.

Indeed `p∣Norm_(K/ℚ)(α)` for each such `p`. The norm is
an ordinary integer. If it were nonzero it could have only finitely many prime divisors.
Once it is zero, Mathlib `Algebra.norm_eq_zero_iff` applies to the finite free extension
of domains `𝓞_K/ℤ`. The reduction-to-norm step follows from the
determinant of multiplication by `α` modulo `p`: a prime ideal above `p` containing
`α` makes this multiplication noninvertible on `𝓞_K/p𝓞_K`, so its
determinant is zero modulo `p`.

The integer form says that an integer divisible by every
member of an infinite subset of ℕ is zero. A nonzero integer's positive divisors are
bounded by its absolute value; infinite subsets of ℕ are unbounded. Mathlib
`Int.eq_zero_of_abs_lt_dvd` gives the final contradiction. This integer form does not
need primality because infinitely many distinct natural divisors already suffice.

The number-field form does require infinitely many different rational characteristics. A
single congruence is inadequate: `2∈(2)`, yet `2≠0`. A finite extension has only
finitely many primes above a fixed rational prime, so an assertion phrased merely as
repeated membership at one characteristic cannot establish the conclusion. The element
must also be integral.

*Source and prerequisites.* This supplies the algebraic justification of Serre, §4.6,
(4.6.4), p. 208. Its direct library inputs are `NumberField.RingOfIntegers`,
`Algebra.norm`, `Algebra.norm_eq_zero_iff`, and `Int.eq_zero_of_abs_lt_dvd`, with the
finite free integral-basis structure of a number field's integers.

Small checks distinguish the hypotheses: no infinite set of natural numbers can all
divide 6; the infinite set of primes has an infinite fibre under a map to two congruence
classes; and `3∤2`. The two-class example asserts that one fibre is infinite, not
that the pigeonhole theorem identifies which fibre, or proves infinitude of each class
separately.

### Attachment and uniqueness across levels

For `E/ℚ`, a positive integer `M`, and a normalized newform `F` of weight two
and level `M`, define `IsNewformOf E F` by

`χ_F=1 and A_ℓ(F)=a_ℓ(E) for all but finitely many primes ℓ.`

This definition neither assumes `M=N_E` nor asserts the existence of `F`. The bad-prime
values are included in the expression but may all belong to its finite exceptional set.
Equivalently, one can require agreement outside a finite set containing the primes
dividing `MN_E`. This makes attachment the appropriate input to an independent local
comparison theorem.

Cross-level uniqueness says that two attached newforms at levels `M,M'` have
`M=M'` and identical Fourier coefficients at every index. Transporting one form along
the level equality then identifies the bundled forms. The proof invokes cross-level
strong multiplicity one with agreement at almost all primes not dividing `MM'`. Both
forms must be new. An oldform raised from a proper divisor is not an input to this
theorem.

If `a_ℓ(E)=a_ℓ(E')` at almost all primes, then `F`
is attached to `E` exactly when it is attached to `E'`. Changes of Weierstrass model and
ℚ-isogenies satisfy this hypothesis by their good-prime Tate-module comparisons. The
predicate therefore depends on the isogeny class, even though a later chosen
parametrisation depends on the individual curve.

*Source and prerequisites.* Serre, §4.6, (4.6.4), p. 208, supplies the coefficient
relation being named. The definition uses Tau Ceti `HeckeRing.GL2.Newform` and Mathlib
`WeierstrassCurve.LFunction`. Uniqueness is imported from Tau Ceti ModularForms **Layer
5: Strong multiplicity one and the eigenform characterization**
([ModularForms roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularForms/README.md#layer-5-strong-multiplicity-one-and-the-eigenform-characterization)),
whose cross-level theorem (Miyake, Theorem 4.6.19) is the pinned
`Newform.level_eq_and_coe_eq_of_forall_notMem_prime_eigenvalue_eq` of the supplier
contracts, applied with both characters trivial.

The defining predicate has three Checks:

* The form `f_(11)` is attached both to 11a1
  and to 11a3, `y²+y=x³-x²`, which is ℚ-isogenous to it.
* No newform of level 11 is
  attached to `37a1:y²+y=x³-x`. At 3 its trace is `-3`, while
  `f_(11)` has coefficient `-1`. That single discrepancy alone
  does not disprove an almost-all-primes condition. The theorem in
  R29.4 giving the exact conductor, or the Tate comparison and
  isogeny criterion, supplies the decisive obstruction: the
  conductors 37 and 11 differ. In particular, the two good-prime
  sequences cannot agree outside a finite set.
* A weight-two newform
  with nontrivial character is attached to no `E/ℚ`.
  This test follows from the explicit character clause, regardless
  of any sample coefficient agreement.

### Existence of an attached newform

For every elliptic curve E over ℚ, prove that there is a normalized newform `F` of weight
two, level `N_E` and trivial character with

`A_ℓ(F)=a_ℓ(E) for every prime ℓ∤ N_E,`

so that `IsNewformOf E F`. This is the case `K=ℚ` of EllipticCurveModularityTotallyReal §4.4,
which holds for every totally real field and every elliptic curve over it, with no further
hypothesis. For `K=ℚ` it gives a cuspidal automorphic representation `π_E` of `GL₂(𝔸_ℚ)` of
type `(2,0)`, with trivial central character, whose attached representation is
`H¹_ét(E_ℚ̄, ℚ̄_ℓ)` for every ℓ and every coefficient isomorphism; its newvector has exact
level the conductor of E, and at every good prime ℓ its Hecke eigenvalue is
`t_ℓ=a_ℓ(E)` (§4.2 there, items 6 and 7). The conductor there is the Artin conductor of the
ℓ-adic representations of E for ℓ prime to the place, which is `N_E` of R29.4. Over ℚ the
dictionary of GL2AutomorphicRepresentationsAndTransfer R16.6.1–R16.6.2 identifies `π_E` with
the cuspidal representation of a normalized newform `F` of weight two, trivial character and
level the conductor of `π_E`, whose eigenvalue at a good prime is that of `π_E`; by the
classical specialization of AutomorphicGaloisRepresentations §3.10 the representations of `F`
are those of `π_E`. Hence `A_ℓ(F)=a_ℓ(E)` at every good ℓ.

Attachment does not need the exact level: R29.4 identifies the level of every attached form
with `N_E`. The existence proof uses no residual representation of E; geometric CM curves are
included, through the CM case of §4.4 there.

*Source and prerequisites.* EllipticCurveModularityTotallyReal §4.4 with `K=ℚ` and its §4.2
for the eigenvalues and the level; GL2AutomorphicRepresentationsAndTransfer R16.6.1–R16.6.2
for newforms and cuspidal representations of `GL₂(𝔸_ℚ)`; AutomorphicGaloisRepresentations
§3.10 for the classical specialization of the Hilbert attachment.

**Checks.**

- For 11a1, `π_E` has `t₃ = a₃ = −1` and `s₃ = 1`, and the newform is `f_(11)`, with
  `A_3=-1`.
- A weight-two newform with nontrivial character cannot arise: the central character of
  `π_E` is trivial.

### Rationality of the whole coefficient field

For any attached newform `F` of any level, the headline statement
`IsNewformOf.coeff_int` in `Suggested.lean` asserts that each
`A_n(F)` is a rational integer. In particular `K_F=ℚ`. This conclusion applies
to an attached form provided by a geometric construction as well as to the form given
by the existence theorem above.

For every embedding `σ:K_F↪ℂ`, the conjugate form `F^σ`
is a normalized newform of the same level, with coefficients `σ(A_n(F))`. Its
character is trivial because the original character is trivial. At almost all good
primes the coefficient `A_ℓ(F)=a_ℓ(E)` is already a rational integer, so
`F^σ` is attached to `E` as well. Attachment uniqueness then gives
`σ(A_n(F))=A_n(F)` for every `n`. Every coefficient is rational and is also an
algebraic integer, hence lies in ℤ.

This reasoning is needed at bad primes and composite indices too. Rationality of a few
Hecke traces, or of the good traces without a uniqueness theorem, is not the
all-coefficient statement. For general nebentypus, Galois conjugation also conjugates
the character, so the character preservation used here must be limited to the trivial
case.

*Source and prerequisites.* Serre's rational-coefficient step is §4.6, p. 208. The
attachment predicate and its cross-level uniqueness are the preceding API and
ModularForms Layer 5. The construction and coefficient formula for the conjugate newform
are supplied by Tau Ceti ModularForms **Layer 8G: Galois stability, the character field,
and rationality**
([ModularForms roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularForms/README.md#layer-8g-galois-stability-the-character-field-and-rationality)).
Algebraic integrality of normalized newform coefficients is part of the modular-form
input, as in Cremona §2.6, pp. 24–25.

### The newform of an elliptic curve

For every elliptic E over ℚ, define F_E to be an attached normalized newform of
weight two and level N_E, with positivity supplied by the conductor contract.
Choose it from the existence theorem above. Attachment uniqueness proves
independence from that choice. The selected-form API and its isogeny and twist
Checks require no existence input for the curves. The API is:

* Attachment: `IsNewformOf E F_E`.
* Good-prime coefficients: `A_ℓ(F_E)=a_ℓ(E)` at every good
  prime ℓ, with no further exceptional primes.
* Uniqueness: every attached newform `F` at any positive
  level `M` has `M=N_E` and all coefficients equal to those of
  `F_E`.
* Integrality: every `A_n(F_E)` lies in ℤ.

Its character is trivial by attachment. Equality between forms whose level expressions differ is stated
first as equality of levels and coefficients, and then transported to the common bundled
type. This avoids concealing a level-identification requirement inside an untyped
equation.

*Source and prerequisites.* The direct inputs are the existence theorem above,
attachment and uniqueness, the rational-coefficient-field assertion, and Tau
Ceti `HeckeRing.GL2.Newform`. ModularForms Layer 4 supplies the new/old distinction
needed in the following tests.

* Level 11: `N_(11a1)=11` and `F_(11a1)=f_(11)`.
* Isogeny invariance: 11a1, 11a2
  (`y²+y=x³-x²-7820x-263580`), and 11a3 have identical
  Fourier coefficients in their `F_E`. The construction is
  invariant under ℚ-isogeny.
* Quadratic twisting: if `E'` is the twist of 11a1 by `-1`,
  presented as `y²=x³+4x²-160x+1264`, then
  `A_ℓ(F_(E'))=χ_(-4)(ℓ)A_ℓ(F_(11a1))` for every prime
  `ℓ∤2·11`. Here `χ_(-4)` is the nontrivial
  character modulo 4, matching Mathlib's `ZMod.χ₄`. The excluded
  primes are the ones where this simple good-reduction twist
  formula does not apply.

A further newness Check takes the displayed level-22 dimension and oldspace data as
explicit inputs, with trivial character throughout. The two forms `f_(11)(z)` and
`f_(11)(2z)` span the weight-two trivial-character cusp space there, and its new part
is zero. The level-11 form is attached to 11a1, but this does not produce a newform
of level 22. This is a test both of exact
level and of the bundled newform condition used in attachment uniqueness. The divisor
multiplicity behind the example is Cremona, §2.7, p. 26, and is used again in the
geometric converse.

### Examples

The level-11 isogeny and quadratic-twist Checks above test uniqueness, rationality and
newness. The norm negative controls distinguish one congruence from infinitely many
residual characteristics.

### Dependencies

*Needs:* EllipticCurveModularityTotallyReal §§4.2 and 4.4,
GL2AutomorphicRepresentationsAndTransfer R16.6.1–R16.6.2 and
AutomorphicGaloisRepresentations §3.10, for existence; ModularForms Layers 4, 5 and 8G;
Mathlib `Algebra.norm` and `Algebra.norm_eq_zero_iff`.
Attachment uniqueness and rationality use only the attached-form hypothesis.

## Layer R29.4: Tate modules, exact conductor and every Euler factor

This layer starts with an arbitrary attached newform `F` of level `M`. Its hypotheses do
not include the existence theorem of R29.3 or the choice of `F_E`. All its coefficients
are integers by R29.3, so its Galois representations can be compared with `V_r(E)` over
`ℚ_r`. The comparison is global first, then local, with the bad-place monodromy
retained.

### The rational Tate-module comparison

For every prime `r`, prove an isomorphism of
`ℚ_r[G_(ℚ)]`-modules

`V_r(E)≃ V_r(F).`

Here `V_r(F)` is the two-dimensional rational representation of the newform with
coefficient field ℚ. At a prime ℓ outside a finite set containing the divisors of
`MN_Er`, both representations are unramified, and both Frobenius polynomials are
`X²-a_ℓ(E)X+ℓ`. This uses the full determinant identity in addition to trace
agreement.

Chebotarev and Brauer–Nesbitt identify their semisimplifications. To identify the actual
representations, verify semisimplicity on both sides. For `E` use the elliptic
Tate-module semisimplicity theorem. For `F`, the dimension theorem for the modular
quotient gives a dimension-one abelian variety because `K_F=ℚ`. The comparison
of its Tate module with the newform realization and Faltings semisimplicity then gives
semisimplicity of `V_r(F)`. This route does not require an independently proved
irreducibility theorem for every automorphic representation as an extra input.

The statement is an equivariant linear isomorphism, not an equality of matrices in
unrelated bases. The module structure over the monoid algebra `ℚ_r[G_(ℚ)]` is a convenient bundled form. The input representations still have their continuity
and unramifiedness properties from their owners. The algebraic module isomorphism is
used to compare the local restrictions and Tate modules, rather than to reconstruct
those structures from scratch.

*Sources and prerequisites.* Serre, §4.6, p. 208, uses the comparison after (4.6.4).
Faltings, §5, Satz 3, p. 360, and Korollar 2, p. 361, give the semisimplicity and
recognition framework. The direct inputs are attachment and rational coefficients in
R29.3; ArithmeticGaloisRepresentations **§5.3** for Chebotarev/Brauer–Nesbitt and
**§§6.1–6.3** for `E`; FaltingsFinitenessAndIsogenyTheorems
**§R28.6.2** and
**§§R28.4.5–R28.4.6**;
AutomorphicGaloisRepresentations **§1.5** and
**§6.1**; and ModularCurvesPartII
**§16.3**.

As an acceptance condition, the comparison must be available for each auxiliary prime
`r`, not just for one chosen prime. Its proof may choose its finite exceptional
Frobenius set separately for each `r`. The next assertions require an auxiliary prime
different from each local place, which this quantification supplies.

### The conductor and its semistable comparison

**Conductor specialization.** For every elliptic E over ℚ, define N_E to be the
positive generator of the conductor ideal of NeronModelsAndSemistableAbelianVarieties
§5.3a. That section supplies, at each prime ℓ, the exponent `f(E_(ℚ_ℓ))` with
`a(V_r(E_(ℚ_ℓ))) = f(E_(ℚ_ℓ))` for every prime r ≠ ℓ, additive reduction and wild
ramification at 2 and 3 included; its §5.3g supplies that ℓ divides N_E exactly at
the bad primes and that `v_ℓ(N_E) = 1` exactly at the multiplicative ones. Prove the
passage to the global representation: for distinct primes ℓ and r, the local
restriction of `V_r(E)` along an embedding `ℚ̄ → ℚ̄_ℓ` is isomorphic to
`V_r(E_(ℚ_ℓ))`, so the exponent `a_ℓ(V_r(E))` at ℓ of the global conductor of `V_r(E)`
equals `v_ℓ(N_E)` (local restriction and global conductors as in
ArithmeticGaloisRepresentations §§2.1 and 3.3).

For `WeierstrassCurve.IsSemistable ℤ E` every bad prime is multiplicative, so §5.3g
gives exponent one at the bad primes and zero elsewhere: N_E is the squarefree product
of the bad primes. That product is the conductor assembled from the 0/1 exponents of
EllipticCurves Layers 4 and 4.5a on local minimal models; its equality with the Artin
conductor is the semistable algorithmic–Artin comparison milestone of EllipticCurves
Layer 8.
The sources are Serre 1970, n° 2.4, cases b), c), p. 19-09, and Brumer–Kramer 1994,
§6, (6.1), p. 243, as located in that supplier's §5.3a; the semistable case is also
Darmon–Diamond–Taylor, §2.2, Proposition 2.12, p. 57.

**Checks.**

- For 11a1 the sole bad prime is 11, multiplicative, and both conductor definitions
  give 11; the minimal discriminant has absolute value `11⁵`, not 11.
- For 37a1 the sole bad prime is 37, multiplicative, so both give 37.
- For `y²=x³−x`, the Artin conductor is 32. The bad-prime product is 2 and cannot
  replace it: this curve is additive at 2 and fails the semistability hypothesis.

### The level is the conductor

Prove that every attached newform has

`M=N_E.`

Fix a rational prime ℓ and choose `r≠ℓ`. Restrict the Tate isomorphism to the
decomposition group at ℓ. The Artin conductor of `V_r(E)` at ℓ gives `v_ℓ(N_E)`. Full
local compatibility of the primitive newform representation gives `v_ℓ(M)`. Their
equality proves the equality of levels prime by prime. In particular, local
compatibility includes the potentially multiplicative monodromy operator and the
additive wild conductor; agreement of good Frobenius traces alone does not compute those
local invariants.

Using two distinct choices of `r` is enough to measure every place: when ℓ equals the
first auxiliary prime, use the second. This is the precise reason that a prime-to-`r`
conductor comparison for one fixed `r` does not by itself give equality of the full
integers `M` and `N_E`.

*Source and prerequisites.* Carayol, §0.8, Corollaire, p. 411, asserts the conductor
identity for the curve attached to a rational newform; its proof invokes Theorem `A`,
§0.7, pp. 410–411, and the elliptic conductor comparison. Here the direct inputs are the
Tate isomorphism just obtained, AutomorphicGaloisRepresentations
**§6.4**, and ArithmeticGaloisRepresentations
**§§6.1–6.3**. The local representation must be transported between Carayol's cohomological
normalization and the homological arithmetic-Frobenius convention fixed above.

The level-11/level-22 oldform example tests the primitive-form hypothesis: an old
eigenform at 22 with good traces of 11a1 would not satisfy the conclusion if it were
admitted as a newform. The 37a1 non-example tests the almost-all-primes input in the
other direction: its conductor forces an attached form's level to be 37.

### The bad factors and all Dirichlet coefficients

The headline statement `IsNewformOf.localPolynomial_eq` in `Suggested.lean`
identifies, for every rational prime ℓ, Mathlib's local
polynomial with

`P_ℓ(E,T)=1-A_ℓ(F)T+ (ℓ T² if ℓ ∤ N_E; 0 if ℓ ∣ N_E)`

The coefficient `A_ℓ(F)` is first identified with an integer, so the polynomial is in
ℤ[T]. At multiplicative places this integer is 1 in the split case and `-1` in the
nonsplit case. At additive places it is zero. Thus `A_ℓ(F)=a_ℓ(E)` holds at
**every** prime, supplementing the good-prime existence theorem. The bad-prime `U_ℓ`
coefficient formula for a weight-two newform of trivial character is compatible with
these values: `±1` when `ℓ∥ M`, and 0 when `ℓ²∣ M`.

Full local compatibility gives the equality of Euler polynomials using the corresponding
Weil–Deligne representation. An isomorphism only of the semisimplified local Galois
representations would discard the monodromy information at a Steinberg place. The global
Tate isomorphism here is of the actual representations, so restriction preserves that
information; the local-factor interface must preserve it too.

The statement compares Mathlib's minimal model over ℤℓ with its local polynomial.
Mathlib's number-field Euler product instead uses completions at height-one prime ideals
of `𝓞_(ℚ)`. Prove the completion-to-p-adic transport here: for E/ℚ elliptic,
`v : HeightOneSpectrum (𝓞 ℚ)` and `ℓ = Rat.HeightOneSpectrum.primesEquiv v`, prove

`(E.baseChange (v.adicCompletion ℚ)).localPolynomial (v.adicCompletionIntegers ℚ) = (E.baseChange ℚ_[ℓ]).localPolynomial ℤ_[ℓ]`.

Use Mathlib's `Rat.HeightOneSpectrum.adicCompletion.padicEquiv` and
`Rat.HeightOneSpectrum.adicCompletionIntegers.padicIntEquiv`, with the commuting
inclusion diagrams in `adicCompletionIntegers.coe_padicIntEquiv_apply` and its inverse
version. Transport the base-changed curve along the ℚ-algebra equivalence. Build the
compatible minimal-model and reduction comparison in this layer: the transported
minimal model is minimal over the equivalent DVR, and comparison with the chosen
minimal model preserves good, split multiplicative and nonsplit multiplicative
reduction. The induced residue-field and point-group equivalences preserve both finite
cardinalities in the good polynomial. Thus each branch of Mathlib's definition has
the same integer polynomial. This compares the polynomials without requiring the
chosen minimal equations to be definitionally equal.

*Source and prerequisites.* Mathlib `NumberTheory/Padics/HeightOneSpectrum.lean`,
`adicCompletion.padicEquiv`, `adicCompletionIntegers.padicIntEquiv` and their inclusion
diagrams; `AlgebraicGeometry/EllipticCurve/LFunction.lean`, `localPolynomial` and
`LFunction`; EllipticCurves Layer 4, minimal-model invariance (Silverman, AEC VII.1,
VII.5). Use this transport with `IsNewformOf.localPolynomial_eq` when deriving
`IsNewformOf.coeff_eq` and equality of formal Dirichlet series.

**Checks.**

- At the prime above 7 for 11a1, both polynomials are `1+2T+7T²`; the finite-field
  count is 10, on either residue-field carrier.
- At the prime above 11 for 11a1, both polynomials are `1-T`; the transport preserves
  the split condition, not just multiplicativity.
- At the prime above 2 for `y²=x³-x`, both polynomials are 1; residue characteristic
  two is included. Scaling the 11a1 equation by `7²,7³` also leaves the first Check
  unchanged after minimalization.

The headline statement `IsNewformOf.coeff_eq` in `Suggested.lean` then gives

`A_n(F)=a_n(E) (n≥0).`

At `n=0` both sides are zero; at `n=1` both are one. For positive indices, use
multiplicativity at coprime arguments and the prime-power recurrence. For a good prime
ℓ,

`a_(ℓ^(t+1))=a_ℓ a_(ℓ^t)-ℓ a_(ℓ^(t-1)) (t≥1),`

and for a bad prime `a_(ℓ^t)=a_ℓ^t`. The same identities hold for `F`. Agreement
of the local polynomials and initial terms therefore identifies all positive
coefficients. This is the usable coefficient interface for the analytic application; it
does not simply rename equality of good traces.

*Sources and prerequisites.* Carayol, §0.8, Corollaire, p. 411, gives the
all-local-factor identity. The coefficient recurrences are Cremona, §2.6,
(2.6.1)–(2.6.2), p. 25. Direct inputs are the Tate comparison and exact conductor in
this layer, AutomorphicGaloisRepresentations
**§6.4**, Mathlib
`WeierstrassCurve.localPolynomial`, EllipticCurves Layer 4 for local reduction, and
ModularForms Layer 4 for the bad-prime eigenvalues and newform coefficient recurrences.

For 11a1 the split multiplicative polynomial at 11 is `1-T`, so its newform coefficient
there is 1. For 37a1 at 37 the nonsplit multiplicative polynomial is `1+T`:
`v_37(Δ)=1`, `c_4=48` is a unit, and `-c_6=216≡31 (mod 37)` is a nonsquare. For
the CM test curve `y²=x³-x` at 2 the additive polynomial is 1. These three cases test
the removal of the quadratic term and the split sign. They also show why dropping all
bad places from the Euler product would lose information needed for equality of L-series
and conductors.

### Examples

The three bad-reduction polynomials above test the multiplicative split sign and the
additive case, including small residue characteristics.

### Dependencies

*Needs:* Layer R29.3 attachment and rationality; ArithmeticGaloisRepresentations
§§2.1, 3.1–3.6, 5.3 and 6.1–6.3; AutomorphicGaloisRepresentations §§1.5, 6.1 and 6.4;
ModularCurvesPartII §§16.3–16.6; FaltingsFinitenessAndIsogenyTheorems
§§R28.4.5–R28.4.7 and R28.6.2; NeronModelsAndSemistableAbelianVarieties §§5.3a, 5.3g
and 5.3i.

## Layer R29.5: Quotient isogenies and modular parametrisations

The coefficient comparison produces an elliptic modular quotient whose Tate module
agrees with that of `E`. This layer passes from the representation to an isogeny over ℚ,
then uses the rational cusp of the modular curve to produce a morphism to the given
elliptic curve. The form is canonical; the isogeny and the resulting parametrisation
require a choice.

### Isogeny from the modular quotient

For a newform `F` attached to `E`, its coefficient field is ℚ and its level is `N_E`.
The modular quotient `A_F^0` of J₀(`N_E`) has dimension one and has a rational origin;
it is therefore an elliptic curve over ℚ. Its rational Tate module is the representation
of `F`, through its comparison with the J₁ quotient. By R29.4 it is isomorphic to
`V_r(E)`.

Prove that there is a ℚ-isogeny
`λ:A_F^0→ E`. Faltings's isogeny criterion gives an isogeny over the ground
field ℚ. A rational Tate-module isomorphism alone is not an isomorphism of elliptic
curves; the conclusion is isogeny. One can choose an isogeny in the indicated direction,
and its kernel is finite. Both the origin and the field of definition are retained.

Bundle a chosen quotient isogeny λ from A_F⁰ to E, for an attached F, with
its origin-preservation and surjectivity properties. The interpretation as an isogeny
uses the dimension-one assertion above: a surjective origin-preserving morphism between
these elliptic curves is automatically a homomorphism with finite kernel. The quotient
scheme and its origin are imported objects, rather than alternative definitions of the
modular quotient.

Two consequences are useful without any existence theorem for all elliptic curves.
An attached form of level `M` gives a surjective homomorphism J₀(`M`) → `E` over ℚ
and a nonconstant, hence
surjective, morphism X₀(`M`) → `E` sending ∞ to `O`. Here R29.4 implies `M=N_E`, but the
signatures permit an arbitrary attached form's level.

*Sources and prerequisites.* This is the isogeny step of Serre, §4.6, p. 208, after
(4.6.4). Faltings, §5, Korollar 2, p. 361, gives the implication from isomorphic Tate
representations to isogeny. The direct inputs are rationality in R29.3, Tate comparison
and exact conductor in R29.4, ModularCurvesPartII **§16.3**
and **§16.5**, AutomorphicGaloisRepresentations
**§6.1**, and FaltingsFinitenessAndIsogenyTheorems
**§R28.6.4**. The X₀ consequence additionally uses
the Abel–Jacobi and nonzero composite interfaces specified next.

### The morphism from X₀ at the conductor

Let F_E be the selected attached newform of R29.3.
For a chosen quotient isogeny λ:A_(F_E)⁰→E, define the modular parametrisation
φ_E:X₀(N_E)→E in schemes over ℚ by the composite

`X_0(N_E) →[x↦[x-∞]] J_0(N_E)  →[π_(F_E)] A_(F_E)^0 →[λ] E.`

The rational cusp ∞ fixes the Abel–Jacobi map over ℚ. Each arrow is over ℚ, and their
composition is too. The cusp maps to zero in the Jacobian, then to zero in the quotient,
and then to `O` in `E`. The quotient receives a nonzero Abel–Jacobi composite; composing
with an isogeny between elliptic curves remains nonconstant. A nonconstant morphism
between smooth projective integral curves is finite and surjective, with positive degree
equal to the extension degree of function fields.

The constructor and every property and Check below carry the same chosen `λ`.
The API consists of the constructor and three mathematical properties:

* The cusp identity states `φ_E(∞)=O`.
* Nonconstancy states surjectivity
  and `deg φ_E > 0`.
* Differential pullback gives a rational scalar
  `c≠0` with
  `φ_E^* ω_E = c · 2πi · F_E(z) dz`, where
  `ω_E=dx/(2y+a_1x+a_3)` is the differential of the
  specified Weierstrass equation.

The pullback first lands in the `F_E`-eigenline of differentials on the modular curve.
Compatibility of the quotient with the Hecke action identifies that line with the
normalized cusp form. Its rational structure and the ℚ-defined morphism give
`c∈ℚ`. Nonconstancy in characteristic zero makes the pullback differential
nonzero, so `c≠0`. Under ModularCurvesPartII §7.2's `weightTwoRegularDifferentials`,
normalized by `f ↦ 2πi f(z) dz`, the inverse comparison sends `φ_E^*ω_E` to `c·F_E`.

The assertion is for the differential of the displayed model and the chosen isogeny.
Changing a Weierstrass model rescales the differential by a rational factor; composing
with multiplication by an integer rescales the map and changes its degree. For an
optimal curve and Néron differential, the usual Manin-constant normalization requires
additional integral assertions. The statement here gives the nonzero rational scalar,
and does not set it equal to 1 for arbitrary curves or arbitrary choices.

*Source and prerequisites.* Cremona, Chapter II, §2.15.1, p. 47, describes the
parametrisation and its differential. The direct inputs are the isogeny theorem above,
`F_E` in R29.3, ModularCurvesPartII **§16.5**,
**§16.7**, **§16.4**, and
**§17.3**, and Tau Ceti JacobianChallenge **Layer F:
Abel–Jacobi and the universal property**
([JacobianChallenge roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/JacobianChallenge/README.md#layer-f-abeljacobi-and-the-universal-property)).
The differential/form identification uses ModularCurvesPartII **§§7.1–7.4**, and curve
degree uses Tau Ceti AlgebraicCurves Layers 6 and 12. The projective model of a
Weierstrass curve is the ModularCurves Layer 1 interface.

### Examples and quotient-choice Checks

Each Check takes its displayed modular-curve identification, Hom generator and degree
as explicit hypotheses; it tests the general parametrisation assertions.

* For 11a1: X₀(11) is the
  elliptic curve 11a1. For a suitable quotient isogeny,
  the resulting map is an isomorphism, of degree 1.
  It must still send the chosen cusp to the origin.
* For 11a3: the least degree over
  the possible quotient isogenies to 11a3 is 5. It
  is attained by a 5-isogeny from 11a1. The group
  `Hom_ℚ(11a1,11a3)` is
  generated by a degree-5 isogeny, so every nonzero
  choice has degree `5n²`. This tests the use of
  the J₀ quotient: the J₁ quotient at this level
  is 11a3 itself and would give the wrong degree
  if silently substituted into the construction.
* For 37a1: for 37a1, the J₀
  modular quotient is isomorphic to `E`, but the
  parametrisation from X₀(37) has degree 2. This
  distinguishes the degree of `λ` from
  that of the Abel–Jacobi/quotient composite.

These assertions test a choice-exists statement, a lower bound over all choices, and a
case in which the quotient isogeny is an isomorphism while the parametrisation is not.
They use the degree convention of the curve interface and the homomorphism-degree
formula of R28.6. The interpretation of a modular degree follows Cremona §2.15.1,
pp. 47–48, including Proposition 2.15.1 on p. 48;
the concrete equations are the ones fixed in the earlier tests.

### Dependencies

*Needs:* Layers R29.3–R29.4; ModularCurvesPartII §§7.1–7.4, 16.2–16.7 and 17.3;
FaltingsFinitenessAndIsogenyTheorems §R28.6.4; JacobianChallenge Layer F;
AlgebraicCurves Layers 6 and 12.

## Layer R29.6: The converse, modularity, and analytic continuation

The geometric converse starts with a surjective homomorphism `J_0(N')→ E`, where `N'`
is an arbitrary positive integer. It recovers an attached primitive form at a divisor of
`N'`. The conditional comparisons of R29.3–R29.5 then force that divisor to be `N_E`.
This proves the equivalence of the modularity formulations separately from their
unconditional truth, which comes from the existence theorem of R29.3, and prevents a geometric
presentation at a larger level from being mistaken for the conductor.

### Absolute irreducibility of the rational Tate module

For every elliptic curve `E/ℚ` and prime `r`, the headline statement
`span_range_rationalTateRep` in `Suggested.lean` asserts that the ℚᵣ-linear span of
the image of `G_(ℚ)` is

`ℚ_r[ρ_(E,r)(G_(ℚ))] =End_(ℚ_r)(V_r(E)).`

Consequently, for every extension field `L/ℚ_r`, `V_r(E)⊗_(ℚ_r)L`
is irreducible as an `L[G_(ℚ)]`-module. In particular, this is absolute
irreducibility, not just irreducibility over ℚᵣ.

By the Tate–Hom comparison, the commutant of the Galois image is

`End_(G_(ℚ))(V_r(E)) =End_(ℚ)(E)⊗ℚ_r =ℚ_r.`

Faltings semisimplicity makes `V_r(E)` a semisimple module for the algebra `B` spanned
by the image. It is simple: otherwise a nontrivial summand decomposition would yield a
nontrivial idempotent in its scalar endomorphism ring. The finite-dimensional algebra
`B⊆End(V_r(E))` acts faithfully on this simple module. Its
radical is zero and it is a simple matrix algebra over a division algebra. The scalar
commutant forces that division algebra to be ℚᵣ; the two-dimensional module then forces
`B=M_2(ℚ_r)`. Equivalently, one can apply the finite-dimensional density theorem
to this simple module with scalar commutant. Extending scalars gives every endomorphism
of `V_r(E)⊗ L`, leaving no proper nonzero invariant subspace.

Both semisimplicity and the scalar commutant are used. A semisimple sum of two
characters is reducible; a module with scalar commutant without the semisimplicity input
does not justify the argument above. The result is specific to `E` over ℚ. For the CM
curve `y²=x³-x`, restriction to `G_(ℚ(i))` splits over an algebraic closure of
ℚ₅, while the full `G_(ℚ)` action exchanges the two lines under complex
conjugation. This is the CM acceptance test for `r=5`.

*Source and prerequisites.* Faltings, §5, Satz 3 and Satz 4, p. 360, and Korollar 1,
p. 361, supply semisimplicity and the commutant comparison. The direct inputs are
FaltingsFinitenessAndIsogenyTheorems **§R28.6.3**,
**§R28.6.2**, and the
**R29.1** assertion `End_ℚ(E)=ℤ`, together with
ArithmeticGaloisRepresentations **§§6.1–6.3** for the representation. The matrix-algebra
step uses RepresentationTheory/SemisimpleAlgebras Layer 3, finite-dimensional density and the double-centralizer
theorem for semisimple modules, in the faithful simple-module/scalar-commutant case.

### Surjectivity on rational Tate modules

Prove the rational Tate surjectivity theorem: for abelian varieties A and B over ℚ, a
surjective homomorphism `f:A→B`, and any prime r, the induced equivariant linear
map `V_r(f):V_r(A)→V_r(B)` is surjective. The kernel need not be connected.
Take the reduced identity component C of the kernel and a Poincaré complement D in A.
Then `C×D→A` is an isogeny and `f|_D:D→B` is an isogeny by surjectivity and dimension.
Isogenies induce rational Tate-module isomorphisms, so `V_r(f)` is surjective.
The proof uses rational coefficients even when r divides the finite isogeny kernels.

*Sources and prerequisites.* Milne, *Abelian varieties* (1986), Proposition 12.1,
p. 122; Ribet–Stein, Appendix by B. Conrad, proof of Theorem 5.14, p. 73;
ModularCurvesPartII §16.3's rational-exactness argument.
AbelianSchemesAndArithmeticModuli A6.5 supplies the complement and A4.1 supplies
additive functoriality of `T_r` in homomorphisms, compatible with composition.
For an isogeny `u:A→B`, an isogeny `v:B→A` satisfies `vu=[n]` and `uv=[n]`
for some `n>0` (Milne, *Abelian varieties* (1986), §8, p. 115). Hence `n⁻¹V_r(v)`
is an inverse to `V_r(u)`.
Additive functoriality also carries the inclusions and projections of `A×B` and
their biproduct identities to the Tate modules, giving the product decomposition.
These deductions apply to arbitrary abelian varieties; ArithmeticGaloisRepresentations
§6.1 supplies the compatible elliptic representation.

**Checks.**

- The identity of an elliptic curve induces the identity on its rational Tate module.
- The projection `E×E→E` is surjective with positive-dimensional kernel and induces
  projection on the two rational Tate summands.
- Multiplication by r is surjective on `V_r(E)` although its map on `T_r(E)` has
  cokernel of order `r²`; integral surjectivity is not a conclusion.

### Recovering a primitive form from a Jacobian quotient

Let `N'≥1` and let `π:J_0(N')→ E` be a surjective homomorphism over ℚ. Then
the Jacobian-quotient converse gives a divisor `M∣ N'` and a normalized weight-two
newform `f` of level `M` and trivial character attached to `E`. It follows that `M=N_E`,
`N_E∣ N'`, all coefficients of `f` are integers, and `A_ℓ(f)=a_ℓ(E)` for every
prime ℓ. The geometric hypothesis alone supplies this result; the existence theorem of R29.3
is not used in its proof.

The old/new decomposition over ℚ has the form

`J_0(N')∼_(ℚ) ∏_(M∣ N') ∏_([f]) (A_f^0)^(σ_0(N'/M)).`

The inner product runs over Galois orbits of normalized weight-two newforms of exact
level `M` with trivial character, and `σ_0` counts positive divisors. The powers
record oldform multiplicity. They are essential even for rational newforms. The
decomposition must exhaust the whole Jacobian up to ℚ-isogeny; a comparison for one
selected orbit or for J₁ does not suffice to select a constituent of a general map out
of J₀(`N'`).

**Exhaustive Γ₀ decomposition.** For every `N'≥1`,
prove that `J₀(N')` is ℚ-isogenous to the displayed product. Use the complete
trivial-character decomposition of `S₂(Γ₀(N'))` into the oldforms `V_d f` from
ModularForms Layers 3–4. Specialize the orbit-factor argument of
ModularCurvesPartII §16.6 to Γ₀ using its §16.5 quotient and degeneracy maps.
Assemble the distinct rational Hecke blocks using Poincaré complete reducibility
(AbelianSchemesAndArithmeticModuli A6.5). Rational Tate-module exactness (§16.3)
and the quotient dimension formula (§16.5), together with completeness of the
cusp-space decomposition, show that the blocks exhaust the Jacobian. The sources
are Cremona §2.7, Lemma 2.7.1, p. 26, for divisor multiplicity, and Ribet–Stein,
§3.6, p. 40, and Conrad's Appendix, Theorem 5.14 and its proof, p. 73, for the
Hecke factors and their rational Tate modules.

**Checks.**

- At `N'=1` the weight-two cusp space is zero and the product is empty; its
  zero-dimensional abelian variety agrees with `J₀(1)`.
- At `N'=22`, with the level-22 newspace zero, the level-11 orbit contributes
  `(A_f^0)²`, so `dim J₀(22)=2`. One copy would fail the dimension count.
- For any primitive orbit of level M and prime q, its multiplicity at `Mq²` is
  three, from `d=1,q,q²`, whether or not q divides M; the two prime-level
  degeneracy maps alone do not give this multiplicity.

Fix `r`. Apply the rational Tate surjectivity theorem to obtain a surjective equivariant map
`V_r(J_0(N'))→ V_r(E)`. The decomposition implies that it is nonzero on at least one
copy of `V_r(A_f^0)`, for some `M∣ N'`. Through the compatible isogeny with `A_f^1`,
this module is a free rank-two module over `K_f⊗ℚ_r`. After extending
scalars to `ℚ̄_r`, it decomposes as

`V_r(A_f^0)⊗ℚ̄_r =⊕_(σ:K_f↪ℚ̄_r) V_(f,σ),`

with each summand of dimension two and stable under Galois. At ℓ not dividing `Mr`, the
polynomial on the summand is `X²-σ(A_ℓ(f))X+ℓ`. Some restriction to
`V_(f,σ)` is nonzero. Its target `V_r(E)⊗ℚ̄_r` is
irreducible by the preceding assertion. The restriction is therefore surjective and,
since both spaces have dimension two, an isomorphism.

At every prime `ℓ∤ N_EN'r`, this isomorphism gives `σ(A_ℓ(f))=a_ℓ(E)`.
To obtain a complex newform, fix an embedding `ι:ℚ̄↪ℚ̄_r`, where `ℚ̄⊂ℂ`.
The embedding `σ` of the number field `K_f` factors through `ι`, say
`σ=ι∘τ`. Its finite algebraic image lies in the image of this algebraic
closure, and `ι` fixes ℤ. Hence `τ(A_ℓ(f))=a_ℓ(E)` at the same good primes.
The conjugate newform `f^τ` has the same level and trivial character, and is attached
to `E`. Apply the conditional rational-coefficient, exact-level, and all-Euler-factor
comparisons to it.

This proof extracts a two-dimensional constituent before claiming rational coefficients.
An entire modular quotient with coefficient field of degree greater than one has a
larger rational Tate module; it cannot be identified directly with `V_r(E)`. The
constituent and coefficient-embedding steps are what allow the argument to start with
arbitrary Jacobian quotients and still recover a rational newform.

*Sources and prerequisites.* Serre, §4.6, Theorem 4, p. 207, states the modular
quotient formulation; this assertion supplies its converse. Cremona, §2.7 and Lemma
2.7.1, p. 26, supplies the oldform divisor multiplicity. Carayol, §0.8, proof of the
Corollaire, p. 411, supplies the newform/Tate-module comparison. Use
the exhaustive Γ₀ decomposition above, with the quotient and rational-exactness interfaces
of ModularCurvesPartII **§§16.2–16.7**. The realization of the
constituents is AutomorphicGaloisRepresentations
**§6.1** and
**§1.5**; the elliptic Frobenius data is
ArithmeticGaloisRepresentations **§§6.1–6.3**. Conjugation is ModularForms Layer 8G. The
other inputs are the preceding absolute irreducibility, attachment and rationality in
R29.3, and exact conductor and bad Euler factors in R29.4.

Two examples test the scope of the decomposition, taking the stated cusp-space
and coefficient-field data as explicit hypotheses:

* At `N'=22`, either degeneracy map to J₀(11)
  gives an elliptic quotient 11a1. The level-11
  form occurs twice, through `f(z)` and `f(2z)`,
  and the level-22 new part is zero. Thus
  `dim V_r(J_0(22))=4`; putting only one copy
  of the primitive form in the decomposition
  would incorrectly give dimension two. The
  form recovered by the converse has level 11,
  a proper divisor of 22.
* At `N'=23`, the weight-two space is one
  Galois orbit with coefficient field
  `ℚ(√5)`, and
  `A_2(f)=(-1±√5)/2`. The quotient is
  an abelian surface. It cannot have an
  elliptic quotient over ℚ: a quotient would
  give an attached rational form at a divisor
  of 23; the level-1 space is zero, and the
  level-23 orbit has irrational coefficients.
  This conclusion uses the full attachment
  comparison, not a claim that one irrational
  coefficient alone rules out almost-all-prime
  agreement.

### The three equivalent modularity formulations

For every elliptic curve `E/ℚ` of conductor
`N_E`, the following statements hold:

1. There is a normalized newform `F` of weight
   two, exact level `N_E`, and trivial character
   with `A_n(F)=a_n(E)` for every `n≥0`.
   Its coefficients are rational integers.
2. There is a surjective homomorphism
   `J_0(N_E)→ E` over ℚ.
3. There is a nonconstant morphism
   `X_0(N_E)→ E` over ℚ sending ∞ to `O`.

The statement `modularity` in `Suggested.lean` presents the newform formulation.
The first assertion is R29.3 and R29.4 for `F_E`; the second composes the
quotient map with the isogeny in R29.5; the third is the parametrisation there.
The existence theorem of R29.3, the case `K=ℚ` of EllipticCurveModularityTotallyReal
§4.4, makes all three conclusions unconditional. The Lean target `modularity` exhibits a
positive level with an attached form and the all-coefficient identity. The exact-level
refinement at level N_E is the selected form F_E; the
exact-conductor comparison identifies the existential level with the conductor. The residual corollary gives attachment at level N_E for every prime p,
by the attached-form-to-residual-attachment theorem of R29.2. It has no residual
irreducibility hypothesis; it does not assert that the residual conductor equals `N_E`
at primes of bad reduction or at primes where `E[p]` is reducible.

For an individual curve, there is also an equivalence without that existence input: an
attached newform at some positive level, a surjective homomorphism `J_0(N')→ E` at
some positive level, and a nonconstant morphism `X_0(N')→ E` at some positive level
are equivalent. Any level `N'` appearing in the geometric formulations is a multiple of
`N_E`, and level `N_E` itself is possible.

To prove this equivalence, an attached form gives a quotient and a parametrisation at
`N_E` by R29.4–R29.5. A nonconstant morphism `φ:X_0(N')→ E` has rational value
`φ(∞)`, so translation by `-φ(∞)` makes it send ∞ to `O`. The universal
property of the Abel–Jacobi map then gives a homomorphism `J_0(N')→ E`. Its image
contains the image of the nonconstant curve morphism, which is all of `E`, so it is
surjective. The preceding Jacobian-quotient converse gives the attached form. This proves the parametrisation-to-form implication and the level divisibility conclusion.

The induced map from the Jacobian is a homomorphism of abelian varieties. Merely having
a scheme morphism that sends the origin to the origin would need the rigidity theorem to
justify that interpretation. The general interfaces for projective curves, Jacobians and
abelian varieties supply it; the geometric equivalence is stated with the homomorphism
hypothesis explicitly.

*Sources and prerequisites.* Serre, §4.6, Theorem 4 and its proof, pp. 207–208, gives
the newform and quotient formulations. The equivalence uses attachment and `F_E` in
R29.3, rational coefficients, exact conductor and bad factors in R29.4, the isogeny and
parametrisation in R29.5, and the Jacobian-quotient converse in this layer. The
geometric inputs are ModularCurvesPartII **§16.7**,
**§17.3**, and JacobianChallenge Layer F. The distinction
between an arbitrary `N'` and `N_E`, together with the two old copies at level 22, is
the acceptance condition for this equivalence. The residual corollary has the
following additional Checks:

- At p=5 for 11a1, the level-11 attachment holds even though the rational 5-isogeny
  makes the residual representation reducible.
- At p=11 for 11a1, level 11 is allowed even though its prime-to-11 residual
  conductor has no factor at 11.
- At p=2 for the geometric CM curve `y²=x³−x`, the level is 32; neither the small
  characteristic nor the CM excludes the corollary.

### Elliptic coefficient summability

**Elliptic coefficient summability** (`LFunction_LSeriesSummable` in `Suggested.lean`).
For every number field K, every `W : WeierstrassCurve K` with `W.IsElliptic`,
and every `s : ℂ` with `3/2 < s.re`, prove

`LSeriesSummable (fun n => (W.LFunction n : ℂ)) s`.

For each nonzero integral ideal 𝔞, let b_𝔞 be the multiplicative coefficient obtained
from the inverse local polynomials of W, and let d_K(𝔞) count its integral ideal
divisors. Prove the comparison with the native coefficients:
`W.LFunction n = ∑_(N𝔞=n) b_𝔞`, with the empty sum giving zero at n=0.
The unit ideal has coefficient 1. This is the elliptic specialization of the
norm-fibre and Euler-product interfaces, with the native local polynomials at
all primes, including primes of residue characteristic 2 and 3.

At a good prime ideal 𝔭 of norm q, Hasse's bound makes the roots α, β of
`X²−a_𝔭X+q` have absolute value √q. The inverse-polynomial recurrence gives
`b_(𝔭^m)=∑_(i=0)^m α^i β^(m−i)` and hence
`|b_(𝔭^m)|≤(m+1)q^(m/2)` for m≥0. At a multiplicative prime the coefficients
are the powers of 1 or −1; at an additive prime the constant coefficient is 1
and all positive-degree coefficients vanish. Multiplicativity therefore gives
`|b_𝔞|≤d_K(𝔞)√(N𝔞)` for every nonzero integral ideal.
Consequently `|W.LFunction n|≤√n ∑_(N𝔞=n) d_K(𝔞)` for n≥1.

Put σ=Re s>3/2. The nonnegative ideal majorant has sum
`∑_𝔞 d_K(𝔞)(N𝔞)^(1/2−σ) = (∑_𝔟 (N𝔟)^(1/2−σ))²`,
where both indices range over nonzero integral ideals. This follows by summing over
ordered factorizations 𝔞=𝔟𝔠 and using multiplicativity of the ideal norm.
The sum on the right converges because σ−1/2>1. Regrouping finite norm fibres
and comparison prove the asserted absolute convergence without modularity.

For K=ℚ, the unique ideal of norm n gives the rational coefficient-bound milestone
`|a_n(E)|≤d(n)√n`, where `d(n)=n.divisors.card`. Here the same majorant is the
Dirichlet convolution of n↦√n with itself, with value zero at n=0.
Mathlib's `LSeriesSummable.convolution` gives this specialization directly.

*Sources and prerequisites.* Silverman, AEC V.1.1, via EllipticCurves Layer 3's
Hasse bound, supplied as `WeierstrassCurve.hasse_bound` in
`TauCeti.AlgebraicGeometry.EllipticCurve.HasseBound`; the native local polynomials
in Mathlib `AlgebraicGeometry/EllipticCurve/LFunction.lean`; EllipticCurves Layer 4
for local reduction over number fields. ArithmeticDirichletSeries Layers 1, 2 and 5
supply finite norm fibres, regrouping, ideal convolution and convergence of the
unweighted ideal series for real exponent greater than one. Their pinned
implementations are listed in the supplier contracts. Cremona §2.6,
(2.6.1)–(2.6.2), p. 25, gives the rational specialization of the recurrences and
multiplicativity. The elliptic norm-fibre comparison, coefficient bound and
summability deduction are the targets of this subsection.

**Checks.**

- At n=0 the norm fibre is empty and the coefficient is 0; at n=1 its only ideal
  is the unit ideal, giving coefficient and majorant 1. For 11a1 over ℚ at n=4,
  the recurrence gives a₄=2, within d(4)√4=6.
- For 11a1 over ℚ(√17), 2 splits into two primes of norm 2, each with trace −2.
  The norm-2 coefficient is −4, and the norm-4 coefficient is 2+4+2=8.
  The respective majorants are 4√2 and 20. The rational norm-4 majorant 6
  would fail, detecting an incorrect omission of the norm fibres.
- For 11a1 over ℚ(√5), 2 is inert: there is no ideal of norm 2, and at norm 4
  the trace is (−2)²−2·2=0. Over ℚ(√2), 2 is ramified with residue degree one,
  so its norm-2 coefficient is −2; good reduction persists under base change.
- At the split multiplicative prime 11 of 11a1 over ℚ, a₁₂₁=1; at the additive
  prime 2 of y²=x³−x, a₄=0. The additive constant coefficient remains 1.
- At s=7/4 the ideal-series exponent is 5/4>1. At s=3/2 it is 1, so the
  majorant series diverges and this proof makes no boundary convergence claim.

### Continuation and the functional equation

Let F_E be the selected attached newform of R29.3.
The all-coefficient comparison gives equality of the formal Dirichlet coefficients of `E` and `F_E`.
The headline statement `exists_entire_completed_LSeries E` in `Suggested.lean`
is unconditional; its pinned signature exhibits a positive level N together with an
attached form and the entire completed function using N. The exact-conductor comparison
identifies N with `N_E`. The attached-form version
`IsNewformOf.exists_entire_completed_LSeries` in `Suggested.lean` instead takes
attachment directly.
By the local factor theorem of R29.4, their Euler products include identical factors at
bad primes as well as good primes. By `LFunction_LSeriesSummable` and the all-coefficient
identity, both complex Dirichlet series converge absolutely and agree for `Re s>3/2`.

The completed function, initially on that half-plane, is

`Λ(E,s)=N_E^(s/2)(2π)^(-s) Γ(s)L(E,s).`

`exists_entire_completed_LSeries` asserts an entire continuation of this function and a
sign `w_E∈(1,-1)` satisfying

`Λ(E,s)=w_EΛ(E,2-s) (s∈ℂ).`

In the weight-two convention the sign is the eigenvalue of `-W_(N_E)` on `F_E`. The
Mellin transform and Fricke functional equation are supplied by the modular-form
L-function theory. The supplied Mellin comparison agrees with the literal series for
`Re s>2` in weight two. Prove holomorphy of the elliptic series on `Re s>3/2`
using the summability target and Mathlib's `LSeries_analyticOnNhd`. The completion
factors are holomorphic there, so the identity theorem on this connected half-plane
extends that comparison to `Re s>3/2`. The inverse gamma factor is entire, so `L(E,s)`
also has an entire continuation. The literal Mathlib Dirichlet-series expression outside its domain of
convergence is not the definition of that continuation; the suggested statement asserts existence
of an entire function agreeing with it in the stated half-plane.

For 11a1, take the Fricke eigenvalue −1 and nonvanishing of the newform L-value at 1
as explicit inputs. Then the completed function has sign `+1` and nonzero value at `s=1`. This is an
acceptance example for the sign convention and continuation. The factors `N_E^(s/2)` and
`(2π)^(-s)` must both be retained: changing them changes the displayed functional
equation. The nonvanishing example is an analytic statement and does not deduce a rank
formula.

*Source and prerequisites.* Cremona, §2.6, p. 25, gives the L-series identity for a
modular elliptic curve. The direct inputs are the all-local-factor identity in R29.4,
Mathlib `WeierstrassCurve.LFunction` and `WeierstrassCurve.LSeries`, and Tau Ceti
ModularForms **Layer 7: L-functions**
([ModularForms roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularForms/README.md#layer-7-l-functions)) for Hecke continuation and
the functional equation. The extension of the Mellin comparison uses
`LFunction_LSeriesSummable`, Mathlib `NumberTheory/LSeries/Deriv.lean` and the analytic
identity theorem.

### Examples

The old multiplicity two at level 22, the quadratic coefficient field at level 23,
and the CM restriction example distinguish the scope of the converse. The sign and
nonvanishing example tests the normalization of the completed L-function.

### Dependencies

*Needs:* Layers R29.1–R29.5 as specified for each implication, with the existence
theorem of R29.3 for the unconditional statements; ModularCurvesPartII §§16.3–16.7 and §17.3;
FaltingsFinitenessAndIsogenyTheorems §§R28.6.2–R28.6.3; ArithmeticGaloisRepresentations
§6.1; AbelianSchemesAndArithmeticModuli A4.1 and A6.5; RepresentationTheory/SemisimpleAlgebras Layer 3;
ModularForms Layers 4, 7 and 8G; JacobianChallenge Layer F; EllipticCurves Layer 3
for Hasse's bound; ArithmeticDirichletSeries Layers 1, 2 and 5 for ideal
norm fibres, convolution and convergence; Mathlib `NumberTheory/LSeries/Convolution.lean` and
`NumberTheory/LSeries/Deriv.lean` for elliptic summability and holomorphy.

## Downstream consumers

Within R29.3, attachment and uniqueness are defined before any selected `F_E`, and
the existence of an attached newform is the case `K=ℚ` of
EllipticCurveModularityTotallyReal §4.4.
Rationality applies to every attached form. The conditional comparison chain starts
there, passes through R29.4 to the isogeny theorem of R29.5, and supplies the geometric
equivalence in R29.6. The Jacobian-quotient converse also uses absolute irreducibility
from Faltings and the exhaustive old/new decomposition. It has no dependency on the
existence theorem or on the definition of a selected `F_E`. The existence theorem
establishes the equivalent formulations unconditionally.

The reusable outputs are the rational endomorphism theorem and the rational isogeny
relations; residual attachment of an attached form at every prime; the attachment predicate and cross-level
uniqueness; the newform `F_E` and all-coefficient identity; an isogeny from the J₀
quotient; the chosen parametrisation with its cusp, degree and differential properties;
and the entire completed L-function with its functional equation. Each uses the general
objects owned by the neighbouring roadmaps, and each can be consumed without
reconstructing the existence proof.

## Provenance

This section is secondary; it maps targets to an existing formalisation outside Tau Ceti and
prescribes nothing. The folder
[`LeanPool/FLTEichlerShimura/`](https://github.com/LeanPool/lean-pool/tree/f8b9b721d616a2cc0b22fc226e4a9e3dd6cea2d0/LeanPool/FLTEichlerShimura)
of LeanPool/lean-pool, read at commit `f8b9b721`, is an Apache-2.0 collection of 1206 files
gathering the elliptic-curve and modular-curve material of the Anthropic formalisation of
Fermat's Last Theorem around its Eichler–Shimura step. It is not a dependency: it is built
against an earlier Lean toolchain and Mathlib release and imports no Tau Ceti module, so a
statement read there is compared with the target here before it is used, and a proof adapted
from it keeps the Apache-2.0 attribution. Its modular curves are q-expansion function fields
over ℚ (subfields of Laurent series generated by the `j(q^d)` with `d ∣ N`), and its
`ModularCurve.JZero N` is the degree-zero divisor-class group of their base change to ℚ̄. It
has no modular curve as a scheme over ℚ and no modular Jacobian or quotient as an abelian
variety over ℚ, so the overlap is small.

- **Cyclic subgroups and their Galois stability (R29.1), geometric half only.** Over an
  algebraically closed field of characteristic zero, a point of odd order `2n+1` is the
  kernel of a degree-`2n+1` map onto the Vélu quotient, given on function fields
  (`WeierstrassCurve.exists_veluFunctionFieldHom_pointMapOfPushforward_ker_eq_zmultiples`;
  points of order two are treated separately); a cyclic kernel of order `N` makes the
  modular polynomial vanish at the two `j`-invariants
  (`WeierstrassCurve.Affine.eval_modularPolynomial_map_j_eq_zero_of_isAddCyclic_ker_pointMapOfPushforward`);
  and there are `ψ(N)` cyclic subgroups of order `N`
  (`WeierstrassCurve.natCard_addSubgroup_isAddCyclic_card_eq_dedekindPsi_of_isAlgClosed`).
  The Vélu coefficient formulas are stated over any commutative ring. Nothing there
  descends a Galois-stable subgroup to an isogeny over ℚ, which is the relation the API of
  `HasRationalCyclicSubgroup` needs.
- **Rational 3-, 5- and 15-isogenies (R29.1), nearest material only.**
  `ModularCurve.x0_modularPolynomialPresentation` presents the q-expansion function field of
  `X₀(N)` as `ℚ(X)[Y]/(Φ_N(X,Y))`. There is no genus-zero parameter on `X₀(3)` or `X₀(5)`
  and no rational point of `X₀(15)`, so `three_isogeny_j`, `five_isogeny_j` and
  `fifteen_isogeny_j` have no counterpart.
- **Frobenius on the Tate module (supplier input of R29.4).** For an integral model and
  primes `ℓ ≠ p` with `ℓ` not dividing its discriminant,
  `WeierstrassCurve.tateModuleRep_charpoly_frobenius` gives the polynomial `X²-a_ℓX+ℓ` of
  Frobenius on the `p`-adic Tate module, with the cyclotomic determinant and
  unramifiedness beside it. Here these are consumed from ArithmeticGaloisRepresentations
  §§6.1–6.3, not owned.
- **A modularity predicate (R29.3, R29.6).** `WeierstrassCurve.IsModular` asks for an
  integral model and a weight-two cusp form on `Γ₀(N)`, normalised by its eigenform
  coefficient recursions but not required to be new, whose prime coefficients equal those of
  the model at the primes dividing neither its discriminant nor `N`. It is only a definition
  there: no curve is proved modular in the folder. `IsNewformOf` and `modularity` ask for a
  newform of trivial character, and `modularity` for agreement of every coefficient.

These are the only points of contact. `rationalEndomorphisms_eq_int`, R29.2, the theorems of R29.3, the conductor and
bad Euler factors of R29.4, R29.5 and R29.6 have no counterpart there. Its theorem that
endomorphisms are multiplications by integers
(`WeierstrassCurve.isogenyEnd_eq_zsmul_of_transcendental_j`) assumes a `j`-invariant
transcendental over ℚ, which no curve over ℚ has. The Eichler–Shimura relation
`F²-T_ℓF+ℓ=0` enters only as the hypothesis predicate `ModularCurve.FrobeniusQuadratic`, and
its group-cohomology Eichler–Shimura isomorphism for `Γ₀(N)` is not used here.

## Scope and ownership

The modularity and geometric comparisons have base field ℚ. Elliptic coefficient
summability in R29.6 is proved over every number field K, using the native
`WeierstrassCurve.LFunction` with coefficients grouped by ideal norm. The curves over ℚ may have complex
multiplication over ℚ̄; the constructions and theorems include that case. The endomorphisms used in the proofs are
defined over ℚ. In particular,

`End_ℚ(E)=ℤ,`

including for a curve whose geometric endomorphism ring is larger. The Tate module over
a field containing the CM field has different irreducibility properties and must not be
substituted for the representation over ℚ.

This roadmap begins after the elementary theory of elliptic curves, local reduction,
modular forms, and modular curves. It imports those objects and their general theorems
and supplies the arithmetic comparisons specific to elliptic curves over ℚ. The
following divisions of responsibility determine the interfaces.

* Tau Ceti **EllipticCurves**, Layers 1–4, provides Weierstrass equations,
  isogenies, torsion and Tate modules, finite-field traces, local reduction and
  the Tate curve. ArithmeticGaloisRepresentations **§§6.1–6.3** supplies the
  arithmetic Galois representation, its determinant and Frobenius polynomial.
  NeronModelsAndSemistableAbelianVarieties **§§5.3a and 5.3g–5.3i** supplies
  the comparison of the elliptic conductor with Artin conductors.
* Tau Ceti **ModularForms**, Layers 4, 5, 7 and 8G, supplies newforms,
  finiteness at fixed weight and level, the old/new decomposition, strong
  multiplicity one across levels, L-functions, and Galois conjugation of
  coefficients. The general theory of those constructions stays there.
* EllipticCurveModularityTotallyReal **§4.4**, the modularity theorem over totally
  real fields, supplies at `K=ℚ` the cuspidal automorphic representation of every
  elliptic curve over ℚ. GL2AutomorphicRepresentationsAndTransfer **R16.6.1–R16.6.2**
  supply the dictionary between normalized newforms and cuspidal representations of
  `GL₂(𝔸_ℚ)` that turns it into a classical newform.
* AlgebraicModularFormsAndSerreWeights **§7.5** supplies the residual attachment
  predicate.
* AutomorphicGaloisRepresentations **§1.5**, **§6.4** and **§§6.1–6.2** supplies
  the representations of newforms, their full local compatibility, and their
  realization in the Tate modules of modular quotients.
* FaltingsFinitenessAndIsogenyTheorems **R28.4** and **R28.6** supplies
  semisimplicity, the Tate–Hom comparison, isogeny criteria, finiteness of
  elliptic isogeny classes, and the cyclic-Hom theorem with its endomorphism hypothesis.
* Tau Ceti **ModularCurves** supplies the curve and scheme dictionaries;
  ModularCurvesPartII **§§16.2–16.7** and **§17.3** supplies the quotients of the
  modular Jacobians, their differentials, the rational cusp and Abel–Jacobi
  map. Tau Ceti **JacobianChallenge**, Layer F, supplies its universal
  property. Degree and the passage between function fields and projective
  curves use Tau Ceti **AlgebraicCurves**, Layers 6 and 12.

R29.6 owns elliptic coefficient summability over number fields;
EllipticCurvePeriodsAndModularParametrizations §3.1 consumes this result. The general
norm-fibre and convergence theory is supplied by ArithmeticDirichletSeries Layers 1,
2 and 5, including its pinned Tau Ceti implementations. The rational divisor bound
is the specialization to ℚ.

The analytic output is continuation and a functional equation for `L(E,s)`. Its
consumers include EllipticCurves Layer 7 and RankZeroOneBSD. The rank formula,
special-value formula, Tate–Shafarevich group, and the arithmetic parts of
Birch–Swinnerton-Dyer belong to those further theories. Modularity of abelian varieties
of GL₂-type over ℚ belongs to EllipticCurveModularityPartIIGL2TypeAbelianVarieties.

## Exact supplier contracts

The library reference points are Mathlib `1b1ccf4` and Tau Ceti `2fd255d`. The following existing declarations
are used with their stated generality.

| Declaration | Input supplied here |
| --- | --- |
| `WeierstrassCurve.j` | `j_E=c_4³/Δ` for a nonsingular model |
| `Set.Finite`, `Set.Infinite` | finite and infinite sets, using their subtype cardinality |
| `CuspForm` | bundled cusp forms for a subgroup of `GL₂(ℝ)`, holomorphic and vanishing at all cusps |
| `NumberField.RingOfIntegers` | the integral closure of ℤ in a number field |
| `Algebra.norm` | determinant of multiplication in a finite free extension |
| `Algebra.norm_eq_zero_iff` | in a finite free extension of domains, norm zero is equivalent to element zero |
| `Int.eq_zero_of_abs_lt_dvd` | `m∣ x` and `abs(x) < m` force `x=0` |
| `HeckeRing.GL2.Newform` | normalized newforms at a fixed positive level and weight |
| `Newform.eq_of_forall_notMem_eigenvalue_eq` | equality at a fixed level and character from agreement at all good indices outside a finite set |
| `Newform.level_eq_and_coe_eq_of_forall_notMem_prime_eigenvalue_eq` | Tau Ceti `Newforms/StrongMultiplicityOne.lean`: newforms of levels N, M and equal weight whose characters induce the same character modulo `lcm N M`, with equal eigenvalues at every prime `p ∤ NM` outside a finite set, have N = M and are the same function |
| `WeierstrassCurve.localPolynomial` | the integer polynomial in the four reduction cases above |
| `WeierstrassCurve.IsSemistable` | Tau Ceti `MinimalModel/Semistable.lean`: good or multiplicative reduction at every prime of the base ring `O` |
| `WeierstrassCurve.LFunction`, `WeierstrassCurve.LSeries` | the formal coefficients and their complex Dirichlet series |

For the number-field convergence target, Tau Ceti supplies
`TauCeti.normCoeff_eq_sum_normFiber` in
`TauCeti/NumberTheory/ArithmeticDirichletSeries/NormCoeff.lean`,
`TauCeti.normCoeff_convolution` in the corresponding `Convolution/Basic.lean`, and
`TauCeti.summable_absNorm_rpow_ideal_iff` in the corresponding `Convergence.lean`.
These are the implementations of ArithmeticDirichletSeries Layers 1, 2 and 5:
finite norm fibres of nonzero integral ideals, transport of ideal convolution,
and summability of `(N𝔞)^(-t)` exactly for t>1 over every number field.
Mathlib `WeierstrassCurve.LFunction` uses all height-one primes of the ring of
integers and their completions; it neither restricts to rational primes nor
asserts summability by its definition.

The fixed-level multiplicity-one theorem in this table takes agreement at all indices
coprime to the level outside a finite set. The cross-level theorem below it is Tau
Ceti's implementation of ModularForms Layer 5 (Miyake, Theorem 4.6.19); cross-level
uniqueness of an attached form uses it with both characters trivial. The fixed-level
row follows from its equal-level case, since agreement at all good indices includes
agreement at the good primes.

The native elliptic substrate is supplied by
`TauCeti.AlgebraicGeometry.EllipticCurve.Affine.Point.Galois`:
`WeierstrassCurve.pointGaloisAction` acts on geometric points and
`WeierstrassCurve.torsionGaloisAction` restricts it to Mathlib's `AddSubgroup.torsionBy`.
The action preserves addition and the point at infinity, and its restriction agrees with
the point action under the torsion inclusion. No second point action or torsion carrier
is part of this roadmap. Mathlib's `Field.absoluteGaloisGroup ℚ` is the acting group,
abbreviated `GQ` in `Suggested.lean`. There `GQ` is written as
`AlgebraicClosure ℚ ≃ₐ[ℚ] AlgebraicClosure ℚ`, the unfolded automorphism group, so
the native point and torsion actions apply directly. The Krull topology is transported
from the absolute Galois group.

`TauCeti.AlgebraicGeometry.EllipticCurve.TateModule.Galois` supplies
`WeierstrassCurve.tateModuleGaloisRepresentation` on the existing
`TateModule r (E.baseChange (AlgebraicClosure ℚ)).toAffine.Point`.
`WeierstrassCurve.nonempty_linearEquiv_tateModule`, in the corresponding `Basic` module,
identifies this integral module with `Fin 2 → ℤ_[r]` over a separably closed field in
which r is nonzero. `TauCeti.det_tateModuleGaloisRepresentation`, in the corresponding
`Determinant` module, gives its cyclotomic determinant. Rational coefficients mean
scalar extension along `ℤ_[r] → ℚ_[r]`, using Mathlib's tensor product and
`LinearMap.baseChange`; they do not introduce another Tate-module carrier.

The residual determinant is the mod-p cyclotomic character, by the supplied Weil pairing
and reduction of the integral determinant. ArithmeticGaloisRepresentations §6.2,
*Determinant and oddness*, supplies the arithmetic adapter, including complex conjugation
with determinant −1. Its §§6.1–6.3 supply the continuous, residual and rational adapters,
the good-prime Frobenius polynomial, and the Tate-curve local comparison. In §6.1,
[Basis-free elliptic residual representation](../ArithmeticGaloisRepresentations/README.md#elliptic-residual-representation),
use `TateModule.residualRep E p`, abbreviated `residualRep E p` below. It is the basis-free
representation on the native geometric p-torsion, with its `ZMod p`-linear action.
After finite coefficient extension and a choice of basis it gives the representation
on `Fin 2 → k` used by AlgebraicModularFormsAndSerreWeights; further extension to
`𝔽̄_p` gives the classical Serre spelling. Attachment, trace, determinant and
irreducibility are independent of the basis. Layer 3 supplies
Artin and Swan conductors, prime-to-p residual conductors and coefficient-extension
invariance. NeronModelsAndSemistableAbelianVarieties §§5.3a, 5.3g–5.3i and 6.5–6.6
supply the elliptic conductor, residual conductor formulas, equation/scheme reduction
comparisons and the comparison with Mathlib's local polynomial, retaining the wild
terms at 2 and 3. In particular the conductor is positive, good reduction is equivalent
to prime-to-conductor, and multiplicative reduction is equivalent to conductor exponent
one.

AlgebraicModularFormsAndSerreWeights §§6.1–6.2 supply the classical rank-two newform
representation. AutomorphicGaloisRepresentations §§1.5, 6.1–6.2 and 6.4 supply its
geometric realization, residual representation and full classical conductor/local-factor
compatibility. Its §6.1 identifies the actual weight-two quotient Tate module, with the
coefficient-field action; its §6.4 retains bad-place monodromy and coefficient-prime
restrictions. ArithmeticGaloisRepresentations §5.3 supplies recognition by good Frobenius
polynomials for continuous semisimple representations, using Chebotarev and
Brauer–Nesbitt. Continuity and semisimplicity are hypotheses of that recognition theorem.

ModularCurvesPartII §§3.1–6.3 supply the rational modular curves and the rational Γ₀
cusp. Its §§13.1 and 16.2 supply the Jacobians and quotient maps, §16.3 the
dimension and Tate realization, and §16.4 the differential comparison. Section 16.5
supplies the actual Γ₀ quotient and its explicit isogeny with the Γ₁ quotient,
§16.6 the oldform factors, §16.7 the nonconstant Abel–Jacobi composite, and §17.3
the cusp-normalised map
`abelJacobiInfty`. The Γ₀ quotient is taken with its connected image-generated kernel
and Albanese Hecke action. For primitive weight-two forms its stated `N ≥ 5`
hypothesis causes no gap: ModularForms Layer 10C's dimension formula gives zero cusp
space at levels 1, 2, 3 and 4, so any such newform has `N ≥ 5`.
R29.6 assembles the exhaustive Γ₀ old/new decomposition from these orbit factors
with all degeneracy maps and divisor multiplicities and the complete modular-form decomposition; rational Tate-module
surjectivity for a surjective abelian-variety homomorphism is also a target there.
It uses Poincaré complete reducibility from
AbelianSchemesAndArithmeticModuli A6.5 and the additive Tate-module functor of A4.1,
with the rational isogeny and product deductions in R29.6, following
ModularCurvesPartII §16.3.
ModularCurvesPartII §§7.1–7.4 supplies the regular-differential/cusp-form dictionary. AlgebraicCurves Layers 6 and 12 supply
projective curve/function-field degree. JacobianChallenge Layer F supplies the
Abel–Jacobi universal property over the stated ground field.

FaltingsFinitenessAndIsogenyTheorems §§R28.4.5–R28.4.7 supply semisimplicity,
Tate–Hom and the isogeny criterion for abelian varieties. Its §§R28.6.1–R28.6.4
supply the elliptic bridge, semisimplicity, Tate–Hom and the isogeny criterion. The
ℚ-endomorphism assertion is established as the first target of Layer R29.1, including
geometric CM curves.

### Totally real modularity for existence

EllipticCurveModularityTotallyReal §4.4 supplies, for every totally real number field K and
every elliptic curve E over K, a cuspidal automorphic representation `π_E` of `GL₂(𝔸_K)` of
type `(2,0)`, with trivial central character and unique up to isomorphism, whose attached
representation is `H¹_ét(E_K̄, ℚ̄_ℓ)` for every ℓ and every coefficient isomorphism, with all
the local statements of its §4.2: the newvector has exact level the conductor, and at a good
place the Hecke eigenvalue is the Frobenius trace of E. It has no hypothesis on E, and
geometric CM curves are included. This roadmap uses the case `K=ℚ`.

GL2AutomorphicRepresentationsAndTransfer R16.6.1, *Primitive newforms and holomorphic
cuspidal classes*, and R16.6.2, *The complete level and Hecke dictionary*, supply over ℚ the
correspondence between normalized newforms of weight k ≥ 2 on `Γ₁(N)` and cuspidal
representations of `GL₂(𝔸_ℚ)` of conductor N, with the good-prime Hecke comparison.
AutomorphicGaloisRepresentations §3.10 identifies, for `F=ℚ`, the representation attached to
the automorphic representation of a newform with that of the newform.


Names below are in the namespace `TauCetiRoadmap.EllipticCurveModularity`. The accompanying
`Suggested.lean` states headline theorems on the pinned native carriers; it is not an
exhaustive checklist. It defines `GQ`, `lCoeff`, `coeff`, `HasRationalCyclicSubgroup` and
`IsNewformOf` to state those theorems. The remaining APIs are specified in mathematical prose.

The Artin conductor of a two-dimensional ℓ-adic or residual Galois representation and
the shared residual attachment API are absent at the pins, as are
rational modular curves, their Jacobians and modular quotients. Tau Ceti's
`WeierstrassCurve.algorithmicConductor`, computed by Tate's algorithm, is not identified
there with the conductor `N_E` of R29.4. The conductor-dependent and geometric targets
are specified below. The newform modularity and completed L-series statements in
`Suggested.lean` exhibit a positive level; the exact-conductor identification is the
target of R29.4.

## References

The existence of the automorphic representation of an elliptic curve over ℚ is supplied by
EllipticCurveModularityTotallyReal §4.4, whose references give its sources.

The proof is organized around the comparisons it needs. The main references and their
roles are:

* [J.-P. Serre, *Sur les représentations modulaires de degré 2 de
  Gal`ℚ̄/ℚ`*, Duke Math. J. 54 (1987), 179–230][serre]. The residual
  attachment of §3.3, (3.3.1), p. 198, is used in R29.2. In §4.6, pp. 207–208,
  the coefficient relation (4.6.4) is the attachment predicate of R29.3, and
  Theorem 4 states the newform and quotient formulations of R29.6.
* G. Faltings, *Endlichkeitssätze für abelsche Varietäten über Zahlkörpern*,
  Invent. Math. 73 (1983), 349–366. In §5, Satz 3 and Satz 4,
  p. 360, give semisimplicity and the endomorphism comparison. Korollar 1
  and Korollar 2, p. 361, give the Hom comparison and equivalent criteria
  for isogeny. They support both the construction of a quotient isogeny
  and the irreducibility argument in the converse.
* [H. Carayol, *Sur les représentations ℓ-adiques associées aux formes
  modulaires de Hilbert*, Ann. Sci. École Norm. Sup. (4) 19 (1986),
  409–468][carayol]. The normalization in §0.5, p. 410, and Theorem `A` in
  §0.7, pp. 410–411, lead to the conductor and L-function corollary in
  §0.8, p. 411. Its specialization to a rational weight-two classical
  newform gives the full local comparison required here.
* J. E. Cremona, *Algorithms for modular elliptic curves*, second edition
  (1997), Chapter II. Section 2.6, pp. 24–25, gives the
  newform/elliptic-curve and coefficient conventions; §2.7 and Lemma
  2.7.1, pp. 25–26, describe oldclasses and their divisor multiplicities;
  §2.15.1, p. 47, gives the differential and period interpretation of a
  modular parametrisation.

The other works cited in the layers are:

* J. H. Silverman, *The Arithmetic of Elliptic Curves*, second edition, Graduate Texts
  in Mathematics 106, Springer (2009). The layers use III.1 for Weierstrass equations and
  their invariants, III.4.2–III.4.3, III.5 and III.9 for isogenies, the invariant
  differential and the endomorphism ring, V.1.1 for Hasse's bound, and VII.1 and VII.5
  for minimal equations and reduction types.
* T. Miyake, *Modular Forms*, Springer (1989). Theorem 4.6.19, strong multiplicity one
  across levels, is the form of ModularForms Layer 5 that Tau Ceti proves as
  `Newform.level_eq_and_coe_eq_of_forall_notMem_prime_eigenvalue_eq`; it gives the
  uniqueness of attached newforms used in R29.3.
* J. S. Milne, *Abelian varieties*, in G. Cornell and J. H. Silverman (eds.),
  *Arithmetic Geometry* (Storrs, 1984), Springer (1986), 103–150
  ([author's copy](https://www.jmilne.org/math/articles/1986b.pdf)). In §8, p. 115,
  multiplication by the degree of an isogeny factors through it; Proposition 12.1,
  p. 122, gives an abelian subvariety a complement up to isogeny. Both enter rational
  Tate-module surjectivity in R29.6.
* K. A. Ribet and W. A. Stein, *Lectures on Serre's conjectures*, with appendices by
  B. Conrad and K. Buzzard, in *Arithmetic Algebraic Geometry* (Park City, 1999),
  IAS/Park City Mathematics Series 9, American Mathematical Society (2001), 143–232
  ([authors' revised version](https://wstein.org/papers/serre/ribet-stein.pdf)). §3.6,
  p. 40, sets up the old and new subspaces when one prime is added to the level. In
  Conrad's appendix, Theorem 5.14, p. 73, gives the dimension and the rational Tate
  module of the quotient of `J₁(N)` attached to a newform (the `A_F^1` of the
  Conventions), and its proof the exactness of rational Tate modules along surjections
  of abelian varieties. Both are used in R29.6.
* A. J. Barrios, [*Explicit classification of isogeny graphs of rational elliptic
  curves*](https://arxiv.org/abs/2208.05603), arXiv:2208.05603v1 (2022). Theorem 2.3
  and Table 1, p. 6, give the genus-zero j-parametrisations behind the 3- and
  5-isogeny relations of R29.1.
* H. Darmon, F. Diamond and R. Taylor,
  [*Fermat's Last Theorem*](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf),
  revised version (2007) of the article in *Current Developments in Mathematics 1995*,
  International Press. §2.2, Proposition 2.12, p. 57, describes the representation at a
  prime of multiplicative reduction and its conductor exponent one (R29.4); §3.6, the
  proof of Theorem 3.48, p. 102, uses the noncuspidal rational points of `X₀(15)` and
  their failure of semistability (R29.1).
* E. González-Jiménez and J.-C. Lario, *Faltings elliptic curves in twisted ℚ-isogeny
  classes*, [supplementary tables](https://web.mat.upc.edu/joan.carles.lario/types.pdf).
  §19.1, p. 93, gives the j-invariants of the four noncuspidal rational points of
  `X₀(15)` (R29.1).
* J.-P. Serre, [*Facteurs locaux des fonctions zêta des variétés algébriques
  (définitions et conjectures)*](https://www.numdam.org/item/SDPP_1969-1970__11_2_A4_0/),
  Séminaire Delange–Pisot–Poitou, Théorie des nombres 11 (1969/70), exposé 19.
  n° 2.4, cases b) and c), p. 19-09, give the local factor and the conductor exponent
  at multiplicative and at additive reduction (R29.4).
* A. Brumer and K. Kramer, [*The conductor of an abelian
  variety*](https://www.numdam.org/item/CM_1994__92_2_227_0/), Compositio Math. 92
  (1994), 227–248. In §6, (6.1), p. 243, the conductor exponent is the tame part plus
  the Swan conductor of the ℓ-torsion, for ℓ different from the residue characteristic
  (R29.4).

All page numbers refer to printed pagination. In the Serre PDF printed page 179 is PDF
page 1. In the Faltings PDF printed page 349 is PDF page 1. The Numdam PDFs include a
cover page: Carayol p. 409 is PDF page 2. In
Cremona's Chapter II PDF, subtract 6 from the printed page to obtain the one-based PDF
page. Serre's 1970 exposé is numbered 19-01 to 19-15 after a Numdam cover page, so
p. 19-09 is PDF page 10. Milne's pages are those of the Storrs volume, as in the linked
scan. The Ribet–Stein pages are those of the authors' revised version of 23 November
2010, linked above, not those of the printed chapter; the Darmon–Diamond–Taylor pages
are those of the 2007 revision.

[serre]: https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf
[carayol]: https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf
