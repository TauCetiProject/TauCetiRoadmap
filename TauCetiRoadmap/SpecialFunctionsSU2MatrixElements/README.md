# Roadmap: matrix elements of SU(2) and SO(3), Jacobi and Legendre functions

## Summary

The irreducible unitary representations of SU(2) are the symmetric powers `Sym^d ℂ²`, `d ≥ 0`.
In a weight basis and in Euler angles their matrix elements are Wigner's functions
`D^j_{m'm}(α, β, γ) = e^{im'α} d^j_{m'm}(β) e^{imγ}` of spin `j = d/2`. The reduced functions
`d^j_{m'm}` are Jacobi polynomials with integral parameters, times powers of `sin(β/2)` and
`cos(β/2)`. Legendre polynomials, Ferrers functions of integral order, spherical harmonics, the
Chebyshev polynomials of the second kind and the Krawtchouk polynomials are special cases or
reorganizations of them.

This roadmap builds the matrix elements on top of Tau Ceti's SU(2) and compact-group development
and derives the classical identities from the group structure:
- the addition and product formulas from the homomorphism property;
- orthogonality from Schur;
- the differential equation and recurrences from the Lie-algebra action;
- the Krawtchouk orthogonality from unitarity;
- harmonic analysis on `S²` from the double cover `SU(2) → SO(3)`.

The development is organized by the structure of the subject, in proof-dependency order:
coordinates and the unitary model; the matrix elements and their closed forms; what follows from
the group law; what follows from the Lie algebra; characters and the column index; the homogeneous
space `S² = SO(3)/SO(2)`.

The roadmap is a synthesis of several sources, none of which it follows section by section:
- Edmonds [E], whose convention it adopts, for the Euler angles, the matrices `D^j` and `d^j`,
  their closed forms and symmetries, and the spherical harmonics;
- Vilenkin and Klimyk [VK, Chapter 6] and their survey [KV, §2.2], for the addition and product
  theorems, the infinitesimal operators, the Krawtchouk connection, the characters and the
  harmonic analysis, transported from their convention by one stated conversion theorem (§2.7);
- Wawrzyńczyk [W, Chapter 8], Dieudonné [D, §§2, 7] and Miller [M, §5-16], for the invariant
  measure, the differential operators, the angle of a product and the Gel'fand pair;
- the DLMF [DLMF, Chapters 14 and 18], for the normalizations of the Jacobi, Legendre, Ferrers and
  Krawtchouk functions and of the spherical harmonics.

## Scope and ownership

The roadmap is complete when Tau Ceti proves every statement of `Suggested.lean` and the prose
targets of the layers below.

Inputs:
- Tau Ceti's SU(2) development: the models `Sym^d`, the weight basis, irreducibility and
  exhaustion, characters, the Weyl integration formula, and the double cover `SU(2) → SO(3)`.
- Its compact-group development: normalized Haar measure, Schur orthogonality, Peter–Weyl.
- Mathlib's Chebyshev polynomials, the Gauss series, the surface measure on spheres and the
  Euclidean Laplacian.
- The Jacobi polynomials of the LaguerreJacobi roadmap (§§3.2–3.4, 4.3, 6.1–6.2).

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
- the Krawtchouk polynomials (DLMF 18.20.6), their expression through `d^j` and their
  orthogonality;
- spherical harmonics on `S²` as matrix elements, with their orthonormality, completeness, rotation
  law, addition theorem and the harmonicity of solid harmonics;
- the Gel'fand pair (SU(2), T), which is (SO(3), SO(2)) lifted to the double cover.

Not owned:
- the SU(2) engine of the compact-groups roadmap (its §§E.1–E.4: the torus, the models `Sym^d`,
  their characters and the Weyl integration formula), and the double cover `SU(2) → SO(3)`, all in
  Tau Ceti;
- the Jacobi, Legendre and Gegenbauer polynomials as such (LaguerreJacobi, Layers 3, 4 and 6);
- the Ferrers functions of non-integral degree or order, and the Legendre functions off
  `[-1, 1]` (DLMF Chapter 14);
- the matrix element of a unitary representation in a Hilbert basis for a general group. That
  general definition, with the instances for SU(1,1) and the Euclidean motion groups, belongs to
  the downstream roadmap SpecialFunctionsGroupModels; its instance at SU(2), the unitary model and
  the standard basis is `matrixElement` here, and the bridge is a target of that roadmap.

Boundary in one sentence: everything that needs the group SU(2) or SO(3) and a basis of its
irreducible representations is here; facts about one polynomial family alone are the supplier's,
with the exception of the Krawtchouk polynomials, which no other roadmap defines.

## Conventions

The convention is that of Edmonds [E], chosen so that every displayed formula of
[E, §§4.1–4.2] holds verbatim for a genuine left representation of SU(2).

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
  through the Pauli map `x ↦ [[x₂, x₀ - i x₁], [x₀ + i x₁, -x₂]]`. Tau Ceti provides it after the
  pin of this repository, so `Suggested.lean` carries its matrix as the local copy
  `pauliRotation`, with the same formula. It sends `g_α` to `R_z(-α)` and `b_β` to `R_y(-β)`, so
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
  `m = i - l`; it equals `Y_l^m` on the unit sphere.
- The surface measure on `S²` is `MeasureTheory.Measure.toSphere` of Lebesgue measure, of total
  mass `4π`.
- Vilenkin and Klimyk use the basis `ψ_n = z₁^{l-n} z₂^{l+n}/√·`, which is `e_i` with
  `n_VK = d/2 - i = -m`, and the Euler element `u(φ, θ, ψ) = g_φ a_θ g_ψ` with
  `a_θ = [[cos(θ/2), i sin(θ/2)], [i sin(θ/2), cos(θ/2)]]` (`eulerMiddleX`, `eulerX`). Their
  formulas are transported by §2.7. A locator into [VK] or [KV] below refers to their convention.

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
- The double cover `SU(2) → SO(3)`, its surjectivity, its kernel `{±1}` and its value on the
  torus, from Tau Ceti's SU2 Adjoint module, which postdates the pin of this repository;
  `pauliRotation` is its matrix. §4.1 uses, in prose, the differential of `Sym^d` from Tau Ceti's
  SU2 Differential module.

### From Mathlib

- `Polynomial.Chebyshev.U`, `ordinaryHypergeometric` and `ascPochhammer`.
- `MeasureTheory.Measure.toSphere` and `Laplacian.laplacian`.

### From the LaguerreJacobi roadmap

- §3.2: the Jacobi polynomial over a `ℚ`-algebra, by the explicit DLMF 18.5.8 sum. Its
  normalization `P_n^{(a,b)}(1) = C(n+a, n)` is Edmonds's (4.1.17) [E, p. 58]. `Suggested.lean`
  carries a verbatim local copy, `jacobi`, whose docstring names the owner.
- §§3.3–3.4 (reflection, derivative, Rodrigues) and §4.3 (orthogonality, with the norm sequence
  of Edmonds's (4.1.22)) for Layers 2 and 3.
- §6.1 (Legendre, `P_l = jacobi 0 0 l`) and §6.2 (Gegenbauer) for §2.6.

## How to read the build

Each layer has numbered subsections. Each subsection lists its targets as bold headlines with
their Lean names, a source locator for a headline that restates a source result and a proof route
for a corollary, and Checks: at least three per definition, one fact per bullet, at least one a
negative control. Layers 1 and 2 are the foundation. Given Layer 2, Layers 3–6 are independent of
each other, except that §6.3 uses the Legendre addition theorem of §3.1 and Plancherel of §3.4.

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
  is `16π²`; it is left invariant, because left multiplication acts on the first row
  `(g₀₀, g₀₁) ∈ S³ ⊂ ℂ²` by a unitary map preserving the surface measure, and the Euler angles
  are spherical coordinates on `S³`. Conclude by uniqueness of Haar measure.
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
- `∫ |D^1_{00}|² = 1/3` and `∫ |D^{1/2}_{1/2,-1/2}|² = 1/2` by the Euler-angle formula,
  computed by numerical quadrature.
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

- **The identity and the group law** (`matrixElement_one`, `matrixElement_mul`). `D(1) = 1` and
  `D(gh) = D(g) D(h)` as matrices. Route: homomorphism of `unitaryModel`.
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

- `D(gh) = D(g)D(h)` and unitarity of `D(g)` hold for random `g, h` and `d ≤ 5`, with error below
  `10⁻¹³`.
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
- `matrixElement_euler` holds for `d ≤ 5` at five triples of angles, including `β = 3.9` and
  `β = -0.8`, with error below `10⁻¹³`.

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
- Both forms agree with `wignerSmallD` for all `i, k ≤ d ≤ 6` at `β ∈ {0.7, 2.9, -1.2, 4.0}`,
  with error below `10⁻⁹`.

### 2.5 Symmetries and special values

Sources: [E, (4.2.1)–(4.2.6), pp. 59–60]; [VK, §6.3.6, pp. 287–288]; [M, §5-16, p. 219].

- **Symmetries** (`wignerSmallD_swap`, `wignerSmallD_reflect`, `wignerSmallD_neg`,
  `wignerSmallD_pi_add`). `d_{m'm} = (-1)^{m'-m} d_{mm'} = (-1)^{m'-m} d_{-m',-m}`,
  `d_{m'm}(-β) = d_{mm'}(β)` and `d_{m'm}(π + β) = (-1)^{j-m'} d_{-m',m}(β)`. Route: the sum
  (4.1.15), or `matrixElement_mul` with `eulerMiddle π`.
- **Values at `0` and `π`** (`wignerSmallD_zero`, `wignerSmallD_pi`). `d_{m'm}(0) = δ_{m'm}` and
  `d_{m'm}(π) = (-1)^{j+m} δ_{m',-m}` [E, (4.2.1), p. 59].

**Checks** (the definition is that of §2.3):

- All six identities hold for `i, k ≤ d ≤ 6` at `β ∈ {0.7, 2.9, -1.2, 4.0}`.
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
  Checked numerically for `l ≤ 5`.

**Checks** (the definitions are those of §§2.3–2.4):

- `wignerSmallD_two_mul_self` and `wignerSmallD_eq_ferrers` hold for `l ≤ 4`, `n ≤ l`, at
  `β ∈ {0.7, 2.9, -1.2, 4.0}`.
- The DLMF form agrees with SciPy's Ferrers function (which carries the Condon–Shortley phase)
  for `l ≤ 3` at `β ∈ {0.7, 2.9}`.
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
  KV, p. 178, (19)] with `P^l_{mn}(cos θ) = d^l_{mn}(θ)`. Route: `eulerX_eq_euler` and
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
  form with `+` [E, (4.6.6), p. 63] is the substitution `α ↦ α + π`.

**Checks** (the definitions are those of Layers 1 and 2):

- `wignerSmallD_addition` holds for `d ≤ 4` at `(β₁, α₂, β₂) = (0.7, 0.45, 2.9)`,
  `(-1.2, 1.7, 4.0)` and `(2.2, -0.9, 0.3)`, with error below `10⁻⁹`.
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

- `legendre_product` holds for `l ≤ 4` at `(θ₁, θ₂) = (0.7, 2.9)` and `(-1.2, 4.0)`, by
  quadrature.
- The functional equation holds for `l ≤ 4` at random `g, h`, by quadrature.
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
- **Jacobi orthogonality for integral parameters.** Substituting the Jacobi form gives
  `∫_{-1}^1 P_r^{(a,b)} P_{r'}^{(a,b)} (1-z)^a (1+z)^b dz` for integers `a, b ≥ 0`, which must
  agree with [E, (4.1.22), p. 58] and LaguerreJacobi §4.3. This is a consistency check on the
  constants of `wignerSmallD_eq_jacobi`.

**Checks.**

- `integral_wignerSmallD_mul_wignerSmallD` holds by quadrature for the pairs `(d, d')` equal to
  `(2, 4)`, `(2, 2)`, `(3, 5)`, `(3, 3)`, `(4, 4)` and `(1, 3)`, with matching weights.
- `∫ |D^1_{00}|² = 1/3` (§1.3).
- Negative control: without the weight `sin β`, `∫_0^π (d^1_{00})² dβ = ∫_0^π cos² β dβ = π/2`,
  not `2/3`.

### 3.4 Plancherel on SU(2)

Sources: [VK, §6.10.2 (1)–(4), pp. 366–367]; [W, §8.6, (8.6.1), p. 301].

- **Plancherel** (`hasSum_plancherel`). For `f ∈ L²(SU(2))`,
  `∫ |f|² = Σ_{j,m',m} (2j+1) |∫ f conj D^j_{m'm}|²` [VK, §6.10.2, pp. 366–367]. Route:
  `TauCeti.peterWeylBasis` for the skeleton `irrepModel` and `TauCeti.coe_peterWeylBasis`; the
  Peter–Weyl basis vectors are `√(d+1)` times the matrix elements.
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
- Negative control: `lieMatrixX d` is the numerical derivative of `D(eulerMiddleX h)` at `h = 0`
  for `d ≤ 4`; the version without the factor `i` is Hermitian and fails.
- `lieMatrixY 1 = [[0, -1/2], [1/2, 0]]`; in Edmonds's order this is `[[0, 1/2], [-1/2, 0]]`, the
  derivative of `eulerMiddle` at `0`.
- `lieMatrixY d` is real and skew-symmetric.
- Negative control: swapping the two off-diagonal signs gives `[iJ_x, iJ_y] = +iJ_z`, which
  contradicts the derivative check.
- `lieMatrixZ 1 = diag(-i/2, i/2)`, which is `diag(i m)` for `m = -1/2, 1/2`.
- `lieMatrixZ d` has trace `0`.
- Negative control: with the opposite weight the diagonal would be `diag(i/2, -i/2)`, the
  derivative of `D(torusExp (-t/2))`.
- The three commutators and the Casimir hold for `d ≤ 4`.

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

- `wignerSmallD_ode` holds by finite differences for `d ≤ 5`, all indices, at `β ∈ {0.7, 2.1}`.
- `hasDerivAt_wignerSmallD` and the generating function hold for `d ≤ 5`, all indices.
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
- `sum_matrixElement_self_eq_chebyshevU` and `sum_matrixElement_self_euler` hold for `d ≤ 5`.
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
- `wignerSmallD_eq_krawtchouk` holds for `d ≤ 6` at `β = 1.1`, and `krawtchouk_orthogonal` for
  `N ≤ 5` at `p = 0.3`.
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
  Edmonds's `Y_{lm}` [E, (2.5.29), p. 24].
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
- `sphericalHarmonic l i` agrees with SciPy's `Y_l^m` for `l ≤ 3` at `(θ, φ) = (1.1, 0.7)`.
- Negative control: without the Condon–Shortley phase, `Y_1^1 = +√(3/(8π)) (x₁ + i x₂)`, and
  `matrixElement_euler_column` fails by a sign.
- Negative control: off the unit sphere the rotation law fails for `l = 2`, because
  `sphericalHarmonic 2 2 x = √(5/(16π)) (3x₃² - 1)` is not homogeneous.

### 6.2 Laplacians

Sources: [E, p. 21; (2.5.9), p. 22]; [VK, §6.10.3 (9), p. 372].

- **The Laplace–Beltrami operator of `S²`** (`sphereLaplacian`), in polar coordinates
  `∂²_θ + cot θ ∂_θ + sin⁻² θ ∂²_φ`.
- **The Laplacian of SU(2) and that of `S²`** (`eulerLaplacian_sphere`). On functions independent
  of `γ`, `eulerLaplacian` is `sphereLaplacian` in the polar coordinates `(θ, φ) = (β, α)`.
  Route: the `γ`-derivatives vanish.
- **Spherical harmonics are eigenfunctions** (`sphereLaplacian_sphericalHarmonic`), with
  eigenvalue `-l(l+1)` [E, (2.5.9), p. 22]. Route: `wignerSmallD_ode` at `m = 0` and
  `matrixElement_euler_column`. With §6.1 this exhibits the column `D^l_{m0}` as the lift to SU(2)
  of a Laplace–Beltrami eigenfunction.
- **Solid harmonics are harmonic** (`laplacian_solidHarmonic`). `‖x‖^l Y_l^m(x/‖x‖)` has zero
  Euclidean Laplacian off the origin; this is the Euclidean form of the eigen-equation. Route:
  the Laplacian in spherical coordinates and the previous headline.

**Checks.**

- `sphereLaplacian` sends `Y_l^m(spherePoint θ φ)` to `-l(l+1)` times itself for `l ≤ 3`, checked
  by finite differences.
- `sphereLaplacian` of a function of `φ` alone is `sin⁻²θ` times its second derivative.
- Negative control: `sphereLaplacian` without the term `cot θ ∂_θ` sends `cos θ = √(4π/3) Y_1^0`
  to `-cos θ` instead of `-2 cos θ`.

### 6.3 Harmonic analysis on the sphere

Sources: [E, (4.6.6)–(4.6.7), p. 63]; [VK, §6.10.2 (9)–(10), p. 367]; [W, Ch. 8]; DLMF 14.30.8,
14.30.9.

- **Orthonormality** (`integral_sphericalHarmonic_mul_conj`), for the surface measure of mass
  `4π` (DLMF 14.30.8). Route: Schur orthogonality pushed forward by `orbitPoint`.
- **Completeness** (`ae_eq_zero_of_forall_integral_sphericalHarmonic`). Route: Plancherel on SU(2)
  applied to `f ∘ orbitPoint`. That function is right invariant under the torus, hence orthogonal
  to every column `m ≠ 0`.
- **The decomposition of `L²(S²)`.** `L²(S²) = ⊕_l H_l`, where `H_l` is spanned by the
  `Y_l^m`, is invariant by the rotation law, and is irreducible of dimension `2l + 1`. Route: the
  two previous headlines, `sphericalHarmonic_rotation` and `isIrreducible_unitaryModel`.
- **The addition theorem for spherical harmonics** (`sum_sphericalHarmonic_mul_conj`). For unit
  `x, y`, `Σ_m Y_l^m(x) conj Y_l^m(y) = (2l+1)/(4π) P_l(x · y)` [E, (4.6.6)–(4.6.7),
  p. 63; DLMF 14.30.9]. Route: `legendre_addition` in the form
  `D^l_{00}(g⁻¹h) = Σ_m conj D^l_{m0}(g) D^l_{m0}(h)`.

**Checks** (the definitions are those of §6.1):

- `sum_sphericalHarmonic_mul_conj` holds for `l ≤ 3` at random unit vectors.
- At `x = y` and `l = 1` it gives `Σ_m |Y_1^m|² = 3/(4π)`.
- At `x = y` each term is a squared modulus, so the addition theorem does not detect the
  Condon–Shortley phase; the column formula of §6.1 does.

### 6.4 The Gel'fand pair (SU(2), T)

Sources: [D, §§6–7, pp. 18–21]; [W, Ch. 8]; [VK, §6.3.11, p. 297].

- **Convolution** (`convolution`), for the normalized Haar measure.
- **Gel'fand's criterion** (`exists_torus_mul_mul_eq_inv`). Every `g⁻¹` lies in `T g T`. Route:
  for `g = euler α β γ` take `k₁ = g_{-γ} D g_{-α}` and `k₂ = g_{-γ} D⁻¹ g_{-α}` with
  `D = diag(i, -i)`, since `D b_β D⁻¹ = b_{-β}`.
- **The commutative algebra** (`convolution_comm`). Convolution of continuous bi-`T`-invariant
  functions is commutative. Route: Gel'fand's trick with the anti-automorphism `g ↦ g⁻¹`.
- **The zonal spherical functions.** The continuous bi-`T`-invariant eigenfunctions of
  convolution are the `D^l_{00} = P_l(cos β)`, and they satisfy the functional equation of §3.2.

**Checks.**

- `convolution 1 1 = 1`.
- `convolution D^d_{ij} D^d_{kl} = δ_{jk} D^d_{il} / (d + 1)` (Schur).
- Negative control: `convolution` is not commutative on all continuous functions. At `d = 1`,
  `convolution D_{01} D_{11} = D_{01}/2` while `convolution D_{11} D_{01} = 0`.
- `exists_torus_mul_mul_eq_inv` holds with the stated `k₁, k₂` at three triples of angles.

## Examples

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

All numbers above were recomputed in double precision with NumPy and SciPy.

## Downstream consumers

- SpecialFunctionsGroupModels, on function-space models of SU(1,1) and the Euclidean motion groups,
  consumes the Euler convention (§1.1), the Haar density (§1.3), the unitary model and its
  weights (§1.4), the matrix elements (§§2.1, 2.3), the differential equation of `d^j` (§4.2)
  for its continuation `β = it`, and the Gel'fand pair (§6.4) as the compact instance of its
  Gel'fand pairs.
- A roadmap on tensor products and Clebsch–Gordan coefficients consumes Layers 1–2, in Edmonds's
  convention, which is also his convention for the 3j symbols.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

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

## References

- [E] A. R. Edmonds, *Angular Momentum in Quantum Mechanics*, Princeton University Press, 1957
  (reprint 1996), §1.3, Chapter 2, Chapter 4.
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

Locators to [VK] and [KV] are in their convention and are transported by §2.7. Errata of [VK]
and [KV] applied there: in [VK] the formulas of §§6.3.3, 6.3.6, 6.3.7, 6.6.1, 6.7.2, 6.8.1 and
6.9.2, and in [KV] the factor `i^{m-n}` missing from (19), p. 178.

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
