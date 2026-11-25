# Roadmap: Coulomb functions

**Summary.** The Coulomb wave equation

```text
w″ + (1 − 2η/ρ − ℓ(ℓ + 1)/ρ²) w = 0
```

is the radial Schrödinger equation of a particle of positive energy in a Coulomb field, with
`ρ = kr`, `η` the Sommerfeld parameter and `ℓ` the angular momentum. It has a regular singularity
at `ρ = 0` with exponents `ℓ + 1` and `−ℓ` and an irregular singularity of rank one at infinity.
After the substitution `z = 2iρ` it is Whittaker's equation with `κ = iη` and `μ = ℓ + ½`, so its
solutions are confluent hypergeometric functions. The regular solution `F_ℓ(η, ρ)`, the irregular
solution `G_ℓ(η, ρ)` and the outgoing and incoming solutions `H^±_ℓ = G_ℓ ± iF_ℓ` are normalised
so that, as `ρ → ∞`, `F_ℓ ∼ sin θ_ℓ`, `G_ℓ ∼ cos θ_ℓ` with the phase
`θ_ℓ = ρ − η ln 2ρ − ℓπ/2 + σ_ℓ(η)`, where `σ_ℓ(η) = ph Γ(ℓ + 1 + iη)` is the Coulomb phase
shift.

[QuantumFoundations](../QuantumFoundations/README.md) §9.5 defines these functions and owns their
basic theory, which it needs for the spectral theory of the hydrogen atom: the equation,
real-valuedness, the Wronskians and the leading behaviour at infinity. This roadmap builds the
special-function library around that core, in seven layers. The first four stay with the variables
`(η, ρ)`: Whittaker forms and the cross-product, recurrences in `ℓ` and the continued fraction
for `F′_ℓ/F_ℓ`, the power and logarithmic series at the origin, the case `η = 0` through spherical
Bessel functions, integral representations and expansions in Bessel functions of `√(ηρ)`.
Layer 5 is the behaviour for large `ρ` and large `|η|`. Layer 6 passes to the variables
`ε = 1/η²`, `r = −ηρ`, where the regular solution `f(ε, ℓ; r)` of
`w″ + (ε + 2/r − ℓ(ℓ + 1)/r²) w = 0` is entire in `(ε, r)` and the scattering states (`ε > 0`)
and bound states (`ε < 0`) become one family. Layer 7 takes `ε = −1/n²`: the solutions that are
square integrable on `(0, ∞)` are exactly the hydrogenic radial functions, Laguerre polynomials
times `r^{ℓ+1}e^{−r/n}`, and they are orthonormal.

The organisation is by the subject, not by any one source. The roadmap synthesises Buchholz's
treatment of the Coulomb functions as Whittaker functions (*The Confluent Hypergeometric
Function*, 1969, Appendix I), Temme's account of the Kummer forms and of minimal solutions
(*Special Functions*, 1996, §7.3.2 and §13.3), Olver's reduction of the Coulomb equation to
Whittaker's equation (*Asymptotics and Special Functions*, Ch. 11, §4.3), Chadan and Sabatier's
free solutions (*Inverse Problems in Quantum Scattering Theory*, 2nd ed., 1989, Ch. I) and
Hall's derivation of the hydrogen bound states (*Quantum Theory for Mathematicians*, 2013,
§18.3). The equation numbers of the NIST *Digital Library of Mathematical Functions* (DLMF),
Chapter 33, are given as additional locators. Several formulas there are wrong as printed and
online; the targets below state the corrected forms and say where they differ.

## How to read the build

Layer 1 fixes the consumed core and adds what it lacks: the phase shift as a function with a
product formula, the normalising constant `C_ℓ(η)`, the Whittaker forms that connect the
definitions to SpecialFunctionsConfluent, and the cross-product of consecutive orders. Layer 2 is
the three-term recurrence in `ℓ` and the ladder relations, and from Pincherle's theorem the
continued fraction for `F′_ℓ/F_ℓ`. Layer 3 is the origin: the power series of `F_ℓ`, the
logarithmic series of `H^±_ℓ`, the leading behaviour of `G_ℓ`, and `η = 0`. Layer 4 is the
integral representations, read off from the Euler and Laplace integrals of the Kummer functions,
and the expansions in spherical Bessel functions and in `I_k`, `J_k` of `2(2|η|ρ)^{1/2}`. Layer 5
is the full asymptotic expansion for large `ρ` and the limiting forms for large `|η|`. Layer 6
defines `f`, `h`, `s`, `c`, proves their Wronskians, connects them with `F_ℓ`, `G_ℓ` and with the
Whittaker functions, and gives their recurrences, power series and the limit `ε → 0`. Layer 7
identifies the bound states. The `**Checks.**` and `### Examples` of each layer are statements to
prove; they test the conventions on explicit values.

## Conventions

- **Names.** `Suggested.lean` works in `TauCetiRoadmap.SpecialFunctionsCoulomb`. The functions of
  `(η, ρ)` are `coulombPhase ℓ η` for `σ_ℓ(η)`, `coulombC ℓ η` for `C_ℓ(η)`,
  `coulombTheta ℓ η ρ` for `θ_ℓ(η, ρ)`, `coulombF`, `coulombG`, `coulombHPlus`, `coulombHMinus`
  for `F_ℓ`, `G_ℓ`, `H⁺_ℓ`, `H⁻_ℓ`. The functions of `(ε, r)` are `coulombEnergyF ε ℓ r` for
  `f(ε, ℓ; r)`, `coulombEnergyH ε ℓ r` for `h(ε, ℓ; r)` and `coulombEnergyA ε ℓ` for `A(ε, ℓ)`,
  with the auxiliary `coulombKappa ε r` and `coulombStokesFactor ε r`; `hydrogenRadial n ℓ r` is
  `φ_{n,ℓ}(r)`. The coefficient sequences are `coulombSeriesCoeff` (3.1),
  `coulombSphericalCoeff` (4.2), `coulombBesselCoeff` (4.3), `coulombEnergyCoeff` (6.1), and
  `coulombEnergyGammaCoeff`, `coulombEnergyBetaCoeff`, `coulombEnergyDeltaCoeff` (6.4).
- **Parameters.** `ℓ : ℕ` and `η : ℝ` throughout; complex `ℓ` and `η` are beyond this roadmap.
  The functions of `ρ` are complex valued, `ℝ → ℂ`, with real values proved
  (QuantumFoundations §9.5); `F_ℓ` is defined for all real `ρ` and is real analytic there, while
  `θ_ℓ`, `G_ℓ` and `H^±_ℓ` are used for `ρ > 0` only.
- **The definitions of QuantumFoundations §9.5**, with `M(a, b, z) = Γ(b) 𝐌(a, b, z)` the Kummer
  function and `U` Tricomi's function, principal branches throughout:

```text
C_ℓ(η)   = 2^ℓ e^{−πη/2} |Γ(ℓ + 1 + iη)| / (2ℓ + 1)!
θ_ℓ(η,ρ) = ρ − η ln(2ρ) − ℓπ/2 + σ_ℓ(η)
F_ℓ(η,ρ) = C_ℓ(η) ρ^{ℓ+1} e^{iρ} M(ℓ + 1 + iη, 2ℓ + 2, −2iρ)
H^±_ℓ    = e^{±iθ_ℓ} (∓2iρ)^{ℓ+1±iη} U(ℓ + 1 ± iη, 2ℓ + 2, ∓2iρ)
G_ℓ      = (H⁺_ℓ + H⁻_ℓ)/2
```

  QuantumFoundations §9.5 specifies `σ_ℓ` as the continuous phase of `Γ(ℓ + 1 + iη)` in `η` with
  `σ_ℓ(0) = 0`; `Suggested.lean` realises it by the product formula of 1.2. It is not the
  principal argument: `σ_0(−20) = −40.69…`, while `arg Γ(1 − 20i) = −2.99…`.
- **The functions of `(ε, r)`.** For real `ε` and `r`, `f(ε, ℓ; r) = r^{ℓ+1} ∑_k α_k r^k` with
  `α₀ = 2^{ℓ+1}/(2ℓ + 1)!`, `α₁ = −α₀/(ℓ + 1)` and
  `k(k + 2ℓ + 1)α_k + 2α_{k−1} + εα_{k−2} = 0` (DLMF 33.19.1–33.19.2). This is the definition: it
  is entire in `(ε, r)` and has no junk values. `A(ε, ℓ) = ∏_{k=0}^{ℓ}(1 + εk²)`. For `ε ≠ 0`
  put `κ = iε^{−1/2}` for `ε > 0`, `κ = (−ε)^{−1/2}` for `ε < 0`, `r > 0` and
  `κ = −(−ε)^{−1/2}` for `ε < 0`, `r < 0` (DLMF 33.14.6), and `S(ε, r)` as in DLMF 33.14.8:
  `2 cos(π(−ε)^{−1/2})` for `ε < 0`, `r > 0`; `0` for `ε < 0`, `r < 0`; `e^{±πε^{−1/2}}` for
  `ε > 0` and `±r > 0`. Then

```text
h(ε, ℓ; r) = Γ(ℓ + 1 − κ)/(πκ^ℓ) · (W_{κ,ℓ+½}(2r/κ)
             + (−1)^ℓ S(ε, r) Γ(ℓ + 1 + κ)/(2(2ℓ + 1)!) · M_{κ,ℓ+½}(2r/κ))
```

  (DLMF 33.14.7). `h` is real; `coulombEnergyH` takes the real part of the complex expression, so
  that it is real valued by definition. Its junk values are at `ε = 0` and at the poles
  `ε = −1/n²`, `n > ℓ`, of `Γ(ℓ + 1 − κ)` for `r > 0`; theorems about `h` exclude them. With
  `B(ε, ℓ) = A(ε, ℓ)/(1 − e^{−2π/ε^{1/2}})` for `ε > 0` and `B = A` for `ε < 0`,
  `s = (B/2)^{1/2} f` and `c = (2B)^{−1/2} h` (DLMF 33.14.9–33.14.10), where `B > 0`.
- **Whittaker functions** are SpecialFunctionsConfluent's `M_{κ,μ}`, `W_{κ,μ}` on the principal
  branch, with `W_{κ,μ}(e^{iπ}x)` for `x > 0` read on the logarithmic plane
  (`Complex.whittakerWLog`). Bessel functions are SpecialFunctionsBessel's, `𝗃_n` and `𝗒_n` the
  spherical functions.
- **Wronskians** are `𝒲{u, v} = u v′ − u′ v`.

## Layer 1: the equation and its standard solutions

### 1.1 The consumed core

From QuantumFoundations §9.5, for `ρ > 0`: `F_ℓ` and `G_ℓ` are real; `F_ℓ, G_ℓ, H^±_ℓ` solve the
Coulomb wave equation; `H^±_ℓ = G_ℓ ± iF_ℓ`; `𝒲{G_ℓ, F_ℓ} = 𝒲{H^±_ℓ, F_ℓ} = 1`; and
`F_ℓ ∼ sin θ_ℓ`, `G_ℓ ∼ cos θ_ℓ` as `ρ → ∞` (DLMF 33.2.1–33.2.12, 33.10.1–33.10.2, p. 742,
p. 746; Temme, §7.3.2, pp. 178–179, and Exercise 7.11, p. 191; Buchholz, Appendix I, A, no. 14,
pp. 213–214). This roadmap proves none of these; every later target consumes them.

Two consequences are used often and are one line each from the core: `𝒲{H⁻_ℓ, H⁺_ℓ} = 2i`, and
`H⁻_ℓ = conj H⁺_ℓ` for `ρ > 0`.

QuantumFoundations §9.5 writes `H^±_ℓ` with the Tricomi function `U` of QuantumFoundations §9.4,
while the definitions here use SpecialFunctionsConfluent's `kummerU`. SpecialFunctionsConfluent 2.1
proves that the two functions agree, so §9.5's results hold for the definitions here.

**Checks.**
- `𝒲{H⁻_1, H⁺_1} = 2i` at `η = 0.7`, `ρ = 2.3` to 15 digits.
- `F_0(1, 1) = 0.22752621051056`, `G_0(1, 1) = 2.04309716210354`,
  `F_1(−1, 2) = 0.831877152552468`, `G_1(−1, 2) = −0.345746410383545`.
- `F_0(0, ρ) = sin ρ`, `G_0(0, ρ) = cos ρ`, `H^±_0(0, ρ) = e^{±iρ}` (DLMF 33.5.5, p. 744).

*Needs:* QuantumFoundations §9.5; SpecialFunctionsConfluent 2.1.

### 1.2 The phase shift and the normalising constant

- **The phase shift** (`coulombPhase_spec`): `coulombPhase ℓ` is continuous, vanishes at
  `η = 0`, and `Γ(ℓ + 1 + iη) = |Γ(ℓ + 1 + iη)| e^{iσ_ℓ(η)}`, so it is the `σ_ℓ` of
  QuantumFoundations §9.5. The definition is the product formula
  `σ_ℓ(η) = −γη + ∑_{n≥1}(η/n − arctan(η/n)) + ∑_{k=1}^{ℓ} arctan(η/k)`, which is the argument
  of Weierstrass's product for `Γ` (DLMF 33.2.10, p. 742; Temme, p. 178, where
  `σ_λ = arg Γ(λ + 1 + iη)` is called the Coulomb phase shift).
- **The closed form of `C_ℓ²`** (`coulombC_sq`): for `η ≠ 0`,
  `C_ℓ(η)² = 4^ℓ · 2πη/(e^{2πη} − 1) · ∏_{k=1}^{ℓ}(η² + k²)/((2ℓ + 1)!)²` (DLMF 33.2.6,
  p. 742), from `Γ(1 + iη)Γ(1 − iη) = πη/sinh(πη)` (Mathlib's `Complex.Gamma_mul_Gamma_one_sub`)
  and the functional equation.
- **The ratio** (`coulombC_succ`):
  `C_{ℓ+1}(η) = ((ℓ + 1)² + η²)^{1/2}/((ℓ + 1)(2ℓ + 3)) · C_ℓ(η)` (DLMF 33.4.1 with 33.13.2,
  p. 744, p. 748).
- **Elementary properties**, stated in prose: `σ_{ℓ+1}(η) − σ_ℓ(η) = arctan(η/(ℓ + 1))`;
  `σ_ℓ(−η) = −σ_ℓ(η)`; `C_ℓ(0) = 2^ℓ ℓ!/(2ℓ + 1)! = 1/(2ℓ + 1)!!` (DLMF 33.5.6, p. 744);
  `C_ℓ(η) > 0`.

*Suggested proof:* for the phase, the logarithm of Weierstrass's product (Mathlib's
`Complex.GammaSeq`) gives `ln Γ(1 + iη)` as a convergent series whose imaginary part is the
series above; continuity is uniform convergence on compact sets, since
`|x − arctan x| ≤ |x|³/3`.

**Checks.**
- `σ_0(0.5) = −0.244058298905428`, equal to `Im ln Γ(1 + 0.5i)`.
- `σ_0(1) = −0.301640320467533` and `σ_1(1) = 0.483757842929915`; the difference is
  `arctan 1 = π/4`.
- Negative control: `σ_2(−3) = −3.2851902667142`, while the principal argument of
  `Γ(3 − 3i)` is `2.99799504046539`; the principal argument is not continuous in `η`.
- `C_0(0.8) = 0.182206276747179`, `C_2(−1.5) = 0.461225725353844`, `C_3(0) = 1/105`;
  `C_0(1) = 0.108422513102073` and `C_1(1) = 0.0511108628318419 = (√2/3) C_0(1)`.
- Negative control: without the factor `e^{−πη/2}`, `C_0(0.8)²` would be
  `|Γ(1 + 0.8i)|² = 0.409852652879752` instead of `2π·0.8/(e^{1.6π} − 1) = 0.0331991272860696`.

*Needs:* Mathlib `Complex.Gamma`, `Complex.GammaSeq`, `Complex.Gamma_mul_Gamma_one_sub`,
`Complex.Gamma_conj`, `Real.eulerMascheroniConstant`, `Real.arctan`.

### 1.3 Whittaker forms

- **`F_ℓ` through `M_{κ,μ}`** (`coulombF_eq_whittakerM`), both signs, for `ρ > 0`:
  `F_ℓ(η, ρ) = C_ℓ(η) 2^{−ℓ−1} (∓i)^{ℓ+1} M_{±iη,ℓ+½}(±2iρ)` (DLMF 33.2.3, p. 742; Buchholz,
  Appendix I, A, no. 14, pp. 213–214, where `F_L` is a multiple of `𝓜_{iη,L+½}(2iρ)`).
- **`H⁺_ℓ` through `W_{κ,μ}`** (`coulombHPlus_eq_whittakerW`), for `ρ > 0`:
  `H⁺_ℓ(η, ρ) = (−i)^ℓ e^{πη/2 + iσ_ℓ(η)} W_{−iη,ℓ+½}(−2iρ)` (DLMF 33.2.7, p. 742; Buchholz,
  loc. cit., where `G_L` is a combination of `W_{iη,L+½}(2iρ)` and `𝓜_{iη,L+½}(2iρ)`). The form
  of `H⁻_ℓ`, with the signs of `i` reversed, follows by conjugation and is stated in prose.
- **Analyticity**, stated in prose: `F_ℓ` extends to an entire function of `ρ`, and `H^±_ℓ`
  extend analytically to `ℂ ∖ (−∞, 0]` and to the logarithmic plane through `kummerULog`.

After `z = ∓2iρ` the Coulomb equation is Whittaker's equation
`W″ = (¼ − κ/z + (μ² − ¼)/z²)W` with `κ = ∓iη`, `μ = ℓ + ½`. Olver writes the Coulomb equation
with `z = 2ρ` as `d²W/dz² = (−¼ + k/z + (m² − ¼)/z²)W`, `k = η`, `m = ℓ + ½` (Olver, Ch. 11,
§4.3, eq. (4.02), pp. 401–402), and identifies its solutions with Whittaker functions of `iz` in
Exercise 4.5, p. 403.

*Suggested proof:* `M_{κ,μ}(z) = e^{−z/2} z^{½+μ} M(½ + μ − κ, 1 + 2μ, z)` and Kummer's
transformation `M(a, b, z) = e^z M(b − a, b, −z)`
([SpecialFunctionsParabolicCylinder](../SpecialFunctionsParabolicCylinder/README.md) 1.4) give
the two forms of `F_ℓ`; the powers `(±2iρ)^{ℓ+1}` are integer powers. For `H⁺_ℓ`,
`W_{κ,μ}(z) = e^{−z/2} z^{½+μ} U(½ + μ − κ, 1 + 2μ, z)` gives the form directly, with
`(−2iρ)^{ℓ+1+iη} = (−2iρ)^{ℓ+1} e^{iη ln 2ρ} e^{πη/2}` on the principal branch.

**Checks.**
- At `ℓ = 1`, `η = 0.7`, `ρ = 2.3`, both forms of 33.2.3 give `0.657526749516749`, and 33.2.7
  gives `H⁺_1 = 1.21976098813861 + 0.657526749516749 i`.
- Negative control: the factor `e^{πη/2}` comes from `(−2iρ)^{iη} = e^{iη(ln 2ρ − iπ/2)}`; with
  the branch `ph(−2iρ) = 3π/2` the definition of `H⁺_1` at the same point is multiplied by
  `e^{−1.4π} = 0.0122990935428127`.

*Needs:* 1.1, 1.2; SpecialFunctionsConfluent, its Conventions, 1.4–1.6 and 2.1;
SpecialFunctionsParabolicCylinder 1.4.

### 1.4 The cross-product

- **Consecutive orders** (`coulombF_mul_coulombG_sub`): for `ρ > 0`,
  `F_ℓ G_{ℓ+1} − F_{ℓ+1} G_ℓ = (ℓ + 1)/((ℓ + 1)² + η²)^{1/2}` (DLMF 33.2.13 at `ℓ + 1`,
  p. 742).

*Suggested proof:* eliminate the derivatives from `𝒲{G_ℓ, F_ℓ} = 1` with the second ladder
relation of 2.1, `X′_ℓ = S_{ℓ+1} X_ℓ − R_{ℓ+1} X_{ℓ+1}` for `X = F, G`; this gives
`𝒲{G_ℓ, F_ℓ} = R_{ℓ+1}(F_ℓ G_{ℓ+1} − F_{ℓ+1} G_ℓ)`.

**Checks.**
- At `η = 0.7`, `ρ = 2.3`: `ℓ = 0` gives `0.81923192051904 = 1/(1.49)^{1/2}`, and `ℓ = 2` gives
  `0.973841209741793 = 3/(9.49)^{1/2}`.
- At `η = 0`: `F_0 G_1 − F_1 G_0 = 1`, which for `ρ` large is `sin ρ · sin ρ + cos ρ · cos ρ`.

*Needs:* 1.1, 2.1.

## Layer 2: recurrences in `ℓ` and continued fractions

### 2.1 The recurrence and the ladder relations

Put `R_L = (1 + η²/L²)^{1/2}`, `S_L = L/ρ + η/L`, `T_L = S_L + S_{L+1}`.

- **The three-term recurrence** (`coulomb_recurrence`): each `X ∈ {F, G, H⁺, H⁻}` satisfies
  `R_{ℓ+1} X_ℓ − T_{ℓ+1} X_{ℓ+1} + R_{ℓ+2} X_{ℓ+2} = 0` for `ρ > 0` (DLMF 33.4.2, p. 744;
  Temme, §13.3, Example 4, p. 339, multiplied through by `L(L + 1)`).
- **The ladder relations** (`hasDerivAt_coulomb_ladder`): each `X` satisfies
  `X′_{ℓ+1} = R_{ℓ+1} X_ℓ − S_{ℓ+1} X_{ℓ+1}` and `X′_ℓ = S_{ℓ+1} X_ℓ − R_{ℓ+1} X_{ℓ+1}` for
  `ρ > 0` (DLMF 33.4.3–33.4.4, p. 744).

*Suggested proof:* the contiguous relations of `M` and `U` in their first two parameters
(SpecialFunctionsConfluent 4.1), with the ratio of 1.2 for `F_ℓ` and the phase step of 1.2 for
`H^±_ℓ`; `G_ℓ` is the average. The recurrence is the ladder relations combined.

**Checks.**
- At `ℓ = 2`, `η = −0.9`, `ρ = 3.1` the residuals of all three relations for `F`, `G`, `H^±` are
  below `10⁻¹⁶`.
- Negative control: with `S_L = L/ρ − η/L` the recurrence at `ℓ = 1`, `η = −0.9`, `ρ = 3.1` has
  residual `−1.47744400493967` for `F`.
- At `η = 0`, `R_L = 1`, `S_L = L/ρ`, and the recurrence is that of `ρ 𝗃_ℓ(ρ)`:
  `𝗃_ℓ + 𝗃_{ℓ+2} = (2ℓ + 3)/ρ · 𝗃_{ℓ+1}`.

*Needs:* 1.1, 1.2; SpecialFunctionsConfluent 4.1.

### 2.2 Minimality and the continued fraction for `F′_ℓ/F_ℓ`

- **Minimality:** for fixed `η` and `ρ > 0`, `ℓ ↦ F_ℓ(η, ρ)` is a minimal solution of the
  recurrence of 2.1 and `ℓ ↦ G_ℓ(η, ρ)` is dominant; `F_{ℓ+1}/F_ℓ ∼ ρ/(2ℓ)` and
  `G_{ℓ+1}/G_ℓ ∼ 2ℓ/ρ` as `ℓ → ∞` (Temme, §13.3, Example 4, pp. 339–340, from case [1] of the
  theorem of that section).
- **The continued fraction** (`tendsto_convs_coulombF`): for `ρ > 0` and `F_ℓ(η, ρ) ≠ 0`,
  `F′_ℓ/F_ℓ = S_{ℓ+1} − R²_{ℓ+1}/(T_{ℓ+1} − R²_{ℓ+2}/(T_{ℓ+2} − ⋯))`, convergent (DLMF 33.8.1,
  p. 745), as an instance of Pincherle's theorem of SpecialFunctionsEiLiErfIncompleteGamma 4.1
  applied to the minimal solution `F_ℓ` and the second ladder relation. In `Suggested.lean` it is
  the limit of the convergents of a `GenContFract ℝ` with head `S_{ℓ+1}`, partial numerators
  `−R²_{ℓ+n+1}` and partial denominators `T_{ℓ+n+1}`. At the zeros of `F_ℓ(η, ·)`, of which there
  are infinitely many, the left side is undefined and the fraction diverges; DLMF, after 33.8.3,
  says that 33.8.1 converges for all finite `ρ`, in print and online.
- **Barnett's formulas**, stated in prose: for `ρ > 0` and `F_ℓ(η, ρ) ≠ 0`, with
  `p + iq = H⁺′_ℓ/H⁺_ℓ` and `u = F′_ℓ/F_ℓ`, `F_ℓ = ±(q/((u − p)² + q²))^{1/2}`,
  `G_ℓ = (u − p)F_ℓ/q`, `G′_ℓ = (up − p² − q²)F_ℓ/q` (DLMF 33.8.4–33.8.5, p. 745); these are
  algebra from `𝒲{G_ℓ, F_ℓ} = 1` and `q > 0`.

**Checks.**
- At `ℓ = 1`, `η = 0.7`, `ρ = 2.3`: the fraction gives `0.757107891228786 = F′_1/F_1`, and with
  `q = 0.520790396737899` Barnett's formulas return `F_1`, `G_1 = 1.21976098813861` and
  `G′_1 = −0.597360004200212`.
- At `η = 0`, `ℓ = 0`, `ρ = 1` the fraction gives `0.642092615934331 = cot 1 = F′_0/F_0`.
- Negative control: with `R_L` in place of `R²_L` the fraction at `ℓ = 1`, `η = 0.7`, `ρ = 2.3`
  gives `0.784689045890256`.
- Negative control for the hypothesis `F_ℓ ≠ 0`: at `η = 0`, `ℓ = 0`, `ρ = π`, where
  `F_0 = sin ρ` vanishes, the approximants of depth 5, 10, 20 are `−1090.09945891328`,
  `−2.47499339243593·10¹⁰` and `−3.90485668249007·10³⁰` (the last needs more than 30 working
  digits, since its denominator cancels to about `10⁻³⁰`).

*Needs:* 2.1; SpecialFunctionsEiLiErfIncompleteGamma 4.1; Mathlib `GenContFract`,
`GenContFract.convs`, `Stream'.Seq.ofStream`.

## Layer 3: the origin, the power series and `η = 0`

### 3.1 The power series of `F_ℓ`

- **The series** (`hasSum_coulombF`): for every real `ρ`,
  `F_ℓ(η, ρ) = C_ℓ(η) ∑_{k≥ℓ+1} A^ℓ_k(η) ρ^k`, with `A^ℓ_{ℓ+1} = 1`, `A^ℓ_{ℓ+2} = η/(ℓ + 1)` and
  `(k + ℓ)(k − ℓ − 1)A^ℓ_k = 2ηA^ℓ_{k−1} − A^ℓ_{k−2}` (DLMF 33.6.1–33.6.3, p. 745). In
  `Suggested.lean` the sum runs over `j = k − ℓ − 1 : ℕ` with `coulombSeriesCoeff ℓ η j`.
- **Consequences**, stated in prose: `F_ℓ ∼ C_ℓ ρ^{ℓ+1}` and `F′_ℓ ∼ (ℓ + 1)C_ℓ ρ^ℓ` as
  `ρ → 0` (DLMF 33.5.1, p. 744); the closed form
  `A^ℓ_k = (−i)^{k−ℓ−1}/(k − ℓ − 1)! · F(ℓ + 1 − k, ℓ + 1 − iη; 2ℓ + 2; 2)` (DLMF 33.6.4,
  p. 745), a terminating Gauss sum.

*Suggested proof:* expand `M(ℓ + 1 + iη, 2ℓ + 2, −2iρ)` and `e^{iρ}`, multiply the series and
check the recurrence; or substitute the series into the equation, which gives the recurrence and
fixes the first two coefficients up to the normalisation `C_ℓ`.

**Checks.**
- `coulombSeriesCoeff 0 1` begins `1, 1, 1/6`.
- At `η = 0`, `ℓ = 0` the coefficients begin `1, 0, −1/6`, those of `sin ρ`, and `C_0(0) = 1`.
- At `ℓ = 1`, `η = 0.7`: `A^1_4 = (2·0.7²/2 − 1)/10 = −0.051`, equal to the Gauss sum of 33.6.4;
  the series at `ρ = 2.3` gives `0.657526749516749`, and at `ℓ = 0`, `η = −1.2`, `ρ = −1.5` it
  gives `−13.5122029357791 = F_0(−1.2, −1.5)`.
- Negative control: with `+A^ℓ_{k−2}` in the recurrence the series at `ℓ = 1`, `η = 0.7`,
  `ρ = 2.3` gives `1.64177749615809`.

*Needs:* 1.1, 1.2; Mathlib `Complex.regularizedHGFun`.

### 3.2 The irregular solutions at the origin

- **Leading behaviour** (`tendsto_pow_mul_coulombG`): `ρ^ℓ G_ℓ(η, ρ) → 1/((2ℓ + 1)C_ℓ(η))` as
  `ρ → 0⁺` (DLMF 33.5.2, p. 744).
- **The derivative**, stated in prose: `G′_ℓ ∼ −ℓρ^{−ℓ−1}/((2ℓ + 1)C_ℓ)` for `ℓ ≥ 1`
  (DLMF 33.5.2).
- **The logarithmic series of `H^±_ℓ`** (`hasSum_coulombH_log`): for `η ≠ 0` and `ρ > 0`,

```text
H^±_ℓ = e^{±iθ_ℓ}/((2ℓ + 1)! Γ(−ℓ ± iη)) · ( ∑_{k≥0} (a)_k/((2ℓ + 2)_k k!) (∓2iρ)^{a+k}
          · (ln(∓2iρ) + ψ(a + k) − ψ(1 + k) − ψ(2ℓ + 2 + k))
        − ∑_{k=1}^{2ℓ+1} (2ℓ + 1)! (k − 1)!/((2ℓ + 1 − k)! (1 − a)_k) (∓2iρ)^{a−k} )
```

  with `a = ℓ + 1 ± iη` (DLMF 33.6.5, p. 745, with `Γ(−ℓ ± iη)`: the printed handbook has
  `Γ(−ℓ + iη)` for both signs, which is wrong for the lower sign and is corrected online). In
  `Suggested.lean` each sign is a `HasSum` for the logarithmic sum, with the prefactor and the
  finite sum on the other side. DLMF 33.6.5 states no condition on `η`, in print and online; at
  `η = 0` the factor `1/Γ(−ℓ)` is `0` and the denominators `(1 − a)_k = (−ℓ)_k`,
  `ℓ + 1 ≤ k ≤ 2ℓ + 1`, vanish, so the right side is undefined. The case `η = 0` is 3.3.
- The real form of `G_ℓ` with `ln 2ρ` and the coefficients of DLMF 33.6.6–33.6.8 is stated in
  prose.

**Checks.**
- At `ℓ = 2`, `η = 0.7`: `ρ² G_2 · 5C_2(0.7)` is `0.999650248217158` at `ρ = 10⁻³` and
  `0.999996500024833` at `ρ = 10⁻⁵`.
- The logarithmic series at `ℓ = 1`, `η = 0.7`, `ρ = 2.3` gives
  `H^±_1 = 1.21976098813861 ± 0.657526749516749 i`.
- Negative control: with the printed `Γ(−ℓ + iη)` for the lower sign the series gives
  `−0.590963432613256 + 1.2533636805927 i` instead of `H⁻_1`.
- At `η = 10⁻⁶`, `ℓ = 1`, `ρ = 2.3` the series gives `0.456021179244666 + 0.990495436539165 i`,
  equal to `H⁺_1` from the definition.
- Negative control for `η ≠ 0`: at `η = 0`, `ℓ = 0`, read with `1/Γ(0) = 0` and `x/0 = 0` as
  Mathlib does, the right side is `0`, while `H⁺_0(0, ρ) = e^{iρ}`.
- At `η = 0`, `ℓ = 0`: `G_0 = cos ρ → 1 = 1/C_0(0)`.

*Suggested proof:* the logarithmic case of `U` with integer `b = 2ℓ + 2`
(SpecialFunctionsConfluent 1.4) in the definition of `H^±_ℓ`, with `a = ℓ + 1 ± iη` and
`z = ∓2iρ`; for `η ≠ 0`, `a` is not an integer, so `Γ(a − b + 1) = Γ(−ℓ ± iη)` and the
`(1 − a)_k` are nonzero.

*Needs:* 1.1–1.3, 3.1; SpecialFunctionsConfluent 1.4; Mathlib `Complex.digamma`,
`ascPochhammer`.

### 3.3 The case `η = 0` and small `η`

- **Spherical Bessel functions** (`coulombF_zero_left`, `coulombG_zero_left`):
  `F_ℓ(0, ρ) = ρ𝗃_ℓ(ρ)` for every real `ρ`, and `G_ℓ(0, ρ) = −ρ𝗒_ℓ(ρ)` for `ρ > 0` (DLMF 33.5.3,
  p. 744; Chadan–Sabatier, Ch. I, §1, (I.1.7)–(I.1.9), pp. 2–3, where the free regular solution
  is `(πkr/2)^{1/2} J_{ℓ+½}(kr)`).
- **Small `|η|`**, stated in prose: `σ_0(η) ∼ −γη` as `η → 0` (DLMF 33.5.7, p. 744), from the
  product formula of 1.2.
- **Large `ℓ`**, stated in prose: for fixed `η`, `F_ℓ ∼ C_ℓ ρ^{ℓ+1}` for `ρ ≠ 0`,
  `G_ℓ ∼ ρ^{−ℓ}/((2ℓ + 1)C_ℓ)` for `ρ > 0`, and `C_ℓ(η) ∼ e^{−πη/2}/(2ℓ + 1)!!` as `ℓ → ∞`
  (DLMF 33.5.8–33.5.9, p. 744).

*Suggested proof:* at `η = 0`, `e^{iρ} M(ℓ + 1, 2ℓ + 2, −2iρ)` is the `₀F₁` of `𝗃_ℓ` by Kummer's
second transformation (SpecialFunctionsConfluent 6.2, DLMF 13.6.9). The functions
`U(ℓ + 1, 2ℓ + 2, ∓2iρ)` are `K_{ℓ+½}(∓iρ)` up to elementary factors (DLMF 13.6.10, also in 6.2),
hence spherical Hankel functions, and `G_ℓ(0, ·)` is the average of `H^±_ℓ(0, ·)`.

**Checks.**
- At `ℓ = 2`, `ρ = 1.7`: `F_2(0, 1.7) = 0.265117664379567 = 1.7 𝗃_2(1.7)` and
  `G_2(0, 1.7) = 1.74509260862806 = −1.7 𝗒_2(1.7)`.
- Negative control: `+ρ𝗒_2(ρ)` gives `−1.74509260862806`, the sign that DLMF 33.5.3 excludes.
- `σ_0(0.01)/(−0.01γ) = 0.999930586620975`.
- At `η = 0.5`, `ρ = 2`: `F_ℓ/(C_ℓ ρ^{ℓ+1})` is `1.0039171569777` at `ℓ = 10` and
  `1.00029281507895` at `ℓ = 40`.

*Needs:* 1.1–1.3; SpecialFunctionsBessel, its Conventions and 3.1–3.2;
SpecialFunctionsConfluent 6.2.

## Layer 4: integrals and Bessel-function series

### 4.1 Integral representations

- **Euler's integral for `F_ℓ`** (`coulombF_eq_integral`): for real `ρ`,
  `F_ℓ = ρ^{ℓ+1} 2^ℓ e^{iρ − πη/2}/|Γ(ℓ + 1 + iη)| · ∫₀¹ e^{−2iρt} t^{ℓ+iη} (1 − t)^{ℓ−iη} dt`
  (DLMF 33.7.1, p. 745).
- **The Laplace integral for `H⁻_ℓ`** (`coulombHMinus_eq_integral`): for `ρ > 0`,
  `H⁻_ℓ = e^{−iρ} ρ^{−ℓ}/((2ℓ + 1)! C_ℓ(η)) · ∫₀^∞ e^{−t} t^{ℓ−iη} (t + 2iρ)^{ℓ+iη} dt`
  (DLMF 33.7.2, p. 745).
- **The integrals 33.7.3 and 33.7.4** for `H⁻_ℓ` and `H⁺_ℓ` along rotated paths are stated in
  prose (DLMF 33.7.3–33.7.4, p. 745).

*Suggested proof:* Euler's integral and the Laplace integral of SpecialFunctionsConfluent 2.1 with
`a = ℓ + 1 ± iη`, `b = 2ℓ + 2`, after `t ↦ 1 − t` and `t ↦ t/(2iρ)`; the second is the rotation of
the contour of the Laplace integral to the ray through `2iρ`, legitimate by the exponential decay
of the integrand in the sector between (AsymptoticExpansions 4.3).

**Checks.**
- At `ℓ = 1`, `η = 0.7`, `ρ = 2.3`, 33.7.1 gives `0.657526749516749` and 33.7.2 gives
  `1.21976098813861 − 0.657526749516749 i`; 33.7.4 along `t = −1 − iu`, `u ≥ 0`, gives `H⁺_1`.
- At `η = 0`, `ℓ = 0`: `ρ e^{iρ} ∫₀¹ e^{−2iρt} dt = sin ρ`.
- Negative control: with `|Γ(ℓ + 1 + iη)|²` in place of `|Γ(ℓ + 1 + iη)|` in 33.7.1 the value at
  `ℓ = 0`, `η = 0` is still right (`Γ(1) = 1`), but at `ℓ = 1`, `η = 0.7` it is divided by
  `|Γ(2 + 0.7i)| = 0.857803153294405`.

*Needs:* 1.1, 1.2; SpecialFunctionsConfluent 2.1; AsymptoticExpansions 4.3.

### 4.2 Expansions in spherical Bessel functions

- **The expansion** (`hasSum_coulombF_sphericalBesselJ`): for every real `ρ`,
  `F_ℓ(η, ρ) = ρ ∑_{k≥0} a_k 𝗃_{ℓ+k}(ρ)` with `a_{−1} = 0`, `a_0 = (2ℓ + 1)!! C_ℓ(η)` and
  `(k(k + 2ℓ + 1)/(2k + 2ℓ + 1)) a_k = 2η a_{k−1} − ((k − 2)(k + 2ℓ − 1)/(2k + 2ℓ − 3)) a_{k−2}`
  for `k ≥ 1` (DLMF 33.9.1–33.9.2, pp. 745–746, where the series is said to converge for all
  finite `η` and `ρ`; `coulombSphericalCoeff ℓ η k = a_k`, with `(2ℓ + 1)!!` as
  `Nat.doubleFactorial`).

*Suggested proof:* both sides are entire in `ρ`; substitute the series into the Coulomb equation
and use the recurrences and the equation of `𝗃_n` (SpecialFunctionsBessel 3.1–3.2): the
coefficient of each `𝗃_{ℓ+k}` gives the recurrence of the `a_k`, and the leading term
`ρ^{ℓ+1}a_0/(2ℓ + 1)!!` as `ρ → 0` fixes `a_0` against 3.1. The `a_k` grow at most
geometrically, while `𝗃_{ℓ+k}(ρ)` decays like `ρ^{ℓ+k}/(2ℓ + 2k + 1)!!`.

**Checks.**
- `a_k/C_ℓ(η)` begins `1, 3, 5, 14/3` at `ℓ = 0`, `η = 1`, and `3, 5.25, 5.145, 1.5015` at
  `ℓ = 1`, `η = 0.7`.
- The sum gives `0.657526749516749 = F_1(0.7, 2.3)` and `0.735868466687586 = F_0(−1.3, 4.1)`,
  and for negative `ρ` `0.0968886051511807 = F_1(0.7, −2.3)` and
  `−11.0769198447575 = F_2(−0.9, −3.4)`.
- Negative control: with `+((k − 2)(k + 2ℓ − 1)/(2k + 2ℓ − 3)) a_{k−2}` on the right of the
  recurrence the sum at `(ℓ, η, ρ) = (1, 0.7, 2.3)` is `0.689661338402147`.
- At `η = 0`, `a_k = 0` for `k ≥ 1`, and the expansion is `F_ℓ(0, ρ) = ρ𝗃_ℓ(ρ)` of 3.3.

*Needs:* 1.2, 3.1, 3.3; SpecialFunctionsBessel 3.1–3.2; Mathlib `Nat.doubleFactorial`.

### 4.3 Expansions in `I_k` and `J_k`

With `t = 2|η|ρ` and `b_{2ℓ} = 0`, `b_{2ℓ+1} = 1`, `b_{2ℓ+2} = 0`,
`4η²(k − 2ℓ) b_{k+1} + k b_{k−1} + b_{k−2} = 0` for `k ≥ 2ℓ + 2` (DLMF 33.9.5, p. 746;
`coulombBesselCoeff ℓ η j = b_{2ℓ+1+j}`):

- **Repulsive case** (`hasSum_coulombF_besselI`): for `η > 0`, `ρ > 0`,
  `F_ℓ = C_ℓ (2ℓ + 1)!/(2η)^{2ℓ+1} ρ^{−ℓ} ∑_{k≥2ℓ+1} b_k t^{k/2} I_k(2t^{1/2})` (DLMF 33.9.3,
  p. 746).
- **Attractive case** (`hasSum_coulombF_besselJ`): for `η < 0`, `ρ > 0`,
  `F_ℓ = C_ℓ (2ℓ + 1)!/(2|η|)^{2ℓ+1} ρ^{−ℓ} ∑_{k≥2ℓ+1} (−1)^{k+1} b_k t^{k/2} J_k(2t^{1/2})`.
  DLMF 33.9.4 omits the sign `(−1)^{k+1}`, in print and online; without it the sum is not `F_ℓ`.

*Suggested proof:* both expansions are Buchholz's expansion
`𝐌(a, b, z) = e^{z/2} ∑_s A_s (z/2)^s 𝐅(b + s, −(b − 2a)z/2)` of SpecialFunctionsConfluent 6.3
(DLMF 13.11.3–13.11.4) at `a = ℓ + 1 + iη`, `b = 2ℓ + 2`, `z = −2iρ`, where
`−(b − 2a)z/2 = 2ηρ` and `e^{z/2}` cancels the factor `e^{iρ}` of `F_ℓ`. With
`b_{2ℓ+1+s} = (−i)^s A_s/(2η)^s` the recurrence of the `A_s` becomes that of the `b_k`
(`A_2 = ℓ + 1` gives `b_{2ℓ+3} = −(2ℓ + 2)/(8η²)`), and `t^{k/2} I_k(2t^{1/2}) = t^k 𝐅(k + 1, t)`
turns the sum into the right side of 33.9.3. For `η < 0` the argument `2ηρ = −t` is negative:
`(−t)^k 𝐅(k + 1, −t) = (−1)^k t^{k/2} J_k(2t^{1/2})`, and with the sign of `(2η)^{2ℓ+1}` this is
the factor `(−1)^{k+1}`.

**Checks.**
- `coulombBesselCoeff 0 1` begins `1, 0, −1/4, −1/12`.
- 33.9.3 at `(ℓ, η, ρ) = (1, 0.7, 2.3)` gives `0.657526749516749`, and at `(0, 1.5, 4)` gives
  `1.11855596881179`.
- The corrected 33.9.4 at `(0, −0.7, 1.2)` gives `0.61945359230723` and at `(3, −1.1, 2)` gives
  `0.32059442892911`, both equal to `F_ℓ`.
- Negative control: the printed 33.9.4 differs from `F_ℓ` by `−0.110492211106306` at
  `(0, −0.7, 1.2)` and by `2.15488800509365` at `(0, −1.5, 4)`.
- `b_{2ℓ+1+s} = (−i)^s A_s/(2η)^s` for `s < 12`, with `A_s` of DLMF 13.11.4 at
  `a = ℓ + 1 + iη`, `b = 2ℓ + 2`, at `(ℓ, η) = (0, 0.7)` and `(2, −1.3)`.

*Needs:* 1.1, 1.2; SpecialFunctionsConfluent 6.3; SpecialFunctionsBessel, its Conventions;
Mathlib `Complex.besselJ`.

## Layer 5: large `ρ` and large `|η|`

### 5.1 The asymptotic expansion for large `ρ`

- **The expansion of `H⁺_ℓ`** (`coulombHPlus_sub_sum_isBigO`): for every `N`, as `ρ → ∞` with
  `η` fixed, `H⁺_ℓ − e^{iθ_ℓ} ∑_{k<N} (a)_k (b)_k/(k! (2iρ)^k) = O(ρ^{−N})` with
  `a = ℓ + 1 + iη`, `b = −ℓ + iη` (DLMF 33.11.1, p. 747; the handbook prints `(∓2iρ)^k`, which is
  corrected online to `(±2iρ)^k`). The Pochhammer symbols are Mathlib's `ascPochhammer`.
- **The expansion of `H⁻_ℓ`**, stated in prose: the same with `−iη` and `(−2iρ)^k`, by
  conjugation.
- **The real form**, stated in prose: `F_ℓ ∼ g cos θ_ℓ + f sin θ_ℓ`,
  `G_ℓ ∼ f cos θ_ℓ − g sin θ_ℓ` with the series `f, g, f̂, ĝ` of DLMF 33.11.2–33.11.6, p. 747,
  whose leading terms are QuantumFoundations' unit-amplitude asymptotics. The formal series
  satisfy `f ĝ − g f̂ = 1`, the Wronskian; DLMF 33.11.7 prints `g f̂ − f ĝ = 1`, with the
  opposite sign, in print and online.

*Suggested proof:* the expansion of `U(a, b, z)` for large `z` (SpecialFunctionsConfluent 5.1), at
`z = ∓2iρ`; the Wronskian identity is 1.1 applied to the truncations, with the remainders of the
expansion.

**Checks.**
- At `ℓ = 1`, `η = 0.7`, `N = 4`, `ρ⁴` times the remainder has modulus `0.784482772149830`,
  `0.777865444724296` and `0.774173060982327` at `ρ = 30, 60, 120`.
- At `ℓ = 1`, `η = 0.7`, `ρ = 30`, twelve terms give `F_1 = 0.719372168230036` and
  `F′_1 = 0.694698368402081`; `f ĝ − g f̂ = 0.999999999999989`.
- Negative control: with `(−2iρ)^k` in the series of `H⁺_1` the twelve-term sum is
  `0.75201760687568 + 0.642628434018433 i` instead of `0.712646695823506 + 0.719372168230038 i`.

*Needs:* 1.1, 1.2; SpecialFunctionsConfluent 5.1; Mathlib `ascPochhammer`,
`Asymptotics.IsBigO`.

### 5.2 Large `|η|`

- **The phase** (`tendsto_coulombPhase_zero_atTop`): `σ_0(η) = η(ln η − 1) + π/4 + o(1)` as
  `η → +∞` (DLMF 33.10.6, p. 746).
- **The phase as `η → −∞`**, stated in prose: `σ_0(η) = η(ln(−η) − 1) − π/4 + o(1)`
  (DLMF 33.10.10, p. 746), by oddness.
- **The normalising constant**, stated in prose: `C_0(η) ∼ (2πη)^{1/2} e^{−πη}` as `η → +∞` and
  `C_0(η) ∼ (−2πη)^{1/2}` as `η → −∞` (DLMF 33.10.6, 33.10.10).
- **`F_ℓ` for large `|η|` with `ηρ` fixed**, stated in prose: with `x = |η|ρ > 0` fixed,
  `F_ℓ ∼ (2ℓ + 1)! C_ℓ/(2η)^{ℓ+1} · (2x)^{1/2} I_{2ℓ+1}((8x)^{1/2})` as `η → +∞` (DLMF 33.10.3,
  p. 746), and
  `F_ℓ = (2ℓ + 1)! C_ℓ/(−2η)^{ℓ+1} · ((2x)^{1/2} J_{2ℓ+1}((8x)^{1/2}) + O(η^{−2}))` as `η → −∞`,
  in particular `F_0 = (πρ)^{1/2} J_1((−8ηρ)^{1/2}) + O(|η|^{−5/2})` (DLMF 33.10.7–33.10.8,
  p. 746, which have the weaker remainders `o(|η|^{1/4})` inside the bracket and `o(|η|^{−1/4})`).
  The forms with `J` are additive, not asymptotic equivalences, since `J_{2ℓ+1}` has zeros at
  which `F_ℓ` does not vanish. The printed handbook states 33.10(ii)–(iii) for `ρ` fixed; the
  online DLMF corrects this to `ηρ` fixed (erratum of version 1.0.19).

*Suggested proof:* Stirling's formula for `ln Γ(1 + iη)` on the imaginary axis
(ZerosOfLFunctions 1.2) for the phase and `C_0`; by 1.2, `C_0(η)` is `(2π|η|)^{1/2}` up to a
factor `1 + O(e^{−2π|η|})` as `η → −∞`. The `F_ℓ` forms are 6.3 at `ε = 1/η²`, `r = −ηρ`, with
`r = −x` for `η > 0` and `r = x` for `η < 0` fixed: `f(ε, ℓ; r) − f(0, ℓ; r) = O(ε)` because the
coefficients `α_k` of 6.1 are polynomials in `ε` bounded uniformly for `|ε| ≤ 1`, and `f(0, ℓ; r)`
is the Bessel form of 6.4. For `η > 0` the sign `(−1)^{ℓ+1}` of the case `r < 0` of 6.4 and of
`(−2η)^{ℓ+1}` cancel, and `I_{2ℓ+1} > 0` makes the form an equivalence.

**Checks.**
- `σ_0(η) − (η(ln η − 1) + π/4)` is `−0.00416701413737145` at `η = 20` and
  `−0.00104167209225612` at `η = 80`, close to the next term `−1/(12η)`.
- `C_0(η)/((2πη)^{1/2} e^{−πη}) = 1.0` to 15 digits at `η = 20` and `η = 80`.
- Negative control: without the `π/4` the difference at `η = 80` is `0.784356491305192`, which
  does not tend to `0`.
- At `x = 6`: `F_1(η, 6/η)` divided by the `I_3` form is `0.976470977852675` at `η = 10` and
  `0.99962884176556` at `η = 80`; at `η = −10` and `η = −80` the bracket of the `J_3` form misses
  `(12)^{1/2} J_3(48^{1/2})` by `−0.0323191874959933` and `−0.000521555247519079`, that is
  `−3.232` and `−3.338` times `η^{−2}`.
- Negative control for `∼` in the `J` form: at `ρ = 0.3`, `η = −113.034022613697`, where
  `−8ηρ = j²_{1,5}` is the square of the fifth zero of `J_1`, the `J_1` form is `0` while
  `F_0 = −0.000694439872421130`.

*Needs:* 1.2, 6.1, 6.3, 6.4; ZerosOfLFunctions 1.2; SpecialFunctionsBessel, its Conventions.

## Layer 6: the functions of `(ε, r)`

### 6.1 The regular solution `f` and `A(ε, ℓ)`

- **The Kummer form** (`coulombEnergyF_eq_kummer`): for `ε ≠ 0` and real `r`,
  `f(ε, ℓ; r) = (2r)^{ℓ+1} e^{−r/κ} M(ℓ + 1 − κ, 2ℓ + 2, 2r/κ)/(2ℓ + 1)!` (DLMF 33.14.5, p. 748;
  equivalently `κ^{ℓ+1} M_{κ,ℓ+½}(2r/κ)/(2ℓ + 1)!`, DLMF 33.14.4, stated in prose).
- **The equation** (`coulombEnergyF_equation`): for `r ≠ 0`,
  `f″ + (ε + 2/r − ℓ(ℓ + 1)/r²) f = 0` (DLMF 33.14.1, p. 748).
- **Analyticity**, stated in prose: `f` is real analytic in `(ε, r)`, and
  `f ∼ (2r)^{ℓ+1}/(2ℓ + 1)!` as `r → 0` (DLMF 33.14(ii), p. 748).
- **`A` through Gamma functions** (`coulombEnergyA_eq_gamma`): for `ε ≠ 0`,
  `A(ε, ℓ) = Γ(1 + ℓ + κ)/Γ(κ − ℓ) · κ^{−2ℓ−1}` with `κ` at `r > 0` (DLMF 33.14.12, p. 748).
  At the poles of `Γ(κ − ℓ)`, `ε = −1/n²` with `n ≤ ℓ`, both sides vanish (Mathlib's
  `Complex.Gamma` is `0` at the poles).

*Suggested proof:* the series of `f` is the Frobenius solution of the equation with exponent
`ℓ + 1` normalised by `α₀`; the Kummer form solves the same equation with the same leading term,
by SpecialFunctionsConfluent 1.6. Since Kummer's transformation (SpecialFunctionsParabolicCylinder
1.4) makes the Kummer form even in `κ`,
the sign convention for `κ` does not matter for `f`. For `A`, the functional equation of `Γ`.

**Checks.**
- `coulombEnergyCoeff ε 0` begins `2, −2, (4 − 2ε)/6`; at `ε = −1/4` the coefficient `3/4` is
  that of `2r e^{−r/2}(1 − r/2)`.
- `f(0.25, 0; 1) = 0.52660129575643`; `f(−0.25, 0; 1) = 0.606530659712633 = e^{−1/2}`.
- The series and the Kummer form agree at `(ε, ℓ, r) = (0.3, 1, 2.5)` (`0.705763928861392`) and at
  `(−0.13, 2, −3)` (`−4.94405637561829`).
- Negative control: with `α₁ = +α₀/(ℓ + 1)` the series at `ε = −0.13`, `ℓ = 2`, `r = 3` leaves the
  residual `2.4` in the equation.
- `A(ε, 0) = 1`; `A(0.3, 2) = 2.86`, equal to the Gamma form; `A(−1/4, 2) = 0`.
- Negative control: the product over `k < ℓ` gives `A(0.3, 2) = 1.3`, which is not the Gamma form.

*Needs:* SpecialFunctionsConfluent 1.6; Mathlib `Complex.Gamma`, `Complex.regularizedHGFun`.

### 6.2 The irregular solution `h` and the Wronskians

- **The Wronskian** (`wronskian_coulombEnergyH_coulombEnergyF`): for `ε ≠ 0` and `r ≠ 0` off the
  junk values of `h` of the Conventions (not `r > 0` with `ε = −1/n²`, `n > ℓ`),
  `𝒲{h, f} = 2/π` (DLMF 33.14.16, p. 749).
- **`h` solves the equation** and `𝒲{c, s} = 1/π`, stated in prose (DLMF 33.14.16).
- **Regularity in `ε`**, stated in prose: for fixed `r ≠ 0`, `h` is real analytic in `ε` on
  `ε > 0` and on `ε < 0`; for `r > 0` the term with `S(ε, r)` cancels the poles of
  `Γ(ℓ + 1 − κ)` at `ε = −1/n²`, `n > ℓ`, which are removable singularities of `h` (DLMF
  33.14(iii), p. 748).
  The limit `ε → 0` is in 6.4.

*Suggested proof:* the Wronskian of `M_{κ,μ}` and `W_{κ,μ}` (SpecialFunctionsConfluent 3.4),
`𝒲{M_{κ,μ}, W_{κ,μ}} = −Γ(1 + 2μ)/Γ(½ + μ − κ)`, and the chain rule for `z = 2r/κ`; the term in
`M` does not contribute. For the regularity: at `κ = n > ℓ` (`ε = −1/n²`, `r > 0`) both
`W_{n,ℓ+½}` and `M_{n,ℓ+½}` are multiples of the same Laguerre function
(SpecialFunctionsConfluent 6.4), `S = 2(−1)^n`, and the bracket of the definition vanishes, which
removes the simple pole of `Γ(ℓ + 1 − κ)`.

**Checks.**
- `𝒲{h, f} π/2 = 1` to 15 digits at `(ε, ℓ, r) = (0.3, 1, ±2.5)` and `(−0.13, 2, ±3)`.
- `h(−0.13, 2; 3) = 1.1022812692132` and `h(0.3, 1; 2.5) = −0.304096132890911`; the imaginary
  part of the complex expression is below `10⁻³⁰` in all four cases.
- `κ(−1/4, 1) = 2`, `κ(−1/4, −1) = −2`, `κ(1/4, r) = 2i`; negative control: with `κ = +2.77…`
  instead of `−(0.13)^{−1/2}` at `ε = −0.13`, `ℓ = 2`, `r = −3` the expression is
  `−2.34188134328815 + 2.0646379424582 i`, not the real `h = 0.0525731551201608`.
- `S(0.3, 1) = 309.741230803103 = 1/S(0.3, −1)`, `S(−1/4, 1) = 2`, `S(−0.13, −1) = 0`; negative
  control: with `S = 0` for `ε < 0`, `r > 0`, the expression at `(−0.13, 1, 1.4)` is
  `1.36475077522515`, while `h` is `0.728096697899092`.
- `𝒲{h, f} π/2 = 1` at `(ε, ℓ, r) = (−1/4, 2, ±1.4)` (`n = 2 ≤ ℓ`), `(−1/4, 0, −1.4)` and
  `(−1/9, 1, −1.4)` (`r < 0`), values that the hypothesis of the Wronskian admits.
- `h(−1/4 + 10⁻⁶, 0; 1.4) = −0.655687359169131` and `h(−1/4 − 10⁻⁶, 0; 1.4) = −0.655687307842203`:
  the pole at `n = 2 > ℓ` is removed.

*Needs:* 6.1; SpecialFunctionsConfluent 3.4, 6.4.

### 6.3 Connection with `F_ℓ`, `G_ℓ` and with Whittaker functions

- **`F_ℓ` through `f`** (`coulombF_eq_coulombEnergyF`): for `η ≠ 0` and real `ρ`,
  `F_ℓ(η, ρ) = (2ℓ + 1)! C_ℓ(η)/(−2η)^{ℓ+1} · f(1/η², ℓ; −ηρ)` (DLMF 33.16.1, p. 751).
- **`G_ℓ` through `h`** (`coulombG_eq_coulombEnergyH`): for `η ≠ 0` and `ρ > 0`,
  `G_ℓ(η, ρ) = π(−2η)^ℓ/((2ℓ + 1)! C_ℓ(η)) · h(1/η², ℓ; −ηρ)` (DLMF 33.16.2, p. 751).
- **`s` and `c` for `ε > 0`, `r < 0`** (`coulombEnergyS_coulombEnergyC_of_neg`): with
  `τ = ε^{1/2}`, `s = (−1)^{ℓ+1} e^{π/τ} (πτ)^{−1/2} F_ℓ(1/τ, −τr)` and
  `c = (−1)^ℓ e^{−π/τ} (πτ)^{−1/2} G_ℓ(1/τ, −τr)`. DLMF 33.16.15 omits the factors
  `(−1)^{ℓ+1}e^{π/τ}` and `(−1)^ℓ e^{−π/τ}`, in print and online.
- **`s` through Whittaker functions for `ε < 0`, `r > 0`** (`coulombEnergyS_eq_whittaker`): with
  `ν = (−ε)^{−1/2}`, `K = (ν²Γ(ν + ℓ + 1)Γ(ν − ℓ))^{−1/2}`, `ζ = W_{ν,ℓ+½}(2r/ν)` and
  `ξ = Re(e^{iπν} W_{−ν,ℓ+½}(e^{iπ}2r/ν))`, and when `A(ε, ℓ) > 0`,
  `s = (−1)^ℓ (2ν)^{−1/2} (sin(πν) ξ/(πK) − cos(πν) ν² K ζ)`. DLMF 33.16.17 has the prefactor
  `(−1)^ℓ/(2ν^{1/2})`, in print and online; the correct one is `(−1)^ℓ/(2ν)^{1/2}`.
- **`c` through Whittaker functions for `ε < 0`, `r > 0`**, stated in prose:
  `c = (−1)^ℓ (2ν)^{−1/2} (cos(πν) ξ/(πK) + sin(πν) ν² K ζ)`, with the same correction.
- **The other connection formulas**, stated in prose: DLMF 33.16.3–33.16.7 (`f`, `h` through
  `F_ℓ`, `G_ℓ` for `ε > 0`), 33.16.10–33.16.13 (`f`, `h` through `ζ`, `ξ` for `ε < 0`, both
  signs of `r`), 33.16.14 (`s`, `c` for `ε > 0`, `r > 0`), and 33.16.18 for `ε < 0`, `r < 0` in
  the corrected form below, with `ζ`, `ξ` taken at `−ν` in place of `ν`; DLMF 33.16.18 has `1/K`
  and `K` where these have `K` and `1/K`, in print and online.

```text
s = (−1)^{ℓ+1} 2^{−1/2} (ν^{3/2} K ξ − sin(πν) cos(πν)/(π ν^{1/2} K) · ζ)
c = (−1)^ℓ ζ/(π (2ν)^{1/2} K)
```

*Suggested proof:* 33.16.1 is the Kummer form of `f` at `κ = iη` against the definition of `F_ℓ`,
and 33.16.2 is the uniqueness of the solution with given Wronskian against `f` and given
behaviour at infinity (the Whittaker form of 1.3), with the constant from `𝒲{G_ℓ, F_ℓ} = 1`. The
other forms follow by substitution into the definitions of `s` and `c`.

**Checks.**
- 33.16.1–33.16.2 at `(ℓ, η, ρ) = (1, −0.8, 2.1)` give `0.893204031324914` and
  `−0.261191977826202`, and at `(1, 0.8, 2.1)` give `0.503700805561556` and `1.44673925810598`.
- At `ε = 0.3`, `ℓ = 1`, `r = −2.5`: `s = 8.88670595989257` and `c = −0.0196166796892146`;
  negative control: the printed 33.16.15 gives `0.0286907427107813` and `6.07609451120757`.
- At `ε = −0.13`, `ℓ = 1`, `r = 3`: `s = 0.747984640574983` and `c = −0.0544224046489822`;
  negative control: the printed 33.16.17 gives `s = 0.528905011573953`.
- At `ε = −0.13`, `ℓ = 1`, `r = −3`: `s = 16.3461015328751`, `c = −0.00949656898516835`; negative
  control: the printed 33.16.18 gives `1994.68443306155` and `−7.78004177279628·10⁻⁵`.

*Needs:* 1.1–1.3, 6.1, 6.2; SpecialFunctionsConfluent, its Conventions.

### 6.4 Recurrences, power series, `ε = 0` and large `ℓ`

- **The recurrence of `f`** (`coulombEnergyF_recurrence`): for every real `r`,
  `(ℓ + 2) r f_ℓ − (2ℓ + 3)((ℓ + 1)(ℓ + 2) − r) f_{ℓ+1} + (ℓ + 1)(1 + (ℓ + 2)²ε) r f_{ℓ+2} = 0`
  (DLMF 33.17.1 at `ℓ + 1`, p. 752).
- **The recurrence of `h` and the ladder relations**, stated in prose (DLMF 33.17.2–33.17.4,
  p. 752).
- **`ε = 0`** (`coulombEnergyF_zero_left`): for `r > 0`,
  `f(0, ℓ; r) = (2r)^{1/2} J_{2ℓ+1}((8r)^{1/2})` (DLMF 33.20.1, p. 752).
- **`ε = 0`, `r < 0`**, stated in prose:
  `f(0, ℓ; r) = (−1)^{ℓ+1}(2|r|)^{1/2} I_{2ℓ+1}((8|r|)^{1/2})` (DLMF 33.20.2, p. 752).
- **The coefficients of the series of `h`** (`coulombEnergyGammaCoeff`,
  `coulombEnergyBetaCoeff`, `coulombEnergyDeltaCoeff`; DLMF 33.19.4–33.19.7, p. 752): `γ₀ = γ₁ = 1`,
  `β₀ = β₁ = 0`, and for `k ≥ 2`

```text
γ_k = γ_{k−1} − ¼ (k − 1)(k − 2ℓ − 2) ε γ_{k−2}
β_k = β_{k−1} − ¼ (k − 1)(k − 2ℓ − 2) ε β_{k−2} − ½ (k − 1) ε γ_{k−2}
δ₀ = (β_{2ℓ+1} − 2(ψ(2ℓ + 2) + ψ(1)) A) α₀,   δ₁ = (β_{2ℓ+2} − 2(ψ(2ℓ + 3) + ψ(2)) A) α₁
k(k + 2ℓ + 1) δ_k + 2δ_{k−1} + ε δ_{k−2} + 2(2k + 2ℓ + 1) A α_k = 0
```

  with `A = A(ε, ℓ)` and the `α_k` of `f`. All are polynomials in `ε`; they have no junk values.
- **The power series of `h`** (`hasSum_coulombEnergyH`): for `ε ≠ 0` and `r ≠ 0` off the junk
  values of `h` (not `r > 0` with `ε = −1/n²`, `n > ℓ`), and for `A(ε, ℓ) ≠ 0`, that is
  `ε ≠ −1/n²` with `1 ≤ n ≤ ℓ`, with `κ` as in Conventions for `ε > 0` and `κ = (−ε)^{−1/2}` for
  `ε < 0` and both signs of `r`,

```text
h = (1/π) ∑_{k=0}^{2ℓ} (2ℓ − k)! γ_k/k! · (2r)^{k−ℓ} − (1/(2π)) ∑_{k≥0} δ_k r^{k+ℓ+1}
    − (A/(2π)) (2 ln|2r/κ| + Re ψ(ℓ + 1 + κ) + Re ψ(−ℓ + κ)) f
```

  (DLMF 33.19.3, p. 752). In `Suggested.lean` it is a `HasSum` for `∑ δ_k r^{k+ℓ+1}`. DLMF 33.19.3
  has the factor `1/(2π)` on the finite sum, and its `κ` (of 33.14.6) is `−(−ε)^{−1/2}` for
  `ε < 0`, `r < 0`; both are wrong, in print and online. DLMF states it for `r ≠ 0` only.
- **The exceptional values of `ε`**, stated in prose: at `ε = −1/n²` with `1 ≤ n ≤ ℓ`, `A = 0`
  meets the pole of `ψ(−ℓ + κ) = ψ(n − ℓ)`, and the series holds with `A ψ(−ℓ + κ)` read as its
  limit `Γ(1 + ℓ + κ) κ^{−2ℓ−1} ψ(κ − ℓ)/Γ(κ − ℓ)` (6.1), finite since `ψ/Γ = −(1/Γ)′` is entire.
  At `ε = −1/n²`, `n > ℓ`, `r > 0`, the series converges to the removable value of `h` of 6.2.
- **The limit `ε → 0` of `h`**, stated in prose: as `ε → 0` from either side, `h` tends to
  `−(2r)^{1/2} Y_{2ℓ+1}((8r)^{1/2})` for `r > 0` and to
  `(−1)^ℓ (2/π)(2|r|)^{1/2} K_{2ℓ+1}((8|r|)^{1/2})` for `r < 0` (DLMF 33.20.1–33.20.2, p. 752).
  It is not analytic at `ε = 0`: there it has only the asymptotic, divergent, expansion of DLMF
  33.20.7 (p. 753), while `f` has the convergent one of DLMF 33.20.3.
- **Large `ℓ`**, stated in prose: `f ∼ (2r)^{ℓ+1}/(2ℓ + 1)!` and `h ∼ (2ℓ)!/(π(2r)^ℓ)` as
  `ℓ → ∞` (DLMF 33.18.1, p. 752).

*Suggested proof:* the recurrence is that of 2.1 transported by 6.3 for `ε > 0`, and holds for
all `ε` by analyticity of `f` in `ε`; or directly from the series. The case `ε = 0` is the series
of `J_{2ℓ+1}`: `α_k` at `ε = 0` is `2^{ℓ+1}(−2)^k/(k!(2ℓ + 1 + k)!)`.

For the series of `h`, the Frobenius method at the exponents `−ℓ` and `ℓ + 1`, which differ by
the integer `2ℓ + 1`: substituting the right side into the equation of 6.1 gives the recurrences
of the `γ_k`, `β_k`, `δ_k` for `k ≥ 2`, so the right side `u` solves the equation for `r ≠ 0`.
Its leading term `(2ℓ)!(2r)^{−ℓ}/π` against `α₀ r^{ℓ+1}` gives `𝒲{u, f} = 2/π`, so by 6.2
`u − h = c f` for a constant `c` on each side of `r = 0`. The coefficient of `r^{ℓ+1}` in the
logarithmic expansion of `W_{κ,ℓ+½}(2r/κ)` (the logarithmic case of `U` with `b = 2ℓ + 2`,
SpecialFunctionsConfluent 1.4) and of `M_{κ,ℓ+½}(2r/κ)` in the definition of `h` is `δ₀`, which
gives `c = 0`. For the limit `ε → 0`, the series: `A` and the `γ_k`, `δ_k` are polynomials in
`ε`, and the digamma term tends to `2 ln|2r|`. It is not analytic at `0`: at `ℓ = 0`, `ε > 0`,
the digamma term minus `2 ln|2r|` is `ln ε + Re ψ(1 + iy) + Re ψ(iy)` with `y = ε^{−1/2}`, whose
asymptotic series `∑_k (−1)^{k+1} B_{2k} ε^k/k` has radius `0`; a function analytic at `0` would
have its Taylor series as asymptotic expansion.

**Checks.**
- At `ε = 0.3`, `ℓ = 1`, `r = 1.7` the residual of the recurrence is below `10⁻¹⁵`; negative
  control: with `(1 + (ℓ + 1)²ε)` in the last coefficient it is `−0.0830844856265773`.
- `f(0, 1; 2) = 0.860342947751244 = 2 J_3(4)` and `f(0, 1; −2) = 6.67455155684069 = 2 I_3(4)`;
  `f(0, 0; 0.5) = 0.576724807756873 = J_1(2)`.
- `γ_k` at `ε = 0.3`, `ℓ = 1` begins `1, 1, 1.15, 1.3`; negative control: with the sign of the
  `γ_{k−2}` term reversed it begins `1, 1, 0.85, 0.7`, and the series of `h` at
  `(0.3, 1, 1.4)` gives `0.476853585402393`.
- `β_k` at `ε = 0.3`, `ℓ = 1` begins `0, 0, −0.15, −0.45`; negative control: without the
  `γ_{k−2}` term all `β_k` vanish, and the series at `(0.3, 1, 1.4)` gives `0.610686059091332`.
- At `ℓ = 0`, `δ₀ = 8γ − 4 = 0.617725319212263` for every `ε`, and at `ε = −1/4`,
  `δ₁ = 9.75 − 8γ = 5.13227468078774` (`γ` Euler's constant); negative control: without the term
  `2(2k + 2ℓ + 1)Aα_k` the series at `(0.3, 1, 1.4)` gives `0.552586381160363`.
- The series of `h` at `(ε, ℓ, r) = (0.3, 1, 1.4)` gives `0.596095976270602 = h`; negative
  control: with the printed `1/(2π)` it gives `0.0670194725922587`, and at `(−0.13, 1, −1.4)`
  with `κ = −ν` in the digamma terms it gives `2.5266945158928` instead of
  `−0.0746397658665789`.
- The series equals `h` at `(−1/4, 0, −1.4)` (`0.0247609509590849`) and `(−1/9, 1, −1.4)`
  (`−0.0751540107103261`), where `ε = −1/n²` with `n > ℓ` and `r < 0`.
- Negative control for `A ≠ 0`: at `(−1/4, 2, 1.4)` the definition gives
  `h = 1.96223692382825`; the series at `ε = −1/4 ± 10⁻⁹` gives `1.96223692483284` and
  `1.96223692282366`, and the limit reading gives `h`, while the term `A ψ(−ℓ + κ)` read as `0`
  gives `1.94825275164612`. At `(−1, 1, −0.9)`: `h = −0.143794602353125`, against
  `−0.428559028300522` with that term read as `0`.
- At `(−1/4, 0, 1.4)`, a junk value of `h`, the series gives `−0.6556873335057`, between
  `h(−1/4 ± 10⁻⁹, 0; 1.4) = −0.655687333480036`, `−0.655687333531363`.
- `h(ε, 0; 1.4)` is `−0.660115045571889` at `ε = 0.001` and `−0.660094332213961` at
  `ε = −0.0011`, near `−2.8^{1/2} Y_1(11.2^{1/2}) = −0.660105215647171`; at `r = −1.4` it is
  `0.0283685937605596` and `0.0283343216470722`, near
  `(2/π) 2.8^{1/2} K_1(11.2^{1/2}) = 0.0283522634891982`.
- Negative control for analyticity at `0`: at `ε = 0.3`, `ℓ = 0`, the digamma term minus
  `2 ln|2r|` is `0.0518283934046760`, and the partial sums of its asymptotic series are
  `0.05, 0.0515, 0.0517143, 0.0517818, 0.0518186, 0.0518494, 0.0518858, 0.0519440`: they pass the
  value and move away.

*Needs:* 2.1, 6.1–6.3 (6.2, the Wronskian, only for the series of `h`);
SpecialFunctionsConfluent 1.4; SpecialFunctionsBessel, its Conventions; Mathlib
`Complex.besselJ`, `Complex.digamma`.

## Layer 7: bound states

### 7.1 The hydrogenic radial functions

For `n ≥ 1` and `ℓ < n`, with LaguerreJacobi's `L^{(α)}_k`,

```text
φ_{n,ℓ}(r) = (−1)^{ℓ+1+n} n^{−ℓ−2} ((n − ℓ − 1)!/(n + ℓ)!)^{1/2} (2r)^{ℓ+1} e^{−r/n}
             · L^{(2ℓ+1)}_{n−ℓ−1}(2r/n)
```

- **The Laguerre form** (`hydrogenRadial_eq`): `φ_{n,ℓ} = (−1)^{ℓ+1+n}(2/n³)^{1/2} s(−1/n², ℓ; ·)`,
  that is `(−1)^{ℓ+1+n}(2/n³)^{1/2}(A/2)^{1/2} f(−1/n², ℓ; ·)` (DLMF 33.14.14, p. 749; Buchholz,
  Appendix I, B, no. 1, (1a)–(1c), p. 214, where
  `W_{n+(1+μ)/2,μ/2}(z) = (−1)^n n! z^{(1+μ)/2} e^{−z/2} L^{(μ)}_n(z)`; Hall, §18.3, Theorem 18.3,
  p. 397, and the recurrence (18.15), p. 399).
- **The bound-state condition** (`memLp_coulombEnergyF_iff`): `f(ε, ℓ; ·)` is square integrable
  on `(0, ∞)` if and only if `ε = −1/n²` for some `n > ℓ` (Hall, §18.3, p. 399: the series of
  the radial function terminates exactly when `λ = n ≥ ℓ + 1`, and otherwise grows like `e^ρ`).
- **Growth**, stated in prose: for `ε > 0`, `f(ε, ℓ; ·)` oscillates with an amplitude bounded
  below; for `ε < 0` off these values it grows like `e^{r/ν}`, `ν = (−ε)^{−1/2}`, times a power
  of `r`.
- DLMF's remark after 33.14.15 lets `n` start at `ℓ`; at `n = ℓ` the factor `A(−1/ℓ², ℓ)`
  vanishes and `s = 0`, so the bound states are `n = ℓ + 1, ℓ + 2, …`.

*Suggested proof:* at `κ = n > ℓ` the first parameter `ℓ + 1 − n` of the Kummer form of 6.1 is
a non-positive integer, so `M` is a Laguerre polynomial (SpecialFunctionsConfluent 6.4, DLMF
13.18.17); the constant is `A(−1/n², ℓ) = ∏_{k=1}^{ℓ}(1 − k²/n²)`. For the condition: if `κ` is
not an integer `> ℓ`, the Kummer function grows like `e^{2r/κ} r^{−ℓ−1−κ}` times the nonzero
constant `(2ℓ + 1)!/Γ(ℓ + 1 − κ)` (SpecialFunctionsConfluent 5.2), and `f` like `e^{r/κ} r^{−κ}`;
for `ε > 0`, 6.3 and 1.1 give `f` as a nonzero multiple of a function `sin θ + o(1)`; at `ε = 0`,
6.4 and the large-argument form of `J_{2ℓ+1}` give amplitude `r^{1/4}`.

**Checks.**
- `φ_{1,0}(1) = 2e^{−1} = 0.735758882342885`; `φ_{2,1}(1) = e^{−1/2}/(2√6) = 0.123807552470801`.
- At `(n, ℓ, r) = (3, 1, 2.2)` both sides of the Laguerre form give `−0.178092522565691`.
- `f(−1/4, 0; 40) e^{20} = −1520`, a polynomial value, so `f` decays like `e^{−r/2}`; at
  `ν = 2.3`, `f(−1/5.29, 0; 40) e^{−40/2.3} = 0.000251247840811956`, the growing case.
- `A(−1/4, 2) = 0`: no bound state with `n = ℓ = 2`.

*Needs:* 6.1, 6.3; LaguerreJacobi 1.1; SpecialFunctionsConfluent 5.2, 6.4; Mathlib
`MeasureTheory.MemLp`, `ascPochhammer`.

### 7.2 Orthonormality

- **Orthonormality** (`integral_hydrogenRadial_mul`): for fixed `ℓ` and `m, n > ℓ`,
  `∫₀^∞ φ_{m,ℓ} φ_{n,ℓ} dr = δ_{mn}` (DLMF 33.14.15, p. 749).

*Suggested proof:* orthogonality for `m ≠ n` from the Lagrange identity: `φ_{m,ℓ}` and `φ_{n,ℓ}`
solve `w″ + (ε + 2/r − ℓ(ℓ + 1)/r²)w = 0` with different `ε`, both vanish at `0` and decay at
infinity, so `(ε_m − ε_n)∫φ_mφ_n = [𝒲]₀^∞ = 0`. The norm is QuantumFoundations §9.5's radial
normalisation `∫₀^∞ x^{α+1} e^{−x} (L^{(α)}_k)² dx = (2k + α + 1)Γ(k + α + 1)/k!` at `α = 2ℓ + 1`,
`k = n − ℓ − 1`, after `x = 2r/n`.

**Checks.**
- `∫φ_{3,1}² = 1` and `∫φ_{2,0}² = 1`; `∫φ_{2,1}φ_{3,1} = 0` and `∫φ_{1,0}φ_{2,0} = 0`.
- Negative control: with `L^{(2ℓ)}` in place of `L^{(2ℓ+1)}`, `∫φ_{3,1}² = 1.5` and
  `∫φ_{2,1}φ_{3,1} = 0.36864`.
- Different `ℓ` are not orthogonal: the statement is for fixed `ℓ` only, since the equation
  depends on `ℓ`.

*Needs:* 7.1; QuantumFoundations §9.5 (the radial normalisation).

### Examples

- The ground state `φ_{1,0}(r) = 2r e^{−r}` and `f(−1, 0; r) = 2r e^{−r}`, `A(−1, 0) = 1`.
- `φ_{2,0}(r) = −r e^{−r/2}(1 − r/2)/√2` and `φ_{2,1}(r) = r² e^{−r/2}/(2√6)`.
- In the variables of QuantumFoundations §9.5, with `μ` the reduced mass and coupling `α < 0`,
  the radial equation at energy `E` becomes the equation of 6.1 with `ε = E/(μα²/2)` after
  `r ↦ μ|α| r`; the bound energies `−μα²/(2n²)` of §9.5 are `ε = −1/n²`.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material lies outside this roadmap. It is recorded only to fix the boundary.
Contributors should not attempt it under this roadmap.

- **Uniform asymptotics for large `ℓ`** through Airy functions (Olver, Ch. 11, §4.3, (4.05),
  p. 402, resting on Theorem 3.1, p. 399): these need the turning-point theory, which
  AsymptoticExpansions excludes and no roadmap owns.
- **The transition region and uniform expansions for large `|η|`** (DLMF 33.12, p. 747, and
  33.20(iv), p. 753), the `G_ℓ` parts of 33.10.3–33.10.9, and the expansions of 33.9.6–33.9.7.
- **The continued fraction CF2** for `H^±′_ℓ/H^±_ℓ` (DLMF 33.8.2, p. 745), which holds
  numerically but whose convergence proof is not in the sources read.
- **Complex `ℓ` and `η`** (DLMF 33.13, p. 748), and the asymptotics of `f`, `h` for small `|ε|`
  (DLMF 33.20.3–33.20.5) and for large `r` (DLMF 33.21, p. 753).
- **Physical applications** (DLMF 33.22): the Schrödinger equation in other variables and the
  Coulomb transform and spectral theory, which QuantumFoundations §9.5 owns.
- **Completeness** of the bound states together with the scattering states, which is
  QuantumFoundations §9.5's spectral representation.
- **Numerical computation**, tables and graphics.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **The equation and its standard solutions** (1.2–1.4).
2. **Recurrences in `ℓ` and continued fractions** (2.1–2.2).
3. **The origin, the power series and `η = 0`** (3.1–3.3).
4. **Integrals and Bessel-function series** (4.1–4.3).
5. **Large `ρ` and large `|η|`** (5.1–5.2).
6. **The functions of `(ε, r)`** (6.1–6.4).
7. **Bound states** (7.1–7.2).

The numbers are those of the layers above, and `k.n` names subsection `n` of Layer `k`.
`Suggested.lean` states the headlines that carry a Lean name, each with every conclusion the
README attaches to it; it is not an exhaustive acceptance test, and the other headlines are
targets of the same standing, stated in prose.

**Owned elsewhere.** QuantumFoundations §9.5 owns the definitions of `C_ℓ`, `θ_ℓ`, `F_ℓ`, `G_ℓ`,
`H^±_ℓ` and the specification of `σ_ℓ`, with the results listed in 1.1, the hydrogen operator
theory, the radial Laguerre normalisation and the Coulomb transform. `Suggested.lean` writes the
definitions out as local copies of §9.5's formulas, since §9.5 gives them no Lean names. §9.5
cites "DLMF 33.10–33.11" for its unit-amplitude asymptotics; this roadmap reads that as the
leading terms (33.10.1–33.10.2) and owns the full expansion of 5.1 and the large-`|η|` forms of
5.2. QuantumFoundations §9.4 owns Tricomi's `U`; SpecialFunctionsConfluent owns its form
`kummerU` on the logarithmic plane, whose agreement with §9.4's `U` is its 2.1, and the Whittaker
functions; SpecialFunctionsParabolicCylinder 1.4 owns Kummer's transformation of `𝐌`;
LaguerreJacobi owns the Laguerre polynomials; SpecialFunctionsBessel owns the Bessel functions.

**Inputs.** Cases of the targets that Mathlib or Tau Ceti already proves are inputs, not targets:
- the reflection formula `Γ(z)Γ(1 − z) = π/sin(πz)`: Mathlib's
  `Complex.Gamma_mul_Gamma_one_sub`;
- `Γ(z̄) = conj Γ(z)`: Mathlib's `Complex.Gamma_conj`;
- Euler's limit for `Γ`: Mathlib's `Complex.GammaSeq`.

## Exact supplier contracts

### From [QuantumFoundations](../QuantumFoundations/README.md)

- §9.5: the definitions of `C_ℓ`, `θ_ℓ`, `F_ℓ`, `H^±_ℓ`, `G_ℓ` as displayed in Conventions, and
  `σ_ℓ` as the continuous phase of `Γ(ℓ + 1 + iη)` with `σ_ℓ(0) = 0`; real-valuedness of
  `F_ℓ`, `G_ℓ`; the Coulomb equation; `H^±_ℓ = G_ℓ ± iF_ℓ`; `𝒲{G_ℓ, F_ℓ} = 𝒲{H^±_ℓ, F_ℓ} = 1`;
  `F_ℓ = sin θ_ℓ + o(1)`, `G_ℓ = cos θ_ℓ + o(1)` as `ρ → ∞`. For 1.1 and every later layer.
- §9.5: the radial normalisation
  `∫₀^∞ x^{α+1} e^{−x} (L^{(α)}_k(x))² dx = (2k + α + 1)Γ(k + α + 1)/k!`. For 7.2.

### From SpecialFunctionsConfluent

- Its Conventions and 1.4, 1.6: `kummerUBracket`, `kummerULog`, `kummerU`,
  `regularizedWhittakerM`, `whittakerM`, `whittakerW`, `whittakerWLog`, copied verbatim into
  `Suggested.lean`; holomorphy in the parameters and in `log z`. For 1.3, 3.2, 6.1–6.4.
- 2.1: Euler's integral (DLMF 13.4.1) and the Laplace integral of `U` (DLMF 13.4.4), and the
  agreement of `kummerU` with the `U` of QuantumFoundations §9.4. For 1.1, 1.3, 4.1.
- 3.4: the Wronskian of the Whittaker functions. For 6.2.
- 4.1: the contiguous relations of `M` and `U`. For 2.1.
- 5.1: the asymptotic expansion of `U` for large argument; 5.2: the growth of `M`. For 5.1, 7.1.
- 6.2: Kummer's second transformation (DLMF 13.6.9); 6.3: Buchholz's expansion (DLMF
  13.11.3–13.11.4); 6.4: the Laguerre case of `M` (DLMF 13.18.17). For 3.3, 4.3, 6.2, 7.1.

### From [SpecialFunctionsBessel](../SpecialFunctionsBessel/README.md)

- Its Conventions: `I_ν` and the spherical functions `𝗃_n`, `𝗒_n`, copied verbatim as
  `Complex.besselI`, `Complex.sphericalBesselJ`, `Complex.sphericalBesselY`; `Y_ν`, `K_ν`. For
  3.3, 4.2, 4.3, 5.2, 6.2.
- 3.1–3.2: the spherical Bessel functions, their equations, elementary forms and recurrences.
  For 3.3, 4.2.

### From [LaguerreJacobi](../LaguerreJacobi/README.md)

- 1.1: `Polynomial.laguerre`, copied verbatim. For 7.1.

### From [AsymptoticExpansions](../AsymptoticExpansions/README.md)

- 4.3: rotation of the path of a Laplace integral. For 4.1.

### From SpecialFunctionsEiLiErfIncompleteGamma

- [SpecialFunctionsEiLiErfIncompleteGamma](../SpecialFunctionsEiLiErfIncompleteGamma/README.md)
  4.1: Pincherle's theorem and minimal solutions. For 2.2.

### From [ZerosOfLFunctions](../ZerosOfLFunctions/README.md)

- 1.2: Stirling's formula for `ln Γ` on a sector. For 5.2.

### From Tau Ceti

- No Tau Ceti declaration is consumed. Later Tau Ceti work on the Laguerre polynomials, on a
  holomorphic logarithm of `Γ` on the slit plane (whose imaginary part at `ℓ + 1 + iη` is
  `σ_ℓ(η)`) or on `|Γ(1 + iy)|²` may replace the local copy of `Polynomial.laguerre`, the product
  formula of 1.2 and the case `ℓ = 0` of `coulombC_sq`.

### From Mathlib

- `Complex.regularizedHGFun`, `Complex.Gamma`, `Complex.digamma`, `Complex.besselJ`,
  `Complex.Gamma_mul_Gamma_one_sub`, `Complex.Gamma_conj`, `Complex.GammaSeq`,
  `Real.eulerMascheroniConstant`, `Real.arctan`, `Complex.cpow`, `Complex.slitPlane`,
  `intervalIntegral`, `MeasureTheory.MemLp`, `GenContFract`, `GenContFract.convs`,
  `Stream'.Seq.ofStream`, `Nat.doubleFactorial`, `Asymptotics.IsBigO`, `ascPochhammer`.

## References

- H. Buchholz, *The Confluent Hypergeometric Function with Special Emphasis on Its
  Applications*, Springer Tracts in Natural Philosophy 15, Springer, 1969, Appendix I, A, nos.
  13–14, and B, no. 1, pp. 213–214.
- K. Chadan and P. C. Sabatier, *Inverse Problems in Quantum Scattering Theory*, 2nd ed., Texts
  and Monographs in Physics, Springer, 1989, Ch. I, §1, pp. 2–4.
- B. C. Hall, *Quantum Theory for Mathematicians*, Graduate Texts in Mathematics 267, Springer,
  2013, §18.3, pp. 397–401.
- F. W. J. Olver, *Asymptotics and Special Functions*, A K Peters, 1997 (reprint of the 1974
  edition), Ch. 11, §4.3, pp. 399–403, and the notes, p. 433.
- F. W. J. Olver, D. W. Lozier, R. F. Boisvert and C. W. Clark (eds.), *NIST Handbook of
  Mathematical Functions*, Cambridge University Press, 2010, Chapter 33 (I. J. Thompson),
  pp. 741–756; the page numbers above are those of this print.
- NIST *Digital Library of Mathematical Functions*, Release 1.2.8, Chapter 33,
  <https://dlmf.nist.gov/33>. Equation numbers refer to this release.
- N. M. Temme, *Special Functions: An Introduction to the Classical Functions of Mathematical
  Physics*, Wiley, 1996, Ch. 7, pp. 171–172, §7.3.2, pp. 178–179, Exercise 7.11, p. 191, and
  §13.3, Example 4, pp. 339–340.
