# Roadmap: congruence modules of theta lifts

**Summary.** A chain of theta lifts between definite unitary groups produces, at each step `j`, lattices of algebraic
modular forms on the definite group `U(V_j)` with values in the dual Weyl lattice of a coefficient representation, and in
them the *lifted subspace* spanned by the eigensystems of the model lifts. This roadmap measures how far the projection of
such a lattice onto the lifted subspace is from an honest lattice, at a place `𝔭` above a prime `ℓ`: by the length `η_j(𝔭)`
of the congruence module between lifted and other eigensystems, and by the exponent between the Weyl and dual Weyl lattices. It bounds the congruence modules through the Galois representations of the
forms, a Ribet-type argument with local defects at the places above `ℓ`, and an anticyclotomic twist chosen at every
twisted place; it bounds the Weyl exponent by weight elimination.

The headline theorems are these. (1) Under the size conditions of the chain, for a good twisting datum, a thick set of
length `L_th ≤ C_L·log x` satisfying the depth hypothesis, and a host field `E` whose twisted Tate–Shafarevich groups
`Ш¹(E, ℓ, e)`, `0 < e < t`, are finite with total `V(E, t) ≤ κ_W·x^ε·B₀`, the weighted sum `Σ_𝔭 ϱ(𝔭)e_𝔭η_j(𝔭)` over the
twisted places is at most `d^Z_j·(C + κ_W)·x^ε·B₀`, where `C` depends only on constants fixed before `ε` and `d^Z_j` is the
dimension of the good part of the forms on the model group `U(W_j)`. For the parts of a level at the type primes the same
bound holds with the congruence lengths and the dimension of the level parts; at the base level the factor is the
dimension `D_0` of the base-level row space, the level at which [FormalProof] states the bound. (2) At every twisted place `𝔭 | ℓ` and for every
`ε′ > 0` there is an
anticyclotomic character `ψ` of `ℓ`-power order, ramified at a bounded number of places of degree one, such that for the
`ℓ`-adic lattices `T_s` attached to the good eigenforms on `U(W_j)` every Bloch–Kato Selmer group of `T_s ⊗ ψ^{m′}`, `m′` prime
to `ℓ`, has length at most `v_ℓ(w_{tr}(E)) + ε′`, the tame cost of `ψ` is at most `ε′`, and finitely many prescribed
polynomial conditions hold at the roots of unity defining `ψ`. (3) At a lifted point `π` whose residual representation has an absolutely irreducible rank-`r`
part, the congruence ideal `c(π)` of the cut by the type satisfies `v(c(π)) ≤ length Sel(W) + Σ_{0<e<t} length Ш¹(E, ℓ, e) + v_ℓ(h_E) + t·Σ_{v∈Q} v(χ_1(ς_v) − 1)`
plus explicit local defects at the places above `ℓ`, which vanish above a threshold and off a finite exceptional set. (4) If
a crystalline `ℓ`-adic representation of `G_E` with Hodge–Tate weights given by a dominant weight `μ` reduces to
`ρ̄′ ⊕ χ̄_0 ⊕ ⋯ ⊕ χ̄_{t−1}` with crystalline characters in the block of weights of `λ`, then the depth of `μ` below `λ` above the
block is at most an explicit `i_W(ℓ, τ)` at every embedding `τ`.

The roadmap rests on ThetaChainsOnDefiniteUnitaryGroups and RowTowerAndRallisIdentities, which supply the data of the
chain, the levels, the twisting data and the model lifts with their good labels; on
BaseChangeAndGaloisRepresentationsForUnitaryGroups and AutomorphicGaloisRepresentationsPartII for the Galois
representations of definite unitary groups and their local behaviour; on SelmerLengthBoundsAndLocalLifting and
LengthBoundsInPadicFamilies for twist selection, the local lifting theorems with loss and the Ribet-type bounds with
defects; on PadicHodgeRegulators, whose §1.5 states the dimension formula of Bloch and Kato, of which the dimension
bounds of 7.7d are a corollary; and on UniformWildKernelBounds, whose budget bound gives the wild-kernel budget on the host fields of the chain.
Its total bound and its lattice statements are used by GluedTargetAndDivisionInequality and
ThetaChainsAndFrobeniusPrimeSums.

The roadmap has one layer, Layer 7 below. It defines the congruence lengths of a step, attaches Galois representations
to the forms, characterises the lifted eigensystems and proves residual irreducibility from the types at the two type
primes; it then proves the Ribet-type bound with its local defects, selects the twist, and assembles the bound prime by
prime and in total; it ends with the dual index of the projected lattice and weight elimination.

## Conventions

Notation and conventions that are not restated here are those of ThetaChainsOnDefiniteUnitaryGroups (its Conventions and
Layers 2–3), RowTowerAndRallisIdentities (Layer 5) and FrobeniusRestrictedRieszSums (Layer 0), sub-roadmaps of this family.
Layer and section numbers follow the numbering shared by the sub-roadmaps of this family that build the chain
(ThetaChainsOnDefiniteUnitaryGroups has Layers 2–3, RowTowerAndRallisIdentities Layer 5); Layer 7 is divided with
GluedTargetAndDivisionInequality, which has its §§7.12–7.14, so a number absent from this layer is not a missing section.

**Fields.** `E` is the host (FrobeniusRestrictedRieszSums §0.1): finite abelian over `ℚ` with an imaginary quadratic subfield `K`; `F = E⁺` its
maximal totally real subfield, `f = [F:ℚ]`; `c ∈ G = Gal(E/ℚ)` complex conjugation; `f_E` the conductor of `E` (the conductor
of a primitive character `χ` is `f_χ`); `h_E` the class number of `E`. Under `SplitRamification d` (FrobeniusRestrictedRieszSums §0.3) `K` is
ramified only at the prime `d`; on the cyclic hosts (FrobeniusRestrictedRieszSums §0.4) `d ≡ 7 (mod 8)`, `K = ℚ(√−d)`, and a second imaginary
quadratic field `ℚ(√−q) ⊂ E` is used; `(q, d)` is the *auxiliary pair*. `𝕃` is the coefficient field of
ThetaChainsOnDefiniteUnitaryGroups §2.6: a number field containing `E`, Galois over `ℚ` and totally complex, with the conjugation `c_𝕃` of
ThetaChainsOnDefiniteUnitaryGroups §2.6. Its finite places are written `𝔭`, with ramification index `e_𝔭` and weight `ϱ(𝔭) = log N𝔭/[𝕃:ℚ]` (so
`Σ_{𝔭|p} ϱ(𝔭)e_𝔭 = log p`).

**CM type, places and Frobenius elements.** An embedding `ι₀ : E ↪ ℂ` is fixed; `Φ = Gal(E/K)` is identified with the CM
type `{ι₀∘g : g ∈ Φ}` induced from `K` (`|Φ| = f`). Elements of `Φ` are called places. In the Galois groups of abelian
fields Frobenius elements are arithmetic (`Frob_p` acts as `x ↦ x^p` on residue fields), and at a ramified prime the
Frobenius datum is the coset of the inertia group (FrobeniusRestrictedRieszSums §0.2). On a cyclic host `G = A × ⟨c⟩ × ⟨σ_d⟩`
(FrobeniusRestrictedRieszSums §0.4 (iv)), and an element `g ∈ G`, read through its place `pl(g)` (FrobeniusRestrictedRieszSums §0.6), is a *letter*. The Galois
representations of the layer below use the geometric normalisation of the paragraph on Galois representations.

**Primes of the construction.** The *type primes* `g₀, g₁` (ThetaChainsOnDefiniteUnitaryGroups §2.7) carry the depth-zero types; the *auxiliary primes*
`p_δ, p′_δ` carry the characters `δ, δ′` (ThetaChainsOnDefiniteUnitaryGroups §§2.4, 2.7); the primes `q, d` form the *auxiliary pair* (FrobeniusRestrictedRieszSums §0.4), and are not
called auxiliary primes. The *twist places* `Q(ξ)` of a tuple `ξ` of twisting characters are its full ramification set
(ThetaChainsOnDefiniteUnitaryGroups §2.5). The *twisted places* `Tw` form a finite `c_𝕃`-stable set of places of `𝕃` above the admissible twisting
characteristics, fixed with the twisting datum (ThetaChainsOnDefiniteUnitaryGroups §2.5), outside which the tuple `ξ_𝔭` used is the base tuple; sums
"over the twisted places" run over `Tw`.

**Definite unitary groups and class sets.** Hermitian forms are conjugate-linear in the first variable. Definiteness is
that of HermitianFormsAndLattices: a space is *totally definite* if its form has one sign at every real place (the sign may
depend on the place); a *definite unitary group* is the unitary group of a totally definite space. The model spaces `V_j`
are totally positive definite (ThetaChainsOnDefiniteUnitaryGroups §2.2). On `U(V)(𝔸_f)` the stabiliser of the chosen self-dual lattice has volume `1`;
for totally definite `V`, `∫_{[U(V)]} φ = Σ_𝒸 |Γ_𝒸|^{−1} φ(g_𝒸)` over the classes `𝒸` (representatives `g_𝒸`, stabilisers `Γ_𝒸`).

**Petersson products.** For algebraic modular forms with values in an algebraic representation `V_λ`:
`⟨φ, φ′⟩ = Σ_𝒸 |Γ_𝒸|^{−1}⟨φ(𝒸), φ′(𝒸)⟩_λ`, with `⟨,⟩_λ` the invariant Hermitian form normalised by `⟨v_λ, v_λ⟩ = 1` on
the product of leading minors `v_λ` of the polynomial model of ThetaChainsOnDefiniteUnitaryGroups §3.1 (it lies in both lattices `Δ_ℤ ⊂ ∇_ℤ`).

**Galois representations and wild kernels.** The Galois representations of this roadmap follow
AutomorphicGaloisRepresentationsPartII: Artin reciprocity sends uniformizers to geometric Frobenius elements, and the
cyclotomic character `χ_cyc` has Hodge–Tate weight `−1`. A Hecke character `μ_j` of `E` (ThetaChainsOnDefiniteUnitaryGroups §2.4; the same for `η̃`, `δ`,
`δ′`) has the value `μ_j(𝔓)` at a prime `𝔓` of `E` prime to its conductor, its value at a uniformizer of `E_𝔓`; its
`ℓ`-adic Galois character takes the value `μ_j(𝔓)` at the geometric Frobenius of `𝔓`, and for a character of finite order
it is the inverse of the character that the arithmetic normalisation above attaches to it. For a number field `M`, a prime
`ℓ` and an integer `e ≥ 1`, `Ш¹(M, ℓ, e)` is the group of classes in `H¹(𝒪_M[1/ℓ], ℚ_ℓ/ℤ_ℓ(−e))` unramified outside `ℓ` and
trivial at the places above `ℓ`, and `V(M, t) = Σ_ℓ log ℓ Σ_{1≤e<t} length Ш¹(M, ℓ, e)`, as in
BernoulliBoundsForClassGroupEigenspaces §6.17; the roadmap uses them for `M = E`.

**Indices of the chain.** Step `j` is the column lift `U(X_{j−1}) → U(X_j)` with Hecke character `μ_j` and step weight
`w_j = e_{j−1}` (ThetaChainsOnDefiniteUnitaryGroups §2.3), the row descent `U(Y_j) → U(Y_{j−1})`, and the model lift `θ_j` between `U(V_j)` and `U(W_j)`
(RowTowerAndRallisIdentities §5.7). Columns grow by `t + 1`, rows by `t`. The dual pairs of the chain are in the normal form of
ThetaChainsOnDefiniteUnitaryGroups §§2.2a, 3.2.

**Characters and levels at the type primes.** For a type prime `g ∈ {g₀, g₁}` the prime `π_g𝒪_K` of `K` above `g` is
fixed, and for a place `v` of `F` above `g`, `w_v` is the place of `E` above `v` and `π_g` (residue field `𝔽_g`). The
*type characters* of step `j` are `χ_{v,j} := ω_g^{2j}` on `𝒪_{E_{w_v}}^×`, `ω_g` a fixed generator of the characters of
`𝔽_g^×`, the same for all `v | g` and all `j` (ThetaChainsOnDefiniteUnitaryGroups §2.4 (b)): squares, of depth zero, read as elements of `𝔽_g^×` through the
identification of ThetaChainsOnDefiniteUnitaryGroups §2.9a (its tame condition). The step character `μ_j` is tamely ramified there, with residue
`χ_{v,j}^{−1}` at `w_v` and `χ_{v,j}` at `w̄_v`. The levels of ThetaChainsOnDefiniteUnitaryGroups §2.9a carry these characters: on `U(V_j)` the character
`χ_{v,j}^{−1}` of the determinant of the `t`-block; the finite group `G₀` of ThetaChainsOnDefiniteUnitaryGroups §2.9a acts on the forms through the
upper left block of the level at the type primes. At the twist places the levels carry `c_v(det of the lower block)`,
`c_v = (ξ_{w_v}|_{𝒪^×})^{s}`, with exponent `+1` (ThetaChainsOnDefiniteUnitaryGroups §2.9c); the rule for all bad places is that of
ThetaChainsOnDefiniteUnitaryGroups §2.9 (the residues `c_{i,v}` of the step characters). The splitting character `η̃` and the twisting characters are
unramified at the type places, and `μ_j`, `δ`, `δ′` are unramified outside the *bad places* `S₀`, the places above
`g₀, g₁, p_δ, p′_δ` (ThetaChainsOnDefiniteUnitaryGroups §2.4 (b)).

**Routes.** The statements of this roadmap are those established by a complete formal proof ([FormalProof]); a target
whose form is this roadmap's own and not that of [FormalProof] says so. Where a route is not given, or not given in full,
the target says so in its route. A good twisting datum (7.10a) and a wild-kernel budget (7.11) are conditions on the
data; the targets that use them carry them as hypotheses.

**Quantifier order and sizes.** Constants named before `ε` do not depend on `ε`; the scale `x` and everything chosen at
it come after `ε`. Between them come the numbers that may depend on `ε`; among them the layer exponent `A_n`, a real number
in `[1, A_max]` with `A_max` a constant fixed before `ε`, which the size predicates of ThetaChainsOnDefiniteUnitaryGroups §2.1 take as an argument.
The size conditions are named predicates: those of ThetaChainsOnDefiniteUnitaryGroups §2.1, grouped into the host predicates `SizeA`, `SizeN`,
`SizeD`, `SizeRd`, `SizeQD`, `SizeInert`, `SizeDep` and the parameter predicates `SizeM`, `SizeK`, `SizeW`, `SizeMf`, `SizeT`,
`SizeTheta`, with their conjunction `Size(x, ε)`; and those named where their quantities are defined: `SizeSc`
(ThetaChainsOnDefiniteUnitaryGroups §2.3b), `SizeSep` (ThetaChainsOnDefiniteUnitaryGroups §2.3c), `SizeG` (ThetaChainsOnDefiniteUnitaryGroups §2.7), `SizeT_u` (ThetaChainsOnDefiniteUnitaryGroups §2.8) and `SizeThin` (7.6 (a)). "The size
conditions of ThetaChainsOnDefiniteUnitaryGroups §2.1" means `Size(x, ε)`; a target that uses a single predicate names it.

**Constants.** Exponents, the bound `t ≤ x^{C_t}` and the budgets are parameters with their true constraints; the exponents
written in the size predicates of ThetaChainsOnDefiniteUnitaryGroups §2.1 are fixed choices. `C` denotes absolute constants, except in
row 5 of 7.10a and in 7.10b, 7.10c and 7.11, where `C` may depend on the constants fixed before `ε` (`C_t`, `A_max`, and `C_L`
of 7.10c); `x₀` is a threshold of the scale.

### Table of symbols

| Symbol | Meaning | Defined |
|---|---|---|
| `E, F = E⁺, f, c, G, f_E` | host field, its maximal totally real subfield, `[F:ℚ]`, complex conjugation, `Gal(E/ℚ)`, conductor of `E` (of a primitive `χ`: `f_χ`) | FrobeniusRestrictedRieszSums §0.1, FrobeniusRestrictedRieszSums §0.2 |
| `h_E` | class number of `E` | Conventions |
| `K, d` | the imaginary quadratic subfield; the prime of `SplitRamification d` (`K = ℚ(√−d)` on the cyclic hosts) | FrobeniusRestrictedRieszSums §§0.1–0.3 |
| `Φ, ι₀, τ` | `Gal(E/K)` and the CM type it defines through `ι₀`; its elements, the places | FrobeniusRestrictedRieszSums §0.1 |
| `Frob_p` | arithmetic Frobenius | FrobeniusRestrictedRieszSums §0.2 |
| `σ_d` | the nontrivial element of the inertia group at `d` | FrobeniusRestrictedRieszSums §0.3 |
| `ψ, f_ψ` | primitive Dirichlet character, its conductor | FrobeniusRestrictedRieszSums §0.4 |
| `E_n(M, Q)` | dyadic host field | FrobeniusRestrictedRieszSums §0.4 |
| `(q, d)` | auxiliary pair | FrobeniusRestrictedRieszSums §0.4 |
| `A` | `Gal(E/ℚ(√−q, √−d)) ⊂ Φ` | FrobeniusRestrictedRieszSums §0.4 |
| `pl(g)` | the place of a letter `g` (`g` or `cg`) | FrobeniusRestrictedRieszSums §0.6 |
| `Φ_top, 𝒯, δ_th, u₀` | tops `Φ_top ⊂ A`, thick set `𝒯`, `\|𝒯\|/\|A\|`, a translate (thick places `cσ_d u₀𝒯`, thick letters `cσ_d u₀𝒯 ⊔ σ_d u₀𝒯`) | FrobeniusRestrictedRieszSums §0.6, FrobeniusRestrictedRieszSums §0.8a |
| `L_th` | length of the thick set | FrobeniusRestrictedRieszSums §0.8, FrobeniusRestrictedRieszSums §0.8a |
| `𝔭, e_𝔭, ϱ(𝔭)` | finite place of `𝕃`, ramification index, `log N𝔭/[𝕃:ℚ]` | Conventions |
| `Ш¹(E, ℓ, e), V(E, t)` | twisted Tate–Shafarevich groups, their total length | Conventions |
| `k, m, t, r, N_j` | base rank, chain length, rank step, `r = k + m − 1`, `N_j = k + j(t + 1)` | ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `x, ε, b, a, X′, b′, w″, X″` | scale, exponent, `e^{x^ε}`, `x·b`, `e^{x^{ε/3}}`, `a/X′`, `b′/(x\|A\|)`, `x\|A\|X′` | ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `B₀` | the budget `B₀ = fmbx^ε` | ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `Size(x, ε)` | conjunction of the host predicates `SizeA, SizeN, SizeD, SizeRd, SizeQD, SizeInert, SizeDep` and the parameter predicates `SizeM, SizeK, SizeW, SizeMf, SizeT, SizeTheta` | ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `SizeSc, SizeSep, SizeG, SizeT_u` | size predicates of the words, the separation, the type primes and the level primes | ThetaChainsOnDefiniteUnitaryGroups §2.3b, ThetaChainsOnDefiniteUnitaryGroups §2.3c, ThetaChainsOnDefiniteUnitaryGroups §2.7, ThetaChainsOnDefiniteUnitaryGroups §2.8 |
| `C_t, A_max` | constants fixed before `ε`: of `SizeT`, the bound of the layer exponent | ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `C_L` | the constant of the length bound `L_th ≤ C_L·log x` of the thick set, fixed before `ε` | 7.10c |
| `A_n` | the layer exponent of `SizeA` (`A_n ∈ [1, A_max]`), chosen after `ε` and before the scale | ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `W_j, V_j` | model spaces: rank `r`, signature `(k+j−1, m−j)`; totally positive definite of rank `r + t` | ThetaChainsOnDefiniteUnitaryGroups §2.2 |
| `v(τ), e′(τ), e(τ)` | Harish-Chandra data at `τ` shared by all words | ThetaChainsOnDefiniteUnitaryGroups §2.3 |
| `w_j(τ)` | step weights `e_{j−1}(τ)` (thick, top or thin) | ThetaChainsOnDefiniteUnitaryGroups §2.3 |
| `Sc` | cloud size | ThetaChainsOnDefiniteUnitaryGroups §2.3 |
| `(W7), η_s, D_*, ℓ*, ℓ_A` | the separation condition, separation width, thresholds | ThetaChainsOnDefiniteUnitaryGroups §2.3c |
| `μ_j, η̃, δ, δ′, o_δ` | Hecke characters of the chain, unramified splitting character, auxiliary characters and their inertial order | ThetaChainsOnDefiniteUnitaryGroups §2.4 |
| `χ_{v,j}, ω_g` | type characters `ω_g^{2j}` at the place `w_v` of `E` above `π_g` (the residue of `μ_j` there is `χ_{v,j}^{−1}`); the fixed generator of the characters of `𝔽_g^×` | ThetaChainsOnDefiniteUnitaryGroups §2.4 |
| `ξ, ξ_𝔭, Q(ξ), s, δ_ℓ` | tuple of twists (`ξ = 1` the base tuple), tuple used at `𝔭`, twist places (full ramification set), the sign of the twisted tuples (`s_j := s`), auxiliary character of `ℓ` | ThetaChainsOnDefiniteUnitaryGroups §2.5 |
| `A(ℓ), Q(ψ_𝔭)` | places of `E` above the auxiliary prime of `ℓ`; ramification set of the twist `ψ_𝔭` (`Q(ξ_𝔭) = A(ℓ) ⊔ Q(ψ_𝔭)`) | ThetaChainsOnDefiniteUnitaryGroups §2.5 |
| `Tw` | twisted places | ThetaChainsOnDefiniteUnitaryGroups §2.5 |
| `𝕃, c_𝕃` | coefficient field and its conjugation | ThetaChainsOnDefiniteUnitaryGroups §2.6 |
| `g₀, g₁; p_δ, p′_δ; 𝔅(N, g)` | type primes; auxiliary primes; the exceptional set of a type prime | ThetaChainsOnDefiniteUnitaryGroups §2.7 |
| `G₀` | finite group of the type primes | ThetaChainsOnDefiniteUnitaryGroups §2.9a |
| `θ_j` | model lift of step `j` | RowTowerAndRallisIdentities §5.7 |
| `η_j(𝔭), Z_good, V_good, d^Z_j` | congruence length, lifted good eigensystems, the lifted subspace, its dimension | 7.1, 7.5b, 7.10a |
| `M_j(𝔭)^P, V_good^P, mult^P, d^{Z,P}_j(𝔭), η^P_j(𝔭), d^{Z,P}_j; D_0` | the same for the level-`(P, χ_P)` parts; the dimension of the base-level row space | Layer 7, 7.1 (4), 7.8a |
| `X_s(π), c′(π)` | the cut by the label tuple of `π`, its congruence ideal | 7.1 |
| `ς, ς₀, ς_v, ς_w` | generators of tame inertia | Layer 7 |
| `Σ(𝔭), Exc` | the places above the type primes that are not above `ℓ`, together with `A(ℓ)`; the exceptional primes | Layer 7, 7.6 |
| `L = x^ε, h, e(ℓ), B, w_max; n_w, E_{w,0}; ν_w` | the notation of 7.8a–7.11 (`L` is not `L_th`); degree and maximal unramified subfield at a place `w \| ℓ`; the row defects of 7.7b | 7.8a |
| `s_w, K_w, f″_w; E′_w` | the cyclotomic level of `w` (`E_w ⊂ K_w(μ_{ℓ^{s_w}})`, `K_w` unramified of least degree), `f″_w = [K_w : E_{w,0}]`; `E′_w := E_wK_w` | 7.7b; 7.8a |
| `h_w` | `r·(2 + r·(2s_w + 2 + 2log_ℓ(4h)))`, the bound of the `H⁰` terms at a split row | 7.10a |
| `SizeThin`; the depth hypothesis | size predicate of the thin windows; for every prime `ℓ ≥ 11` some `j ≥ 0` with `(ℓ − 1)^j ≥ ℓ_A` and `2j + 2 ≤ L_th` | 7.6 (a); 7.10a |
| `ι_ℓ(τ), d_ℓ(τ), D_ℓ(τ, i), H_ℓ(i), c_W(τ, ℓ, i)` | the data and the exponent of the graded Pieri bound | 7.16a |
| `ℓ_𝔧, k_max, Exc_𝔧` | threshold, bound and excluded primes of weight elimination at step `j` | 7.16a (3) |
| `𝔧_j(𝔭), 𝔧_j(ℓ)` | Weyl exponent (an exponent of `ℓ`); the exponent of weight elimination at step `j` and its bound | 7.15, 7.16a (3) |
| `𝔠_s` | the carries | 7.16 |
| `κ_W` | the constant of the wild-kernel budget | 7.11 |

**Statements of the formal proof.** Where a target names [FormalProof], the form that proof establishes is recorded at the target: its
hypotheses, ranges and constants are those of the proof, including restrictions that the route written here does not
visibly use. A wider or sharper form stated beside it is this roadmap's own, proved by the route written here, and is not in
[FormalProof].

**Labels.** Under each section heading, `*Origin:*` says where its statement comes from and
`*Method of the formal proof:*` how [FormalProof] proves it. Every target 7.1–7.16a carries both labels. The first
sentence of 7.4 (8), the forms of (Row) and (TB) in 7.7b named there and the place-dependent form of 7.7b (ii), the
bound `4R` on the places of `Q` in 7.8 (2) and their splitting in `𝒢_M`, and the bound for the positive part in 7.15 (b)
are this roadmap's own formulations; [FormalProof] has the forms recorded with them.

**Corollaries of general theorems.** A section may carry, as a third line under these two labels, `*Corollary of:*`,
which names a general theorem and the roadmap section that states it, and the clauses it covers when it does not cover
the whole section. The general theorem is proved in the roadmap that states it, and what the line covers is deduced
from it. The proof of the Riemann hypothesis for Dirichlet L-functions needs only that case, not the general theorem in
full: the `*Method of the formal proof:*` label says how [FormalProof] proves it, and for which form of the statement
when that proof has a narrower one. Where the route given with the section is not the deduction, it is a second proof,
[FormalProof]'s unless the label says that it differs; the `*Needs:*` line lists what that route needs, and the
deduction needs the section that the `*Corollary of:*` line names.

## Layer 7: Congruence modules, twisting and weight elimination

The lattice projected from the integral forms on a definite group `U(V_j)` onto the lifted subspace has a covolume that
exceeds that of an honest lattice by the congruence modules between lifted and other eigensystems of the model lifts and
by a defect of self-duality (7.1, 7.15). The congruence modules are bounded through the Galois representations of the forms on the definite groups (7.4). The lifted eigensystems
are characterised by their parameters (7.5), the descent from a pole does not vanish (7.5a), and the lifts fill their
eigenspaces (7.5b); their residual representations are absolutely irreducible at every prime because of the types at the
two type primes (7.9). A Ribet-type bound with local defects (7.7a–7.7d) leaves a Selmer group, the class group, the
groups `Ш¹(E, ℓ, e)`, `0 < e < t`, and defects at the places above `ℓ`. Above a threshold `ℓ*` and off a finite
exceptional set the local condition at `ℓ` is exact (7.6); below it the defects are bounded by lifting theorems with
loss, and the character blocks at the rows by a bound for the classes cut out by a character (7.8a); at the type primes
the eigensystems are cut by the label tuple of each lifted point (7.1 (3)) and every block is bounded by pushouts of
finite classes (7.7b (ii)). An anticyclotomic twist of `ℓ`-power order, chosen at every twisted place, kills the Selmer
group up to an explicit invariant (7.8). The rows of the resulting bound, one for each kind of prime, are 7.10a, the
type primes 7.10b and the sum 7.10c; a wild-kernel budget turns the sum into the total bound (7.11). A
weight-elimination bound and a Hida-type inclusion control the exponent between the Weyl and dual Weyl lattices of the
forms (7.16, 7.16a). The general theorems belong to their owners: congruence modules and the Ribet-type bound with local
defects to PadicFamilies and LengthBoundsInPadicFamilies; the local theorem at `ℓ`, the lifting theorems with loss, the
bound for classes cut out by a character, the pushouts of finite classes and twist selection to SelmerIwasawaCohomology and
SelmerLengthBoundsAndLocalLifting; the Wach-lattice tools to PhiGammaModulesAndIwasawaCohomology and
WachLatticesOverTheCyclotomicTower. This layer verifies their hypotheses for the chain (the complementary residue is a
clause of 7.5a) and draws the consequences. The rows at the places where every letter is thick and the invariants at the
split rows are bounded by two local theorems of SelmerLengthBoundsAndLocalLifting (7.10a), and the exponents of weight
elimination at the parameters by 7.16a (3). The targets are listed in their logical order, so 7.9 comes before 7.6.

*Notation for this layer.* Fix a twisting datum (ThetaChainsOnDefiniteUnitaryGroups §2.5). A place `𝔭` of `𝕃` is *twisted* if `𝔭 ∈ Tw` (ThetaChainsOnDefiniteUnitaryGroups §2.5), that is if
`ξ_𝔭` is not the base tuple; then, `ℓ` being the residue characteristic of `𝔭`, `ξ_𝔭 = δ_ℓ·ψ_𝔭` with `δ_ℓ` the auxiliary
character of `ℓ` (`δ`, or `δ′` if `ℓ = p_δ`; it is unramified above `ℓ`) and `ψ_𝔭` of `ℓ`-power order (ThetaChainsOnDefiniteUnitaryGroups §2.5). Put

- `Σ(𝔭)`: the places of `E` above `g₀` and above `g₁` that are not above `ℓ`, together with the set `A(ℓ)` of the places
  above the auxiliary prime of `ℓ` (ThetaChainsOnDefiniteUnitaryGroups §2.5);
- `Q(ψ_𝔭)`: the places of `E` at which `ψ_𝔭` is ramified (ThetaChainsOnDefiniteUnitaryGroups §2.5: degree-one places above places of `F` split in `E`, disjoint
  from `Σ(𝔭)` and from the places above `ℓ`); so `Q(ξ_𝔭) = A(ℓ) ⊔ Q(ψ_𝔭)` is the set of twist places of `ξ_𝔭`.

For a twisted `𝔭 | ℓ` and a step `j`: `O` is the completion of `𝒪_𝕃` at `𝔭`, enlarged by a finite extension where
needed, and `K_O` its field of fractions; every length is normalised by `length(O/ℓ) = 1` (a length over a finite extension `O′` of `ℤ_ℓ` is divided by
the ramification index of `O′/ℤ_ℓ`), so `e_𝔭` times a normalised length is a length over the completion of `𝒪_𝕃` at
`𝔭`. `M_j(𝔭)` is the lattice of algebraic forms on `U(V_j)` for `ξ_𝔭` at the level of ThetaChainsOnDefiniteUnitaryGroups §2.9 for `V_j`, with values in
the dual Weyl lattice of the coefficient representation `𝒲_j` of RowTowerAndRallisIdentities §5.7, tensored with `O`. `𝕋` is the `O`-algebra
generated by the Hecke operators at the places `v` of `E` split over `F`, outside `Σ(𝔭) ∪ Q(ψ_𝔭)` and not above `ℓ`,
acting on `M_j(𝔭)`; it is semilocal, and `𝕋_𝔪` is its localisation at a maximal ideal `𝔪`. `X` is its set of
eigensystems (after extending `O`, `𝕋 ⊂ O^X` separates the points of `X`), `X_𝔪 ⊂ X` those of `𝕋_𝔪`, and
`V_x ⊂ M_j(𝔭) ⊗ K_O` the eigenspaces.

- `Z ⊂ X`: the eigensystems of the automorphic representations of `U(V_j)` occurring in `M_j(𝔭) ⊗ ℂ` (automorphic
  realization, AutomorphicFormsOnReductiveGroups §7.5) whose weak base
  change (EndoscopicTransferAndUnitaryTraceComparison §6.29) contains the block `Speh(μ_j(ξ_𝔭)η̃^{−1}, t)`;
- `Z_good ⊂ Z`: those whose complementary parameter, an isobaric sum of rank `r`, has label tuples at `g₀` and at `g₁`
  good for `χ` and for `χ^{−1}` (RowTowerAndRallisIdentities §5.3(iii));
- `V_good := ⊕_{x∈Z_good} V_x`, the *lifted subspace*, and `d^Z_j(𝔭) := dim V_good`.

*Level parts.* The finite group `G₀` of the type primes (7.1 (2)) acts on `M_j(𝔭)` and commutes with `𝕋`. For a level
`(P, χ_P)` at the type primes (ThetaChainsOnDefiniteUnitaryGroups §2.9a) write `M_j(𝔭)^P`, `V_x^P`, `V_good^P` for the
intersections of `M_j(𝔭)`, `V_x`, `V_good` with the level-`(P, χ_P)` part of `M_j(𝔭) ⊗ K_O` (intersections, not
projections; they are stable under `𝕋`), `mult^P(x) := dim V_x^P` and
`d^{Z,P}_j(𝔭) := dim V_good^P = Σ_{x∈Z_good} mult^P(x)`. For `P = 1` these are `M_j(𝔭)`, `V_x`, `V_good`, `mult(x)` and
`d^Z_j(𝔭)`. The *base level* is `(P_0, χ_{P_0})`, read on `U(V_j)` in the convention in which the model lift `θ_j(ξ_𝔭)`
carries the level part into the level-`(P_0, χ_{P_0})` part of `𝒞(W_j)`.

`w_{tr}(E)` is the largest integer `N` with `χ_cyc^{tr} ≡ 1 (mod N)` on `G_E`; its `ℓ`-adic valuation `v_ℓ(w_{tr}(E))` is the
invariant of the twist theorem.

### 7.1 Congruence lengths of a step

*Origin:* adapted from Hida (1981, 1986): the module of congruences of a Hecke algebra, acting on itself, along the
decomposition into the factor of a set of eigensystems and the rest (PadicFamilies §1.7a); here, for the lattices of
forms on `U(V_j)` as modules over their Hecke algebra, the congruence length `η_j(𝔭)` between the lifted eigensystems
and the others, with its bound through multiplicities and congruence ideals relative to the cuts by the idempotent `e₀`
and by the label tuples at the two type primes, and its level parts.

*Method of the formal proof:* `|G₀|·e₀` is written as a sum over the good label tuples of products of series idempotents
at the type places, a central element with integral coefficients, which acts on the lattice and commutes with the Hecke
algebra; a series idempotent is nonzero on a form only if its label is the label of the parameter of the form at that
place, read off the eigenvalues of tame inertia, so the element acts by `|G₀|` on `V_x` for `x ∈ Z_good` and by `0` for
`x ∈ Z ∖ Z_good`, and the endomorphism index bound gives the inequality; the cut by a label tuple is the same
construction for the tuple of `π`.

*Definition.* For a twisted place `𝔭 | ℓ` and a step `j`,

`η_j(𝔭) := Σ_𝔪 η_{Z_good ∩ X_𝔪}(M_j(𝔭)_𝔪)`,

the sum over the maximal ideals `𝔪` of `𝕋` of the lengths of the congruence modules of the localisations along the lifted
points (LengthBoundsInPadicFamilies §1.7a, split case: the congruence module along the idempotent `e_Y` of a set `Y` of points, of
length `η_Y(M) = length e_YM/(M ∩ V_Y)`); and `η_j(𝔭) := 0` at untwisted places. API
specific to the chain:
1. `V_good` is Hecke-stable and defined over `𝕃`, and `e_𝔭·η_j(𝔭)` is the length over the completion of `𝒪_𝕃` at `𝔭` of
   `P_good M/(M ∩ V_good)`, where `M` is the global lattice of `∇`-valued integral forms on `U(V_j)` (the localisations at
   all maximal ideals exhaust `M_j(𝔭)`) and `P_good` the orthogonal projection onto `V_good`.
2. *The cut by the type.* Let `G₀ = ∏_{v|g₀g₁} GL_r(𝔽_{g_v})` act on the forms on `U(V_j)` through the upper left block
   of the level at the type primes (ThetaChainsOnDefiniteUnitaryGroups §2.9a), `e₀ ∈ ℂ[G₀]` the central idempotent of the good label tuples (RowTowerAndRallisIdentities §5.3), and
   `X_s := {x ∈ X : e₀ does not vanish on V_x}`. Then `e₀ = 1` on `V_x` for `x ∈ Z_good` and `e₀ = 0` on `V_x` for
   `x ∈ Z ∖ Z_good`; hence `Z_good ⊂ X_s` and `Z ∩ X_s ⊂ Z_good`. The element `α := |G₀|·e₀` lies in the centre of `O[G₀]` (`O` enlarged to contain the values of the characters of `G₀`),
   commutes with `𝕋`, acts by `|G₀|` on `V_x` for `x ∈ Z_good` and by `0` for `x ∉ X_s`; consequently
   `η_j(𝔭) ≤ Σ_{π∈Z_good} mult(π)·(v(c(π)) + v_ℓ(|G₀|))`, `c(π) := {f(π) : f ∈ 𝕋_𝔪, f = 0 on X_s ∩ X_𝔪 ∖ Z}` (`𝔪` the
   maximal ideal of `π`).
3. *The cut by a label tuple.* For `π ∈ Z_good` let `s_π` be the tuple of the labels of the complementary parameter of `π`
   at all type places (above `g₀` and above `g₁`), `e_π ∈ ℂ[G₀]` the product of the series idempotents of the `s_π(v)`
   (FiniteReductiveGroups §5.7), `α_π := |G₀|·e_π` and `X_s(π) := {x ∈ X : α_π ≠ 0 on V_x}`. Then `α_π`
   lies in the centre of `O[G₀]`, commutes with `𝕋`, acts by `|G₀|` on `V_π` and by `0` on `V_x` for `x ∉ X_s(π)`; every
   `x ∈ X_s(π)` is the eigensystem of a representation in whose level-fixed vectors, at each type place `v`, the series of
   `s_π(v)` occurs; so `Z ∩ X_s(π) ⊂ Z_good`; and
   `η_j(𝔭) ≤ Σ_{π∈Z_good} mult(π)·(v(c′(π)) + v_ℓ(|G₀|))`, `c′(π) := {f(π) : f ∈ 𝕋_𝔪, f = 0 on X_s(π) ∩ X_𝔪 ∖ Z}`.
4. *Level parts.* For a level `(P, χ_P)` put `η^P_j(𝔭) := Σ_𝔪 η_{Z_good ∩ X_𝔪}((M_j(𝔭)^P)_𝔪)` at a twisted place and `0`
   elsewhere. Then `e_𝔭·η^P_j(𝔭) = length_𝔭(pr M_P/(M ∩ Z_j^P))` in the notation of 7.15 (c′), and
   `η^P_j(𝔭) ≤ Σ_{π∈Z_good} mult^P(π)·(v(c(π)) + v_ℓ(|G₀|))`, and the same with `c′(π)`, with the ideals `c(π)`, `c′(π)` of
   (2), (3). For `P = 1` this is (1)–(3).

*Route.* (1) Lengths are additive over the localisations of a module over the semilocal `𝕋`, and `e_{Z_good}` is the
orthogonal projection to `V_good` because the Hecke operators are normal; the Hecke operators and the good idempotent are
`𝕃`-rational (RowTowerAndRallisIdentities §5.11). (2) Forms with the same eigensystem have the same parameter (strong multiplicity one for isobaric
sums, AutomorphicLFunctionsAndLocalFactors AL.3.7.2); at a split type place the parameter is the local component; the
vectors fixed by the principal congruence subgroup in a component whose rank-`r` part has label `f` lie in the
Harish-Chandra series of `f` (tensored with the characters of the block), on which the series idempotent of another
label vanishes (FiniteReductiveGroups §§5.7, 6.3). So `e₀` acts by `1` or `0` according to the
goodness of the labels of the complementary parameter. `|G₀|` times a central idempotent of `ℂ[G₀]` has integral
coefficients. Apply the length bound of LengthBoundsInPadicFamilies §1.7a(4) with `Z′ = Z_good ∩ X_𝔪` and `Z_good ∪ (X_𝔪 ∖ X_s)` in
place of `Z`, whose relative congruence ideal at `π` is `c(π)`. (3) As (2) for the one tuple `s_π`: goodness (RowTowerAndRallisIdentities §5.3(iii)) is
a property of the label tuple, so a point of `Z` at which the series of the `s_π(v)` occur is good. The length bound is
the family form LengthBoundsInPadicFamilies §1.7a(4′), with one endomorphism for each `π`: take `f_π ∈ 𝕋` vanishing on `X_s(π) ∖ Z` with
`f_π(π)` a generator of `c′(π)`, and `α′_π := f_π·α_π`; it commutes with the Hecke algebra, acts on `V_π` by
`|G₀|·f_π(π)`, and vanishes on `V_x` for every `x ∉ Z_good` (off `X_s(π)` by `α_π`, on `X_s(π) ∖ Z` by `f_π`, and
`X_s(π) ∩ Z ⊂ Z_good`). The cuts for different `π` need not be disjoint. (4) `α` and the `α_π` are central in `O[G₀]`, so
they preserve the level parts, and (1)–(3) apply to the `𝕋`-module `M_j(𝔭)^P`. Its Hecke algebra is a quotient of `𝕋` and
its points are points of `X`; an element of `𝕋_𝔪` vanishing on `X_s ∩ X_𝔪 ∖ Z` maps to an element of the quotient
vanishing at its points there, with the same value at `π`; so the ideal formed with the quotient as in (2) contains
`c(π)`, and its valuation is at most `v(c(π))`; likewise for `c′(π)`.

*Check.* For `𝕋 = M = {(a, b) ∈ O² : a ≡ b (mod ℓ^n)}` acting on itself and `Z_good` the first point, `η = n`; if
`M = (M ∩ V_good) ⊕ (M ∩ V_good^c)`, then `η = 0`.

*Sources:* (Hida; Ribet). The definition and (2): [FormalProof],
`Development/AutomorphicArithmetic/ResidueCharacters/TwistedPlaces.lean` (`Formalism.MainNotions.TwistedPlaces.adm1`),
`Formalism/SharpRestriction/LevelLetterCocycles/JointConditionsZpowers/CommutingEndomorphismCondition.lean` (`Formalism.MainNotions.N.KillingConditions.CommutingEndomorphismCondition`);
in the route of (2), the series idempotent of a label vanishes on the forms of a parameter with another label at the place:
[FormalProof], `Development/AbelianVarietyTheory/Definitions/NonGaloisDescent/InjPrimeTo.lean` (`GlobalTheory.TypeLeaf.SerLoc`);
the definition as a sum over the maximal ideals, and (1): follows from [FormalProof],
`Formalism/SharpRestriction/LevelLetterCocycles/DataN.lean` (`Formalism.BasicNotions.NData.etaLoc`);
`c(π)` and `c′(π)` in (2), (3): [FormalProof],
`Development/AbelianVarietyTheory/Definitions/NonGaloisDescent/GlobalCore.lean` (`GlobalTheory.Cut.ccOff`),
`Formalism/SharpRestriction/LevelLetterCocycles/CongruenceSingleEndomorphism.lean` (`Formalism.MainNotions.PairedCharacterCondition.CongruenceModules.vccCut`);
(3), the cut by a label tuple: follows from [FormalProof],
`Formalism/SharpRestriction/LevelLetterCocycles/CongruenceSingleEndomorphism.lean` (`Formalism.MainNotions.PairedCharacterCondition.CongruenceModules.CutAt`),
`Development/AbelianVarietyTheory/Definitions/NonGaloisDescent/StepJumpDirect.lean` (`GlobalTheory.Pass.TypeLocus`),
`Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/BcAll.lean` (`GlobalTheory.CutAtGood.main_alt_alt`).
*Needs:* ThetaChainsOnDefiniteUnitaryGroups §2.5, ThetaChainsOnDefiniteUnitaryGroups §2.9, ThetaChainsOnDefiniteUnitaryGroups §2.9a, RowTowerAndRallisIdentities §5.3, RowTowerAndRallisIdentities §5.7, RowTowerAndRallisIdentities §5.11; PadicFamilies §1.7 and LengthBoundsInPadicFamilies §1.7a (with (4′));
AutomorphicLFunctionsAndLocalFactors AL.3.7.2; FiniteReductiveGroups §§5.7, 6.3; AutomorphicFormsOnReductiveGroups §7.5.

### 7.4 Hecke–Galois families on definite unitary groups

*Origin:* adapted from Chenevier and Harris (2013), the Galois representations of regular algebraic polarised cuspidal
representations over CM fields, with local-global compatibility by Caraiani (2012): here assembled over the weak base
change into a `𝕋`-valued determinant on the definite groups of the chain, with the local behaviour at the type places
(7) and at the twist places (8); the first sentence of (8) is this roadmap's own formulation.

*Method of the formal proof:* the family of Galois representations is obtained from the representations attached to
the cuspidal constituents of the weak base change, made into a determinant with values in the Hecke algebra by the
density of Frobenius elements, with the local behaviour at the type and twist places read off depth-zero local
components.

For a step `j` and a twisted place `𝔭 | ℓ`, let `𝕋`, `X` be as in the
notation of this layer. For every `x ∈ X` there is a continuous semisimple `r_x : G_E → GL_{r+t}(K̄_O)`, the Galois
representation of the weak base change `BC(Π)` of an automorphic representation `Π` of `U(V_j)` with eigensystem `x`, such
that:
1. at every place `w ∤ ℓ` of `E` above a split `v` with `w ∉ Σ(𝔭) ∪ Q(ψ_𝔭)`, `r_x` is unramified and the characteristic
   polynomial of the arithmetic Frobenius `Frob_w` is the Hecke polynomial
   `X^{r+t} + Σ_{k=1}^{r+t} (−1)^k N(w)^{k(k−1)/2}·T_{w,k}(x)·X^{r+t−k}` of `x` at `w`, where `T_{w,1}, …, T_{w,r+t}` are the
   generators of `𝕋` at `w`, normalised so that the roots are `β·N(w)^{(1−(r+t))/2}`, `β` running over the eigenvalues of
   the arithmetic Frobenius on the unramified parameter of `BC(Π)_w`; hence the coefficients of the characteristic polynomials
   of `r(g) := (r_x(g))_x` lie in `𝕋` (after a finite extension of `O`), and `g ↦ det(1 + Y r(g))` is a continuous
   `𝕋`-valued determinant of `G_E` of dimension `r + t`;
2. `r_x` is unramified outside `Σ(𝔭) ∪ Q(ψ_𝔭)` and the places above `ℓ`;
3. at a place `w ∤ ℓ` in `Σ(𝔭) ∪ Q(ψ_𝔭)`, where the parameter of `BC(Π)_w` is tame with `N = 0`: `N(r_x|_w) = 0` and the
   restriction of `r_x` to inertia is that of the parameter of `BC(Π)_w`;
4. at `w | ℓ` with `ℓ ∉ {g₀, g₁}`: `r_x` is crystalline, and at an embedding `τ : E → ℚ̄_ℓ` inducing `w` its Hodge–Tate
   weights are `{i − 1 − λ_{ι∘τ,i} : 1 ≤ i ≤ r + t}`, where for `σ : E → ℂ` the weight
   `λ_σ = (λ_{σ,1} ≥ ⋯ ≥ λ_{σ,r+t})` is the one for which the infinitesimal character of `BC(Π)` at `σ` is `λ_σ + ρ`
   (BaseChangeAndGaloisRepresentationsForUnitaryGroups §16.1); they are the same for all `x`. Equivalently they are
   `{κ_{ι∘τ,a} + (r + t) − a : 1 ≤ a ≤ r + t}`, `κ_σ = −w₀λ_σ` being the highest weight at `σ` of the representation in
   which the forms of `M_j(𝔭)` take values (its contragredient is the archimedean component of `Π` at `σ`): in the
   notation of this layer, `𝒲_j` at `σ`. (RowTowerAndRallisIdentities §5.7 gives the highest weight of `𝒲_j` at each real place;
   the weights are made explicit in 7.6 (a).) At `w | ℓ` with `ℓ ∈ {g₀, g₁}`, where the parameter of `BC(Π)_w`
   is tame with `N = 0`: potentially crystalline, with `N = 0` and the inertial type of the parameter of `BC(Π)_w` on
   `WD(D_pst)`;
5. the Hodge–Tate weights at `τ∘c` are `w₀ − (those at τ)` for one integer `w₀`;
6. the Satake parameters of the cuspidal constituents of the base change satisfy `N w^{−1/2} < |α| < N w^{1/2}` (unitary
   normalisation);
7. *the points of the cuts:* let `v` be a type place, `w = w_v` (ThetaChainsOnDefiniteUnitaryGroups §2.4(b)), and `x ∈ X` such that `V_x` is not killed by the
   series idempotent (FiniteReductiveGroups §5.7) of a squarefree label `f_v` of degree `r` over
   `𝔽_{g_v}` with no root equal to `χ_{v,j}^{−1}` (read in the tame labelled form of ThetaChainsOnDefiniteUnitaryGroups §2.9a). Then the parameter of `BC(Π)_w` is
   tame with `N = 0`, and its restriction to inertia is the sum of the tame characters given by the roots of
   `f_v·(X − χ_{v,j}^{−1})^t` in that form; so (3) applies at `w` if `w ∤ ℓ`, and the second half of (4) if `w | ℓ`.
   At the conjugate place `w̄_v` the parameter of `BC(Π)_{w̄_v}` is the contragredient of the parameter at `w_v`, read through
   `E_{w̄_v} = F_v = E_{w_v}` (`BC(Π)` is conjugate self-dual): it is tame with `N = 0`, and its restriction to inertia is the
   sum of the inverses of those characters; so (3), resp. the second half of (4), applies at `w̄_v` as well. This
   holds at every type place for the points of `X_s` (7.1(2)) and of every `X_s(π)` (7.1(3)): good labels are squarefree of
   degree `r` without the roots `χ_{v,j}^{±1}` (RowTowerAndRallisIdentities §5.3(iii)).
8. *the points at the twist places:* let `v ∈ A(ℓ) ∪ Q(ψ_𝔭)` lie above the place `v₀` of `F` (split in `E`, `U(V_j)(F_{v₀}) ≅ GL_{r+t}(F_{v₀})`),
   at which the level of ThetaChainsOnDefiniteUnitaryGroups §2.9 is the parahoric `J_Q` of type `(r, t)` of ThetaChainsOnDefiniteUnitaryGroups §2.9c with the character `c_{v₀}(det of the lower block)`,
   `c_{v₀} ≠ 1`. Then for every `x ∈ X`, `BC(Π)_w ≅ π₁ × (c̃∘det ⊗ π₂)` (normalised parabolic induction along the parabolic of
   type `(r, t)`, irreducible) with `π₁`, `π₂` irreducible spherical representations of `GL_r(F_{v₀})`, `GL_t(F_{v₀})` and `c̃` a
   tamely ramified character of `F_{v₀}^×` lifting `c_{v₀}`; so the parameter of `BC(Π)_w` is tame with `N = 0`, inertia acts on it
   semisimply through `r` copies of the trivial character and `t` copies of the character `c̃` read on inertia, and (3) applies at
   `w`. (The first sentence of (8), the structure of `BC(Π)_w`, is this roadmap's own, proved by the route below; [FormalProof]
   uses at these places only the consequence that follows it.)

For a CM field unramified over its maximal totally real subfield at every finite place, `ℓ` odd with every place above `ℓ`
split, and Iwahori levels with characters, PotentialAutomorphyInfrastructurePartII §§3.6, 3.7 give the representations `r_x`
with the Frobenius polynomials of (1) (and a `𝕋_𝔪`-valued representation at a non-Eisenstein `𝔪`), (4) and (5), and on inertia
at the Iwahori places only the characteristic polynomial, the weaker form of (8); AutomorphicGaloisRepresentationsPartII
AG2.3 *Determinant interpolation on the definite family* is the form of the determinant of (1) over affinoid Hecke algebras;
7.4 is the more general statement, for the hosts, the primes and the type and parahoric levels of the chain.

*Route.* The weak base change writes `Π` as an isobaric sum of Speh blocks of conjugate self-dual cuspidal
representations; the Galois representations of definite unitary groups
(BaseChangeAndGaloisRepresentationsForUnitaryGroups §16.1, whose setting contains the groups of the chain: `E/F` is
unramified at every finite place and `V_j = E^{r+t}` has the standard positive form,
ThetaChainsOnDefiniteUnitaryGroups, introduction of Layer 2, and §2.2) attach and sum their Galois representations, and
give (1) at the split places `w ∤ ℓ` at which `Π` is unramified and, when `Π` is unramified at every place above `ℓ`,
crystalline at every `w | ℓ` with the labelled weights. Since `𝕋` is generated by Hecke operators at split places and the Frobenius elements of
these places are dense (Chebotarev; ArithmeticGaloisRepresentations §5.1), the characteristic coefficients are polynomials in
those operators, which makes the family a determinant in Chenevier's sense (IntegralHeckeAndGaloisDeterminants §5.1
*Determinant from a quantified Hecke comparison*, with `J = 0` and the Frobenius elements of the split places as the dense
set; uniqueness by IntegralHeckeAndGaloisDeterminants §4.1 *Uniqueness from Frobenius density*). (2) and (3) are obtained block
by block, for the cuspidal constituents, from the away-prime comparison (BaseChangeAndGaloisRepresentationsForUnitaryGroups §14.1, with the monodromy), and the second half of
(4) from the comparison at the coefficient prime for parameters induced from unramified extensions (BaseChangeAndGaloisRepresentationsForUnitaryGroups §15.1): at a type place
the local components have depth zero, so their parameters are tame (BaseChangeAndGaloisRepresentationsForUnitaryGroups §10.35 (d): the
parameter of an irreducible representation is trivial on wild inertia exactly when the representation has depth zero, in every rank)
and every irreducible constituent is induced from a tame character of an unramified extension (Clifford theory); the
matching of the weak base change at split places is EndoscopicTransferAndUnitaryTraceComparison §6.29. The explicit
inertial type in terms of labels (BaseChangeAndGaloisRepresentationsForUnitaryGroups §14.2) is not used here; 7.9 uses it. The first half of (4): `Π` is unramified at every place above `ℓ`, because `ℓ`
is not a type prime, the auxiliary prime of `ℓ` is not `ℓ`, and `Q(ψ_𝔭)` has no place above `ℓ` (ThetaChainsOnDefiniteUnitaryGroups §2.5), so §16.1 gives the crystalline representation with the labelled weights. (5) is the weight
symmetry (BaseChangeAndGaloisRepresentationsForUnitaryGroups §15.2). (6) is the Jacquet–Shalika bound for unitary generic local components (AutomorphicLFunctionsAndLocalFactors
AL.3.3.8), which replaces every use of purity. (7) At a split type place `U(V_j)(F_v) ≅ GL_{r+t}(ℚ_{g_v})` and
`BC(Π)_w = Π_v` (EndoscopicTransferAndUnitaryTraceComparison §6.29); `Π_v` has a vector of the level of ThetaChainsOnDefiniteUnitaryGroups §2.9a (upper left
block `≡ 1` modulo `g_v`, the character `χ_{v,j}^{−1}(det of the t-block)`) on which the upper left block acts in the series
of `f_v`. By the local type statement FiniteReductiveGroups §6.5, `Π_v` is the irreducible product of a
depth-zero representation of `GL_r` of label `f_v` and the twist of a spherical representation of `GL_t` by a tamely
ramified character with residue `χ_{v,j}^{−1}`; the members of the supercuspidal support of the first factor are pairwise
unlinked (`f_v` is squarefree) and none is inertially equivalent to that character (`f_v` has no root `χ_{v,j}^{−1}`), so
BaseChangeAndGaloisRepresentationsForUnitaryGroups §10.35 (b)–(d) gives `N = 0`, tameness and the restriction to inertia
(BaseChangeAndGaloisRepresentationsForUnitaryGroups §10.34 (iii) in the ranks of the factors of `f_v`). (8) At the split place `BC(Π)_w = Π_{v₀}` (EndoscopicTransferAndUnitaryTraceComparison §6.29), which has a nonzero vector
on which `J_Q` acts by `c_{v₀}(det of the lower block)`. This character factors through the reductive quotient
`GL_r(𝔽_p) × GL_t(𝔽_p)` of `J_Q`, so by the depth-zero form of the comparison of invariants with the Jacquet module (Moy–Prasad;
SmoothRepresentationsOfLocalGroups SR.2.3) the Jacquet module of `Π_{v₀}` along the parabolic of type `(r, t)` has a constituent
`ρ₁ ⊗ ρ₂` with a `GL_r(𝒪)`-fixed vector in `ρ₁` and a vector of `ρ₂` on which `GL_t(𝒪)` acts by `c_{v₀}∘det`; so `ρ₁` and
`ρ₂ ⊗ c̃^{−1}∘det` are spherical (SmoothRepresentationsOfLocalGroups SR.4.3), with supercuspidal supports of unramified characters, resp. of characters restricting to
`c_{v₀} ≠ 1` on `𝒪^×`. The irreducible `Π_{v₀}` is the product of its components along these two inertial classes, no segment of
the one being linked to a segment of the other (Bernstein–Zelevinsky; the inertial support, SmoothRepresentationsOfLocalGroups SR.3.2), and by the geometric lemma (SmoothRepresentationsOfLocalGroups SR.2.2) the only
constituent of its Jacquet module with these supports is the tensor product of those components, which are therefore `ρ₁`
and `ρ₂`. An irreducible spherical representation has an unramified parameter with `N = 0`; so the parameter is as stated,
and the away-prime comparison (BaseChangeAndGaloisRepresentationsForUnitaryGroups §14.1) applies block by block, as in (3).

*Check.* The normalisation of (1), read in rank one (`r + t = 1`): the Hecke polynomial is `X − T_{w,1}(x)` and its root is `β`,
the eigenvalue of the arithmetic Frobenius on the parameter of the character `BC(Π)_w`. Since Artin reciprocity sends
uniformizers to geometric Frobenius elements (Conventions), `β = BC(Π)_w(ϖ_w)^{−1}` for a uniformizer `ϖ_w`, so `r_x` takes
the value `BC(Π)_w(ϖ_w)` at the geometric Frobenius of `w`, as the `ℓ`-adic characters of Hecke characters do in the
Conventions; with uniformizers sent to arithmetic Frobenius elements the root would be `BC(Π)_w(ϖ_w)` itself.

*Sources:* (Labesse; Chenevier–Harris; Caraiani; Barnet-Lamb–Gee–Geraghty–Taylor). (1): [FormalProof],
`Formalism/SharpRestriction/LevelLetterCocycles/DataN.lean` (`Formalism.MainNotions.N.IsHeckeGalois`),
`Formalism/SharpRestriction/LevelLetterCocycles/DataN.lean` (`Formalism.MainNotions.N.GoodR`),
`Formalism/SharpRestriction/LevelLetterCocycles/SumRepresentations.lean` (`Formalism.MainNotions.SumRepresentations.At.G1`);
(2): [FormalProof],
`Formalism/SharpRestriction/LevelLetterCocycles/SumRepresentations.lean` (`Formalism.MainNotions.SumRepresentations.At.G4`);
(3): [FormalProof],
`Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/TypeConditions/AutomorphicGaloisAdmissible.lean` (`UpperTheory.GalS.AutomorphicGaloisAdmissible`);
(4) for `ℓ ∉ {g₀, g₁}`: [FormalProof],
`Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/TypeConditions/TrivialLocalCondition.lean` (`UpperTheory.GalS.G2a`),
`Development/AbelianVarietyTheory/BlockTheory/TorsionBlocks/JumpDictionary.lean` (`GlobalTheory.IndefiniteRowSideFullHecke.JumpDictionary.WeightParam`);
(4) for `ℓ ∈ {g₀, g₁}`: [FormalProof],
`Development/AbelianVarietyTheory/Definitions/NonGaloisDescent/StepJumpDirect.lean` (`GlobalTheory.Pass.TypeLGC`),
`Formalism/SharpRestriction/LevelLetterCocycles/SumRepresentations.lean` (`Formalism.MainNotions.SumRepresentations.At.TieGal`);
(6): [FormalProof],
`Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/StringRepresentations/AllCuspidalOpenBound.lean` (`UpperTheory.GalN.AllCuspidalOpenBound`);
(7): [FormalProof],
`Formalism/SharpRestriction/LevelLetterCocycles/SumRepresentations.lean` (`Formalism.MainNotions.SumRepresentations.At.MonodromyInertiaType`);
[FormalProof] states (7) for a label of which neither `χ_{v,j}` nor `χ_{v,j}^{−1}` is a root, at both places, with the
character of the block determined up to inversion:
`Formalism/SharpRestriction/LevelLetterCocycles/PairedCharacterCondition.lean` (`Formalism.MainNotions.PairedCharacterCondition.admDZ`),
at the points of the chain
`Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/LocalTypeDeterminedAtAllPrimes.lean` (`GlobalTheory.T.tieChi_at_members_of_depthZero`);
(8), the consequence of its first sentence: [FormalProof],
`Formalism/SharpRestriction/LevelLetterCocycles/SumRepresentations.lean` (`Formalism.MainNotions.SumRepresentations.At.MonodromyInertiaType`),
`Formalism/SharpRestriction/LevelLetterCocycles/SumRepresentations.lean` (`Formalism.MainNotions.SumRepresentations.At.ConclusionG5`).
*Needs:* ThetaChainsOnDefiniteUnitaryGroups §2.4, ThetaChainsOnDefiniteUnitaryGroups §2.5, ThetaChainsOnDefiniteUnitaryGroups §2.9, ThetaChainsOnDefiniteUnitaryGroups §2.9a, ThetaChainsOnDefiniteUnitaryGroups §2.9c, RowTowerAndRallisIdentities §5.3, RowTowerAndRallisIdentities §5.7, 7.1;
AutomorphicGaloisRepresentationsPartII AG2.0, AG2.5 *Unramifiedness and the good-prime polynomial*, AG2.6 *Polarized
admissibility at the coefficient prime*; BaseChangeAndGaloisRepresentationsForUnitaryGroups §§16.1 (the Galois representations of definite unitary groups), 14.1 (the
away-prime comparison), 15.2 (the weight symmetry), 15.1 (the comparison at the coefficient prime for parameters induced
from unramified extensions), 10.34 (iii), 10.35; EndoscopicTransferAndUnitaryTraceComparison §§6.29, 13.1, 13.4;
FiniteReductiveGroups §§5.7, 6.3, 6.5 (the local type statement); AutomorphicLFunctionsAndLocalFactors AL.3.3.8; IntegralHeckeAndGaloisDeterminants
§§4.1, 5.1; SmoothRepresentationsOfLocalGroups SR.2.2, SR.2.3, SR.3.2, SR.4.3; ArithmeticGaloisRepresentations §5.1;
Chebotarev (Completed).

### 7.5 Lifted eigensystems

*Origin:* adapted from Mínguez (2008): the explicit Howe correspondence for dual pairs of type II, which gives, place by
place, the parameter of a theta lift at the split places of hyperspecial level; here the eigensystem of the lift of a
good eigenform as that of `(Σ ⊞ μ_j(ξ_𝔭)[t]) ⊗ η̃^{−1}`, with its Galois representation, its twists, inertial types and
Hodge–Tate weights (1), and the eigensystems of a localisation whose Galois representation contains `χ_1` (2).

*Method of the formal proof:* for (1), the weak base change of the lift is taken first; at the split unramified places
the local correspondence and the size bounds single out in it a block of length `t` with the Frobenius eigenvalues of
`μ_j(ξ_𝔭)η̃^{−1}`, which is the block of that character by strong multiplicity one, and what remains, twisted by `η̃`,
has rank `r` and the local parameters of `σ` at the good places: it is the parameter `Σ`. The route written here goes
the other way, from the weak base change `Σ` of `σ` to the parameter of the lift.

In the setting of 7.4 (`t > r`):
1. The eigensystem of the lift `θ_j(ξ_𝔭)^*(σ)` of a good eigenform `σ ∈ 𝒞(W_j)` with weak base change `Σ` (rank `r`) is that
   of the parameter `(Σ ⊞ μ_j(ξ_𝔭)[t]) ⊗ η̃^{−1}` (`μ[t]` the Speh block of length `t`); it lies in `Z_good`; its Galois
   representation (7.4, assembled by BaseChangeAndGaloisRepresentationsForUnitaryGroups §16.1) is `ρ_Σ ⊕ χ_1 ⊕ ⋯ ⊕ χ_t` with
   `ρ_Σ := r_{ℓ,ι}(Σ ⊗ |det|^{−t/2})` and `χ_c` the `ℓ`-adic character of the algebraic Hecke character
   `ν·|·|_{𝔸_E}^{−r/2−(c−1)}`, `ν := μ_j(ξ_𝔭)η̃^{−1}`; so `χ_c = χ_1·χ_cyc^{−(c−1)}`. At a type place `v` the restriction of `χ_1`
   to inertia at `w_v` is the tame character given by the residue `χ_{v,j}^{−1}` of `μ_j` at `w_v`, and at `w̄_v` by `χ_{v,j}`
   (ThetaChainsOnDefiniteUnitaryGroups §2.4 (b); `η̃`, `ξ_𝔭` and the norm are unramified there). If `ℓ` is the type prime under
   `v`, this is the inertial type of `χ_1` on `D_pst`: `χ_1` is de Rham at `w_v` and at `w̄_v`, and by the explicit formula of
   AutomorphicGaloisRepresentationsPartII AG2.0 its composite with the reciprocity map is, on the units at such a place, the
   restriction of the Hecke character times an algebraic character of the units, the restriction to inertia of a crystalline
   character. The Hodge–Tate weights of the block are `t`
   consecutive integers, and those of `ρ_Σ ⊗ χ_1^{−1}` avoid the interval `[−1, t]`.
2. *Assume that the localisation `X_𝔪` contains a point of `Z_good` and that the reduction of `ρ_Σ` is absolutely
   irreducible* for the rank-`r` parts `Σ` of the points of `Z_good` in `X_𝔪`. Then an eigensystem `x ∈ X_𝔪` whose Galois
   representation contains `χ_1` lies in `Z`, and the rest of its parameter is one cuspidal representation of rank `r`.

*Route.* (1) At split places the local theta correspondence of type II and the unramified correspondence give the
base-change parameter (MetaplecticAutomorphicForms §3.14 and ThetaKernelsForUnitaryDualPairs §3.21a); 7.4 gives the Galois representation, and the twists are
those of BaseChangeAndGaloisRepresentationsForUnitaryGroups §16.1 in rank `n = r + t`: `−(n − r)/2 = −t/2` for the cuspidal block `Σ` of rank `r`, and
`(t − 1)/2 − (c − 1) − (n − 1)/2 = −r/2 − (c − 1)` for the `c`-th character of the Speh block; `ν·|·|^{−r/2}` is algebraic because `ν`
has half-integral exponents (`μ_{j,τ}(z) = (z/z̄)^{−w_j(τ)}`, `η̃_τ(z) = (z/z̄)^{1/2}`, ThetaChainsOnDefiniteUnitaryGroups §2.4) and `r` is odd (ThetaChainsOnDefiniteUnitaryGroups §2.1); goodness of `σ`
is goodness of the labels of `Σ`; the weights come from the infinity types, which ThetaChainsOnDefiniteUnitaryGroups §2.3 separates by at least `(t+3)/2` from
the block (both summands carry the normalisation of the same assembly, so only their difference enters). (2) The characteristic polynomial of `r_x` is the product over the Speh blocks of the twisted characteristic
polynomials of their cuspidal constituents (Chebotarev; ArithmeticGaloisRepresentations §5.1); a character occurring in a semisimple representation occurs in one
factor; evaluating at a split unramified Frobenius, the unitarity of `μ_jη̃^{−1}` and the bound 7.4(6) force the block to
have length `t` and the character to start it; the residual shape (an absolutely irreducible rank-`r` part plus `t`
characters, all `x` in one localisation being congruent) forces the part containing `χ_1` to have rank one, and equal
`ℓ`-adic characters come from equal algebraic Hecke characters. Neither temperedness nor the Hodge–Tate weights enter (2).

*Sources:* ingredients (Mínguez; Howe). (1): [FormalProof],
`Formalism/SharpRestriction/LevelLetterCocycles/SumRepresentations.lean` (`Formalism.MainNotions.SumRepresentations.At.Conclusion42`),
`Formalism/SharpRestriction/LevelLetterCocycles/AdmissibleParameterJ.lean` (`Formalism.MainNotions.AdmissibleParameterJ.jcCondition`),
and `Formalism/SharpRestriction/LevelLetterCocycles/PairedCharacterCondition.lean`
(`Formalism.MainNotions.PairedCharacterCondition.tieChi`), which has the residue up to inversion, for `ℓ` a type prime.
*Needs:* ThetaChainsOnDefiniteUnitaryGroups §2.1, ThetaChainsOnDefiniteUnitaryGroups §2.3, ThetaChainsOnDefiniteUnitaryGroups §2.4, RowTowerAndRallisIdentities §5.3, RowTowerAndRallisIdentities §5.7, 7.4; MetaplecticAutomorphicForms §3.14 and ThetaKernelsForUnitaryDualPairs §3.21a;
AutomorphicLFunctionsAndLocalFactors AL.3.3.8; AutomorphicGaloisRepresentationsPartII AG2.0 (`ℓ`-adic characters of algebraic
Hecke characters); BaseChangeAndGaloisRepresentationsForUnitaryGroups §16.1; EndoscopicTransferAndUnitaryTraceComparison §6.29; ArithmeticGaloisRepresentations §5.1;
Chebotarev (Completed).

### 7.5a Nonvanishing of the descent

*Origin:* adapted from Gan, Qiu and Takeda (2014), Theorem 7.3 (i), the first-term identity in complementary form,
after Kudla and Rallis (1994) and Ichino (2004), and Yamana (2014), Theorem 10.1 (2), a pole of the standard
`L`-function gives a nonzero theta lift to a space of complementary dimension; here, for an eigenform on the definite
`U(V_j)` with the Satake string of the splitting character, the complementary residue through the doubling see-saw
(a) (i), the archimedean nonvanishing for the compact `U(V_j)(F_v)` by Schur orthogonality with the joint vector
(a) (ii), and the lift with the level vector of the model lift (b), with the local generation at the level places, every
level place and every dyadic place being split.

*Method of the formal proof:* if every theta lift to `U(W_j)` vanished, the doubling see-saw and the residue of the
Siegel Eisenstein series of `W_j ⊥ ℍ^t` at `s = t/2` (a theta integral of the complementary space `W_j`) would make the
residue of the doubling zeta integral vanish, while the zeta integral is the partial `L`-function, which has a simple
pole there by the Satake string, times a nonzero constant coming from a test vector supported in the principal
congruence subgroup at the level places; two generation statements, at the real and at the finite places, pass from
some lift to the lift with the level vector.

In the setting of 7.4, assume `t > r`, that every
place of the level of ThetaChainsOnDefiniteUnitaryGroups §2.9 on `U(V_j)` splits in `E` and that every place of `F` above `2` splits in `E` (ThetaChainsOnDefiniteUnitaryGroups §2.2). Let `y ≠ 0` be
a Hecke eigenform on `U(V_j)` of the level of ThetaChainsOnDefiniteUnitaryGroups §2.9 whose Satake parameters at the split places of hyperspecial level are
`B′ ⊔ (the string of length t of μ_j(ξ_𝔭)η̃^{−1})`, the string of the character by which `U(V_j)` is twisted in the Weil
representation of the pair, taken in its unitary normalisation, with `|β| ≤ N w^{(r−1)/2}` on `B′`, and which is fixed by
`e₀` (7.1(2)). Then:

- (a) *(complementary residue)* (i) if every theta lift of `y` to `U(W_j)` vanishes (for every Schwartz function of the
  pair `(V_j, W_j)` with the Weil data of the tuple `ξ_𝔭`), then for every Schwartz function `Φ` on the data of the space
  `W_j ⊥ ℍ^t` the residue at `s = t/2` of the doubling zeta integral of `y ⊗ ȳ` against the Siegel–Weil section of `Φ`
  vanishes; (ii) for some archimedean Schwartz function on the data of `W_j ⊥ ℍ^t`, the archimedean doubling zeta integral at
  `s = t/2` of a matrix coefficient of the archimedean component of `y` against its Siegel–Weil section is nonzero;
- (b) `θ_j(ξ_𝔭)(y) ≠ 0`.

MetaplecticAutomorphicForms §§6.13, 6.14 (the Rallis inner product formula and the global nonvanishing criterion, at a first
occurrence) treat the lift to the space `W_j ⊥ ℍ^t` itself; (b) is the complementary-space form, in the second-term range of
MetaplecticAutomorphicForms §6.6, and neither contains the other.

*Route.* (a) (i) Here `m = r + 2t`, `n = r + t` and `m′ := 2n − m = r`: the complementary space of `W_j ⊥ ℍ^t` is `W_j`
itself, of some Witt index `r′`, and `m > m′ > 0`. The first-term identity in its complementary form (Gan–Qiu–Takeda,
arXiv:1207.4709v3, Theorem 7.3 (i), after Kudla–Rallis and Ichino) writes the residue at `s = t/2` of the Siegel
Eisenstein series of `Φ` as a nonzero constant times the theta integral of `W_j` evaluated on the image under the Ikeda
map (MetaplecticAutomorphicForms §6.3) of the average of `Φ` over a maximal compact subgroup of `U(W_j ⊥ ℍ^t)(𝔸)`; for
`r′ > 0` this is the leading coefficient of the regularised theta integral, the integral over `[U(W_j)]` of the theta
kernel, averaged by a Hecke operator of `U(W_j)`, against an Eisenstein series of `U(W_j)`. As `[U(V_j)]²` is compact, the
residue of the doubling zeta integral is the integral of this against `y ⊗ ȳ`. For a doubled Schwartz function
`δ(φ₁ ⊗ φ̄₂)` of the pair `(V_j, W_j)` (MetaplecticAutomorphicForms §6.10), the integral over `[U(V_j)]²` of the (averaged)
theta kernel of `W_j` against `y ⊗ ȳ` is the (averaged) product of the theta lifts `θ(φ₁, y)` and `conj θ(φ₂, y)` to
`U(W_j)` (the doubling see-saw, MetaplecticAutomorphicForms §§6.10, 6.15). It vanishes identically on `[U(W_j)]` when every
lift of `y` to `U(W_j)` vanishes, and then so does its integral against the Eisenstein series for every `s`, hence every
Laurent coefficient; since the `δ(φ₁ ⊗ φ̄₂)` span a dense subspace of the Schwartz space of `W_j`, the residue
vanishes. (ii) At a real place `v` the group `U(V_j)(F_v)` is compact, so the archimedean zeta integral at `s = t/2`
against the Siegel–Weil section of `δ(φ₁ ⊗ φ̄₂)` (MetaplecticAutomorphicForms §§6.2, 6.10, 6.11) is the absolutely
convergent integral over `U(V_j)(F_v)` of `⟨ω(g)φ₁, φ₂⟩⟨π_v(g)f₁, f₂⟩`, `ω` the Weil representation of `(V_j, W_j ⊥ ℍ^t)`
and `π_v` the component of `y` at `v`. The splitting characters of the pair `(V_j, W_j)` serve for `W_j ⊥ ℍ^t` with the
trivial character on `ℍ^t` (the ranks `r` and `r + 2t` have the same parity), and then the restriction of `ω` to
`U(V_j)(F_v)` is the Weil representation `ω₀` of `(V_j, W_j)` tensored with that of `(V_j, ℍ^t)` (ThetaKernelsForUnitaryDualPairs
§3.3b (a)), whose vacuum `φ_vac` is fixed by `U(V_j)(F_v)`: it is the tensor product of the vacua of the compact pairs
formed with the definite halves of `ℍ^t ⊗ F_v`, of signatures `(t, 0)` and `(0, t)`, on which `U(V_j)(F_v)` acts by
`det^{−t/2}` and `det^{t/2}` times the splitting characters of the halves (ThetaKernelsForUnitaryDualPairs §3.46 (iii)), whose
product is the trivial character of `ℍ^t`. For `φ₁ = φ₂ = Δ_j ⊗ φ_vac`, with `Δ_j` the joint vector of
RowTowerAndRallisIdentities §5.7, the integrand is `⟨ω₀(g)Δ_j, Δ_j⟩⟨π_v(g)f₁, f₂⟩`; the first factor is a matrix coefficient of
the irreducible `U(V_j)(F_v)`-span `𝒲_{j,v}` of `Δ_j`, and `π_v` is the contragredient of `𝒲_{j,v}`, the type of the forms that
take values in `𝒲_{j,v}`
(RowTowerAndRallisIdentities §5.7). For `f₁ = f₂` the vector of `π_v` paired with `Δ_j`, Schur orthogonality (Tau Ceti
`ContRepresentation.schur_orthogonality_self`) gives `vol(U(V_j)(F_v))·‖Δ_j‖⁴/dim 𝒲_{j,v} ≠ 0`; the product of these data over
the real places is the archimedean Schwartz function of (a) (ii). (b): The string gives the partial `L`-function of `y` twisted by the splitting character of the pair a simple pole at
`(t+1)/2` (the rank-`r` factor is holomorphic and nonzero there since `t > r`); the doubling zeta integral of `y ⊗ ȳ`
against a Siegel–Weil section of the space `W_j ⊥ ℍ^t` is that `L`-function, divided by a normalising factor that is an
absolutely convergent Euler product at `t/2`, times an integral over the level and real places
(MetaplecticAutomorphicForms §§6.10a, 6.12: the standard factors with the unramified denominators `d_v`, and the
factorization) which, for a test vector on
`V_j ⊗ ℍ^t` whose matrix coefficient is supported in the principal congruence subgroup at the level places (it exists
because these places split and `r ≤ t`), is a nonzero constant multiple of the archimedean integral, itself nonzero for the
archimedean Schwartz function of (a) (ii). So the residue at `t/2` is nonzero for that section, and by (a) (i) some lift of
`y` to `U(W_j)` is nonzero. If the lift with the level
vector of RowTowerAndRallisIdentities §5.7 vanishes, so do the lifts with all functions having its finite part (Fock vectors are dense for a Sobolev norm
in which the lift is continuous), hence with all their translates under `U(W_j)(𝔸_f)`; every Schwartz function is, modulo
functions on which `y` pairs to zero because of its level character, a sum of such translates and of averages over the
subgroups of `GL_r(𝔽_v)` fixing a hyperplane or acting trivially modulo a line, against `χ_{v,j}^{±1}∘det`; these averages
kill `y` because a good label has no root `χ_{v,j}^{±1}`. All level places and the dyadic places split in `E`, so no local
theta dichotomy and no dyadic non-split Weil representation enters.

*Sources:* ingredients (Kudla–Rallis; Ichino; Gan–Qiu–Takeda, arXiv:1207.4709v3, Theorem 7.3 (i); Piatetski-Shapiro–Rallis).
(a) (i): follows from [FormalProof],
`Development/WeilBound/RepresentationTheoryGL/RegularisedSiegelWeil/SingularNullSets/HasLevel.lean` (`PositivityTheory.Rg.Rsw.ResCore`),
`Development/AbelianVarietyTheory/Proofs/DecoratedLatticeProofs/DoublingIntegralsVanishOfAllLiftsVanishStatement.lean` (`GlobalTheory.T.doubling_integrals_vanish_of_all_lifts_vanish`);
(b): [FormalProof],
`Development/AbelianVarietyTheory/Definitions/NonGaloisDescent/ParamsEx.lean` (`GlobalTheory.DownLift.TypeNZ`).
*Needs:* 7.1, RowTowerAndRallisIdentities §5.3, RowTowerAndRallisIdentities §5.7, ThetaChainsOnDefiniteUnitaryGroups §2.2, ThetaChainsOnDefiniteUnitaryGroups §2.9; MetaplecticAutomorphicForms §§6.2, 6.3 (the Siegel–Weil section, the
Ikeda map), 6.10–6.12 (doubling, the standard factors, the factorization), 6.15 (the global see-saw), 6.6 (the
second-term range); ThetaKernelsForUnitaryDualPairs §§3.3b (a), 3.46 (iii); Tau Ceti `ContRepresentation.schur_orthogonality_self`;
AutomorphicLFunctionsAndLocalFactors AL.3.3.8.

### 7.5b The lift fills the eigenspaces

*Origin:* particular to this proof: a dimension count from 7.5, 7.5a and the injectivity of the lift shows that the model
lift maps the good forms on the smaller group isomorphically onto the lifted subspace, level by level.

*Method of the formal proof:* a dimension count at each `x ∈ Z_good`: the lift is injective and maps the part of
`𝒞(W_j)` with the parameter of `x` into `V_x`, the descent maps `V_x` into that part and is injective on it, so the two
have the same dimension and the image is `V_x`; the statement for the good part and the equality of the multiplicities
with `dim 𝒞(W_j)^{good}` follow from the injectivity of the lift and the independence of the eigenspaces.

In the setting of 7.4 with `t > r` and the
hypotheses of 7.5a: for `x ∈ Z_good` with rank-`r` part `Σ`,
`θ_j(ξ_𝔭)^*` maps the part of `𝒞(W_j)` with parameter `Σ`
isomorphically onto `V_x`; hence it maps the good part `𝒞(W_j)^{good}` (RowTowerAndRallisIdentities §5.3, through the isometry `W_j ≅ Y_0` at the type
primes) isomorphically onto `V_good`, and `Σ_{π∈Z_good} mult(π) = d^Z_j(𝔭) = dim 𝒞(W_j)^{good}`.
The lift commutes with `G₀`; so for every level `(P, χ_P)` it maps the level part of `𝒞(W_j)^{good}` isomorphically onto
`V_good^P`, and `Σ_{π∈Z_good} mult^P(π) = d^{Z,P}_j(𝔭)` is the dimension of that level part. *The form of the formal
proof* is the one at the base level (7.8a).

*Route.* A dimension count: the lift is injective on each part (RowTowerAndRallisIdentities §5.7(ii)) and maps the part of parameter `Σ` into `V_x` (the
parameter of a lift, 7.5(1), and strong multiplicity one, AutomorphicLFunctionsAndLocalFactors AL.3.7.2); the descent maps
`V_x` into that part (adjointness and orthogonality of the parts) and is injective on `V_x` by 7.5a, since every form in `V_x`
has the string by 7.5(1) and is fixed by `e₀` by 7.1(2); so `dim V_x ≤ dim` of the part `= dim` of its image `≤ dim V_x`.
Summing over `x ∈ Z_good` gives the rest.

Follows from [FormalProof],
`Formalism/SharpRestriction/LevelLetterCocycles/SumRepresentations.lean` (`Formalism.MainNotions.SumRepresentations.At.ConclusionZ`),
`Formalism/SharpRestriction/LevelLetterCocycles/DataN.lean` (`Formalism.MainNotions.N.goodPartM`),
`Formalism/SharpRestriction/LevelLetterCocycles/DataN.lean` (`Formalism.MainNotions.N.AtM`).
*Needs:* 7.1, 7.5, 7.5a, RowTowerAndRallisIdentities §5.3, RowTowerAndRallisIdentities §5.7, RowTowerAndRallisIdentities §5.9; AutomorphicLFunctionsAndLocalFactors AL.3.7.2.

### 7.9 Irreducibility of the residual representations of good forms

*Origin:* adapted from Khare, Larsen and Savin (2008) and Dieulefait and Wiese (2011), Proposition 6.1: irreducibility
of the residual representations for every `ℓ` from tame types at suitably chosen primes; here at the two type primes,
with local parameters that are sums of several induced tame characters, compared across several places, and with
irreducibility kept on normal subgroups with solvable quotient.

*Method of the formal proof:* tame inertia at a type place has `N` distinct eigenvalues, permuted by a Frobenius lift as
raising to a power permutes the roots of the label, so an invariant subspace gives a factor of the label of its
dimension at every type place, which the choice of the labels excludes; on a normal subgroup with solvable quotient the
translates of an invariant subspace form a system of blocks, and a cycle of prime length `p > N/2` with Jordan's theorem
forces irreducibility. Where the published device uses one place whose local parameter is irreducible, here no local
parameter need be irreducible, and the conclusion comes from comparing the factorisation patterns of the labels at
several places.

*The tame labelled form fixed by a tame generator.* For a finite extension `F_v` of `ℚ_p` with residue field `𝔽_{q_v}`
and a topological generator `ς` of its tame inertia group, the *tame labelled form fixed by `ς`* is the tame labelled form of
FiniteReductiveGroups (Conventions) for `𝐭 = (t_d(ς))_{d≥1}`, `t_d` the tame characters of
BaseChangeAndGaloisRepresentationsForUnitaryGroups §10.34, and `ι_𝐭` the reduction of roots of unity of order prime to the residue
characteristic; the label of a regular character `θ` of `F_{v,d}^×` (`F_{v,d}/F_v` unramified of degree `d`) is then the
minimal polynomial over `𝔽_{q_v}` of `ι_𝐭(θ(t_d(ς)))`. In this form clause (iii) of BaseChangeAndGaloisRepresentationsForUnitaryGroups §10.34 says that the eigenvalues
of `ς` on the Langlands parameter of `π_{θ̃}` are the Teichmüller lifts of the roots of the label of `θ`. It is a target of its
owner, routed in every rank by unramified base change of prime degree (BaseChangeAndGaloisRepresentationsForUnitaryGroups §10.33d, with
FiniteReductiveGroups §5.11). The target below uses it in every
rank equal to the degree of an irreducible factor of a label at a type prime (goodness, RowTowerAndRallisIdentities §5.3(iii), asks for a factor of prime
degree in `(r/2, r − 3]`, so ranks up to `r` occur).

(a) *Criterion.* Let `g, ℓ` be primes and `(f_v)_v` a family of labels of degree `N`
over `𝔽_g` with characters `χ_{v,i}`, good in the sense of the five clauses of RowTowerAndRallisIdentities §5.3(iii) (the last forces `N ≥ 8`). Write
`x^{(ℓ′)}` for the prime-to-`ℓ` part of a root of unity `x`. Let `𝔾` be a group, `ρ : 𝔾 → GL_N(𝔽̄_ℓ)`, and for each `v`
elements `τ_v, φ_v ∈ 𝔾` with `ρ(φ_vτ_vφ_v^{−1}) = ρ(τ_v)^g` and `charpoly ρ(τ_v) = ∏_{x root of f_v}(X − ι_v(x^{(ℓ′)}))`
for a homomorphism `ι_v : 𝔽̄_g^× → 𝔽̄_ℓ^×` injective on elements of order prime to `ℓ`. If `ℓ ∉ 𝔅(N, g)` (ThetaChainsOnDefiniteUnitaryGroups §2.7), then `ρ`
is irreducible, and irreducible on every normal subgroup of finite index with solvable quotient containing the `τ_v` (only
the `τ_v` of the place carrying the factor of prime degree is used). For
every prime `ℓ ≠ g` (in `𝔅(N, g)` or not), no `ι_v(χ_{v,i}^{(ℓ′)})` is an eigenvalue of `ρ(τ_v)`.

(b) *Application.* Let the type primes satisfy `𝔅(r, g₀) ∩ 𝔅(r, g₁) = ∅` (ThetaChainsOnDefiniteUnitaryGroups §2.7), `σ` a good eigenform of `𝒞(W_j)` (so its
components at the type places have depth zero and labels of degree `r`), `Σ` its base change, occurring as the rank-`r` part
of an eigensystem of a localisation of 7.1 (7.5(1)), and `ℓ` any prime, `2`, `3` and the type primes included. Then: (1) `Σ` is cuspidal and the reduction `ρ̄_Σ` of any stable lattice is absolutely
irreducible, so its image spans the matrix algebra of rank `r` over the residue field; for `i′ ∈ {0, 1}` with
`ℓ ∉ 𝔅(r, g_{i′})` it stays irreducible on every open normal subgroup with solvable quotient containing the inertia groups
above `g_{i′}`; (2) for each `i′` with `ℓ ≠ g_{i′}` and each place `w | g_{i′}` of `E`, with `ς_w` a tame inertia generator, `χ̄_1(ς_w)` is not an eigenvalue of `ρ̄_Σ(ς_w)`, hence
`H^i(E_w, ρ̄_Σ ⊗ χ̄_1^{−1}χ̄_cyc^e) = 0` for all `i` and `e`. The same holds for every residual representation whose Frobenius
characteristic polynomials are those of the rank-`r` part of a localisation of 7.1 containing a point of `Z_good`. Nothing
is asserted for `Σ` not good, at the places above `ℓ`, or (for the solvable clause) at a type prime with `ℓ ∈ 𝔅(r, g_{i′})`.

*Route.* (a) `ρ(τ_v)` has `N` distinct eigenvalues (clauses (1), (2) and the injectivity of `ι_v`), permuted by `x ↦ x^g`
as Frobenius permutes the roots of `f_v`; an invariant subspace is a sum of eigenlines stable under this permutation at
every `v`, that is a factor of every `f_v` of its dimension, which clause (4) excludes. On a normal subgroup `H` of
solvable index the constituents are permuted transitively; the cycle of prime length `p ∈ (N/2, N − 3]` of clause (5)
forces one block (then `ρ|_H` is irreducible) or `N` blocks, in which case the permutation image, transitive with a cycle of
prime length `p > N/2`, is primitive and contains the alternating group (Jordan's theorem for `p + 3 ≤ N`, Tau Ceti
`TauCeti.alternatingGroup_le_of_isPreprimitive_of_isCycle_mem`), contradicting solvability. The eigenvalue clause is clause (3) with
the injectivity of `ι_v`; it uses only `ℓ ≠ g`. (b) At a place `w | g_{i′}` the component of `Σ` has depth zero, with label
`f_v` (FiniteReductiveGroups §6.3: the label of the Harish-Chandra series of its principal-congruence
invariants), squarefree by goodness, so its supercuspidal support consists of pairwise unlinked depth-zero
supercuspidals `π_{θ̃_i}` (FiniteReductiveGroups §6.2) with the irreducible factors of `f_v` as labels. The away-prime comparison 7.4(3) gives
`N = 0` and the restriction to inertia of the parameter; BaseChangeAndGaloisRepresentationsForUnitaryGroups §10.35(c) writes it
through the parameters of the `π_{θ̃_i}`, and BaseChangeAndGaloisRepresentationsForUnitaryGroups §10.34 (iii) in the rank `n_i` of each factor, in the tame labelled form fixed by a tame generator `ς_w` (with the type characters read in `𝔽_g^×` through the
same form, ThetaChainsOnDefiniteUnitaryGroups §2.9a), turns it into the characteristic polynomial of (a): this is the depth-zero away-prime comparison
BaseChangeAndGaloisRepresentationsForUnitaryGroups §14.2. At both places of
each conjugate pair above a type prime (at the second with inverted eigenvalues, whence goodness for `χ^{−1}`) this gives the
hypotheses of (a) with `τ_v = ς_w` and `φ_v` a Frobenius lift; for every `ℓ` one type prime has `ℓ ∉ 𝔅(r, g_{i′})` by the
disjointness. For (2): `χ_1`, the `ℓ`-adic character of `μ_j(ξ_𝔭)η̃^{−1}|·|^{−r/2}` (7.5(1); the norm factor is unramified), has
inertial character the residue `χ_{v,j}^{−1}` of `μ_j` at `w_v` and `χ_{v,j}` at
`w̄_v` (ThetaChainsOnDefiniteUnitaryGroups §2.4(b); `η̃` and `ξ_𝔭` are unramified at the type places), read in the same tame labelled form, and clause (3) of
goodness excludes both `χ_{v,j}` and `χ_{v,j}^{−1}` among the prime-to-`ℓ` parts of the roots. Absolutely irreducible
gives the span (Burnside, ArithmeticGaloisRepresentations §1.8); `H⁰`, and `H²` by local duality, vanish by the eigenvalue
clause, and `H¹` by the local Euler characteristic. Residual representations with the same Frobenius polynomials have the
same semisimplification (Chebotarev; ArithmeticGaloisRepresentations §§5.3, 1.8: recognition on a dense subset,
Brauer–Nesbitt).

*Sources:* (Bushnell–Kutzko; Henniart; Shintani; Jordan). (b): [FormalProof],
`Formalism/SharpRestriction/LevelLetterCocycles/JointConditionsZpowers/ResidualIrreducibleRankR.lean` (`Formalism.MainNotions.N.ResidualIrreducibleRankR`),
`Formalism/SharpRestriction/LevelLetterCocycles/DataN.lean` (`Formalism.MainNotions.N.IsRhoBar`),
`Formalism/SharpRestriction/LevelLetterCocycles/SumRepresentations.lean` (`Formalism.MainNotions.SumRepresentations.At.ConclusionG5`);
(b) (1), `Σ` cuspidal: [FormalProof],
`Development/AbelianVarietyTheory/BlockTheory/NonGaloisCusps/CMTypeEmbeddings.lean` (`GlobalTheory.IndefiniteRowSideFullHecke.CMTypeEmbeddings.GoodRowCuspParam`).
*Needs:* ThetaChainsOnDefiniteUnitaryGroups §2.7, ThetaChainsOnDefiniteUnitaryGroups §2.9, ThetaChainsOnDefiniteUnitaryGroups §2.9a, RowTowerAndRallisIdentities §5.3, 7.4, 7.5;
FiniteReductiveGroups §§5.2, 5.5, 5.7, 6.1, 6.2, 6.3, 6.4 (and its Conventions: the tame labelled form);
BaseChangeAndGaloisRepresentationsForUnitaryGroups §§14.2 (the depth-zero away-prime comparison),
10.34, 10.35 (the inertial type; the support formula); Tau Ceti `TauCeti.alternatingGroup_le_of_isPreprimitive_of_isCycle_mem`;
ClassFieldTheory §5.1 (local duality, Euler characteristic); ArithmeticGaloisRepresentations §§1.8, 5.3.

### 7.6 The local condition at `ℓ`

*Origin:* particular to this proof: exact local conditions at `ℓ` for the lattices of the chain, whose Hodge–Tate
weights lie far beyond `ℓ`, outside the Fontaine–Laffaille range, at primes above a threshold and outside an explicit
exceptional set; nearest published result: Fontaine and Laffaille (1982), the exact condition for weights in an interval
of length at most `ℓ − 2`.

*Method of the formal proof:* at a prime above the threshold the weights of the chain (block, lows, cloud) are shown to
be in position, the carries being bounded through a geometric series and the exceptional set being the primes that
divide an integer of a window; the local theorem at `ℓ` for weights in position is then applied after an unramified
enlargement of the coefficients, and its three conclusions descend back. It departs from the published argument, which
needs the weights in the Fontaine–Laffaille range, by resting on that local theorem for weights in position.

(a) *Position of the weights.* Let the chain weight datum satisfy the separation (W7)
and the size conditions `SizeSep` of ThetaChainsOnDefiniteUnitaryGroups §2.3c with the threshold `ℓ*` of ThetaChainsOnDefiniteUnitaryGroups §2.3c, put `σ⁺ := ⌊2b/ℓ*⌋`, and assume the size predicate
`SizeThin` (defined here; the targets that use it carry it as a hypothesis): `x·r·(Sc + 2η_s + 2σ⁺ + t + x^ε + 4) ≤ m·w″` (`w″` of ThetaChainsOnDefiniteUnitaryGroups §2.1, the least base size of
ThetaChainsOnDefiniteUnitaryGroups §2.3b). (`SizeThin` is a predicate of this roadmap. It is used three times: for the
positivity of the windows below, for the sizes of the words in 7.10a, and for the resonance terms in 7.10c. [FormalProof] has
no single condition of this shape: it carries separate inequalities on the same quantities, among them
`100·(η_s + Sc + t + 2) ≤ w″`, `t·η_s ≤ w″/x` and `N_m·η_s ≤ δ_th·m·w″`; `SizeThin` neither implies all of them nor follows
from them, and the three uses here need `SizeThin` only.) For a step `j` and `τ ∈ Φ` the
Hodge–Tate weights of `χ_1^{−1}r_x` at `τ` (7.4(4), 7.5(1)) are the block `{0, …, t − 1}`, the `m` *lows*
`(t − 1)/2 + w_j(τ) − e′_a(τ)` (`0 ≤ a < m`) and the `k − 1` *cloud weights* `(t − 1)/2 + w_j(τ) + v_a(τ)` (`0 ≤ a < k − 1`), and
at `τ∘c` their images under `q ↦ t − 1 − q`. Let `Exc` be the set of primes `ℓ > ℓ*` dividing an integer `n` with
`W₀ − η_s − 2σ⁺ − 3 ≤ n ≤ W₀ + Sc + 2η_s + 2σ⁺ + 4` for one of the numbers `W₀ ∈ {b, w″} ∪ {a⁻_τ + ⌊b′/x⌋ : τ ∈ Φ_top}`: the
base sizes of ThetaChainsOnDefiniteUnitaryGroups §2.3b, with the base size `a⁻_τ + b′/x` of a top place taken with the floor
`⌊b′/x⌋`, as [FormalProof] takes it (`η_s` of ThetaChainsOnDefiniteUnitaryGroups §2.3c; assume that at a top place `τ` every
step weight satisfies `w_j(τ) ≤ a⁻_τ + b′/x + η_s`, which the top window of ThetaChainsOnDefiniteUnitaryGroups §2.3b gives
when `η_s := ϑ`). Then
`#Exc ≤ (|Φ_top| + 2)·(Sc + 3η_s + t + 8b/ℓ* + 9)`, every element of `Exc` is at most `3b`, and for every prime `ℓ > ℓ*` not in
`Exc` and not a type prime: `ℓ > t + 1`, `ℓ` is unramified in `E`, and at every place `w | ℓ` of `E` the following data are
position data in position in the sense of WachLatticesOverTheCyclotomicTower §6.9. Index the embeddings `emb_i` of `E_w`
by `i ∈ ℤ/n` as in WachLatticesOverTheCyclotomicTower §6.4 (in its setting: coefficients containing the images of the
embeddings of `E_w(ζ_ℓ)`); the datum of index `i` is read at the embedding `emb_{i−1}` (the source of `φ_i`), whose
Hodge–Tate weights are `HT_i`: `U_i` the weights of `ρ_Σ ⊗ χ_1^{−1}` and `B_i` the block at `emb_{i−1}`, after a crystalline
twist into `[1, h_i − 1]`; the type of index `i` is low if `emb_{i−1}` lies above an embedding of `Φ` and high otherwise;
and `d_τ + d_{τ∘c} = r`. (The heights can be taken with `h_i ≤ b + 2Sc + 2η_s + 3`, and then `σ_i ≤ σ⁺`: this is the
choice of the route below; [FormalProof] asserts the existence of position data in position, not these two bounds.)

(b) *The local condition.* For such `ℓ` and `w`, the cocycles of LengthBoundsInPadicFamilies §1.8c(2) for the family of 7.4 and the
character `χ_1` (cut out of a lattice in `⊕_x χ_1^{−1}r_x`), restricted to `G_{E_w}`, are: for the block `ρ_Σ`, Bloch–Kato
finite classes with torsion coefficients up to coboundaries; for the blocks `χ_cχ_1^{−1}`, `2 ≤ c ≤ t`, coboundaries; for
the trivial block, unramified homomorphisms.

*Remark.* The route gives the count `(|Φ_top| + 2)·(2Sc + 4η_s + 4σ⁺ + 9)`, which has no term in `t`, for the larger set of
the primes `ℓ > ℓ*` dividing an integer `n` with `|n − W₀| ≤ Sc + 2η_s + 2σ⁺ + 4` for one of the same numbers `W₀`, and so for `Exc`:
each of these windows contains at most `2Sc + 4η_s + 4σ⁺ + 9` integers. This form is this roadmap's own: [FormalProof]
does not state it, and nothing later uses it.

*Route.* (a) `ℓ > ℓ*` gives `ℓ > t + 1` (`SizeSep`: `t < ℓ*`) and `ℓ ∤ f_E` (every prime dividing `f_E` is `< ℓ*`, ThetaChainsOnDefiniteUnitaryGroups §2.3c).
The Hodge–Tate multiset of `χ_1^{−1}r_x` is that of 7.4(4) for the coefficient weight of RowTowerAndRallisIdentities §5.7. (W7) and the bound `η_s` place every low at distance between `2b/ℓ* + t/2 + 3` and `η_s` from the centre of
the block, which gives (P2) and (P4); the windows of ThetaChainsOnDefiniteUnitaryGroups §2.3b, and at a top place the bound `w_j(τ) ≤ a⁻_τ + b′/x + η_s`
with `0 ≤ b′/x − ⌊b′/x⌋ < 1`, place the cloud within `Sc + η_s + 1` of a number `W₀` beyond the centre, so `h ≤ b + 2Sc + 2η_s + 3` and `σ_i ≤ h/(ℓ − 1) ≤ 2b/ℓ*` (the series `Σ_{j≥0} h/ℓ^{j+1}` sums to `h/(ℓ − 1)`) by the first size condition of ThetaChainsOnDefiniteUnitaryGroups §2.3c; (P3)
is the second size condition; (P5) is `ℓ ∉ Exc`. The count: each window contains at most `Sc + 3η_s + 4σ⁺ + 8 ≤ Sc + 3η_s + t + 8b/ℓ* + 9` integers (`σ⁺ ≤ 2b/ℓ*`), all positive (`SizeThin` gives `Sc + 2η_s + 2σ⁺ + 4 < w″ ≤ W₀`) and at
most `3b`; an integer `≤ 3b` has at most one prime factor `> ℓ*` because `ℓ*² > 8b` (ThetaChainsOnDefiniteUnitaryGroups §2.3c); there are at most `|Φ_top| + 2` numbers `W₀`.
Without a positive lower end the window may contain `0`, which every prime divides: then (P5) fails at every prime. (b) The cut cocycles come from a lattice in `⊕_xχ_1^{−1}r_x` by the construction of the module `Y`
there; every `r_x` is crystalline at `w` with the same Hodge–Tate weights and the same residual characteristic polynomial
as `r_π` (7.4: all `x` are congruent in the localisation), so after an enlargement of the coefficients
containing the images of the embeddings of `E_w(ζ_ℓ)` (the setting of WachLatticesOverTheCyclotomicTower §6.4), and the
crystalline twist of (a), every `r_x` is a full representation
and the cocycles are admissible in the sense of SelmerLengthBoundsAndLocalLifting §4.10a; that theorem identifies admissible
cocycles with finite classes, coboundaries and unramified homomorphisms in the three cases, and the statement descends
from the enlarged coefficients.

*Checks.* (i) If all weights of `χ_1^{−1}r_x` at `w` lie in an interval of length at most `ℓ − 2` (then `σ = 0`), (b) is
the Fontaine–Laffaille comparison of SelmerIwasawaCohomology §4.10. (ii) A datum with `e_i − e′_i = (t + 3)/2` satisfies
(W1) and violates (W7): a low then lies at distance `2` from the block, (P4) fails at every `ℓ`, and (a) does not apply.

(a), the weights: [FormalProof],
`Formalism/SharpRestriction/LevelLetterCocycles/AdmissibleParameterJ.lean` (`Formalism.MainNotions.AdmissibleParameterJ.cloudJ`);
(a), the set `Exc`, its count and the bound `3b`: follows from [FormalProof],
`Development/AbelianVarietyTheory/BlockTheory/NonGaloisCusps/BaseSizes.lean` (`GlobalTheory.IndefiniteRowSideFullHecke.BaseSizes.Exc`),
`Development/AbelianVarietyTheory/Definitions/NonGaloisDescent/BoundAtTwoThreeFamily.lean` (`GlobalTheory.NLink.ExcOK`), proved for
`Exc` under the size conditions of [FormalProof] as
`Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/ExcludedPrimesFewAndSmallAlongFamily.lean` (`GlobalTheory.NLink.ExcBound.excOK_at`),
with the clause of defect `0` off `Exc` that 7.7c uses as
`Development/AbelianVarietyTheory/Definitions/NonGaloisDescent/BoundAtTwoThreeFamily.lean` (`GlobalTheory.NLink.StarE`);
(a), the position data off `Exc`: follows from [FormalProof],
`Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/ExistsLocalSlotDataOffExceptionalPrimesStatement.lean` (`GlobalTheory.T.exists_localPositionData_off_exceptional_primes`),
`Formalism/SharpRestriction/LevelLetterCocycles/TableLineDegreeTwo.lean` (`Formalism.MainNotions.tableLineDegreeTwo.PositionHyps`);
(b): [FormalProof],
`Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/AdmissibleOfLargeResidueChar.lean` (`GlobalTheory.UseLoc.main`).
*Needs:* ThetaChainsOnDefiniteUnitaryGroups §2.1, ThetaChainsOnDefiniteUnitaryGroups §2.3, ThetaChainsOnDefiniteUnitaryGroups §2.3b, ThetaChainsOnDefiniteUnitaryGroups §2.3c, 7.4, 7.5; SelmerIwasawaCohomology §§4.9, 4.10 and
SelmerLengthBoundsAndLocalLifting §§4.9a, 4.10a; WachLatticesOverTheCyclotomicTower §§6.4, 6.9; LengthBoundsInPadicFamilies §1.8c.

### 7.7a The setting and the hypotheses of the Ribet-type bound

*Origin:* adapted from Bellaïche and Chenevier (2009): the setting of a family whose distinguished point is residually
reducible, here for the lifts `Σ ⊞ μ[t]`, with `t` Tate twists of one character, whose first line is isolated by an
element `E` with `E² = δE` for an explicit non-unit `δ` in place of an idempotent.

*Method of the formal proof:* a commutator of lifts of matrix units shows that the image of the algebra contains the
matrix factor, and the idempotents are taken in the closure of the powers of an element of the span of the family whose
value at the point is the prescribed projector, a compact semigroup containing an idempotent; the line of the first
character is isolated by an element built from one inertia element above `ℓ`, corrected by a power of the uniformiser
times an element vanishing at the point, over the splitting algebra of its characteristic polynomial. Where the
published setting separates the character lines by idempotents, here the values of the characters at the chosen element
may be congruent, and the loss is measured by the valuation of `δ`.

*Setting for 7.7a–7.7d.* Let `𝔭 | ℓ` be a twisted place (`ℓ` any prime, the type
primes included), `𝔪` a maximal ideal of `𝕋` containing a point `π ∈ Z_good` with `r_π ⊗ K_O ≅ ρ ⊕ χ_1 ⊕ ⋯ ⊕ χ_t` (7.5(1)),
`X_s ⊂ X_𝔪` a set with `π ∈ X_s` and `Z ∩ X_s ⊂ Z_good`, `c(π) := {f(π) : f ∈ 𝕋_𝔪, f = 0 on X_s ∖ Z}` and `W := ρ ⊗ χ_1^{−1}`;
`n_w := [E_w : ℚ_ℓ]` for a place `w | ℓ` of `E`. Consider the conditions:

- (R) (i) `ρ̄` is absolutely irreducible; (ii) at every `v ∈ Σ(𝔭) ∪ Q(ψ_𝔭)`, `χ_c = χ_1` on inertia for every `c`; with `ς₀`
  a topological generator of tame inertia at `v`: (iii) at every `v ∈ Σ(𝔭)` above a type prime there is a polynomial `P`
  over `𝕋_𝔪` with `P(χ_1(ς₀))` a unit and `P(r_x(ς₀))·(r_x(ς) − χ_1(ς)) = 0` for all `x ∈ X_s` and all inertia elements `ς`
  at `v`; (iv) at every `v ∈ A(ℓ)`, `(r_x(ς) − 1)(r_x(ς) − χ_1(ς)) = 0` for all `x` and all inertia elements `ς`, and
  `χ_1(ς₀) − 1` is a unit; (v) at every `v ∈ Q(ψ_𝔭)`, `(r_x(ς) − 1)(r_x(ς) − χ_1(ς)) = 0` for all `x` and all inertia elements
  `ς`, and `χ_1(ς_v) ≠ 1` for a tame generator `ς_v`;
- (L′) at every place `w | ℓ`: every `χ_1^{−1}r_x` (`x ∈ X_𝔪`) is de Rham, with Hodge–Tate weights independent of `x` and of
  multiplicity one;
- (L) at every place `w | ℓ`: (L′) holds, every `χ_1^{−1}r_x` is crystalline, its Hodge–Tate weights are different from
  `−1`, and `H⁰(E_w, W) = 0 = H⁰(E_w, W^*(1))`.

Lengths are normalised by `length(O/ℓ) = 1` and exponents are exponents of `ℓ` (LengthBoundsInPadicFamilies §1.8e is written with
exponents of a uniformiser `ϖ` and `O`-lengths: an exponent `e′` of `ℓ` there is `e′·e(O/ℤ_ℓ)`, and both sides of its
inequalities divide by `e(O/ℤ_ℓ)`). Put `u_g := χ_1(g)^{−1}r(g)`; for an element `E` of the algebra `𝒜` spanned by the
`r(h)`, the *cut module* is `Y := Σ_{g∈G_E}𝒜·(u_g − 1)E ⊂ 𝒜E`, taken on the points over `X_s` (the module `Y_s` of
LengthBoundsInPadicFamilies §1.8c; LengthBoundsInPadicFamilies §1.8e is applied to the family restricted to the points over `X_s`,
whose module `Y` is this one), and the *cut cocycles* of a
block `b` of `r_π` (of rank `d_b`) are the cocycles `g ↦ φ((u_g − 1)E)`, `φ` an `𝒜`-linear map from that module (or from
the module with columns of LengthBoundsInPadicFamilies §1.8e) to `O^{d_b} ⊗ K_O/O`.

*Statement* (*the hypotheses of the Ribet-type bound*). Assume (R) and (L′). Then (P), (D) and (N) of LengthBoundsInPadicFamilies §1.8c
hold for `𝕋_𝔪`, the family `(r_x)_{x∈X_𝔪}` of 7.4, `χ = χ_1`, the blocks `ρ, χ_1, …, χ_t` of `r_π`, the cut `X_s` and the set
`Z`; there are idempotents `e_B`, `e₁` of `𝒜` with `e_B(x)` of rank `t` (the character blocks at `π`) and `e₁(x)` of rank one
(on the `ρ`-block at `π`) at every point `x` of `X_𝔪`. *The element `E`.* Let `g` be an element of an inertia group above
`ℓ` with `χ_cyc(g) = 1 + ℓ^{s₀}u`, `u` a unit, `s₀ ≥ 1` (`s₀ ≥ 2` if `ℓ = 2`). There are `L ≥ 0` and `s = Σ_k j_k·e_Ba_ke_B`
(`j_k ∈ 𝕋_𝔪` vanishing at `π`, `a_k ∈ 𝒜`) such that the characteristic polynomial `P_g` of `X₀ := e_Br(g)e_B + ℓ^L s` on the
image of `e_B` has `t` distinct roots at every point of `X_𝔪`, all in `O` after a finite extension of `O`. Let `A′ ⊃ 𝕋_𝔪` be
the splitting algebra of `P_g` (free of rank `t!`, roots `α_1, …, α_t`), `π′` the point over `π` with `α_c(π′) = χ_c(g)`, and
`E := ∏_{c≥2}(X₀ − α_c e_B)`. Then `E² = δ·E` with `δ := ∏_{c≥2}(α_1 − α_c)` (the roots, not their values `χ_c(g)` at `π`:
with constants `E` would have rank `> 1` where the roots move); `E(π′)` is `δ(π′)` times the projector onto the `χ_1`-line,
with `v_δ := v(δ(π′)) = Σ_{0<i<t}(s₀ + v_ℓ(i))`; and at every point over `X_s ∖ Z`, `δ ≠ 0` and `E` has rank one. If
`ℓ > t + 1` and `ℓ` is unramified in `E`, `g` may instead be chosen with `χ_cyc(g)` a generator of `(ℤ/ℓ)^×` and `s = 0`;
then `δ(π′)` is a unit and one puts `v_δ := 0`. The bounds over `A′` at `π′` bound the ideal `c(π)` of `𝕋_𝔪` (LengthBoundsInPadicFamilies
§1.8c(5), applied `t − 1` times).

*Route.* (P): the characteristic coefficients of the `r(g)` lie in `𝕋_𝔪` and `g ↦ det(1 + Y r(g))` is a `𝕋_𝔪`-valued
determinant (7.4(1)), a polynomial law, so for `a_1, …, a_m ∈ 𝒜` the coefficients of `x ↦ det(Σ_iX_ia_i(x))` lie in `𝕋_𝔪`; the
form of the formal proof stated at LengthBoundsInPadicFamilies §1.8c then gives (P) without variables, the form in which
[FormalProof] uses it, and LengthBoundsInPadicFamilies §1.8c(4), that roadmap's own clause, gives (P) as stated there. (D): over
`K_O`, `r_π` is the block sum of 7.5(1); the block map of `ρ` is onto `M_r(O)` by (R)(i) (Burnside:
ArithmeticGaloisRepresentations §1.8 *Over an algebraically closed field*; Nakayama), those of the
characters trivially. (N): an `x ∈ X_s ∖ Z` has no `χ_1`-line, by 7.5(2), whose hypotheses are `π ∈ X_𝔪` and (R)(i). *Idempotents.* All
points of `X_𝔪` have the residual semisimplification `ρ̄ ⊕ χ̄_1 ⊕ ⋯ ⊕ χ̄_t`, with `ρ̄` absolutely irreducible of dimension
`r ≥ 2`; so `𝒜/Rad(𝒜)` has the matrix factor of rank `r` over the residue field of `O` given by `ρ̄` and the factors of the
characters, and the central idempotent of the characters and a rank-one idempotent of that matrix factor lift to `e_B`,
`e₁` (IntegralHeckeAndGaloisDeterminants §1.3, Henselian lifting of matrix units); at every point an idempotent acts on the
composition factors as its reduction does, which gives the ranks `t` and `1`. *Distinct roots.* This is LengthBoundsInPadicFamilies
§1.8e(4) for `𝕋_𝔪`, `ε = χ_cyc` and the idempotent `e_B`; its hypotheses hold: `𝕋_𝔪` separates the points of `X_𝔪` (notation
of this layer), and every `r_x ⊗ K_O` is a direct sum of pairwise non-isomorphic absolutely irreducible representations.
At `π` these are the blocks of 7.5(1): `ρ` is absolutely irreducible by (R)(i), and the characters `χ_c = χ_1χ_cyc^{−(c−1)}`
are pairwise distinct because `χ_cyc(g) = 1 + ℓ^{s₀}u` is not a root of unity. At a point `x ≠ π`, `r_x ⊗ K_O` is semisimple
(7.4) and multiplicity free, since its Hodge–Tate weights at a place above `ℓ` have multiplicity one (L′), and its
constituents are absolutely irreducible after a finite extension of `O`. That statement gives `s` with `s(π) = 0`, the
splitting algebra `A′`, `E² = δE`, the value at `π′` and `v_δ`; at a point with distinct roots `E` is `δ` times the projector
onto the `α_1`-eigenline. In the unit case the roots are distinct modulo `ℓ`, and `s = 0` suffices.

*Checks.* (i) For `ℓ = 3`, `t = 3` and `s₀ = 1`: `v_δ = (1 + 0) + (1 + 0) = 2`; with `χ_cyc(g)` a generator modulo `3` the
factor `1 − χ_cyc(g)^{−2}` would vanish modulo `3`. With `χ_cyc(g)` a generator modulo `ℓ`, the factors `1 − χ_cyc(g)^{−i}`,
`0 < i < t`, are all units exactly when `t − 1 < ℓ − 1`, so the generator choice needs `ℓ > t` (for `ℓ = 5`, `t = 4`,
`χ_cyc(g) ≡ 2` they are `−2, −3, −1` modulo `5`); the statement assumes `ℓ > t + 1`. (ii) The correction `s` is
needed: with `s = 0` two roots of `e_Br_x(g)e_B` may coincide at a point `x ≠ π` (two characters of `r_x` equal on `g`), and
then the extension `A′` has a double root over `x`, where the congruence ideal over `A′` no longer bounds that of `𝕋_𝔪`
(LengthBoundsInPadicFamilies §1.8c, Check on (5)).

The statement: follows from [FormalProof],
`Formalism/SharpRestriction/LevelLetterCocycles/SumRepresentations.lean` (`Formalism.MainNotions.SumRepresentations.At.IdempotentChoiceProperties`),
`Formalism/SharpRestriction/LevelLetterCocycles/SumRepresentations.lean` (`Formalism.MainNotions.SumRepresentations.At.inertia_props_of_idempotent_choice`);
`v_δ`: [FormalProof],
`Formalism/SharpRestriction/LevelLetterCocycles/DataN.lean` (`Formalism.BasicNotions.NData.vdel`).
*Needs:* 7.4, 7.5; LengthBoundsInPadicFamilies §§1.8c, 1.8c(4), 1.8c(5), 1.8e(4);
IntegralHeckeAndGaloisDeterminants §1.3; ArithmeticGaloisRepresentations §1.8.

### 7.7b The congruence ideal bounded by a Selmer group, with local defects

*Origin:* adapted from Bellaïche and Chenevier (2009) and Urban (2001): the congruence ideal bounded by Selmer lengths
through lattices in a family, here for the lifts `Σ ⊞ μ[t]` with `t + 1` blocks at once (a Selmer group, the class
group and the groups `Ш¹(E, ℓ, e)`) and with explicit local defects where the condition above `ℓ` is not exact.

*Method of the formal proof:* after conjugating the family so that the representation at the point is block diagonal,
a display bounds the length of the quotient by the congruence ideal by lengths of the modules spanned by the cut
cocycles of the blocks, and a Selmer inequality is applied whose hypotheses are local clauses at the column and row
places (lifted finite classes with loss, colength of the dual lattice with the annihilators of Bloch and Kato, character
blocks finite up to a power of `ℓ`). Where the published bounds assume exact local conditions above `ℓ`, here each
inexact condition enters as an explicit defect term.

In the setting of 7.7a, assume (R) and (L′), and let `E`, `δ`, `v_δ` be as
there; let `Sel(W) ⊂ H¹(G_E, W ⊗ K_O/O)` be the classes that are Bloch–Kato finite above `ℓ`, unrestricted at
`Σ(𝔭) ∪ Q(ψ_𝔭)` and unramified elsewhere: the relaxed Selmer group of SelmerLengthBoundsAndLocalLifting §3.22 with the set `S` of the
places above `ℓ` and `∞` together with `Σ(𝔭)`, the set `Q = Q(ψ_𝔭)` (disjoint from `S`), and the Bloch–Kato condition above
`ℓ`, a balanced saturated condition by SelmerLengthBoundsAndLocalLifting §4.9b; and `ς_v` a tame inertia generator at `v ∈ Q(ψ_𝔭)`. Suppose `Sel(W)` and the
`Ш¹(E, ℓ, e)`, `0 < e < t`, are finite.

(i) *The bound with columns and rows* (`ℓ ∉ {g₀, g₁}`, under (L)). Let the places of `E` above `ℓ` be partitioned into
`Row ⊔ Col`, and suppose given `e′_w ∈ ℕ` (`w ∈ Col`), `ν_w ≥ 0` (`w ∈ Row`) and `c_B ∈ ℕ` such that:
- (Lift) for `w ∈ Col` and every surjection `L₁ ↠ L₂` of `G_{E_w}`-stable lattices in subquotients of finite sums of the
  `χ_1^{−1}r_x`, `ℓ^{e′_w}·H¹_f(L₂)` lies in the image of `H¹_f(L₁)`;
- (Row) for `w ∈ Row`, every stable lattice `T` in `W^*(1)` and every surjection `T₁ ↠ T` from a stable lattice in a
  subrepresentation of a finite sum of the `(χ_1^{−1}r_x)^*(1)`, the cokernel of `H¹_f(T₁) → H¹_f(T)` has length at most
  `ν_w`;
- (TB) for every `w ∈ Row`, every `0 ≤ e < t`, every exact sequence `0 → Y′ → Ỹ → O → 0` of `G_{E_w}`-stable `O`-lattices in
  finite sums of the `χ_1^{−1}r_x` (`O` with trivial action), `ỹ ∈ Ỹ` over `1` and every `O`-linear `G_{E_w}`-map
  `ϕ : Y′ → (K_O/O)(−e)`: `ℓ^{c_B}·[g ↦ ϕ((g − 1)ỹ)]` lies in `H¹_f(E_w, (K_O/O)(−e))`, and the classes `c` of
  `H¹(E_w, (K_O/O)(−e))` with `ℓ^{c_B}c ∈ H¹_f` have length at most `(n_w + 2)c_B` modulo `H¹_f`;
- (Col) for `w ∈ Col` and every point `x` over `X_s ∖ Z`, the finite classes of `H¹(E_w, V_x)`, `V_x := χ_1^{−1}r_x ⊗ K_O`, have
  dimension at most `j_w + dim H⁰(E_w, V_x)`, `j_w := dim H¹_f(E_w, W)`.

Then, with `L` the lattice of `W` cut by `e₁` (the lattice of the block `ρ`, twisted by `χ_1^{−1}`),

   `v(c(π)) ≤ length Sel(W) + Σ_{0<e<t} length Ш¹(E, ℓ, e) + v_ℓ(h_E) + t·Σ_{v∈Q(ψ_𝔭)} v(χ_1(ς_v) − 1)`
   `     + Σ_{w∈Col} ( (1 + j_w)e′_w + (j_w + 2)v_δ + length H⁰(E_w, L ⊗ K_O/O) ) + Σ_{w∈Row} ν_w`
   `     + t·c_B·Σ_{w∈Row}(n_w + 2) + 4(r + t)(#Col + 1)·v_δ + t·#Col·max_{w∈Col, 0<e<t} length H⁰(E_w, (K_O/O)(−e))`.

*The form of the formal proof.* Its hypotheses at a place are asked for every finite extension of the coefficient field of
the kind it admits, and all lengths are in units of `length(O/ℓ)`. (Lift) as stated. (Row) is asked for one lattice: the
lattice `T` of `W^*(1)` dual to `L`, and the lattices isomorphic to it. (TB) is asked, at the rows, in three clauses: for
every `G_{E_w}`-stable lattice `Ỹ` in a crystalline representation whose Hodge–Tate weights at each embedding are among
those of `χ_1^{−1}r_π`, every invariant functional of `Ỹ` onto `O`, `ỹ` over `1`, `0 ≤ e < t` and every `O`-linear `ϕ`
that is equivariant on the kernel `Y′` of the functional, `ℓ^{c_B}·[g ↦ ϕ((g − 1)ỹ)]` is finite; the finite classes of
`H¹(E_w, (K_O/O)(−e))` are zero for `e > 0` and the unramified ones for `e = 0`; and the classes `c` with `ℓ^{c_B}c` finite
have length at most `(n_w + 1)c_B` modulo the finite ones. (Col) is not a hypothesis there: its place is taken by local
Tate duality, the dimension formula and the exact annihilators of Bloch and Kato at the places above `ℓ`, with the
conditions of (L) on the weights. The conclusion is the inequality above, with `t·c_B·Σ_{w∈Row}(n_w + 2)`. The forms of
(Row) for every `T`, and of (TB) for lattices in finite sums of the `χ_1^{−1}r_x` with `(n_w + 2)c_B`, are this roadmap's.

(ii) *The bound with direct defects* (every `ℓ`, the type primes included). If for every `w | ℓ` the restrictions to
`G_{E_w}` of the cut cocycles of the block `ρ` span, modulo the finite classes, a module of length at most `ν_ρ(w)`, and those
of each block `χ_cχ_1^{−1}`, `1 ≤ c ≤ t`, at most `ν_χ(w)`, then

   `v(c(π)) ≤ length Sel(W) + Σ_{0<e<t} length Ш¹(E, ℓ, e) + v_ℓ(h_E) + t·Σ_{v∈Q(ψ_𝔭)} v(χ_1(ς_v) − 1)`
   `     + Σ_{w|ℓ}(ν_ρ(w) + t·ν_χ(w)) + 4(r + t)·v_δ`.

*The form of the formal proof.* [FormalProof] states (ii) with one pair of exponents for all places above `ℓ`: if there are
integers `e_ρ, e_χ ≥ 0` such that for every `w | ℓ` the restrictions to `G_{E_w}` of the cut cocycles of the block `ρ` span,
modulo the finite classes, a module of length at most `e_ρ`, and those of each block `χ_cχ_1^{−1}`, `1 ≤ c ≤ t`, at most
`e_χ`, then

   `v(c(π)) ≤ length Sel(W) + Σ_{0<e<t} length Ш¹(E, ℓ, e) + v_ℓ(h_E) + t·Σ_{v∈Q(ψ_𝔭)} v(χ_1(ς_v) − 1)`
   `     + #{w | ℓ}·(e_ρ + t·e_χ) + 4(r + t)·v_δ`.

This is (ii) with `ν_ρ(w) = e_ρ` and `ν_χ(w) = e_χ` at every `w | ℓ`. The place-dependent form (ii) is this roadmap's own,
proved by the route below from LengthBoundsInPadicFamilies §1.8e (2), and is not a statement of [FormalProof].

*The cyclotomic level of a place.* For `w | ℓ` let `E_{w,0}` be the maximal unramified subfield of `E_w`, `s_w` the least integer
`s ≥ 1` (`≥ 2` if `ℓ = 2`) such that `E_w ⊂ K(μ_{ℓ^s})` for some finite unramified extension `K` of `ℚ_ℓ`, `K_w` the unramified
extension of `ℚ_ℓ` of least degree with `E_w ⊂ K_w(μ_{ℓ^{s_w}})`, and `f″_w := [K_w : E_{w,0}]`. These exist, `K_w ⊇ E_{w,0}`,
`s_w ≤ 2 + log_ℓ n_w` and `f″_w | n_w`: by local class field theory (ClassFieldTheory §8.1, with the cyclotomic
normalization of ClassFieldTheory §7.1; `E_w/ℚ_ℓ` is abelian), `E_w ⊂ K(μ_{ℓ^s})` with `[K:ℚ_ℓ] = d` means
that the norm group of `E_w`, of index `n_w`, contains `ℓ^d` and `1 + ℓ^sℤ_ℓ`; `s_w` is bounded by the order of the image of
`1 + ℓℤ_ℓ` (of `1 + 4ℤ_2`), and `[K_w:ℚ_ℓ]` is the order of `ℓ` modulo the norm group, both dividing `n_w`; and the maximal unramified
subfield of `K_w(μ_{ℓ^{s_w}})` is `K_w`. In general `K_w ≠ E_{w,0}`: a totally ramified abelian `E_w` whose norm group does not
contain `ℓ` lies in no `E_{w,0}(μ_{ℓ^s})`. The character terms are elementary: `length H⁰(E_w, (K_O/O)(−e)) ≤ s_w + v_ℓ(e)`,
because the image of `G_{E_w}` under `χ_cyc` contains that of `G_{K_w(μ_{ℓ^{s_w}})}`, which is `1 + ℓ^{s_w}ℤ_ℓ` (`K_w` unramified);
likewise an element `g` of 7.7a with `s₀ = s_w` exists, so `v_δ ≤ t·s_w + v_ℓ(t!)`.

*Route.* (i) The Ribet-type bound with local defects: LengthBoundsInPadicFamilies §1.8e(1) (the module with columns and the kernel
counts) and LengthBoundsInPadicFamilies §1.8e(2) (the bound), with LengthBoundsInPadicFamilies §1.8e(3) and SelmerLengthBoundsAndLocalLifting §4.10b at the rows and
LengthBoundsInPadicFamilies §1.8d(2′), (3′) (local
defects; a non-unit `δ`), for the hypotheses of 7.7a. Outside `ℓ`: unramified away from `Σ(𝔭) ∪ Q(ψ_𝔭)` (7.4(2)); at the
places of `Σ(𝔭)` the clauses (iii), (iv) of (R) give an element of the algebra killing `(r(ς) − χ_1(ς))E` on the points over
`X_s` and acting on the character blocks by a unit, so their cocycles vanish on inertia there (at a type place the element
is `P(r(ς₀))`; at a place of `A(ℓ)` it is `r(ς₀) − 1`: wild inertia acts trivially, `r(ς₀)` is diagonalisable with eigenvalues
`1` and `χ_1(ς₀)` because `χ_1(ς₀) − 1` is a unit, so `r(ς) − χ_1(ς)` is supported on the `1`-eigenspace and `r(ς₀) − 1` on the
other); the `ρ`-block needs no condition there, the Selmer group being unrestricted at `Σ(𝔭) ∪ Q(ψ_𝔭)`; at `Q(ψ_𝔭)`
restricting the character blocks to unramified classes costs `v(χ_1(ς_v) − 1)` per block (R)(v). *Rows.* By local duality
(ClassFieldTheory §5.1) and Bloch–Kato's exact annihilators (SelmerIwasawaCohomology §4.9), a class of
`H¹(E_w, W ⊗ K_O/O)` orthogonal to a
submodule `I ⊂ H¹_f(T)` is finite up to a defect of length `length(H¹_f(T)/I)` (SelmerLengthBoundsAndLocalLifting §4.10b). A cut
cocycle is orthogonal to the image `I` of `H¹_f(T₁)`, `T₁ ⊂ 𝒜` the lattice of the dual family mapping onto `T` (with the
twisted right action): for a cocycle `a` of `G_{E_w}` in `T₁`, the cup product with the cut cocycle `y` is the `2`-cocycle
`(g, h) ↦ a_g·u_g·y_h` with values in `Y(1)`, `Y` with `G_{E_w}` acting through the cyclotomic character only; it is the
coboundary of `g ↦ −a_g·u_g·E` in `𝒜E(1)`, and since `H²(E_w, M(1)) ≅ M` functorially for finitely generated `O`-modules `M`
with trivial action (the local invariant, ClassFieldTheory §5.1), `H²(E_w, Y(1)) → H²(E_w, 𝒜E(1))` is injective: the
`2`-cocycle is a coboundary in `Y(1)`, and every functional `Y → K_O/O` carries it to a coboundary (LengthBoundsInPadicFamilies §1.8e(3),
(3a)). So the defect at `w ∈ Row` is at most the colength `ν_w`; the character blocks are finite up to `ℓ^{c_B}` by (TB),
used at the rows only (its exact sequences are those of the cut cocycles of the character blocks, `Ỹ = Y + O·E`).
*Columns.* The local condition is built into the module: enlarge `Y = Σ_g𝒜y_g`, `y_g = (u_g − 1)E`, by generators `m_w`,
`q_{w,1}, …, q_{w,j_w}`, `z_w` with the relations of LengthBoundsInPadicFamilies §1.8e (`Em_w = 0`, `(1 − e₁)q_{w,a} = 0`, `(δ − E)z_w = 0`, and
`y_g + (u_g − 1)m_w = δΣ_aK_{w,a}(g)q_{w,a} + δk_w(g)z_w` for `g ∈ G_{E_w}`), where `κ_{w,1}, …, κ_{w,j_w}` is a basis modulo
torsion of the Bloch–Kato condition `H¹_f(E_w, L)` (a saturated condition: the preimage of `H¹_f(E_w, L ⊗ K_O)`), and
`K_{w,a} ∈ 𝒜e₁`, `k_w ∈ 𝒜E` are cochains lifting `ℓ^{e′_w}κ_{w,a}` and `ℓ^{e′_w}` times a generator of the unramified
homomorphisms, with the normalisation of (Col) there; they exist by (Lift) applied to the surjections `𝒜e₁ ↠ L`,
`𝒜E ↠ δ(π′)O`, lattices in finite sums of the `χ_1^{−1}r_x`. Every cocycle cut from the enlarged module is finite at the
columns by construction. At a point `x` over `X_s ∖ Z` the relations at `w ∈ Col` have a solution: the map
`(ξ, ζ, v) ↦ Σ_aξ_aK_{w,a}(·)s₁ + ζk_w(·)η − d⁰v` from `K_O^{j_w} × K_O × V_x` to the cocycles with finite class has a nonzero
kernel by (Col) (dimensions `j_w + 1 + dim V_x` against `j_w + dim V_x`), which extends the homomorphism `aE ↦ aη` of `Y` or
is a nonzero homomorphism supported at `w`; so the generic-determinant bound holds for the enlarged module (LengthBoundsInPadicFamilies §1.8e(1)). The
kernel of `φ ↦ (g ↦ φ(y_g))` costs at most `Σ_{Col}(j_w(e′_w + v_δ) + length H⁰(E_w, L ⊗ K_O/O) + rv_δ)` in the block `ρ`, at
most `Σ_{Col}(e′_w + 3v_δ)` in the block of `χ_1`, and at most `Σ_{Col}(length H⁰(E_w, (K_O/O)(−(c − 1))) + v_δ)` in the block
`χ_c`, `c ≥ 2`. The coboundaries of a block are killed by `δ(π′)²` (LengthBoundsInPadicFamilies §1.8d(3′), in the form of the
formal proof), of length at most `2d_b·v_δ`; with the kernels this stays within the constant of (i), as
`#Col·(r + t)v_δ + 2(r + t)v_δ ≤ 4(r + t)(#Col + 1)v_δ`. The
counts are those of the unit case: the `ρ`-block by `Sel(W)`; the trivial block by homomorphisms `G_E → K_O/O` unramified
everywhere, of length at most `v_ℓ(h_E)` (ClassFieldTheory §13.1, the Hilbert class field and its Galois group); the block
`χ_cχ_1^{−1} = χ_cyc^{−(c−1)}`, `2 ≤ c ≤ t`, by
classes of `H¹(G_E, K_O/O(−(c−1)))` unramified outside `ℓ` and trivial above `ℓ`, that is by `Ш¹(E, ℓ, c − 1)`
(BernoulliBoundsForClassGroupEigenspaces §6.17). Only extensions of `χ_1` occur, which is why only the twists `ℚ_ℓ/ℤ_ℓ(−e)`, `0 < e < t`, appear.
Under (L), (Col) follows from Bloch–Kato's dimension formula, the weights of every `χ_1^{−1}r_x` being those of `π` (the
characters `χ_cχ_1^{−1}` have the single weight `c − 1 ≥ 0`). (ii) LengthBoundsInPadicFamilies §1.8e(2) with `Col = ∅`, `Row` the places
above `ℓ` and `ν_{b,w}` the given lengths (its constant `4(N + t)(#Col + 1)v_δ` at `#Col = 0`, `N = r`), the module built on the
points over `X_s`; the Selmer groups of the blocks as in (i); the finite classes of `(K_O/O)(−e)` over a finite extension of
`ℚ_ℓ` are zero for `e > 0` and the unramified classes for `e = 0` (SelmerIwasawaCohomology §4.9), so for the character blocks
"modulo the finite classes" is "modulo the unramified homomorphisms" for `c = 1` and "modulo zero" for `c ≥ 2`.
([FormalProof] carries this description of the finite classes of the character blocks as a hypothesis of its
statement and verifies it where it applies the bound.) (i) is the
case `ν_ρ(w) = ν_w`, `ν_χ(w) = (n_w + 2)c_B` at the rows, with columns. The character terms: for `g ∈ G_{E_w}` with
`χ_cyc(g) = 1 + ℓ^{s_w}`, `v_ℓ(χ_cyc(g)^{−e} − 1) = s_w + v_ℓ(e)`.

*Check.* For `ℓ > t + 1` unramified in `E`, with exact local conditions and `v_δ = 0`, (ii) with `ν_ρ = ν_χ = 0` is the unit
case: if moreover `Sel(W) = 0`, every `Ш¹(E, ℓ, e) = 0`, `ℓ ∤ h_E` and `Q(ψ_𝔭) = ∅`, then `c(π) = O`.
AutomorphicCongruences §0.7 (on the lattice datum of AutomorphicCongruences §0.5) is the polarized three-block form
`χ′ ⊕ ρ ⊕ χ` of the same lattice method, over the completion at a height-one prime and with ordinary local conditions: the
characteristic ideal of the Selmer group of `ρ ⊗ χ^{−1}` is bounded below by a length cut out of the lattice and, under
further hypotheses, by the Eisenstein ideal. It and 7.7b are two forms of one method; neither contains the other.

(i): [FormalProof],
`Formalism/SharpRestriction/LevelLetterCocycles/JointConditionsZpowers/CommutingEndomorphismCondition.lean` (`Formalism.MainNotions.N.KillingConditions.localErrorBoundDecomposition`),
`Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/StarInequalityRowsADOfGlobalTheoremsStatement.lean` (`GlobalTheory.T.starInequality_rowsAD_of_global_theorems`);
the inequality at a point, with its nine terms, is
`Formalism/SharpRestriction/LevelLetterCocycles/DecompositionData.lean` (`Formalism.MainNotions.TruncatedSeriesCountingIdentities.GlobalLatticeIndexTheorem`),
proved in `Formalism/AdmissibleDesigns/StatementOneBFromUnramified.lean` (`Formalism.MainNotions.N.K.Closed.theorem_n5_from_inputs`) and
`Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/SelmerLengthBoundAtPoint.lean` (`GlobalTheory.SelmerBoundAtPoint.main`).
The hypotheses of [FormalProof] at one place above `ℓ` that take the roles of (Lift), (Row) and (TB) are
`Formalism/SharpRestriction/LevelLetterCocycles/QuotientHomNonvanishingBound.lean` (`Formalism.MainNotions.N.LiftAt`),
`Formalism/SharpRestriction/LevelLetterCocycles/QuotientHomNonvanishingBound.lean` (`Formalism.MainNotions.N.RowAt`) and
`Formalism/SharpRestriction/LevelLetterCocycles/QuotientHomNonvanishingBound.lean` (`Formalism.MainNotions.N.TBAt`).
*Needs:* 7.4, 7.5, 7.7a; LengthBoundsInPadicFamilies §§1.8d(2′), 1.8d(3),
1.8d(3′), 1.8e(1)–(3), 1.8e(3a); SelmerLengthBoundsAndLocalLifting §§3.22, 4.9b, 4.10b and SelmerIwasawaCohomology §4.9; ArithmeticGaloisDuality R02.3.0d and HeckeIdealsAndTaylorWilesRelations §10.1;
BernoulliBoundsForClassGroupEigenspaces §6.17; ClassFieldTheory §§5.1, 7.1, 8.1, 13.1.

### 7.7c Exact local conditions

*Origin:* particular to this proof: the congruence bound for the `t + 1` blocks of the chain with exact local
conditions at the large primes; nearest published result: Urban (2001), a congruence ideal bounded by a Selmer group
with exact local conditions coming from ordinarity.

*Method of the formal proof:* at a prime above the threshold and outside the exceptional set the local condition at
every place above `ℓ` is exact, the element isolating the first character line is taken at an inertia element on which
the cyclotomic character generates the units modulo `ℓ`, so that `δ` is a unit, and the unit case of the global
congruence count bounds the congruence ideal by the Selmer length, the Tate–Shafarevich terms, the class number term and
the tame term. It departs from the published unit-case bounds only through its inputs, which give exact local
conditions for weights far beyond the Fontaine–Laffaille range.

In the setting of 7.7a, under (R) and (L), if `ℓ > ℓ*` and
`ℓ ∉ Exc` (7.6), the bound of 7.7b(i) holds with `Col = ∅`, `ν_w = 0`, `c_B = 0` and `v_δ = 0`:
`v(c(π)) ≤ length Sel(W) + Σ_{0<e<t} length Ш¹(E, ℓ, e) + v_ℓ(h_E) + t·Σ_{v∈Q(ψ_𝔭)} v(χ_1(ς_v) − 1)`.

*Route.* 7.6(b) gives the exact conditions at every `w | ℓ`; with `v_δ = 0` (`ℓ > t + 1`, unramified in `E`, 7.6(a)) the
coboundary terms vanish (LengthBoundsInPadicFamilies §1.8d(3): `δ(π′)` a unit).

[FormalProof],
`Development/AbelianVarietyTheory/BlockTheory/NonGaloisCusps/BaseSizes.lean` (`GlobalTheory.IndefiniteRowSideFullHecke.BaseSizes.CongBound_at`),
`Development/AbelianVarietyTheory/Definitions/NonGaloisDescent/BoundAtTwoThreeFamily.lean` (`GlobalTheory.NLink.StarE`),
`Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/LocalBoundZeroAtLargePrimesOfCongruenceBoundStatement.lean` (`GlobalTheory.T.localBoundZeroAtLargePrimes_of_congruenceBound`).
*Needs:* 7.6, 7.7a, 7.7b; LengthBoundsInPadicFamilies §1.8d(3).

### 7.7d Split primes

*Origin:* adapted from Bloch and Kato (1990), Corollary 3.8.4: the dimension formula for the Bloch–Kato finite classes;
here, at a prime split in `K`, the bounds `j_u ≤ n_u·m` and `dim H¹_f(E_ū, W^*(1)) ≤ n_u·m` for the weights of the chain,
and the length `ν_ū` at the conjugate places from a lifting exponent `e′` and the torsion bound `h_ū`.

*Method of the formal proof:* at a column place the cloud weights of `W` are positive, so the dimension formula of Bloch
and Kato leaves only the `m` lows at each embedding and `j_u ≤ n_u·m`; at the conjugate place the same count bounds the
rank of `H¹_f` of the lattice of `W^*(1)`; the cokernel of `H¹_f(T₁) → H¹_f(T)` then has length at most `e′` times this
rank plus the length of the torsion, which is bounded by the invariants of `V/T`.

*Corollary of:* PadicHodgeRegulators §1.5 (the dimension formula of Bloch and Kato: for a de Rham representation of the
absolute Galois group of a finite extension of `ℚ_ℓ`, the dimension of `H¹_f` is that of `D_dR/Fil⁰` over `ℚ_ℓ` plus
that of `H⁰`; its crystalline case is the form of SelmerIwasawaCohomology §4.9 that the route cites), for the bounds
`j_u ≤ n_u·m` and `dim H¹_f(E_ū, W^*(1)) ≤ n_u·m`.

In the setting of 7.7a under (R) and (L), let `ℓ` split in `K` and be
unramified in `E`; take for `Col` the places above one of the two primes of `K` above `ℓ` (those whose embeddings lie in
`Φ`) and for `Row` their conjugates (for `u ∈ Col`, `ū := c(u)` is the conjugate place, and `n_ū = n_u`; `j_u` is that of 7.7b(Col)).
Then `j_u ≤ n_u·m` and `dim H¹_f(E_ū, W^*(1)) ≤ n_u·m` for `u ∈ Col`, and if (Lift) holds
with one exponent `e′` at `Col` for the family and at `Row` for the dual family, (Row) holds at `ū` with `ν_ū = n_u·m·e′ + h_ū`,
where `h_ū` bounds `length H⁰(E_ū, V/T)` for `V = W^*(1) ⊗ K_O` and every stable lattice `T` of `V`. The same holds for
`ℓ | f_E`, `ℓ ∉ {q, d}`, `ℓ` split in `K`, with the same partition.

*Route.* At `u` the cloud weights of `W` are positive and at `ū` those of `W^*(1)` are, so only the lows contribute to `H¹_f`
(Bloch–Kato's dimension formula, SelmerIwasawaCohomology §4.9 in its crystalline case, with `H⁰ = 0`; under (L) the
representations are crystalline at every `w | ℓ`, so it applies also at ramified `E_u`): with the weights of 7.6(a), at a
place all of whose embeddings lie in `Φ` the weights of `W` other than
the `m` lows are positive, and at the conjugate place they are negative. For a lattice `T` of `W^*(1)` the module `H¹_f(E_ū, T)`
has rank at most `n_u·m`, and its torsion is a quotient of `H⁰(E_ū, V/T)` (SelmerLengthBoundsAndLocalLifting §4.10c(1), for every prime
and every finite extension of `ℚ_ℓ`); a lifting exponent `e′` with image `I ⊇ ℓ^{e′}H¹_f(E_ū, T)` leaves a cokernel of length at
most `e′` times the rank plus the length of the torsion. A bound `h_ū` is supplied by SelmerLengthBoundsAndLocalLifting §4.9d when `V` is
crystalline and `0` is not one of its Hodge–Tate weights at some embedding.

[FormalProof],
`Formalism/SharpRestriction/LevelLetterCocycles/EmbeddingTypes.lean` (`Formalism.MainNotions.EmbeddingTypes.H0ColumnLengthBound`),
`Formalism/SharpRestriction/LevelLetterCocycles/EmbeddingTypes.lean` (`Formalism.MainNotions.EmbeddingTypes.hypDecl`).
*Needs:* 7.6, 7.7a, 7.7b; SelmerIwasawaCohomology §4.9 and SelmerLengthBoundsAndLocalLifting §4.10c(1).

### 7.8 An anticyclotomic twist kills the Selmer group

*Origin:* particular to this proof: twist selection applied to the Galois lattices of the good forms, with an auxiliary
character whose inertial order supplies the scalar element that the selection needs at every prime `ℓ`.

*Method of the formal proof:* the hypotheses of the twist theorem are checked for each `T_s`: conjugate self-duality from
equal characteristic polynomials at the dense split Frobenius elements and the trace form of a residually absolutely
irreducible representation over the local ring, vanishing of the local invariants from one inertia element at each bad
place and from the Hodge–Tate weights avoiding `[−1, t]` above `ℓ`; the twist is then the general twist-selection theorem
applied to the finitely many `T_s`, and its goodness, stated for all powers prime to `ℓ`, is carried to the other places
by transport of the data.

Let `𝔭 | ℓ` be a twisted place and `δ_ℓ` the auxiliary character of `ℓ`; assume `r ≥ 100` and `g₀, g₁ ≥ 2r` (both hold under
`Size(x, ε)` for `x ≥ 32` and for the type primes of ThetaChainsOnDefiniteUnitaryGroups §2.7). For every step `j`,
every Hecke eigensystem of good forms on `U(W_j)` away from the places of ThetaChainsOnDefiniteUnitaryGroups §2.9 (base change `Σ`, Galois representation
`ρ_Σ` over `O`, normalised as in 7.5(1)) and each of `𝔭′ ∈ {𝔭, c_𝕃(𝔭)}`, let `T_s := ρ_Σ ⊗ χ_{1,s}^{−1}`, a stable `O`-lattice,
where `χ_{1,s}` is the `ℓ`-adic character, read at `𝔭′`, of the algebraic Hecke character `μ_j(δ_ℓ)η̃^{−1}|·|_{𝔸_E}^{−r/2}` of the
tuple twisted by `δ_ℓ` alone (no `ℓ`-power twist; the norm factor as in 7.5(1)). The set `𝒮` of these `s` is finite. Let `S` be the set of places of `E` above `ℓ` and `∞`
together with `Σ(𝔭)`.
1. Each `T_s` satisfies (H1), (H2) with the integer `t`, (H5) and (H6) of SelmerLengthBoundsAndLocalLifting §3.22 for `S`, with
   one element `z` common to all `s` in (H5); and (H3) of SelmerLengthBoundsAndLocalLifting §4.9b, so that the Bloch–Kato condition above `ℓ` is balanced; in
   particular `T_s^†∘c ≅ T_s ⊗ χ_cyc^{t}` integrally.
2. *Twist selection.* (The invariant `v_ℓ(w_{tr}(E))` is finite because `tr ≠ 0`, and it is the same for every `s`; it is `0`
   exactly when `χ̄_cyc^{tr} ≠ 1` on `G_E`, and then the bound of (a) is `ε′`, as in SelmerLengthBoundsAndLocalLifting
   §3.26 (2).) A *polynomial
   condition* (SelmerLengthBoundsAndLocalLifting §3.26, in its coset form) is relative to an open subgroup `H_𝒞 ⊂ G_E`, normal in `G_F`,
   modulo which the element `z` of (1) is central (`[h, z] ∈ H_𝒞` for `h ∈ G_E`; for instance the kernel of a character of `G_E`
   stable under `c`, also when the character is nontrivial at `z`), and a finite set
   `A_𝒞` of places: it attaches to every family `𝔓` in position at a level `M` (SelmerLengthBoundsAndLocalLifting §3.24, relative to `z` and a
   subgroup `L ⊂ H_𝒞` as there) whose second-half Frobenius elements lie in `H_𝒞` (its first-half ones then lie in the coset
   `zL ⊂ zH_𝒞`) and which avoids `A_𝒞`, a polynomial `f ∈ O[X_q : q ∈ 𝔓]`, depending only on `M` and `𝔓`, of *level* `v₀` and of
   one of the two kinds of SelmerLengthBoundsAndLocalLifting §3.25b: either with a coefficient of valuation at most `v₀` on a monomial of total
   degree at most `D(n₁)` (the first kind), or of the second kind at level `M` of SelmerLengthBoundsAndLocalLifting §3.25b (2) for `v₀` and
   the exponent bound `n_max(n₁)`, the first-half and second-half variables being those of the first-half and second-half
   places of `𝔓`; here `n₁` is the number of first-half places of `𝔓`, and the degree function `D` and the exponent bound
   `n_max` are functions fixed with the condition (on the families produced below, which have at most `R` first-half places,
   the numbers `D(R)` and `n_max(R)`).
   For every `ε′ > 0`, every finite set `A` of places and every finite family `𝒞` of polynomial conditions, there are an
   integer `M ≥ 1`, roots of unity `u_q ∈ μ_{ℓ^M}(O′)`, `u_q ≠ 1` (`O′` a finite extension of `O`), and an anticyclotomic
   character `ψ = ∏_q u_q^{d_q}` of `ℓ`-power order, ramified exactly at a `c`-stable set `Q` of at most `4R` places of `E` of
   degree one over `ℚ`, above places of `F` split in `E` and split completely in the governing field
   `𝒢_M = E(μ_{2ℓ^M}, V_M^{1/ℓ^M})` of SelmerLengthBoundsAndLocalLifting §3.22 (1) (`R` independent of `ε′`, `A` and `𝒞`), disjoint from `S ∪ A`, trivial on the
   decomposition groups above `ℓ`, such that for every `s ∈ 𝒮` and every integer `m′` prime to `ℓ`:
   (a) `length Sel_Q(T_s ⊗ ψ^{m′} ⊗ K_O/O) ≤ v_ℓ(w_{tr}(E)) + ε′` (Selmer groups: Bloch–Kato above `ℓ`, no condition at the other
   places of `S` and at `Q`, unramified elsewhere);
   (b) `t·Σ_{v∈Q} v(ψ(ς_v) − 1) ≤ ε′` for tame inertia generators `ς_v`;
   (c) the polynomial `f` that each condition of `𝒞` attaches to the family of `Q`, of level `v₀`, has
   `f((u_q^{m′} − 1)_q) ≠ 0` and `v(f((u_q^{m′} − 1)_q)) ≤ v₀ + ε′` at the roots of unity `u_q` defining `ψ`.
   Here `Q = 𝔓 ∪ c𝔓` for a family `𝔓` in position at level `M` (SelmerLengthBoundsAndLocalLifting §3.24): its first-half places have Frobenius elements in
   `z·L_M` and its second-half places Frobenius elements in `L_M`, `L_M ⊂ ⋂_{𝒞}H_𝒞` the subgroup of SelmerLengthBoundsAndLocalLifting §3.26, so the family is
   seen by every condition of `𝒞`; the conclusions hold for `ψ^{m′}` for every `m′` prime to `ℓ`.
   Such a `ψ` is an *`ε′`-good twist at `𝔭` (for `𝒞`)*. The bound `4R` on the number of places of `Q` and their splitting in
   `𝒢_M` are this roadmap's own, taken from SelmerLengthBoundsAndLocalLifting §3.26, not statements of [FormalProof].
3. *Independence of the field of places.* Let `ψ` be an `ε′`-good twist at `𝔭` for `𝒞`. (i) For a field of places
   `𝕃′ ⊃ 𝕃` and a place `𝔭′ | 𝔭`, `ψ` is an `ε′`-good twist at `𝔭′` for the same conditions. (ii) If `g ∈ Gal(𝕃/ℚ)` fixes
   the lattices of forms and the data from which the `T_s` and the conditions of `𝒞` are formed (as every `g ∈ Gal(𝕃/𝕃₀)`
   does when `𝕃₀ ⊂ 𝕃` is a field of definition of them for one `𝕃₀`-structure, ThetaChainsOnDefiniteUnitaryGroups §2.6a (c)),
   then `ψ` is an `ε′`-good twist at `g𝔭`.

*Route.* (1) (H1) is 7.9(b)(1). (H2): at a split place `P` outside `S`, conjugate self-duality of the cuspidal constituent
gives Satake parameters at `P̄` inverse to those at `P`; with `χ_c = χ_1χ_cyc^{−(c−1)}` this gives equal characteristic
polynomials of `T_s^†(c·Frob_P·c^{−1})` and of `χ_cyc^t(Frob_P)·T_s(Frob_P)`; Frobenius elements of split places are dense
(Chebotarev; ArithmeticGaloisRepresentations §5.1), so the two representations have equal traces on `G_E`, and two
representations over the local ring `O` with equal traces, one residually absolutely irreducible, are conjugate in `GL_r(O)`
(ArithmeticGaloisRepresentations §5.10 *Carayol's lemma*, which assumes no invertibility of `r!`, after the two reductions are
identified from the equal characteristic polynomials by ArithmeticGaloisRepresentations §1.8). (H5): let `v ∈ A(ℓ)`; by ThetaChainsOnDefiniteUnitaryGroups §2.4 (b) there is a tame inertia element `z` at `v`, of order
prime to `ℓ·N(v)` in every finite quotient, with `δ_ℓ(z)² − 1` a unit; `z` fixes `μ_{ℓ^∞}` (`v ∤ ℓ`), `ρ_Σ` is unramified at
`v` (the forms on `U(W_j)` have hyperspecial level there, ThetaChainsOnDefiniteUnitaryGroups §2.9), and `χ_{1,s} = δ_ℓ^{s_j}` on that inertia, so `z` acts on
`T_s` by the scalar `δ_ℓ(z)^{−s_j}`, whose square is not `1` modulo the maximal ideal. Concretely, for the inertial order
`o_δ = 15`: if `ℓ ≠ 3`, `z` is taken with `δ_ℓ(z)` of order `3`, so `δ_ℓ(z)²` is a primitive cube root of unity and
`δ_ℓ(z)² − 1` divides `3`, a unit at `ℓ`; if `ℓ = 3`, `z` is taken with `δ_ℓ(z)` of order `5`, and `δ_ℓ(z)² − 1` divides `5`, a
unit at `3`; at `ℓ = 5` the first choice applies. In general the prime-to-`ℓ` part `n ≥ 3` of `o_δ` gives `δ_ℓ(z)²` of order
`n/gcd(n, 2) ≥ 2`, prime to `ℓ`, and reduction modulo the maximal ideal is injective on such roots of unity. Since `z` has
order prime to `ℓ` in every finite quotient, it acts on `T_s` by the Teichmüller lift of its residual scalar and is killed
by every homomorphism to `ℤ/ℓ^M` (the normalisation of SelmerLengthBoundsAndLocalLifting §3.22); `z` is central modulo every `H_𝒞` of (2), and the first-half
Frobenius elements lie in `zH_𝒞` (the Euler factors at those places are units only if the residual character at `z` is not
`1`). (H6): at the places above a type prime
`g_{i′} ≠ ℓ`, a tame inertia element has no eigenvalue `1` on `T̄_s` by 7.9(b)(2), hence none on `T̄_s^†` (inertia at `v ∤ ℓ`
acts trivially on `k(1)`); at the places above the auxiliary prime, `z` acts on `T̄_s^†` by a scalar `≠ 1`; in both cases all
of `H⁰`, `H¹`, `H²` of `T̄_s` and of `T̄_s^†` vanish there (`H⁰` and `H²` by the inertia element, `H¹` by the local Euler
characteristic). (H3): by 7.4(5)
the weights at `τ` and `τ∘c` are exchanged by `a ↦ t − 1 − a`, and by 7.5(1) they avoid `[−1, t]`, so the numbers of
negative weights at `τ` and `τ∘c` add up to `r`; `T_s` is de Rham above `ℓ` (7.4(4)). (2) is SelmerLengthBoundsAndLocalLifting §3.26
(through SelmerLengthBoundsAndLocalLifting §§3.24, 3.25, 3.25a ((1), (2), (3′), (4′)) when `ℓ | w_{tr}(E)`, that is when
`χ̄_cyc^{tr} = 1` on `G_E` as SelmerLengthBoundsAndLocalLifting §3.25a assumes, and 3.25b ((1), (2))) for the finitely many
`T_s`, with `ε′/(2t)` in place of `ε′` (its clause 3 then gives (b), and its clause 4 gives (c) for the conditions of `𝒞`, which
are polynomial conditions of SelmerLengthBoundsAndLocalLifting §3.26 of level `v₀`); for each `s` of the isomorphic kind SelmerLengthBoundsAndLocalLifting §3.25a (1) adds one second-half place, of
degree one, above a place of `F` split in `E`, split completely in `𝒢_M`, with Frobenius elements in `L_M`, paired with a
first-half place reserved for `s`, and it is counted in `R`; the places it produces split completely in `𝒢_M` and lie above places of `F` split in `E` (degree one over `ℚ` alone would not make `c𝔭 ≠ 𝔭`
at a place ramified in `E/F`); every `T_s` has rank `r` and the same integer `t`, so the invariant `ν_s` of SelmerLengthBoundsAndLocalLifting §3.26 is
`v_ℓ(#H⁰(E, ℚ_ℓ/ℤ_ℓ(tr))) = v_ℓ(w_{tr}(E))` for every `s`: this is the form of the formal proof stated at
SelmerLengthBoundsAndLocalLifting §3.26 (one rank, one integer `t` with `tr ≠ 0`, the bound `ν + ε′` of its clause 1), which
gives (a). For the twisted tuple `ξ_𝔭 = δ_ℓψ_𝔭` the
character `χ_1` of 7.5 is `χ_{1,s}·ψ_𝔭^{s_j}`, so `W = ρ_Σ ⊗ χ_1^{−1}` of 7.7a is `T_s ⊗ ψ_𝔭^{−s_j}`.
(3) (i) The lattices `T_s` at `𝔭′` are those at `𝔭` tensored with a finite extension of `O`, and (a)–(c) are stated with
lengths and valuations normalised by `length(O/ℓ) = 1` (notation of this layer; ThetaChainsOnDefiniteUnitaryGroups §2.6a (b),
(d)). The route of (3) (ii) is not given here.

*Check.* With `z` only "without eigenvalue `1`" (the element of 7.9(b)(2) at a type prime, where `ρ̄_Σ(ς)` has `r` distinct
eigenvalues), (H5) fails: no element at a type prime acts by a scalar. The scalar element exists only at the auxiliary
place, and only because the prime-to-`ℓ` part of the inertial order of `δ_ℓ` is at least `3` (ThetaChainsOnDefiniteUnitaryGroups §2.4).

(1), (H2) and the weights: [FormalProof],
`Formalism/SharpRestriction/LevelLetterCocycles/BlochKatoPhases.lean` (`Formalism.MainNotions.BlochKatoReduction.Gen.SelfDual`);
(1), (H1), (H5), (H6), (H3): [FormalProof],
`Formalism/SharpRestriction/LevelLetterCocycles/BlochKatoPhases.lean` (`Formalism.MainNotions.BlochKatoReduction.Gen.IsotypicValuationAtRing`),
`Development/AbelianVarietyTheory/Definitions/NonGaloisDescent/IsTameInertiaElementAtTwistPrime.lean` (`GlobalTheory.TwSys.IsTameInertiaElementAtTwistPrime`);
(2), the shape of `ψ`, the bound of (a) and (b): [FormalProof],
`Formalism/SharpRestriction/LevelLetterCocycles/BlochKatoPhases.lean` (`Formalism.MainNotions.BlochKatoReduction.Gen.PsiOk`),
`Formalism/SharpRestriction/LevelLetterCocycles/IntegralHeckeForms.lean` (`Formalism.MainNotions.IntegralHeckeForms.GoodTw`);
(2), the existence statement with its quantifiers (for every `ε′`, every `A` and every basis of test data there are `Q`, the
level and `ψ` such that every power `ψ^{m′}`, `m′` prime to `ℓ`, is a good twist): [FormalProof],
`Development/AbelianVarietyTheory/Definitions/NonGaloisDescent/AdmissibleIndexBoundAllPowers.lean` (`GlobalTheory.TwAll.goodTwistExistsAllCoprimePowers`);
at the points of the chain:
`Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/AutomorphyOfHyp.lean` (`GlobalTheory.T.automorphy_of_hypotheses_alt_alt`),
whose conclusion is
`Development/AbelianVarietyTheory/Definitions/AutomorphicMembership/NotBaseCondFalse.lean` (`GlobalTheory.Mem.Top.GroupRetwisting.ExportF`) with
`Development/AbelianVarietyTheory/Definitions/AutomorphicMembership/AmbientBaseHeq.lean` (`GlobalTheory.Mem.Top.ExportAt`);
(2) (c), for every `m′` prime to `ℓ`: follows from [FormalProof],
`Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/ExistsLevelOrderExponentsSmallValuationDetermina.lean` (`GlobalTheory.OrderEval.order_eval`);
(3): [FormalProof] proves, in its form, that a twist whose characters at the twisted places are powers, prime to `ℓ`, of a
twist good in all such powers at the places below is good:
`Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/GoodTwistOfSeedCharacterPowersStatement.lean` (`GlobalTheory.T.goodTwist_of_seed_character_powers`).
*Needs:* ThetaChainsOnDefiniteUnitaryGroups §2.4, ThetaChainsOnDefiniteUnitaryGroups §2.5, ThetaChainsOnDefiniteUnitaryGroups §2.6a, ThetaChainsOnDefiniteUnitaryGroups §2.9, 7.4, 7.5, 7.9; SelmerLengthBoundsAndLocalLifting §§3.22–3.26, 3.25a ((1),
(2), (3′), (4′)), 3.25b ((1), (2)), 4.9b;
ArithmeticGaloisRepresentations §§1.8, 5.1, 5.10; Chebotarev (Completed).

### 7.8a The character bound at the rows

*Origin:* particular to this proof: an explicit power `ℓ^c` that makes finite the class cut out by an extension of the
trivial lattice inside a crystalline lattice of the chain, whose weights lie far outside the Fontaine–Laffaille range,
with `c` of the order `t·[E:ℚ]·(r + t)·(1 + log_ℓ(4b))`; nearest published results: Iovita and Marmora (2015), finite
classes modulo `p^n` without loss for weights in the classical range, and Čoupek, Gazaki and Marmora (2026), for weights
below `p − 1`.

*Method of the formal proof:* at a place above `ℓ` the extension is read as an invariant functional onto the trivial
lattice; its kernel is crystalline with weights in a window supplied by the size conditions, and the local theorem on
extensions of the trivial lattice inside a crystalline lattice gives the explicit exponent, which the parameters bound by
`c_B`; the second half follows from the description of the finite classes of the twists and a bound for the torsion of
the divisible cohomology modulo its finite part. It departs from the published argument, which is without loss only in
the Fontaine–Laffaille range, by paying an explicit power of `ℓ`.

*Notation for 7.8a–7.11.* Put `L = x^ε`, `h := b + 2Sc + 2η_s + t + 2`, `e(ℓ) := C(1 + h/ℓ + log_ℓ h)`,
`B := C·f·|A|·t²·(r + t)·L²`, and `w_max := max_{j, τ not thick} w_j(τ)` (`≤ 2b′`, ThetaChainsOnDefiniteUnitaryGroups §2.3). For a place `w | ℓ` of `E`, `n_w` is that
of 7.7a and `E_{w,0}`, `s_w`, `K_w`, `f″_w` are those of 7.7b; `s_w = 1` and `K_w = E_{w,0}` when `E_w` is unramified, and in general
`s_w ≤ 2 + log_ℓ n_w` and `v_ℓ(f″_w) ≤ log_ℓ n_w`, with `n_w ≤ [E:ℚ] = 4|A| ≤ 8x^{A_n}` (`SizeA`, ThetaChainsOnDefiniteUnitaryGroups §2.1). The *letters* of `w` are the
embeddings of `E_w`, in Frobenius order, read through their places (FrobeniusRestrictedRieszSums §0.6(c)). Put
`d^Z_j := dim 𝒞(W_j)^{good}`, which equals `d^Z_j(𝔭)` at every twisted `𝔭` (7.5b); and for a level `(P, χ_P)` let
`d^{Z,P}_j` be the dimension of the level-`(P, χ_P)` part of `𝒞(W_j)^{good}`, which equals `d^{Z,P}_j(𝔭)` at every twisted
`𝔭` (7.5b). At the base level `d^{Z,P_0}_j = D_0`, the dimension of the base-level row space
(RowTowerAndRallisIdentities §5.9, for the level parts). ([FormalProof] has `D_0` as the dimension of the base-level
lifted subspace of the base tuple, and proves that the base-level lifted subspace has the same dimension at every
twisted place.) `C` denotes absolute constants fixed with
the lifting theorems, except where the Conventions (Constants) let it depend on `C_t`, `A_max` and `C_L`.

*The character bound at the rows.* Under `Size(x, ε)` (ThetaChainsOnDefiniteUnitaryGroups §2.1) and the separation of ThetaChainsOnDefiniteUnitaryGroups §2.3c,
for `x ≥ x₀`: at every twisted place `𝔭 | ℓ` with `ℓ ∉ {g₀, g₁}`, every place `w | ℓ` of `E` and every `π ∈ Z_good`, clause (TB)
of 7.7b(i) holds at `w` with `c_B ≤ C_B·t·[E:ℚ]·(r + t)·(1 + log_ℓ(4b))`, `C_B` an absolute constant. At the type primes
clause (TB) is not used: every block is treated by 7.7b(ii). At `ℓ ∈ {2, 3}`, `ℓ | f_E` and `ℓ ∈ {q, d}` the local
statement applied is the same (it holds for every `K₀ ⊆ K ⊆ K₀(μ_{ℓ^s})`, `ℓ = 2` with `s ≥ 2` included), and the bound
for `c_B` there is this roadmap's: [FormalProof] states it at the primes of rows 2–4 and bounds rows 5 and 6 as wholes.

*Route.* Let `0 → Y′ → Ỹ → O → 0`, `ỹ`, `ϕ` and `0 ≤ e < t` be as in (TB), and `E′_w := E_wK_w` (7.7b; its maximal unramified
subfield is `K_w`, `K_w ⊆ E′_w ⊆ K_w(μ_{ℓ^{s_w}})` and `[E′_w : E_w] = f″_w`). SelmerLengthBoundsAndLocalLifting §4.9c (1) applies with `K = E′_w`,
`K₀ = K_w`, `s = s_w` to the restriction of the sequence to `G_{E′_w}` (the `χ_1^{−1}r_x` are crystalline at `w`, 7.4(4), so `Ỹ[1/ℓ]` is
crystalline over `K_w(μ_{ℓ^{s_w}})`), in its form with the SET `U` of the distinct Hodge–Tate weights of `Y′` over the embeddings
(the set `U` of SelmerLengthBoundsAndLocalLifting §4.9c (1)): at each embedding of `E′_w` these weights are those at its restriction to `E_w`,
among the `r + t` weights of the family, independent of `x` (7.4(4)), so `#U ≤ n_w(r + t)`; they lie in an interval of length at
most `2h` containing `0` (7.6(a)), so `n₀ ≤ 1 + log_ℓ(2h + 1)`, and `|u − i| ≤ 3h` for `u ∈ U`, `0 ≤ i ≤ e < t ≤ h`. Its exponent, with
`m_c := 2s_w + n₀ + 1`, `v = m_c − s_w = s_w + n₀ + 1` and `g = v_ℓ([K_w(μ_{ℓ^{s_w}}) : E′_w]) ≤ s_w`, is

`c ≤ v + t·(3 + #U·(m_c + log_ℓ(3h))) + (t + 3)·s_w + v_ℓ(t!) + t + g ≤ C·t·n_w·(r + t)·(s_w + 1 + log_ℓ(4b))`

(`v_ℓ(e) + v_ℓ(e + 1) ≤ v_ℓ(t!)`, `⌊e/(ℓ − 1)⌋ + 1 ≤ t`, `h ≤ 2b`). Descent to `E_w`: `cor∘res` is multiplication by `f″_w` on
`H¹(E_w, (K_O/O)(−e))` (ArithmeticGaloisDuality R02.2.3 (1)), and corestriction carries `H¹_f(E′_w, ·)` into `H¹_f(E_w, ·)`
(both are images of the Bloch–Kato
subspaces with coefficients in `K_O(−e)`, which corestriction preserves); so `ℓ^{c + v_ℓ(f″_w)}` times the class of the cocycle lies
in `H¹_f(E_w, (K_O/O)(−e))`. `c_B` is the largest over `0 ≤ e < t` of the exponents `c + v_ℓ(f″_w)`, and `s_w ≤ 2 + log_ℓ n_w`,
`v_ℓ(f″_w) ≤ log_ℓ n_w`, both `≤ C(1 + log_ℓ(4b))` with `n_w ≤ [E:ℚ]`, give the bound stated. The second half of (TB): by the
local Euler characteristic `H¹(E_w, (K_O/O)(−e))_{div}` has corank `n_w + [e = 0] ≤ n_w + 1`, so its `ℓ^n`-torsion modulo `H¹_f` has
length at most `(n_w + 1)·n`, and the finite quotient `H¹/H¹_{div}`, dual to the torsion of `H²(E_w, O(−e))`, has length at most
`s_w + v_ℓ(e + 1) ≤ c_B` (7.7b: the image of `χ_cyc` on `G_{E_w}` contains `1 + ℓ^{s_w}ℤ_ℓ`); together `(n_w + 2)c_B` at `n = c_B`. The
cut cocycles of the character blocks are of this form, with `Y′ = Y` the cut module of 7.7a and `Ỹ = Y + O·E`, a lattice in a
finite sum of the `χ_1^{−1}r_x`. SelmerLengthBoundsAndLocalLifting §4.9c does not cover the type primes: a tame type of niveau `> 1` is crystalline over no
`K(μ_{ℓ^s})` with `K` unramified.

At the primes of rows 2–4 of 7.10a: follows from [FormalProof],
`Formalism/SharpRestriction/LevelLetterCocycles/LocalSituation.lean` (`Formalism.MainNotions.LocalSituation.TBat`),
`Formalism/SharpRestriction/LevelLetterCocycles/JointConditionsZpowers/CommutingEndomorphismCondition.lean` (`Formalism.MainNotions.N.KillingConditions.InvariantsBoundsWithCoarseColumnConstant`).
*Needs:* ThetaChainsOnDefiniteUnitaryGroups §2.1, ThetaChainsOnDefiniteUnitaryGroups §2.3, ThetaChainsOnDefiniteUnitaryGroups §2.3b, ThetaChainsOnDefiniteUnitaryGroups §2.3c, RowTowerAndRallisIdentities §5.9, 7.4, 7.6, 7.7a, 7.7b; SelmerLengthBoundsAndLocalLifting §4.9c; ClassFieldTheory §5.1
(local Euler characteristic); ArithmeticGaloisDuality R02.2.3 (corestriction).

### 7.10a The congruence bound at one prime: the rows

*Origin:* particular to this proof: the congruence bound at one prime, whose defect term is read from a table of six
cases according to the size of the prime and its splitting in the fields of the chain.

*Method of the formal proof:* an assembly at each good lifted point: the Ribet-type bound of 7.7b is applied in its form
with columns at the primes split in `K` and in its form without columns at the inert primes, where the defect at each
place is read from one of three lifting theorems with loss according to the word of the place (a long orbit; some letter
not thick; all letters thick); the large primes off `Exc` have defect zero by 7.7c, the primes `2`, `3`, `ℓ | f_E`, `q`,
`d` are bounded as wholes, and the entries of the table are then checked numerically from the size conditions.

*Definition.* A twisting datum is *good* if at every twisted `𝔭 | ℓ` the character `ψ_𝔭`
is an `ℓ^{−2}`-good twist at `𝔭` in the sense of 7.8(2) (for some finite family of polynomial conditions); 7.8(2) produces
such twisting data.

Assume that the twisting datum is good and that every `Ш¹(E, ℓ, e)` (`ℓ` prime, `0 < e < t`) is finite; chain data (ThetaChainsOnDefiniteUnitaryGroups Layers 2–3, with the good labels and model lifts of
RowTowerAndRallisIdentities Layer 5) with `Size(x, ε)` (ThetaChainsOnDefiniteUnitaryGroups §2.1; its
host predicate `SizeInert` makes every prime inert in `K` at least `13`), `SizeSc`, the separation (W7), `SizeSep` (ThetaChainsOnDefiniteUnitaryGroups §2.3b, ThetaChainsOnDefiniteUnitaryGroups §2.3c),
`SizeThin` and the bound `w_j(τ) ≤ a⁻_τ + b′/x + η_s` at the top places (7.6(a)), the thresholds `ℓ*`, `ℓ_A` of ThetaChainsOnDefiniteUnitaryGroups §2.3c, the type primes of ThetaChainsOnDefiniteUnitaryGroups §2.7 (with `𝔅(r, g₀) ∩ 𝔅(r, g₁) = ∅` and `SizeG`) and a
thick set (FrobeniusRestrictedRieszSums §0.8a) whose length `L_th` satisfies the *depth hypothesis*: for every prime `ℓ ≥ 11` some
`j ≥ 0` has `(ℓ − 1)^j ≥ ℓ_A` and `2j + 2 ≤ L_th`; `x ≥ x₀`. For a twisted prime
`ℓ ∉ {g₀, g₁}`, a twisted `𝔭 | ℓ` and `π ∈ Z_good`,

`v(c(π)) ≤ v_ℓ(w_{tr}(E)) + 2ℓ^{−2} + v_ℓ(h_E) + Σ_{0<e<t} length Ш¹(E, ℓ, e) + β(ℓ)`,

`c(π)` the ideal of 7.1(2), with `β(ℓ)` given by the first row of the table that applies to `ℓ` (`n_w` is the same for all
`w | ℓ`; a place `w` is *resonant* if some letter of `w` that is not thick has a size `s` in the datum to which rows 3 and
4 apply SelmerLengthBoundsAndLocalLifting §4.10d (route below; `s ∈ [w″, w_max]`) with
`|ℓs − b| ≤ C(ℓ(η_s + t) + ℓSc + b/ℓ + s + ℓL)`):

| row | `ℓ` | `β(ℓ)` |
|---|---|---|
| 1 | `ℓ > ℓ*`, `ℓ ∉ Exc` | `0` |
| 2 | `ℓ ≥ 5` split in `K`, unramified in `E`, `ℓ ≤ ℓ*` or `ℓ ∈ Exc` | `½·Σ_{w|ℓ}(2n_wm + 1)·e(ℓ) + B` |
| 3 | `ℓ ≥ 11` inert in `K`, unramified in `E`, `ℓ < ℓ_A`, and the order of `ℓ` in `(ℤ/2^{n+2})^×/{±1}` (`n` the layer of the cyclic host, FrobeniusRestrictedRieszSums §0.4), that is the least `o > 0` with `ℓ^o ≡ ±1 (mod 2^{n+2})`, exceeds `4L_th`; here `j′ := max(1, ⌈log_{ℓ−1} ℓ_A⌉)` | `Σ_w C(n_w + 1)r·( h/(ℓ − 1)^{j′+1} + (w_max + Sc + η_s + t)(j′ + 1) + L ) + B` |
| 4 | the other `ℓ ≥ 11` inert in `K`, unramified in `E`, `ℓ ≤ ℓ*` or `ℓ ∈ Exc` | `Σ_w ( C(n_w + 1)r·( h/ℓ² + (w_max + η_s + t)/ℓ + Sc + L + η_s·[w resonant] ) + C·n_w·m·e(ℓ) ) + B` |
| 5 | `ℓ ∈ {2, 3}` or `ℓ | f_E`, `ℓ ∉ {q, d}` | `C·f·m·b·log x + C·x^C·L²` |
| 6 | `ℓ ∈ {q, d}` | `C·f·( r·(b/ℓ + Sc + t + η_s + L) + m·b ) + C·(f r t)^C·L` |

The rows are applied at the twisted places only; a prime above which no place is twisted contributes nothing. Row 1
applies at every twisted place above a prime `ℓ > ℓ*`, `ℓ ∉ Exc`.

*Route.* At a twisted `𝔭 | ℓ`: 7.1(2) gives `η_j(𝔭) ≤ Σ_{π∈Z_good} mult(π)(v(c(π)) + v_ℓ|G₀|)` with `Z ∩ X_s ⊂ Z_good`, and 7.7a
applies to `X_s ∩ X_𝔪`. 7.9(b) gives (R)(i)–(ii) at every `ℓ`; (R)(iii) is the inertial relation of 7.4(3) at the type places
for `x ∈ X_s`, where the cut by the type makes the parameters tame with `N = 0` (7.4(7)): `P` is the factor of the
characteristic polynomial of `r(ς₀)` over `𝕋_𝔪` lifting that of `ρ̄(ς₀)` (Hensel), prime to `(X − χ̄_1(ς₀))^t` by the
eigenvalue clause of 7.9(b)(2); (R)(iv), (v): by 7.4(8) every `r_x` restricted to inertia at `v ∈ A(ℓ) ∪ Q(ψ_𝔭)` is semisimple,
through the trivial character and one character `c̃`, the same for all `x`; at `π` the block gives `χ_1` on inertia and `ρ_Σ` is
unramified there (the level of `U(W_j)` is hyperspecial at `v`, ThetaChainsOnDefiniteUnitaryGroups §2.9c), so `c̃ = χ_1` on inertia and
`(r_x(ς) − 1)(r_x(ς) − χ_1(ς)) = 0`; at `A(ℓ)`, `χ_1(ς₀)` has order `o_δ` (ThetaChainsOnDefiniteUnitaryGroups §2.4(b); `o_δ` is not a prime power, so `Φ_{o_δ}(1) = 1` and
`χ_1(ς₀) − 1` divides `Φ_{o_δ}(χ_1(ς₀)) − Φ_{o_δ}(1) = −1`: a unit for every `ℓ`, `3` and `5` included when `o_δ = 15`), and at
`Q(ψ_𝔭)`, `χ_1(ς_v) ≠ 1` (`c_{v₀} ≠ 1`); (L) is 7.4(4), 7.5(1); the goodness of the twisting datum with 7.8(2) gives the Selmer term `≤ v_ℓ(w_{tr}(E)) + ℓ^{−2}`
and the `Q`-term `≤ ℓ^{−2}`. The defect terms of 7.7b(i) other than the lifting costs are at most `B` (`[E:ℚ] = 2f = 4|A|`): the
`H⁰` terms of `L` and of the lattices of `W^*(1)` (rows 2 and 5, the only rows with columns) are each at most
`h_w := r·(2 + r·(2s_w + 2 + 2log_ℓ(4h)))`, by SelmerLengthBoundsAndLocalLifting §4.9d applied to the field `K′_w := K_w(μ_{ℓ^{s_w}})` (7.7b; its
maximal unramified subfield is `K_w`) and the inclusion `H⁰(E_w, V/T) ⊆ H⁰(K′_w, V/T)`: by (L), `W` and `W^*(1)` are crystalline at
`w`, hence over `K′_w`, their Hodge–Tate weights lie in an interval `[−M₀, h₀]` with `M₀ + h₀ ≤ 2h`, at each embedding at most `r` of
them are distinct, and `0` is not a weight of either (7.5(1): the weights of `W` avoid `[−1, t]`, so those of `W^*(1)` avoid `0` as
well); so `ℓ^c` kills the invariants of `V/T` for every stable lattice `T`, with
`c = 2 + Σ_u (2s_w + n₀ + 1 + v_ℓ(u)) ≤ 2 + r·(2s_w + 2 + 2log_ℓ(4h))` (`n₀ ≤ 1 + log_ℓ(2h)`, `v_ℓ(u) ≤ log_ℓ(2h)`), and a submodule
of `(K_O/O)^r` killed by `ℓ^c` has length at most `r·c`. Their sum over the at most `2f` places is at most
`C·f·r²·(log x + L) ≤ C·f·t·(r + t)·L ≤ B`, because `r ≤ t` (ThetaChainsOnDefiniteUnitaryGroups §2.1, (R5)), `s_w ≤ C·log x` and `log_ℓ(4h) ≤ C·L`. The character `H⁰`
terms are at most `s_w + v_ℓ(t!)` and `v_δ ≤ t·s_w + v_ℓ(t!)` (7.7b), and
`t·c_B·Σ_{Row}(n_w + 2) ≤ C·t²·[E:ℚ]²(r + t)·L` with `c_B` of 7.8a. The lifting costs come from the lifting theorems with loss
of SelmerLengthBoundsAndLocalLifting §§4.10c–4.10e, applied to the lattices of the twisted family and of its dual as they are: they
are lattices in crystalline representations by (L), and their Hodge–Tate weights lie in an interval of length at most `2h`
containing `0`, as these theorems require (they are not invariant under twists); their exponents are exponents of `ℓ`, and
their colength bounds are in lengths normalised by `length(O/ℓ) = 1`, the normalisation of this layer.
Row 1: 7.7c. Row 2: 7.7d with `e′` the exponent `2e_W + e_U` of SelmerLengthBoundsAndLocalLifting §4.10c (3),
`e′ ≤ 23(2 + 2h/ℓ + log_ℓ(2h + 1)) ≤ e(ℓ)` (`ℓ` odd, `E_w` unramified, coefficients containing its embeddings; the
lattices `𝒜e₁`, `𝒜E` of 7.7b's (Lift) are lattices in finite sums of the `χ_1^{−1}r_x`) for an interval of length `2h`, and
for the bound `h_ū` of 7.7d the number `h_w` above at `w = ū`: the columns cost `Σ_u (1 + j_u)e′` and the rows `Σ_ū (n_u·m·e′ + h_ū)`, so
`½·Σ_w(2n_wm + 1)·e′ + B` in all.
Rows 3, 4: 7.7b(i) with `Col = ∅` (at an inert prime both kinds of embeddings occur at each place, so neither `H¹_f(W)` nor
`H¹_f(W^*(1))` is small), the bound (Row) at every place from SelmerLengthBoundsAndLocalLifting §4.10d, in its notation: the letters are the embeddings of `E_w`
(unramified) in Frobenius order (write `h_ℓ := (Frob_ℓ)_A`, FrobeniusRestrictedRieszSums §0.4(iv)); by 7.6(a) and the windows of ThetaChainsOnDefiniteUnitaryGroups §2.3b, a thick letter (FrobeniusRestrictedRieszSums §0.6(c)) is up or down of size in
`[b, b + η]` with `S = Sc`, `η = η_s + t + 1` (the lows and the block in `[−η, η]`, the cloud within `Sc` of its base size),
every other letter is up or down of size between `η` and `w_max` (`w₀(τ) > η_s` and `w″ > x·ϑ`, ThetaChainsOnDefiniteUnitaryGroups §§2.3–2.3c, ThetaChainsOnDefiniteUnitaryGroups §2.3a), the same for the
dual family with up and down exchanged, and the target lattice `T` of (Row) (the second lattice of the surjection in
SelmerLengthBoundsAndLocalLifting §4.10d) has at most `m` weights, counted with multiplicity, in `[−η, η]` at every letter
(the lows). Row 3: SelmerLengthBoundsAndLocalLifting §4.10d (2) for
the depth `j′ = max(1, ⌈log_{ℓ−1} ℓ_A⌉)`, the least `j` with `(ℓ − 1)^j ≥ ℓ_A` (as `ℓ_A > 1`), for which the depth hypothesis
gives `2j′ + 2 ≤ L_th`; `C(j′ + 1)(w_max + Sc + η + 1) ≤ b` holds for the constant of that theorem and `x ≥ x₀` because
`j′ ≤ 1 + log_{10} ℓ_A ≤ C·log x` (`ℓ_A ≤ k·x^ε·|A|/m`, as `δ_th ≥ 1/|A|`) and
`w_max + Sc + η + 1 < 4ℓ* ≤ 4b·x^{−ε}` (`w_max ≤ 2b′` and `Sc ≤ w″/x`, ThetaChainsOnDefiniteUnitaryGroups §2.3b (f);
`2η_s + t + 7 < ℓ*` by `SizeSep` and `b′ < ℓ* ≤ b·x^{−ε}`, ThetaChainsOnDefiniteUnitaryGroups §2.3c);
its hypotheses on the word are `2j′ < n_w` and the `j′`-cluster property of
FrobeniusRestrictedRieszSums §0.8b for the thick letters along every Frobenius orbit above `ℓ`. Both follow from the row
predicate. The order of `ℓ` in `(ℤ/2^{n+2})^×/{±1}` is the order of the image of `h_ℓ` under `A ↠ Gal(ℚ_n/ℚ)`
(FrobeniusRestrictedRieszSums §0.4 (iii), (iv)), and the order of an image divides the order; so `ord h_ℓ > 4L_th`. Then any
`L_th` consecutive letters contain at most two thick ones (FrobeniusRestrictedRieszSums §0.8a (a), used for `ord h_ℓ > 4L_th`),
and since `2j′ + 2 ≤ L_th` by the depth hypothesis this gives the `j′`-cluster property (FrobeniusRestrictedRieszSums §0.8b (c),
(d), used for `ord h_ℓ > 4L_th` and `2j′ + 2 ≤ L_th`); and `n_w = ord Frob_ℓ ≥ ord h_ℓ > 4L_th > 2j′`. Row 4:
SelmerLengthBoundsAndLocalLifting §4.10d (3) (i), whose last term `C·n_w·m·e` has `e = 2e_W + e_U ≤ e(ℓ)`. Consecutive
letters alternate between `Φ` and `cΦ` (FrobeniusRestrictedRieszSums §0.3, Lemma (a): `Frob_ℓ^i ∉ Φ` iff `i` is odd), so the
directions alternate. The place of the letter `yFrob_ℓ^i` is read off FrobeniusRestrictedRieszSums §0.6(v): if `ℓ`
splits in `ℚ(√−q)`, thick letters occur at positions of one parity only; if `ℓ` is inert in `ℚ(√−q)`, the place of
`yFrob_ℓ^i` is `pl(y)·h_ℓ^i`, and FrobeniusRestrictedRieszSums §0.8b(d) (for `L_th ≥ 3`; the depth hypothesis at `ℓ = 11` gives
`L_th ≥ 4`, because `ℓ_A = k·x^ε/(m·δ_th) ≥ x^ε > 1`, as `m ≤ k` and `δ_th ≤ 1`) gives: no three consecutive letters thick and some letter not thick,
both when `ord h_ℓ > 4L_th` (FrobeniusRestrictedRieszSums §0.8a (a)) and when `2 ≤ ord h_ℓ ≤ 4L_th`
(FrobeniusRestrictedRieszSums §0.8a (b)); if `h_ℓ = 1`, that is `Frob_ℓ = c` (`n_w = 2`), both letters of a
place `w` have one place. So at every place `w | ℓ` the word of `w` satisfies one of two conditions. Either some letter is not
thick, and SelmerLengthBoundsAndLocalLifting §4.10d (3) (i) applies (`20·max(w_max, η_s + t + 1, Sc) < 40ℓ* ≤ b` for
`x^ε ≥ 40`, by the bounds of row 3). Or `Frob_ℓ = c` and the embedding of `w` in `Φ` is a
thick place: then `n_w = 2`, both letters are thick (FrobeniusRestrictedRieszSums §0.8b (d)), of sizes `b₀, b₁ ∈ [b, b + η]` with `S = Sc`, `η = η_s + t + 1` (the
sizes given by 7.6(a) and the windows of ThetaChainsOnDefiniteUnitaryGroups §2.3b; the size conditions below hold with room also for a window of the same width
shifted by at most `t + 1`), and
of opposite directions, and SelmerLengthBoundsAndLocalLifting §4.10d (4) applies after the coefficient ring is enlarged to contain `μ_ℓ`
(a finite extension of the coefficients multiplies colengths and `length(O/ℓ)` by the same factor): `ℓ ≥ 11` (`SizeInert`), `n_w`
is even, the target lattice has at most `m` weights, counted with multiplicity, in `[−η, η]` at both letters (the lows), and the
two size conditions hold by the last sentence of SelmerLengthBoundsAndLocalLifting §4.10d (4), because `b ≥ 100` and
`2η + S < 3ℓ* ≤ b/10` for `x^ε ≥ 30` (`2η_s + t + 7 < ℓ*` and `Sc < ℓ*`, as in row 3). Its number
`H = max(b₀, b₁) + S + η` is at most `h + t ≤ 2h`; with `n_w = 2`, rank `r` and the exponent `e′ ≤ C(1 + h/ℓ + log_ℓ h)` of
SelmerLengthBoundsAndLocalLifting §4.10c (3) it gives
`ν_w ≤ 3r·(64h/ℓ² + 4Sc + 10η/(ℓ − 1) + C(1 + log_ℓ(4h))) + 8m·e′ + 3(r·Sc + 2m·((2h + 1)/(ℓ − 1) + 1))`
`≤ C·r·(h/ℓ² + (η_s + t)/ℓ + Sc + L) + C·m·e(ℓ)`, the bound of the row without the resonance term. Row 5: 7.7d (the split
partition: every prime of this row splits in `K`; `2` by `d ≡ 7 (mod 8)`, `3` by `SizeInert`, the primes dividing `f_ψ` by
FrobeniusRestrictedRieszSums §0.4) with one exponent `e′ ≤ 14·(2h)·s_w + s_w + log_ℓ n_w` for the family at `Col` and the dual family at `Row`: SelmerLengthBoundsAndLocalLifting §4.10e (1) over
`K_w(μ_{ℓ^{s_w}})` (7.7b; the exponent `e_s ≤ 14Hs` with `H ≤ 2h`), on the lattices of SelmerLengthBoundsAndLocalLifting §4.10e (0) (constructed for every
`K₀ ⊆ K ⊆ K₀(μ_{ℓ^s})`, `ℓ = 2` with `s ≥ 2` included), the descent SelmerLengthBoundsAndLocalLifting §4.10e (2) to `E′_w = E_wK_w` (7.8a), which costs
`v_ℓ([K_w(μ_{ℓ^{s_w}}) : E′_w]) ≤ s_w`, and the unramified descent from `E′_w` to `E_w` by corestriction
(`cor∘res = f″_w`, ArithmeticGaloisDuality R02.2.3 (1)), which costs
`v_ℓ(f″_w) ≤ log_ℓ n_w` (for a surjection `L₁ ↠ L₂` and `y ∈ H¹_f(E_w, L₂)`, if `ℓ^e·res(y)` is the image of a class `z` of
`H¹_f(E′_w, L₁)`, then `f″_wℓ^e·y` is the image of `cor(z) ∈ H¹_f(E_w, L₁)`); at `ℓ = 3` unramified in `E`, SelmerLengthBoundsAndLocalLifting §4.10c (3) instead; for the
bound `h_ū` of 7.7d the number `h_w` above at `w = ū`. Then `β(ℓ) ≤ ½·Σ_w(2n_wm + 1)·e′ + B ≤ C·f·m·h·s_w + B`, and
`s_w ≤ 2 + log_ℓ n_w ≤ C·log x`. Row 6: 7.7b(i) with `Col = ∅` and
SelmerLengthBoundsAndLocalLifting §4.10e (3), on the lattices of SelmerLengthBoundsAndLocalLifting §4.10e (0) for `s = 1` (clause (R)): `E_w ⊂ E_{w,0}(μ_ℓ)` and `e_{E_w} = 2` (`q` and `d` ramify in `E`
only in `ℚ(√−q)`, resp. `ℚ(√−d)`: `q, d ∤ f_ψ`, FrobeniusRestrictedRieszSums §0.4); its window hypotheses hold as in rows 3–4: at every embedding of `E_w` the
letter is up or down of a size `> η` (the lows and the block in `[−η, η]`, the cloud within `Sc` of its base size, all
weights in `[−h, h]`), the target lattice has at most `m` weights, counted with multiplicity, in `[−η, η]` at each embedding
(the lows), and `e_{E_w} = 2`.

*Checks.* (i) A twisted prime inert in `K` below `11` would fall in no row (SelmerLengthBoundsAndLocalLifting §4.10d (2) and (3) need `ℓ ≥ 11`; SelmerLengthBoundsAndLocalLifting §4.10d (1) is
stated for `ℓ ≥ 5`); `SizeInert` (ThetaChainsOnDefiniteUnitaryGroups §2.1) excludes it. (ii) At a prime split in `K` every letter of an orbit lies in `Φ` or every
letter in `cΦ` (Frobenius lies in `Φ`), so all directions are equal and SelmerLengthBoundsAndLocalLifting §4.10d (3) (i) does not apply: this is why the split
primes go through the column construction of row 2. (iii) At a prime with `Frob_ℓ = c` the two letters of a place whose
embedding in `Φ` is thick are both thick (FrobeniusRestrictedRieszSums §0.8b(d), Check); such primes are inert in `K` and their Frobenius is the class of `−1`
in `Gal(E/ℚ)` (this is not a single residue class modulo `f_E`); there are infinitely many (Chebotarev), and those `≤ X″` are
twisted at every place above them (ThetaChainsOnDefiniteUnitaryGroups §2.5): they occur, and SelmerLengthBoundsAndLocalLifting §4.10d (4) is the statement used there.
(iv) Row 4 uses two clauses of SelmerLengthBoundsAndLocalLifting §4.10d at the places of one prime: (3)(i) where some letter is not thick, (4) where both letters
are thick. If the thick set were empty, (4) would never be used; at a prime `ℓ` with `Frob_ℓ = c` and a thick place, (3)(i) does
not apply (it asks for a letter that is not thick).

Good twisting data: follows from [FormalProof],
`Formalism/SharpRestriction/LevelLetterCocycles/TwGood.lean` (`Formalism.MainNotions.TwGoodAt`),
`Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/ChosenTwistAnnihilatesSelmerGroups.lean` (`GlobalTheory.NLink.twist_kills_selmer`);
the depth hypothesis and `j′`: [FormalProof],
`Development/AbelianVarietyTheory/Proofs/SatakeParameters/LeastPowerDepthSpec.lean` (`GlobalTheory.depth_spec`),
`Development/AbelianVarietyTheory/Definitions/GaloisGeometry/Alternates.lean` (`GlobalTheory.HTW.depth`),
`Development/AutomorphicArithmetic/ResidueCharacters/TwistedPlaces.lean` (`Formalism.MainNotions.TwistedPlaces.jA`);
the inequality: [FormalProof],
`Development/AutomorphicArithmetic/ResidueCharacters/TwistedPlaces.lean` (`Formalism.MainNotions.TwistedPlaces.ArchimedeanSignatureMatching`);
row 1: [FormalProof],
`Development/AutomorphicArithmetic/ResidueCharacters/TwistedPlaces.lean` (`Formalism.MainNotions.TwistedPlaces.LargePrimeLengthVanishing`);
row 2: follows from [FormalProof],
`Development/AutomorphicArithmetic/ResidueCharacters/TwistedPlaces.lean` (`Formalism.MainNotions.TwistedPlaces.admA`);
row 3: follows from [FormalProof],
`Formalism/SharpRestriction/LevelLetterCocycles/JointConditionsZpowers/CommutingEndomorphismCondition.lean` (`Formalism.MainNotions.N.KillingConditions.IsRowB`),
`Development/AutomorphicArithmetic/ResidueCharacters/TwistedPlaces.lean` (`Formalism.MainNotions.TwistedPlaces.ordH`);
row 4: follows from [FormalProof],
`Development/AutomorphicArithmetic/ResidueCharacters/TwistedPlaces.lean` (`Formalism.MainNotions.TwistedPlaces.MediumInertPrimeLengthBound`);
row 5: [FormalProof],
`Development/AutomorphicArithmetic/ResidueCharacters/TwistedPlaces.lean` (`Formalism.MainNotions.TwistedPlaces.SmallPrimeLengthBound`),
`Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/ConjEMemHostFIff.lean` (`Formalism.HC.HostRaw.small`);
row 6: [FormalProof],
`Development/AutomorphicArithmetic/ResidueCharacters/TwistedPlaces.lean` (`Formalism.MainNotions.TwistedPlaces.RamifiedPrimeLengthBound`);
the term `B`: [FormalProof],
`Development/AutomorphicArithmetic/ResidueCharacters/TwistedPlaces.lean` (`Formalism.MainNotions.TwistedPlaces.adm5`),
`Formalism/SharpRestriction/LevelLetterCocycles/JointConditionsZpowers/CommutingEndomorphismCondition.lean` (`Formalism.MainNotions.N.KillingConditions.BBLe`).
*Needs:* FrobeniusRestrictedRieszSums §0.3, FrobeniusRestrictedRieszSums §0.4, FrobeniusRestrictedRieszSums §0.6, FrobeniusRestrictedRieszSums §0.8a, FrobeniusRestrictedRieszSums §0.8b, ThetaChainsOnDefiniteUnitaryGroups §2.1, ThetaChainsOnDefiniteUnitaryGroups §2.3, ThetaChainsOnDefiniteUnitaryGroups §2.3a, ThetaChainsOnDefiniteUnitaryGroups §2.3b, ThetaChainsOnDefiniteUnitaryGroups §2.3c, ThetaChainsOnDefiniteUnitaryGroups §2.4, ThetaChainsOnDefiniteUnitaryGroups §2.5, ThetaChainsOnDefiniteUnitaryGroups §2.7, ThetaChainsOnDefiniteUnitaryGroups §2.9, ThetaChainsOnDefiniteUnitaryGroups §2.9c, 7.1, 7.4, 7.5, 7.9, 7.6, 7.7a, 7.7b, 7.7c,
7.7d, 7.8, 7.8a; SelmerLengthBoundsAndLocalLifting §§4.9d, 4.10c(1), 4.10c(3), 4.10d(2), 4.10d(3)(i), 4.10d (4), 4.10e(0)–(3); LengthBoundsInPadicFamilies
§§1.7a, 1.8e; ArithmeticGaloisDuality R02.2.3 (corestriction).

### 7.10b The congruence bound at the type primes

*Origin:* particular to this proof: the congruence bound at the two type primes, where the Galois representations are
potentially crystalline of tame type and every block is bounded through pushouts of finite classes.

*Method of the formal proof:* for each good lifted point a cut `X_s(π)` is taken with a Hecke-commuting endomorphism that
is a nonzero scalar of valuation at most `v_ℓ|G₀|` on the eigenspace of the point and zero off the cut; on the cut the
family is potentially crystalline at each of the `2f` places above `ℓ`, the tame lifting theorem and the pushout
statement bound the cut cocycles (the family at the places of one sign, the dual family at the others), the Ribet-type
bound of 7.7b (ii) bounds the congruence ideal of the cut, and the endomorphism index bound in its family form, with the
multiplicities of 7.5b, gives the sum over the places.

Assume that the twisting datum is good (7.10a) and that every `Ш¹(E, ℓ, e)` is
finite; chain data as in 7.10a. For
`ℓ = g_i` (`i ∈ {0, 1}`) and every step `j`:

`Σ_{𝔭|ℓ} ϱ(𝔭)e_𝔭η_j(𝔭) ≤ log ℓ·d^Z_j·( C·x^C·η_s + Σ_{0<e<t} length Ш¹(E, ℓ, e) + v_ℓ(h_E) + 2ℓ^{−2} )`.

For every level `(P, χ_P)` the same holds with `η^P_j`, `d^{Z,P}_j` in place of `η_j`, `d^Z_j` (7.1 (4)). *The form of the
formal proof* is the one at the base level, where `d^{Z,P_0}_j = D_0` (7.8a).

*Route.* Let `i″` be the other index. 7.7b(ii) with the cuts of 7.1(3): for each `π ∈ Z_good` take `X_s = X_s(π) ∩ X_𝔪`;
`v_ℓ(|G₀|) ≤ f·r(r − 1)/2 + f·Σ_{a≤r}v_ℓ(g_{i″}^a − 1) ≤ 2fr²`, since `g_{i″} ≤ g_i²` (ThetaChainsOnDefiniteUnitaryGroups §2.7: both lie in `(Y, 2Y]`). (R) holds for
the points of `X_s(π)` with `Σ(𝔭)` the places above `g_{i″}` together with `A(ℓ)` (as in 7.10a, with 7.4(7) for the points of
`X_s(π)`), and (L′) by 7.4(4), 7.4(7); `g` is an inertia element above `ℓ` as in 7.7a: `ℓ = g_i > t + 1` is unramified in `E`, so
the generator choice gives `v_δ = 0`. Every place `w | ℓ` has `E_w = ℚ_ℓ` (`g_i` splits completely in `E`, ThetaChainsOnDefiniteUnitaryGroups §2.7), and there are
`2f` of them. (i) Over `X_s(π)` the labels at the places above `ℓ` are those of `π`, so by 7.4(4), (7) every `χ_1^{−1}r_x`,
`x ∈ X_s(π)`, is crystalline over one tamely ramified extension, with inertia acting through one Frobenius-stable set
`Σ_w ∋ 1` of at most `r + 1` characters (those of the roots of the label divided by that of the block), and the dual family
through `Σ_w^{−1}`. (ii) At a place whose embedding lies in `Φ` the weights of the family lie in a set `U ∋ 0` of at most
`r + t + 1` integers, `U ⊂ [−η, η′]`, `η = η_s + t + 1`, `η′ ≤ 2h`; at the conjugate place those of the dual family do (7.6(a),
and `q ↦ q − t`). (iii) SelmerLengthBoundsAndLocalLifting §4.10f with `N = r + t + 1` (`40(η′N² + N³) < g_i` because `η′ ≤ 6b`,
`N ≤ 2x^{C_t}` and `g_i > (kb)⁸`, `SizeG`) gives its lifting exponent `40(N·r′ + η(N + r′))` (`4r′ ≤ N²`), at most
`e_max := 40(N·⌊N²/4⌋ + η(N + ⌊N²/4⌋))`, for all lattices
with these types and weights. (iv) The restriction to `G_{E_w}` of a cut cocycle is the pushout of a finite class: the
lattice is the image of the cut module `Y` of 7.7a, the class that of `g ↦ (u_g − 1)E`, finite because an extension of the
trivial representation inside a potentially crystalline one is finite. By the pushout statement of SelmerLengthBoundsAndLocalLifting
§4.10g, in its first form at the places of the first kind and in its dual form at the second (the span of `Y` is a direct
summand of a finite sum of the `χ_1^{−1}r_x ⊗ K_O`, these being semisimple, so its dual lies in a finite sum of the dual
family), `ν_ρ(w) ≤ 2r·e_max` and `ν_χ(w) ≤ 2e_max` at every `w | ℓ`: the form of the formal proof of 7.7b (ii) applies, with
`e_ρ = 2r·e_max`, `e_χ = 2e_max` and `#{w | ℓ} = 2f`. Hence
`v(c′(π)) ≤ 4f(r + t)e_max + length Sel(W) + Σ_{0<e<t} length Ш¹(E, ℓ, e) + v_ℓ(h_E) + t·Σ_{v∈Q(ψ_𝔭)} v(χ_1(ς_v) − 1)`;
The goodness of the twisting datum bounds the Selmer term by `v_ℓ(w_{tr}(E)) + ℓ^{−2} = ℓ^{−2}` (`E ∩ ℚ(μ_ℓ) = ℚ`, `ℓ` being unramified in `E`, and
`ℓ − 1 > tr`, so `χ_cyc^{tr}` is not `≡ 1` modulo `ℓ` on `G_E`) and the `Q`-term by `ℓ^{−2}`; and
`4f(r + t)e_max + 2fr² ≤ C·x^C·η_s`. Multiplicities: 7.5b, and `Σ_{𝔭|ℓ} ϱ(𝔭)e_𝔭 = log ℓ`. The steps (i), (iii) rest on two
local statements cited as such: the local type statement FiniteReductiveGroups §6.5 for the points of
`X_s(π)` outside `Z` (through 7.4(7)), and the comparison at the coefficient prime BaseChangeAndGaloisRepresentationsForUnitaryGroups §15.1
for their cuspidal constituents (through 7.4(4)); and on the tame lifting theorem SelmerLengthBoundsAndLocalLifting §4.10f.

[FormalProof],
`Development/AbelianVarietyTheory/Definitions/NonGaloisDescent/BoundAtTwoThreeFamily.lean` (`GlobalTheory.NLink.StarH`),
`Development/AutomorphicArithmetic/ResidueCharacters/TwistedPlaces.lean` (`Formalism.MainNotions.TwistedPlaces.GeneratorPrimeEtaBound`).
The bound at one place above a type prime, for every pair of Galois families: [FormalProof],
`Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/LocalGlobalCompatibility.lean` (`Formalism.MainNotions.PairedCharacterCondition.PairedCharacterConditionAlt`),
proved for `C_T ≥ 40` (the constant `40` of Route (iii)) and `C ≥ 8C_T` in
`Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/AdmG14OfAuxStatement.lean` (`GlobalTheory.T.conclusion41_of_pAdicHodge_alt`),
and with constants serving every record in
`Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/ExtraBoundOfTwistingEigenFacts.lean` (`GlobalTheory.T.exists_const_tieChi_bound_of_facts`).
*Needs:* ThetaChainsOnDefiniteUnitaryGroups §2.7, ThetaChainsOnDefiniteUnitaryGroups §2.9, 7.1, 7.4, 7.5b, 7.6, 7.7a, 7.7b, 7.8, 7.10a; SelmerIwasawaCohomology §4.9 and SelmerLengthBoundsAndLocalLifting §§4.10f, 4.10g;
LengthBoundsInPadicFamilies §§1.7a (4′), 1.8e(2); FiniteReductiveGroups §6.5; BaseChangeAndGaloisRepresentationsForUnitaryGroups §15.1.

### 7.10c The sum

*Origin:* particular to this proof: the sum of the congruence bounds over all primes, with a term of size `f·m·b·L²`
and the total `V(E, t)` of the lengths of the groups `Ш¹(E, ℓ, e)`.

*Method of the formal proof:* the rows are summed over the twisted primes with the weights `log ℓ`, and each row is
bounded by an elementary prime sum: `Σ log ℓ/ℓ` up to `ℓ*` for the main term, the decay in the depth for the long
orbits, the tail of `Σ log ℓ/ℓ²` above `ℓ_A`, the progression `ℓ ≡ ±1` modulo a large power of two for the inert primes
of small Frobenius order, and the bound `ℓ ≤ C·b/w″` for the resonant primes; the terms `log h_E`, `log |G₀|`,
`log w_{tr}(E)` and the sums over the exceptional, small and type primes are absorbed in `b`.

Under the hypotheses of 7.10a, among them the depth hypothesis on the thick set (for every prime `ℓ ≥ 11` some
`j ≥ 0` has `(ℓ − 1)^j ≥ ℓ_A` and `2j + 2 ≤ L_th`; it is the condition at `ℓ = 11`), and under the *length bound*
`L_th ≤ C_L·log x` for a constant `C_L` fixed before `ε`: there are a constant `C`, depending only on `C_L`, `C_t` and
`A_max`, and a threshold `x₀(ψ, ε, C_L)` such that for `x ≥ x₀` and every step `j`:

`Σ_𝔭 ϱ(𝔭)e_𝔭η_j(𝔭) ≤ d^Z_j·( C·f·m·b·L² + V(E, t) )`,

and `Σ_ℓ v_ℓ(w_{tr}(E))·log ℓ = log w_{tr}(E)`, and, on a host of FrobeniusRestrictedRieszSums §0.4 with
`Q_S := f_E/(q·d) ≤ |A|²` and `q, d > 4·t·r + 1` (conditions that the hosts of the chain carry in [FormalProof]),
`log w_{tr}(E) ≤ log(Q_S·t·r) ≤ 2·log|A| + log t + log r`; [FormalProof] uses that `t·r` is odd. `Q_S ≤ |A|²` holds on a
host of layer `n` with `2^n ≥ 4f_ψ`, as there `2^n` divides `|A|` and `f_E ≤ 2^{n+2}·f_ψ·q·d`
(FrobeniusRestrictedRieszSums §0.4 (iii)).

*At a level.* For every level `(P, χ_P)` at the type primes the same holds for the level parts:
`Σ_𝔭 ϱ(𝔭)e_𝔭η^P_j(𝔭) ≤ d^{Z,P}_j·( C·f·m·b·L² + V(E, t) )`. *The form of the formal proof.* At the base level this is
`Σ_𝔭 ϱ(𝔭)e_𝔭η^{P_0}_j(𝔭) ≤ D_0·( C·f·m·b·L² + V(E, t) )`. [FormalProof] states the base-level sum with the further
nonnegative term `(log x)²·N_c` in the bracket (`N_c` the budget of ThetaChainsOnDefiniteUnitaryGroups §2.1):
`Σ_𝔭 ϱ(𝔭)e_𝔭η^{P_0}_j(𝔭) ≤ d^{Z,P_0}_j·( C·(f·m·b·L² + (log x)²·N_c) + V(E, t) )`; its congruence lengths are those of the
base-level lattice and its factor is the base-level dimension `d^{Z,P_0}_j` ([FormalProof],
`Development/AutomorphicArithmetic/ResidueCharacters/TwistedPlaces.lean` (`Formalism.MainNotions.TwistedPlaces.aux₃`)), which
equals `D_0` on the family by a separate statement ([FormalProof], `Formalism/SharpRestriction/GlobalTheoremInputs.lean`
(`Formalism.MainNotions.SmallLevelRankEq`)). The
form without that term and the form with `d^Z_j` (the whole lattice, `P = 1`) are this roadmap's, by the route below; the route
of 7.11 compares the two forms.

*Route.* Sum 7.10a (with 7.1(2) and 7.5b for the multiplicities) and 7.10b over the twisted places. At a level
`(P, χ_P)`: the same sum with 7.1 (4), the ideals `c(π)`, `c′(π)` and their bounds being unchanged and the multiplicities
being `mult^P`.
`Σ_ℓ v_ℓ(w_{tr}(E))·log ℓ = log w_{tr}(E)`, `log h_E` and `log|G₀|` (ThetaChainsOnDefiniteUnitaryGroups §2.9a), and the sums over `Exc` (7.6(a)) and over the type primes are bounded by a power
of `x·e^{x^{ε/4}}`, hence by `b`; `Σ_{ℓ≤ℓ*} log ℓ·B ≤ 1.1ℓ*·B ≤ C·f·m·b` by the definition of `ℓ*`;
`Σ_{ℓ≤ℓ*} log ℓ·Σ_w(2n_wm + 1)·h/ℓ ≤ C·f·m·b·log ℓ*` (by `Σ_{ℓ≤y} log ℓ/ℓ ≤ log y + C`,
AnalyticNumberTheoryPartI §0.11), the main term; the inert rows by
`Σ_{ℓ<ℓ_A}(ℓ − 1)^{−(j′+1)} log ℓ ≤ C·log ℓ_A/ℓ_A` (take `(ℓ − 1)^{j′+1} ≥ (ℓ − 1)ℓ_A`), `Σ_{ℓ≥ℓ_A} log ℓ/ℓ² ≤ C/ℓ_A` and
`Σ_{ℓ≤ℓ*} log ℓ·r(Sc + L) ≤ C·m·b`, the factor `log ℓ_A` being absorbed by `(3 + log ℓ_A)² ≤ L`. These use three comparisons,
each one line from the ranks of ThetaChainsOnDefiniteUnitaryGroups §2.1 (`r = k + m − 1`, `N_j = k + j(t + 1)`, (R1) `m + 3 ≤ k`) and the density
`δ_th = |𝒯|/|A| ≤ 1`: `r + t ≤ N_m + t` (as `N_m − r = mt + 1 > 0`); `r ≤ 2k` (as `m ≤ k`), used against the summand
`k|A|²(Sc + t + L)` of `D_*` and the definition `ℓ* = mb/D_*` (ThetaChainsOnDefiniteUnitaryGroups §2.3c); and `r/ℓ_A ≤ 2m/L` (from `r ≤ 2k` and
`ℓ_A = k·L/(m·δ_th)`, ThetaChainsOnDefiniteUnitaryGroups §2.3c), with `(3 + log ℓ_A)² ≤ L` (`ℓ_A ≤ x^C`). The inert primes of row 4 below `ℓ_A` are, by the row
predicate of 7.10a, those whose order in `(ℤ/2^{n+2})^×/{±1}` is at most `4L_th`, among them those with `Frob_ℓ = c`: they
satisfy `ℓ^o ≡ ±1 (mod 2^{n+2})` for some `o ≤ 4L_th`, a congruence condition, summed as such. As that group is cyclic of order
`2^n` (FrobeniusRestrictedRieszSums §0.4), the order is a power of two at most `4L_th`, so these primes are `≡ ±1` modulo a power of two
`M_* ≥ 2^{n+2}/(4L_th) ≥ |A|/([ℚ(ψ):ℚ]·L_th)` (as `2^{n+2} ≥ 4|A|/[ℚ(ψ):ℚ]`: by FrobeniusRestrictedRieszSums §0.4 (iii)
`A ≅ Gal(ℚ_nℚ(ψ)/ℚ)`, of order at most `[ℚ_n:ℚ]·[ℚ(ψ):ℚ] = 2^n·[ℚ(ψ):ℚ]`); with `[ℚ(ψ):ℚ] ≤ x^{ε/100}` (for `x ≥ x₀(ψ, ε)`) and the length bound
`L_th ≤ C_L·log x`, `M_* ≥ |A|·x^{−ε/50}` for `x ≥ x₀(ψ, ε, C_L)`, and the sum of `log ℓ/ℓ²` over the primes `≡ ±1 (mod M_*)` is at most
`C·log M_*/M_*²`; with `k/m ≤ |A|²` (ThetaChainsOnDefiniteUnitaryGroups §2.1) and `r ≤ 2k` this gives
`r·Σ log ℓ/ℓ² ≤ C·m·x^{ε/25}·log x ≤ C·m·L²`. The resonance terms of row 4: for a resonant `w` and its size `s ≥ w″`, `SizeThin` gives
`C(η_s + t + Sc + L) ≤ s/2` for `x ≥ x₀`, so the resonance inequality gives `ℓs/2 ≤ (1 + C)b + Cs` and `ℓ ≤ C·b/w″`; these terms
sum to at most `Σ_{ℓ≤Cb/w″} log ℓ·C·r·η_s·Σ_w(n_w + 1) ≤ C·f·r·η_s·b/w″ ≤ C·f·m·b·L²` (Chebyshev,
ArithmeticStatisticsPartIII §2.1; `SizeThin`:
`r·η_s ≤ m·w″/x`). Rows 5, 6 concern the primes dividing `2f_E`, with `SizeDep` (ThetaChainsOnDefiniteUnitaryGroups §2.1); the
`Ш`-terms sum to `V(E, t)`.

*Checks.* (i) `Σ_{𝔭|ℓ} ϱ(𝔭)e_𝔭 = (log ℓ/[𝕃:ℚ])·Σ_{𝔭|ℓ} e_𝔭f_𝔭 = log ℓ`. (ii) The twisted primes below `ℓ*` carry the main term:
if only the primes `≤ X″` were twisted, the main term would be `C·f·m·b·log X″ = C·f·m·b·x^{ε/3}`; row 1 is needed because a
twisted place can lie above a prime larger than `ℓ*` (ThetaChainsOnDefiniteUnitaryGroups §2.5).

`Σ_ℓ v_ℓ(w_{tr}(E))·log ℓ = log w_{tr}(E)` and the bound on `log w_{tr}(E)`: follows from [FormalProof],
`Development/AutomorphicArithmetic/CyclotomicBounds/CyclotomicOrders/NuHost.lean` (`UpperTheory.KStar.sum_nuL_le`, `UpperTheory.KStar.nuBudget_le`),
`Development/AutomorphicArithmetic/CyclotomicBounds/RootsOfUnity/NuRecord.lean` (`UpperTheory.Mu.sum_nu_le`, `UpperTheory.Mu.budget_le`),
which bound `Σ_{ℓ∈S} v_ℓ(w_{tr}(E))·log ℓ` for every finite set `S` of primes; in [FormalProof] the conditions `Q_S ≤ |A|²`
and `q, d > 4·t·r + 1` are fields of the host record,
`Formalism/LocalRingCardinality/DataHost.lean` (`Formalism.BasicNotions.Host.QS_le`, `Formalism.BasicNotions.Host.qd_big`).
The rows of 7.10a and 7.10b at every point of a family, as one statement: [FormalProof],
`Development/AbelianVarietyTheory/Definitions/NonGaloisDescent/BoundAtTwoThreeFamily.lean` (`GlobalTheory.NLink.ConclF`),
with its record of fifteen clauses
`Development/AbelianVarietyTheory/Definitions/NonGaloisDescent/BoundAtTwoThreeFamily.lean` (`GlobalTheory.NLink.Concl`), proved in
`Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/ImportsFurtherTailStatement.lean` (`GlobalTheory.T.conclF_of_family_facts_and_bound_at_two_three`).
*Needs:* FrobeniusRestrictedRieszSums §0.4, FrobeniusRestrictedRieszSums §0.8b, ThetaChainsOnDefiniteUnitaryGroups §2.1, ThetaChainsOnDefiniteUnitaryGroups §2.3, ThetaChainsOnDefiniteUnitaryGroups §2.3c, ThetaChainsOnDefiniteUnitaryGroups §2.9, 7.1, 7.5b, 7.6, 7.10a, 7.10b; BernoulliBoundsForClassGroupEigenspaces §6.17 (`V(E, t)`);
AnalyticNumberTheoryPartI §0.11; ArithmeticStatisticsPartIII §2.1.

### 7.11 The total congruence bound under a wild-kernel budget

*Origin:* particular to this proof: the total congruence bound of a step once the groups `Ш¹(E, ℓ, e)` are bounded in
total, the point at which the bound for wild kernels enters, by insertion of the budget into 7.10c.

*Method of the formal proof:* the bound of 7.10c is rewritten with `f·m·b·L² = x^ε·B₀` and `(log x)² ≤ x^ε`, and the
term `V(E, t)`, whose partial sums over finite sets of primes are bounded, is inserted through `V(E, t) ≤ b ≤ B₀`.

*Definition.* For a real `κ_W ≥ 0`, the host has *wild-kernel budget `κ_W`* if every
group `Ш¹(E, ℓ, e)` of BernoulliBoundsForClassGroupEigenspaces §6.17 (`ℓ` any prime, `2` included, `0 < e < t`) is finite, and
`V(E, t) = Σ_ℓ log ℓ · Σ_{0<e<t} length Ш¹(E, ℓ, e) ≤ κ_W·x^ε·B₀` (`B₀` of ThetaChainsOnDefiniteUnitaryGroups §2.1).

There are `C`, depending only on `C_L`, `C_t` and `A_max`, and `x₀` such that for `x ≥ x₀`, for a good twisting datum
(7.10a) and a host with wild-kernel budget `κ_W`, with the chain data, the sizes and the depth hypothesis of 7.10a and the
length bound `L_th ≤ C_L·log x` of 7.10c, for every step `j`

`Σ_𝔭 ϱ(𝔭)e_𝔭η_j(𝔭) ≤ d^Z_j·(C + κ_W)·x^ε·B₀`.

For every level `(P, χ_P)` the same holds with `η^P_j`, `d^{Z,P}_j`. *The form of the formal proof.* At the base level,
`Σ_𝔭 ϱ(𝔭)e_𝔭η^{P_0}_j(𝔭) ≤ D_0·(C + κ_W)·x^ε·B₀`, the form that GluedTargetAndDivisionInequality consumes (Downstream
consumers); the bound that [FormalProof] states at the base level is recorded in the route.

UniformWildKernelBounds §7.6 (stated for `0 < ε ≤ 2`), applied with its parameter `κ` equal to `max(1, C_t)` (it asks `κ ≥ 1`), supplies the wild-kernel budget `κ_W = 1` on its windows, for
the host fields `E_n(χ, {q, q′})` with `q ≡ 3 (mod 8)`, `q′ ≡ 7 (mod 16)`,
every layer `n ≥ 2` with `2^n ≤ x^α` at each scale, and `t ≤ x^{C_t} ≤ x^κ` (the sum `V(E, t)` is monotone in `t`, and `exp(x^ε) = b ≤ B₀`).

*Route.* 7.10c, with `f·m·b·L² = x^ε·B₀` and `V(E, t) ≤ κ_W·x^ε·B₀`. In [FormalProof] the bound of 7.10c carries the further
nonnegative term `(log x)²·N_c` in the bracket, and its bound reads
`Σ_𝔭 ϱ(𝔭)e_𝔭η^{P_0}_j(𝔭) ≤ D_0·C·x^ε·(B₀ + N_c)` under `V(E, t) ≤ b`, for the base-level lengths (`N_c` the budget of
ThetaChainsOnDefiniteUnitaryGroups §2.1, `(log x)² ≤ x^ε`); that term is added only in its
last step, so 7.10c without it is proved there, and the form above follows from it.

The wild-kernel budget is the only input of this layer that bounds the groups `Ш¹(E, ℓ, e)`, which enter every row of
7.10a, at every prime, `2` included.

*Needs:* 7.10c; UniformWildKernelBounds §7.6.

### 7.15 The dual index of the projected lattice

*Origin:* adapted from Horesh and Karasik (2023), Proposition B.5, for the projection of `ℤⁿ` along the span of a
primitive sublattice, and for a lattice in a real inner-product space GeometryOfNumbersAndQuadraticArithmetic §0.2.5:
the dual of the orthogonal projection is the dual cut by the subspace; here (a)
for the lattices of forms over `𝒪_𝕃` with its conjugation and the class-set product; the bound (b), (c′) of the dual
index by the congruence length, the Weyl exponent and the integer `D_j`, by an elementary argument, is particular to
this proof, with the stabilisers bounded through Minkowski (1887) in (c). The bound for the positive part `ℐ^+_j(𝔭)` in
(b) is this roadmap's own formulation; [FormalProof] bounds the signed index `ℐ_j(𝔭)`.

*Method of the formal proof:* the bound is the general inequality for the dual of an orthogonally projected lattice (the
dual of the projection is the dual cut by the subspace, and the signed index is at most the length of the projection
over the cut lattice plus the dimension times the valuation of an integer that carries the cut lattice into the dual),
applied to the forms of a level with the class-set form of weights `(|P|·|Γ_𝒸|)^{−1}`, for which the integer is
`|P|·D_V·ℓ^𝔧` with `𝔧` the Weyl exponent.

*Definitions.* Fix a step `j` and a twisted place `𝔭 | ℓ` with tuple `ξ = ξ_𝔭`. Let
`𝒜_j` be the space of algebraic modular forms on the definite `U(V_j)` for `ξ` at the level of ThetaChainsOnDefiniteUnitaryGroups §2.9, with its
`𝕃`-structure and the class-set product of DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5a; `Z_j := V_good ⊂ 𝒜_j` the lifted
subspace (7.1), and `P_j` the orthogonal projector onto `Z_j`. Let `M ⊂ 𝒜_j` be the lattice of forms with values in the dual
Weyl lattice `∇(λ′_j)` of `𝒲_j` (the lattice of 7.1(1)) and `M′ ⊂ M` that of forms with values in the Weyl lattice
`Δ(λ′_j)` (ReductiveGroups Layer 10B; the two lattices are dual for the contravariant form normalised by
`⟨v_λ, v_λ⟩ = 1`). Duals of lattices in `Z_j` are taken in `Z_j`, lengths at `𝔭` over the localisation of `𝒪_𝕃`.

- the *dual index* `ℐ_j(𝔭) := [P_jM : (P_jM)^∨]_𝔭`, the signed local index (`[A : B]_𝔭 := length_𝔭(A/A ∩ B) − length_𝔭(B/A ∩ B)`),
  and its positive part `ℐ^+_j(𝔭) := length_𝔭(P_jM/(P_jM ∩ (P_jM)^∨)) ≥ ℐ_j(𝔭)`;
- the *Weyl exponent* `𝔧_j(𝔭) :=` the least `𝔧 ≥ 0` with `ℓ^𝔧·(M ∩ Z_j) ⊂ M′` after localisation at `𝔭` (an exponent of the
  rational prime `ℓ`);
- the *duality defect* `D_j :=` the least positive integer with `D_j · M′ ⊂ M^∨`.

*Theorem.* (a) `(P_jM)^∨ = M^∨ ∩ Z_j`. (b) With `e_𝔭 η_j(𝔭) = length_𝔭(P_jM / (M ∩ Z_j))` (7.1(1)) and `d^Z_j(𝔭) = dim Z_j`:

`ℐ_j(𝔭) ≤ ℐ^+_j(𝔭) ≤ e_𝔭 η_j(𝔭) + d^Z_j(𝔭) · e_𝔭 · ( 𝔧_j(𝔭) + v_ℓ(D_j) )`.

(c) `D_j` divides `D_V`, the least common multiple of the orders of the stabilisers of the classes of `U(V_j)` at the level
of ThetaChainsOnDefiniteUnitaryGroups §2.9; `D_V` divides the Minkowski number for `GL_{2f(r+t)}(ℚ)`.

(c′) *The part cut by a level.* Let `(P, χ_P)` be a level at the type primes (ThetaChainsOnDefiniteUnitaryGroups §2.9a), `e`
its idempotent in the action of `G₀` on `𝒜_j`, `𝒜_j^P := e·𝒜_j`, `M_P := M ∩ 𝒜_j^P`, `M′_P := M′ ∩ 𝒜_j^P` (intersections),
`Z_j^P := Z_j ∩ 𝒜_j^P`, and `pr` the orthogonal projector of `𝒜_j^P` onto `Z_j^P`. With duals in `Z_j^P` for the class-set
product divided by `|P|`, and `𝔧 ≥ 0` any integer with `ℓ^𝔧·(M ∩ Z_j^P) ⊂ M′` at `𝔭` (for instance `𝔧_j(𝔭)`):

`[pr M_P : (pr M_P)^∨]_𝔭 ≤ length_𝔭(pr M_P/(M ∩ Z_j^P)) + dim Z_j^P·e_𝔭·(𝔧 + v_ℓ(|P|·D_V))`;

for the class-set product itself the same holds with `v_ℓ(D_V)`. For `P = 1` this is (b) with (c). *Normalisation.* (b)
and (c) are stated for the class-set product itself, where any positive multiple of `D_j` serves and `D_V` is one; (c′)
for the product divided by `|P|`, where the integer is `|P|·D_V`, the factor `|P|` coming only from the division.
[FormalProof] states and uses (c′), at the base level `(P_0, χ_{P_0})`: there `dim Z_j^{P_0} = d^{Z,P_0}_j(𝔭) = D_0`, the
length is `e_𝔭η^{P_0}_j(𝔭)` (7.1 (4)), and `D_V` is formed for the tuple `ξ_𝔭`. Its statement has a further term
`e_𝔭·v_ℓ(s)` for an integer `s > 0` with `s·∇^∨ ⊂ Δ` and `s·Δ ⊂ ∇^∨` for the coefficient lattices; here `s = 1`, the
Weyl and dual Weyl lattices being dual. In sums over the twisted places it uses one integer divisible by `|P_0|·D_V` for
all steps and all tuples.

*Route.* (a) is HermitianFormsAndLattices §4.0a (b) for `R = 𝒪_𝕃`, `c = c_𝕃` and the class-set product. (b) is HermitianFormsAndLattices §4.0a (c) with the
ideal `𝔞 = D_j·ℓ^{𝔧_j(𝔭)}`: by the definitions `D_jℓ^{𝔧_j(𝔭)}(M ∩ Z_j) ⊂ D_jM′ ∩ Z_j ⊂ M^∨ ∩ Z_j` at `𝔭`, and
`v_𝔭(𝔞) = e_𝔭(𝔧_j(𝔭) + v_ℓ(D_j))`; the signed index is at most the positive part. (c) DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5a
(*perfect pairing*) for `U(V_j)` at the level `J` of ThetaChainsOnDefiniteUnitaryGroups §2.9 (with its characters, whose values are roots of unity, through the
level action allowed there), with the coefficient lattice `M_𝒪 := Δ(λ′_j) ⊗ 𝒪_𝕃`: its dual for the contravariant form
normalised by `⟨v_λ, v_λ⟩ = 1` is `∇(λ′_j) ⊗ 𝒪_𝕃` (ReductiveGroups Layer 10B, the perfect pairing of the Weyl and dual Weyl
lattices), so `S(J, M_𝒪) = M′`, `S(J, M_𝒪^∨) = M`, and the class-set pairing `Σ_𝒸|Γ_𝒸|^{−1}⟨f(𝒸), f′(𝒸)⟩` of `M` with `M′` takes
values in `N_J^{−1}𝒪_𝕃`, `N_J = D_V`: class by class the term is integral (the class lattices of `V_j` are self-dual, ThetaChainsOnDefiniteUnitaryGroups §2.2(d), so in
the coordinates of each class the Hermitian dual of `Δ(λ′_j) ⊗ 𝒪_𝕃` is `∇(λ′_j) ⊗ 𝒪_𝕃`), and only the weights `|Γ_𝒸|^{−1}` are lost. So
`D_V·M′ ⊂ M^∨`; the integers `D` with `D·M′ ⊂ M^∨` form an ideal of `ℤ` with generator `D_j`, hence `D_j | D_V`. The stabilisers
are finite subgroups of `U(V_j)(F) ⊂ GL_{2f(r+t)}(ℚ)`, whose orders divide the Minkowski number (HermitianFormsAndLattices
§5.2(c)). (These are the roles of ThetaChainsOnDefiniteUnitaryGroups §3.10 — one side `Δ`-valued, the other `∇`-valued — on the model group `U(V_j)`.)
(c′) On `𝒜_j^P` the divided product is `Σ_𝒸 (|P|·|Γ_𝒸|)^{−1}⟨f(𝒸), f′(𝒸)⟩`, so `|P|·D_V·M′_P ⊂ M_P^∨`; then (a) and (b) on
`𝒜_j^P` (HermitianFormsAndLattices §4.0a (b), (c)).

Consequently the dual index of the projected lattice is the congruence module plus a defect of self-duality: the
congruence lengths of 7.1, bounded in 7.10a–7.11 (for the whole lattice and for every level part, 7.1 (4)), control
the dual index up to the Weyl exponent (bounded by 7.16a (3)) and the valuation of the integer. The integer of (b)
depends on the tuple `ξ_𝔭`, hence on the place; if `N` is a positive integer divisible by the `D_V` of every step and of
every tuple that occurs (the Minkowski number of (c) is one), the weighted sum of `e_𝔭·v_ℓ(N)` over the places above `ℓ`
is `v_ℓ(N)·log ℓ`, because `Σ_{𝔭|ℓ} e_𝔭f_𝔭 = [𝕃:ℚ]` (Check (i) of 7.10c), and for the divided product of (c′) the same holds with `|P|·N`.

*Check.* `M = 𝒪²` with the standard form at a place above `ℓ = 2`, unramified, `Z` the diagonal line, `M′ = M`:
`PM = 𝒪 · (1,1)/2`, `M ∩ Z = 𝒪 · (1,1)`, so `e_𝔭η = 1`; `(PM)^∨ = 𝒪 · (1,1) = M^∨ ∩ Z`, and `ℐ = ℐ^+ = 1`: the bound is attained
with `𝔧 = 0`, `D = 1`. At odd `ℓ` both sides vanish. For `P_jM ⊊ (P_jM)^∨` the positive part vanishes while the signed index
is negative: the two notions differ; a covolume comparison charges the signed one, which (b) also bounds.

The signed index `ℐ_j(𝔭)`: [FormalProof],
`Formalism/HermitianLattices/StatementLat.lean` (`Formalism.HermitianLatticesTheory.jIdx`),
`Formalism/QuotientMetricDivisors/Statement.lean` (`Formalism.DivisionValues.jw`);
(a): [FormalProof],
`Formalism/QuotientMetricDivisors/ClassSumDualLe.lean` (`Formalism.DivisionValues.ProjDualLat`),
`Formalism/LocalToGlobal/Divisibility/LiftLatLemmas.lean` (`Formalism.L2.DIV.boundsIVAt_of`);
(b) for the signed index: follows from [FormalProof],
`Formalism/LocalToGlobal/Divisibility/LiftLatLemmas.lean` (`Formalism.L2.DIV.DefFam.jw_le`),
`Formalism/LocalToGlobal/Divisibility/TwistedPlaceEtaSumLeExtended.lean` (`Formalism.L2.DIV.lift_index_bound_extended`);
(c), `D_j | D_V`: follows from [FormalProof],
`Formalism/LocalToGlobal/Divisibility/LiftLatLemmas.lean` (`Formalism.L2.DIV.DefFam.jw_le`),
`Formalism/LocalToGlobal/Divisibility/LiftLat.lean` (`Formalism.L2.DIV.BlockDat.DG`),
`Formalism/LocalToGlobal/Divisibility/ClassSum.lean` (`Formalism.L2.DIV.CSD.Good`);
(c), `D_V` and the Minkowski number: follows from [FormalProof],
`Formalism/FlagUnipotentLattices/MemOfOrthogonalAnisotropic.lean` (`Formalism.HermitianLatticeCounting.S6.MinkowskiBound`),
`Formalism/LocalToGlobal/Divisibility/DivisibilityConstruction/RBDGam.lean` (`Formalism.L2.DIV.Cons.dGamSize_record`).
*Needs:* ThetaChainsOnDefiniteUnitaryGroups §2.2, ThetaChainsOnDefiniteUnitaryGroups §2.9a, 7.1; DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5a; HermitianFormsAndLattices §§4.0a, 5.2;
ReductiveGroups Layer 10B (Weyl and dual Weyl lattices, the integral contravariant form).

### 7.16 Weight elimination

*Origin:* particular to this proof: a bound `dp_τ(μ) ≤ i_W(ℓ, τ)` on the depth below `λ` of a linked weight `μ` when a
crystalline representation with Hodge–Tate weights up to about `ℓ²`, outside the Fontaine–Laffaille range, has a
reduction containing a block of `t` consecutive crystalline characters; nearest published results: Bhatt, Gee and Kisin
(2026), the reduction modulo `p` of crystalline representations with arbitrary Hodge–Tate weights, Bartlett (2020), for
Hodge–Tate weights differing by at most `p`, and Le, Le Hung and Levin (2019), weight elimination in generic small
weights.

*Method of the formal proof:* from the Wach lattice of a lattice in the crystalline representation, two block-triangular
matrices are extracted on each factor of the reduction: the first-order term of the operator of `Γ`, whose eigenvalues
are the residues of the weights, and the reduced Frobenius, whose diagonal entries and principal minors are divisible by
explicit powers of `X`; the carries of the rank-one subquotients satisfy `(ℓ − 1)·|carry| ≤ h`, are matched with the
residues of the weights through the linkage hypothesis, and their sum bounds the depth. The published weight elimination
uses Fontaine–Laffaille or Breuil–Kisin modules in a bounded range of weights, and the published result for all weights
uses Breuil–Kisin modules with `μ_p`-equivariance.

*Setting for 7.16, 7.16a.* Let `E` be a CM field with maximal totally real subfield
`F`, `ℓ` an odd prime unramified in `E`, `U(V)` a definite unitary group in `n_V` variables over `E` with `n_V + 1 < ℓ`, an open
compact level `U ⊂ U(V)(𝔸_{F,f})` prime to `ℓ`, and `λ = (λ_τ)_{τ∈Φ}` a dominant weight with shifted weights
`u_τ(a) := λ_τ(a) + n_V − 1 − a ∈ [0, h]`. `Δ(λ) ⊂ ∇(λ)` are the Weyl and dual Weyl lattices over `ℤ_ℓ` of the coefficient
module (ReductiveGroups Layer 10B), `Forms(L)` the algebraic forms of level `U` with values in `L`, and `ex(τ, ℓ)` the least
`e ≥ 0` with `ℓ^e∇(λ_τ) ⊂ Δ(λ_τ)` (IntegralWeylModulesOfGeneralLinearGroups §2.1). Fix integers `κ₀, j_τ, t, q_τ ≥ 0` with
`κ₀ + j_τ + t + q_τ = n_V` such that `λ_τ` is constant on the positions `κ₀ + j_τ ≤ a < κ₀ + j_τ + t` (the *block*; its shifted
weights are `bot_τ, …, bot_τ + t − 1`). Put `κ := ⌊h/(ℓ − 1)⌋`, assume `t + 2κ < ℓ`, and let
`mw(τ) := #{a outside the block : u_τ(a) ≡ y (mod ℓ) for some integer y ∈ [bot_τ − κ, bot_τ + t − 1 + κ]}`, and `mw′(τ)` the same
number at the embedding `τ∘σ_ℓ` (`σ_ℓ` the arithmetic Frobenius of the completion at the place of `τ`; with `u` replaced by
`h − u` if that embedding lies outside `Φ`): in the labelling of WachLatticesOverTheCyclotomicTower §6.4, if `τ = emb_{i−1}`
is the embedding whose weights are read on the factor `i`, then `τ∘σ_ℓ = emb_{i−2}` is that of the factor `i − 1`, the source of
the Frobenius map into the factor `i`; `i_W(ℓ, τ) := q_τ·h + (ℓ·mw′(τ) + mw(τ))·(t + 2κ)`, and for a weight `μ` the *depth*
`dp_τ(μ) := Σ_{a<κ₀+j_τ}(λ_τ(a) − μ_τ(a))`.

*Stabilisers* (HermitianFormsAndLattices §5.2 (e)). If `ℓ` is unramified in a number field `E` and `n + 1 < ℓ`, no element of
`GL_n(E)` has order `ℓ`; hence `ℓ` does not divide the order of any `Γ ∩ gUg^{−1}` (`Γ = U(V)(F) ⊂ GL_{n_V}(E)`,
`g ∈ U(V)(𝔸_{F,f})`). (An element of order `ℓ` has minimal polynomial dividing `(X − 1)Φ_ℓ`, of degree `≤ n < ℓ − 1`, and `Φ_ℓ`
is irreducible over `E` because `ℚ(ζ_ℓ)` is totally ramified at `ℓ`; a finite group of order divisible by `ℓ` has an element of
order `ℓ`, Cauchy.)

*Statement* (*weight elimination*). Let `μ` be dominant with `|μ_τ| = |λ_τ|`, `λ_τ(n_V − 1) ≤ μ_τ(a) ≤ λ_τ(0)` and
`{μ_τ(a) − a} = {λ_τ(a) − a}` as multisets modulo `ℓ` (as holds when `L(μ)` is a constituent of `∇(λ)/ℓ`, by the linkage
principle, IntegralWeylModulesOfGeneralLinearGroups §2.1 (d)). Suppose there is a continuous `r : G_E → GL_{n_V}(ℚ̄_ℓ)`,
crystalline above `ℓ` with Hodge–Tate weights `μ_τ(a) + n_V − 1 − a` at `τ` and `h −` these at `τ∘c`, residually
`ρ̄′ ⊕ χ̄_0 ⊕ ⋯ ⊕ χ̄_{t−1}` with `χ_s` crystalline characters of Hodge–Tate weight `bot_τ + s` at `τ` and `h − bot_τ − (t − 1) + s`
at `τ∘c`, for every `τ ∈ Φ` (at every embedding the weights of `χ_0, …, χ_{t−1}` are the block there, in increasing order, as
for `χ_s = χ_0·χ_cyc^{−s}`, the shape of the block of 7.5 (1)). Then `dp_τ(μ) ≤ i_W(ℓ, τ)` for every `τ`.

*Route.* The Wach lattices of a lattice in `r` and of the `χ_s` exist (PhiGammaModulesAndIwasawaCohomology §6.0), over
coefficients containing the images of the embeddings of `E_w(ζ_ℓ)`, `w` the place of `τ` (the setting of
WachLatticesOverTheCyclotomicTower §6.4); index their
factors by `i` as in WachLatticesOverTheCyclotomicTower §6.4, the factor `i` carrying the weights at `emb_{i−1}` (its Sen weights are the residues of these,
WachLatticesOverTheCyclotomicTower §6.5 (2)). In the reduction of the first the characters occur as rank-one subquotients, the line of `χ̄_s` in the factor `i`
being `X^{𝔠_s(i)}` times the reduced lattice of `χ_s` (the *carries*), with `(ℓ − 1)|𝔠_s(i)| ≤ h` (the carries of the rank-one
subquotients of a reduced Wach lattice, WachLatticesOverTheCyclotomicTower §6.11 (1), (3)); for `τ = emb_{i−1}` (WachLatticesOverTheCyclotomicTower §§6.4, 6.5,
6.11): (i) the first-order term of the operator of `Γ` on the reduction has eigenvalues `−c̄·(weights of μ at τ)` and is
block triangular with the entries `−c̄·(bot_τ + s − 𝔠_s(i))` at the characters, so the residues `bot_τ + s − 𝔠_s(i)` occur
among those of the weights of `μ` at `τ` (WachLatticesOverTheCyclotomicTower §6.11 (4)), hence, by the congruence hypothesis, of `λ`; (ii) the principal `t × t`
minor of the reduced Frobenius at the characters is `X` to the power `Σ_s(bot_τ + s + ℓ·𝔠_s(i − 1) − 𝔠_s(i))` and is divisible
by `X` to the sum of the `t` smallest weights of `μ` at `τ` (WachLatticesOverTheCyclotomicTower §6.11 (0), (2), (5); the factor `i − 1` carrying the weights at
`τ∘σ_ℓ`). The sum of the carries is bounded by matching multisets, not carry by carry: by (i) the multiset
`{bot_τ + s − 𝔠_s(i)}_s` is, modulo `ℓ`, a sub-multiset of the residues of the shifted weights of `λ`. The block residues
`bot_τ + s` are distinct modulo `ℓ` (`t < ℓ`); if `bot_τ + s − 𝔠_s(i)` is matched with the block residue `bot_τ + σ(s)`, then
`𝔠_s(i) = s − σ(s)` (both lie in `(−ℓ/2, ℓ/2)`, as `|𝔠_s(i)| ≤ κ` and `κ + t < ℓ`); the others, say `o` of them, are matched with
distinct shifted weights outside the block congruent to an integer within `κ` of the block, so `o ≤ mw`; the matched ones form two
subsets of size `t − o` of `{0, …, t − 1}`, whose sums differ by at most `o·t`; so `|Σ_s 𝔠_s(i)| ≤ o·(t + κ) ≤ mw·(t + 2κ)`, and the
same at `τ∘σ_ℓ` with `mw′`. (A single carry may be nonzero although its weight is a block residue: two carries can permute two
block residues.) Since `|μ| = |λ|` and the weights of `μ` are at most `h`, the deficit of the first `κ₀ + j_τ` entries is at most
`q_τh` plus these carries.

*Checks.* (i) If no weight of `λ` outside the block is congruent modulo `ℓ` to an integer within `κ` of the block, at `τ` and at
`τ∘σ_ℓ`, then `i_W = q_τh`: the entries above the block can only drop by what the `q_τ` entries below it can absorb.
(ii) The weights of the characters at `τ∘c` cannot be left free: for `E = ℚ(i)`, `ℓ = 19`, `n_V = 2`, `t = 1`, block last, `q_τ = 0`,
`h = 57`, `λ = (44, 0)`, `μ = (25, 19)` (shifted multisets `{45, 0}`, `{26, 19}`, equal modulo `19`; `κ = 3`, `mw = mw′ = 0`, so
`i_W = 0` while `dp_τ(μ) = 19`), with `α`, `β` the conjugate CM characters of weights `(1, 0)`, `(0, 1)` of a CM elliptic curve
with good reduction at `19`, `r = α^{26}β^{31} ⊕ α^{19}β^{38}` and `χ_0 = β^{39}` satisfy every hypothesis except the weight
`h − bot_τ = 57` of `χ_0` at `τ∘c` (it is `39`), and the conclusion fails.

Follows from [FormalProof],
`Formalism/PieriBlockIdeals/Statement.lean` (`Formalism.CohomologicalDescent.mwCount`),
`Formalism/PieriBlockIdeals/MertensReciprocalElementary.lean` (`Formalism.CohomologicalDescent.LogSmallConstantBounds.SizeData₂.depth`),
`Formalism/PieriBlockIdeals/LatticeInclusionRealSettingAlt.lean` (`Formalism.CohomologicalDescent.ShortWeightBounds.DepthOfLink`);
the first half of the route, from the crystalline representation to the data of the Wach lattices: [FormalProof],
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/CrystallineLatticeLinkOfBlockDataStatement.lean` (`GlobalTheory.T.crystallineLatticeLink_of_blockData`), with
`Formalism/PieriBlockIdeals/LatticeInclusionRealSettingAlt.lean` (`Formalism.CohomologicalDescent.ShortWeightBounds.LatticeLink`).
*Needs:* PhiGammaModulesAndIwasawaCohomology §6.0 and WachLatticesOverTheCyclotomicTower
§§6.4, 6.5, 6.11 (0)–(5); IntegralWeylModulesOfGeneralLinearGroups §2.1 (a), (d) (the exponent `ex(λ, ℓ)`; the linkage principle in
multiset form, for a product over the embeddings); HermitianFormsAndLattices §5.2 (e); ReductiveGroups Layer 10B.

### 7.16a Hecke localisation and the Weyl exponent

*Origin:* particular to this proof: a Hida-type inclusion with an explicit power of `ℓ` that carries the forms with
values in the dual Weyl lattice into the forms with values in the Weyl lattice after localisation at a maximal ideal not
assumed ordinary, with the sum of these exponents over all primes, the summation being elementary; nearest published
result: Emerton, Gee and Herzig (2013), §7.4 and Lemma 4.5.1, the dévissage of Serre weights through the reduction of a
coefficient lattice, after Ash and Stevens (1986).

*Method of the formal proof:* the lattices are exchanged one embedding at a time, from the dual Weyl lattice to the Weyl
lattice through the intermediate lattice `D + ℓ^c·D′`; weight projectors and a graded Pieri bound show that every simple
step of this exchange has depth above the weight-elimination bound, so that the forms with values in it vanish after
localisation, and the exponents are then evaluated at the parameters of the chain and summed over the primes with
elementary forms of the theorems of Chebyshev and Mertens. Where the published dévissage only lists the weights that can
occur at the maximal ideal, here it is turned into an inclusion of lattices with an explicit exponent.

In the setting of 7.16 (with `h` an integer), for an embedding `τ` and an
integer `i ≥ 0` let `∇(λ_τ)^{≤i}` be the sum of the weight spaces of `∇(λ_τ)` of the weights `μ_τ` with `dp_τ(μ) ≤ i`; the *graded
Pieri bound with exponent `c`* at `(τ, i)` is the inclusion `ℓ^c·∇(λ_τ)^{≤i} ⊂ Δ(λ_τ)`.

*The exponent.* Suppose that the first `κ₀` shifted weights of `λ_τ` (the *cloud*) lie in a window `[x_m(τ), x_p(τ)]` of integers
and all others lie below `x_m(τ)`; put `top_τ := bot_τ + t − 1`. For a prime `ℓ`:

- `ι_ℓ(τ) := 1` if some integer `y ∈ [x_m(τ), x_p(τ)]` has `y ≡ top_τ (mod ℓ)`, and `ι_ℓ(τ) := 0` otherwise;
- `d_ℓ(τ)` := the least integer `d ≥ 1` with `d ≡ x_m(τ) − top_τ (mod ℓ)`;
- `D_ℓ(τ, i) := min(κ₀, t, i/d_ℓ(τ))` if `d_ℓ(τ) < x_m(τ) − top_τ`, and `D_ℓ(τ, i) := 0` otherwise;
- `H_ℓ(i) := (i/ℓ)(1 + log(h/ℓ))` if `ℓ ≤ h`, and `H_ℓ(i) := 0` if `ℓ > h`;
- `c_W(τ, ℓ, i) := (q_τ + 2j_τ)(h − 1)/(ℓ − 1) + ex_cl(τ, ℓ) + κ₀·((x_p(τ) − x_m(τ))/ℓ + ι_ℓ(τ)) + D_ℓ(τ, i) + H_ℓ(i)`, with
  `ex_cl(τ, ℓ)` the exponent `ex` of the weight `(λ_τ(0), …, λ_τ(κ₀ − 1))` of `GL_{κ₀}`.

1. *The bound at the block.* If `h < ℓ²`, the graded Pieri bound holds at `(τ, i)` with exponent `⌊c_W(τ, ℓ, i)⌋`, for every
   `i ≥ 0`.
2. *Hida-type inclusion.* Suppose moreover that `E/F` is unramified at every finite place and that `V` is the standard
   Hermitian space `E^{n_V}`, definite at every infinite place (the setting of BaseChangeAndGaloisRepresentationsForUnitaryGroups
   §16.1). Let `𝔪` be a maximal ideal of the Hecke algebra acting on `Forms(∇(λ))` whose Galois representation
   (BaseChangeAndGaloisRepresentationsForUnitaryGroups §16.1) is residually `ρ̄′ ⊕ χ̄_0 ⊕ ⋯ ⊕ χ̄_{t−1}` as in 7.16, let `Φ′ ⊂ Φ`, and
   for `τ ∈ Φ′` let `c(τ) ≥ 0` be an integer such that the graded Pieri bound with exponent `c(τ)` holds at `(τ, i_W(ℓ, τ))`.
   Then `ℓ^𝔧·Forms(∇(λ))_𝔪 ⊂ Forms(Δ(λ))_𝔪` with `𝔧 = Σ_{τ∈Φ′} min(ex(τ, ℓ), c(τ)) + Σ_{τ∉Φ′} ex(τ, ℓ)`.
3. *At the parameters.* For the forms on `U(V_j)` at step `j` (the weights of RowTowerAndRallisIdentities §5.7, normalised as in 7.16 with
   `h := ⌊b + Sc + η_s + t + 1⌋`, the parameter of 7.16, not the number `h` of 7.8a–7.11; the level of ThetaChainsOnDefiniteUnitaryGroups §2.9; `M`, `M′` of 7.15;
   the windows of ThetaChainsOnDefiniteUnitaryGroups §2.3b; `κ₀ = k − 1`, `j_τ + q_τ = m`) put
   `ℓ_𝔧 := m·b·x^ε/(k·(m + t)·log(3(b + Sc + η_s + t + 1)))` and `k_max := ⌊2b/ℓ*⌋`, and let
   `Exc_𝔧` be the set of the primes `ℓ > ℓ_𝔧` dividing an integer of `[b − (t − 1)/2 − k_max, b + Sc + η_s + 1 + (t − 1)/2 + k_max]`
   (a set of its own: not the set `Exc` of 7.6); the primes `q`, `d`, `p_δ`, `p′_δ` are at most `ℓ_𝔧` under these size
   conditions (`q, d < ℓ*`, and `p_δ, p′_δ < X′` by ThetaChainsOnDefiniteUnitaryGroups §2.7 (b)); at a datum in which one of them
   exceeds `ℓ_𝔧` it is to be counted with `Exc_𝔧` (trivial exponent). Define `𝔧_j(ℓ) := Σ_τ ex(τ, ℓ)` if `ℓ ≤ ℓ_𝔧` or `ℓ ∈ Exc_𝔧`, and
   `𝔧_j(ℓ) := Σ_{τ∈Φ_th} min(ex(τ, ℓ), ⌊c_W(τ, ℓ, q_τ·h)⌋) + Σ_{τ∉Φ_th} ex(τ, ℓ)` otherwise, `Φ_th := cσ_d u₀𝒯` the thick places of
   `u₀` (FrobeniusRestrictedRieszSums §0.6). Under `Size(x, ε)`, `SizeN` (ThetaChainsOnDefiniteUnitaryGroups §2.1), `SizeSc` (ThetaChainsOnDefiniteUnitaryGroups §2.3b), `SizeSep` (ThetaChainsOnDefiniteUnitaryGroups §2.3c), `SizeG` (ThetaChainsOnDefiniteUnitaryGroups §2.7), `SizeT_u` (ThetaChainsOnDefiniteUnitaryGroups §2.8), (W7) and
   `x ≥ x₀(ε)`:
   (a) for every prime `ℓ` and every twisted `𝔭 | ℓ`: `ℓ^{𝔧_j(ℓ)}·(M ∩ V_good) ⊂ M′` after localisation at `𝔭`; hence
   `𝔧_j(𝔭) ≤ 𝔧_j(ℓ)` (7.15);
   (b) `Σ_ℓ 𝔧_j(ℓ)·log ℓ ≤ 30·|Φ_th|·m·b·x^{2ε} + 2·m·b ≤ 16·x^ε·B₀`, the sum over all primes (`|Φ_th| = |𝒯| ≤ |A| = f/2`, FrobeniusRestrictedRieszSums §0.4,
   FrobeniusRestrictedRieszSums §0.6; `B₀` of ThetaChainsOnDefiniteUnitaryGroups §2.1);
   (c) for `ℓ > ℓ_𝔧`, `ℓ ∉ Exc_𝔧`: `mw(τ) = mw′(τ) = 0` and `i_W(ℓ, τ) = q_τ·h` at every `τ`; and `𝔧_j(ℓ) = 0` for every `ℓ > h`.

*Remark.* (2) without the hypothesis on `E/F` and `V`, for every definite unitary group of the setting of 7.16, is not a
statement of this section: its route needs the Galois representations of the
forms on such a group, which BaseChangeAndGaloisRepresentationsForUnitaryGroups §16.1 has outside the setting of (2)
only in its remark.
(3) is within that setting: `E/F` is unramified at every finite place and `V_j = E^{r+t}` has the standard positive form
(ThetaChainsOnDefiniteUnitaryGroups, introduction of Layer 2, and §2.2).

*Route.* (1) IntegralWeylModulesOfGeneralLinearGroups §2.2 (c). (2) Work one embedding `a` at a time. Let `D ⊂ D′` be the tensor
lattices with `Δ(λ_a)`, resp. `∇(λ_a)`, at `a` (and the lattices already chosen at the other embeddings), and
`E := D + ℓ^{c(a)}D′`; they are stable under the algebra generated by the group and the weight projectors of every factor. A
form `f` with values in `D′` gives `ℓ^{c(a)}f` with values in `E`. Refine `D ⊂ E` to a composition series; a simple step `F ⊂ F′`
has as quotient a simple subquotient of `∇(λ)/ℓ`, which embeds into some `∇(μ)/ℓ` compatibly with the group and the weight
projectors (IntegralWeylModulesOfGeneralLinearGroups §2.1 (e)), so `μ` is linked to `λ` (IntegralWeylModulesOfGeneralLinearGroups §2.1 (d)). If `dp_a(μ) ≤ i_W`, the
projector of the weight `μ_a` maps `F′` into `F` (on `D` trivially, on `ℓ^{c(a)}D′` by the graded Pieri bound), while it does
not kill the quotient: so `dp_a(μ) > i_W`. A Hecke eigensystem of the forms with values in `F′/F` at `𝔪` would lift to
characteristic zero in weight `μ` (Deligne–Serre, AlgebraicModularFormsAndSerreWeights §5.10, for the Hecke operators on the
finite free `Forms(∇(μ))`; the forms functor is exact at a level whose stabilisers have order prime to `ℓ`, 7.16
*Stabilisers* and AutomorphicFormsOnReductiveGroups §7.5, of which PotentialAutomorphyInfrastructurePartII §3.4 (1) is a special
case), with a Galois representation as in 7.16 (BaseChangeAndGaloisRepresentationsForUnitaryGroups §16.1, the weight symmetry BaseChangeAndGaloisRepresentationsForUnitaryGroups §15.2), contradicting 7.16; so those forms
vanish at `𝔪`, and a Hecke operator outside `𝔪` moves the form into `F`. Descending the series, a multiple of `ℓ^{c(a)}f` by a
Hecke operator outside `𝔪` takes values in `D`. The trivial exponent `ex(a, ℓ)` gives the same directly; the exponents add over
the embeddings (ThetaChainsOnDefiniteUnitaryGroups §2.1 (a)). (3a) Below `ℓ_𝔧` and at `Exc_𝔧` the trivial exponent. For `ℓ > h` every `ex(τ, ℓ)` vanishes (ThetaChainsOnDefiniteUnitaryGroups §2.1 (c): the
shifted weights lie in an interval shorter than `ℓ`). For `ℓ_𝔧 < ℓ ≤ h` outside `Exc_𝔧`: the primes dividing `f_E` (among them
`q` and `d`) are `< ℓ*` (ThetaChainsOnDefiniteUnitaryGroups §2.3c) and the auxiliary primes `p_δ`, `p′_δ` are `< X′` (`SizeN`, ThetaChainsOnDefiniteUnitaryGroups §2.7), all `≤ ℓ_𝔧`, so no special
prime of the twisting datum lies in this range; the type and level primes are `> h` (`SizeG`, `SizeT_u`); so `ℓ` is unramified in
`E`, the level of ThetaChainsOnDefiniteUnitaryGroups §2.9 is hyperspecial at `ℓ`, and the stabilisers have order prime to `ℓ` (7.16 *Stabilisers*, as `n_V + 1 < ℓ`).
Moreover `h < ℓ²`, `t + 2κ < ℓ` and `n_V + 1 < ℓ` (as `ℓ_𝔧² > 3b` and `ℓ_𝔧 ≥ x^εℓ*`), so (1) and (2) apply with `Φ′ = Φ_th` at the
maximal ideals meeting `V_good` (7.5(1); the weights of RowTowerAndRallisIdentities §5.7 in the windows of ThetaChainsOnDefiniteUnitaryGroups §2.3b). The vanishing of `mw`, `mw′`: a shifted
weight `u` outside the block and an integer `y` within `κ` of the block differ by an integer of the window defining `Exc_𝔧`
(cloud at a thick place), by a positive integer `< 3b′ < ℓ` (cloud at a top or thin place), or by a nonzero integer of absolute
value `< η_s + t + κ < ℓ` (the lows, by (W7)); the same at the Frobenius-twisted embedding, with the reflected shape. (3b) Split
the primes at `ℓ_𝔧`. *Places that are not thick:* the shifted weights lie in an interval of length `≤ 2b′`, so `ex(τ, ℓ) = 0` for
`ℓ > 2b′` and `ex(τ, ℓ) ≤ C(n_V, 2)·⌊log_ℓ(2b′)⌋` (ThetaChainsOnDefiniteUnitaryGroups §2.1 (c)), whence `Σ_ℓ ex(τ, ℓ)·log ℓ ≤ C(n_V, 2)·ψ(2b′) ≤ 2n_V²·b′` (Chebyshev).
*Thick places, `ℓ ≤ ℓ_𝔧`:* cutting at the cloud (ThetaChainsOnDefiniteUnitaryGroups §2.1 (b)), `ex(τ, ℓ)·log ℓ ≤ k(m + t)log(3h) + k²log(Sc + k)` for `ℓ ≥ 2η_s + t`
and `≤ C(n_V, 2)·log h` always; both are `≤ 2mbx^ε/ℓ` for `ℓ ≤ ℓ_𝔧` (the threshold is chosen for this:
`2mbx^ε/ℓ_𝔧 ≥ 2k(m + t)log(3h)`), and `Σ_{ℓ≤ℓ_𝔧} 1/ℓ ≤ log ℓ_𝔧 ≤ x^ε`: at most `2mbx^{2ε}`. *Thick places, `ℓ_𝔧 < ℓ ≤ h` outside
`Exc_𝔧`:* `ex_cl = 0` (as `ℓ > Sc + k`) and `i_W = q_τh`; the terms of `c_W` are summed separately: `Σ log ℓ/(ℓ − 1)`,
`Σ log ℓ/ℓ ≤ log(3b) + log 4` and `Σ_{ℓ ≤ 3b} log ℓ ≤ 3b·log 4` (Mertens and Chebyshev in elementary form);
`Σ_ℓ ι_ℓ(τ)·log ℓ ≤ (Sc + 1)·log h`, because an integer `y − top_τ ∈ (0, h]`, `h < ℓ_𝔧²`, has at most one prime factor above
`ℓ_𝔧`, so the primes with `ι_ℓ = 1` inject into the window; `Σ_ℓ D_ℓ(τ, q_τh)·log ℓ ≤ q_τh(1 + log h)·log h`, because `ℓ` divides
`x_m − top_τ − d_ℓ ∈ (0, h]` when `D_ℓ ≠ 0`, so `ℓ ↦ d_ℓ` is injective and `Σ_d q_τh/d ≤ q_τh(1 + log h)`; and
`Σ_ℓ (q_τh/ℓ)(1 + log(h/ℓ))·log ℓ ≤ q_τh(1 + log h)(log(3b) + log 4)`. With `q_τ + 2j_τ ≤ 2m` and `h ≤ 2b` the six sums
over the primes `ℓ_𝔧 < ℓ ≤ h` outside `Exc_𝔧` are together
`≤ 18mbx^{2ε} + 2k(Sc + 1)(x^ε + 2)` per thick place. *The primes of `Exc_𝔧`:* at most `Sc + η_s + t + 2k_max + 1` (each integer of
the window is positive and `< ℓ_𝔧²`), each costing `≤ f·n_V²·x^ε`. The parameter inequalities used are `log(3h) ≤ 2x^ε`,
`b/(4kt) ≤ ℓ_𝔧 ≤ b`, `3b < ℓ_𝔧²`, `x^εℓ* ≤ ℓ_𝔧`, and for `ℓ > ℓ_𝔧`: `ℓ − 1 ≥ ℓ*`, `κ ≤ 2b/ℓ*`, `t + 2κ`, `η_s + t + κ`, `n_V + 1`,
`Sc + k < ℓ` and `h + n_V < ℓ²`, from the two inequalities of `SizeSep`, `48k²t² < b`, `t³fk³η_s ≤ b` and
`k(m + t)log(3h) ≤ D_*`; under the size conditions the three lower-order terms are together `≤ 4b ≤ 2mb`. Summing over the
places gives (b), and (c) is (3a).

*Check.* If `ℓ > ⟨λ_τ + ρ, α^∨⟩` for every root `α` and every `τ`, then `∇(λ_τ) = Δ(λ_τ)`, `ex(τ, ℓ) = 0` and `𝔧 = 0`. The route
bounds each thick place separately, by `20·m·b·x^{2ε} + 2k(Sc + 1)(x^ε + 2)` (`2mbx^{2ε}` from the primes `≤ ℓ_𝔧`,
`18mbx^{2ε} + 2k(Sc + 1)(x^ε + 2)` from those above; statement (b) has `30` in place of `20`); no lower bound for `ex(τ, ℓ)` is asserted.

(2): follows from [FormalProof],
`Formalism/PieriBlockIdeals/BlockIdealBound5Derived.lean` (`Formalism.CohomologicalDescent.DepthNonnegative.TheoremWCore`),
`Formalism/PieriBlockIdeals/LatticeInclusionRealSettingAlt.lean` (`Formalism.CohomologicalDescent.ShortWeightBounds.InclWReal`);
(2), the Hida-type inclusion from the simple subquotients of `∇(λ)` modulo `ℓ`: [FormalProof],
`Formalism/PieriBlockIdeals/PieriColumnMinors/DepthNonnegative.lean` (`Formalism.CohomologicalDescent.DepthNonnegative.theorem_w_top_of_simple_quotients`);
(2), the step of the route from a Hecke eigensystem at `𝔪` to a lift in weight `μ` with a Galois representation as in 7.16:
[FormalProof], `Development/AbelianVarietyTheory/Proofs/DivisorProofs/ModelStatementOfFrameGalois.lean` (`GlobalTheory.ExpModel.winputs_frame`),
which uses Chebotarev's theorem for primes of degree one;
(3): follows from [FormalProof],
`Formalism/PieriBlockIdeals/MertensReciprocalElementary.lean` (`Formalism.CohomologicalDescent.LogSmallConstantBounds.Par.lJ`),
`Formalism/PieriBlockIdeals/LatticeInclusionRealSettingAlt.lean` (`Formalism.CohomologicalDescent.ShortWeightBounds.Wts.Jrec7`);
(3), the inequalities of the route: [FormalProof],
`Formalism/PieriBlockIdeals/PieriColumnMinors/ParameterBounds.lean` (`Formalism.CohomologicalDescent.LogSmallConstantBounds.paramsLJ_holds`),
`Formalism/PieriBlockIdeals/PieriColumnMinors/ParameterBounds.lean` (`Formalism.CohomologicalDescent.LogSmallConstantBounds.paramsLargePrime_holds`),
`Formalism/PieriBlockIdeals/PieriColumnMinors/ParameterBounds.lean` (`Formalism.CohomologicalDescent.LogSmallConstantBounds.noWindowResidue_holds`),
`Formalism/PieriBlockIdeals/PieriColumnMinors/ParameterBounds.lean` (`Formalism.CohomologicalDescent.LogSmallConstantBounds.thickTerm_holds`),
`Formalism/PieriBlockIdeals/PieriColumnMinors/ParameterBounds.lean` (`Formalism.CohomologicalDescent.LogSmallConstantBounds.largePrimeSumElementary_holds`).
*Needs:* FrobeniusRestrictedRieszSums §0.4, FrobeniusRestrictedRieszSums §0.6, ThetaChainsOnDefiniteUnitaryGroups §2.1, ThetaChainsOnDefiniteUnitaryGroups §2.3, ThetaChainsOnDefiniteUnitaryGroups §2.3b, ThetaChainsOnDefiniteUnitaryGroups §2.3c, ThetaChainsOnDefiniteUnitaryGroups §2.7, ThetaChainsOnDefiniteUnitaryGroups §2.8, ThetaChainsOnDefiniteUnitaryGroups §2.9, RowTowerAndRallisIdentities §5.7, 7.1, 7.5,
7.15, 7.16; BaseChangeAndGaloisRepresentationsForUnitaryGroups §§16.1 (the Galois representations of definite unitary groups), 15.2 (the weight symmetry);
IntegralWeylModulesOfGeneralLinearGroups §§2.1, 2.2; AutomorphicFormsOnReductiveGroups §§7.4, 7.5; AlgebraicModularFormsAndSerreWeights §5.10;
ReductiveGroups Layer 10B.

### Examples

For `𝕋 = M = {(a, b) ∈ O² : a ≡ b (mod ℓ^n)}` acting on itself with `Z_good` the first point, the congruence length is `η = n`,
and it is `0` when `M = (M ∩ V_good) ⊕ (M ∩ V_good^c)` (7.1). For `ℓ = 3`, `t = 3` and `s₀ = 1` the element `E` of 7.7a has
`v_δ = 2`, and the generator choice of `g` fails because `1 − χ_cyc(g)^{−2}` vanishes modulo `3` (7.7a). In the unit case of
7.7b (`ℓ > t + 1` unramified in `E`, exact local conditions, `Sel(W) = 0`, every `Ш¹(E, ℓ, e) = 0`, `ℓ ∤ h_E`, `Q(ψ_𝔭) = ∅`) the
congruence ideal is `c(π) = O`. For `M = 𝒪²` with the standard form at an unramified place above `ℓ = 2` and `Z` the diagonal,
`e_𝔭η = 1` and `ℐ = ℐ^+ = 1`, so the bound of 7.15 (b) is attained. For `E = ℚ(i)`, `ℓ = 19`, `λ = (44, 0)`, `μ = (25, 19)` and
`r = α^{26}β^{31} ⊕ α^{19}β^{38}` from a CM elliptic curve, every hypothesis of 7.16 except the weight of `χ_0` at `τ∘c` holds
and `dp_τ(μ) = 19 > 0 = i_W`: that hypothesis cannot be dropped. The weights `ϱ(𝔭)e_𝔭` over the places above `ℓ` sum to
`log ℓ` (7.10c).

### Dependencies

ThetaChainsOnDefiniteUnitaryGroups §§2.1–2.9c, 3.1, 3.2 (the data of the chain, the levels and the twisting data);
RowTowerAndRallisIdentities §§5.3, 5.7, 5.9, 5.11 (good labels and the model lifts); FrobeniusRestrictedRieszSums
§§0.1–0.8b (hosts, letters and the thick set); HermitianFormsAndLattices §§4.0a, 5.2; FiniteReductiveGroups §§5.2–6.5;
BaseChangeAndGaloisRepresentationsForUnitaryGroups §§10.33c–10.35, 14.1–16.1;
ThetaKernelsForUnitaryDualPairs §§3.3b, 3.21a, 3.46; DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5a;
IntegralWeylModulesOfGeneralLinearGroups §§2.1, 2.2; WachLatticesOverTheCyclotomicTower §§6.4–6.11;
SelmerLengthBoundsAndLocalLifting §§3.22–4.10g; LengthBoundsInPadicFamilies §§1.7a–1.8e;
BernoulliBoundsForClassGroupEigenspaces §6.17; HeckeIdealsAndTaylorWilesRelations §10.1; UniformWildKernelBounds §7.6;
and on main SelmerIwasawaCohomology §§4.9, 4.10, PadicFamilies §1.7 (and §1.7a, named in the Origin of 7.1),
PadicHodgeRegulators §1.5 (named in the *Corollary of:* line of 7.7d), GeometryOfNumbersAndQuadraticArithmetic §0.2.5
(named in the Origin of 7.15), PhiGammaModulesAndIwasawaCohomology §6.0,
IntegralHeckeAndGaloisDeterminants §§1.3, 4.1, 5.1, AutomorphicGaloisRepresentationsPartII AG2.0–AG2.6,
EndoscopicTransferAndUnitaryTraceComparison §§6.29, 13.1, 13.4, AutomorphicLFunctionsAndLocalFactors AL.3.3.8, AL.3.7.2,
SmoothRepresentationsOfLocalGroups SR.2.2–SR.4.3, MetaplecticAutomorphicForms §§3.14, 6.2, 6.3, 6.6, 6.10–6.12, 6.15,
AutomorphicFormsOnReductiveGroups §§7.4, 7.5, ReductiveGroups Layer 10B, ArithmeticGaloisDuality R02.2.3, R02.3.0d,
ClassFieldTheory §§5.1, 7.1, 8.1, 13.1, ArithmeticGaloisRepresentations §§1.8, 5.1, 5.3, 5.10,
AlgebraicModularFormsAndSerreWeights §5.10, AnalyticNumberTheoryPartI §0.11, ArithmeticStatisticsPartIII §2.1 and
Chebotarev (Completed) Layer 10; Tau Ceti `TauCeti.alternatingGroup_le_of_isPreprimitive_of_isCycle_mem` (Jordan's theorem) and
`ContRepresentation.schur_orthogonality_self` (Schur orthogonality).

## Downstream consumers

GluedTargetAndDivisionInequality consumes the congruence lengths and their bounds at the base level (7.1 (4), 7.10a–7.11),
the dual index of the projected lattice at the base level (7.15 (c′)) and the Weyl exponent at the parameters (7.16a (3)): at each place `𝔭` the period is divisible by
the accumulated gain for the tuple `ξ_𝔭` used there, the target lattice is glued place by place from the images of the
integral forms of those tuples, and the divided source lattice pairs integrally with its dual (GluedTargetAndDivisionInequality §§7.12–7.14, through
which the hypotheses of RowTowerAndRallisIdentities §5.8 enter); its theta conditions are polynomial conditions in the
sense of 7.8 (2). ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties consumes 7.8 (2) in its §8.19d.

ThetaChainsAndFrobeniusPrimeSums consumes 7.6, 7.8 (3), 7.10a, 7.10c, 7.11, 7.15 and 7.16a (3). ThetaChainsAndFrobeniusPrimeSums §10.0 states the conditions on
chain data (among them `HostSplitting E` and the inert-free bound of (H2), and the conditions (T1), (T2) of
ThetaChainsOnDefiniteUnitaryGroups §2.5 and (T3) of GluedTargetAndDivisionInequality §8.20 on the twisting datum in (D4)),
ThetaChainsAndFrobeniusPrimeSums §10.6 fixes the order of the quantifiers, the layer exponent `A_n = 2 + 8ε`, the length of the thick set and the other
parameters at which these targets are applied, and ThetaChainsAndFrobeniusPrimeSums §§10.7 (b), 10.9 (c), (d) verify on the construction that the
twisting datum is good and that the host has a wild-kernel budget, the latter from UniformWildKernelBounds §7.6.

## Scope and ownership

This sub-roadmap of [RiemannHypothesisForDirichletLFunctions](../README.md) is independently definitive.

This roadmap owns the statements of its Layer 7 above: the congruence lengths of a step of a chain of theta lifts and
their cuts by the type and by a label tuple (7.1); the Hecke–Galois families on the definite groups of the chain, the
lifted eigensystems, the nonvanishing of the descent and the filling of the eigenspaces (7.4–7.5b); the residual
irreducibility of good forms (7.9); the local condition at `ℓ` (7.6); the hypotheses and the instances of the Ribet-type
bound with local defects for the lifts (7.7a–7.7d); twist selection for the lifts (7.8); the character bound at the rows
(7.8a); the congruence bound by rows, at the type primes, in total and under a wild-kernel budget (7.10a–7.11); the dual index
of the projected lattice (7.15); weight elimination and the Hida-type inclusion at the parameters of the chain (7.16, 7.16a).

Not owned here. The data of the chain (ranks, sizes, weights and words, characters, twisting data, coefficient field, type
and auxiliary primes, levels) are ThetaChainsOnDefiniteUnitaryGroups Layers 2–3; good labels and the model lifts are
RowTowerAndRallisIdentities Layer 5; hosts, letters and thick sets are FrobeniusRestrictedRieszSums Layer 0. Congruence
modules at one point and along an idempotent, and the Ribet-type bounds with local conditions and local defects, are
[PadicFamilies](../../PadicFamilies/README.md) §1.7 and [LengthBoundsInPadicFamilies](../LengthBoundsInPadicFamilies/README.md)
§§1.7a–1.8e; Hida's module of congruences of a Hecke algebra along a decomposition is PadicFamilies §1.7a. The dimension
formula of Bloch and Kato, of which the dimension bounds of 7.7d are a corollary, is
[PadicHodgeRegulators](../../PadicHodgeRegulators/README.md) §1.5, and the dual of the orthogonal projection of a lattice
in a real inner-product space is [GeometryOfNumbersAndQuadraticArithmetic](../../GeometryOfNumbersAndQuadraticArithmetic/README.md)
§0.2.5. Selmer presentations, twist selection, the Bloch–Kato condition, the bound for classes cut out by a character
and the local lifting theorems with loss are [SelmerIwasawaCohomology](../../SelmerIwasawaCohomology/README.md) §§4.9, 4.10
and [SelmerLengthBoundsAndLocalLifting](../SelmerLengthBoundsAndLocalLifting/README.md) Layers 3–4. Wach lattices, their
reductions and position data are [PhiGammaModulesAndIwasawaCohomology](../../PhiGammaModulesAndIwasawaCohomology/README.md)
§6.0 and [WachLatticesOverTheCyclotomicTower](../WachLatticesOverTheCyclotomicTower/README.md) Layer 6. The Galois
representations of definite unitary groups and their local–global comparisons are
[AutomorphicGaloisRepresentationsPartII](../../AutomorphicGaloisRepresentationsPartII/README.md) and
[BaseChangeAndGaloisRepresentationsForUnitaryGroups](../BaseChangeAndGaloisRepresentationsForUnitaryGroups/README.md)
Layers 10 and 14–16. The twisted Tate–Shafarevich groups are
[BernoulliBoundsForClassGroupEigenspaces](../BernoulliBoundsForClassGroupEigenspaces/README.md) §6.17 and their uniform
bound on windows [UniformWildKernelBounds](../UniformWildKernelBounds/README.md) §7.6. The integral Weyl modules of `GL_N`
are [IntegralWeylModulesOfGeneralLinearGroups](../IntegralWeylModulesOfGeneralLinearGroups/README.md) Layer 2; Hermitian
lattices and their stabilisers are [HermitianFormsAndLattices](../HermitianFormsAndLattices/README.md) §§4.0a, 5.2;
depth-zero representations and labels are [FiniteReductiveGroups](../FiniteReductiveGroups/README.md) Layers 5–6.

In this family, GluedTargetAndDivisionInequality, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties and
ThetaChainsAndFrobeniusPrimeSums use these targets (Downstream consumers above).

## Exact supplier contracts

### From ThetaChainsOnDefiniteUnitaryGroups, a sub-roadmap of this family

- §§2.1–2.9c: the data of the chain: ranks, scales and the size predicates (§2.1, with `Size(x, ε)`, `SizeA`, `SizeN`,
  `SizeInert`), the model spaces and their self-dual class lattices (§2.2, (d)), the normal form of the pairs (§2.2a), weights
  and words with their windows, cloud size, separation (W7), `SizeSc`, `SizeSep` and the thresholds `ℓ*`, `ℓ_A` (§§2.3–2.3c),
  the Hecke, splitting and auxiliary characters (§2.4, (b)), twisting data, twisted places and twist places (§2.5), the
  coefficient field (§2.6) and its enlargement (§2.6a (b)–(d), used in 7.8 (3)),
  the type and auxiliary primes with `𝔅(N, g)` and `SizeG` (§2.7), the level primes with `SizeT_u`
  (§2.8), the levels (§2.9), the type level, its tame labelled form and the base level `(P_0, χ_{P_0})` (§2.9a) and the
  parahoric levels at the twist places (§2.9c). Used throughout Layer 7.
- §3.1 (the polynomial model, `v_λ`, the lattices `Δ_ℤ ⊂ ∇_ℤ`), §3.2 (the normal form of a step). Used in the Conventions and 7.15.

### From RowTowerAndRallisIdentities, a sub-roadmap of this family

- §5.3 (good label tuples, the good idempotent and the good part `𝒞(W_j)^{good}`, goodness clause (iii)), §5.7 (the model lift
  `θ_j`, its level vector, its commutation with `G₀` and its injectivity on the parts, the coefficient representation `𝒲_j`),
  §5.9 (with the level parts), §5.11 (rationality of the Hecke operators and of the good idempotent). Used in 7.1, 7.4, 7.5,
  7.5a, 7.5b, 7.6, 7.8a, 7.9, 7.16a.

### From FrobeniusRestrictedRieszSums, a sub-roadmap of this family

- §§0.1–0.4 (hosts, Frobenius data, `SplitRamification d`, cyclic hosts and the dyadic host fields), §0.6 (places of letters,
  tops and thick places), §§0.8, 0.8a, 0.8b (the thick set, its length `L_th`, the cluster property and its Lemma (d)). Used in
  7.8a, 7.10a, 7.10c, 7.16a.

### From HermitianFormsAndLattices, a sub-roadmap of this family

- §4.0a (b), (c): projection–intersection duality and the dual-index bound. Used in 7.15.
- §5.2 (c) (Minkowski's bound for the stabilisers), (e) (no element of `GL_n(E)` has order `ℓ` when `ℓ` is unramified in `E`
  and `n + 1 < ℓ`). Used in 7.15, 7.16.

### From FiniteReductiveGroups, a sub-roadmap of this family

- §§5.2, 5.5 (cuspidal characters, Green's parametrisation), §5.7 (labels and series idempotents; a squarefree label carries one
  character, which is generic), §5.11 (Shintani descent for `GL_n`), §§6.1–6.4 (depth-zero representations, their
  parametrisation and labels), §6.5 (the local type statement), and the Conventions (the tame labelled form fixed by a
  generator of tame inertia). Used in 7.1, 7.4, 7.9, 7.10b.

### From BaseChangeAndGaloisRepresentationsForUnitaryGroups, a sub-roadmap of this family

- §§10.33c, 10.33d (matching of functions inflated from the residue field; labels of depth-zero representations under
  unramified base change of prime degree). Used in 7.9 (the tame labelled form).
- §10.34 (iii) in every rank and §10.35 (b)–(d) (explicit parameters of depth-zero supercuspidal representations and the
  correspondence up to twist). Used in 7.4, 7.9.
- §14.1 (the polarized away-prime comparison), §14.2 (its depth-zero case), §15.1 (the comparison at the coefficient prime for
  parameters induced from unramified extensions), §15.2 (weight symmetry), §16.1 (the Galois representations of definite
  unitary groups): consumed only as potential crystallinity, trivial monodromy and the restriction to inertia at the places
  listed in 7.4, and equality of parameters at the good places. Not used: purity or temperedness of `r_x`, irreducibility of
  `r_x`, compatibility at places with nonzero monodromy, compatible systems. Used in 7.4, 7.5, 7.9, 7.10b, 7.16, 7.16a.

### From ThetaKernelsForUnitaryDualPairs, a sub-roadmap of this family

- §3.21a (the unramified unitary theta correspondence). Used in 7.5.
- §3.3b (a) (the Weil representation of `(V, W′ ⊥ W″)` restricted to `U(V)` is the tensor product of those of `(V, W′)` and
  `(V, W″)`, for the product of the splitting characters), §3.46 (iii) (compact dual pairs with both members compact: the
  decomposition of the polynomial Fock space and the action on the vacuum). Used in 7.5a.

### From DiscreteSeriesCoefficientsAndAutomorphicMetrics, a sub-roadmap of this family

- §7.5a (class-set integration and the perfect pairing of lattices of forms). Used in 7.15.

### From IntegralWeylModulesOfGeneralLinearGroups, a sub-roadmap of this family

- §2.1 (a)–(e): the exponent `ex(λ, ℓ)` (zero beyond the lowest alcove), the linkage principle in product form over the
  embeddings, and the embedding of a simple constituent (e). Used in 7.16, 7.16a.
- §2.2 (c): the graded Pieri bound at a block, `ℓ^{⌊c_W⌋}·∇(λ)^{≤i} ⊂ Δ(λ)` for the sum `∇(λ)^{≤i}` of the weight spaces of depth `≤ i`.
  Used in 7.16a (1).

### From WachLatticesOverTheCyclotomicTower, a sub-roadmap of this family

- §6.4 (its setting, coefficients containing the images of the embeddings of `F(ζ_ℓ)`, and its labelling `HT_i` at
  `emb_{i−1}`), §6.5 (2), §6.9 (position data); §6.11 (rank-one subquotients of a reduced
  Wach lattice: the carries `c_s(i)`, the divisibility of the minors of the linearised Frobenius, and the bounds and
  congruences of the carries), clauses (0)–(5). Used in 7.6, 7.16.

### From SelmerLengthBoundsAndLocalLifting, a sub-roadmap of this family

- §§3.22 (Selmer data with (H1), (H2), (H5), (H6); `S`, `Q` disjoint from `S`; (1) the governing field), 3.24, 3.25, 3.25a ((1),
  (2), (3′), (4′): the determinant bound when `T̄ ≅ T̄ ⊗ χ̄_cyc^t`), 3.25b ((1), (2): one specialisation for polynomials of the
  first and of the second kind), 3.26 (polynomial conditions of the two kinds relative to a subgroup modulo which `z` is
  central, and twist selection). Used in 7.7b, 7.8.
- §§4.9a, 4.9b (the Bloch–Kato instance), 4.9c (the bound for the finite part of the classes cut out by a character, with the
  set of the distinct Hodge–Tate weights of `Y`), 4.9d (the invariants of a crystalline lattice modulo the lattice), 4.10a
  (the local condition in position), 4.10b (defect and colength), 4.10c (1) (generators of `H¹_f` of a lattice), 4.10c (3)
  (the basic lifting theorem with loss), 4.10d (2), (3) (i) (the cluster corollary and the theorem for alternating
  directions), 4.10e (0)–(3) (the lattices at level `s` and the ramified and tamely ramified variants), 4.10f (the tame-type
  variant), 4.10g (pushouts of finite classes under a lifting exponent). Used in 7.6, 7.7b, 7.7d, 7.8a, 7.10a, 7.10b.
- §4.10d (4): alternating words of comparable sizes: for `ℓ ≥ 11`, `K/ℚ_ℓ` unramified of even degree `n`, coefficients
  containing the embeddings of `K(μ_ℓ)`, a surjection `T₁ ↠ T₂` of lattices in crystalline representations whose weights at
  alternate letters lie in `[−η, η] ∪ [b_i, b_i + S]` resp. `[−η, η] ∪ [−b_i − S, −b_i]`, at most `m` weights of `T₂`, counted
  with multiplicity, in `[−η, η]` at every letter, and its two size conditions (which hold when every `b_i ∈ [b, b + η]`,
  `b ≥ 100`, `2η + S ≤ b/10`): with
  `H := max_i b_i + S + η` and `e′` the round exponent of §4.10c (3) for `T₁`, the cokernel on `H¹_f` has length at most
  `(n + 1)·rk T₂·e + 4n·m·e′ + (3/2)·n·(rk T₂·S + 2m·((H + 1)/(ℓ − 1) + 1))` times `length(O/ℓ)`, for an integer
  `e ≤ 32H/ℓ² + 4S + 10η/(ℓ − 1) + 25(1 + log_ℓ 2H)`. Used in 7.10a (row 4).

### From LengthBoundsInPadicFamilies, a sub-roadmap of this family

- §1.7a (congruence modules along an idempotent, the length bound (4) and its family form (4′), one endomorphism for each
  point). Used in 7.1.
- §1.8c ((P), (D), (N), (4) from the characteristic coefficients (that roadmap's own clause; its form of the formal proof gives
  (P) without variables from the determinants of the arrays `Σ_iX_ia_i`), (5) the splitting algebra of a polynomial with distinct
  roots), §1.8d (2′), (3), (3′) (the Ribet-type bound with local conditions and defects; (3) under `δ_A(π) ∈ O^×`; (3′) in the
  form of the formal proof, `δ_A(π)²` killing the coboundaries of a block), §1.8e (1)–(3)
  (the module with columns; rows from duality; (2) with no columns and arbitrary row defects, the bound with direct defects of
  7.7b (ii)) with (3a) (orthogonality from a dual family over a local Galois group), and §1.8e (4) (the element `E` built from
  one group element with a correction, under the hypotheses that the algebra separates the points and every fibre
  representation is a direct sum of pairwise non-isomorphic absolutely irreducible representations, which 7.7a verifies).
  §1.8e is applied to the family restricted to the points over the cut `X_s`, so that its module `Y` is the module `Y_s` of
  §1.8c, the cut module of 7.7a. Used in 7.1, 7.6, 7.7a, 7.7b, 7.7c, 7.10a, 7.10b.

### From BernoulliBoundsForClassGroupEigenspaces, a sub-roadmap of this family

- §6.17: `Ш¹(M, ℓ, e)`, `V(M, t)` for a number field `M`, finiteness. Used in the Conventions, 7.7b, 7.10c, 7.11.

### From HeckeIdealsAndTaylorWilesRelations, a sub-roadmap of this family

- §10.1 (the Tate–Shafarevich kernels with lattice and divisible coefficients). Used in 7.7b.

### From UniformWildKernelBounds, a sub-roadmap of this family

- §7.6: for primitive `χ`, `0 < ε ≤ 2` and `κ, α ≥ 1`: `J ≥ 1` and `X₀` (depending on `χ, ε, κ, α` only) such that for
  every `X ≥ X₀` and every pair of primes `q ≡ 3 mod 8`, `q′ ≡ 7 mod 16`, not dividing `f_χ`, `q, q′ > 2X^κ + 1 + P(χ)` and
  `log q + log q′ ≤ Y₀^{ε/4}` (`Y₀ = X^{1/J}`), there is `Y ∈ [Y₀, X^{1/2}]` such that for every `x ∈ [Y, Y²]` and every layer `n ≥ 2`
  with `2^n ≤ x^α`, with `E = E_n(χ, {q, q′})` the dyadic host field: every `Ш¹(E, ℓ, e)` (`ℓ` prime, `0 < e < ⌊x^κ⌋`) is finite and
  `V(E, ⌊x^κ⌋) ≤ exp(x^ε)`; the local condition is the one of the Conventions (classes unramified outside `ℓ`, trivial above
  `ℓ`). Used in 7.11.

### From TauCetiRoadmap.SelmerIwasawaCohomology

- §4.9 (Bloch–Kato's dimension formula for crystalline representations; the finite classes of `(K_O/O)(−e)`; the exact
  annihilators under local duality), §4.10 (the Fontaine–Laffaille comparison). Used in 7.6, 7.7b, 7.7d, 7.10b.

### From TauCetiRoadmap.PadicFamilies

- §1.7 (the congruence module of an augmentation, the one-point case of LengthBoundsInPadicFamilies §1.7a). Used in 7.1.
- §1.7a (congruence modules along a decomposition: for `A` finite and free over a discrete valuation ring and an
  idempotent `ξ` of `A[1/ϖ]`, Hida's module of congruences `(ξA ⊕ (1 − ξ)A)/A ≅ ξA/(A ∩ ξA[1/ϖ])`, with its split case
  for a set of eigensystems). Named in the Origin of 7.1.

### From TauCetiRoadmap.PadicHodgeRegulators

- §1.5 (dimensions of the Bloch–Kato subspaces: `dim H¹_f(K, V) = dim_{ℚ_p} D_dR(V)/Fil⁰ + dim H⁰(K, V)` for a de Rham
  representation `V` of the absolute Galois group of a finite extension `K` of `ℚ_p`). Named in the *Corollary of:* line
  of 7.7d.

### From TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic

- §0.2.5 (`dual_projection_comap`: for a `ℤ`-submodule `Δ` of a real inner-product space and the orthogonal projection
  `π` onto `W^⊥`, `(π(Δ))^* = Δ^* ∩ W^⊥`). Named in the Origin of 7.15.

### From TauCetiRoadmap.PhiGammaModulesAndIwasawaCohomology

- §6.0 (Wach lattices). Used in 7.16.

### From TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants

- §1.3 (Henselian lifting, generalized matrix algebras), §4.1 (uniqueness from Frobenius density), §5.1 (the determinant from a
  quantified Hecke comparison, used with `J = 0`). Used in 7.4, 7.7a.

### From TauCetiRoadmap.AutomorphicGaloisRepresentationsPartII

- AG2.0 (`ℓ`-adic characters of algebraic Hecke characters: local components away from `ℓ`, de Rham above `ℓ` with the
  Hodge–Tate numbers, and the explicit formula on the ideles, used at the places above `ℓ` in 7.5 (1)), AG2.5 *Unramifiedness
  and the good-prime polynomial*, AG2.6 *Polarized admissibility at the coefficient prime*. Used in 7.4, 7.5.

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

- §6.29 (cohomological weak base change for inner forms of unitary groups and its converse, Labesse), §§13.1, 13.4 (weak
  unitary base change and standard pairs; pure cohomological unitary transfer). Used in 7.4, 7.5.

### From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors

- AL.3.3.8 (Jacquet–Shalika bound), AL.3.7.2 (strong multiplicity one for isobaric sums). Used in 7.1, 7.4, 7.5, 7.5a, 7.5b.

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

- SR.2.2 (Jacquet functors, the geometric lemma), SR.2.3 (invariants and the Jacquet module), SR.3.2 (Bernstein
  decomposition), SR.4.3 (spherical representations of `GL_n`). Used in 7.4 (8).

### From TauCetiRoadmap.MetaplecticAutomorphicForms

- §3.14 (type-II theta input): for the oriented split pair `GL_m × GL_n`, the small theta lift of an irreducible smooth
  representation is zero or irreducible, and is injective on its nonzero domain; the section names the unequal-rank
  parameter formula of Mínguez as a further input. Used in 7.5 (1) at the split places, where the relation of the
  parameters is ThetaKernelsForUnitaryDualPairs §3.21a (iii).
- §6.2 (the Siegel–Weil section), §6.3 (the Ikeda map), §6.6 (the regularised second-term identity), §§6.10–6.11 (doubling),
  §6.10a (the standard doubling factors and the unramified denominators), §6.12 (the factorization of theta pairings), §6.15
  (the global see-saw). Used in 7.5a.

### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups

- §7.4 (algebraic modular forms in Gross's models), §7.5 (finite stabilisers, base change of the forms when the orders of the
  stabilisers are units, automorphic realization). Used in 7.1, 7.16a.

### From TauCetiRoadmap.AlgebraicModularFormsAndSerreWeights

- §5.10 (Deligne–Serre eigenvalue lifting for commuting endomorphisms of a finite free module over a DVR). Used in 7.16a.

### From TauCetiRoadmap.ReductiveGroups

- Layer 10B (Weyl and dual Weyl modules, the integral contravariant form). Used in 7.15, 7.16, 7.16a.

### From TauCetiRoadmap.ArithmeticGaloisDuality

- R02.2.3 (1) (`cor∘res` is multiplication by the index on `Hⁱ`). Used in 7.8a, 7.10a.
- R02.3.0d (finite Galois localisation and the Tate–Shafarevich kernels of a finite discrete Galois module). Used in 7.7b.

### From TauCetiRoadmap.ClassFieldTheory

- §5.1 (Tate duality, `H²(μ_n)` and the local invariant, the local Euler characteristic). Used in 7.7b, 7.8a, 7.9.
- §7.1 (the cyclotomic normalization of the local Artin map), §8.1 (the local class-field correspondence). Used in 7.7b.
- §13.1 (the Hilbert class field and its Galois group). Used in 7.7b.

### From TauCetiRoadmap.ArithmeticGaloisRepresentations

- §1.8 (Burnside's theorem over an algebraically closed field; Brauer–Nesbitt), §5.1 (density of Frobenius elements), §5.3
  (recognition on a dense subset), §5.10 (Carayol's lemma: strict conjugacy from equal traces or characteristic polynomials,
  without invertibility of the factorial of the dimension). Used in 7.4, 7.5, 7.7a, 7.8, 7.9.

### From TauCetiRoadmap.AnalyticNumberTheoryPartI

- §0.11 (Mertens's first theorem). Used in 7.10c.

### From TauCetiRoadmap.ArithmeticStatisticsPartIII

- §2.1 (Chebyshev bounds for prime sums). Used in 7.10c.

### From TauCetiRoadmap.Chebotarev

- Layer 10 (Chebotarev's density theorem). Used in 7.4, 7.5, 7.8, 7.9.

## References

- [FormalProof] Levent Alpöge, the Lean formalization of the Riemann hypothesis and of the Riemann hypothesis for Dirichlet L-functions announced in [Announcement]; source with a public verification setup: <https://github.com/leanprover-community/riemann-hypothesis>; the file paths and declaration names cited here are those of its first commit `40e56bab026552e089d7afcfeff08d2defb9c005`, the source as published, under its directory `src/`. This roadmap specifies its mathematics; it is the reference of every target whose origin is particular to this proof.
- [Announcement] Levent Alpöge, the announcement of that proof, 20 November 2026: <https://alpo.ge/remark.pdf>.
- K. Ribet, *A modular construction of unramified p-extensions of Q(μ_p)*, Invent. Math. 34 (1976); H. Hida, *Congruences of
  cusp forms and special values of their zeta functions*, Invent. Math. 63 (1981): 7.1, 7.7a–7.7d.
- J. Arthur and L. Clozel, *Simple algebras, base change, and the advanced theory of the trace formula* (1989);
  J.-P. Labesse, *Cohomologie, stabilisation et changement de base*, Astérisque 257 (1999); G. Chenevier and M. Harris,
  *Construction of automorphic Galois representations, II*, Cambridge J. Math. 1 (2013); A. Caraiani, *Local-global
  compatibility and the action of monodromy on nearby cycles*, Duke Math. J. 161 (2012); T. Barnet-Lamb, T. Gee, D. Geraghty
  and R. Taylor, *Potential automorphy and change of weight*, Ann. of Math. 179 (2014); A. Moy and G. Prasad, *Jacquet
  functors and unrefined minimal K-types*, Comment. Math. Helv. 71 (1996): 7.4.
- H. Jacquet and J. Shalika, *On Euler products and the classification of automorphic representations I*, Amer. J. Math. 103
  (1981): 7.4, 7.5.
- R. Howe, *Transcending classical invariant theory*, J. Amer. Math. Soc. 2 (1989); A. Mínguez, *Correspondance de Howe
  explicite: paires duales de type II*, Ann. Sci. École Norm. Sup. (4) 41 (2008), 717–741: 7.5.
- I. Piatetski-Shapiro and S. Rallis, *L-functions for the classical groups*, LNM 1254 (1987); S. Kudla and S. Rallis, *A
  regularized Siegel–Weil formula: the first term identity*, Ann. of Math. 140 (1994); A. Ichino, *A regularized Siegel–Weil
  formula for unitary groups*, Math. Z. 247 (2004); S. Yamana, *L-functions and theta correspondence for classical groups*,
  Invent. Math. 196 (2014); W. T. Gan, Y. Qiu and S. Takeda, *The regularized Siegel–Weil formula (the second term identity)
  and the Rallis inner product formula*, Invent. Math. 198 (2014), cited in the numbering of arXiv:1207.4709v3: 7.5a.
- C. Bushnell and P. Kutzko, *The admissible dual of GL(N) via compact open subgroups*, Ann. of Math. Stud. 129 (1993);
  G. Henniart, *Une preuve simple des conjectures de Langlands pour GL(n) sur un corps p-adique*, Invent. Math. 139 (2000);
  C. Bushnell and G. Henniart, *The essentially tame local Langlands correspondence, I*, J. Amer. Math. Soc. 18 (2005);
  T. Shintani, *Two remarks on irreducible characters of finite general linear groups*, J. Math. Soc. Japan 28 (1976):
  7.4, 7.9 (depth-zero types). C. Jordan, *Traité des substitutions et des équations algébriques* (1870): 7.9.
- J. Bellaïche and G. Chenevier, *Families of Galois representations and Selmer groups*, Astérisque 324 (2009);
  S. Donkin, *The blocks of a semisimple algebraic group*, J. Algebra 67 (1980);
  N. Wach, *Représentations p-adiques potentiellement cristallines*, Bull. Soc. Math. France 124 (1996); P. Colmez,
  *Représentations cristallines et représentations de hauteur finie*, J. reine angew. Math. 514 (1999); L. Berger, *Limites
  de représentations cristallines*, Compos. Math. 140 (2004); S. Bloch and K. Kato, *L-functions and Tamagawa numbers of
  motives*, The Grothendieck Festschrift I (1990); J.-M. Fontaine and G. Laffaille, *Construction de représentations
  p-adiques*, Ann. Sci. ÉNS 15 (1982): 7.6, 7.7a–7.7d, 7.16.
- R. Greenberg, *Iwasawa theory for p-adic representations*, Adv. Stud. Pure Math. 17 (1989); A. Wiles, *Modular elliptic
  curves and Fermat's Last Theorem*, Ann. of Math. 141 (1995); G. Poitou, *Cohomologie galoisienne des modules finis* (1967);
  J. Tate, *Duality theorems in Galois cohomology over number fields*, Proc. ICM Stockholm (1962); C.-H. Sah, *Cohomology of
  split group extensions*, J. Algebra 29 (1974): 7.8.
- B. Gross, *Algebraic modular forms*, Israel J. Math. 113 (1999); H. Minkowski, *Zur Theorie der positiven quadratischen
  Formen*, J. reine angew. Math. 101 (1887): 7.15. J. C. Jantzen, *Representations of algebraic groups*, 2nd ed. (2003), II: 7.15, 7.16, 7.16a.
- H. Hida, *Iwasawa modules attached to congruences of cusp forms*, Ann. Sci. École Norm. Sup. (4) 19 (1986), 231–273:
  7.1 (the module of congruences of a Hecke algebra along a decomposition, through PadicFamilies §1.7a).
- C. Khare, M. Larsen and G. Savin, *Functoriality and the inverse Galois problem*, Compositio Math. 144 (2008), 541–564,
  arXiv:math/0610860; L. Dieulefait and G. Wiese, *On modular forms and the inverse Galois problem*, Trans. Amer. Math.
  Soc. (2011), arXiv:0905.1288, Proposition 6.1: 7.9 (residual irreducibility from tame types at chosen primes).
- E. Urban, *Selmer groups and the Eisenstein–Klingen ideal*, Duke Math. J. 106 (2001), arXiv:math/9803171: 7.7b, 7.7c
  (a congruence ideal bounded by a Selmer group).
- A. Iovita and A. Marmora, *On the continuity of the finite Bloch–Kato cohomology*, Rend. Semin. Mat. Univ. Padova 134
  (2015), 239–271; P. Čoupek, E. Gazaki and A. Marmora, *Exactness property of Breuil–Kisin functors and Bloch–Kato
  Selmer groups*, arXiv:2603.26035 (2026): 7.8a (finite classes modulo `p^n` in small weights).
- T. Horesh and Y. Karasik, *Equidistribution of primitive lattices in ℝ^n*, Quart. J. Math. 74 (2023), 1253–1294,
  Proposition B.5: 7.15 (the dual of an orthogonal projection of `ℤⁿ`; for every lattice,
  GeometryOfNumbersAndQuadraticArithmetic §0.2.5).
- B. Bhatt, T. Gee and M. Kisin, *Reduction modulo p of crystalline Galois representations via μ_p-equivariance*,
  arXiv:2607.08660 (2026); R. Bartlett, *Inertial and Hodge–Tate weights of crystalline representations*, Math. Ann.
  (2020), arXiv:1811.10260; D. Le, B. Le Hung and B. Levin, *Weight elimination in Serre-type conjectures*, Duke Math. J.
  (2019), arXiv:1610.04819: 7.16 (reduction of crystalline representations and weight elimination).
- M. Emerton, T. Gee and F. Herzig, *Weight cycling and Serre-type conjectures for unitary groups*, Duke Math. J. 162
  (2013), 1649–1722, arXiv:1106.4522, §7.4 and Lemma 4.5.1; A. Ash and G. Stevens, *Cohomology of arithmetic groups and
  congruences between systems of Hecke eigenvalues*, J. reine angew. Math. 365 (1986), 192–220: 7.16a (the dévissage of
  Serre weights at a localisation).
