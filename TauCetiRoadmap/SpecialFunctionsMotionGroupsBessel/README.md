# Roadmap: Euclidean motion groups and Bessel functions

**Summary.** The irreducible unitary representations of the plane motion group, the group of
rotations and translations of the Euclidean plane, are realized on functions on a circle, and
their matrix elements in the Fourier basis are Bessel functions of integer order times
exponentials. This roadmap derives the theory of these Bessel functions, and of the Bessel
functions that occur as zonal functions in higher dimension, from the representations of the
Euclidean and pseudo-Euclidean motion groups. The group law gives Graf's addition theorem and the
multiplication formula; the infinitesimal operators give the recurrences and Bessel's equation;
Miller's complexification of the group gives the generating functions and Weisner's identity; the
hyperbola model of the pseudo-Euclidean motion group gives the Macdonald kernel; the decomposition
of the quasi-regular representation of the plane motion group gives the Hankel transform, whose
inversion, Plancherel theorem and Laguerre eigenfunctions are proved for every real order above
`−1`; the Gel'fand pair formed by the motion group of `ℝⁿ` and its rotation subgroup gives the
zonal Bessel functions, which are exactly its spherical functions; and the contraction of the
rotation groups to the motion groups gives the limits of Wigner's `d`-functions and of Gegenbauer
polynomials to Bessel functions.

The nearest roadmaps are SpecialFunctionsGroupModels, a roadmap of the same project that owns the
motion groups, matrix elements and Gel'fand pairs in general; SpecialFunctionsSU2MatrixElements,
which owns Wigner's `d`-functions and the spherical harmonics as polynomials on `ℝ³`;
[SpecialFunctionsBessel](../SpecialFunctionsBessel/README.md), which owns the analytic theory of
the cylinder functions; [LaguerreJacobi](../LaguerreJacobi/README.md), which owns the Laguerre and
Gegenbauer polynomials; and [NoncompactQuantumSymmetry](../NoncompactQuantumSymmetry/README.md),
whose Mackey machine classifies the unitary representations. The roadmap is a synthesis of
several sources and follows none of them in its organization: Vilenkin and Klimyk's treatise and
their survey, Miller's Lie-theoretic treatment, Dieudonné's lectures and the Digital Library of
Mathematical Functions for the identifications. It is ordered by proof dependency, from the group
in coordinates, through the circle models and their matrix elements, to the identities that need
only the group law, the complexified group, the pseudo-Euclidean group, harmonic analysis on the
plane and on `ℝⁿ`, and the contractions.

Mathlib has the Bessel function of the first kind with its power series and its parity for
integer order, the Fourier transform on inner product spaces, Fourier series on the additive
circle with the trigonometric Hilbert basis, the surface measure of the unit sphere, the
Laplacian, the special orthogonal group and the complex Gamma function. Tau Ceti has continuous
representations with unitarity, the modified Bessel function, the Fourier coefficients of
`e^{κ cos θ}` on the circle for real `κ` and the sphere integral of the exponential of a linear
form. Neither has the motion groups, any of their representations, Bessel's integral on the circle
for complex argument, the group-theoretic addition theorems, the Hankel transform, the zonal
functions of `ℝⁿ` or the contraction limits.

## How to read the build

Each layer has numbered subsections, and `k.n` names subsection `n` of Layer `k`. Each subsection
lists its targets as bold headlines with their Lean names, a source locator for each headline that
restates a source result and a proof route for each corollary, and Checks, which test the
conventions on explicit values; each Check is a statement to prove. Plain bullets are targets of
the same standing as the headlines, stated in prose. `Suggested.lean` states the headlines that
carry a Lean name, each with every conclusion the README attaches to it; it is not an exhaustive
acceptance test.

Layer 0 fixes coordinates on the plane motion group `M(2)`. Layer 1 builds the circle models
`T_R` and computes their matrix elements; the one analytic input is Bessel's integral
`(1/2π) ∫ e^{iz cos ψ} e^{inψ} dψ = iⁿ Jₙ(z)` (1.2), the Jacobi–Anger expansion read as a Fourier
series. Layer 2 needs only Layer 1 and the addition theorem of SpecialFunctionsGroupModels §3.2.
Layer 3 is independent of Layers 1–2: it works with Laurent series in `z`, not with a Hilbert
space. Layer 4 is parallel to Layer 1 for `ISO(1,1)`. Layer 5 uses Layer 1 to identify the pieces
of the quasi-regular representation and the sphere mean of 6.1 for the radial Fourier transform.
Layer 6 uses Layer 1 only for the zonal matrix element of `T_R`. Layer 7 needs only the closed
forms of Wigner's `d` and of the Gegenbauer polynomials, and the zonal functions of 6.1.

The harder material is the irreducibility of `T_R` for complex `R` (1.1), Hankel inversion and
Plancherel for real order (5.2), the classification of spherical functions that are only assumed
continuous (6.2), and the contraction limits with the uniformity they need (Layer 7).

## Conventions

- **Groups.** `M(n)` is SpecialFunctionsGroupModels' `MotionGroup n` (its §0.3): pairs `(a, k)`
  with `(a, k)(a', k') = (a + k a', k k')`. On `M(2)`, `k_α` is the rotation by `α` (`rotation`),
  and `g(r, φ; α) = (r e(φ), k_α)` (`polar`) with `e(φ) = (cos φ, sin φ)` (`planePoint`), the
  coordinates of [VK1, §4.1.1 (1)–(3), p. 165]. A plane vector is also read as the complex
  number `a₁ + i a₂` (`toComplex`). The circle is `𝕋 = ℝ/2πℤ` with Mathlib's Haar probability
  measure `haarAddCircle`, that is `dψ/2π`, and `unitVec ψ = e(ψ)`; the angle of a rotation is
  `rotAngle`.
- **Circle models.** `(T_R(g) f)(ψ) = e^{iR⟨a, e(ψ)⟩} f(ψ − α)` for `g = (a, k_α)` and complex
  `R` (`circleAction`). This is SpecialFunctionsGroupModels' sphere model (its §2.6) at `n = 2`
  and real `R`; it is Vilenkin and Klimyk's `T_{iR}` (their `T_R` of [VK1, §4.1.2 (2), p. 166]
  has the real exponent `e^{Rr cos(ψ−φ)}` and is unitary for imaginary `R`), their survey's
  `Q_σ` with `σ = iR` [KV, Ch. 1, §2.7 (28), p. 165], and Miller's representation `(ρ)` with
  `ρ = R` [M, §3-8 (3.56), p. 73]. `T_R` is unitary exactly when `R` is real.
- **Matrix elements** follow SpecialFunctionsGroupModels §3.1: `D_{mn}(g) = ⟪e_m, T(g) e_n⟫`
  (`matrixElement`), conjugate-linear in the first slot, in the basis `e_n(ψ) = e^{inψ}`
  (`fourierBasis`). Then `T(k_α) e_n = e^{−inα} e_n`, and
  `D_{mn}(g(r, φ; α)) = i^{n−m} e^{i(n−m)φ} e^{−inα} J_{n−m}(R r)`, with the order `n − m`. This
  is [VK1, §4.1.3 (3), p. 168] in their `T_{iR}`, [KV, Ch. 2, §2.3, p. 179] and
  [M, (3.57), p. 73] with Miller's `U_{nm}` read as our `D_{nm}`.
- **Bessel functions** are Mathlib's `Complex.besselJ`, `J_ν(z) = (z/2)^ν ₀F₁(ν + 1; −z²/4)`; for
  integer order it is entire in `z`, and `J_{−n} = (−1)ⁿ Jₙ` (`Complex.besselJ_neg_int`).
- **Fourier transform** is Mathlib's, `𝓕f(ξ) = ∫ e^{−2πi⟨x, ξ⟩} f(x) dx`. Vilenkin and Klimyk's
  transform [VK1, §4.4.1 (2), p. 193] has `e^{+i⟨x, y⟩}`; the dictionary is `y = −2πξ`, so the
  representation on the circle `|ξ| = ρ` is `T_{−2πρ}`, equivalent to `T_{2πρ}` by 1.1.
- **Hankel transform** `(H_ν φ)(R) = ∫₀^∞ φ(r) J_ν(R r) r dr` (`hankelTransform`), the
  Fourier–Bessel transform of [VK1, §4.4.2 (3), p. 196], for real `ν > −1`.
- **Zonal Bessel functions** `Ω_n(λ, r) = Γ(n/2) Σ_k (−λ²r²/4)^k / (k! Γ(k + n/2))`
  (`besselZonal`), entire in `λ` and `r`; for `λ r ≠ 0` with `λ` in the slit plane it is
  `Γ(n/2) (2/(λr))^{n/2−1} J_{n/2−1}(λ r)`, and `Ω_2(λ, r) = J₀(λr)`,
  `Ω_3(λ, r) = sin(λr)/(λr)`, `Ω_1(λ, r) = cos(λr)`. [VK2, §9.3.2 (8)–(10), p. 48] write it for
  `ISO(n − 1)` with `p = (n − 2)/2`; here `n` is the dimension of the translation space.
- **`ISO(1,1)`** is SpecialFunctionsGroupModels' `ISO11`: pairs `(a, s)` with the boost
  `lorentzBoost s`. The hyperbola model is
  `(T_R(g) Φ)(θ) = e^{−R(a₁ cosh θ − a₂ sinh θ)} Φ(θ − s)` (`hyperbolaAction`),
  [VK1, §4.2.3 (1)–(3), pp. 173–174] on the branch `x = (cosh θ, sinh θ)`, and
  [KV, Ch. 1, §2.9, p. 166]; unitary for imaginary `R`.
- **Miller's group `T₃`** is `ℂ³` with `(b, c, τ)(b', c', τ') = (b + e^τ b', c + e^{−τ} c', τ + τ')`
  (`T3`), the matrix group of [M, (3.4), p. 53] in his coordinates; its multiplier
  representation is `(A(g) f)(z) = exp(ω b z + ω c / z + m₀ τ) f(e^τ z)` (`millerAction`),
  [M, (3.6), p. 54].
- **Wigner's `d`** is SpecialFunctionsSU2MatrixElements' `wignerSmallD d i k β` (its §2.3), with
  `d = 2l`, `i = l + m'`, `k = l + m`, Edmonds's `d^l_{m'm}`; `d^l_{00}(β) = P_l(cos β)` (its §2.6).
- **Gegenbauer and Laguerre polynomials** are LaguerreJacobi's `gegenbauer` (its §6.2) and
  `laguerre` (its §1.1), evaluated with `Polynomial.eval`.

## Layer 0: the plane motion group in polar coordinates

### 0.1 Rotations and polar coordinates

Sources: [VK1, §4.1.1 (1)–(5), p. 165]; [M, §3-5 (3.39)–(3.40), p. 65].

`rotation α` is the matrix `[[cos α, −sin α], [sin α, cos α]]` of `SO(2)`; `rotAngle k` is the
argument of `k₀₀ + i k₁₀` in `ℝ/2πℤ`; `polar r φ α = (r e(φ), k_α)`. Prove:
- **Rotations form a circle group** (`rotation_add`): `k_{α+β} = k_α k_β`;
- **Every rotation of the plane is some `k_α`** (`exists_rotation_eq`);
- **`rotAngle` recovers the angle** (`rotAngle_rotation`): `rotAngle k_α = α` modulo `2π`;
- **`rotAngle` is a homomorphism** (`rotAngle_mul`) to `ℝ/2πℤ`;
- **`k_α` is multiplication by `e^{iα}`** (`toComplex_rotE_rotation`) in the complex coordinate;
- **Polar product law, translation part** (`toComplex_polar_mul_a`): the translation of
  `g(r₁, φ₁; α₁) g(r₂, φ₂; α₂)` is `r₁ e^{iφ₁} + r₂ e^{i(φ₂ + α₁)}` [VK1, §4.1.1 (4), p. 165];
- **Polar product law, rotation part** (`polar_mul_k`): its rotation is `k_{α₁+α₂}`;
- **Polar form of `M(2)`** (`exists_polar`): every `g` is `g(|a|, φ; α)`.

These are the `n = 2` coordinates of the polar decomposition of SpecialFunctionsGroupModels §0.3,
with the complex form of [VK1, §4.1.1 (5), p. 165] (`M(2)` as the matrices
`[[e^{iα}, z], [0, 1]]`) and Miller's law (3.40).

**Checks.**
- `rotation (π/2)` sends `e₁` to `e₂`, and `toComplex e₂ = i = e^{iπ/2} · 1`.
- `g(1, 0; 0) g(1, π/2; 0)` has translation `1 + i`, so `r = √2`, `φ = π/4`, and rotation part
  `k₀`.
- `g(1, 0; π/2) g(1, 0; 0)` has translation `1 + i` but `g(1, 0; 0) g(1, 0; π/2)` has translation
  `2`; both have rotation part `k_{π/2}`.
- Negative control: the sum without the rotation of the second translation,
  `r₁ e^{iφ₁} + r₂ e^{iφ₂}`, gives `2` instead of `1 + i` for the first product of the previous
  Check; it is the law of the direct product `ℝ² × SO(2)`.

*Needs:* SpecialFunctionsGroupModels §0.3; Mathlib `Matrix.specialOrthogonalGroup`.

### Dependencies

SpecialFunctionsGroupModels §0.3.

## Layer 1: the circle models of `M(2)`

### 1.1 The models `T_R`, `R ∈ ℂ`

Sources: [VK1, §4.1.2 (1)–(3), p. 166, and the irreducibility argument on p. 167];
[KV, Ch. 1, §2.7 (28), p. 165]; [M, §3-8 (3.55)–(3.56), p. 73, and Lemma 3.2, pp. 74–75];
[D, §16, p. 57].

`circleAction R g f ψ = e^{iR⟨a, e(ψ)⟩} f(ψ − rotAngle k)` for `g = (a, k)`. A realization of
`T_R` (`IsCircleRealization R U`) is a representation `U` on `L²(𝕋)` that agrees almost everywhere
with it and has continuous orbit maps, as in SpecialFunctionsGroupModels §1.3; the theorems about
the representation are stated for every realization. Prove:
- **Representation law of the circle model** (`circleAction_mul`): `T_R(gh) = T_R(g) T_R(h)` on
  functions;
- **The identity acts trivially** (`circleAction_one`);
- **Agreement with the sphere model** (`circleAction_eq_motionAction`): for real `R`, `T_R` is
  SpecialFunctionsGroupModels' `motionAction R` on the unit circle;
- **Size of the multiplier** (`norm_circleAction`): `|e^{iR⟨a, e(ψ)⟩}| = e^{−Im R ⟨a, e(ψ)⟩}`, so
  `‖T_R(g)‖ ≤ e^{|Im R| |a|}`;
- **`L²` realization** (`exists_circleRealization`) for every complex `R`;
- the realization is unique: two realizations of `T_R` agree on every vector, since both agree
  almost everywhere with `circleAction R g f`;
- **Unitarity range** (`IsCircleRealization.isUnitary_iff`): a realization of `T_R` is unitary
  exactly when `R` is real;
- **`T_{−R}` and `T_R` are equivalent** (`circleAction_neg`) through the half-turn
  `f ↦ f(· + π)`;
- **Irreducibility of `T_R`, `R ≠ 0`** (`IsCircleRealization.irreducible`): for a realization of
  `T_R`, a closed invariant subspace is `0` or `L²(𝕋)`, for every nonzero complex `R`;
- **Equivalence classes of the `T_R`** (`IsCircleRealization.nonempty_intertwiner_iff`): for
  `R, R' ≠ 0`, realizations of `T_R` and `T_{R'}` are intertwined by a bounded operator with
  bounded inverse exactly when `R'² = R²`; for real `R, R' > 0` and unitary equivalence this gives
  SpecialFunctionsGroupModels §2.6's inequivalence at `n = 2`.

Route for irreducibility, which [VK1, p. 167] and [M, Lemma 3.2] give only for unitary `T_R`
through self-adjoint projections. Let `V` be closed and invariant. The rotations act by
`T(k_α) f = f(· − α)`, continuous in `α`, so the Fourier projection
`P_n f = ∫ e^{inα} T(k_α) f dα/2π = ⟨e_n, f⟩ e_n` of `f ∈ V` lies in `V`; hence `V` is the closed
span of the `e_n` it contains, and `V ≠ 0` contains some `e_n`. The map
`t ↦ T_R((t e(β), 1)) e_n` is differentiable in `L²` at `t = 0`, with derivative
`iR cos(· − β) e_n = (iR/2)(e^{−iβ} e_{n+1} + e^{iβ} e_{n−1})` (1.3), and the derivative lies in
`V` as a limit of difference quotients in `V`. Taking `β = 0` and `β = π/2` with `R ≠ 0` gives
`e_{n+1}, e_{n−1} ∈ V`, and by induction `V = L²(𝕋)`.

Route for the equivalence classes. `circleAction_neg` gives `T_{−R} ≅ T_R`. Conversely an
intertwiner `A` with `A T_R = T_{R'} A` commutes with the rotations, whose weights `−n` have
multiplicity one, so `A e_n = a_n e_n`. Differentiating `A T_R((t e(β), 1)) e_n` at `t = 0` and
comparing the coefficients of `e_{n±1}` gives `R a_{n+1} = R' a_n` and `R a_{n−1} = R' a_n`, so
`(R'/R)² = 1` when some `a_n ≠ 0`. In the unitary case the Casimir value `−R²` of 1.3 is the
same invariant.

**Checks.**
- For `R = 0`, `T_0(g) e_n = e^{−inα} e_n`: `T_0` is the sum of the characters `(a, k_α) ↦ e^{−inα}`
  and is reducible; irreducibility needs `R ≠ 0`.
- `|T_R(r e₁, 1) 1|(0) = e^{−r Im R}`, which is `e^{−0.8} = 0.44932 89641` at `R = i`, `r = 0.8`,
  so the model is not unitary there.
- `T_{−R}` and `T_R` have the same Casimir value `−R²`; at `R = 1.7`, `D^{−R}_{2,−1}` and
  `D^R_{2,−1}` at `(0.8 e₁, 1)` are `+0.04662 03227 i` and `−0.04662 03227 i`, related by
  `(−1)^{m−n} = −1` (1.2).
- Negative control: without the rotation in the argument, `f ↦ e^{iR⟨a, e(ψ)⟩} f(ψ)` is not a
  representation: the product law of 0.1 needs `f(ψ − α)` to turn `e^{iR⟨a', e(ψ − α)⟩}` into
  `e^{iR⟨k_α a', e(ψ)⟩}`.

*Needs:* 0.1; SpecialFunctionsGroupModels §§1.3, 2.6. That the `T_R`, `R > 0`, and the characters
exhaust the irreducible unitary representations of `M(2)` [VK1, p. 167] is the application of
NoncompactQuantumSymmetry M2 to `ℝ² ⋊ SO(2)`, whose orbits in the dual of `ℝ²` are the circles
`|y| = R` and the origin; it is stated in prose and is not a target here.

### 1.2 Matrix elements

Sources: [VK1, §4.1.3 (1)–(5), pp. 167–168]; [M, §3-8 (3.57), p. 73]; [KV, Ch. 2, §2.3,
p. 179]; [VK1, §4.1.5 (1), p. 170] (Bessel's integral as a Fourier coefficient).

Prove:
- **Bessel's integral on the circle** (`integral_exp_inner_fourier`):
  `∫_𝕋 e^{iR⟨r e(φ), e(ψ)⟩} e^{inψ} dψ/2π = iⁿ e^{inφ} Jₙ(R r)` for complex `R`; route: the
  Jacobi–Anger expansion of SpecialFunctionsBessel 4.1 at `t = i e^{i(ψ−φ)}`, integrated term by
  term; or Tau Ceti's Fourier coefficients of `e^{κ cos θ}` (Exact supplier contracts), which are
  this identity at `R r = −iκ`, since `iⁿ Jₙ(−iκ) = Iₙ(κ)`, with the identity theorem in `R`, both
  sides being entire;
- **Matrix elements of `T_R`** (`IsCircleRealization.matrixElement_polar`): for a realization,
  `D_{mn}(g(r, φ; α)) = i^{n−m} e^{i(n−m)φ} e^{−inα} J_{n−m}(R r)` [VK1, §4.1.3 (3), p. 168];
- **Weights** (`IsCircleRealization.apply_rotation_fourierLp`): `T_R(k_α) e_n = e^{−inα} e_n`;
- **Sign change of `R`** (`IsCircleRealization.matrixElement_neg`): for realizations of `T_R` and
  `T_{−R}`, `D^{−R}_{mn} = (−1)^{m−n} D^R_{mn}`;
- for real `R`, the unitarity relations of SpecialFunctionsGroupModels §3.2 at `g = (r e₁, 1)` are
  `Σ_k J_{k−m}(x) J_{k−n}(x) = δ_{mn}` [VK1, §4.1.4 (6), p. 169], which is DLMF 10.23.3–10.23.4
  of SpecialFunctionsBessel 4.2 for integer order (the odd differences vanish by `k ↦ m + n − k`);
  state the agreement.

**Checks.**
- At `R = 1.7`, `D_{2,−1}(g(0.8, 0.4; 1.1)) = −0.00465 42661 − 0.04638 74153 i` from the integral
  and from the closed form.
- At `R = 0.6 + 0.9i` the same element is `0.00453 57033 + 0.01297 66161 i` from both sides.
- At `g = (0.8 e₁, 1)`, `D_{2,−1} = i³ J₃(1.36) = −0.04662 03227 i`, SpecialFunctionsGroupModels
  §2.6's Check.
- `Σ_k J_{3−k}(2.3) J_{1−k}(2.3) = 0` and `Σ_k J_{2−k}(2.3)² = 1`.
- Negative control: Bessel's integral with `e^{−inψ}` in place of `e^{inψ}` at `R = 0.9 + 0.4i`,
  `r = 1.1`, `φ = 0.3`, `n = 3` is `0.00744 58507 − 0.02409 75058 i`, not
  `i³ J₃(R r) e^{3iφ} = 0.02177 55860 + 0.01272 61278 i`; and the closed form with `e^{+inα}` in
  place of `e^{−inα}` gives `−0.03476 50176 + 0.03106 20031 i` in the first Check. The order
  `m − n` in place of `n − m` changes the sign of every element with `m − n` odd.

*Needs:* 1.1; SpecialFunctionsBessel 4.1; SpecialFunctionsGroupModels §§3.1–3.2.

### 1.3 Infinitesimal operators

Sources: [VK1, §4.1.2 (4)–(9), p. 167]; [M, §3-7 (3.50)–(3.51), p. 71]; [VK1, §4.1.4, p. 170]
(the recurrences as infinitesimal addition theorems).

With `B_β = d/dt T_R((t e(β), 1))|₀`, multiplication by `iR cos(ψ − β)`, and `B₃ = −d/dψ`, the
operators `H± = B_{0} ± i B_{π/2}` act by `H± e_n = iR e_{n±1}`. Prove:
- **Ladder operators** (`hasDerivAt_circleAction_fourier`):
  `d/dt T_R((t e(β), 1)) e_n |₀ = (iR/2)(e^{−iβ} e_{n+1} + e^{iβ} e_{n−1})` pointwise;
- **Casimir value `−R²`** (`circleAction_casimir`): `B₀² + B_{π/2}² = −R²` on every function;
- **Lie derivative of matrix elements**
  (`IsCircleRealization.hasDerivAt_matrixElement_mul_translation`): for a realization,
  `d/dt D_{mn}(g (t e₁, 1))|₀ = (iR/2)(D_{m,n+1}(g) + D_{m,n−1}(g))`;
- with the closed form of 1.2, the last identity at `g = (r e₁, 1)` and the analogous one for
  `(t e₂, 1)` are the recurrences `J_{k−1} − J_{k+1} = 2J'_k` and `J_{k−1} + J_{k+1} = (2k/x) J_k`
  of SpecialFunctionsBessel 1.5, and the Casimir equation is Bessel's equation for `J_{n−m}(R r)`,
  the `M(2)` case of SpecialFunctionsGroupModels §4.3; state the agreement.

**Checks.**
- At `R = 1.2 + 0.3i`, `β = 0.7`, `n = 2`, `ψ = 0.4` both sides of the ladder identity are
  `−1.02205 65417 + 0.59311 22752 i`.
- At the same point `B₀² e₂ + B_{π/2}² e₂ = −R² e₂ = −0.42405 76722 − 1.47005 95534 i`.
- At `R = 1.7`, `(m, n) = (1, −2)`, `g = g(0.8, 0.4; 1.1)` the Lie derivative is
  `0.04278 48273 − 0.16131 61715 i` from both sides.
- Negative control: Vilenkin and Klimyk's `H± e_n = R e_{n±1}` (no factor `i`) is the same identity
  for their `T_R`, our `T_{−iR}`; read in our convention it gives the Casimir value `+R²`.

*Needs:* 1.1–1.2; SpecialFunctionsBessel 1.5; SpecialFunctionsGroupModels §4.3.

### Dependencies

Layer 0; SpecialFunctionsGroupModels §§1.3, 2.6, 3.1–3.2, 4.3; SpecialFunctionsBessel 1.5, 4.1–4.2.

## Layer 2: identities from the group law

### 2.1 The addition theorem in polar form

Sources: [VK1, §4.1.4 (1)–(6), pp. 168–169]; [M, (3.61)–(3.62), p. 75, and (3.32), p. 63];
[KV, Ch. 3, §1.4 (15), p. 187]; DLMF 10.23.7.

Prove:
- **Addition theorem in polar form** (`hasSum_besselJ_polar_addition`): if
  `r e^{iφ} = r₁ + r₂ e^{iφ₂}`, then for complex `R` and integers `m, n`,
  `e^{i(n−m)φ} J_{n−m}(R r) = Σ_k J_{k−m}(R r₁) J_{n−k}(R r₂) e^{i(n−k)φ₂}` [VK1, §4.1.4 (2),
  p. 168];
- the special cases `Σ_k (−1)^k e^{ikφ₂} J_k(r₁) J_k(r₂) = J₀(r)`,
  `Σ_k J_{n−k}(x) J_k(y) = J_n(x + y)`, `Σ_k (−1)^k J_{n−k}(x) J_k(y) = J_n(x − y)` and
  `Σ_k J_{n+k}(x) J_k(x) = δ_{n0}` [VK1, §4.1.4 (3)–(6), p. 169];
- the first bullet is Graf's addition theorem 10.23.7 of SpecialFunctionsBessel 4.2 at integer
  order; state the agreement.

Route: SpecialFunctionsGroupModels §3.2's addition theorem for `T_R` at `g₁ = (r₁ e₁, 1)`,
`g₂ = g(r₂, φ₂; 0)`, whose product is `g(r, φ; 0)` by 0.1, with the closed form of 1.2; the powers
of `i` cancel.

**Checks.**
- At `R = 0.7 + 0.2i`, `(m, n) = (1, 3)`, `r₁ = 1.3`, `r₂ = 0.7`, `φ₂ = 0.9` both sides are
  `0.08967 74027 + 0.17150 10358 i`.
- At `φ₂ = 0` the theorem is `J_{n−m}(R(r₁ + r₂)) = Σ_k J_{k−m}(R r₁) J_{n−k}(R r₂)`, Neumann's
  addition theorem.
- Negative control: with `e^{−i(n−k)φ₂}` in place of `e^{i(n−k)φ₂}` the sum in the first Check is
  `0.19176 22112 − 0.02611 31424 i`.

*Needs:* 0.1, 1.2; SpecialFunctionsGroupModels §3.2.

### 2.2 The multiplication formula and its radial form

Sources: [VK1, §4.1.4 (7)–(9), pp. 169–170]; [KV, Ch. 3, §2.4, p. 193]; DLMF 10.23.7 (the
geometry of Graf's theorem).

Prove:
- **Multiplication formula** (`integral_besselJ_circleMean`): with `w = r₁ + r₂ e^{iφ₂}`,
  `∫₀^{2π} (w/|w|)ⁿ e^{−imφ₂} Jₙ(R|w|) dφ₂ = 2π J_{n−m}(R r₁) J_m(R r₂)` [VK1, §4.1.4 (7),
  p. 169];
- **Radial form of the multiplication formula** (`besselJ_mul_besselJ_eq_integral`): for
  `r₁, r₂ > 0`,
  `J_{n−m}(r₁) J_m(r₂) = (2/π) ∫_{|r₁−r₂|}^{r₁+r₂} cos(nφ − mφ₂) r Jₙ(r) Δ^{−1/2} dr`, with
  `Δ = 4r₁²r₂² − (r² − r₁² − r₂²)²` (sixteen times the squared area of the triangle with sides
  `r₁, r₂, r`), `φ₂ = arccos((r² − r₁² − r₂²)/(2r₁r₂))` and `φ = arg(r₁ + r₂ e^{iφ₂})`
  [VK1, §4.1.4 (8)–(9), p. 170, with the cosine for the printed exponential].

Route: the multiplication formula is the orthogonality of `e^{ikφ₂}` applied to 2.1; the radial
form substitutes `r = |w|` on the two halves `φ₂ ∈ (0, π)` and `(π, 2π)`, whose contributions are
complex conjugates. The printed (8) has `e^{i(nφ − mφ₂)}` in place of the cosine; its left side
is real.

**Checks.**
- The circle mean at `R = 1`, `(m, n) = (1, 2)`, `r₁ = 1.3`, `r₂ = 0.7` is
  `J₁(1.3) J₁(0.7) = 0.17174 34254`; at `(m, n) = (1, 3)` it is `J₂(1.3) J₁(0.7) = 0.06021 50045`.
- At `R = 0.5 + 0.4i`, `(m, n) = (1, 3)` both sides are `−0.00693 81873 + 0.01776 29627 i`.
- The radial form at `m = n = 0` gives `J₀(1.3) J₀(0.7) = 0.54642 03250`, and at `(m, n) = (1, 3)`
  gives `0.06021 50045`.
- Negative control: the printed exponential form gives `0.06021 50045 − 0.00361 89355 i` at
  `(m, n) = (1, 3)`, not real.

*Needs:* 2.1.

### Dependencies

Layer 1; SpecialFunctionsGroupModels §3.2; SpecialFunctionsBessel 4.2.

## Layer 3: Miller's complex group `T₃`

### 3.1 The multiplier representation and its matrix elements

Sources: [M, §3-1 (3.3)–(3.11), pp. 52–55, and (3.12)–(3.16), pp. 56–57].

`T3` is `ℂ³` with the law of Conventions; it is a group (`Suggested.lean` proves the group laws).
`millerAction ω m₀ g f z = exp(ω b z + ω c / z + m₀ τ) f(e^τ z)`, and `millerMatrix ω m₀ l k g`
is Miller's (3.11),
`e^{(k+m₀)τ} Σ_s (ωb)^{s+(l−k)⁺} (ωc)^{s+(k−l)⁺} / ((s + (l−k)⁺)! (s + (k−l)⁺)!)`. Prove:
- **Representation law of Miller's model** (`millerAction_mul`): `A(gh) = A(g) A(h)`
  [M, (3.7), p. 54];
- **The identity acts trivially** (`millerAction_one`);
- **Generating function of the matrix elements** (`hasSum_millerMatrix`):
  `exp(ω b z + ω c / z + (k + m₀) τ) = Σ_l A_{lk}(g) z^{l−k}` for `z ≠ 0` [M, (3.9), p. 55]: the
  matrix of `A(g)` on the Laurent monomials `f_k(z) = z^k`;
- **Addition theorem for the matrix elements** (`hasSum_millerMatrix_mul`):
  `A_{lk}(gh) = Σ_j A_{lj}(g) A_{jk}(h)` [M, (3.10), p. 55];
- with Miller's `₀F₁` form (3.12), p. 56,
  `A_{lk} = e^{(m₀+k)τ} (ωc)^{k−l}/(k − l)! ₀F₁(k − l + 1; ω²bc)` for `k ≥ l` and the symmetric form
  for `l ≥ k`, the addition theorem at `τ = 0` is the `₀F₁` addition formula (3.16), p. 56, and its
  special cases on p. 57; state both.

**Checks.**
- At `(ω, m₀) = (−1, 0.3)`, `g = (0.3 + 0.2i, −0.5 + 0.1i, 0.2 + 0.4i)`, `A_{2,−1}(g)` is
  `−0.00067 84434 − 0.00647 24196 i` from the series and from the Laurent coefficient.
- With `h = (−0.4 + 0.3i, 0.2 + 0.6i, −0.3 + 0.1i)`, both sides of the addition theorem for
  `(l, k) = (1, −2)` are `−0.01673 21668 + 0.00648 04404 i`.
- `A_{lk}(1) = δ_{lk}`.
- The `₀F₁` addition formula at `n = 2`, `b₁ = 0.3`, `b₂ = 0.7`, `c₁ = −0.4`, `c₂ = 0.5` has both
  sides `0.51687 63947`.
- Negative control: the abelian law `(b + b', c + c', τ + τ')` on `ℂ³` breaks the representation
  law as soon as `τ ≠ 0`: `A(g) A(h)` has `b + e^τ b'` in the exponent; with that law the left
  side of the second Check is `0.00745 82509 + 0.02298 90030 i`.

*Needs:* Mathlib power series and `HasSum` over `ℤ`.

### 3.2 The Bessel form

Sources: [M, (3.13)–(3.15), p. 56, and (3.32), p. 63].

Prove:
- **Bessel form of the matrix elements** (`millerMatrix_eq_besselJ`): for `b = r v/2`,
  `c = −r/(2v)`, `v ≠ 0`, `A_{lk}(b, c, τ) = e^{(m₀+k)τ} (−v)^{l−k} J_{l−k}(−ω r)`
  [M, (3.14), p. 56];
- at `τ = 0`, `v = −1`, `ω = −1`, `k = 0` the generating function of 3.1 is
  `exp((r/2)(z − z⁻¹)) = Σ_l J_l(r) z^l` [M, (3.15), p. 56], SpecialFunctionsBessel 4.1's
  generating function; and the addition theorem of 3.1 in these coordinates is Graf's theorem
  [M, (3.32), p. 63]; state both agreements.

The parametrization `b = rv/2`, `c = −r/(2v)` is the content of Miller's (3.13), whose explicit
branches `r = 2|bc|^{1/2} e^{i(arg b + arg c + π)/2}`, `v = |b/c|^{1/2} e^{i(arg b − arg c − π)/2}`
are not needed: the headline is stated for every `r` and `v ≠ 0`.

**Checks.**
- At `ω = 2 + 0.5i`, `r = 1.1 + 0.3i`, `v = 0.7 − 0.5i`, `τ = 0.2 + 0.4i`, `m₀ = 0`:
  `A_{3,1} = 0.48510 79951 − 0.11578 56057 i` and `A_{1,3} = −1.35258 79958 + 0.12873 54117 i`,
  from both sides.
- `A_{lk}` with `b = c = 0` is `δ_{lk} e^{(m₀+k)τ}`, and `J_{l−k}(0) = δ_{lk}`.
- Negative control: with `J_{l−k}(ω r)` in place of `J_{l−k}(−ω r)` the value at `(l, k) = (2, 1)`
  is `−0.85141 20393 + 0.32540 91509 i` instead of `0.85141 20393 − 0.32540 91509 i`.

*Needs:* 3.1; Mathlib `Complex.besselJ`.

### 3.3 Weisner's generating function

Sources: [M, §3-4 (3.33)–(3.37), pp. 63–64, and (3.38), p. 65].

With `E_m(y) = Σ_k (−y/4)^k / (2^m k! Γ(m + k + 1))` (`besselJEntire`), the entire function with
`E_m(u²) = u^{−m} J_m(u)`, prove:
- **Weisner's generating function** (`hasSum_besselJ_weisner`): for complex `m`, `t ≠ 0` and
  `|x t| < 2`, `Σ_n Jₙ(x) tⁿ / Γ(m − n + 1) = (2 + x t)^m E_m(x² + 2x/t)`, with `1/Γ` zero at the
  poles [M, (3.38), p. 65].

Route (Miller): `h(x, t) = (2 + xt)^m E_m(x² + 2x/t)` is `T(g)[J_m(x) t^m]` for the element
`b = τ = 0`, `c = −1` of `T₃` acting by the two-variable realization of §3-3, (3.26), p. 61. The
Casimir operator `C_{0,0} = −∂²_x − x⁻¹∂_x + x⁻²(t²∂²_t + t∂_t)` (the first-order term `t ∂_t/x²`
is missing from the printed (3.33)) commutes with `T(g)`, so each Laurent coefficient `hₙ(x)` of
`h` in `t` solves Bessel's equation of order `n` and is bounded at `x = 0`, hence is `cₙ Jₙ`: by
SpecialFunctionsBessel 1.1 every solution is `c Jₙ + c′ Yₙ`, and `Yₙ` is unbounded at `0` by the
leading behaviour of its 2.2: 10.7.1 for `n = 0`, 10.7.4 for `n ≥ 1` and 10.7.5 for `n ≤ −1`.
The second eigen-equation (3.37) gives `c_{n+1} = (m − n) cₙ`, and `x = 0` gives
`c₀ = 1/Γ(m + 1)`.

**Checks.**
- At `m = 0.7`, `x = 0.9`, `t = 0.6` both sides are `0.69013 27265`.
- At `m = 0` only `n ≤ 0` survive, and the identity is
  `Σ_{n ≥ 0} J_{−n}(x) t^{−n}/n! = J₀(√(x² + 2x/t))`, the multiplication theorem DLMF 10.23.1
  for `J₀` at `λ² = 1 + 2/(xt)`; here `|λ² − 1| > 1`, outside the range `|λ² − 1| < 1` in which
  SpecialFunctionsBessel 4.2 states it (for `J` the series converges for every `λ`), so the Check
  does not use that statement; at `x = 0.9`, `t = 0.6` both sides are `0.25168 55588`.
- Negative control: the theorem is not a case of the generating function of 3.1, whose
  coefficients carry no `1/Γ(m − n + 1)`; at `m = 0.7` the term `n = 1` has weight
  `1/Γ(0.7) = 0.77038 31839`, not `1`.

*Needs:* 3.1–3.2; SpecialFunctionsBessel 1.1 (every solution is `c₁ J_ν + c₂ Y_ν`) and 2.2
(`Yₙ` unbounded at `0`).

### Dependencies

Mathlib; SpecialFunctionsBessel 1.1, 2.2, 4.1–4.2.

## Layer 4: the pseudo-Euclidean motion group `ISO(1,1)`

### 4.1 The hyperbola model

Sources: [VK1, §§4.2.1–4.2.3, pp. 171–175, with §4.2.3 (1)–(6), pp. 173–174];
[KV, Ch. 1, §2.9, pp. 166–167].

`hyperbolaAction R g Φ θ = e^{−R(a₁ cosh θ − a₂ sinh θ)} Φ(θ − s)` for `g = (a, s)`; a
realization (`IsHyperbolaRealization R U`) is a representation on `L²(ℝ)` that agrees almost
everywhere with it and has continuous orbit maps. Prove:
- **Representation law of the hyperbola model** (`hyperbolaAction_mul`);
- **The identity acts trivially** (`hyperbolaAction_one`);
- **`L²` realization exactly on the imaginary axis** (`exists_hyperbolaRealization_iff`): a
  realization with continuous orbit maps exists exactly when `Re R = 0`;
- **Unitarity of the hyperbola model** (`IsHyperbolaRealization.isUnitary`): every realization
  is unitary (by the previous bullet it exists only for `Re R = 0`, where the multiplier has
  modulus `1`);
- for `R ∈ iℝ \ {0}` the model is irreducible: it is the representation induced from the
  character `a ↦ e^{−R[x₀, a]}` of `ℝ²` at a point `x₀` of the hyperbola, whose orbit under
  `SO₀(1,1)` is one branch and whose stabilizer is trivial, and NoncompactQuantumSymmetry M2 gives
  irreducibility; state this agreement;
- for `R = 0` the model is the regular representation of `SO₀(1,1) ≅ ℝ` and is reducible.

The law uses that `Λ_s` preserves `[x, y] = x₁y₁ − x₂y₂`: `[Λ_{−s} x, a'] = [x, Λ_s a']`. The
printed equivalence `T_R ≅ T_{−R}` [VK1, p. 175] maps one branch of the hyperbola to the other; on
one branch `T_{iρ}` and `T_{−iρ}` are inequivalent for `ρ ≠ 0`, since the joint spectrum of the
translations lies on opposite branches of `y₁² − y₂² = ρ²`.

**Checks.**
- `[Λ_s x, Λ_s y] = [x, y]`: at `s = 1`, `x = y = (1, 0)` the form is `cosh² 1 − sinh² 1 = 1`.
- At `R = i`, `|T_R(g) Φ| = |Φ(· − s)|` pointwise.
- At `R = 1`, `g = ((−1, 0), 0)` the multiplier `e^{cosh θ}` is unbounded, so `T_1(g)` does not
  map `L²(ℝ)` into itself: no realization.
- Negative control: the Euclidean form `x₁y₁ + x₂y₂` in place of `[x, y]` breaks the law, since
  `Λ_s` does not preserve it.

*Needs:* SpecialFunctionsGroupModels §§0.3, 1.3; NoncompactQuantumSymmetry M2.

### 4.2 The Laplace realization and the Macdonald kernel

Sources: [VK1, §4.2.4 (1)–(8), pp. 175–176]; [KV, Ch. 1, §2.9 (33)–(35), p. 167]; DLMF 10.32.9.

`fourierLaplace Φ λ = ∫ Φ(θ) e^{λθ} dθ`, entire for continuous `Φ` with compact support, with the
inversion `Φ(θ) = (1/2πi) ∫_{a−i∞}^{a+i∞} F(μ) e^{−μθ} dμ` [VK1, §4.2.4 (2), p. 175]. Prove:
- **Boosts act diagonally** (`fourierLaplace_hyperbolaAction_boost`):
  `F_{(0,s)}(λ) = e^{λs} F(λ)` [VK1, §4.2.4 (3), p. 175];
- **Translations act by the Macdonald kernel** (`fourierLaplace_hyperbolaAction_translation`):
  for `Re R > 0`, `r > 0`, real `a` and smooth `Φ` with compact support,
  `F_{((r,0),0)}(λ) = (1/2π) ∫ (∫ e^{−Rr cosh θ + (λ − a − it)θ} dθ) F(a + it) dt`
  [VK1, §4.2.4 (4)–(6), pp. 175–176];
- the inner integral is `2 K_{λ−a−it}(R r)` by the `cosh` integral of SpecialFunctionsBessel 5.1
  (DLMF 10.32.9), so the kernel is Vilenkin and Klimyk's
  `(1/πi) K_{λ−μ}(R r) dμ`;
- for `g = (0, ψ)((r, 0), 0)(0, s − ψ)`, an element of the semigroup `|a₂| < a₁`
  [VK1, §4.2.2 (8), p. 173], the operator has the kernel `e^{λψ} (1/πi) K_{λ−μ}(R r) e^{μ(s−ψ)}`
  [VK1, §4.2.4 (7)–(8), p. 176].

**Checks.**
- For `Φ(θ) = e^{−(θ−0.5)²}`, `λ = 0.4 + 0.7i` and `s = 0.5`, both sides of the boost identity are
  `1.62513 90170 + 1.81305 76583 i`; at `s = 0` they are `F(λ) = 1.75888 31600 + 0.93816 74289 i`.
- For `Φ(θ) = e^{−θ²}`, `F(μ) = √π e^{μ²/4}`, `R = 0.8`, `r = 1.3`, `a = 0.2`, `λ = 0.4 + 0.7i`,
  both sides of the translation identity are `0.47429 63035 + 0.04156 61041 i`.
- At `μ = 0.1 + 0.3i` the inner integral is `2 K_{λ−μ}(1.04) = 0.77349 63299 + 0.06617 00352 i`.
- Negative control: for `g = ((0, r), 0)` the kernel integral `∫ e^{±R r sinh θ + (λ−μ)θ} dθ`
  diverges when `Re R ≠ 0` [VK1, p. 176]: only the semigroup `|a₂| < a₁` has an integral kernel of
  this form.

*Needs:* 4.1; SpecialFunctionsBessel 5.1.

### Dependencies

SpecialFunctionsGroupModels §§0.3, 1.3; NoncompactQuantumSymmetry M2; SpecialFunctionsBessel 5.1.

## Layer 5: the quasi-regular representation and the Hankel transform

### 5.1 The Fourier picture of `L(g) f = f ∘ g⁻¹`

Sources: [VK1, §4.4.1 (1)–(7), pp. 193–195]; [VK2, §9.1.8 (1)–(4), p. 19] (the Laplacian commutes
with `ISO(n)`).

`motionApply g x = a + k x` is the action of `M(n)` on `ℝⁿ`. Prove:
- **Fourier transform of a translate-rotate** (`fourier_comp_motionApply`): for every `f`,
  `𝓕(f ∘ g⁻¹)(ξ) = e^{−2πi⟨a, ξ⟩} 𝓕f(k⁻¹ξ)` (for a non-integrable `f` both sides are `0`, since
  `f ∘ g⁻¹` is then not integrable either);
- **On the circle `|ξ| = ρ` the quasi-regular representation is `T_{−2πρ}`**
  (`fourier_comp_motionApply_circle`): `ρ e(ψ) ↦ 𝓕(f ∘ g⁻¹)(ρ e(ψ))` is `T_{−2πρ}(g)` applied to
  `ψ ↦ 𝓕f(ρ e(ψ))`;
- the map `f ↦ (ρ ↦ 𝓕f(ρ e(·)))` is unitary from `L²(ℝ²)` onto `L²((0, ∞), 2πρ dρ; L²(𝕋))` and
  intertwines `L` with the field `ρ ↦ T_{−2πρ}`: the decomposition `L ≅ ∫^⊕ T_{2πρ} 2πρ dρ` of
  [VK1, §4.4.1 (7), p. 195], where their `T_R` is our `T_{−iR}`;
- **Cylindrical waves** (`laplacian_cylindricalWave`): `u(x) = Jₙ(R|x|)(x/|x|)ⁿ`, with `x` read as
  a complex number, satisfies `Δu = −R²u` on `x ≠ 0`, for complex `R`.

**Checks.**
- At `g = 1` the first identity is trivial; at `g = (a, 1)` it is the translation rule of `𝓕`.
- For `R = 1.7`, `n = 2`, `x = (0.6, −0.4)`, `Δu(x) = −R² u(x) = −0.18385 12093 + 0.44124 29024 i`.
- Negative control: with Vilenkin and Klimyk's kernel `e^{+i⟨x, y⟩}` the circle representation is
  `T_{+|y|}`; the plane-wave computation printed on [VK1, p. 195], with `e^{+i⟨x, y⟩}` in the
  inverse transform, is off by the factor `(−1)ⁿ R`.

*Needs:* 1.1; Mathlib `𝓕`, `Δ`.

### 5.2 The Hankel transform

Sources: [VK1, §4.4.2 (1)–(7), pp. 196–197]; [VK2, §10.2.6 (1)–(7), p. 186, and (13)–(17),
pp. 187–188]; DLMF 10.22.51, 10.22.67, 18.18.12.

`hankelTransform ν φ R = ∫₀^∞ φ(r) J_ν(Rr) r dr`. Prove:
- **Fourier transform of an angular mode** (`fourier_angularMode`): for `∫₀^∞ |φ(r)| r dr < ∞`,
  `ρ > 0`, `𝓕(φ(|x|) (x/|x|)ⁿ)(ρ e(ψ)) = 2π (−i)ⁿ e^{inψ} (Hₙφ)(2πρ)` [VK1, §4.4.2 (3), p. 196,
  in Mathlib's normalization];
- **Hankel inversion** (`hankelTransform_hankelTransform`): for real `ν > −1` and smooth `φ` with
  compact support in `(0, ∞)`, `H_ν H_ν φ = φ` on `(0, ∞)`;
- **Plancherel for the Hankel transform** (`lintegral_hankelTransform`) for the same `φ`:
  `∫₀^∞ |H_ν φ|² R dR = ∫₀^∞ |φ|² r dr`;
- `H_ν` extends to a unitary involution of `L²((0, ∞), r dr)`;
- **Laguerre functions are eigenfunctions** (`hankelTransform_laguerre`): for `ν > −1`, `λ > 0`,
  `H_ν(x^ν e^{−x²/2} L_k^ν(x²))(λ) = (−1)^k λ^ν e^{−λ²/2} L_k^ν(λ²)` [VK2, §10.2.6 (16), p. 188];
- the functions `x^ν e^{−x²/2} L_k^ν(x²)` are an orthogonal basis of `L²((0, ∞), x dx)`, and the
  unitary extension of `H_ν` is diagonal in it with eigenvalues `(−1)^k`.

Route for inversion and Plancherel, for every real `ν > −1`; [VK1, §4.4.2 (4)–(5), p. 196] derive
them for integer `ν` from the group, and [VK2, §10.2.6, p. 186] derive them for integer and
half-integer `ν` and assert them for every `ν`.
- *Decay.* With the Bessel operator `B = d²/dr² + r⁻¹ d/dr − ν²/r²`, Bessel's equation and two
  integrations by parts give `H_ν(Bφ) = −R² H_ν φ`, and `Bφ` is again smooth with compact support
  in `(0, ∞)`; so `H_ν φ(R) = O(R^{−2j})` for every `j` as `R → ∞`, and `H_ν φ(R) = O(R^ν)` as
  `R → 0` by the power series of `J_ν`.
- *Gaussian regularization.* For `p > 0`, Fubini and Weber's second exponential integral
  `∫₀^∞ e^{−p²t²} J_ν(st) J_ν(rt) t dt = (2p²)⁻¹ e^{−(r²+s²)/4p²} I_ν(rs/2p²)` (DLMF 10.22.67,
  SpecialFunctionsBessel 11.2) give
  `∫₀^∞ e^{−p²R²} H_ν φ(R) J_ν(Rr) R dR = ∫₀^∞ φ(s) k_p(r, s) s ds` with that kernel `k_p`.
- *Approximate identity.* By the large-argument form `I_ν(x) = e^x (2πx)^{−1/2} (1 + O(1/x))`
  (DLMF 10.40.1, SpecialFunctionsBessel 6.2),
  `k_p(r, s) s = (4πp²)^{−1/2} (s/r)^{1/2} e^{−(r−s)²/4p²} (1 + O(p²))` uniformly for `r, s` in a
  compact subset of `(0, ∞)`, which contains the support of `φ`; so the right side tends to `φ(r)`
  as `p → 0`. The left
  side tends to `H_ν H_ν φ(r)` by dominated convergence, by the decay step.
- *Plancherel* follows from inversion by Fubini, since the kernel `J_ν(Rr)` is symmetric; the
  unitary extension follows from the density of smooth functions with compact support in `(0, ∞)`
  in `L²((0, ∞), r dr)`.

Route for the Laguerre eigenfunctions. DLMF 10.22.51 (SpecialFunctionsBessel 11.2),
`∫₀^∞ J_ν(λt) e^{−p²t²} t^{ν+1} dt = λ^ν (2p²)^{−ν−1} e^{−λ²/4p²}`, differentiated `j` times in
`p²` at `p² = 1/2`, gives the moments
`∫₀^∞ e^{−x²/2} x^{2j+ν+1} J_ν(λx) dx = 2^j j! λ^ν e^{−λ²/2} L_j^ν(λ²/2)` [VK2, §10.2.6 (14),
p. 188, with `λ^ν` for the printed `λ^{−ν}`]. Expanding `L_k^ν(x²)` by its explicit sum, the
eigenfunction bullet reduces to the finite identity
`Σ_{j=0}^k C(k + ν, k − j) (−2)^j L_j^ν(y/2) = (−1)^k L_k^ν(y)`, the multiplication theorem
DLMF 18.18.12 at `λ = 2`, proved by comparing coefficients; the printed form of this identity,
[VK2, §10.2.6 (15), p. 188], is not used. The basis bullet is LaguerreJacobi §2.4's Hilbert basis
of Laguerre functions after `y = x²`, and the diagonal form follows from the eigenfunction bullet,
with the integral identified with the unitary extension on these functions by truncating them to
`[1/N, N]` and using Plancherel.

**Checks.**
- `H₀(e^{−r²/2})(1.3) = e^{−0.845} = 0.42955 73582`.
- `H₂(r² e^{−r²/2})(1.3) = 1.69 e^{−0.845} = 0.72595 19354`.
- At `ν = 0.3`, `k = 2`, `λ = 1.3` both sides of the eigenfunction identity are
  `−0.44798 00523`; at `k = 0` they are `0.46473 37023`.
- For `n = 2`, `φ(r) = r² e^{−r²}`, `ρ = 0.35`, `ψ = 0.6` both sides of the angular-mode identity
  are `−0.41081 82347 − 1.05668 67887 i`.
- At `ν = −0.6`, `p = 0.8`, `r = 1.1`, `s = 0.7`, Weber's integral of the regularization step is
  `0.45984 68172` from both sides.
- At `k = 1` the eigenvalue is `−1`: both sides are `0.18124 61439`.
- Negative control: the eigenvalue `+1` at `k = 1` would give `−0.18124 61439`; and the printed
  `λ^{−ν}` in the moment formula is off by the factor `λ^{2ν} = 1.05885 28529` at `ν = 0.3`,
  `λ = 1.1`.

*Needs:* 5.1; SpecialFunctionsBessel 6.2, 11.2; LaguerreJacobi §§1.1, 2.4.

### 5.3 The Fourier transform of radial functions on `ℝⁿ`

Sources: [VK2, §10.2.6 (1)–(2), p. 186]; [D, §16, p. 57].

Prove:
- **Fourier transform of a radial function on `ℝⁿ`** (`fourier_radial`): for `n ≥ 1`,
  `f(x) = φ(|x|)` with `∫₀^∞ |φ(r)| r^{n−1} dr < ∞` and `ξ ≠ 0`,
  `𝓕f(ξ) = 2π |ξ|^{1−n/2} ∫₀^∞ φ(r) J_{n/2−1}(2π|ξ| r) r^{n/2} dr`.

Route: integrate over spheres in polar coordinates and use 6.1,
`∫_{S^{n−1}} e^{−2πi r⟨ξ, ω⟩} dσ = |S^{n−1}| Ω_n(2π|ξ|, r)`, with 6.1's Bessel form. The
constants printed in [VK2, §10.2.6 (1)–(2)] are off for `n ≠ 3`; their product is right, and the
form here is derived from 6.1.

**Checks.**
- `e^{−π|x|²}` is its own transform: at `n = 3`, `|ξ| = 0.7` the right side is
  `e^{−0.49π} = 0.21451 39731`.
- At `n = 1` the formula is `2 ∫₀^∞ φ(r) cos(2π|ξ| r) dr`, since `J_{−1/2}(z) = √(2/(πz)) cos z`.
- At `n = 2` it is the angular-mode identity of 5.2 at `n = 0`.
- Negative control: the order `n/2` in place of `n/2 − 1` gives a function vanishing as `ξ → 0`
  for every `φ`, while `𝓕f(0) = ∫ f ≠ 0` for `f = e^{−π|x|²}`.

*Needs:* 6.1; Mathlib polar coordinates.

### Dependencies

Layer 1, 6.1; SpecialFunctionsBessel 6.2, 11.2; LaguerreJacobi §§1.1, 2.4; Mathlib `𝓕`.

## Layer 6: the Gel'fand pair `(M(n), SO(n))`

### 6.1 Zonal Bessel functions

Sources: [VK2, §9.3.2 (8)–(10), p. 48, and §9.3.3 (1)–(3), pp. 48–49]; [D, §16 (193), p. 57];
[KV, Ch. 2, §2.5 (28), p. 181]; DLMF 10.9.4.

`besselZonal n λ r = Γ(n/2) Σ_k (−λ²r²/4)^k / (k! Γ(k + n/2))`;
`motionSphericalFunction n λ (a, k) = Ω_n(λ, |a|)`; `rotationSubgroup n` is `K = {(0, k)}`. Prove:
- **Bessel form of the zonal function** (`besselZonal_eq_besselJ`): for `λ` in the slit plane and
  `r > 0`, `Ω_n(λ, r) = Γ(n/2)(2/(λr))^{n/2−1} J_{n/2−1}(λr)`;
- **Integral over the sphere** (`besselZonal_eq_integral_sphere`): `Ω_n(λ, |a|)` is the mean of
  `e^{iλ⟨a, ξ⟩}` over the unit sphere `S^{n−1}`, for `n ≥ 1` and complex `λ`;
- **Real-analyticity of the zonal function** (`contDiff_besselZonal`) in `r`, as a sum of a power
  series in `r²` with infinite radius;
- **Radial equation** (`besselZonal_ode`): `Ω″ + ((n − 1)/r) Ω′ = −λ² Ω` for `r > 0`.

Route for the sphere integral: for `n ≥ 2` and real `t`, Tau Ceti's von Mises–Fisher normalizer
(the surface-measure form in its VonMisesFisher Normalizer module) evaluates the surface integral of
`e^{t⟨a, ξ⟩}` through `I_{n/2−1}(t|a|)`, which is `Ω_n(−it, |a|)`; both sides are entire in
`λ = −it`, so the identity theorem gives every complex `λ`. The case `n = 1` is the two-point mean
`cos(λa)`. Alternatively, polar coordinates on `S^{n−1}` reduce the mean to Poisson's integral
DLMF 10.9.4 of SpecialFunctionsBessel 5.1. The printed survey formulas [KV, Ch. 2, §2.5 (28)–(29),
p. 181] are those of `S^n`, not `S^{n−1}`.

**Checks.**
- `Ω₂(λ, r) = J₀(λr)` and `Ω₃(λ, r) = sin(λr)/(λr)`: at `λ = 1.4`, `r = 0.9`, `Ω₃ = 0.75562 72552`.
- `Ω₄(1.4, 0.9) = 2 J₁(1.26)/1.26 = 0.81425 17801` from the series and from the Bessel form.
- `Ω_n(λ, 0) = 1` for every `n ≥ 1` and `λ`.
- Negative control: `Ω₂(5i, 1) = I₀(5) = 27.23987 18236`, larger than `1`: the sphere mean of
  `e^{iλ⟨a,ξ⟩}` is bounded by `1` only for real `λ`.

*Needs:* Mathlib `Complex.besselJ`, `Complex.Gamma`, `MeasureTheory.Measure.toSphere`; Tau Ceti's
von Mises–Fisher normalizer.

### 6.2 Spherical functions

Sources: [D, §16 (188)–(192), pp. 55–56, and (193), p. 57]; [VK2, §9.3.2 (8)–(10), p. 48].

Spherical functions are those of SpecialFunctionsGroupModels §5.2: continuous, bi-`K`-invariant,
equal to `1` at the identity and satisfying the functional equation; boundedness is not assumed.
Prove:
- **The spherical functions of `(M(n), SO(n))`** (`isSphericalFunction_motion_iff`): for `n ≥ 2`
  and an invariant probability measure on `K`, the spherical functions are exactly the `φ_λ`,
  `λ ∈ ℂ`;
- **The parameter is determined up to sign** (`motionSphericalFunction_inj`):
  `φ_λ = φ_μ` exactly when `λ² = μ²`;
- **Bounded spherical functions** (`bounded_besselZonal_iff`): `Ω_n(λ, ·)` is bounded on `[0, ∞)`
  exactly for real `λ`;
- **The bound is `1`** (`norm_besselZonal_le_one`) for real `λ`;
- the bounded spherical functions are the positive-definite ones, and the spherical transform of
  a radial `f(a) = φ(|a|)` is `|S^{n−1}| ∫₀^∞ φ(r) Ω_n(λ, r) r^{n−1} dr`, the radial Fourier
  transform of 5.3 at `λ = 2π|ξ|`;
- **The zonal matrix element of `T_R` is the spherical function**
  (`IsCircleRealization.matrixElement_zero_zero`) at `n = 2`: for a realization of `T_R`,
  `D_{00}(g) = Ω₂(R, |a|) = J₀(R|a|)`.

Route for the classification. Dieudonné proves it for positive-definite functions through
Gel'fand's theory and states the case `n ≥ 3` as a remark [D, p. 57]; the route here needs only
continuity and does not use spherical harmonics of `S^{n−1}`.
- *Reduction.* Bi-`K`-invariance gives `φ(a, k) = F(a)` with `F` radial, `F(a) = f(|a|)`, and the
  functional equation at `x = (a, 1)`, `y = (b, 1)` reads `∫_K F(a + k b) dk = F(a) F(b)`.
- *Smoothness.* Choose a smooth radial bump `h` with `c = ∫ F h ≠ 0` (possible since `F(0) = 1`
  and `F` is continuous). Integrating the functional equation against `h(b) db`, and using the
  rotation invariance of Lebesgue measure and of `h`, gives `c F = F ⋆ h`, a convolution with a
  smooth function of compact support; so `F` is smooth.
- *Eigenfunction.* Apply the Laplacian in `b` at `b = 0` to the functional equation; since `Δ`
  commutes with rotations, `ΔF(a) = ΔF(0) F(a)`. Write `ΔF(0) = −λ²`.
- *Radial equation.* `f` is smooth and even, `f(0) = 1`, and `f″ + ((n − 1)/r) f′ = −λ² f` for
  `r > 0`. The difference `g = f − Ω_n(λ, ·)` has `g(0) = g′(0) = 0` and
  `g′(r) = −λ² r^{1−n} ∫₀^r s^{n−1} g(s) ds`, so `|g′(r)| ≤ |λ|² r sup_{[0,r]} |g| / n`, and
  Grönwall's inequality gives `g = 0`.
- *Converse.* By 6.1, `Ω_n(λ, |c|)` is the sphere mean of `e^{iλ⟨c, ξ⟩}`. For `ξ ∈ S^{n−1}` the
  average `∫_K F(k⁻¹ξ) dk` is the normalized sphere mean of `F`: the image of the invariant
  probability measure of `K` under `k ↦ k⁻¹ξ` is a rotation-invariant probability measure on
  `S^{n−1}`, and `SO(n)` acts transitively on `S^{n−1}` for `n ≥ 2`, so averaging over `K` shows
  that every rotation-invariant probability measure integrates `F` to this average. Fubini then
  factors `∫_K Ω_n(λ, |a + k b|) dk` into `Ω_n(λ, |a|) Ω_n(λ, |b|)`.

**Checks.**
- At `n = 3`, `λ = 1.4`, `|a| = 0.8`, `|b| = 1.9`, the functional equation reads
  `(1/2) ∫₀^π Ω₃(λ, √(a² + b² + 2ab cos θ)) sin θ dθ = Ω₃(λ, a) Ω₃(λ, b) = 0.13994 31600`.
- At `n = 4` with the weight `(2/π) sin² θ` both sides are `0.29031 44269`.
- Negative control: at `n = 1`, `K` is trivial and `Ω₁(λ, a) = cos(λa)` is the sphere mean but not
  spherical: `cos(1.3) = 0.26749 88286 ≠ cos(0.5) cos(0.8) = 0.61141 76589`; the theorem needs
  `n ≥ 2`.

*Needs:* 6.1, 1.2; SpecialFunctionsGroupModels §§5.1–5.2; Mathlib convolution and the Laplacian.

### 6.3 The plane-wave expansion in `ℝ³`

Sources: [VK2, §9.3.3 (3), p. 48]; DLMF 10.60.7 and 14.30.9.

Prove:
- **Plane-wave expansion in `ℝ³`** (`hasSum_planeWave_sphericalHarmonic`): for `κ, r > 0` and
  unit vectors `k̂ = spherePoint θ φ`, `x̂ = spherePoint θ' φ'` at any real angles,
  `e^{i⟨κ k̂, r x̂⟩} = 4π Σ_l i^l j_l(κr) Σ_m Y_l^m(k̂) conj Y_l^m(x̂)` with
  `j_l(z) = √(π/(2z)) J_{l+1/2}(z)` (DLMF 10.47.3) and SpecialFunctionsSU2MatrixElements' `Y_l^m`
  (its §6.1);
- for general `n ≥ 3` the zonal form
  `e^{iz cos α} = Γ(ν)(z/2)^{−ν} Σ_k (ν + k) i^k J_{ν+k}(z) C_k^ν(cos α)`, `ν = n/2 − 1 > 0`, is
  DLMF 10.23.9 of SpecialFunctionsBessel 4.3; state the agreement with the sphere mean of 6.1, which
  is its `k = 0` term. At `n = 2` (`ν = 0`, where `Γ(ν)` has a pole and `C_k^0 = 0` for `k ≥ 1`)
  the expansion is the Jacobi–Anger expansion `e^{iz cos α} = J₀(z) + 2 Σ_{k≥1} i^k J_k(z) cos kα`
  of SpecialFunctionsBessel 4.1, whose constant term `J₀(z)` is the sphere mean of 6.1.

Route: at `n = 3` the zonal form is the plane-wave expansion 10.60.7 of SpecialFunctionsBessel 11.5,
and the first bullet follows from it by the addition theorem of spherical harmonics (DLMF 14.30.9),
owned by SpecialFunctionsLegendre §3.2, carried to SpecialFunctionsSU2MatrixElements' polynomial
`Y_l^m` by that roadmap's comparison in its §6.1. The comparison holds for polar angles in
`[0, π]`; a point of the sphere at other angles is the same point at angles in that range, and
`sphericalHarmonic` depends only on the point, so the expansion holds at every angle.

**Checks.**
- At `k = (0.9, 0.4, 1.2)`, `x = (−0.3, 0.7, 0.5)` both sides are `0.81964 80178 + 0.57286 74601 i`
  (30 terms).
- At `x̂ = k̂` the inner sum is `(2l + 1)/(4π)`, and the expansion is
  `e^{iz} = Σ (2l + 1) i^l j_l(z)`.
- Negative control: without the factor `i^l` the sum is real, `0.98765 73120` at the first
  Check.

*Needs:* SpecialFunctionsSU2MatrixElements §6.1; SpecialFunctionsLegendre §3.2;
SpecialFunctionsBessel 4.1, 4.3, 11.5.

### Dependencies

Layer 1, 5.3; SpecialFunctionsGroupModels §§5.1–5.2; SpecialFunctionsSU2MatrixElements §6.1;
SpecialFunctionsLegendre §3.2; SpecialFunctionsBessel 4.1, 4.3, 5.1, 11.5.

## Layer 7: contraction to the motion groups

### 7.1 Wigner's `d`-functions

Sources: [VK2, §9.3.4, p. 51] (the contraction of `SO(n)` to `ISO(n − 1)`); Edmonds's (4.1.15) and
(4.1.23) through SpecialFunctionsSU2MatrixElements §§2.3–2.4; DLMF 18.11.5.

Prove:
- **Contraction of Wigner's `d`-functions** (`tendsto_wignerSmallD_besselJ`): for fixed integers
  `p, q` and real `x`, `d^l_{pq}(x/l) → J_{p−q}(x)` as `l → ∞`;
- at `p = q = 0` this is the Mehler–Heine limit `P_l(cos(x/l)) → J₀(x)` through
  SpecialFunctionsSU2MatrixElements §2.6.

Route: the Jacobi form of `d^l_{pq}` of SpecialFunctionsSU2MatrixElements §2.4, with Mehler–Heine
for Jacobi polynomials of fixed integer parameters (DLMF 18.11.5), proved from the finite sum by
dominated convergence; the sign for `p < q` is that of `J_{p−q} = (−1)^{p−q} J_{q−p}`.

**Checks.**
- At `x = 1.7`, `d^{800}_{0,0}(1.7/800) = 0.39737 10368` and `J₀(1.7) = 0.39798 48594`.
- `d^{800}_{1,0}(1.7/800) = 0.57782 69529`, `J₁(1.7) = 0.57776 52315`;
  `d^{800}_{0,1}(1.7/800) = −0.57782 69529`.
- `d^{800}_{2,−1}(1.7/800) = 0.08528 95484`, `J₃(1.7) = 0.08514 99269`.
- Negative control: `J_{q−p}` in place of `J_{p−q}` has the wrong sign at `(p, q) = (1, 0)`.

*Needs:* SpecialFunctionsSU2MatrixElements §§2.3–2.4, 2.6.

### 7.2 Gegenbauer polynomials

Sources: [VK2, §9.3.4 (3), p. 51, with §9.3.3 (1)–(3), pp. 48–49].

Prove:
- **Contraction of Gegenbauer polynomials** (`tendsto_gegenbauer_besselJ`): for `Re p > 0`,
  `r > 0`, `(l!/Γ(2p + l)) C_l^p(cos(r/l)) → √π J_{p−1/2}(r) / ((2r)^{p−1/2} Γ(p))`
  [VK2, §9.3.4 (3), p. 51, with `(2r)` where the printed denominator has `(2p)`];
- equivalently, for `p` with `Γ(2p)` finite and nonzero,
  `C_l^p(cos(r/l))/C_l^p(1) → Ω_{2p+1}(1, r)`, by `C_l^p(1) = Γ(2p + l)/(l! Γ(2p))` and Legendre's
  duplication formula.

Route: the explicit sum of `gegenbauer` (LaguerreJacobi §6.2) in powers of `2 cos(r/l)`, compared
term by term with the power series of `J_{p−1/2}`, with dominated convergence. At
`p = (n − 1)/2` the second bullet expresses the contraction of the normalized zonal spherical
functions of `SO(n + 1)` to those of `(M(n), SO(n))` of 6.2; this reading is a remark and not a
target here.

**Checks.**
- At `p = 1.5`, `r = 2.2` the left side is `0.24098 12503`, `0.25123 09552`, `0.25251 29826` at
  `l = 50, 400, 3000`, and the limit is `0.25271 04772 = Ω₄(1, 2.2)/Γ(3)`.
- At `p = ½`, `C_l^{1/2} = P_l` and the limit is `J₀(r)`, 7.1 at `p = q = 0`.
- Negative control: the printed denominator `(2p)^{p−1/2}` gives `0.37064 20332` at `p = 1.5`,
  `r = 2.2`, not the limit `0.25271 04772`; and without the factor `l!/Γ(2p + l)` the left side
  grows like `l^{2p−1}`.

*Needs:* LaguerreJacobi §6.2; 6.1.

### Dependencies

SpecialFunctionsSU2MatrixElements §§2.3–2.4, 2.6; LaguerreJacobi §6.2; 6.1.

## Worked examples

- The three-Bessel integral
  `∫₀^∞ J_{n−m}(R r₁) J_m(R r₂) Jₙ(R r) R dR = (2/π) cos(nφ − mφ₂)/√Δ` for
  `|r₁ − r₂| < r < r₁ + r₂`, and `0` for `r` outside `[|r₁ − r₂|, r₁ + r₂]`
  [VK1, §4.4.2 (8), pp. 197–198, with the cosine where the printed text has the exponential]. The
  integrand is of size `R^{−1/2}`, so the integral is improper, `lim_{T→∞} ∫₀^T`. The general case
  follows from 2.2 by the pointwise Hankel inversion theorem for functions integrable against
  `r^{1/2} dr` and of bounded variation near `r`, which 5.2 does not contain: 5.2 inverts
  functions in `L²((0, ∞), r dr)`, and `r ↦ (2/π) cos(nφ − mφ₂)/√Δ` is not square-integrable
  there, its square having the singularity `1/Δ` at both ends. At `m = n = 0` it is DLMF 10.22.74
  at `ν = 0` of SpecialFunctionsBessel 11.3, `1/(2πA)` with `A = √Δ/4` the area of the triangle:
  at `r₁ = 1.3`, `r₂ = 0.7`, `r = 1.5` both forms are `0.35005 00923`.
- `D_{00}(g) = J₀(R|a|)`: the zonal matrix element of `T_R` is the spherical function of 6.2 at
  `n = 2`; at `R = 1.7`, `|a| = 0.8` it is `J₀(1.36) = 0.58838 50403`.

## Downstream consumers

None on main. The sibling roadmaps of the same family on spheres in higher dimension and on
rank-one symmetric spaces sit beside this one on SpecialFunctionsGroupModels; neither consumes this
roadmap, and this roadmap consumes neither.

## Scope and ownership

The roadmap is complete when Tau Ceti proves every statement of `Suggested.lean` and the prose
targets of the layers above:

0. **The plane motion group in polar coordinates** (0.1).
1. **The circle models of `M(2)`** (1.1–1.3).
2. **Identities from the group law** (2.1–2.2).
3. **Miller's complex group `T₃`** (3.1–3.3).
4. **The pseudo-Euclidean motion group `ISO(1,1)`** (4.1–4.2).
5. **The quasi-regular representation and the Hankel transform** (5.1–5.3).
6. **The Gel'fand pair `(M(n), SO(n))`** (6.1–6.3).
7. **Contraction to the motion groups** (7.1–7.2).

Owned here: the circle models of `M(2)` for complex `R` with their realization, irreducibility,
equivalence classes, matrix elements and infinitesimal operators; the group-theoretic forms of the
Bessel addition and multiplication theorems for integer order; Miller's `T₃` model and Weisner's
identity; the hyperbola model of `ISO(1,1)` with its Laplace realization and Macdonald kernel; the
Fourier picture of the quasi-regular representation of `M(n)`; the Hankel transform for real order
`ν > −1` with inversion, Plancherel and Laguerre eigenfunctions; the Fourier transform of radial
functions on `ℝⁿ`; the zonal Bessel functions and the spherical functions of `(M(n), SO(n))`; the
plane-wave expansion in `ℝ³` in the polynomial spherical harmonics; and the two contraction limits
of Layer 7, which are the integer-parameter and Gegenbauer cases of DLMF 18.11.5.

**Boundaries.**
- SpecialFunctionsGroupModels owns the groups `M(n)` and `ISO(1,1)` with their topology and Haar
  measures (its §0.3), the sphere models of `M(n)` for real `R > 0` with their representation law
  and unitarity (§2.6), matrix elements with the addition theorem and unitarity relations for any
  representation on a Hilbert space (§§3.1–3.2), the second-order equation of matrix elements
  (§4.3) and Gel'fand pairs and spherical functions for compact `K` (§§5.1–5.2). Its scope leaves
  the Bessel identification and the integral transforms to the special-function roadmaps; this
  roadmap owns their instances on `M(2)` with complex `R`, the identification of the matrix
  elements with Bessel functions, and the spherical functions of `(M(n), SO(n))`.
- SpecialFunctionsSU2MatrixElements owns Wigner's `d`-functions in Edmonds's convention (its §2.3),
  their Jacobi and Legendre forms (§§2.4, 2.6) and the spherical harmonics as polynomials on `ℝ³`
  (§6.1). [SpecialFunctionsLegendre](../SpecialFunctionsLegendre/README.md) owns the addition
  theorem of spherical harmonics (its §3.2).
  Layer 7 and 6.3 consume them.
- [SpecialFunctionsBessel](../SpecialFunctionsBessel/README.md) owns the analytic theory of the
  cylinder functions for complex order: the generating function and the Jacobi–Anger expansions
  (its 4.1), the multiplication theorem and the addition theorems of Neumann and Graf (4.2),
  Gegenbauer's addition theorem and the expansion 10.23.9 (4.3), the integral representations
  including the `cosh` integral of `K_ν` (5.1), the large-argument behaviour of `I_ν` (6.2), Weber's
  exponential integrals (11.2), the integrals of three Bessel functions (11.3) and the plane-wave
  expansion 10.60.7 (11.5). This roadmap owns the group-theoretic forms of these identities for
  integer order (2.1–2.2), states the agreement and does not restate the analytic versions. That
  roadmap's Beyond leaves the Hankel transform and the Fourier transform of radial functions in
  `ℝⁿ` with no planned roadmap, and assigns the Mehler–Heine limits to the orthogonal-polynomial
  and Legendre roadmaps, none of which owns them; this roadmap owns the Hankel transform for real
  order `ν > −1` (5.2), the radial Fourier transform (5.3) and the two contraction limits of
  Layer 7. The general Mehler–Heine formula for Jacobi polynomials with complex parameters stays
  with the orthogonal-polynomial roadmaps.
- [NoncompactQuantumSymmetry](../NoncompactQuantumSymmetry/README.md) owns the regular Mackey
  machine (its M2), which classifies the irreducible unitary representations of `M(2)` and
  `ISO(1,1)` and gives the irreducibility of the hyperbola models; 1.1 and 4.1 state the
  agreement. This roadmap proves the irreducibility of the circle models directly (1.1), for
  complex `R` as well.
- [LaguerreJacobi](../LaguerreJacobi/README.md) owns the Laguerre and Gegenbauer polynomials and
  the completeness of the Laguerre functions; 5.2 and 7.2 consume them.
- The plane-wave expansion in `ℝⁿ`, `n ≥ 4`, in spherical harmonics of `S^{n−1}`, the Funk–Hecke
  formula in dimension `n ≥ 4`, and the zonal spherical functions of `SO(n + 1)` belong to the
  sibling roadmap on spheres in higher dimension of the same family. This roadmap does not consume
  it: 6.2 classifies the spherical functions without spherical harmonics of `S^{n−1}`, 6.3 states
  only the zonal form 10.23.9 for `n ≥ 3` (and Jacobi–Anger for `n = 2`), and 7.2 states the
  Gegenbauer limit as a fact about polynomials.

## Exact supplier contracts

### From Tau Ceti

- `ContRepresentation.IsUnitary` (`TauCeti/RepresentationTheory/Continuous/Unitary/Basic.lean`):
  the unitarity predicate, in 1.1 and 4.1.
- The Fourier coefficients of `e^{κ cos θ}` on the circle, the theorem
  integral_exp_mul_cos_sub_mul_fourier of the namespace Real in
  `TauCeti/Analysis/Fourier/ExpCos.lean`: for real `κ`,
  `∫ e^{κ cos(θ − m)} e^{inθ} dθ/2π = e^{inm} I_{|n|}(κ)` against `haarAddCircle`, the real-exponent
  case of Bessel's integral in 1.2. 1.2 uses it only in a proof route, and `Suggested.lean` does
  not import it.
- The von Mises–Fisher normalizer on the surface measure, the theorem
  integral_exp_inner_toSphere_eq_besselI of the namespace TauCeti.Probability in
  `TauCeti/Probability/Distributions/VonMisesFisher/Normalizer.lean`: the surface integral of
  `e^{⟨η, x⟩}` over the unit sphere in dimension at least `2`, through `I_{d/2−1}(|η|)`, in 6.1.
  6.1 uses it only in the proof route, and `Suggested.lean` does not import it.

### From Mathlib

- `Complex.besselJ`, `Complex.besselJ_neg_int`: Bessel functions throughout.
- `haarAddCircle`, `fourier`, `fourierLp`, `fourierBasis`: the circle, its normalized measure and
  the trigonometric Hilbert basis, in Layer 1.
- The Fourier transform `𝓕` on `EuclideanSpace ℝ (Fin n)`: in Layer 5.
- `MeasureTheory.Measure.toSphere`: the surface measure, in 6.1.
- The Laplacian `Δ`: in 5.1 and 6.2; convolution with smooth functions of compact support, in 6.2.
- `Complex.Gamma`, `Matrix.specialOrthogonalGroup`, `Matrix.toEuclideanLin`, `Complex.arg`.

### From SpecialFunctionsGroupModels

- §0.3: the motion groups `MotionGroup n` and `ISO11`, the topological-group instances, Haar
  measures and the polar decomposition.
- §1.3: realization of a pointwise action on `L²` by a representation with continuous orbit maps.
- §2.6: the sphere model `motionAction`.
- §§3.1–3.2: `matrixElement`, the addition theorem, the inverse and the unitarity relations.
- §4.3: the second-order equation of matrix elements.
- §§5.1–5.2: `IsBiInvariant` and `IsSphericalFunction`.

### From SpecialFunctionsSU2MatrixElements

- §2.3: `wignerSmallD`; §2.4: the Jacobi form of `d`, with `jacobi` (LaguerreJacobi §3.2); §2.6: the
  Legendre form `d^l_{00} = P_l`; §6.1: `spherePoint`, `sphericalHarmonic` and the comparison with
  the spherical harmonics of SpecialFunctionsLegendre §3.1.

### From SpecialFunctionsLegendre

- [SpecialFunctionsLegendre](../SpecialFunctionsLegendre/README.md) §3.2: the addition theorem of
  spherical harmonics, DLMF 14.30.9, in 6.3.

### From SpecialFunctionsBessel

- [SpecialFunctionsBessel](../SpecialFunctionsBessel/README.md) 1.1 (every solution of Bessel's
  equation is `c₁ J_ν + c₂ Y_ν`), 1.5 (recurrences), 2.2 (10.7.1, 10.7.4–10.7.5, `Yₙ` unbounded
  at `0`), 4.1 (generating function and Jacobi–Anger, also for `n = 2` in 6.3), 4.2 (10.23.1,
  10.23.3–10.23.4, Graf's 10.23.7), 4.3 (10.23.9, for `ν ∉ {0, −1, −2, …}`), 5.1 (10.9.4 and the
  `cosh` integral 10.32.9), 6.2 (10.40.1), 11.2 (10.22.51 and 10.22.67), 11.3 (10.22.74) and 11.5
  (10.60.7), consumed as stated in the layers.

### From LaguerreJacobi

- [LaguerreJacobi](../LaguerreJacobi/README.md) §1.1 (`laguerre`), §2.4 (the Hilbert basis of
  Laguerre functions), §6.2 (`gegenbauer`).

### From NoncompactQuantumSymmetry

- [NoncompactQuantumSymmetry](../NoncompactQuantumSymmetry/README.md) M2: the regular Mackey
  machine, for the exhaustion remark of 1.1 and the irreducibility statement of 4.1.

`Suggested.lean` imports only Mathlib and Tau Ceti modules; it carries verbatim local copies of
the definitions it needs from other roadmaps, each with a docstring naming the owner.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material lies outside this roadmap. It is recorded only to fix the boundary.
Contributors should not attempt it under this roadmap.

- **The other kernels of `ISO(1,1)`**: the translations `((0, ±r), 0)` and `((±1, ±1), 0)`, whose
  operators in the Laplace realization are Gamma-function kernels and, for `Re R = 0`,
  Hankel-function kernels [VK1, §4.2.4, from p. 176 on], and the resulting addition theorems for
  `K_ν` and `H_ν`.
- **The quasi-regular representation of `ISO(1,1)`** and its sector transforms [VK1, §4.4.3 ff.,
  from p. 198].
- **Kontorovich–Lebedev and Mellin forms** of these transforms, and the Neumann, Struve and Meijer
  transforms of [VK2, §10.2.6 (8)–(12), p. 187].
- **The representations of `ISO(n)` for `n ≥ 3`** on `L²(S^{n−1})` with their matrix elements
  [VK2, §9.2.4 and Ch. 10], which need the spherical harmonics of `S^{n−1}`.
- **Contraction of representations** (operator convergence of `T^l(g(x/l))` to `T_R(g)`) beyond
  the matrix-element limits of Layer 7, and the contraction of `SO₀(n, 1)` [VK2, §9.3.4 (4),
  p. 51].

## Prior formalization

[lean-SFVK](https://github.com/bjbraams/lean-SFVK) (Apache-2.0), by the author of this roadmap,
proves the following targets without `sorry` at commit `2a512fe`, against Tau Ceti and the
lean-DLMF Gegenbauer, Laguerre, spherical Bessel and spherical harmonic functions in place of the
local copies here. Its statements split each conjunction into one lemma per fact; its modules are
a cited source, not the specification. Its names and statements are those used here except in two
places. First, it defines the two models on `L²` by choice (circleRep and hyperbolaRep: a
realization when one exists, the trivial representation otherwise) and states the eight theorems
that take a realization here, `IsCircleRealization.isUnitary_iff`,
`IsCircleRealization.irreducible`, `IsCircleRealization.matrixElement_polar`,
`IsCircleRealization.apply_rotation_fourierLp`, `IsCircleRealization.matrixElement_neg`,
`IsCircleRealization.hasDerivAt_matrixElement_mul_translation`,
`IsCircleRealization.matrixElement_zero_zero` and `IsHyperbolaRealization.isUnitary`, for the
chosen representation, under the names isUnitary_circleRep_iff, circleRep_irreducible,
matrixElement_circleRep_polar, circleRep_rotation_fourierLp, matrixElement_circleRep_neg,
hasDerivAt_matrixElement_mul_translation, matrixElement_circleRep_zero_zero and
isUnitary_hyperbolaRep. The two forms are equivalent by `exists_circleRealization`,
`exists_hyperbolaRealization_iff` and the uniqueness of the realization (1.1). Second, its radial
multiplication formula assumes `r₁ ≠ r₂`.

- 0.1: `rotation_add`, `exists_rotation_eq`, `rotAngle_rotation`, `rotAngle_mul`,
  `toComplex_rotE_rotation`, `toComplex_polar_mul_a`, `polar_mul_k`, `exists_polar`
  (`SFVK/MotionGroups/Basic/Group.lean`, `SFVK/MotionGroups/Polar.lean`).
- 1.1: `circleAction_mul`, `circleAction_one`, `circleAction_eq_motionAction`,
  `norm_circleAction`, `exists_circleRealization`, `IsCircleRealization.isUnitary_iff`,
  `circleAction_neg`
  (`SFVK/MotionGroups/Basic/CircleModel.lean`, `SFVK/MotionGroups/CircleModel.lean`).
- 1.2–1.3: `integral_exp_inner_fourier`, `IsCircleRealization.matrixElement_polar`,
  `IsCircleRealization.apply_rotation_fourierLp`, `IsCircleRealization.matrixElement_neg`,
  `hasDerivAt_circleAction_fourier`, `circleAction_casimir`,
  `IsCircleRealization.hasDerivAt_matrixElement_mul_translation`
  (`SFVK/MotionGroups/CircleModel.lean`, `SFVK/MotionGroups/MatrixElements.lean`).
- 2.1–2.2: `hasSum_besselJ_polar_addition`, `integral_besselJ_circleMean`, and
  `besselJ_mul_besselJ_eq_integral` for `r₁ ≠ r₂` (`SFVK/MotionGroups/Addition.lean`).
- 3.1–3.2: `millerAction_mul`, `millerAction_one`, `hasSum_millerMatrix`,
  `hasSum_millerMatrix_mul`, `millerMatrix_eq_besselJ` (`SFVK/MotionGroups/Basic/Miller.lean`,
  `SFVK/MotionGroups/Miller.lean`).
- 4.1–4.2: `hyperbolaAction_mul`, `hyperbolaAction_one`, `exists_hyperbolaRealization_iff`,
  `IsHyperbolaRealization.isUnitary`, `fourierLaplace_hyperbolaAction_boost`,
  `fourierLaplace_hyperbolaAction_translation`
  (`SFVK/MotionGroups/Basic/Hyperbola.lean`, `SFVK/MotionGroups/Hyperbola.lean`).
- 5.1–5.3: `fourier_comp_motionApply`, `fourier_comp_motionApply_circle`,
  `laplacian_cylindricalWave`, `fourier_angularMode`, `hankelTransform_laguerre`, `fourier_radial`
  (`SFVK/MotionGroups/Hankel.lean`).
- 6.1–6.2: `besselZonal_eq_besselJ`, `besselZonal_eq_integral_sphere`, `contDiff_besselZonal`,
  `besselZonal_ode`, `motionSphericalFunction_inj`, `bounded_besselZonal_iff`,
  `norm_besselZonal_le_one`, `IsCircleRealization.matrixElement_zero_zero`
  (`SFVK/MotionGroups/Basic/Zonal.lean`, `SFVK/MotionGroups/Spherical.lean`).
- 7.1–7.2: `tendsto_wignerSmallD_besselJ`, and the Gegenbauer limit of 7.2 stated for lean-DLMF's
  ultraspherical polynomial (`SFVK/MotionGroups/Contraction.lean`).

Open there: `IsCircleRealization.irreducible` (1.1), `hasSum_besselJ_weisner` (3.3),
`hankelTransform_hankelTransform` and `lintegral_hankelTransform` (5.2),
`isSphericalFunction_motion_iff` (6.2) and `hasSum_planeWave_sphericalHarmonic` (6.3). Not in
lean-SFVK: `IsCircleRealization.nonempty_intertwiner_iff` (1.1).

## References

- [D] J. Dieudonné, *Special Functions and Linear Representations of Lie Groups*, CBMS Regional
  Conference Series in Mathematics 42, AMS, 1980, §16.
- [KV] A. U. Klimyk, N. Ja. Vilenkin, *Representations of Lie groups and special functions*, in
  A. A. Kirillov (ed.), *Representation Theory and Noncommutative Harmonic Analysis II*,
  Encyclopaedia of Mathematical Sciences 59, Springer, 1995, Part II, Ch. 1 §§2.7, 2.9, Ch. 2
  §§2.3, 2.5, Ch. 3 §§1.4, 2.4.
- [M] W. Miller, Jr., *Lie Theory and Special Functions*, Mathematics in Science and Engineering 43,
  Academic Press, 1968, Ch. 3, §§3-1–3-8.
- [VK1] N. Ja. Vilenkin and A. U. Klimyk, *Representation of Lie Groups and Special Functions*,
  Vol. 1, Mathematics and Its Applications (Soviet Series) 72, Kluwer, 1991, Ch. 4.
- [VK2] N. Ja. Vilenkin and A. U. Klimyk, *Representation of Lie Groups and Special Functions*,
  Vol. 2, Mathematics and Its Applications (Soviet Series) 74, Kluwer, 1993, §§9.1.8, 9.3, 10.2.6.
- [DLMF] *NIST Digital Library of Mathematical Functions*, https://dlmf.nist.gov/, §§10.9, 10.22,
  10.23, 10.32, 10.40, 10.47, 10.60, 14.30, 18.11, 18.18.

The following misprints of the sources are corrected wherever the README uses those formulas:
- [VK1, §4.1.4 (8), p. 170] and [VK1, §4.4.2 (8) and the following display, pp. 197–198]: the
  exponential `e^{i(nφ − mφ₂)}` for `cos(nφ − mφ₂)`;
- [VK1, §4.2.3, p. 175]: the equivalence `T_R ≅ T_{−R}`, which exchanges the two branches of the
  hyperbola and fails for the one-branch models;
- [VK1, §4.4.1, p. 195]: the sign of the exponent in the plane-wave computation;
- [VK2, §9.3.4 (3), p. 51]: the denominator `(2p)^{p−1/2}` for `(2r)^{p−1/2}`;
- [VK2, §10.2.6 (1)–(2), p. 186]: the constants of the radial Fourier pair for `n ≠ 3`;
- [VK2, §10.2.6 (14), p. 188]: `λ^{−α}` for `λ^{α}`;
- [VK2, §10.2.6 (15), p. 188]: the Laguerre sum, replaced by DLMF 18.18.12 at `λ = 2`;
- [M, (3.33), p. 63]: the missing first-order term `t ∂_t / x²` of the Casimir operator;
- [KV, Ch. 2, §2.5 (28)–(29), p. 181]: the formulas of `S^n` printed for the model on `S^{n−1}`.
