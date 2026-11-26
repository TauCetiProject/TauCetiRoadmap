# Roadmap: second moments of Poincaré series

**Summary.** The argument proves the Riemann hypothesis for Dirichlet L-functions through a one-sided bound for a sum over primes:
such a bound at arbitrarily large scales gives a zero-free half-plane. At each scale the bound comes from comparing an
upper and a lower bound for the covolume of a lattice of theta lifts of target forms. For that comparison the target
forms must be reached by few maps of a fixed kind: by Theorem B of the argument, the images of a small number of
translates of the projected Poincaré map, by elements of the finite group `Ḡ` at the level primes, together have
dimension at least `(1 − 4/b²)` times that of the target.

This roadmap proves the input of Theorem B. The Poincaré map `𝒫` sends algebraic modular forms on the definite group
`U(X₀)` to forms on the indefinite group `U(Y₀)`; it is built from a Bessel function at each real place. The roadmap
shows that the operators `P* s P`, `s ∈ Ḡ`, of the suitably scaled map `P` have a second moment as small as for maps in
general position, that the part of `P` killed by the projector `e₀` onto the good forms is small, and that the dimension
of the target is at most what the second moment needs. A Cauchy–Schwarz argument then gives, for every space of target
forms, one translate whose preimage of it is small, and a greedy choice turns this into few translates that span
almost everything. Theorem B itself is stated and deduced in `OneSidedPrimeSumBoundsAndAdmissibleData`.

Layer 1 is the linear algebra of spreading maps. Layer 2 compares the good forms on `Y₀` with those on the definite
spaces `W_j` that differ from it only in the signs at the real places, which bounds the dimension of the target.
Layer 3 is the analysis at one real place: Bessel functions of discrete series of the unitary group `G₁` of signature
`(k + ϱ, ϱ + 1)`, their decay, their cut, Schur's bound, and bounds on the open cell of the double cosets of two Bessel
subgroups. Layer 4 is stated on abstract filling data: it unfolds the second moment of the operators `P* s P` into
sums of orbital integrals over rational terms, sorts the terms, and proves the moment bounds, taking the bounds for the
remaining terms and for the main term from `RemainingAndMainTermsOfSecondMoments`. Layer 5 attaches filling data to
the data of the argument, identifies the Poincaré map with a Poincaré series of the Bessel function, and draws the
conclusion.

## Conventions and notation

The data of the argument are those of OneSidedPrimeSumBoundsAndAdmissibleData §2.1 (the parameters `q₀`, `d`) and
§3.2 (admissible data at a large scale `x`). The objects built on them are those of
ThetaLiftChainsAndTheSeesawIdentity §2.5 (the projector `e₀`), §2.7 (target forms, good forms), §2.8 (source forms)
and §2.19 (the Poincaré map). They are recalled here in words, with the letters used below.

Hermitian forms are conjugate-linear in the first variable; `⟨·, ·⟩` is the inner product, conjugate-linear in the first
variable. For a linear map `A` between finite-dimensional complex inner product spaces, `A*` is its adjoint and `‖A‖`,
written of a linear map, its Hilbert–Schmidt norm (`‖A‖² = tr(A*A)`). The orthogonal projection onto a subspace `U` is
`pr_U`. A function `Θ` on a finite group `Γ` has *positive type* if `Θ(a⁻¹b) = ⟨u_a, u_b⟩` for vectors `u_a` of a complex
inner product space.

| Symbol | Meaning | Defined |
|---|---|---|
| `E, E⁺, f, Φ` | the CM field of the data, its totally real subfield, the number of infinite places of `E`, the set of these places | OneSidedPrimeSumBoundsAndAdmissibleData §2.2, §3.2 (the field of the data) |
| `rd_E, ϖ` | the root discriminant of `E`; a generator of the different of `E` with `ϖ̄ = −ϖ` | OneSidedPrimeSumBoundsAndAdmissibleData §2.2 (`rd_E`); DivisibilityOfThetaDerivatives §1.1 (b) (`ϖ`, there `δ_E`); 4.1 |
| `r, k, m, ϱ, n` | the rank of `Y₀`, the rank of `X₀`, the number of lifts, the number of hyperbolic planes of `Y₀` (`m = 2ϱ + 2`), `n = ϱ + 1`; `r = k + 2ϱ + 1` | OneSidedPrimeSumBoundsAndAdmissibleData §3.2 (`r`, `k`, `m`), §3.3 (b) (`r + 1 = k + m`); ThetaLiftChainsAndTheSeesawIdentity §2.1 (`ϱ`) |
| `x, b, a` | the scale, the weight at the b-places, the order `a = x·b` | OneSidedPrimeSumBoundsAndAdmissibleData §3.2 |
| `p₀, p₁, M` | the two level primes and `M = p₀p₁` | OneSidedPrimeSumBoundsAndAdmissibleData §3.2 |
| `N, π_N` | the level, a prime, and an integer of `E` with `π_N π̄_N = N` | OneSidedPrimeSumBoundsAndAdmissibleData §3.2 |
| chosen places | for `i = 0, 1`, a set of `f` places of `E` above `p_i`, no place chosen twice and no conjugate of a chosen place chosen | DivisibilityOfThetaDerivatives §1.5; ThetaLiftChainsAndTheSeesawIdentity §2.10 (c) (`f` above each `p_i`) |
| `Ḡ` | the finite group `∏_w GL_r(𝔽_w)` over the chosen places `w`, `𝔽_w` the residue field | ThetaLiftChainsAndTheSeesawIdentity §2.5 (there `𝖦`) |
| `X₀, Y₀, W_j` | the definite space of rank `k`; `Y₀ = X₀ ⊕ ϱ` hyperbolic planes `⊕` a line of norm `−N`; for `1 ≤ j ≤ m` the space of rank `r` that differs from `Y₀` only in its signs at the real places and has `m − j` minus signs | ThetaLiftChainsAndTheSeesawIdentity §2.1 |
| `V` | below, any hermitian space of rank `r` over `E` with the adelic frame of `Y₀` at the finite places, and arbitrary signs `s` at the infinite places | 2.1 |
| `J_M` | the principal level: integral finite adelic points of `U(V)` that reduce to `1` at every chosen place | ThetaLiftChainsAndTheSeesawIdentity (Conventions: the chosen level), used in §2.7 |
| `λ_v, l_v, Δ` | the target parameter at `v ∈ Φ`, its double `l_v = 2λ_v`, and the gap `Δ = 2r⁸` | ThetaLiftChainsAndTheSeesawIdentity §2.4 (the target parameter, there `ς`); OneSidedPrimeSumBoundsAndAdmissibleData §3.2 (`Δ`) |
| principal forms | forms on `U(V)` whose archimedean type is the discrete series of parameter `λ_v` (for the signs of `V`) at each `v`, fixed by `J_M`; `Ḡ` acts on them | ThetaLiftChainsAndTheSeesawIdentity §2.7 (there `𝒜(V)`) |
| `e₀`, good forms, target forms | the central idempotent of `ℂ[Ḡ]` that is the sum over the good families of labels of the products of the label idempotents; its image in the principal forms of `V` (good forms); for `V = Y₀`, the target forms | ThetaLiftChainsAndTheSeesawIdentity §2.5 (`e₀`), §2.7 (good forms, target forms) |
| `d_T` | the dimension of the target forms | ThetaLiftChainsAndTheSeesawIdentity §2.7 |
| source forms, `D_X` | algebraic modular forms on `U(X₀)` of the weight of the data and level `K_X` (principal at the chosen places, with last row `≡ (0, …, 0, 1)` modulo `π_N`); `D_X` their dimension | ThetaLiftChainsAndTheSeesawIdentity §2.8 (source forms), §2.6 (the level, there `K_0`) |
| `𝒫` | the Poincaré map: source forms to principal forms on `Y₀`, the Riesz representative of a Bessel period | ThetaLiftChainsAndTheSeesawIdentity §2.19 |
| `mass_l` | the mass `∑ 1/#Aut` of the genus of the standard hermitian lattice `𝒪_E^l` | HermitianFormsAndLattices §5.5 (the mass of a genus) |
| `G₁, J₁, f, 𝖴, 𝖴⁰, H, R` | the real group at one place, its form, its frame, its Bessel subgroups | 3.1 |
| `ψ, σ` | the character of `𝖴` and the sum of the simple root entries | 3.1 |
| `ℓ(y), B(ρ)` | the Bessel length and the frame box | 3.1 |
| `Z(γ), D_l, 𝗀, Ω, γ_Z, c_G` | the frame Gram matrix, its leading minors, its discriminant, the open cell, the Gram section, the open cell constant | 3.1, 3.4 |
| `c_λ, deg(λ)` | the coefficient and the formal degree of a discrete series | 3.1 |
| `W, W♭` | a Bessel function and its cut | 3.3 |
| `𝔉` | filling data | 4.1 |
| `K, K(M), red, R̄₀, Ū, H̄` | the integral points, the principal congruence subgroup, reduction, the reductions of `R`, `𝖴`, `H` | 4.1, 4.2 |
| `h_c, 𝖴_c(M), β_c` | the representative of a class, its unipotent lattice, its cutoff | 4.2 |
| `A(c, s, c′), ν` | the amplitude sum over a block and the unipotent covolume | 4.2 |
| `𝒟_main, 𝒟_id` | `D_X²/(deg·mass_r)` and `#R̄₀·D_X` | 4.2 |
| `𝔼(A, Ω)` | the second moment of a family of blocks over a set `Ω ⊂ Ḡ` | 4.2 |

Sizes are those of OneSidedPrimeSumBoundsAndAdmissibleData §3.3; the only consequences used here are listed in
4.1 (the standing hypotheses of filling data) and proved for the data in 5.5.

**Normalisations.** The constants of Layers 3–5 depend on three normalisations, fixed here.

- `vol(Ô)`, the volume of the integral finite adeles `Ô` of `E`, is the number `2^{r₂}/√|disc E|`, `r₂` the number
  of complex places; `E` is totally complex, so `r₂ = f` and `vol(Ô) = (2/rd_E)^f`. It is the measure of `Ô` for the
  Haar measure on `𝔸_f` for which `𝔸_E/E` has mass `1` when each `E_v = ℂ` carries Lebesgue measure. The formulas for
  `c_S` (4.1), `ν` (4.2) and 5.4 (b), and those of RemainingAndMainTermsOfSecondMoments §§6.3 and 6.4, hold with this
  value and no other.
- `vol U(j) = ∏_{i=1}^{j} 2π^i/(i − 1)!`, the product of the areas of the unit spheres of `ℂ¹, …, ℂ^j`.
- For a hermitian matrix `J` of size `r` with `J² = 1`, the Haar measure `μ_{U(J)}` on `U(J)` is the image, under the
  Cayley chart `y ↦ 2·D(y)⁻¹ − 1` with `D(y) = 1 − ½J⁻¹S(y)`, of the measure with density
  `|det D(y)|^{−2r}/vol U(r)` against Lebesgue measure on the real `r × r` matrices `y` with `det D(y) ≠ 0`. Here
  `S(y)` is the skew-hermitian matrix with entries `i·y_{aa}` on the diagonal and `((1 + i)y_{ab} − (1 − i)y_{ba})/√2`
  off it, so that Lebesgue measure in `y` is Lebesgue measure in the `Im S_{aa}` and the `Re S_{ab}`, `Im S_{ab}`,
  `a < b`. For `J = 1` it is the probability measure on the compact group `U(r)`. `μ_{G₁} = μ_{U(J₁)}` (3.1), and the
  measure on `G_∞ = ∏_v G₁` is the product.

Some letters have two meanings, kept apart by context: `f` is the number of infinite places of `E` and, with an index
(`f_a`) or next to a group element (`γf`), the frame of 3.1; `k` is the rank of `X₀` and, in 4.10 and 5.1, an element of an
integral group; `R` is the Bessel subgroup of 3.1, and `R₀`, `R₁` are real numbers.

**Origin and method.** Every section that states something carries `*Origin:*` (`published:`, `adapted from`,
`particular to this proof:`, `this roadmap's own formulation:`, or `definitions and conventions`) and
`*Method of the formal proof:*`, which says how the shorter formal proof proves it; `[ShortProof]` names the file and
declaration of that proof. A contribution may state a result more generally or prove it otherwise.

## Layer 1: Spreading maps and second moments

### 1.1 Near isometries and spreading families

*Origin:* definitions and conventions.

Let `S`, `T` be finite-dimensional complex inner product spaces and `A : S → T` linear.

- `A` is a *near isometry with error `ε`* if `‖A pr_U‖² ≥ dim U − ε·dim S` for every subspace `U ⊆ S`.
- A family `(B_s)_{s ∈ Θ}` of linear maps `V → W` between finite-dimensional complex spaces *spreads with error `η`*
  if for every subspace `F ⊆ W`, with `α = dim F / dim W` (`α = 0` when `W = 0`), some `s ∈ Θ` has
  `dim B_s⁻¹(F) ≤ ((1 + α)/2 + η)·dim V`.

*Needs:* none.

[ShortProof], `New/Spanning/SecondMoment/FewTranslates.lean` (`New.hilbertSchmidtNorm`, `New.IsNearIsometry`,
`New.IsSpread`)

### 1.2 One translate from a second moment

*Origin:* adapted from rank bounds from second moments of frames (Welch (1974)): here, for the translates of
one map by a finite unitary group, followed by a projection that commutes with the group.

*Method of the formal proof:* (a) and (b) are expansions of the Hilbert–Schmidt norm on an orthonormal basis and
Cauchy–Schwarz. For (c), `s ↦ ‖B* ρ(s) B‖²` is the Hilbert–Schmidt inner product of the operators `ρ(s)BB*ρ(s)⁻¹`, so
Cauchy–Schwarz against the projection onto `F` bounds the mean of `‖pr_F ρ(s) B‖²` by `(α + 1 + ε)/2·dim S`; one `s` is
at most the mean, and on the preimage of `F` the near isometry turns that norm into a bound for the dimension.

Let `S`, `T` be finite-dimensional complex inner product spaces.

(a) If `A : S → T` has `‖A*A − 1‖² ≤ ε²·dim S` with `ε ≥ 0`, then `A` is a near isometry with error `ε` (1.1).

(b) If `A` is a near isometry with error `ε` and `pr` is an orthogonal projection of `T` with
`‖(1 − pr)A‖² ≤ δ·dim S`, then `pr A` is a near isometry with error `ε + δ`. For an orthogonal projection `p` and any
endomorphism `q` of `T`, `‖(1 − pq)A‖² ≤ ‖(1 − p)A‖² + ‖(1 − q)A‖²`.

(c) Let a finite group `Γ` act unitarily on `T` by `ρ`, let `pr₀` be the orthogonal projection onto a subspace `T₀`
with `pr₀ρ(s) = ρ(s)pr₀` for all `s`, let `B : S → T` be linear and `ε ≥ 0`. Suppose that `pr₀B` is a near isometry
with error `ε` and that `dim T₀ · ∑_{s ∈ Γ} ‖B* ρ(s) B‖² ≤ #Γ·(1 + ε)·(dim S)²`. Then the family of maps
`pr₀ρ(s)B : S → T₀`, `s ∈ Γ`, spreads with error `3ε/2`.

*Needs:* 1.1

[ShortProof], `New/Spanning/SecondMoment/FewTranslates.lean` (`New.isNearIsometry_of_hilbertSchmidtNorm_le`,
`New.IsNearIsometry.proj_comp`, `New.hilbertSchmidtNorm_one_sub_mul_comp_sq_le`, `New.isSpread_of_second_moment`)

### 1.3 Few translates span almost all

*Origin:* adapted from greedy covering for submodular set functions (Wolsey (1982)): here, for the dimension of
a sum of images of a spreading family.

*Method of the formal proof:* greedy choice: while the span `F` misses more than a share `16ε` of `W`, the spreading
property gives a map whose image adds at least `(2/5)(1 − α)·dim V` dimensions, so the missing dimension is multiplied
by at most `1 − 2·dim V/(5·dim W) ≤ exp(−2·dim V/(5·dim W))`; about `log(1/(16ε))` divided by that rate steps suffice.

Let `V ≠ 0` and `W` be finite-dimensional complex spaces with `dim W > 0`, let `0 < ε < 1/16`, and let `(B_s)_{s ∈ Θ}`
spread with error `3ε/2` (1.1).

(a) There is a finite set `t ⊆ Θ` with `#t·dim V ≤ (5/2)(1 + log(1/(16ε)))·dim W` and
`dim ∑_{s ∈ t} B_s(V) ≥ (1 − 16ε)·dim W`.

(b) For every finite `t ⊆ Θ` and every subspace `U ⊆ V`,
`dim ∑_{s ∈ t} B_s(V) ≤ dim ∑_{s ∈ t} B_s(U) + #t·(dim V − dim U)`.

*Needs:* 1.1

[ShortProof], `New/Spanning/SecondMoment/FewTranslates.lean` (`New.IsSpread.exists_few_le_finrank_iSup_range`,
`New.finrank_biSup_range_le`)

### 1.4 Functions of positive type and singular minors

*Origin:* particular to this proof: a bound for the mass, under a function of positive type on a finite group, of the
group elements at which a bilinear minor `det(A₁ᵀ π(s) A₀)` vanishes.

*Method of the formal proof:* the number of `y` in the left kernel of `Z = A₁ᵀπ(s)A₀` is at least `q` when `det Z = 0`,
and it is the mean over `v` of `∑_y ψ(yᵀZv)` for a primitive additive character `ψ`. Summing against `Θ` first, the terms
with `y = 0` or `v = 0` give `Θ(G)`; for `y, v ≠ 0` the sum `∑_s ψ(x·π(s)z)Θ(s)` is an inner product of two vectors of
`ℂ^{k^d} ⊗ H` whose squared norms are `#G` times the `Θ`-masses of the two stabilisers, bounded by `Y`.

Let `G` be a finite group, `𝔽` a finite field with `q` elements, `π : G → GL_d(𝔽)` a homomorphism and
`π′(s) = (π(s)ᵀ)⁻¹`. Let `A₀, A₁` be `d × e` matrices over `𝔽`, let `Θ ≥ 0` be of positive type on `G`, and let `Y ≥ 0`.
Suppose that for every nonzero `v ∈ 𝔽^e` both `∑_{s : π(s)A₀v = A₀v} Θ(s)` and `∑_{s : π′(s)A₁v = A₁v} Θ(s)` are at most
`Y`. Then

`q · ∑_{s : det(A₁ᵀ π(s) A₀) = 0} Θ(s) ≤ 2·∑_{s ∈ G} Θ(s) + q^e·q^{d/2}·Y`.

*Needs:* none

[ShortProof], `New/Spanning/SecondMoment/PositiveType.lean` (`New.card_mul_sum_det_eq_zero_le`)

## Layer 2: Equality of multiplicities

### 2.1 Spherical Hecke operators away from the level

*Origin:* definitions and conventions.

Let `G_f = U(V)(𝔸_f)`, the same group for all `V` of the Conventions, and `G^M ⊂ G_f` the subgroup of the elements whose
component at every chosen place is `1`. The spaces of principal forms of `V` are finite-dimensional (the background
result of the *Needs:* line).

- A *spherical element away from `M`* is an element `a` of the group algebra `ℂ[G^M]` (finitely supported) whose image
  in `ℂ[G_f]` maps the vectors fixed by `J_M` to vectors fixed by `J_M` in every representation of `G_f`.
- The *Hecke algebra away from `M`*, `𝓗^M`, is the algebra of the families `T = (T_V)_V` of operators `T_V` on the
  principal forms of all `V` for which one spherical element `a` acts as `T_V` on every `V`.
- A finite place `w` is *split off the level* if `w ≠ w̄` and neither `w` nor `w̄` is a chosen place. For such `w` and
  `i ≥ 0`, `T_{w,i}` is the Hecke operator of the double coset of `diag(ϖ_w 1_i, 1)` in `GL_r(E_w)`, embedded in `G_f`
  at `w` and `w̄`; at the other `(w, i)` put `T_{w,i} = 0`.
- An *eigensystem* is a function `p` on pairs `(w, i)`; the eigenpart `V_p` is the space of principal forms `y` on `V`
  with `T_{w,i} y = p(w, i)·y` for all `(w, i)`.

*Needs:* ThetaLiftChainsAndTheSeesawIdentity §2.5 (the group `Ḡ` over the chosen places, there `𝖦`), §2.7 (the forms of
principal level and the level `J_M`); ShortGRH background (for a hermitian space `V` over `E`, an open subgroup `K`
of `U(V)(𝔸_f)` and parameters `λ_v` whose entries at coordinates of different sign are at least `500r³` apart, the
bounded automorphic functions on `U(V)` fixed by `K` and by right convolution with the product of the kernels
`deg(λ_v)·c̄_{λ_v}` form a finite-dimensional space; [ShortProof] `Lib/Adelic/AutomorphicForms/Cuspidality.lean`
(`New.Space.finite_levelSpace`), `Lib/Adelic/AutomorphicForms/RealConvolution.lean` (`New.isCuspKernel_typeKernel`)).

[ShortProof], `New/Spanning/Multiplicities/HeckeEigensystems.lean` (`New.Data.sphericalAlgebra`,
`New.Data.heckeAlgebra`, `New.Data.IsSplitOffLevel`, `New.Data.heckeOperator`, `New.Data.eigenPart`)

### 2.1a Properties of the Hecke algebra away from the level

*Origin:* adapted from the classical theory of spherical Hecke algebras of unramified unitary groups: here, for the
operators away from the chosen places, acting at once on the principal forms of all inner forms `V`.

*Method of the formal proof:* the operator `T_{w,i}` is a sum over the cosets of the double coset, which is one element
of the group algebra of `G^M`. The elements of `G^M` commute with the integral lifts of `Ḡ`, which are supported at the
chosen places. The operators `T_{w,i}` are commuting normal operators for the unitary action, so the spectral theorem
gives a basis of joint eigenvectors; a polynomial in one `T_{w,i}` separates two eigensystems, and a product of such
polynomials gives (d).

(a) Every `T_{w,i}` lies in `𝓗^M`.

(b) Every `T ∈ 𝓗^M` commutes with the action of `ℂ[Ḡ]` on principal forms, so it preserves the good forms; write
`T|_good` for its restriction.

(c) The eigenparts `V_p` are independent, only finitely many are nonzero, and they span the principal forms of `V`.

(d) For an eigensystem `q` and a finite set `F` of eigensystems there is `T ∈ 𝓗^M` that, on every `V`, is the identity
on `V_q` and zero on `V_d` for `d ∈ F`, `d ≠ q`.

*Needs:* 2.1

[ShortProof], `New/Spanning/Multiplicities/HeckeEigensystems.lean` (`New.Data.principalHeckeSplit_mem_heckeAlgebra`,
`New.Data.commute_heckeAlgebra_principalRep`, `New.Data.heckeOnGood`, `New.Data.iSupIndep_eigenPart`,
`New.Data.iSup_eigenPart_eq_top`, `New.Data.exists_hecke_proj_eigenPart`)

### 2.2 Equal traces on the good forms

*Origin:* adapted from the comparison of simple trace formulas of inner forms (Arthur and Clozel (1989); Labesse
(1999)): here, the traces of the spherical Hecke operators away from `M` on the good forms of two inner forms that differ
only in their signs at the real places, under the gap `Δ` of the parameter. The equality of cuspidal multiplicities of
BaseChangeAndGaloisRepresentationsForUnitaryGroups §13.8a is the same comparison in the language of representations,
for a jointly cuspidal family of types and the gap `100r⁴`; the form used here is an equality of traces.

*Method of the formal proof:* `e₀` is the sum of the idempotents `e_c` of the good families of labels, so the trace of
`T` on the good forms is `∑_c tr(T e_c)` on the principal forms. Every good family has a primitive label at some chosen
place, and the idempotent of a primitive label is cuspidal there, so the test function of `T e_c` is cuspidal at a
split place; the comparison of traces of such test functions on two spaces with the same finite group then applies.

Let `V`, `V′` have signs `s`, `s′`, and suppose that at every `v ∈ Φ` the parameter `λ_v` has gap `Δ` for both sign
patterns: the entries of `l_v` are distinct and of the parity of `r − 1`, and entries of `λ_v` at coordinates of different
sign are at least `Δ` apart. Then for every `T ∈ 𝓗^M`, `T|_good` on `V` and on `V′` have the same trace, the same
characteristic polynomial and the same determinant.

*Needs:* 2.1a; ThetaLiftChainsAndTheSeesawIdentity §2.5 (`e₀` as a sum over good families of labels, each with a
primitive label), §2.7 (good forms); FiniteReductiveGroups §5.2 (the character of an irreducible label of degree `r`
is cuspidal), §5.7 (the central idempotent of a label); ShortGRH background (let `E` be a CM field with a primitive
`5040`-th root of unity and an even number of infinite places, `V`, `V′` hermitian spaces of rank `r ≥ 2` over `E` with
the same finite adelic group, and `(λ_v)` parameters with gap at least `500r³ + 10r⁵` for the signs of both; let `K` be
an open compact subgroup and `a` an element of the group algebra of the finite adelic group that preserves the
`K`-fixed vectors of every representation, such that the test function `a ⋆ 1_K` is cuspidal at one split place, in
the sense that its translates have sum zero over each coset of each proper unipotent radical there; then `a` has the
same trace on the forms of parameter `(λ_v)` and level `K` on `V` and on `V′`; [ShortProof]
`Lib/Adelic/TraceFormula/CuspidalComparison.lean` (`New.trace_eq_of_isCuspidalAt`)); ShortGRH background (for
places `w_i`, none conjugate to another or to itself, and a tuple of labels whose member at `w_x` is irreducible of
degree `r`, the product of any element of the group algebra with the lift of the idempotent of the tuple, convolved
with the indicator of the principal level at the `w_i`, is cuspidal at `w_x` in that sense; [ShortProof]
`Lib/Adelic/TraceFormula/CuspidalType.lean` (`New.isCuspidalAt_convIndicator_tupleIdem`)). On the data the number
`f` of infinite places is even and `r ≥ 2`.

[ShortProof], `New/Spanning/Multiplicities/EqualMultiplicities.lean` (`New.Data.trace_heckeOnGood_eq`,
`New.Data.charpoly_heckeOnGood_eq`, `New.Data.det_heckeOnGood_eq`)

### 2.3 Equal multiplicities and the dimension of the target

*Origin:* adapted from the comparison of simple trace formulas of inner forms (Arthur and Clozel (1989); Labesse
(1999)): here, in this form, the equality of the dimensions of the Hecke eigenparts of the good forms on `V` and on `V′`,
for the spherical Hecke operators away from `M`, under the gap `Δ`.

*Method of the formal proof:* finitely many eigensystems occur on `V` and `V′`; the operator of 2.1a (d) projects both
onto their `q`-parts, its trace on the good forms is the dimension of the good `q`-part, and 2.2 equates the traces. For
the dimension of the target take `T = 1`.

Under the hypotheses of 2.2:

(a) for every eigensystem `q`, `dim(good forms of V ∩ V_q) = dim(good forms of V′ ∩ V′_q)`;

(b) the parameters `λ_v` have gap `Δ` for the signs of `Y₀` and of every `W_j` (ThetaLiftChainsAndTheSeesawIdentity
§2.7), so `d_T` is the dimension of the good forms on `W_j` for every `1 ≤ j ≤ m`.

*Needs:* 2.1a, 2.2; ThetaLiftChainsAndTheSeesawIdentity §2.7 (the gap of the target parameter for the signs of `Y₀` and
of the `W_j`; the target forms and `d_T`)

[ShortProof], `New/Spanning/Multiplicities/EqualMultiplicities.lean` (`New.Data.finrank_goodForms_inf_eigenPart_eq`,
`New.Data.goodForms_inf_eigenPart_eq_bot_of_eq_bot`, `New.Data.targetDim_eq_finrank_goodForms_spaceW`)

### 2.4 Series of translates away from the level, and the Rallis operator

*Origin:* particular to this proof: a convergent series of matrix coefficients of translates by elements trivial at the
chosen places acts on all inner forms through one spherical Hecke operator, so that the operator of Rallis' series has
the same determinant on the good forms of `V` and `V′`.

*Method of the formal proof:* for `γ ∈ G^M` the mean of the translates by `kγ` over the cosets of `K ∩ γKγ⁻¹` in the
part `K` of the maximal compact subgroup in `G^M` is spherical and has the same matrix coefficients as `γ` on vectors
fixed by `J_M`. The pairs of matrix-coefficient functions given by one element of `𝓗^M` on `V` and on `V′` form a
finite-dimensional, hence closed, space that contains all terms of the two series, hence their sums.

(a) For `γ ∈ G^M` there is `p ∈ 𝓗^M` with `⟨z, p y⟩ = ⟨z, γ y⟩` for every `V` and all principal forms `z`, `y` on `V`.

(b) Let `(p_i)_{i ∈ I}` be a countable family in `𝓗^M`, `a, a′ ∈ ℂ`, and let `B`, `B′` be sesquilinear forms on the
principal forms of `V`, `V′` with `∑_i a⟨z, p_i y⟩ = B(z, y)` on `V` and `∑_i a′⟨z, p_i y⟩ = B′(z, y)` on `V′`, the series
converging unconditionally for all `z`, `y`. Then one `p ∈ 𝓗^M` has `B(z, y) = a⟨z, p y⟩` on `V` and
`B′(z, y) = a′⟨z, p y⟩` on `V′`.

(c) Under the hypotheses of 2.2, for every twist `ϑ` and every `j`, the operator `R_{ϑ,j}` on principal forms given by
the series of Rallis' inner product formula for the lift of index `j` of `ϑ` is the action of one element of `𝓗^M` on
`V` and on `V′`; it preserves the good forms, and its determinants on the good forms of `V` and of `V′` are equal.

The formal proof proves (b) in the case where the `p_i` are the Hecke elements that (a) attaches to the terms of Rallis'
series, indexed by the cosets of the modulus of the twist.

*Needs:* 2.1a, 2.2; DeterminantsOfThetaLiftChains §2.2 (a) (the series of Rallis' inner product formula: each term is a
constant, independent of `V`, times `⟨z, γ y⟩` for a coset representative `γ` supported away from the modulus of the twist)

[ShortProof], `New/Spanning/Multiplicities/EqualMultiplicities.lean`
(`New.Data.exists_heckeAlgebra_inner_eq_inner_translate`, `New.Data.exists_heckeAlgebra_eq_mul_inner_of_hasSum_rallisTerm`,
`New.Data.exists_hecke_eq_rallisOperator`, `New.Data.det_rallisOnGood_eq`)

## Layer 3: Bessel functions at a real place

### 3.1 The group at a real place, its frame and its Bessel subgroups

*Origin:* definitions and conventions.

A *shape* is a number `ϱ ≥ 0`, a finite set `κ` with `k = #κ` elements and an element `k₀ ∈ κ`; put `n = ϱ + 1` and
`r = k + 2ϱ + 1`. On `ℂ^r` with basis `e₁, …, e_ϱ, x_i (i ∈ κ), z, e*₁, …, e*_ϱ` let `h` be the hermitian form with
`h(e_a, e*_b) = δ_ab`, `h(x_i, x_j) = δ_ij`, `h(z, z) = −1` and all other products of basis vectors `0`; its Gram matrix
is `J₁`. `G₁ = U(h)`, of signature `(k + ϱ, ϱ + 1)`, is written in this basis; `‖g‖` is the operator norm for the
Euclidean structure in which the basis is orthonormal. `X₀ = ⟨x_i⟩`.

- The *frame* is `f = (f₀, …, f_ϱ) = (e₁, …, e_ϱ, z)`; the *frame vectors* of `y ∈ G₁` are the `y⁻¹f_a`. For `ρ > 0` the
  *frame box* `B(ρ)` is the set of `y` with `‖y⁻¹f_a‖ ≤ ρ` for all `a`.
- `𝖴` is the unipotent radical of the stabiliser of the isotropic flag `⟨e₁⟩ ⊂ ⋯ ⊂ ⟨e₁, …, e_ϱ⟩`, `𝖴⁰ ⊂ 𝖴` the subgroup
  fixing every frame vector, `H ≅ U(k)` the subgroup acting on `X₀` and fixing the other basis vectors, and `R = 𝖴H` the
  Bessel subgroup (`𝖴` is normal in `R`); `R⁰ = 𝖴⁰H` fixes the frame.
- `σ(g)` is the sum of the entries of `g` just above the diagonal on the frame: the coefficient of `e_a` in `g e_{a+1}`
  (`a < ϱ`) and of `e_ϱ` in `g z`. The character of `𝖴` is `ψ(u) = exp(σ(u) − σ̄(u))`.
- Haar measures: on `𝖴` and `𝖴⁰` the images of Lebesgue measure under the coordinates of the free entries, on `H` the
  probability measure, on `G₁` the Haar measure `μ_{G₁}` of the Conventions (**Normalisations**), which is the one of
  the first background result of the *Needs:* line; `∫_{𝖴\G₁}` is the quotient
  integral, and on `R` the measure is `du dh`.
- The *Bessel length* of `y` is `ℓ(y) = inf_{s ∈ R}(‖s y‖ + 1)`; it is left invariant under `R`. For `b > 0` the scaled
  length is `ℓ_b(y) = max(1, ℓ(y)/b^{6n})`, and `y` lies *in the cut* if `ℓ(y) ≤ b^{6n+2}`.
- The *frame Gram matrix* of `γ ∈ G₁` is the `n × n` matrix `Z(γ) = (h(f_a, γf_b))_{a,b}`. For an `n × n` matrix `Z` with
  leading principal minors `D_l` and a number `N`, put `𝗀_N(Z) = |D_n|² − N²|D_ϱ|²`, and `𝗀 = 𝗀₁`. The *open cell* `Ω` is
  the set of invertible `Z` whose inverse has last diagonal entry `ξ(Z)` of modulus less than `1`; put
  `ν(Z) = (1 − |ξ(Z)|²)^{1/2}`. `Z` is *bounded in the cell by `P`* if `Z ∈ Ω` and `‖Z‖`, `‖Z⁻¹‖`, `ν(Z)⁻¹` are at most `P`.
- `c_G = vol U(k)/vol U(r) · 2π^k/(k − 1)!`, with `vol U(j) = ∏_{i=1}^{j} 2π^i/(i − 1)!` as in the Conventions
  (**Normalisations**).
- Discrete series: for signs `ε` with `pᴴ J₁ p = diag(ε)` for a fixed unitary matrix `p`, and a doubled Harish-Chandra
  parameter `l = 2λ` for `ε`, `c_λ` is the coefficient of the discrete series of parameter `λ` on `U(diag ε)` and on `G₁`
  through `p`, and `deg(λ) = (∫|c_λ|²)⁻¹` its formal degree (the second background result of the
  *Needs:* line). `l` has *large gap `A`* if its entries are distinct, of the parity of `r − 1`,
  and entries of `λ` at coordinates of different sign are at least `500r³ + A` apart. Convolution is
  `(F ∗ φ)(y) = ∫ φ(a⁻¹)F(ya) da`.

*Needs:* ShortGRH background (the Haar measure of `U(J)` given by the Cayley chart, as in the Conventions, which has
mass one on the compact group `U(r)`; the Haar measures of `𝖴` and `𝖴⁰` as images of Lebesgue measure under the free
entries, both unimodular; [ShortProof] `Lib/DiscreteSeries/Haar/CayleyChart.lean` (`New.haarU`, `New.volU`),
`Lib/DiscreteSeries/Haar/TotalMass.lean` (`New.isProbabilityMeasure_haarU`),
`Lib/DiscreteSeries/Bessel/UnipotentHaarMeasure.lean` (`New.RealPlace.measurePreserving_freeEntries_besselHaar`,
`New.RealPlace.measurePreserving_freeEntries_besselHaar₀`)); ShortGRH background (the function `c_λ` on `U(diag ε)`
defined by Flensted-Jensen's integral over the maximal compact subgroup for the lowest `K`-type of `λ`, its formal
degree `(∫|c_λ|²)⁻¹` and the kernel `deg(λ)·c̄_λ`; [ShortProof] `Lib/DiscreteSeries/FlenstedJensen/Defs.lean`
(`New.HCParam.dsCoeff`, `New.HCParam.formalDegree`, `New.HCParam.dsKernel`, `New.HCParam.HasLargeGap`)).

[ShortProof], `New/Spanning/Bessel/Basic.lean` (`New.besselLength`, `New.frameBox`, `New.frameDisc`,
`New.RealPlace.gramDiscReal`, `New.Shape.openCellConst`, `New.scaledBesselLength`); `New/Spanning/Bessel/Average.lean`
(`New.Shape.besselGraph`, `New.Shape.besselGraphMeasure`)

### 3.2 The Bessel length and the Gram–Schmidt frame

*Origin:* particular to this proof: two-sided comparison of the Bessel length of a point with the lengths of the
Gram–Schmidt vectors of its frame vectors.

*Method of the formal proof:* the elements of `R` act on the frame by triangular matrices or fix it, so the Gram–Schmidt
vectors of the frame vectors do not change under left multiplication by `R`; for the converse the point is corrected on
the left by an element of `R` until its frame vectors and their duals are bounded, and the norm of a unitary matrix is
bounded by those of the columns `y⁻¹e_a`, `y⁻¹z`, `y⁻¹e*_a`. The Gram determinant identity is a block computation.

Let `o_a(y)`, `a = 0, …, ϱ`, be the vectors obtained from the frame vectors `y⁻¹f₀, …, y⁻¹f_ϱ` by the Euclidean
Gram–Schmidt process (not normalised).

(a) `o_a(sy) = o_a(y)` for `s ∈ R`, and `y ↦ o_a(y)` and the triangular Gram–Schmidt matrix are continuous.

(b) If `ℓ(y) ≤ L` then `L⁻¹ ≤ ‖o_a(y)‖ ≤ L` for all `a`. Conversely, if `L ≥ 1` and `L⁻¹ ≤ ‖o_a(y)‖ ≤ L` for all `a`,
then `ℓ(y) ≤ 8(ϱ + 1)L`.

(c) If `L ≥ 1`, `y ∈ B(L)` and the vectors `y⁻¹e*_a` have length at most `L`, then `‖y‖ + 1 ≤ 8(ϱ + 1)L`. If vectors
`V₀, …, V_{2ϱ}` of length at most `L` have `V_a = y⁻¹f_a` for `a ≤ ϱ` and `h(V_a, V_c) = −1` for `a + c = 2ϱ`, `0` for
`a + c < 2ϱ`, then `ℓ(y) ≤ 8(ϱ + 1)L`.

(d) For a self-adjoint `N` in a commutative ring with involution and an isometry `γ` of the form with middle block
`diag(1, …, 1, −N)` on `X₀ ⊕ ⟨z⟩`, the Gram determinant of the `2n` vectors `f, γf` is `(−1)^n 𝗀_N(Z(γ))`.

*Needs:* 3.1

[ShortProof], `New/Spanning/Bessel/Basic.lean` (`New.orthoFrame_besselS_mul`, `New.norm_orthoFrame_mem_Icc`,
`New.besselLength_le_of_norm_orthoFrame`, `New.norm_add_one_le_of_mem_frameBox`, `New.besselLength_le_of_dual`,
`New.det_gram_framePair`)

### 3.3 Bessel functions, cut pairs and Bessel systems

*Origin:* definitions and conventions.

Fix a shape, `b ≥ 1`, an integer `f ≥ 1`, a finite nonempty set `I` and a unitary representation `ρ` of `U(k)` on `ℂ^I`.

- A *Bessel function of type `ρ`* is a bounded measurable `F : G₁ → ℂ^I` with `F(uy) = ψ(u)F(y)` for `u ∈ 𝖴` and
  `F(hy) = ρ(h)F(y)` for `h ∈ H`. `‖F‖₂` is its norm in `L²(𝖴\G₁)`.
- A *decay majorant* of a pair `(W, W♭)` of continuous functions `G₁ → ℂ^I` is a measurable `R`-left-invariant
  `A : G₁ → [0, ∞]` with `ℓ_b(y)^{3r³f}‖W(y)‖ ≤ A(y)` and `ℓ_b(y)^{3r³f}‖W♭(y)‖ ≤ A(y)`, `A ≤ a` for a number `a < ∞`, and
  `a·∫_{𝖴\G₁} A ≤ b^{400r²}·#I`.
- `(W, W♭)` is a *cut pair* of type `ρ`: both are Bessel functions of type `ρ`; `W` is integrable on `𝖴\G₁`;
  `‖W‖₂² = #I`, `‖W♭‖₂² ≤ #I`; `W♭` vanishes off the cut; `‖W♭ − W‖₂² ≤ b^{−2r³f}·#I`; `W♭(y) = W(y)` unless
  `ℓ(y) > b^{6n+2}/2`; and a decay majorant exists.
- `F` has a *Schur bound* `(B, D)` if there are continuous Bessel functions `V_w` of type `ρ`, one for each word `w` in
  pairs of basis indices, with `V_∅ = F`, such that along every `C¹` curve `γ` with `γ′(t) = γ(t)X` one has
  `(V_w ∘ γ)′(t) = ∑_{a,c} X_{ac} V_{(a,c)w}(γ(t))`, and such that for `|w| ≤ 2n²` and every integrable `φ` on `G₁`:
  `∫_{𝖴\G₁} ‖∫_{G₁} φ(y)V_w(gy) dy‖² dg ≤ B^{2|w|}·D·∫|φ|²`.
- *Local bounds* of `W♭` with degree `deg` are forms `J_i(p, q)`, `0 ≤ i ≤ n = ϱ + 1`, on pairs of sequences
  `p, q : ℕ → ℂ^×` that form a sieve system in the sense of RemainingAndMainTermsOfSecondMoments §6.1, with these
  data: the ring `C = ℂ` with Lebesgue measure; `U = ℂ^×`; the length (the `n` of §6.1) is `ϱ`; the entry map is
  `u(c) = c` for `c ≠ 0` and `u(0) = 1`; the map back is `ι(z) = z⁻¹`; the twist is `ψ(c) = exp(c − c̄)`; the bound of
  the bottom form is `E = (1 + b⁻¹⁰)/deg`; the weights are
  `Λ_i(p) = ∏_{l<i} w(p₀p₁⋯p_l)`, with `w(δ) = max(1, |δ|⁻¹)^{n⁶}` if `|δ| ≤ b^{60n²}` and `w(δ) = 0` otherwise; and
  the decay is `β(ξ) = Θ_𝔰·b^{2000n⁹}·ℓ_{max(k−n⁷, 0)}(1/|ξ|)` with `Θ_𝔰 = π^{(2ϱ+1)k}·vol U(k)/vol U(r)` and
  `ℓ_j(t) = t^j·min(1, t)⁶`; and, for `σ` fixing the hyperbolic basis vectors
  and `p_ϱ = q_ϱ = h(z, σz)`, `J_n(p, q)` is the inner product of the normalised orbital integrals of `W♭` at the Weyl
  elements of `p` and `q` (the tensor `∫W♭(y) ⊗ W♭(γ⁻¹y)^* dy` at `γ = w_p σ`, times
  `c_G^{1/2}(|p_ϱ|² − 1)^{(k−1)/2}·#I⁻¹·∏_{a<ϱ}|p_a|^{k+1+2(ϱ−a−1)}`).
- A *Bessel system* with parameters `(b, f)`: a finite nonempty `I`, continuous `W`, `W♭ : G₁ → ℂ^I`, a number `deg > 0`
  and an irreducible type `ρ` (every matrix commuting with `ρ` is scalar), such that `(W, W♭)` is a cut pair, `W` has a
  Schur bound `(P, #I/deg)` for every `P ≥ b⁵`, `b ≥ 8r`, and `W♭` has local bounds with degree `deg`.

*Needs:* 3.1; RemainingAndMainTermsOfSecondMoments §6.1 (sieve systems).

[ShortProof], `New/Spanning/Bessel/Basic.lean` (`New.IsDecayMajorant`, `New.IsCutPair`, `New.RealPlace.HasSchurBound`,
`New.HasLocalBounds`, `New.normalizedOrbitalIntegral`, `New.BesselSystem`)

### 3.4 The Gram section on the open cell

*Origin:* adapted from the Bruhat decomposition and the Bessel data of a pair of unitary groups (GanGrossPrasadUnitaryGroups
§1.2): here, an explicit section of `γ ↦ Z(γ)` over the open cell, with polynomial bounds, and the fibres of that map.

*Method of the formal proof:* `γ_Z` is written down as an explicit matrix in `Z` and `Zᴴ`, shown to be an isometry of
`J₁` on `Ω`, and its derivative is bounded by Cauchy's estimate on a ball; the description of the fibres is Witt's theorem
for the frame and its image.

(a) There is a measurable map `Z ↦ γ_Z` from `n × n` complex matrices to `G₁`, the identity off `Ω`, with
`Z(γ_Z) = Z` for `Z ∈ Ω`.

(b) If `Z(γ) = Z ∈ Ω` then `γ = u k γ_Z (u′ k′)⁻¹` with `u, u′ ∈ 𝖴⁰` and `k, k′ ∈ H`.

(c) If `ρ > 0`, `P ≥ 8` and every `Y` within `ρ` of `Z` is bounded in the cell by `P`, then `‖γ_Z‖ ≤ P¹²` and the real
derivative of `Y ↦ γ_Y` at `Z` has norm at most `2P¹²/ρ`.

*Needs:* 3.1; HermitianFormsAndLattices §1.1 (b) (Witt extension, over `ℂ/ℝ`: two independent families of vectors with
the same Gram matrix are carried to one another by an element of the unitary group)

[ShortProof], `New/Spanning/Bessel/GramSection.lean` (`New.RealPlace.gramSection`,
`New.RealPlace.measurable_gramSection`, `New.RealPlace.realFrameGram_gramSection`,
`New.RealPlace.exists_eq_mul_gramSection_mul`, `New.RealPlace.norm_sectionMatrix_le_and_norm_fderiv_le`)

### 3.5 The mean value inequality over the Gram matrix of two frames

*Origin:* adapted from the Bruhat decomposition and the Bessel data of a pair of unitary groups (GanGrossPrasadUnitaryGroups
§1.2): here, a one-sided integration formula over the open cell, with the weight `c_G 𝗀(Z)^{k−1}`.

*Method of the formal proof:* a frame whose products with `f` form the matrix `Z` is `y′Z` for a family `y′` dual to the
frame; `𝖴⁰` acts on the first `ϱ` members of `y′`, and the `X₀`-component of the last one ranges over a sphere. In these
coordinates the distribution of `s γ_Z f` under the weighted measure is computed and bounded by the fibre measure of the
Gram map over the Gram matrix of `f`, which is then compared with Haar measure; only upper bounds by fibre measures are
used, never their values.

For every measurable `F ≥ 0` on `G₁`,

`∫_Ω c_G 𝗀(Z)^{k−1} ∫_{R⁰}∫_{R⁰} F(s′ γ_Z s) ds ds′ dZ ≤ ∫_{G₁} F`,

with `dZ` Lebesgue measure on complex `n × n` matrices and `ds` the measure `du dh` on `R⁰ = 𝖴⁰H`.

*Needs:* 3.1, 3.4; ShortGRH background (a measure `l` on a space `X` is at most the fibre measure `dμ/dν` of a map
`π : X → B` over `b` if, for every lower semicontinuous `K ≥ 0` and every `C`, the bounds `∫_{π⁻¹S} K dμ ≤ C·ν(S)` for
all sufficiently small open `S ∋ b` give `∫ K dl ≤ C`; for a tuple `E` of vectors, a measure `m` on `U(J)` is below
the fibre measure of the Gram map at `E` if its image under `g ↦ gE` is at most the fibre measure, over the Gram matrix
of `E`, of Lebesgue measure on tuples with respect to Lebesgue measure on Gram matrices; for a basis with Gram matrix
`J`, `J` of size `r`, the measure `vol U(r)/2^r` times the Haar measure of the Conventions is below the fibre measure;
and if an s-finite measure `m` on `G₁` is below the fibre measure at the frame `(e₁, …, e_ϱ, z)`, then the convolution
`m ∗ ds`, with `ds = du dh` the measure of the fixer `R⁰ = 𝖴⁰H` of the frame, is at most
`vol U(r)/(2^{ϱ+1}·vol U(k))` times the Haar measure of `G₁`; [ShortProof] `Lib/General/Measure/FibreMeasure.lean`
(`New.LeFibreMeasure`), `Lib/DiscreteSeries/Haar/GramFibre.lean` (`New.LeGramFibre`, `New.leGramFibre_haar`),
`Lib/DiscreteSeries/Bessel/FrameFibre.lean` (`New.LeGramFibre.mconv_fixerHaar_le`))

[ShortProof], `New/Spanning/Bessel/MeanValue.lean` (`New.RealPlace.lintegral_gramSection_le`,
`New.RealPlace.leGramFibre_gramSectionMeasure`)

### 3.6 Schur's bound for a Bessel function fixed by a discrete series

*Origin:* adapted from Schur's orthogonality relations for discrete series representations (Harish-Chandra), classical: here, for
Bessel functions on `G₁` fixed by convolution with `deg·c_λ`, with explicit `L²(𝖴\G₁)` bounds for their right
derivatives.

*Method of the formal proof:* the right derivatives of a function fixed by the idempotent kernel `deg·c_λ` are its
convolutions with derivatives of the kernel; the kernels for words in the matrix units are bounded in `L²` by explicit
bounds for the derivatives of `c_λ`. The matrix coefficient `g ↦ ∫_{𝖴\G₁}⟨F(y), F(yg)⟩dy` is `‖F‖₂²` times `c_λ`, which
gives (b), and (c) follows by Cauchy–Schwarz in the convolution.

Let `l = 2λ` have large gap `A` with `|l_a| ≤ L` for all `a`, and `deg = deg(λ)`.

(a) There are integrable kernels `X_w` on `G₁`, one for each word `w` in pairs of basis indices, with `X_∅ = deg·c_λ`,
`X_∅ ∗ X_w = X_w`, `deg⁻¹∫|X_w|² ≤ ((r + 1)⁴(L + r + 1 + |w|))^{2|w|}`, and such that for every bounded measurable `F`
with `F ∗ X_∅ = F` the functions `F ∗ X_w` are its iterated right derivatives in the sense of the chain rule of 3.3.

(b) If `F` is a Bessel function of type `ρ`, integrable on `𝖴\G₁`, with `F ∗ (deg·c_λ) = F`, then
`∫_{G₁}|∫_{𝖴\G₁}⟨F(y), F(yg)⟩dy|² dg = ‖F‖₂⁴/deg`.

(c) For such `F` and every `B ≥ (r + 1)⁴(L + r + 1 + 2n²)`, `F` has a Schur bound `(B, ‖F‖₂²/deg)`.

*Needs:* 3.1, 3.3; ShortGRH background (for a parameter `λ` of gap at least `500r³ + A`, the kernel `e_λ = deg(λ)·c̄_λ` is continuous and
integrable with `e_λ(g⁻¹) = conj e_λ(g)` and `∫ e_λ(z)e_λ(x⁻¹z⁻¹y) dz = e_λ(x⁻¹)e_λ(y)/e_λ(1)`, and `β ∗ e_λ = e_λ` for
a smooth compactly supported `β`; [ShortProof] `Lib/DiscreteSeries/Rigidity/KernelFixes.lean`
(`New.HCParam.HasLargeGap.isIdempotentKernel_dsKernel`, `New.HCParam.HasLargeGap.exists_bump_conv_dsKernel`))

[ShortProof], `New/Spanning/Bessel/SchurBound.lean` (`New.exists_derivative_kernels`,
`New.IsBesselFunction.lintegral_enorm_sq_integral_inner_translate`, `New.IsBesselFunction.hasSchurBound_of_convolve_eq`)

### 3.7 The L² bound at the Gram section

*Origin:* particular to this proof: an `L²` bound for convolutions of a Bessel function at the translates of the Gram
section by a bounded part of the fixer of the frame, at the price of a power of the size.

*Method of the formal proof:* unfolding over `𝖴` bounds an integral over `G₁` by `(2R₁)^{2n²}` times the integral over
`𝖴\G₁`, once the elements of `𝖴` that connect two points of the support have bounded frame block; Sobolev's inequality on
a small cube around `Z` replaces the value at `Z` by mean squares of derivatives, which Schur's bound controls.

(a) Let `w, φ ≥ 0` be measurable on `G₁`, `w` left invariant under `R`, `∫_{𝖴⁰} φ(uy) du ≤ K` for all `y`, and suppose that
for all `y`, all `u ∈ 𝖴` with `φ(y) ≠ 0 ≠ φ(uy)`, the frame block of `u` has entries of modulus at most `R₁ ≥ 1`. Then
`∫_{G₁} φw ≤ K(2R₁)^{2n²}∫_{𝖴\G₁} w`.

(b) Let `P ≥ 8r`, let `F` have a Schur bound `(P, D)` (3.3), let `c > 0`, and let every `Y` within `P⁻⁶` of `Z` be bounded
in the cell by `P` and have `𝗀(Y) ≥ c`. Let `φ` be integrable, vanishing where `‖y‖ > P²⁰`. Then

`∫ ‖∫_{G₁} φ(y) F(γ_Z (u h)⁻¹ y) dy‖² ≤ P^{2000n²}·D·∫|φ|²`,

the outer integral over the `(h, u) ∈ H × 𝖴⁰` with `‖u‖ ≤ P²⁰`, for Haar measure times `c_G c^{k−1}`.

*Needs:* 3.1, 3.3, 3.4, 3.5

[ShortProof], `New/Spanning/Bessel/SobolevBound.lean` (`New.lintegral_mul_le_of_frameMatrix_le`,
`New.RealPlace.lintegral_gramSection_integral_le`)

### 3.8 The Bessel average of a discrete series coefficient

*Origin:* adapted from the classical theory of Bessel models of discrete series (Bessel functions as integrals of a
matrix coefficient against a character of the Bessel subgroup): here, with the norm given by a period and the volume of
a ball bounded by the norm.

*Method of the formal proof:* the integral converges by the decay of `c_λ` under a large gap; the transformation laws are
changes of variable in `R`; the reproducing property exchanges the two integrals and uses the product formula of the
idempotent kernel; the norm unfolds one factor to `G₁` and reproduces `W` at `x`.

Let `l = 2λ` have large gap, `ρ` a continuous unitary representation of `U(k)` on `ℂ^I`, `v ∈ ℂ^I` a unit vector,
`x ∈ G₁`, and let `π` be the representation of `R` that is `ψ` on `𝖴` and `ρ` on `H`. Put
`W(y) = ∫_R c_λ(x⁻¹ s y)·π(s)⁻¹v ds`.

(a) The integral converges absolutely, and `W` is a Bessel function of type `ρ` with `W ∗ (deg·c_λ) = W`.

(b) `deg·‖W‖₂² = ⟨v, W(x)⟩`.

(c) Let `μ` be a parameter of `U(k)` whose coefficient satisfies `c_μ(h) = ⟨v, ρ(h)v⟩`. If the volume of
`{s ∈ R : ‖x⁻¹sx − 1‖ ≤ 1}` is at most `P ≥ 0` times `|∫_R c_λ(x⁻¹sx)·c̄_μ(h_s)·exp(σ̄(s) − σ(s)) ds|` (`h_s` the
component of `s` in `H`), then it is at most `P·deg·‖W‖₂²`.

*Needs:* 3.1, 3.3; ShortGRH background (for a parameter `λ` of gap at least `500r³ + A`: every function `F` obtained from `c_λ` by right
derivatives has `|F(g)| ≤ K_F·(2/‖g‖)^c` for each `c ≤ 500r³ + A`; `‖g‖^c·e_λ(g)` is integrable for `c ≤ A + 1`; the
kernel `e_λ` is idempotent as in the background result of 3.6; and Schur's orthogonality relation holds for `c_λ`;
[ShortProof] `Lib/DiscreteSeries/FlenstedJensen/SquareIntegrability.lean`
(`New.HCParam.HasLargeGap.exists_decay_bound`, `New.DiscreteSeries.norm_dsCoeff_le_pow`,
`New.HCParam.HasLargeGap.integrable_dsKernel_mul_norm_pow`, `New.dsCoeff_schur_orthogonality`),
`Lib/DiscreteSeries/Rigidity/KernelFixes.lean` (`New.HCParam.HasLargeGap.isIdempotentKernel_dsKernel`))

[ShortProof], `New/Spanning/Bessel/LargeFunction.lean` (`New.DiscreteSeries.integrable_besselIntegrand`,
`New.DiscreteSeries.isBesselFunction_besselAverage`, `New.DiscreteSeries.convolve_besselAverage`,
`New.DiscreteSeries.formalDegree_mul_integral_norm_sq_besselAverage`, `New.DiscreteSeries.besselBallVolume_le_of_period`);
`New/Spanning/Bessel/Average.lean` (`New.DiscreteSeries.besselAverage`)

### 3.9 A point at which the Bessel period is large

*Origin:* adapted from Laplace's method for periods of products of matrix coefficients (H. He (2017), through PairsOfFramesAtOnePlace §8.6): here, at
an explicit point of bounded Bessel length, for steep parameters.

*Method of the formal proof:* Witt's theorem gives a point `x` that carries the stationary position of `H` in `G₁` to
the standard frame; its Bessel length is bounded by the size of the position. The group `x⁻¹Rx` with the coefficients of
`l` and `μ` is then a datum of Laplace's method, whose lower bound for the period dominates the volume of a ball.

Let `l` be a parameter of `U(diag ε)` that is steep with bound `B ≥ 1` for a splitting of the coordinates into a set `X`
and `2n` further coordinates, in the sense of PairsOfFramesAtOnePlace §8.1 (steep parameters); let `μ` be a
parameter of `U(k)` whose lowest `K`-type has weight `a` at one coordinate and `0` on `X` (`κ = X ⊔ {one coordinate}`).
Let both have large gap `A` (3.1, in their own ranks), entries of modulus at most `L`, and let `β ≥ 10¹²`,
`r + k + L ≤ β`, `10³⁰((r + k)² log β)³ ≤ A`, `3B + a ≤ b²` and `8nr ≤ b`. Then there is `x ∈ G₁` with `ℓ(x) ≤ b^{5n}`
and

`vol{s ∈ R : ‖x⁻¹sx − 1‖ ≤ 1} ≤ β^{20(r+k)²}·|∫_R c_l(x⁻¹sx)·c̄_μ(h_s)·exp(σ̄(s) − σ(s)) ds|`.

*Needs:* 3.1; PairsOfFramesAtOnePlace §8.1 (steep parameters), §8.5 (their stationary position), §8.6 (the lower
bound for periods by Laplace's method); HermitianFormsAndLattices §1.1 (b) (Witt extension, over `ℂ/ℝ`: two
independent families of vectors with the same Gram matrix are carried to one another by an element of the unitary
group)

[ShortProof], `New/Spanning/Bessel/LargeFunction.lean` (`New.DiscreteSeries.IsSteep.exists_stationary_point`)

### 3.10 The Bessel function at a real place: decay and cut

*Origin:* adapted from the decay of generalised Whittaker functions (Beuzart-Plessis (2020), Lemma 7.3.1 (i), a bound
for Bessel functionals of tempered representations): here, the Bessel average of a discrete series coefficient with a
large gap, normalised, with an explicit decay majorant in the Bessel length, and its cut with an explicit `L²` distance;
no uniqueness is asserted.

*Method of the formal proof:* the average inherits the decay of the coefficient in the Bessel length; the hypothesis on
the volume of the ball, through 3.8 (c), bounds the normalising constant; the cut multiplies by a piecewise linear
function of `ℓ(y)`, and the tail beyond `b^{6n+2}/2` is bounded through the majorant.

For `R > 0` let `χ_R(t) = max(0, min(1, 2 − 2t/R))` and `W♭(y) = χ_{b^{6n+2}}(ℓ(y))·W(y)`.

(a) If `(W, W♭)` has a decay majorant (3.3), `b ≥ 2`, `r ≥ 100` and `f ≥ 1`, then `‖W♭ − W‖₂² ≤ b^{−2r³f}·#I`.

(b) Let `l = 2λ` have large gap `A` with `|l_a| ≤ L`, `ρ` continuous, `v` a unit vector, `x` with `ℓ(x) ≤ b^{5n}`, and let
`W` be the Bessel average of 3.8. Suppose that the volume of `{s ∈ R : ‖x⁻¹sx − 1‖ ≤ 1}` is at most `b^m·deg·‖W‖₂²`,
and that `b ≥ 2000`, `r ≥ 100`, `f ≥ 1`, `m + 99r² ≤ 400r²`, `r + L + 1 ≤ b⁴` and `3r³f ≤ A`. Then for some real `c` the
function `F = c·W` satisfies `F ∗ (deg·c_λ) = F`, and `(F, F♭)` is a cut pair of type `ρ` with parameters `(b, f)`.

*Needs:* 3.1, 3.3, 3.8; ShortGRH background (for a parameter `λ` of gap at least `500r³ + A` and a natural number
`c ≤ 500r³ + A`, `|c_λ(g)| ≤ (2/‖g‖)^c` for all `g`, with `‖g‖` the operator norm; and for `J` of size `n ≥ 1`, a
proper continuous homomorphism `j : S → U(J)` from a group `S` with a right invariant measure `ν` that is finite on
compact sets, a natural number `c > 8n²` and `y ∈ U(J)`,
`∫_S (2/‖j(s)y‖)^c dν(s) ≤ 16^c·ν{s : ‖j(s) − 1‖ ≤ 1}`; [ShortProof]
`Lib/DiscreteSeries/FlenstedJensen/SquareIntegrability.lean` (`New.DiscreteSeries.norm_dsCoeff_le_pow`),
`Lib/DiscreteSeries/Haar/TotalMass.lean` (`New.DiscreteSeries.lintegral_decay_le`))

[ShortProof], `New/Spanning/Bessel/CutTailBound.lean` (`New.IsDecayMajorant.lintegral_sq_besselCut_sub_le`,
`New.exists_isDecayMajorant_besselAverage`, `New.exists_isCutPair_besselAverage`)

### 3.11 Normalisation of a Bessel function and of its cut

*Origin:* particular to this proof: orthonormality of the coordinates of a Bessel function of irreducible type, and the
corresponding inequality for its cut.

*Method of the formal proof:* Schur's lemma: the matrix `(∫_{𝖴\G₁} W_i W̄_j)_{ij}` intertwines the irreducible type with
itself, hence is scalar, and its trace is `‖W‖₂²`; the same for `W♭`, with `‖W♭‖₂² ≤ #I`.

Let `(W, W♭)` be a cut pair of irreducible type `ρ` on `ℂ^I`.

(a) There is `c ∈ [0, 1]` with `∫_{𝖴\G₁} W♭_i W̄♭_j = c·δ_ij`; for every `v`, `∫_{𝖴\G₁}|⟨v, W♭(y)⟩|² ≤ ‖v‖²`.

(b) For a Bessel system, `∫_{𝖴\G₁} W_i W̄_j = δ_ij`.

*Needs:* 3.3

[ShortProof], `New/Spanning/Bessel/Orthonormality.lean` (`New.IsCutPair.exists_integral_cut_mul_conj_eq`,
`New.IsCutPair.lintegral_sq_inner_cut_le`, `New.BesselSystem.orthonormal`)

### 3.12 The open cell bound for a Bessel system

*Origin:* particular to this proof: an `L²` contraction bound, averaged over shifts in the fixer of the frame, for the
kernels `W(γtz) ⊗ W̄(tz)` of a Bessel system, with a mass that is a power of the size over `𝗀`.

*Method of the formal proof:* near a point of `Ω` with `𝗀` not too small the matrix, its inverse and `ν` obey explicit
bounds on a ball, which supplies the hypotheses of 3.7 (b); the shifts are drawn from a probability measure on a bounded
part of the fixer of the frame, and the mean value inequality 3.5 converts the bound at the Gram section into one at `γ`.

(a) If `n ≤ M`, the entries of `Z` have modulus at most `M²` and `𝗀(Z) ≥ M⁻¹`, then `Z` is bounded in the cell by every
`T ≥ M^{8n}`. If moreover `M ≥ 8n` and `P ≥ M^{9n}`, every `Z′` with `‖Z′ − Z‖ < P⁻⁶` has `𝗀(Z′) ≥ 𝗀(Z)/2` and is bounded in
the cell by `P`.

(b) Let `(W, W♭, ρ, deg)` be a Bessel system with parameters `(B, f)` on `ℂ^I`, `γ ∈ G₁` with `𝗀(Z(γ)) > 0`, `ρ₀ ≥ B`,
and `y` with `y ∈ B(ρ₀)` and `γ⁻¹y ∈ B(ρ₀)`. Then there are a compact `A ⊂ G₁`, a probability measure `m` on a set `T`,
a measurable `t : T → R⁰` and a finite measure `μ` on `G₁` of mass at most

`(ρ₀^{9n}/𝗀)^{10⁵n⁴}·#I²/(deg·c_G·(𝗀/2)^{k−1})`, `𝗀 = 𝗀(Z(γ))`,

such that for every bounded measurable `φ` the `m`-mean of `‖∫_A φ(z)·W(γt(τ)z) ⊗ W̄(t(τ)z) dz‖²` is at most
`∫|φ|² dμ`, and for `m`-almost every `τ`, `A` contains every `z ∈ B(ρ₀)` with `ℓ(γt(τ)z) ≤ ρ₀`.

*Needs:* 3.1, 3.2, 3.3, 3.4, 3.5, 3.7

[ShortProof], `New/Spanning/Bessel/OpenCellBound.lean` (`New.RealPlace.isBoundedInCell_of_inv_le_gramDiscReal`,
`New.RealPlace.gramDiscReal_div_two_le_and_isBoundedInCell`, `New.BesselSystem.exists_isOpenCellBound`)

### 3.13 One pairing on the open cell, at all places together

*Origin:* particular to this proof: a bound for the integral of the tensor of cut Bessel functions against a bounded
weight invariant under the fixers of the frames, by the product over the places of the open cell bounds.

*Method of the formal proof:* the operator bounds of 3.12 multiply over the places; one shift no worse than the mean
gives the bound for the uncut functions, and the difference between the cut and uncut kernels is kept as an error term.

Let `(W_v, W♭_v)` be Bessel systems with parameter `b`, one for each `v` in a finite set, `W`, `W♭` the tensor products,
and `γ = (γ_v)` with `𝗀(Z(γ_v)) > 0`. Let `y′` have `y′_v, γ_v⁻¹y′_v ∈ B(ρ_v)` with `ρ_v ≥ b^{6n+2}`. Let `φ` be measurable,
`|φ| ≤ 1`, invariant under left multiplication by `R⁰` at each place, and such that `φ(y)·W♭(y) ⊗ W♭(γ⁻¹y)^*` vanishes
unless `y_v ∈ B(ρ_v)` for all `v`. Then this function has compact support, and

`‖∫ φ(y)·W♭(y) ⊗ W♭(γ⁻¹y)^* dy‖ ≤ (∏_v β_v)^{1/2} + ∫|φ(y)|·‖W(y) ⊗ W(γ⁻¹y)^* − W♭(y) ⊗ W♭(γ⁻¹y)^*‖ dy`,

where `β_v` is the mass bound of 3.12 (b) for `γ_v`, `deg_v`, `ρ_v`, `#I_v`.

*Needs:* 3.12

[ShortProof], `New/Spanning/Bessel/OpenCellPairing.lean` (`New.BesselSystem.enorm_integral_pairKernel_cut_le`)

### 3.14 Bessel systems for the data

*Origin:* adapted from the decay of generalised Whittaker functions (Beuzart-Plessis (2020), Lemma 7.3.1 (i), a bound
for Bessel functionals of tempered representations): here, at each real place of the data, a Bessel system whose full
function is the normalised Bessel average of the discrete series of parameter `λ_v`, with values in the representation
of `U(X₀)` of the weight of the source forms.

*Method of the formal proof:* the point `x` of 3.9 makes the period large, so 3.8 (c) bounds the volume of the ball by
`b^{60(r+k)²}·deg·‖W‖₂²`; 3.10 gives the normalised function and its cut, 3.6 its Schur bounds, and the local bounds of the
cut come from the bounds for cut Bessel functions at `ℂ` of PairsOfFramesAtOnePlace §4.3 (d).

For each `v ∈ Φ` there is a Bessel system with parameters `(b, f)` for the shape of `Y₀` (`ϱ` planes, `κ` indexing a basis
of `X₀`) with:

(a) `deg` the Weyl dimension polynomial at `l_v` (the formal degree of `λ_v`);

(b) type `ρ` with `Aρ(g) = S(gᵀ)ᵀA` for an invertible matrix `A` and all `g ∈ U(X₀)`, where `S` is the (Schur) matrix
representation of `GL(X₀)` of the weight of the source forms at `v`;

(c) full function fixed by convolution with `deg·c_{λ_v}`, and equal to `c·W` for a Bessel average `W` of 3.8 (some
`c ∈ ℝ`, `x ∈ G₁`, unit `v`).

*Needs:* 3.3, 3.6, 3.8, 3.9, 3.10; PairsOfFramesAtOnePlace §4.3 (local bounds at `ℂ` for cut Bessel functions);
DeterminantsOfThetaLiftChains §5.4 (a) (the parameters are steep); ThetaLiftChainsAndTheSeesawIdentity §2.4 (the
target parameter and its gap), §2.8 (the weight of the source forms); OneSidedPrimeSumBoundsAndAdmissibleData §3.3 (the
sizes); DiscreteSeriesCoefficientsAndAutomorphicMetrics §8.3 (the formal degree of a discrete series, for the measure that
corresponds to mass one on the compact dual, is the value of Weyl's dimension polynomial at its parameter); ShortGRH
background (for a parameter `l = 2λ` of gap at least `500r³ + 10r⁵`, the formal degree `deg(λ) = (∫|c_λ|²)⁻¹`,
taken with the measure `μ_{G₁}` of the Conventions, is the value at `l` of Weyl's dimension polynomial: the product
of `λ_i − λ_j` over the pairs with `λ_j < λ_i`, divided by `∏_{i<r} i!`; [ShortProof]
`Lib/DiscreteSeries/Character/FormalDegree.lean` (`New.Orbital.formalDegree_eq_weylDimensionPoly`))

[ShortProof], `New/Spanning/Bessel/FillingData.lean` (`New.Data.exists_besselSystem`);
`New/Spanning/Bessel/LargeFunction.lean` (`New.Filling.IsDiscreteSeriesBessel`)

## Layer 4: Filling data and the unfolded second moment

### 4.1 Filling data and the standing hypotheses

*Origin:* definitions and conventions.

*Filling data* `𝔉` over a CM field `E` for a shape (3.1) consist of:

- a prime `N ≥ 5`, an integral finite idele `π` with `ππ̄ = N`, such that at every finite place `w` either `π_w` is a
  unit, or `w` has norm `N` and `π_w̄` is a unit;
- primes `p₀, p₁ ≠ N` with `b¹⁰ ≤ p_i ≤ b¹¹`, `M = p₀p₁` with `b¹⁹ ≤ M ≤ b²³`, and for each `i` a set of `f` chosen places
  of norm `p_i`, no place chosen twice and no conjugate of a chosen place chosen, such that `M` divides an integral
  adele `t` exactly when `t` and `t̄` vanish modulo every chosen place;
- `ϖ ∈ 𝒪_E` with `ϖ̄ = −ϖ` generating the different of `E`;
- a real `b` with `1000 ≤ b`, `f ≤ b/1000`, `k ≤ b`, `rd_E ≤ b`, `ϱ + 1 ≤ b`, `(200fk·rd_E)¹⁰⁰⁰ ≤ b`, and
  `10⁵ ≤ ϱ`, `2^{−ϱ} ≤ b⁻⁶`, `(ϱ + 1)[E : ℚ] ≤ 2^{2ϱ}`, `1000(2ϱ + 2)⁹ ≤ k ≤ f`, `10¹⁰n⁴ ≤ n⁶`, `3n⁶ + 12 ≤ n⁷ ≤ k`;
- an open compact subgroup `K_X` of `U(X₀)(𝔸_f)`, `X₀ = 𝒪_E^κ` standard, that is free: it meets every conjugate of the
  rational points trivially;
- a Bessel system `𝔅_v` with parameters `(b, f)` at each infinite place `v` (3.3).

The group `G` is the unitary group of `ϱ` hyperbolic planes `⊕ X₀ ⊕ Ez`, `h(z, z) = −N`, over any ring with involution;
over `𝔸_f` it is written in the *lattice basis*, in which `x_{k₀}` is replaced by `x_{k₀}/π̄ + z/N`. `K ⊂ G(𝔸_f)` is the
subgroup of integral invertible matrices, `red : K → Ḡ = ∏_{i, w} GL_r(𝔽_w)` reduction at the chosen places,
`K(M) = ker red`, and for a subgroup `A`, `Ā` is the image of `A ∩ K`; `R̄₀`, `Ū`, `H̄` are those of `R`, `𝖴`, `H`.
`ι : U(X₀)(𝔸_f) → G(𝔸_f)` is the inclusion. `κ_v = M·v(ϖ)/(2πi)` (real), and at `v` the basis is rescaled by
`κ_v^{ϱ−a+1}/√N` on `e_a` for `a = 1, …, ϱ`, `1` on `X₀`, `1/√N` on `z` and the inverse of the scale of `e_a` on
`e*_a`, which carries `G(E_v)` to `G₁`; in the numbering `f₀, …, f_ϱ` of the frame (3.1), where `f_i = e_{i+1}` for
`i < ϱ` and `f_ϱ = z`, the scale of `f_i` is `κ_v^{ϱ−i}/√N`, as in the factor `Λ` of 4.2; `γ ↦ γ_∞`
is the resulting map from `G(E)` to `G_∞ = ∏_v G₁`. The *frame products* of `γ ∈ G(E)` are `Z(γ) = (h(f_a, γf_b))`, and
`𝗀(γ) = 𝗀_N(Z(γ))`.

`𝔉` is *admissible* if: `K_X = ι⁻¹(K(M))`; `red` is onto; `|v(ϖ)| ≤ b` and `1 ≤ |κ_v| ≤ b²³` for all `v`;
`N ≤ b^{60n}`; `b^{11kf}·𝒟_id ≤ 𝒟_main ≤ (M/b⁶)^{kf}·𝒟_id`; the tensor product of the `𝔅_v` has at most `b^{2kf}`
coordinates; the index of `ι⁻¹(K)` in the stabiliser of the standard lattice of `X₀` is at least `(N^k/b)^f`; and

`#R̄₀·#Ū·#Classes·c_S ≤ (1 + b⁻⁹)·𝒟_main·deg·c_G^f·vol(Ô)^{−n}·(νΛ/#Coord)²`,

with `#Ū = M^{fϱ(2k+2ϱ+1)}`, `c_S = (π^k/((k − 1)!N^k))^f·|disc E|^{1/4}·vol(Ô)^k`, and `ν`, `Λ`, `𝒟_main`, `𝒟_id`, `deg`,
`#Coord` as in 4.2.

*Needs:* 3.1, 3.3.

[ShortProof], `New/Spanning/Unfolding/Setup.lean` (`New.Filling`, `New.Filling.IsAdmissible`, `New.Filling.G`,
`New.Filling.GFin`, `New.Filling.latticeStabilizer`, `New.Filling.reduction`, `New.Filling.principalLevel`,
`New.Filling.reducedImage`, `New.Filling.realM`, `New.Filling.basisScale`, `New.Filling.ratToInf`,
`New.Filling.termDisc`, `New.Filling.siegelConst`)

### 4.2 Terms, cutoffs, amplitudes and second moments

*Origin:* definitions and conventions.

Let `𝔉` be filling data.

- *Classes* are the double cosets `U(X₀)(E⁺)\U(X₀)(𝔸_f)/K_X` (finitely many); `h_c = ι(c̃)` for a chosen representative
  `c̃` of `c`. A rational `γ ∈ G(E)` is a *term over* `(c, s, c′)`, `s ∈ Ḡ`, if `h_c⁻¹γh_{c′} ∈ K` with reduction `s`.
- `𝖴_c(M)` is the group of rational `u ∈ 𝖴` with `h_c⁻¹uh_c ∈ K(M)`, `𝖴⁰_c(M) = 𝖴_c(M) ∩ 𝖴⁰`; their images in `G_∞` are
  discrete.
- A *residue domain* is a measurable set `𝒟` of tuples `(w_v) ∈ ℂ^Φ`, all entries of modulus at most `b²⁶`, containing
  exactly one translate of each tuple by the diagonal image of `M𝒪_E`. A point `y ∈ G_∞` is *reduced* if the entries
  above the diagonal of the Gram–Schmidt matrices of the frames of the `y_v` (3.2), rescaled to the rational frame, lie in
  `𝒟`; `y` is *boxed* if it is reduced and in the cut at every place. The cutoff `β_c = β⁰_c·1_reduced`, where `β⁰_c ≥ 0` is
  measurable with `∑_{u ∈ 𝖴⁰_c(M)} β⁰_c(u_∞y) = 1` for all `y`.
- `W_i(y) = ∏_v W_{v, i_v}(y_v)` for `i ∈ Coord = ∏_v I_v`, and `W♭` likewise; `deg = ∏_v deg_v`;
  `D_X = #Classes·#Coord`.
- The *amplitude* of `γ` over `(c, c′)` is `∫_{G_∞} β_c(y)β_{c′}(γ_∞⁻¹y)·W(y) ⊗ W(γ_∞⁻¹y)^* dy` (or with `W♭`); for a set
  `T` of rational elements, `A_T(c, s, c′)` is the sum of the amplitudes of the terms in `T` over `(c, s, c′)`;
  `A = A_{G(E)}`.
- The *unipotent covolume* is `ν = (M^{2d+ϱ}/N^k)^f·vol(Ô)^{−d}·|disc E|^{ϱ/4}/Λ` with `d = ϱ(ϱ + k)` and
  `Λ = ∏_v ∏_{a=0}^{ϱ}(κ_v^{2(ϱ−a)}/N)^{k+2(ϱ−a)}`.
- `𝒟_main = D_X²/(deg·mass_r)`, `𝒟_id = #R̄₀·D_X`. For blocks `A(c, s, c′)` and `Ω ⊆ Ḡ`, the *second moment* is
  `𝔼(A, Ω) = ν⁻²·∑_{c, c′}∑_{s ∈ Ω}‖A(c, s, c′)‖²`.
- `ψ_M(u) = ψ_f(−σ(u)/(Mϖ))` for `u ∈ G(𝔸_f)`, `ψ_f` the standard character of `𝔸_f`. `s ∈ Ḡ` *agrees* if integral
  `u, u′ ∈ 𝖴(𝔸_f)` with `ū s = s ū′` have `ψ_M(u) = ψ_M(u′)`; a rational `γ` *agrees* if `ψ_M(u) = ψ_M(γ⁻¹uγ)` for every
  rational `u ∈ 𝖴 ∩ γ𝖴γ⁻¹`. A set `T` is *stable* if `u⁻¹γu′ ∈ T ⟺ γ ∈ T` for all rational `u, u′ ∈ 𝖴`.
- The *link* of `γ` is the space of pairs (class of `t`, class of `γ⁻¹t`) in `(X₀ ⊕ Ez)²` for `t` orthogonal to
  `⟨e₁, …, e_ϱ⟩` and its image under `γ`.

*Needs:* 3.1, 3.2, 3.3, 4.1.

[ShortProof], `New/Spanning/Unfolding/Setup.lean` (`New.Filling.Classes`, `New.Filling.termsOver`,
`New.Filling.classUnipotent`, `New.Filling.classUnipotent₀`, `New.Filling.IsResidueDomain`, `New.Filling.classCutoff`,
`New.Filling.besselFn`, `New.Filling.amplitude`, `New.Filling.amplitudeSum`, `New.Filling.unipotentCovolume`,
`New.Filling.mainSecondMoment`, `New.Filling.identitySecondMoment`, `New.Filling.unipotentChar`, `New.Filling.Agrees`,
`New.Filling.IsStable`, `New.Filling.reducedPoints`); `New/Spanning/Unfolding/Terms.lean` (`New.Filling.CharsAgree`);
`New/Spanning/Bessel/Basic.lean` (`New.link`); `New/Spanning/RemainingTerms/Box.lean` (`New.Filling.boxedPoints`);
`New/Spanning/RemainingTerms/Size.lean` (`New.Filling.secondMoment`)

### 4.3 Bessel level structure: Eichler maps and strong approximation for `𝖴`

*Origin:* adapted from the classical theory of strong approximation for unipotent groups and of Eichler transformations:
here, for the Bessel unipotent group with the level `K(M)` at the class representatives, and the comparison of its
character at the infinite and at the finite places.

*Method of the formal proof:* Eichler maps along `x = Σ j_b f_b` and `v ⊥ f_b (b < a)` are block unitriangular, and their
`σ` is read off; the Eichler maps generate `𝖴` over a field, which gives density of `𝖴(E)` in `𝖴(𝔸_f)`. The product formula
for `ψ_f` compares `exp(σ − σ̄)` at the infinite places with `ψ_M` at an integral point of the same reduction.

(a) Over a ring with an element `τ` with `τ + τ̄ = 1`, for an invertible hermitian middle block, `x = r·Σ_{b<a} j_b f_b` and
`v` orthogonal to `f_b` for `b < a`, the Eichler map `y ↦ y + h(v, y)x − h(x, y)(v + τh(v, v)x)` lies in `𝖴`, and its `σ`
is `r·Σ_b h(v, f_b)j_{b−1}`.

(b) `𝖴(𝔸_f)` lies in the closure of the image of `𝖴(E)`; for `x ∈ 𝖴(𝔸_f)` and `y ∈ G(𝔸_f)` there is rational `u ∈ 𝖴` with
`y⁻¹x⁻¹uy ∈ K(M)`.

(c) If `γ ∈ 𝖴` is rational and a term over `(c, red k, c)` for an integral `k ∈ 𝖴(𝔸_f)`, then
`∏_v exp(σ(γ_v) − σ̄(γ_v)) = ψ̄_M(k)`.

(d) If `𝔉` is admissible: `s ∈ Ū` if and only if some rational `γ ∈ 𝖴` is a term over `(c, s, c)`; and for `s ∈ R̄₀` and
every class `c` there are a class `d` and a rational `γ ∈ R` that is a term over `(c, s, d)`.

*Needs:* 4.1, 4.2

[ShortProof], `New/Spanning/Unfolding/BesselLevelStructure.lean` (`New.exists_mem_besselU_eq_eichlerMap`,
`New.besselU_dense`, `New.Filling.exists_besselU_approx`, `New.Filling.prod_wave_eq_star_unipotentChar`,
`New.Filling.mem_reducedImage_besselU_iff_exists_termsOver`, `New.Filling.exists_besselS_mem_termsOver`)

### 4.4 Near terms: frames, cell ranks, nearness and integrality

*Origin:* particular to this proof: the sorting of rational terms by the flags shared by the frame and its image, and
size and integrality bounds for the frame products of near terms.

*Method of the formal proof:* a norm identity writes each conjugate of `𝗀(γ)` as a squared norm; the frame products of a
near term are bounded through the frame boxes of `y` and `γ⁻¹y`, and they are integral because `h_c⁻¹γh_{c′}` is.

A pair `(μ, μ′)` *occurs at* `a` for `γ` if `f x = γf y` for coefficient vectors vanishing above `a` with `x_a = μ`,
`y_a = μ′`. `γ` has *cell rank* `j ≤ ϱ + 1` if some `μ` with `μμ̄ = 1` has `(μ, 1)` occurring at every `a ≥ j`, the leading
minor `D_j(Z(γ))` is nonzero, and `j = ϱ + 1` exactly when `𝗀(γ) ≠ 0`. `γ` is *near* if some boxed `y` has `γ_∞⁻¹y` boxed.

(a) Either `v(𝗀(γ)) > 0` for every `v ∈ Φ` and `det Z(γ) ≠ 0`, or `𝗀(γ) = 0`; if `𝗀(γ) ≠ 0` then `γ` has cell rank
`ϱ + 1`.

(b) If `𝔉` is admissible and `γ` is near, then `|v(Z(γ)_{ab})| ≤ b^{134n}` and `|v(D_l(Z(γ)))|² ≤ b^{270n²}` for all `v`, `a`,
`b`, `l`.

(c) If `γ` is a term over some `(c, s, c′)`, the entries of `Z(γ)` are algebraic integers.

*Needs:* 4.1, 4.2

[ShortProof], `New/Spanning/Unfolding/Terms.lean` (`New.Filling.HasCellRank`, `New.Filling.IsNear`,
`New.Filling.map_termDisc_eq_norm`, `New.Filling.termDisc_pos_or_eq_zero`, `New.Filling.hasCellRank_last`,
`New.Filling.IsNear.norm_frameProducts_le`, `New.Filling.IsNear.norm_map_leadingMinor_sq_le`,
`New.Filling.isIntegral_frameProducts`)

### 4.5 Links of isometries

*Origin:* particular to this proof: the link of a term as the graph of an isometry of the positive space, its invariance
under the unipotent group, and the criterion for `𝗀(γ) = 0`.

*Method of the formal proof:* linear algebra of the hyperbolic planes: `u ∈ 𝖴` acts trivially on `A^⊥/A`; after exchanging
the `z`-coordinates the link is isotropic for the positive form, hence a graph; `𝗀` is up to sign a Gram determinant
(3.2 (d)).

(a) For `u, u′ ∈ 𝖴` (over any commutative ring with involution, for `𝗀_N`), the link of `u⁻¹γu′` and `𝗀_N(Z(u⁻¹γu′))` are
those of `γ`; for each `j` the set of terms of cell rank `j` is stable.

(b) Let `X₀ ⊥ Ez⁺` be the positive space with `h(z⁺, z⁺) = N`. After exchanging the `z`-coordinates of the two members of
each pair, the link of `γ` is the graph of an isometry `Υ_γ` of `X₀ ⊥ Ez⁺`; `Υ_γ` is unchanged under `γ ↦ u⁻¹γu′`.

(c) `𝗀(γ) = 0` if and only if the spans of `f` and of `γf` meet in a nonzero vector.

*Needs:* 3.2, 4.1, 4.2, 4.4

[ShortProof], `New/Spanning/Unfolding/Link.lean` (`New.Filling.link_inv_mul_mul_of_mem_besselU`,
`New.Filling.isStable_hasCellRank`, `New.Filling.linkIsometry`, `New.Filling.mem_link_iff_linkIsometry`,
`New.Filling.linkIsometry_inv_mul_mul_of_mem_besselU`, `New.Filling.termDisc_eq_zero_iff`)

### 4.6 Reduced points and colouring

*Origin:* particular to this proof: explicit elements of `𝖴_c(M)` by Eichler's formula, and a partition of unity on `G_∞`
for `𝖴_c(M)` modulo `𝖴⁰_c(M)` given by the reduced points.

*Method of the formal proof:* Eichler elements with one prescribed row move the above-diagonal Gram–Schmidt entries by
arbitrary multiples of `M`, one entry at a time from the top, so exactly one coset reaches the residue domain.

Let `E` contain a primitive root of unity of order `5040`.

(a) For a class `c`, `a < ϱ`, a row vector `l` that vanishes at `e_b` and `e*_b` for `b ≤ a` and is integral on the
lattice of `c`, and `s ∈ 𝒪_E` with `s̄ = −s`, some `γ ∈ 𝖴_c(M)` has, in `γ − 1` and outside the column `e*_a`, the row
`Ml` at `e_a` and zero rows at the other `e_b`; if `l = 0` the only possibly nonzero entry of these rows is `Ms` at
`(e_a, e*_a)`.

(b) If `A` is coloured with at most `N₀` colours so that elements of one colour are related, and every set of pairwise
related elements has weight at most `t`, then `A` has weight at most `N₀t`; with residue classes modulo a subgroup of
index `j` of vectors with `#ι` entries as colours, the bound is `j^{#ι}·t`.

(c) For a residue domain, every class `c` and every `y ∈ G_∞`, the `u ∈ 𝖴_c(M)` with `u_∞y` reduced form exactly one
right coset of `𝖴⁰_c(M)`.

(d) If `𝔉` is admissible, the indicator `ω` of the reduced points is a partition of unity in boxes for every `c`: it is
measurable, at most `1`, left invariant under `R⁰` at each place, nonzero only where `y_v ∈ B(b²⁷ℓ(y_v))` at every place,
and `∑_{u ∈ 𝖴_c(M)} a(u)ω(u_∞y) = 1` for every weight `a` on `𝖴_c(M)` whose sums over the right cosets of `𝖴⁰_c(M)` are `1`.

*Needs:* 3.2, 4.1, 4.2, 4.3

[ShortProof], `New/Spanning/Unfolding/ReducedPoints.lean` (`New.Filling.exists_eichler_classUnipotent`,
`New.Filling.tsum_le_of_encard_range_le`, `New.Filling.tsum_le_relIndex_pow_mul`,
`New.Filling.IsResidueDomain.exists_mul_mem_reducedPoints_iff_rightCoset`,
`New.Filling.IsResidueDomain.isBoxPartitionOfUnity`)

### 4.7 Counting frames in boxes

*Origin:* particular to this proof: rigidity and packing bounds for the images of the frame under terms whose translates
of a point lie in boxes.

*Method of the formal proof:* the frame vectors of the points `γ_∞⁻¹y` lie in a ball and two different images of the frame
give frame vectors that are far apart at some place, because the difference of two terms is integral up to `N`; a volume
count in the real subspace `V` concludes.

Let `𝔉` be admissible, `R₀ ≥ 1`, `ρ = b^{37n}R₀`.

(a) If `g` is a term, and `y ∈ G_∞` has `ℓ(y_v) ≤ b^{6n+2}R₀`, `y_v ∈ B(ρ)` and `‖(g_∞⁻¹y)_v⁻¹f_a − y_v⁻¹f_a‖ < (Nρ)⁻¹` at
every `v` and `a`, then `gf = f`.

(b) Let `A` be a set of terms over `(c, ·, ·)` such that for `γ ∈ A` the point `γ_∞⁻¹y` has Bessel length at most
`b^{6n+2}R₀` and lies in `B(ρ)` at every place, and the frame vectors of any two of these points differ by an element of a
real subspace `V`. Then the images `γf`, `γ ∈ A`, take at most `(b^{6n²}R₀²)^{dim V}` values.

(c) If weights `w_p ≥ 0` on terms `γ_p` over `(c, s, k_p)` (with `p ↦ (k_p, γ_p)` injective) satisfy the hypotheses of (b)
on their support and `w_p ≤ t·β_{k_p}(γ_{p,∞}⁻¹y)`, then `∑_p w_p ≤ (b^{6n²}R₀²)^{dim V}·t`.

*Needs:* 3.2, 4.1, 4.2, 4.4

[ShortProof], `New/Spanning/Unfolding/Packing.lean` (`New.Filling.frameImage_eq_frameImage_one_of_close`,
`New.Filling.encard_image_frameImage_le`, `New.Filling.tsum_le_of_le_classCutoff_mul`)

### 4.8 The integral of a class cutoff over the real unipotent group

*Origin:* adapted from the classical computation of covolumes of lattices in Heisenberg groups: here, the integral of
the cutoff `β_c` over `𝖴_∞ = ∏_v 𝖴` for a fixed product Haar measure, independent of the class.

*Method of the formal proof:* the group is unfolded one row of coordinates at a time; the integral becomes a product of
covolumes of explicit lattices in `ℂ`-vector spaces, computed from the different, `M`, `N` and the scales of the frame.

Let `E` contain a primitive root of unity of order `5040` and `𝔉` be admissible.

(a) For every class `c` and `y ∈ G_∞`, `∫_{𝖴_∞} β_c(u y) du = ν`.

(b) The Bessel kernel `y ↦ W(y) ⊗ W(γ_∞⁻¹y)^*` is continuous, and the norm of an amplitude is at most the integral of the
norm of its integrand.

*Needs:* 4.1, 4.2, 4.6; ShortGRH background (the coordinates of the free entries carry the Haar measure of `𝖴`, and of `𝖴⁰`, to Lebesgue
measure; [ShortProof] `Lib/DiscreteSeries/Bessel/UnipotentHaarMeasure.lean`
(`New.RealPlace.measurePreserving_freeEntries_besselHaar`, `New.RealPlace.measurePreserving_freeEntries_besselHaar₀`))

[ShortProof], `New/Spanning/Unfolding/CutoffIntegral.lean` (`New.Filling.lintegral_classCutoff_eq_unipotentCovolume`,
`New.Filling.continuous_besselKernel`, `New.Filling.enorm_amplitude_le`)

### 4.9 Sums of amplitudes over blocks

*Origin:* adapted from the unfolding of Poincaré series and the geometric side of a relative trace formula (Petersson
(1930); Jacquet (1986), §§1, 7, 9): here, for the blocks `A_T(c, s, c′)` of a stable set of terms: convergence, change of
weight, behaviour under the Bessel subgroup, and the identity block.

*Method of the formal proof:* the terms are grouped in orbits of `𝖴_c(M) × 𝖴_{c′}(M)`; on each orbit the cutoffs can be
replaced by any weight with orbit sums one, by unfolding. Moving a block by integral unipotent elements changes it by the
character, through 4.3 (c), so a block at a non-agreeing `s` vanishes. At `s = 1`, the terms in `R` give the identity
through the orthonormality of 3.11 and the covolume 4.8.

Let `E` contain a primitive root of unity of order `5040`, `𝔉` be admissible and `T` stable.

(a) There is `C < ∞` with `∑_d ∑_{γ ∈ T, term over (c, s, d)} β_d(γ_∞⁻¹y)·∏_v‖W_v((γ_∞⁻¹y)_v)‖ ≤ C` for all `y`; the
amplitude sums converge absolutely; and
`∑_d ∑_γ ∫ β_c(y)β_d(γ_∞⁻¹y)‖W(y) ⊗ W(γ_∞⁻¹y)^* − W♭(y) ⊗ W♭(γ_∞⁻¹y)^*‖ dy ≤ ν·b^{−k³f}/2`.

(b) If `φ_γ ≥ 0` is measurable with `∑_{(u, u′) ∈ 𝖴_c(M) × 𝖴_{c′}(M)} φ_{uγu′⁻¹}(u_∞y) = 1` for every term `γ ∈ T` over
`(c, s, c′)` and all `y`, then `A_T(c, s, c′) = ∑_γ ∫ φ_γ(y)·W(y) ⊗ W(γ_∞⁻¹y)^* dy`, with the same error bound for the cut.

(c) For integral `u, u′ ∈ 𝖴(𝔸_f)`, `A_T(c, ū s ū′⁻¹, c′) = ψ_M(u)⁻¹ψ_M(u′)·A_T(c, s, c′)`; hence `A_T(c, s, c′) = 0` if `s`
does not agree.

(d) For the full function, the block of the rational points of `R` at `s = 1` is `ν·δ_{cc′}δ_{ij}` at the coordinates
`(i, j)`.

*Needs:* 3.11, 4.1, 4.2, 4.3, 4.6, 4.7, 4.8

[ShortProof], `New/Spanning/Unfolding/AmplitudeSums.lean` (`New.Filling.exists_tsum_classCutoff_mul_prod_enorm_le`,
`New.Filling.tsum_amplitudeMajorant_lt_top`, `New.Filling.tsum_lintegral_enorm_besselKernel_sub_cut_le`,
`New.Filling.hasSum_amplitudeSum_of_cutoff`, `New.Filling.amplitudeSum_besselU_mul`,
`New.Filling.amplitudeSum_eq_zero_of_not_agrees`, `New.Filling.amplitudeSum_besselS_one_eq_ite`)

### 4.10 Which terms contribute

*Origin:* adapted from the unfolding of Poincaré series and the geometric side of a relative trace formula (Petersson
(1930); Jacquet (1986), §§1, 7, 9): here, the vanishing of the blocks of terms whose unipotent characters do not agree,
the structure of agreeing terms through vectors common to the two flags, and a bound for the places above `M` where
the two flags meet.

*Method of the formal proof:* elementary linear algebra moves a common vector of the two flags up the flags; agreement of
the characters forces its leading coefficients to have equal norms at every higher index. Modulo a place above `M` where
the spans meet, the same argument over the residue field produces a pair at the top index; a determinant of products
with two integral vectors then bounds the norm of the meeting places.

Let `E` contain a primitive root of unity of order `5040` and `𝔉` be admissible.

(a) If `T` is stable and no `γ ∈ T` agrees, then `A_T(c, s, c′) = 0` for all `c`, `s`, `c′`.

(b) If `γ` agrees and `(μ, μ′)` occurs at `j`, then `μμ̄ = μ′μ̄′` and `(μ, μ′)` occurs at every `l ≥ j`; if `γ` agrees and
`𝗀(γ) = 0`, then `γ` has a cell rank.

(c) For `s ∈ Ḡ` and a chosen place `w` (or its conjugate), `s` *meets* at it if the spans of `f` and `sf` modulo it share a
nonzero vector; `meet(s)` is the norm of the product of these places. Let `k ∈ K` with `red k` agreeing, and `t` an
integral matrix with two columns such that `(f | kf)ᴴt` vanishes outside the two rows of the last frame indices and the
`2 × 2` determinant `δ` there is a finite idele. Then `meet(red k)` is at most the generalised index of `δ`, the inverse
of the factor by which multiplication by `δ` scales Haar measure on `𝔸_f`.

(d) The reduction of `H` lies in the subgroup of `Ḡ` fixing any given frame vectors at the chosen places.

*Needs:* 4.1, 4.2, 4.3, 4.4, 4.5, 4.9

[ShortProof], `New/Spanning/Unfolding/Climbing.lean` (`New.Filling.amplitudeSum_eq_zero_of_not_charsAgree`,
`New.Filling.mul_star_eq_and_pairOccursAt_of_le`, `New.Filling.CharsAgree.exists_hasCellRank`,
`New.Filling.exists_pairOccursInColumnsAt_top_of_meetsAt`, `New.Filling.meetNorm_le_genIndex_det`,
`New.Filling.reducedImage_besselH_le_fixer`)

### 4.11 The finite groups `Ū`, `H̄` and `R̄₀`

*Origin:* particular to this proof: the reductions of the Bessel groups at the chosen places, their orders, and the index
of the source level.

*Method of the formal proof:* reduction is computed place by place; the unipotent group reduces to the block unitriangular
matrices, counted by free entries; `H` reduces to `GL_k(𝔽_w)` at each place because the chosen places split.

(a) `s ∈ Ū` if and only if every component `s_w` is block unitriangular for the levels of the basis, and
`#Ū = M^{fϱ(2k+2ϱ+1)}`.

(b) `R̄₀` is the product of its projections to the chosen places, every element of `R̄₀` is a product `uh` with `u ∈ Ū`
and `h ∈ H̄`, and `#R̄₀ = #H̄·#Ū`.

(c) `H̄ ≅ ∏_w GL_k(𝔽_w)` compatibly with reduction; if `𝔉` is admissible, `K_X` has index `#H̄` in `ι⁻¹(K)`.

*Needs:* 4.1, 4.2

[ShortProof], `New/Spanning/Unfolding/ReducedGroups.lean` (`New.Filling.mem_reducedImage_besselU`,
`New.Filling.card_reducedImage_besselU`, `New.Filling.mem_reducedImage_besselS_iff_forall_place`,
`New.Filling.mem_reducedImage_besselS`,
`New.Filling.exists_mulEquiv_reducedImage_besselH`, `New.Filling.relIndex_sourceLevel`,
`New.Filling.card_reducedImage_besselS`)

### 4.12 The structure of a term and the remaining terms

*Origin:* particular to this proof: the decomposition of the span of the two frames of an agreeing term with `𝗀(γ) = 0`,
and the set `Γ*` of the terms left for the estimate of the second moment.

*Method of the formal proof:* `A⁺ + γA⁺` (with `A = ⟨e₁, …, e_ϱ⟩`, `A⁺ = A + Ez`) is analysed through its radical; modulo
`I_γ = A ∩ γA` its orthogonal complement is isometric to `X₀ ∩ Υ_γ⁻¹X₀`; agreement and `𝗀(γ) = 0` force `Υ_γ X₀ = X₀`, and
then `A = A_{≤j} ⊕ I_γ` with `j = ϱ − dim I_γ`.

Let `E` contain a primitive root of unity of order `5040`.

Let `X₀^γ` be the space of the `x ∈ X₀` with `Υ_γx ∈ X₀`.

(a) The map `y ↦ y₀` (the coordinates in `X₀`) from the orthogonal complement of `A⁺ + γA⁺` to `X₀` carries the form of
`G` to the standard product of `X₀`, has kernel `A ∩ γA` and image `X₀^γ`.

(b) If `𝗀(γ) ≠ 0`, then `A⁺ ∩ γA⁺ = 0` and `dim X₀^γ = k − 1`.

(c) If `γ` agrees and `𝗀(γ) = 0`, then `Υ_γX₀ = X₀`, and `γ` has cell rank `j` where `j + dim(A ∩ γA) = ϱ`.

(d) For `u, u′ ∈ 𝖴`, `A ∩ (uγu′)A = u(A ∩ γA)`, and `uγu′` agrees if and only if `γ` does.

`Γ*` is the set of rational `γ` with `𝗀(γ) ≠ 0`, or with `γ` agreeing, `𝗀(γ) = 0` and `γA ≠ A`.

*Needs:* 4.2, 4.4, 4.5, 4.10

[ShortProof], `New/Spanning/Unfolding/TermStructure.lean` (`New.Filling.range_framePerpToX₀`,
`New.Filling.form_framePerpToX₀`, `New.Filling.ker_framePerpToX₀`, `New.Filling.disjoint_colSpan_frameImage`,
`New.Filling.finrank_linkedX₀_add_one`, `New.Filling.CharsAgree.linkedX₀_eq_top`, `New.Filling.CharsAgree.hasCellRank_of_add_finrank_eq`,
`New.Filling.commonIsotropic_besselU_mul`, `New.Filling.charsAgree_mul_mul_iff_of_mem_besselU`,
`New.Filling.remainingTerms`)

### 4.13 The expansion of the squares and the second moment near the Bessel subgroup

*Origin:* particular to this proof: the second moment, over the elements of `Ḡ` that coincide with an element of `R̄₀`
above one level prime, of the terms outside the Bessel subgroup.

*Method of the formal proof:* a term off `R` over a block avoiding the scalar cosets `ζR̄₀` (`ζ` a root of unity of `E`,
`ζ ≠ 1`) has no norm-one pair from index `0`; the blocks then split into those of degenerate terms, which vanish or are
bounded through the cell ranks, and those of terms with `𝗀 ≠ 0`, sorted by links; the triangle inequality in `ℓ²` gives the
expansion. Above `p_{i+1}` the element coincides with `R̄₀`, which forces meeting places of norm at least about `M/b`, and
the bound of the remaining terms over meeting places applies.

Let `E` contain a primitive root of unity of order `5040` and `𝔉` be admissible.

(a) Let `Ω ⊆ Ḡ` avoid the cosets `ζR̄₀` for every integral `ζ ∈ E`, `ζζ̄ = 1`, `ζ ≠ 1`. Write `A♭_T` for the amplitude sums
of the cut function `W♭`. If the sum over `c, c′`, `s ∈ Ω` and links `Λ` of `‖A♭_{T_Λ}(c, s, c′)‖²`, `T_Λ` the terms with
`𝗀 ≠ 0` and link `Λ`, is at most `Cν²` with `C ≥ 0`, then
`𝔼(A_{G(E)∖R}, Ω)^{1/2} ≤ C^{1/2} + b⁻¹⁵·𝒟_id^{1/2}`.

(b) For `i ∈ {0, 1}` and `Ω_i` the set of `s` whose components above `p_i` are those of an element of `R̄₀`:
`𝔼(A_{G(E)∖R}, Ω_i) ≤ b⁻¹²·𝒟_id`.

*Needs:* 4.2, 4.4, 4.5, 4.9, 4.10, 4.11, 4.12; RemainingAndMainTermsOfSecondMoments §5.5 (c) (the bound for the remaining
terms `Γ*`, given a bound for the link second moment of the terms with `𝗀 ≠ 0`), §5.5 (d) (the bound of that link second
moment over reductions meeting at places of large norm), §3.6 (b) (passing from the Bessel function to its cut changes
the second moment of any set of terms by at most `b⁻⁴⁰·𝒟_id`)

[ShortProof], `New/Spanning/Unfolding/SquareExpansion.lean` (`New.Filling.AvoidsScalarCosets`,
`New.Filling.sqrt_secondMoment_compl_besselS_le`, `New.Filling.secondMoment_compl_besselS_le`)

### 4.14 The second moment over the whole group

*Origin:* particular to this proof: if `s ↦ 𝔼(A, {s})` has positive type and `𝔼(A, {1}) ≤ 2D_X`, then its sum over `Ḡ` is
at most `(1 + 9b⁻⁴)𝒟_main`.

*Method of the formal proof:* the scalar cosets of `R̄₀` contribute at most `2M^f𝒟_id`, small by the standing hypotheses.
For the other elements, fix nonzero frame vectors at the chosen places above `p₀`; the elements that fix them and are open
(some chosen place where no leading minor of order less than `n` of the frame products vanishes) are bounded by the main
term, and the elements that are not open carry at most a share `b⁻⁴`, by 1.4 applied to the positive-type function and the
leading minors; elements meeting at many places are bounded through the remaining terms.

Let `𝔉` be admissible and let `E` contain a primitive root of unity of order `5040`.

(a) If `𝔼(A, {s}) ≤ 2D_X` for all `s`, the sum of `𝔼(A, {s})` over the `s` in scalar cosets `ζR̄₀` (`ζ` integral) is at
most `2M^f𝒟_id`.

(b) Let `β ≥ 0` have positive type on `Ḡ`, `Γ ⊆ Ḡ` a subgroup, `w` a chosen place above `p₀`, and suppose that for every
nonzero vector of the span of the frame modulo `w` or `w̄` the elements of `Γ` fixing it carry at most a share `b^{−6k}` of
`∑_Γ β`. Then for `l < n` the `s ∈ Γ` with `D_l(Z(s_w)) = 0` carry at most a share `3b⁻¹⁰`, and the `s ∈ Γ` that are not
open carry at most a share `b⁻⁴`.

(c) Suppose that `E` has Weil data (DivisibilityOfThetaDerivatives §1.4 (c); the field of admissible data has them, and
the conclusion does not involve them: they enter through RemainingAndMainTermsOfSecondMoments §8.1). If `u` is a map
from `Ḡ` to an inner product space with `⟨u_a, u_c⟩ = 𝔼(A, {a⁻¹c})` for all `a, c`, and `𝔼(A, {1}) ≤ 2D_X`, then
`∑_{s ∈ Ḡ} 𝔼(A, {s}) ≤ (1 + 9b⁻⁴)·𝒟_main`.

*Needs:* 1.4, 4.2, 4.9, 4.10, 4.11, 4.13; RemainingAndMainTermsOfSecondMoments §8.1 (the main-term bound for the second
moment over open reductions fixing given frame vectors), §5.5 (d) (the bound for the link second moment over reductions
meeting at places of large norm)

[ShortProof], `New/Spanning/Unfolding/MomentBounds.lean` (`New.Filling.sum_secondMoment_inScalarCoset_le`,
`New.Filling.secondMoment_fixer_univ_le`, `New.Filling.secondMoment_fixer_isOpenElement_le`,
`New.Filling.sum_leadingMinor_eq_zero_le`, `New.Filling.sum_not_isOpenElement_le`, `New.Filling.sum_secondMoment_le`)

### 4.15 The second moments of the operators `P* s P`, and good forms

*Origin:* particular to this proof: for any map `P` from the source to a unitary representation of `Ḡ` whose operators
`P* s P` have the amplitude sums as blocks, the second moment of these operators over `Ḡ` is at most `(1 + 9b⁻⁴)𝒟_main`,
`P*P` is close to `1`, and `e₀P` is a near isometry for any product of central idempotents with small bad share.

*Method of the formal proof:* `‖P* s P‖² = 𝔼(A, {s})` by the blocks; this has positive type (1.2), and at `s = 1` the
terms in `R` give the identity (4.9 (d)) and the others are small (4.13), so 4.14 applies. For `e₀`, the coefficient of
`1 − g_i` at `1` is small, and the mean of the unipotent character over conjugacy classes has `ℓ²`-norm at most `2`, so
`‖(1 − e₀)P‖²` is small and 1.2 (b) concludes.

Let `𝔉` be admissible, `ρ` a representation of `Ḡ` on a finite-dimensional inner product space `V`, and
`P : ℂ^{Classes × Coord} → V` linear with the *amplitude blocks*: `⟨ρ(s)Pe_{c′,i′}, Pe_{c,i}⟩ = A(c, s, c′)_{(i,i′)}/ν` for
all `s`, `(c, i)`, `(c′, i′)`. Let `r_ψ(s)` be the operator on the source with the blocks of the terms in `R` in place of
all terms.

(a) If `E` contains a primitive root of unity of order `5040`: `‖P*P − 1‖² ≤ b⁻¹²·D_X`, and for `i ∈ {0, 1}`,
`∑_{s ∈ Ω_i}‖P*ρ(s)P − r_ψ(s)‖² ≤ b⁻¹²·𝒟_id`, with `Ω_i` as in 4.13 (b).

(b) If `E` has Weil data (as in 4.14 (c)) and `ρ` is unitary: `∑_{s ∈ Ḡ}‖P*ρ(s)P‖² ≤ (1 + 9b⁻⁴)·𝒟_main`.

(c) If moreover `g_i` (`i = 0, 1`) is a central idempotent of the group algebra of the factor of `Ḡ` above `p_i` with
`Re (1 − g_i)(1) ≤ b⁻⁸/2`, and `e₀ = g₀ ⊗ g₁`, then `‖(1 − ρ(e₀))P‖² ≤ 4b⁻⁴·D_X` and `ρ(e₀)P` is a near isometry with
error `5b⁻⁴`.

*Needs:* 1.2, 4.2, 4.3, 4.9, 4.11, 4.13, 4.14

[ShortProof], `New/Spanning/Unfolding/Moments.lean` (`New.Filling.HasAmplitudeBlocks`, `New.Filling.besselTranslate`,
`New.Filling.HasAmplitudeBlocks.hilbertSchmidtNorm_sub_one_sq_le`,
`New.Filling.HasAmplitudeBlocks.sum_hilbertSchmidtNorm_sub_besselTranslate_sq_le`,
`New.Filling.HasAmplitudeBlocks.sum_hilbertSchmidtNorm_sq_le`, `New.Filling.sum_norm_reducedCharMean_sq_le`,
`New.Filling.HasAmplitudeBlocks.hilbertSchmidtNorm_one_sub_piTensorElem_comp_sq_le`,
`New.Filling.HasAmplitudeBlocks.isNearIsometry_piTensorElem_comp`)

## Layer 5: The Poincaré map of the data

### 5.1 Poincaré series of a fitting space and their Petersson products

*Origin:* adapted from Poincaré series of integrable functions (Petersson (1930); Godement (1958), §4, Théorèmes 5 and 5
bis; in adelic form, for the trivial subgroup, Muić (2009)): here, the series of the cut-off coordinates of the Bessel
function along a Bessel subgroup, supported on the cosets of the classes, with the Petersson products of their translates
equal to amplitude sums.

*Method of the formal proof:* the series converges absolutely by 4.9 (a); it is a form of the principal level and of the
type of the Bessel systems because the cutoffs add up to one over `𝖴_c(M)`; unfolding the inner product over the classes
and over `G(E)` gives the amplitude sums.

Let `𝔉` be admissible over `E` with a primitive root of unity of order `5040`, and let `V` be a hermitian space of rank `r`
over `E` that *fits* `𝔉` with parameters `(l_v)`, weights `(kw_v)` and a central `η ∈ U(X₀)(𝔸_f)`: its Gram matrix is that
of `G`; the Bessel system at `v` has type `(l_v, kw_v)` (3.14 (a)–(c)); the kernel of the archimedean type is idempotent;
and the finite part of the frame of `V` is a finite idele times `ι(η)` times the lattice basis times an integral matrix
that reduces to `1` at the chosen places. Let `J` be the principal level at the chosen places. For `a = (c, i)` let
`𝒲_a(g) = β_c(y)W_i(y)` (`y` the image of `g_∞` in `G_∞`) if the finite part of `g` lies in `h_c J` (after the
identification), and `0` otherwise; for `φ ∈ ℂ^{Classes × Coord}` put `𝒫φ(g) = ∑_a φ_a ∑_{γ ∈ G(E)} 𝒲_a(γg)`.

(a) `𝒫φ` is a form on `U(V)` of the type `(l_v)` and of level `J`, and `φ ↦ 𝒫φ` is linear.

(b) For `k` in the maximal compact subgroup with reduction `s` at the chosen places,
`⟨k·𝒫e_{c′,i′}, 𝒫e_{c,i}⟩ = vol(J)·A(c, s, c′)_{(i,i′)}`.

(c) The algebraic forms on `U(X₀)` of weight `kw` and level `K_X` have dimension `D_X = #Classes·dim(weight kw) > 0`, and
their values at the class representatives give an isomorphism `φ ↦ (φ_{c,i})` with `ℂ^{Classes × Coord}`.

*Needs:* 3.14, 4.1, 4.2, 4.6, 4.9; AutomorphicFormsOnReductiveGroups §7.5 (forms of a level with trivial stabilisers on the
definite group `U(X₀)`: `S(J, M) ≅ M^h`, which gives (c))

[ShortProof], `New/Spanning/Unfolding/PoincareSeries.lean` (`New.Filling.Fits`, `New.Filling.Fits.poincareSeries`,
`New.Filling.Fits.poincareMap`, `New.Filling.Fits.coe_poincareMap`, `New.Filling.Fits.petersson_poincare`,
`New.Filling.Fits.sourceFormCoords`, `New.Filling.Fits.finrank_levelSpace_eq_sourceDim`)

### 5.2 The Bessel function as an integral over `R(E⁺_∞)`

*Origin:* particular to this proof: the tensor product over the real places of the Bessel functions of 3.14 is one integral
of the kernel of the archimedean type against the character of the real points of the global Bessel group.

*Method of the formal proof:* each local Bessel function is the Bessel average of 3.8 at a point `x_v`; the product of the
local integrals is an integral over the product group, and the points `x_v` are collected into one point `g`.

If `V` fits `𝔉`, there are `g ∈ ∏_v U(diag ε)` and a linear form `t` on the Weyl module of weight `kw` such that for all
`y` and every `ζ` in the Weyl module, the pairing of `ζ` (carried to the dual of the values of `W`) with `W(y)` is

`∫_{R(E⁺_∞)} c̄(g⁻¹sy)·ψ(s)⁻¹·t(ρ̌(a_s)ζ) ds`,

where `c` is the kernel of the archimedean type, `s = u a_s` with `a_s` in the real points of `U(X₀)`, `ρ̌` the action on
the Weyl module by which the source forms transform at infinity, `ψ` the character of the real points of the global Bessel
group given by the entries at the simple roots, and `ds` a Haar measure (its normalisation is absorbed in `t`).

*Needs:* 3.8, 3.14, 5.1

[ShortProof], `New/Spanning/Unfolding/BesselFormula.lean` (`New.Filling.Fits.exists_besselFn_eq_integral`)

### 5.3 The Poincaré map is a Poincaré series of the Bessel function

*Origin:* particular to this proof: at a suitable real point and linear form, the Riesz representative of the Bessel period
of a source form is the Poincaré series of 5.1 with the values of the form at the class representatives as coefficients.

*Method of the formal proof:* the Petersson product of the series with a form `y` of the conjugate type unfolds to a sum,
over the classes, of integrals over `𝖴_c(M)\G(E⁺_∞)`. Writing the Bessel function by 5.2 and exchanging the quotient onto
the Bessel group, the type kernel acts on `y` as the identity, and what is left is a sum over the classes of integrals over
`𝖴_c(M)\R(E⁺_∞)`. The Bessel period decomposes in the same way, since the quotient of `[R]` by `R(𝔸_f) ∩ J` is the
disjoint union of these spaces, so the two agree up to a nonzero constant, which is absorbed in `t`.

(a) Let `E` have Weil data (DivisibilityOfThetaDerivatives §1.4 (c)). If `V` fits `𝔉` and the constant `c_Y` of the
generic character of the Bessel unipotent group of `V` satisfies `ȷ·c_Y = −(Mϖ)⁻¹`, `ȷ` the element of the Weil data (so
that the character of `𝔉` is that of the Bessel period), there are `g₀` and `t` such that for every source form `φ` and every form `y` of the conjugate
type and level `J`, `∫_{[G]} y·𝒫(φ_{c,i}) = ∫_{[R]} 𝒲_φ(r)·y(rg₀) dr`, with `𝒲_φ(uh) = ψ_U(u)·t(h_∞⁻¹·φ(h_f))` built from
the translate of `φ` by `η`.

(b) For the data: there are a real point `g` and a linear form `t` with `𝒫_{g,t} = 𝒫^{fill} ∘ coords`, where `𝒫_{g,t}` is the
Poincaré map of ThetaLiftChainsAndTheSeesawIdentity §2.19 at `(g, t)`, `𝒫^{fill}` the map of 5.1 for the filling data of 5.5, and
`coords` sends a source form to the values of its translate by the central element of the lattice of `X₀` at the class
representatives. The Poincaré map `𝒫` of the data is `𝒫_{g,t}` for such a choice.

*Needs:* 5.1, 5.2, 5.5; ThetaLiftChainsAndTheSeesawIdentity §2.19 (the Poincaré map as the Riesz representative of the
Bessel period); DivisibilityOfThetaDerivatives §1.4 (the Weil data of `E` and its element `ȷ`); ShortGRH background
(moving a quotient from one variable to the other: for a subgroup `R` of `G` with left invariant measures, a countable
group `Λ` mapping to `R` and a weight on `G` whose `Λ`-translates add up to one, `∫_{Λ\G}∫_R F = ∫_{Λ\R}∫_G F` for `F`
on `R × G` measurable, invariant under the diagonal action of `Λ` and integrable; [ShortProof]
`Lib/Adelic/QuotientMeasure/MovingTheQuotient.lean` (`New.integral_cutoff_swap`))

[ShortProof], `New/Spanning/Unfolding/SeriesPeriod.lean` (`New.Filling.Fits.exists_dotProduct_besselFn_eq_integral`,
`New.Filling.Fits.exists_integral_besselMeasure_eq_sum`, `New.Filling.Fits.exists_integral_poincareSeries_eq_period`,
`New.Data.exists_poincareAt_eq_poincareMap_comp`, `New.Data.poincare_eq_poincareMap_comp`)

### 5.4 Masses of spheres and of frames

*Origin:* particular to this proof: the product over the real places of the masses of frames, in terms of the masses of the
genera of standard lattices in ranks `k` and `r`.

*Method of the formal proof:* the approximate formula for the ratio of masses in consecutive ranks, multiplied from `k` to
`r`, and an identity between the explicit constants. The approximate formula is
`|log(mass_{j+1}/mass_j) − f·log(rd_E^{j+1/2}·j!/(2π)^{j+1})| ≤ 2/2^u` for `j ≥ 4u + 12` and `8f ≤ 2^u`. It follows from
the ratio of HermitianFormsAndLattices §6.4 (b): the Euler product over the places of `E⁺` gives
`|log L(s, η^s)| ≤ f·log ζ(s) ≤ 2f/2^s` for `s ≥ 3`, and `2f/2^{j+1} ≤ 2/2^u` under the two conditions. [ShortProof]
proves the approximate formula directly, from the density of the standard lattice.

For `v ∈ Φ` let `sph_l(v) = (2π)^l/(|v(ϖ)|^{l−1/2}(l − 1)!)` and `fr_v = N^k·sph_{k+1}(v)⋯sph_r(v)`. Then

(a) `(∏_v fr_v)·mass_r·(N^k/(N^k − 1))^{2f} ≤ (1 + b⁻⁹)·N^{kf}·mass_k`;

(b) `(∏_v fr_v)·c_G^f·|disc E|^{ϱ/2} = c_S·N^{2kf}·vol(Ô)^{ϱ+1+2ϱ(ϱ+k)}`, with `c_S` of 4.1.

*Needs:* OneSidedPrimeSumBoundsAndAdmissibleData §3.2 (the data: `N`, the ranks, `b`), §3.3 (their sizes);
DivisibilityOfThetaDerivatives §1.1 (b) (the generator `ϖ` of the different, there `δ_E`);
HermitianFormsAndLattices §5.5 (the mass of the genus of the standard lattice `𝒪_E^l`), §6.4 (b) (the ratio of the
masses in consecutive ranks for unimodular lattices, `E/E⁺` unramified at the finite places:
`mass_{j+1}/mass_j = (rd_E^{j+1/2}·j!/(2π)^{j+1})^f·L(j + 1, η^{j+1})`, in the notation there
`|d_F|^{(2n−1)/2}·((n − 1)!/(2π)^n)^d·L(n, η^n)` with `n = j + 1`, `d = f` and `|d_F| = rd_E^f`)

[ShortProof], `New/Spanning/Unfolding/FrameMass.lean` (`New.Data.unitSphereMass`, `New.Data.frameMass`,
`New.Data.prod_frameMass_mul_le`, `New.Data.prod_frameMass_mul_openCellConst_eq`);
`Lib/SiegelWeil/OneVector/SiegelClassSum.lean` (`New.abs_log_mass_ratio_sub_le`, the approximate formula)

### 5.5 Filling data of the data

*Origin:* particular to this proof: the data of the argument give admissible filling data that fit `Y₀`.

*Method of the formal proof:* the fields are read off the data (the level `N`, `π_N`, the level primes and chosen places,
the Bessel systems of 3.14); the standing hypotheses are the size inequalities of the data, the dimension and degree counts,
5.4 and 4.11.

There are filling data `𝔉_D` with the prime `N`, `π = π_N`, the primes `p₀, p₁` with the chosen places, the level
`K_X` of the source forms, `b`, and the Bessel systems of 3.14, such that:

(a) `K_X = ι⁻¹(K(M))`;

(b) `𝔉_D` is admissible, and `Y₀` fits `𝔉_D` with the parameters `l_v`, the weights of the source forms and `η` the inverse
of the central element of the lattice of `X₀`;

(c) `#Coord ≤ b^{2kf}`; `log deg + f·∑_{k−1 ≤ l < r} log l!` lies between `∑_v m(k − 1) log wt(v)` and
`∑_v m·r(log wt(v) + 1/x)`, `wt(v)` the weight of the data at `v`; `b^{11kf} ≤ 𝒟_main/𝒟_id ≤ (M/b⁶)^{kf}`;

(d) `#H̄·#Classes·∏_v fr_v·#I_v²/deg_v ≤ (1 + b⁻⁹)𝒟_main` and
`#H̄²·mass_k·∏_v fr_v·N^k·#I_v²/deg_v ≤ (1 + b⁻⁹)𝒟_main`.

*Needs:* 3.14, 4.1, 4.11, 5.1, 5.4; OneSidedPrimeSumBoundsAndAdmissibleData §3.2 (the data), §3.3 (its size
inequalities); DivisibilityOfThetaDerivatives §1.1 (b) (the generator `ϖ` of the different), §1.5 (the chosen places);
ThetaLiftChainsAndTheSeesawIdentity §2.1 (`X₀`, `Y₀` and its lattice), §2.4 (the parameters `l_v`), §2.6 (the level
`K_X`, there `K_0`), §2.8 (the source forms and their weight)

[ShortProof], `New/Spanning/Bessel/FillingData.lean` (`New.Data.filling`, `New.Data.levelX_zero_eq_comap`);
`New/Spanning/Unfolding/FillingAdmissible.lean` (`New.Data.filling_fits`, `New.Data.card_besselCoord_le_pow`,
`New.Data.log_filling_besselDegree_mem_Icc`, `New.Data.mainSecondMoment_div_identitySecondMoment_mem_Icc`,
`New.Data.card_mul_prod_frameMass_le`)

### 5.6 The dimension of the target

*Origin:* particular to this proof: an upper bound for the dimension of the good forms on `Y₀` by an exact count on the
definite space `W_m`, where the level is free.

*Method of the formal proof:* by 2.3 (b) the target has the dimension of the good forms on `W_m`, which are among the forms
of principal level there; on the definite space these are algebraic forms of a free level, whose dimension is the class
number times the dimension of the weight, and the class sum of the principal level is `#Ḡ·mass_r`.

`d_T ≤ #Ḡ·deg·mass_r`, with `deg = ∏_v deg_v` the product of the degrees of the Bessel systems of 5.5 (the formal degrees
of the `λ_v`). More precisely, the principal forms on `W_m` have dimension `#Ḡ·mass_r·∏_v d(λ_v)`, `d(λ_v)` the dimension
of the representation of the compact group with that parameter.

*Needs:* 2.3, 5.5; 3.14 (a) (the degrees `deg_v` are the values of Weyl's dimension polynomial); AutomorphicFormsOnReductiveGroups §7.5
(forms of a level with trivial stabilisers: `S(J, M) ≅ M^h`); DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5a
(`mass J′ = [J : J′]·mass J`, so that the principal level, whose stabilisers are trivial, has `#Ḡ·mass_r` classes);
HermitianFormsAndLattices §5.5 (the mass of the genus of `𝒪_E^r`); ShortGRH background (for the compact group `U(n)`
and a parameter `l = 2λ` with distinct entries of the parity of `n − 1`, with `Λ = λ − ρ`: the integral over `U(n)`,
for the Haar measure of mass one, of the squared modulus of the coefficient of a highest vector of weight `Λ` is the
inverse of the value at `l` of Weyl's dimension polynomial, and it is the inverse of the formal degree `deg(λ)`; and
for a weight whose doubled Harish-Chandra parameter at the place `v` is `l_v`, the product over `v` of the formal
degrees `deg(λ_v)` on the compact groups is the dimension of the representation of that weight; [ShortProof]
`Lib/DiscreteSeries/Character/WeylCharacterFormula.lean` (`New.weyl_dimension_formula`),
`Lib/DiscreteSeries/Character/FormalDegree.lean` (`New.Orbital.formalDegree_eq_weylDimensionPoly`),
`Lib/Adelic/AutomorphicForms/SmoothAlgebraicForms.lean` (`New.IsHCParam.prod_formalDegree`))

[ShortProof], `New/Spanning/SecondMoment/SpanningTheorem.lean` (`New.Data.finrank_principalForms_spaceW`,
`New.Data.targetDim_le_card_mul_besselDegree_mul_mass`)

### 5.7 The second moment of the Poincaré map and one good translate

*Origin:* particular to this proof: the scaled Poincaré map of the data has the amplitude blocks, so its second moment over
`Ḡ` and the near isometry of `e₀P` hold, and for every space of target forms some translate `#Ḡ·e₀ s 𝒫` has a small preimage.

*Method of the formal proof:* 5.3 and 5.1 (b) give the amplitude blocks after scaling; `e₀` is the tensor product of the
two central idempotents of the good families above each level prime, whose bad shares are bounded by the count of
non-allowed and non-primitive labels; 4.15 gives the two hypotheses of 1.2 (c), with 5.6 for the dimension of the target.

Let `P = (vol(J_M)·ν)^{−1/2}·𝒫 ∘ coords⁻¹`, for the filling data of 5.5 and `coords` of 5.3.

(a) `P` has the amplitude blocks of 4.15 for the action of `Ḡ` on the principal forms of `Y₀`.

(b) `e₀ = g₀ ⊗ g₁` with `g_i` the sum of the label idempotents of the good tuples above `p_i`; each `g_i` is a central
idempotent with `Re (1 − g_i)(1) ≤ b⁻⁸/2`.

(c) `e₀P` is a near isometry with error `5b⁻⁴`; `∑_{s ∈ Ḡ}‖P* s P‖² ≤ (1 + 9b⁻⁴)·D_X²/(deg·mass_r)`; and
`d_T·∑_{s ∈ Ḡ}‖P* s P‖² ≤ #Ḡ·(1 + 9b⁻⁴)·D_X²`. In particular `d_T > 0`.

(d) The maps `#Ḡ·e₀ s 𝒫` from the source forms to the target forms, `s ∈ Ḡ`, spread with error `3/(16b²)`: for every space
`F` of target forms with `dim F = α·d_T`, some `s ∈ Ḡ` has `dim (#Ḡ·e₀ s 𝒫)⁻¹(F) ≤ ((1 + α)/2 + 3/(16b²))·D_X`.

*Needs:* 1.2, 4.15, 5.1, 5.3, 5.5, 5.6; ThetaLiftChainsAndTheSeesawIdentity §2.5 (`e₀` and the good families of
labels), §2.7 (target forms and good forms); RemainingAndMainTermsOfSecondMoments §8.2 (c) (the share of non-allowed
polynomials and the bad share)

[ShortProof], `New/Spanning/SecondMoment/SpanningTheorem.lean` (`New.Data.hasAmplitudeBlocks_scaledPoincare`,
`New.Data.bad_types_rare`, `New.Data.isNearIsometry_e₀_comp_scaledPoincare`,
`New.Data.sum_hilbertSchmidtNorm_scaledPoincare_sq_le`, `New.Data.targetDim_mul_sum_hilbertSchmidtNorm_sq_le`,
`New.Data.finrank_targetForms_ne_zero`, `New.Data.isSpread_goodPoincare`)

## Downstream consumers

- OneSidedPrimeSumBoundsAndAdmissibleData §5.3 (Theorem B) uses 1.3 (few translates span almost all) and 5.7 (the
  second moment of the Poincaré map and one good translate).
- DeterminantsOfThetaLiftChains uses 2.1a, 2.3 (equality of multiplicities: the good forms on every `W_j` have
  dimension `d_T`) and 2.4 (the Rallis operator has the same determinant on the good forms of `Y₀` and of `W_j`).
- CongruencesOfTwistedThetaLifts and NormsOfThetaLiftsAndExchangeIdentities use 2.3.
- RemainingAndMainTermsOfSecondMoments uses the group at a real place and Bessel systems (3.1, 3.3), the open cell
  bounds (3.12, 3.13), filling data (4.1), and the terms, cutoffs, amplitudes, near terms, links and remaining terms
  of 4.2, 4.3, 4.4, 4.5, 4.10 and 4.12; it uses 5.5 for the letters of the data.
- PairsOfFramesAtOnePlace uses 3.1, 3.3, 3.5, 3.6, 4.1, 4.3 and 4.10, and proves the local bounds that 3.14 needs.

## Scope and ownership

### Owned here

- Spreading maps: near isometries, one translate from a second moment, few translates, and the bound for singular
  minors under a function of positive type (Layer 1).
- The Hecke algebra away from the level, equal traces and equal multiplicities on the good forms of inner forms, and
  the Rallis operator on them (Layer 2).
- The group at a real place, Bessel functions, cut pairs, Schur bounds, local bounds and Bessel systems, and the
  Bessel systems of the data (Layer 3).
- Filling data, terms, cutoffs, amplitudes and blocks; residue domains, reduced and boxed points, near terms, cell
  ranks and links; the second moment of a family of blocks; the unfolded second moment (Layer 4).
- The Poincaré series of a fitting space, the filling data of the data, the dimension of the target and the second
  moment of the Poincaré map (Layer 5).

### Not owned here

- The data, their sizes and Theorem B: OneSidedPrimeSumBoundsAndAdmissibleData.
- Source forms, target forms, good forms, the idempotent `e₀` and the Poincaré map as a Riesz representative:
  ThetaLiftChainsAndTheSeesawIdentity.
- The bounds for the remaining terms and for the main term, sieve systems, and the existence of residue domains:
  RemainingAndMainTermsOfSecondMoments.
- The local bounds at `ℂ` for cut Bessel functions, steep parameters and the lower bound for periods:
  PairsOfFramesAtOnePlace.
- The series of Rallis' inner product formula and the steepness of the parameters: DeterminantsOfThetaLiftChains.
- Discrete series coefficients with a large gap, the comparison of traces for a test function cuspidal at a split
  place, and the other entries marked ShortGRH background: stated in the form used on the *Needs:* lines, and not
  targets of this roadmap.

## Exact supplier contracts

### From the other roadmaps of ShortGRH

- OneSidedPrimeSumBoundsAndAdmissibleData: §3.2 (the data), §3.3 (their sizes), for 3.14, 5.4 and 5.5.
- ThetaLiftChainsAndTheSeesawIdentity: §2.1 (`X₀`, `Y₀`, `W_j`), §2.4 (the target parameter and its gap), §2.5 (`𝖦`
  and `e₀`), §2.6 (the level `K_0`), §2.7 (good forms and target forms), §2.8 (source forms), §2.19 (the Poincaré map).
- DivisibilityOfThetaDerivatives: §1.1 (b) (the generator of the different), §1.4 (Weil data), §1.5 (the chosen
  places).
- DeterminantsOfThetaLiftChains: §2.2 (a) (the series of Rallis' inner product formula), for 2.4; §5.4 (a) (the
  parameters are steep), for 3.14.
- RemainingAndMainTermsOfSecondMoments: §6.1 (sieve systems), for 3.3; §3.6 (b), §5.5 (c), (d), for 4.13; §8.1 and
  §5.5 (d), for 4.14; §8.2 (c), for 5.7.
- PairsOfFramesAtOnePlace: §8.1, §8.5, §8.6, for 3.9; §4.3, for 3.14.

### From other roadmaps

- FiniteReductiveGroups §5.2 and §5.7 (the cuspidal character and the central idempotent of an irreducible label),
  for 2.2.
- HermitianFormsAndLattices §1.1 (b) (Witt extension), for 3.4 and 3.9; §5.5 (masses) and §6.4 (b) (ratios of masses
  in consecutive ranks), for 5.4 and 5.6.
- DiscreteSeriesCoefficientsAndAutomorphicMetrics §8.3 (formal degrees), for 3.14; §7.5a (the mass of a level), for
  5.6.
- AutomorphicFormsOnReductiveGroups §7.5 (forms of a level with trivial stabilisers), for 5.1 and 5.6.

## References

- `[ShortProof]`: the folder `grh` of <https://github.com/lsernau/grh-lean> at commit
  `72fead102f663d5c7a407964a13dc0cf9d977207`; this roadmap covers `src/New/Spanning/SecondMoment`,
  `src/New/Spanning/Multiplicities`, `src/New/Spanning/Bessel` and `src/New/Spanning/Unfolding`.
- J. Arthur, L. Clozel, *Simple algebras, base change, and the advanced theory of the trace formula*, Annals of
  Mathematics Studies 120 (1989).
- R. Beuzart-Plessis, *A local trace formula for the Gan–Gross–Prasad conjecture for unitary groups: the Archimedean
  case*, Astérisque 418 (2020), Lemma 7.3.1.
- R. Godement, *Série de Poincaré et Spitzenformen*, Séminaire Henri Cartan 10 (1957–1958), exposé 10, §4.
- H. He, *On the Gan–Gross–Prasad conjecture for U(p, q)* (2017).
- H. Jacquet, *Sur un résultat de Waldspurger*, Ann. Sci. École Norm. Sup. 19 (1986), §§1, 7, 9.
- J.-P. Labesse, *Cohomologie, stabilisation et changement de base*, Astérisque 257 (1999).
- G. Muić, *On a construction of certain classes of cuspidal automorphic forms via Poincaré series*, Math. Ann. 343
  (2009).
- H. Petersson, *Theorie der automorphen Formen beliebiger reeller Dimension und ihre Darstellung durch eine neue Art
  Poincaréscher Reihen*, Math. Ann. 103 (1930).
- L. R. Welch, *Lower bounds on the maximum cross correlation of signals*, IEEE Trans. Inform. Theory 20 (1974).
- L. A. Wolsey, *An analysis of the greedy algorithm for the submodular set covering problem*, Combinatorica 2 (1982).

The sources are those named in the heads of the files of `[ShortProof]` that this roadmap covers; its `REFERENCES.md`
says which citations were compared with their sources.
