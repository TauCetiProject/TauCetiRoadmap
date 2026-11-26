# Roadmap: remaining and main terms of second moments

**Summary.** This roadmap bounds the second moment of Poincaré series term by term, after it has been unfolded. It is the second
part of the spanning theorem (Theorem B) of the argument. The argument proves the Riemann hypothesis for Dirichlet
L-functions through a one-sided bound for a sum over primes: such a bound gives a zero-free half-plane, and the bound
comes from comparing an upper and a lower bound for the covolume of a lattice of theta lifts. The lower bound needs
enough target forms. Translates of a Poincaré map by a finite group `Ḡ` of residue matrices at the places above the
level `M` must spread over the target forms, and this is read off a Petersson-type second moment of the operators
`P* s P`, `s ∈ Ḡ`.

After unfolding (SecondMomentsOfPoincareSeries), the second moment is a sum over blocks `(c, s, c')`, made of two
classes of a definite unitary group and an element `s ∈ Ḡ`, of squared norms of sums of amplitudes. The summands come
from rational elements `γ` of a unitary group, the terms. The identity terms give the expected value. This roadmap
treats all other terms, in two groups.

*The remaining terms* (Layers 1–5). The amplitudes of one orbit of terms, under the unipotent groups that fix the
frame, are summed by Schur's test or bounded on the open cell (Layer 3). The size of a term is measured by a gauge.
Two terms over one block have a common lattice whose discriminant is bounded by their gauges. A power of the level is
gained when their links differ, and the norm of the places where the reduction meets the frame is gained when the
links agree (Layer 4). Counting frames and lattices of small discriminant then shows that pairs of terms in different
link classes contribute at most `b^(−kf)` times the identity term. It also shows that the terms of one link over
reductions that meet at places of large norm are small (Layer 5). Layers 1 and 2 supply lattices over the CM field
and the vocabulary of terms.

*The main term* (Layers 6–8): the terms of nonzero discriminant over open reductions. A class sum is a sum of orbit
sums, and each orbit sum is a Kloosterman sum at a finite set of primes times an orbital integral at the infinite
places (Layer 7). Siegel's formula, used as an upper bound, dominates the class sums by densities at the last entry.
A sieve over all places then bounds these densities by the mass, up to a factor near `1` (8.1). The sieve removes the
entries one at a time by one-sided Poisson summation (Layer 6). The factor `b^(−6k)` is saved at each place where the
reduction fixes a given vector. The roadmap ends with the share of bad types in the regular representation of
`∏ GL_r(𝔽_q)` (8.2), which the spanning theorem needs for the dimension of the good forms.

The statements are made for filling data over a CM field, the abstract structure of SecondMomentsOfPoincareSeries §4.1,
and not on the admissible data directly. SecondMomentsOfPoincareSeries §5.5 builds filling data from the admissible data
of OneSidedPrimeSumBoundsAndAdmissibleData §3.2, and SecondMomentsOfPoincareSeries applies the results of this roadmap
there.

## Conventions and notation

**Labels.** Under each section heading, `*Origin:*` says where the statement comes from: `published:` with the source,
`adapted from` a published result with what is changed, `particular to this proof:` for a statement that the formal
proof introduces, `this roadmap's own formulation:`, or `definitions and conventions`. `*Method of the formal proof:*`
says how the formal proof proves it. `*Needs:*` lists the sections the statement rests on. `[ShortProof]` names the
shorter formal proof that this family follows; a path is under its directory `src/`, followed by the declaration. Where a
section states more than [ShortProof] proves, its last sentence says which case [ShortProof] proves.

**Fields.** `E` is a CM field with complex conjugation `x ↦ x̄`, `f` the number of its infinite places, `Φ_v` the chosen
complex embedding at the infinite place `v`, `rd_E` its root discriminant, `𝔸_f` its finite adeles and `Ô` their
integral elements. `E` *has Weil data* if it is stably unramified (below) and carries the element `ȷ`, the finite idele
`α` and the splitting character `υ` of DivisibilityOfThetaDerivatives §1.4 (c); the field of admissible data has them.
Layers 7 and 8 assume them; their statements do not depend on the choice. *Stably unramified* means that `E` contains a primitive root of unity of order `5040`; then `E/E⁺` is
unramified at the finite places. For an adele `a`, `[a]` is the generalised index: the inverse of the factor by which
multiplication by `a` scales Haar measure on `𝔸_f`, and `0` if `a` is not a unit. For `a ∈ E^×`, `[a] = |N_{E/ℚ} a|`.
`vol(Ô)` is the number `2^{r₂}/√|disc E|`, `r₂` the number of complex places of `E`; for a CM field, `r₂ = f` and
`vol(Ô) = (2/rd_E)^f`. It is the measure of `Ô` for the Haar measure on `𝔸_f` for which `𝔸_E/E` has mass `1` when each
`E_v = ℂ` carries Lebesgue measure, and it is the normalisation of SecondMomentsOfPoincareSeries (Conventions,
**Normalisations**); the constants of 6.3 and 6.4 hold with this value. `ψ_f` is the standard character of `𝔸_f`: it is
trivial on `Ô` and `ψ_f(a) = exp(2πi·Tr_{E/ℚ} a)` for `a ∈ E` (AdelicUnitaryGroupsAndAlgebraicModularForms §2.1).

**The filling data.** The data `S` are those of SecondMomentsOfPoincareSeries §4.1 (the filling data and its standing
hypotheses). A *shape* gives `ϱ` and a finite set `κ` with `k = #κ`; `n = ϱ + 1`. The space is
`V = H^ϱ ⊕ X₀ ⊕ E z` over `E`: `ϱ` hyperbolic planes with bases `e_a, e*_a` (`1 ≤ a ≤ ϱ`), a positive definite `X₀`
with orthonormal basis `x_i` (`i ∈ κ`), and `z` with `h(z, z) = −N`. The data give a prime `N = ππ̄` (with `π` a finite
idele), two primes `p₀, p₁` with `M = p₀p₁`, sets of *chosen places* above `p₀` and above `p₁` (above each `p_i` as many as
`E` has infinite places; no place is chosen together with its conjugate), a purely imaginary generator `ϖ` of the different, a free level in
`U(X₀)(𝔸_f)`, a size parameter `b`, and a Bessel system at each infinite place. Filling data include the size
conditions `1000 ≤ b`, `b^10 ≤ p_i ≤ b^11`, `b^19 ≤ M ≤ b^23`, `5 ≤ N`, `10⁵ ≤ ϱ`, `1000(2ϱ + 2)⁹ ≤ k ≤ f` and
`(200fk·rd_E)^1000 ≤ b`. *Admissible* means that the standing hypotheses of that roadmap hold in addition. The ones
used most here are `N ≤ b^(60n)` and `1 ≤ |κ_v| ≤ b^23` for `κ_v = MΦ_v(ϖ)/(2πi)`. They also include
`b^(11kf)𝒟_id ≤ 𝒟_main ≤ (M/b⁶)^(kf)𝒟_id`, at most `b^(2kf)` Bessel coordinates, that the level is the preimage of `K(M)`, and that reduction `K → Ḡ` is onto.

| Symbol | Meaning | Defined |
|---|---|---|
| `f = (e₁, …, e_ϱ, z)`, `A`, `A⁺` | the frame, of `n = ϱ + 1` vectors; `A = ⟨e₁, …, e_ϱ⟩` (isotropic); `A⁺ = A + Ez` | Conventions |
| `G`, `G(E)`, `G₁`, `G_∞` | the unitary group of `V`; its rational points; the real unitary group of the normalised form at one infinite place; `G_∞ = ∏_v G₁` | SecondMomentsOfPoincareSeries §3.1 (`G₁`), §4.1 |
| `K`, `K(M)`, `Ḡ`, `s̄` | the integral points of `G(𝔸_f)` in the lattice basis, the kernel of reduction at the chosen places, the product `∏ GL_r` over the residue fields at the chosen places (`r = 2ϱ + k + 1`), reduction | SecondMomentsOfPoincareSeries §4.1 |
| `c`, `h_c`, `Λ_c`, `n_X` | a class of `U(X₀)(E)\U(X₀)(𝔸_f)/level`, its chosen representative and its image in `G(𝔸_f)`, the lattice `h_cΛ₀` of the class, the number of classes | SecondMomentsOfPoincareSeries §4.2 |
| `𝖴`, `𝖴⁰`, `U⁰_c`, `R̄₀` | the Bessel unipotent group; its elements fixing every frame vector; the rational `u ∈ 𝖴⁰` with `h_c⁻¹uh_c ∈ K(M)`; the image in `Ḡ` of the integral points of the Bessel subgroup | SecondMomentsOfPoincareSeries §3.1 (`𝖴`, `𝖴⁰`), §4.2 (`U⁰_c`), §4.1 (`R̄₀`) |
| `W`, `W♭`, `d`, `deg` | the Bessel vector at the infinite places and its cut (product of the local ones), the number of its coordinates, the product of the local degrees | SecondMomentsOfPoincareSeries §3.3 (Bessel systems at the real places), §4.2 (the products) |
| `β_c`, `a_{c,c'}(γ)`, `\|a\|_{c,c'}(γ)` | the cutoff of the class `c` at infinity; the amplitude `∫ β_c(y)β_{c'}(γ⁻¹y) W(y) ⊗ W(γ⁻¹y)^* dy`; the same integral of the norm of the tensor | SecondMomentsOfPoincareSeries §4.2 |
| `A_T(c, s, c')`, `A♭_T` | the block: the sum of `a_{c,c'}(γ)` over `γ ∈ T` with `h_c⁻¹γh_{c'} ∈ K` of reduction `s` (the terms over `(c, s, c')`); with `W♭` | SecondMomentsOfPoincareSeries §4.2 |
| `Z(γ)`, `D_l(γ)`, `𝗀(γ)`, `Nm𝗀(γ)` | the matrix `(h(f_a, γf_b))` of frame products; its leading minors; `𝗀 = \|D_n\|² − N²\|D_ϱ\|² ∈ E`; `∏_v \|Φ_v 𝗀\|` | SecondMomentsOfPoincareSeries §3.1 (leading minors, `𝗀_N`), §4.1 (frame products, `𝗀(γ)`) |
| `ν`, `𝒟_main`, `𝒟_id`, `τ`, `n_p` | the covolume of the unipotent groups, `(n_X d)²/(deg·mass_r)`, `#R̄₀·n_X d`, `b^(kf/4)`, `#R̄₀ n_X N^(−kf)` | SecondMomentsOfPoincareSeries §4.2 (`ν`, `𝒟_main`, `𝒟_id`); 2.4 |
| `mass_r` | the mass `Σ 1/#Aut` of the genus of the standard hermitian lattice `𝒪_E^r` | SecondMomentsOfPoincareSeries (Conventions, `mass_l`) |
| `c_S`, `a_*` | `((2π)^k rd_E^(1/2−k)/((k−1)! N^k))^f`; `#R̄₀·M^(fϱ(2k+2ϱ+1))·n_X·c_S` | SecondMomentsOfPoincareSeries §4.1 |
| `link(γ)`, `Υ_γ`, `z⁺` | the pairs (class of `t`, class of `γ⁻¹t`) in `(A^⊥/A)²` for `t ⊥ A + γA`; the isometry of `X₀ ⊥ Ez⁺` it defines; `z⁺` of norm `N` | SecondMomentsOfPoincareSeries §4.2 (links), §4.5 (the link isometry) |
| cell rank `j` | `0 ≤ j ≤ ϱ + 1`: norm-one pairs occur from `j`, `D_j ≠ 0`, and `j = ϱ + 1` exactly when `𝗀 ≠ 0` | SecondMomentsOfPoincareSeries §4.4 (cell ranks and near terms); 2.4 |
| `Γ*`, agrees, stable | the remaining terms; `s` agrees with the unipotent character; a set of terms invariant under `𝖴(E)` on both sides | SecondMomentsOfPoincareSeries §4.12 (the remaining terms), §4.2 (agrees, stable) |
| meets, `meet(s)` | `s` meets at a place above `M` if there the spans of `f` and `sf` share a nonzero vector; the product of the norms of these places | SecondMomentsOfPoincareSeries §4.10 (c) |
| residue domain, reduced, boxed, near | SecondMomentsOfPoincareSeries §4.2 (residue domains, reduced and boxed points), §4.4 (near terms) | 2.2 (existence and bounds) |
| `L_γ`, `L₁₂`, `d₁₂`, `c⁺`, `𝗀♯`, `𝗀*`, `𝒟_j`, `σ_j(x)`, `size(γ)` | the data of a term and of a pair | 2.4 |
| `𝖤(A, Ω)`, `𝖤_link(T, Ω)` | second moments of blocks | 2.1 |
| `E_T`, `O_T` | the product of the completions of `E` at a finite conjugation-stable set `T` of finite places, and its integers | 7.2 |

**Letters of the data.** For filling data built from admissible data (SecondMomentsOfPoincareSeries §5.5), the letters
agree with those of OneSidedPrimeSumBoundsAndAdmissibleData §2.2 (`E`, `f`) and §3.2 (`b`, `M = p₀p₁`, `N`, `m`, `k`,
`r`), and the chosen places are those of DivisibilityOfThetaDerivatives §1.5: `E`, `f`, `b`, `M = p₀p₁`, `N`, the chosen
places, `ϱ` (with `m = 2ϱ + 2` lifts), `k` (the rank of `X₀`) and `r = 2ϱ + k + 1` (the rank of `Y₀ = V`).

**Two letters with two meanings.** `f` is the number of infinite places in exponents, products and counts, and the
frame in `f_a`, `γf`, `sf` and the like. `r` is `2ϱ + k + 1` except where a section gives it another meaning: the rank
of a lattice in 1.1, 5.2 and 5.3, a real number or a tuple of scales in 6.2, 6.3 and 7.5, and any rank in 8.2.

## Layer 1: Lattices over a CM field

### 1.1 Lattices in the finite adeles, discriminants and sums over sublattices

*Origin:* adapted from the classical theory of the zeta function of a lattice (Hey's formula for the number of
sublattices of given index): here, an upper bound for the sum of a negative power of the index over the sublattices of
finite index, for lattices over the integral finite adeles of a CM field.

*Method of the formal proof:* a submodule of finite index of `R × N` is determined by its ideal of first coordinates,
which is principal, by its intersection with `N`, and by one class modulo that intersection. This gives
`ζ_{R×N}(s + 1) ≤ ζ_R(s + 1)·ζ_N(s)`, and induction on the rank gives (d), hence (c). A change of basis by an adelic
matrix multiplies the Gram determinant by the generalised index of its determinant squared, which gives (a) and (b).

Let `E` be a stably unramified CM field and `κ` a finite set.

(a) *Lattices and discriminants.* An `Ô`-submodule `L` of `𝔸_f^κ` is a *lattice of rank `r`* if it is the `Ô`-span of
the columns of `B = x·a`, with `x` a `κ × r` matrix over `E` of rank `r` and `a ∈ GL_r(𝔸_f)`. Its *discriminant*
`d_r(L) = [det(B^*B)]^(1/2)` does not depend on the choice of `B`; put `d_r(L) = 0` if `L` is not a lattice of rank
`r`. For a subspace `U ⊂ E^κ` and an adelic matrix `H` with a left inverse, the *saturated lattice* of `U` for `H` is
the set of points `u` of `U ⊗ 𝔸_f` with `Hu` integral. It is a lattice of rank `dim U`. If `m^*m` is integral for every
adelic matrix `m` with `Hm` integral, its discriminant is at least `1`.

(b) If `M ⊂ L` is an `Ô`-submodule of finite index of a lattice `L` of rank `r`, then `M` is a lattice of rank `r` and
`d_r(M) = d_r(L)·[L : M]`.

(c) For a lattice `L` of rank `r` and every `μ ∈ ℕ`,
`Σ_{M ⊂ L of finite index} [L : M]^(−(r+μ)) ≤ ζ_Ô(μ)^r`, where `ζ_Ô(μ) = Σ_I [Ô : I]^(−μ)` over the ideals of finite
index of `Ô` (both sides in `[0, ∞]`).

(d) More generally, let `R` be a commutative ring whose ideals of finite index are principal. Then
`Σ_{M ⊂ R^r of finite index} [R^r : M]^(−(r+μ)) ≤ (Σ_I [R : I]^(−μ))^r`. The ring `Ô` has this property.

*Needs:* none.

[ShortProof], `New/Spanning/RemainingTerms/Discriminants.lean` (`New.Filling.IsLatticeOfRank.tsum_submoduleIndex_inv_pow_le`,
`New.Filling.submoduleZeta_pi_le`, `New.Filling.IsLatticeOfRank.of_le_and_discriminant_eq_mul_index`,
`New.Filling.isLatticeOfRank_saturatedLattice`, `New.Filling.one_le_sublatticeDiscriminant`)

### 1.2 Siegel's lemma and a height zeta function of subspaces

*Origin:* adapted from Siegel's lemma over number fields (Bombieri and Vaaler (1983)): here, for the lattices of the genus
of the standard hermitian lattice over a stably unramified CM field. The subspace is cut out as a hermitian orthogonal,
lengths are Euclidean over all infinite places together, and the constant is explicit but not sharp. A bound for the
height zeta function of the subspaces of given codimension follows.

*Method of the formal proof:* take lattice bases of `U` and of its orthogonal complement. By Jacobi's identity between
a lattice and its orthogonal complement their discriminants agree. Minkowski's second theorem for an adelic matrix gives
`s` short independent vectors of the complement, which is (a). For (b), each `U` is charged to such a tuple of vectors.
Nonzero lattice vectors have length at least `1`, so a packing bound sums `‖x‖^(−2f(k+1))` over the lattice.

Let `E` be a stably unramified CM field, `κ` a finite set with `k = #κ`, `u ∈ U(E^κ)(𝔸_f)` for the standard hermitian
form, and `Λ_u = E^κ ∩ uÔ^κ`. For `x ∈ E^κ` let `‖x‖` be the Euclidean length of `(Φ_v(x_i))_{v,i}`, over all infinite
places together. For a subspace `U ⊂ E^κ` let `d(U)` be the discriminant (1.1) of `U ⊗ 𝔸_f ∩ uÔ^κ`.

(a) *Siegel's lemma.* If `U` has codimension `s`, there are nonzero `X₁, …, X_s ∈ Λ_u` with
`U = {y : h(X_i, y) = 0 for all i}` and `(∏_i ‖X_i‖)^(2f) ≤ (8fs·rd_E)^(fs)·d(U)`.

(b) *Height zeta function.* For every `s`, `Σ_U d(U)^(−(k+1)) ≤ (200fk·rd_E)^(f(k+1)s)`, the sum over all subspaces
`U ⊂ E^κ` of codimension `s`.

*Needs:* 1.1, AdelicHeightsAndSuccessiveMinima §3.1 (Minkowski's second theorem over a number field), ShortGRH
background (Jacobi's identity over `Ô ⊂ 𝔸_f`: let `J` be a unimodular hermitian matrix, `F` an integral matrix and
`n` a primitive matrix with `FᴴJn = 0`, the numbers of columns of `F` and `n` adding up to the size of `J`, and let `F`
have a left inverse over `𝔸_f` or `[det(FᴴJF)] ≠ 0`; then every `u` with `nᴴJu = 0` is `Fv` for some `v` over `𝔸_f`,
and `[det(FᴴJF)] = [det(nᴴJn)]·i²`, where `i` is the index of the integral vectors in `{y : Fy integral}`; [ShortProof]
`Lib/General/NumberTheory/LatticeCovolumes.lean` (`New.Filling.jacobi_perp_discriminant`, with no added block)).

[ShortProof], `New/Spanning/RemainingTerms/SiegelLemma.lean` (`New.Filling.siegel_lemma`,
`New.Filling.tsum_sublatticeDiscriminant_inv_le`)

## Layer 2: Blocks, boxes and the data of a term

*Setting of Layers 2–5.* `S` is admissible filling data over a stably unramified CM field `E`, unless a section says
otherwise.

### 2.1 Second moments of blocks

*Origin:* definitions and conventions.

*Method of the formal proof:* (a) is the triangle inequality for the `ℓ²` norm of the family of blocks.

The *second moment* `𝖤(A, Ω)` of a family of blocks `A(c, s, c')` in a normed space, indexed by two classes and
`s ∈ Ḡ`, over a set `Ω ⊂ Ḡ`, is that of SecondMomentsOfPoincareSeries §4.2 (written `𝔼(A, Ω)` there). For a set
`T ⊂ G(E)` of terms, the *link second moment* is
`𝖤_link(T, Ω) = Σ_{c,c'} Σ_{s∈Ω} Σ_Λ ‖A♭_{T∩{link = Λ}}(c, s, c')‖²` (not divided by `ν²`), the inner sum over the
`E`-subspaces `Λ` of `(X₀ ⊕ Ez)²`.

(a) `𝖤(A + B, Ω)^(1/2) ≤ 𝖤(A, Ω)^(1/2) + 𝖤(B, Ω)^(1/2)`.

*Needs:* SecondMomentsOfPoincareSeries §4.2 (terms, amplitudes, blocks, links and the second moment of a family of
blocks).

[ShortProof], `New/Spanning/RemainingTerms/Size.lean` (`New.Filling.secondMoment`, `New.Filling.linkSecondMoment`,
`New.Filling.sqrt_secondMoment_add_le`)

### 2.2 The box and near terms

*Origin:* particular to this proof: the existence of a residue domain, a bounded fundamental domain for the
translations by `M𝒪_E` at the infinite places, and the bound for the frame at a boxed point.

*Method of the formal proof:* every tuple lies within `M(2f)²|ϖ|_v ≤ b^26` of a multiple of `M𝒪_E`, through an element
of `E` near a given point that the different provides. Only finitely many multiples meet each ball, so a measurable
choice of one translate in the ball gives `D`. The Gram–Schmidt matrix of the frame at a point is unchanged by left
multiplication by `𝖴⁰`, and so is the Bessel length. At a boxed point the frame vectors are bounded by the reduced
triangular entries times the Bessel length.

Let `S` be admissible. Residue domains, reduced points and boxed points are those of SecondMomentsOfPoincareSeries
§4.2, and near terms those of its §4.4; `ℓ(g)` is the Bessel length of its §3.1, and a point `y` is in the cut at `v`
when `ℓ(y_v) ≤ b^(6n+2)`.

(a) A residue domain exists: a measurable set `D ⊂ ℂ^{places}` of representatives for `ℂ^{places}` modulo `M𝒪_E`
(embedded by the `Φ_v`) whose points have all coordinates of modulus at most `b^26`. Reduced and boxed points are
taken for one fixed residue domain.

(b) The boxed points form a measurable set, invariant under left multiplication by `∏_v 𝖴⁰(ℝ)`. At a boxed point every
frame vector `y_v⁻¹f_a` has length at most `b^(37n)`.

(c) Nearness of `γ ∈ G(E)` is invariant under `γ ↦ uγu'` with `u ∈ U⁰_c`, `u' ∈ U⁰_{c'}`.

*Needs:* SecondMomentsOfPoincareSeries §3.1 (the Bessel length and the frame box), §3.2 (the Gram–Schmidt frame),
§4.1 (the filling data and its standing hypotheses), §4.2 (the groups `U⁰_c`; residue domains, reduced and boxed
points), §4.4 (near terms).

[ShortProof], `New/Spanning/RemainingTerms/Box.lean` (`New.Filling.exists_isResidueDomain`, `New.Filling.boxedPoints`,
`New.Filling.mul_mem_boxedPoints_iff`, `New.Filling.mem_frameBox_of_mem_boxedPoints`),
`New/Spanning/Unfolding/Terms.lean` (`New.Filling.IsNear.mul_of_mem_besselU0`)

### 2.3 The lattice of a class and the lattice of columns

*Origin:* particular to this proof: the lattice of the class in `X₀`, and the covolume of its tuples at the infinite
places.

*Method of the formal proof:* the real inner product of two points of the image is the trace of a hermitian product of
lattice vectors. With the primitive 5040th root of unity in `E` it is an integer, so the dual lattice contains the
lattice and the covolume is at least `1`.

Let `S` be admissible and `c` a class with chosen representative `g_c ∈ U(X₀)(𝔸_f)`.

(a) `Λ_c ∩ X₀` is the set of `v ∈ 𝔸_f^κ` such that `g_c⁻¹v` is integral and its entry at the distinguished index `k₀`
is divisible by `π` (in the lattice basis of SecondMomentsOfPoincareSeries §4.1, where `x_{k₀}` is replaced by
`x_{k₀}/π̄ + z/N`). Any two vectors of `Λ_c ∩ X₀` have an integral product.

(b) For a finite set `ι`, the image of `(Λ_c ∩ X₀ ∩ E^κ)^ι` in `∏_v (ℂ^κ)^ι` under the conjugates of the embeddings
`Φ_v` is a discrete subgroup. It has a measurable fundamental domain of finite Lebesgue measure at least `1`.

*Needs:* 1.1, SecondMomentsOfPoincareSeries §4.1 (the filling data, the lattice basis and the standing hypotheses),
§4.2 (classes and their representatives).

[ShortProof], `New/Spanning/RemainingTerms/ColumnLattice.lean` (`New.Filling.exists_isAddFundamentalDomain_columnLattice`),
`New/Spanning/RemainingTerms/Data.lean` (`New.Filling.classLatticeX₀`,
`New.Filling.isIntMatrix_conjTranspose_mul_of_classCoordX₀`)

### 2.4 The data of a term

*Origin:* definitions and conventions.

*Method of the formal proof:* definitions; none.

Let `S` be filling data, `c, c'` classes, `γ, γ' ∈ G(E)`, and `k_γ = h_c⁻¹γh_{c'} ∈ G(𝔸_f)`.

- *Cell rank.* The cell rank `j ≤ ϱ + 1` of `γ` is that of SecondMomentsOfPoincareSeries §4.4; a term has at most one.
  Put `j' = min(ϱ, j)`.
- *Term lattice.* `L_γ` is the set of `v ∈ Λ_c ∩ X₀` such that some vector of `v + M(Λ_c ∩ A)` is orthogonal to the
  frame `γf`, computed in the coordinates of the lattices of `c` and `c'`.
- *Common link and common lattice.* `X₀(γ, γ')` is the space of `x ∈ X₀` such that some pair `(x, y)` with `x, y ∈ X₀`
  lies in `link(γ) ∩ link(γ')`. The *link corank* is `c⁺(γ, γ') = k + 1 − dim(link γ ∩ link γ')`, since a link has
  dimension `k + 1`. The *common lattice* `L₁₂` is the intersection of the saturated lattice of `X₀(γ, γ')` in
  `Λ_c ∩ X₀` with `L_γ ∩ L_γ'`. Its *discriminant* `d₁₂` is taken in rank `dim X₀(γ, γ')`, and its *corank* is
  `k − dim X₀(γ, γ')`.
- *Indices and minors.* `i_j(k)` is the index, in the `Ô`-span of the vectors `(h(e_a, kf_b))_b`, `1 ≤ a ≤ ϱ`, of the
  span of those with `a ≤ j`, a positive integer or `∞`; it is finite for the terms of 4.2 (a), and a quotient by an
  infinite index is read as `0`. The torsion index `t(k)` is the index of `Λ₀ ∩ A + k(Λ₀ ∩ A)` in
  `Λ₀ ∩ (A + kA)`. `δ_*^j(γ)` is the determinant of the frame products on the subframe made of the first `j` vectors of
  `f` and `z`. `minor_j(γ) = |N_{E/ℚ} D_j(γ)|` for `j ≤ ϱ`, and `minor_{ϱ+1}(γ) = |N_{E/ℚ} D_{ϱ+1}(γ)|/N^(2f)`.
- *Gauges.* `𝗀♯_j(γ) = |N_{E/ℚ} δ_*^j(γ)|/(i_j(k_γ)·i_j(k_γ⁻¹)·N^f)`, `𝗀_max = max(𝗀♯_j, Nm𝗀)` and
  `𝗀*_j(γ) = M^(2j'f)·𝗀_max`. The *discriminant bound* is `b^(n³f)`.
- *Sizes.* `𝒟_j = 𝒟_main` for `j = ϱ + 1` and `𝒟_j = τ^(−16)𝒟_id` for `j ≤ ϱ`. The *orbit bound* is
  `σ_j(x) = τ²·(𝒟_j/(n_p(M^(2j'f)x)^k))^(1/2)`. The *size* of a term of cell rank `j` is `size(γ) = σ_j(𝗀_max(γ))`.
- *Representatives.* Fix one element of each double coset `U⁰_c γ U⁰_{c'}`. A *near representative of `T` over
  `(c, s, c')`* is a fixed element `γ ∈ T` over `(c, s, c')` that is near, has a cell rank, and for which `s` agrees. A
  *near pair over an agreeing block* is a pair of near representatives that have cell ranks and lie over one block
  `(c, s, c')` whose `s` agrees. Fix a representative of each coset of `R̄₀` in `Ḡ`. The *label* of a term over
  `(c, s, c')` is the element `t ∈ R̄₀` with `s = s₀·t`, where `s₀` is the fixed representative of the coset `sR̄₀`.

*Needs:* 1.1, 2.2, 2.3, SecondMomentsOfPoincareSeries §4.2 (links, agreeing reductions), §4.4 (cell ranks and near
terms), §4.5 (the link isometry), §4.12 (the remaining terms).

[ShortProof], `New/Spanning/RemainingTerms/Data.lean` (`New.Filling.termLattice`, `New.Filling.pairLattice`,
`New.Filling.pairDiscriminant`, `New.Filling.linkCorank`, `New.Filling.levelGauge`, `New.Filling.termSize`,
`New.Filling.nearRepresentativesOver`, `New.Filling.IsNearPairOverAgreeingBlock`),
`New/Spanning/RemainingTerms/BorderedDeterminant.lean` (`New.Filling.isotropicRowsIndex`, `New.Filling.torsionIndex`,
`New.Filling.minorNorm`, `New.Filling.subframeMinor`, `New.Filling.minorGauge`, `New.Filling.maxGauge`,
`New.Filling.IsNearTermAt`), `New/Spanning/RemainingTerms/OrbitSize.lean` (`New.Filling.cellRankSecondMoment`,
`New.Filling.orbitBound`)

## Layer 3: The orbit bound

### 3.1 The weight of Schur's test at one real place

*Origin:* particular to this proof: the ratio of the volumes of the projections of two frames to a negative space, its
computation modulo the shared isotropic vectors, and an integrable majorant of its negative power along affine moves.

*Method of the formal proof:* vectors shared by the two flags cancel in the ratio, so it can be computed on the
subframe `e₁, …, e_i, z` in a basis of `yV₋ ∩ I^⊥`, `I = A ∩ γA`. A triangular basis bounds the ratio below by a
multiple of `det(1 + v v^*)`, where the columns of `v ∈ X₀^i` move affinely with the `X₀`-parts of the frames. The
negative power `k + i` of such a determinant is integrable over `X₀^i` with an explicit integral.

Let `G₁` be the unitary group of the hermitian form on `ℂ^{r}` made of `ϱ` hyperbolic planes, a positive part `X₀ = ℂ^κ`
and one vector `z` of norm `−1`, with frame `f = (e₁, …, e_ϱ, z)` and `V₋` the negative eigenspace of the form matrix.
For `γ, y ∈ G₁` let `ν_γ(y) = |det(h(yw_l, γf_a))|/|det(h(yw_l, f_a))|`, `(w_l)` a basis of `V₋` (independent of the
choice): the ratio of the volumes of the projections of `γf` and `f` to `yV₋`.

(a) Let norm-one pairs occur for `γ` from `j`, `i = min(ϱ, j)`, and let the columns of `ω` lie in `yV₋`, be orthogonal
to `A ∩ γA` and pair perfectly with the subframe `(e₁, …, e_i, z)`. Then
`ν_γ(y) = |det(h(ω, γ(e₁, …, e_i, z)))|/|det(h(ω, (e₁, …, e_i, z)))|`.

(b) Let `y ∈ G₁` have all `‖y⁻¹f_a‖ ≤ ρ` and Bessel length at most `θ`, let `k ≥ 7` and `j ≤ ϱ + 1`, `i = min(ϱ, j)`.
Let `γ₀ ∈ G₁` have norm-one pairs from `j`, let `Z = Z(γ₀)`, and let the determinant `δ` of the block of `Z` on the
subframe `(e₁, …, e_i, z)` be nonzero. There is a measurable `φ ≥ 0` on `(ℂ^κ)^i` with
`∫φ ≤ (2ρ²)^((i+1)i)·(2^(i+1)θ^(2(j−i)))^k/|δ|^(k+i)` such that `ν_γ(y)^(−(k+i)) ≤ φ(A)` for every `γ` with norm-one
pairs from `j` and `Z(γ) = Z` whose subframe images have `X₀`-parts differing from those of `γ₀` by `A^*` times the
first `i` rows of the block.

*Needs:* SecondMomentsOfPoincareSeries §3.1 (the group at a real place, its frame, the Bessel length and the frame box).

[ShortProof], `New/Spanning/RemainingTerms/OneRealPlace.lean` (`New.RealPlace.IsNegativeBasis.volumeRatio_eq`,
`New.RealPlace.exists_majorant_volumeRatio_inv_pow`)

### 3.2 Schur's test: Cauchy–Schwarz and integration in stages

*Origin:* adapted from Schur's test for integral operators, classical: here, Cauchy–Schwarz with a weight
that is inverted when the two frames are exchanged, followed by an integration over the unipotent group fixing the
frame.

*Method of the formal proof:* where the cut kernel is nonzero, both `y` and `γ⁻¹y` lie in the cut, so the cutoffs agree
with their restrictions to the boxed points. Cauchy–Schwarz with the weight `ν^(−(k+i))` and its inverse after
`y ↦ γ⁻¹y` gives (a). (b) unfolds along `𝖴⁰(ℝ)`, on whose orbits in the boxed points everything but the cutoff of
`U⁰_c` is constant, and averages over the shifts.

Let `S` be admissible and `β^□_c` the cutoff `β_c` restricted to the boxed points. For a class `c'`, `γ ∈ G(E)` and `i ∈ ℕ`
put `w_{c',γ,i}(y) = β^□_{c'}(γ⁻¹y)·∏_v ν_{γ_v}(y_v)^(−(k+i))` (3.1) and
`I(c, c', γ, i) = ∫ β^□_c(y)·‖W♭(y)‖²·w_{c',γ,i}(y) dy`.

(a) `|a|♭_{c,c'}(γ)² ≤ I(c, c', γ, i)·I(c', c, γ⁻¹, i)`.

(b) Let `F ≥ 0` be measurable and invariant under `U⁰_c` on the left, let `x ↦ s(x)` be a measurable map from a
measure space with an s-finite measure into `∏_v 𝖴⁰(ℝ)`, and let `B` have finite positive measure. If
`∫_B F(u·s(x)·y) dx ≤ |B|·C` for all `u ∈ ∏_v 𝖴⁰(ℝ)` and all boxed `y`, then `∫ β^□_c ‖W♭‖² F ≤ C·ν·d`.

*Needs:* 2.2, 3.1, SecondMomentsOfPoincareSeries §4.2 (terms, amplitudes and blocks; the cutoffs `β_c`).

[ShortProof], `New/Spanning/RemainingTerms/SchurTest.lean` (`New.Filling.amplitudeMajorant_sq_le`,
`New.Filling.lintegral_boxCutoff_le_of_average`)

### 3.3 Schur's test for one orbit

*Origin:* particular to this proof: a bound for the sum of the absolute amplitudes over one orbit of terms under the
frame-fixing unipotent groups of level `M`, by the gauge `𝗀♯`.

*Method of the formal proof:* the frames of an orbit lie in at most `i_j^k` cosets of the lattice of columns of
`Λ_c ∩ X₀` (2.3), moved by `M` times the first `i` rows of the frame products. The mean over the orbit of the sum of the
weights becomes a sum over that lattice, then the integral of the kernel of 3.1 divided by the covolume. Eichler shifts
along `e₁, …, e_i` realise the affine moves, and Schur's test (3.2) concludes.

Let `S` be admissible and `γ` a term over `(c, s, c')` of cell rank `j ≥ 1`, `i = min(ϱ, j)`.

(a) `(Σ_{δ ∈ U⁰_c γ U⁰_{c'}} |a|♭_{c,c'}(δ))² ≤ (ν·d·τ²·(b^13/M²)^(ikf))²·(N^f/𝗀♯_j(γ))^k`.

(b) If moreover `Nm𝗀(γ) ≤ N^f·minor_j(γ)`, then `Σ_{δ ∈ U⁰_c γ U⁰_{c'}} |a|♭_{c,c'}(δ) ≤ ν·σ_j(𝗀_max(γ))`.

*Needs:* 2.3, 2.4, 3.1, 3.2, SecondMomentsOfPoincareSeries §4.3 (a) (Eichler shifts), §4.6 (reduced points).

[ShortProof], `New/Spanning/RemainingTerms/SchurOrbit.lean` (`New.Filling.sq_tsum_amplitudeMajorant_doubleCoset_le`,
`New.Filling.tsum_amplitudeMajorant_orbit_le`)

### 3.4 Near terms: the tail and the open-cell term

*Origin:* particular to this proof: the orbit bound at the top cell rank dominates the tail and the open-cell bound of
a near term of large discriminant.

*Method of the formal proof:* at a near term the minors of the frame products are at most `b^(135n²)` at every place,
which bounds `Nm𝗀`. The open-cell bound of SecondMomentsOfPoincareSeries §3.12 (b) is a product over the places of
explicit local constants; its part independent of `γ` is compared with `𝒟_main` through the standing hypotheses.

Let `S` be admissible and `γ ∈ G(E)`.

(a) If `γ` is near, then `Nm𝗀(γ) ≤ b^(270n²f)`.

(b) If `γ` is near and `Nm𝗀(γ) ≥ 1`, then `σ_{ϱ+1}(Nm𝗀(γ)) ≥ b^(−k³f)`.

(c) If `Nm𝗀(γ) ≥ 1`, the product over the infinite places of the open-cell bounds at the images of `γ` (with radius
`b^(37n)`, the degree and the number of coordinates of the Bessel system at `v`) is at most
`(ν·σ_{ϱ+1}(Nm𝗀(γ))/2)²`.

*Needs:* 2.2, 2.4, SecondMomentsOfPoincareSeries §3.12 (b) (the open-cell bound at one place).

[ShortProof], `New/Spanning/RemainingTerms/OrbitSize.lean` (`New.Filling.IsNear.termDiscNorm_le`,
`New.Filling.IsNear.inv_pow_le_orbitBound`, `New.Filling.prod_pairingBoundSq_le`)

### 3.5 The bound for a block

*Origin:* particular to this proof: the cut block of a stable set of remaining terms is at most the covolume times the
sum of the sizes of its near representatives.

*Method of the formal proof:* the terms are sorted by cell rank. Where `Nm𝗀` exceeds `N^f·minor_j`, a change of weight
reduces each orbit to one near representative integrated on the open cell (3.4 (c)). Elsewhere the orbits are summed by
Schur's test (3.3 (b)). A block vanishes unless `s` agrees, and terms of cell rank `0` do not occur over a block of a
remaining set.

Let `S` be admissible.

(a) Every element of `Γ*` has a cell rank, and none has cell rank `0`.

(b) Let `T ⊂ Γ*` be stable. For all `c, s, c'`, `‖A♭_T(c, s, c')‖ ≤ ν·Σ_γ size(γ)`, the sum over the near
representatives `γ` of `T` over `(c, s, c')`.

*Needs:* 2.4, 3.3, 3.4, SecondMomentsOfPoincareSeries §3.13 (the open-cell pairing bound), §4.12 (the remaining
terms).

[ShortProof], `New/Spanning/RemainingTerms/Size.lean` (`New.Filling.hasCellRank_cellRank_of_mem`,
`New.Filling.enorm_amplitudeSum_le_tsum_termSize`,
`New.Filling.enorm_amplitudeSum_le_orbitBound`, `New.Filling.enorm_amplitudeSum_le_orbitBound_top`)

### 3.6 From the Bessel function to its cut

*Origin:* particular to this proof: passing from the Bessel vector to its cut changes the second moment of any set of
terms by at most `b^(−40)𝒟_id`.

*Method of the formal proof:* the amplitudes converge absolutely. The `L²` distance between the Bessel function and
its cut, from the cut pairs of the Bessel systems, makes the integral of the norm of the difference of the kernels,
summed over `c'` and the terms, at most `νb^(−k³f)/2`. The number of reductions and classes is then absorbed by the
standing hypotheses.

Let `S` be admissible and `U ⊂ G(E)`.

(a) For every `c` and `s`, `Σ_{c'} ‖A_U(c, s, c') − A♭_U(c, s, c')‖ ≤ νb^(−k³f)/2`.

(b) For every `Ω ⊂ Ḡ`, `𝖤(A_U − A♭_U, Ω) ≤ b^(−40)𝒟_id`.

*Needs:* 2.1, SecondMomentsOfPoincareSeries §3.3 (Bessel systems at the real places: the cut pair), §4.9 (a) (absolute
convergence of the amplitudes and the difference of the kernels).

[ShortProof], `New/Spanning/RemainingTerms/Size.lean` (`New.Filling.sum_norm_amplitudeSum_sub_cut_le`,
`New.Filling.secondMoment_sub_cut_le`)

## Layer 4: The gain

### 4.1 The minor of a term

*Origin:* particular to this proof: bases of `A⁺/I_γ` and `γA⁺/I_γ` made of subframes, and the nonvanishing of the
minor `δ_*` that pairs them.

*Method of the formal proof:* the shared vectors of the flags lie in `I_γ = A ∩ γA` from the cell rank on, and a
vector of `I_γ` with zero products with the subframe is `0` because `D_j ≠ 0`. This gives the basis of `γA⁺/I_γ`. The
basis of `A⁺/I_γ` is the same statement for `γ⁻¹`, moved by `γ`; here the formal proof uses that `γ⁻¹` has the same cell
rank. The two bases pair perfectly, so `δ_* ≠ 0`.

Let `S` be filling data and `γ ∈ G(E)` of cell rank `j`, `I_γ = A ∩ γA`.

(a) The images of `γe₁, …, γe_j` (those with index `< ϱ`) and of `γz` form a basis of `γA⁺/I_γ`, and `γA⁺` is spanned by
them and `I_γ`.

(b) If `E` is stably unramified, the same holds for `e₁, …, e_j, z` and `A⁺/I_γ`, and `δ_*^j(γ) ≠ 0`; so the two
quotients pair perfectly. The rank of `A/I_γ` is `min(j, ϱ)`.

*Needs:* 2.4, SecondMomentsOfPoincareSeries §4.4 (cell ranks and near terms).

[ShortProof], `New/Spanning/RemainingTerms/Denominators.lean`
(`New.Filling.HasCellRank.linearIndependent_mkQ_frameImage_and_sup_eq`),
`New/Spanning/RemainingTerms/BorderedDeterminant.lean` (`New.Filling.HasCellRank.subframeMinor_ne_zero`)

### 4.2 Orthogonal lifts and the lattice of a link

*Origin:* particular to this proof: the discriminant of the lattice that `Λ_c` induces in the link of a term, and of
its sublattice `L⁺_γ` of vectors whose part in `A` is divisible by `M`, bounded by the minor and the gauge.

*Method of the formal proof:* a basis of the link lifts to vectors orthogonal to `A` and `γA` whose first columns span
`I_γ` (orthogonal lifts), isometric to the basis for the link metric after a correction along `z` and `γz`. Adjoin
two vectors `z', z''` of norm `N` to the unimodular lattice `(Λ ∩ I^⊥)/(Λ ∩ I)`. The lattice of the link is then the
orthogonal complement of the isotropic lists `(e_a, z + z')` and `(γe_a, γz + z'')`, `a < j`, whose Gram determinant
is `|δ_*|²` (4.1). Jacobi's identity gives (a), and the divisibility by `M` costs at most `M^(2if)` for (b).

Let `S` be filling data over a stably unramified `E`, `γ` a term over `(c, s, c')` of cell rank `j`, `i = min(ϱ, j)`,
`k = k_γ`, and let the columns of a rational matrix `v` be a basis of `link(γ)`. The *link discriminant* `d_link` of a
lattice in `link(γ)` is the discriminant (1.1) of its image in `X₀ ⊥ Ez⁺` (taken for the form of `X₀ ⊥ Ez⁺`, in
which `z⁺` has norm `N`) under `(y₀ + λ'z, y₀' + λz) ↦ y₀ + λz⁺`. A
column has an *integral lift* if it is the image under `t ↦ (class of t, class of γ⁻¹t)` of a vector of `Λ_c` that is
an adelic combination of rational vectors orthogonal to `A` and `γA`. It has a *level lift* if moreover the part of
that vector in `A` is divisible by `M`; such columns span `L⁺_γ`.

(a) The indices `i_j(k)`, `i_j(k⁻¹)`, `t(k)` are finite. There is `e ∈ GL(𝔸_f)` such that the columns of `ve` have integral
lifts and `d_link(ve)²·(i_j(k)·i_j(k⁻¹)·t(k))² ≤ minor_j(γ)²`.

(b) There is `e ∈ GL(𝔸_f)` such that the columns of `ve` have level lifts and
`t(k)²·d_link(ve)² ≤ (M^(2if)·𝗀♯_j(γ)/N^f)²`.

*Needs:* 1.1, 2.4, 4.1, SecondMomentsOfPoincareSeries §4.2 (links), §4.5 (the link isometry), ShortGRH background
(Jacobi's identity over `Ô ⊂ 𝔸_f` with an added block: let `J` be a unimodular hermitian matrix, `F` an integral
matrix and `n` a primitive matrix with `FᴴJn = 0`, the numbers of columns of `F` and `n` adding up to the size of `J`;
let `p` be a matrix with `m` columns over `𝔸_f`, `c` a unit of `𝔸_f`, and `N` the Gram matrix `(F | p)ᴴJ(F | p)` with
`c` added on the diagonal of the block of `p`; let `F` have a left inverse over `𝔸_f` or `[det N] ≠ 0`; then every `u`
with `nᴴJu = 0` is `Fv` for some `v` over `𝔸_f`, and `[det N] = [det(nᴴ(J + c⁻¹Jppᴴ J)n)]·i²·[c]^m`, where `i` is the
index of the integral vectors in `{y : Fy integral}`; [ShortProof]
`Lib/General/NumberTheory/LatticeCovolumes.lean` (`New.Filling.jacobi_perp_discriminant`)).

[ShortProof], `New/Spanning/RemainingTerms/OrthogonalLifts.lean` (`New.Filling.exists_orthogonal_lift`,
`New.Filling.abs_norm_det_gram_eq_abs_norm_subframeMinor_sq`), `New/Spanning/RemainingTerms/LinkLattice.lean`
(`New.Filling.exists_lifts_linkDiscSq_le`, `New.Filling.exists_hasLevelLifts_linkDiscSq_le`)

### 4.3 The vectors `z⁺` and `Υ_γ⁻¹z⁺`

*Origin:* particular to this proof: the two vectors that represent the products with `z` and `γz` on a link, their
integrality on the lattice of the link, their orthogonal complement, and their Gram determinant.

*Method of the formal proof:* the products of `z⁺` and `Υ_γ⁻¹z⁺` with the image of `t` are the products of `t` with
`z` and `γz`. These are integral on `Λ_c` because the last two frame vectors of `k_γ` are integral. The Gram
determinant is a direct computation from the leading minors: it equals `N²𝗀/|D_j|²`.

Let `S` be filling data and `γ ∈ G(E)`.

(a) If `γ` is a term over `(c, s, c')`, the products of `z⁺` and `Υ_γ⁻¹z⁺` with the image in `X₀ ⊥ Ez⁺` of every
rational vector of `Λ_c` orthogonal to `A` and `γA` are integral.

(b) The vectors of `X₀ ⊥ Ez⁺` orthogonal to both are exactly `X₀ ∩ Υ_γ⁻¹X₀`. A vector `v ∈ X₀` is the image of a
rational vector of `Λ_c` orthogonal to `A` and `γA` whose part in `A` is divisible by `M` (so `v ∈ L⁺_γ`), and lies in
`X₀ ∩ Υ_γ⁻¹X₀`, if and only if `v ∈ Λ_c` and some rational vector of `v + M(Λ_c ∩ A)` is orthogonal to `γf`.

(c) If `γ` has cell rank `j` and `𝗀(γ) = 0`, the two vectors are proportional. If `𝗀(γ) ≠ 0`, they are independent and,
for `E` stably unramified, `∏_v |Φ_v det Gram(z⁺, Υ_γ⁻¹z⁺)| = N^f·Nm𝗀(γ)/𝗀♯_{ϱ+1}(γ)`.

*Needs:* 2.4, 4.2, SecondMomentsOfPoincareSeries §4.2 (links), §4.5 (the link isometry).

[ShortProof], `New/Spanning/RemainingTerms/LinkVectors.lean` (`New.Filling.linkVectors_mulVec_perpToPositive_mem`,
`New.Filling.linkVectors_mulVec_eq_zero_iff`, `New.Filling.exists_lift_mem_linkedX₀_iff_exists_orthogonal`,
`New.Filling.HasCellRank.exists_linkIsometry_symm_eq_smul`, `New.Filling.linearIndependent_linkVectors_and_prod_norm_det`)

### 4.4 Splitting a link along a second link

*Origin:* particular to this proof: the passage from the lattice `L⁺_γ` of a link to the part of `L_γ` in the space
common to two links, at the cost of the torsion index and a principal minor of the Gram matrix of `z⁺, Υ_γ⁻¹z⁺`.

*Method of the formal proof:* a basis of `link(γ)` is taken in three orthogonal parts: the kernel of the two `z`-forms in
the intersection of the links, the rest of the intersection, and a complement. The squared link discriminant (4.2 (b))
is the product of those of the three graded pieces. The cut to `X₀(γ, γ')` costs a principal minor of the Gram matrix of
4.3, in three cases by its rank. For two terms over one block, `k_γ k_γ'^(−1) ≡ 1` modulo `M` on `Λ_c`, which makes the
form `M⁻¹·diag(T, −T)` integral on pairs of lifts.

Let `S` be filling data over a stably unramified `E`, `γ` a term over `(c, s, c')` of cell rank `j` with `s` agreeing,
`γ' ∈ G(E)`, and `x ≤ meet(s)` a natural number with `x = 1` unless `j = ϱ + 1` and `link(γ) = link(γ')`.

(a) The part of `L_γ` in `X₀(γ, γ')` is a lattice of rank `dim X₀(γ, γ')`. There are a complement `C` of
`link γ ∩ link γ'` in `link γ`, of dimension `c⁺(γ, γ')`, and a lattice in `C` whose basis vectors, moved along
`link γ ∩ link γ'`, have integral lifts, with
`(t(k_γ)·d(part of L_γ in X₀(γ, γ'))·x)²·d_link(lattice in C)² ≤ 𝗀*_j(γ)²`.

(b) `dim(link γ ∩ link γ') ≤ dim X₀(γ, γ') + 1 + max(0, j − ϱ)`, with equality `dim X₀(γ, γ') + 2` when `j = ϱ + 1`
and the links are equal.

(c) Let `γ` and `γ'` be terms over the same `(c, s, c')`, and let `Q = diag(1, …, 1, −N)` be the Gram matrix of
`X₀ ⊕ Ez`. The form `M⁻¹·diag(Q, −Q)` on `(X₀ ⊕ Ez)²` takes integral values on a column with an integral lift for `γ`
paired with a column with an integral lift for `γ'`.

*Needs:* 2.4, 4.2, 4.3, SecondMomentsOfPoincareSeries §4.2 (agreeing reductions), §4.10 (c) (meeting places).

[ShortProof], `New/Spanning/RemainingTerms/Cut.lean` (`New.Filling.nonempty_linkSplitting`,
`New.Filling.HasCellRank.finrank_link_inf_le`, `New.Filling.HasCellRank.finrank_link_inf_eq_add_two`,
`New.Filling.HasIntegralLifts.isIntMatrix_linkForm`)

### 4.5 The gain

*Origin:* particular to this proof: a bound for the discriminant of the common lattice of two terms over one block by
the geometric mean of their gauges, divided by a power of `M/2` when the links differ and by the meeting norm when they
agree.

*Method of the formal proof:* (a) descends from the lattice `L⁺_γ` of each link in three steps. Passing to the
intersection of the two links gains `(M/2)^(c⁺f)`: the pairing of 4.4 (c) is integral after division by `M` and bounded
at the infinite places. The cut (4.4) passes to `X₀(γ, γ')`. Passing to `L₁₂` costs at most the torsion index of the
other term, so the two torsion indices change places in the product. (b) bounds the minors of a near term at every
place.

Let `S` be filling data over a stably unramified `E`, `γ, γ'` terms over one `(c, s, c')` with `s` agreeing, of cell
ranks `j, j'`, and `x ≤ meet(s)` a natural number. Put `x̃ = x` if `j = ϱ + 1` and `c⁺(γ, γ') = 0`, and `x̃ = 1`
otherwise.

(a) `L₁₂` is a lattice of rank `dim X₀(γ, γ')`, `d₁₂ ≥ 1`, and
`(d₁₂·x̃)² ≤ (2/M)^(2c⁺(γ,γ')f)·𝗀*_j(γ)·𝗀*_{j'}(γ')`.

(b) If `S` is admissible and `γ` is near, then `𝗀*_j(γ) ≤ b^(n³f)`.

*Needs:* 1.1, 2.2, 2.4, 4.2, 4.4.

[ShortProof], `New/Spanning/RemainingTerms/Gain.lean` (`New.Filling.pairDiscriminant_sq_le`,
`New.Filling.one_le_pairDiscriminant`, `New.Filling.isLatticeOfRank_pairLattice`, `New.Filling.IsNear.levelGauge_le`)

## Layer 5: Counting, and the sum of the remaining terms

### 5.1 Moves between frames of near terms

*Origin:* particular to this proof: near terms are determined by their frames modulo moves, the vectors shared by the
two frames of a near term are short, and two frames with the same products and shared vectors whose `A`-parts are
congruent modulo `M·det(YY^*)` are joined by a move.

*Method of the formal proof:* at boxed points the frames are uniformly independent, so the coefficients of shared vectors
are bounded by the adjugate of the padded leading block `Y`, and a short vector of `Λ_c ∩ X₀` is `0`. A difference of
frames of the form `M·det(YY^*)·X` is `Mσ P` for an integral skew-hermitian `σ`, and the unipotent element with matrix
`σ` is the move. Every row `η` of vectors of `Λ_c ∩ X₀` gives a move subtracting `Mη` times the isotropic rows from the
part in `X₀`. A lattice `L ⊂ L_γ` lifts linearly to vectors orthogonal to the frame, and two lifts differ by a rational
row.

Let `S` be admissible and `E` stably unramified. A *move* for `c` is an element of `U⁰_c`.

(a) If `γ` has cell rank `j` and is near, the coordinates along `e₁, …, e_ϱ` of the vectors that `f` and `γf` share
(the columns `l ≥ j` of `γf·adj Y`, `Y` the first `j` rows of `Z(γ)` completed by rows of the identity) have absolute
value at most `b^(182n²)` at every infinite place.

(b) Let `u, u' ∈ U⁰_c`, and let `p = (c', γ)` and `p' = (c'', γ')` be near representatives over blocks `(c, ·, c')`
and `(c, ·, c'')`, each with a cell rank, of the same label. If `uγ` and `u'γ'` have the same frame, then `p = p'`.

(c) If `Z(γ) = Z(γ')` is integral with `D_j ≠ 0`, the shared vectors agree, the frames agree off `A`, and their parts in
`A` differ by `M·det(YY^*)` times an integral matrix, then some `u ∈ U⁰_c` has `uγf = γ'f`.

(d) For every `κ × ϱ` matrix `η` with columns in `Λ_c ∩ X₀ ∩ E^κ` there is a move that changes the part in `X₀` of every
frame by `−M·η·(isotropic rows of Z)`. Let `γ, γ'` have cell rank `j` and the same integral matrix `Z` of frame
products. If the parts in `X₀` of their frames are congruent modulo `M·D_j(γ)·(Λ_c ∩ X₀)`, they differ by
`M·η·(isotropic rows of Z)` for such an `η`.

*Needs:* 2.2, 2.3, 2.4, 4.1.

[ShortProof], `New/Spanning/RemainingTerms/FrameCount.lean` (`New.Filling.HasCellRank.norm_sharedVectors_le`,
`New.Filling.IsNearTermAt.eq_of_frameImage_eq`, `New.Filling.exists_mem_classUnipotent₀_frameImage_mul_eq`),
`New/Spanning/RemainingTerms/FrameParts.lean` (`New.Filling.exists_framePartX₀_mul_eq_sub_smul`,
`New.Filling.HasCellRank.exists_framePartX₀_sub_eq`, `New.Filling.exists_isLift`)

### 5.2 Frames over a lattice of small discriminant

*Origin:* particular to this proof: few frames of near terms, modulo moves, have a term lattice containing a given
lattice of small discriminant.

*Method of the formal proof:* after the cell rank and the integral matrix of products are fixed (boundedly many by
5.1 (a) and 2.2), the frames are sorted in three rounds: by the lift of `L` (5.1 (d)), by the part in `X₀`, which is
determined modulo `M·δ` and the lattice of `L^⊥`, and by the part in `A`, which 5.1 (c) fixes modulo moves. Each
round is counted by a colouring argument.

Let `S` be admissible and `E` stably unramified, `c` a class, `r + l = k`, and `L ⊂ Λ_c ∩ X₀` a lattice of rank `r` with
`d_r(L) ≤ b^(n³f)`.

(a) Let `B` be a set of near terms `(c', γ)` over blocks `(c, s, c')` (any `s`), each with a cell rank, whose frames are
pairwise inequivalent under moves: if `uγf = u'γ'f` for moves `u, u'` and `(c', γ), (c'', γ') ∈ B`, then
`(c', γ) = (c'', γ')`. Let `L ⊂ L_γ` for all of them. Then `#B ≤ b^(2000n⁶(l+1)f)`.

(b) For every label `t`, at most `b^(2000n⁶(l+1)f)` near representatives `(c', γ)` with a cell rank and label `t` have
`L ⊂ L_γ`.

*Needs:* 2.2, 2.4, 5.1.

[ShortProof], `New/Spanning/RemainingTerms/FramesOverLattice.lean` (`New.Filling.IsFrameSet.encard_le`,
`New.Filling.encard_setOf_isNearTermAt_and_le_termLattice_le`)

### 5.3 Sums over lattices of given corank and small discriminant

*Origin:* particular to this proof: the sum of `d(L)^(−k)` over all classes and all lattices of given corank and
discriminant at most `b^(n³f)` in the lattices of the classes is at most `τ^(l+1)n_X N^(−kf)`.

*Method of the formal proof:* the sum over the classes is an average over the translates of a unimodular lattice by the
cosets of the subgroup of the stabiliser of the standard lattice that keeps the lattice of the class. By the standing
hypotheses there are at least `(N^k/b)^f` such cosets. The lattice of a class is cut out of the unimodular lattice by a
linear form modulo the idele above `N`. If `L` has index `i` in the saturation of its span, the form vanishes on `L`
for at most `i·N^(fl)` of the cosets. The sum over sublattices of finite index is bounded by 1.1 (c), and the sum over
the subspaces of codimension `l` by the height zeta function 1.2 (b).

Let `S` be admissible and `E` stably unramified, and let `r + l = k`. Then
`Σ_c Σ_L d_r(L)^(−k) ≤ τ^(l+1)·n_X/N^(kf)`, the inner sum over the lattices `L ⊂ Λ_c ∩ X₀` of rank `r` with
`d_r(L) ≤ b^(n³f)`.

*Needs:* 1.1, 1.2, 2.3, SecondMomentsOfPoincareSeries §4.1 (the filling data and its standing hypotheses).

[ShortProof], `New/Spanning/RemainingTerms/LatticesOfCorank.lean` (`New.Filling.sum_discriminant_inv_le`)

### 5.4 The sum over pairs of near terms

*Origin:* particular to this proof: the count of near pairs over agreeing blocks, weighted by the inverse `k`-th power
of the discriminant of their common lattice.

*Method of the formal proof:* a near pair has a common label, and its common lattice lies in the term lattices of both
terms. Each pair is charged to its common lattice and its label. By 5.2 (b) each lattice carries at most
`b^(2000n⁶(l+1)f)` terms of each label. The sum over lattices is 5.3. The powers of `b` are absorbed into `τ` because
`k ≥ 1000(2ϱ + 2)⁹`.

Let `S` be admissible, `E` stably unramified, and `l ≤ n³`. Then
`Σ_{c,c'} Σ_{(γ,γ')} d₁₂^(−k) ≤ τ^(l+2)·n_p`, the inner sum over the near pairs over agreeing blocks `(c, ·, c')` whose
common lattice has corank `l` and `d₁₂ ≤ b^(n³f)`.

*Needs:* 2.4, 4.5, 5.2, 5.3.

[ShortProof], `New/Spanning/RemainingTerms/Count.lean` (`New.Filling.sum_pairDiscriminant_inv_le`,
`New.Filling.sum_pairDiscriminant_inv_le_tsum`)

### 5.5 The remaining terms

*Origin:* particular to this proof: the remaining terms of the second moment are negligible against the identity term,
the pairs of terms being sorted by their links and by the discriminant `𝗀`, with gains from the level `M` and from the
places where the reduction meets the frame.

*Method of the formal proof:* expand the square of a block over pairs of pieces (one piece per link, one for `𝗀 = 0`).
The diagonal pieces with `𝗀 ≠ 0` are kept. Every other product is bounded by 3.5 by products of sizes of near
representatives. The sizes are compared with the discriminant of the common lattice through the gain (4.5) and summed by
corank through the count (5.4). For different links the gain `(M/2)^(c⁺f)` beats `𝒟_main/𝒟_id ≤ (M/b⁶)^(kf)`. For equal
links with `𝗀 = 0` both terms have cell rank `≤ ϱ` and the size uses `τ^(−16)𝒟_id`. For equal links with `𝗀 ≠ 0` the
corank is at most `1` and the meeting norm `z` is gained.

Let `S` be admissible and `E` stably unramified. Two terms are *in the same link class* if `𝗀` vanishes for neither and
their links are equal.

(a) `Σ_{c,c'} Σ size(γ)·size(γ') ≤ b^(−kf)𝒟_id`, the inner sum over the near pairs `(γ, γ')` over agreeing blocks
`(c, ·, c')` that are not in the same link class.

(b) Let `z ≥ 1` be a natural number. `Σ_{c,c'} Σ size(γ)·size(γ') ≤ (b^(2f)/z)^k·𝒟_main`, the inner sum over the near pairs over agreeing
blocks `(c, s, c')` in the same link class with `meet(s) ≥ z`.

(c) *Reduction to one link.* Let `Ω ⊂ Ḡ` and `w ≥ 0`. If `𝖤_link({𝗀 ≠ 0}, Ω) ≤ wν²`, then
`𝖤(A♭_{Γ*}, Ω) ≤ w + b^(−kf)𝒟_id`.

(d) *One link at a time.* Let `z ≥ 1` be a natural number with `meet(s) ≥ z` for all `s ∈ Ω`. Then
`𝖤_link({𝗀 ≠ 0}, Ω) ≤ (b^(2f)/z)^k·𝒟_main·ν²`.

*Needs:* 2.1, 2.4, 3.5, 4.5, 5.4, SecondMomentsOfPoincareSeries §4.10 (c) (meeting places), §4.12 (the remaining terms).

[ShortProof], `New/Spanning/RemainingTerms/Sum.lean` (`New.Filling.sum_termSize_mul_not_inSameLinkClass_le`,
`New.Filling.sum_termSize_mul_inSameLinkClass_le`, `New.Filling.secondMoment_remainingTerms_le`,
`New.Filling.linkSecondMoment_le_of_le_meetNorm`)

## Layer 6: A sieve over all places

### 6.1 Sieve systems

*Origin:* particular to this proof: a list of conditions for a sieve at a place or a product of places, made of forms on
pairs of sequences, each form the integral of the next over a common entry, and its stability under finite products.

*Method of the formal proof:* the product is checked factor by factor: Fubini for the recursion and the twisted integrals,
Schur's product theorem for positivity, and products of the local bounds. Positivity and lower semicontinuity of the
sums in (b) descend from the top form, which is positive semidefinite and continuous, by integration over the common
entry, with Fatou's lemma for the semicontinuity.

Let `C` be a commutative ring with a measure, `U` a topological space, `u : C → U`, `ι : U → C`, `ψ : C → ℂ`, `n ∈ ℕ`,
`E_n ∈ ℝ`, weights `Λ_i(p) ∈ ℝ` and a decay `β : C → ℝ`. A family of forms `J_i(p, q) ∈ ℂ`, `0 ≤ i ≤ n + 1`, on pairs of
sequences `p, q : ℕ → U` (*heads*) is a *sieve system* if:

- `ψ(0) = 1`;
- for `i ≤ n`, with both heads given the entry `u(c)` at position `i`, `c ↦ ψ(ξc)·J_{i+1}` is integrable; its integral is
  `J_i(p, q)` for `ξ = 0`, and has modulus at most `β(ξ)Λ_i(p)Λ_i(q)` for `ξ` a unit;
- `J_{n+1}` is jointly continuous, and positive semidefinite on any finite family of heads with a common entry at
  position `n`;
- `|J_0(p, q)| ≤ E_n`;
- for `i < n`, if `ξ = ι(p_i) − ι(q_i)` is a unit, then `|J_{i+1}(p, q)| ≤ β(ξ)Λ_{i+1}(p)Λ_{i+1}(q)`.

(a) *Products.* Let `J` be a sieve system on `C` (with an s-finite measure) and, for each `v` in a finite set, `J^v` a
sieve system on `ℂ` with entry map `c ↦ c` on units and `1` at `0`, twist `c ↦ exp(c − c̄)` and the same `n`. The map
back `ι'` and the weights `Λ'` are the same for all `v`; the forms, mass bounds and decays may depend on `v`. Then the
products `∏_v J^v_i(p_v, q_v)·J_i(p_C, q_C)` form a sieve system on `ℂ^v × C`. Its entry map is `c ↦ c` on units and
`1` at `0` at each `v`, and `u` on `C`; its map back is `ι'` at each `v` and `ι` on `C`; and its twists, mass bounds,
weights and decays are the products of those of the factors.

(b) For `i ≤ n` and a finite family `P` of heads, `c ↦ Σ_{p,q∈P} J_{i+1}(p with u(c) at i, q with u(c) at i)` is
integrable, with integral `Σ_{p,q} J_i(p, q)` and twisted integrals, for every unit `ξ`, bounded by
`β(ξ)(Σ_p Λ_i(p))²`. For every `i ≤ n` and every finite family of heads with a common entry at position `i`, the sum
`Σ_{p,q} J_{i+1}(p, q)` is real and nonnegative. If moreover `C` carries a first-countable topology and the heads
depend on a parameter `x ∈ C`, with a common entry at position `i` for each `x`, the real part of this sum is lower
semicontinuous at every `x` where every head is continuous.

*Needs:* none.

[ShortProof], `New/Spanning/MainTerm/SieveSystem.lean` (`New.SieveSystem`, `New.SieveSystem.pi`,
`New.SieveSystem.integrable_and_integral_sum_update`, `New.SieveSystem.sum_nonneg`,
`New.SieveSystem.sum_nonneg_and_lowerSemicontinuousAt`)

### 6.2 Sums over frequencies

*Origin:* particular to this proof: an explicit bound, exponential in the degree only, for the sum over the elements of a
totally complex field of the inverse cube of a height.

*Method of the formal proof:* the numbers with a given denominator ideal `𝔟` lie in `N𝔟` cosets of `𝒪_E`. Each coset is
counted by squares of side `1/2` at every infinite place, on which the weight is comparable to its value at a corner.
The sum over `𝔟` of `N𝔟^(−2)` is at most the Euler product `ζ_E(2) ≤ exp(2[E:ℚ])`.

Let `E` be a totally complex number field with `f` infinite places. For `ν ∈ E` let `𝔡(ν) = {a ∈ 𝒪_E : aν ∈ 𝒪_E}`.

(a) For every finite `X ⊂ E`, `Σ_{ν∈X} ∏_v max(1, |Φ_v ν|)^(−6)·N(𝔡(ν))^(−3) ≤ (64·38·e⁴)^f`.

(b) Let `S` be filling data, `T` a finite set of finite places, `O_T` the integers of `E_T`, `k ∈ ℕ`, `1 ≤ B`, and
`c ∈ ℂ^{places}`, `x ∈ ℝ^{places}` with `|c_v|^(−1) ≤ |x_v| ≤ B`. For every finite set `X` of nonzero `T`-integers of
`E`, `Σ_{y∈X} (∏_v ρ_k(|c_vΦ_v y|^(−1)))·[y]_T^(k/2)/[O_T : O_T ∩ y⁻¹O_T]³ ≤ ∏_v (|x_v|^k·(bB²)³)`, where
`ρ_k(r) = r^k·min(1, r)⁶` and `[y]_T` is the generalised index at `T`. Both products are over the infinite places `v`
of `E`; on the right the factor `(bB²)³` is inside the product, so the bound is `(bB²)^{3f}·∏_v |x_v|^k`.

*Needs:* none.

[ShortProof], `New/Spanning/MainTerm/Frequencies.lean` (`New.sum_height_inv_cube_le`),
`New/Spanning/MainTerm/GlobalSieve.lean` (`New.Filling.sum_frequencies_le`)

### 6.3 One-sided Poisson summation at the infinite places and a finite set of primes

*Origin:* adapted from Poisson summation on the adeles of a number field (AnalyticNumberTheoryPartII §5.3h): here, a one-sided
inequality for a nonnegative integrable function on `ℂ^{places} × E_T` that is lower semicontinuous at finitely many
rational points integral off `T`, with the frequencies bounded through the decay of its Fourier transform.

*Method of the formal proof:* the function is extended to the adeles by the indicator of the integers off `T` and
scaled at infinity. Its transform at `y/ϖ` vanishes unless `y` is a `T`-integer, and is then a constant times the
transform of `F` at the corresponding frequency. One-sided Poisson summation on the adeles of a totally complex field
then applies.

Let `S` be filling data, `T` a finite set of finite places, `E_T = ∏_{w∈T} E_w` with integers `O_T` and the Haar
measure in which `O_T` has volume `1` (integrals on `ℂ^{places} × E_T` are for Lebesgue measure on each `ℂ` times this
measure), and `ψ_T` the character `x ↦ ψ_f(−x/ϖ)` read at `T`; let `χ(x) = ∏_v exp(x_v − x̄_v)·ψ_T(x_T)` on `ℂ^{places} × E_T`. For
`r ∈ (0, ∞)^{places}` and `t ∈ E` let `P_r(t) = ((r_vΦ_v t)_v, t ∈ E_T)`. Let `V ⊂ E^×` be finite with all `t ∈ V`
integral off `T`. Let `F ≥ 0` be integrable and lower semicontinuous at the points `P_r(t)`, `t ∈ V`. Let `B₀ ≥ 0` and
`β` satisfy `|∫ χ(ξx)F(x) dx| ≤ β(ξ)·B₀` for every unit `ξ`, and let `ε` bound every finite sum of
`β(P_{r'}(y))` over nonzero `T`-integers `y`, where `r'_v = 2πi/(Φ_v(ϖ)r_v)`. Then
`Σ_{t∈V} F(P_r(t)) ≤ (vol(Ô)/∏_v r_v²)·(εB₀ + ∫F)`.

*Needs:* AnalyticNumberTheoryPartII §5.3h (Poisson summation on the adeles; the self-dual measure), ShortGRH background
(one-sided Poisson summation on the adeles of a totally complex field `E`, for the measure in which `𝔸_E/E` has mass
one: if `F ≥ 0` is integrable and lower semicontinuous at the points of a finite set `T` of rational points, and `S`
bounds every finite sum of `|F̂(ξ)|` over `ξ ∈ E`, then `Σ_{t∈T} F(t) ≤ S`; [ShortProof]
`Lib/Adelic/Adeles/StrongApproximation.lean` (`New.IsDualFamily.sum_le_of_fourier`)).

[ShortProof], `New/Spanning/MainTerm/GlobalSieve.lean` (`New.Filling.sum_ratPoint_le_mul_add_integral_of_fourier_le`)

### 6.4 The sieve over all places

*Origin:* particular to this proof: an inequality of large sieve type with leading constant near one, for the product of
a sieve system at each infinite place and one at a finite set of primes read at rational heads, proved one entry at a
time by one-sided Poisson summation.

*Method of the formal proof:* the product of the systems is a sieve system on `ℂ^{places} × E_T` (6.1 (a)). Let the
`i`-th density sum be the sum over heads with the first `i` entries in `A` and a common last one. Each density sum is
bounded by the one before times the Poisson constant, plus an error. One-sided Poisson summation (6.3) in the common
entry gives the main part. The frequency sums (6.2) bound the error, as do the heads with different last entries,
through the last condition of 6.1. Iterating over the `n` entries gives the product of the Poisson constants times the
mass bound plus `2nΓε`.

Let `S` be admissible, `T` a finite set of finite places, `A ⊃ U` finite subsets of `E^×` with `t` and `t⁻¹` integral
off `T` for `t ∈ A`, and `M⁻¹` integral off `T`. Put `κ_v = MΦ_v(ϖ)/(2πi)`, `λ_{v,i} = κ_v^(2(ϱ−i))/N`, `P_i = vol(Ô)/∏_v λ_{v,i}²`, and
`C_decay = ∏_v c_𝔰·(|κ_v|^(2ϱ+1)/(MN))^(k−n⁷)`, where `c_𝔰 = π^((2ϱ+1)k)·vol U(k)/vol U(r)` is the constant `Θ_𝔰` of
the local bounds of the Bessel systems (SecondMomentsOfPoincareSeries §3.3). Let `J_T` be a
sieve system on `E_T` in length `ϱ`. Its entry map is `x ↦ x` on units and `1` otherwise, and `ι(w) = M⁻¹w⁻¹`. Its
twist is `ψ_T` and its mass bound `mass_T`. Its weights are `Λ_i(p) = ∏_{l<i} [δ_l]^(n⁶/2)` when the partial products
`δ_l = p_0⋯p_l` are integral, and `0` otherwise. Its decay is `ξ ↦ [ξ]^((k−n⁷)/2)/[O_T : O_T ∩ ξ⁻¹O_T]³·b^(n⁹f)`. For
`p ∈ A^ϱ` and `t ∈ U`, let `a = (p_0, …, p_{ϱ−1}, t, 1, 1, …)`. The head at `v` has the entries `λ_{v,i}Φ_v(a_i)` for `i ≤ ϱ` and
`1/N` for `i > ϱ`; all are nonzero. The head at `T` has the images of the `a_i`. Let `J^v_n` be the top band-limit forms of the
Bessel systems at the infinite places, which form sieve systems on `ℂ` with mass at most `(1 + b^(−10))/deg_v`. Then

`Re Σ_{t∈U} Σ_{p,q∈A^ϱ} ∏_v J^v_n(heads of p, q at v)·J_{T,n}(heads of p, q at T) ≤ (∏_{i<n} P_i)·((∏_v (1 + b^(−10))/deg_v)·mass_T + b^(2403n⁹f)·C_decay)`.

*Needs:* 6.1, 6.2, 6.3, SecondMomentsOfPoincareSeries §3.3 (Bessel systems at the real places: the band-limit forms, a
sieve system on `ℂ` at each infinite place), §4.1 (the filling data and its standing hypotheses).

[ShortProof], `New/Spanning/MainTerm/GlobalSieve.lean` (`New.Filling.sieve`, `New.Filling.densitySum_le`,
`New.Filling.boundsDecay_prod`)

## Layer 7: From class sums to local integrals

### 7.1 The orbital integral at the finite places is a Kloosterman sum

*Origin:* adapted from Kloosterman integrals as orbital integrals of Bessel functions on unipotent double cosets
(Jacquet and Ye (1999)): here, for the finite Bessel vector of a group between the principal congruence subgroup and
the integral points at a finite place.

*Method of the formal proof:* the orbital integral of the tensor of the finite Bessel vector unfolds over the cosets of
`𝖴 ∩ K(M)` in `𝖴` on both sides. The finite Bessel function is the character of `𝖴` on `uK(M)` and vanishes off
`𝖴K(M)`, so only the pairs with `u⁻¹xu' ∈ sK(M)` contribute, each with the volume of `K(M)`.

Let `F` be a place datum at a finite place in the sense of PairsOfFramesAtOnePlace §2.2 (place data at a finite place),
coming from the lattice of integral vectors (*large lattice data*: unimodular form, integral basis and level, large rank,
character trivial on traces, unimodular group), with principal congruence subgroup `K(M)` and Haar measure `μ`. Let `χ`
be the finite Bessel function, `ψ_𝖴(u)` on `uK(M)` for `u ∈ 𝖴` and `0` off `𝖴K(M)`. For `x ∈ G` and an integral point `s`
the *Kloosterman sum* is `Kl(x, s) = Σ ψ_𝖴(u)·conj ψ_𝖴(u')` over the pairs of cosets `u, u' ∈ 𝖴/(𝖴 ∩ K(M))` with `u⁻¹xu' ∈ sK(M)`. Let `Z` be
a group between `K(M)` and the integral points, and `W_a(y) = χ(ya⁻¹)` for the cosets `a` of `K(M)` in `Z`. If
`s⁻¹ab⁻¹ ∈ K(M)`, then `∫ W_a(y)·conj W_b(x⁻¹y) dμ(y) = μ(K(M))·Kl(x, s)`.

*Needs:* PairsOfFramesAtOnePlace §2.2 (place data at a finite place), §5.1 (large lattice data), §5.2 (the finite Bessel
function and the Bessel vector of an intermediate group).

[ShortProof], `New/Spanning/MainTerm/KloostermanSum.lean`
(`New.Floors.IntegralPlace.IsLargeLatticeData.besselOrbitalIntegral_besselVector_apply`,
`New.Floors.PlaceData.kloostermanSum`)

### 7.2 The completions at a finite set of primes

*Origin:* particular to this proof: the passage between the finite adeles and the completions at a finite set `T` of
places, and the place datum at `T` that the filling data induce.

*Method of the formal proof:* the given finitely many elements are units at almost all places. The density of `E` in the
finite adeles (strong approximation off `T`) lifts points of `T` to points integral off `T`, inside `𝖴` and `U(X₀)`
through their parametrisations. The place datum is built from the lattice of integral vectors, and the unitary group
over `E_T` is shown to be unimodular.

Let `S` be filling data over a field `E` that has Weil data, `T` a finite conjugation-stable set of
finite places, `E_T` the product of the completions at `T` with integers `O_T`.

(a) For every finite `T₀ ⊂ E^×` there is such a `T` off which the elements of `T₀` and their inverses, `M⁻¹`, `N⁻¹`, and
the lattice basis and its inverse are integral.

(b) Every `y ∈ G(E_T)` is the projection of some `x ∈ G(𝔸_f)` integral off `T`, with `x ∈ 𝖴` if `y ∈ 𝖴` and
`x ∈ U(X₀)` if `y ∈ U(X₀)`.

(c) If `u` is a finite idele with `u⁻¹` integral off `T`, then `x` is integral and `≡ 1` modulo `u` if and only if `x` is
integral off `T` and its projection to `T` is integral and `≡ 1` modulo the projection of `u`.

(d) `E_T` is a finite place, in the sense of PairsOfFramesAtOnePlace §2.1 (a), with character `ψ_T`, and `G(E_T)` is unimodular.
There is a place datum on `E_T` with `3ϱ + 6` further hyperbolic pairs and an orthonormal part of size
`k − (6ϱ + 13)`. It is large lattice data, its modulus is the component of `M` at `T`, and its character is `ψ_T` (a
*filling datum at `T`*).

*Needs:* PairsOfFramesAtOnePlace §2.1 (finite places), §5.1 (large lattice data); AnalyticNumberTheoryPartII §5.3h,
AdelicUnitaryGroupsAndAlgebraicModularForms §2.3 (strong approximation for the adeles of a totally complex field `E`: for a nonempty set `S` of
finite places, the sums of an element of `E` and an adele that vanishes at infinity and at the finite places outside
`S` are dense in the adeles); DivisibilityOfThetaDerivatives §1.4 (c) (Weil data).

[ShortProof], `New/Spanning/MainTerm/FillingLevel.lean` (`New.Filling.exists_places_integralOff`,
`New.Filling.exists_isIntegralOff_toPlaces_eq`, `New.Filling.mem_unitaryLevel_iff`, `New.Filling.exists_integralPlace`,
`New.Filling.isMulLeftInvariant_haar_inv`, `New.Filling.exists_isFillingData`)

### 7.3 Class sums as orbit sums, and unfolding at a set of primes

*Origin:* particular to this proof: a block of the terms of one link is a finite sum of orbit sums over the Weyl cells
of heads with entries in a fixed finite set, and each orbit sum is a Kloosterman sum at `T` times an orbital integral at
the infinite places.

*Method of the formal proof:* a contributing term `γ₀` is written `u₀⁻¹w_{p₀}σu₀'` in the big cell, and all contributing
terms of the same link are among the `uw_pσu'⁻¹`, each once. The nonzero leading minors of a term with nonzero cut
amplitude are bounded integers, so the entries lie in a finite set. Each orbit sum unfolds, double coset by double coset,
into one integral at infinity. The double cosets correspond to the pairs of the Kloosterman sum at `T` (7.1).

Let `S` be admissible over a CM field that has Weil data, and let `𝒯 ⊂ E^×` be the finite
set of quotients of two nonzero integers `δ` with `|Φ_vδ|² ≤ b^(270n²)` at every `v`. For `p : ℕ → E^×` let `w_p ∈ G(E)`
send `e_a ↦ p_a e*_a` and `e*_a ↦ e_a/p̄_a` for `a < ϱ` and fix the other basis vectors. Let `σ` range over the elements
that fix the `ϱ` hyperbolic pairs. For a block `(c, s, c')` and `γ`, the *orbit sum* `O(γ)` is the sum of the amplitudes
of `uγu'⁻¹` over the pairs `u, u' ∈ 𝖴(E)` for which `uγu'⁻¹` lies over `(c, s, c')`.

(a) Let the elements of `𝒯` be units off `T`, let every term over `(c, s, c')` have `D_0, …, D_ϱ ≠ 0`, and let the cut
block of the terms with `𝗀 ≠ 0` and link `Λ` be nonzero. Then there are `t ∈ 𝒯`, `σ` and `k ∈ K` such that: `σ` fixes
the hyperbolic pairs; `t = h(z, σz)` with `|Φ_vt|² > N²` at every `v`; `Λ = link(w_1σ)`; `h_c⁻¹σh_{c'}` is integral off
`T`; `k̄ = s`. Moreover the block equals `Σ_{p∈𝒯^ϱ} O(w_{(p,t)}σ)`.

(b) Let `F` be a filling datum at `T` with `M⁻¹` integral off `T`, `B` a subgroup of `G(𝔸_f)`, and `μ` an s-finite measure
on `G(E_T)`. Suppose `μ` is carried by the projections of elements of `B` integral off `T`, and is invariant under right
translation by the projection of every element of `B`. Then the order of the image of `B ∩ K` in `Ḡ` times
`μ(K(M)_T)` is `μ(G(O_T))`.

(c) Let `F`, `T` be as in (b). For `γ = w_pσ` with `p_a⁻¹` integral off `T` (`a < ϱ`) and `h_c⁻¹γh_{c'}` integral off
`T`, and `k ∈ K`, the orbit sum of `γ` over `(c, k̄, c')` is `Kl(x, s)` (7.1, at `T`) times the orbital integral at
infinity `∫ W(y) ⊗ W(γ⁻¹y)^* dy`, for `W` or `W♭`. Here `x` and `s` are the projections to `T` of `h_c⁻¹γh_{c'}` and of
`k`. Hence, for a group `Z` between `K(M)_T` and the integral points at `T` and cosets `a, b` of `K(M)_T` in `Z` with
`k⁻¹ab⁻¹ ∈ K(M)_T` (`k` read at `T`): the entry `(a, b)` of the scaled orbital integral `𝒪_Z(q, l⁻¹)` at `T`
(PairsOfFramesAtOnePlace §6.2), with `q` the image of `p` at `T` and `l` the projection to `T` of `h_c⁻¹σh_{c'}`, times
this orbital integral at infinity, is the head density `κ_ϱ(q, 1)` times the measure of `K(M)_T` for the Haar measure
of `F` (7.1) times the orbit sum.

*Needs:* 7.1, 7.2, SecondMomentsOfPoincareSeries §4.2 (terms, amplitudes, blocks and links), §4.5 (the link isometry),
PairsOfFramesAtOnePlace §6.2 (the scaled orbital integral), §3.2 (the head density); DivisibilityOfThetaDerivatives
§1.4 (c) (Weil data).

[ShortProof], `New/Spanning/MainTerm/GlobalToLocal.lean` (`New.Filling.exists_amplitudeSum_eq_sum_cosetAmplitude`,
`New.Filling.IsFillingData.card_reducedImage_mul_measure_congruenceSubgroup_eq`,
`New.Filling.IsFillingData.cosetAmplitude_eq_kloostermanSum_smul`,
`New.Filling.IsFillingData.scaledOrbitalIntegral_smul_eq_cosetAmplitude`)

### 7.4 Siegel's formula as an upper bound

*Origin:* adapted from Siegel's main theorem (Siegel (1935); Shimura (1997)): here, an upper bound, with the factor
`1 + b^(−6)`, for the sum over the classes and the rational vectors of given norm of a test function at `T`. It is
bounded by its integral over the sphere at `T`, times the archimedean density and the Siegel constant.

*Method of the formal proof:* the density of a test function that is `Ψ` at `T` and the indicator of the lattice off `T`
splits into an integral of Gauss sums of the lattice times the density of `Ψ` at `T`. The Gauss sums are bounded by
`1 + b^(−6)` times the volume of the lattice. Siegel's formula as a class sum then gives the bound.

Let `S` be admissible over a CM field that has Weil data, with `M⁻¹` and `N⁻¹` integral off
`T`, and `F` a filling datum at `T` (7.2 (d)). Let `Ψ ≥ 0` on `E_T^r` have compact support and be invariant under small
translations and under the elements of `K(M)_T` that fix all basis vectors off `X₀`. Let `t ∈ E` with `|Φ_v t| > N` at
every `v`. For a pair `z = (c, v)` with `v ∈ E^κ` let `x_z = g_c⁻¹v`, and `P_t(x) = x − N⁻¹t·(last frame vector)`. If the
pairs `z` of a finite set `𝔖` have `N·h(v, v) = tt̄ − N²` and `x_z` integral off `T`, then

`Σ_{z∈𝔖} Ψ(P_t(x_z) at T) ≤ (1 + b^(−6))·n_X·c_S·(∏_v (|Φ_vt|² − N²))^(k−1)·mod(π_T)^(−1)·∫ Ψ(P^T_t(y)) dμ_t(y)`.

Here `π_T` is the component of `π` at `T` and `mod(π_T)` its modulus at the finite place `E_T`. `P^T_t` is `P_t` at `T`,
with `π_T` and the image of `t`. The integral is over the sphere `h(y, y) = (tt̄ − N²)/N` in `E_T^κ`, for the fiber
measure `μ_t` of PairsOfFramesAtOnePlace §6.1.

*Needs:* 7.2, HermitianFormsAndLattices §6.5 (Siegel's main theorem), PairsOfFramesAtOnePlace §6.1 (fiber measures of the
standard form on spheres); DivisibilityOfThetaDerivatives §1.4 (c) (Weil data).

[ShortProof], `New/Spanning/MainTerm/SiegelTopBound.lean` (`New.Filling.IsFillingData.siegel_sum_le_lintegral_sphere`,
`New.Filling.IsFillingData.enorm_normDensity_le_mul_lintegral_normFiberMeasure`)

### 7.5 Domination of class sums by the density at the last entry

*Origin:* particular to this proof: the squared norms of the orbit sums of the terms with one last entry are dominated
by the density at the last entry at `T`, weighted by the Gram matrix of the archimedean orbital integrals.

*Method of the formal proof:* the classes are grouped by the point of Siegel's sum (the class and the `X₀`-part of
`σz`). On each point the positive part of the real part of the sum of the fiber pairings against the Gram matrix is a
compactly supported invariant step function. Siegel's formula (7.4) then sums over the points, and the integral over
the sphere of `t` is the density at the last entry.

Let `S`, `T`, `F` be as in 7.4, the lattice basis integral off `T`, and `Z` a group between `K(M)_T` and the integral
points at `T`. Let `(c_i, c'_i, k̄_i, σ_i)`, `i ∈ I`, be distinct, `I` finite and nonempty. Suppose `σ_i` fixes the
hyperbolic pairs,
`h(z, σ_iz) = t` with `|Φ_vt| > N` at every `v`, `h_{c_i}⁻¹σ_ih_{c'_i}` is integral off `T`, and the projection of `k_i`
lies in `Z`. Let `J` be finite and `a_p`, `p ∈ J`, heads with entry `t` at `ϱ` and earlier entries units off `T`. Let `R` be the Gram
matrix of the vectors `ρ_p·∫ W(y) ⊗ W((w_{a_p}σ_i)⁻¹y)^* dy` (the same for every `i`), with `W` or `W♭`, and let
`ρ_p·(head density of a_p at T) = r·(∏_v (|Φ_vt|² − N²))^((k−1)/2)`. Then

`Σ_i r²·‖Σ_p O_{c_i,k̄_i,c'_i}(w_{a_p}σ_i)‖² ≤ (1 + b^(−6))·a_*·Re Σ_{p,q} R_{pq}·J^Z_top(a_p, a_q)/m(Z)`,

where `J^Z_top` is the density at the last entry at `T` and `m(Z)` the mass ratio of `Z` (PairsOfFramesAtOnePlace §6.3, §5.2 (b)).

*Needs:* 7.3, 7.4; PairsOfFramesAtOnePlace §3.2 (floor forms), §6.3 (the density at the last entry), §5.2 (mass ratios);
DivisibilityOfThetaDerivatives §1.4 (c) (Weil data).

[ShortProof], `New/Spanning/MainTerm/SiegelTopBound.lean`
(`New.Filling.IsFillingData.sum_mul_norm_sum_cosetAmplitude_sq_le_lastEntryDensity`,
`New.Filling.IsFillingData.exists_step_sum_fiberPairing`)

### 7.6 The sieve system at the finite places

*Origin:* particular to this proof: the floor forms and the density at the last entry at `T`, normalised by the mass
ratio of a group that contains the reductions fixing given vectors, form a sieve system whose mass saves `b^(−6k)` at
each such place.

*Method of the formal proof:* the group `Z` and the bound for the floor of order `0` come from the small mass integral
of groups fixing given vectors at chosen places. The recursion is the descent of the floors below the top and the
integral of the density at the last entry at the top. Positivity and continuity of the top form, and the off-diagonal
bound, come from the local theory.

Let `S` be admissible over a CM field that has Weil data, `F` a filling datum at `T` with
`M⁻¹` integral off `T`, `𝔖g` a set of chosen places above `p₀`, and for each such place `w` a nonzero vector `D_w` of
the span of the frame modulo `w` or its conjugate. For a group `Z` between `K(M)_T` and the integral points at `T`,
consider the properties (a), (b) and (c) below. There is such a group `Z` with (a) and (b), and there is such a group
`Z` with (a) and (c).

(a) `Z` contains the projection to `T` of every `k ∈ K` whose reduction fixes `D_w` for all `w ∈ 𝔖g`.

(b) The forms `J_j = (floor form j of the Bessel vector of Z)/m(Z)` for `j ≤ ϱ` and
`J_{ϱ+1} = (density at the last entry at the prime above N)/m(Z)` form a sieve system (6.1) on `E_T` in length `ϱ`. Its
entry map is units, `ι(w) = M⁻¹w⁻¹`, its twist is `ψ_T` and its weights and decay are those of 6.4. Its mass bound is
`(1 + b^(−6))/b^(6k·#𝔖g)`.

(c) `0 ≤ J_0(p, q) ≤ (1 + b^(−6))/b^(6k·#𝔖g)` for all heads `p, q`, with `J_0` the form of order `0` of (b).

*Needs:* 6.1, 7.2; PairsOfFramesAtOnePlace §3.2 (floor forms), §6.3 (the density at the last entry), §5.2 (mass ratios),
§5.4 (shells, decay and the mass at the finite places), §7.2 (groups fixing given vectors at chosen places have a small
mass integral); DivisibilityOfThetaDerivatives §1.4 (c) (Weil data).

[ShortProof], `New/Spanning/MainTerm/FiniteSieveSystem.lean` (`New.Filling.IsFillingData.exists_intermediateGroup_sieveSystem`,
`New.Filling.IsFillingData.exists_intermediateGroup_norm_floorForm_div_le`)

## Layer 8: The main term and the bad share

### 8.1 The main-term bound

*Origin:* particular to this proof: one upper bound for the main term of the second moment over the open reductions that
fix given vectors, with the factor `(1 + b^(−4))·b^(−6k·#𝔖g)`.

*Method of the formal proof:* every term over an open reduction lies in the big cell, so a nonzero block of one link
is a sum of orbit sums (7.3 (a)). Distinct blocks give distinct tuples `(c, c', k̄, σ)`. The finite set `T` is chosen so
that the entries are units off it (7.2 (a)). Siegel's step (7.5) bounds the squared norms by the densities at the last
entry. The sieve (6.4), with the system of 7.6 at `T` and the band-limit systems at infinity, bounds these. The
standing hypotheses evaluate the constant: `a_*` against `𝒟_main` and the Poisson constants, and the error
`b^(2403n⁹f)C_decay` against `b^(−4)`.

Let `S` be admissible over a CM field `E` that has Weil data, `𝔖g` a set of chosen places
above `p₀`, and `D_w` for each chosen place `w` above `p₀` a nonzero vector of the span of the frame modulo `w` or its
conjugate. Call `s ∈ Ḡ` *open* if at some chosen place `w` above `p₀` the leading principal minors of order `≤ ϱ` of the
matrix of products of the frame with its image under `s_w` are nonzero. Let `Ω` be the set of open `s` that fix `D_w`
for every `w ∈ 𝔖g`. Then

`𝖤_link({γ : 𝗀(γ) ≠ 0}, Ω) ≤ (1 + b^(−4))·b^(−6k·#𝔖g)·𝒟_main·ν²`.

*Needs:* 2.1, 6.4, 7.2, 7.3, 7.5, 7.6, SecondMomentsOfPoincareSeries §4.1 (the group `Ḡ` and reduction at the chosen
places), §4.10 (d) (the fixers of frame vectors at the chosen places); DivisibilityOfThetaDerivatives §1.4 (c) (Weil
data).

[ShortProof], `New/Spanning/MainTerm/EnergyEstimate.lean` (`New.Filling.linkSecondMoment_isOpenElement_le`,
`New.Filling.sum_norm_sum_cosetAmplitude_sq_le`)

### 8.2 The share of non-allowed polynomials and the bad share

*Origin:* adapted from the counts of squarefree, irreducible and primitive polynomials over a finite field (Lidl and
Niederreiter (1983), ch. 3), and from the degree formula for the irreducible characters of `GL_r(𝔽_q)` (Green (1955)): here, a bound for the coefficient at the
identity of one minus the sum of the idempotents of the good tuples of labels.

*Method of the formal proof:* a monic polynomial that is not allowed has a square factor or a root that is `0` or an
`M`-th root of unity, which bounds their number. There are at least `φ(q^r − 1)/r` primitive polynomials, and
`m ≤ φ(m)(2 log m + 1)`. Each good tuple contributes at least `∏_w (1 − r/q)/q^r` to the coefficient at the identity, by
the degree bound for the characters of labels. Allowed tuples weigh at least `(1 − ε)^f`, those with no primitive label
at most `exp(−u)^f`.

Let `k_w`, `w` in a set of `f` elements, be fields with `q` elements, `n` a set of `r` elements, and `M ≥ 1`. A *label*
of degree `r` over `k_w` (in this section only; not the label of a term of 2.4) is a monic squarefree polynomial of
degree `r` with nonzero constant term. It is *allowed* if it has no root `x ∈ k_w` with `x^M = 1`, and *primitive* if it is irreducible with a root of order `q^r − 1`. A tuple of
labels is *good* if every label is allowed and some label is primitive. For a label `c` let `e_c = Σ_g (Ξ_c(1)/|G|)·conj Ξ_c(g)·g`
in `ℂ[GL_n(k_w)]`, with `Ξ_c` the character attached to `c` by Green's theory, for a fixed injective character of the
multiplicative group of an algebraic closure of `k_w`. For a tuple, `e_{(c_w)} = ⊗_w e_{c_w}` in
`ℂ[∏_w GL_n(k_w)]`.

(a) At most `(1 + M + r)q^(r−1)` monic polynomials of degree `r` over `k_w` are not allowed. For `1 < r < q` and
`(1 + M + 2r)/q ≤ ε`, the allowed ones weigh at least `1 − ε` when each polynomial has the weight `(1 − r/q)/q^r`.

(b) For `r ≥ 1`, `φ(q^r − 1) ≤ r·#{primitive polynomials of degree r}`. For `1 < r < q`, the monic polynomials of degree
`r` that are not primitive weigh at most `exp(−1/(2r(2r log q + 1)))` for the same weights.

(c) For `1 < r < q`, `(1 + M + 2r)/q ≤ ε ≤ 1` and `2r(2r log q + 1)·L ≤ f`, the coefficient at the identity of
`1 − Σ_{good tuples} e_{(c_w)}` has real part at most `fε + exp(−L)`.

*Needs:* FiniteReductiveGroups §5.7 (a squarefree label `c` of degree `r` carries one irreducible character `Ξ_c` of
`GL_r(𝔽_q)`, with central idempotent `e_c` and degree `ψ_r(q)/∏_O ψ_1(q_O)` over the irreducible factors `O` of `c`;
this gives the bound `Ξ_c(1)²/|GL_r(𝔽_q)| ≥ (1 − r/q)/q^r` that is used).

[ShortProof], `New/Spanning/MainTerm/BadTypes.lean` (`New.card_not_isAllowedPolynomial_le`,
`New.one_sub_le_card_allowed_mul`, `New.totient_le_mul_card_isPrimitivePolynomial`, `New.card_not_primitive_mul_le`,
`New.re_coeff_one_sub_sum_tupleIdem_le`)

## Downstream consumers

- SecondMomentsOfPoincareSeries §4.13 uses 3.6 (b) (from the Bessel function to its cut) and 5.5 (c), (d) (the bound
  for the remaining terms); its §4.14 uses 8.1 (the main-term bound) and 5.5 (d); its §5.7 uses 8.2 (c) (the bad
  share); its §3.3 reads the local bounds of a Bessel system as a sieve system (6.1); its Conventions take the value
  of `vol(Ô)` of 6.3 and 6.4.
- PairsOfFramesAtOnePlace uses 6.1 (sieve systems), 7.2 (the completions at a finite set of primes and filling data
  at `T`), and names 7.1, 7.3 and 7.5 as the uses of its local estimates.

## Scope and ownership

### Owned here

- Lattices in the finite adeles, their discriminants and sums over sublattices; Siegel's lemma (Layer 1).
- The link second moment, the existence of residue domains and the bounds at boxed points, the lattice of a class,
  and the data of a term (Layer 2).
- The orbit bound by Schur's test, and the passage from the Bessel function to its cut (Layer 3).
- The gain of a term (Layer 4), the count of near terms and the bound for the remaining terms (Layer 5).
- Sieve systems, sums over frequencies, one-sided Poisson summation at a set of places and the sieve over all places
  (Layer 6).
- The passage from class sums to local integrals (Layer 7), the main-term bound and the bad share (Layer 8).

### Not owned here

- Filling data, terms, amplitudes and blocks, residue domains, reduced and boxed points, near terms, cell ranks, links,
  the second moment of a family of blocks, and the remaining terms `Γ*`: SecondMomentsOfPoincareSeries.
- Place data, large lattice data, the finite Bessel vector, scaled orbital integrals, fiber measures and the density
  at the last entry: PairsOfFramesAtOnePlace.
- Weil data of a CM field: DivisibilityOfThetaDerivatives §1.4.
- The entries marked ShortGRH background: stated in the form used on the *Needs:* lines, and not targets of this
  roadmap.

## Exact supplier contracts

### From SecondMomentsOfPoincareSeries

§3.1 (the group at a real place, the Bessel length, the frame box, leading minors), §3.2 (the Gram–Schmidt frame),
§3.3 (Bessel systems, cut pairs, the band-limit forms), §3.12 (b), §3.13 (the open cell bounds), §4.1 (filling data,
the lattice basis and the standing hypotheses), §4.2 (classes, terms, amplitudes, blocks, the second moment, residue
domains, reduced and boxed points, links, agreeing reductions), §4.3 (a), §4.4 (cell ranks and near terms), §4.5 (the
link isometry), §4.6 (reduced points), §4.9 (a), §4.10 (c), (d), §4.12 (the remaining terms), §5.5 (the filling data of the data).

### From PairsOfFramesAtOnePlace

§2.1 (finite places), §2.2 (place data), §3.2 (floor forms and the head density), §5.1 (large lattice data), §5.2 (the
finite Bessel function, mass ratios), §6.1 (fiber measures), §6.2 (the scaled orbital integral), §6.3 (the density at
the last entry), used in Layers 7 and 8.

### From other roadmaps

- AnalyticNumberTheoryPartII §5.3h (Poisson summation on the adeles; the self-dual measure), for 6.3 and 7.2.
- FiniteReductiveGroups §5.7 (the character and the central idempotent of a squarefree label, with its degree), for
  8.2.

## References

- `[ShortProof]`: the folder `grh` of <https://github.com/lsernau/grh-lean> at commit
  `72fead102f663d5c7a407964a13dc0cf9d977207`; this roadmap covers `src/New/Spanning/RemainingTerms` and
  `src/New/Spanning/MainTerm`.
- E. Bombieri, J. Vaaler, *On Siegel's lemma*, Invent. Math. 73 (1983).
- J. A. Green, *The characters of the finite general linear groups*, Trans. Amer. Math. Soc. 80 (1955).
- H. Jacquet, Y. Ye, *Germs of Kloosterman integrals for GL(3)*, Trans. Amer. Math. Soc. 351 (1999).
- R. Lidl, H. Niederreiter, *Finite Fields* (1983), ch. 3.
- G. Shimura, *Euler products and Eisenstein series*, CBMS Regional Conference Series in Mathematics 93 (1997).
- C. L. Siegel, *Über die analytische Theorie der quadratischen Formen*, Ann. of Math. 36 (1935).

The sources are those named in the heads of the files of `[ShortProof]` that this roadmap covers; its `REFERENCES.md`
says which citations were compared with their sources.
