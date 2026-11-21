# Roadmap: theta chains and Frobenius prime sums

**Summary.** This roadmap is the last stage of the chain of theta lifts by which the family
[RiemannHypothesisForDirichletLFunctions](../README.md) proves the Riemann hypothesis for Dirichlet L-functions. For a
primitive Dirichlet character `ψ` and a scale `x`, the earlier roadmaps of the chain build an abelian CM field `E` (the
host) with an imaginary quadratic subfield `K`, a set of tops `Φ_top` and a translate `u₀`; a chain of theta lifts of
length `m` between definite unitary groups over the maximal totally real subfield of `E`; lattices of algebraic automorphic
forms divided by the local gains at the primes inert in `K`; and a target lattice glued place by place, with a period
pairing from each divided source into its dual. This roadmap compares their slopes, turns the comparison into an
inequality for prime sums restricted by a Frobenius condition, and turns that inequality into window bounds for the Riesz
remainders of the characters of the cyclic family of `ψ`.

The headline theorems are these. (1) *The windowed bound.* For every primitive Dirichlet character `ψ` and every `ε > 0`
there are positive weights `w(χ)` on the cyclic family `𝒦(ψ)`, the primitive characters inducing the powers of `ψ`, and
`λ > 1` such that the set of `y` with `Σ_{χ∈𝒦(ψ)} w(χ)·Re G_χ(y) ≤ y^{1/2+ε}` contains intervals `[Y, Y^λ]` with `Y`
arbitrarily large, `G_χ` the Riesz remainder of `χ`. In its uniform form, the weights `w_ψ(1) = 1` and
`w_ψ(χ) = 1/(3o + 1)` for the other members (`o` the order of `ψ`) give the bound `y^{1/2+9ε}` for every small `ε`, on
intervals `[Y, Y^{3/2}]` (10.10, 10.11). (2) *The Frobenius-restricted inequality.* For chain data of length `m` at a
large scale `(x, ε)` satisfying the standing hypotheses (10.0), the sum over the tops `τ` and the steps `j` of the
Frobenius-restricted Riesz sums `ℛ(a_τ, τ, w_{u₀,j})` exceeds the sum of their main terms `𝔐(a_τ, w_{u₀,j})` by at most
`x^{3ε}·(|Φ_top|·a·(1 + m²/k) + m·(B₀ + N_c))` (10.4, 10.5); the exponent `3` is the arithmetic of 10.5 with the per-lift
exponent `e_D = 1`, and any exponent up to `5` serves 10.10; averaged over the translates, this has the strength of the
generalized Riemann hypothesis for the cyclic family at the scale `x`.
(3) *The slope inequality of the chain.* Under the
Gram bounds for the Bessel–Poincaré series of the words of a word code, which make them a nearly tight frame at one
archimedean place, and under the integrality and height bounds of the pairings `B_u : N′_u → R^∨`, when
`x^{−c_H} ≤ 1/20`, `η_off, η_dim, √e_diag ≤ x^{−c_H}/2` and `ϑ_T ≤ 1/4`, with the frame defects `η_frame = 5x^{−c_H} + 3√ϑ_T`
and `e_frame = 2e_diag`, the weighted mean `s̄` of `μ(N′_u) − h_u` over the words satisfies
`s̄ − (1 − δ_bad)^{−1}·(4u_F·log(1 + H/u_F) + (η_frame + 4√e_frame)·H) ≤ μ(R^∨)` for every `H ≥ max(0, s̄ − μ_min(R^∨))` (9.6).

The roadmap rests on [FrobeniusRestrictedRieszSums](../FrobeniusRestrictedRieszSums/README.md), which supplies the hosts,
the restricted Riesz sums and the passage from the inequality at every translate to the window bound; on the roadmaps of the chain,
from [ThetaChainsOnDefiniteUnitaryGroups](../ThetaChainsOnDefiniteUnitaryGroups/README.md) to
[GluedTargetAndDivisionInequality](../GluedTargetAndDivisionInequality/README.md), which supply the chain with its local
gains, Gram bounds, seesaw, congruence modules and division inequality; on
[SlopesOfHermitianVectorBundles](../SlopesOfHermitianVectorBundles/README.md) for the slope inequality for nearly tight
frames; and on [UniformWildKernelBounds](../UniformWildKernelBounds/README.md) for the windows of scales on which the wild
kernels of the hosts are small. [GeneralizedRiemannHypothesisFromWindowBounds](../GeneralizedRiemannHypothesisFromWindowBounds/README.md)
reads the windowed bound as the generalized Riemann hypothesis for every Dirichlet character.

Layer 9 bounds the slopes of the source lattices and of the divided sources, fixes the level prime by rank matching, builds
the word code and proves the slope inequality of the chain. Layer 10 collects chain data, writes the local gains as
Frobenius-restricted Riesz sums up to a bounded loss, proves the key identity and the Frobenius-restricted inequality with
its error budget, fixes explicit parameters and checks every size condition at every large scale, constructs hosts on
windows, proves that the chain does not vanish, builds chain data at every scale of the windows and concludes the windowed
bound.

## Conventions

**Fields.** `E` is the host (FrobeniusRestrictedRieszSums §0.1): finite abelian over `ℚ` with an imaginary quadratic subfield `K`; `F = E⁺` its
maximal totally real subfield, `f = [F:ℚ]`; `c ∈ G` complex conjugation; `χ_K` the quadratic character of `K`; `f_E` the
conductor of `E` (the conductor of a primitive character `χ` is `f_χ`); `h_E` the class number of `E` and `μ_E` its
group of roots of unity. Under `SplitRamification d` (FrobeniusRestrictedRieszSums §0.3) `K` is ramified only at the prime `d`; on the cyclic hosts
(FrobeniusRestrictedRieszSums §0.4) `q ≡ 3 (mod 8)`, `d ≡ 7 (mod 16)`, the layer `n ≥ 2`, `K = ℚ(√−d)`, and a second
imaginary quadratic field `ℚ(√−q) ⊂ E` is used; `(q, d)` is the
*auxiliary pair*. The degree: the hosts of chain data satisfy `HostSplitting E` (FrobeniusRestrictedRieszSums §0.3; 10.0 (H2)), which contains
`4 | f`, so `f ≥ 4`; the targets of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties and GluedTargetAndDivisionInequality that use Koecher's principle on the unitary Shimura varieties over `F`
ask `f ≥ 2`, and ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18f (d),
ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19 (b) and GluedTargetAndDivisionInequality §8.22 ask `[F:ℚ] ≥ 3`, which this gives without a further hypothesis (the size conditions of ThetaChainsOnDefiniteUnitaryGroups §2.1 give much more,
`f = 2|A| ≥ 2x^{A_n}`). `𝕂 ⊂ 𝕃` are the two fields of ThetaChainsOnDefiniteUnitaryGroups §2.6: the coefficient field `𝕂`, a number field
containing `E`, defined there as an explicit subfield of a compositum of class fields and Kummer extensions, which does not
depend on the word, and the field of places `𝕃`, a finite Galois extension of `ℚ` inside `ℂ`, stable under complex
conjugation, containing `𝕂` and the finitely many algebraic numbers that later targets name, on which no bound is asserted or
used; `σ₀` is the inclusion and `c_𝕃` the restriction of complex conjugation. The Hermitian lattices of the chain and the
places `𝔭` are over `𝒪_𝕃`; the lattices of forms on the Shimura varieties of the steps are over `𝒪_𝕂` and enter the chain
after extension of scalars to `𝒪_𝕃`. The finite places of `𝕃` are written `𝔭`, with residue characteristic `p(𝔭)`,
ramification index `e_𝔭` and weight `ϱ(𝔭) = log N𝔭/[𝕃:ℚ]` (so `Σ_{𝔭|p} ϱ(𝔭)e_𝔭 = log p`); `sz_𝔭(y) = 2ϱ(𝔭)e_𝔭·y`.
Embeddings `𝕃 ↪ ℂ` are written `σ`.

**CM type, places and Frobenius elements.** An embedding `ι₀ : E ↪ ℂ` is fixed; `Φ = Gal(E/K)` is identified with the CM
type `{ι₀∘g : g ∈ Φ}` induced from `K` (`|Φ| = f`). Elements of `Φ` are called places. In the Galois groups of abelian
fields and for Dirichlet characters Frobenius elements are arithmetic (`Frob_p` acts as
`x ↦ x^p` on residue fields), and at a ramified prime the Frobenius datum is the coset `Fr(p^i)` of the inertia group
(FrobeniusRestrictedRieszSums §0.2); a primitive Dirichlet character `κ` with `ℚ(κ) ⊂ E` is read as the character `χ_κ` of `G` with
`χ_κ(art(a)) = κ(a)`, `art(a) = (ζ ↦ ζ^a)` (FrobeniusRestrictedRieszSums §0.2), so that `κ(p) = χ_κ(Frob_p)` at unramified `p`. On a cyclic host
`G = A × ⟨c⟩ × ⟨σ_d⟩` (FrobeniusRestrictedRieszSums §0.4 (iv)), and an element `g ∈ G`, read through its place `pl(g)` (FrobeniusRestrictedRieszSums §0.6), is a *letter*. When
`K = ℚ(√−d)`, `√−d ∈ K` denotes the root with `Im ι₀(√−d) > 0`, so that `Im τ(√−d) > 0` for every `τ ∈ Φ`.

**Primes of the construction.** The *type primes* `g₀, g₁` (ThetaChainsOnDefiniteUnitaryGroups §2.7) carry the depth-zero types; the *auxiliary primes*
`p_δ, p′_δ` carry the characters `δ, δ′` (ThetaChainsOnDefiniteUnitaryGroups §2.4, ThetaChainsOnDefiniteUnitaryGroups §2.7); the primes `q, d` form the *auxiliary pair* (FrobeniusRestrictedRieszSums §0.4), and are not
called auxiliary primes; the *level prime* `T(u) = N(π_u)` of a word `u` (ThetaChainsOnDefiniteUnitaryGroups §2.8) carries the new forms. The *twist places*
`Q(ξ)` of a tuple `ξ` of twisting characters are its full ramification set (ThetaChainsOnDefiniteUnitaryGroups §2.5). Twisting involves two sets (ThetaChainsOnDefiniteUnitaryGroups §2.5): the
*admissible twisting characteristics* `𝒮_tw`, the primes at which twisting is permitted, and the *twisted places* `Tw`,
a finite `c_𝕃`-stable set of places of `𝕃` above `𝒮_tw`, fixed with the twisting datum (ThetaChainsOnDefiniteUnitaryGroups §2.5), outside which the tuple
`ξ_𝔭` used is the base tuple; sums "over the twisted places" run over `Tw`.

**Hermitian forms, definiteness and measures.** Hermitian forms are conjugate-linear in the first variable (the
convention of HermitianFormsAndLattices and ThetaLiftsForDefiniteUnitaryGroups). Definiteness is that of
HermitianFormsAndLattices: a space is *definite at* a real place if its form has one sign there, *totally definite* if
it is definite at every real place (the sign may depend on the place), and *totally positive definite* if every sign is
`+`; a *definite unitary group* is the unitary group of a totally definite space. The column spaces `X_j`, the model
spaces `V_j` and the hyperplane `X^h ⊂ X_m` are totally positive definite (ThetaChainsOnDefiniteUnitaryGroups §2.2). On `U(V)(𝔸_f)` the stabiliser of the
chosen self-dual lattice has volume `1`; for totally definite `V`, `∫_{[U(V)]} φ = Σ_𝒸 |Γ_𝒸|^{−1} φ(g_𝒸)` over the
classes `𝒸` (representatives `g_𝒸`, stabilisers `Γ_𝒸`), so the total volume is the mass; for indefinite `V` the
archimedean measure is transferred from the compact inner form, so that `vol([U(Y_0)]) = mass(𝒪_E^r)` (9.4), and formal
degrees are taken for this measure.

**Integral structures.** For a dominant weight `λ`, `∇_ℤ(λ)` is the dual Weyl lattice (the integral polynomials of the
polynomial model of ThetaChainsOnDefiniteUnitaryGroups §3.1, spanned by products of minors) and `Δ_ℤ(λ) ⊂ ∇_ℤ(λ)` the Weyl lattice, its dual for the
invariant form; the product of leading minors `v_λ` lies in both. The column side of the chain (the integral forms
`ℳ_j^{int}` of ThetaChainsOnDefiniteUnitaryGroups §3.1, the chain lift, the source lattices of ThetaChainsOnDefiniteUnitaryGroups §3.8 and their restriction to `U(X^h)`) takes values in `Δ_ℤ`,
in the coordinates of a basis of the dual class lattice; the row forms `Υ` on `U(X^h)` paired with it take values in
`∇_ℤ` (the forms `ℳ^∨`), so that every class term of the pairing is integral and the only loss is the stabiliser
orders (ThetaChainsOnDefiniteUnitaryGroups §3.6, ThetaChainsOnDefiniteUnitaryGroups §3.10). At the top, a class `𝒸` of `U(X^h)` gives the class `𝒸̃` of level `m` with class lattice
`L_𝒸 ⊕ 𝒪_E z_u`, `z_u = π_u e_{N_m}`, and the restriction to `U(X^h)` is integral at every finite place (ThetaChainsOnDefiniteUnitaryGroups §3.9).

**Petersson products.** For algebraic modular forms with values in an algebraic representation `V_λ`:
`⟨φ, φ′⟩ = Σ_𝒸 |Γ_𝒸|^{−1}⟨φ(𝒸), φ′(𝒸)⟩_λ`, with `⟨,⟩_λ` the invariant Hermitian form normalised by `⟨v_λ, v_λ⟩ = 1` on
the product of leading minors `v_λ` of the polynomial model of ThetaChainsOnDefiniteUnitaryGroups §3.1 (it lies in both lattices `Δ_ℤ ⊂ ∇_ℤ`); the chain
forms are functions of frames, and their coefficient module in Gross's model is `V_λ^∨` (ThetaChainsOnDefiniteUnitaryGroups §3.1). For forms on indefinite
groups the Petersson product of RowTowerAndRallisIdentities §5.1 sums over an orthonormal basis of the lowest `K`-type.

**Slopes and heights.** Hermitian lattices are finitely generated `𝒪_𝕃`-submodules of full rank in Hermitian
`𝕃`-spaces with a metric at every complex embedding. This roadmap writes `μ(L̄) := 2μ̂(L̄)`, twice Bost's normalised
slope (`μ̂ = deĝ/([𝕃:ℚ]·rk)`), so `μ(𝒪_𝕃^n, standard) = 0`; `μ_max`, `μ_min` likewise. For a linear map `φ`,
`ht(φ) := (2/[𝕃:ℚ]) Σ_σ log ‖φ‖_σ`, twice Bost's archimedean height, that is the mean over the embeddings of
`log ‖φ‖²_σ` (equivalently over the infinite places, the metrics being compatible with conjugation); integrality at
finite places is stated separately. For a lattice `L` and a basis `e` of `L ⊗ 𝕃`,
`−rk L·μ(L) = mean_σ log det Gram_σ(e) − 2Σ_𝔭 ϱ(𝔭)·idx_𝔭(L : ⟨e⟩)`, `idx_𝔭` the signed length at `𝔭` (no factor `2` on
the mean). With these, `μ(N̄) ≤ μ_max(M̄) + ht(φ)` for `φ` injective and integral, and the targets below are written in
squared norms (`ph(y) = y log y − y`). SlopesOfHermitianVectorBundles uses `μ̂` and `h`; this paragraph is the
dictionary, and its statements are homogeneous in it.

**Wild kernels.** For a number field `M`, a prime `ℓ` and an integer `e ≥ 1`, `Ш¹(M, ℓ, e)` is the group of classes in
`H¹(𝒪_M[1/ℓ], ℚ_ℓ/ℤ_ℓ(−e))` unramified outside `ℓ` and trivial at the places above `ℓ`, and
`V(M, t) = Σ_ℓ log ℓ Σ_{1≤e<t} length Ш¹(M, ℓ, e)`, as in BernoulliBoundsForClassGroupEigenspaces §6.17; the roadmap uses them for `M = E`
([FormalProof], `Development/AutomorphicArithmetic/CharacterBoxes/ExistsPageN.lean` (`UpperTheory.Top.VVle`)).

**The CM period.** `log Ω := γ + log(2π/rd_E) − (L′/L)(1, χ_K)`, `rd_E` the root discriminant of `E`
([FormalProof], `Formalism/RankGapBounds/MeanBoundSecondForm.lean` (`Formalism.RankGapBounds.WeightedMeanData.Data.logOm`), `Formalism/LocalRingCardinality/DataParams₂.lean` (`Formalism.BasicNotions.SizeData₂.logOm`)). Equivalently
`log Ω = log Ω_K − log(rd_E/√d)`, where `log Ω_K = γ + log(2π/√d) − (L′/L)(1, χ_K)` is the mean over the ideal
classes of `K` of `log(area(Λ)/π) + (1/6) log|Δ(Λ)|` (Chowla–Selberg, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.5). The same `Ω` enters the heights of the
lifts (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.5, GluedTargetAndDivisionInequality §8.6) and the arithmetic degree of the flat line bundle (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.11).

**Row spaces.** The row forms on `U(Y_0)` are formed at principal level at the type primes, where the finite group `G₀`
of ThetaChainsOnDefiniteUnitaryGroups §2.9a acts (RowTowerAndRallisIdentities §5.3): `ℋ^♮` denotes the rows at principal level and `𝔼^♮ = Π_good·ℋ^♮` the good ones; `ℋ` and
`𝔼 = Π_good·ℋ` are their parts of the row type level `(P_1, χ_{P_1})` of ThetaChainsOnDefiniteUnitaryGroups §2.9a, on which the Poincaré series, the seesaw
and the target rows live; `𝔼_0` is the part of the base level `(P_0, χ_{P_0})`.

**Bad places.** The Hecke characters `μ_j`, `δ`, `δ′` of the chain are unramified outside the *bad places* `S₀`, the
places above `g₀, g₁, p_δ, p′_δ` (ThetaChainsOnDefiniteUnitaryGroups §2.4 (b)).

**Periods and pairings.** The cost of the level prime `T(u) = N(π_u)` sits at the places above `π_u` and is `0` at those above `π̄_u` (LocalGainOfThetaChains §4.16).
The period pairing `B_u(φ)(x)` of SeesawForThetaChains §6.1 is linear in the column `φ` and conjugate-linear in the row `x ∈ 𝔼` (SeesawForThetaChains §6.14 (d)).

**Routes.** The mathematics of this roadmap follows a complete formal proof ([FormalProof]), the reference of every *NEW*
target. Where a route is not given, or not given in full, the target says so in its route. The good
twisting datum (CongruenceModulesOfThetaLifts §7.10a) and the wild-kernel budget (CongruenceModulesOfThetaLifts §7.11) are conditions on the data, and so are the conditions (T1), (T2)
of ThetaChainsOnDefiniteUnitaryGroups §2.5 and (T3) of GluedTargetAndDivisionInequality §8.20 on the twisting datum (10.0 (D4)); the construction verifies them (10.7 (b), 10.9 (c), (d)).

**Riesz remainders and windows.** `G_χ` is the Riesz remainder of a primitive Dirichlet character (RiemannHypothesisStatementsAndConsequences
§8.4a (b)): `G_χ(y) = Σ_{n≤y} Λ(n)χ(n)(y/n − 1) + y·(L′/L)(1, χ)` for `χ ≠ 1` ([FormalProof], `Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/Analytic.lean` (`Formalism.HC.An.gChi`)), and
`G_1(y) = Σ_{n≤y} Λ(n)(y/n − 1) − y log y + (1+γ)y` for the trivial character; `γ` is Euler's constant.
`HasWindows S λ_W` (PositivityOfDirichletSeriesWithKernels §6.9 (a)), for a set `S` of reals and a window exponent `λ_W > 1`:
for every `Y₀` there is `Y ≥ max(Y₀, 1)` with `[Y, Y^{λ_W}] ⊂ S`.
`Suggested.lean` states 10.10 and 10.11 with the bundle `PrimitiveDirichletCharacter` of a primitive character with its
level, the remainder `PrimitiveDirichletCharacter.rieszRemainder`, the family `PrimitiveDirichletCharacter.cyclicFamily`, the
weights `PrimitiveDirichletCharacter.familyWeight` of 10.10 and the predicate `HasWindows`.

**Quantifier order and sizes.** Constants named before `ε` do not depend on `ε`; the scale `x` and everything chosen at
it come after `ε` (10.6 fixes the order). Between them come the numbers that may depend on `ε`: the layer exponent `A_n`
(`2 + 8ε` in the construction, at most the constant `A_max`), the window constant `J` and the exponent `c_H` of the
slope range, which the size predicates of ThetaChainsOnDefiniteUnitaryGroups §2.1 take as arguments and 10.6 fixes, and the exponent `c_s > 0` of the
inert-free bound of chain data (every prime inert in `K` exceeds `max(12, x^{c_s})`, 10.0 (H2); `c_s = ε/(5J)` in the
construction). The size conditions are named predicates: those of ThetaChainsOnDefiniteUnitaryGroups §2.1, grouped into the host predicates `SizeA`,
`SizeN`, `SizeD`, `SizeRd`, `SizeQD`, `SizeInert`, `SizeDep` and the parameter predicates `SizeM`, `SizeK`, `SizeW`,
`SizeMf`, `SizeT`, `SizeTheta`, with their conjunction `Size(x, ε)`; and those named where their quantities are defined:
`SizeSc` (ThetaChainsOnDefiniteUnitaryGroups §2.3b), `SizeGap`, `SizeSep` (ThetaChainsOnDefiniteUnitaryGroups §2.3c), `SizeG` (ThetaChainsOnDefiniteUnitaryGroups §2.7), `SizeT_u` (ThetaChainsOnDefiniteUnitaryGroups §2.8: `16mx^ε ≤ log T*(u)` and
`log T*(u) + 1 ≤ C_T m x^ε ≤ x`). `SizeDep` uses the set `S_small` and the number `vd` of ThetaChainsOnDefiniteUnitaryGroups §2.1 and a constant `C_dep`
fixed before `ε`. "The size conditions of ThetaChainsOnDefiniteUnitaryGroups §2.1" means `Size(x, ε)`; a target that uses a single predicate names it.

**Constants.** Exponents, window ratios, the shares of the tops, the bound `t ≤ x^{C_t}`, the budgets and the
admissible range of `ε` are parameters with their true constraints. The exponents written in the size predicates of ThetaChainsOnDefiniteUnitaryGroups §2.1
and the values of `δ_top`, of the orbit lengths and of `ε₀` in 10.6 are fixed choices; their constraints are stated in
10.6, which also says which other choices are admissible. The values of one construction (such as `C_t = 401`) appear
only in Checks.

**Table of symbols.**

| Symbol | Meaning | Defined |
|---|---|---|
| `E, F = E⁺, f, c, G, f_E` | host field, its maximal totally real subfield, `[F:ℚ]`, complex conjugation, `Gal(E/ℚ)`, conductor of `E` (of a primitive `χ`: `f_χ`) | FrobeniusRestrictedRieszSums §0.1, FrobeniusRestrictedRieszSums §0.2 |
| `h_E, μ_E` | class number of `E`; group of roots of unity of `E` | Conventions |
| `K, χ_K, d, √−d` | the imaginary quadratic subfield and its character; the prime of `SplitRamification d` (`K = ℚ(√−d)` on the cyclic hosts) and the root with `Im ι₀(√−d) > 0` | FrobeniusRestrictedRieszSums §§0.1–0.3, Conventions |
| `Φ, ι₀, τ` | `Gal(E/K)` and the CM type it defines through `ι₀`; its elements, the places | FrobeniusRestrictedRieszSums §0.1 |
| `Frob_p, Fr(p^i), χ*, χ_κ` | arithmetic Frobenius, Frobenius coset, primitive Dirichlet character of `χ ∈ Ĝ`; the character of `G` with `χ_κ* = κ` (`κ` primitive with `ℚ(κ) ⊂ E`) | FrobeniusRestrictedRieszSums §0.2 |
| `σ_d` | the nontrivial element of the inertia group at `d` | FrobeniusRestrictedRieszSums §0.3 |
| `SplitRamification d, InertFreeUpTo B, HostSplitting E` | host predicates: every ramified prime other than `d` splits in `K` and `I_d = {1, σ_d}`, `σ_d ∉ Φ`; no prime `p ≤ B` is inert in `K`; `4 \| f` and every place of `F` above a prime dividing `f_E` splits in `E` | FrobeniusRestrictedRieszSums §0.3 |
| `ψ, o, f_ψ, 𝒦(ψ)` | primitive Dirichlet character, its order and conductor, its cyclic family (`χ_κ`, `κ ∈ 𝒦(ψ)`, are the kept characters) | FrobeniusRestrictedRieszSums §0.4, FrobeniusRestrictedRieszSums §0.5 |
| `E_n(M, Q), ℚ_n` | dyadic host field; the `n`-th layer of the cyclotomic `ℤ₂`-extension | FrobeniusRestrictedRieszSums §0.4 |
| `(q, d), n` | auxiliary pair (`q ≡ 3 (mod 8)`, `d ≡ 7 (mod 16)`), layer `n ≥ 2` of the cyclotomic `ℤ₂`-tower of a cyclic host | FrobeniusRestrictedRieszSums §0.4 |
| `𝔛_n, χ_{−q}, χ_{−d}, c(ψ)` | even characters of conductor dividing `2^{n+2}`; the characters of `ℚ(√−q)` and `ℚ(√−d)`; the integer `c(ψ) ≤ o` with `\|A\| = c(ψ)·2^n` for `n ≥ n₀(ψ)` | FrobeniusRestrictedRieszSums §0.4 |
| `A, A₀` | `Gal(E/ℚ(√−q, √−d)) ⊂ Φ`; `A₀ = ker(ψ\|_A)`, `[A:A₀] = o` | FrobeniusRestrictedRieszSums §0.4 |
| `par_τ, pl(g)` | partner bijection `G∖Φ → Φ`, `g ↦ cgτ`; the place of a letter `g` (`g` or `cg`) | FrobeniusRestrictedRieszSums §0.6 |
| `Φ_top, 𝒯, δ_th, u₀` | tops `Φ_top ⊂ A`, thick set `𝒯 ⊂ A₀`, `\|𝒯\|/\|A\|`, a translate (thick places `cσ_d u₀𝒯`, thick letters `cσ_d u₀𝒯 ⊔ σ_d u₀𝒯`) | FrobeniusRestrictedRieszSums §0.6, FrobeniusRestrictedRieszSums §0.8a |
| `ν, ω, ω₀, δ_top, η_top` | coset law, coset profile and its lower bound, selection density, precision of the coset law of the tops | FrobeniusRestrictedRieszSums §0.7, FrobeniusRestrictedRieszSums §1.7 |
| `L_th` | length of the thick set (built from a set with no relation of length `L_th`) | FrobeniusRestrictedRieszSums §0.8, FrobeniusRestrictedRieszSums §0.8a, 10.6 |
| `ℛ, 𝔐` | Frobenius-restricted Riesz sum, its main term | FrobeniusRestrictedRieszSums §1.1 |
| `γ` | Euler's constant | Conventions |
| `G_χ, G_1` | Riesz remainders of a primitive `χ ≠ 1` and of the trivial character | Conventions |
| `C_Λ, s_th, ν̂` | Lipschitz constant of the remainders (RieszSumsOverPrimesAndExceptionalZeros §1.4h), thin-scale saving, Fourier coefficients of `ν` | FrobeniusRestrictedRieszSums §1.7, FrobeniusRestrictedRieszSums §1.4, FrobeniusRestrictedRieszSums §1.6 |
| `𝔄, x₁` | averaged sum of the `m` differences, the threshold of FrobeniusRestrictedRieszSums §1.9 | FrobeniusRestrictedRieszSums §1.7, FrobeniusRestrictedRieszSums §1.9 |
| `rd_E, log Ω, log Ω_K` | root discriminant, CM periods of `E` and of `K` | Conventions |
| `μ, μ_max, μ_min, ht, ph` | twice Bost's slopes, twice his archimedean height, `ph(y) = y log y − y` | Conventions |
| `𝔭, p(𝔭), e_𝔭, ϱ(𝔭), sz_𝔭` | finite place of `𝕃`, residue characteristic, ramification index, `log N𝔭/[𝕃:ℚ]`, `sz_𝔭(y) = 2ϱ(𝔭)e_𝔭y` | Conventions |
| `Ш¹(E, ℓ, e), V(E, t)` | twisted Tate–Shafarevich groups, their total length | Conventions |
| `k, m, t, r, N_j, n_j` | base rank, chain length, rank step, `r = k + m − 1`, `N_j = k + j(t + 1)`, `n_j = r + jt` | ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `x, ε, b, a, X′, b′, w″, X″` | scale, exponent, `e^{x^ε}`, `x·b`, `e^{x^{ε/3}}`, `a/X′`, `b′/(x\|A\|)`, `x\|A\|X′` | ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `ϑ, B₀, N_c, Γ₀, H` | thick-weight width, the two budgets `B₀ = fmbx^ε`, `N_c = \|𝒯\|kbx^{2ε}/\|A\|²`, redundancy factor, slope range `x^{c_H}b` | ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `Size(x, ε)` | conjunction of the host predicates `SizeA, SizeN, SizeD, SizeRd, SizeQD, SizeInert, SizeDep` and the parameter predicates `SizeM, SizeK, SizeW, SizeMf, SizeT, SizeTheta` | ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `SizeQD, SizeInert` | the host predicate on the sizes of `q`, `d` and `(L′/L)(1, χ_K)`; inert-free up to `max(12, x^{ε/(5J)})` | ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `S_small, Q_S, vd, SizeDep` | the primes dividing `2f_E` other than `q`, `d`; `Q_S := f_E/(q·d)`; `vd := log₂ Q_S`; the host predicate on them | ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `SizeSc, SizeGap, SizeSep, SizeG, SizeT_u` | size predicates of the words, the gaps, the separation, the type primes and the level primes | ThetaChainsOnDefiniteUnitaryGroups §2.3b, ThetaChainsOnDefiniteUnitaryGroups §2.3c, ThetaChainsOnDefiniteUnitaryGroups §2.7, ThetaChainsOnDefiniteUnitaryGroups §2.8 |
| `C_t, C_W, C_Γ, A_max, C_dep` | constants fixed before `ε`: of `SizeT`, of `SizeW`, of `Γ₀`, the bound of the layer exponent, the constant of `SizeDep` | ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `A_n, J, c_H, c_s` | numbers that may depend on `ε`: the layer exponent of `SizeA` (`A_n ∈ [1, A_max]`; `2 + 8ε` in the construction), the window constant (UniformWildKernelBounds §7.6 at the chain's parameters), the exponent of `H`, the exponent of the inert-free bound of chain data; chosen after `ε` and before the scale | ThetaChainsOnDefiniteUnitaryGroups §2.1, 10.0, 10.6 |
| `ε₀, ε₁, x₀` | admissible range of `ε`, the range of the headline, threshold of the scale | ThetaChainsOnDefiniteUnitaryGroups §2.1, 10.6, 10.10 |
| `W, u` | the set of words, a word | ThetaChainsOnDefiniteUnitaryGroups §2.3 |
| `u(τ), v(τ), e′(τ), e(τ)` | Harish-Chandra data at `τ` of the word `u` (`v, e′, e` shared by all words) | ThetaChainsOnDefiniteUnitaryGroups §2.3 |
| `a_τ, a⁻_τ, θ_a, A_w` | top entry and negative bottom entry, top window `θ_a = 1/(k·x^{A_w/2})` | ThetaChainsOnDefiniteUnitaryGroups §2.3b |
| `w_j(τ), w_{u₀,j}` | step weights `e_{j−1}(τ)` (thick, top or thin); those of the translate `u₀` | ThetaChainsOnDefiniteUnitaryGroups §2.3 |
| `Λ_j(τ)` | weight on `X_j` | ThetaChainsOnDefiniteUnitaryGroups §2.3 |
| `Δ_w, Sc` | letter step (`⌈x^{c_Δ}⌉`, the exponent `c_Δ` chosen after `ε` and `c_H`), cloud size `4kΔ_w` | ThetaChainsOnDefiniteUnitaryGroups §2.3, 10.6 |
| `h_gap` | row gap | ThetaChainsOnDefiniteUnitaryGroups §2.3 |
| `η_s, D_*, ℓ*, ℓ_A` | separation width, thresholds | ThetaChainsOnDefiniteUnitaryGroups §2.3c |
| `h₀` | node spacing of an adapted weight datum | ThetaChainsOnDefiniteUnitaryGroups §2.3a |
| `μ_j, η̃, δ, δ′, o_δ` | Hecke characters of the chain, unramified splitting character (not algebraic; `η̃²` and `η̃·‖·‖_{𝔸_E}^{1/2}` are, and `𝕂` contains the values of the latter, ThetaChainsOnDefiniteUnitaryGroups §2.6), auxiliary characters and their inertial order | ThetaChainsOnDefiniteUnitaryGroups §2.4 |
| `S₀` | bad places: the places above `g₀, g₁, p_δ, p′_δ` | ThetaChainsOnDefiniteUnitaryGroups §2.4 |
| `ξ, Ξ, ξ_𝔭, Q(ξ), s, δ_ℓ` | tuple of twists (`ξ = 1` the base tuple), set of tuples, tuple used at `𝔭`, twist places (full ramification set), the sign of the twisted tuples (`s_j := s`), auxiliary character of `ℓ` | ThetaChainsOnDefiniteUnitaryGroups §2.5 |
| `A(ℓ)` | places of `E` above the auxiliary prime of `ℓ` | ThetaChainsOnDefiniteUnitaryGroups §2.5 |
| `𝒮_tw, Tw` | admissible twisting characteristics; twisted places | ThetaChainsOnDefiniteUnitaryGroups §2.5 |
| `𝕂, 𝕃, σ₀, c_𝕃` | coefficient field, field of places, the inclusion `𝕃 ⊂ ℂ`, the restriction of complex conjugation | ThetaChainsOnDefiniteUnitaryGroups §2.6 |
| `g₀, g₁; p_δ, p′_δ; 𝔅(N, g)` | type primes; auxiliary primes; the exceptional set of a type prime | ThetaChainsOnDefiniteUnitaryGroups §2.7 |
| `T(u), T*(u), π_u` | level prime of the word `u`, its target value, `T(u) = N(π_u)` | ThetaChainsOnDefiniteUnitaryGroups §2.8 |
| `G₀, (P_0, χ_{P_0}), (P_1, χ_{P_1})` | finite group of the type primes, base level, row type level | ThetaChainsOnDefiniteUnitaryGroups §2.9a |
| `i_col, i_row` | indices of the type levels | ThetaChainsOnDefiniteUnitaryGroups §2.9a |
| `∇_ℤ, Δ_ℤ` | dual Weyl and Weyl lattices | ThetaChainsOnDefiniteUnitaryGroups §3.1 |
| `ℳ_j, ℳ_j^{int}, ℳ_j^∨, 𝒸, L_𝒸` | chain forms of level `j`; the `Δ_ℤ`-valued (integral) and `∇_ℤ`-valued forms; a class, its class lattice | ThetaChainsOnDefiniteUnitaryGroups §3.1 |
| `D_Γ` | least common multiple of the stabiliser orders | ThetaChainsOnDefiniteUnitaryGroups §3.6 |
| `M_u^{all}, M_u, d_u^{all}, d_u` | full and new source lattices of the word `u`, their ranks | ThetaChainsOnDefiniteUnitaryGroups §3.8 |
| `ρ_LT(p)` | `1/(p² − 1)` | TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.1 |
| `g^D_j, F_j, E_{u,j}, τ_N, 𝔦, 𝔊_u` | the ledger of step `j` at `𝔭`: gain off `Drop`, bulk, cost, served colength, colength beyond `τ_N`; the net exponent of the chain | LocalGainOfThetaChains §4.9, LocalGainOfThetaChains §4.9e, LocalGainOfThetaChains §4.9f |
| split, conjugate, odd conjugate type; linked places; `𝒱_p, Drop` | types of a prime inert in `K` by its Frobenius; places with two tops at odd distance in their orbit; the served places, the dropped primes | LocalGainOfThetaChains §4.9, LocalGainOfThetaChains §4.17 |
| `𝔖(p), e_p` | the share `m·Σ_{v∈𝒱_p}sh_v` of the served places; sandwich exponent (`p^{e_p}ℳ^∨_0 ⊂ ℳ^{int}_0` away from `T(u)`; in LocalGainOfThetaChains §4.17 the number `max_uΣ_τ(k(k−1)/2)⌊log_p(Λ_0(τ)_0 − Λ_0(τ)_{k−1} + k − 1)⌋`) | LocalGainOfThetaChains §4.9e, LocalGainOfThetaChains §4.9f, LocalGainOfThetaChains §4.17 |
| `𝔢_u` | cost at the level prime | LocalGainOfThetaChains §4.9f |
| `Λ_log` | the log-size parameter `C·N₁²·log a` of the gain | LocalGainOfThetaChains §4.14b, LocalGainOfThetaChains §4.15e, LocalGainOfThetaChains §4.17 |
| `N_u` | sublattice of `M_u` on which the gains are proved | LocalGainOfThetaChains §4.16 |
| `Δ_b, Z_bad` | width of the box of the negative bottom entries at the tops; the weighted count of the unserved tops | LocalGainOfThetaChains §4.17, LocalGainOfThetaChains §4.17d, 10.6 |
| `𝒟_τ` | the component at `τ` of the discrete series of stage `0` | RowTowerAndRallisIdentities §5.1 |
| `ℋ^♮, 𝔼^♮, ℋ, 𝔼, 𝔼_0, Π_good` | rows at principal level, good rows; their parts of the row type level (`𝔼` the target rows); the part of the base level; the good idempotent | RowTowerAndRallisIdentities §5.3 |
| `D_all, D_rows, δ_bad` | the dimensions of `ℋ` and `𝔼`, the discarded share | RowTowerAndRallisIdentities §5.3 |
| `λ_j(ξ, 𝔥)` | the Rallis eigenvalue of step `j` | RowTowerAndRallisIdentities §5.7 |
| `v_□, p_□, d_□, 𝔪_□, N_E, C_F` | the auxiliary place of the grid, the auxiliary prime, the depth (defined with the grid), the modulus of the grid, the modulus of the host, the depth constant `C_F ≥ 6510` | RowTowerAndRallisIdentities §5.8a |
| `Size_□`; (L1)–(L7) | the size predicate of the grid; the condition on `𝕃` | RowTowerAndRallisIdentities §5.8e; RowTowerAndRallisIdentities §5.8 |
| `𝔫` | the descent constant | RowTowerAndRallisIdentities §5.10 |
| `P_u, K(u, u′)` | Bessel–Poincaré series, Gram operators | BesselPoincareSeriesAndGramBounds §5.14, BesselPoincareSeriesAndGramBounds §5.15 |
| `ε_C, e_diag, δ_old(u)` | limit-multiplicity error, diagonal Gram defect, share of the forms that are not new | BesselPoincareSeriesAndGramBounds §5.16, BesselPoincareSeriesAndGramBounds §5.21 |
| `η_off` | the error constant of the Hilbert–Schmidt bound | BesselPoincareSeriesAndGramBounds §5.20 |
| `c_Θ` | `½·min((C_Δ − 4)/2, (c_T·C_b − 1)/4)`, the exponent of the bound `Θ ≥ k^{c_Θ}` (as `Δ_w ≥ (kfx^ε)^{C_Δ}`) | BesselPoincareSeriesAndGramBounds §5.20, 10.6 |
| `B_u` | the period pairing (linear in the column, conjugate-linear in the row) | SeesawForThetaChains §6.1, SeesawForThetaChains §6.14 |
| `d^Z_j` | the dimension of the lifted subspace | CongruenceModulesOfThetaLifts §7.10a |
| `s_w` | the cyclotomic level of a place `w` | CongruenceModulesOfThetaLifts §7.7b |
| `SizeThin`; the depth hypothesis | size predicate of the thin windows; for every prime `ℓ ≥ 11` some `j ≥ 0` with `(ℓ − 1)^j ≥ ℓ_A` and `2j + 2 ≤ L_th` | CongruenceModulesOfThetaLifts §7.6 (a); CongruenceModulesOfThetaLifts §7.10a |
| `N′_u, I_u, R, R^∨, R_0` | divided source, division ideal, glued target, its dual (the `c_𝕃`-semilinear functionals integral on `R`), its base-level form | GluedTargetAndDivisionInequality §7.13 |
| `𝔧_j(ℓ)` | the exponent of weight elimination at step `j` and its bound | CongruenceModulesOfThetaLifts §7.16a (3) |
| `La, e_D` | `log(a·rd_E)`; the exponent of the per-lift division error, `e_D = 1` | ThetaChainsOnDefiniteUnitaryGroups §2.1, GluedTargetAndDivisionInequality §8.22 |
| `t_u, A_top` | top term of the height of `B_u`; `Σ_{τ∈Φ_top} a_τ` | GluedTargetAndDivisionInequality §8.7 |
| `h_u` | explicit height of `B_u` | GluedTargetAndDivisionInequality §8.9 |
| `SizeSG, SizeGen, SizePage` | size predicates: (e3) of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18e; (N1)–(N2) of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a; (P1)–(P5) of GluedTargetAndDivisionInequality §8.20 | ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18e, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a, GluedTargetAndDivisionInequality §8.20 |
| `L` (in GluedTargetAndDivisionInequality §8.20) | the logarithmic size of the theta data (`L = x^ε` in the chain) | GluedTargetAndDivisionInequality §8.20 |
| `D^H_j` | the type-prime term of the bulk (`F_j = −D^H_j/2` above the type primes), equal to `DF(λ^W_j)` by the definitions of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19 and LocalGainOfThetaChains §4.9f (d) | LocalGainOfThetaChains §4.9f (d), ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19 |
| `F_tot` | bulk divisibility | GluedTargetAndDivisionInequality §8.21 |
| `E_tot(u)` | total cost of the steps | GluedTargetAndDivisionInequality §8.23 |
| `𝒩, 𝔦_tot` | net gain; colength beyond `τ_N` | 9.2 |
| `λ⁰, hook(λ)` | the partition of the column degrees of a weight; the hook product | 9.1 |
| `A_V` | the absolute constant `2e⁴` of the two-word comparisons | 9.4 |
| `c_H⁰` | the threshold of the exponent `c_H` of the slope range | 9.6 |
| `U_F, 𝔈₁, …, 𝔈₉, 𝔈_tot(u₀)` | the bound for the spread `u_F`; the error terms of the Frobenius-restricted inequality and their sum | 10.4 |
| `Y_g` | the window `(kb)^8` of the type primes | 10.6 |
| `c_box, C_R, C_deg, C_Δ` | constants fixed before `ε`: the width of the zero-free boxes (the gap of the thin-scale box hypothesis of FrobeniusRestrictedRieszSums §1.4 (a); `c_box ∈ [ε₀/8, 1/12)`); the exponent of `rd_E` in `SizeGen` (`R_E = rd_E^{C_R}`); the degree bound `T ≤ x^{C_deg}` of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a (N2) (not the `C_T` of `SizeT_u`); the exponent of the hypothesis `Δ_w ≥ (kfx^ε)^{C_Δ}` of BesselPoincareSeriesAndGramBounds §5.20 (10.6) | FrobeniusRestrictedRieszSums §1.4, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a, 10.6 |
| `x_lay(ψ)` | the threshold of the layer function of the hosts | 10.7 |
| `Tw₀` | the least set of twisted places of the chain | 10.9 |
| `e_W` | the exponent of the windowed bound, `e_W = 9` | 10.10 |
| `λ_W` | window exponent: `HasWindows S λ_W`, windows `[Y, Y^{λ_W}]` | 10.7, 10.10 |
| `(H1)–(H6)` | standing hypotheses of chain data | 10.0 |
| `κ_W` | the constant of the wild-kernel budget (CongruenceModulesOfThetaLifts §7.11); a good twisting datum (CongruenceModulesOfThetaLifts §7.10a) and the wild-kernel budget are conditions on the data, verified by the construction (10.9 (c), (d)) | CongruenceModulesOfThetaLifts §7.10a, CongruenceModulesOfThetaLifts §7.11 |
| `ι_ξ` | the good descent of a tuple `ξ` | RowTowerAndRallisIdentities §5.4 |
| `R_E` | `rd_E^{C_R}` in `SizeGen` | ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a |

**Statements of the formal proof.** Where a target names [FormalProof], the form that proof establishes is recorded at the target: its
hypotheses, ranges and constants are those of the proof, including restrictions that the route written here does not
visibly use. A wider or sharper form stated beside it is this roadmap's own, proved by the route written here, and is not in
[FormalProof].

## Layer 9: Sources, rank matching and the slope inequality of the chain

The source lattices have small slope: the Weyl lattice of a weight with column degrees `λ⁰` and its dual have slopes of
absolute value at most `|λ⁰|·log k + log c_{λ⁰}`, and the maximal slope of the forms on the class lattices is controlled through short frames
of the dual class lattices, which a transference theorem of the geometry of numbers provides (9.1). Dividing by the gains raises the slope by the sum of the local gains, up to the
colengths of the gain sublattice (9.2). The level prime is fixed by rank matching, an exact identity between masses,
formal degrees and Weyl dimensions in which the factorials cancel, and whose logarithm carries the mass formula with a
factor opposite to the one in `log Ω` (9.3, 9.4). A code of words gives the redundancy (9.5), and the slope inequality
for nearly tight frames bounds the mean of `μ(N′_u) − h_u` over the words of one translate by the slope of the target
(9.6).

### 9.1 Slopes of the source lattices

*Statement.* (a) *Weyl lattices of the chain.* For a dominant weight `λ` of `GL_k`
let `λ⁰ := λ − λ_k·(1, …, 1)` be its partition of column degrees (`λ⁰_{k+1} := 0`), `𝒫_λ`, `∇_ℤ(λ) = 𝒫_λ ∩ ℤ[X]` and its dual
`Δ_ℤ(λ)` the polynomial model and the lattices of ThetaChainsOnDefiniteUnitaryGroups §3.1 (`X` the `k × k` matrix variable, `Δ_s` its leading principal minors,
`v_λ = ∏_s Δ_s^{λ⁰_s − λ⁰_{s+1}}`, `⟨v_λ, v_λ⟩_λ = 1`), so that `⟨·,·⟩_λ` is the Fischer form `⟨X^α, X^β⟩_F = δ_{αβ}·α!` divided by
`⟨v_λ, v_λ⟩_F`, and put `c_{λ⁰} := ⟨v_λ, v_λ⟩_F/∏_s λ⁰_s! = hook(λ⁰)/∏_s λ⁰_s!` (`hook` the hook product). Then
(IntegralWeylModulesOfGeneralLinearGroups §3.2 at `N = k`) `1 ≤ c_{λ⁰} ≤ (λ⁰_1 + k)^{k(k−1)/2}`, and, after extension of scalars
to `𝒪_𝕃`,

`−(|λ⁰|·log k + log c_{λ⁰}) ≤ μ(Δ_ℤ(λ)) = −μ(∇_ℤ(λ)) ≤ 0`,  `μ_max(Δ_ℤ(λ)) ≤ μ_max(∇_ℤ(λ)) ≤ |λ⁰|·log k + log c_{λ⁰}`,  `|λ⁰| = Σ_s λ⁰_s`,

and the lattice of monomials of column degrees `λ⁰`, with the form `⟨·,·⟩_λ`, has maximal slope at most `|λ⁰|·log k + log c_{λ⁰}`.

(b) For a word `u` write `λ_u(τ) = λ⁰_u(τ) + λ_u(τ)_{k−1}·(1, …, 1)`, so that `λ⁰_u(τ)` is a partition with at most `k − 1`
nonzero parts. For the full source lattice `M_u^{all}` of ThetaChainsOnDefiniteUnitaryGroups §3.8 (forms of word `u` on `U(X_0)` at the level of ThetaChainsOnDefiniteUnitaryGroups §2.9 with values
in the Weyl lattices in the coordinates of the dual class lattices, ThetaChainsOnDefiniteUnitaryGroups §3.1, with the Petersson metric):
`μ(M_u^{all}) = Σ_{τ∈Φ} μ(Δ_ℤ(λ_u(τ))) − (Σ_{τ∈Φ}|λ_u(τ)|/k)·log T(u)`.

(c) *Short dual frames and the maximal slope.* For every class `𝒸` of `U(X_0)` at the level of ThetaChainsOnDefiniteUnitaryGroups §2.9, with class lattice
`L_𝒸` (integral, `L_𝒸 ⊂ L_𝒸^∨`, ThetaChainsOnDefiniteUnitaryGroups §3.1), the dual class lattice `L_𝒸^∨` contains vectors `y_1, …, y_k`, linearly independent over
`E`, with `Tr_{E/ℚ}⟨y_a, y_a⟩ ≤ 2f·k²·rd_E²` (HermitianFormsAndLattices §4.12 (b)). Consequently

`μ_max(M_u^{all}) ≤ Σ_{τ∈Φ} ( |λ⁰_u(τ)|·log(k⁴·rd_E²) + log c_{λ⁰_u(τ)} − λ_u(τ)_{k−1}·log T(u) )`.

(d) Hence, for the source lattice `M_u` of ThetaChainsOnDefiniteUnitaryGroups §3.8, under `Size(x, ε)`, `SizeSc`, `k·b′ ≤ a`, `log T(u) ≤ C·m·x^ε` and `Φ_top ≠ ∅`
(the off-top places are paid by one top: without tops `μ(M_u) < 0` while the left side below is `0`):
`−C·|Φ_top|·a·La·(1 + m/k) ≤ μ(M_u)` and `μ_max(M_u) ≤ C·|Φ_top|·a·La`.

*Route.* (a) IntegralWeylModulesOfGeneralLinearGroups §3.2 (the slopes of the Weyl and dual Weyl lattices of `GL_N` and of
the lattice of monomials for the normalised Fischer form, every `N` and every partition) at `N = k`, for the model of ThetaChainsOnDefiniteUnitaryGroups §3.1,
in which `Δ_ℤ(λ) ⊂ ∇_ℤ(λ)` are dual for `⟨·,·⟩_λ` (the lemma of ThetaChainsOnDefiniteUnitaryGroups §3.1); `𝒫_λ` and `𝒫_{λ⁰}` are the same space with the same form
and lattices (ThetaChainsOnDefiniteUnitaryGroups §3.1: the column degrees are those of `λ⁰`), the actions differing by `det^{λ_k}`. Slopes do not change under extension of scalars (SlopesOfHermitianVectorBundles §1.7). (b) The class set at the level of ThetaChainsOnDefiniteUnitaryGroups §2.9 has
trivial stabilisers (ThetaChainsOnDefiniteUnitaryGroups §3.8 (a)), so `M_u^{all}` is the orthogonal sum over the classes of the lattices of forms on one class.
For a Hermitian `𝒪_E`-lattice `Λ` of rank `k`, the lattice of forms of weight `λ = λ⁰ + λ_{k−1}·1` (coefficients `V_λ^∨`,
values in `Δ_ℤ(λ)` in the coordinates of local bases of `Λ`, with the twist by `det^{λ_{k−1}}`) has slope `μ(Δ_ℤ(λ)) − |λ|·μ(Λ)` at each
`τ` (the Schur functor of `g` has determinant `det(g)^{|λ|·rank/k}`). On one class the integral structure is read in local
bases of `L_𝒸^∨` (ThetaChainsOnDefiniteUnitaryGroups §3.1): away from the places of `E` above `π̄_u` this is the self-dual `L^{sd}_𝒸`, of slope `0`; above `π̄_u`,
`L_𝒸^∨/L^{sd}_𝒸` has length one at each of the `f` places, so `L_𝒸^∨` has slope `f·log T(u)/(fk) = log T(u)/k` (with `μ = 2μ̂`).
Summing over `τ` gives the formula. (c) *Frames.* HermitianFormsAndLattices §4.12 (b) for the integral lattice `L_𝒸` (the trace
dual of `L_𝒸^∨` is `𝔡_E^{−1}L_𝒸`, whose nonzero vectors have `Tr_{E/ℚ}⟨z, z⟩ ≥ 2f·rd_E^{−2}`; Banaszczyk's transference theorem,
GeometryOfNumbersAndQuadraticArithmetic §4.4.13, for the `ℤ`-lattice `L_𝒸^∨` of rank `2fk` in `X_0 ⊗_ℚ ℝ` with the form
`Tr_{E/ℚ}⟨·,·⟩`, gives `2fk` independent vectors of squared length at most `2f·k²·rd_E²`, and `k` of them are independent over `E`;
Minkowski's second theorem bounds only the product of the minima and does not give a bound polynomial in the rank).
*Maximal slope.* By SlopesOfHermitianVectorBundles §2.2 `μ_max(M_u^{all})` is the largest `μ_max` of a class summand. On one
class this is the instance `Λ = L_𝒸^∨` (which contains the frame, and in whose local bases integrality is read, ThetaChainsOnDefiniteUnitaryGroups §3.1),
`s_τ = λ_u(τ)_{k−1}` of the frame-map bound IntegralWeylModulesOfGeneralLinearGroups §3.4; in detail, apply the slope test
(SlopesOfHermitianVectorBundles §2.4 (b)) to the following map. Let `Y ∈ GL_k(E)` be the matrix of the frame in the
coordinates of `X_0`, `s_τ := λ_u(τ)_{k−1}`, and for a form supported at `𝒸` write `φ(𝒸)(z) = ∏_τ det(z_τ)^{s_τ}·P(z)`; `φ_y(φ)` is
the family of the coefficients of `z ↦ P((τ(Y)z_τ)_τ)`. It is injective. *Integrality.* Let `𝔡_𝒸` be the fractional ideal of
`E` generated at each prime by `det M_𝒸` (ThetaChainsOnDefiniteUnitaryGroups §3.1; a local basis of `L_𝒸^∨`); `N_{E/ℚ}(𝔡_𝒸) = T(u)^{−f}` by (b). At a place of `𝕃`,
`Y = M_𝒸C` with `C` integral because `y_a ∈ L_𝒸^∨`; by ThetaChainsOnDefiniteUnitaryGroups §3.1 the polynomial `∏_τ τ(det M_𝒸)^{s_τ}·P((τ(M_𝒸)z_τ)_τ)` is integral for
an integral form, and substituting the integral matrices `τ(C)` keeps it integral; so `φ_y` maps the integral forms at `𝒸`
into `I` times the lattice of monomials of column degrees `λ⁰_u(τ)`, `I := ∏_τ τ(𝔡_𝒸)^{−s_τ}𝒪_𝕃`. *Norms.* The coordinates of
`X_0` are orthonormal, so the metric of the class summand is the form `⟨·,·⟩_λ` of the polynomial part, and the substitution
`z ↦ τ(Y)z` has norm at most `(Σ_a⟨y_a, y_a⟩_{σ∘τ})^{d/2}` on polynomials of degree `d`:
`‖φ_yφ‖²_σ ≤ ∏_τ(Σ_a⟨y_a, y_a⟩_{σ∘τ})^{|λ⁰_u(τ)|}·‖φ‖²_σ` at every embedding `σ` of `𝕃`. *The twist.*
`−2 log N(I)/[𝕃:ℚ] = −Σ_τ λ_u(τ)_{k−1}·log T(u)`, exactly (it is `−k·Σ_τ s_τ·μ(L_𝒸^∨)`); the determinant of the frame does not
enter, because the map "value with its determinant factor" differs from `φ_y` by an element of `𝕃^×`, which contributes
nothing to a slope (product formula). *The frame.* The mean over `σ` of `log Σ_a⟨y_a, y_a⟩_{σ∘τ}` is at most `log(k³·rd_E²)`
(concavity of `log` and the trace bound), and the maximal slope of the monomial lattice is at most
`Σ_τ(|λ⁰_u(τ)|·log k + log c_{λ⁰_u(τ)})` by (a). The slope test gives the bound. (d) By ThetaChainsOnDefiniteUnitaryGroups §3.8 (c), `μ(M_u) = μ(M_u^{all}) − f·log(T(u) − 1)/(T(u) − 2) ≥ μ(M_u^{all}) − 1` and
`μ_max(M_u) ≤ μ_max(M_u^{all})`. By ThetaChainsOnDefiniteUnitaryGroups §2.3b (f), at a top place `|λ⁰_u(τ)| ≤ a_τ + k(a⁻_τ + 2Sc) ≤ 4a` (here `k·b′ ≤ a` is
used: the shift by `det^{a⁻_τ}` costs `k·a⁻_τ·log k`) and `−λ_u(τ)_{k−1} = a⁻_τ ≤ 2b′`; elsewhere `|λ⁰_u(τ)| ≤ 3k·Sc` and
`−λ_u(τ)_{k−1} ≤ Sc`; `log c_{λ⁰} ≤ k²·log(λ⁰_1 + k)`. Insert into (b) (with `μ(Δ_ℤ(λ)) ≥ −(|λ⁰| log k + log c_{λ⁰})`) and into (c); `log k`, `log rd_E` and
`m·x^ε·Sc·f/a` are at most `C·La`, and `m·b′ ≤ a`; so the off-top places cost at most `C·a·La` in all, which is at most
`C·|Φ_top|·a·La` because `Φ_top ≠ ∅`.

*NEW* bookkeeping, *KNOWN* ingredients (Weyl; Carter–Lusztig; Gross; Banaszczyk). (a): [FormalProof], `Formalism/SharpRestriction/GlobalSchurBounds/SlopeMaxOpenOfHookTwoLeV.lean` (`Formalism.MainNotions.flipTwoThree.StdSlopeLow`); (d): [FormalProof], `Formalism/RankGapBounds/MeanBoundSecondForm.lean` (`Formalism.RankGapBounds.WeightedMeanData.Data.Slopes`). *Needs:* ThetaChainsOnDefiniteUnitaryGroups §2.3, ThetaChainsOnDefiniteUnitaryGroups §2.3b, ThetaChainsOnDefiniteUnitaryGroups §2.9, ThetaChainsOnDefiniteUnitaryGroups §3.1, ThetaChainsOnDefiniteUnitaryGroups §3.8;
IntegralWeylModulesOfGeneralLinearGroups §§3.2, 3.4; HermitianFormsAndLattices §4.12 (b); SlopesOfHermitianVectorBundles §§1.7, 2.2, 2.4;
GeometryOfNumbersAndQuadraticArithmetic §4.4.13.

### 9.2 Slopes of the divided sources

*Definitions.* With the ledger of LocalGainOfThetaChains §§4.9e–4.9f, `F_tot` of GluedTargetAndDivisionInequality §8.21 (a) and `E_tot(u)` of GluedTargetAndDivisionInequality §8.23 (a):
the *net gain* `𝒩 := Σ_𝔭 sz_𝔭(Σ_j g^D_j(𝔭) − τ_N(𝔭))`, the *colength beyond `τ_N`* `𝔦_tot := Σ_𝔭 ϱ(𝔭)e_𝔭·𝔦(𝔭)`, the
*colength at the level prime* `ℓ_T(u) := Σ_{𝔭|T(u)} 2ϱ(𝔭)·length_{𝒪_𝔭}((M_u/N_u)_𝔭)/d_u` (at the places above `T(u)`, `N_u`
is the cut of LocalGainOfThetaChains §4.16 at the level prime), and the *source loss* `𝔏_u := 4𝔦_tot + ℓ_T(u) + C·X″ + 1`.

*Statement.* Assume `T(u) ≥ b³`, `b ≥ 4f` and `Σ_𝔭 sz_𝔭(τ_N(𝔭)) ≤ b²`, and that the twisting datum satisfies (T3) of GluedTargetAndDivisionInequality §8.20
(so the bulk `F_j` vanishes outside `Tw`, and `F_tot` is the sum of `sz_𝔭(F_j(𝔭))` over all places). For every word `u`, with
`N_u` of LocalGainOfThetaChains §4.16 and `N′_u` of GluedTargetAndDivisionInequality §7.13:
(a) `μ(N′_u) = μ(M_u) + Σ_𝔭 2ϱ(𝔭)⌊e_𝔭 𝔊_u(𝔭)⌋ − Σ_𝔭 2ϱ(𝔭)·length_{𝒪_𝔭}((M_u/N_u)_𝔭)/d_u`, and
`|Σ_𝔭 2ϱ(𝔭)⌊e_𝔭 𝔊_u(𝔭)⌋ − Σ_𝔭 sz_𝔭(𝔊_u(𝔭))| ≤ C·X″`;
(b) `μ(N′_u) ≥ μ(M_u) + 𝒩 + F_tot − E_tot(u) − 𝔏_u`;
(c) `μ_max(N′_u) ≤ μ_max(M_u) + 𝒩 + F_tot − E_tot(u)`;
(d) `ℓ_T(u) ≤ C·|Φ_top|·m·(a/k + b′)·log T(u)` (this is the colength bound LocalGainOfThetaChains §4.16c).

*Route.* (a) `N′_u = I_u·N_u` with `I_u = ∏_𝔭𝔭^{−⌊e_𝔭 𝔊_u(𝔭)⌋}` (GluedTargetAndDivisionInequality §7.13); multiplying by a fractional ideal `𝔞` adds
`−2 log N𝔞/[𝕃:ℚ]` to `μ` (SlopesOfHermitianVectorBundles §2.1), which is `Σ_𝔭 2ϱ(𝔭)⌊e_𝔭 𝔊_u(𝔭)⌋`, and passing from `M_u` to
the sublattice `N_u` of the same rank `d_u` lowers `μ` by `Σ_𝔭 2ϱ(𝔭)·length_𝔭/d_u` (SlopesOfHermitianVectorBundles §§1.2,
1.7). Rounding costs less than `2ϱ(𝔭)` at each place with `𝔊_u(𝔭) ≠ 0`, and `Σ_{𝔭|p}ϱ(𝔭) ≤ log p`; these places lie
above the primes `≤ X″`, `d`, `g₀`, `g₁`, `T(u)` and the primes dividing `D_Γ` (LocalGainOfThetaChains §4.9f (g)), so the total is at most
`2 log 4·X″ + 2 log(d·g₀g₁·T(u)·D_Γ) ≤ C·X″` (Chebyshev; the sizes of ThetaChainsOnDefiniteUnitaryGroups §2.1, ThetaChainsOnDefiniteUnitaryGroups §2.7, ThetaChainsOnDefiniteUnitaryGroups §2.8 and ThetaChainsOnDefiniteUnitaryGroups §3.6). (b) Away from `T(u)`, LocalGainOfThetaChains §4.16 (i)
bounds the local length by `e_𝔭·d_u^{all}·(τ_N(𝔭) + 𝔦(𝔭))` (`d_u^{all} ≥ d_u`), so these places lower `μ` by at most
`(d_u^{all}/d_u)·(Σ_𝔭 sz_𝔭(τ_N(𝔭)) + 2𝔦_tot)`; and `d_u^{all}/d_u = (1 − δ_old(u))^{−1} ≤ 1 + 4f/T(u)` (ThetaChainsOnDefiniteUnitaryGroups §3.8 (b)), with
`(4f/T(u))·b² ≤ 1`. The places above `T(u)` contribute `ℓ_T(u)`. With (a) and
`Σ_𝔭 sz_𝔭(𝔊_u(𝔭) − τ_N(𝔭)) = 𝒩 + F_tot − E_tot(u)` (since `𝔊_u = Σ_j(g^D_j + F_j − E_{u,j})`, LocalGainOfThetaChains §4.9f (g), and `F_j = 0` off `Tw` by
(T3)) this is (b). (c) By
LocalGainOfThetaChains §4.16 (i), `N_u ⊂ ∏_𝔭𝔭^{e_𝔭τ_N(𝔭)}M_u` (the exponents are integers; above `T(u)`, `τ_N = 0` and `N_u ⊂ M_u` by LocalGainOfThetaChains §4.16c), so
`N′_u ⊂ I_u·∏_𝔭𝔭^{e_𝔭τ_N(𝔭)}·M_u`. `μ_max` does not increase on passing to a sublattice of the same rank
(SlopesOfHermitianVectorBundles §2.4 (b) for the inclusion, a map of height `≤ 0`) and multiplication by a fractional ideal shifts it as it shifts `μ` (SlopesOfHermitianVectorBundles §2.1), so
`μ_max(N′_u) ≤ μ_max(M_u) + Σ_𝔭 2ϱ(𝔭)(⌊e_𝔭 𝔊_u(𝔭)⌋ − e_𝔭τ_N(𝔭)) ≤ μ_max(M_u) + Σ_𝔭 sz_𝔭(𝔊_u(𝔭) − τ_N(𝔭))`. (d) Since
`sz_𝔭(length_𝔭/e_𝔭) = 2ϱ(𝔭)·length_𝔭`, the left side of LocalGainOfThetaChains §4.16c is `ℓ_T(u)`.

*NEW*. *Needs:* ThetaChainsOnDefiniteUnitaryGroups §2.1, ThetaChainsOnDefiniteUnitaryGroups §2.5, ThetaChainsOnDefiniteUnitaryGroups §2.7, ThetaChainsOnDefiniteUnitaryGroups §2.8, ThetaChainsOnDefiniteUnitaryGroups §3.6, ThetaChainsOnDefiniteUnitaryGroups §3.8, LocalGainOfThetaChains §4.9e, LocalGainOfThetaChains §4.9f, LocalGainOfThetaChains §4.16, LocalGainOfThetaChains §4.16c, GluedTargetAndDivisionInequality §7.13, GluedTargetAndDivisionInequality §8.20, GluedTargetAndDivisionInequality §8.21, GluedTargetAndDivisionInequality §8.23; SlopesOfHermitianVectorBundles §§1.2, 1.7, 2.1, 2.4;
Mathlib `Chebyshev.theta_le_log4_mul_x`.

### 9.3 Formal degrees of the row discrete series

*Statement (instance).* For the row discrete series `𝒟_τ` of RowTowerAndRallisIdentities §5.3 at
`τ ∈ Φ`, with Harish-Chandra parameter `h(τ) = (v(τ), −e′(τ))` of ThetaChainsOnDefiniteUnitaryGroups §2.3 (`r = k + m − 1` entries), and the Haar measure of
the Conventions (transferred from the compact form):

`d(𝒟_τ) = Vand(v(τ), −e′(τ))/∏_{i<r} i!`,  `Vand(y) := ∏_{a<b}|y_a − y_b|`;

this is the number `d(𝒟_τ)` of ThetaChainsOnDefiniteUnitaryGroups §2.8. For the definite source at `τ`, `dim V_{λ_u(τ)} = Vand(u(τ))/∏_{i<k} i!`.

*Route.* The formal degree formula of DiscreteSeriesCoefficientsAndAutomorphicMetrics §8.3 (for the discrete series of
AutomorphicFormsOnReductiveGroups §2.4,
`d(π_λ) = ∏_{α>0}|⟨λ, α^∨⟩|/∏_{α>0}⟨ρ, α^∨⟩` for the measure that gives the compact dual total mass one) at the parameter
`h(τ)`: for `U(r)` the positive coroots pair with `h` as `h_a − h_b` (`a < b`) and with `ρ` as `b − a`, and
`∏_{a<b}(b − a) = ∏_{i<r} i!`. The source dimension is Weyl's formula at the Harish-Chandra parameter `u(τ)`
(ClassicalGroups §5.1).

*KNOWN* (instance; Harish-Chandra 1966; Weyl). *Needs:* ThetaChainsOnDefiniteUnitaryGroups §2.3, ThetaChainsOnDefiniteUnitaryGroups §2.8, RowTowerAndRallisIdentities §5.3; AutomorphicFormsOnReductiveGroups §2.4;
DiscreteSeriesCoefficientsAndAutomorphicMetrics §8.3; ClassicalGroups §5.1.

### 9.4 Rank matching and the size of the level prime

*Statement.* Let `E/F` be unramified at every finite place, `d*_u`, `D*`, `T*(u)`, `T(u)` as in
ThetaChainsOnDefiniteUnitaryGroups §2.8, and `i_col`, `i_row` the indices of the type levels at `g₀, g₁` of ThetaChainsOnDefiniteUnitaryGroups §2.9.
(a) (*Volume.*) Give `U(Y_0)(𝔸_f)` the Haar measure for which the stabiliser of the standard lattice has volume `1`, and
`U(Y_0)(F_∞)` the Haar measure defined by the invariant gauge form of the archimedean fibre measure of
HermitianFormsAndLattices §6.1 (f), normalised so that the compact inner form `U(W_m)(F_∞)` (`W_m` the totally positive
definite space of ThetaChainsOnDefiniteUnitaryGroups §2.2) has volume `1` (the measure of the Conventions). Then `vol([U(Y_0)]) = mass(𝒪_E^r)`; hence the
`D* = mass(𝒪_E^r)·i_row·∏_τ d(𝒟_τ)` of ThetaChainsOnDefiniteUnitaryGroups §2.8 is the `D* = vol([U(Y_0)])·vol(K₂)^{−1}·∏_τ d(𝒟_τ)` of RowTowerAndRallisIdentities §5.3 (i).
(b) (*The identity; the factorials cancel.*)

`log(D*/d*_u) = Σ_{i=k+1}^{r} [ f(i − ½)·log rd_E − f·i·log(2π) + log L(i, η^i) ] + log(i_row/i_col) + Σ_{τ∈Φ} log( Vand(v(τ), −e′(τ))/Vand(u(τ)) )`,

and `log(D*/d*_u) = f·k·log T*(u) + 2 log Γ₀` (ThetaChainsOnDefiniteUnitaryGroups §2.8). Here the `m − 1` mass ratios
`mass(𝒪_E^i)/mass(𝒪_E^{i−1}) = rd_E^{f(i−½)}(2π)^{−fi}((i − 1)!)^f·L(i, η^i)` carry the factorials
`∏_{i=k}^{r−1}(i!)^f`, which cancel exactly against the quotient of the Weyl denominators of 9.3, and
`log(i_row/i_col) = f·(m(2k + m − 1)/2)·log(g₀g₁) + f·Σ_{g∈{g₀,g₁}}Σ_{k<i≤r} log(1 − g^{−i})` (ThetaChainsOnDefiniteUnitaryGroups §2.9a (a)).
(c) (*Bounds.*) Under `Size(x, ε)`, `SizeSc` and `SizeG` (ThetaChainsOnDefiniteUnitaryGroups §2.7), for an adapted datum (ThetaChainsOnDefiniteUnitaryGroups §2.3b), for `T = T*(u)` and for `T = T(u)`:

`Σ_{j=1}^m mean_{τ∈Φ} log(w_j(τ)·rd_E/(2π)) + m·log(g₀g₁) − C·(La + m²La/k) ≤ log T ≤ C·m·x^ε`;

and, for `x ≥ x₀`, for all words `u, u′` and every `τ ∈ Φ`, with the absolute constant `A_V := 2e⁴`:
`A_V^{−k} ≤ Vand(u(τ))/Vand(u′(τ)) ≤ A_V^k` and `A_V^{−1} ≤ T(u)/T(u′) ≤ A_V`.
(d) In particular, for `x ≥ x₀`: `T(u) ≥ (g₀g₁·rd_E/(2π))^{m−2}`, and `16·m·x^ε ≤ log T*(u) < log T(u) ≤ C_T·m·x^ε` with `C_T`
depending only on the constants fixed before `ε` (`C_T = 25` serves when `g₀, g₁ ≤ 2(kb)^8`; the leading term is
`(17 + o(1))·m·x^ε`, by this roadmap's evaluation of (b)). These bounds are the hypothesis
`SizeT_u` of ThetaChainsOnDefiniteUnitaryGroups §2.8 (`16·m·x^ε ≤ log T*(u)` and `log T*(u) + 1 ≤ C_T·m·x^ε ≤ x`) at the chain's parameters, and give
`b^{c_T m} ≤ T(u) ≤ b^{C_T m}` for every `c_T ≤ 16`.

*Route.* (a) HermitianFormsAndLattices §6.2 (b), for every Hermitian space and the fibre measure, applied to `Y_0` and to
`W_m` with their standard lattices: the two spaces are isometric at every finite place (ThetaChainsOnDefiniteUnitaryGroups §2.2 (c)) and both lattices are
unimodular, so they have the same local densities and the same right-hand side
`2·L(1, η)·∏_{v<∞}(L_v(1, η_v)β_v)^{−1}` (the Tamagawa number `2` of every unitary group, HermitianFormsAndLattices §6.0b, is inside HermitianFormsAndLattices §6.2). For the
definite `W_m` the left-hand side is `β_∞·mass(𝒪_E^r)` (HermitianFormsAndLattices §6.2 (a)), `β_∞` the fibre volume of `U(W_m)(F_∞)`; dividing by
`β_∞` is the normalisation of (a), because the gauge forms of the two inner forms correspond over `F_∞ ⊗ ℂ`
(AdelicAlgebraicGroups §2.4). All unimodular lattices of rank `r` in totally positive definite spaces over `E` have the
mass of `𝒪_E^r` (HermitianFormsAndLattices §6.3 (c)). (b) Insert the consecutive-rank ratio
HermitianFormsAndLattices §6.4 (b) (`|d_F|^{(2i−1)/2} = rd_E^{f(i−½)}` since `E/F` is unramified) and 9.3 into the
definitions of ThetaChainsOnDefiniteUnitaryGroups §2.8; `∏_{i<r}i!/∏_{i<k}i! = ∏_{i=k}^{r−1} i!`. (c) Divide (b) by `fk`. The mass ratios give
`(m − 1)·log(rd_E/(2π))·(1 + O(m/k))` and the missing `m`-th copy costs at most `La`; the indices give
`m·log(g₀g₁)·(1 + (m − 1)/(2k))`, the extra term being nonnegative; in the Vandermonde quotient the cross factors
`∏_{i,c}|v_i(τ) + e′_c(τ)|`, with `|v_i(τ)| ≤ Sc` small against `e′_c(τ) ≥ w″` and `e′_c(τ)` within `ϑ` of `w_{c+1}(τ)` (ThetaChainsOnDefiniteUnitaryGroups §2.3b), give
`(1 − 1/k)·Σ_j mean_τ log w_j(τ) + O(m·Sc/w″ + mϑ/w″)`; `Vand(e′(τ))` has `m²/2` factors at most `ϑ`, giving `O(m²La/k)` after
division; `Vand(v(τ))/Vand(u(τ))` is a product over pairs of factors `(4(l − i) ± 1)/(4(l − i))` for the inner entries
(consecutive entries of `u` differ by at least `3Δ_w`, those of `v` by `4Δ_w`), of logarithm `O(k log k)` per place, and of
the factors involving `u_0(τ)` and `u_{k−1}(τ)`, of logarithm `O(k·La)` at a top place and `O(k log Sc)` elsewhere; the
`L`-values, the factors `1 − g^{−i}` and `2 log Γ₀/(fk) ≤ 2C_Γm⁵x^ε/k` are `O(1)`. The window
`T*(u) < T(u) ≤ (1 + 1/(fk))T*(u)` of ThetaChainsOnDefiniteUnitaryGroups §2.8 passes to `T(u)`. The upper bound uses `w_j ≤ 2b`, `log(g₀g₁) ≤ C·La` (ThetaChainsOnDefiniteUnitaryGroups §2.7) and
`log rd_E ≤ x^ε`. *Two words.* The first and last entries and `v(τ)` are shared (ThetaChainsOnDefiniteUnitaryGroups §2.3); the inner entries are
`u_l(τ) = v_{l−1}(τ) − ½ − 𝔴(u)_lΔ_w`, so for inner `i < j`, `u_i(τ) − u_j(τ) = (4(j − i) + 𝔴_j − 𝔴_i)Δ_w`. In the quotient of the
inner factors of two words the powers of `Δ_w` cancel, and with `s_{ij} := (𝔴_j − 𝔴_i)/(4(j − i)) ∈ [−¼, ¼]` its logarithm is
`Σ_{i<j}(log(1 + s_{ij}) − log(1 + s′_{ij}))`, where `|log(1 + s) − s| ≤ s²`; `Σ_{i<j} s_{ij} = ¼Σ_l 𝔴_l(H_{l−1} − H_{k−2−l})` (harmonic
numbers), and `Σ_{l≤k−2}|H_{l−1} − H_{k−2−l}| ≤ 3k` (`|H_a − H_b| ≤ |log((a + 1)/(b + 1))| + 1` and `∫_0^1|log(t/(1 − t))|dt = 2 log 2`),
while `Σ_{i<j}s_{ij}² ≤ (k/16)·π²/6`; so the inner quotient lies in `[e^{−2k}, e^{2k}]`. The factors with the first entry: off the
tops `u_0(τ) − u_l(τ) = (u_0(τ) − v_0(τ) + ½) + 4(l − 1)Δ_w + 𝔴_lΔ_w` with `u_0(τ) − v_0(τ) ≥ Sc` (the cloud gap of
ThetaChainsOnDefiniteUnitaryGroups §2.3b; `u_0(τ) − u_l(τ) = Sc + 1 + 4(l − 1)Δ_w + 𝔴_lΔ_w` at the values of 10.6), so the
quotient for two words is at most `1 + Δ_w/Sc = 1 + 1/(4k)` for each `l`, in all at most `e^{1/4}`; at a top `u_0(τ) ≥ a` while the inner entries lie in `[0, Sc]`, and the quotient is at most
`2`. The factors with the last entry likewise give at most `e·(4/3)·k^{1/3}`
(at most `2` at a top, where `|u_{k−1}(τ)| ≥ b′`). So, for
`x ≥ x₀`, `|log(Vand(u(τ))/Vand(u′(τ)))| ≤ 3k ≤ k·log A_V`. By ThetaChainsOnDefiniteUnitaryGroups §2.8 and 9.3, `d*_u` is a word-independent factor times
`∏_τ Vand(u(τ))`, so `T*(u)/T*(u′) = ∏_τ(Vand(u′(τ))/Vand(u(τ)))^{1/(fk)} ∈ [e^{−3}, e^3]`, and the window
`T*(u) < T(u) ≤ (1 + 1/(fk))T*(u)` gives `A_V^{−1} ≤ T(u)/T(u′) ≤ A_V`. (d) From (c), since `w_j(τ) ≥ w″` and `m·log w″` exceeds
`C(La + m²La/k) + 2·log(g₀g₁·rd_E)` for `x ≥ x₀`; for the second claim, `log(g₀g₁) > 16·log(kb) = 16(log k + x^ε)` (`SizeG`),
`w″ ≥ 2π`, and `16m·log k` exceeds `C(La + m²La/k) ≤ 4C·x^ε` for `x ≥ x₀` (`m ≥ x^{1/3}`); the upper bound with `w_j ≤ 2b`,
`log(g₀g₁) ≤ 2C_g·x^ε + 2 log 2` (`SizeG`) and `log rd_E ≤ x^ε`. (When `g_i ≍ (kb)^8` the leading term is
`log T(u) = (17 + o(1))·m·x^ε`: `16·m·x^ε` from the indices, `m·x^ε` from the Vandermonde quotient.)

*Check.* For `m = 2` (`r = k + 1`) there is one mass ratio (`M = k + 1`, with factorial `(k!)^f`),
`log(i_row/i_col) = f(2k + 1)·log(g₀g₁) + f·Σ_{g∈{g₀,g₁}} log(1 − g^{−(k+1)})`, and the Weyl denominators differ by
`∏_{i<k+1}i!/∏_{i<k}i! = k!` at each of the `f` places: the factorials cancel. The index exponent: the level group `P_1`
has order `g^{r(r−1)/2 − k}` on the row side and `U_k(𝔽_g)` order `g^{k(k−1)/2}` on the column side, and
`r(r+1)/2 + k − k(k+1)/2 = m(2k + m − 1)/2`, which is `2k + 1` at `m = 2`.

*NEW* design, *KNOWN* formulas (Siegel; Shimura; Gan–Hanke–Yu; Harish-Chandra; Weyl). (c), the two words: follows from [FormalProof], `Formalism/SharpRestriction/CuspSpanNormBounds/ThresholdCubicInequalitySignPattern.lean` (`Formalism.MainNotions.Sizes3b`), `Formalism/LocalToGlobal/SiegelLatticeTheory/FlagStabilizerTensors/RootLatticeThresholds/SzHypFam.lean` (`Formalism.L2.SG.Pf.SzHypFam.aSz`); (d), the lower bounds: follows from [FormalProof], `Formalism/SharpRestriction/GlobalSchurBounds/QuadraticLogDerivCongr.lean` (`Formalism.MainNotions.Lnk.Count_at`). *Needs:* ThetaChainsOnDefiniteUnitaryGroups §2.1, ThetaChainsOnDefiniteUnitaryGroups §2.2, ThetaChainsOnDefiniteUnitaryGroups §2.3, ThetaChainsOnDefiniteUnitaryGroups §2.3b, ThetaChainsOnDefiniteUnitaryGroups §2.7, ThetaChainsOnDefiniteUnitaryGroups §2.8,
ThetaChainsOnDefiniteUnitaryGroups §2.9, ThetaChainsOnDefiniteUnitaryGroups §2.9a, RowTowerAndRallisIdentities §5.3, 9.3; HermitianFormsAndLattices §§6.0b, 6.1, 6.2, 6.3, 6.4; AdelicAlgebraicGroups §2.4.

### 9.5 The word code

*Statement.* Let `k ≥ 3`, `Δ_w ≥ 1`, and let the words be those of ThetaChainsOnDefiniteUnitaryGroups §2.3, with parameters
`u_l(τ) = v_{l−1}(τ) − ½ − 𝔴(u)_l·Δ_w` (`1 ≤ l ≤ k − 2`).
(a) *Separation.* Two distinct words `u ≠ u′` differ at a letter `l ∈ {1, …, k − 2}`, and there `|u_l(τ) − u′_l(τ)| = Δ_w`
at every `τ`; consecutive inner entries of every word differ by at least `3Δ_w`. In particular, for `Δ_w > 5` the half-cut
`{5/2 ≤ v_{l−1} + Y ≤ Δ_w/2}` of BesselPoincareSeriesAndGramBounds §5.18a at the index `l` is an interval of length
`(Δ_w − 5)/2`, which is the cut that BesselPoincareSeriesAndGramBounds §5.20 asks.
(b) *Count.* If `2^{k−3} ≥ M := ⌈C₀Γ₀²x^{c_H}⌉` (`C₀ = 3` of ThetaChainsOnDefiniteUnitaryGroups §2.8), a word code with `M` words exists. This holds when
`k ≥ 3 + (2 log Γ₀ + c_H log x + log C₀)/log 2`; for `log Γ₀ = C_Γm⁵f x^ε` and `f = 2|A|` it holds under `SizeW` with
`C_W ≥ 4C_Γ/log 2 + 1` and `x ≥ x₀` (`x₀` depending on `c_H`).
(c) *Redundancy.* If moreover the level primes of ThetaChainsOnDefiniteUnitaryGroups §2.8 exist for all words, then
`Σ_{u∈W} d_u^{all} ≥ M·D*/(C₀Γ₀²) ≥ x^{c_H}·D*`.

*Route.* (a) The bits of a word are the same at every `τ`, and distinct codes differ at a bit; `v_{l−1} − v_l = 4Δ_w`.
(b) Take `M` distinct binary strings of length `k − 2`; `M ≤ C₀Γ₀²x^{c_H} + 1`. (c) The rank window
`d_u^{all}Γ₀²/D* ≥ C₀^{−1}` of ThetaChainsOnDefiniteUnitaryGroups §2.8, summed over the `M` words.

*NEW* (elementary). (a): [FormalProof], `Formalism/SharpRestriction/CuspSpanNormBounds/StandingNumericalData.lean` (`Formalism.MainNotions.S.StandingNumericalData`); (c): follows from [FormalProof], `Formalism/SharpRestriction/GlobalSchurBounds/TopDensityNGeSixteen.lean` (`Formalism.MainNotions.Lnk.frame_at_of`). *Needs:* ThetaChainsOnDefiniteUnitaryGroups §2.1, ThetaChainsOnDefiniteUnitaryGroups §2.3, ThetaChainsOnDefiniteUnitaryGroups §2.8, BesselPoincareSeriesAndGramBounds §5.18a.

### 9.6 The slope inequality of the chain

*Statement.* Fix a translate `u₀`, its word code `W` (9.5 with
`M = ⌈C₀Γ₀²x^{c_H}⌉`) and the family `(B_u : N′_u → R^∨)_{u∈W}` of GluedTargetAndDivisionInequality §7.14. Assume: `d_u > 0` for every `u ∈ W` and
`𝔼 ≠ 0`; the hypotheses of BesselPoincareSeriesAndGramBounds §5.20 for every pair of distinct words of `W` and those of BesselPoincareSeriesAndGramBounds §5.21 for every word, with `e_diag < 1 − δ_old(u)` (so that `P_u` is nonzero on the `T(u)`-new forms, BesselPoincareSeriesAndGramBounds §5.21 (v)); the hypotheses of BesselPoincareSeriesAndGramBounds §5.23;
the hypotheses of GluedTargetAndDivisionInequality §7.14 (among them those of LocalGainOfThetaChains §4.16 (ii), of LocalGainOfThetaChains §4.16b at the places above `T(u)`, and of RowTowerAndRallisIdentities §5.8b), those of SeesawForThetaChains §6.14 and
of SeesawForThetaChains §6.15 (among them `Size_□` of RowTowerAndRallisIdentities §5.8e and the condition (L1)–(L7) of
RowTowerAndRallisIdentities §5.8 on `𝕃`), and
those of GluedTargetAndDivisionInequality §8.9 (`SizeT_u`, `|(L′/L)(1, χ_K)| ≤ x^ε`, `a⁻_τ ≤ 2b′` at the tops and the
hypotheses of GluedTargetAndDivisionInequality §8.8). Put

`s̄ := Σ_u d_u(μ(N′_u) − h_u)/Σ_u d_u`,  `u_F := max_u(μ_max(N′_u) − h_u) − s̄`,
`ϑ_T := 1 − Σ_u d_u/Σ_u d_u^{all} ≤ max_u δ_old(u)`,

with `η_off` of BesselPoincareSeriesAndGramBounds §5.20, `e_diag` of BesselPoincareSeriesAndGramBounds §5.21 (iii), `η_dim = ε_C` of BesselPoincareSeriesAndGramBounds §5.21 (iv) and `δ_bad` of BesselPoincareSeriesAndGramBounds §5.23 (stated for the full column
spaces `ℳ_0(u)` of dimension `d_u^{all}`). Suppose `x^{−c_H} ≤ 1/20`, `−1 ≤ η_off ≤ x^{−c_H}/2`, `η_dim ≤ x^{−c_H}/2`,
`√e_diag ≤ x^{−c_H}/2` and `ϑ_T ≤ 1/4`, and put `η_frame := 5x^{−c_H} + 3√ϑ_T`, `e_frame := 2e_diag` (so `e_frame ≤ 1/4`). Then:
(a) for every `H ≥ max(0, s̄ − μ_min(R^∨))`:
`s̄ − (1 − δ_bad)^{−1}·( 4u_F·log(1 + H/u_F) + (η_frame + 4√e_frame)·H ) ≤ μ(R^∨)` (the first term `0` when `u_F = 0`);
(b) if moreover the hypotheses of GluedTargetAndDivisionInequality §8.23 and GluedTargetAndDivisionInequality §8.24 hold, there is `c_H⁰ ≥ 1`, depending
on `ε` and on the constants chosen before the scale, such that for `c_H ≥ c_H⁰` and `x ≥ x₀(c_H)`: `s̄ + μ_max(R) ≤ x^{c_H}·b`.
Hence `H = x^{c_H}·b` is admissible in (a).
The exponent `c_H` is thus chosen after `ε`; it is both the exponent of the word count of 9.5 (through `η_frame`) and the
exponent of the slope range `H`. It never multiplies `ε` in an exponent of 10.4–10.5: it enters only through
`log(1 + x^{c_H}) ≤ (1 + c_H)x^ε` and through `(η_frame + 4√e_frame)·x^{c_H}`, which stays bounded because the redundancy
defect of `η_frame` is `5x^{−c_H}`. (With a word code of `⌈C₀Γ₀²x^{c_F}⌉` words and the slope range `x^{c_H}b`, the argument uses
`c_F ≥ c_H`, so that `x^{c_H}·x^{−c_F} ≤ 1`; the chain takes `c_F = c_H`.)

*Route.* (a) This is the slope inequality for nearly tight frames, SlopesOfHermitianVectorBundles §5.5 with `κ_e ≤ 4` for
`e ≤ 1/4`, in the normalisation `μ = 2μ̂`, `ht = 2h` (the statement is homogeneous in the dictionary of the
Conventions). The pairing is linear in the column and conjugate-linear in the row (ThetaChainsOnDefiniteUnitaryGroups §3.9; SeesawForThetaChains §6.15 (a): `σ₀^{−1}B_u` is `𝕃`-linear
in `φ` and `c_𝕃`-semilinear in the row), so `B_u : N′_u → R^∨` is `𝕃`-linear (GluedTargetAndDivisionInequality §7.13, GluedTargetAndDivisionInequality §7.14; `R^∨` is the lattice of
`c_𝕃`-semilinear functionals integral on `R`, and `μ_min(R^∨) = −μ_max(R)`). Sources `N′_u`, target `R^∨`, heights: `B_u(N′_u) ⊂ R^∨` (GluedTargetAndDivisionInequality §7.14) makes the finite-place part of
Bost's height nonpositive, so `2h(B_u) ≤ ht(B_u) ≤ h_u` (GluedTargetAndDivisionInequality §8.9), the metric on `R^∨` being that of GluedTargetAndDivisionInequality §8.9 (dual to the metric of
RowTowerAndRallisIdentities §5.12 on `𝔼` divided by `|P_1|`: a constant rescaling, which changes neither the frame defects nor the form of (a)). Frame data at the embedding `σ₀` of ThetaChainsOnDefiniteUnitaryGroups §2.6: `ℋ` the space of
all rows (`dim = D_all`), `π` the orthogonal projection onto the target rows `𝔼`, identified with `R^∨ ⊗_{σ₀} ℂ` by
`y ↦ ⟨V·, y⟩_ℋ`, which is `ℂ`-linear because the Petersson product is conjugate-linear in its first variable (ThetaChainsOnDefiniteUnitaryGroups §3.1), so `π`
and the lifts are `ℂ`-linear as SlopesOfHermitianVectorBundles §5.5 requires; `D_all − D_rows ≤ δ_bad·D_all` (BesselPoincareSeriesAndGramBounds §5.23). By SeesawForThetaChains §6.14 (d),
`B_u(φ)(x) = a_u·⟨Vx, P_u(U_uφ)⟩_ℋ` with one `V` for all words (SeesawForThetaChains §6.14 (d): `V` is the identification of SeesawForThetaChains §6.13 (o)
composed with a central translation common to all words): the map `φ ↦ B_u(φ)` corresponds to `φ ↦ a_u·P_u(U_uφ)` with
`U_u` an isometry of the new forms, and `a_u ≠ 0` because `P_u` is nonzero on them. (One `V` is needed: the frame inequality
uses one projection and one identification of its image with the target; with an embedding `V_u` depending on the word the
family `V_u^*P_u` need not be a frame, even when each `V_u` preserves the good rows: in `ℂ²` the orthonormal images `(1, 1)/√2`,
`(1, −1)/√2` and `V_1 = 1`, `V_2 = diag(1, −1)` give one image twice.)
First take the family on the full column spaces: `P_u : ℳ_0(u) → ℋ` (BesselPoincareSeriesAndGramBounds §5.14) with weights `1/c₀(u)`, so that the weighted
Gram operators are the `K(u, u′)` of BesselPoincareSeriesAndGramBounds §5.15; the pairwise bounds BesselPoincareSeriesAndGramBounds §5.20 (distinct words, separated by 9.5 (a)), BesselPoincareSeriesAndGramBounds §5.21 (iii)
(equal words, with the rank window of ThetaChainsOnDefiniteUnitaryGroups §2.8), `D_all ≤ (1 + ε_C)D*` (BesselPoincareSeriesAndGramBounds §5.21 (iv)) and the redundancy
`Σ_u d_u^{all} ≥ x^{c_H}·D*` (9.5 (c)) give the frame inequalities
(SlopesOfHermitianVectorBundles §5.6 with `ϖ = x^{−c_H}`). Then compress to the subspaces of `T(u)`-new forms, of total
codimension `ϑ_T·Σ_u d_u^{all}` (ThetaChainsOnDefiniteUnitaryGroups §3.8 (b); SlopesOfHermitianVectorBundles §5.7). The frame
inequalities hold with the defect `5x^{−c_H}` before compression and `5x^{−c_H} + 3√ϑ_T`, `2e_diag` after it; the exact values
`(1 + η_W)/(1 − κ_T)² − 1` and `e_diag/(1 − ϑ_T)` of SlopesOfHermitianVectorBundles §§5.6–5.7 (that roadmap's own
sharpening), with
`η_W := max(0, (1 + η_dim)(1 + η_off + (1 + √e_diag)²x^{−c_H})/(1 − √e_diag)² − 1)` and
`κ_T := (ϑ_T + √(ϑ_T e_diag))/(1 − √e_diag)`, are smaller and may be used instead where those targets are established in
that form. Finally
precompose with the isometries `U_u` (which change neither the frame operator nor the defects) and multiply the lift by
`a_u` and the weight by `|a_u|^{−2}` (which change neither): the size of `a_u` never enters. (b) `μ_min(R^∨) = −μ_max(R)`
(SlopesOfHermitianVectorBundles §2.2), and `s̄ ≤ max_u(μ_max(N′_u) − h_u)`. By 9.2 (c) and 9.1 (d),
`μ_max(N′_u) ≤ C|Φ_top|a·La + 𝒩 + F_tot − E_tot(u)`, where `𝒩 ≤ C·m|Φ_top|a·log X″` (the gains are at most `4|Φ_top|a/p` per place and
lift, LocalGainOfThetaChains §4.17a (ii), summed over `p ≤ X″` by Mertens' first theorem, AnalyticNumberTheoryPartI §0.11), `F_tot` is at most a polynomial in `x` times `b` (LocalGainOfThetaChains §4.9f (d)) and `−E_tot(u) ≤ C·m·B₀` (GluedTargetAndDivisionInequality §8.23 (a)). In `−h_u` the term
`+log 𝔫` is added to `μ_max(R)`, and GluedTargetAndDivisionInequality §8.24 bounds the sum by `x^C·b` (its exponent `C` is
chosen after `ε`, GluedTargetAndDivisionInequality §8.24 (a)); the other terms of `h_u` are bounded in
absolute value by polynomials in `x` times `b` (GluedTargetAndDivisionInequality §8.9 with the top term `t_u` of GluedTargetAndDivisionInequality §8.7 (b), GluedTargetAndDivisionInequality §8.23 and the sizes of ThetaChainsOnDefiniteUnitaryGroups §2.1). Take `c_H⁰` one more
than the largest exponent so obtained (these exponents are not computed here, so no value of `c_H⁰` is given); these exponents are not claimed independent of the constants chosen with `ε` (the sizes of the auxiliary pair
enter through `F_tot` and `h_u`), which is why `c_H` comes after `ε`. On the frame side, the defects `η_off`, `η_dim = ε_C`,
`e_diag` and `ϑ_T` of BesselPoincareSeriesAndGramBounds §5.20, BesselPoincareSeriesAndGramBounds §5.21 and ThetaChainsOnDefiniteUnitaryGroups §3.8 are smaller than every negative power of `x` at the parameters (`η_off ≤ b^{−6}`), so
the smallness hypotheses above and `3√ϑ_T + 4√(2e_diag) ≤ x^{−c_H}` hold, and `(η_frame + 4√e_frame)·x^{c_H} ≤ 6`, for `x ≥ x₀(c_H)`.

*NEW* (instance). *Needs:* ThetaChainsOnDefiniteUnitaryGroups §3.8, LocalGainOfThetaChains §4.9f, LocalGainOfThetaChains §4.17a, BesselPoincareSeriesAndGramBounds §5.14, BesselPoincareSeriesAndGramBounds §5.15, BesselPoincareSeriesAndGramBounds §5.20, BesselPoincareSeriesAndGramBounds §5.21, BesselPoincareSeriesAndGramBounds §5.23, SeesawForThetaChains §6.14, SeesawForThetaChains §6.15, GluedTargetAndDivisionInequality §7.13, GluedTargetAndDivisionInequality §7.14, GluedTargetAndDivisionInequality §8.7, GluedTargetAndDivisionInequality §8.8, GluedTargetAndDivisionInequality §8.9, GluedTargetAndDivisionInequality §8.23, GluedTargetAndDivisionInequality §8.24, 9.1, 9.2,
9.5; SlopesOfHermitianVectorBundles §§2.2, 5.5, 5.6, 5.7; AnalyticNumberTheoryPartI §0.11.

### Examples

For `m = 2` (`r = k + 1`) rank matching has one mass ratio, carrying the factorial `(k!)^f`, which cancels against the
quotient `∏_{i<k+1}i!/∏_{i<k}i! = k!` of the Weyl denominators at each of the `f` places; the index term is
`f(2k + 1)·log(g₀g₁) + f·Σ_{g∈{g₀,g₁}} log(1 − g^{−(k+1)})`, the exponent `2k + 1` being `m(2k + m − 1)/2` at `m = 2` (9.4, Check).
In `ℂ²` the orthonormal images `(1, 1)/√2` and `(1, −1)/√2`, read through the embeddings `V_1 = 1` and `V_2 = diag(1, −1)`,
give one image twice, so the frame inequality of 9.6 needs one identification `V` of the target rows for all words
(9.6, route). Without tops the lower bound of 9.1 (d) fails: then `μ(M_u) < 0`, while its left side is `0`.

### Dependencies

ThetaChainsOnDefiniteUnitaryGroups §§2.1, 2.2, 2.3, 2.3b, 2.6, 2.7, 2.8, 2.9, 2.9a, 3.1, 3.6, 3.8, 3.9;
LocalGainOfThetaChains §§4.9e, 4.9f, 4.16, 4.16b, 4.16c, 4.17a; RowTowerAndRallisIdentities §§5.3, 5.8, 5.8b, 5.8e, 5.12;
BesselPoincareSeriesAndGramBounds §§5.14, 5.15, 5.18a, 5.20, 5.21, 5.23; SeesawForThetaChains §§6.13, 6.14, 6.15;
GluedTargetAndDivisionInequality §§7.13, 7.14, 8.7, 8.8, 8.9, 8.20, 8.21, 8.23, 8.24; IntegralWeylModulesOfGeneralLinearGroups
§§3.2, 3.4; HermitianFormsAndLattices §§4.12, 6.0b, 6.1, 6.2, 6.3, 6.4; SlopesOfHermitianVectorBundles §§1.2, 1.7, 2.1, 2.2,
2.4, 5.5, 5.6, 5.7; DiscreteSeriesCoefficientsAndAutomorphicMetrics §8.3; AutomorphicFormsOnReductiveGroups §2.4;
GeometryOfNumbersAndQuadraticArithmetic §4.4.13; AdelicAlgebraicGroups §2.4; ClassicalGroups §5.1;
AnalyticNumberTheoryPartI §0.11; Mathlib's Chebyshev bound.

## Layer 10: The Frobenius-restricted inequality and the windowed bound

Chain data collect what the roadmaps of the chain and Layer 9 build at one scale and for one translate, with the standing hypotheses the later
targets use (10.0). The local gains turn into the Frobenius-restricted Riesz sum `ℛ` (10.1), up to losses of the order
of one weight per top place and per lift (10.2). The source slopes, the division inequality, rank matching and the
slope inequality combine, for every translate, into `Σ(ℛ − 𝔐) ≤ 𝔈_tot` (10.4), the main term coming out of an exact
identity (10.3) in which the Chowla–Selberg period cancels against the mass formula and the type primes cancel between
the level cost and the level prime. The error budget is checked term by term (10.5); explicit parameters (10.6) satisfy
every size condition at every large scale (10.6a–10.6d); the hosts exist at every scale and carry the wild-kernel budget
on windows (10.7); the chain does not vanish (10.8); at every scale of the windows the constructions give chain data for
every translate (10.9), and FrobeniusRestrictedRieszSums §1.9 converts the inequality at every translate into the
windowed bound (10.10, 10.11).

### 10.0 Chain data

*Definition.* Let `ψ` be a primitive Dirichlet character, `(x, ε)` a scale (ThetaChainsOnDefiniteUnitaryGroups §2.1) and `m ≥ 2`
even. *Chain data of length `m` at the scale `(x, ε)` with translate `u₀`* consist of:
- (D1) a host `E` of FrobeniusRestrictedRieszSums §0.4 for `ψ` (layer `n`, auxiliary pair `(q, d)`, groups `A₀ ⊂ A`); tops `Φ_top ⊂ A` selected as in
  LocalGainOfThetaChains §4.17d, with a symmetric coset law of precision `η_top` (FrobeniusRestrictedRieszSums §0.7) and the bound `Z_bad ≤ |Φ_top|·x^{−2+ε}` of LocalGainOfThetaChains §4.17d on the
  weighted count `Z_bad` of the unserved tops (LocalGainOfThetaChains §4.17); a thick set `𝒯 ⊂ A₀` of length `L_th` (FrobeniusRestrictedRieszSums §0.8a); and a translate
  `u₀ ∈ A₀`;
- (D2) ranks `(k, m, t)` for `f` (ThetaChainsOnDefiniteUnitaryGroups §2.1) and the numbers of the scale (ThetaChainsOnDefiniteUnitaryGroups §2.1);
- (D3) a chain weight datum adapted to `Φ_top`, `𝒯`, `u₀`, the scale and a letter step `Δ_w` (ThetaChainsOnDefiniteUnitaryGroups §2.3), with top weights `a_τ`
  (`τ ∈ Φ_top`) and step weights `w_{u₀,j}`, and a word code `𝔴 : W ↪ {0, 1}^{k−2}`;
- (D4) Hecke characters (ThetaChainsOnDefiniteUnitaryGroups §2.4), a twisting datum with sign `s = +1` (ThetaChainsOnDefiniteUnitaryGroups §2.5) whose set `Z₀` consists of the places above the level primes `T(u)` and
  above `p_□` (RowTowerAndRallisIdentities §5.8a), satisfying (T1), (T2) of ThetaChainsOnDefiniteUnitaryGroups §2.5 and (T3) of GluedTargetAndDivisionInequality §8.20, the fields `𝕂 ⊂ 𝕃` of
  ThetaChainsOnDefiniteUnitaryGroups §2.6, `𝕃` containing the numbers (L1)–(L7) of RowTowerAndRallisIdentities §5.8 for the base tuple and the tuples of the
  twisting datum, type and auxiliary primes (ThetaChainsOnDefiniteUnitaryGroups §2.7), a level prime `T(u)` for each word (ThetaChainsOnDefiniteUnitaryGroups §2.8), the level structures
  of ThetaChainsOnDefiniteUnitaryGroups §2.9, and the grid of the chain (RowTowerAndRallisIdentities §5.8a) with its chosen places;
- (D5) the served data of the gain: the sets `𝒱_p`, Hecke types, depth data and the set `Drop` of LocalGainOfThetaChains §4.17, with the top
  weights chosen as in LocalGainOfThetaChains §4.17c.
From these, the roadmaps of the chain construct the chain lifts and the period, the lattices `M_u^{all}`, `M_u` (ThetaChainsOnDefiniteUnitaryGroups §3.8), `N_u` (LocalGainOfThetaChains §4.16),
`N′_u`, `R`, `R^∨` (GluedTargetAndDivisionInequality §7.13), the pairings `B_u` (SeesawForThetaChains §6.14, GluedTargetAndDivisionInequality §7.14) and the quantities of GluedTargetAndDivisionInequality §8.9, GluedTargetAndDivisionInequality §8.21, GluedTargetAndDivisionInequality §8.23 and 9.2. The *standing
hypotheses* of chain data are:
- (H1) *sizes:* `Size(x, ε)` (ThetaChainsOnDefiniteUnitaryGroups §2.1, with the window constant `J` and the exponent `c_H` fixed before the scale), `SizeDep`
  (ThetaChainsOnDefiniteUnitaryGroups §2.1, `C_dep = 11`), `SizeSc` (ThetaChainsOnDefiniteUnitaryGroups §2.3b), `SizeG` (ThetaChainsOnDefiniteUnitaryGroups §2.7), `SizeT_u` for every word (ThetaChainsOnDefiniteUnitaryGroups §2.8); `Φ_top ≠ ∅` (9.1 (d)); `2^n ≥ x²` and `d ≥ x²`; the size conditions of
  LocalGainOfThetaChains §4.10 and LocalGainOfThetaChains §4.16a; the hypotheses of LocalGainOfThetaChains §4.10a, of LocalGainOfThetaChains §§4.15d–4.15f and of LocalGainOfThetaChains §4.17 at its parameters, and for the chosen data the conclusions of
  LocalGainOfThetaChains §4.17a (ii) at every prime `p ≤ X″` inert in `K` outside `Drop`, of LocalGainOfThetaChains §4.17c and of LocalGainOfThetaChains §4.17d; `k ≥ x²·s_max³·log a`,
  `Λ_log ≤ x^{2ε}` and `X″·(Sc + k + ϑ)·log(2a) ≤ b`; the size conditions of CongruenceModulesOfThetaLifts §7.10a (among them `SizeThin` of CongruenceModulesOfThetaLifts §7.6 (a), and `b ≥ 100`
  and `2(η_s + t + 1) + Sc ≤ b/10`, which its rows use) and its depth hypothesis on the length `L_th` of the thick set (for every
  prime `ℓ ≥ 11` some `j ≥ 0` has `(ℓ − 1)^j ≥ ℓ_A` and `2j + 2 ≤ L_th`) and the length bound `L_th ≤ C_L·log x` of
  CongruenceModulesOfThetaLifts §7.10c; `f² ≤ rd_E`;
  the conditions of GluedTargetAndDivisionInequality §8.20 on the logarithmic size `L = x^ε`; the size conditions of ThetaChainsOnDefiniteUnitaryGroups §2.6 at
  `L = x^ε` (`r ≥ 62`, `f ≥ 8`, `L ≥ 4`, `log f ≤ L`, `log g_i ≤ 9L + 1`, `log p_δ, log p′_δ ≤ L`, `log rd_E ≤ 2L`), `3` and `5` split
  in `K`, `gcd(15, g₀g₁) = 1` and `(f·r·x^ε)^{12} ≤ b`; the conditions (N0) and (N2) of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a
  (`SizeGen`, with `R_E = rd_E^{C_R}`) at the degree `T = T_O` for the weights with (N1) at `T = T_O`; the size conditions of
  GluedTargetAndDivisionInequality §8.20b and of GluedTargetAndDivisionInequality §8.22 (weights with (N1), (N2) and the page conditions `SizePage` of GluedTargetAndDivisionInequality §8.20 exist by GluedTargetAndDivisionInequality §8.20 (vii), and witnesses of
  the size conditions `SizeSG` by ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18c (f) (ii), given witnesses `h₀`, `S_u`, `η_u` of the gap
  conditions there; at the parameters of the chain the witnesses are the node gap `h₀` of 10.6, `S_u = Sc` and `η_u = m·h₀`
  for every word, with `P·(Sc + m·h₀) ≤ 100·w″` (kind (K3)) and, for the degree `T = ⌈P²·D_Y²·k/m⌉` of the deep covers,
  `4T² ≤ h₀` and `P·T·r·f²·m²·k·D_Y ≤ h₀` (polynomials in `x`: they hold for `c_h ≥ c_h⁰`)), the hypotheses
  `r + 1 < g₀, g₁`, `q_z ≤ ¼` (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18c (e)) and (H1)–(H3) of
  ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18f (c) of GluedTargetAndDivisionInequality §8.22,
  and the cost condition `𝔢_u·log T(u) ≤ C·B₀` of GluedTargetAndDivisionInequality §8.23; `T(u) ≥ b³`, `b ≥ 4f` and `Σ_𝔭 sz_𝔭(τ_N(𝔭)) ≤ b²` (9.2); the
  hypotheses of BesselPoincareSeriesAndGramBounds §5.20, BesselPoincareSeriesAndGramBounds §5.21 and BesselPoincareSeriesAndGramBounds §5.23 as 9.6 asks them;
  `Size_□` (RowTowerAndRallisIdentities §5.8e), and `x ≥ x₀` for the `x₀` of its Statement;
- (H2) *the host:* the host is inert-free up to `B_s` (FrobeniusRestrictedRieszSums §0.3), with `B_s ≥ max(12, x^{c_s})` as LocalGainOfThetaChains §4.17 asks (so every prime
  inert in `K` is at least `13`; in particular `3` splits in `K`; `SizeInert` of ThetaChainsOnDefiniteUnitaryGroups §2.1 is this with `c_s = ε/(5J)`), and it
  satisfies `HostSplitting E` (`4 | f`, and every place of `F` above a prime dividing `f_E` splits in `E`, FrobeniusRestrictedRieszSums §0.3; ThetaChainsOnDefiniteUnitaryGroups Layer 3
  assumes the second condition), so that the splitting character `η̃` of ThetaChainsOnDefiniteUnitaryGroups §2.4 (b) exists and `f ≥ 4` (ThetaChainsOnDefiniteUnitaryGroups §2.4 (b)); this covers
  the degree conditions on the totally real field in ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties and GluedTargetAndDivisionInequality (`f ≥ 2` for Koecher's principle in ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18,
  and `[F:ℚ] ≥ 3` in ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18f (d), ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19 (b), GluedTargetAndDivisionInequality §8.22 and GluedTargetAndDivisionInequality §8.24 (b)), and under `Size(x, ε)` in fact `f = 2|A| ≥ 2x^{A_n}`;
- (H3) *good twists:* the twisting datum is good (CongruenceModulesOfThetaLifts §7.10a: every `ψ_𝔭` an `ℓ^{−2}`-good twist at `𝔭`, CongruenceModulesOfThetaLifts §7.8 (2)), and `ξ_{c_𝕃(𝔭)} = ξ_𝔭` (ThetaChainsOnDefiniteUnitaryGroups §2.5);
- (H4) *wild-kernel budget:* the host has wild-kernel budget `κ_W = 1` (CongruenceModulesOfThetaLifts §7.11): every `Ш¹(E, ℓ, e)`, `ℓ` prime, `0 < e < t`, is finite and
  `V(E, t) ≤ x^ε·B₀`;
- (H5) *nonvanishing:* `d_u > 0` and `e_diag < 1 − δ_old(u)` for every word `u`, `𝔼 ≠ 0` and `𝔼_0 ≠ 0`
  (`e_diag < 1 − δ_old(u)` is used for 10.8 (c) only);
- (H6) *frame:* `x^{−c_H} ≤ 1/20`, `−1 ≤ η_off ≤ x^{−c_H}/2`, `η_dim ≤ x^{−c_H}/2`, `√e_diag ≤ x^{−c_H}/2`, `ϑ_T ≤ 1/4` (9.6)
  and `c_H ≥ c_H⁰` (9.6 (b); `c_H` is chosen after `ε`).

The place conditions among the hypotheses of RowTowerAndRallisIdentities §5.8b are supplied by (H1)–(H2) through ThetaChainsOnDefiniteUnitaryGroups §2.2 (g), ThetaChainsOnDefiniteUnitaryGroups §2.4 (b), ThetaChainsOnDefiniteUnitaryGroups §2.5 and the
  auxiliary place of the grid (RowTowerAndRallisIdentities §5.8a).

*Route.* Definitions; each item is constructed where it is cited.

*Check.* What holds where: the host data, with (H2), at every large scale (10.7 (a); `HostSplitting E` by 10.7 (a) (v)); (H5)
and (H6) at every large scale (10.6a–10.6d, 10.8); (H1) at every large scale (the conclusion of LocalGainOfThetaChains §4.17a (ii) by LocalGainOfThetaChains §4.17a;
10.6d with ThetaChainsOnDefiniteUnitaryGroups §2.6, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18 (o) and the setting of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §§8.11–8.19, whose conditions
on the host (`d ≡ 7 (mod 16)` prime, `E/F` unramified at every finite place) a host of FrobeniusRestrictedRieszSums §0.4 satisfies, by its hypotheses and its clause (i)); (H4) on the windows of 10.7 (b)
only; (H3) for the twisting datum chosen by CongruenceModulesOfThetaLifts §7.8 (2) under its hypotheses (10.9 (c)).
By (H1), `2^n ≥ x² ≥ 4`, so the layer is `n ≥ 2` and `2` is ramified in `E ⊃ ℚ_n` (FrobeniusRestrictedRieszSums §0.4), while
`K = ℚ(√−d)` with `d` prime: these are the hypotheses of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19b on the field (`2` ramified in `E`, `K = ℚ(√−D)` with `D`
a prime, here `D = d`), in whose setting ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19d gives the twisted theta values that GluedTargetAndDivisionInequality §8.19e (a) turns into conditions of the twist selection of
10.9 (c). So all the standing hypotheses hold, for
every translate, at the scales of the window set of 10.7 (b), and nothing is asserted at a scale outside that set: the windows
of the headline are those of 10.7 (b).

*NEW* (definition). (H1) follows from [FormalProof], `Formalism/SharpRestriction/ElevenLe.lean` (`Formalism.MainNotions.SizesAt`), `Formalism/LocalRingCardinality/DataParams.lean` (`Formalism.BasicNotions.ParameterChoice'`), `Formalism/SharpRestriction/GlobalSchurBounds/QuadraticLogDerivCongr.lean` (`Formalism.MainNotions.Lnk.Win_at`); (H5), its clauses `d_u > 0`, `𝔼 ≠ 0` and `𝔼_0 ≠ 0`, follows from [FormalProof], `Formalism/SharpRestriction/GlobalSchurBounds/QuadraticLogDerivCongr.lean` (`Formalism.MainNotions.Lnk.Lat_at`), `Formalism/LocalToGlobal/IndefiniteForms/IndefiniteTree/ExampleSatisfiesConditionsAtFive.lean` (`Formalism.L2.Indef.Tree.RankRows`). *Needs:* FrobeniusRestrictedRieszSums §0.3, FrobeniusRestrictedRieszSums §0.4, FrobeniusRestrictedRieszSums §0.7, FrobeniusRestrictedRieszSums §0.8a, ThetaChainsOnDefiniteUnitaryGroups §§2.1–2.9, ThetaChainsOnDefiniteUnitaryGroups §2.3a, ThetaChainsOnDefiniteUnitaryGroups §3.8, LocalGainOfThetaChains §4.9e, LocalGainOfThetaChains §4.10, LocalGainOfThetaChains §4.10a, LocalGainOfThetaChains §4.15d, LocalGainOfThetaChains §4.15e, LocalGainOfThetaChains §4.15f, LocalGainOfThetaChains §4.16, LocalGainOfThetaChains §4.16a, LocalGainOfThetaChains §4.17, LocalGainOfThetaChains §4.17a,
LocalGainOfThetaChains §4.17c, LocalGainOfThetaChains §4.17d, RowTowerAndRallisIdentities §5.5, RowTowerAndRallisIdentities §5.8, RowTowerAndRallisIdentities §5.8a, RowTowerAndRallisIdentities §5.8b, RowTowerAndRallisIdentities §5.8d, RowTowerAndRallisIdentities §5.8e, BesselPoincareSeriesAndGramBounds §5.20, BesselPoincareSeriesAndGramBounds §5.20a, BesselPoincareSeriesAndGramBounds §5.21, BesselPoincareSeriesAndGramBounds §5.23, SeesawForThetaChains §6.14, CongruenceModulesOfThetaLifts §7.5a, CongruenceModulesOfThetaLifts §7.6, CongruenceModulesOfThetaLifts §7.8, CongruenceModulesOfThetaLifts §7.10a, CongruenceModulesOfThetaLifts §7.10c, CongruenceModulesOfThetaLifts §7.11, GluedTargetAndDivisionInequality §7.13, GluedTargetAndDivisionInequality §7.14, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.11,
ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.14b, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18c, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18e, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18f, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a, GluedTargetAndDivisionInequality §8.19e, GluedTargetAndDivisionInequality §8.20, GluedTargetAndDivisionInequality §8.20b, GluedTargetAndDivisionInequality §8.21, GluedTargetAndDivisionInequality §8.22, GluedTargetAndDivisionInequality §8.23, 9.1, 9.2, 9.6.

### 10.1 Frobenius-restricted sums of the gains

*Statement.* Let the host satisfy `SplitRamification d` (FrobeniusRestrictedRieszSums §0.3), be inert-free up to
`4` (every prime inert in `K` is at least `5`, so that the ledger of LocalGainOfThetaChains §4.9e is defined at every prime inert in `K`; the
consumers 10.2 and 10.4 assume inert-free up to `max(12, x^{c_s})`), and fix a translate `u₀`.
(a) The ledger entries `g^D_j(𝔭)`, `τ_N(𝔭)`, `𝔦(𝔭)` of LocalGainOfThetaChains §4.9e depend on `𝔭` only through `p = p(𝔭)`, do not depend on the
word, and vanish when `p` is not inert in `K`; consequently (`Σ_{𝔭|p}ϱ(𝔭)e_𝔭 = log p`)
`𝒩 = Σ_p 2 log p·(Σ_j g^D_j(p) − τ_N(p))` and `𝔦_tot = Σ_p log p·𝔦(p)` (9.2).
(b) With `V_{j,τ}(p) := Σ_{i odd}(a_τ/p^i − w_{u₀,j}(par_τ(Frob_p^i)))₊` (finitely many nonzero terms),

`Σ_{τ∈Φ_top}Σ_{j=1}^m ℛ(a_τ, τ, w_{u₀,j}) − 𝒩 = Σ_{p unramified in E, inert in K} 2 log p·D_ℛ(p) + D_ℛ(d)`,
`D_ℛ(p) := Σ_jΣ_τ V_{j,τ}(p) − (Σ_j g^D_j(p) − τ_N(p))`,  `D_ℛ(d) := log d·Σ_{j,τ}Σ_{i≥1}(a_τ/d^i − w_{u₀,j}(par_τ(σ_{d,i})))₊`,

`σ_{d,i}` the element of `Fr(d^i) ∖ Φ` (FrobeniusRestrictedRieszSums §1.1 (iv)).

*Route.* (a) The entries are computed from the Frobenius orbits of `Frob_p` on the places of `E`, from the top weights
and the step weights (LocalGainOfThetaChains §4.9 (a), LocalGainOfThetaChains §4.9e (b)–(f), LocalGainOfThetaChains §4.9f (h)), which depend only on `p`, and are defined to be `0` at the primes that are not
inert in `K`; `Σ_{𝔭|p} e_𝔭 f_𝔭 = [𝕃 : ℚ]`. (b) By FrobeniusRestrictedRieszSums §1.1 (iv), under `SplitRamification d` only the odd powers of the primes
inert in `K` and the powers of `d` contribute to `ℛ`, the prime power `p^i` with cap `w_{u₀,j}` read at
`par_τ(Frob_p^i)`; a prime ramified in `E` other than `d` has its Frobenius coset in `Φ` and is split in `K`; the gain
entries vanish at `d` (LocalGainOfThetaChains §4.9e (c), (f)).

*Check.* For constant weights `w`, `y = a/w` and one pair `(j, τ)`:
`Σ_{p inert} 2 log p·Σ_{i odd}(a/p^i − w)₊ + log d·Σ_{i≥1}(a/d^i − w)₊ = w·Σ_{n≤y}(1 − χ_K(n))Λ(n)(y/n − 1)`, because `1 − χ_K(p^i)` is `2` for `p` inert and `i` odd, `0` for `p` split or `i` even,
and `1` at `d` (FrobeniusRestrictedRieszSums §1.1 (iii)); the term at `d` is the share of one pair in `D_ℛ(d)`, which sums
over all `m·|Φ_top|` pairs.

*NEW* (bookkeeping). (a): [FormalProof], `Formalism/LocalToGlobal/GlobalTheory/PowFourLtCeilThresholdPrime.lean` (`Formalism.L2.GlobalTheoryTheory.Loss.unitRule_at`). *Needs:* FrobeniusRestrictedRieszSums §0.3, FrobeniusRestrictedRieszSums §1.1, LocalGainOfThetaChains §4.9, LocalGainOfThetaChains §4.9e, LocalGainOfThetaChains §4.9f, 9.2.

### 10.2 The loss bound

*Statement.* Let the host be a host of FrobeniusRestrictedRieszSums §0.4 (layer `n`, auxiliary pair `(q, d)`) with
`2^n ≥ x²`, `d ≥ x²`, inert-free up to `B_s ≥ max(12, x^{c_s})` as LocalGainOfThetaChains §4.17 asks (so every prime inert in `K` is at least `13`);
let the served data `𝒱_p`, the candidates, the set `Drop` and the top weights be those of LocalGainOfThetaChains §4.17 at its parameters
(`ρ_B ≤ x^{−2}`, `θ_a ≤ 1/x`, `p₀ ≥ x⁴ + 1`, candidates' orbits of length `n′_p ≥ x^{ε/4}`; then `p^{L₁(p)−1} ≥ k²Y_II³ ≥ x²`
for `p < p₀`); assume `Size(x, ε)`, `SizeSc`, `k ≥ x²·s_max³·log a`, `Λ_log ≤ x^{2ε}` (so that the sizes of `ℒ(p)` and `ℒ_f(p)` of
LocalGainOfThetaChains §4.17b hold) and `X″·(Sc + k + ϑ)·log(2a) ≤ b`, and:
(i) the inequality of LocalGainOfThetaChains §4.17a (ii) at every prime `p ≤ X″` inert in `K` outside `Drop` (which LocalGainOfThetaChains §4.17a (ii) gives);
(ii) the bounds of LocalGainOfThetaChains §4.17c for the chosen top weights:
`Σ_{p candidate}(log p/p)·(2·[𝔖(p) > x^{−ε}] + 4·𝔖(p)) ≤ x^{−c_io}` and `Σ_p log p·𝔦(p) ≤ m|Φ_top|a·x^{−c_io}`, `c_io ≥ 1`;
(iii) the bad-top count: `Σ_{p candidate, p∉Drop}(log p/p)·#(Φ_top ∖ Φ_top(𝔭)) ≤ 2|Φ_top|/x` (`Φ_top(𝔭)` of LocalGainOfThetaChains §4.17a (ii); the left
side is at most `Z_bad` of LocalGainOfThetaChains §4.17, and LocalGainOfThetaChains §4.17d gives `Z_bad ≤ |Φ_top|·x^{−2+ε} ≤ 2|Φ_top|/x`
for `x ≥ x₀`).
Then for every translate `u₀` and `x ≥ x₀`:

`𝔦_tot ≤ |Φ_top|·m·b` and `Σ_{τ∈Φ_top}Σ_{j=1}^m ℛ(a_τ, τ, w_{u₀,j}) − 𝒩 ≤ C·|Φ_top|·m·b`,

with `C` depending only on the constants fixed before `ε`.

*Route.* By 10.1 it suffices to bound `Σ_p 2 log p·D_ℛ(p) + D_ℛ(d)` over the primes inert in `K`, which are `≥ 13`. Every prime
`p ≤ X″` inert in `K` is in `Drop` or not; at `p` the whole ask is `Σ_{j,τ}V_{j,τ}(p) ≤ (4/3)·m·Σ_τ a_τ/p`.
*Primes outside `Drop`:* by (i), `D_ℛ(p) ≤ Σ_jΣ_{τ∉Φ_top(𝔭)}V_{j,τ}(p) + m|Φ_top|·ℒ(p) + m·ℒ_f(p)`. The sums of `ℒ` and
`ℒ_f` (LocalGainOfThetaChains §4.17b): the parts `C(Sc + k + ϑ)·lg_p(2a)` cost `≤ C·m|Φ_top|·X″·(Sc + k + ϑ)·log(2a) ≤ C·m|Φ_top|b`; the floors
`ℒ_f` cost `≤ C·m·f·X″·(N_m²·log 2a + log²2a)`; the other parts of `ℒ(p)`, below `X′`, cost at most `C·m|Φ_top|b` by
LocalGainOfThetaChains §4.17b, the term `b′/x` giving exactly `log 4·X′b′/x·m|Φ_top| = log 4·m|Φ_top|b` (`X′b′ = a = xb`), the only bucket of exact
order `m|Φ_top|b`. *Unserved tops of a prime outside `Drop`:* they are the tops whose orbit is not served at a prime `p < X′`
inert in `K` and in `ℚ(√−q)` (`Φ_top(𝔭)` of LocalGainOfThetaChains §4.17a (ii)); such a `p` is a candidate with
`𝔖(p) ≤ x^{−ε}` (the other such primes are in `Drop`), and a candidate without a good place is not dropped: it keeps its
operator-free gain and its tops are unserved (LocalGainOfThetaChains §4.17). Each costs at most
`(4/3)m·a_τ/p`, and (iii) bounds the total by `C·m|Φ_top|a/x = C·m|Φ_top|b`. *Dropped primes* (`g^D = τ_N = 𝔦 = 0`, the whole
ask charged): the candidates with `𝔖(p) > x^{−ε}` cost `≤ C·m|Φ_top|a·x^{−c_io}` by (ii); the primes with orbits shorter
than `x^{ε/4}`, among the primes inert in `K` and in `ℚ(√−q)` with `h_p := c·Frob_p ∈ A` of order `< x^{ε/4}`, and the primes of
conjugate or odd conjugate type (`h_p` of odd order, LocalGainOfThetaChains §4.9 (a), Checks; the primes of odd conjugate type are in
`Drop` at every size, and their whole ask, which LocalGainOfThetaChains §4.17c leaves to the prime sums, is charged here): the restriction of `h_p`
to `ℚ_n` is the class of `p` in `(ℤ/2^{n+2})^×/±1 ≅ Gal(ℚ_n/ℚ)` (`c` acts trivially on the real field `ℚ_n`), a cyclic group of
order `2^n` generated by the class of `5`; its order divides that of `h_p`, so it is `< x^{ε/4}` in the first case and `1` in
the second; the subgroup of order `J′` (`J′` the largest power of `2` below `x^{ε/4}`) is the image of the classes `≡ 1` modulo
`2^{n+2}/J′`, so in both cases `p ≡ ±1 (mod 2^{n+2}/J′)`; summing over the integers `≡ ±1` modulo `2^{n+2}/J′ ≥ 2^{n+2}/x^{ε/4}`
up to `X″` gives `Σ log p/p ≤ 4x^{ε/4}·log X″·(1 + log X″)/2^n ≤ x^{−1}` for `x ≥ x₀`, as `2^n ≥ x²` and
`log X″ ≤ 2x^{ε/3}`; the primes in the band: for each exponent `i ≤ log X′` the primes with `p^i` in the band
`[(1 − ρ_B)X′, (1 + ρ_B)X′]`, `p ≥ p₀`, lie in an interval of relative width `2ρ_B` around `X′^{1/i}`, so
`Σ log p/p ≤ log X′·(4ρ_B + 1/p₀)·log(2X′) = o(1/x)`; the primes `p > X″`: no gain is claimed, and since
`a_τ ≤ a(1 + θ_a)` only the excess of `a_τ` over `a` contributes, at most `2 log(2X″)·(a·θ_a² + w″·θ_a)` per top place and lift,
which is `o(b)`. *The prime `d`:* `D_ℛ(d) ≤ 2m|Φ_top|a·log d/d ≤ m|Φ_top|b` since `d ≥ x²`. *The colength beyond `τ_N`:*
`𝔦_tot = Σ_p log p·𝔦(p) ≤ m|Φ_top|a·x^{−c_io} ≤ m|Φ_top|b` by (ii). Two provisos tie this to LocalGainOfThetaChains: the lattice is divided by
`g^D`, which is `g` off `Drop` and `0` on it, so LocalGainOfThetaChains §4.17 is used only off `Drop` and the dropped primes are charged in full;
and the served data depend on the top weights only, so one vector of top weights (LocalGainOfThetaChains §4.17c) serves every translate and
every word.

*NEW*. The conclusion: [FormalProof], `Formalism/RankGapBounds/MeanBoundSecondForm.lean` (`Formalism.RankGapBounds.WeightedMeanData.Data.LoP`); (i): [FormalProof], `Formalism/SharpRestriction/GlobalTheoremInputs.lean` (`Formalism.MainNotions.LinkG_at`); `p₀`: [FormalProof], `Formalism/LocalRingCardinality/DataParams₂.lean` (`Formalism.BasicNotions.Scale.p0`). *Needs:* FrobeniusRestrictedRieszSums §0.3, FrobeniusRestrictedRieszSums §0.4, FrobeniusRestrictedRieszSums §0.6, ThetaChainsOnDefiniteUnitaryGroups §2.1, ThetaChainsOnDefiniteUnitaryGroups §2.3, LocalGainOfThetaChains §4.9, LocalGainOfThetaChains §4.9e, LocalGainOfThetaChains §4.16, LocalGainOfThetaChains §4.17, LocalGainOfThetaChains §4.17a, LocalGainOfThetaChains §4.17b, LocalGainOfThetaChains §4.17c, LocalGainOfThetaChains §4.17d, 10.1; AnalyticNumberTheoryPartI
§0.11 (Mertens); Mathlib
`Chebyshev.theta_le_log4_mul_x`.

### 10.3 The key identity

*Statement.* For reals `a_τ > 0` (`τ ∈ Φ_top`), `A_top := Σ_τ a_τ`, step weights
`w_j : Φ → (0, ∞)` (`1 ≤ j ≤ m`) and `log Ω = γ + log(2π/rd_E) − (L′/L)(1, χ_K)`:

`m·Σ_{τ∈Φ_top}(ph(a_τ) − a_τ·log Ω) − A_top·Σ_{j=1}^m mean_{τ′∈Φ} log(w_j(τ′)·rd_E/(2π)) = Σ_{j=1}^mΣ_{τ∈Φ_top} 𝔐(a_τ, w_j)`,

`𝔐(a, w) = a·(log a − 1 − γ + (L′/L)(1, χ_K) − mean_{τ′∈Φ} log w(τ′))` (FrobeniusRestrictedRieszSums §1.1). Exact.

*Route.* Expand: `ph(a) = a log a − a`; the `+a·log(rd_E/(2π))` inside `−a·log Ω` cancels the `−a·log(rd_E/(2π))` coming
from the level prime, once per lift (the Chowla–Selberg period against the mass formula); what remains is
`a(log a − 1 − γ + (L′/L)(1, χ_K) − mean log w_j)`.

*Check.* Each constant of `𝔐` is forced: with constant weights `w`, 10.1's Check, `Σ_{n≤y}Λ(n)/n = log y − γ + o(1)`
(ExplicitPrimeCounting §4.2), `Σ_{n≤y}χ_K(n)Λ(n)/n = −(L′/L)(1, χ_K) + o(1)` (ExplicitPrimeCounting §0.2: the closed form
of `C(d, a)` summed against `χ_K`) and the prime number theorem give `ℛ(a, τ, w) = 𝔐(a, w) + o(a)`. Lowering any
constant of `𝔐` by a fixed `δ > 0` would make 10.4 false for large `x` (its error is `o(m|Φ_top|a)`), and raising it would
make 10.4 a consequence of the prime number theorem, carrying no information; `−1` comes from Stirling (GluedTargetAndDivisionInequality §8.10), `−γ` and
`+(L′/L)(1, χ_K)` from the Chowla–Selberg period (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.5), `−mean log w` from the level prime (9.4).

*NEW* (algebra). [FormalProof], `Formalism/RankGapBounds/MeanBoundSecondForm.lean` (`Formalism.RankGapBounds.WeightedMeanData.Data.Main`, `Formalism.RankGapBounds.WeightedMeanData.Data.logOm`, `Formalism.RankGapBounds.WeightedMeanData.Data.DIV`). *Needs:* FrobeniusRestrictedRieszSums §1.1, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.5, GluedTargetAndDivisionInequality §8.10, 9.4, 10.1.

### 10.4 The Frobenius-restricted inequality

*Statement.* There are `x₀` and `C_* ≥ 1`, depending only on `ε`, on the
constants fixed before `ε` and on the exponents fixed before the scale, such that the following holds for every
`x ≥ x₀`. Let chain data of length `m` at the scale `(x, ε)` with translate `u₀` be given (10.0), satisfying the standing
hypotheses (H1)–(H6), in particular the wild-kernel budget (H4). Put `A_top := Σ_{τ∈Φ_top}a_τ`,
`𝔐_tr(u₀) := Σ_{j=1}^mΣ_{τ∈Φ_top} 𝔐(a_τ, w_{u₀,j})` and `𝔈_tot(u₀) := 𝔈₁ + ⋯ + 𝔈₉`, where, with `C = C_*`,
- `𝔈₁ = C·A_top·(La + m²La/k)` (rank matching, 9.4);
- `𝔈₂ = C·|Φ_top|·a·La` (division inequality, top-place terms, GluedTargetAndDivisionInequality §8.22);
- `𝔈₃ = C·m·(B₀ + N_c)·x^{e_D ε}`, `e_D = 1` (division inequality, per-lift terms, GluedTargetAndDivisionInequality §8.22);
- `𝔈₄ = C·m·B₀` (type primes, GluedTargetAndDivisionInequality §8.23 (a));
- `𝔈₅ = C·|Φ_top|·a·La·(1 + m/k)` (source slopes, 9.1);
- `𝔈₆ = C·|Φ_top|·m·b` (losses, 10.2);
- `𝔈₇ = C·(|Φ_top|·m·b + |Φ_top|·m²·(a/k + b′)·x^ε + X″) + 1` (source losses `𝔏_u`, 9.2; `𝔦_tot ≤ |Φ_top|mb` by 10.2);
- `𝔈₈ = (1 − δ_bad)^{−1}·4·log(1 + x^{c_H})·(U_F + b)`, `U_F := C·|Φ_top|·a·La·(2 + m/k) + C·m·B₀ + C·A_top·log k + 𝔈₇` (the price of
  unequal source slopes in 9.6; `U_F` bounds `u_F`; by the two-word bound `A_V^{−1} ≤ T(u)/T(u′) ≤ A_V` of 9.4 (c), the
  term `C·A_top·log k` may be replaced by `C·A_top`);
- `𝔈₉ = (1 − δ_bad)^{−1}·(η_frame + 4√e_frame)·x^{c_H}·b` (frame defects, 9.6).

Then `Σ_{τ∈Φ_top}Σ_{j=1}^m ℛ(a_τ, τ, w_{u₀,j}) ≤ 𝔐_tr(u₀) + 𝔈_tot(u₀)`.

*Route.* The ledger of one translate, for a word `u`:

| Line | Inequality | Target |
|---|---|---|
| sources | `μ(N′_u) ≥ μ(M_u) + 𝒩 + F_tot − E_tot(u) − 𝔏_u`, `μ(M_u) ≥ −𝔈₅` | 9.2, 9.1 |
| division | `μ(R^∨) + h_u − F_tot ≤ m·Σ_τ(ph(a_τ) − a_τ log Ω) − A_top·log T(u) + 𝔈₂ + 𝔈₃` | GluedTargetAndDivisionInequality §8.22 |
| level prime | `log T(u) ≥ Σ_j mean_{τ′} log(w_{u₀,j}(τ′)·rd_E/(2π)) + m·log(g₀g₁) − C(La + m²La/k)` | 9.4 |
| type primes | `E_tot(u) ≤ m·A_top·log(g₀g₁) + C·m·B₀` | GluedTargetAndDivisionInequality §8.23 |
| identity | `m·Σ_τ(ph(a_τ) − a_τ log Ω) − A_top·Σ_j mean log(w_{u₀,j}·rd_E/(2π)) = 𝔐_tr(u₀)` | 10.3 |
| slopes | `s̄ − (defect) ≤ μ(R^∨)` | 9.6 |
| losses | `Σ ℛ − 𝒩 ≤ 𝔈₆` | 10.2 |

(A) Adding the first four lines with `A_top ≥ 0` gives, for every word,
`μ(N′_u) − h_u ≥ 𝒩 + μ(R^∨) − 𝔐_tr(u₀) − (𝔈₁ + ⋯ + 𝔈₅) − 𝔏_u`: `F_tot` cancels (sources against division), the type-prime term
`m·A_top·log(g₀g₁)` cancels (level cost against level prime), and 10.3 turns the rest of the main terms into `𝔐_tr(u₀)`, the
period `log(2π/rd_E)` of `log Ω` cancelling the `log(rd_E/(2π))` of the mass ratios. The word enters through `T(u)`, `μ(M_u)`,
`E_tot(u)`, `𝔏_u` and `h_u`, each bounded uniformly; the net gain `𝒩` does not depend on the word (10.1 (a)). (B) Averaging over
`W` with weights `d_u`, with `𝔏_u ≤ 𝔈₇` (9.2 (d) with `log T(u) ≤ C·m·x^ε` from 9.4 (c), and 10.2 for `𝔦_tot`):
`s̄ ≥ 𝒩 + μ(R^∨) − 𝔐_tr(u₀) − (𝔈₁ + ⋯ + 𝔈₅) − 𝔈₇`. The spread `u_F` is at most `U_F`, by 9.2 (b), (c) directly: for words `u, u′`,
`(μ_max(N′_u) − h_u) − (μ(N′_{u′}) − h_{u′}) ≤ (μ_max(M_u) − μ(M_{u′})) + (E_tot(u′) − E_tot(u)) + (h_{u′} − h_u) + 𝔏_{u′}` (`𝒩` and
`F_tot` do not depend on the word); the first bracket is at most `C·|Φ_top|·a·La·(2 + m/k)` (9.1 (d)), the second at most
`2C·m·B₀` (GluedTargetAndDivisionInequality §8.23 (a)), the third at most `C·(|Φ_top|·a·La + m·B₀) + C·A_top·log k` (GluedTargetAndDivisionInequality §8.23 (b); the level primes of two
words satisfy `|log T(u) − log T(u′)| ≤ C·log k`, 9.4 (c)), and
`𝔏_{u′} ≤ 𝔈₇`; and `u_F ≤ max_{u,u′}` of the left side, since `s̄` is at least the least `μ(N′_{u′}) − h_{u′}`.
(C) 9.6 with `H = x^{c_H}b` (9.6 (b)): `μ(R^∨)` cancels and
`𝒩 ≤ 𝔐_tr(u₀) + 𝔈₁ + ⋯ + 𝔈₅ + 𝔈₇ + 𝔈₈ + 𝔈₉`, using that `u ↦ u·log(1 + H/u)` is increasing, so
`u·log(1 + H/u) ≤ (U_F + b)·log(1 + x^{c_H})` for `0 ≤ u ≤ U_F` (if `U_F ≥ b` then `H/U_F ≤ x^{c_H}`; otherwise compare with `u = b`).
(D) 10.2 adds `𝔈₆`. The hypothesis of GluedTargetAndDivisionInequality §8.21 (b) used in GluedTargetAndDivisionInequality §8.22 (`H₀ ≥ μ_max(R_0)` and the smallness of the passage term) is
discharged by GluedTargetAndDivisionInequality §8.24 (b), under the budget (H4). The constant `C_*` is the largest of the constants of the targets cited,
each of which depends at most on `ε` and on the constants and exponents fixed before the scale, and `x₀` the largest of
their thresholds.

*Check* (strength). By FrobeniusRestrictedRieszSums §1.9 the mean over `u₀ ∈ A₀` of this inequality has the strength of the generalized Riemann
hypothesis for the cyclic family at the scale `x`: every `𝔈_i` is at most `x^{1/2 + O(ε)}·|Φ_top|·m·b` (10.5), whereas one
error of size `a_τ` per top place and per lift (an `O(1)` error in `log Ω`, an `O(a)` remainder in GluedTargetAndDivisionInequality §8.10, a weight entry of
size `a` on the row side) would be of size `m·|Φ_top|·a` and make it trivial.

*NEW*. *Needs:* FrobeniusRestrictedRieszSums §1.1, ThetaChainsOnDefiniteUnitaryGroups §2.1, GluedTargetAndDivisionInequality §8.21, GluedTargetAndDivisionInequality §8.22, GluedTargetAndDivisionInequality §8.23, GluedTargetAndDivisionInequality §8.24, 9.1, 9.2, 9.4, 9.6, 10.0, 10.1, 10.2, 10.3.

### 10.5 The error budget

*Statement.* Put `y := x^ε` and `ℰ := |Φ_top|·a·(1 + m²/k) + m·(B₀ + N_c)`. Suppose `La ≤ 2y`, `log k ≤ y`,
`A_top ≤ 2|Φ_top|a`, `m·b ≤ a`, `m ≤ k`, `k·b′ ≤ a`, `X″ ≤ a`, `log(1 + x^{c_H}) ≤ (1 + c_H)y`, `(1 − δ_bad)^{−1} ≤ 2`,
`(η_frame + 4√e_frame)·x^{c_H} ≤ 6`, and `200(1 + C_*)(1 + c_H) ≤ y` for the constant `C_*` of 10.4. Then

`𝔈_tot(u₀) ≤ x^{(max(e_D, 2) + 1)ε}·ℰ = x^{3ε}·( |Φ_top|·a·(1 + m²/k) + m·(B₀ + N_c) )`  (`e_D = 1`).

Consequently, with 10.4, for every translate `u₀ ∈ A₀` (and so on average over `u₀ ∈ A₀`)

`Σ_{τ∈Φ_top}Σ_{j=1}^m (ℛ − 𝔐)(a_τ, τ, w_{u₀,j}) ≤ x^{3ε}·( |Φ_top|·a·(1 + m²/k) + m·(B₀ + N_c) )`,

which, at every `u₀ ∈ A₀`, is hypothesis (i) of FrobeniusRestrictedRieszSums §1.9 with `C = 3` (the top weights of ThetaChainsOnDefiniteUnitaryGroups §2.3 satisfy `|a_τ/b − x| ≤ 1`, and
the budgets of ThetaChainsOnDefiniteUnitaryGroups §2.1 are `B₀ = f·m·b·x^ε = 2|A|·m·b·x^ε` and `N_c = |𝒯|·k·b·x^{2ε}/|A|²`, the bounds of
FrobeniusRestrictedRieszSums §1.9 with `f = 2|A|`). The ledger of the exponent: the per-lift error of the
division inequality is `C·m·(B₀ + N_c)·x^{e_Dε}` (GluedTargetAndDivisionInequality §8.22, from the target bound GluedTargetAndDivisionInequality §§8.20–8.21: Gram and exponent terms, the
covolume remainder, the passage from the base tuple), which is `C·x^{ε}·ℰ` at most; the loss of 10.2 carries no power of
`x^ε` (LocalGainOfThetaChains §4.17b); the largest term is `𝔈₈`, of size `x^{2ε}·ℰ` up to constants (one factor `x^ε` from `La ≤ 2y` in the
spread `U_F`, one from `log(1 + x^{c_H})`); one more factor `x^ε` absorbs the constants. So the division error is not the
largest term as long as `e_D ≤ 2`.

*Route.* With `ℰ ≥ |Φ_top|a ≥ a ≥ b ≥ 1`: `𝔈₁ ≤ 4C_*yℰ` (`A_top ≤ 2|Φ_top|a`, `La ≤ 2y`), `𝔈₂ ≤ 2C_*yℰ`, `𝔈₃ ≤ C_*x^{e_Dε}ℰ`,
`𝔈₄ ≤ C_*ℰ`, `𝔈₅ ≤ 4C_*yℰ` (`m ≤ k`), `𝔈₆ ≤ C_*ℰ` (`mb ≤ a`), `𝔈₇ ≤ C_*(2 + 2y)ℰ + 1` (`kb′ ≤ a` gives `m²b′ ≤ m²a/k`, and
`X″ ≤ a`); so `𝔈₁ + ⋯ + 𝔈₇ ≤ C_*x^{e_Dε}ℰ + 17(1 + C_*)yℰ`. `U_F ≤ C_*(10y + 3)ℰ + 1 ≤ 13C_*yℰ + 1` (`C_*·A_top·log k ≤ 2C_*yℰ`), so
`U_F + b ≤ 15(1 + C_*)yℰ` and `𝔈₈ ≤ 2·4·(1 + c_H)y·(U_F + b) ≤ 120(1 + C_*)(1 + c_H)y²ℰ`; `𝔈₉ ≤ 12b ≤ 12ℰ`. With
`Q := (1 + C_*)(1 + c_H)` the total is at most `C_*x^{e_Dε}ℰ + 150Q·y²ℰ`, and `200Q ≤ y` gives
`𝔈_tot(u₀) ≤ (y^{e_D+1}/200 + 3y³/4)ℰ ≤ x^{(max(e_D, 2)+1)ε}ℰ`.

The budget, term by term (sizes after division by the normaliser `|Φ_top|·m·b·δ_th/2` of FrobeniusRestrictedRieszSums §1.7, with the sizes
FrobeniusRestrictedRieszSums §1.8 (i)–(iii) (10.6a): `x^{1/2−ε} ≤ m ≤ x^{1/2+ε/2}`, `xm ≤ k ≤ |A|²x^{1/2−ε}`, `|Φ_top| ≥ x^{−ε}|A|`, `δ_th ≥ x^{−ε}`):

| Term | Origin | Size | After normalisation |
|---|---|---|---|
| `𝔈₁` | `L`-values in the mass ratios, the Vandermonde quotient, the factors `1 − g^{−i}`, the missing mass ratio, `2log Γ₀/(fk)` | `|Φ_top|a·x^ε(1 + m²/k)` | `x^{1/2+O(ε)}` |
| `𝔈₂` | polynomial factors of the top period, the unpaid first row at the tops, `δ·log Ω` at the tops | `|Φ_top|a·x^ε` | `x^{1/2+O(ε)}` |
| `𝔈₃` | covolume remainder of the step lattices, the lattices of theta series after twisting, Gram and exponent terms of the target, the passage from the base tuple, polynomial factors of kernels and hooks, the telescoped signature mismatch `≤ f m²(ϑ + 1)La`; the congruence modules alone contribute at most `C·m·x^ε·B₀` (CongruenceModulesOfThetaLifts §7.11); the generation by theta series, whose bounds are in the unit `B₀·log log x` (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18), and the exponents of weight elimination, `≤ 16x^ε·B₀` per step (CongruenceModulesOfThetaLifts §7.16a (3)) | `m²f·b·x^{2ε} + m·N_c·x^{ε}` | `x^{1/2+O(ε)}` |
| `𝔈₄` | type primes `g₀, g₁` | `m²f·b·x^ε` | `x^{1/2+O(ε)}` |
| `𝔈₅` | slopes of the source lattices | `|Φ_top|a·x^ε` | `x^{1/2+O(ε)}` |
| `𝔈₆` | floors of the formal-group bounds, small and medium primes, unserved tops, dropped primes, high primes, `d` | `|Φ_top|m·b` | `x^{O(ε)}` |
| `𝔈₇` | colength beyond `τ_N`, the colength at the level prime, rounding | `|Φ_top|m·b + |Φ_top|m²a·x^ε/k` | `x^{O(ε)}` |
| `𝔈₈` | unequal slopes of the sources in the frame | `log x × (𝔈₁ + ⋯ + 𝔈₇)` | as `𝔈₁ … 𝔈₇` |
| `𝔈₉` | near-orthogonality defects, bad rows | `≤ 12b` | `x^{−A_n−1/2+O(ε)}` |

*Why `m ≈ √x`.* The errors that occur once per translate, of size `|Φ_top|·a·x^ε = |Φ_top|·x·b·x^ε`, give `x/m` per lift in
units of `|Φ_top|·b`; the per-lift errors of size `B₀ = f·m·b·x^ε` that grow linearly in `m` are on the row side (the
covolume remainder of the step lattices). The total is `x^{O(ε)}·(x/m + m)`, minimal at `m ≈ √x`, of size `x^{1/2 + O(ε)}`.

*NEW* (elementary). *Needs:* FrobeniusRestrictedRieszSums §1.8, FrobeniusRestrictedRieszSums §1.9, ThetaChainsOnDefiniteUnitaryGroups §2.1, 10.4.

### 10.6 Explicit parameters

*Definition.* Let `ψ` be a primitive Dirichlet character of order `o`
and conductor `f_ψ`.

*Constants*, fixed before `ε`, with these constraints: the bound `ε₀ ∈ (0, 1/52]` of ThetaChainsOnDefiniteUnitaryGroups §2.1 and `A_max := 2 + 8ε₀` (ThetaChainsOnDefiniteUnitaryGroups §2.1);
`ω₀ = 3/4` (the lower bound of the coset profile of the tops, FrobeniusRestrictedRieszSums §0.7; the coset law of the
selection is then the law of FrobeniusRestrictedRieszSums §1.7 that FrobeniusRestrictedRieszSums §1.9 asks, `4/(3o + 1)` on
`A₀` and `3/(3o + 1)` on the other cosets); `c_io ≥ 1`, `A_w ≥ 2c_io + 2A_max + 4` and `C_ρ ≥ 1`
(ThetaChainsOnDefiniteUnitaryGroups §2.3, LocalGainOfThetaChains §4.17; `C_ρ` large enough for the comparison `2δ_I ≤ ρ_B` there);
the constant `C₁` of LocalGainOfThetaChains §4.10a with its
constraint there (`C₁ = 1` serves); an exponent `c_TO > 352 + 1016ε₀` (the degree `T_O` below); `C_t > c_TO + 22 + 59ε₀` (`SizeT`; it implies
`C_t ≥ 2A_max + 5/2`, ThetaChainsOnDefiniteUnitaryGroups §2.1); the constants `C_b`, `c_T` of BesselPoincareSeriesAndGramBounds §5.20 (a bound stated
there for all `C_Δ > 4`, `C_b > 0`, `c_T > 0` with `c_T·C_b > 1`) with `c_T ≤ 16` (the lower bound for `log T(u)` of 9.4 (d)) and
`c_T·C_b > 1`, and `C_T ≥ 25` (`SizeT_u` of ThetaChainsOnDefiniteUnitaryGroups §2.8, the upper bound of 9.4 (d)); an exponent `C_Δ > 4` of
BesselPoincareSeriesAndGramBounds §5.20 and its exponent `c_Θ = ½·min((C_Δ − 4)/2, (c_T·C_b − 1)/4)`; the constant `C_m` of
BesselPoincareSeriesAndGramBounds §5.20a (c); then the constant `C_l` of BesselPoincareSeriesAndGramBounds §5.20a, chosen after
`C_Δ`, `c_T`, `C_b` and the other constants of its list (St): at least `C_Δ`, at least the thresholds of
BesselPoincareSeriesAndGramBounds §§5.20, 5.20b, 5.21 for these constants, and with `c_Θ·C_l ≥ 16` (the smallness clause of
BesselPoincareSeriesAndGramBounds §5.20); as `Δ_w ≥ (kfx^ε)^{C_l}` (10.6b) and `C_l ≥ C_Δ`, the hypothesis `Δ_w ≥ (kfx^ε)^{C_Δ}` of
BesselPoincareSeriesAndGramBounds §5.20 holds; `o_δ` with prime-to-`ℓ` part at least `3` for every prime `ℓ` (ThetaChainsOnDefiniteUnitaryGroups §2.4); `C₀ = 3` (ThetaChainsOnDefiniteUnitaryGroups §2.8); `C_Γ ≥ max(C_B, C₄) + 1`
(BesselPoincareSeriesAndGramBounds §5.21); `C_W ≥ 4C_Γ/log 2 + 1` (9.5); `C_deg > c_TO`, the exponent of the degree bound `T ≤ x^{C_deg}` of
(N2) of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a (distinct from the `C_T` of `SizeT_u`); `e_D = 1` (GluedTargetAndDivisionInequality §8.22); `C_L > 4050`, the
constant of the length bound `L_th ≤ C_L·log x` of CongruenceModulesOfThetaLifts §7.10c (10.6d); the exponent `C_R` of `rd_E` in `SizeGen`
(`R_E := rd_E^{C_R}` in (N2) of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a); the width `c_box ∈ [ε₀/8, 1/12)` of the zero-free boxes of QuadraticTwistSelectionOverPrimes
§2.7c (`c_box = 1/400` in QuadraticTwistSelectionOverPrimes §2.7c (a′)–(c′) and
QuadraticTwistSelectionOverPrimes §2.7d (ii′)); the depth constant `C_F ≥ 6510` of RowTowerAndRallisIdentities §5.8a;
and the absolute constants of FrobeniusRestrictedRieszSums §0.7, FrobeniusRestrictedRieszSums §0.8, LocalGainOfThetaChains §4.15 and RieszSumsOverPrimesAndExceptionalZeros §§1.4h, 1.4i.

*After `ε`, before the scale.* For `ε ∈ (0, ε₀)` put `A_n := 2 + 8ε ∈ (2, A_max)` (the layer exponent of ThetaChainsOnDefiniteUnitaryGroups §2.1, which depends
on `ε`). Then come: the *window constant* `J ≥ 1`, the constant `J` of the window theorem UniformWildKernelBounds §7.6 for `ψ`,
`ε` (`0 < ε < ε₀ ≤ 2`), the rank exponent `C_t` and the layer exponent `A_n + 1 = 3 + 8ε` (the parameters written `κ`, `α`
there; so `J` depends only on `ψ`, `ε` and the constants
above); the exponent `c_H > 0` of the word count and of the slope range (9.5, 9.6), the exponent `c_Δ > 0` of the letter
step, and the exponent `c_h > 0` of the node gap; the predicates of ThetaChainsOnDefiniteUnitaryGroups §2.1 are taken
with these `J` and `c_H`.

*Hosts at a scale `x`*: hosts of FrobeniusRestrictedRieszSums §0.4 for `ψ` with
- (h1) `|A| ∈ [x^{A_n}, 2x^{A_n}]`, `f = 2|A|`;
- (h2) `log f_E ≤ 2x^{ε/5}·log²x`;
- (h3) `SizeInert` (ThetaChainsOnDefiniteUnitaryGroups §2.1): inert-free up to `max(12, x^{ε/(5J)})` (FrobeniusRestrictedRieszSums §0.3);
- (h4) `SizeQD` (ThetaChainsOnDefiniteUnitaryGroups §2.1), `log d ≤ x^{ε/4}`, and `|(L′/L)(1, χ_K)| ≤ x^ε`;
- (h5) tops `Φ_top ⊂ A` selected as in FrobeniusRestrictedRieszSums §0.7 with the density `δ_top = x^{−ε/8}` of LocalGainOfThetaChains §4.17 and profile `ω` (`ω = 1` on `A₀`,
  `ω = ω₀` on the other cosets), satisfying (i), (ii) of FrobeniusRestrictedRieszSums §0.7 and the bound on `Z_bad` of LocalGainOfThetaChains §4.17d.

*Choices at `x`.*
- *Ranks.* `m` even in `[√(xδ_top), 2√(xδ_top)]`; `k` even in `[x^{A_n+5/2+2ε}, 2x^{A_n+5/2+2ε}]`; `r = k + m − 1`; the degree
  `T_O := ⌈x^{c_TO}⌉`; `t` odd with `r + t = 8fr + 4 + T_O·n_W`, `n_W := 8⌈10r(f + f²(k − 1)³x^{2ε}/m)/8⌉` (the shape `n_P + T·n_W`
  of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a (N1), with `n_P = 8fr + 4` and `T = T_O`); the thick set `𝒯 ⊂ A₀` of FrobeniusRestrictedRieszSums §0.8a for the group `A₀` and the length
  `L_th := 10⌈405·log x⌉ + 2⌈30/ε⌉ + 22` (an even integer, `O(log x)`), which satisfies
  `L_th ≥ max(2⌈log_{10}(k·x^{2ε}/m)⌉ + 2, 10⌈log₅(|A|·N_m/m)⌉ + 20)` for large `x`. With `P := C_P(f r x^ε)^{12}` (the polynomial of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a) and `D_Y := f·r(r − 1)/2`.
- *Scale.* The numbers of ThetaChainsOnDefiniteUnitaryGroups §2.1 (`b = e^{x^ε}`, `a = xb`, `X′`, `b′`, `w″`, `X″`, `B₀`, `N_c`), `Γ₀ = exp(C_Γm⁵fx^ε)`, the slope range
  `H = x^{c_H}b`, and a word code with `⌈C₀Γ₀²x^{c_H}⌉` words (9.5; the same exponent `c_H`, 9.6 (b)).
- *Weights.* `Δ_w := ⌈x^{c_Δ}⌉` (ThetaChainsOnDefiniteUnitaryGroups §2.3), with an exponent `c_Δ ≥ c_Δ⁰` chosen after `ε`, the
  constants and `c_H`, and before `c_h`,
  `h_gap := ⌈x^{c_h}⌉`, `h₀ := 2h_gap`, `ϑ := m·h₀ + |μ_E|`, and for each translate `u₀`
  the adapted, separated datum of ThetaChainsOnDefiniteUnitaryGroups §2.3a with these numbers: `v_l(τ) = (k − 2 − l)·4Δ_w`; off the tops
  `u_0(τ) = v_0(τ) + 4kΔ_w + ½` (that is `v_0(τ) + Sc + ½`) and `u_{k−1}(τ) = −½`, at a top `u_0(τ) = a_τ + (k − 1)/2` and `u_{k−1}(τ) = −a⁻_τ − (k − 1)/2`, the inner entries given by the word
  (ThetaChainsOnDefiniteUnitaryGroups §2.3); nodes `e′_i(τ) = b₁(τ) + i·h₀` (`0 ≤ i < m`) and step weights `w_{u₀,j}(τ) = b₁(τ) + (j − ½)h₀` (`1 ≤ j ≤ m`, the indexing
  of ThetaChainsOnDefiniteUnitaryGroups §2.3), with `b₁(τ) = a⁻_τ + ⌊b′/x⌋` at the tops (`a⁻_τ` an integer), `⌈w″⌉` at the thin places, and `⌈b⌉` at the thick places of `u₀` except one,
  where `b₁ = ⌈b⌉ + s` with `0 ≤ s < |μ_E|` fixed by the unit condition (ThetaChainsOnDefiniteUnitaryGroups §2.3a; it then holds for every step weight, because
  `∏_{τ∈Φ}τ(ζ) = N_{E/K}(ζ) = 1` for every root of unity `ζ` of `E`, ThetaChainsOnDefiniteUnitaryGroups §2.3 (g)); top weights `a_τ ∈ [a, a(1 + θ_a)]`,
  `θ_a = 1/(k·x^{A_w/2})`, and `a⁻_τ ∈ [b′, b′ + Δ_b]`, chosen as in LocalGainOfThetaChains §4.17c.
- *Gain.* The parameters of LocalGainOfThetaChains §4.15 and LocalGainOfThetaChains §4.17 (`δ_top = x^{−ε/8}`, candidates' orbits of length `≥ x^{ε/4}`, `p₀ = k²x^{A_w}`, the
  Hecke type `r_G`, the band `ρ_B = (4f·δ_top·x^ε + C_ρ·log x)·Λ_log/k`, the good-orbit parameters, `c_s = ε/(5J)`), the bound
  `L_b := 2⌈4(A_w + 5)/c_s⌉ = 2⌈20J(A_w + 5)/ε⌉` for `L₂` of LocalGainOfThetaChains §4.17, and the bottom box `Δ_b := f·δ_top·x^ε·Λ_log·b′/k`
  (that is `2|A|δ_top·x^ε·Λ_log·b′/k`; so `ρ_B = 4Δ_b/b′ + C_ρ·log x·Λ_log/k`).
- *Primes.* Type primes `g₀, g₁ ∈ (Y_g, 2Y_g]` of ThetaChainsOnDefiniteUnitaryGroups §2.7 (a) for `Y_g := (kb)^8`, with `𝔅(r, g₀) ∩ 𝔅(r, g₁) = ∅`; auxiliary primes
  `p_δ, p′_δ` of ThetaChainsOnDefiniteUnitaryGroups §2.7 (b); for each translate and word, the level prime `T(u)` of ThetaChainsOnDefiniteUnitaryGroups §2.8.

*The order of the choices.* (1) The constants above. (2) `ε`, and with it `A_n = 2 + 8ε`. (3) The window constant `J` (which
depends on `ψ`, `ε` and the constants of (1) only), the threshold `x₁(ψ, 3, 4, ε)` of FrobeniusRestrictedRieszSums §1.9, the exponent `c_H ≥ c_H⁰` (9.6 (b): `c_H⁰`
may depend on `ε` and on these constants); then the exponent `c_Δ ≥ c_Δ⁰` of the letter step (`c_Δ⁰` depends on `ε`, on
the constants of (1) and on `c_H`), and with it the exponent `C_S` of `SizeSc` (ThetaChainsOnDefiniteUnitaryGroups §2.3b);
then the exponent `c_h ≥ c_h⁰` of the node gap (`c_h⁰` depends on `c_Δ`, hence on `c_H`);
then the threshold `x₀`. (4) The scale `x`. (5) At `x`, shared by all translates: the host and its
tops, `k, m, t`, `T_O`, the thick set, the top weights (one vector, LocalGainOfThetaChains §4.17c), the word code (9.5), the type and auxiliary
primes, and the numerical data of the grid that depend on these (RowTowerAndRallisIdentities §5.8a: `s`, `p_□`, `d_□`). (6) For
each translate `u₀ ∈ A₀` independently: (6a) the step weights `w_{u₀,j}` (the thick places depend on `u₀`), the
level primes `T(u)` of the words, the Hecke characters (ThetaChainsOnDefiniteUnitaryGroups §2.4), the spacing `h_c` and the centres of the grid (they
depend on the entries `v(τ)` of the weight datum), the auxiliary place `v_□` above `p_□`, the chosen places `w(v)` and the characters
`χ_1, …, χ_m` of the grid (RowTowerAndRallisIdentities §5.8a) and the coefficient
field `𝕂` (ThetaChainsOnDefiniteUnitaryGroups §2.6: it depends on these characters and not on the word); (6b) the twisting datum (ThetaChainsOnDefiniteUnitaryGroups §2.5), and
with it the field of places `𝕃` (ThetaChainsOnDefiniteUnitaryGroups §2.6), enlarged after the twisting datum is fixed so as to contain the numbers
(L1)–(L7) of RowTowerAndRallisIdentities §5.8, as ThetaChainsOnDefiniteUnitaryGroups §2.5, Lemma (iv)
allows, and the lattices of the chain.

*Route.* Definitions.

*Check.* One admissible choice: `ε₀ = 1/52` (so `A_max = 28/13`), `A_n = 2 + 8ε`, `ω₀ = 3/4`, `c_io = 1`, `A_w = 26`,
`c_TO = 377`, `C_t = 401`, `c_T = 16`, `C_b = 1`, `C_Δ = 40` (then `c_Θ = 15/8`), `C_l` the largest of `40` and the thresholds of
BesselPoincareSeriesAndGramBounds §§5.20–5.21 for these constants (so `c_Θ·C_l ≥ 75 ≥ 16`), `C_T = 25`,
`C_R = 7` (the value of the construction of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a; whether a smaller value serves is not
decided here), `c_box = 1/400` (`≥ ε₀/8 = 1/416`), `C_deg = 378`, `o_δ = 15`, `C_L = 4051`; then
`m ≍ x^{1/2−ε/16}`, `k ≍ x^{9/2+10ε}`, `n_W ≍ x^{21.5+58.0625ε}`,
`t ≤ x^{398.5+58.0625ε+o(1)} ≤ x^{400}`, the binding lower bound for `T_O` has exponent `352 + 1015.0625ε < 371.6 < 377`, and
`log T(u) = (17 + o(1))m x^ε`. In the construction of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a the further lower bounds that the generation by theta series
asks of `T_O` are `(D_Y + 2)n_W + 2r`, `40(D_Y + 2)`, `11D_Y²`, `r + 2500r(D_Y + 1)`, all of exponent at most `35`. A choice
`A_n ≤ 2` is not admissible: then `m⁵|A| ≥ |A|²x^{1/2}` for `m ≍ √x`, and no `k` satisfies both the word count of 9.5 and
`SizeK`. A choice `t ≤ 2(k + m + 4)` violates (R5) as soon as `f ≥ 1`.

*NEW* (definition). *Needs:* FrobeniusRestrictedRieszSums §0.4, FrobeniusRestrictedRieszSums §0.7, FrobeniusRestrictedRieszSums §0.8, FrobeniusRestrictedRieszSums §0.8a, FrobeniusRestrictedRieszSums §1.9, ThetaChainsOnDefiniteUnitaryGroups §2.1, ThetaChainsOnDefiniteUnitaryGroups §2.3, ThetaChainsOnDefiniteUnitaryGroups §2.3a, ThetaChainsOnDefiniteUnitaryGroups §2.4, ThetaChainsOnDefiniteUnitaryGroups §2.5, ThetaChainsOnDefiniteUnitaryGroups §2.6, ThetaChainsOnDefiniteUnitaryGroups §2.7, ThetaChainsOnDefiniteUnitaryGroups §2.8, LocalGainOfThetaChains §4.10a, LocalGainOfThetaChains §4.15, LocalGainOfThetaChains §4.17, LocalGainOfThetaChains §4.17c, RowTowerAndRallisIdentities §5.8, RowTowerAndRallisIdentities §5.8a, BesselPoincareSeriesAndGramBounds §5.20, BesselPoincareSeriesAndGramBounds §5.20a, BesselPoincareSeriesAndGramBounds §5.21,
CongruenceModulesOfThetaLifts §7.10c, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a, GluedTargetAndDivisionInequality §8.22, 9.4, 9.5, 9.6; RieszSumsOverPrimesAndExceptionalZeros §§1.4h, 1.4i; UniformWildKernelBounds §7.6; QuadraticTwistSelectionOverPrimes
§§2.7c, 2.7d.

### 10.6a The size predicates

*Statement.* [FormalProof] establishes the size conditions of 10.6a–10.6d for one choice of constants (`ε₀ = 1/52`,
`C_t = 401`, `c_TO = 377`, `A_w = 26`, `C_T = 25`, `c_box = 1/400`, `C_R = 7`, `C₀ = 3`, `C_g = 9`, `C_dep = 11`, and, for the
Gram bounds, `C_Δ = 5`, `c_T = 1/2`, `C_b = 3` (so `c_T·C_b = 3/2` and `c_Θ = 1/16`; the instance that
BesselPoincareSeriesAndGramBounds §5.20 names), `c_b = 1/4`, `C_u = 3`, with `C_l` at least `256` and at least the thresholds of
BesselPoincareSeriesAndGramBounds §§5.20–5.21) and for the values of `u_0(τ)`, `Δ_w`, `L_th` and `b₁(τ)` stated in 10.6; for the
other admissible constants they are this roadmap's arithmetic. The Check of 10.6 takes other admissible values of `c_T` and
`C_b`. The clauses of these size conditions with no counterpart among the size conditions
of [FormalProof] are this roadmap's own: `SizeSc`, the second clause of `SizeDep`, `SizeThin` and the row sizes `b ≥ 100`,
`2(η_s + t + 1) + Sc ≤ b/10`, `20·max(w_max, η_s + t + 1, Sc) ≤ b`, `r/ℓ_A ≤ 2m/x^ε`, `(3 + log ℓ_A)² ≤ x^ε`,
`k ≥ x²·s_max³·log a`, `N_m²·w″ ≤ b`, `(N_m² + m·k)·b′ ≤ a`, `k·(Sc + η_w)·x^ε ≤ m·b` and the count `20r³ < Y_g^{3/20}`; they are
elementary comparisons of the kinds (K1)–(K3), true at the values of 10.6 for large `x`, and the targets that use them belong
to the other roadmaps of the chain.

With the constants of 10.6, `ε ∈ (0, ε₀)`, `J ≥ 1`, `c_Δ > 0` and
`c_h > 0`, there is `x₀(ψ, ε, J, c_Δ, c_h)` such that for `x ≥ x₀`, every host with (h1)–(h5) and the choices of 10.6 at `x`: the rank conditions
(R1)–(R5) of ThetaChainsOnDefiniteUnitaryGroups §2.1; the host predicates `SizeA`, `SizeN`, `SizeD`, `SizeRd`, `SizeQD`, `SizeInert` of ThetaChainsOnDefiniteUnitaryGroups §2.1 (from (h1)–(h4)), so
`d ≥ x²`, and `SizeDep` (ThetaChainsOnDefiniteUnitaryGroups §2.1, `C_dep = 11`); the parameter predicates `SizeM`, `SizeK`, `SizeW`, `SizeMf`, `SizeT`, `SizeTheta` of ThetaChainsOnDefiniteUnitaryGroups §2.1;
`2^n ≥ x²` and `2^n ≥ |A|·x^{−ε/100}`; `q, d > x^{2C_t+5}`; the cost conditions of FrobeniusRestrictedRieszSums §1.7, the
precision `η_top ≤ x^{−1+ε}` of the coset law of the tops and FrobeniusRestrictedRieszSums §1.8 (i)–(iv);
the hypotheses of ThetaChainsOnDefiniteUnitaryGroups §2.7 (a) at `Y_g = (kb)^8`, including the count that makes the disjoint choice of `g₀, g₁` possible
(`20r³ < Y_g^{3/20}`); `SizeG` (ThetaChainsOnDefiniteUnitaryGroups §2.7); the hypotheses of ThetaChainsOnDefiniteUnitaryGroups §2.8, among them `log T*(u) ≥ 16·m·x^ε`, and `SizeT_u` with the
constant `C_T` of 10.6; the hypotheses of ThetaChainsOnDefiniteUnitaryGroups §2.9a (c); and the further size conditions
`|Φ_top| ≤ 2δ_top|A|`
(FrobeniusRestrictedRieszSums §0.7 (i), by (h5)), `L_th ≤ log²x` (`L_th = O(log x)`, 10.6), `N_E^{36}·t^{150} ≤ √b` for the
modulus `N_E` of the host, and `x^{ε/100}·log log b ≤ r·f·log r`.
In particular (FrobeniusRestrictedRieszSums §1.8 (i), (ii)) `x^{1/2−ε} ≤ m ≤ x^{1/2+ε/2}`, `m·x ≤ k ≤ |A|²·x^{1/2−ε}`,
`k ≥ C_W·m⁵·|A|·x^ε`, `(8f − 1)r + 4 ≤ t ≤ x^{C_t}` and `m ≤ f ≤ k`.

*Route.* Every quantity of the ranks, of `T_O` and of the gain layer is polynomial in `x`, and `b = e^{x^ε}` dominates every
polynomial while `log b = x^ε`. The comparisons between powers of `x` whose exponents are fixed by `ε` and the constants
(*kind (K1)*) hold for every `ε < ε₀` once `x` is large; the smallest margins are the factor `x^{ε/100}` of the windows of
`SizeM` and `SizeK` (ThetaChainsOnDefiniteUnitaryGroups §2.1), those of `SizeW`
(`k/(m⁵|A|x^ε) ≥ x^{21ε/16}/64`, and `x^{0.30ε}/128` in its bound `x^{ε/100}·m⁵·f·x^{2ε} ≤ k`) and of `SizeK` (`|A|²x^{1/2−ε}/k ≥ x^{5ε}/2`, from `A_n − 2 = 8ε`), and among the fixed
exponents the binding bound for `T_O` (exponent `352 + 1015.0625ε + o(1)` against `c_TO`, the lower bound of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a (N2), with
`n = D_Y`, `δ₂ = δ_th` and a factor `x` to spare: `P⁴D_Y³·k·f·x/(m·δ_th) ≤ T_O`; this is where the upper bound on `ε` is used)
and `t ≤ 2T_O·n_W ≤ x^{C_t}` (exponent `c_TO + 21.5 + 58.0625ε + o(1)` against `C_t`). *Ranks.* `k ≤ |A|²x^{1/2−ε}` because
`A_n − 2 = 8ε > 3ε`; `f = 2|A| ∈ [m, k]`; `m⁴ ≤ 16x^{2−ε/4} ≤ f`; `r + t` is even (`n_W ≡ 0 mod 8`, `r` odd), so `t` is odd, and
(R2), (R4), (R5) are clear; `n_P ≤ n_W`, `f r(r + 1) ≤ n_W` and `(2fm)⁴n_W ≤ P`. *Host.* `|A| ≥ x^{A_n}` and `|A| ≤ o·2^n` give
`2^n ≥ x²` and `2^n ≥ |A|/o ≥ |A|·x^{−ε/100}` (`o` is fixed with `ψ`); FrobeniusRestrictedRieszSums §0.7 with the selection gives
`|Φ_top| ≥ δ_top|A|/2 = x^{−ε/8}|A|/2` (its clause (i) with `ω₀ = 3/4` and `δ_top|A| ≥ 36o²/ω₀²`) and
`η_top = 4(1 + ω₀)ω₀^{−2}(δ_top|A|)^{−1/2} ≤ x^{−1+ε}`; FrobeniusRestrictedRieszSums §0.8 with `log L_th = O(log log x)`
gives `|𝒯| ≥ x^{−ε}|A|`; (h3), (h4) give the inert bound of LocalGainOfThetaChains, `d ≥ x²` (10.2), `q, d > x^{2C_t+5}` and `SizeD` (ThetaChainsOnDefiniteUnitaryGroups §2.1),
and `|log Ω| ≤ La` (GluedTargetAndDivisionInequality §8.22). `SizeDep` is the Lemma of ThetaChainsOnDefiniteUnitaryGroups §2.1 for the hosts of FrobeniusRestrictedRieszSums §0.4: `q` and `d` divide `f_E`, so
`log(qd) ≤ log f_E ≤ 2x^{ε/5}log²x ≤ m` by (h2) and `m ≥ x^{1/2−ε/16}`; the primes of `S_small` (ThetaChainsOnDefiniteUnitaryGroups §2.1) divide `2f_ψ`, because
`f_E = lcm(2^{n+2}, f_ψ)·q·d` (FrobeniusRestrictedRieszSums §0.4 API (c)), so `Q_S = lcm(2^{n+2}, f_ψ)` divides `2^{n+2}f_ψ` and
`vd = log₂ Q_S ≤ n + 2 + log₂f_ψ` (at `ℓ ∈ S_small`, `vd ≥ v_ℓ(f_E)`, at least the different exponent of `E` divided by the
ramification index, the mean of the conductor exponents at `ℓ` of the characters of `G`: ClassFieldTheory §13.1,
`count_relDiscr_eq_finsum_abelianConductor_exponent`, with NumberFieldArithmetic §5.10), and `2^n ≤ |A| ≤ 2x^{A_n}`;
so `(Σ_{ℓ∈S_small} log ℓ)·(2 + vd) ≤ log(2f_ψ)·(5 log x + log₂f_ψ + 4)`,
which is at most `11x^ε` for `x ≥ x₀`. *The window `ϑ` and FrobeniusRestrictedRieszSums §1.7.* `ϑ = m·h₀ + |μ_E|` is polynomial in `x` (`h₀ ≤ 4x^{c_h}`;
`φ(|μ_E|) ≤ 2f`), of a degree that depends on `c_h`, so `SizeTheta`, `ϑ ≤ w″/x` and the cost conditions of
FrobeniusRestrictedRieszSums §1.7 (`6f(x + 1)(ϑ + 1) ≤ b/x`, and `2f(x + 1)·s_th ≤ 1/x` for the saving
`s_th = e^{−x^{ε/8}}` of 10.7 (a) (ii)) hold for `x ≥ x₀(ψ, ε, J, c_Δ, c_h)`: this is why the threshold depends on `c_h`
(and, through `Sc` in `SizeTheta`, on `c_Δ`). *Primes.* `Y_g = (kb)^8` satisfies the hypotheses of ThetaChainsOnDefiniteUnitaryGroups §2.7 (a) (`d ≥ 100` by
`SizeD`; `log(d f_E²) ≤ 6x^{ε/5}log²x` by (h2) against `log Y_g ≥ 8x^ε`, so that its count `c₂Y_g/((d f_E²)^{A_gap} log Y_g)`, with the
absolute exponent `A_gap`, is at least `Y_g^{9/10}`); the
disjointness `𝔅(r, g₀) ∩ 𝔅(r, g₁) = ∅` is possible because at most `(3r + 1)(1 + 2r²(Y_g^{3/4} + 1))` primes of `(Y_g, 2Y_g]` meet
`𝔅(r, g₁)`, fewer than the primes of ThetaChainsOnDefiniteUnitaryGroups §2.7 (a) there; the hypothesis `SizeT_u` of ThetaChainsOnDefiniteUnitaryGroups §2.8 (`16·m·x^ε ≤ log T*(u)`,
`log T*(u) + 1 ≤ C_T·m·x^ε ≤ x`) is 9.4 (d), with `C_T ≥ 25`; `g_i ≡ 1 (mod f_E)` and `g_i ≤ 2(kb)^8 ≤ b⁹`.
*The two further bounds.* `log N_E ≤ 2x^{ε/5}log²x` by (h2) and `t ≤ x^{C_t}`, so
`log(N_E^{36}·t^{150}) ≤ 72x^{ε/5}log²x + 150·C_t·log x ≤ x^ε/2 = log √b` for `x ≥ x₀`. `log log b = ε·log x ≤ x^ε`, and
`x^{ε/100}·x^ε ≤ f` because `f ≥ 2x^{A_n}`, while `f ≤ r·f·log r` (`r ≥ 3`); so `x^{ε/100}·log log b ≤ r·f·log r`.

*NEW* (elementary). With the constants of its head: (R1)–(R5), [FormalProof], `Formalism/LocalRingCardinality/Params.lean` (`Formalism.BasicNotions.Ranks`); `log(qd) ≤ m`, [FormalProof], `Development/AbelianVarietyTheory/Proofs/FoundationProofs/ThreeLeScaleOfPowBound.lean` (`GlobalTheory.IndexAssembly.SizeRows`); the windows of `m` and `k`, `SizeTheta` and the cost conditions, [FormalProof], `Formalism/SharpRestriction/GlobalSchurBounds/QuadraticLogDerivCongr.lean` (`Formalism.MainNotions.Lnk.Win_at`). *Needs:* FrobeniusRestrictedRieszSums §0.4, FrobeniusRestrictedRieszSums §0.7, FrobeniusRestrictedRieszSums §0.8, FrobeniusRestrictedRieszSums §0.8a, FrobeniusRestrictedRieszSums §1.7, FrobeniusRestrictedRieszSums §1.8, FrobeniusRestrictedRieszSums §1.9, ThetaChainsOnDefiniteUnitaryGroups §2.1, ThetaChainsOnDefiniteUnitaryGroups §2.7, ThetaChainsOnDefiniteUnitaryGroups §2.8, ThetaChainsOnDefiniteUnitaryGroups §2.9, 9.4, 10.6, 10.7; ClassFieldTheory §13.1; NumberFieldArithmetic §5.10.

### 10.6b The weight datum

*Statement.* With the constants of 10.6, `ε ∈ (0, ε₀)`, `J ≥ 1` and `c_H > 0`, there is `c_Δ⁰`, depending on `ε`, on the
constants fixed before `ε` and on `c_H`, for every `c_Δ ≥ c_Δ⁰` there is `c_h⁰`, depending on `c_Δ`, `c_TO` and the constants
fixed before `ε`, and for every `c_h ≥ c_h⁰` a threshold `x₀(ψ, ε, J, c_H, c_Δ, c_h)`,
such that for `x ≥ x₀`, every host with (h1)–(h5) and the choices of 10.6 at `x`: the hypotheses of ThetaChainsOnDefiniteUnitaryGroups §2.3a, and `SizeSc` (ThetaChainsOnDefiniteUnitaryGroups §2.3b), `SizeGap`, `SizeSep` (ThetaChainsOnDefiniteUnitaryGroups §2.3c); the lower
bounds that ThetaChainsOnDefiniteUnitaryGroups §2.3a, ThetaChainsOnDefiniteUnitaryGroups §2.3, RowTowerAndRallisIdentities §5.3, RowTowerAndRallisIdentities §5.9 (consecutive entries of the row parameter at least `100r⁴`), BesselPoincareSeriesAndGramBounds §5.13, BesselPoincareSeriesAndGramBounds §5.16, BesselPoincareSeriesAndGramBounds §5.18, CongruenceModulesOfThetaLifts §7.10a and
ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a (N1) ask of `Δ_w`, `h₀` and `h_gap`, among them `Δ_w ≥ (T_O + D_Y + 2)(T_O + D_Y + 2 + 2N_m)` and
`h₀ ≥ 4T_O² + t + 1`; the further lower bounds `Δ_w ≥ k^{C}(C·m)³·(x^{c_H}/6)^{C}` (the bound for `Δ_w` in
`c_H`, with a constant `C` fixed before `ε`), `Δ_w ≥ x^{ε/100}·m·N_m`, `h₀ ≥ k·t·x^ε`, `h₀ ≥ x^{ε/100}·k·m^{9/2}` and
`h₀ ≥ N_m·m^{10}` (polynomials in `x`: they hold for `c_Δ ≥ c_Δ⁰`, resp. `c_h ≥ c_h⁰`); the upper bound
`log Δ_w ≤ x^{ε/4}/2` of ThetaChainsOnDefiniteUnitaryGroups §2.3; `√b ≤ w″` (kind (K3)), and
`w_j(τ) ≤ X″·w_{j′}(τ′)` for all steps `j, j′` and places `τ, τ′`;
the half-cut of BesselPoincareSeriesAndGramBounds §5.18a at the letter, of length `(Δ_w − 5)/2` (9.5 (a)); (St) of BesselPoincareSeriesAndGramBounds §5.20a with `C_l ≥ 40`,
`C_u·log b ≤ m − 1` and `m ≥ C_m`, at the weight datum of 10.6, which has `Sc ≤ u_0(τ) − v_0(τ)` at every place and
`u_0(τ) − v_0(τ) ≤ 2Sc`, `u_{k−1}(τ) = v_{k−2}(τ) − ½` off the tops (the adapted data of ThetaChainsOnDefiniteUnitaryGroups
§§2.3a, 2.3b), and the hypotheses of BesselPoincareSeriesAndGramBounds §5.20 for every pair of distinct words (the ratios of two words by
9.4 (c), the window of ThetaChainsOnDefiniteUnitaryGroups §2.8 with ThetaChainsOnDefiniteUnitaryGroups §3.8; `C_l·log b ≤ f·log k`, under which the smallness clause `c_Θ·C_l ≥ 16` of 10.6 gives the
bound `b^{−7}` of BesselPoincareSeriesAndGramBounds §5.20) and of BesselPoincareSeriesAndGramBounds §5.21 for every word, with `e_diag < 1 − δ_old(u)`; the hypotheses of BesselPoincareSeriesAndGramBounds §5.23 (among them
`g₁ > 4r`) with `min(q, d) ≥ exp(x^{ε/(6J)})`, so that `δ_bad ≤ exp(−x^{ε/(7J)})`. In particular `Δ_w`, `ϑ` and `h₀` are polynomial in `x`.

*Route.* The lower bounds for `Δ_w` and for `h₀` by polynomials in `x` (*kind (K2)*): those for `Δ_w` are `(kfx^ε)^{C_l}`,
`T_O²`, `(T_O + D_Y + 2)(T_O + D_Y + 2 + 2N_m)`, `N_m·m^{10}`, `(N_m·f·x^ε)^{C}`, `k^{C}(C·m)³·(x^{c_H}/6)^{C}` and
`x^{ε/100}·m·N_m`, with constants `C` fixed before `ε`: polynomials in `x` whose exponents depend on `ε`, on the constants and
on `c_H`; they hold for `c_Δ ≥ c_Δ⁰`. `Sc = 4kΔ_w` is polynomial in `x`, so `SizeSc` holds for the exponent `C_S` chosen with
`c_Δ` (10.6). Those for `h₀` involve `Δ_w` (through `b/ℓ* = D_*/m`) and hold for `c_h ≥ c_h⁰`. The upper
bounds for `Δ_w`, `Sc`, `ϑ`, `h₀` and the comparisons with `q, d, f_E, X′, w″, b′, b, g_i, T(u)` (*kind (K3)*) each compare a
quantity at most `e^{Cx^{ε/5}log²x}·x^{C}` or `e^{x^{ε/4}}` with `X′ = e^{x^{ε/3}}`, or a quantity at most `X′·e^{x^{ε/4}}·x^{C}`
with `√b`; they hold for `x ≥ x₀` because `ε/5 < ε/4 < ε/3 < ε`. The upper bounds for `Δ_w`, `Sc`, `ϑ`, `h₀` are
`log Δ_w ≤ x^{ε/4}/2`, `log ϑ ≤ x^{ε/4}` and comparisons with `w″`, `b′`, `X′`; no condition bounds them above by a fixed
power of `x`, so the order `c_H`, then `c_Δ`, then `c_h`, then `x₀` is consistent. *Weights.* ThetaChainsOnDefiniteUnitaryGroups §2.3a constructs the datum (nodes in arithmetic progression of step `h₀`; the unit condition by
one residue at one thick place, which exists because `μ_E` is cyclic and `τ₁` maps a generator of it to a generator); off
the tops `u_0(τ) − v_0(τ) = Sc + ½` and `u_{k−1}(τ) = −½ = v_{k−2}(τ) − ½`, and at a top `u_0(τ) − v_0(τ) ≥ a − Sc ≥ Sc`; the
lower bounds that ThetaChainsOnDefiniteUnitaryGroups §2.3a, ThetaChainsOnDefiniteUnitaryGroups §2.3 (`SizeGap`), RowTowerAndRallisIdentities §5.3, RowTowerAndRallisIdentities §5.9, BesselPoincareSeriesAndGramBounds §5.13, CongruenceModulesOfThetaLifts §7.10a and ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a (N1) ask of `h₀` and `h_gap` are polynomials in `x`
(among them `t + 2N_m³ + 1`, `4b/ℓ* + t + 6`, `120r³`, `C r^{19}f^5 x^ε`, `100r⁴`, `4T_O² + t + 1`), so they hold for
`c_h ≥ c_h⁰`. The nodes are at least `w″`, which exceeds every polynomial in `x`, so `e′_j(τ) ≥ k^{C_b}` and
`C_l·m·k·Δ_w ≤ e′_j(τ)`. *Loops (BesselPoincareSeriesAndGramBounds §5.20a, BesselPoincareSeriesAndGramBounds §5.20b).* `C_u·log b = C_u·x^ε ≤ m − 1` and `m ≥ C_m` because `m ≥ x^{1/2−ε/16}` and `ε < 1/52`.
*The two words of BesselPoincareSeriesAndGramBounds §5.20.* 9.4 (c) gives `T(u)/T(u′) ≤ A_V` and the Vandermonde products within `A_V^k` for the absolute `A_V`; 9.4 (d)
gives `T(u) ≥ b^{16m} ≥ b^{c_T m}`; 9.5 (a) gives the half-cut; `C_l·log b = C_l·x^ε ≤ f·log k` because `f ≥ 2x^{A_n}`. *BesselPoincareSeriesAndGramBounds §5.21, BesselPoincareSeriesAndGramBounds §5.23.* `e_diag = 2C₀/Γ₀ + 2e^{−kf log k}` and
`δ_old(u) ≤ 2f/X′` are smaller than any negative power of `x`; `min(q, d) ≥ exp(x^{ε/(6J)})` by (h4); `g₁ > (kb)^8 > 4r`.
*The ratio of two step weights.* Every step weight is at most `2b` (at a top `a⁻_τ + b′/x + m·h₀ ≤ 2b`, at a thick place
`b + ϑ + 1 ≤ 2b`, at a thin place `w″ + ϑ + 1 ≤ 2b`) and at least `w″` (`a⁻_τ ≥ b′ ≥ w″`, `b ≥ w″`), and `X″·w″ = a = x·b` by the
definition of `X″` (ThetaChainsOnDefiniteUnitaryGroups §2.1); so `w_j(τ) ≤ 2b ≤ x·b = X″·w″ ≤ X″·w_{j′}(τ′)` for `x ≥ 2`.

*NEW* (elementary). With the constants of the head of 10.6a: the unit condition of the datum, [FormalProof], `Development/AutomorphicArithmetic/WeightCongruences/ProdNegOneZpow.lean` (`UpperTheory.MUQ`); `SizeSep` with `ℓ*`, `D_*`, `ℓ_A`, [FormalProof], `Formalism/LocalRingCardinality/DataParams.lean` (`Formalism.BasicNotions.LevelStarExponents.lStar`); `e_diag`, `δ_old(u)` and `δ_bad`, [FormalProof], `Formalism/SharpRestriction/GlobalTheoremInputs.lean` (`Formalism.MainNotions.LinkIRR`). *Needs:* ThetaChainsOnDefiniteUnitaryGroups §2.3, ThetaChainsOnDefiniteUnitaryGroups §2.3a, ThetaChainsOnDefiniteUnitaryGroups §2.3b, ThetaChainsOnDefiniteUnitaryGroups §2.3c, ThetaChainsOnDefiniteUnitaryGroups §2.8, ThetaChainsOnDefiniteUnitaryGroups §3.8, RowTowerAndRallisIdentities §5.3, RowTowerAndRallisIdentities §5.9, BesselPoincareSeriesAndGramBounds §5.13, BesselPoincareSeriesAndGramBounds §5.16, BesselPoincareSeriesAndGramBounds §5.18, BesselPoincareSeriesAndGramBounds §5.20, BesselPoincareSeriesAndGramBounds §5.20a, BesselPoincareSeriesAndGramBounds §5.20b, BesselPoincareSeriesAndGramBounds §5.21, BesselPoincareSeriesAndGramBounds §5.23, CongruenceModulesOfThetaLifts §7.10a,
ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a, 9.4, 9.5, 10.6.

### 10.6c The gain parameters

*Statement.* With the constants of 10.6, `ε ∈ (0, ε₀)`, `J ≥ 1`, `c_Δ > 0` and
`c_h > 0`, there is `x₀(ψ, ε, J, c_Δ, c_h)` (it depends on `c_h` through `ϑ`) such that for `x ≥ x₀`, every host with (h1)–(h5) and
the choices of 10.6 at `x`: the size conditions
of LocalGainOfThetaChains §4.10 and LocalGainOfThetaChains §4.16a (`k·Sc + m(t + 1)(ϑ + 1) + k·N_m ≤ min(w″, b′/x)`, `X″ ≤ a`, `2·log_5(a²) + 2 ≤ k − 1`,
`|ν_j(τ)| ≤ a²` for every step `j` and place `τ`,
`T(u) > 2(Λ_j(τ)_a − Λ_j(τ)_b + N_j)`); the hypotheses of LocalGainOfThetaChains §§4.15d–4.15f and LocalGainOfThetaChains §4.17, including `SizeA` with `A_n`, `L₂ ≤ L_b`,
`ρ_B ≤ x^{−2}`, the band condition `2δ_I ≤ ρ_B` of LocalGainOfThetaChains §4.15f at the good places (with `Y_b|𝔗_v|Λ_logb′/k ≤ Δ_b ≤ b′/2`), the tile
condition `(M₀ + 1)(6r_G + 1)⌈1/δ_top⌉ ≤ x^{ε/4}`, `n′_pδ_topω₀ ≥ 4r_G` at the candidates, the two conditions of LocalGainOfThetaChains §4.17c on
`Y_I = x^{A_w/2}` and `Y_II = x^{A_w}`, and the bound on `Z_bad` of LocalGainOfThetaChains §4.17d with its hypothesis `ω₀ ≥ 3/4`
(the size hypothesis `δ_top|A| ≥ 36o²/ω₀²` of the second sentence of FrobeniusRestrictedRieszSums §0.7 (i) holds by
LocalGainOfThetaChains §4.17); and `k ≥ x²·s_max³·log a`, `Λ_log ≤ x^{2ε}` and
`X″·(Sc + k + ϑ)·log(2a) ≤ b` (10.2); and the size conditions `x^ε ≤ Λ_log ≤ x^{ε+ε/100}`, `4Sc ≤ Λ_log·b′/k` and
`4x^{ε/100}·k²·Δ_w ≤ Λ_log·b′`.

*Route.* `ρ_B ≤ x^{−2}` because `k ≥ x^{A_n + 5/2}` and `Λ_log ≤ x^{2ε}`; the band: `2δ_I ≤ ρ_B` (`δ_I` of LocalGainOfThetaChains §4.14b:
`2δ_I = 4Δ_b/b′ + 2C_H·s_max·Λ_log/k`; the first terms are equal, and `2C_H·s_max ≤ C_ρ·log x` because `s_max = N₁ ≤ C·log x`
for `x ≥ x₀`, once `C_ρ` is fixed large);
`Δ_b ≤ b′/2` because `ρ_B ≤ x^{−2}`, and `Δ_b ≥ Y_b|𝔗_v|Λ_logb′/k` because a good orbit has `|𝔗_v| ≤ 40n′δ_top ≤ 80fδ_top`; the
tile condition and `n′_pδ_topω₀ ≥ 4r_G` hold because `x^{ε/4}·δ_top = x^{ε/8}` exceeds every power of `log x`; they would
fail if the exponent of the candidates' orbit length were at most that of `1/δ_top` (the cell length is
`⌈1/δ_top⌉ = ⌈x^{ε/8}⌉`): any pair of exponents `c₁ < c₂ < 1` in place of `1/8 < 1/4` serves; the conditions of LocalGainOfThetaChains §4.17c
hold because `A_w ≥ 2c_io + 2A_max + 4` (the quantities `m|Φ_top|s_max·x^{c_io+2ε}log X′` and
`m|Φ_top|r_G²k·x^{c_io+2ε}log X′` are at most `x^{1/2+A_n+c_io+3ε}` and `x^{3+2A_n+c_io+5ε}` for large `x`); `L₂ ≤ L_b` because
`L₂` is a maximum over the primes inert in `K` and in `ℚ(√−q)` (LocalGainOfThetaChains §4.17), and every such `p` has `p ≥ x^{c_s}` by (h3) and `k·Y_II ≤ x^{A_w+5}`, so `L₁(p) = ⌈4·log_p(k·Y_II)⌉ ≤ ⌈4(A_w + 5)/c_s⌉`;
`k ≥ x^{9/2}` and `s_max ≤ C(ε)·log x` give `k ≥ x²·s_max³·log a`; the conditions of LocalGainOfThetaChains §4.10, LocalGainOfThetaChains §4.16a and
`X″·(Sc + k + ϑ)·log(2a) ≤ b` compare polynomials in `x` (or `X″` times one, `X″ ≤ X′·x^C`) with `w″`, `b′/x`, `b` or `a`, and
`T(u) ≥ b³`, so they are of kind (K3), except `2·log_5(a²) + 2 ≤ k − 1`, of kind (K1) (`log a ≤ 2x^ε`, `k ≥ x^{9/2}`), and
`|ν_j(τ)| ≤ a²`; `ω₀ = 3/4` (10.6), and `δ_top|A| ≥ x^{2+7ε} ≥ 64o² = 36o²/ω₀²` for large `x`.
`|ν_j(τ)| ≤ a²`: the weight `ν_j(τ)` has `N_{j−1} ≤ N_m` rows, each between `0` and `10·x·b`, and `N_m ≤ b/10`; so
`|ν_j(τ)| ≤ N_m·10·x·b ≤ x·b² ≤ a²`.
*The three further bounds.* `Λ_log = C·N₁²·log a` (LocalGainOfThetaChains §4.17) is at least `log a ≥ x^ε`, the constant `C` and
the integer `N₁` being at least `1`. `k ≤ 2x^{A_n+5/2+2ε} ≤ x⁵` and `Δ_w ≤ 2x^{c_Δ}`, so
`16·x·k²·Δ_w ≤ x^{c_Δ+12} ≤ w″` for `x ≥ x₀(c_Δ)` (kind (K3)), and `w″ ≤ b′ ≤ Λ_log·b′`; hence
`4Sc·k = 16k²Δ_w ≤ Λ_log·b′` and `4x^{ε/100}·k²·Δ_w ≤ 4x·k²·Δ_w ≤ Λ_log·b′`.

*NEW* (elementary). With the constants of the head of 10.6a: `p₀ = k²x^{A_w}`, [FormalProof], `Formalism/LocalRingCardinality/DataParams₂.lean` (`Formalism.BasicNotions.Scale.p0`). *Needs:* LocalGainOfThetaChains §4.10, LocalGainOfThetaChains §4.14b, LocalGainOfThetaChains §4.15d, LocalGainOfThetaChains §4.15e, LocalGainOfThetaChains §4.15f, LocalGainOfThetaChains §4.16a, LocalGainOfThetaChains §4.17, LocalGainOfThetaChains §4.17b, LocalGainOfThetaChains §4.17c, LocalGainOfThetaChains §4.17d, 10.2, 10.6.

### 10.6d The size conditions of the congruence modules, the target and the frame

*Statement.* With the constants of 10.6, `ε ∈ (0, ε₀)`,
`J ≥ 1`, `c_Δ > 0`, `c_h > 0` and `c_H ≥ c_H⁰`, there is `x₀(ψ, ε, J, c_Δ, c_h, c_H)` such that for `x ≥ x₀`, every host with (h1)–(h5) and the
choices of 10.6 at `x`: those of CongruenceModulesOfThetaLifts §7.10a on the thresholds and on the length `L_th`, among them its depth hypothesis
(for every prime `ℓ ≥ 11` some `j ≥ 0` with `(ℓ − 1)^j ≥ ℓ_A` and `2j + 2 ≤ L_th`) and the length bound `L_th ≤ C_L·log x` of
CongruenceModulesOfThetaLifts §7.10c (`C_L` of 10.6), the comparisons that the sum CongruenceModulesOfThetaLifts §7.10c uses
(`r + t ≤ N_m + t`, `r ≤ 2k`, `k·|A|²·x^ε ≤ D_*`, `r/ℓ_A ≤ 2m/x^ε`, `(3 + log ℓ_A)² ≤ x^ε`), `SizeThin` of CongruenceModulesOfThetaLifts §7.6 (a)
(`x·r·(Sc + 2η_s + 2σ⁺ + t + x^ε + 4) ≤ m·w″`, `σ⁺ = ⌊2b/ℓ*⌋`), and the sizes that its rows use (`b ≥ 100`,
`2(η_s + t + 1) + Sc ≤ b/10` and `20·max(w_max, η_s + t + 1, Sc) ≤ b`); `f² ≤ rd_E` and `r ≥ 8`; the size conditions of ThetaChainsOnDefiniteUnitaryGroups §2.6 at `L = x^ε`
(`r ≥ 62`, `f ≥ 8`, `L ≥ 4`, `log f ≤ L`, `log g_i ≤ 9L + 1`, `log p_δ, log p′_δ ≤ L`, `log rd_E ≤ 2L`), `3` and `5` split in `K`, and
`gcd(15, g₀g₁) = 1`; for every step, `2·DF(κ_j) + 2 < g_i` (`i = 0, 1`) and `k ≤ min(q, d) − 1` for the weight
`κ_j = λ^W_j` of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19 (the size parts of (P1), (P2) of GluedTargetAndDivisionInequality §8.20); for the degree `T = T_O`, `n_P = 8fr + 4`, `n_W` of 10.6 and every pair of
weights `w_L`, `w_F` that satisfies (N1) of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a at `T = T_O`: the condition (N0) and the conditions (N2) of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a (`SizeGen`, with `R_E = rd_E^{C_R}` for
the constant `C_R` of 10.6) and `DF(w_L) ≥ 3`, and the conditions of GluedTargetAndDivisionInequality §8.20 on the logarithmic size `L = x^ε` (`L ≥ max(3, log k)`,
`log g_i ≤ 9L + 1`, `log rd_E, log d, log f ≤ 2L`, `log p_δ, log p′_δ ≤ L`, `log(1 + DF(w)) ≤ 2L` and `log n(w) ≤ L` for these weights);
the own primes `p_δ`, `p′_δ` are prime to `Q·q·d` (`Q` of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a); the size conditions under which GluedTargetAndDivisionInequality §8.20b bounds the depth errors: `k·b′ ≤ b`,
`g₀, g₁ ≤ b⁹`, `P³T_O² ≤ b`, `(f·r·x^ε)^{12} ≤ b`, `1 < C·DF(w_L) ≤ m·b` and `log(C·DF(w_L)) ≤ 2x^ε` (the cut-off of the good primes in
GluedTargetAndDivisionInequality §8.20), `k·(Sc + η_w)·x^ε ≤ m·b`, `k ≤ X″` and `log k ≤ x^ε`, and
`SizeDep` (ThetaChainsOnDefiniteUnitaryGroups §2.1, 10.6a, `C_dep = 11`), whose number `vd := log₂ Q_S` is the `vd` of GluedTargetAndDivisionInequality §8.20,
which (P4) and the bound at the small primes there use; the size conditions of GluedTargetAndDivisionInequality §8.22 (among them `N_m²·w″ ≤ b` and
`(N_m² + m·k)·b′ ≤ a`) and its hypotheses `r + 1 < g₀, g₁`, `q_z ≤ ¼` (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties
§8.18c (e)) and (H1)–(H3) of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18f (c); `24f·r ≤ min(g₀, g₁)` for
the multiplicities of GluedTargetAndDivisionInequality §8.21 (c); the cost condition `𝔢_u·log T(u) ≤ C·B₀` of GluedTargetAndDivisionInequality §8.23 (LocalGainOfThetaChains §4.9f (e)); those of 9.2 (`T(u) ≥ b³`, `b ≥ 4f`, and,
by LocalGainOfThetaChains §4.17a (ii) at the served primes, `Σ_𝔭 sz_𝔭(τ_N(𝔭)) ≤ b²`), 9.5 (b) and 9.6 (`x^{−c_H} ≤ 1/20`,
`η_off, η_dim, √e_diag ≤ x^{−c_H}/2`, `ϑ_T ≤ 1/4`, and `(η_frame + 4√e_frame)·x^{c_H} ≤ 6`, under
`3√ϑ_T + 4√(2e_diag) ≤ x^{−c_H}`); those of 10.5 for the constant `C_*` of 10.4; and the clauses (i)–(viii) of `Size_□`
(RowTowerAndRallisIdentities §5.8e). (The weights of a run of GluedTargetAndDivisionInequality §8.20 satisfy (N1), and at these parameters (N2) and the page conditions (P1), (P2), (P4)
of `SizePage`, by GluedTargetAndDivisionInequality §8.20 (vii), whose route takes the size conditions from here: for (P4), with `wt_j = 2f·b` and
`A = (2b + Sc)/T`, the conditions `k·b′ ≤ b` and `x ≥ 3`; the conditions (P3) (with the remaining degree `R_w^{tot}`) and (P5)
for these weights are not given here; that the deep covers carry witnesses with `SizeSG` is
ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18c (f) (ii), given witnesses `h₀`, `S_u`, `η_u` of the gap conditions there.)

Clause (o) of `Size_□` (RowTowerAndRallisIdentities §5.8e), the standing size predicates of the chain at the weight datum of
10.6 (ThetaChainsOnDefiniteUnitaryGroups §2.3a), is given, for those that this roadmap states, by: (h1) and the ranks of
10.6 (with the constant `10` of `n_W`; `f = 2|A|` gives `f ≤ m²|A|` and `f ≤ r²`); the predicates of
ThetaChainsOnDefiniteUnitaryGroups §2.1 (among them `SizeQD`, `SizeK`, `SizeW` and `SizeTheta`), `SizeG`,
FrobeniusRestrictedRieszSums §1.8 (iii) and the further bounds of 10.6a; `SizeGap`, `SizeSep`, the lower bounds for `Δ_w` and
`h₀`, (St) and the hypotheses of BesselPoincareSeriesAndGramBounds §§5.20, 5.21 and the further bounds of 10.6b;
`ρ_B ≤ x^{−2}`, the size conditions of LocalGainOfThetaChains §4.16a and the further bounds of 10.6c; and the sizes of
ThetaChainsOnDefiniteUnitaryGroups §2.6 and 9.5 (b) above. Four of these predicates are asked in a stronger form than the
targets above use, and hold at the parameters: `Λ_log ≤ x^{ε+ε/100}` (10.6c), `h₀ ≥ 12b/ℓ* + 2t + 8` and
`h₀ ≥ 4N_m³ + 2t + 6` (10.6b: polynomials in `x`, for `c_h ≥ c_h⁰`), and a word code with at most `2^{k−3}` words (9.5 (b):
`SizeW` gives it with the same margin).

*Route.* *The conditions of ThetaChainsOnDefiniteUnitaryGroups §2.6 and of the deep covers.* `r ≥ k ≥ 62`, `f = 2|A| ≥ 8` and `L = x^ε ≥ 4`
for large `x`, `log f ≤ C·log x ≤ x^ε`, and the other bounds are those of the logarithmic size below; `3` and `5` are
unramified in `K` (`d` being a large prime) and not inert by (H2) (inert-free up to `B_s ≥ 12`), so they split; `g_i > 5`,
so `gcd(15, g₀g₁) = 1`. *The depth hypothesis and the comparisons of CongruenceModulesOfThetaLifts §§7.10a, 7.10c.* `N_m − r = m·t + 1 > 0`; `r ≤ 2k` by (R1); `D_* ≥ k|A|²x^ε` by its definition (ThetaChainsOnDefiniteUnitaryGroups §2.3c);
`r/ℓ_A = r·m·δ_th/(k·x^ε) ≤ 2m/x^ε`; `ℓ_A ≤ x^C`; `j := ⌈log_{10}(k·x^{2ε}/m)⌉` has `(ℓ − 1)^j ≥ 10^j ≥ k·x^{2ε}/m ≥ ℓ_A` for every prime `ℓ ≥ 11` (as
`δ_th ≥ x^{−ε}`) and `2j + 2 ≤ L_th` by the choice of `L_th` in 10.6; that choice gives
`L_th ≤ 4050·log x + 60/ε + 34 ≤ C_L·log x` for `x ≥ x₀(ε)`, as `C_L > 4050`. *The sizes of the rows.* `η_s = ϑ` (ThetaChainsOnDefiniteUnitaryGroups §2.3c), `t` and `Sc` are polynomial in `x`
and `b = e^{x^ε}`, so `b ≥ 100` and `2(η_s + t + 1) + Sc ≤ b/10` (kind (K1)); `w_max ≤ 2b′ = 2x·b/X′` (CongruenceModulesOfThetaLifts §7.8a), so
`20·max(w_max, η_s + t + 1, Sc) ≤ b` (kind (K3)). *`SizeThin`.* `ℓ* = m·b/D_*` with `D_* ≤ x^C`, so
`σ⁺ ≤ 2D_*/m`, `Sc`, `η_s`, `t` and `r` are polynomial in `x`, while `w″ = b/(X′|A|)`: kind (K3). *The logarithmic size `L = x^ε`.*
`log k ≤ C·log x ≤ x^ε`; `log g_i ≤ log 2 + 8(log k + x^ε) ≤ 9x^ε + 1`; `log rd_E ≤ log f_E ≤ 2x^{ε/5}log²x` by (h2), `log d ≤ x^{ε/4}`
by (h4) and `log f ≤ C·log x`; `p_δ, p′_δ ≤ (2o_δf_E)^{L_2}` with `L_2` absolute (ThetaChainsOnDefiniteUnitaryGroups §2.7 (b)), so `log p_δ, log p′_δ ≤ x^ε`; for weights with
(N1), `DF(w) ≤ |κ| ≤ C·k·f·b` and `n(w) ≤ r + t ≤ x^C`: kinds (K1), (K3). *Own primes.* `p_δ, p′_δ ≡ 1 (mod 2o_δf_E)` (ThetaChainsOnDefiniteUnitaryGroups §2.4 (b)), so
they divide neither `f_E`, hence neither `q·d` nor a prime of `S_small`, which supports `Q`. *Depth errors of GluedTargetAndDivisionInequality §8.20b.* `DF(w_L) ≤ |w_L| ≤ C·k·f·b/T_O` by (N1) of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a, and
`T_O ≥ k·f·x` (the binding lower bound for `T_O`, with `P, δ_th^{−1} ≥ 1` and `D_Y ≥ m`), so `C·DF(w_L) ≤ C′·b/x ≤ m·b` and
`log(C·DF(w_L)) ≤ x^ε + C″ ≤ 2x^ε`, and `C·DF(w_L) > 1` as `DF(w_L) ≥ 3` (below). `k·b′ = k·x·b/X′ ≤ b`, `g_i ≤ 2(kb)^8 ≤ b⁹`, and the remaining conditions compare a
polynomial in `x` with `b` or with `X″`, or the logarithm of one with `x^ε`. *(N2) of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a at `T = T_O`.* The conditions on `T`
alone (`T_O ≥ T₀(D_Y, n_W, r, f, p, q)`, `T_O ≥ P⁴D_Y³kf/(mδ₂)`, `T_O ≤ x^{C_deg}`, `P³T_O² ≤ b`, `R_E·P ≤ b`) compare polynomials in
`x` (the lower bounds are those of the Check of 10.6) or `R_E` with `b`. With `R_E = rd_E^{C_R}`: `rd_E ≤ f_E` (ClassFieldTheory
§13.1, both halves), so `log R_E ≤ 2C_R·x^{ε/5}log²x` by (h2), and these are of kind (K3) for every fixed `C_R`. The conditions with
`DF(w_L)` or `DF(κ)` are not comparisons of polynomials: by (N1), `DF(w_L) ≤ |w_L| ≤ C·k·f·b/T_O` and `DF(κ) ≤ |κ| ≤ C·k·f·b`, which
exceed every power of `x` (at a thick place `T_O·W(τ) ≥ b/2` in the page conditions). They hold because they compare these
with `q_* = min(g₀, g₁) > (kb)^8`: `R_E⁴P³DF(w_L)² ≤ q_*`, `T_O·γ₀·R_E·P·DF(w_L)² ≤ q_*`, `(D_Y + 4)·DF(w_L) ≤ q_* − 2`,
`4·DF(w_L) + 4 ≤ q_*`, `2·DF(κ) + 2 < g_i`, `DF(w_L)·2√(2fm) < q_*`, and `c ≤ R_E·P·DF(w_L)²/q_* ≤ b^{−5}`, which gives
`T_O·c·γ₀ ≤ 1` and `f·m³·R_E²·c ≤ ½`, all for `x ≥ x₀`. Also `k ≤ min(q, d) − 1`, because `q, d > x^{2C_t+5}` (10.6a) while
`k ≤ 2x^{A_n+5/2+2ε}` and `A_n + 5/2 + 2ε < 2C_t + 5`. `f² ≤ rd_E` because `rd_E ≥ d^{1/2}` (ClassFieldTheory §13.1, first half: the characters of `G` ramified at `d`
are half of them, each of exponent `1` there) and `log d ≥ x^{19ε/(100J)}` by (h4), while `f ≤ 4x^{A_n}`; `r ≥ k ≥ 8`; `DF(w_L) ≥ f·k ≥ 3` because the entries
of `w_L` are weakly decreasing with positive last entries (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a (N1)). *Size conditions of GluedTargetAndDivisionInequality §8.22.* `N_m ≤ x^{C_t+2}` is
polynomial, `w″ = b/(X′|A|)` and `b′ = a/X′`, so `N_m²·w″ ≤ b` and `(N_m² + m·k)·b′ ≤ a`; the others are of the kinds
(K1)–(K3); `r + 1 < g₀, g₁` and `24f·r ≤ min(g₀, g₁)` because `g_i > (kb)^8`. *9.2, 9.5, 9.6, 10.5.* `T(u) ≥ b^{16m} ≥ b³` (9.4 (d)); `τ_N` vanishes except at the served primes `p ≤ X″` outside `Drop`,
and there the conclusion of LocalGainOfThetaChains §4.17a (ii), `D_ℛ(p) ≤ Σ_jΣ_{τ∉Φ_top(𝔭)}V_{j,τ}(p) + m|Φ_top|·ℒ(p) + m·ℒ_f(p)` with all `V_{j,τ}(p) ≥ 0`
(10.1 (b)), gives `τ_N(p) ≤ Σ_j g^D_j(p) + m|Φ_top|·ℒ(p) + m·ℒ_f(p)`; with `g^D_j(p) ≤ 4|Φ_top|a/p` (LocalGainOfThetaChains §4.17a (ii), summed over `p ≤ X″` by Mertens' first theorem,
AnalyticNumberTheoryPartI §0.11) and the sums of `ℒ`,
`ℒ_f` in the route of 10.2 (the sandwich exponent `e_p ≤ ℒ_f(p)` is inside), `Σ_𝔭 sz_𝔭(τ_N(𝔭)) = Σ_p 2 log p·τ_N(p) ≤ C·m|Φ_top|·(a·log X″ + b) + C·m·f·X″·(N_m²·log 2a + log²2a)`,
which is at most `b²` for `x ≥ x₀`; 9.5 (b) holds under `SizeW` with `C_W ≥ 4C_Γ/log 2 + 1`;
the conditions of 9.6 and `3√ϑ_T + 4√(2e_diag) ≤ x^{−c_H}` hold because `ϑ_T ≤ max_u δ_old(u) ≤ 2f/X′` and
`e_diag = 2C₀/Γ₀ + 2e^{−kf log k}` are smaller than any negative power of `x`, as are `η_off`, `η_dim` (9.6 (b)), so
`(η_frame + 4√e_frame)·x^{c_H} ≤ 6`; the conditions of 10.5 are `La ≤ 2x^ε` (ThetaChainsOnDefiniteUnitaryGroups §2.1), `log k ≤ x^ε`,
inequalities between `a`, `b`, `b′`, `X″`, `m`, `k` of kind (K1) or (K3), `δ_bad ≤ exp(−x^{ε/(7J)})` (10.6b), and
`200(1 + C_*)(1 + c_H) ≤ x^ε`, which holds for `x ≥ x₀` because `C_*` and `c_H` are fixed before the scale. *The small
primes.* The bound with `vd = log₂ Q_S` is the computation of `SizeDep` in 10.6a. At the parameters of the chain the
witnesses `h₀`, `S_u`, `η_u` of the gap conditions of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18c (f) are the
node gap `h₀` of 10.6, `S_u = Sc` and `η_u = m·h₀` for every word, with `P·(Sc + m·h₀) ≤ 100·w″` (kind (K3)) and, for the degree
`T = ⌈P²·D_Y²·k/m⌉` of the deep covers, `4T² ≤ h₀` and `P·T·r·f²·m²·k·D_Y ≤ h₀` (polynomials in `x`: they hold for
`c_h ≥ c_h⁰`). `q_z ≤ ¼`: the size conditions of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18c (f) (ii) contain
`q_z·P_S·|λ^W_j|₁ ≤ b`, and `P_S·|λ^W_j|₁ ≥ 4b` (`|λ^W_j|₁ ≥ b` at a thick place, `P_S ≥ 4`). Not given here:
the verification of the clauses (i)–(viii) of `Size_□` from the predicates of 10.6a–10.6d, that of (N0) of
ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a for the runs, and of (H1), (H2) of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18f (c) at the
parameters.

*NEW* (elementary). With the constants of the head of 10.6a: the conditions on `DF(κ_j)`, `DF(w_L)` and (N2), [FormalProof], `Development/AbelianVarietyTheory/Proofs/JetHarmonics/DegreeWeightKappaLePageBound.lean` (`GlobalTheory.RunDepth.DF_kaR_le`); the logarithmic size, `k·b′ ≤ b` and `g₀, g₁ ≤ b⁹`, follow from [FormalProof], `Development/AbelianVarietyTheory/BlockTheory/DivisorBase/LevelPlusSubgroup.lean` (`GlobalTheory.IndefiniteRowSideFullHecke.LevelPlusSubgroup.SizeRows`), `Development/AbelianVarietyTheory/Proofs/FoundationProofs/ThreeLeScaleOfPowBound.lean` (`GlobalTheory.IndexAssembly.SizeRows`). *Needs:* ThetaChainsOnDefiniteUnitaryGroups §2.3, ThetaChainsOnDefiniteUnitaryGroups §2.3c, ThetaChainsOnDefiniteUnitaryGroups §2.4, ThetaChainsOnDefiniteUnitaryGroups §2.7, LocalGainOfThetaChains §4.9e, LocalGainOfThetaChains §4.9f, LocalGainOfThetaChains §4.17a, RowTowerAndRallisIdentities §5.8e, CongruenceModulesOfThetaLifts §7.6, CongruenceModulesOfThetaLifts §7.10a, CongruenceModulesOfThetaLifts §7.10c, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18c, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18f, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a, GluedTargetAndDivisionInequality §8.20, GluedTargetAndDivisionInequality §8.20b, GluedTargetAndDivisionInequality §8.21, GluedTargetAndDivisionInequality §8.22, GluedTargetAndDivisionInequality §8.23, 9.2, 9.4, 9.5, 9.6, 10.1, 10.2,
10.4, 10.5, 10.6, 10.6a, 10.6b, 10.6c; ClassFieldTheory §13.1; AnalyticNumberTheoryPartI §0.11.

### 10.7 Hosts at every scale, and on windows

*Statement.* Let `ψ` be a primitive Dirichlet character of
order `o` and conductor `f_ψ`, the constants of 10.6 (among them the box width `c_box`), `ε ∈ (0, ε₀)` and `A_n = 2 + 8ε` as
there, and `J ≥ 1` the window constant of 10.6 (UniformWildKernelBounds §7.6 at the parameters named there, which covers every
layer `n ≥ 2` with `2^n ≤ x^{A_n+1}` at each scale). Put `N₀ := 8f_ψ`.

(a) For every large `x` there are `Y ∈ [x^{1/J}, x]` and a `B`-admissible pair `(q, d)` (FrobeniusRestrictedRieszSums §0.9) with `B = Y^{ε/5}`,
`log q ∈ (Y^{ε/5}/2, Y^{ε/5}]`, `log d ∈ (Y^{ε/5}log²Y/2, Y^{ε/5}log²Y]`, `q > N₀`, such that:
- (α) for every Dirichlet character `κ` modulo `f_ψ` and `(i, j) ∈ {0, 1}² ∖ {(0, 0)}` the primitive character `χ` inducing
  `κ·(·/q)^i·(·/d)^j` has `|G_χ(y)| ≤ y^{1/2+ε/2}` and `|(L′/L)(1, χ)| ≤ 4 log Y` for `y ∈ [Y, Y^J]`;
- (β) for every real primitive `ρ` of conductor dividing `N₀` and `(i, j) ≠ (0, 0)` the primitive character inducing
  `ρ·(·/q)^i·(·/d)^j` has no zero with `Re s > 1 − c_box` and `|Im s| ≤ N₀·e^B·e^{j·B·log²Y}` (a height exceeding its
  conductor).
For the layer `n = n(x)` with `|A| ∈ [x^{A_n}, 2x^{A_n}]` (`|A| = c(ψ)·2^n` for `n ≥ n₀(ψ)`, FrobeniusRestrictedRieszSums §0.4 (iii); so `n(x) ≥ 2` and
`2^{n(x)} ≤ 2x^{A_n} ≤ x^{A_n+1}` for large `x`: the layer is one to which the window theorem applies) the pair satisfies
the hypotheses of FrobeniusRestrictedRieszSums §0.4 (FrobeniusRestrictedRieszSums §0.9 (iv)), and the host `E = E_n(ψ, {q, d})` has:
(i) for every character `χ` of `G` trivial on `A₀` and not kept (FrobeniusRestrictedRieszSums §0.5 (iv)), `|G_{χ*}(x)| ≤ x^{1/2+ε}` and
`|(L′/L)(1, χ*)| ≤ 4·log x` (hypothesis (ii) of FrobeniusRestrictedRieszSums §1.9 with `C′ = 4`);
(ii) every real character of `G` is `ρ·(·/q)^i·(·/d)^j` with `ρ` real primitive of conductor dividing `N₀`; so the pair
satisfies the thin-scale box hypothesis of FrobeniusRestrictedRieszSums §1.4 (a), every exceptional zero of a real `χ*`, `χ ∈ Ĝ`, has
`1 − β ≥ c_ex := min(c_ex(ψ), c_box)` (`c_ex(ψ)` the gap of the finitely many `ρ`, independent of `x`), `log f_E ≤ 2x^{ε/5}·log²x`,
and by FrobeniusRestrictedRieszSums §1.4 (b) `E` satisfies the prime number theorem with saving `s_th = e^{−x^{ε/8}}` beyond `X′/3`;
(iii) the host is inert-free up to `B ≥ x^{ε/(5J)}` (FrobeniusRestrictedRieszSums §0.9 (iii)), in particular up to `12` for large `x` (`SizeInert` of ThetaChainsOnDefiniteUnitaryGroups §2.1);
`log q ≥ x^{ε/(6J)}`, `log d ≥ x^{ε/(5J)}`, `d ≥ x²`, `log d ≤ x^{ε/4}`, `|(L′/L)(1, χ_K)| ≤ 4 log x` and
`log rd_E ≤ x^ε` (with the windows of `log q`, `log d` in (a), these give the bounds of `SizeQD` of
ThetaChainsOnDefiniteUnitaryGroups §2.1 on `log q`, `log d` and `(L′/L)(1, χ_K)`, and the separate clause `log d ≤ x^{ε/4}` of
(h4) in 10.6, for large `x`; the bound `rd_E ≤ (Q_S/2)·√(q·d)` of `SizeQD`, `Q_S = f_E/(q·d)`, holds for every host of
FrobeniusRestrictedRieszSums §0.4, ThetaChainsOnDefiniteUnitaryGroups §2.1);
(iv) type and auxiliary primes as in ThetaChainsOnDefiniteUnitaryGroups §2.7, tops `Φ_top ⊂ A` as in 10.6 (h5) and a thick set `𝒯 ⊂ A₀` as in the choices of 10.6,
so that the host, `Φ_top` with its coset law and precision `η_top ≤ x^{−1+ε}`, and `𝒯` are cyclic host data at `x` in the sense
of FrobeniusRestrictedRieszSums §1.7 once the weights of 10.6 are added;
(v) `E` satisfies `HostSplitting E` (FrobeniusRestrictedRieszSums §0.3: `4 | f`, and every place of `F` above a prime dividing `f_E` splits in `E`), so the
unramified splitting character `η̃` of ThetaChainsOnDefiniteUnitaryGroups §2.4 (b) exists.

(b) The set of scales `x` at which, moreover, the groups `Ш¹(E, ℓ, e)`, `ℓ` prime,
`0 < e < ⌊x^{C_t}⌋`, are finite and `V(E, ⌊x^{C_t}⌋) ≤ e^{x^ε}` (Conventions) has windows of exponent `3/2`, hence of every
exponent `λ_W ∈ (1, 3/2]` (PositivityOfDirichletSeriesWithKernels §6.9 (a)).

*Route.* Fix the layer `n(x)` (FrobeniusRestrictedRieszSums §0.4 (iii)); there is `x_lay(ψ)` such that `n(x) ≥ 2` and `2^{n(x)} ≤ x^{A_n+1}` for
`x ≥ x_lay(ψ)`. UniformWildKernelBounds §7.6 at the parameters of 10.6 (rank exponent `C_t`, layer exponent `A_n + 1`,
`ε ≤ 2`) gives the window constant `J` and a threshold `X₀`; enlarge `X₀` so that `X₀^{1/J} ≥ x_lay(ψ)`. Then for every `X ≥ X₀` and every pair of primes
`q ≡ 3 mod 8`, `d ≡ 7 mod 16` (the classes of a `B`-admissible pair, FrobeniusRestrictedRieszSums §0.9), not dividing `f_ψ`, larger than `2X^{C_t} + 1 + P(ψ)` and with
`log q + log d ≤ Y₀^{ε/4}`, `Y₀ = X^{1/J}`, there is `Y′ ∈ [Y₀, X^{1/2}]` such that for every `x ∈ [Y′, Y′²]`, applying UniformWildKernelBounds §7.6 at the
layer `n = n(x)` (allowed, as `x ≥ Y₀ ≥ x_lay(ψ)`), the groups `Ш¹(E, ℓ, e)`, `0 < e < ⌊x^{C_t}⌋`, are finite and
`V(E, ⌊x^{C_t}⌋) ≤ e^{x^ε}` (the ranks of 10.6 satisfy `t ≤ ⌊x^{C_t}⌋`, and `V(E, t)` is monotone in `t`). Choose `(q, d)` at `Y = Y₀`
by the two-step twist selection QuadraticTwistSelectionOverPrimes §2.7d (ii), with the conductor bounds `F₁ = N₀` and
`F₂(q) = N₀U₁` (`U₁ ≥ q`), where `B = Y^{ε/5}`, `U₁ := e^B`, `U₂ := e^{B·log²Y}`; with the box width `δ₀ = c_box`, the exponent
`τ = ε/2` of the bound for `G_χ`, the window exponent `K = J`, `Ξ₀` the primitive characters inducing the characters modulo `N₀`
(a finite set depending on `ψ` alone), and the progressions encoding FrobeniusRestrictedRieszSums §0.9 (`q ≡ 3 mod 8`; `d ≡ 7 mod 16`, `q | d + 1`, every odd
prime `≤ B` dividing `d + 1`), it gives the box heights `N₀U₁` for `j = 0` and `N₀U₁U₂` for `j = 1`. At `c_box = 1/400` this
is the instance of QuadraticTwistSelectionOverPrimes §2.7d (ii′), with the bounds (a′)–(c′) of
QuadraticTwistSelectionOverPrimes §2.7c. Its hypotheses at the second
step are those verified in the Check of QuadraticTwistSelectionOverPrimes §2.7d, whose computation bounds `log q` by `B`; the two that involve `F₂`:
`F₂ ≤ U₂^{1/2}`, as `log(N₀U₁) = log N₀ + B ≤ ½B·log²Y = ½·log U₂`, and `log(F₂U₂) = log N₀ + B·(1 + log²Y) ≤ Y^{1/5}` (the
size exponent `1/5` of QuadraticTwistSelectionOverPrimes §2.7c), both for large `Y` since `ε/5 < 1/5`. The bound `|(L′/L)(1, χ)| ≤ 4 log Y` is
QuadraticTwistSelectionOverPrimes §2.7c (b) for these characters: `log log(FU) ≤ (ε/5 + o(1))·log Y` at both steps, and `c_box ≥ ε₀/8 > (2 + 1/4)·ε/20`, so
`((2 + 1/4)/c_box)·log log(FU) + C₂ ≤ 4 log Y` for large `Y`; at `c_box = 1/400` it is the second bound of
QuadraticTwistSelectionOverPrimes §2.7c (b′), `1000·log log(FU) + C₂ ≤ (200ε + o(1))·log Y ≤ 4 log Y` as `ε < 1/50`. The selected pair satisfies the two size conditions of UniformWildKernelBounds §7.6,
because `log q > Y^{ε/5}/2` and `log q + log d ≤ Y^{ε/5}(1 + log²Y) ≤ Y^{ε/4}` for large `X`. So every `x ∈ [Y′, Y′^{3/2}]`
is a scale of the set of (b), with the layer `n(x)` and the pair chosen at `Y`, and `x ∈ [Y, Y^J]`, that is
`Y ≥ x^{1/J}`; `X` arbitrary gives windows arbitrarily far out (PositivityOfDirichletSeriesWithKernels §6.9 (a)). At each such `x`: `q > e^{Y^{ε/5}/2} > N₀`, and
`Y^{ε/5} ≥ f_ψ` puts every odd prime of `f_ψ` below `B`, so FrobeniusRestrictedRieszSums §0.9 (iv) gives the hypotheses of FrobeniusRestrictedRieszSums §0.4;
`log f_E ≤ log(8f_ψ) + n(x) + log q + log d ≤ 2x^{ε/5}log²x`. (i) By FrobeniusRestrictedRieszSums §0.5 (iv) the non-kept characters trivial on `A₀` induce the
twists `κ·(·/q)^i·(·/d)^j`, `κ ∈ 𝒦(ψ)`, `(i, j) ≠ (0, 0)`, covered by (α) at `y = x`. (ii) A real character of `G` has conductor
dividing `2^{n+2}·f_ψ·q·d`; it factors as a real primitive character of conductor dividing `2^{n+2}f_ψ` times `(·/q)^i(·/d)^j`,
and a real primitive character has `2`-part of its conductor dividing `8`, so `ρ` has conductor dividing `N₀`; for
`(i, j) ≠ (0, 0)` (β) applies, and for `(i, j) = (0, 0)` `ρ` is one of finitely many characters independent of `x`, whose zeros
have a gap `c_ex(ψ)` (FrobeniusRestrictedRieszSums §1.4 (a)); FrobeniusRestrictedRieszSums §1.4 (b) with the conductor bound gives the saving. (iii) FrobeniusRestrictedRieszSums §0.9 (iii) with `B = Y^{ε/5} ≥ x^{ε/(5J)}`;
the sizes from the windows of `q`, `d` and `Y ≥ x^{1/J}`; `χ_K` is the twist `(·/d)` of the trivial character, so (α) bounds
`(L′/L)(1, χ_K)`. (iv) The type and auxiliary primes come from ThetaChainsOnDefiniteUnitaryGroups §2.7 (RieszSumsOverPrimesAndExceptionalZeros §§1.7b (iii), 2.9b (iv)(c′)),
the tops from FrobeniusRestrictedRieszSums §0.7 (with probability at least `1/2`) and the thick set from FrobeniusRestrictedRieszSums §0.8a. (v) FrobeniusRestrictedRieszSums §0.9 (vi), since the pair is
admissible and `n(x) ≥ 2` (the odd character `χ_{−q}·χ′`, `χ′ ∈ 𝔛_n` of order `4`, is trivial at `d`, so complex conjugation is
not in the decomposition group at `d`); ThetaChainsOnDefiniteUnitaryGroups §2.4 (b) then gives `η̃`. (a) at an arbitrary large `x` is the same without the
window bound: take `Y = x`.

*Check.* Without (b), (a) holds at every large `x`: the windows of the whole argument come from the bound for `V(E, t)`
only. A set containing `[Y, 2Y]` for arbitrarily large `Y` need not have windows of any exponent `λ_W > 1`
(PositivityOfDirichletSeriesWithKernels §6.9); here the windows are multiplicative, `[Y′, Y′^{3/2}]`. For `n ≥ 1`, `(2/·)` is a character
of `G` (it lies in `𝔛_n`) and `(2/·)·(·/q)` is a real character of `G` that is a twist of no power of `ψ` unless
`(2/·) ∈ ⟨ψ⟩`: the boxes must be taken for the real characters of conductor dividing `8f_ψ`, not only for the cyclic family.
(v) needs `n ≥ 2`: for `ψ = 1`, the host of the admissible pair `(3, 71)` at the layer `n = 1` fails `HostSplitting E` (FrobeniusRestrictedRieszSums §0.4, Checks). The
pair `(19, 526679)` of FrobeniusRestrictedRieszSums §0.9's Checks satisfies the arithmetic conditions of (a) and (v) for `ψ = 1` (`B`-admissible for `B < 13`,
`q > 8f_ψ`, `HostSplitting E` from `n = 2` on); it is not in the size ranges of (a).

*KNOWN* ingredients, *NEW* packaging. (a), the pair, (i) and (iii): [FormalProof], `Development/AutomorphicArithmetic/CharacterBoxes/Supply.lean` (`UpperTheory.Top.GChi`), `Development/AbelianVarietyTheory/Definitions/GlobalTwisting/PairRowIffQdRows.lean` (`GlobalTheory.EX.PairRow`). *Needs:* FrobeniusRestrictedRieszSums §0.3, FrobeniusRestrictedRieszSums §0.4, FrobeniusRestrictedRieszSums §0.5, FrobeniusRestrictedRieszSums §0.7, FrobeniusRestrictedRieszSums §0.8a, FrobeniusRestrictedRieszSums §0.9, FrobeniusRestrictedRieszSums §1.4, FrobeniusRestrictedRieszSums §1.7, FrobeniusRestrictedRieszSums §1.9, ThetaChainsOnDefiniteUnitaryGroups §2.1, ThetaChainsOnDefiniteUnitaryGroups §2.4, ThetaChainsOnDefiniteUnitaryGroups §2.7, 10.6;
UniformWildKernelBounds §7.6; QuadraticTwistSelectionOverPrimes §§2.7c, 2.7d (ii), (ii′); RieszSumsOverPrimesAndExceptionalZeros §§1.7b (iii), 2.9b (iv)(c′);
PositivityOfDirichletSeriesWithKernels §6.9 (a); BernoulliBoundsForClassGroupEigenspaces §6.17.

### 10.8 Nonvanishing at the parameters

*Statement.* At the parameters of 10.6, for a host as in 10.7 (a) and
`x ≥ x₀(ε)`, (a), (b) and (c) hold, (d) holds under the hypotheses of RowTowerAndRallisIdentities §5.12, and (e) under
those of RowTowerAndRallisIdentities §5.11:
(a) the target rows are nonzero: `D_all > 0`, `D_rows = dim 𝔼 > 0`, and the rows of the base level `𝔼_0` are nonzero;
(b) `d_u > 0` for every word `u`;
(c) `P_u` is nonzero on the `T(u)`-new forms;
(d) the descent `ι_ξ` of RowTowerAndRallisIdentities §5.12 is onto `𝔼_0` and onto `𝔼` for every tuple;
(e) the descent constant `𝔫` and every Rallis eigenvalue `λ_j(ξ, 𝔥, σ)` are positive.

*Route.* (a) `d_u^{all} > 0` (ThetaChainsOnDefiniteUnitaryGroups §3.8 (b)) and the diagonal Gram defect of BesselPoincareSeriesAndGramBounds §5.21 (iii) is `e_diag·d_u^{all}` with
`e_diag = 2C₀/Γ₀ + 2e^{−kf log k} < 1`; if `ℋ` were `0`, then `P_u = 0`, `K(u, u) = 0` and `‖K(u, u) − 1‖²_HS = d_u^{all} > e_diag·d_u^{all}`;
so `D_all > 0`. Then `D_rows ≥ (1 − δ_bad)·D_all > 0` by BesselPoincareSeriesAndGramBounds §5.23 (iii). The base level: `𝔼^♮ = Π_good·ℋ^♮` is a `G₀`-module (RowTowerAndRallisIdentities §5.3)
containing `𝔼 = 𝔼_1 ≠ 0`; a good label tuple is squarefree at every place (RowTowerAndRallisIdentities §5.3 (iii)), and the characters of a squarefree
label of `GL_r(𝔽_g)` form a single character, which is generic (FiniteReductiveGroups §5.7); so every
irreducible constituent of `𝔼^♮` contains the Gelfand–Graev character `χ_{P_0}` of `P_0` exactly once (FiniteReductiveGroups §2.2), and
`dim 𝔼_0` is the number of these constituents, at least `1`. (b) The rank formula of ThetaChainsOnDefiniteUnitaryGroups §3.8 (b):
`d_u·(T − 1)^f = d_u^{all}·(T − 2)^f > 0`. (c) BesselPoincareSeriesAndGramBounds §5.21 (v) with `e_diag < 1 − δ_old(u)` (10.6b). (d) RowTowerAndRallisIdentities §5.6, RowTowerAndRallisIdentities §5.12. (e) RowTowerAndRallisIdentities §5.11 with (a).

*NEW*. (a): [FormalProof], `Formalism/SharpRestriction/GlobalSchurBounds/TopDensityNGeSixteen.lean` (`Formalism.MainNotions.Lnk.dall_pos`), `Formalism/LocalToGlobal/IndefiniteForms/IndefiniteTree/ExampleSatisfiesConditionsAtFive.lean` (`Formalism.L2.Indef.Tree.RankRows`); (c): follows from [FormalProof], `Formalism/SharpRestriction/GlobalSchurBounds/TopDensityNGeSixteen.lean` (`Formalism.MainNotions.Lnk.unfolding_constant_pos_of_diagonal`). *Needs:* ThetaChainsOnDefiniteUnitaryGroups §3.8, RowTowerAndRallisIdentities §5.3, RowTowerAndRallisIdentities §5.6, RowTowerAndRallisIdentities §5.8d, RowTowerAndRallisIdentities §5.8e, RowTowerAndRallisIdentities §5.11, RowTowerAndRallisIdentities §5.12, BesselPoincareSeriesAndGramBounds §5.21, BesselPoincareSeriesAndGramBounds §5.23, 10.6, 10.6b, 10.7; FiniteReductiveGroups §§2.2,
5.7.

### 10.9 Chain data at a scale

*Statement.* Let `ψ` and `ε ∈ (0, ε₀)` be given, let `x ≥ x₀` be a scale of the
window set of 10.7 (b) with host `E`, tops `Φ_top` and thick set `𝒯`, and make the choices of step (5) of 10.6. Then for every
translate `u₀ ∈ A₀`, every choice of the data of step (6a) of 10.6 and every twisting datum (6b) of ThetaChainsOnDefiniteUnitaryGroups §2.5 with sign `s = +1` and (T1), whose
prescribed set `Z₀` consists of the places above the level primes and above `p_□` (RowTowerAndRallisIdentities §5.8a) and whose set of twisted places contains
the set `Tw₀` of (c) and consists of places above admissible twisting characteristics, the resulting `𝒞𝒟(u₀)` are chain data
(10.0) with translate `u₀` such that (a),
(b), (d)–(f) below hold, and the characters of the twisting datum can be chosen so that moreover the twisting datum is good (c):

(a) *Shared data.* The `𝒞𝒟(u₀)` have the same host, ranks, tops, thick set, type and auxiliary primes, top weights and word
code; their step weights, level primes, coefficient fields, characters and lattices are chosen independently.

(b) *Levels and sizes.* The type primes satisfy `g₀, g₁ > max(2fk + 1, 4fr, 16(r + t)²)`, `𝔅(r, g₀) ∩ 𝔅(r, g₁) = ∅` (ThetaChainsOnDefiniteUnitaryGroups §2.7),
and `16qd | g_i − 1` (`g_i ≡ 1 mod f_E`); every level prime satisfies `T(u) > 2f·N_m + 1`, `T(u) ≥ X′` and
`T(u) ≡ T(u′) (mod (g₀g₁)²)`; the tame parameters `χ_1, …, χ_m ∈ 𝔽_{g_i}^×` that ThetaChainsOnDefiniteUnitaryGroups §2.4 (b) fixes at each place above a type prime
are squares and `1, χ_j, χ_j^{−1}` are `2m + 1` distinct elements, still distinct after removing the `ℓ`-parts for every
`ℓ ∉ 𝔅(r, g_i)` (ThetaChainsOnDefiniteUnitaryGroups §2.9a (c)); consecutive nodes at a place are `h₀` apart and a node and the next step weight `h₀/2` apart, inside
a window of width `ϑ = m·h₀ + |μ_E|` (ThetaChainsOnDefiniteUnitaryGroups §2.3a, 10.6), which gives the gap conditions of ThetaChainsOnDefiniteUnitaryGroups §2.3, RowTowerAndRallisIdentities §5.3, BesselPoincareSeriesAndGramBounds §5.13 and ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.17; the
auxiliary prime of the grid satisfies `p_□ < g₀`, `p_□ ∉ {g₁, p_δ, p′_δ}` and `log p_□ ≤ L`; and all size
conditions of 10.6a–10.6d hold.

(c) *Twisting.* Let `Tw₀` be the set of places `𝔭` of `𝕃` such that, for some step `j`, at `𝔭` or at `c_𝕃(𝔭)` the base tuple
has a nonzero *signed* index (the difference of the two relative lengths) of its lattice of theta lifts against the integral
lattice of the step (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a), or of its projected lattice against the dual (CongruenceModulesOfThetaLifts §7.15), or the bulk `F_j` of LocalGainOfThetaChains §4.9f (d) is nonzero.
Then `Tw₀` is finite and `c_𝕃`-stable; it contains the places above `g₀`, `g₁`, `d` and above the primes `≤ X″` inert in `K`
(the bulk is nonzero there), so every such twisting datum, in particular the one with `Tw = Tw₀` and the one with all the
places above the admissible twisting characteristics, satisfies (T2) of ThetaChainsOnDefiniteUnitaryGroups §2.5 and (T3) of
GluedTargetAndDivisionInequality §8.20: outside `Tw` the base tuple has signed index `0` at every step and `F_j = 0`.
The data at `𝔭` and at
`c_𝕃(𝔭)` are equal (ThetaChainsOnDefiniteUnitaryGroups §2.5). With the prescribed set `Z₀` of ThetaChainsOnDefiniteUnitaryGroups §2.5 (b) equal to the set of places above the level primes `T(u)` and above
`p_□` (RowTowerAndRallisIdentities §5.8a) (no place above `p_δ`, `p′_δ` lies in it: `v_□ ∉ S₀`, RowTowerAndRallisIdentities §5.8a, and the level primes are not `p_δ`, `p′_δ`, ThetaChainsOnDefiniteUnitaryGroups §2.8), so
that the places `A(ℓ)` above `p_δ`, `p′_δ` at which `δ_ℓ` ramifies avoid `Z₀`, the characters `ψ_𝔭` can be chosen by
CongruenceModulesOfThetaLifts §7.8 (2), under its hypotheses (among them `r ≥ 100` and `g₀, g₁ ≥ 2r`, which GluedTargetAndDivisionInequality §8.19e assumes as
well; they hold by (b) and `r ≥ k ≥ x^{9/2}`), after the data of (6a), so that the twisting datum is good (CongruenceModulesOfThetaLifts §7.10a): at every
twisted place `𝔭 | ℓ`, `ψ_𝔭` is an `ℓ^{−2}`-good twist at `𝔭` in the sense of CongruenceModulesOfThetaLifts §7.8 (2), for the polynomial conditions of GluedTargetAndDivisionInequality §8.19e
(a) and, by GluedTargetAndDivisionInequality §8.19e (b), (c), those of the twisted theta lattices, which GluedTargetAndDivisionInequality §8.19e gives as polynomial conditions of the second kind of
SelmerLengthBoundsAndLocalLifting §3.25b (2), the form that CongruenceModulesOfThetaLifts §7.8 (2) takes.

(d) *Budgets.* `V(E, ⌊x^{C_t}⌋) ≤ e^{x^ε} = b ≤ B₀`, so the host has wild-kernel budget `κ_W = 1` (CongruenceModulesOfThetaLifts §7.11); for the good twisting datum of (c), CongruenceModulesOfThetaLifts §7.11 then bounds the congruence
lengths (under the hypotheses of CongruenceModulesOfThetaLifts §7.10a, its depth hypothesis among them, and the length bound `L_th ≤ C_L·log x` of
CongruenceModulesOfThetaLifts §7.10c, as (H1) and 10.6a–10.6d give them; the constant `C` depends only on `C_L`, `C_t`, `A_max`): the sum of the rows of CongruenceModulesOfThetaLifts §7.10a (CongruenceModulesOfThetaLifts §7.10c), divided by `d^Z_j`, is at most `C·f·m·b·x^{2ε} + V(E, t) ≤ (C + 1)·x^ε·B₀` per step
(CongruenceModulesOfThetaLifts §7.11), so `C·m·x^ε·B₀` over the `m` steps. In that sum the invariant terms of the split rows, at most
`r·(2 + r·(2s_w + 2 + 2·log_ℓ(4h)))` at each of the at most `2f` places (CongruenceModulesOfThetaLifts §7.10a), add up to at most `C·f·t·(r + t)·x^ε`, which
`C·B₀` absorbs because `r + 5 ≤ t` (ThetaChainsOnDefiniteUnitaryGroups §2.1, Lemma). The exponents of weight elimination add up, per
step, to `Σ_ℓ 𝔧_j(ℓ)·log ℓ ≤ 30·|Φ_th|·m·b·x^{2ε} + 2·m·b ≤ 16·x^ε·B₀` (CongruenceModulesOfThetaLifts §7.16a (3) (b); the factor is the number `|Φ_th| = |𝒯| ≤ f/2`
of thick places), which the per-step error `C·x^ε·(B₀ + N_c)` of GluedTargetAndDivisionInequality §8.20b absorbs.

(e) *Losses and the host.* The host is inert-free up to `max(12, x^{ε/(5J)})` (`SizeInert`, which CongruenceModulesOfThetaLifts §7.10a assumes: every prime
inert in `K` is at least `13`, and every place of `F` above `2` or `3` splits in `E = FK`, as RowTowerAndRallisIdentities §5.5 and RowTowerAndRallisIdentities §5.8b ask), it satisfies
`HostSplitting E` (10.7 (a) (v)), `2^n ≥ x²` and `d ≥ x²`; the served data and the top-weight vector are those of LocalGainOfThetaChains §4.17, the same
for every `u₀`; they satisfy (ii) and (iii) of 10.2, and (i) of 10.2 by LocalGainOfThetaChains §4.17a (ii).

(f) *Nonvanishing.* 10.8 holds for `𝒞𝒟(u₀)`, each clause under its hypotheses.

Consequently the standing hypotheses (H1)–(H6) of 10.0 hold for `𝒞𝒟(u₀)` ((H1) with the conclusion of LocalGainOfThetaChains §4.17a (ii); (H3) for the twisting
datum of (c)); so, for `x` beyond the thresholds of 10.4 and 10.6d, 10.4–10.5 give, for every `u₀ ∈ A₀`,
`Σ_{τ∈Φ_top}Σ_{j=1}^m (ℛ − 𝔐)(a_τ, τ, w_{u₀,j}) ≤ x^{3ε}·(|Φ_top|·a·(1 + m²/k) + m·(B₀ + N_c))`;
this is hypothesis (i) of FrobeniusRestrictedRieszSums §1.9, at every translate `u₀ ∈ A₀`, with `C = 3` (10.5).

*Route.* The objects of the chain are constructed where they are defined (ThetaChainsOnDefiniteUnitaryGroups §2.2 explicit spaces; ThetaChainsOnDefiniteUnitaryGroups §§2.4–2.6 characters and
coefficient field; ThetaChainsOnDefiniteUnitaryGroups §2.7 type and auxiliary primes; ThetaChainsOnDefiniteUnitaryGroups §2.8 one level prime for each word; the forms, lifts, descents and
lattices of the roadmaps of the chain), and their properties are the targets that define them; what remains is that the hypotheses of
those targets are met. (a) is the order of 10.6. (b): ThetaChainsOnDefiniteUnitaryGroups §2.7 gives `g_i ∈ (Y_g, 2Y_g]`, `Y_g = (kb)^8`, which dominates every
polynomial in the ranks, `g_i ≡ 1 (mod f_E)` and the disjoint choice (10.6a); ThetaChainsOnDefiniteUnitaryGroups §2.8 gives `T(u)` in a window above `T*(u)` with
`log T*(u) ≥ 16·m·x^ε` (9.4 (d)) and the congruence modulo `(g₀g₁)²`; the tame parameters are those of ThetaChainsOnDefiniteUnitaryGroups §2.4 (b), and ThetaChainsOnDefiniteUnitaryGroups §2.9a (c)
gives their properties because `g_i` is large against `m` and `r`; the nodes are those of 10.6; the size conditions are
10.6a–10.6d. (c): the base tuple and its lattices are fixed by the data of (5), (6a). Each index in the definition of `Tw₀`
compares two lattices of full rank in one finite-dimensional `𝕃`-space (the lattices of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a and of CongruenceModulesOfThetaLifts §7.15 for the base
tuple), and two such lattices agree at all but finitely many places; the bulk `F_j` is nonzero exactly at the places above
`g₀`, `g₁`, `d` and the primes `≤ X″` inert in `K` (LocalGainOfThetaChains §4.9f (d): `F_j = −D^H_j/2 < 0` above `g₀`, `g₁`;
`F_j = −((k − 1)/2)·Σ min(w_j(τ), w_j(cσ_dτ)) < 0` above `d`, the step weights being positive; above an inert prime, which is
`≥ 13` and unramified in `E`, `F_j > 0`, each programme being at least `ρ_LT(p) = 1/(p² − 1)` times the sum of its capacities
`(k − 1)w_j(τ) > 0`, TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.6 (b), (f)). So `Tw₀` is finite, `c_𝕃`-stable (it is
defined symmetrically), contains the places of (T2), and outside `Tw₀` the base tuple has signed index `0` and `F_j = 0`,
which is (T3), by definition. The admissible twisting characteristics are those of (T1)
together with the residue characteristics of `Tw₀`, and the prescribed set `Z₀` of ThetaChainsOnDefiniteUnitaryGroups §2.5 (b) is the set of places above the level
primes and above `p_□` (both chosen in (6a), neither above `p_δ`, `p′_δ`, as ThetaChainsOnDefiniteUnitaryGroups §2.5 asks of `Z₀`); choose `ψ_𝔭` for the twisted places by CongruenceModulesOfThetaLifts §7.8 (2) after the data of (6a),
equal at places with the same restriction to the field of definition of the base data,
over a field of places `𝕃` that contains the roots of unity `u_q` of CongruenceModulesOfThetaLifts §7.8 (2) and the Hecke eigenvalues that
RowTowerAndRallisIdentities §5.12 asks to separate (ThetaChainsOnDefiniteUnitaryGroups §2.6: `𝕃` contains the finitely many algebraic numbers that later
targets name; it may be enlarged after the twisting datum is fixed, ThetaChainsOnDefiniteUnitaryGroups §2.5, Lemma (iv)). (d) is 10.7 (b) with CongruenceModulesOfThetaLifts §7.10a, CongruenceModulesOfThetaLifts §7.10c and CongruenceModulesOfThetaLifts §7.11, and CongruenceModulesOfThetaLifts §7.16a (3) (b) with GluedTargetAndDivisionInequality §8.20b. (e) is 10.7 (a) (iii), (v) and LocalGainOfThetaChains §§4.17a (ii), 4.17c, 4.17d with
10.6c: one vector serves every translate because the shares of the inert primes depend on the vector and not on `u₀`.
(f) is 10.8. The grid is the grid of the chain of RowTowerAndRallisIdentities §5.8a: its string length, the spacing of its
centres, its auxiliary prime and its depth are fixed there as functions of the data of steps (5), (6a), so nothing is chosen
here beyond the place `v_□` above `p_□` and the places `w(v)`; it exists by RowTowerAndRallisIdentities §5.8a (e), because
`g₀, g₁, p_δ, p′_δ ≡ 1 (mod N_E)`, `p_□ < g₀` and `p_□ ≠ g₁` (under `Size_□`), and `Z₀` contains the places above `p_□`. The
separation of RowTowerAndRallisIdentities §5.8e holds for `x ≥ x₀` under `Size_□`, which is among the size conditions of
10.6a–10.6d, and its lemmas give the depth condition and the size condition into which `N(𝔪_□)` enters.

*NEW*. (a): [FormalProof], `Formalism/SharpRestriction/GlobalSchurBounds/QuadraticLogDerivCongr.lean` (`Formalism.MainNotions.Lnk.Loss_at`); (b), the level primes and the nodes: [FormalProof], `Formalism/SharpRestriction/GrowthBounds/ProjectionLemmaBaseLevel.lean` (`Formalism.MainNotions.flipOneThree.AdmT`). *Needs:* ThetaChainsOnDefiniteUnitaryGroups §§2.2–2.9, ThetaChainsOnDefiniteUnitaryGroups §2.3a, ThetaChainsOnDefiniteUnitaryGroups §§3.1–3.10, ThetaChainsOnDefiniteUnitaryGroups §3.1a, TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.6, LocalGainOfThetaChains §4.9f, LocalGainOfThetaChains §4.16, LocalGainOfThetaChains §4.17, LocalGainOfThetaChains §4.17a, LocalGainOfThetaChains §4.17c, LocalGainOfThetaChains §4.17d, RowTowerAndRallisIdentities §5.3, RowTowerAndRallisIdentities §5.8, RowTowerAndRallisIdentities §5.8a, RowTowerAndRallisIdentities §5.8b, RowTowerAndRallisIdentities §5.8e, RowTowerAndRallisIdentities §5.12, SeesawForThetaChains §6.14, SeesawForThetaChains §6.15, CongruenceModulesOfThetaLifts §7.8, CongruenceModulesOfThetaLifts §7.10a, CongruenceModulesOfThetaLifts §7.10c, CongruenceModulesOfThetaLifts §7.11, GluedTargetAndDivisionInequality §7.13, GluedTargetAndDivisionInequality §7.14, CongruenceModulesOfThetaLifts §7.15,
CongruenceModulesOfThetaLifts §7.16a, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18c, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a, GluedTargetAndDivisionInequality §8.19e, GluedTargetAndDivisionInequality §8.20, GluedTargetAndDivisionInequality §8.20b, GluedTargetAndDivisionInequality §8.21, GluedTargetAndDivisionInequality §8.24, SelmerLengthBoundsAndLocalLifting §3.25b (2), 9.4, 9.6, 10.0, 10.2, 10.4, 10.5, 10.6, 10.6a, 10.6b, 10.6c, 10.6d, 10.7, 10.8.

### 10.10 The windowed bound for the cyclic family, uniform form

*Statement* (`cyclicWindowedBound`). Let `ψ` be a primitive Dirichlet character of order `o`,
`𝒦(ψ)` its cyclic family (FrobeniusRestrictedRieszSums §0.5; `PrimitiveDirichletCharacter.cyclicFamily`), and
`w_ψ(1) := 1`, `w_ψ(χ) := 1/(3o + 1)` for `1 ≠ χ ∈ 𝒦(ψ)` (the weights of `PrimitiveDirichletCharacter.familyWeight` at
`ω₀ = 3/4`). Then there is `ε₁ > 0` such that for every `ε ∈ (0, ε₁)`

`HasWindows {y : Σ_{χ∈𝒦(ψ)} w_ψ(χ)·Re G_χ(y) ≤ y^{1/2+9ε}} (3/2)`,

with `G_χ` the Riesz remainder of the primitive character `χ` (RiemannHypothesisStatementsAndConsequences §8.4a (b):
`PrimitiveDirichletCharacter.rieszRemainder`) and `HasWindows` that of PositivityOfDirichletSeriesWithKernels §6.9 (a);
hence the same with every window exponent `λ_W ∈ (1, 3/2]` (a window `[Y, Y^{3/2}]` with `Y ≥ 1` contains `[Y, Y^{λ_W}]`).
The exponent `e_W = 9` is fixed before `ε`.

*Route.* Fix constants as in 10.6 with `ω₀ = 3/4` (among them `ε₀`), put `ε₁ = ε₀`, let `ε ∈ (0, ε₁)`, and
make a choice of step (3) of 10.6. By 10.7 (b) the scales `x` at which a host with all the data of 10.7 (a) and the
wild-kernel budget exists have windows of exponent `3/2`. At every such scale beyond the thresholds of 10.4 and
10.6a–10.6d, take the data of steps (5) and (6) of 10.6 and the twisting datum of 10.9 (c): by 10.9 the chain data `𝒞𝒟(u₀)`
satisfy (H1)–(H6), and 10.9 gives the inequality with error
`x^{3ε}·(|Φ_top|a(1 + m²/k) + m(B₀ + N_c))` at every translate `u₀ ∈ A₀`, which is hypothesis (i)
of FrobeniusRestrictedRieszSums §1.9 with `C = 3` (10.5); hypothesis (ii) of FrobeniusRestrictedRieszSums §1.9 and the thin-scale saving of FrobeniusRestrictedRieszSums §1.7 are 10.7 (a)(i)–(ii);
the sizes (FrobeniusRestrictedRieszSums §1.8 (i)–(iv), the precision `η_top ≤ x^{−1+ε}`, the cost conditions of FrobeniusRestrictedRieszSums §1.7) are 10.6a. FrobeniusRestrictedRieszSums §1.9 with the tops of FrobeniusRestrictedRieszSums §0.7 for the coset law
`ν(A₀) = 4/(3o + 1)`, `ν(αA₀) = 3/(3o + 1)` for the other cosets (the law at `ω₀ = 3/4`; so `ν̂(1) = 1` and
`ν̂(χ) = 1/(3o + 1)` for `χ ≠ 1`) gives `Σ_{χ∈𝒦(ψ)} w_ψ(χ) Re G_χ(x) ≤ x^{1/2+(3+4)ε} ≤ x^{1/2+9ε}` for every
`x ≥ x₁(ψ, 3, 4, ε)` in the window set. The set of such `x` contains the windows beyond `x₁`, hence has windows of exponent `3/2`
(PositivityOfDirichletSeriesWithKernels §6.9 (a): windows beyond a threshold). `e_W = 9` is at least `3 + 4`, the exponent
`C = 3` of the per-translate inequality (10.5) plus the loss `4` of FrobeniusRestrictedRieszSums §§1.8–1.9.

*Checks.* `ω₀ = 3/4`: `w_ψ(χ) = 1/(3o + 1)` for the members `χ ≠ 1`, and `w_ψ(1) = 1`. `ψ = 1`: `𝒦(1) = {1}`, `o = 1`,
`w_1(1) = 1`, and the statement concerns `G_1` alone (the quotient `A/A₀` has one coset, and `ω₀` plays no role).
The constant `e_W` is fixed before `ε`:
if it were allowed to depend on `ε` (say `e_W = 1/ε`), the statement would bound the remainders by `y^{3/2}` and carry no
information. The weights at `ω₀ = 1` (the uniform selection) vanish off `χ = 1`, and for `o > 1` the value `ω₀ = 0` is not
admissible: the selection must charge every coset (FrobeniusRestrictedRieszSums §0.7).

*NEW*. *Needs:* FrobeniusRestrictedRieszSums §0.5, FrobeniusRestrictedRieszSums §0.7, FrobeniusRestrictedRieszSums §1.9, 10.0, 10.4, 10.5, 10.6, 10.6a, 10.7, 10.9; RiemannHypothesisStatementsAndConsequences §8.4a (b);
PositivityOfDirichletSeriesWithKernels §6.9 (a).

### 10.11 The windowed bound for the cyclic family, consumer form

*Statement* (`cyclicWindowedBound_forEveryEpsilon`). For every primitive Dirichlet character `ψ`
and every `ε > 0` there are positive reals `w(χ)`, indexed by
the members `χ` of the cyclic family `𝒦(ψ)` (FrobeniusRestrictedRieszSums §0.5), and `λ_W > 1` such that
`HasWindows {y : Σ_{χ∈𝒦(ψ)} w(χ)·Re G_χ(y) ≤ y^{1/2+ε}} λ_W`.

*Route.* 10.10 with `λ_W = 3/2` and `ε′ = min(ε₁/2, ε/(e_W + 1))`: then `e_Wε′ < ε` and `y^{1/2+e_Wε′} ≤ y^{1/2+ε}` for `y ≥ 1`, so the
set of 10.10 at `ε′`, intersected with `[1, ∞)`, is contained in the set here, and windows lie in `[1, ∞)`; the passage is the
third clause of PositivityOfDirichletSeriesWithKernels §6.9 (a) (a set containing `S ∩ [x₀, ∞)` for a set `S` with windows has
windows) together with monotonicity in the set. The weights `w = w_ψ` do not depend on `ε`.

*Check.* The weights are positive at `ψ` itself (`w_ψ(ψ) = 1/(3o + 1)` for `ψ ≠ 1`); a family whose weight vanished at `ψ` would
say nothing about `L(s, ψ)`.

*NEW* (one line). Follows from [FormalProof], `Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/Window.lean` (`Formalism.HC.HasWindows.mono`). *Needs:* FrobeniusRestrictedRieszSums §0.5, 10.10; PositivityOfDirichletSeriesWithKernels §6.9 (a).

### Examples

For constant step weights `w`, `y = a/w` and one pair `(j, τ)`, the restricted sum of 10.1 is
`Σ_{p inert} 2 log p·Σ_{i odd}(a/p^i − w)₊ + log d·Σ_{i≥1}(a/d^i − w)₊ = w·Σ_{n≤y}(1 − χ_K(n))Λ(n)(y/n − 1)`, because `1 − χ_K(p^i)` is `2` for `p`
inert and `i` odd, `0` for `p` split or `i` even, and `1` at `d` (10.1, Check). One admissible choice of the constants of
10.6 is `ε₀ = 1/52`, `ω₀ = 3/4`, `c_io = 1`, `A_w = 26`, `c_TO = 377`, `C_t = 401`, `c_T = 16`, `C_b = 1`,
`C_Δ = 40`, `C_T = 25`, `C_R = 7`, `c_box = 1/400`, `C_deg = 378`, `o_δ = 15`; then `m ≍ x^{1/2−ε/16}`, `k ≍ x^{9/2+10ε}` and
`log T(u) = (17 + o(1))·m·x^ε` (10.6, Check). For `ψ = 1` the pair `(19, 526679)` satisfies the arithmetic conditions of
10.7 (a) and (v), while the host of the admissible pair `(3, 71)` at the layer `n = 1` fails `HostSplitting E` (10.7, Check).
At `ω₀ = 3/4` the weights of 10.10 are `w_ψ(1) = 1` and `w_ψ(χ) = 1/(3o + 1)` for the other members; for `ψ = 1`,
`𝒦(1) = {1}` and 10.10 concerns `G_1` alone (10.10, Checks).

### Dependencies

Layer 9; FrobeniusRestrictedRieszSums §§0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.8a, 0.9, 1.1, 1.4, 1.7, 1.8, 1.9;
ThetaChainsOnDefiniteUnitaryGroups §§2.1, 2.2, 2.3, 2.3a, 2.3b, 2.3c, 2.4, 2.5, 2.6, 2.7, 2.8, 2.9, 2.9a, 3.1, 3.1a, 3.8,
3.10; TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.6; LocalGainOfThetaChains §§4.9, 4.9e, 4.9f, 4.10, 4.10a, 4.14b, 4.15, 4.15d, 4.15e,
4.15f, 4.16, 4.16a, 4.17, 4.17a, 4.17b, 4.17c, 4.17d; RowTowerAndRallisIdentities §§5.3, 5.5, 5.6, 5.8, 5.8a, 5.8b, 5.8d,
5.8e, 5.9, 5.11, 5.12; BesselPoincareSeriesAndGramBounds §§5.13, 5.16, 5.18, 5.18a, 5.20, 5.20a, 5.20b, 5.21, 5.23;
SeesawForThetaChains §§6.14, 6.15; CongruenceModulesOfThetaLifts §§7.5a, 7.6, 7.8, 7.10a, 7.10c, 7.11, 7.15, 7.16a;
ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §§8.5, 8.11, 8.14b, 8.17, 8.18, 8.18c, 8.18e, 8.18f, 8.19, 8.19a;
GluedTargetAndDivisionInequality §§7.13, 7.14, 8.10, 8.19e, 8.20, 8.20b, 8.21, 8.22, 8.23, 8.24;
SelmerLengthBoundsAndLocalLifting §3.25b (2); UniformWildKernelBounds §7.6; QuadraticTwistSelectionOverPrimes §§2.7c, 2.7d; RieszSumsOverPrimesAndExceptionalZeros §§1.4h, 1.4i, 1.7b, 2.9b;
RiemannHypothesisStatementsAndConsequences §8.4a; PositivityOfDirichletSeriesWithKernels §6.9;
BernoulliBoundsForClassGroupEigenspaces §6.17; FiniteReductiveGroups §§2.2, 5.7; AnalyticNumberTheoryPartI §0.11;
ExplicitPrimeCounting §§0.2, 4.2; ClassFieldTheory §13.1; NumberFieldArithmetic §5.10; Mathlib's Chebyshev bound.

## Downstream consumers

GeneralizedRiemannHypothesisFromWindowBounds applies 10.11 at every primitive Dirichlet character: statement (i) of
GeneralizedRiemannHypothesisFromWindowBounds §4.2 is 10.11, and GeneralizedRiemannHypothesisFromWindowBounds §§5.1, 5.2
(the generalized Riemann hypothesis for every Dirichlet character, and the Riemann hypothesis) use 10.11 at the cyclic
family of the primitive character of a given character and at `ψ = 1`. Of this roadmap it uses 10.11 only.

## Scope and ownership

This sub-roadmap of [RiemannHypothesisForDirichletLFunctions](../README.md) is independently definitive.

This roadmap owns Layers 9 and 10 of the chain of theta lifts: the slope bounds for the source lattices and for the
divided sources (9.1, 9.2), the formal degrees of the row discrete series and rank matching with the size of the level
prime (9.3, 9.4), the word code (9.5), the slope inequality of the chain (9.6), chain data and their standing hypotheses
(10.0), the Frobenius-restricted sums of the gains and the loss bound (10.1, 10.2), the key identity, the
Frobenius-restricted inequality and its error budget (10.3–10.5), the explicit parameters and their size conditions
(10.6–10.6d), hosts on windows (10.7), nonvanishing at the parameters (10.8), chain data at every scale of the windows
(10.9) and the windowed bound for the cyclic family of every primitive Dirichlet character (10.10, 10.11).

Not owned here. The abelian CM hosts with their Frobenius data, the cyclic family, tops, thick sets and admissible pairs,
the Frobenius-restricted Riesz sums with their main terms, and the passage from the inequality at every translate on a
host to the window bound for the cyclic family are FrobeniusRestrictedRieszSums Layers 0–1. The data of the chain, its forms and
its source lattices are ThetaChainsOnDefiniteUnitaryGroups Layers 2–3; depths on height-two formal groups are
TaylorBoundsAndDepthsOnHeightTwoFormalGroups, and the ledger of the gains, the gain sublattice and the served data are
LocalGainOfThetaChains (Layer 4); the row tower and the descent are RowTowerAndRallisIdentities, and the Bessel–Poincaré
series with their Gram bounds are BesselPoincareSeriesAndGramBounds (Layer 5); the period pairing and the seesaw are
SeesawForThetaChains (Layer 6); good twisting data and congruence modules are CongruenceModulesOfThetaLifts (Layer 7); CM
periods, the setting of the unitary Shimura varieties of the steps, deep covers and lattices of integral forms are
ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, and the divided source, the glued target, the heights of the
pairings and the division inequality are GluedTargetAndDivisionInequality (Layers 7–8). Slopes of Hermitian lattices and
the slope inequality for nearly tight frames are SlopesOfHermitianVectorBundles §§1.2–5.7; the slopes of Weyl lattices
and the frame map are IntegralWeylModulesOfGeneralLinearGroups §§3.2, 3.4; short frames and the mass formulas are
HermitianFormsAndLattices §§4.12, 6.0b–6.4; the formal degree of a discrete series is
DiscreteSeriesCoefficientsAndAutomorphicMetrics §8.3; generic characters of `GL_r(𝔽_g)` are FiniteReductiveGroups §§2.2,
5.7. The uniform bound for wild kernels on windows is UniformWildKernelBounds §7.6, and the twisted Tate–Shafarevich
groups are BernoulliBoundsForClassGroupEigenspaces §6.17; twist selection is QuadraticTwistSelectionOverPrimes §§2.7c–2.7d;
the bounds for Riesz remainders and the primes in progressions used for the hosts are
RieszSumsOverPrimesAndExceptionalZeros §§1.4h, 1.4i, 1.7b, 2.9b; the Riesz remainders are
RiemannHypothesisStatementsAndConsequences §8.4a, and windows of scales are PositivityOfDirichletSeriesWithKernels §6.9.
Mertens' theorem is AnalyticNumberTheoryPartI §0.11, Banaszczyk's transference theorem
GeometryOfNumbersAndQuadraticArithmetic §4.4.13, gauge forms AdelicAlgebraicGroups §2.4, discrete series and their
parameters AutomorphicFormsOnReductiveGroups §2.4, the Weyl dimension formula ClassicalGroups §5.1, the
conductor–discriminant formula ClassFieldTheory §13.1 (with the discriminant valuation NumberFieldArithmetic §5.10), and the
sums `Σ_{n≤y}Λ(n)/n` and their progression constants ExplicitPrimeCounting §§0.2, 4.2.

## Exact supplier contracts

### From Mathlib

- `Chebyshev.theta_le_log4_mul_x`: Chebyshev's bound `θ(x) ≤ x·log 4` for `x ≥ 0`. Used in 9.2, 10.2.
- `DirichletCharacter`, `DirichletCharacter.IsPrimitive`, `DirichletCharacter.conductor`,
  `DirichletCharacter.primitiveCharacter` with `DirichletCharacter.primitiveCharacter_isPrimitive`,
  `DirichletCharacter.LFunction`, `ArithmeticFunction.vonMangoldt` and `Real.eulerMascheroniConstant`: the statements of
  10.10 and 10.11 in `Suggested.lean`.

### From TauCetiRoadmap.AnalyticNumberTheoryPartI

- §0.11: Mertens' first theorem. Used in 9.6, 10.2, 10.6d.

### From TauCetiRoadmap.ExplicitPrimeCounting

- §4.2: `Σ_{n≤x}Λ(n)/n = log x − γ + O*(1.833/log² x)` for `x > 1`. §0.2: the constants `C(q, a)` of the progression sums
  `Σ_{n≤x, n≡a (q)}Λ(n)/n` and their closed form through the values `(L′/L)(1, χ)`. Used in 10.3 (Check).

### From TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic

- §4.4.13 (`euclidean_dual_transference_upper`): Banaszczyk's transference theorem `λ_i(L)λ_{n+1−i}(L^*) ≤ n` for a full
  lattice `L` of rank `n` in a Euclidean space and its dual `L^*` (applied to a `ℤ`-lattice in a positive definite rational
  quadratic space through its real model). Used in 9.1 (through HermitianFormsAndLattices §4.12).

### From TauCetiRoadmap.AdelicAlgebraicGroups

- §2.4: gauge forms and Tamagawa normalisation. Used in 9.4.

### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups

- §2.4: discrete series and their parameters. Used in 9.3.

### From TauCetiRoadmap.ClassicalGroups

- §5.1: the Weyl dimension formula. Used in 9.3.

### From TauCetiRoadmap.ClassFieldTheory

- §13.1: the global conductor–discriminant formula (`count_relDiscr_eq_finsum_abelianConductor_exponent`,
  `abelianConductor_eq_lcm`). Used in 10.6a, 10.6d.

### From TauCetiRoadmap.NumberFieldArithmetic

- §5.10: the discriminant valuation as the residue-degree-weighted different exponent. Used in 10.6a.

### From PositivityOfDirichletSeriesWithKernels, a sub-roadmap of this family

- §6.9 (a): `HasWindows S λ` (multiplicative windows `[Y, Y^λ]`); monotone in `S`; antitone in `λ`; `HasWindows [x₀, ∞) λ`;
  if `HasWindows S λ` and `S ∩ [x₀, ∞) ⊆ S′`, then `HasWindows S′ λ`. Used in 10.7, 10.10, 10.11.

### From RiemannHypothesisStatementsAndConsequences, a sub-roadmap of this family

- §8.4a (a)–(b): Riesz sums and the Riesz remainder `G_χ` of a primitive character, with the normalisation of the
  Conventions. Used in 10.10, 10.11.

### From RieszSumsOverPrimesAndExceptionalZeros, a sub-roadmap of this family

- §1.4h: Lipschitz and size bounds of the Riesz remainder: for an absolute `C_Λ` and every primitive `χ ≠ 1`:
  (a) `|w·G_χ(a/w) − w′·G_χ(a/w′)| ≤ 3(a/min(w, w′))|w − w′|` (and for `G_1`); (b) `|G_χ(y) − G_χ(z)| ≤ |y − z|(log max(y, z) + C_Λ +   |(L′/L)(1, χ)|)`, `|G_1(y) − G_1(z)| ≤ C_Λ|y − z|` for `y, z ≥ 1`; (c) `|G_χ(y)| ≤ y(log y + C_Λ + |(L′/L)(1, χ)|)`, `|G_1(y)| ≤ C_Λy`
  for `y ≥ 1`. Used in 10.6.
- §1.4i: (a) `|G_χ(y) − y^β/(β(1 − β))| ≤ C·y·(log 3f_χ)^5·exp(−c·log y/(√(log y) + log f_χ))` for `y ≥ 2`, the term present only
  for a real `χ` with an exceptional zero `β`, and `|G_1(y)| ≤ Cy·exp(−c√(log y))`; (b) for a finite abelian `E/ℚ` and
  `c_ex ∈ (0, 1/2]` with `1 − β ≥ c_ex` for every exceptional zero of a real `χ*`, `χ ∈ Ĝ`: for every `α ∈ [1/2, 1)` there is
  `y₀(α, c_ex)` with `|G_{χ*}(y)| ≤ y·exp(−c₁(log y)^{1−α})` for all `χ ∈ Ĝ` and `y ≥ y₀` with `log f_E ≤ (log y)^α`. Used in
  10.6.
- §1.7b (iii): `r` primes `≡ 1 (mod M)` below `M^{L_r}`. Used in 10.7.
- §2.9b (iv)(c′): for a prime `d ≡ 3 (mod 4)` with `d ≥ 100`, `K = ℚ(√−d)`, an integer `M ≥ 3`
  and `B = d·M²`, with absolute `A, c, c′ > 0`: (polynomial gap) every real zero `β ∈ [3/4, 1)` of `L(s, ψ*)`, `ψ` a real
  character of `Cl_{M𝒪_K}`, has `1 − β ≥ c·B^{−A}`; (short intervals) for `X ≥ 1` with `log B ≤ c·√(log X)` and
  `e^{−c√(log X)} ≤ h ≤ 1`, at least `c′·hX/(B^A·log X)` primes `p ∈ (X, (1 + h)X]` are norms `N_{K/ℚ}(α)` of `α ∈ 𝒪_K` with `α ≡ 1 (mod M𝒪_K)`. (The ranges of `X`, `B` and `h` are part of
  the statement: for `h < 1/X` the interval may contain no integer.) Used in 10.7.

### From QuadraticTwistSelectionOverPrimes, a sub-roadmap of this family

- §2.7c: twist selection in one step: for a box width `δ₀ ∈ (0, 1/12)`, `K, τ, η, R`, exponents `0 < b < 1/4`, `0 ≤ a < 1/2` and
  `ε > 0` there are `C₁, Y₀` (depending on `δ₀, K, τ, η, R, a, b`) and `C₂` (on `δ₀, ε`) such that for `Y ≥ Y₀`, a progression
  `(m₀, a₀)`, `U`, `F` and a set `Ξ` of at most `R` primitive characters of conductor `≤ F`, under
  `C₁ log Y·(log m₀ + log Y) ≤ log U`, `1 ≤ F ≤ U^{1/2}`, `log(FU) ≤ Y^b` and `#{p | m₀ : p ≤ Y^{K/δ₀}} ≤ Y^a`, the set
  `P(m₀, a₀; U)` of primes `q ≡ a₀ (mod m₀)` in `(√U, U]` is nonempty and all but `η|P|` of its `q` have, for every `ξ ∈ Ξ` and
  `χ` primitive inducing `ξ·(·/q)`: no zero of `L(s, χ)` with `Re s > 1 − δ₀`, `|Im s| ≤ FU`; `|(L′/L)(1, χ)| ≤   ((2 + ε)/δ₀)·log log(FU) + C₂`; `|G_χ(y)| ≤ y^{1/2+τ}` on `[Y, Y^K]`. Used in 10.6 (the width `c_box`), 10.7 ((b) for the
  bound `4 log Y`). (a′)–(c′): the instance at box width `1/400`, with (b′) `|(L′/L)(1, χ)| ≤ 1000 log log(FU) + C₂`
  (hence `≤ 4 log Y` for `ε < 1/50` under its selection hypotheses). Used in 10.6, 10.7.
- §2.7d: twisting by two primes chosen in succession: (i) with the conductor bounds `N₀` and `N₀q`, box heights `N₀U₁` (`j = 0`)
  and `N₀qU₂` (`j = 1`); (ii) with conductor bounds `F₁ ≥ N₀`, `F₂(q) ≥ N₀q` admissible for §2.7c, box heights `F₁U₁` (`j = 0`)
  and `F₂(q)U₂` (`j = 1`), so `N₀U₁U₂` at `F₂ = N₀U₁`; and its Check: congruences on `q` and `d` (`q | d + 1`, `d ≡ −1` modulo the
  small odd primes, a class modulo `16`) enter only through the progressions and satisfy the hypotheses of §2.7c. Used in
  10.7 ((ii) with `F₁ = N₀`, `F₂(q) = N₀e^B`). (ii′): the same with the bounds (a′)–(c′) of §2.7c,
  at its instance (`q ≡ 3 (mod 8)`, `d ≡ 7 (mod 16)`, `q·∏_{3≤p≤B}p | d + 1` with `B = Y^{ε/5}`, box heights `N₀U₁` and
  `N₀U₁U₂`). Used in 10.6, 10.7.

### From SelmerLengthBoundsAndLocalLifting, a sub-roadmap of this family

- §3.25b (2): one specialisation at roots of unity of `p`-power order for finitely many polynomials of the first kind and of
  the second kind at a level `M` (over the ring of integers of a finite extension of `ℚ_p`), at which all their values are
  nonzero of valuation at most `v₀ + ε`; the form that CongruenceModulesOfThetaLifts §7.8 (2) takes. Used in 10.9 (c).

### From DiscreteSeriesCoefficientsAndAutomorphicMetrics, a sub-roadmap of this family

- §8.3: the formal degree of a discrete series, `d(π_λ) = ∏_{α>0}|⟨λ, α^∨⟩|/∏_{α>0}⟨ρ, α^∨⟩` for the Haar measure for which the
  compact dual has total mass one. Used in 9.3.

### From HermitianFormsAndLattices, a sub-roadmap of this family

- §4.12 (b): short frames: for a CM field `E` of degree `2f`, `rd_E := |disc E|^{1/(2f)}`, and an integral `𝒪_E`-lattice `L` of
  rank `k` in a totally positive definite Hermitian space, `L^∨` contains `k` vectors `y_1, …, y_k`, linearly independent over
  `E`, with `Tr_{E/ℚ}⟨y_a, y_a⟩ ≤ 2f·k²·rd_E²`. Used in 9.1.
- §6.0b (`τ(U(V)) = 2`), §6.1 ((f) the archimedean fibre measure), §6.2 ((a) the mass formula; (b) the volume formula for
  every Hermitian space with the fibre measure), §6.3 ((c) the mass of `𝒪_E^n`), §6.4 ((b) ratios of masses of consecutive
  ranks). Used in 9.4.

### From FiniteReductiveGroups, a sub-roadmap of this family

- §2.2: regular characters and Gelfand–Graev representations; multiplicity one. §5.7: labels and series idempotents; a
  squarefree label carries one character, which is generic. Used in 10.8.

### From BernoulliBoundsForClassGroupEigenspaces, a sub-roadmap of this family

- §6.17: the groups `Ш¹(M, ℓ, e)` and the total `V(M, t)` for a number field `M`, and their finiteness. Used in the
  Conventions and in 10.7.

### From SlopesOfHermitianVectorBundles, a sub-roadmap of this family

- §1.2, §1.7: slopes, heights of maps (finite and archimedean parts), duals, tensor products, extension of scalars. Used in
  9.1, 9.2.
- §2.1, §2.2: maximal and minimal slopes, their shift by a fractional ideal, duality, direct sums, sub-bundles. Used in 9.1,
  9.2, 9.6.
- §2.4: Bost's slope inequality and the slope test, (b) with its finite-place bound. Used in 9.1, 9.2.
- §5.5, §5.6, §5.7: the slope inequality for nearly tight frames (with `H ≥ max(0, s − μ̂_min)` and `κ_e ≤ 4` for `e ≤ 1/4`,
  for `ℂ`-linear lifts and a `ℂ`-linear projection), pairwise Gram bounds, compression. Used in 9.6.

### From IntegralWeylModulesOfGeneralLinearGroups, a sub-roadmap of this family

- §3.2: the slopes of the Weyl and dual Weyl lattices of `GL_N` for the normalised Fischer form: for a partition `λ` with at
  most `N` parts and `c_λ := hook(λ)/∏_s λ_s!`, `1 ≤ c_λ ≤ (λ_1 + N)^{N(N−1)/2}`, `−(|λ|·log N + log c_λ) ≤ μ(Δ_ℤ(λ)) = −μ(∇_ℤ(λ)) ≤ 0`
  and `μ_max(Δ_ℤ(λ)) ≤ μ_max(∇_ℤ(λ)) ≤ |λ|·log N + log c_λ`, the last bound also for the lattice of monomials of column degrees
  `λ`. Used in 9.1.
- §3.4: the frame map of a twisted Schur functor: for number fields `𝕃 ⊃ E` with the embeddings `τ ∈ Φ` of `E` into `𝕃`, an
  `𝒪_E`-lattice `Λ` of rank `k` in a totally positive definite Hermitian space, dominant weights `λ(τ) = λ⁰(τ) + s_τ·(1, …, 1)`,
  the Hermitian `𝒪_𝕃`-lattice `N` of the elements of `⊗_τ 𝒫_{λ(τ)}` integral in local bases of `Λ` (with the twist `det^{s_τ}`;
  metric the form `⟨·,·⟩_λ` of §3.2 in orthonormal coordinates), and `y_1, …, y_k ∈ Λ` linearly independent over `E`:
  `μ_max(N) ≤ Σ_τ(|λ⁰(τ)|·(log k + mean_σ log Σ_a⟨y_a, y_a⟩_{σ∘τ}) + log c_{λ⁰(τ)}) − k·Σ_τ s_τ·μ(Λ ⊗_τ 𝒪_𝕃)`, the twist term an
  equality. Used in 9.1 (with `Λ = L_𝒸^∨`, `s_τ = λ_u(τ)_{k−1}`).

### From FrobeniusRestrictedRieszSums, a sub-roadmap of this family

- §0.1, §0.2, §0.3: abelian CM hosts, Frobenius classes and the reading of Dirichlet characters as characters of `G`, and
  the host predicates `SplitRamification d`, `InertFreeUpTo B`, `HostSplitting E`. Used in the Conventions and in 10.0,
  10.1, 10.2, 10.6, 10.7.
- §0.4: the dyadic host fields `E_n(ψ, {q, d})` of a primitive character, with the layer `n ≥ 2`, the auxiliary pair
  (`q ≡ 3 (mod 8)`, `d ≡ 7 (mod 16)`) and the groups `A₀ ⊂ A`. Used in 10.0, 10.2, 10.6, 10.6a, 10.7.
- §0.5: the cyclic family `𝒦(ψ)` and the kept and non-kept characters trivial on `A₀`. Used in 10.7, 10.10, 10.11.
- §0.6: letters, places and the partner bijection. Used in 10.2.
- §0.7: the selection of tops with a coset law and its precision, and the bound `|Φ_top| ≥ δ_top|A|/2` when `ω₀ ≥ 3/4` and
  `δ_top|A| ≥ 36o²/ω₀²`. Used in 10.0, 10.6, 10.6a, 10.7, 10.10.
- §0.8, §0.8a: sets with no short relation and thick sets. Used in 10.0, 10.6, 10.6a, 10.7.
- §0.9: `B`-admissible pairs and their hosts. Used in 10.7.
- §1.1: the Frobenius-restricted Riesz sum `ℛ(a, τ, w)` and its main term `𝔐(a, w)`. Used in 10.1, 10.3, 10.4.
- §1.4: the thin-scale box hypothesis and the prime number theorem with a saving on a host. Used in 10.7.
- §1.7, §1.8, §1.9: cyclic host data at a scale, with the coset law `4/(3o + 1)` on `A₀` and `3/(3o + 1)` on the other
  cosets of precision `x^{−1+ε}` and the cost conditions, the averaged sum `𝔄`, the sizes, and the passage from the
  Frobenius-restricted inequality at every translate, with exponent constant `C`, to the bound `x^{1/2+(C+4)ε}` for the
  family sum with the weights `1` and `1/(3o + 1)` at one scale. Used in 10.4, 10.5, 10.6, 10.6a, 10.7, 10.9, 10.10.

### From ThetaChainsOnDefiniteUnitaryGroups, a sub-roadmap of this family

- §2.1: the ranks, the scale with its numbers and the size predicates (`Size(x, ε)`, `SizeDep`, `SizeInert`, `SizeQD`). Used
  in 9.2, 9.4, 9.5, 9.6 and Layer 10.
- §2.2: the Hermitian spaces of the chain. Used in 9.4, 10.0, 10.9.
- §2.3, §2.3a, §2.3b, §2.3c: weight data and words, adapted and separated data, `SizeSc`, `SizeGap`, `SizeSep`. Used in 9.1,
  9.3, 9.4, 9.5 and Layer 10.
- §2.4: the Hecke characters, the splitting character and the auxiliary characters. Used in 10.0, 10.6, 10.6d, 10.7, 10.9.
- §2.5: twisting data and the conditions (T1), (T2). Used in 9.2, 10.0, 10.6, 10.9.
- §2.6: the coefficient field `𝕂` and the field of places `𝕃`, with their size conditions. Used in 9.6, 10.0, 10.6, 10.6d,
  10.9.
- §2.7: type and auxiliary primes, `SizeG`. Used in 9.2, 9.4, 10.0, 10.6, 10.6a, 10.6d, 10.7, 10.9.
- §2.8: level primes and the dimension data, `SizeT_u`. Used in 9.2, 9.3, 9.4, 9.5, 9.6, 10.0, 10.6, 10.6a, 10.6b, 10.9.
- §2.9, §2.9a: level structures and the type primes. Used in 9.1, 9.4, 10.0, 10.6a, 10.9.
- §3.1, §3.1a: chain forms, the polynomial model and integral coordinates. Used in 9.1, 9.6, 10.9.
- §3.6: integrality of the chain lift and the stabiliser orders `D_Γ`. Used in 9.2.
- §3.8: the source lattices `M_u^{all}`, `M_u` and their ranks. Used in 9.1, 9.2, 9.6, 10.0, 10.6b, 10.8.
- §3.9, §3.10: the top period and its integrality. Used in 9.6, 10.9.

### From TaylorBoundsAndDepthsOnHeightTwoFormalGroups, a sub-roadmap of this family

- §4.6 (b), (f): the lower bound of a programme at a prime inert in `K` by `ρ_LT(p)` times the sum of its capacities. Used in
  10.9.

### From LocalGainOfThetaChains, a sub-roadmap of this family

- §4.9, §4.9e, §4.9f: the types of the primes inert in `K` and the ledger of a step (gains, bulk, costs, served colength,
  colength beyond `τ_N`, the net exponent `𝔊_u`, the cost `𝔢_u` at the level prime). Used in 9.2, 9.6, 10.0, 10.1, 10.2,
  10.6d, 10.9.
- §4.10, §4.14b, §4.15, §4.15d, §4.15e, §4.15f, §4.16a: the size conditions of the gain and its parameters. Used in 10.0, 10.6,
  10.6c. §4.10a: the periods of the chain at the type primes, with its constant `C₁`. Used in 10.0, 10.6.
- §4.16, §4.16b, §4.16c: the gain sublattice `N_u`, its form at the level prime and the colength bound there. Used in 9.2,
  9.6, 10.0, 10.2, 10.9.
- §4.17, §4.17a, §4.17b, §4.17c, §4.17d: the served data, the inequality at the served primes, the sizes of `ℒ(p)` and
  `ℒ_f(p)`, the top weights and the count of the unserved tops. Used in 9.6, 10.0, 10.2, 10.5, 10.6, 10.6c, 10.6d, 10.9.

### From RowTowerAndRallisIdentities, a sub-roadmap of this family

- §5.3: the row discrete series, the rows at principal level and the target rows. Used in 9.3, 9.4, 10.6b, 10.8, 10.9.
- §5.5, §5.6: the row step and its descent. Used in 10.0, 10.8, 10.9.
- §5.8, §5.8a, §5.8b, §5.8d, §5.8e: the grid of the chain with its auxiliary prime, its depth and its chosen places, its
  hypotheses, the step quotients, the separation and its lemmas, and the rational structure `𝔼_{1,𝕃}` of `𝔼` and its
  hypotheses (the grid of the chain, the size predicate `Size_□`, the condition (L1)–(L7) on `𝕃`). Used in 9.6, 10.0, 10.6,
  10.6d, 10.8, 10.9.
- §5.9, §5.11, §5.12: the row parameter, the Rallis eigenvalues and the descent onto the target rows. Used in 9.6, 10.6b,
  10.8, 10.9.

### From BesselPoincareSeriesAndGramBounds, a sub-roadmap of this family

- §5.13, §5.16, §5.18, §5.18a: Bessel functions, limit multiplicity, the cut at a letter. Used in 9.5, 10.6b, 10.9.
- §5.14, §5.15: the Bessel–Poincaré series `P_u` and the Gram operators `K(u, u′)`. Used in 9.6.
- §5.20, §5.20a, §5.20b: the Gram bound for two distinct words, its standing conditions (St) and the counts. Used in 9.6,
  10.0, 10.6, 10.6b.
- §5.21, §5.23: the Gram bound for one word, the nonvanishing on the new forms, and the discarded rows. Used in 9.6, 10.0,
  10.6b, 10.8.

### From SeesawForThetaChains, a sub-roadmap of this family

- §6.13, §6.14, §6.15: the identification of the target rows, the period pairing `B_u` with its unfolding, and the seesaw
  identity with its hypotheses. Used in 9.6, 10.0, 10.9.

### From UniformWildKernelBounds, a sub-roadmap of this family

- §7.6: for primitive `χ`, `0 < ε ≤ 2` and `κ, α ≥ 1`: `J ≥ 1` and `X₀` (depending on `χ, ε, κ, α` only) such that for
  every `X ≥ X₀` and every pair of primes `q ≡ 3 mod 8`, `q′ ≡ 7 mod 16`, not dividing `f_χ`, `q, q′ > 2X^κ + 1 + P(χ)` and
  `log q + log q′ ≤ Y₀^{ε/4}` (`Y₀ = X^{1/J}`), there is `Y ∈ [Y₀, X^{1/2}]` such that for every `x ∈ [Y, Y²]` and every layer
  `n ≥ 2` with `2^n ≤ x^α`, with `E = E_n(χ, {q, q′})` the dyadic host field (FrobeniusRestrictedRieszSums §0.4): every
  `Ш¹(E, ℓ, e)` (`ℓ` prime, `0 < e < ⌊x^κ⌋`) is finite and `V(E, ⌊x^κ⌋) ≤ exp(x^ε)`; the local condition is the one of the
  Conventions (classes unramified outside `ℓ`, trivial above `ℓ`). Applied in 10.7 with `κ = C_t`, `α = A_n + 1 = 3 + 8ε`,
  `ε < ε₀ ≤ 2`, at the layer `n(x)` of FrobeniusRestrictedRieszSums §0.4 (iii) for each scale `x` of the window
  (`n(x) ≥ 2` and `2^{n(x)} ≤ x^{A_n+1}` for large `x`). Used in 10.6 (the window constant `J`), 10.7.

### From CongruenceModulesOfThetaLifts, a sub-roadmap of this family

- §7.5a, §7.6: the complementary residue and the thin windows with `SizeThin`. Used in 10.0, 10.6d.
- §7.8, §7.10a, §7.10c: good twists (under `r ≥ 100`, `g₀, g₁ ≥ 2r`), good twisting data, the rows of the congruence bound with
  the depth hypothesis on the thick set, and their sum under the length bound `L_th ≤ C_L·log x`. Used in
  10.0, 10.6, 10.6b, 10.6d, 10.9.
- §7.11: the total congruence bound under a wild-kernel budget `κ_W`. Used in 10.0, 10.5, 10.9.
- §7.15, §7.16a: the projected lattices and the exponents of weight elimination. Used in 10.5, 10.9.

### From ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, a sub-roadmap of this family

- §8.5: the class-mean Chowla–Selberg statement for the CM period. Used in 10.3 and the Conventions.
- §§8.11–8.19 (the setting of the unitary Shimura varieties of the steps), §8.14b, §8.17: the flag facts and the gap
  conditions. Used in 10.0, 10.9.
- §8.18, §8.18c, §8.18e, §8.18f: deep covers (§8.18 (o)), short generators, witnesses of `SizeSG` (§8.18c (f) (ii), given
  witnesses `h₀`, `S_u`, `η_u` of its gap conditions), the slopes of lattices of forms, and the degree condition
  `[F:ℚ] ≥ 3` of §8.18f (d). Used in 10.0, 10.5, 10.6d, 10.9.
- §8.19, §8.19a: lattices of integral forms (the slope of §8.19 (b) under `[F:ℚ] ≥ 3`), weights with (N0), (N1), (N2) and
  `SizeGen`. Used in 10.0, 10.6, 10.6a, 10.6b, 10.6d, 10.9.

### From GluedTargetAndDivisionInequality, a sub-roadmap of this family

- §7.13, §7.14: the divided source `N′_u`, the glued target `R` with its dual `R^∨`, and the integrality of the pairings
  `B_u(N′_u) ⊂ R^∨`. Used in 9.2, 9.6, 10.0, 10.9.
- §8.7, §8.9, §8.10: the top term `t_u`, the explicit height `h_u` of `B_u` and Stirling's term. Used in 9.6, 10.0, 10.3,
  10.4. §8.8: the Rallis eigenvalues and hook products, whose hypotheses §8.9 assumes. Used in 9.6.
- §8.19e, §8.20, §8.20b, §8.21: the theta conditions, the theta data of a step with (T3), the depth errors and the target
  bound with the bulk divisibility `F_tot`. Used in 9.2, 10.0, 10.4, 10.5, 10.6d, 10.9.
- §8.22, §8.23, §8.24: the division inequality, the cost of the type primes `E_tot(u)` and the bound for `μ_max(R)`. Used in
  9.6, 10.0, 10.4, 10.5, 10.6, 10.6a, 10.6d, 10.10.

## References

- [FormalProof] Levent Alpöge, the Lean formalization of the Riemann hypothesis and of the Riemann hypothesis for Dirichlet L-functions announced in [Announcement]; source with a public verification setup: <https://github.com/leanprover-community/riemann-hypothesis>.
- [Announcement] Levent Alpöge, the announcement of that proof, 20 November 2026: <https://alpo.ge/remark.pdf>.
- P. L. Chebyshev, *Mémoire sur les nombres premiers* (1852). F. Mertens, *Ein Beitrag zur analytischen Zahlentheorie*
  (1874): 10.2. Yu. V. Linnik, *On the least prime in an arithmetic progression* (1944): 10.7.
- Harish-Chandra, *Discrete series for semisimple Lie groups II*, Acta Math. 116 (1966): 9.3.
- J. A. Green, *The characters of the finite general linear groups*, Trans. Amer. Math. Soc. 80 (1955); I. M. Gelfand and
  M. Graev; A. Zelevinsky, *Representations of finite classical groups: a Hopf algebra approach*, LNM 869 (1981);
  D. Ginzburg, S. Rallis and D. Soudry, *The descent map from automorphic representations of GL(n) to classical groups*
  (2011): 10.8.
- M. Lerch, *Sur quelques formules relatives au nombre des classes*, Bull. Sci. Math. 21 (1897); S. Chowla and A. Selberg,
  *On Epstein's zeta-function*, J. reine angew. Math. 227 (1967): the CM period of the Conventions, 10.3.
- J.-B. Bost, *Périodes et isogénies des variétés abéliennes sur les corps de nombres*, Séminaire Bourbaki 795 (1996);
  É. Gaudron and G. Rémond (2014): 9.6.
- H. Weyl, *Theorie der Darstellung kontinuierlicher halb-einfacher Gruppen durch lineare Transformationen*, Math. Z. 23–24
  (1925–1926): 9.1, 9.3. R. W. Carter and G. Lusztig, *On the modular representations of the general linear and symmetric
  groups*, Math. Z. 136 (1974): 9.1. W. Banaszczyk, *New bounds in some transference theorems in the geometry of numbers*,
  Math. Ann. 296 (1993): 9.1. C. L. Siegel, *Über die analytische Theorie der quadratischen Formen*, Ann. of Math. 36 (1935);
  G. Shimura, *Euler products and Eisenstein series*, CBMS 93 (1997); W. T. Gan, J. Hanke and J.-K. Yu, *On an exact mass
  formula of Shimura*, Duke Math. J. 107 (2001); A. Weil, *Adeles and algebraic groups* (1961): 9.4.
