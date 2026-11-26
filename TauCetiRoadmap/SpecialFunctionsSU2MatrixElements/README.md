# Roadmap: matrix elements of SU(2) and SO(3), Jacobi and Legendre functions

**Summary.** The irreducible unitary representations of SU(2) are the symmetric powers
`Sym^d ℂ²`, `d ≥ 0`, of spin `j = d/2`. This roadmap builds their matrix elements in a weight
basis and in Euler angles, Wigner's functions `D^j_{m'm}(α, β, γ) = e^{im'α} d^j_{m'm}(β) e^{imγ}`,
and derives the classical special functions and their identities from the group structure. The
Euler angles parametrize SU(2) and SO(3), and in them the Haar probability measure of SU(2) is
`(16π²)⁻¹ sin β dα dβ dγ`. The reduced function `d^j_{m'm}` is a Jacobi polynomial with integer
parameters in `cos β`, times powers of `sin(β/2)` and `cos(β/2)`, and `d^l_{m0}` is a Legendre
polynomial or a Ferrers function of integer order. The group law gives the addition and product
formulas; Schur orthogonality gives the orthogonality of the `d^j` and Plancherel on SU(2); the
Lie-algebra action gives the differential equation, the recurrence and the Casimir eigenvalue
`-j(j+1)`; the trace gives the characters, Chebyshev polynomials `U_{2j}` of the second kind; and
unitarity gives the orthogonality of the Krawtchouk polynomials `K_s(x; p, N)` for `0 < p < 1`. On
the sphere `S² = SO(3)/SO(2)` the columns of `D^l` are the spherical harmonics of degree `l`,
which rotate by `D^l` and span an irreducible representation of SO(3) of dimension `2l + 1`; and
(SU(2), T) is a Gel'fand pair whose zonal spherical functions are the `P_l(cos β)`.

The roadmap rests on Tau Ceti's SU(2) development (the models `Sym^d`, their irreducibility and
exhaustion, their characters and the double cover SU(2) → SO(3)) and its compact-group development
(Haar measure, Schur orthogonality, Peter–Weyl), and on the Jacobi, Legendre and Gegenbauer
polynomials of the [LaguerreJacobi](../LaguerreJacobi/README.md) roadmap.
[SpecialFunctionsLegendre](../SpecialFunctionsLegendre/README.md) supplies the spherical harmonics
on `S²` with their orthonormality, addition theorem and completeness (the last resting on the
completeness of harmonic polynomials on spheres in
[RiemannianGeometry](../RiemannianGeometry/README.md)), and this roadmap identifies them with the
columns of `D^l`. SpecialFunctionsGroupModels consumes the Euler convention, the Haar density, the
unitary model and the matrix elements, and continues them to SU(1,1) and the Euclidean motion
groups.

Layer 1 sets up the Euler coordinates, the Haar measure in them and the unitary model. Layer 2
defines the matrix elements and their closed forms (Jacobi, hypergeometric, Legendre, Ferrers and
Gegenbauer) and converts from the convention of Vilenkin and Klimyk. Layers 3, 4 and 5 derive what
follows from the group law, from the Lie algebra, and from the trace and the column index. Layer 6
passes to the sphere and the Gel'fand pair. The roadmap is a synthesis of Edmonds, whose
convention it adopts, of Vilenkin and Klimyk with their survey, of Wawrzyńczyk, Dieudonné and
Miller, and of the DLMF for the normalizations; it follows none of them section by section.

## How to read the build

Each layer has numbered subsections. Each subsection lists its targets as bold headlines with their
Lean names, a source locator for a headline that restates a source result and a proof route for a
corollary, and Checks, which are sanity checks of the key definitions and theorems. Layers 1 and 2
are the foundation; within them, the unitarity of §1.4, and with it `irrepModel`, uses the entry
formula of §2.1, which needs only the definition of `unitaryModel`. Given Layer 2, the other layers
use each other as follows: §3.2 uses the addition theorem of §3.1, and §3.3 the Haar formula of
§1.3; Layer 4 uses only Layers 1 and 2; Layer 5 uses the unitarity of §2.2; §6.1 uses the Ferrers
form and the symmetries of §§2.5–2.6; §6.2 uses the Laplacian in Euler angles of §4.3 and the
differential equation of §4.2; §6.3 uses the points of §6.1, Schur orthogonality (§3.3), Plancherel
(§3.4), the addition theorem (§3.1) and the irreducibility of §1.4; §6.4 uses Schur orthogonality
(§3.3), Plancherel (§3.4) and the functional equation of §3.2.

## Conventions

The convention is that of Edmonds [E], chosen so that every displayed formula of
[E, §§4.1–4.2] in the 1957 printing holds verbatim for a genuine left representation of SU(2).

- `SU2` is Tau Ceti's `Matrix.specialUnitaryGroup (Fin 2) ℂ`, and
  `TauCeti.SU2.torusExp θ = diag(e^{iθ}, e^{-iθ})`.
- Spin `j = d/2` with `d : ℕ`. The basis index is `i : Fin (d + 1)` with magnetic quantum number
  `m = i - d/2` (`magneticWeight`). Edmonds's order `m = j, j - 1, …, -j` is `i = d, d - 1, …, 0`.
  The index `i` is that of Tau Ceti's `TauCeti.SU2.weightBasis`, whose `i`-th vector is
  `z₁^i z₂^{d-i}`; its Tau Ceti weight `2i - d` is `2m`, so no reindexing against Tau Ceti is
  needed.
- The action is `T(g) f(z₁, z₂) = f(g₀₀z₁ + g₁₀z₂, g₀₁z₁ + g₁₁z₂)`, which is Tau Ceti's
  `TauCeti.SU2.symPowerModel` under `e₀ ↦ z₁`, `e₁ ↦ z₂`.
- The invariant norm of `z₁^i z₂^{d-i}` is `√(i!(d-i)!)` (`monomialNorm`). The orthonormal basis
  is `u(j, m) = z₁^{j+m} z₂^{j-m} / √((j+m)!(j-m)!)`, Edmonds's spinor realization
  [E, §4.1, p. 56]. At `j = 1/2`, `u(1/2, 1/2)` is the first standard basis vector of `ℂ²`.
- The matrix element is `D^j_{m'm}(g) = ⟪e_{m'}, T^j(g) e_m⟫` [E, (4.1.10), p. 55]: in Lean,
  `matrixElement d i k g` is the inner product of `e_i` with `unitaryModel d g e_k`, with
  `m' = i - d/2` and `m = k - d/2`. Mathlib's inner product is conjugate-linear in the first
  argument, so this is the conjugate of Tau Ceti's matrix coefficient `g ↦ ⟪π g v, w⟫` at
  `v = e_k`, `w = e_i` (`matrixElement_eq_conj_matrixCoeff`).
- Euler angles. Edmonds writes the operator of `(α, β, γ)` as
  `exp(iαJ_z) exp(iβJ_y) exp(iγJ_z)` [E, (4.1.9), p. 55], with `ħ = 1`. The group element of
  `(α, β, γ)` is its spin-one-half value `euler α β γ = g_α b_β g_γ`, where
  `g_α = torusExp (α/2) = diag(e^{iα/2}, e^{-iα/2})` and
  `b_β = eulerMiddle β = [[cos(β/2), sin(β/2)], [-sin(β/2), cos(β/2)]]` is Edmonds's `exp(iβJ_y)`
  [E, (4.1.13), p. 56].
- With these choices `D^j_{m'm}(euler α β γ) = e^{im'α} d^j_{m'm}(β) e^{imγ}`
  [E, (4.1.12), p. 55], for all real `α, β, γ`. The real function `d^j_{m'm}` is Edmonds's
  finite sum [E, (4.1.15), p. 57] (`wignerSmallD`). It is defined for every real `β`, with no
  square roots of `1 ± cos β`, so no statement needs a range of `β` except where `sin β` or
  `sin(β/2)` is divided by.
- Edmonds's angles range over `0 ≤ α < 2π`, `0 ≤ β < π`, `0 ≤ γ < 2π` for rotations
  [E, §1.3, p. 7]. On SU(2) one angle needs a range of length `4π`, since
  `euler α β (γ + 2π) = -euler α β γ`. The SU(2) box is therefore `0 ≤ α < 2π`, `0 < β < π`,
  `-2π ≤ γ < 2π` (`eulerBox`).
- Rotations. Tau Ceti's double cover `SU(2) → SO(3)` is the action on `ℝ³` by conjugation
  through the Pauli map `x ↦ [[x₂, x₀ - i x₁], [x₀ + i x₁, -x₂]]`. `pauliRotation` is a local copy
  of its matrix, with the same formula. It sends `g_α` to `R_z(-α)` and `b_β` to `R_y(-β)`, so
  `pauliRotation (euler α β γ) = R_z(-α) R_y(-β) R_z(-γ)` (`rotationZ`, `rotationY`).
- Edmonds describes `D(αβγ)` as the operator of the rotation of the coordinate frame
  [E, §4.1, p. 53]; in fixed axes that frame rotation is `R_z(α) R_y(β) R_z(γ)` [E, §1.3, p. 8].
  The rotation `pauliRotation (euler α β γ)` is the inverse of that frame rotation with `α` and
  `γ` exchanged. This roadmap attaches the group element `euler α β γ` to `(α, β, γ)`, so that
  Edmonds's formulas hold verbatim, and does not use the frame-rotation reading.
- Legendre polynomials are `P_l = jacobi 0 0 l` (DLMF 18.7.9), with LaguerreJacobi's Jacobi
  polynomial. Ferrers functions of integral order are written through derivatives,
  `P_l^n(x) = (-1)^n (1 - x²)^{n/2} P_l^{(n)}(x)` (DLMF 14.6.1); the factor `(-1)^n` is the
  Condon–Shortley phase.
- Spherical harmonics. Edmonds's `Y_{lm}` [E, (2.5.5), p. 21; (2.5.29), p. 24] equals DLMF's
  `Y_l^m` (DLMF 14.30.1). Edmonds's associated Legendre function [E, (2.5.10), p. 22] has no
  Condon–Shortley factor; Edmonds puts the `(-1)^m` into `Y_{lm}`, and DLMF puts it into the
  Ferrers function. `sphericalHarmonic` is DLMF's `Y_l^m` as a polynomial on `ℝ³`, with
  `m = i - l`; it equals `Y_l^m` on the unit sphere, and §6.1 compares it with the spherical
  harmonic of SpecialFunctionsLegendre §3.1.
- The surface measure on `S²`, for `L²(S²)` in §6.3, is `MeasureTheory.Measure.toSphere` of
  Lebesgue measure, of total mass `4π`. In polar coordinates it is `sin θ dθ dφ` on
  `(0, π) × (0, 2π)` (`lintegral_toSphere_eq_setLIntegral_spherePoint`, §6.3), the measure of the
  spherical harmonics of SpecialFunctionsLegendre.
- Vilenkin and Klimyk use the basis `ψ_n = z₁^{l-n} z₂^{l+n}/√·`, which is `e_i` with
  `n_VK = d/2 - i = -m`, and the Euler element `u(φ, θ, ψ) = g_φ a_θ g_ψ` with
  `a_θ = [[cos(θ/2), i sin(θ/2)], [i sin(θ/2), cos(θ/2)]]` (`eulerMiddleX`, `eulerX`). Their
  formulas are transported by §2.7. A locator into [VK] or [KV] below refers to their convention.

## Layer 1: coordinates and the unitary model

### 1.1 Euler coordinates on SU(2)

Sources: [E, §1.3, pp. 6–8; (4.1.8)–(4.1.13), pp. 55–56]; [VK, §6.1.1, p. 269]; [D, §2 (27)–(28),
p. 6].

- **The Euler factors** (`ofPair`, `eulerMiddle`, `coe_eulerMiddle`). `ofPair a b` is
  `[[a, b], [-conj b, conj a]]` for `|a|² + |b|² = 1`, and `eulerMiddle β` is Edmonds's
  `exp(iβJ_y)` at spin one half [E, (4.1.13), p. 56].
- **The Euler matrix** (`euler`, `coe_euler`). The entries of `euler α β γ` are
  `cos(β/2) e^{±i(α+γ)/2}` on the diagonal, and `sin(β/2) e^{i(α-γ)/2}` and
  `-sin(β/2) e^{-i(α-γ)/2}` off it. Route: multiply out.
- **Euler angles cover SU(2)** (`exists_euler_eq`). Every `g` is `euler α β γ` with
  `0 ≤ α < 2π`, `β ∈ [0, π]`, `-2π ≤ γ < 2π`. This is [E, §1.3, p. 7, footnote 5] for SO(3), and
  [VK, §6.1.1, p. 269, (2)–(3)] in their convention. Route: `|g₀₀| = cos(β/2)` determines `β`;
  `arg g₀₀` and `arg g₀₁` determine `(α ± γ)/2` modulo `2π`; the `γ`-range of length `4π`
  separates `g` from `-g`.
- **Euler angles are a bijection on the generic set** (`eulerBox`, `bijOn_euler`). On `eulerBox`
  the map is a bijection onto `{g | g₀₀ g₀₁ ≠ 0}`. Route: as above, with `sin(β/2)` and
  `cos(β/2)` positive.

**Checks.**

- `ofPair 1 0 = 1`.
- `ofPair a b` has determinant `|a|² + |b|² = 1`.
- Negative control: `[[a, b], [conj b, conj a]]` (sign of the lower-left entry dropped) has
  determinant `|a|² - |b|²`, which is not `1` when `b ≠ 0`; it is not in SU(2).
- `eulerMiddle 0 = 1`.
- `eulerMiddle β * eulerMiddle β' = eulerMiddle (β + β')`.
- `eulerMiddle π = [[0, 1], [-1, 0]]`, Edmonds's `exp(iπJ_y)` at spin one half.
- Negative control: `eulerMiddle (2π) = -1`, not `1`.
- `euler α 0 0 = torusExp (α/2)` and `euler 0 β 0 = eulerMiddle β`.
- `(euler α β γ)⁻¹ = euler (-γ) (-β) (-α)`.
- Negative control: `euler (2π) 0 0 = -1`, not `1`; this is why one angle ranges over an interval
  of length `4π`.
- `(0, π/2, 0) ∈ eulerBox`, and `euler 0 (π/2) 0` has `g₀₀ g₀₁ = 1/2 ≠ 0`.
- The volume of `eulerBox` is `2π · π · 4π = 8π³`.
- Negative control: `(0, 0, 0) ∉ eulerBox`, and indeed `euler 0 0 γ = euler γ 0 0` for every `γ`,
  so the map is not injective where `β = 0`.

### 1.2 Rotations and SO(3)

Sources: [E, §1.3, pp. 6–8]; [VK, §6.1.3, p. 273]; [D, §2 (13)–(14), p. 4].

- **Rotations about the axes** (`rotationZ`, `rotationY`), in the counterclockwise convention of
  [E, §1.3, pp. 6–8].
- **The double cover** (`pauliRotation`). The matrix of Tau Ceti's double cover; its value on
  `torusExp θ` is `R_z(-2θ)`.
- **Euler angles on SO(3)** (`pauliRotation_euler`). `pauliRotation (euler α β γ)` is
  `R_z(-α) R_y(-β) R_z(-γ)`. Route: the value on the torus for the outer factors, and a direct
  Pauli computation for `b_β`.
- **Euler angles cover SO(3)** (`exists_eq_rotationZ_mul_rotationY_mul_rotationZ`). Every rotation
  is `R_z(-α) R_y(-β) R_z(-γ)` with `0 ≤ α < 2π`, `0 ≤ β ≤ π`, `0 ≤ γ < 2π`, the ranges of
  [E, §1.3, p. 7] with `β = π` added. Route: surjectivity of the double cover,
  `exists_euler_eq`, and `R_z(-γ - 2π) = R_z(-γ)`.

**Checks.**

- `rotationZ a * rotationZ b = rotationZ (a + b)`.
- `rotationZ (π/2)` sends `e₁` to `e₂` (counterclockwise).
- Negative control: `pauliRotation (torusExp (α/2)) = rotationZ (-α)`, not `rotationZ α`.
- `rotationY (π/2)` sends `e₃` to `e₁`.
- `rotationY a * rotationY b = rotationY (a + b)`.
- Negative control: `pauliRotation (eulerMiddle β) = rotationY (-β)`, not `rotationY β`; they
  differ at `β = 1.1` by `1.78` in the maximum entry.
- `pauliRotation 1 = 1`.
- `pauliRotation (torusExp π * g) = pauliRotation g`.
- `pauliRotation (euler α β γ)` sends `e₃` to `(-sin β cos α, sin β sin α, cos β)`.
- Negative control: `pauliRotation (torusExp θ) = rotationZ (-2θ)`, not `rotationZ (-θ)`; the
  double cover doubles the torus angle.

### 1.3 Haar measure in Euler angles

Sources: [VK, §6.1.4, p. 275, (1)]; [W, (8.3.4), p. 291]; [E, (4.6.1), p. 62], whose integral over
`γ ∈ [0, 2π]` with `(8π²)⁻¹` is the SO(3) form.

- **Haar measure in Euler angles** (`eulerMeasure`, `haarProb_eq_map_eulerMeasure`). The
  normalized Haar measure is the image of `eulerMeasure = (16π²)⁻¹ sin β dα dβ dγ` on
  `eulerBox`. Route: the image measure is a probability measure, because `∫ sin β` over the box
  is `16π²`; it is left invariant, because left multiplication by `h` acts on the first column
  `(g₀₀, g₁₀) ∈ S³ ⊂ ℂ²` by the unitary map `h`, which preserves the surface measure of `S³`, and
  `g₀₀ = cos(β/2) e^{i(α+γ)/2}`, `g₁₀ = -sin(β/2) e^{-i(α-γ)/2}` are spherical coordinates on
  `S³`. Conclude by uniqueness of Haar measure.
- **The Haar integral in Euler angles** (`integral_haarProb_eq_setIntegral_eulerBox`). Every
  Haar-integrable function integrates as `(16π²)⁻¹ ∫_box f(euler α β γ) sin β`. Route: the
  previous headline and the change of variables for an image measure. On class functions it
  agrees with `TauCeti.SU2.weyl_integration_formula`, a consistency check that is not part of the
  statement.
- **Haar measure of SO(3)** (`map_pauliRotation_haarProb`). Route: the image of a Haar
  probability measure under a continuous surjective homomorphism of compact groups is the Haar
  probability measure.

**Checks.**

- `eulerMeasure` has total mass `1`: `∫ sin β` over `eulerBox` is `2π · 2 · 4π = 16π²`.
- Its density is nonnegative, since `sin β > 0` on `(0, π)`.
- `∫ |D^1_{00}|² = 1/3`: by the Euler-angle formula it is
  `(16π²)⁻¹ · 2π · 4π · ∫_0^π cos² β sin β dβ = (1/2)(2/3)`.
- `∫ |D^{1/2}_{1/2,-1/2}|² = 1/2`: the integrand is `sin²(β/2) = (1 - cos β)/2`, and
  `(1/2) ∫_0^π (1 - cos β)/2 · sin β dβ = 1/2`.
- Negative control: with Edmonds's SO(3) range `γ ∈ [0, 2π)` the same density has mass `1/2`,
  because the half box covers only one of `±g`.
- Negative control: without the density `sin β` the mass is `8π³/(16π²) = π/2`.

### 1.4 The unitary model

Sources: [E, §4.1, p. 56]; [VK, §6.2.3, pp. 278–279]; [D, §2 (22)–(23), p. 6];
[W, §8.2, Proposition 8.2.1, p. 284].

- **The invariant inner product** (`magneticWeight`, `monomialNorm`, `monomialScale`,
  `unitaryModel`, `continuous_unitaryModel`, `isUnitary_unitaryModel`). The transport
  `unitaryModel d` of `TauCeti.SU2.symPowerModel d` by `monomialScale d` is unitary. Route:
  `isUnitary_unitaryModel` follows from `matrixElement_eq_entrySum` (§2.1), because `entrySum`
  at `g*` is the conjugate of `entrySum` with the indices exchanged.
- **Irreducibility** (`isIrreducible_unitaryModel`), by
  `ContinuousLinearEquiv.isIrreducible_congr` from `TauCeti.SU2.isIrreducible_symPowerModel`.
- **The unitary dual of SU(2)** (`irrepModel`, `isIrrepSkeleton_irrepModel`). The `irrepModel d`
  form a skeleton of the continuous unitary irreducible representations. Route:
  `TauCeti.SU2.existsUnique_nonempty_equiv_symPower`, then the fact that two equivalent unitary
  irreducible representations are unitarily equivalent (Schur).

**Checks.**

- `magneticWeight 1 1 = 1/2`.
- `magneticWeight 2 1 = 0`.
- `magneticWeight d i + magneticWeight d (d - i) = 0` for `i ≤ d`.
- Negative control: with the opposite weight `d/2 - i` (Vilenkin and Klimyk's) in place of
  `magneticWeight`, `matrixElement_euler` fails: `D^{1/2}_{1/2,1/2}(torusExp t) = e^{it}`, and the
  opposite weight predicts `e^{-it}`.
- `monomialNorm 1 i = 1` for both `i`.
- `monomialNorm 2 0 = √2` and `monomialNorm 2 1 = 1`.
- Negative control: for `d = 2` the standard basis of `TauCeti.SU2.symPowerModel` is not
  orthonormal for the invariant product: the matrix `M` of `symPowerModel 2 (eulerMiddleX 0.7)`
  has `‖M*M - 1‖ = 0.68` (Frobenius norm).
- `monomialScale 0` and `monomialScale 1` are the identity.
- `monomialScale 2` multiplies `e₀` and `e₂` by `√2` and fixes `e₁`.
- Negative control: transport by the inverse scaling is not unitary for `d = 2`: at
  `eulerMiddleX 0.7` the transported matrix `M` has `‖M*M - 1‖ = 1.66` (Frobenius norm).
- `unitaryModel 0` is the trivial representation.
- `unitaryModel 1 g` is the matrix of `g` in Edmonds's order `m = 1/2, -1/2`
  (`matrixElement_spinHalf`).
- Negative control: `unitaryModel 2` is unitary while `TauCeti.SU2.symPowerModel 2` is not.
- `(irrepModel d).dim = d + 1`.
- `irrepModel 0` is the trivial one-dimensional model.
- `irrepModel 1` and `irrepModel 2` are inequivalent: their characters at `-1` are `-2` and `3`.
- Negative control: a model built on `TauCeti.SU2.symPowerModel 2` directly fails the unitarity
  field.

## Layer 2: matrix elements and their closed forms

### 2.1 Matrix elements and the entry polynomial

Sources: [E, (4.1.5), p. 54; (4.1.10), p. 55; p. 56]; [VK, §6.3.1, p. 280, (3)];
[D, §2 (24)–(26), p. 6].

- **The matrix element** (`matrixElement`, `matrixElement_eq_conj_matrixCoeff`,
  `unitaryModel_single`). `T(g) e_m = Σ_{m'} D_{m'm}(g) e_{m'}` [E, (4.1.5), p. 54].
- **The explicit polynomial formula** (`entrySum`, `matrixElement_eq_entrySum`). `D` is a
  polynomial in the four entries of `g`, with the coefficients of `entrySum`. It is the binomial
  expansion of the action on monomials, Edmonds's spinor computation [E, p. 56], and
  [VK, §6.3.1, p. 280, (3)] in their indices. Route: expand
  `(g₀₀z₁ + g₁₀z₂)^k (g₀₁z₁ + g₁₁z₂)^{d-k}` and normalize.
- **Spin one half is the defining representation** (`matrixElement_spinHalf`)
  [E, (4.1.13), p. 56].

**Checks.**

- `matrixElement 0 0 0 g = 1`.
- `matrixElement 1 i k g = g (rev i) (rev k)`; for instance `D^{1/2}_{1/2,1/2}(g) = g₀₀`.
- Negative control: `D^{1/2}_{1/2,1/2}(torusExp t) = e^{it}`; the unconjugated matrix coefficient
  `⟪T(g) e_k, e_i⟫` gives `e^{-it}`.
- `entrySum 1 0 0 A = A₁₁`.
- `entrySum 2 1 1 A = A₀₀A₁₁ + A₀₁A₁₀`, which on SU(2) is `|g₀₀|² - |g₀₁|²`, and at
  `euler α β γ` is `cos β`.
- Negative control: `A₀₀A₁₁ - A₀₁A₁₀ = det A = 1` is the wrong sign combination for `D^1_{00}`;
  at `A = [[2, 3], [5, 7]]` the two give `29` and `-1`.

### 2.2 The group law, unitarity and the centre

Sources: [E, §4.2, pp. 59–60]; [M, §5-16, p. 219]; [VK, §6.3.6, p. 287].

- **The group law** (`matrixElement_mul`). `D(gh) = D(g) D(h)` as matrices. Route: homomorphism
  of `unitaryModel`. Its companion `D(1) = 1` (`matrixElement_one`) is a supporting step, proved
  in `Suggested.lean` by `simp`.
- **Unitarity** (`matrixElement_inv`, `sum_conj_matrixElement_mul_matrixElement`,
  `sum_matrixElement_mul_conj_matrixElement`). `D_{m'm}(g⁻¹) = conj D_{mm'}(g)`, and the columns
  and the rows of `D(g)` are orthonormal. Route: `isUnitary_unitaryModel`.
- **The centre** (`matrixElement_torusExp_pi_mul`). `torusExp π = -1` acts by `(-1)^d`; compare
  [E, (4.2.1), p. 59] on `D(π)D(π) ≠ D(0)` for half-integral `j`.
- **The representations of SO(3)** (`exists_unitaryModel_eq_comp_pauliRotation`). For even `d`
  the unitary model factors through the double cover. Route: the kernel of the double cover is
  `{±1}`, on which the model is trivial by `matrixElement_torusExp_pi_mul`, and Tau Ceti's
  topological isomorphism `SU(2)/{±1} ≃ SO(3)`.

**Checks** (the definitions are those of §§1.4 and 2.1):

- The group law at `d = 2`, `i = k = 1`, for `g = eulerMiddle a`, `h = eulerMiddle b`:
  `Σ_μ d^1_{0μ}(a) d^1_{μ0}(b) = -sin a sin b/2 + cos a cos b - sin a sin b/2 = cos(a + b)`,
  which is `d^1_{00}(a + b)`.
- Column unitarity at `d = 2`, `k = 1`: `Σ_{m'} |d^1_{m'0}(β)|² = sin² β/2 + cos² β + sin² β/2 = 1`.
- `matrixElement d i j (torusExp π * g) = (-1)^d matrixElement d i j g` for `d ≤ 5`.
- Negative control: for odd `d` no representation of SO(3) satisfies the conclusion of
  `exists_unitaryModel_eq_comp_pauliRotation`, since `pauliRotation (torusExp π) = 1` while
  `unitaryModel d (torusExp π)` is `-1`.

### 2.3 Matrix elements in Euler angles

Sources: [E, (4.1.12), p. 55; (4.1.15), p. 57]; [VK, §6.3.3, pp. 284–285], in their convention;
[KV, p. 178, (19)]; [W, (8.3.6), p. 291].

- **Edmonds's `d^j`** (`wignerSmallD`), by his finite sum [E, (4.1.15), p. 57], zero when an index
  exceeds `d`.
- **Matrix elements in Euler angles** (`matrixElement_euler`).
  `D^j_{m'm}(euler α β γ) = e^{im'α} d^j_{m'm}(β) e^{imγ}` for all real angles
  [E, (4.1.12), p. 55]. Route: factor, use the diagonal action of `g_α` and `g_γ`, and compare
  `entrySum` at `b_β` with the sum (4.1.15).

**Checks.**

- `wignerSmallD 1` in Edmonds's order is `[[cos(β/2), sin(β/2)], [-sin(β/2), cos(β/2)]]`
  [E, (4.1.13), p. 56].
- `wignerSmallD 2` in Edmonds's order has rows `[(1+cos β)/2, sin β/√2, (1-cos β)/2]`,
  `[-sin β/√2, cos β, sin β/√2]` and `[(1-cos β)/2, -sin β/√2, (1+cos β)/2]` [E, p. 57].
- `wignerSmallD 2 1 1 β = cos β`, and `wignerSmallD d i k (β + 4π) = wignerSmallD d i k β`.
- Negative control: read in Tau Ceti's order `i = 0, 1, 2` without the reversal to Edmonds's
  order, `wignerSmallD 2` differs from Edmonds's printed matrix by `1.11` in the maximum entry at
  `β = 0.9`.
- `D^1_{10}(g) = √2 g₀₀ g₀₁` by `entrySum`, and at `g = euler α β γ` this is
  `e^{iα} sin β/√2 = e^{iα} d^1_{10}(β)`, as `matrixElement_euler` says with `m' = 1`, `m = 0`.

### 2.4 Jacobi and hypergeometric forms

Sources: [E, (4.1.16)–(4.1.23), pp. 57–58]; [KV, p. 178, (19a)]; [D, §2 (33)–(35), p. 7];
[VK, §6.3.4, p. 286]; DLMF 18.5.7, 18.5.8.

- **The Jacobi form** (`jacobi`, `wignerSmallD_eq_jacobi`).
  `d^j_{m'm}(β) = ± √(r!(d-r)!/((r+a)!(r+b)!)) sin(β/2)^a cos(β/2)^b P_r^{(a,b)}(cos β)`, with
  `a = |m' - m|`, `b = |m' + m|`, `r = j - max(|m'|, |m|)` and sign `(-1)^{max(m - m', 0)}`, for
  all real `β`. Edmonds states it for `m' - m ≥ 0`, `m' + m ≥ 0` [E, (4.1.23), p. 58]; the
  absolute-value form holds for all indices by §2.5, and has no factor `i^{m'-m}`. Route: compare
  the sum (4.1.15) with DLMF 18.5.8 at `x = cos β`.
- **The hypergeometric form** (`wignerSmallD_eq_hypergeometric`), from the Jacobi form and
  DLMF 18.5.7, `P_r^{(a,b)}(cos β) = (a+1)_r/r! F(-r, r+a+b+1; a+1; sin²(β/2))`, where
  `r + a + b = d - r` [VK, §6.3.4, p. 286].

**Checks.**

- `jacobi 0 0 2 = (3X² - 1)/2`.
- `(jacobi a b n).eval 1 = C(n + a, n)`; at `(a, b, n) = (1, 0, 1)` it is `2`.
- Negative control: with the roles of `a` and `b` exchanged, `(a, b, n) = (0, 1, 1)` gives
  `(3X + 1)/2` in place of `(3X - 1)/2` (LaguerreJacobi §3.2).
- The Jacobi form at `(j, m', m) = (1, 1, 0)`: `a = b = 1`, `r = 0`, sign `+1`, so
  `d^1_{10}(β) = √2 sin(β/2) cos(β/2) = sin β/√2`; at `(1, 0, 1)` the sign `(-1)^{max(m - m', 0)}`
  is `-1` and gives `d^1_{01}(β) = -sin β/√2`, Edmonds's printed entry.
- The hypergeometric form at `r = 0` is the Jacobi form, since `F(0, ·; ·; ·) = 1`.

### 2.5 Symmetries and special values

Sources: [E, (4.2.1)–(4.2.6), pp. 59–60]; [VK, §6.3.6, pp. 287–288]; [M, §5-16, p. 219].

- **Symmetries** (`wignerSmallD_swap`, `wignerSmallD_reflect`, `wignerSmallD_neg`,
  `wignerSmallD_pi_add`). `d_{m'm} = (-1)^{m'-m} d_{mm'} = (-1)^{m'-m} d_{-m',-m}`,
  `d_{m'm}(-β) = d_{mm'}(β)` and `d_{m'm}(π + β) = (-1)^{j-m'} d_{-m',m}(β)`. Route: the sum
  (4.1.15), or `matrixElement_mul` with `eulerMiddle π`.
- **Values at `0` and `π`** (`wignerSmallD_zero`, `wignerSmallD_pi`). `d_{m'm}(0) = δ_{m'm}` and
  `d_{m'm}(π) = (-1)^{j+m} δ_{m',-m}` [E, (4.2.1), p. 59].

**Checks** (the definition is that of §2.3):

- `wignerSmallD_swap` at `j = 1`: `d^1_{10}(β) = sin β/√2 = (-1)^1 d^1_{01}(β)`.
- `wignerSmallD_pi_add` at `j = m' = m = 1/2`: `d_{1/2,1/2}(π + β) = cos((π + β)/2) = -sin(β/2)`,
  which is `(-1)^0 d_{-1/2,1/2}(β)`.
- `wignerSmallD 1 1 0 π = 1` and `wignerSmallD 1 0 1 π = -1`.
- Negative control: `wignerSmallD 1 1 0 β = sin(β/2)` while `wignerSmallD 1 0 1 β = -sin(β/2)`,
  so `d_{m'm} = d_{mm'}` without the sign fails.

### 2.6 Legendre, Ferrers and Gegenbauer forms

Sources: [E, (4.1.24)–(4.1.26), p. 59; (2.5.10), p. 22]; [KV, p. 178, (20)–(21)];
[D, §2 (36), p. 7]; [VK, §6.3.7, p. 289]; DLMF 14.6.1, 18.7.1, 18.7.9.

- **Legendre polynomials are the zonal matrix elements** (`wignerSmallD_two_mul_self`).
  `D^l_{00}(αβγ) = d^l_{00}(β) = P_l(cos β)` [E, (4.1.26), p. 59; KV, p. 178, (21);
  D, §2 (36), p. 7].
- **Associated Legendre functions** (`wignerSmallD_eq_ferrers`). For `0 ≤ n ≤ l` and all real
  `β`, `d^l_{n0}(β) = √((l-n)!/(l+n)!) sin^n β P_l^{(n)}(cos β)`. This is Edmonds's
  `√((l-n)!/(l+n)!) P_l^n(cos β)` [E, (4.1.24), p. 59] with his Ferrers function
  [E, (2.5.10), p. 22]. In DLMF's normalization (DLMF 14.6.1), with the Condon–Shortley factor,
  it is `(-1)^n √((l-n)!/(l+n)!) P_l^n(cos β)` for `0 ≤ β ≤ π`.
- **The Gegenbauer form.** For `m = 0` the Jacobi parameters are `a = b = |m'|`, and `d^l_{m'0}`
  is `(-1)^{max(-m', 0)} (2n - 1)!! √((l-n)!/(l+n)!) sin^n β C_{l-n}^{(n+1/2)}(cos β)` with
  `n = |m'|`. Route: LaguerreJacobi §6.2 and DLMF 18.7.1.

**Checks** (the definitions are those of §§2.3–2.4):

- `wignerSmallD_two_mul_self` at `l = 2`: `d^2_{00}(β) = (3 cos² β - 1)/2 = P_2(cos β)`.
- `wignerSmallD_eq_ferrers` at `(l, n) = (2, 1)`:
  `d^2_{10}(β) = √(1/6) sin β · 3 cos β = √(3/2) sin β cos β`.
- The Gegenbauer form at `(l, n) = (2, 1)`: `1!! √(1/6) sin β C_1^{(3/2)}(cos β)` with
  `C_1^{(3/2)}(x) = 3x` is the same `√(3/2) sin β cos β`.
- Negative control: `d^1_{10}(β) = sin β/√2`, while the DLMF form without its factor `(-1)^n`
  gives `-sin β/√2`.

### 2.7 The convention of Vilenkin and Klimyk

Sources: [VK, §6.1.1, p. 269; §6.3.3, p. 285, (4)–(5)]; [KV, p. 178, (19)].

- **The two Euler elements** (`eulerMiddleX`, `eulerX`, `eulerX_eq_euler`).
  `eulerX φ θ ψ = euler (φ + π/2) θ (ψ - π/2)`. Route: `a_θ = g_{π/2} b_θ g_{-π/2}`.
- **The conversion** (`matrixElement_eulerX`).
  `D_{m'm}(eulerX φ θ ψ) = i^{m - m'} e^{i(m'φ + mψ)} d_{-m',-m}(θ)` for all real angles. With
  `t^{VK}_{mn} = D_{-m,-n}`, this is Vilenkin and Klimyk's
  `t^{VK}_{mn}(u) = i^{m-n} e^{-i(mφ+nψ)} P^l_{mn}(cos θ)` [VK, §6.3.3, p. 285, (4)–(5);
  KV, p. 178, (19)] with `P^l_{mn}(cos θ) = d^l_{mn}(θ)`. Their `P^l_{mn}` excludes the factor
  `i^{m-n}`, so it is real for real `θ`; Vilenkin's 1968 book has that factor inside `P^l_{mn}`
  [VK, §6.3.3, p. 285, (4) and footnote 1]. Route: `eulerX_eq_euler` and
  `matrixElement_euler`; the phases `e^{∓iπ/4 · 2m}` give `i^{m-n}`.

**Checks.**

- `eulerMiddleX 0 = 1`.
- `eulerMiddleX θ = torusExp (π/4) * eulerMiddle θ * torusExp (-π/4)`.
- Negative control: `eulerMiddleX (2π) = -1`, not `1`.
- `eulerX 0 0 0 = 1`.
- `matrixElement_eulerX` at `d = 1` reproduces `eulerX φ θ ψ` in the order `m = 1/2, -1/2`.
- Negative control: the formula without the factor `i^{m-m'}` fails, by `1.73` in the maximum
  entry over `d ≤ 5` at `(φ, θ, ψ) = (2.0, 3.9, 0.4)`.

## Layer 3: identities from the group law

### 3.1 Addition theorems

Sources: [D, §2, p. 7]; [VK, §6.6.1, p. 326; §6.6.2, p. 327]; [E, (4.6.6), p. 63].

- **The angle of a product** (`cos_of_euler_mul`). If
  `eulerMiddle β₁ * euler α₂ β₂ 0 = euler α β γ`, then
  `cos β = cos β₁ cos β₂ - sin β₁ sin β₂ cos α₂` [D, §2, p. 7]. Route: `cos β = 2|g₀₀|² - 1`.
- **The addition theorem for `d^j`** (`wignerSmallD_addition`). Under the same hypothesis,
  `e^{i(m'α + mγ)} d_{m'm}(β) = Σ_μ e^{iμα₂} d_{m'μ}(β₁) d_{μm}(β₂)` [VK, §6.6.1, p. 326], in
  their convention. Route: `matrixElement_mul` and `matrixElement_euler`.
- **The Legendre addition theorem** (`legendre_addition`).
  `P_l(cos β₁ cos β₂ - sin β₁ sin β₂ cos α) = Σ_m (-1)^m cos(mα) d^l_{m0}(β₁) d^l_{m0}(β₂)` for all
  real angles [VK, §6.6.2, p. 327]. Route: `m' = m = 0` in the addition theorem and
  `d_{0m} = (-1)^m d_{m0}`. The sign `-` in the argument corresponds to `b_β`; the more common
  form with `+` [E, (4.6.6), p. 63] is the substitution `α ↦ α + π`. In Ferrers functions, on
  `[0, π]`, this is the addition theorem of SpecialFunctionsLegendre §2.5, which owns that form;
  this headline is its form in the matrix elements, for all real angles, used in §§3.2 and 6.3.

**Checks** (the definitions are those of Layers 1 and 2):

- `wignerSmallD_addition` at `d = 1`, `m' = m = 1/2` is the `(0, 0)` entry of
  `eulerMiddle β₁ * euler α₂ β₂ 0`:
  `e^{i(α+γ)/2} cos(β/2) = e^{iα₂/2} cos(β₁/2) cos(β₂/2) - e^{-iα₂/2} sin(β₁/2) sin(β₂/2)`.
- At `l = 1` the Legendre addition theorem is the spherical law of cosines
  `cos β = cos β₁ cos β₂ - sin β₁ sin β₂ cos α`.
- Negative control: with `+ sin β₁ sin β₂ cos α` the case `l = 1` fails at `α = 0`, where the
  right side is `cos(β₁ + β₂)`.

### 3.2 The product formula and the functional equation

Sources: [VK, §6.6.3 (10), p. 329]; [W, (8.3.9), p. 292].

- **The product formula** (`legendre_product`).
  `P_l(cos θ₁) P_l(cos θ₂) = π⁻¹ ∫_0^π P_l(cos θ₁ cos θ₂ - sin θ₁ sin θ₂ cos φ) dφ` for all real
  angles [VK, §6.6.3 (10), p. 329]. Route: integrate the Legendre addition theorem over
  `α ∈ [0, π]`; only `m = 0` survives.
- **The functional equation of the zonal function**
  (`integral_matrixElement_mul_torusExp_mul`).
  `(2π)⁻¹ ∫_0^{2π} D^l_{00}(g · torusExp t · h) dt = D^l_{00}(g) D^l_{00}(h)`. Route: expand by
  `matrixElement_mul`; `torusExp t` acts on `e_μ` by `e^{2iμt}`, whose average vanishes for
  `μ ≠ 0`.

**Checks.**

- `legendre_product` at `l = 1`:
  `π⁻¹ ∫_0^π (cos θ₁ cos θ₂ - sin θ₁ sin θ₂ cos φ) dφ = cos θ₁ cos θ₂`.
- The functional equation at `l = 1`, `g = h = eulerMiddle (π/2)`: the integrand
  `D^1_{00}(g · torusExp t · h)` is `-cos 2t`, whose average is `0 = D^1_{00}(g) D^1_{00}(h)`.
- Negative control: without the average over `t`, `D^1_{00}(gh) = D^1_{00}(g) D^1_{00}(h)` fails:
  at `g = h = eulerMiddle (π/2)` the left side is `cos π = -1` and the right side is `0`.

### 3.3 Orthogonality

Sources: [E, (4.6.1), p. 62]; [VK, §6.10.1, pp. 364–365]; [W, (8.3.7)–(8.3.8), p. 292].

- **Schur orthogonality in coordinates** (`integral_matrixElement_mul_conj`).
  `∫ D^j_{m'm} conj D^{j'}_{n'n} = δ_{jj'} δ_{m'n'} δ_{mn} / (2j+1)` [E, (4.6.1), p. 62].
  Route: `ContRepresentation.schur_orthogonality` with `isIrrepSkeleton_irrepModel`.
- **Orthogonality of `d^j_{m'm}` for fixed `(m', m)`** (`integral_wignerSmallD_mul_wignerSmallD`).
  `∫_0^π d^j_{m'm} d^{j'}_{m'm} sin β dβ = 2/(2j+1) δ_{jj'}`. Route: the previous headline with
  `integral_haarProb_eq_setIntegral_eulerBox`; the `α` and `γ` integrals give `8π²`.
- **Jacobi orthogonality for integral parameters.** For integers `a, b, r, r' ≥ 0`, the integral
  `∫_{-1}^1 P_r^{(a,b)} P_{r'}^{(a,b)} (1-z)^a (1+z)^b dz` is
  `2^{a+b+1}/(2r+a+b+1) · (r+a)!(r+b)!/(r!(r+a+b)!) · δ_{rr'}`, the norm of LaguerreJacobi §4.3
  at integral parameters [E, (4.1.22), p. 58]. Route: substitute the Jacobi
  form (§2.4) with `z = cos β` in `integral_wignerSmallD_mul_wignerSmallD` at `d = 2r + a + b`,
  `d' = 2r' + a + b`; the constants `r!(d-r)!/((r+a)!(r+b)!)` and `2^{-a-b}` turn `2/(d+1)` into
  the value above. It is a consistency check on the constants of `wignerSmallD_eq_jacobi`.

**Checks.**

- `integral_wignerSmallD_mul_wignerSmallD` at `m' = m = 0`, `(j, j') = (1, 1)`:
  `∫_0^π cos² β sin β dβ = 2/3 = 2/(2j + 1)`; at `(j, j') = (1, 2)`:
  `∫_0^π cos β (3 cos² β - 1)/2 · sin β dβ = 0`.
- `∫ |D^1_{00}|² = 1/3` (§1.3).
- Jacobi orthogonality at `(a, b, r) = (1, 0, 1)`: `P_1^{(1,0)} = (3z + 1)/2` and
  `∫_{-1}^1 ((3z + 1)/2)² (1 - z) dz = 1 = 2²/4 · 2! 1!/(1! 2!)`.
- Negative control: without the weight `sin β`, `∫_0^π (d^1_{00})² dβ = ∫_0^π cos² β dβ = π/2`,
  not `2/3`.

### 3.4 Plancherel on SU(2)

Sources: [VK, §6.10.2 (1)–(4), pp. 366–367]; [W, §8.6, (8.6.1), p. 301].

- **Plancherel** (`hasSum_plancherel`). For `f ∈ L²(SU(2))`,
  `∫ |f|² = Σ_{j,m',m} (2j+1) |∫ f conj D^j_{m'm}|²` [VK, §6.10.2, pp. 366–367]. Route:
  `TauCeti.peterWeylBasis` for the skeleton `irrepModel` and `TauCeti.coe_peterWeylBasis`. The
  Peter–Weyl basis vector at `(a, b)` is `√(d+1)` times the coefficient `g ↦ ⟪π g e_a, e_b⟫`,
  which is `√(d+1) conj D_{ba}` (Conventions). Parseval for `conj f`, whose norm is that of `f`,
  then gives `Σ (d+1) |∫ f conj D_{ba}|²`, and the transposition `(a, b) ↦ (b, a)` of the index
  set gives the stated sum. Equivalently, `conj D_{m'm} = (-1)^{m'-m} D_{-m',-m}` (§§2.3, 2.5)
  permutes the index set in Parseval for `f`.
- **Expansion of class functions in characters.** A continuous class function is the `L²` limit
  of `Σ_j (∫ f conj χ_j) χ_j`. Route: Plancherel restricted to class functions, or
  `TauCeti.SU2.weyl_integration_formula` and the completeness of `U_{2j}` on `[0, π]` with weight
  `sin²`.

**Checks.**

- For `f = D^1_{00}`, the only nonzero term is `(d, i, k) = (2, 1, 1)`, with value
  `3 · (1/3)² = 1/3 = ∫ |f|²`.
- For `f = 1`, the only nonzero term is `d = 0`, with value `1`.
- Negative control: without the factor `2j + 1`, the case `f = D^1_{00}` gives `1/9 ≠ 1/3`.

## Layer 4: the Lie-algebra action

### 4.1 Infinitesimal operators and the Casimir

Sources: [E, (2.3.16), p. 17; (4.1.6)–(4.1.9), pp. 54–55]; [VK, §6.2.2, p. 277];
[W, (8.4.9)–(8.4.11), p. 297]; [M, §5-16, (5.136)–(5.138), pp. 215–216].

- **The infinitesimal operators** (`lieMatrixX`, `lieMatrixY`, `lieMatrixZ`,
  `hasDerivAt_matrixElement_mul_eulerMiddleX`, `hasDerivAt_matrixElement_mul_eulerMiddle`,
  `hasDerivAt_matrixElement_mul_torusExp`). Along `eulerMiddleX t = exp(itJ_x)`,
  `eulerMiddle t = exp(itJ_y)` and `torusExp (t/2) = exp(itJ_z)`, the right derivatives of `D(g)`
  at `t = 0` are `D(g)` times `i J_x`, `i J_y` and `i J_z`, the three matrices in the basis
  `e_i`. Route: differentiate `entrySum`, or Tau Ceti's differential of `Sym^d`.
- **Commutation relations** (`commutator_lieMatrixX_lieMatrixY`,
  `commutator_lieMatrixY_lieMatrixZ`, `commutator_lieMatrixZ_lieMatrixX`).
  `[iJ_x, iJ_y] = -iJ_z` cyclically.
- **The Casimir** (`casimir_lieMatrix`). `(iJ_x)² + (iJ_y)² + (iJ_z)² = -j(j+1)`.
- **The raising and lowering operators.** `-i(lieMatrixX + i lieMatrixY) = J_x + iJ_y` sends
  `e_m` to `√((j-m)(j+m+1)) e_{m+1}`, the action of Edmonds's `J₊` [E, (2.3.16), p. 17]. Route:
  read off the matrices.

**Checks.**

- `lieMatrixX 1 = (i/2)[[0, 1], [1, 0]]`.
- `lieMatrixX d` is skew-Hermitian.
- Negative control: `lieMatrixX 1` is the derivative at `t = 0` of
  `eulerMiddleX t = [[cos(t/2), i sin(t/2)], [i sin(t/2), cos(t/2)]]`; the version without the
  factor `i`, `(1/2)[[0, 1], [1, 0]]`, is Hermitian and is not that derivative.
- `lieMatrixY 1 = [[0, -1/2], [1/2, 0]]`; in Edmonds's order this is `[[0, 1/2], [-1/2, 0]]`, the
  derivative of `eulerMiddle` at `0`.
- `lieMatrixY d` is real and skew-symmetric.
- Negative control: swapping the two off-diagonal signs gives `[iJ_x, iJ_y] = +iJ_z`, which
  contradicts the derivative check.
- `lieMatrixZ 1 = diag(-i/2, i/2)`, which is `diag(i m)` for `m = -1/2, 1/2`.
- `lieMatrixZ d` has trace `0`.
- Negative control: with the opposite weight the diagonal would be `diag(i/2, -i/2)`, the
  derivative of `D(torusExp (-t/2))`.
- At `d = 1` each of `(iJ_x)²`, `(iJ_y)²`, `(iJ_z)²` is `-1/4`, so the Casimir is
  `-3/4 = -j(j+1)` for `j = 1/2`.

### 4.2 Differential equation, recurrence and generating function

Sources: [E, (4.1.14), p. 57; (2.5.9), p. 22]; [VK, §6.7.1, p. 331; §6.7.2, pp. 334–335;
§6.7.5, p. 341]; [W, (8.4.10)–(8.4.12), p. 297].

- **The differential equation** (`wignerSmallD_ode`).
  `d'' + cot β d' - (m'² + m² - 2m'm cos β)/sin² β d = -j(j+1) d` on `(0, π)`. Route: the Casimir
  applied to `D(euler α β γ)`. For `m = 0` it is Legendre's associated equation in `cos β`
  [E, (2.5.9), p. 22]; also [VK, §6.7.5, p. 341] and [W, (8.4.12), p. 297].
- **The first-order recurrence in the column index** (`hasDerivAt_wignerSmallD`).
  `d/dβ d_{m'm} = ½ (√((j-m)(j+m+1)) d_{m',m+1} - √((j+m)(j-m+1)) d_{m',m-1})` for all real `β`.
  Route: `hasDerivAt_matrixElement_mul_eulerMiddle` at `g = eulerMiddle β`. Also
  [VK, §6.7.2, pp. 334–335] and [W, (8.4.10)–(8.4.11), p. 297].
- **The generating function** (`wignerSmallD_generatingFunction`), Edmonds's spinor identity
  [E, (4.1.14), p. 57] at `x₋ = 1`, `x₊ = w`; also [VK, §6.7.1, p. 331].

**Checks** (the definition is that of §2.3):

- `wignerSmallD_ode` at `j = 1`, `(m', m) = (1, 0)`: for `d = sin β/√2`,
  `d'' + cot β d' - d/sin² β = (-sin² β + cos² β - 1)/(√2 sin β) = -2 sin β/√2`.
- `hasDerivAt_wignerSmallD` at `j = 1/2`, `(m', m) = (1/2, -1/2)`: the derivative of
  `d_{1/2,-1/2} = sin(β/2)` is `cos(β/2)/2 = ½ · 1 · d_{1/2,1/2}`.
- Negative control: at `d = 2`, `i = k = 1` (so `d^1_{00} = cos β`), dropping `cot β d'` leaves
  `-cos β` in place of `-2 cos β`.

### 4.3 The Casimir in Euler angles

Sources: [VK, §6.10.3, pp. 370–372]; [W, (8.4.12), p. 297].

- **Fields and Casimirs** (`rightField`, `leftField`, `rightCasimir`, `leftCasimir`).
  `rightField Y f g` and `leftField Y f g` are the derivatives of `f` at `t = 0` along
  `g * Y t` and `Y t * g`. `rightCasimir` and `leftCasimir` sum the squares of these fields over
  `eulerMiddleX`, `eulerMiddle` and `torusExp (t/2)`; they are the Casimirs of the right and left
  regular representations, in the normalization of `casimir_lieMatrix`.
- **The Laplacian in Euler angles** (`eulerLaplacian`, `rightCasimir_euler`,
  `leftCasimir_euler`). `eulerLaplacian` is
  `∂²_β + cot β ∂_β + sin⁻²β (∂²_α - 2 cos β ∂_α ∂_γ + ∂²_γ)`. On the chart `0 < β < π`, for `f`
  whose pullback by `euler` is `C²` there, both Casimirs of `f` at `euler α β γ` equal
  `eulerLaplacian` of the pullback [VK, §6.10.3, pp. 370–372], in their convention. Route: write the
  three fields in Euler angles by solving `g Y = Σ c_i ∂_i g` (right) and `Y g = Σ c_i ∂_i g`
  (left), then square and add.
- **Matrix elements are Casimir eigenfunctions** (`rightCasimir_matrixElement`,
  `leftCasimir_matrixElement`, `eulerLaplacian_matrixElement`). `D^j_{m'm}` is an eigenfunction
  of `rightCasimir` and `leftCasimir` on all of SU(2), and of `eulerLaplacian` on the chart, with
  eigenvalue `-j(j+1)`. Route: the right Casimir from §4.1; the left Casimir by
  `matrixElement_inv`; the coordinate form from `rightCasimir_euler`, or from `wignerSmallD_ode`.

**Checks.**

- `rightField (fun t ↦ torusExp (t/2)) (matrixElement d i k)` is `i m` times
  `matrixElement d i k`.
- `rightField eulerMiddle` applied to `g ↦ g₀₀` gives `-g₀₁/2`, the `(0, 0)` entry of
  `g · [[0, 1/2], [-1/2, 0]]`.
- Negative control: on `g ↦ g₀₀` the field `leftField eulerMiddle` gives `g₁₀/2`, not `-g₀₁/2`;
  at `g = euler 0.3 1.1 0.5` these are `-0.260 - 0.026i` and `-0.260 + 0.026i`.
- `leftField Y f g = rightField Y f g` when `f` is a class function.
- `leftField (fun t ↦ torusExp (t/2)) (matrixElement d i k)` is `i m'` times
  `matrixElement d i k`.
- Negative control: `leftField` is the derivative along `Y t * g`; the differential of the left
  regular representation is along `Y (-t) * g`, which has the opposite sign, and the sign cancels
  in `leftCasimir`.
- `rightCasimir` of a constant is `0`.
- `rightCasimir` of each entry of `D^{1/2}` is `-3/4` times that entry.
- Negative control: `rightCasimir` built from `torusExp t` in place of `torusExp (t/2)` gives
  `-1/4 - 1/4 - 1 = -3/2` instead of `-3/4` on `g ↦ g₀₀`, because `torusExp t` is
  `exp(2itJ_z)`.
- `leftCasimir` of a constant is `0`.
- `leftCasimir` equals `rightCasimir` on every `D^j_{m'm}`, `d ≤ 2`, with eigenvalue `-j(j+1)`.
- Negative control: `leftCasimir` without the torus term gives `-1/2` instead of `-3/4` on
  `g ↦ g₀₀`.
- `eulerLaplacian` sends each of the nine entries `e^{im'α} d^1_{m'm}(β) e^{imγ}` of `D^1` to
  `-2` times itself.
- `eulerLaplacian` sends each entry of `euler α β γ` (that is, `D^{1/2}`) to `-3/4` times itself.
- Negative control: with `+2 cos β ∂_α ∂_γ` in place of `-2 cos β ∂_α ∂_γ` the entry `D^1_{11}`
  is no longer an eigenfunction; the residual is `-(1 + 2 cos β + cos 2β) e^{i(α+γ)}/sin² β`,
  which is `-1.66` at `β = 1.1`, `α = γ = 0`.

## Layer 5: characters and the column index

### 5.1 Characters

Sources: [VK, §6.9.2, p. 358; §6.9.3, p. 360]; [KV, p. 179, (22)]; [W, Ch. 8].

- **The trace of `D^j` is the character** (`sum_matrixElement_self`). `Σ_m D^j_{mm}` is Tau
  Ceti's character of `TauCeti.SU2.symPower d`. Route: the trace is invariant under the
  transport by `monomialScale`.
- **Characters are Chebyshev polynomials** (`sum_matrixElement_self_eq_chebyshevU`).
  `χ_j(g) = U_{2j}(tr g / 2)`. Route: `TauCeti.SU2.character_symPower_eq_chebyshevU_eval`.
- **The character in Euler angles** (`sum_matrixElement_self_euler`).
  `χ_j = U_{2j}(cos(β/2) cos((α+γ)/2))` [VK, §6.9.3, p. 360; KV, p. 179, (22)]. Route: the trace
  of `coe_euler`.

**Checks** (the definitions are those of §§1.4 and 2.1):

- The characters at `-1` are `(-1)^d (d + 1)`: `1, -2, 3, -4` for `d = 0, …, 3`.
- `sum_matrixElement_self_euler` at `d = 2`: `χ_1 = U_2(x) = 4x² - 1` with
  `x = cos(β/2) cos((α+γ)/2)`, which is `3` at the identity.
- Negative control: with Chebyshev polynomials of the first kind, `T_1(tr g / 2) = tr g / 2` is
  half the character `tr g` of `D^{1/2}`.

### 5.2 Krawtchouk polynomials

Sources: [VK, §6.8.1, pp. 346–348]; DLMF 18.20.6 and Table 18.19.1.

- **The Krawtchouk polynomial** (`krawtchouk`). `K_s(x; p, N) = F(-s, -x; -N; 1/p)` as a
  terminating sum (DLMF 18.20.6).
- **Matrix elements as Krawtchouk polynomials of the column index** (`wignerSmallD_eq_krawtchouk`)
  [VK, §6.8.1, pp. 346–347], in their convention. Route: the sum (4.1.15) and the Krawtchouk sum.
- **Krawtchouk orthogonality from unitarity** (`krawtchouk_orthogonal`), for `0 < p < 1`
  [VK, §6.8.1, p. 348; DLMF Table 18.19.1]. Route: the column unitarity of §2.2 at `eulerMiddle β`
  with `p = sin²(β/2)`.

**Checks.**

- `krawtchouk N 0 p x = 1`.
- `krawtchouk N 1 p x = 1 - x/(Np)`; at `N = 3`, `p = 0.3`, `x = 2` it is `-11/9`.
- `krawtchouk 1 1 (1/2) 1 = -1`.
- `wignerSmallD_eq_krawtchouk` at `d = 2`, `i = k = 1`: with `s = sin(β/2)`, `c = cos(β/2)`,
  the right side is `-2 s² c² (1 - 1/(2s²)) = c² cos β`, the left side `d^1_{00}(β) c²`.
- `krawtchouk_orthogonal` at `N = s = q = 1`: `(1 - p) · 1 + p (1 - 1/p)² = (1 - p)/p`, which is
  `7/3` at `p = 0.3`.
- Comparison with the library's coding-theory normalization: for integers `q ≥ 2` and
  `s, x ≤ N`, `TauCeti.krawtchouk q N s x = C(N, s) (q - 1)^s K_s(x; (q - 1)/q, N)`; at
  `(q, N, s, x) = (2, 3, 1, 2)` both sides are `-1`, since `K_1(2; 1/2, 3) = -1/3`.
- Negative control for that comparison: at `(q, N, s, x) = (3, 3, 1, 1)` the library value is
  `3 = 3 · 2 · K_1(1; 2/3, 3)`, while the parameter `p = 1/q` gives `3 · 2 · K_1(1; 1/3, 3) = 0`.
- Negative control: at `p = 2` the formal identity still holds, but the weights
  `C(N,x) p^x (1-p)^{N-x}` change sign and the "norm" `(1-p)/p` is `-1/2`; the orthogonality is a
  statement about a measure only for `0 < p < 1`.

## Layer 6: the sphere and the Gel'fand pair

### 6.1 Spherical harmonics as matrix elements

Sources: [E, (4.1.25), p. 59; (2.5.5)–(2.5.6), p. 21; (2.5.29)–(2.5.30), p. 24];
[VK, §6.3.11, p. 297]; [KV, p. 178, (20)–(21)]; [D, §7, p. 21]; DLMF 14.30.1.

- **Points of the sphere** (`spherePoint`, `orbitPoint`). `spherePoint θ φ` has polar angle `θ`
  and azimuth `φ`; `orbitPoint g = R(g) e₃`, and `orbitPoint (euler α β γ) = spherePoint β (π - α)`.
- **The spherical harmonic** (`sphericalHarmonic`), DLMF's `Y_l^m` [DLMF 14.30.1], which equals
  Edmonds's `Y_{lm}` [E, (2.5.29), p. 24], as a polynomial on `ℝ³`; the rotation law below needs
  it on `ℝ³`.
- **Comparison with the spherical harmonics of SpecialFunctionsLegendre.** For `0 ≤ θ ≤ π`, real
  `φ` and `i ≤ 2l`, `sphericalHarmonic l i (spherePoint θ φ)` equals the spherical harmonic
  `Y_{l,i-l}(θ, φ)` of SpecialFunctionsLegendre §3.1. Route: at `spherePoint θ φ`,
  `x₁ ± i x₂ = sin θ e^{±iφ}`; for `m = i - l ≥ 0`, `(-1)^m sin^m θ P_l^{(m)}(cos θ)` is the
  Ferrers function `𝖯^m_l(cos θ)` of DLMF 14.6.1 when `sin θ ≥ 0`, and for `m < 0` DLMF 14.9.3
  turns `𝖯^m_l` into `𝖯^{|m|}_l`, absorbing the ratio of the factorials.
- **Columns and rows of `D^l` are spherical harmonics** (`matrixElement_euler_column`,
  `matrixElement_euler_row`). `D^l_{m0}(αβγ) = (-1)^m √(4π/(2l+1)) Y_l^m(β, α)` and
  `D^l_{0m}(αβγ) = √(4π/(2l+1)) Y_l^m(β, γ)` [E, (4.1.25), p. 59]. Route:
  `wignerSmallD_eq_ferrers`, `wignerSmallD_swap` and `matrixElement_euler`.
- **The orbit of the north pole** (`sphericalHarmonic_orbitPoint`).
  `Y_l^m(R(g) e₃) = √((2l+1)/(4π)) conj D^l_{m0}(g)`. Route: `exists_euler_eq` and the column
  formula, with `orbitPoint (euler α β γ) = spherePoint β (π - α)`.
- **The rotation law** (`sphericalHarmonic_rotation`). For unit `x`,
  `Y_l^m(R(g)⁻¹ x) = Σ_{m'} D^l_{m'm}(g) Y_l^{m'}(x)`. Route: write `x = R(h) e₃`, then the orbit
  formula and `matrixElement_mul`.

**Checks.**

- `spherePoint 0 φ = e₃`.
- `spherePoint θ φ` has norm `1`.
- `spherePoint (π/2) 0 = e₁`.
- Negative control: `spherePoint θ φ = spherePoint (-θ) (φ + π)`, so the polar angle must be
  restricted to `[0, π]` for a chart.
- `orbitPoint 1 = e₃`.
- `orbitPoint (g * torusExp t) = orbitPoint g`.
- `orbitPoint (euler 0.7 1.1 (-2.3)) = spherePoint 1.1 (π - 0.7) = (-0.6816, 0.5741, 0.4536)`.
- Negative control: `orbitPoint (euler α β γ)` is not `spherePoint β α`; at `(0.7, 1.1, -2.3)`
  that point is `(0.6816, 0.5741, 0.4536)`.
- `sphericalHarmonic 0 0 x = 1/√(4π)`.
- `sphericalHarmonic 1 1 x = √(3/(4π)) x₃`.
- `sphericalHarmonic 1 2 x = -√(3/(8π)) (x₁ + i x₂)`.
- The comparison at `(l, i) = (1, 2)` and `(θ, φ) = (π/2, 0)`: both sides are
  `-√(3/(8π)) = -0.34549`.
- Negative control for the range of `θ`: at `θ = -π/2`, `φ = 0.3`,
  `sphericalHarmonic 1 2 (spherePoint θ φ) = √(3/(8π)) e^{0.3i} = 0.33006 + 0.10210i`, while
  `Y_{1,1}(θ, φ)` of SpecialFunctionsLegendre is its negative, since its Ferrers factor sees only
  `|sin θ|`.
- Negative control: without the Condon–Shortley phase, `Y_1^1 = +√(3/(8π)) (x₁ + i x₂)`, and
  `matrixElement_euler_column` fails by a sign.
- Negative control: off the unit sphere the rotation law fails for `l = 2`, because
  `sphericalHarmonic 2 2 x = √(5/(16π)) (3x₃² - 1)` is not homogeneous.

### 6.2 Laplacians

Sources: [E, p. 21; (2.5.9), p. 22]; [VK, §6.10.3 (9), p. 372].

- **The Laplace–Beltrami operator of `S²`** (`sphereLaplacian`), in polar coordinates
  `∂²_θ + cot θ ∂_θ + sin⁻² θ ∂²_φ`. It is `-ħ⁻²` times the operator `L²` of DLMF 14.30.12 used
  in SpecialFunctionsLegendre §3.3.
- **The Laplacian of SU(2) and that of `S²`** (`eulerLaplacian_sphere`). On functions independent
  of `γ`, `eulerLaplacian` is `sphereLaplacian` in the polar coordinates `(θ, φ) = (β, α)`.
  Route: the `γ`-derivatives vanish; this is a supporting step, which closes by unfolding.

The eigen-equation `sphereLaplacian Y = -l(l+1) Y` for the spherical harmonics of degree `l`
[E, (2.5.9), p. 22], and the harmonicity of the solid harmonics `ρ^l Y_{l,m}`, belong to
SpecialFunctionsLegendre §3.3 (its angular momentum and harmonic polynomial headlines). On the
group side, `eulerLaplacian_matrixElement` (§4.3) for the column `D^l_{m0}` is their lift to
SU(2): with `eulerLaplacian_sphere`, `matrixElement_euler_column` and the comparison of §6.1 it
gives a proof of the eigen-equation from the Casimir.

**Checks.**

- `sphereLaplacian` sends `sin θ e^{iφ}` to `(-sin² θ + cos² θ - 1)/sin θ · e^{iφ}`, which is
  `-2 sin θ e^{iφ}`.
- `sphereLaplacian` of a function of `φ` alone is `sin⁻²θ` times its second derivative.
- Negative control: `sphereLaplacian` without the term `cot θ ∂_θ` sends `cos θ = √(4π/3) Y_1^0`
  to `-cos θ` instead of `-2 cos θ`.

### 6.3 Harmonic analysis on the sphere

Sources: [E, (4.6.6)–(4.6.7), p. 63]; [VK, §6.10.2 (9)–(10), p. 367]; [W, Ch. 8]; DLMF 14.30.8,
14.30.9.

SpecialFunctionsLegendre owns the orthonormality and the addition theorem of the spherical
harmonics (its §3.2; DLMF 14.30.8, 14.30.9) and their completeness in `L²` of the sphere (its
§3.3), in the polar coordinates with the weight `sin θ`. RiemannianGeometry R8.2 owns the
completeness of the restricted harmonic polynomials on spheres, which at `m = 2` is the density
half of that completeness. Here the polar coordinates are compared with the surface measure
`toSphere`, and the group acts on these spaces.

- **The surface measure in polar coordinates** (`lintegral_toSphere_eq_setLIntegral_spherePoint`,
  `integral_toSphere_eq_setIntegral_spherePoint`). For measurable `F : ℝ³ → [0, ∞]`,
  `∫⁻ F d(toSphere) = ∫⁻_{(0, π) × (0, 2π)} F(spherePoint θ φ) sin θ dθ dφ`, and the same holds
  for the Bochner integral of a complex `F` integrable on the sphere for `toSphere`. So the
  complement in `S²` of the image of `(0, π) × (0, 2π)` is `toSphere`-null, and
  `F ↦ F ∘ spherePoint` is a unitary map from `L²(S²)` onto `L²((0, π) × (0, 2π), sin θ dθ dφ)`.
  Route: `toSphere s = 3 · vol(Ioo 0 1 • s)` (the definition of `toSphere`), and the change of
  variables `(r, θ, φ) ↦ r · spherePoint θ φ` on `(0, 1) × (0, π) × (0, 2π)`, injective with
  Jacobian `r² sin θ` and with a null complement of its image in the punctured ball
  (`MeasureTheory.lintegral_image_eq_lintegral_abs_det_fderiv_mul` and
  `MeasureTheory.integral_image_eq_integral_abs_det_fderiv_smul`), with `∫_0^1 r² dr = 1/3`.
- **The irreducible pieces.** For each `l`, the span `H_l` of the restrictions to the unit sphere
  of the `sphericalHarmonic l i`, `i ≤ 2l`, is invariant under `f ↦ f ∘ R(g)⁻¹`, and as a
  representation of SU(2) it is equivalent to `unitaryModel (2l)`: irreducible, of dimension
  `2l + 1`, and factoring through SO(3). Route: by `sphericalHarmonic_rotation` the operator of `g`
  has the matrix `D^l(g)` in the spanning family; the family is orthonormal in `L²(S²)`, hence
  linearly independent, by the comparison of §6.1, the unitary map of the first headline and the
  orthonormality of SpecialFunctionsLegendre §3.2; then
  `isIrreducible_unitaryModel` and `exists_unitaryModel_eq_comp_pauliRotation`.
- **The decomposition of `L²(S²)` into irreducibles.** `L²(S²)` is the Hilbert direct sum of the
  `H_l`, `l ≥ 0`, each irreducible of dimension `2l + 1`, so each irreducible representation of
  SO(3) occurs exactly once. Route: the previous headline, and the Hilbert basis of
  SpecialFunctionsLegendre §3.3 (orthonormality from its §3.2), carried to `L²(S²)` by the unitary
  map of the first headline and the comparison of §6.1.

The group gives proofs of the results owned by SpecialFunctionsLegendre: orthonormality is Schur
orthogonality (§3.3) pushed forward by `orbitPoint`; completeness is Plancherel on SU(2) (§3.4)
applied to `f ∘ orbitPoint`, which is right invariant under the torus and hence orthogonal to
every column `m ≠ 0`; and the addition theorem
`Σ_m Y_l^m(x) conj Y_l^m(y) = (2l+1)/(4π) P_l(x · y)` for unit `x, y` [E, (4.6.6)–(4.6.7), p. 63]
is `legendre_addition` in the form `D^l_{00}(g⁻¹h) = Σ_m conj D^l_{m0}(g) D^l_{m0}(h)`, with
`sphericalHarmonic_orbitPoint`.

**Checks** (the definitions are those of §6.1):

- `F = 1`: both sides of `lintegral_toSphere_eq_setLIntegral_spherePoint` are `4π`; on the left
  `toSphere univ = 3 · vol(ball 0 1) = 3 · 4π/3`, on the right `2π ∫_0^π sin θ dθ = 4π`.
- `F = x₃²`: both sides are `4π/3`, the right one `2π ∫_0^π cos² θ sin θ dθ = 2π · 2/3`.
- Negative control: without the weight `sin θ` the right side at `F = 1` is `2π² = 19.739`, not
  `4π = 12.566`.
- `H_0` is spanned by the constant `1/√(4π)`, and `H_1` by the restrictions of `x₃` and
  `x₁ ± i x₂`, the linear forms, of dimension `3`.
- The rotation law at `l = 1`, `i = 2`, `g = torusExp t`: `R(g)⁻¹ = R_z(2t)` multiplies
  `x₁ + i x₂` by `e^{2it}`, and `D^1_{11}(torusExp t) = e^{2it}`.
- Negative control: with `R(g)` in place of `R(g)⁻¹` the same case gives the factor `e^{-2it}`,
  so `f ↦ f ∘ R(g)` does not have the matrix `D^l(g)`.
- At `x = y` and `l = 1` the addition theorem gives `Σ_m |Y_1^m|² = 3/(4π)`; each term is a
  squared modulus, so it does not detect the Condon–Shortley phase, while the column formula of
  §6.1 does.

### 6.4 The Gel'fand pair (SU(2), T)

Sources: [D, §§6–7, pp. 18–21]; [W, Ch. 8]; [VK, §6.3.11, p. 297].

- **Convolution** (`convolution`), for the normalized Haar measure.
- **Gel'fand's criterion** (`exists_torus_mul_mul_eq_inv`). Every `g⁻¹` lies in `T g T`. Route:
  for `g = euler α β γ` take `k₁ = g_{-γ} D g_{-α}` and `k₂ = g_{-γ} D⁻¹ g_{-α}` with
  `D = diag(i, -i)`, since `D b_β D⁻¹ = b_{-β}`.
- **The commutative algebra** (`convolution_comm`). Convolution of continuous bi-`T`-invariant
  functions is commutative. Route: Gel'fand's trick with the anti-automorphism `g ↦ g⁻¹`.
- **The zonal spherical functions** (`eq_matrixElement_zonal_iff`,
  `eq_matrixElement_zonal_iff_integral_mul_torusExp_mul`). A continuous bi-`T`-invariant
  `φ : SU(2) → ℂ` with `φ(1) = 1` satisfies, for every continuous bi-`T`-invariant `f`,
  `convolution f φ = λ_f φ` with a scalar `λ_f`, if and only if `φ = D^l_{00}` for some `l`, where
  `D^l_{00} = P_l(cos β)`. A continuous `φ` with `φ(1) = 1`, bi-`T`-invariant or not, satisfies the
  functional equation `(2π)⁻¹ ∫_0^{2π} φ(g · torusExp t · h) dt = φ(g) φ(h)` for all `g, h` if and
  only if `φ = D^l_{00}` for some `l`: the equation at `g = 1` writes `φ(h)` as an average over `t`
  that is left `T`-invariant in `h`, and at `h = 1` it gives right `T`-invariance. Route: for
  `φ = D^l_{00}`, expand `φ(h⁻¹g)` by `matrixElement_mul`; left `T`-invariance of `f` kills the
  terms `μ ≠ 0`, leaving `λ_f = ∫ f conj D^l_{00}`. Conversely, Plancherel (§3.4) and
  bi-`T`-invariance write `φ = Σ_l c_l D^l_{00}`, and the cases `f = D^{l'}_{00}`, for which
  `convolution f φ = c_{l'} D^{l'}_{00}/(2l' + 1)` by Schur (§3.3), leave a single `l`, with
  `c_l = 1` from `φ(1) = 1`. For the functional equation, `integral_matrixElement_mul_torusExp_mul`
  (§3.2) gives one direction; conversely, `φ` is bi-`T`-invariant as above, and multiplying the
  equation at `(h, x)` by `f(h)` and integrating in `h` gives, by the right `T`-invariance of `f`,
  `convolution f̌ φ = (∫ f φ) φ` with `f̌(h) = f(h⁻¹)`, which runs over all continuous
  bi-`T`-invariant functions, and the first equivalence applies.

**Checks.**

- `convolution 1 1 = 1`.
- `convolution D^d_{ij} D^d_{kl} = δ_{jk} D^d_{il} / (d + 1)` (Schur).
- Negative control: `convolution` is not commutative on all continuous functions. At `d = 1`,
  `convolution D_{01} D_{11} = D_{01}/2` while `convolution D_{11} D_{01} = 0`.
- `exists_torus_mul_mul_eq_inv` at `g = eulerMiddle β`: `k₁ = D`, `k₂ = D⁻¹` with
  `D = diag(i, -i) = torusExp (π/2)`, and `D b_β D⁻¹` is
  `[[cos(β/2), -sin(β/2)], [sin(β/2), cos(β/2)]] = b_{-β} = g⁻¹`.
- Agreement with the library: for continuous `k, f`, `convolution k f x` is the value at `x` of
  `TauCeti.convolutionCLM` at `k` applied to the `L²` class of `f`
  (`TauCeti.convolutionCLM_toLp_apply`); `convolution` is defined for all functions, the library
  operator for a continuous kernel and an `L²` argument.

## Worked examples

- `j = 1/2`: in Edmonds's order `m = 1/2, -1/2`, the matrix of `D^{1/2}(euler α β γ)` is
  `euler α β γ` itself, and `d^{1/2} = [[cos(β/2), sin(β/2)], [-sin(β/2), cos(β/2)]]`
  [E, (4.1.13), p. 56].
- `j = 1`: in the order `m = 1, 0, -1`, the matrix of `d^1(β)` is Edmonds's printed matrix
  [E, p. 57] (§2.3).
- `D^1_{00} = cos β`, and `D^l_{00} = P_l(cos β)` for `l ≤ 4`.
- The Legendre addition theorem at `l = 1` is the spherical law of cosines.
- The Euler-angle Haar formula integrates `1` to `1` and `|D^1_{00}|²` to `1/3`.
- The characters at `-1` are `1, -2, 3, -4` for `d = 0, …, 3`.
- `matrixElement_eulerX` at `l = 1/2` and `l = 1` reproduces Vilenkin and Klimyk's matrices with
  the factor `i^{m-n}`.

## Downstream consumers

- SpecialFunctionsGroupModels, on function-space models of SU(1,1) and the Euclidean motion groups,
  consumes the Euler convention (§1.1), the Haar density (§1.3), the unitary model and its
  weights (§1.4), the matrix elements (§§2.1, 2.3) with their group law and unitarity (§2.2),
  the conversion from the Vilenkin–Klimyk convention (§2.7) for its Conventions, the
  differential equation of `d^j` (§4.2) for its continuation `β = it`, and the Gel'fand pair
  (§6.4) as the compact instance of its Gel'fand pairs.
- A roadmap on tensor products and Clebsch–Gordan coefficients consumes Layers 1–2, in Edmonds's
  convention, which is also his convention for the 3j symbols.

## Scope and ownership

The roadmap is complete when Tau Ceti proves every statement of `Suggested.lean` and the prose
targets of the layers above.

Inputs:
- Tau Ceti's SU(2) development: the models `Sym^d`, the weight basis, irreducibility and
  exhaustion, characters, the Weyl integration formula, and the double cover `SU(2) → SO(3)`.
- Its compact-group development: normalized Haar measure, Schur orthogonality, Peter–Weyl.
- Mathlib's Chebyshev polynomials, the Gauss series, the surface measure on spheres and the
  change of variables formula.
- The Jacobi polynomials of the [LaguerreJacobi](../LaguerreJacobi/README.md) roadmap (§§3.2–3.4,
  4.3, 6.1–6.2).
- The spherical harmonics of [SpecialFunctionsLegendre](../SpecialFunctionsLegendre/README.md)
  (§§3.1–3.3), for §§6.1 and 6.3.

Owned here:
- Euler angles on SU(2) and SO(3), and the Haar measures in Euler angles;
- the invariant inner product on `Sym^d ℂ²`, the unitary model, and the SU(2) matrix elements
  `D^j`, defined directly as inner products in the unitary model;
- the functions `d^j_{m'm}` with their closed forms, symmetries and special values;
- the conversion from the convention of Vilenkin and Klimyk;
- the addition, product and orthogonality theorems, and Plancherel in coordinates;
- the infinitesimal operators, the Casimir and the Laplacian in Euler angles, the differential
  equation, recurrence and generating function of `d^j`;
- characters as Chebyshev polynomials;
- the Krawtchouk polynomials `K_s(x; p, N)` for real `p` (DLMF 18.20.6), their expression
  through `d^j` and their orthogonality; Tau Ceti's coding-theory Krawtchouk values are the
  integer case `p = (q - 1)/q` in another normalization (§5.2);
- the surface measure `toSphere` of `S²` in polar coordinates (§6.3);
- what needs the group on `S²`: the polynomial carrier `sphericalHarmonic` on `ℝ³` with its
  comparison to SpecialFunctionsLegendre's spherical harmonics, the orbit, column and row
  formulas, the rotation law, the irreducibility of the spaces `H_l` and the decomposition of
  `L²(S²)` into them, and the Laplace–Beltrami operator of `S²` as the Laplacian of SU(2) on
  functions independent of `γ`;
- the Gel'fand pair (SU(2), T), which is (SO(3), SO(2)) lifted to the double cover.

Not owned:
- the SU(2) engine of the compact-groups roadmap (its §§E.1–E.4: the torus, the models `Sym^d`,
  their characters and the Weyl integration formula), and the double cover `SU(2) → SO(3)`, all in
  Tau Ceti;
- the Jacobi, Legendre and Gegenbauer polynomials as such
  ([LaguerreJacobi](../LaguerreJacobi/README.md), Layers 3, 4 and 6);
- the Ferrers and Legendre functions, and the spherical harmonics `Y_{l,m}(θ, φ)` with their
  orthonormality, addition theorem, harmonic polynomials, completeness and angular-momentum
  equation, and the addition theorem of the Legendre polynomials in Ferrers functions
  (SpecialFunctionsLegendre, §§2.5 and 3.1–3.3); §2.6 writes the Ferrers functions of integer
  order through derivatives of `P_l`, and §3.1 states the addition theorem in the matrix elements
  `d^l_{m0}`;
- the completeness of the restricted harmonic polynomials on spheres
  ([RiemannianGeometry](../RiemannianGeometry/README.md) R8.2), which this roadmap uses through
  SpecialFunctionsLegendre §3.3;
- convolution on a compact group as an operator on `L²` (Tau Ceti); §6.4 uses convolution of
  functions, which agrees with it on continuous functions;
- the matrix element of a unitary representation in a Hilbert basis for a general group. That
  general definition, with the instances for SU(1,1) and the Euclidean motion groups, belongs to
  the downstream roadmap SpecialFunctionsGroupModels; its instance at SU(2), the unitary model and
  the standard basis is `matrixElement` here, and the bridge is a target of that roadmap.

Boundary in one sentence: everything that needs the group SU(2) or SO(3) and a basis of its
irreducible representations is here; facts about one function family alone are the supplier's,
with the exception of the Krawtchouk polynomials of real parameter `p`, which no other roadmap
defines.

## Exact supplier contracts

### From Tau Ceti

- `TauCeti.SU2.symPowerModel` is the continuous model of `Sym^d` on
  `EuclideanSpace ℂ (Fin (d+1))` in the weight basis `TauCeti.SU2.weightBasis`, with
  `TauCeti.SU2.continuous_symPowerModel`, `TauCeti.SU2.isIrreducible_symPowerModel` and
  `TauCeti.SU2.existsUnique_nonempty_equiv_symPower` (every continuous irreducible representation
  is some `Sym^d`, uniquely). The model is not unitary for `d ≥ 2`; the unitary model of §1.4 is
  its transport by `monomialScale`.
- `TauCeti.SU2.torusExp` and `TauCeti.SU2.torus`.
- `TauCeti.SU2.symPower` with `TauCeti.SU2.character_symPower_eq_chebyshevU_eval` (the character
  of `Sym^d` is `U_d(tr g / 2)`) and `TauCeti.SU2.weyl_integration_formula`.
- `TauCeti.haarProb`, `TauCeti.IrrepModel`, `TauCeti.IsIrrepSkeleton`, and
  `TauCeti.peterWeylBasis` with `TauCeti.coe_peterWeylBasis`.
- `ContRepresentation.matrixCoeff`, `ContRepresentation.IsUnitary` and
  `ContRepresentation.schur_orthogonality`.
- `ContinuousLinearEquiv.congr`, `ContinuousLinearEquiv.continuous_congr` and
  `ContinuousLinearEquiv.isIrreducible_congr`: transport of a representation along a continuous
  linear equivalence.
- The double cover `SU(2) → SO(3)` from Tau Ceti's SU2 Adjoint module: its matrix, the homomorphism,
  its surjectivity, its kernel `{±1}` and the topological isomorphism `SU(2)/{±1} ≃ SO(3)`.
  `pauliRotation` is a local copy of the matrix, with the same formula; the module docstring of
  `Suggested.lean` names the five upstream declarations. §4.1 uses, in prose, the differential of
  `Sym^d` from Tau Ceti's SU2 Differential module.
- `TauCeti.krawtchouk`, the coding-theory Krawtchouk values, for the comparison Check of §5.2.
- `TauCeti.convolutionCLM` with `TauCeti.convolutionCLM_toLp_apply`, for the agreement Check of
  §6.4.

### From Mathlib

- `Polynomial.Chebyshev.U`, `ordinaryHypergeometric` and `ascPochhammer`.
- `MeasureTheory.Measure.toSphere`.
- `MeasureTheory.integral_image_eq_integral_abs_det_fderiv_smul` and
  `MeasureTheory.lintegral_image_eq_lintegral_abs_det_fderiv_mul`, for §6.3.

### From the [LaguerreJacobi](../LaguerreJacobi/README.md) roadmap

- §3.2: the Jacobi polynomial over a `ℚ`-algebra, by the explicit DLMF 18.5.8 sum. Its
  normalization `P_n^{(a,b)}(1) = C(n+a, n)` is Edmonds's (4.1.17) [E, p. 58]. `Suggested.lean`
  carries a verbatim local copy, `jacobi`, whose docstring names the owner.
- §§3.3–3.4 (reflection, derivative, Rodrigues) and §4.3 (orthogonality, with the norm sequence
  of Edmonds's (4.1.22)) for Layers 2 and 3.
- §6.1 (Legendre, `P_l = jacobi 0 0 l`) and §6.2 (Gegenbauer) for §2.6.

### From [SpecialFunctionsLegendre](../SpecialFunctionsLegendre/README.md)

- §3.1: the spherical harmonic `Y_{l,m}(θ, φ)` of DLMF 14.30.1, for the comparison of §6.1.
- §3.2: orthonormality, for the linear independence in §6.3 and the orthogonality of the `H_l`.
- §3.3: completeness, the Hilbert basis of `L²((0, π) × (0, 2π), sin θ dθ dφ)`, for §6.3; the
  angular-momentum equation and the harmonic polynomials, cited in §6.2.
- §2.5: the addition theorem in Ferrers functions, cited in §3.1.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

No Tau Ceti roadmap owns these topics; each is material for a further roadmap built on this one.

- Matrix elements on `SL(2, ℂ)` and complex Euler angles [VK, §6.3.3, p. 284].
- Degree-shift recurrences, Christoffel–Darboux, and generating functions in the degree
  [VK, §6.7.3, p. 336; §6.7.8, p. 344].
- Integral representations and the Rodrigues formula for `d^j` [VK, §6.3.5, p. 287].
- The recursion in `j` [E, (4.4.1), p. 61], and Wigner's computation through `d^j(π/2)`
  [E, (4.5.1)–(4.5.3), pp. 61–62].
- Expansion of smooth functions on SU(2) with rapid decay of coefficients [VK, §6.10.4, p. 372].
- Krawtchouk difference equations and generating functions, and the Meixner analogue for SU(1,1)
  [VK, §6.8.2, p. 350].
- Tensor products, Clebsch–Gordan and Wigner coefficients, and products of `D` [E, §4.3, p. 60].

## Prior formalization

[lean-SFVK](https://github.com/bjbraams/lean-SFVK) (Apache-2.0), by the author of this roadmap,
proves the following targets without `sorry`, against Tau Ceti and the lean-DLMF Jacobi, Legendre
and Ferrers functions. The roadmap reuses its conventions and names; its modules are a cited
source, not the specification.

- §1.1: `ofPair`, `eulerMiddle`, `euler`, `eulerBox`, `coe_eulerMiddle`, `exists_euler_eq`,
  `bijOn_euler`, and the first row of `coe_euler` (`SFVK/SU2/Basic/Coordinates.lean`,
  `SFVK/SU2/Coordinates.lean`).
- §1.2: `rotationZ`, `rotationY`, `pauliRotation_euler` (for Tau Ceti's double cover) and
  `exists_eq_rotationZ_mul_rotationY_mul_rotationZ` (`SFVK/SU2/SO3.lean`).
- §1.3: `eulerMeasure` and `haarProb_eq_map_eulerMeasure` (`SFVK/SU2/Coordinates.lean`).
- §1.4: `magneticWeight`, `monomialNorm`, `monomialScale`, `unitaryModel`,
  `continuous_unitaryModel`, `isIrreducible_unitaryModel` and `isUnitary_unitaryModel`
  (`SFVK/SU2/Basic/UnitaryModel.lean`, `SFVK/SU2/UnitaryModel.lean`).
- §§2.1–2.2: `matrixElement` (through a general Hilbert-basis matrix element),
  `matrixElement_eq_conj_matrixCoeff`, `entrySum`, `matrixElement_eq_entrySum`,
  `matrixElement_spinHalf`, `matrixElement_one`, `matrixElement_mul` and `matrixElement_inv`
  (`SFVK/SU2/Basic/MatrixElements.lean`, `SFVK/SU2/MatrixElements.lean`,
  `SFVKMathlib/RepresentationTheory/Continuous/MatrixElement.lean`).
- §§2.3–2.6: `wignerSmallD`, `matrixElement_euler`, `wignerSmallD_eq_jacobi`, `wignerSmallD_zero`,
  `wignerSmallD_pi`, `wignerSmallD_two_mul_self`, and `wignerSmallD_eq_ferrers` in DLMF's
  normalization on `[0, π]` (`SFVK/SU2/Basic/WignerSmallD.lean`,
  `SFVK/SU2/SpecialFunctions.lean`).

## References

- [E] A. R. Edmonds, *Angular Momentum in Quantum Mechanics*, Princeton University Press, 1957,
  §1.3, Chapter 2, Chapter 4. Equation numbers and pages refer to the 1957 printing.
- [VK] N. Ja. Vilenkin, A. U. Klimyk, *Representation of Lie Groups and Special Functions*,
  Vol. 1, Kluwer, 1991, Chapter 6.
- [KV] A. U. Klimyk, N. Ja. Vilenkin, *Representations of Lie groups and special functions*, in
  A. A. Kirillov (ed.), *Representation Theory and Noncommutative Harmonic Analysis II*,
  Encyclopaedia of Mathematical Sciences 59, Springer, 1995, §2.2.
- [W] A. Wawrzyńczyk, *Group Representations and Special Functions*, Reidel, 1984, Chapter 8.
- [D] J. Dieudonné, *Special Functions and Linear Representations of Lie Groups*, CBMS Regional
  Conference Series 42, AMS, 1980, §§2, 6–7.
- [M] W. Miller, Jr., *Lie Theory and Special Functions*, Academic Press, 1968, §5-16.
- [DLMF] *NIST Digital Library of Mathematical Functions*, https://dlmf.nist.gov/, §§14.6, 14.30,
  18.5, 18.7, 18.19, 18.20.

Locators to [VK] and [KV] are in their convention and are transported by §2.7. The following
misprints of [VK] and [KV] are corrected wherever the README uses those formulas:
- [VK, §6.3.3, p. 285]: `(-l-m)!` for `(l-m)!` in the third form of (3), and `φ` for `ψ` in the
  exponent of (5);
- [VK, §6.3.6 (1′), p. 288] and [VK, §6.7.2, p. 335]: the sign `(-1)^{m+n}` for `(-1)^{m-n}` in
  the interchange `P^l_{mn} = (-1)^{m-n} P^l_{nm}`;
- [VK, §6.3.7 (3′), p. 289]: the factor `(1)^n` for `(-1)^n`;
- [VK, §6.6.1 (4), p. 326; §6.6.2 (2), p. 327]: `e^{-kφ₂}` for `e^{-ikφ₂}`;
- [VK, §6.8.1, pp. 347–348]: `(p-1)/2` for `(p-1)/p` in (5), the argument `1 + 2p` for `1 - 2p`
  in (8), and the range `0 ≤ p ≤ 1` for `0 < p < 1` in the orthogonality;
- [VK, §6.9.2, pp. 358–359]: `t^l_{mn}` for `t^l_{mm}` in (1), and `φ - ψ` for `φ + ψ` in (5);
- [KV, p. 178, (19)]: the phase `e^{-i(φm+φn)}` for `e^{-i(mφ+nψ)}`, and the factor `i^{m-n}` of
  the canonical basis, which is missing.
