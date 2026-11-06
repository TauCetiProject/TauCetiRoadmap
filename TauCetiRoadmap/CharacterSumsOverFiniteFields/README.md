# Roadmap: character sums over finite fields

**Summary.** Gauss sums, Jacobi sums, Kloosterman sums and the complete character sums
`∑_x χ(f(x))`, `∑_x ψ(f(x))` of a polynomial over a finite field `𝔽_q`, with the theorems that
make them usable: their absolute values, their behaviour under field extension (the
Hasse–Davenport relations), their prime factorization in cyclotomic fields (Stickelberger), their
`p`-adic evaluation by the Gross–Koblitz formula (consumed from `DirichletPadicLFunctions` and
transported to the Gauss sums of this roadmap), and Weil's square-root bounds, proved by the
elementary Stepanov method. The second half of the roadmap carries the same sums to an arbitrary
modulus `ℤ/cℤ`, which is where the LMFDB displays them: the Dirichlet character pages show
`τ_a(χ)`, `J(χ, ψ)` and `K(a, b, χ)` for every modulus, together with the bounds Weil's theorem
gives for them.

The primary carrier is a finite field `F` (`[Field F] [Fintype F]`, `q = Fintype.card F`,
`p = ringChar F`), a multiplicative character `χ : MulChar F ℂ` and an additive character
`ψ : AddChar F ℂ`, exactly Mathlib's vocabulary, so that Mathlib's `gaussSum χ ψ` and
`jacobiSum χ ψ` are the Gauss and Jacobi sums of record and nothing is redefined. Where a theorem
holds for an arbitrary finite commutative ring `R` (the definitions of all three sums, the
elementary identities), it is stated for `R`; the finite-field hypothesis enters with the first
nontrivial estimate. The complex numbers are the value ring throughout, except in Layer 6, where
the Gauss sums are taken with values in the ring of integers of a cyclotomic field so that their
prime factorization is a statement about ideals.

Suggested home: `TauCeti/NumberTheory/CharacterSums/`, with files for the canonical additive
character, Gauss sums, Jacobi and Jacobsthal sums, the polynomial `L`-series and Hasse–Davenport,
Stepanov's method, Kloosterman and Salié sums, the Teichmüller character with the Stickelberger and
Gross–Koblitz corollaries, and the integer-modulus sums.

## Scope and ownership

Several roadmaps border this one. The
[classical arithmetic roadmap](../ClassicalArithmeticCompletion/README.md) owns the cubic and
quartic Gauss and Jacobi sums of primary primes, power residue symbols, the Stickelberger
congruence and Stickelberger's relation for `Φ(P) = g(P)^m`, the Hasse–Davenport product
relation (§7.29), and the reciprocity laws; this roadmap
consumes those milestones by number (Layer 1, 1.55 and 7.12 there) and proves nothing about primary
elements or reciprocity. The [theta-series roadmap](../ThetaSeries/README.md) owns the Gauss sums
of a lattice and their reciprocity law, which are sums of `e(a‖y‖²/2c)` over `L/cL` and not
character sums; it states in its scope that Gauss's sign determination is never needed there and is
not its target. `AnalyticNumberTheoryPartI` §2.30 owns the sign of the quadratic Gauss sum of a
fundamental discriminant, deduced from the Dedekind functional equation; 1.4 consumes its prime
case and this roadmap proves no sign over the prime field. The
[multiquadratic roadmap](../../Completed/Multiquadratic/README.md) owns the Kronecker symbol and
genus theory; [Chebotarev](../../Completed/Chebotarev/README.md) and
[arithmetic Dirichlet series](../../Completed/ArithmeticDirichletSeries/README.md) are the analytic
consumers of character sums over `ℤ`, none of which states a complete character sum over a finite
field. `AutomorphicSpectralTheory` §1.16 defines the integer-modulus Kloosterman sum `S(m, n; c)`
in prose, with its frequency symmetry, its reality and the Ramanujan-sum value `S(m, 0; c)`; this
roadmap's integer-modulus sum specializes to it and the comparison is a milestone (7.3).
`CongruenceSpectralGap` §§4.2a–4.2b owns the untwisted all-rank hyper-Kloosterman sum
`hyperKloosterman F k ψ r` over every finite field, its Kloosterman-sheaf realization and its
Deligne bound `k q^{(k−1)/2}`; 5.1 identifies the untwisted rank-two case of this roadmap's
`kloostermanSum` with it, and 5.5's inequality at `χ = 1` is that bound at `k = 2`, proved a second
time here by Stepanov's method because 5.5 needs it for every `χ`.

`DirichletPadicLFunctions` owns Morita's `p`-adic Gamma function and the Gross–Koblitz formula:
its §4.1 constructs the signed Gamma function `Γ_p : ℤ_p → ℤ_p^×` with its functional equations
for every prime, its §4.4 the reflection formula and the digit identities, and its §4.5 the
Gross–Koblitz formula `g_q(a) = π^{S_p(a)} ∏_{j<f} Γ_p(a_j/(q − 1))` for the negative Gauss sum
`g_q(a) = −∑_x ω(x)^{−a} ζ_p^{Tr x}` of the Teichmüller lift of a local field's residue field.
Nothing about `Γ_p` is defined or proved here. Layer 6 owns what that roadmap leaves to its
consumers: the residue-cardinality argument and specialization of the supplied power residue
character at `n = q − 1` (6.1), the Stickelberger corollaries stated against it
(6.2–6.3), the identification of `ω_𝔓` with the local Teichmüller lift under completion and the
transport of the Gauss sums of Layer 1 into the completed field (6.4), and the resulting evaluation
of `g(ω_𝔓^{−a})` and of the Jacobi sums `J(ω_𝔓^{−a}, ω_𝔓^{−b})` in this roadmap's normalization
(6.5).

The half-integral-weight Kloosterman sums with the theta multiplier and the Jacobi symbol
`(c/d)`, for `4 ∣ c`, together with their Chinese-remainder factorization and Salié evaluation, are
`GeometryOfNumbersAndQuadraticArithmetic` §4.3's (`halfIntegralKloosterman`); the Salié sums of this
roadmap are the finite-field sums `K(η; a, b)` of 5.3 and the integer-modulus sums `S(m, n; p^k)` of
7.5 for odd prime powers, with a Dirichlet character and no multiplier, and neither roadmap
restates the other's. `DeligneWeightsAndPurity` reaches Weil bounds through étale cohomology and
weights; nothing here depends on it. The trace-function reading of this roadmap's sums is not a
target here either, and no target or route uses a sheaf. That reading is the following: under the
hypotheses of 3.3, 4.5, 4.6 and 5.4, the Gauss sum `g(χ, ψ)`, the sums `∑_x χ(f(x))` and
`∑_x ψ(f(x))` and the Kloosterman sum `K(χ; a, b)` are minus the Frobenius traces on `H¹_c` of the
rank-one sheaves `L_χ ⊗ L_ψ` on `𝔾_m`, `L_χ(f)` on the complement of the zeros of `f`, `L_ψ(f)` on
`𝔸¹` and `L_χ ⊗ L_ψ(a x + b x⁻¹)` on `𝔾_m`, where `L_χ` and `L_ψ` are the Kummer and Artin–Schreier
sheaves normalized so that Frobenius at a point `x` over `E` has trace `χ(N_{E/F} x)` and
`ψ(Tr_{E/F} x)`. By the Grothendieck–Lefschetz formula the `L`-polynomials of those sections are
then `det(1 − T·Frob | H¹_c)`, and their reciprocal roots are Frobenius eigenvalues. At `χ = 1` the
Kloosterman case is the rank-two case of the Kloosterman sheaf of `CongruenceSpectralGap` §4.2b,
whose Frobenius trace at `a b` is `−K(1; a, b)`.

`HypergeometricMotives` consumes this roadmap: the finite hypergeometric sums of Katz and
Beukers–Cohen–Mellit are quotients of products of the Gauss sums `g(ω^m)` of Layer 1 for a
generator `ω` of the character group, and their rationality uses the Hasse–Davenport product
formula 3.4. `CurvesOverFiniteFields` borders it: this roadmap bounds *finite sums* by Stepanov's
auxiliary-polynomial method applied to three explicit plane curves (Layer 4) and never forms a zeta
function, a divisor, or a function field. The zeta functions of the corresponding Kummer and
Artin–Schreier covers are `FunctionFieldArithmetic`'s (Layer 5); the comparison of the
`L`-polynomials of Layers 3–5 with their numerators is not a target here and is not needed. It is
not a divisibility: for `y² = x² + 1` over `𝔽_3` the `L`-polynomial of 4.5 is `1 − T`, while the
smooth conic has zeta numerator `1` and two rational points at infinity.

### Owned here

- The **canonical additive character** `ψ_F(x) = e(Tr_{F/𝔽_p}(x)/p)` of a finite field, its
  primitivity, and the parametrization of all additive characters as its multiplicative shifts
  (Layer 0).
- The **multiplicative character group** of `F` as a cyclic group of order `q − 1`: generators,
  characters of a given order, both orthogonality relations, the Fourier expansion of a function on
  `F^×`, the Galois action on character values, and the lifting of characters to a finite extension
  through the norm and the trace (Layer 0).
- **Gauss sums** `g(χ) = gaussSum χ ψ_F`: the trivial cases, shifts, absolute value, conjugation,
  the field of definition `ℚ(ζ_m, ζ_p)` and the Galois action on it (Layer 1); the sign over the
  prime field is consumed (1.4) and the sign over every `𝔽_q` is derived from it (3.3).
- **Jacobi sums**, **multiple Jacobi sums**, the counts of points on diagonal equations they give,
  and **Jacobsthal sums** with Jacobsthal's theorem on `p = a² + b²` (Layer 2).
- The **`L`-series of a completely multiplicative function on monic polynomials**, its Euler
  product, the identity between its logarithmic derivative and the lifted sums over `𝔽_{q^n}`, and
  the root-power identity `S_n = −∑ ω_i^n` for an `L`-polynomial; the **Hasse–Davenport lifting
  relation** for Gauss and Jacobi sums, and the sign of
  the quadratic Gauss sum over every `𝔽_q` (Layer 3).
- **Stepanov's method**: the uniform point-count bounds for `y^d = f(x)`, `y^q − y = f(x)` and
  `y^q − y = a x^d + b x^{−d}`; the power-sum lemma; the polynomiality and degree of the
  `L`-series of a multiplicative or additive character sum of a polynomial; and **Weil's bounds**
  `|∑_x χ(f(x))| ≤ (m − 1)√q` and `|∑_x ψ(f(x))| ≤ (n − 1)√q` with their point-count
  corollaries (Layer 4).
- **Kloosterman sums** `K(χ; a, b)` on a finite commutative ring, their expansion in Gauss sums,
  **Salié's evaluation** for the quadratic character, the degree-two `L`-polynomial and the lifting
  relation, **Weil's bound** `|K(χ; a, b)| ≤ 2√q`, and the Kloosterman angle (Layer 5).
- The residue-cardinality argument for the **Teichmüller character** supplied by
  `ClassicalArithmeticCompletion` §1.23 at `n = q − 1`, the prime
  factorization of `g(ω^{−a})` in `ℚ(ζ_{q−1}, ζ_p)` for every `a` as a corollary of the consumed
  Stickelberger congruence, the **digit-sum formula for Jacobi sums**, the identification of the
  Teichmüller character with the local Teichmüller lift of `DirichletPadicLFunctions` §4.5, and
  the **Gross–Koblitz evaluation** `g(ω^{−a}) = −π^{s(a)} ∏_i Γ_p(⟨p^i a/(q−1)⟩)` of this roadmap's
  Gauss sums with its Jacobi-sum corollary (Layer 6).
- The sums **modulo an integer**: `τ_a(χ)` for every Dirichlet character (the imprimitive and the
  Chinese-remainder formulas), `J(χ, ψ)` modulo `N`, `S_χ(m, n; c)` with twisted multiplicativity,
  Salié's prime-power evaluation, Weil's bound `|S(m, n; c)| ≤ τ(c)(m, n, c)^{1/2} c^{1/2}` for every
  modulus, and its twisted form with the conductor factor `𝔠_χ^{1/2}`, which can be dropped for
  cube-free `c` (Layer 7).

### Consumed, not redefined

- From Mathlib: `MulChar`, `AddChar`, `gaussSum`, `jacobiSum`, `quadraticChar`,
  `DirichletCharacter` (which is `MulChar (ZMod N) R` by definition), `ZMod.stdAddChar`,
  `AddChar.IsPrimitive`, `AddChar.mulShift`, `MulChar.ringHomComp`, `MulChar.equiv_rootsOfUnity`,
  `MulChar.exists_mulChar_orderOf`, `DirichletCharacter.changeLevel`, `conductor`, `IsPrimitive`,
  `primitiveCharacter`, `ZMod.chineseRemainder`, and every lemma named in the supplier contracts.
  Nothing in this list is restated behind a private name.
- From the [classical arithmetic roadmap](../ClassicalArithmeticCompletion/README.md): 1.19 (the
  cube of a cubic Gauss sum), 1.53 (`J(χ_π, χ_π) = π` for the cubic character of a primary prime
  `π`) and 1.36 (`−χ(−1) J(χ, χ) = π`, that is `J(χ, χ) = −(−1)^{(p−1)/4} π`, for the quartic
  character of a primary Gaussian prime), 1.46 and 1.60 (the fourth and third powers of the quartic
  and cubic Gauss sums), 1.47 (`Φ(P) = g(P)^m ∈ ℤ[ζ_m]`), 1.55 (Stickelberger's relation
  `(Φ(P)) = P^γ`), 7.12 (the Stickelberger congruence
  `∏ a_i! · (−g(ω^{−a})) ≡ (ζ_p − 1)^{s(a)} (mod 𝔓̃^{s(a)+1})`, whose exported consequence is the
  valuation `v_𝔓̃(g(ω^{−a})) = s(a)`; 1.55 uses that valuation inside its proof and does not export
  it), and 4.19 (the quadratic exponential sum `S_p(a)` and `S_p(1) = gaussSum χ ψ`). Layer 6
  states 1.55 and 7.12 against the Teichmüller character 6.1 and derives from them the
  factorization of `(g(ω^{−a}))` for every `a` and the Jacobi digit-sum formula; it re-derives
  neither. Its §1.23 supplies `powerResidueSymbol`, its unique-root congruence and exact-order
  API, specialized at `n = q − 1` in 6.1. Its §7.29 supplies the full Hasse–Davenport product
  formula for every multiplicative character and every nontrivial additive character; 3.4
  records its duplication consequence and normalization Checks.
- From `AnalyticNumberTheoryPartI` §2.30 (ii): the Gauss sum of the primitive quadratic character
  `ε_D` of a fundamental discriminant `D` equals `κ(D) |D|^{1/2}`, `κ(D) = 1` for `D > 0` and `i`
  for `D < 0`. At `D = (−1)^{(p−1)/2} p` for an odd prime `p` this is the sign `g(η_p) = ε_p √p` of
  1.4, consumed there and not reproved.
- From `DirichletPadicLFunctions`: §4.1 (the signed Morita Gamma function `Γ_p : ℤ_p → ℤ_p^×`,
  `existsUnique_moritaGamma`, with `Γ_p(0) = 1`, `Γ_p(x + 1) = −x Γ_p(x)` for units `x` and
  `Γ_p(x + 1) = −Γ_p(x)` for `x ∈ pℤ_p`, `moritaGamma_unit_step` and `moritaGamma_nonunit_step`),
  §4.4 (the reflection formula `Γ_p(x) Γ_p(1 − x) = (−1)^{R(x)}` with `R(x) ∈ {1, …, p}` the
  residue of `x` for odd `p`, and the digit identity `∑_{j<f} a_j/(q − 1) = S_p(a)/(p − 1)` for the
  rotated digits `a_j = p^j a mod (q − 1)`), and §4.5 (`grossKoblitz_formula`: for the Teichmüller
  lift `ω` of the residue field of a local field with `q` residue elements and the root `π` of
  `π^{p−1} = −p` with `π ≡ ζ_p − 1 (mod (ζ_p − 1)²)`, the negative Gauss sum
  `g_q(a) = −∑_x ω(x)^{−a} ζ_p^{Tr x}` equals `π^{S_p(a)} ∏_{j<f} Γ_p(a_j/(q − 1))` for
  `0 ≤ a < q − 1`). Layer 6 consumes these three sections and defines no Gamma function.
- From Tau Ceti: `gaussSum_mul_gaussSum_inv_eq_card_of_isPrimitive` and
  `gaussSumOfPrimitiveRoot` (`TauCeti.NumberTheory.DirichletCharacter.GaussSum`), used in 7.1;
  the local Teichmüller lifts `TauCeti.teichmuller` (`TauCeti.RingTheory.Henselian.Teichmuller`)
  and `TauCeti.teichmullerLift` (`TauCeti.NumberTheory.LocalField.Teichmuller`), which 6.1 and 6.4
  compare with the global character `ω_𝔓`.
- From `AutomorphicSpectralTheory` §1.16: the integer-modulus sum
  `S(m, n; c) = ∑_{d ∈ (ℤ/cℤ)^×} e((m d + n d̄)/c)` with its frequency symmetry
  `S(m, n; c) = S(n, m; c)`, its reality (`kloosterman_real`) and the Ramanujan-sum values
  `S(m, 0; c) = ∑_{d ∣ (m, c)} μ(c/d) d`. Milestone 7.3 identifies it with the trivial-character
  specialization of this roadmap's `kloostermanSum` over `ZMod c`; its three facts are then
  inherited and not reproved.
- From `CongruenceSpectralGap` §4.2a: the raw hyper-Kloosterman sum
  `hyperKloosterman F k ψ r = ∑_{x : Fin k → Fˣ, ∏ x_i = r} ψ(∑ x_i)`, which 5.1 identifies with
  `kloostermanSum 1 ψ a b` at `k = 2`, `r = a b`; and §4.2b `hyperKloosterman_bound`,
  `‖hyperKloosterman F k ψ r‖ ≤ k q^{(k−1)/2}` for `ψ ≠ 1`, `k ≥ 1`, which 5.5 records at `χ = 1`.
  Neither is redeclared here.
- From `EllipticLegendreCharacterInterfaces` 5.1: the character-sum point count of a normal-form
  Weierstrass equation over an odd finite field and `symmetric_cubic_trace_zero`, which 2.5 reads
  as the elliptic form of its Jacobsthal sums.

### Not owned here

- **Reciprocity laws, power residue symbols and primary elements**: the classical arithmetic
  roadmap, Layer 1. The Gauss and Jacobi sums here are indexed by abstract characters; which
  character is "the" cubic residue character of a primary prime is that roadmap's business.
- **The Kronecker symbol `(D/·)`** and the identification of real Dirichlet characters with it:
  the multiquadratic roadmap and the theta-series roadmap (2H there).
- **Gauss sums of a lattice** `G_L(a, c)`, their reciprocity and Milgram's formula: the
  theta-series roadmap, Layer 6. The one-dimensional quadratic exponential sum
  `∑_{y mod c} e(a y²/c)` for a composite modulus `c`, and the Landsberg–Schaar identity, are not
  targets of this roadmap; the prime case `c = p` is the classical arithmetic roadmap's 4.19
  (as a Gauss sum) and its sign is `AnalyticNumberTheoryPartI` §2.30's, consumed in 1.4.
- **Morita's `p`-adic Gamma function and the Gross–Koblitz formula**: `DirichletPadicLFunctions`
  §§4.1, 4.4 and 4.5. Layer 6 consumes them; what it owns is the comparison of carriers and the
  evaluation of this roadmap's Gauss and Jacobi sums.
- **Zeta functions of curves and function fields** and the Riemann hypothesis for curves:
  `FunctionFieldArithmetic`, Layer 5 (the root bound `|α_i| = √q` in §5.4). Weil polynomials:
  `CurvesOverFiniteFields`. The comparison of the `L`-polynomials of Layers 3–5 with numerators
  of zeta functions is not a statement of this roadmap. The cohomological theory of weights and
  Deligne's theorem: `DeligneWeightsAndPurity`. The Kloosterman sheaf, the all-rank
  hyper-Kloosterman sums and their Deligne bound: `CongruenceSpectralGap` §§4.2a–4.2b.
- **Kummer and Artin–Schreier sheaves** `L_χ`, `L_ψ`, and every sheaf-theoretic identification of
  the sums of this roadmap (the trace-function reading recorded above): not targets of this
  roadmap, which defines no sheaf and proves each of its bounds without one.
- **Half-integral-weight Kloosterman sums** with the theta multiplier:
  `GeometryOfNumbersAndQuadraticArithmetic` §4.3.
- **Finite hypergeometric sums**, Greene's and Katz's functions: `HypergeometricMotives`, which
  evaluates them `p`-adically through the Gross–Koblitz evaluation 6.5.
- **Selberg's `λ₁ ≥ 3/16`**, Kuznetsov's formula, and any use of Kloosterman sums in spectral
  theory: `AutomorphicSpectralTheory` and `CongruenceSpectralGap` (whose `λ₁ ≥ 21/100` contains
  `3/16`).
- **The general mixed Weil bound** `|∑_x χ(f(x)) ψ(g(x))| ≤ (deg f + deg g − 1)√q` for arbitrary
  `f, g`, and Weil bounds for rational functions beyond `a x^d + b x^{−d}`: not targets of this
  roadmap; the twisted Kloosterman case is 5.5.
- **Equidistribution of Kloosterman angles** (Katz's vertical Sato–Tate law): not a target of
  this roadmap. The angle `θ_F(a, b)` is defined in 5.5; nothing about its distribution is.
  Deligne's equidistribution theorem is `DeligneWeightsAndPurity` §10.5 and the Kloosterman sheaf
  is `CongruenceSpectralGap` §4.2b; the geometric monodromy group of that sheaf, which the law
  also needs, is not a target here.
- **`p`-adic `L`-functions** and the Dwork exponential as objects of their own:
  `DirichletPadicLFunctions`; Layer 6 contains the transport of the Gross–Koblitz formula and
  nothing further `p`-adic.
- **Exponential sums over `ℤ/cℤ` of general polynomials** (Hua's bound) and **incomplete sums**
  (Pólya–Vinogradov, Burgess, Weyl differencing): the analytic number theory roadmaps; only the
  Kloosterman case 7.5–7.6 and complete sums over a finite ring are here.
- **Conrey labels** and the ordering of characters: the Conrey isomorphism
  `(ℤ/qℤ)^× ≃ DirichletCharacter ℂ q` and the ordering of characters are database conventions,
  not targets; no roadmap at the pins declares them. The worked examples name a character by its
  Conrey index, spelled out in prose for prime `q` (the character is determined by its value on the
  least primitive root), and nothing depends on the name.
- **Sheaf-theoretic identifications of the sums**: Gauss and Jacobi sums as Frobenius traces on
  the compactly supported cohomology of rank-one sheaves on `𝔾_m` and `𝔸¹ ∖ {0, 1}`, and
  Kloosterman sums as Frobenius traces of a Kloosterman sheaf, are not targets here. They are
  stated with the Artin–Schreier sheaf `ℒ_ψ` (`artinSchreierSheaf ψ`) and the Kummer sheaf `ℒ_χ`
  (`kummerSheaf χ`) of `FourierDeligneTransform`, which applies
  `EtaleCohomologyFoundations` §F.0.3's rank-one lisse sheaves from torsors and characters to the
  Lang torsors of `𝔾_a` and `𝔾_m`, normalized so that geometric Frobenius at a point `x` over
  `𝔽_{q^n}` has trace `ψ(Tr x)` on `ℒ_ψ` and `χ(N x)` on `ℒ_χ`. One construction serves every
  roadmap that needs these sheaves, and none is defined here. The Kloosterman sheaf of
  `CongruenceSpectralGap` §4.2b is built from the same Artin–Schreier sheaf by multiplicative
  convolution, `R^{k−1}mult_!(ℒ_ψ ⊠ ⋯ ⊠ ℒ_ψ)` on `𝔾_m`; at `k = 2`, replacing the first factor by
  `ℒ_χ ⊗ ℒ_ψ` gives the sheaf whose geometric-Frobenius trace at `r ∈ Fˣ` is `−K(χ; 1, r)`, and
  5.1's scaling `K(χ; a, b) = χ(a)⁻¹ K(χ; 1, a b)` reaches every `K(χ; a, b)` with `a b ≠ 0`.
  The trace-function interpretation of this roadmap's `L`-series is recorded in 3.6.

## Conventions

| Object | Convention |
|---|---|
| The field | `F` with `[Field F] [Fintype F]`; `q = Fintype.card F`; `p = ringChar F`, a prime; `f` with `q = p ^ f`. A general finite commutative ring is `R` with `[CommRing R] [Fintype R]`, and `ZMod c` is the integer-modulus case. |
| Multiplicative characters | Mathlib's `MulChar F ℂ`: `χ(0) = 0` **for every `χ`, including `χ = 1`**. So `∑_x χ(x) = 0` for `χ ≠ 1`, `∑_x 1(x) = q − 1`, `g(1) = −1` and `J(1, 1) = q − 2`. This is also the LMFDB's convention: its principal character `χ_q(1, ·)` is `0` off the units, so `τ_1(χ_q(1,·)) = μ(q)`. ⚠ Sources that set `χ(0) = 1` for the trivial character (Lidl–Niederreiter) shift `g(1)`, `J(1, χ)` and `J(1, 1)` by `1`; every statement here is checked against Mathlib's convention. |
| The quadratic character | `η_F := (quadraticChar F).ringHomComp (Int.castRingHom ℂ)`, the unique character of order `2` when `p ≠ 2`; for `p = 2` it is `1`. "`η`" always means this. |
| Characters of order `d` | Exist iff `d ∣ q − 1` (`MulChar.exists_mulChar_orderOf`). A **generator** `ω` of the character group is a character of exact order `q − 1`; the choice is a parameter of every statement that mentions one. The Teichmüller character of Layer 6 is the generator canonically attached to a prime of `ℚ(ζ_{q−1})` above `p`. |
| The canonical additive character | `ψ_F(x) = e(Tr_{F/𝔽_p}(x)/p)`, in Lean `stdAddChar F := (ZMod.stdAddChar).compAddMonoidHom (Algebra.trace (ZMod p) F)`, with `e(t) = exp(2πit)`. For `F = ZMod p` it is Mathlib's `ZMod.stdAddChar`. It is primitive. **Every unqualified `ψ` means `ψ_F`**, and `g(χ)`, `J`, `K(χ; a, b)` without a second argument are taken against it. Mathlib's `FiniteField.primitiveChar_to_Complex F` is a primitive additive character chosen through an abstract cyclotomic extension; 0.2 shows it is `ψ_F.mulShift u` for a unique unit `u`, and no theorem here is stated against it. |
| Gauss sums | `g(χ, ψ) = gaussSum χ ψ = ∑_{x ∈ F} χ(x) ψ(x)`, with the **plus sign** `e(+Tr(x)/p)`; `g(χ) := g(χ, ψ_F)`; the shifted sum `g_a(χ) := gaussSum χ (ψ_F.mulShift a) = ∑_x χ(x) ψ_F(a x)`, so `g_a(χ) = χ(a)⁻¹ g(χ)` for `a ≠ 0` (`gaussSum_mulShift_eq`). The LMFDB's `τ_a(χ)` is `g_a(χ)` over `ZMod q`. Changing only the additive sign gives `g(χ, ψ⁻¹) = χ(−1) g(χ, ψ)`; conjugation inverts both characters: `conj(g(χ, ψ)) = g(χ⁻¹, ψ⁻¹)` (`gaussSum_mulShift_eq`, `star_gaussSum_eq`). The ideal `(g)` and `|g|` are unchanged by the additive sign change. |
| Jacobi sums | `J(χ, ψ) = jacobiSum χ ψ = ∑_{x ∈ F} χ(x) ψ(1 − x)`; the `r`-fold sum `J(χ₁, …, χ_r) = ∑_{x₁ + ⋯ + x_r = 1} ∏ χ_i(x_i)` and `J₀(χ₁, …, χ_r)` with `∑ x_i = 0`. |
| Kloosterman sums | `K(χ; a, b) = K(χ, ψ; a, b) := ∑_{x ∈ R^×} χ(x) ψ(a x + b x⁻¹)` on a finite commutative ring `R`, `ψ` an additive character of `R`, `a, b ∈ R`. The sum is over **units**. `K(a, b) := K(1; a, b)`. On `ZMod c` with `ψ = ZMod.stdAddChar`: `S(m, n; c) := K(1; m, n)` and, for a Dirichlet character `χ` of modulus `N ∣ c`, `S_χ(m, n; c) := K(changeLevel χ; m, n)`. The LMFDB's `K(a, b, χ)` is `S_χ(a, b; q)` with `N = c = q`. |
| Salié sums | `S(χ := η; a, b)`, that is `K(η; a, b)`; no separate name. |
| Kloosterman angle | For `a b ≠ 0` in `F`, `θ_F(a, b) ∈ [0, π]` is defined by `K(a, b) = −2√q cos θ_F(a, b)`, equivalently the reciprocal roots of the `L`-polynomial 5.4 are `√q e^{±iθ}`. ⚠ Katz's normalization `Kl = 2√q cos θ` for the sum `−K` differs by the sign; the sign here is the one that makes `θ` the argument of a reciprocal root. |
| The `L`-series of a multiplicative function | For `λ` on monic polynomials over `F` with `λ(1) = 1` and `λ(gh) = λ(g)λ(h)`: `L(λ, T) = ∑_{g monic} λ(g) T^{deg g} ∈ ℂ⟦T⟧`. The lifted sum of degree `n` is `S_n(λ) = ∑_{α ∈ E} λ(minpoly_F α)^{n / deg α}` for `E/F` of degree `n`. When `L(λ, T) = ∏_{i<k} (1 − ω_i T)`, `S_n(λ) = −∑_i ω_i^n`; the `ω_i` are the **reciprocal roots**. |
| Hasse–Davenport lifting | `−g(χ ∘ N_{E/F}, ψ ∘ Tr_{E/F}) = (−g(χ, ψ))^{[E:F]}`, with the **minus signs**. |
| The Teichmüller character | For a prime `𝔓` of `𝓞_{ℚ(ζ_{q−1})}` above `p`, `ω_𝔓 : MulChar (𝓞 ⧸ 𝔓) 𝓞` is the unique character with `ω_𝔓(x) ≡ x (mod 𝔓)`. Stickelberger's statements are about `g(ω_𝔓^{−a})`, `0 ≤ a < q − 1`, with the digit sum `s(a) = ∑ a_i` for `a = ∑_{i<f} a_i p^i`, `0 ≤ a_i < p`. |
| `p`-adic normalization | Two elements of valuation one at `𝔓̃` occur and are named differently. `λ := ζ_p − 1 ∈ 𝓞_L` is the uniformizer in the Stickelberger congruence (6.2). `π` is the Gross–Koblitz root of `π^{p−1} = −p` in the completion `L_𝔓̃` with `π ≡ λ (mod 𝔓̃²)` (6.4); `λ` and `π` agree to order one and differ at order two (`v_𝔓̃(π − λ) = 2` in `ℚ_7(ζ_7)`). `Γ_p` is `DirichletPadicLFunctions` §4.1's signed Morita function, with `Γ_p(n) = (−1)^n ∏_{0<j<n, p∤j} j` on `ℕ`, so `Γ_p(0) = 1`, `Γ_p(1) = −1`; `⟨x⟩ ∈ [0, 1)` is the fractional part. |
| `ε_q` | `ε_q = 1` if `q ≡ 1 (mod 4)` and `ε_q = i` if `q ≡ 3 (mod 4)`, for odd `q` (a prime power or a modulus). |
| Twisted multiplicativity | For coprime `c₁, c₂` and `c = c₁ c₂`: `S_χ(m, n; c) = S_{χ₁}(m c̄₂, n c̄₂; c₁) · S_{χ₂}(m c̄₁, n c̄₁; c₂)`, where `c̄₂ c₂ ≡ 1 (mod c₁)`, `c̄₁ c₁ ≡ 1 (mod c₂)` and `χ = χ₁ χ₂` is the Chinese-remainder factorization. |
| Valuations of ideals | `v_𝔓(I) = multiplicity 𝔓 I` in the monoid of ideals of the Dedekind domain `𝓞_K` (Mathlib's `multiplicity`), and `v_𝔓(x) := v_𝔓(Ideal.span {x})`. |
| Conditional statements | None. Every bound here is a theorem. |

## Exact supplier contracts

Every declaration named below exists at the pinned Mathlib and Tau Ceti in the file given; nothing
is cited from a later revision of either library. The Mathlib areas drawn on are its finite fields
(`FieldTheory/Finite/*`), multiplicative characters (`NumberTheory/MulChar/*`), additive characters
(`Algebra/Group/AddChar`, `NumberTheory/LegendreSymbol/AddCharacter`), Gauss sums
(`NumberTheory/GaussSum`), Jacobi sums (`NumberTheory/JacobiSum/Basic`), the quadratic character
(`NumberTheory/LegendreSymbol/QuadraticChar/*`), Dirichlet characters
(`NumberTheory/DirichletCharacter/*`), cyclotomic fields (`NumberTheory/Cyclotomic/*`,
`NumberTheory/NumberField/Cyclotomic/*`), Hasse derivatives, Dedekind-domain completions
(`RingTheory/DedekindDomain/AdicValuation`) and the Fourier analysis of finite abelian groups
(`Analysis/Fourier/FiniteAbelian/*`).

### From Mathlib

Additive characters: `AddChar`, `AddChar.mulShift`, `mulShift_mul`, `inv_mulShift`
(`ψ⁻¹ = ψ.mulShift (−1)`), `AddChar.IsPrimitive`, `to_mulShift_inj_of_isPrimitive`,
`IsPrimitive.of_ne_one` (on a field every nontrivial additive character is primitive),
`AddChar.sum_eq_zero_of_ne_one`, `sum_mulShift`, `AddChar.card_eq` (`#AddChar α ℂ = #α`),
`sum_apply_eq_ite` (dual orthogonality), `ZMod.stdAddChar`, `ZMod.stdAddChar_apply`,
`ZMod.isPrimitive_stdAddChar`, `AddChar.zmodChar`, `FiniteField.primitiveChar`,
`FiniteField.primitiveChar_to_Complex` and its primitivity.

Multiplicative characters: `MulChar`, `map_nonunit`, `MulChar.inv_apply'`, `star_eq_inv`,
`apply_mem_rootsOfUnity`, `ringHomComp` and its injectivity lemmas, `IsQuadratic`,
`sum_eq_zero_of_ne_one`, `sum_one_eq_card_units`, `orderOf_dvd_card_sub_one`,
`exists_mulChar_orderOf`, `exists_mulChar_orderOf_eq_card_units`, `equiv_rootsOfUnity`
(`MulChar M R ≃* rootsOfUnity (#Mˣ) R` for cyclic `Mˣ`), `ofRootOfUnity`,
`card_eq_card_units_of_hasEnoughRootsOfUnity`, `exists_apply_ne_one_of_hasEnoughRootsOfUnity`,
`exists_apply_eq_pow` (every value of `χ` is a power of a primitive root of unity of order
`orderOf χ`), `apply_mem_algebraAdjoin` (values in `ℤ[ζ_m]`), `val_neg_one_eq_one_of_odd_order`.

Gauss sums (`Mathlib/NumberTheory/GaussSum.lean`): `gaussSum`, `gaussSum_mulShift_eq`
(`gaussSum χ (mulShift ψ a) = χ a⁻¹ * gaussSum χ ψ`), `star_gaussSum_eq`
(`star (gaussSum χ ψ) = gaussSum χ⁻¹ ψ⁻¹`), `gaussSum_one_one`, `gaussSum_one_right`
(`gaussSum χ 1 = 0` for `χ ≠ 1`), `gaussSum_one_left` (`gaussSum 1 ψ = −1` for `ψ ≠ 1`),
`mul_gaussSum_inv_eq_gaussSum` (`χ(−1) gaussSum χ ψ⁻¹ = gaussSum χ ψ`),
`gaussSum_mul_gaussSum_eq_card` (`gaussSum χ ψ * gaussSum χ⁻¹ ψ⁻¹ = q` for `χ ≠ 1`, `ψ`
primitive), `gaussSum_ne_zero_of_nontrivial`, `gaussSum_sq` (`g(χ)² = χ(−1) q` for `χ` quadratic
nontrivial, `ψ` primitive), `gaussSum_frob`, `Char.card_pow_card`, `FiniteField.two_pow_card`.

Jacobi sums (`Mathlib/NumberTheory/JacobiSum/Basic.lean`): `jacobiSum`, `jacobiSum_comm`,
`jacobiSum_ringHomComp`, `jacobiSum_one_one` (`= q − 2`), `jacobiSum_one_nontrivial` (`= −1`),
`jacobiSum_nontrivial_inv` (`J(χ, χ⁻¹) = −χ(−1)`), `jacobiSum_mul_nontrivial`
(`J(χ, φ) g(χφ) = g(χ) g(φ)` for `χφ ≠ 1`), `jacobiSum_eq_gaussSum_mul_gaussSum_div_gaussSum`,
`jacobiSum_mul_jacobiSum_inv` (`J(χ, φ) J(χ⁻¹, φ⁻¹) = q` for `χ, φ, χφ ≠ 1`),
`jacobiSum_mem_algebraAdjoin_of_pow_eq_one`, `gaussSum_pow_eq_prod_jacobiSum`
(`g(χ)^n = χ(−1) q ∏_{i ∈ [1, n−2]} J(χ, χ^i)` for `2 ≤ n = orderOf χ`).

Quadratic characters: `quadraticChar`, `quadraticChar_isQuadratic`, `quadraticChar_sum_zero`,
`quadraticChar_card_sqrts`, `quadraticChar_neg_one`, `quadraticChar_two`, `quadraticChar_card_card`,
`quadraticChar_odd_prime`, `legendreSym` (which is `quadraticChar (ZMod p)` by definition),
`jacobiSym`, `ZMod.χ₄`, `ZMod.χ₈`.

Dirichlet characters: `DirichletCharacter R n := MulChar (ZMod n) R`, `changeLevel`,
`FactorsThrough`, `conductor`, `IsPrimitive`, `primitiveCharacter`, `sum_characters_eq`,
`sum_char_inv_mul_char_eq` (orthogonality over `ZMod n`), `gaussSum_mulShift_of_isPrimitive`
(`gaussSum χ (e.mulShift a) = χ⁻¹ a * gaussSum χ e` for primitive `χ`, every `a : ZMod N`),
`gaussSum_eq_zero_of_isPrimitive_of_not_isPrimitive`, `factorsThrough_of_gaussSum_ne_zero`,
`DirichletCharacter.rootNumber`.

Finite fields and polynomials: `Algebra.trace`, `Algebra.norm`, `Algebra.norm_zero`,
`FiniteField.trace_to_zmod_nondegenerate`, `FiniteField.roots_X_pow_card_sub_X`,
`FiniteField.splits_X_pow_card_sub_X`, `GaloisField p n`, `FiniteField.algEquivOfCardEq`,
`Polynomial.hasseDeriv` with `hasseDeriv_mul`, `hasseDeriv_apply`, `Polynomial.rootMultiplicity`,
`Polynomial.card_roots'`, `Polynomial.roots`, `minpoly`, `AdjoinRoot`, `PowerSeries`,
`PowerSeries.C`, `PowerSeries.X`.

Cyclotomic fields and completions: `IsCyclotomicExtension`, `CyclotomicField`, `IsPrimitiveRoot`,
`IsCyclotomicExtension.zeta`, `IsCyclotomicExtension.Rat.zeta_sub_one_prime'`
(`ζ_p − 1` generates a prime), `IsCyclotomicExtension.Rat.torsionOrder_eq`,
`NumberField.Embeddings.pow_eq_one_of_norm_eq_one`, `Ideal.IsPrime`, `Ideal.LiesOver`,
`multiplicity`, `Ideal.Quotient.field`, `IsDedekindDomain.HeightOneSpectrum.adicCompletion` and
`adicCompletionIntegers` (the completion `L_𝔓̃` and its valuation ring in 6.4).

Arithmetic functions: `ArithmeticFunction.sigma 0` (`τ(c)`), `ArithmeticFunction.moebius`,
`Nat.totient`, `Nat.digits`.

### From Tau Ceti

`gaussSum_mul_gaussSum_inv_eq_card_of_isPrimitive` (`gaussSum χ e * gaussSum χ⁻¹ e⁻¹ = N` for a
primitive `χ` modulo `N` and a primitive `e`) and `gaussSum_sq_of_isPrimitive_of_isQuadratic`,
`gaussSumOfPrimitiveRoot` with `map_gaussSumOfPrimitiveRoot`, `gaussSumOfPrimitiveRoot_ne_zero`
and `stabilizer_gaussSumOfPrimitiveRoot` (`TauCeti.NumberTheory.DirichletCharacter.GaussSum`);
`FiniteField.primitiveChar_to_Complex_ne_one` (`TauCeti.NumberTheory.LegendreSymbol.Complex`);
`MulChar.ofUnitHom_inv_eq_star` (`TauCeti.NumberTheory.MulChar.Lemmas`); the Teichmüller lift of a
Henselian local ring `TauCeti.teichmuller : (ResidueField R)ˣ →* Rˣ`
(`TauCeti.RingTheory.Henselian.Teichmuller`) and the zero-preserving lift of a nonarchimedean local
field `TauCeti.teichmullerLift K : 𝓀[K] →*₀ 𝒪[K]` with `residue_teichmullerLift` and
`teichmullerLift_unique` (`TauCeti.NumberTheory.LocalField.Teichmuller`). Tau Ceti has no Galois
orbits of multiplicative characters, no evaluation of Gauss's quadratic exponential sum and no
Conrey character at the pin; 0.5 and 7.7 are written without them and 1.4 consumes
`AnalyticNumberTheoryPartI`.

### From ClassicalArithmeticCompletion

1.19, 1.23 (`powerResidueSymbol`, `powerResidueSymbol_spec`), 1.36, 1.46, 1.47, 1.53, 1.55, 1.60,
4.19 (`quadraticExpSum`, `quadraticExpSum_one_eq_gaussSum`), 7.12 and 7.29, with the statements listed
under *Consumed, not redefined*. 1.47's `χ_P = (·/P)_m⁻¹` is `ω_𝔓^{−(q−1)/m}` (6.1); 7.12's
congruence is stated with the uniformizer `ζ_p − 1` and the sign `−g(ω^{−a})` (6.2).
Section 1.23 supplies the residue character, its uniqueness and order at `n = q − 1`;
§7.29 supplies `g(χ^m) ∏_{1≤j<m} g(λ^j) = χ(m)^m ∏_{0≤j<m} g(χλ^j)`
for exact-order `λ`, `m ∣ q − 1`, and nontrivial additive character, including `χ = 1`.

### From AnalyticNumberTheoryPartI

§2.30 (ii): `∑_{n mod δ} ε_D(n) e(n/δ) = κ(D) δ^{1/2}` for a fundamental discriminant `D ≠ 1`,
`δ = |D|`, `ε_D` the primitive quadratic character of conductor `δ`, `κ(D) ∈ {1, i}` according to
the sign of `D`; and the shifted form `∑_n ε_D(n) e(rn/δ) = ε_D(r) κ(D) δ^{1/2}`. Consumed in 1.4
at `D = (−1)^{(p−1)/2} p`, where `ε_D` is the Legendre symbol modulo `p`.

### From DirichletPadicLFunctions

§4.1 (`existsUnique_moritaGamma`, `moritaGamma_unit_step`, `moritaGamma_nonunit_step`), §4.4 (the
reflection formula, including `Γ_2(x) Γ_2(1 − x) = (−1)^{1+x₁}` for the second binary digit `x₁`, and the digit identity `∑_{j<f} a_j/(q − 1) = S_p(a)/(p − 1)`) and
§4.5 (`grossKoblitz_formula` for the negative Gauss sum of the local Teichmüller lift, with
`π^{p−1} = −p`, `π ≡ ζ_p − 1 (mod (ζ_p − 1)²)`, and its corollaries `grossKoblitz_formula_valuation`
`‖g_q(a)‖ = ‖p‖^{S_p(a)/(p−1)}` and the leading residue `g_q(a)/π^{S_p(a)} ≡ (∏ a_i!)⁻¹`), with
the statements listed under *Consumed, not redefined*. Consumed in 6.4–6.5.

### From AutomorphicSpectralTheory

§1.16: `S(m, n; c)` in prose, its frequency symmetry, `kloosterman_real`, and
`S(m, 0; c) = ∑_{d ∣ (m, c)} μ(c/d) d`. Consumed in 7.3.

### From CongruenceSpectralGap

§4.2a `hyperKloosterman F k ψ r` and §4.2b `hyperKloosterman_bound`. Consumed in 5.1 and 5.5.

### From EllipticLegendreCharacterInterfaces

5.1, the character-sum point count `q + 1 + ∑_x η(f(x))` of a Weierstrass equation
`y² = f(x) = x³ + a₂x² + a₄x + a₆` over an odd finite field and `symmetric_cubic_trace_zero`.
Consumed in 2.5.

## How to read the build

Layer 0 fixes the carriers: the canonical additive character and the shift parametrization of all
additive characters, the cyclic character group with its orthogonality relations and Galois action,
the lifts of characters to a finite extension, and the characters of a product ring with the
Chinese-remainder factors of a Dirichlet character. Layer 1 records Mathlib's Gauss-sum identities
against the canonical character and adds the norm, the field of definition and the Galois action;
Layer 2 does the same for Jacobi sums and adds the multiple Jacobi sums, diagonal equations and
Jacobsthal sums. Layer 3 builds the `L`-series of a monic multiplicative function once and uses it
for the Hasse–Davenport lifting relation, with the supplied product formula giving duplication; Layer 4 proves Stepanov's uniform
point-count bounds and converts them through the `L`-series and the power-sum lemma into Weil's
bounds for polynomial sums; Layer 5 defines Kloosterman sums on a finite ring and proves Salié's
evaluation, the degree-two `L`-polynomial and Weil's bound by the same route. Layer 6 constructs the
Teichmüller character of a prime of `ℚ(ζ_{q−1})`, states the consumed Stickelberger congruence and
relation against it, and transports the consumed Gross–Koblitz formula to this roadmap's Gauss and
Jacobi sums. Layer 7 reads the Kloosterman sum of Layer 5 on `ZMod c` and proves the
integer-modulus formulas and Weil's bound for every modulus. Three streams are independent after
Layer 0: Layers 1–2 then 6; Layers 3–4 then 5; and 0.7 with 7.1–7.2. Layer 7's 7.3–7.7 close the
roadmap and need the first two streams.

## Layer 0: characters of a finite field

Throughout, `F` is a finite field, `p = ringChar F`, `q = Fintype.card F`.

### 0.1 The canonical additive character

Define `stdAddChar F : AddChar F ℂ` as `ψ_F(x) = ZMod.stdAddChar (Tr_{F/𝔽_p} x)`, that is
`e(Tr(x)/p)` with the trace read in `{0, …, p − 1}`, through `Algebra.trace (ZMod p) F` for the
algebra structure `ZMod.algebra F p`. Prove: the value formula
`ψ_F(x) = exp(2πi · (Tr x).val / p)`; `ψ_F ≠ 1` (`FiniteField.trace_to_zmod_nondegenerate`), hence
its primitivity by `AddChar.IsPrimitive.of_ne_one`; for `F = ZMod p`,
`stdAddChar (ZMod p) = ZMod.stdAddChar` (the trace of `ZMod p` over itself is the identity);
`ψ_F(−x) = conj (ψ_F x)` and `|ψ_F x| = 1`; `∑_x ψ_F(a x) = q·[a = 0]` (`AddChar.sum_mulShift`).
*Needs:* Mathlib.

The supporting API comprises:

- The trace character is primitive and specializes to `ZMod.stdAddChar` on prime fields.
- For every `x`, its value has norm one and its value at `−x` is the conjugate of its value at `x`.
- For every `a ∈ F`, its sum on the multiples `a x` is `q` if `a = 0` and zero otherwise.

**Checks.**

- (prime field) over `𝔽_7`, `ψ(1) = e(1/7)` and `ψ(3) = e(3/7)`; the definition with
  `exp(−2πi …)` gives `e(6/7)` at `x = 1` instead. For `ω(3) = e(1/6)`,
  `g(ω, ψ) = −2.440133 + 1.022619 i`, while `g(ω, ψ⁻¹) = 2.440133 − 1.022619 i`;
  this is `ω(−1) g(ω, ψ)`, not `conj(g(ω, ψ)) = −2.440133 − 1.022619 i`.
- (extension) over `𝔽_9 = 𝔽_3(i)`, `i² = −1`: `Tr(1) = 2` and `Tr(i) = i + i³ = 0`, so
  `ψ(1) = e(2/3)` and `ψ(i) = 1`; the kernel of `ψ_F` is the trace-zero line `{a i : a ∈ 𝔽_3}`,
  of size `q/p = 3`, so `ψ_F` is not injective although it is primitive.
- (characteristic two) over `𝔽_4`, `ψ(x) = (−1)^{Tr x}` is `−1` at the two roots of `x² + x + 1`
  and `1` at `0, 1`; `ψ ≠ 1`, and `∑_x ψ(x) = 1 + 1 − 1 − 1 = 0`.
- (orthogonality) over `𝔽_5` with `a = 2` the five values `e(0), e(2/5), e(4/5), e(1/5), e(3/5)`
  sum to `0`; at `a = 0` the sum is `5 = q`.

### 0.2 Every additive character is a shift of the canonical one

`a ↦ ψ_F.mulShift a` is a group isomorphism `(F, +) ≃ AddChar F ℂ`: injective by
`to_mulShift_inj_of_isPrimitive`, bijective by `AddChar.card_eq`. Consequently every nontrivial
additive character of `F` is primitive and equals `ψ_F.mulShift u` for a unique `u ≠ 0`
; in particular `FiniteField.primitiveChar_to_Complex F` is
`ψ_F.mulShift u` for a unique unit `u`, and `gaussSum χ (ψ_F.mulShift u) = χ(u)⁻¹ g(χ)`, so every
statement about `g(χ)` transfers to any primitive character up to a root of unity. The dual
orthogonality `∑_{ψ} ψ(x) = q·[x = 0]` is Mathlib's `AddChar.sum_apply_eq_ite`. *Needs:* 0.1.
The supporting API comprises:

- The shift map is an isomorphism from the additive group of `F` onto its additive characters.
- Nonzero parameters correspond exactly to nontrivial characters.
- The shifted Gauss sum at nonzero parameter `u` is `χ(u)⁻¹ g(χ)`.

**Checks.**

- Over `𝔽_3`, shift zero gives values `1,1,1`, the trivial additive character.
- Over `𝔽_3`, shifts one and two take different values `e(1/3),e(2/3)` at one, so the parameter is unique.
- Over `𝔽_9 = 𝔽_3(i)`, shift one has value one at `i` but value `e(2/3)` at one; primitivity does not mean pointwise injectivity.


### 0.3 The multiplicative character group

`MulChar F ℂ` is cyclic of order `q − 1` (`MulChar.equiv_rootsOfUnity` with `IsCyclic Fˣ`), and
finite (`MulChar.finite`; the `Fintype` instance `instFintypeMulChar` carries the sums over
characters below). Prove
the two orthogonality relations in the form the sums below use: `∑_{x ∈ F} χ(x) = (q − 1)[χ = 1]`
(Mathlib for `χ ≠ 1`, `sum_one_eq_card_units` for `χ = 1`) and `∑_{χ} χ(x) = (q − 1)[x = 1]` for
`x ∈ F` (zero for `x = 0` and for `x ≠ 0, 1`; Mathlib has the `ZMod n` case as
`DirichletCharacter.sum_characters_eq`), and the **power count**
`#{y ∈ F : y^d = c} = 1 + ∑_{χ^d = 1, χ ≠ 1} χ(c)` for every `c ∈ F` and every `d ∣ q − 1` (the
`1 +` is what makes the identity hold at `c = 0`, where every `χ(0)`, including `1(0)`, is `0`; for
`c ≠ 0` it is the usual `∑_{χ^d = 1} χ(c)`). Prove the **Fourier expansion on `F^×`**: for every
`φ : F → ℂ`, `φ(x) = (q − 1)⁻¹ ∑_χ χ(x) ∑_{y ∈ F} φ(y) χ(y)⁻¹` for `x ≠ 0`. Construct, for each
generator `γ` of `Fˣ` and each primitive `(q − 1)`-th root of unity `ζ ∈ ℂ`, the generator `ω_{γ,ζ}`
of the character group with `ω(γ) = ζ` (`MulChar.ofRootOfUnity`), prove `orderOf ω = q − 1`, that
every character is `ω^m` for a unique `m mod q − 1`, and that `ω^m` has order `(q − 1)/gcd(m, q−1)`.
Record `MulChar.exists_mulChar_orderOf` as the existence of characters of each order `d ∣ q − 1`
and `orderOf_dvd_card_sub_one` as the converse. *Needs:* Mathlib.

The supporting API comprises:

- For a generator of `F^×` and a primitive `(q − 1)`-th root of unity, the specified generator character has order `q − 1`.
- Each character is a unique power modulo `q − 1`; its order is `(q − 1)/gcd(m,q−1)` at exponent `m`.
- Both orthogonality formulas, the power count for `d ∣ q − 1`, and the Fourier expansion at nonzero arguments hold with zero extension at zero.

**Checks.**

- (generator) over `𝔽_7` with `γ = 3` and `ζ = e(1/6)`: `ω(3) = e(1/6)`, `ω(2) = ω(3²) = e(1/3)`,
  `ω(6) = ω(3³) = −1`; `ω` has order `6`, `ω³` takes the values `±1` and is the quadratic character
  (`ω³(3) = −1`, and `3` is a non-residue modulo `7`), `ω²` has order `3`.
- (power count) over `𝔽_7`, `d = 2`: `#{y : y² = 2} = 2 = 1 + η(2)` (`3² = 2`); `#{y : y² = 3} = 0
  = 1 + η(3)`; at `c = 0` the count is `1 = 1 + η(0)`, which the formula without the `1 +` gets wrong.
- (orthogonality) over `𝔽_7`, `∑_χ χ(2) = 0` (the six values `e(k/3)`, `k = 0, …, 5`, sum to zero)
  and `∑_χ χ(1) = 6`; `∑_χ χ(0) = 0`, not `6`.
- (Fourier) for the indicator `φ = [· = 1]` on `𝔽_7^×`, the expansion gives
  `φ(x) = (1/6) ∑_χ χ(x)`, which is `1` at `x = 1` and `0` at `x = 2, …, 6`.

### 0.4 The quadratic character and parity

Define `quadChar` by `η_F := (quadraticChar F).ringHomComp (Int.castRingHom ℂ)`.
Its API consists of the following facts.

- For odd characteristic, `η` is nontrivial and is the unique character of order two;
  `η² = 1`. In characteristic two it is the trivial multiplicative character.
- For odd characteristic, `η(x) = 1` exactly for nonzero squares, and the square-root
  count is `#{y : y² = x} = 1 + η(x)` (`quadraticChar_card_sqrts`).
- For odd characteristic, `η(−1) = (−1)^{(q−1)/2}` (`quadraticChar_neg_one`).
- For every multiplicative character, `χ(−1) = ±1`; it is `1` for odd character order
  (`val_neg_one_eq_one_of_odd_order`), and `(−1)^{(q−1)/orderOf χ}` for even order,
  by evaluating at a generator of `F^×`.

*Needs:* 0.3, Mathlib's quadratic-character API.

**Checks.**

- Over `𝔽_3`, `η(0) = 0`; the square-root count at zero is `1`, excluding a wrong value of one at zero.
- Over `𝔽_3`, `η(2) = −1` and two has no square root: `1 + η(2) = 0`, excluding the trivial character.
- Over `𝔽_7`, `η(−1) = η(6) = −1`, agreeing with `(−1)^3`; the wrong parity gives `1`.
- Over `𝔽_2`, `η = 1` as a multiplicative character: its values at `0,1` are `0,1`, not a character of order two.

### 0.5 Conjugation and the Galois action on character values

`star χ = χ⁻¹` and `|χ(x)| = 1` for `x ≠ 0` (Mathlib). Let `m = orderOf χ`. The values of `χ` lie
in `ℤ[ζ_m]` (`MulChar.apply_mem_algebraAdjoin`) and are powers of a primitive `m`-th root of unity
(`exists_apply_eq_pow`); prove that `χ(γ)` is itself a primitive `m`-th root of unity for every
generator `γ` of `F^×`, because `χ(γ)^k = 1` forces `χ^k = 1`. For a ring endomorphism `σ` of `ℂ`
with `σ(ζ_m) = ζ_m^t` for a primitive `m`-th root of unity `ζ_m`, prove `χ.ringHomComp σ = χ^t`
: both sides are characters of the cyclic group `F^×` and agree at `γ`.
Consequently the Galois conjugates of `χ`, its orbit under `Gal(ℚ(ζ_m)/ℚ)`, are exactly the
characters `χ^t` with `gcd(t, m) = 1`, the generators of the subgroup `⟨χ⟩`. *Needs:* 0.3, Mathlib.

**Checks.**

- (conjugation) over `𝔽_7` with `ω(3) = e(1/6)`: complex conjugation sends `ζ_6` to `ζ_6⁵`, and
  `ω.ringHomComp conj = ω⁵ = ω⁻¹`, which is `star_eq_inv`.
- (order three) for `χ = ω²` (`ζ_3 = e(1/3)`, conjugation sends it to `ζ_3²`),
  `χ.ringHomComp conj = χ² = χ⁻¹`; a definition returning `χ^{t⁻¹ mod m}` agrees here (`2⁻¹ ≡ 2`
  modulo `3`) but fails over `𝔽_11` for `χ` of order `5` and `σ : ζ_5 ↦ ζ_5²`, where
  `σ(χ(γ)) = ζ_5² = χ²(γ) ≠ χ³(γ)`.
- (real character) `η = ω³` has values `±1`, fixed by every `σ`: `η.ringHomComp σ = η = η^t` for
  every odd `t`, consistent with `gcd(t, 2) = 1`.
- (orbit) over `𝔽_7` the orbit of `ω` is `{ω, ω⁵}` and the orbit of `ω²` is `{ω², ω⁴}`; `ω³` and
  `1` are fixed; so the six characters fall into four Galois orbits.

### 0.6 Lifting characters to a finite extension

For a finite extension `E/F` of degree `n` define `χ.liftNorm : MulChar E ℂ := χ ∘ N_{E/F}` and
`ψ.liftTrace : AddChar E ℂ := ψ ∘ Tr_{E/F}` (`AddChar.compAddMonoidHom`). Prove: `N_{E/F}` and
`Tr_{E/F}` are surjective onto `F` (the norm because `E^×` is cyclic of order `q^n − 1` and
`N(x) = x^{(q^n−1)/(q−1)}`; the trace by nondegeneracy); hence `orderOf χ.liftNorm = orderOf χ`
, lifting is an injective group homomorphism `MulChar F ℂ →* MulChar E ℂ`
whose image is the subgroup of characters trivial on `ker N`, and
`(stdAddChar F).liftTrace = stdAddChar E` (transitivity of the trace). `η_F.liftNorm = η_E` when
`p ≠ 2`. The characters of `E^×` of order dividing `d ∣ q − 1` are exactly the lifts of those of
`F^×` . *Needs:* 0.1, 0.3, Mathlib.

The supporting API comprises:

- Norm lifting preserves order and is injective on the character group of the finite base field.
- For `d ∣ q − 1`, its image contains exactly the extension-field characters of order dividing `d` when restricted to the base characters of order dividing `d`.
- Trace lifting carries the canonical additive character to the canonical extension character; norm lifting carries the quadratic character to the quadratic character in odd characteristic.

**Checks.**

- (norm) `𝔽_3 ⊂ 𝔽_9`: `N(x) = x⁴`; a generator `g` of `𝔽_9^×` (order `8`) has `N(g) = g⁴ = −1`,
  the generator of `𝔽_3^×`, so the norm is onto; `N(i) = i⁴ = 1`.
- (quadratic) `η_3.liftNorm = η_9`: `η_9(i) = η_3(N i) = η_3(1) = 1`, and indeed `i = (1 − i)²` is a
  square in `𝔽_9`; `η_9(1 + i) = η_3(N(1 + i)) = η_3((1 + i)(1 − i)) = η_3(2) = −1`, and `1 + i` is
  a non-square (its order is `8`).
- (trace) `(stdAddChar 𝔽_3).liftTrace = stdAddChar 𝔽_9` at `x = 1`: `Tr_{𝔽_9/𝔽_3}(1) = 2`, both
  sides are `e(2/3)`; at `x = i` both are `1`.
- (orders) the lifts from `𝔽_3` to `𝔽_9` are the two characters of order dividing `2`; the
  character of `𝔽_9^×` of order `8` is not a lift, and `d = 8 ∤ q − 1 = 2`.
- (negative control) a definition composing `χ` with the map `x ↦ x^{q^n − 1}`, which is `1` on
  units, would make every lift trivial and `orderOf χ.liftNorm = 1`.

### 0.7 Characters of a product ring

For finite commutative rings `R₁, R₂`, `MulChar (R₁ × R₂) ℂ ≃* MulChar R₁ ℂ × MulChar R₂ ℂ`
(restriction along `x ↦ (x, 1)` and `y ↦ (1, y)`, which carry nonunits to nonunits) and
`AddChar (R₁ × R₂) ℂ ≃* AddChar R₁ ℂ × AddChar R₂ ℂ` (Mathlib's `AddChar` is a `CommGroup`
written multiplicatively). Transport across
`ZMod.chineseRemainder : ZMod (c₁ c₂) ≃+* ZMod c₁ × ZMod c₂` for coprime `c₁, c₂`: define the factor
characters `χ₁ := crtFactorLeft χ`, `χ₂ := crtFactorRight χ` of a Dirichlet character `χ` modulo
`c₁ c₂` by restricting `χ` along the two coordinate embeddings, prove `χ(x) = χ₁(x) χ₂(x)` (where
`χ_i(x)` reads `x` modulo `c_i`), and prove that `ZMod.stdAddChar (c₁ c₂)` corresponds to
`(ZMod.stdAddChar c₁).mulShift c̄₂ × (ZMod.stdAddChar c₂).mulShift c̄₁`, with `c̄₂ c₂ ≡ 1 (mod c₁)`
and `c̄₁ c₁ ≡ 1 (mod c₂)`. Prove that `χ` is primitive iff both factors are, and
`conductor χ = conductor χ₁ · conductor χ₂`. *Needs:* Mathlib.

The supporting API comprises:

- The two CRT factors recover the original multiplicative character by multiplying their values on the coordinate residues.
- The additive factors use the inverse-modulus shifts `c̄₂,c̄₁`.
- The conductor is the product of the conductors of the two factors, and primitivity is equivalent to primitivity of both factors.

**Checks.**

- (factors) `15 = 3 · 5`: for the quartic character `χ` modulo `5` (`χ(2) = i`) read modulo `15`
  through `changeLevel`, `crtFactorLeft χ = 1₃` and `crtFactorRight χ = χ`; at `x = 7 ↔ (1, 2)`,
  `χ(7) = 1 · i = i`, and reading `7` modulo `5` directly also gives `χ(2) = i`.
- (additive character) `c̄₂ = 5⁻¹ ≡ 2 (mod 3)` and `c̄₁ = 3⁻¹ ≡ 2 (mod 5)`; at `x = 1 ↔ (1, 1)`,
  `e(2/3) · e(2/5) = e(16/15) = e(1/15) = ψ_15(1)`. Without the inverses the product would be
  `e(1/3 + 1/5) = e(8/15) ≠ e(1/15)`.
- (conductor) the product of the Legendre symbol modulo `3` and a primitive character modulo `5`
  has conductor `15 = 3 · 5` and is primitive; `changeLevel` of a primitive character modulo `5`
  to modulus `15` has conductor `5 = 1 · 5` and is imprimitive, its left factor being `1₃`.
- (degenerate) `c₁ = 1`: `ZMod 1` is the zero ring, in which `0 = 1` is a unit, its only character
  is `1`, and `χ(x) = 1 · χ₂(x)`.

### Examples

Over `𝔽_7` with `γ = 3`: `ψ(x) = e(x/7)`; the characters are `ω^k`, `ω(3) = e(1/6)`, with
`ω³ = η = (·/7)`; the Galois orbits are `{1}, {ω³}, {ω, ω⁵}, {ω², ω⁴}`. Over `𝔽_9 ⊃ 𝔽_3`:
`ψ_9(i) = 1`, `ψ_9(1) = e(2/3)`, `η_9 = η_3 ∘ N` with `N(x) = x⁴`. Modulo `15`: the Chinese-remainder
factors of a character and the decomposition `ψ_15(x) = ψ_3(2 x₁) ψ_5(2 x₂)`.

### Dependencies

Mathlib's finite fields, `MulChar`, `AddChar`, `quadraticChar`, `Algebra.trace`, `Algebra.norm`,
`DirichletCharacter` and `ZMod.chineseRemainder`. Nothing from another roadmap; 0.7 is independent
of 0.1–0.6.

## Layer 1: Gauss sums

### 1.1 The definition of record and the trivial cases

`g(χ, ψ) = gaussSum χ ψ` and `g(χ) = gaussSum χ (stdAddChar F)` (`gauss χ`), with
`g_a(χ) = gaussSum χ (ψ_F.mulShift a)`. Record, as corollaries of Mathlib with `ψ_F` substituted:
`g(1) = −1` (`gaussSum_one_left` with `ψ_F ≠ 1`); `gaussSum χ 1 = 0` for `χ ≠ 1`;
`gaussSum 1 1 = q − 1`; `g_a(χ) = χ(a)⁻¹ g(χ)` for `a ≠ 0` (`gaussSum_mulShift`);
`g_0(χ) = (q − 1)[χ = 1]`; `g(χ, ψ⁻¹) = χ(−1) g(χ, ψ)` (`mul_gaussSum_inv_eq_gaussSum`); and the
sum over all shifts `∑_a g_a(χ) = 0` for `χ ≠ 1` (swap the sums). *Needs:* 0.1, Mathlib.
The supporting API comprises:

- With the canonical additive character, the trivial multiplicative character has Gauss sum `−1`.
- The trivial additive character gives zero for a nontrivial multiplicative character and `q − 1` for the trivial one.
- Nonzero shifts multiply by `χ(a)⁻¹`; the zero shift is `(q − 1)[χ = 1]`.

**Checks.**

- Over `𝔽_3`, `g(1) = e(1/3) + e(2/3) = −1`, not zero.
- Over `𝔽_3`, the quadratic character with trivial additive character gives `1 − 1 = 0`; the two trivial characters give `2`.
- Over `𝔽_3`, the quadratic sum is `i√3`; shift two gives `−i√3`, while shift zero gives `0`.


### 1.2 Absolute value and conjugation

For `χ ≠ 1`: `g(χ) g(χ⁻¹) = χ(−1) q` (`gaussSum_mul_gaussSum_eq_card` and 1.1), `|g(χ)| = √q`
(through `star_gaussSum_eq`), `conj g(χ) = χ(−1) g(χ⁻¹)`, `g(χ) ≠ 0`, and
`g(χ)⁻¹ = χ(−1) g(χ⁻¹)/q`. For `χ = 1`, `|g(1)| = 1`. A **boundary check**: `|g(χ, ψ)| = √q` for
every nontrivial `ψ` (0.2), and `|gaussSum χ 1| = 0`: the primitivity hypothesis in
`gaussSum_mul_gaussSum_eq_card` is not decorative. *Needs:* 1.1, 0.2.

### 1.3 The field of definition and the Galois action

Let `m = orderOf χ`. `g(χ)` is an algebraic integer of `ℚ(ζ_m, ζ_p) = ℚ(ζ_{mp})` (its terms are
products of roots of unity), and the Galois group acts by: `σ_c : ζ_p ↦ ζ_p^c, ζ_m ↦ ζ_m` sends
`g(χ)` to `g_c(χ) = χ(c)⁻¹ g(χ)` for `c ∈ (ℤ/p)^×` read in `𝔽_p ⊆ F` (the identity of sums
`∑_x χ(x) ψ_F(x)^c = ∑_x χ(x) ψ_F(c x)`, which is `g_c(χ)`); `τ_t : ζ_m ↦ ζ_m^t, ζ_p ↦ ζ_p` sends
`g(χ)` to `g(χ^t)` for `t ∈ (ℤ/m)^×` (0.5). Hence `g(χ)^m ∈ ℤ[ζ_m]` (`gauss_pow_orderOf_mem`:
fixed by all `σ_c`), `g(χ)^m` is the classical arithmetic roadmap's `Φ(P)` when `χ` is the inverse
power residue character of 1.47 there, and `τ_t(g(χ)^m) = g(χ^t)^m`: conjugate algebraic integers
of the same absolute value `q^{m/2}` when `χ ≠ 1` (for `χ = 1`, `m = 1` and the value is `−1`,
of absolute value `1`) whose quotient is not a unit in general (for `q = 7`, `m = 3`,
`g(χ)³/g(χ²)³ = π/π̄` for the prime `π` of norm `7`). Prove also the **Frobenius invariance**
`g(χ^p) = g(χ)`: `x ↦ x^p` permutes `F` and `Tr(x^p) = Tr(x)`. *Needs:* 1.1, 0.5, Mathlib's
cyclotomic fields. (The `p`-adic refinement of this factorization, the Gross–Koblitz evaluation,
is 6.5.)

### 1.4 Quadratic Gauss sums over the prime field

For `p ≠ 2`: `g(η)² = η(−1) q` (`gaussSum_sq` with the primitivity proved in 0.1). For `F = ZMod p`:
`g(η_p) = ∑_{r mod p} e(r²/p)` (4.19 (iii) of the classical arithmetic roadmap,
`quadraticExpSum_one_eq_gaussSum`, read against `ZMod.stdAddChar`, which is `ψ_{ZMod p}` by 0.1).
The **sign** is consumed from `AnalyticNumberTheoryPartI` §2.30 (ii): for the fundamental
discriminant `D = (−1)^{(p−1)/2} p`, whose primitive quadratic character `ε_D` of conductor `p` is
the Legendre symbol `η_p` (the unique primitive quadratic character modulo an odd prime; prove this
identification here), `∑_{n mod p} ε_D(n) e(n/p) = κ(D) √p` with `κ(D) = 1` for `D > 0`, that is
`p ≡ 1 (mod 4)`, and `κ(D) = i` for `D < 0`, that is `p ≡ 3 (mod 4)`. Hence **`g(η_p) = ε_p √p`**:
`√p` for `p ≡ 1 (mod 4)` and `i√p` for `p ≡ 3 (mod 4)`. This roadmap proves no sign over the prime
field; the sign over `𝔽_q` for `f > 1` is 3.3, derived from this one. *Needs:* 1.2, the classical
arithmetic roadmap 4.19, `AnalyticNumberTheoryPartI` §2.30.

### 1.5 Gauss sums of characters of small order

Record the consequences of `gaussSum_pow_eq_prod_jacobiSum` in the shape the worked examples use:
for `orderOf χ = 3`, `g(χ)³ = q J(χ, χ)` (classical arithmetic 1.19); for `orderOf χ = 4`,
`g(χ)⁴ = q J(χ, χ)²` and `g(χ)² = J(χ, χ) g(η)` (`jacobiSum_mul_nontrivial`); for `orderOf χ = 6`,
`g(χ)⁶ = χ(−1) q ∏_{i=1}^{4} J(χ, χ^i)` with `χ(−1) = (−1)^{(q−1)/6}` by 0.4: `−1` for `q = 7`,
`+1` for `q = 13`. The identification of `J(χ, χ)` with a primary prime for the residue characters
of `ℤ[ω]` and `ℤ[i]` (exactly `π` in the cubic case, `−χ(−1) π` in the quartic case) is classical
arithmetic 1.53 and 1.36, consumed in the worked examples and not reproved. *Needs:* 1.1 and
Mathlib's `gaussSum_pow_eq_prod_jacobiSum`; nothing from Layer 2 is needed.

### Examples

Over `𝔽_7`: `g(1) = −1`; for `ω` of order `6` with `ω(3) = e(1/6)`, `g(ω) = −2.4401 + 1.0226 i`
with `|g(ω)|² = 7`, `g_2(ω) = ω(2)⁻¹ g(ω) = 2.1057 + 1.6019 i`, `g(ω⁷) = g(ω)` (Frobenius
invariance at `p = 7`, trivially), and `g(ω)⁶ = −7 ∏_{i=1}^{4} J(ω, ω^i)`. The quadratic Gauss sums
`g(η_3) = i√3`, `g(η_5) = √5`, `g(η_7) = i√7`, `g(η_11) = i√11` are the consumed signs of 1.4.

### Dependencies

Layer 0 (0.1, 0.2, 0.5); Mathlib's `GaussSum.lean` and cyclotomic fields; the classical
arithmetic roadmap's 4.19 and `AnalyticNumberTheoryPartI` §2.30 for 1.4.

## Layer 2: Jacobi and Jacobsthal sums

### 2.1 Jacobi sums: the trivial cases and symmetry

`J(χ, ψ) = jacobiSum χ ψ`. Record from Mathlib: `J(χ, ψ) = J(ψ, χ)`; `J(1, 1) = q − 2`;
`J(1, χ) = −1` for `χ ≠ 1`; `J(χ, χ⁻¹) = −χ(−1)` for `χ ≠ 1`. Prove the shift forms the point
counts use: `∑_x χ(x) ψ(c − x) = χψ(c) J(χ, ψ)` for `c ≠ 0`, `∑_x χ(x) ψ(−x) = χ(−1)(q − 1)[χψ = 1]`,
and `∑_x χ(x) ψ(a − b x) = χ(b)⁻¹ χψ(a) J(χ, ψ)` for `a ≠ 0`, `b ≠ 0`. *Needs:* Mathlib.

### 2.2 The Gauss–Jacobi relation, absolute value and integrality

For `χ, ψ ≠ 1`, `χψ ≠ 1`: `J(χ, ψ) = g(χ) g(ψ) / g(χψ)` (Mathlib), `|J(χ, ψ)| = √q`
(from 1.2), `J(χ, ψ) J(χ⁻¹, ψ⁻¹) = q`, `conj J(χ, ψ) = J(χ⁻¹, ψ⁻¹)`, and
`J(χ, ψ) ∈ ℤ[ζ_m]` for `m` the lcm of the orders (`jacobiSum_mem_algebraAdjoin_of_pow_eq_one`).
For `χ, ψ ≠ 1` with `χψ = 1` the value is `−χ(−1)`, of absolute value `1`; this is the **boundary
check** on the hypothesis `χψ ≠ 1`. *Needs:* 1.2, Mathlib.

### 2.3 Powers of Gauss sums and the two-squares theorem

Restate `gaussSum_pow_eq_prod_jacobiSum` against `ψ_F` and deduce: for `q = p ≡ 1 (mod 4)` and `χ`
of order `4`, `J(χ, χ) = a + b i ∈ ℤ[i]` with `a² + b² = p` (2.2), and `a` is odd and `b` even
(`J(χ, χ) ≡ χ(4)⁻¹ = χ(−1) (mod 2)`: the terms `x` and `1 − x` of `∑_x χ(x(1 − x))` agree and pair
off, leaving the fixed point `x = 1/2`); for `q = p ≡ 1 (mod 3)` and `χ` of order `3`,
`J(χ, χ) = a + b ω ∈ ℤ[ω]` with `a² − ab + b² = p`. The normalizations
`J(χ, χ) = −(−1)^{(p−1)/4} π` and `J(χ, χ) = π` for the residue characters of a primary `π` are the
classical arithmetic roadmap's 1.36 and 1.53. *Needs:* 2.2, 1.5.

### 2.4 Multiple Jacobi sums and diagonal equations

Define `J(χ₁, …, χ_r) = ∑_{x₁ + ⋯ + x_r = 1} ∏ χ_i(x_i)` (`multiJacobiSum`) and
`J₀(χ₁, …, χ_r) = ∑_{x₁ + ⋯ + x_r = 0} ∏ χ_i(x_i)` for `r ≥ 0` (finite sums over the fibres of
`x ↦ ∑ x_i`; `r = 2` recovers `jacobiSum`). Prove: `J₀ = 0` if the product `∏χ_i ≠ 1` and
`J₀ = χ_r(−1)(q − 1) J(χ₁, …, χ_{r−1})` if `∏χ_i = 1` and `r ≥ 1`;
`J(χ₁, …, χ_r) = g(χ₁)⋯g(χ_r) / g(∏χ_i)` if all `χ_i ≠ 1` and `∏χ_i ≠ 1`
(`multiJacobiSum_eq_prod_gauss_div`), and `J(χ₁, …, χ_r) = −χ_r(−1) J(χ₁, …, χ_{r−1})` if all
`χ_i ≠ 1`, `∏χ_i = 1` and `r ≥ 1`; hence `|J(χ₁, …, χ_r)| = q^{(r−1)/2}` in the first case and `q^{(r−2)/2}`
in the second, with `r ≥ 1` in both norm assertions. Deduce the **number of solutions of a diagonal equation**: for `r ≥ 1`, `a_i ∈ F^×`,
`d_i ∣ q − 1` and `b ∈ F`, `#{x ∈ F^r : ∑ a_i x_i^{d_i} = b} = q^{r−1} + ∑ ∏χ_i(a_i)⁻¹ · (J or J₀ term)`
over the tuples of characters `χ_i ≠ 1` with `χ_i^{d_i} = 1` (the `J` term, times `∏χ_i(b)`, for
`b ≠ 0`; the `J₀` term for `b = 0`), and the bound `|N − q^{r−1}| ≤ ∏(d_i − 1) · q^{(r−1)/2}` for
`r ≥ 1` and `b ≠ 0` (`card_diagonal_sub_le`; Ireland–Rosen Ch. 8 §7 and Ch. 10 §3). *Needs:* 2.2, 0.3 (the
power count `#{y : y^d = c} = 1 + ∑_{χ^d = 1, χ ≠ 1} χ(c)`; the tuples with a trivial entry
contribute `q^{r−1}` and `0`, the all-nontrivial tuples the Jacobi sums).

The supporting API comprises:

- The sums on fibres of one and zero specialize at two entries to the ordinary Jacobi sum and its zero-fibre counterpart.
- For nonempty families the product character determines the recursion and the two norm formulas with their stated nontriviality hypotheses.
- For `r ≥ 1`, the character expansion counts diagonal solutions and yields `card_diagonal_sub_le` when `b ≠ 0`.

**Checks.**

- (`r = 2`) over `𝔽_7` with `ω(3) = e(1/6)`, `J(ω, ω) = 3 − ζ_6 = 2.5 − 0.8660 i`, the same value as
  Mathlib's `jacobiSum ω ω`, of absolute value `√7`.
- (`r = 1` and `r = 0`) `J(χ₁) = χ₁(1) = 1` for every `χ₁`, which is `g(χ₁)/g(χ₁)` when `χ₁ ≠ 1`;
  `J₀(χ₁) = χ₁(0) = 0`; the empty sums are `J() = 0` (no empty tuple sums to `1`) and `J₀() = 1`,
  so the recursion `J₀(1) = 1(−1)(q − 1) J() = 0` agrees with `J₀(1) = 1(0) = 0`.
- (`r = 3`, trivial product) over `𝔽_7` with the cubic character `χ = ω²`:
  `J(χ, χ, χ) = −χ(−1) J(χ, χ) = −(0.5 − 2.5981 i) = −0.5 + 2.5981 i`, of absolute value
  `√7 = q^{(3−2)/2}`; with `(χ, χ, χ⁻¹)` the product is `χ ≠ 1` and
  `J = g(χ) g(χ) g(χ⁻¹)/g(χ) = χ(−1) q = 7`, which is `q^{(3−1)/2}`.
- (empty diagonal equation) at `r = 0`, `b = 1` the count is `0`; no nonempty-family
  baseline applies. At `r = 1`, `d₁ = 1`, `a₁ = b = 1`, the count is `1`, the baseline is `1`,
  and the error bound is `0`.
- (diagonal count) `x² + y² = 1` over `𝔽_7` has `8` solutions: `q^{r−1} + J(η, η) = 7 − η(−1) = 8`,
  and `|8 − 7| ≤ 1 · 1 · √7`; `x² + y² = 0` has the single solution `(0, 0)`:
  `7 + J₀(η, η) = 7 + η(−1)(q − 1) J(η) = 7 − 6 = 1`, where a definition dropping the `J₀` branch
  would predict `7`.

### 2.5 Jacobsthal sums

For `p ≠ 2` and `n ≥ 0` define `φ_n(a) = ∑_{x ∈ F} η(x) η(x^n + a)` (`jacobsthalPhi`) and
`ψ_n(a) = ∑_{x ∈ F} η(x^n + a)` (`jacobsthalPsi`). Prove, for `n ≥ 1` and `a ≠ 0`:
`ψ_n(a) = η(a) ∑_{χ^n = 1, χ ≠ 1} χ(−a) J(χ, η)` (`jacobsthalPsi_eq_sum_jacobiSum`; from
`#{x : x^n = y} = ∑_{χ^n=1} χ(y)` for `y ≠ 0`, the term `x = 0` contributing `η(a)`, and 2.1), and
`φ_n(a) = η(a) ∑_{χ^n = η} χ(−a) J(χ, η)` (`jacobsthalPhi_eq_sum_jacobiSum`), the sum over the
characters `χ` with `χ^n = η`, which is empty, so `φ_n(a) = 0`, unless `η` is trivial on the `n`-th
roots of unity of `F` (from `∑_{x^n = y} η(x) = ∑_{χ^n = η} χ(y)`). Record the closed forms:
`ψ_2(a) = −1` for `a ≠ 0`, `φ_1(a) = −1`, and `φ_2(a s²) = η(s) φ_2(a)`. **Jacobsthal's theorem**
(`F = ZMod p`, `p ≡ 1 (mod 4)`): `φ_2(1) = −2a` where `p = a² + b²` with `a ≡ 1 (mod 4)` (this pins
the sign of `a`; `jacobsthalPhi_two_one`), and `φ_2(r) = ±2b` for every non-square `r`. **Elliptic
reading**: `η(x³ + a x) = η(x) η(x² + a)`, so `∑_x η(x³ + a x) = φ_2(a)` and the projective point
count of `y² = x³ + a x` is `q + 1 + φ_2(a)`, its trace `−φ_2(a)`, by the character-sum count of
`EllipticLegendreCharacterInterfaces` 5.1; the vanishing `φ_2(a) = 0` for `η(−1) = −1` is that
roadmap's `symmetric_cubic_trace_zero` (count `q + 1`, trace `0` for `q ≡ 3 (mod 4)`). *Needs:*
2.2, 2.3, 0.4; `EllipticLegendreCharacterInterfaces` 5.1 for the elliptic reading.

The supporting API comprises:

- For `n ≥ 1` and `a ≠ 0`, the two sums have the stated Jacobi expansions.
- For `a ≠ 0`, the closed forms are `ψ_2(a) = −1` and `φ_1(a) = −1`; scaling `a` by `s²` scales `φ_2(a)` by `η(s)`, including `s = 0` when both sides vanish.
- At primes congruent to one modulo four, the signed two-squares evaluation is `jacobsthalPhi_two_one`.

**Checks.**

- (zero exponent) over `𝔽_3`, `ψ_0(1) = 3η(2) = −3`, whereas the proposed
  Jacobi expansion would give `−1`; at `n = 1` both sides are `0`. Thus the expansion
  requires positive exponent even though the sum is defined at zero.
- (`p = 5`) `φ_2(1) = −2`, `φ_2(2) = −4`, `ψ_2(1) = −1`; `5 = 1² + 2²` with `a = 1 ≡ 1 (mod 4)`,
  so `φ_2(1) = −2a` and `φ_2(2) = −2b`.
- (sign of `a`) `p = 13 = (−3)² + 2²` with `a = −3 ≡ 1 (mod 4)`: `φ_2(1) = 6 = −2a`; a statement
  with `a = 3` or with `+2a` predicts `−6`. The values at `p = 17, 29, 37, 41` are `−2, −10, −2, −10`
  with `a = 1, 5, 1, 5`.
- (scaling) over `𝔽_5`, `φ_2(4) = φ_2(1 · 2²) = η(2) φ_2(1) = 2`: the four terms are
  `0, 1, 1, 0`.
- (vanishing) over `𝔽_7`, where `η(−1) = −1`, `φ_2(1) = 0`, and `y² = x³ + x` has `8 = q + 1`
  projective points; over `𝔽_5` and `𝔽_13` the counts are `4 = 6 − 2` and `20 = 14 + 6`.
- (degenerate) `φ_n(0) = ∑_x η(x) η(x^n) = ∑_x η(x)^{n+1}`, which is `q − 1` for `n` odd and `0`
  for `n` even; the Jacobi-sum expansion is stated for `a ≠ 0` only.

### Examples

Over `𝔽_7` with `ω(3) = e(1/6)`: `J(ω, 1) = −1`, `J(ω, ω) = 2.5 − 0.8660 i`,
`J(ω², ω²) = −1 − 3 e(1/3) = 0.5 − 2.5981 i` (the primary prime of norm `7` of classical arithmetic
1.53), `J(η, η) = 1`, `J(ω, ω⁵) = −ω(−1) = 1`. Over `𝔽_5` with `χ(2) = i`: `J(χ, χ) = −1 − 2i`,
`5 = 1 + 4`. Jacobsthal: `φ_2(1) = −2, 0, 6` over `𝔽_5, 𝔽_7, 𝔽_13`.

### Dependencies

Layer 1 (1.2, 1.5) and Layer 0 (0.3, 0.4); Mathlib's `JacobiSum/Basic.lean`;
`EllipticLegendreCharacterInterfaces` 5.1 for the elliptic reading of 2.5 only.

## Layer 3: the polynomial `L`-series and the Hasse–Davenport relations

This layer isolates one piece of machinery, the `L`-series of a multiplicative function on monic
polynomials, and uses it three times here and twice more in Layers 4 and 5. Its content is
Ireland–Rosen's proof of the Hasse–Davenport relation (Ch. 11 §4) written once, generically.

### 3.1 The `L`-series of a multiplicative function on monic polynomials

For `λ : F[X] → ℂ` with `λ(1) = 1` and `λ(g h) = λ(g) λ(h)` for monic `g, h`
(`IsMonicMultiplicative λ`; the values off monic polynomials are irrelevant), define
`L(λ, T) = ∑_{d ≥ 0} (∑_{g monic, deg g = d} λ(g)) T^d ∈ ℂ⟦T⟧` (`lSeries`), the coefficient sums
being over the `q^d` monic polynomials `X^d + ∑_{i<d} c_i X^i` indexed by `c : Fin d → F`
(`monicOfCoeffs c`). Prove the **Euler product**
`L(λ, T) = ∏_{P monic irreducible} (1 − λ(P) T^{deg P})⁻¹` as an identity of power series: a
`tprod` over the monic irreducibles in Mathlib's `PowerSeries.WithPiTopology`, the family being
multipliable because each degree has finitely many irreducibles (unique factorization in `F[X]`,
with the finite partial products converging coefficientwise), and the **logarithmic
derivative identity** `T · L'(λ, T) / L(λ, T) = ∑_{n ≥ 1} S_n(λ) T^n` with
`S_n(λ) = ∑_{P} deg P · λ(P)^{n / deg P}` over the monic irreducibles of degree dividing `n`.
Prove the **polynomial criterion**: if `∑_{deg g = d} λ(g) = 0` for all
`d ≥ d₀`, then `L(λ, T)` is a polynomial of degree `< d₀` (the zero polynomial, of degree `−∞`,
when `d₀ = 0`). *Needs:* Mathlib's `Polynomial`, `PowerSeries`, `UniqueFactorizationMonoid`.

The supporting API comprises:

- The coefficient in degree `d` is the sum over the monic polynomials parametrized by `monicOfCoeffs`; degree zero contributes `λ(1)`.
- For monic multiplicative `λ`, the constant coefficient is one and unique factorization gives the Euler product.
- The logarithmic derivative has the stated irreducible-polynomial coefficients; vanishing coefficient sums from `d₀` on imply degree less than `d₀`.

**Checks.**

- (the zeta function) `λ = 1`: `L(1, T) = ∑_d q^d T^d = (1 − qT)⁻¹`, the Euler product is
  `∏_P (1 − T^{deg P})⁻¹`, and `S_n(1) = ∑_{deg P ∣ n} deg P = q^n`, the number of elements of
  `𝔽_{q^n}`.
- (degree zero) `monicOfCoeffs` at `d = 0` is the constant `1`, the coefficient sum of degree `0`
  is `λ(1) = 1`, and `L(λ, T)` has constant term `1`; a definition summing over all polynomials of
  degree `d`, monic or not, would give `(q − 1) q^d` terms and constant term `q − 1`.
- (not multiplicative) `λ(g) = deg g` is additive, not monic multiplicative (`λ(1) = 0`);
  `λ(g) = q^{−deg g}` is monic multiplicative with `L(λ, T) = (1 − T)⁻¹`, whose coefficient sums
  are all `1`: the polynomial criterion does not apply and `L` is not a polynomial.
- (criterion at the boundary) for the `λ` of 3.3 with `χ ≠ 1`, `ψ ≠ 1` the coefficient sums vanish
  from `d₀ = 2` on and `L(λ, T) = 1 + g(χ, ψ) T` has degree `1 < 2`; with `χ = ψ = 1` the degree-`d`
  sum is `(q − 1)q^{d−1}` for `d ≥ 1` and `L = (1 − T)/(1 − qT)`: over `𝔽_3`
  the expansion begins `1 + 2T + 6T²`. Polynomials with zero constant coefficient contribute zero.

### 3.2 Lifted sums and the root-power identity

For `E/F` of degree `n`, prove `S_n(λ) = ∑_{α ∈ E} λ(minpoly F α)^{n / deg(minpoly F α)}`: the monic
irreducibles of degree `d ∣ n` are exactly the minimal polynomials of the elements of `E` of degree
`d`, each with `d` roots in `E` (`X^{q^n} − X` splits in `E` with simple roots and is the product of
those irreducibles). Call the right side `extensionSum E λ`. Prove the **root-power identity**
(`extensionSum_eq_neg_sum_pow`): if `L(λ, T) = ∏_{i<k} (1 − ω_i T)` then `S_n(λ) = −∑_{i<k} ω_i^n`
for every `n ≥ 1`. *Needs:* 3.1, Mathlib's finite-field splitting lemmas.

The supporting API comprises:

- The element sum equals the sum over irreducibles with degree dividing the extension degree, counted with their degrees.
- For the identity extension it is the degree-one coefficient of the `L`-series.
- If the `L`-series is a product of linear factors, `extensionSum_eq_neg_sum_pow` gives the negative sum of reciprocal-root powers.

**Checks.**

- (`E = F`) `extensionSum F λ = ∑_{α ∈ F} λ(X − α)`, the coefficient sum of degree `1`; for the
  `λ` of 3.3 it is `g(χ, ψ)`.
- (`λ = 1`) `extensionSum E 1 = |E| = q^n`, in agreement with `S_n(1) = q^n` from the logarithmic
  derivative of `(1 − qT)⁻¹`; the root-power identity does not apply, `(1 − qT)⁻¹` being no
  polynomial, and indeed `q^n ≠ −q^n`.
- (one root) `L = 1 − ωT` with `ω = −g(χ, ψ)`: `S_n = −(−g)^n`, which is the Hasse–Davenport
  relation once `S_n` is identified with `g(χ ∘ N, ψ ∘ Tr)` (3.3).
- (two roots) the Kloosterman polynomial `1 − T + 3T²` of `𝔽_3`, `a = b = 1` (5.4):
  `ω₁ + ω₂ = 1`, `ω₁ ω₂ = 3`, so `S_2 = −(ω₁² + ω₂²) = −(1 − 6) = 5`, the value `K_9(1, 1) = 5`
  computed directly over `𝔽_9`.
- (`k = 0`) `L = 1` means every coefficient sum of positive degree vanishes, and the identity reads
  `S_n = 0`; for the `λ` of 3.3 with `ψ = 1 ≠ χ` this is `∑_{α ∈ E} χ(N α) = 0`.

### 3.3 The Hasse–Davenport lifting relation

For `χ : MulChar F ℂ`, `ψ : AddChar F ℂ` put `λ(g) = χ((−1)^d c_0) ψ(−c_{d−1})` for
`g = X^d + c_{d−1} X^{d−1} + ⋯ + c_0`, that is `λ(g) = χ(∏ roots) ψ(∑ roots)`. It is monic
multiplicative, `∑_{deg g = 1} λ(g) = g(χ, ψ)`, and
`∑_{deg g = d} λ(g) = (∑_c ψ(c)) (∑_c χ(c)) q^{d−2} = 0` for `d ≥ 2` when `χ ≠ 1` and `ψ ≠ 1`; so
`L(λ, T) = 1 + g(χ, ψ) T` and, since `λ(minpoly α)^{n/deg α} = χ(N_{E/F} α) ψ(Tr_{E/F} α)`, 3.2
gives the **Hasse–Davenport relation** (`hasseDavenport_lift`)
`g(χ.liftNorm, ψ.liftTrace) = −(−g(χ, ψ))^n`, i.e. `−g' = (−g)^n`, for `χ ≠ 1`, `ψ ≠ 1`. Record the
degenerate cases separately: for `χ = 1`, `ψ ≠ 1` the relation holds as well, both sides being `−1`
(`L(λ, T) = 1 − T`); for `ψ = 1`, `χ ≠ 1` both sides vanish (`L(λ, T) = 1`); for `χ = 1 = ψ` it fails
(`g = q − 1`, `g' = q^n − 1`), so the relation carries the hypothesis `χ ≠ 1 ∨ ψ ≠ 1`.
**Corollary (the sign of the quadratic Gauss sum over `𝔽_q`)** (`gauss_quadChar_eq`): for `p ≠ 2`,
`q = p^f`, `g(η_F) = (−1)^{f−1} (ε_p √p)^f`, from the consumed prime-field sign 1.4 and
`η_{𝔽_p}.liftNorm = η_F` (0.6); so `g(η) = 3` for `𝔽_9`, `−5` for `𝔽_25`, `−3√3 i` for `𝔽_27`,
`7` for `𝔽_49`. *Needs:* 3.2, 1.4, 0.6. (Ireland–Rosen Ch. 11 §4, Theorem 1; Lidl–Niederreiter
Ch. 5 §5.2.)
The supporting API comprises:

- Set `λ(1) = 1`; for positive degree the constant and next-to-leading coefficients give the displayed formula, which is monic multiplicative.
- The degree-one coefficient is the Gauss sum; every coefficient in degree at least two vanishes if at least one character is nontrivial.
- The lifted element sum is the Gauss sum of the norm and trace lifts, giving `hasseDavenport_lift` with its minus sign.

**Checks.**

- For `g = 1`, empty root product and sum give `λ(1) = χ(1)ψ(0) = 1`; the positive-degree coefficient formula is not used at degree zero.
- For two trivial characters over `𝔽_3`, the first coefficients are `1,2,6`; polynomials divisible by `X` have value zero.
- For the quadratic and canonical additive characters over `𝔽_3`, `L = 1 + i√3 T`; the degree-two lift is `3 = −(i√3)²`.


### 3.4 The Hasse–Davenport product formula

Specialize the product relation in the supplier contract to `ψ_F`. For `p ≠ 2`, its case
`m = 2` gives the duplication consequence `g(χ) g(χη) = χ(4)⁻¹ g(χ²) g(η)`, equivalently
`g(χ²) = χ(4) g(χ) g(χη) / g(η)`; the denominator is nonzero by 1.2.
This consequence applies to every `χ`, including `χ² = 1`. It is the form used to reduce
finite hypergeometric Gauss products (Beukers–Cohen–Mellit, arXiv:1505.02900v2,
Theorem 1.3, p. 3; Conrad, Appendix (A.6), p. 19).
*Needs:* `ClassicalArithmeticCompletion` §7.29, 0.4, 1.2.

**Checks.**

- (`q = 13`, `m = 3`) with `χ = ω` of order `12` and `λ = ω⁴`, both sides equal
  `−44.8610 + 13.5828 i`; with `χ = ω²` both equal `46.8722`.
- (`m = 1`) `λ = 1`: both sides are `g(χ)`, the right side being `χ(1)⁻¹ g(χ)` times an empty
  product.
- (`χ^m = 1`) over `𝔽_7` with `λ` of order `3` and `χ = λ⁻¹`: the left side is
  `g(λ⁻¹) g(1) g(λ) = −λ(−1) · 7 = −7` and the right side is `λ⁻¹(3)^{−3} g(1) g(λ) g(λ²) = −7`,
  since `λ(3)³ = 1` and `g(λ) g(λ²) = g(λ) g(λ⁻¹) = 7`.
- (duplication) over `𝔽_13` with `ω` of order `12`, `g(ω²) = ω(4) g(ω) g(ωη)/g(η) = 3.0991 + 1.8427 i`
  with `g(η_13) = √13`; dropping the factor `ω(4)` gives a value of the same modulus and a
  different argument.

### 3.5 Lifting Jacobi sums

For `χ, ψ ≠ 1` with `χψ ≠ 1` and `E/F` of degree `n`: `−J(χ.liftNorm, ψ.liftNorm) = (−J(χ, ψ))^n`
(`jacobiSum_lift`), from 2.2 and 3.3 applied to `χ`, `ψ`, `χψ`; and for `χψ = 1` the same
relation holds, since then `J(χ', ψ') = −χ'(−1) = −χ(−1)^n` and `−(−J(χ, ψ))^n = −χ(−1)^n`. Hence
`|J(χ', ψ')| = q^{n/2}` when `χψ ≠ 1`, and `|J(χ', ψ')| = 1` when `χψ = 1`.
For the quadratic character over `𝔽_3` lifted to `𝔽_9`, the sum is `−1`, of norm `1`,
not `3`; for an order-six character over `𝔽_7` paired with itself and lifted to `𝔽_49`,
the norm is `7`. *Needs:* 3.3, 2.2.

### 3.6 The trace-function interpretation, owned downstream

Every `L`-series that this roadmap proves to be a polynomial is the `L`-function of a
constructible sheaf of rank at most one on the affine line, and its reciprocal roots are
geometric-Frobenius eigenvalues on compactly supported cohomology. That statement is a bridge
theorem owned downstream by `WeilConjectures`, Layer WC.1, where the `L`-functions of sheaves and
complexes over a finite field are formed beside its zeta series. It is recorded here to fix one
normalization on both sides; no statement of this roadmap depends on it, and the elementary
bounds of Layers 4–5 stay the route of record here and an independent check on the
cohomological ones.

The statement. Fix a prime `ℓ ≠ p`, a finite extension `M_ℓ` of `ℚ_ℓ` containing the `p(q − 1)`-th
roots of unity, and a field embedding `ι_ℓ : M_ℓ → ℂ`. For a constructible `M_ℓ`-sheaf `𝒦` on `𝔸¹_F`
and a closed point, that is a monic irreducible `P ∈ F[X]`, let `t_𝒦(P)` be the trace of
geometric Frobenius on the geometric stalk of `𝒦` at `P`. If every geometric stalk of `𝒦` has
rank at most one and `λ` is monic multiplicative with `λ(P) = ι_ℓ(t_𝒦(P))` for every `P`, then
(i) `L(λ, T) = ι_ℓ(L(𝔸¹_F, 𝒦, T))`, Euler factor by Euler factor, both sides read as the `tprod`
of 3.1; (ii) by the rational Grothendieck–Lefschetz trace formula
(`InverseGaloisAndArithmeticFundamentalGroups` §IG.0.T3),
`L(λ, T) = ∏_{i=0}^{2} ι_ℓ det(1 − T·Frob | H^i_c(𝔸¹_{F̄}, 𝒦))^{(−1)^{i+1}}`, and for `E/F` of
degree `n`, `extensionSum E λ = ∑_i (−1)^i ι_ℓ tr(Frob^n | H^i_c(𝔸¹_{F̄}, 𝒦))`, `Frob` being
geometric Frobenius. With `ℒ_ψ` and `ℒ_χ` the Artin–Schreier and Kummer sheaves of *Not owned
here*, `j : 𝔾_m → 𝔸¹` the inclusion and `U_f` the complement of the zeros of `f`, the four
`L`-series of this roadmap are:

| `λ` | `𝒦` | Compactly supported cohomology |
|---|---|---|
| 3.3, `χ(∏ roots) ψ(∑ roots)` | `j_!(ℒ_χ ⊗ ℒ_ψ)` | only `H¹_c`, of rank `1`, when `ψ ≠ 1`; zero when `ψ = 1 ≠ χ` |
| 4.5, `mulCharResultant χ f` | `f^*ℒ_χ` on `U_f`, extended by zero | only `H¹_c`, of rank `m − 1`, when `f` is not `c h^{ord χ}` |
| 4.6, `addCharTrace ψ f` | `f^*ℒ_ψ` | only `H¹_c`, of rank `n − 1`, when `ψ ≠ 1` and `p ∤ n = deg f` |
| 5.4, `κ` | `j_!(ℒ_χ ⊗ ℒ_ψ(a x + b x⁻¹))` | only `H¹_c`, of rank `2`, for `a, b ∈ F^×` |

So in each case the `L`-polynomial is `ι_ℓ det(1 − T·Frob | H¹_c)` and its degree is the rank of
`H¹_c`: the bounds `≤ m − 1` of 4.5 and `≤ n − 1` of 4.6 are equalities, and the reciprocal roots
of 4.7, 4.8 and 5.4 are Frobenius eigenvalues. The ranks are Euler–Poincaré counts (the
`CongruenceSpectralGap` §4.2b formula): tame of rank one on `m` punctures for 4.5, Swan conductor
`n` at `∞` for 4.6, Swan conductor `1` at each of `0` and `∞` for 5.4; `H²_c` vanishes because the
geometric monodromy is nontrivial, which is the hypothesis on `f` or on `ψ`. Deligne's weight
bound on `H¹_c` (`DeligneWeightsAndPurity`) then gives `|ω_i| ≤ √q` again, the inequalities that
4.7, 4.8 and 5.5 prove by Stepanov's method. (Deligne, SGA 4½, *Sommes trigonométriques*; Katz,
*Gauss Sums, Kloosterman Sums, and Monodromy Groups*, Ch. 4.)

**Checks.**

- (Gauss sum over `𝔽_3`) `χ = η`, `ψ = ψ_F`: `H¹_c(𝔾_m, ℒ_η ⊗ ℒ_ψ)` has rank one with
  eigenvalue `ω = −g(η) = −i√3`, so `L = 1 + i√3 T` as in 3.3's Checks, and the trace of `Frob²`
  gives `extensionSum 𝔽_9 λ = −ω² = 3 = g(η_9)`.
- (both characters trivial) `𝒦 = j_! M_ℓ`: `H¹_c` and `H²_c` have rank one with eigenvalues `1`
  and `q`, so `L = (1 − T)/(1 − qT)`, the value in 3.1's Checks. The `L`-series is not a
  polynomial because `H²_c ≠ 0`, which is why 3.3 excludes `χ = 1 = ψ`.
- (eigenvalue of weight zero) over `𝔽_7`, `f = X² − X`, `χ = η`: `m = 2` and
  `∑_x η(x² − x) = −1`, so `L(λ_f, T) = 1 − T`, of degree exactly `m − 1`, with reciprocal root
  `1` rather than of absolute value `√7`; the local monodromy `η² = 1` at `∞` contributes this
  eigenvalue. An equality `|ω_i| = √q` cannot replace the inequality of 4.7.
- (no cohomology) `ψ = 1 ≠ χ`: `H^i_c(𝔾_m, ℒ_χ) = 0` for every `i` and `L = 1`, the case `k = 0`
  of 3.2's Checks.
- (Kloosterman over `𝔽_3`) `a = b = 1`, `χ = 1`: `H¹_c` has rank two, `L = 1 − T + 3T²`, and the
  trace of `Frob²` gives `K_9(1, 1) = 5`, as in 5.4's Checks.

### Examples

`g(η_9) = 3 = −(−g(η_3))² = −(−i√3)²`, while `g(η_3)² = −3`: the relation is `−g' = (−g)^n`, not
`g' = g^n`. `g(η_25) = −5`, `g(η_27) = −3√3 i`, `g(η_49) = 7`, `g(η_121) = 11`. Over `𝔽_13` the
product formula at `m = 3` and the duplication formula hold for every `χ` (checked for all twelve
characters and every `m ∣ 12`).

### Dependencies

3.1–3.2 are polynomial algebra over `F` and need Mathlib only; 3.3–3.5 need Layers 0 (0.6) and 1
(1.4), and 2.2; 3.4 consumes `ClassicalArithmeticCompletion` §7.29. 3.6 is owned downstream by
`WeilConjectures`, and nothing in this roadmap depends on it.

## Layer 4: Stepanov's method and Weil's bounds for polynomial sums

The bounds of this layer are proved by the elementary method of Stepanov, as organized by Schmidt
and by Iwaniec–Kowalski: an auxiliary polynomial vanishing to high order at the points to be counted
gives a *weak* bound `|N − q| ≤ C √q` with `C` depending only on the degrees in both variables (including the degree `q` in `y`
for Artin–Schreier equations), uniformly over all
finite extensions; the `L`-series of Layer 3 then converts the uniform weak bound into the sharp
one through the power-sum lemma. No zeta function and no curve beyond the affine point set of a
single equation appears.

### 4.1 Hasse derivatives and the multiplicity criterion

For nonzero `f ∈ F[X]` and `k ≥ 1`: `x` is a root of `f` of multiplicity `≥ k` iff `(hasseDeriv j f)(x) = 0`
for all `j < k` (Mathlib's `Polynomial.hasseDeriv`, `hasseDeriv_apply`, `rootMultiplicity`; the
criterion is Taylor's formula `f(X + x) = ∑_j (hasseDeriv j f)(x) X^j`, valid in every
characteristic). Prove the **Leibniz rule**
`hasseDeriv k (f g) = ∑_{i+j=k} hasseDeriv i f · hasseDeriv j g` (Mathlib's `hasseDeriv_mul`),
`hasseDeriv k (f^q) = 0` for `0 < k < q`, and the **root-count inequality**: a nonzero `f` of
degree `D` with roots of multiplicity `≥ k` at every point of a set `S` has `k · #S ≤ D`. *Needs:*
Mathlib.

**Checks.**

- For `f = X`, `x = 0`, `k = 1`, the multiplicity is `1` and the zeroth Hasse derivative is `0`.
- For `f = 1`, `x = 0`, `k = 1`, the multiplicity is `0` and the zeroth derivative is `1`; both sides of the criterion are false.
- For `f = 0`, Mathlib's `rootMultiplicity` is `0`, but all Hasse derivatives vanish; the nonzero hypothesis excludes this counterexample. The unrestricted criterion uses divisibility by `(X − C x)^k`, which holds for zero.

### 4.2 Stepanov's bound for `y^d = f(x)`

Let `d ≥ 2`, `f ∈ F[X]` of degree `m ≥ 1`, and suppose `f` is not of the form `c · g^e` with
`e > 1`, `e ∣ d`, `g ∈ F̄[X]` (equivalently, over `F` itself once `d ∣ q − 1`). There are `C`
and `Q₀`, depending only on `d` and `m`: fix `d,m` first, choose the constants,
then quantify over every finite base field `F`, every such `f` of degree `m`, and every finite extension `E/F` with
`|E| = Q ≥ Q₀`, `| #{(x, y) ∈ E² : y^d = f(x)} − Q | ≤ C √Q` (`stepanov_kummer`). Route of record:
Stepanov's auxiliary polynomial on the `d` branches, as in Schmidt, *Equations over Finite
Fields*, Ch. I (the method for `y^d = f(x)`), with 4.1; any explicit admissible `(C, Q₀)` is
acceptable, and the statement is existential in them. The hypothesis on `f` is stable under
extension of `F`, which is what makes the bound uniform in `E`. *Needs:* 4.1.

### 4.3 Stepanov's bound for Artin–Schreier equations

(i) For `f ∈ F[X]` of degree `n ≥ 1` with `p ∤ n`, there are `C, Q₀` depending only on `q,n` such
that for every finite base field of cardinality `q`, every such polynomial of degree `n`, and every finite extension `E/F` with `|E| = Q ≥ Q₀`,
`| #{(x, y) ∈ E² : y^q − y = f(x)} − Q | ≤ C √Q` (`stepanov_artinSchreier`). (ii) For `a, b ∈ F^×`
and `d ≥ 1` with `p ∤ d`, there are `C, Q₀` depending only on `q,d`, chosen before the base field of cardinality `q`
and the units `a,b`, such that
`| #{(x, y) ∈ E^× × E : y^q − y = a x^d + b x^{−d}} − (Q − 1) | ≤ C √Q` for `|E| = Q ≥ Q₀`
(`stepanov_kloostermanCurve`). Route of record: Schmidt Ch. I for (i); for (ii) the auxiliary
polynomial in `F[x, x⁻¹]` of Iwaniec–Kowalski Ch. 11 §11.7 (the case `d = 1` is their proof of
Weil's bound for Kloosterman sums), with `x^d` in place of `x`. The coefficient `q` in `y^q − y` is
`|F|`, so that `#{y ∈ E : y^q − y = c} = q · [Tr_{E/F} c = 0]`. *Needs:* 4.1.

**Checks.**

- For `y² = x` over any finite field, each `y` gives exactly one `x`; `N = Q`, so the Kummer constants may be `C = Q₀ = 0` for degrees `(2,1)`.
- For `y^q − y = x²` with odd `q` and `Q = q^{4r}`, `r ≥ 1`, additive orthogonality and the lifted quadratic Gauss sum give `N = Q − (q − 1)√Q`. At `(q,Q) = (3,81)` and `(5,625)`, `N = 63,525` and the normalized errors are `2,4`; the constants cannot depend only on the degree in `x`.
- For `q = Q = 3`, `a = b = 1`, `d = 1`, the Laurent equation has no points: its right side is `2,1` at the two units, while `y³ − y = 0`. Its error from `Q − 1` is `2`.

### 4.4 The power-sum lemma

If `ω : Fin k → ℂ`, `ρ > 0`, `C ≥ 0` and `|∑_i ω_i^n| ≤ C ρ^n` for all `n ≥ n₀`, then `|ω_i| ≤ ρ`
for every `i`. One route uses finite Vandermonde linear algebra: group the distinct nonzero
values as `z_j` with positive integer multiplicities `m_j`. Invert the matrix `(z_j^h)` for
`0 ≤ h < l`, where `l` is the number of distinct nonzero values. Applied to the consecutive
power sums at `n,…,n+l−1`, its fixed inverse expresses each `m_j z_j^n` as a fixed linear
combination of them. Thus `|m_j z_j^n| ≤ D_j ρ^n` for a constant independent of `n`; if
`|z_j| > ρ`, division by `|z_j|^n` would force the positive integer `m_j` to tend to zero.
Zero roots already satisfy the bound. *Needs:* Mathlib's `Matrix.det_vandermonde`
(`Mathlib/LinearAlgebra/Vandermonde.lean`), `Matrix.mul_nonsing_inv`
(`Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean`) and
`tendsto_pow_atTop_nhds_zero_of_norm_lt_one` (`Mathlib/Analysis/SpecificLimits/Normed.lean`).

**Checks.**

- For the empty family every power sum is `0` and there is no root to bound.
- For roots `2,−2` and `ρ = 1`, odd power sums vanish but the even sums are `2·2^n`;
  a bound only on odd indices would miss both roots.
- For roots `1,1`, every power sum is `2`; grouping gives multiplicity `2`, so equal
  roots cannot cancel. For roots `0,1`, every positive power sum is `1` and both norms are at most `1`.

### 4.5 The `L`-polynomial of a multiplicative character sum

For `χ ≠ 1` of order `d` and `f ∈ F[X]` nonzero, put `λ_f(g) := χ(N_{F[X]/(g)}(f))`
(`mulCharResultant χ f`), the character of the resultant `Res(g, f) = ∏_{g(α)=0} f(α)` for monic
`g` (`Algebra.norm F` on `AdjoinRoot g`). It is monic multiplicative, `λ_f(X − c) = χ(f(c))`, and
for `f = c ∏_P P^{e_P}` with monic irreducibles `P`, resultant reciprocity gives
`λ_f(g) = χ((−1)^{deg f} c)^{deg g} ∏_P (χ^{e_P} ∘ N_{(F[X]/P)/F})(g mod P)`.
The product is the character of the quotient by `rad f`, extended by zero on nonunits;
the scalar factor depends on `deg g` and is constant within each coefficient sum. Prove (`lSeries_mulCharResultant`): if `f` is not of the form
`c · h^d`, `h ∈ F[X]`, then `∑_{deg g = e} λ_f(g) = 0` for every `e ≥ m := deg(rad f)`, because
the map `g ↦ g mod rad f` from monic polynomials of degree `e` onto `F[X]/(rad f)` is
`q^{e−m}`-to-one and the quotient-character factor is nontrivial on `(F[X]/(rad f))^×`,
extended by zero; its sum vanishes, and multiplication by the fixed scalar preserves zero;
hence `L(λ_f, T)` is a polynomial of degree `≤ m − 1`, with `S_1(λ_f) = ∑_{x ∈ F} χ(f(x))` and
`S_n(λ_f) = ∑_{x ∈ E} χ(N_{E/F} f(x))`, the lifted sum. *Needs:* 3.1, 3.2, 0.3, 0.6 (the
characters of order dividing `d` of `E^×` are lifts). The boundary case: for `f = c h^d`,
`∑_x χ(f(x)) = χ(c) (q − #{roots of h in F})`, which is not `O(√q)`; the hypothesis is necessary.

The supporting API comprises:

- On monic products the resultant character is multiplicative, and at `X − c` it is `χ(f(c))`.
- At each fixed degree it is the displayed scalar times a quotient character modulo the radical.
- For non-power `f`, the quotient character is nontrivial, giving the degree bound and the norm-lifted root-power identity.

**Checks.**

- (linear `g`) `F[X]/(X − c) ≅ F` and the norm of `f mod (X − c)` is `f(c)`, so
  `λ_f(X − c) = χ(f(c))`; over `𝔽_7` with `f = X`, `χ = η`: `λ_X(X − 3) = η(3) = −1`.
- (quadratic `g`) over `𝔽_7`, `g = X² + 1` is irreducible (`−1` is a non-square) and
  `F[X]/(g) ≅ 𝔽_49` with `X ↦ i`; `N(i) = i · i⁷ = 1`, so `λ_X(X² + 1) = η(1) = 1`, in agreement
  with `Res(g, X) = (−1)² g(0) = 1`.
- (degree zero) `g = 1`: `F[X]/(1)` is the zero algebra, Mathlib's norm on it is `1`, and
  `λ_f(1) = χ(1) = 1`, as monic multiplicativity requires.
- (degree factor) over `𝔽_7`, `f = X`, `χ = η`, both `X − 1` and `X² − 1`
  reduce to `−1` modulo `X`, but their values are `1,−1`. The quotient character is
  `η(−1) = −1`, multiplied by `(−1)^{deg g}`; omitting that factor gives the wrong first value.
- (dependence on the radical) `f = X²`, `χ = η`: `λ_f(g) = η(g(0)²) = [g(0) ≠ 0]` depends on `g`
  modulo `rad f = X` only; the degree-`e` coefficient sum is `q^e − q^{e−1} ≠ 0`, and indeed
  `f = X² = 1 · X^2` is excluded by the hypothesis.
- (non-monic `g`) `λ_f(2X − 2) = λ_f(X − 1) = χ(f(1))`: the value depends on the ideal `(g)` only,
  and the `L`-series reads monic `g` only.

### 4.6 The `L`-polynomial of an additive character sum

For `ψ ≠ 1` and `f ∈ F[X]` of degree `n ≥ 1` with `p ∤ n`, put
`μ_f(g) := ψ(Tr_{F[X]/(g)}(f)) = ψ(∑_{g(α)=0} f(α))` for monic `g` (`addCharTrace ψ f`). It is monic
multiplicative, `μ_f(X − c) = ψ(f(c))`, and `∑_{deg g = e} μ_f(g) = 0` for `e ≥ n`: writing
`∑_{g(α)=0} f(α) = ∑_{j ≤ n} f_j p_j(g)` with `p_j` the `j`-th power sum of the roots, Newton's
identities give `p_n(g) = −n c_{e−n}(g) + P(c_{e−1}, …, c_{e−n+1})` with `P` a polynomial, so for
`e ≥ n` the coefficient `c_{e−n}` is free and the sum over it of `ψ(−n f_n c_{e−n} + const)`
vanishes because `n f_n ≠ 0`. Hence `L(μ_f, T)` is a polynomial of degree `≤ n − 1`
(`lSeries_addCharTrace`), `S_1(μ_f) = ∑_x ψ(f(x))`, and `S_n(μ_f) = ∑_{x ∈ E} ψ(Tr_{E/F} f(x))`.
*Needs:* 3.1, 3.2. Boundary: for `f = X^p − X` over `F = 𝔽_p`, `∑_x ψ(f(x)) = p`, and `p ∤ n`
fails; the hypothesis is necessary.

The supporting API comprises:

- The trace character is multiplicative on monic products and evaluates at `X − c` as `ψ(f(c))`.
- When the positive degree of `f` is prime to the characteristic, the free coefficient in Newton’s identity forces all coefficient sums from that degree on to vanish.
- The resulting polynomial and its trace-lifted sums satisfy `lSeries_addCharTrace` and the root-power identity of 3.2.

**Checks.**

- (linear `g`) `μ_f(X − c) = ψ(f(c))`; over `𝔽_7` with `f = X³`, `μ_f(X − 2) = ψ(8) = e(1/7)`.
- (quadratic `g`) over `𝔽_7`, `g = X² + 1`: the roots `±i` have sum `0` and `∑ α² = −2`, so
  `μ_X(g) = ψ(0) = 1` and `μ_{X²}(g) = ψ(−2) = e(5/7)`.
- (`n = 1`) `f = X`: the degree-`1` sum is `∑_c ψ(c) = 0` and the degree-`2` sum is
  `∑_{c₁, c₀} ψ(−c₁) = q · 0 = 0`, so `L(μ_X, T) = 1`, of degree `0 = n − 1`, in agreement with
  `∑_x ψ(x) = 0` and the bound `(n − 1)√q = 0`.
- (boundary) `f = X^p − X` over `𝔽_p`: `μ_f(X − c) = ψ(0) = 1` for every `c`, the degree-`1` sum
  is `p ≠ 0`, and `p ∣ n = p`.

### 4.7 Weil's bound for multiplicative character sums

For `χ ≠ 1` of order `d` and `f ∈ F[X]` nonzero, not of the form `c h^d`, with `m` distinct roots
in `F̄`: `|∑_{x ∈ F} χ(f(x))| ≤ (m − 1) √q` (`weil_mulChar_sum_bound`), and the reciprocal roots
`ω_1, …, ω_{m−1}` of `L(λ_f, T)` all satisfy `|ω_i| ≤ √q`. Proof of record. First reduce to the
hypothesis of 4.2: if `f = c h^e` for some `e > 1` dividing `d` (take `e` maximal), then
`∑_x χ(f(x)) = χ(c) ∑_x χ^e(h(x))` and `L(λ_f^{χ}, T) = L(λ_h^{χ^e}, χ(c) T)`, where `χ^e` has order
`d/e`, `h` has the same `m` distinct roots, and `h` is not `c' h'^{d/e}`; so it suffices to prove
the bound when `f` is not `c h^e` for any `e > 1` dividing `d`, which is the hypothesis of 4.2 and
gives 4.5 for every nontrivial `χ'` with `χ'^d = 1`. Then, by 0.3 and 0.6,
`#{(x, y) ∈ E² : y^d = f(x)} = Q + ∑_{χ'^d = 1, χ' ≠ 1} S_n(λ_f^{χ'})`, where the inner sums are the
lifted sums 4.5 of the `d − 1` nontrivial characters of order dividing `d`; 4.2 bounds the left side
by `C √Q` uniformly for `Q ≥ Q₀`; the root-power identity 3.2 writes the right side as
`−∑ ω^n` over the union of the reciprocal roots of the `d − 1` `L`-polynomials; 4.4 gives
`|ω| ≤ √q` for every one; and `S_1 = −∑ ω_i` has at most `m − 1` terms. (Weil 1948; Schmidt Ch. II;
Lidl–Niederreiter Ch. 5 §5.4.) *Needs:* 4.2, 4.4, 4.5, 3.2.

### 4.8 Weil's bound for additive character sums

For `ψ ≠ 1` and `f ∈ F[X]` of degree `n ≥ 1` with `p ∤ n`: `|∑_{x ∈ F} ψ(f(x))| ≤ (n − 1) √q`
(`weil_addChar_sum_bound`), and the reciprocal roots of `L(μ_f, T)` have `|ω_i| ≤ √q`. Proof of
record: `#{(x, y) ∈ E² : y^q − y = f(x)} = Q + ∑_{t ∈ F^×} S_n(μ_f^{ψ_t})` with `ψ_t = ψ.mulShift t`
(0.2 and `#{y : y^q − y = c} = ∑_{t ∈ F} ψ(t Tr c)`), 4.3 (i), 3.2 and 4.4 as in 4.7. (Weil 1948;
Lidl–Niederreiter Ch. 5 §5.4.) *Needs:* 4.3, 4.4, 4.6, 3.2.

### 4.9 Point-count corollaries

For `d ∣ q − 1` and `f` nonzero with `m` distinct roots that is not of the form `c h^e` for any
`e > 1` dividing `d` (the hypothesis of 4.2, which makes 4.7 available for every nontrivial `χ'` with
`χ'^d = 1`): `|#{(x, y) ∈ F² : y^d = f(x)} − q| ≤ (d − 1)(m − 1) √q`. The stronger hypothesis is
necessary here, unlike in 4.7: `y⁴ = x²` over `𝔽_5` has `9` points, not `5`, and `y⁴ = (x² − 1)²` over
`𝔽_25` has `46`, while `(d − 1)(m − 1)√q` is `0` and `15`. In particular for a squarefree `f` of degree
`m ≥ 1` and `p ≠ 2`, `|#{y² = f(x)} − q| ≤ (m − 1) √q` (`card_hyperelliptic_sub_le`). For `f` as in 4.8:
`|#{(x, y) ∈ F² : y^p − y = f(x)} − q| ≤ (p − 1)(n − 1) √q`. The first is the counting identity of
4.7 at `E = F` with the bounds summed. The second is not 4.8's identity at `E = F` (there
`y^q − y` vanishes on `F` and the count is `q · #{x ∈ F : f(x) = 0}`); it uses
`#{y ∈ F : y^p − y = c} = p · [Tr_{F/𝔽_p} c = 0] = ∑_{t ∈ 𝔽_p} ψ_F(t c)`, so the count is
`q + ∑_{t ∈ 𝔽_p^×} ∑_x (ψ_F.mulShift t)(f(x))`, and 4.8 bounds each of the `p − 1` sums.
*Needs:* 4.7, 4.8.

**Checks.**

- Over `𝔽_3`, `f = X` gives `N = 3`, so the degree-one bound is `0 ≤ 0`.
- Over `𝔽_3`, `f = 1` is squarefree but gives `N = 6`: the proposed degree-zero bound would be `3 ≤ −√3`, so positive degree is essential.
- Over `𝔽_5`, `f = X²` gives `N = 9`; squarefreeness fails, and the squarefree bound `4 ≤ √5` would be false.
- Over `𝔽_9`, `y³ − y = x²` has `15` points, and `|15 − 9| = 6 = (p − 1)(n − 1)√q`: the
  Artin–Schreier bound is attained. With `y⁹ − y` in place of `y^p − y` the count is
  `9 = q · #{x : x² = 0}`, so an identity summing over `t ∈ F^×` instead of `t ∈ 𝔽_p^×` counts a
  different set.

### Examples

`∑_{x ∈ 𝔽_13} η(x³ + x) = 6 ≤ 2√13 = 7.2111` (`m = 3`); `∑_{x ∈ 𝔽_7} η(x³ + x + 1) = −3`;
`∑_{x ∈ 𝔽_{101}} η(x³ + x) = −2`. `|∑_{x ∈ 𝔽_7} e(x³/7)| = 4.7409 ≤ 2√7`;
`∑_{x ∈ 𝔽_11} e(x³/11) = 0` (`3 ∤ 10`, cubing is a bijection); `|∑_{x ∈ 𝔽_13} e((x³ + x)/13)| = 5.6800`.
For `y² = x⁴ + x + 1` over `𝔽_p`, `p < 200`, `|N − p| ≤ 0.58 · 3√p`. Off-hypothesis:
`∑_{x ∈ 𝔽_p} η(x²) = p − 1` (`f = X²` is a square) and `∑_{x ∈ 𝔽_p} e((x^p − x)/p) = p`
(`p ∣ deg f`).

### Dependencies

4.1–4.4 need Mathlib only (Hasse derivatives, `AlgebraicClosure`, power series); 4.5–4.6 need
3.1–3.2 and 0.3, 0.6; 4.7–4.9 need all of 4.1–4.6 and 3.2. Nothing from another roadmap.

## Layer 5: Kloosterman and Salié sums over a finite field

### 5.1 The definition on a finite commutative ring and the elementary identities

For `R` a finite commutative ring, `χ : MulChar R ℂ`, `ψ : AddChar R ℂ` and `a, b ∈ R`, define
`kloostermanSum χ ψ a b = ∑_{x ∈ Rˣ} χ(x) ψ(a x + b x⁻¹)`. Prove:
`kloostermanSum χ ψ a 0 = gaussSum χ (ψ.mulShift a)` (the terms off the units vanish because `χ` does);
`kloostermanSum 1 ψ 0 0 = #Rˣ`; symmetry `K(χ; a, b) = K(χ⁻¹; b, a)` (substitute `x ↦ x⁻¹`); scaling
`K(χ; u a, u⁻¹ b) = χ(u)⁻¹ K(χ; a, b)` for a unit `u`, so `K(χ; a, b) = χ(a)⁻¹ K(χ; 1, a b)` for `a` a
unit; conjugation `conj K(χ, ψ; a, b) = K(χ⁻¹, ψ⁻¹; a, b) = K(χ⁻¹, ψ; −a, −b)` (through
`ψ⁻¹ = ψ.mulShift (−1)`); hence `K(1; a, b)` is **real** and `K(η; a, b)` is real or
purely imaginary according as `η(−1) = ±1`. On a field `F` with `a ≠ 0`, `b = 0`:
`K(χ; a, 0) = χ(a)⁻¹ g(χ)`, in particular `K(1; a, 0) = −1`. On a field `F`, for `a, b ∈ Fˣ` and every `ψ`:
`kloostermanSum 1 ψ a b = hyperKloosterman F 2 ψ (a b)`, the rank-two raw hyper-Kloosterman sum of
`CongruenceSpectralGap` §4.2a (the map `x ↦ (a x, b x⁻¹)` is a bijection from `Fˣ` onto the pairs
of units with product `a b`); the twist `χ` and the finite ring `R` are what this milestone adds
to it. *Needs:* 1.1, Mathlib; `CongruenceSpectralGap` §4.2a.

The supporting API comprises:

- At zero second frequency the sum is the shifted Gauss sum; with both frequencies zero and trivial multiplicative character it counts units.
- Inversion exchanges the two frequencies and inverts the multiplicative character; unit scaling contributes the stated inverse character value.
- Conjugation inverts both characters; over a field the untwisted sum at unit frequencies agrees with the rank-two hyper-Kloosterman sum.

**Checks.**

- (field) over `𝔽_7`, `K(1; 1, 1) = 2.0489` and `K(1; 1, 2) = −2.3569`, both real; `K(ω; 1, 2) =
  0.6027 − 0.3479 i` for `ω(3) = e(1/6)`, and the symmetry gives `K(ω⁵; 2, 1)` the same value.
- (Gauss-sum boundary) `K(ω; 1, 0) = g(ω) = −2.4401 + 1.0226 i` over `𝔽_7`, and `K(1; a, 0) = −1`.
- (ring, not a field) over `ZMod 12`, `K(1; 0, 0) = #(ℤ/12)^× = φ(12) = 4`; a definition summing
  over all residues would give `12`, and `K(1; 1, 0) = ∑_{d ∈ (ℤ/12)^×} e(d/12) = 0 = μ(12)`.
- (hyper-Kloosterman) over `𝔽_7` with `a = 1`, `b = 2`: the six pairs `(x, 2/x)` of units with
  product `2` give `∑ ψ(x + 2/x) = K(1; 1, 2) = −2.3569`, the value of `hyperKloosterman 𝔽_7 2 ψ 2`.
- (scaling) `K(1; 2, 3) = K(1; 1, 6)` over `𝔽_7` (`u = 2`, `χ = 1`), while `K(1; 1, 6) ≠ K(1; 1, 2)`:
  the sum depends on `a b` and on `χ(a)`, not on `a` and `b` separately only when `χ = 1`.

### 5.2 The Gauss-sum expansion

On a finite field, for every `χ` and `a, b ∈ F^×` (`kloostermanSum_eq_sum_gauss`):
`K(χ; a, b) = (q − 1)⁻¹ ∑_{θ} θ(b)⁻¹ (χθ)(a)⁻¹ g(θ) g(χθ)`, the sum over all multiplicative
characters `θ`. (For `a b = 0` the right side is `0` while `K(χ; a, 0) = χ(a)⁻¹ g(χ)` by 5.1: the
hypothesis is not decorative.) Proof: the Fourier expansion 0.3 of `x ↦ ψ(b x⁻¹)` on `F^×` is
`(q − 1)⁻¹ ∑_θ θ(b)⁻¹ g(θ) θ(x)`, and `∑_x (χθ)(x) ψ(a x) = (χθ)(a)⁻¹ g(χθ)`. Corollaries: for
`a b ≠ 0`, `K(χ; a, b)` is an algebraic integer of `ℚ(ζ_{q−1}, ζ_p)`; and for `χ = 1`, `F = 𝔽_p`,
`K(1; a, b) ∈ ℚ(ζ_p)^+ = ℚ(ζ_p + ζ_p⁻¹)` with Galois conjugates `K(1; t a, t b)`, `t ∈ 𝔽_p^×`
(equivalently `K(1; 1, t² a b)`). *Needs:* 0.3, 1.1.

### 5.3 Salié's evaluation

For `p ≠ 2` and `a, b ∈ F^×` (`kloostermanSum_quadChar_eq`):
`K(η; a, b) = η(b) g(η) ∑_{y ∈ F, y² = 4 a b} ψ_F(y)`; so `K(η; a, b) = 0` when `a b` is a
non-square and `K(η; a, b) = η(b) g(η) (ψ(y₀) + ψ(−y₀))` when `y₀² = 4ab`, of absolute value
`≤ 2√q`. Proof of record: in the Gauss-sum expansion 5.2 the duplication formula 3.4 turns
`g(θ) g(ηθ)` into `θ(4)⁻¹ g(θ²) g(η)`, so `K(η; a, b) = η(a) g(η) (q − 1)⁻¹ ∑_θ θ(4ab)⁻¹ g(θ²)`;
expanding `g(θ²) = ∑_y θ(y²) ψ(y)` and summing over `θ` first, the orthogonality 0.3 leaves exactly
the `y` with `y² = 4ab`. When `4ab` is a square `η(a) = η(b)`; when it is not, both sides vanish,
the right as an empty sum and the left because the substitution `x ↦ b a⁻¹ x⁻¹` multiplies it by
`η(ab) = −1`. (Iwaniec–Kowalski Ch. 12, Lemma 12.4, for the prime modulus.) Consequence: for
`F = 𝔽_p`, `K(η; a, b) = ε_p √p (b/p) ∑_{y² ≡ 4ab} e(y/p)` (1.4). *Needs:* 5.2, 3.4, 0.3, 1.4.

**Checks.**

- `K(η; 1, 2)` over `𝔽_7` is `η(2) · i√7 · (e(1/7) + e(6/7)) = i√7 · 2cos(2π/7) = 3.2992 i`
  (`4 · 1 · 2 = 8 ≡ 1`, `y = ±1`).
- `K(η; 2, 3)` over `𝔽_7` is `0` (`24 ≡ 3` is a non-square modulo `7`), and so is `K(η; 1, 2)`
  over `𝔽_5` (`8 ≡ 3` is a non-square modulo `5`).
- A formula with `η(a)` in place of `η(b)` agrees whenever `ab` is a square and is therefore
  indistinguishable on the nonzero values; the stated form is the one that survives the symmetry
  `K(η; a, b) = K(η; b, a)` termwise.

### 5.4 The Kloosterman `L`-polynomial and the lifting relation

For `a, b ∈ F^×` and any `χ`, put `κ(g) := χ(s_d(g)) ψ(a·s₁(g) + b·s_{d−1}(g)/s_d(g))` for monic
`g` of degree `d` with `g(0) ≠ 0`, where `s_j` is the `j`-th elementary symmetric function of the
roots (so `s_d = (−1)^d g(0)`, `s₁ = −c_{d−1}`, `s_{d−1}/s_d = ∑_{g(α)=0} 1/α`), and `κ(g) = 0`
if `g(0) = 0`. Then `κ` is monic multiplicative with `κ(X − c) = χ(c) ψ(a c + b c⁻¹)`,
`∑_{deg g = 1} κ(g) = K(χ; a, b)`, `∑_{deg g = 2} κ(g) = χ(−b/a) q`, and `∑_{deg g = d} κ(g) = 0`
for `d ≥ 3` (the coefficient `s₁` is free and `a ≠ 0`); hence
`L(κ, T) = 1 + K(χ; a, b) T + χ(−b a⁻¹) q T²`. Writing `L(κ, T) = (1 − ω₁T)(1 − ω₂T)`,
`ω₁ + ω₂ = −K(χ; a, b)`, `ω₁ ω₂ = χ(−b/a) q`, and the **lifting relation** (`kloostermanSum_lift`,
which also carries the absolute values of 5.5): for every finite extension `E/F` of degree `n`,
`K(χ.liftNorm, ψ.liftTrace; a, b) = −(ω₁^n + ω₂^n)`. *Needs:* 3.1, 3.2, 0.6.
(Lidl–Niederreiter Ch. 5 §5.5; the proof there is through 5.2 and 3.3, which is an acceptable
alternative route.)

**Checks.**

- `𝔽_3 ⊂ 𝔽_9`, `a = b = 1`: `K_3 = −1`, `L = 1 − T + 3T²`, so `ω₁ + ω₂ = 1`, `ω₁ ω₂ = 3`,
  `ω² − ω + 3 = 0`, and `K_9 = −(ω₁² + ω₂²) = −(1 − 6) = 5`.
- `𝔽_7 ⊂ 𝔽_49` with `χ = ω` of order `6`, `a = 1`, `b = 2`: `K(ω; 1, 2) = 0.6027 − 0.3479 i`,
  `ω₁ ω₂ = ω(−2) · 7`, and `K_{49} = 6.7579 − 11.7050 i = −(ω₁² + ω₂²)`.
- (sign of the constant term) with `χ = 1` the constant term is `q`, so `ω₁ ω₂ = q` and the
  reciprocal roots are complex conjugates of modulus `√q`; a polynomial `1 + K T − q T²` would
  give real roots of moduli `≠ √q` for `|K| < 2√q`.

### 5.5 Weil's bound and the Kloosterman angle

For `a, b ∈ F^×` and any `χ`: `|ω₁| = |ω₂| = √q`, hence `|K(χ; a, b)| ≤ 2√q`
(`norm_kloostermanSum_le`). Proof of record: for `χ` of order `d`,
`#{(z, y) ∈ E^× × E : y^q − y = a z^d + b z^{−d}} = (Q − 1) + ∑_{(χ', t) ≠ (1, 0)} K(χ'.liftNorm, ψ_t.liftTrace; a, b)`
over the characters `χ'` of order dividing `d` and `t ∈ F` (by 0.3, 0.6 and
`#{y : y^q − y = c} = ∑_t ψ(t Tr c)`), where the terms with `t = 0` and `χ' ≠ 1` vanish; 4.3 (ii)
bounds the left side by `C √Q` uniformly; the root-power identity 3.2 and 4.4 give `|ω| ≤ √q` for
every reciprocal root of every `L(κ_{χ', t}, T)`; and `|ω₁ ω₂| = q` forces equality. Define the
**Kloosterman angle** `θ_F(a, b) ∈ [0, π]` for `χ = 1` by `K(1; a, b) = −2√q cos θ_F(a, b)`, that is
`θ_F(a, b) = arccos(−K(1; a, b)/(2√q))`, so that `ω_{1,2} = √q e^{±iθ}`, and prove
`K_{E}(a, b) = −2 q^{n/2} cos(n θ_F(a, b))` for `[E : F] = n`. At `χ = 1` the inequality is
`CongruenceSpectralGap`'s `hyperKloosterman_bound` (§4.2b) at `k = 2`, through 5.1's
identification; the proof of record above is the one that covers every `χ`. (Weil 1948;
Iwaniec–Kowalski Ch. 11 §11.7; Lidl–Niederreiter Ch. 5 §5.5.) *Needs:* 5.4, 4.3, 4.4, 3.2.

The supporting API comprises:

- For unit frequencies the untwisted sum determines a unique angle in `[0,π]` through the negative-cosine convention.
- The reciprocal roots have arguments equal to this angle and its negative.
- Over a degree-`n` extension the untwisted sum is `−2 q^{n/2} cos(nθ)`.

**Checks.**

- `S(1, 1; 5) = (3 − √5)/2 = 0.3820`, `S(1, 1; 7) = 2.0489`, `S(1, 1; 11) = −2.3579`,
  `S(1, 1; 13) = 5.2595 ≤ 2√13 = 7.2111`; over `𝔽_9` the values `K(1; 1, b)` are `5, 2, −1, −4`,
  all `≤ 6`.
- (angle) `θ_7(1, 1) = arccos(−2.0489/(2√7)) = 1.9684`, in `[0, π]`; the lifted value is
  `K_{49}(1, 1) = −14 cos(2 θ_7(1, 1)) = 9.8019 = −(K_7² − 14)`; Katz's normalization
  `Kl = 2√q cos θ'` for `−K` gives `θ' = θ`, with both sides `−2.0489`.
  The complement `π − θ` applies only when the same sum `K` is written with a positive cosine.
- (endpoints) `θ = 0` would mean `K = −2√q` and `θ = π` would mean `K = 2√q`, both irrational for a
  prime field with `q > 4` while `K(1; a, b)` is an algebraic integer of `ℚ(ζ_p)^+`; neither
  endpoint is attained over `𝔽_p`, `p ≥ 5`.

### 5.6 Degenerate parameters and the trivial additive character

Complete the case analysis: `K(χ, ψ; a, b)` for `ψ = 1` is `∑_{x ∈ Rˣ} χ(x) = #Rˣ·[χ = 1]`; on a
field with `a = 0 ≠ b`, `K(χ; 0, b) = χ(b) g(χ⁻¹)`; with
`a ≠ 0 = b`, `K(χ; a, 0) = χ(a)⁻¹ g(χ)`; with `a = b = 0`, `(q − 1)[χ = 1]`. So the bound `2√q`
of 5.5 holds for all `(a, b) ≠ (0, 0)`, and at `(0, 0)` it holds for `χ ≠ 1` and reads `q − 1 ≤ 2√q`
for `χ = 1`, true exactly for `q ≤ 5`. *Needs:* 5.1, 1.1.

### Examples

Over `𝔽_7`: `S(1, 1; 7) = 2.0489`, `S(1, 2; 7) = −2.3569`, `θ_7(1, 1) = 1.9684`,
`K(η; 1, 2) = 3.2992 i`, `K(η; 2, 3) = 0`, `K(ω; 1, 2) = 0.6027 − 0.3479 i`, `S(0, 1; 7) = −1`.
Over `𝔽_9`: `K(1; 1, b) ∈ {5, 2, 2, 2, −1, −1, −4, −4}` for the eight units `b`. Over `𝔽_49`:
`K(ω ∘ N; 1, 2) = 6.7579 − 11.7050 i` and `K(1; 1, 1) = 9.8019`.

### Dependencies

5.1 needs 1.1 and `CongruenceSpectralGap` §4.2a; 5.2 needs 0.3; 5.3 needs 3.4, 1.4 and 2.1; 5.4
needs 3.1–3.2 and 0.6; 5.5 needs 5.4, 4.3 (ii), 4.4 and `CongruenceSpectralGap` §4.2b for the
comparison at `χ = 1`; 5.6 needs 5.1.

## Layer 6: the Teichmüller character, Stickelberger's theorem and the Gross–Koblitz evaluation

Fix a prime `p`, `f ≥ 1`, `q = p^f`, a field `K` with `IsCyclotomicExtension {q − 1} ℚ K`, a prime
`𝔓` of `𝓞_K` above `p`, and a field `L` with `IsCyclotomicExtension {p} K L` (so
`L = ℚ(ζ_{q−1}, ζ_p)`). Let `𝔓̃` be a prime of `𝓞_L` above `𝔓` and `λ := ζ_p − 1 ∈ 𝓞_L`, the
uniformizer at `𝔓̃` in which the Stickelberger congruence is written; the Gross–Koblitz element `π`
of 6.4 is a different element of the completion, congruent to `λ` modulo `𝔓̃²`. The Stickelberger
congruence and the digit-sum valuation of `g(ω^{−a})` are the classical arithmetic roadmap's 7.12
and 1.55; Morita's `Γ_p` and the Gross–Koblitz formula are `DirichletPadicLFunctions` §§4.1, 4.4
and 4.5. This layer specializes the residue character of `ClassicalArithmeticCompletion` §1.23, proves
the residue cardinality, and supplies the corollaries the two roadmaps
leave open, the identification of the two Teichmüller lifts, and the transport of the
Gross–Koblitz formula to the Gauss and Jacobi sums of this roadmap.

### 6.1 The residue field and the Teichmüller character

Prove `𝓞_K ⧸ 𝔓` is a finite field with `q` elements: for `q > 2` its residue degree is
the order of `p` modulo `q − 1`, namely `f`; for `q = 2`, `K = ℚ` and the residue field is
`𝔽_2`. Write `ω_𝔓` for the specialization of the supplied power residue symbol to `n = q − 1`.
Its source is `𝓞_K ⧸ 𝔓` and its target is `𝓞_K`; the exponent `(q − 1)/n` in the defining
congruence is one. The specialization has the following API:

- It sends zero to zero and sends each nonzero `x` to the unique `(q − 1)`-th root of unity
  reducing to `x`; multiplication and exact order `q − 1` follow from the supplied API.
- For `m ∣ q − 1`, its power `ω_𝔓^{(q−1)/m}` is the `m`-th power residue character, so
  the inverse character used in §1.47 of the supplier is `ω_𝔓^{−(q−1)/m}`.
- Under the ring map `𝓞_K → 𝓞_{K,𝔓}` to the completed valuation ring, it agrees on units
  with `TauCeti.teichmuller`; 6.4 proves this comparison by the unique-root congruence.

The character depends on the prime: Galois conjugation moves both `𝔓` and its character.
The supplied global residue-character carrier is not compiled at the pins, so the global-to-local
comparison and the ensuing global evaluations are specified in prose.
*Needs:* `ClassicalArithmeticCompletion` §1.23, Mathlib's cyclotomic residue-degree theory,
`Ideal.Quotient.field`.

**Checks.**

- (computation) `q = 7`, `K = ℚ(ζ_3)`, `𝔓 = (ζ_3 − 2)`, a prime of norm `7`: `ω_𝔓(2) = ζ_3`,
  `ω_𝔓(3) = −ζ_3²`, `ω_𝔓(5) = −ζ_3` and `ω_𝔓(−1) = −1`, so `ω_𝔓` has order `6`.
- (power residue) for `q = 7`, `m = 3`: `ω_𝔓²` is the cubic residue character `x ↦ x² mod 𝔓` of
  the classical arithmetic roadmap's 1.23: `ω_𝔓²(2) = ζ_3² ≡ 4 = 2² (mod 𝔓)`.
- (rejection) `ω_𝔓⁻¹ = ω_𝔓⁵` also has order `6`, but `ω_𝔓⁻¹(2) = ζ_3² ≡ 4 ≢ 2 (mod 𝔓)`; it is the
  Teichmüller character of the conjugate prime `(ζ_3² − 2)`, not of `𝔓`.
- (degenerate) for `q = p = 3`, `K = ℚ` and `𝔓 = (3)`: `ω_𝔓` is the Legendre symbol `(·/3)` with
  values in `ℤ` (`ω_𝔓(2) = −1 ≡ 2 (mod 3)`); for `q = 2` it is the trivial character of `𝔽_2`.
- (comparison) composing `ω_𝔓` on units with `𝓞_K → 𝓞_{K,𝔓}` gives Tau Ceti's local
  `TauCeti.teichmuller` of the Henselian ring `𝓞_{K,𝔓}`; for `q = 7` the image of `ζ_3 = ω_𝔓(2)`
  in `ℤ_7` is the Teichmüller representative of `2`, which is `30 = 2 + 4 · 7` modulo `49`
  (`30² + 30 + 1 = 19 · 49`).

### 6.2 Stickelberger's congruence and theorem, consumed

Let `ψ(x) = ζ_p^{Tr(x)}` be the trace additive character of `𝓞_K ⧸ 𝔓` with values in `𝓞_L`,
using the same `ζ_p` as `λ = ζ_p − 1`, and for `0 ≤ a < q − 1` put
`g_a := gaussSum (ω_𝔓.ringHomComp (algebraMap 𝓞_K 𝓞_L))^{−a} ψ ∈ 𝓞_L`, with `a = ∑_{i<f} a_i p^i`,
`0 ≤ a_i < p`, and `s(a) = ∑ a_i`. **Consumed** from the
[classical arithmetic roadmap](../ClassicalArithmeticCompletion/README.md): its 7.12, the
**Stickelberger congruence** `(∏_i a_i!) · (−g_a) ≡ λ^{s(a)} (mod 𝔓̃^{s(a)+1})` with
`λ = ζ_p − 1`, hence `v_𝔓̃(g_a) = s(a)`; and its 1.55, the factorization
`(g(χ_P)^m) = P^{∑_{(t,m)=1} t σ_t^{−1}}` in `ℤ[ζ_m]` for `χ_P = ω_𝔓^{−(q−1)/m}`, `m ∣ q − 1`, with
the full factorization of `(g(χ_P))` in `ℚ(ζ_m, ζ_p)` by Galois conjugation. Both are stated there
for the character `ω` of 6.1 and this `ψ`; the identification is 6.1's defining congruence
`ω_𝔓(x) ≡ x (mod 𝔓)`. Prove here what they leave open: `𝔓 𝓞_L = 𝔓̃^{p−1}` (`λ` generates the
prime of `ℚ(ζ_p)` above `p`, `IsCyclotomicExtension.Rat.zeta_sub_one_prime'`, and `p` is
unramified in `K`); for `0 < a < q − 1`, `g_a g_{q−1−a} = ω^{−a}(−1) q`
(1.2 read in `𝓞_L`) and `|g_a|² = q` in every complex embedding. At `a = 0`, `g_0 = −1`,
so its absolute value is `1`, every prime valuation is zero and its ideal is the unit ideal.
For every `a`, `v_𝔔(g_a) = 0` at primes `𝔔` not above `p`; and, for `t ∈ (ℤ/(q−1))^×`
with `τ_t : ζ_{q−1} ↦ ζ_{q−1}^t` fixing `ζ_p`, `v_{τ_t^{−1}(𝔓̃)}(g_a) = s(t a mod (q − 1))` (1.3:
`τ_t g_a = g_{ta}`), hence the **ideal factorization for every `a`**
`(g_a) = ∏_{t ∈ (ℤ/(q−1))^× / ⟨p⟩} τ_t^{−1}(𝔓̃)^{s(ta)}`,
the product over the primes of `L` above `p` (indexed by `(ℤ/(q−1))^×/⟨p⟩` because `s(pa) = s(a)`
and the decomposition group of `𝔓` is `⟨p⟩`); 1.55 is its case `a = (q − 1)/m` raised to the
`m`-th power. *Needs:* 6.1, 1.2, 1.3, the classical arithmetic roadmap's 7.12 and 1.55.

**Checks.**

- (`q = 7`, `L = ℚ(ζ_42)`) the two primes above `7` have `(e, f) = (6, 1)`, `v_𝔓̃(g_a) = a` and
  `v(g_a) = 6 − a` at the other prime for `1 ≤ a ≤ 5`, and `N_{L/ℚ}(g_a) = 7^6` for `a ≠ 0`.
- (trivial character) `g_0 = −1`, both valuations at `q = 7` are `0`, and
  `g_0² = 1`, not `7`. At `a = 1`, the valuation pair is `(1,5)` and `g_1 g_5 = −7`.
- (additive shift) at `q = 3`, `a = 1`, replacing `ψ(x)` by `ψ(2x)` gives
  `g = ζ_3² − ζ_3 ≡ λ (mod λ²)`. The leading term of `−g` is `−λ`,
  the original leading term multiplied by `ω(2)^a = −1`; valuations stay unchanged.
- (the congruence, `q = 7`) `v_𝔓̃(g_a + λ^a/a!) = a + 1` for `a = 1, …, 5`, with `λ = ζ_7 − 1`;
  with the Gross–Koblitz element `π` of 6.4 in place of `λ` the valuation is at least `a + 6`
  instead, because `Γ_7(a/6) ≡ 1/a! (mod 7)`: the congruence is a statement about `λ`.
- (`q = 9`, `a = 5 = 2 + 1·3`) `s(a) = 3` and `v_𝔓̃(g_5 + λ³/2) ≥ 4`.
- (direction of the exponent) `v_𝔓̃(g(ω^{+a}))` at the same prime is `6 − a` for `q = 7` and `1 ≤ a ≤ 5`, not `a`:
  the theorem is about `ω^{−a}`.

### 6.3 Jacobi sums and the digit-sum formula

For `0 ≤ a, b < q − 1` with `a + b ≢ 0 (mod q − 1)` and `a, b ≠ 0`:
`J(ω^{−a}, ω^{−b}) = g_a g_b / g_{a+b}` lies in `𝓞_K` (2.2 and 1.3: it is fixed by every `σ_c`), and
`v_𝔓(J(ω^{−a}, ω^{−b})) = (s(a) + s(b) − s(a + b mod (q − 1))) / (p − 1)`, a nonnegative integer
(the carries of the base-`p` addition). Here `ω = ω_𝔓` is the Teichmüller character of 6.1,
`v_𝔓(J)` is `multiplicity 𝔓 (Ideal.span {J})` (the pinned convention), `s(n)` is the base-`p`
digit sum `(Nat.digits p n).sum`, and `a + b > q − 1` is allowed: the digit sum on the right is
taken of the remainder of `a + b` modulo `q − 1`. The statement needs `ω_𝔓`, so it is specified
here only. *Needs:* 6.2, 2.2.

**Checks.**

- (`q = 7`) `J(ω^{−1}, ω^{−1}) = g_1²/g_2` has `v_𝔓 = (1 + 1 − 2)/6 = 0`.
- (`q = 7`) `J(ω^{−4}, ω^{−4}) = g_4²/g_2` has `v_𝔓 = (4 + 4 − 2)/6 = 1`; indeed `J(χ, χ)` for the
  cubic character `χ = ω^{−4} = ω^2` is the primary prime of norm `7`, classical arithmetic 1.53.
- (`q = 7`, with `a + b > q − 1`) `J(ω^{−5}, ω^{−5})` has `v_𝔓 = (5 + 5 − 4)/6 = 1`.
- (excluded boundary) for `a + b = q − 1` the Jacobi sum is `J(ω^{−a}, ω^{a}) = −ω^{−a}(−1) = ±1`
  (2.1), of valuation `0`, while the right side would read `(s(a) + s(q − 1 − a))/(p − 1) = f`:
  the hypothesis `a + b ≢ 0 (mod q − 1)` is necessary.

### 6.4 The Gross–Koblitz formula, consumed, and the identification of the two Teichmüller lifts

Let `L_𝔓̃` be the completion of `L` at `𝔓̃` (`IsDedekindDomain.HeightOneSpectrum.adicCompletion`)
with valuation ring `𝓞_{L_𝔓̃}`, and `K_𝔓 ⊆ L_𝔓̃` the completion of `K` at `𝔓`: since `p ∤ q − 1`,
`p` is unramified in `K`, so `K_𝔓` is the unramified extension `E_f` of `ℚ_p` of degree `f`, with
residue field `𝓞_K ⧸ 𝔓` of `q` elements, and `L_𝔓̃ = K_𝔓(ζ_p)` is totally ramified of degree
`p − 1` over it. **Consumed** from `DirichletPadicLFunctions` §4.5: the local Teichmüller lift
`ω_loc : 𝓞_K ⧸ 𝔓 → 𝓞_{K_𝔓}` (Tau Ceti's `TauCeti.teichmullerLift` of the local field `K_𝔓`,
the unique zero-preserving multiplicative section of reduction, `teichmullerLift_unique`); the
element `π ∈ L_𝔓̃` with `π^{p−1} = −p` and `π ≡ ζ_p − 1 (mod (ζ_p − 1)²)`, which exists and is
unique for the given `ζ_p`, with `v_𝔓̃(π) = 1`; and `grossKoblitz_formula`: for `0 ≤ a < q − 1`,
the negative Gauss sum `g_q(a) := −∑_{x ∈ (𝓞_K/𝔓)^×} ω_loc(x)^{−a} ζ_p^{Tr x}` equals
`π^{S_p(a)} ∏_{j<f} Γ_p(a_j/(q − 1))`, with `a_j = p^j a mod (q − 1)` and `S_p(a)` the sum of the
`f` base-`p` digits of `a`; from §4.4, `∑_{j<f} a_j/(q − 1) = S_p(a)/(p − 1)`; from §4.1, the
values of `Γ_p` are units. Prove here: (i) **the identification of the lifts**: the embedding
`ι : 𝓞_K → 𝓞_{K_𝔓}` carries `ω_𝔓(x)` to `ω_loc(x)` for every `x ∈ 𝓞_K ⧸ 𝔓` (both are `(q − 1)`-th
roots of unity, or `0`, reducing to `x`, and `𝓞_{K_𝔓}` has exactly `q − 1` roots of unity of order
dividing `q − 1`, reducing bijectively), so `ω_loc = ι ∘ ω_𝔓` and `a_j/(q − 1) = ⟨p^j a/(q − 1)⟩`
for `a ≠ 0` (`a_j = 0` at `a = 0`, where the formula reads `g_q(0) = 1`); (ii) **the transport**:
for `ψ(x) = ζ_p^{Tr x}` the image of `g_a` (6.2) in `𝓞_{L_𝔓̃}` is `−g_q(a)`, so that, in `L_𝔓̃`,
`g_a = −π^{s(a)} ∏_{j<f} Γ_p(a_j/(q − 1))`, with `s(a) = S_p(a)`; (iii) **compatibility of the two
suppliers**: `λ = ζ_p − 1 ≡ π (mod 𝔓̃²)`, so `λ^{s} ≡ π^{s} (mod 𝔓̃^{s+1})`, and the leading
residue `g_q(a)/π^{S_p(a)} ≡ (∏ a_i!)⁻¹ (mod 𝔓̃)` of `DirichletPadicLFunctions` §4.5
(`grossKoblitz_formula_leading_residue`) is the Stickelberger congruence of 6.2 read through (ii);
the valuation `v_𝔓̃(g_a) = s(a)` of 6.2 is recovered because the `Γ_p`-values are units. *Needs:*
6.1, 6.2, `DirichletPadicLFunctions` §§4.1, 4.4, 4.5, Tau Ceti's `teichmullerLift`, Mathlib's
`adicCompletion`.

**Checks.**

- (`q = 7`, the lifts) `K_𝔓 = ℚ_7`; `ι(ω_𝔓(2)) = ι(ζ_3)` is the Teichmüller representative of
  `2` in `ℤ_7`, congruent to `30` modulo `49`, and `30² + 30 + 1 = 19 · 49`: `ι(ζ_3)` is the root
  of `x² + x + 1` reducing to `2`, not the one reducing to `4`.
- (`π` against `λ`) in `ℚ_7(ζ_7)`, `v_𝔓̃(π − λ) = 2`: the two uniformizers agree to order one only,
  so `g_a ≡ −λ^a/a!` modulo `𝔓̃^{a+1}` (6.2) while `g_a = −π^a Γ_7(a/6)` exactly.
- (`q = 7`, the formula) `g_a = −π^a Γ_7(a/6)` for `a = 1, …, 5`, checked `7`-adically to `30`
  digits; the alternative `−π^a Γ_7(1 − a/6)` fails for every `a ≠ 3`, so the formula pins the
  fractional part `⟨a/(q−1)⟩`, not `⟨−a/(q−1)⟩`.
- (`q = 9`) `g_a = −π^{s(a)} Γ_3(a/8) Γ_3(⟨3a/8⟩)` for `a = 1, …, 7`, with `s(a) = 1, 2, 1, 2, 3, 2, 3`.
- (`a = 0`) `g_0 = gaussSum 1 ψ = −1` by Mathlib's `1(0) = 0` convention, and the formula gives
  `−π⁰ Γ_p(0)^f = −1`; the supplier's `g_q(0) = 1` is its negative, as the sign in (ii) says. With
  the convention `1(0) = 1` the left side would be `0` and the transport would fail at `a = 0`.
- (sign) `g_q(a)` is the negative of Mathlib's Gauss sum: at `q = 7`, `a = 1`, `g_q(1) = π Γ_7(1/6)`
  while `g_1 = −π Γ_7(1/6)`; a transport without the sign contradicts the Stickelberger congruence
  `1! · (−g_1) ≡ λ (mod 𝔓̃²)`.

### 6.5 The Gross–Koblitz evaluation of Gauss and Jacobi sums

For `0 ≤ a < q − 1`, in `L_𝔓̃`,
`g(ω_𝔓^{−a}, ψ) = −π^{s(a)} ∏_{i=0}^{f−1} Γ_p(⟨p^i a/(q − 1)⟩)`,
with `s(a) = (p − 1) ∑_{i<f} ⟨p^i a/(q − 1)⟩` the digit sum of 6.2 (6.4 (ii) with the fractional
parts of 6.4 (i)); the `Γ_p`-values are units, so the exponent of `π` is the valuation `s(a)` of
6.2, and the evaluation refines the consumed congruence to an equality. **Corollary** (6.3): for
`a, b ≠ 0` with `a + b ≢ 0 (mod q − 1)` and `c = a + b mod (q − 1)`,
`J(ω^{−a}, ω^{−b}) = −π^{s(a) + s(b) − s(c)} ∏_{i<f} Γ_p(⟨p^i a/(q−1)⟩) Γ_p(⟨p^i b/(q−1)⟩) / Γ_p(⟨p^i c/(q−1)⟩)`,
an identity in `K_𝔓` (the left side lies in `𝓞_K` by 6.3; the exponent `s(a) + s(b) − s(c)` is
`(p − 1) v_𝔓(J)` by 6.3, so `π^{s(a)+s(b)−s(c)} = (−p)^{v_𝔓(J)}` and the right side lies in `K_𝔓`
as well); this is the form in which `HypergeometricMotives` evaluates its finite hypergeometric
sums `p`-adically. `DirichletPadicLFunctions` §4.5 records the analogous quotient for its local
sums; the statement here is about 6.3's global Jacobi sum and carries 6.3's digit-sum exponent.
*Needs:* 6.4, 6.3, 6.2.

**Checks.**

- (reflection consistency, odd `p`, `0 < a < q − 1`) `g_a g_{q−1−a} = ω^{−a}(−1) q` (6.2) against the product of the two
  evaluations: `s(a) + s(q − 1 − a) = f(p − 1)`, `π^{f(p−1)} = (−p)^f`, and the reflection formula
  of `DirichletPadicLFunctions` §4.4 gives `∏_i Γ_p(x_i) Γ_p(1 − x_i) = (−1)^{∑ R(x_i)}`, so the
  identity requires `ω^{−a}(−1) = (−1)^{f + ∑_i R(⟨p^i a/(q−1)⟩)}`. For `q = 7`: `a = 1`,
  `R(1/6) = 6` (`6 · 6 ≡ 1`), `(−1)^{1+6} = −1 = ω^{−1}(−1)`; `a = 2`, `R(1/3) = 5`,
  `(−1)^6 = 1 = ω^{−2}(−1)`; `a = 3`, `R(1/2) = 4`, `(−1)^5 = −1 = ω^{−3}(−1)`.
- (binary reflection) for `p = 2`, use the mod-four formula of `DirichletPadicLFunctions` §4.4:
  `Γ_2(x) Γ_2(1 − x) = (−1)^{1+x₁}`, where `x₁` is the second binary digit.
  At `q = 4`, `a = 1`, the arguments `1/3,2/3` reduce to `3,2` modulo `4`,
  so both have `x₁ = 1`. The Gamma product is `1`, and the Gauss product is `4`,
  agreeing with `ω^{−1}(−1) · 4 = 4`; the odd-prime parity formula would give the wrong sign.
- (`q = 7`, the cubic Jacobi sum) `J(ω^{−4}, ω^{−4}) = −π^{6} Γ_7(2/3)²/Γ_7(1/3) = 7 Γ_7(2/3)²/Γ_7(1/3)`,
  of valuation `1` at `𝔓`, the image in `ℤ_7` of the primary prime `−1 − 3 e(1/3)` of norm `7`
  (classical arithmetic 1.53, with `e(1/3) = ω_𝔓(2)` sent to the Teichmüller representative of
  `2`).
- (`q = 7`, valuation zero) `J(ω^{−1}, ω^{−1}) = −π⁰ Γ_7(1/6)²/Γ_7(1/3)`, a unit, in agreement with
  `v_𝔓 = 0` in 6.3.
- (excluded boundary) at `a + b = q − 1` the Jacobi sum is `±1` (6.3) while the right side would
  carry `π^{f(p−1)} = (−p)^f`; the hypothesis is the same as 6.3's.

### Examples

`q = 7`, `K = ℚ(ζ_3)`, `𝔓 = (ζ_3 − 2)`, `L = ℚ(ζ_42)`: `ω_𝔓(2) = ζ_3`; the cubic character of
the worked example `7.2` is `ω_𝔓^{±2}` according to the choice of `𝔓`; `v_𝔓̃(g_a) = a` and
`v_𝔓̃(g_a + λ^a/a!) = a + 1` for `a = 1, …, 5`; `g_a = −π^a Γ_7(a/6)` in `ℚ_7(ζ_7)`;
`J(ω^{−4}, ω^{−4})` has `v_𝔓 = 1` and is the primary prime of norm `7`.

### Dependencies

0.3, 1.2, 1.3, 2.2; Mathlib's cyclotomic fields, `Ideal.Quotient.field` and `adicCompletion`;
Tau Ceti's `teichmuller` and `teichmullerLift`; the classical arithmetic roadmap's 7.12 and 1.55;
`DirichletPadicLFunctions` §§4.1, 4.4 and 4.5. Independent of Layers 3–5.

## Layer 7: sums modulo an integer

`c, N ≥ 1`, `ZMod c` with `ψ_c := ZMod.stdAddChar : AddChar (ZMod c) ℂ`, `ψ_c(j) = e(j/c)`, and
Dirichlet characters `χ : DirichletCharacter ℂ N`. These are the sums the LMFDB displays on the
page of `χ`; for prime `c` they are the sums of Layers 1, 2 and 5 over `F = ZMod c`.

### 7.1 Gauss sums of Dirichlet characters

`τ_a(χ) := gaussSum χ (ψ_N.mulShift a)`, `τ(χ) := τ_1(χ)`, the LMFDB's `character.dirichlet.gauss_sum`.
Record and prove: for `χ` primitive, `τ_a(χ) = χ(a)⁻¹ τ(χ)` for every `a` (Mathlib
`gaussSum_mulShift_of_isPrimitive`, including `a` a non-unit, where both sides are `0`);
`τ(χ) τ(χ⁻¹) = χ(−1) N` and `|τ(χ)| = √N`, as a one-line corollary of Tau Ceti's
`gaussSum_mul_gaussSum_inv_eq_card_of_isPrimitive` (`τ(χ) · gaussSum χ⁻¹ ψ_N⁻¹ = N`) with
`ψ_N⁻¹ = ψ_N.mulShift (−1)` (`inv_mulShift`) and `gaussSum χ⁻¹ (ψ_N.mulShift (−1)) = χ(−1) τ(χ⁻¹)`
(`gaussSum_mulShift_of_isPrimitive` for `χ⁻¹`, which is primitive with `χ`); for `χ` of conductor
`f` with primitive character `χ^∗` (`DirichletCharacter.primitiveCharacter`), the **imprimitive
formula** `τ(χ) = μ(N/f) χ^∗(N/f) τ(χ^∗)` (`gaussSum_eq_moebius_mul`), in particular `τ(χ) = 0`
unless `N/f` is squarefree and prime to `f`, and `τ(1_N) = μ(N)`; the **Chinese-remainder
formula** `τ(χ) = χ₁(c₂) χ₂(c₁) τ(χ₁) τ(χ₂)` for `N = c₁ c₂` coprime and `χ = χ₁ χ₂` as in 0.7
(`gaussSum_mul_of_coprime`). *Needs:* 0.7, 1.1, Mathlib, Tau Ceti.

**Checks.**

- all `χ` modulo `12, 15, 18, 20` satisfy the imprimitive formula; `τ(1_{12}) = μ(12) = 0` and
  `τ(1_7) = μ(7) = −1`.
- all pairs modulo `(3, 5)`, `(4, 5)`, `(3, 7)`, `(8, 3)` satisfy the Chinese-remainder formula.
- for the quartic character modulo `5`, `τ(χ) τ(χ⁻¹) = χ(−1) · 5 = −5` and `|τ(χ)|² = 5`; the
  formula without the factor `χ(−1)` would give `+5`.

### 7.2 Jacobi sums modulo `N`

`J(χ, ψ) := jacobiSum χ ψ = ∑_{r ∈ ZMod N} χ(r) ψ(1 − r)` (the LMFDB's
`character.dirichlet.jacobi_sum`; Mathlib's definition applies to every finite commutative ring).
Prove: the Chinese-remainder multiplicativity `J(χ, ψ) = J(χ₁, ψ₁) J(χ₂, ψ₂)` for `N = c₁ c₂`
coprime; and `J(χ, ψ) = τ(χ) τ(ψ) / τ(χψ)` **whenever `χψ` is primitive modulo `N`**
(`jacobiSum_eq_gaussSum_div_of_isPrimitive`; then `τ(χψ) ≠ 0`; the proof compares
`τ(χ)τ(ψ) = ∑_s ψ_N(s) ∑_{x+y=s} χ(x)ψ(y)` with the vanishing of the inner sum at non-units `s`,
which uses primitivity of `χψ`). The hypothesis is sharp: for `N = 9`, `χ` primitive of order `6`
and `ψ = χ⁻¹`, `J(χ, χ⁻¹) = 0` while `τ(χ)τ(χ⁻¹) = −9` and `τ(χψ) = τ(1_9) = μ(9) = 0`. For prime
`N` and `χψ ≠ 1`, primitivity is automatic and the formula is 2.2. Record also
`J(χ, 1_N) = ∑_{r : 1 − r ∈ (ZMod N)ˣ} χ(r)`, which is `−1` for prime `N` and `χ ≠ 1` (the LMFDB's
default display `J(χ, χ_N(1, ·))`). *Needs:* 0.7, 7.1, 2.2.

### 7.3 Kloosterman sums modulo `c` and the comparison with `AutomorphicSpectralTheory`

`S_χ(m, n; c) := kloostermanSum (changeLevel h χ) ψ_c m n` for `χ` of modulus `N`, `h : N ∣ c`,
and `S(m, n; c) := S_{1}(m, n; c) = ∑_{d ∈ (ℤ/c)^×} e((m d + n d̄)/c)`. Prove that `S(m, n; c)` is
the sum `S(m, n; c)` of `AutomorphicSpectralTheory` §1.16 (the two are the same finite sum over
`(ℤ/cℤ)^×` with `d d̄ ≡ 1`; that roadmap states its sum in prose, so the comparison is an identity
of finite sums), and inherit its frequency symmetry `S(m, n; c) = S(n, m; c)`, its reality
(`kloosterman_real`) and `S(m, 0; c) = ∑_{d ∣ (m, c)} μ(c/d) d`, which are not reproved. The LMFDB's
`K(a, b, χ)` is `S_χ(a, b; q)` with `N = c = q`, and `K(a, 0, χ) = τ_a(χ)` (5.1), as its knowl
states. Prove `S_χ(m, n; c)` depends on `m, n` modulo `c` only, `S_χ(m, n; c) = S_{χ⁻¹}(n, m; c)`,
`S_χ(u m, u⁻¹ n; c) = χ(u)⁻¹ S_χ(m, n; c)` for `u` a unit, and
`conj S_χ(m, n; c) = S_{χ⁻¹}(−m, −n; c)`. *Needs:* 5.1, `AutomorphicSpectralTheory` §1.16.

**Checks.**

- `S(1, 1; 7) = 2.0489` and `S(1, 2; 7) = −2.3569` agree with the finite-field sums of 5.5 over
  `𝔽_7`; `S(7, 1; 7) = S(0, 1; 7) = −1`.
- `S(m, 0; 12) = 0, 2, 0, −2, −4, 4` for `m = 1, 2, 3, 4, 6, 0`, the Ramanujan sums
  `∑_{d ∣ (m, 12)} μ(12/d) d`; `S(0, 0; 12) = φ(12) = 4`, not `12`.
- for `χ = χ_7(3, ·)` of order `6`, `K(1, 2, χ) = S_χ(1, 2; 7) = 0.6027 − 0.3479 i` and
  `K(1, 0, χ) = τ(χ) = −2.4401 + 1.0226 i`.
- (the modulus is `c`, not the conductor) for the quartic `χ` modulo `5` read modulo `15`,
  `|S_χ(1, 1; 15)| = 1.9021`, while the sum over `(ℤ/5)^×` is `S_χ(1, 1; 5) = 1.1756 i`; the
  `changeLevel` in the definition is what puts the sum over the units modulo `c`.

### 7.4 Twisted multiplicativity

For coprime `c₁, c₂`, `c = c₁ c₂`, `N ∣ c`, and `χ` modulo `N` with Chinese-remainder factors
`χ₁, χ₂` (0.7, applied to `changeLevel χ`) (`kloostermanSum_zmod_mul`):
`S_χ(m, n; c) = S_{χ₁}(m c̄₂, n c̄₂; c₁) · S_{χ₂}(m c̄₁, n c̄₁; c₂)`, where `c̄₂ c₂ ≡ 1 (mod c₁)` and
`c̄₁ c₁ ≡ 1 (mod c₂)`. Proof: `ZMod.chineseRemainder` on the summation variable and
`ψ_c(x) = ψ_{c₁}(c̄₂ x₁) ψ_{c₂}(c̄₁ x₂)` for `x ↔ (x₁, x₂)`, which is 0.7's description of `ψ_c`. By
induction, `S_χ(m, n; c)` is a product over the prime powers `p^k ∥ c`. *Needs:* 0.7, 7.3.

**Checks.**

- `S(1, 1; 15) = S(2, 2; 3) S(2, 2; 5) = (−1)(2 + 2cos(2π/5)) = −2.6180`.
- without the inverses, `S(1, 1; 3) S(1, 1; 5) = (−1)(0.3820) = −0.3820 ≠ −2.6180`: the shifts
  `c̄₂, c̄₁` are not decorative.
- `S(1, 1; 1) = 1`: `ZMod 1` has the single unit `0`, and the formula at `c₁ = 1` is the identity
  `S = 1 · S`.

### 7.5 Prime-power evaluation (Salié) and the prime-power bound

For `p` odd, `k ≥ 2`, `c = p^k` and `p ∤ m n`: if `m n ≡ ℓ² (mod p^k)` then
`S(m, n; p^k) = 2 (ℓ/p)^k p^{k/2} Re(ε_{p^k} e(2ℓ/p^k))` (`kloostermanSum_zmod_primePow`), and if
`m n` is a non-square modulo `p` then `S(m, n; p^k) = 0` (`kloostermanSum_zmod_primePow_eq_zero`).
Proof of record (stationary phase): write `d = u(1 + p^h v)` with `h = ⌈k/2⌉`; the inner sum over
`v mod p^{k−h}` vanishes unless `u` is a critical point, `m u² ≡ n (mod p^{k−h})`, and the critical
points contribute the two terms of the formula, with the quadratic Gauss sum 1.4 entering for odd
`k` (Iwaniec–Kowalski Ch. 12 §12.3, their evaluation (12.39)). For a Dirichlet character `χ` of conductor
`p^j`, induced to modulus `p^k`, `j ≤ k`, prove the **twisted prime-power bounds**: for `k = 2` and every prime `p`,
`|S_χ(m, n; p²)| ≤ 2 (m, n, p²)^{1/2} p` (`norm_kloostermanSum_zmod_primeSq_le`); and for `p` odd,
`k ≥ 2`, `p ∣ m`, `p ∤ n`, `|S_χ(m, n; p^k)| ≤ p^{⌈k/2⌉}`. Proof of record, the same stationary
phase: `χ(1 + p^h v)` is additive in `v` because `2h ≥ k`, say `e(λ_χ v/p^{k−h})`, so the inner sum
over `v` vanishes unless `u` is a root of `m u² + λ_χ u − n ≡ 0 (mod p^{k−h})`. For `k = 2`, `h = 1`
and `p ∤ mn` there are at most two roots, each contributing `p`; for `p ∣ m`, `p ∤ n` the
congruence has at most one root (Hensel, the derivative being the unit `λ_χ`, or none when
`p ∣ λ_χ`), and its `p^{2h−k}` lifts contribute at most `p^{2h−k}` each; for `p ∣ gcd(m, n)` the
sum is `0` when `j = k` (a primitive `χ` summed over a coset of `1 + p^{k−1}ℤ`) and
`p · S_χ(m/p, n/p; p^{k−1})` when `j < k`, which 5.5 and 5.6 bound at `k = 2`. For the principal character modulo `25`,
`j = 0` and `S_χ(5,5;25) = 5 S(1,1;5) = 5(3 − √5)/2 ≈ 1.909830`; its modulus
does not make it primitive (Knightly–Li, Theorem 9.3, p. 120). ⚠ For `k ≥ 3` and
`p ∤ mn` the untwisted constant does not persist: the two roots coincide modulo `p` when
`λ_χ² + 4mn ≡ 0 (mod p)`, and then `|S_χ(m, n; p^k)|` reaches `p^{(k+1)/2}`:
`|S_χ(7, 7; 125)| = 25` for a primitive `χ` of order `50` modulo `125`, and
`|S_χ(1, 15; 17³)| = 289 = 17²` for a primitive `χ` of order `4624`, which exceeds
`τ(17³) · 17^{3/2} = 280.37`. In general, for `p` odd, `k ≥ 2`, `p ∤ mn` and `χ` whose `p`-part has
conductor `p^j`: `|S_χ(m, n; p^k)| ≤ 2 p^{k/2}` when `j ≤ ⌊k/2⌋` (`χ` is then constant on the
`p^{2h−k}` lifts of each critical point and the computation is the untwisted one), and
`|S_χ(m, n; p^k)| ≤ 2 p^{j/2} p^{k/2}` always (the roots of the critical congruence modulo
`p^{⌊k/2⌋}` number at most `2 p^{⌊⌊k/2⌋/2⌋}`, by the valuation of the discriminant `λ_χ² + 4mn`, and
`⌊k/2⌋ ≤ j − 1` when `j > ⌊k/2⌋`). With the `p ∣ mn` cases this is the **conductor-weighted
prime-power bound** `|S_χ(m, n; p^k)| ≤ τ(p^k) (m, n, p^k)^{1/2} 𝔠_χ^{1/2} p^{k/2}` for every prime
`p`, every `k ≥ 1` and all `m, n`, `𝔠_χ` the conductor of `χ` (Knightly–Li, *Kuznetsov's trace
formula and the Hecke eigenvalues of Maass forms*, §9.1, Theorem 9.3, inequality (9.7); their (9.8)
sharpens the conductor factor to `𝔠_χ^{1/4} p^{1/4}`, which is not a target here; for `p = 2` the
trivial bound `φ(2^k)` covers `k ≤ 6` and the stationary phase, with at most eight critical
classes, the rest). *Needs:* 1.4, 5.5, 5.6, Mathlib's `ZMod` and `legendreSym`.

**Checks.**

- `S(1, 1; 25) = 10 cos(4π/25) = 8.7631`, `S(1, 2; 25) = 0` (`2` is a non-square modulo `5`),
  `S(1, 1; 27) = −2·3^{3/2} sin(4π/27) = −4.6641`, `S(1, 1; 49) = 14 cos(4π/49) = 13.5421`,
  `S(2, 3; 125) = −0.8428` with `ℓ = 16` (`16² = 256 ≡ 6 = 2 · 3`).
- `|S_χ(1, 1; 25)| ∈ {0, 5}` for the eight primitive `χ` of order `20` modulo `25` (four each), all
  `≤ 2 · 5`.
- (the sign factor) `S(1, 4; 125) = −21.9102` with `ℓ = 2`, a non-residue modulo `5`: the factor
  `(ℓ/5)³ = −1` is the sign, and the formula without it gives `+21.9102`; `S(3, 5; 121) = −19.3770`
  with `ℓ = 35` (`35² ≡ 15`), where `k = 2` and the factor is `(35/11)² = 1`.
- `|S_χ(7, 7; 125)| = 25 = p^{(k+1)/2}` for a primitive `χ` of order `50` modulo `125`: the
  untwisted bound `2 p^{k/2} = 22.36` fails for twisted sums at `k = 3`.

### 7.6 Weil's bound for a general modulus

For every `c ≥ 1` and all integers `m, n`: `|S(m, n; c)| ≤ τ(c) · (m, n, c)^{1/2} · c^{1/2}`
(`norm_kloostermanSum_zmod_le`), with `τ(c) = σ₀(c)` the number of divisors and
`(m, n, c) = gcd(gcd(m, n), c)`. Proof: 7.4 reduces to prime powers, where `τ(p^k) = k + 1 ≥ 2`;
at `k = 1` the factor is 5.5 and 5.6 (`S(m, n; p)` is a Kloosterman, Gauss or Ramanujan sum); at
`k ≥ 2` it is 7.5 (for `p` odd, Salié's evaluation gives `2 p^{k/2}` for `p ∤ mn`; for `p = 2` the
stationary-phase count of 7.5 with `χ = 1` gives the bound `(k + 1) 2^{k/2}` for `mn` odd; for
`p ∣ m`, `p ∤ n` the sum is `0`; for `p ∣ gcd(m, n)` it is `p · S(m/p, n/p; p^{k−1})`, and induction
on `k` applies); the gcd factor multiplies across coprime moduli. (Weil 1948 at `k = 1`;
Iwaniec–Kowalski Ch. 11, Corollary 11.12 to Theorem 11.11, equation (11.58).) **Twisted form.**
For a Dirichlet character `χ` of modulus `N ∣ c` and conductor `𝔠_χ`:
`|S_χ(m, n; c)| ≤ τ(c) (m, n, c)^{1/2} 𝔠_χ^{1/2} c^{1/2}` (`norm_kloostermanSum_zmod_le_of_char`;
7.4 with the conductor-weighted prime-power factors of 7.5; Knightly–Li Theorem 9.3 at prime powers
and Theorem 9.2 with `n = 1` for every `c`), and for `c` **cube-free** the conductor factor can be
dropped (`norm_kloostermanSum_zmod_le_of_cubefree`; 7.4 with the factors 5.5–5.6 at `k = 1` and 7.5
at `k = 2`). The factor is needed: `|S_χ(1, 15; 17³)| = 289 > τ(17³) · 17^{3/2}` (7.5; Knightly–Li's
Example 9.9 gives `|S_χ(a, b; p³)| = p²` for a primitive `χ` modulo `p³` and suitable units `a, b`,
which beats `τ(p³) p^{3/2} = 4 p^{3/2}` exactly from `p = 17` on). *Needs:* 7.4, 7.5, 5.5, 5.6.

**Checks.**

- `|S(1, 1; 15)| = 2.618 ≤ τ(15) √15 = 15.49`; `|S_χ(1, 1; 15)| = 1.9021` for `χ` of order `4`
  modulo `5` (`15` is cube-free).
- `S(7, 1; 7) = −1`, `S(0, 0; 12) = φ(12) = 4 ≤ τ(12) · √12 · √12 = 72`.
- `|S_χ(1, 15; 17³)| = 289 > 280.37 = τ(17³) 17^{3/2}`: the twisted bound carries `𝔠_χ^{1/2}` unless
  `c` is cube-free; the untwisted bound holds for every `c` (checked for all `m, n` and `c ≤ 60`).

### 7.7 The character page

Assemble, for a Dirichlet character `χ` of modulus `q`, named by its Conrey index `n` (the unit
`n` modulo `q` with `χ = χ_q(n, ·)` under the Conrey pairing; for prime `q` this is the character
with `χ(g) = e(a/(q − 1))`, `g` the least primitive root and `n ≡ g^a`, and no construction of the
pairing is a target), the three displayed quantities: `τ_2(χ)` (7.1), `J(χ, χ_q(1, ·))` (7.2) and
`K(1, 2, χ) = S_χ(1, 2; q)` (7.3), together with the theorems that evaluate them: `|τ_2(χ)| = √q`
for `χ` primitive and `q` odd; for primitive `χ` and even `q`, `τ_2(χ) = 0`
by `DirichletCharacter.gaussSum_mulShift_of_isPrimitive`. The primitive character modulo `4`
has `τ_2 = −1 + 1 = 0`, while the quartic character modulo `5` has `|τ_2| = √5`. Also `J(χ, 1) = −1` for prime `q` and `χ ≠ 1`, `|K(1, 2, χ)| ≤ τ(q) 𝔠_χ^{1/2} √q`, and
`|K(1, 2, χ)| ≤ τ(q) √q` for cube-free `q` (7.6). Nothing here depends on the Conrey labelling
beyond naming the character. *Needs:* 7.1–7.3, 7.6.

### Examples

Modulo `7`, for `χ = χ_7(3, ·)` of order `6`: `τ_2(χ) = 2.1057 + 1.6019 i`, `J(χ, 1) = −1`,
`K(1, 2, χ) = 0.6027 − 0.3479 i`. Modulo `5`, for the quartic `χ = χ_5(2, ·)`:
`τ_2(χ) = 1.9021 + 1.1756 i`, `K(1, 2, χ) = 1.1756 − 1.1756 i`. Composite moduli:
`S(1, 1; 15) = −2.6180`, `S(1, 1; 25) = 8.7631`, `S(1, 1; 27) = −4.6641`, `S(1, 1; 81) = 17.7838`,
`S(1, 1; 125) = 22.2478`; `τ(1_{12}) = 0`; the imprimitive and Chinese-remainder formulas hold for
every character modulo `12, 15, 18, 20` and every coprime pair `(3, 5)`, `(4, 5)`, `(3, 7)`, `(8, 3)`.

### Dependencies

0.7, 1.1, 1.4, 2.2, 5.1, 5.5, 5.6; Mathlib's Dirichlet characters and `ZMod.chineseRemainder`;
Tau Ceti's `gaussSum_mul_gaussSum_inv_eq_card_of_isPrimitive`; `AutomorphicSpectralTheory` §1.16
for the comparison in 7.3; Knightly–Li for the twisted bounds of 7.5–7.6.

## Downstream consumers

- `HypergeometricMotives` consumes Layer 1's Gauss sums `g(ω^m)` for a generator `ω`, the
  Hasse–Davenport relations 3.3–3.4 (its reduction of finite hypergeometric sums by the duplication
  formula) and the Gross–Koblitz evaluation 6.4–6.5 for the `p`-adic evaluation of its sums.
- The LMFDB's Dirichlet character pages display exactly the quantities of 7.7: `τ_2(χ)`,
  `J(χ, χ_q(1, ·))` and `K(1, 2, χ)`, with the bounds of 7.6.
- `CurvesOverFiniteFields` and `FunctionFieldArithmetic` border this roadmap without consuming it:
  the point counts of Layer 4 are finite sums bounded by Stepanov's method. Neither the comparison
  of the `L`-polynomials of Layers 3–5 with numerators of zeta functions nor their trace-function
  reading is a target of this roadmap (Scope and ownership).

## Worked examples (acceptance criteria)

Every number below was computed exactly or to ten decimals; a decimal is a target only up to the
displayed precision, and every exact equality is a target. Conrey labels `q.n` name the character
with Conrey index `n`; for prime `q` this is the character with `χ(g) = e(a/(q−1))` where `g` is
the least primitive root and `n ≡ g^a`.

### `7.3`: the character of order `6` modulo `7`

`χ = χ_7(3, ·)`, `χ(3) = e(1/6)` (`3` is the least primitive root modulo `7`), `χ(2) = e(1/3)`,
`χ(−1) = χ(6) = −1`.
- 1.1–1.2: `τ(χ) = g(χ) = −2.4401 + 1.0226 i`, `|τ(χ)|² = 7`;
  `τ_2(χ) = χ(2)⁻¹ τ(χ) = e(−1/3) τ(χ) = 2.1057 + 1.6019 i` (the LMFDB's displayed `τ_2`).
- 2.1–2.2: `J(χ, 1) = −1`; `J(χ, χ) = 3 − ζ_6 = 2.5 − 0.8660 i`, of absolute value `√7`.
- 1.5: `g(χ)⁶ = −7 ∏_{i=1}^{4} J(χ, χ^i)`.
- 7.3, 5.5: `K(1, 2, χ) = S_χ(1, 2; 7) = 0.6027 − 0.3479 i`, `|K| ≤ 2√7`; `K(1, 0, χ) = τ(χ)`.
- 5.4: over `𝔽_49`, `K(χ ∘ N; 1, 2) = 6.7579 − 11.7050 i = −(ω₁² + ω₂²)` where
  `1 + K(χ; 1, 2) T + χ(−2) · 7 · T² = (1 − ω₁T)(1 − ω₂T)`, and `|ω_i| = √7`.

### `7.6`: the Legendre symbol modulo `7`

`η = χ_7(6, ·) = (·/7)`, `η(−1) = −1` (`7 ≡ 3 mod 4`).
- 1.4: `g(η) = ε_7 √7 = i√7` (the consumed sign); `g(η)² = η(−1) · 7 = −7` (`gaussSum_sq`).
- 2.1: `J(η, η) = −η(−1) = 1`; `J(η, 1) = −1`.
- 5.3: `K(η; 1, 2) = η(2) g(η) (e(1/7) + e(6/7)) = i√7 · 2cos(2π/7) = 3.2992 i`
  (`4 · 1 · 2 = 8 ≡ 1` is a square, `y = ±1`); `K(η; 2, 3) = 0` (`24 ≡ 3` is a non-square
  modulo `7`).
- 5.5: `S(1, 1; 7) = 2.0489`, `S(1, 2; 7) = −2.3569`, both `≤ 2√7 = 5.2915`;
  `θ_7(1, 1) = arccos(−2.0489/(2√7)) = 1.9684`.
- 7.3: `S(7, 1; 7) = S(0, 1; 7) = −1` (the Ramanujan/Gauss degenerate case, 5.6).

### `7.2`: the cubic character modulo `7`

`χ = χ_7(2, ·)`, order `3`, `χ(3) = e(1/3)` hence `χ(2) = e(2/3)`, `χ(−1) = 1`.
- 1.5, 2.3: `g(χ)³ = 7 J(χ, χ)` with `J(χ, χ) = 0.5 − 2.5981 i = −1 − 3ω` (`ω = e(1/3)`), the
  primary prime of norm `7` of classical arithmetic 1.53; `g(χ) = 2.3705 − 1.1751 i`,
  `g(χ)³ = 3.5 − 18.1865 i = 7(−1 − 3ω)`.
- 6.1–6.3: with `𝔓` a prime of `ℚ(ζ_6) = ℚ(ζ_3)` above `7` and `ω_𝔓` its Teichmüller character,
  `χ = ω_𝔓^{±2}` according to the choice of `𝔓`; in `L = ℚ(ζ_42)` the two primes above `7` have
  `(e, f) = (6, 1)`, `v_𝔓̃(g(ω^{−a})) = a` for `a = 1, …, 5`, the other prime has valuation `6 − a`;
  at `a = 0` both valuations are `0` and `g_0 = −1`;
  `N_{L/ℚ}(g(ω^{−a})) = 7^6` for `a ≠ 0`, and `v_𝔓̃(g(ω^{−a}) + λ^a/a!) = a + 1` with `λ = ζ_7 − 1`.
- 6.4–6.5: in `ℚ_7(ζ_7)`, `g(ω^{−a}) = −π^a Γ_7(a/6)` for `a = 1, …, 5` with `π^6 = −7`,
  `π ≡ λ (mod 𝔓̃²)`, `v_𝔓̃(π − λ) = 2`; and `J(ω^{−4}, ω^{−4}) = 7 Γ_7(2/3)²/Γ_7(1/3)` is the
  `7`-adic image of the primary prime `−1 − 3 ζ_3` under `ζ_3 ↦` the Teichmüller representative of
  `2` (checked to `7^9`), and not the image of its conjugate `−1 − 3 ζ_3²`, which differs from it
  already modulo `7`.

### `5.2`: the quartic character modulo `5`, and two-squares

`χ = χ_5(2, ·)`, order `4`, `χ(2) = e(1/4) = i`, `χ(−1) = −1`.
- 2.3: `J(χ, χ) = −1 − 2i`, `(−1)² + 2² = 5`; `a = −1` odd, `b = −2` even. Classical arithmetic
  1.36 reads `−χ(−1) J(χ, χ) = J(χ, χ) = −1 − 2i = π̄`, the primary Gaussian prime with
  `2 ≡ i (mod π̄)`, so `χ = (·/π̄)_4` (`−(−1)^{(5−1)/4} = +1`); the conjugate character `χ_5(3, ·)` has
  `J = −1 + 2i = π`, the prime of 1.36's own check.
- 1.1: `τ(χ) = −1.1756 + 1.9021 i`, `τ_2(χ) = χ(2)⁻¹ τ(χ) = 1.9021 + 1.1756 i`.
- 7.3: `K(1, 2, χ) = 1.1756 − 1.1756 i`.
- 2.5 (Jacobsthal, `p = 5`): `φ_2(1) = −2 = −2a` with `a = 1 ≡ 1 (mod 4)`, `5 = 1² + 2²`;
  `φ_2(2) = −4 = −2b`; `ψ_2(1) = −1`.

### Jacobsthal's theorem at `p = 13, 17, 29, 37, 41`

`φ_2(1) = 6, −2, −10, −2, −10` and the representations `p = a² + b²` with `a ≡ 1 (mod 4)` are
`a = −3, 1, 5, 1, 5`: `φ_2(1) = −2a` in every case. `φ_2(r)` for the least non-square `r` is
`−4, 8, −4, 12, −8 = ±2b`. `ψ_2(1) = −1` throughout.

### Over `𝔽_9`, `𝔽_25`, `𝔽_27`, `𝔽_49`: the Hasse–Davenport sign

- 3.3: `g(η_9) = 3`, `g(η_25) = −5`, `g(η_27) = −3√3 i`, `g(η_49) = 7`, `g(η_121) = 11`; from
  `g(η_3) = i√3`, `g(η_5) = √5`, `g(η_7) = i√7`, `g(η_11) = i√11` and
  `g(η_{p^f}) = (−1)^{f−1} (ε_p√p)^f`. **Boundary check**: `g(η_9) = 3 ≠ (i√3)² = −3`: the relation is `−g' = (−g)^n`, not
  `g' = g^n`.
- 5.4–5.5: `K_3(1, 1) = −1` over `𝔽_3`, `K_9(1, 1) = 5` over `𝔽_9` (`ω² − ω + 3 = 0`,
  `ω₁² + ω₂² = 1 − 6 = −5`); the eight values `K_9(1, b)`, `b ∈ 𝔽_9^×`, are `5, 2, 2, 2, −1, −1, −4, −4`, all of
  absolute value `≤ 2√9 = 6`.

### Hasse–Davenport product over `𝔽_13`

- 3.4 with `χ = ω` of order `12` and `m = 3`, `λ = ω^4`:
  `∏_{j<3} g(ω^{1+4j}) = ω(3)^{−3} g(ω³) g(ω⁴) g(ω⁸) = −44.8610 + 13.5828 i`; with `χ = ω²`: `46.8722`.
- Duplication (`m = 2`): `g(ω²) = ω(4) g(ω) g(ω η)/g(η)` for `ω` of order `12` over `𝔽_13`, with
  `g(η_13) = √13 = 3.6056`.
- 2.3: `J(χ, χ) = 3 − 2i` for `χ = ω³` of order `4` (`ω(2) = e(1/12)`), `13 = 3² + 2²`.

### Weil's bounds, with the hypotheses tested

- 4.7: `∑_{x ∈ 𝔽_13} η(x³ + x) = 6 ≤ 2√13 = 7.2111` (`m = 3`);
  `∑_{x ∈ 𝔽_7} η(x³ + x + 1) = −3 ≤ 2√7`; `∑_{x ∈ 𝔽_{101}} η(x³ + x) = −2 ≤ 2√101`. **Boundary**: `∑_{x ∈ 𝔽_p} η(x²) = p − 1`,
  not `≤ 0·√p`; `f = X²` is a square and 4.7 does not apply to it.
- 4.8: `|∑_{x ∈ 𝔽_7} e(x³/7)| = 4.7409 ≤ 2√7`; `∑_{x ∈ 𝔽_11} e(x³/11) = 0` (`3 ∤ 10`, cubing is a
  bijection); `|∑_{x ∈ 𝔽_13} e((x³ + x)/13)| = 5.6800 ≤ 2√13`. **Boundary**:
  `∑_{x ∈ 𝔽_p} e((x^p − x)/p) = p`; `p ∣ deg f` and 4.8 does not apply.
- 4.9: for `y² = x⁴ + x + 1` over `𝔽_p`, `p < 200`, `|N − p| ≤ 0.58 · 3√p`.

### Kloosterman sums to composite and prime-power moduli

- 7.4: `S(1, 1; 15) = −2.6180 = S(2, 2; 3) · S(2, 2; 5) = (−1) · (2 + 2cos(2π/5))`.
- 7.5: `S(1, 1; 25) = 2 · 5 · cos(4π/25) = 8.7631`; `S(1, 2; 25) = 0` (`2` is a non-square modulo
  `5`); `S(1, 1; 27) = −2 · 3^{3/2} sin(4π/27) = −4.6641` (`ε_{27} = i`, `(1/3)³ = 1`);
  `S(1, 1; 81) = 17.7838` (`ε_{81} = 1`); `S(1, 1; 49) = 14 cos(4π/49) = 13.5421`; `S(1, 3; 49) = 0`;
  `S(2, 3; 125) = −0.8428` (`ℓ = 16`, `16² = 256 ≡ 6 = 2·3`); `S(1, 1; 125) = 22.2478`;
  `S(1, 4; 125) = −21.9102` (`ℓ = 2`, `(2/5)³ = −1`).
- 7.3: `S(m, 0; 12) = 0, 2, 0, −2, −4, 4` for `m = 1, 2, 3, 4, 6, 0`, the Ramanujan sums
  `∑_{d ∣ (m, 12)} μ(12/d) d`; `τ(1_{12}) = μ(12) = 0`.
- 7.6: `|S_χ(1, 1; 15)| = 1.9021 ≤ 4√15` for `χ` of order `4` modulo `5` viewed modulo `15`;
  `|S_χ(1, 1; 25)| ∈ {0, 5} ≤ 2 · 5` for the eight primitive `χ` of order `20` modulo `25`.
  **Boundary**: `|S_χ(1, 15; 17³)| = 289 > τ(17³) · 17^{3/2} = 280.37` for a primitive `χ` of
  order `4624`: the twisted bound needs `c` cube-free or the conductor factor `𝔠_χ^{1/2}`.

### Jacobi and Gauss sums modulo composite `N`

- 7.2: whenever `χψ` is primitive, `J(χ, ψ)τ(χψ) = τ(χ)τ(ψ)` and the denominator
  is nonzero, so the quotient formula holds. For an order-six character modulo `9`,
  `J(χ,χ⁻¹) = 0`, `τ(χ)τ(χ⁻¹) = −9`, and `τ(1_9) = 0`: the cross-multiplied
  equality fails (`0 ≠ −9`). Classical division by `τ(1_9)` is undefined; Lean's
  totalized division gives `−9/0 = 0`, so this pair does not refute the quotient equality.
- 7.1: `τ(χ) = μ(N/f) χ^∗(N/f) τ(χ^∗)` for every `χ` modulo `12, 15, 18, 20`; `τ(1_{12}) = 0`,
  `τ(1_7) = −1`.

### Boundary and off-hypothesis checks, collected

- `g(1) = −1`, `J(1, 1) = q − 2`, `J(1, χ) = −1`: Mathlib's `χ(0) = 0` convention; a source with
  `1(0) = 1` has `g(1) = 0` and `J(1, 1) = q` instead.
- `gaussSum χ 1 = 0` for `χ ≠ 1`: the trivial additive character is excluded from every estimate.
- `K(1; a, 0) = −1`, `K(1; 0, 0) = q − 1`: the Weil bound `2√q` fails only at `(0, 0)`.
- `K(η; a, b) = 0` when `ab` is a non-square (5.3): the bound `2√q` is not attained there.
- `J(χ, χ⁻¹) = −χ(−1)`, not of absolute value `√q`: the hypothesis `χψ ≠ 1` of 2.2.
- `J(χ, χ⁻¹)τ(1) = 0 ≠ −9 = τ(χ)τ(χ⁻¹)` for the order-six character modulo `9`:
  the cross-multiplied identity requires the primitivity hypothesis of 7.2; totalized division masks this failure.
- `f = X²` in 4.7 and `f = X^p − X` in 4.8: the non-power and `p ∤ n` hypotheses.
- `S(1, 2; 25) = 0`: the non-square branch of 7.5; `S(0, 0; 12) = φ(12)`, not `12`: the sum is over
  units.
- Stickelberger: `v(g(ω^{+a}))` at the same prime is `6 − a` for `q = 7` and `1 ≤ a ≤ 5`, not `a`: the theorem is
  about `ω^{−a}`.
- Gross–Koblitz: `g(ω^{−a}) = −π^a Γ_7(a/6)` and not `−π^a Γ_7(1 − a/6)` for `a ≠ 3` (6.4): the
  fractional part is `⟨a/(q−1)⟩`; the congruence of 6.2 holds for `λ = ζ_7 − 1` and not for `π`.
- `|S_χ(1, 15; 17³)| = 289 > 280.37 = τ(17³) 17^{3/2}`: the twisted Weil bound of 7.6 carries the
  factor `𝔠_χ^{1/2}` unless `c` is cube-free; the untwisted bound holds for every `c`.

## Provenance

This section is secondary: it maps targets to existing Lean formalizations and prescribes nothing.
Two Apache-2.0 repositories formalize the étale-cohomological side of the Weil conjectures, on Lean
and Mathlib versions other than this roadmap's pins:
[`AxiomMath/Weil`](https://github.com/AxiomMath/Weil) at commit `27cdb20` (Lean `v4.34.0-rc2`,
Mathlib `16edf57`; it requires [`AxiomMath/Stacks`](https://github.com/AxiomMath/Stacks)) and
[`formal-arithmetic-geometry/weil-conjectures`](https://github.com/formal-arithmetic-geometry/weil-conjectures)
at commit `55abf46` (Lean `v4.33.1`). Neither is a supplier: no target or route of this roadmap
passes through étale cohomology or purity. The overlap is small.

- **4.9.** `Weil/AlgebraicGeometry/EtaleCohomology/Trace/WeilRiemannHypothesisForm.lean` (Weil)
  states the Riemann-hypothesis form of the Weil conjectures for a smooth proper geometrically
  irreducible scheme over `𝔽_q`, and `WeilConjectures/ZetaFunction/HasseWeil.lean`
  (weil-conjectures) proves `|N − (q + 1)| ≤ 2g√q` for a smooth proper geometrically integral
  curve of genus `g`. Neither file states an affine count. For `y² = f(x)`, `p ≠ 2`, with `f`
  squarefree of degree `m` and leading coefficient `a`, the curve bound gives the count of 4.9 once
  the smooth projective model is known to have genus `⌊(m − 1)/2⌋` and `1` (odd `m`) or `1 + η(a)`
  (even `m`) rational points at infinity, the affine error then being at most `(m − 1)√q` or
  `(m − 2)√q + 1 ≤ (m − 1)√q`; the counts for `y^d = f(x)` and `y^p − y = f(x)` need the genus and
  the points at infinity of those models as well.
- **3.1 and 4.5–4.8.** weil-conjectures has the Artin–Schreier sheaf of `ψ(a x)` on the affine
  line with its trace function `x ↦ ψ(Tr(a x))` (`WeilConjectures/WeilSheaf/ArtinSchreierTrace.lean`),
  the `L`-series of a Weil sheaf as an Euler product over closed points with the
  logarithmic-derivative identity that 3.1 proves for monic polynomials
  (`WeilConjectures/WeilSheaf/LSeries.lean`), and the trace formula for the `L`-series of a lisse
  sheaf on a smooth affine curve through `H_c¹` and `H_c²` (`WeilConjectures/WeilSheaf/EulerProduct.lean`).
  These files do not assemble them into the `L`-polynomial of `∑_x ψ(f(x))`, its degree
  `deg f − 1` (4.6) or a bound. Weil proves that the `L`-function of a `ℚ_ℓ`-sheaf on a separated
  scheme of finite type over `𝔽_q` is rational
  (`Weil/AlgebraicGeometry/EtaleCohomology/Trace/LAdicTraceFormulaFinal.lean`).
- **Layers 0–2, 4.1–4.5 and 5–7.** Multiplicative characters and their Kummer sheaves, Gauss,
  Jacobi and Kloosterman sums and Stepanov's method have no counterpart in the modules above.

A proof adapted from either repository keeps its Apache-2.0 attribution. The statements of this
roadmap are specified independently of both.

## References

**K. Ireland and M. Rosen, *A Classical Introduction to Modern Number Theory*, 2nd ed., GTM 84.**
- Ch. 8 §§1–3: multiplicative characters, Gauss sums, Jacobi sums (Layers 0–2). §7 and Ch. 10 §3:
  multiple Jacobi sums and diagonal equations (2.4).
- Ch. 11 §4, Theorem 1: the Hasse–Davenport relation by the monic-polynomial `L`-series (3.1–3.3).
- Ch. 14 §§1–4: the Stickelberger relation; §§3–4 contain the congruence
  `g(ω^{−a}) ≡ −π^{s(a)}/∏ a_i!` and the digit-sum valuation, the statements 6.2 consumes; §3 has the Jacobi-sum
  valuation (6.3).

**R. Lidl and H. Niederreiter, *Finite Fields*, 2nd ed., Encyclopedia of Mathematics 20.**
- Ch. 5 §5.1 characters, §5.2 Gaussian sums (including the Davenport–Hasse lifting), §5.3 Jacobi
  sums, §5.4 character sums with polynomial arguments (Weil's bounds 4.7–4.8 and the
  Artin–Schreier and Kummer `L`-polynomials), §5.5 Kloosterman sums (5.1–5.5). ⚠ Their trivial
  character satisfies `χ(0) = 1`; every identity is re-derived here under Mathlib's `χ(0) = 0`.

**B. C. Berndt, R. J. Evans and K. S. Williams, *Gauss and Jacobi Sums*, Wiley 1998.**
- Ch. 1–2: Gauss and Jacobi sums (Layers 1–2); Ch. 6: Jacobsthal sums and Jacobsthal's theorem
  (2.5); Ch. 11 §11.3: the Hasse–Davenport product formula (3.4); Ch. 11 §11.5: the lifting
  relation (3.3).

**W. M. Schmidt, *Equations over Finite Fields: An Elementary Approach*, LNM 536, Springer 1976.**
- Ch. I: Stepanov's method for `y^d = f(x)` and `y^q − y = f(x)` (4.1–4.3), in the polynomial
  form used here. Ch. II: character sums and exponential sums, the `L`-function argument and the
  sharp constants (4.4–4.8).

**H. Iwaniec and E. Kowalski, *Analytic Number Theory*, AMS Colloquium 53.**
- Ch. 11: sums over finite fields; §11.7, the Stepanov proof of Weil's bound for Kloosterman sums,
  Theorem 11.11 (`|S(a, b; p)| ≤ 2√p`) and its corollary (11.58) for general moduli (4.3 (ii),
  5.5, 7.6).
- Ch. 12 §12.3: Kloosterman sums to prime-power moduli, twisted multiplicativity and the
  evaluation (12.39) (7.4–7.5); §12.4, Lemma 12.4: Salié sums (5.3).

**E. Bombieri, *Counting points on curves over finite fields (d'après S. A. Stepanov)*, Sém.
Bourbaki 430 (1972/73).** Background for Stepanov's method only: its Theorem 1 bounds the points
of a curve of genus `g` through the Riemann–Roch theorem on the curve, which is not the polynomial
form of 4.2–4.3; nothing is consumed from it.

**A. Weil, *On some exponential sums*, Proc. Nat. Acad. Sci. USA 34 (1948), 204–207.** The
bounds 4.7, 4.8, 5.5 as originally stated.

**L. C. Washington, *Introduction to Cyclotomic Fields*, 2nd ed., GTM 83.** Ch. 6 §6.2: Gauss
sums, the Stickelberger congruence and the ideal factorization (6.2).

**S. Lang, *Cyclotomic Fields I and II*, GTM 121.** Ch. 1 §§1–2: the Teichmüller character and
Stickelberger's theorem (6.1–6.2).

**F. Beukers, H. Cohen and A. Mellit, *Finite hypergeometric functions*, arXiv:1505.02900.**
Definition 1.1 (Gauss sums `g(ω^m)` for a fixed generator `ω`) and Theorem 1.3 (the reduction
using the Hasse–Davenport product formula): the shape of the API that `HypergeometricMotives`
consumes from Layers 1 and 3.

**K. Conrad, *Gauss and Jacobi sums on finite fields and Z/mZ*.**
Appendix (A.6), p. 19: the product normalization used in the supplier contract of 3.4.

**B. H. Gross and N. Koblitz, *Gauss sums and the p-adic Γ-function*, Ann. of Math. 109 (1979),
569–581.** Theorem 1.7: the formula consumed in 6.4 through `DirichletPadicLFunctions` §4.5, with
Morita's `Γ_p` and the normalization `π^{p−1} = −p`; Lemma 2.3: the reflection formula behind the
consistency check of 6.5.

**A. Knightly and C. Li, *Kuznetsov's trace formula and the Hecke eigenvalues of Maass forms*,
Mem. Amer. Math. Soc. 224 (2013), no. 1055 (arXiv:1202.0189).** §9.1, Theorem 9.3 ((9.7), (9.8)):
the Weil bound for twisted Kloosterman sums to a prime-power modulus with the conductor factor
`𝔠_χ^{1/2}`; Theorem 9.2 (with `n = 1`): the same for every modulus; Example 9.9: `|S_χ(a, b; p³)| = p²`
for primitive `χ` modulo `p³`, so the untwisted constant fails for twisted sums (7.5–7.6).

**N. M. Katz, *Gauss Sums, Kloosterman Sums, and Monodromy Groups*, Annals of Math. Studies 116.**
Cited only as the boundary for the equidistribution of Kloosterman angles; nothing is consumed.

**The LMFDB knowls** `character.dirichlet.gauss_sum`, `character.dirichlet.jacobi_sum`,
`character.dirichlet.kloosterman_sum` (the definitions of 7.1–7.3) and `character.dirichlet.conrey`
(the names of the worked examples).
