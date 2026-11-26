# Abelian schemes with theta structures and their cohomology

**Summary.** The argument of the family runs as follows: a one-sided bound for a sum over primes gives a half-plane
free of zeros of Dirichlet L-functions, and the one-sided bound comes from comparing an upper and a lower bound for the
covolume of a lattice of theta lifts (OneSidedPrimeSumBoundsAndAdmissibleData). The lower bound controls congruences
between lifts by Galois representations attached to eigenforms on definite unitary groups
(GaloisRepresentationsOfUnitaryEigenforms). This roadmap supplies the geometry from which those representations are cut
out. It builds, for a CM field `E`, a tower of Kuga–Sato varieties over a smooth projective base over a localisation of
`𝓞_E`, whose complex points are tori of signature `(1, n − 1)` at one place and definite at the others, with Hecke
correspondences at split places and the congruence relation between them and Frobenius. It compares the count of fixed
points of these correspondences with a sum over the definite unitary group, and cuts out of the cohomology of the tower
a Galois representation for each Hecke eigensystem that occurs.

The construction avoids a moduli problem. The base is the reduced closure of the theta values of the level points of
complex tori in a product of projective spaces, in the manner of the theta-null embedding; the family on it is built from
dense complex points, its smoothness comes from an upper bound for first-order deformations, and its good reduction from
an analytic multiplicativity property of theta functions at torsion points. PELModuli builds the moduli problem of
unitary PEL data and its smooth models; this roadmap does not use it, and 3.2, 6.1, 7.4, 7.5, 8.1 and 8.2 say how their
objects relate to those of PELModuli. The cohomology is the theory of CohomologyOfFunctorsOnTestRings, which is not
compared with étale cohomology. Along the way the roadmap states the
classical theory of theta functions on complex tori that the route uses elsewhere: Frobenius' dimension formula with the
irreducibility of the translations by the dual lattice, Schur orthogonality for theta translates, Riemann's theta
relation, and the existence half of the Appell–Humbert theorem.

The headline theorems are these.

(1) *Frobenius' dimension formula* (1.2). For Appell–Humbert data `(B, χ)` with positive Riemann form on a full lattice
`L ⊂ V`, the space `Θ(B, χ)` of theta functions has `(dim Θ(B, χ))² = [L^⊥ : L]`, and the twisted translations by the
dual lattice `L^⊥` span its endomorphisms.

(2) *The universal theta family* (7.4). For PEL data `D` over a CM field `E` and a localisation `R` of `𝓞_E` all of whose
maximal ideals lie over primes good for `D`, there is an abelian scheme with `𝓞_E`-action, theta coordinates and level
points over a smooth projective `R`-scheme of relative dimension `n − 1`, together with a dense family of complex
points of the base, one for each analytic family of theta tori (5.5) and each parameter, at which the fibre is modelled
on the theta torus of that family at that parameter.

(3) *The model and its congruence relation* (8.4). From such a family, at a neat level, one obtains a tower of reduced
projective covers of the base with Hecke legs, finite deck groups, complex points described by linear algebra, the
tangent polynomials at fixed points, and the congruence relation `Σ_A (−1)^r q^{r(r−1)/2} [Frob^{(n−r)f} p_{g_A}] = 0` at
every safe split place.

(4) *The Galois representation of an eigensystem* (9.8). For a Hecke eigensystem `θ` at the safe places that occurs in
a multiset of weights, there is a continuous ℓ-adic representation of `Gal(Ē/E)`, cut out of the total cohomology of
the base of the model by `θ`, unramified or crystalline at each safe place, with those weights among its Hodge–Tate
jumps, and with each geometric Frobenius killed by the Hecke polynomial of `θ`.

There are nine layers. Layer 1 is theta functions on complex tori; Layer 2 their sizes at torsion points and the analytic
form of good reduction; Layer 3 PEL data, theta tori and their theta coordinates. Layer 4 treats abelian schemes, line
bundle classes and theta structures over a base; Layer 5 complex uniformisation; Layer 6 theta families and objects
modelled on tori; Layer 7 the universal theta family and the bound for its tangent spaces. Layer 8 builds the Hecke
elements, the tower and its congruence relation; Layer 9 passes to cohomology, counts fixed points and cuts out the
Galois representations.

## Conventions and notation

- *Labels.* Under each section heading, `*Origin:*` says where its statement comes from and `*Method of the formal
  proof:*` how [ShortProof] proves it. [ShortProof] is the shorter formal proof of the family `ShortGRH`; the line
  "[ShortProof], `path` (`declarations`)" at the end of a section names the file (under `src/`) and the declarations
  where it proves the statement. Its names occur only on that line. Where a section states more than [ShortProof]
  proves, its last sentence says which case [ShortProof] proves.
- *Schemes and points.* Schemes are over a base `S`; a `T`-point of an `S`-scheme `X` is an `S`-morphism `T → X`. For a
  ring `C`, `X(C)` are the points with source `Spec C`. A *valuative arc* is a valuation ring `O ⊂ ℂ` with fraction field
  `ℂ` (of any rank, not necessarily Noetherian); `Spec ℂ → Spec O` is its generic point. The *complex points* of an
  `O`-scheme `X` are the `ℂ`-points of its generic fibre, with the classical topology when `X` is of finite type.
- *Line bundles.* A *linear system* on `X` is a line bundle `N` with global sections `s_i`, `i ∈ ι` finite, without
  common zero; the `s_i(x)` are the *homogeneous coordinates* of a point `x`. A linear system is a *projective embedding*
  of `X` over `S` when `X` is proper over `S` and the morphism `X → ℙ^ι_S` given by the coordinates is a monomorphism
  (so a closed immersion). `[N] ∈ Pic(X)` is the class of `N`; `Pic` is written additively. [ShortProof] encodes line
  bundles by trivialisations on a cover with transition functions on ring-valued points; this is an encoding of the
  standard object, and the statements are made on the standard one.
- *Complex tori.* `V` is a finite-dimensional complex vector space and `L ⊂ V` a full lattice (a discrete subgroup that
  spans `V` over `ℝ`). A *form* `B` on `V` is a map `V × V → ℂ` that is `ℝ`-linear in the first and `ℂ`-linear in the
  second variable; it need not be hermitian. `e(t) = exp(2πit)`. AbelianSchemesAndArithmeticModuli §§A5.2–A5.3 write
  the line bundle of a hermitian form `H` (linear in the first variable) and a semicharacter `α` through the factor of
  automorphy `α(λ)·exp(π H(z, λ) + π H(λ, λ)/2)`, with Riemann form `E = Im H`; the same bundle has here the type
  `(B, χ)` with `B(u, v) = π H(v, u)` and `χ = α`, so that `E_B = −E`. Thus `E_B` (1.1) is the first Chern class, which
  §A5.3 identifies with `−E`, and positivity of `E_B` (1.1) is positivity of `H`.
- *The CM field.* `E` is a CM field with complex conjugation `a ↦ ā`, together with a CM type `Φ` (an embedding
  `Φ_v : E → ℂ` for each infinite place `v`) and a base infinite place `v₀`; `E` has at least two infinite places, and
  `f` is their number. Where a section says so, `E` contains an imaginary quadratic field `K₀ = ℚ(√−d₀)` with
  `d₀ ≡ 3 (mod 4)`, and `β₀ = (1 + √−d₀)/2`. A *split place* of `E` is a finite place lying over a prime of `E⁺` that
  splits in `E`; `k_w` is the residue field of `w` and `q_w = #k_w`.
- *Adeles.* The finite adeles `𝔸_f` of `E`, their integral elements `Ô` and the character `ψ_f` of `𝔸_f` (trivial on
  `Ô`, `ψ_f(a) = e(Tr_{E/ℚ}(a))` for `a ∈ E`) are as in AdelicUnitaryGroupsAndAlgebraicModularForms §2.1; `Ẑ` is the
  ring of integral finite adeles of `ℚ`. [ShortProof] uses its own model of the adeles; this is an encoding, and the
  statements are made on the standard object.
- *Cohomology.* For a prime `ℓ`, an algebraic closure `Ω` of `ℚ` and a scheme `Y` of finite type over a subring of `Ω`,
  `Vⁿ(Y) = ℚ_ℓ ⊗ Hⁿ(Y_Ω, ℤ_ℓ)` is the `ℓ`-adic cohomology of CohomologyOfFunctorsOnTestRings §§1.3, 3.4 (for
  `Ω′ = Ω`), with its action of the automorphisms of `Ω` over the base and its pull-backs. It stands in for ℓ-adic étale
  cohomology; no comparison with étale cohomology is used. "Crystalline" is in the sense of
  CrystallineRepresentationsAndKisinModules §3.1 (defined through `B_max`).

### Table of symbols

| Symbol | Meaning | Defined |
|---|---|---|
| `E_B, U_a, L^⊥` | the Riemann form `Im(B(u, v) − B(v, u))/2π`, the twisted translation, the dual lattice | 1.1 |
| `Θ(B, χ)` | the theta functions of type `(B, χ)` | 1.1 |
| `χ_b, N_x` | the canonical multiplier of a map `b`, the normalised translation | 1.3 |
| `(R, F, β)` | a hermitian action of a ring with involution on a torus | 1.5 |
| `s_f, ‖f‖_v, Ball(f)` | the size of `f` at torsion points, its theta norm at a valuation `v`, the ball of radius `‖f‖_v` | 2.1, 2.3 |
| `T_n, [y]_g` | the module `(𝔸_f/Ô)ⁿ`, the class of `g⁻¹y` | 3.1 |
| `GU, GU⁺, K(𝔑)` | unitary similitudes of the standard form, those with integral inverse, the principal level | 3.1 |
| `a = (x, J, P), a·(g, α), ≅_K` | moduli points, their translates, isomorphisms at a level `K` | 3.1 |
| `D = (β, 𝔑, ξ, n, r, i, T, Λ)` | PEL data | 3.2 |
| `Λ_S, β₁, χ_D, ϑ, θ_t, c_u` | lattices over groups of classes, `|T|β − ⌊|T|/2⌋`, the multiplier, the Lagrangian theta function, theta coordinates, the theta characters | 3.3 |
| `σ_j` | `⌊√#{y : r^j y ∈ T}⌋`, the expected ranks | 3.2 |
| `⟨x, y⟩_c` | the pairing `(x + y)^*c − x^*c − y^*c + 0^*c` | 4.1 |
| `K([N])` | the sections `z` with `⟨z, id⟩_{[N]} = 0` | 4.5 |
| `𝒳 = (A, N, λ)` | a theta family: abelian scheme, linear system, level points | 6.1 |
| `𝒰` | a universal family | 7.4 |
| `τ_{w,j}, 𝓗(𝔑)` | the Hecke elements at a safe place, the Hecke algebra of `K(𝔑)` | 8.1 |
| `𝓜 = (Z, W_i, p_g, Δ_i, m_α)` | a Kuga–Sato model | 8.2 |
| `Vⁿ(Y)` | the `ℓ`-adic cohomology of CohomologyOfFunctorsOnTestRings §3.4 | Conventions |

## Layer 1: Theta functions on complex tori

This layer is the analytic theory of theta functions on a complex torus `V/L` for a form that need not be hermitian:
the definitions (1.1), Frobenius' dimension formula with the irreducibility of the twisted translations by the dual
lattice (1.2), the absence of base points for multiples and the canonical multiplier (1.3), Schur orthogonality for
theta translates (1.4), and tori with an action of a ring with involution, for which an averaged pull-back is a scalar
of known modulus (1.5).

### 1.1 Theta functions, Appell–Humbert data and twisted translations

*Origin:* definitions and conventions.

*Method of the formal proof:* the facts below are direct computations with the factor of automorphy; (f) solves a
first-order linear differential equation along lines.

Let `L ⊂ V` be a full lattice and `B` a form on `V`, with Riemann form `E_B(u, v) = Im(B(u, v) − B(v, u))/2π`, a real
alternating form. For `χ : V → ℂ` the *theta functions of type `(B, χ)`* are the entire functions `f` on `V` with
`f(z + l) = χ(l)·exp(B(l, z) + B(l, l)/2)·f(z)` for all `l ∈ L`, `z ∈ V`; they form a complex vector space `Θ(B, χ)`.
`(B, χ)` are *Appell–Humbert data* for `L` if `Re B` is symmetric, `|χ(l)| = 1` for `l ∈ L`, and
`χ(l + m) = χ(l)χ(m)·exp(πi E_B(m, l))` for `l, m ∈ L`. The Riemann form is *positive* if `E_B(u, iu) > 0` for `u ≠ 0`.
The *twisted translation* by `a ∈ V` is `(U_a f)(z) = exp(−B(a, z) − B(a, a)/2)·f(z + a)`, on all functions `V → ℂ`, and
the *dual lattice* is `L^⊥ = {v ∈ V : E_B(v, l) ∈ ℤ for all l ∈ L}`.

Let `(B, χ)` be Appell–Humbert data for `L`.
(a) `E_B` is integral on `L × L`, so `L ⊂ L^⊥`, and `χ(l) ≠ 0` for `l ∈ L`.
(b) `U_u U_v = exp(πi E_B(u, v))·U_{u+v}`, hence `U_u U_v = e(E_B(u, v))·U_v U_u`, for all `u, v ∈ V`.
(c) `U_l f = χ(l)·f` for `f ∈ Θ(B, χ)` and `l ∈ L`, and `U_a` maps `Θ(B, χ)` into itself for every `a ∈ L^⊥`.
(d) If `(B′, χ′)` are Appell–Humbert data for `L`, so are `(B + B′, χχ′)` and `(mB, χ^m)` for `m ∈ ℕ`, and
`fg ∈ Θ(B + B′, χχ′)`, `f^m ∈ Θ(mB, χ^m)` for `f ∈ Θ(B, χ)`, `g ∈ Θ(B′, χ′)`.
(e) If some `f ∈ Θ(B, χ)` has no zero, then `E_B = 0`, `χ = 1` on `L`, and `f(z) = f(0)·exp(B(z, z)/2)`.
(f) Let `f` be a holomorphic function on `V` without zeros such that, for each `l ∈ L`, the logarithmic derivative of
`z ↦ f(z + l)/f(z)` is a constant `ℂ`-linear form. Then there is a form `B` with `Re B` symmetric and
`f(z + l) = f(z)·exp(B(l, z))·f(l)/f(0)` for all `l ∈ L`, `z ∈ V`.

*Needs:* Mathlib (`IsZLattice`, `Differentiable`).

[ShortProof], `Lib/Shimura/ComplexTheta/AppellHumbertData` (`New.RealComplexForm.thetaSpace`, `New.IsAppellHumbert`,
`New.IsPosRiemann`, `New.RealComplexForm.thetaShift`, `New.RealComplexForm.dualLattice`,
`New.IsAppellHumbert.le_dualLattice`, `New.IsAppellHumbert.thetaShift_thetaShift`, `New.IsAppellHumbert.thetaShift_comm`,
`New.IsAppellHumbert.thetaShift_mem_of_mem_dualLattice`, `New.thetaSpace.mul`, `New.thetaSpace.pow`,
`New.IsAppellHumbert.eq_exp_of_ne_zero`, `New.exists_factor_of_automorphy`)

### 1.2 Frobenius' dimension formula and irreducibility

*Origin:* adapted from Frobenius' dimension formula and the irreducibility of the theta group (G. Frobenius, *Über die
Grundlagen der Theorie der Jacobischen Functionen*, Crelle 97 (1884); Birkenhake–Lange, *Complex Abelian Varieties*,
3.2.7, 4.1.5, 6.4; a survey of proofs in D. Bump, A. Pekker, Proc. Amer. Math. Soc. 130 (2002), 3473–3481): no
symplectic basis enters the statement, which reads `(dim Θ)² = [L^⊥ : L]`; the form `B` is not assumed hermitian; and
the spanning of `End_ℂ(Θ)` by the twisted translations by `L^⊥` is stated with it.

*Method of the formal proof:* subtracting from `B` its part that is complex-linear in the first variable gives a form
`B + T` with the same Riemann form and `Re (B + T)(x, x) = π E_B(x, ix) > 0`; a Poincaré series for `B + T`, which
converges normally, gives a nonzero theta function, and multiplication by `exp((B − B − T)(z, z)/2)` carries it to type
`(B, χ)`. A pairing integral over the torus embeds `Θ(B, χ)` into the functions on `L^⊥/L`, so it is
finite-dimensional; the translations by representatives of `L^⊥/L` are linearly independent endomorphisms, and comparing
`#(L^⊥/L)` with `dim End(Θ)` gives the formula and the spanning. No symplectic basis is chosen.

Let `(B, χ)` be Appell–Humbert data for the full lattice `L` with positive Riemann form, and `Θ = Θ(B, χ)`.
(a) `Θ` is finite-dimensional and not zero, and `L` has finite index in `L^⊥`.
(b) The restrictions to `Θ` of the twisted translations `U_a`, `a ∈ L^⊥`, span `End_ℂ(Θ)`; those attached to a set of
representatives of `L^⊥/L` are linearly independent.
(c) `(dim Θ)² = [L^⊥ : L]`.
(d) (*irreducibility*) A complex vector space of functions `V → ℂ` that contains `U_a f` for all `a ∈ L^⊥` and one
nonzero `f ∈ Θ` contains `Θ`; an endomorphism of `Θ` that commutes with all `U_a`, `a ∈ L^⊥`, is a scalar.
(e) Some integer `N ≥ 1` (for example `[L^⊥ : L]`) has `N·L^⊥ ⊂ L`.

*Needs:* 1.1.

Among the roadmaps, SpecialFunctionsTheta §7.4 has the dimension `N^g` of the theta functions of order `N` for a period
matrix `Ω ∈ 𝔥_g` (the principal type), and AbelianSchemesAndArithmeticModuli §A5.4 (2) has `h⁰(L) = d` and
`deg λ = d²` for a polarised complex abelian variety, from Riemann–Roch; the statement here is on the space of theta
functions itself, for every type and for a form `B` that need not be hermitian, and includes (b) and (d).
On Tau Ceti's main branch, later than the revision pinned here: the case of dimension one for the classical factor of
automorphy, `TauCeti.finrank_thetaSections` (dimension `k` of the level-`k` theta functions on `ℂ/(ℤ + τℤ)`), which
does not give the statement. `Suggested.lean` states (a) and (c) on Mathlib's carriers.

[ShortProof], `Lib/Shimura/ComplexTheta/DimensionFormula` (`New.IsAppellHumbert.summable_and_analyticAt_tsum`,
`New.IsAppellHumbert.exists_mem_thetaSpace_ne_zero`, `New.IsAppellHumbert.finite_thetaSpace`,
`New.IsAppellHumbert.finrank_sq_eq_relIndex`, `New.IsAppellHumbert.thetaSpace_le_of_thetaShift_mem`,
`New.IsAppellHumbert.schur_lemma`, `New.IsAppellHumbert.exists_nsmul_mem_of_mem_dualLattice`)

### 1.3 Multiples without base points, and the canonical multiplier

*Origin:* adapted from the published theory of theta functions on complex tori: here the base-point freeness of the
multiples `n ≥ 2` of a positive type, and the multiplier `exp(πi E_B(bx, x))` attached to an "adjoint half" `b`.

*Method of the formal proof:* (a): if all theta functions of type `(nB, χ^n)` vanished at `z`, the products of the
translates of `f^{n−1}` by `a` and of `f` by `−(n − 1)a`, which have that type, would vanish at `z` for every `a`, so the
product of two nonzero entire functions of `a` would be zero. (b), (c): computation of the phases.

(a) Let `(B, χ)` be Appell–Humbert data for the full lattice `L` with positive Riemann form. For every `n ≥ 2` and
`z ∈ V` there is `f ∈ Θ(nB, χ^n)` with `f(z) ≠ 0`.
(b) Let `B` be a form with `Re B` symmetric and `b` a complex-linear endomorphism of `V` with
`E_B(bu, w) + E_B(u, bw) = E_B(u, w)` for all `u, w`, and `E_B(bl, m) ∈ ℤ` for `l, m ∈ L`. The *canonical multiplier*
is `χ_b(x) = exp(πi E_B(bx, x))`, `x ∈ V`. Then `(B, χ_b)` are Appell–Humbert data for `L`.
(c) In the situation of (b), the *normalised translation* `N_x = χ_b(x)^{−1}·U_x` satisfies
`N_x N_y = e(E_B(bx, y))·N_{x+y}`, and `Θ(B, χ_b)` consists of the entire functions `f` with `N_l f = f` for all `l ∈ L`.

*Needs:* 1.1, 1.2.

[ShortProof], `Lib/Shimura/ComplexTheta/DimensionFormula` (`New.IsAppellHumbert.exists_mem_thetaSpace_nsmul_apply_ne_zero`,
`New.ThetaTori.canonicalMultiplier`, `New.ThetaTori.normalizedShift`, `New.ThetaTori.isAppellHumbert_canonicalMultiplier`,
`New.ThetaTori.mem_thetaSpace_iff_normalizedShift`, `New.IsAppellHumbert.normalizedShift_normalizedShift`)

### 1.4 Schur orthogonality for theta translates

*Origin:* adapted from Schur orthogonality for the irreducible representation of the theta group: here it is an identity
for the twisted translates of theta functions by an orbit of the dual lattice, proved without building the theta group,
with an integral consequence over a valuation ring of `ℂ`.

*Method of the formal proof:* for fixed `w` the left side of (a), as a function of `g`, defines an endomorphism of `Θ`
that commutes with the translations by `L^⊥`, hence a scalar by 1.2 (d); its trace is computed with 1.2 (c). (b) follows
from (a) by choosing `f`, `g` and scalars. The library has Schur orthogonality for unitary irreducible representations
of finite groups (`ContRepresentation.schur_orthogonality_self_sum`); using it would require building the theta group as
a finite group acting unitarily on `Θ`, which the formal proof does not do.

Let `(B, χ)` be Appell–Humbert data for the full lattice `L` with positive Riemann form, and `Θ = Θ(B, χ)`.
(a) Let `T` be a finite set and `a : T → L^⊥` such that for every `t ∈ L^⊥` some permutation `e` of `T` has
`t + a_s − a_{e(s)} ∈ L` for all `s`. Then for all `f, g ∈ Θ` and `z, w ∈ V`:
`√[L^⊥ : L] · Σ_{s ∈ T} (U_{−a_s} g)(z)·(U_{a_s} f)(w) = |T|·f(z)·g(w)`.
(b) Let `O ⊂ ℂ` be a valuative arc, `N ∈ ℕ` a unit of `O` with `N·L^⊥ ⊂ L`, `(f_i)_{i ∈ I}` and `(g_k)_{k ∈ K}` finite
families in `Θ` with some `f_i ≠ 0` and some `g_k ≠ 0`, and `c : V → ℂ` with `c(a)c(−a) ∈ O^×` for `a ∈ L^⊥`. Then there
is `γ ≠ 0` such that for every `O`-module `M` of functions `V → ℂ` stable under all `c(a)·U_a`, `a ∈ L^⊥`: all `g_k`
lie in `M` if and only if all `γ f_i` lie in `M`.

*Needs:* 1.1, 1.2.

[ShortProof], `Lib/Shimura/ThetaNormality/NormalGeneration` (`New.IsAppellHumbert.sum_shift_mul_shift`,
`New.IsAppellHumbert.exists_proportional_orbit_lattice`)

### 1.5 Tori with a hermitian action and the theta identity

*Origin:* particular to this proof: for a torus with multiplications by a ring with involution, the averaged pull-back
of theta functions along an element `c` with `c̄ = d` is a scalar `μ` with `μ⁸ = det(d)⁸`; the inputs are the order of
kernels of multiplications and the reality of the fourth power of a quadratic Gauss sum, obtained by unfolding a
Poincaré kernel.

*Method of the formal proof:* the averaged pull-back commutes with the normalised translations by the dual lattice, so
it is a scalar by 1.2 (d); evaluating the scalar on the Poincaré kernel writes it as `#(d⁻¹L/L)` times the mean over the
torus of `x ↦ K(dx, cx)`; unfolding the kernel writes that mean as a Gauss sum over `κ⁻¹L/L`, `κ = c − c̄`, times a
Gaussian integral, and the fourth power of the Gauss sum is real; comparing with the complex conjugate gives `μ⁸`.

A *hermitian action* on `V/L` is a commutative domain `R` with an involution `a ↦ ā`, finite over `ℤ`, a ring
homomorphism `F : R → End_ℂ(V)` with `F(a)L ⊂ L`, a positive definite hermitian form `B` on `V` with `E_B` integral on
`L`, such that `F(ā)` is the adjoint of `F(a)` for `B`, and an element `β ∈ R` with `β̄ = 1 − β`. Its multiplier is
`χ = χ_{F(β)}` and `N_x` its normalised translations (1.3). For `a ≠ 0`, `a⁻¹L = {y : F(a)y ∈ L}`.

Let `(R, F, B, β)` be a hermitian action on `V/L`, `L` full.
(a) `(B, χ)` are Appell–Humbert data for `L` with positive Riemann form and `χ(l)² = 1` for `l ∈ L`.
(b) For `a ≠ 0` in `R`, `#(a⁻¹L/L) = det F(a)·conj(det F(a))`.
(c) For `a ≠ 0`, `f` with `N_{F(a)l} f = f` for `l ∈ L`, and a character `ξ` of `a⁻¹L/L`, the sum
`s = Σ_{k ∈ a⁻¹L/L} ξ(−k)·N_{F(a)k} f` (independent of representatives) satisfies `N_{F(a)y} s = ξ(y)·s` for `y ∈ a⁻¹L`.
(d) For `κ ≠ 0`, `r ∈ R` and a function `q` on `κ⁻¹L/L` with `q(x) = exp(B(x, F(r)x))` for every representative `x`,
`(Σ_z q(z))⁴ = (Σ_z conj q(z))⁴`.
(e) (*the theta identity*) Let `c ∈ R`, `d = c̄`, with `c ≠ d`, `c` and `d` coprime, and `F(c)a − a ∈ L`,
`F(d)a − a ∈ L` for all `a ∈ L^⊥`. Then there is `μ ∈ ℂ` with `μ⁸ = (det F(d))⁸` such that for every `t ∈ Θ(B, χ)`:
`Σ_{z ∈ d⁻¹L/L} N_{F(d)z}(t ∘ F(c) ∘ F(d)^{−1}) = μ·t`.

*Needs:* 1.1, 1.2, 1.3.

[ShortProof], `Lib/Shimura/GoodReduction/GaussSums` (`New.ThetaTori.IsHermitianAction`,
`New.ThetaTori.IsHermitianAction.isAppellHumbert`, `New.ThetaTori.IsHermitianAction.card_mulKernel`,
`New.ThetaTori.IsHermitianAction.normShift_sum_eq_char_smul`,
`New.ThetaTori.IsHermitianAction.sum_conj_pow_four_eq_sum_pow_four`,
`New.ThetaTori.IsHermitianAction.isSelfAdjoint_quotMean_pow`); `Lib/Shimura/GoodReduction/MultiplicativeNorm`
(`New.ThetaTori.IsHermitianAction.isAmpleType`, `New.ThetaTori.IsHermitianAction.exists_sum_normShift_eq_smul`,
`New.ThetaTori.IsHermitianAction.exists_theta_identity`)

## Layer 2: Sizes at torsion points and good reduction

A valuation `v` of `ℂ` measures theta functions at the torsion points of `V/L`. Good reduction of a torus at `v`, in the
analytic form used here, is the multiplicativity of the supremum of these sizes (2.1); it follows from shift bounds on
kernels of multiplications that expand (2.2), and it gives normal generation over the valuation ring with the expected
ranks after reduction (2.3).

### 2.1 Sizes, the theta norm and good reduction

*Origin:* particular to this proof: an analytic form of good reduction of a complex torus at a valuation of `ℂ`, the
multiplicativity of the supremum of the sizes of theta functions at torsion points, with the elementary properties of
sizes; the nearest published notion is good reduction of a polarised abelian variety.

*Method of the formal proof:* sizes are periodic because the factors of automorphy at torsion points are roots of unity,
of valuation 1; boundedness follows from periodicity and finiteness of the torsion of bounded order; (c) is the identity
theorem along lattices of small mesh; (e) compares sizes in degree `B` and `B′` through a theta function of type
`B − B′`.

Let `v : ℂ → ℝ_{≥0}` be a (multiplicative, non-archimedean) valuation of `ℂ`, possibly trivial. The *torsion points* of
`V/L` are the `a ∈ V` with `ma ∈ L` for some `m ≠ 0`. `(B, χ)` are *of ample type* for `L` if they are Appell–Humbert
data with positive Riemann form and `χ^m = 1` on `L` for some `m ≠ 0`. The *size* of `f : V → ℂ` in degree `B` at a
torsion point `x` is `s_f(x) = v(exp(−B(x, x)/2)·f(x)) = v((U_x f)(0))`, and its *theta norm* is
`‖f‖_v = sup_x s_f(x)`. A *size of degree `B`* is `s_f` for some `f ∈ Θ(B, χ)` with `(B, χ)` of ample type. `L` has a
*multiplicative norm* at `v` if `sup(φψ) = sup φ · sup ψ` for all forms `B, C` and all sizes `φ` of degree `B` and `ψ` of
degree `C`. `(B, χ)` have *good reduction at `v` with level `r`* if they are of ample type, some `N ∈ ℕ` with `v(N) = 1`
has `N·L^⊥ ⊂ L`, `r ≥ 2` with `v(r) = 1`, and `L` has a multiplicative norm at `v`. A torsion point `w` has the
*constant `C` in degree `B`* if `φ(y)² ≤ C·sup_x φ(x)φ(x + w)` for every size `φ` of degree `B` and every torsion `y`.

Let `L` be full.
(a) Sizes take the same value at torsion points congruent modulo `L`, are bounded, and `‖f‖_v > 0` for `0 ≠ f ∈ Θ(B, χ)`
of ample type.
(b) If `φ`, `ψ` are sizes of degrees `B`, `B′` and `w` is a torsion point, `x ↦ φ(x)ψ(x + w)` is a size of degree
`B + B′`.
(c) A holomorphic function on `V` that vanishes at all torsion points is zero.
(d) If `(B, χ)` has good reduction at `v` with level `r`, so has `(r^j B, χ^{r^j})` for every `j`.
(e) If `(B, χ)` is of ample type, `E_{B−B′}` is positive, and `s_f(y)² ≤ C·sup_x s_f(x)s_f(x + w)` for all
`f ∈ Θ(B, χ)` and all `y`, then `w` has the constant `C` in degree `B′`. If `B + B′` has the constant `1` at `y − x − w`,
then `φ(x)ψ(y) ≤ sup_z φ(z)ψ(z + w)` for sizes `φ`, `ψ` of degrees `B`, `B′`.
(f) If `(B, χ)` is of ample type, then for every form `A` and all large `m`, `E_{mB − A}` is positive.

*Needs:* 1.1, 1.2.

[ShortProof], `Lib/Shimura/GoodReduction/TorsionSizes` (`New.ThetaTori.IsAmpleType`, `New.ThetaTori.LatticeForm.sizeAt`,
`New.ThetaTori.LatticeForm.thetaNorm`, `New.ThetaTori.LatticeForm.sizes`, `New.ThetaTori.HasMultiplicativeNorm`,
`New.ThetaTori.HasGoodReduction`, `New.ThetaTori.LatticeForm.HasShiftBound`, `New.ThetaTori.bddAbove_of_mem_sizes`,
`New.ThetaTori.IsAmpleType.thetaNorm_pos`, `New.ThetaTori.mul_shift_mem_sizes`, `New.ThetaTori.eq_zero_of_torsionPoints`,
`New.ThetaTori.LatticeForm.HasShiftBound.of_isPosRiemann_sub`, `New.ThetaTori.mul_le_iSup_of_hasShiftBound`,
`New.ThetaTori.IsAmpleType.eventually_isPosRiemann_smul_sub`); `Lib/Shimura/ThetaNormality/NormalGeneration`
(`New.ThetaTori.HasGoodReduction.pow`)

### 2.2 The multiplicative norm from expanding multiplications

*Origin:* particular to this proof: a criterion for the analytic form of good reduction (2.1) of a torus with a
hermitian action at a valuation over a prime `p`, by multiplications that divide a power of `p`, are prime to their
conjugates and expand arbitrarily; the nearest published results are criteria for good reduction of abelian varieties
with many endomorphisms.

*Method of the formal proof:* (a): the theta identity 1.5 (e) for `c` writes a size at `dq` as a sum over the kernel of
`d` of differences weighted by `e(E_B(cg, cz)) − 1`, whose valuation is `< 1` because these are `p`-power roots of
unity; this gives the constant `1` on the kernel of `c`. (b): pulling back along `c` multiplies the constant by
`v(#(c⁻¹L/L))^{−2}`. (c): a fixed-point argument on the constants of the degrees `2^k B` (2.1 (e)) and the contraction
along right inverses of `F(c)` close to `0` give the equality of suprema.

Let `(R, F, B, β)` be a hermitian action on `V/L` (1.5), `L` full, and `v` a valuation of `ℂ`.
(a) Let `c ≠ 0`, `d = c̄`, with `c ≠ d`, `c` and `d` coprime, `F(c)`, `F(d)` the identity on `L^⊥/L`, `p` a prime with
`v(p) < 1`, `v(det F(d)) = 1`, and `A` a form with `E_{B−A}` positive. Then every torsion point `w` with `F(c)w ∈ L` and
`p^m w ∈ L` for some `m` has the constant `1` in degree `A`.
(b) Let `c ≠ 0` be such that every torsion `y` with `F(c)y ∈ L` has the constant `1` in every degree, and let `A` be a
form with `E_{c^*B − A}` positive, `c^*B(u, w) = B(F(c)u, F(c)w)`. If `F(c)w` has the constant `C` in degree `B`, then
`w` has the constant `C·v(#(c⁻¹L/L))^{−2}` in degree `A`.
(c) If arbitrarily close to `0` in `End_ℂ(V)` there are `e` with `F(c)e = id` for some `c ≠ 0` in `R` such that every
torsion `y` with `F(c)y ∈ L` has the constant `1` in every degree, then `L` has a multiplicative norm at `v`.
(d) Let `R` have characteristic zero, `p` be a prime with `v(p) < 1`, and `m` an integer prime to `p` with `m·L^⊥ ⊂ L`.
Suppose that arbitrarily close to `0` in `End_ℂ(V)` there are right inverses of `F(c)` for elements `c ∈ R` that are not
units, are coprime to `c̄`, divide a power of `p`, and have `v(det F(c̄)) = 1`. Then `L` has a multiplicative norm at
`v`.

*Needs:* 1.5, 2.1.

[ShortProof], `Lib/Shimura/GoodReduction/MultiplicativeNorm`
(`New.ThetaTori.IsHermitianAction.mul_normShift_eq_mul_normShift_sub_sum`,
`New.ThetaTori.IsHermitianAction.hasShiftBound_one_of_ker`, `New.ThetaTori.IsHermitianAction.hasShiftBound_of_torsionAction`,
`New.ThetaTori.IsHermitianAction.eventually_hasShiftBound`,
`New.ThetaTori.IsHermitianAction.hasMultiplicativeNorm_of_frequently_hasShiftBound`,
`New.ThetaTori.hasMultiplicativeNorm_of_expanding`)

### 2.3 Integral normal generation under good reduction

*Origin:* adapted from the theorems on projective normality of abelian varieties and on its persistence under good
reduction (S. Koizumi, *Theta relations and projective normality of abelian varieties*, Amer. J. Math. 98 (1976);
T. Sekiguchi, J. Math. Soc. Japan 29 (1977), in characteristic `p`; G. Kempf, *Multiplication over abelian varieties*,
Amer. J. Math. 110 (1988)). The version here is analytic: theta functions on a complex torus, the valuation ring of a
valuation of `ℂ` at which the torus has good reduction in the sense of 2.1 in place of a base, balls of the theta norm in
place of integral sections, and only the degrees `r^j`; the proof rests on 1.4 (b) and the multiplicative norm, not on
cohomology.

*Method of the formal proof:* the multiplicative norm gives `Ball(f)^r ⊂ Ball(f^r)`; for the converse, 1.4 (b) and the
translations by the dual lattice of `L₀ ⊃ r⁻¹L` show that `Ball(f^r)` is generated by products, and induction on `j`
gives (a). (c) counts dimensions with 1.2 (c) after the scaling of (b).

Let `(B, χ)` have good reduction at `v` with level `r` (2.1), `O` the valuation ring of `v`, and for a theta function
`f ≠ 0` let `Ball(f)` be the `O`-module of `g ∈ Θ(B, χ)` with `‖g‖_v ≤ ‖f‖_v`.
(a) Let `f ∈ Θ(B, χ)` also be a theta function of type `(B, ζ)` for Appell–Humbert data `(B, ζ)` on a full lattice
`L₀ ⊃ r⁻¹L`. Then for every `j`, the `O`-module spanned by the products of `r^j` elements of `Ball(f)` is
`Ball(f^{r^j})`, taken in degree `r^j B` (for the good reduction of 2.1 (d)).
(b) Every `g ∈ Θ(B, χ)` is `c·y` with `c ∈ ℂ`, `y ∈ Ball(f)` and `‖g‖_v = v(c)·‖f‖_v`.
(c) Let `W` be a finite `O`-module with an `O`-linear map onto `Ball(f)`, `φ : O → k` onto a field, and `W → Q` a
`φ`-semilinear map to a `k`-vector space vanishing exactly at the `w` whose image has theta norm `< ‖f‖_v`. Then the
`k`-span of its image has dimension `dim_ℂ Θ(B, χ)`.
(d) If points `p_b` meet every class of `L^⊥` modulo `L`, then an element of `Ball(f)` has theta norm `< ‖f‖_v` if and
only if, for each `b`, its value at `p_b` lies in the maximal ideal after the common scaling that makes the values at
`p_b` of all elements of `Ball(f)` integral with one of them a unit.

*Needs:* 1.2, 1.4, 2.1.

[ShortProof], `Lib/Shimura/ThetaNormality/NormalGeneration` (`New.ThetaTori.HasGoodReduction.normBall`,
`New.ThetaTori.HasGoodReduction.exists_smul_thetaNorm_eq`, `New.ThetaTori.HasGoodReduction.normBall_pow`,
`New.ThetaTori.HasGoodReduction.normBall_pow_pow`, `New.ThetaTori.HasGoodReduction.exists_eq_smul_normBall`,
`New.ThetaTori.HasGoodReduction.finrank_reduction_eq`, `New.ThetaTori.HasGoodReduction.thetaNorm_lt_iff_coords`)

## Layer 3: PEL data and theta tori

The data of the route are frames and moduli points over a CM field (3.1), PEL data with a Lagrangian subgroup of a
finite group `T` of torsion classes (3.2), and the theta tori they define, with canonical theta coordinates `θ_t`,
`t ∈ T` (3.3). Theta tori have good reduction at the primes good for the data (3.4), satisfy Riemann's theta relation
(3.5), and their theta vectors reduce, at a good prime, to a set whose ideals are cut out by the level points (3.6). PEL
data exist at every level divisible by a suitable integer (3.7).

### 3.1 Frames, similitudes and moduli points

*Origin:* definitions and conventions.

*Method of the formal proof:* (a) by the compactness of `Ô`; (b) from the discreteness of `𝓞_E` in `E ⊗ ℝ`.

Let `n` be a finite index set and `|n|` its size. `T_n = (𝔸_f/Ô)ⁿ`, an `𝓞_E`-module isomorphic to `(E/𝓞_E)ⁿ`; for
`g ∈ GL_n(𝔸_f)` and `y ∈ Eⁿ`, `[y]_g ∈ T_n` is the class of `g⁻¹y`. `x ∈ GL_n(𝔸_f)` is a *frame* for `β ∈ M_n(E)` if
`xᴴβx = ε·1` with `ε ∈ Ẑ^×`. The *unitary similitudes* `GU ⊂ GL_n(𝔸_f)` are the `g` with `c·gᴴg = ε·1` for some
rational `c > 0` and `ε ∈ Ẑ^×`; `GU⁺ ⊂ GU` is the monoid of those with `g^{−1} ∈ M_n(Ô)`. For `𝔑 ≠ 0` in `𝓞_E` the
*principal level* is `K(𝔑) = GU ∩ {g ∈ GL_n(Ô) : g ≡ 1 mod 𝔑}`. A *reflection* is a matrix `J = uwᵀ − 1 ∈ M_n(ℂ)` with
`wᵀu = 2` (it is `1` on a line and `−1` on a complement). `(x, J)` is a *signed frame* if `x` is a frame for some
`β ∈ M_n(E)` with `Φ_w(β)` positive definite for every infinite `w ≠ v₀` and `Φ_{v₀}(β)J` positive definite. A *moduli
point* with `ν` marked vectors is `a = (x, J, P)` with `(x, J)` a signed frame, `J` a reflection and
`P = (P_1, …, P_ν) ∈ ((E ⊗ ℝ)ⁿ)^ν`. For `g ∈ GU⁺` and `α ∈ 𝓞_E^ν`, `a·(g, α) = (xg, J, (α_i P_i)_i)`. For a subgroup
`K ⊂ GL_n(𝔸_f)`, `z ∈ GL_n(E)` is an *isomorphism `a ≅_K b` at level `K`* if `x_b^{−1} z x_a ∈ K`,
`Φ_{v₀}(z) J_a Φ_{v₀}(z)^{−1} = J_b`, and `zP_{a,i} − P_{b,i}` lies in the image of `Eⁿ ∩ x_b Ôⁿ` for each `i`. A
*period map for `J`* is an `ℝ`-linear isomorphism `Q : (E ⊗ ℝ)ⁿ → V` that carries the complex structure `iJ` at `v₀`
(through `Φ_{v₀}`) and `i` at the other infinite places to multiplication by `i`.
(a) Every `𝓞_E`-linear map `Eⁿ → T_n` is `y ↦ class of hy` for some `h ∈ M_n(𝔸_f)`.
(b) For `x ∈ GL_n(𝔸_f)` the image of `Eⁿ ∩ xÔⁿ` in `(E ⊗ ℝ)ⁿ` is a full lattice; for a period map `Q`,
`dim_ℂ V = |n|·f`.

*Needs:* AdelicUnitaryGroupsAndAlgebraicModularForms §2.1 (the adeles).

[ShortProof], `Lib/Shimura/Uniformisation/AdelicFrames` (`New.CMBase`, `New.AdelicTorsion`, `New.Variety.IsFrameFor`,
`New.Variety.GU`, `New.Variety.GUPlus`, `New.Variety.IsSignedFrame`, `New.Variety.ModuliPoint`,
`New.Variety.ModuliPoint.act`, `New.Variety.ModuliPoint.IsLevelIso`, `New.Variety.IsPeriodMap`,
`New.Variety.exists_matrix_torsionClass_eq`, `New.Variety.IsPeriodMap.finrank_eq_abelianDim`);
`Lib/Shimura/HeckeTower/HeckeData` (`New.Variety.levelGU`)

### 3.2 PEL data and good primes

*Origin:* definitions and conventions.

*Method of the formal proof:* none (definitions).

The data below describe theta-embedded families of abelian varieties with `𝓞_E`-action of signature `(1, n − 1)` at
`v₀` and definite elsewhere, with a theta structure on a finite group `T` of odd order, and the numerical conditions
that the construction needs. *PEL data* `D` over `E` consist of: `β ∈ 𝓞_E` with `β̄ = 1 − β`; a level `𝔑 ∈ 𝓞_E`, `𝔑 ≠ 0`; `ξ ∈ E` with `Φ_v(ξ)`
purely imaginary with positive imaginary part for every infinite `v`; a rank `n ≥ 1` (indices `1, …, n`); integers
`r ≥ 3` and `i ≥ 0`; and subgroups `Λ ⊂ T ⊂ T_n` such that:
- `T` is the set of classes `[y]` with `ψ_f(ξ·zᴴy) = 1` for every integral `z ∈ Ôⁿ`, and `#T` is odd;
- `Λ` is its own annihilator: `[y] ∈ Λ` if and only if `ψ_f(ξ·zᴴy) = 1` for all `z` with `[z] ∈ Λ`; and `Λ` contains
  every class killed by `r`;
- (*degree bound*) every monomial ideal in variables indexed by `T` that omits at most `σ_j` monomials of degree `r^j`
  for each `j ≤ i` does so for every `j`, where `σ_j = ⌊√#{y ∈ T_n : r^j y ∈ T}⌋`;
- for `j ≤ i`, every `y ∈ T_n` with `r^j y ∈ T` is killed by `𝔑`;
- (*paddings*) for `c = 1` and `c = β`: `r = c̄c + 3 + Σ_{l=1}^{r−3} ā_l a_l` for some `a_l ∈ 𝓞_E` that span `𝓞_E`
  over `ℤ`;
- `Φ_v(β) = Φ_{v₀}(β̄)` for every infinite `v ≠ v₀`, and `Φ_{v₀}(β̄) ≠ Φ_{v₀}(β)`.
`D` is *good* at an ideal `w` of `𝓞_E` if `r ∉ w`, `#T ∉ w`, and there are a prime number `p ∈ w` and `b ∈ ℤ` with
`β − b ∈ w`, `β − b` and `β̄ − b` coprime, `(𝔑) + w·(p, β̄ − b) = 𝓞_E`, and some finite place `v ≠ w` containing `p`
and `β − b`. For a subring `R ⊂ E` containing `𝓞_E`, `D` is *good over `R`* if it is good at the contraction to `𝓞_E`
of every maximal ideal of `R`. Write `T[r]` for the `r`-torsion of `T`.

*Needs:* 3.1.

Relation to PELModuli §M5.5 (unitary PEL data): `ξ` plays the part of `δ` there (`ξ̄ = −ξ` and `Im Φ_v(ξ) > 0` for every
`v`), and for a matrix `β_Y` with a frame `g` (3.3) the form `Tr_{E/ℚ}(ξ·zᴴβ_Y y)` on `Eⁿ` is the scalar form `ψ` of
§M5.5 for the hermitian form `(y, z) ↦ zᴴβ_Y y`; for a theta torus this form has signature `(1, n − 1)` at `Φ_{v₀}` and is
positive definite at the other places of the CM type. PEL data in the sense here fix no hermitian space, since the
frames and the matrices `β_Y` vary, and they add to the field, the CM type and `ξ` the level `𝔑`, the group `T` with its
Lagrangian `Λ` and the numerical conditions of the construction. No target of this roadmap compares the two further.

[ShortProof], `Lib/Shimura/ThetaModuli/PELThetaTori` (`New.PEL`, `New.Variety.HasPadding`, `New.PEL.levelTorsion`,
`New.PEL.IsGoodAt`, `New.PEL.rTorsion`); `Lib/Shimura/ThetaModuli/FlatClosure` (`New.Variety.ThetaNull.IsCutDegree`,
`New.Variety.ThetaNull.thetaRanks`); `Lib/Shimura/ThetaModuli/UniversalFamily` (`New.Variety.ThetaNull.IsGoodOver`)

### 3.3 Theta tori and their theta coordinates

*Origin:* particular to this proof: canonical theta coordinates, indexed by the finite group `T`, on complex tori with
`𝓞_E`-action defined by a frame and a reflection, with the theta law under translations by rational points; the nearest
published notion is Mumford's theta structure on a polarised abelian variety.

*Method of the formal proof:* the dual of a lattice over a group of classes is computed with the adelic pairing; the
multiplier is the canonical multiplier of 1.3 (b) for `b = β₁`, which is adjoint-half because `β + β̄ = 1`; the theta
functions for the lattice over the Lagrangian `Λ` form a line by 1.2 (c), since `Λ` is its own annihilator; the theta
law is the Heisenberg law 1.3 (c).

Let `D` be PEL data, `g ∈ GL_n(𝔸_f)`, `ℓ` a complex matrix and `V` a complex vector space. A *polarised period map* for
`(g, ℓ)` is a matrix `β_Y ∈ M_n(E)` for which `g` is a frame, a period map `Q : (E ⊗ ℝ)ⁿ → V` for `ℓ` (3.1), and a form
`B` on `V` with `Re B` symmetric, positive Riemann form, and `E_B(Qy, Qz) = Σ_v 2 Re(Φ_v(ξ)·Φ_v(z)ᴴΦ_v(β_Y)Φ_v(y))` for
`y, z ∈ (E ⊗ ℝ)ⁿ`; on `Eⁿ` this is `Tr_{E/ℚ}(ξ·zᴴβ_Y y)`. `𝓞_E` acts on `V` through `Q`. It is a *theta torus* if
moreover `ℓ` is a reflection, `B(cy, z) = B(y, c̄z)` for `c ∈ 𝓞_E`, and in suitable complex coordinates
`V ≅ ℂ × ℂ^{n−1} × ∏_{w ≠ v₀} ℂⁿ` each `c ∈ 𝓞_E` acts by `Φ_{v₀}(c)` on the line, `conj Φ_{v₀}(c)` on `ℂ^{n−1}` and
`Φ_w(c)` on the factor of `w`. For a subgroup `S ⊂ T_n` let `Λ_S = Q({y ∈ Eⁿ : [y]_g ∈ S})`; `Λ_0` is the *period
lattice*. Let `β₁ = #T·β − ⌊#T/2⌋` and `χ_D(u) = exp(πi E_B(β₁u, u))`.

Let `Y = (β_Y, Q, B)` be a polarised period map for `(g, ℓ)`.
(a) `Λ_0` and `Λ_Λ` are full lattices, `[Λ_{S′} : Λ_S] = [S′ : S]` for `S ⊂ S′`, and the vectors of
`Λ_{T_n}` in the dual of `Λ_S` for `E_B` form `Λ_{S′}`, `S′` the annihilator of `S` for `(y, w) ↦ ψ_f(ξ·wᴴy)`. In
particular the dual lattice of `Λ_0` is `Λ_T`, and `#T·Λ_T ⊂ Λ_0`.
(b) `(B, χ_D)` are Appell–Humbert data for every sublattice of `Λ_Λ`, in particular for `Λ_0`.
(c) The theta functions of type `(B, χ_D)` for `Λ_Λ` form a line; let `ϑ` be a generator. For `t ∈ T` let
`θ_t = N_{a_t}ϑ`, the normalised translate (1.3, with `b = β₁`) by `a_t = Q(y)` for a representative `y ∈ Eⁿ` of `t`;
it does not depend on the representative. Each `θ_t` is a nonzero element of `Θ(B, χ_D)` for `Λ_0`, and `θ_s = θ_0`
for `s ∈ Λ`.
(d) (*theta law*) For `y ∈ Eⁿ` with `[y]_g = s ∈ T` and `u = Q(y)`: `U_u θ_t = χ_D(u)·c_u(t)·θ_{s+t}`, where
`c_u(t) = e(E_B(β₁u, a_t))` is a character of `T`, and `c_{a_s}(−t) = c_{a_t}(s)`; both `χ_D(u)` and `c_u(t)` are roots
of unity.
(e) There is `ε ∈ ℂ` with `θ_t(−z) = ε·θ_{−t}(z)` for all `z`, `t`.
(f) The `θ_t`, `t ∈ T`, have no common zero.

*Needs:* 1.1, 1.2, 1.3, 3.1, 3.2.

[ShortProof], `Lib/Shimura/ThetaModuli/PELThetaTori` (`New.ThetaTori.PeriodMap`, `New.ThetaTori.ThetaTorus`,
`New.Variety.polarisationForm`, `New.ThetaTori.PeriodMap.latticeOver`, `New.ThetaTori.PeriodMap.relIndex_latticeOver`,
`New.ThetaTori.PeriodMap.dualLattice_inf_latticeOver_top`, `New.ThetaTori.PeriodMap.dualLattice_periodLattice`,
`New.ThetaTori.PeriodMap.isAppellHumbert_of_le`, `New.ThetaTori.PeriodMap.exists_generator_thetaSpace`,
`New.ThetaTori.PeriodMap.thetaCoord`, `New.ThetaTori.PeriodMap.thetaCoord_eq_normalizedShift`,
`New.ThetaTori.PeriodMap.thetaShift_thetaCoord`, `New.ThetaTori.PeriodMap.bicharacter_neg_eq_swap`,
`New.ThetaTori.PeriodMap.exists_thetaCoord_sign_smul`, `New.ThetaTori.PeriodMap.thetaCoord_vector_ne_zero`,
`New.ThetaTori.PeriodMap.valuation_multiplier_mul_bicharacter_eq_one`); `Lib/Shimura/ComplexTheta/AppellHumbertData`
(`New.IsAppellHumbert.exp_riemannForm_pow_eq_one`)

### 3.4 Good reduction of theta tori at good primes

*Origin:* particular to this proof: theta tori have good reduction in the analytic sense of 2.1 at every valuation of
`ℂ` over a prime good for `D`, and `#T` is a unit there; the nearest published result is the good reduction of unitary
PEL abelian varieties with many endomorphisms (properness of PEL moduli spaces in the compact case: K.-W. Lan,
*Elevators for degenerations of PEL structures*, Math. Res. Lett. 18 (2011); R. Kottwitz, *Points on some Shimura
varieties over finite fields*, J. Amer. Math. Soc. 5 (1992), §5; in the CM case B. Conrad, *Semistable reduction for
abelian varieties* (notes), Prop. 6.3, after Serre and Tate, Ann. of Math. 88 (1968)).

*Method of the formal proof:* averaging `B` over multiplication by `i` gives a positive hermitian form with the same
Riemann form, for which `𝓞_E` with `β` is a hermitian action, so 1.5 applies; 2.2 (d) is applied with `c = ā`, where
`a` generates a high power of the second place `v ≠ w` that goodness provides (containing `p` and `β − b`) and is large
at all complex embeddings; `#T·Λ_T ⊂ Λ_0` gives the integer `m` of 2.2 (d).

Let `Y` be a theta torus for PEL data `D`, `B` its form and `χ_D` its multiplier (3.3).
(a) At the trivial valuation, `(B, χ_D)` have good reduction for `Λ_0` with level `r`.
(b) Let `v` be a valuation of `ℂ` with valuation ring `O_v`, and `ρ : 𝓞_E → O_v` a ring homomorphism with
`ρ(c) = Φ_{v₀}(c)`, such that `D` is good at `ρ^{−1}(𝔪_v)`. Then `(B, χ_D)` have good reduction at `v` with level `r`,
and `v(#T) = 1`.

*Needs:* 1.5, 2.1, 2.2, 3.2, 3.3.

[ShortProof], `Lib/Shimura/GoodReduction/MultiplicativeNorm`
(`New.ThetaTori.ThetaTorus.hasGoodReduction_and_val_card_eq_one`); `Lib/Shimura/ThetaModuli/PELThetaTori`
(`New.ThetaTori.PeriodMap.hasGoodReduction_one`)

### 3.5 Riemann's theta relation

*Origin:* adapted from Riemann's theta formula and its generalisations (C.-L. Chai, *Riemann's theta formula* (2014),
Theorem 1.2; A. Nagano, *On Riemann type relations for theta functions on bounded symmetric domains of type I*, arXiv
2301.09243 (2023), Theorem 1.1; D. Mumford, *On the equations defining abelian varieties I*, Invent. Math. 1 (1966), §3;
G. Kempf, *Linear systems on abelian varieties*, Amer. J. Math. 111 (1989), 65–94). The identity here is derived from
1.4; its coefficients `a_k, b_k` are integers of `E`, where the classical formula has an orthogonal matrix with entries
`±1/2`; and it links products of theta coordinates of one theta torus taken at the points `a_k z + b_k w`, of total
degree `r` in the sense that `Σ ā_k a_k = r`.

*Method of the formal proof:* the product `P(μ; z)` transforms under the twisted translations of degree `rB` like a theta
function whose index is shifted by `Σ āμ`, by the theta law 3.3 (d); the relation is then 1.4 (a) applied in degree
`rB` to the orbit of `T` acting through the coefficients.

Let `Y` be a theta torus for `D`, with theta coordinates `θ_s`, `s ∈ T`. For a finite set `K` and
`p = (a_k, b_k)_{k ∈ K}` in `𝓞_E × 𝓞_E` with `Σ_k ā_k a_k = r` and `Σ_k ā_k b_k = 0` (a *Riemann tuple*), for
`μ : K → T` and `w ∈ V`, let `P_p(μ; z) = Π_k θ_{μ_k}(a_k z + b_k w)`. Let `p`, `q = (a′_k, b′_k)` be Riemann tuples and
`μ, μ′ : K → T` with `Σ_k ā_k μ_k = Σ_k ā′_k μ′_k`. Then for all `z ∈ V`:
`#T · P_q(μ′; 0) · P_p(μ; z) = √[T : T[r]] · Σ_{s ∈ T} P_p(μ − a·s; 0) · P_q(μ′ + a′·s; z)`,
both products taken at the same `w`, where `(μ − a·s)_k = μ_k − a_k s`.

*Needs:* 1.4, 3.3.

[ShortProof], `Lib/Shimura/ThetaNormality/RiemannRelation` (`New.ThetaTori.ThetaTorus.IsRiemannTuple`,
`New.ThetaTori.ThetaTorus.thetaProduct`, `New.ThetaTori.ThetaTorus.thetaShift_thetaProduct`,
`New.ThetaTori.ThetaTorus.thetaShift_periodPoint_thetaProduct`, `New.ThetaTori.ThetaTorus.riemann_relation`,
`New.paddingTuple`)

### 3.6 The reduced theta vectors are cut out by the level points

*Origin:* particular to this proof: when the torus has good reduction at the valuation, the values of the integral forms
of degree `r^j` in the theta coordinates fill exactly a ball of the theta norm, and the ideal of the reduced theta
vectors is cut out, in the degrees `r^j`, by the reduced theta vectors of the level points with the expected ranks; the
nearest published results are the equations of abelian varieties in theta coordinates.

*Method of the formal proof:* (a) from 2.3 (a), the coordinates being translates of one function by representatives of
the dual lattice; (b) from the theta law and the multiplicativity of the norm; (c) from 2.3 (c), (d), the level points
representing `Λ_0^⊥` modulo `Λ_0` in the degrees `r^j`, `j ≤ i`, and the paddings (Riemann tuples) to pass between
degrees.

An ideal `I` of `k[X_j : j ∈ J]` (`k` a field, `J` finite) is *cut out in the chart `c ∈ J` by points `p_a ∈ k^J` with
ranks `σ` up to `i`* if `X_c − 1 ∈ I`, the forms of degree `r^j` span a space of dimension `σ_j` modulo `I` for every
`j`, and for `j ≤ i` a form of degree `r^j` lies in `I` if and only if it vanishes at all `p_a`. For linear systems
`N_a` on a scheme `S` with coordinates indexed by `J`, a point `t ∈ S(k)` and a set `Z ⊂ k^J`, the ideals of `Z` are
*cut out at `t` by the `N_a`* if for every choice of charts `l_a` of the `N_a` containing `t` and every `c ∈ J`, the
ideal of the polynomials vanishing at all `v/v_c`, `v ∈ Z` with `v_c ≠ 0`, is cut out in the chart `c` by the affine
coordinates of the `N_a` at `t` in the charts `l_a`.

Let `Y` be a theta torus for `D` with theta coordinates `θ_t`, `v` a valuation of `ℂ` at which `(B, χ_D)` have good
reduction with level `r`, and `O_v` its valuation ring.
(a) For every `c ∈ T` and `j`, the `O_v`-module of values `F(θ)`, `F` running over the forms of degree `r^j` over `O_v`
in variables indexed by `T`, is `Ball(θ_c^{r^j})` (2.3).
(b) If `v(#T) = 1`, then for every `s ∈ T` there is `u ∈ T` such that `θ_u(0)`, `θ_{−u}(0)` and `θ_{s−u}(0)` have the
largest valuation among the `θ_t(0)`.
(c) Let `φ : O_v → k` be onto a field, for `z ∈ V` let `q(z) ∈ O_v^T` be integral homogeneous coordinates of
`(θ_t(z))_t` with a unit entry, and for each level point `l` (a class killed by `𝔑`) let `p(l)` be such coordinates of
`(θ_t(a_l))_t`. Let `N_l` be linear systems on a scheme `S` with coordinates indexed by `T` and `t ∈ S(k)` a point at
which `N_l` has homogeneous coordinates `φ(p(l))`. Then the ideals of `{φ(q(z)) : z ∈ V}` are cut out at `t` by the
`N_l`, with ranks `σ` (3.2) up to `i`.

*Needs:* 2.3, 3.2, 3.3, 3.4, 3.5.

[ShortProof], `Lib/Shimura/ThetaModuli/PELThetaTori` (`New.ThetaTori.PeriodMap.formSpan_eq_normBall`,
`New.ThetaTori.PeriodMap.thetaNorm_thetaCoord`); `Lib/Shimura/ThetaNormality/RiemannRelation`
(`New.ThetaTori.ThetaTorus.exists_forall_valuation_thetaCoord_zero_le`, `New.ThetaTori.ThetaTorus.isCutOutAt_reduction`);
`Lib/Shimura/ThetaModuli/FlatClosure` (`New.Variety.ThetaNull.IsCutOut`, `New.Variety.ThetaNull.IsCutOutAt`)

### 3.7 Existence of PEL data

*Origin:* particular to this proof: existence of the PEL data of 3.2 with `β = β₀`, of any rank, at every nonzero level
divisible by a suitable integer avoiding a given finite set of places, good at all safe places (8.1); the nearest
published inputs are the existence of Lagrangian subgroups and of CM types with prescribed behaviour.

*Method of the formal proof:* an isotropic subset of a finite group with a nondegenerate pairing lies in a
self-annihilating subgroup; `ξ` is chosen with the prescribed signs, and the paddings and the degree bound are
satisfied by taking `r` and `i` large (FlatClosure's finiteness of degree bounds); the integer `N` collects the bad
primes.

Let `d ≡ 3 (mod 4)`, let `E ⊃ ℚ(√−d)` be a CM field containing the `5040`-th roots of unity, `n ≥ 1`,
`σ : E → ℂ` an embedding and `B` a finite set of finite places of `E`. Then there are a CM type with base place `v₀` with
`Φ_{v₀} = σ` and `Φ_v|_{ℚ(√−d)} ≠ Φ_{v₀}|_{ℚ(√−d)}` for `v ≠ v₀`, and an integer `N ≥ 1` lying in no place of `B`, such
that for every `𝔑 ≠ 0` in `𝓞_E` divisible by `N` there are PEL data of rank `n` and level `𝔑` with `β = β₀` (for
`d₀ = d`) that are good at every finite place safe for `𝔑` (8.1). Also: in a finite abelian group with a nondegenerate
alternating-type pairing of the kind of 3.2, every isotropic subset lies in a subgroup equal to its own annihilator.

*Needs:* 3.2, 8.1 (safe places, as a definition).

[ShortProof], `Lib/Shimura/IntegralModel/PELDataExistence` (`New.Variety.exists_lagrangian`, `New.Variety.IsSafeGoodPEL`,
`New.Variety.exists_pel`)

## Layer 4: Abelian schemes, line bundle classes and theta structures

This layer is the algebraic geometry over a base that the construction uses: abelian schemes and the pairing attached to
a line bundle class (4.1, 4.2), quasi-finite homomorphisms (4.3), coordinates at the origin and infinitesimal points
(4.4), and lifts of translations to sections with theta structures and their rigidity (4.5).

### 4.1 Abelian schemes and the pairing of a line bundle class

*Origin:* definitions and conventions.

*Method of the formal proof:* (b) the fibre over the zero section of a finite morphism to a separated group scheme is
affine and finite; (c) global functions on an integral abelian variety over a field are constant, and this passes to an
affine base change.

A *commutative group scheme* over `S` is a commutative group object of schemes over `S`, written additively; an *action*
of a commutative ring `O` on it is a ring homomorphism from `O` to its endomorphisms. An *abelian scheme* over `S` is a
commutative group scheme that is smooth and proper over `S` and on which multiplication by every integer `m ≠ 0` is
surjective. (This is the usual notion. AbelianSchemesAndArithmeticModuli §A0.1 defines abelian schemes with
geometrically connected fibres in place of the surjectivity of every `[m]`, and without commutativity in the structure;
the two definitions give the same objects. A geometric fibre that is not connected has a nontrivial finite group of
components, which `[m]` kills for `m` its order, so surjectivity of every `[m]` forces connected geometric fibres;
conversely an abelian scheme of §A0.1 is commutative by §A1.2 (2), and on it `[m]`, `m ≠ 0`, is finite locally free of
positive rank by §A3.2 (1), hence surjective.) A
*homomorphism* is a morphism compatible with addition; an *isogeny* is a homomorphism that is finite, flat and
surjective. For a class `c ∈ Pic(A)` and `T`-points `x, y` of `A`, `x^*c ∈ Pic(T)` and
`⟨x, y⟩_c = (x + y)^*c − x^*c − y^*c + 0^*c ∈ Pic(T)`; `c` satisfies the *parallelogram law* if
`(x + y)^*c + (x − y)^*c + 2·0^*c = 2(x^*c + y^*c)` for all `T` and all `T`-points `x, y`.
(a) The base change of an abelian scheme along any `S′ → S` is an abelian scheme, with the induced action of `O`.
(b) Let `B` be a separated commutative group scheme over `Spec R` and `f : A → B` a finite morphism. The fibre of `f`
over the zero section is `Spec` of a finite `R`-algebra, flat if `f` is flat.
(c) Let `A` be an integral abelian scheme over a field `k` and `X = A ×_k Spec C`. A regular function on `X` takes equal
values at any two ring-valued points of `X` with the same image in `Spec C`.

*Needs:* Mathlib (`AlgebraicGeometry.Smooth`, `AlgebraicGeometry.IsProper`, group objects in `Over S`).

[ShortProof], `Lib/Shimura/AbelianScheme/Basic` (`New.AddObj`, `New.ModuleObj`, `New.IsAbelianScheme`, `New.IsIsogeny`,
`New.IsGroupBaseChange`, `New.Pic.atPoint`, `New.Pic.pairing`, `New.Pic.ParallelogramLaw`,
`New.Variety.exists_finite_kernel_ring`, `New.Variety.hasConstFunctions_of_isPullback`); `Lib/Shimura/AbelianScheme/Pairings`
(`New.Variety.isGroupBaseChange_counit`)

### 4.2 Classes with the parallelogram law

*Origin:* adapted from the published theory of line bundles on abelian schemes (theorem of the cube and its
consequences): here for classes that satisfy the parallelogram law, with a quasi-finiteness criterion and a descent of
identities between pairings along fpqc covers.

*Method of the formal proof:* (a) a positive-dimensional fibre of `f` would carry a nonzero multiple of an ample class
pulled back from a point; (c) by induction on `m` from the parallelogram law, the classes pulled back from the local
base being zero; (d) by descent of classes along `f × 1`, using that a frame of a class trivial on `A × A′` differs at
two points with the same image by a factor independent of the second coordinate.

Let `A` be a commutative group scheme over `S` and `c ∈ Pic(A)`.
(a) Let `N` be a projective embedding of `A` over `S`, `B` separated over `S`, and `f : A → B` an `S`-morphism with
`f^*c′ = m[N]` for some `c′ ∈ Pic(B)` and `m ≠ 0`. Then `f` is locally quasi-finite.
(b) `⟨x, y⟩_c = ⟨y, x⟩_c`, and `⟨x, y⟩_{f^*c} = ⟨fx, fy⟩_c` for a homomorphism `f`. If `c` satisfies the parallelogram
law, then `⟨mx, y⟩_c = m⟨x, y⟩_c = ⟨x, y⟩_{mc}` for `m ∈ ℕ`.
(c) If `S = Spec R` with `R` local and `c` satisfies the parallelogram law, then `[m]^*c = m²c` for every `m ∈ ℕ`.
(d) Let `A′` be the base change to `S` of an integral abelian variety over a field, `f : A → A₁` flat, surjective and
quasi-compact, `a, a′` morphisms from `A₁`, `b, b′` homomorphisms from `A′`, and `c, c′` classes on their targets. If
`⟨a(fx), b(y)⟩_c = ⟨a′(fx), b′(y)⟩_{c′}` for all points `x` of `A` and `y` of `A′`, then
`⟨a(x), b(y)⟩_c = ⟨a′(x), b′(y)⟩_{c′}` for all points `x` of `A₁` and `y` of `A′`.

*Needs:* 4.1.

Relation to AbelianSchemesAndArithmeticModuli §A1.5 (the theorem of the cube): there `[n]^*L ≅ L^{n²}` is proved for a
symmetric rigidified `L` on an abelian scheme over any base, and the sum–difference statement of §A1.5 is the
parallelogram law for such `L`. Here the last assertion of (b) and (c) assume the parallelogram law instead and hold for
every commutative group scheme. On an abelian scheme over a local base the two agree: a class with the parallelogram
law is symmetric (take `x = 0`), every class is rigidified there, and (c) is then the symmetric case of §A1.5.

[ShortProof], `Lib/Shimura/AbelianScheme/Pairings` (`New.Variety.locallyQuasiFinite_of_pull_picClass`,
`New.Variety.pairing_comm`, `New.Variety.pairing_comp`, `New.Pic.ParallelogramLaw.pairing_nsmul_left`,
`New.Pic.ParallelogramLaw.nsmul_pairing_eq_pairing_nsmul`, `New.Variety.pull_nsmul_eq_sq_smul`,
`New.Variety.eq_pull_zero_section`, `New.Variety.pairing_eq_of_fpqc_cover`)

### 4.3 Quasi-finite surjective homomorphisms of abelian schemes are isogenies

*Origin:* adapted from the theory of isogenies of abelian schemes (B. Edixhoven, G. van der Geer, B. Moonen, *Abelian
Varieties* (draft), ch. IV §3, (5.1)–(5.2), ch. VI §1; The Stacks project, Section 0BF9; EGA IV; S. Bosch,
W. Lütkebohmert, M. Raynaud, *Néron Models* (1990), 7.3, 8.1): here over a local base, with quasi-finiteness as the
hypothesis.

*Method of the formal proof:* properness and local quasi-finiteness give finiteness (Zariski's main theorem, in
Mathlib); flatness is proved by descent along the fpqc cover `(a, d) ↦ f(a) + u(d)` of `B`, for a flat map `u` from a
local `R`-algebra whose maximal ideal is generated by that of `R`, where the pull-back of `f` is flat by a fibrewise
criterion. For multiplication by `a`, which divides its norm `N`: `[N]` pulls the class of the embedding back to `N²`
times itself (4.2 (c)), so it is locally quasi-finite (4.2 (a)) and surjective, and both properties pass to `a`.

Let `R` be a local ring, `A` and `B` abelian schemes over `Spec R`, and `f : A → B` a homomorphism that is surjective and
locally quasi-finite. Then `f` is finite and flat, so an isogeny. In particular, let `A` be an abelian scheme over a local
ring with an action of `𝓞_E` and a projective embedding whose class satisfies the parallelogram law (4.1); then
multiplication by every nonzero `a ∈ 𝓞_E` is an isogeny of `A`. The formal proof proves this for the abelian scheme of
an object of a theta family (6.1).

*Needs:* 4.1, 4.2; AbelianSchemesAndArithmeticModuli §A3.1 (isogenies over a base, the field case of flatness); Mathlib
(`AlgebraicGeometry.IsFinite.of_isProper_of_locallyQuasiFinite`).

The factorisation of homomorphisms through an isogeny that [ShortProof] proves beside this (over an Artinian base) is
in the library (see the closing list). The use is at a field, at the dual numbers over a field, and over every local
ring.

[ShortProof], `Lib/Shimura/AbelianScheme/IsogenyFlatness` (`New.Variety.flat_left_of_isPullback_flat`,
`New.Variety.flat_of_isPullback_of_map_maximalIdeal_eq`, `New.Variety.isIsogeny_of_locallyQuasiFinite`);
`Lib/Shimura/HeckeTower/Model` (`New.ThetaObject.isIsogeny_smul_id`)

### 4.4 Coordinates at the origin, infinitesimal points and unramified torsion

*Origin:* adapted from the published theory of the formal group and the Lie algebra of a smooth group scheme: here
through étale coordinates evaluated on points that vanish modulo a square-zero ideal, with a rank-one signature
condition for an action of a ring.

*Method of the formal proof:* étale coordinates come from the local structure of smooth morphisms; on infinitesimal
points the coordinates are additive and the action is linear; for (f), (e) applied to the section along its zero locus
shows that the ideal `I` of that locus is contained in `I²`, and Nakayama's lemma gives `I = 0`.

A *square-zero extension* is a surjective ring homomorphism `ψ : C → C′` whose kernel has square zero; a `C`-point `y` of
a group scheme `A` is *infinitesimal for `ψ`* if its image in `A(C′)` is `0`. For regular functions `z_1, …, z_g` on an
open `U ⊂ A` containing the zero point, `dz(y) = (z_i(y) − z_i(0))_i`. The `z_i` are *étale coordinates* on `U` if along
every square-zero extension a point in `U` lifts uniquely with prescribed lifts of the values `z_i`. Over
`s : Spec B → S`, with an action of `O` on `A`, `(U, z, m)` is a *Lie chart* with matrices `m(a) ∈ M_g(B)` if the `z_i`
are étale coordinates, and for every `φ : B → C` and every square-zero `C → C′`, the zero `C`-point lies in `U`, and on
infinitesimal points `dz(y + x) = dz(y) + dz(x)` and `dz(ay) = φ(m(a))·dz(y)`. For `ρ : O → B` and `b, b′ ∈ O`, the
matrices satisfy the *signature condition* if some vector `X` with a unit entry has `m(a)X = ρ(a)X` for all `a` and
`m(b) − ρ(b′)·1 = Xξᵀ` for some vector `ξ`.
(a) If `A → S` is smooth of relative dimension `d`, every point of `A` has a neighbourhood with `d` étale coordinates.
(b) If `A` is a commutative group scheme with `O`-action, smooth of relative dimension `g`, and `s : Spec B → S` with `B`
local, there are `U`, `z_1, …, z_g` and matrices `m(a)` forming a Lie chart over every `Spec C → Spec B → S`, with the
matrices `φ(m(a))`.
(c) For étale coordinates on `U` containing the zero point and a square-zero `ψ`, each vector with entries in `ker ψ` is
`dz(y)` for exactly one infinitesimal `y`.
(d) If ring maps `σ_k : B → D` have no common nonzero kernel element and the signature condition holds after each
`σ_k`, it holds after every `φ : B → C` to a local ring with `φ(ρ(b) − ρ(b′))` a unit.
(e) Let `A → S` be smooth of constant relative dimension and `y` infinitesimal over a point that factors through a local
`Spec B`. If `m` is a unit in `C` and `my = 0`, then `y = 0`; if `m = 0` in `C`, then `my = 0`.
(f) Let `A` be an abelian scheme of relative dimension `g` over a local ring `R` and `m` a unit of `R`. A section `x`
with `mx = 0` that vanishes at some point `Spec K → Spec R`, `K ≠ 0`, is zero.

*Needs:* 4.1; Mathlib (`AlgebraicGeometry.SmoothOfRelativeDimension`).

[ShortProof], `Lib/Shimura/AbelianScheme/TangentCoordinates` (`New.IsSqZeroExt`, `New.IsInfinitesimal`,
`New.tangentCoords`, `New.IsEtaleChart`, `New.IsLieChart`, `New.HasSignature`, `New.exists_isEtaleChart`,
`New.exists_isLieChart`, `New.IsEtaleChart.existsUnique_tangentCoords_eq`, `New.HasSignature.of_points`,
`New.IsInfinitesimal.eq_zero_of_isUnit_and_nsmul_eq_zero_of_cast_eq_zero`,
`New.Variety.eq_zero_of_nsmul_eq_zero_of_comp_eq_zero`)

### 4.5 Lifts of translations and rigidity of theta structures

*Origin:* adapted from the theory of theta groups and theta structures on abelian varieties (D. Mumford, *On the
equations defining abelian varieties I*, Invent. Math. 1 (1966), §§1–2): here the lift of a
translation to the sections of a linear system exists exactly over `K([N])`, a theta structure is a linear system whose
coordinates are permuted by lifts of `y ↦ ±y + η(s)` up to characters, and theta structures are rigid along
homomorphisms.

*Method of the formal proof:* a lift is pull-back of sections followed by an isomorphism of line bundles, which exists
exactly when the classes agree; over a local ring the class `t_z^*[N] − [N] = ⟨z, id⟩` decides it. Rigidity: the lift of
`f` intertwines the two actions of the theta characters, so by the irreducibility of the action of `H` (an orthogonality
of characters, `#H` odd and invertible) it maps coordinates to a common multiple of coordinates.

Let `X, X′` be schemes over rings `R, R′`, `f : X′ → X` over a ring map, `L` and `L′` line bundles. A map
`Φ : H⁰(X, L) → H⁰(X′, L′)` is a *lift of `f`* if it is pull-back along `f` followed by an isomorphism `f^*L ≅ L′`. For
an `R`-point (section) `z` of a commutative group scheme `A` over `R`, a *lift of the translation `t_z`* to `L` is an
`R`-linear endomorphism of `H⁰(A, L)` that is a lift of `t_z` with `L′ = L`. For a linear system `N` on `A` with
coordinates `X_t` indexed by a finite abelian group `H` whose order is a unit of `R`, a homomorphism
`η : H → A(R)`, characters `c(s) : H → R^×` with `c(s)(−t) = c(t)(s)`, and a subgroup `Λ ⊂ H`, `N` is a *theta
structure* if for every `s ∈ H` and sign `±`, the map `y ↦ ±y + η(s)` has a lift to `N` sending `X_t` to
`c(s)(t)·X_{±(s+t)}`, `X_s = X_0` for `s ∈ Λ`, and `Σ_{l ∈ Λ} c(s)(l)² = 0` for `s ∉ Λ`.
(a) A lift of `f` from `L` to `L′` exists only if `[L′] = f^*[L]`; if `X′`, `X` are over the same ring `R` and `f` is an
`R`-morphism with `[L′] = f^*[L]`, an `R`-linear lift exists; a lift along a quasi-compact scheme-theoretically dominant
`f` is injective; two lifts are proportional (by an element of `R′`) when `X′` is a commutative group scheme over `R′` on
which global functions are constant on the fibres over `R′`; lifts compose.
(b) Lifts of `t_z` and `t_w` multiply to a lift of `t_{z+w}`. If `R` is local, `t_z` lifts to `L` if and only if
`⟨z, id⟩_{[L]} = 0` in `Pic(A)`, that is `z ∈ K([L])`.
(c) (*rigidity*) Let `N` on `A` and `N′` on `A′` be theta structures for the same `H` of odd order and the same `Λ`, with
`η`, `η′`. Assume that global functions on `A` are constant on the fibres over `R` and that the coordinates of `N` span
`H⁰(A, N)`. If a homomorphism `f : A → A′` has `f∘η = η′` and `[N] = f^*[N′]`, then `f^*N′ = N` as linear systems
(coordinates match).
(d) Under the hypotheses of (c), if `N` is a projective embedding and `t_y` lifts to `N`, then `#H·y = 0`.

*Needs:* 4.1, 4.2.

Relation to AbelianSchemesAndArithmeticModuli §A3.6 (theta groups): for an abelian scheme over a local ring `R` and a
line bundle `L` (rigidified, as every line bundle is over `R`), `K([L])` here is the group of `R`-points of the kernel
`K(L)` of the Mumford map there, and a lift of `t_z` is the action on `H⁰(A, L)` of an element of the theta group `G(L)`
over `z`; so (b) is, for abelian schemes, the case `T = Spec R` of §A3.6 (1), where lifts exist Zariski locally on `T`.
Here (a) is stated for arbitrary schemes and (b) for every commutative group scheme over `R`, and the theta structures
with their rigidity, (c) and (d), have no counterpart there.

[ShortProof], `Lib/Shimura/ThetaGroup` (`New.Variety.IsSectionLift`, `New.Variety.IsTranslationLift`,
`New.Variety.coordSection`, `New.Variety.exists_isSectionLift`, `New.Variety.IsSectionLift.picClass_eq`,
`New.Variety.IsSectionLift.injective`, `New.Variety.IsSectionLift.exists_eq_smul`, `New.Variety.IsSectionLift.comp`,
`New.Variety.IsTranslationLift.mul`, `New.Variety.exists_isTranslationLift_iff`, `New.Variety.IsThetaStructure`,
`New.Variety.IsThetaStructure.pull_eq_of_picClass_eq`,
`New.Variety.IsThetaStructure.card_nsmul_eq_zero_of_isTranslationLift`)

## Layer 5: Complex uniformisation

This layer passes between the algebraic and the analytic side over a valuative arc: holomorphic families of complex
points, uniformisations and theta coordinates (5.1), the uniformisation of complex abelian varieties by an exponential
map (5.2), the existence half of Appell–Humbert (5.3), the extension of homomorphisms of theta-polarised tori over an
arc (5.4), and analytic families of theta tori over a ball (5.5).

### 5.1 Holomorphic families, uniformisations and theta coordinates

*Origin:* particular to this proof: a calculus of holomorphic families of complex points of schemes over a valuative
arc without analytification, with uniformisations and theta coordinates; the nearest published notions are the analytification of a
scheme of finite type over `ℂ` and the uniformisation of a complex abelian variety.

*Method of the formal proof:* jets are read on regular functions; (a) counts the `m`-torsion of `V/L`; (b) compares the
action of `O` on `V` with the matrices of a Lie chart (4.4) through the derivative of the uniformisation at `0`;
(d) by 1.1 (e) applied to the quotient of two coordinates.

Let `O` be a valuative arc, `X` an `O`-scheme and `P` a finite-dimensional complex space. A family `φ : P → X(ℂ)` is
*holomorphic at `w`* if every regular function on an open neighbourhood of `φ(w)` pulls back to a function analytic at
`w`; it is *constant to first order in the direction `v`* if its jet at `w` in the direction `v` is the constant point
over `ℂ[ε]`; it is a *holomorphic immersion at `w`* if it is holomorphic at `w` and constant to first order only in the
direction `0`. For a commutative group scheme `A` over `O`, a *uniformisation* of `A` by `V` is a surjective homomorphism
`e : V → A(O)` whose kernel is a full lattice `L`, which is a holomorphic immersion at every point (on complex points),
and through which every homomorphism `W → A(O)` from a finite-dimensional complex space that is holomorphic at `0`
factors by a `ℂ`-linear map. For a linear system `N` on `X` with coordinates indexed by `ι`, a family `φ : P → X(ℂ)`, a
lattice `L ⊂ P`, Appell–Humbert data `(B, χ)` for `L` and `θ : P → ℂ^ι`, `N` has *theta coordinates `θ` of type
`(B, χ)` along `φ`* if each `θ_i ∈ Θ(B, χ)` and `θ(z)` is a vector of homogeneous coordinates of `φ(z)` for every `z`.
(a) Jets of holomorphic families exist, are unique, and obey the chain rule; on a commutative group scheme smooth of
relative dimension `d`, if `φ` is holomorphic at `w` and `mφ` is constant to first order at `w` in a direction for some
`m ≠ 0`, so is `φ`.
(b) If `e` uniformises `A` by `V`, then for `m ≠ 0` exactly `m^{2 dim V}` points of `A(O)` are killed by `m`.
(c) Let `O` act on `A` (a ring of endomorphisms), `e` uniformise the fibre of a group scheme `𝒜` at a complex point `s`
compatibly with the action, `F(a)` the action on `V`, and `(U, z, m)` a Lie chart of `𝒜` over `s` (4.4) with
`dim V = g`. Then the matrices `m(a)` satisfy the signature condition for `ρ, b, c` if and only if some `Y ≠ 0` in `V`
has `F(a)Y = ρ(a)Y` for all `a` and `F(b) − ρ(c)` maps `V` into `ℂY`.
(d) Theta coordinates pass to pull-backs along maps induced by `ℂ`-linear maps of lattices, to tensor powers (monomials
of degree `m`, type `(mB, χ^m)`), to translates (twisted translates of the coordinates, with `χ` multiplied by
`e(E_B(·, a))`) and to tensor products (products, type `(B + B′, χχ′)`).
(e) Let `N`, `M` have theta coordinates `θ`, `θ′` of types `(B, χ)`, `(B′, χ′)` along an everywhere holomorphic family
`φ` that is `L`-periodic, and let `N ⊗ M^{−1}` have a nowhere vanishing section `w`. Then `E_B = E_{B′}`, `χ = χ′` on
`L`, and along `φ` one has `w = c·exp((B − B′)(z, z)/2)·θ′/θ` (in the charts where both coordinates are nonzero) for a
constant `c`. Without the frame condition, an `L`-invariant section `w` of `N ⊗ M^{−1}` is `G·θ′/θ` for some
`G ∈ Θ(B − B′, χχ′^{−1})`.

*Needs:* 1.1, 4.1, 4.4.

[ShortProof], `Lib/Shimura/Uniformisation/HolomorphicFamilies` (`New.ValuativeArc`, `New.ComplexPoint`,
`New.HolomorphicAt.exists_isJet`, `New.IsJet.unique`, `New.isJet_comp_iff`, `New.IsHolomorphicImmersionAt`,
`New.HolomorphicAt.isFirstOrderConst_of_nsmul`, `New.Uniformisation`, `New.HasThetaCoords`,
`New.Uniformisation.card_torsion`, `New.Uniformisation.hasSignature_iff`, `New.HasThetaCoords.pull`,
`New.HasThetaCoords.pow`, `New.HasThetaCoords.pull_translate`, `New.HasThetaCoords.mul`,
`New.HasThetaCoords.exists_theta_of_isSection`, `New.HasThetaCoords.riemannForm_eq_of_isFrame`)

### 5.2 The exponential of a compact commutative group, and uniformisation of complex abelian varieties

*Origin:* adapted from the published theory of compact commutative Lie groups and the uniformisation of complex abelian
varieties (for the latter, D. Mumford, *Abelian Varieties*, §§1–2): here for a compact commutative topological group
with one chart at `0` in which addition is analytic, the exponential obtained without solving a differential equation,
and the uniformisation of an abelian variety embedded by a linear system.

*Method of the formal proof:* for (a), `e(v)` is defined as a limit, along an ultrafilter on `ℕ`, of the `n`-fold sum of
`ψ(v/n)`; such limits exist because `G` is compact, and the analyticity of addition in the chart makes `e` additive with
derivative the identity at `0`. Its image is then an open subgroup, of finite index as `G` is compact, and its kernel
is discrete and cocompact. (b) takes the étale coordinates of 4.4 (a) as the chart; (c) bounds homogeneous coordinates
on the unit sphere; (d) applies (a) to `A(ℂ)`, which is compact by (c), with the chart of (b).

(a) Let `G` be a compact commutative topological group, `V` a finite-dimensional complex space, and `φ : G → V`,
`ψ : V → G` with `φ(0) = 0`, `ψ∘φ = id` near `0`, `φ∘ψ = id` near `0`, `φ` continuous near `0`, `ψ` continuous at `0`,
and `(p, q) ↦ φ(ψ(p) + ψ(q))` analytic at `0`. Then there is a homomorphism `e : V → G` whose kernel is a full lattice,
with `ψ∘φ∘e = e` near `0`, `φ∘e` analytic at `0` with derivative the identity, image of finite index, and such that every
homomorphism `γ : W → G` from a finite-dimensional complex space, continuous at `0` with `φ∘γ` differentiable at `0`, is
`e∘F` for a continuous `ℂ`-linear `F`.
(b) A scheme smooth of relative dimension `d` over `ℂ` has at every complex point `x` a holomorphic chart: maps
`φ : X(ℂ) → ℂ^d`, `ψ` back, with `φ(x) = 0`, mutually inverse near `x` and `0`, `ψ` holomorphic at `0`, and, for every
family `γ` that is holomorphic at a parameter `w` with `γ(w) = x`, `φ∘γ` analytic at `w`, with zero derivative at `w` in
the directions where `γ` is constant to first order at `w`.
(c) The complex points of a scheme over `ℂ` with a projective embedding are compact.
(d) An abelian scheme over `ℂ`, smooth of relative dimension `d`, with a projective embedding, has a uniformisation by
`ℂ^d` (5.1).

*Needs:* 4.1, 4.4, 5.1.

The library has the exponential of a commutative Lie group with lattice kernel in the compact case
(`TauCeti.lieExpAddMonoidHom`, `TauCeti.isZLattice_ker_lieExpAddMonoidHom`); using it would need a Lie group structure
on `A(ℂ)`, which (b) does not provide. On Tau Ceti's main branch, later than the revision pinned here: the holomorphy of
that exponential for a complex Lie group, `TauCeti.mdifferentiable_mulInvariantExp_complex`.

Relation to AbelianSchemesAndArithmeticModuli §A5.1 (lattice uniformisation): §A5.1 gives `V/Λ ≅ A^an` for an abelian
variety `A` over `ℂ`, through the analytification of `A` and its Lie group structure, with holomorphic homomorphisms
described by linear maps. It implies (d) once an abelian scheme over `ℂ` in the sense of 4.1 is identified with an
abelian variety (4.1) and a family of complex points that is holomorphic in the sense of 5.1 with a holomorphic map to
`A^an`: the exponential of §A5.1 is then a surjective holomorphic homomorphism and a local isomorphism, with kernel a
full lattice, and it is a uniformisation in the sense of 5.1 once every homomorphism `W → V/Λ` that is holomorphic at
`0` is lifted to `V` through the covering `V → V/Λ`, a step that §A5.1 does not state. The route proves (d) directly on
complex points, without analytification.

[ShortProof], `Lib/Shimura/Uniformisation/LieExponential` (`New.exists_lie_exponential`, `New.exists_holomorphic_chart`,
`New.LineBundle.IsProjEmbedding.compactSpace_complexPoint`, `New.LineBundle.IsProjEmbedding.nonempty_uniformisation`)

### 5.3 Projective embeddings are given by theta functions

*Origin:* adapted from the Appell–Humbert theorem on line bundles on complex tori (D. Mumford, *Abelian Varieties*,
§§1–2; L. Breen, *Fonctions thêta et théorème du cube*, LNM 980 (1983)): here only its existence half, for one
projective embedding whose class satisfies the parallelogram law, on a group with a given uniformisation.

*Method of the formal proof:* the route trivialises the pull-back of `N` to `V` by a nowhere vanishing function `σ`
subject to a doubling equation `σ(2z) = σ(z)⁴·c(z)`. The function `c` comes from the parallelogram law for `[N]` (4.1),
read on `A × A`, corrected by the exponential of a quadratic form; the equation is solved by an analytic function near
`0`, which is extended to all of `V` by halving. Then 1.1 (f), applied to `σ`, yields the form `B`.

Let `A` be a commutative group scheme over `ℂ`, `e : V → A(ℂ)` a uniformisation with kernel `L` (5.1), and `N` a
projective embedding of `A` with finitely many coordinates whose class satisfies the parallelogram law (4.1). Then there
are a form `B` with positive Riemann form, `χ`, and `θ` such that `(B, χ)` are Appell–Humbert data for `L` and `N` has
theta coordinates `θ` of type `(B, χ)` along `e`.

*Needs:* 1.1, 4.1, 5.1.

Relation to AbelianSchemesAndArithmeticModuli §A5.3 (the Appell–Humbert classification): once `V/L` is identified with
`A^an` (§A5.1, as in 5.2) and `N` with a holomorphic line bundle on it, §A5.3 gives `N ≅ L(H, α)` with `H` positive, and
the coordinates of `N` become theta functions of type `(B, χ)` with `B(u, v) = π H(v, u)` and `χ = α` (Conventions, so
`E_B = −E`). Thus §A5.3 implies this statement without the hypothesis of the parallelogram law, which the route needs to
build the factor of automorphy on complex points without analytification.

[ShortProof], `Lib/Shimura/Uniformisation/AppellHumbert` (`New.Uniformisation.appell_humbert`,
`New.exists_analyticAt_double_eq`, `New.exists_extension_double`, `New.induction_on_double`)

### 5.4 Homomorphisms of theta-polarised tori extend over an arc

*Origin:* adapted from the theorems that homomorphisms of abelian schemes, and identities between line bundle classes,
extend from the generic fibre to the whole base (S. Bosch, W. Lütkebohmert, M. Raynaud, *Néron Models* (1990), 1.2/8
and 4.4/1; G. Faltings, C.-L. Chai, *Degeneration of Abelian Varieties* (1990), I.2.7; L. Moret-Bailly, *Pinceaux de
variétés abéliennes*, Astérisque 129 (1985), II.3.5). Here the base is a valuative arc, of any rank and possibly not
Noetherian; the maps are maps of complex tori with theta coordinates that pull one theta polarisation back to an integer
multiple of the other, with `m·L^⊥ ⊂ L` for a unit `m` of the arc; and the homomorphism and the identity of classes are
extended at once.

*Method of the formal proof:* (a) and (b) compare sections of `N` with functions on `V` by dividing by the theta
coordinates: a lift of a translation by `e(a)` becomes a multiple of `U_a`, and the commutation rule 1.1 (b) of the
`U_a` gives (b). For (c), 1.4 (b) supplies one scalar after which a finite family of theta functions lies in an
`O`-module of sections stable under the lifts of 4.5; this gives a section over `O` of the graph in `A × A′`, and points
of the generic fibre extend over `O` by the valuative criterion of properness. The pinned Mathlib has that criterion
(`AlgebraicGeometry.IsProper.eq_valuativeCriterion`, with `AlgebraicGeometry.ValuativeCriterion.existence` and
`AlgebraicGeometry.ValuativeCriterion.uniqueness`). On Tau Ceti's main branch, later than the revision pinned here: the
extension of a morphism from the generic point to a unique section over a base whose local rings are valuation rings,
`AlgebraicGeometry.Scheme.Hom.existsUnique_section_of_valuationRing`.

Let `O` be a valuative arc, `A` an abelian scheme over `O`, `e : V → A(O)` a uniformisation with lattice `L` (5.1),
and `N` a projective embedding of `A` with theta coordinates of type `(B, χ)` along `e`, `B` with positive Riemann form.
Let `m ∈ ℕ` be a unit of `O` with `m·L^⊥ ⊂ L`, such that for each `a ∈ L^⊥` the translation by `e(a)` lifts to the
sections of `N` (4.5).
(a) The map from `H⁰(A, N)` to functions on `V` sending a section to its quotient by the coordinates times `θ` is
injective, sends the coordinate sections to the `θ_i`, and sends lifts of translations by `e(a)` to multiples of `U_a`.
(b) (*Weil pairing*) Lifts `Φ`, `Ψ` of the translations by `e(a)`, `e(b)` to `N^{⊗m}` satisfy `ΦΨ = c·ΨΦ` on all
coordinates if and only if `c = e(m·E_B(a, b))`.
(c) Let `A′` be a commutative group scheme proper over `O`, `s′ : V → A′(O)` a homomorphism killing `L`, and `M` a
projective embedding of `A′` with theta coordinates of type `(μB, χ^μ)` along `s′`, `μ ∈ ℕ`. If the classes of `N` and
`M` satisfy the parallelogram law, there is a homomorphism `ψ : A → A′` over `O` with `ψ(e(z)) = s′(z)` for all `z` and
`ψ^*[M] = μ[N]`.

*Needs:* 1.4, 4.1, 4.2, 4.5, 5.1.

The formal proof proves (c) through a section of a homomorphism `π : A′ → A` built on the graph, under a hypothesis on
classes that the parallelogram law supplies.

Relation to AbelianSchemesAndArithmeticModuli §§A3.5–A3.7 (Weil pairings and theta groups): the lifts in (b) act as
elements of the theta group `G(N^{⊗m})` of §A3.6 (see 4.5), and `ΦΨ = c·ΨΦ` takes the commutator in the order of
§A3.6 (2), so `c` is the commutator pairing of `G(N^{⊗m})` at `e(a)`, `e(b)`; for `a, b ∈ L^⊥` these points are killed
by `m`, and then by §A3.6 (2) the pairing is `e_m(e(a), φ_N(e(b)))`, with `e_m` of §A3.5 (the polarised pairing of
§A3.7 for `λ = φ_N`). (b) computes it through the Riemann form, which §§A3.5–A3.7 do not do.

[ShortProof], `Lib/Shimura/ArcExtension` (`New.Variety.isSeparatingFamily_atGeneric_of_surjective`,
`New.HasThetaCoords.holomorphicAt`, `New.Variety.thetaEval`, `New.Variety.exists_theta_evaluation`,
`New.Variety.lift_commutator_iff_weil_pairing`, `New.Variety.exists_sections_of_translation_stable`,
`New.Variety.exists_section_of_hasThetaCoords`, `New.Variety.exists_hom_of_hasThetaCoords`);
`Lib/Shimura/Uniformisation/HolomorphicFamilies` (`New.bijective_restrict_genericPt`)

### 5.5 Analytic families of theta tori and the ball chart

*Origin:* particular to this proof: the theta tori with a fixed frame, parametrised by the positive lines of a hermitian
form of signature `(1, n − 1)`, form one analytic family over a ball, in which the theta coordinates are analytic up to a
common factor, and an isomorphism from a translate of a moduli point to itself acts linearly on the parameters with
local term `p(0)·det(1 − tK)`; the nearest published result is the complex uniformisation of unitary Shimura varieties
by the ball.

*Method of the formal proof:* the period map `(E ⊗ ℝ)ⁿ → V` is written explicitly, affine in the point of the ball; the
Poincaré series of 1.2 depends analytically on the parameter; the linearisation of the action at a fixed point is
computed in the explicit coordinates.

Let `D` be PEL data. An *analytic family* of theta tori is a nonempty connected open `U ⊂ ℂ^{n−1}` (its *domain*), a
frame `g`, and for each `b ∈ ℂ^{n−1}` a reflection `J_b` and a theta torus `Y_b` for `(g, J_b)` on a fixed space `V`
(3.3), such that `b ↦ Q_b(w)` is analytic on `U` for each `w`, its derivative at a point of `U` in a direction `v ≠ 0`
is never complex-linear for the structure of `Q_b`, the matrix `β_Y` and the forms `B(Q_b w, ·)` do not depend on `b`,
and `Re B(u, u) > 0` for `u ≠ 0`. For `ν ∈ ℕ`, marked vectors `P ∈ ((E ⊗ ℝ)ⁿ)^ν` and a *parameter*
`q = (b, ζ) ∈ ℂ^{n−1} × V^ν`, its *point* at `q` (for `P`) is the moduli point `(g, J_b, (Q_b^{−1}(ζ_i) + P_i)_i)`.
(a) For an analytic family and `b₀ ∈ U` there is a function `c` with `c(b) ≠ 0` near `b₀` such that
`(b, z) ↦ c(b)·θ_t^{(b)}(z)` is analytic at `(b₀, z)` for all `t ∈ T` and `z`.
(b) For a hermitian `H` and `u` with `ūᵀHu = a > 0` there are coordinates `ℂⁿ ≅ ℂ × ℂ^{n−1}` with `e(ū) = (1, 0)` in
which the set of `b` with `Re xᵀHx̄ > 0`, `x = e^{−1}(1, b)`, is star-convex at `0`.
(c) Let `e : ℂⁿ ≅ ℂ × ℂ^{n−1}` be linear coordinates for which the ball of (b) (the `b` with `Re xᵀHx̄ > 0`,
`x = e^{−1}(1, b)`) is connected, and let `(g, J)` be a signed frame for `β` with `H = Φ_{v₀}(β)` negative on the nonzero
`y` whose conjugate has first coordinate `0` (`ȳᵀHy < 0`). Then some analytic family has as domain this ball, frame `g`,
reflections the reflections of `H` at the lines of the ball, and an explicit period map.
(d) Every moduli point `o = (x, J, P)` with `ν` marked vectors has a *ball family*: an analytic family `f` with `0` in
its domain such that, writing `f(q)` for its point at `q` for the marked vectors `P`: `f(0) = o`; every moduli point
with `ν` marked vectors and the frame of `o` is the point of `f` for the marked vectors `0` at some `(b, ζ)` with `b` in
the domain; and, if `z` is an isomorphism `o·(g, α) ≅_{K(𝔑)} o` with separable characteristic polynomial and `J` is the
marked reflection of `z` at `j` (8.1), then some `ℂ`-linear endomorphism `K` of `ℂ^{n−1} × V^ν` has
`z : f(q)·(g, α) ≅_{K(𝔑)} f(Kq)` for all `q` near `0`, and the local term `p = p_{α, char(z), j}` of 8.1 satisfies
`p(t) = p(0)·det(1 − tK)` for all `t ∈ ℂ`.

*Needs:* 1.2, 3.1, 3.3, 8.1 (the local term and marked reflections, as definitions).

[ShortProof], `Lib/Shimura/Uniformisation/BallModel` (`New.Variety.AnalyticFamily`,
`New.Variety.AnalyticFamily.exists_analytic_thetaCoord`, `New.Variety.positiveBall`, `New.Variety.exists_ball_chart`,
`New.Variety.ballPeriod`, `New.Variety.exists_analyticFamily_positiveBall`, `New.Variety.IsBallFamily`,
`New.Variety.exists_isBallFamily`)

## Layer 6: Theta families

A theta family is an abelian scheme with `𝓞_E`-action over a base, with a linear system whose coordinates are theta
coordinates over local rings and level points that determine the points of the base (6.1). Its objects over a valuative
arc can be modelled on theta tori, and homomorphisms of modelled objects are rational matrices (6.2); every complex
object with full level structure has a model (6.3), and the geometric fibres of modelled objects are rigid (6.4).
Families are built from dense sets of complex points: flat closures of points whose ideals are cut out (6.5), linear
systems and group laws by density (6.6), and theta families from theta tori (6.7).

### 6.1 Theta families, full level structures and rigidity

*Origin:* particular to this proof: a family of abelian schemes with `𝓞_E`-action embedded by theta coordinates, with
level points and a signature condition, with no moduli property; and rigidity of its objects over Noetherian local
rings; the nearest published notion is a family of abelian varieties with a theta structure in Mumford's sense.

*Method of the formal proof:* (a) the pull-back of a full structure is a full structure; (b) the spanning hypothesis
and the theta structure 4.5 (d); (c) the rigidity of theta structures 4.5 (c) with the level points.

Let `D` be PEL data and `τ : S → Spec 𝓞_E` a scheme over `𝓞_E`. A *theta family* `𝒳` over `S` consists of an abelian
scheme `A → S` of relative dimension `n·f` with an action of `𝓞_E`, a projective embedding `N` of `A` over `S` with
coordinates indexed by `T`, and an `𝓞_E`-linear map `λ` from the classes killed by `𝔑` to the sections of `A`
(*level points*), such that: (i) after any base change to a local ring `B`, the coordinates of `N` form a theta structure
for `T`, the Lagrangian `Λ` and the restriction of `λ` to `T` (4.5); (ii) `[N]` satisfies the parallelogram law,
`⟨βx, y⟩_{[N]} = ⟨x, (1 − β)y⟩_{[N]}`, and `y^*[N] = ⟨βy, y⟩_{[N]} + 0^*[N]` for all points `x, y`; (iii) for every
integer `b` and every `Spec B → S` with `B` local there is a Lie chart (4.4) whose matrices satisfy the signature
condition for the structure map `𝓞_E → B` and the elements `β̄ − b`, `β − b`; (iv) for every ring `B`, two `B`-points of `S` over the same
point of `Spec 𝓞_E` at which `N` pulls back to the same linear system along every level point are equal. An *object*
over `T` is a `T`-point `x` of `S`, with the pulled-back abelian scheme `A_x`, linear system `N_x`, level points and
structure map `𝓞_E → Γ(T, 𝒪)`. A *full level structure* on an object over a ring `R` is an injective `𝓞_E`-linear map
from `T_n` to the sections of `A_x` extending the level points, such that for each ring map `ι : R → ℂ` there is
`ε ∈ Ẑ^×` with: for classes `[y], [z]` killed by `m`, lifts of the translations by their sections to `N_x^{⊗m}` commute
on coordinates up to a scalar `c` with `ι(c) = ψ_f(ε·m·ξ·zᴴy)`. An object over `k` is *rigid* if on every pull-back to a
Noetherian local ring `B` the global functions on the abelian scheme are constant on the fibres and the coordinate
sections span `H⁰` of the linear system.
(a) A full level structure on an object over a local ring `R` pulls back to one along every local homomorphism
`R → ℂ`.
(b) Let `x` be rigid over a field of prime characteristic `l`, `w` a pull-back of `x`, and `y` a point of `A_w` with values
in a Noetherian local ring, killed by a power of `l` on some nonempty affine scheme over it, with `⟨y, z⟩_{[N]} = 0`
for all points `z` after any base change. Then `y = 0`.
(c) Let `x` be rigid over a field `k`, `x₁` its pull-back to a Noetherian local ring `B`, `x₂` another object over `B`
with the same structure map `𝓞_E → B`, and `j : A_{x₁} → A_{x₂}` an `𝓞_E`-linear homomorphism that respects the
pairings of the line bundle classes and the level points. Then `x₁ = x₂`, and `j` commutes with the maps to `A`.

*Needs:* 3.2, 4.1, 4.2, 4.4, 4.5.

Relation to PELModuli §§M1.4–M1.7: a theta family is a family of abelian schemes with `𝓞_E`-action and a polarisation
class `[N]`, but it is not asked to be, and is not shown to be, the pull-back of the universal object of PELModuli; its
level points are sections at the classes killed by `𝔑` only. A full level structure here is an injective labelling of
torsion sections by the whole `𝓞_E`-module `T_n ≅ (E/𝓞_E)ⁿ`, with the Weil pairing
(read through commutators of lifts, 4.5) prescribed by `ψ_f(ε·m·ξ·zᴴy)` at every complex embedding; over `ℂ` it plays
the part of a full Tate trivialisation of §M1.4 for the lattice `𝓞_Eⁿ` with the trace form of `ξ` and no excluded
primes, whereas the level structures of §§M1.5–M1.6 are orbits of such trivialisations under an open compact subgroup,
away from the primes in `□`, over any locally Noetherian scheme over the good-prime base `S₀` of §M0.10. No target of
this roadmap identifies the two notions.

[ShortProof], `Lib/Shimura/ThetaModuli/ThetaFamilyRigidity` (`New.ThetaFamily`, `New.ThetaObject`,
`New.ThetaObject.FullLevelStructure`, `New.ThetaObject.FullLevelStructure.exists_pullback`,
`New.ThetaObject.HasSpanningCoords`, `New.ThetaObject.HasSpanningCoords.eq_zero_of_pairing_eq_zero`,
`New.ThetaObject.HasSpanningCoords.eq_and_comp_toFamily_eq_of_hom`); `Lib/Shimura/ThetaModuli/PELThetaTori`
(`New.PEL.HasClassLaws`)

### 6.2 Objects modelled on theta tori, and their homomorphisms

*Origin:* particular to this proof: the description of objects of a theta family over a valuative arc whose generic
fibre is a theta torus, of their torsion, and of their homomorphisms by matrices in `GL_n(E)`; the nearest published
result is the description of homomorphisms of complex abelian varieties with `𝓞_E`-action by rational matrices on their
period lattices.

*Method of the formal proof:* a homomorphism is holomorphic, so it lifts to a `ℂ`-linear map of the universal covers
(5.1) that maps lattices to lattices, hence is a rational matrix in the coordinates of the period maps; conversely a
rational matrix with the integrality and similitude conditions gives a map of tori, which extends over the arc by 5.4.

Let `O` be a valuative arc, `𝒳` a theta family, `y` an object over `O`, and `Y = (β_Y, Q, B)` a polarised period map
for `(g, ℓ)` on `V` (3.3). A *model* of `y` on `Y` is a uniformisation `e` of `A_y` by `V` with kernel `Λ_0`, such that
the structure map `𝓞_E → O ⊂ ℂ` is `Φ_{v₀}`, `e∘Q` is `𝓞_E`-linear, the level point of each class `l` is `e(Q(y_l))`
for the chosen representative `y_l` of `l`, and `N_y` has theta coordinates of type `(B, χ)` along `e` for some `χ`.
(a) If `A` is an abelian scheme over `ℂ`, smooth of relative dimension `d`, with a projective embedding whose class
satisfies the parallelogram law, and `e : V → A(ℂ)` is a homomorphism with dense image, killing `Λ_0`, along which the
`θ_t` of `Y` are homogeneous coordinates, then `e` is a uniformisation with kernel `Λ_0`, with theta coordinates `θ_t`
of type `(B, χ_D)`, and `d = n·f`.
(b) A model gives a full level structure (6.1): the class of `g⁻¹y`, `y ∈ Eⁿ`, goes to `e(Q(y))`.
(c) For `b ∈ Λ_0^⊥`, `#T·b ∈ Λ_0`, and the translation by `e(b)` has a lift to the sections of `N_y` that preserves the
`O`-span of the coordinates; the multiplier `χ` equals `χ_D` on `Λ_0`, the canonical multiplier of `β`.
(d) Let `x, x′` have models on `Y`, `Y′` (frames `g, g′`, matrices `ℓ, ℓ′`), and `ψ : A_x → A_{x′}` an `𝓞_E`-linear
homomorphism with `ψ^*[N_{x′}] = μ[N_x]`, `μ ≥ 1` an integer. Then there is `z ∈ GL_n(E)` with `ψ(e(Q w)) = e′(Q′(zw))` for all
`w ∈ (E ⊗ ℝ)ⁿ`, `μ·(polarisation form of β_Y) = polarisation form of zᴴβ_{Y′}z`, and
`Φ_{v₀}(z) ℓ Φ_{v₀}(z)^{−1} = ℓ′`.
(e) Conversely, let `z ∈ GL_n(E)` with `Φ_{v₀}(z) ℓ Φ_{v₀}(z)^{−1} = ℓ′` and `k = g′^{−1} z g` integral with `k^{−1}` a
frame for the scalar `μ > 0`. Then `x` and `x′` have the same structure map, and there is an `𝓞_E`-linear isogeny
`ψ : A_x → A_{x′}` with `ψ^*[N_{x′}] = μ[N_x]`, acting on torsion by `k` and on periods by `z`.

*Needs:* 3.3, 4.3, 4.5, 5.1, 5.4, 6.1.

[ShortProof], `Lib/Shimura/Uniformisation/TorusModel` (`New.ThetaObject.TorusModel`,
`New.ThetaTori.PeriodMap.exists_uniformisation_of_isSeparatingFamily`, `New.ThetaObject.TorusModel.fullStructure`,
`New.ThetaObject.TorusModel.exists_unit_on_roots_of_unity`,
`New.ThetaObject.TorusModel.exists_isTranslationLift_of_dualLattice`,
`New.ThetaObject.TorusModel.multiplier_eq_canonicalMultiplier`, `New.ThetaObject.TorusModel.exists_matrix_of_hom`,
`New.ThetaObject.TorusModel.baseHom_eq_baseHom`, `New.ThetaObject.TorusModel.IsIsogenyOfMatrix`,
`New.ThetaObject.TorusModel.exists_isogeny`)

### 6.3 Complex objects with full level structure are modelled on theta tori

*Origin:* particular to this proof: every object over `ℂ` with structure map `Φ_{v₀}` and a full level structure has a
model on a polarised period map for some adelic frame and some reflection; the nearest published result is the
description of the complex points of a unitary PEL moduli space by an adelic double coset.

*Method of the formal proof:* 5.2 (d) uniformises the abelian variety; the action of `𝓞_E` on `V` and the full level
structure give a period map `Q` with `e∘Q` sending rational vectors to torsion points; the frame `g` is found from the
Weil pairing of the full level structure and 3.1 (a); the signature condition 5.1 (c) gives the reflection.

Let `𝒳` be a theta family, `x` an object over `ℂ` whose structure map is `Φ_{v₀}`, and `ε` a full level structure on
`x`. Then there are `g ∈ GL_n(𝔸_f)`, a reflection `ℓ`, `d ∈ ℕ`, a polarised period map `Y` for `(g, ℓ)` on `ℂ^d`, and a
model of `x` on `Y` whose full level structure (6.2 (b)) is `ε`. More precisely, for any uniformisation `e` of `A_x` by
a space `V` and any period map `Q` for `ℓ` with `e∘Q` `𝓞_E`-linear, sending `y ∈ Eⁿ` to the torsion point of `ε` at the
class of `my` for an adelic matrix `m`, and with `e^{−1}(0) ⊂ Q(Eⁿ)`, some frame `g` and some polarised period map for
`(g, ℓ)` on the same space `V` carry such a model.

*Needs:* 3.1, 3.3, 5.1, 5.2, 6.1, 6.2.

[ShortProof], `Lib/Shimura/Uniformisation/ModelExists` (`New.Variety.exists_torusModel_of_isPeriodMap`,
`New.Variety.exists_torusModel`)

### 6.4 The sections of the theta line bundle are spanned by the coordinates

*Origin:* adapted from the theorem that theta functions span `H⁰` of every ample line bundle on an abelian variety
(D. Mumford, *On the equations defining abelian varieties I*, Invent. Math. 1 (1966), §§1–2; S. W. Shin, *Abelian
varieties and Weil representations*, Algebra Number Theory 6 (2012), Prop. 2.12, over a base; M. Bolognesi,
A. Massarenti, Comment. Math. Helv. 91 (2016), Lemma 4.1, for odd type). Here the spanning is deduced from the count
over `ℂ` (5.4 (a), 1.2 (c)), with no Riemann–Roch theorem, and it is asserted for the coordinate sections of an object
that has a model, after any pull-back of a geometric fibre to a Noetherian local ring.

*Method of the formal proof:* over `ℂ`, the sections are theta functions (5.4 (a)) and their number is `#T` by 1.2 (c);
the lattice of sections over `O` is stable under lifts of translations by the dual lattice (6.2 (c)), so by 1.4 (b) and
Serre's theorem on finite generation it is spanned by the coordinates; spanning passes to the special fibre and to its
pull-backs by a trace over torsion.

Let `O` be a valuative arc, `y` an object of a theta family over `O` with a model on a polarised period map (6.2),
`k` an algebraically closed field, `χ : O → k` a ring homomorphism, and `x₀` the pull-back of `y` along `χ`. Then `x₀` is
rigid (6.1): on every pull-back of `x₀` to a Noetherian local ring `B`, global functions on the abelian scheme are
constant on the fibres over `B`, and the coordinate sections span `H⁰` of the linear system over `B`.

*Needs:* 1.2, 1.4, 4.1, 4.5, 5.4, 6.1, 6.2.

[ShortProof], `Lib/Shimura/IntegralModel/UniversalFamily` (`New.ThetaObject.TorusModel.span_coordSection_eq_top_of_isPullbackAlong`,
`New.ThetaObject.TorusModel.hasSpanningCoords_of_specMap_comp_eq`)

### 6.5 Ideals cut out by points, and flat closures

*Origin:* particular to this proof: ideals whose forms in the degrees `r^j` are those vanishing at given points, with
prescribed ranks in all degrees `r^j`, form flat families, and the closure of points whose ideals are cut out by linear
systems is flat over a reduced base; the nearest published result is the flatness of the closure of the theta-null
locus in Mumford's construction.

*Method of the formal proof:* (a) by a Noetherian argument on monomial ideals (Dickson's lemma); (b) the ranks are the
same at the special point and at the points `ψ_k`, and the conditions in the degrees `r^j`, `j ≤ i`, determine the ideal
by the degree bound; flatness follows from constancy of the Hilbert function on the degrees `r^j`; (c) glues the charts.

Use the notions of 3.6 (*cut out*).
(a) For finitely many variables `J`, `r ∈ ℕ` and counts `σ : ℕ → ℕ`, every large `i` is a *degree bound*: every
monomial ideal that omits at most `σ_j` monomials of degree `r^j` for each `j ≤ i` does so for every `j`.
(b) Let `A` be a ring, `φ : A → k` a local homomorphism to a field, `ψ_k : A → K` ring maps to a field with no common
nonzero kernel element, `r > 1`, `i` a degree bound for `σ`, and `P_a ∈ A^J` points. Let `I₀ ⊂ k[X]` be cut out in the
chart `c` by the `φ(P_a)` with ranks `σ` up to `i`, and each `I_k ⊂ K[X]` cut out in the chart `c` by the `ψ_k(P_a)` with
ranks `σ` up to `i`.
Let `T ⊂ A[X]` be the ideal of polynomials whose image under each `ψ_k` lies in `I_k`. Then `I₀` is the image of `T`
under `φ`, and `A[X]/T` is flat over `A`.
(c) Let `S` be reduced, with complex points `η_k` of which finitely many are dense, linear systems `P_a` on `S` with
coordinates indexed by `J`, `r > 1`, `i` a degree bound for `σ`, and nonzero vectors `θ_k(w) ∈ ℂ^J` whose ideals are
cut out at `η_k` by the `P_a`. Assume that every point of `S` specialises to a geometric point at which some set has its
ideals cut out by the `P_a`. Then there are a scheme `𝒜` over `S` with a projective embedding `N` over `S`, flat over
`S`, and points `e_k(w)` of `𝒜` over `η_k` with homogeneous coordinates `θ_k(w)`, such that the fibre of `𝒜` over each
`η_k` is reduced with the `e_k(w)` dense in it, all the `e_k(w)` are dense in `𝒜`, and every point of `S` specialises
to a geometric point over which the fibre of `𝒜` is reduced.

*Needs:* 3.6.

[ShortProof], `Lib/Shimura/ThetaModuli/FlatClosure` (`New.Variety.ThetaNull.eventually_isCutDegree`,
`New.Variety.ThetaNull.eq_map_and_flat_of_isCutOut`, `New.Variety.ThetaNull.IsFlatClosure`,
`New.Variety.ThetaNull.exists_isFlatClosure`)

### 6.6 Linear systems and group laws by density

*Origin:* particular to this proof: on a flat proper scheme over a reduced base, line bundles, group laws and actions are
constructed from what they are at the members of a dense set of complex points; the nearest published results are the
extension of identities by density and the rigidity of group laws.

*Method of the formal proof:* (a): the transition functions `w_j/w_i` are regular because the families are local
combinations of each other, and they agree with those of `M` up to a cocycle that is trivial; (b): a morphism is
determined by its values on a dense family of reduced points, so the laws of a group scheme and of an action pass from
the vector spaces `V` to `𝒜`; smoothness comes from the reduced fibres and the group structure; (c): Riemann's relation
3.5, whose coefficients are regular near every point because of the nonvanishing indices, makes the products of theta
coordinates for one Riemann tuple local combinations of those for another, so (a) gives a linear system on `𝒜 ×_S 𝒜`
that defines a map to a power of `𝒜`; padding tuples (3.2) give in this way addition, subtraction and the action of
elements spanning `𝓞_E` over `ℤ`, hence of all of `𝓞_E`.

(a) Let `Z` be a reduced scheme, `ξ_a` a family of complex points separating `Z`, `M` a linear system on `Z` with
homogeneous coordinates `m_a` at `ξ_a`, and `w_a` vectors such that `w` and `m` are local combinations of each other
(each coordinate of one is locally a regular function times a sum of coordinates of the other). Then there is a linear
system `N` with `[N] = [M]` and homogeneous coordinates `w_a` at `ξ_a`.
(b) Let `S` be reduced and locally Noetherian, `η_k` complex points of `S` with a finite dense subfamily, `𝒜` flat and
proper over `S` with a reduced geometric fibre at a specialisation of every point, `V` a finite-dimensional complex
space and maps `e_k : V → 𝒜(η_k)` such that all `e_k(z)` separate `𝒜` and each `e_k(V)` separates the fibre over `η_k`.
Let a ring `O` act on `V` by `F_k`. If addition, zero and the action extend to morphisms of `𝒜` over `S`, then `𝒜` is an
abelian scheme with an action of `O`, each `e_k` is additive and `c·e_k(z) = e_k(F_k(c)z)`.
(c) (*addition and action*) Let `D` be PEL data, `R` a ring in which `#T` is a unit, `S` a scheme over `Spec R`, `η_k`
complex points of `S`, `x_k` theta tori for `(g_k, ℓ_k)` on a fixed `V` (3.3) with theta coordinates `θ_t^{(k)}`, and
for each level point `ω` (a class killed by `𝔑`) a linear system `c_ω` on `S` with coordinates indexed by `T` that has
homogeneous coordinates `(θ_t^{(k)}(a_ω))_{t ∈ T}` at `η_k` (`a_ω` as in 3.6 (c)). An index `a ∈ T` is *nonvanishing*
at a point `t` of `S` if for all `s₁, s₂ ∈ T` with `s₁ + s₂ = a` the `s₂`-th coordinate of `c_{s₁}` does not vanish at
`t`. Assume that for every point `t` of `S` and every `s ∈ T` there is `a ∈ T` such that `a`, `−a` and `s − a` are
nonvanishing at `t`. Let `𝒜 → S` have a projective embedding `N` with coordinates indexed by `T`, and let
`e_k : V → 𝒜(η_k)` be maps such that `N` has homogeneous coordinates `(θ_t^{(k)}(z))_t` at `e_k(z)`, the scheme
`𝒜 ×_S 𝒜` is reduced and the pairs `(e_k(z), e_k(y))` are dense in it, and some section `o` of `𝒜` has
`o(η_k) = e_k(0)` for all `k`. Then there are a morphism `𝒜 ×_S 𝒜 → 𝒜` sending `(e_k(y), e_k(z))` to `e_k(y + z)` and,
for each `d ∈ 𝓞_E`, an endomorphism of `𝒜` sending `e_k(z)` to `e_k(d·z)`, where `d` acts on `V` as on `x_k`.

*Needs:* 3.2, 3.3, 3.5, 4.1, 6.5.

[ShortProof], `Lib/Shimura/ThetaModuli/FamilyFromPoints` (`New.Variety.ThetaNull.exists_isLinearSystem`,
`New.exists_isAbelianScheme`, `New.Variety.exists_maps_of_riemann_relation`, `New.Variety.exists_add_and_intAction`)

### 6.7 Theta families from dense complex points

*Origin:* particular to this proof: a theta family on a reduced base embedded by linear systems whose coordinates at a
dense set of complex points are the theta values of the level points of theta tori; the nearest published result is
Mumford's construction of families of abelian varieties from theta-null values.

*Method of the formal proof:* the flat closure of the theta points (6.5 (c)) is the total space; group law and action
come from 6.6 (b), (c), the theta structure over local rings from 3.3 (d) by density and 4.5, the signature condition
from 5.1 (c) by 4.4 (d), and the class laws from the theta coordinates.

Let `S` be reduced and locally Noetherian over `Spec R`, `R` a ring with a ring map `φ : 𝓞_E → R` such that
`Spec R → Spec 𝓞_E` is a monomorphism, and `η_k` complex points of `S` with a finite dense subfamily, with
`η_k^*∘φ = Φ_{v₀}` on `𝓞_E`. Let `D` be PEL data, `x_k` theta tori for `(g_k, ℓ_k)` on a fixed `V`, and for each level
point `ω` (a class killed by `𝔑`) a linear system `c_ω` on `S` with coordinates indexed by `T`, such that the product of
the `c_ω` is a projective embedding of `S` over `Spec R` and `c_ω` has homogeneous coordinates
`(θ_t^{(k)}(a_ω))_{t ∈ T}` at `η_k`. Assume that `φ(β̄ − β)` and `#T` are units of `R`; that every point of `S`
specialises to a geometric point at which some set has its ideals cut out by the `c_ω` with ranks `σ` up to `i` (3.6);
and that for every point `t` of `S` and `s ∈ T` there is `a ∈ T` such that `a`, `−a` and `s − a` are nonvanishing
indices of the `c_ω` at `t` (an index `a ∈ T` is *nonvanishing* at `t` if for all `s₁, s₂ ∈ T` with `s₁ + s₂ = a` the
`s₂`-th coordinate of `c_{s₁}` does not vanish at `t`, as in 6.6 (c)). Then there is a theta family over `S` (with structure map through `φ`) whose object at each
`η_k` is modelled on `x_k`.

*Needs:* 3.3, 3.5, 3.6, 4.4, 4.5, 5.1, 6.1, 6.2, 6.5, 6.6.

[ShortProof], `Lib/Shimura/ThetaModuli/FamilyFromPoints` (`New.Variety.exists_isThetaStructure`,
`New.Variety.exists_thetaFamily_of_points`)

## Layer 7: The universal theta family

The base of the universal family is the reduced closure of the theta values of the level points of all theta tori. Its
smoothness of relative dimension `n − 1` at good primes rests on an upper bound for first-order deformations, proved with
the reduction of isogeny kernels (7.1), a count of `w`-torsion points (7.2) and Drinfeld's lifting lemma (7.3). The
universal family exists (7.4); its fibre powers carry points given by linear data, which are dense and identified up to
isomorphism at a level (7.5); and analytic families immerse into them (7.6).

### 7.1 Reduction of isogeny kernels

*Origin:* adapted from the published theory of finite flat group schemes (Cartier's theorem that they are reduced in
characteristic zero) and of the reduction of torsion: here for objects of a theta family over a valuation subring of `ℂ`
with a full level structure, at a prime good for `D`, with the tangent line on which `𝓞_E` acts through the structure
map and a parameter whose powers cut out the torsion sections.

*Method of the formal proof:* (a) a finite flat subgroup scheme in characteristic zero is reduced, so a function
vanishing at all geometric points vanishes; (b) the torsion sections are the complex points of the kernel, dense by
(a); (c) the signature condition (6.1 (iii)) gives the line; (d) a regular function whose differential is nonzero on
the line of (c) serves as a local parameter, and the exponent is the number of torsion sections through the closed
point.

Let `𝒳` be a theta family, `V ⊂ ℂ` a valuation subring, `y` an object over `V` with a full level structure `ε`, `k` a
field, `φ : V → k`, `x` the pull-back of `y` to `k`, and `w` the kernel of the structure map `𝓞_E → k`.
(a) (*Cartier*) Let `V ⊂ K` with `K` algebraically closed of characteristic `0`, `S` a finite flat `V`-algebra and
`Spec S → A` a monomorphism to a commutative group scheme whose image is stable under `(x, y, z) ↦ x − y + z`. Then every
nonzero `s ∈ S` is nonzero at some `V`-algebra map `S → K`.
(b) For an isogeny `ψ` from `A_y` to an abelian scheme over `V`, a closed condition that holds at all torsion sections
`ε(s)` in the kernel of `ψ` holds at every point of the kernel.
(c) For an object over a local ring `R`, a field `k` over `R` and `b ∈ ℤ` with `β − b ↦ 0` in `k`, there is an additive
map `L` from `k` to the tangent vectors at `0` of the abelian scheme over `k`, whose image is a line on which `𝓞_E` acts
through the structure map, and into which `β̄ − b` maps all tangent vectors.
(d) If `D` is good at `w`, some nonzero `w`-torsion class `s` has `ε(s)` reducing to `0` over `k`; and there is an
additive map `ν` from the `w`-torsion classes to the `w`-torsion `k`-points of `x` such that, for a `w`-torsion point `z`
over a local `k`-algebra `B` with closed point `π(z)`, some `t` in the maximal ideal has `t^N = 0`, `N` the number of
classes over `π(z)`, and if `π(z) = 0` then `z` vanishes along every algebra map that kills `t`.

*Needs:* 4.1, 4.3, 4.4, 6.1.

[ShortProof], `Lib/Shimura/CongruenceRelation/KernelReduction` (`New.Variety.cartier`, `New.Variety.ker_factors_of_points`,
`New.Variety.placeTorsion`, `New.Variety.ker_factors_of_torsionPoint`, `New.Variety.exists_isLieLine`,
`New.Variety.exists_isLocalEquation_pow_sectionCount`, `New.Variety.exists_param_pow_card_eq_zero`)

### 7.2 Counting `w`-torsion points bounds natural semilinear functions

*Origin:* particular to this proof: a bound `n − 1` for the dimension of a space of natural semilinear functions on the
`w`-torsion points of the reduction of an object with full level structure at a good prime; the nearest published result
is the computation of the tangent space of a unitary PEL moduli space of signature `(1, n − 1)`.

*Method of the formal proof:* the local ring of the `w`-torsion at the origin is `k[τ]` with `τ` nilpotent (7.1 (d));
the `q_w^n` torsion sections map onto the `k`-points, so `q_w^{n−d}` pass through `0`, `d` the dimension of the
`w`-torsion `k`-points. The lowest term of `f` in `τ` has degree a power `q_w^j` with `0 < j < n − d`, and these
coefficients together with the values on `k`-points determine `l ∈ W`, which gives `dim W ≤ d + (n − d − 1)`.

Let `k` be an algebraically closed field, `D` good at `w = ker(𝓞_E → k)`, `x` over `k` the reduction of an object `y`
over a valuation subring of `ℂ` with a full level structure, and `W` a finite-dimensional `k`-vector space. For each local `k`-algebra `C`
let `f_C` be a map from the `w`-torsion `C`-points of `A_x` to `Hom_k(W, C)`, semilinear for the structure map, such
that (a) `f` is natural in `C`; (b) `f_{k[ε]}` vanishes on the points that reduce to `0`; (c) if `l ∈ W` has
`f_C(z)(l) = 0` for all finite local `C` and all `z`, then `l = 0`. Then `dim_k W ≤ n − 1`.

*Needs:* 6.1, 7.1.

[ShortProof], `Lib/Shimura/Deformation/TangentCount` (`New.Variety.finrank_le_of_placeTorsion`)

### 7.3 Drinfeld lifting and the tangent bound

*Origin:* adapted from the deformation theory of abelian varieties with `𝓞_E`-action: Drinfeld's lifting lemma
(N. Katz, *Serre–Tate local moduli*, LNM 868 (1981), §1; J. Lubin, J. Tate, *Formal moduli for one-parameter formal
Lie groups*, Bull. SMF 94 (1966)) and the dimension of the deformation space of a unitary PEL object of signature
`(1, n − 1)` (M. Harris, R. Taylor, *The Geometry and Cohomology of Some Simple Shimura Varieties* (2001), III.4.1).
Here Drinfeld's lemma is applied to the finite group of `w`-torsion points (7.1, 7.2), so that `p`-divisible groups and
crystals do not enter, and the argument covers every prime good for `D`, `p = 2` and primes ramified in `E`; of the
dimension of the deformation space only the inequality `≤ n − 1` for first-order deformations with no constant
direction is stated.

*Method of the formal proof:* (a) is the factorisation through an isogeny (with 4.3) applied to
multiplication by `c`, which is possible because `c` kills the points of `x′` that vanish modulo `ε`. For (b), the lift
of (a) is compared with the tangent line of 7.1 (c): a deformation in the direction `l` produces natural maps on the
`w`-torsion that are semilinear for the structure map, 7.2 bounds the space of such maps by `n − 1`, and rigidity of
`x₀` (6.4, 6.1 (c)) rules out constant directions.

Let `𝒳` be a theta family and `k` a field.
(a) (*Drinfeld's lemma*) Let `x, x′` be objects over `k[ε]` reducing to `x₀`, and `c ∈ 𝓞_E` kill every point of `A_{x′}`
that vanishes modulo `ε`. Then some homomorphism `F : A_x → A_{x′}` reduces to multiplication by `c` on `A_{x₀}`, and
`F(y) = c·y′` whenever `y`, `y′` agree modulo `ε`.
(b) (*tangent bound*) Let `k` be algebraically closed, `M` a finite-dimensional `k`-vector space, `x₀` an object over `k` and `x` an object
over `k ⊕ M^*` (square-zero) reducing to `x₀`, with structure map `𝓞_E → k → k ⊕ M^*`. Assume that `D` is good at the
kernel of the structure map of `x₀`, that `x₀` is rigid (6.1) and is the reduction of an object over a valuation
subring of `ℂ` with a full level structure, and that for `l ≠ 0` in `M` the pull-back of `x` along
`k ⊕ M^* → k[ε]`, `(a, φ) ↦ a + φ(l)ε`, is not the constant deformation of `x₀`. Then `dim_k M ≤ n − 1`.

*Needs:* 4.3, 4.4, 6.1, 6.4, 7.1, 7.2; AbelianSchemesAndArithmeticModuli §A3.1 (factorisation through an isogeny).
PELModuli §M2.12 gives the bound only at primes `p > 2` unramified in `E`, which the route does not restrict to.

[ShortProof], `Lib/Shimura/Deformation/TangentBound` (`New.Variety.AgreeModEps`, `New.Variety.drinfeld_lift`,
`New.Variety.isLinear_and_pairing_eq_of_reduction`, `New.Variety.finrank_tangent_le_card_index_sub_one`)

### 7.4 The universal theta family

*Origin:* particular to this proof: a theta family over a smooth projective base of relative dimension `n − 1` over a
localisation of `𝓞_E`, with a dense family of complex points of the base, one for each analytic family of theta tori and
each parameter, at which the fibre is modelled on the corresponding theta torus; no moduli property is claimed. The
nearest published result is Mumford's construction of moduli of abelian varieties from theta-null values (D. Mumford,
*On the equations defining abelian varieties II*, Invent. Math. 3 (1967), 75–135).

*Method of the formal proof:* the base `S` is the smallest reduced closed subscheme of a product of projective spaces,
one factor for each level point, that contains the vectors of theta coordinates of the level points of every theta
torus of 5.5. Flatness over the good primes comes from 3.6 (c) and 6.5, and 6.7 builds the theta family on `S`.
Smoothness of relative dimension `n − 1` is checked along arcs whose closed point lies over a good prime: the analytic
families give `n − 1` independent directions at the generic point (7.6), and 7.3 bounds the tangent space at the closed
point by `n − 1`.

Let `D` be PEL data and `R ⊂ E` an `𝓞_E`-subalgebra. A *universal family* `𝒰` for `D` over `R` consists of: `R` a
Dedekind domain; an `R`-scheme `S` with a projective embedding over `R`, smooth of relative dimension `n − 1`; a theta
family over `S` (6.1); for each analytic family `f` (5.5) and each `b ∈ ℂ^{n−1}` a complex point `o(f, b)` of `S`,
these points being dense in `S`; for each `(f, b)` a model (6.2) of the object at `o(f, b)` on the theta torus of `f` at
`b`; and the condition that the complex points of the abelian scheme obtained from these models are holomorphic in
`(b, z)` for `b` in the domain of `f`.

Let `R` be the localisation of `𝓞_E` at a submonoid of non-zero-divisors, and `D` good over `R` (3.2). Then a universal
family for `D` over `R` exists.

*Needs:* 3.4, 3.6, 5.5, 6.5, 6.7, 7.3, 7.6.

Relation to PELModuli §§M2.8–M2.9: for the unitary data of §M5.5 and a neat level, those sections give a smooth separated
algebraic space of finite type with a universal object, which represents the moduli problem `M_H` of §M1.7, over the
integers of the reflex field with the primes outside a set of good primes inverted (the good primes divide neither the
discriminant of the order, nor the index of the lattice in its dual, nor the level). A universal family here has a
projective base, theta coordinates and the dense family of modelled points, at the primes good for `D` in the sense of
3.2, which may divide the discriminant of `𝓞_E`, and it has no moduli property. Neither statement implies the other;
whether the base here, with its theta family, is a union of components of `M_H` for the corresponding datum and level
is stated in neither roadmap.

[ShortProof], `Lib/Shimura/ThetaModuli/UniversalFamily` (`New.Variety.ThetaNull.ThetaClosure.exists_smooth_near_arc`,
`New.Variety.ThetaNull.nonempty_universalFamily`); `Lib/Shimura/IntegralModel/UniversalFamily`
(`New.Variety.UniversalFamily`)

### 7.5 Points of linear data in the fibre powers

*Origin:* particular to this proof: the points of a fibre power of the universal abelian scheme given by a moduli point,
its nonzero `𝔪`-torsion and its marked vectors, their identification up to isomorphism at the level `K(𝔑) ∩ K(𝔪)`, the
density and smoothness at level one, and the closures of graphs of translations; the nearest published result is the
description of the complex points of a Kuga–Sato variety over a unitary Shimura variety by an adelic double coset.

*Method of the formal proof:* two points are equal if and only if the objects are isomorphic compatibly with the
torsion and the marked vectors, which by 6.1 (c) and 6.4 is a homomorphism of modelled objects, hence a rational matrix
(6.2 (d)); conversely 6.2 (e). Smoothness of the fibre power from that of the base and the abelian scheme.

Let `𝒰` be a universal family for `D` over `R` with abelian scheme `𝒜 → S`. For a nonzero `𝔪 ∈ 𝓞_E` and `ν ∈ ℕ`, a
moduli point `a = (x, J, P)` with `ν` marked vectors determines a complex point `[a]_𝔪` of the fibre power of `𝒜` over
`S` indexed by the nonzero `𝔪`-torsion classes and `{1, …, ν}`: the object modelled on `(x, J)`, its nonzero
`𝔪`-torsion points and the images of the `P_i`.
(a) `[a]_𝔪 = [b]_𝔪` if and only if `a ≅ b` at level `K(𝔑) ∩ K(𝔪)` (3.1).
(b) At `𝔪 = 1` the fibre power `Z_ν` (with `ν` factors) is smooth over `R` of relative dimension `n − 1 + ν·n·f`, the
points `[a]_1` are dense in it, and for each `α ∈ 𝓞_E^ν` an endomorphism `m_α` of `Z_ν` sends `[a·(g, 1)]_1` to
`[a·(g, α)]_1` for all `g ∈ GU⁺`.
(c) For a finite family `γ_j = (𝔪_j, g_j)` of nonzero integers and elements of `GU⁺`, the *graph closure* is the reduced
closure, in the product of fibre powers, of the tuples `([a·g_j]_{𝔪_j})_j`; it is projective over `R`, and its complex
point attached to `a` depends only on the class of `a` at some level `K(𝔪)`.

*Needs:* 3.1, 6.1, 6.2, 6.4, 7.4.

Relation to PELModuli §M3.4 (complex points of PEL moduli): (a), with 6.3 and 7.6 (d), describes complex points by
moduli points (adelic frames with a reflection and marked vectors) up to rational isomorphism at a principal level, where
§M3.4 uses the double cosets `G^{(i)}(ℚ)∖(X × G(𝔸_f)/K)`; the reflection plays the part of the point of `X`, and the
frames, which are frames for varying matrices `β`, run through the forms that §M3.4 indexes by `ker¹(ℚ, G)`. The two
descriptions concern different spaces (the fibre powers over the base here, `M_K^ad(ℂ)` there) and are not compared in
either roadmap.

[ShortProof], `Lib/Shimura/IntegralModel/UniversalFamily` (`New.ThetaFamily.IsPointOf`,
`New.Variety.UniversalFamily.datumPoint`, `New.ThetaFamily.IsPointOf.eq_iff`,
`New.Variety.UniversalFamily.datumPoint_eq_iff`, `New.Variety.UniversalFamily.smooth_and_isDenseFamily_and_exists_comp_eq_act`,
`New.Variety.UniversalFamily.GraphClosure`, `New.Variety.UniversalFamily.GraphClosure.exists_level_point_eq`)

### 7.6 Analytic families immerse; arcs and complex points of graph closures

*Origin:* particular to this proof: the parameters of analytic families map holomorphically and immersively to the
fibre powers, finitely many analytic families reach every moduli point at a given level, every point of a graph closure
is the centre of an arc of objects, and every complex point of a graph closure comes from a moduli point; the nearest
published result is the uniformisation of unitary Shimura varieties by finitely many balls.

*Method of the formal proof:* holomorphy from the holomorphic uniformisations of `𝒰` (7.4) and 5.5 (a); immersion from
the condition on the derivative of the periods (5.5); finiteness from the finiteness of classes of signed frames
(9.3 (c)); arcs from the valuative criterion; surjectivity on complex points from 6.3 and 7.5 (a).

Let `𝒰` be a universal family and `ν ≥ 1` the number of marked vectors (in (b) any `ν ≥ 0`).
(a) Let objects `x(b)` over `ℂ` of a theta family, `b ∈ ℂ^{n−1}`, have models on the theta tori `Y_b` of an analytic
family `f`. If, for some `b` in the domain of `f`, the uniformised points are holomorphic at `(b, z)` for all `z`, then
`b ↦ x(b)`, as a family of complex points of the base, is a holomorphic immersion at `b`. For marked vectors `P` and
`𝔪 ≠ 0`, the map `q ↦ [f(q)]_𝔪`, `f(q)` the point of `f` at `q` for `P` (5.5), is a holomorphic immersion at every
`q = (b, ζ) ∈ ℂ^{n−1} × V^ν` with `b` in the domain.
(b) For `𝔪 ≠ 0` there are finitely many analytic families `f_k` such that every moduli point with `ν` marked vectors is
isomorphic at level `K(𝔪)` to the point of some `f_k`, for the marked vectors `0`, at a parameter `(b, ζ)` with `b` in
its domain.
(c) Every point of a graph closure `C`, and every complex point of it over `R`, is the centre of an arc (a map from the spectrum
of a valuation subring of `ℂ`) of objects.
(d) If a morphism from `C` to the fibre power `Z_ν` sends the point of `C` attached to each `a` to `[a]_1`, every complex
point of `C` over `R` is the point attached to some `a`.

*Needs:* 5.1, 5.5, 6.3, 7.4, 7.5, 9.3.

[ShortProof], `Lib/Shimura/IntegralModel/BallImmersion` (`New.Variety.AnalyticFamily.isHolomorphicImmersionAt_of_holomorphicAt`,
`New.Variety.ModuliPoint.exists_finite_analyticFamily_isLevelIso`,
`New.Variety.UniversalFamily.isHolomorphicImmersionAt_datumPoint`,
`New.Variety.UniversalFamily.GraphClosure.holomorphicAt_point`, `New.Variety.UniversalFamily.GraphClosure.exists_arc`,
`New.Variety.UniversalFamily.GraphClosure.exists_arc_centre_eq`, `New.Variety.UniversalFamily.GraphClosure.point_surjective`)

## Layer 8: Hecke correspondences and the Kuga–Sato model

Hecke operators of the unitary similitude group at split places are realised inside the group ring, with the safe places
and the elements `τ_{w,j}` of the congruence relation, the local terms of fixed points and neat levels (8.1). The model
is a tower of covers of the base with legs indexed by cosets, given by its list of properties, and the Hecke elements act
on any functor with descent (8.2). The congruence relation rests on a pointwise statement about Frobenius twists of Hecke
neighbours (8.3), and the model exists (8.4).

### 8.1 Hecke elements, safe places, local terms and neat levels

*Origin:* adapted from the published theory of Hecke operators on unitary similitude groups (for the Hecke algebra of a
pair, G. Shimura, *Introduction to the Arithmetic Theory of Automorphic Functions* (1971), ch. 3 and 7–8) and of neat
levels: here the Hecke algebra of `K(𝔑)` realised inside the group ring, the elements `τ_{w,j}` at safe split places,
which act on `K(𝔑)`-fixed vectors as the Hecke operators of `GL_n(E_w)` up to a central scalar, the local terms of fixed
points, and the neatness of levels inside all but finitely many places, which rests on (c): a rational automorphism of a
signed frame that is trivial modulo an ideal of large enough norm is `1`.

*Method of the formal proof:* (b) by the coset decomposition of the double coset of `diag(ϖ1_j, 1)`; (c) an automorphism
of a signed frame scales a form that is definite at a place `w ≠ v₀`, so its eigenvalues have absolute value `1` at
every infinite place, and the trace of `y − 1`, divisible by an ideal of large norm and bounded at every place, is `0`.

Let `K₀ = ℚ(√−d₀) ⊂ E`. For a group `G`, a subgroup `K` and a commutative ring `k`, an element `a = Σ a_g[g]` of the
group ring `k[G]` acts on every representation of `G`; its *coset function* is `Σ a_g 1_{gK}`. The *Hecke algebra*
`𝓗(𝔑)` (over `k`) is the set of `a ∈ k[GL_n(𝔸_f)]` supported on `GU⁺` that map `K(𝔑)`-fixed vectors to
`K(𝔑)`-fixed vectors in every representation; it is a subalgebra. For a split place `w` with conjugate `w̄`, let
`j_w : GL_n(E_w) → GL_n(𝔸_f)` send `h` to the element that is `(hᵀ)^{−1}` at `w`, the conjugate of `h` at `w̄` and `1`
elsewhere (a unitary element). A finite place `w` of `E` is *safe* for `𝔑` if the place `u` of `K₀` below it contains
`β₀ − b` for some `b ∈ ℤ` with `β₀ − b` coprime to its conjugate (so `u` splits and has prime norm), `𝔑 ∉ w`, and `𝔑`
lies in no place above `ū`. For a safe split place `w` and a subspace `A ⊂ k_wⁿ` of dimension `j`, let `γ_A ∈ GL_n(E_w)`
be an element of `GL_n(𝒪_w)·diag(ϖ_w 1_j, 1)·GL_n(𝒪_w)` whose reduction modulo `w` has kernel `A` (these represent the
cosets in the double coset), and `g_A = c_w^{−j}·j_w(γ_Aᵀ)`, where `c_w` is the scalar matrix of the conjugate of the
norm to `K₀` of the idele that is a uniformiser at `w` and `1` elsewhere. `τ_{w,j} = Σ_{dim A = j} [g_A]`. An element `f`
of `𝓗(𝔑)` is *regular* if `y ∈ GL_n(E)` has separable characteristic polynomial whenever the coset function of `f` is
nonzero at `x^{−1}y^{−1}x` for some `x ∈ GL_n(𝔸_f)`. `𝔑` is *neat* if `𝔑 ≠ 0` and every `y ∈ GL_n(E)` with
`x^{−1}yx ∈ K(𝔑)` and `Φ_{v₀}(y)ℓΦ_{v₀}(y)^{−1} = ℓ` for a signed frame `(x, ℓ)` is `1`.
For `P ∈ E[X]` such that `Φ_{v₀}(P)` has `|n|` distinct roots `r_1, …, r_n` (numbered), `j ∈ n`, `μ = r_j`, and
`α ∈ 𝓞_E^ν`: for each embedding `σ : E → ℂ` let `R_σ` be the multiset of the polynomials `rX` for the roots `r` of
`σ(P)` that are *Lie roots* and the constants `r` for the others, where the Lie roots are `r = μ` for `σ = Φ_{v₀}`,
`r ≠ μ̄` for `σ = conj Φ_{v₀}`, all roots for `σ = Φ_v` with `v ≠ v₀`, and none for `σ = conj Φ_v`. The *local term* is
`p_{α,P,j}(X) = L_j(r_j X)·Π_{i ≤ ν} Π_σ Π_{η ∈ R_σ} (1 − σ(α_i)η)`, with `L_j` the Lagrange polynomial that is `1` at
`r_j` and `0` at the other roots. The *marked reflection* of `y ∈ GL_n(E)` at `j` is `Q(Φ_{v₀}(y))` for the Lagrange
polynomial `Q` with value `1` at `r_j` and `−1` at the other roots of the characteristic polynomial.
(a) `τ_{w,j} ∈ 𝓗(𝔑)` for every safe split `w`.
(b) On `K(𝔑)`-fixed vectors of a representation `π`, `τ_{w,j}` acts as `π(c_w^{−j})` times the `j`-th Hecke operator of
`GL_n(E_w)` (for `GL_n(𝒪_w)`) acting through `j_w`.
(c) Let `(x, ℓ)` be a signed frame for `β` and `y ∈ GL_n(E)` with `Φ_{v₀}(y)ℓΦ_{v₀}(y)^{−1} = ℓ` such that
`(x^{−1}yx)^{−1}` is a frame for `c·1`, `c > 0` rational. Then `yᴴβy = cβ`, and every root `r` of the characteristic
polynomial of `y` under every `Φ_v`, `v` infinite, has `r r̄ = c`. If moreover `c = 1` and `x^{−1}yx ≡ 1` modulo `IÔ`
for an ideal `I` of `𝓞_E` with `N(I) > (2|n|)^{[E:ℚ]}`, then `y = 1`.
(d) For all but finitely many finite places `w`, every nonzero `𝔑 ∈ w` is neat.
(e) For `I ≠ 0` the `I`-torsion of `T_n` has `N(I)^{|n|}` elements; and for `𝔑 ≠ 0` and finitely many `(𝔞, g)` with
`g ∈ GU⁺` there is a level `𝔪` with `g^{−1}K(𝔪)g ⊂ K(𝔑) ∩ K(𝔞)` for all of them.

*Needs:* 3.1; AdelicUnitaryGroupsAndAlgebraicModularForms §3.1 (the Hecke operators `T_{w,j}`);
WeilRepresentationsOnBanachSpacesOfData §9.1 (single cosets indexed by subspaces).

The library has the Hecke ring of a pair as the double-coset ring with its operators on invariants
(`HeckeRing`, `HeckeCosetModule.instRingHeckeRing`, `HeckeCoset.heckeSum`), in another model; identifying the group-ring
subalgebra `𝓗(𝔑)` with it is not done.

Relation to PELModuli §§M2.2–M2.3 (neat subgroups): neatness here is a condition on `𝔑` alone, that the rational
automorphisms of signed frames at level `K(𝔑)` be trivial, which is what §M2.3 derives from neatness in the sense of
§M2.2 (Pink's condition on eigenvalues) for the objects of `M_H`. Neatness of `K(𝔑)` in the sense of §M2.2 implies
neatness of `𝔑` here: the eigenvalues of such an automorphism `y` are algebraic integers, as `x^{−1}yx ∈ GL_n(Ô)`, and
by (c), with `c = 1`, all their conjugates have absolute value `1`; so they are roots of unity, hence `1` under §M2.2;
and `y`, being unitary for the definite form `Φ_w(β)` at a place `w ≠ v₀`, is then `1`. The converse is not asserted.

[ShortProof], `Lib/Shimura/HeckeTower/HeckeData` (`New.Variety.fixedToEigen`, `New.Variety.heckeAlgebra`,
`New.Variety.IsSafe`, `New.Variety.SafePlace`, `New.Variety.invHeckeIsogeny`, `New.Variety.heckeSum`,
`New.Variety.IsRegularHecke`, `New.Variety.localTerm`, `New.Variety.markedReflection`, `New.Variety.IsNeat`,
`New.Variety.IsSignedFrameFor.similitude_and_root_norm`, `New.Variety.IsSignedFrameFor.eq_one_of_congr_large_norm`,
`New.Variety.eventually_isNeat`); `Lib/Shimura/HeckeTower/Model` (`New.Variety.conjAtSplit_mem_GU`,
`New.Variety.heckeSum_mem_heckeAlgebra`, `New.Variety.asAlgebraHom_heckeSum`, `New.Variety.tauHecke`,
`New.card_torsionBySet_adelicTorsion`, `New.Variety.exists_level_conj_mem`)

### 8.2 The Kuga–Sato model and the action of Hecke elements

*Origin:* particular to this proof: a tower of reduced projective covers of a smooth proper base over a localisation
of `𝓞_E`, given by the list of properties that the point counts and the cohomology use (legs indexed by cosets, deck
groups, complex points, tangent polynomials at fixed points, the congruence relation), and the commuting action of the
Hecke elements on any contravariant functor with descent; the nearest published objects are the Kuga–Sato varieties
over compact unitary Shimura varieties of signature `(1, n − 1)` with their Hecke correspondences (for the action of the
Hecke algebra of a pair by correspondences, G. Shimura, *Introduction to the Arithmetic Theory of Automorphic Functions*
(1971), ch. 3 and 7–8).

*Method of the formal proof:* the operator `t(w, j)` is defined on the image of the pull-back along the leg of `1` by
summing the pull-backs along the legs over `τ_{w,j}`; the sum is invariant under the deck group, so it descends; the
commutation and the word identity are checked on deep levels, where the legs of products are composites of legs.

*Tangent polynomials.* For a field `k`, morphisms `c, u : W → Z` of `k`-schemes (or functors on `k`-algebras) and
`y ∈ W(k)`, a *tangent polynomial of rank `d`* of `(c, u)` at `y` is a `P ∈ k[X]` as in
CohomologyOfFunctorsOnTestRings §6.6: `P(s) = P(0)·det(1 − sA)` for an endomorphism `A` of a `d`-dimensional space of
tangent vectors `f(t)` at `y` with `t ↦ c(f(t))` injective and `u(f(t)) = c(f(At))`.
*Congruence relations.* For maps `u_i : W → Z` of `R`-schemes (`i` in a finite set), integers `m_i`, exponents `a_i ∈ ℕ`,
a prime `p` and a set `𝔭 ⊂ R`, the `u_i` *satisfy the congruence relation* with coefficients `m_i` and Frobenius
exponents `a_i` modulo `𝔭` if for every field `k` of characteristic `p` and every `x ∈ W(k)` whose structure map
`R → k` kills `𝔭`, the formal sum `Σ_i m_i [u_i(x)∘Frob^{a_i}]` of points of `Z(k)` is zero, `Frob` the map
`y ↦ y^p` of `k`. *Galois coverings.* `c : W → Z` with a finite group `Δ` acting on `W` is a *Galois covering* as in
CohomologyOfFunctorsOnTestRings §3.5 (`Δ` acts over `Z`, `c` is surjective, and `Δ` acts simply transitively on the
fibres of `c` on points with values in fields of characteristic `0`).

Let `E ⊃ K₀`, `n` a finite set, `𝔑 ∈ 𝓞_E`, `ν ∈ ℕ` and `R ⊂ E` an `𝓞_E`-subalgebra. A *level* is a finite set of pairs
`(𝔞, g)` with `𝔞` a nonzero element of `𝓞_E` and `g ∈ GU⁺`, ordered by inclusion. A *model* `𝓜` consists of:
- an `R`-scheme `Z`, smooth of relative dimension `d` and proper over `R`;
- for each level `i`, a reduced `R`-scheme `W_i` with a projective embedding over `R`, a set `s_i ⊂ GL_n(𝔸_f)`
  containing `1`, and *legs* `p_g : W_i → Z` for the cosets `gK(𝔑)`, `π_i = p_1`;
- for every `g ∈ GU⁺` and level `j`, for all large `i`: `g ∈ s_i` and some `F : W_i → W_j` has `p_q∘F = p_{gq}` for
  `q ∈ s_j`;
- a finite group `Δ_i` acting on `W_i`, such that for each `δ` some `κ ∈ K(𝔑)` has `p_q∘δ = p_{κq}` for `q ∈ s_i`, and
  `π_i` is a Galois covering with group `Δ_i`;
- endomorphisms `m_α` of `Z`, `α ∈ 𝓞_E^ν`;
- for each moduli point `a` with `ν` marked vectors a complex point `[a]_i ∈ W_i(ℂ)`, every complex point of `W_i`
  being of this form, with `π_i[a]_i = π_i[b]_i` if and only if `a ≅ b` at level `K(𝔑)`, and
  `m_α(p_g[a]_i) = π_i[a·(g, α)]_i` for `g ∈ s_i ∩ GU⁺`;
- (*tangent*) for `g ∈ s_i ∩ GU⁺`, `α`, `a`, and `z ∈ GL_n(E)` with separable characteristic polynomial, an isomorphism
  `a·(g, α) ≅_{K(𝔑)} a`, with the reflection of `a` the marked reflection of `z` at `j`: the local term
  `p_{α, char(z), j}` (8.1) is a tangent polynomial of rank `d` of `(π_i, m_α∘p_g)` at `[a]_i`;
- (*congruence*) for every safe split place `w` with `q_w = p^f`, every level `i` with all `g_A ∈ s_i`, and every
  `𝔭 ⊂ R` containing the image of `w`: the legs `p_{g_A} : W_i → Z` satisfy the congruence relation modulo `𝔭` with
  coefficients `(−1)^{r_A} q_w^{r_A(r_A−1)/2}` and Frobenius exponents `(|n| − r_A)f`, `r_A = dim A`.

Let `𝓜` be a model, `k` a commutative ring and `F` a contravariant functor from `R`-schemes to `k`-modules such that
for every level `i` the pull-back `F(π_i)` is injective with image containing the `Δ_i`-invariants of `F(W_i)`, and
let levels `I(w)` be such that `g_A ∈ s_{I(w)}` for every `A`, for each safe split place `w`. Then there are commuting operators `t(w, j)` on
`F(Z)`, for safe split `w` and `j ∈ ℕ`, such that `F(π_{I(w)})∘t(w, j)` is the sum of the pull-backs along the legs over
`τ_{w,j}`, and such that, for every commutative ring `k′`, on deep levels every word in the `τ_{w,j}`, multiplied by any
element of `k′[GL_n(𝔸_f)]` supported on `GU⁺`, acts through the legs as the same word in the `t(w, j)`.

*Needs:* 3.1, 8.1.

The operators come from elements supported on the monoid `GU⁺`, not on a group, and the identities between them are
obtained on deep levels of the tower only. PELModuli §M1.13 defines Hecke correspondences on the rational moduli
problem for every element of `G(𝔸^{∞,□})`; here the Hecke elements act through the legs of a model, on the functor `F`,
and no comparison with §M1.13 is made.

[ShortProof], `Lib/Shimura/HeckeTower/Model` (`New.Variety.Model`, `New.Variety.Model.IsHeckeAction`,
`New.Variety.Model.exists_isHeckeAction`); `Lib/Cohomology/Etale/Basic` (`New.Variety.IsTangentPoly`,
`New.Variety.CongruenceRelation`, `New.Variety.IsGaloisCovering`)

### 8.3 The pointwise congruence relation at a split place

*Origin:* adapted from the Eichler–Shimura congruence relation for unitary Shimura varieties of signature `(1, n − 1)`
at split places (Wedhorn, *Congruence relations on some Shimura varieties*, J. reine angew. Math. 524 (2000), 43–71;
the method follows Katz–Mazur (1985), ch. 13, and M. Harris, R. Taylor (2001), III.4). What is stated is the geometric
input of that relation, one geometric point of the special fibre at a time and for the points of the universal family;
the ordinary locus plays no part.

*Method of the formal proof:* the `w`-torsion of `T_n` is `k_wⁿ`, compatibly with integral matrices, and the Hecke
neighbour attached to `A` is the target of an isogeny `ψ_A` of multiplier `q_w^{dim A}` acting on torsion by `g_A^{−1}`
(6.2 (e)); its reduction, twisted by Frobenius, is an isogeny of multiplier `q_w^n` from `x₀` whose kernel depends only
on the reductions of the torsion sections over `A`. A nonzero `w`-torsion section reduces to zero (7.1 (d)); adding the
line `W` it spans does not change the kernel, and the rigidity 6.1 (c) identifies the targets.

Let `E ⊃ K₀`, `𝒰` a universal family for `D` over `R` with `β = β₀`, `V ⊂ ℂ` a valuation subring, and `s` a `V`-point
of level one of the fibre power (7.5) with moduli point `z`. Let `k` be an algebraically closed field of characteristic
`l`, `π : V → k` onto, `x₀` the reduction of the object under `s`, and `w` a split place with `w = ker(𝓞_E → k)`, good
for `D` and safe for `𝔑`. For each subspace `A ⊂ k_wⁿ` let `α_A` be the `V`-point of the fibre power with moduli point
`z·(g_A, 1)` (the Hecke neighbour), and `m_A` the integer with `l^{m_A} = q_w^{n − dim A}`. Then there is a nonzero
subspace `W ⊂ k_wⁿ` such that the reduction of `α_A` twisted by `t ↦ t^{l^{m_A}}` depends only on `A + W`.

*Needs:* 4.3, 6.1, 7.1, 7.5, 8.1.

[ShortProof], `Lib/Shimura/CongruenceRelation/HeckeNeighbours` (`New.Variety.exists_residue_torsion_emb`,
`New.Variety.frobeniusTwist`, `New.Variety.IsTwistedReduction`, `New.Variety.IsTwistedReduction.exists_comp_eq_smul`,
`New.Variety.UniversalFamily.exists_ne_bot_factorsThrough_sup`)

### 8.4 Existence of the model

*Origin:* particular to this proof: a model in the sense of 8.2 over `R`, for every `ν ≥ 1`, built from a universal
family at a neat level with `β = β₀` that is good at all safe places; its base is the fibre power of 7.5 (b) over the
theta closure of 7.4, and its level covers are the graph closures of 7.5 (c). The nearest published result is the
existence of integral Kuga–Sato models with level covers for unitary Shimura varieties of signature `(1, n − 1)`, with
their congruence relation (M. Harris, R. Taylor, *The Geometry and Cohomology of Some Simple Shimura Varieties* (2001),
III.4; R. Kottwitz, *Points on some Shimura varieties over finite fields*, J. Amer. Math. Soc. 5 (1992), §5).

*Method of the formal proof:* `Z` is the fibre power of 7.5 (b) and `W_i` the graph closures of 7.5 (c); the legs are
projections, the deck groups come from the levels (8.1 (e)), and the complex points from 7.6 (d). The tangent
polynomial at a fixed point comes from the ball family 5.5 (d): through the universal jet, its parameters give the
tangent vectors at the point of `a`, on which `z` acts through `K`. For the congruence relation, a field point of `C` is
the centre of an arc (7.6 (c)); along the arc 8.3 applies with a line `W`, and the formal sum over subspaces `A` cancels
because the twisted reductions depend only on `A + W`: for `U ⊃ W` of dimension `u`, the `A` with `A + W = U` are `U`
and the `q^{u−1}` hyperplanes of `U` not containing `W`, whose weights `(−1)^u q^{u(u−1)/2}` and
`(−1)^{u−1} q^{(u−1)(u−2)/2}` cancel in total.

Let `E ⊃ K₀` with `d₀ ≡ 3 (mod 4)`, `D` PEL data with `β = β₀`, `𝔑` neat, `D` good at every finite place safe for
`𝔑`, and `𝒰` a universal family for `D` over `R`.
(a) For `ν ≥ 1` and every graph closure `C` with `ν` marked vectors with a morphism `c` to the fibre power sending the
point of `a` to `[a]_1`, every safe split place `w` at which `D` is good with `q_w = l^f`, and every `𝔭 ⊂ R` containing
the image of `w`: maps `u_A` from `C` to the fibre power that translate the complex points by `g_A` satisfy the
congruence relation modulo `𝔭` with coefficients `(−1)^{r_A} q_w^{r_A(r_A−1)/2}` and Frobenius exponents `(n − r_A)f`.
(b) For every `ν ≥ 1` there is a model (8.2) for `n`, `d₀`, `𝔑`, `ν` over `R`.

*Needs:* 5.5, 7.5, 7.6, 8.1, 8.2, 8.3.

[ShortProof], `Lib/Shimura/IntegralModel/TowerExistence` (`New.Variety.UniversalFamily.GraphClosure.congruenceRelation`,
`New.Variety.UniversalFamily.GraphClosure.isTangentPoly_localTerm_of_translate`, `New.Variety.exists_model`)

## Layer 9: Fixed points, occurrence and eigenquotients in cohomology

The congruence relation passes to cohomology, and inertia acts trivially (9.1). The count of fixed points of Hecke
correspondences on the model is compared with a sum over the definite unitary group: test functions (9.2), the trace
on definite forms as an orbit sum (9.3), the agreement of marked and definite sums (9.4), and the Lefschetz count
through the local terms (9.5) give that the eigensystem of a definite test eigenform occurs in each Hodge weight (9.6).
The largest Hecke-eigen quotient of the cohomology of the model is then a Galois representation with the expected
local properties (9.7, 9.8).

### 9.1 The congruence relation in cohomology, and unramified cohomology

*Origin:* adapted from the theorems that smooth proper reduction makes ℓ-adic cohomology unramified and that Frobenius
relations pass to cohomology in the Eichler–Shimura argument (the Stacks project, Tags 0GKD (SGA4 XVI 2.2) and 03SN
(SGA5 XV); Deligne, *Formes modulaires et représentations ℓ-adiques*, Sém. Bourbaki 355 (1969)): here the cohomology
is `Vⁿ` of CohomologyOfFunctorsOnTestRings, the base is a valuation ring of `Ω`, and the relation on points to be carried
to cohomology is a congruence relation in the sense of 8.2.

*Method of the formal proof:* a class on `Y_Ω` extends to `Y_A` by smooth base change and restricts to the special
fibre; on the special fibre the absolute Frobenius acts trivially (c), and a formal combination of morphisms that cancels
at every geometric point acts as `0`; proper base change for `W` gives injectivity on the special fibre.

Let `ℓ` be a prime, `Ω` an algebraic closure of `ℚ`, `R → Ω` a ring map, `Γ` a group acting on `Ω` by `R`-algebra
automorphisms (so on `Vⁿ(Y)` for `R`-schemes `Y`), and `A ⊂ Ω` a valuation ring containing the image of `R`, with a
prime `p` in its maximal ideal and `ℓ` a unit in `A`. Let `R` be Noetherian, and `W`, `Y` proper over `R`, with `Y`
smooth of relative dimension `d` over `R`.
(a) Let `g ∈ Γ` be a Frobenius for `p^f` at `A` (it stabilises `A` and acts as `x ↦ x^{p^f}` modulo its maximal ideal),
and `u_i : W → Y`, `m_i ∈ ℤ`, `e_i ∈ ℕ` satisfy the congruence relation (8.2) with Frobenius exponents `e_i f` modulo
the preimage in `R` of the maximal ideal of `A`. Then `Σ_i m_i·u_i^*(g^{−e_i}x) = 0` in `Vⁿ(W)` for every
`x ∈ Vⁿ(Y)`.
(b) The inertia group of `A` in `Γ` acts trivially on `Vⁿ(Y)`.
(c) For a functor `U` on rings that has points only in rings where `p = 0`, the endomorphism `x ↦ x∘(b ↦ b^{p^j})`
acts as the identity on `Vⁿ(U)`.

*Needs:* 8.2; CohomologyOfFunctorsOnTestRings §§1.3, 1.5, 3.4, 4.3, 5.6 (`Vⁿ`, functoriality, charting, base changes).

The formal proof assumes a charting condition on `Y` in place of smoothness (and no Noetherian hypothesis); it derives
that condition for schemes proper and smooth of relative dimension `d` over a Noetherian ring.

[ShortProof], `Lib/Shimura/CongruenceRelation/EichlerShimura` (`New.Variety.ellAdicCohom.frobEnd`,
`New.Variety.ellAdicCohom.ellAdicPull_frobEnd`, `New.Variety.ellAdicCohom.congruence_relation`,
`New.Variety.ellAdicCohom.galoisAction_eq_one_of_inertia`)

### 9.2 Test functions with a cuspidal type

*Origin:* particular to this proof: a Hecke element of `K(𝔑)` all of whose positive powers are regular, map `K(𝔑)`-fixed
vectors to eigenvectors of a cuspidal type at one split place, and do not kill a given test vector; the nearest
published results are the simple trace formulas obtained from cuspidal types and Iwahori–Hecke operators.

*Method of the formal proof:* at `w₀` the element averages against the cuspidal type; at `w₁` it is a central translate
of an injective Iwahori–Hecke operator `U_t` with `t` strictly dominant; products of double cosets of strictly dominant
elements are strictly dominant, and an element that is strictly dominant at one place has separable characteristic
polynomial, which gives regularity of all powers.

Let `a = |n|`. For a split place `w`, the *level at `w`* is `{h ∈ GL_a(E_w) : j_w(h) ∈ K(𝔑)}` (8.1), and `I_w ⊂ GL_a(𝒪_w)`
is the pro-`p` Iwahori subgroup (upper unitriangular modulo `w`). A *cuspidal type* at `w` is a subgroup
`J ⊂ GL_a(𝒪_w)` with a character `χ : J → ℂ^×` such that for every idempotent `ε ≠ 0, 1` of `M_a(E_w)` some
`j = 1 + εY(1 − ε) ∈ J` has `χ(j) ≠ 1`. `g ∈ GL_a(𝔸_f)` is *strictly dominant at `w`* if the inverse transpose of `g_w`
lies in `I_w·diag(s)·I_w` with `i ↦ |s_i|_w` strictly increasing. For a complex representation `π` of `GL_a(𝔸_f)`, a
vector `v` is a *test vector* for `(w₀, w₁, J, χ)` if `w₀ ≠ w₁` are split places, `𝔑 ∉ w̄₀`, `𝔑 ∈ w₁`, `𝔑 ∉ w̄₁`, the
level at `w₀` lies in `J ⊂ GL_a(𝒪_{w₀})` with `(J, χ)` a cuspidal type, the level at `w₁` lies in `I_{w₁}`, `v ≠ 0`,
`π(j_{w₀}(h))v = χ(h)v` for `h ∈ J`, and `v` is fixed by `j_{w₁}(GL_a(𝒪_{w₁}))`.
(a) Products of elements strictly dominant at `w` are strictly dominant at `w`. If `𝔑 ∉ w̄`, the level at `w` lies in
`I_w`, and `f ∈ 𝓗(𝔑)` is supported on elements strictly dominant at `w`, then all positive powers of `f` are regular.
(b) Let `φ` be a `K(𝔑)`-fixed test vector for `(w₀, w₁, J, χ)` in `π`, and `c ∈ 𝓗(𝔑)` supported on similitudes whose
component at `w₁` is `1`, with `π(c)φ = φ`. Then there is `b ∈ 𝓗(𝔑)` such that for every `m ≥ 0`:
`π((bc)^m)φ ≠ 0`, `(bc)^{m+1}` is regular, and `(bc)^{m+1}` maps `K(𝔑)`-fixed vectors to vectors on which `j_{w₀}(J)`
acts by `χ`, in every representation.

*Needs:* 8.1; IntegralRepresentationsOfGeneralLinearGroups §§6.1, 6.3, 6.4 (`U_t`, its injectivity, twisted conjugacy).

[ShortProof], `Lib/Shimura/TraceFormula/TestFunction` (`New.Variety.IsTestVector`, `New.Variety.exists_local_hecke_element`,
`New.Variety.dominant_doubleCoset_mul`, `New.Variety.mul_mem_strictlyDominantAt`,
`New.Variety.isRegularHecke_of_strictlyDominantAt`, `New.Variety.exists_iwahori_hecke_element`,
`New.Variety.exists_test_function`)

### 9.3 The trace on definite forms as a sum over marked triples

*Origin:* adapted from the simple trace formula and its form for algebraic modular forms (J. Arthur, L. Clozel, *Simple
algebras, base change and the advanced theory of the trace formula* (1989), ch. 1 §2, after Deligne and Kazhdan;
Dummigan, *A simple trace formula for algebraic modular forms*, Exp. Math. 22 (2013)), on definite unitary groups: here
an abstract weighted trace formula for right translations on equivariant functions, the finiteness of classes of signed
frames, and the trace of a regular Hecke element on definite forms at a neat level as a finite sum over classes of
triples.

*Method of the formal proof:* the space of definite forms is identified with functions on finitely many double cosets
(by Mahler's criterion, signed frames lie in finitely many classes), and the trace of right translation is computed
coset by coset; at a neat level the stabilisers are trivial, and grouping by the conjugacy class of `y` gives the orbit
sum.

A *definite form* of level `𝔑` with coefficients in a representation `ξ` of `GL_n(E)` on `W` is a function
`φ : GL_n(𝔸_f) → W` with `φ(yx) = ξ(y)φ(x)` for `y ∈ GL_n(E)`, `φ(xk) = φ(x)` for `k ∈ K(𝔑)`, and `φ(x) = 0` unless `x`
is a frame for some `β` that is positive definite at every infinite place; `𝓗(𝔑)` acts by right translation. A *marked
triple* is `(xK(𝔑), y, μ)` with `x ∈ GL_n(𝔸_f)`, `y ∈ GL_n(E)`, `μ ∈ n`, with `GL_n(E)` acting by
`z·(xK, y, μ) = (zxK, zyz^{−1}, μ)`. For `f ∈ 𝓗(𝔑)` and `ω : E[X] × n → ℂ`, the *marked* (resp. *definite*) count term
of the orbit of `(xK, y, μ)` is `f̃(x^{−1}y^{−1}x)·ω(char y, μ)` if `(x, R)` is a signed frame, and `0` otherwise, where
`f̃` is the coset function of `f`, and `R` is the marked reflection of `y` at `μ` (8.1) (resp. `R = 1`).
(a) The count terms are well defined: they do not depend on the representative of the orbit or of the coset; for
`g ∈ GU`, `(xg, ℓ)` is a signed frame if and only if `(zx, Φ_{v₀}(z)ℓΦ_{v₀}(z)^{−1})` is, for `z ∈ GL_n(E)`; the coset
function of `f ∈ 𝓗(𝔑)` is invariant under conjugation by `K(𝔑)` and supported on `GU⁺`.
(b) (*weighted trace formula*) Let `A` be a field, `G` a group, `e : Γ → G` a homomorphism, `ρ` a representation of `Γ`
on a finite-dimensional `A`-vector space `W`, `K ⊂ G`, `D ⊂ G`, and `M` an `A`-vector space identified with the functions `G → W` that are
`ρ`-equivariant along `e`, vanish on `D` and are right `K`-invariant. Let `r_i ∈ G` and weights `w_i ∈ A` (finitely many)
be such that, for `g ∉ D`, the sets `S_i(g) = {γ : g^{−1}e(γ)r_i ∈ K}` are finite with `Σ_i w_i·#S_i(g) = 1`, and empty
for `g ∈ D`. Let `σ` be an automorphism of `G` with `σ(K) = K`, and `T` the operator `ψ ↦ a·(s∘ψ∘σ^{−1})` for
`a ∈ A[G]` (right translation) and `s ∈ End W`. Then `M` is finite-dimensional and
`tr T = Σ_i w_i Σ_γ ã(r_i^{−1}σ(e(γ))σ(r_i))·tr(s ρ(γ))`.
(c) For an open subgroup `U ⊂ GL_n(𝔸_f)`, the `x` such that `(x, ℓ)` is a signed frame for some `ℓ` lie in finitely many
classes of `GL_n(E)\GL_n(𝔸_f)/(GU ∩ U)`.
(d) Let `𝔑` be neat and `W` finite-dimensional. Then the definite forms are finite-dimensional, and the trace of
`f ∈ 𝓗(𝔑)` is `Σ_j Σ_{y ∈ GL_n(E)} f̃(x_j^{−1}yx_j)·tr ξ(y)` over representatives `x_j` of the finitely many double
cosets `GL_n(E)\GL_n(𝔸_f)/K(𝔑)` of definite frames. If moreover `f` is regular and
`tr ξ(y^{−1}) = Σ_{i ∈ n} ω(char y, i)` whenever `char y` is separable, then the definite count terms of `(f, ω)` have
finite support and `tr(f | definite forms) = Σ` of the definite count terms over all orbits.

*Needs:* 3.1, 8.1; ShortGRH background (the Mahler–Godement criterion for frames of varying forms: for every compact
`C₀ ⊂ GL_n(𝔸)` (`𝔸` the adele ring of `E`, AdelicUnitaryGroupsAndAlgebraicModularForms §2.1) there are a finite set
`F ⊂ M_n(E)` and compact sets `C ⊂ M_n(𝔸)`, `C_f ⊂ GL_n(𝔸_f)` such that for every invertible `J ∈ M_n(E)` and every
`y ∈ GL_n(𝔸)` with `yᴴJy ∈ C₀` there are a basis `Y` of `Eⁿ` and a set `s` of its vectors spanning a `J`-isotropic
subspace for which the `J`-dual basis `W` of `Y` has `W⁻¹y` in `C_f` at the finite places and, `Z` being `W` with its
vectors in `s` replaced by `0`, `y⁻¹Z ∈ C` and `ZᴴJZ ∈ F`; [ShortProof] `Lib/Adelic/Reduction/FiniteVolume`
(`New.exists_isBoundedDualBasis`)).

[ShortProof], `Lib/Shimura/TraceFormula/DefiniteTrace` (`New.trace_eq_weighted_sum`,
`New.Variety.finite_isSignedFrame_classes`, `New.Variety.definiteForms`, `New.Variety.finite_definiteForms`,
`New.Variety.finite_support_countTerm_definite`, `New.Variety.trace_definiteForms_eq_finsum_countTerm`);
`Lib/Shimura/HeckeTower/HeckeData` (`New.Variety.MarkedTriple`, `New.Variety.countTerm`);
`Lib/Shimura/Transfer/MarkedPairs` (`New.Variety.isSignedFrame_mul_iff`, `New.Variety.finsum_countTerm_eq_sum`,
`New.Variety.heckeAlgebra.heckeCosetFn_conj`, `New.Variety.heckeAlgebra.mem_GUPlus_of_ne_zero`,
`New.Variety.countTerm_mk`)

### 9.4 Marked and definite sums agree

*Origin:* particular to this proof: for a regular Hecke element with a cuspidal type at a split place, in an odd number
of variables, the sums of the marked and of the definite count terms are equal, with no spectral side; the nearest
published result is the comparison of simple trace formulas for inner forms of unitary groups that differ at a real
place, and the vanishing of the non-elliptic terms of a simple trace formula (J. Arthur, L. Clozel, *Simple algebras,
base change and the advanced theory of the trace formula* (1989), ch. 1 §2, after Deligne and Kazhdan; Dummigan, *A
simple trace formula for algebraic modular forms*, Exp. Math. 22 (2013)).

*Method of the formal proof:* the two sums are compared class by class, according to the characteristic polynomial of
`y`. If it is separable and reducible, an idempotent polynomial in the component of `y` at `w₀` defines a unipotent
group; translation along it permutes the triples of a class and multiplies each term by a value `χ(j)^{−1} ≠ 1` of the
cuspidal type, so the terms of each of its orbits add up to `0`, for the marked and for the definite count alike. If it
is irreducible and `|n|` is odd, the change of signs of AdelicUnitaryGroupsAndAlgebraicModularForms §7.9, for sign
patterns of product `1`, matches the marked classes with the definite ones.

Let `𝔑` be neat, `|n|` odd, `f ∈ 𝓗(𝔑)` regular, `(J, χ)` a cuspidal type at a split place `w₀` (9.2) such that `f` maps
`K(𝔑)`-fixed vectors to vectors on which `j_{w₀}(J)` acts by `χ`, in every representation, and `ω` any weight.
(a) If `ω(P, ·) = 0` for every irreducible `P`, the sum of the marked count terms and the sum of the definite count terms
of `(f, ω)` are both `0`.
(b) For any `f ∈ 𝓗(𝔑)` (no neatness or regularity), if `ω(P, ·) = 0` for every `P` that is not irreducible, the marked
and the definite sums of `(f, ω)` agree.
(c) If the marked and definite count terms of `(f, 1)` have finite support, then for every `ω` the sum of the marked
count terms of `(f, ω)` equals the sum of the definite count terms.

*Needs:* 8.1, 9.2, 9.3; AdelicUnitaryGroupsAndAlgebraicModularForms §7.9 (the change of signs).

[ShortProof], `Lib/Shimura/TraceFormula/MarkedDefiniteSums` (`New.Variety.IsCuspidalType.exists_mem_range_splittingRadical`,
`New.Variety.finsum_countTerm_eq_zero_of_reducible`, `New.Variety.isSignedFrame_iff_hasSignType`,
`New.Variety.finsum_markedTerm_eq_of_irreducible`, `New.Variety.finsum_markedTerm_eq_finsum_definiteTerm`,
`New.Variety.finsum_countTerm_marked_eq_definite`)

### 9.5 The Lefschetz count over marked pairs

*Origin:* particular to this proof: if, on deep levels of a model, the Hecke correspondences of a Hecke element form a
null family for the holomorphic Lefschetz count in degree `h`, then the element is `h`-null, the sum of the marked count
terms weighted by the coefficients of `X^h` of the local terms being zero; the nearest published results are the
holomorphic Lefschetz fixed-point formula and the counting of fixed points of Hecke correspondences on Shimura
varieties.

*Method of the formal proof:* (c) is a count of the coincidences of `m_α∘p_g` and `π_i` on `W_i`. Each coincidence
determines a marked pair, using (a); by the Galois covering of 8.2 the
coincidences over one marked pair number `#Δ_i` times the lattice index `[B^{−1}Λ : Λ]` of (b), `B = 1 − 2αz`. That index
equals the value at `1` of the local term, so it cancels the denominator `P(1)` in the definition of a null family; the
tangent polynomials themselves are the local terms, by the tangent condition of 8.2.

For maps `u_i : W → Z` of `R`-schemes, weights `a ∈ k^{(I)}` (`k` a field over `R`), a rank `d` and a degree `h`, the
`u_i` form a *null family* if they satisfy the conclusion of CohomologyOfFunctorsOnTestRings §7.5 with the weights `a`:
for every `c : W → Z`, tangent polynomials `P_{i,y}` of rank `d` with `P_{i,y}(1) ≠ 0` at all coincidences `(i, y)`
(`a_i ≠ 0`, `y ∈ W(k)`, `c(y) = u_i(y)`) force finitely many coincidences and
`Σ a_i·coeff_{X^h}(P_{i,y})/P_{i,y}(1) = 0`. An element `b ∈ 𝓗(𝔑)` is *`h`-null* (for `ν`) if, when `b` is regular,
for every `α ∈ 𝓞_E^ν` the marked count terms of `(b, 1)` have finite support and the sum of the marked count terms of
`(b, ω)` is `0` for `ω(P, μ) = coeff_{X^h} p_{2α, P, μ}` (8.1). A system `θ` of complex numbers
`θ(w, j)`, `w` safe split, *occurs in weight `h`* (for `ν`) if for every finite combination `p = Σ_L c_L τ_L` of words in
the `τ_{w,j}` with `Σ_L c_L Π_{(w,j) ∈ L} θ(w, j) = 1`, some `b·p`, `b ∈ 𝓗(𝔑)`, is not `h`-null.
(a) For `y ∈ GL_n(E)` with separable characteristic polynomial, its marked reflections are reflections, and a reflection
`J` with `Φ_{v₀}(y)JΦ_{v₀}(y)^{−1} = J` is the marked reflection of `y` at exactly one index.
(b) If `x^{−1}zx` is integral, `β ∈ 𝓞_E` and `B = 1 − 2βz`, then `B` preserves `Eⁿ ∩ xÔⁿ`, `det B ≠ 0` and
`[B^{−1}Λ : Λ] = Π_{σ : E → ℂ} σ(det B)` for `Λ = Eⁿ ∩ xÔⁿ`.
(c) Let `𝓜` be a model (8.2) at a neat level, `b ∈ 𝓗(𝔑)` over `ℂ` and `h ∈ ℕ`. If for all large levels `i` and all `α`
the maps `m_α∘p_q : W_i → Z`, `q ∈ GL_n(𝔸_f)/K(𝔑)`, with weights `b̃(q)`, form a null family of rank `d` and degree
`h`, then `b` is `h`-null.

*Needs:* 3.1, 8.1, 8.2, 9.3.

[ShortProof], `Lib/Shimura/Transfer/MarkedPairs` (`New.Variety.ratConj_eigenReflection`,
`New.Variety.isReflection_markedReflection_and_exists_eq_iff`); `Lib/Shimura/Transfer/Lefschetz`
(`New.Variety.IsNullHecke`, `New.Variety.OccursInWeight`, `New.Variety.relIndex_comap_one_sub_two_smul`,
`New.Variety.Model.isNullHecke_of_isNullFamily`); `Lib/Cohomology/Etale/Basic` (`New.Variety.IsNullFamily`)

### 9.6 Eigensystems of definite test eigenforms occur in each weight

*Origin:* particular to this proof: the Hecke eigenvalues at the safe places of a definite form that is a test vector at
two split places occur, in the sense of 9.5, in each of the weights given by its coefficient system, in an odd number of
variables; the nearest published result is the transfer of eigensystems between unitary groups that differ at a real
place, by a comparison of trace formulas (Harris, Labesse, *Conditional base change for unitary groups*, Asian J. Math.
8 (2004), Thm 2.1.2; J.-P. Labesse, *Changement de base CM et séries discrètes* (2011), Thm 5.4), with fixed points
counted as in Goresky and MacPherson, *The topological trace formula* (2003), and Shimura, *On the trace formula for
Hecke operators*, Acta Math. 132 (1974).

*Method of the formal proof:* if every `b·p(τ)` were `h`-null, the coefficient of `X^h` in the local terms, summed over
the Lagrange basis, would reproduce the character of `ξ` (a computation with the bialternant of Schur polynomials), so
the marked sums of the powers of the test function of 9.2 would vanish; by 9.4 and 9.3 their traces on definite forms
vanish, so the test function acts nilpotently, contradicting 9.2 (b). For (b), `ξ` is a twisted Weyl representation and
its character is computed by Weyl's character formula.

Let `a = |n|` be odd and `f` the number of infinite places. A *test eigenform* for `(𝔑, ξ, θ)` is a definite form `φ`
of level `𝔑` with coefficients in `ξ` that is a test vector at two split places for the right regular action (9.2), with
`τ_{w,j}φ = θ(w, j)φ` for all safe `w` and all `j`.
(a) Let `ξ` act on a finite-dimensional `W`, and let `q_σ`, one for each embedding `σ : E → ℂ`, be polynomials with
integer coefficients in the coefficients `c_0, …, c_{a−1}` of a monic polynomial of degree `a` (so symmetric functions of
its roots), such that `tr ξ(y^{−1}) = Π_σ q_σ(σ(char y))`, each `q_σ` evaluated at the coefficients of `σ(char y)`, for
every `y` with separable characteristic polynomial, where `q_{Φ_{v₀}}` is the Schur polynomial with exponents
`l = (l_1, …, l_a)` (the quotient of `det(x_i^{l_j})` by the Vandermonde determinant of the roots `x_i`),
`q_σ = (−c_0)^m`, the `m`-th power of the product of the roots, for `σ = conj Φ_{v₀}` and for `σ = Φ_v`, `v ≠ v₀`, and
`q_σ` is arbitrary for `σ = conj Φ_v`, `v ≠ v₀`. Let `𝔑` be neat and `φ` a test eigenform for `(𝔑, ξ, θ)`.
Then for every `j`, `θ` occurs in weight `m(a − 1 + a(f − 1)) + l_j` (for `ν = Σ_σ deg q_σ + 1`, the degree of `q_σ`
being its total degree as a polynomial in `c_0, …, c_{a−1}`).
(b) For every weight `κ` (GaloisRepresentationsOfUnitaryEigenforms §1.1, weights and their jumps), every embedding
`i : K₀ → E` and `s₀ : K₀ → ℂ`, there are a representation `ξ` of `GL_a(E)`, integers `μ, N ≥ 0` and `A` (on the
embeddings of `K₀`) with `A(s₀) = μ`, such that (weights and jumps being taken for the CM type `Φ` of `E`): for
`y ∈ GL_a(E)` with `yᴴy = 1`, `ξ(y)` is the representation of weight `κ` (through the infinite places) at the entrywise
conjugate `ȳ`; scalars `conj(i(x))`, `x ∈ K₀^×`, act by `Π_s s(x)^{−A(s)}`; for every `σ` with `σ∘i = s₀` and every
jump `z` of `κ` at `σ`, `z + μ ≥ 0`; and for every such `σ`, `z`, every CM type `Ψ` with base place `v₀` with
`Ψ_{v₀} = σ` and `Ψ_v∘i ≠ s₀` for `v ≠ v₀`, every neat `𝔑` and every test eigenform for `(𝔑, ξ, θ)` (neatness, test
eigenforms and occurrence taken for `Ψ`), `θ` occurs in weight `z + μ` (for `ν = N + 1`).

*Needs:* 8.1, 9.2, 9.3, 9.4, 9.5; IntegralRepresentationsOfGeneralLinearGroups §§1.1, 1.3 (polynomial representations,
Schur matrices); HolomorphicDiscreteSeriesOfUnitaryGroups §7.1 (Weyl's character formula);
GaloisRepresentationsOfUnitaryEigenforms §1.1 (weights and their jumps).

[ShortProof], `Lib/Shimura/Transfer/WeightOccurs` (`New.Variety.prod_map_tauHecke_mem_spanOn`,
`New.Variety.sum_basis_comp_mul_prod_rootCoeffEval_eq`, `New.Variety.trace_definiteForms_rep_eq_zero_of_isNullHecke`,
`New.Variety.IsTestEigenform`, `New.Variety.occursInWeight_of_isTestEigenform`,
`New.Variety.mul_trace_weylRep_eq_prod_rootCoeffEval`, `New.Variety.exists_twistedWeylRep_scalar`,
`New.Variety.IsCoefficientSystem`, `New.Variety.exists_isCoefficientSystem`)

### 9.7 Eigenquotients

*Origin:* particular to this proof: the largest quotient of a family of ℓ-adic representations on which commuting
operators act by a given system of eigenvalues, with the passage of crystallinity, of Frobenius relations and of
Hodge–Tate jumps to it; the nearest published construction is the Hecke-eigen part of the cohomology of a Shimura
variety.

*Method of the formal proof:* the quotient of `ℚ̄_ℓ ⊗ ⊕V_i` by the span of the `(T_i(s) − θ(s))x`; its properties pass
along the surjection. For (d), if `u` is not a jump of the quotient, the weight-`u` part of `ℂ_ℓ ⊗ V_i` maps to zero, so
it lies in the span of the `(T(s) − θ(s))`, which gives `c` by a finite-dimensionality argument.

Let `Γ` be a topological group, `V_i` (`i` in a finite set) finite-dimensional continuous `ℚ_ℓ`-representations of `Γ`
(continuity of `g ↦ λ(ρ_i(g)x)` for linear forms `λ`), `T_i(s)` commuting endomorphisms commuting with `Γ`, and
`θ(s) ∈ ℚ̄_ℓ`. An *eigenquotient* is a representation `r` of `Γ` on `ℚ̄_ℓ^N` with `Γ`-equivariant `ℚ_ℓ`-linear maps
`F_i : V_i → ℚ̄_ℓ^N` whose images span, with `F_i∘T_i(s) = θ(s)F_i`, and through which every such family of maps to a
`ℚ̄_ℓ`-vector space factors uniquely.
(a) An eigenquotient exists and `r` is continuous; `N` may be `0`.
(b) If `Γ` maps to `Gal(ℚ̄_ℓ/ℚ_ℓ)` with open image and each `V_i` is crystalline, `r` is crystalline.
(c) In the situation of (b), if the image of `g^{−1}` in `Gal(ℚ̄_ℓ/ℚ_ℓ)` is a Frobenius for `ℓ^f` and
`Σ_k m_k T_i(t_k)∘φ_i(g^{d_k}, d_k f) = 0` on `B_max ⊗ V_i` for every `i`, where `φ_i(h, e)` is the linear Frobenius of
`V_i` at `(h, e)`, then the polynomial `Σ_k m_k θ(t_k) X^{d_k}` kills the linear Frobenius of `r` at `(g, f)`.
(d) In the situation of (b), if, for `γ ∈ Gal(ℚ̄_ℓ/ℚ_ℓ)`, the Hodge–Tate jump of `r` at `γ` in weight `u` is `0`, there
is a finite combination `c = Σ_L c_L L` of words in the `s` with `Σ_L c_L Π_{s ∈ L} γ(θ(s)) = 1` such that
`Σ_L c_L T_i(L)` kills every element of `ℂ_ℓ ⊗ V_i` of Hodge–Tate weight `u`, for every `i`.

*Needs:* CrystallineRepresentationsAndKisinModules §3.1 (crystallinity, linear Frobenius, Hodge–Tate jumps).

[ShortProof], `Lib/Shimura/Eigenspace` (`New.Variety.IsEigenQuotient`, `New.Variety.exists_isEigenQuotient`,
`New.Variety.IsEigenQuotient.isCrystalline`, `New.Variety.IsEigenQuotient.isKilledBy`,
`New.Variety.IsEigenQuotient.exists_sum_baseChange_eq_zero_of_jump_eq_zero`)

### 9.8 The Galois representation of an occurring eigensystem

*Origin:* particular to this proof: for a Hecke eigensystem at the safe places that occurs in a set of weights, a
continuous representation of `Gal(Ω/E)`, cut out of the cohomology of the base of the model by the eigensystem,
unramified and crystalline at the safe places, with the Hecke polynomial killing Frobenius and the weights among its
Hodge–Tate jumps at the base embedding; its dimension, its semisimplicity and its characteristic polynomials are left
open. The nearest published results are the constructions of Galois representations in the cohomology of Kuga–Sato
varieties over unitary Shimura varieties, with the Eichler–Shimura relation (Deligne, *Formes modulaires et
représentations ℓ-adiques*, Sém. Bourbaki 355 (1969), Thm 4.9; M. Harris, R. Taylor, *The Geometry and Cohomology of
Some Simple Shimura Varieties* (2001), ch. VII; Wedhorn, *Congruence relations on some Shimura varieties*, J. reine
angew. Math. 524 (2000)).

*Method of the formal proof:* 8.2 applied to `Vⁿ` (descent by the transfer for the finite covers) gives the Hecke
operators, and 9.7 (a) the eigenquotient: `ρ` is the largest quotient of `ℚ̄_ℓ ⊗ ⊕_k V^k(Z)` on which the Hecke
operators act by `ι_ℓθ`. Inertia acts trivially by 9.1 (b), and 9.1 (a) applied to the congruence relation of the
model gives that the Hecke polynomial kills Frobenius away from `ℓ`; at `ℓ`, crystallinity of the cohomology with its
relation for the linear Frobenius (PadicComparisonForFunctorCohomology §7.6) and 9.7 (b), (c). For the weights: if `h ∈ J` were not a jump, 9.7 (d) gives `c` killing the weight-`h` part; by the Hodge–Tate comparison and the
fixed point formula of Woods Hole type, the correspondences of every `b·c(τ)` form null families, so by 9.5 (c) every
`b·c(τ)` is `h`-null, against the occurrence of `θ` in weight `h`.

Let `a ≥ 1`, `𝓜` a model (8.2) for `n = {1, …, a}`, `d₀`, a neat `𝔑`, `ν`, over `R = M^{−1}𝓞_E` with `M ⊂ 𝓞_E` a
multiplicative set meeting no safe place, `Z` its base, `ℓ` a prime with an isomorphism `ι_ℓ : ℂ → ℚ̄_ℓ`, `θ(w, j) ∈ ℂ`
for safe split `w` and `j ∈ ℕ`, and `J` a set of integers `h ≥ 0` such that `θ` occurs in weight `h` (9.5, for `ν`) for
every `h ∈ J`. For a safe `w` let `P_w(X) = Σ_{j=0}^{a} (−1)^j q_w^{j(j−1)/2} ι_ℓθ(w, j) X^{a−j}` (the Hecke polynomial
of GaloisRepresentationsOfUnitaryEigenforms §1.1). Then there is a continuous representation `ρ` of `Gal(Ω/E)` on some
`ℚ̄_ℓ^m` such that at every place `A` of `Ω` over a safe place `w`:
(a) if `ℓ` is a unit at `A`, `ρ` is trivial on the inertia group of `A` and `P_w(ρ(s)) = 0` for every `s` whose inverse
is an arithmetic Frobenius for `q_w` at `A`;
(b) if `A` lies over `ℓ`, the restriction of `ρ` to the decomposition group of `A` is crystalline, and `P_w` kills its
linear Frobenius at every such `s`;
(c) every `h ∈ J` is a Hodge–Tate jump of `ρ` at `A` for every local datum whose complex embedding of `E` is `Φ_{v₀}`.

*Needs:* 8.2, 9.1, 9.5, 9.7; CohomologyOfFunctorsOnTestRings §§3.5, 7.5 (transfer, Woods Hole formula);
PadicComparisonForFunctorCohomology §§6.5, 7.6 (Hodge–Tate weights, crystallinity, linear Frobenius);
GaloisRepresentationsOfUnitaryEigenforms §§1.1, 1.3 (Hecke polynomials, local data, jumps).

The representation may be zero when `J` is empty; its dimension is not controlled.

[ShortProof], `Lib/Shimura/Eigenspace` (`New.Variety.Model.isNullHecke_mul_of_kills_weight`,
`New.Variety.Model.jumpsRelAt_of_isEigenQuotient`, `New.Variety.Model.aeval_heckePoly_eq_zero_of_isEigenQuotient`,
`New.Variety.Model.isKilledBy_heckePoly_of_isEigenQuotient`, `New.Variety.Model.exists_galois_rep`)

## What the library already provides

- The factorisation of a homomorphism of group schemes through a quasi-compact, flat, surjective homomorphism that it
  kills the kernel of (used over an Artinian base in 4.3 and 7.3): `TauCeti.GroupScheme.isColimitKernelCofork`
  (multiplicative group objects; the passage from additive group objects and from points in finite local algebras to the
  scheme-theoretic kernel is a small bridge).
- A proper, locally quasi-finite morphism is finite (in 4.3): `AlgebraicGeometry.IsFinite.of_isProper_of_locallyQuasiFinite`
  (Mathlib).
- The valuative criterion of properness, which extends points of the generic fibre over a valuative arc (in 5.4):
  `AlgebraicGeometry.IsProper.eq_valuativeCriterion`, `AlgebraicGeometry.ValuativeCriterion.existence`,
  `AlgebraicGeometry.ValuativeCriterion.uniqueness` (Mathlib).

On Tau Ceti's main branch, later than the revision pinned here: the extension of a morphism from the generic point of a
base whose local rings are valuation rings to a unique section of a universally closed, separated morphism locally of
finite type (in 5.4), `AlgebraicGeometry.Scheme.Hom.existsUnique_section_of_valuationRing`.

## Results taken from other roadmaps

- Tangent polynomials of a pair of maps at a point (8.2): CohomologyOfFunctorsOnTestRings §6.6.
- The cohomology `Vⁿ` with its Galois action and functoriality, smooth and proper base change, transfer for Galois
  coverings, the fixed point formula of Woods Hole type, and the charting of smooth proper schemes over a Noetherian
  ring (9.1, 9.8): CohomologyOfFunctorsOnTestRings §§1.3, 1.5, 3.4, 3.5, 4.3, 5.6, 7.5.
- Crystallinity of the cohomology with its linear Frobenius, and Hodge–Tate classes of a given weight (9.8):
  PadicComparisonForFunctorCohomology §§6.5, 7.6.
- Crystalline representations through `B_max`, linear Frobenius and Hodge–Tate jumps (Conventions, 9.7, 9.8):
  CrystallineRepresentationsAndKisinModules §3.1.
- Hecke polynomials, local data and weights with their jumps (9.6, 9.8):
  GaloisRepresentationsOfUnitaryEigenforms §§1.1, 1.3.
- Adeles, Hecke operators of `GL_n` at a place, and the change of signs of elliptic similitudes (3.1, 8.1, 9.4):
  AdelicUnitaryGroupsAndAlgebraicModularForms §§2.1, 3.1, 7.9.
- The single cosets of the Hecke operators of `GL_n` at a place, indexed by subspaces (8.1):
  WeilRepresentationsOnBanachSpacesOfData §9.1.
- Iwahori–Hecke operators, their injectivity and twisted conjugacy, and polynomial representations of `GL_a` with their
  Schur matrices (9.2, 9.6): IntegralRepresentationsOfGeneralLinearGroups §§1.1, 1.3, 6.1, 6.3, 6.4.
- Weyl's character formula for `U(n)` (9.6): HolomorphicDiscreteSeriesOfUnitaryGroups §7.1.
- Isogenies over a base and the factorisation through an isogeny (4.3, 7.3): AbelianSchemesAndArithmeticModuli §A3.1.
- The Appell–Humbert classification, which implies 5.3: AbelianSchemesAndArithmeticModuli §A5.3.

## References

- `[ShortProof]`: the folder `grh` of <https://github.com/lsernau/grh-lean> at commit
  `72fead102f663d5c7a407964a13dc0cf9d977207`; this roadmap covers `src/Lib/Shimura`, with the definitions of tangent
  polynomials, congruence relations, Galois coverings and null families in `src/Lib/Cohomology/Etale/Basic`.
- J. Arthur, L. Clozel, *Simple algebras, base change and the advanced theory of the trace formula* (1989), ch. 1 §2,
  after Deligne and Kazhdan.
- Birkenhake–Lange, *Complex Abelian Varieties*, 3.2.7, 4.1.5, 6.4.
- M. Bolognesi, A. Massarenti, Comment. Math. Helv. 91 (2016), Lemma 4.1.
- S. Bosch, W. Lütkebohmert, M. Raynaud, *Néron Models* (1990), 1.2/8, 4.4/1, 7.3, 8.1.
- L. Breen, *Fonctions thêta et théorème du cube*, LNM 980 (1983).
- D. Bump, A. Pekker, Proc. Amer. Math. Soc. 130 (2002), 3473–3481 (a survey of proofs).
- C.-L. Chai, *Riemann's theta formula* (2014), Theorem 1.2.
- B. Conrad, *Semistable reduction for abelian varieties* (notes), Prop. 6.3.
- Deligne, *Formes modulaires et représentations ℓ-adiques*, Sém. Bourbaki 355 (1969), Thm 4.9.
- Dummigan, *A simple trace formula for algebraic modular forms*, Exp. Math. 22 (2013).
- B. Edixhoven, G. van der Geer, B. Moonen, *Abelian Varieties* (draft), ch. IV §3, (5.1)–(5.2), ch. VI §1.
- EGA IV.
- G. Faltings, C.-L. Chai, *Degeneration of Abelian Varieties* (1990), I.2.7.
- G. Frobenius, *Über die Grundlagen der Theorie der Jacobischen Functionen*, Crelle 97 (1884).
- Goresky and MacPherson, *The topological trace formula* (2003).
- Harris, Labesse, *Conditional base change for unitary groups*, Asian J. Math. 8 (2004), Thm 2.1.2.
- M. Harris, R. Taylor, *The Geometry and Cohomology of Some Simple Shimura Varieties* (2001), III.4, III.4.1, ch. VII.
- Katz–Mazur (1985), ch. 13.
- N. Katz, *Serre–Tate local moduli*, LNM 868 (1981), §1.
- G. Kempf, *Multiplication over abelian varieties*, Amer. J. Math. 110 (1988).
- G. Kempf, *Linear systems on abelian varieties*, Amer. J. Math. 111 (1989), 65–94.
- S. Koizumi, *Theta relations and projective normality of abelian varieties*, Amer. J. Math. 98 (1976).
- R. Kottwitz, *Points on some Shimura varieties over finite fields*, J. Amer. Math. Soc. 5 (1992), §5.
- J.-P. Labesse, *Changement de base CM et séries discrètes* (2011), Thm 5.4.
- K.-W. Lan, *Elevators for degenerations of PEL structures*, Math. Res. Lett. 18 (2011).
- J. Lubin, J. Tate, *Formal moduli for one-parameter formal Lie groups*, Bull. SMF 94 (1966).
- L. Moret-Bailly, *Pinceaux de variétés abéliennes*, Astérisque 129 (1985), II.3.5.
- D. Mumford, *Abelian Varieties*, §§1–2.
- D. Mumford, *On the equations defining abelian varieties I*, Invent. Math. 1 (1966), 287–354, §§1–2, §3.
- D. Mumford, *On the equations defining abelian varieties II*, Invent. Math. 3 (1967), 75–135.
- A. Nagano, *On Riemann type relations for theta functions on bounded symmetric domains of type I*, arXiv 2301.09243
  (2023), Theorem 1.1.
- T. Sekiguchi, J. Math. Soc. Japan 29 (1977).
- Serre and Tate, Ann. of Math. 88 (1968).
- Shimura, *On the trace formula for Hecke operators*, Acta Math. 132 (1974).
- G. Shimura, *Introduction to the Arithmetic Theory of Automorphic Functions* (1971), ch. 3 and 7–8.
- S. W. Shin, *Abelian varieties and Weil representations*, Algebra Number Theory 6 (2012), Prop. 2.12.
- The Stacks project, Section 0BF9; Tags 0GKD (SGA4 XVI 2.2) and 03SN (SGA5 XV).
- Wedhorn, *Congruence relations on some Shimura varieties*, J. reine angew. Math. 524 (2000), 43–71.
