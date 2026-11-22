# Roadmap: the glued target and the division inequality

**Summary.** This sub-roadmap of [RiemannHypothesisForDirichletLFunctions](../README.md) builds the target lattice of a chain of theta lifts between definite unitary groups and bounds everything that enters the slope inequality of the chain on the side of the maps: their integrality, their heights, the slope and the maximal slope of the target. The chain lives over the coefficient fields `𝕂 ⊂ 𝕃` of ThetaChainsOnDefiniteUnitaryGroups, `𝕃` a number field, Galois over `ℚ` and stable under complex conjugation `c_𝕃`. To each word `u` of the chain belong a lattice `M_u` of algebraic automorphic forms with its gain sublattice `N_u`, and the period pairing `B_u`, linear in the form and `c_𝕃`-semilinear in the row, from `M_u` to functionals on the target rows `𝔼`. Slopes `μ`, `μ_max` and heights `ht` are twice Bost's.

The headline theorems are these. (1) *Integrality after division.* Let `𝕃′` be a number field with an automorphism `c`, `B : V × W → 𝕃′` biadditive, `𝕃′`-linear in `V` and `c`-semilinear in `W`, and `N ⊂ V`, `R ⊂ W` `𝒪_{𝕃′}`-submodules. Suppose that at every finite place `𝔭` the module `R` lies in `𝒪_(c^{−1}(𝔭))·j_𝔭(M_𝔭)` for an `𝒪_{𝕃′}`-submodule `M_𝔭` of an `𝕃′`-space and a linear map `j_𝔭` from that space into `W`, and that each value `B(φ, j_𝔭Υ)`, `φ ∈ N`, `Υ ∈ M_𝔭`, is zero or has `𝔭`-adic valuation at least `σ_𝔭`. Then `B((∏_𝔭𝔭^{−τ_𝔭})·N, R) ⊂ 𝒪_{𝕃′}` for all integers `τ_𝔭 ≤ ⌈σ_𝔭⌉`, almost all zero. For the chain it gives, under the hypotheses listed at 7.14 (among them those of the seesaw identity, which ask that the Bessel–Poincaré series of every word be nonzero on its new forms), that `B_u` maps the divided source `N′_u = I_u·N_u` into the lattice `R^∨` of `c_𝕃`-semilinear functionals integral on the glued target `R`, the lattice generated near each place by the integral forms of the tuple of twists used there. (2) *The height of the period pairing.* Under the size conditions of the chain, among them `SizeT_u` on the level prime, `|(L′/L)(1, χ_K)| ≤ x^ε` and, at a scale `x ≥ x₀`, the size predicate `Size_□` of the grid of the rows, and under the hypotheses of the seesaw identity, among them that the Bessel–Poincaré series of every word is nonzero on its new forms (all listed at 8.9), if `B_u ≠ 0` then `ht(B_u) ≤ h_u`, an explicit number: the top term `t_u = −A_top·log T(u) + C₂·(|Φ_top|·b′·N_m + f·(mϑ + Sc)·N_m + f·N_m²)·La`, plus for each of the `m` steps the kernel terms `Σ_τ(Σ_i ph(ν_{j,τ,i}) − (Σ_iν_{j,τ,i})·log Ω)` (`ph(y) = y log y − y`, `Ω` the CM period of the host) and an error `C₁·f·m³·N_m²·La`, minus for each step the logarithms of the hook products `H⁺_{j,τ}` that bound the Rallis eigenvalues from below, up to an error, minus `log 𝔫` plus `log|P_1|`. (3) *The division inequality.* For a good twisting datum that satisfies the support condition (T3), a host with wild-kernel budget `1`, `[F:ℚ] ≥ 3`, `r + 1 < g₀, g₁`, `q_z ≤ ¼` (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18c (e)) and the hypotheses (H1)–(H3) of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18f (c), under the size predicate `Size_□` of the grid at a scale `x ≥ x₀` and the size conditions of the chain (all listed at 8.22), for every word `u`,
`μ(R^∨) + h_u − F_tot ≤ Σ_{τ∈Φ_top}(m·(ph(a_τ) − a_τ·log Ω) − a_τ·log T(u)) + C·|Φ_top|·a·La + C·m·(B₀ + N_c)·x^ε`, where `F_tot` is the bulk divisibility of the steps at the twisted places, `Φ_top` the top places with top entries `a_τ`, `T(u)` the level prime of `u` and `B₀`, `N_c` the budgets of the chain. The large powers of `Ω` cancel between the kernels and the step lattices, the Stirling terms against the hooks, and one row of length `a_τ` per top place and per step survives.

The roadmap sits on [ThetaChainsOnDefiniteUnitaryGroups](../ThetaChainsOnDefiniteUnitaryGroups/README.md), which fixes the chain data; [LocalGainOfThetaChains](../LocalGainOfThetaChains/README.md), whose gain exponents divide the source; [RowTowerAndRallisIdentities](../RowTowerAndRallisIdentities/README.md) and [SeesawForThetaChains](../SeesawForThetaChains/README.md), which supply the rows, the model lifts with their Rallis eigenvalues and the period pairing; [CongruenceModulesOfThetaLifts](../CongruenceModulesOfThetaLifts/README.md) and [ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties](../ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties/README.md), which bound the congruence lengths and the slopes of the step lattices; and [SlopesOfHermitianVectorBundles](../SlopesOfHermitianVectorBundles/README.md), whose slope calculus and gluing lemma are used throughout. [ThetaChainsAndFrobeniusPrimeSums](../ThetaChainsAndFrobeniusPrimeSums/README.md) applies the results to the slope inequality of the chain.

Layer 7 below proves integrality after division and forms the divided source and the glued target (7.12–7.14). Layer 8 bounds the height of the period pairing through its factorisation into step operators, top period and descent (8.1–8.10), shows that the theta conditions of the twist selection are polynomial conditions (8.19e), computes the local terms of the glued target with the depth table (8.20–8.20b), bounds the slope of the target (8.21), proves the division inequality and the cost of the type primes (8.22, 8.23), and bounds the maximal slope of the target (8.24a–8.24e, 8.24).

## Conventions

**Fields.** `E` is the host (FrobeniusRestrictedRieszSums §0.1): finite abelian over `ℚ` with an imaginary quadratic subfield `K`; `F = E⁺` its
maximal totally real subfield, `f = [F:ℚ]`; `c ∈ G` complex conjugation; `χ_K` the quadratic character of `K`; `f_E` the
conductor of `E`; `h_E` the class number of `E` and `μ_E` its group of roots of unity. Under `SplitRamification d` (FrobeniusRestrictedRieszSums §0.3) `K` is
ramified only at the prime `d`; on the cyclic hosts (FrobeniusRestrictedRieszSums §0.4; layer `n ≥ 2`) `q ≡ 3 (mod 8)`, `d ≡ 7 (mod 16)`, `K = ℚ(√−d)`, and a second imaginary quadratic
field `ℚ(√−q) ⊂ E` is used; `(q, d)` is the *auxiliary pair*. `𝕂 ⊂ 𝕃` are the two fields of the chain (ThetaChainsOnDefiniteUnitaryGroups §2.6): the
*coefficient field* `𝕂`, a number field containing `E`, over whose ring of integers the cusp forms on the Shimura varieties of the
steps, their integral forms, theta rules and short theta series are taken, and the *field of places* `𝕃`, a finite Galois
extension of `ℚ` inside `ℂ`, stable under complex conjugation and containing `𝕂`, with the embedding `σ₀` and the conjugation
`c_𝕃 = σ₀^{−1}∘(complex conjugation)∘σ₀` of ThetaChainsOnDefiniteUnitaryGroups §2.6. The Hermitian lattices of the chain are over `𝒪_𝕃`; lattices over `𝒪_𝕂`
enter them after extension of scalars to `𝒪_𝕃`, which changes neither the slope nor the maximal slope (SlopesOfHermitianVectorBundles §3.5;
for the degree, ArakelovGeometryAndAbelianHeights §1.6). The finite places of
`𝕃` are written `𝔭`, with residue characteristic `p(𝔭)` (also `ℓ(𝔭)`), ramification index `e_𝔭` and weight `ϱ(𝔭) = log N𝔭/[𝕃:ℚ]`
(so `Σ_{𝔭|p} ϱ(𝔭)e_𝔭 = log p`); `sz_𝔭(y) = 2ϱ(𝔭)e_𝔭·y`. Embeddings `𝕃 ↪ ℂ` are written `σ`.

**CM type and places.** An embedding `ι₀ : E ↪ ℂ` is fixed; `Φ = Gal(E/K)` is identified with the CM
type `{ι₀∘g : g ∈ Φ}` induced from `K` (`|Φ| = f`). Elements of `Φ` are called places. When `K = ℚ(√−d)`, `√−d ∈ K`
denotes the root with `Im ι₀(√−d) > 0`, so that `Im τ(√−d) > 0` for every `τ ∈ Φ`.

**Primes of the construction.** The *type primes* `g₀, g₁` (ThetaChainsOnDefiniteUnitaryGroups §2.7) carry the depth-zero types; the *auxiliary primes*
`p_δ, p′_δ` carry the characters `δ, δ′` (ThetaChainsOnDefiniteUnitaryGroups §2.4, ThetaChainsOnDefiniteUnitaryGroups §2.7); the primes `q, d` form the *auxiliary pair* (FrobeniusRestrictedRieszSums §0.4), and are not
called auxiliary primes; the *level prime* `T(u) = N(π_u)` of a word `u` (ThetaChainsOnDefiniteUnitaryGroups §2.8) carries the new forms. The *twist places*
`Q(ξ)` of a tuple `ξ` of twisting characters are its full ramification set (ThetaChainsOnDefiniteUnitaryGroups §2.5). Twisting involves two sets (ThetaChainsOnDefiniteUnitaryGroups §2.5): the
*admissible twisting characteristics* `𝒮_tw`, the primes at which twisting is permitted, and the *twisted places* `Tw`,
a finite `c_𝕃`-stable set of places of `𝕃` above `𝒮_tw`, fixed with the twisting datum (ThetaChainsOnDefiniteUnitaryGroups §2.5), outside which the tuple
`ξ_𝔭` used is the base tuple; sums "over the twisted places" run over `Tw`.

**Hermitian forms, definiteness and measures.** Hermitian forms are conjugate-linear in the first variable (the
convention of `HermitianFormsAndLattices` and `ThetaLiftsForDefiniteUnitaryGroups`). Definiteness is that of
`HermitianFormsAndLattices`: a space is *definite at* a real place if its form has one sign there, *totally definite* if
it is definite at every real place (the sign may depend on the place), and *totally positive definite* if every sign is
`+`; a *definite unitary group* is the unitary group of a totally definite space. The column spaces `X_j`, the model
spaces `V_j` and the hyperplane `X^h ⊂ X_m` are totally positive definite (ThetaChainsOnDefiniteUnitaryGroups §2.2). On `U(V)(𝔸_f)` the stabiliser of the
chosen self-dual lattice has volume `1`; for totally definite `V`, `∫_{[U(V)]} φ = Σ_𝒸 |Γ_𝒸|^{−1} φ(g_𝒸)` over the
classes `𝒸` (representatives `g_𝒸`, stabilisers `Γ_𝒸`), so the total volume is the mass; for indefinite `V` the
archimedean measure is transferred from the compact inner form, and formal
degrees are taken for this measure.

**Integral structures.** For a dominant weight `λ`, `∇_ℤ(λ)` is the dual Weyl lattice (the integral polynomials of the
polynomial model of ThetaChainsOnDefiniteUnitaryGroups §3.1, spanned by products of minors) and `Δ_ℤ(λ) ⊂ ∇_ℤ(λ)` the Weyl lattice, its dual for the
invariant form (the integral Weyl and induced lattices of ReductiveGroups §10B for `GL_N`, dual for its contravariant form); the
product of leading minors `v_λ` lies in both. The column side of the chain (the integral forms
`ℳ_j^{int}` of ThetaChainsOnDefiniteUnitaryGroups §3.1, the chain lift, the source lattices of ThetaChainsOnDefiniteUnitaryGroups §3.8 and their restriction to `U(X^h)`) takes values in `Δ_ℤ`,
in the coordinates of a basis of the dual class lattice; the row forms `Υ` on `U(X^h)` paired with it take values in
`∇_ℤ` (the forms `ℳ^∨`), so that every class term of the pairing is integral and the only loss is the stabiliser
orders (ThetaChainsOnDefiniteUnitaryGroups §3.6, ThetaChainsOnDefiniteUnitaryGroups §3.10). At the top, a class `𝒸` of `U(X^h)` gives the class `𝒸̃` of level `m` with class lattice
`L_𝒸 ⊕ 𝒪_E z_u`, `z_u = π_u e_{N_m}`, and the restriction to `U(X^h)` is integral at every finite place (ThetaChainsOnDefiniteUnitaryGroups §3.9).

**Slopes and heights.** Hermitian lattices are finitely generated `𝒪_𝕃`-submodules of full rank in Hermitian
`𝕃`-spaces with a metric at every complex embedding. This roadmap writes `μ(L̄) := 2μ̂(L̄)`, twice Bost's normalised
slope (`μ̂ = deĝ/([𝕃:ℚ]·rk)`; Bost 1996, App. A.2, pp. 146–147; ArakelovGeometryAndAbelianHeights §§1.1, 1.3), so `μ(𝒪_𝕃^n, standard) = 0`; `μ_max`, `μ_min`
likewise. For a linear map `φ`,
`ht(φ) := (2/[𝕃:ℚ]) Σ_σ log ‖φ‖_σ`, twice Bost's archimedean height, that is the mean over the embeddings of
`log ‖φ‖²_σ` (equivalently over the infinite places, the metrics being compatible with conjugation); integrality at
finite places is stated separately. For a lattice `L` and a basis `e` of `L ⊗ 𝕃`,
`−rk L·μ(L) = mean_σ log det Gram_σ(e) − 2Σ_𝔭 ϱ(𝔭)·idx_𝔭(L : ⟨e⟩)`, `idx_𝔭` the signed length at `𝔭` (no factor `2` on
the mean). With these, `μ(N̄) ≤ μ_max(M̄) + ht(φ)` for `φ` injective and integral, and this roadmap is written in
squared norms (`ph(y) = y log y − y`). `SlopesOfHermitianVectorBundles` uses `μ̂` and `h`; this paragraph is the
dictionary, and its statements are homogeneous in it.

**Galois representations and wild kernels.** The Galois representations of CongruenceModulesOfThetaLifts, which enter here through the twist selection (8.19e), follow
AutomorphicGaloisRepresentationsPartII (Conventions, and Layer AG2.0, the ℓ-adic character `r_{l,ι}(χ)` of an algebraic Hecke
character): Artin reciprocity sends uniformizers to geometric Frobenius elements, and the
cyclotomic character `χ_cyc` has Hodge–Tate weight `−1`. A Hecke character `μ_j` of `E` (ThetaChainsOnDefiniteUnitaryGroups §2.4; the same for `η̃`, `δ`,
`δ′`) has the value `μ_j(𝔓)` at a prime `𝔓` of `E` prime to its conductor, its value at a uniformizer of `E_𝔓`; its
`ℓ`-adic Galois character takes the value `μ_j(𝔓)` at the geometric Frobenius of `𝔓`, and for a character of
finite order it is the inverse of the character that the arithmetic normalisation (`Frob_p` acting as `x ↦ x^p` on residue fields) attaches to
it. For a number field `M`, a prime `ℓ` and an integer `e ≥ 1`, `Ш¹(M, ℓ, e)` is the group of classes in
`H¹(𝒪_M[1/ℓ], ℚ_ℓ/ℤ_ℓ(−e))` unramified outside `ℓ` and trivial at the places above `ℓ`, and
`V(M, t) = Σ_ℓ log ℓ Σ_{1≤e<t} length Ш¹(M, ℓ, e)`, as in BernoulliBoundsForClassGroupEigenspaces §6.17 (by Poitou–Tate
duality, for `ℓ` odd or `M` totally imaginary, `Ш¹(M, ℓ, e)` has the length of the cohomological wild kernel `Sha²_{e,ℓ}(M)` of
ArithmeticKTheory §6.9, BernoulliBoundsForClassGroupEigenspaces §6.17 (b)); the roadmap uses them for `M = E`, which is CM, hence
totally imaginary, so that the equality of lengths holds at every `ℓ`.

**The CM period.** `log Ω := γ + log(2π/rd_E) − (L′/L)(1, χ_K)`, `rd_E` the root discriminant of `E`. Equivalently
`log Ω = log Ω_K − log(rd_E/√d)`, where `log Ω_K = γ + log(2π/√d) − (L′/L)(1, χ_K)` is the mean over the ideal
classes of `K` of `log(area(Λ)/π) + (1/6) log|Δ(Λ)|` (Chowla–Selberg for `d > 4`, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.5; an
equivalent form, for the Faltings height of one CM elliptic curve and the value at `s = 0`, is
ComplexMultiplicationAndExplicitReciprocityPartII §4.6, through ArakelovGeometryAndAbelianHeights §2.9). The same `Ω` enters the heights of the
lifts (8.6, through ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.5) and the arithmetic degree of the flat line bundle (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.11).

**Indices of the chain.** Step `j` is the column lift `U(X_{j−1}) → U(X_j)` with Hecke character `μ_j` and step weight
`w_j = e_{j−1}` (ThetaChainsOnDefiniteUnitaryGroups §2.3), the row descent `U(Y_j) → U(Y_{j−1})` (against the conjugate kernel `θ̄`, ThetaChainsOnDefiniteUnitaryGroups §2.2a), and the model
lift between `U(V_j)` and `U(W_j)`. Columns grow by `t + 1`, rows by `t`.

**Row spaces.** The row forms on `U(Y_0)` are formed at principal level at the type primes, where the finite group `G₀`
of ThetaChainsOnDefiniteUnitaryGroups §2.9a acts (RowTowerAndRallisIdentities §5.3): `ℋ^♮` denotes the rows at principal level and `𝔼^♮ = Π_good·ℋ^♮` the good ones; `ℋ` and
`𝔼 = Π_good·ℋ` are their parts of the row type level `(P_1, χ_{P_1})` of ThetaChainsOnDefiniteUnitaryGroups §2.9a, on which the Poincaré series, the seesaw
and the target rows live; `𝔼_0` is the part of the base level `(P_0, χ_{P_0})`.

**Characters and levels at the type primes.** For a type prime `g ∈ {g₀, g₁}` the prime `π_g𝒪_K` of `K` above `g` is
fixed, and for a place `v` of `F` above `g`, `w_v` is the place of `E` above `v` and `π_g` (residue field `𝔽_g`). The
*type characters* of step `j` are `χ_{v,j} := ω_g^{2j}` on `𝒪_{E_{w_v}}^×`, `ω_g` a fixed generator of the characters of
`𝔽_g^×`, the same for all `v | g` and all `j` (ThetaChainsOnDefiniteUnitaryGroups §2.4 (b)): squares, of depth zero, read as elements of `𝔽_g^×` through the
identification of ThetaChainsOnDefiniteUnitaryGroups §2.9a (its tame condition). The step character `μ_j` is tamely ramified there, with residue
`χ_{v,j}^{−1}` at `w_v` and `χ_{v,j}` at `w̄_v`. The levels of ThetaChainsOnDefiniteUnitaryGroups §2.9a carry these characters: on `U(V_j)` the character
`χ_{v,j}^{−1}` of the determinant of the `t`-block, and on the row stage of `Y_j` the character
`χ^{fl}_j = ∏_{i≤j} χ_{v,i}^{−1}` of the determinants of the added blocks. A *level* at the type primes is a pair
`(P, χ_P)` of a subgroup `P` of the finite group `G₀` and a character `χ_P` of `P`; the rows are formed at principal
level and the levels cut out their parts (base level `(P_0, χ_{P_0})`, row type level `(P_1, χ_{P_1})`, ThetaChainsOnDefiniteUnitaryGroups §2.9a). At the
twist places the levels carry `c_v(det of the lower block)`, `c_v = (ξ_{w_v}|_{𝒪^×})^{s}`, with exponent `+1` (ThetaChainsOnDefiniteUnitaryGroups §2.9c); the
rule for all bad places is that of ThetaChainsOnDefiniteUnitaryGroups §2.9 (the residues `c_{i,v}` of the step characters). The
splitting character `η̃` and the twisting characters are unramified at the type places, and `μ_j`, `δ`, `δ′` are
unramified outside the *bad places* `S₀`, the places above `g₀, g₁, p_δ, p′_δ` (ThetaChainsOnDefiniteUnitaryGroups §2.4 (b)).

**Periods and pairings.** The top period `P̃_ξ(φ, Υ)` (ThetaChainsOnDefiniteUnitaryGroups §3.9) is linear in the column `φ` and conjugate-linear in the
row form `Υ`. Equivalently, it is a bilinear pairing applied to the row form with conjugated coefficients: for a column
form `φ′` of level `m`, `P̃(φ′, Υ) = P^{bil}(φ′, Υ^c)`, where `P^{bil}` is `𝕃`-bilinear (built from the `ℚ`-bilinear
contravariant forms `β_λ` whose Hermitian forms are those of ThetaChainsOnDefiniteUnitaryGroups §3.1) and `Υ^c`, the *coefficient conjugate* of `Υ`, is a form
for the CM type `cΦ` with the conjugate character (ThetaChainsOnDefiniteUnitaryGroups §3.9). The conjugation is that of the coefficients of the row form,
never of the column or of the place at which the column is bounded: a bound for the period at a place `𝔭` of `𝕃` uses
the column at `𝔭` and the row form at `c_𝕃(𝔭)` (`Υ^c` is integral at `𝔭` exactly when `Υ` is integral at `c_𝕃(𝔭)`;
ThetaChainsOnDefiniteUnitaryGroups §3.10). The cost of the level prime `T(u) = N(π_u)` sits at the places above `π_u` and is `0` at those above `π̄_u` (LocalGainOfThetaChains §4.16).
The period pairing `B_u(φ)(x)` of SeesawForThetaChains §6.1 is linear in the column `φ` and conjugate-linear in the row `x ∈ 𝔼`; under
the hypotheses of SeesawForThetaChains §6.14 (among them that the Bessel–Poincaré series of every word `u` is nonzero on its new forms `M_u`), for
a tuple `ξ` and a row form `Υ` of the relevant part `ℋ^{rt}_ξ` of the row type level (RowTowerAndRallisIdentities §5.4),
`P̃_ξ(φ, Υ) = ζ(u, ξ)·B_u(φ)(ι_ξΥ)` with a root of unity `ζ(u, ξ)` (SeesawForThetaChains §6.14 (c), §6.15 (b)). The steps of the descent of a tuple are
normalised by the volume of its finite level group (RowTowerAndRallisIdentities §5.4).

**Routes.** The mathematics of this roadmap follows a complete formal proof ([FormalProof]); every target states what
that proof establishes. Where a route is not given, or not given in full, the target says so in its route. The good
twisting datum (CongruenceModulesOfThetaLifts §7.10a) and the wild-kernel budget (CongruenceModulesOfThetaLifts §7.11) are conditions on the data, and so are the conditions (T1), (T2)
of ThetaChainsOnDefiniteUnitaryGroups §2.5 and (T3) of 8.20 on the twisting datum.

**Quantifier order and sizes.** Constants named before `ε` do not depend on `ε`; the scale `x` and everything chosen at
it come after `ε`. Between them come the numbers that may depend on `ε` and that the size predicates of
ThetaChainsOnDefiniteUnitaryGroups §2.1 take as arguments: the layer exponent `A_n`, the window constant `J` and the exponent `c_H` of the slope
range. The size conditions are named predicates: those of ThetaChainsOnDefiniteUnitaryGroups §2.1, grouped into the host predicates `SizeA`,
`SizeN`, `SizeD`, `SizeRd`, `SizeQD`, `SizeInert`, `SizeDep` and the parameter predicates `SizeM`, `SizeK`, `SizeW`,
`SizeMf`, `SizeT`, `SizeTheta`, with their conjunction `Size(x, ε)`; and those named where their quantities are defined:
`SizeSc` (ThetaChainsOnDefiniteUnitaryGroups §2.3b), `SizeGap`, `SizeSep` (ThetaChainsOnDefiniteUnitaryGroups §2.3c), `SizeG` (ThetaChainsOnDefiniteUnitaryGroups §2.7), `SizeT_u` (ThetaChainsOnDefiniteUnitaryGroups §2.8: `16mx^ε ≤ log T*(u)` and
`log T*(u) + 1 ≤ C_T m x^ε ≤ x`). `SizeDep` uses the set `S_small` and the number `vd` of ThetaChainsOnDefiniteUnitaryGroups §2.1 and a constant `C_dep`
fixed before `ε`. "The size conditions of ThetaChainsOnDefiniteUnitaryGroups §2.1" means `Size(x, ε)`; a target that uses a single predicate names it.

**Constants.** Exponents, window ratios, the shares of the tops, the bound `t ≤ x^{C_t}`, the budgets and the
admissible range of `ε` are parameters with their true constraints; the exponents written in the size predicates of
ThetaChainsOnDefiniteUnitaryGroups §2.1 are fixed choices. The values of one construction (such as `C_t = 401`) appear only in Checks.

### Table of symbols

| Symbol | Meaning | Defined |
|---|---|---|
| `E, F = E⁺, f, c, G, f_E` | host field, its maximal totally real subfield, `[F:ℚ]`, complex conjugation, `Gal(E/ℚ)`, conductor of `E` (of a primitive `χ`: `f_χ`) | FrobeniusRestrictedRieszSums §0.1, FrobeniusRestrictedRieszSums §0.2 |
| `K, χ_K, d, √−d` | the imaginary quadratic subfield and its character; the prime of `SplitRamification d` (`K = ℚ(√−d)` on the cyclic hosts) and the root with `Im ι₀(√−d) > 0` | FrobeniusRestrictedRieszSums §§0.1–0.3, Conventions |
| `Φ, ι₀, τ` | `Gal(E/K)` and the CM type it defines through `ι₀`; its elements, the places | FrobeniusRestrictedRieszSums §0.1 |
| `σ_d` | the nontrivial element of the inertia group at `d` | FrobeniusRestrictedRieszSums §0.3 |
| `SplitRamification d, InertFreeUpTo B, HostSplitting E` | host predicates: every ramified prime other than `d` splits in `K` and `I_d = {1, σ_d}`, `σ_d ∉ Φ`; no prime `p ≤ B` is inert in `K`; `4 \| f` and every place of `F` above a prime dividing `f_E` splits in `E` | FrobeniusRestrictedRieszSums §0.3 |
| `(q, d), n` | auxiliary pair, layer of the cyclotomic `ℤ₂`-tower of a cyclic host | FrobeniusRestrictedRieszSums §0.4 |
| `A, A₀` | `Gal(E/ℚ(√−q, √−d)) ⊂ Φ`; `A₀ = ker(ψ\|_A)`, `[A:A₀] = o` | FrobeniusRestrictedRieszSums §0.4 |
| `Φ_top, 𝒯, δ_th, u₀` | tops `Φ_top ⊂ A`, thick set `𝒯 ⊂ A₀`, `\|𝒯\|/\|A\|`, a translate (thick places `cσ_d u₀𝒯`, thick letters `cσ_d u₀𝒯 ⊔ σ_d u₀𝒯`) | FrobeniusRestrictedRieszSums §0.6, FrobeniusRestrictedRieszSums §0.8a |
| `γ` | Euler's constant | Conventions |
| `rd_E, log Ω, log Ω_K` | root discriminant, CM periods of `E` and of `K` | Conventions |
| `μ, μ_max, μ_min, ht, ph` | twice Bost's slopes, twice his archimedean height, `ph(y) = y log y − y` | Conventions |
| `𝔭, p(𝔭), e_𝔭, ϱ(𝔭), sz_𝔭` | finite place of `𝕃`, residue characteristic, ramification index, `log N𝔭/[𝕃:ℚ]`, `sz_𝔭(y) = 2ϱ(𝔭)e_𝔭y` | Conventions |
| `Ш¹(E, ℓ, e), V(E, t)` | twisted Tate–Shafarevich groups, their total length | Conventions |
| `k, m, t, r, N_j, n_j` | base rank, chain length, rank step, `r = k + m − 1`, `N_j = k + j(t + 1)`, `n_j = r + jt` | ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `x, ε, b, a, X′, b′, w″, X″` | scale, exponent, `e^{x^ε}`, `x·b`, `e^{x^{ε/3}}`, `a/X′`, `b′/(x\|A\|)`, `x\|A\|X′` | ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `ϑ, B₀, N_c, Γ₀, H` | thick-weight width, the two budgets `B₀ = fmbx^ε`, `N_c = \|𝒯\|kbx^{2ε}/\|A\|²`, redundancy factor, slope range `x^{c_H}b` | ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `Size(x, ε)` | conjunction of the host predicates `SizeA, SizeN, SizeD, SizeRd, SizeQD, SizeInert, SizeDep` and the parameter predicates `SizeM, SizeK, SizeW, SizeMf, SizeT, SizeTheta` | ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `S_small, vd, SizeDep` | the primes dividing `2f_E` other than `q`, `d`; the number of `SizeDep`, at least `v_ℓ(f_E)`, `v_ℓ(Q)` (`Q` of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a) and the mean different exponent of `E` at every `ℓ ∈ S_small`; the host predicate on them | ThetaChainsOnDefiniteUnitaryGroups §2.1, 8.20 |
| `SizeSc, SizeGap, SizeSep, SizeG, SizeT_u` | size predicates of the words, the gaps, the separation, the type primes and the level primes | ThetaChainsOnDefiniteUnitaryGroups §2.3b, ThetaChainsOnDefiniteUnitaryGroups §2.3c, ThetaChainsOnDefiniteUnitaryGroups §2.7, ThetaChainsOnDefiniteUnitaryGroups §2.8 |
| `C_t, C_W, C_Γ, A_max, C_dep` | constants fixed before `ε`: of `SizeT`, of `SizeW`, of `Γ₀`, the bound of the layer exponent, the constant of `SizeDep` | ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `X_j, X^h` | column spaces, hyperplane of `X_m` | ThetaChainsOnDefiniteUnitaryGroups §2.2 |
| `Y_j, z_m, r_S` | row spaces; the negative vector of `Y_j` (`j` even); `r_S = m/2 − 1`, the number of hyperbolic planes of `Y_0` | ThetaChainsOnDefiniteUnitaryGroups §2.2 |
| `W_j, V_j` | model spaces: rank `r`, signature `(k+j−1, m−j)`; totally positive definite of rank `r + t` | ThetaChainsOnDefiniteUnitaryGroups §2.2 |
| `𝔞₀, δ_T` | `𝔞₀𝔞̄₀ = 𝔇_{E/K}^{−1}`; the scaling element `δ_T = √−d/d = −1/√−d` of the steps | ThetaChainsOnDefiniteUnitaryGroups §2.2 |
| `W, u, u_*` | the set of words, a word, the base word | ThetaChainsOnDefiniteUnitaryGroups §2.3 |
| `u(τ), v(τ), e′(τ), e(τ)` | Harish-Chandra data at `τ` of the word `u` (`v, e′, e` shared by all words) | ThetaChainsOnDefiniteUnitaryGroups §2.3 |
| `a_τ, a⁻_τ, θ_a, A_w` | top entry and negative bottom entry, top window `θ_a = 1/(k·x^{A_w/2})` | ThetaChainsOnDefiniteUnitaryGroups §2.3b |
| `w_j(τ), w_{u₀,j}` | step weights `e_{j−1}(τ)` (thick, top or thin); those of the translate `u₀` | ThetaChainsOnDefiniteUnitaryGroups §2.3 |
| `Λ_j(τ), ν_j(τ), σ(τ)` | weight on `X_j`, Young diagram of step `j`, top weight on `X^h` | ThetaChainsOnDefiniteUnitaryGroups §2.3 |
| `s⁺_j(τ), s⁻_j(τ), p_j, q_j` | the model parameter of step `j`: the first `p_j = k + j − 1` and the last `q_j = m − j` entries of `(v(τ); −e′(τ))`; `s⁻_{j,c} = −e′_{j+c}` | ThetaChainsOnDefiniteUnitaryGroups §2.3 |
| `Δ_w, Sc` | letter step, cloud size `4kΔ_w` | ThetaChainsOnDefiniteUnitaryGroups §2.3 |
| `(U_j), (W1)–(W6), h_gap, κ_j` | unit condition, conditions of a weight datum, row gap, the shift `(k + (2j − 1)(t + 1))/2` of the step diagrams | ThetaChainsOnDefiniteUnitaryGroups §2.3 |
| `(W7), η_s, D_*, ℓ*, ℓ_A` | the separation condition, separation width, thresholds | ThetaChainsOnDefiniteUnitaryGroups §2.3c |
| `η_w` | the window `t + max_τ(e_{m−1}(τ) − e′_0(τ))` of an adapted weight datum | ThetaChainsOnDefiniteUnitaryGroups §2.3b |
| `h₀` | node spacing of an adapted weight datum | ThetaChainsOnDefiniteUnitaryGroups §2.3a |
| `μ_j, η̃, δ, δ′, o_δ` | Hecke characters of the chain, unramified splitting character (not algebraic; `η̃²` and `η̃·‖·‖_{𝔸_E}^{1/2}` are, and `𝕃` contains the values of the latter, ThetaChainsOnDefiniteUnitaryGroups §2.6), auxiliary characters and their inertial order | ThetaChainsOnDefiniteUnitaryGroups §2.4 |
| `χ_{v,j}, ω_g` | type characters `ω_g^{2j}` at the place `w_v` of `E` above `π_g` (the residue of `μ_j` there is `χ_{v,j}^{−1}`); the fixed generator of the characters of `𝔽_g^×` | ThetaChainsOnDefiniteUnitaryGroups §2.4 |
| `S₀` | bad places: the places above `g₀, g₁, p_δ, p′_δ` | ThetaChainsOnDefiniteUnitaryGroups §2.4 |
| `ξ, Ξ, ξ_𝔭, Q(ξ), s, δ_ℓ` | tuple of twists (`ξ = 1` the base tuple), set of tuples, tuple used at `𝔭`, twist places (full ramification set), the sign of the twisted tuples (`s_j := s`), auxiliary character of `ℓ` | ThetaChainsOnDefiniteUnitaryGroups §2.5 |
| `A(ℓ), Q(ψ_𝔭)` | places of `E` above the auxiliary prime of `ℓ`; ramification set of the twist `ψ_𝔭` (`Q(ξ_𝔭) = A(ℓ) ⊔ Q(ψ_𝔭)`) | ThetaChainsOnDefiniteUnitaryGroups §2.5 |
| `𝒮_tw, Tw` | admissible twisting characteristics; twisted places | ThetaChainsOnDefiniteUnitaryGroups §2.5 |
| `Z₀; (T1), (T2); (T3)` | the prescribed set of places of a twisting datum; conditions on the twisting datum; the support condition on `Tw` | ThetaChainsOnDefiniteUnitaryGroups §2.5; 8.20 |
| `𝕂, 𝕃, σ₀, c_𝕃` | coefficient field, field of places, the embedding of `𝕃` and its conjugation | ThetaChainsOnDefiniteUnitaryGroups §2.6 |
| `g₀, g₁; p_δ, p′_δ; 𝔅(N, g)` | type primes; auxiliary primes; the exceptional set of a type prime | ThetaChainsOnDefiniteUnitaryGroups §2.7 |
| `T(u), T*(u), π_u` | level prime of the word `u`, its target value, `T(u) = N(π_u)` | ThetaChainsOnDefiniteUnitaryGroups §2.8 |
| `G₀, (P, χ_P), (P_0, χ_{P_0}), (P_1, χ_{P_1}) = (K₂, χ₂), ψ_g` | finite group of the type primes, a level, base level, row type level, additive character | ThetaChainsOnDefiniteUnitaryGroups §2.9a |
| `S(ξ), c_{i,v}` | the places where levels are not hyperspecial; the residues of the step characters at the bad places | ThetaChainsOnDefiniteUnitaryGroups §2.9 |
| `ℳ_j, ℳ_j^{int}, ℳ_j^∨, 𝒸, L_𝒸` | chain forms of level `j`; the `Δ_ℤ`-valued (integral) and `∇_ℤ`-valued forms; a class, its class lattice | ThetaChainsOnDefiniteUnitaryGroups §3.1 |
| `Λ_K, 𝔙(L, L′), H_A, c_τ` | the lattice `δ_K·ι₀(𝒪_K)` of discriminant `1`, the period lattice, its Hermitian form, generators of the axis ideals `𝔩_τ𝒪_𝕃` | ThetaChainsOnDefiniteUnitaryGroups §3.1a |
| `Θ^{CM}_{L,L′}` | the family of CM theta functions | ThetaChainsOnDefiniteUnitaryGroups §3.1d |
| `ℱ_j, Θ_{𝒸,𝒸′}(ξ), ρ^ξ_j, K_j(ξ), col_ξ, A_j, φ^{(α,α′)}_j` | Fock summand of step `j`, theta function of a step at a pair of classes, class characters, step operator, chain lift; a system of data of the chain: index sets and admissible data (`col_ξ` is the sum over index paths of composites) | ThetaChainsOnDefiniteUnitaryGroups §3.2, ThetaChainsOnDefiniteUnitaryGroups §3.5 |
| `D_Γ` | least common multiple of the stabiliser orders | ThetaChainsOnDefiniteUnitaryGroups §3.6 |
| `M_u^{all}, M_u, d_u^{all}, d_u` | full and new source lattices of the word `u`, their ranks | ThetaChainsOnDefiniteUnitaryGroups §3.8 |
| `P̃, P̃_ξ; Υ, φ′; P^{bil}, Υ^c, β_λ` | top period, of the chain of the tuple `ξ`; a row form on `U(X^h)`, a column form of level `m`; the bilinear form of the period, the coefficient conjugate of `Υ`, the bilinear contravariant form | ThetaChainsOnDefiniteUnitaryGroups §3.9 |
| `𝒸̃, res, br_τ, c_{Br,τ}, D₀(τ), D₁(τ)` | the class of level `m` of a class of `U(X^h)`, restriction to `U(X^h)`, the branching map, its constant, its degree bounds | ThetaChainsOnDefiniteUnitaryGroups §3.9 |
| `n_o` | the length of a cycle of the flow programme; orbit length of a row datum | TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.6, TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.19 |
| integral charts | existence, chart-independence of the depth, saturated frames | TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.8b′ |
| `g_j, g⁰_j, g^D_j, F_j, E_{u,j}, Ẽ_{u,j}, τ_N, 𝔦, 𝔊_u` | the ledger of step `j` at `𝔭`: gain, operator-free gain, gain off `Drop`, bulk, cost, the cost without the stabiliser term `v_p(D_Γ)`, served colength, colength beyond `τ_N`; the net exponent of the chain | LocalGainOfThetaChains §4.9, LocalGainOfThetaChains §4.9e, LocalGainOfThetaChains §4.9f |
| split, conjugate, odd conjugate type; linked places; `𝒜_p, ℬ_p, 𝒱_p, Drop` | types of a prime inert in `K` by its Frobenius; places with two tops at odd distance in their orbit; the places above `p` whose positions lie in the coset `A` of the tops and the others, the served places, the dropped primes | LocalGainOfThetaChains §4.9, LocalGainOfThetaChains §4.17 |
| `𝔢_u` | cost at the level prime | LocalGainOfThetaChains §4.9f |
| `N_u, N_T(𝔭)` | sublattice of `M_u` on which the gains are proved; its local form at `T(u)` | LocalGainOfThetaChains §4.16 |
| `B_𝔥, X[𝔥], e_{P,χ_P}` | family of an eigensystem `𝔥` (the Satake parameters of its base change), the part on which the Hecke operators act by `𝔥`; idempotent of a level `(P, χ_P)` at the type primes | RowTowerAndRallisIdentities §5.7, ThetaChainsOnDefiniteUnitaryGroups §2.9a |
| `ℋ^♮, 𝔼^♮, ℋ, 𝔼, 𝔼_0, Π_good` | rows at principal level, good rows; their parts of the row type level (`𝔼` the target rows); the part of the base level; the good idempotent | RowTowerAndRallisIdentities §5.3 |
| `𝒰^♮_ξ, M̃_ξ, D_ξ, ι_ξ, ℋ^{rt}_ξ, Q_ξ, sec` | forms on `U(X^h)` at principal level, integral forms, the unprojected `m`-fold descent, the good descent `Π_good∘D_ξ`, the relevant part of the row type level, its part orthogonal to `ker ι_ξ`, the section of `ι_1` on `𝔼` | RowTowerAndRallisIdentities §5.4 |
| `θ_j, D_{W_j}, λ_j(ξ, 𝔥), a_j, ϑ_v` | model lift of step `j`, the holomorphic discrete series of `U(W_j)`, its Rallis eigenvalue `a_j·L`, its constant; the character in the test function at a place below `Q(ξ)` | RowTowerAndRallisIdentities §5.7 |
| `v_□, p_□, S_□` | the auxiliary place of the grid, its rational prime, `S₀ ∪ {v_□}` | RowTowerAndRallisIdentities §5.8a |
| `𝔪_□, d_□, C_F, K⁺; X^c_i, X⁺ = X^c_m; C⁺, e⁺_i, z⁺, N⁺, ψ⁺, n⁺` | the modulus of the grid, its depth, the depth constant, the principal congruence subgroup of level `𝔪_□` in `U(X⁺)(𝔸_f)`; the core column; the Bessel datum (the measure constants `𝔪_j` of RowTowerAndRallisIdentities §5.2 are other symbols) | RowTowerAndRallisIdentities §5.8a |
| `B⁺, 𝐩, 𝐜, ℓ⁺, Cl⁺, y_{κ,i}, Θ^{(0)}_{𝐩,𝐜}; ℬ_a, a = (𝐜, κ, i)` | the Bessel form; Fock data of column `0`; coset data; a linear form on `V_{Λ⁺}`; the classes `U(X⁺)(F)\U(X⁺)(𝔸_f)/K⁺`; the form on the class `κ` with value the `i`-th basis vector; the theta series of column `0`; the Bessel periods of the grid (conjugate-linear in the row) and their index | RowTowerAndRallisIdentities §5.8e |
| `Size_□, x₀; C_F⁰, x_F` | the size predicate of the grid; the scale from which its separation statement holds; the threshold of the depth constant and the scale from which the rational structure and the bounds of 8.24a–8.24 hold | RowTowerAndRallisIdentities §5.8e; RowTowerAndRallisIdentities §5.8, Layer 8 |
| `𝔫` | the descent constant | RowTowerAndRallisIdentities §5.10 |
| `B_u` | the period pairing (linear in the column, conjugate-linear in the row) | SeesawForThetaChains §6.1, SeesawForThetaChains §6.14 |
| `η_j(𝔭), Z_good, V_good, d^{Z,P_0}_j` | congruence length at the base level (8.20; `η^{P_0}_j(𝔭)` of CongruenceModulesOfThetaLifts §7.1 (4)), lifted good eigensystems, the lifted subspace, the dimension `D_0` of its base-level part | CongruenceModulesOfThetaLifts §7.1, CongruenceModulesOfThetaLifts §7.5b, CongruenceModulesOfThetaLifts §7.8a |
| `N′_u, I_u, R, R^∨, R_0` | divided source, division ideal, glued target, its dual (the `c_𝕃`-semilinear functionals integral on `R`), its base-level form | 7.13 |
| `𝔧_j(𝔭), 𝔧_j(ℓ)` | Weyl exponent (an exponent of `ℓ`); the exponent of weight elimination at step `j` and its bound | CongruenceModulesOfThetaLifts §7.15, CongruenceModulesOfThetaLifts §7.16a (3) |
| `La, e_D` | `log(a·rd_E)`; the exponent of the per-lift division error, `e_D = 1` | ThetaChainsOnDefiniteUnitaryGroups §2.1, 8.22 |
| `t_u, A_top` | top term of the height of `B_u`; `Σ_{τ∈Φ_top} a_τ` | 8.7 |
| `T_br` | the common value of `\|s(t_τ)\|²·s(g_τ)` in 8.7 (a) | 8.7 |
| `A_g, A_R` | absolute constants of the hook bound | 8.8 |
| `h_u` | explicit height of `B_u` | 8.9 |
| `𝓕_τ, M^W_j, λ^W_j` | flat line; step lattice on the Shimura variety of `U(W_j)`; its weight | ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.11, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19 |
| `q_z` | the number of the jet bound on the deep cover of a step | ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18c |
| `SizeGen, SizePage` | size predicates: (N1)–(N2) of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a; (P1)–(P5) of 8.20 | ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a, 8.20 |
| `B_all` | the finitely generated Hecke-stable module of forms of a step in the index target 8.19e (b) | 8.19e |
| `L` (in 8.20) | the logarithmic size of the theta data (`L = x^ε` in the chain) | 8.20 |
| `D^±_j, a^±_{j,τ}, D^H_j` | the two diagrams of step `j` (rows `a⁺_{j,τ,i} = s⁺_i + w_j − (p_j − 1 − i) − (t + 1)/2`, `a⁻_{j,τ,c} = e′_{j+c} − w_j − c − (t + 1)/2`, all `≥ 1`) and their total sizes; `D^H_j = D⁺_j + D⁻_j`, the type-prime term of the bulk (`F_j = −D^H_j/2` above the type primes), equal to `DF(λ^W_j)` by the definitions of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19 and LocalGainOfThetaChains §4.9f (d) | LocalGainOfThetaChains §4.9f (d), ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19 |
| `𝔰_j, n_j(v), E_j(v), ϵ_j(v)` | the scalar of step `j` and its exponents; an admissible exponent at `v` and its normalised excess over the valuation of `𝔰_j` | 8.20 |
| `𝒜_j^0, M_0, M′_0, Z_j^0, P_jM, ℐ_j(𝔭), D_V^{all}` | at a twisted place: the base-level part of the forms on `U(V_j)`, its `∇`- and `Δ`-valued lattices, its lifted subspace, the projected lattice, its signed dual index; a common multiple of the stabiliser orders; in 8.20–8.21 `η_j(𝔭)`, `𝔧_j(𝔭)` are taken at the base level | 8.20 |
| `ig_j(v)` | the index growth of the twist | 8.20b |
| `Tr_j(U, ψ), Th_j(δ_ℓ; U, ψ); 𝒞(W_j)_𝕃, j_σ` | the traced short theta series of a run; the traced adelic theta series of the tuple `δ_ℓ`; the rational forms on `U(W_j)` and their realisation at an embedding `σ` | 8.20b; RowTowerAndRallisIdentities §5.10a |
| `F_tot, s^{st}_j, δ_G` | bulk divisibility; slope bound of the step lattice; multiplicity deviation | 8.21 |
| `E_tot(u)` | total cost of the steps | 8.23 |
| `d(ℓ), d_l(𝔭)` | the integrality defect of the bottom norms at `ℓ`; `d(ℓ)·v_𝔭(ℓ)` for `𝔭 \| ℓ` | 8.24b, 8.24a |
| `κ_W` | the constant of the wild-kernel budget (CongruenceModulesOfThetaLifts §7.11); a good twisting datum (CongruenceModulesOfThetaLifts §7.10a) and the wild-kernel budget are conditions on the data | CongruenceModulesOfThetaLifts §7.10a, CongruenceModulesOfThetaLifts §7.11 |

**Statements of the formal proof.** Where a target names [FormalProof], the form that proof establishes is recorded at the target: its
hypotheses, ranges and constants are those of the proof, including restrictions that the route written here does not
visibly use. A wider or sharper form stated beside it is this roadmap's own, proved by the route written here, and is not in
[FormalProof].

## Layer 7: Division of the source and the glued target

At each place `𝔭` the period is divisible by the accumulated gain for the tuple `ξ_𝔭` used there; the target lattice
is glued place by place from the images of the integral forms of those tuples, so the divided source lattice pairs
integrally with its dual (7.12–7.14). The pairing is one and the same for all tuples, while the glued lattice is taken at
each place from the tuple for which the gain is proved there. The hypotheses of RowTowerAndRallisIdentities §5.8, on which
the rational structure of the target rows rests, and those of SeesawForThetaChains §6.14, on which the rationality of the
period pairing rests, enter through 7.13 and 7.14.

*Notation for this layer.* Fix a twisting datum (ThetaChainsOnDefiniteUnitaryGroups §2.5). A place `𝔭` of `𝕃` is *twisted* if `𝔭 ∈ Tw` (ThetaChainsOnDefiniteUnitaryGroups §2.5), that is if
`ξ_𝔭` is not the base tuple; then, `ℓ` being the residue characteristic of `𝔭`, `ξ_𝔭 = δ_ℓ·ψ_𝔭` with `δ_ℓ` the auxiliary
character of `ℓ` (`δ`, or `δ′` if `ℓ = p_δ`; it is unramified above `ℓ`) and `ψ_𝔭` of `ℓ`-power order (ThetaChainsOnDefiniteUnitaryGroups §2.5). `Q(ψ_𝔭)` is
the set of places of `E` at which `ψ_𝔭` is ramified, and `Q(ξ_𝔭) = A(ℓ) ⊔ Q(ψ_𝔭)` the set of twist places of `ξ_𝔭`, `A(ℓ)` the set
of places above the auxiliary prime of `ℓ` (ThetaChainsOnDefiniteUnitaryGroups §2.5).

### 7.12 Integrality after division

Let `𝕃′` be a number field, `c`
an automorphism of `𝕃′` (`c = id` allowed), `V` and `W` `𝕃′`-vector spaces and `B : V × W → 𝕃′` biadditive,
`𝕃′`-linear in `V` and `c`-semilinear in `W` (`B(φ, ax) = c(a) B(φ, x)`). Let `N ⊂ V` and `R ⊂ W` be `𝒪_{𝕃′}`-submodules
(no finiteness is needed; in 7.14 they are lattices). Suppose that
for every finite place `𝔭` of `𝕃′` there are a `𝕃′`-space `U_𝔭` with an `𝒪_{𝕃′}`-submodule `M_𝔭`, a `𝕃′`-linear map `j_𝔭 : U_𝔭 → W` with
`R ⊂ 𝒪_(c^{−1}(𝔭)) · j_𝔭(M_𝔭)`, a map `P_𝔭 : V × U_𝔭 → 𝕃′` and a `𝔭`-unit `ζ_𝔭` with `P_𝔭(φ, Υ) = ζ_𝔭 · B(φ, j_𝔭 Υ)`, and a
real `σ_𝔭` such that for `φ ∈ N`, `Υ ∈ M_𝔭` either `P_𝔭(φ, Υ) = 0` or `v_𝔭(P_𝔭(φ, Υ)) ≥ σ_𝔭`. Let `τ_𝔭 ∈ ℤ`, zero for almost
all `𝔭`, with `τ_𝔭 ≤ ⌈σ_𝔭⌉` for every `𝔭`, and `N′ := (∏_𝔭 𝔭^{−τ_𝔭}) · N`. Then `B(N′, R) ⊂ 𝒪_{𝕃′}`.

Route: fix `𝔮`, `x ∈ R`, `φ ∈ N` and `a ∈ ∏ 𝔭^{−τ_𝔭}`. Write `x = Σ_i d_i j_𝔮(Υ_i)` with `d_i ∈ 𝒪_(c^{−1}(𝔮))`, `Υ_i ∈ M_𝔮`;
then `c(d_i) ∈ 𝒪_(𝔮)` and `B(φ, x) = ζ_𝔮⁻¹ Σ_i c(d_i) P_𝔮(φ, Υ_i)` has `v_𝔮 ≥ ⌈σ_𝔮⌉` (valuations are integers), while
`v_𝔮(a) ≥ −τ_𝔮 ≥ −⌈σ_𝔮⌉`; so `v_𝔮(B(aφ, x)) = v_𝔮(a) + v_𝔮(B(φ, x)) ≥ 0`. This holds at every `𝔮`, and `N′` is spanned by
such `aφ`.

*Checks.* (i) Sharpness: `𝕃′ = ℚ`, `B(φ, x) = φx`, `N = 6ℤ`, `R = ℤ`, `M_p = ℤ`, `j_p = id`, `ζ_p = 1`:
`σ_2 = σ_3 = 1`; `τ_2 = τ_3 = 1` gives `N′ = ℤ` and `B(N′, R) = ℤ`, while `τ_2 = 2` gives `N′ = ½ℤ` and fails.
(ii) The division is paid at the same place: `𝕃′ = ℚ(i)`, `c` complex conjugation, `𝔭 = (2 + i)`, `B(φ, x) = φ·c(x)`, `N = 𝔭`,
`R = 𝒪`, `M = 𝒪`, `j = id`, `ζ = 1`: the values `B(N, R) = 𝔭` are divisible at `𝔭` and not at `c(𝔭)`; dividing by `𝔭`
(`τ_𝔭 = 1 ≤ ⌈σ_𝔭⌉ = 1`) gives `N′ = 𝒪` and integral values, whereas dividing by `c(𝔭)` gives the non-integral value
`(2 + i)/(2 − i)`. (iii) The localisation is at `c^{−1}(𝔭)`: in the same field with `N = 𝒪` (`σ = 0` everywhere) the lattice
`R = c(𝔭)^{−1}` lies in `𝒪_(𝔭)·𝒪` but not in `𝒪_(c(𝔭))·𝒪`, and `B(N, R) = 𝔭^{−1}` is not integral at `𝔭`.

*NEW* (elementary). Stated in `Suggested.lean` as `pairing_integral_of_localDivision`. It follows from [FormalProof],
`Formalism/QuotientMetricDivisors/DivIntoDualShift.lean` (`Formalism.DivisionValues.DivIntoDualShift`).
*Needs:* Mathlib
(`IsDedekindDomain`, valuations at maximal ideals, fractional ideals).

### 7.13 The divided source and the glued target

*Definitions.* Assume the hypotheses of RowTowerAndRallisIdentities §5.8, on which the rational structure
`𝔼_{1,𝕃}` rests (those of RowTowerAndRallisIdentities §5.8b for the grid of the chain, the size predicate `Size_□` of
RowTowerAndRallisIdentities §5.8e, the depth constant `C_F ≥ C_F⁰` and the scale `x ≥ x_F` of
RowTowerAndRallisIdentities §5.8, its gap hypotheses on the weight datum, the condition on `𝕃` there and the
hypotheses of RowTowerAndRallisIdentities §5.6), and those of RowTowerAndRallisIdentities §5.12. For a word `u` let

`I_u := ∏_𝔭 𝔭^{−⌊e_𝔭 𝔊_u(𝔭)⌋}` and `N′_u := I_u · N_u ⊂ M_u ⊗ 𝕃`,

the *divided source*, a Hermitian lattice with the Petersson metrics of ThetaChainsOnDefiniteUnitaryGroups §3.8 at every complex embedding of `𝕃` (the gain
exponent `𝔊_u(·)` of LocalGainOfThetaChains §4.9f (g) has finite support, `N_u ⊂ M_u` the gain sublattice of LocalGainOfThetaChains §4.16). Let `𝔼_{1,𝕃}` be the `𝕃`-structure (RowTowerAndRallisIdentities §5.8) of the target rows `𝔼` of the row type level (RowTowerAndRallisIdentities §5.3; the rows of SeesawForThetaChains). For a
tuple `ξ` let `Λ_ξ ⊂ 𝔼_{1,𝕃}` be the `𝒪_𝕃`-span of `ι_ξ(M̃_ξ ∩ ℋ^{rt}_ξ)`, `M̃_ξ` the lattice of `∇`-valued
integral forms of RowTowerAndRallisIdentities §5.4 (equivalently the span of `ι_ξ(proj_{Q_ξ}(M̃_ξ ∩ ℋ^{rt}_ξ))`, since `ι_ξ` kills `ℋ^{rt}_ξ ∩ ker ι_ξ`). The *glued
target* is

`R := { x ∈ 𝔼_{1,𝕃} : for every finite place 𝔭 there is d ∈ 𝒪_𝕃 ∖ 𝔭 with d · x ∈ Λ_{ξ_𝔭} }`,

`ξ_𝔭` the tuple used at `𝔭` (ThetaChainsOnDefiniteUnitaryGroups §2.5; `ξ_𝔭 = 1` except at the finitely many twisted places), and the *target lattice* is the
lattice of `c_𝕃`-semilinear functionals integral on `R`,

`R^∨ := { λ : 𝔼_{1,𝕃} → 𝕃 additive : λ(ax) = c_𝕃(a)·λ(x) for a ∈ 𝕃, and λ(R) ⊂ 𝒪_𝕃 }`,

an `𝒪_𝕃`-lattice in the `𝕃`-space of `c_𝕃`-semilinear functionals (`(aλ)(x) := a·λ(x)`). The functionals are
semilinear because, under the hypotheses of SeesawForThetaChains §6.14 as well (among them that the Bessel–Poincaré series
of every word `u` is nonzero on its new forms `M_u`), the pairing `B_u(φ)` takes values in `𝕃` on `𝔼_{1,𝕃}` and is `c_𝕃`-semilinear in the row
(SeesawForThetaChains §6.15(a)); so `B_u` is then an `𝕃`-linear map from `M_u ⊗ 𝕃` to this space. At a complex embedding `σ` of `𝕃`, `λ ⊗ 1` is the conjugate-linear functional
`x ⊗ z ↦ conj(z)·σ(λ(x))` on `𝔼_{1,𝕃} ⊗_{𝕃,σ̃} ℂ`, `σ̃ := conj∘σ∘c_𝕃` (so `σ̃₀ = σ₀`), and `R^∨` carries at `σ` the norm dual
to the metric of `𝔼_{1,𝕃}` at `σ̃`, the metrics of `𝔼_{1,𝕃}` being those of RowTowerAndRallisIdentities §5.12 divided by the order `|P_1|` of the level
group of the part (by `|P_0|` on `𝔼_0`), so that `ι_1^*ι_1 = 𝔫·∏_jλ_j` for the form `X_1` of RowTowerAndRallisIdentities §5.12. At `σ₀` this space of
conjugate-linear functionals is identified `ℂ`-linearly with `𝔼` by `y ↦ ⟨·, y⟩` (Hermitian products are conjugate-linear
in the first variable), and the dual norm is the norm of `y`. Since `σ ↦ σ̃` permutes the embeddings, the bijection
`λ ↦ c_𝕃∘λ` onto the lattice of `𝕃`-linear functionals integral on `R`, with its dual metrics, is `c_𝕃`-semilinear and
isometric from `σ` to `σ̃`: the two have the same degree and the same slopes, and `μ_min(R^∨) = −μ_max(R)`
(SlopesOfHermitianVectorBundles §2.2 for the linear dual). The same
definitions in the part `𝔼_0 = 𝔼_{(P_0,χ_{P_0})}` of the base level, with the relevant part `𝒰^{(0)}_ξ` of that level (RowTowerAndRallisIdentities §5.4),
give `Λ_ξ^{(0)}`, `R_0 ⊂ 𝔼_{0,𝕃}` and `R_0^∨`.

*Theorem.* (i) Each `Λ_ξ` is a lattice of full rank in `𝔼_{1,𝕃}`; `R` is a lattice of full rank, and
`R_(𝔭) = (Λ_{ξ_𝔭})_(𝔭)` for every `𝔭`; `R^∨` is a lattice of full rank; the same holds for `R_0`. (ii) `rk N′_u = d_u`, and
`N′_u` and `N_u` differ by the invertible ideal `I_u`; so every global invariant of `N′_u` (rank, slope) is the one computed
with this ideal.

Route: (i) `M̃_ξ ∩ ℋ^{rt}_ξ` is a full lattice of the `𝕃`-rational subspace `ℋ^{rt}_ξ` (a lattice meets a rational subspace in a
full lattice of it); `ι_ξ` is `𝕃`-rational (RowTowerAndRallisIdentities §5.8) and maps `ℋ^{rt}_ξ` onto `𝔼_{1,𝕃}` (RowTowerAndRallisIdentities §5.6, RowTowerAndRallisIdentities §5.12), so `Λ_ξ` is finitely generated and
spans; the `Λ_{ξ_𝔭}` agree with `Λ_1` at almost all `𝔭`, and the gluing of lattices from local data in module form
(HermitianFormsAndLattices §4.0(g)) gives `R` with the stated localisations; the dual of a full lattice is a full lattice.
(ii) `N_u` has finite colength in `M_u` at every place (LocalGainOfThetaChains §4.16).

Where `c_𝕃` enters: `B_u` is linear in the column and `c_𝕃`-semilinear in the row (SeesawForThetaChains §6.15(a)), so dividing the source at `𝔭`
is paid by the valuation of the period at `𝔭` itself (7.12, Check (ii)), while the target must be generated near `c_𝕃(𝔭)` by
the integral forms of the tuple used at `𝔭` (7.12, Check (iii)); the glued target has this property because
`ξ_{c_𝕃(𝔭)} = ξ_𝔭` (ThetaChainsOnDefiniteUnitaryGroups §2.5). LocalGainOfThetaChains §4.16(ii) bounds the valuation at `𝔭` by the gain exponent at `𝔭` (`⌊e_𝔭𝔊_u(𝔭)⌋`), so the ideal paid
is `I_u`. The ledger entries above `T(u)` (at the places above `π_u`) and above `g₀`, `g₁` (at the places above one of the two
primes of `K` over each, LocalGainOfThetaChains §4.9f (e)) are not `c_𝕃`-invariant, so `I_u` and `c_𝕃(I_u)` differ there; they have the same norm.

*Check.* With no twisted place (`ξ_𝔭 = 1` for all `𝔭`) the definition gives `R = Λ_1`, the lattice spanned by the images
of the integral forms of the base tuple.

*NEW* (objects). The definitions: [FormalProof], `Formalism/LocalRingCardinality/DataDIVDefs.lean`
(`Formalism.BasicNotions.DV.NprimeDef`), `Formalism/LocalRingCardinality/DataDIVDefs.lean` (`Formalism.BasicNotions.DV.RRDef`),
`Formalism/LocalRingCardinality/DataArith.lean` (`Formalism.BasicNotions.DivData.cc`); (i): [FormalProof],
`Formalism/LocalToGlobal/IndefiniteForms/IndefUse.lean` (`Formalism.L2.Indef.IndefRows.RR_spec`),
`Formalism/QuotientMetricDivisors/LatticeGlueUnique.lean` (`Formalism.DivisionValues.LatticeGlue`),
`Formalism/HarderNarasimhan/HarderNarasimhanProofs/DualPl.lean` (`Formalism.HN.DualPolygon.dualLat_fg`).
*Needs:* LocalGainOfThetaChains §4.9f, LocalGainOfThetaChains §4.16, ThetaChainsOnDefiniteUnitaryGroups §3.8, RowTowerAndRallisIdentities §5.4, RowTowerAndRallisIdentities §5.6, RowTowerAndRallisIdentities §5.8, RowTowerAndRallisIdentities §5.8d, RowTowerAndRallisIdentities §5.8e, RowTowerAndRallisIdentities §5.12, ThetaChainsOnDefiniteUnitaryGroups §2.5, SeesawForThetaChains §6.15; HermitianFormsAndLattices §4.0(g);
SlopesOfHermitianVectorBundles §2.2.

### 7.14 The period pairing on the divided source

For every word `u`, under the hypotheses of LocalGainOfThetaChains §4.16(ii) (and of LocalGainOfThetaChains §4.16b at the places above
`T(u)`), of RowTowerAndRallisIdentities §5.5 for every step, of RowTowerAndRallisIdentities §5.8 and RowTowerAndRallisIdentities §5.12 (as in 7.13), and of
SeesawForThetaChains §6.14 (among them that the Bessel–Poincaré series of every word `u` is nonzero on its new forms `M_u`), `B_u(N′_u) ⊂ R^∨`: `B_u(φ)(x) ∈ 𝒪_𝕃` for all `φ ∈ N′_u` and
`x ∈ R` (each `B_u(φ)` is a `c_𝕃`-semilinear functional, SeesawForThetaChains §6.15(a)).

Route: if `B_u = 0` there is nothing to prove. Otherwise apply 7.12 with `𝕃′ = 𝕃`, `c = c_𝕃`, `V = M_u ⊗ 𝕃`, `W = 𝔼_{1,𝕃}`,
`B = B_u` (SeesawForThetaChains §6.15(a)), `N = N_u`, and at each `𝔭`: `U_𝔭 = ℋ^{rt}_{ξ_𝔭}`, `M_𝔭 = M̃_{ξ_𝔭} ∩ ℋ^{rt}_{ξ_𝔭}` (the `∇`-valued integral
forms of RowTowerAndRallisIdentities §5.4), `j_𝔭 = ι_{ξ_𝔭}`, `P_𝔭(φ, Υ) = P̃_{ξ_𝔭}(φ, Υ)` and `ζ_𝔭 = ζ(u, ξ_𝔭)`, a root of unity in `𝕃` (SeesawForThetaChains §6.14(c),
SeesawForThetaChains §6.15(b)); `R ⊂ 𝒪_(c_𝕃(𝔭)) j_𝔭(M_𝔭)` by 7.13(i) at `c_𝕃(𝔭)`, since `ξ_{c_𝕃(𝔭)} = ξ_𝔭` (ThetaChainsOnDefiniteUnitaryGroups §2.5). The valuation bound is LocalGainOfThetaChains §4.16(ii)
(with LocalGainOfThetaChains §4.16b at the places above `T(u)`) for the tuple `ξ_𝔭` and the forms `Υ ∈ M̃_{ξ_𝔭} ∩ ℋ^{rt}_{ξ_𝔭}`, whose values lie in the
dual Weyl lattices (RowTowerAndRallisIdentities §5.4; ThetaChainsOnDefiniteUnitaryGroups §3.1, ThetaChainsOnDefiniteUnitaryGroups §3.9 (b): the column side is `Δ`-valued): the period is linear in the column, so the bound at `𝔭`
uses the column at `𝔭`, `σ_𝔭 = ⌊e_𝔭 𝔊_u(𝔭)⌋`. Here the column chain and the lattice into which the point map sends the top
column lattice are `Δ`-valued while `Υ` is `∇`-valued, so the period is `Σ_𝒸|Γ_𝒸|^{−1}y_𝒸` with every class term `y_𝒸`
integral; the only loss is `v_ℓ(D_Γ)` (`D_Γ` the least common multiple of the stabiliser orders, ThetaChainsOnDefiniteUnitaryGroups §3.6), a summand of the error
of every step at every place not above the level prime (LocalGainOfThetaChains §4.9f (e)), `m·v_ℓ(D_Γ)` in total, with `log D_Γ ≤ C·f·N_m·log(f·N_m)`. Then
`τ_𝔭 := ⌊e_𝔭 𝔊_u(𝔭)⌋ = σ_𝔭` is the exponent of `𝔭` in `I_u⁻¹` (7.13). The pairing `B_u` is one and the same for all tuples, while the lattice `R` is taken at each place from
the tuple for which the gain is proved there: no single tuple would give integrality at every place.

*NEW*. The statement is [FormalProof], `Formalism/LocalRingCardinality/DataArith.lean`
(`Formalism.BasicNotions.DivData.OneMapIntoCC`), `Formalism/SharpRestriction/GlobalTheoremInputs.lean`
(`Formalism.MainNotions.LinkDIV_at`).
*Needs:* LocalGainOfThetaChains §4.9f, LocalGainOfThetaChains §4.10, LocalGainOfThetaChains §4.10a, LocalGainOfThetaChains §4.16, LocalGainOfThetaChains §4.16b, SeesawForThetaChains §6.14, SeesawForThetaChains §6.15, 7.12, 7.13; ThetaChainsOnDefiniteUnitaryGroups §2.5, ThetaChainsOnDefiniteUnitaryGroups §3.9, ThetaChainsOnDefiniteUnitaryGroups §3.10, RowTowerAndRallisIdentities §5.4, RowTowerAndRallisIdentities §5.5, RowTowerAndRallisIdentities §5.6, RowTowerAndRallisIdentities §5.8, RowTowerAndRallisIdentities §5.8d, RowTowerAndRallisIdentities §5.8e, RowTowerAndRallisIdentities §5.12.

### Examples

- Over `ℚ` with `B(φ, x) = φx`, `N = 6ℤ`, `R = ℤ`, `M_p = ℤ`, `j_p = id`, `ζ_p = 1`: `σ_2 = σ_3 = 1`, and `τ_2 = τ_3 = 1` gives `N′ = ℤ`
  with `B(N′, R) = ℤ`, while `τ_2 = 2` gives `N′ = ½ℤ` and the conclusion fails (7.12, Check (i)).
- In `ℚ(i)` with `c` complex conjugation, `𝔭 = (2 + i)` and `B(φ, x) = φ·c(x)`: for `N = 𝔭`, `R = 𝒪`, dividing by `𝔭` gives
  `N′ = 𝒪` and integral values, while dividing by `c(𝔭)` gives the value `(2 + i)/(2 − i)`; for `N = 𝒪`, the lattice `R = c(𝔭)^{−1}` lies
  in `𝒪_(𝔭)·𝒪` but not in `𝒪_(c(𝔭))·𝒪`, and `B(N, R) = 𝔭^{−1}` is not integral at `𝔭` (7.12, Checks (ii), (iii)).
- With no twisted place the glued target is `R = Λ_1`, the lattice spanned by the images of the integral forms of the
  base tuple (7.13, Check).

### Dependencies

ThetaChainsOnDefiniteUnitaryGroups §§2.5, 3.1, 3.6, 3.8, 3.9, 3.10; LocalGainOfThetaChains §§4.9f, 4.10, 4.10a, 4.16, 4.16b;
RowTowerAndRallisIdentities §§5.3, 5.4, 5.5, 5.6, 5.8, 5.8b, 5.8d, 5.8e, 5.12; SeesawForThetaChains §§6.14, 6.15;
HermitianFormsAndLattices §4.0 (g); SlopesOfHermitianVectorBundles §2.2; ReductiveGroups §10B; Mathlib's Dedekind domains, valuations at maximal
ideals and fractional ideals (7.12).

## Layer 8: Heights and the slope of the target

The height of the period pairing is bounded through its factorisation into the `m` step operators, the top period
and the descent (8.1). Each step operator is a class sum of Taylor blocks of theta functions of CM abelian
varieties; in the Fock model its norm at an embedding is `Σ ph(ν) − (Σ ν)·log Ω_{τ,σ}` up to polynomial factors
(8.2–8.4), the period entering through the ratio of the Fock coordinate to an algebraic coordinate, and averaging
over the embeddings replaces `Ω_{τ,σ}` by the one CM period `Ω` of the Conventions (8.5c, 8.6, through ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.5). The top period is a
scaled branching map whose norm carries exactly `T(u)^{−a_τ}` at each top place (8.7); the descent is scalar on
isotypic parts with the Rallis eigenvalues of RowTowerAndRallisIdentities §5.10, bounded below by hook products (8.8); together they give the
explicit height of the period pairing (8.9). The slope of the target is bounded through the lattices of integral cusp
forms on the unitary Shimura varieties of `U(W_j)` (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §§8.11–8.19d), with the local terms of the glued target at the
twisted places (8.19e–8.20b) and the gluing lemma (8.21). In the division inequality (8.22) the large powers of `Ω`
cancel between the kernels and the step lattices, the Stirling terms cancel against the hooks (8.10), and one row of
length `a_τ` per top place and per lift survives. The maximal slope of the target is bounded by a slope test whose
finite-place terms are valuations of ratios of Hecke `L`-values, controlled by the twist selection of CongruenceModulesOfThetaLifts §7.8
through toric sums (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §§8.19b–8.19d; 8.24a, 8.24).

In this layer, `La = log(a·rd_E)` (ThetaChainsOnDefiniteUnitaryGroups §2.1); `C` denotes positive constants that do not depend on `x` nor on anything
chosen at the scale `x`; they may depend on `ε` and on the constants fixed before `ε`; a constant in an exponent of `x`
that multiplies `ε` is absolute; the exponent `C` of `x^{C}·b` (8.24) is chosen after `ε`, like the exponent `c_H` of the
Conventions. The
exponent of the division error is `e_D := 1` (8.20, 8.22, 8.24). Heights of maps are `ht = mean_σ log ‖·‖²_σ` over the
embeddings `σ : 𝕃 → ℂ` (Conventions); since the metrics are compatible with complex conjugation, this is also the mean
over the infinite places of `𝕃`. Operator norms are taken for the metrics named in each statement.

The congruence lengths at the base level (CongruenceModulesOfThetaLifts §7.1 (4)) are bounded by CongruenceModulesOfThetaLifts §7.11 at the base level under its hypotheses: the twisting datum is good (CongruenceModulesOfThetaLifts §7.10a: every `ψ_𝔭` an
`ℓ^{−2}`-good twist at `𝔭` in the sense of CongruenceModulesOfThetaLifts §7.8 (2), here for a family of polynomial conditions, of the second kind of SelmerLengthBoundsAndLocalLifting §3.25b (2),
containing those of 8.19e (a) and (b); the tuples at `𝔭` and `c_𝕃(𝔭)` agree by ThetaChainsOnDefiniteUnitaryGroups §2.5), and the host has wild-kernel budget `κ_W`
(CongruenceModulesOfThetaLifts §7.11: every `Ш¹(E, ℓ, e)` (`ℓ` prime, `0 < e < t`) is finite and `V(E, t) ≤ κ_W·x^ε·B₀`; `κ_W = 1` when `V(E, t) ≤ b`), with the depth hypothesis of CongruenceModulesOfThetaLifts §7.10a (for every prime `ℓ ≥ 11` some `j ≥ 0` has
`(ℓ − 1)^j ≥ ℓ_A` and `2j + 2 ≤ L_th`, `L_th` the length of the thick set) and the length bound `L_th ≤ C_L·log x` of
CongruenceModulesOfThetaLifts §7.10c (`C_L` fixed before `ε`; the constant of CongruenceModulesOfThetaLifts §7.11 depends only on `C_L`, `C_t`, `A_max`); the
multiplicity identity at the base level, `d^{Z,P_0}_j(𝔭) = d^{Z,P_0}_j = D_0` (CongruenceModulesOfThetaLifts §§7.5b, 7.8a), rests on
CongruenceModulesOfThetaLifts §7.5a. They enter through 8.20 (v) and are hypotheses of every target
of this layer whose bound uses the congruence lengths (8.20, 8.22, 8.24 (b)); the goodness of the twisting datum alone is used in
8.20b and 8.24a (c), through the definition of a good twist. The Weyl exponents of CongruenceModulesOfThetaLifts §7.15
are bounded per step by CongruenceModulesOfThetaLifts §7.16a (3); they enter through 8.20b. The structures `𝔼_{1,𝕃}`, `R_0`, `R` of RowTowerAndRallisIdentities §5.8 and 7.13 rest
on the hypotheses of RowTowerAndRallisIdentities §5.8: those of RowTowerAndRallisIdentities §5.8b for the grid of the
chain; the size predicate `Size_□` of RowTowerAndRallisIdentities §5.8e; a depth constant `C_F ≥ C_F⁰` of the grid,
`C_F⁰ ≥ 6510` an absolute constant fixed before `ε` and not made explicit; a scale `x ≥ x_F`, `x_F ≥ x₀` depending on `ε`
and `C_F`; the gap hypotheses of its statement (an interlaced weight datum with `e_l(τ) − e′_l(τ) ≥ (t + 3)/2` and
`e′_{l+1}(τ) − e_l(τ) ≥ (t + 3)/2`, consecutive entries of the row parameter `(v(τ); −e′(τ))` at least `100r⁴` apart, and
`e′_{l+1}(τ) − e′_l(τ) ≥ max(256r⁴, 4N_m³ + 2t + 6)`); the condition (L1)–(L7) on `𝕃`; and the hypotheses of
RowTowerAndRallisIdentities §5.6. Every target of this layer that uses these structures carries all of them by
reference (8.9, 8.20–8.22, 8.24a, 8.24c, 8.24): where such a target writes 'a scale `x ≥ x₀` with the size predicate
`Size_□`', the constant `C_F ≥ C_F⁰`, the scale `x ≥ x_F` and the gap hypotheses are included. The statements of
8.24a, 8.24c and 8.24 have thresholds of their own for `C_F` and for `x` (absolute, resp. depending on `ε` and `C_F`;
none is made explicit in [FormalProof]); `C_F⁰` and `x_F` denote thresholds above all of them, and the chain takes one
`C_F ≥ C_F⁰` before `ε`. The targets that apply ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19b (8.19e (a), 8.24a, 8.24, and 8.20
through them) assume, as §8.19b does, that `d` is prime (`K = ℚ(√−d)`) and that `2` is ramified in `E`. Those that apply
ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §§8.11–8.19d (8.19e, 8.20–8.22, 8.24a, 8.24) are stated in the setting of those targets:
`K = ℚ(√−d)` for a prime `d ≡ 7 (mod 16)` and `E` unramified over `F` at every finite place (the hosts of the chain are of this kind).

Some clauses of this layer are statements whose routes are not given, or not given in full, here: the three
statements on the lattices of the chain, the statements (c2), (c3) on covers, and the distribution relation behind 8.19e
(c); the generation inputs 8.20 (vii)
(a)–(g); three inequalities of (P3) for the weights of a run (8.20); the passage to geometrically irreducible
components in 8.20 (o); in 8.24b the class representatives, the presentation of the kernel at a prime and the count of
classes; the proofs of 8.24d (a) beyond ThetaChainsOnDefiniteUnitaryGroups §3.1c and of 8.24e; and in 8.24c the bounds
of the factors of the test values and the archimedean bound of the conjugates. Through ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties the targets also rest on clauses of that roadmap whose routes are not given there,
among them the flag facts (L3), (L4) of the `𝔩`-torsion (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.14b) and, on the deep covers of the steps, the carrying sections, the
sizes and the sup norms of integral forms (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18c (f)). All numbers attached to the flag bundles in ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §§8.15–8.19 (limit numbers, volumes, volume slopes)
are computed on the models of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.15 (a), built over the modified base models `Y_B(c)`.

The top period is the one of ThetaChainsOnDefiniteUnitaryGroups §3.9: `P̃(φ′, Υ) = ⟨Υ, res φ′⟩_{X^h}`, linear in the form `φ′` of level `m` (hence in the
column) and conjugate-linear in the row form `Υ`; a bound at a place `𝔭` uses the column at the same place.

### 8.1 The height of a map that factors through a chain

*Statement.* Let `𝕃` be a number field and let `S_0, …, S_m`, `V`, `𝒯` be
finite-dimensional `𝕃`-vector spaces carrying a positive definite Hermitian form at every embedding `σ : 𝕃 → ℂ`;
let `P : V → Q` be a surjection, `Q` carrying the quotient forms; let `K_j : S_{j−1} → S_j` (`1 ≤ j ≤ m`),
`Pt : S_m → V^∨` and a bijection `ι : Q → 𝒯` be `𝕃`-linear. Suppose `Q = ⊕_π Q_π` is a finite decomposition into
`𝕃`-subspaces such that, at every `σ`, `ι_σ^* ι_σ` acts on `Q_{π,σ}` by the scalar `κ(σ)·∏_{j=1}^m λ_j(π, σ)` with
`κ(σ) > 0` and `λ_j(π, σ) > 0`. If `B : S_0 → 𝒯^∨` satisfies `B(φ)(ι(P F)) = Pt(K_m ⋯ K_1 φ)(F)` for all `φ ∈ S_0`,
`F ∈ V`, and `B ≠ 0`, then at every `σ`

`log ‖B‖²_σ ≤ log ‖Pt‖²_σ + Σ_j log ‖K_j‖²_σ − log κ(σ) − min_π Σ_j log λ_j(π, σ)`,

and therefore `ht(B) ≤ ht(Pt) + Σ_j ht(K_j) − mean_σ log κ(σ) − mean_σ min_π Σ_j log λ_j(π, σ)`. Here `𝒯^∨` and `V^∨`
carry the dual forms. The same holds, with the same proof, when `V^∨` and `𝒯^∨` are replaced by the spaces of
`c`-semilinear functionals (`ℓ(ay) = c(a)ℓ(y)`) for an automorphism `c` of `𝕃`, the norm of such a functional at `σ` being
`sup_y |σ(ℓ(y))|/‖y‖_{σ∘c}`, and with `κ(σ∘c)`, `λ_j(π, σ∘c)` in place of `κ(σ)`, `λ_j(π, σ)` in the pointwise bound; `σ ↦ σ∘c`
permutes the embeddings, so the bound for `ht(B)` is unchanged.

*Route.* For `q ∈ Q` and any `F` with `P F = q`, `|B(φ)(ιq)| ≤ ‖Pt‖·∏_j ‖K_j‖·‖φ‖·‖F‖`; minimising over `F` gives
the quotient norm `‖q‖`. The operator `ι_σ^*ι_σ` is self-adjoint, so its eigenspaces for distinct eigenvalues are
orthogonal, and grouping the `Q_π` by eigenvalue gives `‖ιq‖² ≥ min_π κ∏_jλ_j(π)·‖q‖²`. Hence the dual norm of
`B(φ)` is at most `‖Pt‖∏_j‖K_j‖·‖φ‖·(min_π κ∏_jλ_j(π))^{−1/2}`; take logarithms and average over `σ`. For semilinear
functionals the same chain of inequalities holds with the norms of `F`, `q` and `ιq` taken at `σ∘c`.

*Check.* `m = 1`, `S_0 = S_1 = 𝕃` with the standard form and `K_1 = id`, `V = Q = 𝒯 = 𝕃²` with `P = id`, `Q_1, Q_2` the
coordinate lines, `ι` multiplying squared norms by `1` on `Q_1` and by `4` on `Q_2` (so `κ = 1`, `λ_1 = 1` on `Q_1` and `4` on
`Q_2`), `Pt : S_1 → V^∨` sending `1` to the first coordinate functional, so that `B(1)(ιF) = F_1`: then
`‖B‖² = 1 = ‖Pt‖²·‖K_1‖²/1`. With `max_π` in place of `min_π` the bound would read
`‖B‖² ≤ 1/4`, which is false.

*KNOWN* in kind (submultiplicativity of operator norms; the archimedean operator-norm analogue of HeightsAndUnits §0.3), *NEW* as packaged.
It follows from [FormalProof], `Formalism/QuotientMetricDivisors/HeightBoundExactNorms.lean`
(`Formalism.DivisionValues.HeightBoundConstant`), `Formalism/LocalToGlobal/Divisibility/DivisionHeightBoundStatement.lean`
(`Formalism.L2.DIV.complex_height_cast_at`).
*Needs:* SlopesOfHermitianVectorBundles
§1.3 (operator norms and heights of linear maps, quotient and dual metrics).

### 8.2 Taylor blocks in the Fock model

*Statement.* Let `ι` be a finite set partitioned as `ι = ⊔_{τ∈P} ι_τ`, `N = |ι|`, and let
`Th : ℂ^ι → ℂ` be entire with Taylor coefficients `c_e` (`e ∈ ℕ^ι`) and `|Th(u)| ≤ S·e^{|u|²/2}`.

(a) *Reproducing identity.* `∫_{ℂ^ι} Th(u)·ū^e·e^{−|u|²} du = π^N·e!·c_e` for every `e`.

(b) *Gaussian maximum.* For `y ≥ 0`, `sup_{s≥0} s^y e^{−s²/2} = exp(ph(y)/2)` (with `0⁰ = 1`). If `s_1, …, s_R ≥ 0` are
functions on `ℂ^ι` with `Σ_i s_i(u)² = |u|²` and `ν_i ≥ 0`, `n = Σ_i ν_i`, then
`π^{−N}∫_{ℂ^ι} ∏_i s_i^{ν_i}·e^{−|u|²/2} du ≤ e^{1/2}·(2n + 2)^N·exp(Σ_i ph(ν_i)/2)`.

(c) *Taylor blocks.* Let `R(ū) = Σ_e ū^e A_e` be a polynomial in the conjugate variables with values in a
finite-dimensional normed space, homogeneous of degree `n_τ` in the variables of `ι_τ`, with
`‖R(ū)‖ ≤ ∏_τ ∏_i s_{τ,i}(u_τ)^{ν_{τ,i}}`, where `s_{τ,i} ≥ 0`, `Σ_i s_{τ,i}(u_τ)² = |u_τ|²`, `Σ_i ν_{τ,i} = n_τ`; let
`λ_τ ∈ ℂ^×` with `|λ_τ|² = Ω_τ^{−1}`, and `n = Σ_τ n_τ`. Then

`‖Σ_e c_e·e!·(∏_{x∈ι} λ_{τ(x)}^{e_x})·A_e‖² ≤ S²·∏_τ Ω_τ^{−n_τ}·e·(2n + 2)^{2N}·exp(Σ_{τ,i} ph(ν_{τ,i}))`.

The left side is the block of Taylor coefficients of `Th` selected by `R` in the rescaled coordinates `z_τ = u_τ/λ_τ`.

*Route.* (a) Monomials are orthogonal for `e^{−|u|²}du` with `‖u^e‖² = π^N e!`; integrate on polydiscs and pass to the
limit by dominated convergence, which the growth bound allows. (b) The maximum is at `s = √y`. With
`θ = 1/(n + 1)`, `∏_i s_i^{ν_i} e^{−(1−θ)|u|²/2} ≤ (1 − θ)^{−n/2} exp(Σ ph(ν_i)/2) ≤ e^{1/2} exp(Σ ph(ν_i)/2)`, and
`π^{−N}∫ e^{−θ|u|²/2} = (2/θ)^N`. (c) By (a) the vector on the left is `π^{−N}∫ Th(u)e^{−|u|²}R(λ·ū) du`, where
`λ·ū` multiplies the conjugate variables of the block `ι_τ` by `λ_τ`; homogeneity gives `R(λ·ū) = ∏_τ λ_τ^{n_τ}R(ū)`, the
growth bound leaves the integral of (b), and squaring gives the claim. Applying (b) place by place gives instead the factor
`∏_τ e·(2n_τ + 2)^{2|ι_τ|}` in place of `e·(2n + 2)^{2N}` (in 8.4, `|ι_τ| = N_{j−1}N_j` and `n_τ = n_{j,τ}`).

*Check.* `N = 1`, `Th(u) = e^{u²/2}` (`S = 1`), `R(ū) = ū^{2n}` with `s_1(u) = |u|`, `ν_1 = 2n`: the left side is
`((2n)!/(2^n n!))²·Ω^{−2n} ∼ 2(2n/e)^{2n}Ω^{−2n}`, the right side `e(4n + 2)²(2n/e)^{2n}Ω^{−2n}`: the exponential factor
`exp(ph(2n))` is attained, so `ph` cannot be replaced by anything smaller.

*KNOWN* (Bargmann's reproducing formula), *NEW* in this form. (a): [FormalProof],
`Formalism/ThetaSupremumBounds/StatementA.lean` (`Formalism.DimensionVariation.FockJet`).
*Needs:* Mathlib (Gaussian integrals on `ℂ^n`,
power series of entire functions, dominated convergence).

### 8.3 Pointwise bounds for theta functions

*Statement.* Let `Λ ⊂ ℂ^g` be a lattice with `|λ|² ≥ πh` for every `0 ≠ λ ∈ Λ` (`h > 0`), and
let `Th` be entire on `ℂ^g` such that `|Th(z)|²e^{−|z|²}` is `Λ`-periodic. Then for every `z ∈ ℂ^g`

`|Th(z)|²·e^{−|z|²} ≤ (C(1 + g/h))^g · ∫_{ℂ^g/Λ} |Th(u)|²·e^{−|u|²} du`,

with `C` absolute. Consequently, if `Th = Σ_i α_i Th_i` is a finite combination of such functions (for lattices with
the same bound `h`), `|Th(u)| ≤ S·e^{|u|²/2}` with `S = Σ_i |α_i|·(C(1+g/h))^{g/2}‖Th_i‖_{L²(ℂ^g/Λ_i, e^{−|u|²})}`.

*Route.* `G(u) = Th(u)·e^{−⟨u, z⟩ + |z|²/2}` is holomorphic with `|G(z)|² = |Th(z)|²e^{−|z|²}` and
`|G(u)|² = |Th(u)|²e^{−|u|²}e^{|u−z|²}`. The sub-mean-value inequality for `|G|²` on the ball of radius `ρ = √g` about
`z` gives `|Th(z)|²e^{−|z|²} ≤ e^{ρ²}vol(B_ρ)^{−1}∫_{B_ρ(z)}|Th|²e^{−|u|²}`; by periodicity the ball covers each point
of `ℂ^g/Λ` at most `#(Λ ∩ B_{2ρ}) ≤ (1 + 4ρ/√(πh))^{2g}` times (disjoint balls of radius `√(πh)/2` about lattice
points), and `e^{g}g!/(π g)^g ≤ C^g`.

*KNOWN* (sub-mean-value estimates for theta functions). *Needs:* Mathlib (volumes of balls); Tau Ceti
`TauCeti.le_setAverage_ball_of_laplacian_nonneg` (the sub-mean-value inequality over balls, applied to `|G|²`, whose Laplacian
`4Σ_i|∂G/∂z_i|²` is nonnegative); SpecialFunctionsTheta Layer 7 (Riemann theta functions and their quasi-periodicity,
which satisfy the hypothesis).

### 8.4 The norm of a step operator

*Statement.* Fix a step `1 ≤ j ≤ m` and an embedding `σ : 𝕃 → ℂ`, and give the forms on
`U(X_{j−1})` and `U(X_j)` the Petersson forms of the Conventions. For `τ ∈ Φ` let `ν_{j,τ} = (ν_{j,τ,i})_i` be the row
lengths of the polynomial representation of `GL_{N_{j−1}}` through which `K_j` acts at `τ` (ThetaChainsOnDefiniteUnitaryGroups §3.4), `n_{j,τ} = Σ_i ν_{j,τ,i}`,
`|ν_j| := Σ_τ n_{j,τ}`, and `g_j = f·N_{j−1}N_j`. On the `σ`-conjugate of the CM abelian variety `A(L, L′)` of ThetaChainsOnDefiniteUnitaryGroups §3.1a, let
`z_τ` be the algebraic coordinates of ThetaChainsOnDefiniteUnitaryGroups §3.1a and put `u′ := √π·w`, `w` the Fock coordinates of ThetaChainsOnDefiniteUnitaryGroups §3.1a (in which `H_A` is the
standard form; so `u′_τ = √π·z_τ/√area(Λ_K^σ)`); `u′` is the coordinate in which `|Θ|²e^{−|u′|²}` is periodic for every
`Θ ∈ Th(L, L′)`. Let `Ω_{τ,σ} > 0` be defined by: `Ω_{τ,σ}^{−1}` is the squared Fock norm `π|x|²/area(Λ_K^σ)` of a generator
`x` of the `τ`-eigen-SUBmodule `ℓ_τ` of the integral tangent lattice `𝔞₀ ⊗_{𝒪_K} 𝒪_𝕃` of the variety (`𝔞₀` of ThetaChainsOnDefiniteUnitaryGroups §2.2(f),
`𝔞₀𝔞̄₀ = 𝔡_{E/K}^{−1}`; coordinates in which the lattice of the curve is `Λ_K`, `Δ(Λ_K) = 1`); equivalently `u′_τ = λ_{τ,σ}·z′_τ`,
`|λ_{τ,σ}|² = Ω_{τ,σ}^{−1}`, for the coordinate `z′_τ` with `z′_τ(x) = 1` (whose differential generates the `τ`-eigen-QUOTIENT of
the integral differentials). When `ℓ_τ` is not principal, only `mean_σ log Ω_{τ,σ}` is used, and it is twice the normalised
degree of the Hermitian line `(ℓ_τ, π|x|²/area(Λ_K^σ))`. For `E = K` and the curve `ℂ/Λ_K` this is `Ω_{τ,σ} = area(Λ_K^σ)/π`.
Let `Θ^σ_{𝒸,𝒸′}` be the `σ`-conjugate of the theta function `Θ_{𝒸,𝒸′}(ξ)` of ThetaChainsOnDefiniteUnitaryGroups §3.2 (a finite combination of Fock translates of
`Θ^{CM}_{L_𝒸,L′_{𝒸′}}`, ThetaChainsOnDefiniteUnitaryGroups §3.1d), `S_j(σ)` the least `S` with `|Θ^σ_{𝒸,𝒸′}(u′)| ≤ S·e^{|u′|²/2}` for all pairs of classes `(𝒸, 𝒸′)`, and
`h_{j−1}, h_j` the numbers of classes of the levels of ThetaChainsOnDefiniteUnitaryGroups §2.9 on `U(X_{j−1})`, `U(X_j)`. The kernel `k_j(𝒸, 𝒸′)` is read
through matrix coefficients: for unit vectors `v ∈ V_{Λ_{j−1}}`, `v′ ∈ V_{Λ_j}` (invariant forms of the Conventions), the
coefficient `⟨k_j(𝒸, 𝒸′)v, v′⟩` is the jet of the reading at the polynomial `u ↦ ⟨ρ(u)v, v′⟩` on `ℱ_j ≅ V_{Λ_{j−1}}^∨ ⊗ V_{Λ_j}`
(the identification by matrix coefficients of the invariant forms, which is the one of the defining formula of ThetaChainsOnDefiniteUnitaryGroups §3.2, not
the one that is isometric for the Fischer form). Then

`log ‖K_j‖²_σ ≤ Σ_{τ∈Φ} ( Σ_i ph(ν_{j,τ,i}) − n_{j,τ}·log Ω_{τ,σ} ) + E_j(σ)`,
`E_j(σ) := log(h_{j−1}h_j) + 2 log S_j(σ) + 1 + 2g_j·log(2|ν_j| + 2)`.

*Route.* By ThetaChainsOnDefiniteUnitaryGroups §3.2 the operator is `(K_jφ)(𝒸′) = Σ_𝒸 |Γ_𝒸|^{−1}ρ^ξ_j(t_𝒸)ρ′^ξ_j(t′_{𝒸′})·T(𝒸, 𝒸′)(φ(𝒸))` with character values of
absolute value `1` and `T(𝒸, 𝒸′)` the Taylor block of `Θ_{𝒸,𝒸′}(ξ)` selected by the matrix coefficients of the weight (ThetaChainsOnDefiniteUnitaryGroups §3.2
defines the step by jets, which is the matrix-coefficient identification). For unit
vectors, `|⟨ρ(u)v, v′⟩| ≤ ‖ρ(u)‖ = ∏_i s_i(u_τ)^{ν_{j,τ,i}}` at each `τ` (the singular values `s_i` of the
`N_j × N_{j−1}` matrix variable, by the singular value decomposition and unitarity of `ρ` on the unitary groups), which is
the domination hypothesis of 8.2 (c). 8.2 (c) bounds `‖T(𝒸, 𝒸′)‖²` by
`S_j(σ)²∏_τΩ_{τ,σ}^{−n_{j,τ}}e(2|ν_j| + 2)^{2g_j}exp(Σ ph)`. The Schur test of MathematicalStatisticsHighDimensional §1.4,
applied with its entrywise domination to the matrix of block norms of the kernel between class sets with weights
`|Γ_𝒸|^{−1} ≤ 1` gives `‖K_j‖² ≤ h_{j−1}h_j·max ‖T(𝒸, 𝒸′)‖²`.

*Check.* `N_{j−1} = N_j = 1`, one place, `ν = (n)`, `n` even: the matrix coefficient is `R(ū) = ū^n`; for
`Θ(u′) = e^{u′²/2}` (`S = 1`) the block is `c_n·n!·λ^n` with `|c_n·n!|² = (n!/(2^{n/2}(n/2)!))² ≈ √(2/(πn))·n!`, of the size
`exp(ph(n))` of the bound. The identification that is isometric for the Fischer form (unit vector `u′^n/√(n!)`) would
give a block of size `1`, and the hook products of 8.8 would then not be paid by the kernels.

*NEW* (the statement and its uniformity), *KNOWN* ingredients. It follows from [FormalProof],
`Development/AbelianVarietyTheory/Definitions/Divisors/FactorBounds.lean` (`GlobalTheory.ColRows.KerSide`).
*Needs:* 8.2, 8.3, ThetaChainsOnDefiniteUnitaryGroups §2.2, ThetaChainsOnDefiniteUnitaryGroups §2.9, ThetaChainsOnDefiniteUnitaryGroups §2.9a, ThetaChainsOnDefiniteUnitaryGroups §3.1, ThetaChainsOnDefiniteUnitaryGroups §3.1a, ThetaChainsOnDefiniteUnitaryGroups §3.1d, ThetaChainsOnDefiniteUnitaryGroups §3.2, ThetaChainsOnDefiniteUnitaryGroups §3.4; MathematicalStatisticsHighDimensional §1.4.

### 8.5c The mean period of the step kernels

For the host `E ⊃ K`, `K` of discriminant `−D` with `D > 4` (on the hosts of the chain `D = d ≥ 7`), the CM abelian varieties
of ThetaChainsOnDefiniteUnitaryGroups §3.1a and the coefficient field `𝕃` of ThetaChainsOnDefiniteUnitaryGroups §2.6: for every `τ ∈ Φ`,
`mean_σ log Ω_{τ,σ} = log Ω = log Ω_K − (1/[E:ℚ])·log N(𝔡_{E/K}) = log Ω_K − log(rd_E/√D)`, the mean over all
embeddings `σ : 𝕃 → ℂ` of the numbers `Ω_{τ,σ}` of 8.4, `𝔡_{E/K}` the relative different (`|d_E| = N(𝔡_{E/K})·D^{[E:K]}`).
ArakelovGeometryAndAbelianHeights §4.6 defines the `τ`-components of the height on the side of the differentials, and
ComplexMultiplicationAndExplicitReciprocityPartII §0.2 relates the total heights of induced types; the statement here is the
value per `τ`, on the tangent side, for a type induced from `K`.

*Route.* ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.5 (c) for the curve `ℂ/Λ_K` of 8.4 (the lattice `Λ_K` of ThetaChainsOnDefiniteUnitaryGroups §3.1a) gives `log Ω_K` for the mean of `log(area(Λ_K^σ)/π)`. The transport term comes
from the lattice of 8.4: the `τ`-eigen-submodule of `𝔞₀ ⊗_{𝒪_K} 𝒪_𝕃` (`𝔞₀` of ThetaChainsOnDefiniteUnitaryGroups §2.2(f), `𝔞₀𝔞̄₀ = 𝔡_{E/K}^{−1}`) is
`ℓ_τ = τ(𝔞₀𝔡_{E/K})𝒪_𝕃`, the relative different times the eigen-quotient `τ(𝔞₀)𝒪_𝕃`; its norm is
`N(𝔞₀𝔡_{E/K}) = N(𝔡_{E/K})^{1/2}`, which contributes `−(2/[E:ℚ])·log N(𝔞₀𝔡_{E/K}) = −(1/[E:ℚ])·log N(𝔡_{E/K})`. With the
eigen-quotient the sign of the transport term would be `+`.

*Check.* For `E = K` there is no transport: `𝔡_{E/K} = 𝒪_K`, `ℓ_τ = 𝔞₀ = 𝒪_K` and the statement is `log Ω = log Ω_K`.

*NEW* (the transport). The statement is [FormalProof], `Formalism/LocalToGlobal/Divisibility/Inputs.lean`
(`Formalism.L2.DIV.HtNums`), `Formalism/LocalRingCardinality/DataParams₂.lean` (`Formalism.BasicNotions.SizeData₂.logOm`).
*Needs:* 8.4, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.5; ThetaChainsOnDefiniteUnitaryGroups §2.2, ThetaChainsOnDefiniteUnitaryGroups §2.6, ThetaChainsOnDefiniteUnitaryGroups §3.1a.

### 8.6 The height of a step operator

*Statement.* For every step `j`,

`mean_σ log ‖K_j‖²_σ ≤ Σ_{τ∈Φ} ( Σ_i ph(ν_{j,τ,i}) − n_{j,τ}·log Ω ) + C·f·m²·N_m²·(La + log T(u))`,

the mean over all embeddings `σ : 𝕃 → ℂ`, for the chain data of the word `u` (ThetaChainsOnDefiniteUnitaryGroups §3.8), under the size conditions of ThetaChainsOnDefiniteUnitaryGroups §2.1,
`SizeG` (ThetaChainsOnDefiniteUnitaryGroups §2.7: `g₀, g₁ ≤ b^{C}` with `C` fixed before `ε`, which gives `log g₀, log g₁ ≤ C·La`) and `|(L′/L)(1, χ_K)| ≤ x^ε`. In particular, under `SizeT_u` (ThetaChainsOnDefiniteUnitaryGroups §2.8: `log T(u) ≤ C_T·m·x^ε`), and since
`La ≥ x^ε` (ThetaChainsOnDefiniteUnitaryGroups §2.1), the error is at most `C·f·m³·N_m²·La`.

*Route.* Average 8.4 over `σ`; by 8.5c `mean_σ Σ_τ n_{j,τ} log Ω_{τ,σ} = Σ_τ n_{j,τ}·log Ω`. The remaining terms of
`mean_σ E_j(σ)`: the class numbers of the levels of ThetaChainsOnDefiniteUnitaryGroups §2.9 are at most the masses times the indices of the level
groups at `g₀, g₁` and at the places above `T(u)` (HermitianFormsAndLattices §§5.5, 6.3), so
`log h_i ≤ C·f·N_m²·(La + log T(u))`; the Gaussian-growth constants `S_j(σ)` are bounded by 8.3: the mean of
`|Θ^{CM}_{L,L′}|²e^{−πH_A}` is the same for all pairs of the genus, invariant under Fock translations, with mean logarithm over
the conjugates at most `C·f·N_{j−1}N_j·(La + |(L′/L)(1, χ_K)|) ≤ 2C·f·N_{j−1}N_j·La` (ThetaChainsOnDefiniteUnitaryGroups §3.1d (c), and `|(L′/L)(1, χ_K)| ≤ x^ε ≤ La`), the lattices of the CM abelian varieties have minimum at least `π/v`,
`v = rd_E/2`, and the coefficients of the finite combinations of translates of ThetaChainsOnDefiniteUnitaryGroups §3.2 (the admissible finite data, fixed in
SeesawForThetaChains §6.5, SeesawForThetaChains §6.8 and LocalGainOfThetaChains §4.16) at the type primes and the level prime have logarithmic size `≤ C·f·m²·N_m²·log(g₀g₁T(u))`; this gives
`mean_σ 2 log S_j(σ) ≤ C·f·m²·N_m²·(La + log T(u))`; and `g_j log(2|ν_j| + 2) ≤ C·f·N_m²·La` since `|ν_j| ≤ C f N_m a`. For a
system of data with index sets `A_{j−1}`, `A_j` the bound for the squared norm of the block operator of the step has the further
factor `|A_{j−1}|·|A_j|`, whose logarithm is at most `C·f·m²·N_m²·log(g₀g₁T(u))`, within the error above.

*NEW*. The form under `SizeT_u` follows from [FormalProof], `Formalism/LocalToGlobal/Divisibility/Inputs.lean`
(`Formalism.L2.DIV.RecNums.hB`), `Formalism/LocalRingCardinality/KernelPlaceMeanBound.lean`
(`Formalism.BasicNotions.DV.kernelPlaceMeanBound`).
*Needs:* 8.4, 8.5c, 8.3, ThetaChainsOnDefiniteUnitaryGroups §2.1, ThetaChainsOnDefiniteUnitaryGroups §2.7, ThetaChainsOnDefiniteUnitaryGroups §2.8, ThetaChainsOnDefiniteUnitaryGroups §2.9, ThetaChainsOnDefiniteUnitaryGroups §2.9a, ThetaChainsOnDefiniteUnitaryGroups §2.9b, ThetaChainsOnDefiniteUnitaryGroups §3.1a, ThetaChainsOnDefiniteUnitaryGroups §3.1d, ThetaChainsOnDefiniteUnitaryGroups §3.2; HermitianFormsAndLattices §§5.5, 6.3.

### 8.7 The scaled branching map and the top period

*Statement.* (a) *Scaled branching.* Let `K′` be a field with an involution and
`s : K′ → ℂ` an embedding compatible with it. For `τ` in a finite set let `λ_τ` (of `GL_{n+1}`) and `σ_τ` (of `GL_n`) be
dominant weights that interlace and have the same determinant shift, `n_τ := |λ_τ| − |σ_τ|` (`|λ| = Σ_i λ_i`), `G′_τ`
Hermitian `n × n` matrices over `K′`, positive definite at `s`, and `g_τ, t_τ ∈ K′` with `|s(t_τ)|²·s(g_τ) = T_br > 0` for all
`τ`. Give `V_{λ_τ}` and `V_{σ_τ}` the Hermitian forms induced by `G′_τ ⊕ (g_τ)` and by `G′_τ` on the standard
representations (in the polynomial model `⟨x, y⟩_G = B(x̄, ρ(G)y)`, `B` the invariant pairing, so that a vector
homogeneous of degree `n` in the last coordinate has squared norm proportional to `g_τ^n`), the invariant pairing `B` being
normalised once (highest-weight vector of norm `1` for `G′ = 1`, `g = 1`) and then transported, with no further rescaling
depending on `G′_τ` or `g_τ` (Conventions; any rescaling by positive constants depending only on the weights changes `β` below
and nothing else; a rescaling of the highest-weight vector to norm `1` for the transported form would make the formula
below false: for `λ = (1, 0)`, `σ = (0)`, `G′ = (a)`, `g = t = 1` the squared norm of the projection would be `a`). Let `br := ∏_τ t_τ^{−n_τ}·br⁰`, `br⁰ = ⊗_τ br⁰_τ` the `∏_τGL_n`-equivariant map that
takes the component of degree `n_τ` in the last coordinate and projects it to `V_{σ_τ}`, normalised once. Then `br∘br^*` is
the scalar `T_br^{−Σ_τ n_τ}·∏_τ β(λ_τ, σ_τ)` on `⊗_τ V_{σ_τ}`, the squared operator norm of `br` is this number and is attained,
and `β(λ, σ) > 0` depends only on `(λ, σ)` and the normalisation of `br⁰` (it is the value for `G′ = 1`, `g = 1`, `t = 1`: the
SQUARE of the operator norm of `br⁰`). In the chain `br⁰_τ = br_τ` of ThetaChainsOnDefiniteUnitaryGroups §3.9 (the adjoint of the integral embedding `io_τ` with
the integer `c_{Br,τ}`), and `β(λ_τ, σ_τ)` is the number `β_τ` of ThetaChainsOnDefiniteUnitaryGroups §3.9 (c), the square of the operator norm of `br_τ`; since
`io_τ(v_{σ(τ)}) = c_{Br,τ}·ξ_τ` and `io_τ` is a multiple of an isometry (`V_{σ(τ)}` is irreducible),
`β_τ = c_{Br,τ}²·‖ξ_τ‖²/‖v_{σ(τ)}‖²` for the forms of ThetaChainsOnDefiniteUnitaryGroups §3.1: it contains the square of the branching integer. The chain
(ThetaChainsOnDefiniteUnitaryGroups §3.9) is the instance `g_τ = T(u)`, `t_τ = 1` in the coordinates of the class lattice `L_𝒸 ⊕ 𝒪_E z_u` of `𝒸̃` (`z_u = π_u e_{N_m}`,
`⟨z_u, z_u⟩ = T(u)`); the same map in the standard coordinates of `e_{N_m}` is the instance `g_τ = 1`, `t_τ = τ(π̄_u)`, with
`|s(τ(π_u))|² = T(u)` at every embedding (one value of `T_br` for all `τ ∈ Φ`, since `Φ` is induced from `K`).

(b) *The top period.* For the word `u` let `res` be the restriction of ThetaChainsOnDefiniteUnitaryGroups §3.9 (the value at the class `𝒸̃` of level `m`,
followed by `⊗_τ br_τ`), and `Pt(φ′) := P̃(φ′, ·) = ⟨·, res φ′⟩_{X^h}`, a conjugate-linear functional on the forms on `U(X^h)`
(ThetaChainsOnDefiniteUnitaryGroups §3.9) of norm `‖Pt(φ′)‖_σ = ‖res φ′‖_σ` at every embedding; put `A_top := Σ_{τ∈Φ_top} a_τ`. Then, for a weight datum adapted in the sense of
ThetaChainsOnDefiniteUnitaryGroups §2.3b, with `a⁻_τ` its negative bottom entry there, and under `Size(x, ε)` and `SizeSc`,

`ht(res) ≤ −A_top·log T(u) + (Σ_{τ∈Φ_top}(Sc + mϑ + a⁻_τ + N_m) + Σ_{τ∈Φ∖Φ_top}(2Sc + mϑ + N_m))·log T(u) + C·N_m²·(Σ_{τ∈Φ_top} a⁻_τ + f·(mϑ + Sc + 1))·La`,

and under `SizeT_u` (ThetaChainsOnDefiniteUnitaryGroups §2.8), when moreover `a⁻_τ ≤ 2b′` for every `τ ∈ Φ_top`,

`ht(res) ≤ t_u := −A_top·log T(u) + C₂·(|Φ_top|·b′·N_m + f·(mϑ + Sc)·N_m + f·N_m²)·La`,

which defines the *top term* `t_u` (`C₂` the constant of this bound). The factor `T(u)^{−n_τ}` is the archimedean side of the
coordinate `⟨z_u, ·⟩` (ThetaChainsOnDefiniteUnitaryGroups §3.9 (c)): `res` is integral at every finite place, and the costs of the level prime are those of the
column steps (LocalGainOfThetaChains §4.9f (e)).

*Route.* (a) Let `tr⁰ : V_σ → V_λ` be the transpose of `br⁰` for the invariant bilinear pairings. `br⁰∘tr⁰` is a scalar,
because `V_σ` is spanned by the orbit of its highest-weight vector and both maps are equivariant for the block matrices
`diag(h, 1)` (the branching `GL_{n+1} ↓ GL_n` is multiplicity free). The block `diag(G′, g)` acts on the image of `tr⁰`
through the degree `n_τ` in the last coordinate, so the adjoint of `br` for the induced forms is
`conj(∏_τ(t_τg_τ)^{−n_τ})·tr⁰` and `br∘br^*` is the scalar `∏_τ(|t_τ|²g_τ)^{−n_τ}β(λ_τ, σ_τ)`; if `P∘P^* = k` then
`‖Pf‖² ≤ k‖f‖²` (expand `‖kf − P^*Pf‖² ≥ 0`), with equality at `f = P^*(v_σ)`. (b) ThetaChainsOnDefiniteUnitaryGroups §3.9 (c) (the case `g_τ = T(u)`, `t_τ = 1`
of (a), Cauchy–Schwarz over the classes of `U(X^h)` with the weights `|Γ_𝒸|^{−1}` and injectivity of `𝒸 ↦ 𝒸̃`, ThetaChainsOnDefiniteUnitaryGroups §3.9 (a)) gives
`log‖res‖²_σ ≤ −(Σ_τ n_τ)·log T(u) + Σ_τ log β_τ` at every embedding. By interlacing, `n_τ = Λ_{m,0}(τ) − D₀(τ)` (ThetaChainsOnDefiniteUnitaryGroups §3.9),
`D₀(τ) ≤ Sc + mϑ + [τ ∈ Φ_top]·a⁻_τ`; the first entry of `Λ_m(τ)` is `u_0(τ) − (N_m − 1)/2` (ThetaChainsOnDefiniteUnitaryGroups §2.3), which is `≥ a_τ − N_m` at a
top place and `≥ −Sc − N_m` elsewhere, so `−n_τ ≤ 2Sc + mϑ + N_m` off the tops (`n_τ` may be negative there).
`β_τ = c_{Br,τ}²·‖ξ_τ‖²/‖v_{σ(τ)}‖²` (a). By its definition in ThetaChainsOnDefiniteUnitaryGroups §3.9, `c_{Br,τ}` is a product of `(N_m − 1)·D₁(τ)` integers
(`N_m − 1` values of `j` for each of the `D₁(τ) = Σ_i #(R_i ∖ {σ_i(τ)}) = Σ_i min(Λ_{m,i}(τ) − Λ_{m,i+1}(τ), D₀(τ))` pairs `(i, v)`,
IntegralWeylModulesOfGeneralLinearGroups §1.1), each of absolute value
less than the *spread* `sp(τ) := Λ_{m,0}(τ) − Λ_{m,N_m−1}(τ) + N_m` (without the `+N_m` this fails: for `N = 6`, `λ = (1⁵, 0)`,
`σ = (1⁵)` the integer is `−120`); the ratio `‖ξ_τ‖²/‖v_{σ(τ)}‖²` is `⟨ξ_τ, ξ_τ⟩ ≤ dim V_{Λ_m(τ)}` (ThetaChainsOnDefiniteUnitaryGroups §3.9: `br_τ∘io_τ = c_{Br,τ}²·⟨ξ_τ, ξ_τ⟩`
exactly; IntegralWeylModulesOfGeneralLinearGroups §1.1), the Weyl product of `Λ_m(τ)`. In `Λ_m(τ) = HC_m(τ) − ρ_{N_m}`
(ThetaChainsOnDefiniteUnitaryGroups §2.3) the gaps `Λ_{m,i}(τ) − Λ_{m,i+1}(τ)` inside a segment `S(−w_j(τ), t + 1)` vanish, those between
consecutive segments sum to `w_m(τ) − w_1(τ) − (m − 1)(t + 1) ≤ ϑ + 1` and those between `u_1(τ), …, u_{k−2}(τ)` to at most `Sc`
(ThetaChainsOnDefiniteUnitaryGroups §2.3b), and the gaps after `u_0(τ)`, `u_{k−2}(τ)` and `u_{k−1}(τ)` contribute at most `D₀(τ)` each, so
`D₁(τ) ≤ 3D₀(τ) + Sc + ϑ + 1`; and `sp(τ) = u_0(τ) + w_m(τ) + t/2 + 1 ≤ 4a + N_m` (ThetaChainsOnDefiniteUnitaryGroups §2.3b (f)). With
`D₀(τ) ≤ Sc + mϑ + 2b′·[τ ∈ Φ_top]`, the logarithm of the branching integer at `τ` is at most `C·N_m·(D₀(τ) + Sc + ϑ)·La`
(linear in `N_m`) and that
of `⟨ξ_τ, ξ_τ⟩` at most `C·N_m²·La`; summed over `τ` this is the last term. Under `SizeT_u`,
`log T(u) ≤ C_T·m·x^ε ≤ C_T·m·La`, and the middle term is at most a constant times `(|Φ_top|·b′ + f·(mϑ + Sc + N_m))·N_m·La`.

*Check.* `n = 0`, `λ = (a)`, `σ = ∅` (one place): `br` takes the coefficient of `z^a` and multiplies it by `t^{−a}`; since
`‖z^a‖² = β^{−1}g^a`, the squared norm of `br` is `β·(|t|²g)^{−a} = β·T_br^{−a}`. With forms for which `‖z^a‖² ∝ g^{−a}` the
exponent of `g` would change sign and the instance `g = T_br`, `t = 1` would give `T_br^{+a}`.

*NEW* (exact form). (a): [FormalProof], `Development/AbelianVarietyTheory/BlockTheory/DivisorBase/ScaledCoisometryNorms.lean`
(`GlobalTheory.IndefiniteRowSideFullHecke.ScaledCoisometryNorms.BrNorm`).
*Needs:* ThetaChainsOnDefiniteUnitaryGroups §2.1, ThetaChainsOnDefiniteUnitaryGroups §2.3, ThetaChainsOnDefiniteUnitaryGroups §2.3b, ThetaChainsOnDefiniteUnitaryGroups §2.8, ThetaChainsOnDefiniteUnitaryGroups §3.9; IntegralWeylModulesOfGeneralLinearGroups §1.1 (integral branching and the bound
for `c_{Br,τ}`); ClassicalGroups §5.1 (Weyl dimension), ClassicalGroups §6.1 (branching
`GL_n ↓ GL_{n−1}`, Zhelobenko, Gelfand–Tsetlin); AutomorphicFormsOnReductiveGroups §§7.4–7.6 and
DiscreteSeriesCoefficientsAndAutomorphicMetrics §§7.5a, 7.5b (class-set integration).

### 8.8 Rallis eigenvalues and hook products

*Statement.* For a step `j`, a place `τ ∈ Φ` and the Harish-Chandra parameter of
the row discrete series of `U(W_j)` at `τ` (ThetaChainsOnDefiniteUnitaryGroups §2.3), with positive block `s^+(τ)` (length `p_j = k + j − 1`, its first
`k − 1` entries `v(τ)`) and negative block `s^−(τ)` (length `q_j = m − j`), let `a⁺_{j,τ}` be the positive diagram of step `j`
at `τ` of LocalGainOfThetaChains §4.9f (d) (rows `a⁺_{j,τ,i} = s⁺_i(τ) + w_j(τ) − (p_j − 1 − i) − (t + 1)/2`, integers `≥ 1`, `0 ≤ i < p_j`) and `H^+_{j,τ}` its
hook product. Let `A_g, A_R` be absolute constants
(fixed before `ε`). Suppose `0 < w_j(τ) ≤ 2b`, `0 ≤ v_l(τ) ≤ b` for the entries of `v(τ)`, `|e′_l(τ) − w_j(τ)| ≤ b`, and
`g₀, g₁ ≥ (kb)^{A_g}`. Let `λ_j(ξ, 𝔥, σ)` be the eigenvalue of `θ_jθ_j^*` (RowTowerAndRallisIdentities §5.7) on the `𝔥`-part, at the embedding `σ`, for
the Petersson form of RowTowerAndRallisIdentities §5.1 on the forms of `U(W_j)` (the form for which RowTowerAndRallisIdentities §5.7 computes `θ_jθ_j^*`). Then:

(a) for every tuple `ξ` of ThetaChainsOnDefiniteUnitaryGroups §2.5 whose twist places lie above primes not dividing `f_E·d·g₀g₁·T(u)`, every embedding `σ` of `𝕃` over `K` and every Hecke eigensystem `𝔥` with nonzero part, `λ_j(ξ, 𝔥, σ) > 0` and

`log λ_j(ξ, 𝔥, σ) ≥ Σ_{τ∈Φ} log H^+_{j,τ} − A_R·f·(r + t)²·log(b·rd_E·g₀g₁·(r + t))`;

(b) for the base tuple, at every infinite place `v` of `𝕃` the rational model lift multiplies the form of the coordinates
by `λ_j(1, 𝔥, v)` on the `𝔥`-part (RowTowerAndRallisIdentities §5.11 (b), RowTowerAndRallisIdentities §5.12), and the same lower bound holds: the two embeddings of `v` give complex
conjugate forms (they differ by complex conjugation, which moves `K`), and at the one over `K` the lift is the adelic lift
of the conjugate data.

*Route.* (a) The exact value of RowTowerAndRallisIdentities §5.7: `λ_j = a_j·L^{S(ξ)}((t+1)/2, B_𝔥 × μ_j(ξ)^{−1})` with
`a_j = |H|·d_K(j)·dim 𝒲_j·‖Δ_j‖²_Fock·∏_τ d(D_{W_j,τ})^{−1}·mass(V_j)/∏_{n=t+1}^{r+t}L(n, η^n)` (RowTowerAndRallisIdentities §5.7 (ii), with the factor `|H|`
of RowTowerAndRallisIdentities §5.7 (ii′) at the level `(H, χ_H)`; `d_K(j)` the product of the dimensions of the lowest `K`-types). The Fischer norm of the
minor-product vector `Δ_j` is at least the hook product `∏_τ H^+_{j,τ}` of the positive diagrams (IntegralWeylModulesOfGeneralLinearGroups §3.1 for the block of the
positive diagram; the Fischer form is multiplicative over the places `τ` and over the two blocks, which use disjoint sets
of variables, and the factor of the negative block is a Fischer norm of a product of minors with integer coefficients,
at least `1`). Every other factor is at least
`exp(−A_R f(r+t)²log(b·rd_E·g₀g₁(r+t)))` in total: `|H|, d_K(j), dim 𝒲_j ≥ 1`; the mass of the standard lattice of `V_j`
by its closed form (HermitianFormsAndLattices §6.3), at least `1/(w_E^{r+t}·(r+t)!)`; the inverse formal degrees by
Harish-Chandra's formula, the parameters being bounded by `2b`; the partial `L`-value is an absolutely convergent Euler
product close to `1`, the Satake parameters being bounded by `q_w^{(r−1)/2−(t+1)/2}` and `t > r + 1`, and so is
`∏_n L(n, η^n)`; the level index and the norm of the level vector at the type primes cost at most a power of `g₀g₁`.
(b) For `v ≠ v₀` the scalar at the embedding over `K` under `v` is that of the conjugate data, by the conjugation of
rational lifts (RowTowerAndRallisIdentities §5.11 (b)), and (a) applies to the conjugate data. (If the eigenvalue is computed for the norm
`∫|F(v)|²` of one unit vector of the lowest `K`-type instead, it changes by `∏_τ dim τ_τ` (RowTowerAndRallisIdentities §5.1 (2)), whose logarithm is
at most `C·f·r²·log(b·r)`.)

*Check.* `g₀, g₁ ≥ (kb)^8` and `A_R = 8` are the values of one construction. The Fischer norm of `Δ_j` is the hook
product, not the product of the row factorials (IntegralWeylModulesOfGeneralLinearGroups §3.1, Check).

*NEW* (bound), *KNOWN* ingredients (the Rallis inner product formula; Harish-Chandra's formal degrees). (a) follows from
[FormalProof], `Development/AbelianVarietyTheory/Definitions/Divisors/FormalDegreeUpperC.lean` (`GlobalTheory.LowRow.AdelC`);
(b) follows from [FormalProof], `Formalism/LocalToGlobal/IndefiniteForms/IndefSide.lean` (`Formalism.L2.Indef.IndefData.L6`),
`Formalism/LocalRingCardinality/KernelPlaceMeanBound.lean` (`Formalism.BasicNotions.DV.L6lo`),
`Formalism/LocalRingCardinality/KernelPlaceMeanBound.lean` (`Formalism.BasicNotions.DV.logHook`).
The clause `L6` is proved, from the Siegel–Weil formula for unitary groups in the convergent range, the doubling zeta
integrals, Bernstein–Zelevinsky finiteness and the formal degree formula, in
`Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/LocalTypeDictionary/FinitenessInputsRealDataThree.lean`
(`GlobalTheory.T.finiteness_inputs_real_data_three_alt`).
*Needs:* LocalGainOfThetaChains §4.9f, IntegralWeylModulesOfGeneralLinearGroups §3.1;
RowTowerAndRallisIdentities §5.1, RowTowerAndRallisIdentities §5.7, RowTowerAndRallisIdentities §5.11; HermitianFormsAndLattices §6.3; DiscreteSeriesCoefficientsAndAutomorphicMetrics §8.3 (the formal degree of a discrete series).

### 8.9 The height of the period pairing

*Statement.* For a word `u` define the *explicit height*

`h_u := t_u + Σ_{j=1}^m ( Σ_{τ∈Φ} Kt_{j,τ}(u) + C₁·f·m³·N_m²·La ) − Σ_{j=1}^m ( Σ_{τ∈Φ} log H^+_{j,τ} − A_R·f(r + t)²·log(b·rd_E·g₀g₁(r + t)) ) − log 𝔫 + log|P_1|`,

where the *kernel term* is `Kt_{j,τ}(u) := Σ_i ph(ν_{j,τ,i}) − (Σ_i ν_{j,τ,i})·log Ω`, the *top term* `t_u` is that of 8.7 (b),
`C₁` the constant of 8.6 (in the form under `SizeT_u`), `A_R` that of 8.8, and `𝔫 > 0` the descent constant of RowTowerAndRallisIdentities §5.10 (one
number, the same at every embedding). (`h_u` is a number attached to the word; it is defined here and nowhere earlier.
Besides `−A_top·log T(u)` in `t_u`, the word enters `h_u` only through the kernel terms.) The rows `𝔼_0` and
`𝔼 = 𝔼_1` carry, at every embedding `σ`, the metric of RowTowerAndRallisIdentities §5.12 divided by its factor `|H|` (`H = P_0`, resp. `P_1`; at `σ₀` the
Petersson metric divided by `|H|`); for this metric `ι_1^*ι_1 = 𝔫·∏_jλ_j(1, 𝔥, σ)` on the `𝔥`-part of `Q_1` with the form
`X_1^σ` of RowTowerAndRallisIdentities §5.12 (the class-sum product divided by `|H|`), at every `σ`, hence `(𝔫/|P_1|)·∏_jλ_j(1, 𝔥, σ)` for the class-sum
product itself; `R^∨`, `R_0^∨` (the `c_𝕃`-semilinear functionals integral on `R`, `R_0`) carry the dual metrics (7.13): at `σ` the norm dual
to the metric at `σ̃ = conj∘σ∘c_𝕃`, which is the norm of 8.1 for semilinear functionals at `σ` (the metrics being compatible with
complex conjugation, `‖y‖_{σ̃} = ‖y‖_{σ∘c_𝕃}`). Under `SizeT_u` (ThetaChainsOnDefiniteUnitaryGroups §2.8), the hypotheses of 8.7 (b) (a weight datum adapted in the sense of ThetaChainsOnDefiniteUnitaryGroups §2.3b, `SizeSc`, and `a⁻_τ ≤ 2b′` for `τ ∈ Φ_top`), the hypotheses of 8.6 (the size conditions of
ThetaChainsOnDefiniteUnitaryGroups §2.1, `SizeG` of ThetaChainsOnDefiniteUnitaryGroups §2.7 and `|(L′/L)(1, χ_K)| ≤ x^ε`) and of 8.8 at every step and place,
the hypotheses of SeesawForThetaChains §6.14 (among them that the Bessel–Poincaré series of every word `u` is nonzero on its new forms
`M_u`), and those of RowTowerAndRallisIdentities §5.8b for the grid of the chain and a scale `x ≥ x_F` with the size predicate
`Size_□` of RowTowerAndRallisIdentities §5.8e, the depth constant `C_F ≥ C_F⁰` and the gap hypotheses of
RowTowerAndRallisIdentities §5.8 (on which, with the other hypotheses of RowTowerAndRallisIdentities §5.8 that
this layer carries by reference, SeesawForThetaChains §6.15 and 7.13 rest), if `B_u ≠ 0` then `ht(B_u) ≤ h_u` for
the Petersson metric of ThetaChainsOnDefiniteUnitaryGroups §3.8 on `M_u` and this metric on `R^∨`.

*Route.* By SeesawForThetaChains §6.1 and SeesawForThetaChains §6.14, `B_u(φ)(ι_1 Υ) = P̃_1(col φ, Υ) = Pt(K_m ⋯ K_1 φ)(Υ)` on `ℋ^{rt}_1` (with the class-sum product), and
by RowTowerAndRallisIdentities §5.12 with the metric above `ι_1^*ι_1` is the scalar `(𝔫/|P_1|)∏_jλ_j(1, 𝔥, σ)` on the `𝔥`-part, positive at every `σ`
(RowTowerAndRallisIdentities §5.11). The period is linear in the column and conjugate-linear in the row form (ThetaChainsOnDefiniteUnitaryGroups §3.9), so `B_u` is `𝕃`-linear and takes
values in the `c_𝕃`-semilinear functionals. Apply 8.1 in its form for semilinear functionals (`c = c_𝕃`) with these `K_j`,
`Pt` of 8.7 (b) and `ι = ι_1` restricted to `Q_1`; then 8.6 for `ht(K_j)`, 8.7 (b) for `ht(Pt) = ht(res) ≤ t_u` and 8.8 (b) for
`min_𝔥 Σ_j log λ_j(1, 𝔥, σ)` at every embedding (the base tuple). The size of the seesaw scalar `a_u` of SeesawForThetaChains §6.14 does not
enter.

*NEW*. [FormalProof] collects the archimedean inputs of this target, at every word, in
`Formalism/LocalToGlobal/PtKOfReal.lean` (`Formalism.L2.RowDataTransport.RowsU`), with the factorisation
`Formalism/LocalToGlobal/Divisibility/Inputs.lean` (`Formalism.L2.DIV.ColChain`), the numbers of 8.5c–8.7
(`Formalism.L2.DIV.HtNums`) and the step bound `Formalism/ThetaSupremumBounds/StatementCB.lean`
(`Formalism.DimensionVariation.CBHyp`), `Formalism/ThetaSupremumBounds/DivIneqExplicit6.lean`
(`Formalism.DimensionVariation.liftedMapLogSize`); it states them as
`Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/DefiniteSideCondition.lean`
(`GlobalTheory.Fc.DefiniteSideCondition`) and proves them in
`Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/PointEvaluationSide.lean`
(`GlobalTheory.Fc.RL.DefSide.definiteSideCondition_of_nprimeDef_of_nuFull`).
*Needs:* 8.1, 8.6, 8.7, 8.8, ThetaChainsOnDefiniteUnitaryGroups §2.1, ThetaChainsOnDefiniteUnitaryGroups §2.3b, ThetaChainsOnDefiniteUnitaryGroups §2.7, ThetaChainsOnDefiniteUnitaryGroups §2.8, ThetaChainsOnDefiniteUnitaryGroups §3.9, RowTowerAndRallisIdentities §5.10, RowTowerAndRallisIdentities §5.11, RowTowerAndRallisIdentities §5.12, SeesawForThetaChains §6.1, SeesawForThetaChains §6.14, SeesawForThetaChains §6.15, 7.13.

### 8.10 Stirling terms against hook products

*Statement.* (a) For every Young diagram `μ`, `∏_i μ_i! ≤ H(μ)`, the product of its hook
lengths; hence `log H(μ) ≥ Σ_i ph(μ_i)`.

(b) Let the parameters of ThetaChainsOnDefiniteUnitaryGroups §2.3 interlace (`u_0 > v_0 > u_1 > ⋯ > v_{k−2} > u_{k−1}`, indices from `0`), the word
`δ ∈ {0,1}^{k−2}` giving the inner entries `u_i = v_{i−1} − ½ − δ_{i−1}Δ_w` (`1 ≤ i ≤ k − 2`, `Δ_w` the letter step) and,
off the top places, `u_{k−1} = v_{k−2} − ½`. Then for every step `j` and place `τ`, with `κ_j = (k + (2j − 1)(t + 1))/2`
and `λ_i(τ) = u_i(τ) − (k−1)/2 + i` the level-`0` highest weight, the kernel rows of 8.4 are
`ν_{j,τ,i} = λ_i(τ) + w_j(τ) − κ_j` for the `k` rows from level `0` and `w_j(τ) − w_{j′}(τ) − (j − j′)(t + 1) ≥ 0` for the
`t + 1` rows created at a step `j′ < j`; and every kernel row except the first is dominated by a hook row of 8.8: with
the rows `a⁺_{j,τ,n}` of the positive diagram of LocalGainOfThetaChains §4.9f (d),
`ν_{j,τ,i} = a⁺_{j,τ,i−1} − (j − 1)t − δ_{i−1}Δ_w` for `1 ≤ i ≤ k − 2` and `ν_{j,τ,k−1} ≤ a⁺_{j,τ,k−2} − (j − 1)t` (with
equality off the top places), where `s^+_n(τ) = v_n(τ)` for `n ≤ k − 2`.

(c) (*The ledger at one place.*) `Σ_i ph(ν_{j,τ,i}) − log H^+_{j,τ} ≤ [τ ∈ Φ_top]·ph(a_τ) + eE_{j,τ}`, with
`eE_{j,τ} := C·(w_j(τ) + Sc + N_m² + m(t + 1)ϑ)·La`. The unpaid row is the first: `a_τ + w_j(τ) − κ_j` at a top place,
at most `w_j(τ) + C·Sc` elsewhere.

(d) (*The sum of the rows.*) `Σ_i ν_{j,τ,i} = [τ ∈ Φ_top]·a_τ + k·w_j(τ) + δ_{j,τ}` with
`|δ_{j,τ}| ≤ C·(w_j(τ) + k(N_m + Sc) + m(t + 1)ϑ + [τ ∈ Φ_top]·k·b′)`.

*Route.* (a) The hooks in row `i` are at least `μ_i, μ_i − 1, …, 1`, and `log n! ≥ ph(n)`. (b) Compare the kernel rows
of ThetaChainsOnDefiniteUnitaryGroups §3.4 with the hook rows of 8.8 entry by entry, using the interlacing and the shape of the words (ThetaChainsOnDefiniteUnitaryGroups §2.3). (c) For
integers `0 ≤ ν ≤ a`, `ph(ν) ≤ log ν! ≤ log a!` (`ph(n) ≤ log n!` for every integer `n ≥ 0`, with `ph(0) = 0`), and the
hooks of row `i − 1` of the diagram `a⁺_{j,τ}` multiply to at least `(a⁺_{j,τ,i−1})!` (a); so (b) leaves only `ph` of the first
row and of the `(j − 1)(t + 1)` block rows (each at most `ϑ + 1`, the width of the window of the step weights at `τ`); at a
top place `ph(a_τ + w − κ_j) ≤ ph(a_τ) + w·log(a_τ + w)`. (d) Sum the rows of (b); `a⁻_τ`, the cloud, `kκ_j` and the block
rows go into `δ_{j,τ}`.

*Check.* Off the tops the per-place error is `w_j(τ)·La`, so `Σ_jΣ_τ eE_{j,τ} = O(f·m·b·La)`; at a top place an error of
size `a_τ` in (c) would add `m·a_τ` per top place, above the budget of the chain. `ph` is not monotone on `[0, 1]`
(`ph(0) = 0 > ph(1) = −1`), which is why (c) compares through `log ν!`.

*NEW* (elementary; the hook-length formula of Frame, Robinson and Thrall). (b)–(d): [FormalProof],
`Formalism/LocalToGlobal/Divisibility/Numbers.lean` (`Formalism.L2.DIV.NumDatum.nu`).
*Needs:* 8.4, 8.8; SchurWeyl Layer 5 (hook
lengths); ThetaChainsOnDefiniteUnitaryGroups §2.3, ThetaChainsOnDefiniteUnitaryGroups §3.4, LocalGainOfThetaChains §4.9f, IntegralWeylModulesOfGeneralLinearGroups §3.1.

### 8.19e The theta conditions of the twist selection are polynomial conditions

Let `ℓ` be a prime under a twisted place, not a type prime, `δ_ℓ` its auxiliary character (ThetaChainsOnDefiniteUnitaryGroups §2.5), assume `r ≥ 100` and
`g₀, g₁ ≥ 2r` as CongruenceModulesOfThetaLifts §7.8 does (both hold under `Size(x, ε)` for `x ≥ 32` and the type primes of the chain), and use the twisting
places and characters of CongruenceModulesOfThetaLifts §7.8: pairs `{𝔮, c𝔮}` of places of degree one over `ℚ` above places of `F` split in `E`, that split
completely in the field `𝒢_M` of CongruenceModulesOfThetaLifts §7.8 (2), with characters `d_𝔮` of order `ℓ^M` ramified at the pair, and for roots of unity
`u = (u_𝔮)_𝔮` of order dividing `ℓ^M` the twist `ψ_u := ∏_𝔮 u_𝔮^{d_𝔮}`. Polynomial conditions are those of CongruenceModulesOfThetaLifts §7.8 (2), of the second kind of SelmerLengthBoundsAndLocalLifting §3.25b (2) (a rule attaching to
every family, at every level `M`, a polynomial `f ∈ O[X_𝔮]` with `f ≡ Dd·g` modulo the ideal generated by the second-half variables and
the `(1 + X_𝔮)^{ℓ^M} − 1` of the first-half ones, `v(g(0)) ≤ v₀`, and `Dd ≡ w·∏_{𝔮 first half}X_𝔮^{n_𝔮}` modulo the maximal ideal and the
`X_𝔮^{ℓ^M}`, with `w(0) ≠ 0` and every `n_𝔮 ≤ n_max`; `v₀` the level, `n_max` the exponent bound); the product of two such rules is one,
with the sum of the levels and of the exponent bounds.

(a) *Theta values.* For a twisting datum with sign `s = +1` (ThetaChainsOnDefiniteUnitaryGroups §2.5), every square `(i, j)` of the
grid of RowTowerAndRallisIdentities §5.8a, with Hecke character `ν_1 = μ_{j+1}/χ_{m−i}` for the base
tuple, every integer `1 ≤ s ≤ h_sq(i, j)` (half the sum of the two ranks of the square, RowTowerAndRallisIdentities §5.8d), and `χ := ν_1δ_ℓ`, the twisted theta value
`u ↦ Σ_δ th_χ(Q, δ)ψ_u(δ)` of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19d (iii) (the twisted toric sum normalised by the untwisted one) gives a polynomial condition of
the second kind: relative to `H_𝒞 := ker χ̄ ⊂ G_E` (open, and normal in `G_F` because `χ` is trivial on `𝔸_F^×`, so that
`χ̄∘c = χ̄^{−1}` has the same kernel; the scalar element `z` of CongruenceModulesOfThetaLifts §7.8 (1) is central modulo it, and the condition is used when
`χ̄(z) ≠ 1`) and the finite set `A_𝒞` of places above `ℓ`, the conductor of `χ` and the auxiliary primes: to a family whose
first-half Frobenius elements lie in `z·H_𝒞` and whose second-half ones lie in `H_𝒞` it attaches the polynomial `f` of
ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19d (iii) in all its variables (the twisted theta value times `ℓ^{N₀}`), which is congruent, modulo the ideal
generated by the second-half variables and the `(1 + X_{P_a})^{ℓ^M} − 1` (the coset form of SelmerLengthBoundsAndLocalLifting §3.26), to `F = Dd·g`
with `v(g(0)) = N₀` (`g(0)` is `ℓ^{N₀}` times a unit times the untwisted value `Σ_δ th_χ(∅, δ) = 1`) and `Dd ≡ ∏_a X_{P_a}^{e_a}·(a unit)` modulo
the maximal ideal and the `X_𝔮^{ℓ^M}`, `e_a ∈ {0, 2}`: a condition of level `N₀` and exponent bound `2`.

(b) *Indices of twisted theta lattices.* Let `ℓ` be a prime under a twisted place, `𝒪` the coefficient ring at a place above
`ℓ`, `j` a step and one of the two conjugate places. Let `B_all` be a finitely generated module of forms of step `j` over `𝒪`, stable
under the Hecke operators `T_{n,P}` (`1 ≤ n ≤ r`, `P` split, outside a finite set), `A` the action of a central element of
the group algebra `𝒪[G₀]` (so `A` commutes with the Hecke operators), with `A(B_all) ⊂ B_all`, `B` a Hecke-stable lattice in the span of `A(B_all)` with `A(B_all) ⊂ B`, and `θ_1, …, θ_k` (`k = rk B`) theta series
with `A(θ_a)` a basis of `B ⊗ ℚ`, such that: for some `c ≥ 0` and all admissible `Q`, `M`, `ℓ^c·`(the universal twist of `θ_a` for `Q`,
`M`) has coefficients in `B_all` (so `ℓ^c·A(θ_a(Q, χ)) ∈ B ⊗ 𝒪[Δ_{Q,M}]`, `Δ_{Q,M}` the twisting group); the universal twists satisfy
the Euler-factor relation `θ_a(Q, χ) = (1 + Σ_{n=1}^r (−1)^n N(P)^{n(n−1)/2}·χ′(Frob_P)^{±n}·T_{n,P})·θ_a(Q ∖ {P, P̄}, χ′)` when a conjugate
pair `{P, P̄}` leaves `Q` (`χ` the inflation of `χ′`); and every Hecke eigenvector of `B/𝔪B` has the eigenvalues, modulo `𝔪`, of an
eigensystem of the step and place. Let `z` be the element of CongruenceModulesOfThetaLifts §7.8 (1). Then there are an open subgroup `H ⊂ G_E`, normal in `G_E`,
and a finite set `A₀` of places such that for every `M ≥ 1` and every family of twisting places in position relative to
`(H, z, A₀)` (here: every Frobenius element at a first-half place is conjugate to an element of `z·H`, and the second-half places
are as in SelmerLengthBoundsAndLocalLifting §3.24; this is the form of [FormalProof], which asserts only that `H` is open
and normal) there is `f ∈ 𝒪[X_𝔮]` with: `f ≡ Dd·g` modulo the ideal generated by the second-half variables and the
`(1 + X_a)^{ℓ^M} − 1`; `v(g(0)) ≤ v₀ := c·k + ι(1)` (in units of `v(ℓ)`), `ι(1)` the signed index at `ℓ` of the span of the `A(θ_a)`
in `B`; `Dd ≡ w·∏_a X_a^{ν_a}` modulo the maximal ideal and the `X_𝔮^{ℓ^M}`, with `w(0) ≠ 0`, `ν_a ≤ r·k`; and for all roots of unity
`u` of order dividing `ℓ^M` with `f(u − 1) ≠ 0` and every lattice `T_u` containing the `A`-images of the twisted theta series:
`[B : T_u]_ℓ ≤ ι(1) + v(f(u − 1)) − v₀` (signed indices). So `f` is a polynomial condition of the second kind (SelmerLengthBoundsAndLocalLifting §3.25b (2); CongruenceModulesOfThetaLifts §7.8 (2)), of
level `v₀` and exponent bound `r·k`, relative to its own subgroup and set of places; the same holds for every open
subgroup of `H` (a family in position for a subgroup is in position for every larger one), in particular for
`H ∩ cHc^{−1}`, normal in `G_F`.

(c) *The lattices of the chain.* For every prime `ℓ` under a twisted
place (the type primes included), every step `j` and each of the two conjugate places, the hypotheses of (b) hold for `B_all` the
integral forms of the type of step `j`, `A := |G₀|·`(the good projector of RowTowerAndRallisIdentities §5.3), `B := B_all ∩` (the good part), and theta series
`θ_a` of the class-sum lifts of step `j` (RowTowerAndRallisIdentities §5.11) whose `A`-images form a basis of the good part, with the twisting places and
characters above: Hecke stability, the integrality with one `c` for all `Q`, `M`, the Euler-factor relation in the Hecke
operators, and the eigensystem condition. (That `z` is central modulo `H`, which the definition of a polynomial condition in
SelmerLengthBoundsAndLocalLifting §3.25b (2) asks, is not asserted by [FormalProof]; with position read by conjugacy as in
(b) it is not needed.)
The first two rest on three statements about the forms on the algebraic tower of `U(W_j)` (RowTowerAndRallisIdentities
§5.10a) and its covers of auxiliary level `p_d` (in (c1)–(c3) `M` is the level of the tower, RowTowerAndRallisIdentities
§5.11, not the exponent in `ℓ^M`). A *cover* is the member of the tower of level `M·p_d` over a coefficient field `𝕂′`
containing that of the chain, with its complex uniformisation and its reading of sections as adelic functions normalised
compatibly with those of the level `M`; a form on it is *integral at* a set `S` of finite places of `𝕂′` if it is a cusp
form over `𝕂′` with integral values at every integral framed point over a complete discrete valuation ring with finite
residue field above a place of `S` (the integral structure of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties
§8.19a, at the places of `S`).

(c1) *Rationality on covers and for twists:* RowTowerAndRallisIdentities §5.11, Lemma, in its form on covers.

(c2) *Integrality with an exponent uniform in the cover.* There is a phase of absolute value `1` such that for every prime
`ℓ`, every `s ∈ U(V_j)(𝔸_f)` and every finitely generated `ℤ`-lattice `Λ` of harmonic polynomials there is `c ≥ 0` with:
for every cover with `p_d` squarefree, prime to `ℓ` and to the primes of the host, whose field `𝕂′` contains the values at
the unramified places of `μ_j·(η̃·‖·‖_{𝔸_E}^{1/2})^{−1}`, the coefficients of the elements of `Λ` and the ray class field of
`K` of conductor `M·p_d`; every set `S` of places of `𝕂′` above `ℓ`; every character `α` of the finite ideles of `E` whose
restriction to the ideles of norm one to `F` is trivial on the elements of `E^×` of norm one and on the ideles
`≡ 1 (mod p_d)` and has values in `𝕂′`; every test function of level `M·p_d` with values in `𝕂′` integral at `S`; and every
`v ∈ Λ`: `ℓ^c·(phase)·α(det g_f)·θ(s, g)`, the theta function of the test function and of `v`, is a form on the cover
integral at `S`. *Descent:* if moreover `𝕂′` is unramified over the field of the chain at the places of `S`, a form on the
cover that is integral at `S` and right invariant under the level of the chain is a finite combination, with coefficients
in `𝕂′` integral at `S`, of forms of the level of the chain integral at the places below `S`.

(c3) *Hecke correspondences and integral points.* Let `P` be a prime of `E` with `P ≠ P̄`, above a rational prime `p` prime
to the level, and `𝔩` a place of the coefficient field not above `p`. If a framed point `z` over an algebraically closed
field is related by a Hecke correspondence at `P`, of any type, to the base change of an integral framed point over a
complete discrete valuation ring `T` above `𝔩` with finite residue field, then after a finite extension `T′` of `T` there is
an integral framed point over `T′` whose base change differs from `z` by a triangular change of frame with diagonal entries
units of `T′`; and every form, of any weight, that is integral at `𝔩` has at `z` a value integral over `T`. Consequently,
with the algebraicity of the Hecke transform and its identification with the adelic operator at the base embedding
(RowTowerAndRallisIdentities §5.10a), the operators `(μ_j(ϖ_P)·N(P)^{(r+t)/2})^{−n}·T_{n,P}` (`1 ≤ n ≤ r`; `P ≠ P̄` outside
`S(1)` and not above `g₀g₁`) preserve the forms integral at every place of the coefficient field not above the residue
characteristic of `P`.

*Route.* (a) is ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19d (iii): integrality uniform in `Q`, the Euler-factor relation when a conjugate pair leaves `Q`, and the
reduction modulo the maximal ideal with exponents `e_a ∈ {0, 2}`; these are the data of the second kind. A product of two conditions of
the second kind is one: the congruences multiply, and the levels and the exponent bounds add. (b) `f` is the determinant of the coordinates of the `ℓ^c·A(θ_a(Q, χ_u))` in a basis of `B`. The relation gives
`f(u − 1) = ∏_{pairs} det(1 + Σ_n (−1)^n N(P)^{n(n−1)/2}·y_P^n·t_n(P))·det(m₀)`, `t_n(P)` the matrix of `T_{n,P}` and `m₀` the untwisted
matrix, with `v(det m₀) = c·k + ι(1)` (its columns are the coordinates of the `ℓ^c·A(θ_a)`). At the first-half places and `u = 1`
each factor is a unit: the Frobenius lies in `z·H`, and `H` is chosen so that the Hecke polynomial of every eigensystem at `1`
is then a unit (the eigensystem condition). At a second-half place `y = (1 + X_a)^{ε_a}` with `ε_a` prime to `ℓ`, and a polynomial
of degree `≤ r·k` with constant term `1` over the residue field becomes `w(X)·X^ν`, `ν ≤ r·k`. The index of a span is the
valuation of the coordinate determinant; a larger lattice has smaller index. These are the data of the second kind.
(c) The clauses of (b) for these lattices follow formally from three statements, for every twisted place, every
step and each of the two conjugate places: (L1) the integral forms are stable under `G₀`; their type part `B_all` is
finitely generated, spans the type part and is stable under the Hecke operators; for every theta datum of the
generating set one `c` makes `ℓ^c·`(the universal twist) integral for all `Q`, `M`; (L2) `|G₀|·e` has integral coefficients
(`e` the good idempotent), `G₀` commutes with the Hecke operators, and `e` acts as `1` or `0` on every `G₀`-irreducible
subspace of a Hecke eigenspace; (L3) the eigensystem condition for `B`. Indeed `A(B_all) ⊂ B` because `|G₀|·e` is integral
and the integral forms are `G₀`-stable; `B` is a lattice in the good part because `B_all` is one in the type part; `B` is
Hecke stable because `e` commutes with the Hecke operators; the `A`-images of the theta series of the class-sum lifts
form a basis of the good part (RowTowerAndRallisIdentities §5.11); and `c` is the largest of the finitely many exponents
of (L1). (L3) follows from (L1), (L2) and the semisimplicity of the Hecke action. The Euler-factor relation: the twisted
theta kernel is a Fourier sum over the functions on a chosen half of `Q` with values in `ℤ/ℓ^M`; a distribution relation
of the universal test functions at a pair `{P, P̄}` under the `r` Hecke double cosets at `P`, with Artin reciprocity for
the uniformiser idele (the inverse of the Frobenius), gives the factor. The proofs of (L1), (L2) and of the distribution
relation are not given here. [FormalProof] states (b) as `Development/AbelianVarietyTheory/Definitions/NonGaloisDescent/GaloisSideTwistedSelmerAuxiliaryPrimes.lean`
(`GlobalTheory.TwSys.PropABCD`), proved in `Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/AevalOneSubOne.lean`
(`GlobalTheory.TwistDet.propABCD_of_rel`), and (c) as `Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/IsLatInOfIndexLe.lean`
(`GlobalTheory.ExportFromInputs.abHyp_fam`), with the Euler-factor relation
`Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/UniversalTwistedSeriesDistributionOfCompatibilitStatement.lean`
(`GlobalTheory.T.universalTwistedSeriesDistribution_of_compatibility`). The Hecke stability and the integrality of (L1) rest
on (c1)–(c3); the proofs of (c2) and (c3) are not given here, and the phase of (c2) is not asserted to be the phase `κ_rat`
of RowTowerAndRallisIdentities §5.11. [FormalProof] states (c1) as
`Development/AbelianVarietyTheory/BlockTheory/NonGaloisCusps/RationalRayLevels.lean`
(`GlobalTheory.IndefiniteRowSideFullHecke.RationalRayLevels.SeriesRat`), (c2) as
`Development/AbelianVarietyTheory/BlockTheory/NonGaloisCusps/TwistSeries.lean`
(`GlobalTheory.IndefiniteRowSideFullHecke.TwistSeries.SerInt`) and (c3) as
`Development/AbelianVarietyTheory/BlockTheory/TwistedDiscreteSeries/HeckeValueIntegrality.lean`
(`GlobalTheory.IndefiniteRowSideFullHecke.UnusedSlot39.HeckeInt`), with the consequence of (c3)
`Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/HeckeOperatorPreservesSupLatticeRealSideStatement.lean`
(`GlobalTheory.T.heckeOperator_preserves_supLattice_realSide`) and its conclusion
`Development/AbelianVarietyTheory/BlockTheory/TwistedDiscreteSeries/HeckeSupportLattices.lean`
(`GlobalTheory.IndefiniteRowSideFullHecke.LatticesOverBalls.HkSupAt`); and it identifies the lattices of (b) with the lattices of
theta series of the tuples twisted by `δ_ℓ` and by `δ_ℓψ_𝔭` in
`Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/ExportSt.lean`
(`GlobalTheory.BigOn.ExportedStatement`).

*Check.* With `ε′ = ℓ^{−2}` in the twist selection, the `2m` conditions of (b) (steps and the two places) are combined either
into one condition, their product (levels and exponent bounds add), or each taken with `ε′/(2m)` (CongruenceModulesOfThetaLifts §7.8 (2) takes finitely
many conditions, each with its own subgroup); one condition per step and place with `ℓ^{−2}` each would allow `2m/ℓ²` in all.
The exponent bound `r·k` depends on the rank `k` of the lattice and on `r`, not on `M`, the number of places or the places.

*NEW*. (a): [FormalProof],
`Development/AbelianVarietyTheory/Definitions/NonGaloisDescent/GaloisSideTwistedSelmerAuxiliaryPrimes.lean`
(`GlobalTheory.TwSys.PropE`); (b) follows from [FormalProof],
`Formalism/SharpRestriction/LevelLetterCocycles/IntegralHeckeForms.lean`
(`Formalism.MainNotions.IntegralHeckeForms.ABHyp`); (c): [FormalProof],
`Development/AbelianVarietyTheory/Definitions/NonGaloisDescent/GaloisSideTwistedSelmerAuxiliaryPrimes.lean`
(`GlobalTheory.TwSys.ThURel`), `Formalism/SharpRestriction/LevelLetterCocycles/DataN.lean`
(`Formalism.BasicNotions.NTw.NonzeroIndexPlace`).
*Needs:* ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19d, RowTowerAndRallisIdentities §5.3, RowTowerAndRallisIdentities §5.8a, RowTowerAndRallisIdentities §5.10a, RowTowerAndRallisIdentities §5.11, ThetaChainsOnDefiniteUnitaryGroups §2.5, CongruenceModulesOfThetaLifts §7.8; SelmerLengthBoundsAndLocalLifting §3.24, SelmerLengthBoundsAndLocalLifting §3.25b, SelmerLengthBoundsAndLocalLifting §3.26.

### 8.20 The local terms of the glued target

Assume the hypotheses of RowTowerAndRallisIdentities §5.8b for the grid of the chain and a scale `x ≥ x_F` with the
size predicate `Size_□` of RowTowerAndRallisIdentities §5.8e, the depth constant `C_F ≥ C_F⁰` and the gap hypotheses of
RowTowerAndRallisIdentities §5.8 (on which the rational structures of RowTowerAndRallisIdentities §5.8 and 7.13 rest). Let `R_0 ⊂ 𝔼_0` be the glued lattice of 7.13 formed in the base-level part `𝔼_0`
(RowTowerAndRallisIdentities §5.4), `D_0 = dim 𝔼_0`, `Tw` the set of twisted places of a twisting datum with sign `s = +1`
(ThetaChainsOnDefiniteUnitaryGroups §2.5) and `ξ_𝔭` the tuple used at `𝔭`. For a step `j` and `𝔭 ∈ Tw` write `𝒜_j`, `M′ ⊂ M`
and `Z_j` for the space of forms on `U(V_j)`, its lattices of `Δ`-valued and of `∇`-valued forms and the lifted subspace of
CongruenceModulesOfThetaLifts §7.15 for the tuple `ξ_𝔭`, and cut them at the base level (CongruenceModulesOfThetaLifts §7.15 (c′)
for the level `(P_0, χ_{P_0})`): `𝒜_j^0 := e·𝒜_j`, `e` the idempotent
of the base level `(P_0, χ_{P_0})` of ThetaChainsOnDefiniteUnitaryGroups §2.9a in the action of `G₀` (in the convention in
which the model lift `θ_j` carries `𝒜_j^0` into the level-`(P_0, χ_{P_0})` part of `𝒞(W_j)`), `M_0 := M ∩ 𝒜_j^0`,
`M′_0 := M′ ∩ 𝒜_j^0` (intersections, not projections) and `Z_j^0 := Z_j ∩ 𝒜_j^0`, of dimension `D_0`
(RowTowerAndRallisIdentities §5.9 for the level parts). On `𝒜_j^0` the form is the class-set product of
CongruenceModulesOfThetaLifts §7.15 divided by `n := |P_0|` (the form of 8.21 (a)); duals of lattices in `Z_j^0` are taken in
`Z_j^0` for this form, and lengths at `𝔭` over the localisation of `𝒪_𝕃`. The *projected lattice* `P_jM` is the orthogonal
projection of `M_0` onto `Z_j^0`, mapped into `M^W_j ⊗ 𝕃` by the rational model lift `θ_j(ξ_𝔭)` (RowTowerAndRallisIdentities §5.7,
RowTowerAndRallisIdentities §5.11, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19). Put
`e_𝔭η_j(𝔭) := length_𝔭(P_jM/(M ∩ Z_j^0))`, the congruence length at the base level (the length `e_𝔭η^{P_0}_j(𝔭)` of
CongruenceModulesOfThetaLifts §7.1 (4)); `𝔧_j(𝔭)` the least `𝔧 ≥ 0` with
`ℓ(𝔭)^𝔧·(M ∩ Z_j^0) ⊂ M′` after localisation at `𝔭` (an exponent of the rational prime `ℓ(𝔭)`, at most the Weyl exponent of
CongruenceModulesOfThetaLifts §7.15); `ℐ_j(𝔭) := [P_jM : (P_jM)^∨]_𝔭` the signed dual index; `D_V` the least common multiple of the
orders of the stabilisers of the classes of `U(V_j)` for the tuple `ξ_𝔭` (CongruenceModulesOfThetaLifts §7.15 (c));
and let `D_V^{all}` be a positive
integer divisible by the order of the stabiliser of every class of `U(V_j)` at the level of ThetaChainsOnDefiniteUnitaryGroups §2.9,
for every step `j` and every tuple that is the base tuple or one of the `ξ_𝔭`, `𝔭 ∈ Tw` (the Minkowski number for
`GL_{2f(r+t)}(ℚ)` is one, CongruenceModulesOfThetaLifts §7.15 (c)). Let `G₀` be the finite group of the types at `g₀, g₁`, `s₀` the least positive integer with
`s₀·∇_𝒸^∨ ⊂ Δ_𝒸` and `s₀·Δ_𝒸 ⊂ ∇_𝒸^∨` for the coefficient lattices `Δ_𝒸 ⊂ ∇_𝒸` at every class `𝒸`, of the forms on `U(X^h)`
and of the forms on the groups `U(V_j)` of the steps (the Weyl lattices tensored with the integral models of the types),
`F_j(𝔭)` the bulk of LocalGainOfThetaChains §4.9f (d) (one number, the flow programme summed over all
Frobenius orbits above `ℓ(𝔭)`; the same number enters the column side through LocalGainOfThetaChains §4.9f: at a prime inert in `K` and in
`ℚ(√−q)` the column side claims `F_j(𝔭) − 𝔉^A_j(𝔭)` and returns the part `𝔉^A_j(𝔭) ≤ 2f·m·b/ℓ(𝔭)` at the places of `𝒜_p`, which
contain every linked place, inside its cost LocalGainOfThetaChains §4.9f (e)), and `ℓ(𝔭)` the residue characteristic of `𝔭`.

*The theta data of a step.* The *own primes* are the auxiliary primes `p_δ, p′_δ` of ThetaChainsOnDefiniteUnitaryGroups §2.4 (b) (distinct, `≡ 1 (mod 2o_δ·f_E)`, hence
totally split in `E`, different from `g₀, g₁` and from every twisted prime, ThetaChainsOnDefiniteUnitaryGroups §2.5); `p_o` denotes either of them. They are prime to `Q·q·d` (`Q` of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a)
and split in `K`; `ζ_{p_o} ∈ 𝕂` and the ray class field `K(g₀g₁p_o)` of `K` lies in `𝕂` (ThetaChainsOnDefiniteUnitaryGroups §2.6 (a) (ii)), so the cover of level `g₀g₁·p_o` (ideal level times
`𝔓_o𝒪_E`) is defined over `𝕂` itself, with geometrically irreducible components (clause (o) below). The *logarithmic size* is a number `L ≥ max(3, log k)` with `log g_i ≤ 9L + 1`, `log rd_E, log d, log f ≤ 2L`,
`log p_δ, log p′_δ ≤ L`, and `log(1 + DF(w)) ≤ 2L`, `log n(w) ≤ L` for the weights `w` of the runs below (in the chain `L = x^ε`). For
each step `j` there are two runs of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a, one for each own prime `p_o`: the short theta series of a run are realised on the
cover of level multiplied by `p_o` (ideal level multiplied by `𝔓_o𝒪_E`, `𝔓_o` a prime of `K` above `p_o`, `𝔓_o + c𝔓_o = 1`), at the
level `g₀g₁p_o`, and are integral only after multiplication by a power of `p_o` at the places above `p_o` ((vii) (b) below); so each
run is used only at the places whose residue characteristic is not its own prime, and the two runs cover every place. For
a run: an integer `T ≥ 1`, its degree, and the weights
`w_L`, `w_F` with `w_F + T·w_L = λ^W_j` (the weight of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19), `n` the dimension of the flag bundle, defined by
division with remainder: with `κ := λ^W_j` and `T′ := T + n + 2`, `w_L` is the weight of scalar weight `n_W` whose consecutive gaps are
`⌊(gap(κ) + 2)/T′⌋`, with last entries `⌊(κ_{τ,p_j−1} − (n + 2)n_W − 2r)/T′⌋` and `⌊κ_{τ,q_j−1}/T′⌋` in the two blocks, and `w_F := κ − T·w_L`,
of scalar weight `n_P = r + t − T·n_W`; with `N`, `c_ℓ`, `s_W`, `ν*`,
`ν_dep` of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a for `w_L`, put `z(w) := p_o^{DF(w)+2f·r·n(w)}` and
`s_F := z(w_F)·N(w_F)·∏_{ℓ∈S_small∪{q,d}} ℓ^{c_ℓ(w_F)}`, `s_0 := z(w_F + n·w_L)·N(w_L)^n·N(w_F)·∏_ℓ ℓ^{n·c_ℓ(w_L)+c_ℓ(w_F)}`,
`s_K := z(λ^W_j)·N(λ^W_j)·∏_ℓ ℓ^{T·c_ℓ(w_L)+c_ℓ(w_F)}`. The *scalar of step `j`* is
`𝔰_j := N_j·(g₀g₁)^{f·r·n_P⁰}·∏_{ℓ∈S_small∪{q,d}} ℓ^{T·c_ℓ(w_L)+c_ℓ(w_F)}`, `N_j := N(λ^W_j)`, `n_P⁰` the threshold of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a (N1); for a place
`v` of `𝕃` put `n_j(v) := v_v(N_j)/e_v`, which is `D⁺_j := D⁺(λ^W_j)` at the places above `π` and `D⁻_j := D⁻(λ^W_j)` at the places
above `π̄`, so that `n_j(𝔭) + n_j(c_𝕃(𝔭)) = D⁺_j + D⁻_j = DF(λ^W_j) = D^H_j` at the type primes, by the definitions of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19 and
LocalGainOfThetaChains §4.9f (d). For a place `v` of `𝕃` above the place `𝔩` of `𝕂` (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a) and the prime `ℓ`, `e₁(v)` the ramification index of `v` over
`𝔩`: `E_j(v) := e₁(v)·⌈e_𝔩·T·(ν*(𝔩) + [ℓ ∈ {g₀, g₁, q, d} ∪ S_small])⌉` (an admissible exponent for ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18b with ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a, being at
least `e₁(v)·T·ν_dep(𝔩)`) and `ϵ_j(v) := (E_j(v) − v_v(𝔰_j))/e_v`. Let `DF` be a number at least `DF(w_L)` for every step and
run, `wt_j := 2f·b`, `θ_k(ℓ) := ℓ^{−i₀}` with `i₀` the least odd `i ≥ 3` with `k^{3/2} < ℓ^i`
(so `Σ_ℓ θ_k(ℓ)·log ℓ ≤ C/k`), and `S_small` and `vd` those of `SizeDep` (ThetaChainsOnDefiniteUnitaryGroups §2.1): `vd` is at
least `v_ℓ(f_E)`, hence at least `v_ℓ(Q)` (`Q` of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a) and the
mean different exponent of `E`, at every `ℓ ∈ S_small`.

*The page conditions* (`SizePage`) for a run of step `j`, with constants `C₁, C_P ≥ 0` fixed before `ε`:
(P1) `2·DF(λ^W_j) + 2 < g_i` (`i = 0, 1`), where `λ^W_j = w_F + T·w_L`;
(P2) `DF(λ^W_j) ≤ k·(2f·b + f(Sc + η_w))` and `k ≤ min(q, d) − 1`;
(P3) `m ≥ 2`, `k ≥ m + 3`, every prime inert in `K` is `≥ 5`; `w_j(τ) > 0`; with `W(τ)` the gap of `w_L` at the index `k − 1` at the big
position of `τ` and `R_w^{tot}` its remaining degree summed over the orbits: `(1 − θ₀)·w_j(τ) ≤ T·W(τ) ≤ w_j(τ) + C₁(Sc + η_w)` for some `0 ≤ θ₀ ≤ 1` with
`(k − 1)θ₀ ≤ 5m`; `R_w^{tot} ≥ 0` and `T·R_w^{tot} ≤ C₁·f·k·(Sc + η_w)`; `T·(w_L)_{τ,0} ≤ 3b` for every `τ`; `n(w_L) ≥ 10r(f + f²(k − 1)³L²/m)` for the logarithmic size `L`; `w_j(τ′) ≤ X″·w_j(τ)` for all `τ, τ′`;
(P4) with `A := (2b + Sc)/T`: `(w_L)_{τ,0} ≤ A` for `τ ∈ Φ`, and
`T·(f·q_j·(1 + vd/2)·A + q_j·Σ_{τ∉Φ}(w_L)_{τ,0}) ≤ C_P·m·(2 + vd)·(2f·b + f(Sc + η_w))`, `C_P ≥ 1`;
(P5) `0 ≤ min(w_j(τ), w_j(cσ_dτ)) ≤ 2b′` on every pair of places exchanged by the inertia at `d`.

*The support condition (T3) on the twisting datum* (a condition of chain data on `Tw`): at every place `𝔭 ∉ Tw` and at `c_𝕃(𝔭)`, for every step `j`, the base tuple has signed
index `0` (the difference of the two relative lengths) of its lattice of theta lifts against the integral lattice of step `j`,
and signed index `0` of its projected lattice against the dual (the dual index is that of 8.20 (iv); `n` is a product of powers
of `g₀` and `g₁`, so at a place not above `g₀g₁` it is also the index for the class-set product itself), and `F_j(𝔭) = 0`. Prove:

(o) *The own primes.* For each own prime `p_o`, `ζ_{p_o}` and the ray class field `K(g₀g₁p_o)` of `K` lie in the coefficient field `𝕂`; so every
automorphism of `ℂ` fixing `𝕂` fixes the CM elliptic curve `ℂ/𝒪_K` with its level structure of level `g₀g₁p_o` up to isomorphism, and the
cover of level `g₀g₁·p_o` is defined over `𝕂`, with geometrically irreducible components;

(i) at every place `𝔭` outside `Tw` and outside the support of the Gram determinant of a local basis of `R_0` (for the
quotient form, the basis taken at the pair `{𝔭, c_𝕃(𝔭)}`) the Gram valuation vanishes, and, under (T3), so do the local indices of
`θ_j(1)(P_jM)` in `M^W_j` and the dual indices of (iv);

(ii) that Gram determinant has `v_𝔭 ≤ D_0·v_𝔭(|G₀|·s₀)`;

(iii) `Σ_𝔭 ϱ(𝔭)·v_𝔭(|G₀|·s₀) ≤ log|G₀| + log s₀ =: LG`;

(iv) at `𝔭 ∈ Tw`, the signed dual index `ℐ_j(𝔭) = [P_jM : (P_jM)^∨]_𝔭` (the one the gluing identity charges: of the
base-level lattice, for the class-set product divided by `n = |P_0|`) satisfies
`ℐ_j(𝔭) ≤ e_𝔭η_j(𝔭) + D_0·e_𝔭·(𝔧_j(𝔭) + v_{ℓ(𝔭)}(n·D_V·s₀))`
(`n·D_V = |P_0|·D_V` is the integer of CongruenceModulesOfThetaLifts §7.15 (c′) at the base level, the factor `n` coming only
from the normalisation of the form: for the class-set product itself the bound holds with `D_V·s₀`; and `s₀ = 1` for the
lattices of the chain);

(v) the *duality term* `E2_j := Σ_{𝔭∈Tw} ϱ(𝔭)·(e_𝔭η_j(𝔭)/D_0 + e_𝔭v_{ℓ(𝔭)}(n·D_V^{all}·s₀))` satisfies
`E2_j ≤ Σ_{𝔭∈Tw} ϱ(𝔭)e_𝔭η_j(𝔭)/D_0 + log n + log D_V^{all} + log s₀`, with `log n = log|P_0| ≤ log|G₀|`; and for a good twisting datum (CongruenceModulesOfThetaLifts §7.10a) and a host with wild-kernel budget `κ_W` (CongruenceModulesOfThetaLifts §7.11), under
the chain data and the size conditions of CongruenceModulesOfThetaLifts §7.10a, its depth hypothesis and the length bound
`L_th ≤ C_L·log x` of
CongruenceModulesOfThetaLifts §7.10c, for `x` at least the threshold of CongruenceModulesOfThetaLifts §7.11,
`E2_j ≤ (C + κ_W)·x^ε·(B₀ + N_c) + log n + log D_V^{all} + log s₀`, `C` depending only on `C_L`, `C_t`, `A_max`;

(vi) `Σ_{𝔭∈Tw} ϱ(𝔭)·e_𝔭·2/ℓ(𝔭)² ≤ Σ_ℓ 2·log ℓ/ℓ² < 1 =: E3`;

(vii) *The generation inputs.* For every step `j` and both runs, the weights of the run satisfy `T·(w_L)_{τ,i} ≤ κ_{τ,i}` for all entries,
`T·DF(w_L) ≤ DF(κ)`, `T ≤ (w_L)_{τ,p_j−1} + 1` and `|w_F| ≤ (n + 2)|w_L| + 5f·r²·T`; with a share parameter `δ₂ ∈ [x^{−ε}, 1]` they satisfy, at the
parameters of the chain, the size conditions (N1), (N2) of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a (`SizeGen`) and the page conditions `SizePage` above; and, in the notation of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a
and with the logarithmic size `L`:
(a) (*sup norms*) for every weight `w` of the runs (`w_L`, `w_F`, `w_F + n·w_L`, `λ^W_j`, and the two weights of (N5)), which has
`r ≤ n(w)` and positive last entries: a theta rule of weight `w` with harmonic polynomial `P` has, at every embedding `σ`,
`log sup_σ ≤ log‖P‖_{1,σ} + 10·L·|a(w)| + 200·f·r·n(w)·L`; `Th^{all}(w)` is generated over `𝒪_𝕂` by at most
`(g₀g₁)^{f·r·n(w)}·[𝕂:ℚ]·(1 + DF(w))^{f·r·n(w)}` rules of logarithmic sup norm at most
`400·f·r·L·|w| + 3f·r·n(w)·L + 5·log[𝕂:ℚ] + log|d_𝕂|/[𝕂:ℚ] + 2`; and every short theta series of weight `w` is a `𝕂`-combination of short
theta series of logarithmic sup norm at most `400·f·r·L·|w|`;
(b) (*integrality of theta rules*) with `vd(p) := v_p(disc E)/[E:ℚ]` and the valuation `v_y` at a point normalised by
`v_y(ϖ_𝔩) = 1`: for every weight `w`, every theta rule `g` of weight `w`, every finite place `𝔩` of `𝕂` and every integral framed point `y`
above `𝔩` over a complete discrete valuation ring with finite residue field,
`v_y(g) ≥ −(v_𝔩(N(w)) + Σ_{p | f_E} v_𝔩(p)·vd(p)·DF(w)/2)`, and for a short theta series `g` of weight `w` of a run with own prime `p_o`,
`v_y(g) ≥ −(v_𝔩(N(w)) + Σ_{p | f_E} v_𝔩(p)·vd(p)·DF(w)/2 + v_𝔩(g₀g₁)·f·r·n(w) + v_𝔩(p_o)·(DF(w) + f·r·n(w)))`; and
`vd(q), vd(d) ≤ 1` (the bounds are those of a host Galois over `ℚ`, FrobeniusRestrictedRieszSums §0.1, with `HostSplitting E`, FrobeniusRestrictedRieszSums §0.3: no prime of `E`
above a prime dividing `f_E` is fixed by complex conjugation; the level `g₀g₁` is odd, each of its primes is `α·ᾱ` with `α | π` and
the half-level ideal in `(ᾱ)`);
(c) (*base points, with a norm bound*) for every weight `w` with `r ≤ n(w)`, positive last entries and `DF(w) + 2 ≤ min(g₀, g₁)`,
the two weights of (N5) (which exist and are dominant with positive last entries) among them: on every connected component
at the good embedding some theta rule of weight `w` whose harmonic polynomial has `ℓ¹`-norm `≤ exp(140·r·L·|a(w)|)` at every
embedding is nonzero at some point; and the number `N_c` of connected components at the good embedding satisfies
`log N_c ≤ 41·(f·r·L)²`;
(d) (I2), (I3), (I4) of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a for the weight `λ^W_j`;
(e) (the quotient by the deep cusp forms) the level structure is principal of level `M`, the similitude level is `1`,
`r ≥ 3`, and the automorphy characters of the weight are trivial on the arithmetic groups and on the transvections of level
`M′`; there are `ρ_P` linear forms on the forms of weight `λ^W_j` over a number field `𝕂₁ ⊃ 𝕂`, the coefficients,
in the parameter and in the letters, of a form along algebraic arcs over number fields into boundary strata of rank one over
`𝒪_E` whose abelian part has complex multiplication, with: (kill) for such an arc, a cocharacter `ξ ≠ 0` and `ν₀ ∈ E` tied to the
order of the coefficient there are a component, an isotropic `ξ′`, frames `fr(x)` of the domain, `u₁ ≠ 0` and `κ(x) ≠ 0` with
`coeff(F; x)·u₁^{order} = κ(x)·FJ_{ξ′, Re τ(ν₀)}(F)(fr(x))` for every tuple `x` of invertible letter matrices and every bounded `F`;
(detect) a cusp form that is not deep has a nonzero Fourier–Jacobi coefficient of trace `≤ c₁` (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a (I5)) at a frame where the
Hermitian lattice splits along the isotropic direction into pieces of bounded size, its frequency is `Re τ(ν₀)` for a totally
real `ν₀` with `τ(ν₀) ≥ 0`, integral against the transvection lattice, and such a point carries an arc as above, over some
number field, whose frame it is, with complex multiplication data of bounded integer `n′` and bounded size (the `n′` of
(integrality); no bound for the degree of the field is asserted or needed); (integrality) at every finite place the coefficient of an integral form has order
at least that of its value line minus `e·|a(λ^W_j)|·max(v(d_E), v(n′))`; (size) the archimedean bound and the degree bound of
the value lines that (arch), (deg) of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a‴ ask;
(f) the chosen generators of `𝒲` and the chosen short theta series of the weights `w_F`, `w_F + n·w_L`, `λ^W_j` have bounded sup
norms, and the statements of (I6) over the Gauss point of the space of coefficients hold (interpolation, division with
jets, regularity terms, independence of the leading monomials, the two dimension bounds: the passage of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18a (e) from the
complex points to the Gauss point);
(g) for `j < m`: a boundary form `η` of the shape of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a′ (c), nonzero on every component, a cusp form, with its
archimedean bound; the local point data on the generic zero-cycle of (I8); and the two height inequalities of (I8) (for
`j = m` the height inequality);
(h) (Ch) every algebraic integral framed point of the step variety has, after a finite extension of the valuation ring, a
uniformised model (its integral charts, with saturated frames and a chart depth which, for every multiplier, is independent of
the chart, are TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.8b′).

*Route.* (o) `p_o` and the odd number `g₀g₁p_o ≥ 3` divide `N = g₀g₁p_δp′_δ`, so ThetaChainsOnDefiniteUnitaryGroups §2.6 (a) (ii) gives `ζ_{p_o} ∈ 𝕂`,
`K(g₀g₁p_o) ⊂ 𝕂` and the statement on the curve; the passage from these to geometrically irreducible components of the cover is not
given here ([FormalProof], `Development/AbelianVarietyTheory/Proofs/HeightProofs/ExistsSpecialPrimeLevelCoverOfFieldConditionsStatement.lean`
(`GlobalTheory.T.exists_specialPrime_levelCover_of_fieldConditions`)). (vii) The weights are explicit: floor division gives `T·⌊(y + 2)/T′⌋ ≤ y` for `y ≥ 0`, hence the entrywise bounds and (N1);
with `DF(κ) ≤ k·(2f·b + f(Sc + η_w))` the size conditions of the chain give (N2), (P1) and (P2). (P4):
`T·(w_L)_{τ,i} ≤ κ_{τ,i}` entrywise (floor division). The first entry of `κ = λ^W_j` is at most `w_j(τ) + Sc` in the block of
size `p_j` and at most `η_w` in the block of size `q_j`; and `0 ≤ w_j(τ) ≤ 2b` when `x ≥ 3` and `k·b′ ≤ b` (the windows of
ThetaChainsOnDefiniteUnitaryGroups §2.3b). At `τ ∈ Φ` the entry `(w_L)_{τ,0}` is the first of the block of size `p_j`, at
`τ ∉ Φ` the first of the block of size `q_j`; so `T·(w_L)_{τ,0} ≤ 2b + Sc` on `Φ` and `T·Σ_{τ∉Φ}(w_L)_{τ,0} ≤ f·η_w`. Hence the
left side is `q_j·(f(1 + vd/2)(2b + Sc) + T·Σ_{τ∉Φ}(w_L)_{τ,0}) ≤ q_j(2 + vd)(2f·b + f(Sc + η_w))`, and `q_j = m − j ≤ m`.
(P3) holds for these weights with `C₁ = 100` and `θ₀ := (D_Y + 4)/T`, `D_Y := f·binom(r, 2)`: `θ₀ ≤ 1` and `(k − 1)θ₀ ≤ 5m` by
the lower bounds `40(D_Y + 2) ≤ T` and `D_Y·k/m ≤ T` for the degree at the parameters of the chain; `w_j(τ) ≥ w″ > 0`;
`(1 − θ₀)·w_j(τ) ≤ T·W(τ) ≤ w_j(τ) + 100(Sc + η_w)`, `0 ≤ R_w^{tot}` and `T·R_w^{tot} ≤ 100·f·k·(Sc + η_w)`, and
`T·(w_L)_{τ,0} ≤ 3b` (with `w_j(τ) ≤ 2b` for `x ≥ 3`, `k·b′ ≤ b`) are statements of [FormalProof] whose proofs are not given
here; the clause on `n(w_L)` is the window of `n_W`, the ratio clause a
condition of the parameters, and no prime below `5` is inert in `K` under the size conditions. (P5): every step weight is
`≥ 0`, and the step weight at each place of the coset `A` is at most `2b′` (`x ≥ 3`, `k·b′ ≤ b`), so the minimum over a pair
`{τ, cσ_dτ}` is at most `2b′`. (h) is TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.8b′. The routes of (a)–(g) are not
given here. [FormalProof] states the conditions of (P3) on the weights of a run as
`Development/AbelianVarietyTheory/Definitions/Jets/DepthNumbersThresholdEq.lean` (`GlobalTheory.GoodDepth.GoodPage`), proved in
`Development/AbelianVarietyTheory/Proofs/JetHarmonics/GoodPrimeWeightHypothesesOfDepthParametersStatement.lean`
(`GlobalTheory.T.goodPrimeWeightHypotheses_of_depthParameters`); (P5) as
`Formalism/LocalToGlobal/IndefiniteForms/IndefiniteTree/DepthCond.lean` (`Formalism.L2.Indef.Tree.DepthCond.WtRam`), with
`Development/AbelianVarietyTheory/Proofs/JetHarmonics/CloudSizesBetweenZeroAndTwiceBStatement.lean`
(`GlobalTheory.T.cloudSizes_between_zero_and_twice_b`); (a) in `Development/AbelianVarietyTheory/Proofs/CuspFormEvaluations/`,
`LogSupNormThetaGeneratorLeStatement.lean` (`GlobalTheory.T.log_supNorm_thetaGenerator_le`),
`LogSupNormShortThetaGeneratorLeStatement.lean` (`GlobalTheory.T.log_supNorm_shortThetaGenerator_le`) and
`ExistsShortFiniteGeneratorsThetaLatticeStatement.lean` (`GlobalTheory.T.exists_short_finite_generators_thetaLattice`); (b) as
`Development/AbelianVarietyTheory/Statements/ShortVectorBound/ScaledLatticesInSupLattices.lean` (`GlobalTheory.PlaceTop.ThBoundSt`,
`GlobalTheory.PlaceTop.ShortBoundSt`); (c) as `ReciprocityTheory/ReductiveGroups/ArithmeticGeometry/PullbackSections/ThetaWeightBounds.lean`
(`ReciprocityTheory.ChartRestriction.G.PullbackSections.NoBaseSt`), proved in
`Development/AbelianVarietyTheory/Proofs/CuspFormEvaluations/NoBaseComponentShortPolynomialGeneratorStatement.lean`
(`GlobalTheory.T.no_base_component_short_polynomial_generator`), and the count of components in
`Development/AbelianVarietyTheory/Proofs/CuspFormEvaluations/LogCardComponentsLeAtGoodEmbeddingStatement.lean`
(`GlobalTheory.T.log_card_components_le_at_good_embedding`). (i) Off `Tw` the tuple is the base tuple; (T3) is the vanishing of its indices and of `F_j` there. (ii) If `l·M^∨ ⊂ M`
then the Gram determinant of a local basis of a projection `P(M)` for the quotient form `(PH^{−1}P^*)^{−1}` has valuation at
most `D·v(l)`: the dual of `P(M)` is `M^∨ ∩ (ker P)^⊥ ⊂ l^{−1}P(M)` (projection and intersection are dual,
HermitianFormsAndLattices §4.0a (b), in its surjection form). Apply it to the integral forms on `U(X^h)` and the projection of
RowTowerAndRallisIdentities §5.4 with `l = |G₀|·s₀`: `s₀·∇_𝒸^∨ ⊂ Δ_𝒸 ⊂ ∇_𝒸` at every class, so `s₀` times the dual of the
`∇`-valued forms lies in the `∇`-valued forms (DiscreteSeriesCoefficientsAndAutomorphicMetrics
§7.5a), and the good projector has denominators dividing `|G₀|`. (iii) The product formula for the integer `|G₀|·s₀`. (iv) The
forms of `𝒜_j^0` are functions on the classes, and the divided product is their class-set product with the weights `n·|Γ_𝒸|`;
class by class `s₀·Δ_𝒸 ⊂ ∇_𝒸^∨`, and only the weights are lost, so `N_𝔭·M′_0 ⊂ M_0^∨` for `N_𝔭 := n·D_V·s₀` (the stabiliser
orders of the classes for the tuple `ξ_𝔭` divide `D_V`). The dual of the
projection `P_jM` is `M_0^∨ ∩ Z_j^0` (HermitianFormsAndLattices §4.0a (b)), which contains `N_𝔭·ℓ^{𝔧_j(𝔭)}·(M ∩ Z_j^0)` at `𝔭`; hence
the bound (HermitianFormsAndLattices §4.0a (c)): this is CongruenceModulesOfThetaLifts §7.15 (c′) for the level `(P_0, χ_{P_0})`,
with the integer `|P_0|·D_V` (and the factor `s₀`) and the base-level length
`e_𝔭η^{P_0}_j(𝔭)` of CongruenceModulesOfThetaLifts §7.1 (4).
(v) The product formula bounds `Σ_𝔭 ϱ(𝔭)e_𝔭v_ℓ(N)` by `log N` for `N := n·D_V^{all}·s₀`, one integer serving every step and every
tuple (each `N_𝔭` divides it); for a good twisting datum and wild-kernel budget `κ_W`, CongruenceModulesOfThetaLifts §7.11 at the
base level (from CongruenceModulesOfThetaLifts §7.10c at a level, under its length bound) gives
`Σ_𝔭 ϱ(𝔭)e_𝔭η_j(𝔭) ≤ D_0·(C + κ_W)·x^ε·B₀ ≤ D_0·(C + κ_W)·x^ε·(B₀ + N_c)` for the base-level lengths (`d^{Z,P_0}_j = D_0`,
CongruenceModulesOfThetaLifts §7.8a), with its constant `C` and threshold; divided by `D_0` and added to the first bound, this
is the second. [FormalProof] states the bound for the base-level lengths in `Formalism/SharpRestriction/GlobalTheoremInputs.lean`
(`Formalism.MainNotions.LinkN_at`, with `V(E, t)` in place of `κ_W·x^ε·B₀`, and `Formalism.MainNotions.DIVinN_at`). (vi) `Σ_{𝔭|ℓ} ϱ(𝔭)e_𝔭 = log ℓ`, and `Σ_ℓ 2 log ℓ/ℓ² = 0.98618…`.

*Check.* For the scalar: `v_v(𝔰_j)/e_v = T·c_ℓ(w_L) + c_ℓ(w_F)` above `q`, `d` and the small primes, `n_j(v) + f·r·n_P⁰` above the type
primes, `0` elsewhere; with `vd` the mean different exponent alone (and not `v_ℓ(Q)`) the scalar part at a small prime would
be wrong: it is `v_ℓ(Q)·DF`.

*NEW* (this form), elementary given its inputs. The definitions and `SizePage`: [FormalProof],
`Development/AbelianVarietyTheory/Definitions/Jets/CmQuadraticFormEqAlternatingForm.lean` (`GlobalTheory.RunDepth.RunTie`),
`Formalism/LocalToGlobal/CharacterGerms/RestNonneg.lean` (`Formalism.L2.FormalSeriesBounds.RF.DegHyp2`); (o): [FormalProof],
`Development/AbelianVarietyTheory/Definitions/HeightFunctions/NormComparisonConstants.lean`
(`GlobalTheory.FinalJoin2.FieldOK0`),
`Development/AbelianVarietyTheory/Proofs/HeightProofs/ExistsSpecialPrimeLevelCoverOfFieldConditions.lean`
(`GlobalTheory.FinalJoin2.Cover.exists_cover`); (T3): [FormalProof], `Formalism/LocalToGlobal/IndefiniteReal/CutTuples2.lean`
(`Formalism.IndefR.Cx.CxData.W1`); (i) follows from [FormalProof],
`Formalism/LocalToGlobal/Divisibility/LinkDef.lean` (`Formalism.L2.DIV.gram_det_unit_outside`),
`Formalism/LocalToGlobal/IndefiniteForms/IndefSide.lean` (`Formalism.L2.Indef.IndefData.Untwisted`);
(iv) follows from [FormalProof],
`Formalism/LocalToGlobal/Divisibility/LiftLat.lean` (`Formalism.L2.DIV.BoundsIVAt`),
`Formalism/LocalToGlobal/Divisibility/LiftLat.lean` (`Formalism.L2.DIV.BlockDat.DG`),
`Formalism/LocalToGlobal/Divisibility/ClassSum.lean` (`Formalism.L2.DIV.CSD.DGam`); (vi): [FormalProof],
`Formalism/DivisorInequality/DivisorInequalityProofs/BaseLevelBoundsWithCovolumeHolds.lean`
(`Formalism.DivisorInequality.ramified_places_weighted_sum_le_one`); (vii), the opening sentence and (a)–(c): [FormalProof],
`Development/AbelianVarietyTheory/Proofs/CuspFormEvaluations/ExistsShortFiniteGeneratorsThetaLattice.lean`
(`GlobalTheory.ThetaFamily.theta_family`),
`Development/AbelianVarietyTheory/Proofs/CuspFormEvaluations/LogSupNormThetaGeneratorLe.lean`
(`GlobalTheory.RunIn.log_sup_theta_generator_le`); (vii) (d): [FormalProof],
`Formalism/SharpRestriction/GenusPolyhedralBounds/RelativeIndexClassSets/WeightedPrimeSumBound.lean`
(`Formalism.MainNotions.Gaps.EtaleWeightGaps.SupBoundByL2AtWeight`),
`Development/AbelianVarietyTheory/Proofs/CubicalLineBundles/MeanLogSupNormLowerBoundOfCoreLawsStatement.lean`
(`GlobalTheory.T.meanLogSupNorm_lower_bound_of_coreLaws`),
`Formalism/SharpRestriction/GenusPolyhedralBounds/RelativeIndexClassSets/ThetaLeMsupOfSetC.lean`
(`Formalism.MainNotions.Gaps.T0.msup_mul_le`); (vii) (e), (kill): [FormalProof],
`Development/AbelianVarietyTheory/Proofs/ThetaShiftProofs/ArcDatumSectionValueCoeffEqFourierJacobiStatement.lean`
(`GlobalTheory.T.arcDatum_sectionValue_coeff_eq_fourierJacobi`),
`Development/AbelianVarietyTheory/Proofs/ThetaShiftProofs/CmArcFunctionalVanishesLowFourierJacobi.lean`
(`GlobalTheory.ArcKill.cfOf_eq_zero`); (integrality): [FormalProof],
`Development/AbelianVarietyTheory/Proofs/ThetaShiftProofs/CmArcDatumFunctionalFiniteIntegralityBound.lean`
(`GlobalTheory.ArcCM.cfOf_fin_bound`),
`Formalism/LocalToGlobal/ProjectiveLattices/ArchimedeanQuadraticData/FinitePlaceArcs/BeSumStatement.lean`
(`Formalism.L2.Pj.QAt.beOf`); (size): [FormalProof],
`Development/AbelianVarietyTheory/Definitions/ArchimedeanThetaValues/CarchAt.lean` (`GlobalTheory.ArcCM.RoomAt`),
`Development/AbelianVarietyTheory/Proofs/ThetaShiftProofs/QuotientBoundOfKillDetectConstantRoom.lean`
(`GlobalTheory.ArcCM.qat_of_kill_detect`); (vii) (f): [FormalProof],
`Development/AbelianVarietyTheory/Proofs/CuspFormEvaluations/ExistsAdmissibleThetaLatticeGenerators.lean`
(`GlobalTheory.RunJoin.exists_genOK`),
`Development/AbelianVarietyTheory/Proofs/CuspFormEvaluations/AnalyticFactsOfThetaDataOnModelsStatement.lean`
(`GlobalTheory.T.analyticFacts_of_thetaData_on_models`), `Development/AbelianVarietyTheory/Definitions/ThetaValues/Generic.lean`
(`GlobalTheory.Shares.AnFacts`); (vii) (g), the form `η`: [FormalProof],
`Development/AbelianVarietyTheory/Proofs/TorusSplitting/ExistsCuspFormFourClausesExplicitConstant.lean`
(`GlobalTheory.EtaAn.exists_form_four_clauses`), `Formalism/LocalToGlobal/ProjectiveLattices/Adm3OfExtension.lean`
(`Formalism.L2.Pj.ETEx`), `Development/AbelianVarietyTheory/Definitions/HeightFunctions/GrowthConstantBoundGcR.lean`
(`GlobalTheory.RunJoin.EtaOK`); the height inequalities: [FormalProof],
`ReciprocityTheory/ReductiveGroups/ArithmeticGeometry/HeightTheory/HtMain.lean`
(`ReciprocityTheory.ChartRestriction.G.T0.Data.heights`),
`Formalism/SharpRestriction/GenusPolyhedralBounds/RelativeIndexClassSets/SectionSheafQuotient.lean`
(`Formalism.MainNotions.Gaps.HeightData.HtConcl`); (vii) (h): [FormalProof],
`Development/AbelianVarietyTheory/Proofs/JetHarmonics/ExistsExtensionAllModelsUniformizedStatement.lean`
(`GlobalTheory.T.exists_extension_all_models_uniformized`),
`Development/AbelianVarietyTheory/Proofs/JetHarmonics/RunDepthDataLawsAndFiniteLocalDepth.lean`
(`GlobalTheory.RunDepth.laws_and_nuFinAt`).
*Needs:* FrobeniusRestrictedRieszSums §0.1, FrobeniusRestrictedRieszSums §0.3, FrobeniusRestrictedRieszSums §0.4, ThetaChainsOnDefiniteUnitaryGroups §2.4, TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.8b′, LocalGainOfThetaChains §4.9f, RowTowerAndRallisIdentities §5.4, RowTowerAndRallisIdentities §5.7, RowTowerAndRallisIdentities §5.8, RowTowerAndRallisIdentities §5.8b, RowTowerAndRallisIdentities §5.8d, RowTowerAndRallisIdentities §5.8e, RowTowerAndRallisIdentities §5.9, RowTowerAndRallisIdentities §5.11, CongruenceModulesOfThetaLifts §7.1, CongruenceModulesOfThetaLifts §7.5a, CongruenceModulesOfThetaLifts §7.5b, CongruenceModulesOfThetaLifts §7.8a, CongruenceModulesOfThetaLifts §7.10c, CongruenceModulesOfThetaLifts §7.11, 7.13, CongruenceModulesOfThetaLifts §7.15, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a, ThetaChainsOnDefiniteUnitaryGroups §2.1, ThetaChainsOnDefiniteUnitaryGroups §2.3b, ThetaChainsOnDefiniteUnitaryGroups §2.5,
ThetaChainsOnDefiniteUnitaryGroups §2.9, ThetaChainsOnDefiniteUnitaryGroups §2.9a; HermitianFormsAndLattices §4.0a (b), (c); DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5a.

### 8.20a The depth table

In the notation of 8.20, with `C₁`, `C_P` the constants of `SizePage`, there is
`C₀ ≥ 20`, depending only on `C₁`, such that for every `C ≥ max(C₀, C_P)`, with `Y := C·DF` and
`aE_j(ℓ) := C·(log k·m·wt_j + f·k·(Sc + η_w))/ℓ + C·k·wt_j·θ_k(ℓ) + [ℓ > X″]·C·k·wt_j/ℓ²`, every step `j` and every twisted place `𝔭`
above a prime `ℓ`, with
`𝔭′ := c_𝕃(𝔭)` and the run whose own prime is not `ℓ`, the following clauses hold:
(good) if `ℓ ∉ {g₀, g₁, q, d} ∪ S_small` and `ℓ ≤ Y`: `ϵ_j(𝔭), ϵ_j(𝔭′) ≤ F_j(𝔭) + aE_j(ℓ) + 1`; if `ℓ > Y`: `ϵ_j(𝔭) = ϵ_j(𝔭′) = 0`;
(small) if `ℓ ∈ S_small`: `ϵ_j(𝔭), ϵ_j(𝔭′) ≤ C·m·(2 + vd)·(wt_j + f(Sc + η_w)) + T + 1`;
(auxiliary) if `ℓ ∈ {q, d}`: `ϵ_j(𝔭), ϵ_j(𝔭′) ≤ wt_j + f(Sc + η_w) + T + 1`;
(type) if `ℓ ∈ {g₀, g₁}`: `ϵ_j(𝔭) ≤ 2T − n_j(𝔭)` and `ϵ_j(𝔭′) ≤ 2T − n_j(𝔭′)`, so `ϵ_j(𝔭) + ϵ_j(𝔭′) ≤ 4T + 2F_j(𝔭)`;
under the page conditions `SizePage` of 8.20, (Ch) of 8.20 (vii) (h), and the integral charts of TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.8b′.
The values of `F_j` (`0` above `q` and the small primes, `−D^H_j/2` above the type primes, `−2f·k·b′ ≤ F_j ≤ 0` above `d` by (P5),
`≥ 0` elsewhere) are LocalGainOfThetaChains §4.9f (d); every prime ramified in `E` lies in `S_small ∪ {q, d}` (ThetaChainsOnDefiniteUnitaryGroups §2.1).

*Route.* (1) *Rounding:* for integers `e₁, e₂ ≥ 1` and real `x`, `e₁⌈e₂x⌉/(e₁e₂) < x + 1/e₂`. (2) *The scalar* (8.20, Check):
`v_v(𝔰_j)/e_v = T·c_ℓ(w_L) + c_ℓ(w_F)` above `q`, `d` and `S_small`; `= n_j(v) + f·r·n_P⁰` above `g₀, g₁`; `0` elsewhere. (3) *Good primes:*
throughout, `ν_W(𝔩)` is the depth of TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.8b of the weight `w_L` on `n(w_L)` copies
with multiplier the integer `M = g₀g₁` of the level of the step varieties (the factor is `exp(M·Σ_bh_L(x_b))`), cut off below
at `0` (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a (N4′)); the clauses of
TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.19f are used with this multiplier, at primes `ℓ ∤ M`; the bounds of steps (4)
and (5) hold for every multiplier.
`ϵ_j = E_j/e_v < T·ν_W(𝔩) + 1`. If `ℓ·T·f·(k − 1)³·L ≥ m·b`, the first rows of `w_L` are `≤ 3b/T ≤ s·(ℓ − 1)` with
`s = ⌈(9/2)·f(k − 1)³L/m⌉` and `4r·s·f ≤ n(w_L)` (as `L ≥ 3`), so the depth-zero clause TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.19f (g4) applies on the copies the page
provides and `ν_W(𝔩) = 0`. Otherwise TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.19d and TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.19f (a), with the row datum of TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.19e (c) at the points of the chain (signature
`(p_j, q_j) = (k + j − 1, m − j)`; `ℓ ≠ 2`, `ℓ ∤ disc(E)`, `ℓ` prime to the level; the row datum at the orbits disjoint from their
conjugate; TaylorBoundsAndDepthsOnHeightTwoFormalGroups §§4.19e (c), 4.19f ask that the polarisation of the moduli problem be
principal, as it is for the step varieties: they are moduli of principally polarised abelian schemes with a marking at
similitude level one, in the setting of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §§8.11–8.19d),
summed over the Frobenius orbits (`Σn_o = f`, `Σ_{orbits}Σ_aw(a) ≤ wt_j`, `j_t = m`, `n = k − 1`; orbits of type (A) at a
prime inert in `K` of split type; the term `T·R_w^{tot}/(ℓ − 1)` of TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.19d with the total remaining degree, bounded by (P3);
the depth on the `n(w_L) ≥ f·((i₀ + 1)(k − 1) + 8r)` copies that TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.19f asks, which (P3) provides as
`i₀ ≤ 2L + 3`), or the
clause of TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.19f for the type of the orbits (g2 at a prime split in `K`, type (K), at every `ℓ ≥ 3`, so also at a split prime `3`;
g1 for Frobenius equal to complex conjugation, type (C); g3 for odd conjugate type (O), whose orbits alternate between `Φ` and
`cΦ` (below)), gives
`T·ν_W ≤ F_j + C(log k·m·wt_j/ℓ + f·k(Sc + η_w)/ℓ + k·θ_k(ℓ)·wt_j + [ℓ > X″]·k·wt_j/ℓ² + T·f(k − 1)³log²k)`, and the last term is
`< log k·m·b/ℓ ≤ log k·m·wt_j/ℓ` (here `b ≤ wt_j` is used). For `ℓ > DF(w_L)`: `ν_W = 0` (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a′ (a)), `E_j = 0`, and `F_j ≥ 0` above `Y`.
The local inputs at every point: the unramified Hodge–Tate colength bound TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.8c above the odd primes outside
`S_small ∪ {q, d}`, in the charts of (Ch). (4) *Auxiliary primes:* `ν_W ≤ DF(w_L)/(ℓ − 1)` (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a′ (a)), so
`ϵ_j < T·ν_W + T + 1 − c_ℓ(w_F) ≤ DF(λ^W_j)/(ℓ − 1) + T + 1 ≤ wt_j + f(Sc + η_w) + T + 1` by (P2). (5) *Small primes:* every small
prime splits in `K`, so (U1), (U2) of TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.18 (a) hold; TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.18 (a)–(b) in its product form: at a place `w` with `n_w` embeddings in `Φ`
(the small prime splits in `K`, so a place `w` above the prime of `K` that `Φ` singles out has `w ≠ w̄` and all its embeddings in `Φ`;
the eigen-submodules have the constant ranks `p_j` at `w` and `q_j` at `w̄`, and the exponent `v_ℓ(disc(E_w/ℚ_ℓ))/n_w` of the different
at `w` is `vd(ℓ) ≤ vd`: these are the hypotheses of HodgeTateLatticesAndLubinTateLogarithms §0.5e),
HodgeTateLatticesAndLubinTateLogarithms §0.5e bounds the PRODUCT of the colengths over these embeddings by `|ℓ|^{n_w·q_j·(1/(ℓ − 1) + vd/2)}`,
so the exponents `len(τ)` with this product satisfy `Σ_τ len(τ)·(w_L)_{τ,0} ≤ n_w·q_j·(1/(ℓ − 1) + vd/2)·max_τ(w_L)_{τ,0}` (no exponent is
assigned to a single embedding), and `q_j/(ℓ − 1)` off `Φ` (the Hodge–Tate inclusion in chart form, HodgeTateLatticesAndLubinTateLogarithms §0.5f); summed over the places,
`ν_W ≤ f·q_j(1 + vd/2)A + q_jΣ_{τ∉Φ}(w_L)_{τ,0}` with `A ≥ (w_L)_{τ,0}` on `Φ`; then (P4) and `C_P ≤ C`. (6) *Type primes:* `T·ν* < 1/2` by (P1); `e_𝔩T` is an
integer, so `E_j/e_v ≤ T + (e_𝔩 + 1)/(2e_𝔩) ≤ T + 1`, and `ϵ_j(v) ≤ 2T − n_j(v)`; `n_j(𝔭) + n_j(𝔭′) = D⁺_j + D⁻_j = D^H_j = −2F_j(𝔭)` by ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19 and LocalGainOfThetaChains §4.9f (d). The
direction: "depth `≤` flow programme" is an upper bound for the row depth, and the column side uses the same number `F_j` as a
lower bound for its divisibility (LocalGainOfThetaChains §4.9f (d)); nothing is asserted as an equality. The passage from the chart depths to the
numbers `ϵ_j` is the rounding and the bookkeeping of the scalar `𝔰_j` (steps (1)–(2)). Every orbit at a prime `ℓ` inert in
`K` alternates between `Φ` and `cΦ`: `Φ = ι₀∘Gal(E/K)`, `E/ℚ` is abelian and `Frob_ℓ` restricts to the nontrivial automorphism
of `K`, so `ι₀∘g∘Frob_ℓ^s ∈ Φ` exactly for even `s`. So at the primes of odd conjugate type the hypothesis of
TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.19f (g3) holds at every orbit, and the clauses (a), (g1), (g2), (g3), (g4)
cover every good place. [FormalProof] states
step (3) at every good place as `Development/AbelianVarietyTheory/Definitions/Jets/DepthNumbersThresholdEq.lean`
(`GlobalTheory.GoodDepth.NuGoodSt`), proved in `Development/AbelianVarietyTheory/Proofs/JetHarmonics/GoodPlaceDepthBoundProofStatement.lean`
(`GlobalTheory.T.goodPlaceDepthBound_proof`).

*Check.* `g = 13`, `T = 3`, `DF(w_L) = 1`, `(D⁺, D⁻) = (3, 2)`, `e_𝔩 = 12`, `e₁ = 2`: `E = 78`, `E/e_v = 13/4 ≤ T + 13/24`. The table
contains no theta function: `E_j` and `𝔰_j` are defined by formulas. Without the case split of step (3) the error
`T·f(k − 1)³log²k` of TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.19d would not be in `aE_j(ℓ)`.

*NEW* (this form), elementary given its inputs. (good), (auxiliary), (type) and the form of (small): [FormalProof],
`Formalism/LocalToGlobal/IndefiniteForms/IndefiniteTree/ExampleSatisfiesConditionsAtFive.lean`
(`Formalism.L2.Indef.Tree.LeafDepthGood`), `Development/AbelianVarietyTheory/Proofs/JetHarmonics/LeafDepthAllRun.lean`
(`GlobalTheory.RunDepth.leafDepth_all_run`).
*Needs:* ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a′, 8.20; TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.8b, TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.8b′, TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.8c, LocalGainOfThetaChains §4.9f, TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.18, TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.19d, TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.19e, TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.19f, ThetaChainsOnDefiniteUnitaryGroups §2.1, ThetaChainsOnDefiniteUnitaryGroups §2.3b,
ThetaChainsOnDefiniteUnitaryGroups §2.9a; HodgeTateLatticesAndLubinTateLogarithms §§0.5e, 0.5f.

### 8.20b The indices at the twisted places and the total of the local terms

In the
notation of 8.20, for a twisting datum that is good (CongruenceModulesOfThetaLifts §7.10a) for the polynomial conditions of 8.19e (a) and (b), and under the
hypotheses of RowTowerAndRallisIdentities §5.8b for the grid of the chain and a scale `x ≥ x_F` with the size predicate `Size_□` of RowTowerAndRallisIdentities §5.8e,
the depth constant `C_F ≥ C_F⁰` and the gap hypotheses of RowTowerAndRallisIdentities §5.8,
and the condition (N0) of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a for the runs of 8.20,
for every `𝔭 ∈ Tw`: `Σ_j` (the local indices of `θ_j(ξ_𝔭)(P_jM)` in `M^W_j` at `𝔭` and at `c_𝕃(𝔭)`)
`≤ (Σ_j(2e_𝔭F_j(𝔭) + e_𝔭·err_j(𝔭)) + 2e_𝔭/ℓ(𝔭)²)·D_0`, where `err_j(𝔭)` is the sum of the remainders `r(𝔩)/(e_𝔩·[P : U]·D_0)` of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a at `𝔭`,
`𝔭′` and of the depth error `ϵ_j(𝔭) + ϵ_j(𝔭′) − 2F_j(𝔭)`, plus `4f·r²` at the type primes (the index of the unipotent level); by 8.20a
the depth error is at most `2(aE_j(ℓ) + 1)` at good primes `ℓ ≤ Y`, at most `−2F_j(𝔭)` above `Y`, `4T` at the type primes,
`2C·m(2 + vd)(wt_j + f(Sc + η_w)) + 2T + 2` at the small primes and `2(wt_j + f(Sc + η_w) + T + 1) + 4[ℓ = d]·f·k·b′` at `q`, `d`. For every
`j`, the *index term* `E1_j := Σ_{𝔭∈Tw} ϱ(𝔭)e_𝔭(err_j(𝔭) + 𝔧_j(𝔭))` satisfies `E1_j ≤ C·x^ε·(B₀ + N_c)` under the size conditions of ThetaChainsOnDefiniteUnitaryGroups §2.1,
the bound CongruenceModulesOfThetaLifts §7.16a (3) for the Weyl exponents, `SizeDep` (ThetaChainsOnDefiniteUnitaryGroups §2.1) and the size conditions `k·b′ ≤ b`, `g₀, g₁ ≤ b^{e_g}`, `T ≤ b`, `P³T² ≤ b`,
`(f·r·x^ε)^{e_P} ≤ b`, `1 < Y ≤ m·b`, `log Y ≤ 2x^ε`, `k·(Sc + η_w)·x^ε ≤ m·b`, `k ≤ X″` and `log k ≤ x^ε` (`e_g`, `e_P` fixed before `ε`); the good
primes then contribute at most `C·x^ε·B₀` and the bad primes at most `C·B₀` per step.

Consequently, for a good twisting datum and a host with wild-kernel budget `κ_W`, under the depth hypothesis of CongruenceModulesOfThetaLifts §7.10a, the length
bound of CongruenceModulesOfThetaLifts §7.10c, (T3), the hypotheses of RowTowerAndRallisIdentities §5.8 and the size
conditions of ThetaChainsOnDefiniteUnitaryGroups §2.1,
`SizeGen`, (N0), `SizePage` and those above, `LG + Σ_j(E1_j + E2_j) + E3 ≤ (C + κ_W)·m·(B₀ + N_c)·x^{e_D ε}` (`e_D = 1`).

*Traced short theta series, away from the own prime.* In the setting of 8.20 let `1 ≤ j ≤ m`, `𝔭 ∈ Tw` of residue
characteristic `ℓ`, `v ∈ {𝔭, c_𝕃(𝔭)}`, `δ_ℓ` the auxiliary character of `ℓ` and `p_o` the auxiliary prime of `ℓ`
(ThetaChainsOnDefiniteUnitaryGroups §2.5 (b); `p_o ≠ ℓ`), and take the run of step `j` whose own prime is `p_o`. Let
`U ⊂ G₀` be a subgroup all of whose elements have determinant `1` at every type place, and `ψ : U → 𝕃^×` a character.
- `Tr_j(U, ψ)` is the `𝒪_𝕃`-submodule of `𝒞(W_j)_𝕃` spanned by the sums `Σ_{u∈U} ψ(u)·ϑ_u`, where `(ϑ_u)_{u∈U}` runs over the
  families of short theta series of weight `λ^W_j` of the run
  (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a) formed with one positive definite unimodular
  Hermitian `𝒪_E`-lattice of rank `r + t` that is standard at a finite set of primes fixed with the run, one
  level of torsion points, and one harmonic polynomial of the weight with coefficients integral on the lattice, at the
  base points `x₀·u`, `u ∈ U`, the translates of one admissible base point by the action of `G₀` on the level structure.
- `Th_j(δ_ℓ; U, ψ)` is the `𝒪_𝕃`-submodule of `𝒞(W_j)_𝕃` spanned by the rational forms `y` for which there are a finite
  adelic point `h` of `U(V_j)` and a vector `w` of the dual Weyl lattice of the coefficient module at the class of `h`
  (the lattice of values at `h` of the `∇`-valued forms of CongruenceModulesOfThetaLifts §7.15) with
  `j_{σ₀}(y) = Σ_{u∈U} ψ(u)^{−1}·R(u)ϑ_{δ_ℓ}(h, w)`, where `R` is the action of `G₀` on the forms of principal level at the type
  primes and `ϑ_{δ_ℓ}(h, w)` is the theta series `g ↦ θ(h, g)` of the pair `(V_j, W_j)` for the tuple `δ_ℓ ∈ Ξ`, with the
  finite test vector of that tuple (the lattice vector away from the type places and from `A(ℓ)`, the level vector at
  the type places, the vector of the residue characters of `δ_ℓ` at `A(ℓ)`) and the archimedean vector attached to `w`
  and to the lowest `K`-type by the intertwiner of RowTowerAndRallisIdentities §5.7.
Assume the hypotheses of RowTowerAndRallisIdentities §5.8 on `𝕃` ((L1) for `μ_j`, `η̃`, `δ`, `δ′`), the rank condition (R5)
of ThetaChainsOnDefiniteUnitaryGroups §2.1, and clause (o) of 8.20 for `p_o`. Then for every finite place `λ` of `𝕃` whose
residue characteristic is not `p_o`, `Tr_j(U, ψ) ⊗ 𝒪_{𝕃,(λ)} ⊂ Th_j(δ_ℓ; U, ψ) ⊗ 𝒪_{𝕃,(λ)}`; in particular at `λ = v`. At the
places above `p_o` nothing is claimed here: there the other run is used (8.20, "The theta data of a step").
*Route.* By the rational lift (RowTowerAndRallisIdentities §5.11, Lemma, with the realisations of
RowTowerAndRallisIdentities §5.10a and the extremal vector of RowTowerAndRallisIdentities §5.7; the spanning by class sums,
ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.17a, is where (R5) enters) a short theta series of a
lattice `Λ` at a base point is the adelic theta series at the class `h` of `Λ` for the test vector of the base point.
Up to an integer prime to `λ` the family may be taken with `Λ` the lattice of an adelic point supported off the
primes at which the lattices of `Tr_j(U, ψ)` are standard, and its harmonic polynomial then lies in the dual Weyl
lattice of that class. Summing over `U` against `ψ`
turns the base points into the `(U, ψ)`-trace; the elements of `U` have determinant `1` at the type places, so no
type character appears, and the nebentype of the level `g₀g₁p_o` is `δ_ℓ` composed with the determinant. The scalar
relating the two sides is integral at `λ`; and at the places of `A(ℓ)` the vector of the short theta series is a
translate of the vector of the residue characters of `δ_ℓ` up to a power of `p_o`, a unit at `λ`. [FormalProof] states
this clause as `Development/AbelianVarietyTheory/Proofs/DivisorProofs/TraceLatticeLeSpanThetaSeriesAwayFromOwnPrimeStatement.lean`
(`GlobalTheory.T.traceLattice_le_span_thetaSeries_awayFromOwnPrime`) and
`Development/AbelianVarietyTheory/Proofs/FoundationProofs/TraceLatticeLeThetaLatticeAtPlace.lean`
(`GlobalTheory.TraceClassRank.CompareOffOwn`), with the objects of
`Development/AbelianVarietyTheory/Definitions/Foundations/ThetaSeriesTies.lean` (`GlobalTheory.OnTies.IsOrbitFamily`,
`GlobalTheory.OnTies.thetaBase`), and applies it at the base level in
`Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/CompareOffOwnAtRuns.lean`
(`GlobalTheory.BigOn.compareOffOwn_atRuns_alt`).
*Needs:* 8.20; RowTowerAndRallisIdentities §§5.7, 5.8, 5.10a, 5.11;
ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §§8.17a, 8.19a;
ThetaChainsOnDefiniteUnitaryGroups §§2.1, 2.4 (b), 2.5, 2.6 (a) (ii), 2.9a; CongruenceModulesOfThetaLifts §7.15.

*Route.* At each `v ∈ {𝔭, c_𝕃(𝔭)}` the lifted lattice is compared with the integral forms through four inclusions (the lift
commutes with the good projector and factors through the projection; the adelic theta series of the tuple are lifts of
integral forms; the twisted lattice against the untwisted one by 8.19e (b), whose hypotheses for these lattices are 8.19e (c), and
the twist selection CongruenceModulesOfThetaLifts §7.8 (2) with `ε′ = 1/ℓ²` for the product of the `2m` conditions of 8.19e (b) (the steps and the two places;
levels and exponent bounds add) for the good twisting datum, the signed indices growing by `e_𝔭·ig_j(v)` with
`Σ_j(ig_j(𝔭) + ig_j(c_𝕃𝔭)) ≤ 2/ℓ²` (or CongruenceModulesOfThetaLifts §7.8 (2) for the `2m` conditions each with `ε′/(2m)`); the traced short theta series are adelic theta series of the
tuple `δ_ℓ`, by the clause above at `λ = v`, `(U, ψ) = (P_0, χ_{P_0}^{−1})`); the last index is bounded by ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18b with the uniform bound ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a (with `E = E_j(v)` and `σ = 𝔰_j`: `Θ_{λ^W_j} ⊂ 𝔰_j·Th^{short}(λ^W_j)` by
ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a″ (c), `𝔰_j` dividing the three products of scalars, which are `𝔰_j` times `z(w_F)·(g₀g₁)^{f·r·(n_P − n_P⁰)}`,
`z(w_F + n·w_L)·(g₀g₁)^{f·r·(n_P + n·n_W − n_P⁰)}` and `z(λ^W_j)·(g₀g₁)^{f·r·(r + t − n_P⁰)}`, with `N(λ^W_j) = N(w_L)^T·N(w_F)`), whose
hypotheses (N3)–(N5), (I1)–(I8) hold at these parameters ((N0) being assumed). (N3): by 8.20 (vii) (a), ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a″ (a) and the bounds for the scalars (with
`G = P_Λ + 3x^ε + 2·max(log[𝕂:ℚ] + log rd(𝕂), log[E:ℚ] + log rd_E) + 2·f·r·(λ^* + 2·log p_o) + 31·f·r·x^ε`, `P_Λ ≤ 1009·f·r·x^ε`,
`λ^* = log(g₀g₁) + log(f²·q·d)`, as in ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a (N3); a finite spanning subset with
these bounds is extracted from the spanning set of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a″ (a)). (N4): the depth sum by ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a′ (a); integrality by 8.20 (vii) (b):
`s_W·Th^{all}(w) ⊂ M_w` because `v_𝔩(s_W) = v_𝔩(N(w)) + Σ_ℓ e_𝔩·c_ℓ(w)` covers the loss of 8.20 (vii) (b) (`c_ℓ(w) = v_ℓ(Q)·DF(w) ≥ vd(ℓ)·DF(w)` at the
small primes, `⌈DF(w)/2⌉ ≥ vd·DF(w)/2` at `q`, `d`, every prime of `f_E` lying in `S_small ∪ {q, d}`, ThetaChainsOnDefiniteUnitaryGroups §2.1), and the short theta series
likewise with the factors `(g₀g₁)^{f·r·n(w)}` and `z(w)` (the own prime). (N5): for each of its two weights, 8.20 (vii) (c) gives on each
of the `N_c` components a rule nonzero at a point; for an `N_c × N_c` matrix with nonzero diagonal there are integers
`0 ≤ n_i ≤ N_c` with `Σ_i n_i·v_{i,c} ≠ 0` for every column `c` (each column excludes at most `(N_c + 1)^{N_c−1}` of the `(N_c + 1)^{N_c}`
vectors), so a combination of the rules with such coefficients is nonzero at a point of every component; multiplied by the
scalar `s_W` formed for the weight it is integral by 8.20 (vii) (b), of logarithmic sup norm at most
`2·log N_c + 400·f·r·L·|w| + (log(g₀g₁) + log(f²qd))·|w|` by 8.20 (vii) (a); a form nonzero at a point of each connected component is not a
zero divisor (the components are irreducible). (I1): by ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a from (N3), (N4) and (I3) of 8.20 (vii) (d). (I2)–(I4) by 8.20 (vii) (d). (I5) by
ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a‴ with 8.20 (vii) (e). (I6) by ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a″ (b), ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18a (e) and 8.20 (vii) (f). (I7): by ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a from (I1) and (I6). (I8) by ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a′ (b), (c) with 8.20 (vii) (g),
8.20 (vii) (h); its depth is at most the bulk `F_j(𝔭)` plus the errors of 8.20a; summing over `j` and both
places gives the first claim with `err_j` collecting the depth errors and the remainders `r(𝔩)/(e_𝔩·[P : U]·D_0)` (lengths at `𝔭 | 𝔩` are `e(𝔭/𝔩)` times lengths at `𝔩`, and
`Σ_{𝔭|𝔩}ϱ(𝔭)e_𝔭 = e_𝔩·ϱ(𝔩)`; each run of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a
used at the places whose residue characteristic is not its own prime), and `𝔧_j(𝔭) ≤ 𝔧_j(ℓ)` with `Σ_ℓ 𝔧_j(ℓ)·log ℓ ≤ 30·|Φ_th|·m·b·x^{2ε} + 2m·b ≤ 16·x^ε·B₀` per step (CongruenceModulesOfThetaLifts §7.16a (3) (a), (b); CongruenceModulesOfThetaLifts §7.15). The sizes
at the parameters: `log D_V^{all}` at most the logarithm of the Minkowski number for `GL_{2f(r+t)}(ℚ)` (CongruenceModulesOfThetaLifts §7.15 (c)),
`log n ≤ log|G₀|` and `s₀ = 1` for the three parts of the integer of 8.20 (iv), CongruenceModulesOfThetaLifts §7.16a (3),
`log|G₀| ≤ C·f·r²·log g₁ ≤ b`, the remainder of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a at most `3·f·m·b·δ₂` per
step with `δ₂ ≥ x^{−ε}`, and `log log x ≤ x^ε` for large `x`. The total: (iii), (v), (vi) of 8.20 and the bound for `E1_j`.

*Check.* (`Y`, `aE_j` and `C` are those of 8.20a.) The twist term `2e_𝔭/ℓ(𝔭)²` is paid once for the sum over the steps and the two places of the pair, with the
rational prime `ℓ(𝔭)`, because 8.19e (b) is applied to the product of the `2m` conditions; per step, or with `N𝔭` in place of
`ℓ(𝔭)`, it would add `m·E3` to 8.21 (a), or be unsupported when the residue degree exceeds `1`. The factor `D_0` on it is not
needed by the argument. `e_g = 9`, `e_P = 12`, and `(4C² + 25C + 12)` for the constant of the good primes, are the values of one
construction.

*NEW* (this form), elementary given its inputs. The index statement, with the depth errors and the size conditions:
[FormalProof], `Formalism/LocalToGlobal/IndefiniteForms/IndefiniteTree/ExampleSatisfiesConditionsAtFive.lean`
(`Formalism.L2.Indef.Tree.ONwith`),
`Formalism/LocalToGlobal/IndefiniteForms/IndefiniteTree/ExampleSatisfiesConditionsAtFive.lean`
(`Formalism.L2.Indef.Tree.OnObj.EJ`), `Formalism/LocalToGlobal/IndefiniteForms/IndefSide.lean` (`Formalism.L2.Indef.IndefData.ON`);
the twist term `2e_𝔭/ℓ(𝔭)²`: [FormalProof], `Formalism/LocalToGlobal/IndefiniteForms/IndefiniteTree/ExampleSatisfiesConditionsAtFive.lean`
(`Formalism.L2.Indef.Tree.LeafTW1`).
*Needs:* ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18b, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a′, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a″, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a‴, 8.19e, 8.20, 8.20a, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18a, CongruenceModulesOfThetaLifts §7.8,
CongruenceModulesOfThetaLifts §7.5a, CongruenceModulesOfThetaLifts §7.10c, CongruenceModulesOfThetaLifts §7.11, CongruenceModulesOfThetaLifts §7.15, CongruenceModulesOfThetaLifts §7.16a, FrobeniusRestrictedRieszSums §0.1, FrobeniusRestrictedRieszSums §0.3, ThetaChainsOnDefiniteUnitaryGroups §2.1, ThetaChainsOnDefiniteUnitaryGroups §2.3b.

### 8.21 The slope of the target

Under the hypotheses of RowTowerAndRallisIdentities §5.8b for the grid of the chain and a scale `x ≥ x_F` with the size predicate
`Size_□` of RowTowerAndRallisIdentities §5.8e, the depth constant `C_F ≥ C_F⁰` and the gap hypotheses of
RowTowerAndRallisIdentities §5.8 (as in 8.20). (a) *Base level.* With the
notation of 8.20, let `𝔫 > 0` be the descent
constant of RowTowerAndRallisIdentities §5.10 (one number for every embedding; RowTowerAndRallisIdentities §5.11 makes it positive). Let `𝔼_0` carry at EVERY embedding the metric of
8.9: the metric of RowTowerAndRallisIdentities §5.12 divided by its factor `n := |P_0|` (at `σ₀` the Petersson form divided by `n`; at `σ ≠ σ₀` the form
transported by `ι_1` from `𝔫·∏_jλ_j(1, 𝔥, σ)·X_1^σ`), and let each `M^W_j ⊗ 𝕃` carry the Petersson form divided by the same `n`,
`λ_j` being the scalar of `θ_j` for these forms (the same as for the undivided forms, both sides being divided by `n`); then
`ι_1^*ι_1 = 𝔫·∏_jλ_j(1, 𝔥, σ)` on the `𝔥`-part at every embedding and no further constant occurs. Let `R_0^∨` carry the dual
metric, and let `s^{st}_j` be any number with `s^{st}_j ≥ −μ(M^W_j)` for the metric of the rational model lifts of RowTowerAndRallisIdentities §5.11 divided by
`n` (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19 (b), (c) supply `s^{st}_j = (p_j − q_j)Σ_τ w_j(τ)·log Ω + C·B₀·log log x`, under their hypotheses: dividing a metric by `n`
lowers `−μ` by `log n`). In [FormalProof] the norm of the datum on the coordinates of `M^W_j` is `|P_0|^{−1/2}` times the
model norm, and the bound is transferred by the inequality for a norm scaled by a factor `≤ 1`:
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/LiftFormsFramesMajorantNormEqPeterssonStatement.lean`
(`GlobalTheory.T.liftForms_frames_majorantNorm_eq_petersson`),
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/CovolumePerRankLeNegSlopeScaledStatement.lean`
(`GlobalTheory.T.covolumePerRank_le_neg_slope_scaled`),
`Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/RecAtOfGramAtStatement.lean`
(`GlobalTheory.T.lift_recursion_of_gram_bound`).
The dual indices `ℐ_j(𝔭)` of 8.20 (iv) are those of the class-set product divided by `n`, the form that the identity of
the route charges; the factor `n` is in the integer of 8.20 (iv), so the difference `D_0·v_𝔭(n)` from the index for the
class-set product itself is counted in `E2_j` (at most `log n ≤ log|G₀|` per step) and nowhere else. Put `F_tot := Σ_j Σ_{𝔭∈Tw} sz_𝔭(F_j(𝔭))`, the *bulk divisibility*, with the bulk `F_j`
of LocalGainOfThetaChains §4.9f (d). Then, for a good twisting datum (CongruenceModulesOfThetaLifts §7.10a) and under the condition (T3) of 8.20 (through 8.20 (i) and 8.20b),

`μ(R_0^∨) ≤ log 𝔫 + Σ_{j=1}^m s^{st}_j + F_tot + LG + Σ_j(E1_j + E2_j) + E3`.

(With the Petersson forms themselves on `𝔼_0` and on the `M^W_j` each `−μ(M^W_j)` is larger by `log n`; the inequality survives,
the right side having `m ≥ 1` such terms, but the identity behind it does not.)

(b) *Passage to the level of the rows.* Let `R ⊂ 𝔼 = 𝔼_1` be the glued lattice of 7.13 (formed in the part of level
`(P_1, χ_{P_1})`, the level of the rows of RowTowerAndRallisIdentities §5.3), and `δ_G ≤ 1/3` a number with `(1 − δ_G)n̄ ≤ n_s ≤ (1 + δ_G)n̄` for some `n̄ > 0` and
the multiplicities `n_s` of the level `(P_1, χ_{P_1})` in the representations of `G₀` occurring in `𝔼^♮` (RowTowerAndRallisIdentities §5.4), each of which
contains the level `(P_0, χ_{P_0})` with multiplicity one. If `H₀ ≥ μ_max(R_0)`, then `μ_max(R) ≤ H₀ + C·log|G₀|` and
`μ(R^∨) ≤ μ(R_0^∨) + 3δ_G·(μ(R_0^∨) + H₀ + C·log|G₀|) + C·log|G₀|`, `C` absolute.

(c) *The multiplicities.* Suppose `24f·r ≤ min(g₀, g₁)` (`r` the rank of the general linear groups of `G₀` at the type places;
this gives `δ_G ≤ 1/3` below, and `4fr ≤ min(g₀, g₁)` is the hypothesis `2sn ≤ g` of the form of the formal proof in
FiniteReductiveGroups §2.8 (c)); the size
conditions of ThetaChainsOnDefiniteUnitaryGroups §2.1 give it (`g_i ≥ (kb)^{A_g}` while `f·r ≤ x^C`). By RowTowerAndRallisIdentities §5.3 (v), every representation of `G₀`
occurring in `𝔼^♮` is, at each of the `2f` type places, the whole Harish-Chandra induced representation `R_L^G σ` of a cuspidal
pair (not a constituent of it) and contains `(P_0, χ_{P_0})` exactly once, and at each type place the level `(P_1, χ_{P_1})` is the
pair `(H_{r_S}, ϕ_{r_S})` of FiniteReductiveGroups §2.7 (b) with the same `k`. Then (b) holds with `n̄ = ∏_v N(v)^k`
over the `2f` type places and `δ_G = 8f·r/min(g₀, g₁)` (FiniteReductiveGroups §2.8 (c) with `s = 2f` fields `𝔽_{N(v)}` of
cardinality `q_v = N(v) ≥ g := min(g₀, g₁)`, `n = r`, at each place the pair `(H_{i_v}, ϕ_{i_v})` of FiniteReductiveGroups §2.7 (b) given by the level with
one `k`, and the cuspidal pair of the induced representation; `δ = 4sn/g = δ_G`). Under the size conditions, `log|G₀| ≤ C·f·r²·log g₁`.

*Route.* (a) For a lattice `L` with metric `X` and any basis `e` of `L ⊗ 𝕃`,
`−rk L·μ(L) = mean_σ log det Gram_σ(e) − 2Σ_𝔭 ϱ(𝔭)·idx_𝔭(L : ⟨e⟩)`, the mean over the embeddings `σ : 𝕃 → ℂ` of the Gram
determinants of squared norms (SlopesOfHermitianVectorBundles §1.2 with `μ = 2μ̂`). Take `e = ι_1(f)`, `f` a basis of the
rational coordinates of the base tuple at the base level (RowTowerAndRallisIdentities §5.12): at every embedding the Gram determinant of `ι_1(f)` is
`𝔫^{D_0}` times the product over `j` of the Gram determinants of the rational model lifts (RowTowerAndRallisIdentities §5.7, RowTowerAndRallisIdentities §§5.10–5.12); for each `j` the
same formula applied to the `𝕃`-rational Hermitian forms of the coordinates turns the mean of `log det` of the model lift
into `−D_0·μ(M^W_j)` plus local indices. At a twisted place `𝔭` divide the identity for the tuple `ξ_𝔭` by the one for the
base tuple at the base embedding: the metrics cancel, and what remains is an identity in `𝕃` whose valuations at the pair
`{𝔭, c_𝕃(𝔭)}`, with local bases taken at the pair, express the change of lattice through the local terms of the tuple
`ξ_𝔭`. This is the gluing identity SlopesOfHermitianVectorBundles §1.2a (iii) with `ρ_t = 1`, divided by `−[𝕃:ℚ]·D_0/2`, used as the lower
bound for `deĝ(R̄_0)` of its last sentence; its hypotheses hold here: the determinant identity
`det(ι_1^*ι_1) = 𝔫^{D_0}∏_j det(θ_j^*θ_j)` at every embedding for the base tuple (RowTowerAndRallisIdentities §5.10 at `σ₀`, RowTowerAndRallisIdentities §5.12 at the others), the same at
the base embedding for every tuple (RowTowerAndRallisIdentities §5.10), and the forms on the coordinates Hermitian at the base embedding and, for the
base tuple, rational over a subfield on which every embedding commutes with `c_𝕃` (RowTowerAndRallisIdentities §5.11, RowTowerAndRallisIdentities §5.12). Summing, with
`μ(R_0^∨) = −μ(R_0)` (SlopesOfHermitianVectorBundles §1.7), gives the bound with the local terms of 8.20 (the indices at the
twisted places by 8.20 (iv) and 8.20b, the Gram term by (ii); off `Tw` nothing by 8.20 (i) under (T3)), and `2Σ_𝔭 ϱ(𝔭)e_𝔭F_j(𝔭) = Σ_𝔭 sz_𝔭(F_j(𝔭))`; each pair
`{𝔭, c_𝕃(𝔭)}` is counted at both places. (b) Up to an index `|G₀|^{O(rk)}`, `R_0 = ⊕_sR_s` (orthogonal isotypic parts; a
lattice between `⊕R_s` and `|G₀|^{−1}⊕R_s` has degree within `2·log|G₀|·rk` of the sum), and `R` is, up to maps of norm `≤ 1` with
denominators dividing `|G₀|³`, the sum of `n_s` copies of `R_s`, `n_s ∈ [(1 − δ_G)n̄, (1 + δ_G)n̄]`; so `−μ(R)` and `−μ(R_0)` are
the means of the slopes `−μ(R_s)` with the weights `n_s·rk R_s` and `rk R_s`; since every `μ(R_s) ≤ μ_max(R_0) + C·log|G₀| ≤ H₀ + C·log|G₀|`,
the two means differ by at most `3δ_G(H₀ − μ(R_0) + C·log|G₀|)` (only the bounds `(1 ± δ_G)n̄` are used, not that `n̄` is the
mean); the maximal slope moves by at most `C·log|G₀|` (SlopesOfHermitianVectorBundles §§2.2, 2.4 (b)). (c) The multiplicity of a
product over the places is the product of the multiplicities; at the place `v`, with `q_v = N(v) ≥ g`, FiniteReductiveGroups §2.8 (a)–(b) give
`q_v^k(1 − q_v^{−1}) ≤ m(σ_v) ≤ q_v^k(1 + q_v^{−1})^r` for the multiplicity `m(σ_v)` of the level in the induced representation `R_{L_v}^G σ_v` (from the exact multiplicity through FiniteReductiveGroups §2.7 (b) and the Mackey formula), and over `2f` places
`∏_v(1 − q_v^{−1}) ≥ 1 − 2f/g`, `∏_v(1 + q_v^{−1})^r ≤ e^{2fr/g} ≤ 1 + 4fr/g`. The bound concerns the whole induced representation:
for a constituent it fails when `r ≥ 3` (`α∘det ⊂ R_T^G(α ⊠ ⋯ ⊠ α)` has multiplicity `0`). [FormalProof] states the
multiplicities with this `δ_G`, under `4f·r ≤ min(g₀, g₁)`, as `|n_s − n̄| ≤ δ_G·n̄`:
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/ReordEqConj.lean` (`GlobalTheory.ColumnMultSum.columnMult`), the
representations occurring being whole induced representations of cuspidal pairs by
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/GoodCharacterPlacewiseCuspidalParabolicProductStatement.lean`
(`GlobalTheory.T.goodCharacter_placewise_cuspidal_parabolic_product`); the latter is
RowTowerAndRallisIdentities §5.3 (v) (a) in the form: an irreducible character of `G₀` on which the good idempotent acts
as the identity is, at each type place, the character of a whole induced representation of a cuspidal pair. From it
[FormalProof] derives that the base level occurs exactly once, realises the characters by representations over `𝕃`, and
obtains the multiplicities of the row level from the bound of FiniteReductiveGroups §2.8 (c) in its first form
(`s = 2f`, `n = r`) at the `2f` type places, at each of which the level is conjugate to the pair `(H_{r_S}, ϕ_{r_S})`
(RowTowerAndRallisIdentities §5.3 (v) (b)); these are the data of (b), collected in
`Formalism/LocalToGlobal/IndefiniteReal/PrimitivePackageFullHecke.lean` (`Formalism.IndefR.Links.PassIn3`) and
`Formalism/LocalToGlobal/IndefiniteReal/NearConstantMultiplicities.lean` (`Formalism.IndefR.Cx.CxPassIn3`), and proved in
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/PassIn3OfRows.lean` (`GlobalTheory.passIn3_of_rows`). The
deviation `4fr/g ≤ δ_G` above is this roadmap's own.

*Check.* With all tuples equal to the base tuple, no step (`m = 0`) and `𝔫 = 1`, (a) is the product formula for the
Gram determinant of a local basis of `R_0`. For `(𝒪_𝕃, c·|·|)` and `e = 1` the Gram determinant is `c²` at every embedding
and `−μ = 2 log c`; with `(2/[𝕃:ℚ])Σ_σ` in place of the mean the first formula would give `4 log c`. A local basis at `𝔭`
alone instead of at the pair `{𝔭, c_𝕃(𝔭)}` would make the Gram hypothesis false: for `𝕃 = ℚ(i)`, `L = 𝒪` and `𝔭 = (2 + i)`,
`e = (2 − i)^{−1}` is a local basis at `𝔭` (index `0` there) but not at `c_𝕃(𝔭)`, and its Gram determinant `e·c_𝕃(e) = 1/5` has
valuation `−1` at `𝔭`; only over the pair does the sum of the Gram valuations (`−1` at each place) equal twice the sum of the
indices (`0` at `𝔭`, `−1` at `c_𝕃(𝔭)`). In one construction the passage constants are
`14` and `28`.

*NEW* (instance). (a), the inequality, follows from [FormalProof], `Formalism/DivisorInequality/StatementObj.lean`
(`Formalism.DivisorInequality.BoundsMu`), `Formalism/LocalToGlobal/IndefiniteForms/IndefUse.lean`
(`Formalism.L2.Indef.IndefSide.boundsMu`), `Formalism/LocalToGlobal/Divisibility/TwistedPlaceEtaSumLeExtended.lean`
(`Formalism.L2.DIV.DivInputsDef3.toDivInputs0R`); (b): [FormalProof], `Formalism/LocalToGlobal/IndefiniteForms/IndefSide.lean`
(`Formalism.L2.Indef.Passage`).
*Needs:* ThetaChainsOnDefiniteUnitaryGroups §2.1, RowTowerAndRallisIdentities §5.3, RowTowerAndRallisIdentities §5.4, RowTowerAndRallisIdentities §5.8, RowTowerAndRallisIdentities §5.8b, RowTowerAndRallisIdentities §5.8e, RowTowerAndRallisIdentities §5.10, RowTowerAndRallisIdentities §5.11, RowTowerAndRallisIdentities §5.12, 7.13, 8.9, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19, 8.20; SlopesOfHermitianVectorBundles §§1.2, 1.2a (iii), 1.7,
2.2, 2.4; FiniteReductiveGroups §§2.7 (b), 2.8.

### 8.22 The division inequality

*Statement.* Assume that the twisting datum is good (CongruenceModulesOfThetaLifts §7.10a) and that the host has wild-kernel
budget `κ_W = 1` (CongruenceModulesOfThetaLifts §7.11; for instance `V(E, t) ≤ b`), the depth hypothesis of CongruenceModulesOfThetaLifts §7.10a, the length bound of
CongruenceModulesOfThetaLifts §7.10c, the condition (T3) of 8.20, the hypotheses of RowTowerAndRallisIdentities §5.8b
for the grid of the chain and a scale `x ≥ x_F` with the size predicate `Size_□` of RowTowerAndRallisIdentities §5.8e, the depth
constant `C_F ≥ C_F⁰` and the gap hypotheses of RowTowerAndRallisIdentities §5.8 (through 7.13),
`[F:ℚ] ≥ 3`, `r + 1 < g₀, g₁`, `q_z ≤ ¼` (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18c (e)), the hypotheses (H1)–(H3) of
ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18f (c), the size conditions of ThetaChainsOnDefiniteUnitaryGroups §2.1 (with `SizeT_u` of ThetaChainsOnDefiniteUnitaryGroups §2.8 and `SizeDep`), `SizeGen`, `SizePage` and
those of 8.20b and those of 8.21, the hypotheses of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19 (b), (c), which supply the numbers
`s^{st}_j` of 8.21 (a), the gap conditions of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18c (f) for every step `j < m` (with their
witnesses `h₀`, `S_u`, `η_u`), and

`N_m²·m³·x + (mϑ + Sc + k)·N_m ≤ b`, `k·Sc + m(t + 1)ϑ ≤ w″`, `N_m²·w″ ≤ b`, `(N_m² + m·k)·b′ ≤ a`,
`a⁻_τ ≤ 2b′` for `τ ∈ Φ_top`, `|log Ω| ≤ La ≤ 2x^ε`, `log(g₀g₁) ≤ C·La`, `log T(u) ≤ x`,

and suppose `H₀ ≥ μ_max(R_0)` with `3δ_G·(μ(R_0^∨) + H₀ + C·log|G₀|) ≤ 1` for the passage of 8.21 (b), `δ_G` of 8.21 (c) (under its hypotheses). Then for
every word `u`, with `F_tot` of 8.21 (a) and `h_u` of 8.9,

`μ(R^∨) + h_u − F_tot ≤ Σ_{τ∈Φ_top} ( m·(ph(a_τ) − a_τ·log Ω) − a_τ·log T(u) ) + C·|Φ_top|·a·La + C·m·(B₀ + N_c)·x^{e_D ε}`,

`e_D = 1`.

*Route.* Add the target bound and the explicit height, in five named cancellations.
(T) By 8.21 (a) with `s^{st}_j` from ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19 (b), (c) (for the norms of RowTowerAndRallisIdentities §5.11, the metric of the model lifts) and the local terms of
8.20, 8.20b, and
the passage 8.21 (b), (c) from `R_0` to `R` (whose passage term is then at most `1 + C·log|G₀| ≤ C·B₀`):
`μ(R^∨) ≤ log 𝔫 + Σ_jΣ_{τ∈Φ}(p_j − q_j)·w_j(τ)·log Ω + F_tot + E_T`, `E_T ≤ C m(B₀ + N_c)x^{e_D ε}` (8.20b, last clause). `F_j`
vanishes at the untwisted places by (T3), so the twisted-place sum is `F_tot`.
(D1) *Descent constant.* `+log 𝔫` of (T) cancels `−log 𝔫` of `h_u` (one metric on the rows, that of 8.9, on both sides);
the term `log|P_1| ≤ log|G₀| ≤ C·B₀` of `h_u` goes into the error.
(D2) *Bulk divisibility.* `+F_tot` of (T) cancels `−F_tot`: both are the sums of `sz_𝔭` of the one bulk `F_j` of LocalGainOfThetaChains §4.9f (d)
(the part `𝔉^A_j` that the column side does not claim is in its cost, LocalGainOfThetaChains §4.9f (e), 8.20); the one bulk vanishes off `Tw` by (T3).
(D3) *Stirling against hooks.* By 8.10 (c), `Σ_jΣ_τ(Σ_i ph(ν_{j,τ,i}) − log H^+_{j,τ}) ≤ m·Σ_{τ∈Φ_top} ph(a_τ) + Σ_{j,τ} eE_{j,τ}`.
(D4) *The period.* By 8.10 (d), `−Σ_{j,τ}(Σ_iν_{j,τ,i})·log Ω = −m·(Σ_{τ∈Φ_top}a_τ)·log Ω − Σ_{j,τ}k·w_j(τ)·log Ω − Σ_{j,τ}δ_{j,τ}·log Ω`;
the middle term against (T) leaves `Σ_{j,τ}(p_j − q_j − k)·w_j(τ)·log Ω`, and `p_j − q_j − k = 2j − 1 − m` with
`Σ_{j=1}^m(2j − 1 − m) = 0`, so it equals `Σ_{j,τ}(2j − 1 − m)(w_j(τ) − w_1(τ))·log Ω`; the kind of a place (thick, top,
thin) does not depend on `j`, so `|w_j(τ) − w_1(τ)| ≤ ϑ + 1` and the term is at most `f·m²·(ϑ + 1)·La`.
(D5) *The top period.* The top term `t_u` of 8.7 (b) in `h_u` contributes `−(Σ_{τ∈Φ_top}a_τ)·log T(u)`.
The remaining errors: `Σ eE_{j,τ} ≤ C(f m b La + m|Φ_top|b′La)`, `Σ|δ_{j,τ}|·La ≤ C(f m b La + |Φ_top|m k b′La)`,
`m·C₁f m³N_m²·La`, `m·A_R f(r+t)²log(b·rd_E·g₀g₁(r+t))`, the `La`-term of `t_u` (its part `C₂·|Φ_top|·b′·N_m·La` is at
most `C·|Φ_top|·a·La` by `N_m·b′ ≤ a`, its part `C₂·f·((mϑ + Sc)·N_m + N_m²)·La` at most `C·f·b·La` by `(mϑ + Sc + k)·N_m ≤ b`
and `N_m² ≤ b`), and
`E_T`; by the size conditions each is at most `C|Φ_top|aLa` or `C m(B₀ + N_c)x^{e_D ε}` (note `f·m·b·La ≤ 2B₀`). Any fixed `e_D ≥ 1` would do;
`e_D = 1` is what these bounds give.

*Check.* The large powers `Ω^{k·w_j(τ)}`, with `k·w_j(τ) ≫ a_τ`, cancel only because the kernel's exponent `k·w_j(τ)`
(8.10 (d)) and the step lattice's exponent `(p_j − q_j)·w_j(τ)` (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19) differ by `(2j − 1 − m)·w_j(τ)`, which sums to
almost nothing over the chain; a discrepancy `c·w_j(τ)·log Ω` per place and lift with `c` of size `1` would add
`f·m·b·La`, and one of size `k` would make the inequality trivial. A mismatch between the bulk of the rows and that of
the columns at the places of the inert class would be of size `f·m·k·b`, above the whole budget: (D2) needs one number.

*NEW*. The inequality is the seventh clause of [FormalProof], `Formalism/SharpRestriction/GlobalTheoremInputs.lean`
(`Formalism.MainNotions.LinkDIV_at`), whose main term is `Formalism/LocalRingCardinality/DataParams₂.lean`
(`Formalism.BasicNotions.SizeData₂.MAIN`).
*Needs:* 8.9, 8.10, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18c, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18f, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19, 8.20, 8.20b, 8.21; ThetaChainsOnDefiniteUnitaryGroups §2.1, ThetaChainsOnDefiniteUnitaryGroups §2.2, ThetaChainsOnDefiniteUnitaryGroups §2.3, ThetaChainsOnDefiniteUnitaryGroups §2.3b, ThetaChainsOnDefiniteUnitaryGroups §2.5, ThetaChainsOnDefiniteUnitaryGroups §2.8, LocalGainOfThetaChains §4.9f.

### 8.23 The cost of the type primes

*Statement.* For every word `u` and step `j`, with `E_{u,j}` of LocalGainOfThetaChains §4.9f (e) and `A_top` of 8.7 (b), under
the size conditions of ThetaChainsOnDefiniteUnitaryGroups §2.1 (with `SizeT_u` of ThetaChainsOnDefiniteUnitaryGroups §2.8 and the cost condition `𝔢_u·log T(u) ≤ C·B₀` at the level prime):
(a) `|Σ_𝔭 sz_𝔭(E_{u,j}(𝔭)) − A_top·log(g₀g₁)| ≤ C·B₀` and `Σ_{𝔭 ∤ g₀g₁}|sz_𝔭(E_{u,j}(𝔭))| ≤ C·B₀`; hence
`E_tot(u) := Σ_jΣ_𝔭 sz_𝔭(E_{u,j}(𝔭)) ≤ m·A_top·log(g₀g₁) + C·m·B₀`;
(b) for all words `u, u′`, `|(h_u + A_top·log T(u)) − (h_{u′} + A_top·log T(u′))| ≤ C·(|Φ_top|·a·La + m·B₀)`, with `C`
depending on `ε`.

*Route.* (a) `E_{u,j}` is defined by cases (LocalGainOfThetaChains §4.9f (e)); by the product formula `Σ_{𝔭|p} sz_𝔭(·)` of an entry that depends on `𝔭`
only through `p` is `2 log p` times it. (i) Stabilisers: `Σ_𝔭 sz_𝔭(v_p(D_Γ)) = 2 log D_Γ ≤ C·f·N_m·log(f·N_m)` (ThetaChainsOnDefiniteUnitaryGroups §3.6). (ii) Primes
`≤ X″` inert in `K`: at most `C·B₀` per step. At split type the cost terms `𝔯_j` of LocalGainOfThetaChains §4.9f (e), with the loss
`dl_v` of LocalGainOfThetaChains §4.9e (b), sum to this by Mertens (weighted by `log p`, each is `≤ C·f·m·b·log p/p + C·f·ϑ·x^ε`,
and there are at most `X″` primes, with `X″·ϑ ≤ b`), and the returned bulk `𝔉^A_j(p) ≤ 2fmb/p` sums to `o(B₀)`; at the primes of
conjugate type the entry of LocalGainOfThetaChains §4.9f (e) likewise. At odd conjugate type the cost has the further term
`(k − 1)·Σ_{τ∈Φ∖A}w_j(τ)/p³ + 12·f·N_m²·log_p a` (LocalGainOfThetaChains §4.9f (e)); Mertens does not bound its first part, which
with the weights `2 log p` is `≤ 10·k·f·b·Σ_p log p/p³` (`w_j ≤ 5b`). Here a prime `p` inert in `K` and in `ℚ(√−q)` at which
`c·Frob_p` has odd order (in particular every prime of odd conjugate type) satisfies `p ≡ ±1 (mod 2^{n+2})`, `n` the layer of
the host (FrobeniusRestrictedRieszSums §0.4 (g); its hypothesis, `p` unramified in `E`, holds for every prime inert in `K`,
FrobeniusRestrictedRieszSums §0.4 (v), `d` being ramified in `K`). Then the sum of
`log p/p³` over these primes is `≤ log(2^n)/2^{3n}`, and `k·log(2^n)/2^{3n} ≤ 2` since `k ≤ x⁵` (`SizeK`, for `ε ≤ 1/21`) and
`2^n ≥ x²` (`SizeK` gives `|A| ≥ x^{2+5ε}`, and `2^n ≥ |A|/o ≥ |A|·x^{−ε/100}` for `x ≥ x₀`,
ThetaChainsOnDefiniteUnitaryGroups §2.1). So this part contributes `≤ 20·f·b`, and the second part `≤ 24·f·X″·N_m²·log a ≤ 24·f·b`
(`X″·N_m²·log a ≤ b` for `x ≥ x₀`). (iii) `d`:
`|Ẽ_{u,j}(𝔭)| ≤ |Φ_top|·b + 2f·k·b′` at `𝔭 | d` (the weights on the side `A` are `≤ 2b′`, the first rows on the other side `≤ 2b`), so
`Σ_{𝔭|d} sz_𝔭 ≤ 2 log d·(|Φ_top|·b + 2f·k·b′) ≤ C·B₀`. (iv) Type primes: the cost sits at the places above one prime of `K` over
`g_i`, and `Σ_{𝔭|g_i} sz_𝔭(E_{u,j}(𝔭)) = (Σ_τ|ν_j(u, τ)| − D⁺_j − D⁻_j)·log g_i + 2 log g_i·(v_{g_i}(D_Γ) + C_cost·f·(N_m² + m²ϑ))` with
`D^H_j = D⁺_j + D⁻_j` of LocalGainOfThetaChains §4.9f (d) (the total size of the two diagrams of step `j`, at which the bulk of LocalGainOfThetaChains §4.9f (d) is `−D^H_j/2`); the
degree count `|Σ_τ|ν_j(u, τ)| − D⁺_j − D⁻_j − A_top| ≤ err_G` with `err_G·log(g₀g₁) ≤ C·B₀` (the kernel rows of 8.10 (b) against the rows of
`a⁺`: every row but the first at a top place is matched up to the shifts of ThetaChainsOnDefiniteUnitaryGroups §2.3; and
`0 ≤ D⁻_j = Σ_τΣ_{c<q_j}(e′_{j+c}(τ) − w_j(τ) − c − (t + 1)/2) ≤ f·q_j·max_τ(e′_{m−1}(τ) − w_j(τ))` (the sum is empty, and `D⁻_m = 0`, at the last step, where `q_m = 0`), which for nodes in arithmetic
progression of step `h₀` with the step weights at the midpoints is `≤ f·q_j²·h₀/2 ≤ f·m·ϑ/2`) leaves `A_top·log g_i` up to `C·B₀`. (v) Level
prime: the cost `𝔢_u` sits at the places above `π_u` and is `0` above `π̄_u` (LocalGainOfThetaChains §4.9f (e), ThetaChainsOnDefiniteUnitaryGroups §2.8), so
`Σ_{𝔭|T(u)} sz_𝔭(E_{u,j}) = 𝔢_u·log T(u) ≤ C·B₀`. (b) In the definition of `h_u` (8.9) the word enters only through
`−A_top·log T(u)` in `t_u` and through the kernel terms, so the left side is `|Σ_jΣ_τ(Kt_{j,τ}(u) − Kt_{j,τ}(u′))|`. Only the rows
`1 ≤ i ≤ k − 2` of a place depend on the word (8.10 (b)), each changes by at most `Sc` and lies in `[1, M]`, `M := Sc + max w_j`,
and `|ph(y) − ph(y′)| ≤ |y − y′|·log M` on `[1, M]`; so the difference is at most `m·f·k·Sc·(log M + |log Ω|)`, and `k·Sc ≤ b`,
`log M + |log Ω| ≤ C·x^ε` give `≤ C·m·f·b·x^ε = C·B₀`, which is at most the stated bound.

*Check.* Two words share `v, e′, e` (ThetaChainsOnDefiniteUnitaryGroups §2.3), so the hook products `H^+_{j,τ}`, `𝔫` and the top weights do not depend on the
word; only the inner entries of `u(τ)` do, by at most `Δ_w` each, and `Sc = 4kΔ_w`. The factor `T(u)^{−n_τ}` of the restriction is
archimedean (ThetaChainsOnDefiniteUnitaryGroups §3.9 (c)), not a cost; the costs of the level prime are those of (a)(v).

*NEW*. (a): [FormalProof], `Formalism/SharpRestriction/Divisibility/LocalQuadraticParts.lean`
(`Formalism.MainNotions.LocalQuadraticParts.adm11`); its inputs: [FormalProof],
`Formalism/SharpRestriction/Divisibility/WeightDegreeSizes.lean` (`Formalism.MainNotions.WeightDegreeSizes.SecondComplementInputs`,
and `Formalism.MainNotions.WeightDegreeSizes.secondComplement_of_inputs` for the derivation of (a)); (b): the last clause of
[FormalProof], `Formalism/SharpRestriction/GlobalTheoremInputs.lean` (`Formalism.MainNotions.LinkDIV_at`).
*Needs:* FrobeniusRestrictedRieszSums §0.4 (g), (v), ThetaChainsOnDefiniteUnitaryGroups §2.1, ThetaChainsOnDefiniteUnitaryGroups §2.3, ThetaChainsOnDefiniteUnitaryGroups §2.3b, ThetaChainsOnDefiniteUnitaryGroups §2.7, ThetaChainsOnDefiniteUnitaryGroups §2.8, ThetaChainsOnDefiniteUnitaryGroups §2.9, ThetaChainsOnDefiniteUnitaryGroups §2.9a, ThetaChainsOnDefiniteUnitaryGroups §2.9b, ThetaChainsOnDefiniteUnitaryGroups §3.6, ThetaChainsOnDefiniteUnitaryGroups §3.9, LocalGainOfThetaChains §4.9e, LocalGainOfThetaChains §4.9f, 8.7, 8.8, 8.9, 8.10, 8.20.

### 8.24a Valuations of the ratios of square constants at the twisted places

For a twisting datum with sign `s = +1` and a
square `(i, j)` of the grid of RowTowerAndRallisIdentities §5.8a let `ν_ξ = μ_{j+1}(ξ)/χ_{m−i}` be its Hecke character for the tuple `ξ` (RowTowerAndRallisIdentities §5.8d), `h_sq` half
the sum of the two ranks of the square, `ρ_ξ(s) := Λ(s, ν_ξ)/Λ(s, ν_1)` for integers `1 ≤ s ≤ h_sq` (all these values are nonzero
toric sums, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19d (ii)), and `r_{ij}(ξ) := c(i, j, ξ)/c(i, j, 1)`. For a finite place `𝔭 | ℓ` of `𝕃` let `g_s(𝔭) ∈ ℤ` be the mean
`𝔭`-adic valuation of the conjugates of the normalised value `Λ(s, ν_1)^♮` (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19b), rounded toward zero to an
integer, and `n_s(ℓ)` the least integer `≥ 0` that is at least the denominator exponent of
ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19b (i) for `Λ(s, ·)`.

(a) Under the hypotheses of RowTowerAndRallisIdentities §5.8b for the grid of the chain and a scale `x ≥ x_F` with the size predicate
`Size_□` of RowTowerAndRallisIdentities §5.8e, the depth constant `C_F ≥ C_F⁰` and the gap hypotheses of
RowTowerAndRallisIdentities §5.8 (the bottom norms below are then nonzero elements of `𝕃`, RowTowerAndRallisIdentities §5.8d): `r_{ij}(ξ)` is, up to a
factor that is a unit at every place dividing no norm of a twist place of `ξ` and up to `p_□ + q_□` step quotients `u_k`
(RowTowerAndRallisIdentities §5.8d) with `v_𝔭(u_k) ≤ 2Σ_{𝔮}c(𝔮)·v_𝔭(N𝔮)` at the places `𝔭` that divide no norm of a twist place of
`ξ` (the sum over the places of `S₀`, `c(𝔮)` the conductor exponents; `v_𝔭(u_k) = 0` at the places of (d)),
the product of the ratio of the
bottom constants `c⁰(ξ)/c⁰(1)` and of `∏_{k=1}^{p_□}ρ_ξ(e + q_□ − k + 1)·∏_{k=1}^{q_□}ρ_ξ(e + k)^{−1}` (`p_□ = ⌊(m − j − 1)/2⌋`,
`q_□ = ⌊(m − j)/2⌋`, so `p_□ + q_□ = m − j − 1`; `e` half the difference of the ranks of the squares `(i + 1, j + 1)` and `(i, j)`);
at every place `𝔭` that divides no norm of a twist place of `ξ`, `v_𝔭(c⁰(ξ)/c⁰(1)) ≤ v_𝔭(A(ξ)) + v_𝔭(A′(1)) + 6d_l(𝔭)`,
where the big bottom norm `A(ξ)` of `ξ` is a constant times
`∏_{s=1−e_□}^{h_□}Λ(s, ν_ξ)` (`e_□`, `h_□ ≤ h_sq` the numbers of RowTowerAndRallisIdentities §5.8d, half the difference and half the sum of the two shifted
ranks of the bottom pair of the square),
`A′(1)` the small bottom norm of the base tuple and `d_l(𝔭) := d(ℓ)·v_𝔭(ℓ)` for `𝔭 | ℓ`, where `d(ℓ) ≥ 0` is the *integrality
defect at `ℓ`* of 8.24b (i): an exponent such that the orders of the stabilisers of the classes of the bottom pairs have `ℓ`-adic valuation at most
`d(ℓ)` and the class sums of jets of CM theta values that are the coordinates of the bottom pairs, at class representatives
integral above `ℓ`, have `ℓ`-adic absolute value at most `ℓ^{d(ℓ)}` under every embedding of `ℚ̄` into `ℂ_ℓ`; then every bottom
norm `x` of RowTowerAndRallisIdentities §5.8d (for `ξ` and for the base tuple) is nonzero with `v_𝔭(x) ≥ −3d_l(𝔭)` (two
coordinates and one stabiliser order); and `ρ_ξ(s)` for `s ≤ 0` is a unit away from the twist places times `ρ_ξ(1 − s)` (the functional
equation in ratio form, from AnalyticNumberTheoryPartI §2.3a for `ν_ξ` and `ν_1`).

(b) For every finite place `𝔭 | ℓ` that divides no norm of a twist place of `ξ`: `v_𝔭(ρ_ξ(s)) + g_s(𝔭) ≥ −n_s(ℓ)·v_𝔭(ℓ)`.

(c) For a good twisting datum (CongruenceModulesOfThetaLifts §7.10a): if `ξ = ξ_𝔭` is the tuple twisted at `𝔭` (ThetaChainsOnDefiniteUnitaryGroups §2.5), so that `ν_ξ = ν_1δ_ℓψ_𝔭`
(the twisting datum has the sign `s = +1`, ThetaChainsOnDefiniteUnitaryGroups §2.5), and `𝔭` does not divide the norms
of the twist places of `ξ_𝔭`: for every `1 ≤ s ≤ h_sq`, whenever `z ∈ 𝕃` and `z·Λ(s, ν_1δ_ℓ) = Λ(s, ν_1δ_ℓψ_𝔭)`, `v_𝔭(z) ≤ v_𝔭(ℓ)/ℓ²`.

(d) Consequently, for `ξ = ξ_𝔭`,
`v_𝔭(r_{ij}(ξ_𝔭)) ≤ |v_𝔭(A)| + |v_𝔭(A′)| + 4Σ_{s≤h_sq}(|g_s(𝔭)| + |v_𝔭(Λ(s, ν_1δ_ℓ)/Λ(s, ν_1)) + g_s(𝔭)|) + 5Σ_{s≤h_sq}n_s(ℓ)v_𝔭(ℓ) + 2h_sq·v_𝔭(ℓ)/ℓ² + 6d_l(𝔭) + (p_□ + q_□)·2Σ_𝔮c(𝔮)v_𝔭(N𝔮)`, with `A, A′` the bottom norms of the base tuple.

*Route.* (a) The tower recursion of RowTowerAndRallisIdentities §5.8d (ThetaLiftsForDefiniteUnitaryGroups §6.12, with one constant `C` for every
set `T ⊆ P` of places, `P` a fixed finite set of places of `F` split in `E`, and one place `v₁` fixed outside `P` before `C`, the
same for all tuples `ξ`, so that `C` cancels in `r_{ij}(ξ)`), the Rallis norms of the
definite bottom pair, and the functional equation AnalyticNumberTheoryPartI §2.3a in ratio form. (b) ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19b (i) for the numerator, the gauge `g_s`
for the denominator. (c) Both values are toric sums (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19d (i), with no correction factor, `ψ_𝔭` being ramified at all of
`Q(ξ_𝔭)`); the `𝔭`-adic valuation of `z` is read through an embedding of `ℂ` into an algebraic closure of the `ℓ`-adic
coefficient field, which agrees with the `𝔭`-adic embedding only on a subfield, so `z` is moved by an automorphism of `ℂ`;
by ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19c the moved ratio is the toric ratio for `ψ_𝔭^a`, `a` prime to `ℓ` (`ψ_𝔭` has `ℓ`-power order); by ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19d (iii) it is a
unit times the twisted theta value `Σ_δ th_χ(Q, δ)ψ_𝔭^a(δ)` (`χ = ν_1δ_ℓ`), whose untwisted value is `1`; `ψ_𝔭` is an
`ℓ^{−2}`-good twist for the polynomial condition 8.19e (a) (the twisting datum being good), so clause (c) of the definition of a good twist in CongruenceModulesOfThetaLifts §7.8 (2), at
the exponent `m′ = a` (prime to `ℓ`), bounds the valuation of the polynomial of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19d (iii) by its level plus `ℓ^{−2}`, hence
that of the twisted theta value (the polynomial divided by `ℓ^{N₀}`) by `ℓ^{−2}`. (d) The tower factor of (a) collapses: its
numerators sit at `s ∈ [e + q_□ − p_□ + 1, e + q_□]`, its denominators at `s ∈ [e + 1, e + q_□]`, and `p_□ ≤ q_□ ≤ p_□ + 1`, so it
is `1` when `q_□ = p_□` and `ρ_ξ(e + 1)^{−1}` when `q_□ = p_□ + 1`. What remains are the `e_□ + h_□ ≤ 2h_sq` numerators of the
big bottom norm (the reflected range `1 − e_□ … 0`, read as `ρ_ξ(1 − s)` through the functional equation, and the range
`1 … h_□`), each in `[1, h_sq]`, and at most one denominator; so each `v_𝔭(ρ(s))`, `1 ≤ s ≤ h_sq`, enters at most three times. Use
the upper bound (c) (applied to `ρ(s)/zd_s`, `zd_s = Λ(s, ν_1δ_ℓ)/Λ(s, ν_1)`) at the numerators, at most `2h_sq` times, which gives
the term `2h_sq·v_𝔭(ℓ)/ℓ²`, and the lower bound (b) at the denominator: a larger valuation of the ratio is the unfavourable
direction for the slope test. The coefficients `4` and `5` of (d) are generous. In (b) the passage from the bound of
ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19b (i) to the gauge is this. *Lemma.* Let `β ≠ 0` be an
algebraic number, `p ∈ 𝕃[X]` its monic minimal polynomial over `𝕃`, of degree `n`, and `mv_𝔭(β) := v_𝔭(p(0))/n`, the mean of the
`𝔭`-adic valuations of its conjugates over `𝕃`. If `c ∈ 𝕃^×`, `m ≥ 0`, `𝔭 | ℓ`, and an integer prime to `ℓ` times `ℓ^m·c·β` is an
algebraic integer, then `v_𝔭(c) + mv_𝔭(β) ≥ −m·v_𝔭(ℓ)`: with `a` that integer times `ℓ^m·c`, the minimal polynomial of `aβ` over
`𝕃` has coefficients in `𝒪_𝕃` and constant term `a^n·p(0)`, so `n·v_𝔭(a) + v_𝔭(p(0)) ≥ 0`. Take `β := (Λ(s, ν_1)^♮)^{12}`, so that
`g_s(𝔭)` is `mv_𝔭(β)/12` rounded toward zero. `Λ(s, ν_ξ)` is the twisted toric sum of `ν_1` for the character `ν_ξ/ν_1` of the
class group of the order of conductor `𝔣·∏_{𝔮∈Q}𝔮`, `Q` the places of `F` under the twist places of `ξ`, which is prime to `ℓ`;
so by ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19b (i) `ℓ^{12·n_s(ℓ)}·(Λ(s, ν_ξ)^♮)^{12}` is integral at `ℓ`,
and `(Λ(s, ν_ξ)^♮)^{12} = ρ_ξ(s)^{12}·β`. The lemma with `c = ρ_ξ(s)^{12}`, `m = 12·n_s(ℓ)`, divided by `12`, gives
`−n_s(ℓ)·v_𝔭(ℓ) − v_𝔭(ρ_ξ(s)) ≤ mv_𝔭(β)/12`; the left side is an integer, so it is at most `g_s(𝔭)`. [FormalProof] states (b) as
`Development/AbelianVarietyTheory/Statements/PlaceShiftStatements/NormSmall.lean` (`GlobalTheory.SqTop.RhoLow`), proved in
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/LValueRatioLowerBoundGaugeStatement.lean`
(`GlobalTheory.T.lValueRatio_lower_bound_gauge`), and the lemma as
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/MeanValuationGeOfIntegralAtPrimeStatement.lean`
(`GlobalTheory.T.meanValuation_ge_of_integral_at_prime`), proved in
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/MeanValuationGeOfIntegralAtPrime.lean`
(`GlobalTheory.FunObj.SqNum.meanVal_vw_ge_of_intAt`).

*Check.* With no twist (`ξ = 1`) every ratio is `1` and (d) is trivially true; the term `2h_sq·v_𝔭(ℓ)/ℓ²` is the whole cost of the
twist, summable over `ℓ` with the weights `ϱ(𝔭)`. For the hosts `E = ℚ_n·ℚ(ψ)·ℚ(√−q)·ℚ(√−d)` of FrobeniusRestrictedRieszSums §0.4, `d` is
prime and `2` is ramified in `E` when `n ≥ 1`, so the two hypotheses of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19b that this layer carries hold there.

*NEW*. (d): [FormalProof], `Development/AbelianVarietyTheory/Statements/PlaceShiftStatements/NormSmall.lean`
(`GlobalTheory.SqTop.OneSqSt`),
`Formalism/LocalToGlobal/IndefiniteForms/IndefiniteTree/FunctionalLowerBoundOfConditionsNumeric.lean`
(`Formalism.L2.Indef.Tree.LeafOneSquare`).
*Needs:* RowTowerAndRallisIdentities §5.8a, RowTowerAndRallisIdentities §5.8b, RowTowerAndRallisIdentities §5.8d, RowTowerAndRallisIdentities §5.8e, CongruenceModulesOfThetaLifts §7.8, CongruenceModulesOfThetaLifts §7.11, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19b, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19c, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19d, 8.19e, 8.24b, ThetaChainsOnDefiniteUnitaryGroups §2.5; ThetaLiftsForDefiniteUnitaryGroups §6.12; AnalyticNumberTheoryPartI §2.3a.

### 8.24b Integrality and archimedean size of the bottom norms

There is an absolute `C > 0` such that, for an integer `N ≥ 1` and a real `B ≥ 1`, for the bottom pairs of RowTowerAndRallisIdentities §5.8d of rank at most `2N` and
weights at most `2B` at a level `Q ≥ 1` all of whose prime factors split in `K`, and every `L ≥ 1` with `log rd_E ≤ L`: (i) there
are a finite set `S_d` of primes and exponents `d(ℓ) ≥ 0`, zero outside `S_d`, with
`Σ_ℓ d(ℓ)·log ℓ ≤ C·f·2N·log(2fN) + C·f·2N·B·L + C·f·(2N)²·B·log Q`, such that for every prime `ℓ` and every bottom pair of
rank at most `2N` and weights at most `2B` at a level `Q′ ≥ 1` with `v_ℓ(Q′) ≤ v_ℓ(Q)` (the pairs of level `Q`; and, at the
primes `ℓ` that divide no norm of a twist place of `ξ`, the pairs of a tuple `ξ`, whose level is `Q` times the product of the
norms of the twist places of `ξ`, 8.24c (iii)): every class has a representative integral above `ℓ`; the stabiliser of every
class is finite and its order has `ℓ`-adic valuation at most `d(ℓ)`; and at such
representatives the coordinates (class sums of jets of CM theta values) are algebraic numbers of `ℓ`-adic absolute value
at most `ℓ^{d(ℓ)}` under every embedding of `ℚ̄` into `ℂ_ℓ`; (ii) consequently every nonzero bottom norm `x ∈ 𝕃` of a pair of
level `Q` has `v_𝔭(x) ≥ −3d(ℓ)·v_𝔭(ℓ)` at every `𝔭 | ℓ` (for a pair of a level `Q′` as in (i) the same bound holds at the
places above the primes `ℓ` with `v_ℓ(Q′) ≤ v_ℓ(Q)`, by the same argument), and
`Σ_𝔭 ϱ(𝔭)·d_l(𝔭) ≤ C·f·2N·log(2fN) + C·f·2N·B·L + C·f·(2N)²·B·log Q`; (iii) if
moreover `|(L′/L)(1, χ_K)| ≤ L`, every bottom norm `x ∈ 𝕃` has
`mean_σ log⁺|σ(x)| ≤ C·f·2N·B·(L + log(2NB)) + C·f·N²·(L + log(2fNB)) + C·N²·log Q`.

*Route.* (i) Fix `ℓ`. (1) Every class has a representative whose component at `ℓ` is trivial up to an integral element,
and the order of the stabiliser of a class of rank at most `2N`, at a level inside the stabiliser of the standard
lattice, divides `8^{4fN}·(8fN)!`. (2) The terms of a class sum, the sum of the squared coordinates of a class and the
norm do not depend on the representatives. (3) At representatives trivial at `ℓ` the transformed test function of a pair
of ranks `a ≤ a′` and level `Q′` is `Σ_ir_i·U_{s_i}Θ_b` (8.24d), `b` a basis adapted at `ℓ`, `M·Q′·s_i` in the lattice of `b` for an
integer `M` prime to `ℓ`, `r_i` algebraic with `|r_i|_ℓ ≤ |Q′|_ℓ^{−a·a′}`. (4) A coordinate is a class sum, with the inverse
stabiliser orders as weights, of the values at such functions of an operator homogeneous of degree `n = a·Σ_τn_τ ≤ 4fNB`
(a product of `n_τ` minors of size `a` at each place); the coordinate directions are combinations of directions of
`𝔞₀·M_{a′×a}(𝒪_E)` with algebraic coefficients of `ℓ`-adic absolute value at most `ℓ^{c(ℓ)}`, where `c ≥ 0` and
`Σ_ℓc(ℓ)·log ℓ ≤ log rd_E`. By 8.24d, at a level `Q′` with `v_ℓ(Q′) ≤ v_ℓ(Q)` (so that `ℓ` divides `M·Q′` only if it divides `Q`,
and then it is `2` or splits in `K`), a coordinate has absolute value at most `ℓ^{d(ℓ)}` with
`d(ℓ) := v_ℓ(8^{4fN}·(8fN)!) + 4fNB·(c(ℓ) + [ℓ = d]/4 + v_ℓ(Q)) + 4N²·v_ℓ(Q)`, and
`Σ_ℓd(ℓ)·log ℓ ≤ 18·2fN·log(2fN) + 4fNB·(3L/2 + log Q) + 4N²·log Q` (`log d ≤ 2·log rd_E`). (ii) A bottom norm is the sum over
the classes of the squared absolute values of the coordinates divided by the stabiliser order; by (2) the coordinates
may be taken at representatives integral above `ℓ`; the complex conjugate of an algebraic number bounded under every
embedding into `ℂ_ℓ` is bounded in the same way; hence the factor `3` (two coordinates, one stabiliser order); the norm is
nonzero when a coordinate is; the sum over the places is the product formula for the primes. (iii) The stabiliser
orders are at least `1`. The mean over the embeddings of `𝕃` of `log⁺` of a norm is at most the mean, over the embeddings
`ρ` of a finite Galois extension containing the coordinates, of `log⁺` of the sum of the squared conjugates; 8.24e (a)
bounds each conjugate; the number of classes is at most the number at full level times `Q^{a′²+4}`; and 8.24e (b) bounds
the means of the two terms that depend on the conjugate lattice by `C·L`. The facts (1)–(3) and the count of (iii) are
statements of [FormalProof]; their proofs are not given here. (i) is not a consequence of
ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19b (i), which concerns lattice sums and toric sums.

*NEW*. [FormalProof], `Development/AbelianVarietyTheory/Statements/CuspidalUnitaryTwists/ExistsSmallSpherical.lean`
(`GlobalTheory.NormSum.IntSt` for (i) and (ii), `GlobalTheory.NormSum.ArchSt` for (iii)), proved in
`Development/AbelianVarietyTheory/Proofs/FoundationProofs/IntegralAndArchimedeanBounds.lean` (`GlobalTheory.NormSum.intSt_and_archSt`);
[FormalProof], `Formalism/LocalToGlobal/IndefiniteForms/IndefiniteTree/FunctionalLowerBoundOfConditionsNumeric.lean`
(`Formalism.L2.Indef.Tree.LeafINT`).
*Needs:* RowTowerAndRallisIdentities §5.8d, 8.24d, 8.24e.

### 8.24c The denominators of the test values and the sizes of the square values

In the setting of 8.24 (the size conditions of ThetaChainsOnDefiniteUnitaryGroups §2.1 and the hypotheses of
RowTowerAndRallisIdentities §5.8b for the grid of the chain at a scale `x ≥ x_F` with the size predicate `Size_□` of
RowTowerAndRallisIdentities §5.8e, the depth constant `C_F ≥ C_F⁰` and the gap hypotheses of RowTowerAndRallisIdentities §5.8),
let `M` be the lattice of test values and `v_ξ` the vectors of class sums of jets of CM
theta values of the route of 8.24 (a), `N = k + m(t + s + 1)` (`s = r + 6` the integer of the grid, RowTowerAndRallisIdentities
§5.8a) and `σ_G = Σ_{v∈S_□} d(v)·log N v` as in its term (2), and
`g_s(𝔭)`, `n_s(ℓ)`, `zd_s` as in 8.24a.

(i) *Denominators of the test values.* There is a constant `C` fixed before `ε` such that, for `x` at least a threshold
depending on `ε` and `C`, there are integers `d_F(𝔭) ≥ 0`, zero outside a finite set of finite places of `𝕃`, with: at every
finite place `𝔭` and for every integral form `φ` at the base level of the tuple `ξ_𝔭` used at `𝔭`, some `y ∈ 𝕃^×` with
`v_𝔭(y) ≤ d_F(𝔭)` has `y·v_{ξ_𝔭}(φ) ∈ M`, so that `v_{ξ_𝔭}(M̃_{ξ_𝔭})·𝒪_(𝔭) ⊂ 𝔭^{−d_F(𝔭)}M_(𝔭)` (the module of values,
localised at `𝔭`; `v_ξ` being `c_𝕃`-semilinear in the form, RowTowerAndRallisIdentities §5.8, this is the image of the forms
integral at `c_𝕃(𝔭)`); and
`2Σ_𝔭 ϱ(𝔭)·d_F(𝔭) ≤ C·f·m²·N²·(log b + σ_G)·b`.

(ii) *Gauges and denominator exponents.* There is a constant `C`, depending on `ε` and on the constants fixed before `ε`, such
that, for `x` at least a threshold depending on them, for every square `(i, j)` of the grid, every `1 ≤ s ≤ h_sq` and both
auxiliary characters `δ_ℓ ∈ {δ, δ′}`: `zd_s ≠ 0`, `Σ_𝔭 ϱ(𝔭)·|g_s(𝔭)| ≤ C·f·b·(log b + log x)`,
`Σ_𝔭 ϱ(𝔭)·|v_𝔭(zd_s) + g_s(𝔭)| ≤ C·f·b·(log b + log x)` and `Σ_ℓ n_s(ℓ)·log ℓ ≤ C·f·b·(log b + log x)`.

(iii) *The bottom pairs of the grid.* There is a constant `C`, depending on `ε` and on the constants fixed before `ε`, such
that, for `x` at least a threshold depending on them, the bottom pairs of the squares of the grid have rank at most `2N` and
weights at most `2B` for a real `B` with `1 ≤ B ≤ C·b` and `log B ≤ C·log b`, at a level `Q` all of whose prime factors split
in `K`, with `log Q ≤ 45·f·log b`; `Q = ∏_{v∈S_□}N(v)^{c(v)}` (`c(v_□) = 1`, `c(v) = 2` at the other places
of `S_□`) is the level of the pairs of the base tuple, and the pairs of a tuple `ξ` have the level `Q` times the
product of the norms of the twist places of `ξ` outside the places of the grid, with the same bounds for the rank and the
weights; so 8.24b applies to them with `L = log b`.

*Route.* (i) By the formula of RowTowerAndRallisIdentities §5.8 for the Bessel periods of the grid, a test value is
a finite sum of products of a scalar, the coefficients of the coset expansions, local data at the places, inverse
stabiliser orders, and the last pairing of a test vector pushed through the `m` step maps of the top row with the value
of the form pushed through the `m` step maps of the last column. At a place away from the tuple each factor loses a
bounded amount: there are functions `d_•(𝔭) ≥ 0` with finite support and `Σ_𝔭ϱ(𝔭)·d_•(𝔭) ≤ m·β` for the scalar, the
coefficients, the local data and the stabiliser orders, `≤ β` for one step map of either kind, for the last pairing and
for the forms, `β := C′·f·m·N²·(log b + σ_G)·b`; the depths of the coset expansions at `ℓ` are at most the depth of `𝔪_□` at
`ℓ`. The losses add, which gives the bound with `C = 16·C′`. The factor bounds are statements of [FormalProof]; their
proofs are not given here. (ii) For `β` the twelfth power of a normalised value of `ν_1`, `ν_1δ` or `ν_1δ′`, the lemma of
8.24a (b) with `c = 1` gives `mv_𝔭(β) ≥ −12·n_s(ℓ)·v_𝔭(ℓ)` at every `𝔭 | ℓ`; by the product formula for the constant term of the
minimal polynomial, `Σ_𝔭ϱ(𝔭)·mv_𝔭(β)` is minus the mean of `log|·|` over the conjugates of `β`, which is at most
`12·C′·f·b·(log b + log x)` in absolute value (the conjugates are normalised values of Hecke `L`-functions of the characters
with permuted weights, bounded through the functional equation); so `Σ_𝔭ϱ(𝔭)·|mv_𝔭(β)|/12 ≤ C′·f·b·(log b + log x) + 2Σ_ℓn_s(ℓ)·log ℓ`;
`β(ν_1δ_ℓ) = zd_s^{12}·β(ν_1)` gives the second sum, and rounding to the gauge changes each sum by a bounded factor. The
sum of the `n_s(ℓ)·log ℓ` is bounded by ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19b (ii) and the
sizes of the conductor and of `d_E`. The archimedean bound is a statement of [FormalProof] whose proof is not given
here. (iii) The rank of a bottom pair is the sum of the two shifted ranks of RowTowerAndRallisIdentities §5.8d, at most
`2N`; its weights are determined by the infinity type of `ν_ξ` and the ranks, and are at most `2B` for `B` the largest of
`1` and the absolute values of two integers attached to each square and place; `B ≤ 10·b` under `Size_□`; `Size_□` makes
every prime under `S_□` split in `K`, and bounds `Σ_{v∈S_□}c(v)·log N v`. In (i), [FormalProof] gives real exponents
`d(𝔭) ≥ 0` with `Σ_𝔭ϱ(𝔭)d(𝔭) ≤ C·f·m²·N²·(log b + σ_G)·b/2` that serve every tuple `ξ` at every place `𝔭` whose residue
characteristic is that of no twist place of `ξ` outside `S_□`; the tuple `ξ_𝔭` used at `𝔭` has this property at `𝔭`, and
`d_F(𝔭) := ⌊d(𝔭)⌋`.

*NEW*. (i): [FormalProof], `Development/AbelianVarietyTheory/Statements/PlaceShiftStatements/InfClassAt.lean`
(`GlobalTheory.SumSize.FinAt`, `GlobalTheory.SumSize.bOne`), `Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/LocalTypeDictionary/SumSizeFiniteAwayArchimedeanCombined.lean`
(`GlobalTheory.T.sum_size_bound_all_places`), `Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/LeafFixedPointOfFinKAwayKStatement.lean`
(`GlobalTheory.T.leafFixedPoint_of_finK_awayK`), `Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/LocalTypeDictionary/TwistedLocalFactorAwayFromLevel.lean`
(`GlobalTheory.Adopt.twisted_local_factor_away_from_level`, the tuple used at a place); (ii): [FormalProof], `Development/AbelianVarietyTheory/Statements/PlaceShiftStatements/NormSmall.lean`
(`GlobalTheory.SqTop.ThbSt`, `GlobalTheory.SqTop.DenSum`), `Development/AbelianVarietyTheory/Proofs/DivisorProofs/ToricValueHeightBoundOfDenominatorsMeansStatement.lean`
(`GlobalTheory.T.toricValueHeightBound_of_denominatorsMeans`); (iii): [FormalProof], `Development/AbelianVarietyTheory/Statements/PlaceShiftStatements/NormSmall.lean`
(`GlobalTheory.SqTop.BotSmall`), `Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/WtTieStatement.lean`
(`GlobalTheory.T.weight_of_size_bound'`), `Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/RamifiedSumsSeventhBoundStatement.lean`
(`GlobalTheory.T.ramified_sum_bound'`). *Needs:* ThetaChainsOnDefiniteUnitaryGroups §2.1, ThetaChainsOnDefiniteUnitaryGroups §2.5,
RowTowerAndRallisIdentities §5.8, RowTowerAndRallisIdentities §5.8a, RowTowerAndRallisIdentities §5.8b, RowTowerAndRallisIdentities §5.8d, RowTowerAndRallisIdentities §5.8e,
ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19b, 8.24a, 8.24b.

### 8.24d Jets of torsion translates of the CM theta function

*Notation.* `𝔠 ≠ 0` an ideal of `𝒪_K` of norm prime to `2d`, `Λ := δ·ι₀(𝔠)` with `δ^{12} = Δ(ι₀(𝔠))` (`Λ = Λ_K` for `𝔠 = 𝒪_K`,
ThetaChainsOnDefiniteUnitaryGroups §3.1a), `A` its covolume; `(U_ωG)(z) := G(z + ω)·exp(−πzω̄/A − π|ω|²/(2A))`; `θ` the reduced
theta function of `ℂ/Λ` and `θ₀ := U_{t₀}θ/(U_{t₀}θ)(0)` for a point `t₀` of order two killed by neither `(1 ± √−d)/2`
(ThetaChainsOnDefiniteUnitaryGroups §3.1c). For ranks `a, a′ ≥ 0`: `V := ∏_{τ∈Φ}M_{a′×a}(ℂ)`, `H(z, w) := Σ_τtr(z_τw_τ^*)/A`,
`(U_xG)(z) := G(z + x)·exp(−πH(z, x) − πH(x, x)/2)`, `𝒴 := 𝔞₀·M_{a′×a}(𝒪_E)` (`𝔞₀` of
ThetaChainsOnDefiniteUnitaryGroups §2.2), `τ(β) ∈ V` the image of `β ∈ M_{a′×a}(E)` under the
places, and for a `K`-basis `b = (b_k)` of `M_{a′×a}(E)`, orthonormal for `Tr_{E/K}Σ_{i,j}x_{ij}ȳ_{ij}`:
`Θ_b(z) := ∏_kθ₀(Σ_τΣ_{i,j}z_{τ,i,j}·conj(τ(b_{k,i,j})))`.

*Statement.* Let `p` be a prime not dividing `N(𝔠)`, with an embedding of `ℚ̄` into `ℂ_p`, and `N₁ ≥ 1` an integer such that
`p ∤ N₁`, or `p = 2`, or `p` splits in `K`. (a) For `y ∈ ℂ` with `N₁y ∈ Λ` and every `n ≥ 0`, `(U_yθ₀)^{(n)}(0)` is algebraic, of
`p`-adic absolute value at most `|N₁|_p^{−n}`, times `p^{n/4}` if `p = d`. (b) Let `b` be as above and a basis of `𝒴` over `𝒪_K`
locally at `p` (each `b_k`, and each element of `𝒴` written in `b`, after multiplication by an integer prime to `p`). For
`s ∈ V` with `N₁·s ∈ Σ_kΛ·τ(b_k)`, `n ≥ 0` and `y_1, …, y_n ∈ 𝒴`, the derivative `D^n(U_sΘ_b)(0)(τ(y_1), …, τ(y_n))` is algebraic, with
the same bound.

*Route.* (a) For `p ∤ N₁`: the curve `ℂ/Λ` has a Weierstrass model with unit discriminant over the integers of `ℂ_p`; in the
parameter of its formal group the translate is `e^{−φ}` times a series with integral coefficients, `φ` the phase of
ThetaChainsOnDefiniteUnitaryGroups §3.1c (a); the derivatives of `φ` at `0` are integral except the second, which is
integral for `p ≠ d` and of absolute value at most `p^{1/2}` at `p = d` (the half valuation of `s₂`); at `p = 2` the phase of
`θ₀` is integral. For `p | N₁`: the pull-back of `U_yθ₀` by multiplication by `N₁` is the product of `z ↦ θ₀(N₁z)` and a series
with integral coefficients (the phase is integral at `2` and at the primes split in `K`), whence the factor `|N₁|_p^{−n}`.
(b) Write `s = Σ_k(w_k/N₁)·τ(b_k)` with `w_k ∈ Λ`; `b` being orthonormal, `U_sΘ_b` is the product over `k` of the translates
`U_{w_k/N₁}θ₀` in the coordinates of `b`; the coordinates of the elements of `𝒴` in `b` are integral at `p`; the Leibniz rule.
(a) is a statement of [FormalProof] at every prime; ThetaChainsOnDefiniteUnitaryGroups §3.1c gives it, for `𝔠 = 𝒪_K` and
points of order prime to `p`, at the primes it covers; the rest of its proof is not given here.

*NEW* (this form). (a): [FormalProof],
`Development/AbelianVarietyTheory/Proofs/FoundationProofs/TorsionTranslateThetaJetsDenominatorBoundStatement.lean`
(`GlobalTheory.T.torsionTranslate_theta_jets_denominator_bound`); (b): [FormalProof],
`Development/AbelianVarietyTheory/Proofs/FoundationProofs/JetsTorsionTranslatesCmThetaProductStatement.lean`
(`GlobalTheory.T.jets_torsion_translates_cm_theta_product`).
*Needs:* ThetaChainsOnDefiniteUnitaryGroups §§2.2, 3.1a, 3.1c.

### 8.24e Conjugates of the coordinates of a bottom pair, and means over the conjugate lattices

*Statement.* In the notation of 8.24d, for a field automorphism `ρ` of `ℚ̄` let `Λ^ρ` be the lattice with invariants
`ρ(g₂(Λ))`, `ρ(g₃(Λ))`, `t_ρ` a point of order two of `Λ^ρ` killed by neither `(1 ± √−d)/2`, and
`‖g‖²_{Λ′} :=` the mean over a period parallelogram of `Λ′` of `|g(z)|²·e^{−π|z|²/area(Λ′)}`. (a) For a bottom pair of ranks `a ≤ a′`,
weights `n_τ ≤ 2B` (`B ≥ 1`) and level `Q ≥ 1`, every coordinate `c` is algebraic and, for every `ρ`,
`|ρ(c)|² ≤ h(a)²·Q^{a·a′}·(a!)^{2Σ_τn_τ}·3·(2f·a·a′·rd_E + 1)^{f·a·a′}·‖θ₀(Λ^ρ, t_ρ)‖^{2f·a·a′}_{Λ^ρ}·(2eπB/area(Λ^ρ))^{a·Σ_τn_τ}`,
`h(a)` the number of classes of the smaller group at full level. (b) There is an absolute `C` such that for `L ≥ 1` with
`log rd_E ≤ L` and `|(L′/L)(1, χ_K)| ≤ L`, and every finite extension `M` of `ℚ` containing `g₂(Λ)`, `g₃(Λ)` and `℘_Λ(t₀)`: the mean
over the embeddings `ρ` of `M` of `log⁺(1/area(Λ^ρ))` is at most `C·L`, and so is the mean of `log⁺‖θ₀(Λ^ρ, t_ρ)‖²_{Λ^ρ}`.

*Route.* (a), (b) are statements of [FormalProof]; their proofs are not given here. In (a) the conjugate of a coordinate
is the coordinate formed with the conjugate lattice, and the factors are those of a Cauchy estimate for a jet of degree
`a·Σ_τn_τ` in the Fock norm; in (b) the conjugate lattices are those of the conjugates of the curve, and the mean of the
logarithms of their areas is governed by `log rd_E` and `(L′/L)(1, χ_K)` (the Chowla–Selberg mean of the Conventions).

*NEW* (this form). (a): [FormalProof],
`Development/AbelianVarietyTheory/Proofs/FoundationProofs/DefiniteThetaPairCoordinateConjugatesBoundedStatement.lean`
(`GlobalTheory.T.definiteThetaPair_coordinate_conjugates_bounded`); (b): [FormalProof],
`Development/AbelianVarietyTheory/Proofs/FoundationProofs/ConjugateLatticeMeansPosLogAreaThetaBoundedStatement.lean`
(`GlobalTheory.T.conjugate_lattice_means_posLog_area_theta_bounded`).
*Needs:* 8.24d (the notation), RowTowerAndRallisIdentities §5.8d.

### 8.24 The maximal slope of the target

With the metric of 8.9 on `𝔼_0` and `𝔼`, under the size
conditions of ThetaChainsOnDefiniteUnitaryGroups §2.1, the hypotheses of 8.8 at every step and place (for the Rallis
eigenvalues in term (3) of the route), the hypotheses of RowTowerAndRallisIdentities §5.8b for the grid of the chain and a scale `x ≥ x_F` with the
size predicate `Size_□` of RowTowerAndRallisIdentities §5.8e, the depth constant `C_F ≥ C_F⁰` and the gap hypotheses of
RowTowerAndRallisIdentities §5.8, for a good twisting datum (CongruenceModulesOfThetaLifts §7.10a): (a) `μ_max(R_0) + log 𝔫 ≤ x^{C}·b`, with an exponent `C` chosen after
`ε` (it may depend on `ε` and on the constants fixed before `ε`, and not on `x` nor on anything chosen at the scale `x`); (b) consequently `H₀ := x^C·b − log 𝔫` satisfies the hypothesis `H₀ ≥ μ_max(R_0)` of 8.21 (b), and, for a host with wild-kernel
budget `κ_W = 1` (CongruenceModulesOfThetaLifts §7.11), under the depth hypothesis of CongruenceModulesOfThetaLifts §7.10a, the length bound of
CongruenceModulesOfThetaLifts §7.10c, the condition (T3) of 8.20 and `[F:ℚ] ≥ 3`, `r + 1 < g₀, g₁`, `q_z ≤ ¼` and the hypotheses (H1)–(H3) of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18f (c) (through ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19), with the size conditions of 8.22, the smallness condition of 8.21 (b) holds for `δ_G` of 8.21 (c)
(under its hypotheses) and `μ(R^∨) ≤ log 𝔫 + Σ_j s^{st}_j + F_tot + C·m·(B₀ + N_c)·x^{e_D ε}` and `μ_max(R) + log 𝔫 ≤ x^{C}·b` for the
lattice `R` of the rows.

*Route.* (a) *Slope test.* Let `L`, `M` be Hermitian lattices, `c` an automorphism of `𝕃`, and
`Ψ : L ⊗ 𝕃 → M ⊗ 𝕃` an injective additive map with `Ψ(ay) = c(a)·Ψ(y)` for `a ∈ 𝕃` (a `c`-semilinear map; `𝕃`-linear
for `c = id`). Then `Ψ(L)` is an `𝒪_𝕃`-submodule of `M ⊗ 𝕃`, and if `Ψ(L)·𝒪_(𝔭) ⊂ 𝔭^{−a(𝔭)}M_(𝔭)` for all `𝔭`, with
integers `a(𝔭)` almost all zero, then `μ_max(L) ≤ μ_max(M) + ht(Ψ) + 2Σ_𝔭ϱ(𝔭)a(𝔭)`, where `ht(Ψ) := mean_σ log ‖Ψ‖²_σ`
and `‖Ψ‖_σ := sup_{y ≠ 0} ‖Ψ(y)‖_σ/‖y‖_{σ∘c}` (the norm of `y` at `σ∘c`, that of `Ψ(y)` at `σ`, as in 8.1 for semilinear
functionals). For `c = id` this is SlopesOfHermitianVectorBundles §2.4 (b) with its finite-place bound, in the
normalisation `μ = 2μ̂`, and SlopesOfHermitianVectorBundles §2.1 for the lattice `𝔞M`, `𝔞 = ∏_𝔭𝔭^{−a(𝔭)}`. The integers
`a(𝔭)` may be negative here; the bound `‖Ψ‖_𝔭 ≤ N𝔭^{a(𝔭)}` holds for `a(𝔭)` of either sign, and applying
SlopesOfHermitianVectorBundles §2.4 (b) with `max(a(𝔭), 0)` in place of `a(𝔭)` gives the same inequality with a right
side that is not smaller, which is all that is used. For general `c` apply the case `c = id` to the *conjugate
lattice* `L^c`: the abelian group `L` with the scalar multiplication `a ⋆ y := c^{−1}(a)·y` of `𝒪_𝕃`, carrying at each
embedding `σ` the metric of `L` at `σ∘c` (the identity of `L` induces `L^c ⊗_{𝕃,σ} ℂ = L ⊗_{𝕃,σ∘c} ℂ`, because
`(a ⋆ y) ⊗ 1 = y ⊗ σ(a)` on both sides). Three verifications. (i) `Ψ` is an injective `𝕃`-linear map
`L^c ⊗ 𝕃 → M ⊗ 𝕃` (`Ψ(a ⋆ y) = a·Ψ(y)`), and its operator norm at `σ` is `‖Ψ‖_σ`. (ii) The localisation of `L^c` at `𝔭`
is the localisation of `L` at `c^{−1}(𝔭)` (its elements are the `s^{−1} ⋆ y = c^{−1}(s)^{−1}·y`, `s ∉ 𝔭`), and its image
under `Ψ` is `Ψ(L)·𝒪_(𝔭)`; so the hypothesis above is the finite-place hypothesis of the linear case for `L^c`, every
exponent being indexed by the place of `M`. (iii) `L^c` and `L` have the same `𝒪_𝕃`-submodules, with the same ranks
and the same slopes: in the formula for `−rk·μ` of the Conventions, with one basis `e` for both, the Gram determinants
at the embeddings are permuted by `σ ↦ σ∘c`, and `idx_𝔭(L^c : ⟨e⟩) = idx_{c^{−1}(𝔭)}(L : ⟨e⟩)` with
`ϱ(c^{−1}(𝔭)) = ϱ(𝔭)`; hence `μ_max(L^c) = μ_max(L)`. Apply this with `c = c_𝕃` to `L = R_0` with the metric of 8.9
divided by `𝔫` (which adds `log 𝔫` to its slopes), `M` the lattice of test values and `Ψ = (c_tot(1)κ_G^{−1}ℬ_a)_a`
(RowTowerAndRallisIdentities §5.8), which maps `𝔼_{0,𝕃}` into `𝕃^A` and is `c_𝕃`-semilinear there, the `ℬ_a` being
conjugate-linear in the row (RowTowerAndRallisIdentities §5.8e) and complex conjugation inducing `c_𝕃` on `σ₀(𝕃)`: `Ψ`
is injective because the test map of the base tuple has the kernel of the descent and `ι_1` is bijective onto `𝔼_0`;
`Ψ∘ι_ξ∘proj = ζ_ξ·(c_tot(1)/c_tot(ξ))·v_ξ` with `ζ_ξ` a root of unity and `v_ξ` the vector of class sums of jets of CM
theta values (both sides are `c_𝕃`-semilinear in the form, `ι_ξ` and `proj` being `𝕃`-linear). *The finite places.* By
(ii), `Ψ(R_0)·𝒪_(𝔭) = Ψ((R_0)_(c_𝕃(𝔭)))`, and `(R_0)_(c_𝕃(𝔭)) = (Λ^{(0)}_{ξ_𝔭})_(c_𝕃(𝔭))` by 7.13 (i) at `c_𝕃(𝔭)`, since
`ξ_{c_𝕃(𝔭)} = ξ_𝔭` (ThetaChainsOnDefiniteUnitaryGroups §2.5); so
`Ψ(R_0)·𝒪_(𝔭) = (c_tot(1)/c_tot(ξ_𝔭))·v_{ξ_𝔭}(M̃_{ξ_𝔭})·𝒪_(𝔭)`, and `a(𝔭) = d_F(𝔭) + Σ_{i,j}v_𝔭(r_{ij}(ξ_𝔭))` (zero outside
the twisted places and the support of `d_F`). Thus the row lattice enters through its localisation at `c_𝕃(𝔭)`, where
it is generated by the forms of the tuple `ξ_𝔭`, while `d_F(𝔭)`, the ratios `r_{ij}(ξ_𝔭)` and every local term of
8.24a–8.24c are read at the place `𝔭` of the lattice of test values: they are valuations at `𝔭` of elements of `𝕃` and
inclusions of `𝒪_𝕃`-submodules of `𝕃^A`, on which the conjugation of the rows does not act. *The embeddings.* `‖Ψ‖_σ`
compares the metric of `R_0` at `σ∘c_𝕃` with that of `M` at `σ`; the terms (2), (3) below bound it embedding by
embedding, with the quotient metric and the eigenvalues `λ_j(1, 𝔥, ·)` at `σ∘c_𝕃`, and `σ ↦ σ∘c_𝕃` permutes the
embeddings, so their means are the means over all embeddings. Five terms: (1) `μ_max(M)`, where `M` is the dual, for the invariant Hermitian metric, of the orthogonal sum over the pairs
(coset datum `𝐜`, class `κ ∈ Cl⁺ = U(X⁺)(F)\U(X⁺)(𝔸_f)/K⁺`) of the Weyl lattices of highest weight `Λ⁺` of the class lattices of `X⁺`
(RowTowerAndRallisIdentities §5.8a, RowTowerAndRallisIdentities §5.8e): `μ_max(M) ≤ 4·f·ν·R·log(νR)`, `ν = rank X⁺ = r + 1 + m(s − 1)`, `R ≥ 1` a bound for the spread of `Λ⁺` at every real
place, independently of the number of pairs (IntegralWeylModulesOfGeneralLinearGroups §3.3); (2) the archimedean height of the
test map `v_1` of the base tuple (`c_𝕃`-semilinear in the form; from the quotient metric at `σ∘c_𝕃` to the metric of `M` at
`σ`), at most `C·m·(f·N·b·log b + m·N²·σ_G)` with `N = k + m(t + s + 1)` and
`σ_G = Σ_{v∈S_□} d(v)·log N v` (`𝔪_□ = ∏_{v∈S_□} w(v)^{d(v)}`, `d(v_□) = d_□` the depth of RowTowerAndRallisIdentities §5.8a): a sum of size terms among which the
number of coset data, `N(𝔪_□)^{Σ_{i<m}(r+is)(r+(i+1)s)} ≤ exp(2m·N²·σ_G)` (each factor is `#(Hom(Λ_{i+1,0}, Λ_{i,0})/𝔪_□·Hom) ≤ N(𝔪_□)^{N²}` and
`N(𝔪_□) ≤ e^{2σ_G}`), and the number of classes, `#Cl⁺ ≤ h(ν)·N(𝔪_□)^{ν²}` (`h(ν)` a class-number bound at full level times the
index of `K⁺`), both at most `exp(m·a₁)`, `a₁ = C·f·N·b·log b + C·m·N²·σ_G`; with `d_□·log N(v_□)` of the size that RowTowerAndRallisIdentities §5.8a fixes, this
is at most `x^C·b` (`log b = x^ε`); (3) `−mean_σ min_𝔥 Σ_j log λ_j(1, 𝔥, σ) ≤ C·f·m·N_m²·log b` by 8.8 (b), since `ι_1` multiplies
squared norms by `𝔫∏_jλ_j` on each part and the parts are orthogonal, at every embedding (the bound is used at `σ∘c_𝕃`,
and its mean over `σ` is the mean over all embeddings); (4) `2Σϱ(𝔭)d_F(𝔭)`, the denominators of the test
values (integers `d_F(𝔭)` with `v_{ξ_𝔭}(M̃_{ξ_𝔭})·𝒪_(𝔭) ⊂ 𝔭^{−d_F(𝔭)}M_(𝔭)`, `M̃_{ξ_𝔭}` the integral forms of the tuple used at `𝔭`,
`v_ξ` the vector of class sums of jets of CM theta
values; `d_F = 0` outside a finite set), chosen by 8.24c (i) with `2Σ_𝔭ϱ(𝔭)d_F(𝔭) ≤ C·f·m²·N²·(log b + σ_G)·b`, at most `x^C·b`
as in (2); (5) `2Σ_𝔭ϱ(𝔭)Σ_{i,j}v_𝔭(r_{ij}(ξ_𝔭))`, bounded by 8.24a (d) summed with the weights `ϱ(𝔭)` over the at most `m²`
squares: the product formula bounds `Σ_𝔭ϱ(𝔭)|v_𝔭(x)|` for the bottom norms by their archimedean sizes plus the denominators (for
a nonzero `x` with `v_𝔭(x) ≥ −3d_l(𝔭)` at every `𝔭`: `Σ_𝔭ϱ(𝔭)|v_𝔭(x)| ≤ mean_σ log⁺|σ(x)| + 6Σ_𝔭ϱ(𝔭)d_l(𝔭)`), and 8.24b (ii), (iii),
applied with the parameters of 8.24c (iii) (`L = log b`; `|(L′/L)(1, χ_K)| ≤ x^ε = L` is part of `SizeQD`), bound both by
`C·f²·N²·b·log b`; 8.24c (ii) bounds the sums of the gauges and of the denominator exponents of each of the `h_sq` values of a
square by `C·f·b·(log b + log x)`; `Σ_ℓ log ℓ/ℓ² < 1` bounds the twist terms, and the step quotients add at most
`2m·Σ_𝔮c(𝔮)·log N𝔮`. Each is at most `x^C·b`. (b) Insert (a), `δ_G = 8fr/min(g₀, g₁)` of 8.21 (c) and `log|G₀| ≤ C·f·r²·log g₁` into 8.21 (a)–(b)
and 8.20b (last clause); every added term is at most `C·m·(B₀ + N_c)·x^{e_D ε}` (the passage term is `≤ 1 + C·log|G₀|` because
`δ_G·x^C·b` is tiny when `min(g₀, g₁) ≥ (kb)^{A_g}`).

*NEW* (this application); the principle (a lattice mapping injectively with small height into a lattice of small maximal
slope has small maximal slope) is Bost's (Bost 1996, Prop. 4.3 (1), p. 131). The form for a semilinear map is reduced to it
through the conjugate lattice, as in the route; [FormalProof] works with the complex conjugates of the rows
(RowTowerAndRallisIdentities §5.8e), on which the test map is `𝕃`-linear, and applies the linear slope test to their
lattice, with one place for source and target
(`Formalism/LocalToGlobal/IndefiniteForms/IndefiniteTree/FunctionalLowerBoundOfConditionsNumeric.lean`,
`Formalism.L2.Indef.Tree.functional_lower_bound_of_conditions`). The terms of the route of (a): (1) [FormalProof],
`Formalism/LocalToGlobal/IndefiniteForms/IndefiniteTree/FunctionalLowerBoundOfConditionsNumeric.lean`
(`Formalism.L2.Indef.Tree.LeafMM`),
`Formalism/LocalToGlobal/IndefiniteForms/IndefiniteTree/FunctionalLowerBoundOfConditionsNumeric.lean`
(`Formalism.L2.Indef.Tree.FunData.EMM`); (2) [FormalProof],
`Formalism/LocalToGlobal/IndefiniteForms/IndefiniteTree/FunctionalLowerBoundOfConditionsNumeric.lean`
(`Formalism.L2.Indef.Tree.LeafIP`),
`Formalism/LocalToGlobal/IndefiniteForms/IndefiniteTree/FunctionalLowerBoundOfConditionsNumeric.lean`
(`Formalism.L2.Indef.Tree.FunData.bIPa`); (3) follows from [FormalProof],
`Formalism/LocalToGlobal/IndefiniteForms/IndefiniteTree/FunctionalLowerBoundOfConditionsNumeric.lean`
(`Formalism.L2.Indef.Tree.LeafIP`),
`Formalism/LocalToGlobal/IndefiniteForms/IndefiniteTree/FunctionalLowerBoundOfConditionsNumeric.lean`
(`Formalism.L2.Indef.Tree.FunData.bIP`); (4) [FormalProof],
`Formalism/LocalToGlobal/IndefiniteForms/IndefiniteTree/FunctionalLowerBoundOfConditionsNumeric.lean`
(`Formalism.L2.Indef.Tree.LeafFP`),
`Formalism/LocalToGlobal/IndefiniteForms/IndefiniteTree/FunctionalLowerBoundOfConditionsNumeric.lean`
(`Formalism.L2.Indef.Tree.FunData.bFP`); (5) [FormalProof],
`Formalism/LocalToGlobal/IndefiniteForms/IndefiniteTree/FunctionalLowerBoundOfConditionsNumeric.lean`
(`Formalism.L2.Indef.Tree.LeafINT`).
*Needs:* RowTowerAndRallisIdentities §5.8, RowTowerAndRallisIdentities §5.8b, RowTowerAndRallisIdentities §5.8d, RowTowerAndRallisIdentities §5.8e, RowTowerAndRallisIdentities §5.10, RowTowerAndRallisIdentities §5.11, RowTowerAndRallisIdentities §5.12, CongruenceModulesOfThetaLifts §7.8, CongruenceModulesOfThetaLifts §7.10c, CongruenceModulesOfThetaLifts §7.11, 7.13, 8.8, 8.9, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18c, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18f, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19b, 8.20, 8.21,
8.24a, 8.24b, 8.24c, ThetaChainsOnDefiniteUnitaryGroups §2.1, ThetaChainsOnDefiniteUnitaryGroups §2.5, RowTowerAndRallisIdentities §5.8a; SlopesOfHermitianVectorBundles §§1.3, 2.1, 2.4 (b); IntegralWeylModulesOfGeneralLinearGroups §3.3.

### Examples

- For `m = 1`, `S_0 = S_1 = 𝕃`, `K_1 = id`, `V = Q = 𝒯 = 𝕃²` with the coordinate lines as `Q_1, Q_2` and `ι` multiplying
  squared norms by `1` and `4` on them (`κ = 1`, `λ_1 = 1` and `4`), and `B(1)(ιF) = F_1`: `‖B‖² = 1 = ‖Pt‖²·‖K_1‖²/1`; with `max_π` in place of `min_π` the bound of 8.1 would read
  `‖B‖² ≤ 1/4`, which is false (8.1, Check).
- For one variable, `Th(u) = e^{u²/2}` and the block `ū^{2n}`, the left side of 8.2 (c) is `((2n)!/(2^n n!))²·Ω^{−2n} ∼ 2(2n/e)^{2n}Ω^{−2n}`
  and the right side `e(4n + 2)²(2n/e)^{2n}Ω^{−2n}`: the factor `exp(ph(2n))` is attained (8.2, Check).
- For `E = K` there is no transport term: `𝔡_{E/K} = 𝒪_K` and `log Ω = log Ω_K` (8.5c, Check).
- For `n = 0`, `λ = (a)` at one place, `br` takes the coefficient of `z^a` and multiplies it by `t^{−a}`, and its squared norm
  is `β·(|t|²g)^{−a} = β·T_br^{−a}` (8.7, Check).
- `ph` is not monotone on `[0, 1]`: `ph(0) = 0 > ph(1) = −1`, which is why 8.10 (c) compares through `log ν!` (8.10, Check).
- For `g = 13`, `T = 3`, `DF(w_L) = 1`, `(D⁺, D⁻) = (3, 2)`, `e_𝔩 = 12`, `e₁ = 2`: `E = 78` and `E/e_v = 13/4 ≤ T + 13/24` (8.20a, Check).
- For `(𝒪_𝕃, c·|·|)` and `e = 1` the Gram determinant is `c²` at every embedding and `−μ = 2 log c` (8.21, Check).
- With no twist every ratio of square constants is `1`, and 8.24a (d) holds trivially (8.24a, Check).

### Dependencies

Layer 7 (7.13, 7.14). FrobeniusRestrictedRieszSums §§0.1, 0.3, 0.4; ThetaChainsOnDefiniteUnitaryGroups §§2.1, 2.2, 2.3, 2.3b, 2.4,
2.5, 2.6, 2.7, 2.8, 2.9, 2.9a, 2.9b, 3.1, 3.1a, 3.1c, 3.1d, 3.2, 3.4, 3.6, 3.8, 3.9; TaylorBoundsAndDepthsOnHeightTwoFormalGroups §§4.8b,
4.8b′, 4.8c, 4.18, 4.19d, 4.19e, 4.19f; LocalGainOfThetaChains §§4.9e, 4.9f, 4.16; RowTowerAndRallisIdentities §§5.1, 5.3, 5.4, 5.7,
5.8, 5.8a, 5.8b, 5.8d, 5.8e, 5.9, 5.10, 5.10a, 5.11, 5.12; SeesawForThetaChains §§6.1, 6.5, 6.8, 6.14, 6.15; CongruenceModulesOfThetaLifts
§§7.1, 7.5a, 7.5b, 7.8, 7.8a, 7.10a, 7.10c, 7.11, 7.15, 7.16a; ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §§8.5, 8.17a, 8.18a, 8.18b, 8.18c, 8.18f, 8.19,
8.19a, 8.19a′, 8.19a″, 8.19a‴, 8.19b, 8.19c, 8.19d; HermitianFormsAndLattices §§4.0a, 5.5, 6.3; SlopesOfHermitianVectorBundles
§§1.2, 1.2a, 1.3, 1.7, 2.1, 2.2, 2.4, 3.5; HodgeTateLatticesAndLubinTateLogarithms §§0.5e, 0.5f; SelmerLengthBoundsAndLocalLifting
§§3.24, 3.25b, 3.26; IntegralWeylModulesOfGeneralLinearGroups §§1.1, 3.1, 3.3; FiniteReductiveGroups §§2.7, 2.8;
DiscreteSeriesCoefficientsAndAutomorphicMetrics §§7.5a, 7.5b, 8.3; ThetaLiftsForDefiniteUnitaryGroups §6.12;
AutomorphicFormsOnReductiveGroups §§7.4–7.6; ClassicalGroups §§5.1, 6.1; SchurWeyl Layer 5; SpecialFunctionsTheta Layer 7;
AnalyticNumberTheoryPartI §2.3a; ArakelovGeometryAndAbelianHeights §§1.1, 1.3, 1.6; AutomorphicGaloisRepresentationsPartII
(Conventions; Layer AG2.0); MathematicalStatisticsHighDimensional §1.4; ReductiveGroups §10B;
Mathlib's Gaussian integrals, power series of entire functions and volumes of balls (8.2, 8.3); Tau Ceti's sub-mean-value
inequality for functions with nonnegative Laplacian (8.3).

## Downstream consumers

ThetaChainsAndFrobeniusPrimeSums consumes this roadmap as follows. The bounds for the divided source lattices
(ThetaChainsAndFrobeniusPrimeSums §9.2) and the slope inequality of the chain (ThetaChainsAndFrobeniusPrimeSums §9.6) are
formed on the divided sources `N′_u` and the glued target `R` of 7.13, with the integrality 7.14 of the maps
`B_u : N′_u → R^∨`, their heights 8.9 (through the top term of 8.7), the slope of the target 8.21, the cost of the type
primes 8.23 and the maximal slope 8.24. Chain data and their parameters (ThetaChainsAndFrobeniusPrimeSums §§10.0, 10.4,
10.6–10.9) carry the hypotheses of 7.13, 7.14, 8.19e, 8.20, 8.20b and 8.21–8.24 and use the division inequality 8.22.
ThetaChainsAndFrobeniusPrimeSums §10.0 (D4) puts the conditions (T1), (T2) and (T3) on the twisting datum into chain data,
and ThetaChainsAndFrobeniusPrimeSums §§10.7 (b), 10.9 (c), (d) verify them together with the good twisting datum and the
wild-kernel budget. ThetaChainsAndFrobeniusPrimeSums §10.6 fixes the order of the constants and the numbers `A_n`, `J` and
`c_H` that the size predicates take as arguments, and ThetaChainsAndFrobeniusPrimeSums §10.6d checks at the parameters of
the chain the facts on the own primes that 8.20 uses (prime to `Q·q·d`, `log p_δ, log p′_δ ≤ L`) and the size conditions on
the weights of a run.

## Scope and ownership

This sub-roadmap of [RiemannHypothesisForDirichletLFunctions](../README.md) is independently definitive.

This roadmap owns: integrality after division for a pairing linear in one variable and semilinear in the other (7.12); for
the chain of theta lifts, the divided source, the glued target and its lattice of semilinear functionals, and the
integrality of the period pairing (7.13, 7.14); the height of a map that factors through a chain of operators, Taylor
blocks in the Fock model, pointwise bounds for theta functions with Gaussian growth, the norms and heights of the step
operators with the transported mean CM period, the scaled branching map and the top period, the lower bound for the Rallis
eigenvalues by hook products, the explicit height of the period pairing and the comparison of Stirling terms with hook
products (8.1–8.10); the theta conditions of the twist selection as polynomial conditions of the second kind, with the index
statement for twisted theta lattices (8.19e); the local terms of the glued target, the depth table and the indices at the
twisted places (8.20, 8.20a, 8.20b); the slope of the target with the passage from the base level to the level of the rows
(8.21); the division inequality and the cost of the type primes (8.22, 8.23); the valuations of the ratios of square
constants, the integrality and the archimedean size of the bottom norms, the denominators of the test values and the sums of
the gauges (8.24a, 8.24b, 8.24c), the jets of torsion translates of the CM theta function and the conjugates of the
coordinates of the bottom pairs (8.24d, 8.24e), and the maximal slope of the target (8.24).

Not owned here. The chain data, the column and row spaces, words, characters, the coefficient fields, the levels and the
forms of the chain are ThetaChainsOnDefiniteUnitaryGroups Layers 2–3; the gain exponents, the bulk and cost of a step and the
gain sublattice are LocalGainOfThetaChains §§4.9e, 4.9f, 4.16; Taylor bounds, depths and integral charts are
TaylorBoundsAndDepthsOnHeightTwoFormalGroups §§4.8b, 4.8b′, 4.8c, 4.18, 4.19d–4.19f; the rows, the descent, the model lifts, their Rallis eigenvalues
and the rational structure of the grid with its determinant identities are RowTowerAndRallisIdentities §§5.1, 5.3–5.12;
the period pairing and its seesaw are SeesawForThetaChains §§6.1, 6.14, 6.15; the congruence lengths, the twist
selection, the good twisting datum and the wild-kernel budget are CongruenceModulesOfThetaLifts §§7.1, 7.5a, 7.5b, 7.8, 7.10a, 7.11, 7.15, 7.16a; the CM periods,
toric sums, the step lattices on the unitary Shimura varieties and the generation of integral forms by theta series are
ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §§8.5, 8.11–8.19d. The Fischer norm of a product of minors (the hook-product
identity) and integral branching are IntegralWeylModulesOfGeneralLinearGroups §§3.1, 1.1; slopes, heights and the gluing lemma are
SlopesOfHermitianVectorBundles Layers 1–2; lattices from local data are HermitianFormsAndLattices §4.0; the
multiplicities of the Bessel-type characters are FiniteReductiveGroups §§2.7, 2.8.

## Exact supplier contracts

### From Mathlib

- Dedekind domains, the valuations at their maximal ideals and fractional ideals (`IsDedekindDomain`,
  `IsDedekindDomain.HeightOneSpectrum`, `FractionalIdeal`, `FractionalIdeal.count`), rings of integers of number fields
  (`NumberField.RingOfIntegers`). Used in 7.12.
- Gaussian integrals on `ℂ^n`, power series of entire functions and dominated convergence. Used in 8.2.
- Volumes of balls. Used in 8.3.

### From Tau Ceti

- `TauCeti.le_setAverage_ball_of_laplacian_nonneg` (`TauCeti/Analysis/InnerProductSpace/Harmonic/MeanValue/Basic.lean`): on a
  finite-dimensional real inner product space with an additive Haar measure, a real function that is `C²` on an open ball,
  continuous on its closure and of nonnegative Laplacian on the ball is at most, at the centre, its average over the ball.
  Used in 8.3, for `|G|²` with `G` holomorphic on `ℂ^g`.

### From TauCetiRoadmap.AnalyticNumberTheoryPartI

- §2.3a (the continuation and functional equation of Hecke `L`-functions, algebraic characters included). Used in 8.24a.

### From TauCetiRoadmap.ArakelovGeometryAndAbelianHeights

- §§1.1, 1.3, 1.6 (Hermitian vector bundles over a ring of integers, the Arakelov degree and slope, the degree under finite
  extension). Used in the Conventions.

### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups

- §§7.4–7.6: algebraic modular forms in Gross's models and composition of class-set operators. Used in 8.7.

### From TauCetiRoadmap.AutomorphicGaloisRepresentationsPartII

- Conventions and Layer AG2.0 (Artin reciprocity sending uniformisers to geometric Frobenius elements, the `ℓ`-adic character
  `r_{l,ι}(χ)` of an algebraic Hecke character and its Hodge–Tate numbers). Used in the Conventions, through 8.19e.

### From TauCetiRoadmap.ClassicalGroups

- §5.1 (the Weyl dimension formula) and §6.1 (branching `GL_n ↓ GL_{n−1}`, Gelfand–Tsetlin). Used in 8.7.

### From TauCetiRoadmap.MathematicalStatisticsHighDimensional

- §1.4 (the Schur test and entrywise domination for matrix norms). Used in 8.4.

### From TauCetiRoadmap.ReductiveGroups

- §10B (the integral Weyl and induced lattices and the contravariant duality between them). Used in the Conventions, 7.14, 8.20.

### From TauCetiRoadmap.SchurWeyl

- Layer 5 (hook lengths). Used in 8.10.

### From TauCetiRoadmap.SpecialFunctionsTheta

- Layer 7 (Riemann theta functions and their quasi-periodicity). Used in 8.3.

### From FrobeniusRestrictedRieszSums, a sub-roadmap of this family

- 0.1, 0.3, 0.4: the host, its predicates `SplitRamification d` and `HostSplitting E`, the cyclic hosts and the auxiliary pair.
  Used in 8.20, 8.20b, 8.23.
- 0.4 (g): a prime `p` unramified in `E` at which `c·Frob_p` has odd order satisfies `p ≡ ±1 (mod 2^{n+2})`. Used in 8.23.

### From ThetaChainsOnDefiniteUnitaryGroups, a sub-roadmap of this family

- 2.1 (the size conditions), 2.2 (the spaces of the chain), 2.3, 2.3b (words, weights and the cloud), 2.4 (characters and the
  auxiliary primes), 2.5 (the twisting datum and the tuples `ξ_𝔭`), 2.6 (the fields `𝕂 ⊂ 𝕃`; (a) (ii) for the own primes), 2.7
  (the type primes and `SizeG`), 2.8 (the level primes and `SizeT_u`), 2.9, 2.9a, 2.9b (the levels). Used in 7.13, 7.14, 8.4–8.10, 8.19e,
  8.20–8.24a.
- 3.1, 3.1a, 3.1d (forms of the chain, CM abelian varieties and their theta functions), 3.2, 3.4 (the step operators and their
  weights), 3.6 (stabiliser orders), 3.8 (the source lattices and their metrics), 3.9, 3.10 (the top period and its
  integrality). Used in 7.13, 7.14, 8.4–8.7, 8.9, 8.10, 8.23.
- 3.1c (the reduced theta function of `ℂ/Λ_K` and its integrality), with 2.2 (`𝔞₀`) and 3.1a (`Λ_K`). Used in 8.24d.

### From TaylorBoundsAndDepthsOnHeightTwoFormalGroups, a sub-roadmap of this family

- 4.8b, 4.8b′, 4.8c (depths, integral charts, the unramified Hodge–Tate colength bound), 4.18, 4.19d, 4.19e, 4.19f (product form,
  row data and the depth clauses). Used in 8.20, 8.20a.

### From LocalGainOfThetaChains, a sub-roadmap of this family

- 4.9e, 4.9f (the ledger of a step: gain, bulk `F_j`, cost `E_{u,j}`, the diagrams `a^±_{j,τ}` and the net exponent `𝔊_u`), 4.10,
  4.10a (the gain of a step and the chain at the type primes, whose hypotheses 4.16 (ii) carries), 4.16, 4.16b (the valuation bound for the period and the gain sublattice `N_u`). Used in 7.13, 7.14, 8.6–8.8, 8.10, 8.20–8.23.

### From RowTowerAndRallisIdentities, a sub-roadmap of this family

- 5.1, 5.3, 5.4 (Petersson forms, the rows and their parts, the good descent `ι_ξ`), 5.5, 5.6, 5.7 (the model lifts and their
  Rallis eigenvalues), 5.8, 5.8a, 5.8b, 5.8d, 5.8e (the rational structure `𝔼_{1,𝕃}`, the grid, its square constants and the size
  predicate `Size_□` with its scale `x₀`, and the thresholds `C_F⁰`, `x_F` and the gap hypotheses of 5.8), 5.9 (multiplicity
  comparison), 5.10, 5.10a, 5.11, 5.12 (the descent constant `𝔫`, the rational structure of the model forms, the rational
  model lifts and the determinant identities). Used in 7.13, 7.14, 8.8, 8.9, 8.19e, 8.20–8.24a.
- 5.8d (the bottom pairs of the squares: their classes with representatives and stabiliser orders, their coordinates (class sums of
  jets of CM theta values) and their bottom norms). Used in 8.24a, 8.24b, 8.24e.

### From SeesawForThetaChains, a sub-roadmap of this family

- 6.1, 6.14, 6.15 (the period pairing `B_u`, its seesaw identity and its semilinearity), 6.5, 6.8 (the admissible finite data).
  Used in 7.13, 7.14, 8.6, 8.9; 6.14 and 6.15 under the hypotheses of 6.14 (among them that the Bessel–Poincaré series of
  every word `u` is nonzero on its new forms `M_u`), which 7.13, 7.14 and 8.9 carry.

### From CongruenceModulesOfThetaLifts, a sub-roadmap of this family

- 7.1 (4) (the congruence lengths of a level part), 7.5a, 7.5b (lifted eigensystems and the lifted subspace, with its level parts), 7.8
  (twist selection and good twists), 7.8a (`d^{Z,P_0}_j = D_0`), 7.10a (the good twisting datum), 7.10c (the length bound of the
  thick set; the sum at a level), 7.11 (the wild-kernel budget and the congruence bound, at the base level), 7.15 (the forms, lattices and lifted subspace of the projected lattice, the argument
  of its dual index bound, the Weyl exponent, the Minkowski number; (c′), the bound for the part cut by a level, at the base
  level), 7.16a (the bound for the Weyl exponents). Used in 8.19e, 8.20, 8.20b, 8.21, 8.22, 8.24a, 8.24.

### From ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, a sub-roadmap of this family

- 8.5 (the Chowla–Selberg statement for the mean period). Used in 8.5c.
- 8.17a (the cusp forms of a weight in the stable range are spanned by theta series). Used in 8.20b.
- 8.18a, 8.18b, 8.19, 8.19a, 8.19a′, 8.19a″, 8.19a‴ (the step lattices `M^W_j`, their slope bound, the generation of integral
  forms by theta series and the depth of the theta lattices). Used in 8.20–8.22, 8.24; 8.19a (its integral structure) also
  in 8.19e (c).
- 8.18c (e), (f), 8.18f (c): the number `q_z` and the hypotheses (H1)–(H3) of 8.19 (b), and the gap conditions of the deep
  covers of the steps with their witnesses. Used in 8.22, 8.24.
- 8.19b, 8.19c, 8.19d (denominators of CM values, toric ratios and twisted theta values). Used in 8.19e, 8.24a, 8.24.

### From HermitianFormsAndLattices, a sub-roadmap of this family

- 4.0 (g): lattices from local data in module form. Used in 7.13.
- 4.0a (b), (c): projection and intersection are dual; the dual index of a projected lattice. Used in 8.20.
- 5.5, 6.3 (masses and the closed mass formula). Used in 8.6, 8.8.

### From SlopesOfHermitianVectorBundles, a sub-roadmap of this family

- 1.2, 1.3, 1.7: slopes, heights of maps (finite and archimedean parts), duals. Used in 8.1, 8.21, 8.24.
- 1.2a (iii): the gluing lemma, for a number field with an involution, an embedding `σ₀` with `σ₀(x^*) = conj(σ₀(x))`, a
  `*`-stable subfield on which every embedding commutes with the involution, and bases local at the pairs `{𝔭, 𝔭*}`. Used in 8.21.
- 2.1, 2.2: maximal and minimal slopes, their shift by a fractional ideal, duality, direct sums. Used in 7.13, 8.21, 8.24.
- 2.4 (b): Bost's slope inequality with its finite-place bound. Used in 8.21, 8.24.
- 3.5: base change changes neither the slopes nor the maximal slope. Used in the Conventions.

### From HodgeTateLatticesAndLubinTateLogarithms, a sub-roadmap of this family

- 0.5e (the colength bound at a place disjoint from its conjugate, with constant ranks at `w` and `w̄`), 0.5f (the cokernel
  bound in chart form). Used in 8.20a.

### From SelmerLengthBoundsAndLocalLifting, a sub-roadmap of this family

- 3.24 (families of places in position), 3.25b (2) (polynomials of the second kind), 3.26 (twist selection in the coset form).
  Used in 8.19e.

### From IntegralWeylModulesOfGeneralLinearGroups, a sub-roadmap of this family

- 1.1: integral branching `GL_N ↓ GL_{N−1}` with the integer `c_Br` and `br∘io = c_Br²·⟨ξ, ξ⟩·id`, `⟨ξ, ξ⟩ ≤ dim V_λ`. Used in 8.7.
- 3.1: the Fischer norm of a product of leading minors is the hook product. Used in 8.8, 8.10.
- 3.3: the maximal slope of the dual of an orthogonal sum of Weyl lattices of self-dual Hermitian lattices. Used in 8.24.

### From FiniteReductiveGroups, a sub-roadmap of this family

- 2.7 (b), 2.8 (a)–(c): the Bessel-type pairs and the multiplicities of their characters in Harish-Chandra induced cuspidal
  representations, over several fields. Used in 8.21.

### From DiscreteSeriesCoefficientsAndAutomorphicMetrics, a sub-roadmap of this family

- 7.5a, 7.5b: class-set integration, the perfect pairing of class-sum lattices and kernel operators between class sets. Used in
  8.7, 8.20.
- 8.3: the formal degree of a discrete series. Used in 8.8.

### From ThetaLiftsForDefiniteUnitaryGroups, a sub-roadmap of this family

- 6.12: the tower recursion of the constants, with one constant for every set `T ⊆ P` inside a fixed finite set `P` of split
  places and one place `v₁` fixed outside `P`, through RowTowerAndRallisIdentities §5.8d. Used in 8.24a.

## References

- [FormalProof] Levent Alpöge, the Lean formalization of the Riemann hypothesis and of the Riemann hypothesis for Dirichlet L-functions announced in [Announcement]; source with a public verification setup: <https://github.com/leanprover-community/riemann-hypothesis>.
- [Announcement] Levent Alpöge, the announcement of that proof, 20 November 2026: <https://alpo.ge/remark.pdf>.
- V. Bargmann, *On a Hilbert space of analytic functions and an associated integral transform*, Comm. Pure Appl. Math. 14
  (1961): 8.2.
- L. Kronecker; M. Lerch, *Sur quelques formules relatives au nombre des classes*, Bull. Sci. Math. 21 (1897); S. Chowla and
  A. Selberg, *On Epstein's zeta-function*, J. reine angew. Math. 227 (1967): the CM period of the Conventions, 8.5c.
- J. S. Frame, G. de B. Robinson and R. M. Thrall, *The hook graphs of the symmetric group*, Canad. J. Math. 6 (1954): 8.10.
- D. P. Zhelobenko; I. M. Gelfand and M. L. Tsetlin: 8.7.
- J.-B. Bost, *Périodes et isogénies des variétés abéliennes sur les corps de nombres*, Séminaire Bourbaki exp. 795,
  Astérisque 237 (1996), 115–161: App. A.2, pp. 146–147 (the normalised degree and slope, Conventions); Prop. 4.3 (1),
  p. 131 (the slope inequality for a map that is injective on the generic fibres, 8.24).
- É. Gaudron and G. Rémond, *Théorème des périodes et degrés minimaux d'isogénies*, Comment. Math. Helv. 89 (2014); in the
  version read (HAL hal-00590958v1, 2011), §3.2, Lemme 3.9 and its proof: the slope inequality for a map whose norms at
  the finite places are at most `1`, 8.24.
