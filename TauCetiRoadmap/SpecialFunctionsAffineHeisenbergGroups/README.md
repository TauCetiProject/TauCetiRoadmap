# Roadmap: special functions from affine, triangular and Heisenberg groups

**Summary.** This roadmap derives the Gamma and Beta functions, the Whittaker functions, and the
Hermite, Laguerre and Charlier polynomials as kernels and matrix elements of representations of
solvable and nilpotent Lie groups: the `ax + b` group, the group of real upper triangular `3 × 3`
matrices with unit corners, the three-dimensional Heisenberg group, the oscillator group and
Miller's complex four-parameter group `G(0, 1)`. Its headline results are these.
- In the Mellin transform the dilations of the `ax + b` group act diagonally and a translation
  acts by an integral operator whose kernel is a Gamma function. Two translations compose, and so
  do their kernels: this composition is the Mellin–Barnes integral of `(1 + u)^{−w}`, and its
  Mellin dual is the Beta integral on the half-line.
- The representations of the triangular group on the line,
  `f(x) ↦ e^{ωτ + σ(dx + b)} f(e^τ x + a)`, are unitary exactly when `Re σ = 0` and `Re ω = 1/2`;
  the unitary ones with `σ ≠ 0` are irreducible and pairwise inequivalent. In the signed Mellin
  transform they act by a `2 × 2` matrix of kernels. On the one-parameter subgroups these kernels
  are powers and Beta quotients, and on the two unipotent subgroups `exp t(a₊ ± a₋)` they are the
  Whittaker functions `W_{κ,μ}(t²)` and `M_{κ,μ}(t²)`. Factoring these unipotent elements and
  composing their kernels gives the Mellin–Barnes integrals of the Whittaker functions.
- The matrix elements of the Schrödinger representation of the Heisenberg group in the Hermite
  basis are Laguerre functions `e^{−A/2} A^{(m−n)/2} L_n^{(m−n)}(A)` with `A = (x² + y²)/2`. They
  satisfy an addition theorem, are orthogonal on `ℝ²` with norm `2π` and form a Hilbert basis of
  `L²(ℝ²)`. On the translations they are the Charlier polynomials, whose duality, Laguerre form,
  orthogonality and completeness follow.
- The Bargmann transform carries the Schrödinger model isometrically onto the Fock space of entire
  functions. On that space the oscillator group, a covering of the matrix group with a real
  rotation angle, acts irreducibly, and its matrix elements are the Laguerre matrix elements
  times a rotation phase.
- Miller's group acts on entire functions by `f(z) ↦ e^{μ(bz + a) − ωτ} f(e^τ(z + c))`. Its
  matrix elements on monomials are Laguerre polynomials, which gives the Laguerre generating
  function `e^{−xz}(1 + z)^m = Σ_n L_n^{(m−n)}(x) zⁿ` and the Laguerre addition theorem.

The roadmap is a synthesis. It is ordered by the groups and their models rather than by any
source, and each section cites Vilenkin–Klimyk, Klimyk–Vilenkin, Miller, Wawrzyńczyk and
Dieudonné where they treat the same result; the forms and hypotheses stated here are checked
against all of them and against direct computation.

It builds on five roadmaps. SpecialFunctionsGroupModels supplies the `ax + b` group, the oscillator
matrices, the multiplier representations on `L²`, the Schrödinger representation with its
irreducibility (which it takes from NoncompactQuantumSymmetry), and the abstract matrix elements
with their addition theorem and unitarity relations. SpecialFunctionsConfluent supplies the
Whittaker functions with their integral representations, Mellin–Barnes integrals, recurrences and
differential equation, which the kernels of the triangular group are identified with.
[LaguerreJacobi](../LaguerreJacobi/README.md) supplies the Laguerre polynomials and their
orthogonality and Hilbert bases, which the matrix elements of the Heisenberg group are expressed in
and reduce to. [SpecialFunctionsHypergeometric](../SpecialFunctionsHypergeometric/README.md)
supplies the Mellin–Barnes integral of `(1 + u)^{−a}` and the half-line Beta integral, which the
composed kernels of the `ax + b` and triangular groups reduce to. ThetaKernelsForUnitaryDualPairs
supplies the Fock model and the Bargmann transform of a real symplectic space, which this roadmap
uses in one variable, in the coordinates of Tau Ceti's Heisenberg group. The roadmap owns the
Charlier polynomials.

## How to read the build

Layer 0 puts the triangular and oscillator groups in coordinates, with their matrix realizations
and the embeddings of the Heisenberg group. Layer 1 treats the `ax + b` group in the Mellin
realization and needs Mathlib's Mellin transform and Gamma function, the `ax + b` group of
SpecialFunctionsGroupModels and the Mellin–Barnes integral of SpecialFunctionsHypergeometric.
Layer 2 treats the triangular group: its representations, their infinitesimal operators, the
signed Mellin kernel and its power and Whittaker values, and the functional relations of the
Whittaker functions obtained by composing kernels; it needs Layer 0, the multiplier framework, the
Whittaker functions and again the Mellin–Barnes integral. Layer 3 treats the Heisenberg group in
the Schrödinger and Fock models; it needs the Hermite basis and the Laguerre polynomials, and takes
the Fock model and the Bargmann transform from ThetaKernelsForUnitaryDualPairs. Layer 4 puts the
oscillator group on the Fock space and needs Layers 0 and 3. Layer 5 treats Miller's group on
entire functions; it needs Layer 0 and the Laguerre polynomials, and Layer 2 only for the
comparison of its real points with the triangular group.

## Conventions

- **Actions and multipliers** are those of SpecialFunctionsGroupModels §1.2: groups act on the left
  and `(T(g) f)(x) = α(g, x) f(g⁻¹ • x)`, with the cocycle identity
  `α(gh, x) = α(g, x) α(h, g⁻¹ • x)`, `α(1, x) = 1`. A representation on `L²` is the continuous
  representation agreeing almost everywhere with this formula, chosen by uniqueness as in
  SpecialFunctionsGroupModels §1.3.
- **Inner products** are conjugate-linear in the first argument, and the matrix element of a
  representation `U` in a Hilbert basis `e` is `⟪e m, U g (e n)⟫`, as in SpecialFunctionsGroupModels
  §3.1.
- **`ax + b` group.** Pairs `(a, b)` with `a > 0` and `(a, b)(a', b') = (aa', ab' + b)`, acting on
  `ℝ` by `g • x = x / a` (SpecialFunctionsGroupModels §§0.2, 2.4). Vilenkin–Klimyk's
  `R_λ(a, b) f(x) = e^{λbx} f(ax)` with complex `λ` is `affineAction λ`; at `λ = iρ` it is the
  multiplier action of SpecialFunctionsGroupModels §2.4.
- **Triangular group.** `TriangularGroup` has coordinates `(a, b, d, τ)` and matrix
  `[[1, a, b], [0, e^τ, d], [0, 0, 1]]`, so
  `(a, b, d, τ)(a', b', d', τ') = (a' + a e^{τ'}, b + b' + a d', d + e^τ d', τ + τ')`. It acts on
  `ℝ` by `g • x = e^{−τ}(x − a)`, so `g⁻¹ • x = e^τ x + a`. Klimyk–Vilenkin write the same matrix as
  `g(a, b, e^τ, d)`.
- **Heisenberg group.** Tau Ceti's `(x, y, z)(x', y', z') = (x + x', y + y', z + z' + x y')`, the
  matrix `[[1, x, z], [0, 1, y], [0, 0, 1]]`; it is the subgroup `τ = 0` of the triangular group
  through `(x, y, z) ↦ (a, b, d, τ) = (x, z, y, 0)`. The Schrödinger representation is
  SpecialFunctionsGroupModels §2.5's `(U(g) f)(u) = e^{i(z + yu)} f(u + x)`, with central character
  `e^{iz}`. Vilenkin–Klimyk Vol. 2 and Wawrzyńczyk use the symmetric law with
  `c + c' + (a b' − b a')/2` in the centre, which is Tau Ceti's after `z = c + ab/2`; their
  matrix-element formulas are converted to `U` in 3.1.
- **Hermite basis** `h_n = TauCeti.hermiteFunction n`,
  `h_n(u) = He_n(u√2) e^{−u²/2} / (n! √π)^{1/2}`, the eigenbasis of `a† a` with `a = (u + d/du)/√2`,
  `a† h_n = (n + 1)^{1/2} h_{n+1}`.
- **Laguerre polynomials** `L_n^{(α)}` are LaguerreJacobi's explicit sum (DLMF 18.5.12), defined for
  every `α` in a `ℚ`-algebra, so `L_n^{(m − n)}` with `m < n` is the polynomial continuation, equal
  to `(m!/n!) (−x)^{n−m} L_m^{(n−m)}(x)` (Vilenkin–Klimyk Vol. 2 §12.1.6 (8), p. 417; Miller (4.29),
  p. 88; Wawrzyńczyk adopts the same continuation in §12.1, p. 429).
- **Oscillator group.** `Oscillator` has coordinates `(w, α, δ) ∈ ℂ × ℝ × ℝ` with the law of the
  oscillator matrices of SpecialFunctionsGroupModels §0.2,
  `(w₁, α₁, δ₁)(w₂, α₂, δ₂) = (w₁ + e^{−iα₁} w₂, α₁ + α₂, δ₁ + δ₂ − Im(e^{−iα₁} conj w₁ w₂)/4)`, and
  `rotationFactor α = e^{−iα}`. The angle `α` is real, not taken modulo `2π`, so `Oscillator`
  covers the matrix group with kernel `{(0, 2πk, 0)}`, and the rotation weight `λ` of 4.1 is any
  real number. Miller's `S₄` (§4-11, p. 113) and Klimyk–Vilenkin's `S₄` (Chapter 1, §1.6, p. 160)
  are the matrix group, on which the weight must be an integer.
- **Fock space.** `fockMeasure = π⁻¹ e^{−|ζ|²} dζ` on `ℂ`, the measure of Miller §4-13, p. 117, and
  of Wawrzyńczyk (12.1.6), p. 425, at `λ = 1`; `fockMonomial n = ζⁿ / √n!`.
- **Mellin transform** is Mathlib's `mellin f s = ∫_{(0,∞)} t^{s−1} f(t) dt`; the signed transforms
  of the triangular group are `F_±(λ) = mellin (x ↦ f(±x)) λ` (`signedMellin`).
- **Kernels.** A kernel `K(w, z; g)` acts on Mellin transforms by
  `F ↦ ∫_{c−i∞}^{c+i∞} K(w, z; g) F(z) dz`; written on the line `z = c + is` this is
  `i ∫ K(w, c + is; g) F(c + is) ds`. The factor `1/(2πi)` is part of the kernel, as in the sources.
- **Miller's `G(0, 1)`.** `MillerGroup` has complex coordinates `(a, b, c, τ)` and the law that
  sends `(a₁, b₁, c₁, τ₁)(a₂, b₂, c₂, τ₂)` to
  `(a₁ + a₂ + e^{τ₁} c₁ b₂, b₁ + e^{τ₁} b₂, c₁ + e^{−τ₁} c₂, τ₁ + τ₂)` (Miller §4-2, p. 86, the
  computation after (4.20)); its real points form the triangular group through
  `(a, b, c, τ) ↦ (e^τ c, a, b, τ)` (`millerToTriangular`).

## Layer 0: the groups in coordinates

### 0.1 The triangular group

Sources: Vilenkin–Klimyk Vol. 1 §5.1.1 (1)–(13), pp. 207–208; Klimyk–Vilenkin Chapter 1, §1.6
(14), p. 160, and Chapter 4, §1.4, p. 206; Dieudonné §17, p. 58.

`TriangularGroup` is the group of the Conventions, with `toMatrix` its matrix, and with the
one-parameter subgroups `g_+(t) = (t, 0, 0, 0)` (`translationElement`), `g_−(t) = (0, 0, t, 0)`
(`modulationElement`), `z(t) = (0, t, 0, 0)` (`centralElement`), `ε(t) = (0, 0, 0, t)`
(`dilation`), `g_1(t) = [[1, t, t²/2], [0, 1, t], [0, 0, 1]] = (t, t²/2, t, 0)`
(`equalTranslationModulation`) and
`g_2(t) = [[1, −t, −t²/2], [0, 1, t], [0, 0, 1]] = (−t, −t²/2, t, 0)`
(`oppositeTranslationModulation`). The matrix realization and the Heisenberg
subgroup are sanity checks of these definitions. Prove:
- **Matrix realization** (`TriangularGroup.toMatrix_mul`): `toMatrix` is a multiplicative and
  injective map into `3 × 3` real matrices;
- **Centre** (`TriangularGroup.mem_center_iff`): the centre is `{z(t)}` (Vilenkin–Klimyk §5.1.1, p.
  207);
- **Factorizations** (`TriangularGroup.factorizations`): `g(0, b, d, τ) = ε(τ) g_−(d e^{−τ}) z(b)`
  (§5.1.1 (8), p. 208); `g_1(t) = g_−(t) g_+(t) z(t²/2)` (§5.2.4 (2), p. 219, which the source uses
  in (3)); and for `x > 0`, `x + t > 0`, `g_+(t) g_1(x) = ε(τ) g_1(r) ε(−τ) z(tx/2)` with
  `r = (x(x + t))^{1/2}`, `e^{2τ} = x/(x + t)` (§5.2.1 (1)–(2), p. 213);
- **Heisenberg subgroup** (`heisenbergToTriangular_injective`): `heisenbergToTriangular`,
  `(x, y, z) ↦ (x, z, y, 0)`, is an injective homomorphism from Tau Ceti's Heisenberg group onto
  `{τ = 0}`.

The Lie algebra relations `[a_+, a_−] = c`, `[a_±, e] = ±a_±`, `c` central (§5.1.1 (5), p. 207)
appear through the infinitesimal operators of 2.2. The bi-invariant Haar measure
`e^{−τ} da db dd dτ` is SpecialFunctionsGroupModels §0.2's.

**Checks.**
- The group law agrees with the matrix product at `g = (0.7, −1.2, 0.4, 0.3)`,
  `h = (−0.5, 0.9, 1.1, −0.8)` to `10⁻³⁰`.
- Negative control: with the factors in the order `hg` the entries differ by up to `0.97`.
- `g⁻¹ = (−a e^{−τ}, a d e^{−τ} − b, −d e^{−τ}, −τ)`: `g g⁻¹ = 1` at the same `g`.
- The three factorizations hold at `t = 0.8`, `x = 1.3`, and at `(b, d, τ) = (−0.4, 0.6, 0.9)`.

*Needs:* Mathlib; Tau Ceti's Heisenberg group.

### 0.2 The oscillator group

Sources: Miller §4-11 (4.95)–(4.97), p. 113, and §4-14, p. 120; Klimyk–Vilenkin Chapter 1, §1.6
(14)–(15), p. 160; SpecialFunctionsGroupModels §0.2.

`Oscillator` is the group of the Conventions, and `Oscillator.toMatrix g` is the oscillator matrix
`s(w, α, δ)` of SpecialFunctionsGroupModels §0.2. The three statements are sanity checks of these
definitions. Prove:
- **Matrix realization** (`Oscillator.toMatrix_mul`): `toMatrix` is multiplicative;
- **Kernel of the matrix realization** (`Oscillator.toMatrix_eq_one_iff`): `toMatrix g = 1` exactly
  when `w = 0`, `δ = 0` and `α ∈ 2πℤ`;
- **Heisenberg subgroup** (`heisenbergToOscillator_injective`): `heisenbergToOscillator`,
  `(x, y, z) ↦ (x + iy, 0, −(z − xy/2)/2)`, is an injective homomorphism.

The Heisenberg embedding is fixed by the oscillator law: the commutator of `(x, 0, 0)` and
`(0, y, 0)` in `Oscillator` is `(0, 0, −xy/2)`, so the centre `z` of Tau Ceti's group must go to
`δ = −z/2`, and the shift by `xy/2` turns Tau Ceti's asymmetric law into the symmetric one. Miller's
`S₄` is the same group in other coordinates, `w = 2re^{iθ}`; the change of coordinates is a target
of the same standing, stated in prose: match Miller's matrix (4.95) with the oscillator matrix, and
transport the law (4.96) and the coordinates of (4.120). Miller prints the `(3, 3)` entry of (4.95),
p. 113, as `0`; the correct entry is `1`, since with `0` every matrix of (4.95) is singular and the
law (4.96) fails.

**Checks.**
- `toMatrix` is multiplicative at `(0.4 − 0.9i, 0.7, 0.2)`, `(−1.1 + 0.3i, −1.9, 0.5)` to `10⁻³⁰`.
- The Heisenberg embedding is a homomorphism at `(0.3, −0.7, 1.1)`, `(−1.4, 0.6, 0.25)`.
- Negative control: the embedding with `+(z − xy/2)/2` in the last coordinate fails the
  homomorphism property at the same points, with defect `0.4` in `δ`.
- Negative control: `(0, 2π, 0)` is not the identity of `Oscillator` but has matrix `1`.

*Needs:* SpecialFunctionsGroupModels §0.2.

### Examples

- `g_1(t)` is the exponential of `t(a_+ + a_−)` and `g_2(t)` that of `t(a_− − a_+)`, which is why
  the Whittaker kernels of 2.5 sit on these subgroups.

### Dependencies

0.1 and 0.2 are independent.

## Layer 1: the `ax + b` group, the Mellin transform and the Gamma function

### 1.1 The representations `R_λ` and their Mellin realization

Sources: Vilenkin–Klimyk Vol. 1 §3.4.1 (1)–(5), pp. 128–129, and §3.4.2 (1), (11)–(12), pp. 129–131;
Klimyk–Vilenkin Chapter 4, §1.2, p. 204.

`affineAction λ g f x = e^{λbx} f(ax)` for `g = (a, b)` and complex `λ`. The first two statements
are sanity checks of the definition, which fix its conventions. Prove:
- **Representation law** (`affineAction_mul`, `affineAction_one`): `R_λ(gh) = R_λ(g) R_λ(h)` and
  `R_λ(1) = 1` on all functions;
- **Dictionary** (`affineAction_mul_I`): for real `ρ`, `affineAction (ρ i)` is the multiplier action
  of SpecialFunctionsGroupModels §2.4 with cocycle `e^{iρbx}`; its unitarity on `L²(dx/x)`,
  irreducibility for `ρ ≠ 0` and equivalence classes are consumed from there;
- **Euler operator** (`mellin_mul_deriv`): for `f` continuously differentiable with compact support
  not containing `0`, `mellin (x f') w = −w mellin f w` (the operator `A_λ = x d/dx` of (11));
- **Mellin–Plancherel theorem** (`mellin_plancherel`): `f ↦ (s ↦ (2π)^{−1/2} mellin f (is))`,
  on continuous `f` with compact support in `(0, ∞)`, extends to a unitary map from
  `L²((0, ∞), dx/x)` onto `L²(ℝ)`, and this map carries `R_0(a, 0)` to multiplication by `a^{−is}`.

Route for the Mellin–Plancherel theorem: substitute `x = e^u` and use Mathlib's Fourier–Plancherel
theorem; it shows that `R_0` is a direct integral of the characters `a ↦ a^{−is}`. Two further
rules follow from Mathlib at once and are not stated separately: the dilations are diagonal,
`mellin (R_λ(a, 0) f) w = a^{−w} mellin f w` for `a > 0` (`mellin_comp_mul_left`), and
multiplication by `x` shifts the variable, `mellin (x f) w = mellin f (w + 1)` for every `f` (the
operator `B_λ = λx` of (12); `mellin_cpow_smul` at exponent `1`).

**Checks.**
- `R_λ(a, b) R_λ(a', b') = R_λ(aa', ab' + b)` at `λ = 0.3 − 1.1i`, `x = 0.9`, `f(x) = x e^{−x}`,
  `(a, b) = (1.7, 0.6)`, `(a', b') = (0.8, −1.3)`: both sides are
  `−0.00538 34360 + 0.23297 06662 i`.
- Negative control: the order `(a', b')(a, b)` gives `0.19850 10475 + 0.20926 94395 i`.
- Negative control: `R_0` is reducible (Vilenkin–Klimyk §3.4.1, p. 129): it is the dilation
  representation, diagonal in the Mellin realization.
- `mellin (e^{−x}) w = Γ(w)`, and the shift rule gives `Γ(w + 1) = w Γ(w)`.

*Needs:* Mathlib `mellin_comp_mul_left`, `mellin_cpow_smul`, `MeasureTheory.Lp.fourierTransformₗᵢ`;
SpecialFunctionsGroupModels §§0.2, 2.4.

### 1.2 The Gamma kernel

Sources: Vilenkin–Klimyk Vol. 1 §3.4.2 (10), p. 131, and §3.4.3 (1)–(3), pp. 131–132;
Klimyk–Vilenkin Chapter 4, §1.2 (1), p. 204.

`affineGammaKernel λ a b w z = Γ(w − z) a^{−w} (−λb/a)^{z−w} / (2πi)` with the principal power.
Prove:
- **Gamma kernel** (`mellin_affineAction_eq_integral`): for `a > 0`, `Re(−λb) > 0`, `f`
  continuously differentiable with compact support in `(0, ∞)` and real `c < Re w`,
  `mellin (R_λ(a, b) f) w = i ∫ affineGammaKernel λ a b w (c + is) · mellin f (c + is) ds`.

The source proves the formula for `λ < 0`, `b > 0` and extends it by analytic continuation in `−λb`
to the slit plane (§3.4.3, p. 132); the hypothesis `Re(−λb) > 0` is the half-plane where
`∫_0^∞ e^{λbx/a} x^{w−z−1} dx` converges absolutely, and `c < Re w` keeps `Γ(w − z)` regular on the
contour. Route: insert Mellin inversion for `f` (the contour may be moved to any `c` since
`mellin f` is entire and decreases rapidly on vertical lines), exchange the integrals, and evaluate
the inner integral, a Gamma integral with the complex rate `−λb/a`, by
[AsymptoticExpansions](../AsymptoticExpansions/README.md) §4.1 (for `Re s > 0` and `Re z > 0`,
`∫₀^∞ t^{s−1} e^{−zt} dt = Γ(s) z^{−s}`). Mathlib's `Complex.integral_cpow_mul_exp_neg_mul_Ioi` is
only the case of a real rate, which is the source's case `λ < 0`, `b > 0`; the continuation in the
rate is AsymptoticExpansions §4.1.

**Checks.**
- The Gamma functional equation follows from the kernel: comparing `B_λ R_λ(1, t)` computed from
  (12) and from `d/ds R_λ(1, s + t)` gives `Γ(w − z + 1) = (w − z) Γ(w − z)` (§3.4.4 (1)–(3), p.
  132).
- At `a = 1`, `λ = −1`, `b = 1`, `f(x) = e^{−x}`: the left side is
  `mellin (e^{−2x}) w = 2^{−w} Γ(w)`, and the right side is the case `t = 1` of 1.3.
- `a = 1.3`, `b = 0.7`, `λ = −0.8 + 0.5i`, `w = 1.9 + 0.3i`, `c = 0.6`, `f(x) = x e^{−x}`
  (`mellin f z = Γ(z + 1)`): both sides are
  `a Γ(w + 1)(a − λb)^{−w−1} = 0.28351 98619 + 0.19963 64628 i`.
- Negative control: with `(−λb/a)^{w−z}` in place of `(−λb/a)^{z−w}` the right side is
  `0.02032 28410 − 0.05380 24362 i` at the same data.

*Needs:* 1.1; Mathlib Mellin inversion (`mellinInv_mellin_eq`); AsymptoticExpansions §4.1.

### 1.3 Composition of Gamma kernels and the addition formula of the Gamma function

Sources: Vilenkin–Klimyk Vol. 1 §3.4.5 (1)–(5), p. 135; Klimyk–Vilenkin Chapter 4, §3.1, p. 218.

Prove:
- **Composition of Gamma kernels** (`affineGammaKernel_composition`): for `b > 0`, `Re(−λ) > 0` and
  real `c` with `Re z < c < Re w`, the kernels of 1.2 compose along `g(1, b) g(1, 1) = g(1, b + 1)`:
  `affineGammaKernel λ 1 (b + 1) w z` equals
  `i ∫ affineGammaKernel λ 1 b w (c + is) · affineGammaKernel λ 1 1 (c + is) z ds`.

This is the kernel form of `R_λ(1, b) R_λ(1, 1) = R_λ(1, b + 1)` (§3.4.5 (1)–(2), where the source
takes `λ = −1`). After `w − z = W`, `ν − z = c′ + is` and `t = b` it reads
`Γ(W) (t/(t + 1))^W = (1/2π) ∫ Γ(W − c′ − is) Γ(c′ + is) t^{c′ + is} ds` for `t > 0` and
`0 < c′ < Re W`, the addition formula of the Gamma function (§3.4.5 (3)), and that is the
Mellin–Barnes integral of `(1 + u)^{−a}` of SpecialFunctionsHypergeometric §6.3 at `u = 1/t`,
`a = W`, `σ′ = c′`, hypotheses included. Route: reduce to that integral by this substitution and the
factorization `(−λβ)^s = β^s (−λ)^s` of principal powers for real `β > 0`, which removes `λ`. Its
Mellin dual, `∫_0^∞ t^{u−1} (t/(t + 1))^w dt = Γ(w + u) Γ(−u) / Γ(w)` for `Re u < 0 < Re(w + u)`, is
the half-line Beta integral of SpecialFunctionsHypergeometric §6.3 (DLMF 5.12.3) at `s = w + u`,
`a = w`; neither identity is restated here.

**Checks.**
- Composition at `λ = −0.8 + 0.5i`, `b = 0.6`, `w = 1.9 + 0.3i`, `z = 0.4 − 0.2i`, on the lines
  `c = 0.7` and `c = 1.5`: `2πi` times either side is `0.25358 43141 + 0.19954 45259 i`.
- Negative control: on the line `c = 2.3 > Re w` the integral gives
  `−0.15149 35975 − 0.31270 52026 i`; the hypothesis `c < Re w` is needed.
- `w = 1.7 + 0.4i`, `t = 0.6`, `c = 0.8`: both sides of the addition formula are
  `0.15377 50787 − 0.04801 10634 i`.
- `t = 1` (the special case (4)): both sides are `2^{−w} Γ(w) = 0.25810 49091 − 0.04898 41714 i`.
- Dual form at `w = 1.7 + 0.4i`, `u = −0.4 + 0.3i`: `1.20298 04832 + 0.67258 52838 i` both ways.
- Negative control for the addition formula: at `c = 2.5 > Re w` its integral is
  `−0.20204 35566 − 0.00704 58538 i`, not the left side.

*Needs:* 1.2; SpecialFunctionsHypergeometric §6.3.

### Examples

- `t ↦ e^{−t}` and `t ↦ (1 + t)^{−w}` are the basic functions whose Mellin transforms are `Γ` and a
  Beta quotient; 1.2 and 1.3 are the group form of these two facts.

### Dependencies

1.1 → 1.2 → 1.3.

## Layer 2: the triangular group and the Whittaker functions

### 2.1 The representations `T_χ`

Sources: Vilenkin–Klimyk Vol. 1 §5.1.2 (1), pp. 208–209, and §5.1.3 (3), p. 210; Klimyk–Vilenkin
Chapter 4, §1.4, p. 205; Dieudonné §17, p. 58.

For `χ = (σ, ω) ∈ ℂ²`, `triangularCocycle σ ω g x = e^{ωτ + σ(dx + b)}` and
`(T_χ(g) f)(x) = e^{ωτ + σ(dx + b)} f(e^τ x + a)` (`triangularAction`). For real `γ`, `ρ`,
`triangularRep γ ρ` is the representation on `L²(ℝ)` at `σ = iγ`, `ω = 1/2 + iρ`. Prove:
- **Cocycle** (`isMultiplierCocycle_triangularCocycle`): `triangularCocycle σ ω` is a multiplier
  cocycle for every `σ`, `ω`, and its multiplier action is `triangularAction σ ω`, so `T_χ` is a
  representation on functions;
- **Unitarity range** (`lintegral_triangularAction_iff`): `T_χ(g)` preserves `∫⁻ |f|²` for every `g`
  and measurable `f` exactly when `Re σ = 0` and `Re ω = 1/2` (§5.1.2, p. 209);
- **Unitary representations** (`triangularRep_spec`): `triangularRep γ ρ` realizes the formula and
  is unitary; for `γ ≠ 0` it is irreducible, and for `γ, γ' ≠ 0`,
  `triangularRep γ ρ ≅ triangularRep γ' ρ'` exactly when `γ = γ'` and `ρ = ρ'`;
- **Restriction to the Heisenberg group** (`triangularAction_heisenberg`): at `σ = i`, the action of
  `(x, z, y, 0)` is the Schrödinger action of `(x, y, z)` for every `ω`.

Irreducibility and equivalence: the dilation `f ↦ f(·/γ)` intertwines the restriction of
`triangularRep γ ρ` to the Heisenberg subgroup with the Schrödinger representation composed with the
automorphism `(x, y, z) ↦ (γx, y, γz)`, which is irreducible (SpecialFunctionsGroupModels §2.5).
The central characters `e^{iγz}` force `γ = γ'` for an intertwiner; an intertwiner of two `T_χ`
with the same `γ` commutes with that irreducible restriction and is a scalar, and then
`ε(τ) ↦ e^{ωτ} f(e^τ ·)` forces `ρ = ρ'`. The source proves operator irreducibility for `σ ≠ 0`
(§5.1.2, p. 208) by the argument of §3.4.1, p. 128; the equivalence statement is derived here.

**Checks.**
- The representation law at `σ = 1.3i`, `ω = 0.5 + 0.7i`, `x = 0.37`, `f(x) = e^{−x²}(1 + x + x³)`,
  with `g`, `h` of 0.1's Checks: the defect is `2 · 10⁻²⁶`; with `hg` in place of `gh` it is
  `1.217`.
- Unitarity at the same data: `∫ |T_χ(g) f|² − ∫ |f|² = 0`.
- Negative control: at `Re ω = 0.3` the norm ratio is `e^{(2 · 0.3 − 1)τ} = e^{−0.12} = 0.88692`,
  not `1`.
- Negative control: the coordinate order `(x, y, z, 0)` in place of `(x, z, y, 0)` gives the phase
  `e^{i(y + zu)}` in place of `e^{i(z + yu)}`.

*Needs:* 0.1; SpecialFunctionsGroupModels §§1.2–1.3, 2.5.

### 2.2 Infinitesimal operators

Sources: Vilenkin–Klimyk Vol. 1 §5.1.2 (2)–(3), p. 209.

Prove:
- **Infinitesimal operators** (`hasDerivAt_triangularAction`): for `f` continuously differentiable,
  the derivatives at `t = 0` of `T_χ(g_+(t)) f (x)`, `T_χ(g_−(t)) f (x)`, `T_χ(z(t)) f (x)` and
  `T_χ(ε(t)) f (x)` are `f'(x)`, `σ x f(x)`, `σ f(x)` and `ω f(x) + x f'(x)`.

**Checks.**
- `[A_+, A_−] = σ = Z`, matching `[a_+, a_−] = c` (§5.1.1 (5), p. 207).
- `[A_+, E] = A_+` and `[A_−, E] = −A_−`, matching `[a_±, e] = ±a_±` for the matrices `a_+ = E₀₁`,
  `a_− = E₁₂`, `e = E₁₁`.
- Negative control: the action `f(e^{−τ} x + a)` in place of `f(e^τ x + a)` gives `E = ω − x d/dx`
  and `[A_+, E] = −A_+`, contradicting the matrices.

*Needs:* 2.1.

### 2.3 The signed Mellin realization and its kernel

Sources: Vilenkin–Klimyk Vol. 1 §5.1.3 (1)–(10), pp. 209–211; Klimyk–Vilenkin Chapter 4, §1.4
(11)–(13), pp. 205–206.

`signedMellin f ε λ = mellin (x ↦ f(εx)) λ` for `ε = ±1`. `triangularKernel σ ω ε η λ μ g` is
`e^{ωτ + σb}/(2πi)` times `∫ x^{λ−1} e^{σdεx} |e^τ εx + a|^{−μ} dx` over the `x > 0` with
`η(e^τ εx + a) > 0`. Prove:
- **Diagonal and central elements** (`signedMellin_dilation_centre`): `T_χ(ε(τ))` acts on `F_±(λ)`
  by multiplication with `e^{(ω−λ)τ}` and `T_χ(z(b))` by `e^{σb}` (§5.1.3 (6), p. 210, and p. 211);
- **Infinitesimal operators** (`signedMellin_infinitesimal`): for `f` continuously differentiable
  with compact support not containing `0`,
  `signedMellin f' ε λ = −ε(λ − 1) signedMellin f ε (λ − 1)`, and for every `f`,
  `signedMellin (x f) ε λ = ε signedMellin f ε (λ + 1)` (§5.1.3 (7)–(8), p. 211);
- **Kernel realization** (`signedMellin_triangularAction`): for `Re σ = 0`, `f` twice continuously
  differentiable with compact support not containing `0`, `a ≠ 0` and `0 < Re λ < c < 1`,
  `signedMellin (T_χ(g) f) ε λ` equals
  `Σ_η i ∫ triangularKernel σ ω ε η λ (c + is) g · signedMellin f η (c + is) ds`
  (§5.1.3 (4)–(5), p. 210).

The source derives (4)–(5) for every `χ` by exchanging the integrals formally, and then notes that
only for `Re σ = 0` do the four kernel integrals have a common domain of convergence, `Re λ > 0`,
`Re λ < Re μ < 1`; for `Re σ ≠ 0` it shows that there is none (at `a > 0`, `d > 0`, `Re σ < 0` the
integral for `K_{−−}` diverges) (p. 210). The hypotheses above are that domain on the line
`Re μ = c`, and `a ≠ 0` keeps `|e^τ εx + a|^{−μ}` away from `x = 0`; at `a = 0` the source computes
the diagonal and central elements directly (p. 210), as in the first bullet. Twice differentiable
`f` makes `signedMellin f η (c + is)` decay like `s^{−2}`, so the line integral converges
absolutely. For `Re σ ≠ 0` the single kernels of 2.4 and 2.5 and the compositions of 2.6 hold on
their own domains, which is how 2.6 uses them.

**Checks.**
- Negative control: at `g = 1` (`a = 0`) the kernel integral is `∫_0^∞ x^{λ−1−μ} dx`, which
  diverges for every `λ`, `μ`; the hypothesis `a ≠ 0` is needed.
- Negative control: the sign `−ε` in the derivative rule:
  `signedMellin f' (−1) λ = (λ − 1) signedMellin f (−1) (λ − 1)` (source (7)), not `−(λ − 1)`.
- `K_{+−}(g_+(t)) = 0` for `t > 0`: the set `x > 0`, `x + t < 0` is empty.

*Needs:* 2.1; Mathlib `mellinInv_mellin_eq`.

### 2.4 Power kernels

Sources: Vilenkin–Klimyk Vol. 1 §5.1.4 (1)–(6), pp. 211–212; Klimyk–Vilenkin Chapter 4, §1.4
(14)–(17), p. 206.

Prove, for `t > 0`:
- **Kernels of `g_+(t)`** (`triangularKernel_translationElement`):
  `K_{++} = Γ(μ − λ) Γ(λ) t^{λ−μ} / (2πi Γ(μ))` for `Re μ > Re λ > 0`;
  `K_{−+} = Γ(λ) Γ(1 − μ) t^{λ−μ} / (2πi Γ(λ − μ + 1))` for `Re λ > 0`, `Re μ < 1`;
  `K_{−−} = Γ(1 − μ) Γ(μ − λ) t^{λ−μ} / (2πi Γ(1 − λ))` for `Re λ < Re μ < 1`; `K_{+−} = 0`;
- **Kernel of `g_−(t)`** (`triangularKernel_modulationElement`): for `Re(σt) < 0` and
  `Re λ > Re μ`, `K_{++} = Γ(λ − μ) (−σt)^{μ−λ} / (2πi)` and `K_{+−} = K_{−+} = 0`.

These are Beta and Gamma integrals: `∫_t^∞ y^{−μ}(y − t)^{λ−1} dy = B(λ, μ − λ) t^{λ−μ}`.
Klimyk–Vilenkin's (15)–(16) omit the factor `1/(2πi)` that (14) and (17) carry, a misprint; the
kernels here carry it throughout.

**Checks.**
- `λ = 0.7 + 0.2i`, `μ = 1.6 + 0.1i`, `t = 0.9`:
  `2πi K_{++}(g_+(t)) = 1.57979 16581 − 0.29414 61055 i` by quadrature and by the formula.
- `λ = 0.7 + 0.2i`, `μ = 0.3 − 0.4i`: `2πi K_{−+}(g_+(t)) = 1.25464 00163 − 1.11027 39560 i` both
  ways.
- `λ = 0.2 + 0.3i`, `μ = 0.6 − 0.2i`: `2πi K_{−−}(g_+(t)) = 2.33960 51286 + 0.25617 16573 i` both
  ways.
- `σ = −0.8 + 0.3i`, `λ = 1.3 + 0.2i`, `μ = 0.4 − 0.1i`, `t = 0.9`:
  `2πi K_{++}(g_−(t)) = 1.09834 91745 + 0.20992 82062 i` both ways.
- Negative control: `Re μ > Re λ` is needed for `K_{++}(g_+(t))`: at `μ = 0.3 − 0.4i` the integral
  diverges at infinity.

*Needs:* 2.3; Mathlib `Complex.betaIntegral`.

### 2.5 Whittaker kernels

Sources: Vilenkin–Klimyk Vol. 1 §5.1.4 (7)–(14), pp. 212–213; Klimyk–Vilenkin Chapter 4, §1.4
(18)–(21), p. 207; Dieudonné §17, p. 58.

Let `σ = −1` and `t > 0`. Prove:
- **Whittaker kernels of `g_1(t)`** (`triangularKernel_equalTranslationModulation`):
  `K_{++}(λ, μ; g_1(t)) = Γ(λ) W_{(1−λ−μ)/2, (λ−μ)/2}(t²) / (2πi t)` for `Re λ > 0`;
  `K_{−+}(λ, μ; g_1(t)) = Γ(λ) Γ(1 − μ) M_{(1−λ−μ)/2, (λ−μ)/2}(t²) / (2πi t Γ(λ − μ + 1))` for
  `Re λ > 0`, `Re μ < 1`; `K_{+−}(g_1(t)) = 0`;
- **Whittaker kernels of `g_2(t)`** (`triangularKernel_oppositeTranslationModulation`):
  `K_{++}(λ, μ; g_2(t)) = Γ(1 − μ) W_{(λ+μ−1)/2, (λ−μ)/2}(t²) / (2πi t)` for `Re μ < 1`;
  `K_{+−}(λ, μ; g_2(t)) = Γ(λ) Γ(1 − μ) M_{(λ+μ−1)/2, (λ−μ)/2}(t²) / (2πi t Γ(λ − μ + 1))` for
  `Re λ > 0`, `Re μ < 1`; `K_{−+}(g_2(t)) = 0`;
- **Reflection** (`triangularKernel_reflect`): replacing `(a, d)` by `(−a, −d)` exchanges the sign
  indices, `K_{εη}(g') = K_{−ε,−η}(g)`; in particular `t ↦ −t` in `g_1`, `g_2` exchanges them
  (§5.1.4 (14), p. 213).

Route: substitute `y − t = tx` and use the integral representations of `W_{κ,μ}` and `M_{κ,μ}`
(DLMF 13.16.5 and 13.16.1, SpecialFunctionsConfluent §2.4), as the source does with its own
integral representations (§5.1.4, pp. 212–213). Klimyk–Vilenkin's (19) misprints `Γ(λ − μ + 1)` as
`Γ(λ − μ − 1)`.

**Checks.**
- `λ = 0.7 + 0.2i`, `μ = 0.3 − 0.4i`, `t = 0.9`:
  `2πi K_{++}(g_1(t)) = 0.73565 43260 − 0.08105 87023 i` by quadrature and from `W`.
- Same data: `2πi K_{−+}(g_1(t)) = 1.20369 93199 − 1.19369 99522 i` from `M` with `Γ(λ − μ + 1)`;
  negative control: the printed `Γ(λ − μ − 1)` gives `−0.86546 35862 + 0.57177 60529 i`.
- Same data: `2πi K_{++}(g_2(t)) = 0.59458 16449 − 0.24094 69890 i` and
  `2πi K_{+−}(g_2(t)) = 1.36831 77364 − 1.11645 63421 i`.
- Negative control: exchanging the index `(1 − λ − μ)/2` of `K_{++}(g_1)` for `(λ + μ − 1)/2` gives
  `0.73087 38824 − 0.14159 45493 i`.
- `K_{−−}(g_1(−t)) = K_{++}(g_1(t))` and `K_{+−}(g_1(−t)) = K_{−+}(g_1(t))` by quadrature.

*Needs:* 2.3; SpecialFunctionsConfluent §§1.6, 2.4.

### 2.6 Composition of kernels and functional relations

Sources: Vilenkin–Klimyk Vol. 1 §5.2.1 (1)–(5), pp. 213–214, §5.2.3 (1), p. 217, and §5.2.4 (1)–(7),
pp. 219–220.

The source states the composition law `K(λ, μ; g h) = Σ_η i ∫ K_{·η}(λ, ν; g) K_{η·}(ν, μ; h)`
on a line `Re ν = c` without conditions (§5.2.4 (1), p. 219) and reads off the convergence
conditions afterwards (p. 220). Here it is stated, at `σ = −1` and `t > 0`, for the two
factorizations of `g_1(t)` that the source uses, `g_1(t) = g_−(t) · g_+(t) z(t²/2)` (§5.2.4 (2),
p. 219) and `g_1(t) = g_+(t) · g_−(t) z(−t²/2)` (§5.2.4 (5), p. 220). Prove:
- **Kernel composition for `g_1(t)`** (`triangularKernel_equalTranslationModulation_eq_integral`):
  for `σ = −1`, `t > 0` and a real line `Re ν = c`,
  (a) `K_{++}(λ, μ; g_1(t)) = Σ_η i ∫ K_{+η}(λ, ν; g_−(t)) K_{η+}(ν, μ; g_+(t) z(t²/2)) ds` when
  `0 < c < min(Re λ, Re μ)`;
  (b) `K_{++}(λ, μ; g_1(t)) = Σ_η i ∫ K_{+η}(λ, ν; g_+(t)) K_{η+}(ν, μ; g_−(t) z(−t²/2)) ds` when
  `Re λ > 0` and `max(Re λ, Re μ) < c`;
  (c) `K_{−+}(λ, μ; g_1(t)) = Σ_η i ∫ K_{−η}(λ, ν; g_+(t)) K_{η+}(ν, μ; g_−(t) z(−t²/2)) ds` when
  `Re λ > 0` and `Re μ < c < 1`;
  with `ν = c + is`. In each sum one term vanishes identically, because its first or second
  factor is an integral over the empty set (2.3).

The conditions are those under which both kernel integrals of each surviving term converge
absolutely (2.4, 2.5); 2.3 does not cover them, since `g_−(t)` has `a = 0` and `σ = −1` is not
imaginary. Route: write the second factor as a Mellin transform in `ν` of an explicit function
(for (a), `y ↦ (y + t)^{−μ}` up to constants; for (b) and (c), `y ↦ e^{−ty} y^{−μ}` restricted to
`y > 0`), exchange the `ν`-integral with the `x`-integral of the first factor by Fubini, and apply
Mellin inversion on the line `Re ν = c` (Mathlib `mellinInv_mellin_eq`); what remains is the kernel
integral of 2.5 for `g_1(t)`. In (a) this Mellin inversion is the Mellin–Barnes integral of
`(1 + y/t)^{−μ}`, SpecialFunctionsHypergeometric §6.3.

The following are targets of the same standing, stated in prose:
- **Mellin–Barnes integrals of `W_{κ,μ}` and `M_{κ,μ}`**: with the kernels of 2.4 and 2.5, (a)
  gives `W_{κ,μ}(z)` as a contour integral of three Gamma functions (§5.2.4 (3)–(4), p. 219), (b)
  gives the other form of `W_{κ,μ}` (§5.2.4 (6), p. 220), and (c) gives the integral of `M_{κ,μ}`
  (§5.2.4 (7), p. 220). The target is the group derivation and the identification of the results
  with DLMF 13.16.10–13.16.12, which SpecialFunctionsConfluent §2.4 proves analytically;
- **Differential relations**: differentiating `T_χ(g_+(t) g_1(x))` at `t = 0` through the
  factorization of 0.1 gives first-order relations between `K(g_1(x))`, its `x`-derivative and the
  infinitesimal operators (§5.2.1 (3)–(5), p. 214); with 2.5 they become the contiguous relations
  of `W_{κ,μ}` and `M_{κ,μ}`, and combining them gives Whittaker's equation
  `y'' + (−1/4 + κ/x + (1/4 − μ²)/x²) y = 0` (§5.2.3 (1), p. 217). The target is the
  identification with SpecialFunctionsConfluent's recurrences (§4.2, DLMF 13.15) and equation
  (§1.6, DLMF 13.14.1); their analytic proofs are consumed.

**Checks.**
- Composition at `λ = 0.7 + 0.2i`, `μ = 0.5 − 0.4i`, `t = 0.9`: `2πi K_{++}(g_1(t))` is
  `0.68614 33553 − 0.10049 04888 i` by quadrature of its kernel integral, and the same by (a) on
  the lines `c = 0.2`, `0.4` and by (b) on the lines `c = 0.8`, `1.3`; `2πi K_{−+}(g_1(t))` is
  `1.35725 24806 − 1.75727 61310 i` by quadrature and by (c) on the lines `c = 0.6`, `0.9`.
- Negative control: (a) on the line `c = 0.6`, with `Re μ < c < Re λ`, gives
  `0.48136 71206 + 0.67212 19634 i`; the condition `c < Re μ` is needed.
- The derivatives of `r`, `τ`, `b` at `t = 0` in the factorization of 0.1 are `1/2`, `−1/(2x)` and
  `x/2`, as printed in §5.2.1 (3), p. 214.
- Negative control: the orientation `e^{2τ} = (x + t)/x` would give `dτ/dt = +1/(2x)` at `t = 0`.
- Vilenkin–Klimyk's (4), p. 219, and (6), p. 220, at `κ = −0.3`, `μ = 0.2`, `z = 1.4`, on the lines
  `Re ν = −0.1` and `Re ν = 0.1`: both give `W_{κ,μ}(z) = 0.34544 79578`.

*Needs:* 0.1, 2.3–2.5; Mathlib `mellinInv_mellin_eq`; SpecialFunctionsHypergeometric §6.3;
SpecialFunctionsConfluent §§1.6, 2.4, 4.2.

### Examples

- At `λ = 1`, `μ = 0`: `K_{++}(g_1(t)) = W_{0, 1/2}(t²)/(2πit)` and `W_{0,1/2}(z) = e^{−z/2}`, so
  `2πi t K_{++} = e^{−t²/2}`, which is `t e^{t²/2} ∫_t^∞ e^{−ty} dy`.

### Dependencies

2.1 → 2.2; 2.1 → 2.3 → 2.4, 2.5 → 2.6.

## Layer 3: the Heisenberg group, Hermite and Laguerre functions

### 3.1 Matrix elements of the Schrödinger representation

Sources: Vilenkin–Klimyk Vol. 2 §12.1.6 (2)–(9), pp. 415–417; Wawrzyńczyk §12.1 (12.1.10)–
(12.1.13), pp. 428–429; Miller §4-15 (4.122)–(4.123), pp. 122–123.

With `α = (−x + iy)/√2` and `A = |α|² = (x² + y²)/2`, `hermiteMatrixElement m n x y z` is
`e^{i(z − xy/2)} e^{−A/2} (n!/m!)^{1/2} α^{m−n} L_n^{(m−n)}(A)` for `n ≤ m` and
`e^{i(z − xy/2)} e^{−A/2} (m!/n!)^{1/2} (−conj α)^{n−m} L_m^{(n−m)}(A)` for `m < n`. Prove:
- **Hermite matrix elements** (`matrixElement_schrodinger_hermite`): the matrix element of the
  Schrödinger representation in the Hermite basis `TauCeti.hermiteHilbertBasis` at `(m, n)` and
  `g` is `hermiteMatrixElement m n g.x g.y g.z`;
- **Unitarity bound** (`norm_laguerre_le`): for `n ≤ m` and `A ≥ 0`,
  `(n!/m!)^{1/2} A^{(m−n)/2} e^{−A/2} |L_n^{(m−n)}(A)| ≤ 1` (Miller §4-15, p. 125).

Route: `U(x, y, z) = e^{i(z − xy/2)} exp(α a† − conj α a)` on the Schwartz space (the Weyl form of
`e^{iyu} e^{x d/du}`), and the displaced-number-state formula. The source forms are converted:
Vilenkin–Klimyk's `r^λ_{mp}(n(a, b, 0))` (9) is for their `R^λ`, printed in §12.1.4 (1), p. 413, as
`(R^λ(n(a, b, c)) f)(x) = e^{iλc} e^{ix·a} e^{iλa·b/2} f(x + λb)`; so printed, `R^λ` reverses
products for their law `c + c′ + (a·b′ − b·a′)/2`, and with `e^{−iλc}` in place of `e^{iλc}` it is a
representation (the matrix elements at `c = 0` are unaffected); Wawrzyńczyk's (12.1.13) and Miller's
(4.123) are in the Fock model of 3.4.

**Checks.**
- `(x, y, z) = (0.7, −1.1, 0.4)`: the formula and the quadrature
  `∫ h_m(u) e^{i(z + yu)} h_n(u + x) du` agree at `(m, n) = (0, 0), (2, 0), (3, 1), (1, 3), (2, 2)`;
  at `(0, 0)` both are `e^{i(z − xy/2)} e^{−(x² + y²)/4} = 0.46246 90767 + 0.46210 09468 i`.
- Negative control: without the phase `e^{−ixy/2}` the `(0, 0)` element is off by `e^{ixy/2}`,
  `|1 − e^{ixy/2}| = 0.38`.
- Negative control: the bound without the factor `A^{(m−n)/2}` fails at `m = 2`, `n = 1`, `A = 0`:
  `L_1^{(1)}(0) = 2 > √2`.

*Needs:* SpecialFunctionsGroupModels §§2.5, 3.1; Tau Ceti `TauCeti.hermiteHilbertBasis`;
LaguerreJacobi §1.1.

### 3.2 Addition theorem, orthogonality and completeness

Sources: Vilenkin–Klimyk Vol. 2 §12.1.6 (11)–(13), pp. 417–418, and §12.1.8 (1)–(5), pp. 420–421;
Wawrzyńczyk §12.2 (12.2.2)–(12.2.4), p. 430; Miller §4-15 Theorem 4.3 and (4.127), pp. 124–125.

Write `E = hermiteMatrixElement`. Prove:
- **Addition theorem** (`hasSum_hermiteMatrixElement_mul`): for Heisenberg elements `g`, `h`,
  `Σ_k E_{mk}(g) E_{kn}(h) = E_{mn}(gh)`;
- **Orthogonality** (`integral_hermiteMatrixElement`):
  `∫∫ E_{mn}(x, y, 0) conj E_{m'n'}(x, y, 0) dx dy = 2π δ_{mm'} δ_{nn'}`;
- **Completeness** (`hermiteMatrixElement_hilbertBasis`): the functions
  `(2π)^{−1/2} E_{mn}(x, y, 0)` form a Hilbert basis of `L²(ℝ²)`.

Route: the addition theorem is SpecialFunctionsGroupModels §3.2 with 3.1. Orthogonality reduces in
polar coordinates to LaguerreJacobi's orthogonality of `L_n^{(k)}` against `x^k e^{−x}` (§2.3); it
is the square integrability of `U` modulo the centre. Completeness: expand in a Fourier series in
the angle and use the completeness of `{x^{k/2} e^{−x/2} L_n^{(k)}}` (LaguerreJacobi §2.4). The
Laguerre addition formulas of Vilenkin–Klimyk §12.1.8, pp. 420–421, are this theorem, and four of
them are misprinted; the corrected forms below pass numerical checks at sample arguments, the
printed ones fail.
- (1): the phase on the right is printed `exp[(iλ/2)(ab′ − ba′)]`; it is `exp[−(iλ/2)(ab′ − ba′)]`.
- (2): the right side is printed `(−z − w)^{m−n} exp(−λw̄z) L_n^{m−n}(λ(z + w)(z̄ + w̄))`; it is
  `(−z − w)^{m−n} exp(−λwz̄/2) L_n^{m−n}(λ(z + w)(z̄ + w̄)/2)`, with the left side as printed
  (arguments `λzz̄/2`, `λww̄/2`).
- (4): `Σ_p (w/z)^p L_p^{m−p}(λzz̄)` is printed as `((z + w)/z)^m e^{−λw̄z}`; it is
  `((z + w)/z)^m e^{−λwz̄}`, which is the Laguerre generating function of 5.1 at `x = λzz̄`,
  `z ↦ w/z`.
- (5): `Σ_p ((−λwz̄)^p/p!) L_n^{p−n}(λww̄)` is printed as `(w/(z − w))^n e^{−λw̄z}`; it is
  `((−λw(z̄ + w̄))^n/n!) e^{−λwz̄}`.

**Checks.**
- Addition at `g = (0.7, −1.1, 0.4)`, `h = (−0.4, 0.3, −0.6)`, `(m, n) = (2, 1)`, summing `k < 40`:
  both sides are `−0.13197 63019 − 0.56679 40604 i`; with `hg` in place of `gh` the right side is
  `0.00071 54161 − 0.58195 59600 i`.
- `∫∫ |E_{00}|² = ∫∫ e^{−(x² + y²)/2} dx dy = 2π`, and `∫∫ |E_{21}|² = 2π`.
- Negative control: `∫∫ E_{10} conj E_{01} = 0` although both have `|E|² = A e^{−A}`.

*Needs:* 3.1; SpecialFunctionsGroupModels §3.2; LaguerreJacobi §§2.3–2.4.

### 3.3 Laguerre identities and the Charlier polynomials

Sources: Vilenkin–Klimyk Vol. 2 §12.1.6, p. 416 (the generating function), §12.1.8 (4)–(5),
p. 421, in the corrected forms of 3.2; Klimyk–Vilenkin Chapter 6, §1.4 (5)–(7), p. 239.

The Charlier polynomial `charlier a n` is
`c_n(x; a) = Σ_{j ≤ n} C(n, j) (−1/a)^j x(x − 1)⋯(x − j + 1)`, the `₂F₀(−n, −x; ; −1/a)` of
DLMF 18.20.8; at `a = 0` it is the junk value `1`. Prove:
- **Charlier matrix elements** (`hermiteMatrixElement_charlier`): for `x > 0` and `a = x²/2`,
  `E_{kn}(x, 0, 0) = (−1)^k (k! n!)^{−1/2} a^{(k+n)/2} e^{−a/2} c_k(n; a)`;
- **Charlier and Laguerre** (`charlier_eq_laguerre`): for `a ≠ 0` and natural `x`,
  `c_n(x; a) = (−1)^n n! a^{−n} L_n^{(x−n)}(a)`;
- **Duality** (`charlier_symm`): `c_n(x; a) = c_x(n; a)` for natural `n`, `x`;
- **Orthogonality and completeness** (`charlier_orthogonality`): for `a > 0`,
  `(a^k e^{−a}/k!) Σ_x (a^x/x!) c_k(x; a) c_p(x; a) = δ_{kp}` and the functions
  `x ↦ (a^{k+x} e^{−a}/(k! x!))^{1/2} c_k(x; a)` form a Hilbert basis of `ℓ²(ℕ)`.

Route: the matrix elements are 3.1 at `y = z = 0`; orthogonality and completeness are the unitarity
relations of SpecialFunctionsGroupModels §3.2 for the unitary matrix `(E_{kn}(x, 0, 0))` together
with duality.

**Checks.**
- `x = 1.3`: both sides of the matrix-element identity agree at `(k, n) = (0, 0), (2, 3), (3, 1)`;
  at `(0, 0)` both are `e^{−x²/4} = 0.65540 62543`.
- `a = 1.5`: the orthogonality sums are `1`, `0`, `0` at `(k, p) = (2, 2), (2, 3), (0, 1)`.
- Duality and the Laguerre form at `a = 1.5`, `n = 3`, `x = 5`:
  `c_3(5; a) = c_5(3; a) = (−1)³ 3! a^{−3} L_3^{(2)}(a) = −1/9`.
- Negative control: Klimyk–Vilenkin's (5) misprints the exponent `(n + k)/2` as `(m + k)/2`; with
  the representation label `m` in place of `n` the identity fails unless `m = n`.

*Needs:* 3.1–3.2.

### 3.4 The Fock model and the Bargmann transform

Sources: Vilenkin–Klimyk Vol. 2 §12.1.7 (1)–(15), pp. 418–420; Wawrzyńczyk §12.1 (12.1.6)–(12.1.8)
and Lemma 12.1.1, pp. 425–427; Miller §4-13 (4.111)–(4.114), pp. 117–118.

`fockSpace` is the closure in `L²(fockMeasure)` of the span of the `fockMonomial n`;
`bargmannKernel ζ u = π^{−1/4} exp(−ζ²/2 + √2 ζu − u²/2)`; and `fockHeisenbergAction p F ζ` is
`e^{i(z − xy/2)} e^{−|w|²/4 − conj w ζ/√2} F(ζ + w/√2)` with `w = x + iy`. Prove:
- **Fock space** (`fockSpace_spec`): the `fockMonomial n` are orthonormal, and `F ∈ fockSpace`
  exactly when `F` agrees almost everywhere with an entire function;
- **Bargmann transform** (`bargmann_spec`): there is a linear isometry `B` from `L²(ℝ)` onto
  `fockSpace` with `B h_n = fockMonomial n`, given for every `f ∈ L²(ℝ)` by
  `(B f)(ζ) = ∫ bargmannKernel ζ u f(u) du` (for each `ζ` the kernel is a Gaussian in `u`, so the
  integral converges), and carrying `U(p)` to `fockHeisenbergAction p`.

The Fock model and the Bargmann transform of a real symplectic space of dimension `2N` with a
positive compatible complex structure are ThetaKernelsForUnitaryDualPairs §3.45(i)–(ii): the Fock
space of holomorphic functions square-integrable for `e^{−πH(z,z)} dz`, with the holomorphic
polynomials dense in it, and a unitary Bargmann transform from `L²` of a Lagrangian onto it,
intertwining the Schrödinger action of MetaplecticAutomorphicForms §0.15 with
`ψ(t) U_w`, `U_w G(z) = G(z + w) e^{−πH(z,w) − πH(w,w)/2}`, `ψ(t) = e^{2πit}`. This roadmap consumes
that statement at `N = 1` (`W = ℝe ⊕ ℝf`, `ω(e, f) = 1`, Lagrangian `ℝe`, `Je = f`, so
`H(z, w) = z conj w`) and transports it by the following dictionary, which is the only content of
the existence, unitarity and intertwining parts of the two targets above:
- the line: `u = √(2π) v`, with the unitary map `(S f)(v) = (2π)^{1/4} f(√(2π) v)` from
  `L²(ℝ, du)` to `L²(ℝ, dv)`; it sends `h_0` to the vacuum `2^{1/4} e^{−πv²}`;
- the Fock variable: `ζ = √π z`, and `F ↦ F(√π ·)` carries `fockMeasure` to the probability measure
  `e^{−π|z|²} dz`, so `fockSpace` goes onto the holomorphic Fock space there;
- the kernel: `bargmannKernel (√π z) (√(2π) v)` times the Jacobian `(2π)^{1/2}` and the factor
  `(2π)^{−1/4}` of `S⁻¹` is `2^{1/4} e^{2πvz − πv² − πz²/2}`, the kernel of §3.45's Check;
- the group: Tau Ceti's `(x, y, z)` acts as the Heisenberg element `ae + bf` with
  `a = x/√(2π)`, `b = y/√(2π)` and central coordinate `t = (z − xy/2)/(2π)`, so that `U(x, y, z)`
  is `S⁻¹ ρ(ae + bf, t) S` for the Schrödinger action `ρ` of MetaplecticAutomorphicForms §0.15, and
  `ψ(t) U_{w′}` with `w′ = (x + iy)/√(2π)` becomes `fockHeisenbergAction (x, y, z)`.

What this roadmap adds to §3.45 is the normalization in the coordinates of Tau Ceti's Heisenberg
group and its Hermite basis, `B h_n = fockMonomial n`, the explicit kernel formula on all of `L²`,
and the oscillator group of Layer 4. Route for `B h_n = fockMonomial n`: integrate the generating
function `Σ_n h_n(u) sⁿ/√n! = π^{−1/4} e^{−u²/2 + √2 su − s²/2}` against the kernel; the Gaussian
integral gives `e^{sζ} = Σ_n ζⁿ sⁿ/n!`, and the coefficients of `sⁿ` agree.

Vilenkin–Klimyk's kernel (11), p. 420, maps `L²(ℝ)` to antianalytic functions. Their analytic
model is printed in (15), p. 420, as `(Q^λ(n(w, t)) f)(z) = exp iλ(t + ½ Im w·z̄) f(z − w)`,
which does not map entire functions times `e^{−λ|z|²/4}` to such functions; the corrected
operator is `exp iλ(t − ½ Im w·z̄) f(z − w)`, since `e^{−λ|z − w|²/4}` contributes
`e^{λ Re(z w̄)/2}` and only the phase `e^{iλ Im(z w̄)/2}` completes it to the holomorphic
`e^{λ z w̄/2}`. The kernel here is the standard Bargmann kernel for `U` and entire functions.

**Checks.**
- `B h_2 (ζ) = ζ²/√2` and `B h_3 (ζ) = ζ³/√6` at `ζ = 0.4 − 0.3i` by quadrature.
- The intertwining identity at `(x, y, z) = (0.7, −1.1, 0.4)`, `ζ = 0.4 − 0.3i`,
  `f(u) = e^{−u²/2}(1 + u + u²)`: both sides are `1.46619 73284 − 0.14971 07965 i`.
- Negative control: exchanging `w` and `conj w` in the intertwining formula gives
  `0.04510 48830 + 2.28755 76036 i`.
- Negative control: `ζ ↦ conj ζ` is in `L²(fockMeasure)` but not in `fockSpace`: it is orthogonal to
  every `fockMonomial n`.
- The dictionary at `f(u) = e^{−u²/2}(1 + u + u²)`, `z = 0.3 − 0.2i`: `(B f)(√π z)` and the kernel
  of §3.45 applied to `S f` at `z` are both `2.60214 03106 − 0.58466 70905 i`; at
  the group element `p = (0.7, −1.1, 0.4)`, `S(U(p) f)` and `ρ(ae + bf, t)(S f)` agree at `v = 0.37`
  (`1.80807 28593 − 1.29133 92355 i`), and the two sides of the transported intertwining at the
  same `z` are `1.43436 82448 − 0.29380 00431 i`.

*Needs:* 3.1; Tau Ceti `TauCeti.hermiteFunctionLp`; ThetaKernelsForUnitaryDualPairs §3.45(i)–(ii);
MetaplecticAutomorphicForms §0.15.

### Examples

- The coherent states: `U(g) h_0 = Σ_m E_{m0}(g) h_m`, and `B(U(g) h_0)` is a multiple of the
  exponential `ζ ↦ e^{αζ}`.

### Dependencies

3.1 → 3.2 → 3.3; 3.1 → 3.4.

## Layer 4: the oscillator group on the Fock space

### 4.1 The representations and their matrix elements

Sources: Miller §4-14 (4.119)–(4.120) and Theorem 4.2, pp. 121–122, §4-15 (4.121)–(4.123),
p. 122, and Lemma 4.5, p. 123; Klimyk–Vilenkin Chapter 6, §1.4, p. 239.

`Oscillator` acts on `ℂ` by `g⁻¹ • ζ = e^{iα}(ζ + w/√2)`, and for real `λ` `oscillatorFock λ` is the
multiplier representation on `L²(fockMeasure)` with
`oscillatorCocycle λ g ζ = e^{iλα − 2iδ} e^{−|w|²/4 − conj w ζ/√2}`. Prove:
- **Oscillator representations** (`oscillatorFock_spec`): `oscillatorFock λ` realizes the formula,
  is unitary, leaves `fockSpace` invariant and is irreducible on it, and its multiplier action on
  the Heisenberg subgroup of 0.2 is `fockHeisenbergAction`, so that with 3.4 its restriction is
  `B U B⁻¹`;
- **Oscillator matrix elements** (`inner_fockMonomial_oscillatorFock`):
  `⟪fockMonomial m, oscillatorFock λ g (fockMonomial n)⟫` equals
  `e^{iλα − 2iδ + inα} hermiteMatrixElement m n (Re w) (Im w) (Re w Im w / 2)`.

Route: `oscillatorFock λ (w, α, δ) = e^{iλα − 2iδ} D(−conj w/√2) R(α)` with the rotation
`R(α) F(ζ) = F(e^{iα} ζ)`, which multiplies `fockMonomial n` by `e^{inα}`; irreducibility as in
Miller's Lemma 4.5, from the rotation weights and the nonvanishing of the matrix elements.

**Checks.**
- Representation law at `λ = 2.3`, `g = (0.4 − 0.9i, 0.7, 0.2)`, `h = (−1.1 + 0.3i, −1.9, 0.5)`,
  `ζ = 0.3 + 0.6i`, `F(ζ) = 1 + ζ + ζ³/3`: defect `10⁻²⁵`.
- Negative control: with `+Im(e^{−iα₁} conj w₁ w₂)/4` in the law the defect is `0.363`.
- Matrix elements by Cauchy coefficient extraction agree with the formula at
  `(m, n) = (0, 0), (2, 1), (1, 3)`; at `(0, 0)` both are `0.27700 15263 + 0.73414 39581 i`.
- On the Heisenberg subgroup, at `p = (0.7, −1.1, 0.4)` and the same `ζ` and `F`, the multiplier
  action and `fockHeisenbergAction p F ζ` are both `1.75018 91273 + 0.18786 19536 i`.

*Needs:* 0.2, 3.1, 3.4; SpecialFunctionsGroupModels §§1.2–1.3.

The orthogonality relations of Miller's Theorem 4.3 (p. 124), with
`δ(l − l') = (1/2π) ∫ e^{ix(l−l')} dx` (Miller prints `1/(2πi)` on the line before Theorem 4.3,
which would make the constant imaginary), reduce to 3.2 after the `α`-integration, which gives
`δ_{λλ'}` for integer weights; they are a target of the same standing, stated in prose.

### Dependencies

4.1 needs 0.2 and Layer 3.

## Layer 5: Miller's group `G(0, 1)` and the Laguerre addition theorem

### 5.1 The representations on entire functions

Sources: Miller §4-2 (4.17)–(4.28), pp. 85–88; Wawrzyńczyk §12.2 (12.2.1), p. 429; Vilenkin–Klimyk
Vol. 2 §12.1.6, p. 416.

`millerAction μ ω g f z = e^{μ(bz + a) − ωτ} f(e^τ z + e^τ c)` for `g = (a, b, c, τ)` (Miller
(4.19), p. 86), and `millerMatrixElement μ ω l k g` is `e^{μa + (k−ω)τ}` times the finite sum
`Σ_{s ≤ min(k, l)} C(k, s) c^{k−s} (μb)^{l−s} / (l − s)!`, which is Miller's (4.24), p. 87, after
`s ↦ k − s`. Prove:
- **Representation law** (`millerAction_mul`): `B(gh) = B(g) B(h)` on all functions ((4.20), p. 86);
- **Real points** (`millerAction_eq_triangularAction`): on real coordinates `millerToTriangular`
  turns Miller's law into the triangular law, and
  `millerAction μ ω g = triangularAction μ (−ω) (millerToTriangular g)` on functions on `ℝ`, so
  Miller's representation is `T_{(μ, −ω)}` continued to entire functions;
- **Matrix elements** (`hasSum_millerAction_monomial`): `B(g) z^k = Σ_l B_{lk}(g) z^l` for all
  `z ∈ ℂ` ((4.21)–(4.22), pp. 86–87);
- **Laguerre form** (`millerMatrixElement_eq_laguerre`): for `c ≠ 0`,
  `B_{lk}(g) = e^{μa + (k−ω)τ} c^{k−l} L_l^{(k−l)}(−μbc)` ((4.26), p. 87);
- **Addition theorem** (`hasSum_millerMatrixElement_mul`): `Σ_j B_{lj}(g) B_{jk}(h) = B_{lk}(gh)`
  ((4.23), p. 87, and with the Laguerre form, (4.28), p. 88);
- **Generating function** (`hasSum_laguerre_generating`):
  `e^{−xz}(1 + z)^m = Σ_n L_n^{(m−n)}(x) z^n` for all complex `x`, `z` ((4.27), p. 87;
  Wawrzyńczyk (12.2.1)).

**Checks.**
- The representation law at `μ = 0.7 + 0.2i`, `ω = −0.3 + 0.5i`,
  `g = (0.2 + 0.1i, −0.6 + 0.3i, 0.9 − 0.2i, 0.3 + 0.4i)`,
  `h = (−0.5 + 0.2i, 0.4 + 0.1i, −0.3 + 0.6i, −0.2 + 0.1i)`, `f(z) = z² + 3z − 1`, `z = 0.3 + 0.6i`:
  defect `5 · 10⁻²⁶`; with `hg` in place of `gh` it is `2.955`.
- The finite sum and the Laguerre form agree at `(l, k) = (1, 3), (3, 1), (0, 0), (4, 2)`; the case
  `l > k` uses the continued `L_l^{(k−l)}`; at `(3, 1)` both agree with Miller's printed (4.24).
- Addition at `(l, k) = (2, 1)` with `j < 60`: `−0.59547 31557 − 0.06605 50294 i` both sides.
- Generating function at `x = 0.8`, `z = 0.3`, `m = 3`, with `n < 60`: both sides are
  `1.72822 14108`.
- Negative control: at `c = 0` and `l > k` the factor `c^{k−l}` is the junk value `0` of Lean's
  `zpow`, while `B_{10}((0, 1, 0, 0)) = μ`; hence the hypothesis `c ≠ 0`.

*Needs:* 0.1, 2.1; LaguerreJacobi §1.1.

### Dependencies

5.1 needs 0.1, and 2.1 only for the real-points bullet.

## Worked examples

- **The Gamma function as a kernel.** At `a = 1`, `λ = −1`, `b = 1` the kernel of 1.2 applied to
  `f(x) = e^{−x}` gives `mellin (e^{−2x}) w = 2^{−w} Γ(w)` as the Mellin–Barnes integral
  `(1/2π) ∫ Γ(w − c − is) Γ(c + is) ds`, the case `t = 1` of 1.3.
- **A Whittaker kernel in closed form.** At `λ = 1`, `μ = 0`, `2πi t K_{++}(g_1(t)) = e^{−t²/2}`
  (2.5 with `W_{0,1/2}(z) = e^{−z/2}`).
- **Charlier from a translation.** The matrix of `U(x, 0, 0)` in the Hermite basis is real and
  unitary; its entries are the Charlier functions of 3.3 at `a = x²/2`, and its unitarity is the
  orthogonality of the Charlier polynomials.
- **The Laguerre generating function from Miller's group.** At `g = (0, 1, 1, 0)` and `μ = −x`,
  `B(g) z^m = e^{−xz}(z + 1)^m`, and 5.1 expands it as `Σ_n L_n^{(m−n)}(x) zⁿ`.

## Downstream consumers

- A roadmap on the Askey scheme of hypergeometric orthogonal polynomials consumes the Charlier
  polynomials of 3.3 with their duality and orthogonality.

## Scope and ownership

This roadmap owns the triangular group, the oscillator group as an abstract group with its
Heisenberg embedding, the representations `T_χ`, their Mellin kernels and the composition of
kernels, the Hermite matrix elements of the Schrödinger representation and their identities, the
one-variable Fock space and Bargmann transform in the coordinates of Tau Ceti's Heisenberg group
with `B h_n = fockMonomial n`, the oscillator Fock representations, Miller's `G(0, 1)` model and the
Charlier polynomials. No other roadmap owns a Charlier definition; LaguerreJacobi excludes the rest
of the Askey scheme. Everything it consumes is listed under Exact supplier contracts.

Boundaries:
- The Mellin–Barnes integral of `(1 + u)^{−a}` and the half-line Beta integral are
  SpecialFunctionsHypergeometric §6.3; 1.3 and 2.6 reduce to them and do not restate them. The
  Gamma integral with complex rate is AsymptoticExpansions §4.1.
- The Fock model and the Bargmann transform of a real symplectic space of any dimension are
  ThetaKernelsForUnitaryDualPairs §3.45(i)–(ii); 3.4 consumes them at `N = 1` through the
  dictionary stated there, and owns only the normalization in Tau Ceti's coordinates, the Hermite
  correspondence `B h_n = fockMonomial n`, the explicit kernel formula on `L²(ℝ)` and Layer 4.
- The irreducible unitary representations of the `ax + b` and Heisenberg groups and their
  classification are SpecialFunctionsGroupModels §§2.4–2.5, which consume them from
  NoncompactQuantumSymmetry M2; the Stone–von Neumann theorem is MetaplecticAutomorphicForms 1.2
  and is not used here.
- Analytic properties of `W_{κ,μ}` and `M_{κ,μ}` beyond the kernel identities are those of
  SpecialFunctionsConfluent; Laguerre orthogonality and bases are LaguerreJacobi's.
- The representations of the triangular group are treated only through `T_χ` on the line; the
  one-dimensional representations and those trivial on the centre are not.
- SpecialFunctionsParabolicCylinder owns the bridge between Hermite functions and the parabolic
  cylinder functions `D_n`, and OperatorTheory owns the harmonic oscillator as an unbounded
  operator; neither is restated here.
- The sibling roadmaps on the motion groups and Bessel functions, on `SU(1,1)` matrix elements, on
  Clebsch–Gordan coefficients and on higher spheres consume the same SpecialFunctionsGroupModels
  framework and do not overlap this roadmap.

## Exact supplier contracts

### From Mathlib

- `mellin`, `mellin_comp_mul_left`, `mellin_cpow_smul`, `mellin_comp_rpow`, `mellinInv_mellin_eq`:
  the Mellin transform, its dilation and shift rules and Mellin inversion. Used in Layers 1–2.
- `Complex.Gamma`, `Complex.betaIntegral`, `Complex.Gamma_mul_Gamma_eq_betaIntegral`,
  `Complex.integral_cpow_mul_exp_neg_mul_Ioi`: Gamma and Beta integrals (the last with a real
  rate). Used in 1.2, 2.4.
- `MeasureTheory.Lp.fourierTransformₗᵢ`: the Fourier transform on `L²` as a linear isometric
  equivalence (Plancherel's theorem). Used in 1.1.
- `MeasureTheory.Lp`, `HilbertBasis`, `Orthonormal`, `Submodule.topologicalClosure`. Used in
  Layers 2–4.

### From Tau Ceti

- `TauCeti.HeisenbergGroup` with `TauCeti.HeisenbergGroup.equivProd`
  (`TauCeti/GroupTheory/SpecificGroups/Heisenberg.lean`): the Heisenberg group with
  `(x, y, z)(x', y', z') = (x + x', y + y', z + z' + x y')`. Used in 0.1, 0.2, 2.1, Layer 3.
- `TauCeti.hermiteFunction`, `TauCeti.hermiteFunctionLp`, `TauCeti.hermiteHilbertBasis` and
  `TauCeti.coe_hermiteHilbertBasis` (`TauCeti/Analysis/SpecialFunctions/Hermite/Function/`): the
  Hermite functions and their Hilbert basis of `L²(ℝ)`. Used in 3.1, 3.4.
- `ContRepresentation` with `ContRepresentation.IsUnitary`
  (`TauCeti/RepresentationTheory/Continuous/Unitary/Basic.lean`). Used in 2.1, 3.1, 4.1.

### From [AsymptoticExpansions](../AsymptoticExpansions/README.md)

- §4.1: for `Re s > 0` and `Re z > 0`, `∫₀^∞ t^{s−1} e^{−zt} dt = Γ(s) z^{−s}` with the principal
  power. Used in 1.2.

### From [SpecialFunctionsHypergeometric](../SpecialFunctionsHypergeometric/README.md)

- §6.3: the Mellin–Barnes integral of `(1 + u)^{−a}`: for `0 < σ′ < Re a` and `u > 0`,
  `Γ(a) (1 + u)^{−a} = (1/2π) ∫ Γ(σ′ + iy) Γ(a − σ′ − iy) u^{−σ′−iy} dy`; and the half-line Beta
  integral `∫₀^∞ t^{s−1} (1 + t)^{−a} dt = Γ(s) Γ(a − s)/Γ(a)` for `0 < Re s < Re a`
  (DLMF 5.12.3). Used in 1.3 and 2.6.

### From SpecialFunctionsGroupModels

- §0.2: the `ax + b` group and the oscillator matrices `s(w, α, δ)` with their law, and the
  bi-invariant Haar measure of the triangular group. Used in 0.1, 0.2, 1.1.
- §§1.2–1.3: multiplier actions, the cocycle identity, and the multiplier representation on `L²`
  chosen by uniqueness. Used in 2.1, 4.1.
- §2.4: the representations of the `ax + b` group on `L²(dx/x)` with their unitarity,
  irreducibility and equivalence classes. Used in 1.1.
- §2.5: the Schrödinger representation, its unitarity and its irreducibility (consumed there from
  NoncompactQuantumSymmetry M2). Used in 2.1, 3.1, 3.4.
- §3.1: matrix elements in a Hilbert basis. §3.2: the addition theorem and the unitarity relations.
  Used in 3.1–3.3.

The definitions are copied verbatim into `Suggested.lean`.

### From SpecialFunctionsConfluent

- §§1.4, 1.6: Tricomi's function and the Whittaker functions `M_{κ,μ}`, `W_{κ,μ}` (DLMF
  13.14.2–13.14.3, copied verbatim into `Suggested.lean`) and Whittaker's equation (DLMF 13.14.1).
  Used in 2.5, 2.6.
- §2.4: the integral representations DLMF 13.16.1 and 13.16.5 and the Mellin–Barnes integrals
  DLMF 13.16.10–13.16.12. Used in 2.5, 2.6.
- §4.2: the recurrences DLMF 13.15.1–13.15.26. Used in 2.6.

### From LaguerreJacobi

- §1.1: the generalized Laguerre polynomials `L_n^{(α)}` over a `ℚ`-algebra (copied verbatim into
  `Suggested.lean`). Used in 3.1, 3.3, 5.1.
- §2.3: the orthogonality of `L_n^{(α)}` against `x^α e^{−x}`; §2.4: the two Hilbert bases. Used in
  3.2.

### From ThetaKernelsForUnitaryDualPairs

- §3.45(i)–(ii), at `N = 1`: for a real symplectic plane with a positive compatible complex
  structure `J` and `H(x, y) = ω(x, Jy) − iω(x, y)`, the Fock space of holomorphic functions
  square-integrable for the probability measure `e^{−πH(z,z)} dz`, in which the holomorphic
  polynomials are dense; and a unitary Bargmann transform from `L²` of a Lagrangian onto it,
  intertwining the Schrödinger action of MetaplecticAutomorphicForms §0.15 (with
  `ψ(t) = e^{2πit}`) with `ψ(t) U_w`, `U_w G(z) = G(z + w) e^{−πH(z,w) − πH(w,w)/2}`. Used in 3.4,
  through the dictionary stated there, and so in 4.1.

### From [MetaplecticAutomorphicForms](../MetaplecticAutomorphicForms/README.md)

- §0.15: the Schrödinger representation `ρψ(x + y, t) φ(u) = ψ(t + ω(u, y) + ½ω(x, y)) φ(u + x)`
  of a polarized symplectic space, which fixes the coordinates of the dictionary of 3.4.

### From [NoncompactQuantumSymmetry](../NoncompactQuantumSymmetry/README.md)

- M2, the HeisenbergShear comparison: the irreducible representations of the Heisenberg group with
  a given nontrivial central character, consumed through SpecialFunctionsGroupModels §2.5 for the
  irreducibility in 2.1.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material lies outside this roadmap. It is recorded only to fix the boundary.
Contributors should not attempt it under this roadmap.

- **Higher-dimensional Heisenberg groups** `N_n` and the tensor-product matrix elements
  (Vilenkin–Klimyk Vol. 2 §§12.1.1–12.1.5); this roadmap treats the three-dimensional group, and
  `N_n` belongs with the metaplectic theory.
- **Weisner's method and Miller's other models** of `G(0, 1)` (Miller §§4-3–4-10), the
  representations `R(ω, m₀, μ)` with Laguerre functions (Miller §4-1), and the Lie-derivative
  recursions (Miller (4.41)–(4.44)): a theory of Lie-algebraic generating functions, not of group
  matrix elements.
- **The Hermite–Laguerre relations** of Vilenkin–Klimyk Vol. 2 §12.1.9 and the Laguerre product
  formulas obtained by integrating the addition theorem (Miller §4-15, p. 125).
- **Kirillov's orbit method** for nilpotent groups (Dieudonné §17, p. 58), which is general
  representation theory.

## Prior formalization

[lean-SFVK](https://github.com/bjbraams/lean-SFVK) (Apache-2.0), by the author of this roadmap, at
commit `2a512fe` proves the following targets without `sorry`, against Tau Ceti and the lean-DLMF
Laguerre and Charlier polynomials. The roadmap reuses its conventions and names; its modules are a
cited source, not the specification. The definitions of all layers are in
`SFVK/AffineHeisenberg/Basic/Groups.lean` and `SFVK/AffineHeisenberg/Basic/Models.lean`, on the
multiplier framework of `SFVKMathlib/MeasureTheory/Group/Multiplier.lean`.

- §§0.1–0.2: `TriangularGroup.toMatrix_mul`, `TriangularGroup.mem_center_iff`,
  `TriangularGroup.factorizations`, `heisenbergToTriangular_injective`, `Oscillator.toMatrix_mul`,
  `Oscillator.toMatrix_eq_one_iff` and `heisenbergToOscillator_injective`
  (`SFVK/AffineHeisenberg/Groups.lean`).
- §§1.1–1.2: `affineAction_mul`, `affineAction_one`, `affineAction_mul_I`, `mellin_mul_deriv` and
  `mellin_affineAction_eq_integral` (`SFVK/AffineHeisenberg/Affine.lean`); the same module also
  proves the two Mellin rules of 1.1 that are not stated separately and the addition formula and
  its dual form of 1.3, which this roadmap consumes from SpecialFunctionsHypergeometric.
- §§2.1–2.3: `isMultiplierCocycle_triangularCocycle`, `lintegral_triangularAction_iff`,
  `triangularAction_heisenberg`, `hasDerivAt_triangularAction`, `signedMellin_dilation_centre`,
  `signedMellin_infinitesimal` and `signedMellin_triangularAction`
  (`SFVK/AffineHeisenberg/Triangular.lean`).
- §§2.4–2.5: `triangularKernel_translationElement`, `triangularKernel_modulationElement`,
  `triangularKernel_equalTranslationModulation`, `triangularKernel_oppositeTranslationModulation`
  and `triangularKernel_reflect` (`SFVK/AffineHeisenberg/TriangularKernels.lean`).
- §§3.1–3.2: `matrixElement_schrodinger_hermite`, `norm_laguerre_le`,
  `hasSum_hermiteMatrixElement_mul` and `integral_hermiteMatrixElement`
  (`SFVK/AffineHeisenberg/Schrodinger.lean`).
- §3.3: `hermiteMatrixElement_charlier`, `charlier_eq_laguerre`, `charlier_symm` and
  `charlier_orthogonality` (`SFVK/AffineHeisenberg/Charlier.lean`).
- §5.1: `millerAction_mul`, `millerAction_eq_triangularAction`, `hasSum_millerAction_monomial`,
  `millerMatrixElement_eq_laguerre`, `hasSum_millerMatrixElement_mul` and
  `hasSum_laguerre_generating` (`SFVK/AffineHeisenberg/Miller.lean`).

At that commit the modules `SFVK/AffineHeisenberg/Triangular.lean`, `Schrodinger.lean`,
`Fock.lean` and `Oscillator.lean` state `triangularRep_spec`, `hermiteMatrixElement_hilbertBasis`,
`fockSpace_spec`, `bargmann_spec`, `oscillatorFock_spec` and `inner_fockMonomial_oscillatorFock`
with `sorry`, and lean-SFVK has no counterpart of `mellin_plancherel`,
`affineGammaKernel_composition` or `triangularKernel_equalTranslationModulation_eq_integral`.

## References

- J. Dieudonné, *Special Functions and Linear Representations of Lie Groups*, CBMS Regional
  Conference Series in Mathematics 42, AMS, 1980, §17.
- A. U. Klimyk and N. Ya. Vilenkin, *Representations of Lie Groups and Special Functions*, in A. A.
  Kirillov (ed.), *Representation Theory and Noncommutative Harmonic Analysis II*, Encyclopaedia of
  Mathematical Sciences 59, Springer, 1995, Part II, Chapters 1, 4 and 6.
- W. Miller, Jr., *Lie Theory and Special Functions*, Mathematics in Science and Engineering 43,
  Academic Press, 1968, Chapter 4.
- N. Ja. Vilenkin and A. U. Klimyk, *Representation of Lie Groups and Special Functions*, Vol. 1,
  Mathematics and Its Applications (Soviet Series) 72, Kluwer, 1991, §§3.4, 5.1–5.2.
- N. Ja. Vilenkin and A. U. Klimyk, *Representation of Lie Groups and Special Functions*, Vol. 2,
  Mathematics and Its Applications (Soviet Series) 74, Kluwer, 1993, §12.1.
- A. Wawrzyńczyk, *Group Representations and Special Functions*, Mathematics and Its Applications
  (East European Series), Reidel / PWN, 1984, Chapter 12.
