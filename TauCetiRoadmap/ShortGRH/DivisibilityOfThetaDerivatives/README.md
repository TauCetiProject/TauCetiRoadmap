# Roadmap: divisibility of derivatives of theta functions of CM lattices

**Summary.** This roadmap is local arithmetic, prime by prime, of theta functions with complex multiplication. Its
objects are the Taylor coefficients at the origin (the *jets*) of theta functions of vectors in the Weil representation
of a definite hermitian space over the CM field `E = K(ζ)`, `K = ℚ(√−d)`, when these theta functions are products of
theta functions of one elliptic curve with complex multiplication by `𝒪_K`, taken along the linear forms of a frame.
It bounds the `p`-adic valuations of such jets from below at every prime, by a closed formula at the primes that do
not split in `K`, and shows that this lower bound is attained up to one number whose archimedean size is controlled.

The argument of the family runs as follows: a one-sided bound for a sum over primes gives a half-plane free of zeros
of Dirichlet L-functions, and the one-sided bound comes from comparing an upper and a lower bound for the covolume of a
lattice of theta lifts (OneSidedPrimeSumBoundsAndAdmissibleData). The upper bound
(CompositeThetaLiftsAndShortForms) asks that a lift be divisible by a large power of each prime; this roadmap supplies
that divisibility for the jets that the lift is built from, as a lower bound for their valuations along products of
minors whose main term, summed over the primes, is the prime sum. The lower bound for one lift
(NormsOfThetaLiftsAndExchangeIdentities §§6.4, 6.5, the heights of Hecke values) uses the converse: a matching upper bound for the
valuation of one coefficient of an indicator datum, which this roadmap supplies. It also supplies the arithmetic of the field
`E` (its different, the decomposition of primes, its Weil data, the chosen places and some characters of `U(1)`) that
the other roadmaps of the family use.

The headline theorems are these.

(1) *The count* (3.3). Let `p` be a prime that does not split in `K`, `ρ_p` and `γ_p` the numbers of 2.1 (for `p`
inert, `1/(p² − 1)` and `p/(p² − 1)`), and `F` a power series over `ℂ_p` in the entries of matrices `z_τ`, one for each
infinite place `τ` of `E`, such that `F(ϖz)` is an integral series times the exponential of `ϖ^{p+1}/p` times an integral
combination of the powers `Γ_e^{p^j}` of the couplings `Γ_e = Σ z_τ^{p^e}·z_{−p^eτ}` (`e` odd; all `e` if `p = d`), for
some `ϖ` of valuation `ρ_p`. Then the jet of `F` along a product of minors of shape `κ` has valuation at least an
explicit number `D_p(κ)`, which is `γ_p` per box less a deduction counted place by place against the partners
`−p^eτ`, up to a loss `f·N³·(1 + log_p B)`.

(2) *Divisibility of standard data* (4.10, 4.11). The jets of the theta functions of integral combinations of
translates of the integral vacuum are integral at every prime, after the scale `𝔱_E` of the Taylor series; at a prime
that does not split in `K` these theta functions have the normal form of (1), so their jets along products of minors,
and along the entries of Schur matrices, have the divisibility `D_p(κ)`.

(3) *Sharpness* (5.6). For admissible data and degrees `l` with `κ(τ) ≤ l(τ) ≤ κ(τ) + x^{42}` there is one number
`t ≠ 0`, with all conjugates at most `exp(f·m·b/k)` in absolute value, such that at every prime `p` some Taylor
coefficient of degree `l` of the theta function of an indicator datum on `12 × 1` matrices, times `∏_τ l(τ)!` and a
fixed scalar, has valuation at most `S_p + v_p(t)`, where `S_p` is the divisibility forced at the weights.

There are five layers. Layer 1 is the field `E` and its characters. Layer 2 is the formal group of the CM curve at a
prime that does not split in `K`: the Frobenius congruence for `θ`, the exponential factor of `θ` at the scale `ϖ`,
couplings and the normal form, resolutions of the identity, and the normal form of products of copies of `θ` along a
resolution. Layer 3 counts the divisibility of jets of series in normal form along products of minors. Layer 4 builds
the integral vacuum and the standard data from products of theta functions along tight frames and proves the
integrality and the divisibility of their jets. Layer 5 shows that the bound is attained.

## Conventions and notation

- *Labels.* Under each section heading, `*Origin:*` says where its statement comes from and `*Method of the formal
  proof:*` how [ShortProof] proves it. [ShortProof] is the shorter formal proof of the family `ShortGRH`; the line
  "[ShortProof], `path` (`declarations`)" at the end of a section names the file (under `src/`) and the declarations
  where it proves the statement. The names of [ShortProof] occur only on that line.
- *Primes and valuations.* `p` is a prime and `ι_p : ℂ → ℂ_p` a ring embedding; the statements hold for every choice
  of `ι_p`. `v` is the valuation of `ℂ_p` with `v(p) = 1`, written also `v_p`, `‖x‖ = p^{−v(x)}`, and `𝒪` is the
  valuation ring of `ℂ_p`. A series over `ℂ_p` is *integral* if its coefficients lie in `𝒪`; a complex number `c` is
  *`p`-integral* if `ι_p(c) ∈ 𝒪`; complex numbers and complex power series are read in `ℂ_p` through `ι_p`
  (coefficient by coefficient). An element `y` of a number field is *integral above `p`* if `v_w(y) ≥ 0` at every
  finite place `w` above `p`.
- *Jets.* For a polynomial `Q` and a power series `F` in the same variables, `jet_Q(F) := (Q(∂)F)(0) = Σ_k k!·Q_k·F_k`,
  with `k! := ∏_i k_i!` for a multi-index `k`.
- *The parameters and the data* are those of OneSidedPrimeSumBoundsAndAdmissibleData §2.1 (the parameters), §2.2 (the
  field) and §3.2 (admissible data): a multiple `q₀` of `18480` and a prime `d ≡ q₀/2 − 1 (mod q₀)` (so
  `d ≡ 7 (mod 8)`), `K = ℚ(√−d)`; for a level `s`, the CM field `E = K(ζ)` with `ζ` a primitive root of unity of order
  `q₁ = q₁(s)`, and `q₂ = (q₀d)^{s+6}`; admissible data `D` with their scales, ranks, weights, level primes and
  exponent `s`. Statements about data use the letters of that roadmap.
- *Places.* The infinite places of `E` form a group `Φ`, identified with `Gal(E/K)` and with `(ℤ/q₁)^×`; `τ` also
  denotes the embedding `E → ℂ` over `K` chosen at the place `τ` (a CM type). For an integer `ν`, `u(ν) ∈ Φ` is the class
  of `ν` if `ν` is prime to `q₁`, and `1` otherwise; `−p^eτ := u(−p^e)·τ` is the *partner* of `τ` for the exponent
  `e`. Complex conjugation is `y ↦ ȳ` on `E` and `w ↦ w̄` on its finite places; for `v ∈ Φ` and a finite place `w`,
  `v·w` is the pullback of `w` along the automorphism of `E` over `K` attached to `v`.

### Table of symbols

| Symbol | Meaning | Defined |
|---|---|---|
| `K, χ_K, d` | `ℚ(√−d)`, its quadratic character `(·/d)`, the prime `d ≡ 7 (mod 8)` | OneSidedPrimeSumBoundsAndAdmissibleData §2.1 |
| `E = K(ζ), q₁, q₂, s, f` | the CM field of level `s`, the order of `ζ`, `(q₀d)^{s+6}`, the level, the number of infinite places | OneSidedPrimeSumBoundsAndAdmissibleData §§2.1–2.2 |
| `Φ, u(ν), −p^eτ, v·w` | infinite places, the place of an integer, the partner, the action on finite places | Conventions |
| `β_K, P'(ζ), δ_E, rd_E` | `(1 + √−d)/2`, the derivative of the cyclotomic polynomial at `ζ`, an imaginary generator of the different, the root discriminant | 1.1 |
| `Fr_p` | the Frobenius element `(u(χ_K(p)p), χ_K(p)) ∈ Φ × {±1}` | 1.2 |
| `ȷ, α, 𝔞₀, Ô, υ, s₀` | the Weil data of `E`, the lattice `E ∩ αÔ`, the integral finite adeles, the splitting character, the number `s₀` | 1.4 |
| `π_M, π̄_M, M, p₀, p₁` | `M = p₀p₁` the level, `π̄_M ∈ 𝒪_K` of norm `M`, `π_M` its conjugate | OneSidedPrimeSumBoundsAndAdmissibleData §3.2; chosen places 1.5 |
| `ω, χ₀, χ_M, w₀` | the residue characters at the chosen places, two characters of `U(1)`, the weight `w₀ = κ + Δ/2` | 1.5, 1.6 |
| `π_p, v(π_p), q_p, ρ_p, γ_p` | `√−d` if `p = d` and `p` otherwise; `1/2` or `1`; `p²` if `p` is inert and `p` otherwise; `v(π_p)/(q_p − 1)`; `1/(p − 1) − ρ_p` | 2.1 |
| `I_p°, I_p` | the odd `e ≥ 0` if `p` is inert, all `e ≥ 0` if `p = d`, none if `p` splits; the positive elements | 2.1 |
| `C, Λ, t, a₁, θ, x, y, g, T` | a CM lattice, its point of order two, `θ = ` normalised translate of `σ`, `x = ℘(z+t) − ℘(t)`, `y`, `g = −log θ`, the formal parameter | 2.1 |
| `𝒪[[y]], 𝒪[[y(μz)]]` | integral series in `y`; integral series in the `y(μ_i z)` | 2.1, 2.5 |
| `c_ϖ, Γ_e, Ξ_λ` | `ϖ^{p+1}/p`, the couplings, the coupling series | 2.4 |
| `u†z`, resolution | `Σ conj(τ(u_c))·z_{τ,c}`; families with `z = Σ m_j(u_j†z)u_j` | 2.5 |
| `κ, P_y, a_τ, a′_τ, l_τ, B, D_p(κ)` | diagrams, products of minors, column and box counts, the predicted divisibility | 3.1 |
| `𝓔, Ω₀, A_K, 𝔣_E, 𝔱_E, Ω` | the CM curve `ℂ/Ω₀𝒪_K`, its period, `√(2π/√d)`, the period factor, the scale of Taylor series, `exp(γ − Re L′/L(1, χ_K))·2π/rd_E` | 4.2 |
| `𝒮(V), vac, θ_V, ϱ, 𝒮_f, Θ_f, f(y), J_c(f)` | the Weil model of `V`, the vacuum, the theta functional, Heisenberg translation, the finite part, the theta function of `f`, its values, its jet series at scale `c` | 4.1 |
| `θ°, c_vac` | the integral vacuum, the vacuum scale | 4.6 |
| `𝒟_p(V, δ)` | standard data of level `δ` at `p` | 4.8 |
| `val_n(ν)` | least valuation of a coefficient of degree `ν` on `n` copies | 5.1 |
| `κ(τ), b, x, x₁, a, k, m, r, t, l₀` | weights and the scales, ranks and exponents of the data | OneSidedPrimeSumBoundsAndAdmissibleData §3.2; `l₀`: §2.1 |
| `s_p(y, σ), S_p` | the local prime sum and its total `S_p = Σ_σ s_p(κ(σ), σ)` | CompositeThetaLiftsAndShortForms §2.1 (b) |
| `n♯, B_τ(l)` | `⌈6b/k⌉`, the product of the `n♯` integers after `(l − n♯)₊` | 5.4 |

## Layer 1: The field `E` and its characters

This layer is the arithmetic of `E = K(ζ)` that the jets and the lifts need: the ring of integers and the different
with an imaginary generator (1.1); the decomposition of the primes prime to `q₁d` by a Frobenius element in
`Φ × {±1}` (1.2) and the primes `≡ 1 (mod q₁d)`, which split completely (1.3); the Weil data of `E` and the number `s₀`
whose conjugates over `K` have absolute value `(rd_E/√d)^{1/2}` (1.4); the chosen places above the level and their
residue characters (1.5); two characters of `U(1)` of given weight and the finiteness of pairs (1.6); and the size of the
different at the infinite places (1.7).

### 1.1 The integers and the different of `E`

*Origin:* adapted from the published theory of the rings of integers and the differents of cyclotomic extensions of a
number field: here, for `E = K(ζ)` over `K = ℚ(√−d)`, the generator `P'(ζ)` of the relative different, the ring
`ℤ[β_K, ζ]`, and a purely imaginary generator of the absolute different with the product of its absolute values.

*Method of the formal proof:* the value of the derivative of the cyclotomic polynomial at a primitive root `z` divides
`q₁` and lies in the relative different, and the integer `q₁d` lies in the different of `E`; this gives
`𝔇_{E/K} = (P'(z))` and `𝒪_E = 𝒪_K[z]`, and with `𝔇_K = (√−d)` the different of `E`. `P'(ζ)` is the product of the
`ζ − a` over the other primitive roots `a`, each of which becomes real after multiplication by some `u` with `ūu = 1`.
The product of the `|δ_E|_v` is computed from the absolute norm of the different, the discriminant.

Let `P(X)` be the cyclotomic polynomial of order `q₁` and `β_K := (1 + √−d)/2`.
(a) For every primitive `q₁`-th root of unity `z ∈ 𝒪_E`, `P'(z)` divides `q₁` and generates the relative different
`𝔇_{E/K}`, and `𝒪_E = 𝒪_K[z]`. Moreover `𝒪_E = ℤ[β_K, ζ]`, `β_K + β̄_K = 1`, `β_Kβ̄_K = (d + 1)/4`, and `E` contains a
primitive root of unity of order `5040`.
(b) There is `c ∈ 𝒪_E` with `c̄c = 1` such that `c·P'(ζ)` is fixed by complex conjugation. For such `c` the element
`δ_E := c·P'(ζ)·√−d` satisfies `δ̄_E = −δ_E`, generates the different `𝔇_E` of `E/ℚ`, and
`|δ_E|_v = |P'(ζ)|_v·√d` at every infinite place `v`.
(c) `∏_{v ∈ Φ} |δ_E|_v = rd_E^f`, where `rd_E` is the root discriminant of `E`.

*Needs:* OneSidedPrimeSumBoundsAndAdmissibleData §2.1 (the parameters), §2.2 (the fields `E = K(ζ)` of the tower);
Mathlib (`differentIdeal`, `Polynomial.cyclotomic`, `IsPrimitiveRoot`).

[ShortProof], `New/Derivatives/Field/PrimeDecomposition` (`New.Parameters.relDifferent_spec`,
`New.Parameters.adjoin_betaKInE_zetaInt_eq_top`, `New.Parameters.deltaE`, `New.Parameters.star_deltaE`,
`New.Parameters.differentIdeal_eq_span_deltaE`, `New.Parameters.infinitePlace_apply_deltaE`,
`New.Parameters.prod_deltaE_eq_rootDiscr_pow`)

### 1.2 The decomposition of the primes prime to `q₁d`

*Origin:* adapted from the published theory of Frobenius elements and decomposition groups in abelian extensions of
`ℚ`: here, with the automorphisms of `E` written as pairs of a place `v ∈ Φ` and a sign (complex conjugation or not),
the Frobenius element `Fr_p = (u(χ_K(p)p), χ_K(p))`, and the inert primes written out.

*Method of the formal proof:* modulo a prime `w` above `p ∤ q₁d`, a ring automorphism of `𝒪_E` agrees with a power
`x ↦ x^{p^n}` of the Frobenius exactly when it does on `ζ` and on `β_K`, which generate `𝒪_E` (1.1); the place `u(a)`
acts by `ζ ↦ ζ^a`, `(√−d)^p ≡ χ_K(p)√−d`, and the powers of `ζ` stay distinct modulo `w` because `p ∤ q₁`. The norm of
`w` is the order of the Frobenius, and `p ∉ w²` because a square factor would divide the different, which contains
`q₁d`.

Let `p ∤ q₁d` be prime, `w` a finite place of `E` above `p`, and `Fr_p := (u(χ_K(p)·p), χ_K(p)) ∈ Φ × {±1}`.
(a) For `v ∈ Φ`: `v·w = w` if and only if `(v, 1)` is a power of `Fr_p`, and `v·w = w̄` if and only if `(v, −1)` is a
power of `Fr_p`.
(b) The norm of `w` is `p^m`, `m` the order of `Fr_p`, and `p` is unramified at `w`: `p ∈ w`, `p ∉ w²`.
(c) The places of `E` above a prime `p` are permuted transitively by `Gal(E/ℚ)`; every place `w′` above `p` is `v·w`
or the conjugate of `v·w` for some `v ∈ Φ`.
(d) If `p` is inert in `K`: `v·w = w` if and only if `v` is an even power of `u(−p)`; `v·w = w̄` if and only if `v` is
an odd power of `u(−p)`; the norm of `w` is `p^{lcm(o, 2)}`, `o` the order of `u(−p)`; and for odd `n` and every
`y ∈ 𝒪_E`, `y^{p^n} ≡ σ_n(ȳ) (mod p)`, where `σ_n` is the automorphism of `E` over `K` attached to `u(−p^n)`.
(e) If a finite place `w` satisfies `w̄ = w`, then `β_Kβ̄_K ∉ w`, the prime `p` below `w` does not divide `q₁`, and
`p ≡ −1 (mod 2^{s+1})`.

*Needs:* 1.1; OneSidedPrimeSumBoundsAndAdmissibleData §2.2 (the places `Φ` of `E` and `u(ν)`, written `[ν]` there).

[ShortProof], `New/Derivatives/Field/PrimeDecomposition` (`New.Parameters.frobElem`,
`New.Parameters.smul_eq_iff_exists_frobElem_pow`, `New.Parameters.q_eq_pow_orderOf_frobElem`,
`New.Parameters.intValuation_natCast_eq_exp_neg_one`, `New.Parameters.exists_gal_smul_mem_iff`,
`New.Parameters.exists_smul_eq_or_star`, `New.Parameters.smul_eq_self_iff_of_inert`,
`New.Parameters.smul_eq_star_iff_of_inert`, `New.Parameters.q_eq_pow_lcm_of_inert`,
`New.Parameters.natCast_dvd_pow_sub_galOfPlaceInt_star`, `New.Parameters.betaKInE_mul_star_notMem_of_star_eq`,
`New.Parameters.not_dvd_q₁_of_star_eq`, `New.Parameters.natCast_eq_neg_one_of_star_eq`)

### 1.3 Primes congruent to `1` modulo `q₁d`

*Origin:* adapted from the published theory of completely split primes in abelian extensions: here, for a prime
`p ≡ 1 (mod q₁d)` and an integer `a` of `E` with `aā = pc`, the bijection between the places `Φ` and the places above
`p` that divide `a`.

*Method of the formal proof:* the Frobenius element of 1.2 is trivial, so the stabiliser of a place above `p` is trivial
and no place is sent to its conjugate; the places above `p` dividing `a` are one in each pair `{w, w̄}` because
`aā = pc` with `c` prime to `p`, and the orbit of one of them under `Φ` gives the bijection.

Let `p ≡ 1 (mod q₁d)` be prime and `w` a finite place of `E` above `p`.
(a) `χ_K(p) = 1`, `Fr_p = 1`; `v·w = w` only for `v = 1`, `v·w ≠ w̄` for every `v ∈ Φ`, and `w` has norm `p`. If `v·w`
is `u·w` or its conjugate, then `u = v`.
(b) Let `a ∈ 𝒪_E` with `aā = p·c` for a natural number `c` prime to `p`. Then `w` contains exactly one of `a` and `ā`;
if `a ∈ w`, then `v_w(a) = 1`; and the places above `p` that contain `a` are in bijection with `Φ`.

*Needs:* 1.2.

[ShortProof], `New/Derivatives/Field/PrimeDecomposition` (`New.Parameters.frobElem_eq_one`,
`New.Parameters.smul_ne_star`), `New/Derivatives/Field/WeilData` (`New.Parameters.smul_eq_self_iff_eq_one`,
`New.Parameters.q_eq_of_modEq_one`, `New.Parameters.star_mem_iff_notMem`, `New.Parameters.intValuation_eq_of_mul_star`,
`New.Parameters.eq_of_smul_eq_or_smul_eq_star`, `New.Parameters.nonempty_infinitePlace_equiv_finPlace`)

### 1.4 The Weil data of `E` and the number `s₀`

*Origin:* particular to this proof: Weil data for `E` with `ȷ = −1/√−d` and the finite idele `α` built from `P'(ζ)`,
and a root `s₀` of `υ(α)^{−1}|α|^{1/2}` whose conjugates over `K` all have `|σ(s₀)|² = rd_E/√d`.

*Method of the formal proof:* the valuation of `αᾱP'(ζ)` is read off at each finite place: at the places dividing
`β_K` the idele `α` is `P'(ζ)^{−1}`, at those dividing `β̄_K` its conjugate is, every place dividing `P'(ζ)` divides
`β_K` or `β̄_K`, and `P'(ζ)` has the same valuation at `w` and at `w̄`; with 1.1 (b) this gives `ȷαᾱ`. A power of
`υ(α)` lies in `K` because it is the norm to `K` of an element of `E`, so the conjugates of `s₀` over `K` have the
absolute value of `s₀`, and `|s₀|^{2f} = |α| = ∏_v |P'(ζ)|_v`, which 1.1 (b), (c) turn into `(rd_E/√d)^f`.

Let `α` be the finite idele of `E` whose component is `P'(ζ)^{−1}` at the finite places that divide `β_K` and `1` at the
others, `Ô` the ring of integral finite adeles of `E`, and `𝔞₀ := E ∩ αÔ`.
(a) `α^{−1} ∈ Ô` and `q₁α ∈ Ô`; at every finite place `w`, `αᾱP'(ζ)` is a unit, and `v_w(ȷαᾱ) = −v_w(𝔇_E)` for
`ȷ := −1/√−d`; that is, `ȷ𝔞₀𝔞̄₀ = 𝔇_E^{−1}`.
(b) `ȷ̄ = −ȷ`, `τ(ȷ) = i/√d` for every `τ ∈ Φ`, and `(1 − ȷ^{−1})/2 = β_K`. Every root of unity `y ∈ E` is `δ/δ̄` for
a unit `δ` of `𝒪_E` with `N_{E/K}(δ) = 1`; `12` divides `q₁`, and `N_{E/K}(ζ^k) = N_{E/K}(ζ − 1) = 1`.
(c) `ȷ`, `α` and a splitting character `υ` with `υ(ϖ_w) = −1` at the finite places `w = w̄` are Weil data for `E` in the
sense of ShortGRH background (Weil data of a CM field).
(d) Let `s₀` be the principal `f`-th root of `υ(α)^{−1}·|α|^{1/2}`, `|α|` the idele norm. Some positive power of `s₀`
lies in `K`, `|α| = ∏_{v∈Φ} |P'(ζ)|_v`, and `|σ(s₀)|² = rd_E/√d` for every automorphism `σ` of `ℂ` over `K`.

*Needs:* 1.1, 1.2; ShortGRH background (Weil data of a CM field and splitting characters); ShortGRH background
(characters of the finite ideles attached to a splitting character, `x ↦ υ(x)|x|^{−1/2}`).

[ShortProof], `New/Derivatives/Field/WeilData` (`New.Parameters.α`, `New.Parameters.inv_alpha_mem`,
`New.Parameters.q₁_mul_alpha_mem`, `New.Parameters.v_alpha_mul_star_mul_relDifferentGen`,
`New.Parameters.v_weilData_j_mul_alpha_mul_star`, `New.Parameters.exists_unit_prod_phi_eq_one_and_mul_star_eq`,
`New.Parameters.instWeilDataE`, `New.Parameters.phi_weilData_j`, `New.Parameters.traceOne_eq_betaKInE`,
`New.Parameters.vacuumRoot`, `New.Parameters.exists_vacuumRoot_pow_mem`, `New.Parameters.ideleAbs_alpha_eq_prod`,
`New.Parameters.norm_gal_vacuumRoot`)

### 1.5 Chosen places and the residue characters `ω`

*Origin:* definitions and conventions.

*Method of the formal proof:* definitions; the facts follow from 1.3, since `p₀, p₁ ≡ 1 (mod q₁d)` and `q₂² | p_i − 1`
for the level primes of the data.

For admissible data with level primes `p₀, p₁`, `M = p₀p₁` and `π̄_M ∈ 𝒪_K` of norm `M`, put `π_M := conj(π̄_M) ∈ 𝒪_E`,
so `π_Mπ̄_M = M`. A finite place `w` of `E` is *chosen* if `π_M ∈ w`. Facts: every chosen place lies above `p₀` or `p₁`,
and a place above `p_i` has norm `p_i`; there are finitely many chosen places; and `π_Mπ̄_M = p_i·c` with `c` prime to
`p_i`, so 1.3 (b) applies to `a = π_M` at `p₀` and at `p₁`. At each chosen place fix a character of order `q₂²` of the
residue field and let `ω_w` be its `q₂`-th power, of order `q₂`; at the other finite places `ω_w := 1`. Then
`ω_w(x) = 1` whenever `x^{q₁} = 1` in the residue field, and for every family of residue characters `ψ` with `ψ_w = 1`,
`(ω^nψ)_w^{q₂} = 1`.

*Needs:* 1.3; OneSidedPrimeSumBoundsAndAdmissibleData §3.2 (the level primes `p₀, p₁`, the level `M`, `π̄_M`),
§3.3 (e) (`p_i ≡ 1 (mod q₁d)` and `q₂² | p_i − 1`).

[ShortProof], `New/Derivatives/Field/ChosenPlaces` (`New.Data.piM`, `New.Data.IsChosen`,
`New.Data.exists_levelPrime_mem_of_isChosen`, `New.Data.q_eq_levelPrime`, `New.Data.finite_isChosen`,
`New.Data.chiMLocal`, `New.Data.orderOf_chiMLocal`, `New.Data.chiMLocal_apply_eq_one_of_pow_q₁_eq_one`,
`New.Data.chiMLocal_zpow_mul_pow_eq_one`)

### 1.6 Characters of `U(1)` of given weight, and pairs

*Origin:* adapted from the published theory of algebraic Hecke characters of the norm-one torus of a CM field (a
character of given infinity type and tame part exists when the type is trivial on the global units): here for the
weights `−a·w₀` and the tame parts `ω^n`; the finiteness of pairs is particular to this proof.

*Method of the formal proof:* an element `γ` of `E` with `γγ̄ = 1` that is integral is a power of `ζ`, and
`∏_v v(ζ^k)^{w₀(v)} = 1` because `w₀(v) ≡ Δ/2 (mod q₁)` at every place (the weights `κ(v)` are multiples of `q₁`)
and `N_{E/K}(ζ) = 1`; by 1.5, `ω` is trivial on the reductions of the powers of `ζ`. The background existence theorem then gives the characters. A pair is determined by its
character, and the characters with given weight and tame part are finite in number; the weights and the tame parts at
the finitely many chosen places range over finite sets.

Let `w₀ := κ + Δ/2` be the weight of the data at the infinite places (OneSidedPrimeSumBoundsAndAdmissibleData §3.2).
(a) For all natural numbers `a, n` there is a character `μ` of `U(1)(𝔸_E)` trivial on `U(1)(E)` of weight `−a·w₀` and
tame part `ω^n`: `μ(γ) = ∏_v γ_v^{−a·w₀(v)}·∏_w ω_w(γ mod w)^n` for `γ` with integral finite part. Fix `χ₀` for
`(a, n) = (1, 0)` and `χ_M` for `(a, n) = (0, 1)`.
(b) A *pair* is a character `ν` of `U(1)(𝔸_E)/U(1)(E)` of weight `−c` with `c : Φ → ℕ` and tame part trivial off the
chosen places, together with an integer `z` with `1 ≤ z ≤ t` and `z ≤ c(v) ≤ 4b` at every `v ∈ Φ`. There are finitely
many pairs.

*Needs:* 1.5; OneSidedPrimeSumBoundsAndAdmissibleData §3.2 (the weights `κ`, the gap `Δ`, `t`, `b`); ShortGRH
background (characters of `U(1)(𝔸_E)` of given weight and tame part: existence when the weight formula is trivial on
the integral elements of `U(1)(E)`, and finiteness for a given weight and tame part).

[ShortProof], `New/Derivatives/Field/ChosenPlaces` (`New.Data.exists_zeta_pow_eq_of_isIntegral`,
`New.Data.prod_phi_zeta_pow_pow_liftWeight_zero_eq_one`, `New.Data.exists_char_hasWeight`, `New.Data.chiZero`,
`New.Data.chiM`, `New.Data.CriticalPair`, `New.Data.finite_criticalPair`)

### 1.7 The size of the different at the infinite places

*Origin:* particular to this proof: `|δ_E|_v` is `q₁/q₀·√d` up to a factor bounded by the constants of `q₀` and `d`,
so it has the size of the root discriminant at every infinite place.

*Method of the formal proof:* `P'(ζ)` at `v` is `T·v(ζ)^{T−1}` times the derivative of the cyclotomic polynomial of
order `q₀` at a primitive `q₀`-th root of unity, with `T = q₁/q₀`, since `q₁/q₀` is divisible only by primes dividing
`q₀`; the logarithm of the last factor is bounded by the sum over the primitive `q₀`-th roots. The bounds by powers of
`x` follow from the size relations of the data.

(a) At every infinite place `v` of `E`, `|δ_E|_v = A·(q₁/q₀)·√d` for some `A > 0` with `|log A| ≤ C(q₀, d)`, where
`C(q₀, d)` is the constant of the parameters; hence `|log|δ_E|_v − log rd_E| ≤ 2C(q₀, d)`.
(b) For admissible data: `x^{10} ≤ |δ_E|_v ≤ x^{12}` at every `v ∈ Φ`, and `x^{10} ≤ rd_E ≤ x^{12}`.

*Needs:* 1.1; OneSidedPrimeSumBoundsAndAdmissibleData §§3.1, 3.2 (from §3.1 the constant of the parameters, written
`C(q₀, d)` here and `C_P` there; from §3.2 the scale `x` and the size relations of the data).

[ShortProof], `New/Derivatives/Field/ChosenPlaces` (`New.Parameters.exists_abs_log_le_and_apply_deltaE_eq`,
`New.Parameters.abs_log_deltaE_sub_log_rootDiscr_le`, `New.Data.hasLogBound_deltaE`, `New.Data.rootDisc_mem_Icc`)

## Layer 2: The formal group and the exponential factor

This layer works with one elliptic curve with complex multiplication by `𝒪_K`, at a prime `p` that does not split in
`K`. The theta function `θ` of the curve is integral in the formal parameter up to an exponential factor; scaling the
variable by an element `ϖ` of valuation `ρ_p` brings the exponent into a normal form modulo `π_p`, a combination of the
series `(z^{p^e}·z)^{p^j}` (2.3), and the Frobenius congruence `θ(π_p z) ≡ θ(z)^{q_p}` (2.2) is what produces it. In
several variables, along the linear forms of a resolution of the identity whose vectors are integral above `p`, the
`p^e`-th power at a place is complex conjugation at its partner `−p^eτ` modulo `π_p` (2.6), so the exponents of the
factors add up to a combination of the *couplings* `Γ_e = Σ z_τ^{p^e}z_{−p^eτ}`: the product has the normal form of
2.4.

### 2.1 CM lattices, their functions, and the numbers attached to a prime

*Origin:* definitions and conventions.

*Method of the formal proof:* definitions; the facts on `ρ_p` and `γ_p` are computations, the sum for `γ_p` a
geometric series.

*CM lattices.* A *CM lattice* `C` (for the prime `d`) is a lattice `Λ ⊂ ℂ` stable under `𝒪_K`, with a point `t` with
`2t ∈ Λ`, `t ∉ Λ`, such that `ωt, ω̄t ∉ Λ` for `ω = (1 + √−d)/2`, scaled so that `g₂(Λ) = 12℘(t)² − 4` (that is,
`℘″(t) = 2`), together with `a₁ ∈ ℂ` with `a₁² = 12℘(t)`. With `A` the area of `ℂ/Λ`, the hermitian form
`H(l, z) = (π/A)·l̄z` and its translations `T^m_l g(z) := exp(−mπ(z·l̄ + |l|²/2)/A)·g(z + l)` (degree `m`), put:
`θ(z) := T^1_tσ(z)/T^1_tσ(0)` (`σ` the Weierstrass sigma function of `Λ`), `x(z) := ℘(z + t) − ℘(t)`,
`y(z) := (℘′(z + t) − a₁x(z))/2`, and `g := −log θ`. Read in `ℂ_p` through `ι_p`, these are power series in `z`.
`𝒪[[y]]` is the ring of series `G(y)` with `G` integral; at a prime `p` it equals `𝒪[[T]]`, where the formal parameter
`T` is the part of `y` in the degrees `≡ 1 (mod q_p − 1)`. For linear forms `μ_1, …, μ_k` over
`ℂ_p` in variables `z`, `𝒪[[y(μz)]]` is the ring of series `G(y(μ_1z), …, y(μ_kz))` with `G` integral, and
`thetaProd(μ, m) := ∏_j θ(μ_jz)^{m_j}`.

*Numbers at a prime.* For a prime `p`: `π_p := √−d` if `p = d` and `π_p := p` otherwise, of valuation `v(π_p) = 1/2`
if `p = d` and `1` otherwise; `q_p := p²` if `p` is inert in `K` and `q_p := p` otherwise; `ρ_p := v(π_p)/(q_p − 1)`,
which is `1/(p − 1)`, `1/(p² − 1)`, `1/(2p − 2)` for `p` split, inert, `p = d`; `γ_p := 1/(p − 1) − ρ_p`, which is
`0`, `p/(p² − 1)`, `1/(2p − 2)`. `I_p°` is the set of odd `e ≥ 0` if `p` is inert, of all `e ≥ 0` if `p = d`, and is
empty if `p` splits; `I_p` is the set of its positive elements. Then `γ_p = v(π_p)·Σ_{e∈I_p} p^{−e}`, `0 ≤ γ_p ≤ 1`,
and a prime that does not split in `K` is odd and at least `13`.

*Needs:* ShortGRH background (CM lattices: the sigma and Weierstrass functions, the formal parameter, and the ring
`𝒪[[y]] = 𝒪[[T]]`); OneSidedPrimeSumBoundsAndAdmissibleData §2.1 (the prime `d` and the primes dividing `q₀`, which
split in `K`).

[ShortProof], `New/Derivatives/FormalGroup/Resolution` (`New.CMLattice.thetaProd`); for `CMLattice`, `θ`,
`translatedX`, `translatedY`, `negLogTheta`, `multiSeriesRing` and the numbers at a prime the definitions in `src/Lib`
(`Lib/CM/Sigma/Basic`, `Lib/CM/Integrality/LogTheta`, `Lib/CM/FormalGroup/PrimeNotation`)

### 2.2 The Frobenius congruence for `θ`

*Origin:* particular to this proof: the congruence `θ(π_pz) ≡ θ(z)^{q_p}` modulo `π_p` in `𝒪[[y]]` at a prime that does
not split in `K`, and the unit coefficient of `z^{p−1}` in `x` at an inert prime.

*Method of the formal proof:* `θ(π_pz)/θ(z)^{q_p}` is an even elliptic function, hence a polynomial `R(x)` of degree
less than `q_p/2`; the coefficients of `q_pg(z) − g(π_pz)` of degree below `q_p` are divisible by `π_p` (using
`|π_p|·|g_n| ≤ 1` there), which forces `R(x) ≡ 1` modulo `π_p` below the degree `q_p` and hence everywhere. For the
coefficient of `z^{p−1}` in `x`, the numbers `h_n = [z^{p−1}]x^n` satisfy a three-term recursion modulo `p`, from
`x′² = 4x³ + a₁²x² + 4x`, that links `h_0 = 0`, `h_1 = [z^{p−1}]x` and `h_{(p−1)/2} = 1` (as `x = z² + ⋯`) and forces
`h_1` to be a unit.

Let `C` be a CM lattice and `p` a prime that does not split in `K`.
(a) `θ(π_pz) = θ(z)^{q_p}·R(x(z))` for a polynomial `R` over `ℂ_p` with `2·deg R < q_p`.
(b) `θ(π_pz) = θ(z)^{q_p}·(1 + π_pH)` for some `H ∈ 𝒪[[y]]`.
(c) `q_p·g(z) − g(π_pz) = π_pH′` for some `H′ ∈ 𝒪[[y]]`.
(d) If `p` is inert in `K`, the coefficient of `z^{p−1}` in `x` is a unit of `𝒪`.

*Needs:* 2.1; ShortGRH background (CM lattices: polynomials in `x` and the integrality of `x` in `𝒪[[y]]`).

[ShortProof], `New/Derivatives/FormalGroup/FrobeniusCongruence` (`New.CMLattice.exists_rescale_theta_eq_pow_mul_aeval`,
`New.CMLattice.exists_rescale_theta_eq_pow_mul_one_add_smul`, `New.CMLattice.exists_negLogTheta_frobenius_congruence`,
`New.CMLattice.norm_coeff_taylorVia_translatedX_eq_one`)

### 2.3 The exponent on one curve

*Origin:* particular to this proof: at a prime that does not split in `K`, `θ(ϖz)` is an integral series times
`exp(c_ϖΞ)` for some `ϖ` of valuation `ρ_p`, with `Ξ` integral and congruent modulo `π_p` to a combination of the
series `(z^{p^e}·z)^{p^j}`, `e ∈ I_p°`.

*Method of the formal proof:* in four steps. Averaging `ζ^{−p−1}g(ζz)` over the `(q_p − 1)`-th roots of unity `ζ`
replaces `g` by its part `g^♭` in the degrees `≡ p + 1` modulo `q_p − 1`, and `θ·exp(g^♭)` lies in `𝒪[[y]]` (its
`(q_p − 1)`-th power is a product of such terms, and `q_p − 1` is prime to `p`). The Frobenius congruence 2.2 (c) gives a
functional equation for `Ξ₁ := −g^♭(ϖz)/c_ϖ`, solved degree by degree with `Y := T(ϖz)/ϖ ≡ Σ_j z^{q_p^j}`: `Ξ₁ ≡ λY^{p+1}`
for inert `p` and `Ξ₁ ≡ λ(Y² − z²/2)` for `p = d`. At an inert prime the coefficient of `z^{p+1}` in `Ξ₁` is a unit
multiple of that of `z^{p−1}` in `x` (2.2 (d)), so `λ` is a unit.

Let `C` be a CM lattice, `p` a prime that does not split in `K`, and `c_ϖ := ϖ^{p+1}/p` for `ϖ ∈ ℂ_p`.
(a) If `ϖ ≠ 0` and `v(ϖ) ≥ ρ_p`, then `θ(ϖz) = W·exp(c_ϖΞ₁)` with `W ∈ 𝒪[[z]]`, where `Ξ₁ := −g^♭(ϖz)/c_ϖ` and `g^♭` is
the part of `g` in the degrees `≡ p + 1 (mod q_p − 1)`.
(b) There are `ϖ ∈ ℂ_p` with `v(ϖ) = ρ_p`, series `Ξ, W ∈ 𝒪[[z]]` with `Ξ(0) = 0`, and numbers `λ_{ej} ∈ 𝒪` such that
`θ(ϖz) = W·exp(c_ϖΞ)` and `Ξ ≡ Σ_{e∈I_p°} Σ_{j≥0} λ_{ej}·(z^{p^e}·z)^{p^j} (mod π_p)`. If `p` is inert, one can take
all `λ_{ej}` equal to one unit `λ`; if `p = d`, one can take `λ_{00} = λ/2`, `λ_{0j} = λ` for `j ≥ 1` and `λ_{ej} = 2λ`
for `e ≥ 1`, with `λ ∈ 𝒪`.
(c) If `p` is inert and `ϖ ≠ 0`, the coefficient of `z^{p+1}` in `Ξ₁` is a unit.

*Needs:* 2.1, 2.2; ShortGRH background (the formal group of a CM lattice at a prime that does not split in `K`: there is
`ϖ` of valuation `ρ_p` with `T(ϖz) = ϖY`, `Y` integral and `Y ≡ Σ_j z^{q_p^j} (mod π_p)`; series of `𝒪[[y]]` stay
integral after `z ↦ ϖz` when `v(ϖ) ≥ ρ_p`; and `exp(G)` lies in `𝒪[[y]]` when a power prime to `p` of it does).

[ShortProof], `New/Derivatives/FormalGroup/Exponent` (`New.CMLattice.exists_rescale_theta_eq_mul_expSubst`,
`New.CMLattice.norm_coeff_exponentSeries_eq_one`, `New.CMLattice.exists_eq_exponentSeries_dvd_sub_tsum_of_inert`,
`New.CMLattice.exists_exponentSeries_tsum_of_ramified`, `New.CMLattice.exists_exponent_tsum`)

### 2.4 Couplings and the normal form

*Origin:* particular to this proof: the normal form `F(ϖz) = W·exp(c_ϖ·Σ λ_{ej}Γ_e^{p^j})` of a series in variables
indexed by places, with its stability under integral scaling and substitution, and the integrality criterion that the
count of Layer 3 applies.

*Method of the formal proof:* `Γ_e` is homogeneous of degree `p^e + 1`, so the coupling series converges and scaling by
`α` multiplies `λ_{ej}` by `α^{(p^e+1)p^j}`; a change of `ϖ` within its absolute value is such a scaling by a unit. In
the integrality criterion, the terms with `e > log_p B` have order above `B`, and `exp(aG)` is integral in degrees `≤ B`
when the coefficients of `aG` there have valuation at least `1/(p − 1)`. Modulo `p`, `p^j`-th powers with `j ≥ 1` and
`p^e`-th powers with `e ≥ 1` have derivatives divisible by `p`.

Let `p` be a prime, `Φ` and `c` finite sets, `z_{(τ,i)}` (`τ ∈ Φ`, `i ∈ c`) variables, and `pr : ℕ × Φ → Φ`,
`(e, τ) ↦ pr_e(τ)` a partner rule. The *couplings* are `Γ_e := Σ_{(τ,i)} z_{(τ,i)}^{p^e}·z_{(pr_e τ, i)}`. For
`S ⊂ ℕ` and `λ : ℕ × ℕ → 𝒪`, the *coupling series* is `Ξ_λ := Σ_{e∈S} Σ_{j≥0} λ_{ej}Γ_e^{p^j}` (it converges, and
`Ξ_λ(0) = 0`). A series `F` over `ℂ_p` *has the normal form* `(S, pr, ϖ, λ)` if `F(ϖz) = W·exp(c_ϖΞ_λ)` with `W`
integral and `c_ϖ := ϖ^{p+1}/p`. Prove:
(a) *Scaling.* If `F` has the normal form `(S, pr, ϖ, λ)` and `α ∈ 𝒪`, then `F(αz)` has the normal form with
`λ_{ej}` replaced by `α^{(p^e+1)p^j}λ_{ej}`. If `ϖ ≠ 0` and `|ϖ′| = |ϖ|`, then `F` has the normal form
`(S, pr, ϖ′, λ′)` for some `λ′`.
(b) *Substitution.* If `F` has the normal form and the `Z_x` are integral series without constant term, then
`F(ϖZ) = W′·exp(c_ϖΞ_λ(Z))` with `W′` integral.
(c) *Integrality.* Let `π ∈ 𝒪` with `v(c_ϖπ) ≥ 1/(p − 1)`, let the `Z_x` be integral without constant term, and let `π`
divide `Γ_e(Z)` for every `e ∈ S` with `e ≤ log_p B`. Then the coefficients of `F(ϖZ)` of total degree `≤ B` are
integral.
(d) *The exponent modulo `π`.* If `F(ϖz) = W·exp(c_ϖΞ)` with `W`, `Ξ` integral, `Ξ(0) = 0`, `Ξ ≡ Ξ_λ (mod π)` and
`v(c_ϖπ) ≥ 1/(p − 1)`, then `F` has the normal form `(S, pr, ϖ, λ)`.
(e) *Derivatives.* If `0 ∉ S`, then `∂Ξ_λ/∂z_y ≡ Σ_{e∈S} λ_{e0}·Σ_{x : (pr_e x₁, x₂) = y} z_x^{p^e} (mod p)`; modulo the
maximal ideal of `𝒪`, `∂Ξ_λ/∂z_y` has only the monomials `z_x^{p^e}` with `e ∈ S` and `y = (pr_e x₁, x₂)`, and the
coefficient of `z_x^{p^e}` in `∂Ξ_λ/∂z_{(pr_e x₁, x₂)}` is `λ_{e0}`.

*Needs:* Mathlib (`MvPowerSeries`, substitution and its continuity); ShortGRH background (the exponential of a power
series without constant term over `ℂ_p`, and its integrality when the coefficients have valuation `≥ 1/(p − 1)`).

[ShortProof], `New/Derivatives/Divisibility/NormalForm` (`New.coupling`, `New.couplingSum`, `New.HasNormalForm`,
`New.HasNormalForm.rescale`, `New.HasNormalForm.exists_of_norm_eq`, `New.HasNormalForm.exists_subst_eq_mul_expSubst`,
`New.HasNormalForm.norm_coeff_subst_le_one`, `New.HasNormalForm.of_dvd_sub`, `New.dvd_pderiv_couplingSum_sub`,
`New.residue_coeff_pderiv_couplingSum`, `New.exists_eq_single_of_residue_coeff_pderiv_ne_zero`)

### 2.5 Resolutions of the identity and products of copies of `θ`

*Origin:* definitions and conventions (a resolution of the identity is a Parseval frame), with elementary facts.

*Method of the formal proof:* the identities are expansions of sums; an element integral above `p` is written with a
denominator split into a power of `p` and a part prime to `p`; scaling the variables scales the forms; partial
derivatives of a series `G(y(μz))` are sums of `∂G·y′(μ_iz)·μ_i`, and `y′` lies in `𝒪[[y]]`.

Let `E` be a CM field with a CM type and `n` a finite set. For `u ∈ E^n` the linear form `u†z := Σ_{(τ,c)} conj(τ(u_c))·z_{τ,c}`
in variables `z_{τ,c}` (`τ` an infinite place, `c ∈ n`). A finite family `u_j ∈ E^n` with multiplicities `m_j ∈ ℕ` is a
*resolution of the identity* if `z = Σ_j m_j(u_j†z)·u_j` for all `z ∈ ℂ^{Φ×n}` (the vector `u_j` read through the CM
type). Facts:
(a) *Parseval.* For a resolution, `Σ_j m_j·conj(u_j†z′)·(u_j†z) = Σ_x conj(z′_x)z_x`; and if the `ν_j ∈ 𝒪` are the
images of `τ(u_{j,c})` for a fixed `x = (τ, c)`, then `Σ_j m_jν_j·(u_j†z) = z_x` with the forms read in `ℂ_p`.
(b) An element `y ∈ E` integral above `p` is `α/N` with `α ∈ 𝒪_E` and `N ∈ ℕ` prime to `p`; it is integral under every
embedding `E → ℂ_p`, and so are the complex conjugates of its complex embeddings read through `ι_p`.
(c) For a CM lattice `C` and forms `μ_j`: `thetaProd(μ, m)(az) = thetaProd(aμ, m)(z)`; `G ∈ 𝒪[[y(μz)]]` gives
`G(az) ∈ 𝒪[[y(aμz)]]`; and if the `μ_j` have integral coefficients, `𝒪[[y(μz)]]` is stable under the partial
derivatives.

*Needs:* 2.1; ShortGRH background (CM lattices: `y′ ∈ 𝒪[[y]]`).

[ShortProof], `New/Derivatives/FormalGroup/Resolution` (`New.dagger`, `New.IsResolution`,
`New.IsResolution.sum_conj_mul`, `New.IsIntegralAbove`, `New.IsIntegralAbove.exists_mul_eq`,
`New.IsIntegralAbove.norm_le_one`, `New.daggerForms`, `New.IsResolution.sum_smul_linearSeries`,
`New.CMLattice.rescale_thetaProd`, `New.CMLattice.rescale_mem_multiSeriesRing`, `New.CMLattice.pderiv_mem_multiSeriesRing`)

### 2.6 Partners, and the normal form of products of copies of `θ`

*Origin:* particular to this proof: at a prime that does not split in `K`, the product `∏ θ(u_j†z)^{m_j}` along a
resolution of the identity by vectors over `E` integral above `p`, times any integral series in the `y(u_j†z)`, has the
normal form of 2.4 for the exponents `I_p°` and the partners `−p^eτ`, with one `ϖ` and one `λ` for all resolutions.

*Method of the formal proof:* for `e ∈ I_p°` the maps `a ↦ τ(a)^{p^e}` and `a ↦ conj(τ′(a))`, `τ′ = −p^eτ`, agree modulo
`π_p` on the generators `ζ` and `β_K` of `𝒪_E` (1.1, 1.2 (d)); with the resolution identity of 2.5 (a) this gives
`Σ_j m_j(u_j†z)^{p^e}(u_j†z) ≡ Γ_e (mod π_p)`. The factors `θ(ϖ·u_j†z) = W(u_j†z)·exp(c_ϖΞ(u_j†z))` of 2.3 multiply;
modulo `π_p` the `p^j`-th powers are additive, so `Σ_j m_jΞ(u_j†z) ≡ Ξ_λ (mod π_p)`, and 2.4 (d) applies because
`v(c_ϖπ_p) = 1/(p − 1)`.

Let `p` be a prime that does not split in `K`, `E = K(ζ)` of some level, and for `e ∈ I_p°` let `−p^eτ` be the partner
of `τ ∈ Φ`.
(a) `v(c_ϖπ_p) = 1/(p − 1)` when `v(ϖ) = ρ_p`.
(b) For `e ∈ I_p°`, `τ ∈ Φ` and `a ∈ 𝒪_E`: `τ(a)^{p^e} ≡ conj((−p^eτ)(a)) (mod π_p)` in `𝒪`.
(c) If the vectors `u_j ∈ E^n`, integral above `p` and taken `m_j` times, form a resolution of the identity, then for
`e ∈ I_p°`, `Σ_j m_j·(u_j†z)^{p^e}·(u_j†z) ≡ Γ_e (mod π_p)`, where `Γ_e` is the coupling of 2.4 for the variables
`z_{(τ,c)}`, `(τ, c) ∈ Φ × n`, and the partner rule `(e, τ) ↦ −p^eτ`.
(d) Let `C` be a CM lattice. There are `ϖ ∈ ℂ_p` with `v(ϖ) = ρ_p` and `λ_{ej} ∈ 𝒪`, with `λ_{e0}` a unit for odd `e`
if `p` is inert, such that for every resolution `(u_j, m_j)` of `E^n` by vectors integral above `p` and every
`H ∈ 𝒪[[y(u†z)]]`, the series `thetaProd(u†, m)·H = ∏_j θ(u_j†z)^{m_j}·H` has the normal form `(I_p°, −p^e·, ϖ, λ)`.
The formal proof proves the case of the CM curve `𝓔` of 4.2; its argument uses only 2.3 for `C`.

*Needs:* 1.1, 1.2, 2.3, 2.4, 2.5.

[ShortProof], `New/Derivatives/FormalGroup/ThetaProducts` (`New.Parameters.partner`,
`New.Parameters.norm_pow_succ_div_mul_piPrimeInt`, `New.Parameters.norm_pow_sub_conj_partner_le`,
`New.Parameters.piPrimeInt_dvd_sum_linearSeries_sub_coupling`, `New.dvd_sum_subst_sub_couplingSum`,
`New.CMLattice.rescale_thetaProd_eq_mul_expSubst`, `New.Parameters.exists_hasNormalForm`)

## Layer 3: Divisibility of jets that counts primes

A jet of a series in normal form along a product of minors is bounded below by changing the directions of the minors
so that, at each place and its partner, the pairings that matter become divisible by `π_p` (3.2): then the substituted
series is integral in the degree of the jet by 2.4 (c), Legendre's bound gives `1/(p − 1)` per box, the scale `ϖ`
costs `ρ_p` per box, and the determinants of the changes of directions cost the deduction. What remains, `γ_p` per box
less the deduction, is the predicted divisibility `D_p(κ)` (3.3). 3.4 passes from products of minors to the entries of
Schur matrices.

### 3.1 Products of minors, charges and the predicted divisibility

*Origin:* definitions and conventions.

*Method of the formal proof:* definitions; the predicted divisibility is the sum over `e ∈ I_p` of the per-place gains
less the deduction terms, rearranged.

*Diagrams and fillings.* Let `Φ` be a finite set (places), `n′` a finite set of rows with `N := |n′|`, and `n` a finite
set. A *diagram* `κ` gives at each `τ ∈ Φ` the number `κ_τ(h)` of columns of height `h`; only the heights `h < N` count.
A *filling* `i′` puts a row of `n′` into each box of these columns. For integral matrices `y_τ` with rows indexed by `n`
(columns `k = 0, 1, …`), the *product of minors* `P_y` is the polynomial in the entries `z_{τ,r,a}` (`r ∈ n′`, `a ∈ n`)
of matrices `z_τ` given by the product, over the places `τ` and the columns of height `h < N`, of the minor of `z_τy_τ`
on the `h` rows that `i′` puts into the column and on the first `h` columns of `y_τ`.

*Counts.* Among the heights below `N`: `a_τ` is the number of columns of height `1` at `τ`, `a′_τ` the number of the
other columns, `l_τ` the number of boxes in these other columns, and `B := Σ_τ Σ_{h<N} h·κ_τ(h)` the number of boxes.

*The deduction.* For a set `ev ⊂ Φ` of marked places, places `σ, σ′` and `e ≥ 0`, with `t_σ := a_σ` if `σ ∉ ev` and
`t_σ := 0` if `σ ∈ ev`:
`ded_ev(σ, σ′, e) := min(t_σ/p^e, a′_{σ′} + t_{σ′}) + a′_σ/p^e + min(l_σ/p^e, l_{σ′})`.
A pair of heights `h` at `σ` and `h′` at `σ′` is *exempt* if `h = 1` and (`σ ∈ ev`, or `h′ = 1` and `σ′ ∈ ev`).

*The predicted divisibility.* For a prime `p` that does not split in `K`, the places `Φ` of `E` and the partners
`τ_e := −p^eτ`:
`D_p(κ) := v(π_p)·Σ_{e∈I_p} Σ_τ ((a_τ/p^e − a_{τ_e} − a′_{τ_e})₊ + (l_τ/p^e − l_{τ_e})₊ − a′_τ/p^e)
 − [p = d]·½·Σ_τ (min(a_τ, a_{−τ} + a′_{−τ}) + a′_τ + min(l_τ, l_{−τ}))`
(the series converges). It equals `γ_p·B − v(π_p)·Σ_{e∈I_p°} Σ_τ ded_∅(τ, τ_e, e)` (the term `e = 0` occurs for `p = d`
only). Removing the columns of height `1` at the places of `ev` (the diagram `κ^{ev}`) has the same effect on the
deduction terms as marking these places.

*Charges.* Exponents `w(τ, h, r) ∈ ℕ` (place, height, row) are *charges for `ev`* at the exponent `e` if, for every `τ`,
`h` and row `r`, `τ ∈ ev` or (`h = 1` and `τ_e ∈ ev`) implies `w(τ, 1, r) ≠ 0` or `w(τ_e, h, r) ≠ 0`. The total charge
`W(i′)` of a filling is the sum of `w(τ, h, r)` over the boxes, `r` the row in the box.

*Needs:* 2.1.

[ShortProof], `New/Derivatives/Divisibility/Count` (`New.minorProd`, `New.heightOneColumns`, `New.lowColumnCount`,
`New.lowBoxCount`, `New.eraseHeightOne`, `New.predictedDivisibility`, `New.IsChargeExponent`, `New.fillingCharge`,
`New.deductionTerm_eraseHeightOne`, `New.mul_sum_deductionTerm_le`), `New/Derivatives/Divisibility/NullFrames`
(`New.deductionTerm`, `New.IsExemptPair`)

### 3.2 The change of directions

*Origin:* particular to this proof: integral changes of the directions at each place and height that make the
pairings `Σ_a β_a^{p^e}β′_a` of new directions at a place and at its partner divisible by `π`, apart from the exempt
pairs, with determinants whose valuations add up to at most `v(π)` times the deduction.

*Method of the formal proof:* finitely many congruences on the rows of one matrix are met by elimination over `𝒪`, at
the price of the product of the moduli (a row of least valuation is multiplied by the modulus, and multiples of it are
subtracted from the others). For a place `σ`, its partner `σ′` and `e`, a choice of congruences (on all entries of the
rows at `σ` modulo a `p^e`-th root of `π`, or on their pairing with the first direction at `σ′`, and the same at `σ′`
modulo `π`) covers every pair of heights that is not exempt, at the cost `ded_ev(σ, σ′, e)`; `p^e`-th powers are
additive modulo `p`, and `𝒪` contains `p^e`-th roots.

Let `π ∈ 𝒪` divide `p`, `pr` a partner rule on a finite set `Φ`, `S ⊂ ℕ` finite, `N ≥ 0`, `κ` a diagram, `ev ⊂ Φ`,
and `y_τ` integral matrices with rows indexed by `n` (columns `k ≥ 0`, the given directions). Then there are matrices
`g_{τ,h} ∈ M_h(𝒪)`, one for each place `τ` and height `h`, such that the new directions
`β^{τ,h}_k := Σ_{k′<h} (g_{τ,h})_{kk′}·y_{τ,·,k′}` (`k < h`) satisfy:
(a) for `e ∈ S`, `τ ∈ Φ`, heights `h, h′` and `k < h`, `k′ < h′`, unless the pair of heights `h` at `τ` and `h′` at
`pr_e τ` is exempt, `π` divides `Σ_a (β^{τ,h}_{k,a})^{p^e}·β^{pr_eτ,h′}_{k′,a}`;
(b) `Σ_τ Σ_{h<N} κ_τ(h)·v(det g_{τ,h}) ≤ v(π)·Σ_{e∈S} Σ_τ ded_ev(τ, pr_e τ, e)`.

*Needs:* 3.1.

[ShortProof], `New/Derivatives/Divisibility/NullFrames` (`New.exists_det_dvd_prod_and_dvd_mulVec`,
`New.dvd_sum_pow_mul_of_root_dvd`, `New.exists_congruenceChoice_cost_eq_and_covers`,
`New.norm_rpow_sum_cost_eq_prod_congruenceModulus`, `New.newDirection`, `New.exists_newDirection_dvd`)

### 3.3 The count

*Origin:* particular to this proof: a lower bound for the valuations of the jets of a series in normal form along
products of minors, by the closed formula `D_p(κ)` in the numbers of columns and boxes at the places and their
partners, with a loss `f·N³·(1 + log_p B)`; the version with marked places and charges.

*Method of the formal proof:* substitute `z_{τ,r,a} = ϖ·Σ_{(h,k)} p^{w(τ,h,r)}·β^{τ,h}_{k,a}·s_{τ,h,k,r}` in new
variables `s`, with the directions of 3.2 for `π = π_p` and `S = {e ∈ I_p° : e ≤ log_p B}`. By the chain rule the jet of
`F` along `P_y` is, up to the factors `ϖ` per box, `p^{w}` per box and `det g_{τ,h}` per column, the jet of the substituted
series along a product of determinants in `s`, a homogeneous polynomial of degree `B` with integral coefficients. The
couplings of the substitution are divisible by `π_p` (the exempt pairs by the charges), so by 2.4 (c), with
`v(c_ϖπ_p) = 1/(p − 1)` (2.6 (a)), the substituted series is integral in degree `B`; Legendre's bound gives
`B/(p − 1) − |variables|·(1 + log_p B)` for its jet, and there are at most `f·N³` variables `s`. The count is the case
`ev = ∅`, `w = 0`.

Let `p` be a prime that does not split in `K`, `E = K(ζ)` of some level with places `Φ` and `f = |Φ|`, `n`, `n′`
finite sets, `N = |n′|`, and `F` a power series over `ℂ_p` in the variables `z_{τ,r,a}` (`τ ∈ Φ`, `r ∈ n′`, `a ∈ n`)
with the normal form `(I_p°, −p^e·, ϖ, λ)` of 2.4 (couplings over `c = n′ × n`) for some `ϖ` with `v(ϖ) = ρ_p` and
some `λ`. Let `κ` be a diagram, `i′` a filling, `y_τ` integral matrices, and `B` the number of boxes.
(a) *The count.* `v(jet_{P_y}(F)) ≥ D_p(κ) − f·N³·(1 + log_p max(B, 1))`.
(b) *With charges.* Let `ev ⊂ Φ` and let `w` be charges for `ev` at every `e ∈ I_p°`, the condition being asked only
when `κ_τ(1) ≠ 0` and `κ_{τ_e}(h) ≠ 0`. Then
`v(jet_{P_y}(F)) + W(i′) ≥ D_p(κ^{ev}) + γ_p·(B − B^{ev}) − f·N³·(1 + log_p max(B, 1))`, where `B^{ev}` is the number
of boxes of `κ^{ev}`.
(c) *Before the summation.* If `w` are charges for `ev` at every `e ∈ I_p°`, with the condition asked for all
heights (not only those that occur in `κ`), then
`v(jet_{P_y}(F)) + W(i′) ≥ γ_p·B − v(π_p)·Σ_{e∈I_p°, e≤⌊log_p B⌋} Σ_τ ded_ev(τ, τ_e, e) − f·N³·(1 + ⌊log_p B⌋)`
(`⌊log_p 0⌋ := 0`).
The formal proof states (a)–(c) for the chosen standard fillings of the diagram; its argument uses only the rows that
the filling puts into the boxes.

*Needs:* 2.4, 2.6 (a), 3.1, 3.2; TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.1 (Legendre's bound
`v_p(κ!) ≥ |κ|/(p − 1) − #ι·(⌊log_p max(|κ|, 1)⌋ + 1)`, the sharper form of (e)).

[ShortProof], `New/Derivatives/Divisibility/Count` (`New.norm_prod_factorial_le`, `New.norm_jet_le_of_isHomogeneous`,
`New.norm_jet_columnDetProd_subst`, `New.dvd_subst_coupling_directionSubst_of_charges`,
`New.Parameters.norm_jet_minorProd_le_of_isChargeExponent`, `New.Parameters.norm_jet_minorProd_le_of_charges`,
`New.Parameters.norm_jet_minorProd_le_of_hasNormalForm`)

### 3.4 From entries of Schur matrices to products of minors

*Origin:* particular to this proof: an entry of the matrix of jets along a Schur matrix is bounded by a jet along one
product of minors with integral directions.

*Method of the formal proof:* the product of minors `P_y` is the combination of the entries of row `i′` of the Schur
matrix with coefficients the values at `y` of the standard products of minors times a power of the determinant; these
polynomials stay linearly independent over the residue field of `𝒪`, which is algebraically closed, so some integral `y`
makes the combination of the jets as large as the largest of them (an ultrametric choice).

Let `n`, `n′` be finite sets with `|n| ≤ |n′|`, and `κ` a diagram with no column of height strictly between `|n|` and
`|n′|`. For the family of matrices `z_τ` of size `n′ × n`, let `S_κ(z)` be the Schur matrix of `κ`, indexed by the
chosen standard fillings `i′` (rows `n′`) and `i` (rows `n`), and for a power series `F` over `ℂ_p` let `J_κ(F)_{i′,i}`
be the jet of `F` along the entry `(i′, i)` of `S_κ(z)`.
(a) `P_y = Σ_i (b_i·det^{d})(y)·S_κ(z)_{i′,i}`, where `b_i` is the product of minors of the filling `i` and `det^d` the
product over `τ` of the determinants of the first `|n|` columns of `y_τ` to the power `κ_τ(|n|)` if `|n| < |n′|` and `0`
otherwise.
(b) For every `F` and all `i′`, `i` there are integral matrices `y_τ` with `v(J_κ(F)_{i′,i}) ≥ v(jet_{P_y}(F))`.

*Needs:* 3.1; IntegralWeylModulesOfGeneralLinearGroups §0.1 (the standard bideterminant basis over an integral
domain, here over the residue field of `𝒪`); ShortGRH background (Schur matrices of families of matrices in the bases
of standard fillings).

[ShortProof], `New/Derivatives/Divisibility/Count` (`New.exists_norm_le_norm_sum_mul_eval`, `New.minorProd_eq_sum`,
`New.exists_norm_schurJet_le_norm_jet_minorProd`)

## Layer 4: The integral vacuum

The vectors of the Weil representation whose jets the lifts use are integral combinations of translates of the
*integral vacuum*, a fixed nonzero multiple of the vacuum with integral values and bounded conjugates. This layer
writes such vectors, through Fourier inversion, as translates of a theta function that is a product of copies of `θ`
along a tight frame of `E` (4.3–4.5, 4.9), deduces the integrality of their jets at every prime (4.10) and, at a prime
that does not split in `K`, the normal form of their Taylor series and the divisibility of Layer 3 (4.11). It also fixes
the scale `𝔱_E` of the Taylor series (4.2), bounds the values of the integral vacuum (4.6), and gives the action of the
automorphisms of `ℂ` over `K` on the jets of translates (4.7).

### 4.1 The Weil model, theta functions of vectors, and tight frames

*Origin:* definitions and conventions.

*Method of the formal proof:* definitions; the model is built in `src/Lib` from the Heisenberg group, and the theta
function of a vector is its theta value at a real translate times a Gaussian.

Let `E` be a CM field with a CM type and Weil data `(ȷ, α, υ)`, `Ô` the integral finite adeles, `𝔞₀ := E ∩ αÔ`, and
`n` a finite set. The *finite image* of `γ ∈ E^n` is `α^{−1}γ ∈ 𝔸_{E,f}^n`; `γ ∈ 𝔞₀^n` exactly when it is integral.
For `x ∈ 𝔸_{E,f}^n`, `finVec(x)` is the adelic vector with finite part `αx` and archimedean part `0`.

*The Weil model.* For a hermitian space `V` over `E` of rank `n` with signs at the infinite places and an adelic
point, `𝒮(V)` is the space of the adelic Weil representation of ShortGRH background, with the vacuum `vac_V` (the
Gaussian at the infinite places times the twisted indicator of the standard lattice), the Heisenberg translations
`ϱ(y)`, the operators `ϱ_f(x) := (semicharacter of x)·ϱ(finVec(x))` of finite adelic vectors, the Weil operators
`ω(g)`, the theta functional `θ_V`, and the inner product `⟨f, f′⟩` (the mean of `conj(f)f′` over `𝔸_E^n/E^n`). The
*value* of `f ∈ 𝒮(V)` at an adelic vector `y` is `f(y) := θ_V(ϱ(y)f)`. `V` is *standard* if all its signs are `+1` and its
point is the identity: `V = E^n` with the form `Σ_i x_iȳ_i`; `Hom(E^n, E^{n′})` is standard with the form of the
coordinates. The *finite part* `𝒮_f(V)` is the span of the `ϱ_f(x)vac_V`, `x ∈ 𝔸_{E,f}^n`.

*Theta functions.* For `f ∈ 𝒮_f(V)` with all signs `+1`, `Θ_f(z) := θ_V(ϱ(z)f)·exp(|z|²/2)`, for `z ∈ ℂ^{Φ×n}` read as
a real adelic vector in Fock coordinates, is an entire function; for `c ∈ ℂ`, the *jet series* `J_c(f)` is the Taylor
series at `0` of `z ↦ Θ_f(cz)`, in the variables `z_{τ,i}`. A function `G` on `ℂ^{Φ×n}` is a *theta function for* a
subgroup `Y ⊂ E^n` if it is entire and fixed by the signed translations by the `γ ∈ Y`: the normalised translation (with
its Gaussian factor) by the real image of `γ`, times the value of the semicharacter at the finite image of `γ`.

*Tight frames.* A finite family `w_i ∈ 𝔞₀` with multiplicities `m_i ∈ ℕ` is a *tight frame of length `M`* if
`Σ_i m_i·σ(w_i)·conj(τ(w_i)) = M·δ_{στ}` for all infinite places `σ, τ`. Taking each vector `k` times as often gives a
tight frame of length `kM`; the union of two tight frames is one of the sum of the lengths.

*Needs:* 1.4; ShortGRH background (the adelic Weil representation of a hermitian space over a CM field with Weil data:
the model `𝒮(V)`, the vacuum, the Heisenberg and Weil operators, the theta functional, the finite part, the theta
function of a vector of the finite part and its holomorphy).

[ShortProof], `New/Derivatives/Vacuum/TightFrames` (`New.IsTightFrame.mul_left`), `New/Derivatives/Vacuum/ShortVectors`
(`New.IsTightFrame.sumElim`, `New.IsTightFrame.join_family`, `New.IsTightFrame.replace_pairs`); the model, `finVec`,
`finiteImage`, `IsTightFrame`, `IsThetaFunction`, `entireTheta` and `jetSeries` are definitions in `src/Lib`
(`Lib/Weil/Construction`, `Lib/Weil/MixedModel/RealTheta`, `Lib/General/LinearAlgebra/PolarDecomposition`)

### 4.2 The CM curve and the scale of Taylor series

*Origin:* particular to this proof: the scale `𝔱_E = 𝔣_E·A_K/Ω₀` at which Taylor series of theta functions are taken,
with `|𝔱_E|² = Ω^{−1}` from the Chowla–Selberg formula, and the `p`-adic size of the period factor `𝔣_E`.

*Method of the formal proof:* `|s₀|²` is `rd_E/√d` (1.4 (d)), and the Chowla–Selberg formula gives the area of the
conjugate lattice times `|σ(u_CS)|²`; their quotient, with `A_K²`, is `Ω^{−1}`. At a `p`-adic place, `|ι_p(s₀)|` is the
inverse of the absolute value of `α` at the place of `y ↦ ι_p(τ(ȳ))`, read off the valuation of `P'(ζ)` (1.4); `s₀`
generates the module spanned by the `ι_p(τ(ȳ))`, `y ∈ 𝔞₀^{−1}`.

Fix a nonzero `Ω₀ ∈ ℂ` and a CM lattice `𝓔` with lattice `Ω₀𝒪_K` (the *CM curve*), and a number `u_CS` of the
Chowla–Selberg formula for `𝓔`: `|ι_p(u_CS)| = 1` at every prime, and for every automorphism `σ` of `ℂ` over `K`, the
area of the conjugate lattice `σ(𝓔)` times `|σ(u_CS)|²` is `π·exp(γ − Re L′/L(1, χ_K))·2π/√d`. Put
`A_K := √(2π/√d)`, the *period factor* `𝔣_E := s₀/u_CS`, the *scale* `𝔱_E := 𝔣_E·A_K/Ω₀`, and
`Ω := exp(γ − Re L′/L(1, χ_K))·2π/rd_E` (`γ` Euler's constant).
(a) `|𝔱_E|² = Ω^{−1}`; more generally, if `σ(𝓔)` has area `|Ω′|²√d/2`, then `|σ(𝔣_E)·A_K/Ω′|² = Ω^{−1}`; `𝔱_E ≠ 0`.
(b) At every `p`-adic place and every `τ ∈ Φ`, `|ι_p(𝔣_E)|` is the inverse of the absolute value of `α` at the place of
`E` of the embedding `y ↦ ι_p(τ(ȳ))`; so `ι_p(𝔣_E·conj(τ(y)))` is integral for `y ∈ 𝔞₀`, and `|ι_p(𝔣_E)| = 1` if `p ∤ q₁`.
If `α^{−1}u` is integral above `p` for `u ∈ E^n`, the coefficients of `ι_p(𝔣_E)·u†z` are integral.
(c) For `x, y ∈ 𝔞₀`, `Σ_τ τ(x)·conj(τ(y))` is an integer of `K`, and `Tr_{E/K}(z) ∈ 𝒪_K` when `z·P'(ζ)` is integral.
(d) If two CM lattices have the same `a₁`, they have the same area.

*Needs:* 1.1, 1.4, 2.1, 4.1; ShortGRH background (the Chowla–Selberg formula for a CM lattice and its conjugates by the
automorphisms of `ℂ` over `K`).

[ShortProof], `New/Derivatives/Vacuum/TightFrames` (`New.Parameters.cmCurve`, `New.Parameters.cmPeriod`,
`New.Parameters.chowlaSelbergUnit`, `New.Parameters.areaScale`, `New.Parameters.periodFactor`,
`New.Parameters.jetScale`, `New.Parameters.sum_mul_conj_mem_quadInt`, `New.Parameters.exists_coe_eq_trace_of_isIntegral`,
`New.Parameters.norm_iota_periodFactor`, `New.Parameters.norm_periodFactor_mul_conj_le_one`,
`New.Parameters.norm_iota_periodFactor_eq_one`), `New/Derivatives/Vacuum/Scale` (`New.Parameters.norm_jetScale_sq`,
`New.Parameters.norm_periodFactor_mul_daggerForms_le_one`, `New.CMLattice.area_eq_of_a₁_eq`),
`New/Derivatives/Vacuum/IntegralVacuum` (`New.Parameters.norm_gal_periodFactor_div_mul_areaScale_sq`,
`New.Parameters.jetScale_ne_zero`)

### 4.3 Tight frames in `𝔞₀`

*Origin:* particular to this proof: tight frames in `𝔞₀` of lengths prime to `q₁`, of every large length with large
multiplicities, and of square length prime to a given prime, with a vector whose linear form `𝔣_E·y†z` has unit
coefficients at a given prime. The statements of this section use the parameters and the field only; the frames of
the data are in 4.3a.

*Method of the formal proof:* the powers of a primitive `q₁`-th root of unity are a tight frame of length `q₁` by
orthogonality of characters. With `e_i := β̄_K^j` times the basis of `E/K` dual to the powers of `ζ` under the trace
(`j` least with `2^j ≥ q₁`), the powers of `ζ^{−1}` and the orbits `ζ^k·g(e_i)` (`g ∈ Gal(E/K)`, `k < q₁`) form a
tight frame; replacing the pairs
`(ζ^{−i}, e_i)` by their sums adds `β_K^j + β̄_K^j` to the length, which makes it prime to `q₁`. Lengths `a·q₁ + b·h` with
`a, b` large come from a Frobenius-coin argument.

(a) For a primitive `q₁`-th root of unity `z ∈ E`, the `z^i`, `0 ≤ i < q₁`, each taken once, are a tight frame of length
`q₁`; each taken `k` times, one of length `kq₁`.
(b) There is a tight frame in `𝔞₀`, with multiplicities `1`, of a length `h` prime to `q₁`, equal to
`q₁(1 + Σ_i Σ_τ |τ(e_i)|²) + β_K^j + β̄_K^j`, that contains `ζ·e_{φ(q₁)−1}`. For every prime `p` and every `ι_p`, one of
`y = 1` and `y = ζ·e_{φ(q₁)−1}` has `|ι_p(𝔣_E·conj(τ(y)))| = 1` for all `τ ∈ Φ`.
(c) If `v` is a tight frame with multiplicities `1` of a length `h` prime to `q₁`, then for every `m ≥ q₁h + R(q₁ + h)`
the powers `ζ^i` and the members of `v` form a tight frame of length `m` with multiplicities all at least `R`.
(d) The frames of the data are stated in 4.3a; the letter (d) is kept for them, so that 4.3 (d) means 4.3a.
(e) For every prime `p` there are `b′` prime to `p` and a tight frame with multiplicities `1` of length `b′²`.

*Needs:* 1.1, 1.4, 4.1, 4.2.

[ShortProof], `New/Derivatives/Vacuum/TightFrames` (`New.Parameters.isTightFrame_pow`,
`New.Parameters.isTightFrame_zeta_pow`), `New/Derivatives/Vacuum/ShortVectors` (`New.Parameters.isTightFrame_orbit`,
`New.Parameters.dualResolutionFactor`, `New.Parameters.exists_isTightFrame_coprime`, `New.Parameters.HasUnitLinearForm`,
`New.Parameters.exists_hasUnitLinearForm`, `New.Parameters.exists_isTightFrame_of_coprime`),
`New/Derivatives/Vacuum/StandardDataProducts` (`New.Parameters.exists_coprime_isTightFrame_sq`)

### 4.3a Tight frames of the data

*Origin:* particular to this proof: on admissible data, the tight frame of 4.3 (b) has length at most the weight `b`,
and there is a tight frame of length `M` with multiplicities at least `6fb` that contains, for every prime, a vector
whose linear form has unit coefficients there. It is stated apart from 4.3 because the constant `C_P` of the data
(OneSidedPrimeSumBoundsAndAdmissibleData §3.1) is defined through the integral vacuum of 4.6, which uses 4.3 (a).

*Method of the formal proof:* sizes: the coefficients of the cyclotomic polynomial are at most `2^{q₀}` in absolute
value, `|β_K| ≤ d`, `j ≤ q₀ + 3s + 10`, and `|τ(P′(ζ))| ≥ 1` for data, so the length `h` of 4.3 (b) is at most `b` by
the size relations; then 4.3 (c) at the length `M`, which is large enough for the multiplicities `6fb` by the sizes
of the data.

For admissible data: the length `h` of 4.3 (b) satisfies `1 ≤ h ≤ b`; and there is a tight frame of length `M` with
multiplicities at least `6fb` containing, for every prime `p` and `ι_p`, a vector `y` with
`|ι_p(𝔣_E·conj(τ(y)))| = 1` for all `τ`.

*Needs:* 1.7, 4.3; OneSidedPrimeSumBoundsAndAdmissibleData §3.2 (the weight `b`, the level `M`), §3.3 (the size
relations of the data).

[ShortProof], `New/Derivatives/Vacuum/ShortVectors` (`New.Data.le_b_of_eq_dualResolutionFactor`,
`New.Data.exists_short_isTightFrame_coprime`, `New.Data.exists_isTightFrame`)

### 4.4 Jet series along lines

*Origin:* particular to this proof: the Taylor coefficients of the theta function of a vector of the finite part are
theta values of the vector tensored with polynomial Fock vectors, and a vector of the finite part is determined by its
jet series.

*Method of the formal proof:* on a line, `Θ_f(ct·v)` is an integral of `exp(t·L(w))` against a Gaussian density, and
differentiation under the integral gives its Taylor coefficients as the integrals of `L(w)^k`, which are theta values of
Fock vectors; a vector of the finite part whose theta function vanishes on every line through `0` vanishes, since it is
determined by its values at real vectors.

Let `V` have all signs `+1`, `f ∈ 𝒮_f(V)` and `c ∈ ℂ`.
(a) The coefficient of `z^k` in `J_c(f)` is `c^{|k|}/k!·θ_V(v_{z^k} ⊗ f)`, where `v_Q ⊗ f` integrates the real
Heisenberg action on `f` against the Fock vector of the polynomial `Q`; hence `jet_Q(J_c(f)) = c^l·θ_V(v_Q ⊗ f)` for `Q`
homogeneous of degree `l`, and `jet_Q(F(az)) = a^l·jet_Q(F)` for every series `F`.
(b) For every `v ∈ ℂ^{Φ×n}`, the Taylor series at `0` of `t ↦ Θ_f(ct·v)` is `J_c(f)` with `z = t·v` substituted.
(c) If `c ≠ 0` and `J_c(f) = 0`, then `f = 0`.
(d) `Θ_f(0) = θ_V(f)`; if `Θ_f(cz) = ∏_i G_i(L_i(z))` for entire functions `G_i` and linear forms `L_i`, then `θ_V(f)` is
`∏_i G_i(0)` and `J_c(f)` is the product of the Taylor series of the `G_i` at the forms `L_i`.

*Needs:* 4.1; ShortGRH background (the Fock model of the real Heisenberg group and the integrated action `v ⊗ f`; the
integral formula for `Θ_f`).

[ShortProof], `New/Derivatives/Vacuum/TightFrames` (`New.Space.iteratedDeriv_integral_exp_mul_realVac`,
`New.Space.taylor_line_eq_subst_jetSeries`, `New.Space.eq_zero_of_jetSeries_eq_zero`, `New.mvPowerSeries_eq_of_forall_line`,
`New.Space.entireTheta_zero`, `New.Space.jetSeries_eq_prod_of_entireTheta_smul`), `New/Derivatives/Vacuum/Scale`
(`New.jet_rescale`, `New.Space.jet_jetSeries_of_isHomogeneous`)

### 4.5 Products of sections along a tight frame

*Origin:* particular to this proof: a product of monomial sections of a CM lattice, pulled back along the linear forms of
a tight frame at the scale `a/δ̄`, is the theta function of a vector of the finite part with integral values, and the
theta values and jet series of its rational translates are products of translated sections.

*Method of the formal proof:* the forms of the frame at that scale pull the hermitian forms of the sections back to the
standard form, because the frame is tight and the area of the lattice fixes the scale; the product is then fixed by the
signed translations by `δ̄𝔞₀^n`, since the forms take these to periods, and Fourier inversion gives the vector. A value of
the vector is the theta value of a rational translate, a product of values of translated sections at torsion points,
which are integral.

Let `V` be standard of rank `n`, `δ ∈ 𝒪_K` with `δδ̄ = N ≠ 0`, `w` a tight frame of length `M` with multiplicities `m`,
`C` a CM lattice, `a ∈ Λ`, area of `ℂ/Λ` equal to `|a|²·M·√d/(2N)`, and for each `(i, k)` (frame index, coordinate) a
monomial section `θ^{r}(σ²)^{t′}G^{u}` of `C` of degree `r + 2t′ + 3u = m_i`, where `G = σ(σ′θ − σ(θ′ + a₁θ/2))` (equal to
`yθ³` off the poles). Put `b := a/δ̄`, `L_{(i,k)}(z) := (b/A_K)·Σ_τ conj(τ(w_i))·z_{τ,k}` and, for `γ ∈ E^n`,
`ℓ_{(i,k)}(γ) := −b·Σ_τ τ(γ_k)·conj(τ(w_i))`. There is `F ∈ 𝒮_f(V)` such that:
(a) for every `γ ∈ E^n`, `Θ_{ϱ(finVec(α^{−1}γ))F}(z) = ∏_{(i,k)} T^{m_i}_{ℓ_{(i,k)}(γ)}(section_{(i,k)})(L_{(i,k)}(z))`;
hence `θ_V(ϱ(finVec(α^{−1}γ))F) = ∏ T^{m_i}_{ℓ(γ)}(section)(0)` and `J_c(ϱ(finVec(α^{−1}γ))F)` is the product of the
Taylor series of the translated sections at the forms `c·L_{(i,k)}`;
(b) `ι_p(F(finVec(x)))` is integral for every prime `p`, every `ι_p` and every `x ∈ 𝔸_{E,f}^n`;
(c) `Θ_F` is a theta function for `δ̄·𝔞₀^n`.

*Needs:* 4.1, 4.2, 4.4; ShortGRH background (sections of a CM lattice: the monomial sections, their transformation under
twisted translation by periods, and the integrality of their values at torsion points); ShortGRH background (Fourier
inversion: an entire function fixed by the signed translations by `δ̄𝔞₀^n` is `Θ_F` for some `F` of the finite part).

[ShortProof], `New/Derivatives/Vacuum/TightFrames` (`New.Parameters.resolutionLinearForm`,
`New.Parameters.IsResolutionProduct`, `New.Parameters.IsResolutionProduct.theta_translate`,
`New.Parameters.IsResolutionProduct.jetSeries_translate`, `New.Parameters.IsResolutionProduct.norm_iota_apply_le_one`,
`New.Parameters.sum_pullForm_resolutionLinearForm_apply`, `New.Parameters.normalizedShift_prod_comp_of_mem_lattice`,
`New.Parameters.exists_isResolutionProduct_of_isTightFrame`)

### 4.6 The integral vacuum

*Origin:* particular to this proof: a nonzero multiple `c_vac·vac` of the vacuum of rank one whose values at the
finite points are integral at every prime and have conjugates over `K` at most `exp(C·q₁²)`, with `C` independent of the
level; the integral vacuum `θ° = c_vac^n·vac_V` in rank `n`.

*Method of the formal proof:* the theta product `F` of 4.5 along the frame of the powers of `ζ` (each taken `q₁` times,
with the vectors `ζ^k/q₁`) has theta values that are products of `q₁²` torsion values of `θ` of the CM curve, whose
conjugates are bounded independently of the level; Fourier inversion writes a multiple of the vacuum as a sum of
`(q₁²)^{fn}` translates of `F` times roots of unity, whence integrality (from that of `F`) and the bound. The mean of
`|f|²` is controlled by the values at the points with rational archimedean part, which translation by a rational vector
moves to points with archimedean part `0`.

(o) *Inputs.* There is `M₀` with `|σ(T^1_{xΩ₀}θ(0))| ≤ M₀` for every automorphism `σ` of `ℂ` over `K` and every
`x ∈ K` (`θ` of the CM curve `𝓔`). For standard `V` of rank `n`, `δ ∈ E` integral at every finite place with
`δδ̄ = N ≠ 0`, and `F ∈ 𝒮(V)` with `θ_V(F) = 1` whose theta function is a theta function for `δ̄𝔞₀^n`, a nonzero
multiple of `vac_V` is a sum of `N^{f·n}` vectors `ϱ_f(a_j)ϱ(finVec(b))F`, with one `b` and points `a_j ∈ 𝔸_{E,f}^n`.
(a) *Theta products.* Let `V` be standard of rank `n`, `C` a CM lattice of area `|Ω′|²√d/2` with `Ω′e ∈ Λ` for some
integer `e ≥ 1`. For `γ ∈ E^n`, `k < q₁` and a coordinate `j`, let `x_k(γ_j) := −Tr_{E/K}(γ_j·ζ̄^k)/q₁ ∈ K`. There is
`F ∈ 𝒮_f(V)` with `θ_V(ϱ(finVec(α^{−1}γ))F) = ∏_{k<q₁} ∏_j (T^1_{x_k(γ_j)Ω′}θ)(0)^{q₁}` for all `γ`, whose jet series
at rational translates are the corresponding products of Taylor series along the forms
`(Ω′/(q₁A_K))·c·Σ_τ conj(τ(ζ^k))·z_{τ,j}`, whose values at finite points are integral at every prime, and whose theta
function is a theta function for `q₁e·𝔞₀^n`; then `θ_V(F) = 1`, and for `e = 1` a nonzero multiple of `vac_V` is a
sum of `(q₁²)^{f·n}` vectors `ϱ_f(a_j)ϱ(finVec(b))F`, with one `b` and points `a_j ∈ 𝔸_{E,f}^n`.
(b) *The vacuum scale.* There is a constant `C` such that for every level there is `c_vac ≠ 0` with
`ι_p(c_vac·vac₁(finVec(x)))` integral for every prime `p`, every `ι_p` and every `x ∈ 𝔸_{E,f}`, and
`|σ(c_vac·vac₁(finVec(x)))| ≤ exp(C·q₁²)` for every automorphism `σ` of `ℂ` over `K` (`vac₁` the vacuum of the
standard space of rank one). Fix such `c_vac`.
(c) *The integral vacuum.* For standard `V` of rank `n` put `θ° := c_vac^n·vac_V`. Then
`θ°(finVec(x)) = ∏_i c_vac·vac₁(finVec(x_i))`; these values are integral at every prime; their conjugates under every
automorphism of `ℂ` are at most `exp(C·q₁²)^n`; and `θ°(finVec(x)) ≠ 0` for some `x`.
(d) If `|f(finVec(x))| ≤ M` for all `x ∈ 𝔸_{E,f}^n`, then `|⟨f, f⟩| ≤ M²`. Every automorphism of `ℂ` has the absolute
values of some automorphism over `K`.

*Needs:* 1.4, 2.1, 4.1, 4.2, 4.3 (a), 4.5; ShortGRH background (a bound, depending only on `d`, for the values at `0` of
the twisted translates `T^1_uθ` over all CM lattices for `d`); ShortGRH background (complex multiplication for theta
functions, as in 4.7); ShortGRH background (Fourier inversion: for `F` whose theta function is a theta function for
`δ̄𝔞₀^n`, `N^{f·n}·F` is a combination of translates of the vacuum whose coefficients `c_j` make each `c_j·vac_V` a sum of
`N^{f·n}` translates of `F`).

[ShortProof], `New/Derivatives/Vacuum/IntegralVacuum` (`New.Parameters.exists_norm_gal_torsion_value_le`,
`New.Parameters.exists_smul_vac_eq_sum`, `New.Parameters.IsThetaProduct`,
`New.Parameters.exists_isThetaProduct`, `New.Parameters.IsThetaProduct.theta_eq_one`,
`New.Parameters.IsThetaProduct.exists_smul_vacElem_eq_sum`, `New.Parameters.exists_mul_vacElem_integral_bounded`,
`New.Parameters.vacuumScale`, `New.Parameters.isVacuumScale_vacuumScale`, `New.Parameters.intVacuum`,
`New.Parameters.intVacuum_finVec_eq_prod`, `New.Parameters.norm_intVacuum_le_one`, `New.Parameters.norm_gal_intVacuum_le`,
`New.Parameters.exists_algEquiv_norm_eq`, `New.Parameters.norm_ringEquiv_intVacuum_le`,
`New.Parameters.norm_dataInner_self_le`, `New.Parameters.exists_intVacuum_ne_zero`)

### 4.7 Conjugates of the jets of translates

*Origin:* particular to this proof: for every standard space one vector of the finite part whose translates span it,
and for each automorphism `σ` of `ℂ` over `K` a finite adele `B_σ`, a vector `F′` and a scale `t` with `|t|² = Ω^{−1}`,
such that `σ` maps the jets of the translates of `F` at the scale `𝔱_E` to those of the translates of `F′` by `B_σx` at
the scale `t`.

*Method of the formal proof:* `F` and `F′` are the theta products of 4.6 (a) for `𝓔` and for its conjugate lattice;
complex multiplication carries the Taylor series of `T^1_{xΩ₀}θ` to those of the conjugate curve translated by `x′Ω′`
for `x′` near `β_σx`, and the jets of translates are locally constant in the adelic point, so it suffices to compare at
rational points, factor by factor; the linear forms correspond up to the permutation of the places induced by `σ`.

There is a map `σ ↦ B_σ ∈ 𝔸_{E,f}` on the automorphisms of `ℂ` over `K` such that for every standard `V` there is
`F ∈ 𝒮_f(V)` with `θ_V(F) = 1` and `𝒮_f(V)` contained in the span of the `ϱ(finVec(x))F`, and for each `σ` there are
`t ∈ ℂ` with `|t|² = Ω^{−1}` and `F′ ∈ 𝒮_f(V)` such that, for every `x ∈ 𝔸_{E,f}^n`, applying `σ` to the coefficients of
`J_{𝔱_E}(ϱ(finVec(x))F)` gives `J_t(ϱ(finVec(B_σx))F′)` with each variable `z_{τ,i}` renamed `z_{σ^{−1}τ,i}`, where
`σ` permutes `Φ` through `τ ↦ σ∘τ`.

*Needs:* 4.1, 4.2, 4.4, 4.6; ShortGRH background (complex multiplication for theta functions: the action of the
automorphisms of `ℂ` over `K` on the Taylor series of torsion translates of `θ` of the CM curve).

[ShortProof], `New/Derivatives/Vacuum/IntegralVacuum` (`New.Parameters.finitePart_le_span_translates`,
`New.Parameters.map_zetaLinearSeries`, `New.Parameters.exists_rational_translate_eq`,
`New.Parameters.IsThetaProduct.isJetConjugate_of_map_taylorAtZero_eq`, `New.Parameters.exists_isJetConjugate_translates`),
`New/Derivatives/Field/PrimeDecomposition` (`New.Parameters.placePerm`, `New.Parameters.apply_Phi_eq_Phi_placePerm`)

### 4.8 Standard data and their stability

*Origin:* definitions and conventions, with the stability of standard data under the Heisenberg and Weil operators of
points integral above `p` (particular to this proof).

*Method of the formal proof:* the translates compose; the Weil operator `ω(1, g)` takes the translate of `θ°` by `x` to
`(finite multiplier)^{−1}` times the translate by `gx` of the sum of the translates of `θ°` by `gy`, `y` over integral
vectors modulo those that `g` keeps integral, and these points stay in the module.

Let `V` be a hermitian space of rank `n` over `E = K(ζ)`, `p` a prime, `ι_p` fixed, and `δ ∈ 𝒪_K`. A finite adelic
vector `x` is *`δ`-integral above `p`* if every coordinate of `δx` is integral at the places above `p`. The *standard
data of level `δ` at `p`*, `𝒟_p(V, δ)`, is the span, over the `p`-integral complex numbers, of the `ϱ_f(x)θ°` with `x`
`δ`-integral above `p`.
(a) Every `x ∈ Ô^n` is `δ`-integral above `p`. `𝒟_p(V, δ)` is stable under multiplication by `p`-integral numbers and
under `ϱ_f(x)` for every `x` that is `δ`-integral above `p`.
(b) For a finite adelic unitary point `g` of `V` whose components at the places above `p` are integral invertible
matrices, `ω(1, g)` maps `𝒟_p(V, δ)` into itself.

*Needs:* 4.1, 4.6.

[ShortProof], `New/Derivatives/Vacuum/IntegralVacuum` (`New.Parameters.integralAfter`, `New.Parameters.standardData`),
`New/Derivatives/Vacuum/JetIntegrality` (`New.Parameters.integralAfter.stdLattice_le`,
`New.Parameters.smul_mem_standardData_of_norm_le_one`, `New.Parameters.finHeisenbergOp_mem_standardData`,
`New.Parameters.mulVec_mem_integralAfter`, `New.Parameters.omega_finHeisenbergOp_intVacuum`,
`New.Parameters.omega_mem_standardData`)

### 4.9 Standard data as products of theta functions of the curve

*Origin:* particular to this proof: the Taylor series of the theta function of standard data of level `δ`, at the scale
`δ̄·A_K/Ω₀`, is the `N`-th power (`N = δδ̄`) of a product of copies of `θ` along a resolution of the identity by vectors
`u` with `α^{−1}u` integral above `p`, times an integral series in the `y(u†z)`.

*Method of the formal proof:* in three steps. Fourier inversion writes `θ°` as a `p`-integral combination of translates,
by points `y_j` with `b′y_j` integral, of the theta product `F` of 4.5 along a tight frame of length `b′²`, `b′` prime to
`p` (4.3 (e)). A translate of `F` by a rational vector is a product of translates of `θ` by `δ`-division points along the
frame. On one curve, a product of translates `T^1_{y_i}θ` with `δy_i ∈ Λ`, taken at `δ̄·μ_iz`, is `∏θ(μ_iz)^N` times an
integral series in the `y(μ_iz)` (the isogeny `δ̄`).

(a) If `w` is a tight frame with multiplicities `1` of length `b′²`, `b′ ≠ 0`, and `k ≠ 0`, the vectors `w_i/(b′k)`
placed in each coordinate of `E^n`, with multiplicities `k²`, are a resolution of the identity on `E^n`.
(b) Let `C` be a CM lattice, `δ ∈ 𝒪_K` nonzero of norm `N`, `μ_i` linear forms over `ℂ_p`, and `y_i ∈ ℂ` with
`δy_i ∈ Λ`. Then `∏_i (T^1_{y_i}θ)(ι_p(δ̄)·μ_iz) = ∏_iθ(μ_iz)^N·H` for some `H ∈ 𝒪[[y(μz)]]`.
(c) For standard `V` and every prime `p` there are `b′` prime to `p`, a tight frame `w` with multiplicities `1` of length
`b′²`, `F ∈ 𝒮_f(V)`, points `y_j` with `b′y_j ∈ Ô^n`, and `p`-integral numbers `a_j` with `θ° = Σ_j a_j·ϱ(finVec(y_j))F`,
such that for `γ ∈ E^n` and `c ∈ ℂ`, `J_{cA_K/Ω₀}(ϱ(finVec(α^{−1}γ))F)` is the product over `(i, k)` of the Taylor series
of `T^1_{ℓ}θ`, `ℓ = −(Ω₀/b′)·Σ_τ τ(γ_k)conj(τ(w_i))`, at the form `c·u_{(i,k)}†z`, with `u_{(i,k)} = w_i/b′` in the
coordinate `k`.
(d) Let `V` be standard, `δ ∈ 𝒪_K` nonzero with `δδ̄ = N`, and `f ∈ 𝒟_p(V, δ)`. There is a resolution of the identity
`(u_j, m_j)` of `E^n` with `α^{−1}u_j` integral above `p` for all `j`, and `H ∈ 𝒪[[y(u†z)]]` for the CM curve `𝓔`, with
`ι_p J_{δ̄A_K/Ω₀}(f) = (∏_jθ(u_j†z)^{m_j})^N·H`.

*Needs:* 2.5, 4.1, 4.3, 4.5, 4.6, 4.8; ShortGRH background (sections of a CM lattice: for `δ ∈ 𝒪_K` of norm `N` and `δy ∈ Λ`,
`(T^1_yθ)(δ̄z) = θ(z)^N·u(z)` with `u ∈ 𝒪[[y]]`); ShortGRH background (Fourier inversion, as in 4.6).

[ShortProof], `New/Derivatives/Vacuum/StandardDataProducts` (`New.IsTightFrame.isResolution`,
`New.Parameters.isResolution_resolutionVectors_zeta_pow`, `New.CMLattice.exists_prod_twistedTranslate_eq_thetaProd_mul`,
`New.Parameters.IsVacuumExpansion`, `New.Parameters.exists_intVacuum_eq_sum_of_isThetaFunction`,
`New.Parameters.exists_isVacuumExpansion`, `New.Parameters.thetaMultiples`,
`New.Parameters.mem_thetaMultiples_of_jetSeries_eq_prod`, `New.Parameters.exists_jetSeries_map_eq_thetaProd_pow_mul`)

### 4.10 Integrality of the jets of standard data at every prime

*Origin:* particular to this proof: at every prime, the jets of the theta functions of standard data of level `δ` at
the scale `δ̄·d·𝔱_E` are integral, and at the scale `c·𝔱_E` they have valuation at least `l·v(c/(δ̄d))` along
homogeneous integral polynomials of degree `l`.

*Method of the formal proof:* by 4.9 (d) the series is a power of a product of copies of `θ` times an integral series in
the `y`; the scale `d·𝔣_E` turns the forms `u†z` into `d` times integral forms (4.2 (b)). A ring of series that is stable
under the partial derivatives and has integral constant terms has integral jets; the ring generated by the integral
series in the `y(μ_iz)`, the `θ(μ_iz)` and the `(−log θ)′(μ_iz)` is such a ring when `μ_i = d·ν_i` with `ν_i` integral.

(a) Let `C` be a CM lattice. Then `d·g″ ∈ 𝒪[[y]]`, `g = −log θ`. Let `ν_i` be linear forms with integral
coefficients, `μ_i := d·ν_i`, `m`, `N` natural numbers, `H ∈ 𝒪[[y(μz)]]`, and `Q` a polynomial with integral
coefficients. Then `jet_Q((∏_iθ(μ_iz)^{m_i})^N·H)` is integral.
(b) Let `V` be standard, `δ ∈ 𝒪_K` nonzero, `f ∈ 𝒟_p(V, δ)`, and `Q` a polynomial in the variables `z_{τ,i}` with
`p`-integral coefficients. Then `ι_p(jet_Q(J_{δ̄·d·𝔱_E}(f)))` is integral.
(c) Under (b), for `c ∈ ℂ` and `Q` homogeneous of degree `l`:
`v(ι_p(jet_Q(J_{c·𝔱_E}(f)))) ≥ l·v(ι_p(c/(δ̄·d)))`.

*Needs:* 2.5, 4.2, 4.4 (a), 4.8, 4.9; ShortGRH background (CM lattices: `g″ = g″(0) + x` with `x ∈ 𝒪[[y]]` and
`√−d·g″(0)` integral; `√−d` maps `Λ` into itself, so it is integral; `y′ ∈ 𝒪[[y]]`).

[ShortProof], `New/Derivatives/Vacuum/JetIntegrality` (`New.norm_jet_le_one_of_pderiv_mem`,
`New.CMLattice.smul_derivative_derivative_negLogTheta_mem`, `New.CMLattice.jetRing`,
`New.CMLattice.pderiv_mem_jetRing`, `New.CMLattice.norm_jet_thetaProd_pow_mul_le_one`),
`New/Derivatives/Vacuum/Divisibility` (`New.Parameters.norm_jet_jetSeries_le_one`, `New.Parameters.norm_jet_jetSeries_le_pow`)

### 4.11 Divisibility of standard data at a prime that does not split in `K`

*Origin:* particular to this proof: at a prime that does not split in `K`, the Taylor series of standard data of level
one has the normal form of 2.4, so its jets along products of minors and along the entries of Schur matrices have the
predicted divisibility `D_p(κ)` of Layer 3.

*Method of the formal proof:* such a prime does not divide `q₁`, so `α^{−1}u` integral above `p` makes `u` integral above
`p` (as `q₁α` is integral), `𝔣_E` is a unit at `p` (4.2 (b)), and 4.9 (d) with `δ = 1` and 2.6 (d) give the normal form at
the scale `A_K/Ω₀`; scaling by the `p`-integral number `c·𝔣_E` keeps it (2.4 (a)). Then 3.3 and 3.4 apply.

Let `p` be a prime that does not split in `K`, `V` standard, `f ∈ 𝒟_p(V, 1)`, `c` a `p`-integral complex number, and
`F := ι_p J_{c·𝔱_E}(f)`.
(a) If `α^{−1}y` is integral above `p` for `y ∈ E^n` and `p ∤ q₁`, then `y` is integral above `p`.
(b) There are `ϖ ∈ ℂ_p` with `v(ϖ) = ρ_p` and integral `λ_{ej}` such that `F` has the normal form `(I_p°, −p^e·, ϖ, λ)`
in the variables `z_{τ,i}`.
(c) Let `V = Hom(E^n, E^{n′})` with its standard form, so that the variables are the entries `z_{τ,r,a}` of matrices
`z_τ` of size `n′ × n`, `N = |n′|`. For every diagram `κ`, standard filling `i′` and integral `y_τ`:
`v(jet_{P_y}(F)) ≥ D_p(κ) − f·N³·(1 + log_p max(B, 1))`.
(d) In (c), let `κ` have no column of height strictly between `|n|` and `|n′|`, and let `w` be charges for `ev ⊂ Φ` at
every `e ∈ I_p°`. Then for all chosen standard fillings `i′`, `i`:
`v(J_κ(F)_{i′,i}) + W(i′) ≥ D_p(κ^{ev}) + γ_p·(B − B^{ev}) − f·N³·(1 + log_p max(B, 1))`.

*Needs:* 1.1, 1.4, 2.4, 2.6, 3.3, 3.4, 4.2, 4.9.

[ShortProof], `New/Derivatives/Vacuum/Divisibility` (`New.Parameters.isIntegralAbove_of_finiteImage_mem`,
`New.Parameters.exists_hasNormalForm_jetSeries`, `New.Parameters.norm_jet_minorProd_jetSeries_le`,
`New.Parameters.norm_schurJet_jetSeries_le_of_charges`)

## Layer 5: The bound is attained

The lower bound of Layer 4 is attained at every prime, for the degrees near the weights, up to one number with small
conjugates. The objects are products of `n` copies of `HΘ`, `Θ` the product of copies of `θ` along the forms of a tight
frame of length `M` and `H` an integral series in the `y`: the least valuation `val_n(ν)` of a coefficient of degree
`ν` among them (5.1). On one curve no divisibility better than the rate `γ_p` holds, and six scaled copies of `Θ` multiply
to a unit, so `val₆` is at most `γ_p|ν| − v(ν!)` (5.2). Along a family of couplings, where the exponential factor of the
normal form contributes one negative power of `π_p` per coupling, `val₆` is smaller by the number of couplings (5.3).
5.4 controls the couplings between `b`-places, and 5.5 combines these on twelve copies into the bound
`v(l!) + val₁₂(l) ≤ S_p + 2Σ_τ v(B_τ)` for every prime. 5.6 lifts the twelve copies to a vector of the Weil model on
`12 × 1` matrices and expands it in indicator data.

### 5.1 Least valuations of products of copies

*Origin:* definitions and conventions, with the rules that the least valuations obey.

*Method of the formal proof:* the coefficient of a product is a product of coefficients; an integral substitution
`z_c = Σ_k A_{ck}z′_k` writes a coefficient as an integral combination of coefficients of copies, and the ultrametric
inequality selects one; an integral series in the `y` can be replaced by one monomial in the `y(μ_jz)` of degree at most
`|ν|` without losing size, by the same selection.

Let `C` be a CM lattice, `p` a prime, `μ_j` (`j ∈ J`) linear forms over `ℂ_p` in variables indexed by a finite set `X`,
`m_j ∈ ℕ`, and `Θ := ∏_jθ(μ_jz)^{m_j}`. For `n ≥ 0`, `ν ∈ ℕ^X` and `r ∈ ℝ`, say `val_n(ν) ≤ r` if there are
`H_1, …, H_n ∈ 𝒪[[y(μz)]]` and `α_1, …, α_n ∈ ℕ^X` with `Σ_cα_c = ν` and `Σ_c v(coeff_{α_c}(H_cΘ)) ≤ r`.
(a) `val_n(ν) ≤ r` and `r ≤ r′` give `val_n(ν) ≤ r′`; `val_n(0) ≤ 0`; `val_n(ν) ≤ r` and `val_{n′}(ν′) ≤ r′` give
`val_{n+n′}(ν + ν′) ≤ r + r′`.
(b) If, for integral `A_{ck}` and `H_c ∈ 𝒪[[y(μz)]]`, the coefficient of `z′^γ` in `∏_c (H_cΘ)(Σ_k A_{ck}z′_k)` has
valuation at most `r`, then `val_n(ν) ≤ r` for the degree `ν` obtained by adding the copies of each variable in `γ`; if,
for integral `δ_c`, the coefficient of `z^ν` in `∏_c (H_cΘ)(δ_cz)` has valuation at most `r`, then `val_n(ν) ≤ r`.
(c) If `val_n(ν) ≤ r`, the `H_c` can be taken to be monomials `∏_j y(μ_jz)^{e_{cj}}` with `Σ_j e_{cj} ≤ |ν|`.

*Needs:* 2.1, 2.5.

[ShortProof], `New/Derivatives/Sharpness/LeastValuation` (`New.IsLowestTerm`, `New.copySubst`,
`New.CMLattice.LeastValLE`, `New.CMLattice.LeastValLE.mono`, `New.CMLattice.leastValLE_zero`, `New.CMLattice.LeastValLE.add`,
`New.CMLattice.leastValLE_of_copySubst`, `New.CMLattice.leastValLE_of_rescale`, `New.CMLattice.LeastValLE.exists_monomial`),
`New/Derivatives/Sharpness/OneCurve` (`New.exists_monomial_max_norm_coeff`)

### 5.2 One curve: the rate `γ_p` is attained

*Origin:* particular to this proof: on one CM curve, for every `n` some series of `𝒪[[y]]` has `n`-th derivative at `0`
of valuation at most `n·γ_p` (no divisibility better than the rate `γ_p` holds for all integral series in `y`), and its
consequences for `val₆`.

*Method of the formal proof:* the least valuation of `g^{(n)}(0)` over `g ∈ 𝒪[[y]]` is attained by a power of `y`, is
superadditive in `n` (the integrality of the group law: `y(z₀ + z₁)^j` is an integral series in `y(z₀)` and `y(z₁)`),
and is at most `(q_p^j − 1)·γ_p` at `n = q_p^j`, because the coefficient of `z^{q_p^j}` in the formal parameter has
valuation `−(q_p^j − 1)ρ_p` (after the scaling of 2.3 it is `≡ 1` modulo `π_p`); a lemma on submultiplicative sequences
carries the bound to every `n`. For `val₆`: `∏_cθ(δ_cz)` lies in `𝒪[[y]]` when
`Σ_cδ_c² = 0` in `ℤ_p`, and `−1` is a sum of four squares in `ℤ_p`, which gives six scales with `δ_0 = 1` whose product
is a unit; the form with unit coefficients then carries the one-variable series to the degree `ν`.

Let `C` be a CM lattice and `p` a prime.
(a) For every `n` there is `g ∈ 𝒪[[y]]` with `v(n!·coeff_n(g)) ≤ n·γ_p`.
(b) If `δ_1, …, δ_k ∈ ℤ_p` satisfy `Σδ_c² = 0`, then `∏_cθ(δ_cz) ∈ 𝒪[[y]]`. Every element of `ℤ_p` is a sum of four
squares in `ℤ_p`. For linear forms `μ_j` and `Θ = ∏θ(μ_jz)^{m_j}` there are `δ_0 = 1, δ_1, …, δ_5 ∈ ℤ_p` such that
`∏_{c<6} Θ(δ_cz)` has constant term `1` and is a unit of `𝒪[[y(μz)]]`.
(c) If one of the forms, `μ_{j₀}`, has unit coefficients, then `val₆(ν) ≤ γ_p·|ν| − Σ_x v(ν_x!)` for every `ν`.
(d) If integral combinations of the forms give the coordinates up to a unit, that is `Σ_j a_{xj}μ_j(z) = s·z_x` with
`a_{xj} ∈ 𝒪` and `|s| = 1`, then `val₆(ν) ≤ 0` for every `ν`.

*Needs:* 2.1, 5.1; ShortGRH background (the formal group of a CM lattice: the group law is integral in `T`, and
`T(ϖz)/ϖ ≡ Σ_j z^{q_p^j} (mod π_p)`, as in 2.3).

[ShortProof], `New/Derivatives/Sharpness/OneCurve` (`New.pow_le_of_submultiplicative`, `New.CMLattice.maxDerivNorm`,
`New.CMLattice.maxDerivNorm_add_le`, `New.CMLattice.pow_le_maxDerivNorm_of_eq_primeNorm_pow`,
`New.CMLattice.katz_divisibility_limit`), `New/Derivatives/Sharpness/LeastValuation` (`New.padicInt_sum_four_squares`,
`New.CMLattice.prod_rescale_theta_mem`, `New.CMLattice.scaledThetaProd`, `New.CMLattice.exists_scaledThetaProd_mem_mul_eq_one`,
`New.CMLattice.leastValLE_of_unit_coefficients`, `New.CMLattice.leastValLE_zero_of_span`)

### 5.3 Least valuations along couplings

*Origin:* particular to this proof: at an inert prime, for a family of couplings `z_τ^{p^{e_τ}}z_{τ⁺}` each used `j_τ`
times, a coefficient of the corresponding degree in six copies has valuation at most `−Σj_τ`, and at most
`γ_p|ν| − Σj_τ − v(ν′!ν″!)`.

*Method of the formal proof:* the variable raised to the power `p^e` is separated from the one that occurs linearly by
the substitution `z_0 = δ_0z′ + z″`, `z_c = δ_cz′` (`c ≠ 0`), with the six scales of 5.2 (b); in
`F = W·exp(κΞ)` (`v(κ) < 0`) the term in which every derivative in `z″` brings down one factor `κ` dominates, because
each coupling of the family has strictly the lowest exponent among those with the same partner; this gives the
coefficient of `z′^{ν′}z″^{ν″}` exactly. Then `ϖ` is scaled back, using `ρ_p(p + 1) = 1/(p − 1)` and
`v(ν′!) ≤ |ν′|/(p − 1)`.

Let `pr` be a partner rule on a finite set `Φ`, `Φ₀ ⊂ Φ`, and `e : Φ₀ → ℕ`. `(Φ₀, e)` is a *family of couplings* if
every `e_τ` is odd and, for `τ, τ₁ ∈ Φ₀` and odd `e′ ≤ e_τ`, `pr_{e′}τ₁ = pr_{e_τ}τ` only for `τ₁ = τ`, `e′ = e_τ`. For
`j : Φ → ℕ` put `ν′ := Σ_{τ∈Φ₀} p^{e_τ}j_τ·[τ]` and `ν″ := Σ_{τ∈Φ₀} j_τ·[pr_{e_τ}τ]` (degrees in variables `z_τ`), and
`ν := ν′ + ν″`, `|j| := Σ_{τ∈Φ₀} j_τ`.
(a) Let `F = W·exp(κΞ_λ)` with `W` an integral unit, `Ξ_λ` the coupling series of 2.4 for `S` the odd numbers, `λ_{a0}`
units for odd `a`, `v(κ) < 0`, and let `δ_0 = 1, δ_1, …, δ_n` with `∏_cF(δ_cz) = U` integral of constant term `1`. Then
the coefficient of `z′^{ν′}z″^{ν″}` in `F(δ_0z′ + z″)·∏_{c≠0}F(δ_cz′)` has valuation exactly `|j|·v(κ) − v(ν″!)`.
(b) Let `p > 2` be inert in `K`, `C` a CM lattice, `μ_i` integral forms in the variables `z_τ` and `Θ := ∏θ(μ_iz)^{m_i}`
with the normal form `(I_p°, pr, ϖ, λ)`, `v(ϖ) = ρ_p`, `λ_{a0}` units for odd `a`. For a family of couplings and every
`j`: `val₆(ν) ≤ −|j|` and `v(ν′!) + v(ν″!) + val₆(ν) ≤ γ_p·|ν| − |j|`.

*Needs:* 2.1, 2.4, 5.1, 5.2.

[ShortProof], `New/Derivatives/Sharpness/Couplings` (`New.IsCouplingFamily`, `New.powerDegree`, `New.partnerDegree`,
`New.pairExponent`, `New.couplingSubst`, `New.IsCouplingFamily.norm_coeff_pairExponent`,
`New.CMLattice.leastValLE_partnerDegree_of_isCouplingFamily`, `New.CMLattice.leastValLE_six_of_isCouplingFamily`)

### 5.4 Near pairs of `b`-places and the losses

*Origin:* particular to this proof: at a prime `p ≤ k` that does not split in `K`, the `b`-places are sparse along the
powers of `−p`, so the near pairs (a `b`-place whose partner for a small exponent is a `b`-place) are disjoint, and every
other term of the prime sum at a place is covered by the valuation of a product of `n♯ = ⌈6b/k⌉` consecutive integers.

*Method of the formal proof:* sparseness of the `b`-places (OneSidedPrimeSumBoundsAndAdmissibleData §3.2), read in the
classes modulo the part of `q₁` prime to `p`; for `p = d` a place and its partner have different classes modulo `q₀`, while
all `b`-places have the same. The losses: `γ_p·Σκ(τ) − S_p = v(π_p)·Σ_τR_τ` with `R_τ = Σ_e min(κ(τ)/p^e, κ(−p^eτ))`, and
off the near pairs each term of `R_τ` is at most the weight `a/x₁` off the `b`-places or a geometric tail; Legendre's
formula bounds `v(n♯!)` and `v(l!)` by `v(B_τ(l))`.

For admissible data, a prime `p`, a place `τ` and `e ≥ 1`, `(τ, e)` is a *near pair* if `e ∈ I_p`, `2e < l₀`, and `τ`
and `−p^eτ` are `b`-places. Put `n♯ := ⌈6b/k⌉`, `B_τ(l) := (l⁻ + 1)(l⁻ + 2)⋯(l⁻ + n♯)` with `l⁻ := (l − n♯)₊`, and
`R_τ := Σ_{e∈I_p} min(κ(τ)/p^e, κ(−p^eτ))`.
(a) If `p ≤ k` does not split in `K` and `0 < i < j < l₀`, then `σ`, `(−p)^iσ`, `(−p)^jσ` are not all `b`-places.
Near pairs occur only for `p` inert, with odd exponent; for `p ≤ k` not split, two near pairs with the same start have the
same exponent, two with the same end are equal, and the end of a near pair is not the start of one.
(b) `v_p(n♯!) ≤ v_p(B_τ(l))` and `v_p(l!) ≤ v_p((l − n♯)₊!) + v_p(B_τ(l))`; `x^{42} ≤ n♯`.
(c) `γ_p·Σ_τκ(τ) − S_p = v(π_p)·Σ_τR_τ`.
(d) If `c ≥ 0` and `e₀` are such that every near pair `(τ, e′)` has `e′ = e₀` and `κ(τ)/p^{e′} ≤ c + 1`, then
`R_τ ≤ c + 1 + l₀·(a/x₁) + 2b/(kp)`. If `p ≤ k`, then for every `l`,
`3(log b + 2) + x^{42} + 1 + l₀·(a/x₁) + 2b/(kp) ≤ v_p(B_τ(l))`; and for `p ≥ 3` and `l = ν′ + ν″ + η` with
`l ≤ 2b`, `v_p(l!) ≤ v_p(ν′!) + v_p(ν″!) + v_p(η!) + 3(log b + 2)`.

*Needs:* 2.1, 2.6 (partners); OneSidedPrimeSumBoundsAndAdmissibleData §2.1 (`l₀`), §3.1 (sparse sets of places),
§3.2 (the weights and the `b`-places, sparse for the primes up to `kt`, hence along the powers of `−p` for `p ≤ k`),
§3.3 (the sizes of the scales); CompositeThetaLiftsAndShortForms §2.1 (b) (the local prime sum `s_p(y, σ)` and its total
`S_p`, there `F(p)`).

[ShortProof], `New/Derivatives/Sharpness/NearPairs` (`New.Data.notMem_bPlaces_of_two_partners`, `New.Data.IsNearPair`,
`New.Data.IsNearPair.inert_and_odd`, `New.Data.IsNearPair.exponent_unique`, `New.Data.IsNearPair.eq_and_eq_of_partner_eq`,
`New.Data.IsNearPair.end_ne_start`, `New.Data.lossFactorCount`, `New.Data.lossProduct`,
`New.Data.padicValNat_factorial_le_add_lossProduct`, `New.Data.x_pow_le_lossFactorCount`, `New.Data.partnerMinSum`,
`New.Data.mul_sum_weight_sub_localPrimeSumTotal`, `New.Data.partnerMinSum_le`, `New.Data.error_le_padicValNat_lossProduct`)

### 5.5 The valuation bound for every prime

*Origin:* particular to this proof: for a tight frame of length `M` with a form of unit coefficients at `p`, and every
degree `l` near the weights, `v(l!) + val₁₂(l) ≤ S_p + 2Σ_τ v(B_τ(l_τ))`, at every prime `p`.

*Method of the formal proof:* three cases. At a split prime `S_p = 0` and 5.2 (c) on six copies suffices. At an inert
prime `p > k`, every place is coupled with its partner `−pτ` for `e = 1` (a bijection), `j_τ = min(⌊(l_τ − n♯)₊/p⌋, l_{−pτ})`
times; the theta product along the frame has the normal form with unit `λ_{e0}` (the frame divided by `π̄_M` is a
resolution integral above `p`, 2.6 (d)), 5.3 bounds six copies, and the other six supply the remaining degree at
valuation `≤ 0`. At a prime `p ≤ k` that does not split, the couplings follow the near pairs (5.4), the remaining degree is
supplied at the rate `γ_p` (5.2 (c)), and 5.4 (c), (d) compare with `S_p`; `d ≤ k`, so `p = d` falls here.

Let `D` be admissible data, `p` a prime, `w` a tight frame of length `M` with multiplicities `c_i`, and
`μ_i := ι_p(𝔣_E·conj(τ(w_i)))` its linear forms in the variables `z_τ`, `τ ∈ Φ`; suppose that `μ_{i₀}` has unit
coefficients for some `i₀`. Let `val_n` refer to `Θ := ∏_iθ(μ_iz)^{c_i}` for the CM curve `𝓔`. Let `l ∈ ℕ^Φ` with
`κ(τ) ≤ l_τ ≤ κ(τ) + x^{42}` at every `τ`. Then
`Σ_τ v(l_τ!) + val₁₂(l) ≤ S_p + 2·Σ_τ v(B_τ(l_τ))`.
Moreover: the vectors `w_i/π̄_M` with multiplicities `c_i` are a resolution of the identity, integral above every prime
that does not split in `K`; `ι_p(𝔣_Eπ_M)` is a unit at every such prime; `|π_M𝔱_E|² = M/Ω`; and at an inert `p`,
`val₆(ν) ≤ 0` for every `ν`.

*Needs:* 2.6, 4.2, 4.3, 4.3a, 5.1, 5.2, 5.3, 5.4; OneSidedPrimeSumBoundsAndAdmissibleData §3.2 (the data), §3.3 (a), (b)
(`d ≤ k`); CompositeThetaLiftsAndShortForms §2.1 (b) (the local prime sums `s_p` and `S_p`).

[ShortProof], `New/Derivatives/Sharpness/Cases` (`New.Parameters.resolutionForms`, `New.Data.resolutionVectors`,
`New.Data.taylorScale`, `New.Data.norm_conj_piMBar_mul_jetScale_sq`, `New.Data.isResolution_resolutionVectors`,
`New.Data.isIntegralAbove_resolutionVectors`, `New.Data.norm_taylorScale`, `New.Data.leastValLE_six_zero_of_inert`,
`New.Data.exists_hasNormalForm_resolutionForms`, `New.Data.IsNearWeights`,
`New.Data.padicValNat_factorial_sub_min_le`, `New.Data.sum_padicValNat_factorial_le_add`,
`New.Data.gammaPrime_mul_degree_sub_le_localPrimeSumTotal_add`, `New.Data.isCouplingFamily_of_isNearPair`,
`New.Data.leastValLE_twelve_of_split`, `New.Data.leastValLE_twelve_of_lt`, `New.Data.leastValLE_six_of_isNearPair`,
`New.Data.leastValLE_twelve_localPrimeSumTotal_of_le`, `New.Data.leastValLE_twelve`)

### 5.6 Sharpness of the valuation bound

*Origin:* particular to this proof: for degrees near the weights, some Taylor coefficient of the theta function of an
indicator datum on `12 × 1` matrices has valuation at most `S_p + v_p(t)` at every prime `p`, for one number `t ≠ 0`
whose conjugates are bounded.

*Method of the formal proof:* the twelve series `∏_iy(μ_iz)^{e_{b,i}}·Θ` of 5.1 (c) are, together, the Taylor series of
a vector `F` on `Hom(E, E^{12})` with integral values whose theta function is a theta function for `π_M𝔞₀^{12}` (4.5, with
the monomial sections `θ^{c_i−3e}(yθ³)^{e}` and `δ = π̄_M`); Fourier inversion writes `M^{12f}F` as a combination of
translates of the vacuum with coefficients that are integral after multiplication by a value of the vacuum, and each
translate is a sum of indicator data times roots of unity; an ultrametric choice selects one indicator datum. Then
`t := M^{12f}·θ°(finVec(y))·∏_τB_τ(l_τ)²` for a point with `θ°(finVec(y)) ≠ 0` (4.6 (c)), and 5.5 bounds `val₁₂`.

Let `D` be admissible data, `V₁₂ := Hom(E, E^{12})` with its standard form, `𝔪` a modulus of `E` with ideal `(π_M)`,
and for `y₀ ∈ M_{12×1}(𝒪_E/𝔪)` let `Ψ_{𝔪,y₀} ∈ 𝒮(V₁₂)` be the *indicator datum*: the Gaussian at the infinite places,
the indicator of the class `y₀` at the places dividing `𝔪`, and the vacuum at the other finite places. Write
`J(f) := J_{π_M𝔱_E}(f)`, a series in the variables `z_{τ,b}` (`τ ∈ Φ`, `b < 12`).
(a) *Lifting.* For a tight frame `w` of length `M` with multiplicities `c_i`, its forms `μ_i` (5.5), and exponents
`e_{b,i}` with `3e_{b,i} ≤ c_i`, there is `F ∈ 𝒮(V₁₂)` with integral values at all finite points, whose theta function is
a theta function for `π_M𝔞₀^{12}`, and with `ι_p J(F) = ∏_{b<12} (∏_iy(μ_iz_b)^{e_{b,i}}·Θ(z_b))`.
(b) *Expansion.* For such `F`, every linear form `L` on `𝒮(V₁₂)` and every `y ∈ 𝔸_{E,f}^{12}`, there is `y₀` with
`v(ι_p L(Ψ_{𝔪,y₀})) ≤ v(ι_p(M^{12f}·L(F)·vac(finVec(y))))`.
(c) *Reduction to the curve.* If `c_i ≥ 3|l|` for all `i` and `val₁₂(l) ≤ r`, then for every `y` there are an exponent
`γ` on `Φ × 12` with `Σ_bγ_{τ,b} = l_τ` and a class `y₀` with
`v(ι_p(c_vac^{12}·coeff_γ J(Ψ_{𝔪,y₀}))) ≤ r + v(ι_p(M^{12f}·θ°(finVec(y))))`.
(d) *Size.* If `l_τ ≤ κ(τ) + x^{42}` for all `τ`, then
`|σ(M^{12f}·∏_τB_τ(l_τ)²·θ°(finVec(y)))| ≤ exp(f·m·b/k)` for every automorphism `σ` of `ℂ`.
(e) *Sharpness.* For `l` with `κ(τ) ≤ l_τ ≤ κ(τ) + x^{42}` at every `τ` there is `t ∈ ℂ`, `t ≠ 0`, with
`|σ(t)| ≤ exp(f·m·b/k)` for every automorphism `σ` of `ℂ`, such that for every modulus `𝔪` with ideal `(π_M)`, every
prime `p` and every `ι_p` there are `γ` with `Σ_bγ_{τ,b} = l_τ` and `y₀` with
`v(ι_p(c_vac^{12}·∏_τ l_τ!·coeff_γ J(Ψ_{𝔪,y₀}))) ≤ S_p + v(ι_p(t))`.

*Needs:* 4.3a, 4.5, 4.6, 5.1, 5.5; ShortGRH background (Fourier inversion, as in 4.6, and the expansion of the
translate of the vacuum by a point `x` with `π̄_Mx` integral as a sum of indicator data modulo `𝔪` times roots of unity);
OneSidedPrimeSumBoundsAndAdmissibleData §3.2 (the data), §3.3 (their size relations);
CompositeThetaLiftsAndShortForms §2.1 (b) (the total local prime sum `S_p`).

[ShortProof], `New/Derivatives/Sharpness/BoundAttained` (`New.copyEmbedding`, `New.copyExponent`,
`New.Data.twelveSpace`, `New.Data.twelveTaylor`, `New.Data.indicatorDatum`,
`New.Data.exists_integral_isThetaFunction_twelveTaylor_eq`, `New.Data.exists_norm_le_norm_indicatorDatum`,
`New.Data.exists_le_norm_coeff_indicatorDatum`, `New.Data.norm_map_mul_intVacuum_le`,
`New.Data.exists_rpow_neg_localPrimeSumTotal_le_norm_coeff`)
