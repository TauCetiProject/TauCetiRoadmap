# Roadmap: character sums over finite fields

Gauss sums, Jacobi sums, Kloosterman sums and the complete character sums `∑_x χ(f(x))`,
`∑_x ψ(f(x))` of a polynomial over a finite field `𝔽_q`, with the theorems that make them usable:
their absolute values, their behaviour under field extension (the Hasse–Davenport relations),
their prime factorization in cyclotomic fields (Stickelberger), their `p`-adic evaluation by
Morita's Gamma function (Gross–Koblitz), and Weil's square-root bounds,
proved by the elementary Stepanov method. The second half of the roadmap carries the same sums to
an arbitrary modulus `ℤ/cℤ`, which is where the LMFDB displays them: the Dirichlet character pages
show `τ_a(χ)`, `J(χ, ψ)` and `K(a, b, χ)` for every modulus, together with the bounds Weil's
theorem gives for them.

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
Stepanov's method, Kloosterman and Salié sums, Stickelberger, the `p`-adic Gamma function and
Gross–Koblitz, and the integer-modulus sums.

## Prerequisites

- Mathlib's finite fields (`FieldTheory/Finite/*`: `Fintype.card F = p ^ n`, the trace and norm to
  `ZMod p`, `FiniteField.trace_to_zmod_nondegenerate`, `GaloisField`, `X ^ q − X` splitting),
  multiplicative characters (`NumberTheory/MulChar/*`), additive characters
  (`Algebra/Group/AddChar`, `NumberTheory/LegendreSymbol/AddCharacter`), Gauss sums
  (`NumberTheory/GaussSum`), Jacobi sums (`NumberTheory/JacobiSum/Basic`), the quadratic character
  (`NumberTheory/LegendreSymbol/QuadraticChar/*`), Dirichlet characters
  (`NumberTheory/DirichletCharacter/*`), cyclotomic fields (`NumberTheory/Cyclotomic/*`,
  `NumberTheory/NumberField/Cyclotomic/*`), Hasse derivatives (`Polynomial.hasseDeriv`), the `p`-adic
  integers (`NumberTheory/Padics/*`), and the Fourier analysis of finite abelian groups
  (`Analysis/Fourier/FiniteAbelian/*`).
- The [classical arithmetic roadmap](../ClassicalArithmeticCompletion/README.md), Layer 1, for
  the cubic and quartic Gauss and Jacobi sums of primary primes and for Stickelberger's relation
  on the `m`-th power of a Gauss sum (1.55), and its Layer 7 for the Stickelberger congruence
  (7.12); this roadmap consumes those milestones by name and proves nothing about primary elements
  or reciprocity.
- Tau Ceti's Dirichlet-character Gauss sums (`TauCeti.NumberTheory.DirichletCharacter.GaussSum`),
  consumed in Layer 7.

## Scope and ownership

Five roadmaps border this one: the
[classical arithmetic roadmap](../ClassicalArithmeticCompletion/README.md) (cubic and quartic
Gauss and Jacobi sums of primary primes, power residue symbols, the Stickelberger congruence and
Stickelberger's relation for `Φ(P) = g(P)^m`, reciprocity laws), the [theta-series roadmap](../ThetaSeries/README.md) (Gauss
sums of a lattice and their reciprocity law, which are sums of `e(a‖y‖²/2c)` over `L/cL` and not
character sums), the [multiquadratic roadmap](../../Completed/Multiquadratic/README.md) (the
Kronecker symbol and genus theory), [Chebotarev](../Chebotarev/README.md) and
[arithmetic Dirichlet series](../../Completed/ArithmeticDirichletSeries/README.md) (the analytic
consumers of character sums over `ℤ`, none of which states a complete character sum over a finite
field). The automorphic spectral theory roadmap
([`AutomorphicSpectralTheory`](../AutomorphicSpectralTheory/README.md), §1.16) defines the
integer-modulus Kloosterman sum `S(m, n; c)` as `kloosterman_sum` with its symmetry, reality and
Ramanujan-sum evaluations; this roadmap's integer-modulus sum specializes to it and the comparison
is a milestone (7.3). [the congruence spectral gap roadmap](../CongruenceSpectralGap/README.md) (§§4.2a–4.2b) owns the untwisted all-rank
hyper-Kloosterman sum `hyperKloosterman F k ψ r` over every finite field, its Kloosterman-sheaf
realization and its Deligne bound `k q^{(k−1)/2}`; 5.1 identifies the untwisted rank-two case of
this roadmap's `kloostermanSum` with it, and 5.5's inequality at `χ = 1` is that bound at `k = 2`,
proved a second time here by Stepanov's method because 5.5 needs it for every `χ`. The Deligne
weights roadmap
([`DeligneWeightsAndPurity`](../DeligneWeightsAndPurity/README.md)) reaches Weil bounds through
étale cohomology and weights; nothing here depends on it, and no identification of this roadmap's
reciprocal roots with Frobenius eigenvalues of a sheaf is a target here.

`HypergeometricMotives`, drafted beside this one, consumes it: the finite hypergeometric sums of
Katz and Beukers–Cohen–Mellit are quotients of products of the Gauss sums `g(ω^m)` of Layer 1 for
a generator `ω` of the character group, and their rationality uses the Hasse–Davenport product
formula 3.4. `CurvesOverFiniteFields`, also drafted beside it, borders it: this
roadmap bounds *finite sums* by Stepanov's auxiliary-polynomial method applied to three explicit
plane curves (Layer 4) and never forms a zeta function, a divisor, or a function field. The zeta
functions of the corresponding Kummer and Artin–Schreier covers are
[`FunctionFieldArithmetic`](../FunctionFieldArithmetic/README.md)'s (Layer 5), and the statement
that the `L`-polynomials of Layers 3–5 divide their numerators is not restated or needed here.

### Owned here

- The **canonical additive character** `ψ_F(x) = e(Tr_{F/𝔽_p}(x)/p)` of a finite field, its
  primitivity, and the parametrization of all additive characters as its multiplicative shifts
  (Layer 0).
- The **multiplicative character group** of `F` as a cyclic group of order `q − 1`: generators,
  characters of a given order, both orthogonality relations, the Fourier expansion of a function on
  `F^×`, and the lifting of characters to a finite extension through the norm and the trace
  (Layer 0).
- **Gauss sums** `g(χ) = gaussSum χ ψ_F`: the trivial cases, shifts, absolute value, conjugation,
  the field of definition `ℚ(ζ_m, ζ_p)` and the Galois action on it (Layer 1).
- **Jacobi sums**, **multiple Jacobi sums**, the counts of points on diagonal equations they give,
  and **Jacobsthal sums** with Jacobsthal's theorem on `p = a² + b²` (Layer 2).
- The **`L`-series of a completely multiplicative function on monic polynomials**, its Euler
  product, the identity between its logarithmic derivative and the lifted sums over `𝔽_{q^n}`, and
  the root-power identity `S_n = −∑ ω_i^n` for an `L`-polynomial; the **Hasse–Davenport lifting
  relation** for Gauss and Jacobi sums, the **Hasse–Davenport product formula**, and the sign of
  the quadratic Gauss sum over every `𝔽_q` (Layer 3).
- **Stepanov's method**: the uniform point-count bounds for `y^d = f(x)`, `y^q − y = f(x)` and
  `y^q − y = a x^d + b x^{−d}`; the power-sum lemma; the polynomiality and degree of the
  `L`-series of a multiplicative or additive character sum of a polynomial; and **Weil's bounds**
  `|∑_x χ(f(x))| ≤ (m − 1)√q` and `|∑_x ψ(f(x))| ≤ (n − 1)√q` with their point-count
  corollaries (Layer 4).
- **Kloosterman sums** `K(χ; a, b)` on a finite commutative ring, their expansion in Gauss sums,
  **Salié's evaluation** for the quadratic character, the degree-two `L`-polynomial and the lifting
  relation, **Weil's bound** `|K(χ; a, b)| ≤ 2√q`, and the Kloosterman angle (Layer 5).
- The **Teichmüller character** of a prime of `ℚ(ζ_{q−1})` above `p` as a `MulChar`, the prime
  factorization of `g(ω^{−a})` in `ℚ(ζ_{q−1}, ζ_p)` for every `a` as a corollary of the consumed
  Stickelberger congruence, the **digit-sum formula for Jacobi sums**, **Morita's `p`-adic Gamma
  function** `Γ_p` with its continuity, functional and reflection equations, and the
  **Gross–Koblitz formula** `g(ω^{−a}) = −π^{s(a)} ∏_i Γ_p(⟨p^i a/(q−1)⟩)` with its Jacobi-sum
  corollary (Layer 6).
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
  `primitiveCharacter`, `ZMod.chineseRemainder`, and every lemma named in *What Mathlib supplies*.
  Nothing in this list is restated behind a private name.
- From the [classical arithmetic roadmap](../ClassicalArithmeticCompletion/README.md): 1.19 (the
  cube of a cubic Gauss sum), 1.53 (`J(χ_π, χ_π) = π` for the cubic character of a primary prime
  `π`) and 1.36 (`−χ(−1) J(χ, χ) = π`, that is `J(χ, χ) = −(−1)^{(p−1)/4} π`, for the quartic
  character of a primary Gaussian prime), 1.46 and 1.60 (the fourth and third powers of the quartic and cubic Gauss
  sums), 1.47 (`Φ(P) = g(P)^m ∈ ℤ[ζ_m]`), 1.55 (Stickelberger's relation `(Φ(P)) = P^γ`), 7.12
  (the Stickelberger congruence `∏ a_i! · (−g(ω^{−a})) ≡ (ζ_p − 1)^{s(a)} (mod 𝔓̃^{s(a)+1})`, whose
  exported consequence is the valuation `v_𝔓̃(g(ω^{−a})) = s(a)`; 1.55 uses that valuation inside its
  proof and does not export it), and 4.19 (the quadratic
  exponential sum `S_p(a)` and `S_p(1) = gaussSum χ ψ`). Layer 6 states 1.55 and 7.12 against the
  Teichmüller character 6.1 and derives from them the factorization of `(g(ω^{−a}))` for every `a`
  and the Jacobi digit-sum formula; it re-derives neither.
- From Tau Ceti: `gaussSum_mul_gaussSum_inv_eq_card_of_isPrimitive` and
  `gaussSumOfPrimitiveRoot` (`TauCeti.NumberTheory.DirichletCharacter.GaussSum`), used in 7.1;
  the Galois orbits of multiplicative characters (`TauCeti.NumberTheory.MulChar.GaloisOrbit`,
  cited in 0.5); Gauss's evaluation `∑_{r<N} e(r²/N) = (1 + i)(1 + (−i)^N)√N/2`
  (`TauCeti.NumberTheory.ModularForms.JacobiTheta.GaussSum`, `sum_range_cexp_two_pi_I_sq_div`),
  which with 4.19 of the classical arithmetic roadmap gives the sign of the quadratic Gauss sum
  over `𝔽_p` (1.4); the Conrey character `conreyCharacter N : (ZMod N)ˣ ≃* DirichletCharacter ℂ N`
  (`TauCeti.NumberTheory.DirichletCharacter.Conrey`), which names the characters in the worked
  examples.
- From [`AutomorphicSpectralTheory`](../AutomorphicSpectralTheory/README.md) §1.16: the
  integer-modulus sum `kloosterman_sum m n c = S(m, n; c)` with `kloosterman_sum_symm`,
  `kloosterman_real` and the Ramanujan-sum values `S(m, 0; c) = ∑_{d ∣ (m, c)} μ(c/d) d`. Milestone
  7.3 identifies it with the trivial-character specialization of this roadmap's `kloostermanSum`
  over `ZMod c`; its three facts are then inherited and not reproved.
- From [the congruence spectral gap roadmap](../CongruenceSpectralGap/README.md) §4.2a: the raw
  hyper-Kloosterman sum `hyperKloosterman F k ψ r = ∑_{x : Fin k → Fˣ, ∏ x_i = r} ψ(∑ x_i)`, which
  5.1 identifies with `kloostermanSum 1 ψ a b` at `k = 2`, `r = a b`; and §4.2b
  `hyperKloosterman_bound`, `‖hyperKloosterman F k ψ r‖ ≤ k q^{(k−1)/2}` for `ψ ≠ 1`, `k ≥ 1`, which
  5.5 records at `χ = 1`. Neither is redeclared here.
- From [Elliptic curves, Part II — Legendre models, descent and character
  interfaces](../EllipticLegendreCharacterInterfaces/README.md) 5.1: the character-sum point count
  of a normal-form Weierstrass equation over an odd finite field and `symmetric_cubic_trace_zero`,
  which 2.5 reads as the elliptic form of its Jacobsthal sums.

### Not owned here

- **Reciprocity laws, power residue symbols and primary elements**: the classical arithmetic
  roadmap, Layer 1. The Gauss and Jacobi sums here are indexed by abstract characters; which
  character is "the" cubic residue character of a primary prime is that roadmap's business.
- **The Kronecker symbol `(D/·)`** and the identification of real Dirichlet characters with it:
  the multiquadratic roadmap and the theta-series roadmap (2H there).
- **Gauss sums of a lattice** `G_L(a, c)`, their reciprocity and Milgram's formula: the
  theta-series roadmap, Layer 6. The one-dimensional case `∑_{y mod c} e(a y²/c)` is Gauss's
  quadratic exponential sum, owned by Tau Ceti (`sum_range_cexp_two_pi_I_sq_div`) and by the
  classical arithmetic roadmap's 4.19; this roadmap consumes it in 1.4 and never redefines it.
- **Zeta functions of curves and function fields** and the Riemann hypothesis for curves:
  [`FunctionFieldArithmetic`](../FunctionFieldArithmetic/README.md), Layer 5 (the root bound
  `|α_i| = √q` in §5.4). Weil polynomials: `CurvesOverFiniteFields`. The identification of the
  `L`-polynomials of Layers 3–5 with numerators of zeta functions is not a statement of this
  roadmap. The cohomological theory of weights and Deligne's theorem:
  `DeligneWeightsAndPurity`. The Kloosterman sheaf, the all-rank hyper-Kloosterman sums and their
  Deligne bound: [the congruence spectral gap roadmap](../CongruenceSpectralGap/README.md), §§4.2a–4.2b.
- **Finite hypergeometric sums**, Greene's and Katz's functions: `HypergeometricMotives`, which
  evaluates them `p`-adically through the Gross–Koblitz formula 6.5.
- **Selberg's `λ₁ ≥ 3/16`**, Kuznetsov's formula, and any use of Kloosterman sums in spectral
  theory: `AutomorphicSpectralTheory` and [the congruence spectral gap roadmap](../CongruenceSpectralGap/README.md) (whose `λ₁ ≥ 21/100`
  contains `3/16`).
- **Incomplete character sums** over `ℤ` (Pólya–Vinogradov, Burgess, short sums): the analytic
  number theory roadmaps. Everything here is a complete sum over a finite ring.
- **Conrey labels** and the ordering of characters: the Conrey character is Tau Ceti's, and the
  ordering of characters is a database convention, not a target. The worked examples use Conrey
  labels only as names.

## Pinned conventions

| Object | Convention |
|---|---|
| The field | `F` with `[Field F] [Fintype F]`; `q = Fintype.card F`; `p = ringChar F`, a prime; `f` with `q = p ^ f`. A general finite commutative ring is `R` with `[CommRing R] [Fintype R]`, and `ZMod c` is the integer-modulus case. |
| Multiplicative characters | Mathlib's `MulChar F ℂ`: `χ(0) = 0` **for every `χ`, including `χ = 1`**. So `∑_x χ(x) = 0` for `χ ≠ 1`, `∑_x 1(x) = q − 1`, `g(1) = −1` and `J(1, 1) = q − 2`. This is also the LMFDB's convention: its principal character `χ_q(1, ·)` is `0` off the units, so `τ_1(χ_q(1,·)) = μ(q)`. ⚠ Sources that set `χ(0) = 1` for the trivial character (Lidl–Niederreiter) shift `g(1)`, `J(1, χ)` and `J(1, 1)` by `1`; every statement here is checked against Mathlib's convention. |
| The quadratic character | `η_F := (quadraticChar F).ringHomComp (Int.castRingHom ℂ)`, the unique character of order `2` when `p ≠ 2`; for `p = 2` it is `1`. "`η`" always means this. |
| Characters of order `d` | Exist iff `d ∣ q − 1` (`MulChar.exists_mulChar_orderOf`). A **generator** `ω` of the character group is a character of exact order `q − 1`; the choice is a parameter of every statement that mentions one. The Teichmüller character of Layer 6 is the generator canonically attached to a prime of `ℚ(ζ_{q−1})` above `p`. |
| The canonical additive character | `ψ_F(x) = e(Tr_{F/𝔽_p}(x)/p)`, in Lean `stdAddChar F := (ZMod.stdAddChar).compAddMonoidHom (Algebra.trace (ZMod p) F)`, with `e(t) = exp(2πit)`. For `F = ZMod p` it is Mathlib's `ZMod.stdAddChar`. It is primitive. **Every unqualified `ψ` means `ψ_F`**, and `g(χ)`, `J`, `K(χ; a, b)` without a second argument are taken against it. Mathlib's `FiniteField.primitiveChar_to_Complex F` is a primitive additive character chosen through an abstract cyclotomic extension; 0.2 shows it is `ψ_F.mulShift u` for a unique unit `u`, and no theorem here is stated against it. |
| Gauss sums | `g(χ, ψ) = gaussSum χ ψ = ∑_{x ∈ F} χ(x) ψ(x)`, with the **plus sign** `e(+Tr(x)/p)`; `g(χ) := g(χ, ψ_F)`; the shifted sum `g_a(χ) := gaussSum χ (ψ_F.mulShift a) = ∑_x χ(x) ψ_F(a x)`, so `g_a(χ) = χ(a)⁻¹ g(χ)` for `a ≠ 0` (`gaussSum_mulShift`). The LMFDB's `τ_a(χ)` is `g_a(χ)` over `ZMod q`. Sources using `e(−Tr(x)/p)` (Katre) get the complex conjugate; the ideal `(g)` and `|g|` are unchanged. |
| Jacobi sums | `J(χ, ψ) = jacobiSum χ ψ = ∑_{x ∈ F} χ(x) ψ(1 − x)`; the `r`-fold sum `J(χ₁, …, χ_r) = ∑_{x₁ + ⋯ + x_r = 1} ∏ χ_i(x_i)` and `J₀(χ₁, …, χ_r)` with `∑ x_i = 0`. |
| Kloosterman sums | `K(χ; a, b) = K(χ, ψ; a, b) := ∑_{x ∈ R^×} χ(x) ψ(a x + b x⁻¹)` on a finite commutative ring `R`, `ψ` an additive character of `R`, `a, b ∈ R`. The sum is over **units**. `K(a, b) := K(1; a, b)`. On `ZMod c` with `ψ = ZMod.stdAddChar`: `S(m, n; c) := K(1; m, n)` and, for a Dirichlet character `χ` of modulus `N ∣ c`, `S_χ(m, n; c) := K(changeLevel χ; m, n)`. The LMFDB's `K(a, b, χ)` is `S_χ(a, b; q)` with `N = c = q`. |
| Salié sums | `S(χ := η; a, b)`, that is `K(η; a, b)`; no separate name. |
| Kloosterman angle | For `a b ≠ 0` in `F`, `θ_F(a, b) ∈ [0, π]` is defined by `K(a, b) = −2√q cos θ_F(a, b)`, equivalently the reciprocal roots of the `L`-polynomial 5.4 are `√q e^{±iθ}`. ⚠ Katz's normalization `Kl = 2√q cos θ` for the sum `−K` differs by the sign; the sign here is the one that makes `θ` the argument of a reciprocal root. |
| The `L`-series of a multiplicative function | For `λ` on monic polynomials over `F` with `λ(1) = 1` and `λ(gh) = λ(g)λ(h)`: `L(λ, T) = ∑_{g monic} λ(g) T^{deg g} ∈ ℂ⟦T⟧`. The lifted sum of degree `n` is `S_n(λ) = ∑_{α ∈ E} λ(minpoly_F α)^{n / deg α}` for `E/F` of degree `n`. When `L(λ, T) = ∏_{i<k} (1 − ω_i T)`, `S_n(λ) = −∑_i ω_i^n`; the `ω_i` are the **reciprocal roots**. |
| Hasse–Davenport lifting | `−g(χ ∘ N_{E/F}, ψ ∘ Tr_{E/F}) = (−g(χ, ψ))^{[E:F]}`, with the **minus signs**. |
| The Teichmüller character | For a prime `𝔓` of `𝓞_{ℚ(ζ_{q−1})}` above `p`, `ω_𝔓 : MulChar (𝓞 ⧸ 𝔓) 𝓞` is the unique character with `ω_𝔓(x) ≡ x (mod 𝔓)`. Stickelberger's statements are about `g(ω_𝔓^{−a})`, `0 ≤ a < q − 1`, with the digit sum `s(a) = ∑ a_i` for `a = ∑_{i<f} a_i p^i`, `0 ≤ a_i < p`. |
| `p`-adic normalization | `L_𝔓̃` is the completion of `ℚ(ζ_{q−1}, ζ_p)` at `𝔓̃`; `π ∈ L_𝔓̃` is the root of `π^{p−1} = −p` with `ζ_p ≡ 1 + π (mod π²)`; `Γ_p` is Morita's, `Γ_p(n) = (−1)^n ∏_{0<j<n, p∤j} j` on `ℕ`, so `Γ_p(0) = 1`, `Γ_p(1) = −1`; `⟨x⟩ ∈ [0, 1)` is the fractional part. |
| `ε_q` | `ε_q = 1` if `q ≡ 1 (mod 4)` and `ε_q = i` if `q ≡ 3 (mod 4)`, for odd `q` (a prime power or a modulus). |
| Twisted multiplicativity | For coprime `c₁, c₂` and `c = c₁ c₂`: `S_χ(m, n; c) = S_{χ₁}(m c̄₂, n c̄₂; c₁) · S_{χ₂}(m c̄₁, n c̄₁; c₂)`, where `c̄₂ c₂ ≡ 1 (mod c₁)`, `c̄₁ c₁ ≡ 1 (mod c₂)` and `χ = χ₁ χ₂` is the Chinese-remainder factorization. |
| Valuations of ideals | `v_𝔓(I) = multiplicity 𝔓 I`, the number-field roadmap's convention. |
| Conditional statements | None. Every bound here is a theorem. |

## What Mathlib supplies

Additive characters: `AddChar`, `AddChar.mulShift`, `mulShift_mul`, `inv_mulShift`,
`AddChar.IsPrimitive`, `to_mulShift_inj_of_isPrimitive`, `IsPrimitive.of_ne_one` (on a field every
nontrivial additive character is primitive), `AddChar.sum_eq_zero_of_ne_one`, `sum_mulShift`,
`AddChar.card_eq` (`#AddChar α ℂ = #α`), `sum_apply_eq_ite` (dual orthogonality),
`ZMod.stdAddChar`, `stdAddChar_apply`, `isPrimitive_stdAddChar`, `AddChar.zmodChar`,
`FiniteField.primitiveChar`, `FiniteField.primitiveChar_to_Complex` and its primitivity.

Multiplicative characters: `MulChar`, `map_nonunit`, `MulChar.inv_apply'`, `star_eq_inv`,
`apply_mem_rootsOfUnity`, `ringHomComp` and its injectivity lemmas, `IsQuadratic`,
`sum_eq_zero_of_ne_one`, `sum_one_eq_card_units`, `orderOf_dvd_card_sub_one`,
`exists_mulChar_orderOf`, `exists_mulChar_orderOf_eq_card_units`, `equiv_rootsOfUnity`
(`MulChar M R ≃* rootsOfUnity (#Mˣ) R` for cyclic `Mˣ`), `ofRootOfUnity`,
`card_eq_card_units_of_hasEnoughRootsOfUnity`, `exists_apply_ne_one_of_hasEnoughRootsOfUnity`,
`apply_mem_algebraAdjoin` (values in `ℤ[ζ_m]`), `val_neg_one_eq_one_of_odd_order`.

Gauss sums (`Mathlib/NumberTheory/GaussSum.lean`): `gaussSum`, `gaussSum_mulShift`
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
`quadraticChar_odd_prime`, `legendreSym`, `jacobiSym`, `ZMod.χ₄`, `ZMod.χ₈`.

Dirichlet characters: `DirichletCharacter R n := MulChar (ZMod n) R`, `changeLevel`,
`FactorsThrough`, `conductor`, `IsPrimitive`, `primitiveCharacter`, `sum_characters_eq`,
`sum_char_inv_mul_char_eq` (orthogonality over `ZMod n`), `gaussSum_mulShift_of_isPrimitive`,
`gaussSum_eq_zero_of_isPrimitive_of_not_isPrimitive`, `factorsThrough_of_gaussSum_ne_zero`,
`DirichletCharacter.rootNumber`.

Finite fields and polynomials: `Algebra.trace`, `Algebra.norm`, `Algebra.norm_zero`,
`FiniteField.trace_to_zmod_nondegenerate`, `FiniteField.roots_X_pow_card_sub_X`,
`FiniteField.splits_X_pow_card_sub_X`, `GaloisField p n`, `FiniteField.algEquivOfCardEq`,
`Polynomial.hasseDeriv` with `hasseDeriv_mul`, `hasseDeriv_apply`, `Polynomial.rootMultiplicity`,
`Polynomial.card_roots'`, `Polynomial.roots`, `minpoly`, `AdjoinRoot`, `PowerSeries`,
`PowerSeries.C`, `PowerSeries.X`, `PowerSeries.exp`.

Cyclotomic fields: `IsCyclotomicExtension`, `CyclotomicField`, `IsPrimitiveRoot`,
`IsCyclotomicExtension.zeta`, `IsCyclotomicExtension.Rat.zeta_sub_one_prime'`
(`ζ_p − 1` generates a prime), `IsCyclotomicExtension.Rat.torsionOrder_eq`,
`NumberField.Embeddings.pow_eq_one_of_norm_eq_one`, `Ideal.IsPrime`, `Ideal.LiesOver`,
`multiplicity`, `Ideal.Quotient.field`.

Arithmetic functions: `ArithmeticFunction.sigma 0` (`τ(c)`), `ArithmeticFunction.moebius`,
`Nat.totient`, `Nat.digits`.

`p`-adic integers: `PadicInt` (`ℤ_[p]`), its completeness and ultrametric norm, `PadicInt.toZMod`,
`PadicInt.toZModPow`, `PadicInt.appr`, `PadicInt.ext_of_toZModPow`, `Padic`, `padicNormE`.

## What Tau Ceti supplies

At the pin: `gaussSum_mul_gaussSum_inv_eq_card_of_isPrimitive` and
`gaussSum_sq_of_isPrimitive_of_isQuadratic` for primitive Dirichlet characters of any modulus,
`gaussSumOfPrimitiveRoot` with `map_gaussSumOfPrimitiveRoot`, `gaussSumOfPrimitiveRoot_ne_zero`
and `stabilizer_gaussSumOfPrimitiveRoot` (`TauCeti.NumberTheory.DirichletCharacter.GaussSum`);
`FiniteField.primitiveChar_to_Complex_ne_one` (`TauCeti.NumberTheory.LegendreSymbol.Complex`);
`MulChar.ofUnitHom_inv_eq_star` (`TauCeti.NumberTheory.MulChar.Lemmas`).

On Tau Ceti's main branch beyond the pin, cited by module path and consumed through prose:
`gaussSum_mul_gaussSum_inv_eq_neg_one_mul_card_of_isPrimitive`
(`TauCeti.NumberTheory.DirichletCharacter.GaussSum`); the Galois-orbit API
`MulChar.galoisOrbit`, `mem_galoisOrbit_iff_exists_pow`, `mem_galoisOrbit_iff_exists_algHom`,
`ringHomComp_mem_galoisOrbit`, `exists_isPrimitiveRoot_apply`
(`TauCeti.NumberTheory.MulChar.GaloisOrbit`); Gauss's evaluation `sum_range_cexp_two_pi_I_sq_div`
(`TauCeti.NumberTheory.ModularForms.JacobiTheta.GaussSum`); the Conrey pairing and
`conreyCharacter` (`TauCeti.NumberTheory.DirichletCharacter.Conrey`).

## What is missing

Everything in *Owned here*. Mathlib has the definitions of Gauss and Jacobi sums and their algebraic
identities, and nothing about: a canonical complex additive character of `𝔽_q`, `|g(χ)| = √q` as a
norm statement, the field of definition and Galois action, multiple Jacobi sums, Jacobsthal sums,
any Hasse–Davenport relation, any `L`-series of a character sum, Stepanov's method, any Weil
bound, Kloosterman or Salié sums, the Teichmüller character as a multiplicative character, Morita's `p`-adic Gamma
function, the Gross–Koblitz formula, imprimitive or Chinese-remainder Gauss-sum formulas, or Jacobi and Kloosterman sums modulo a composite integer.
Tau Ceti adds the primitive Dirichlet Gauss-sum norm and the Conrey characters, and nothing from
the list either.

## Layer 0: characters of a finite field

Throughout, `F` is a finite field, `p = ringChar F`, `q = Fintype.card F`.

### 0.1 The canonical additive character

Define `stdAddChar F : AddChar F ℂ` as `ψ_F(x) = ZMod.stdAddChar (Tr_{F/𝔽_p} x)`, that is
`e(Tr(x)/p)` with the trace read in `{0, …, p − 1}`, through `Algebra.trace (ZMod p) F` for the
algebra structure `ZMod.algebra F p`. Prove: `stdAddChar_apply`; `ψ_F ≠ 1`
(`FiniteField.trace_to_zmod_nondegenerate`), hence `isPrimitive_stdAddChar` by
`AddChar.IsPrimitive.of_ne_one`; for `F = ZMod p`, `stdAddChar (ZMod p) = ZMod.stdAddChar`;
`ψ_F(−x) = conj (ψ_F x)` and `|ψ_F x| = 1`; `∑_x ψ_F(a x) = q·[a = 0]` (`AddChar.sum_mulShift`).
*Rests on:* Mathlib.

### 0.2 Every additive character is a shift of the canonical one

`a ↦ ψ_F.mulShift a` is a group isomorphism `(F, +) ≃ AddChar F ℂ`: injective by
`to_mulShift_inj_of_isPrimitive`, bijective by `AddChar.card_eq`. Consequently every nontrivial
additive character of `F` is primitive and equals `ψ_F.mulShift u` for a unique `u ≠ 0`; in
particular `FiniteField.primitiveChar_to_Complex F = ψ_F.mulShift u` for a unique unit `u`, and
`gaussSum χ (ψ_F.mulShift u) = χ(u)⁻¹ g(χ)`, so every statement about `g(χ)` transfers to any
primitive character up to a root of unity. The dual orthogonality `∑_{ψ} ψ(x) = q·[x = 0]` is
Mathlib's `AddChar.sum_apply_eq_ite`. *Rests on:* 0.1.

### 0.3 The multiplicative character group

`MulChar F ℂ` is cyclic of order `q − 1` (`MulChar.equiv_rootsOfUnity` with `IsCyclic Fˣ`). Prove
the two orthogonality relations in the form the sums below use: `∑_{x ∈ F} χ(x) = (q − 1)[χ = 1]`
(Mathlib for `χ ≠ 1`, `sum_one_eq_card_units` for `χ = 1`) and `∑_{χ} χ(x) = (q − 1)[x = 1]` for
`x ∈ F` (zero for `x = 0` and for `x ≠ 0, 1`; Mathlib has the `ZMod n` case as
`DirichletCharacter.sum_characters_eq`), and the **power count**
`#{y ∈ F : y^d = c} = 1 + ∑_{χ^d = 1, χ ≠ 1} χ(c)` for every `c ∈ F` and every `d ∣ q − 1` (the `1 +` is what makes the
identity hold at `c = 0`, where every `χ(0)`, including `1(0)`, is `0`; for `c ≠ 0` it is the usual
`∑_{χ^d = 1} χ(c)`). Prove the **Fourier expansion on `F^×`**: for every
`φ : F → ℂ`, `φ(x) = (q − 1)⁻¹ ∑_χ χ(x) ∑_{y ∈ F} φ(y) χ(y)⁻¹` for `x ≠ 0`. Construct, for each
generator `γ` of `Fˣ` and each primitive `(q − 1)`-th root of unity `ζ ∈ ℂ`, the generator `ω_{γ,ζ}`
of the character group with `ω(γ) = ζ` (`MulChar.ofRootOfUnity`), prove `orderOf ω = q − 1`, that
every character is `ω^m` for a unique `m mod q − 1`, and that `ω^m` has order `(q − 1)/gcd(m, q−1)`.
Record `MulChar.exists_mulChar_orderOf` as the existence of characters of each order `d ∣ q − 1`
and `orderOf_dvd_card_sub_one` as the converse. *Rests on:* Mathlib.

### 0.4 The quadratic character and parity

`η_F := (quadraticChar F).ringHomComp (Int.castRingHom ℂ)`. Prove: for `p ≠ 2`, `η ≠ 1`,
`η² = 1`, `η` is the unique character of order `2` (0.3 with `d = 2`), `η(x) = 1` iff `x` is a
nonzero square, `η(−1) = (−1)^{(q−1)/2}` (`quadraticChar_neg_one`), and `#{y : y² = x} = 1 + η(x)`
(`quadraticChar_card_sqrts`). For every `χ`, `χ(−1) = ±1` and `χ(−1) = 1` when `orderOf χ` is odd
(`val_neg_one_eq_one_of_odd_order`), and `χ(−1) = (−1)^{(q−1)/orderOf χ}` when `orderOf χ` is
even, because `−1 = γ^{(q−1)/2}` for a generator `γ` and `χ(γ)` is a primitive root of unity of
order `orderOf χ`. *Rests on:* 0.3, Mathlib.

### 0.5 Conjugation and the Galois action on character values

`star χ = χ⁻¹` and `|χ(x)| = 1` for `x ≠ 0` (Mathlib). The values of `χ` lie in `ℤ[ζ_m]`,
`m = orderOf χ`, and `χ(x)` is a primitive `m`-th root of unity for some `x`
(`MulChar.apply_mem_algebraAdjoin`; Tau Ceti's `exists_isPrimitiveRoot_apply`). For a ring
endomorphism `σ` of `ℂ` with `σ(ζ_m) = ζ_m^t`, `χ.ringHomComp σ = χ^t`; this is Tau Ceti's
`mem_galoisOrbit_iff_exists_algHom` and `ringHomComp_mem_galoisOrbit`, consumed, with the
exponent `t` made explicit here as a lemma `ringHomComp_eq_pow`. *Rests on:* 0.3, Tau Ceti.

### 0.6 Lifting characters to a finite extension

For a finite extension `E/F` of degree `n` define `χ.liftNorm : MulChar E ℂ := χ ∘ N_{E/F}` and
`ψ.liftTrace : AddChar E ℂ := ψ ∘ Tr_{E/F}` (`AddChar.compAddMonoidHom`). Prove: `N_{E/F}` and
`Tr_{E/F}` are surjective onto `F` (the norm because `E^×` is cyclic of order `q^n − 1` and
`N(x) = x^{(q^n−1)/(q−1)}`; the trace by nondegeneracy); hence `orderOf χ.liftNorm = orderOf χ`,
lifting is an injective group homomorphism `MulChar F ℂ →* MulChar E ℂ` whose image is the
subgroup of characters trivial on `ker N`, and `(stdAddChar F).liftTrace = stdAddChar E`
(transitivity of the trace). `η_F.liftNorm = η_E` when `p ≠ 2`. The characters of `E^×` of order
dividing `d ∣ q − 1` are exactly the lifts of those of `F^×`. *Rests on:* 0.1, 0.3, Mathlib.

### 0.7 Characters of a product ring

For finite commutative rings `R₁, R₂`, `MulChar (R₁ × R₂) ℂ ≃* MulChar R₁ ℂ × MulChar R₂ ℂ`
(restriction along `x ↦ (x, 1)` and `y ↦ (1, y)`, which carry nonunits to nonunits) and
`AddChar (R₁ × R₂) ℂ ≃* AddChar R₁ ℂ × AddChar R₂ ℂ` (Mathlib's `AddChar` is a `CommGroup`
written multiplicatively). Transport across
`ZMod.chineseRemainder : ZMod (c₁ c₂) ≃+* ZMod c₁ × ZMod c₂` for coprime `c₁, c₂`: the factor
characters `χ₁ := crtFactorLeft χ`, `χ₂ := crtFactorRight χ` of a Dirichlet character `χ` modulo
`c₁ c₂`, with `χ(x) = χ₁(x) χ₂(x)` (where `χ_i(x)` reads `x` modulo `c_i`), and
`ZMod.stdAddChar (c₁ c₂)` corresponds to
`(ZMod.stdAddChar c₁).mulShift c̄₂ × (ZMod.stdAddChar c₂).mulShift c̄₁`, with `c̄₂ c₂ ≡ 1 (mod c₁)` and `c̄₁ c₁ ≡ 1 (mod c₂)`. Prove that `χ` is primitive
iff both factors are, and `conductor χ = conductor χ₁ · conductor χ₂`. *Rests on:* Mathlib.

## Layer 1: Gauss sums

### 1.1 The definition of record and the trivial cases

`g(χ, ψ) = gaussSum χ ψ` and `g(χ) = gaussSum χ (stdAddChar F)`, with
`g_a(χ) = gaussSum χ (ψ_F.mulShift a)`. Record, as corollaries of Mathlib with `ψ_F` substituted: `g(1) = −1`;
`gaussSum χ 1 = 0` for `χ ≠ 1`; `gaussSum 1 1 = q − 1`; `g_a(χ) = χ(a)⁻¹ g(χ)` for `a ≠ 0`
(`gaussSum_mulShift`); `g_0(χ) = (q − 1)[χ = 1]`; `g(χ, ψ⁻¹) = χ(−1) g(χ, ψ)`
(`mul_gaussSum_inv_eq_gaussSum`); and the sum over all shifts `∑_a g_a(χ) = 0` for `χ ≠ 1`
(swap the sums). *Rests on:* 0.1, Mathlib.

### 1.2 Absolute value and conjugation

For `χ ≠ 1`: `g(χ) g(χ⁻¹) = χ(−1) q` (`gaussSum_mul_gaussSum_eq_card` and 1.1), `|g(χ)| = √q`
(`star_gaussSum_eq`), `conj g(χ) = χ(−1) g(χ⁻¹)`, `g(χ) ≠ 0`, and `g(χ)⁻¹ = χ(−1) g(χ⁻¹)/q`.
For `χ = 1`, `|g(1)| = 1`. A **boundary check**: `|g(χ, ψ)| = √q` for every nontrivial `ψ` (0.2),
and `|gaussSum χ 1| = 0`: the primitivity hypothesis in `gaussSum_mul_gaussSum_eq_card` is not
decorative. *Rests on:* 1.1, 0.2.

### 1.3 The field of definition and the Galois action

Let `m = orderOf χ`. `g(χ)` is an algebraic integer of `ℚ(ζ_m, ζ_p) = ℚ(ζ_{mp})` (its terms are
products of roots of unity), and the Galois group acts by: `σ_c : ζ_p ↦ ζ_p^c, ζ_m ↦ ζ_m` sends
`g(χ)` to `g_c(χ) = χ(c)⁻¹ g(χ)` for `c ∈ (ℤ/p)^×` read in `𝔽_p ⊆ F`;
`τ_t : ζ_m ↦ ζ_m^t, ζ_p ↦ ζ_p` sends `g(χ)` to `g(χ^t)` for `t ∈ (ℤ/m)^×` (0.5). Hence `g(χ)^m ∈ ℤ[ζ_m]` (fixed by all
`σ_c`), `g(χ)^m` is the classical arithmetic roadmap's `Φ(P)` when `χ` is the inverse power residue
character of 1.47 there, and `τ_t(g(χ)^m) = g(χ^t)^m`: conjugate algebraic integers of the same
absolute value `q^{m/2}` whose quotient is not a unit in general (for `q = 7`, `m = 3`,
`g(χ)³/g(χ²)³ = π/π̄` for the prime `π` of norm `7`). Prove also the **Frobenius invariance**
`g(χ^p) = g(χ)`: `x ↦ x^p` permutes `F` and `Tr(x^p) = Tr(x)`. *Rests on:* 1.1, 0.5, Mathlib's
cyclotomic fields. (The `p`-adic refinement of this factorization, the Gross–Koblitz formula, is 6.5.)

### 1.4 Quadratic Gauss sums over the prime field

For `p ≠ 2`: `g(η)² = η(−1) q` (`gaussSum_sq` with `isPrimitive_stdAddChar`; this is a bridge
check in `Suggested.lean`). For `F = ZMod p`: `g(η_p) = ∑_{r mod p} e(r²/p)` (4.19 (iii) of the
classical arithmetic roadmap, `quadraticExpSum_one_eq_gaussSum`, read against `ZMod.stdAddChar`,
which is `ψ_{ZMod p}` by 0.1) and therefore, by Gauss's evaluation
`∑_{r<N} e(r²/N) = (1 + i)(1 + (−i)^N)√N / 2` (Tau Ceti main,
`TauCeti.NumberTheory.ModularForms.JacobiTheta.GaussSum`), **`g(η_p) = ε_p √p`**: `√p` for
`p ≡ 1 (mod 4)` and `i√p` for `p ≡ 3 (mod 4)`. The sign over `𝔽_q` for `f > 1` is 3.3. *Rests on:*
1.2, the classical arithmetic roadmap 4.19, Tau Ceti main.

### 1.5 Gauss sums of characters of small order

Record the consequences of `gaussSum_pow_eq_prod_jacobiSum` in the shape the worked examples use:
for `orderOf χ = 3`, `g(χ)³ = q J(χ, χ)` (classical arithmetic 1.19); for `orderOf χ = 4`,
`g(χ)⁴ = q J(χ, χ)²` and `g(χ)² = J(χ, χ) g(η)` (`jacobiSum_mul_nontrivial`); for `orderOf χ = 6`,
`g(χ)⁶ = χ(−1) q ∏_{i=1}^{4} J(χ, χ^i)` with `χ(−1) = (−1)^{(q−1)/6}` by 0.4: `−1` for `q = 7`,
`+1` for `q = 13`. The
identification of `J(χ, χ)` with a primary prime for the residue characters of `ℤ[ω]` and `ℤ[i]`
(exactly `π` in the cubic case, `−χ(−1) π` in the quartic case) is classical arithmetic 1.53 and 1.36,
consumed in the worked examples and not reproved. *Rests on:*
1.1 and Mathlib's `gaussSum_pow_eq_prod_jacobiSum`; nothing from Layer 2 is needed.

## Layer 2: Jacobi and Jacobsthal sums

### 2.1 Jacobi sums: the trivial cases and symmetry

`J(χ, ψ) = jacobiSum χ ψ`. Record from Mathlib: `J(χ, ψ) = J(ψ, χ)`; `J(1, 1) = q − 2`;
`J(1, χ) = −1` for `χ ≠ 1`; `J(χ, χ⁻¹) = −χ(−1)` for `χ ≠ 1`. Prove the shift forms the point
counts use: `∑_x χ(x) ψ(c − x) = χψ(c) J(χ, ψ)` for `c ≠ 0`, `∑_x χ(x) ψ(−x) = χ(−1)(q − 1)[χψ = 1]`,
and `∑_x χ(x) ψ(a − b x) = χ(b)⁻¹ χψ(a) J(χ, ψ)` for `a ≠ 0`, `b ≠ 0`. *Rests on:* Mathlib.

### 2.2 The Gauss–Jacobi relation, absolute value and integrality

For `χ, ψ ≠ 1`, `χψ ≠ 1`: `J(χ, ψ) = g(χ) g(ψ) / g(χψ)` (Mathlib), `|J(χ, ψ)| = √q` (1.2),
`J(χ, ψ) J(χ⁻¹, ψ⁻¹) = q`, `conj J(χ, ψ) = J(χ⁻¹, ψ⁻¹)`, and `J(χ, ψ) ∈ ℤ[ζ_m]` for `m` the lcm of
the orders (`jacobiSum_mem_algebraAdjoin_of_pow_eq_one`). For `χ, ψ ≠ 1` with `χψ = 1` the value
is `−χ(−1)`, of absolute value `1`; this is the **boundary check** on the hypothesis `χψ ≠ 1`.
*Rests on:* 1.2, Mathlib.

### 2.3 Powers of Gauss sums and the two-squares theorem

Restate `gaussSum_pow_eq_prod_jacobiSum` against `ψ_F` and deduce: for `q = p ≡ 1 (mod 4)` and `χ`
of order `4`, `J(χ, χ) = a + b i ∈ ℤ[i]` with `a² + b² = p` (2.2), and `a` is odd and `b` even
(`J(χ, χ) ≡ χ(4)⁻¹ = χ(−1) (mod 2)`: the terms `x` and `1 − x` of `∑_x χ(x(1 − x))` agree and pair
off, leaving the fixed point `x = 1/2`); for
`q = p ≡ 1 (mod 3)` and `χ` of order `3`, `J(χ, χ) = a + b ω ∈ ℤ[ω]` with `a² − ab + b² = p`. The
normalizations `J(χ, χ) = −(−1)^{(p−1)/4} π` and `J(χ, χ) = π` for the residue characters of a
primary `π` are the classical arithmetic roadmap's 1.36 and 1.53. *Rests on:* 2.2, 1.5.

### 2.4 Multiple Jacobi sums and diagonal equations

Define `J(χ₁, …, χ_r) = ∑_{x₁ + ⋯ + x_r = 1} ∏ χ_i(x_i)` and
`J₀(χ₁, …, χ_r) = ∑_{x₁ + ⋯ + x_r = 0} ∏ χ_i(x_i)` for `r ≥ 1` (finite sums over the fibres of `x ↦ ∑ x_i`; `r = 2` recovers `jacobiSum`).
Prove: `J₀ = 0` if the product `∏χ_i ≠ 1` and `J₀ = χ_r(−1)(q − 1) J(χ₁, …, χ_{r−1})` if `∏χ_i = 1`;
`J(χ₁, …, χ_r) = g(χ₁)⋯g(χ_r) / g(∏χ_i)` if all `χ_i ≠ 1` and `∏χ_i ≠ 1`, and
`J(χ₁, …, χ_r) = −χ_r(−1) J(χ₁, …, χ_{r−1})` if all `χ_i ≠ 1` and `∏χ_i = 1`; hence
`|J(χ₁, …, χ_r)| = q^{(r−1)/2}` in the first case and `q^{(r−2)/2}` in the second. Deduce the
**number of solutions of a diagonal equation**: for `a_i ∈ F^×`, `d_i ∣ q − 1` and `b ∈ F`,
`#{x ∈ F^r : ∑ a_i x_i^{d_i} = b} = q^{r−1} + ∑ ∏χ_i(a_i)⁻¹ · (J or J₀ term)` over the tuples of
characters `χ_i ≠ 1` with `χ_i^{d_i} = 1`, and the bound `|N − q^{r−1}| ≤ ∏(d_i − 1) · q^{(r−1)/2}`
for `b ≠ 0` (Ireland–Rosen Ch. 8 §7 and Ch. 10 §3). *Rests on:* 2.2, 0.3 (the power count
`#{y : y^d = c} = 1 + ∑_{χ^d = 1, χ ≠ 1} χ(c)`; the tuples with a trivial entry contribute `q^{r−1}`
and `0`, the all-nontrivial tuples the Jacobi sums).

### 2.5 Jacobsthal sums

For `p ≠ 2` and `n ≥ 1` define `φ_n(a) = ∑_{x ∈ F} η(x) η(x^n + a)` and
`ψ_n(a) = ∑_{x ∈ F} η(x^n + a)`. Prove, for `a ≠ 0`: `ψ_n(a) = η(a) ∑_{χ^n = 1, χ ≠ 1} χ(−a) J(χ, η)` (from
`#{x : x^n = y} = ∑_{χ^n=1} χ(y)` for `y ≠ 0`, the term `x = 0` contributing `η(a)`, and 2.1), and
`φ_n(a) = η(a) ∑_{χ^n = η} χ(−a) J(χ, η)`, the sum over the characters `χ` with `χ^n = η`, which is
empty, so `φ_n(a) = 0`, unless `η` is trivial on the `n`-th roots of unity of `F` (from
`∑_{x^n = y} η(x) = ∑_{χ^n = η} χ(y)`). Record the closed forms: `ψ_2(a) = −1` for `a ≠ 0`,
`φ_1(a) = −1`, and `φ_2(a s²) = η(s) φ_2(a)`. **Jacobsthal's theorem** (`F = ZMod p`,
`p ≡ 1 (mod 4)`): `φ_2(1) = −2a` where `p = a² + b²` with `a ≡ 1 (mod 4)` (this pins the sign of
`a`), and `φ_2(r) = ±2b` for every non-square `r`. The sign normalization is verified in the
worked examples for `p = 5, 13, 17, 29, 37, 41`. **Elliptic reading**: `η(x³ + a x) = η(x) η(x² + a)`,
so `∑_x η(x³ + a x) = φ_2(a)` and the projective point count of `y² = x³ + a x` is `q + 1 + φ_2(a)`,
its trace `−φ_2(a)`, by the character-sum count of [Elliptic curves, Part II — Legendre models,
descent and character interfaces](../EllipticLegendreCharacterInterfaces/README.md) 5.1; the
vanishing `φ_2(a) = 0` for `η(−1) = −1` is that roadmap's `symmetric_cubic_trace_zero` (count
`q + 1`, trace `0` for `q ≡ 3 (mod 4)`). Over `𝔽_5`, `𝔽_7`, `𝔽_13`: `φ_2(1) = −2, 0, 6` and
`y² = x³ + x` has `4, 8, 20` points. *Rests on:* 2.2, 2.3, 0.4; Elliptic curves, Part II 5.1 for
the elliptic reading.

## Layer 3: the polynomial `L`-series and the Hasse–Davenport relations

This layer isolates one piece of machinery, the `L`-series of a multiplicative function on monic
polynomials, and uses it three times here and twice more in Layers 4 and 5. Its content is
Ireland–Rosen's proof of the Hasse–Davenport relation (Ch. 11 §4) written once, generically.

### 3.1 The `L`-series of a multiplicative function on monic polynomials

For `λ : F[X] → ℂ` with `λ(1) = 1` and `λ(g h) = λ(g) λ(h)` for monic `g, h`
(`IsMonicMultiplicative λ`; the values off monic polynomials are irrelevant), define
`L(λ, T) = ∑_{d ≥ 0} (∑_{g monic, deg g = d} λ(g)) T^d ∈ ℂ⟦T⟧`, the coefficient sums being over the
`q^d` monic polynomials `X^d + ∑_{i<d} c_i X^i` indexed by `c : Fin d → F`. Prove the **Euler
product** `L(λ, T) = ∏_{P monic irreducible} (1 − λ(P) T^{deg P})⁻¹` as an identity of power series
(unique factorization in `F[X]`, with the finite products converging `T`-adically), and the
**logarithmic derivative identity** `T · L'(λ, T) / L(λ, T) = ∑_{n ≥ 1} S_n(λ) T^n` with
`S_n(λ) = ∑_{P} deg P · λ(P)^{n / deg P}` over the monic irreducibles of degree dividing `n`.
Prove the **polynomial criterion**: if `∑_{deg g = d} λ(g) = 0` for all `d ≥ d₀`, then `L(λ, T)` is
a polynomial of degree `< d₀`. *Rests on:* Mathlib's `Polynomial`, `PowerSeries`,
`UniqueFactorizationMonoid`.

### 3.2 Lifted sums and the root-power identity

For `E/F` of degree `n`, prove `S_n(λ) = ∑_{α ∈ E} λ(minpoly F α)^{n / deg(minpoly F α)}`: the monic
irreducibles of degree `d ∣ n` are exactly the minimal polynomials of the elements of `E` of degree
`d`, each with `d` roots in `E` (`X^{q^n} − X` splits in `E` with simple roots and is the product of
those irreducibles). Call the right side `extensionSum E λ`. Prove the **root-power identity**: if
`L(λ, T) = ∏_{i<k} (1 − ω_i T)` then `S_n(λ) = −∑_{i<k} ω_i^n` for every `n ≥ 1`. *Rests on:*
3.1, Mathlib's finite-field splitting lemmas.

### 3.3 The Hasse–Davenport lifting relation

For `χ : MulChar F ℂ`, `ψ : AddChar F ℂ` put `λ(g) = χ((−1)^d c_0) ψ(−c_{d−1})` for
`g = X^d + c_{d−1} X^{d−1} + ⋯ + c_0`, that is `λ(g) = χ(∏ roots) ψ(∑ roots)`. It is monic
multiplicative, `∑_{deg g = 1} λ(g) = g(χ, ψ)`, and
`∑_{deg g = d} λ(g) = (∑_c ψ(c)) (∑_c χ(c)) q^{d−2} = 0` for `d ≥ 2` when `χ ≠ 1` and `ψ ≠ 1`; so `L(λ, T) = 1 + g(χ, ψ) T` and, since
`λ(minpoly α)^{n/deg α} = χ(N_{E/F} α) ψ(Tr_{E/F} α)`, 3.2 gives the **Hasse–Davenport relation**
`g(χ.liftNorm, ψ.liftTrace) = −(−g(χ, ψ))^n`, i.e. `−g' = (−g)^n`, for `χ ≠ 1`, `ψ ≠ 1`. Record the
degenerate cases separately: for `χ = 1`, `ψ ≠ 1` the relation holds as well, both sides being `−1`
(`L(λ, T) = 1 − T`); for `ψ = 1`, `χ ≠ 1` both sides vanish (`L(λ, T) = 1`); for `χ = 1 = ψ` it fails (`g = q − 1`,
`g' = q^n − 1`), so the relation carries the hypothesis `χ ≠ 1 ∨ ψ ≠ 1`. **Corollary (the sign of the
quadratic Gauss sum over `𝔽_q`)**: for `p ≠ 2`, `q = p^f`,
`g(η_F) = (−1)^{f−1} (ε_p √p)^f`, from 1.4 and `η_{𝔽_p}.liftNorm = η_F` (0.6); so `g(η) = 3` for
`𝔽_9`, `−5` for `𝔽_25`, `−3√3 i` for `𝔽_27`, `7` for `𝔽_49`. *Rests on:* 3.2, 1.4, 0.6.
(Ireland–Rosen Ch. 11 §4, Theorem 1; Lidl–Niederreiter Ch. 5 §5.2.)

### 3.4 The Hasse–Davenport product formula

For `m ∣ q − 1`, `λ` a character of exact order `m`, and any `χ`:
`∏_{j=0}^{m−1} g(χ λ^j) = χ(m)^{−m} g(χ^m) ∏_{j=1}^{m−1} g(λ^j)`, valid for every `χ` (when
`χ^m = 1` both sides contain the factor `g(1) = −1`). The case `m = 2` is the **duplication
formula** `g(χ) g(χη) = χ(4)⁻¹ g(χ²) g(η)`, equivalently `g(χ²) = χ(4) g(χ) g(χη) / g(η)`. Route of
record: Davenport–Hasse's original, which expresses both sides through Jacobi sums by 2.2 and proves
the resulting Jacobi-sum identity by counting solutions of `y^m = x` with 0.3, as in
Berndt–Evans–Williams Ch. 11 §11.3. The duplication formula is what the finite
hypergeometric sums of Beukers–Cohen–Mellit (Theorem 1.3 there) are reduced with. *Rests on:* 2.2,
0.3. **Check**: over `𝔽_13` with `χ` of order `12` and `m = 3`, both sides equal
`−44.8610 + 13.5828 i`.

### 3.5 Lifting Jacobi sums

For `χ, ψ ≠ 1` with `χψ ≠ 1` and `E/F` of degree `n`: `−J(χ.liftNorm, ψ.liftNorm) = (−J(χ, ψ))^n`,
from 2.2 and 3.3 applied to `χ`, `ψ`, `χψ`; and for `χψ = 1` the same relation holds, since then
`J(χ', ψ') = −χ'(−1) = −χ(−1)^n` and `−(−J(χ, ψ))^n = −χ(−1)^n`.
Hence `|J(χ', ψ')| = q^{n/2}`. *Rests on:* 3.3, 2.2.

## Layer 4: Stepanov's method and Weil's bounds for polynomial sums

The bounds of this layer are proved by the elementary method of Stepanov, as organized by Schmidt
and by Iwaniec–Kowalski: an auxiliary polynomial vanishing to high order at the points to be counted
gives a *weak* bound `|N − q| ≤ C √q` with `C` depending only on the degrees, uniformly over all
finite extensions; the `L`-series of Layer 3 then converts the uniform weak bound into the sharp
one through the power-sum lemma. No zeta function and no curve beyond the affine point set of a
single equation appears.

### 4.1 Hasse derivatives and the multiplicity criterion

For `f ∈ F[X]` and `k ≥ 1`: `x` is a root of `f` of multiplicity `≥ k` iff `(hasseDeriv j f)(x) = 0`
for all `j < k` (Mathlib's `Polynomial.hasseDeriv`, `hasseDeriv_apply`, `rootMultiplicity`; the
criterion is Taylor's formula `f(X + x) = ∑_j (hasseDeriv j f)(x) X^j`, valid in every
characteristic). Prove the **Leibniz rule**
`hasseDeriv k (f g) = ∑_{i+j=k} hasseDeriv i f · hasseDeriv j g` (Mathlib's `hasseDeriv_mul`), `hasseDeriv k (f^q) = 0` for `0 < k < q`, and the
**root-count inequality**: a nonzero `f` of degree `D` with roots of multiplicity `≥ k` at every
point of a set `S` has `k · #S ≤ D`. *Rests on:* Mathlib.

### 4.2 Stepanov's bound for `y^d = f(x)`

Let `d ≥ 2`, `f ∈ F[X]` of degree `m ≥ 1`, and suppose `f` is not of the form `c · g^e` with
`e > 1`, `e ∣ d`, `g ∈ F̄[X]` (equivalently, over `F` itself once `d ∣ q − 1`). There are `C`
and `Q₀`, depending only on `d` and `m`, such that for every finite extension `E/F` with
`|E| = Q ≥ Q₀`, `| #{(x, y) ∈ E² : y^d = f(x)} − Q | ≤ C √Q`. Route of record: Stepanov's
auxiliary polynomial on the `d` branches, as in Schmidt, *Equations over Finite Fields*, Ch. I
(the method for `y^d = f(x)`), with 4.1; any explicit admissible `(C, Q₀)` is acceptable, and the
statement is existential in them. The hypothesis on `f` is stable under extension of `F`, which is
what makes the bound uniform in `E`. *Rests on:* 4.1.

### 4.3 Stepanov's bound for Artin–Schreier equations

(i) For `f ∈ F[X]` of degree `n ≥ 1` with `p ∤ n`, there are `C, Q₀` depending only on `n` such
that for every finite extension `E/F` with `|E| = Q ≥ Q₀`,
`| #{(x, y) ∈ E² : y^q − y = f(x)} − Q | ≤ C √Q`. (ii) For `a, b ∈ F^×` and `d ≥ 1` with `p ∤ d`, there are `C, Q₀` depending only on
`d` such that `| #{(x, y) ∈ E^× × E : y^q − y = a x^d + b x^{−d}} − (Q − 1) | ≤ C √Q` for
`|E| = Q ≥ Q₀`. Route of record: Schmidt Ch. I for (i); for (ii) the auxiliary polynomial in
`F[x, x⁻¹]` of Iwaniec–Kowalski Ch. 11 §11.7 (the case `d = 1` is their proof of Weil's bound for
Kloosterman sums), with `x^d` in place of `x`. The coefficient `q` in `y^q − y` is `|F|`, so that
`#{y ∈ E : y^q − y = c} = q · [Tr_{E/F} c = 0]`. *Rests on:* 4.1.

### 4.4 The power-sum lemma

If `ω : Fin k → ℂ`, `ρ > 0`, `C ≥ 0` and `|∑_i ω_i^n| ≤ C ρ^n` for all `n ≥ n₀`, then `|ω_i| ≤ ρ`
for every `i`. Proof of record: the rational function `∑_i ω_i T / (1 − ω_i T)` has a pole at
`1/ω` for every value `ω` taken by the family (the residues `#{i : ω_i = ω}` are positive and cannot
cancel), while its Taylor series `∑_n (∑_i ω_i^n) T^n` has radius of convergence `≥ 1/ρ`. *Rests
on:* Mathlib's complex analysis (radius of convergence of a power series; `HasFPowerSeriesOnBall`
and the isolated-singularity lemma for a rational function with simple poles), or, equivalently,
Vandermonde linear algebra on the distinct values of `ω`.

### 4.5 The `L`-polynomial of a multiplicative character sum

For `χ ≠ 1` of order `d` and `f ∈ F[X]` nonzero, put `λ_f(g) := χ(N_{F[X]/(g)}(f))`, the character
of the resultant `Res(g, f) = ∏_{g(α)=0} f(α)` for monic `g` (`Algebra.norm F` on `AdjoinRoot g`).
It is monic multiplicative, `λ_f(X − c) = χ(f(c))`, and `λ_f(g)` depends only on `g` modulo the
radical `rad f` (it is a function of the values `g(α)` at the distinct roots `α` of `f`). Prove: if
`f` is not of the form `c · h^d`, `h ∈ F[X]`, then `∑_{deg g = e} λ_f(g) = 0` for every
`e ≥ m := deg(rad f)`, because the map `g ↦ g mod rad f` from monic polynomials of degree `e` onto
`F[X]/(rad f)` is `q^{e−m}`-to-one and `λ_f` is a nontrivial character of `(F[X]/(rad f))^×`
extended by zero; hence `L(λ_f, T)` is a polynomial of degree `≤ m − 1`, with
`S_1(λ_f) = ∑_{x ∈ F} χ(f(x))` and `S_n(λ_f) = ∑_{x ∈ E} χ(N_{E/F} f(x))`, the lifted sum. *Rests on:* 3.1,
3.2, 0.3, 0.6 (the characters of order dividing `d` of `E^×` are lifts). The boundary case: for
`f = c h^d`, `∑_x χ(f(x)) = χ(c) (q − #{roots of h in F})`, which is not `O(√q)`; the hypothesis
is necessary.

### 4.6 The `L`-polynomial of an additive character sum

For `ψ ≠ 1` and `f ∈ F[X]` of degree `n ≥ 1` with `p ∤ n`, put
`μ_f(g) := ψ(Tr_{F[X]/(g)}(f)) = ψ(∑_{g(α)=0} f(α))` for monic `g`. It is monic multiplicative, `μ_f(X − c) = ψ(f(c))`, and
`∑_{deg g = e} μ_f(g) = 0` for `e ≥ n`: writing `∑_{g(α)=0} f(α) = ∑_{j ≤ n} f_j p_j(g)` with
`p_j` the `j`-th power sum of the roots, Newton's identities give
`p_n(g) = −n c_{e−n}(g) + P(c_{e−1}, …, c_{e−n+1})` with `P` a polynomial, so for `e ≥ n` the coefficient `c_{e−n}` is
free and the sum over it of `ψ(−n f_n c_{e−n} + const)` vanishes because `n f_n ≠ 0`.
Hence `L(μ_f, T)` is a polynomial of degree `≤ n − 1`, `S_1(μ_f) = ∑_x ψ(f(x))`, and
`S_n(μ_f) = ∑_{x ∈ E} ψ(Tr_{E/F} f(x))`. *Rests on:* 3.1, 3.2. Boundary: for `f = X^p − X` over `F = 𝔽_p`,
`∑_x ψ(f(x)) = p`, and `p ∤ n` fails; the hypothesis is necessary.

### 4.7 Weil's bound for multiplicative character sums

For `χ ≠ 1` of order `d` and `f ∈ F[X]` nonzero, not of the form `c h^d`, with `m` distinct roots
in `F̄`: `|∑_{x ∈ F} χ(f(x))| ≤ (m − 1) √q`, and the reciprocal roots `ω_1, …, ω_{m−1}` of
`L(λ_f, T)` all satisfy `|ω_i| ≤ √q`. Proof of record. First reduce to the hypothesis of 4.2: if
`f = c h^e` for some `e > 1` dividing `d` (take `e` maximal), then `∑_x χ(f(x)) = χ(c) ∑_x χ^e(h(x))`
and `L(λ_f^{χ}, T) = L(λ_h^{χ^e}, χ(c) T)`, where `χ^e` has order `d/e`, `h` has the same `m` distinct
roots, and `h` is not `c' h'^{d/e}`; so it suffices to prove the bound when `f` is not `c h^e` for any
`e > 1` dividing `d`, which is the hypothesis of 4.2 and gives 4.5 for every nontrivial `χ'` with
`χ'^d = 1`. Then, by 0.3 and 0.6,
`#{(x, y) ∈ E² : y^d = f(x)} = Q + ∑_{χ'^d = 1, χ' ≠ 1} S_n(λ_f^{χ'})`, where the inner sums are the
lifted sums 4.5 of the `d − 1` nontrivial characters of order dividing `d`; 4.2 bounds the left side
by `C √Q` uniformly for `Q ≥ Q₀`; the root-power identity 3.2 writes the right side as
`−∑ ω^n` over the union of the reciprocal roots of the `d − 1` `L`-polynomials; 4.4 gives
`|ω| ≤ √q` for every one; and `S_1 = −∑ ω_i` has at most `m − 1` terms. (Weil 1948; Schmidt Ch. II;
Lidl–Niederreiter Ch. 5 §5.4.) *Rests on:* 4.2, 4.4, 4.5, 3.2.

### 4.8 Weil's bound for additive character sums

For `ψ ≠ 1` and `f ∈ F[X]` of degree `n ≥ 1` with `p ∤ n`: `|∑_{x ∈ F} ψ(f(x))| ≤ (n − 1) √q`, and
the reciprocal roots of `L(μ_f, T)` have `|ω_i| ≤ √q`. Proof of record:
`#{(x, y) ∈ E² : y^q − y = f(x)} = Q + ∑_{t ∈ F^×} S_n(μ_f^{ψ_t})` with `ψ_t = ψ.mulShift t` (0.2 and
`#{y : y^q − y = c} = ∑_{t ∈ F} ψ(t Tr c)`), 4.3 (i), 3.2 and 4.4 as in 4.7. (Weil 1948;
Lidl–Niederreiter Ch. 5 §5.4.) *Rests on:* 4.3, 4.4, 4.6, 3.2.

### 4.9 Point-count corollaries

For `d ∣ q − 1` and `f` nonzero with `m` distinct roots that is not of the form `c h^e` for any
`e > 1` dividing `d` (the hypothesis of 4.2, which makes 4.7 available for every nontrivial `χ'` with
`χ'^d = 1`): `|#{(x, y) ∈ F² : y^d = f(x)} − q| ≤ (d − 1)(m − 1) √q`. The stronger hypothesis is
necessary here, unlike in 4.7: `y⁴ = x²` over `𝔽_5` has `9` points, not `5`, and `y⁴ = (x² − 1)²` over
`𝔽_25` has `46`, while `(d − 1)(m − 1)√q` is `0` and `15`. In particular for a squarefree `f` of degree
`m` and `p ≠ 2`,
`|#{y² = f(x)} − q| ≤ (m − 1) √q`. For `f` as in 4.8:
`|#{(x, y) ∈ F² : y^p − y = f(x)} − q| ≤ (p − 1)(n − 1) √q`. Both are the counting identities of 4.7–4.8 at `E = F` with the bounds
summed. *Rests on:* 4.7, 4.8.

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
[the congruence spectral gap roadmap](../CongruenceSpectralGap/README.md) §4.2a (the map `x ↦ (a x, b x⁻¹)` is a bijection from
`Fˣ` onto the pairs of units with product `a b`); the twist `χ` and the finite ring `R` are what
this milestone adds to it. *Rests on:* 1.1, Mathlib; the congruence spectral gap roadmap §4.2a.

### 5.2 The Gauss-sum expansion

On a finite field, for every `χ` and `a, b ∈ F^×`:
`K(χ; a, b) = (q − 1)⁻¹ ∑_{θ} θ(b)⁻¹ (χθ)(a)⁻¹ g(θ) g(χθ)`, the sum over all multiplicative
characters `θ`. (For `a b = 0` the right side is `0` while `K(χ; a, 0) = χ(a)⁻¹ g(χ)` by 5.1: the
hypothesis is not decorative.) Proof: the Fourier expansion 0.3 of `x ↦ ψ(b x⁻¹)` on `F^×` is
`(q − 1)⁻¹ ∑_θ θ(b)⁻¹ g(θ) θ(x)`, and `∑_x (χθ)(x) ψ(a x) = (χθ)(a)⁻¹ g(χθ)`. Corollaries: for
`a b ≠ 0`, `K(χ; a, b)` is an algebraic integer of `ℚ(ζ_{q−1}, ζ_p)`; and for `χ = 1`, `F = 𝔽_p`,
`K(1; a, b) ∈ ℚ(ζ_p)^+ = ℚ(ζ_p + ζ_p⁻¹)` with Galois conjugates `K(1; t a, t b)`, `t ∈ 𝔽_p^×`
(equivalently `K(1; 1, t² a b)`). *Rests on:* 0.3, 1.1.

### 5.3 Salié's evaluation

For `p ≠ 2` and `a, b ∈ F^×`: `K(η; a, b) = η(b) g(η) ∑_{y ∈ F, y² = 4 a b} ψ_F(y)`; so
`K(η; a, b) = 0` when `a b` is a non-square and `K(η; a, b) = η(b) g(η) (ψ(y₀) + ψ(−y₀))` when
`y₀² = 4ab`, of absolute value `≤ 2√q`. Proof of record: in the Gauss-sum expansion 5.2 the
duplication formula 3.4 turns `g(θ) g(ηθ)` into `θ(4)⁻¹ g(θ²) g(η)`, so
`K(η; a, b) = η(a) g(η) (q − 1)⁻¹ ∑_θ θ(4ab)⁻¹ g(θ²)`; expanding `g(θ²) = ∑_y θ(y²) ψ(y)` and
summing over `θ` first, the orthogonality 0.3 leaves exactly the `y` with `y² = 4ab`. When `4ab` is a
square `η(a) = η(b)`; when it is not, both sides vanish, the right as an empty sum and the left
because the substitution `x ↦ b a⁻¹ x⁻¹` multiplies it by `η(ab) = −1`. (Iwaniec–Kowalski Ch. 12,
Lemma 12.4, for the prime modulus.) Consequence: for `F = 𝔽_p`,
`K(η; a, b) = ε_p √p (b/p) ∑_{y² ≡ 4ab} e(y/p)` (1.4). *Rests on:* 5.2, 3.4, 0.3, 1.4. **Checks**: `K(η; 1, 2)` over `𝔽_7` is `i√7 · 2cos(2π/7) = 3.2992 i`; `K(η; 1, 2)`
over `𝔽_5` is `0`.

### 5.4 The Kloosterman `L`-polynomial and the lifting relation

For `a, b ∈ F^×` and any `χ`, put `κ(g) := χ(s_d(g)) ψ(a·s₁(g) + b·s_{d−1}(g)/s_d(g))` for monic
`g` of degree `d` with `g(0) ≠ 0`, where `s_j` is the `j`-th elementary symmetric function of the
roots (so `s_d = (−1)^d g(0)`, `s₁ = −c_{d−1}`, `s_{d−1}/s_d = ∑_{g(α)=0} 1/α`), and `κ(g) = 0`
if `g(0) = 0`. Then `κ` is monic multiplicative with `κ(X − c) = χ(c) ψ(a c + b c⁻¹)`,
`∑_{deg g = 1} κ(g) = K(χ; a, b)`, `∑_{deg g = 2} κ(g) = χ(−b/a) q`, and `∑_{deg g = d} κ(g) = 0`
for `d ≥ 3` (the coefficient `s₁` is free and `a ≠ 0`); hence
`L(κ, T) = 1 + K(χ; a, b) T + χ(−b a⁻¹) q T²`. Writing `L(κ, T) = (1 − ω₁T)(1 − ω₂T)`,
`ω₁ + ω₂ = −K(χ; a, b)`, `ω₁ ω₂ = χ(−b/a) q`, and the **lifting relation**: for every finite
extension `E/F` of degree `n`, `K(χ.liftNorm, ψ.liftTrace; a, b) = −(ω₁^n + ω₂^n)`. *Rests on:*
3.1, 3.2, 0.6. (Lidl–Niederreiter Ch. 5 §5.5; the proof there is through 5.2 and 3.3, which is an
acceptable alternative route.) **Checks**: `𝔽_3 ⊂ 𝔽_9`, `a = b = 1`: `K_3 = −1`, `ω² − ω + 3 = 0`,
`K_9 = −(ω₁² + ω₂²) = 5`; `𝔽_7 ⊂ 𝔽_49` with `χ` of order `6`, `a = 1`, `b = 2`:
`K(χ; 1, 2) = 0.6027 − 0.3479 i` and `K_{49} = 6.7579 − 11.7050 i = −(ω₁² + ω₂²)`.

### 5.5 Weil's bound and the Kloosterman angle

For `a, b ∈ F^×` and any `χ`: `|ω₁| = |ω₂| = √q`, hence `|K(χ; a, b)| ≤ 2√q`. Proof of record:
for `χ` of order `d`,
`#{(z, y) ∈ E^× × E : y^q − y = a z^d + b z^{−d}} = (Q − 1) + ∑_{(χ', t) ≠ (1, 0)} K(χ'.liftNorm, ψ_t.liftTrace; a, b)` over the characters `χ'` of order
dividing `d` and `t ∈ F` (by 0.3, 0.6 and `#{y : y^q − y = c} = ∑_t ψ(t Tr c)`), where the terms
with `t = 0` and `χ' ≠ 1` vanish; 4.3 (ii) bounds the left side by `C √Q` uniformly; the root-power
identity 3.2 and 4.4 give `|ω| ≤ √q` for every reciprocal root of every `L(κ_{χ', t}, T)`; and
`|ω₁ ω₂| = q` forces equality. Define the **Kloosterman angle** `θ_F(a, b) ∈ [0, π]` for `χ = 1` by
`K(1; a, b) = −2√q cos θ_F(a, b)`, so that `ω_{1,2} = √q e^{±iθ}`, and prove
`K_{E}(a, b) = −2 q^{n/2} cos(n θ_F(a, b))` for `[E : F] = n`. At `χ = 1` the inequality is the congruence
spectral gap roadmap's `hyperKloosterman_bound` (§4.2b) at `k = 2`, through 5.1's identification;
the proof of record above is the one that covers every `χ`. (Weil 1948; Iwaniec–Kowalski Ch. 11 §11.7;
Lidl–Niederreiter Ch. 5 §5.5.) *Rests on:* 5.4, 4.3, 4.4, 3.2. **Checks**:
`S(1, 1; 5) = (3 − √5)/2 = 0.3820`, `S(1, 1; 7) = 2.0489`, `S(1, 1; 11) = −2.3579`,
`S(1, 1; 13) = 5.2595 ≤ 2√13 = 7.2111`; over `𝔽_9` the values `K(1; 1, b)` are `5, 2, −1, −4`, all `≤ 6`.

### 5.6 Degenerate parameters and the trivial additive character

Complete the case analysis: `K(χ, ψ; a, b)` for `ψ = 1` is `∑_{x ∈ Rˣ} χ(x) = #Rˣ·[χ = 1]`; on a
field with `a = 0 ≠ b`, `K(χ; 0, b) = χ(b) g(χ⁻¹)`; with
`a ≠ 0 = b`, `K(χ; a, 0) = χ(a)⁻¹ g(χ)`; with `a = b = 0`, `(q − 1)[χ = 1]`. So the bound `2√q`
of 5.5 holds for all `(a, b) ≠ (0, 0)`, and at `(0, 0)` it holds for `χ ≠ 1` and reads `q − 1 ≤ 2√q`
for `χ = 1`, true exactly for `q ≤ 5`. *Rests on:* 5.1, 1.1.

## Layer 6: the Teichmüller character and Stickelberger's theorem

Fix a prime `p`, `f ≥ 1`, `q = p^f`, a field `K` with `IsCyclotomicExtension {q − 1} ℚ K`, a prime
`𝔓` of `𝓞_K` above `p`, and a field `L` with `IsCyclotomicExtension {p} K L` (so
`L = ℚ(ζ_{q−1}, ζ_p)`). Let `𝔓̃` be a prime of `𝓞_L` above `𝔓` and `π = ζ_p − 1`. The Stickelberger congruence and
the digit-sum valuation of `g(ω^{−a})` are the classical arithmetic roadmap's 7.12 and 1.55; this
layer supplies the carrier they are stated against, the corollaries they leave open, Morita's `Γ_p`,
and the Gross–Koblitz formula that refines the congruence to an equality.

### 6.1 The residue field and the Teichmüller character

Prove `𝓞_K ⧸ 𝔓` is a finite field with `q` elements (the residue degree of `p` in `ℚ(ζ_{q−1})` is
the order of `p` modulo `q − 1`, which is `f`) and that reduction modulo `𝔓` is a bijection from
the `(q − 1)`-th roots of unity of `𝓞_K` onto `(𝓞_K ⧸ 𝔓)^×` (`X^{q−1} − 1` is separable modulo
`p`). Define `teichmuller 𝔓 : MulChar (𝓞_K ⧸ 𝔓) 𝓞_K` as the inverse bijection extended by zero,
prove `Ideal.Quotient.mk 𝔓 (teichmuller 𝔓 x) = x`, that it has order `q − 1` (a generator of the
character group, 0.3), and that for `m ∣ q − 1`, `ω_𝔓^{(q−1)/m}` is the `m`-th power residue
character `x ↦ x^{(q−1)/m} mod 𝔓` of the classical arithmetic roadmap's 1.23, so that 1.47's
`χ_P` there is `ω_𝔓^{−(q−1)/m}`. Tau Ceti's `teichmuller`
(`TauCeti.RingTheory.Henselian.Teichmuller`) is the local lift `(ResidueField R)ˣ →* Rˣ` of a
Henselian ring; `teichmuller 𝔓` takes its values in the global `𝓞_K`, and composing with
`𝓞_K → 𝓞_{K,𝔓}` recovers the local lift. *Rests on:* 0.3, Mathlib's cyclotomic fields and
`Ideal.Quotient.field`.

The definition, in full: `ω_𝔓 = teichmuller 𝔓` is the multiplicative character of the finite field
`𝓞_K ⧸ 𝔓` with values in `𝓞_K` that sends `0` to `0` and a unit `x` to the unique `(q − 1)`-th root
of unity `ζ ∈ 𝓞_K` with `ζ ≡ x (mod 𝔓)`. It depends on `𝔓`: the primes above `p` are permuted by
`Gal(K/ℚ)`, and so are their Teichmüller characters. No Lean declaration for it is in
`Suggested.lean`, because the character cannot be built without first proving the bijection above;
this milestone and every statement about `ω_𝔓` (6.2, 6.3, 6.5) are specified here only.

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
  `teichmuller` of the Henselian ring `𝓞_{K,𝔓}` (`TauCeti.RingTheory.Henselian.Teichmuller`).

### 6.2 Stickelberger's congruence and theorem, consumed

Let `ψ` be a primitive additive character of `𝓞_K ⧸ 𝔓` with values in `𝓞_L` (for instance
`x ↦ ζ_p^{Tr(x)}`), and for `0 ≤ a < q − 1` put
`g_a := gaussSum (ω_𝔓.ringHomComp (algebraMap 𝓞_K 𝓞_L))^{−a} ψ ∈ 𝓞_L`, with `a = ∑_{i<f} a_i p^i`, `0 ≤ a_i < p`, and `s(a) = ∑ a_i`. **Consumed**
from the [classical arithmetic roadmap](../ClassicalArithmeticCompletion/README.md): its 7.12, the
**Stickelberger congruence** `(∏_i a_i!) · (−g_a) ≡ π^{s(a)} (mod 𝔓̃^{s(a)+1})`, hence
`v_𝔓̃(g_a) = s(a)`; and its 1.55, the factorization `(g(χ_P)^m) = P^{∑_{(t,m)=1} t σ_t^{−1}}` in
`ℤ[ζ_m]` for `χ_P = ω_𝔓^{−(q−1)/m}`, `m ∣ q − 1`, with the full factorization of `(g(χ_P))` in
`ℚ(ζ_m, ζ_p)` by Galois conjugation. Both are stated there for the character `ω` of 6.1 and this
`ψ`; the identification is 6.1's defining congruence `ω_𝔓(x) ≡ x (mod 𝔓)`. Prove here what they leave open:
`𝔓 𝓞_L = 𝔓̃^{p−1}` (`π` generates the prime of `ℚ(ζ_p)` above `p`,
`IsCyclotomicExtension.Rat.zeta_sub_one_prime'`, and `p` is unramified in `K`);
`g_a g_{q−1−a} = ω^{−a}(−1) q` (1.2 read in `𝓞_L`); `v_𝔔(g_a) = 0` for every prime `𝔔` of `𝓞_L`
not above `p` (`|g_a|² = q` in every embedding); and, for `t ∈ (ℤ/(q−1))^×` with
`τ_t : ζ_{q−1} ↦ ζ_{q−1}^t` fixing `ζ_p`, `v_{τ_t^{−1}(𝔓̃)}(g_a) = s(t a mod (q − 1))` (1.3:
`τ_t g_a = g_{ta}`), hence the **ideal factorization for every `a`**
`(g_a) = ∏_{t ∈ (ℤ/(q−1))^× / ⟨p⟩} τ_t^{−1}(𝔓̃)^{s(ta)}`,
the product over the primes of `L` above `p` (indexed by `(ℤ/(q−1))^×/⟨p⟩` because `s(pa) = s(a)`
and the decomposition group of `𝔓` is `⟨p⟩`); 1.55 is its case `a = (q − 1)/m` raised to the
`m`-th power. *Rests on:* 6.1, 1.2, 1.3, the classical arithmetic roadmap's 7.12 and 1.55.
**Checks** (`q = 7`, `L = ℚ(ζ_42)`): the two primes above `7` have `(e, f) = (6, 1)`,
`v_𝔓̃(g_a) = a` and `v(g_a) = 6 − a` at the other prime, `N_{L/ℚ}(g_a) = 7^6` for `a ≠ 0`, and
`v_𝔓̃(g_a + π^a/a!) = a + 1` for `a = 1, …, 5`; (`q = 9`, `a = 5 = 2 + 1·3`): `s(a) = 3` and
`v_𝔓̃(g_5 + π³/2) ≥ 4`.

### 6.3 Jacobi sums and the digit-sum formula

For `0 ≤ a, b < q − 1` with `a + b ≢ 0 (mod q − 1)` and `a, b ≠ 0`:
`J(ω^{−a}, ω^{−b}) = g_a g_b / g_{a+b}` lies in `𝓞_K` (2.2 and 1.3: it is fixed by every `σ_c`), and
`v_𝔓(J(ω^{−a}, ω^{−b})) = (s(a) + s(b) − s(a + b mod (q − 1))) / (p − 1)`, a nonnegative integer
(the carries of the base-`p` addition). Here `ω = ω_𝔓` is the Teichmüller character of 6.1,
`v_𝔓(J)` is `multiplicity 𝔓 (Ideal.span {J})` (the pinned convention), `s(n)` is the base-`p`
digit sum `(Nat.digits p n).sum`, and `a + b > q − 1` is allowed: the digit sum on the right is
taken of the remainder of `a + b` modulo `q − 1`. The statement needs `ω_𝔓`, so it is specified
here only. *Rests on:* 6.2, 2.2.

**Checks.**

- (`q = 7`) `J(ω^{−1}, ω^{−1}) = g_1²/g_2` has `v_𝔓 = (1 + 1 − 2)/6 = 0`.
- (`q = 7`) `J(ω^{−4}, ω^{−4}) = g_4²/g_2` has `v_𝔓 = (4 + 4 − 2)/6 = 1`; indeed `J(χ, χ)` for the
  cubic character `χ = ω^{−4} = ω^2` is the primary prime of norm `7`, classical arithmetic 1.53.
- (`q = 7`, with `a + b > q − 1`) `J(ω^{−5}, ω^{−5})` has `v_𝔓 = (5 + 5 − 4)/6 = 1`.
- (excluded boundary) for `a + b = q − 1` the Jacobi sum is `J(ω^{−a}, ω^{a}) = −ω^{−a}(−1) = ±1`
  (2.1), of valuation `0`, while the right side would read `(s(a) + s(q − 1 − a))/(p − 1) = f`:
  the hypothesis `a + b ≢ 0 (mod q − 1)` is necessary.

### 6.4 Morita's `p`-adic Gamma function

Define `padicGamma p : ℤ_p → ℤ_p` as the unique continuous function with
`Γ_p(n) = (−1)^n ∏_{0 < j < n, p ∤ j} j` for every integer `n ≥ 0` (so `Γ_p(0) = 1`, `Γ_p(1) = −1`,
`Γ_p(2) = 1`, `Γ_p(3) = −2`); existence is the congruence `Γ_p(n + p^k) ≡ Γ_p(n) (mod p^k)` for
`p` odd (`mod 2^{k−1}` for `p = 2`) together with the density of `ℕ` in `ℤ_p`. `Suggested.lean`
defines `padicGamma p x` as the limit of these values along natural numbers `n → x`, which is this
function once the congruence is proved. Prove: `Γ_p` takes
values in `ℤ_p^×`; the **Lipschitz bound** `|Γ_p(x) − Γ_p(y)|_p ≤ |x − y|_p` for `p` odd and
`≤ 2|x − y|_2` for `p = 2`; the **functional equation** `Γ_p(x + 1) = −x Γ_p(x)` for `x ∈ ℤ_p^×`
and `Γ_p(x + 1) = −Γ_p(x)` for `x ∈ pℤ_p`; the **reflection formula**
`Γ_p(x) Γ_p(1 − x) = (−1)^{x₀}` for `p` odd, where `x₀ ∈ {1, …, p}` is the residue of `x` modulo
`p`, so `Γ_p(1/2)² = (−1)^{(p+1)/2}`. *Rests on:* Mathlib's `PadicInt`. (Robert, *A Course in
`p`-adic Analysis*, Ch. 7 §1; Cohen, *Number Theory II*, Ch. 11.) **Checks**: `Γ_5(1/2)² = −1`,
`Γ_7(1/2)² = 1`, `Γ_3(1/2)² = 1`; for each `p ∈ {3, 5, 7}` and `k ≤ 4` some `x < p³` has
`v_p(Γ_p(x + p^k) − Γ_p(x)) = k` exactly; `v_2(Γ_2(x + 4) − Γ_2(x)) = 1` for some `x`.

### 6.5 The Gross–Koblitz formula

Let `L_𝔓̃` be the completion of `L = ℚ(ζ_{q−1}, ζ_p)` at `𝔓̃`, totally ramified of degree `p − 1`
over the unramified extension `ℚ_p(ζ_{q−1})`, with `ℤ_p ⊆ 𝓞_{L_𝔓̃}`. Pin `π ∈ L_𝔓̃` as the root of
`π^{p−1} = −p` with `ζ_p ≡ 1 + π (mod 𝔓̃²)` (exactly one of the `p − 1` roots satisfies this for the
given `ζ_p`, and `v_𝔓̃(π) = 1`), let `ψ(x) = ζ_p^{Tr_{𝔽_q/𝔽_p}(x)}` and `ω = teichmuller 𝔓` (6.1).
Then for `0 ≤ a < q − 1`, in `L_𝔓̃`,
`g(ω^{−a}, ψ) = −π^{s(a)} ∏_{i=0}^{f−1} Γ_p(⟨p^i a/(q − 1)⟩)`,
with `s(a) = (p − 1) ∑_{i<f} ⟨p^i a/(q − 1)⟩` the digit sum of 6.2. The `Γ_p`-values are units, so the
exponent of `π` is the valuation `s(a)` of 6.2, and the formula refines the consumed congruence to an
equality. **Corollary** (6.3): for `a, b ≠ 0` with `a + b ≢ 0 (mod q − 1)` and `c = a + b mod (q − 1)`,
`J(ω^{−a}, ω^{−b}) = −π^{s(a) + s(b) − s(c)} ∏_{i<f} Γ_p(⟨p^i a/(q−1)⟩) Γ_p(⟨p^i b/(q−1)⟩) / Γ_p(⟨p^i c/(q−1)⟩)`,
the form in which `HypergeometricMotives` evaluates its finite hypergeometric sums `p`-adically.
Proof of record: Gross–Koblitz's original, through the Dwork exponential `exp(π(X − X^p))` and the
`p`-adic interpolation of the Gauss sums `g(ω^{−a})` in `a`; Cohen, *Number Theory II*, Ch. 11,
writes it out with Morita's normalization. *Rests on:* 6.1, 6.2, 6.3, 6.4, Mathlib's `Padic` and
`PadicInt`. **Checks** (`p`-adically to `30` digits): `q = 7`: `g(ω^{−a}) = −π^a Γ_7(a/6)` for
`a = 1, …, 5`, and not `−π^a Γ_7(1 − a/6)` for `a ≠ 3`; `q = 9`:
`g(ω^{−a}) = −π^{s(a)} Γ_3(a/8) Γ_3(⟨3a/8⟩)` for `a = 1, …, 7`, with `s(a) = 1, 2, 1, 2, 3, 2, 3`.

## Layer 7: sums modulo an integer

`c, N ≥ 1`, `ZMod c` with `ψ_c := ZMod.stdAddChar : AddChar (ZMod c) ℂ`, `ψ_c(j) = e(j/c)`, and
Dirichlet characters `χ : DirichletCharacter ℂ N`. These are the sums the LMFDB displays on the
page of `χ`; for prime `c` they are the sums of Layers 1, 2 and 5 over `F = ZMod c`.

### 7.1 Gauss sums of Dirichlet characters

`τ_a(χ) := gaussSum χ (ψ_N.mulShift a)`, `τ(χ) := τ_1(χ)`, the LMFDB's `character.dirichlet.gauss_sum`.
Record and prove: for `χ` primitive, `τ_a(χ) = χ(a)⁻¹ τ(χ)` for every `a` (Mathlib
`gaussSum_mulShift_of_isPrimitive`, including `a` a non-unit, where both sides are `0`),
`|τ(χ)| = √N` and `τ(χ) τ(χ⁻¹) = χ(−1) N` (Tau Ceti's `gaussSum_mul_gaussSum_inv_eq_card_of_isPrimitive`
and Tau Ceti main's `..._eq_neg_one_mul_card_of_isPrimitive`); for `χ` of conductor `f` with
primitive character `χ^∗` (`DirichletCharacter.primitiveCharacter`), the **imprimitive formula**
`τ(χ) = μ(N/f) χ^∗(N/f) τ(χ^∗)`, in particular `τ(χ) = 0` unless `N/f` is squarefree and prime to
`f`, and `τ(1_N) = μ(N)`; the **Chinese-remainder formula** `τ(χ) = χ₁(c₂) χ₂(c₁) τ(χ₁) τ(χ₂)` for
`N = c₁ c₂` coprime and `χ = χ₁ χ₂` as in 0.7. *Rests on:* 0.7, 1.1, Mathlib, Tau Ceti. **Checks**:
all `χ` modulo `12, 15, 18, 20` satisfy the imprimitive formula; all pairs modulo `(3, 5)`, `(4, 5)`,
`(3, 7)`, `(8, 3)` satisfy the Chinese-remainder formula.

### 7.2 Jacobi sums modulo `N`

`J(χ, ψ) := jacobiSum χ ψ = ∑_{r ∈ ZMod N} χ(r) ψ(1 − r)` (the LMFDB's
`character.dirichlet.jacobi_sum`; Mathlib's definition applies to every finite commutative ring).
Prove: the Chinese-remainder multiplicativity `J(χ, ψ) = J(χ₁, ψ₁) J(χ₂, ψ₂)` for `N = c₁ c₂`
coprime; and `J(χ, ψ) = τ(χ) τ(ψ) / τ(χψ)` **whenever `χψ` is primitive modulo `N`** (then
`τ(χψ) ≠ 0`; the proof compares `τ(χ)τ(ψ) = ∑_s ψ_N(s) ∑_{x+y=s} χ(x)ψ(y)` with the vanishing of the
inner sum at non-units `s`, which uses primitivity of `χψ`). The hypothesis is sharp: for `N = 9`,
`χ` primitive of order `6` and `ψ = χ⁻¹`, `J(χ, χ⁻¹) = 0` while `τ(χ)τ(χ⁻¹) = −9` and
`τ(χψ) = τ(1_9) = μ(9) = 0`. For prime `N` and `χψ ≠ 1`, primitivity is automatic and the formula
is 2.2. Record also `J(χ, 1_N) = ∑_{r : 1 − r ∈ (ZMod N)ˣ} χ(r)`, which is `−1` for prime `N` and
`χ ≠ 1` (the LMFDB's default display `J(χ, χ_N(1, ·))`). *Rests on:* 0.7, 7.1, 2.2.

### 7.3 Kloosterman sums modulo `c` and the comparison with `AutomorphicSpectralTheory`

`S_χ(m, n; c) := kloostermanSum (changeLevel h χ) ψ_c m n` for `χ` of modulus `N`, `h : N ∣ c`,
and `S(m, n; c) := S_{1}(m, n; c) = ∑_{d ∈ (ℤ/c)^×} e((m d + n d̄)/c)`. Prove
`S(m, n; c) = kloosterman_sum m n c` of [`AutomorphicSpectralTheory`](../AutomorphicSpectralTheory/README.md)
§1.16 (the two are the same finite sum; the comparison is stated against that declaration and
inherits `kloosterman_sum_symm`, `kloosterman_real` and `S(m, 0; c) = ∑_{d ∣ (m, c)} μ(c/d) d`,
which are not reproved). The LMFDB's `K(a, b, χ)` is `S_χ(a, b; q)` with `N = c = q`, and
`K(a, 0, χ) = τ_a(χ)` (5.1), as its knowl states. Prove `S_χ(m, n; c)` depends on `m, n` modulo `c`
only, `S_χ(m, n; c) = S_{χ⁻¹}(n, m; c)`, `S_χ(u m, u⁻¹ n; c) = χ(u)⁻¹ S_χ(m, n; c)` for `u` a unit,
and `conj S_χ(m, n; c) = S_{χ⁻¹}(−m, −n; c)`. *Rests on:* 5.1, `AutomorphicSpectralTheory` §1.16.

### 7.4 Twisted multiplicativity

For coprime `c₁, c₂`, `c = c₁ c₂`, `N ∣ c`, and `χ` modulo `N` with Chinese-remainder factors
`χ₁, χ₂` (0.7, applied to `changeLevel χ`):
`S_χ(m, n; c) = S_{χ₁}(m c̄₂, n c̄₂; c₁) · S_{χ₂}(m c̄₁, n c̄₁; c₂)`, where `c̄₂ c₂ ≡ 1 (mod c₁)` and
`c̄₁ c₁ ≡ 1 (mod c₂)`. Proof: `ZMod.chineseRemainder` on the summation variable and
`ψ_c(x) = ψ_{c₁}(c̄₂ x₁) ψ_{c₂}(c̄₁ x₂)` for `x ↔ (x₁, x₂)`, which is 0.7's description of `ψ_c`. By induction, `S_χ(m, n; c)` is a product
over the prime powers `p^k ∥ c`. *Rests on:* 0.7, 7.3. **Check**:
`S(1, 1; 15) = S(2, 2; 3) S(2, 2; 5) = (−1)(2 + 2cos(2π/5)) = −2.6180`.

### 7.5 Prime-power evaluation (Salié) and the prime-power bound

For `p` odd, `k ≥ 2`, `c = p^k` and `p ∤ m n`: if `m n ≡ ℓ² (mod p^k)` then
`S(m, n; p^k) = 2 (ℓ/p)^k p^{k/2} Re(ε_{p^k} e(2ℓ/p^k))`, and if `m n` is a non-square modulo `p`
then `S(m, n; p^k) = 0`. Proof of record (stationary phase): write `d = u(1 + p^h v)` with
`h = ⌈k/2⌉`; the inner sum over `v mod p^{k−h}` vanishes unless `u` is a critical point,
`m u² ≡ n (mod p^{k−h})`, and the critical points contribute the two terms of the formula, with the quadratic Gauss
sum 1.4 entering for odd `k` (Iwaniec–Kowalski Ch. 12 §12.3, their evaluation (12.39)). For a Dirichlet character `χ` modulo `p^j`, `j ≤ k`, prove the **twisted prime-power bounds**: for
`k = 2` and every prime `p`, `|S_χ(m, n; p²)| ≤ 2 (m, n, p²)^{1/2} p`; and for `p` odd, `k ≥ 2`,
`p ∣ m`, `p ∤ n`, `|S_χ(m, n; p^k)| ≤ p^{⌈k/2⌉}`. Proof of record, the same stationary phase:
`χ(1 + p^h v)` is additive in `v` because `2h ≥ k`, say `e(λ_χ v/p^{k−h})`, so the inner sum over
`v` vanishes unless `u` is a root of `m u² + λ_χ u − n ≡ 0 (mod p^{k−h})`. For `k = 2`, `h = 1` and
`p ∤ mn` there are at most two roots, each contributing `p`; for `p ∣ m`, `p ∤ n` the congruence has
at most one root (Hensel, the derivative being the unit `λ_χ`, or none when `p ∣ λ_χ`), and its
`p^{2h−k}` lifts contribute at most `p^{2h−k}` each; for `p ∣ gcd(m, n)` the sum is `0` when `j = k`
(a primitive `χ` summed over a coset of `1 + p^{k−1}ℤ`) and `p · S_χ(m/p, n/p; p^{k−1})` when
`j < k`, which 5.5 and 5.6 bound at `k = 2`. ⚠ For `k ≥ 3` and `p ∤ mn` the untwisted constant does
not persist: the two roots coincide modulo `p` when `λ_χ² + 4mn ≡ 0 (mod p)`, and then
`|S_χ(m, n; p^k)|` reaches `p^{(k+1)/2}`: `|S_χ(7, 7; 125)| = 25` for a primitive `χ` of order `50`
modulo `125`, and `|S_χ(1, 15; 17³)| = 289 = 17²` for a primitive `χ` of order `4624`, which
exceeds `τ(17³) · 17^{3/2} = 280.37`. In general, for `p` odd, `k ≥ 2`, `p ∤ mn` and `χ` whose
`p`-part has conductor `p^j`: `|S_χ(m, n; p^k)| ≤ 2 p^{k/2}` when `j ≤ ⌊k/2⌋` (`χ` is then constant
on the `p^{2h−k}` lifts of each critical point and the computation is the untwisted one), and
`|S_χ(m, n; p^k)| ≤ 2 p^{j/2} p^{k/2}` always (the roots of the critical congruence modulo
`p^{⌊k/2⌋}` number at most `2 p^{⌊⌊k/2⌋/2⌋}`, by the valuation of the discriminant `λ_χ² + 4mn`, and
`⌊k/2⌋ ≤ j − 1` when `j > ⌊k/2⌋`). With the `p ∣ mn` cases this is the **conductor-weighted
prime-power bound** `|S_χ(m, n; p^k)| ≤ τ(p^k) (m, n, p^k)^{1/2} 𝔠_χ^{1/2} p^{k/2}` for every prime
`p`, every `k ≥ 1` and all `m, n`, `𝔠_χ` the conductor of `χ` (Knightly–Li, *Kuznetsov's trace
formula and the Hecke eigenvalues of Maass forms*, §9.1, Theorem 9.3, inequality (9.7); their (9.8)
sharpens the conductor factor to `𝔠_χ^{1/4} p^{1/4}`, which is not a target here; for `p = 2` the trivial bound
`φ(2^k)` covers `k ≤ 6` and the stationary phase, with at most eight critical classes, the rest).
*Rests on:* 1.4, 5.5, 5.6, Mathlib's `ZMod` and `legendreSym`. **Checks**: `S(1, 1; 25) = 10 cos(4π/25) = 8.7631`, `S(1, 2; 25) = 0`,
`S(1, 1; 27) = −2·3^{3/2} sin(4π/27) = −4.6641`, `S(1, 1; 49) = 14 cos(4π/49) = 13.5421`,
`S(2, 3; 125) = −0.8428` with `ℓ = 16`; `|S_χ(1, 1; 25)| ∈ {0, 5}` for the eight primitive `χ` of
order `20` modulo `25` (four each), all `≤ 2 · 5`.

### 7.6 Weil's bound for a general modulus

For every `c ≥ 1` and all integers `m, n`: `|S(m, n; c)| ≤ τ(c) · (m, n, c)^{1/2} · c^{1/2}`, with
`τ(c) = σ₀(c)` the number of divisors and `(m, n, c) = gcd(gcd(m, n), c)`. Proof: 7.4 reduces to
prime powers, where `τ(p^k) = k + 1 ≥ 2`; at `k = 1` the factor is 5.5 and 5.6 (`S(m, n; p)` is a
Kloosterman, Gauss or Ramanujan sum); at `k ≥ 2` it is 7.5 (for `p` odd, Salié's evaluation gives
`2 p^{k/2}` for `p ∤ mn`; for `p = 2` the stationary-phase count of 7.5 with `χ = 1` gives the bound
`(k + 1) 2^{k/2}` for `mn` odd; for `p ∣ m`, `p ∤ n` the sum is `0`; for `p ∣ gcd(m, n)` it is
`p · S(m/p, n/p; p^{k−1})`, and induction on `k` applies); the gcd factor multiplies across coprime
moduli. (Weil 1948 at `k = 1`; Iwaniec–Kowalski Ch. 11, Corollary 11.12 to Theorem 11.11, equation
(11.58).) **Twisted form.** For a Dirichlet character `χ` of modulus `N ∣ c` and conductor `𝔠_χ`:
`|S_χ(m, n; c)| ≤ τ(c) (m, n, c)^{1/2} 𝔠_χ^{1/2} c^{1/2}` (7.4 with the conductor-weighted
prime-power factors of 7.5; Knightly–Li Theorem 9.3 at prime powers and Theorem 9.2 with `n = 1`
for every `c`), and for `c` **cube-free** the conductor factor can be dropped (7.4 with the factors
5.5–5.6 at `k = 1` and 7.5 at `k = 2`). The factor is needed:
`|S_χ(1, 15; 17³)| = 289 > τ(17³) · 17^{3/2}` (7.5; Knightly–Li's Example 9.9 gives `|S_χ(a, b; p³)| = p²` for a primitive `χ`
modulo `p³` and suitable units `a, b`, which beats `τ(p³) p^{3/2} = 4 p^{3/2}` exactly from `p = 17`
on). *Rests on:* 7.4, 7.5, 5.5,
5.6. **Checks**:
`|S(1, 1; 15)| = 2.618 ≤ τ(15) √15 = 15.49`; `|S_χ(1, 1; 15)| = 1.9021` for `χ` of order `4` modulo `5`
(`15` is cube-free); `S(7, 1; 7) = −1`, `S(0, 0; 12) = φ(12) = 4 ≤ τ(12) · √12 · √12 = 72`.

### 7.7 The character page

Assemble, for a Dirichlet character `χ` of modulus `q` given as Tau Ceti's `conreyCharacter q n`,
the three displayed quantities: `τ_2(χ)` (7.1), `J(χ, χ_q(1, ·))` (7.2) and
`K(1, 2, χ) = S_χ(1, 2; q)` (7.3), together with the theorems that evaluate them: `|τ_2(χ)| = √q` for `χ` primitive,
`J(χ, 1) = −1` for prime `q` and `χ ≠ 1`, `|K(1, 2, χ)| ≤ τ(q) 𝔠_χ^{1/2} √q`, and `|K(1, 2, χ)| ≤ τ(q) √q`
for cube-free `q` (7.6). Nothing here depends on
the Conrey labelling beyond naming the character. *Rests on:* 7.1–7.3, 7.6, Tau Ceti main's
`conreyCharacter`.

## Explicit scope exclusions

- **Reciprocity laws** (quadratic beyond Mathlib's, cubic, quartic, Eisenstein, the general power
  reciprocity law) and the theory of **primary elements**: the classical arithmetic roadmap, Layer 1.
- **The Kronecker symbol** as a Dirichlet character and genus theory: the multiquadratic and
  theta-series roadmaps.
- **Lattice Gauss sums** `G_L(a, c)`, their reciprocity and Milgram's formula: the theta-series
  roadmap, Layer 6. The quadratic exponential sum `∑_{y mod c} e(a y²/c)` for composite `c`
  (Gauss's evaluation, the Landsberg–Schaar identity) is Tau Ceti's and 4.19 of the classical
  arithmetic roadmap; this roadmap uses only its prime case, in 1.4.
- **Zeta functions**, the Riemann hypothesis for curves and the Hasse–Weil bound:
  `FunctionFieldArithmetic` Layer 5 and
  [`SchemeAndStackFoundations`](../SchemeAndStackFoundations/README.md) §5.11. Weil polynomials
  and the Serre bound: `CurvesOverFiniteFields`. The identification of this roadmap's
  `L`-polynomials with numerators of zeta functions of Kummer and Artin–Schreier covers is not a
  target.
- **Étale cohomology, Deligne's theorem, the Kloosterman sheaf, equidistribution of Kloosterman
  angles** (Katz's vertical Sato–Tate law): `DeligneWeightsAndPurity` and the étale-cohomology
  family, with the Kloosterman sheaf and the all-rank Deligne bound in [the congruence spectral gap roadmap](../CongruenceSpectralGap/README.md), §4.2b. The angle `θ_F(a, b)` is defined here; nothing about its distribution is.
- **The general mixed Weil bound** `|∑_x χ(f(x)) ψ(g(x))| ≤ (deg f + deg g − 1)√q` for arbitrary
  `f, g`, and Weil bounds for rational functions beyond `a x^d + b x^{−d}`: not a target of this
  roadmap; the twisted Kloosterman case is 5.5.
- **`p`-adic `L`-functions** and the Dwork exponential as objects of their own: 6.4–6.5 contain
  Morita's `Γ_p` on `ℤ_p` and the Gross–Koblitz formula, and nothing further `p`-adic.
- **Finite hypergeometric sums** (Katz, Greene, Beukers–Cohen–Mellit): `HypergeometricMotives`.
- **Spectral applications** of Kloosterman sums (Kuznetsov, Selberg's `3/16`, Linnik's problem):
  `AutomorphicSpectralTheory` and [the congruence spectral gap roadmap](../CongruenceSpectralGap/README.md).
- **Incomplete sums** (Pólya–Vinogradov, Burgess, Weyl differencing) and **exponential sums over
  `ℤ/cℤ` of general polynomials** (Hua's bound): the analytic number theory roadmaps; only the
  Kloosterman case 7.5–7.6 is here.
- **Conrey labels** and character orderings: the Conrey character is Tau Ceti's; orderings are not
  targets.

## Worked examples (acceptance criteria)

Every number below was computed exactly or to ten decimals; a decimal is a target only up to the
displayed precision, and every exact equality is a target. Conrey labels `q.n` name the character
`conreyCharacter q n`; for prime `q` this is the character with `χ(g) = e(a/(q−1))` where `g` is
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
- 1.4: `g(η) = ε_7 √7 = i√7`; `g(η)² = η(−1) · 7 = −7` (`gaussSum_sq`).
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
  `(e, f) = (6, 1)`, `v_𝔓̃(g(ω^{−a})) = a` for `a = 0, …, 5`, the other prime has valuation `6 − a`,
  `N_{L/ℚ}(g(ω^{−a})) = 7^6` for `a ≠ 0`, and `v_𝔓̃(g(ω^{−a}) + π^a/a!) = a + 1`.

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
  `S(2, 3; 125) = −0.8428` (`ℓ = 16`, `16² = 256 ≡ 6 = 2·3`); `S(1, 1; 125) = 22.2478`.
- 7.3: `S(m, 0; 12) = 0, 2, 0, −2, −4, 4` for `m = 1, 2, 3, 4, 6, 0`, the Ramanujan sums
  `∑_{d ∣ (m, 12)} μ(12/d) d`; `τ(1_{12}) = μ(12) = 0`.
- 7.6: `|S_χ(1, 1; 15)| = 1.9021 ≤ 4√15` for `χ` of order `4` modulo `5` viewed modulo `15`;
  `|S_χ(1, 1; 25)| ∈ {0, 5} ≤ 2 · 5` for the eight primitive `χ` of order `20` modulo `25`.
  **Boundary**: `|S_χ(1, 15; 17³)| = 289 > τ(17³) · 17^{3/2} = 280.37` for a primitive `χ` of
  order `4624`: the twisted bound needs `c` cube-free or the conductor factor `𝔠_χ^{1/2}`.

### Jacobi and Gauss sums modulo composite `N`

- 7.2: for every pair of characters modulo `9`, `12`, `15`, `8`, `16`, `25`, `27`, `24`, `45`,
  `J(χ, ψ) = τ(χ)τ(ψ)/τ(χψ)` holds whenever `χψ` is primitive; when `χψ` is imprimitive it fails for
  every pair modulo `9`, `15`, `8`, `16`, `25`, `27` (and for `N = 9`, `χ` primitive of order `6`:
  `J(χ, χ⁻¹) = 0`, `τ(χ)τ(χ⁻¹) = −9`, `τ(1_9) = 0`), but it happens to hold for `4` imprimitive
  pairs modulo `12`, `16` modulo `24` and `64` modulo `45`: primitivity of `χψ` is sufficient, not
  necessary.
- 7.1: `τ(χ) = μ(N/f) χ^∗(N/f) τ(χ^∗)` for every `χ` modulo `12, 15, 18, 20`; `τ(1_{12}) = 0`,
  `τ(1_7) = −1`.

### Boundary and off-hypothesis checks, collected

- `g(1) = −1`, `J(1, 1) = q − 2`, `J(1, χ) = −1`: Mathlib's `χ(0) = 0` convention; a source with
  `1(0) = 1` has `g(1) = 0` and `J(1, 1) = q` instead.
- `gaussSum χ 1 = 0` for `χ ≠ 1`: the trivial additive character is excluded from every estimate.
- `K(1; a, 0) = −1`, `K(1; 0, 0) = q − 1`: the Weil bound `2√q` fails only at `(0, 0)`.
- `K(η; a, b) = 0` when `ab` is a non-square (5.3): the bound `2√q` is not attained there.
- `J(χ, χ⁻¹) = −χ(−1)`, not of absolute value `√q`: the hypothesis `χψ ≠ 1` of 2.2.
- `J(χ, χ⁻¹) = 0 ≠ τ(χ)τ(χ⁻¹)/τ(1)` modulo `9`: the primitivity hypothesis of 7.2.
- `f = X²` in 4.7 and `f = X^p − X` in 4.8: the non-power and `p ∤ n` hypotheses.
- `S(1, 2; 25) = 0`: the non-square branch of 7.5; `S(0, 0; 12) = φ(12)`, not `12`: the sum is over
  units.
- Stickelberger: `v(g(ω^{+a}))` at the same prime is `6 − a` for `q = 7`, not `a`: the theorem is
  about `ω^{−a}`.
- `|S_χ(1, 15; 17³)| = 289 > 280.37 = τ(17³) 17^{3/2}`: the twisted Weil bound of 7.6 carries the
  factor `𝔠_χ^{1/2}` unless `c` is cube-free; the untwisted bound holds for every `c`.

## Ordering

- **Layer 0** → Mathlib and Tau Ceti main's Galois-orbit API (0.5, cited). 0.7 is independent of
  0.1–0.6.
- **Layer 1** → Layer 0; 1.4 also → the classical arithmetic roadmap 4.19 and Tau Ceti main's
  Gauss evaluation. 1.5 is a restatement of Mathlib and needs no Layer 2.
- **Layer 2** → Layer 1 (2.2–2.5), Layer 0 (0.3 for the character-count identities); 2.5's
  elliptic reading also → `EllipticLegendreCharacterInterfaces` 5.1.
- **Layer 3** → Layers 0 and 1 for 3.3–3.5; 3.1–3.2 are pure polynomial algebra over `F` and can
  proceed beside Layers 1–2.
- **Layer 4** → 4.1–4.4 need Mathlib only (and can proceed beside Layers 1–3); 4.5–4.6 need 3.1–3.2
  and 0.3, 0.6; 4.7–4.9 need all of 4.1–4.6 and 3.2.
- **Layer 5** → 5.1 needs 1.1 and the congruence spectral gap roadmap §4.2a; 5.2 needs 0.3; 5.3 needs 1.4 and 2.1; 5.4 needs 3.1–3.2 and 0.6;
  5.5 needs 5.4, 4.3 (ii), 4.4; 5.6 needs 5.1.
- **Layer 6** → 0.3, 1.2, 1.3, 2.2, Mathlib's cyclotomic fields and the classical arithmetic
  roadmap's 7.12 and 1.55; 6.4 needs Mathlib's `PadicInt` only, 6.5 needs 6.1–6.4; independent of
  Layers 3–5.
- **Layer 7** → 0.7, 1.1, 2.2, 5.1, 5.5–5.6, 1.4, and `AutomorphicSpectralTheory` §1.16 for the
  comparison in 7.3.

Three independent streams after Layer 0: (Layers 1–2, then 6), (Layers 3–4, then 5), and (0.7 with
7.1–7.2); Layer 7's 7.3–7.7 close the roadmap and need both the first and the second stream.

| Block | Status |
|---|---|
| 0.1–0.2 canonical additive character | **new**; Mathlib has an abstract primitive character |
| 0.3–0.7 character groups, lifts, products | **new** beyond `equiv_rootsOfUnity` and `ZMod` orthogonality |
| Layer 1 Gauss sums | the identities are Mathlib's; the norm, Galois action and prime-field sign are **new** |
| Layer 2 Jacobi, multiple Jacobi, Jacobsthal | 2.1–2.2 are Mathlib's; 2.3 (two-squares shape), 2.4, 2.5 are **new** |
| Layer 3 `L`-series and Hasse–Davenport | **new** |
| Layer 4 Stepanov and Weil | **new**; the hardest block |
| Layer 5 Kloosterman and Salié | **new** |
| Layer 6 Teichmüller and Stickelberger | the congruence and the valuation are the classical arithmetic roadmap's 7.12 and 1.55; the carrier 6.1, the Jacobi digit-sum formula 6.3, `Γ_p` 6.4 and Gross–Koblitz 6.5 are **new** |
| Layer 7 integer modulus | 7.1's primitive case is Mathlib's and Tau Ceti's; the rest is **new** |

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
- Ch. I: Stepanov's method for `y^d = f(x)` and `y^q − y = f(x)` (4.1–4.3). Ch. II: character
  sums and exponential sums, the `L`-function argument and the sharp constants (4.4–4.8).

**H. Iwaniec and E. Kowalski, *Analytic Number Theory*, AMS Colloquium 53.**
- Ch. 11: sums over finite fields; §11.7, the Stepanov proof of Weil's bound for Kloosterman sums,
  Theorem 11.11 (`|S(a, b; p)| ≤ 2√p`) and its corollary (11.58) for general moduli (4.3 (ii),
  5.5, 7.6).
- Ch. 12 §12.3: Kloosterman sums to prime-power moduli, twisted multiplicativity and the
  evaluation (12.39) (7.4–7.5); §12.4, Lemma 12.4: Salié sums (5.3).

**E. Bombieri, *Counting points on curves over finite fields (d'après S. A. Stepanov)*, Sém.
Bourbaki 430 (1972/73).** The Stepanov method in the form used in 4.2–4.3; on disk in
`references/`.

**A. Weil, *On some exponential sums*, Proc. Nat. Acad. Sci. USA 34 (1948), 204–207.** The
bounds 4.7, 4.8, 5.5 as originally stated.

**L. C. Washington, *Introduction to Cyclotomic Fields*, 2nd ed., GTM 83.** Ch. 6 §6.2: Gauss
sums, the Stickelberger congruence and the ideal factorization (6.2).

**S. Lang, *Cyclotomic Fields I and II*, GTM 121.** Ch. 1 §§1–2: the Teichmüller character and
Stickelberger's theorem (6.1–6.2).

**F. Beukers, H. Cohen and A. Mellit, *Finite hypergeometric functions*, arXiv:1505.02900.**
Definition 1.1 (Gauss sums `g(ω^m)` for a fixed generator `ω`) and Theorem 1.3 (the reduction
using the Hasse–Davenport product formula): the shape of the API that `HypergeometricMotives`
consumes from Layers 1 and 3. On disk in `references/`.

**B. H. Gross and N. Koblitz, *Gauss sums and the p-adic Γ-function*, Ann. of Math. 109 (1979),
569–581.** The formula 6.5 with Morita's `Γ_p` and the normalization `π^{p−1} = −p`.

**A. M. Robert, *A Course in p-adic Analysis*, GTM 198.** Ch. 7 §1: Morita's `Γ_p`, its continuity,
functional equation and reflection formula (6.4).

**H. Cohen, *Number Theory, Volume II: Analytic and Modern Tools*, GTM 240.** Ch. 11: Morita's
`Γ_p` and the Gross–Koblitz formula with its proof (6.4–6.5).

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
