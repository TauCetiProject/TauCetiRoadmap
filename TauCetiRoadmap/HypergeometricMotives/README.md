# Roadmap: hypergeometric motives over ℚ

A hypergeometric motive is cut out of the cohomology of a one-parameter family of varieties whose
periods satisfy a generalised hypergeometric differential equation.  Everything about it that the
LMFDB displays is a function of three pieces of data: two disjoint multisets of rational numbers
modulo `1`, or equivalently two multisets `A`, `B` of positive integers of equal "totient weight",
and a specialization point `t ∈ ℚˣ`.  The invariants come in four families, each with its own
classical theorem behind it: the **monodromy** of the hypergeometric equation (Levelt's
companion-matrix description, the Beukers–Heckman invariant form and finiteness criterion, the
Bézout matrix), the **Hodge vector and weight** read off the combinatorial zigzag of the two
parameter sets, the **finite hypergeometric sums** of Katz, Greene and Beukers–Cohen–Mellit that
count points and are the Frobenius traces, and the **Euler factors, bad primes and conductor
exponents** of the L-function.  This roadmap builds the combinatorial layer completely, the
monodromy and character-sum layers as theorems, and the arithmetic layer as definitions whose
unconditional content is proved and whose motivic content is stated as implications from the
named purity hypothesis that Katz's theorem supplies.  The hypergeometric *motive* itself, as an
object of a category of motives, is not constructed here; its point counts are what this roadmap
defines, and the identification is cited.

The primary carrier is a **cyclotomic datum** `(A, B)`: two finite multisets of positive integers
with `A ∩ B = ∅` and `∑_{a ∈ A} φ(a) = ∑_{b ∈ B} φ(b) =: d`, exactly the LMFDB's family index.
Behind it stands the general **hypergeometric parameter pair** `(α, β)`: two multisets in `ℚ/ℤ` of
the same cardinality with `α ∩ β = ∅`, which is the generality in which Levelt, Beukers–Heckman and
the finite sums over a single field `𝔽_q` live.  A cyclotomic datum is the same thing as a
parameter pair stable under the Galois action `x ↦ ux`, `gcd(u, N) = 1`, and every statement that
needs rationality over `ℚ` (the gamma vector, the `M`-value, rationality and integrality of the
sums, the Frobenius traces for all powers of all good primes) is stated for cyclotomic data.

Suggested home: `TauCeti/NumberTheory/Hypergeometric/`, with files for the data and the
cyclotomic dictionary (`Data`), the zigzag (`Hodge`), the Levelt matrices and the Bézout form
(`Monodromy`), the finite sums (`FiniteSum`, `Gamma`), the Frobenius traces and Euler factors
(`Euler`), the bad primes (`Conductor`), and the worked families (`Examples`).

## Prerequisites

Every milestone names its prerequisites, each of one of four kinds and no other: a Mathlib
declaration at the pin; a Tau Ceti declaration at the pin; an earlier milestone of this roadmap;
a named layer or milestone of another roadmap in this repository.  No milestone waits on a Mathlib
pull request, on any pin but the current one, on an external repository, or on a roadmap that does not exist.

The roadmaps consumed are the
[classical arithmetic completion](../ClassicalArithmeticCompletion/README.md) (its Layer 1 Gauss
and Jacobi sums and Stickelberger relation), the sibling roadmap `CharacterSumsOverFiniteFields`
(the Hasse–Davenport product relation), the
[L-functions roadmap](../LFunctions/README.md) (the completed L-function card that the Euler
factors feed), the [Chebotarev roadmap](../Chebotarev/README.md) (the cyclotomic Galois character,
for the Galois action on the sums), the completed
[Hodge structures roadmap](../../Completed/HodgeStructures/README.md) (the Hodge numbers of a
Hodge structure, which Fedorov's theorem identifies with the zigzag numbers),
[`DeligneWeightsAndPurity`](../DeligneWeightsAndPurity/README.md) (Weil `q`-numbers, the
vocabulary of the purity hypothesis), [`PolynomialGaloisGroups`](../PolynomialGaloisGroups/README.md)
and the completed [number-field arithmetic roadmap](../../Completed/NumberFieldArithmetic/README.md)
(the Galois group and discriminant of a Frobenius polynomial), and
[`MotivesAndAlgebraicCycles`](../MotivesAndAlgebraicCycles/README.md) (the carrier in which the
Katz identification is stated, by citation only).

## Scope and ownership

### Owned here

- The carriers: hypergeometric parameter pairs `(α, β)` in `ℚ/ℤ`, cyclotomic data `(A, B)`, the
  dictionary between them, Galois stability, the gamma vector `γ`, the `M`-value, the defining
  rational function `Q = Φ_A/Φ_B`, the wild primes, the `p`-parts `(A_p, B_p, C_p)` and the
  prime-to-`p` parts `(A^p, B^p)`, the rotation number, and the duality `(A, B, t) ↔ (B, A, 1/t)`
  (Layer 1).
- The zigzag procedure: the height function, the degree, the weight, the Hodge vector, the Hodge
  polygon, the orthogonal/symplectic type, the Hodge-normalisation exponent `δ`, and the
  combinatorial laws they satisfy (symmetry, the two parity laws, interlacing ⟺ weight `0`)
  (Layer 2).
- Monodromy: the cyclic-vector conjugacy and the rank formula for companion matrices, the
  Levelt triple `(h_∞, h_1, h_0)`, Levelt's theorem over any field with the companion normal
  form, the invariant Hermitian form and its signature, the Beukers–Heckman finiteness criterion, the
  Bézout matrix with its determinant and module, imprimitivity and the primitive datum, and the
  reduction of the monodromy group modulo `ℓ` (Layer 3).
- Finite hypergeometric sums: Katz's exponential sum, the unnormalised sum `S_q`, the normalised
  sum `H_q` (Beukers–Cohen–Mellit Definition 1.1), Greene's `_{n+1}F_n`, their comparison, the
  dependence on the characters, the Galois action, rationality and integrality for cyclotomic
  data, the gamma-vector form (Beukers–Cohen–Mellit Theorem 1.3) that defines `H_q` at every
  prime power coprime to the wild primes, the shift and swap identities, and Ono's theorem and the
  cubic family as point-count acceptance tests (Layers 4 and 6).
- The arithmetic layer: good, tame and wild primes of `(A, B, t)`, the Frobenius trace
  `a_q(A, B; t)`, the Frobenius series and the Frobenius polynomial `F_p(T)`, the purity
  hypothesis and the consequences that follow from it (degree, integrality, the local
  functional equation), the determinant discriminant, the tame conductor exponents, the
  archimedean shifts attached to a Hodge vector and signature, the Newton/Hodge polygon
  comparison and the ordinary predicate, and the mod-`ℓ` semisimple Frobenius order (Layer 5).

### Consumed, not redefined

- From Mathlib: `gaussSum`, `jacobiSum` and their algebra (`gaussSum_mul_gaussSum_eq_card`,
  `gaussSum_mulShift_eq`, `star_gaussSum_eq`, `gaussSum_frob`,
  `jacobiSum_eq_gaussSum_mul_gaussSum_div_gaussSum`, `gaussSum_pow_eq_prod_jacobiSum`,
  `MulChar.ringHomComp`, `jacobiSum_ringHomComp`); multiplicative characters of a finite field
  (`MulChar`, its `CommGroup` instance, `MulChar.exists_mulChar_orderOf_eq_card_units`) and
  additive characters (`AddChar`, `AddChar.IsPrimitive`, `FiniteField.primitiveChar`);
  cyclotomic polynomials (`Polynomial.cyclotomic`, `natDegree_cyclotomic`,
  `cyclotomic_eq_prod_X_sub_primitiveRoots`, `prod_cyclotomic_eq_X_pow_sub_one`,
  `cyclotomic_eq_prod_X_pow_sub_one_pow_moebius`, `cyclotomic.irreducible_rat`); the rational
  circle `AddCircle (1 : ℚ)` with `AddCircle.equivIoc` and `addOrderOf_coe_rat`; the Galois
  group of a cyclotomic field (`IsCyclotomicExtension.autEquivPow`, `IsPrimitiveRoot.autToPow`,
  `IsCyclotomicExtension.Rat.galEquivZMod`); resultants (`Polynomial.resultant`,
  `Polynomial.sylvester`, `resultant_eq_prod_roots_sub`, `resultant_ne_zero`); `Matrix.charpoly`,
  `Matrix.IsHermitian`, `Matrix.PosDef`; `Polynomial.Gal`; `NumberField.discr`; `Nat.totient`;
  `ArithmeticFunction.moebius`; `PowerSeries.exp` and `PowerSeries.trunc`; `Polynomial.reverse`.
- From Tau Ceti at the pin: the cyclotomic Galois group API
  `IsCyclotomicExtension.card_aut_eq_totient` (`TauCeti.NumberTheory.Cyclotomic.Aut`); the
  primitive Dirichlet Gauss sums and their Galois action, `gaussSumOfPrimitiveRoot` and
  `map_gaussSumOfPrimitiveRoot` (`TauCeti.NumberTheory.DirichletCharacter.GaussSum`), consumed as
  the model for the Galois action on Gauss sums of a finite field; the Hodge numbers
  `TauCeti.Hodge.HodgeStructureOn.hodgeNumber` with `hodgeNumber_symm`
  (`TauCeti.Geometry.Hodge.Dimension`), against which Layer 2's zigzag numbers are stated to agree
  under Fedorov's theorem; the Euler-product package `EulerProductData`
  (`TauCeti.NumberTheory.ArithmeticDirichletSeries.EulerProduct.Data`), the shape into which the
  Euler factors of Layer 5 are assembled by the L-functions roadmap; the point count
  `WeierstrassCurve.pointCount` (`TauCeti.AlgebraicGeometry.EllipticCurve.PointCount`) of 6.1.
- From the [classical arithmetic completion](../ClassicalArithmeticCompletion/README.md): its
  **2.46**, the companion matrix `Polynomial.companion f` (`1` on the subdiagonal, `−coeff f i` in
  the last column, indexed by `Fin f.natDegree`) with `leftMulMatrix_root_eq_companion` (the
  matrix of multiplication by the root of `AdjoinRoot f`), `det_companion`, `minpoly_companion`
  and `hasEigenvalue_companion_iff`, and its **2.60**, `charpoly C(f) = f` for monic `f` over any
  commutative ring, consumed by Layer 3 and restated nowhere here; its
  **7.12** (Stickelberger's finite Gauss-sum valuation, `v_𝔓̃(g(ω^{−a})) = s(a)`, the base-`p`
  digit sum of `a`, at the prime above `p`), which 4.8 and 4.9 use for the `p`-adic bounds; its
  1.19, 1.36, 1.46 and 1.53 (cubic and quartic Gauss and Jacobi sums) are the worked instances that
  6.2 compares against.
- From the sibling roadmap `CharacterSumsOverFiniteFields`: its 3.4, the **Hasse–Davenport product
  relation** `g(Nm) = −ω(N)^{Nm} ∏_{j=0}^{N−1} g(m + j𝔮/N)/g(j𝔮/N)` for `N ∣ 𝔮 = q − 1`
  (Beukers–Cohen–Mellit Theorem 2.5; the factor `g(0) = −1` at `j = 0` makes this its
  `∏_j g(χλ^j) = χ(N)^{−N} g(χ^N) ∏_{j≥1} g(λ^j)`), consumed by 4.7 and by nothing else.  Its Gauss
  sums are Mathlib's `gaussSum` with `χ(0) = 0` for every `χ`, the convention pinned here.  The lifting relation,
  Kloosterman sums, Morita's `p`-adic Gamma function (its 6.4), the Gross–Koblitz formula (its 6.5)
  and every other theorem about character sums over finite fields that is not a hypergeometric sum
  live there.
- From [Elliptic curves, Part II — Legendre models, descent and character
  interfaces](../EllipticLegendreCharacterInterfaces/README.md): its **0.1**, the Legendre equation
  `legendre λ`, the Weierstrass model `y² = x(x − 1)(x − λ)` with coefficients
  `(0, −(1 + λ), 0, λ, 0)` over every commutative ring, and its **5.1**, the character-sum point
  count `pointCount = q + 1 + ∑_x quadraticChar(f(x))` for a normal-form equation `y² = f(x)` over
  an odd finite field; 6.1 states Ono's theorem on `legendre λ` and proves it through that count.
  The universal Legendre curve over `ℤ[1/2][λ, 1/λ(λ − 1)]` is [Modular
  curves](../ModularCurves/README.md)' 4C; the LMFDB family `A2.2_B1.1` is its fibre at `λ = t`.
- From the [Chebotarev roadmap](../Chebotarev/README.md), Layer 4: the cyclotomic Galois
  character, Frobenius acting on `ζ_m` by `ζ_m ↦ ζ_m^{𝔑𝔭}`; 4.4 states the Galois action on
  `H_q` in that vocabulary.
- From the [L-functions roadmap](../LFunctions/README.md), Layer 0: `ArithmeticLFunctionData`
  with its weight-`w` normalization translation, conductor, gamma shifts, root number and polar
  divisor.  Layer 5 here supplies the Euler factors, the conductor exponents at tame primes and
  the archimedean shifts; the card, its continuation and its functional equation are that
  roadmap's.  The motivic L-function of a hypergeometric motive is an instance of its Layer 0,
  not a second record type here.
- From [`DeligneWeightsAndPurity`](../DeligneWeightsAndPurity/README.md), Layer DWP.0, 0.1–0.2:
  Weil `q`-numbers of integer weight and their closure properties; 5.5's purity hypothesis is
  phrased with them.
- From [`PolynomialGaloisGroups`](../PolynomialGaloisGroups/README.md) and the completed
  [number-field arithmetic roadmap](../../Completed/NumberFieldArithmetic/README.md): the Galois
  group of a rational polynomial and `NumberField.discr`; 5.12 forms the LMFDB's
  `Gal(F_p(T))` and local discriminant `D` from them and adds nothing to either theory.
- From [`MotivesAndAlgebraicCycles`](../MotivesAndAlgebraicCycles/README.md), Layers 1–2: the
  category of pure motives and its realizations.  Nothing here is stated against it in Lean; it is
  the carrier in which the prose of Layer 6 locates Katz's motive.

### Not owned here

- **The motive.**  The construction of `H(A, B, t)` as an object of a category of motives, its
  realizations, and the theorem that the Frobenius traces of its ℓ-adic realization are the finite
  hypergeometric sums of Layer 4 (Katz, *Exponential sums and differential equations*, Chapter 8,
  and Beukers–Cohen–Mellit Theorem 1.5 for the varieties) are cited in Layer 6 and are targets of
  no layer.  Consequently every statement whose only proof passes through that identification
  (purity of the Euler factors, their integrality beyond 4.9, the local functional equation at
  good primes, the wild conductor exponents, the Hodge-theoretic meaning of the zigzag) is stated
  here as an implication from a named hypothesis or cited in prose, never asserted.
- **The signed signature `sig` and the global root number.**  The LMFDB's signature is the
  signature of complex conjugation on the middle Hodge piece of the real Hodge structure of
  `H(A, B, t)` at a real `t`; it needs the Hodge realization and is not a function of the
  combinatorics alone.  The unsigned invariant that is combinatorial, the Beukers–Heckman
  signature of the monodromy-invariant Hermitian form, is owned (3.6).  The root number of the
  L-function is the [L-functions roadmap](../LFunctions/README.md)'s.
- **Wild conductor exponents.**  At a wild prime the conductor exponent is the Artin conductor of
  the ℓ-adic realization; no formula for it is a theorem, and the function `σ(k)` of
  Roberts–Rodriguez-Villegas §13 is a conjectural bound.  Layer 5 defines the conductor
  exponents at tame primes by Roberts–Rodriguez-Villegas (13.1) and states the LMFDB's conductor
  `N = ∏ p^{c_p}` as the product of the tame exponents and the wild exponents of the realization,
  the latter consumed by citation.
- **Labels and the database ordering.**  The LMFDB family label `A…_B…` and motive label
  `A…_B…_t n.d` are built from the intrinsic data `(A, B, t)` with `A`, `B` listed in decreasing
  order; the choice between the two presentations `(A, B, t)` and `(B, A, 1/t)` of one motive
  (`1 ∈ B`, or else `max B > max A`) is a normal form fixed by convention and is not a target.
  This roadmap proves the duality that makes the choice harmless (1.12) and states no normal form.
- **Group identifications.**  The LMFDB's monodromy table names the image of the monodromy group
  modulo `ℓ` by an abstract-group label and its index in an orthogonal or symplectic group; the
  isomorphism invariants of the abstract group are `FiniteGroupInvariants`' and its label is not
  a target.  Layer 3 defines the group and the reduction; it identifies
  nothing.
- **Classical hypergeometric functions and the differential equation.**  Mathlib's
  `ordinaryHypergeometric` (`₂F₁`) and Tau Ceti's regularized hypergeometric functions are
  analysis; the hypergeometric differential operator, its solutions, periods and the variation of
  Hodge structure (Fedorov) are not targets.  Levelt's theorem is stated as a statement about
  matrix groups, as Beukers–Heckman state it, with no differential equation in its hypotheses.
- **Hasse–Davenport, Gross–Koblitz, Kloosterman sums**, and the general theory of character sums
  over finite fields: the sibling roadmap `CharacterSumsOverFiniteFields` (Hasse–Davenport 3.3–3.4,
  Morita's `Γ_p` 6.4, Gross–Koblitz 6.5).

## Pinned conventions

Decide these once.  Three of them (`t` versus `1/t`, the power of `q` that Hodge-normalises the
trace, and which Levelt matrix sits at which cusp) are read differently by the sources and the
software, and each wrong choice still produces plausible output: the wrong `t` changes `a_q` by a
character value, and so only at some primes (for `A2.2.2.2_B1.1.1.1` at `t = 1/2` it flips `a_5`
and keeps `a_7`); the wrong power of `q` rescales every trace of a datum with `δ > 0`; the wrong
cusp swaps the tame degrees.  Each row below says which LMFDB data pin it.

| Object | Convention |
|---|---|
| Parameters | `α, β : Multiset (AddCircle (1 : ℚ))`, equal cardinality `d`, disjoint (`a ∈ α → a ∉ β`).  Representatives are taken in `(0, 1]` through `AddCircle.equivIoc 1 0`, so that the class of `0` is represented by `1`.  This is the LMFDB's display and the convention of the zigzag; Beukers–Cohen–Mellit write `β_d = 1` for the same class.  Nothing depends on representatives except the zigzag, which is stated through them. |
| Cyclotomic data | `A, B : Multiset ℕ`, entries `≥ 1`, `∀ a ∈ A, a ∉ B`, `(A.map φ).sum = (B.map φ).sum`.  `α(A) := ⋃_{a ∈ A} {k/a : 1 ≤ k ≤ a, gcd(k, a) = 1}` as a multiset, i.e. the roots of `Φ_A := ∏_{a ∈ A} Φ_a` read as arguments; likewise `β(B)`.  **`α` comes from `A` and `β` from `B`**, as the LMFDB knowl `hgm.defining_parameters` states.  ⚠ Magma's `HypergeometricData(L₁, L₂)` reads `β` from `L₁` and `α` from `L₂` (Roberts–Rodriguez-Villegas §2, "Three Magma notes"), so the LMFDB family `A…_B…` is Magma's `HypergeometricData(B, A)`: Roberts–Rodriguez-Villegas (2.4) enter the Legendre family, LMFDB `A2.2_B1.1`, as `HypergeometricData([1,1],[2,2])`.  Sage's `HypergeometricData(cyclotomic=(A, B))` reads `α` from `A`, and its `t` is the LMFDB's `t` (its docstring's "`t` replaced by `1/t`" is relative to Magma's `(L₁, L₂) = (B, A)`, and the duality 5.14 makes the two agree). |
| The gamma vector | `γ : ℕ+ → ℤ`, finitely supported, the unique function with `Φ_A/Φ_B = ∏_n (X^n − 1)^{γ(n)}`; explicitly `γ(n) = ∑_{a ∈ A, n ∣ a} μ(a/n) − ∑_{b ∈ B, n ∣ b} μ(b/n)`.  As a multiset of nonzero integers, `n` with multiplicity `γ(n)` when `γ(n) > 0` and `−n` with multiplicity `−γ(n)` when `γ(n) < 0`; `∑ γ = 0`.  Positive entries come from `A`.  The LMFDB lists the multiset in increasing order; Beukers–Cohen–Mellit's `p_j` are the positive entries and `q_j` the absolute values of the negative ones, so `r = ∑_{γ(n)>0} γ(n)`, `s = −∑_{γ(n)<0} γ(n)`. |
| `M` | `M := ∏_n n^{n γ(n)} ∈ ℚ_{>0}`; equals `∏ p_j^{p_j} / ∏ q_j^{q_j}`. |
| The specialization point | `t ∈ ℚ`, `t ≠ 0`.  **The Frobenius trace of `H(A, B, t)` at a good prime power `q` is `a_q(A, B; t) := q^δ · H_q(α(A), β(B) | t)`**, with `H_q` the normalised sum of 4.3 (Beukers–Cohen–Mellit Definition 1.1, in their variable, which is the LMFDB's `t`) and `δ = δ(A, B)` the Hodge-normalisation exponent pinned below.  Equivalently, by the swap identity 4.10, `a_q(A, B; t) = q^δ · H_q(α(B), β(A) | 1/t)`.  The LMFDB's `t` is the classical variable of the series `∑ (α)_n/(β)_n t^n`, as in Roberts–Rodriguez-Villegas (1.3), (1.7) and (2.2), where `H(A2.2_B1.1, t)` is `H¹` of `y² = x(1 − x)(x − t)`.  Acceptance (LMFDB data): `A2.2_B1.1_t2.1` has `F_5(T) = 1 + 2T + 5T²`, so `a_5 = −2 = H_5(1/2, 1/2; 1, 1 | 2)`, while `A2.2_B1.1_t1.2` has `a_5 = +2` (reading `1/t` swaps the two).  Over the LMFDB's 65 degree-2 motives and `A2.2.2.2_B1.1.1.1_t-1.1`, with their Euler factors at `p ≤ 29`, this convention matches all 541 good `(motive, p)` pairs; the `1/t` reading matches 231 and dropping `q^δ` matches 438. |
| The Levelt matrices | `h_∞ := C(Φ_A)` and `h_0 := C(Φ_B)^{-1}`, with `C(f) := Polynomial.companion f` the companion matrix of classical arithmetic completion 2.46, which for a monic `f = X^d + c_{d−1}X^{d−1} + ⋯ + c_0` has `1` on the subdiagonal and `−c_0, …, −c_{d−1}` as last column (`C(f)_{i+1,i} = 1`, `C(f)_{i,d−1} = −c_i`), and `h_1 := h_∞^{-1} h_0^{-1}`, so that `h_∞ h_1 h_0 = 1`.  For a cyclotomic datum all three lie in `GL_d(ℤ)`.  The characteristic polynomial of `h_∞` is `Φ_A` and that of `h_0` is `Φ_B` (reciprocal polynomials of cyclotomic data are themselves, 1.5); this is the LMFDB knowl `hgm.levelt_matrices`.  The LMFDB displays a conjugate of this triple; every invariant displayed is conjugation-invariant. |
| Cusps and `t` | In the LMFDB's `t`, **`t → 0` is the cusp of `h_0`** (the `B`-side: near `t = 0` the local exponents are `1 − β_j`) and **`t → ∞` the cusp of `h_∞`** (the `A`-side); `t → 1` is the cusp of the pseudo-reflection `h_1`.  Hence for a tame prime, `v_p(t) > 0` reads `h_0`, `v_p(t) < 0` reads `h_∞`, `v_p(t − 1) > 0` reads `h_1` (5.9).  This is Roberts–Rodriguez-Villegas (13.1) ("`τ = ∞` if `k` is negative, and `τ = 0` if `k` is positive", `k = ord_p(t)`), and it is what the LMFDB's tame conductor exponents force: all 53 tame `(motive, p)` pairs of the degree-2 motives agree with it and 24 contradict the opposite reading, e.g. `A2.2_B1.1_t-3.1` at `p = 3` has `c_3 = 1`, `F_3 = 1 − T` (`h_0 = C(Φ_1²)⁻¹` gives `2 − 1`; `h_∞ = C(Φ_2²)` would give `2`). |
| Good, tame, wild | `p` is **wild** for `(A, B)` if `p` divides some element of `A ∪ B` (equivalently some `n` with `γ(n) ≠ 0`, equivalently the common denominator `N := lcm(A ∪ B)` of `α ∪ β`).  For `t ≠ 1`, `p` is **tame** for `(A, B, t)` if it is not wild and `v_p(t) ≠ 0` or `v_p(t − 1) > 0`; for `t = 1` no prime is tame.  **Good** means neither.  `H_q(α, β | ·)` at `q = p^f` is defined for every `p` not wild (4.7), and the trace `a_q(A, B; t)` for every good `p`. |
| Zigzag and Hodge vector | List the representatives in `(0, 1]` of `α` and `β` in increasing order (they are distinct).  Start at height `0`; at an `α` record the current height and step up by `1`; at a `β` step down by `1`.  `h_k :=` the number of `α`'s recorded at height `k`.  The heights recorded form an interval `[m, m + w]`; the **weight** is `w` and the **Hodge vector** is `(h_m, …, h_{m+w})`, written `(h^{0,w}, …, h^{w,0})` with `h^{p, w−p} := h_{m+p}`.  It is a palindrome (2.4), so the orientation is immaterial.  The LMFDB knowl `hgm.zigzagplot` is this procedure. |
| Type | **symplectic** if `w` is odd, **orthogonal** if `w` is even (knowl `hgm.type`; by 2.6 the LMFDB's extra clause "`d` even" is automatic for odd `w`). |
| Hodge normalisation | `δ(A, B) := (w + 1 − m_A − m_B)/2`, an integer by the parity law 2.5, `≥ 0`, and equal to `−m` (minus the least recorded height of the zigzag) when `1 ∉ A` (2.5).  The motive the LMFDB displays is Hodge-normalised (Hodge numbers `h^{p, w−p}` for `0 ≤ p ≤ w`), and its trace is `q^δ · H_q`; `H_q` alone is the trace of the Tate twist `H(A, B, t)(δ)`.  Acceptance (LMFDB data): `A2.2_B4` has `δ = 1`, and `A2.2_B4_t2.1` has `F_3(T) = 1 + 2T + 3T²`, `a_3 = −2 = 3 · H_3(1/2, 1/2; 1/4, 3/4 | 2)` with `H_3 = −2/3`.  `δ = 0` for `A2.2.2.2_B1.1.1.1`, `A4.2.2_B3.1.1` and every datum with `m_A + m_B = w + 1`; `δ = 2` for `A6.4.4.3_B12.2.2.2.1`.  Sage's `padic_H_value` carries the same factor (its `D = −min zigzag`, the same number). |
| Characters on `𝔽_q` | `𝔮 := q − 1`.  `ω : MulChar 𝔽_q ℂ` is a fixed character of order `𝔮` (a generator; exists by `exists_mulChar_orderOf_eq_card_units`), `ψ : AddChar 𝔽_q ℂ` a fixed nontrivial additive character, `g(m) := gaussSum (ω ^ m) ψ` for `m : ℤ`, and `ω(0) = 0` (Mathlib's convention), so `g(0) = −1`.  A parameter `a ∈ α` with `𝔮 • a = 0` in `ℚ/ℤ` has an integer `a𝔮 ∈ ℤ/𝔮`, and `ω^{a𝔮}` is well defined.  `H_q` does not depend on `ψ` (4.5), and changing `ω` to `ω^u` replaces `(α, β)` by `(uα, uβ)` (4.5), so for cyclotomic data it depends on nothing. |
| The four sums | `S_q(α, β | t) := (1/𝔮) ∑_{m ∈ ℤ/𝔮} ∏_i g(m + α_i𝔮) g(−m − β_i𝔮) · ω((−1)^d t)^m`; `H_q(α, β | t) := −∏_i (g(α_i𝔮) g(−β_i𝔮))^{-1} · S_q(α, β | t)`, which is Beukers–Cohen–Mellit Definition 1.1 since `−1/𝔮 = 1/(1 − q)`; Katz's `Hyp_q(α, β | t)` is the exponential sum over the torus `t x_1⋯x_d = y_1⋯y_d` of 4.2; Greene's `_{n+1}F_n` is Definition 3.10 of his paper, in his normalization.  **`H_q` is the one that enters the arithmetic layer.** |
| `H_q` for all good `q` | For a cyclotomic datum and `p ∤ N`, `H_q(α, β | t)` is **defined** by the gamma-vector form of Beukers–Cohen–Mellit Theorem 1.3 (4.7), which needs no congruence on `q`; when `q ≡ 1 (mod N)` it agrees with the definition through 4.3, and that agreement is the theorem, not the definition.  This is Beukers–Cohen–Mellit Assumption 1.4. |
| Frobenius polynomial | `F_p(T) := exp(−∑_{e ≥ 1} a_{p^e} T^e/e) ∈ ℚ[[T]]`, truncated to degree `d`: `frobeniusPolynomial := trunc (d + 1) frobeniusSeries`.  Under the purity hypothesis of 5.5 the series is already a polynomial of degree `d` and the truncation changes nothing; without it the truncation is a definition that assigns a polynomial of degree `≤ d` to every datum.  `F_p(0) = 1` always.  The Euler factor of the L-function at `p` is `F_p(p^{−s})^{-1}` (arithmetic normalization, weight `w`). |
| Conductor exponents | At a tame prime, `c_p := rank(h_τ^{|k|} − 1)` with `τ, k` as in the "Cusps and `t`" row (Roberts–Rodriguez-Villegas (13.1)), except at the cusp `1`, where `c_p := 1` unless the type is orthogonal and `v_p(t − 1)` is even, when `c_p := 0`.  At a wild prime the exponent is the Artin conductor of the realization and is not defined here. |
| Determinant discriminant | For orthogonal type: when exactly one of "`d` odd" and "`1 ∈ A`" holds, `Disc(A, B; t) := Π_B · (1 − t)` with `Π_B := ∏_{v ∈ B} disc(Φ_v)`; otherwise `Disc(A, B; t) := Π_A · t · (t − 1)` with `Π_A := ∏_{v ∈ A} disc(Φ_v)` (`t` the LMFDB's).  The **determinant character** `χ_Disc` is the quadratic character of `ℚ(√Disc(A,B;t))`, and at a good prime `p` the sign of the local functional equation is `ε_p = (−1)^d χ_Disc(p)` (5.5, 5.8).  This is Watkins's recipe as implemented in Sage's `HypergeometricData.sign` (whose `t` is the LMFDB's); its geometric part (which of `0`, `1`, `∞` ramify) is a theorem here (5.8) and its constants `Π_A`, `Π_B` are a cited recipe.  Acceptance: over the 131 good `(motive, p)` pairs of the LMFDB's orthogonal family `A4_B2.1`, `ε_p = (−1)^d χ_Disc(p)` holds in all; e.g. `A4_B2.1_t-8.1` has `F_5 = 1 − T²`, `ε_5 = −1`, and `Disc = −4 · 72`, `(−2/5) = −1`. |
| Archimedean shifts | From a Hodge vector `(h^{0,w}, …, h^{w,0})` and an integer `σ` (the signature, a parameter here): the complex shifts `ν` are `(w − 2p)/2` with multiplicity `h^{p, w−p}` for `0 ≤ p < w/2`, plus `0` with multiplicity `(h^{w/2,w/2} − |σ|)/2` when `w` is even; the real shifts `μ` are `|σ|` copies of `0` if `σ > 0` and `|σ|` copies of `1` if `σ ≤ 0`.  This is the LMFDB's `hodge.mu_nu` and Roberts–Rodriguez-Villegas (12.2). |

## What Mathlib supplies

- Gauss and Jacobi sums over a finite field, with values in any commutative ring, and the
  identities `g(χ) g(χ̄) = χ(−1) q`, `g(χ)^n = ∏ J`, Frobenius and complex-conjugation behaviour
  (`Mathlib/NumberTheory/GaussSum.lean`, `Mathlib/NumberTheory/JacobiSum/Basic.lean`).  Beukers–
  Cohen–Mellit Theorems 2.1 and 2.2 are these.
- Multiplicative characters as a group, existence of a character of exact order `q − 1`, additive
  characters of `𝔽_q` and of `ZMod n`, primitivity (`Mathlib/NumberTheory/MulChar/*`,
  `Mathlib/NumberTheory/LegendreSymbol/AddCharacter.lean`).
- Cyclotomic polynomials over any ring: degree `φ(n)`, roots, the product formula
  `∏_{d ∣ n} Φ_d = X^n − 1`, the Möbius inversion `Φ_n = ∏_{d ∣ n} (X^d − 1)^{μ(n/d)}`,
  irreducibility over `ℚ` (`Mathlib/RingTheory/Polynomial/Cyclotomic/*`).  Layer 1's gamma vector
  is the Möbius formula applied to a product.
- The rational circle `AddCircle (1 : ℚ)`, its representatives in `Ico`/`Ioc`, and the order of a
  rational point (`Mathlib/Topology/Instances/AddCircle/Defs.lean`).
- The Galois group of a cyclotomic field as `(ZMod n)ˣ` (`IsCyclotomicExtension.autEquivPow`,
  `IsCyclotomicExtension.Rat.galEquivZMod`), with Frobenius-compatibility lemmas.
- Resultants and Sylvester matrices with the product-of-root-differences formula
  (`Mathlib/RingTheory/Polynomial/Resultant/Basic.lean`); the Bézout matrix is not there and is
  built in 3.8.
- Characteristic polynomials of matrices, Hermitian and positive-definite matrices, eigenvalues of
  Hermitian matrices (`Matrix.charpoly`, `Matrix.IsHermitian`, `Matrix.PosDef`,
  `Matrix.IsHermitian.eigenvalues`), and `Algebra.leftMulMatrix` with `charpoly_leftMulMatrix`.
  Mathlib has no companion matrix; the classical arithmetic completion's 2.46 defines it and
  identifies it with `Algebra.leftMulMatrix` of the root of `AdjoinRoot f` in
  `AdjoinRoot.powerBasis'`.
- `Polynomial.Gal`, `NumberField.discr`, `PowerSeries.exp`, `PowerSeries.trunc`,
  `Polynomial.reverse`, `ArithmeticFunction.moebius`, `Nat.totient`.

Mathlib has no hypergeometric parameters, no Levelt matrices, no finite hypergeometric sum, no
Hasse–Davenport relation, no Bézout matrix, no zigzag, and no Euler factor built from traces.

## What Tau Ceti supplies

- `TauCeti.Geometry.Hodge.*`: pure Hodge structures `HodgeStructureOn W ω n` with
  `hodgeNumber` and `hodgeNumber_symm`.  Layer 2 states Fedorov's identification against this
  object in prose, and its own symmetry theorem 2.4 is the combinatorial shadow of
  `hodgeNumber_symm`.
- `TauCeti.NumberTheory.DirichletCharacter.GaussSum` and
  `TauCeti.NumberTheory.NumberField.Cyclotomic.GaussSum`: Galois action on Dirichlet Gauss sums
  inside a cyclotomic field; the finite-field analogue 4.4 follows the same pattern.
- `TauCeti.NumberTheory.Cyclotomic.Aut`: order and cyclicity of cyclotomic Galois groups.
- `TauCeti.NumberTheory.ArithmeticDirichletSeries.EulerProduct.Data`: `EulerProductData`, the
  Euler-product carrier that the L-functions roadmap fills from the Euler factors of Layer 5.
- `TauCeti.NumberTheory.Chebotarev.GaloisCharacter.Cyclotomic.Basic`: the cyclotomic Artin map
  and the Galois character weight, the vocabulary for 4.4's Frobenius statement.
- `TauCeti.AlgebraicGeometry.EllipticCurve.PointCount`: `WeierstrassCurve.pointCount`, the
  projective point count of a Weierstrass equation over a finite field, in which 6.1 states its
  count.
- Tau Ceti's `Probability/Distributions/Hypergeometric` and
  `Analysis/SpecialFunctions/RegularizedHypergeometric` share the word and nothing else; neither
  is consumed.

Tau Ceti has no hypergeometric motive, no hypergeometric data, no finite hypergeometric sum and no
Bézout matrix.

## What is missing (build here)

The carriers and the cyclotomic dictionary with the gamma vector, `M`, the `p`-parts, the rotation
number and the duality; the zigzag with its degree, weight, Hodge vector and the four
combinatorial laws; the cyclic-vector conjugacy and the rank formula for companion matrices, the
Levelt triple, Levelt's theorem over any field with the companion normal form, the invariant
Hermitian form with the Beukers–Heckman signature count, the finiteness criterion, the Bézout
matrix, determinant and module, imprimitivity and the primitive datum, and the reduction modulo
`ℓ`; the four finite hypergeometric sums with their comparisons, their independence of the
characters, their Galois action, the rationality and integrality theorems, the gamma-vector form
at every good prime power, the shift and swap identities; the Frobenius traces, series and
polynomials, the purity hypothesis and its consequences, the determinant discriminant and its
geometric part, the tame conductor exponents, the archimedean shifts, the Newton–Hodge comparison,
the mod-`ℓ` Frobenius order; and the point-count theorems for the Legendre and cubic families.

---

## Layer 1: hypergeometric data

The carriers, in both forms, and everything the family page of the LMFDB displays that is a
function of `(A, B)` without a zigzag or a matrix.

### 1.1 Parameter pairs

Define `HypergeometricParameters` as the structure with fields `α β : Multiset (AddCircle (1 : ℚ))`,
`card_eq : Multiset.card α = Multiset.card β` and `disjoint : ∀ a, a ∈ α → a ∉ β`.  Define
`degree := Multiset.card α` and the representative map `rep : AddCircle (1 : ℚ) → ℚ` with values in
`(0, 1]` through `AddCircle.equivIoc (1 : ℚ) 0`.  Prove `rep` is injective, `((rep x : ℚ) : AddCircle 1) = x`,
and that `rep` sends the class of `0` to `1`.  Define the **swap** `(α, β) ↦ (β, α)`, the
**negation** `(α, β) ↦ (−α, −β)`, the **shift** by `μ ∈ ℚ/ℤ`, `(α, β) ↦ (α + μ, β + μ)` (a bijection
preserving disjointness), and the **scaling** by `u ∈ ℤ` coprime to the common denominator,
`(α, β) ↦ (uα, uβ)`; prove each is an involution or an action as appropriate and preserves the
degree.  Define the **common denominator** `N` as the least `n > 0` with `n • a = 0` for all
`a ∈ α ∪ β` (the lcm of the additive orders, `addOrderOf_coe_rat`).

*Prerequisites:* Mathlib `AddCircle`, `AddCircle.equivIoc`, `addOrderOf_coe_rat`, `Multiset`.

### 1.2 Cyclotomic data

Define `CyclotomicData` with fields `A B : Multiset ℕ`, `pos : ∀ n ∈ A + B, 0 < n`,
`disjoint : ∀ a, a ∈ A → a ∉ B`, `degree_eq : (A.map Nat.totient).sum = (B.map Nat.totient).sum`.
Define `degree := (A.map Nat.totient).sum`, the **cyclotomic polynomials**
`Φ_A := ∏_{a ∈ A} Polynomial.cyclotomic a ℤ`, `Φ_B`, and the **defining rational function**
`Q := Φ_A / Φ_B` in `RatFunc ℚ`.  Prove `natDegree Φ_A = natDegree Φ_B = d`, that `Φ_A` and
`Φ_B` are monic, coprime over `ℚ` (distinct cyclotomic polynomials are coprime; `disjoint` is
exactly what this needs), and that `Φ_A(0) = (−1)^{m_A}` with `m_A :=` the multiplicity of `1`
in `A` (`Φ_1(0) = −1`, `Φ_n(0) = 1` for `n ≥ 2`).  Define `m_A`, `m_B`; prove `m_A m_B = 0`.

*Prerequisites:* Mathlib `Polynomial.cyclotomic`, `natDegree_cyclotomic`, `cyclotomic.monic`,
`cyclotomic_coeff_zero`, `Nat.totient`.

### 1.3 The dictionary

Define `toParameters : CyclotomicData → HypergeometricParameters` with
`α := A.bind (fun a ↦ (Finset.filter (Nat.Coprime a) (Finset.Icc 1 a)).val.map (fun k ↦ ((k : ℚ)/a : AddCircle 1)))`
and likewise `β`; prove the cardinalities are `d` (the count of `k ∈ [1, a]` coprime to `a` is
`φ(a)`), disjointness (a class `k/a` in lowest terms determines `a`), and that the multiset of
representatives of `α` is the multiset of arguments of the roots of `Φ_A`, i.e.
`Φ_A = ∏_{x ∈ α} (X − e(x))` over `ℂ` with `e(x) = exp(2πi · rep x)`
(`cyclotomic_eq_prod_X_sub_primitiveRoots`).  Define `IsGaloisStable (α, β) := ∀ u, Nat.Coprime u N → uα = α ∧ uβ = β`
and prove: `toParameters D` is Galois stable; conversely a Galois-stable pair is `toParameters D`
for a unique `D` (collect the classes by additive order; the orbit of a class of order `a` under
`(ℤ/a)ˣ` is the full set of classes of order `a`).  Prove the common denominator of
`toParameters D` is `lcm (A ∪ B)`.  Prove `toParameters` is injective and respects swap.

*Prerequisites:* 1.1, 1.2; Mathlib `Nat.totient_eq_card_coprime`,
`cyclotomic_eq_prod_X_sub_primitiveRoots`, `IsPrimitiveRoot`; the orbit statement is
`IsPrimitiveRoot.pow_of_coprime` and its converse.

### 1.4 The gamma vector and `M`

Define `gamma D : ℕ → ℤ`, `gamma D n := ∑_{a ∈ A, n ∣ a} μ(a/n) − ∑_{b ∈ B, n ∣ b} μ(b/n)` (`0` at
`n = 0`), prove it is finitely supported (support in the divisors of elements of `A ∪ B`), and
prove the **defining identity** `Φ_A · ∏_{γ(n) < 0} (X^n − 1)^{−γ(n)} = Φ_B · ∏_{γ(n) > 0} (X^n − 1)^{γ(n)}`
in `ℤ[X]` from `cyclotomic_eq_prod_X_pow_sub_one_pow_moebius`, and the uniqueness: any finitely
supported `g : ℕ → ℤ` with that identity equals `gamma D` (the polynomials `X^n − 1` are
multiplicatively independent in `ℚ(X)ˣ/ℚˣ`, by comparing multiplicities of primitive roots of
unity).  Define `gammaMultiset D : Multiset ℤ` (`n` with multiplicity `γ(n)`, `−n` with
multiplicity `−γ(n)`), prove its sum is `0` and that it has no entry `0`, and prove
`∑_{γ(n) > 0} n γ(n) = ∑_{γ(n) < 0} n (−γ(n))` (compare degrees).  Define `r D`, `s D` as the
numbers of positive and of negative entries, and `M D := ∏_n (n : ℚ)^{n · γ(n)}`, a positive
rational; prove `M (swap D) = M D⁻¹`.  Prove the Pochhammer identity of Beukers–Cohen–Mellit §1,
`∏_i (α_i)_n / ∏_j (β_j)_n = M^{−n} ∏ (p_j n)! / ∏ (q_j n)!`, as a statement about
`ascPochhammer ℚ n` evaluated at the representatives.

*Prerequisites:* 1.2, 1.3; Mathlib `cyclotomic_eq_prod_X_pow_sub_one_pow_moebius`,
`ArithmeticFunction.moebius`, `ascPochhammer`, `Nat.factorial`.  Acceptance: `A = [2,2,2,2]`,
`B = [1,1,1,1]` has `γ(2) = 4`, `γ(1) = −8`, multiset `[−1^8, 2^4]`, `M = 256`; `A = [30]`,
`B = [5,3,2,1]` has multiset `[−15, −10, −6, 1, 30]` and `M = 30^{30}/(15^{15} 10^{10} 6^6) = 1007769600000`.

### 1.5 Reciprocity and the two parities

Prove `Polynomial.reverse Φ_A = Φ_A` (every `Φ_n` with `n ≥ 2` is palindromic and `Φ_1` is
anti-palindromic; the sign is `(−1)^{m_A}`, and `reverse` of the product carries it — state the
exact identity `X^d Φ_A(1/X) = (−1)^{m_A} Φ_A(X)` and deduce that the multiset `α(A)` is stable
under negation).  Prove the two **parity laws** that the LMFDB's type field relies on, in their
combinatorial form, in Layer 2; here prove only their algebraic inputs:
`Φ_A(1) = ∏_{a ∈ A, a ≥ 2} Φ_a(1)` is `0` exactly when `1 ∈ A`, and `Φ_a(1) = p` if `a` is a
power of the prime `p` and `1` otherwise (`Polynomial.eval_one_cyclotomic_prime_pow`,
`eval_one_cyclotomic_not_prime_pow`).

*Prerequisites:* 1.2; Mathlib `Polynomial.reverse`, `Polynomial.eval_one_cyclotomic_prime_pow`,
`Polynomial.eval_one_cyclotomic_not_prime_pow`.

### 1.6 Wild primes and the common denominator

Define `wildPrimes D : Finset ℕ` as the set of primes dividing some element of `A ∪ B`.  Prove the
three characterizations: `p` wild ⟺ `p ∣ lcm (A ∪ B)` ⟺ `p ∣ n` for some `n` with
`gamma D n ≠ 0` ⟺ some `a ∈ α ∪ β` has additive order divisible by `p`.  Prove that for `p` not
wild, `p` is a unit modulo every `a ∈ A ∪ B`, so that `q = p^f ≡ 1 (mod N)` for `f` the order of
`p` in `(ℤ/N)ˣ`.

*Prerequisites:* 1.2, 1.3, 1.4.

### 1.7 The `p`-parts and prime-to-`p` parts

For a prime `p`, write each `u ∈ A ∪ B` as `u = p^s v` with `p ∤ v`.  Define the multisets
`A' := A.bind (u ↦ φ(v) copies of p^s)`, `B'` likewise, and `A_p`, `B_p`, `C_p` by removing from
`A'` and `B'` the largest common sub-multiset (`C_p := A' ⊓ B'`, `A_p := A' − C_p`,
`B_p := B' − C_p`).  Define `A^p`, `B^p` the same way from `u ↦ φ(p^s)` copies of `v`.  Prove:
`(A_p, B_p)` is again a cyclotomic datum (disjoint by construction, equal totient sums since
`φ(p^s v) = φ(p^s) φ(v)`), as is `(A^p, B^p)`; that `α(A_p) ∪ β(B_p)` consists of the `p`-power
order classes of `α ∪ β` with the common ones cancelled; and that `p` is not wild for
`(A^p, B^p)`.  These are the LMFDB knowls `hgm.defining_parameter_ppart` and
`hgm.defining_parameter_primetoppart`.  Acceptance: `A = [18,12]`, `B = [8,3,2,1,1,1]` has
`A_2 = [4,4,2,2,2,2,2]`, `B_2 = [8,1,1,1,1,1]`, `C_2 = [2]`, `A_3 = [9,3]`, `B_3 = [1^8]`,
`C_3 = [3]`, `A^2 = [9,3]`, `B^2 = [1^8]`.

*Prerequisites:* 1.2; Mathlib `Nat.totient_mul` (coprime), `Nat.factorization`.

### 1.8 The rotation number

Define `rotationNumber (α, β) := Nat.card {ρ : AddCircle 1 // ρ + α = α ∧ ρ + β = β}` (the
stabilizer of the pair under translation, a finite subgroup of the torsion of `ℚ/ℤ`).  Prove it
is finite and divides `N`.  For a cyclotomic datum prove **`rotationNumber = gcd` of the gamma
multiset** (`ρ` of order `r` stabilizes both multisets iff `Φ_A` and `Φ_B` are polynomials in
`X^r` iff `Q(X) = Q_1(X^r)` for a rational function `Q_1` iff `r ∣ n` for every `n` with
`γ(n) ≠ 0`).  This is the LMFDB knowl `hgm.rotation_number`.  Acceptance: `A = [4]`, `B = [2,1]`
has `γ = [−2, −2, 4]` and rotation number `2` (translation by `1/2` fixes `{1/4, 3/4}` and
`{1/2, 1}`, although `1 ∈ B`); every family whose gamma multiset contains `±1`, such as
`A2.2.2.2_B1.1.1.1`, has rotation number `1`.

*Prerequisites:* 1.1, 1.3, 1.4.

### 1.9 The primitive datum

For a cyclotomic datum with rotation number `r`, define `primitiveData D` as the cyclotomic datum
with gamma function `n ↦ γ(rn)` (so its gamma multiset is `γ/r`), prove it is a cyclotomic datum
(1.4's uniqueness in reverse: the product `∏ (X^n − 1)^{γ(rn)}` is a quotient of products of
cyclotomic polynomials with disjoint index sets), that its rotation number is `1`, that its degree
is `d/r`, and that `Q_D(X) = Q_{primitiveData D}(X^r)`.  Call `D` **primitive** when `r = 1`.
The relation between the finite sums of `D` and of `primitiveData D` is Layer 4's Kummer-pullback identity.

*Prerequisites:* 1.4, 1.8.

### 1.10 Interlacing

Define `Interlace (α, β)` : between any two consecutive representatives of `α` in `(0, 1]` lies
exactly one representative of `β`, and cyclically (equivalently, in the sorted list of all `2d`
representatives the colours alternate).  Prove it is invariant under shift and under negation,
and that for a cyclotomic datum it is invariant under scaling by units (so "interlace" and
"interlace after every Galois conjugation" coincide for cyclotomic data, which is why
Beukers–Heckman Theorem 4.8 needs the conjugates and the LMFDB does not).

*Prerequisites:* 1.1, 1.3.

### 1.11 Specialization points and the three cusps

Specialization points are rational numbers `t ≠ 0`; the hypothesis `t ≠ 0` is carried by the
theorems that need it and no subtype is introduced.  Define, for a prime `p`, the **cusp of `t` at
`p`**: `0`-cusp if `v_p(t) > 0`, `∞`-cusp if `v_p(t) < 0`, `1`-cusp if `v_p(t) = 0` and
`v_p(t − 1) > 0`, and none otherwise; prove the cases are exclusive and exhaustive.  Define
`IsTame D t p`, `IsGood D t p` by the pinned conventions, prove good/tame/wild partition the
primes for `t ≠ 1`, and that for `t = 1` the primes are exactly good or wild.

*Prerequisites:* 1.6; Mathlib `padicValRat`.

### 1.12 The duality `(A, B, t) ↔ (B, A, 1/t)` at the level of data

Prove the first half of the statement that makes the LMFDB's label normalisation a convention
rather than a choice of object: `swap D` has gamma vector `−γ` and gamma multiset `−γ`, `M^{-1}`
(1.4), the same wild primes (1.6), the same degree and common denominator (1.3), the same rotation
number, and primitive datum `swap (primitiveData D)` (1.8, 1.9), and interlaces iff `D` does
(1.10); and the cusps of `t` and `1/t` at `p` are exchanged between `0` and `∞` and fixed at `1`,
so that `p` is good (tame, wild) for `(D, t)` iff it is good (tame, wild) for `(swap D, 1/t)`
(1.11).  The second half, that weight, Hodge vector, Frobenius traces, Frobenius polynomials and
tame conductor exponents agree, is collected in Layer 5 after those objects are defined.  The
normal form the LMFDB picks is not stated here.

*Prerequisites:* 1.3, 1.4, 1.6, 1.8, 1.9, 1.10, 1.11.

## Layer 2: the zigzag, weight and Hodge vector

Pure combinatorics of the representatives.  The meaning of the numbers — that they are the Hodge
numbers of the family — is Fedorov's theorem (Fedorov, *Variations of Hodge structures for
hypergeometric differential operators and parabolic Higgs bundles*, Theorem 1), cited; the LMFDB
displays them for every family and motive, so they must be defined without it.

### 2.1 The height function

For `(α, β)` define the sorted list `L` of the `2d` representatives with their colours
(`Multiset.sort` on `rep`; distinctness is `disjoint`), and the height `ht : Fin (2d + 1) → ℤ`,
`ht 0 = 0`, `ht (i+1) = ht i + 1` if `L i` is an `α` and `ht i − 1` if a `β`.  Define
`Z(x) := #{a ∈ α : rep a ≤ x} − #{b ∈ β : rep b ≤ x}` for `x : ℚ` and prove `ht (i+1) = Z(L i)`,
so that the height at which `α_i` is recorded is `Z(rep α_i) − 1`.  Prove `ht (2d) = 0`.

*Prerequisites:* 1.1; Mathlib `Multiset.sort`, `List.foldl`.

### 2.2 Degree, weight and the Hodge vector

Define `recordedHeights := (α.map (fun a ↦ Z(rep a) − 1))`, `minHeight`, `maxHeight`,
`weight := maxHeight − minHeight` (a natural number), and
`hodgeNumber p := Multiset.count (minHeight + p) recordedHeights` for `p : ℕ`, and
`hodgeVector : List ℕ := (List.range (weight + 1)).map hodgeNumber`.  Prove the recorded heights
fill the interval (`hodgeNumber p > 0` for `p ≤ weight`: between two recorded heights every
intermediate height is recorded, since each step is `±1` and an upward step is a recording),
that `∑_{p ≤ w} hodgeNumber p = d`, and that `hodgeVector` is invariant under shift of the pair
(a cyclic rotation of `L` changes all heights by a constant).  Acceptance: `A = [10,6,3,2]`,
`B = [14,1,1,1]` gives `d = 9`, `w = 4`, `(1,2,3,2,1)`; `A = [2,2,2,2]`, `B = [1,1,1,1]` gives
`(1,1,1,1)`, `w = 3`; `A = [30]`, `B = [5,3,2,1]` gives `(8)`, `w = 0`; `A = [18,12]`,
`B = [8,3,2,1,1,1]` gives `(2,6,2)`, `w = 2`.

*Prerequisites:* 2.1.

### 2.3 Agreement with the sorted-height formula

Prove Sage's and Magma's form of the same numbers: `weight = max Z − min Z − 1` where `Z` ranges
over `Z(rep x)` for `x ∈ α ∪ β` together with the value `0`, and that the multiset of recorded
heights equals the multiset `{Z(rep a) − 1 : a ∈ α}`.  This is a definitional unfolding; it is a
milestone because two implementations of the zigzag exist and the LMFDB's `web_family.zigzag`
and Sage's `hodge_numbers` differ by exactly the shift of 2.2's last clause (Sage places the class
of `0` at `0`, the LMFDB at `1`).

*Prerequisites:* 2.2.

### 2.4 Symmetry of the Hodge vector

For a cyclotomic datum (more generally a pair stable under negation, 1.5) prove
`hodgeNumber p = hodgeNumber (weight − p)`: negation reverses the sorted list `L` (except for the
fixed classes `0 = 1` and `1/2`, which are their own negatives and stay in place as the ends of
the reversal), and reading the zigzag backwards negates all heights up to the constant of 2.2.
This is the combinatorial form of `TauCeti.Hodge.HodgeStructureOn.hodgeNumber_symm`, and it is
what makes the pinned orientation `h^{p,w−p} := h_{m+p}` immaterial.

*Prerequisites:* 1.5, 2.2.

### 2.5 The first parity law

For a cyclotomic datum prove `weight` is even ⟺ `m_A + m_B` is odd (equivalently, the number of
copies of `1` in `A ∪ B` is odd).  Proof shape: by 1.5 the multiset of representatives in
`(0, 1)` is symmetric under `x ↦ 1 − x`, with the classes `1/2` and `1` fixed; the heights at
the two ends of the symmetric part are determined by the count of fixed classes, and the parity of
`w` is the parity of the total displacement between them.  The law needs `d > 0` (the empty
datum has `w = 0` and `m_A + m_B = 0`).  Acceptance: all `1593` cyclotomic data of degree `≤ 6`
taken up to swap (`3186` ordered pairs).  Its meaning: `h_1` is a reflection (`det h_1 = −1`,
Layer 3) exactly in the orthogonal case.

Consequently `w + 1 − m_A − m_B` is even; define the **Hodge-normalisation exponent**
`hodgeTwist D := δ(A, B) := (w + 1 − m_A − m_B)/2`, the power of `q` by which 5.1 multiplies the
finite sums.  Prove `2δ + m_A + m_B = w + 1` (for `d > 0`), `δ(swap D) = δ(D)`, and `δ = −m` (minus
the least recorded height of 2.2) when `1 ∉ A`; hence `δ ≥ 0`, since by the swap it suffices to
take `1 ∉ A`, and then the least height of the walk of 2.1 is attained just before an `α` step, so
it is a recorded height, and it is `≤ ht 0 = 0`.  Acceptance: `δ = 0` for `A2.2.2.2_B1.1.1.1` and
`A30_B5.3.2.1`, `δ = 1` for `A2.2_B4` and `A10.6.3.2_B14.1.1.1`, `δ = 2` for
`A6.4.4.3_B12.2.2.2.1`; `δ = −m` (for `1 ∉ A`) and `δ ≥ 0` hold on all `5192` ordered data of
degree `≤ 7`.

*Prerequisites:* 1.2, 1.5, 2.1, 2.2.

### 2.6 The second parity law and the type

Prove that if `weight` is odd then `d` is even (same symmetry: an odd weight forces the fixed
classes to contribute an even displacement), and define
`type D := if Even weight then orthogonal else symplectic`.  Prove `type (swap D) = type D` and
that the LMFDB's rule "symplectic iff `w` odd and `d` even" agrees.  Acceptance: the same `1593`
data.

*Prerequisites:* 2.2, 2.5.

### 2.7 Swap, shift and scaling

Prove `hodgeVector (swap (α, β)) = reverse (hodgeVector (α, β))` and `weight (swap) = weight`:
swapping colours negates the walk, and since the walk is closed, the up-steps from height `h` are
as many as the down-steps from `h + 1`, so the recorded heights of the new `α`'s (the old `β`'s)
are `−(h + 1)` for the old recorded heights `h`.  For a pair stable under negation (every cyclotomic
datum) 2.4 turns this into `hodgeVector (swap (α, β)) = hodgeVector (α, β)`; in general the
reversal is real: `α = {1/10, 1/5, 1/2}`, `β = {3/10, 3/5, 7/10}` has Hodge vector `(1, 2)` and its
swap `(2, 1)`.  For a cyclotomic datum prove also invariance under scaling by units (the datum is
fixed).

*Prerequisites:* 2.2, 2.4.

### 2.8 Interlacing and weight zero

Prove `weight = 0 ⟺ Interlace (α, β)`: every `α` is recorded at the same height iff the colours
alternate.  With Beukers–Heckman Theorem 4.8 (Layer 3) this says the monodromy group of a cyclotomic
datum is finite exactly when the weight is `0`, which is the LMFDB's reading of its weight-`0`
families (its knowl `hgm.monodromy` cites Beukers–Heckman for them).

*Prerequisites:* 1.10, 2.2.

### 2.9 The Hodge polygon and the special Hodge vector

Define `hodgePolygon : List (ℕ × ℕ)` as the lower convex hull of the multiset of slopes
`{p with multiplicity h^{p,w−p}}`, i.e. the vertices `(∑_{p < k} h^{p,w−p}, ∑_{p < k} p h^{p,w−p})`;
prove it is convex and ends at `(d, wd/2)` (by 2.4).  Define the **special Hodge vector** at `t = 1`
as the LMFDB knowl `hgm.hodge_vector` states it: for even `w` decrease `h^{w/2,w/2}` by `1`, for odd
`w` decrease the two middle numbers by `1`; prove its sum is `d − 1` or `d − 2`.  That it is the
Hodge vector of `H(A, B, 1)` is Roberts–Rodriguez-Villegas §9, cited.

*Prerequisites:* 2.2, 2.4, 2.6.

## Layer 3: monodromy

The hypergeometric group, as Beukers–Heckman define it: the matrix group generated by two
companion matrices.  Over `ℂ` for general parameters, with integer entries for cyclotomic data.
No differential equation appears; Levelt's theorem is a theorem about triples of matrices.

### 3.1 Companion matrices

The companion matrix `C(f) := Polynomial.companion f` of a monic `f ∈ R[X]` of degree `d`, over a
commutative ring `R`, is the classical arithmetic completion's 2.46 (`C(f)_{i+1,i} = 1`,
`C(f)_{i,d−1} = −coeff f i`, `0` elsewhere), with `det C(f) = (−1)^d f(0)` (`det_companion`),
minimal polynomial `f` over a field (`minpoly_companion`) and `charpoly C(f) = f` (2.60); none of
these is restated here.  Prove that `C(f)` is cyclic (the first basis vector generates `R^d` as
an `R[C(f)]`-module: under 2.46's `leftMulMatrix_root_eq_companion` it is the class of `1` in
`R[X]/(f)`), and that over a field `K` a matrix `g` with `charpoly g = f` and a cyclic vector is
conjugate to `C(f)`, so two matrices with the same characteristic polynomial, each with a cyclic
vector, are conjugate.  Prove the
**rank formula** `rank (C(f) − λ) = d − 1` if `f(λ) = 0` and `d` otherwise, and more
generally `rank (C(f) ^ k − 1) = d − #{distinct roots ζ of f over K̄ with ζ^k = 1}` for
`k ≥ 1` over an algebraically closed field of characteristic `0` (a cyclic matrix has one Jordan
block per eigenvalue, and `J_ζ^k − 1` has rank one less than its size when `ζ^k = 1` because `k ≠ 0`
in `K`).  Both hypotheses are needed: over `𝔽_2`, `C(X² + 1)` squares to `1`, so the
rank at `k = 2` is `0`, not `1`; at `k = 0` the left side is `0`.  The rank formula is the input of
the tame conductor exponents of Layer 5, which apply it over `ℂ`.  `Suggested.lean` writes `C(f)`
as `companionMatrix hf hd`, Mathlib's `Algebra.leftMulMatrix` of the root of `AdjoinRoot f` in
`AdjoinRoot.powerBasis'` reindexed to `Fin d`, which 2.46's `leftMulMatrix_root_eq_companion`
identifies with `Polynomial.companion f`.

*Prerequisites:* `ClassicalArithmeticCompletion` 2.46, 2.60; Mathlib `Matrix.charpoly`,
`Matrix.rank`, `Algebra.leftMulMatrix`, `AdjoinRoot.powerBasis'`.  `LinearMap.IsCyclic` is not in
Mathlib: state cyclicity as `Submodule.span R (range (fun k ↦ C(f)^k e₀)) = ⊤`.

### 3.2 The Levelt triple

For `(α, β)` define `q_∞ := ∏_{a ∈ α} (X − e(a))`, `q_0 := ∏_{b ∈ β} (X − e(b))` in `ℂ[X]`,
`h_∞ := C(q_∞)`, `h_0 := C(q_0)^{-1}`, `h_1 := h_∞^{-1} h_0^{-1}`, and the
**hypergeometric group** `Γ(α, β) := Subgroup.closure {h_∞, h_0} ≤ GL_d(ℂ)`.  Prove
`h_∞ h_1 h_0 = 1`, that `h_1 − 1` has rank `1` (`C(q_∞)` and `C(q_0)` differ only in
their last column), that `h_∞` has eigenvalues `e(α)` and `h_0` eigenvalues `e(−β)` with
multiplicity, and that `det h_∞ = e(∑α)`, `det h_0 = e(−∑β)`, `det h_1 = e(∑β − ∑α)` (from
2.46's `det_companion` and `q_∞(0) = (−1)^d e(∑α)`; for `α = {1/2}`, `h_∞ = (−1)`).  For a cyclotomic datum define the same triple over `ℤ` with
`q_∞ = Φ_A`, `q_0 = Φ_B` (1.3 identifies the roots), prove `h_0 ∈ GL_d(ℤ)` (`Φ_B(0) = ±1`), that
the complex triple is the base change of the integral one, and that `charpoly h_0 = Φ_B` (1.5).

*Prerequisites:* 1.3, 1.5, 3.1; `ClassicalArithmeticCompletion` 2.46, 2.60; Mathlib
`Matrix.GeneralLinearGroup`.

### 3.3 Determinants of the Levelt triple for cyclotomic data

Prove `det h_∞ = (−1)^{d + m_A}`, `det h_0 = (−1)^{d + m_B}`, `det h_1 = (−1)^{m_A + m_B}` (from
3.2 and `Φ_A(0) = (−1)^{m_A}`).  With 2.5: `h_1` is a reflection in the orthogonal case and a
transvection in the symplectic case.  This is the geometric content of the determinant character
of Layer 5: the quadratic character of `ℚ(t)` cut out by `det` of the monodromy ramifies at the cusp
of `h_∞` (LMFDB `t = ∞`) iff `d + m_A` is odd, at the cusp of `h_0` (`t = 0`) iff `d + m_B` is
odd, and at `t = 1` iff `m_A + m_B` is odd.

*Prerequisites:* 1.2, 2.5, 3.2.

### 3.4 Levelt's theorem

State and prove Levelt's theorem over an arbitrary field `K` (Beukers–Heckman Theorem 3.5 and
Proposition 3.3, stated there over `ℂ`; Levelt, *Hypergeometric functions*, thesis, 1961; the
field form is Qian Lemma 3.4).  Let `p, q ∈ K[X]` be monic of degree `d ≥ 1` with no common root
in an algebraic closure `K̄`.

- (i) **Rigidity**: if `g_∞, g_1, g_0 ∈ GL_d(K)` satisfy `g_∞ g_1 g_0 = 1`, `charpoly g_∞ = p`,
  `charpoly g_0^{-1} = q` and `rank (g_1 − 1) ≤ 1`, then there is `c ∈ GL_d(K)`, unique up to
  `Kˣ`, with `g_∞ = c C(p) c^{-1}` and `g_0 = c C(q)^{-1} c^{-1}`, hence
  `g_1 = c C(p)^{-1} C(q) c^{-1}`.
- (ii) **Irreducibility**: `⟨C(p), C(q)⟩` acts irreducibly on `K̄^d`.
- (iii) **Converse**: if `p` and `q` have a common root in `K̄`, then `⟨C(p), C(q)⟩` stabilizes a
  nonzero proper subspace of `K̄^d`.
- (iv) **Companion normal form**: if `p ≠ q` and `p(0) ≠ 0`, then `C(q) − C(p)` is nonzero and
  supported on the last column, so `C(p)^{-1} C(q)` fixes `e_1, …, e_{d−1}`, `C(q) C(p)^{-1}`
  fixes `e_2, …, e_d` (as `C(p)^{-1} e_{i+1} = e_i` for `i < d`), and each differs from `1` by a
  matrix of rank one.  With (i): a triple with `g_0 g_1 g_∞ = 1`, the order of Qian Lemma 3.4,
  and the remaining hypotheses of (i) is simultaneously conjugate to
  `(C(q)^{-1}, C(q) C(p)^{-1}, C(p))`, since `g_0 g_1 g_0^{-1} = g_∞^{-1} g_0^{-1}` satisfies (i).

The proof is linear algebra over `K`.  Put `X = g_∞` and `Y = g_0^{-1}`, so `X − Y = (1 − g_1) X`
has rank at most one and `W = ker (X − Y)` has codimension at most one; pick `e ≠ 0` in
`W ∩ X^{-1}W ∩ ⋯ ∩ X^{-(d−2)}W`.  If `e, Xe, …, X^{d−1}e` were dependent, the span `U` of
`e, …, X^{m−1}e` at the first dependence would be `X`-stable and inside `W`, so `X = Y` on `U` and
the two would share an eigenvalue over `K̄`.  So they form a basis, in which `X = C(p)` and
`Y = C(q)` (both shift the first `d − 1` vectors; 3.1's cyclic-vector conjugacy).  Uniqueness up
to `Kˣ` is (ii) with Schur's lemma.  The Levelt triple of 3.2 is the case `K = ℂ`, `p = q_∞`,
`q = q_0`, where the disjointness of `α` and `β` is that of the roots `e(α)` and `e(β)`; for a
cyclotomic datum the integral triple is the case `K = ℚ`, `p = Φ_A`, `q = Φ_B` (coprime by 1.2).

*Prerequisites:* 1.2, 3.1, 3.2; `ClassicalArithmeticCompletion` 2.46, 2.60.

### 3.5 The invariant Hermitian form

Prove Beukers–Heckman Theorem 4.3 in the form needed: for `(α, β)` with representatives in `ℝ/ℤ`
(always, here) the group `Γ(α, β)` preserves a nondegenerate Hermitian form
`F : Matrix (Fin d) (Fin d) ℂ`, `F.IsHermitian`, `hᴴ F h = F` for `h ∈ Γ`, unique up to a real
scalar (by 3.4 (ii) and Schur).  Construct `F` explicitly in the cyclic basis of 3.4 (the
construction in Beukers–Heckman §4 through the coefficients of `q_∞`, `q_0`).  For a cyclotomic
datum prove that the form can be taken with entries in `ℚ(ζ_N)`, and real symmetric when the type
is orthogonal, alternating when symplectic (3.3 with the eigenvalue structure of `h_1`): this is
the statement behind the LMFDB's "orthogonal/symplectic type".

The definition, which `Suggested.lean` does not state: the **invariant form** `invariantForm (α, β)`
is a `d × d` complex matrix `F`, in the standard basis of `ℂ^d` on which the Levelt matrices
`h_∞ = C(q_∞)` and `h_0 = C(q_0)^{-1}` of 3.2 act on column vectors, such that `F` is Hermitian
(`Fᴴ = F`, with `ᴴ` the conjugate transpose), `hᴴ F h = F` for `h = h_∞` and `h = h_0` (hence
for every `h ∈ Γ(α, β)`), and `det F ≠ 0`.  Such an `F` exists and is unique up to a nonzero real
factor; the target fixes the factor by the Beukers–Heckman construction.  Every statement that
reads `F` (its signature `(p, q)` up to order, its definiteness) is invariant under that factor,
and 3.6 and 3.7 read only those.

**Checks.**

- (computation) — `α = {1/2}`, `β = {0}` (`A = [2]`, `B = [1]`, `d = 1`): `h_∞ = (−1)` and
  `h_0 = (1)`, so `Γ = {±1}` and `F` is a nonzero real `1 × 1` matrix, definite.
- (computation) — `A2.2_B1.1` (`α = (1/2, 1/2)`, `β = (1, 1)`): the count of 3.6 gives
  `|p − q| = |(−1)^{1+2} + (−1)^{2+2}| = 0`, so `F` has signature `(1, 1)`; for
  `A2.2.2.2_B1.1.1.1` it gives `0` again and signature `(2, 2)`.  Neither is definite, as 3.7
  requires of the infinite monodromy of these weight-`1` and weight-`3` families.
- (computation) — `A30_B5.3.2.1` (`w = 0`, interlacing, finite monodromy): `F` is definite,
  `F.PosDef` or `(−F).PosDef` in Mathlib's sense (Corollary 4.7, read through 2.8).
- (rejection) — the zero matrix is Hermitian and satisfies `hᴴ 0 h = 0` for every `h`; the clause
  `det F ≠ 0` is what excludes it.
- (Mathlib comparison) — Hermitian means Mathlib's `Matrix.IsHermitian`, definite means
  `Matrix.PosDef` of `F` or of `−F`, and the signature is read off
  `Matrix.IsHermitian.eigenvalues`; no Mathlib declaration constructs `F`.

*Prerequisites:* 3.2, 3.3, 3.4; Mathlib `Matrix.IsHermitian`, `Matrix.conjTranspose`.

### 3.6 The signature count

Prove Beukers–Heckman Theorem 4.5 and Corollary 4.7: with the representatives of `α` sorted
`α_1 ≤ ⋯ ≤ α_d` in `[0, 1)` and `m_j := #{k : β_k < α_j}`, the signature `(p, q)` of `F`
satisfies `|p − q| = |∑_{j=1}^d (−1)^{j + m_j}|`; in particular `F` is definite iff `(α, β)`
interlace.  Define `bhSignatureDefect (α, β) := |∑_j (−1)^{j+m_j}|` as the combinatorial
invariant and prove its invariance under shift and under negation.  `Suggested.lean` states
`bhSignatureDefect` and its shift invariance; the signature identity and the definiteness
criterion read the form of 3.5, which it does not state, and are specified here only.  ⚠ This is the unsigned
Hermitian-form invariant of the monodromy group; it is not the LMFDB's signed `sig`, which is a
Hodge-theoretic invariant of the real structure at `t` and is not owned (see *Not owned here*).

*Prerequisites:* 3.5.

### 3.7 The Beukers–Heckman finiteness criterion

Prove Beukers–Heckman Theorem 4.8: for `α, β ⊂ ℚ/ℤ` disjoint with common denominator `N`,
`Γ(α, β)` is finite iff for every `u` coprime to `N` the scaled pair `(uα, uβ)` interlaces.
(⇐: each Galois conjugate of the form of 3.5 is definite by 3.6, so the group, which has entries
in `ℤ[ζ_N]` after conjugation by 3.4, is discrete in a compact group; ⇒: a finite group
preserves a definite form, and 3.6 applied to each conjugate forces interlacing.)  For a
cyclotomic datum conclude with 1.10 and 2.8: **`Γ(A, B)` is finite iff `weight = 0`**.  The
classification of the finite hypergeometric groups (Beukers–Heckman Theorem 7.1 and Table 8.3:
the imprimitive families and the finitely many primitive ones, with Weyl groups of `F₄`, `E₆`,
`E₇`, `E₈` among them) is cited and is not a target; the LMFDB's weight-`0` families are instances
of this list, named on their pages by their monodromy group, and 2.8 with this milestone decides
membership without the list.

*Prerequisites:* 1.3, 1.10, 2.8, 3.4, 3.5, 3.6.

### 3.8 The Bézout matrix

For `f, g ∈ R[X]` of degree `≤ d` define `bezout f g d : Matrix (Fin d) (Fin d) R` by
`∑_{i,j} b_{ij} X^i Y^j = (f(X) g(Y) − f(Y) g(X)) / (X − Y)` in `R[X, Y]`, equivalently
`b_{ij} = ∑_{k=0}^{min(i,j)} (f_{i+j+1−k} g_k − f_k g_{i+j+1−k})`; take the second as the
definition and prove the first as a polynomial identity.  Prove symmetry `b_{ij} = b_{ji}`,
antisymmetry in `(f, g)`, bilinearity, and `det (bezout f g d) = (−1)^{d(d−1)/2} resultant f g`
for `f, g` of degree exactly `d` (Mathlib's `Polynomial.resultant`), hence `≠ 0` for coprime
`f, g` over a field.  Define `bezoutMatrix D := bezout Φ_A Φ_B d`, `bezoutDeterminant D` and the
**Bézout module** `ℤ^d / bezoutMatrix D · ℤ^d`; prove the module is finite of order
`|bezoutDeterminant D|` (nonzero by 1.2's coprimality) and record its invariant factors as the
LMFDB's `bezout_module` (Smith normal form; Mathlib has it for PIDs).  Acceptance:
`A = [6,4,4,4,3]`, `B = [10,2,2,2,2,2,2]`, `d = 10`: determinant `−191102976 = −2^{18} 3^6`,
module `C_2^2 × C_{16}^2 × C_{432}^2`.

*Prerequisites:* 1.2; Mathlib `Polynomial.resultant`, `Submodule.smithNormalForm` (the
invariant factors of a submodule of a free module over a PID).

### 3.9 Imprimitivity

Define a subgroup `Γ ≤ GL_d(ℂ)` to be **imprimitive** if there is a decomposition
`ℂ^d = V_1 ⊕ ⋯ ⊕ V_k`, `k ≥ 2`, into nonzero subspaces permuted by `Γ` (the nonzero clause is what
keeps `V = (ℂ^d, 0)` out).  Prove: if `rotationNumber (α, β) = r > 1` then `Γ(α, β)` is
imprimitive with `k = r`: by 1.8, `q_∞` and `q_0` are polynomials in `X^r`, so in the cyclic model
`ℂ[X]/(q_∞)` of 3.4 the subspaces `V_i := span {X^j : j ≡ i (mod r)}`, `0 ≤ i < r`, are each
nonzero and are permuted cyclically by both companion matrices.
Beukers–Heckman Theorem 5.8, the converse for interlacing-free data, is cited; the LMFDB's
`imprim` column is the rotation number of 1.8 and is read through this milestone.

*Prerequisites:* 1.8, 3.2, 3.4.

### 3.10 Reduction modulo `ℓ`

For a cyclotomic datum and a prime `ℓ`, define `Γ_ℓ(A, B) ≤ GL_d(ZMod ℓ)` as the image of the
integral `Γ(A, B)` (3.2), i.e. the subgroup generated by the reductions of `h_∞, h_0`.  Prove it is
generated by the reductions of the companion matrices of `Φ_A mod ℓ` and `Φ_B mod ℓ`, that it
preserves the reduction modulo `ℓ` of the Bézout form of 3.8 whenever the integral group does,
and that the `p`-parts of 1.7 at `p = ℓ` describe the characteristic polynomials of `h_∞, h_0`
modulo `ℓ` (`Φ_{p^s v} ≡ Φ_v^{φ(p^s)} (mod p)`, Mathlib `cyclotomic_prime_pow_mul`-type lemmas in
`Mathlib/RingTheory/Polynomial/Cyclotomic/Expand.lean`).  The LMFDB's monodromy table (index,
subimage, image) names this group; the identifications are not owned here.

*Prerequisites:* 1.7, 3.2, 3.8; Mathlib `Polynomial.cyclotomic_expand_eq_cyclotomic`,
`Matrix.map`.

## Layer 4: finite hypergeometric sums

Everything is over a finite field `F` with `q` elements and `𝔮 = q − 1`, with the characters of
the pinned conventions.  Sums are complex-valued; where a smaller ring is needed (rationality,
integrality) the values are shown to lie in it.

### 4.1 Admissible parameters and integer parameter vectors

Define `IsAdmissible q (α, β) := ∀ x ∈ α + β, (q − 1) • x = 0` and the integer vectors
`a := α.map (fun x ↦ (𝔮 · rep x : ℤ))`, `b` likewise, elements of `Multiset (ZMod 𝔮)` after
reduction; prove `a` and `b` are disjoint in `ZMod 𝔮` and that for a cyclotomic datum
admissibility is `N ∣ q − 1`.  State everything in this layer for `a, b : Multiset (ZMod 𝔮)`
disjoint of equal cardinality, with the parameter pair entering through this map; this is how the
Lean file is organised, since `ω ^ (m : ZMod 𝔮)` is the natural object.

*Prerequisites:* 1.1, 1.3, 1.6.

### 4.2 Katz's exponential sum

Define `katzExpSum ω ψ a b t := ∑_{(x, y) ∈ F^d × F^d, t ∏ x_i = ∏ y_j} ψ(∑ x_i − ∑ y_j) ∏ ω^{a_i}(x_i) ∏ ω^{−b_j}(y_j)`
for `t ∈ Fˣ` (Katz, *Exponential sums and differential equations*, 8.2.7, in Beukers–Cohen–Mellit
§3's notation).  Prove it is an algebraic integer in `ℚ(ζ_p, ζ_𝔮)`; its comparison with the sum
`S_q` is 4.3.

*Prerequisites:* 4.1; Mathlib `gaussSum`, character orthogonality (`MulChar.sum_eq_zero_of_ne_one`,
`AddChar.sum_eq_zero_of_ne_one`).

### 4.3 The sums `S_q` and `H_q`

Define `g m := gaussSum (ω ^ m) ψ` for `m : ZMod 𝔮`,
`katzSum ω ψ a b t := 𝔮⁻¹ ∑_{m : ZMod 𝔮} (∏_i g (m + a_i) · g (−m − b_i)) · ω((−1)^d t)^m` (`S_q`), and
`hypergeometricSum ω ψ a b t := −(∏_i g a_i · g (−b_i))⁻¹ · katzSum ω ψ a b t` (`H_q`), for
`t ∈ F` (the summand at `t = 0` is `ω(0)^m`, which is `0` for `m ≠ 0` and `1` for `m = 0` in
Mathlib's convention; record `H_q(a, b | 0)` as the single `m = 0` term and never use it).  Prove
the Gauss-sum products in the normalising factor are nonzero: for `m ≠ 0` in `ZMod 𝔮`,
`g(m) g(−m) = ω(−1)^m q` (`gaussSum_mul_gaussSum_eq_card`, `ω^m` being nontrivial), and for
`m = 0` (the class `0` in `α` or in `β`) `g(0) = −1`; so `H_q` is a well-defined complex number, and prove Beukers–Cohen–Mellit (3.1) as the definitional unfolding.
Prove `H_q(a, b | t) = (1/(1 − q)) ∑_m ∏_i (g(m + a_i) g(−m − b_i))/(g(a_i) g(−b_i)) · ω((−1)^d t)^m`,
Definition 1.1 verbatim.  Prove Beukers–Cohen–Mellit Proposition 3.1:
`katzExpSum (a, b | t) = ω(−1)^{∑ b} · S_q(a, b | t)` for `t ∈ Fˣ` (Fourier inversion on `Fˣ`, their Proposition 2.6, which
is `MulChar.sum_eq_zero`-style orthogonality), so that `S_q` and `H_q` are algebraic integers up to
the normalising factor.

*Prerequisites:* 4.1, 4.2; Mathlib `gaussSum`, `gaussSum_mul_gaussSum_eq_card`, `gaussSum_one_one`.

### 4.4 Dependence on the characters and the Galois action

Prove: (i) `H_q` does not depend on `ψ` (`gaussSum_mulShift_eq`: replacing `ψ` by `ψ(c ·)`
multiplies `g(m)` by `ω^{−m}(c)`, and the exponents cancel factor by factor); (ii) replacing `ω`
by `ω^u` for `u ∈ (ZMod 𝔮)ˣ` gives `H_{ω^u}(a, b | t) = H_ω(u a, u b | t)` (reindex `m ↦ um`);
(iii) for `σ ∈ Gal(ℚ(ζ_p, ζ_𝔮)/ℚ)` acting by `ζ_p ↦ ζ_p^c`, `ζ_𝔮 ↦ ζ_𝔮^u`,
`σ(H_q(a, b | t)) = H_q(u a, u b | t)`, by (i) and (ii) (the model is Tau Ceti's
`map_gaussSumOfPrimitiveRoot`); (iv) complex conjugation gives `H_q(−a, −b | t)` with
`star_gaussSum_eq`.  Over `𝔽_p` with `ζ_𝔮 ↦ ζ_𝔮^p` being the Frobenius of 
[Chebotarev](../Chebotarev/README.md) Layer 4, this is also `H_q(pa, pb | t)`.

*Prerequisites:* 4.3; Mathlib `gaussSum_mulShift_eq`, `star_gaussSum_eq`, `gaussSum_frob`,
`MulChar.ringHomComp`; Tau Ceti `map_gaussSumOfPrimitiveRoot` as the pattern.

### 4.5 Rationality for cyclotomic data

For a cyclotomic datum with `N ∣ q − 1` prove `H_q(α(A), β(B) | t) ∈ ℚ` for every `t ∈ F`, and
that it does not depend on the choice of `ω`: by 1.3 the pair is Galois stable, so 4.4 (ii)–(iii)
show every Galois conjugate equals the sum itself.  Prove `H_q(α, β | t) ∈ ℚ` more generally when
`(α, β)` is Galois stable.  Define `hypergeometricSumRat D F t : ℚ` as the rational number so
obtained for a cyclotomic datum (and likewise for Galois-stable pairs): the rational number whose
image in `ℂ` is the sum of 4.3 for some generator `ω` and primitive `ψ`, which `Suggested.lean`
writes through `Classical.epsilon`.  Prove it agrees with the complex sum under the embedding for
every generator `ω` and primitive `ψ` (`hypergeometricSumRat_spec`).

*Prerequisites:* 1.3, 4.4.

### 4.6 Shift and swap

Prove Beukers–Cohen–Mellit Theorem 3.4 with the sign their statement drops: for `μ ∈ ZMod 𝔮`,
`ω((−1)^d t)^μ S_q(a + μ, b + μ | t) = S_q(a, b | t)` (reindex `m ↦ m − μ`; the character factor
of `S_q` is `ω((−1)^d t)^m`, so the printed `ω(t)^μ` is wrong when `dμ` is odd: over `𝔽_5`,
`a = {0}`, `b = {2}`, `μ = 1`, `t = 2`), with the corresponding identity for `H_q` carrying the ratio
of normalising factors; and Theorem 3.5:
`S_q(a, b | t) = S_q(−b, −a | 1/t)` for `t ∈ Fˣ` (reindex `m ↦ −m`), hence
`H_q(a, b | t) = H_q(−b, −a | 1/t)`.  For a pair stable under negation (every cyclotomic datum,
1.5) this reads **`H_q(α, β | t) = H_q(β, α | 1/t)`**, the identity that makes the pinned trace
convention and the LMFDB's label duality (1.12) consistent.

*Prerequisites:* 4.3, 1.5.

### 4.7 The gamma-vector form at every good prime power

For a cyclotomic datum and a prime power `q = p^f` with `p` not wild, define the
**gamma-vector sum**
`H_q^γ(A, B | t) := ((−1)^{r+s}/(1 − q)) ∑_{m : ZMod 𝔮} q^{−s(0) + s(m)} ∏_{γ(n) > 0} g(n m)^{γ(n)} ∏_{γ(n) < 0} g(−n m)^{−γ(n)} · ω(ε M^{-1} t)^m`
with `ε := (−1)^{∑_{γ(n)<0} (−n γ(n))}` and `s(m) :=` the multiplicity of `ζ_𝔮^m` as a root of
`D(X) := gcd(∏_{γ(n)>0} (X^n − 1)^{γ(n)}, ∏_{γ(n)<0} (X^n − 1)^{−γ(n)})`, and prove
Beukers–Cohen–Mellit **Theorem 1.3**: when `N ∣ q − 1`, `H_q^γ(A, B | t) = H_q(α(A), β(B) | t)`.
The proof is the Hasse–Davenport product relation applied to each `∏_{j} g(m + j𝔮/n)/g(j𝔮/n)`
(consumed from `CharacterSumsOverFiniteFields`), the evaluation `g(n) g(−n) = ω(−1)^n q` for
`n ≠ 0` and `g(0) g(0) = 1`, and the bookkeeping of the common roots `D(X)`; it is the proof on
pp. 11–12 of the paper.  Prove `H_q^γ(A, B | t) ∈ ℚ` for every `p ∤ N` (the Galois argument of
4.4–4.5 applies to the gamma form verbatim, with no congruence on `q`), and that
`s(0) = min(r, s)` (the multiplicity of `1` as a root of `∏_{γ(n)>0} (X^n − 1)^{γ(n)}` is `r`, of
the other product `s`, and `D(X)` takes the minimum).  **From here on `H_q(A, B | t)` means
`H_q^γ` for every `p ∤ N`**; its rational value is `frobeniusSum D F t`, the rational number whose
image in `ℂ` is the gamma form for some generator `ω` and primitive `ψ` (written through
`Classical.epsilon`), identified with the complex gamma form for every such choice by
`frobeniusSum_spec`.

*Prerequisites:* 1.4, 1.6, 4.3, 4.5; `CharacterSumsOverFiniteFields` 3.4 (Hasse–Davenport product
relation); Mathlib `gaussSum_mul_gaussSum_eq_card`, `Polynomial.rootMultiplicity`.

### 4.8 The Landau function and the algebraic-integrality bound

Define the Landau function `λ(α, β, x) := ∑_i ({x + α_i} − {α_i} + {−x − β_i} − {−β_i})` on
`[0, 1]` and `λ(α, β) := −min_{gcd(k, N) = 1, x} λ(kα, kβ, x)`, and prove Beukers–Cohen–Mellit
Theorem 3.3: `q^{λ} H_q(α, β | t)` is an algebraic integer.  The proof is the digit-sum valuation
of Gauss sums, which is the
[classical arithmetic completion](../ClassicalArithmeticCompletion/README.md)'s **7.12**
(`v_𝔓̃(g(ω^{−a})) = s(a)`), summed over the `d` factors and minimised over the Galois conjugates.
For a cyclotomic datum the minimum over `k` is attained at `k = 1` (the pair is Galois stable,
1.3), and prove **`λ(α(A), β(B)) = δ(A, B)`**, the exponent of 2.5: `λ(α, β, x)` is a step function
of `x` (the `d` slopes `+1` and `d` slopes `−1` cancel), constant between consecutive points of
`{−α_i} ∪ {−β_j}` in `ℚ/ℤ`, so both sides are read off the sorted representatives.  Acceptance: on all
`5192` ordered cyclotomic data of degree `≤ 7`, `λ = δ`; for `A2.2_B4`, `λ(α, β, x)` takes the
values `0, 1, −1, 0` on `[0, 1/4), [1/4, 1/2), [1/2, 3/4), [3/4, 1)`, so `λ = 1 = δ`.

*Prerequisites:* 2.1, 2.5, 4.3, 4.4; `ClassicalArithmeticCompletion` 7.12.

### 4.9 Integrality for cyclotomic data

For a cyclotomic datum and every `q = p^f` with `p ∤ N`, prove **`q^δ H_q(A, B | t) ∈ ℤ`**, with
`δ = δ(A, B)` of 2.5, for every `t ∈ Fˣ` (at `t = 0` the sum is the single term `1/(1 − q)`).
`H_q` is rational by 4.7, so it suffices to show:

- *at `p`*: each summand `q^{−s(0)+s(m)} ∏ g(nm)^{γ(n)} ∏ g(−nm)^{−γ(n)}` of the gamma form has
  `v_p ≥ −f δ`.  By 7.12 its valuation (with `v_p(p) = 1`, at a prime above `p`) is
  `∑_{i<f} V(p^i m/𝔮)` with `V(x) := s(x) − s(0) + ∑_{γ(n)>0} γ(n) {nx} + ∑_{γ(n)<0} (−γ(n)) {−nx}`,
  `s(x)` the multiplicity of `e(x)` as a root of `D(X)` (constant on the orbit `x ↦ px`), and
  `min_{x ∈ ℚ/ℤ} V(x) = −δ` (the Landau identity of 4.8 read through the gamma vector; at the other
  primes above `p`, `x` is replaced by `kx` with `k` a unit, which leaves the minimum unchanged, and
  the opposite normalisation of the Teichmüller character gives the `V` of `swap D`, which has the
  same `δ`; checked on all `5192`
  ordered data of degree `≤ 7` for every `x` of denominator `≤ 60`, the minimum `−δ` being attained
  in every case);
- *away from `p`*: write `q^{s(m)−s(0)} = 1 + (q^{s(m)−s(0)} − 1)`; since `s(m) ≤ s(0)`, the second
  term is `(1 − q)` times an element of `ℤ[1/q]`, and
  `∑_m ∏ g(nm)^{γ(n)} ∏ g(−nm)^{−γ(n)} ω(u)^m = (q − 1) · T(u)` with
  `T(u) = ∑_{u ∏ x_j^{p_j} = ε ∏ y_k^{q_k}} ψ(∑ x_j − ∑ y_k)` (sum over `x ∈ (Fˣ)^r`,
  `y ∈ (Fˣ)^s`) an algebraic integer, by the Fourier inversion of 4.3 (Beukers–Cohen–Mellit
  Proposition 2.6).  So the denominator `1 − q` of the gamma form cancels.

This is sharp (`A2.2_B4`, `δ = 1`: `H_3(· | 2) = −2/3`) and implies Beukers–Cohen–Mellit
Theorem 4.2, `q^{min(r,s) − λ'} H_q ∈ ℤ` with `λ' := min (∑_{γ(n)>0} γ(n) {nx} + ∑_{γ(n)<0} (−γ(n)) {−nx})`,
because `δ ≤ min(r, s) − λ'`.  ⚠ In Theorem 4.2 the minimum must be taken over `x ∈ (0, 1)`, not
`[0, 1]` as printed (the sum is `0` at `x = 0`); over `(0, 1)` it is an integer `≥ 1` exactly when the
rotation number is `1` (`A4_B2.1` has `λ' = 0`, at `x = 1/2`).  Acceptance: for `A = [2,2,2,2]`,
`B = [1,1,1,1]` (`δ = 0`) the values `H_5(· | 2) = 12`, `H_7(· | 2) = −16`, `H_5(· | −1) = −4` are
integers; for `A6.4.4.3_B12.2.2.2.1` (`δ = 2`), `H_7(· | 2) = −6/49`.

*Prerequisites:* 2.5, 4.3, 4.7, 4.8.

### 4.10 The swap at the level of traces

Combine 4.6 and 4.7: for a cyclotomic datum, `H_q(A, B | t) = H_q(B, A | 1/t)` for every `p ∤ N`
and `t ∈ Fˣ` (the gamma form of `swap D` has `γ ↦ −γ`, `M ↦ M^{-1}`, `ε ↦ ε'` with
`ε ε' = (−1)^{∑ n|γ(n)|} = 1` by 1.4's degree identity).

*Prerequisites:* 1.4, 1.12, 4.6, 4.7.

### 4.11 Imprimitive data: the Kummer pullback at the level of sums

For `D` with rotation number `r` and primitive datum `D'` (1.9) prove `M_D = M_{D'}^r`,
`ε_D = ε_{D'}^r`, `r_D = r_{D'}`, `s_D = s_{D'}` and `s_D(m) = s_{D'}(rm)` (the polynomial `D(X)`
of 4.7 for `D` is that of `D'` evaluated at `X^r`), so that the summand of the gamma form of `D`
at `m` is the summand of `D'` at `rm` with `ω(ε_{D'} M_{D'}^{-1})^{rm} ω(t)^m` in place of the
character factor.  Deduce, for `p ∤ N`, `r ∣ q − 1` and `t ∈ Fˣ`, the **Kummer pullback identity**
`H_q(D | t) = ∑_{c ∈ F, c^r = t} H_q(D' | c)`; in particular `H_q(D | t) = 0` when `t` is not an
`r`-th power in `F`.  (The fibre of `m ↦ rm` over `m'` contributes `∑_{j < r} ω(t)^{j𝔮/r}`, which
is `r` if `t` is an `r`-th power and `0` otherwise; on the right the `r`-th roots `c` of `t`
contribute the same factor through `∑_{ζ^r = 1} ω(ζ)^{m'}`.)  This is Katz's Kummer-pullback
relation (*Exponential sums and differential equations*, 8.2.1 and §5.6) at the level of sums.
Acceptance: `A = [9]`, `B = [3,3,1,1]` (`γ = [−3,−3,−3,9]`, `r = 3`, `D' = ([3],[1,1])`) at
`q = 19`, and `A = [4]`, `B = [2,1]` (`D' = ([2],[1])`) at `q ∈ {5, 13}`, for every `t ∈ Fˣ`.

*Prerequisites:* 1.4, 1.9, 4.7.

### 4.12 Greene's function and the comparison

Define Greene's binomial coefficient `greeneBinom A B := B(−1)/q · jacobiSum A B⁻¹` (Greene
Definition 2.4) and his `greeneF`,
`_{n+1}F_n(A_0, …, A_n; B_1, …, B_n | x) := (q/(q−1)) ∑_χ greeneBinom (A_0 χ) χ ∏_{i=1}^n greeneBinom (A_i χ) (B_i χ) · χ(x)`
(Definition 3.10), for characters of `F`.  Prove Greene's Theorem 3.6 (`₂F₁` as a sum over `y`)
and Theorem 3.13 (the inductive integral representation).  Prove the comparison with 4.3 in the
form Beukers–Cohen–Mellit state on p. 10: with `A_i := ω^{a_i}` for the `d = n + 1` entries of `a`
and `B_j := ω^{b_j}` for the `n` nonzero entries of `b` (so `0 ∈ b` with multiplicity exactly `1`),
`_{n+1}F_n(A; B | x) = c · q^{1−d} · (∏_i g(a_i − b_i))^{−1} · S_q(a, b | x)` for `x ∈ Fˣ` and a
sign `c = c(a, b) ∈ {±1}`, under the layer's standing disjointness of `a` and `b` (here: no `a_i`
is `0` or a `b_j`); both hypotheses are needed (at `x = 0` the left side vanishes and the right
does not, and over `𝔽_7` with `a = (1, 3)`, `b = (0, 3)` the ratio at `x = 2` is not `±1`).  In the
disjoint cases tried (`q ∈ {5, 7, 11, 13}`, `n = 1`) `c = −1`.  **Determine `c`** (the sign is the one point Beukers–Cohen–Mellit leave
as `±`; the milestone is the identity with `c` made explicit as a function of `a`, `b` and `q`,
proved from `jacobiSum_eq_gaussSum_mul_gaussSum_div_gaussSum`).  With it, every identity of
Greene's §4 transports to `H_q`.

*Prerequisites:* 4.3; Mathlib `jacobiSum`, `jacobiSum_eq_gaussSum_mul_gaussSum_div_gaussSum`,
`jacobiSum_comm`.

## Layer 5: Frobenius traces, Euler factors and bad primes

The arithmetic layer.  Its definitions are unconditional; its theorems split into those proved
from Layer 4 and those that are implications from the purity hypothesis 5.5, which Katz's theorem
(Layer 6) supplies for the realization and which nothing here asserts.

### 5.1 The Frobenius trace

For a cyclotomic datum `D`, a specialization point `t`, and `q = p^f` with `p` good for
`(D, t)`, define `frobeniusTrace D t q := q^δ · H_q(A, B | (t : F_q))` through 4.7, with
`δ = hodgeTwist D` of 2.5 (the image of `t` in `F_q` is a unit `≠ 1` because `p` is good).  This is
the pinned `a_q(A, B; t)`.  Prove it is an integer (4.9), that
`frobeniusTrace (swap D) (1/t) q = frobeniusTrace D t q` (4.10 and `δ(swap D) = δ(D)`), and the
acceptance values, all LMFDB data: `frobeniusTrace ([2,2,2,2],[1,1,1,1]) (−1) 5 = −4` and
`… 7 = 0` (`A2.2.2.2_B1.1.1.1_t-1.1`); `frobeniusTrace ([2,2],[1,1]) 2 5 = −2` and
`frobeniusTrace ([2,2],[1,1]) (1/2) 5 = 2` (`A2.2_B1.1_t2.1`, `A2.2_B1.1_t1.2`: these two pin `t`
against `1/t`); `frobeniusTrace ([2,2],[4]) 2 3 = −2` (`A2.2_B4_t2.1`, `δ = 1`: this one pins the
power of `q`).

*Prerequisites:* 1.11, 2.5, 4.7, 4.9, 4.10.

### 5.2 Frobenius series and polynomial

Define `frobeniusSeries D t p := PowerSeries.exp applied to −∑_{e ≥ 1} frobeniusTrace D t (p^e) · T^e / e`,
an element of `ℚ[[T]]` with constant term `1` (Roberts–Rodriguez-Villegas (11.1)), and
`frobeniusPolynomial D t p := PowerSeries.trunc (d + 1) (frobeniusSeries D t p) ∈ ℚ[T]`.  Prove
`coeff 1 = −a_p`, `coeff 0 = 1`, `natDegree ≤ d`, and the Newton identity relating the first `k`
coefficients to the first `k` traces (`coeff k` is the complete-homogeneous expression in the
traces, Mathlib's `MvPolynomial.psum`/Newton identities `Multiset.esymm`–`psum` relation).  Define
the **Euler factor** at `p` as `frobeniusPolynomial D t p` evaluated at `p^{−s}`, and the
**arithmetic Dirichlet coefficients** `a_n` by the multiplicative expansion of
`∏_p frobeniusPolynomial(p^{−s})^{-1}` over good primes, as a `Nat.ArithmeticFunction ℚ`
(`ArithmeticFunction.IsMultiplicative`, with `a_{p^e}` from the series `1/F_p`).

*Prerequisites:* 5.1; Mathlib `PowerSeries.exp`, `PowerSeries.trunc`, `Multiset.esymm`,
`ArithmeticFunction`.

### 5.3 Good, tame and wild for the motive page

Prove the LMFDB knowl `hgm.good_prime`'s partition for `(D, t)` (1.11) and that
`frobeniusTrace` is defined at exactly the good prime powers; define `IsBad D t p` as "tame or
wild", prove the set of bad primes is finite for `t ≠ 0` and contains the wild primes of `D` and
the primes dividing the numerator or denominator of `t` or `t − 1`.

*Prerequisites:* 1.6, 1.11, 5.1.

### 5.4 Newton and Hodge polygons; ordinary

Define `newtonPolygonFn D t p : ℕ → ℝ` as the lower convex hull of
`{(k, v_p(coeff k (frobeniusPolynomial D t p))) : coeff k ≠ 0}`, evaluated at the integers
`0 ≤ k ≤ d` (the supremum of the supporting lines), and
`IsOrdinary D t p := ∀ k ≤ d, newtonPolygonFn D t p k = hodgePolygonFn D k` (2.9), the LMFDB
family page's "Ordinary?" column.  Prove `newtonPolygonFn D t p 0 = 0` (the constant term is
`1`).  That the Newton polygon lies on or above the Hodge polygon is Mazur's theorem for the
realization and is cited, not a target.

*Prerequisites:* 2.9, 5.2; Mathlib `padicValRat`.

### 5.5 The purity hypothesis and its consequences

Define `IsPure D t p` : there is a multiset `Λ` of `d` complex numbers, each of absolute value
`p^{w/2}`, with `frobeniusTrace D t (p^e) = ∑_{λ ∈ Λ} λ^e` for every `e ≥ 1`.  Phrase the
elements of `Λ` as Weil `p`-numbers of weight `w` in the sense of
[`DeligneWeightsAndPurity`](../DeligneWeightsAndPurity/README.md) 0.1 (in prose; the Lean form
carries the absolute-value condition directly).  Prove, **assuming `IsPure D t p`**: (i)
`frobeniusSeries = ∏_{λ ∈ Λ} (1 − λT)`, a polynomial of degree exactly `d`, so
`frobeniusPolynomial` is it; (ii) the `λ ∈ Λ` are algebraic integers, because their power sums
`frobeniusTrace D t (p^e)` are integers (5.1) (an `ℓ`-adic pole of `∑_e (∑_λ λ^e) T^e =
∑_λ λT/(1 − λT)` inside the unit disc would contradict integral coefficients), so the coefficients
of `frobeniusPolynomial` are rational algebraic integers and `frobeniusPolynomial ∈ ℤ[T]`; (iii) `|coeff k| ≤ C(d, k) p^{kw/2}`; (iv) `Λ` is determined
by `D, t, p`; (v) `coeff d = ±p^{wd/2}` (a rational integer of absolute value `p^{wd/2}`), so the
Newton polygon of 5.4 has the endpoints `(0, 0)` and `(d, wd/2)` of the Hodge polygon (2.9).  Assuming in addition the **self-duality** `Λ = {p^w/λ : λ ∈ Λ}`, prove the **local
functional equation** `p^{wd/2} T^d F_p(1/(p^w T)) = ε_p F_p(T)`, i.e.
`coeff (d − k) = ε_p · coeff k · p^{(d − 2k) w/2}`, with `ε_p := (−1)^d ∏ λ / p^{wd/2} ∈ {±1}`
(Roberts–Rodriguez-Villegas §11, "Poincaré duality"; the factor `(−1)^d` makes `coeff d = ε_p p^{wd/2}`,
and for an elliptic curve `F_p = 1 − a_p T + pT²` gives `ε_p = 1`).  When `w` is odd (so `d` is even
by 2.6) and no `λ ∈ Λ` has `λ² = p^w`, prove `ε_p = 1`: `Λ` splits into pairs `{λ, p^w/λ}`.  The
proviso is needed: `Λ = {√p, −√p}` (`w = 1`, `d = 2`) is pure and self-dual, with `F_p = 1 − pT²`
and `ε_p = −1`.  For the realization `ε_p = 1` whenever `w` is odd, because its Poincaré pairing is
alternating; that is cited (6.4).  These
implications are what the LMFDB's displayed `F_p(T)` relies on; the hypothesis itself is Katz's
theorem and Deligne's purity for the realization, stated in Layer 6.

*Prerequisites:* 2.6, 2.9, 5.1, 5.2, 5.4; Mathlib `Multiset.prod_X_sub_C_coeff`, the norm on `ℂ`.

### 5.6 Acceptance Euler factors

Prove, as instances of 5.1–5.2 with the traces computed from 4.7 (a finite computation in each
case, `decide`-style over `F_q` for `q ≤ 7^4` or by the `p`-adic method, which is not required),
that for `D = ([2,2,2,2],[1,1,1,1])`, `t = −1` (the LMFDB motive `A2.2.2.2_B1.1.1.1_t-1.1`):
`frobeniusPolynomial D t 3 = 1 + 6T² + 729T⁴`,
`frobeniusPolynomial D t 5 = 1 + 4T − 130T² + 500T³ + 15625T⁴` and
`frobeniusPolynomial D t 7 = 1 + 238T² + 117649T⁴`, as the LMFDB stores them; and that for
`D = ([6,4,4,3],[12,2,2,2,1])` (`δ = 2`), `t = 2`, `p = 7`: the first five coefficients are
`1, 6, −315, −104370, 643468` (`= 1, 6, −45·7, −2130·7², 268·7⁴`), the polynomial the LMFDB family
page displays at `p = 7` (its test suite's `test_good_euler`); `frobeniusTrace D 2 7 = 7² ·
H_7(· | 2) = 7² · (−6/49) = −6`.  (The degree-`8` factor's full form,
`… − 250592370T⁵ − 1815912315T⁶ + 83047723206T⁷ + 7^{16} T⁸`, follows from 5.5 under the
hypothesis; the unconditional target is the first half.)

*Prerequisites:* 4.7, 5.1, 5.2.

### 5.7 The archimedean shifts

Define `archimedeanShifts (h : List ℕ) (σ : ℤ) : Multiset ℚ × Multiset ℚ` by the pinned
conventions (`μ`, `ν`), prove `card μ + 2 · card ν = d` when `h` is a Hodge vector of weight `w` with `|σ| ≤ h^{w/2,w/2}`,
`σ ≡ h^{w/2,w/2} (mod 2)` for even `w` and `σ = 0` for odd `w`, and that the gamma factor
`∏ Γ_ℝ(s + μ_i) ∏ Γ_ℂ(s + ν_j)` is Roberts–Rodriguez-Villegas (12.2) under the duplication formula.
`σ` is a parameter of this milestone; the L-functions roadmap's card takes `(μ, ν)`, the
conductor and the Euler factors, and the signature it needs is the realization's (not owned here).

*Prerequisites:* 2.2, 2.9.

### 5.8 The determinant discriminant and its geometric part

Define `determinantDiscriminant D t : ℚ` by the pinned recipe (`Disc(A, B; t)`) and
`determinantCharacter D t` as the quadratic Dirichlet character `kroneckerChar Δ` of the
[theta-series roadmap](../ThetaSeries/README.md) 2H, with `Δ` the discriminant of
`ℚ(√Disc(A, B; t))`: `Δ = d₀` if the squarefree integer part `d₀` of `Disc` is `≡ 1 (mod 4)` and
`Δ = 4d₀` otherwise (`Δ = 1` if `d₀ = 1`), since 2H defines `kroneckerChar Δ` only for
`Δ ≡ 0, 1 (mod 4)`; at an odd prime `p ∤ Δ` its value is `kroneckerSym d₀ p = (d₀ / p)`.  Prove the
**geometric part**: in the orthogonal case, the degree in `t` of the recipe's polynomial is
`≡ d + m_A`, `t − 1` occurs to an odd power (`m_A + m_B` is odd by 2.5), and `t` occurs to the
power `≡ d + m_B (mod 2)`, i.e. the recipe's ramification at `∞`, `1`, `0` is `det h_∞, det h_1,
det h_0` of 3.3 (for `1 ∉ A`: `d` odd gives `1 − t` and `d` even gives `t(t − 1)`; for `1 ∈ A` the
two are exchanged).  State, as the cited content: under 5.5 with self-duality and `w` even,
`ε_p = (−1)^d · determinantCharacter D t (p)` at good `p` (Watkins; `(−1)^d ε_p p^{wd/2}` is the
determinant of Frobenius on the realization), and the LMFDB's `det` field `χ_{d_0 f(t)} ⊗ ℚ(−wd/2)`
is this character twisted by the Tate twist.  Acceptance: the 131 orthogonal good pairs of the
pinned-conventions row, and, from complete traces at `q = p, …, p^d`, the sign of `coeff d` on every
orthogonal datum of degree `≤ 3`, its swap, `p ∈ {5, 7, 11, 13}` and five values of `t` (612 cases).
The constants `Π_A`, `Π_B` are not derived here.

*Prerequisites:* 1.2, 2.5, 3.3, 5.5; `ThetaSeries` 2H (`kroneckerSym`, `kroneckerChar`).

### 5.9 Tame conductor exponents and tame local degrees

For `p` tame for `(D, t)` define `tameConductorExponent D t p` by the pinned conventions: with
`k := v_p(t)`, `rank (h_0^{k} − 1)` if `k > 0`, `rank (h_∞^{−k} − 1)` if `k < 0`, and at the cusp
`1` the value `1`, or `0` when the type is orthogonal and `v_p(t − 1)` is even
(Roberts–Rodriguez-Villegas (13.1) and §13 "Tame primes").  Evaluate it by 3.1's rank formula:
`c_p = d − #{distinct roots ζ of Φ_B with ζ^{k} = 1}` for `k > 0` (`h_0 = C(Φ_B)⁻¹`, and
`rank (C^{−k} − 1) = rank (C^k − 1)`), with `Φ_A` and `|k|` for `k < 0`.
Define the **tame local degree** `d − c_p` and record it as the degree of the Euler factor at a
tame prime; that factor itself (Roberts–Rodriguez-Villegas §13, Watkins §11.4) is the
characteristic polynomial of Frobenius on the inertia invariants of the realization and is cited,
not defined.  Acceptance, `D = ([4,2,2],[3,1,1])`, `p = 7`: `t = 7^3` gives `c_7 = 1` (degree `3`:
the roots `1, e(1/3), e(2/3)` of `Φ_3 Φ_1²` all satisfy `ζ³ = 1`), `t = 7` gives `c_7 = 3` (degree
`1`: only `ζ = 1`), `t = 7^{−4}` gives `c_7 = 1` (degree `3`: the roots `±i, −1` of `Φ_4 Φ_2²`),
`t = 7^{−2}` gives `c_7 = 3` (degree `1`: only `−1`), `t = 7^{−1}` gives `c_7 = 4` (degree `0`), and
`t = 8` (cusp `1`, symplectic) gives `c_7 = 1` (degree `3`).  On the LMFDB's 53 tame `(motive, p)`
pairs of degree `2` the degree of the stored Euler factor is `d − c_p` in every case.  The LMFDB's conductor is `∏_{p tame} p^{c_p} · ∏_{p wild} p^{c_p^{wild}}`
with the wild exponents consumed by citation (*Not owned here*); state the conductor as that
product with the wild part a parameter.

*Prerequisites:* 1.11, 2.6, 3.1, 3.2.

### 5.10 Wild primes: what is and is not stated

Define nothing new.  State in prose: at a wild prime the Euler factor and the conductor exponent
are the local invariants of the realization; the bound `c_p ≤ σ(k) − deg F_p` of
Roberts–Rodriguez-Villegas (13.2) is a conjecture and is not a target; the LMFDB stores both as
data.  The only theorem here is 5.3's classification of the prime as wild.

*Prerequisites:* 5.3.

### 5.11 The mod-`ℓ` semisimple Frobenius order

For `F ∈ ℤ[T]` with `F(0) = 1` (5.5 (ii)) and a prime `ℓ`, define
`semisimpleFrobeniusOrder F ℓ :=` the order of `X` in the unit group of
`(ZMod ℓ)[X] / (radical (reverse F mod ℓ))`, i.e. the lcm of the multiplicative orders of the
reciprocal roots of `F` in `F̄_ℓ`; prove it equals that lcm and is finite.  This is the LMFDB
motive page's "order of semisimple Frobenius at `ℓ`" for `ℓ ∈ {2, 3, 5, 7}` and its "LCMs" row.

*Prerequisites:* 5.2, 5.5; Mathlib `Polynomial.reverse`, `orderOf`, `Ideal.radical`.

### 5.12 Galois group and discriminant of the Frobenius polynomial

For `F` as in 5.11 define `frobeniusGaloisGroup := Polynomial.Gal (reverse F : ℚ[X])` and, when
`reverse F` is irreducible, `localDiscriminant := NumberField.discr (AdjoinRoot (reverse F))`,
the LMFDB knowl `hgm.local_discriminant`; when it is reducible the LMFDB displays the discriminant
of the étale algebra, which is the product over the irreducible factors of the discriminants of
their fields; define that product.  Nothing is proved about either beyond well-definedness; the
transitive-group label of the Galois group and the identification of the field are
[`PolynomialGaloisGroups`](../PolynomialGaloisGroups/README.md)' and the completed
[number-field arithmetic roadmap](../../Completed/NumberFieldArithmetic/README.md)'s.

*Prerequisites:* 5.2, 5.5; Mathlib `Polynomial.Gal`, `NumberField.discr`.

### 5.13 The L-function card

Prove that `(frobeniusPolynomial D t p)_{p good}`, the tame exponents of 5.9, a wild part
`(c_p^{wild})_{p wild}` and `(μ, ν) = archimedeanShifts (hodgeVector D) σ` assemble into the
data the [L-functions roadmap](../LFunctions/README.md) Layer 0 asks of an
`ArithmeticLFunctionData` of weight `w` and degree `d`: norm-indexed coefficients from 5.2,
conductor `∏ p^{c_p}`, the gamma shifts, a root number `ε ∈ {±1}` as a parameter, and no poles.
This milestone states the interface in that roadmap's vocabulary; the continuation and functional
equation are its Layer 0 predicates and are not asserted here (they are the Hasse–Weil
expectation for the motive).  The LMFDB's `hgm_motives.coeffs` column is the coefficient sequence
of this card.

*Prerequisites:* 5.2, 5.7, 5.9; `LFunctions` Layer 0.

### 5.14 The duality `(A, B, t) ↔ (B, A, 1/t)` collected

Collect the second half of 1.12: `weight (swap D) = weight D`, `hodgeVector (swap D) = hodgeVector D`
(2.7) and `type (swap D) = type D` (2.6); `frobeniusTrace (swap D) (1/t) q = frobeniusTrace D t q`
at every good `q` (4.10, 5.1), hence `frobeniusPolynomial (swap D) (1/t) p = frobeniusPolynomial D t p`
(5.2) and `IsPure (swap D) (1/t) p ↔ IsPure D t p` (5.5); and
`tameConductorExponent (swap D) (1/t) p = tameConductorExponent D t p` at every tame `p` (5.9: the
cusps `∞` and `0` are exchanged by 1.12, `h_∞(swap D) = C(Φ_B)` and `h_0(swap D) = C(Φ_A)^{-1}`,
and `rank (C^{−k} − 1) = rank (C^k − 1)` for invertible `C`, so the rank formula of 3.1 gives the
same count on both sides; the cusp `1` is fixed and the type agrees).  Hence the two presentations
of one motive feed the same card (5.13) with the same conductor for the same wild part.  Nothing
here picks one of them.

*Prerequisites:* 1.12, 2.6, 2.7, 3.1, 4.10, 5.1, 5.2, 5.5, 5.9, 5.13.

## Layer 6: point counts and the motive

The theorems that make the sums of Layer 4 point counts, in the two cases whose varieties are
elliptic curves and are elementary, and the citation that makes the whole structure a motive.

### 6.1 Ono's theorem

For `q` an odd prime power and `λ ∈ F_q`, `λ ≠ 0, 1`, let `E_λ := legendre λ`, the Legendre
equation `y² = x(x − 1)(x − λ)` of [Elliptic curves, Part II — Legendre models, descent and
character interfaces](../EllipticLegendreCharacterInterfaces/README.md) 0.1, the fibre at `λ` of
[Modular curves](../ModularCurves/README.md)' universal Legendre curve (4C).  Prove
`|E_λ(F_q)| = q + 1 − (−1)^{(q−1)/2} H_q(1/2, 1/2; 1, 1 | λ)` (Beukers–Cohen–Mellit Theorem 1.2,
their restatement of Ono's count in *Values of Gaussian hypergeometric series*, proved by expanding
the quadratic character of the cubic through Jacobi sums).  The count is Tau Ceti's
`WeierstrassCurve.pointCount` (`TauCeti.AlgebraicGeometry.EllipticCurve.PointCount`: the affine
solutions with the point at infinity); the proof is the character-sum count of the same roadmap's
5.1, `pointCount (legendre λ) = q + 1 + ∑_x φ(x(x−1)(x−λ))`, followed by the `₂F₁` evaluation of
Greene's Theorem 3.6 for `A = B = φ`, `C = ε` (4.12).  Acceptance: all `λ` and `p ∈ {5, 7, 11, 13, 17}`.
This is the LMFDB's Legendre family `A2.2_B1.1` (`δ = 0`), whose motive at `t` has
`a_q = H_q(1/2,1/2;1,1 | t) = (−1)^{(q−1)/2} (q + 1 − |E_t(F_q)|)`, the trace of the quadratic twist
`y² = x(1 − x)(x − t)` of `E_t` (Roberts–Rodriguez-Villegas (1.3), (1.7)); for `t = 2`, `q = 5`:
`|E_2(F_5)| = 8`, `a_5 = −2`, as the LMFDB stores for `A2.2_B1.1_t2.1`.

*Prerequisites:* 4.3, 4.12; `EllipticLegendreCharacterInterfaces` 0.1, 5.1; `ModularCurves` 4C;
Tau Ceti `WeierstrassCurve.pointCount`; Mathlib `quadraticChar`, `jacobiSum`.

### 6.2 The cubic family

For `q` coprime to `6` and `λ ∈ F_qˣ` with `27λ ≠ 1`, let `E'_λ : y² + xy + y = λx³`.  Prove
`|E'_λ(F_q)| = q + 1 − H_q(1/3, 2/3; 1, 1 | 27λ)` (Beukers–Cohen–Mellit Corollary 1.7; acceptance:
`p ∈ {5, 7, 11, 13}` and all admissible `λ`).  When `q ≡ 1 (mod 3)` the proof is the cubic
Jacobi-sum evaluation (the
[classical arithmetic completion](../ClassicalArithmeticCompletion/README.md)'s 1.19 and 1.53
are its `F_p` instances); when `q ≡ 2 (mod 3)` the gamma form 4.7 (`γ = [−1,−1,−1,3]`, `M = 27`)
is the definition and the count is direct.  Prove also Corollary 1.6, the zero count
`N_f(t) = 1 + H_q(1/3, 2/3; 1, 1/2 | t)` of `x³ + 3x² − 4t` for `q` coprime to `6` and `t ≠ 0, 1`.  This is the
LMFDB's `A3_B1.1` (`δ = 0`) with `a_q(t) = H_q(1/3, 2/3; 1, 1 | t)`, so `E'_{t/27}` is a curve in the
motive's isogeny class.

*Prerequisites:* 4.3, 4.7, 4.12; `ClassicalArithmeticCompletion` 1.19, 1.53; Mathlib
`jacobiSum`.

### 6.3 Katz's toric count

Prove Beukers–Cohen–Mellit Lemma 2.7 and, from it and 4.2, the count of the torus points of the
variety `V_t : ∑ x_i = ∑ y_j, t ∏ x_i = ∏ y_j` (their (1.1) restricted to the torus) in terms of
`katzExpSum` and its Fourier expansion: `#V_t(F_q)^{torus}` is an explicit linear combination of
`H_q(α, β | M t)` and powers of `q` (the `P_{rs}(q)` of their Theorem 1.5 is the contribution of
the degenerate characters).  The statement with the smooth completion `V̄_t`
(Beukers–Cohen–Mellit Theorem 1.5 and Definition 5.1) is cited and is not a target.

*Prerequisites:* 4.2, 4.3, 4.7.

### 6.4 The identification, cited

The following is stated in prose and asserted nowhere in Lean.  For a cyclotomic datum `(A, B)`
and `t ∈ ℚ ∖ {0, 1}`, Katz (*Exponential sums and differential equations*, Chapter 8, and
*Rigid local systems*) constructs the hypergeometric ℓ-adic sheaf `𝓗(α, β)` on `𝔾_m`, pure of
weight `w` after a Tate twist, whose Hodge-normalised Frobenius trace at a point `t ∈ F_q`,
`p ∤ N`, is `a_q(A, B; t) = q^δ H_q(A, B | t)` in the normalisation of this roadmap; Roberts–Rodriguez-Villegas §4
define the motive `H(A, B, t)` in André's category `M(ℚ, ℚ)` as the Hodge-normalised main piece
of the middle cohomology of the canonical variety (their (3.1)), of rank `d` and weight `w`, whose
ℓ-adic realization is the fibre of the sheaf, whose Hodge realization has Hodge numbers
`hodgeVector D` (Fedorov, Theorem 1; Corti–Golyshev's conjecture), whose Betti realization at
real `t` has the signature the LMFDB stores, and whose determinant is the character of 5.8.  In
the vocabulary of [`MotivesAndAlgebraicCycles`](../MotivesAndAlgebraicCycles/README.md) Layers
1–2 it is an object with realizations; in that of
[`DeligneWeightsAndPurity`](../DeligneWeightsAndPurity/README.md) its Frobenius eigenvalues are
Weil `p`-numbers of weight `w`, which is the hypothesis `IsPure D t p` of 5.5 at every good `p`,
and its Poincaré pairing (3.5's form, symmetric or alternating by type) is the self-duality
hypothesis.  The L-function of 5.13 is `L(H(A, B, t), s)`.  Every LMFDB column of the motive page
is thereby a function of the objects defined here plus the wild local invariants and the
signature, which are the realization's.

*Prerequisites:* none; this is a citation.

## Explicit scope exclusions

- No category of motives, realization functor, or Katz sheaf is constructed; 6.4 is a citation.
- No signed signature, no archimedean root number, no global root number.
- No wild Euler factor and no wild conductor exponent; no `σ(k)`.
- No classification of finite hypergeometric groups (Beukers–Heckman Theorem 7.1, Table 8.3) and
  no identification of a monodromy group with a labelled abstract group.
- No Hasse–Davenport, Gross–Koblitz or `p`-adic Gamma function here (they are
  `CharacterSumsOverFiniteFields` 3.3–3.4, 6.5 and 6.4); the `p`-adic evaluation of `H_q`
  that Magma and Sage use is an algorithm, not a target.
- No hypergeometric differential equation, period, or variation of Hodge structure; Fedorov's
  theorem and Levelt's differential-equation statement are cited only.
- No tame Euler factor beyond its degree (5.9).
- No label normal form (1.12 and 5.14 prove the duality; the choice of representative is not a
  target), no database ordering, no completeness statement for "all families of degree
  `≤ 7`".
- No `t = 1` motive beyond its Hodge vector (2.9); the degree drop and the special motive are
  Roberts–Rodriguez-Villegas §9, cited.
- No Hodge–Newton inequality (Mazur), only the predicate `IsOrdinary` (5.4).

## Worked examples (acceptance criteria)

Every number here was computed (Sage 10.7, `sage.modular.hypergeometric_motive`, as
`HypergeometricData(cyclotomic=(A, B))` with the same `t`; an independent evaluation of
Definition 1.1 and of Theorem 1.3 over `F_p`) or read from the LMFDB (its API and its source and
test suite); each line says which milestone proves it.

### `A2.2.2.2_B1.1.1.1` and its motive at `t = −1`

`α = (1/2, 1/2, 1/2, 1/2)`, `β = (1, 1, 1, 1)`; `d = 4` (1.2); `γ = [−1^8, 2^4]`, `M = 256`
(1.4); wild primes `{2}` (1.6); rotation number `1` (1.8); Hodge vector `(1,1,1,1)`, `w = 3`,
symplectic (2.2, 2.6; `m_B = 4` even, so `w` odd by 2.5); `δ = (3 + 1 − 4)/2 = 0` (2.5);
`h_∞ = C((X+1)^4)`, `h_0 = C((X−1)^4)^{−1}`, `det h_∞ = (−1)^{4+0} = 1`, `det h_0 = (−1)^{4+4} = 1`,
`det h_1 = 1` (3.3); `Γ` infinite (3.7, since `w ≠ 0`).  At `t = −1`: `t` and `t − 1 = −2` have no
odd prime factor, so every odd prime is good (5.3); `a_3 = 0`, `a_5 = −4`, `a_7 = 0`, `a_13 = −84`
(5.1); `F_3 = 1 + 6T² + 729T⁴`, `F_5 = 1 + 4T − 130T² + 500T³ + 15625T⁴`,
`F_7 = 1 + 238T² + 117649T⁴` (5.6); `15625 = 5^6 = 5^{wd/2}`, `ε_5 = 1` (5.5, `w` odd).  LMFDB:
label `A2.2.2.2_B1.1.1.1_t-1.1`, conductor `2^9 = 512` (wild, stored), sign `+1`, `sig = 0`,
Dirichlet coefficients `1, 0, 0, 0, −4, 0, 0, 0, −6, …` in arithmetic normalization (5.2).  At
`t = 1/2` and `t = 2`, which the LMFDB does not store, the pinned convention gives `a_5 = −12`,
`a_7 = −16` and `a_5 = 12`, `a_7 = −16`: the two differ by the quadratic character of `t`
(4.6 with `μ = 1/2` exchanges `α` and `β`), which is `−1` at `5` and `+1` at `7`.

### `A3_B1.1` (the cubic family) and `A2.2_B1.1` (Legendre)

`A3_B1.1`: `d = 2`, `γ = [−1,−1,−1,3]`, `M = 27`, wild `{3}`, Hodge `(1,1)`, `w = 1`.  For
`p ≡ 2 (mod 3)` the sum is defined by 4.7 only.  6.2 identifies `a_q(t)` with `q + 1` minus the
point count of `y² + xy + y = λx³` at `λ = t/27`.  `A2.2_B1.1`: `d = 2`, `γ = [−1,−1,−1,−1,2,2]`,
`M = 16`, wild `{2}`, Hodge `(1,1)`, `δ = 0`; 6.1 identifies `a_q(t)` with
`(−1)^{(q−1)/2}(q + 1 − |E_t(F_q)|)`.  LMFDB: `A2.2_B1.1_t2.1` has conductor `32` and
`F_5 = 1 + 2T + 5T²`, `F_13 = 1 − 6T + 13T²` (`a_5 = −2`, `a_13 = 6`), and `A2.2_B1.1_t1.2` has
conductor `64` and `a_5 = 2`, `a_13 = −6` (5.1); `A2.2_B1.1_t-3.1` has `c_3 = 1` and `F_3 = 1 − T`
at the tame prime `3` (5.9: cusp `0`, `rank (h_0 − 1) = 2 − 1`).

### `A2.2_B4`: the Hodge normalisation

`α = (1/2, 1/2)`, `β = (1/4, 3/4)`; `d = 2`, `γ = [−4, −1, −1, 2, 2, 2]`, `M = 1/4`, wild `{2}`;
recorded heights `−1, 0` (2.2), so `w = 1`, Hodge `(1,1)`, `δ = 1 = −m` (2.5); `λ(α, β) = 1` (4.8).
LMFDB: `A2.2_B4_t2.1` has `F_3 = 1 + 2T + 3T²` and `F_11 = 1 + 6T + 11T²`; the finite sums are
`H_3(· | 2) = −2/3` and `H_11(· | 2) = −6/11`, so `a_3 = 3 · H_3 = −2` and `a_11 = −6` (5.1, 4.9).
Without the factor `q^δ` the trace would not be an integer, and `IsPure` (5.5) would fail for
every `p`.

### `A10.6.3.2_B14.1.1.1`

`d = 9`; Hodge vector `(1, 2, 3, 2, 1)`, `w = 4`, orthogonal (2.2, 2.6; `m_B = 3` odd); the LMFDB
test suite's Hodge-vector test.

### `A6.4.4.4.3_B10.2.2.2.2.2.2`

`d = 10`; Bézout determinant `−191102976 = −2^{18}·3^6 = (−1)^{45} Res(Φ_A, Φ_B)`; Bézout module
`C_2 × C_2 × C_{16} × C_{16} × C_{432} × C_{432}` (3.8).

### `A18.12_B8.3.2.1.1.1`

`d = 10`; `A_2 = [4,4,2,2,2,2,2]`, `B_2 = [8,1,1,1,1,1]`, `C_2 = [2]`; `A_3 = [9,3]`,
`B_3 = [1,1,1,1,1,1,1,1]`, `C_3 = [3]`; `A^2 = [9,3]`, `B^2 = [1^8]` (1.7); Hodge `(2,6,2)`,
`w = 2` (2.2).

### `A6.4.4.3_B12.2.2.2.1` at `t = 2`

`d = 8`, `w = 4`, Hodge `(1,2,2,2,1)`, `m_B = 1`, `δ = 2`, wild `{2,3}`; `7` is good for `t = 2`;
`H_7(· | 2) = −6/49` and `a_7 = 7² H_7 = −6`; the first half of `F_7(T)` is
`1 + 6T − 45·7 T² − 2130·7² T³ + 268·7⁴ T⁴` (5.6), the Euler factor the LMFDB family page displays
at `p = 7` (its `test_good_euler`); the full polynomial under 5.5 ends in `7^{16} T^8`.

### `A4.2.2_B3.1.1` at the tame prime `7`

`d = 4`, `w = 1`, Hodge `(2,2)`, wild `{2,3}`.  `Φ_A = Φ_4 Φ_2²`, `Φ_B = Φ_3 Φ_1²`.  Tame local
degrees at `p = 7` (5.9): `t = 7^3 ↦ 3`, `t = 7 ↦ 1`, `t = 7^{−4} ↦ 3`, `t = 7^{−2} ↦ 1`,
`t = 7^{−1} ↦ 0`, `t = 8 ↦ 3` (cusp `1`); the corresponding factors (cited, not targets) are
`1 − 6T + 12T² − 7T³`, `1 − T`, `1 + T + 7T² + 7T³`, `1 + T`, `1`, `1 − T + 7T² − 7T³`, whose
degrees are the acceptance values.  ⚠ Reading the cusps the other way round (`v_7(t) > 0 ↦ h_∞`)
predicts degree `0` at `t = 7` and degree `1` at `t = 1/7`; the LMFDB's tame data (pinned
conventions, "Cusps and `t`") rule it out.

### `A30_B5.3.2.1` (Bober's family) and `A4_B2.1`

`A30_B5.3.2.1`: `d = 8`, `γ = [−15, −10, −6, 1, 30]`, `M = 1007769600000`, wild `{2,3,5}`,
Hodge `(8)`, `w = 0`, interlacing (2.8), finite monodromy (3.7); the LMFDB knowl on this family
cites the integrality of `(30n)! n!/((15n)!(10n)!(6n)!)`, which is 1.4's Pochhammer identity with
`M^{-n}` cleared.  `A4_B2.1`: `d = 2`, `γ = [−2,−2,4]`, `M = 16`, rotation number `2` (1.8),
primitive datum `γ/2 = [−1,−1,2]` of degree `1` (1.9), `w = 0`, imprimitive (3.9).

### Boundary and off-hypothesis checks

- `A = [2,2]`, `B = [2,1]`: not a cyclotomic datum (`2 ∈ A ∩ B`); `A = [3]`, `B = [1]`: not a
  cyclotomic datum (`φ`-sums `2 ≠ 1`).  Both are rejected by the structure (1.2).
- `A = [4]`, `q = 7`: not admissible (`4 ∤ 6`), so 4.3 does not apply; `7` is not wild, so 4.7
  defines `H_7(A, B | t)` for every `B`.  This is why 4.7, not 4.3, is the definition.
- `t = 1`: no tame primes (1.11); the degree drop (2.9) is cited; nothing in Layer 5 is stated
  at `t = 1`.
- `p = 2` for `A2.2_B1.1`: wild; no trace, no Euler factor here (5.3).
- The class `0 ∈ β`: `ω^0 = 1`, `g(0) = −1`; the normalising factor of 4.3 is still a unit,
  which is why `H_q` carries no hypothesis `0 ∉ α ∪ β`.
- `H_q(α, β | 0)`: a single term; excluded from every theorem by `t ∈ Fˣ`.
- The pair `α = {0}`, `β = {1/2}` (`A = [1]`, `B = [2]`): `d = 1`, `w = 0`,
  `Φ_1/Φ_2 = (X−1)/(X+1) = (X−1)²/(X²−1)`, so `γ(1) = 2`, `γ(2) = −1`, gamma multiset `[−2, 1, 1]`,
  `M = 1/4`, `δ = (0 + 1 − 1)/2 = 0`; and `H_q(0; 1/2 | t) = φ(t(t − 1))` with `φ` the quadratic
  character of `F_q` (so `0` at `t = 1`), for every odd `q` and `t ∈ Fˣ` (verified for
  `q ∈ {5, 7, 11, 13}`); hence `a_q(A, B; t) = φ(t(t − 1))`, and the rank-one motive is the
  quadratic character of `ℚ(√(t(t − 1)))`, which is 5.8's determinant character for `d = 1`,
  `1 ∈ A` (`Π_A = disc Φ_1 = 1`).  This is the acceptance test that `H_q` of a rank-one datum is a
  character value, computed in 4.3 and matched with 4.7 (`hypergeometricSum_degree_one`).

## Ordering

- **Layer 1** → Mathlib only.
- **Layer 2** → Layer 1; independent of Layers 3–6.
- **Layer 3** → Layers 1 (1.3, 1.5, 1.8) and 2 (2.5, 2.8 for 3.3, 3.7), and
  `ClassicalArithmeticCompletion` 2.46, 2.60; 3.8 needs only 1.2.
- **Layer 4** → Layers 1 (1.3–1.6) and, for 4.7–4.9, `CharacterSumsOverFiniteFields` 3.4
  (Hasse–Davenport) and `ClassicalArithmeticCompletion` 7.12; 4.8–4.9 also need 2.1 and 2.5 (the
  exponent `δ`); independent of Layer 3.
- **Layer 5** → Layers 1, 2 (2.5, 2.6, 2.9), 3 (3.1–3.3 for 5.8–5.9), 4 (4.7–4.10); `LFunctions`
  Layer 0 for 5.13; `ThetaSeries` 2H for the Kronecker symbol in 5.8; 5.14 collects the
  duality from 1.12, 2.7, 4.10, 5.1, 5.9.
- **Layer 6** → Layer 4 (4.3, 4.7, 4.12) and, for 6.1, `EllipticLegendreCharacterInterfaces` 0.1,
  5.1; 6.4 is a citation.
- Layers 2, 3 and Layer 4 apart from 4.8–4.9 can proceed in parallel once Layer 1 is in place;
  4.8–4.9 follow 2.5; Layer 5 needs all of them.

| Block | Status |
|---|---|
| Layer 1 carriers, gamma vector, `p`-parts, rotation number | **new** |
| Layer 2 zigzag | **new** |
| Layer 3 Levelt, Beukers–Heckman, Bézout | **new**; companion matrices consumed from the classical arithmetic completion 2.46/2.60; Bézout matrices are new in Mathlib terms |
| Layer 4 finite sums | **new** on top of Mathlib's `gaussSum`/`jacobiSum`; Hasse–Davenport consumed |
| Layer 5 traces, Euler factors, tame conductors | **new**; the card is `LFunctions`' |
| Layer 6 elliptic point counts | **new**; the Legendre model and the character-sum count consumed; the motive is cited |

## References

- F. Beukers, H. Cohen, A. Mellit, "Finite hypergeometric functions", *Pure Appl. Math. Q.* **11**
  (2015), 559–589, [arXiv:1505.02900](https://arxiv.org/abs/1505.02900).  Definition 1.1 (`H_q`),
  Theorem 1.2 (Ono), Theorem 1.3 (the gamma-vector form), Assumption 1.4, Theorem 1.5 (the point
  count, cited), Corollaries 1.6–1.8, Theorems 2.1–2.2 (Gauss and Jacobi sums), Theorem 2.4
  (Stickelberger), Theorem 2.5 (Hasse–Davenport), Proposition 2.6, Lemma 2.7, Proposition 3.1
  (Katz's sum), (3.1), Theorem 3.3 (Landau bound), Theorems 3.4–3.5 (shift, swap), Theorem 4.2
  (integrality), §4 proof of Theorem 1.3.
- J. Greene, "Hypergeometric functions over finite fields", *Trans. Amer. Math. Soc.* **301**
  (1987), 77–101.  Definition 2.4 (binomial coefficients), Definition 3.5 and Theorem 3.6
  (`₂F₁`), Definition 3.10 and Theorem 3.13 (`_{n+1}F_n`), (1.12)–(1.16) (Gauss–Jacobi identities).
- D. P. Roberts, F. Rodriguez Villegas, "Hypergeometric motives", *Notices Amer. Math. Soc.*
  **69** (2022), 914–929, [DOI](https://doi.org/10.1090/noti2491).  §2 (parameters, Levelt's
  companion matrices, the Magma reading of `(A, B)`), §3 (canonical varieties), §4 (the motive,
  (4.4) the orthogonal/symplectic dichotomy), §5 (zigzag, Figure 5.1), §9 (`t = 1`), §10 (wild,
  tame, good; (10.1) Katz's formula), §11 (Frobenius polynomials, Poincaré duality), §12 ((12.2)
  gamma factors, local invariants), §13 ((13.1) tame conductors, (13.2) the wild conjecture).
- F. Beukers, G. Heckman, "Monodromy for the hypergeometric function `ₙFₙ₋₁`", *Invent. Math.*
  **95** (1989), 325–354, [DOI](https://doi.org/10.1007/BF01393900).  §3 (Proposition 3.3,
  irreducibility; Theorem 3.5, Levelt's theorem),
  Theorem 4.3 (invariant Hermitian form), Theorem 4.5 and Corollary 4.7 (signature), Theorem 4.8
  (finiteness criterion), Theorem 5.8 (imprimitivity), Theorem 7.1 and Table 8.3 (classification,
  cited).  The statements of 4.5, 4.7 and 4.8 were taken from the restatement in H. Negami, "A
  closed signature formula for the Katz–Long–Moody Hermitian form", §7.2.1,
  [arXiv:2609.11793](https://arxiv.org/abs/2609.11793).
- A. H. M. Levelt, *Hypergeometric functions*, thesis, University of Amsterdam, 1961.  The
  companion-matrix description.
- L. Qian, "Potential automorphy for `GL_n`", [arXiv:2104.09761](https://arxiv.org/abs/2104.09761).
  Lemma 3.4 (Levelt's theorem over an arbitrary field with disjoint spectra over its algebraic
  closure, and the companion normal form `h_1 = C(q)C(p)^{-1}`), the source of 3.4's field form.
- N. M. Katz, *Exponential sums and differential equations*, Ann. of Math. Studies **124**,
  Princeton, 1990.  Chapter 8 (hypergeometric sheaves; 8.2.7 the exponential sum; 8.2.1 and §5.6
  Kummer pullback).  Cited.
- N. M. Katz, *Rigid local systems*, Ann. of Math. Studies **139**, Princeton, 1996.  Cited for
  rigidity.
- R. Fedorov, "Variations of Hodge structures for hypergeometric differential operators and
  parabolic Higgs bundles", *Int. Math. Res. Not.* 2018, [DOI](https://doi.org/10.1093/imrn/rnx044),
  [arXiv:1505.01704](https://arxiv.org/abs/1505.01704).  Theorem 1 (Hodge numbers = zigzag).  Cited.
- A. Corti, V. Golyshev, "Hypergeometric equations and weighted projective spaces", *Sci. China
  Math.* **54** (2011), 1577–1590.  The conjecture Fedorov proves.  Cited.
- F. Jouve, F. Rodriguez Villegas, "On the bilinear structure associated to Bezoutians",
  *J. Algebra* **400** (2014), 161–184.  The Bézout form of a hypergeometric datum.  Cited for
  3.8's context; no statement of it is a target.
- K. Ono, "Values of Gaussian hypergeometric series", *Trans. Amer. Math. Soc.* **350** (1998),
  1205–1223.  Theorem 1.2 of Beukers–Cohen–Mellit is its Legendre-family count.
- M. Watkins, *Hypergeometric motives package*, Magma, 2015, and the LMFDB source
  `lmfdb/hypergm/{main.py, web_family.py, hodge.py}` with knowls `hgm.*`.  The conventions of the
  database: `t`, the Levelt matrices, `p`-parts, the zigzag plot, `mu_nu`, the determinant recipe.
- Sage, `sage.modular.hypergeometric_motive` (F. Chapoton, K. Kedlaya).  The reference
  implementation of Definition 1.1 and of Theorem 1.3 against which every number above was
  checked: `HypergeometricData(cyclotomic=(A, B))` with the LMFDB's `t` reproduces the LMFDB's
  Euler factors, and its `padic_H_value` is `q^δ H_q`.
