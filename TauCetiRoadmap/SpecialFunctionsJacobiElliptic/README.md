# Roadmap: Jacobian elliptic functions of a complex variable

**Summary.** This roadmap builds the Jacobian elliptic functions `sn`, `cn`, `dn` and the other
nine functions of Glaisher's notation as meromorphic functions of a complex variable, for a
complex parameter `τ` in the upper half plane and for every complex modulus `k`. Its organization
follows the structure of the subject rather than any one text. The functions are quotients of
Neville's normalized theta functions, so the algebra of theta functions gives them at once: the
quadratic relations, the derivatives, the translations by quarter periods, the periods, zeros,
poles and residues. The modulus `k` enters next, through the modular function `λ = k²`: the
functions depend on `τ` only through `λ(τ)`, every `k² ≠ 0, 1` is a value of `λ`, and Carlson's
integral `R_F` gives a canonical `τ` off the two cuts. The transformations of the modulus
(Jacobi's imaginary transformation, the reciprocal and imaginary moduli, Landen's and Gauss's
transformations), the addition theorems, the Fourier series, partial fractions and products,
the connection with Weierstrass's `℘` and `ζ`, Jacobi's epsilon and zeta functions with their
quasi-periodicity and Legendre's relation, and the inversion of `sn` by `R_F` follow. The content
is drawn from Lawden (*Elliptic Functions and Applications*, Chs. 2, 3, 6 and 8),
Armitage–Eberlein (*Elliptic Functions*, Chs. 2, 4, 5 and 7), Whittaker–Watson (Ch. XXII),
Takebe (*Elliptic Integrals and Elliptic Functions*, Ch. 17), Chandrasekharan (*Elliptic
Functions*, Ch. VII), Magnus–Oberhettinger–Soni (*Formulas and Theorems for the Special
Functions of Mathematical Physics*, §§10.3–10.4), Temme (*Special Functions*, §12.3), Schwalm
(*Lectures on Selected Topics in Mathematical Physics: Elliptic Functions and Elliptic
Integrals*, §4.3), Lang (*Elliptic Functions*, Ch. 18), Koecher–Krieg (*Elliptic Functions and
Modular Forms*, Ch. I) and the NIST *Digital Library of Mathematical Functions* (DLMF), whose
equation numbers are given as additional locators; each headline cites its sources; see
[References](#references).

Mathlib has Jacobi's `jacobiTheta₂` with its functional equation, the Weierstrass function
`PeriodPair.weierstrassP` of a lattice with its differential equation and meromorphy, `logDeriv`,
`Meromorphic`, infinite products (`HasProd`) and principal powers (`Complex.cpow`,
`slitPlane`). Tau Ceti has the Jacobian functions of a real variable and a real modulus with
`k² < 1` (`TauCeti.Real.jacobiSn`, `TauCeti.Real.jacobiCn`, `TauCeti.Real.jacobiDn`, from the
amplitude), the complete integrals `TauCeti.Real.legendreK` and `TauCeti.Real.legendreEc`,
Carlson's `Complex.carlsonRF` and `Complex.carlsonRD`, the lattice `UpperHalfPlane.periodPair`
of `ℤτ + ℤ`, and Weierstrass's `PeriodPair.weierstrassZeta` with its quasi-periods. Neither has
the functions of a complex variable.

The roadmap covers:
- Neville's theta functions, the twelve functions in the parameter `τ`, their meromorphy, the
  quadratic relations, the derivatives and the differential equations (Layer 1);
- the translations by quarter and half periods, the periods, zeros, poles and residues, and
  special values (Layer 2);
- the modulus: the inversion `k² ↦ τ`, the dependence on `λ(τ)` only, Carlson's canonical
  parameter, the functions of a complex modulus with their reconciliation with Tau Ceti's real
  functions, and the limits `k → 0` and `k → 1` (Layer 3);
- the transformations: Jacobi's imaginary transformation, the reciprocal and imaginary moduli,
  and Landen's and Gauss's transformations (Layer 4);
- the addition theorems for complex arguments, with the double and half arguments (Layer 5);
- the Fourier series, the expansions in cosecants and the infinite products (Layer 6);
- the relation to `℘` and `ζ` of the lattice `ℤτ + ℤ`, Jacobi's epsilon and zeta functions, their
  quasi-periodicity and imaginary transformation, the complete integral `E` and Legendre's
  relation for complex `τ` (Layer 7);
- the inverse function `arcsn` as Carlson's integral `R_F`, with its derivative (Layer 8).

The roadmap rests on Mathlib, Tau Ceti and one roadmap,
[SpecialFunctionsTheta](../SpecialFunctionsTheta/README.md), for the four theta functions, their
quasi-periodicity, quadratic relations, inversion `τ ↦ −1/τ`, products, zeros, theta constants,
Landen quotients, the modular function `λ` with its mapping theorem, and `K = (π/2)θ₃²(0|τ)` in
Carlson's form.

Suggested home: `TauCeti/Analysis/SpecialFunctions/JacobiElliptic/`, beside the real functions,
with the functions of a complex variable in the namespace TauCeti.Complex.

## How to read the build

Layers 1 and 2 are about one parameter `τ` with `Im τ > 0` and need nothing beyond theta
functions: each function is a quotient `θ_p/θ_q` of two Neville thetas (Layer 1), and every
identity of these layers is an identity between theta functions, read off from
SpecialFunctionsTheta. The quotients are written with Lean's division, so each statement says
where the denominator does not vanish, or holds for every argument because the two sides are
quotients of the same thetas up to nonzero factors (Conventions).

Layer 3 brings in the modulus. Two values of `τ` with the same `λ(τ)` give the same twelve
functions; the proof compares Taylor coefficients at `0`, which the differential equation of
Layer 1 determines from `k²`. Every `k² ∉ {0, 1}` is a value of `λ` (3.1), so a chosen `τ`
defines the functions of a modulus, and the limit functions `sin`, `cos`, `1` and `tanh`, `sech`
fill in `k² = 0` and `k² = 1`. Off the cuts `k² ∈ (−∞, 0] ∪ [1, ∞)` there is a canonical choice,
`τ = i R_F(0, k², 1)/R_F(0, 1 − k², 1)`, for which `K = R_F(0, 1 − k², 1)` (3.3); for a real
modulus with `k² < 1` this makes the functions of a real argument Tau Ceti's (3.4).

Layers 4–6 are the classical identities, each proved in the `τ` form where the parameter
transformation is visible (`τ ↦ −1/τ`, `2τ`, `τ/2`) and transferred to the modulus form by 3.2.
Layer 7 joins the roadmap to the lattice functions: `℘` and `ζ` of `ℤτ + ℤ` are, after scaling
by `2K`, `ns²` and `ℰ + cs dn` plus linear terms; Jacobi's epsilon function `ℰ` is the
logarithmic derivative of `θ_n` plus a linear term, which gives its quasi-periodicity, its
imaginary transformation and, by comparing the two, Legendre's relation. Layer 8 inverts `sn`
on a star-shaped domain around `0` by Carlson's `R_F`.

The harder material is in 3.1 (every `k² ≠ 0, 1` is a value of `λ`), 3.2 (the dependence on
`λ` only, including `ℰ`), 3.5 (the limits, where the poles move to infinity or onto those of
`tanh`), 6.2 (summation of the cosecant series over `ℤ`) and 8.1 (the inverse on the whole
star-shaped domain).

## Conventions

- **Names.** Everything lives in the namespace TauCeti; the functions of a complex modulus in
  TauCeti.Complex, beside Tau Ceti's real ones in TauCeti.Real. Functions take their
  parameters first and their variable last:

```text
JacobiLetter                           : Type              the letters s, c, d, n
nevilleTheta p τ u                     : ℂ                 θ_p(u|τ)
jacobiGlaisherTau p q τ u              : ℂ                 pq(u|τ) = θ_p(u|τ)/θ_q(u|τ)
jacobiSnTau τ u, jacobiCnTau τ u, jacobiDnTau τ u          sn, cn, dn (u|τ)
jacobiK τ                              : ℂ                 K(τ) = (π/2) θ₃²(0|τ)
jacobiTau k                            : ℂ                 a τ with λ(τ) = k² (chosen)
carlsonTau k                           : ℂ                 i R_F(0, k², 1)/R_F(0, 1 − k², 1)
jacobiGlaisher p q k u                 : ℂ                 pq(u, k)
jacobiSn k u, jacobiCn k u, jacobiDn k u                   sn, cn, dn (u, k)
jacobiZetaTau τ u                      : ℂ                 Z(u|τ) = θ_n′(u|τ)/θ_n(u|τ)
jacobiEpsilonTau τ u, jacobiEpsilon k u                    ℰ(u|τ), ℰ(u, k)
jacobiETau τ                           : ℂ                 E(τ) = ℰ(K(τ)|τ)
```

  Derivatives are Mathlib's `deriv`; no derivative functions are introduced.
- **Theta functions.** `jacobiThetaOne`, …, `jacobiThetaFour`, `thetaModulus`,
  `thetaComplModulus` and `modularLambda` are SpecialFunctionsTheta's (its 1.1 and 6.1):
  `θ_j(z|τ)` has period `π` or `2π` in `z`, and `k = θ₂²(0|τ)/θ₃²(0|τ)`,
  `k′ = θ₄²(0|τ)/θ₃²(0|τ)`, `λ = k²`. Throughout, `Im τ > 0`.
- **Neville's thetas.** With `ζ = u/θ₃²(0|τ)` (that is, `ζ = πu/(2K)`):
  `θ_s(u|τ) = θ₃²(0|τ) θ₁(ζ|τ)/θ₁′(0|τ)`, `θ_c(u|τ) = θ₂(ζ|τ)/θ₂(0|τ)`,
  `θ_d(u|τ) = θ₃(ζ|τ)/θ₃(0|τ)`, `θ_n(u|τ) = θ₄(ζ|τ)/θ₄(0|τ)` (DLMF 22.2.11; Lawden (2.1.1)–(2.1.3),
  p. 24; Whittaker–Watson §22.11, (A)–(C), p. 492; Chandrasekharan Ch. VII §2 (2.1), p. 100;
  Armitage–Eberlein (5.4)–(5.5c), p. 107; Magnus–Oberhettinger–Soni §10.3, p. 377). They are
  SpecialFunctionsTheta's combined theta functions `φ_{m,n}` of its 6.6 in another normalization:
  with `s, c, d, n ↔ 1, 2, 3, 4`, `pq(u|τ) = φ_{m,n}(ζ|τ)` for `p, q ≠ s`,
  `sq(u|τ) = θ₃²(0|τ) φ_{1,n}(ζ|τ)` and `ps(u|τ) = φ_{m,1}(ζ|τ)/θ₃²(0|τ)`. Takebe (17.2)–(17.4),
  p. 290, has the same quotients with his theta functions of period `1`.
- **The modulus is theta-defined.** `k` and `k′` are `thetaModulus τ` and `thetaComplModulus τ`,
  not principal square roots of `λ` and `1 − λ`. At `τ = −1.2 + 0.5i`,
  `thetaModulus τ = −3.37280 28… − 1.72555 11… i`, the negative of the principal `√λ` (Takebe,
  p. 295, defines `k′` this way for the same reason). The twelve functions depend on `k²` only
  (3.2), but the shift table of 2.1 and the residues of 2.3 carry `k` and `k′` themselves.
- **Glaisher's notation.** `pq = θ_p/θ_q` for all sixteen pairs (Whittaker–Watson §22.122,
  p. 494; Armitage–Eberlein §2.8, p. 46; DLMF 22.2.10); `pp` is `1` off the zeros of `θ_p`.
- **Junk values.** At a zero of `θ_q`, Lean's `x / 0 = 0` makes `pq` zero instead of infinite.
  Two Neville thetas have no common zero (1.1), so `pq` is in lowest terms and its junk set is
  exactly its pole set. An identity between two functions in lowest terms, both meromorphic,
  therefore holds at every argument once it holds off a discrete set: the poles coincide and
  both sides are `0` there. The statements of 2.1, 2.2, 3.2, 4.1–4.3 hold for every `u` for this
  reason; those whose right side is a rational expression in the functions (5.1, 4.4, 4.5) carry
  hypotheses that the denominators do not vanish.
- **The modulus form.** `jacobiTau k` is a choice of `τ` with `Im τ > 0` and `λ(τ) = k²` when
  one exists, which by 3.1 is exactly when `k² ∉ {0, 1}`; otherwise it is the junk value `i`.
  `jacobiGlaisher p q k u` is `pq(u|jacobiTau k)` for `k² ∉ {0, 1}`, and the quotients of
  `nevilleThetaCircular` (`sin, cos, 1, 1`) at `k² = 0` and of `nevilleThetaHyperbolic`
  (`sinh, 1, 1, cosh`) at `k² = 1` (DLMF Tables 22.5.3–22.5.4). By 3.2 the choice does not
  matter; `jacobiK (jacobiTau k)` does depend on it and is never used. The complete integrals
  of a complex modulus are written out as `R_F(0, 1 − k², 1)` and
  `R_F(0, 1 − k², 1) − (k²/3) R_D(0, 1 − k², 1)` with Tau Ceti's Carlson functions; no
  `K(k)` of a complex modulus is defined.
- **Jacobi's zeta and epsilon functions.** `Z(u|τ) = logDeriv (θ_n(·|τ)) u` and
  `ℰ(u|τ) = Z(u|τ) + (1 − Z′(0|τ)) u` (DLMF 22.16.30; Lawden (3.5.3), p. 63, and (3.6.1), p. 65;
  Armitage–Eberlein (5.48), p. 130); `E(τ) = ℰ(K|τ)`, and `E/K = 1 − Z′(0)` (7.2). Both have
  junk values at the poles of `dn`. `jacobiEpsilon k u` is `ℰ(u|jacobiTau k)`, with `ℰ(u, 0) = u`
  and `ℰ(u, 1) = tanh u` (Lawden (3.5.15), p. 65).
- **Powers.** `(1 − x²)^{−1/2}` and similar are principal (`Complex.cpow`), on the set where the
  base lies in `slitPlane`; a product of principal powers is not combined into one power.
  `q^a` means `e^{iπτa}`, never a power of `q = e^{iπτ}`.

## Layer 1: Neville's theta functions and the twelve functions

### 1.1 Definitions and meromorphy

Sources: Lawden (2.1.1)–(2.1.3), p. 24, and (2.1.21), p. 26; Whittaker–Watson §22.11, p. 492, and
§22.122, p. 494; Chandrasekharan Ch. VII §2, pp. 100–101; Armitage–Eberlein §5.1,
p. 107; Takebe §17.1, (17.2)–(17.4), p. 290; Magnus–Oberhettinger–Soni §10.3, p. 377; Temme
§12.3, pp. 322–324; DLMF 22.2.4–22.2.11.

- `nevilleTheta`, `jacobiGlaisherTau`, `jacobiSnTau`, `jacobiCnTau`, `jacobiDnTau` and
  `jacobiK` as in Conventions; the sanity check `nevilleTheta_zero`: `θ_s(0) = 0` with
  `θ_s′(0) = 1`, and `θ_c(0) = θ_d(0) = θ_n(0) = 1`.
- **Meromorphy** (`meromorphic_jacobiGlaisherTau`): for `Im τ > 0`, each `θ_p(·|τ)` is entire,
  two different Neville thetas have no common zero, and each `pq(·|τ)` is `Meromorphic`.

The thetas are entire by SpecialFunctionsTheta 1.2, and `θ₁′(0|τ) ≠ 0` by its 4.3; no common zero
is the list of zeros in its 4.2 (the four lattices of zeros are disjoint translates).

**Checks.**
- At `τ = 0.3 + 0.8i`, `u = 0.37 + 0.21i`: `sn = 0.37321 44443 8 + 0.18744 22832 3 i`,
  `cn = 0.94935 53182 6 − 0.07368 80764 3 i`, `dn = 0.99159 52968 8 − 0.07556 22303 0 i`, equal to
  the values of mpmath's ellipfun at `m = λ(τ) = 0.76600 28750 45 + 0.40978 63252 80 i`.
- `ns · sn = 1` at the same point; `K(i) = 1.85407 46773 01`, the lemniscatic value of
  SpecialFunctionsTheta 6.3; `K(0.3 + 0.8i) = 1.85699 35908 5 + 0.45075 87082 7 i`.
- Negative control: without the factor `θ₃²(0|τ)`, `θ₁(ζ)/θ₁′(0)` has slope
  `1/θ₃²(0|τ) = 0.79881 47206 6 − 0.19390 08801 2 i` at `u = 0` at `τ = 0.3 + 0.8i`, not `1`.
- `ss(0|τ) = 0`, the junk value at a zero of `θ_s`, not `1`.

### 1.2 Quadratic relations

- **The quadratic relations** (`nevilleTheta_sq_add_sq`): for all `u`,
  `θ_s² + θ_c² = θ_n²`, `θ_d² + k²θ_s² = θ_n²` and `θ_d² − k²θ_c² = k′²θ_n²`; hence, where
  `θ_n(u|τ) ≠ 0`, `sn² + cn² = 1`, `dn² + k²sn² = 1`, `dn² − k²cn² = k′²`, and `k² + k′² = 1`
  (Lawden (2.1.9)–(2.1.11), p. 25; Takebe Lemma 17.2, p. 291; Whittaker–Watson §22.11, p. 493;
  DLMF 22.6.1).

They are the quadratic relations of SpecialFunctionsTheta 2.2 at `z = ζ`, divided by theta
constants; `k² + k′² = 1` is its quartic identity.

**Checks.**
- At `τ = 0.3 + 0.8i`: `k = 0.90408 21561 78 + 0.22663 11321 82 i`,
  `k′ = 0.59409 02283 78 − 0.34488 55962 49 i`, and `k² + k′² = 1`.
- The three relations hold at `u = 0.37 + 0.21i` for `τ = 0.3 + 0.8i`, `−1.2 + 0.5i`,
  `0.55 + 1.4i` to `10⁻³⁰`.

### 1.3 Derivatives and differential equations

- **Derivatives** (`hasDerivAt_jacobiSnTau`): where `θ_n(u|τ) ≠ 0`,
  `sn′ = cn dn`, `cn′ = −sn dn`, `dn′ = −k² sn cn` as `HasDerivAt` (Lawden (2.5.2)–(2.5.4),
  p. 36; Takebe Lemma 17.3, p. 292; Whittaker–Watson §22.11, (I), p. 492; Chandrasekharan Ch. VII
  §4, p. 103; DLMF Table 22.13.1).
- The derivatives of the other nine functions (Lawden (2.5.5)–(2.5.13), pp. 36–37; DLMF
  Table 22.13.1), each a constant times the product of the two copolar functions.
- The differential equations `(sn′)² = (1 − sn²)(1 − k²sn²)`, `(cn′)² = (1 − cn²)(k′² + k²cn²)`,
  `(dn′)² = (1 − dn²)(dn² − k′²)` and `sn″ = −(1 + k²) sn + 2k² sn³` (Schwalm §1.2, p. 1-6;
  Armitage–Eberlein §5.2, p. 111; DLMF 22.13.1–22.13.3), from the derivatives and 1.2.

The derivative of `sn` is SpecialFunctionsTheta 2.3 (the derivative of a quotient of thetas) at
`ζ = u/θ₃²`, with `θ₁′(0) = θ₂θ₃θ₄(0)` (its 4.3); `cn` and `dn` follow by the half-period
translations of its 1.3, or from 1.2 by differentiating.

**Checks.**
- At `τ = 0.3 + 0.8i` and `u = 0.37 + 0.21i` the three derivatives agree with difference
  quotients to `10⁻³⁰`.
- Negative control: `dn′ = −k′² sn cn` is off by `0.38858` there.

### Examples

- At `τ = i`: `k = k′ = 2^{−1/2}`, and `sn(K/2|i) = (1 + k′)^{−1/2} = 0.76536 68647 30`
  (DLMF Table 22.5.2).
- `sn(0|τ) = 0`, `cn(0|τ) = dn(0|τ) = 1` for all `τ` (Takebe (17.5), p. 290).

### Dependencies

SpecialFunctionsTheta 1.1–1.3, 2.2–2.3, 4.2–4.3; Mathlib `Meromorphic`, `logDeriv`.

## Layer 2: periods, zeros and poles

### 2.1 Quarter periods

- **Translation by `K`, `iK′`, `K + iK′`** (`jacobiSnTau_add_jacobiK`), for all `u`, with
  `iK′ = τK`:

```text
sn(u + K) = cd u           cn(u + K) = −k′ sd u          dn(u + K) = k′ nd u
sn(u + iK′) = k⁻¹ ns u     cn(u + iK′) = −i k⁻¹ ds u      dn(u + iK′) = −i cs u
sn(u + K + iK′) = k⁻¹ dc u cn(u + K + iK′) = −i k′k⁻¹ nc u dn(u + K + iK′) = i k′ sc u
```

  (Lawden (2.2.17)–(2.2.19), p. 28; Armitage–Eberlein §2.6, pp. 39–41; Magnus–Oberhettinger–Soni
  §10.3, p. 380; DLMF Table 22.4.3).
- The corresponding rows for the other nine functions (DLMF Table 22.4.3), by quotients.

Each is a half-period translation of SpecialFunctionsTheta 1.3: `ζ ↦ ζ + π/2`, `ζ + πτ/2`,
`ζ + π/2 + πτ/2`, which permutes the four thetas up to the multiplier `M(z|τ)`; the multipliers
cancel in each quotient, which is why the rows hold for every `u` (Conventions).

**Checks.**
- All nine rows hold at `u = 0.37 + 0.21i` for `τ = 0.3 + 0.8i`, `−1.2 + 0.5i` and `0.55 + 1.4i`
  to `10⁻²⁹`.
- Negative control: `cn(u + K) = +k′ sd u` is off by `0.57698` at `τ = 0.3 + 0.8i`.

### 2.2 Periods

- **Translation by `2K` and `2iK′`** (`jacobiSnTau_add_two_mul_jacobiK`): for all `u`,
  `sn(u + 2K) = −sn u`, `sn(u + 2iK′) = sn u`, `cn(u + 2K) = −cn u`, `cn(u + 2iK′) = −cn u`,
  `dn(u + 2K) = dn u`, `dn(u + 2iK′) = −dn u` (Lawden (2.2.11)–(2.2.13), p. 28; Whittaker–Watson
  §22.35, pp. 504–505; Takebe Theorem 17.16, p. 307; DLMF Table 22.4.3).
- Hence the periods: `4K` and `2iK′` for `sn`; `4K` and `2K + 2iK′` for `cn`; `2K` and `4iK′`
  for `dn` (Lawden (2.2.4)–(2.2.6), p. 27; Chandrasekharan Ch. VII §1, p. 100; DLMF Table 22.4.1).

2.1 twice.

**Checks.**
- The six laws and the three pairs of periods hold at `u = 0.37 + 0.21i`, `τ = 0.3 + 0.8i` to
  `10⁻³⁰`.
- Negative control: `2K + 2iK′` is not a period of `sn`: `sn(u + 2K + 2iK′) = −sn u`.

### 2.3 Zeros, poles and residues

- **Zeros of the Neville thetas** (`nevilleTheta_eq_zero_iff`): for `m, n : ℤ`, `θ_s` vanishes
  exactly at `2mK + 2niK′`, `θ_c` at `(2m + 1)K + 2niK′`, `θ_d` at `(2m + 1)K + (2n + 1)iK′`
  and `θ_n` at `2mK + (2n + 1)iK′`; these are the zeros (`p`) and poles (`q`) of `pq`
  (Lawden (2.1.22)–(2.1.23), p. 26, and (2.2.9)–(2.2.10), pp. 27–28; Takebe (17.6)–(17.7),
  p. 290; Magnus–Oberhettinger–Soni §10.3, p. 383; DLMF Tables 22.4.1–22.4.2).
- Every zero and pole is simple.
- **Residues** (`tendsto_sub_mul_jacobiSnTau`): at `iK′`, `sn`, `cn`, `dn` have residues `k⁻¹`,
  `−ik⁻¹`, `−i`, as limits of `(u − iK′) f(u)` on the punctured neighbourhood (Lawden §2.8,
  (2.8.5), p. 42; Whittaker–Watson §22.35, p. 505; Magnus–Oberhettinger–Soni §10.3, p. 382; DLMF
  Table 22.5.1); the residues at the other poles follow by 2.2.
- **Special values:** `sn K = 1`, `cn K = 0`, `dn K = k′`, `sn(K + iK′) = k⁻¹`,
  `cn(K + iK′) = −ik′k⁻¹`, `dn(K + iK′) = 0` (Lawden (2.2.20)–(2.2.22), p. 28; DLMF Table 22.5.1),
  2.1 at `u = 0`; and `sn²(K/2) = (1 + k′)⁻¹` (DLMF Table 22.5.2), from 5.2.

The zeros are SpecialFunctionsTheta 4.2 at `ζ = u/θ₃²`, with `π θ₃²(0|τ) = 2K`. The residues
follow from 2.1 and `sn(u) = u + O(u²)`, `cn(0) = dn(0) = 1`.

**Checks.**
- At `τ = 0.3 + 0.8i`: `θ_n(iK′) = 0` to `10⁻³⁰` at
  `iK′ = τK = 0.19649 11106 4 + 1.62082 24851 6 i`, while
  `θ_n(K) = 1.16505 10954 0 + 0.31366 06100 4 i`.
- The residue of `sn` at `iK′` there is `1/k = 1.04069 86002 8 − 0.26087 75103 3 i`, equal to
  `10⁻¹² · sn(iK′ + 10⁻¹²)`.
- `cn(K) = 0` and `dn(K) = k′` there to `10⁻³¹`.

### Examples

- At `τ = i`, `K = K′ = 1.85407 46773 01` and the zeros of `sn` form the square lattice
  `2K(ℤ + iℤ)`.

### Dependencies

Layer 1; SpecialFunctionsTheta 1.3, 4.2.

## Layer 3: the modulus

### 3.1 Every `k² ≠ 0, 1` is a value of `λ`

- **Inversion** (`exists_modularLambda_eq`): for `μ ∉ {0, 1}` there is `τ` with `Im τ > 0` and
  `λ(τ) = μ` (Takebe Proposition 17.4, p. 295; Armitage–Eberlein Theorem 5.1, p. 109;
  Chandrasekharan Ch. VII §1, p. 99; Whittaker–Watson §22.11, p. 491).
- `jacobiTau` as in Conventions.

SpecialFunctionsTheta 6.2 gives `λ` on its fundamental region `F` onto
`ℂ ∖ ((−∞, 0] ∪ [1, ∞))`. A point `μ < 0` is `λ(τ + 1) = λ(τ)/(λ(τ) − 1)` for the `τ ∈ F` with
`λ(τ) = μ/(μ − 1) ∈ (0, 1)`, and a point `μ > 1` is `λ(τ/(1 − τ)) = 1/λ(τ)` for the `τ ∈ F` with
`λ(τ) = 1/μ`, by the laws of its 6.1.

**Checks.**
- `λ(jacobiTau 0.6) = 0.36`; one such `τ` is `1.13968 21039 8 i`, and every `τ + 2n` is another.
- `jacobiTau 1 = i` is the junk value, and `λ(i) = ½ ≠ 1`: no `τ` has `λ(τ) = 1`.
- `jacobiTau (−k) = jacobiTau k`, since the definition sees only `k²`.

### 3.2 Dependence on `λ` only

- **`λ` determines the functions** (`jacobiGlaisherTau_eq_of_modularLambda_eq`): if
  `λ(τ₁) = λ(τ₂)`, then `pq(·|τ₁) = pq(·|τ₂)` for all sixteen pairs, and `ℰ(u|τ₁) = ℰ(u|τ₂)` at
  every `u` with `θ_n(u|τ₁) ≠ 0` (Takebe, p. 294; Armitage–Eberlein §5.2, pp. 110–111, and
  Theorem 5.4, p. 110; DLMF §22.17(ii)).

Proof: by 1.3, `y = sn(·|τ)` satisfies `y″ = −(1 + λ)y + 2λy³` with `y(0) = 0`, `y′(0) = 1`, which
determine every Taylor coefficient at `0`; both functions are analytic near `0`, so they agree
there and, by `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`, off the poles. `cn` and `dn`
are the square roots of `1 − sn²` and `1 − λ sn²` equal to `1` at `0`, near `0`, and the other
functions are quotients; equal meromorphic functions in lowest terms have equal junk sets. `ℰ` is
the primitive of `dn²` vanishing at `0` (7.2). `K(τ)` is not determined by `λ(τ)`.

**Checks.**
- `sn(u|τ)` and `ℰ(u|τ)` at `u = 0.37 + 0.21i` agree to `10⁻³⁰` for `τ = 0.3 + 0.8i`, `τ + 2` and
  `τ/(1 − 2τ) = −0.42647 + 0.29412 i`, which have the same `λ`.
- Negative control: `K(τ/(1 − 2τ)) − K(τ)` has absolute value `3.27` at `τ = 0.3 + 0.8i`.

### 3.3 Carlson's canonical parameter

- `carlsonTau k = i R_F(0, k², 1)/R_F(0, 1 − k², 1)`.
- **The canonical parameter** (`carlsonTau_spec`): if `k²` and `1 − k²` lie in `slitPlane`, then
  `Im (carlsonTau k) > 0`, `λ(carlsonTau k) = k²`, `K(carlsonTau k) = R_F(0, 1 − k², 1)` and
  `K(−1/carlsonTau k) = R_F(0, k², 1)` (Armitage–Eberlein Theorem 5.1, p. 109, with
  `τ = iK′(m)/K(m)`; Lawden §8.12, pp. 232–233; DLMF 22.2.12).

Proof: for `k²` off the cuts, SpecialFunctionsTheta 6.2 gives `τ ∈ F` with `λ(τ) = k²`; its 6.4
gives `R_F(0, 1 − λ(τ), 1) = (π/2)θ₃²(0|τ) = K(τ)`, and at `−1/τ ∈ F`, with
`λ(−1/τ) = 1 − λ(τ)` (its 6.1) and `θ₃²(0|−1/τ) = −iτ θ₃²(0|τ)` (its 3.1 at `z = 0`),
`R_F(0, λ(τ), 1) = −iτ K(τ)`. The quotient is `τ`.

**Checks.**
- `carlsonTau (2^{−1/2}) = i`; `carlsonTau 0.6 = 1.13968 21039 8 i`, with
  `K = R_F(0, 0.64, 1) = 1.75075 38029 2` and `K′ = 1.99530 27776 6`.
- `carlsonTau (0.5 + 0.3i) = 0.39746 33014 76 + 1.20618 08674 3 i`, with `λ = 0.16 + 0.3i = k²` and
  `K = R_F(0, 1 − k², 1) = 1.61320 51868 6 + 0.13668 79387 4 i`; at this `τ` also
  `thetaModulus τ = k`, and `sn(u|τ)` at `u = 0.37 + 0.21i` is
  `0.37293 77462 9 + 0.19483 14769 5 i`, mpmath's `sn(u, k)`.
- `carlsonTau (1.3 + 0.4i) = 0.52519 94543 2 + 0.64720 97507 2 i`, with `thetaModulus = 1.3 + 0.4i`:
  `k` beyond `1` is off the cuts when not real.
- Negative control: the swapped quotient `i R_F(0, 1 − k², 1)/R_F(0, k², 1)` at `k = 0.5 + 0.3i`
  has `λ = 0.84 − 0.3i = 1 − k²`.

### 3.4 The functions of a complex modulus

- `jacobiGlaisher`, `jacobiSn`, `jacobiCn`, `jacobiDn`, `nevilleThetaCircular`,
  `nevilleThetaHyperbolic` and `jacobiEpsilon` as in Conventions; the sanity check
  `jacobiSn_zero_modulus_one_modulus`: `sn, cn, dn` are `sin, cos, 1` at `k = 0` and
  `tanh, sech, sech` at `k = 1`.
- **The modulus form is the `τ` form** (`jacobiGlaisher_eq_jacobiGlaisherTau`): if `Im τ > 0` and
  `λ(τ) = k²`, then `pq(·, k) = pq(·|τ)`, and `ℰ(u, k) = ℰ(u|τ)` where `θ_n(u|τ) ≠ 0`. By 3.1–3.2.
- In particular the statements of Layers 1–2 hold for `pq(·, k)` with `K`, `iK′` of any such
  `τ`; the twelve functions are even in `k` (DLMF 22.17.1).
- **Reconciliation** (`jacobiSn_ofReal`): for real `k` with `k² < 1` and real `u`,
  `sn(u, k)`, `cn(u, k)`, `dn(u, k)` are `TauCeti.Real.jacobiSn k u`, `TauCeti.Real.jacobiCn k u`,
  `TauCeti.Real.jacobiDn k u` (Lawden (2.7.16), p. 41; Armitage–Eberlein §2.5, p. 35).

Reconciliation: at `k = 0` both sides are `sin, cos, 1` (`TauCeti.Real.jacobiSn_zero_modulus`).
For `0 < k² < 1`, take `τ = carlsonTau k` on the imaginary axis; on the real line the triple
`(sn, cn, dn)(·|τ)` is real (by conjugation, SpecialFunctionsTheta 1.2) and solves
`y₁′ = y₂y₃`, `y₂′ = −y₁y₃`, `y₃′ = −k²y₁y₂` with `y(0) = (0, 1, 1)` (1.3), as do Tau Ceti's
functions (`TauCeti.Real.hasDerivAt_jacobiSn` and its companions); the field is Lipschitz on
bounded sets, and `ODE_solution_unique_of_mem_Ioo` gives equality on every interval.

**Checks.**
- `sn(0.7, 0.6) = 0.62991 71153 2`, `cn(0.7, 0.6) = 0.77666 23641 1`,
  `dn(0.7, 0.6) = 0.92582 58983 3`, from the `τ` form at `τ = 1.13968 21039 8 i` and from the
  amplitude.
- `sc(u, 0) = tan u`, `cd(u, 1) = 1` and `ns(u, 1) = coth u`, from the two limit rows.
- `ℰ(u, 0) = u` and `ℰ(u, 1) = tanh u`.
- Negative control: a modulus form at `k = 1` built from the `τ` form would need `λ(τ) = 1`,
  which no `τ` has (3.1); the junk `τ = i` would give the lemniscatic `sn(u|i)` instead of
  `tanh u`.

### 3.5 The limits `k → 0` and `k → 1`

- **`k → 0`** (`tendsto_jacobiSn_modulus_zero`): for every complex `u`, `sn(u, k) → sin u`,
  `cn(u, k) → cos u`, `dn(u, k) → 1` as `k → 0` in `ℂ` (Lawden (2.1.18)–(2.1.20), p. 26; Takebe
  §17.3.2, p. 304; Temme §12.3, p. 322; DLMF Table 22.5.3).
- **`k → 1`** (`tendsto_jacobiSn_modulus_one`): for every `u` with `cosh u ≠ 0`,
  `sn(u, k) → tanh u`, `cn(u, k) → sech u`, `dn(u, k) → sech u` as `k → 1` (Lawden (2.6.16)–
  (2.6.17), p. 39; Takebe §17.3.3, p. 305; DLMF Table 22.5.4).

`k → 0`: near `k = 0`, off `(−∞, 0]`, use `τ = carlsonTau k`, whose `Im τ → ∞`; the thetas of
`ζ` tend to their leading terms (Lawden (2.1.14)–(2.1.17), p. 26), uniformly for `ζ` bounded,
and `ζ = u/θ₃²(0|τ) → u` since `θ₃(0|τ) → 1`. On the cut `k² < 0` use `jacobiTau k` with
`τ + 1` from 3.1; the limit is uniform in the choice by 3.2. `k → 1`: by the imaginary
transformation 4.1, `sn(u, k) = −i sc(iu, k′)` with `k′ → 0`, and the first limit applies off
the poles of `tanh`.

**Checks.**
- `|sn(u, 0.001) − sin u| = 1.2 · 10⁻⁸` and `|sn(u, 0.001i) − sin u| = 1.2 · 10⁻⁸` at
  `u = 0.37 + 0.21i`; `|sn(u, 1.001) − tanh u| = 2.4 · 10⁻⁵`.
- The rate at `0`: `(sn(u, k) − sin u)/k²` tends to `−¼(u − sin u cos u) cos u`, which is
  `−0.00160 09323 − 0.01193 7445 i` at `u = 0.37 + 0.21i`, consistent with an `O(k²)` limit.
- Negative control: at `u = iπ/2` (`cosh u = 0`) `tanh` has a pole, and `sn(iπ/2, k)` tends to
  infinity, not to a limit: the hypothesis of the second headline is needed.

### Dependencies

Layers 1–2; SpecialFunctionsTheta 1.2–1.3, 3.1, 6.1–6.4; Tau Ceti `TauCeti.Real.jacobiSn`,
`TauCeti.Real.hasDerivAt_jacobiSn`, `Complex.carlsonRF`; Mathlib
`ODE_solution_unique_of_mem_Ioo`, `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`.

## Layer 4: transformations

### 4.1 Jacobi's imaginary transformation

- **`τ ↦ −1/τ`** (`jacobiSnTau_I_mul`): for all `u`,
  `sn(iu|τ) = i sc(u|−1/τ)`, `cn(iu|τ) = nc(u|−1/τ)`, `dn(iu|τ) = dc(u|−1/τ)`; with
  `k(−1/τ) = k′(τ)` and `K(−1/τ) = −iτ K(τ) = K′`, this is
  `sn(iu, k) = i sc(u, k′)`, `cn(iu, k) = nc(u, k′)`, `dn(iu, k) = dc(u, k′)` (Whittaker–Watson
  §22.4, p. 505; Lawden (2.6.9)–(2.6.11), pp. 38–39; Takebe §17.3.3, p. 305; Armitage–Eberlein
  §4.7, p. 95; Magnus–Oberhettinger–Soni §10.3, p. 383; DLMF Table 22.6.1).
- The other nine rows (DLMF Table 22.6.1), by quotients.

SpecialFunctionsTheta 3.1 at `z = iζ`: the factors `(−iτ)^{1/2}` and `e^{iτ′z²/π}` are the same
for the four thetas and cancel in each quotient; `ζ′ = u/θ₃²(0|−1/τ)` is `iζ τ′`.

**Checks.**
- The three laws at `u = 0.37 + 0.21i` for `τ = 0.3 + 0.8i`, `−1.2 + 0.5i`, `0.55 + 1.4i` hold to
  `2 · 10⁻³⁰`; `k(−1/τ) = k′(τ)` there.
- Negative control: `i sc(u, k)` in place of `i sc(u, k′)` is off by `0.01247` at
  `k = 0.5 + 0.3i`.

### 4.2 The reciprocal modulus

- **`k ↦ 1/k`** (`jacobiSn_inv_modulus`): for `k ≠ 0` and all `u`,
  `sn(u, 1/k) = k sn(u/k, k)`, `cn(u, 1/k) = dn(u/k, k)`, `dn(u, 1/k) = cn(u/k, k)` (Lawden
  (3.9.4)–(3.9.5), p. 77; Magnus–Oberhettinger–Soni §10.3, table, p. 385; DLMF 22.17.2–22.17.4).

Proof: `w(u) = k sn(u/k, k)` solves `(w′)² = (1 − w²)(1 − k⁻²w²)` with `w(0) = 0`, `w′(0) = 1`,
so 3.2's Taylor argument with `λ = k⁻²` gives the first law; the other two from 1.2 at `u = 0`
by continuity. At `k² = 1` both sides are the limit functions.

**Checks.**
- The three laws hold at `u = 0.37 + 0.21i` for `k = 0.6`, `0.5 + 0.3i`, `1.3 + 0.4i`,
  `−0.7 + 0.9i` to `10⁻³⁰`.
- Negative control: `sn(u/k, k)/k` in place of `k sn(u/k, k)` is off by `1.00876` at
  `k = 0.5 + 0.3i`.

### 4.3 The imaginary modulus

- **`k ↦ ik`** (`jacobiSn_I_mul_modulus`): for either `k₁′` with `k₁′²(1 + k²) = 1` and
  `k₁ = k k₁′`, `sn(u, ik) = k₁′ sd(u/k₁′, k₁)`, `cn(u, ik) = cd(u/k₁′, k₁)`,
  `dn(u, ik) = nd(u/k₁′, k₁)` for all `u` (Whittaker–Watson §22.421, Example, p. 508;
  Magnus–Oberhettinger–Soni §10.3, table, p. 385; DLMF 22.17.5–22.17.8, with either square root).

Proof: as 4.2, `w(u) = k₁′ sd(u/k₁′, k₁)` solves the equation of `sn(·, ik)`; replacing `k₁′` by
`−k₁′` changes `u/k₁′` and the factor together, and `sd` is odd.

**Checks.**
- The three laws hold at `u = 0.37 + 0.21i`, `k = 0.6`, `0.5 + 0.3i`, `1.3 + 0.4i` for both signs
  of `k₁′` to `10⁻³⁰`.
- `k = 0`: `k₁′ = ±1`, `k₁ = 0`, and the first law reads `sin u = ±sin(±u)`.

### 4.4 Landen's transformation

- **`τ ↦ 2τ`** (`jacobiSnTau_landen`): with `k₁ = k(2τ)` and `w = u/(1 + k₁)`:
  `k₁ = (1 − k′)/(1 + k′)`, `(1 + k₁)K(2τ) = K(τ)`, and, where `θ_n(w|2τ) ≠ 0` and the
  denominators do not vanish,
  `sn(u|τ) = (1 + k₁) sn(w|2τ)/(1 + k₁ sn²(w|2τ))`,
  `cn(u|τ) = cn(w|2τ) dn(w|2τ)/(1 + k₁ sn²(w|2τ))`,
  `dn(u|τ) = (dn²(w|2τ) − (1 − k₁))/(1 + k₁ − dn²(w|2τ))` (Whittaker–Watson §22.42, pp. 507–508,
  with Example 2; Lawden (3.9.15)–(3.9.24), pp. 78–79; Armitage–Eberlein §4.8, pp. 99–101;
  Magnus–Oberhettinger–Soni §10.3, table, p. 385; DLMF 22.7.1–22.7.4).
- In the modulus form, for either root `k′` of `k′² = 1 − k²` with `k′ ≠ −1`
  (DLMF §22.17(ii)).

SpecialFunctionsTheta 4.4 (the quotients between `τ` and `2τ`) at `ζ` gives `k₁ = k(2τ)` and the
first law as Whittaker–Watson derive it; the others from 1.2. The modulus form: the two roots
`k′` correspond to two values of `τ` with the same `λ` but different `λ(2τ)`, and 3.2 applies to
each.

**Checks.**
- `k(2τ) = (1 − k′(τ))/(1 + k′(τ))` and `(1 + k₁)K(2τ) = K(τ)` at `τ = 0.3 + 0.8i`, `−1.2 + 0.5i`,
  `0.55 + 1.4i`; the three laws there to `2 · 10⁻²⁹`.
- In the modulus form at `k = 0.6`, `0.5 + 0.3i`, `1.3 + 0.4i`, both roots `±k′` give the left
  side to `10⁻²⁹`.

### 4.5 Gauss's transformation

- **`τ ↦ τ/2`** (`jacobiSnTau_gauss`): with `k₂ = k(τ/2)`, `k₂′ = k′(τ/2)` and
  `w = u/(1 + k₂′)`: `k₂′ = (1 − k)/(1 + k)`, and where `θ_n(w|τ/2)` and `θ_d(w|τ/2)` do not vanish,
  `sn(u|τ) = (1 + k₂′) sn cn/dn`, `cn(u|τ) = (1 + k₂′)(dn² − k₂′)/(k₂² dn)`,
  `dn(u|τ) = (1 − k₂′)(dn² + k₂′)/(k₂² dn)`, the functions on the right at `(w|τ/2)` (Lawden
  (3.9.25)–(3.9.29), p. 80; Magnus–Oberhettinger–Soni §10.3, table, p. 385; DLMF 22.7.5–22.7.8).
- In the modulus form, with `k₂ = 2k^{1/2}/(1 + k)` for either root `k^{1/2}`, and
  `k₂′ = (1 − k)/(1 + k)` as a quotient (DLMF 22.7.5 defines `k₂′` by a root of `1 − k₂²`; the
  quotient is the right branch).

4.4 at `τ/2`, solved for the functions at `τ`.

**Checks.**
- `k′(τ/2) = (1 − k)/(1 + k)` and `k(τ/2)² = 4k/(1 + k)²` at the three test values of `τ`; the
  three laws there to `3 · 10⁻³⁰`.
- Negative control: `k₂′ = −(1 − k)/(1 + k)`, the other root of `1 − k₂²`, gives `sn` off by
  `0.02854` at `k = 0.6`.

### Examples

- Landen's transformation iterated is the AGM: `K(τ) = K(2ⁿτ) ∏(1 + k(2ʲτ))`, and
  `K(2ⁿτ) → π/2`; on the imaginary axis this is Tau Ceti's `K = π/(2M(1, k′))`.

### Dependencies

Layers 1–3; SpecialFunctionsTheta 3.1, 4.4.

## Layer 5: addition

### 5.1 The addition theorems

- **Addition** (`jacobiSnTau_add`): where `θ_n(u|τ)`, `θ_n(v|τ)` and
  `D = 1 − k² sn²u sn²v` do not vanish,
  `sn(u + v) = (sn u cn v dn v + sn v cn u dn u)/D`,
  `cn(u + v) = (cn u cn v − sn u dn u sn v dn v)/D`,
  `dn(u + v) = (dn u dn v − k² sn u cn u sn v cn v)/D` (Whittaker–Watson §22.2, pp. 494–496;
  Lawden (2.4.1)–(2.4.3), pp. 33–34; Takebe §17.3.1, p. 303; Chandrasekharan Ch. VII §6,
  pp. 106–107; Armitage–Eberlein §2.4, pp. 30–33; Magnus–Oberhettinger–Soni §10.3, p. 378;
  DLMF 22.8.1–22.8.3).
- The product formulas `sn(u + v) sn(u − v) = (sn²u − sn²v)/D` and their companions (Lawden
  (2.4.16)–(2.4.18), p. 35).

Proof: for fixed `v`, both sides of the first law are elliptic in `u` with the periods of 2.2;
their difference has at most simple poles at the zeros of `D` and of `θ_n`, which 2.1 places and
2.3 matches residue by residue, so it is constant (Koecher–Krieg Ch. I, §2, Liouville's first
theorem 2.3, p. 26) and `0` at `u = 0`. Alternatively, SpecialFunctionsTheta 2.3 (the addition
formulas for `θⱼ(z + w)θⱼ(z − w)`) at `z = ζ`, `w = η`.

**Checks.**
- At `k = 0.5 + 0.3i`, `u = 0.37 + 0.21i`, `v = −0.52 + 0.33i`:
  `sn(u + v) = −0.18259 42323 4 + 0.55518 85064 0 i`, and the three laws and the product formula
  hold to `2 · 10⁻³¹`; also at `k = 1.3 + 0.4i`.
- Negative control: `1 + k² sn²u sn²v` in the denominator gives
  `−0.15926 15884 3 + 0.54928 63935 5 i`.

### 5.2 Double and half arguments

- `sn 2u = 2 sn u cn u dn u/(1 − k² sn⁴u)`, `cn 2u = (cn²u − sn²u dn²u)/(1 − k² sn⁴u)`,
  `dn 2u = (dn²u − k² sn²u cn²u)/(1 − k² sn⁴u)` where the denominators do not vanish (Lawden
  (2.4.4)–(2.4.6), p. 34; DLMF 22.6.5–22.6.7), 5.1 at `v = u`.
- `sn²(u/2) = (1 − cn u)/(1 + dn u)`, `cn²(u/2) = (dn u + cn u)/(1 + dn u)`,
  `dn²(u/2) = (dn u + cn u)/(1 + cn u)` where the denominators do not vanish (Lawden
  (2.4.7)–(2.4.9), p. 34; DLMF 22.6.19–22.6.20), from the double arguments.

**Checks.**
- The three duplication and three halving laws hold at `u = 0.37 + 0.21i`, `k = 0.5 + 0.3i` to
  `4 · 10⁻³¹`.
- At `u = K`: `sn²(K/2) = 1/(1 + k′)`, which at `τ = i` is `0.58578 64376 27 = 2 − √2`.

### Dependencies

Layers 1–2; SpecialFunctionsTheta 2.3; Koecher–Krieg's Liouville theorems via Mathlib's
`Differentiable.apply_eq_apply_of_bounded`.

## Layer 6: series and products

### 6.1 Fourier series

- **Fourier series** (`hasSum_jacobiSnTau_fourier`): with `u = θ₃²(0|τ) ζ = 2Kζ/π` and
  `q^a = e^{iπτa}`, for `|Im ζ| < π Im τ/2`:

```text
sn u = (2π/(Kk)) Σ_{n≥0} q^{n+½} sin((2n+1)ζ)/(1 − q^{2n+1})
cn u = (2π/(Kk)) Σ_{n≥0} q^{n+½} cos((2n+1)ζ)/(1 + q^{2n+1})
dn u = π/(2K) + (2π/K) Σ_{n≥1} qⁿ cos(2nζ)/(1 + q^{2n})
```

  as `HasSum` (Whittaker–Watson §22.6, p. 510; Lawden §8.7, p. 221; Armitage–Eberlein §2.9,
  pp. 51–55; Magnus–Oberhettinger–Soni §10.3, p. 379; DLMF 22.11.1–22.11.3).
- The Fourier series of the other nine functions in their strips (Magnus–Oberhettinger–Soni
  §10.3, p. 379; DLMF §22.11).

Whittaker–Watson's contour argument: integrate `sn(2Kx/π) e^{inx}` around the parallelogram with
corners `±π`, `±π + πτ`, using 2.2 and the residues of 2.3; the series converges absolutely in the
strip since the poles nearest the real axis are at `Im ζ = ±π Im τ/2`.

**Checks.**
- At `τ = 0.3 + 0.8i`, `ζ = 0.21 + 0.17i` (strip half-width `1.2566`) and at `τ = −1.2 + 0.5i`
  (half-width `0.7854`), the three sums agree with `sn, cn, dn` to `3 · 10⁻³¹`.
- Negative control: at `Im ζ = 0.9 π Im τ`, outside the strip, the partial sums of the first
  series to 60 and to 120 terms differ by `4 · 10¹⁰⁴` at `τ = 0.3 + 0.8i`.

### 6.2 Expansions over the poles

- **Cosecant series** (`hasSum_jacobiSnTau_cosec`): for `t` with
  `sin(π(t − (n + ½)τ)) ≠ 0` for all `n : ℤ`,
  `2Kk sn(2Kt) = Σ_{n∈ℤ} π/sin(π(t − (n + ½)τ))` and
  `2iKk cn(2Kt) = Σ_{n∈ℤ} (−1)ⁿ π/sin(π(t − (n + ½)τ))`, as `HasSum` over `ℤ` (DLMF 22.12.2–22.12.3;
  Magnus–Oberhettinger–Soni §10.3, p. 380).

Proof: both sides are `2`-periodic in `t` with simple poles at `t = m + (n + ½)τ` and the same
residues (2.3 at `2Kt`), and the series converges absolutely and locally uniformly off the poles
since `|sin(π(t − (n + ½)τ))|` grows like `e^{π|n| Im τ}`; the difference is entire, bounded on a
period strip, and odd in `t − τ/2`, hence `0`.

**Checks.**
- At `τ = 0.3 + 0.8i`, `t = 0.13 + 0.07i` both laws hold to `10⁻³⁰`; likewise at
  `τ = −1.2 + 0.5i`.
- Negative control: the sign `(−1)ⁿ` in the series for `sn` gives a value off by `2.48`.

### 6.3 Infinite products

- **Products** (`hasProd_jacobiSnTau`): with `u = θ₃²(0|τ) ζ` and `q^a = e^{iπτa}`, where
  `θ₄(ζ|τ) ≠ 0`,

```text
Dₙ = 1 − 2q^{2n−1} cos 2ζ + q^{4n−2}
sn u = (θ₃(0)/θ₂(0)) 2q^{¼} sin ζ ∏_{n≥1} (1 − 2q^{2n} cos 2ζ + q^{4n})/Dₙ
cn u = (θ₄(0)/θ₂(0)) 2q^{¼} cos ζ ∏_{n≥1} (1 + 2q^{2n} cos 2ζ + q^{4n})/Dₙ
dn u = (θ₄(0)/θ₃(0)) ∏_{n≥1} (1 + 2q^{2n−1} cos 2ζ + q^{4n−2})/Dₙ
```

  as `HasProd` (Whittaker–Watson §22.5, p. 508; Chandrasekharan Ch. VII §5, p. 105). The
  prefactors are `k^{−1/2}`, `k′^{1/2}k^{−1/2}`, `k′^{1/2}` of the sources with the roots
  `θ₂(0)/θ₃(0)` and `θ₄(0)/θ₃(0)`.

Quotients of the products of SpecialFunctionsTheta 4.2; the denominator factors do not vanish
where `θ₄(ζ|τ) ≠ 0`.

**Checks.**
- The three products (80 factors) agree with `sn, cn, dn` at `τ = 0.3 + 0.8i` and
  `τ = −1.2 + 0.5i`, `ζ = 0.21 + 0.17i`, to `10⁻³⁰`.
- Negative control: at `τ = −1.2 + 0.5i`, `(√λ)^{−1/2}` with both roots principal is
  `0.49946 73797 − 0.12034 78030 i`, which is `−i` times
  `θ₃(0)/θ₂(0) = 0.12034 78030 + 0.49946 73797 i`;
  with it the product gives `−i sn`.

### Dependencies

Layers 1–2; SpecialFunctionsTheta 4.2; Mathlib `HasSum`, `HasProd`.

## Layer 7: Weierstrass's functions, Jacobi's epsilon and zeta functions

### 7.1 The Weierstrass function

- **`℘` and `ns²`** (`weierstrassP_jacobiK`): for the lattice `L = ℤτ + ℤ` of
  `UpperHalfPlane.periodPair` and `θ_s(u|τ) ≠ 0`,
  `(2K)⁻² ℘_L(u/(2K)) = ns²(u|τ) − (1 + k²)/3`, and the half-period values are
  `(2K)⁻² ℘_L(½) = (2 − k²)/3`, `(2K)⁻² ℘_L((1 + τ)/2) = (2k² − 1)/3`,
  `(2K)⁻² ℘_L(τ/2) = −(1 + k²)/3` (Lawden (6.9.10)–(6.9.11), p. 163; Whittaker–Watson §22.351,
  p. 505; Armitage–Eberlein (7.54)–(7.59), pp. 178–179; Chandrasekharan Ch. VII §3, p. 102;
  Magnus–Oberhettinger–Soni §10.6, p. 392).
- The companion laws `℘(u + ωⱼ) − eⱼ` in terms of `sc²`, `sd²`, `sn²` (Lawden (6.9.11), p. 163).

Proof: `℘_L(z/(2K))/(2K)² = ℘_{2K·L}(z)` by `PeriodPair.weierstrassP_smul`. `ns²(u)` has the
periods `2K`, `2iK′ = 2τK` (2.2), a double pole with principal part `u⁻²` at `0` and no other pole
in a period cell (2.3), so it differs from `℘_{2K·L}` by a constant; the constant is `(1 + k²)/3`
by the Laurent expansion of `ns²` at `0` (from `sn = u − (1 + k²)u³/6 + …`, 1.3) against
`℘ = u⁻² + O(u²)`. The `eⱼ` are the values at `K`, `K + τK`, `τK` by 2.1.

**Checks.**
- At `τ = 0.3 + 0.8i`, `u = 0.37 + 0.21i`: both sides of the first law are
  `2.83480 63296 8 − 4.73540 42926 0 i`; the `eⱼ` to `5 · 10⁻³¹`; also at `τ = −1.2 + 0.5i`.
- `e₁ + e₂ + e₃ = 0`, and `e₁ − e₃ = 1`, `e₂ − e₃ = k²` after scaling: the modulus is
  `k² = (e₂ − e₃)/(e₁ − e₃)` (Whittaker–Watson §22.351, p. 505).

### 7.2 Jacobi's epsilon and zeta functions

- `jacobiZetaTau`, `jacobiEpsilonTau`, `jacobiETau` as in Conventions.
- **`ℰ′ = dn²`** (`hasDerivAt_jacobiEpsilonTau`): where `θ_n(u|τ) ≠ 0`,
  `ℰ′(u) = dn²(u)`, and `E = K(1 − Z′(0))` (Lawden (3.5.1)–(3.5.5), pp. 63–64; Whittaker–Watson
  §22.73, p. 517; Armitage–Eberlein §5.6, pp. 129–130; DLMF 22.16.17, 22.16.30).
- The addition theorem `ℰ(u + v) = ℰ(u) + ℰ(v) − k² sn u sn v sn(u + v)` where the three
  functions are regular (Lawden (3.5.14), p. 65; Armitage–Eberlein (5.54), p. 132;
  DLMF 22.16.27), and `ℰ(u + K) = ℰ(u) + E − k² sn u cd u`, `Z(u + K) = Z(u) − k² sn u cd u`,
  `Z(K) = 0`, `Z` odd (DLMF 22.16.28, 22.16.33; Magnus–Oberhettinger–Soni §10.4, p. 386).

`ℰ′ = dn²`: `(log θ₄)″` is SpecialFunctionsTheta 2.3's derivative of `θ₁/θ₄` turned by a half
period, `−θ₂²(0)θ₃²(0)θ₁²(ζ)/θ₄²(ζ) + const`, which is `−k² sn²` up to the scaling; the constant
is fixed at `u = 0`. `Z(K) = 0` since `θ₄′(π/2) = θ₃′(0) = 0`, which gives `E = K(1 − Z′(0))`.

**Checks.**
- At `τ = 0.3 + 0.8i`: `E(τ) = 1.25004 59245 5 − 0.23683 69223 9 i`, `Z(K) = 0` to `10⁻³¹`, and
  `ℰ′ = dn²` at `u = 0.37 + 0.21i` to `10⁻³⁰`; the addition theorem there with
  `v = −0.52 + 0.33i` to `10⁻³⁰`.
- At `τ = carlsonTau 0.6 = 1.13968 21039 8 i`: `E = 1.41808 33944 5`, which is
  `TauCeti.Real.legendreEc 0.6`.
- Negative control: the period integral of `dn²` is `2E`, not `2K`: at `τ = 0.3 + 0.8i`,
  `2(E − K) = −1.21389 53326 − 1.37519 12613 i`.

### 7.3 Quasi-periodicity and the imaginary transformation

- **Quasi-periods** (`jacobiZetaTau_add_two_mul_jacobiK`): where `θ_n(u|τ) ≠ 0`,
  `Z(u + 2K) = Z(u)`, `Z(u + 2iK′) = Z(u) − iπ/K`, `ℰ(u + 2K) = ℰ(u) + 2E` and
  `ℰ(u + 2iK′) = ℰ(u) + 2iK′E/K − iπ/K` (Lawden (3.5.8), p. 64, and (3.6.14), p. 66;
  Armitage–Eberlein §5.6, p. 130; DLMF 22.16.29, 22.16.34).
- **Imaginary transformation** (`jacobiEpsilonTau_I_mul`): where `θ_c(u|−1/τ)` and
  `θ_n(u|−1/τ)` do not vanish, `ℰ(iu|τ) = i(u + dn(u|−1/τ) sc(u|−1/τ) − ℰ(u|−1/τ))`; in the
  modulus form `ℰ(iu, k) = i(u + dn(u, k′) sc(u, k′) − ℰ(u, k′))` (Armitage–Eberlein (5.52),
  p. 131; Lawden (3.6.12), p. 66).
- `Z(iu, k) = i dn(u, k′) sc(u, k′) − iZ(u, k′) − πiu/(2KK′)` (Armitage–Eberlein Theorem 5.10,
  (5.50), p. 131).

Quasi-periods: `Z = logDeriv θ_n`, and SpecialFunctionsTheta 1.3 gives
`θ₄(ζ + πτ) = −q⁻¹e^{−2iζ}θ₄(ζ)`, whose logarithmic derivative in `u` is `−2i/θ₃²(0) = −iπ/K`.
Imaginary transformation: by 4.1, `d/du ℰ(iu|τ) = i dn²(iu|τ) = i dc²(u|−1/τ)`, and the primitive
`∫₀ᵘ dc² = u + dn sc − ℰ` vanishing at `0` is Armitage–Eberlein, Exercise 5.6.2, p. 133, a
differentiation with 1.2–1.3.

**Checks.**
- At `τ = 0.3 + 0.8i` and `−1.2 + 0.5i`, `u = 0.37 + 0.21i`: the four quasi-periodic laws to
  `5 · 10⁻³⁰`; `ℰ(u + 2iK′) − ℰ(u) = 2i(K′ − E′)` with `K′ = K(−1/τ)`, `E′ = E(−1/τ)`.
- The imaginary transformation there to `10⁻³⁰`; negative control: `− dn sc` in place of `+ dn sc`
  is off by `0.828`.

### 7.4 The complete integral `E` and Legendre's relation

- **Legendre's relation** (`jacobiETau_legendre`): for `Im τ > 0`,
  `E K′ + E′ K − K K′ = π/2` with `K′ = K(−1/τ)`, `E′ = E(−1/τ)` (Armitage–Eberlein
  Theorem 5.11, (5.53), p. 131; Lawden (3.8.29), p. 76, for `0 < k < 1`).
- **Carlson's form of `E`** (`jacobiETau_carlsonTau`): if `k²` and `1 − k²` lie in `slitPlane`,
  `E(carlsonTau k) = R_F(0, 1 − k², 1) − (k²/3) R_D(0, 1 − k², 1)`; for real `k` with
  `0 < k² < 1` this is `TauCeti.Real.legendreEc k` by
  `TauCeti.Real.ofReal_legendreEc_eq_carlsonRF_sub_carlsonRD`.

Legendre's relation: put `u = 0`, after shifting, into the two expressions for
`ℰ(u + 2iK′) − ℰ(u)`: `2iK′E/K − iπ/K` from 7.3's quasi-periods and `2i(K′ − E′)` from the
imaginary transformation at `u = 2K′` (`ℰ(2iK′|τ) = 2i(K′ − E′)`, since `sc(2K′|−1/τ) = 0`) and
7.2's addition theorem. Equating and multiplying by `K/(2i)` gives the relation, as in
Armitage–Eberlein, p. 131. Carlson's form: both sides are holomorphic in `k²` on the doubly cut
plane (3.3 and Tau Ceti's Carlson functions), and agree for `0 < k < 1` by
`TauCeti.Real.ofReal_legendreEc_eq_carlsonRF_sub_carlsonRD` and 7.2's check.

**Checks.**
- At `τ = 0.3 + 0.8i` and `−1.2 + 0.5i` the left side of Legendre's relation is
  `π/2 = 1.57079 63267 9` to `5 · 10⁻³¹`; `K(−1/τ) = −iτ K(τ)` there.
- At `k = 0.5 + 0.3i`: `E(carlsonTau k) = 1.51394 93183 3 − 0.12451 76876 8 i`, the Carlson
  value and mpmath's `ellipe(k²)`.
- Negative control: `E K′ + E′ K + K K′` is not `π/2` (at `τ = i`, `E = 1.35064 38810 5`,
  `K = 1.85407 46773 0`, and `2EK − K² = π/2` while `2EK + K² ≠ π/2`).

### 7.5 The Weierstrass zeta function

- **`ζ` and `ℰ`** (`weierstrassZeta_jacobiK`): for the lattice `L = ℤτ + ℤ` and `u` with
  `θ_s(u|τ) ≠ 0` and `θ_n(u|τ) ≠ 0`,
  `(2K)⁻¹ ζ_L(u/(2K)) = ℰ(u) + cs(u) dn(u) − (2 − k²) u/3`, a derived form; compare Lawden
  (3.6.17), p. 67, where `cs u dn u` appears as the logarithmic derivative of `sn` in
  `ℰ(u + iK′)`.

Proof: differentiate. By 1.3, `(cs dn)′ = −dn² ns² − k² cn²`, and with 1.2 and 7.2,
`d/du (ℰ + cs dn − (2 − k²)u/3) = −ns² + (1 + k²)/3 = −(2K)⁻² ℘_L(u/(2K))` by 7.1, which is the
derivative of the left side by `PeriodPair.hasDerivAt_weierstrassZeta`. Both sides are odd, so
they are equal.

**Checks.**
- At `τ = 0.3 + 0.8i` and `−1.2 + 0.5i`, `u = 0.37 + 0.21i`, the two sides agree to `10⁻³⁰`, with
  `ζ_L` computed from `ζ(z) = 2η₁z + πθ₁′(πz)/θ₁(πz)`, `η₁ = −π²θ₁‴(0)/(6θ₁′(0))`, checked against
  `−ζ′ = ℘`.
- Negative control: `+(1 + k²)u/3` (the constant `e₃` in place of `e₁`) is off by `0.425`.
- With 7.3 and `PeriodPair.weierstrassZeta_add_coe`, the law gives the quasi-period of `ζ_L` for
  the period `1` as `2E − (2 − k²)2K/3` times `2K`, from `ℰ(u + 2K) = ℰ(u) + 2E`.

### Dependencies

Layers 1–4; SpecialFunctionsTheta 1.3, 2.3; Tau Ceti `UpperHalfPlane.periodPair`,
`PeriodPair.weierstrassP_smul`, `PeriodPair.weierstrassZeta`,
`PeriodPair.hasDerivAt_weierstrassZeta`, `PeriodPair.weierstrassZeta_add_coe`,
`PeriodPair.quasiPeriod`, `Complex.carlsonRD`, `TauCeti.Real.legendreEc`; Mathlib
`PeriodPair.weierstrassP`, `PeriodPair.meromorphic_weierstrassP`,
`PeriodPair.derivWeierstrassP_sq`.

## Layer 8: the inverse function

### 8.1 `arcsn` as Carlson's integral

- **Inversion by `R_F`** (`jacobiSn_mul_carlsonRF`): for every `k` and every `x` with `1 − x²` and
  `1 − k²x²` in `slitPlane`, `sn(x R_F(1 − x², 1 − k²x², 1), k) = x`, and
  `x ↦ x R_F(1 − x², 1 − k²x², 1)` has derivative `(1 − x²)^{−1/2}(1 − k²x²)^{−1/2}` (Lawden
  §8.14, p. 238; Schwalm §4.3, pp. 4-10–4-11; Whittaker–Watson §22.11, p. 492;
  Magnus–Oberhettinger–Soni §10.3, p. 386; DLMF 22.15.11).
- In particular `x R_F(1 − x², 1 − k²x², 1)` at `x = 1` is `K = R_F(0, 1 − k², 1)` for `k²` off
  `[1, ∞)`, and at `k = 0`, `1` it is `arcsin x`, `artanh x`.

The domain is star-shaped about `0`: if `x² ∉ [1, ∞)` then `t²x² ∉ [1, ∞)` for `t ∈ [0, 1]`.
Write `g(x) = x R_F(1 − x², 1 − k²x², 1)`. The derivative is the homogeneity and the derivative of
`R_F` in its arguments. `g(0) = 0`, `g′(0) = 1`, so `g` has a local inverse `φ` at `0` with
`φ′ = (1 − φ²)^{1/2}(1 − k²φ²)^{1/2}`; `sn` satisfies the same equation near `0` (1.3, with `cn`,
`dn` the principal roots of 1.2 near `0`), so `φ = sn` near `0` and `sn ∘ g = id` near `0`, hence
on the domain by `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq` (`sn ∘ g` has no pole there,
since it is `id` on an open subset).

**Checks.**
- At `k = 0.6`, `x = 2.5 − 1.1i`: `g(x) = 0.56870 59826 6 − 1.69312 29760 1 i` and
  `sn(g(x), 0.6) = x` to `10⁻³⁰`; the derivative agrees with a difference quotient.
- At `k = 0.5 + 0.3i`, `1.3 + 0.4i`, `−0.7 + 0.9i` and `x = 0.4 + 0.2i`, `2.5 − 1.1i`, `−3 + 0.5i`,
  `0.9`: `sn(g(x), k) = x` and the derivative law to `10⁻³⁰`.
- `g(1) = 1.75075 38029 2 = K(0.6)`; `g(0.5) = π/6` at `k = 0` and
  `g(0.5) = artanh 0.5 = 0.54930 61443 3` at `k = 1`.

### Dependencies

Layers 1–3; Tau Ceti `Complex.carlsonRF`; Mathlib `Complex.cpow`, `slitPlane`,
`AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`.

## Downstream consumers

- Lamé functions and ellipsoidal harmonics, whose equation in Jacobi's form has the coefficient
  `k² sn²(z, k)` at complex `z` (Whittaker–Watson Ch. XXIII); SpecialFunctionsHeun (an open PR)
  states the Jacobi form of Lamé's equation in its 2.4 with the real functions only.
- The periodic solutions of the KdV and nonlinear Schrödinger equations (cnoidal and dnoidal
  waves) and the pendulum beyond the real time axis.
- A roadmap for conformal maps by elliptic functions (Schwarz–Christoffel maps of rectangles,
  `sn` as the map of a rectangle onto a half plane, DLMF §22.18(ii)).

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **Neville's thetas and the twelve functions** (1.1–1.3).
2. **Periods, zeros and poles** (2.1–2.3).
3. **The modulus** (3.1–3.5).
4. **Transformations** (4.1–4.5).
5. **Addition** (5.1–5.2).
6. **Series and products** (6.1–6.3).
7. **Weierstrass's functions, Jacobi's epsilon and zeta functions** (7.1–7.5).
8. **The inverse function** (8.1).

The numbers are those of the layers above, and `k.n` names subsection `n` of Layer `k`.
`Suggested.lean` states the headlines that carry a Lean name, each with every conclusion the README
attaches to it; it is not an exhaustive acceptance test, and the other headlines are targets of the
same standing, stated in prose. The Checks and Examples of each layer are statements to
prove; they test the conventions on explicit values.

**Inputs.** Cases of the targets that Mathlib, Tau Ceti or a roadmap on main already proves are
inputs, not targets:
- the real functions `TauCeti.Real.jacobiSn`, `TauCeti.Real.jacobiCn`, `TauCeti.Real.jacobiDn` of
  a real modulus with `k² < 1`, with their derivatives, periods and values at `K`
  (`TauCeti/Analysis/SpecialFunctions/JacobiElliptic/Basic.lean`), and the theory of
  [EllipticIntegrals](../EllipticIntegrals/README.md) behind them; 3.4 identifies them with the
  restrictions of the complex functions;
- Tau Ceti also proves the real addition theorems
  (`JacobiElliptic/Addition.lean`), the real limit `k → 1⁻` (`JacobiElliptic/Degeneration.lean`)
  and the pendulum (`JacobiElliptic/Pendulum.lean`); 5.1 and 3.5 restricted to real data are these;
- the theta functions, `λ` and `K = (π/2)θ₃²(0|τ)` with its Carlson form are SpecialFunctionsTheta's
  (its Layers 1–6), and Tau Ceti formalizes its Layer 1.1–1.2
  (`TauCeti/Analysis/SpecialFunctions/JacobiTheta/Basic.lean`);
- `℘` and its differential equation (Mathlib), Weierstrass's `ζ` with its quasi-periods (Tau Ceti,
  `TauCeti/Analysis/SpecialFunctions/Elliptic/WeierstrassZeta.lean`; Tau Ceti also has
  `Elliptic/Weierstrass/Zeta.lean` and `Sigma.lean`, with Legendre's relation for the lattice
  quasi-periods).

**Auxiliary results.** The no-common-zero statement of 1.1, the Taylor-coefficient argument of
3.2 and the star-shapedness of the domain of 8.1 are proved here as lemmas; they are not owned as
general theory.

**What it does not own.**
- *Theta functions and `λ`.* The four thetas, their transformations and products, `λ` and its
  mapping theorem, and `K` as a function of `τ` belong to
  [SpecialFunctionsTheta](../SpecialFunctionsTheta/README.md) (its Layers 1–6); this roadmap
  consumes them and adds no theta identity.
- *Lattice functions.* `℘`, `ζ`, `σ` of a general lattice, their quasi-periods and Legendre's
  relation `η₂ω₁ − η₁ω₂ = 2πi` belong to Mathlib, Tau Ceti and
  [ModularCurvesPartII](../ModularCurvesPartII/README.md) (its §1.4a); 7.1 and 7.5 only identify
  them with Jacobi's functions for the lattice `ℤτ + ℤ`. Lang (Ch. 18 §1, Theorem 1 and the
  Legendre relation, p. 241) is the lattice form; 7.4 is Jacobi's form, proved independently.
- *Elliptic integrals.* The real integrals, the AGM and the real Jacobi functions belong to
  [EllipticIntegrals](../EllipticIntegrals/README.md) and Tau Ceti; Carlson's integrals belong to
  Tau Ceti. The incomplete integrals of complex amplitude and the analytic continuation of `K`,
  `E` in `k` (other than the closed forms of 3.3 and 7.4) are not targets here.
- *Modular forms.* `λ` as a modular function for `Γ(2)`, the `j`-invariant and the Dedekind `η`
  belong to [ModularForms](../ModularForms/README.md) and SpecialFunctionsTheta; the theta series
  of lattices of [ThetaSeries](../ThetaSeries/README.md) do not meet this roadmap.
- *q-series.*
  [QSeriesPartitionsAndMockModularForms](../QSeriesPartitionsAndMockModularForms/README.md) states
  product identities for `θ₁` (its §5.1), which SpecialFunctionsTheta records; the Jacobi
  products of 6.3 are quotients of those.

**The boundary in one sentence:** this roadmap owns the Jacobian elliptic functions of a complex
variable as quotients of Neville's thetas, for a parameter `τ` and for a complex modulus, with
their lattice structure, their dependence on `λ` only, the transformations, addition theorems,
series and products, the identification with `℘` and `ζ` of `ℤτ + ℤ`, Jacobi's epsilon and zeta
functions with Legendre's relation, and `arcsn` as `R_F`; it consumes the theta functions, `λ` and
`K(τ)` of SpecialFunctionsTheta, the real Jacobi functions, Carlson's integrals and Weierstrass's
`ζ` of Tau Ceti, and `℘` of Mathlib.

## Exact supplier contracts

### From [SpecialFunctionsTheta](../SpecialFunctionsTheta/README.md)

- **Definitions** ([1.1](../SpecialFunctionsTheta/README.md#11-definitions-and-fourier-series),
  [6.1](../SpecialFunctionsTheta/README.md#61-modulus-λ-and-jacobis-inversion)): the four thetas,
  the multiplier, `thetaModulus`, `thetaComplModulus`, `modularLambda`, copied verbatim into
  `Suggested.lean`.
- **Holomorphy and conjugation** (1.2): for 1.1 and the reality of 3.4.
- **Quasi-periodicity and half periods** (1.3): for Layer 2, 7.3 and 6.1.
- **Quadratic relations, addition, derivative of a quotient** (2.2–2.3): for 1.2, 1.3, 5.1, 7.2.
- **Inversion `τ ↦ −1/τ`** (3.1): for 3.3, 4.1, 7.3, 7.4.
- **Products, zeros, theta constants, `θ₁′(0) = θ₂θ₃θ₄`** (4.2–4.3): for 1.1, 2.3, 6.3.
- **Landen's quotients** (4.4): for 4.4–4.5.
- **`λ`, its laws and mapping theorem, `K` and its Carlson form** (6.1–6.4): for 3.1, 3.3.
- **The combined theta functions** (6.6): the identities between `pq` and `φ_{m,n}` of
  Conventions.

### From Tau Ceti

- `TauCeti.Real.jacobiSn`, `TauCeti.Real.jacobiCn`, `TauCeti.Real.jacobiDn`,
  `TauCeti.Real.hasDerivAt_jacobiSn`, `TauCeti.Real.jacobiSn_zero_modulus`
  (`TauCeti/Analysis/SpecialFunctions/JacobiElliptic/Basic.lean`), for 3.4.
- `TauCeti.Real.legendreK`, `TauCeti.Real.legendreEc`, `TauCeti.Real.ofReal_legendreK_eq_carlsonRF`,
  `TauCeti.Real.ofReal_legendreEc_eq_carlsonRF_sub_carlsonRD`
  (`TauCeti/Analysis/SpecialFunctions/EllipticIntegral/`), for 3.3, 7.4.
- `Complex.carlsonRF`, `Complex.carlsonRD` (`EllipticIntegral/Carlson/Basic.lean`, `RJ.lean`), for
  3.3, 7.4, 8.1.
- `UpperHalfPlane.periodPair`, `PeriodPair.weierstrassP_smul`
  (`TauCeti/Analysis/Complex/UpperHalfPlane/PeriodPair.lean`), for 7.1, 7.5.
- `PeriodPair.weierstrassZeta`, `PeriodPair.hasDerivAt_weierstrassZeta`,
  `PeriodPair.weierstrassZeta_add_coe`, `PeriodPair.quasiPeriod`
  (`TauCeti/Analysis/SpecialFunctions/Elliptic/WeierstrassZeta.lean`), for 7.5.

### From Mathlib

- `jacobiTheta₂`, `jacobiTheta₂_functional_equation`, `jacobiTheta₂_add_left`, through the local
  copies.
- `Meromorphic`, `logDeriv`, `deriv`, for Layer 1 and 7.2.
- `PeriodPair`, `PeriodPair.weierstrassP`, `PeriodPair.meromorphic_weierstrassP`,
  `PeriodPair.derivWeierstrassP_sq`, for 7.1.
- `HasSum`, `HasProd`, for Layer 6.
- `Complex.cpow`, `slitPlane`, for 3.3, 7.4 and 8.1.
- `ODE_solution_unique_of_mem_Ioo`, for 3.4; `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`,
  for 3.2 and 8.1.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material lies outside this roadmap. It is recorded only to fix the boundary.
Contributors should not attempt it under this roadmap.

- **Analyticity in the modulus.** For fixed `u`, each `pq(u, k)` is meromorphic in `k²` (DLMF
  §22.17(ii)), with the expansions in `k²` and `k′²` (DLMF 22.10.4–22.10.9) and the
  `k`-derivatives (Lawden §3.10, pp. 81–83).
- **The amplitude and indefinite integrals of complex argument.** `am(u, k)` for complex `u` and the
  logarithmic primitives (Lawden §2.7, pp. 40–41; DLMF §22.14, §22.16(i)) need branches of `log`
  and `arcsin` along paths.
- **The other inverse functions.** `arccn`, `arcdn` and the nine others as Carlson integrals
  (DLMF 22.15.12–22.15.14 and §19.25(v)), and the multivalued inverses on the whole plane.
- **The expansion of `dn` over its poles** (DLMF 22.12.4), a conditionally convergent symmetric
  sum, and the double-series forms of 22.12.2–22.12.3.
- **Lattice and cyclic identities.** The symmetric and three-point addition formulas and the
  cyclic identities (DLMF §§22.8(ii)–(iii), 22.9), including the determinant identity 22.8.23 and
  the cyclic identity 22.9.23.
- **Elliptic functions of order two in general.** Every elliptic function of order two with two
  simple poles is a Möbius image of `sn` of a suitable lattice (Whittaker–Watson §22.1, p. 491;
  Armitage–Eberlein §3.6, p. 73).
- **Numerical evaluation.** The AGM and Landen algorithms for complex arguments (Armitage–Eberlein
  §5.4, pp. 119–124; Temme §12.4, p. 328; DLMF §22.20).

## References

- J. V. Armitage and W. F. Eberlein, *Elliptic Functions*, London Mathematical Society Student
  Texts 67, Cambridge University Press, 2006: §2.4, pp. 30–33; §2.5, p. 35; §2.6, pp. 39–41;
  §2.8, p. 46; §2.9, pp. 51–55; §3.6, p. 73; §4.7, p. 95; §4.8, pp. 99–101; Ch. 5, §5.1,
  (5.4)–(5.5c), p. 107; §5.2, Theorems 5.1 and 5.4, pp. 109–111; §5.4, pp. 119–124; §5.6,
  (5.48)–(5.54), Theorems 5.10–5.11, pp. 129–132, and Exercise 5.6.2, p. 133; §7.3, (7.54)–(7.59),
  pp. 178–179.
- K. Chandrasekharan, *Elliptic Functions*, Grundlehren 281, Springer, 1985, Ch. VII, §§1–6,
  pp. 99–107.
- M. Koecher and A. Krieg, *Elliptic Functions and Modular Forms*, Universitext, Springer, 2025,
  Ch. I, §2, Liouville's theorems 2.3–2.6, pp. 26–27.
- S. Lang, *Elliptic Functions*, 2nd ed., Graduate Texts in Mathematics 112, Springer, 1987,
  Ch. 18, §1, Theorem 1 and the Legendre relation, p. 241.
- D. F. Lawden, *Elliptic Functions and Applications*, Applied Mathematical Sciences 80, Springer,
  1989: Ch. 2, §§2.1–2.8, pp. 24–42; Ch. 3, §§3.5–3.6, pp. 63–67, §3.8, (3.8.29), p. 76, §3.9,
  pp. 77–80, §3.10, pp. 81–83; Ch. 6, §6.9, pp. 162–163; Ch. 8, §8.7, p. 221, §8.12,
  pp. 232–235, §8.14, p. 238.
- W. Magnus, F. Oberhettinger and R. P. Soni, *Formulas and Theorems for the Special Functions of
  Mathematical Physics*, 3rd ed., Grundlehren 52, Springer, 1966, §10.3, pp. 377–386, with the
  transformation table on p. 385; §10.4, p. 386; §10.6, p. 392.
- NIST *Digital Library of Mathematical Functions*, Chapter 22, <https://dlmf.nist.gov/22>, and
  the 2010 printed Handbook (F. W. J. Olver, D. W. Lozier, R. F. Boisvert and C. W. Clark, eds.,
  Cambridge University Press), Chapter 22 (W. P. Reinhardt and P. L. Walker), pp. 549–567, with
  the same numbering.
- D. Schwalm, *Lectures on Selected Topics in Mathematical Physics: Elliptic Functions and Elliptic
  Integrals*, IOP Publishing, 2015, §1.2, p. 1-6; §4.3, pp. 4-10–4-11.
- T. Takebe, *Elliptic Integrals and Elliptic Functions*, Moscow Lectures 9, Springer, 2023,
  Ch. 17: §17.1, (17.2)–(17.7), p. 290, Lemmas 17.2–17.3, pp. 291–292, and p. 294; §17.2,
  Proposition 17.4, p. 295; §17.3.1–§17.3.3, pp. 303–305; Theorem 17.16, p. 307.
- N. M. Temme, *Special Functions: An Introduction to the Classical Functions of Mathematical
  Physics*, Wiley, 1996, §12.3, pp. 322–327; §12.4, p. 328.
- E. T. Whittaker and G. N. Watson, *A Course of Modern Analysis*, 4th ed., Cambridge University
  Press, 1927, Chapter XXII: §22.1, p. 491; §22.11, pp. 491–493; §22.122, p. 494; §22.2,
  pp. 494–496; §22.35–§22.351, pp. 504–505; §22.4, p. 505; §22.42, pp. 507–508; §22.421, p. 508;
  §22.5, p. 508; §22.6, p. 510; §22.73, p. 517.
